SELECT
    ar.name AS artista,
    al.name AS album
FROM
    SpotifyClone.artists AS ar
INNER JOIN
    SpotifyClone.albums AS al ON ar.id = al.artist_id
GROUP BY
    ar.id, al.name
ORDER BY
    ar.name ASC, al.name ASC
LIMIT 2 OFFSET 3;