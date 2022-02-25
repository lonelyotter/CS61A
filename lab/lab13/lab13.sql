.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students where color = 'blue' and pet = 'dog';

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students where color = 'blue' and pet = 'dog';


CREATE TABLE matchmaker AS
  SELECT a.pet, a.song, a.color, b.color from students as a, students as b where a.pet = b.pet and a.song = b.song and a.time < b.time;


CREATE TABLE sevens AS
  SELECT students.seven from students, numbers where students.time = numbers.time and students.number = 7 and numbers.'7' = 'True';


CREATE TABLE favpets AS
  SELECT pet, count(*) as cnt from students group by pet order by cnt desc limit 10;


CREATE TABLE dog AS
  SELECT pet, count(*) from students where pet = 'dog' group by pet;


CREATE TABLE bluedog_agg AS
  SELECT song, count(*) as cnt from bluedog_songs group by song order by cnt desc;


CREATE TABLE instructor_obedience AS
  SELECT seven, instructor, count(*) as cnt from students where seven = '7' group by instructor order by instructor;

