## `map` Method

The `map` method is used to create a new array by transforming each element of an existing array. It applies a given
function to each element and collects the results in a new array.

**Syntax:**

```javascript
const newArray = array.map(callback(currentValue, index, array) {
  // Return the transformed value
});
```

- `callback` is a function that will be executed for each element in the array.
- `currentValue` is the current element being processed.
- `index` is the index of the current element.
- `array` is the array being iterated.

**Example using Arrow Function:**

Suppose you have an array of temperatures in Celsius, and you want to convert them to Fahrenheit using the
formula `(Celsius * 9/5) + 32`. You can use the `map` method with an arrow function to achieve this transformation:

```javascript
const celsiusTemperatures = [0, 10, 20, 30, 40];

const fahrenheitTemperatures = celsiusTemperatures.map(celsius => (celsius * 9 / 5) + 32);

console.log(fahrenheitTemperatures);
```

In this example:

- The arrow function `(celsius => (celsius * 9/5) + 32)` is used as the `callback` to convert each Celsius temperature
  to Fahrenheit.
- The `map` method iterates through the `celsiusTemperatures` array and applies the transformation to each element.
- The result is a new array `fahrenheitTemperatures` containing the converted temperatures.

**Benefits:**

- Transformation: The `map` method provides a clean way to transform elements while maintaining the original array's
  structure.
- Functional Approach: It encourages a functional programming style, focusing on data transformations.

**Usage Tips:**

- Use the `map` method when you need to create a new array by applying a transformation to each element.
- Unlike `forEach`, the `map` method returns a new array and doesn't modify the original array.

The `map` method is a powerful tool for transforming data in an array, and it's especially useful when you want to
maintain a clear separation between the original and transformed data.
