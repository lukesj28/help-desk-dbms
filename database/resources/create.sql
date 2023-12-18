CREATE TABLE client ( cemail VARCHAR(50) DEFAULT 'example@email.com' PRIMARY KEY NOT NULL, cfirst_name VARCHAR2(20) DEFAULT 'Josuke' NOT NULL, clast_name VARCHAR2(20) DEFAULT 'Higashikata' NOT NULL );

CREATE TABLE agent ( aemail VARCHAR(50) DEFAULT 'example@email.com' PRIMARY KEY NOT NULL, afirst_name VARCHAR2(20) DEFAULT 'Josuke' NOT NULL, alast_name VARCHAR2(20) DEFAULT 'Higashikata' NOT NULL );

CREATE TABLE department ( dep_name VARCHAR2(50) DEFAULT 'New Department' PRIMARY KEY NOT NULL, budget NUMBER DEFAULT 0 NOT NULL );

CREATE TABLE manager ( memail VARCHAR(50) DEFAULT 'example@email.com' PRIMARY KEY NOT NULL, mfirst_name VARCHAR2(20) DEFAULT 'Josuke' NOT NULL, mlast_name VARCHAR2(20) DEFAULT 'Higashikata' NOT NULL, accesslvl NUMBER DEFAULT 0 NOT NULL );

CREATE TABLE category ( cat_name VARCHAR2(20) DEFAULT 'New Category' PRIMARY KEY NOT NULL, cat_desc VARCHAR2(50) DEFAULT 'Description' NOT NULL );

CREATE TABLE ticket ( ticket_id NUMBER DEFAULT 0 PRIMARY KEY NOT NULL, prio NUMBER DEFAULT '0' NOT NULL, tdesc VARCHAR2(50) DEFAULT 'Description' NOT NULL, status VARCHAR2(20) DEFAULT 'Open' NOT NULL, cemail VARCHAR2(50) DEFAULT 'example@email.com' NOT NULL, FOREIGN KEY (cemail) REFERENCES client(cemail) );

CREATE TABLE works_on ( aemail VARCHAR2(50) REFERENCES agent(aemail), ticket_id NUMBER REFERENCES ticket(ticket_id), PRIMARY KEY (aemail, ticket_id) );

CREATE TABLE works_for ( aemail VARCHAR2(50) REFERENCES agent(aemail), dep_name VARCHAR2(50) REFERENCES department(dep_name), PRIMARY KEY (dep_name, aemail) );

CREATE TABLE part_of ( ticket_id NUMBER REFERENCES ticket(ticket_id), cat_name VARCHAR2(20) REFERENCES category(cat_name), PRIMARY KEY (cat_name, ticket_id) );

CREATE TABLE manages ( memail VARCHAR2(50) REFERENCES manager(memail), dep_name VARCHAR2(50) REFERENCES department(dep_name), PRIMARY KEY (memail, dep_name) );