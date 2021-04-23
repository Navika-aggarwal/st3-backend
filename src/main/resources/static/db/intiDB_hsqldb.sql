DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS user_records;
DROP TABLE IF EXISTS persistent_logins;
DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS global_seq;

CREATE SEQUENCE GLOBAL_SEQ AS INTEGER START WITH 100000;

CREATE TABLE users
(
  id          INTEGER GENERATED BY DEFAULT AS SEQUENCE GLOBAL_SEQ PRIMARY KEY,
  name        VARCHAR(255) NOT NULL,
  surName     VARCHAR(255) NOT NULL,
  phonenumber VARCHAR(255) NOT NULL,
  homeNumber  VARCHAR(255),
  address     VARCHAR(255),
  email       VARCHAR(255),
  password    VARCHAR(255) NOT NULL
);
CREATE UNIQUE INDEX users_unique_phonenumber_idx
  ON users (phonenumber);

CREATE TABLE user_roles
(
  user_id INTEGER NOT NULL,
  role    VARCHAR(255),
  CONSTRAINT user_roles_idx UNIQUE (user_id, role),
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE persistent_logins (
  username  VARCHAR(64) NOT NULL,
  series    VARCHAR(64) PRIMARY KEY,
  token     VARCHAR(64) NOT NULL,
  last_used TIMESTAMP   NOT NULL
);

CREATE TABLE user_records
(
  id          INTEGER GENERATED BY DEFAULT AS SEQUENCE GLOBAL_SEQ PRIMARY KEY,
  name        VARCHAR(255) NOT NULL,
  surName     VARCHAR(255) NOT NULL,
  phonenumber VARCHAR(255) NOT NULL,
  email       VARCHAR(255),
  user_id     INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);
CREATE INDEX user_records_user_idx
  ON user_records (user_id);