CREATE TABLE users
(
    id        uuid      NOT NULL PRIMARY KEY,
    name      text      NOT NULL UNIQUE
);
