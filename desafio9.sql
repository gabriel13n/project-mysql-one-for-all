-- barbara_id = 1
SELECT
    COUNT(sh.user_id) AS quantidade_musicas_no_historico
FROM
    SpotifyClone.song_history AS sh
WHERE
    user_id = 1;
