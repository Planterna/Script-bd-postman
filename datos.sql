INSERT INTO pelicula ("id_pelicula", "nombre", "duracion", "activo") VALUES
(1, 'DOM', 123, true),
(2, 'DOM II', 230, true),
(3, 'Mario Kart', 100, true),
(4, 'The Last', 180, true),
(5, 'El Rey Leon', 150, true),
(6, 'Tsunami', 120, true);

INSERT INTO sala_cine ("id_sala", "nombre", "estado") VALUES
(1, 'Sala 2D', 'Activa'),
(2, 'Sala 3D', 'Activa'),
(3, 'Sala 2.5D', 'Activa');

INSERT INTO pelicula_salacine (id_pelicula, id_sala, fecha_publicacion, fecha_fin) VALUES
(1, 1, 1, '2026-01-01', '2026-04-01'),
(2, 2, 1, '2026-02-01', '2026-03-12'),
(3, 3, 2, '2026-01-01', '2026-02-02'),
(4, 4, 3, '2026-01-03', '2026-03-04');

SELECT obtener_estado_sala('Sala IMAX');
