# CSS Grid

CSS Grid is a powerful layout system that allows you to create complex layouts with ease. It was first introduced in 2011, and since 2017 it has been supported by all major browsers. It is a two-dimensional system, meaning that it can handle both columns and rows, unlike the traditional box model layout system which is one-dimensional.

## Usage

The CSS Grid is used by defining a grid container and grid items. The grid container is the parent element, and it is defined using the `display: grid;` property. The grid items are the children of the grid container, and they are placed on the grid using the `grid-column` and `grid-row` properties.

Here is an example of a simple grid layout:

```html
<!DOCTYPE html>
<html>
  <head>
    <style>
      .grid-container {
        display: grid;
        grid-template-columns: 100px 100px 100px;
        grid-template-rows: 100px 100px 100px;
      }
      .grid-item {
        background-color: #f0f0f0;
        border: 1px solid #666;
        padding: 20px;
        text-align: center;
      }
    </style>
  </head>
  <body>
    <h1>Grid Layout</h1>

    <div class="grid-container">
      <div class="grid-item">1</div>
      <div class="grid-item">2</div>
      <div class="grid-item">3</div>
      <div class="grid-item">4</div>
      <div class="grid-item">5</div>
      <div class="grid-item">6</div>
      <div class="grid-item">7</div>
      <div class="grid-item">8</div>
      <div class="grid-item">9</div>
    </div>
  </body>
</html>
```

In this example, the grid container is defined using the `display: grid;` property. The grid items are placed on the grid using the `grid-template-columns` and `grid-template-rows` properties. The above code will create a 3x3 grid with 9 grid items. Each grid item will be 100px by 100px, and they will be placed in the grid in the order they appear in the HTML.

[examples/grid/grid-example1.html](../examples/grid/grid-example1.html)

## Grid Container Properties

The grid container has several CSS properties that can be used to define the layout of the grid. Here are some of the most commonly used properties:

- `display: grid;` - Defines the element as a grid container.
- `grid-template-columns` - Defines the columns of the grid.
- `grid-template-rows` - Defines the rows of the grid.
- `grid-template-areas` - Defines the areas of the grid.
- `grid-gap` - Defines the gap between the grid items.

Example:

```css
.grid-container {
  display: grid;
  grid-template-columns: 100px 100px 100px;
  grid-template-rows: 100px 100px 100px;
  grid-gap: 10px;
}
```

In this example, the grid container is defined using the `display: grid;` property. The grid items are placed on the grid using the `grid-template-columns` and `grid-template-rows` properties. The `grid-gap` property is used to define the gap between the grid items.

## Grid Item Properties

The grid items have several CSS properties that can be used to place them on the grid. Here are some of the most commonly used properties:

- `grid-column` - Defines the column the grid item should start in.
- `grid-row` - Defines the row the grid item should start in.
- `grid-area` - Defines the area the grid item should be placed in.
- `justify-self` - Defines the alignment of the grid item on the column axis.
- `align-self` - Defines the alignment of the grid item on the row axis.

Example:

```css
.grid-item {
  grid-column: 1 / 3;
  grid-row: 1 / 3;
}
```

In this example, the grid item is placed on the grid using the `grid-column` and `grid-row` properties. The `justify-self` and `align-self` properties are used to define the alignment of the grid item on the column and row axes.

As can be seen, `grid-column` and `grid-row` properties can take two values, called the `<grid-line>` values. These values are separated by the `/` symbol. The first value is the start position and the second value is the end position.The grid line syntax is a new addition to CSS. The grid line syntax is a way of defining the start and end positions of the grid items using line numbers. The line numbers start at 1 and increase by 1 for each line. The line numbers can also be negative, which means that they start at the end of the grid and decrease by 1 for each line. This makes it much easier to define the start and end positions of the grid items, and it also makes it much easier to create complex layouts.

- [MDN documentation for grid-column](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-column)
- [MDN documentation for grid-row](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-row)

## Grid Template Areas

The `grid-template-areas` property is used to define the areas of the grid. This property allows you to define the layout of the grid using named areas. Here is an example of how to use the `grid-template-areas` property:

```css
.grid-container {
  display: grid;
  grid-template-areas:
    "header header header"
    "sidebar content content"
    "footer footer footer";
}
```

```html
<div class="grid-container">
  <div style="grid-area: header">Header</div>
  <div style="grid-area: sidebar">Sidebar</div>
  <div style="grid-area: content">Content</div>
  <div style="grid-area: footer">Footer</div>
</div>
```

In this example, the grid container is defined using the `display: grid;` property. The `grid-template-areas` property is used to define the layout of the grid using named areas. The areas are defined using a string, with each row of the grid being defined on a new line. The areas are separated by spaces, and the rows are separated by quotes. The areas are defined using the names of the areas.

The HTML uses inline styles to place the grid items on the grid using the `grid-area` property.

[css/examples/grid/grid-template-areas.html](../examples/grid/grid-template-areas.html)

`grid-area` property is used to place the grid items on the grid using the names of the areas. The names need to match the names defined in the `grid-template-areas` property.

Here is an example of how to use the property in individual classes:

```css
.header {
  grid-area: header;
}

.sidebar {
  grid-area: sidebar;
}

.content {
  grid-area: content;
}

.footer {
  grid-area: footer;
}
```

The HTML for this CSS would look something like this:

```html
<div class="grid-container">
  <div class="header">Header</div>
  <div class="sidebar">Sidebar</div>
  <div class="content">Content</div>
  <div class="footer">Footer</div>
</div>
```

Either way, the result would be the same. Both approaches have their own advantages and disadvantages. The first approach is more concise and easier to read, but the second approach is more flexible and gets rid of inline styles.

[css/examples/grid/grid-template-areas2.html](../examples/grid/grid-template-areas2.html)

### Responsive Grid Template Areas

The `grid-template-areas` property can be used to create responsive layouts. This property allows you to define the layout of the grid using named areas, and it can be used to create different layouts for different screen sizes.

Extending the previous css example, we can add media queries to change the layout of the grid based on the screen size:

```css
/* media query with media range */
@media (800px > width > 400px) {
  .grid-container {
    grid-template-areas:
      "header header"
      "sidebar content"
      "none footer";
  }
}

@media (width <= 400px) {
  .grid-container {
    grid-template-areas:
      "header"
      "content"
      "sidebar"
      "footer";
  }
}
```

We do not need to make any changes to the HTML, let's keep it as it is:

```html
<div class="grid-container">
  <div class="header">Header</div>
  <div class="sidebar">Sidebar</div>
  <div class="content">Content</div>
  <div class="footer">Footer</div>
</div>
```

[css/examples/grid/grid-template-areas-responsive.html](../examples/grid/grid-template-areas-responsive.html)

Media queries can be used here to change the order of the elements in the page, look at the second example: [css/examples/grid/grid-template-areas-responsive2.html](../examples/grid/grid-template-areas-responsive2.html). This might be useful for mobile-first design, moving the sidebar navigation under the content, so that user can see the content first and then decide if they want to navigate to other pages.


## Grid Gap

The `grid-gap` property is used to define the gap between the grid items. This property allows you to define the gap between the grid items. Here is an example of how to use the `grid-gap` property:

```css
.grid-container {
  display: grid;
  grid-template-columns: 100px 100px 100px;
  grid-template-rows: 100px 100px 100px;
  grid-gap: 10px;
}
```

In this example, the grid container is defined using the `display: grid;` property. The `grid-gap` property is used to define the gap between the grid items. The gap is defined using a length value.

## When to use CSS Grid

Grids are a good choice for creating complex layouts, such as magazine-style layouts, image galleries, and complex forms. It can also be used in responsive layouts, as it allows you to define the layout of the grid using named areas.

For example creating an image gallery could be as simple as:

```css
.grid-container {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  grid-gap: 10px;
}
```

With HTML looking something like this:

```html
<div class="grid-container">
  <div class="grid-item"><img src="image1.jpg" alt="Image 1" /></div>
  <div class="grid-item"><img src="image2.jpg" alt="Image 2" /></div>
  <div class="grid-item"><img src="image3.jpg" alt="Image 3" /></div>
  <div class="grid-item"><img src="image4.jpg" alt="Image 4" /></div>
  <div class="grid-item"><img src="image5.jpg" alt="Image 5" /></div>
  <div class="grid-item"><img src="image6.jpg" alt="Image 6" /></div>
</div>
```

No more CSS or HTML would be needed to create a simple and responsive image gallery.

[css/examples/grid/gid-image-gallery.html](../examples/grid/grid-image-gallery.html)

Another example, this time we will create a tic-tac-toe board using CSS Grid:

```css
.grid-container {
  display: grid;
  grid-template-columns: repeat(3, 100px);
  grid-template-rows: repeat(3, 100px);
  grid-auto-flow: column;
}

.grid-item {
  background-color: #fff;
  font-size: 85px;
  text-align: center;
}

.grid-item:nth-child(odd) {
  background-color: #000;
  color: #fff;
}
```

HTML will look like this:

```html
<div class="grid-container">
  <div class="grid-item">X</div>
  <div class="grid-item"></div>
  <div class="grid-item"></div>
  <div class="grid-item">O</div>
  <div class="grid-item">X</div>
  <div class="grid-item"></div>
  <div class="grid-item">O</div>
  <div class="grid-item"></div>
  <div class="grid-item">X</div>
</div>
```

In this example, the grid container is defined using the `display: grid;` property. The grid items are placed on the grid using the `grid-template-columns` and `grid-template-rows` properties. The grid will be 3x3 and each grid item will be 100px by 100px. For the `grid-template-columns` and `grid-template-rows` properties, `repeat(3, 100px)` will create 3 columns and rows of 100px each. The `grid-auto-flow` property is used to define the flow of the grid items. For the `grid-item` class, all of the stylings are unrelated to the grid layout, instead they are just to make the grid items look like a tic-tac-toe board. `.grid-item` styling could be removed and still the grid would work as expected.

[css/examples/grid/grid-tic-tac-toe.html](../examples/grid/grid-tic-tac-toe.html)

## More resources

- [MDN CSS Grid Reference](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout)
- [MDN Learn - CSS Grid](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Grids)
- [W3schools CSS Grid Reference](https://www.w3schools.com/css/css_grid.asp)
- [CSS Tricks - A Complete Guide to Grid](https://css-tricks.com/snippets/css/complete-guide-grid/)
- [Grid by Example](https://gridbyexample.com/)
- [CSS Grid Garden](https://cssgridgarden.com/)
- [Learn CSS Grid](https://learncssgrid.com/)
- [Can I use CSS Grid?](https://caniuse.com/css-grid)
- [CSS Grid Layout by Jen Simmons](https://www.youtube.com/watch?v=7kVeCqQCxlk)
- [CSS Grid Layout by Wes Bos](https://cssgrid.io/)
- [CSS Grid Layout by Mozilla](https://mozilladevelopers.github.io/playground/css-grid/)
- [Grid by example](https://gridbyexample.com/examples/)
