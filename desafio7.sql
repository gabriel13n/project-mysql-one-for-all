SELECT 
    MIN(ar.name) AS artista,
    (al.name) AS album,
    COUNT(fo.artist_id) AS seguidores
FROM
    SpotifyClone.artists AS ar
        INNER JOIN
    SpotifyClone.albums AS al ON ar.id = al.artist_id
        INNER JOIN
    SpotifyClone.followers AS fo ON ar.id = fo.artist_id
GROUP BY album
ORDER BY seguidores DESC , artista ASC , album ASC;