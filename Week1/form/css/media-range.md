# CSS Media Range

Media ranges can be used with the `@media` and `@container` rules to define styles based on the size of the viewport or the size of the container, respectively.

Media ranges can be used with mathematical operators such as `>`, `<`, `>=`, and `<=` to define the range of sizes for which the styles should be applied.

Example of a media range in a media query:

```css
@media (600px <= width <= 800px) {
  /* some styles */
}
```

The above media range syntax is equivalent to the following:

```css
@media (min-width: 600px) and (max-width: 800px) {
  /* some styles */
}
```

[examples/media-queries/media-query-range.html](../examples/media-queries/media-query-range.html)

Similarly for a [container query](container-query.md):

```css
@container (600px <= width <= 800px) {
  /* some styles */
}
```

The above media range syntax is equivalent to the following:

```css
@container (min-width: 600px) and (max-width: 800px) {
  /* some styles */
}
```

[examples/container-queries/container-query-range.html](../examples/container-queries/container-query-range.html)

## Differences from traditional media queries

The media range syntax can be a bit confusing at first, especially if you're used to the traditional media query syntax. For example, the following media query:

```css
@media screen and (max-width: 500px) {
  /* some styles */
}
```

would look like this in a media range:

```css
@media screen and (500px >= width) {
  /* some styles */
}
```

The `max-width` value becomes `>=` and the `width` part is moved to the right side of the operator.

Similarly, the following media query:

```css
@media screen and (min-width: 500px) {
  /* some styles */
}
```

would look like this in a media range:

```css
@media screen and (500px <= width) {
  /* some styles */
}
```

The `min-width` value becomes `<=`.

The length value (500px in the examples) and the `width` part of the media range can be in other order, but the operator must be in the middle.

```css
@media screen and (width <= 500px) {
  /* some styles */
}

@media screen and (width >= 500px) {
  /* some styles */
}
```

[examples/media-queries/media-query-range2.html](../examples/media-queries/media-query-range2.html)

## More resources

- [Can I use CSS Media Range Syntax](https://caniuse.com/css-media-range-syntax)
- [W3C specification for Media Queries Level 4](https://www.w3.org/TR/mediaqueries-4/#mq-range-context)
- [Bram.us - Media Queries Level 4: Media Query Range Contexts](https://www.bram.us/2021/10/26/media-queries-level-4-media-query-range-contexts/)
- [web.dev - New syntax for range media queries](https://web.dev/articles/media-query-range-syntax)
- [MDN Web Docs - Media Queries](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_media_queries)
