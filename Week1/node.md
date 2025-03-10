# Node.js

## What is Node.js?
* "Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine."
* "Node.js uses an event-driven, non-blocking I/O model that makes it lightweight and efficient."
* "Node.js' package ecosystem, npm, is the largest ecosystem of open source libraries in the world."

## Usage
Running js script:
```bash
node my-script.js
```

### Exercise
Create a folder `node-test`. In the folder create file `script.js` that logs 'This is JavaScript' to console, and run it.

## npm
* npm (Node Package Manager) is the package manager for Node.js
* Has the most modules of any package manager for any language
* Comes along with Node.js when installed
* Available on command line with npm command
* [npm registry](https://www.npmjs.com/) let you [search](https://docs.npmjs.com/searching-for-and-choosing-packages-to-download) for existing package
* Can update itself with
    ```bash
    npm install -g npm
    ```
    or short version:
    ```bash
    npm i -g npm
    ```

## Global v.s. local packages
Global packages:

* Installed [globally](https://docs.npmjs.com/downloading-and-installing-packages-globally) with -g switch for npm install
* Provide some command-line commands
* e.g.
    ```bash
      npm install -g angular-cli
      ng new MY_PROJECT
    ```

Local packages

* Installed [locally](https://docs.npmjs.com/downloading-and-installing-packages-locally) to the node_modules folder under current application folder
* Available only for the current project with require
* e.g.
    ```bash
      npm install underscore
    ```
    ```javascript
    // in js file:
    const _ = require('underscore');
    ```
  
### npx
- npx is a package runner
- ability to execute a packages that weren’t previously installed
- sometimes you just want to use some CLI tools, but you don’t want to install them globally

### Exercise

#### Global package
Install [nodemon](https://nodemon.io/) globally (package name: nodemon) and use it to automatically reload previously created `script.js` every time you update the file. Modify the text that you log to console and save changes of `script.js` to see the automatic reload.
* Windows might give 'running scripts is disabled...' error. Fix: open Windows PowerShell as admin then run `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`

#### Local package
Install [lodash](https://lodash.com/) locally and use it to convert 'Foo Bar' to camel case. Modify `script.js` and log the result to console.

## Package.json
* JSON file to define a [npm project](https://docs.npmjs.com/creating-a-package-json-file)
    * Can [contain](https://docs.npmjs.com/files/package.json):
* Project name, description, version, license etc.
* Dependencies
* Required node version (engines)
* npm scripts (covered later)
* etc.

## Dependencies
* Multiple types of dependencies:
    * dependencies for actual run-time dependencies
* devDependencies for development-time dependencies such as test frameworks and bundlers
* peerDependencies for requiring certain versions of other modules to be installed when used (used for example for plugins)
  * optionalDependencies for platform-specific (Windows, OS X, etc.) packages for optimization purposes
* Dependencies can point to npm registry, Git repository, tar ball, local path
* Dependency versions can be specified as specific, greater/lower than, ranges, etc.

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
To add a new dependency for your project, you can use
```bash
npm install --save express
```
or shorter:
```bash
npm i express
```
which installs the new package to `node_modules` and adds it to the `package.json` 

`--save-dev` or `-D` to save in `devDepencencies`

Using the dependencies: `const express = require('express');`

## Custom npm scripts
`scripts` field in `package.json` can contain custom scripts
```json
{
    "scripts": {
        "build": "tsc",
        "create-some-folder": "mkdir some && cd some && mkdir other"
    }
}
```

To run these, use:
```bash
npm run build
npm run create-some-folder
```

Certain scripts (e.g. `start` and `test`) are available without the `run`, for example:
```bash
npm start
npm run start
```
