# Virtuaalikoneen käyttöönotto ja Node-sovelluksen julkaisu

Tämä ohje auttaa sinua ottamaan käyttöön Metropolian eCloud-virtuaalikoneen ja julkaisemaan Node-sovelluksen siihen.

Ohje etenee vaihe vaiheelta. Suosittelen, että suoritat kohdat järjestyksessä.

Jos asiat menee solmuun, helpin tapa korjata on poistaa virtuaalikone ja aloittaa alusta ja seurata ohjetta tarkemmin.

---

## 1. Luo virtuaalikone

1. Mene osoitteeseen **[https://ecloud.metropolia.fi/](https://ecloud.metropolia.fi/)**
2. Kirjaudu Metropolian tunnuksilla
3. Valitse **Catalog Items → Rocky Linux**
4. Valitse malliksi **Rocky Linux 9 LAMP**
5. Valitse koko **S-Small**
6. Aseta **Lease time = 120**
7. Luo kone

> Huom. LAMP version valinta on tärkeä, koska PHP ja MariaDB ovat jo valmiiksi imagessa, niitä tarvitaan tietokannan hallintaan phpMyAdminin kautta.

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

Jos haluat vaihtaa palvelimen käyttäjäsalasanan heti alussa:

```bash
passwd
```

Syötä nykyinen salasana, sitten uusi salasana kaksi kertaa.

---

## 3. Päivitä järjestelmä (valinnainen)

Suorita:

```bash
sudo dnf upgrade --refresh -y
```

---

## 4. Testaa phpMyAdmin ja resetoi MariaDB root-salasana

Mene selaimella osoitteeseen:

```text
http://IP-osoite/phpmyadmin
```

Jos et pääse kirjautumaan, voit resetoida MariaDB:n root-salasanan.

Pysäytä MariaDB:

```bash
sudo systemctl stop mariadb
```

Käynnistä MariaDB tilassa, jossa oikeuksien tarkistus on ohitettu:

```bash
sudo mysqld_safe --skip-grant-tables --skip-networking &
```

Jos et näe kursoria komennon jälkeen, paina Enter.

Avaa MariaDB-komentorivi:

```bash
mysql -u root
```

Nyt olet tietokannan hallinnassa. Aja seuraavat SQL-komennot:

```sql
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'uusi-salasana-tahan';
FLUSH PRIVILEGES;
```

Poistu tietokannan hallinnasta:

```sql
exit
```

Käynnistä MariaDB normaalisti uudelleen:

```bash
sudo systemctl restart mariadb
```

Kirjaudu käyttäjänä 'root' uudella salasanalla phpMyAdminiin.

Luo tämän jälkeen sovellukselle oma käyttäjä ja tietokanta phpMyAdminissa:

1. Mene välilehdelle **User accounts** ja valitse **Add user account**.
2. Luo uusi käyttäjä (esim. `metropolia_user`) ja anna salasana.
3. Ruksaa samalla uuden tietokannan luonti käyttäjälle.
4. Ruksaa käyttäjälle oikeudet vain tähän tietokantaan (ei kaikkia globaaleja oikeuksia).

Miksi oleellinen:

- Älä käytä `root`-tunnusta sovelluksissa.
- `root`-tunnuksella on täydet oikeudet koko palvelimeen, joten vuotaneet tunnukset aiheuttavat merkittävästi suuremman riskin.
- Sovelluskohtainen käyttäjä rajatuilla oikeuksilla pienentää vahinkoa, jos tunnus joutuu vääriin käsiin.

---

## 5. Asenna Node.js

Siirry kotihakemistoon:

```bash
cd ~
```

Asenna Node LTS:

- tarkasta ensin mikä on uusin LTS-versio osoitteesta <https://nodejs.org/en/download/> ja vaihda `setup_20.x` uusimmaksi LTS-versioksi.

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

## 6. Hae projekti palvelimelle

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

## 7. Käynnistä sovellus

```bash
npm start
```

Tai tarvittaessa:

```bash
node src/app.js
```

---

## 8. Julkaise sovellus Apachella

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
    ServerName localhost

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

## 9. HTTPS

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

- Tämä tuottaa itseallekirjoitetun sertifikaatin, joka sopii testaukseen mutta ei tuotantoon.
- Tuotannossa selain näyttää varoituksen, koska sertifikaattia ei ole myöntänyt luotettu varmennepalvelu.
- Varmenne pitää hyväksyä selaimessa ennen kuin HTTPS toimii ilman varoituksia. Esim. Chrome: "Advanced → Proceed to localhost (unsafe)" tai kirjoita 'thisisunsafe'.
  - Tämä täytyy tehdä jokaiselle selaimelle ja laitteelle, joka käyttää sovellusta. Esim React sovelluksessa, joka käyttää REST APIa, joka on suojattu tällä sertifikaatilla, pitää hyväksyä varmenne. Tämä tapahtuu kirjoittamalla REST APIn osoite käsin selaimen osoiteriville ja hyväksymällä varmenne. Sen jälkeen React-sovellus osaa käyttää REST APIa ilman varoituksia.

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
    ServerName localhost

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

## 10. PM2 – automaattinen käynnistys

Asenna PM2:

```bash
sudo npm install -g pm2
```

Käynnistä sovellus:

```bash
pm2 start npm --name "oma-sovellus" -- start
```

- Jos ajoit sovellusta aiemmin suoraan `npm start`-komennolla, pysäytä se ensin (`Ctrl+C`), jotta portti ei jää varatuksi.
- PM2:n kautta käynnistys on tarkoitettu jatkuvaan käyttöön, koska se osaa valvoa ja käynnistää prosessin uudelleen.

Luo automaattinen käynnistys:

```bash
pm2 startup systemd
```

Suorita ruudulle tuleva `sudo`-komento ja tallenna:

```bash
pm2 save
```

---

## 11. Yleisimmät PM2-komennot

```bash
pm2 list
pm2 restart oma-sovellus
pm2 stop oma-sovellus
pm2 delete oma-sovellus
pm2 logs
pm2 save
```

---

## 12. Testaus

Kun sovellus toimii, testaa että se aukeaa selaimessa osoitteessa:

```text
http://IP-osoite/app
```

Tai HTTPS:

```text
https://IP-osoite/app
```
