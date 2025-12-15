drop table autor_llibre;
drop table llibre_genere;
drop table llibre;
drop table editorial;
drop table autor;
drop table genere;

create table editorial (
   id  number generated as identity primary key,
   nom varchar2(50)
);

create table llibre (
   id           number generated as identity primary key,
   titol        varchar2(50) not null,
   an           number,
   exemplars    number,
   id_editorial number not null,
   id_sequela   number,
   foreign key ( id_editorial )
      references editorial ( id ),
   foreign key ( id_sequela )
      references llibre ( id ),
   constraint aignacio_ann_titol unique ( titol,
                                          an ),
   constraint max_ann check ( an <= 2023 ),
   constraint max_exemplars check ( exemplars <= 2023 )
);


create table autor (
   id           number generated as identity primary key,
   nom          varchar2(50),
   cognoms      varchar2(50),
   data_naix    date,
   nacionalitat varchar2(3),
   constraint aignacio_autor unique ( nom,
                                      cognom,
                                      nacionalitat )
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
   nom varchar2(50) not null primary key
);

create table llibre_genere (
   id_llibre  number,
   nom_genere varchar2(50),
   foreign key ( id_llibre )
      references llibre ( id ),
   foreign key ( nom_genere )
      references genere ( nom ),
   primary key ( id_llibre,
                 nom_genere )
);