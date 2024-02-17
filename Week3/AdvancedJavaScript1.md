# Advanced JavaScript Concepts

### [Self-Invoking Functions (IIFE)](iife.md)

- Self-invoking functions, also known as Immediately Invoked Function Expressions (IIFE), are JavaScript functions that
  are defined and executed immediately upon creation.
- They create a private scope for variables and functions, aiding in encapsulation, avoiding global pollution, and
  enabling modular code organization.

---

### [Arrow Functions](ArrowFunctions.md)

- Arrow functions are a concise way to define functions in JavaScript, utilizing the => syntax for compact and readable
  code.
- They automatically capture the surrounding context (this) and have a shorter syntax compared to traditional function
  expressions.

---

### [Special Operators](SpecialOperators.md)

- Special operators in JavaScript include the ternary operator (? :), optional chaining (?.), the nullish coalescing
  operator (??) and Spread and Rest operators.
- These operators provide advanced capabilities like conditional expressions, handling optional properties, and
  providing default values in a succinct and efficient manner.

---

### [Destructuring](Destructuring.md)

- Destructuring is a feature that allows you to extract values from arrays or objects and assign them to variables using
  a concise syntax.
- It simplifies data manipulation, parameter handling, and object property extraction, enhancing code readability and
  reducing redundancy.

---

### [Modules](Modules.md)

- Modules provide a way to organize and structure code by splitting it into reusable and independent units.
- They encapsulate variables, functions, or classes, enabling better code maintainability, reducing naming conflicts,
  and promoting modularity in larger projects.

---

## [Exercises](AJS-exercises.md)

---

## Assignment

### Enhancing the Modular Restaurant App

In this assignment, your objective is to finalize the restaurant app by incorporating modular components, arrow
functions, special operators, and applying destructuring where appropriate. You'll be enhancing the existing codebase to
create a more organized, maintainable, and efficient application.

**Requirements:**

1. **Refactor to Arrow Functions:**
    - Convert all standard function expressions to arrow function expressions.

2. **Integrate Special Operators:**
    - Utilize special operators like the ternary operator (`? :`) where applicable for improved property access and
      handling.

3. **Apply Destructuring:**
    - Implement destructuring to extract necessary properties from objects, enhancing data manipulation and function
      parameter handling.

4. **Modular UI Components:**
    - Create separate modules for UI components, such as `restaurantRow` and `restaurantModal`, to encapsulate the
      HTML
      generation for restaurant rows and modal content.
    - Steps:
        1. Create new file `components.js`.
        2. Define the `restaurantRow` function:
            - Begin by defining an arrow function named `restaurantRow` that takes a single parameter `restaurant`.
            - Inside the function, use destructuring to extract the `name` and `company` properties from
              the `restaurant` object.
            - Create a new `tr` (table row) element using the `document.createElement` method.
            - Set the `innerHTML` of the `tr` element to create the table row content with the extracted
              properties (`name` and `company`).
            - Return the `tr` element.
        3. Define the `restaurantModal` function:
            - Begin by defining an arrow function named `restaurantModal` that takes two parameters: `restaurant`
              and `menu`.
            - Inside the function, use destructuring to extract various properties from the `restaurant` object (
              e.g., `name`, `address`, `postalCode`, etc.).
            - Similarly, extract the `courses` array from the `menu` object.
            - Use a loop (e.g., `forEach`) to iterate over the `courses` array and generate the menu items' HTML
              content.
            - Create a string (`menuHtml`) to accumulate the menu items' HTML.
            - Concatenate the extracted properties and the generated `menuHtml` to form the complete HTML content.
            - Return the complete HTML content.

        4. Export the functions:
            - At the end of the `components.js` file, use the `export` keyword to export the `restaurantRow`
              and `restaurantModal` functions.
        5. Go back to your `main.js` file and import the `restaurantModal` and `restaurantRow` functions from
           the `components.js` module.
        6. Modify this part to create the `<tr>` with `restaurantRow()`:

            ```javascript
            // old
            const row = document.createElement('tr');
            row.innerHTML = `
            <td>${restaurant.name}</td>
            <td>${restaurant.address}</td>
            `;
            // new
            const row = restaurantRow(restaurant);
            ```
        7. Modify this part to crete the modal content with `restaurantModal`:

            ```javascript
            // old
            let menuHtml = '<ul>';
            for (const menuItem of menu.courses) {
            menuHtml += `<li>${menuItem.name}, ${menuItem.price || '?€'}. ${menuItem.diets}</li>`;
            }
            menuHtml += '</ul>';
            modal.innerHTML = `
             <h1>${restaurant.name}</h1>
             <p>${restaurant.address}</p>
             <p>${restaurant.postalCode}, ${restaurant.city}</p>
             <p>${restaurant.phone}</p>
             <p>${restaurant.company}</p>
             ${menuHtml}
            `;
            // new
            modal.innerHTML = restaurantModal(restaurant, menu);
            ```

5. **Update Main Module:**
    - Refactor your `main.js` to import and utilize the modular UI components for rendering restaurant rows and modal
      content.
    - Also move reused variables like `baseUrl` and reused functions like `fetchData` to their own modules.
    - Steps:
        1. Move Code to variables.js Module
            - Create new file `variables.js`.
            - Move `baseUrl` from your `main.js` file to the variables.js module.
            - Export `baseUrl` using the appropriate export syntax.
        2. Move Code to `utils.js` Module
            - Create new file `utils.js`.
            - Move the `fetchData` function from your main.js file to the utils.js module.
            - Export the fetchData function using the appropriate export syntax.
        3. Update main.js to import and use the new modules
            - Import `baseUrl` from the variables.js module using the appropriate import syntax.
            - Import the `fetchData` function from the utils.js module using the appropriate import syntax.

**Note:**

- Ensure that your app retains its core functionality, including fetching restaurant data, displaying it in a table, and
  showing detailed restaurant and menu information in a modal.
- Focus on improving code organization, reusability, and readability by effectively utilizing modular UI components and
  the specified JavaScript concepts.



