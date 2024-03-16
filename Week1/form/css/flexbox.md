# CSS Flexbox

The CSS Flexible Box Layout Module, known as Flexbox, is a layout model that allows the design of a flexible and responsive layout structure without using floats or positioning. Flexbox is designed to provide a consistent layout on different screen sizes and devices.

Flexbox is a one-dimensional layout model, which means that it deals with laying out items in one direction at a time, either as a row or as a column. The main axis is the primary axis along which the flex items are laid out, and the cross axis is the secondary axis.

## Flexbox Terminology

- **Flex Container**: The parent element that contains the flex items.
- **Flex Items**: The children of the flex container.
- **Main Axis**: The primary axis along which the flex items are laid out.
- **Cross Axis**: The secondary axis perpendicular to the main axis.

## Flexbox Properties

The flexbox layout is controlled using the following properties:

- `display`: Specifies the type of layout model used for the element.
- `flex-direction`: Specifies the direction of the main axis.
- `flex-wrap`: Specifies whether the flex items should wrap or not.
- `justify-content`: Specifies the alignment of the flex items along the main axis.
- `align-items`: Specifies the alignment of the flex items along the cross axis.
- `align-content`: Specifies the alignment of the flex lines within the flex container.

The flex items can be controlled using the following properties:

- `order`: Specifies the order of the flex items.
- `flex-grow`: Specifies the ability of the flex items to grow.
- `flex-shrink`: Specifies the ability of the flex items to shrink.
- `flex-basis`: Specifies the initial size of the flex items.

## Flexbox Container

The flex container is the parent element that contains the flex items. To create a flex container, the `display` property is set to `flex` or `inline-flex`. The flex container can be a block-level or inline-level element.

```css
/* Block-level flex container */
.container {
  display: flex;
}

/* Inline-level flex container */
.container {
  display: inline-flex;
}
```

## Flexbox Direction

The direction of the flex container can be set using the `flex-direction` property. The direction can be set to `row`, `row-reverse`, `column`, or `column-reverse`.

```css
/* Default: left to right */
.container {
  flex-direction: row;
}

/* Right to left */
.container {
  flex-direction: row-reverse;
}

/* Top to bottom */
.container {
  flex-direction: column;
}

/* Bottom to top */
.container {
  flex-direction: column-reverse;
}
```

## Flexbox Wrapping

The wrapping of the flex items can be controlled using the `flex-wrap` property. The wrapping can be set to `nowrap`, `wrap`, or `wrap-reverse`.

```css
/* Default: no wrapping */
.container {
  flex-wrap: nowrap;
}

/* Wrapping */
.container {
  flex-wrap: wrap;
}

/* Reverse wrapping */
.container {
  flex-wrap: wrap-reverse;
}
```

## Flexbox Justify Content

The alignment of the flex items along the main axis can be controlled using the `justify-content` property. The alignment can be set to `flex-start`, `flex-end`, `center`, `space-between`, or `space-around`.

```css
/* Default: flex-start */
.container {
  justify-content: flex-start;
}

/* Right alignment */
.container {
  justify-content: flex-end;
}

/* Center alignment */
.container {
  justify-content: center;
}

/* Equal spacing between items */
.container {
  justify-content: space-between;
}

/* Equal spacing around items */
.container {
  justify-content: space-around;
}
```

## Flexbox Align Items

The alignment of the flex items along the cross axis can be controlled using the `align-items` property. The alignment can be set to `flex-start`, `flex-end`, `center`, `baseline`, or `stretch`.

```css
/* Default: stretch */
.container {
  align-items: stretch;
}

/* Top alignment */
.container {
  align-items: flex-start;
}

/* Bottom alignment */
.container {
  align-items: flex-end;
}

/* Center alignment */
.container {
  align-items: center;
}

/* Baseline alignment */
.container {
  align-items: baseline;
}
```

## Flexbox Align Content

The alignment of the flex lines within the flex container can be controlled using the `align-content` property. The alignment can be set to `flex-start`, `flex-end`, `center`, `space-between`, `space-around`, or `stretch`.

```css
/* Default: stretch */
.container {
  align-content: stretch;
}

/* Top alignment */
.container {
  align-content: flex-start;
}

/* Bottom alignment */
.container {
  align-content: flex-end;
}

/* Center alignment */
.container {
  align-content: center;
}

/* Equal spacing between lines */
.container {
  align-content: space-between;
}

/* Equal spacing around lines */
.container {
  align-content: space-around;
}
```

## Flexbox Items

The flex items are the children of the flex container. The `order`, `flex-grow`, `flex-shrink`, and `flex-basis` properties can be used to control the layout and sizing of the flex items.

```css
/* Default: 0 */
.item {
  order: 0;
}

/* Default: 0 */
.item {
  flex-grow: 0;
}

/* Default: 1 */
.item {
  flex-shrink: 1;
}

/* Default: auto */
.item {
  flex-basis: auto;
}
```

## Flexbox history

Flexbox was introduced in the CSS3 specification and is supported by all modern browsers. It was designed to address the limitations of the traditional layout models, such as floats and positioning.

Traditional layout models are based on block and inline layout, which can be difficult to use for complex layouts. Flexbox provides a more efficient way to create complex layouts, such as navigation bars, sidebars, and multi-column layouts, without using floats or positioning.

Same UI built with Flexbox and traditional layout models:

```html
<!-- Flexbox -->
<style>
  .container {
    display: flex;
    justify-content: space-between;
  }
  .item {
    flex: 1;
  }
</style>

<div class="container">
  <div class="item">Item 1</div>
  <div class="item">Item 2</div>
  <div class="item">Item 3</div>
  <div class="footer">Footer</div>
</div>

<!-- Traditional layout -->
<style>
  .container {
    overflow: hidden;
  }
  .item {
    float: left;
    width: 33.33%;
  }
</style>
<div class="container">
  <div class="item">Item 1</div>
  <div class="item">Item 2</div>
  <div class="item">Item 3</div>
  <div class="footer">Footer</div>
</div>
```

The difference between the two layouts is that the Flexbox layout is more flexible and responsive, and it provides a more efficient way to create complex layouts. The traditional layout model is based on floats and positioning, which can be difficult to use for complex layouts.

Going forward, we should forget the traditional layout models and focus on using flexbox. It is a good idea to know about the traditional layout models for legacy purposes.

## More resources

- [MDN CSS Flexbox](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Basic_Concepts_of_Flexbox)
- [CSS Tricks: A Complete Guide to Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
- [Flexbox Froggy](https://flexboxfroggy.com/)
- [Flexbox Defense](http://www.flexboxdefense.com/)
- [Flexbox Patterns](https://www.flexboxpatterns.com/)
- [Flexbox Cheatsheet](https://yoksel.github.io/flex-cheatsheet/)
- [Flexbox Playground](https://codepen.io/enxaneta/full/adLPwv/)
