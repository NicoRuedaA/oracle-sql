drop table pedido;
drop table cliente;
drop table comercial;

create table cliente (
   id        number primary key,
   nombre    varchar(100) not null,
   apellido1 varchar(100) not null,
   apellido2 varchar(100),
   ciudad    varchar(100),
   categoría number
);

create table comercial (
   id        number primary key,
   nombre    varchar(100) not null,
   apellido1 varchar(100) not null,
   apellido2 varchar(100),
   comision  float
);

create table pedido (
   id           number primary key,
   total        number not null,
   fecha        date,
   id_cliente   number not null,
   id_comercial number not null,
   foreign key ( id_cliente )
      references cliente ( id ),
   foreign key ( id_comercial )
      references comercial ( id )
);

insert into cliente values ( 1,
                             'Aarón',
                             'Rivero',
                             'Gómez',
                             'Almería',
                             100 );
insert into cliente values ( 2,
                             'Adela',
                             'Salas',
                             'Díaz',
                             'Granada',
                             200 );
insert into cliente values ( 3,
                             'Adolfo',
                             'Rubio',
                             'Flores',
                             'Sevilla',
                             null );
insert into cliente values ( 4,
                             'Adrián',
                             'Suárez',
                             null,
                             'Jaén',
                             300 );
insert into cliente values ( 5,
                             'Marcos',
                             'Loyola',
                             'Méndez',
                             'Almería',
                             200 );
insert into cliente values ( 6,
                             'María',
                             'Santana',
                             'Moreno',
                             'Cádiz',
                             100 );
insert into cliente values ( 7,
                             'Pilar',
                             'Ruiz',
                             null,
                             'Sevilla',
                             300 );
insert into cliente values ( 8,
                             'Pepe',
                             'Ruiz',
                             'Santana',
                             'Huelva',
                             200 );
insert into cliente values ( 9,
                             'Guillermo',
                             'López',
                             'Gómez',
                             'Granada',
                             225 );
insert into cliente values ( 10,
                             'Daniel',
                             'Santana',
                             'Loyola',
                             'Sevilla',
                             125 );

insert into comercial values ( 1,
                               'Daniel',
                               'Sáez',
                               'Vega',
                               0.15 );
insert into comercial values ( 2,
                               'Juan',
                               'Gómez',
                               'López',
                               0.13 );
insert into comercial values ( 3,
                               'Diego',
                               'Flores',
                               'Salas',
                               0.11 );
insert into comercial values ( 4,
                               'Marta',
                               'Herrera',
                               'Gil',
                               0.14 );
insert into comercial values ( 5,
                               'Antonio',
                               'Carretero',
                               'Ortega',
                               0.12 );
insert into comercial values ( 6,
                               'Manuel',
                               'Domínguez',
                               'Hernández',
                               0.13 );
insert into comercial values ( 7,
                               'Antonio',
                               'Vega',
                               'Hernández',
                               0.11 );
insert into comercial values ( 8,
                               'Alfredo',
                               'Ruiz',
                               'Flores',
                               0.05 );

insert into pedido values ( 1,
                            150.5,
                            date '2017-10-05',
                            5,
                            2 );
insert into pedido values ( 2,
                            270.65,
                            date '2016-09-10',
                            1,
                            5 );
insert into pedido values ( 3,
                            65.26,
                            date '2017-10-05',
                            2,
                            1 );
insert into pedido values ( 4,
                            110.5,
                            date '2016-08-17',
                            8,
                            3 );
insert into pedido values ( 5,
                            948.5,
                            date '2017-09-10',
                            5,
                            2 );
insert into pedido values ( 6,
                            2400.6,
                            date '2016-07-27',
                            7,
                            1 );
insert into pedido values ( 7,
                            5760,
                            date '2015-09-10',
                            2,
                            1 );
insert into pedido values ( 8,
                            1983.43,
                            date '2017-10-10',
                            4,
                            6 );
insert into pedido values ( 9,
                            2480.4,
                            date '2016-10-10',
                            8,
                            3 );
insert into pedido values ( 10,
                            250.45,
                            date '2015-06-27',
                            8,
                            2 );
insert into pedido values ( 11,
                            75.29,
                            date '2016-08-17',
                            3,
                            7 );
insert into pedido values ( 12,
                            3045.6,
                            date '2017-04-25',
                            2,
                            1 );
insert into pedido values ( 13,
                            545.75,
                            date '2019-01-25',
                            6,
                            1 );
insert into pedido values ( 14,
                            145.82,
                            date '2017-02-02',
                            6,
                            1 );
insert into pedido values ( 15,
                            370.85,
                            date '2019-03-11',
                            1,
                            5 );
insert into pedido values ( 16,
                            2389.23,
                            date '2019-03-11',
                            1,
                            5 );



select id,
       nombre,
       apellido1,
       apellido2
  from cliente;



select id_cliente
  from pedido;

select distinct c.id,
                c.nombre,
                c.apellido1,
                c.apellido2
  from cliente c
 inner join pedido p
on c.id = p.id_cliente
 order by c.apellido1,
          c.apellido2,
          c.nombre;



    -- 1. Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido.
    -- El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.

-- 2. Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.

-- 3. Devuelve un listado que solamente muestre los comerciales que no han realizado ningún pedido.

-- 4. Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.

-- 5. Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los datos de los pedidos y de los comerciales. El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.

-- 6. Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.

-- 7. Devuelve un listado con los clientes que no han realizado ningún pedido y de los comerciales que no han participado en ningún pedido. Ordene el listado alfabéticamente por los apellidos y el nombre. En en listado deberá diferenciar de algún modo los clientes y los comerciales.

-- 8. Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.

-- 9. Devuelve un listado con todos los comerciales junto con los datos de los pedidos que han realizado. Este listado también debe incluir los comerciales que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los comerciales.

-- 10. Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.

-- 11. Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.

-- 12. Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. Este listado también debe incluir los clientes que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los clientes.