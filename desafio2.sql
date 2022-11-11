SELECT 
    COUNT(DISTINCT so.id) AS 'cancoes',
    COUNT(DISTINCT ar.id) AS 'artistas',
    COUNT(DISTINCT al.id) AS 'albuns'
FROM
    SpotifyClone.songs AS so,
    SpotifyClone.artists AS ar,
    SpotifyClone.albums AS al;