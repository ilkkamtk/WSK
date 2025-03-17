# Lecture Notes: Introduction to CSS

## 1. What is CSS?

- CSS stands for Cascading Style Sheets.
- While HTML is used to define the structure and semantics of the content, CSS is used to style the content and layout.
- CSS is designed to separate presentation and content.
- With CSS, you can change fonts, colors, sizes, spacing, add multiple columns, animations, transitions, and more.

## 2. Understanding CSS

- Cascading refers to the procedure that determines which style will apply to a certain section.
- Style refers to the look of a certain element.
- Sheets refer to a set of rules to determine how the webpage will look.

## 3. CSS Versions

- The latest version is CSS3, but versioning is [a bit complicated](https://css-tricks.com/css4/).

## 4. Inserting CSS into HTML

- **External style sheet**: Styles are specified in an external CSS file. This is the most common practice. You can define the look of an entire website with a single CSS file. Insert into the `<head>` part of the HTML document: `<link rel="stylesheet" type="text/css" href="mystyle.css">`.
- **Internal style sheet**: Apply specific styles to a single HTML document. Insert into the `<head>` part of the HTML document:

  ```html
  <style>
    body {
      background-color: linen;
    }
    h1 {
      color: maroon;
      margin-left: 40px;
    }
  </style>
  ```

- **Inline styles**: Styles are defined directly in an HTML element: `<h1 style="color:blue;margin-left:30px;">This is a heading</h1>`.

## 5. Ruleset

- A ruleset (or rule) consists of a selector and a declaration, which is a combination of a property and property value:

  ```css
  selector {
    property: value;
  }
  ```

  ```css
  h1 {
    color: blue;
    font-size: 12px;
  }
  ```

## 6. Selectors

- Selectors are patterns used to select the elements you want to style.
- CSS selectors can be divided into five categories: Simple selectors, Combinator selectors, Pseudo-class selectors, Pseudo-elements selectors, and Attribute selectors.

## 7. Simple Selectors

- Simple selectors select elements based on tag name, id, or class:

  ```css
  /* Selects all <p> elements */
  p {
    color: red;
  }
  /* Selects the element with id="intro" */
  #intro {
    font-size: 20px;
  }
  /* Selects all elements with class="center" */
  .center {
    text-align: center;
  }
  ```

## 8. Combinator Selectors

- A CSS selector can contain more than one simple selector. Types include descendant selector (space), child selector (>), adjacent sibling selector (+), and general sibling selector (~):

  ```css
  /* Selects all <p> elements inside <div> elements */
  div p {
    color: red;
  }
  /* Selects all <p> elements where the parent is a <div> element */
  div > p {
    color: red;
  }
  /* Selects all <p> elements that are placed immediately after <div> elements */
  div + p {
    color: red;
  }
  /* Selects all <p> elements that are siblings of <div> elements */
  div ~ p {
    color: red;
  }
  ```

## 9. Pseudo-classes and Pseudo-elements

- A pseudo-class is used to define a special state of an element. It can be used to style an element when a user mouses over it, style visited and unvisited links differently, or style an element when it gets focus.
- A CSS pseudo-element is used to style specified parts of an element. It can be used to style the first letter or line of an element, or insert content before or after the content of an element:

  ```css
  /* Selects any <a> element that is being hovered */
  a:hover {
    color: yellow;
  }
  /* Selects any <a> element that has been visited */
  a:visited {
    color: purple;
  }
  /* Selects the first letter of every <p> element */
  p::first-letter {
    color: #ff0000;
    font-size: xx-large;
  }
  /* Selects the first line of every <p> element */
  p::first-line {
    color: #ff0000;
    font-variant: small-caps;
  }
  ```

## 10. Attribute Selectors

- The attribute selector is used to select elements with a specified attribute. Presence and value selectors enable the selection of an element based on the presence of an attribute or the value of the attribute. Substring matching selectors allow for advanced matching of substrings inside the value of the attribute:

  ```css
  /* Selects all elements with a target attribute */
  [target] {
    background-color: yellow;
  }
  /* Selects all elements with a target="_blank" attribute */
  [target='_blank'] {
    background-color: yellow;
  }
  /* Selects all elements with a target attribute value containing "w3schools" */
  [target*='w3schools'] {
    background-color: yellow;
  }
  ```

## Assignment

1. Create a simple CSS file for the previous HTML exercise. Requirements:
   - Use external style sheet.
   - _Don't use default font_.
   - Add hover effect to the link. Also don't use default color in the link and remove underline.
   - Add border and rounded corners to the image.
   - Every second row in the table should have a different background color.
   - The list should not have default bullet points.
