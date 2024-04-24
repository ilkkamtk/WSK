# Shared State

## Context

- Context is a way to share state between components without having to pass props down the component tree manually at
  every level.
- Context is designed to share data that can be considered “global” for a tree of React components, such as the current
  authenticated user, theme, or preferred language.
- Context is primarily used when some data needs to be accessible by many components at different nesting levels.
- There are other ways to share state between components, such as using [Redux](https://redux.js.org/) or [Zustand](https://github.com/pmndrs/zustand) if you need more advanced
  state management.

## Context API

- [Context](https://react.dev/learn/passing-data-deeply-with-context) is created with `createContext`.
- It returns a `Provider` component and a `Consumer` component.
- **Provider:**
    - The `Provider` is used to wrap components and share the context values down the component tree. The `useContext`
      hook relies on the existence of a `Provider` higher up in the component tree to obtain the context values.

- **Consumer:**
    - Is a bit deprecated. It is used to consume the context values. It is not used as much as it used to be, because
      the `useContext` hook is more convenient.

Example:

**MyContext.js:**

```jsx
import React, {createContext, useContext} from 'react';

const MyContext = createContext();

export const MyProvider = ({children}) => {
  const contextValue = "Hello from Context!";
  return (
      <MyContext.Provider value={contextValue}>
        {children}
      </MyContext.Provider>
  );
};

// Current recommendation is to use custom hook instead of the context directly:
export const useMyContext = () => useContext(MyContext);
```

**App.js:**

```jsx
import React from 'react';
import {MyProvider} from './MyContext';
import ComponentA from './ComponentA';
import ComponentB from './ComponentB';

function App() {
  return (
      <MyProvider>
        <ComponentA/>
        <ComponentB/>
      </MyProvider>
  );
}

export default App;
```

**ComponentA.js:**

```jsx
import React from 'react';
import {useMyContext} from './MyContext';

const ComponentA = () => {
  const contextValue = useMyContext();
  return <div>Consumed via useMyContext in ComponentA: {contextValue}</div>;
};

export default ComponentA;
```

**ComponentB.js:**

```jsx
import React from 'react';
import {useMyContext} from './MyContext';

const ComponentB = () => {
  const contextValue = useMyContext();
  return <div>Consumed via useMyContext in ComponentB: {contextValue}</div>;
};

export default ComponentB;
```

## Sharing state with context

- Context is often used to share state between components.
- In the following example we will create a context for the currently logged-in user.

```jsx
// UserContext.jsx
import {createContext, useContext, useState} from 'react';

const UserContext = createContext(null);

export const UserProvider = ({children}) => {
    const [user, setUser] = useState(null);

    return (
        <UserContext.Provider value={{user, setUser}}>
            {children}
        </UserContext.Provider>
    );
};

export const useUser = () => useContext(UserContext);
```

```jsx
// Profile.jsx
import {useUser} from '../contexts/UserContext';

const Profile = () => {
    const {user} = useUser();

    return (
        <div>
            {user &&
                <>
                    <h1>Profile</h1>
                    <p>Username: {user.username}</p>
                    <p>Email: {user.email}</p>
                </>
            }
        </div>
    );
};

export default Profile;
```

## Lab assignment 1

1. Continue last exercise. Create a new branch 'context' with git.
2. In this exercise we will use context to share the currently logged-in user between components. We will use the
   context to define is the user logged in or not and to show the appropriate links in the navigation and protect
   necessary routes.
3. We will use the `UserContext.jsx` file from the previous example as a starting point, but we will also add functions
   to the context to handle the login and logout functionalities.
4. Create `contexts` folder in the `src` of your project. Add `UserContext.jsx` file to the `contexts` folder.
    ```jsx
    // UserContext.jsx
    import { createContext, useState } from 'react';
    import { useAuthentication, useUser } from '../hooks/apiHooks';
    import { useNavigate } from 'react-router-dom';
    
    const UserContext = createContext(null);
    
    const UserProvider = ({ children }) => {
        const [user, setUser] = useState(null);
        const { postLogin } = useAuthentication();
        const { getUserByToken } = useUser();
        const navigate = useNavigate();
        
        // login, logout and autologin functions are here instead of components
        const handleLogin = async (credentials) => {
            try {
                // TODO: post login credentials to API
                // TODO: set token to local storage
                // TODO: set user to state
                // TODO: navigate to home
            } catch (e) {
                console.log(e.message);
            }
        };
        
        const handleLogout = () => {
            try {
                // TODO: remove token from local storage
                // TODO: set user to null
                // TODO: navigate to home
            } catch (e) {
                console.log(e.message);
            }
        };
        
        // handleAutoLogin is used when the app is loaded to check if there is a valid token in local storage
        const handleAutoLogin = async () => {
            try {
                // TODO: get token from local storage
                // TODO: if token exists, get user data from API
                // TODO: set user to state
                // TODO: navigate to home
            } catch (e) {
                console.log(e.message);
            }
        };
               
        return (
            <UserContext.Provider value={{ user, handleLogin, handleLogout, handleAutoLogin }}>
                {children}
            </UserContext.Provider>
        );
    };
    export { UserProvider, UserContext };
   ```
    - Note that in this case we don't make a custom hook in the context file, because linter will recommend to create
      the custom hook in a separate file.
5. Create `contextHooks.js` to `hooks` folder:
   ```jsx
   // contextHooks.js
   import { useContext } from 'react';
   import { UserContext } from '../contexts/UserContext';
    
   // Current recommendation is to use custom hook instead of the context directly
   // this way we don't have errors when UserContext is not defined or null (thats why we have the if statement)
    
   const useUserContext = () => {
       const context = useContext(UserContext);
       if (!context) {
           throw new Error('useUserContext must be used within an UserProvider');
       }
    
       return context;
   };
    
   export { useUserContext };
   ```
6. Add `UserProvider` to `App.jsx`:
   ```jsx
   // App.jsx
   import { UserProvider } from './contexts/UserContext';
    
   const App = () => {
     return (
         <Router>
           <UserProvider>
               ...
           </UserProvider> 
         </Router>
     );
   }
   ```
    - Note that the provider must be inside the Router and outside the Routes.
7. Now we can use the context in our components. For example in `LoginForm.jsx`:
   ```jsx
   // LoginForm.jsx
   import { useUserContext } from '../hooks/contextHooks';
   
   ...
   
   const { handleLogin } = useUserContext();
   
   const doLogin = async () => {
        try {
            handleLogin(inputs);
        } catch (e) {
            alert(e.message);
        }
    };
   ```

8. Use `handleLogout` in `Logout.jsx` to log out the user.
9. Use `handleAutoLogin` in `Layout.jsx` to check if there is a valid token in local storage when the app is loaded.
10. Also in `Layout.jsx` use the `user` from the context to show the appropriate links in the navigation.
11. Test the app. Check the console. What is happening? When you are logged out and write `/profile` to the address bar,
    what happens? You can still access the profile page, so we need to protect the route.
12. Add new component `ProtectedRoute.jsx` to `src/components` folder:
    ```jsx
    // ProtectedRoute.jsx
    import { Navigate, useLocation } from 'react-router-dom';
    import { useUserContext } from '../hooks/contextHooks';

    const ProtectedRoute = ({ children }) => {
        const { user } = useUserContext();
    
        if (!user) {
            return <Navigate to="/" />;
        }
    
        return children;
    };
    
    export default ProtectedRoute;
    ```
    - This component is used to protect routes that require the user to be logged in. If the user is not logged in, the
      component will redirect to the home page.
13. Use `ProtectedRoute` in `App.jsx` to protect the necessary routes:
    ```jsx
    // App.jsx
    import ProtectedRoute from './components/ProtectedRoute';
    
    ...
    
    <Route
        path="/profile"
        element={
            <ProtectedRoute>
              <Profile />
            </ProtectedRoute>
        }
    />
    ```
14. Test the app. When you are logged out and write `/profile` to the address bar, you can't access the profile page
    anymore.
15. Login, open one of the protected routes and then refresh the page. What happens? Why?
16. If you want to automatically redirect to the same page you can use the useLocation hook in ProtectedRoute:
    ```jsx
    // ProtectedRoute.jsx
    import { Navigate, useLocation } from 'react-router-dom';
    
    ...
    const location = useLocation();
    if (!user) {
        // console.log(user);
        // replace and state are used to redirect to origin when page is refreshed
        return <Navigate to="/" replace state={{ from: location }} />;
    }
    ...
    ```
    ```jsx
    // UserContext.jsx
    import { useLocation, useNavigate } from 'react-router-dom';
    
    ...

    const location = useLocation();
    
    ...
    
    const handleAutoLogin = async () => {
        try {
            const token = localStorage.getItem('token');
            if (token) {
                const userResult = await getUserByToken(token);
                setUser(userResult.user);
                // when page is refreshed, the user is redirected to origin (see ProtectedRoute.jsx)
                const origin = location.state.from.pathname || '/';
                navigate(origin);
            }
        } catch (e) {
            console.log(e.message);
        }
    };
    ```
    - Now when you refresh the page, you will be redirected to the same page.

## Submit

1. Run `npm build` or `npm run build`
2. Move build folder to your public_html
3. Test your app: `http://users.metropolia.fi/~username/context`
4. Modify README.md. Change the link in `Open [X](X) to view it in the browser.` to point to the above link.
5. git add, commit & push to remote repository
6. Submit the link to correct branch of your repository to Oma
