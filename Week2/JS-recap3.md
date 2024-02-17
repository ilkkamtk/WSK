# DOM

Study the material from the first year course:

1. [BOM & DOM](https://github.com/ilkkamtk/JavaScript-english/blob/main/BOM-DOM-event.md)
   - Study only the BOM & DOM parts

## Assignments:
[Download this ZIP-file](zip/dom-assignments.zip), extract it and move the content to the folder where you have your other files for this course.
1. Open t1 folder in your IDE/editor. In `t1.js` there is an array of todo items called `todoList`. Add the todo items to `ul` element in `t1.html` by using [insertAdjacentHTML](https://developer.mozilla.org/en-US/docs/Web/API/Element/insertAdjacentHTML) method. The structure of the end result should be this: 
   ```html
   <li>
      <input type="checkbox" id="todo-1" checked>
      <label for="todo-1">Buy milk</label>
   </li>
   <li>
      <input type="checkbox" id="todo-2">
      <label for="todo-2">Buy eggs</label>
   </li>
   <li>
      <input type="checkbox" id="todo-3" >
      <label for="todo-3">Buy bread</label>
   </li>
   ```
   - note: if `completed` property is `true`, the checkbox should be automatically checked.
   - 4p
2. Open t2 folder in your IDE/editor. The assignment remains unchanged from the first, except that for this version, [DOM methods](https://developer.mozilla.org/en-US/docs/Web/API/Document/createElement) are used to add the todo items.
   - `for` attribute is added to `<label>` with [htmlFor](https://developer.mozilla.org/en-US/docs/Web/API/HTMLLabelElement/htmlFor)
   - 4p
3. Open t3 folder in your IDE/editor. Create a web page that dynamically displays information about the user's browser and device using the BOM. Print the data to `#target` element. The page should show details such as:
   1. Browser name and version. (e.g. Google Chrome, 114)
   2. (Operating system name.) 
   3. Screen width and height. 
   4. Available screen space for the browser. 
   5. Current date and time. Use Finnish [localization](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toLocaleDateString) 
      - `1. helmikuuta 2056` as date format
      - Hours and minutes for time
   - Place each item within its own `<p>` element, for example.
   - save the web page as `t3.html` and JS as `t3.js` to `t3` folder
   - 5p
4. Open t4 folder in your IDE/editor. In the t4.js file, you will find an array containing restaurant data, including their respective locations. The objective of the application is to determine your current location. Then, the application should [sort the array of restaurants](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort#sorting_array_of_objects) based on the distance from the nearest to the farthest. Finally, the application should display a list of restaurants in order, starting with the nearest and ending with the farthest. This list should include the names and addresses of the restaurants.
   - You can use the formula for Euclidean distance from JS recap 1.2. It's not 100% accurate, since earth is not actually flat, but for now it's close enough.
   - 5p
5. Open t5 folder in your IDE/editor. In the t5.js file, you will find an array containing restaurant data, including their respective locations. The objective of the application is to add restaurants on a [Leaflet map](https://leafletjs.com/examples/quick-start/) as markers. When a marker is clicked, show the restaurants name and address. Name should be in `<h3>` element and address should be in `<p>` element.
   - 4p
