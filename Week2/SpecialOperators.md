## Special Operators

Special operators in JavaScript provide functionality for handling specific operations, making your code more concise
and efficient. In this section, we'll explore some of the important special operators and their applications:

### Ternary Operator (`? :`)

- The ternary operator provides a compact way to write conditional statements.
- Syntax: `condition ? expressionIfTrue : expressionIfFalse`
- Example:

```javascript
const age = 20;
const isAdult = age >= 18 ? 'Adult' : 'Minor';
console.log(isAdult); // 'Adult'
```

- Equivalent If-Else Comparison:

```javascript
const age = 20;
let isAdult;

if (age >= 18) {
  isAdult = 'Adult';
} else {
  isAdult = 'Minor';
}

console.log(isAdult); // 'Adult'
``` 

In both cases, the code checks if the `age` is greater than or equal to 18. If the condition is true, the person is
considered an adult; otherwise, they are considered a minor. The ternary operator offers a more compact way to
achieve the same result as the if-else statement.

### Spread Operator (`...`)

- The spread operator is used to expand elements of an iterable (like an array or string) into individual elements.
- It's often used for creating shallow copies of arrays and combining arrays.
- Use cautiously inside loops.
- Example:

```javascript
const originalArray = [1, 2, 3];
const newArray = [...originalArray, 4, 5];
```

### Rest Operator (`...`)

- The rest operator is used in function parameter lists to collect multiple arguments into a single array.
- It allows functions to accept a variable number of arguments.
- Example:

```javascript
function sum(...numbers) {
  return numbers.reduce((acc, num) => acc + num, 0);
}
```

#### Shared Syntax:

Both the spread and rest operators use the same syntax of ..., but their usage and behavior differ based on their
context:

- Spread Operator: Used to spread the elements of an iterable (like an array) into individual elements, such as when
  creating a new array or passing arguments to a function.
- Rest Operator: Used within a function parameter list to collect multiple arguments into a single array, allowing for
  flexible function parameter handling.

### Nullish Coalescing Operator (`??`)

- The nullish coalescing operator is used to provide a default value for null or undefined values.
- It differs from the logical OR operator (`||`) by only considering values that are truly null or undefined,
  ignoring falsy values like `0` or an empty string.
- Example:

```javascript
const defaultValue = null;
const value = defaultValue ?? 'Fallback Value';
```

#### Examples of Combined Usage

- Combining the spread operator and array methods:

```javascript
const numbers = [1, 2, 3];
const sum = (arr) => arr.reduce((acc, num) => acc + num, 0);
const total = sum([...numbers, 4, 5]);
```

### Logical OR Operator (`||`)

- The logical OR operator (`||`) is used to provide a fallback value when the first operand is falsy (evaluates to false). It's commonly employed to handle default values or to conditionally assign values.
- The operator evaluates the expressions from left to right and returns the first truthy value encountered. If no truthy value is found, it returns the last falsy value.

#### Basic Usage

```javascript
const defaultValue = null;
const value = defaultValue || 'Fallback Value';
```

In the example above, if `defaultValue` is falsy (null, undefined, 0, empty string, etc.), the logical OR operator will return `'Fallback Value'`.

#### Examples of Combined Usage

- Combining the logical OR operator with function parameters:

```javascript
function greet(name) {
  name = name || 'Guest';
  console.log(`Hello, ${name}!`);
}

greet('Alice');    // Output: Hello, Alice!
greet();           // Output: Hello, Guest!
```

In the `greet` function, if `name` is falsy, the logical OR operator assigns the default value `'Guest'` to the `name` parameter.

- Combining the logical OR operator with conditional assignment:

```javascript
const user = {
  isAdmin: false,
  username: 'john_doe'
};

const role = user.isAdmin || 'User';
console.log(role);  // Output: User
```

The `role` variable is assigned the value `'User'` if `user.isAdmin` is falsy, indicating a non-admin user.

Keep in mind that unlike the nullish coalescing operator (`??`), the logical OR operator considers all falsy values, including `0` and an empty string, as potential fallback values.

Remember to choose the appropriate operator based on your intended behavior and the types of values you're working with.

### Optional Chaining Operator (`?.`)

The optional chaining operator provides a concise way to access nested properties of an object without causing an error
if any of the intermediate properties are undefined or null. It short-circuits the evaluation and returns `undefined` if
any part of the chain is not present.

Example:

```javascript
const person = {
  name: 'Alice',
  address: {
    city: 'Wonderland',
  },
};

const cityName = person.address?.city; // 'Wonderland'

const missingCity = person.address?.country?.city; // undefined
```

In this example, if `address` or `country` were not defined, the optional chaining operator ensures that no error
occurs, and the result is `undefined`.

The `?.` operator can be used in various contexts, including:

1. Accessing nested object properties.
2. Calling methods on objects that might be undefined.
3. Accessing array elements within an object.
4. Chaining multiple optional properties.

The optional chaining operator is particularly useful when dealing with data that may not always be complete or
consistent, helping you avoid runtime errors and providing a safer way to access properties and navigate complex object
structures.
