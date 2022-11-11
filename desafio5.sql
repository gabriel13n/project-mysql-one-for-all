SELECT
    so.name AS cancao,
    COUNT(sh.user_id) AS reproducoes
FROM
    SpotifyClone.songs AS so
INNER JOIN
    SpotifyClone.song_history AS sh ON so.id = sh.song_id
GROUP BY
    sh.song_id
ORDER BY
    COUNT(sh.user_id) DESC, so.name ASC
LIMIT 2;