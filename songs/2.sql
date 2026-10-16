CREATE TABLE IF NOT EXISTS songs_danceability (
    id   INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    danceability FLOAT NOT NULL
);

INSERT OR IGNORE INTO songs_danceability (id, name, danceability) SELECT id, name, danceability FROM songs;
SELECT * FROM songs_danceability ORDER BY danceability ASC;
