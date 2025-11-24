# Software Testing

Software testing is an essential part of any software development process. It involves verifying that a piece of software meets its requirements and functions correctly. There are various methods of software testing, such as unit testing, integration testing, and end-to-end testing.

There are also different design methodologies such as Test Driven Development (TDD), Test After Development (TAD). Each of these methodologies has its own advantages and disadvantages, and can be used to ensure quality in any software product.

## Test Driven Development (TDD)

Test Driven Development is a process where tests are written before the code is written. This approach helps to ensure that the code meets the requirements as the tests act as a roadmap for development. Additionally, TDD encourages efficient coding as developers are only writing code for the tests that have been written.

Steps to follow TDD:

1. Write a list of user stories that describe what the application should do. These user stories should be non-technical (the type of thing that a customer would write).
2. Pick a user story and express the user story in a unit test.
3. Write just enough code to pass the unit test. In other words, do the simplest thing that could possibly work to pass the unit test.
4. Consider refactoring your code to improve the design of your application. You can fearlessly refactor because your code is covered by unit tests.
5. Repeat steps 2 – 3 until you have completed the application (keeping in mind that the user stories might change over the course of the process of writing the application).


| Pros                              | Cons                         |
|-----------------------------------|------------------------------|
| Acts as a roadmap for development | Can be time-consuming        |
| Encourages efficient coding       | May lead to over-engineering |
| Helps to ensure the code meets the requirements |                |


[Free TDD MOOC course](https://tdd.mooc.fi/)

## Test After Development (TAD)

Test After Development is the opposite of TDD. In this method, tests are written after the code has been written. With TAD, it is easier to make sure the code meets the requirements as developers can make adjustments to the code based on the results of the tests. However, with TAD it is harder to ensure that the code is efficient as developers may be tempted to add code that is not needed.

Steps to follow TAD:

1. Create a list of user stories.
2. Consider the best design for the application.
3. Write application code that follows the design.
4. Write unit tests for the code.
5. Repeat steps 2 – 4 until the application is completed.

| Pros                              | Cons                         |
|-----------------------------------|------------------------------|
| Easier to make sure the code meets the requirements | Harder to ensure the code is efficient |
| Faster than TDD                   | May lead to unnecessary code |


### Behavioral Driven Development (BDD)

Behavior Driven Development is a software development process that focuses on the behavior of the system rather than the implementation. BDD uses natural language to define and describe behaviors, allowing for a more collaborative and communicative process between developers, testers, and stakeholders.

- BDD encourages tests to be written before the code, helping to ensure the code meets the user's needs.
- BDD encourages unit testing, integration testing, and end-to-end testing to ensure that the code is meeting the user's needs.
- BDD helps to reduce the chances of errors, as the team can quickly identify and fix any issues before they become a problem.
- In a TDD approach, a developer might write a test to check if a certain piece of code is working correctly. In a BDD approach, the same developer might instead use natural language to describe how the user should interact with the system and what the expected outcome should be.

## Functional testing

- Unit testing: testing individual parts of the code to make sure they are functioning correctly.
- Integration testing: testing how different parts of the code interact with each other.
- End-to-end testing: testing the whole application, from start to finish, to make sure it meets the requirements.

## Testing in CI/CD

- Testing is a key component of a CI/CD pipeline, as it helps to ensure the quality of the software.
- Testing helps to identify bugs and other issues early on in the development process, reducing the cost of fixing them in the future.
- Testing should be done at multiple stages of the CI/CD process, from unit testing to integration testing to end-to-end testing.
- Testing can also be automated, allowing for faster feedback and a more efficient development process.

## Testing frameworks

Testing frameworks are essential tools for software testing. They provide a set of tools that allow developers to quickly and easily write and run tests. Testing frameworks also provide features such as asynchronous testing, snapshot testing, and browser testing, which allow developers to ensure the highest quality of software. Testing frameworks are used in all stages of software development, from unit testing to integration testing to end-to-end testing.

[Jest](https://jestjs.io/) is one of the most popular test frameworks for JavaScript and TypeScript. It is well-suited for both unit and integration testing. It is easy to set up and provides features such as mocking, code coverage, and reporting. Additionally, it is highly configurable and allows for customization.

## Further material

- [TDD](https://youtu.be/Jv2uxzhPFl4)
- [Types of tests](https://youtu.be/4-_0aTlkqK0)
- [One take on unit tests](https://youtu.be/ZGKGb109-I4)
- [API testing](https://www.sisense.com/blog/rest-api-testing-strategy-what-exactly-should-you-test/)

---

## Unit testing with [Jest](https://jestjs.io/)

### Step 1: Setting Up Your Project

1. Install Jest:  `npm install -D jest`

2. Configure Jest in your `package.json` file:

   ```json
    "scripts": {
         "test": "jest"
    }
   ```

### Step 2: Writing Tests

```js
// example.js
function add(a, b) {
    return a + b;
}

export {add};
```

```js
// example.test.js
import {add} from './example';

test('add function should correctly add two numbers', () => {
    expect(add(2, 3)).toBe(5);
});
```

### Step 3: Running Tests

Run your tests by running the script defined in your `package.json`: `npm test`

Jest will execute the tests and display the results in the terminal.

#### test(), it() and describe()

In testing frameworks like Jest `test`, `describe`, and `it` are used to structure and organize your test suites and individual test cases. Here's when and how to use each of these:

1. **`test()`**:
    - Usage: `test(description, testFunction)`
    - `test` is used to define an individual test case, also known as a test assertion or test spec.
    - You use `test` to describe a single piece of functionality you want to test within your code.
    - Example:

      ```javascript
      test('Adds two numbers correctly', () => {
        expect(add(1, 2)).toBe(3);
      });
      ```

2. **`it()`**:
    - `it` is an alias for `test`. You can use either `it` or `test` based on your preference.
    - Some developers prefer `it` because it can make test descriptions read more like plain English sentences.

3. **`describe()`**:
    - Usage: `describe(description, testSuiteFunction)`
    - `describe` is used to group multiple related test cases or tests that pertain to a specific component, function, or feature.
    - You use `describe` to provide a context or categorization for a set of tests.
    - Example:

      ```javascript
      describe('Math Operations', () => {
        it('Adds two numbers correctly', () => {
          expect(add(1, 2)).toBe(3);
        });
 
        it('Subtracts two numbers correctly', () => {
          expect(subtract(5, 3)).toBe(2);
        });
      });
      ```

- Use `it` (or `test`) for individual test cases or assertions.
- Use `describe` to group related tests and provide context.
- Use descriptive names for `describe`, `test`, and `it` to make your test suite more readable and maintainable.

### Additional Considerations

1. [Mocking](https://vitest.dev/guide/mocking.html)
2. [Matchers](https://vitest.dev/api/expect.html): Vitest comes with a variety of built-in matchers (
   like `.toBe()`, `.toEqual()`, etc.) that help you write expressive assertions.
3. Testing Frameworks: Besides Jest, other popular testing frameworks for JavaScript and TypeScript include Vitest, Mocha and Jasmine.
4. Coverage Reporting: You can also configure Jest to generate code coverage reports, helping you identify areas of your codebase that lack testing coverage by adding the `--coverage` flag to your `test` script in `package.json`.

---

## React Component Testing

### Tools

- [Vitest](https://vitest.dev/guide/) is a Vite-native testing framework and compatible with [Jest](https://jestjs.io/).
- [React Testing Library](https://github.com/testing-library/react-testing-library/blob/main/README.md) provides React DOM testing utilities.
- [jest-dom](https://github.com/testing-library/jest-dom/blob/main/README.md) is used for DOM assertions.
- [jsdom](https://github.com/jsdom/jsdom/blob/main/README.md) is used for simulating a browser environment in Node for testing purposes.

### Setup testing environment

1. Install libraries: `npm install --save-dev vitest jsdom @testing-library/react @testing-library/jest-dom @types/jest`
1. Add test script to `package.json`:

    ```json
    "test": "vitest run"
    ```

1. Create `vitest-setup.js`:

    ```js
    import {afterEach} from 'vitest';
    import {cleanup} from '@testing-library/react';
    import '@testing-library/jest-dom/vitest';

    // reset jsdom (simulated browser) after each test
    afterEach(() => {
      cleanup();
    });
    ```

1. Update `vite.config.ts` by addin test configuration:

    ```ts
    /// <reference types="vitest/config" /> // https://vitest.dev/config/
    import {defineConfig} from 'vite';
    import react from '@vitejs/plugin-react-swc';

    // https://vite.dev/config/
    export default defineConfig({
      plugins: [react()],
      test: {
        environment: 'jsdom',
        globals: true,
        setupFiles: './vitest-setup.js',
      },
    });
    ```

### Simple examples

#### Profile view component

1. Create `src/tests/Profile.test.tsx`:

    ```ts
    import {render, screen} from '@testing-library/react';
    import Profile from '../views/Profile';

    test('renders correct content for the headline', () => {

      // render the Profile component in jsdom (simulated browser)
      render(<Profile />);

      // find the element with the text 'Profile'
      const element = screen.getByText(
        'Profile',
      );
      
      // check that the element is found (not undefined)
      expect(element).toBeDefined();
    });
    ```

1. Run tests: `npm test`
   - Finds and runs all files with extensions `.test.ts(x)` and `.spec.ts(x)`
   - Use `tsx` extension for React component tests and `ts` for "plain" TypeScript files (e.g. unit tests).
1. Change the content of `h2` and try again

### Dummy upload component

_Upload.tsx_:

```tsx
import {useState} from 'react';

const Upload = () => {
  const [uploading, setUploading] = useState(false);
  return (
    <>
      <h2>Upload</h2>
      <button
        onClick={() => {
          setUploading(true);
          setTimeout(() => {
            setUploading(false);
          }, 3000);
        }}
      >
        Upload
      </button>
      {uploading && <p>Uploading...</p>}
    </>
  );
};

export default Upload;
```

_Upload.test.tsx_:

```tsx
import {fireEvent, render, screen} from '@testing-library/react';
import Upload from '../views/Upload';

test('renders h2 headline', () => {
  render(<Upload />);
  const header = screen.getByRole('heading', {
      level: 2,
    })
  expect(header).toBeDefined();
});

test('displays uploading notification after button is clicked', () => {
  render(<Upload />);
  // simulates clicking the button
  fireEvent.click(screen.getByRole('button'));
  expect(screen.getByText('Uploading...')).toBeDefined();
});
```

---

## Integration testing

Integration testing is a level of software testing where individual units or components are combined and tested as a group. The purpose of integration testing is to verify that different modules or services used by your application work well together. It focuses on the interactions between components, ensuring that they communicate and function correctly when integrated. Focus areas of integration testing include:

- **Component Interaction**: Integration testing focuses on verifying the interaction and collaboration between different software components or modules. It ensures that these components work cohesively when combined.
- **Data Flow Validation**: Integration tests examine the flow of data between various parts of the system. They validate that data is transferred correctly and processed accurately as it moves between different components.
- **API Endpoint Testing**: Integration testing involves verifying the interactions between various API endpoints. Ensure that endpoints are properly connected and function as expected, covering typical use cases, error handling, and edge cases.

### Checklist

Things to consider when writing comprehensive integration tests:

1. **Use Random Data**: Utilize random data, such as usernames and emails, to prevent clashes with existing data in the database. This ensures test isolation.
2. **Clean-Up After Tests**: Always remember to delete or clean up any data that the tests have added. Utilize "beforeEach" or "afterEach" hooks for a clean slate for each test case.
3. **Separate Tests by Concerns**: Group tests by concerns or features. Organize tests into sections like "test create user," "test login," "test image upload," for clarity.
4. **Use Descriptive Test Names**: Ensure test case names are descriptive and indicative of what is being tested for easy comprehension.
5. **Arrange, Act, Assert (AAA)**: Follow the AAA pattern for test cases - Arrange, Act, and Assert. Set up data, perform actions, and verify outcomes.
6. **Comments and Documentation**: Add comments or documentation within test code to explain the test's purpose and specific conditions.
7. **Separate Unit and Integration Tests**: Separate unit tests (testing individual functions or components) from integration tests (testing interactions between components).
8. **Test Coverage**: Aim for good test coverage, including normal and edge cases to catch potential issues.
9. **Test for Error Cases**: Test error cases to ensure graceful handling of invalid input or error conditions.
10. **Mock External Dependencies**: Use mocks or stubs for external dependencies (databases, APIs) to isolate tests from actual external behavior.
11. **Parameterized Tests**: Consider parameterized tests to run the same test with different input data for robustness.
12. **Continuous Integration**: Integrate tests into the continuous integration (CI) pipeline for automatic testing on code changes.
13. **Test Security**: If dealing with sensitive data or authentication, include security tests to verify security measures.
14. **Performance Testing**: Add performance tests to evaluate API performance under various loads.
15. **Regression Testing**: Regularly run tests to detect regressions when new features or changes are introduced to the codebase.

### Exercise

[Example Express project with integration test assignments](https://github.com/ilkkamtk/integration-testing-exercise-js?tab=readme-ov-file#rest-api-integration-testing-and-end-to-end-testing)

---

## End-to-End Testing

End-to-end (E2E) testing is a software testing methodology that involves testing an application from start to finish, simulating real user scenarios. The goal of E2E testing is to ensure that the entire application functions as expected, including all its components and integrations.

[Material and examples for E2E testing with Playwright](https://github.com/JuhQ/e2e-playwright)

---
