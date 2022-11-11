SELECT 
    so.name AS nome, COUNT(sh.song_id) AS reproducoes
FROM
    SpotifyClone.song_history AS sh
        INNER JOIN
    SpotifyClone.songs AS so ON so.id = sh.song_id
        INNER JOIN
    SpotifyClone.users AS us ON sh.user_id = us.id
        INNER JOIN
    SpotifyClone.plans AS pl ON us.plan_id = pl.id
WHERE
    pl.name IN ('gratuito' , 'pessoal')
GROUP BY nome
ORDER BY nome ASC;
--test