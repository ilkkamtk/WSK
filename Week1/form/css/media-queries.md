# Media Queries (Responsive Design)

Media queries are used to apply different styles to an element based on the device, such as the screen size, the screen resolution, and other media features. They are used to create responsive designs that adapt to different devices, such as desktops, tablets, and smartphones.

Media queries consist of a few parts: `@media` keyword, then an optional media type and any number of media features combined with logical operators.

## Breakpoints

One of the most common usage for a media query is responsive design through the use of `breakpoints`. A breakpoint is a specific point in the screen width at which the styles should change. For example, the styles for a desktop might be different from the styles for a smartphone, so the breakpoints are used to define the different screen sizes at which the styles should change. This way we do not need to create a different HTML document for each device, instead the same content is served to all devices, and the styles are adapted to the device resolution.

Some breakpoints for different devices might be something like this:

- `@media (max-width: 600px) { ... }`: styles for smartphones
- `@media (min-width: 600px) and (max-width: 1200px) { ... }`: styles for tablets
- `@media (min-width: 1200px) { ... }`: styles for desktops and laptops

Note that the target device size and resolutions might evolve over time, what might now be a reasonable breakpoint for a given device might not be reasonable in the future.

## Usage

Media queries can also be used to apply styling to different [media types](https://developer.mozilla.org/en-US/docs/Web/CSS/@media#media_types), such as `print` or `screen`. For example, the styles for a printed document might be different from the styles for a screen, by hiding elements of the page which make no sense in a printed document.

Media queries are used in the CSS as follows:

```css
@media print {
  /* styles for printed documents */
}
```

The style definitions are defined within the brackets (`{}`), and they can be defined in a few different ways, such as:

```css
.container {
  @media screen (max-width: 600px) {
    /* styles for smartphones */
    width: 100%;
  }
}
```

or

```css
@media screen (max-width: 600px) {
  .container {
    /* styles for smartphones */
    width: 100%;
  }
}
```

In both of these examples the same `width: 100%;` style is applied to the `.container` element when the screen width is less than 600 pixels. The difference of these two different ways of defining the media query becomes a bit more clear when we have multiple elements which we need to style.

```css
.container {
  @media screen (max-width: 600px) {
    width: 100%;
  }
}

.avatar {
  @media screen (max-width: 600px) {
    width: 5rem;
    border-radius: 50%;
  }
}
```

vs

```css
@media screen (max-width: 600px) {
  .container {
    width: 100%;
  }

  .avatar {
    width: 5rem;
    border-radius: 50%;
  }
}
```

Both of these examples are correct and behave similarly, but the second example is a bit more clear and easier to read and maintain, especially when we have many elements which we need to style.

## Logical operators

The logical operators `and`, `not`, `,`, and `only` can be used to combine multiple media features in a media query.

Example of using the `and` operator:

```css
@media screen and (max-width: 600px) and (orientation: portrait) {
  /* styles for smartphones in portrait mode */
}
```

Example of using the `not` operator:

```css
@media not screen and (max-width: 600px) {
  /* styles for devices with a screen width greater than 600 pixels */
}
```

Example of using the `,` operator:

```css
@media screen and (max-width: 600px), (max-height: 600px) {
  /* styles for devices with a screen width less than or equal to 600 pixels or a screen height less than or equal to 600 pixels */
}
```

Example of using the `only` operator:

```css
@media only screen and (max-width: 600px) {
  /* styles for devices with a screen width less than or equal to 600 pixels */
}
```

Logical operators can be combined to create complex media queries that apply styles to specific devices and specific conditions.

```css
@media only screen and (max-width: 600px) and (orientation: portrait) {
  /* styles for smartphones in portrait mode */
}
```

## Media ranges

Media ranges can be used with mathematical operators such as `>`, `<`, `>=`, and `<=` to define the range of sizes for which the styles should be applied.

[Read more in media-range.md](media-range.md).

## Common use cases

Common use cases for media queries and breakpoints include:

- Changing the layout of the page
- Hiding elements that do not make sense on a small screen
- Changing the font size
- Changing the image size
- Changing the color scheme
- Changing the navigation menu
- Changing the number of columns in a grid
- Changing the position of elements

More about media queries available in the [MDN Web Docs about CSS Media Queries](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_media_queries/Using_media_queries), some information available in the [Wikipedia entry for Media queries](https://en.wikipedia.org/wiki/Media_queries).

## Examples

- [examples/media-queries/media-queries.html](../examples/media-queries/media-queries.html)
- [examples/media-queries/responsive-example1.html](../examples/media-queries/responsive-example1.html)
- [examples/media-queries/media-query-range.html](../examples/media-queries/media-query-range.html)

## More resources

- [MDN Web Docs CSS Media Queries](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_media_queries)
- [Wikipedia entry for Media queries](https://en.wikipedia.org/wiki/Media_queries)
- [CSS-Tricks Media Queries](https://css-tricks.com/a-complete-guide-to-css-media-queries/)
- [W3Schools Media Queries](https://www.w3schools.com/css/css_rwd_mediaqueries.asp)
- [MDN Web Docs about Responsive Design](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Responsive_Design)
- [W3Schools Responsive Web Design](https://www.w3schools.com/css/css_rwd_intro.asp)
- [Wikipedia Responsive Web Design](https://en.wikipedia.org/wiki/Responsive_web_design)
