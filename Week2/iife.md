## Self-Invoking Functions (Immediately Invoked Function Expressions, IIFE)

A self-invoking function, also known as an Immediately Invoked Function Expression (IIFE), is a JavaScript function that is defined and executed immediately after its creation. It is often used to create a private scope for variables and functions, preventing them from polluting the global scope.

**Syntax:**
```javascript
(function() {
  // Function body
})();
```

**Usage and Benefits:**

1. **Private Scope:** Variables and functions declared within an IIFE are not accessible from outside the function. This helps prevent naming conflicts and keeps your code modular.

2. **Data Encapsulation:** IIFE can encapsulate code and data, providing a clean and controlled way to expose only the necessary parts of your code to the outside world.

3. **Avoiding Global Pollution:** By encapsulating code within an IIFE, you reduce the risk of accidentally overwriting global variables and functions.

**Example:**

```javascript
(function() {
  const message = "Hello from IIFE";

  function greet(name) {
    console.log(message + ', ' + name);
  }

  greet('Alice');
})();
```

In this example, the IIFE creates a private scope for the `message` variable and the `greet` function. These are not accessible from outside the IIFE.

**Advanced Use Cases:**

1. **Module Pattern:** IIFE is commonly used to create modular code in JavaScript, simulating private and public members.

2. **Polluting the Global Namespace:** In some scenarios, you might want to intentionally pollute the global scope with a specific variable or utility function.

3. **Passing Dependencies:** IIFE can be used to inject dependencies into your function without adding them to the global scope.

**Considerations:**

- Be mindful of the context within the IIFE, especially when it comes to accessing variables outside the IIFE. You might need to pass variables as parameters if needed.

- Modern JavaScript and module systems (such as ES6 modules) offer alternatives for achieving encapsulation and modular code.
