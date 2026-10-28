MATCH (f:Filing)-[r]->(target)
RETURN f, r, target
LIMIT 25;