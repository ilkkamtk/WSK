# Routing

Routing in full-stack development refers to the process of directing network requests from a client to the appropriate
resources on a server or within a web application.

## Routing in Full-Stack Development

- **Path Navigation:** Routing manages how a web application responds to different URLs or paths requested by a client (usually a web browser).
- **Client-Side and Server-Side Routing:** In full-stack development, routing occurs both on the client side (in the
  browser) and the server side (on the server handling requests).

## Client-Side Routing

- **Client-Side Routing:** In client-side routing, the navigation and rendering of different views or components within
  a web application are handled by the browser. This often involves JavaScript frameworks like React, Angular, or
  Vue.js.
- **Changing Views without Full Page Reload:** Client-side routing enables seamless navigation within a web app by
  updating the URL and rendering content dynamically without reloading the entire page.

## Server-Side Routing

- **Server-Side Routing:** This refers to the process on the server that directs incoming requests to the appropriate
  resources or endpoints based on the requested URL.
- **Handling API Endpoints:** In server-side routing, requests to specific URLs or routes trigger different functions or
  controllers that process data, interact with databases, or perform other actions.

## Benefits and Importance

- **Organizing Application Logic:** Routing helps in organizing the application's structure by defining how different
  URLs correspond to various functionalities or views.
- **Separation of Concerns:** It promotes a separation of concerns, allowing developers to manage different parts of the
  application's functionality separately.

## Middleware and Routing

- **Middleware Integration:** Routing often involves the use of middleware, which intercepts requests, performs
  operations, or adds functionality before passing the request to the appropriate route handler.
- **Security and Authorization:** Middleware can be used in routing to enforce security measures, authentication, or
  authorization checks before allowing access to certain routes.

## Routing in React

Navigation is an essential part of any user interface. In React, mapping URLs to specific views, components or pages is called routing.

Routing involves managing navigation from one view or component to another within a single-page application (SPA), without the need for traditional page reloads that you would see in multi-page websites. React itself doesn't come with built-in routing capabilities. Instead, routing is implemented using third-party libraries, with React Router being one of the most popular choices.

## React Router

[React Router](https://reactrouter.com/) is a declarative routing library for React, allowing you to create navigable components in your application. It enables the browser's history API to update the URL and keeps your UI in sync with the URL.

### Example

In a simple React application with React Router, you might have a layout with a navigation bar and several pages represented by components like `Home`, `About`, and `Users`.

```jsx
import {BrowserRouter, Routes, Route, Link} from 'react-router';

const App = () => {
  return (
    <BrowserRouter>
      <div>
        <nav>
          <ul>
            <li><Link to="/">Home</Link></li>
            <li><Link to="/about">About</Link></li>
            <li><Link to="/users">Users</Link></li>
          </ul>
        </nav>

        {/* Define the routes */}
        <Routes>
          <Route path="/about" element={<About />} />
          <Route path="/users" element={<Users />} />
          <Route path="/" element={<Home />} />
        </Routes>
      </div>
    </BrowserRouter>
  );
};
// Very simple view components
const Home = () => <h2>Home Page</h2>;
const About = () => <h2>About Page</h2>;
const Users = () => <h2>Users Page</h2>;

export default App;
```

- BrowserRouter: This component uses the HTML5 history API to keep your UI in sync with the URL. It should wrap your route definitions, usually at the root of your application. In this example, the `App` component wraps everything in a `<Router>` to provide routing functionality.
- Inside the `App`, a navigation bar is defined using `<Link>` components to enable navigation without page reloads.
- The `<Routes>` component contains multiple `<Route>` components, each mapping a path to a component.
- When the URL matches a path defined in one of the `<Route>` components, the corresponding component is rendered. For example, navigating to `/about` will render the `<About />` component.

### Example of nested routes with Outlet

The `<Outlet>` component is part of React Router (version 6 and above) and serves as a placeholder for nested routes. It allows you to render child routes at a specific location within a parent component. This feature is particularly useful when creating layouts or sub-routes within your application, as it provides a way to compose your component hierarchy more dynamically.

When you define nested routes in React Router, the child route's component gets rendered where the parent route's component has an `<Outlet>`. This means you can set up a common layout or structure in a parent component (like a navigation bar, sidebar, or footer), and use `<Outlet>` to indicate where the child routes should be rendered within that structure.

Consider an application with a common layout for several sections, each with its own set of sub-pages. You can use `<Outlet>` in the layout component to render these sub-pages.

First, define your routes with nesting:

```jsx
import { BrowserRouter, Routes, Route } from 'react-router';

const App = () => (
  <BrowserRouter>
    <Routes>
      <Route path="/" element={<Layout />}>
        <Route index element={<HomePage />} />
        <Route path="about" element={<AboutPage />} />
        <Route path="contact" element={<ContactPage />} />
        {/* Add more nested routes as needed */}
      </Route>
    </Routes>
  </BrowserRouter>
);
```

`Layout` is the parent component that includes the `<Outlet>`, and `HomePage`, `AboutPage`, and `ContactPage` are child routes that will be rendered inside `Layout` where the `<Outlet>` is placed.

`Layout` component with `<Outlet>`:

```jsx
import { Outlet } from 'react-router';

const Layout = () => (
  <div>
    <header>
      {/* Navigation bar, logo, etc. */}
    </header>
    <main>
      <Outlet /> {/* Child routes render here */}
    </main>
    <footer>
      {/* Footer content */}
    </footer>
  </div>
);
```

`<Outlet />` is placed within the `<main>` tag. This setup means that when a user navigates to `/about`, the `AboutPage` component will be rendered inside the `<main>` element of the Layout component, utilizing the same navigation bar and footer defined in Layout.

Benefits of Using Outlet:

- Simplifies Layout Management: Allows for a single, shared layout component for multiple routes, reducing redundancy and improving consistency across your application.
- Enhances Component Composition: Facilitates a more intuitive and hierarchical organization of components, making the component tree easier to manage and understand.
- Flexible Rendering: Nested routes can be easily adjusted or rearranged without major changes to the layout or parent components, offering greater flexibility in how content is presented.

---

## Assignment: Implementing Routing with React Router

Study: [React Router Tutorial](https://reactrouter.com/7.5.0/tutorials/address-book)

1. Create a git branch `routing` based on the previous exercise and checkout to it.
1. Install React Router: `npm install react-router`
1. Create a new folder `src/views` and move the `Home` component to it.
1. Create new components `Profile`, `Upload` and `Single` and place them in the `src/views` folder.
   - Add just some placeholder JSX to the components for now. (snippet: `rafcp`)
1. Create a `Layout` component in `src/components` folder. This is the shared layout for all views.
   - Add a navigation bar with Links to `Home`, `Profile` and `Upload` components.
   - Add a `<Outlet>` component to the `Layout` component for rendering child routes/views.

    ```jsx
    <div>
      <nav>
        <ul>
          <li>
            <Link to="/">Home</Link>
          </li>
          <li>
            <Link to="/profile">Profile</Link>
          </li>
          <li>
            <Link to="/upload">Upload</Link>
          </li>
        </ul>
      </nav>
      <main>
        <Outlet />
      </main>
    </div>
    ```

1. In `App.jsx`, replace the `Home` component with `BrowserRouter`, `Routes` and `Route` components.

   - `BrowserRouter` is imported from `react-router` and wraps the `Routes` component.
   - import `Layout`, use it as a parent `Route` for the view `Route`s
   - import all view components and add as `Route`s inside the parent layout `Route` component.
   - `Route` `path` props should match the `to` props of the `Link` components in the `Layout` component.

    ```jsx
    import {Route, BrowserRouter, Routes} from 'react-router';
    import Layout from './views/Layout';
    import Home from './views/Home';
    ...

    const App = () => {
      return (
        <BrowserRouter>
          <Routes>
            <Route element={<Layout />}>
              <Route path="/" element={<Home />} />
              {/* TODO: add missing routes */}
            </Route>
          </Routes>
        </BrowserRouter>
      );
    };
    ```

1. Replace the `<dialog>` based `SingleView` component with the `Single` component in `views` folder.
    - Idea is to use router to display the `Single` component when a user clicks a media item in the `MediaRow` component.
    - In `MediaRow` component, use `Link` component istead of `<button>` to navigate, item object can be passed as [`state`](https://reactrouter.com/en/main/components/link#state) prop to the `Link` component:

    ```jsx
    <Link to="/single" state={{item}}>Show</Link>
    ```

1. Copy the JSX needed for displaying the media item from `components/SingleView.jsx` to `views/Single.jsx` and modify it to use the `item` from `useLocation().state` instead of `selectedItem` state variable.

    ```jsx
    import {useLocation} from "react-router";

    const Single = () => {
      const {state} = useLocation();
      const item = state.item;
      ...
      // TODO: Return JSX for displaying a mediafile here
      ...
    ```

1. You can navigate back to listing with browser's back button or by using React Router's [`useNavigate`](https://reactrouter.com/en/main/hooks/use-navigate) hook with a button (more about hooks in the next week):

    ```jsx
    import {useNavigate} from "react-router";
    ...

    const Single = () => {
      const navigate = useNavigate();
      ...
      <button onClick={() => navigate(-1)}>Go back</button>
      ...
    ```

### Build and publish the app

1. Check [Building for Production](https://vitejs.dev/guide/build)
1. To fix the paths for `assets` and navigation in production build, set the _public base path_ e.g. by adding `base` property to `vite.config.js`:

    ```js
    ...
    export default defineConfig({
      plugins: [react()],
      base: '/~your-username/routing/',
    });
    ```

| :exclamation:  Note! The trailing slash must exist in the `base` path, otherwise issues will arise.   |
|--|

    Then add the same path to the `basename` prop of the `BrowserRouter` component in `App.jsx` by reading it from the config:

    ```jsx
    <BrowserRouter basename={import.meta.env.BASE_URL}>
    ```

    

1. Run `npm build` or `npm run build`
1. Copy contents of build folder (`dist/*`) to your home dir's `public_html/wsk-routing/` (shell.metropolia.fi)
    - Can be done with scp tool in terminal: `scp -r dist/* your-username@shell.metropolia.fi:~/public_html/wsk-routing/`
1. Test your app: <https://users.metropolia.fi/~your-username/wsk-routing/>
1. Modify `README.md`. Add a text paragraph and link: `Open [link text here](https://users.metropolia.fi/~your-username/wsk-routing/) to view it in the browser.`
1. git add, commit & push current branch to the remote repository (GitHub)
1. Submit the link to correct branch of your repository to Oma
