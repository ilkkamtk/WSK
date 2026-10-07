# Build, publish and submit a React app

These steps are the same for every React assignment. Each assignment tells you which `<app-folder>` name to use (e.g. `wsk-routing`, `hooks`, `forms`).

## Build

1. Check [Building for Production](https://vitejs.dev/guide/build)
1. To fix the paths for `assets` and navigation in production build, set the _public base path_ e.g. by adding `base` property to `vite.config.js`:

    ```js
    ...
    export default defineConfig({
      plugins: [react()],
      base: '/~your-username/<app-folder>/',
    });
    ```

    | :exclamation:  Note! The trailing slash must exist in the `base` path, otherwise issues will arise.   |
    |--|

    Then add the same path to the `basename` prop of the `BrowserRouter` component in `App.jsx` by reading it from the config (once you use React Router):

    ```jsx
    <BrowserRouter basename={import.meta.env.BASE_URL}>
    ```

1. Run `npm run build`

## Publish

1. Copy contents of build folder (`dist/*`) to your home dir's `public_html/<app-folder>/` (shell.metropolia.fi)
    - Can be done with scp tool in terminal: `scp -r dist/* your-username@shell.metropolia.fi:~/public_html/<app-folder>/`
    - Note: Do not upload src/ folder or any other folder, only `dist/` folder content should be uploaded
1. Test your app: `https://users.metropolia.fi/~your-username/<app-folder>/`

## Submit

1. Modify `README.md`. Add a text paragraph and link: `Open [link text here](https://users.metropolia.fi/~your-username/<app-folder>/) to view it in the browser.`
1. git add, commit & push current branch to the remote repository (GitHub)
1. Submit the link to correct branch of your repository to Oma
