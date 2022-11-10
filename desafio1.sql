CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plans (
    id INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    price FLOAT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE SpotifyClone.users (
    id INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    plan_id INT NOT NULL,
    signature_date DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (plan_id)
        REFERENCES SpotifyClone.plans (id)
);

CREATE TABLE SpotifyClone.artists (
	id INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE SpotifyClone.albums (
    id INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    release_year INT NOT NULL,
    artist_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (artist_id)
        REFERENCES artists (id)
);

CREATE TABLE SpotifyClone.songs (
    id INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    duration INT NOT NULL,
    artist_id INT NOT NULL,
    album_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (artist_id)
        REFERENCES artists (id),
    FOREIGN KEY (album_id)
        REFERENCES albums (id)
);

CREATE TABLE SpotifyClone.song_history (
	user_id           INT  NOT NULL,
    song_id           INT  NOT NULL,
    reproduction_date DATE NOT NULL,

    PRIMARY KEY (user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (song_id) REFERENCES songs (id)
);

CREATE TABLE SpotifyClone.followers (
    artist_id INT NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY (artist_id , user_id),
    FOREIGN KEY (artist_id)
        REFERENCES artists (id),
    FOREIGN KEY (user_id)
        REFERENCES users (id)
);


INSERT INTO SpotifyClone.plans(name, price)
VALUES ('gratuito', 0),
       ('familiar', 7.99),
       ('universitário', 5.99),
       ('pessoal', 6.99);

INSERT INTO SpotifyClone.users(name, age, plan_id, signature_date)
VALUES ('Barbara Liskov', 82, 1, DATE('2019-10-20')),
       ('Robert Cecil Martin', 58, 1, DATE('2017-01-06')),
       ('Ada Lovelace', 37, 2, DATE('2017-12-30')),
       ('Martin Fowler', 46, 2, DATE('2017-01-17')),
       ('Sandi Metz', 58, 2, DATE('2018-04-29')),
       ('Paulo Freire', 19, 3, DATE('2018-02-14')),
       ('Bell Hooks', 26, 3, DATE('2018-01-05')),
       ('Christopher Alexander', 85, 4, DATE('2019-06-05')),
       ('Judith Butler', 45, 4, DATE('2020-05-13')),
       ('Jorge Amado', 58, 4, DATE('2017-02-17'));

INSERT INTO SpotifyClone.artists (name)
VALUES ('Beyoncé'),
       ('Queen'),
       ('Elis Regina'),
       ('Baco Exu do Blues'),
       ('Blind Guardian'),
       ('Nina Simone');

INSERT INTO SpotifyClone.albums (name, release_year, artist_id)
VALUES ('Renaissance', 2022, 1),
       ('Jazz', 1978, 2),
       ('Hot Space', 1982, 2),
       ('Falso Brilhante', 1998, 3),
       ('Vento de Maio', 2001, 3),
       ('QVVJFA?', 2003, 4),
       ('Somewhere Far Beyond', 2007, 5),
       ('I Put A Spell On You', 2012, 6);

INSERT INTO SpotifyClone.songs (name, duration, artist_id, album_id)
VALUES ('BREAK MY SOUL', 279, 1, 1),
       ('VIRGO’S GROOVE', 369, 1, 1),
       ('ALIEN SUPERSTAR', 116, 1, 1),
       ('Don’t Stop Me Now', 203, 2, 2),
       ('Under Pressure', 152, 2, 3),
       ('Como Nossos Pais', 105, 3, 4),
       ('O Medo de Amar é o Medo de Ser Livre', 207, 3, 5),
       ('Samba em Paris', 267, 4, 6),
       ('The Bard’s Song', 244, 5, 7),
       ('Feeling Good', 100, 6, 8);

INSERT INTO SpotifyClone.song_history (user_id, song_id, reproduction_date)
VALUES (1, 8, DATE('2022-02-28 10:45:55')),
       (1, 2, DATE('2020-05-02 05:30:35')),
       (1, 10, DATE('2020-03-06 11:22:33')),
       (2, 10, DATE('2022-08-05 08:05:17')),
       (2, 7, DATE('2020-01-02 07:40:33')),
       (3, 10, DATE('2020-11-13 16:55:13')),
       (3, 2, DATE('2020-12-05 18:38:30')),
       (4, 8, DATE('2021-08-15 17:10:10')),
       (5, 8, DATE('2022-01-09 01:44:33')),
       (5, 5, DATE('2020-08-06 15:23:43')),
       (6, 7, DATE('2017-01-24 00:31:17')),
       (6, 1, DATE('2017-10-12 12:35:20')),
       (7, 4, DATE('2011-12-15 22:30:49')),
       (8, 4, DATE('2012-03-17 14:56:41')),
       (9, 9, DATE('2022-02-24 21:14:22')),
       (10, 3, DATE('2015-12-13 08:30:22'));

INSERT INTO SpotifyClone.followers (user_id, artist_id)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (2, 1),
       (2, 3),
       (3, 2),
       (4, 4),
       (5, 5),
       (5, 6),
       (6, 6),
       (6, 1),
       (7, 6),
       (9, 3),
       (10, 2);