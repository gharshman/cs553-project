# Task Manager Web App & API Server
### with Node.js/Express.js Server & Docker PostgreSQL Database

### Semester Project for Client/Server Architecture (CS 553)

### Project Overview

The semester project is a **Task Management System**.

The following requirements were implemented:

- REST endpoints
- database integration
- CRUD operations
- request validation
- Basic web page front-end interface
- Authentication & authorization
- Protected routes (role-based)
- Relational tables with foreign keys


----------

### Capabilities

The first milestone used unprotected routes, so a bash script with `curl`
commands was provided.

In this second milestone, a basic web page interface was created to manage
login and tokens.  Therefore, there is no test file.  Testing occurs manually
via the web page interface.  All of the previous routes are still in place,
but the web page only demonstrates listing tasks (user or admin) and deleting
tasks (admin only).

----------

### How to Run the Program

**1. Fork the repository & clone it to your computer**

**2. Open a terminal and run the following:**
```shell
$ cd `cs553-project`
$ sudo docker compose up
```
The database should builds itself automatically except for populating `user`
and `admin` in the `users` table.  Hit 'd' to detach the docker container and
return to the terminal.

**3. Continue in the same terminal:**
```shell
$ npm install
$ sudo npm install --global http-server
$ node server.js &
```
Hit 'Enter' to return to the terminal prompt.

**4. Continue in the same terminal:**
```shell
$ cd client
$ http-server -p 5173 &
```
Hit 'Enter' to return to the terminal prompt.

**5. Open a browser (e.g. Chrome) and navigate to `http://localhost:5173`.**

**6. Login with `user/user-password` or `admin/admin-password`.**

**7. Enjoy the Blinkenlights.**

----------

# Resetting the Database

**1. In your terminal, enter the following:**
```shell
$ sudo docker stop cs453-postgres
$ sudo docker compose down -v
$ sudo docker compose up
```

----------

# Shutting Down the App

**1. In your terminal, enter the following:**
```shell
$ cd ..
$ jobs
```
Note the job numbers for `node server.js` and `http-server`.  They should be 1 and 2 if you started with a fresh terminal.

**2. To stop the jobs, enter the following:**
```shell
$ fg %1
<Ctrl-C>
$ fg %2
<Ctrl-C>
```

**3. To stop the jobs, enter the following:**
```shell
$ sudo docker stop cs453-postgres
```

**4. To delete the Docker database, enter the following:**
```shell
$ sudo docker compose down -v
```
