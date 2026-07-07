# API Data Server
### with Node.js/Express.js Server & Docker PostgreSQL Database

### Semester Project for Client/Server Architecture (CS 553)

### Project Overview

The semester project is a **Task Management System**.

Students will implement:

- REST endpoints
- database integration
- CRUD operations
- request validation

Steps Completed So Far:

1. Forked and cloned repository.
2. Started Docker PostgreSQL container.
3. Ran schema.sql and tasks.sql (20 software development tasks).
4. Completed API Endpoints.
5. Implemented CRUD operations on PostgreSQL database.
6. Developed bash script to test all operations with `curl`.


### Repository Structure

```shell
cs553-project
├── .git
├── apps
│ ├── api
│ | └── src
│ |   ├── config
│ |   ├── db
│ |   └── routes
│ └── client
├── database
├── docs
├── scripts
├── docker-compose.yml
└── README.md
```

----------

### Capabilities

At this point, the application allows users to:

| Operation                      | Method              |
|--------------------------------|:-------------------:|
| Verify server is running       | GET /health         |
| Verify database connection     | GET /db-health      |
| see a list of commands         | GET /               |
| list all tasks                 | GET /tasks          |
| list a single task             | GET /tasks/:id      |
| create a task                  | POST /tasks         |
| update a task                  | PATCH /tasks/:id    |
| delete a task                  | DELETE /tasks/:id   |


----------

### How to Run the Program

1. Fork the repository & clone it to your computer

2. In Terminal #1, run the following:
```shell
$ cd `cs553-project`
$ sudo docker compose up -d        # spin up database
$ sudo docker exec -it cs453-postgres psql -U postgres -d cs453 -c "SELECT * FROM tasks;"
```
If you see a table of 22 lines of data displayed, then you know that:
- the Docker container loaded PostgreSQL correctly,
- loaded the `cs453` database configuration,
- loaded the `tasks` table schema, and
- populated the seed data.

3. Continue in Terminal #1:
```shell
$ cd apps/api
$ npm install
$ npm run dev
```

4. Open a new terminal: Terminal #2, and run the following:
```shell
$ cd cs553-project
$ ./test-script.bash
```

5. Enjoy the Blinkenlights and keep hitting the spacebar.

----------

### Reflection Questions

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
