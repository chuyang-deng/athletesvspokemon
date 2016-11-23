-- Athletes (name, DOB, height, weight, gender, sports, event)
-- Medal (name, DOB, gold, silver, bronze)
-- Activities (Sports, type)
-- Pokemon (name, HP, total, speed, defense, attack, gender, type, image_NO)

-- the number listed below match with the number of questions on the first milestone

--1. Who/What is the Usain Bolt in Pokémon? 
For this one, we might change our matching algorithm a bit so we will leave this query
to be finished by the next milestone

var sport = SELECT sports FROM Athletes WHERE name = "Usain Bolt"; -- getting the sports of the athletes

var type = SELECT category FROM Pokemon WHERE sport = sport; -- getting the counterpart Pokemon type

var athletesRank = SELECT name, medals, ROWNUM FROM sport+View s INNER JOIN Medal m ON s.name = m.name ORDER BY m.medals; -- getting athletes medals

var pokemonRank = SELECT name, total, ROWNUM FROM type+View ORDER BY total; -- getting Pokemon totals

var athletesRows = SELECT count(*) FROM athletesRank; -- total rows of athletes

var pokemonRows = SELECT count(*) FROM pokemonRank; -- total rows of pokemon

var atheletsRankNo = SELECT ROWNUM FROM athletesRank WHERE name = "Usain Bolt"; -- usain bolts actual rank in his sport

var pokemonRankNo = (int) atheletsRankNo * ( (float) pokemonRows / athletesRows); -- counterpart rank in pokemon;

var result = SELECT name FROM pokemonRank WHERE ROWNUM = pokemonRankNo -- getting the result (pokemon's name)



--2. Who is the best pokemon?
SELECT p1.name
FROM Pokemon p1
WHERE p1.total >= ALL (SELECT p2.total
					   FROM Pokemon p2)

SELECT p1.name
FROM Pokemon p1
WHERE p1.type = "water"
AND p1.total >= ALL (SELECT p2.total
					 FROM Pokemon p2)

--3. What will swimmers do in Pokemon?
SELECT type
FROM Activities
WHERE Sports = "swimming"

--use the type above, select some sample pokemon. Pictures will be linked by image_NO
--using AWS S3, more description will be provided by noSQL database and a json file
--which has not been set up yet
Select p.name
from Pokemon p
where p.type = "above type" AND ROWNUM < 10


--2. who is the best athletes
Select m.name
From Medal m
where 5*m.gold + 3*m.silver + m.bronze >= ALL ( select 5*m2.gold + 3*m2.silver + m2.bronze
			 from Medal m2)
					
---- in certain category
Select a.name
From Athletes a inner join Medal m on a.name = m.name AND a.DOB = m.DOB
where a.sports = 'Swimming' AND 5*m.gold + 3*m.silver + m.bronze >= ALL ( select 5*m2.gold + 3*m2.silver + m2.bronze
			 from Athletes a2 inner join Medal m2 on a2.name = m2.name AND a2.DOB = m2.DOB
					where a2.sports = 'Swimming')
					
--4. Given two atheletes name, show which one would win
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

--5. Who are the first/second/... generations of Olympic athletes (like different generations of Pokémon game)?
We decided to not include this question in our project, because we will not include all 1896 - 2016 athelets, and 
without some old athelets, this question is kind of meaningless (and also a little boring)

--6. Who is the Pikachu/Squirtle/Charmander among all Olympic athletes? (Popularity, based on news coverage/twitter feeds...)
For this question, we will write some web crawler to get data from google search. (we will see the number of time a name has been
searched on GOOGLE and use that information to create a table of "popularity"). Then we will be able to find out the most popular
pokemon and the most popular athletes.

--7. Please give a detailed description about an athlete or about a Pokémon (year, birthday, height, picture, other personal information...)
This will be done by using the noSQL part of our database, which we are having trouble setting up... But we have upload all image for 
all pokemon into our AWS S3, which should provide enough information for a pokemon (people need to see the picture to 
know what a pokemon is).
