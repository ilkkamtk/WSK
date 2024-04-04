# Middleware

Middleware functions are functions that have access to the request object (`req`), the response object (`res`), and the next middleware function in the application's request-response cycle. The next middleware function is commonly denoted by a variable named `next`.

Study: [using middleware](https://expressjs.com/en/guide/using-middleware.html) and [writing middleware](https://expressjs.com/en/guide/writing-middleware.html) in Express.

---
## Third party middleware
### Assignment: Handling file uploads

Files are sent in HTTP as [multipart/form-data](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST). Because Express does not handle this type by default you need to use third party middleware like [Multer](https://github.com/expressjs/multer):

1. Create a new branch `Assignment3` from `main`.
2. Add `uploads` folder to the project and put the folder in version control; but not its content, e.g.

    ```bash
    mkdir uploads
    touch uploads/.gitkeep
    ```

   and edit `.gitignore`:

    ```ignore
    # ignore content of uploads folder
    uploads/*
    # except one (empty) file to have the folder in version control
    !uploads/.gitkeep
    ```

3. Install [Multer](https://github.com/expressjs/multer#readme)
4. Use the basic usage example in Multer's documentation as an example and add file upload functionality to `./routes/cat-router.js`.
    - Modify function `postCat` in `./controllers/cat-controller.js`. Log the form data sent by the client (`req.body`) and the file data (`req.file`) to the console.
    - Modify `/` route for post method in `cat-router.js`. The route should execute the multer middleware and `postCat()` controller function.
    - Modify `postCat()` controller function and `addCat` model function to save the file data to the mock array.
    - Check `uploads` folder after uploading to see new files.
        - Filenames are automatically hashed.
        - If you want to have more control over filenames use [Diskstorage](https://github.com/expressjs/multer#diskstorage)
5. Test the file upload with [Postman](https://www.postman.com/downloads/) or [VSCode REST Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client) extension.
   - Testing upload with VSCode REST Client example:

    ```http
    POST http://localhost:3000/api/cat
    Content-Type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW
    
    ------WebKitFormBoundary7MA4YWxkTrZu0gW
    Content-Disposition: form-data; name="title"
    
    New cat title
    ------WebKitFormBoundary7MA4YWxkTrZu0gW
    Content-Disposition: form-data; name="user_id"
    
    1
    ------WebKitFormBoundary7MA4YWxkTrZu0gW
    Content-Disposition: form-data; name="file"; filename="image.jpg"
    Content-Type: image/jpeg
    
    < ./image.jpg
    ------WebKitFormBoundary7MA4YWxkTrZu0gW--
    ```
6. Commit your changes to version control.
7. Push your code to your remote repository.
8. Merge the `Assignment3` branch to `main` branch and push again.

---
## Custom middleware
### Assignment: creating thumbnail images

1. Create a new branch `Assignment4` from `main`.
2. Create a new file `./src/middlewares.js` and add a new middleware function `createThumbnail` that creates a thumbnail image from the uploaded image.
    - Use [sharp](https://sharp.pixelplumbing.com/) to create the thumbnail.
    - The middleware should be used after the file upload middleware.
    - The middleware should save the thumbnail image to the `uploads` folder with the same filename but with the suffix `_thumb`.
    - Use the promise version of sharp.
    - Example:

    ```javascript
    import sharp from 'sharp';
   
    const createThumbnail = async (req, res, next) => {
      if (!req.file) {
        next();
        return;
      }
      console.log(req.file.path);
      // TODO: use file path to create 160x160 png thumbnail with sharp
      next()
    };
    
    export { createThumbnail };
    ```
   
3. Add the middleware to the `/` route for post method in `cat-router.js`.
4. Test the file upload with Postman or VSCode REST Client.
5. Commit your changes to version control.
6. Push your code to your remote repository.
7. Merge the `Assignment4` branch to `main` branch and push again.