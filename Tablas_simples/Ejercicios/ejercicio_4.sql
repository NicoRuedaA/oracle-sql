select extract(day from sysdate) as dia,
       extract(month from sysdate) as mes,
       extract(year from sysdate) as "any"
  from dual;

select extract(day from sysdate) as dia,
       extract(month from sysdate) as mes,
       extract(year from sysdate) + 1 as "any"
  from dual;

select ceil months_between(
   sysdate,
   to_date('25/02/2022',
               'DD/MM/YYYY')
) as mesos_passats
  
  from dual ;