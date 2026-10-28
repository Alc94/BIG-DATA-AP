// Reto 1: Ciudad con mayor número de conexiones directas (grado del nodo)
// El patrón sin flecha cuenta carreteras entrantes y salientes.
// Esperado: Madrid (6), Bilbao (4), Valladolid (4), ...

MATCH (c:Ciudad)-[r:CARRETERA]-()
RETURN c.nombre AS ciudad, count(r) AS conexiones
ORDER BY conexiones DESC, ciudad
LIMIT 5;
