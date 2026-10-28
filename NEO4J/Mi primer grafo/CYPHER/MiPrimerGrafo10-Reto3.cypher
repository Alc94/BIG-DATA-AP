// Reto 3: Ciudad equilibrada entre el norte y el sur.
// Idea: para cada ciudad, medir cuántos saltos hay de media hasta las ciudades
// del norte y hasta las del sur. La mejor es la que tiene las dos medias más parecidas.
// Esperado: Madrid (1.75 al norte, 1.75 al sur, diferencia 0.0)

// Paso 1: emparejar cada ciudad con todas las ciudades del norte o del sur
MATCH (origen:Ciudad), (destino:Ciudad)
WHERE origen <> destino
  AND destino.zona IN ['norte', 'sur']

// Paso 2: calcular el camino más corto (en saltos) entre cada pareja
MATCH camino = shortestPath((origen)-[:CARRETERA*]-(destino))

// Paso 3: media de saltos de cada ciudad hacia el norte y hacia el sur
WITH origen,
     avg(CASE WHEN destino.zona = 'norte' THEN length(camino) END) AS media_norte,
     avg(CASE WHEN destino.zona = 'sur'   THEN length(camino) END) AS media_sur

// Paso 4: mostrar el resultado, de más a menos equilibrada
RETURN origen.nombre AS ciudad,
       round(media_norte, 2) AS saltos_norte,
       round(media_sur, 2) AS saltos_sur,
       round(abs(media_norte - media_sur), 2) AS diferencia
ORDER BY diferencia
LIMIT 5;
