# Node.js

## What is Node.js?

- "Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine."
- "Node.js uses an event-driven, non-blocking I/O model that makes it lightweight and efficient."
- "Node.js' package ecosystem, npm, is the largest ecosystem of open source libraries in the world."

## Usage

Running js script:

```bash
node my-script.js
```

### Exercise

Create a folder `node-test`. In the folder create file `script.js` that logs 'This is JavaScript' to console, and run it.

## npm

- npm (Node Package Manager) is the package manager for Node.js
- Has the most modules of any package manager for any language
- Comes along with Node.js when installed
- Available on command line with npm command
- [npm registry](https://www.npmjs.com/) let you [search](https://docs.npmjs.com/searching-for-and-choosing-packages-to-download) for existing package
- Can update itself with

    ```bash
    npm install -g npm
    ```

    or short version:

    ```bash
    npm i -g npm
    ```

## Global vs. local packages

#### Global packages

- Installed [globally](https://docs.npmjs.com/downloading-and-installing-packages-globally) with `-g` switch for `npm install`
- Used e.g. for system-wide command-line tools
- e.g.

    ```bash
      npm install -g angular-cli
      # no ng command is available and can be used anywhere to create new Angular projects
      ng new MY_PROJECT
    ```

#### Local packages

- Installed [locally](https://docs.npmjs.com/downloading-and-installing-packages-locally) to the node_modules folder under current application folder
- Available only for the current project, stored in project's `node_modules` folder
- e.g.

    ```bash
      npm install lodash
    ```

    ```javascript
    // in js file, first import the package
    import _ from 'lodash';
    // then you can use the library, e.g convert array to object with keys as id properties
    const array = [{ id: 'a', name: 'Foo' }, { id: 'b', name: 'Bar' }];
    const mapped = _.keyBy(array, 'id');
    console.log(mapped);
    ```
  
### npx

- npx is a package runner
- ability to execute a packages that weren’t previously installed
- sometimes you just want to use some CLI tools, but you don’t want to install them globally

### Exercise

#### Global package

You can install e.g. [nodemon](https://nodemon.io/) tool globally (package name: nodemon) and use it to automatically reload previously created `script.js` every time you update the file. Modify the text that you log to console and save changes of `script.js` to see the automatic reload.

- Windows might give 'running scripts is disabled...' error. Fix: open Windows PowerShell as admin then run `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`

#### Local package

Install [lodash](https://lodash.com/) locally and use it to convert 'Foo Bar' to camel case. Modify `script.js` and log the result to console.

## Package.json

- JSON file to define a [npm project](https://docs.npmjs.com/creating-a-package-json-file)
    - Can [contain](https://docs.npmjs.com/files/package.json):
- Project name, description, version, license etc.
- Dependencies
- Required node version (engines)
- npm scripts (covered later)
- etc.

## Dependencies

- Multiple types of dependencies:
    - dependencies for actual run-time dependencies
- devDependencies for development-time dependencies such as test frameworks and bundlers
- peerDependencies for requiring certain versions of other modules to be installed when used (used for example for plugins)
  - optionalDependencies for platform-specific (Windows, OS X, etc.) packages for optimization purposes
- Dependencies can point to npm registry, Git repository, tar ball, local path
- Dependency versions can be specified as specific, greater/lower than, ranges, etc.

## Initializing new project

Run `npm init` and answer all the interactive questions to populate simple package.json (hint: first create a remote git repository (in gitlab or github or ...), clone it locally and run the `npm init` in that cloned directory).

## Installing dependencies

Install all dependencies (dependencies & devDependencies):
```bash
npm install
```

Install dependencies only:

```bash
npm install --production
```

All dependencies are stored to node_modules folder.

## Adding new dependencies

To add a new run-time dependency for your project, you can use `--save` option or shorter `-S` or just omit it (since npm v5 it’s the default).

```bash
npm install --save express
```

or shorter:

```bash
npm i express
```

which installs the new package to `node_modules` and adds it to the `package.json`.

Using the dependencies in your code: `import express from 'express';`

`--save-dev` or `-D`  options are used to save the in `devDepencencies` which are only needed during development.

```bash
npm install --save-dev nodemon
```

See the classic cartoon about relying on external dependencies: [Dependency Hell](https://xkcd.com/2347/).

## Custom npm scripts

`scripts` field in `package.json` can contain custom scripts

```json
{
    "scripts": {
        "start": "node main.js",
        "dev": "nodemon main.js",
        "create-some-folder": "mkdir some && cd some && mkdir other"
    }
}
```

To run these, use:

```bash
npm run start
npm run dev
npm run create-some-folder
```

Certain scripts (e.g. `start` and `test`) are available without the `run`, for example:

```bash
npm start
```
