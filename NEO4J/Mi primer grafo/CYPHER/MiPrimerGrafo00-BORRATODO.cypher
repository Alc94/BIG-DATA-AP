MATCH (c:Ciudad) DETACH DELETE c;

DROP CONSTRAINT ciudad_nombre_unique IF EXISTS;
