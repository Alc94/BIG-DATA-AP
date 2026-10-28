/*
   Mi primer grafo: ciudades de España y carreteras que las unen.
   Transforma el mapa del enunciado en un grafo con 17 ciudades (nodos) y 23 carreteras (relaciones).
   El proceso se divide en tres fases: restricciones, nodos y relaciones.
*/

// Bloque 1: Restricciones e Índices

CREATE CONSTRAINT ciudad_nombre_unique IF NOT EXISTS FOR (c:Ciudad) REQUIRE c.nombre IS UNIQUE;
