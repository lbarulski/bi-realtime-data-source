CREATE DATABASE frytki;
USE frytki;
CREATE TABLE z (
  id    INT AUTO_INCREMENT PRIMARY KEY,
  value TEXT
);
INSERT INTO z (value)
VALUES ("ketchup");

ALTER TABLE z
  ADD COLUMN amount INT NOT NULL;