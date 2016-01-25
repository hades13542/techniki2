create table wojewodztwo ( ID INTEGER PRIMARY KEY AUTOINCREMENT, name CHAR(20) not null, town CHAR(20) not null, value INTEGER not null ) ;
insert into wojewodztwo ( name, town, value ) values ('Małopolskie', 'Kraków', 1000000);
insert into wojewodztwo ( name, town, value ) values ('Podkarpackie', 'Mielec', 50000);
insert into wojewodztwo ( name, town, value ) values ('Podkarpackie', 'Rzeszów', 75000);
insert into wojewodztwo ( name, town, value ) values ('Małopolskie', 'WiochaStarosty', 4000);
insert into wojewodztwo ( name, town, value ) values ('Małopolskie', 'Brzesko', 10000);

