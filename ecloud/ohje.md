# Virtuaalikoneen käyttöönotto ja Node-sovelluksen julkaisu

Tämä ohje auttaa sinua ottamaan käyttöön Metropolian eCloud-virtuaalikoneen ja julkaisemaan Node-sovelluksen siihen.

Ohje etenee vaihe vaiheelta. Suosittelen, että suoritat kohdat järjestyksessä.

---

## 1. Luo virtuaalikone

1. Mene osoitteeseen **[https://ecloud.metropolia.fi/](https://ecloud.metropolia.fi/)**
2. Kirjaudu Metropolian tunnuksilla
3. Valitse **Catalog Items → Rocky Linux**
4. Valitse malliksi **Rocky Linux 9 LAMP**
5. Valitse koko **S-Small**
6. Aseta **Lease time = 120**
7. Luo kone

> Huom. PHP ja MariaDB ovat jo valmiiksi imagessa, joten niitä ei tarvitse asentaa.

Odota noin **10–15 minuuttia**.

Saat sähköpostilla:

- IP-osoitteen
- käyttäjätunnuksen
- salasanan

---

## 2. Yhdistä virtuaalikoneeseen

Jos et ole kampuksen verkossa tai Eduroamissa, yhdistä ensin VPN:llä.

Avaa terminaali ja yhdistä:

```bash
ssh tunnus@IP-osoite
```

Esimerkki:

```bash
ssh opiskelija@10.x.x.x
```

---

## 3. Päivitä järjestelmä

Suorita:

```bash
sudo dnf upgrade --refresh -y
```

---

## 4. Asenna Node.js

Siirry kotihakemistoon:

```bash
cd ~
```

Asenna Node LTS:

```bash
curl -sL https://rpm.nodesource.com/setup_20.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo dnf install nodejs -y
```

Tarkista versiot:

```bash
node -v
npm -v
```

---

## 5. Hae projekti palvelimelle

Asenna git:

```bash
sudo dnf install git -y
```

Kloonaa repositorio:

```bash
git clone REPOSITORION_OSOITE
```

Siirry kansioon:

```bash
cd projektin-nimi
```

Asenna riippuvuudet:

```bash
npm install
```

---

## 6. Käynnistä sovellus

```bash
npm start
```

Tai tarvittaessa:

```bash
node src/app.js
```

---

## 7. Julkaise sovellus Apachella

Salli Apachelle yhteys Node-sovellukseen:

```bash
sudo setsebool -P httpd_can_network_connect 1
```

Luo asetustiedosto:

```bash
sudo nano /etc/httpd/conf.d/node.conf
```

Lisää:

```apache
<VirtualHost *:80>
    ProxyPreserveHost On
    ProxyPass /app http://127.0.0.1:3000
    ProxyPassReverse /app http://127.0.0.1:3000
</VirtualHost>
```

Käynnistä Apache uudelleen:

```bash
sudo systemctl restart httpd
```

Testaa:

```text
http://IP-osoite/app
```

---

## 8. HTTPS

Asenna SSL:

```bash
sudo dnf install mod_ssl openssl -y
```

Luo sertifikaatti:

```bash
openssl genrsa -out ca.key 2048
openssl req -new -key ca.key -out ca.csr
openssl x509 -req -days 365 -in ca.csr -signkey ca.key -out ca.crt
```

Siirrä tiedostot:

```bash
sudo cp ca.crt /etc/pki/tls/certs
sudo cp ca.key /etc/pki/tls/private
```

Luo HTTPS-asetus:

```bash
sudo nano /etc/httpd/conf.d/https-node.conf
```

Sisältö:

```apache
<VirtualHost *:443>
    SSLEngine on
    SSLCertificateFile /etc/pki/tls/certs/ca.crt
    SSLCertificateKeyFile /etc/pki/tls/private/ca.key

    SSLProxyEngine on
    ProxyPreserveHost On
    ProxyPass /app http://127.0.0.1:3000
    ProxyPassReverse /app http://127.0.0.1:3000
</VirtualHost>
```

Käynnistä Apache:

```bash
sudo systemctl restart httpd
```

---

## 9. PM2 – automaattinen käynnistys

Asenna PM2:

```bash
sudo npm install -g pm2
```

Käynnistä sovellus:

```bash
pm2 start npm --name "oma-sovellus" -- start
```

Luo automaattinen käynnistys:

```bash
pm2 startup systemd
```

Suorita ruudulle tuleva `sudo`-komento ja tallenna:

```bash
pm2 save
```

---

## 10. Yleisimmät PM2-komennot

```bash
pm2 list
pm2 restart oma-sovellus
pm2 stop oma-sovellus
pm2 delete oma-sovellus
pm2 logs
pm2 save
```

---

## 11. Testaus

Kun sovellus toimii, testaa että se aukeaa selaimessa osoitteessa:

```text
http://IP-osoite/app
```

Tai HTTPS:

```text
https://IP-osoite/app
```
