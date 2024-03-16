# Container query

Similar to media queries, container queries allow you to apply styles to an element based on the size of its container. This is useful when you want to apply styles to an element based on the size of its container, rather than the size of the viewport.

```css
@container (max-width: 600px) {
  /* styles for small containers */
  .content {
    width: 100%;
  }
}
```

In this example, the `width: 100%;` style is applied to the `.content` element when the container width is less than 600 pixels.

HTML for this could be:

```html
<div class="container">
  <div class="content">
    <p>Some content</p>
  </div>
</div>
```

For the `@container` to work, the `.container` element must have `container-type` property defined.

```css
.container {
  container-type: inline-size;
}
```

[examples/container-queries/container-query1.html](../examples/container-queries/container-query1.html)

This is a simple example, but it becomes more useful when you have multiple elements which you need to style based on the size of their container.

```css
@container (max-width: 600px) {
  .content {
    width: 100%;
  }

  .avatar {
    width: 7rem;
    border-radius: 50%;
  }
}
```

In this example, the `width: 100%;` style is applied to the `.content` element and the `width: 7rem;` and `border-radius: 50%;` styles are applied to the `.avatar` element when the container width is less than 600 pixels.

[examples/container-queries/container-query2.html](../examples/container-queries/container-query2.html)


## Syntax

The syntax for container queries is similar to media queries, but with a few differences. The `@container` rule is used to define the container query, and the styles are defined within the brackets (`{}`).

```css
@container (max-width: 600px) {
  .content {
    /* styles for small containers */
    width: 100%;
  }
}
```

## Container query length units

Container queries use the same length units as media queries, such as `px`, `em`, `rem`, `vw`, `vh`, etc.

```css
@container (max-width: 50em) {
  .content {
    /* styles for small containers */
    width: 100%;
  }
}
```

## More resources

Altough container queries are relatively new, it has over 90% global browser support.

- [Can I use CSS Container Queries](https://caniuse.com/css-container-queries)
- [MDN container queries](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_containment/Container_queries)
- [MDN container types](https://developer.mozilla.org/en-US/docs/Web/CSS/container-type)
