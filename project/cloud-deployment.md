# Cloud Services and Application Deployment

## Cloud services and environments

Cloud computing models provide different levels of control, flexibility, and management. The three primary models are:

1. **Software as a Service (SaaS)**
   - SaaS delivers software applications over the internet, on a subscription basis. The applications are hosted and managed by the service provider.
   - End-users can use the software but don't manage the infrastructure or platform running the application.
   - Examples: Google Workspace, Microsoft Office 365, Salesforce, Dropbox.
   - Ideal for businesses that want ready-to-use applications without worrying about installation, maintenance, or infrastructure.
2. **Platform as a Service (PaaS)**
   - PaaS provides a platform allowing customers to develop, run, and manage applications without the complexity of building and maintaining the infrastructure typically associated with developing and launching an app.
   - Users manage applications and data, while the provider manages runtime, middleware, operating system, virtualization, servers, storage, and networking.
   - Examples: Heroku, Google App Engine, Microsoft Azure App Services.
   - Suitable for developers who want to focus on their software and data without dealing with servers, storage, and networking.
3. **Infrastructure as a Service (IaaS)**
   - IaaS provides fundamental computing resources such as virtual machines, storage, and networks over the internet. Users have control over their infrastructure, similar to traditional physical data centers, but it's available over the cloud.
   - Users have control over operating systems, storage, deployed applications, and possibly limited control of select networking components (e.g., host firewalls).
   - Examples: Amazon Web Services (AWS), Microsoft Azure, Google Compute Engine (GCE).
   - Ideal for companies needing complete control over their infrastructure but want to avoid the cost and complexity of managing physical servers.

>SaaS is like renting a house - you use it as it is, without worrying about maintaining it.
PaaS is like renting the land and building your house - you control the house but not the land it’s on.
IaaS is like leasing/buying a plot of land - you have full control over the land and what you build on it, but you don’t own the land.

## Public vs. Private

Cloud services can be deployed in different ways, primarily categorized as public, private, or hybrid clouds.

![Cloud deployment models](../images/hybrid-cloud.png)

- **Public Cloud**
  - Public cloud services are provided by third-party providers over the public internet, making them available to anyone who wants to use or purchase them.
  - Resources such as servers and storage are owned and operated by the cloud provider and shared among multiple organizations (tenants).
  - Examples: Amazon Web Services (AWS), Microsoft Azure, Google Cloud Platform (GCP).
  - Benefits: Cost-effective, scalable, and easy to access. Ideal for businesses that want to avoid the complexity of managing their own infrastructure.
- **Private Cloud**
  - Private cloud services are used exclusively by a single organization. The cloud infrastructure can be hosted on-premises or by a third-party provider.
  - Resources are not shared with other organizations, providing greater control over security and compliance.
- **Hybrid Cloud**
  - Hybrid cloud combines public and private cloud elements, allowing data and applications to be shared between them.
  - Organizations can take advantage of the scalability and cost-effectiveness of public clouds while maintaining control over sensitive data in private clouds.

## Running environment

In server-side applications, the running environment, often referred to as the "runtime environment" or simply the "runtime," is the software and hardware infrastructure where the server-side code of an application executes. This environment provides the necessary resources and services for the server-side code to run, handle requests, process data, and generate responses. The choice of a running environment depends on various factors, including the programming language, framework, and the specific requirements of the application.

- **Server hardware**: The physical or virtual server where the application runs. It includes CPU, memory (RAM), storage (disk space), and network connectivity. The server hardware's capacity and configuration impact the application's performance and scalability.
- **Operating system (OS)**: The server typically runs on an operating system (OS), such as Linux, Windows Server, or macOS Server. The OS manages system resources, handles hardware communication, and provides a platform for running software.
  - _Guest OS_ is a term used when the OS is running inside a virtual machine (VM) or container.
  - _Host OS_ is the underlying OS that runs on the physical server and hosts the VMs or containers.
- **Web server**: In web applications, a web server software (e.g., Apache, Nginx, IIS) often serves as an intermediary between client requests and the server-side application. It handles tasks like request routing, load balancing, and static file serving.
- **Runtime for the programming language**: The specific runtime environment for the chosen programming language. For example:
  - For Python applications, the Python runtime environment is necessary, which includes the Python interpreter.
  - For Java applications, the Java Virtual Machine (JVM) serves as the runtime environment.
  - For Node.js applications, the Node.js runtime environment is required.
  - For PHP applications, the PHP interpreter is used.
- **Application server (optional)**: In some cases, like with Java-based applications, an application server like Tomcat, WildFly, or WebSphere may be used. It provides additional services like connection pooling, transaction management, and security. With node.js the pm2 process manager can be used for similar purposes.
- **Database server**: If the application interacts with a database, a database server (e.g., MySQL, PostgreSQL, MongoDB) is part of the runtime environment. It manages data storage, retrieval, and manipulation.
- **Frameworks & middleware**: Middleware components and frameworks used to develop the server-side application. These may include web frameworks (e.g., Flask, Ruby on Rails, Express.js), message brokers (e.g., RabbitMQ), and caching systems (e.g., Redis).
- **Environment variables and configuration**: Settings and configuration parameters that control the behavior of the application. These may include database connection strings, API keys, and other environment-specific variables. These values usually differ between development, testing, and production environments.
- **Security components**: Security measures like firewalls, intrusion detection systems, and encryption protocols that protect the server and its data.
- **Monitoring and logging tools**: Tools and services that help monitor the server's performance, track errors, and log application events for debugging and analysis.
- **Load balancers (for scalability)**: In a high-traffic environment, load balancers distribute incoming requests across multiple servers to ensure scalability and high availability.
- **Containerization and orchestration (e.g., Docker, Kubernetes)**: In modern server environments, containerization technologies and orchestration platforms are used to package, deploy, and manage applications and their dependencies in a consistent and scalable manner.

The choice of the running environment components depends on factors like the type of application, expected traffic, scalability requirements, and the technology stack being used. Designing a robust and efficient running environment is essential for ensuring the reliable operation of server-side applications.

## Installing a Virtual Server on Azure cloud environment (IaaS)

### Materials & links

Browse, read, watch & study:

- [Introduction to Azure fundamentals](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-fundamentals/)
- [Get started with Azure](https://azure.microsoft.com/en-us/get-started/)
- [MS Azure Youtube channel](https://www.youtube.com/channel/UC0m-80FnNY2Qb7obvTL_2fA)
- [Azure portal](https://portal.azure.com/)
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/)
- [Azure network security group](https://docs.microsoft.com/en-us/azure/virtual-network/network-security-groups-overview)

Help for Linux usage:

- [Using Linux command line](https://ubuntu.com/tutorials/command-line-for-beginners)
- [The Beginner’s Guide to Nano, the Linux Command-Line Text Editor](https://www.howtogeek.com/42980/the-beginners-guide-to-nano-the-linux-command-line-text-editor/)
- [Ubuntu package management](https://ubuntu.com/server/docs/package-management)
- [Ubuntu firewall](https://ubuntu.com/server/docs/security-firewall)

### Getting started & setting up the environment

1. Sign up for a free [student account](https://azure.microsoft.com/en-us/free/students/) using your school email address & login, you should get some free credits (100 USD), [more info](https://docs.microsoft.com/en-us/azure/education-hub/azure-dev-tools-teaching/program-faq)
1. Go to [Azure portal](https://portal.azure.com/)
1. Create a resource: **Virtual machine (VM)** with following settings:
   - Choose your subscription (Azure for Students)
   - Create new resource group, e.g. `web-project-rg`
   - Virtual machine name: e.g. `my-web-server`
   - Region: choose the closest one
     - Note: with free student account you may have limited options and you might need to check which regions are available for you, more info: <https://learn.microsoft.com/en-us/answers/questions/5549511/student-account-in-which-regions-can-i-deploy-a-vm>
   - Availability options: No infrastructure redundancy required
   - Security type: Standard
   - Image: Choose a Linux server image, e.g. latest Ubuntu Server LTS
   - Select [VM size](https://docs.microsoft.com/en-us/azure/virtual-machines/sizes) & disks according your needs (Think about what is the minimum for a web server? Check the OS system requirements, etc.)
     - 'Standard_B1ms' is the teacher's recommendation for this course
     - NOTE: you have 100 USD of student credits to spend in total (for a one year)
   - Authentication type: Password (or SSH public key if you prefer that), this is the admin user account for the VM
   - Public inbound ports: Allow access to SSH, HTTP and HTTPS ports
   - For other settings you can leave the default values
   - Disk tab: Change OS disk type to Standard SSD
   - Networking tab: Make sure that a new public IP address & subnet is created, default settings are ok
   - Management tab: default settings are ok, automatic shutdown can be useful in order to save credits
   - Click _Review + create_ and check that all settings are ok
   - Finally hit the _CREATE_ button and wait for the VM deployment to finish
   - After successful deployment of the virtual machine go to the resources's _Overview_ page and configure the _DNS name_ for your public IP address.
   - Note: VM is paid by hour when the VM is running. In development use it's a good idea to stop the VM when you don't need it (start/stop buttons are found in Azure portal).

1. Use SSH connection for managing your VM (`ssh username@PUBLIC_IP/YOUR_DNS_NAME` in terminal/git bash or use e.g. [Putty](https://www.putty.org/))

   - Optional: use public key authentication instead of username/password: [Instructions](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-ubuntu-22-04)

1. Make sure you have all recent updates installed (this should be done on weekly basis)

   ```bash
   sudo apt update # checks for available updates
   sudo apt dist-upgrade # installs updates including kernel packages
   ```

   All administrator level tasks needs superuser (root) privileges. `sudo` (_superuser do_) needs to used before the actual command for gaining the access rights. Use your login password if prompted.

### Installing & configuring web server software

#### Apache web server

1. Install

   ```sh
   sudo apt update
   sudo apt upgrade
   sudo apt install apache2
   ```

2. Check configuration files `/etc/apache2/` & start `sudo systemctl start apache2`
3. Add write permissions to your user account for the webroot folder `/var/www/html`: `sudo chown <MYUSERNAME>.<GROUP> /var/www/html`
4. Copy your UI files to the webroot using e.g. scp/filezilla/winscp or clone/pull from GitHub
5. Test with browser <http://my.server.ipaddress.or.hostname/>
6. Enable HTTPS connections using Let's encrypt & Certbot

   - [Let’s Encrypt is a free, automated, and open certificate authority (CA)](https://letsencrypt.org/about/)
   - Use the [Certbot](https://certbot.eff.org/) for easy installation:

   ```sh
   # Ensure that your version of snapd is up to date
   sudo snap install core; sudo snap refresh core
   # Install Certbot
   sudo snap install --classic certbot
   # Get a certificate and have Certbot edit your apache configuration automatically to serve it, turning on HTTPS access in a single step
   sudo certbot --apache
   # Answer the questions when prompted, you need to provide your server DNS-name, something like <my.website>.cloudapp.azure.com
   ```

   - To confirm that your site is set up properly, visit https://my.server.hostname.cloudapp.azure.com/ in your browser and look for the lock icon in the URL bar

#### MariaDB database server

1. Install MariaDB server ([more detailed instructions](https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-ubuntu-22-04)):

   ```bash
   sudo apt install mariadb-server
   ```

1. Start and enable it:

   ```bash
   sudo systemctl start mariadb
   sudo systemctl enable mariadb
   ```

1. Secure it by running the sript (optional in our one server system):

   ```console
   mysql_secure_installation
   ```

   Note: In Ubuntu you don't necessary need root password at all. Just use sudo for gaining root access: `sudo mysql -u root`. Skip that step when prompted.

1. Connect to your database server as a root user: `sudo mysql -u root` and create a database and a user with privileges on it:

   ```sql
   CREATE DATABASE MyDatabaseName;
   CREATE USER 'myusername'@'localhost' IDENTIFIED BY 'mypassword';
   GRANT ALL PRIVILEGES ON `MyDatabaseName`.* TO 'myusername'@'localhost';
   FLUSH PRIVILEGES;
   ```

   (in case you would need outside access (e.g. during project, separate database server from app server), replace `localhost` with `'%'` in the two GRANT queries and remember that the settings you did with `mysql_secure_installation` may prevent this).

1. Use your own database creation script.  
   - You can download from the internet (e.g. Github) directly to the server using curl: `curl -O <FILE-URL>` (note: click the _Raw_ button on script's GitHub page in order to get a working url)
   - or upload with any SCP file transfer tool to the server. (e.g. using command line secure copy tool **scp**: `scp my-db.sql <YOUR-USERNAME>@<YOUR-SERVE-NAME/IP>:`)
1. Import the tables and insert the data: `mysql -u myusername -p < my-db.sql` or `sudo mysql < my-db.sql`
1. Eventually check that the user account works and the data is there: `mysql -u myusername -p`

   ```sql
   USE MyDatabaseName;
   SHOW TABLES;
   exit
   ```

1. (Optional) if you would like to install phpMyAdmin to administrate your databases, tables and data with a graphical user interface, check for example [instructions here](https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-phpmyadmin-on-ubuntu-22-04)

#### Node.js runtime and process management

This can be done later when you have your Express application ready for deployment, but here are the instructions in advance.

![Apache reverse proxy](../images/apache-node-proxy.png)

1. Install _node.js_ and _npm_  from [nodesource package repository](https://github.com/nodesource/distributions#ubuntu-versions):

   ```bash
   # Download the setup script:
   curl -fsSL https://deb.nodesource.com/setup_23.x -o nodesource_setup.sh
   # Run the setup script:
   sudo -E bash nodesource_setup.sh
   # Install node.js:
   sudo apt install -y nodejs
   # Verify that the installed node tools are working:
   node -v
   npm -v
   ```

1. Configure Apache httpd server as a reverse proxy to Node server:

   1. Edit the Apache configuration (Let's encrypt's default SSL configuration file):

      ```bash
      sudo nano /etc/apache2/sites-available/000-default-le-ssl.conf
      ```

   1. Add the following content (to the bottom of `<VirtualHost *:443>` block) & save the conf file:

      ```conf
      <VirtualHost *:443>
        
        # some existing conf stuff here

        #...
        #...

        # Choose only (uncomment or copy) one of the following configuration options:
      
        # configuration for URL subpath, e.g.: https://myserver.example.com/api/ <-> localhost:3000
        #ProxyPreserveHost On
        #ProxyPass /api/ http://127.0.0.1:3000/
        #ProxyPassReverse /api/ http://127.0.0.1:3000/

        # OR configuration for root path: https://myserver.example.com/ <-> localhost:3000
        # this is the recommended (easier) option
        ProxyPreserveHost On
        ProxyPass / http://127.0.0.1:3000/
        ProxyPassReverse / http://127.0.0.1:3000/

      </VirtualHost>
      ```

1. When working with Ubuntu 24.04 default installation you need to enable modules `proxy` and `proxy_http` by using command `sudo a2enmod <MODULE-NAME>` and restart the web server:

   ```bash
   sudo a2enmod proxy proxy_http
   sudo systemctl restart apache2
   ```

1. Setup Git to connect to your remote repository

   1. Test that `git` command works, if not install it: `sudo apt install git`
   1. If your Github project repo is private, you need to setup ssh authentication:
       1. [Generate a new SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
       1. [Add SSH key to your GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
       1. [Test connection](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/testing-your-ssh-connection)
   1. It's also a good idea to setup your git user name: `git config --global user.name "Your Name"` and email: `git config --global user.email "youremail@example.com"` on the server.

1. Install and run your Express application:

   1. Read [Production best practices: performance and reliability](https://expressjs.com/en/advanced/best-practice-performance.html) and [What is NODE_ENV in Node.js](https://www.geeksforgeeks.org/what-is-node_env-in-node-js/)
      - Prepare your app for production and create a new git branch `deployment` or use `main`
      - Make sure the branch for the deployment is up to date with the latest changes and works on your local machine and push it to the remote repository (GitHub)
   1. **On the server:** Make sure you are in your home folder: `cd`
   1. `git clone <your-github-repo-url-here>` (or copy your back-end app to your home folder on the server exluding the contents of `node_modules` & `uploads` folders)
   1. Go to the app directory: `cd <my-app>`
   1. If you cloned the repo, make sure that you are in the right branch (`git checkout <branchname>` if not)
   1. Install your dependencies: `npm install --production` (`--production` flag is used to avoid installing development dependencies if not needed on deployment server)
   1. Create/edit `.env` file with your db credentials (you set in [MariaDB](#mariadb-database-server)) and other settings:
       - you can use `.env.sample` as a template by copying it: `cp .env.sample .env` (navigate to the correct directory first by using `cd` commands)
       - edit the env file with nano: `nano .env`:

      ```conf
      DB_HOST=127.0.0.1
      DB_USER=<your-db-user>
      DB_PASSWORD=<your-db-user_password>
      DB_NAME=<your-db-name>
      JWT_SECRET=somesecuresecrethere
      JWT_EXPIRES_IN=1d
      # add also other settings that you may have in your app (like the Kubios Api stuff)
      # ...
      ```

   1. To test start your application: `node src/index.js` or `npm start`
   1. Test that it works: open a browser and visit `https://<your-ip-address-or-hostname>/api/<endpoint>`
   1. To kill the app, use `CTRL+C`, or if it's no more attached to your terminal session, try `pkill node` or use [`top`](https://www.howtogeek.com/668986/how-to-use-the-linux-top-command-and-understand-its-output/)
   1. To have your app running "forever" as a background service, featuring automatic restart on crash, writing log files, etc. use e.g. [pm2](https://pm2.keymetrics.io/):

      ```bash
      sudo npm install -g pm2
      pm2 start src/index.js --name <MY-SERVER-APP-NAME>
      ```

      - To check the status of running node apps, run `pm2 status`
      - To check for possible errors, etc.: log files can be accessed with `pm2 logs`
      - Restart app after code updates: `pm2 restart <app-name>`
      - If you want that the app automatically reload on change (e.g. on next `git pull`), use the `--watch` flag with `pm2`.
   1. (optional) other "pure" linux option for managing the service would be using [systemd](https://nodesource.com/blog/running-your-node-js-app-with-systemd-part-1/) for creating a system process.

#### Publishing Front-end application (Client)

Front-end HTML/CSS/JS files can be served from any web server. **Easiest and the recommended solution** is to use the [Express static](https://expressjs.com/en/starter/static-files.html) files serving option. Then you don't need care about cors issues and the apache proxy setup done earlier works out-of-the-box. 

For example when using Vite for front-end development:

1. [Build](./01-tools-env.md#publishing-the-website-created-with-vite) your Vite app (`npm run build`) to create the static HTML/CSS/JS/etc. website files. (You cannot use the Vite development server for production on the server.)
   - **Note:** Remember to update your API connections (`fetch()` function calls) in your client code to use the real server's URL address instead of `localhost:3000`!
   - You can do the build on your local machine and then copy the files to the server or build directly on the deployment server using a cloned git repository of your front-end project. 
1. Copy all contents of the `dist/` folder (generated by Vite build) to your node application's `public/` folder on the server.
   - if you did the build on the local machine, you can use for instance WinSCP or Filezilla or cli tools [`scp`/`rsync`](https://www.howtogeek.com/devops/how-to-copy-directories-recursively-with-scp/) to copy the files to the server: `scp -r dist/ <USERNAME>@<SERVER-ADDRESS>:/path/to/your/app/public/` **or** put the files into `public/` folder in your node app's git repository (e.g. `deployment` branch) and push-pull them to the deployment server within the node app.
   - if you did the build on the server, just [copy](https://www.freecodecamp.org/news/how-to-copy-a-directory-in-linux-with-the-cp-command/) the files to the right place on the server: `cp -r dist/* /path/to/your/app/public/`
1. Make sure you have the correct git branch checked out on the server and then restart your node app with `pm2 restart <app-name>` after making changes to the node app.
1. Test: open a browser and visit `https://<your-server-address>/` and `https://<your-server-address>/api/`

---

**Or if** you want to use Apache directly as a web server for static files:

1. Change the owner of the web root folder such that no `sudo` permissions are needed when you edit the contents of the folder: `sudo chown <USERNAME>.<USERNAME> /var/www/html`
1. Upload/copy/clone your front-end files to the server's `/var/www/html/` directory
1. Update Apache config by enabling `DocumentRoot` and modifying proxy settings for Node app to use the sub url path version
1. Test: open a browser and visit `https://<your-server-address>/` and `https://<your-server-address>/api/`

#### Cross-Origin Resource Sharing (CORS)

If running the front-end and back-end on different servers, you need to take care of [CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS) issues. One option is to use the [cors](https://github.com/expressjs/cors#readme) middleware [in Express](https://expressjs.com/en/resources/middleware/cors.html) app.
