CREATE TABLE pelicula (

	id_pelicula SERIAL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	duracion INT NOT NULL,
	activo BOOLEAN DEFAULT TRUE
)

CREATE TABLE sala_cine(

	id_sala SERIAL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	estado VARCHAR(50) DEFAULT 'Activa'

)
	
CREATE TABLE pelicula_salacine (

	id_pelicula_sala SERIAL PRIMARY KEY,
	id_pelicula INT REFERENCES pelicula(id_pelicula),
	id_sala INT REFERENCES sala_cine(id_sala),
	fecha_publicacion DATE NOT NULL,
	fecha_fin DATE NOT NULL
	
)

CREATE OR REPLACE FUNCTION obtener_estado_sala(nombre_sala VARCHAR) 
RETURNS VARCHAR AS $$

    SELECT CASE 
        WHEN COUNT(*) < 3 THEN 'Sala disponible'
        WHEN COUNT(*) <= 5 THEN 'Sala con ' || COUNT(*) || ' películas asignadas'
        ELSE 'Sala no disponible'
    END
    FROM pelicula_salacine ps
    JOIN sala_cine s ON ps.id_sala = s.id_sala
    WHERE s.nombre = nombre_sala;

$$ LANGUAGE sql;



SELECT setval('pelicula_id_pelicula_seq', (SELECT MAX(id_pelicula) FROM pelicula));
SELECT setval('sala_cine_id_sala_seq', (SELECT MAX(id_sala) FROM sala_cine));
SELECT setval('pelicula_salacine_id_pelicula_sala_seq', (SELECT MAX(id_pelicula_sala) FROM pelicula_salacine));
