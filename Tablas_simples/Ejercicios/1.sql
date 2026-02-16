create table autor (
   id             number generated as identity,
   nom            varchar2(50),
   cognoms        varchar(50),
   data_naixament date,
   nacionalitat   varchar2(50),
   primary key ( id ),
   unique ( nom,
            cognoms,
            nacionalitat )
);

create table editorial (
   id  number generated as identity,
   nom varchar2(50),
   primary key ( id )
);

create table llibre (
   id           number generated as identity,
   titol        varchar2(50),
   anyo         number,
   exemplars    number,
   id_editorial number not null,
   id_secuela   number,
   primary key ( id ),
   foreign key ( id_editorial )
      references editorial ( id ),
   foreign key ( id_secuela )
      references llibre ( id ),
   unique ( titol,
            anyo ),
   check ( anyo < 2023 ),
   check ( exemplars > 0 )
);
create table autor_llibre (
   id_autor  number,
   id_llibre number,
   primary key ( id_autor,
                 id_llibre ),
   foreign key ( id_autor )
      references autor ( id ),
   foreign key ( id_llibre )
      references llibre ( id )
);
create table genere (
   nom varchar2(50) primary key
);
create table llibre_genere (
   id_llibre  number,
   nom_genere varchar(50),
   primary key ( id_llibre,
                 nom_genere ),
   foreign key ( id_llibre )
      references llibre ( id ),
   foreign key ( nom_genere )
      references genere ( nom )
);
insert into editorial ( nom ) values ( 'Libros_Sigma' );
insert into editorial ( nom ) values ( 'Libros_Beta' );
select *
  from editorial;
insert into llibre (
   titol,
   anyo,
   exemplars,
   id_editorial
) values ( 'Omegaverse',
           1942,
           3,
           1 );
insert into llibre (
   titol,
   anyo,
   exemplars,
   id_editorial
) values ( 'Luna_de_pluton',
           2000,
           9,
           2 );

alter table llibre modify
   anyo number;
insert into autor (
   nom,
   cognoms,
   data_naixament,
   nacionalitat
) values ( 'Freddie',
           'Mercury',
           date '1946-11-5',
           'Zanzibar' );
insert into autor (
   nom,
   cognoms,
   data_naixament,
   nacionalitat
) values ( 'Brian',
           'May',
           date '1947-07-19',
           'Regne_Unit' );
insert into autor (
   nom,
   cognoms,
   data_naixament,
   nacionalitat
) values ( 'Roger',
           'Taylor',
           date '194-07-26',
           'Regne_Unit' );
select *
  from autor;
select *
  from llibre;
insert into autor_llibre (
   id_autor,
   id_llibre
) values ( 5,
           11 );
insert into autor_llibre (
   id_autor,
   id_llibre
) values ( 6,
           12 );
insert into autor_llibre (
   id_autor,
   id_llibre
) values ( 7,
           12 );
select *
  from autor_llibre;
delete from autor_llibre
 where id_autor = 7;
update llibre
   set
   llibre.id_editorial = 1
 where llibre.id = 12;
delete from editorial
 where editorial.id = 2;
update llibre
   set
   llibre.exemplars = 0
 where llibre.id = 11;
create table llibres_esgotats (
   id           number generated as identity,
   titol        varchar2(50),
   anyo         number,
   exemplars    number,
   id_editorial number not null,
   id_secuela   number,
   primary key ( id ),
   foreign key ( id_editorial )
      references editorial ( id ),
   foreign key ( id_secuela )
      references llibre ( id ),
   unique ( titol,
            anyo )
);
insert into llibres_esgotats (
   titol,
   anyo,
   exemplars,
   id_editorial
) values ( 'Omegaverse',
           1942,
           0,
           1 );
select *
  from llibres_esgotats;
delete from llibre
 where llibre.id = 22;
delete from autor_llibre
 where autor_llibre.id_llibre = 11;
delete from llibre
 where llibre.id = 11;