BEGIN
   FOR t IN (
      SELECT table_name
      FROM user_tables
      WHERE table_name IN ('NOMINA', 'OCUPA', 'EMPLEAT', 'PLAZA', 'TIPUSDEPLACA')
   ) LOOP
      EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS';
   END LOOP;
END;

/ 

create table tipusdeplaca (
   nom    varchar2(100) primary key,
   funcio varchar2(100) not null
);
create table plaza (
   codi                   number generated as identity primary key,
   nom                    varchar2(100) not null,
   salari                 float not null,
   codiplacasupervisora number,
   informesupervisio     varchar2(100),
   tipusdeplaca     varchar2(100) not null,
   foreign key ( codiplacasupervisora )
      references plaza ( codi ),
   foreign key ( tipusdeplaca )
      references tipusdeplaca ( nom )
);

create table empleat (
   nss       number primary key,
   nom       varchar2(100) not null,
   llinatges varchar2(100) not null,
   email     varchar2(100),
   iban      varchar2(100) unique not null,
   constraint restriccionibanespannol check ( iban like 'ES%' )
);
create table ocupa (
   nssempleat number not null,
   codiplaca  number not null,
   datainici  date not null,
   datafi     date,
   primary key ( nssempleat,
                 codiplaca ),
   foreign key ( nssempleat )
      references empleat ( nss ),
   foreign key ( codiplaca )
      references plaza ( codi )
);
create table nomina (
   id           number generated as identity primary key,
   ibanpagament varchar2(100) not null,
   importnomina number not null,
   nssempleat   number not null,
   codiplaca    number not null,
      foreign key ( nssempleat,
                    codiplaca )
         references ocupa ( nssempleat,
                            codiplaca )
);

