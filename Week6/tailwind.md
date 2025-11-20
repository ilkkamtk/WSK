# Tailwind CSS

## What is Tailwind CSS?

- Tailwind CSS is a utility-first CSS framework for building custom user interfaces.
  - Utility-first means that you can use the classes to style your components. You don't need to write CSS yourself.
- It is not opinionated. Tailwind CSS doesn't tell you how your site should look like. You can use it to build your own design.
- However, it is not a UI kit. It doesn't provide you with ready-made components. You can use it to build your own components.
  - There are UI kits built with Tailwind CSS, for example [Tailwind UI](https://tailwindui.com/)
  - Some **not**-component libraries are [headlessui.dev](https://headlessui.dev/) and [shadcn/ui](https://ui.shadcn.com/). They can be used to build your own component library.
- [Core concepts](https://tailwindcss.com/docs/utility-first)

## Why Tailwind CSS?

- [This is why](https://www.youtube.com/watch?v=t-eR4hA7obg)

## Lab assignment 1

1. Continue last exercise. Create a new branch 'tailwind' with git.
2. Rename `index.css` to `index-old.css`, then create new `index.css`
3. [Install Tailwind CSS to your project.](https://tailwindcss.com/docs/guides/vite#react)
4. [Editor setup.](https://tailwindcss.com/docs/editor-setup)
5. Use [@layer base](https://tailwindcss.com/docs/adding-custom-styles#adding-base-styles) to convert `:root` and `#root` rules from `index_old.css` to Tailwind (in index.css) to get the basic styles back to the app.
8. Open `Layout.jsx` and add the same styles to the `Layout` component as you had before, but use Tailwind CSS classes instead of CSS.
   - Start with `ul` and `li` elements in `Nav` component. Use [Tailwind CSS docs](https://tailwindcss.com/docs) to
     find the right classes. The old styles are in `index_old.css` if you need to check them.
9. Do you really need to add the same styles to all `<li>` components? Isn't that repeating yourself? [Yes it is. And it is supposed to be like that.](https://tailwindcss.com/docs/reusing-styles#/dashboard)
   - You can however use pseudo classes like `*:` to [add styles to direct children](https://tailwindcss.com/docs/hover-focus-and-other-states#styling-direct-children) of e.g. `ul` element.
10. Go through `index_old.css` and make the app look like it did before (or better) with Tailwind CSS classes.
    - [Colors](https://tailwindcolor.com/)
    - [Default spacing](https://tailwindcss.com/docs/customizing-spacing#default-spacing-scale)
    - [Font size](https://tailwindcss.com/docs/font-size)

## Lab assignment 2

1. Continue in the same branch.
2. In this exercise we'll add two buttons to `MediaRow` component: `Modify` and `Delete` which are shown only when the user is logged in. At this point the buttons don't do anything but console.log something.
3. Use `useUserContext()` to get the `user` from the context.
4. Add the buttons to the `MediaRow` component. Use Tailwind CSS classes to style the buttons the same way as the `Show` button/`View` link is styled.
5. Use conditional rendering to show the buttons only when the user is logged in and the user is the owner of the media. If user is admin, the buttons are shown always. If the user is not logged in, the buttons are not shown at all.
6. Add event listeners to the buttons. Something like this:

   ```jsx
   <button
     className="your tailwind classes here"
     onClick={() => console.log("modify/delete", item)}
   >
   ```

7. Test that the buttons are shown only when the user is logged in and that the event listeners work.
8. Add functions for deleting and modifying media items to `apiHooks.js`: `deleteMedia` and `modifyMedia`. Use the same URL as in the `MediaAPI` for deleting and modifying media items.
9. For now, you can use `useNavigate` hook to refresh the page after deleting or modifying the media item.

## Lab assignment 3

1. Continue in the same branch.
2. Now we add likes to the media items. The user can like a media item only once.
3. Create a new component `Likes.jsx` in the `components` folder.
4. Add a button to the `Likes` component. The button can have just text or a heart icon. You can decide. It also needs to show the number of likes.
5. Add new hook `useLike` to `apiHooks.js`. The hook should have functions `postLike`, `deleteLike`, `getLikesByMediaId` and `getLikesByUser`. Use the same URL as in the `MediaAPI` for liking media items.
6. Create states for `likes` and `userLikes` in the `Likes` component. These are used to store all the likes of the media item and whether the user has liked the media item.
7. Use `useEffect` to get the likes of the media item when the component is mounted.
8. Add event listener to the button. If the user has liked the media item, the button should show that the user has liked the media item. If the user hasn't liked the media item, the button should show that the user can like the media item.
9. Add a function to the button that posts a like to the media item if the user hasn't liked the media item. If the user has liked the media item, the function should delete the like.
10. Add the `Like` component to the `SingleView` component. The button should be active only when the user is logged in. The number of likes should be shown always.

## Submit

1. Run `npm build` or `npm run build`
2. Move build folder to your public_html
3. Test your app: `http://users.metropolia.fi/~username/tailwind`
4. Modify README.md. Change the link in `Open [X](X) to view it in the browser.` to point to the above link.
5. git add, commit & push to remote repository
6. Submit the link to correct branch of your repository to Oma
