# Custom Hooks

## Custom Hooks in React

- [Custom hooks](https://react.dev/learn/reusing-logic-with-custom-hooks) are functions that can use React hooks
- Custom hooks can be used to share logic between components. In other words to create reusable logic
- Custom hooks can be used to abstract away complex logic, which means that your components can be more readable and
  easier to maintain when the business logic is separated from the component

## Rules of Custom Hooks

- Custom hooks must start with the word `use`
- Custom hooks can only call other hooks

## Lab assignment 1

1. Continue last exercise. Create a new branch 'custom-hooks' with git.
2. Create `hooks` folder in the `src` of your project. Add `apiHooks.js` file to the `hooks` folder.
3. The idea is to make hooks for each path in the APIs we are using: login, users, media, etc.
4. Create a custom hook `useMedia` to `apiHooks.js` and move the functionalities from `Home.jsx` that are used to fetch media from the APIs to the useMedia hook:

   ```jsx
   // TODO: add necessary imports
   const useMedia = () => {
   // TODO: move mediaArray state here
   // TODO: move getMedia function here
   // TODO: move useEffect here
   return {mediaArray};
   };
   
   export {useMedia};
   ```

5. `Home` component after refactoring:

   ```jsx
   const Home = () => {
        const [selectedItem, setSelectedItem] = useState(
        null,
    );
    
        const {mediaArray} = useMedia();
    
        return (
            <>
                <SingleView item={selectedItem} setSelectedItem={setSelectedItem} />
                <table>
                    <tbody>
                        {mediaArray.map((mediaItem) => (
                            <MediaRow
                                key={mediaItem.media_id}
                                item={mediaItem}
                                setSelectedItem={setSelectedItem}
                            />
                        ))}
                    </tbody>
                </table>
            </>
        );
    };
   ```

6. The app should work as before. Test it.
7. Git add, commit and push the changes to your repository.

**(If we have time, we can refactor the other functionalities to custom hooks as well. For example, useUser hook for the user functionalities: `getUserByToken()`, `postUser()` etc. )**

## Submit

1. Run `npm build` or `npm run build`
2. Move build folder to your public_html
3. Test your app: `http://users.metropolia.fi/~username/custom-hooks`
4. Modify README.md. Change the link in `Open [X](X) to view it in the browser.` to point to the above link.
5. git add, commit & push to remote repository
6. Submit the link to correct branch of your repository to Oma
