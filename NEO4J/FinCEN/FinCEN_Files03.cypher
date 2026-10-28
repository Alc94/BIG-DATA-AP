// Bloque 3: Carga del segundo CSV (Conexiones bancarias)
// https://raw.githubusercontent.com/jexp/fincen/main/download_bank_connections.csv

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/afbueno74/BigDataAplicado/main/download_bank_connections.csv" AS value
MATCH (f:Filing {icij_sar_id: value.icij_sar_id})
MERGE (filer:Entity {id: value.filer_org_name_id})
  ON CREATE SET filer.name = value.filer_org_name, 
                filer.location = point({latitude: toFloat(value.filer_org_lat), longitude: toFloat(value.filer_org_lng)})
MERGE (other:Entity {id: value.entity_b_id})
  ON CREATE SET other.name = value.entity_b, 
                other.location = point({latitude: toFloat(value.entity_b_lat), longitude: toFloat(value.entity_b_lng)}),
                other.country = value.entity_b_iso_code
MERGE (c:Country {code: value.entity_b_iso_code})
  ON CREATE SET c.name = value.entity_b_country
MERGE (f)<-[:FILED]-(filer)
MERGE (f)-[:CONCERNS]->(other)
MERGE (other)-[:COUNTRY]->(c);