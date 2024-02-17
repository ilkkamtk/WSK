## `filter` Method

The `filter` method is used to create a new array containing all elements from an existing array that satisfy a given
condition.

**Syntax:**

```javascript
const newArray = array.filter(callback(element, index, array) {
  // Return true if element satisfies the condition
});
```

- `callback` is a function that will be executed for each element in the array.
- `element` is the current element being processed.
- `index` is the index of the current element.
- `array` is the array being iterated.

**Example using Arrow Function:**

Suppose you have an array of numbers, and you want to filter out all even numbers. You can use the `filter` method with
an arrow function to achieve this:

```javascript
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

const oddNumbers = numbers.filter(number => number % 2 !== 0);

console.log(oddNumbers);
```

In this example:

- The arrow function `(number => number % 2 !== 0)` is used as the `callback` to filter out even numbers.
- The `filter` method iterates through the `numbers` array and includes only those elements that satisfy the condition.
- The result is a new array `oddNumbers` containing only the odd numbers from the original array.

**Benefits:**

- Selective Extraction: The `filter` method provides an elegant way to extract elements based on specific conditions.
- Functional Approach: It encourages a functional programming style, focusing on data filtering.

**Usage Tips:**

- Use the `filter` method when you need to create a new array containing elements that satisfy a given condition.
- Unlike `forEach`, the `filter` method returns a new array and doesn't modify the original array.
  Certainly! Here's a concise comparison in one sentence:
- The `map` method returns a new array with the same length as the original, applying a transformation to each element;
  whereas, the `filter` method returns a new array with selected elements based on a condition, potentially resulting in
  a shorter array.

The `filter` method is a versatile tool for extracting elements that meet certain criteria from an array, and it's
  particularly useful for data filtering tasks.
