-- песни у которых danceability energy valence > 0.75
-- таблица с названиями песен и данными которые > 0.75 выше
SELECT name, danceability, energy, valence FROM songs WHERE danceability > 0.75 AND energy > 0.75 AND valence > 0.75;
