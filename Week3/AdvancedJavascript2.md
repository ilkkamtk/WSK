# Advanced JavaScript: Array Methods and Higher-Order Functions

## Array Methods

- [forEach Method](ForEach.md)
- [map Method](Map.md)
- [filter Method](Filter.md)
- [reduce Method](reduce.md)

---

## Higher-Order Functions

- A higher-order function is a function that either takes one or more functions as arguments or returns a function as
  its result.
- This concept is derived from functional programming and is widely used in modern programming languages like TypeScript
  and JavaScript.
- Higher-order functions provide a way to create more abstract, modular, and reusable code.

### Using Higher-Order Functions to Write More Modular and Reusable Code:
- **Abstraction**: Higher-order functions allow you to encapsulate behavior that can be reused across different contexts. This helps in abstracting complex logic and making code more understandable.
-  **Modularity**: By breaking down behavior into smaller functions, you can create more modular code that can be combined to create more complex behaviors.
-  **Reusability**: Higher-order functions enable you to create reusable components that can be used in different parts of your codebase, promoting DRY (Don't Repeat Yourself) principles.
-  **Composability**: Higher-order functions can be composed together to create new functionalities. This encourages a functional style of programming and allows you to build complex behaviors from simpler parts.

```JavaScript
// Higher-order function example
function operationOnNumbers(a, b, operation) {
  return operation(a, b);
}

const add = (x, y) => x + y;
const subtract = (x, y) => x - y;

const result1 = operationOnNumbers(5, 3, add);       // Result: 8
const result2 = operationOnNumbers(10, 4, subtract); // Result: 6
```

---

## [Exercises](AJS-exercises.md)

---

## Assignments

### Enhancing the Restaurant App with Filter and Display Feature

In this assignment, you will enhance your restaurant app by implementing a feature that allows users to filter and
display only Sodexho or Compass restaurants. This assignment will emphasize the use of `map` and `filter` methods
with arrays, promoting a modern and functional approach to solving the problem.

**Requirements:**

1. Refactor your previous restaurant assignment code to make effective use of array methods like `forEach`, `map`
   and `filter`.

2. Implement the feature to filter and display only Sodexho or Compass restaurants using the `filter` method. Use arrow
   functions to streamline the filtering process.

3. Implement robust error handling for user interactions, such as displaying informative messages in case of failures.

