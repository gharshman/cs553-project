# Lessons Learned

### The most important technical concepts you learned.

These days, it is not considered popular or wise to study basic web development, for example, technologies such as HTML, CSS, and the Document Object Model (DOM).  Howver, Javascript and Express.js are designed to integrate well with HTTP and HTML environments.  You must start with these basics, even if it is cursory, before moving on to Javascript and Express.  You should also have a strong understanding of object-oriented programming and error-handling.  Writing authenticated APIs in Express.js requires a deep understanding of token security and middleware design, which rely heavily on OOP concepts and asynchronous, anonymous functions.  This is new material for many people.

### Why database design, authentication, and authorization must be considered together.

Database design, authentication, and authorization must be considered together because they all rely on the same encryption, or hashing, algorithm and tie the user's security token to their business role, which comes from the user table in the database.  Database schemas must align with the desired access controls and must support role-based authorization and resource ownership.  Users are tied to other records with foreign keys, linking other records to the authorization layer.  Good database planning prevents users from manipulating query filters to view records that they should not have access to.  Tokens carry permission data and help to speed performance while maintaining ability to revoke access quickly.

### At least one design decision you made and the tradeoffs involved.

Rather than using JSON Web Tokens (JWTs), you could initiate a database login session every time you wanted to invoke an API transaction.  Howver, this would cause additional load on the database and increase latency as traffic scales, since database logins are slower and not asynchronous.  Self-contained JWTs allow scalability and faster access control.  JWTs encoding user data into mathematically signed strings, so database authentication only happens once per validity period (for example, an hour).  This approach dramatically increases API performance and scalability, but it does slow the revocation process.  Stolen tokens remain valid until their preconfigured expiration time.

### At least one problem, mistake, or unexpected difficulty you encountered.

You can improve the speed and performance of your Express.js server by creating module files with asynchronous function calls.  This prevents any one stuck transaction from stopping or slowing the server response time.  However, it is not always easy to configure modules to interact correctly, especially when you are also passing authentication tokens and making the server available to multiple client applications, for example, access via the terminal and via a web page.  In the first part of my project, I did not have any problems separating out routes into modules, but I had great difficulty doing the same thing in the second phase of my project.  I ended up putting all routes back in the main server.js program, which is not ideal from a scalability perspective, but it was the only way that I could make it work.  However, I am still very new to Javascript and Express.js.

### What you would do differently if you began the project again.

I would start by learning the basics of HTML, CSS, and the DOM.  Then I would progress to understanding how Javascript as a programming language differs from other programming languages, for example, how anonymous functions, asynchronous functions, and modules work.  Then I would spend some time understanding the improvements offered by Typescript, and how to write modular programs using Typescript, package.json, and ts config files.  Lastly, I would enter into the world of Express.js, making sure to understand how Typescript, CommonJS, and ECMAScript Modules differ.

### The advice you would give someone preparing to build a similar system.

Do not skip over the fundamentals.  Do not assume that inexperienced programmers, students, or co-workers know how to do things that you consider basic.  Remember that you have much more education and experience than other people have.  Try to remember what it was like when you knew nothing about web technologies or databases.  Don't be overly harsh in your judgment, and give as much of yourself as you are able while they are learning.

### At least one security risk that a development team should not overlook.

Securing user identities and data requires careful application of encryption and authorization principles.  Authentication is best handled by using JSON Web Tokens (JWT), and passwords must never be stored or transmitted in plaintext, but rather salted and hashed using robust up-to-date algorithms like bcrypt.  Once authenticated, use role-based access control middleware checks to control access to sensitive routes.  And whenever you are working with databases, always use data validation and parameterized queries to eliminate the risk of SQL injection attacks.  Lastly, use certificates and secure HTTPS to ensure that all data in transit is encrypted between the Express API server and the client.
