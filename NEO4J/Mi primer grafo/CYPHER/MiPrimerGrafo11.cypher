// Visualizar el grafo completo

MATCH (a:Ciudad)-[r:CARRETERA]->(b:Ciudad)
RETURN a, r, b;
