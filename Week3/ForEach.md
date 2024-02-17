## `forEach` Method

The `forEach` method is used to iterate over each element in an array and perform an operation on each element. It
provides a concise way to loop through array elements without the need for explicit loop constructs.

**Syntax:**

```javascript
array.forEach(callback(element, index, array) {
   // Your code here
});
```

- `callback` is a function that will be executed for each element in the array.
- `element` is the current element being processed.
- `index` is the index of the current element. _Used sometimes_.
- `array` is the array being iterated. _Rarely used_.

**Example using Arrow Function and Destructuring:**

Suppose you have an array of student objects, and you want to log each student's name and grade. You can use
the `forEach` method with an arrow function to achieve this:

```javascript
const students = [
  {name: 'Alice', grade: 85},
  {name: 'Bob', grade: 92},
  {name: 'Eve', grade: 78},
];

students.forEach(student => {
  console.log(`Name: ${student.name}, Grade: ${student.grade}`);
});
```

```text
// console log
Name: Alice, Grade: 85
Name: Bob, Grade: 92
Name: Eve, Grade: 78
```

In this example:

- The arrow function logs the formatted output for each student using the `forEach` method.
- The `student` parameter represents the current student object being processed.
- The `index` parameter is used to display the student's position in the array.

- **Benefits:**
- Concise: The `forEach` method eliminates the need for explicit loops.
- Functional Approach: It encourages a more functional programming style.
- Readability: The arrow function syntax makes the code compact and readable.

**Usage Tips:**

- The `forEach` method is suitable for executing an operation for each element in the array.
- It doesn't modify the original array; it's primarily used for side effects (e.g., logging, UI updates).

**Consideration:**

- Unlike some other array methods, `forEach` doesn't return a new array; it simply iterates over the existing array.

The `forEach` method is a fundamental tool for iterating over arrays and performing actions on their elements. It's
particularly useful when you want to process each element without altering the array's structure.

---

**`forEach` and `for...of` Comparison:**

Both `forEach` and `for...of` are used to iterate over elements in an array, but they have differences in syntax, use
cases, and performance characteristics.

1. **`forEach` Loop:**
    - Syntax: `array.forEach(callback(currentValue, index, array) {...})`
    - Purpose: Executes a provided function once for each array element.
    - Use Cases: When you want to perform a side effect (e.g., logging) on each element without creating a new array.
    - Note: Doesn't return a new array; primarily used for side effects.
    - Readability: Provides a more declarative and functional style of iteration.

2. **`for...of` Loop:**
    - Syntax: `for (const element of array) {...}`
    - Purpose: Iterates over iterable objects, including arrays, strings, maps, and sets.
    - Use Cases: When you want to perform actions on each element and potentially construct a new array or manipulate
      data.
    - Note: Can create a new array by pushing elements into a result array.
    - Readability: More concise and less verbose, especially when you don't need the index.

**Performance Consideration:**

In terms of performance, `for...of` tends to be more efficient compared to `forEach` due to the following reasons:

- `for...of` is usually faster in modern JavaScript engines since it's optimized for iteration.
- `forEach` may introduce some overhead due to the callback function call for each element.
- However, performance differences might be negligible for small arrays, and optimization strategies vary across
  engines.

**Choosing Between `forEach` and `for...of`:**

- Use `forEach` when you want to perform a side effect on each element without constructing a new array.
- Use `for...of` when you need to manipulate data, construct a new array, or work with other iterable objects.
- Consider performance implications based on the specific use case and array size.

Ultimately, the choice between `forEach` and `for...of` depends on the desired functionality, readability, and
performance characteristics of your code.
