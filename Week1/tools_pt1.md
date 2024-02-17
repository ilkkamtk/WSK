# Toolchain - JavaScript

---

## Contents

- Editor/IDE: Visual Studio Code (or WebStrom or Vim or...)
- Language: JavaScript (ES6 ->)
- Format, lint, run, test & debug:
    - browser + dev tools
    - terminal
    - Vite
    - Prettier
    - ESLint
- Node.js
- Package manager: NPM (or PNPM)

---

## Code editor or IDE

Ultimately, it's your choice. VSCode is used by the teachers.

---

## [Visual Studio Code (VSCode)](https://code.visualstudio.com/download)

- free & open source code editor by Microsoft (**!=** Visual Studio IDE)
- wide extension support
- lightweight, multiplatform support
- good [docs & instructions](https://code.visualstudio.com/docs/editor/codebasics)
- choice of many Web developers

#### Install Extensions

Press _ctrl-shift-x_ or click extensions icon on the left panel.

Search and install:

- Prettier
- EditorConfig for VS Code
- Auto Import
- ESLint
- vscode-icons
- Live Server
- *Optional:* JavaScript (ES6) Code Snippets

#### VSCode - Basic Usage

Active **project** is the folder open on the left side panel (_File -> Open folder..._)

Handy keyboard shortcuts (finnish layout, check _File -> Preferences -> Keyboard shortcuts_ for more)

- Multiline comment: _ctrl-'_
- Delete line: _ctrl-shift-k_
- Move line(s): _alt-up/down_
- Copy line(s): _alt-shift-up/down_
- Auto format code: _alt-shift-f_
- Open integrated console: _ctrl-ö_
- Quick find/open files: _ctrl-p_
- Split editor: _ctrl-§_

---

### WebStorm

- free for Metropolia students. [Apply for license here](https://www.jetbrains.com/student/)
    - _@metropolia.fi_ email address needed for a free license
    - then install [ToolBox app](https://www.jetbrains.com/toolbox-app/)
- full-featured IDE
- quite ready out of the box. No need for plugins.
- based on IntelliJ IDEA, just like PyCharm

---

## Browser & debugging

- Chrome & [Chrome DevTools](https://developers.google.com/web/tools/chrome-devtools/)
- Safari & [Safari Develop menu](https://support.apple.com/guide/safari/use-the-developer-tools-in-the-develop-menu-sfri20948/mac)

![Chrome screenshot](images/chrome-devtools.png)

---

## Terminal

- Windows: Click on the start or search icon and type "PowerShell" in the search box
- Mac: press command-space to open search then type 'Terminal'

## Formatting and Linting

- Formatters and linters help maintain code quality and consistency.
- Formatters automatically format code according to predefined rules, ensuring a standardized and uniform code style
  across a project.
- Formatters handle tasks such as indentation, spacing, and line breaks, making code more readable and easier to
  understand.
- Linters analyze code for potential errors, bugs, and violations of coding conventions.
- Linters enforce best practices, identify potential issues, and provide suggestions for improvement.
- Formatters and linters together play a vital role in promoting code quality, reducing bugs, and facilitating
  collaboration among developers working on the same project.

### Formatters:

- Automatically format code according to predefined rules.
- Ensure a standardized and uniform code style across a project.
- Handle tasks such as indentation, spacing, and line breaks.
- Improve code readability and understandability.

### Linters:

- Analyze code for potential errors, bugs, and violations of coding conventions.
- Enforce best practices and coding standards.
- Identify potential issues and provide suggestions for improvement.
- Facilitate the detection of common programming mistakes.

Both formatters and linters contribute to maintaining code quality and consistency, but they focus on different aspects
of the development process. Formatters primarily deal with code formatting and style, while linters primarily focus on
code analysis and identifying potential issues.

## [EditorConfig](https://editorconfig.org/)

- is a file format and tool that helps maintain consistent coding styles across different code editors and IDEs.
- provides a way to define and enforce coding style preferences such as indentation, line endings, encoding, and
  whitespace rules.
- supports a wide range of programming languages and can be used with various code editors and IDEs, including Visual
  Studio Code, Sublime Text, and JetBrains IDEs.
- can be combined with other tools like ESLint and Prettier to create a comprehensive code styling and formatting setup
  in your development workflow.

    ```shell
    # sample .editorconfig
    
    # Top-most EditorConfig file
    root = true
    
    # File encoding
    [*]
    charset = utf-8
    
    # Indentation settings
    [*.js]
    indent_style = space
    indent_size = 2
    
    [*.css]
    indent_style = space
    indent_size = 2
    
    [*.html]
    indent_style = space
    indent_size = 2
    
    # Line endings
    [*]
    end_of_line = lf
    
    # Trailing whitespace
    [*]
    trim_trailing_whitespace = true
    
    # New line at the end of the file
    [*]
    insert_final_newline = true
    
    # Maximum line length
    [*.{js,css,html}]
    max_line_length = 80
    
    ```

## [Prettier](https://prettier.io/)

- is a popular code formatter that helps ensure consistent code style across projects.
- automatically formats code based on a set of predefined rules, eliminating the need for manual formatting.
- supports various programming languages, including JavaScript, TypeScript, CSS, HTML, and more.
- enforces a consistent code style by handling tasks such as indentation, spacing, line breaks, and wrapping.
- provides configuration options to customize the formatting rules according to project requirements.
- helps maintain code readability and improves code maintainability by providing a consistent and clean codebase.

    ```javascript
    // sample .prettierrc.js
    module.exports = {
      semi: true,
      singleQuote: true,
      bracketSpacing: false,
      singleQuote: true,
      trailingComma: 'es5',
    };
    ```

## [ESLint](https://eslint.org/)

- is a widely used linter for JavaScript and TypeScript that helps identify and enforce coding conventions, best
  practices, and potential errors in code.
- analyzes code statically and provides warnings or errors for common programming mistakes, potential bugs, and
  violations of coding standards.
- offers a highly configurable [rule set](https://eslint.org/docs/latest/use/configure/rules) that allows developers to customize the linting rules according to their
  project's specific requirements.
- supports various plugins and extensions, allowing for additional rules and language-specific linting capabilities.
- enables collaboration among team members by providing a shared set of rules and standards for writing clean and
  error-free code.
- offers the ability to automatically fix certain linting issues, saving developers time and effort in resolving common
  code problems.
- supports JavaScript ecosystem frameworks and libraries.

## Generating JavaScript project settings for Prettier, ESLint and EditorConfig
1. Install [Node.js LTS version](https://nodejs.org/en) (more about Node later in this course)
2. Create new folder. Open your terminal to that folder. Run `npm init -y`
3. Run ESLint configuration: `npm init @eslint/config`
4. Answers to questions in order:
   - How would you like to use ESLint? **To check syntax, find problems, and enforce code style**
   - What type of modules does your project use? **JavaScript modules (import/export)**
   - Which framework does your project use? **None of these**
   - Does your project use TypeScript? **No**
   - Where does your code run? **Browser**
   - How would you like to define a style for your project? **Use a popular style guide**
   - Which style guide do you want to follow? **Google: https://github.com/google/eslint-config-google**
   - What format do you want your config file to be in? **JavaScript**
   - Would you like to install them now? **Yes**
   - Which package manager do you want to use? **npm**
5. Install Prettier plugin for ESLint: `npm i -D eslint-plugin-prettier eslint-config-prettier`
6. You should have new file `.eslintrc.js`. Modify _extends_ and _rules_ properties:
   ```javascript
   ...
   extends: ['google', 'eslint:recommended', 'plugin:prettier/recommended'],  // if using WebStorm, omit plugin:prettier/recommended
   ...
   rules: {
      'require-jsdoc': 0,
   },
   ...
   ```
7. Write `.editorconfig` and `.prettierrc.js` files according to the examples earlier in this page.
8. Open the settings in Visual Studio Code by clicking on "File" -> "Preferences" -> "Settings" or using the shortcut Ctrl + ,.
9. In the search bar, type "Format On Save" and check the box to enable it. This ensures that your code will be automatically formatted when you save the file.
   - If you are using Webstorm, enable ESLint in your WebStrom project
   - [Instructions](https://www.jetbrains.com/help/webstorm/eslint.html)
       - [Importing code style](https://www.jetbrains.com/help/webstorm/eslint.html#ws_js_linters_eslint_import_code_style_from_eslint) is the most interesting part
10. Write new JavaScript file `main.js`:
    ```javascript
    function greeting () 
    {
      console.log("Hello World!");
    };
    
    greeting();
    ```
11. Save the file. Note how VSCode fixes formatting errors automatically.
12. If you are using WebStorm, right click somewhere over .eslintrc.js, choose 'Apply ESlint Code Style Rules'. Enable format on save on [WebStorm](https://www.jetbrains.com/help/webstorm/eslint.html#ws_eslint_configure_run_eslint_on_save).
13. Write index.html:
    ```html
    <!DOCTYPE html>
    <html lang="en">
    
    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Document</title>
      <script src="main.js" defer></script>
    </head>
    
    <body>
      <h1>Sample Page</h1>
    </body>
    
    </html>
    ```
14. Write `.gitignore` file:
    ```gitignore
    .vscode
    .idea
    node_modules
    .DS_Store
    ```
15. Create new repository on GitHub and push current project there.
16. [Set the repository to be a template repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-template-repository)
17. Now you can easily make new JavaScript projects with the same settings with ´Use this template/Create a new repository`.
    - After creating a new repository get the files to your local computer by cloning the new repository: `git clone https://address/to/repository.git`
       - You can easily get the address to the repository from the `<> Code` button in GitHub
    - [Here is the teacher's version](https://github.com/ilkkamtk/javascript-starter)


