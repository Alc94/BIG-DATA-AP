/* 
   Conjunto de datos de los FinCEN Files (filtración de informes de actividades sospechosas de blanqueo de capitales reportados por bancos a la Red de Control de Delitos Financieros de EE. UU.).
   Transforma dos archivos CSV planos en un grafo de transacciones y entidades financieras. El proceso se divide en cuatro fases:
*/

// 1. Bloque 1: Restricciones e Índices

CREATE CONSTRAINT country_code_unique IF NOT EXISTS FOR (c:Country) REQUIRE c.code IS UNIQUE;
CREATE CONSTRAINT entity_id_unique IF NOT EXISTS FOR (e:Entity) REQUIRE e.id IS UNIQUE;
CREATE CONSTRAINT filing_id_unique IF NOT EXISTS FOR (f:Filing) REQUIRE f.id IS UNIQUE;
CREATE INDEX filing_icij_sar_id_index IF NOT EXISTS FOR (n:Filing) ON (n.icij_sar_id);
CREATE INDEX entity_name_index IF NOT EXISTS FOR (n:Entity) ON (n.name);
CREATE INDEX filing_begin_index IF NOT EXISTS FOR (n:Filing) ON (n.begin);
CREATE INDEX filing_end_index IF NOT EXISTS FOR (n:Filing) ON (n.end);
CREATE INDEX filing_amount_index IF NOT EXISTS FOR (n:Filing) ON (n.amount);
CREATE INDEX country_name_index IF NOT EXISTS FOR (n:Country) ON (n.name);