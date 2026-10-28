// Reto 3: Equilibrio norte / sur.
// Para cada ciudad se calcula la media de saltos hacia las ciudades del norte y hacia las del sur.
// Gana la que tiene la menor diferencia entre ambas (desempate: menor media total).
// Esperado: Madrid (1.75 norte / 1.75 sur / diferencia 0.0)

MATCH (a:Ciudad), (b:Ciudad)
WHERE a <> b AND b.zona IN ['norte', 'sur']
MATCH p = shortestPath((a)-[:CARRETERA*]-(b))
WITH a,
     avg(CASE WHEN b.zona = 'norte' THEN length(p) END) AS media_norte,
     avg(CASE WHEN b.zona = 'sur'   THEN length(p) END) AS media_sur
RETURN a.nombre AS ciudad,
       round(media_norte * 100) / 100 AS saltos_norte,
       round(media_sur   * 100) / 100 AS saltos_sur,
       round(abs(media_norte - media_sur) * 100) / 100 AS diferencia
ORDER BY diferencia ASC, (media_norte + media_sur) ASC
LIMIT 5;
