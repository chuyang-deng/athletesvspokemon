-- Athletes (name, DOB, height, weight, gender, sports, event)
-- Medal (name, DOB, gold, silver, bronze)
-- Activities (Sports, type)
-- Pokemon (name, HP, total, speed, defense, attack, gender, type, image_NO)

-- Who is the best pokemon?
SELECT p1.name
FROM Pokemon p1
WHERE p1.total >= ALL (SELECT p2.total
					   FROM Pokemon p2)

SELECT p1.name
FROM Pokemon p1
WHERE p1.type = "water"
AND p1.total >= ALL (SELECT p2.total
					 FROM Pokemon p2)

-- What will swimmers do in Pokemon?
SELECT type
FROM Activities
WHERE Sports = "swimming"

--use the type above, select some sample pokemon. Pictures will be linked by image_NO
--using AWS S3, more description will be provided by noSQL database and a json file
--which has not been set up yet
Select p.name
from Pokemon p
where p.type = "above type" AND ROWNUM < 10


-- who is the best athletes
Select m.name
From Medal m
where 5*m.gold + 3*m.silver + m.bronze >= ALL ( select 5*m2.gold + 3*m2.silver + m2.bronze
					from Medal m2)
					
---- in certain category
Select a.name
From Althetes a inner join Medal m on a.name = m.name AND a.DOB = m.DOB
where a.sports = "swimming" AND 5*m.gold + 3*m.silver + m.bronze >= ALL ( select 5*m2.gold + 3*m2.silver + m2.bronze
					from Medal m2)
					
-- Given two atheletes name, show which one would win
Select 5*m.gold + 3*m.silver + m.bronze
From Medal m
where where m.name = "name1 or name2"  
-- then in NodeJS, compare the number and print out the name with the higher number
-- we will then use our matching algorithm to select two pokemon for each athelets
--then
Select p.total
from Pokemon p
where p.name = "above name"
-- then in NodeJS, compare two number and print out the name with the higher total


