# AJAX

Study the material from the first year course:

1. [Open application programming interfaces + AJAX](https://github.com/ilkkamtk/JavaScript-english/blob/main/apit-ajax.md)

## Assignments:

Use the starter repository you made in the first class as a template to create a new repository for these assignments.
Clone the new repository to your local computer. Put each assignment into its own folder. Write separate HTML and JS
files for each assignment. Use the assignment number in file and folder names. In the first four assignments you'll be
using [Reqres](https://reqres.in/), which is a dummy API for testing frontends.

1. GET Method. Practice using the Fetch API with async/await to make a GET request and log the response.
    - Utilize the Fetch API with async/await to make a GET request to the URL `https://reqres.in/api/users/1`.
    - Log the response data to the console.
    - 2p

2. POST Method. Practice making a POST request using the Fetch API with async/await and handling the response.
    - Make a POST request to the URL `https://reqres.in/api/users` with a JSON payload containing user information (
      e.g.,
      name and job).
    - Log the response data to the console.
    - 3p

3. Error Handling. Practice error handling while using the Fetch API
    - Attempt to make a GET request to a non-existent URL (e.g., `https://reqres.in/api/unknown/23`).
    - Handle the error
      using [try/catch](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/try...catch)
      blocks.
    - Also try other methods (POST, PUT, DELETE)
    - Log an error message to the console in case of an error.
    - 4p

4. Generic Fetch Function. Create a reusable async function that abstracts the Fetch API usage and handles errors.
    - Define an async function named `fetchData` that takes two parameters: `url` and `options`.
    - Use the Fetch API with async/await to make a request to the specified `url` with the provided `options`.
    - If the response is not successful (status code other than
      2xx), [throw](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/throw) an error with an
      appropriate message.
    - Return the response as a JSON promise if successful.

    - When testing the function:
        - Call the fetchData function with the desired URL and options. Example:
   ```javascript
   try {
      const user = {
         name: 'John Doe',
         job: 'Developer'
      };
      const url = 'https://reqres.in/api/users';
      const options = {
         method: 'POST',
         headers: {
            'Content-Type': 'application/json'
         },
         body: JSON.stringify(user)
      }
      const userData = await fetchData(url, options);
      console.log(userData);
    } catch (error) {
      console.error('An error occurred:', error);
    }
   
   ```
    - Handle any errors using try/catch blocks to customize error handling.
    - 5p
5. In this assignment we will work with the [Restaurant API](https://student-restaurants.azurewebsites.net) to build upon the previous lab's restaurant assignment (Assignment 2). Extend the previous restaurant assignment by integrating the [Restaurant API](https://student-restaurants.azurewebsites.net/) and enhancing the app to display the current day's menu for selected restaurants.
   1. Begin by revisiting your previous restaurant assignment code.
   2. Modify the app to fetch restaurant data using a single AJAX call to the [Restaurant API](https://student-restaurants.azurewebsites.net/api/v1) endpoint. Replace the previous hard-coded array of restaurants.
   3. Implement the necessary logic to display the retrieved restaurant data in your app.
   4. When a user clicks on a restaurant, make another AJAX call to fetch the current day's menu for the selected restaurant from the API.
   5. Enhance the modal functionality to show both the restaurant details (name, address, etc.) and the current day's menu.
   6. Ensure that the modal is populated with the relevant information when a user clicks on a restaurant.
   7. Implement error handling for the AJAX calls, displaying appropriate messages if data retrieval fails.
   8. Test the app thoroughly to ensure that restaurant data and menus are displayed accurately.
   9. Make effective use of CSS for styling and layout.
   - 10p

M3tr0p0l14!
