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

CREATE VIEW SwimmingView AS SELECT * FROM Athletes WHERE sports = 'Swimming';

CREATE VIEW ShootingView AS SELECT * FROM Athletes WHERE sports = 'Shooting';

CREATE VIEW ArcheryView AS SELECT * FROM Athletes WHERE sports = 'Archery';

CREATE VIEW AquaticsView AS SELECT * FROM Athletes WHERE sports = 'Aquatics';

CREATE VIEW WaterpoloView AS SELECT * FROM Athletes WHERE sports = 'Water polo';

CREATE VIEW SailingView AS SELECT * FROM Athletes WHERE sports = 'Sailing';

CREATE VIEW RowingView AS SELECT * FROM Athletes WHERE sports = 'Rowing';

CREATE VIEW CanoeView AS SELECT * FROM Athletes WHERE sports = 'Canoe';

CREATE VIEW FootballView AS SELECT * FROM Athletes WHERE sports = 'Football';

CREATE VIEW TennisView AS SELECT * FROM Athletes WHERE sports = 'Tennis';

CREATE VIEW HockyView AS SELECT * FROM Athletes WHERE sports = 'Hocky';

CREATE VIEW BadmintonView AS SELECT * FROM Athletes WHERE sports = 'Badminton';

CREATE VIEW HandballView AS SELECT * FROM Athletes WHERE sports = 'Handball';

CREATE VIEW TabletennisView AS SELECT * FROM Athletes WHERE sports = 'Table tennis';

CREATE VIEW BasketballView AS SELECT * FROM Athletes WHERE sports = 'Basketball';

CREATE VIEW VolleyballView AS SELECT * FROM Athletes WHERE sports = 'Volleyball';
	
CREATE VIEW EquestrianView AS SELECT * FROM Athletes WHERE sports = 'Equestrian';

CREATE VIEW CyclingView AS SELECT * FROM Athletes WHERE sports = 'Cycling';

CREATE VIEW AthleticsView AS SELECT * FROM Athletes WHERE sports = 'Athletics';

CREATE VIEW TrampolingView AS SELECT * FROM Athletes WHERE sports = 'Trampoling';

CREATE VIEW GymasticsView AS SELECT * FROM Athletes WHERE sports = 'Gymastics';

CREATE VIEW TaekwondoView AS SELECT * FROM Athletes WHERE sports = 'Taekwondo';

CREATE VIEW WrestlingView AS SELECT * FROM Athletes WHERE sports = 'Wrestling';

CREATE VIEW FencingView AS SELECT * FROM Athletes WHERE sports = 'Fencing';

CREATE VIEW JudoView AS SELECT * FROM Athletes WHERE sports = 'Judo';

CREATE VIEW BoxingView AS SELECT * FROM Athletes WHERE sports = 'Boxing';

CREATE VIEW ModernpentathlonView AS SELECT * FROM Athletes WHERE sports = 'Modern pentathlon';

CREATE VIEW TriathlonView AS SELECT * FROM Athletes WHERE sports = 'Triathlon';

CREATE VIEW WeightliftingView AS SELECT * FROM Athletes WHERE sports = 'Weightlifting';

CREATE VIEW RugbysevensView AS SELECT * FROM Athletes WHERE sports = 'Rugby sevens';
	
______________________________________________________________________________________

CREATE VIEW WaterView AS SELECT * FROM Pokemon WHERE type = 'Water';

CREATE VIEW GrassView AS SELECT * FROM Pokemon WHERE type = 'Grass';

CREATE VIEW NormalView AS SELECT * FROM Pokemon WHERE type = 'Normal';

CREATE VIEW FireView AS SELECT * FROM Pokemon WHERE type = 'Fire';

CREATE VIEW FlyingView AS SELECT * FROM Pokemon WHERE type = 'Flying';

CREATE VIEW GroundView AS SELECT * FROM Pokemon WHERE type = 'Ground';

CREATE VIEW FightingView AS SELECT * FROM Pokemon WHERE type = 'Fighting';

CREATE VIEW PsychicView AS SELECT * FROM Pokemon WHERE type = 'Psychic';

