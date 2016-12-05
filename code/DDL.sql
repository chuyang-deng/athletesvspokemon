-- Pokemon Relation
create table Pokemon (
	name varchar(255) not null,
	type varchar(255),
	total Integer,
	hp Integer,
	attack Integer,
	defense Integer,
	sp_attack Integer,
	sp_defense Integer,
	speed Integer,
	generation Integer,
	image_no Integer,
	primary key (name)
);


create table PokemonFull (
	image_no Integer,
	name varchar(50) not null,
	type1 varchar(50),
	type2 varchar(50),
	total Integer,
	hp Integer,
	attack Integer,
	defense Integer,
	sp_attack Integer,
	sp_defense Integer,
	speed Integer,
	generation Integer,
	legendary boolean,
	primary key (name)
);

-- Athletes Relation
create table Athletes (
	name varchar(255) not null,
	country varchar(10),
	gender varchar(10),
	sport varchar(255),
	discipline varchar(255),
	event varchar(255),
	year varchar(100),
	primary key (name),
	foreign key (sport) references Activities (sport)
);
#name,Country,Gender,Sport,Discipline,Event,Year

-- Activities Relation
create table Activities (
	sport varchar(50),
	type varchar(50),
	primary key (sport)
);

-- Medal Relation
create table Medal (
	name varchar(50) not null,
	gold integer,
	silver integer,
	bronze integer,
	score integer,
	primary key (name),
	foreign key (name) references Athletes(name)
);


/****************************
			VIEWS
*****************************/

CREATE VIEW AquaticsView AS Select * From Athletes Where sport = 'Aquatics';

CREATE VIEW ArcheryView AS Select * From Athletes Where sport = 'Archery';

CREATE VIEW AthleticsView AS Select * From Athletes Where sport = 'Athletics';

CREATE VIEW BadmintonView AS Select * From Athletes Where sport = 'Badminton';

CREATE VIEW BaseballView AS Select * From Athletes Where sport = 'Baseball';

CREATE VIEW BasketballView AS Select * From Athletes Where sport = 'Basketball';

CREATE VIEW BoxingView AS Select * From Athletes Where sport = 'Boxing';

CREATE VIEW CanoeView AS Select * From Athletes Where sport = 'Canoe';

CREATE VIEW CyclingView AS Select * From Athletes Where sport = 'Cycling';

CREATE VIEW EquestrianView AS Select * From Athletes Where sport = 'Equestrian';

CREATE VIEW FencingView AS Select * From Athletes Where sport = 'Fencing';

CREATE VIEW FootballView AS Select * From Athletes Where sport = 'Football';

CREATE VIEW GymnasticsView AS Select * From Athletes Where sport = 'Gymnastics';

CREATE VIEW HandballView AS Select * From Athletes Where sport = 'Handball';

CREATE VIEW HockeyView AS Select * From Athletes Where sport = 'Hockey';

CREATE VIEW JudoView AS Select * From Athletes Where sport = 'Judo';

CREATE VIEW ModernpentathlonView AS Select * From Athletes Where sport = 'Modern pentathlon';

CREATE VIEW RowingView AS Select * From Athletes Where sport = 'Rowing';

CREATE VIEW SailingView AS Select * From Athletes Where sport = 'Sailing';

CREATE VIEW ShootingView AS Select * From Athletes Where sport = 'Shooting';

CREATE VIEW SoftballView AS Select * From Athletes Where sport = 'Softball';

CREATE VIEW SwimmingView AS Select * From Athletes Where sport = 'Swimming';

CREATE VIEW TabletennisView AS Select * From Athletes Where sport = 'Table tennis';

CREATE VIEW TaekwondoView AS Select * From Athletes Where sport = 'Taekwondo';

CREATE VIEW TennisView AS Select * From Athletes Where sport = 'Tennis';

CREATE VIEW TrampolingView AS Select * From Athletes Where sport = 'Trampoling';

CREATE VIEW TriathlonView AS Select * From Athletes Where sport = 'Triathlon';

CREATE VIEW VolleyballView AS Select * From Athletes Where sport = 'Volleyball';

CREATE VIEW WaterpoloView AS Select * From Athletes Where sport = 'Water polo';

CREATE VIEW WeightliftingView AS Select * From Athletes Where sport = 'Weightlifting';

CREATE VIEW WrestlingView AS Select * From Athletes Where sport = 'Wrestling';
	
______________________________________________________________________________________

CREATE VIEW WaterView AS SELECT * FROM Pokemon WHERE type = 'Water';

CREATE VIEW GrassView AS SELECT * FROM Pokemon WHERE type = 'Grass';

CREATE VIEW NormalView AS SELECT * FROM Pokemon WHERE type = 'Normal';

CREATE VIEW FireView AS SELECT * FROM Pokemon WHERE type = 'Fire';

CREATE VIEW FlyingView AS SELECT * FROM Pokemon WHERE type = 'Flying';

CREATE VIEW GroundView AS SELECT * FROM Pokemon WHERE type = 'Ground';

CREATE VIEW FightingView AS SELECT * FROM Pokemon WHERE type = 'Fighting';

CREATE VIEW PsychicView AS SELECT * FROM Pokemon WHERE type = 'Psychic';

