// Bloque 2: Carga del primer CSV (Transacciones / Filings)
// https://raw.githubusercontent.com/jexp/fincen/main/download_transactions_map.csv

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/afbueno74/BigDataAplicado/main/download_transactions_map.csv" AS value
MERGE (s:Filing {id: value.id})
SET s += value;