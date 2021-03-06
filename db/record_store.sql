DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists (
id SERIAL8 PRIMARY KEY,
name VARCHAR(255),
spotify VARCHAR(255)
);

CREATE TABLE albums (
id SERIAL8 PRIMARY KEY,
title VARCHAR(255),
artist_id INT8 REFERENCES artists(id) ON DELETE CASCADE,
stock INT,
genre VARCHAR(255),
year INT,
buy_price INT,
sell_price INT,
artwork VARCHAR(255),
spotify VARCHAR(255)
);