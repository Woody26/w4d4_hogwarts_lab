DROP TABLE IF EXISTS student_records;
DROP TABLE IF EXISTS houses;

CREATE TABLE houses (
  id SERIAL8 PRIMARY KEY,
  house_name varchar(255),
  house_logo varchar(255)
);

CREATE TABLE student_records (
  id SERIAL8 primary key,
  first_name varchar(255),
  last_name varchar(255),
  age int,
  -- house varchar(255),
  house INT8 REFERENCES houses(id)
);
