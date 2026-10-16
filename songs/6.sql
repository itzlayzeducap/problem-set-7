-- одна таблица один стобец и строка с средняя энергия чей артист Дрейк (нельзя по прямому аиди нужно найти его по имени)
SELECT AVG(songs.energy) FROM songs JOIN artists ON songs.artist_id = artists.id WHERE artists.name = 'Drake';
