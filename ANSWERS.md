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

**1. Question 1**

Answer 1

**2. Question 2**

Answer 2

**3. Question 3**

Answer 3

**4. Question 4**

Answer 4

**5. Question 5**

Answer 5

**6. Question 6**

Answer 6

**7. Question 7**

Answer 7
