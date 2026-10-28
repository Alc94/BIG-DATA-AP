// Bloque 2: Creación de los nodos (17 ciudades)
// La propiedad "zona" solo se utiliza en el Reto 3 (norte / centro / sur)

UNWIND [
  {nombre: 'Coruña',     zona: 'norte'},
  {nombre: 'Vigo',       zona: 'norte'},
  {nombre: 'Oviedo',     zona: 'norte'},
  {nombre: 'Bilbao',     zona: 'norte'},
  {nombre: 'Valladolid', zona: 'norte'},
  {nombre: 'Zaragoza',   zona: 'norte'},
  {nombre: 'Barcelona',  zona: 'norte'},
  {nombre: 'Gerona',     zona: 'norte'},
  {nombre: 'Madrid',     zona: 'centro'},
  {nombre: 'Badajoz',    zona: 'sur'},
  {nombre: 'Albacete',   zona: 'sur'},
  {nombre: 'Valencia',   zona: 'sur'},
  {nombre: 'Murcia',     zona: 'sur'},
  {nombre: 'Jaén',       zona: 'sur'},
  {nombre: 'Granada',    zona: 'sur'},
  {nombre: 'Sevilla',    zona: 'sur'},
  {nombre: 'Cádiz',      zona: 'sur'}
] AS c
MERGE (:Ciudad {nombre: c.nombre, zona: c.zona});
