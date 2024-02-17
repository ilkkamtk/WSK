# Event Handling

Study the material from the first year course:

1. [Event Handling](https://github.com/ilkkamtk/JavaScript-english/blob/main/BOM-DOM-event.md#event-handling)
    - Study only the Event Handling part

## Assignments:

[Download this ZIP-file](zip/event-assignments.zip), extract it and move the content to the folder where you have your other files for this course.

1. Open t1 folder in your IDE/editor. In this assignment, you will build upon the previous TODO list assignment and
   implement new features to enhance its functionality. You will continue working with the DOM, event handling, and
   array manipulation in JavaScript. <br> **Tasks:**
    - **Update `todoList` Array on Item Completion:**
        - Modify the existing TODO list so that users can mark items as completed by checking a checkbox.
        - Update the `todoList` array when a user checks an item to be done. Set the `completed` property of the
          corresponding item in the array to `true` if the checkbox is checked, or `false` if it is unchecked.
        - After each change, log the updated `todoList` array to the console to verify that the array has been modified
          correctly.
        - 2p

    - **Add Delete Button to List Items:**
        - For each item in the TODO list, add a "Delete" button that users can click to remove the item.
        - Implement an event handler so that when the "Delete" button is clicked, the corresponding item is removed from
          the `todoList` array.
        - Use [removeChild](https://developer.mozilla.org/en-US/docs/Web/API/Node/removeChild) method to remove the item
          from the TODO list.
        - After each change, log the updated `todoList` array to the console to verify that the array has been modified
          correctly.
        - 4p

    - **Add Button to Add TODO Items:**
        - Introduce an "Add Item" button to the UI. When this button is clicked, open a modal window.
        - The modal should contain a form with an input field for the new item's name and a "Save" button.
        - Implement an event handler for the "Save" button that adds a new TODO item to the `todoList` array. The new
          item should have a default `completed` property of `false`.
        - After each change, log the updated `todoList` array to the console to verify that the array has been modified
          correctly.
        - 6p

2. Open t2 folder in your IDE/editor. In the t2.js file, you will find an array containing restaurant data. Your
   objective is to develop an application that displays a list of restaurants in alphabetical order based on their
   names. The displayed list should include the names and addresses of the restaurants. Implement the following features
   in your application:

   a. Display the list of restaurants in alphabetical order, showing the restaurant names and addresses.

   b. Implement user interactivity as follows:

    - Introduce a new CSS class named highlight. This class should be designed to alter visual attributes such as
      background color or font weight, effectively highlighting the selected element.

    - Utilize the classList property to dynamically add the highlight class to the clicked restaurant's HTML
      element.

    - Ensure exclusive highlighting, meaning only the clicked restaurant's name should be highlighted. To achieve this,
      remove the highlight class from other restaurant elements before adding it to the clicked element.

   c. The modal window should present detailed information about the selected restaurant, including:
    - Restaurant name
    - Address
    - Postal code
    - City
    - Phone number
    - Company

   Ensure that the modal window is appropriately styled and clearly displays the restaurant data.
    - 12p
