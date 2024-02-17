# Conditional expressions and loops

Study the material from the first year course:

1. [Interactive programs](https://github.com/ilkkamtk/JavaScript-english/blob/main/vuorovaikutteiset_ohjelmat.md)
2. [Conditional expressions and Loops](https://github.com/ilkkamtk/JavaScript-english/blob/main/valinta-toistorakenteet.md)

## Assignments:

Use the starter repository you made in the first class as a template to create a new repository for these assignments.
Clone the new repository to your local computer. Put each assignment into its own folder. Write separate HTML and JS files for each assignment. Use the
assignment number in file and folder names.

1. Write a program that prompts the user for a temperature in Celsius and converts it to Fahrenheit and Kelvin. The
   program should then display the converted temperatures in an HTML document.
    - Calculate the temperature in Fahrenheit by using the formula: F = (C * 9/5) + 32, where F is the temperature in
      Fahrenheit and C is the temperature in Celsius.
    - 2p
2. Write a program that calculates the distance between two points on a 2D plane and displays the result in an HTML document. The program should prompt the user for the coordinates of two points (x, y) and then calculate the Euclidean distance between them using the formula:
   ```text
   Distance = √((x2 - x1)^2 + (y2 - y1)^2)
   ```
     - In total, there will be four prompts to input the x and y coordinates for the two points.
     - You can do it also with fewer promts if you use string methods like [split()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split).
     - 3p
3. Write a program that prompts the user to enter the lengths of three sides of a triangle and determines the type of
   triangle based on the side lengths. The program should classify the triangle as equilateral (all sides are equal),
   isosceles (two sides are equal), or scalene (no sides are equal). Print the result on the HTML document.
    - try to use `&&`, `||` and `!` operators
    - 3p
4. Write a program that prompts the user to enter their score for a course assessment and determines their grade based
   on the following grading scale:
    - Scores between 0 and 39 receive a grade of 0.
    - Scores between 40 and 51 receive a grade of 1.
    - Scores between 52 and 63 receive a grade of 2.
    - Scores between 64 and 75 receive a grade of 3.
    - Scores between 76 and 87 receive a grade of 4.
    - Scores between 88 and 100 receive a grade of 5.
    - Print the result on the HTML document.
    - 3p
5. Write a program that prompts the user to enter a positive integer and calculates the sum of all the natural numbers
   up to and including that integer using a for loop. The program should display the sum on the HTML document.
    - Natural numbers are positive integers used for counting and representing quantities. Let's consider the example of
      the number 5. When the user enters 5, the program will calculate the sum of all the natural
      numbers up to and including 5. In this case, the natural numbers are 1, 2, 3, 4, and 5. The program will use
      a `for`
      loop to iterate through each of these numbers and add them together. Finally, the program will display the sum,
      which in this case would be 15, on the HTML document.
    - 3p
6. Write a program that prompts the user to enter a positive integer and generates a multiplication table up to that
   number
   using a `for` loop. The multiplication table displays the product of each pair of numbers from 1 to the entered
   number.
    - Your program should follow these steps:
        1. Write JavaScript code that prompts the user to enter a positive integer using
           the `prompt()`
           function. Store the user's input in a variable.
        2. Convert the user's input from a string to a number.
        3. Use nested `for` loops to generate the multiplication table.
        4. The outer loop will iterate from 1 up to the entered number, representing the rows of the table.
        5. The inner loop will also iterate from 1 up to the entered number, representing the columns of the table.
        6. Inside the nested loops, calculate the product of the current row and column values.
        7. Display each product in a formatted way to create the multiplication table on the HTML document.
    - Example Output:

       ```
       Enter a positive integer: 5
       
       Multiplication Table:
       1   2   3   4   5
       2   4   6   8   10
       3   6   9   12  15
       4   8   12  16  20
       5   10  15  20  25
       ```

       ```
       Enter a positive integer: 3
       
       Multiplication Table:
       1   2   3
       2   4   6
       3   6   9
       ```

    - Hints:
        - Define a variable to hold the user's input.
        - Use nested `for` loops to generate the multiplication table.
        - Calculate the product of the current row and column values inside the nested loops.
        - Display each product in a formatted way to create the multiplication table on the HTML document.
    - Example html result:

       ```html
       <table>
         <tr>
             <td>1</td>
             <td>2</td>
             <td>3</td>
         </tr>
         <tr>
             <td>4</td>
             <td>5</td>
             <td>6</td>
         </tr>
         <tr>
             <td>7</td>
             <td>8</td>
             <td>9</td>
         </tr>
       </table>
       ```
    - 6p
