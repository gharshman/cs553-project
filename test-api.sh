#!/bin/bash

echo -e "\n\n=================================================\n\n"

echo -e "\n\nTest unprotected routes --- No token required\n"

curl  http://localhost:3000
echo -e "\n"
curl http://localhost:3000/health
echo -e "\n"
curl http://localhost:3000/db-health

echo -e "\n"

echo -e "\n\n=================================================\n\n"

echo -e "\n\nGet token for 'USER'\n"
export JWT_TOKEN_USR=$(curl -s -X POST http://localhost:3000/auth/login \
                            -H "Content-Type: application/json" \
                            -d '{"username":"user","password":"user-password"}' \
                       | jq -r '.accessToken')

echo -e "\n\nPrint 'USER' token to screen\n"
echo $JWT_TOKEN_USR

echo -e "\n\nTest 'GET /tasks' route for 'USER'\n"
curl -s -X GET http://localhost:3000/tasks -H "Authorization: Bearer $JWT_TOKEN_USR"

echo -e "\n\nTest 'GET /projects' route for 'USER'\n"
curl -s -X GET http://localhost:3000/projects -H "Authorization: Bearer $JWT_TOKEN_USR"

echo -e "\n\nTest 'GET /users' route for 'USER' *** NOT AUTHORIZED ***\n"
curl -s -X GET http://localhost:3000/users -H "Authorization: Bearer $JWT_TOKEN_USR"

echo -e "\n"

echo -e "\n\n=================================================\n\n"

echo -e "\n\nGet token for 'ADMIN'\n"
export JWT_TOKEN_ADM=$(curl -s -X POST http://localhost:3000/auth/login \
                            -H "Content-Type: application/json" \
                            -d '{"username":"admin","password":"admin-password"}' \
                       | jq -r '.accessToken')

echo -e "\n\nPrint 'ADMIN' token to screen\n"
echo $JWT_TOKEN_ADM

echo -e "\n\nTest 'GET /tasks' route for 'ADMIN'\n"
curl -s -X GET http://localhost:3000/tasks -H "Authorization: Bearer $JWT_TOKEN_ADM"

echo -e "\n\nTest 'GET /projects' route for 'ADMIN'\n"
curl -s -X GET http://localhost:3000/projects -H "Authorization: Bearer $JWT_TOKEN_ADM"

echo -e "\n\nTest 'GET /users' route for 'ADMIN' *** OKAY THIS TIME ***\n"
curl -s -X GET http://localhost:3000/users -H "Authorization: Bearer $JWT_TOKEN_ADM"

echo -e "\n"

echo -e "\n\n=================================================\n\n"

echo -e "\n\nGet token for 'MANAGER'\n"
export JWT_TOKEN_MGR=$(curl -s -X POST http://localhost:3000/auth/login \
                            -H "Content-Type: application/json" \
                            -d '{"username":"mgr","password":"mgr-password"}' \
                       | jq -r '.accessToken')

echo -e "\n\nPrint 'MANAGER' token to screen\n"
echo $JWT_TOKEN_MGR

echo -e "\n\nTest 'GET /tasks' route for 'MANAGER'\n"
curl -s -X GET http://localhost:3000/tasks -H "Authorization: Bearer $JWT_TOKEN_MGR"

echo -e "\n\nTest 'GET /projects' route for 'MANAGER'\n"
curl -s -X GET http://localhost:3000/projects -H "Authorization: Bearer $JWT_TOKEN_MGR"

echo -e "\n\nTest 'GET /users' route for 'MANAGER' *** OKAY THIS TIME ***\n"
curl -s -X GET http://localhost:3000/users -H "Authorization: Bearer $JWT_TOKEN_MGR"

echo -e "\n"

echo -e "\n\n=================================================\n\n"

echo -e "\n\nCreate new user 'GLENN' and get token\n"
curl -s -X POST http://localhost:3000/auth/register -H "Content-Type: application/json" \
                                                 -d '{"username":"glenn","password":"glenn-password"}'

export JWT_TOKEN_1=$(curl -s -X POST http://localhost:3000/auth/login \
                          -H "Content-Type: application/json" \
                          -d '{"username":"glenn","password":"glenn-password", "role":"monkey"}' \
                      | jq -r '.accessToken')

echo -e "\n\nTest 'GET /tasks' route for 'GLENN'\n"
curl -s -X GET http://localhost:3000/tasks -H "Authorization: Bearer $JWT_TOKEN_1"

echo -e "\n\nCreate new user 'MICKEY' and get token\n"
curl -s -X POST http://localhost:3000/auth/register -H "Content-Type: application/json" \
                                                 -d '{"username":"mickey","password":"mickey-password"}'
export JWT_TOKEN_2=$(curl -s -X POST http://localhost:3000/auth/login \
                          -H "Content-Type: application/json" \
                          -d '{"username":"mickey","password":"mickey-password", "role":"admin"}' \
                     | jq -r '.accessToken')

echo -e "\n\nTest 'GET /tasks' route for 'MICKEY'\n"
curl -s -X GET http://localhost:3000/tasks -H "Authorization: Bearer $JWT_TOKEN_2"

echo -e "\n"

echo -e "\n\n=================================================\n\n"

echo -e "\n\nTest 'GET /auth/me' route for 'USER'\n"
curl -s -X GET http://localhost:3000/auth/me -H "Authorization: Bearer $JWT_TOKEN_USR"

echo -e "\n\nTest 'GET /auth/me' route for 'ADMIN'\n"
curl -s -X GET http://localhost:3000/auth/me -H "Authorization: Bearer $JWT_TOKEN_ADM"

echo -e "\n\nTest 'GET /auth/me' route for 'MANAGER'\n"
curl -s -X GET http://localhost:3000/auth/me -H "Authorization: Bearer $JWT_TOKEN_MGR"

echo -e "\n\nTest 'GET /auth/me' route for 'GLENN'\n"
curl -s -X GET http://localhost:3000/auth/me -H "Authorization: Bearer $JWT_TOKEN_1"

echo -e "\n\nTest 'GET /auth/me' route for 'MICKEY'\n"
curl -s -X GET http://localhost:3000/auth/me -H "Authorization: Bearer $JWT_TOKEN_2"

echo -e "\n"

echo -e "\n\n=================================================\n\n"

echo -e "\n\nCreate new project for 'USER'\n"
curl -s -X POST http://localhost:3000/projects -H "Content-Type: application/json" \
                                            -H "Authorization: Bearer $JWT_TOKEN_USR" \
                                            -d '{"owner_id": 1 , "project" : "Project ALPHA"}'

echo -e "\n\nCreate new project for 'ADMIN'\n"
curl -s -X POST http://localhost:3000/projects -H "Content-Type: application/json" \
                                            -H "Authorization: Bearer $JWT_TOKEN_ADM" \
                                            -d '{"owner_id": 2 , "project" : "Project BRAVO"}'

echo -e "\n\nCreate new project for 'MANAGER'\n"
curl -s -X POST http://localhost:3000/projects -H "Content-Type: application/json" \
                                            -H "Authorization: Bearer $JWT_TOKEN_MGR" \
                                            -d '{"owner_id": 3 , "project" : "Project CHARLIE"}'

echo -e "\n\nCreate new project for 'GLENN'\n"
curl -s -X POST http://localhost:3000/projects -H "Content-Type: application/json" \
                                            -H "Authorization: Bearer $JWT_TOKEN_1" \
                                            -d '{"owner_id": 4 , "project" : "Project DELTA"}'

echo -e "\n\nCreate new project for 'MICKEY'\n"
curl -s -X POST http://localhost:3000/projects -H "Content-Type: application/json" \
                                            -H "Authorization: Bearer $JWT_TOKEN_2" \
                                            -d '{"owner_id": 5 , "project" : "Project ECHO"}'

echo -e "\n"

echo -e "\n\n=================================================\n\n"

echo -e "\n\nTest 'GET /projects' route for 'USER'\n"
curl -s -X GET http://localhost:3000/projects -H "Authorization: Bearer $JWT_TOKEN_USR"

echo -e "\n\nTest 'GET /projects' route for 'ADMIN'\n"
curl -s -X GET http://localhost:3000/projects -H "Authorization: Bearer $JWT_TOKEN_ADM"

echo -e "\n\nTest 'GET /projects' route for 'MANAGER'\n"
curl -s -X GET http://localhost:3000/projects -H "Authorization: Bearer $JWT_TOKEN_MGR"

echo -e "\n\nTest 'GET /projects' route for 'GLENN'\n"
curl -s -X GET http://localhost:3000/projects -H "Authorization: Bearer $JWT_TOKEN_1"

echo -e "\n\nTest 'GET /projects' route for 'MICKEY'\n"
curl -s -X GET http://localhost:3000/projects -H "Authorization: Bearer $JWT_TOKEN_2"

echo -e "\n"

echo -e "\n\n=================================================\n\n"

echo -e "\n\nCreate new task for 'GLENN'\n"
curl -s -X POST http://localhost:3000/tasks -H "Content-Type: application/json" \
                                         -H "Authorization: Bearer $JWT_TOKEN_1" \
                                         -d '{"pid":7,
                                              "assgnd_id":4,
                                              "title":"Purchase plane tickets for Bogota",
                                              "description":"Needed for illicit meeting",
                                              "status":"Not started"}'

echo -e "\n\nTest 'GET /tasks/26' route for 'GLENN'\n"
curl -s -X GET http://localhost:3000/tasks/26 -H "Authorization: Bearer $JWT_TOKEN_1"

echo -e "\n\nTest 'PATCH /tasks/26' route for 'GLENN'  *** NOT AUTHORIZED *** \n"
curl -s -X PATCH http://localhost:3000/tasks/26 -H "Content-Type: application/json" \
                                             -H "Authorization: Bearer $JWT_TOKEN_1" \
                                             -d '{"status":"Completed"}'

echo -e "\n\nTest 'DELETE /tasks/26' route 'for GLENN'  *** NOT AUTHORIZED *** \n"
curl -s -X DELETE http://localhost:3000/tasks/26 -H "Authorization: Bearer $JWT_TOKEN_1"

echo -e "\n"

echo -e "\n\n=================================================\n\n"

echo -e "\n\nTest 'PATCH /tasks/26' route for 'MANAGER'  *** OKAY THIS TIME *** \n"
curl -s -X PATCH http://localhost:3000/tasks/26 -H "Content-Type: application/json" \
                                             -H "Authorization: Bearer $JWT_TOKEN_MGR" \
                                             -d '{"status":"Completed"}'

echo -e "\n\nTest 'DELETE /tasks/26' route for 'MANAGER'  *** OKAY THIS TIME *** \n"
curl -s -X DELETE http://localhost:3000/tasks/26 -H "Authorization: Bearer $JWT_TOKEN_MGR"

echo -e "\n"

echo -e "\n\n=================================================\n\n"

echo -e "\n\nTest 'GET /projects/4' route for 'GLENN'\n"
curl -s -X GET http://localhost:3000/projects/4 -H "Authorization: Bearer $JWT_TOKEN_1"

echo -e "\n\nTest 'GET /projects/3' route for 'MANAGER'\n"
curl -s -X GET http://localhost:3000/projects/3 -H "Authorization: Bearer $JWT_TOKEN_MGR"

echo -e "\n"

