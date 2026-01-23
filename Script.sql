
CREATE TABLE pelicula (
    id_pelicula SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    duracion INT NOT NULL,
    activo BOOLEAN DEFAULT TRUE 
);

CREATE TABLE sala_cine (
    id_sala SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    estado VARCHAR(50) DEFAULT 'Activa'
);

CREATE TABLE pelicula_salacine (
    id_pelicula_sala SERIAL PRIMARY KEY,
    id_pelicula INT REFERENCES pelicula(id_pelicula),
    id_sala INT REFERENCES sala_cine(id_sala),
    fecha_publicacion DATE NOT NULL,
    fecha_fin DATE NOT NULL
);

CREATE OR REPLACE FUNCTION obtener_estado_sala(nombre_sala VARCHAR) 
RETURNS VARCHAR AS $$
DECLARE
    cantidad INT;
    mensaje VARCHAR;
BEGIN
   
    SELECT COUNT(*) INTO cantidad
    FROM pelicula_salacine ps
    JOIN sala_cine s ON ps.id_sala = s.id_sala
    WHERE s.nombre = nombre_sala;

   
    IF cantidad < 3 THEN
        mensaje := 'Sala disponible';
    ELSIF cantidad >= 3 AND cantidad <= 5 THEN
        mensaje := 'Sala con ' || cantidad || ' películas asignadas';
    ELSE
        mensaje := 'Sala no disponible';
    END IF;

    RETURN mensaje;
END;
$$ LANGUAGE plpgsql;
