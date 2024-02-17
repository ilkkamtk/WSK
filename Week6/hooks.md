# React Hooks

## Hook

The term hook often implies a mechanism for extending or customizing behavior by attaching or associating code with
specific events or points in the program's execution.

## React Hooks

- [React Hooks ](https://react.dev/reference/react/hooks)are functions that let us hook into the React state and lifecycle features from function components.
- Hooks promote code reuse and organization by allowing logic to be extracted and shared across components.
- Hooks are a more direct way to use the React features such as state, lifecycle, context, and refs. E.g.:
    - `useState` for managing state
    - `useEffect` for handling side effects
        - A side effect refers to any external operation, such as data fetching or DOM manipulation, initiated by a
          component that occurs outside the usual component rendering process.
    - `useContext` for sharing state between components
- Hooks can be used in components or other hooks.
- Example of `useState`, `useEffect` and `useRef` hooks:

```tsx
import { useState, useEffect, useRef } from 'react';

function Example() {
    const [count, setCount] = useState<number>(0);
    const testElement = useRef<HTMLDivElement>(null);

    useEffect(() => {
        // Update div element's color based on count
        testElement.current?.style.setProperty('color', `rgb(${count * 5}, 0, 0)`);
    }, [count]); // Only re-run the effect if count changes

    return (
        <div ref={testElement}>
            <p>You clicked {count} times</p>
            <button onClick={() => setCount(count + 1)}>Click me</button>
        </div>
    );
}

export default Example;
```

## Rules of Hooks

- Hooks are JavaScript/TypeScript functions, but they impose additional rules:
    - Hooks should be called at the top level of a React function component or a custom hook, not inside nested functions, conditions, or loops.
    - Only call Hooks from React components or custom Hooks. Don't call Hooks from regular JavaScript functions.
    - Hooks start with the word `use` so that React knows to treat them as Hooks.

## useState

- `useState` is a Hook that lets you add React state to function components.
    - state is a data structure that represents the parts of the app that can change.
    - The name "React" comes from the fact that React components are reactive, i.e., they react to state changes. So
      when you want to update the UI, you simply update the state, and React will automatically render the UI.
- `useState` returns a pair of values: the current state and a function that updates it.
- Example:

```tsx
import {useState} from 'react';

function Example() {
    const [name, setName] = useState<string>('');

    return (
        <div>
            <p>You entered: {name}</p>
            <input
                type="text"
                value={name}
                onChange={(e) => setName(e.target.value)}
            />
        </div>
    );
}

export default Example;
```

### useState with TypeScript

- When using `useState` with TypeScript, you need to specify the type of the state variable.
- Example:

```tsx
const [name, setName] = useState<string>('');
```

- If the initial state is `null` or `undefined`, you need to specify the type as `string | null`
  or `string | undefined`.
- Example:

```tsx
const [name, setName] = useState<string | null>(null);
```

- When the initial state is `null` or `undefined` you need to check for null/undefined before using the state variable.
  E.g.:

```tsx
import {useState} from 'react';

function Example() {
    const [name, setName] = useState<string | null>(null);

    return (
        <div>
            <p>You entered: {name}</p>
            <input
                type="text"
                value={name ? name : ''} // Check for null/undefined
                onChange={(e) => setName(e.target.value)}
            />
        </div>
    );
}

export default Example;
```

## useEffect

- `useEffect` is a Hook that lets you perform side effects in function components.
- Side effects are operations that affect other components or the outside world and can include data fetching, setting
  up a subscription, and manually changing the DOM.
- `useEffect` runs after the component renders and after every re-render.
- `useEffect` takes a function as an argument. This function is the effect.
- Second argument to `useEffect` is an array of values (dependencies). If any of the values change, the effect is
  re-run. If the array is empty, the effect is only run once, after the initial render. If you omit the second argument,
  the effect is run after every render which is not recommended.
    - **Infinte re-renders can occur** if there is a problem with the dependencies. E.g., if you forget to add the
      dependencies to the array or if you add a dependency that changes every time the component renders.
- You can have multiple `useEffect` hooks in a component.
- Cleanup function can be returned from the effect. This function runs before the component is removed from the UI to
  prevent memory leaks.
- Example of `useEffect` hook with cleanup function:

```tsx
import {useState, useEffect} from 'react';

function Example() {
    const [count, setCount] = useState<number>(0);

    useEffect(() => {
        const timer = setTimeout(() => {
            setCount((prevCount) => prevCount + 1);
        }, 1000);
        return () => clearTimeout(timer);
    }, [count]);

    return <div>{count}</div>;
}

export default Example;
```

- In the example the cleanup function is used to clear the timer when the component is removed from the UI. Without it
  the timer would continue to run and cause a memory leak. To test it without the cleanup function, remove
  the `return () => clearTimeout(timer);` line. You will see in the console that the timer continues to run even after
  the component is removed from the UI (e.g., if you navigate to another page and then back to the page with the timer).
- Typical situations where cleanup functions are used:
    - Timers
    - Event listeners
    - Subscriptions
        - the term subscription refers to a mechanism for receiving notifications when new data is available. To use
          subscriptions you would need to use a library such as [RxJS](https://rxjs.dev/) which is not covered in this
          course.

## useRef
- `useRef` is usually used to access DOM elements or to store mutable values.
   - in React you should avoid using DOM-related APIs directly, such as `document.getElementById` or `document.querySelector`
- `useRef` can also be used to store mutable values that are not part of the state like the previous value of a prop or state
  variable. When the value changes, the ref will not re-render the component.
- `useRef` returns a mutable ref object whose `.current` property is initialized to the passed argument (`initialValue`). For example:
   - `const someHTMLElement = useRef<HTMLDivElement>(null);`
   - `someHTMLElement.current` can then be used to access the DOM element.

## Lab assignment 1

1. Continue last exercise. Create a new branch 'hooks' with git.
2. Delete the hard coded `mediaArray` from `Home`component.
    - The data for the media items will be fetched from a static JSON file using
      the [fetchData](https://gist.github.com/ilkkamtk/0ef1b6b740e8f3a23a3fce2bd8233bd5) function and the `useEffect`
      hook.
3. Create a new state `mediaArray` and a function `setMediaArray` using the `useState` hook:
    - `const [mediaArray, setMediaArray] = useState<MediaItem[]>([]);`
    - The initial value of the state is an empty array.
    - The type of the state is `MediaItem[]` which is an array of `MediaItem` objects.
4. Create a new function `getMedia` that fetches the media items from the JSON file using the `fetchData` function and
   updates the `mediaArray` state using the `setMediaArray` function.
    - Download [test.json](https://gist.github.com/ilkkamtk/9b935c507d1f5b67ada63169e76009f1) and save it to
      the `public` folder.
    ```tsx
    const getMedia = async () => {
       const json = await fetchData<MediaItem[]>('test.json');
       setMediaArray(json);
   };
   getMedia();
   
   console.log(mediaArray);
    ```
5. Open the browser console and check that the media items are logged to the console. What do you notice?
    - The `getMedia` function is called every time the component renders. Why?
6. The function should be called from a `useEffect` hook.
    - The function should be called only once, after the initial render. So the second argument of the `useEffect` hook
      should be an empty array (for now):
    ```tsx
    useEffect(() => {
        getMedia();
    }, []);
    ```
7. Check that the media items are logged to the console only once. (Or actually twice, because the React is in
   development mode.)
8. Use try/catch to catch errors in the `getMedia` function.
    - If an error occurs, log the error to the console.
9. Git add, commit & push to remote repository

## Lab assignment 2

1. Continue last exercise. Now we get the data from the Media API.
2. Add and edit `.env.local` file to include `VITE_MEDIA_API=https://osotetähän` environment variable.
3. Replace `test.json` with `import.meta.env.VITE_MEDIA_API + '/media'` in `getMedia` function.
4. Next we want to display the owner's username with the media item. The owner's id is in the media item, but we need to
   fetch the username from the User API.
5. Edit `.env.local` to include `VITE_AUTH_API=https://osotetähän` environment variable.
6. Each media item has `user_id` property, which means that we need to make multiple requests to the API. We can
   use [Promise.all](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/all) to
   make multiple requests and combine the results to a single array. Example:

   ```tsx
    const newArray:Type[] = Promise.all<Type>(array.map(async (item) => {
        const result = await fetchData<Type>(url + item.id);
        return result;
    }));
   
   console.log(newArray);
   ```

7. Use the example above to get the user data for each media item and add it to the media item. Promise.all should return
   an array of media items with user data. The type of the array is `MediaItemWithOwner`.
    - You can do this in the `array.map` part of the `Promise.all` function.
    - Consider what type is returned from the `fetchData` function, and what type is returned from the `Promise.all`
      function. Then you can use object spread to add the user data to the media
      item: `{ ...item, username: result.username }`.
8. Use the `setMediaArray` function to update the `mediaArray` state with the new array. Note that the type of the state
   is now `MediaItemWithOwner[]`, so you need to change the type of the state and also fix the types in all components that use the state.
9. Add the owner's username to the `MediaItemCard` and `Single`/`SingleView` components.

## Submit
1. Run `npm build` or `npm run build`
2. Move build folder to your public_html
3. Test your app: `http://users.metropolia.fi/~username/hooks`
4. Modify README.md. Change the link in `Open [X](X) to view it in the browser.` to point to the above link.
5. git add, commit & push to remote repository
6. Submit the link to correct branch of your repository to Oma

