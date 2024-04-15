# Tailwind CSS

## What is Tailwind CSS?

- Tailwind CSS is a utility-first CSS framework for building custom user interfaces.
  - Utility-first means that you can use the classes to style your components. You don't need to write CSS yourself.
- It is not opinionated. Tailwind CSS doesn't tell you how your site should look like. You can use it to build your own
  design.
- However, it is not a UI kit. It doesn't provide you with ready-made components. You can use it to build your own
  components.
  - There are UI kits built with Tailwind CSS, for example [Tailwind UI](https://tailwindui.com/)
  - Some **not**-component libraries are [headlessui.dev](https://headlessui.dev/)
    and [shadcn/ui](https://ui.shadcn.com/). They can be used to build your own component library.
- [Core concepts](https://tailwindcss.com/docs/utility-first)

## Why Tailwind CSS?

- [This is why](https://www.youtube.com/watch?v=t-eR4hA7obg)

## Lab assignment 1

1. Continue last exercise. Create a new branch 'tailwind' with git.
2. Download the full version of the [MediaAPI](https://github.com/ilkkamtk/hybrid-media-api). Put it in the same main folder as the rest of this course's projects.
3. Also check if the [common types](https://github.com/ilkkamtk/hybrid-types) have been updated and need to be downloaded.
4. [Install Tailwind CSS to your project.](https://tailwindcss.com/docs/guides/vite#react)
5. [Editor setup.](https://tailwindcss.com/docs/editor-setup)
   - Add plugins to `prettier.config.js`:

   ```js
   export default {
      ...
      plugins: ["prettier-plugin-tailwindcss"],
   };
   ```

   - Or in json format to `.prettierrc` file if it's in use: `"plugins": ["prettier-plugin-tailwindcss"]`

6. Rename `index.css` to `index_old.css`. Create a new blank `index.css` and add the following the beginning of the
   file:

   ```css
   @tailwind base;
   @tailwind components;
   @tailwind utilities;
   ```

   - These are the [default styles](https://tailwindcss.com/docs/preflight) that Tailwind CSS provides.
7. Copy `:root` rule from `index_old.css` to `index.css` to get the basic styles back to the app.
8. Open `Layout.jsx` and add the same styles to the `Layout` component as you had before, but use Tailwind CSS classes
   instead of CSS.
   - Start with `ul` and `li` elements in `Nav` component. Use [Tailwind CSS docs](https://tailwindcss.com/docs) to
     find the right classes. The old styles are in `index_old.css` if you need to check them.
9. Do you really need to add the same styles to all `<li>` components? Isn't that repeating
   yourself? [Yes it is. And it is supposed to be like that.](https://tailwindcss.com/docs/reusing-styles#/dashboard)
   - You can however use pseudo classes like `*:`
     to [add styles to direct children](https://tailwindcss.com/docs/hover-focus-and-other-states#styling-direct-children)
     of E.g. `ul` element.
10. Go through `index_old.css` and make the app look like it did before (or better) with Tailwind CSS classes.
    - [Colors](https://tailwindcolor.com/)
    - [Default spacing](https://tailwindcss.com/docs/customizing-spacing#default-spacing-scale)
    - [Font size](https://tailwindcss.com/docs/font-size)

## Lab assignment 2

1. Continue in the same branch.
2. In this exercise we'll add two buttons to `MediaItemRow` component: `Modify` and `Delete` which are shown only when the user is logged in. At this point the buttons don't do anything but console.log something.
3. Use `useUserContext()` to get the `user` from the context.
4. Add the buttons to the `MediaItemRow` component. Use Tailwind CSS classes to style the buttons the same way as the `Show` button/`View` link is styled.
5. Use conditional rendering to show the buttons only when the user is logged in and the user is the owner of the media. If user is admin, the buttons are shown always. If the user is not logged in, the buttons are not shown at all.
6. Add event listeners to the buttons. Something like this:

   ```jsx
   <button
     className="your tailwind classes here"
     onClick={() => console.log("modify/delete", item)}
   >
   ```

7. Test that the buttons are shown only when the user is logged in and that the event listeners work.

## Lab assignment 3

1. Continue in the same branch.
2. Check if the username and/or email are available. If not, show an error message below the input field.
3. Add two new functions to `useUser` hook in `apiHooks.js`: `getUsernameAvailable` and `getEmailAvailable`:

   ```ts
   const getUsernameAvailable = async (username: string) => {
     const result = await fetchData(
       import.meta.env.VITE_AUTH_API + '/users/username/' + username
     );
     return result;
   };

   const getEmailAvailable = async (email: string) => {
     const result = await fetchData(
       import.meta.env.VITE_AUTH_API + '/users/email/' + email
     );
     return result;
   };
   ```

4. Add two new states with boolean values to `RegisterForm` component: `usernameAvailable` and `emailAvailable`. Set the default value to `true`.
5. Use `getUsernameAvailable` and `getEmailAvailable` in `doRegister` function to check if the username and email are available. Set the state values to the return values of the functions. If the username or email is not available, don't send the form data to the server. Also show an error message below the input field by using conditional rendering. Use Tailwind CSS classes to style the error messages.

## Submit

1. Run `npm build` or `npm run build`
2. Move build folder to your public_html
3. Test your app: `http://users.metropolia.fi/~username/tailwind`
4. Modify README.md. Change the link in `Open [X](X) to view it in the browser.` to point to the above link.
5. git add, commit & push to remote repository
6. Submit the link to correct branch of your repository to Oma
