create table letters
(letter char(1));

insert into letters
values ('a'), ('a'), ('a'), 
  ('b'), ('c'), ('d'), ('e'), ('f');

-- b is first
SELECT letter
FROM letters
ORDER BY 
    CASE 
        WHEN letter = 'b' THEN 0 
        ELSE 1 
    END,
    letter;

-- b is last
SELECT letter
FROM letters
ORDER BY 
    CASE 
        WHEN letter = 'b' THEN 1 
        ELSE 0
    END,
    letter;
