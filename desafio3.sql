SELECT 
    Us.name AS usuario,
    COUNT(S.name) AS qt_de_musicas_ouvidas,
    ROUND(SUM(S.duration) / 60, 2) AS total_minutos
FROM
    SpotifyClone.users AS Us
        INNER JOIN
    SpotifyClone.song_history AS R ON R.user_id = Us.id
        INNER JOIN
    SpotifyClone.songs AS S ON R.song_id = S.id
GROUP BY usuario
ORDER BY usuario ASC;