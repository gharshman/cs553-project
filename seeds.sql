BEGIN;

INSERT INTO users (username, password_hash, role) VALUES ('user', 'pending', 'user');
INSERT INTO users (username, password_hash, role) VALUES ('admin', 'pending', 'admin');
INSERT INTO users (username, password_hash, role) VALUES ('mgr', 'pending', 'admin');

INSERT INTO projects (owner_id, project) VALUES (3, 'Mousetrap');
INSERT INTO projects (owner_id, project) VALUES (3, 'Bug Zapper');
INSERT INTO projects (owner_id, project) VALUES (3, 'Girlfriend');

INSERT INTO tasks (pid, assgnd_id, title, description, status, created_at, updated_at) VALUES (2, 3, 'Recruit a better Javascript programmer.', 'Needed for next toll gate review.', 'Not Started', '2026-08-04', '2026-08-04');
INSERT INTO tasks (pid, assgnd_id, title, description, status, created_at, updated_at) VALUES (1, 3, 'Assemble a team of your finest programmers.', 'Needed for next toll gate review.', 'Not Started', '2026-08-04', '2026-08-04');
INSERT INTO tasks (pid, assgnd_id, title, description, status, created_at, updated_at) VALUES (1, 3, 'Gather requirements from stakeholders.', 'Needed for next toll gate review.', 'Not Started', '2026-08-04', '2026-08-04');
INSERT INTO tasks (pid, assgnd_id, title, description, status, created_at, updated_at) VALUES (1, 1, 'Create user stories for development.', 'Needed for next toll gate review.', 'Not Started', '2026-08-04', '2026-08-04');
INSERT INTO tasks (pid, assgnd_id, title, description, status, created_at, updated_at) VALUES (1, 1, 'Design system architecture for scalability.', 'Needed for next toll gate review.', 'Not Started', '2026-08-04', '2026-08-04');
INSERT INTO tasks (pid, assgnd_id, title, description, status, created_at, updated_at) VALUES (2, 1, 'Model database schemas and relationships.', 'Needed for next toll gate review.', 'Not Started', '2026-08-04', '2026-08-04');
INSERT INTO tasks (pid, assgnd_id, title, description, status, created_at, updated_at) VALUES (1, 1, 'Build UI components for frontend.', 'Needed for next toll gate review.', 'Not Started', '2026-08-04', '2026-08-04');
INSERT INTO tasks (pid, assgnd_id, title, description, status, created_at, updated_at) VALUES (2, 1, 'Develop REST/GraphQL APIs for backend.', 'Needed for next toll gate review.', 'Not Started', '2026-08-04', '2026-08-04');
INSERT INTO tasks (pid, assgnd_id, title, description, status, created_at, updated_at) VALUES (1, 1, 'Write unit tests for functions.', 'Needed for next toll gate review.', 'Not Started', '2026-08-04', '2026-08-04');
INSERT INTO tasks (pid, assgnd_id, title, description, status, created_at, updated_at) VALUES (2, 2, 'Integrate third-party services (e.g., payments).', 'Needed for next toll gate review.', 'Not Started', '2026-08-04', '2026-08-04');
INSERT INTO tasks (pid, assgnd_id, title, description, status, created_at, updated_at) VALUES (1, 1, 'Perform code reviews for quality.', 'Needed for next toll gate review.', 'Not Started', '2026-08-04', '2026-08-04');
INSERT INTO tasks (pid, assgnd_id, title, description, status, created_at, updated_at) VALUES (1, 1, 'Set up CI/CD pipelines for automation.', 'Needed for next toll gate review.', 'Not Started', '2026-08-04', '2026-08-04');
INSERT INTO tasks (pid, assgnd_id, title, description, status, created_at, updated_at) VALUES (1, 1, 'Draft technical documentation for developers.', 'Needed for next toll gate review.', 'Not Started', '2026-08-04', '2026-08-04');
INSERT INTO tasks (pid, assgnd_id, title, description, status, created_at, updated_at) VALUES (1, 2, 'Optimize database queries for speed.', 'Needed for next toll gate review.', 'Not Started', '2026-08-04', '2026-08-04');
INSERT INTO tasks (pid, assgnd_id, title, description, status, created_at, updated_at) VALUES (1, 1, 'Debug production issues and errors.', 'Needed for next toll gate review.', 'Not Started', '2026-08-04', '2026-08-04');
INSERT INTO tasks (pid, assgnd_id, title, description, status, created_at, updated_at) VALUES (1, 1, 'Refactor legacy code for maintainability.', 'Needed for next toll gate review.', 'Not Started', '2026-08-04', '2026-08-04');
INSERT INTO tasks (pid, assgnd_id, title, description, status, created_at, updated_at) VALUES (1, 1, 'Implement authentication and authorization logic.', 'Needed for next toll gate review.', 'Not Started', '2026-08-04', '2026-08-04');
INSERT INTO tasks (pid, assgnd_id, title, description, status, created_at, updated_at) VALUES (1, 1, 'Conduct security vulnerability scans.', 'Needed for next toll gate review.', 'Not Started', '2026-08-04', '2026-08-04');
INSERT INTO tasks (pid, assgnd_id, title, description, status, created_at, updated_at) VALUES (1, 1, 'Manage version control (merging/branching).', 'Needed for next toll gate review.', 'Not Started', '2026-08-04', '2026-08-04');
INSERT INTO tasks (pid, assgnd_id, title, description, status, created_at, updated_at) VALUES (2, 1, 'Deploy builds to staging environments.', 'Needed for next toll gate review.', 'Not Started', '2026-08-04', '2026-08-04');
INSERT INTO tasks (pid, assgnd_id, title, description, status, created_at, updated_at) VALUES (1, 1, 'Monitor server logs and performance.', 'Needed for next toll gate review.', 'Not Started', '2026-08-04', '2026-08-04');
INSERT INTO tasks (pid, assgnd_id, title, description, status, created_at, updated_at) VALUES (1, 1, 'Update dependencies to newer versions.', 'Needed for next toll gate review.', 'Not Started', '2026-08-04', '2026-08-04');
INSERT INTO tasks (pid, assgnd_id, title, description, status, created_at, updated_at) VALUES (3, 3, 'Buy flowers.', 'Needed for anniversary.', 'Not Started', '2026-08-04', '2026-08-04');
INSERT INTO tasks (pid, assgnd_id, title, description, status, created_at, updated_at) VALUES (3, 3, 'Make dinner reservations.', 'Needed for anniversary.', 'Not Started', '2026-08-04', '2026-08-04');
INSERT INTO tasks (pid, assgnd_id, title, description, status, created_at, updated_at) VALUES (3, 3, 'Purchase Carnival cruise tickets.', 'Needed for anniversary.', 'Not Started', '2026-08-04', '2026-08-04');
COMMIT;
