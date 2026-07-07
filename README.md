### Semester Project for
### Client/Server Architecture (CS 553)
----------
# API Server (Node/Express)
# w/ Docker Database (PostgreSQL)

## Project Overview

The semester project is a **Task Management System**.

### Milestone 1 – REST API

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
