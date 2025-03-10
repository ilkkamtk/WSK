# Server Side Programming

## Server-side technologies

Programming language + application framework + database + runtime environment (server) = server-side (back-end) application

- Programming language is a tool for writing code, specifying algorithms, and instructing a computer.
- Framework is a higher-level structural foundation that provides guidelines, pre-written code, and tools for building applications in a specific domain. Developers often use programming languages within the context of a framework to streamline the development process and adhere to best practices for a particular type of application, such as web development or mobile app development.
- Running environment, often referred to as the "runtime environment" or simply the "runtime," is the software and hardware infrastructure where the server-side code of an application executes. This environment provides the necessary resources and services for the server-side code to run, handle requests, process data, and generate responses.
- All permanent data used by the application itself or saved by the users of the application is stored in the database
- Relational databases like MySQL, PostgreSQL, and NoSQL databases like MongoDB, Cassandra, and Redis are commonly used for storing and retrieving data in web applications.

### Python

- Python is a high-level, interpreted, and versatile programming language known for its simplicity, readability, and extensive standard library.
- Flask is a lightweight web framework for Python. It is designed to be simple and easy to use, making it an excellent choice for building web applications, particularly when you want to get a project up and running quickly. Flask provides the basic tools and libraries needed for web development without imposing too much structure or unnecessary complexity.
- Django is a high-level web framework built on Python. Django follows the MVC architectural pattern and provides a wide range of built-in features for rapid web application development.

### PHP

- PHP is a server-side scripting language designed specifically for web development. It powers a significant portion of the web.
- Frameworks like Laravel and Symfony provide modern tools and patterns for PHP web application development.
- Popular blog/website application Wordpress is written in PHP
- Most web hotels and e.g. <users.metropolia.fi> home page server support PHP runtime by default

### Java

- Java is a widely used programming language for building robust and scalable web applications.
- Spring Boot is a framework that simplifies Java web development by providing a set of conventions and tools for creating production-ready applications.

### ASP.NET

- ASP.NET is an open-source, server-side web-application framework developed by Microsoft
- Supports .NET languages like C#

### Ruby on Rails

Ruby on Rails, often referred to as Rails, is a web application framework written in Ruby. It emphasizes convention over configuration and follows the Model-View-Controller (MVC) architectural pattern, making it a productive choice for building web applications.

### JavaScript and Node.js

- JavaScript is a high-level, often just-in-time compiled language that follows the [ECMAScript standard](https://www.ecma-international.org/publications-and-standards/standards/ecma-262/).
- The ECMAScript standard does not include any input/output (I/O), such as networking, storage, text, or graphics. In practice, the web browser or other runtime system provides APIs for I/O.
- Node.js is a popular runtime environment that allows developers to write server-side code in JavaScript. It is known for its non-blocking, event-driven architecture, making it well-suited for building scalable and high-performance web applications.
- Express.js is a minimal and flexible Node.js web application framework that provides a robust set of features for building web and mobile applications. It is often used for creating RESTful APIs.
- Recap: [Node.js](../Week1/node.md)

---

### REST

**Re**presentational **S**tate **T**ransfer, is an architectural style for designing distributed systems. REST is often used in the context of web services, especially when building APIs. RESTful architecture is based on [HTTP protocol](https://github.com/ilkkamtk/web-ohjelmoinnin-perusteet/blob/main/http-request-response.md). In this course we build a REST interface for client-server communication.

**Key concepts of REST:**

- **Statelessness**: Each request from a client to a server must contain all the information needed to understand and process the request. The server should not retain any client state between requests. This makes it easier to scale, as there's no session information to manage between requests.
- **Client-Server**: The client and server are separate entities that communicate over a network. The client is responsible for the user interface and user experience, while the server is responsible for processing requests, managing data, and executing most of the business logic.
- **Cacheability**: Responses from the server can be labeled as cacheable or non-cacheable. When a response is cacheable, clients can reuse it for equivalent requests in the future, leading to better performance and reduced server load.
- **Uniform Interface**: This is one of the central tenets of REST. It simplifies and decouples the architecture, allowing each part to evolve independently. Key constraints that define this uniform interface include:
- **Resource Identification**: Each resource (like a user, product, etc.) is identified by a unique URI (Uniform Resource Identifier). e.g. `https://example.com/resource/id`
- **Resource Manipulation through Representations**: Clients interact with resources by getting and modifying their representations (usually in formats like **JSON** or XML).
- **Self-descriptive Messages**: Each message contains enough information about how to process the message (e.g., using HTTP methods and status codes).
- **Standard Methods**: In the context of web services and APIs, REST usually relies on standard HTTP methods:
    - GET: Retrieve a resource or list of resources.
    - POST: Create a new resource.
    - PUT: Update a resource.
    - DELETE: Remove a resource.
    - PATCH: Apply partial modifications to a resource.
- **Status Codes:** Each response is served with an appropriate [HTTP status code](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status).
- **Stateless Communication**: Responses from the server should clearly indicate their cacheability to help clients understand when a resource's representation is fresh and when it needs to be re-requested.

REST APIs are popular due to their simplicity, scalability, and performance. When an API adheres to these principles, it's often referred to as a "RESTful" API.

#### Alternatives to REST
- [GraphQL](https://graphql.org/)
- [gRPC](https://grpc.io/)
- [tRPC](https://trpc.io/)
- [SOAP](https://en.wikipedia.org/wiki/SOAP)

### Simple example of REST API documentation

| Endpoint      | Method | Description                                        | Request Body (Example)            | Response Body (Example)        | Status Codes                         |
|---------------|--------|----------------------------------------------------|----------------------------------|--------------------------------|-------------------------------------|
| `/items`      | GET    | Retrieve a list of all items                       | N/A                              | `[{ "id": 1, "name": "Item1" }, { "id": 2, "name": "Item2" }]` | `200 OK`, `404 Not Found`           |
| `/items`      | POST   | Create a new item                                  | `{ "name": "New Item" }`         | `{ "id": 3, "name": "New Item" }` | `201 Created`, `400 Bad Request`    |
| `/items/:id`  | GET    | Retrieve details of a specific item by its ID      | N/A                              | `{ "id": 1, "name": "Item1" }`  | `200 OK`, `404 Not Found`           |
| `/items/:id`  | PUT    | Update details of a specific item by its ID        | `{ "name": "Updated Item" }`     | `{ "id": 1, "name": "Updated Item" }` | `200 OK`, `400 Bad Request`, `404 Not Found` |
| `/items/:id`  | DELETE | Delete a specific item by its ID                   | N/A                              | N/A                            | `204 No Content`, `404 Not Found`    |

- Endpoint: The URL where the API can be accessed.
- Method: The HTTP verb/method used to interact with the endpoint.
- Description: A brief description of what the endpoint does.
- Request Body: The data sent to the server when making a request (if applicable).
- Response Body: The data returned by the server in response to the request.
- Status Codes: Common HTTP status codes returned by the server. Each status code indicates a different outcome or state of the request.

This is a basic table for documentation. Depending on the complexity of the API, real-world documentation might also include:

- Headers required (e.g., authentication tokens).
- Query parameters for filtering, sorting, or pagination.
- Detailed explanations of each field in the request and response.
- Error message details for different status codes.
- Authentication/Authorization details.

---

## Rendering strategies

### Client-Side Rendering (CSR)

In CSR, the server sends a minimal HTML page with a JavaScript file to the browser. When the browser executes the JavaScript, it typically makes additional requests to the server to fetch the content, then renders the user interface (UI) in the browser itself.

Workflow:

1. User requests a page.
1. Server sends a minimal HTML page with JavaScript.
1. Browser executes JavaScript, which may make additional API requests.
1. JavaScript manipulates the DOM to render the page content dynamically.

Advantages:

- Interactive User Interfaces: CSR is excellent for creating rich, interactive web apps.
- Reduced Server Load: Since rendering happens on the client side, the server does fewer rendering tasks, reducing server load.
- Single Page Applications (SPAs): CSR is the foundation of SPAs, where the page doesn't reload completely on navigation.

Disadvantages:

- Initial Load Time: CSR often results in longer initial load times since the browser has to download, parse, and execute JavaScript before displaying content.
- SEO Challenges: Search engines can struggle with content rendered purely on the client side, though advancements in search engine technology have mitigated this.
- Dependent on Client Resources: Rendering is dependent on the user's device capabilities, which can be a limitation for devices with lower processing power.

### Server-Side Rendering (SSR)

In SSR, each page is rendered on the server and sent to the browser as a fully formed HTML document. The browser then displays the HTML content directly without waiting for all JavaScript to be downloaded and executed.

Workflow:

1. User requests a page.
1. Server generates the complete HTML for the requested page.
1. Server sends the fully rendered HTML to the browser.
1. Browser displays the HTML content and then downloads JavaScript for interactivity.

Advantages:

- Faster Initial Page Load: Since the HTML is pre-rendered, the initial page load can be faster, improving perceived performance.
- SEO Friendly: Search engines can easily crawl and index server-rendered content, which can be beneficial for SEO.
- Consistent Performance: Since rendering is done on the server, performance is less dependent on the client's device capabilities.

Disadvantages:

- Server Load: SSR can increase the load on the server, especially with high traffic.
- Less Interactive: Pages are less interactive compared to CSR until all the JavaScript is loaded and executed.
- Full Page Reloads: Navigating to a new page often requires a full page reload, which can be slower than CSR's dynamic content loading.

In modern web development, a hybrid approach called Universal Rendering or Isomorphic Rendering is often used, where the first page load is server-rendered for speed and SEO, and subsequent interactions use client-side rendering for a smooth user experience. Frameworks like Next.js for React (front-end library) and Nuxt.js for Vue.js (front-end framework) are popular for implementing this hybrid approach.
