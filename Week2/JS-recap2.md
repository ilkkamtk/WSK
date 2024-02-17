# Arrays and functions

Study the material from the first year course:

1. [Arrays and functions](https://github.com/ilkkamtk/JavaScript-english/blob/main/taulukot-funktiot.md)

## Assignments:
Use the starter repository you made in the first class as a template to create a new repository for these assignments.
Clone the new repository to your local computer. Put each assignment into its own folder. Write separate HTML and JS files for each assignment. Use the
assignment number in file and folder names.

1. Write a JavaScript program that focuses on the basic concepts of arrays. Your program
   should include the following requirements:
    1. Create an array called `fruits` and initialize it with the following elements: "apple", "banana", "orange", "
       grape", "kiwi".
    2. Display the contents of the `fruits` array in the console.
    3. Calculate and display the length of the `fruits` array.
    4. Access and display the element at index 2 in the `fruits` array in the console.
    5. Access and display the last element in the `fruits` array using the length property in the console.
    6. Create an empty array called `vegetables`.
    7. Prompt the user to enter three vegetables one by one, and add each entered vegetable to the `vegetables` array
       using the `push()` method.
    8. Display the contents of the `vegetables` array in the console.
    9. Calculate and display the length of the `vegetables` array.

    - Example Output:

        ```
        Fruits: ["apple", "banana", "orange", "grape", "kiwi"]
        Length of Fruits: 5
        Element at Index 2: "orange"
        Last Element of Fruits: "kiwi"
        Vegetables: ["carrot", "broccoli", "cabbage"]
        Length of Vegetables: 3
        ```
    - 3p

2. Write a JavaScript program that focuses on various array operations using the `push()`, `includes()`, `pop()`, and
   numerical sorting functions. Your program should include the following requirements:

    1. Create an empty array called `numbers`.
    2. Prompt the user to enter five numbers, one by one, and add each entered number to the `numbers` array using
       the `push()` method.
    3. Display the contents of the `numbers` array on the HTML document or in the console.
    4. Prompt the user to enter a number and check if the entered number is included in the `numbers` array using
       the `includes()` method.
    5. Display a message indicating whether the entered number is found or not found in the `numbers` array.
    6. Remove the last number from the `numbers` array using the `pop()` method.
    7. Display the updated `numbers` array on the HTML document or in the console.
    8. Sort the `numbers` array in ascending numerical order using the `sort()` method with a custom comparison
       function.
    9. Display the sorted `numbers` array on the HTML document or in the console.

        - Example Output:

          ```
          Enter Number 1: 10
          Enter Number 2: 5
          Enter Number 3: 7
          Enter Number 4: 3
          Enter Number 5: 9
          
          Numbers: [10, 5, 7, 3, 9]
          
          Enter a Number to Search: 7
          Number 7 is found in the array.
          
          Updated Numbers: [10, 5, 7, 3]
          
          Sorted Numbers: [3, 5, 7, 10]
          ```

    - 3p

3. Write a JavaScript program that prompts the user to enter a series of numbers one by one and extracts and displays
   only the even numbers from the entered values using the `for...of` loop.
    1. Define an empty array to store the numbers entered by the user.
    2. Use a loop (e.g., `while` or `do...while`) to prompt the user for numbers and add them to the array until the
       user decides to stop.
    3. Use the `for...of` loop to iterate over the entered values stored in the array.
    4. Inside the loop, check if the current number is even using the modulo operator `%`.
    5. If the current number is even, display it on the HTML document.
    6. After the loop completes, display a message indicating the end of the program.

        - Prompts:
           ```
           Enter a number (or 'done' to finish): 5
           Enter a number (or 'done' to finish): 12
           Enter a number (or 'done' to finish): 8
           Enter a number (or 'done' to finish): 3
           Enter a number (or 'done' to finish): 10
           Enter a number (or 'done' to finish): done
           ```

        - Example Output:
           ```
           Even Numbers: 12, 8, 10
           ```
        - Prompts:
            ```
            Enter a number (or 'done' to finish): 1
            Enter a number (or 'done' to finish): 3
            Enter a number (or 'done' to finish): 5
            Enter a number (or 'done' to finish): 7
            Enter a number (or 'done' to finish): done
            ```

        - Example Output:
            ```
            Even Numbers: None
            ```

    - 6p

4. Create a function called `sortArray` that accepts an array of numbers as a parameter and returns a new array with the
   numbers sorted in ascending order.
    - No need to prompt for the numbers. Use a hard coded array. Use console.log to print the original array and the
      sorted array.
    - 2p

5. Enhance the existing `sortArray` function to include an additional parameter that defines whether the array should be
   sorted in ascending or descending order.

    1. Create a function called `sortArray` that takes two parameters: `numbers` (an array of numbers) and `order` (a
       string indicating the sorting order).
    2. If the `order` parameter is set to "asc" (ascending), the function should sort the `numbers` array in ascending
       order.
    3. If the `order` parameter is set to "desc" (descending), the function should sort the `numbers` array in
       descending order.
    4. Return a new array with the sorted numbers.
    5. Test the function by passing different arrays and sorting orders.

        - Example Usage:

          ```javascript
          const numbers = [5, 2, 8, 1, 9];
          
          console.log(sortArray(numbers, "asc")); // Output: [1, 2, 5, 8, 9]
          console.log(sortArray(numbers, "desc")); // Output: [9, 8, 5, 2, 1]
          ```

    - 3p

6. Write a program that allows users to track and rate their favorite movies. The program should prompt the user to
   enter the details of each movie, including the title and rating on a scale of 1 to 5. The program should store the
   user input in an array of objects using object literals. Once all the movie ratings have been entered, the program
   should sort the movies based on their ratings and determine the highest-rated movie. Finally, it should display the
   sorted list of movies and the highest-rated movie on the HTML document.
    1. Use object literals to represent each movie, with properties such as `title` and `rating`.
    2. Prompt the user to enter the number of movies they want to rate.
    3. Use a loop to gather user input for each movie, including the title and rating. Store the movie details in an
       array
       of objects.
    4. Sort the array of movie objects based on the ratings, from highest to lowest.
    5. Determine the highest-rated movie by accessing the first element of the sorted array.
    6. Display the sorted list of movies and the highest-rated movie on the HTML document.

    - 6p
