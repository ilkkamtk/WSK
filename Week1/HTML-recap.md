# Lecture Notes: Introduction to HTML

## 1. What is HTML?

- HTML stands for HyperText Markup Language.
- It is the building block of the World Wide Web.
- Hypertext is text displayed on a computer or other electronic device that contains references to other text that is immediately accessible to the user.
- Hypertext can contain tables, lists, forms, images, and other presentation elements.
- HTML is an easy-to-use and flexible form for sharing information over the Internet.

## 2. What can you do with HTML?

- Publish documents online with text, images, lists, spreadsheets, and more.
- Access online resources such as images, videos, or other HTML documents through hyperlinks.
- Create forms to collect user input, such as name, email address, comments, etc.
- Include images, videos, sound clips, applications, and other HTML documents directly in the HTML document.
- Create an offline version of your website that works without the Internet (Progressive Web App).
- Save the information to the user's web browser and access it later.

## 3. HTML Tools

- To get started with HTML coding, all you need is a simple text editor and a web browser.
- Recommended editors: Visual Studio Code, WebStorm, NeoVim...

## 4. Example HTML Document

```html
<! DOCTYPE html>
<html>
  <head>
    <title>Page Title</title>
  </head>
  <body>
    <h1>This is a Heading</h1>
    <p>This is a paragraph.</p>
  </body>
</html>
```

- The first line `<! DOCTYPE html>` is the document type definition (DTD).
- The `<head>` element gathers elements that provide information about the document.
- The `<body>` element contains the actual content of the document.

## 5. HTML Tags and Elements

- HTML consists of HTML elements that consist of tags and content.
- Tags consist of a keyword surrounded by angle brackets. E.g `<html>`, `<head>`, `<body>`, `<title>`, `<p>`, and so on.
- There are a little over 100 tags in HTML 5.

## 6. HTML Attributes

- Attributes contain additional information that you don't want to appear in the actual content.
- Attribute structure: Attribute name followed by = The attribute value wrapped in quotation marks.

## 7. Empty HTML Elements

- Some elements are not supposed to have any content. They are called ‘empty’ elements.
- For example `<img>` contains two attributes but no content and no closing tag (`</img>`).

## 8. Block & Inline Elements

- Block-level elements: Appear on a new line following the content that precedes it. Usually structural elements.
- Inline elements: Contained within block-level elements. Usually used with text.

## 9. Special Characters

- Some characters like <, >, &, and “ are used in HTML syntax.
- To include the special characters or entities you use character references or UTF codes.

## 10. What's in the head? Metadata in HTML

- The `<head>` element contains metadata about the document.
- Metadata is data about the HTML document. Metadata is not displayed.
- Metadata is used by browsers (how to display content), search engines (keywords), and other web services.
- You can use the `<meta>` tag to specify metadata.

  - For example Facebook uses the `<meta>` tag to specify the title, description, and image for a page:

  ```html
  <meta property="og:title" content="The Rock" />
  <meta
    property="og:description"
    content="The Rock is a 1996 action film that primarily takes place on Alcatraz Island, and the San Francisco Bay area. It was directed by Michael Bay, produced by Don Simpson and Jerry Bruckheimer."
  />
  <meta
    property="og:image"
    content="http://ia.media-imdb.com/images/rock.jpg"
  />
  ```

## 11. HTML Links

- HTML links are hyperlinks.
- You can click on a link and jump to another document or another place in the same document.
- When you move the mouse over a link, the mouse arrow will turn into a little hand.
- Links are defined with the `<a>` tag. The URL of the page the link goes to is specified in the `href` attribute:

```html
<a href="https://www.w3schools.com">Visit W3Schools.com!</a>
```

## 12. HTML Images

- The `<img>` tag is used to embed an image in an HTML page.
- Images are not technically inserted into a web page; images are linked to web pages. The `<img>` tag creates a holding space for the referenced image.
- The `<img>` tag has two required attributes: `src` and `alt`.
- The `src` attribute specifies the path to the image.
- The `alt` attribute specifies an alternate text for the image, if the image for some reason cannot be displayed.
- `<img>`is an empty element, which means that it contains attributes only and has no closing tag.
- Example:

```html
<img
  src="
https://www.w3schools.com/images/picture.jpg"
  alt="Mountain"
/>
```

## 13. HTML Tables

- The `<table>` tag defines an HTML table.
- Each table row is defined with a `<tr>` tag. Each table header is defined with a `<th>` tag. Each table data/cell is defined with a `<td>` tag.
- By default, the text in `<th>` elements are bold and centered.
- By default, the text in `<td>` elements are regular and left-aligned.
- Example:

```html
<table style="width:100%">
  <tr>
    <th>Firstname</th>
    <th>Lastname</th>
    <th>Age</th>
  </tr>
  <tr>
    <td>Jill</td>
    <td>Smith</td>
    <td>50</td>
  </tr>
  <tr>
    <td>Eve</td>
    <td>Jackson</td>
    <td>94</td>
  </tr>
</table>
```

## 14. HTML Lists

- HTML lists are used to present list of information in well-formed and semantic way.
- There are three different types of lists in HTML:
  - Unordered list: A list of items in which the order does not explicitly matter.
  - Ordered list: A list of items in which the order does explicitly matter.
  - Description list: A list of items in which a term is followed by a definition.
  - Example:

```html
<ul>
  <li>Coffee</li>
  <li>Tea</li>
  <li>Milk</li>
</ul>
<ol>
  <li>Coffee</li>
  <li>Tea</li>
  <li>Milk</li>
</ol>
<dl>
  <dt>Coffee</dt>
  <dd>- black hot drink</dd>
  <dt>Milk</dt>
  <dd>- white cold drink</dd>
</dl>
```

## 15. HTML Validation

- HTML validation is the process of ensuring that the HTML code is error-free.
- It checks the code for syntax errors, and it checks the code for compliance with the standards set by the W3 Consortium.
- You can validate your HTML code using the W3C Markup Validation Service: <https://validator.w3.org/>

## Exercise

1. Create a simple HTML document. Requrements:
   - The document should have a title.
   - The document should have a heading.
   - The document should have a paragraph.
   - The document should have a link.
   - The document should have an image.
   - The document should have a table.
   - The document should have a list.
   - The document should be validated using the W3C Markup Validation Service.
   - The document should be uploaded to Metropolia's web server and the link to the document should be shared in the submission.
