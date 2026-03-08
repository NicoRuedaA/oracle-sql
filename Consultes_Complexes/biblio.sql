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
   id            number generated as identity primary key,
   titol         varchar2(50),
   an            number,
   exemplars     number,
   id_editorial  number not null,
   id_sequela_de number,
   foreign key ( id_editorial )
      references editorial ( id ),
   foreign key ( id_sequela_de )
      references llibre ( id )
);

create table autor (
   id           number generated as identity primary key,
   nom          varchar2(50),
   cognoms      varchar2(50),
   data_naix    date,
   nacionalitat varchar2(3)
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
   nom_genere varchar2(50),
   foreign key ( id_llibre )
      references llibre ( id ),
   foreign key ( nom_genere )
      references genere ( nom ),
   primary key ( id_llibre,
                 nom_genere )
);

insert into editorial ( nom ) values ( 'LaButxaca' );
insert into editorial ( nom ) values ( 'Letras hispánicas' );
insert into editorial ( nom ) values ( 'Planeta' );
insert into editorial ( nom ) values ( 'Anaya' );

insert into genere values ( 'Misteri' );
insert into genere values ( 'Poesia' );
insert into genere values ( 'Fantasia' );
insert into genere values ( 'Aventura' );
insert into genere values ( 'Filosofia' );

insert into autor (
   nom,
   cognoms,
   data_naix,
   nacionalitat
) values ( 'Federico',
           'García Lorca',
           date '1898-06-05',
           'ESP' );
insert into autor (
   nom,
   cognoms,
   data_naix,
   nacionalitat
) values ( 'Manuel',
           'de Pedrolo i Molina',
           date '1918-04-01',
           'ESP' );
insert into autor (
   nom,
   cognoms,
   data_naix,
   nacionalitat
) values ( 'Joanne',
           'Rowling',
           date '1965-07-31',
           'GBR' );
insert into autor (
   nom,
   cognoms,
   data_naix,
   nacionalitat
) values ( 'Stephen',
           'King',
           date '1947-09-21',
           'USA' );
insert into autor (
   nom,
   cognoms,
   data_naix,
   nacionalitat
) values ( 'Owen',
           'King',
           date '1977-02-21',
           'USA' );
insert into autor (
   nom,
   cognoms,
   data_naix,
   nacionalitat
) values ( 'Shigeru',
           'Miyamoto',
           date '1952-09-16',
           'JPN' );
insert into autor (
   nom,
   cognoms,
   data_naix,
   nacionalitat
) values ( 'Hidetaka',
           'Miyazaki',
           date '1974-09-19',
           'JPN' );

--INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES (nomLlibre, any, nombreExemplars, (SELECT ID FROM EDITORIAL WHERE NOM = 'Letras hispánicas'));
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'Bodas de sangre',
           1933,
           10,
           (
              select id
                from editorial
               where nom = 'Letras hispánicas'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'Yerma',
           1934,
           0,
           (
              select id
                from editorial
               where nom = 'Letras hispánicas'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'La casa de Bernarda Alba',
           1936,
           12,
           (
              select id
                from editorial
               where nom = 'Letras hispánicas'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'Poeta en Nueva York',
           1940,
           5,
           (
              select id
                from editorial
               where nom = 'Letras hispánicas'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'Romancero gitano',
           1928,
           1,
           (
              select id
                from editorial
               where nom = 'Letras hispánicas'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'El Lazarillo de Tormes',
           1554,
           2,
           (
              select id
                from editorial
               where nom = 'Letras hispánicas'
           ) );

insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'Mecanoscrit del segon origen',
           1974,
           1,
           (
              select id
                from editorial
               where nom = 'LaButxaca'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'Totes les bèsties de càrrega',
           1965,
           5,
           (
              select id
                from editorial
               where nom = 'LaButxaca'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'Joc brut',
           1965,
           2,
           (
              select id
                from editorial
               where nom = 'LaButxaca'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'Trajecte final',
           1981,
           6,
           (
              select id
                from editorial
               where nom = 'LaButxaca'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'Es vessa una sang fàcil',
           1954,
           5,
           (
              select id
                from editorial
               where nom = 'LaButxaca'
           ) );

insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'Harry Potter i la pedra filosofal',
           1997,
           0,
           (
              select id
                from editorial
               where nom = 'Planeta'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial,
   id_sequela_de
) values ( 'Harry Potter i la cambra secreta',
           1998,
           7,
           (
              select id
                from editorial
               where nom = 'Planeta'
           ),
           (
              select id
                from llibre
               where titol = 'Harry Potter i la pedra filosofal'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial,
   id_sequela_de
) values ( 'Harry Potter i el pres d''Azkaban',
           1999,
           6,
           (
              select id
                from editorial
               where nom = 'Planeta'
           ),
           (
              select id
                from llibre
               where titol = 'Harry Potter i la cambra secreta'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial,
   id_sequela_de
) values ( 'Harry Potter i el calze de foc',
           2000,
           5,
           (
              select id
                from editorial
               where nom = 'Planeta'
           ),
           (
              select id
                from llibre
               where titol = 'Harry Potter i el pres d''Azkaban'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial,
   id_sequela_de
) values ( 'Harry Potter i l''orde del Fènix',
           2003,
           4,
           (
              select id
                from editorial
               where nom = 'Planeta'
           ),
           (
              select id
                from llibre
               where titol = 'Harry Potter i el calze de foc'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'Bellas durmientes',
           2017,
           3,
           (
              select id
                from editorial
               where nom = 'Planeta'
           ) );

insert into autor_llibre
   select (
      select id
        from autor
       where nom = 'Federico'
   ),
          id
     from llibre
    where id_editorial = (
         select id
           from editorial
          where nom = 'Letras hispánicas'
      )
      and titol != 'El Lazarillo de Tormes';
insert into autor_llibre
   select (
      select id
        from autor
       where nom = 'Manuel'
   ),
          id
     from llibre
    where id_editorial = (
      select id
        from editorial
       where nom = 'LaButxaca'
   );
insert into autor_llibre
   select (
      select id
        from autor
       where nom = 'Joanne'
   ),
          id
     from llibre
    where id_editorial = (
         select id
           from editorial
          where nom = 'Planeta'
      )
      and titol like 'Harry%';
insert into autor_llibre
   select (
      select id
        from autor
       where nom = 'Stephen'
   ),
          id
     from llibre
    where id_editorial = (
         select id
           from editorial
          where nom = 'Planeta'
      )
      and titol not like 'Harry%';
insert into autor_llibre
   select (
      select id
        from autor
       where nom = 'Owen'
   ),
          id
     from llibre
    where id_editorial = (
         select id
           from editorial
          where nom = 'Planeta'
      )
      and titol not like 'Harry%';

insert into llibre_genere
   select id_llibre,
          'Poesia'
     from autor_llibre
    where id_autor = (
      select id
        from autor
       where nom = 'Federico'
   );
insert into llibre_genere
   select id_llibre,
          'Fantasia'
     from autor_llibre
    where id_autor = (
      select id
        from autor
       where nom = 'Joanne'
   );
insert into llibre_genere
   select id_llibre,
          'Aventura'
     from autor_llibre
    where id_autor = (
         select id
           from autor
          where nom = 'Manuel'
      )
      and rownum < 3;
insert into llibre_genere
   select id_llibre,
          'Misteri'
     from autor_llibre
    where id_autor = (
         select id
           from autor
          where nom = 'Manuel'
      )
      and id_llibre not in (
      select id_llibre
        from llibre_genere
   );

delete from llibre_genere
 where id_llibre = (
   select id
     from llibre
    where titol = 'Totes les bèsties de càrrega'
);
delete from llibre_genere
 where id_llibre = (
   select id
     from llibre
    where titol = 'Harry Potter i el calze de foc'
);
delete from llibre_genere
 where id_llibre = (
   select id
     from llibre
    where titol = 'Bellas durmientes'
);


--Sense JOIN
--1. Llista els llibres (títol) amb el seu gènere (nom).
--Columnes: títol del llibre, nom del gènere
select llibre.titol as "títol del llibre",
       llibre_genere.nom_genere as "nom del gènere"
  from llibre,
       llibre_genere
 where llibre.id = llibre_genere.id_llibre
--per mostrar llibres sense génere
  (+);


--2. Llista els títols i autor (nom i llinatge) dels llibres d'autors no espanyols.
--Columnes: títol llibre, nom i llinatge autor
select llibre.titol as "títol llibre",
       autor.nom
       || ' '
       || autor.cognoms "nom i llinatge autor"
  from llibre,
       autor_llibre,
       autor
 where llibre.id = autor_llibre.id_llibre
   and autor_llibre.id_autor = autor.id
   and autor.nacionalitat != 'ESP';

--3. Llista els títols, el gènere (nom) i l'autor (nom i llinatges) de cada llibre. (Si un llibre té més d'un autor o gènere, el seu títol sortirà repetit).
--Columnes: títol llibre, nom gènere, nom i llinatges autor
select llibre.titol as "títol llibre",
       llibre_genere.nom_genere as "nom del gènere",
       autor.nom
       || ' '
       || autor.cognoms "nom i llinatge autor"
  from llibre,
       llibre_genere,
       autor_llibre,
       autor
 where llibre.id = llibre_genere.id_llibre
   and llibre.id = autor_llibre.id_llibre
   and autor_llibre.id_autor = autor.id;
 
--4. Llista els llibres (títol) amb només un autor.
select llibre.titol as "títol llibre",
       autor.nom
       || ' '
       || autor.cognoms "nom i llinatge autor"
  from llibre,
       autor_llibre,
       autor
 where llibre.id = autor_llibre.id_llibre
   and autor_llibre.id_autor = autor.id
 group by llibre.titol,
          autor.nom,
          autor.cognoms
having count(autor_llibre.id_autor) = 1;

--5. Llista el nombre d'exemplars totals de cada autor (nom i llinatges).
--Columnes: nom i llinatges autor, número d'exemplars d'entre tots els seus llibres
select autor.nom
       || ' '
       || autor.cognoms "nom i llinatge autor",
       sum(llibre.exemplars) as "número d'exemplars d'entre tots els seus llibres"
  from autor,
       autor_llibre,
       llibre
 where autor.id = autor_llibre.id_autor
   and autor_llibre.id_llibre = llibre.id
 group by autor.id,
          autor.nom,
          autor.cognoms;


--Amb JOIN
--6. Llista els autors (nom i llinatges) sense llibres.
--Columnes: nom i llinatges autor
select autor.nom
       || ' '
       || autor.cognoms as "nom i llinatges autor"
  from autor
  left join autor_llibre
on autor.id = autor_llibre.id_autor
 where autor_llibre.id_llibre is null;


--7. Llista els llibres (títol) amb el seu gènere (nom).
--Columnes: títol llibre, nom gènere
select llibre.titol,
       llibre_genere.nom_genere
  from llibre
  join llibre_genere
on llibre.id = llibre_genere.id_llibre;

--8. Llista els gèneres (nom) sense llibres.
--Columnes: nom gènere
select genere.nom
  from genere
  left join llibre_genere
on genere.nom = llibre_genere.nom_genere
 where llibre_genere.id_llibre is null;

--9. Llista els títols i autor (nom i llinatge) dels llibres d'autors espanyols.
--Columnes: títol llibre, nom i llinatge autor
select llibre.titol,
       autor.nom
       || ' '
       || autor.cognoms as "autor"
  from llibre
  join autor_llibre
on llibre.id = autor_llibre.id_llibre
  join autor
on autor_llibre.id_autor = autor.id
 where autor.nacionalitat = 'ESP';

--10. Llista els títols, el gènere (nom) i l'autor (nom i llinatges) de cada llibre. (Si un llibre té més d'un autor o gènere, el seu títol sortirà repetit). Mostra només els que tenen autor conegut i gènere.
--Columnes: títol llibre, nom gènere, nom i llinatges autor
select llibre.titol,
       llibre_genere.nom_genere,
       autor.nom
       || ' '
       || autor.cognoms as "autor"
  from llibre
  join llibre_genere
on llibre.id = llibre_genere.id_llibre
  join autor_llibre
on llibre.id = autor_llibre.id_llibre
  join autor
on autor_llibre.id_autor = autor.id;

--11. Repeteix la consulta anterior, però també han de poder sortir els llibres sense gènere ni autor.
--Columnes: títol llibre, nom gènere, nom i llinatges autor
select llibre.titol,
       llibre_genere.nom_genere,
       autor.nom
       || ' '
       || autor.cognoms as "autor"
  from llibre
  left join llibre_genere
on llibre.id = llibre_genere.id_llibre
  left join autor_llibre
on llibre.id = autor_llibre.id_llibre
  left join autor
on autor_llibre.id_autor = autor.id;

--12. Llista els llibres (títol) amb més d'un autor.
--Columnes: títol llibre
select llibre.titol
  from llibre
  join autor_llibre
on llibre.id = autor_llibre.id_llibre
 group by llibre.titol
having count(autor_llibre.id_autor) > 1;

--13. Llista el nombre d'exemplars totals de l'autor "Federico García Lorca".
--Columnes: número d'exemplars
select sum(llibre.exemplars) as "número d'exemplars"
  from llibre
  join autor_llibre
on llibre.id = autor_llibre.id_llibre
  join autor
on autor_llibre.id_autor = autor.id
 where autor.nom = 'Federico'
   and autor.cognoms = 'García Lorca';

--14. Llista el nombre d'exemplars totals de cada autor. Si un autor no té cap llibre (i per tant, exemplars), ha de sortir un 0.
--Columnes: nom i llinatges autor, número d'exemplars total
select autor.nom
       || ' '
       || autor.cognoms as "autor",
       nvl(
          sum(llibre.exemplars),
          0
       ) as "total_exemplars"
  from autor
  left join autor_llibre
on autor.id = autor_llibre.id_autor
  left join llibre
on autor_llibre.id_llibre = llibre.id
 group by autor.nom,
          autor.cognoms;

--15. Llista el primer i darrer any en que va treure un llibre cada autor, només d'aquells autors que tenen llibres.
--Columnes: nom i llinatges autor, primer any de llançament d'un llibre, darrer any de llançament d'un llibre
select autor.nom
       || ' '
       || autor.cognoms as "autor",
       min(llibre.an) as "primer_any",
       max(llibre.an) as "darrer_any"
  from autor
  join autor_llibre
on autor.id = autor_llibre.id_autor
  join llibre
on autor_llibre.id_llibre = llibre.id
 group by autor.nom,
          autor.cognoms;