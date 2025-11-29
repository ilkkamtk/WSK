# Error Handling and Input Validation

## Handling Errors in Express

- Study: [Error Handling](https://expressjs.com/en/guide/error-handling.html)
- Express comes with a default error handler but the response body is in HTML format
    - not very convenient for Rest API clients (software, not humans)
- Custom error handler middleware can be used to return error responses in JSON format
- Error handler middleware is a function that takes four arguments instead of the usual three: `(err, req, res, next)`
    - The first argument is the error object
    - If the error handler middleware is called, the next middleware in the chain is skipped
    - Error handler middleware should be the last middleware in the chain

1. Add error handler middleware functions to `src/middlewares/error-handlers.js`:

    ```js
    ...
    const notFoundHandler = (req, res, next) => {
      const error = new Error(`Not Found - ${req.originalUrl}`);
      error.status = 404;
      next(error); // forward error to error handler
    };
    /**
    * Custom default middleware for handling errors
    */
    const errorHandler = (err, req, res, next) => {
      res.status(err.status || 500); // default is 500 if err.status is not defined
      res.json({
        error: {
          message: err.message,
          status: err.status || 500
        }
      });
    };
    ...
    ```

2. Import the error handler middleware in _app.js_ and add it as the last middleware in the chain

    ```js
    ...
    // Import error handler middlewares on the top of the file
    ...
    ...
    // Default for all routes not handled by routers above
    app.use(notFoundHandler);
    // Add error handler middleware as the last middleware in the chain
    app.use(errorHandler);
    ...
    ```

3. Refactor your code to use the error handler middleware
    - Remove the possible error responses from your controllers. 
    - Use `next()` to pass the error to the error handler middleware, example how to handle missing file in `postCat`:


    ```js
    // cat-controller.js
    const postCat = async (req, res, next) => {
      // check if file is rejected by multer
      if (!req.file) {
        const error = new Error('Invalid or missing file');
        error.status = 400;
        next(error);
      }
   
      ...
     
      const result = await addCat(newCat);
      if (result.error) {
        return next(new Error(result.error));
      }
      res.status(201).json({message: 'New media item added.', ...result});
    };
    ...
    ```

    - Modify `src/middlewares/upload.js` to pass the error to the error handler middleware and move the multer configuration from `cat-router.js` to `middlewares/upload.js` if not done already:

    ```js
    // add multer import
    // multer configuration
    const upload = multer({
      dest: 'uploads/',
      limits: {
        fileSize: 10 * 1024 * 1024, // max 10 MB
      },
      fileFilter: (req, file, cb) => {
        // only allow images and videos
        if (file.mimetype.startsWith('image/') || file.mimetype.startsWith('video/')) {
          cb(null, true);
        } else {
          const error = new Error('Only images and videos are allowed!');
          error.status = 400;
          cb(error, false);
        }
      },
    });
    ...
    ```

    - Import the `upload` middleware in `cat-router.js` and use it in POST route just like before

4. Test the error handler by sending invalid requests to the API, for example:
    - `POST /api/v1/users` with an empty request body
    - `POST /api/v1/cats` with an empty request body
    - `POST /api/v1/cats` with a file that is not an image or video
    - `POST /api/v1/cats` with a file that is larger than 10 MB

---

## Data Validation and Sanitization

Input data validation in web applications is a critical process that ensures the integrity, accuracy, and security of the data received from user inputs. It involves verifying that the data entered by users matches the expected format, type, and content before processing or storing it. Effective input validation can prevent a wide range of issues, including security vulnerabilities, data corruption, and application errors.

- **Required Fields**: Ensuring that mandatory fields are not empty.
- **Type Validation**: Ensuring the data is of the correct type, such as string, integer, or date.
- **Format Validation**: Checking if the data adheres to a specific format. For example, email addresses should match a standard email format.
- **Range and Size Validation**: Ensuring the data falls within a defined range (e.g., a number between 1 and 100) or meets size constraints (e.g., a string that is not longer than 255 characters).
- **Consistency Checks**: Verifying that the data is consistent with other data or constraints. For instance, a 'confirm password' field should match the 'password' field.
- **Business Rule Validation**: Applying validations that are specific to the business logic of the application. For example, checking if a user is old enough for a service.
- **Sanitization**: Removing or encoding potentially dangerous characters to prevent issues like:
    - SQL Injections, where an attacker could input malicious SQL code that gets executed on the database.
    - Cross-Site Scripting (XSS), where malicious scripts are injected into webpages viewed by other users.
    - This often means stripping out HTML, JavaScript, or SQL code from the inputs.
    - [SQL vs. XXS Injection Attacks Explained](https://www.keirstenbrager.tech/sql-vs-xxs-injection-attacks-explained/)

### Client-Side Validation

- Performed in the user's browser before the data is sent to the server.
    - Typically implemented within HTML forms by the [HTML5's built-in form validation or using JavaScript](https://developer.mozilla.org/en-US/docs/Learn/Forms/Form_validation).
- Useful for **improving user experience** (e.g. quick feedback on form errors)
- Should not be the only method used as it can be bypassed by the user!

### Server-Side Validation

- Performed on the server after the data is received.
- A critical layer of validation that **ensures security and data integrity**, as it cannot be bypassed by the user.
- Many web development frameworks and libraries provide built-in functions and validators to simplify the process of data validation.

## Server-side data validation with Express

- [express-validator](https://express-validator.github.io/docs/)
    - a set of Express middlewares that wraps the extensive collection of validators and sanitizers offered by [validator.js](https://github.com/validatorjs/validator.js).
    - [List of all validators](https://github.com/validatorjs/validator.js#validators)
    - [Sanitization](https://express-validator.github.io/docs/guides/getting-started#sanitizing-inputs)
- [MDN Example](https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/forms#Using_express-validator)
- [Regular expressions](https://en.wikipedia.org/wiki/Regular_expression) can be used to test strings against a pattern. They are often used for validation and sanitization.
    - [MDN Regular Expressions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions)
    - [Regex101](https://regex101.com/)
    - [Regexr](https://regexr.com/)

### Example 1: User registration (`POST /api/users`)

- Validation rules:
    - _username_: required, alphanumeric, 3-20 characters
    - _email_: required, valid email address
    - _password_: required, min. 8 characters
    - What about a rule like: "_confirm_password_: required, must match password"? - not needed on server-side, important on client-side

1. Install `express-validator`
2. Handle validation errors in `middlewares/error-handlers.js`, add new middleware function and required imports & exports:

    ```js
    import {validationResult} from 'express-validator';

    ...
   
    const validationErrors = async (req, res, next) => {
      // validation errors can be retrieved from the request object (added by express-validator middleware)
      const errors = validationResult(req);
      // check if any validation errors
      if (!errors.isEmpty()) {
        const messages = errors
           .array()
           .map((error) => `${error.path}: ${error.msg}`)
           .join(', ');
        const error = new Error(messages);
        error.status = 400;
        next(error);
        return;
      }
      next();
    };
    ...
   
    export {validationErrors, ...};
    ```

3. Add validation middleware to the route handler and validation rules to the request body fields, user creation example for `user-router.js`:

    ```js
    ...
    import {body} from 'express-validator';
    import {validationErrors} from '../../middlewares/error-handlers.js';
    ...
    // routes for /api/users/
    userRouter.route('/')
      .get(getUsers)
      .post(
        body('email').trim().isEmail(),
        body('username').trim().isLength({min: 3, max: 20}).isAlphanumeric(),
        body('password').trim().isLength({min: 8}),
        validationErrors,
        postUser
      );
    ...
    ```

4. Test the endpoint with Postman or VSC REST Client
    - Try to send invalid data and verify that the validation works as expected

### Example 2: File upload (`POST /api/v1/cats`)

- Validation rules:
    - _cat_name_: required, 3-50 characters
    - _weight_: required, number
    - _owner_: required, integer
    - _birthdate_: required, date
    - _file_: required, max. 10 MB, only images or videos allowed
        - file needs to be validated with Multer's [fileFilter](https://github.com/expressjs/multer#filefilter)

1. Add validation middlewares to the route handler and validation rules to the request body fields

    ```js
    ...
    import {body} from 'express-validator';
    import {validationErrors} from '../../middlewares/error-handlers.js';
    import {upload} from '../../middlewares/upload.js';
    ...
    catRouter
      .route('/')
      .get(getCats)
      .post(
        authenticateToken,
        upload.single('file'),
        // TODO: add validation and sanitization rules here
        validationErrors,
        postCat);
    ...
    ```

1. Test the endpoint with Postman or VSCode REST Client
    - Try to send invalid data and verify that the validation works as expected

## Assignment 7, Input validation and error handling

1. Continue your existing Express app and create a new branch `assignment7` from `main`
1. Implement error handler middleware
    - Use the error handler in your controllers instead of sending "hard-coded" error responses
1. Implement proper server-side validation and sanitization for all input data
    - Use [express-validator](https://express-validator.github.io/docs/)
    - Specify the validation rules for each field in the request bodies
