# Forms in React

- There are many ways to handle forms in React. Most common way is to use a third party library like `react-hook-form` or `Formik`. These libraries provide a lot of functionality out of the box and are easy to use. However, it is good to know how to handle forms without these libraries as well. We will start with `useState` hook with our own custom hook, and later we will look at `react-hook-form`.

## useState with forms

Study [useState with forms](https://www.youtube.com/watch?v=R7T5GQLxRD4)

## Lab assignment 1

1. Continue last exercise. Create a new branch 'forms' with git.
2. Create files:
    - `Login.jsx` and `Logout.jsx` to `views`
    - `formHooks.js` to `hooks`
    - `LoginForm.jsx` and `RegisterForm.jsx` to `components`
3. _Login.jsx_ will hold LoginForm and RegisterForm components
    - Add the usual imports, component function and export to Login.jsx, LoginForm.jsx and RegisterForm.jsx
    - _Login.jsx_:

    ```jsx
    // imports
   
    const Login = () => {
      return (
        <>
          <LoginForm/>
          <RegisterForm/>
        </>
      );
    };
    
    export default Login;
   ```

4. Add `login` to routing in App.jsx
    - Add `Login` to imports
    - Add `<Route path="/login" element={<Login/>}/>` to `Routes`
    - Add `<Link to="/login">Login</Link>` to `Nav` in `Layout.jsx`
5. Do the same for `Logout.jsx` and `logout` route
6. Add `<form>` to LoginForm.jsx with username and password fields and submit button:

   ```jsx
   // LoginForm.jsx
   const LoginForm = () => {
        return (
            <>
                <h1>Login</h1>
                <form onSubmit={ () => {} }>
                     <div>
                         <label htmlFor="loginuser">Username</label>
                        <input
                            name="username"
                            type="text"
                            id="loginuser"
                            onChange={ () => {} }
                            autoComplete="username"
                        />
                    </div>
                    <div>
                        <label htmlFor="loginpassword">Password</label>
                         <input
                            name="password"
                            type="password"
                            id="loginpassword"
                            onChange={ () => {} }
                            autoComplete="current-password"
                        />
                    </div>
                    <button type="submit">Login</button>
                </form>
            </>
        );
   };
   ```

7. In `formHooks.js` create a new hook `useForm`:

   ```javascript
   import {useState} from 'react';

   const useForm = (callback, initState) => {
        const [inputs, setInputs] = useState(initState);

        const handleSubmit = (event) => {
            if (event) {
                event.preventDefault();
            }
            callback(); 
        };

        const handleInputChange = (event) => {
            event.persist();
            console.log(event.target.name, event.target.value);
            setInputs((inputs) => ({
                ...inputs,
                [event.target.name]: event.target.value,
            }));
        };
   
        return {
            handleSubmit,
            handleInputChange,
            inputs,
        };
   };
   
   export default useForm;
   ```

    - What is happening here:
        - `useForm` takes two parameters: a callback function and an initial state object
            - The callback function is called when the form is submitted. That function is made in E.g. LoginForm to send the form data to the API. See `handleSubmit` below.
        - `handleSubmit` is a function that prevents the default form submission and then calls the callback function
        - `handleInputChange` is a function that takes an event as a parameter and updates the state
            - Note that the argument for `setInputs` is a function. This is because we need to add to the existing state, not replace it.

8. Then in LoginForm add these to the component function:

   ```javascript
   const initValues = {
      username: '',
      password: '',
   };
   
   const doLogin = () => {
     console.log(inputs);
     // TODO: add login functionalities here
   };
   
   const {inputs, handleInputChange, handleSubmit} = useForm(doLogin, initValues);
   
   console.log(inputs);
   ```

9. Add `handleInputChange` and `handleSubmit` to the `<form>` and `<input>` components. Which one goes where?
10. Test the form. Check the console. What is happening?
11. In APiHooks.js create a new hook `useAuthentication`. Create `postLogin` function to `useAuthentication`:

     ```javascript
     const postLogin = async (inputs) => {
       const fetchOptions = {
         method: 'POST',
         headers: {
           'Content-Type': 'application/json',
         },
         body: JSON.stringify(inputs),
       };
       const loginResult = await fetchData(import.meta.env.VITE_AUTH_API + '/auth/login', fetchOptions);
       return loginResult;
     };
     ```

    - Make `doLogin` function call `postLogin` and pass the form data as a parameter. Then `postLogin` should log the
      result to the console. 
       - Register new user using Postman. Endpoint: `https://media2.edu.metropolia.fi/auth-api/api/v1/users`.
       - [Documentation](https://https://media2.edu.metropolia.fi/auth-api/#api-User-CreateUser).
    - remember to handle errors from promises with try/catch
12. When logging in, save token to [localStorage](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage). Also [redirect](https://tylermcginnis.com/react-router-programmatically-navigate/) to 'Home'
13. display user's info (username, email etc.) in Profile.js. For this functionality you need to add a new hook `useUser` to `apiHooks`. Create a new function `getUserByToken` to `useUser` hook. `getUserByToken` should get the user data from the Auth API from this endpoint: [/users/token](http://media.mw.metropolia.fi/wbma/docs/#api-User-GetCurrentUser). Use the token from localStorage as a parameter for the `fetchData` function. Then use `getUserByToken` in Profile.js to get the user data and display it.
14. Make `RegisterForm` component have similar functionality as `LoginForm`, but it should create a new user, so it also features an `email` field. Use the same `useForm` hook to get the values from input fields.
    - Instead of `doLogin` use `doRegister` as the name for the function that is called when the form is submitted.
    - Create `postUser` function to `useUser` hook. `postUser` should post the form data to the Auth API to this endpoint: [/users](http://media.mw.metropolia.fi/wbma/docs/#api-User-CreateUser).
    - Then `doRegister` should log the result to the console.
15. Use conditional rendering to show either `LoginForm` or `RegisterForm` in `Login.jsx`. Add a button to switch between the two forms.

## Submit

1. Run `npm build` or `npm run build`
2. Move build folder to your public_html
3. Test your app: `http://users.metropolia.fi/~username/forms`
4. Modify README.md. Change the link in `Open [X](X) to view it in the browser.` to point to the above link.
5. git add, commit & push to remote repository
6. Submit the link to correct branch of your repository to Oma
