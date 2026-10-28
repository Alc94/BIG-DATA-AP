MATCH (f:Filing)
SET f.transactions = toInteger(f.number_transactions),
    f.amount = toFloat(f.amount_transactions),
    f.end = date(datetime({epochSeconds: coalesce(apoc.date.parse(f.end_date, "s", "MMM dd, yyyy"), 0)})),
    f.begin = date(datetime({epochSeconds: coalesce(apoc.date.parse(f.begin_date, "s", "MMM dd, yyyy"), 0)}))

MERGE (ben:Entity {id: f.beneficiary_bank_id})
  ON CREATE SET ben.name = f.beneficiary_bank, 
                ben.location = point({latitude: toFloat(f.beneficiary_lat), longitude: toFloat(f.beneficiary_lng)})
MERGE (cben:Country {code: f.beneficiary_iso})
MERGE (ben)-[:COUNTRY]->(cben)
MERGE (f)-[:BENEFITS]->(ben)

MERGE (filer:Entity {id: f.filer_org_name_id})
  ON CREATE SET filer.name = f.filer_org_name, 
                filer.location = point({latitude: toFloat(f.filer_org_lat), longitude: toFloat(f.filer_org_lng)})
MERGE (f)<-[:FILED]-(filer)

MERGE (org:Entity {id: f.originator_bank_id})
  ON CREATE SET org.name = f.originator_bank, 
                org.location = point({latitude: toFloat(f.origin_lat), longitude: toFloat(f.origin_lng)})
MERGE (corg:Country {code: f.originator_iso})
MERGE (org)-[:COUNTRY]->(corg)
MERGE (f)-[:ORIGINATOR]->(org);