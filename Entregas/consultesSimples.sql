drop table llibres;

create table llibres (
   codi      number generated as identity,
   titol     varchar(60) not null,
   autor     varchar(30),
   editorial varchar(15),
   preu      number(5,2),
   primary key ( codi )
);

insert into llibres (
   titol,
   autor,
   editorial,
   preu
) values ( 'El principito',
           'Antonine de Saint',
           'Planeta',
           15 );
insert into llibres (
   titol,
   autor,
   editorial,
   preu
) values ( 'La Cocinera de Castamar',
           'Fernando J. Múñez',
           'Planeta',
           40 );
insert into llibres (
   titol,
   autor,
   editorial,
   preu
) values ( 'Yerma',
           'Federico García Lorca',
           'Planeta',
           40 );
insert into llibres (
   titol,
   autor,
   editorial,
   preu
) values ( 'Cómo hacer que te pasen cosas buenas',
           'Marián Rojas',
           'Espasa',
           18.20 );
insert into llibres (
   titol,
   autor,
   editorial,
   preu
) values ( 'Mecanoscrit del segon origen',
           'Manuel de Pedrolo',
           'Espasa',
           15 );
insert into llibres (
   titol,
   autor,
   editorial,
   preu
) values ( 'Magia y enigma',
           'Henry Kamen',
           'Espasa',
           22.20 );
insert into llibres (
   titol,
   autor,
   editorial,
   preu
) values ( 'Matilda',
           'Roald Dahl',
           'Alfaguara',
           36.40 );
insert into llibres (
   titol,
   autor,
   editorial,
   preu
) values ( 'Momo',
           'Michael Ende',
           'Alfaguara',
           30.80 );
insert into llibres (
   titol,
   autor,
   editorial,
   preu
) values ( 'Mujercitas',
           'Louisa May Alcott',
           'Alfaguara',
           45.00 );
insert into llibres (
   titol,
   autor,
   editorial,
   preu
) values ( 'La historia interminable',
           'Michael Ende',
           'Alfaguara',
           46.00 );
insert into llibres (
   titol,
   autor,
   editorial,
   preu
) values ( 'Peter Pan',
           'J.M. Barrie',
           'Alfaguara',
           null );

--1
select editorial,
       count(*) as "recompte llibres"
  from llibres
 group by editorial;    

--2 
select editorial,
       count(*) as "recompte llibres"
  from llibres
 group by editorial
having count(*) > 4;   

--3 
select editorial,
       avg(preu) as "preu mitjà"
  from llibres
 group by editorial
 order by "preu mitjà" desc;

--4
select editorial,
       avg(preu) as "preu mitjà"
  from llibres
 group by editorial
having avg(preu) > 25
 order by "preu mitjà" desc;

--5
select editorial,
       count(*) as "recompte llibres"
  from llibres
 where editorial <> 'Planeta'
 group by editorial;


-- 6
select editorial,
       count(*) as "recompte llibres"
  from llibres
 where editorial <> 'Planeta'
   and preu is not null
 group by editorial;

-- 7
select editorial,
       avg(preu) as "preu mitjà"
  from llibres
 group by editorial
having count(codi) > 2;

-- 8. 
select editorial,
       max(preu) as "preu més car"
  from llibres
 group by editorial
 order by "preu més car" desc;

--9
select editorial,
       max(preu) as "preu més car"
  from llibres
 where preu > 30
 group by editorial;

--10
select autor,
       titol
  from llibres
 where titol like 'M%'
   and autor like '%H%';

--11
select autor,
       count(*) as "quantitat llibres"
  from llibres
 group by autor
 order by "quantitat llibres" desc;

--12
select substr(
   titol,
   1,
   1
) as "inicials"
  from llibres;

select avg(preu)
  from llibres
 where titol like 'M%'
    or titol like 'm%';


select substr(
   titol,
   1,
   1
) as "inicials",
       avg(preu) as "preu_avg"
  from llibres
 group by substr(
   titol,
   1,
   1
)
 order by "inicials";


-- 12. Llista les diferents lletres inicials dels titols dels llibres i el preu 
--promig dels llibres amb un títol que comenci per aquesta lletra. 
--Ordena per preu ascendent:
-- Columnes: Lletra inicial títol, preu mitjà