## Modules

Modules are a way to organize, structure, and encapsulate code in JavaScript applications. They allow you to break down
your code into smaller, manageable pieces, making it easier to maintain, collaborate, and reuse. ES6 introduced a
standardized module system that provides a clean and efficient way to work with modules.

1. **Exporting Modules:**
    - You can use the `export` keyword to export functions, variables, classes, or objects from a module.
    - Example:
      ```javascript
      // math.js
      export const add = (a, b) => a + b;
      export const subtract = (a, b) => a - b;
      ```

2. **Importing Modules:**
    - The `import` statement is used to import functionalities from other modules.
    - Example:
      ```javascript
      // app.js
      import { add, subtract } from './math.js';
      console.log(add(5, 3)); // 8
      ```
    - **Note** that the .js extension is needed in browsers

3. **Default Exports:**
    - A module can have a default export, which is the main exported value from the module.
    - Example:
      ```javascript
      // utility.js
      export default function capitalize(str) {
        return str.charAt(0).toUpperCase() + str.slice(1);
      }
      ```
      ```javascript
      // app.js
      import capitalize from './utility';
      ```

4. **Namespace Imports:**
    - You can import all exported values from a module into a single object using the `* as` syntax.
    - Example:
      ```javascript
      // library.js
      export const func1 = () => {};
      export const func2 = () => {};
      ```
      ```javascript
      // app.js
      import * as library from './library';
      library.func1(); // Calling Function 1
      library.func2(); 
      ```

Modules provide a clean and organized way to structure your codebase, making it easier to manage larger projects and
promote code reusability. As you become more comfortable with modules, you'll find them invaluable for maintaining a
well-organized and maintainable codebase.

### Export Default

The `export default` statement allows you to export a single value as the default export from a module. This value is
typically the main or most important functionality that you want to share from the module.

Example:

```javascript
// utility.js
const greet = (name) => `Hello, ${name}!`;

export default greet;
```

```javascript
// app.js
import greet from './utility';

console.log(greet('Alice')); // 'Hello, Alice!'
```

In this example, the `greet` function is exported as the default export from the `utility.js` module, and it's imported
and used in the `app.js` file.

### Named Exports using `export { ... }`

Named exports allow you to export multiple values from a module, each with its own name. This is useful when you want to
export multiple functions, variables, or classes from the same module.

Example:

```javascript
// math.js
const add = (a, b) => a + b;
const subtract = (a, b) => a - b;

export {add, subtract}
```

```javascript
// app.js
import {add, subtract} from './math';

console.log(add(5, 3)); // 8
```

In this example, both the `add` and `subtract` functions are exported as named exports from the `math.js` module and
imported into the `app.js` file.

#### Combining Default and Named Exports

You can combine `export default` and named exports in the same module to create a flexible and comprehensive module API.

Example:

```javascript
// utilities.js
export default function getRandomNumber(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

const greet = (name) => `Hello, ${name}!`;
const capitalize = (str) => str.charAt(0).toUpperCase() + str.slice(1);
export {greet, capitalize}
```

```javascript
// app.js
import getRandomNumber, {greet, capitalize} from './utilities';

console.log(getRandomNumber(1, 100));
console.log(greet('Alice'));
console.log(capitalize('hello'));
```

In this example, the `getRandomNumber` function is exported as the default export, while the `greet` and `capitalize`
functions are exported as named exports from the `utilities.js` module.

### Browser Compatibility

The ES6 module syntax (import/export) is natively supported by modern web browsers. However, there are some
considerations to keep in mind:

1. **Modern Browsers:**
    - Current versions of major browsers, such as Chrome, Firefox, Safari, and Edge, provide native support for ES6
      modules.
    - You can freely use the import/export syntax in these browsers without any issues.

2. **Module Type in Script Tag:**
    - When using ES6 modules in a browser environment, you need to specify the `type="module"` attribute in the script
      tag.
    - Example:
      ```html
      <script type="module" src="app.js"></script>
      ```
    - In this case the `defer` attribute is not required, since the processing of the script contents is deferred.

3. **CORS Considerations:**
    - When fetching modules from different domains, Cross-Origin Resource Sharing (CORS) policies might come into play.
      Ensure proper CORS configurations to avoid issues.
    - In other words, importing modules from other domains usually causes issues

### Node.js Compatibility

Node.js introduced support for ES6 modules starting from version 12. However, there are some key points to consider:

1. **ESM vs. CommonJS:**
    - Node.js supports both the ES6 module syntax (ESM) and the CommonJS module syntax.
    - To use ES6 modules, you need to use the `.mjs` extension for module files, or enable ESM in `.js` files by
      adding `"type": "module"` to your `package.json`.

2. **ESM Syntax:**
    - When using ESM syntax in Node.js, you can use `import` and `export` similar to the browser environment.
    - Example:
      ```javascript
      // app.mjs (or with "type": "module" in package.json)
      import { add } from './math';
      console.log(add(5, 3));
      ```
    - **Note** that in Node.js `./math` does **not** have `.js` extension

3. **CommonJS Compatibility:**
    - You can still use CommonJS `require` and `module.exports` syntax in Node.js. However, mixing ESM and CommonJS
      syntax in the same file can lead to confusion.

4. **Interoperability:**
    - ESM and CommonJS modules can interoperate to some extent, but there might be challenges when it comes to cyclic
      dependencies or other differences in behavior.

5. **Node.js Version:**
    - Ensure that your Node.js version is 12 or later to take advantage of ES6 module support. You can check your
      Node.js version using `node -v` in the command line.

Remember that while modern browsers and Node.js versions support ES6 modules, there might be scenarios where you need to
transpile your code using tools like Babel to ensure compatibility with older environments. Always consider the target
environments when using ES6 module syntax in your projects.
