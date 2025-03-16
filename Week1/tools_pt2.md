# Toolchain - JavaScript

---

## Contents

- Format, lint, run, test & debug:
    - browser + dev tools
    - terminal
    - Vite
    - Prettier
    - ESLint
- Node.js
- Package manager: NPM (or PNPM)

---

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
- sample `.prettierrc` file:


    ```json
    
    {
      "semi": true,
      "singleQuote": true,
      "bracketSpacing": false,
      "trailingComma": "es5"
    }
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
3. Run ESLint configuration: `npm init @eslint/config@latest`
4. Answers to questions in order:
    - How would you like to use ESLint? **To check syntax and find problems**
    - What type of modules does your project use? **JavaScript modules (import/export)**
    - Which framework does your project use? **None of these**
    - Does your project use TypeScript? **No**
    - Where does your code run? **Browser**
5. You should have new file `eslint.config.mjs` which has the basic configuration for ESLint.
6. Write `.editorconfig` and `.prettierrc.js` files according to the examples earlier in this page.
7. Open the settings in Visual Studio Code by clicking on "File" -> "Preferences" -> "Settings" or using the shortcut Ctrl + ,.
8. In the search bar, type "Format On Save" and check the box to enable it. This ensures that your code will be automatically formatted when you save the file.
   - If you are using Webstorm, enable ESLint in your WebStrom project
   - [Instructions](https://www.jetbrains.com/help/webstorm/eslint.html)
       - [Importing code style](https://www.jetbrains.com/help/webstorm/eslint.html#ws_js_linters_eslint_import_code_style_from_eslint) is the most interesting part
9. Write new JavaScript file `main.js`:
   ```javascript
   function greeting () 
   {
     console.log("Hello World!");
   };
    
   greeting();
   ```
10. Save the file. Note how VSCode fixes formatting errors automatically.
11. If you are using WebStorm, right click somewhere over .eslintrc.js, choose 'Apply ESlint Code Style Rules'. Enable format on save on [WebStorm](https://www.jetbrains.com/help/webstorm/eslint.html#ws_eslint_configure_run_eslint_on_save).
12. Write index.html:
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
13. Write `.gitignore` file:
    ```gitignore
    .vscode
    .idea
    node_modules
    .DS_Store
    ```
14. Create new repository on GitHub and push current project there.
15. [Set the repository to be a template repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-template-repository)
16. Now you can easily make new JavaScript projects with the same settings with ´Use this template/Create a new repository`.
    - After creating a new repository get the files to your local computer by cloning the new repository: `git clone https://address/to/repository.git`
       - You can easily get the address to the repository from the `<> Code` button in GitHub
    - [Here is the teacher's version](https://github.com/ilkkamtk/javascript-starter)


