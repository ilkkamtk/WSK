
# CSS Format

The CSS code is often formatted in a way which is readable:

```css
h1 {
  color: red;
  font-size: 24px;
}
```

But the code can also be written in a single line:

```css
h1 { color: red; font-size: 24px; }
```

Both of these examples style the `h1` element in the same way. The first example is easier to read and maintain. The second example is more compact, and it is often used when the CSS code is minified, which means that the code is compressed to reduce the file size. As humans, we write code for ourselves and other humans to read, which means that the first example is often preferred. Let the automated tools handle the minification.

It is also possible to omit some spaces from the styling:

```css
h1{color:red;font-size:24px;}
```

This is still valid CSS, but it is harder to read and understand. Especially if multiple styles to different elements are written in the same line:

```css
h1{color:red;font-size:24px;}p{color:blue;font-size:16px;}div.colorful{color:yellow;font-size:12px;}
```

Automated formatting tools in code editors can help with formatting the code in a readable way, such as [Prettier](https://prettier.io/). Once the styles are written, tooling such as [Webpack](https://webpack.js.org/) can be used to minify the code for production use. For now, these are a bit too advanced for us. Let's focus on writing readable code.

Instead of the horrible oneliner, let's write the styles in a readable way:

```css
h1 {
  color: red;
  font-size: 24px;
}

p {
  color: blue;
  font-size: 16px;
}

div.colorful {
  color: yellow;
  font-size: 12px;
}
```

It's a bit more code, but now it is much easier to read and understand. This is important when working in a team, or when you need to revisit the code after a while.



This material tries to follow the best practices in writing readable code. If some parts of the material are not formatted properly, or contain other issues, feel free to create a proposal fix through pull requests or issues.
