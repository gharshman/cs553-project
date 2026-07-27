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

In this second milestone, a basic web page interface was created to test
logins and tokens and display tasks.  Additionally, tasks can be deleted,
but only by the `admin` role. This web page must be tested manually.

All of the previous routes from milestone one are still in place, but now,
most of them require authentication, and a few of them requires the `admin`
role in order to work. A new bash script has been provided which stores
login tokens in environment variables and then uses those tokens to run 
`curl` commands.

Three HTTP ports are used: http-server 5173, api server 3000, and Docker
PostgreSQL database 5433.

----------

### How to Run the `CURL` test script

**1. Fork the repository & clone it to your computer**

**2. Open a terminal and run the following:**
```shell
$ export JWT_SECRET='Rich Purnell is a steely-eyed missile man.'
$ sudo apt update
$ sudo apt install jq
$ cd `cs553-project`
$ npm install
$ sudo docker compose up
```
The database should build itself automatically except that the `user` passwords
are set to `pending` in the `users` table.

Hit 'd' to detach the docker container and return to the terminal.

**3. Continue in the same terminal:**
```shell
$ node server.js &
```
Hit 'Enter' to return to the terminal prompt.

```shell
$ ./test-api.sh
```

**4. Verify that all of the routes work properly.**

----------

### How to Run the Web Interface Program

**1. Fork the repository & clone it to your computer**

**2. Open a terminal and run the following:**
```shell
$ export JWT_SECRET='Rich Purnell is a steely-eyed missile man.'
$ sudo apt update
$ sudo apt install jq
$ sudo npm install --global http-server
$ cd `cs553-project`
$ npm install
$ sudo docker compose up
```
The database should build itself automatically except that the `user` passwords
are set to `pending` in the `users` table.

Hit 'd' to detach the docker container and return to the terminal.

**3. Continue in the same terminal:**
```shell
$ node server.js &
```
Hit 'Enter' to return to the terminal prompt.

```shell
$ cd client
$ http-server -p 5173 &
```
Hit 'Enter' to return to the terminal prompt.

**4. Open a browser (e.g. Chrome) and navigate to `http://localhost:5173`.**

**5. Login with `user/user-password` or `admin/admin-password`.**

**6. Test the web interface.**

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
