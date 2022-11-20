create table devices (
	id serial primary key,
	name varchar(50) not null unique
);

create table alertLevels (
	id serial primary key,
	name varchar(50) not null unique
);

create table typesOfLogs (
	id serial primary key,
	name varchar(50) not null unique
);

create table malwareTypes (
	id serial primary key,
	name varchar(50) not null unique
);

create table objects (
	id serial primary key,
	name varchar(50) not null unique
);

create table logs (
	id serial primary key,
    source varchar(100) not null,
    timeGenerated timestamp not null,
    eventID integer not null,
    instanceID bigint not null,
    userName varchar(50) not null,
    "data" text not null,
    id_device integer references devices(id) not null,
    id_alertLevel integer references alertLevels(id) not null,
    id_typeOfLog integer references typesOfLogs(id) not null
);

create table malwareReports (
    id serial primary key,
    filepath varchar(100) not null,
    id_malwaretype integer references malwareTypes(id) not null,
    id_device integer references devices(id) not null
);

create table loads (
    id serial primary key,
    "value" integer not null,
    datetime timestamp not null,
    id_object integer references objects(id) not null,
    id_device integer references devices(id) not null 
);