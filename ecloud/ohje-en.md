# Virtual Machine Setup and Node App Deployment

This guide helps you set up a Metropolia eCloud virtual machine and deploy a Node application on it.

Follow the steps in order.

---

## 1. Create a virtual machine

1. Go to **[https://ecloud.metropolia.fi/](https://ecloud.metropolia.fi/)**
2. Sign in with your Metropolia account
3. Select **Catalog Items -> Rocky Linux**
4. Select template **Rocky Linux 9 LAMP**
5. Select size **S-Small**
6. Set **Lease time = 120**
7. Create the VM

> Note: PHP and MariaDB are already included in the image, so you do not need to install them.

Wait about **10-15 minutes**.

You will receive by email:

- IP address
- username
- password

---

## 2. Connect to the virtual machine

If you are not on campus network or Eduroam, connect via VPN first.

Open terminal and connect:

```bash
ssh username@IP-address
```

Example:

```bash
ssh student@10.x.x.x
```

---

## 3. Update system

Run:

```bash
sudo dnf upgrade --refresh -y
```

---

## 4. Install Node.js

Go to your home directory:

```bash
cd ~
```

Install Node LTS:

- Check the latest LTS version at <https://nodejs.org/en/download/> and replace `setup_20.x` with the latest LTS setup script.

```bash
curl -sL https://rpm.nodesource.com/setup_20.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo dnf install nodejs -y
```

Check versions:

```bash
node -v
npm -v
```

---

## 5. Fetch project to server

Install git:

```bash
sudo dnf install git -y
```

Clone repository:

```bash
git clone REPOSITORY_URL
```

Go to project folder:

```bash
cd project-name
```

Install dependencies:

```bash
npm install
```

---

## 6. Start application

```bash
npm start
```

Or if needed:

```bash
node src/app.js
```

---

## 7. Publish app with Apache

Allow Apache to connect to Node app:

```bash
sudo setsebool -P httpd_can_network_connect 1
```

Create config file:

```bash
sudo nano /etc/httpd/conf.d/node.conf
```

Add:

```apache
<VirtualHost *:80>
    ServerName localhost

    ProxyPreserveHost On
    ProxyPass /app http://127.0.0.1:3000
    ProxyPassReverse /app http://127.0.0.1:3000
</VirtualHost>
```

Restart Apache:

```bash
sudo systemctl restart httpd
```

Test:

```text
http://IP-address/app
```

---

## 8. HTTPS

Install SSL packages:

```bash
sudo dnf install mod_ssl openssl -y
```

Create certificate:

```bash
openssl genrsa -out ca.key 2048
openssl req -new -key ca.key -out ca.csr
openssl x509 -req -days 365 -in ca.csr -signkey ca.key -out ca.crt
```

- This creates a self-signed certificate, which is fine for testing but not for production.
- In production, browsers will show warnings because the certificate is not issued by a trusted CA.
- You must accept the certificate in the browser before HTTPS works without blocking warnings. Example in Chrome: "Advanced -> Proceed to localhost (unsafe)" or type `thisisunsafe`.
- This must be done separately on each browser/device that accesses the app. For example, if a React app calls a REST API protected by this certificate, first open the API URL directly in the browser and accept the certificate.

Copy files:

```bash
sudo cp ca.crt /etc/pki/tls/certs
sudo cp ca.key /etc/pki/tls/private
```

Create HTTPS config:

```bash
sudo nano /etc/httpd/conf.d/https-node.conf
```

Content:

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

Restart Apache:

```bash
sudo systemctl restart httpd
```

---

## 9. PM2 - automatic startup

Install PM2:

```bash
sudo npm install -g pm2
```

Start app:

```bash
pm2 start npm --name "my-app" -- start
```

- If you started the app earlier with plain `npm start`, stop it first (`Ctrl+C`) so the port is not already in use.
- Starting with PM2 is for continuous use, because PM2 can monitor and restart the process.

Enable startup:

```bash
pm2 startup systemd
```

Run the `sudo` command shown on screen and save:

```bash
pm2 save
```

---

## 10. Common PM2 commands

```bash
pm2 list
pm2 restart my-app
pm2 stop my-app
pm2 delete my-app
pm2 logs
pm2 save
```

---

## 11. Testing

When the app is running, test in browser:

```text
http://IP-address/app
```

Or HTTPS:

```text
https://IP-address/app
```
