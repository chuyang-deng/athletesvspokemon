-- Athlets (name, DOB, height, weight, gender, sports)
-- Medal (name, DOB, gold, silver, bronze)
-- Activities (Sports, Categories)
-- Pokemon (name, HP, total, speed, defense, attack, gender, category)

-- Who is the best pokemon?
SELECT p1.name
FROM Pokemon p1
WHERE p1.total >= ALL (SELECT p2.total
					   FROM Pokemon p2)

SELECT p1.name
FROM Pokemon p1
WHERE p1.category = "water"
AND p1.total >= ALL (SELECT p2.total
					 FROM Pokemon p2)

-- What will swimmers do in Pokemon?
SELECT Categories
FROM Activities
WHERE Sports = "swimming"

Select a.name
From Athletes a inner join Medal m on a.name = m.name AND a.DOB = m.DOB
where m.gold + m.silver + m.bronze >= ALL ( select m2.gold + m2.silver + m2.bronze
					from Medal m2)
