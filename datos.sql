INSERT INTO pelicula (id_pelicula, nombre, duracion, activo) VALUES
(1, 'Avatar: The Way of Water', 192, true),
(2, 'Oppenheimer', 180, true),
(3, 'Barbie', 114, true),
(4, 'Dune: Part Two', 166, true),
(5, 'Spider-Man: Across the Spider-Verse', 140, true),
(6, 'The Batman', 176, true),
(7, 'Super Mario Bros', 92, true),
(8, 'Guardians of the Galaxy Vol. 3', 150, true),
(9, 'John Wick 4', 169, true),
(10, 'Mission: Impossible 7', 163, true),
(11, 'Toy Story 5', 100, true),
(12, 'Frozen 3', 105, true);

INSERT INTO sala_cine (id_sala, nombre, estado) VALUES
(1, 'Sala IMAX', 'Activa'),
(2, 'Sala VIP', 'Activa'),
(3, 'Sala Kids', 'Mantenimiento');

INSERT INTO pelicula_salacine (id_pelicula, id_sala, fecha_publicacion, fecha_fin) VALUES
-- Sala 1: 6 películas (Debe dar "Sala no disponible")
(1, 1, '2024-02-01', '2024-03-01'),
(2, 1, '2024-02-05', '2024-03-05'),
(3, 1, '2024-02-10', '2024-03-10'),
(4, 1, '2024-02-15', '2024-03-15'),
(5, 1, '2024-02-20', '2024-03-20'),
(6, 1, '2024-02-25', '2024-03-25'),
-- Sala 2: 4 películas (Debe dar "Sala con 4 películas asignadas")
(7, 2, '2024-03-01', '2024-04-01'),
(8, 2, '2024-03-05', '2024-04-05'),
(9, 2, '2024-03-10', '2024-04-10'),
(10, 2, '2024-03-15', '2024-04-15'),
-- Sala 3: 2 películas (Debe dar "Sala disponible")
(11, 3, '2024-04-01', '2024-05-01'),
(12, 3, '2024-04-05', '2024-05-05');

SELECT setval('pelicula_id_pelicula_seq', (SELECT MAX(id_pelicula) FROM pelicula));
SELECT setval('sala_cine_id_sala_seq', (SELECT MAX(id_sala) FROM sala_cine));
