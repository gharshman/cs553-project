# Results of `test-api.sh` when run on my computer

```shell
nicegoat@goatdev:~/cs553-project$ 
nicegoat@goatdev:~/cs553-project$ 
nicegoat@goatdev:~/cs553-project$ 
nicegoat@goatdev:~/cs553-project$ sudo docker compose up -d
[+] up 3/3
 ✔ Network cs553-project_default      Created                                                                                                          0.1s
 ✔ Volume cs553-project_postgres-data Created                                                                                                          0.0s
 ✔ Container cs453-postgres           Started                                                                                                          0.4s
nicegoat@goatdev:~/cs553-project$ 
nicegoat@goatdev:~/cs553-project$ node server.js &
[1] 85347
nicegoat@goatdev:~/cs553-project$ 
JWT_SECRET is not set... using the development-only secret.


Server running at http://localhost:3000

nicegoat@goatdev:~/cs553-project$ 
nicegoat@goatdev:~/cs553-project$ 
nicegoat@goatdev:~/cs553-project$ 
nicegoat@goatdev:~/cs553-project$ ./test-api.sh


=================================================




Test unprotected routes --- No token required

{
  "message": "Server okay... try /health, /db-health, /tasks, /task/:id"
}

{
  "message": "Node API server online."
}

{
  "message": "Database online and connected.",
  "currentDate": "2026-07-27"
}



=================================================




Get token for 'USER'



Print 'USER' token to screen

eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxIiwidXNlcm5hbWUiOiJ1c2VyIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3ODUxNzU2MDQsImV4cCI6MTc4NTE3OTIwNH0.SkHyLQsfw7iANvdjPITprTTCh4LjvchzFgC_xgMUhpE


Test 'GET /tasks' route for 'USER'

{
  "data": [
    {
      "id": 1,
      "project": "Bug Zapper",
      "title": "Recruit a better Javascript programmer.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 2,
      "project": "Mousetrap",
      "title": "Assemble a team of your finest programmers.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 3,
      "project": "Mousetrap",
      "title": "Gather requirements from stakeholders.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 4,
      "project": "Mousetrap",
      "title": "Create user stories for development.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 5,
      "project": "Mousetrap",
      "title": "Design system architecture for scalability.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 6,
      "project": "Bug Zapper",
      "title": "Model database schemas and relationships.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 7,
      "project": "Mousetrap",
      "title": "Build UI components for frontend.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 8,
      "project": "Bug Zapper",
      "title": "Develop REST/GraphQL APIs for backend.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 9,
      "project": "Mousetrap",
      "title": "Write unit tests for functions.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 10,
      "project": "Bug Zapper",
      "title": "Integrate third-party services (e.g., payments).",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 11,
      "project": "Mousetrap",
      "title": "Perform code reviews for quality.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 12,
      "project": "Mousetrap",
      "title": "Set up CI/CD pipelines for automation.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 13,
      "project": "Mousetrap",
      "title": "Draft technical documentation for developers.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 14,
      "project": "Mousetrap",
      "title": "Optimize database queries for speed.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 15,
      "project": "Mousetrap",
      "title": "Debug production issues and errors.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 16,
      "project": "Mousetrap",
      "title": "Refactor legacy code for maintainability.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 17,
      "project": "Mousetrap",
      "title": "Implement authentication and authorization logic.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 18,
      "project": "Mousetrap",
      "title": "Conduct security vulnerability scans.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 19,
      "project": "Mousetrap",
      "title": "Manage version control (merging/branching).",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 20,
      "project": "Bug Zapper",
      "title": "Deploy builds to staging environments.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 21,
      "project": "Mousetrap",
      "title": "Monitor server logs and performance.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 22,
      "project": "Mousetrap",
      "title": "Update dependencies to newer versions.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 23,
      "project": "Girlfriend",
      "title": "Buy flowers.",
      "description": "Needed for anniversary.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 24,
      "project": "Girlfriend",
      "title": "Make dinner reservations.",
      "description": "Needed for anniversary.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 25,
      "project": "Girlfriend",
      "title": "Purchase Carnival cruise tickets.",
      "description": "Needed for anniversary.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    }
  ]
}

Test 'GET /projects' route for 'USER'

{
  "data": [
    {
      "id": 1,
      "owner_id": 3,
      "project": "Mousetrap"
    },
    {
      "id": 2,
      "owner_id": 3,
      "project": "Bug Zapper"
    },
    {
      "id": 3,
      "owner_id": 3,
      "project": "Girlfriend"
    }
  ]
}

Test 'GET /users' route for 'USER' *** NOT AUTHORIZED ***

{
  "error": "Forbidden",
  "message": "This action requires one of these roles: admin."
}



=================================================




Get token for 'ADMIN'



Print 'ADMIN' token to screen

eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyIiwidXNlcm5hbWUiOiJhZG1pbiIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTc4NTE3NTYwNCwiZXhwIjoxNzg1MTc5MjA0fQ.PpeL_nOwOK2zvJA-W95V4sjC3GN4tcvL4B7rOm8dphg


Test 'GET /tasks' route for 'ADMIN'

{
  "data": [
    {
      "id": 1,
      "project": "Bug Zapper",
      "title": "Recruit a better Javascript programmer.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 2,
      "project": "Mousetrap",
      "title": "Assemble a team of your finest programmers.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 3,
      "project": "Mousetrap",
      "title": "Gather requirements from stakeholders.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 4,
      "project": "Mousetrap",
      "title": "Create user stories for development.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 5,
      "project": "Mousetrap",
      "title": "Design system architecture for scalability.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 6,
      "project": "Bug Zapper",
      "title": "Model database schemas and relationships.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 7,
      "project": "Mousetrap",
      "title": "Build UI components for frontend.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 8,
      "project": "Bug Zapper",
      "title": "Develop REST/GraphQL APIs for backend.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 9,
      "project": "Mousetrap",
      "title": "Write unit tests for functions.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 10,
      "project": "Bug Zapper",
      "title": "Integrate third-party services (e.g., payments).",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 11,
      "project": "Mousetrap",
      "title": "Perform code reviews for quality.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 12,
      "project": "Mousetrap",
      "title": "Set up CI/CD pipelines for automation.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 13,
      "project": "Mousetrap",
      "title": "Draft technical documentation for developers.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 14,
      "project": "Mousetrap",
      "title": "Optimize database queries for speed.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 15,
      "project": "Mousetrap",
      "title": "Debug production issues and errors.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 16,
      "project": "Mousetrap",
      "title": "Refactor legacy code for maintainability.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 17,
      "project": "Mousetrap",
      "title": "Implement authentication and authorization logic.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 18,
      "project": "Mousetrap",
      "title": "Conduct security vulnerability scans.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 19,
      "project": "Mousetrap",
      "title": "Manage version control (merging/branching).",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 20,
      "project": "Bug Zapper",
      "title": "Deploy builds to staging environments.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 21,
      "project": "Mousetrap",
      "title": "Monitor server logs and performance.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 22,
      "project": "Mousetrap",
      "title": "Update dependencies to newer versions.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 23,
      "project": "Girlfriend",
      "title": "Buy flowers.",
      "description": "Needed for anniversary.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 24,
      "project": "Girlfriend",
      "title": "Make dinner reservations.",
      "description": "Needed for anniversary.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 25,
      "project": "Girlfriend",
      "title": "Purchase Carnival cruise tickets.",
      "description": "Needed for anniversary.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    }
  ]
}

Test 'GET /projects' route for 'ADMIN'

{
  "data": [
    {
      "id": 1,
      "owner_id": 3,
      "project": "Mousetrap"
    },
    {
      "id": 2,
      "owner_id": 3,
      "project": "Bug Zapper"
    },
    {
      "id": 3,
      "owner_id": 3,
      "project": "Girlfriend"
    }
  ]
}

Test 'GET /users' route for 'ADMIN' *** OKAY THIS TIME ***

{
  "data": [
    {
      "id": 1,
      "username": "user",
      "password_hash": "$2b$10$8juDCPKS5OK67MUY.K7K6usIQCv40BIGbdoyhRCUPtHKnxkS8fD3C",
      "role": "user"
    },
    {
      "id": 2,
      "username": "admin",
      "password_hash": "$2b$10$dTY5nhzylvqA.nSbp58XceCqvJOWiLkLYSST650AT/h..3b3Zpq5W",
      "role": "admin"
    },
    {
      "id": 3,
      "username": "mgr",
      "password_hash": "$2b$10$EiKC3QCQbEzDUWTPHMebJOpFs8GPeh/sMiCdckItx2lCSQw6gzBrW",
      "role": "admin"
    }
  ]
}



=================================================




Get token for 'MANAGER'



Print 'MANAGER' token to screen

eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIzIiwidXNlcm5hbWUiOiJtZ3IiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3ODUxNzU2MDQsImV4cCI6MTc4NTE3OTIwNH0.qPgVp_Oo73Qym0C2HK7JSlZKgyp6zojPQVCYgbSOV5E


Test 'GET /tasks' route for 'MANAGER'

{
  "data": [
    {
      "id": 1,
      "project": "Bug Zapper",
      "title": "Recruit a better Javascript programmer.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 2,
      "project": "Mousetrap",
      "title": "Assemble a team of your finest programmers.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 3,
      "project": "Mousetrap",
      "title": "Gather requirements from stakeholders.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 4,
      "project": "Mousetrap",
      "title": "Create user stories for development.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 5,
      "project": "Mousetrap",
      "title": "Design system architecture for scalability.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 6,
      "project": "Bug Zapper",
      "title": "Model database schemas and relationships.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 7,
      "project": "Mousetrap",
      "title": "Build UI components for frontend.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 8,
      "project": "Bug Zapper",
      "title": "Develop REST/GraphQL APIs for backend.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 9,
      "project": "Mousetrap",
      "title": "Write unit tests for functions.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 10,
      "project": "Bug Zapper",
      "title": "Integrate third-party services (e.g., payments).",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 11,
      "project": "Mousetrap",
      "title": "Perform code reviews for quality.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 12,
      "project": "Mousetrap",
      "title": "Set up CI/CD pipelines for automation.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 13,
      "project": "Mousetrap",
      "title": "Draft technical documentation for developers.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 14,
      "project": "Mousetrap",
      "title": "Optimize database queries for speed.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 15,
      "project": "Mousetrap",
      "title": "Debug production issues and errors.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 16,
      "project": "Mousetrap",
      "title": "Refactor legacy code for maintainability.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 17,
      "project": "Mousetrap",
      "title": "Implement authentication and authorization logic.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 18,
      "project": "Mousetrap",
      "title": "Conduct security vulnerability scans.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 19,
      "project": "Mousetrap",
      "title": "Manage version control (merging/branching).",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 20,
      "project": "Bug Zapper",
      "title": "Deploy builds to staging environments.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 21,
      "project": "Mousetrap",
      "title": "Monitor server logs and performance.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 22,
      "project": "Mousetrap",
      "title": "Update dependencies to newer versions.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 23,
      "project": "Girlfriend",
      "title": "Buy flowers.",
      "description": "Needed for anniversary.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 24,
      "project": "Girlfriend",
      "title": "Make dinner reservations.",
      "description": "Needed for anniversary.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 25,
      "project": "Girlfriend",
      "title": "Purchase Carnival cruise tickets.",
      "description": "Needed for anniversary.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    }
  ]
}

Test 'GET /projects' route for 'MANAGER'

{
  "data": [
    {
      "id": 1,
      "owner_id": 3,
      "project": "Mousetrap"
    },
    {
      "id": 2,
      "owner_id": 3,
      "project": "Bug Zapper"
    },
    {
      "id": 3,
      "owner_id": 3,
      "project": "Girlfriend"
    }
  ]
}

Test 'GET /users' route for 'MANAGER' *** OKAY THIS TIME ***

{
  "data": [
    {
      "id": 1,
      "username": "user",
      "password_hash": "$2b$10$8juDCPKS5OK67MUY.K7K6usIQCv40BIGbdoyhRCUPtHKnxkS8fD3C",
      "role": "user"
    },
    {
      "id": 2,
      "username": "admin",
      "password_hash": "$2b$10$dTY5nhzylvqA.nSbp58XceCqvJOWiLkLYSST650AT/h..3b3Zpq5W",
      "role": "admin"
    },
    {
      "id": 3,
      "username": "mgr",
      "password_hash": "$2b$10$EiKC3QCQbEzDUWTPHMebJOpFs8GPeh/sMiCdckItx2lCSQw6gzBrW",
      "role": "admin"
    }
  ]
}



=================================================




Create new user 'GLENN' and get token

{
  "message": "User created with role 'user'.",
  "data": {
    "id": 4,
    "username": "glenn",
    "password_hash": "$2b$10$dipnkO.vkHh.z0kzueQ3deRTvyIkZVfGqLXeT.YkOyvncH/.WWcse",
    "role": "user"
  }
}

Test 'GET /tasks' route for 'GLENN'

{
  "data": [
    {
      "id": 1,
      "project": "Bug Zapper",
      "title": "Recruit a better Javascript programmer.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 2,
      "project": "Mousetrap",
      "title": "Assemble a team of your finest programmers.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 3,
      "project": "Mousetrap",
      "title": "Gather requirements from stakeholders.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 4,
      "project": "Mousetrap",
      "title": "Create user stories for development.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 5,
      "project": "Mousetrap",
      "title": "Design system architecture for scalability.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 6,
      "project": "Bug Zapper",
      "title": "Model database schemas and relationships.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 7,
      "project": "Mousetrap",
      "title": "Build UI components for frontend.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 8,
      "project": "Bug Zapper",
      "title": "Develop REST/GraphQL APIs for backend.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 9,
      "project": "Mousetrap",
      "title": "Write unit tests for functions.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 10,
      "project": "Bug Zapper",
      "title": "Integrate third-party services (e.g., payments).",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 11,
      "project": "Mousetrap",
      "title": "Perform code reviews for quality.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 12,
      "project": "Mousetrap",
      "title": "Set up CI/CD pipelines for automation.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 13,
      "project": "Mousetrap",
      "title": "Draft technical documentation for developers.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 14,
      "project": "Mousetrap",
      "title": "Optimize database queries for speed.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 15,
      "project": "Mousetrap",
      "title": "Debug production issues and errors.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 16,
      "project": "Mousetrap",
      "title": "Refactor legacy code for maintainability.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 17,
      "project": "Mousetrap",
      "title": "Implement authentication and authorization logic.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 18,
      "project": "Mousetrap",
      "title": "Conduct security vulnerability scans.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 19,
      "project": "Mousetrap",
      "title": "Manage version control (merging/branching).",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 20,
      "project": "Bug Zapper",
      "title": "Deploy builds to staging environments.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 21,
      "project": "Mousetrap",
      "title": "Monitor server logs and performance.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 22,
      "project": "Mousetrap",
      "title": "Update dependencies to newer versions.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 23,
      "project": "Girlfriend",
      "title": "Buy flowers.",
      "description": "Needed for anniversary.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 24,
      "project": "Girlfriend",
      "title": "Make dinner reservations.",
      "description": "Needed for anniversary.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 25,
      "project": "Girlfriend",
      "title": "Purchase Carnival cruise tickets.",
      "description": "Needed for anniversary.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    }
  ]
}

Create new user 'MICKEY' and get token

{
  "message": "User created with role 'user'.",
  "data": {
    "id": 5,
    "username": "mickey",
    "password_hash": "$2b$10$mG1fGc31VGA9.7Z1aRBBF.JqInRd6VtwDKltz778LOvh3gkcVtp7q",
    "role": "user"
  }
}

Test 'GET /tasks' route for 'MICKEY'

{
  "data": [
    {
      "id": 1,
      "project": "Bug Zapper",
      "title": "Recruit a better Javascript programmer.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 2,
      "project": "Mousetrap",
      "title": "Assemble a team of your finest programmers.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 3,
      "project": "Mousetrap",
      "title": "Gather requirements from stakeholders.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 4,
      "project": "Mousetrap",
      "title": "Create user stories for development.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 5,
      "project": "Mousetrap",
      "title": "Design system architecture for scalability.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 6,
      "project": "Bug Zapper",
      "title": "Model database schemas and relationships.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 7,
      "project": "Mousetrap",
      "title": "Build UI components for frontend.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 8,
      "project": "Bug Zapper",
      "title": "Develop REST/GraphQL APIs for backend.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 9,
      "project": "Mousetrap",
      "title": "Write unit tests for functions.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 10,
      "project": "Bug Zapper",
      "title": "Integrate third-party services (e.g., payments).",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 11,
      "project": "Mousetrap",
      "title": "Perform code reviews for quality.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 12,
      "project": "Mousetrap",
      "title": "Set up CI/CD pipelines for automation.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 13,
      "project": "Mousetrap",
      "title": "Draft technical documentation for developers.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 14,
      "project": "Mousetrap",
      "title": "Optimize database queries for speed.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 15,
      "project": "Mousetrap",
      "title": "Debug production issues and errors.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 16,
      "project": "Mousetrap",
      "title": "Refactor legacy code for maintainability.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 17,
      "project": "Mousetrap",
      "title": "Implement authentication and authorization logic.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 18,
      "project": "Mousetrap",
      "title": "Conduct security vulnerability scans.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 19,
      "project": "Mousetrap",
      "title": "Manage version control (merging/branching).",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 20,
      "project": "Bug Zapper",
      "title": "Deploy builds to staging environments.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 21,
      "project": "Mousetrap",
      "title": "Monitor server logs and performance.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 22,
      "project": "Mousetrap",
      "title": "Update dependencies to newer versions.",
      "description": "Needed for next toll gate review.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 23,
      "project": "Girlfriend",
      "title": "Buy flowers.",
      "description": "Needed for anniversary.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 24,
      "project": "Girlfriend",
      "title": "Make dinner reservations.",
      "description": "Needed for anniversary.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    },
    {
      "id": 25,
      "project": "Girlfriend",
      "title": "Purchase Carnival cruise tickets.",
      "description": "Needed for anniversary.",
      "status": "Not Started",
      "create_dt": "2026-08-04",
      "update_dt": "2026-08-04"
    }
  ]
}



=================================================




Test 'GET /auth/me' route for 'USER'

{
  "user": {
    "sub": "1",
    "username": "user",
    "role": "user",
    "iat": 1785175604,
    "exp": 1785179204
  }
}

Test 'GET /auth/me' route for 'ADMIN'

{
  "user": {
    "sub": "2",
    "username": "admin",
    "role": "admin",
    "iat": 1785175604,
    "exp": 1785179204
  }
}

Test 'GET /auth/me' route for 'MANAGER'

{
  "user": {
    "sub": "3",
    "username": "mgr",
    "role": "admin",
    "iat": 1785175604,
    "exp": 1785179204
  }
}

Test 'GET /auth/me' route for 'GLENN'

{
  "user": {
    "sub": "4",
    "username": "glenn",
    "role": "user",
    "iat": 1785175604,
    "exp": 1785179204
  }
}

Test 'GET /auth/me' route for 'MICKEY'

{
  "user": {
    "sub": "5",
    "username": "mickey",
    "role": "user",
    "iat": 1785175604,
    "exp": 1785179204
  }
}



=================================================




Create new project for 'USER'

{
  "data": {
    "id": 4,
    "owner_id": 1,
    "project": "Project ALPHA"
  }
}

Create new project for 'ADMIN'

{
  "data": {
    "id": 5,
    "owner_id": 2,
    "project": "Project BRAVO"
  }
}

Create new project for 'MANAGER'

{
  "data": {
    "id": 6,
    "owner_id": 3,
    "project": "Project CHARLIE"
  }
}

Create new project for 'GLENN'

{
  "data": {
    "id": 7,
    "owner_id": 4,
    "project": "Project DELTA"
  }
}

Create new project for 'MICKEY'

{
  "data": {
    "id": 8,
    "owner_id": 5,
    "project": "Project ECHO"
  }
}



=================================================




Test 'GET /projects' route for 'USER'

{
  "data": [
    {
      "id": 1,
      "owner_id": 3,
      "project": "Mousetrap"
    },
    {
      "id": 2,
      "owner_id": 3,
      "project": "Bug Zapper"
    },
    {
      "id": 3,
      "owner_id": 3,
      "project": "Girlfriend"
    },
    {
      "id": 4,
      "owner_id": 1,
      "project": "Project ALPHA"
    },
    {
      "id": 5,
      "owner_id": 2,
      "project": "Project BRAVO"
    },
    {
      "id": 6,
      "owner_id": 3,
      "project": "Project CHARLIE"
    },
    {
      "id": 7,
      "owner_id": 4,
      "project": "Project DELTA"
    },
    {
      "id": 8,
      "owner_id": 5,
      "project": "Project ECHO"
    }
  ]
}

Test 'GET /projects' route for 'ADMIN'

{
  "data": [
    {
      "id": 1,
      "owner_id": 3,
      "project": "Mousetrap"
    },
    {
      "id": 2,
      "owner_id": 3,
      "project": "Bug Zapper"
    },
    {
      "id": 3,
      "owner_id": 3,
      "project": "Girlfriend"
    },
    {
      "id": 4,
      "owner_id": 1,
      "project": "Project ALPHA"
    },
    {
      "id": 5,
      "owner_id": 2,
      "project": "Project BRAVO"
    },
    {
      "id": 6,
      "owner_id": 3,
      "project": "Project CHARLIE"
    },
    {
      "id": 7,
      "owner_id": 4,
      "project": "Project DELTA"
    },
    {
      "id": 8,
      "owner_id": 5,
      "project": "Project ECHO"
    }
  ]
}

Test 'GET /projects' route for 'MANAGER'

{
  "data": [
    {
      "id": 1,
      "owner_id": 3,
      "project": "Mousetrap"
    },
    {
      "id": 2,
      "owner_id": 3,
      "project": "Bug Zapper"
    },
    {
      "id": 3,
      "owner_id": 3,
      "project": "Girlfriend"
    },
    {
      "id": 4,
      "owner_id": 1,
      "project": "Project ALPHA"
    },
    {
      "id": 5,
      "owner_id": 2,
      "project": "Project BRAVO"
    },
    {
      "id": 6,
      "owner_id": 3,
      "project": "Project CHARLIE"
    },
    {
      "id": 7,
      "owner_id": 4,
      "project": "Project DELTA"
    },
    {
      "id": 8,
      "owner_id": 5,
      "project": "Project ECHO"
    }
  ]
}

Test 'GET /projects' route for 'GLENN'

{
  "data": [
    {
      "id": 1,
      "owner_id": 3,
      "project": "Mousetrap"
    },
    {
      "id": 2,
      "owner_id": 3,
      "project": "Bug Zapper"
    },
    {
      "id": 3,
      "owner_id": 3,
      "project": "Girlfriend"
    },
    {
      "id": 4,
      "owner_id": 1,
      "project": "Project ALPHA"
    },
    {
      "id": 5,
      "owner_id": 2,
      "project": "Project BRAVO"
    },
    {
      "id": 6,
      "owner_id": 3,
      "project": "Project CHARLIE"
    },
    {
      "id": 7,
      "owner_id": 4,
      "project": "Project DELTA"
    },
    {
      "id": 8,
      "owner_id": 5,
      "project": "Project ECHO"
    }
  ]
}

Test 'GET /projects' route for 'MICKEY'

{
  "data": [
    {
      "id": 1,
      "owner_id": 3,
      "project": "Mousetrap"
    },
    {
      "id": 2,
      "owner_id": 3,
      "project": "Bug Zapper"
    },
    {
      "id": 3,
      "owner_id": 3,
      "project": "Girlfriend"
    },
    {
      "id": 4,
      "owner_id": 1,
      "project": "Project ALPHA"
    },
    {
      "id": 5,
      "owner_id": 2,
      "project": "Project BRAVO"
    },
    {
      "id": 6,
      "owner_id": 3,
      "project": "Project CHARLIE"
    },
    {
      "id": 7,
      "owner_id": 4,
      "project": "Project DELTA"
    },
    {
      "id": 8,
      "owner_id": 5,
      "project": "Project ECHO"
    }
  ]
}



=================================================




Create new task for 'GLENN'

{
  "data": {
    "id": 26,
    "pid": 7,
    "assgnd_id": 4,
    "title": "Purchase plane tickets for Bogota",
    "description": "Needed for illicit meeting",
    "status": "Not started",
    "create_dt": "2026-07-27",
    "update_dt": "2026-07-27"
  }
}

Test 'GET /tasks/26' route for 'GLENN'

{
  "data": {
    "id": 26,
    "pid": 7,
    "assgnd_id": 4,
    "title": "Purchase plane tickets for Bogota",
    "description": "Needed for illicit meeting",
    "status": "Not started",
    "create_dt": "2026-07-27",
    "update_dt": "2026-07-27"
  }
}

Test 'PATCH /tasks/26' route for 'GLENN'  *** NOT AUTHORIZED *** 

{
  "error": "Forbidden",
  "message": "This action requires one of these roles: admin."
}

Test 'DELETE /tasks/26' route 'for GLENN'  *** NOT AUTHORIZED *** 

{
  "error": "Forbidden",
  "message": "This action requires one of these roles: admin."
}



=================================================




Test 'PATCH /tasks/26' route for 'MANAGER'  *** OKAY THIS TIME *** 

{
  "data": {
    "id": 26,
    "pid": 7,
    "assgnd_id": 4,
    "title": "Purchase plane tickets for Bogota",
    "description": "Needed for illicit meeting",
    "status": "Completed",
    "create_dt": "2026-07-27",
    "update_dt": "2026-07-27"
  }
}

Test 'DELETE /tasks/26' route for 'MANAGER'  *** OKAY THIS TIME *** 

{
  "message": "Deleted.",
  "data": {
    "id": 26,
    "title": "Purchase plane tickets for Bogota"
  }
}



=================================================


nicegoat@goatdev:~/cs553-project$ 
nicegoat@goatdev:~/cs553-project$ 
nicegoat@goatdev:~/cs553-project$ 
nicegoat@goatdev:~/cs553-project$ 

```
