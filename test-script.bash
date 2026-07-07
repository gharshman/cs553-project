#!/bin/bash
# sudo docker compose up -d
# cd apps/api
# npm run dev &

# Test server.js routes
echo -e "\n\n\n\n=============== Testing general endpoints in server.ts ================\n"
curl http://localhost:3000
curl http://localhost:3000
curl http://localhost:3000
curl http://localhost:3000
curl http://localhost:3000
curl http://localhost:3000/health
curl http://localhost:3000/health
curl http://localhost:3000/health
curl http://localhost:3000/health
curl http://localhost:3000/health
curl http://localhost:3000/db-health
curl http://localhost:3000/db-health
curl http://localhost:3000/db-health
curl http://localhost:3000/db-health
curl http://localhost:3000/db-health

read -p "Press enter to continue..."

# Test tasks list all router
echo -e "\n\n\n\n=============== Testing tasks/ 'list all' route ================\n"
curl http://localhost:3000/tasks
read -p "Press enter to continue..."

# Test tasks/:id router
echo -e "\n\n\n\n=============== Testing tasks/:id 'list one' route ================\n"
curl http://localhost:3000/tasks/1
curl http://localhost:3000/tasks/2
curl http://localhost:3000/tasks/3
curl http://localhost:3000/tasks/4
curl http://localhost:3000/tasks/5
curl http://localhost:3000/tasks/6
curl http://localhost:3000/tasks/7
curl http://localhost:3000/tasks/8
curl http://localhost:3000/tasks/9
curl http://localhost:3000/tasks/10
curl http://localhost:3000/tasks/11
curl http://localhost:3000/tasks/12
curl http://localhost:3000/tasks/13
curl http://localhost:3000/tasks/14
curl http://localhost:3000/tasks/15
curl http://localhost:3000/tasks/16
curl http://localhost:3000/tasks/17
curl http://localhost:3000/tasks/18
curl http://localhost:3000/tasks/19
curl http://localhost:3000/tasks/20
curl http://localhost:3000/tasks/21
curl http://localhost:3000/tasks/22
read -p "Press enter to continue..."

# Add 22 new tasks (same as existing 22, but in Spanish)
echo -e "\n\n\n\n=============== Testing tasks/ POST new task route ================\n"
curl -X POST -H "Content-Type: application/json" -d '{ "title": "Recluta a un programador Javascript mejor.", "description": "Se requiere para la próxima revisión de hito de control.", "status": "Sin comenzar" }' http://localhost:3000/tasks
curl -X POST -H "Content-Type: application/json" -d '{ "title": "Reúne un equipo de tus mejores programadores.", "description": "Se requiere para la próxima revisión de hito de control.", "status": "Sin comenzar" }' http://localhost:3000/tasks
curl -X POST -H "Content-Type: application/json" -d '{ "title": "Recopilar requisitos de las partes interesadas.", "description": "Se requiere para la próxima revisión de hito de control.", "status": "Sin comenzar" }' http://localhost:3000/tasks
curl -X POST -H "Content-Type: application/json" -d '{ "title": "Crear historias de usuario para el desarrollo.", "description": "Se requiere para la próxima revisión de hito de control.", "status": "Sin comenzar" }' http://localhost:3000/tasks
curl -X POST -H "Content-Type: application/json" -d '{ "title": "Diseñar la arquitectura del sistema para la escalabilidad.", "description": "Se requiere para la próxima revisión de hito de control.", "status": "Sin comenzar" }' http://localhost:3000/tasks
curl -X POST -H "Content-Type: application/json" -d '{ "title": "Modelar esquemas y relaciones de bases de datos.", "description": "Se requiere para la próxima revisión de hito de control.", "status": "Sin comenzar" }' http://localhost:3000/tasks
curl -X POST -H "Content-Type: application/json" -d '{ "title": "Desarrollar componentes de interfaz para el usuario.", "description": "Se requiere para la próxima revisión de hito de control.", "status": "Sin comenzar" }' http://localhost:3000/tasks
curl -X POST -H "Content-Type: application/json" -d '{ "title": "Desarrollar APIs REST/GraphQL para el backend.", "description": "Se requiere para la próxima revisión de hito de control.", "status": "Sin comenzar" }' http://localhost:3000/tasks
curl -X POST -H "Content-Type: application/json" -d '{ "title": "Escribe pruebas unitarias para las funciones.", "description": "Se requiere para la próxima revisión de hito de control.", "status": "Sin comenzar" }' http://localhost:3000/tasks
curl -X POST -H "Content-Type: application/json" -d '{ "title": "Integra servicios de terceros (p. ej., pagos).", "description": "Se requiere para la próxima revisión de hito de control.", "status": "Sin comenzar" }' http://localhost:3000/tasks
curl -X POST -H "Content-Type: application/json" -d '{ "title": "Realizar revisiones de código para garantizar la calidad.", "description": "Se requiere para la próxima revisión de hito de control.", "status": "Sin comenzar" }' http://localhost:3000/tasks
curl -X POST -H "Content-Type: application/json" -d '{ "title": "Configurar canalizaciones de CI/CD para la automatización.", "description": "Se requiere para la próxima revisión de hito de control.", "status": "Sin comenzar" }' http://localhost:3000/tasks
curl -X POST -H "Content-Type: application/json" -d '{ "title": "Redactar documentación técnica para desarrolladores.", "description": "Se requiere para la próxima revisión de hito de control.", "status": "Sin comenzar" }' http://localhost:3000/tasks
curl -X POST -H "Content-Type: application/json" -d '{ "title": "Optimiza las consultas a la base de datos para mejorar la velocidad.", "description": "Se requiere para la próxima revisión de hito de control.", "status": "Sin comenzar" }' http://localhost:3000/tasks
curl -X POST -H "Content-Type: application/json" -d '{ "title": "Depurar problemas y errores en producción.", "description": "Se requiere para la próxima revisión de hito de control.", "status": "Sin comenzar" }' http://localhost:3000/tasks
curl -X POST -H "Content-Type: application/json" -d '{ "title": "Refactorizar código heredado para mejorar su mantenibilidad.", "description": "Se requiere para la próxima revisión de hito de control.", "status": "Sin comenzar" }' http://localhost:3000/tasks
curl -X POST -H "Content-Type: application/json" -d '{ "title": "Implementar la lógica de autenticación y autorización.", "description": "Se requiere para la próxima revisión de hito de control.", "status": "Sin comenzar" }' http://localhost:3000/tasks
curl -X POST -H "Content-Type: application/json" -d '{ "title": "Realizar escaneos de vulnerabilidades de seguridad.", "description": "Se requiere para la próxima revisión de hito de control.", "status": "Sin comenzar" }' http://localhost:3000/tasks
curl -X POST -H "Content-Type: application/json" -d '{ "title": "Gestionar el control de versiones (fusión/creación de ramas).", "description": "Se requiere para la próxima revisión de hito de control.", "status": "Sin comenzar" }' http://localhost:3000/tasks
curl -X POST -H "Content-Type: application/json" -d '{ "title": "Desplegar compilaciones en entornos de preproducción.", "description": "Se requiere para la próxima revisión de hito de control.", "status": "Sin comenzar" }' http://localhost:3000/tasks
curl -X POST -H "Content-Type: application/json" -d '{ "title": "Monitorear los registros y el rendimiento del servidor.", "description": "Se requiere para la próxima revisión de hito de control.", "status": "Sin comenzar" }' http://localhost:3000/tasks
curl -X POST -H "Content-Type: application/json" -d '{ "title": "Actualizar las dependencias a versiones más recientes.", "description": "Se requiere para la próxima revisión de hito de control.", "status": "Sin comenzar" }' http://localhost:3000/tasks
read -p "Press enter to continue..."

curl http://localhost:3000/tasks
read -p "Press enter to continue..."

# Update status of English tasks to "In Progress"
echo -e "\n\n\n\n=============== Testing tasks/:id PATCH update record route ================\n"
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "In Progress" }' http://localhost:3000/tasks/1
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "In Progress" }' http://localhost:3000/tasks/2
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "In Progress" }' http://localhost:3000/tasks/3
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "In Progress" }' http://localhost:3000/tasks/4
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "In Progress" }' http://localhost:3000/tasks/5
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "In Progress" }' http://localhost:3000/tasks/6
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "In Progress" }' http://localhost:3000/tasks/7
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "In Progress" }' http://localhost:3000/tasks/8
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "In Progress" }' http://localhost:3000/tasks/9
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "In Progress" }' http://localhost:3000/tasks/10
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "In Progress" }' http://localhost:3000/tasks/11
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "In Progress" }' http://localhost:3000/tasks/12
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "In Progress" }' http://localhost:3000/tasks/13
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "In Progress" }' http://localhost:3000/tasks/14
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "In Progress" }' http://localhost:3000/tasks/15
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "In Progress" }' http://localhost:3000/tasks/16
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "In Progress" }' http://localhost:3000/tasks/17
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "In Progress" }' http://localhost:3000/tasks/18
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "In Progress" }' http://localhost:3000/tasks/19
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "In Progress" }' http://localhost:3000/tasks/20
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "In Progress" }' http://localhost:3000/tasks/21
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "In Progress" }' http://localhost:3000/tasks/22
read -p "Press enter to continue..."

# Update status of Spanish tasks to "En Curso"
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "En Curso" }' http://localhost:3000/tasks/23
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "En Curso" }' http://localhost:3000/tasks/24
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "En Curso" }' http://localhost:3000/tasks/25
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "En Curso" }' http://localhost:3000/tasks/26
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "En Curso" }' http://localhost:3000/tasks/27
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "En Curso" }' http://localhost:3000/tasks/28
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "En Curso" }' http://localhost:3000/tasks/29
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "En Curso" }' http://localhost:3000/tasks/30
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "En curso" }' http://localhost:3000/tasks/31
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "En curso" }' http://localhost:3000/tasks/32
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "En curso" }' http://localhost:3000/tasks/33
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "En curso" }' http://localhost:3000/tasks/34
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "En curso" }' http://localhost:3000/tasks/35
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "En curso" }' http://localhost:3000/tasks/36
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "En curso" }' http://localhost:3000/tasks/37
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "En curso" }' http://localhost:3000/tasks/38
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "En curso" }' http://localhost:3000/tasks/39
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "En curso" }' http://localhost:3000/tasks/40
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "En curso" }' http://localhost:3000/tasks/41
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "En curso" }' http://localhost:3000/tasks/42
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "En curso" }' http://localhost:3000/tasks/43
curl -X PATCH -H "Content-Type: application/json" -d '{"status" : "En curso" }' http://localhost:3000/tasks/44
read -p "Press enter to continue..."

# View all tasks
echo -e "\n\n\n\n=============== Testing tasks/ 'list all' route ================\n"
curl http://localhost:3000/tasks
read -p "Press enter to continue..."

# Delete all Spanish tasks
echo -e "\n\n\n\n=============== Testing tasks/:id DELETE route ================\n"
curl -X DELETE http://localhost:3000/tasks/23
curl -X DELETE http://localhost:3000/tasks/24
curl -X DELETE http://localhost:3000/tasks/25
curl -X DELETE http://localhost:3000/tasks/26
curl -X DELETE http://localhost:3000/tasks/27
curl -X DELETE http://localhost:3000/tasks/28
curl -X DELETE http://localhost:3000/tasks/29
curl -X DELETE http://localhost:3000/tasks/30
curl -X DELETE http://localhost:3000/tasks/31
curl -X DELETE http://localhost:3000/tasks/32
curl -X DELETE http://localhost:3000/tasks/33
curl -X DELETE http://localhost:3000/tasks/34
curl -X DELETE http://localhost:3000/tasks/35
curl -X DELETE http://localhost:3000/tasks/36
curl -X DELETE http://localhost:3000/tasks/37
curl -X DELETE http://localhost:3000/tasks/38
curl -X DELETE http://localhost:3000/tasks/39
curl -X DELETE http://localhost:3000/tasks/40
curl -X DELETE http://localhost:3000/tasks/41
curl -X DELETE http://localhost:3000/tasks/42
curl -X DELETE http://localhost:3000/tasks/43
curl -X DELETE http://localhost:3000/tasks/44
read -p "Press enter to continue..."

# View all tasks
echo -e "\n\n\n\n=============== Testing tasks/ 'list all' route ================\n"
curl http://localhost:3000/tasks
read -p "Press enter to continue..."

echo -e "\n\n\n\n=============== Resetting tasks 1-22 back to 'Not Started' ================\n"
sudo docker exec -it cs453-postgres psql -U postgres -d cs453 -c "UPDATE tasks SET status = 'Not Started';"
read -p "Press enter to continue..."

# reset database
echo -e "\n\n\n\n=============== Resetting database autoindex back to 23 ================\n"
sudo docker exec -it cs453-postgres psql -U postgres -d cs453 -c "ALTER SEQUENCE tasks_id_seq RESTART WITH 23;"
read -p "Press enter to continue..."

# Erroneous Commands
# Create New Task, No Title
echo -e "\n\n\n\n=============== Create New Task -- No Title ================\n"
curl -X POST -H "Content-Type: application/json" -d '{"description" : "admin" , "status" : "Sin comenzar" }' http://localhost:3000/tasks
read -p "Press enter to continue..."

# Create New Task, Title Zero Length
echo -e "\n\n\n\n=============== Create New Task -- Zero Length Title ================\n"
curl -X POST -H "Content-Type: application/json" -d '{"title" : "", "description" : "admin" , "status" : "Sin comenzar" }' http://localhost:3000/tasks
read -p "Press enter to continue..."

# Create New Task *** Bad JSON Format ***
echo -e "\n\n\n\n=============== Create New Task -- Bad JSON Format (Missing \" mark) ================\n"
curl -X POST -H "Content-Type: application/json" -d '{"title" : "", description" : "admin" , "status" : "Sin comenzar" }' http://localhost:3000/tasks

