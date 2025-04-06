# Creating REST API Documentation

## Different types of documentation

- **Internal documentation** is for the developers of the API. It is usually written in markdown and stored in the project repository.
- **External documentation** is for the users of the API. It is usually written in HTML and hosted on a website.
- **Interactive documentation** is a web-based tool that allows users to interact with the API. It is usually generated from the internal documentation.
- **API specification** is a formal description of the API that can be used to generate documentation, code, and tests.
- **API reference** is a detailed description of the API endpoints, parameters, and responses.
- **API guides** are tutorials and examples that help users understand how to use the API.
- **API changelog** is a list of changes made to the API over time.

## API documentation tools

- **[APIDoc](https://apidocjs.com/)**  generates API documentation from predefined comments in the source code.
   - [Real life example](https://https://media2.edu.metropolia.fi/media-api/) (requires Metropolia VPN)
- **[Swagger](https://swagger.io/solutions/api-documentation/)** is a tool for designing, documenting, and testing APIs. It uses a YAML or JSON file to describe the API.
   - [Real life example](http://lipas.cc.jyu.fi/api/index.html)

## APIDoc example

    ```javascript
    /**
     * @api {get} /user/:id Request User information
     * @apiName GetUser
     * @apiGroup User
     *
     * @apiParam {Number} id User's unique ID.
     *
     * @apiSuccess {String} name Name of the User.
     * @apiSuccess {String} email Email of the User.
     */
    ```

## Swagger example

    ```yaml
    openapi: 3.0.0
    info:
      title: Sample API
      version: 1.0.0
    paths:
        /user/{id}:
            get:
            summary: Get user by ID
            parameters:
                - name: id
                in: path
                required: true
                schema:
                    type: integer
            responses:
                '200':
                description: OK
                content:
                    application/json:
                    schema:
                        type: object
                        properties:
                        name:
                            type: string
                        email:
                            type: string
    ```

## API documentation best practices

- **Keep it up to date**: Make sure the documentation reflects the current state of the API.
- **Be consistent**: Use a consistent style and format for the documentation.
- **Use examples**: Provide examples of how to use the API endpoints.
- **Include error handling**: Document the possible error responses and how to handle them.
- **Organize the documentation**: Use sections and headings to make the documentation easy to navigate.

## Generating API documentation with AI tools

### Setup

- Install APIDoc: `npm install apidoc`
- Create a `apidoc.json` file with the configuration settings: 
    
    ```json
    {
        "name": "My API",
        "version": "1.0.0",
        "description": "API documentation for my project",
        "title": "My API Documentation",
        "url": "/api/v1",
        "header": {
            "title": "My API Documentation",
            "content": "<p>This is a sample API documentation.</p>"
        },
        "template": {
            "withCompare": true,
            "withGenerator": true
        },
        "exclude": ["node_modules/", "uploads/"],
        "files": ["src/**/*.js"]
    }
    ```
- Add script to `package.json` to generate the documentation: 
    
    ```json
    "scripts": {
        ...
        "apidoc": "apidoc -i src/ -o docs/"
    }
    ```
- Generate the documentation: `npm run apidoc`
- Serve `/docs` with express in `app.js`: 

    ```javascript
    app.use('/docs', express.static('docs'));
    ```
- Access the documentation at `http://localhost:3000/docs`

### Creating the docs
- You can add the APIDoc comments to the source code files, or you can put them in separate files.
- To use separate files you can add new folder `src/api/apidoc` and save your documentation files there as `*.js` files.
- You can use for example ChatGPT or GitHub Copilot to generate the documentation. Don't try to generate the whole documentation all at once, but rather focus on one endpoint at a time: 
- Example prompt:
    ```text
    I need REST api documentaion in APIDoc format to a separate file for the following end point:
    
    // user-router.js:
    userRouter
      .route('/')
      .get(getUser)
      .post(
        body('email').trim().isEmail(),
        body('username').trim().isLength({min: 3, max: 20}).isAlphanumeric(),
        body('password').trim().isLength({min: 8}),
        body('name').trim().isLength({min: 1}),
        validationErrors,
        postUser
      );
    
    // user-controller.js
    const getUser = async (req, res, next) => {
      try {
        const users = res.json(await listAllUsers());
        // no need to check if users is empty, it will return an empty array
        res.json(users);
      } catch (e) {
        const error = new Error('An error occurred while fetching users');
        error.status = 500;
        next(error);
      }
    };
    
    // user-model.js
    const listAllUsers = async () => {
      try {
        const [rows] = await promisePool.query('SELECT * FROM wsk_users');
        console.log('rows', rows);
        return rows;
      } catch (e) {
        console.error('error', e.message);
        return false;
      }
    };
    
    ```
- The result should be an APIDoc for the `GET /user` endpoint. Save the result to a file `src/api/apidoc/user.js`. Create `POST`,  `PUT` and `DELETE` endpoints in the same manner and place them in the same file. 
- Run APIDoc to generate the documentation and open the documentation in the browser to check that it looks good.
- Obviously the documentation is not perfect, so you'll need to do some manual editing to make it represent the API correctly.
