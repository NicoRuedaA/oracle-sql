begin
   for t in (
      select table_name
        from user_tables 
      -- Filtramos para no tocar tablas de sistema o LogMiner
       where table_name not like 'LOGMNR_%'
         and table_name not like 'MVIEW_%'
         and table_name not like 'DR$%'
   ) loop
      begin
         execute immediate 'DROP TABLE '
                           || t.table_name
                           || ' CASCADE CONSTRAINTS PURGE';
      exception
         when others then
            -- Si alguna tabla todavía da error (como las de LogMiner), la ignora y sigue con la siguiente
            null;
      end;
   end loop;
end;
/

--ESQUEMA
create table alumne (
   dni       varchar2(9) primary key,
   nom       varchar2(50),
   llinatge1 varchar2(50),
   llinatge2 varchar2(50),
   email     varchar2(50)
);

create table professor (
   dni       varchar2(9) primary key,
   nom       varchar2(50),
   llinatge1 varchar2(50),
   llinatge2 varchar2(50),
   email     varchar2(50),
   salari    number
);

create table grau (
   id     number generated as identity primary key,
   nom    varchar2(50),
   cursos number
);

create table assignatura (
   id            number generated as identity primary key,
   nom           varchar2(50),
   id_grau       number,
   pla           number(4),
   dni_professor varchar2(9),
   credits_ects  number(2,0) default 6,
   foreign key ( dni_professor )
      references professor ( dni ),
   foreign key ( id_grau )
      references grau ( id )
);

create table nota (
   id             number generated as identity primary key,
   dni_alumne     varchar2(9),
   id_assignatura number,
   convocatoria   number(4),
   nota           number,
   foreign key ( id_assignatura )
      references assignatura ( id ),
   foreign key ( dni_alumne )
      references alumne ( dni ),
   unique ( dni_alumne,
            id_assignatura,
            convocatoria )
);

--DADES
-- Inserció d'alumnes
insert into alumne (
   dni,
   nom,
   llinatge1,
   llinatge2,
   email
) values ( '12345678A',
           'Laura',
           'Martí',
           'Soler',
           'laura.marti@example.com' );
insert into alumne (
   dni,
   nom,
   llinatge1,
   llinatge2,
   email
) values ( '23456789B',
           'Marc',
           'Garcia',
           'López',
           'marc.garcia@example.com' );
insert into alumne (
   dni,
   nom,
   llinatge1,
   llinatge2,
   email
) values ( '34567890C',
           'Anna',
           'Puig',
           'Casas',
           'anna.puig@example.com' );
insert into alumne (
   dni,
   nom,
   llinatge1,
   llinatge2,
   email
) values ( '45678901D',
           'David',
           'Ferrer',
           'Prat',
           'david.ferrer@example.com' );
insert into alumne (
   dni,
   nom,
   llinatge1,
   llinatge2,
   email
) values ( '56789012E',
           'Sara',
           'Navarro',
           'Vidal',
           'sara.navarro@example.com' );
insert into alumne (
   dni,
   nom,
   llinatge1,
   llinatge2,
   email
) values ( '67890123F',
           'Oriol',
           'González',
           'Moreno',
           'oriol.gonzalez@example.com' );
insert into alumne (
   dni,
   nom,
   llinatge1,
   llinatge2,
   email
) values ( '78901234G',
           'Clara',
           'Sánchez',
           'Molina',
           'clara.sanchez@example.com' );
insert into alumne (
   dni,
   nom,
   llinatge1,
   llinatge2,
   email
) values ( '89012345H',
           'Jordi',
           'Ruiz',
           'Dominguez',
           'jordi.ruiz@example.com' );
insert into alumne (
   dni,
   nom,
   llinatge1,
   llinatge2,
   email
) values ( '90123456I',
           'Mireia',
           'Blanco',
           'Torres',
           'mireia.blanco@example.com' );
insert into alumne (
   dni,
   nom,
   llinatge1,
   llinatge2,
   email
) values ( '01234567J',
           'Pau',
           'Ortega',
           'Castro',
           'pau.ortega@example.com' );

-- Inserció de professors
insert into professor (
   dni,
   nom,
   llinatge1,
   llinatge2,
   email,
   salari
) values ( '11223344L',
           'Elena',
           'Gil',
           'Rodríguez',
           'elena.gil@example.com',
           30000 );
insert into professor (
   dni,
   nom,
   llinatge1,
   llinatge2,
   email,
   salari
) values ( '22334455M',
           'Carlos',
           'López',
           'Jiménez',
           'carlos.lopez@example.com',
           31000 );
insert into professor (
   dni,
   nom,
   llinatge1,
   llinatge2,
   email,
   salari
) values ( '33445566N',
           'Patricia',
           'Martín',
           'Pérez',
           'patricia.martin@example.com',
           32000 );
insert into professor (
   dni,
   nom,
   llinatge1,
   llinatge2,
   email,
   salari
) values ( '44556677O',
           'Francisco',
           'García',
           'Sánchez',
           'francisco.garcia@example.com',
           28000 );
insert into professor (
   dni,
   nom,
   llinatge1,
   llinatge2,
   email,
   salari
) values ( '55667788P',
           'Susana',
           'Fernández',
           'González',
           'susana.fernandez@example.com',
           26000 );
insert into professor (
   dni,
   nom,
   llinatge1,
   llinatge2,
   email,
   salari
) values ( '66778899Q',
           'Luis',
           'Álvarez',
           'Gómez',
           'luis.alvarez@example.com',
           22000 );
insert into professor (
   dni,
   nom,
   llinatge1,
   llinatge2,
   email,
   salari
) values ( '77889900R',
           'Carmen',
           'Moreno',
           'Ruiz',
           'carmen.moreno@example.com',
           40000 );
insert into professor (
   dni,
   nom,
   llinatge1,
   llinatge2,
   email,
   salari
) values ( '88990011S',
           'Antonio',
           'Navarro',
           'Lorenzo',
           'antonio.navarro@example.com',
           33000 );
insert into professor (
   dni,
   nom,
   llinatge1,
   llinatge2,
   email,
   salari
) values ( '99001122T',
           'Isabel',
           'Serra',
           'Miralles',
           'isabel.serra@example.com',
           32000 );
insert into professor (
   dni,
   nom,
   llinatge1,
   llinatge2,
   email,
   salari
) values ( '00112233U',
           'Josep',
           'Torres',
           'Silva',
           'josep.torres@example.com',
           29000 );

-- Inserció de graus
insert into grau (
   nom,
   cursos
) values ( 'Psicologia',
           4 );
insert into grau (
   nom,
   cursos
) values ( 'Dret',
           4 );
insert into grau (
   nom,
   cursos
) values ( 'Medicina',
           6 );
insert into grau (
   nom,
   cursos
) values ( 'Arquitectura',
           5 );
insert into grau (
   nom,
   cursos
) values ( 'Filologia Anglesa',
           4 );
insert into grau (
   nom,
   cursos
) values ( 'Ciències Polítiques',
           4 );
insert into grau (
   nom,
   cursos
) values ( 'Matemàtiques',
           4 );
insert into grau (
   nom,
   cursos
) values ( 'Informàtica',
           4 );
insert into grau (
   nom,
   cursos
) values ( 'Física',
           4 );

-- Inserció d'assignatures
insert into assignatura (
   nom,
   id_grau,
   pla,
   dni_professor
) values ( 'Història de la Psicologia',
           1,
           2019,
           '11223344L' );
insert into assignatura (
   nom,
   id_grau,
   pla,
   dni_professor
) values ( 'Dret Constitucional',
           2,
           2024,
           '22334455M' );
insert into assignatura (
   nom,
   id_grau,
   pla,
   dni_professor
) values ( 'Anatomia Humana',
           3,
           2024,
           '33445566N' );
insert into assignatura (
   nom,
   id_grau,
   pla,
   dni_professor
) values ( 'Disseny Arquitectònic',
           4,
           2023,
           '44556677O' );
insert into assignatura (
   nom,
   id_grau,
   pla,
   dni_professor
) values ( 'Literatura Anglesa',
           5,
           2018,
           '55667788P' );
insert into assignatura (
   nom,
   id_grau,
   pla,
   dni_professor
) values ( 'Teories Polítiques',
           6,
           2022,
           '66778899Q' );
insert into assignatura (
   nom,
   id_grau,
   pla,
   dni_professor
) values ( 'Tècniques de crispació social',
           6,
           2022,
           '66778899Q' );
insert into assignatura (
   nom,
   id_grau,
   pla,
   dni_professor
) values ( 'Càlcul Diferencial',
           7,
           2021,
           '77889900R' );
insert into assignatura (
   nom,
   id_grau,
   pla,
   dni_professor
) values ( 'Programació I',
           8,
           2020,
           '88990011S' );
insert into assignatura (
   nom,
   id_grau,
   pla,
   dni_professor
) values ( 'Estructura de computadors',
           8,
           2020,
           '99001122T' );
insert into assignatura (
   nom,
   id_grau,
   pla,
   dni_professor
) values ( 'Teoria de la computació',
           8,
           2020,
           '00112233U' );

-- Inserció de notes
insert into nota (
   dni_alumne,
   id_assignatura,
   convocatoria,
   nota
) values ( '12345678A',
           1,
           2021,
           7.5 );
insert into nota (
   dni_alumne,
   id_assignatura,
   convocatoria,
   nota
) values ( '23456789B',
           2,
           2021,
           6.0 );
insert into nota (
   dni_alumne,
   id_assignatura,
   convocatoria,
   nota
) values ( '34567890C',
           3,
           2021,
           4.5 );
insert into nota (
   dni_alumne,
   id_assignatura,
   convocatoria,
   nota
) values ( '56789012E',
           5,
           2021,
           5.5 );
insert into nota (
   dni_alumne,
   id_assignatura,
   convocatoria,
   nota
) values ( '67890123F',
           6,
           2021,
           7.0 );
insert into nota (
   dni_alumne,
   id_assignatura,
   convocatoria,
   nota
) values ( '89012345H',
           8,
           2021,
           6.5 );
insert into nota (
   dni_alumne,
   id_assignatura,
   convocatoria,
   nota
) values ( '89012345H',
           9,
           2021,
           7.5 );
insert into nota (
   dni_alumne,
   id_assignatura,
   convocatoria,
   nota
) values ( '89012345H',
           10,
           2021,
           4.5 );
insert into nota (
   dni_alumne,
   id_assignatura,
   convocatoria,
   nota
) values ( '90123456I',
           8,
           2021,
           4.0 );
insert into nota (
   dni_alumne,
   id_assignatura,
   convocatoria,
   nota
) values ( '90123456I',
           9,
           2021,
           5.5 );
insert into nota (
   dni_alumne,
   id_assignatura,
   convocatoria,
   nota
) values ( '01234567J',
           8,
           2021,
           8.5 );
insert into nota (
   dni_alumne,
   id_assignatura,
   convocatoria,
   nota
) values ( '01234567J',
           9,
           2021,
           9.0 );
insert into nota (
   dni_alumne,
   id_assignatura,
   convocatoria,
   nota
) values ( '01234567J',
           10,
           2021,
           9.5 );

--1)
--muestra la nota máxima
select max(nota)
  from nota;
--muestra los datos del alumno con la nota máxima
select *
  from nota
 order by nota desc
 fetch first 1 row only;
--nota máxima de cada alumno
select dni_alumne,
       max(nota)
  from nota
 group by dni_alumne;

--2)
--nombre que acabe por ra
select alumne.nom,
       alumne.llinatge1,
       alumne.email
  from alumne
 where alumne.nom like '%ra';
--apellido que comience por mar
select alumne.nom,
       alumne.llinatge1,
       alumne.email
  from alumne
 where alumne.llinatge1 like 'Mar%';
 --join
select alumne.nom,
       alumne.llinatge1,
       alumne.email
  from alumne
 where alumne.llinatge1 like 'Mar%'
   and alumne.nom like '%ra';

--3)
select dni,
       nom
       || ' '
       || llinatge1
       || ' '
       || llinatge2 as nom_complet
  from professor
 order by salari desc
 fetch first 1 row only;


--4)
select id_assignatura,
       avg(nota) as nota_media
  from nota
 group by id_assignatura
 order by avg(nota) desc;

--5)
select nota.dni_alumne,
       nota.convocatoria,
       nota.nota
  from nota
  join assignatura
on nota.id_assignatura = assignatura.id
 where assignatura.nom like 'Estructura de computadors';

 --6)
select alumne.nom,
       alumne.llinatge1,
       alumne.llinatge2,
       alumne.dni,
       alumne.email
  from alumne
  left join nota
on alumne.dni = nota.dni_alumne
 where nota.nota is null
 order by alumne.llinatge1 asc,
          alumne.llinatge2 asc,
          alumne.nom asc;

--7)
--Retorna el nombre d'assignatures per cada grau (nom), ordenant pel nombre d'assignatures, del grau que en té més al que en té menys.
--Columnes: Nom grau, nombre d'assignatures
--Ordenació: Nombre d'assignatures, de més a menys

select assignatura.nom,
       grau.nom
  from assignatura
  join grau
on assignatura.id_grau = grau.id;


select assignatura.nom,
       grau.nom
  from assignatura
  join grau
on assignatura.id_grau = grau.id
 order by grau.nom;


select grau.nom,
       count(assignatura.nom) num
  from assignatura
  join grau
on assignatura.id_grau = grau.id
 group by grau.nom
 order by count(assignatura.nom) desc;

 --8)
--Retorna informació de totes les notes (dni alumne, convocatòria, nota) 
--juntament amb la informació de l'assignatura (nom, pla) i grau (nom) corresponent.
--Columnes: DNI alumne, any de convocatòria, nota, nom de l'assignatura, pla de l'assignatura, nom del grau.
select nota.dni_alumne as dni_alumne,
       nota.convocatoria as any_de_convocatoria,
       nota.nota as nota,
       assignatura.nom as nom_assignatura,
       assignatura.pla as pla_assignatura,
       grau.nom as nom_grau
  from nota
  join assignatura
on nota.id_assignatura = assignatura.id
  join grau
on assignatura.id_grau = grau.id;

--9)
--Retorna la nota mitjana de cada assignatura del grau "Informàtica", ordenant de menys nota a més.
--Columnes: nom de l'assignatura, nota mitjana
--Ordenació: nota mitjana, de menys a més

--select sum(avg(nota.nota))
select assignatura.nom,
       avg(nota.nota)
  from assignatura
  join grau
on assignatura.id_grau = grau.id
  join nota
on assignatura.id = nota.id_assignatura
 where grau.nom = 'Informàtica'
 group by assignatura.nom
 order by avg(nota.nota) asc;

--10)
--Retorna el salari combinat (sumat) de dels professors de cada grau. Si un grau no té
--assignatures o professors assignats a les seves assignatures, ha de sortir un 0.

--1 obtener todos los salarios. 1 salario 1 fila
--obtenemos todos las assignaturas del grado
select grau.nom,
       nvl(
          sum(professor.salari),
          0
       )
  from grau
  left join assignatura
on grau.id = assignatura.id_grau
  left join professor
on assignatura.dni_professor = professor.dni
 group by grau.nom;