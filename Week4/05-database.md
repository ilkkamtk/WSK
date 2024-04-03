# Database connection in Express

1. Import the [example database]() to your MySQL database on Metropolia's server.
   1. Create a database in https://amme.metropolia.fi/mysql/. Login with your Metropolia username and password. When creating the database **DO NOT USE THE SAME PASSWORD AS YOUR METROPOLIA ACCOUNT.**
   1. Open https://users.metropolia.fi/phpMyAdmin/
   2. Select your database from the left sidebar
   3. Click on the `SQL` tab
   4. Copy the content of the `example-database.sql` file and paste it into the SQL query window and press `Go`
1. Install [dotenv](https://github.com/motdotla/dotenv#readme) to load environment variables from a `.env` file into `process.env`.
    - `.env` file is used to store sensitive data like database credentials and should not be committed to version control (remember to add to `.gitignore`).
    - Add `.env` file to the project root folder and add the following content to it:

    ```env
    DB_HOST=mysql.metropolia.fi
    DB_USER=myusername
    DB_PASSWORD=mypassword
    DB_NAME=databasename
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
import promisePool from '../utils/database.js';

const listAllCats = async () => {
  try {
    const [rows] = await promisePool.query('SELECT * FROM cats');
    console.log('rows', rows);
    return rows;
  } catch (e) {
    console.error('error', e.message);
    return {error: e.message};
  }
};

const findCatById = async (id) => {
  try {
    const [rows] = await promisePool.query('SELECT * FROM cats WHERE cats_id = ?', [id]);
    console.log('rows', rows);
    return rows[0];
  } catch (e) {
    console.error('error', e.message);
    return {error: e.message};
  }
};

const addCat = async (cat) => {
  const {cat_name, weight, owner, filename, birthdate} = cat;
  const sql = `INSERT INTO cats (cat_name, weight, owner, filename, birthdate)
               VALUES (?, ?, ?, ?, ?)`;
  const params = [cat_name, weight, owner, filename, birthdate];
  try {
    const rows = await promisePool.query(sql, params);
    console.log('rows', rows);
    return {cat_id: rows[0].insertId};
  } catch (e) {
    console.error('error', e.message);
    return {error: e.message};
  }
};

const modifyCat = async (cat, id) => {
  const sql = promisePool.format(`UPDATE cats SET ? WHERE cat_id = ?`, [cat, id]);
  try {
    const rows = await promisePool.query(sql);
    console.log('rows', rows);
    return {cat_id: cat_id};
  } catch (e) {
    console.error('error', e.message);
    return {error: e.message};
  }
};

export {listAllCats, findCatById, addCat};
```

---

## Assignment 

