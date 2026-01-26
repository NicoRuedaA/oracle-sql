--DROPS
drop table accident_vehicle;
drop table multa;
drop table accident;
drop table vehicle;
drop table persona;

create table persona (
   dni         varchar2(9) primary key,
   nom         varchar2(50),
   llinatges   varchar2(100),
   adreca      varchar2(100),
   codi_postal varchar(5) check ( codi_postal != '07430' ),
   telefon     number(9),
   data_alta   date
);

create table vehicle (
   matricula     varchar2(7) primary key,
   marca         varchar2(30),
   model_vehicle varchar2(30),
      check ( substr(
         model_vehicle,
         1,
         4
      ) != 'RB19' ),
   dni           varchar2(9) not null,
   foreign key ( dni )
      references persona ( dni )
);

create table multa (
   codi              number generated as identity primary key,
   data_i_hora       date,
   lloc              varchar2(100),
   import_multa      number(10,2) check ( import_multa >= 100.00 ),
   matricula_vehicle varchar2(7),
   foreign key ( matricula_vehicle )
      references vehicle ( matricula )
);

create table accident (
   codi        number generated as identity primary key,
   lloc        varchar2(100),
   data_i_hora date
);

create table accident_vehicle (
   matricula_vehicle    varchar2(7),
   codi_accident        number not null,
   informe_participacio varchar2(500),
   primary key ( matricula_vehicle,
                 codi_accident ),
   foreign key ( matricula_vehicle )
      references vehicle ( matricula ),
   foreign key ( codi_accident )
      references accident ( codi )
);