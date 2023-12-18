INSERT INTO client (cemail, cfirst_name, clast_name) VALUES ('client1@email.com', 'John', 'Doe');
INSERT INTO client (cemail, cfirst_name, clast_name) VALUES ('client2@email.com', 'Jane', 'Smith'); 
INSERT INTO client (cemail, cfirst_name, clast_name) VALUES ('client3@email.com', 'Bob', 'Johnson'); 
INSERT INTO client (cemail, cfirst_name, clast_name) VALUES ('client4@email.com', 'Alice', 'Williams');

INSERT INTO agent (aemail, afirst_name, alast_name) VALUES ('agent1@email.com', 'Michael', 'Jones');
INSERT INTO agent (aemail, afirst_name, alast_name) VALUES ('agent2@email.com', 'Emily', 'Brown');
INSERT INTO agent (aemail, afirst_name, alast_name) VALUES ('agent3@email.com', 'David', 'Miller');
INSERT INTO agent (aemail, afirst_name, alast_name) VALUES ('agent4@email.com', 'Olivia', 'Davis');

INSERT INTO department (dep_name, budget) VALUES ('Sales', 50000);
INSERT INTO department (dep_name, budget) VALUES ('Support', 75000);
INSERT INTO department (dep_name, budget) VALUES ('Development', 100000);
INSERT INTO department (dep_name, budget) VALUES ('Marketing', 60000);

INSERT INTO category (cat_name, cat_desc) VALUES ('Software', 'Software-related issues');
INSERT INTO category (cat_name, cat_desc) VALUES ('Hardware', 'Hardware-related problems');
INSERT INTO category (cat_name, cat_desc) VALUES ('Network', 'Network-related disruptions');
INSERT INTO category (cat_name, cat_desc) VALUES ('Login', 'Login and authentication issues');

INSERT INTO manager (memail, mfirst_name, mlast_name, accesslvl) VALUES ('manager1@email.com', 'Daniel', 'Taylor', 2);
INSERT INTO manager (memail, mfirst_name, mlast_name, accesslvl) VALUES ('manager2@email.com', 'Sophia', 'Clark', 1);
INSERT INTO manager (memail, mfirst_name, mlast_name, accesslvl) VALUES ('manager3@email.com', 'Matthew', 'Brown', 3);
INSERT INTO manager (memail, mfirst_name, mlast_name, accesslvl) VALUES ('manager4@email.com', 'Ava', 'Moore', 2);

INSERT INTO ticket (ticket_id, prio, tdesc, status, cemail) VALUES (1, 1, 'Software Issue', 'OPEN', 'client1@email.com');
INSERT INTO ticket (ticket_id, prio, tdesc, status, cemail) VALUES (2, 2, 'Hardware Malfunction', 'ACTIVE', 'client2@email.com');
INSERT INTO ticket (ticket_id, prio, tdesc, status, cemail) VALUES (3, 3, 'Network Outage', 'ACTIVE', 'client3@email.com');
INSERT INTO ticket (ticket_id, prio, tdesc, status, cemail) VALUES (4, 1, 'Login Problem', 'CLOSED', 'client3@email.com');

INSERT INTO works_on (aemail, ticket_id) VALUES ('agent1@email.com', 1);
INSERT INTO works_on (aemail, ticket_id) VALUES ('agent1@email.com', 2);
INSERT INTO works_on (aemail, ticket_id) VALUES ('agent2@email.com', 3);
INSERT INTO works_on (aemail, ticket_id) VALUES ('agent2@email.com', 4);

INSERT INTO works_for (aemail, dep_name) VALUES ('agent1@email.com', 'Sales');
INSERT INTO works_for (aemail, dep_name) VALUES ('agent2@email.com', 'Marketing');
INSERT INTO works_for (aemail, dep_name) VALUES ('agent3@email.com', 'Development');
INSERT INTO works_for (aemail, dep_name) VALUES ('agent4@email.com', 'Marketing');

INSERT INTO part_of (ticket_id, cat_name) VALUES (1, 'Software');
INSERT INTO part_of (ticket_id, cat_name) VALUES (2, 'Hardware');
INSERT INTO part_of (ticket_id, cat_name) VALUES (3, 'Network');
INSERT INTO part_of (ticket_id, cat_name) VALUES (4, 'Login');

INSERT INTO manages (memail, dep_name) VALUES ('manager1@email.com', 'Sales');
INSERT INTO manages (memail, dep_name) VALUES ('manager2@email.com', 'Support');
INSERT INTO manages (memail, dep_name) VALUES ('manager3@email.com', 'Development');
INSERT INTO manages (memail, dep_name) VALUES ('manager4@email.com', 'Marketing');