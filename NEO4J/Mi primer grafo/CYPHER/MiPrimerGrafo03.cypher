// Bloque 3: Creación de las relaciones (23 carreteras)
// Cada fila es [ciudad origen, ciudad destino, kilómetros].
// Se crea una sola dirección; las consultas usan el patrón sin flecha para recorrerlas en ambos sentidos.

UNWIND [
  ['Coruña',    'Vigo',       171],
  ['Coruña',    'Valladolid', 455],
  ['Vigo',      'Valladolid', 356],
  ['Oviedo',    'Bilbao',     304],
  ['Bilbao',    'Valladolid', 280],
  ['Bilbao',    'Madrid',     395],
  ['Bilbao',    'Zaragoza',   324],
  ['Valladolid','Madrid',     193],
  ['Zaragoza',  'Madrid',     325],
  ['Zaragoza',  'Barcelona',  296],
  ['Barcelona', 'Gerona',     100],
  ['Barcelona', 'Valencia',   349],
  ['Madrid',    'Badajoz',    403],
  ['Madrid',    'Albacete',   251],
  ['Madrid',    'Jaén',       335],
  ['Albacete',  'Valencia',   191],
  ['Albacete',  'Murcia',     150],
  ['Valencia',  'Murcia',     241],
  ['Jaén',      'Sevilla',    242],
  ['Jaén',      'Granada',     99],
  ['Sevilla',   'Granada',    256],
  ['Sevilla',   'Cádiz',      125],
  ['Granada',   'Murcia',     278]
] AS r
MATCH (a:Ciudad {nombre: r[0]}), (b:Ciudad {nombre: r[1]})
MERGE (a)-[:CARRETERA {km: r[2]}]->(b);
