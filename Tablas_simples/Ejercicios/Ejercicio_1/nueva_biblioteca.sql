insert into editorial ( nom ) values ( 'Editorial 1' );
insert into editorial ( nom ) values ( 'Editorial 2' );

insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'Introducció a SQL',
           2021,
           5,
           1 );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'Bases de Dades Avançades',
           2022,
           3,
           2 );

insert into autor (
   nom,
   cognoms,
   data_naix,
   nacionalitat
) values ( 'Anna',
           'Puig',
           date '1980-05-10',
           'ESP' );
insert into autor (
   nom,
   cognoms,
   data_naix,
   nacionalitat
) values ( 'Joan',
           'Serra',
           date '1975-03-22',
           'ESP' );
insert into autor (
   nom,
   cognoms,
   data_naix,
   nacionalitat
) values ( 'Maria',
           'Costa',
           date '1990-11-15',
           'ESP' );

insert into autor_llibre (
   id_autor,
   id_llibre
) values ( 1,
           1 );
insert into autor_llibre (
   id_autor,
   id_llibre
) values ( 2,
           2 );
insert into autor_llibre (
   id_autor,
   id_llibre
) values ( 3,
           2 );

delete from autor_llibre
 where id_autor = 3
   and id_llibre = 2;
//UPDATE llibre SET llibre.id_editorial=2 WHERE llibre.id_editorial=1 //este no es
update llibre
   set
   id_editorial = 2
 where id = 1;

//esto es para borrar la editorial que solo tiene 0 libros
delete from editorial
 where id = 1;
update llibre
   set
   exemplars = 0
 where id = 1;