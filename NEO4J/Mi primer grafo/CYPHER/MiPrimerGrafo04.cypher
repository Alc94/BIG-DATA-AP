// Consulta 1: Mostrar todas las ciudades

MATCH (c:Ciudad)
RETURN c.nombre AS ciudad
ORDER BY ciudad;
