SELECT
    us.name AS usuario,
    IF (MAX(YEAR(sh.reproduction_date)) >= '2021', "Usuário ativo", "Usuário inativo" ) AS status_usuario
FROM
    SpotifyClone.users AS us
INNER JOIN
    SpotifyClone.song_history AS sh ON us.id = sh.user_id
GROUP BY
    us.name
ORDER BY
    us.name;