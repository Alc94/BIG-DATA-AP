// Reto 2: Cercanía. Número medio de saltos desde cada ciudad hasta el resto.
// shortestPath cuenta saltos (nº de carreteras), no kilómetros.
// Cuanto menor es la media, más central es la ciudad.
// Esperado: Madrid 1.75, Bilbao 2.19, Albacete / Jaén / Zaragoza 2.25, ...

MATCH (a:Ciudad), (b:Ciudad)
WHERE a <> b
MATCH p = shortestPath((a)-[:CARRETERA*]-(b))
RETURN a.nombre AS ciudad,
       round(avg(length(p)) * 100) / 100 AS saltos_medios
ORDER BY saltos_medios ASC, ciudad;
