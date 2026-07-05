# Semester Project for Client/Server Architecture (CS 553)

## API Server (Node/Express) w/ Docker Database (PostgreSQL)

### Project Overview

The semester project is a **Task / Project Management System**.

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


### Repository Structure

```shell
cs553-project
├── apps
│ ├── api
│ └── client
├── database
├── docs
├── scripts
├── docker-compose.yml
└── README.md
```

----------

The application allows users to:

- create projects
- create tasks within projects
- assign tasks to users
- track task status
- comment on tasks
- view project activity

----------

```shell
cd apps/api
npm install
npm run dev
```

The API server should start locally.



----------
----------
----------

### Project Milestones

The project will evolve over several milestones during the semester.

- REST API design
- database integration
- authentication and authorization
- multi-service architectures
- real-time communication
- modern API technologies

### Milestone 2 – Authentication

Students will add:

- user accounts
- password hashing
- login endpoints
- JWT authentication
- protected routes

### Milestone 3 – Architectural Extensions

Students will extend the system with at least one of the following:

- WebSockets for real-time updates
- GraphQL API
- multi-service architecture
- asynchronous messaging
- advanced API documentation

Graduate students will complete an additional architecture extension and
design analysis.

# Learning Goals

By completing this project students should understand:

- how client/server systems communicate
- how APIs are designed and implemented
- how databases integrate with web services
- how authentication works in distributed systems
- how modern web architectures evolve over time
