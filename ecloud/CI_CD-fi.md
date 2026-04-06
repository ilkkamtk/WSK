# CI/CD GitHubista eCloud-virtuaalikoneelle

Koska Metropolian eCloud-virtuaalikoneet ovat sisäverkossa, GitHub ei voi ottaa niihin suoraan yhteyttä.

Tässä ohjeessa CI/CD toteutetaan **webhookin ja smee.io-välityspalvelun avulla**.

Tämä tapa on vähän häkki, joten älä käytä tätä "oikeissa" tuotantoympäristössä. Tämä on tarkoitettu vain oppimistarkoituksiin.

Oletuksena on, että:

- sovellus on jo palvelimella
- sovellus käynnistyy **PM2:lla**
- käytät GitHub-repositoriota

---

## 1. Luo SSH-avain GitHubia varten

Ennen CI/CD:n käyttöönottoa varmista, että SSH-avain on luotu ja lisätty GitHubiin.

GitHubin viralliset ohjeet:

- SSH-avaimen luonti: [https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
- Avaimen lisääminen GitHubiin: [https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

Luo avain:

```bash
ssh-keygen -t ed25519 -C "oma.sahkoposti@metropolia.fi"
```

Kun kysytään passphrasea, voit jättää sen tyhjäksi.

Näytä julkinen avain:

```bash
cat ~/.ssh/id_ed25519.pub
```

Lisää avain GitHubiin:

```text
GitHub → Settings → SSH and GPG keys → New SSH key
```

---

## 2. Luo smee-kanava

Mene osoitteeseen:

```text
https://smee.io/
```

Paina **New Channel** ja tallenna osoite, esimerkiksi:

```text
https://smee.io/xxxyyyzzz
```

---

## 3. Luo webhook-projekti palvelimelle

```bash
cd ~
mkdir webhooks
cd webhooks
npm init -y
npm install smee-client
```

---

## 4. Luo smee-kuuntelija

```bash
nano index.js
```

Lisää:

```javascript
const SmeeClient = require('smee-client');

const projects = [
  {
    name: 'oma-sovellus',
    source: 'https://smee.io/xxxyyyzzz',
  },
];

const eventsArray = [];

const startSmeeForProject = ({ name, source }) => {
  const smee = new SmeeClient({
    source,
    target: 'http://127.0.0.1:9000/hooks/' + name,
    logger: console,
  });

  const events = smee.start();
  eventsArray.push(events);
};

projects.forEach(startSmeeForProject);
```

Vaihda:

- `oma-sovellus`
- smee-kanavan osoite

---

## 5. Lisää package.json skripti

```bash
nano package.json
```

Lisää (tai täydennä olemassa olevaa `scripts`-osiota):

```json
"scripts": {
  "start": "node index.js"
}
```

---

## 6. Käynnistä smee PM2:lla

```bash
pm2 start npm --name "smee" -- start
pm2 save
```

---

## 7. Luo deploy-skripti

```bash
nano app-update.sh
```

Lisää:

```bash
#!/bin/bash

cd /home/username/projektin-kansio

git pull origin main
npm install
npm run build
pm2 restart oma-sovellus
```

Muuta:

- `username`
- `projektin-kansio`

Anna ajo-oikeus:

```bash
chmod +x app-update.sh
```

---

## 8. Luo webhook-asetukset

```bash
nano webhooks.json
```

Lisää:

```json
[
  {
    "id": "oma-sovellus",
    "execute-command": "/home/username/webhooks/app-update.sh",
    "trigger-rule": {
      "and": [
        {
          "match": {
            "type": "payload-hmac-sha256",
            "secret": "VAIHDA_TAHAN_GITHUB_WEBHOOK_SECRET",
            "parameter": {
              "source": "header",
              "name": "X-Hub-Signature-256"
            }
          }
        }
      ]
    },
    "response-message": "Deployment started"
  }
]
```

Huom. `id` täytyy olla sama kuin `index.js`-tiedostossa.

Miksi oleellinen:

- `trigger-rule` varmistaa, että vain GitHubin allekirjoittamat pyynnöt hyväksytään.
- Ilman tätä kuka tahansa smee-kanavan URL:n saanut voi yrittää laukaista deployn.

---

## 9. Asenna webhook-ohjelma

Tarkista ensin uusin versio:

```text
https://github.com/adnanh/webhook/releases/latest
```

Päivitä versionumero tarvittaessa. Esimerkki:

```bash
wget https://github.com/adnanh/webhook/releases/download/2.8.2/webhook-linux-amd64.tar.gz
```

Pura paketti:

```bash
tar -xzvf webhook-linux-amd64.tar.gz
```

Siirrä ohjelma:

```bash
sudo mv webhook-linux-amd64/webhook /usr/local/bin/
```

Tarkista versio:

```bash
webhook -version
```

> Tarkista aina uusin versio ennen asennusta.

---

## 10. Käynnistä webhook-kuuntelu

```bash
webhook -hooks ~/webhooks/webhooks.json --verbose
```

Tämä näyttää lokit reaaliajassa.

Kun kaikki toimii, voit myöhemmin siirtää tämänkin PM2:n alle:

```bash
pm2 start webhook --name "webhook" -- -hooks /home/username/webhooks/webhooks.json --verbose
pm2 save
```

---

## 11. Lisää webhook GitHubiin

Mene GitHubissa:

```text
Repository → Settings → Webhooks → Add webhook
```

Täytä:

- **Payload URL** → smee-kanavan osoite
- **Content-Type** → `application/json`
- **Secret** → sama arvo kuin `webhooks.json`-tiedoston `trigger-rule.match.secret`

Miksi oleellinen:

- Secret on webhookin todennus. Sen avulla palvelin varmistaa, että pyyntö tuli oikeasti GitHubista.

Tallenna.

---

## 12. Testaa CI/CD

Tee muutos projektiin:

```bash
git add .
git commit -m "test deployment"
git push
```

Webhook suorittaa automaattisesti:

- `git pull`
- `npm install`
- `npm run build`
- `pm2 restart oma-sovellus`

---

## 13. Vianetsintä

```bash
pm2 list
pm2 logs
```

Webhook-lokit:

```bash
webhook -hooks ~/webhooks/webhooks.json --verbose
```

Smee-lokit:

```bash
pm2 logs smee
```
