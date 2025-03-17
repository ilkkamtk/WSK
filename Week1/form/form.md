# HTML Form

## Introduction

In this material, we will create a simple HTML form with a few inputs and a submit button. We will then add labels to the inputs, add responsive design to the form through media queries, and use grid and flexbox to layout the form. We will also explain the difference between input submit and button submit, and utilise input types and attributes to create a more interactive form.

## Creating the Form

Let's start by creating a simple HTML form with a few inputs and a submit button. Here is the code for the form:

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Page Title</title>
  </head>

  <body>
    <form>
      <input type="text" id="name" name="name" />
      <input type="email" id="email" name="email" />
      <input type="password" id="password" name="password" />
      <button type="submit">Submit</button>
    </form>
  </body>
</html>
```
- [examples/form/form0.html](examples/form/form0.html)


The form contains some fields, but looking at it, it does not make much sense. Let's add some labels for clarity and accessibility.

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Page Title</title>
  </head>

  <body>
    <form>
      <label for="name">Name:</label>
      <input type="text" id="name" name="name" />

      <label for="email">Email:</label>
      <input type="email" id="email" name="email" />

      <label for="password">Password:</label>
      <input type="password" id="password" name="password" />

      <button type="submit">Submit</button>
    </form>
  </body>
</html>
```

In this code, we have created a simple form with three inputs: name, email, and password. We have also added labels to the inputs to make the form more accessible.

- [MDN documentation for form element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/form)
- [examples/form/form1.html](examples/form/form1.html)

## Adding basic styling

Before we jump into responsive design, let's add some basic styling to the page, such as font sizes, family, and colors for the text, and a bit of padding for the inputs, to make them easier for the user.

```css
html {
  font-size: 16px;
}

body {
  font-family: Helvetica, Arial, sans-serif;
  color: #333;
}

input {
  padding: 0.25rem;
}
```

These settings help set the base styles for the page. A page without the `font-family` will look amateurish and unprofessional. Let's avoid that. In this exercise, we will set three font families: `Helvetica`, `Arial`, and `sans-serif`. The `sans-serif` font family is a fallback font family, which will be used if the first two font families are not available in the user's system.

The `font-size` will later be used by the `rem` unit to set the size of the inputs and buttons. For the rem values to work, the `font-size` must be set on the `html` element. `1rem` equals to the `font-size` of the `html` element. Now that the `font-size` in html element is 16px, 1rem equals to 16px. Similarly, 0.5rem equals to 8px, and 2rem equals to 32px.

Input elements will now have a bit of padding, which makes them easier to click on and use. The padding is set to `0.25rem`, which is 4px when the `font-size` is 16px in the `html` element. Feel free to try different font sizes in the html element and see how the padding changes.


## Adding Responsive Design

Next, let's add responsive design to the form using media queries. We will use media queries to change the layout of the form based on the screen size. Here is the code for the media queries:

```css
/* Small screens */
@media (max-width: 600px) {
  /* Add styles here */
}

/* Medium & large screens */
@media (min-width: 601px) {
  /* Add styles here */
}

/* Medium screens */
@media (min-width: 601px) and (max-width: 1024px) {
  /* Add styles here */
}

/* Large screens */
@media (min-width: 1025px) {
  /* Add styles here */
}
```

In the media queries, we will change the layout of the form to make it more readable and accessible on different screen sizes.

HTML for the form must be changed to include the media queries, and a meta tag to instruct the browser to use the device's width and scale for the viewport:

```html
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Page Title</title>

    <style>
      html {
        font-size: 16px;
      }

      body {
        font-family: Helvetica, Arial, sans-serif;
        color: #333;
      }

      input {
        padding: 0.25rem;
      }

      /* Small screens */
      @media (max-width: 600px) {
        /* Add styles here */
      }

      /* Medium & large screens */
      @media (min-width: 601px) {
        /* Add styles here */
      }

      /* Medium screens */
      @media (min-width: 601px) and (max-width: 1024px) {
        /* Add styles here */
      }

      /* Large screens */
      @media (min-width: 1025px) {
        /* Add styles here */
      }
    </style>
  </head>

  <body>
    <form>
      <label for="name">Name:</label>
      <input type="text" id="name" name="name" required />

      <label for="email">Email:</label>
      <input type="email" id="email" name="email" required />

      <label for="password">Password:</label>
      <input type="password" id="password" name="password" required />

      <button type="submit">Submit</button>
    </form>
  </body>
</html>
```

In addition to the `<style>` tag in the `<head>` section, we have added a meta tag `<meta name="viewport" content="width=device-width, initial-scale=1.0" />` to the `<head>` section. This tag is required to control the layout of the page on different devices and screen sizes.

Next, the media queries must be filled with the appropriate styles to make the form more readable and accessible on different screen sizes.

- [css/media-queries.md](css/media-queries.md)
- [MDN documentation for media queries](https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries)
- [MDN documentation for meta tag viewport](https://developer.mozilla.org/en-US/docs/Web/HTML/Viewport_meta_tag)
- [MDN documentation for responsive design](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Responsive_Design)
- [examples/form/form2.html](examples/form/form2.html)

## Using Grid to Layout the Form

Now, let's use grid to layout the form. We will create a 2x2 grid with the labels and inputs. Here is the code for the grid layout:

```css
form {
  display: grid;
  grid-template-columns: 1fr 2fr;
  grid-gap: 10px;
}
```

In this code, we have used the `display: grid;` property to define the form as a grid container. We have also used the `grid-template-columns` property to define the columns of the grid, and the `grid-gap` property to define the gap between the grid items.

The HTML for the form must be updated to include the grid layout:

```html
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
      html {
        font-size: 16px;
      }

      body {
        font-family: Helvetica, Arial, sans-serif;
        color: #333;
      }

      input {
        padding: 0.25rem;
      }

      input {
        padding: 0.25rem;
      }

      /* Small screens */
      @media (max-width: 600px) {
        /* Add styles here */
        form {
          display: flex;
          flex-direction: column;
        }
      }

      /* Medium & large screens */
      @media (min-width: 601px) {
        form {
          display: grid;
          grid-template-columns: 1fr 2fr;
          grid-gap: 10px;
        }
      }

      /* Medium screens */
      @media (min-width: 601px) and (max-width: 1024px) {
        /* Add styles here */
      }

      /* Large screens */
      @media (min-width: 1025px) {
        /* Add styles here */
      }
    </style>
  </head>

  <body>
    <form>
      <label for="name">Name:</label>
      <input type="text" id="name" name="name" required />

      <label for="email">Email:</label>
      <input type="email" id="email" name="email" required />

      <label for="password">Password:</label>
      <input type="password" id="password" name="password" required />

      <button type="submit">Submit</button>
    </form>
  </body>
</html>
```

Now the form will be displayed as a 2x2 grid with the labels and inputs in medium and larger screen, and as a column in smaller screens. The column UI is achieved with flexbox.


Read up about grid layout:
- [grid layout](css/grid.md)
- [MDN documentation for grid layout](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout)
- [examples/form/form3.html](examples/form/form3.html)

## Mobile UI

Next, we will add a bit more custom styling to the small screen layout to make it more readable and accessible in mobile devices.

```css
button[type="submit"] {
  margin-top: 1rem;
}

/* Small screens */
@media (max-width: 600px) {
  form {
    display: flex;
    flex-direction: column;
  }

  input,
  button {
    font-size: 1.5rem;
    padding: 0.5rem;
  }

  label {
    margin-top: 0.5rem;
  }

  button[type="submit"] {
    padding: 1rem;
  }
}

/* Medium & large screens */
@media (min-width: 601px) {
  form {
    display: grid;
    grid-template-columns: 1fr 2fr;
    grid-gap: 10px;
  }
}

/* Medium screens */
@media (min-width: 601px) and (max-width: 1024px) {
  /* Add styles here */
}

/* Large screens */
@media (min-width: 1025px) {
  /* Add styles here */
}
```

Now in the small screens the inputs will have a larger font size and padding, and the submit button will have a larger font size and padding as well. This makes it easier for the user to fill in the form on a mobile device.

We also added `margin-top` style to the submit button for all screen sizes to give it some space from the last input.

Read up about flexbox and have a look at the example:
- [flexbox](css/flexbox.md)
- [examples/form/form4.html](examples/form/form4.html)

## More inputs

Now, lets add few more inputs to the form, such as date, checkbox, file, and number field for age.

```html
<!DOCTYPE html>

<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
      html {
        font-size: 16px;
      }

      body {
        font-family: Helvetica, Arial, sans-serif;
        color: #333;
      }

      input {
        padding: 0.25rem;
      }

      button[type="submit"] {
        margin-top: 1rem;
      }

      /* Small screens */
      @media (max-width: 600px) {
        form {
          display: flex;
          flex-direction: column;
        }

        input,
        button {
          font-size: 1.5rem;
          padding: 0.5rem;
        }

        label {
          margin-top: 0.5rem;
        }

        button[type="submit"] {
          padding: 1rem;
        }
      }

      /* Medium & large screens */
      @media (min-width: 601px) {
        form {
          display: grid;
          grid-template-columns: 1fr 2fr;
          grid-gap: 10px;
        }
      }

      /* Medium screens */
      @media (min-width: 601px) and (max-width: 1024px) {
        /* Add styles here */
      }

      /* Large screens */
      @media (min-width: 1025px) {
        /* Add styles here */
      }
    </style>
  </head>

  <body>
    <form>
      <label for="username">Username:</label>
      <input type="text" id="username" name="username" required />

      <label for="first-name">First name:</label>
      <input type="text" id="first-name" name="first-name" required />

      <label for="last-name">Last name:</label>
      <input type="text" id="last-name" name="last-name" required />

      <label for="email">Email:</label>
      <input type="email" id="email" name="email" required />

      <label for="password">Password:</label>
      <input type="password" id="password" name="password" required />

      <label for="date">Today's date:</label>
      <input type="date" id="date" name="date" />

      <label for="age">Age:</label>
      <input type="number" id="age" name="age" min="18" max="100" />

      <label for="file">Upload a file:</label>
      <input type="file" id="file" name="file" />

      <div>
        <!-- Empty div added for grid layout. -->
      </div>
      <div>
        <input type="checkbox" id="terms" name="terms" required />
        <label for="terms">I agree to the terms and conditions:</label>
      </div>

      <button type="submit">Submit</button>
    </form>
  </body>
</html>
```

[examples/form/form5.html](examples/form/form5.html)

Now that we have a bit more complex form, the height of the form in mobile devices might be a bit too long. The submit button might now be near the bottom of the screen, and the user might have to scroll to reach it. We can fix this by adding a bit of margin to the bottom of the form in small screens.

```css
/* Small screens */
@media (max-width: 600px) {
  form {
    margin-bottom: 2rem;
  }
}
```

The mobile UI looks good now. Next lets focus on improving the medium and large screen.

[examples/form/form6.html](examples/form/form6.html)

## Medium and larger screens

First thing we should perhaps do first is to make sure the submit button is easier to reach. We can do this by making sure the button is a bit larger and takes the full width of the screen.

```css
/* Medium & large screens */
@media (min-width: 601px) {
  button[type="submit"] {
    grid-column: 1 / -1;
    padding: 1rem;
  }
}
```

As the form is a grid in medium and large screens, we can use the `grid-column` property to make the submit button take the full width of the form. The style `grid-column: 1 / -1;` means the button will start at the first column and end at the last column of the grid. The value of `grid-column` property is a `grid-line`, which can have one two values. Read more about the [grid column property in MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-column).

Currently our HTML looks like this:

```html
<!DOCTYPE html>

<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
      html {
        font-size: 16px;
      }

      body {
        font-family: Helvetica, Arial, sans-serif;
        color: #333;
      }

      input {
        padding: 0.25rem;
      }

      button[type="submit"] {
        margin-top: 1rem;
      }

      /* Small screens */
      @media (max-width: 600px) {
        form {
          display: flex;
          flex-direction: column;
          /* The form styling above is now merged into this selector. No need to select form element twice. */
          margin-bottom: 2rem;
        }

        input,
        button {
          font-size: 1.5rem;
          padding: 0.5rem;
        }

        label {
          margin-top: 0.5rem;
        }

        button[type="submit"] {
          padding: 1rem;
        }
      }

      /* Medium & large screens */
      @media (min-width: 601px) {
        form {
          display: grid;
          grid-template-columns: 1fr 2fr;
          grid-gap: 10px;
        }

        /* grid-column helps the submit button span the entire width of the form. */
        button[type="submit"] {
          grid-column: 1 / -1;
          padding: 1rem;
        }
      }

      /* Medium screens */
      @media (min-width: 601px) and (max-width: 1024px) {
        /* Add styles here */
      }

      /* Large screens */
      @media (min-width: 1025px) {
        /* Add styles here */
      }
    </style>
  </head>

  <body>
    <form>
      <label for="username">Username:</label>
      <input type="text" id="username" name="username" required />

      <label for="first-name">First name:</label>
      <input type="text" id="first-name" name="first-name" required />

      <label for="last-name">Last name:</label>
      <input type="text" id="last-name" name="last-name" required />

      <label for="email">Email:</label>
      <input type="email" id="email" name="email" required />

      <label for="password">Password:</label>
      <input type="password" id="password" name="password" required />

      <label for="date">Today's date:</label>
      <input type="date" id="date" name="date" />

      <label for="age">Age:</label>
      <input type="number" id="age" name="age" min="18" max="100" />

      <label for="file">Upload a file:</label>
      <input type="file" id="file" name="file" />

      <div>
        <!-- Empty div added for grid layout. -->
      </div>
      <div>
        <input type="checkbox" id="terms" name="terms" required />
        <label for="terms">I agree to the terms and conditions:</label>
      </div>

      <button type="submit">Submit</button>
    </form>
  </body>
</html>
```
- [css/media-queries.md](css/media-queries.md)
- [examples/form/form7.html](examples/form/form7.html)

## Select element

Lets add a dropdown to the form.

Select element is a dropdown list. It is used to select one or more options from a list of options. The select element is created using the `<select>` tag, and the options are created using the `<option>` tag. The select element can have the `multiple` attribute, which allows the user to select multiple options from the list. Altough we will not use the `multiple` attribute.

Here is an example of a select element with a few options to select favorite food:

```html
<label for="food">Favorite food:</label>
<select id="food" name="food">
  <option value="pizza">Pizza</option>
  <option value="pasta">Pasta</option>
  <option value="burger">Burger</option>
  <option value="salad">Salad</option>
  <option value="potato">Potato</option>
  <option value="rice">Rice</option>
  <option value="salad">Something else</option>
</select>
```

[MDN documentation for select element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/select)

We will add this select element to our form.

```html
<!DOCTYPE html>

<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
      html {
        font-size: 16px;
      }

      body {
        font-family: Helvetica, Arial, sans-serif;
        color: #333;
      }

      input {
        padding: 0.25rem;
      }

      button[type="submit"] {
        margin-top: 1rem;
      }

      /* Small screens */
      @media (max-width: 600px) {
        form {
          display: flex;
          flex-direction: column;
          margin-bottom: 2rem;
        }

        input,
        button {
          font-size: 1.5rem;
          padding: 0.5rem;
        }

        label {
          margin-top: 0.5rem;
        }

        button[type="submit"] {
          padding: 1rem;
        }
      }

      /* Medium & large screens */
      @media (min-width: 601px) {
        form {
          display: grid;
          grid-template-columns: 1fr 2fr;
          grid-gap: 10px;
        }

        /* grid-column helps the submit button span the entire width of the form. */
        button[type="submit"] {
          grid-column: 1 / -1;
          padding: 1rem;
        }
      }

      /* Medium screens */
      @media (min-width: 601px) and (max-width: 1024px) {
        /* Add styles here */
      }

      /* Large screens */
      @media (min-width: 1025px) {
        /* Add styles here */
      }
    </style>
  </head>

  <body>
    <form>
      <label for="username">Username:</label>
      <input type="text" id="username" name="username" required />

      <label for="first-name">First name:</label>
      <input type="text" id="first-name" name="first-name" required />

      <label for="last-name">Last name:</label>
      <input type="text" id="last-name" name="last-name" required />

      <label for="email">Email:</label>
      <input type="email" id="email" name="email" required />

      <label for="password">Password:</label>
      <input type="password" id="password" name="password" required />

      <label for="date">Today's date:</label>
      <input type="date" id="date" name="date" />

      <label for="age">Age:</label>
      <input type="number" id="age" name="age" min="18" max="100" />

      <label for="file">Upload a file:</label>
      <input type="file" id="file" name="file" />

      <label for="food">Favorite food:</label>
      <select id="food" name="food">
        <option value="pizza">Pizza</option>
        <option value="pasta">Pasta</option>
        <option value="burger">Burger</option>
        <option value="salad">Salad</option>
        <option value="potato">Potato</option>
        <option value="rice">Rice</option>
        <option value="salad">Something else</option>
      </select>

      <div>
        <!-- Empty div added for grid layout. -->
      </div>
      <div>
        <input type="checkbox" id="terms" name="terms" required />
        <label for="terms">I agree to the terms and conditions:</label>
      </div>

      <button type="submit">Submit</button>
    </form>
  </body>
</html>
```

Note, if we wanted to enable multiple selections from the dropdown list, we could add the `multiple` attribute to the select element:

```html
<label for="food">Favorite food:</label>
<select id="food" name="food" multiple>
  <option value="pizza">Pizza</option>
  <option value="pasta">Pasta</option>
  <option value="burger">Burger</option>
  <option value="salad">Salad</option>
  <option value="potato">Potato</option>
  <option value="rice">Rice</option>
  <option value="salad">Something else</option>
</select>
```

[examples/form/form8.html](examples/form/form8.html)

### Styling the select element for mobile

The select element looks fine on medium and larger screens, but on small screens it looks smaller than the other inputs. This is because the styling we've implemented for the input elements do not affect the select element. We will fix this by changing the selectors a bit, by using the grouping selector to select multiple elements to apply the same style in one go, similar to what we've already done with the input and button styling.

```css
/* Small screens */
@media (max-width: 600px) {
  input,
  button,
  select {
    font-size: 1.5rem;
    padding: 0.5rem;
  }
}
```

Now it should be easier for the user to select a value from the dropdown list on a mobile device.

[examples/form/form9.html](examples/form/form9.html)

## A note about the labels

The labels are currently placed above the inputs. This is a good practice, as it makes the form more accessible. The labels are also clickable, which makes it easier for the user to focus on the input. This is especially important on checkboxes and radio buttons, giving the user more space to click on the label to select the input.

The `for` attribute of the label should match the `id` attribute of the input, which makes the label clickable.

```html
<label for="user-email">Email:</label>
<input type="email" id="user-email" name="email" />
```

Now if user clicks on the text "Email:", browser will shift the focus to the input field which has the corresponding `id` attribute, in this case `user-email`.

### A life hack

The `for` attribute can be omitted, if the input is placed inside the label. For example the following code is valid:

```html
<label>
  Username:
  <input type="text" id="username" name="username" required />
</label>
```

More commonly used with radio buttons or checkboxes:

```html
<label>
  <input type="checkbox" id="terms" name="terms" required />
  I agree to the terms and conditions
</label>

<label><input type="radio" name="example" value="1" /> Example 1</label><br />
<label><input type="radio" name="example" value="2" /> Example 2</label><br />
<label><input type="radio" name="example" value="3" /> Example 3</label>
```

In this case the content of the label element is the input and the text, both of which are clickable.

## Box model

[examples/form/form10.html](examples/form/form10.html)

The box model is a fundamental concept in CSS. It describes the space that an element takes up on the page, and how that space is calculated. The box model consists of four parts: content, padding, border, and margin.

In our CSS so far, we've used box model properties such as `padding` and `margin` to style the form.

Next, we will add `border` and `box-sizing` properties to control how the width and height of the buttons are calculated.

```css
/* Small screens */
@media (max-width: 600px) {
  button {
    font-size: 1.5rem;
    padding: 0.5rem;
    border: 1px solid #ccc;
    box-sizing: border-box;
  }
}
```

In this code, we have used the `border` property to add a border to the inputs, buttons, and select element. We have also used the `box-sizing` property to control how the width and height of the element is calculated. The value `border-box` means that the width and height of the element includes the padding and border, but not the margin.

### Calculating the total size of an element

The total size of an element is calculated as follows:

- `width` + `padding` + `border` = actual width of the element
- `height` + `padding` + `border` = actual height of the

With our styling, our button will be approximately 1.5rem + 0.5rem + 1px + 1px = 3rem + 2px in width and 1.5rem + 0.5rem + 1px + 1px = 3rem + 2px in height.

If you're confused about the math here, let's break it down:

- `padding` is 0.5rem, which is 8px (because the font-size in html element is 16px).
- `border` is 1px.

The width takes into account left and right padding, and left and right border, and the height takes into account top and bottom padding, and top and bottom border. Therefore some of the padding and border is counted twice, which is why the total width and height is 3rem + 2px.

### Box-sizing property

The `box-sizing` property is used to control how the width and height of the element is calculated.

The `box-sizing` property can have the following values:

- `content-box` - The width and height of the element includes only the content, and does not include the padding, border, or margin. This is the default value.
- `border-box` - The width and height of the element includes the content, padding, and border, but not the margin.

[MDN documentation for box model](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Box_Model)

## Button vs input submit

In order to submit a form, the form must have a button which will trigger the submit event. This button can be either an input element with `type="submit"` or a button element. A button element is preferred, as it allows for more customization and styling.

For legacy purposes, an example:

```html
<form>
  <input type="submit" value="Submit" />
</form>
```

This will create a submit button, but it is not recommended to use this method. The button text can only be text, and it is not possible to add other elements inside the input element, such as images or other styled elements. Instead, use the button element:

```html
<form>
  <button type="submit">Submit</button>
</form>
```

Make sure that your submission button always contains the `type="submit"` attribute, otherwise it will not trigger the form submission.

## Reset button

A reset button is used to clear the form. It is created using the button element with `type="reset"`.

```html
<form>
  <button type="reset">Reset</button>
</form>
```

Let's add a reset button to our form.

Our HTML will look like this:

```html
<!DOCTYPE html>

<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
      html {
        font-size: 16px;
      }

      body {
        font-family: Helvetica, Arial, sans-serif;
        color: #333;
      }

      input {
        padding: 0.25rem;
      }

      button[type="submit"] {
        margin-top: 1rem;
      }

      /* Small screens */
      @media (max-width: 600px) {
        form {
          display: flex;
          flex-direction: column;
        }
        form {
          margin-bottom: 2rem;
        }

        input,
        button,
        select {
          font-size: 1.5rem;
          padding: 0.5rem;
        }

        label {
          margin-top: 0.5rem;
        }

        button[type="submit"] {
          padding: 1rem;
        }

        button {
          font-size: 1.5rem;
          padding: 0.5rem;
          border: 1px solid #ccc;
          box-sizing: border-box;
        }
      }

      /* Medium & large screens */
      @media (min-width: 601px) {
        form {
          display: grid;
          grid-template-columns: 1fr 2fr;
          grid-gap: 10px;
        }

        /* grid-column helps the submit button span the entire width of the form. */
        button[type="submit"] {
          grid-column: 1 / -1;
          padding: 1rem;
        }
      }

      /* Medium screens */
      @media (min-width: 601px) and (max-width: 1024px) {
        /* Add styles here */
      }

      /* Large screens */
      @media (min-width: 1025px) {
        /* Add styles here */
      }
    </style>
  </head>

  <body>
    <form>
      <label for="username">Username:</label>
      <input type="text" id="username" name="username" required />

      <label for="first-name">First name:</label>
      <input type="text" id="first-name" name="first-name" required />

      <label for="last-name">Last name:</label>
      <input type="text" id="last-name" name="last-name" required />

      <label for="email">Email:</label>
      <input type="email" id="email" name="email" required />

      <label for="password">Password:</label>
      <input type="password" id="password" name="password" required />

      <label for="date">Today's date:</label>
      <input type="date" id="date" name="date" />

      <label for="age">Age:</label>
      <input type="number" id="age" name="age" min="18" max="100" />

      <label for="file">Upload a file:</label>
      <input type="file" id="file" name="file" />

      <label for="food">Favorite food:</label>
      <select id="food" name="food">
        <option value="pizza">Pizza</option>
        <option value="pasta">Pasta</option>
        <option value="burger">Burger</option>
        <option value="salad">Salad</option>
        <option value="potato">Potato</option>
        <option value="rice">Rice</option>
        <option value="salad">Something else</option>
      </select>

      <div>
        <!-- Empty div added for grid layout. -->
      </div>
      <div>
        <input type="checkbox" id="terms" name="terms" required />
        <label for="terms">I agree to the terms and conditions:</label>
      </div>

      <button type="submit">Submit</button>
      <button type="reset">Reset</button>
    </form>
  </body>
</html>
```

[examples/form/form11.html](examples/form/form11.html)

### Styling the reset button

The reset button does not look good now, either in mobile or larger resolutions. As can be seen from the CSS, buttons are styled by using the `button[type="submit"]` selector or plain `button` selector. We need to include the reset button in the styling.

```css
button[type="submit"],
button[type="reset"] {
  margin-top: 1rem;
}

/* Small screens */
@media (max-width: 600px) {
  button[type="submit"],
  button[type="reset"] {
    padding: 1rem;
  }
}

/* Medium & large screens */
@media (min-width: 601px) {
  button[type="submit"],
  button[type="reset"] {
    grid-column: 1 / -1;
    padding: 1rem;
  }
}
```

We might also want to distinguish the reset button from the submit button by giving both buttons different background colors.

```css
button[type="submit"],
button[type="reset"] {
  margin-top: 1rem;
  background-color: #0d6efd;
  color: #fff;
}

button[type="reset"] {
  background-color: #6c757d;
}
```

Now the reset button should look better and be more recognizable from the submit button.

[examples/form/form12.html](examples/form/form12.html)

#### Improve buttons for medium and larger screens

Now looking at the form in larger resolutions, both buttons take the full width of the form. This is not ideal, as the reset button is not as important as the submit button. We can fix this by giving the reset button a smaller width.

```css
/* Medium & large screens */
@media (min-width: 601px) {
  button[type="reset"] {
    width: 50%;
  }
}
```

[examples/form/form13.html](examples/form/form13.html)

Still the UI looks a bit odd. Maybe now the reset button should be a bit smaller on aligned to the right.

```css
/* Medium & large screens */
@media (min-width: 601px) {
  button[type="reset"] {
    width: 30%;
    justify-self: end;
  }
}
```

[examples/form/form14.html](examples/form/form14.html)

Better. Now we need to change the submit button styling to make it work better with the reset button. We can remove the `grid-column` property from the submit button, and let's go ahead and remove the reset button styling from the small screens we did in previous two steps. Sometimes we need to try out things to find out what works best.

```css
/* Medium & large screens */
@media (min-width: 601px) {
  button[type="submit"],
  button[type="reset"] {
    padding: 1rem;
  }

  button[type="submit"] {
    order: 1;
  }
}
```

Now we've removed the `grid-column` property from the buttons, and added the `order` property to the submit button. The `order` property is used to control the order of the grid items. The default value is 0, and the value can be negative or positive. The items are ordered based on the value of the `order` property, with the lowest value first.

The reset button should now be on the left side of the form, and the submit button should be on the right side. This might or might not be a good idea. It depends on the context. In this case, it might be better to have the submit button on the left side, under the checkbox element.

Try toggling the `order` property to see how the buttons change position and sizes.

[examples/form/form15.html](examples/form/form15.html)

Now our HTML looks like this:

```html
<!DOCTYPE html>

<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
      html {
        font-size: 16px;
      }

      body {
        font-family: Helvetica, Arial, sans-serif;
        color: #333;
      }

      input {
        padding: 0.25rem;
      }

      button[type="submit"],
      button[type="reset"] {
        margin-top: 1rem;
        background-color: #0d6efd;
        color: #fff;
      }

      button[type="reset"] {
        background-color: #6c757d;
      }

      /* Small screens */
      @media (max-width: 600px) {
        form {
          display: flex;
          flex-direction: column;
          margin-bottom: 2rem;
        }

        input,
        button,
        select {
          font-size: 1.5rem;
          padding: 0.5rem;
        }

        label {
          margin-top: 0.5rem;
        }

        button[type="submit"],
        button[type="reset"] {
          padding: 1rem;
        }

        button {
          font-size: 1.5rem;
          padding: 0.5rem;
          border: 1px solid #ccc;
          box-sizing: border-box;
        }
      }

      /* Medium & large screens */
      @media (min-width: 601px) {
        form {
          display: grid;
          grid-template-columns: 1fr 2fr;
          grid-gap: 10px;
        }

        button[type="submit"],
        button[type="reset"] {
          padding: 1rem;
        }

        button[type="submit"] {
          order: 1;
        }
      }

      /* Medium screens */
      @media (min-width: 601px) and (max-width: 1024px) {
        /* Add styles here */
      }

      /* Large screens */
      @media (min-width: 1025px) {
        /* Add styles here */
      }
    </style>
  </head>

  <body>
    <form>
      <label for="username">Username:</label>
      <input type="text" id="username" name="username" required />

      <label for="first-name">First name:</label>
      <input type="text" id="first-name" name="first-name" required />

      <label for="last-name">Last name:</label>
      <input type="text" id="last-name" name="last-name" required />

      <label for="email">Email:</label>
      <input type="email" id="email" name="email" required />

      <label for="password">Password:</label>
      <input type="password" id="password" name="password" required />

      <label for="date">Today's date:</label>
      <input type="date" id="date" name="date" />

      <label for="age">Age:</label>
      <input type="number" id="age" name="age" min="18" max="100" />

      <label for="file">Upload a file:</label>
      <input type="file" id="file" name="file" />

      <label for="food">Favorite food:</label>
      <select id="food" name="food">
        <option value="pizza">Pizza</option>
        <option value="pasta">Pasta</option>
        <option value="burger">Burger</option>
        <option value="salad">Salad</option>
        <option value="potato">Potato</option>
        <option value="rice">Rice</option>
        <option value="salad">Something else</option>
      </select>

      <div>
        <!-- Empty div added for grid layout. -->
      </div>
      <div>
        <input type="checkbox" id="terms" name="terms" required />
        <label for="terms">I agree to the terms and conditions:</label>
      </div>

      <button type="submit">Submit</button>
      <button type="reset">Reset</button>
    </form>
  </body>
</html>
```

## Improve UI for desktop

The form looks good. But we might want to improve it for desktop resolution. Let's keep the mobile and tablet ui as is, but add the desktop breakpoints. For this, we need to make some small changes to the html structure.

The form structure would now look like this:

```html
<form>
  <div>
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required />

    <label for="first-name">First name:</label>
    <input type="text" id="first-name" name="first-name" required />

    <label for="last-name">Last name:</label>
    <input type="text" id="last-name" name="last-name" required />

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required />

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required />
  </div>
  <div>
    <label for="date">Today's date:</label>
    <input type="date" id="date" name="date" />

    <label for="age">Age:</label>
    <input type="number" id="age" name="age" min="18" max="100" />

    <label for="file">Upload a file:</label>
    <input type="file" id="file" name="file" />

    <label for="food">Favorite food:</label>
    <select id="food" name="food">
      <option value="pizza">Pizza</option>
      <option value="pasta">Pasta</option>
      <option value="burger">Burger</option>
      <option value="salad">Salad</option>
      <option value="potato">Potato</option>
      <option value="rice">Rice</option>
      <option value="salad">Something else</option>
    </select>

    <div class="checkbox-container">
      <input type="checkbox" id="terms" name="terms" required />
      <label for="terms">I agree to the terms and conditions</label>
    </div>
  </div>

  <button type="submit">Submit</button>
  <button type="reset">Reset</button>
</form>
```

The form element now contains two div elements, then a container for the checkbox and then the buttons, as they've been so far. The `form > div` structure help us build the grid in a way where it has two columns, each column having rows of inputs.

We also need to make some CSS changes.

To the small screens, we add the following:

```css
.checkbox-container {
  display: inline;
  margin-top: 1rem;
}
```

And we will also add:

```css
/* Medium screens */
@media (min-width: 601px) and (max-width: 1024px) {
  form div {
    display: grid;
    grid-template-columns: 1fr 2fr;
    grid-gap: 10px;
    margin-bottom: 1rem;
  }

  .checkbox-container {
    grid-column: 2 / -1;
    display: inline;
  }
}

/* Large screens */
@media (min-width: 1024px) {
  form {
    display: grid;
    grid-template-columns: 1fr 1fr;
    grid-gap: 10px;
  }

  form>div {
    display: flex;
    flex-direction: column;
  }

  form>div input,
  form>div select {
    margin-bottom: 1rem;
  }

  .checkbox-container {
    margin-top: 1rem;
  }
}
```

The `display: grid;` property has now been moved to the large screens.

The original medium and large screen media query can be simplified:

```css
/* Medium & large screens */
@media (min-width: 601px) {
  button[type="submit"],
  button[type="reset"] {
    padding: 1rem;
  }

  button[type="submit"] {
    order: 1;
  }
}
```

Changing the structure requires a bit of structural HTML changes, which then require some changes to the CSS. But overall, the changes are minimal.


Full set of changes and the example can be found in:
- [examples/form/form16.html](examples/form/form16.html)


## Submit the form

The form is now complete. The user can fill in the form and submit it. The form will be sent to the server, and the server can process the form data.

The form does not contain the `action` or `method` attributes, let's add them so that the form can actually be submitted. (note: these attributes really should be added to the form in the very beginning, not at this point. Keep this in mind in the future.)

```html
<form action="https://media2.edu.metropolia.fi/test/form-submission/" method="post">
  <!-- ... -->
</form>
```

### Note:
- [https://media2.edu.metropolia.fi/test/form-submission/](https://10.120.32.94/test/form-submission/) this example url needs the trailing slash in order to work.
- Make sure to navigate to the test url before submission, as the https has a self-signed certificate.
- Most important! For this url to work, you must be in Metropolia wifi or use the VPN.

Now open the form in browser and click submit. Some of the fields are required, which means that you actually need to fill in the form to be able to submit it.

After the submit button is clicked, the form data is sent to the server. The browser will navigate to the form submission URL by using the HTTP method specified in the form. The server will then process the form data and send a response back to the browser.

- [examples/form/form17.html](examples/form/form17.html)

