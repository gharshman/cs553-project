# Semester Project Reflection Questions & Answers

----------

### Milestone 1

**1. What is the difference between an in-memory API and a database-backed API?**

The difference in persistence of data after you stop the server.  A database that routinely loses
all of its data is not very useful in production environments.

**2. Why is it useful to separate routes, services, and database logic?**

It allows for cleaner code, modularity, and separation of concerns.  It allows parallel development
and makes the app more scalable.

**3. What HTTP status codes did you use, and why?**

I used the following status codes:
- `200` for `Okay` or `Success`
- `201` for `Successful record creation`
- `400` for `Bad Request` (Client error)
- `404` for `Record Not Found` (Client error)
- `500` for `Unknown Error` (or possibly Server Error)

These codes are accepted as standard for these responses.

**4. What happens when a client requests a task ID that does not exist?**

Requesting a single task is handled by the `router.get('/tasks/:id')` endpoint.  Inside this method
is a **try-catch** block.  If the PostgreSQL server does not find the task ID, it returns an empty
(not NULL) set.  The API endpoint method tests for zero length of the result set, and if it is zero,
the API response is `Status Code 404, Record Not Found`.

**5. What was the hardest part of connecting the API to PostgreSQL?**

I did not find that part to be difficult, but I did have trouble (initially) setting up the
docker-compose.yml file to automatically load the schema and my initial seed data.  But my
`Google Fu` saved the day.


----------

### Milestone 2

**1. What is the difference between authentication and authorization?**

Authentication (aka "AuthN") is a means to establish the identity of a user or device.
Authorization (aka "AuthZ") is a means of attaching permitted operations to a user or device,
after the user or device has been properly authenticated.

**2. Why should passwords be hashed instead of stored directly?**

Hashing is intended to protect passwords and pass phrases from plain text exploits.
Hashing must be sufficiently strong to prevent brute force decryption.  Modern algorithms
combined with random salting of the data, are nearly unbreakable with today's computing power.

**3. What information did you include in your JWT, and why?**

To sign a Javascript Web Token, the sign() function requires:
- user.id
- user.username
- user.role
- env.secret
- expiresIn

Then, in the response where the token is actually passed back to the calling function,
the JSON includes the following:

- accessToken: token
- tokenType: "Bearer"
- expiresIn: env.expires
- user:
    -- id: user.id
    -- username: user.username
    -- role: user.role

The response does not include the secret pass phrase, so if anybody intercepts the JSON and
tampers with it, the token will no longer be an accurate hashing of the JSON data.  At that
point, the token will be useless as an authentication device.

**4. What is the difference between a 401 response and a 403 response?**

HTTP Status Code 401 is defined as **"Unauthorized"**, but it is really a failure to
***authenticate***.  The server does not know who is the user or device that is calling.
This could be because the authentication token is invalid, expired, or non-existent.

HTTP Status Code 403 is defined as **"Forbidden"**. The server knows who is the user or
device that is calling, but that user or device does not have sufficient privilege or role
to perform the requested operation.

**5. Where does your application perform role or ownership checks?**

Authentication and Role-Based Authorization occur as middleware when a route is called.
The token is sent in the header of the request, and the middleware parses it and verifies
identity and permissions.

**6. How are users, projects, and tasks related in your database?**

The table `users` contains passwords and role information for each user. This information
is used when generating tokens at time of login. The `users` table is indexed by an `id`
field which is unique for each user. This `id` field is used in the tables `projects` and
`tasks` to identify project owners and task assignees.  The field `user.id` is thus a
foreign key stored in the `projects.owner_id` field and in the `tasks.assgnd_id` field.

The table `projects` contains owner and project information for each project. The `projects`
table is indexed by an `id` field which is unique for each project. This `id` field is used
in the table `tasks` to tie tasks to specific projects.  The field `project.id` is thus a
foreign key stored in the `tasks.pid` field.

In this way, users can own many projects and be assigned many tasks. Projects have only one
owner but can have many tasks.  Tasks can have only one project and one assignee.

- `users` 1-----&infin; `projects` 1-----&infin; `tasks`
- `users` 1-----&infin; `tasks`
- `projects` 1-----&infin; `tasks`

**7. What was the hardest part of adding authentication or authorization?**

I could not get it to work properly with the routes all broken out into different files.
I know that you did not want all of the routes in one file, but that was the only way that
I could get it to work.  I wish that we had spent some class time on that.

