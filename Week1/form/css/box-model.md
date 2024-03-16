# Box model

The box model is used to control the layout of the elements in the HTML document. It consists of the content, padding, border, and margin of the element. The box model is used to control the size, position, and spacing of the elements in the HTML document.

## Content

The content of the element is the area where the text and images are displayed. The content area is specified by the `width` and `height` properties.

## Padding

The padding of the element is the area between the content and the border. The padding area is specified by the `padding` property. The padding area is used to create space around the content area.

## Border

The border of the element is the area between the padding and the margin. The border area is specified by the `border` property. The border area is used to create a border around the padding area.

## Margin

The margin of the element is the area outside the border. The margin area is specified by the `margin` property. The margin area is used to create space around the border area.

## Example

The following example shows how the box model is used to control the layout of the elements in the HTML document:

```html
<!DOCTYPE html>
<html>
  <head>
    <style>
      .box {
        width: 200px;
        height: 200px;
        padding: 20px;
        border: 10px solid black;
        margin: 20px;
      }
    </style>
  </head>
  <body>
    <div class="box">This is a box.</div>
  </body>
</html>
```

In the example above, the `.box` class is used to apply the styles to the `div` element. The `width` and `height` properties are used to specify the size of the content area. The `padding` property is used to create space around the content area. The `border` property is used to create a border around the padding area. The `margin` property is used to create space around the border area.

## Box model properties

The box model properties are used to control the layout of the elements in the HTML document. Some of the common box model properties are:

- `width`: specifies the width of the content area
- `height`: specifies the height of the content area
- `padding`: specifies the padding area
- `border`: specifies the border area
- `margin`: specifies the margin area

For these properties, the `value` can be specified in many different units, such as `px`, `em`, `rem`, `%`, and others.

![Box model, image credit by MDN](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/The_box_model/box-model.png)

Example image credit by [MDN](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/The_box_model). The image showcases the box model properties and how they are used to control the layout of the elements in the HTML document.

Padding is applied around the content, but inside the border. The border is applied around the padding and the content. Finally, the margin is applied around the border, but outside the border.

```css
div {
  width: 300px;
  padding: 0.5rem;
  border: 1px solid #ccc;
  margin: 0.5rem;
  box-sizing: border-box;
}
```

### Calculating the total size of an element

The total size of an element is calculated as follows:

- `width` = `content width` + `left padding` + `right padding` + `left border` + `right border` + `left margin` + `right margin`
- `height` = `content height` + `top padding` + `bottom padding` + `top border` + `bottom border`

With our example above, the total width and height of the `div` element would be:

- `width` = 300px + 0.5rem + 0.5rem + 1px + 1px + 0.5rem + 0.5rem = 300px + 2px + 1rem
- `height` = 300px + 0.5rem + 0.5rem + 1px + 1px + 0.5rem + 0.5rem = 300px + 2px + 1rem

The width takes into account left and right padding, and left and right border, and the height takes into account top and bottom padding, and top and bottom border. Therefore some of the padding and border is counted twice, which is why the total width and height is `300px + 2px + 1rem`.

`300px + 2px + 1rem` does not make much sense, so let's convert the `rem` to `px`, assuming that the `font-size` is `16px` for the root element.

- `1rem` = `16px`
- `0.5rem` = `8px`

So the total width and height of the `div` element would be:

- `width` = 300px + 2px + 8px = 310px
- `height` = 300px + 2px + 8px = 310px

Well, no height is actually defined in the CSS, so the height might differ depending on the content of the `div` element.

### Box-sizing

The `box-sizing` property is used to specify how the total width and height of an element is calculated. The `box-sizing` property can have the following values:

- `content-box`: specifies that the total width and height of an element is calculated as `content width` + `padding` + `border`
- `border-box`: specifies that the total width and height of an element is calculated as `content width` + `padding` + `border`

The `content-box` value is the default value for the `box-sizing` property. The `border-box` value is used to specify that the total width and height of an element is calculated as `content width` + `padding` + `border`.

```css
div {
  box-sizing: border-box;
}
```

## More resources

- [CSS Box Model](https://www.w3schools.com/css/css_boxmodel.asp)
- [MDN Web Docs about Box Model](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Box_Model/Introduction_to_the_CSS_box_model)
- [CSS-Tricks about Box Model](https://css-tricks.com/the-css-box-model/)
