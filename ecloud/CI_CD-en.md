# CI/CD from GitHub to an eCloud Virtual Machine

Because Metropolia eCloud virtual machines are inside an internal network, GitHub cannot connect to them directly.

In this guide, CI/CD is implemented by using a **webhook + smee.io relay service**.

This setup is a workaround, so do not use it in real production environments. It is intended for learning purposes only.

Assumptions:

- your application is already on the server
- your application is managed by **PM2**
- you use a GitHub repository

---

## 1. Create an SSH key for GitHub

Before enabling CI/CD, make sure an SSH key is created and added to GitHub.

Official GitHub docs:

- Generate SSH key: [https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
- Add SSH key to GitHub: [https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

Create the key:

```bash
ssh-keygen -t ed25519 -C "your.email@metropolia.fi"
```

When asked for passphrase, you can leave it empty.

Show public key:

```bash
cat ~/.ssh/id_ed25519.pub
```

Add the key in GitHub:

```text
GitHub -> Settings -> SSH and GPG keys -> New SSH key
```

---

## 2. Create an smee channel

Go to:

```text
https://smee.io/
```

Click **New Channel** and save the URL, for example:

```text
https://smee.io/xxxyyyzzz
```

---

## 3. Create a webhook project on the server

```bash
cd ~
mkdir webhooks
cd webhooks
npm init -y
npm install smee-client
```

---

## 4. Create the smee listener

```bash
nano index.js
```

Add:

```javascript
const SmeeClient = require('smee-client');

const projects = [
  {
    name: 'my-app',
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

Replace:

- `my-app`
- smee channel URL

Why this matters:

- `127.0.0.1` keeps traffic local to the machine. This reduces the risk of exposing the webhook port to the network by mistake.

---

## 5. Add package.json script

```bash
nano package.json
```

Add this (or extend your existing `scripts` section):

```json
"scripts": {
  "start": "node index.js"
}
```

Why this matters:

- If you replace the whole `scripts` section, you may lose other project commands. Extend the existing section instead of overwriting it.

---

## 6. Start smee with PM2

```bash
pm2 start npm --name "smee" -- start
pm2 save
```

---

## 7. Create deploy script

```bash
nano app-update.sh
```

Add:

```bash
#!/bin/bash

cd /home/username/project-folder

git pull origin main
npm install
npm run build
pm2 restart my-app
```

Replace:

- `username`
- `project-folder`

Why this matters:

- `pm2 restart all` restarts every PM2 process. If you host multiple services on the VM, they may be interrupted unnecessarily.

Make it executable:

```bash
chmod +x app-update.sh
```

---

## 8. Create webhook configuration

```bash
nano webhooks.json
```

Add:

```json
[
  {
    "id": "my-app",
    "execute-command": "/home/username/webhooks/app-update.sh",
    "trigger-rule": {
      "and": [
        {
          "match": {
            "type": "payload-hmac-sha256",
            "secret": "REPLACE_WITH_GITHUB_WEBHOOK_SECRET",
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

Note: `id` must match the value used in `index.js`.

Why this matters:

- `trigger-rule` ensures that only requests signed by GitHub are accepted.
- Without this, anyone who gets your smee channel URL may try to trigger deployments.

---

## 9. Install webhook program

Check the latest version first:

```text
https://github.com/adnanh/webhook/releases/latest
```

Update version number as needed. Example:

```bash
wget https://github.com/adnanh/webhook/releases/download/2.8.2/webhook-linux-amd64.tar.gz
```

Extract package:

```bash
tar -xzvf webhook-linux-amd64.tar.gz
```

Move binary:

```bash
sudo mv webhook-linux-amd64/webhook /usr/local/bin/
```

Check version:

```bash
webhook -version
```

> Always verify the latest version before installation.

---

## 10. Start webhook listener

```bash
webhook -hooks ~/webhooks/webhooks.json --verbose
```

This shows logs in real time.

When everything works, you can also run webhook under PM2:

```bash
pm2 start webhook --name "webhook" -- -hooks /home/username/webhooks/webhooks.json --verbose
pm2 save
```

---

## 11. Add webhook in GitHub

In GitHub:

```text
Repository -> Settings -> Webhooks -> Add webhook
```

Set:

- **Payload URL** -> your smee channel URL
- **Content-Type** -> `application/json`
- **Secret** -> same value as `webhooks.json` `trigger-rule.match.secret`

Why this matters:

- Secret is webhook authentication. It allows your server to verify the request really came from GitHub.

Save.

---

## 12. Test CI/CD

Make a change in your project:

```bash
git add .
git commit -m "test deployment"
git push
```

Webhook should run automatically:

- `git pull`
- `npm install`
- `npm run build`
- `pm2 restart my-app`

---

## 13. Troubleshooting

```bash
pm2 list
pm2 logs
```

Webhook logs:

```bash
webhook -hooks ~/webhooks/webhooks.json --verbose
```

Smee logs:

```bash
pm2 logs smee
```
