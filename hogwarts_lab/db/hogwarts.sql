DROP TABLE student_records;

CREATE TABLE student_records (
  id serial4 primary key,
  first_name varchar(255),
  last_name varchar(255),
  age int,
  house varchar(255)
);
