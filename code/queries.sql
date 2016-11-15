-- Athletes (name, DOB, height, weight, gender, sports, event)
-- Medal (name, DOB, gold, silver, bronze)
-- Activities (Sports, type)
-- Pokemon (name, HP, total, speed, defense, attack, gender, type)

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
SELECT Categories
FROM Activities
WHERE Sports = "swimming"

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
