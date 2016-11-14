-- Pokemon Relation
create table Pokemon (
	name varchar(255) not null,
	type varchar(255),
	total number,
	hp number,
	attack number,
	defense number,
	sp_attack number,
	sp_defense number,
	speed number,
	generation number,
	image_no number,
	primary key (name)
);

-- Athletes Relation
create table Athletes (
	name varchar(255) not null,
	dob date not null,
	country varchar(255),
	sports varchar(255),
	events varchar(255),
	height real,
	weight real,
	gender varchar(255),
	primary key (name, dob)
);

-- Activities Relation
create table Activities (
	sport varchar(255),
	category varchar(255),
	primary key (sport)
);

-- Medal Relation
create table Medal (
	name varchar(255) not null,
	dob varchar(255) not null,
	gold integer,
	silver integer,
	bronze integer,
	primary key (name, dob)
);
