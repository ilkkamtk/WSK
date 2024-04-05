# Application State and User Authentication

---

#### Authentication

Authentication is the process of verifying the identity of a user. It is the process of determining whether someone or something is, in fact, who or what it is declared to be.

#### Authorization

Authorization is the process of determining whether a user has permission to perform a specific action. It is the process of granting or denying access to a network resource.

---

## Maintaining State in Web Applications

In any realistic interactive Web application you will come across the need of retaining information between individual pages. This is referred to as "maintaining state" or as the "persistence of data". HTTP protocol does not support this, it is a _stateless_ protocol - every page request starts in a blank state with no knowledge of data that was available on the previous page. Since HTTP is stateless by nature, web applications need to implement their own methods for maintaining state. There is several common strategies to implement this on the server-side.

Choosing the right method for maintaining state depends on the specific requirements of your application, such as the type of data being stored, security considerations, scalability, and whether the state is user-specific or shared across users. It's common to use a combination of these methods to address different aspects of application state.

### Cookies

- Small pieces of data stored on the client's browser. Cookies are sent back to the server with every HTTP request.
- Cookies store variables as name and value pairs, plus additional information such as expiration time and the name of website where the cookie came form.
- By default, website can modify only its own cookies
  Use Cases: Remembering user preferences, authentication tokens, tracking sessions.
  Limitations: Size is limited (typically 4KB), and they can pose security and privacy concerns if not handled correctly.

```mermaid
sequenceDiagram
    participant Client
    participant Server

    Client->>Server: HTTP Request (initial visit)
    Note over Server: Server decides to set a cookie
    Server->>Client: HTTP Response with Set-Cookie header
    Note over Client: Client stores the cookie
    Client->>Server: Subsequent HTTP Request with cookie
    Note over Server: Server reads cookie and personalizes response
    Server->>Client: Personalized HTTP Response
```

### Server-Side Sessions

- Server stores session data, and a session identifier is typically sent to the client (often in a cookie or in HTTP headers/URL query params).
- Can be used for user authentication and storing for user-specific data while the user navigates the application.
- Requires server resources and proper management to ensure scalability and security.

```mermaid
sequenceDiagram
    participant Client
    participant Server
    participant SessionStore

    Client->>Server: HTTP Request (initial visit)
    Note over Server: Server creates a session
    Server->>SessionStore: Create new session data
    Note over SessionStore: Stores session data
    Server->>Client: HTTP Response with session ID ( e.g. cookie)
    Note over Client: Client stores session ID
    Client->>Server: Subsequent HTTP Request with session ID
    Server->>SessionStore: Retrieve session data
    Note over Server: Server personalizes response
    Server->>Client: Personalized HTTP Response
```

### URL Parameters and Query Strings

- Passing state information in URLs as query strings. For example: `https://example.com/app?user=johndoe&theme=dark`.
- Maintaining state across different pages without needing server or client-side storage, such as filtering or search parameters.
- Visible to users, can be modified, and have length limitations.

### Hidden Form Fields

- Storing state information in hidden fields within HTML forms. For example:

  ```html
  <form action="https://example.com/app">
    <input type="hidden" name="user" value="johndoe">
    <input type="hidden" name="theme" value="dark">
    <input type="submit" value="Submit">
  </form>
  ```

- Maintaining state across form submissions.
- Only applicable for state that needs to persist across form submissions.

### Token-Based Authentication

- Tokens (e.g. [JSON Web Tokens (JWT)](https://jwt.io/)) are used to maintain user state and authentication information.
    - usually used for authentication and authorization purposes, especially in Single Page Applications (SPAs) and API services.
- Consider security in storing and transporting tokens, typically requires HTTPS.

The process of authentication using JWT and subsequent requests with the token in typical client-server interaction:

```mermaid
sequenceDiagram
    participant Client
    participant Server
    participant AuthServer

    Client->>Server: HTTP Request with Credentials (login)
    Note over Server: Validates credentials
    Server->>AuthServer: Request for JWT
    Note over AuthServer: Creates and signs JWT
    AuthServer->>Server: JWT
    Server->>Client: HTTP Response with JWT
    Note over Client: Stores JWT (usually in memory)
    
    Client->>Server: Subsequent HTTP Request with JWT in header
    Note over Server: Verifies JWT
    alt JWT valid
        Server->>Client: Authorized Response
    else JWT invalid or expired
        Server->>Client: Unauthorized Response
    end
```
--- 

## Bcrypt

- Bcrypt is a password-hashing function designed to be slow and computationally intensive to protect against brute-force attacks.
- Bcrypt is a one-way hash function, meaning that it is not possible to reverse the hash to obtain the original password.
- Bcrypt is commonly used for securely storing passwords in databases.
- Usage in Node.js: [bcrypt](https://www.npmjs.com/package/bcrypt)

---

### Client-Side State Management

- Web Storage API
    - Local Storage: Stores data with no expiration date, and it's accessible across browser sessions.
    - Session Storage: Similar to Local Storage but limited to a single session. The data is cleared when the page session ends.
    - Storing user data like settings, application state, and other temporary data that doesn’t need to persist long-term.
    - Data is only accessible on the client side and limited to about 5 MB.
- Client-Side Frameworks and Libraries like React (with Context API or Redux), Angular (with services), Vue.js (with Vuex) provide their own mechanisms for maintaining state on the client side.

### State in Express

Express is a minimalistic framework that does not provide any built-in mechanisms for maintaining state. However, it is easy to implement your own state management using cookies, sessions, or other methods.

- **Cookies:** you can use the [cookie-parser](https://expressjs.com/en/resources/middleware/cookie-parser.html) middleware to parse cookies from the request headers, and then use the [`res.cookie`](https://expressjs.com/en/api.html#res.cookie) to set cookies in the response headers. ([Tutorialspoint cookie example](https://www.tutorialspoint.com/expressjs/expressjs_cookies.htm)).
- **Sessions:** you can use the [express-session](https://expressjs.com/en/resources/middleware/session.html) middleware to manage sessions. ([Tutorialspoint session example](https://www.tutorialspoint.com/expressjs/expressjs_sessions.htm)).
- **Token-Based Authentication:** you can use the [jsonwebtoken](https://www.npmjs.com/package/jsonwebtoken) package to generate and verify JWT tokens. Or the ready-made [express-jwt](https://www.npmjs.com/package/express-jwt) middleware.

## User Authentication and Authorization with JWT in Express

- **Authentication** is the process of verifying the identity of a user.
- **Authorization** is the process of verifying that the user has access to the requested resource.

In web applications, authentication is typically done by verifying a username and password combination. Authorization is typically done by checking the user's role or permissions.

### Assignment

1. Create new branch `Assignment6` based on `main`
2. Install [jsonwebtoken](https://www.npmjs.com/package/jsonwebtoken)
3. Install [bcrypt](https://www.npmjs.com/package/bcrypt)
4. Generate a secret key for signing the tokens and store it in the `.env` file: `JWT_SECRET=...`
    - use a long random string, e.g. from [random.org](https://www.random.org/strings/)
    - or use the `crypto` module to generate a random string
5. Modify `postUser()` in `user-controller.js` to hash the password before saving it to the database:
    
    ```js
    import bcrypt from 'bcrypt';
    ...
   const postUser = async (req, res) => {
      // modify req.body.password:
      req.body.password = bcrypt.hashSync(req.body.password, 10);
    ...
    ```
6. Create a new user and check that the password is hashed in the database.
7. Create a route `POST /api/auth/login` that accepts a username and password in the request body.
    - add a new route handler to `routes/auth-router.js`, controller method to `controllers/auth-controller.js`, and use the user model to query the database or create a new model for authentication.
8. In the user model implement a method for getting user by username and returning the user object if found:

   ```js
   ...
   const login = async (user) => {
       const sql = `SELECT *
                 FROM wsk_users 
                 WHERE username = ?`;
   ...
   ...
   ```

9. In the `auth-controller.js` implement token generation for the logged-in user, something like this:

    ```js
    import jwt from 'jsonwebtoken';
    import bcrypt from 'bcrypt';
    import {getUserByUsername} from '../models/user-model.js';
    import 'dotenv/config';
    
    const postLogin = async (req, res) => {
      console.log('postLogin', req.body);
      const user = await getUserByUsername(req.body.username);
      if (!user) {
        res.sendStatus(401);
        return;
      }
    
      if (!bcrypt.compareSync(req.body.password, user.password)) {
        res.sendStatus(401);
        return;
      }
      
      const userWithNoPassword = {
        user_id: user.user_id,
        name: user.name,
        username: user.username,
        email: user.email,
        role: user.role,
      };

      const token = jwt.sign(userWithNoPassword, process.env.JWT_SECRET, {
        expiresIn: '24h',
      });
      res.json({user: userWithNoPassword, token});
    };
    
    export {postLogin};
    ```

    - if the user is found, `jsonwebtoken` is used to generate a JWT token and then token is sent back to the client along with the user object.
    - Remember to not send the password back to the client.

10. Create a middleware for handling requests to endpoints where authentication is needed `middlewares.js`

     ```js
     import jwt from 'jsonwebtoken';
     import 'dotenv/config';
    
     ...
    
     const authenticateToken = (req, res, next) => {
       console.log('authenticateToken', req.headers);
       const authHeader = req.headers['authorization'];
       const token = authHeader && authHeader.split(' ')[1];
       console.log('token', token);
       if (token == null) {
         return res.sendStatus(401);
       }
       try {
         res.locals.user = jwt.verify(token, process.env.JWT_SECRET);
         next();
       } catch (err) {
         res.status(403).send({message: 'invalid token'});
       }
     };

     export {authenticateToken, andOthersIfYouHave};
     ```

11. Add a new route handler for `GET /api/auth/me` that returns the user object based on the token in the request header:

     ```js
     // controller:
     const getMe = async (req, res) => {
       console.log('getMe', res.locals.user);
       if ( res.locals.user) {
         res.json({message: 'token ok', user:  res.locals.user});
       } else {
         res.sendStatus(401);
       }
     };
    
     // router:
     ...
     import {getMe, postLogin} from '../controllers/auth-controller.js';
     import {authenticateToken} from '../middlewares/authentication.js';
     ...
     authRouter.route('/me').get(authenticateToken, getMe);
     ...
     ```

12. Test login and the protected route with Postman or VS Code REST Client:

     ```http
     ### Post login
     POST http://localhost:3000/api/v1/auth/login
     content-type: application/json

     {
       "username": "JohnDoe",
       "password": "to-be-hashed-pw1"
     }
     ```

     - Check the response and copy the token from the response body.

     ```http
     ### Get my user info
     GET http://localhost:3000/api/v1/auth/me
     Authorization: Bearer <put-your-token-from-login-response-here>
     ```

     - or test with Postman (just set 'Bearer token' on 'Authorization' tab after succesful login POST).

13. Now you can use the authentication middleware with any route where needed.
     - Information about the authenticated user is passed to the controller in `res.locals.user` object.

14. Implement authorization for protected routes, e.g.:
     - `PUT /api/cat/:id` - only file owner can update cats
     - `DELETE /api/cat/:id` - only file owner can delete cat
     - `PUT /api/users/` - users can update only their own user info
     - and so on...
     - describe your rules in report/readme/docs
15. Implement user roles (e.g. admin, user) with different permissions (role based resource authorization)
     - Regular users can only delete and edit their own userdata and cats.
         - Modify the `DELETE` and `UPDATE` SQL queries in models so that queries will also check that the owner of the item (user_id) matches the `owner` property in the `req.locals.user` object. `req.locals.user` is decoded from the token and needs to be passed as a parameter from controller to corresponding model method.
     - Admin level users can update or delete any cat, user info, etc.
         - Add second `DELETE` and `UPDATE` SQL queries into model functions that do not check the `user_id` property when role is admin.
         - Use e.g. conditional statements in the models to decide which SQL query to use based on the user level.
16. Test the authorization rules with Postman or VS Code REST Client.
17. Commit your changes to version control.
18. Merge the `Assignment6` branch to the `main` branch and push the changes to the remote repository.
