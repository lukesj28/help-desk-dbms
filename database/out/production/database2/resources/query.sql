SELECT DISTINCT aemail FROM agent;

SELECT status, COUNT(ticket_id) AS num_tickets FROM ticket GROUP BY status;

SELECT agent.alast_name, agent.afirst_name, agent.aemail, COUNT(ticket.ticket_id) AS num_completed_tickets FROM agent JOIN works_on ON agent.aemail = works_on.aemail JOIN ticket ON works_on.ticket_id = ticket.ticket_id WHERE ticket.status = 'CLOSED' GROUP BY agent.alast_name, agent.afirst_name, agent.aemail ORDER BY agent.alast_name;

SELECT mlast_name, mfirst_name,  MAX(accesslvl) AS highest_accesslvl FROM manager group by mlast_name, mfirst_name;

SELECT ticket.*, category.* FROM ticket JOIN part_of ON ticket.ticket_id = part_of.ticket_id JOIN category ON part_of.cat_name = category.cat_name;

SELECT DISTINCT alast_name FROM agent;

SELECT DISTINCT dep_name, budget FROM department ORDER BY budget DESC;

SELECT * FROM ticket ORDER BY prio DESC;

CREATE VIEW agent_workload AS SELECT agent.alast_name, agent.afirst_name, agent.aemail, COUNT(ticket.ticket_id) AS num_active_tickets FROM works_on JOIN agent ON works_on.aemail = agent.aemail JOIN ticket ON works_on.ticket_id = ticket.ticket_id WHERE ticket.status = 'ACTIVE' group by agent.alast_name, agent.afirst_name, agent.aemail ORDER BY agent.alast_name;

CREATE VIEW client_ticket_history AS SELECT client.cemail, ticket.ticket_id FROM ticket JOIN client ON ticket.cemail = client.cemail GROUP BY client.cemail, ticket.ticket_id;

SELECT client.cemail, client.cfirst_name, client.clast_name, COUNT(ticket.ticket_id) AS num_created_tickets FROM client JOIN ticket ON client.cemail = ticket.cemail group by client.cemail, client.cfirst_name, client.clast_name;

SELECT department.dep_name, COUNT(works_for.aemail) AS num_agents FROM department JOIN works_for ON department.dep_name = works_for.dep_name group by department.dep_name;

SELECT ticket.*, agent.afirst_name, agent.alast_name FROM ticket JOIN works_on ON ticket.ticket_id = works_on.ticket_id JOIN agent ON works_on.aemail = agent.aemail;