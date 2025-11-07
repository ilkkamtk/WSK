# Database connection in Express

Recap [relational databases and SQL](../project/databases.md).

1. Create a new branch `Assignment5` from `main`.
1. Import the [example database](../database/cats-db.sql) to your MySQL database on Metropolia's server.
   1. Create a database in https://amme.metropolia.fi/mysql/. Login with your Metropolia username and password. When creating the database **DO NOT USE THE SAME PASSWORD AS YOUR METROPOLIA ACCOUNT.**
   2. Open https://users.metropolia.fi/phpMyAdmin/
   3. Select your database from the left sidebar
   4. Click on the `SQL` tab
   5. Copy the content of the `example-database.sql` file and paste it into the SQL query window and press `Go`
   6. Note that you need to use Metropolia network when accessing to mysql.metropolia.fi from your app (eduroam or VPN)
1. **Optionally**, you can use local MySQL/MariaDB server for development.
   1. Install MariaDB or MySQL server on your computer.
   1. Create a new database and database user with all privileges to the database using the MySQL client:

   ```sql
   -- You can replace 'wskcats' with your desired database name
   DROP DATABASE IF EXISTS wskcats;
   CREATE DATABASE wskcats;
   USE wskcats;

   -- Replace 'myusername' and 'mypassword' with your desired username and password (DO NOT USE YOUR METROPOLIA CREDENTIALS)
   CREATE USER 'myusername'@'localhost' IDENTIFIED BY 'mypassword';
   GRANT ALL PRIVILEGES ON `wskcats`.* TO 'myusername'@'localhost';
   FLUSH PRIVILEGES;
   ```

   1. Use the same [cats-db.sql](../database/cats-db.sql) script file to create the tables.
1. Install [dotenv](https://github.com/motdotla/dotenv#readme) to load environment variables from a `.env` file into `process.env`.
    - `.env` file is used to store sensitive data like database credentials and should not be committed to version control (remember to add to `.gitignore`).
    - Add `.env` file to the project root folder and add the following content to it:

    ```env
    DB_HOST=mysql.metropolia.fi # or localhost if using local database
    DB_USER=myusername # replace with your database user name
    DB_PASSWORD=mypassword # replace with your database user password
    DB_NAME=myusername # replace with your database name
    ```

1. Study & install [mysql2](https://github.com/sidorares/node-mysql2#readme) package
1. Create a new file `src/utils/database.js` and add the following code to it:

    ```js
    import mysql from 'mysql2';
    import 'dotenv/config';

    const pool = mysql.createPool({
      host: process.env.DB_HOST,
      user: process.env.DB_USER,
      password: process.env.DB_PASSWORD,
      database: process.env.DB_NAME,
      waitForConnections: true,
      connectionLimit: 10,
      queueLimit: 0,
    });
    const promisePool = pool.promise();
    export default promisePool;
    ```

### MySQL2 examples

JavaScript variables in SQL queries should be handled using [prepared statements](https://github.com/sidorares/node-mysql2#using-prepared-statements) to prevent SQL injection attacks.

_cat-model.js:_

```js
// Note: db functions are async and must be called with await from the controller
// How to handle errors in controller?
import promisePool from '../../utils/database.js';

const listAllCats = async () => {
    const [rows] = await promisePool.query('SELECT * FROM wsk_cats');
    console.log('rows', rows);
    return rows;
};

const findCatById = async (id) => {
    const [rows] = await promisePool.execute('SELECT * FROM wsk_cats WHERE cat_id = ?', [id]);
    console.log('rows', rows);
     if (rows.length === 0) {
        return false;
     }
     return rows[0];
};

const addCat = async (cat) => {
  const {cat_name, weight, owner, filename, birthdate} = cat;
  const sql = `INSERT INTO wsk_cats (cat_name, weight, owner, filename, birthdate)
               VALUES (?, ?, ?, ?, ?)`;
  const params = [cat_name, weight, owner, filename, birthdate];
    const rows = await promisePool.execute(sql, params);
    console.log('rows', rows);
     if (rows[0].affectedRows === 0) {
        return false;
     }
    return {cat_id: rows[0].insertId};
};

const modifyCat = async (cat, id) => {
  const sql = promisePool.format(`UPDATE wsk_cats SET ? WHERE cat_id = ?`, [cat, id]);
    const rows = await promisePool.execute(sql);
    console.log('rows', rows);
     if (rows[0].affectedRows === 0) {
        return false;
     }
     return {message: 'success'};
};

const removeCat = async (id) => {
    const [rows] = await promisePool.execute('DELETE FROM wsk_cats WHERE cat_id = ?', [id]);
    console.log('rows', rows);
     if (rows.affectedRows === 0) {
        return false;
     }
     return {message: 'success'};
};

export {listAllCats, findCatById, addCat, modifyCat, removeCat};
```

---

### Continue assignment

1. Convert your existing REST API to use MySQL database for storing data. You can use the `cat-model.js` as a reference.
1. Update the user routes to use the database.
   - Note: when deleting users from the database, you should also delete all the cats that belong to the user because of the foreign key constraint. It is strongly recommended to use [transactions](https://gist.github.com/ilkkamtk/b87666ed682c2c6faea182ca215afaf5) to ensure data integrity.
1. Add owner's name to response json when getting cats.
1. Add endpoint to get cats by user id.
1. Commit and push your branch changes to the remote repository. Merge the `Assignment5` branch to the `main` branch and push the changes to the remote repository.
