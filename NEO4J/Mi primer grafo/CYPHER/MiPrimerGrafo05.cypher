// Consulta 2: Contar cuántas ciudades hay (esperado: 17)

MATCH (c:Ciudad)
RETURN count(c) AS total_ciudades;
