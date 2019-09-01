CREATE EXTENSION mysql_fdw;

-- DATA SOURCE --
DROP SERVER IF EXISTS mysql_server CASCADE;
CREATE SERVER mysql_server
  FOREIGN DATA WRAPPER mysql_fdw
OPTIONS (host '192.168.1.18', port '3306');
-- ^-- CHANGE IP ADDRESS

CREATE USER MAPPING FOR bi
  SERVER mysql_server
OPTIONS (username 'root', password 'bi');

CREATE FOREIGN TABLE with_sth(
  id    int,
  value text)
SERVER mysql_server
OPTIONS (dbname 'frytki', table_name 'z');

-- BI --
CREATE SCHEMA bi;
CREATE USER testuser WITH ENCRYPTED PASSWORD 'testpass';
GRANT USAGE ON SCHEMA bi TO testuser;
GRANT SELECT ON ALL TABLES IN SCHEMA bi to testuser;
CREATE USER MAPPING FOR testuser
  SERVER mysql_server
OPTIONS (username 'root', password 'bi');

CREATE VIEW bi.z AS
  SELECT id, value, NOW() as now
  FROM with_sth;
