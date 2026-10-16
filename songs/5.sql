-- все песни с автором пост малон нельзя через прямое аиди нужно найти по имени аиди
SELECT songs.name FROM songs JOIN artists ON songs.artist_id = artists.id WHERE artists.name = 'Post Malone';
