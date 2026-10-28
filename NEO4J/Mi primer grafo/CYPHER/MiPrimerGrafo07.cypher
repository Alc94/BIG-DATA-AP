// Consulta 4: Contar cuántas carreteras hay en total (esperado: 23)

MATCH ()-[r:CARRETERA]->()
RETURN count(r) AS total_carreteras;
