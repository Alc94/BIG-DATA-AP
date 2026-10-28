// Consulta 3: Listar todas las carreteras con su distancia

MATCH (a:Ciudad)-[r:CARRETERA]->(b:Ciudad)
RETURN a.nombre AS origen, b.nombre AS destino, r.km AS km
ORDER BY km DESC;
