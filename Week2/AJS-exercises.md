# Advanced JavaScript Exercises
Do these exercises for "fun". No need to submit to Oma.

## Exercise 1: IIFE with Closures
Build an IIFE that creates a simple counter with increment and reset functionalities. The IIFE should return an object with two methods: `increment()` and `reset()`. The `increment()` method should increase the counter value by 1, and the `reset()` method should reset the counter to 0. The counter should not be directly accessible from outside the IIFE.

**Step 1: Set Up the IIFE**
1. Start by defining an IIFE (Immediately Invoked Function Expression) that will encapsulate the counter functionality and provide the necessary methods to interact with it.
2. The IIFE should be structured as an anonymous function that's immediately invoked. This will ensure that the code inside the function runs immediately without the need for a separate function call.

**Step 2: Create the Counter Variable**
3. Within the IIFE, create a variable (let's call it `counter`) that will store the current count value. Initialize this variable with an initial value, like 0.

**Step 3: Define the Increment Method**
4. Inside the IIFE, define a function (let's call it `increment()`) that will increase the value of the `counter` variable by 1 each time it's called. This function should not take any parameters.

**Step 4: Define the Reset Method**
5. Similarly, define another function (let's call it `reset()`) inside the IIFE that will reset the `counter` variable back to its initial value. This function should not take any parameters either.

**Step 5: Return an Object with Methods**
6. Create an object within the IIFE that contains the `increment()` and `reset()` methods as properties.
7. Associate the `increment()` and `reset()` functions you defined earlier with the corresponding properties of the object.

**Step 6: Return the Object**
8. Finally, return the object from the IIFE. This is what the IIFE will effectively expose to the outside world when it's invoked.

**Step 7: Test the IIFE**
9. Outside of the IIFE (in the main script), invoke the IIFE and capture the returned object.
10. Use the methods of the returned object (`increment()` and `reset()`) to interact with the counter and observe how it behaves.

**Step 8: Closure Concept**
11. Study the meaning of [Closure](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures). The `counter`, even though defined within the IIFE, remains accessible by the `increment()` and `reset()` methods due to closure. Closure allows inner functions to retain access to the variables of their outer functions even after the outer function has finished executing.

## Exercise 2: Special Operators

You are building a user information processing module for a web application. Users' names and ages are stored as objects in an array. However, not all users provide both pieces of information. Your task is to create a function that processes the user data and provides meaningful default values if some information is missing.

Fill the TODOs in this code:
```javascript
// Sample user data array
const userArray = [
  { name: "Alice", age: 25 },
  { name: "Bob" },
  { age: 30 },
  { name: "Eve", age: null }
];

// Function to process user data
function processUserData(user) {
  // TODO: Use a suitable operator to get the 'name' property or set a default value 'Guest'
  const name = /* TODO */;

  // TODO: Use a suitable operator to get the 'age' property or set a default value '18'
  const age = /* TODO */;

  const outputMessage = `Welcome, ${name}! You are ${age} years old.`;

  return outputMessage;
}

// Test the processUserData function with different user data
for (const user of userArray) {
  console.log(processUserData(user));
}

// The correct output should be:
// Welcome, Alice! You are 25 years old.
// Welcome, Bob! You are 18 years old.
// Welcome, Guest! You are 30 years old.
// Welcome, Eve! You are 18 years old.

```

## Exercise 3: Destructuring

You are working on a project that involves handling data related to books in a library. Your task is to complete the implementation of functions that process book information using destructuring to extract relevant data.

**Note:** Use the provided semi-ready code as a starting point. Fill in the TODOs with the necessary destructuring syntax and code logic to complete the functions as described in each step. Test your functions using the provided data to ensure they work correctly in various scenarios.

**Step 1: Object Destructuring**
1. An object `book` with properties such as `title`, `author`, `year`, and `genre` has been created for you. This object represents a book's information.

2. Implement the function `displayBookInfo` which takes the `book` object as an argument.
    - Use object destructuring to extract the `title`, `author`, and `year` properties from the `book` object.
    - Print a formatted string using the extracted information in the following format: "Title: [title], Author: [author], Year: [year]".

**Step 2: Array Destructuring**
3. An array `bookList` containing multiple `book` objects has been initialized.
    - Each object has properties such as `title`, `author`, `year`, and `genre`.

4. Implement the function `listBookTitles` which takes the `bookList` array as an argument.
    - Use array destructuring in a loop to extract only the `title` property from each `book` object.
    - Store the extracted titles in a new array.
    - Return the array of extracted titles.

**Step 3: Nested Object Destructuring**
5. A `bookWithPublisher` object contains a nested `publisher` object with properties: `name` and `location`.

6. Implement the function `displayPublisherLocation` which takes the `book` object as an argument.
    - Use nested object destructuring to extract the `location` property from the `publisher` object.
    - Print a formatted string that displays the extracted location.

**Step 4: Default Values in Destructuring**
7. An `incompleteBook` object is provided. It simulates incomplete book data.

8. Implement the function `fillMissingInfo` which takes the `book` object as an argument.
    - Use object destructuring with default values to extract the `title`, `author`, and `year` properties.
    - If any property is missing, provide appropriate default values.
    - Print a formatted string that displays the extracted information, including default values.

**Step 5: Challenge (Optional)**
9. Implement the function `swapProperties` which takes a `book` object as an argument.
    - Use object destructuring to swap the values of the `title` and `author` properties.
    - Create a new object to avoid modifying the original `book` object.
    - Return the modified `book` object.

```javascript
// Step 1: Object Destructuring
const book = {
  title: "The Great Gatsby",
  author: "F. Scott Fitzgerald",
  year: 1925,
  genre: "Classic"
};

// TODO: Implement the displayBookInfo function
function displayBookInfo(book) {
  // TODO: Use object destructuring to extract title, author, and year
  const { /* TODO */ } = book;
  
  console.log(`Title: ${title}, Author: ${author}, Year: ${year}`);
}

// Step 2: Array Destructuring
const bookList = [
  /* TODO: Create multiple book objects */
];

// TODO: Implement the listBookTitles function
function listBookTitles(bookList) {
  const titles = [];
  for (const book of bookList) {
    // TODO: Use array destructuring to extract the title property
    const /* TODO */ = book;

    titles.push(title);
  }
  return titles;
}

// Step 3: Nested Object Destructuring
const bookWithPublisher = {
  title: "Harry Potter and the Sorcerer's Stone",
  author: "J.K. Rowling",
  year: 1997,
  genre: "Fantasy",
  publisher: {
    name: "Scholastic",
    location: "New York"
  }
};

// TODO: Implement the displayPublisherLocation function
function displayPublisherLocation(book) {
  // TODO: Use nested object destructuring to extract the location property
  const { /* TODO */ } = book.publisher;
  
  console.log(`Publisher Location: ${location}`);
}

// Step 4: Default Values in Destructuring
const incompleteBook = {
  title: "Incomplete Book"
  // author and year properties are missing
};

// TODO: Implement the fillMissingInfo function
function fillMissingInfo(book) {
  // TODO: Use object destructuring with default values
  const { title, author = "Unknown Author", year = "Unknown Year" } = book;

  console.log(`Title: ${title}, Author: ${author}, Year: ${year}`);
}

// Step 5: Challenge (Optional)
// TODO: Implement the swapProperties function
function swapProperties(book) {
  // TODO: Use object destructuring to swap title and author
  // Remember to create a new object to avoid modifying the original book object
}

// Test the functions
displayBookInfo(book);
console.log(listBookTitles(bookList));
displayPublisherLocation(bookWithPublisher);
fillMissingInfo(incompleteBook);
// TODO: Test the swapProperties function

```

## Exercise 4: forEach
You are working on a project that involves managing tasks in a to-do list. Your task is to refactor the code to use the forEach loop instead of the traditional for loop for better readability and simplicity.

```javascript
// Sample tasks array
const tasks = [
  { title: "Buy groceries", priority: "High" },
  { title: "Read a book", priority: "Medium" },
  { title: "Go for a run", priority: "Low" }
];

// TODO: Implement the getFormattedTasks function
function getFormattedTasks(tasks) {
  const formattedTasks = [];

  // TODO: Convert the existing for loop to a forEach loop
  for (const task of tasks) {
    const formattedTask = `Task: ${task.title}, Priority: ${task.priority}`;
    formattedTasks.push(formattedTask);
  }

  return formattedTasks;
}

// Test the getFormattedTasks function and print the tasks
const formattedTasks = getFormattedTasks(tasks);
console.log(formattedTasks);

// output should be:
// [ 'Task: Buy groceries, Priority: High',
//   'Task: Read a book, Priority: Medium',
//   'Task: Go for a run, Priority: Low' ]
```

## Exercise 5: map
You are working on a project that involves processing student information. An array called `students` contains student objects, each with properties `name`, `age`, and `grade`. Your task is to implement the function `getStudentNames` that transforms the `students` array using the `map` function.
- Use the `map` function to extract only the `name` property from each student object.
- Return an array containing only the student names.

Modify the code below according to the TODO comments.

```javascript
// Sample students array
const students = [
  { name: "Alice", age: 20, grade: "A" },
  { name: "Bob", age: 21, grade: "B" },
  { name: "Eve", age: 19, grade: "A" }
];

// TODO: Implement the getStudentNames function
function getStudentNames(students) {
  // TODO: Use the map function to extract student names
}

// Test the getStudentNames function
const studentNames = getStudentNames(students);
console.log(studentNames);

// Output should be:
// [ 'Alice', 'Bob', 'Eve' ]
```

## Exercise 5: filter

You are developing a web application for a clothing store. An array called `clothes` contains clothing objects, each with properties `type`, `size`, and `color`. Your task is to implement the function `getRedClothes` that filters the `clothes` array using the `filter` function.
- Use the `filter` function to extract clothing objects where the `color` property is "red".
- Return an array containing only the red clothing objects.

Modify the code below according to the TODO comments.

```javascript
// Sample clothes array
const clothes = [
  { type: "shirt", size: "M", color: "red" },
  { type: "pants", size: "L", color: "blue" },
  { type: "dress", size: "S", color: "red" }
];

// TODO: Implement the getRedClothes function
function getRedClothes(clothes) {
  // TODO: Use the filter function to get red clothing objects
}

// Test the getRedClothes function
const redClothes = getRedClothes(clothes);
console.log(redClothes);

// Output should be:
// [ { type: 'shirt', size: 'M', color: 'red' },
//   { type: 'dress', size: 'S', color: 'red' } ]
```

## Exercise 6: reduce

You are working on a finance application that needs to calculate the total expenses of a user. An array called `expenses` contains expense objects, each with properties `category` and `amount`. Your task is to implement the function `calculateTotalExpenses` that uses the `reduce` function to accumulate the total expenses from the `expenses` array.
- Use the `reduce` function to sum up the `amount` property of each expense object.
- Return the total accumulated expenses.

Modify the code below according to the TODO comments.

```javascript
// Sample expenses array
const expenses = [
  { category: "Food", amount: 50 },
  { category: "Transportation", amount: 30 },
  { category: "Entertainment", amount: 20 }
];

// TODO: Implement the calculateTotalExpenses function
function calculateTotalExpenses(expenses) {
  // TODO: Use the reduce function to calculate total expenses
}

// Test the calculateTotalExpenses function
const totalExpenses = calculateTotalExpenses(expenses);
console.log(totalExpenses);

// Output should be:
// 100
```

## Exercise 7: Arrow Functions
Rewrite all functions in the previous exercises as arrow functions.
