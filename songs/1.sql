CREATE TABLE IF NOT EXISTS songs_names (
    id   INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

INSERT OR IGNORE INTO songs_names (id, name) SELECT id, name FROM songs;
SELECT * FROM songs_names;
