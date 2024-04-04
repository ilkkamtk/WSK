# Express

<https://expressjs.com/>

>Fast, unopinionated, minimalist web framework for Node.js

Express provides a robust web application feature set and many [other popular frameworks](https://expressjs.com/en/resources/frameworks.html) are built on top of the Express framework.

## Installation

```bash
npm install express
```

Express package is saved as a dependency in the project's `package.json` file.

Node with Express:

```js
import express from 'express';
const hostname = '127.0.0.1';
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('Welcome to my REST API!');
});

app.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
```

## Main features

- [Static file server](https://expressjs.com/en/starter/static-files.html)
- [Routing](https://expressjs.com/en/guide/routing.html): define how an application’s endpoints (URIs) respond to client requests
- [Middlewares](https://expressjs.com/en/guide/using-middleware.html): functions that have access to the request object (req), the response object (res) in the application’s request-response cycle.
- Support for several [template engines](https://expressjs.com/en/guide/using-template-engines.html)
    - [Pug](https://pugjs.org/) (formerly Jade) is the default template engine
- [Express application generator](https://expressjs.com/en/starter/generator.html)
    - quick Express app scaffolding, e.g: `npx express-generator --view=pug pug-app`
    - the app structure created by the generator is just one of many ways to structure Express apps and might need a lot of refactoring to suit your needs

### Serving static files

1. Create a folder `src/public` and add any static files into it, e.g. html, css, js, images, etc.
1. Serve the files: `app.use('/static', express.static(path.join(__dirname, 'public')));`
1. Access the files in `public` folder at `http://localhost:3000/static/...`

Note: If using ES modules (`import` statements instead of CommonJS `require()`) and `path.join()` when serving static files, you don't have `__dirname` variable by default. You need set it manually:

```js
import path from 'path';
import {fileURLToPath} from 'url';
...
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
```

### Serving response in JSON format (for client-side rendering, CSR)

```js
// GET http://localhost:3000/api/resource
app.get('/api/resource', (req, res) => {
  const myData = {title: 'This is an item', description: 'Just some dummy data here'};
  res.json(myData);
});
```

### Reading request parameters

Using route parameters (path variables, the preferred way in REST APIs):

```js
// GET http://localhost:3000/api/resource/99
// property name (id) is set in the route definition
app.get('/api/resource/:id', (req, res) => {
  console.log('path variables', req.params);
  if (req.params.id === '99') {
    const myData = {
      title: 'This is a specific item, id: ' + req.params.id,
      description: 'Just some dummy data here',
    };
    res.json(myData);
  } else {
    res.sendStatus(404);
  }
});
```

Using query parameters:

```js
// GET http://localhost:3000/api/resource?id=99&name=foo
app.get('/api/resource', (req, res) => {
  if (req.query.id === '99') {
   console.log('query params object', req.query);
    const myData = {
      title: 'This is a specific item, id: ' + req.query.id,
      description: 'Just some dummy data here',
    };
    res.json(myData);
  } else {
    res.sendStatus(404);
  }
});
```

### Reading data from request body

```js
// needed for reading request body in JSON format
app.use(express.json());

...
// POST http://localhost:3000/api/resource
// sends request data back to client
app.post('/api/resource', (req, res) => {
  const body = req.body;
  res.status(201);
  res.json({your_request: body});
});
```

---

## Environment variables

Environment variables are used to store configuration settings outside your codebase. They are useful for storing sensitive information like API keys, database credentials, etc.

### Dotenv

[dotenv](https://www.npmjs.com/package/dotenv) is a zero-dependency module that loads environment variables from a `.env` file into `process.env`.


---

## Assignment
1. Create a new project folder for this week's assignments and initialize a new Git repository.
2. Add a `.gitignore` file to the project folder. Exclude `node_modules` and `.env` files from the repository. You can use [gitignore.io](https://www.toptal.com/developers/gitignore) to generate `.gitignore` files.
3. Create a new branch 'Assignment1' and switch to it: `git checkout -b 'Assignment1'`
4. Make sure to commit your changes and push to the Git repository regularly.
5. Init [eslint, editorconfig and prettier](../Week2/tools_pt2.md#generating-javascript-project-settings-for-prettier-eslint-and-editorconfig) to the project.
   - Eslint initialization settings:
   ```text
   ✔ How would you like to use ESLint? · style
   ✔ What type of modules does your project use? · esm
   ✔ Which framework does your project use? · none
   ✔ Does your project use TypeScript? · No / Yes
   ✔ Where does your code run? · browser
   ✔ How would you like to define a style for your project? · guide
   ✔ Which style guide do you want to follow? · google
   ✔ What format do you want your config file to be in? · JavaScript
   ✔ Would you like to install them now? · No / Yes
   ✔ Which package manager do you want to use? · npm
   ```
6. Enable ES Modules in Node.js by adding `"type": "module"` to `package.json`.
7. Create a new Express project in the project folder based on the 'Hello world' example above.
   - install Express: `npm install express`
   - create an `app.js` file
   - add the 'Hello world' example code to `app.js`
   - install nodemon: `npm install -D nodemon`
   - add a dev script to `package.json` to run the server with nodemon: `"dev": "nodemon app.js"`
8. Serve response in JSON format that returns a cat object: `app.get('/api/v1/cat'... etc.` Object should have the following properties:
    - `cat_id`: number
    - `name`: string
    - `birthdate`: string
    - `weight`: number
    - `owner`: string
    - `image`: string, URL to an image (e.g. `https://loremflickr.com/320/240/cat`)
9. To test the application
    - run the server with `npm run dev`
    - open a browser and navigate to `http://localhost:3000/api/v1/cat`
10. Create new folder 'public' and add a some image file there. Serve the static files from the 'public' folder: `app.use('/public', express.static('public'));`
11. Test that the image is served correctly by navigating to `http://localhost:3000/public/your-image.jpg`
12. Add a start script to `package.json` to run the server with `node` instead of `nodemon`: `"start": "node app.js"`
13. Merge the 'Assignment1' branch to the 'main' branch.
14. Push your changes to a remote repository (e.g. GitHub, GitLab, etc.).
15. Serve the project on a server (e.g. [Azure](https://www.youtube.com/playlist?list=PLKenVLUxjmH_1obN-sz7KvOcBHbRuTdiO), [Metropolia ecloud](https://docs.google.com/document/d/10_NYlJdMaDE_Cv3yZvaZn2g9scs8-n7GOYxOgSrAgC0/edit#heading=h.vfts8ixd14uo), etc.) and test that it works.
