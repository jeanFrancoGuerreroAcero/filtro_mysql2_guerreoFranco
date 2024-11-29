use universidad;

-- 1.Encuentra el profesor que ha impartido más asignaturas en el último año académico.
select p.id, p.nombre, count(a.id) from profesor p inner join asignatura a on p.id = a.id_profesor group by 1 order by 3 desc limit 1;

-- 2.Lista los cinco departamentos con mayor cantidad de asignaturas asignadas.
select distinct d.id, d.nombre from departamento d inner join profesor p on p.id_departamento = d.id inner join asignatura a on p.id = a.id_profesor;

-- 3.Obtén el total de alumnos y docentes por departamento.
select d.nombre, count(a.id) as cantidad_alumnos, count(p.id) as cantidad_profesores from departamento d inner join profesor p on d.id = p.id_departamento left join alumno a on a.id = d.id group by 1;

-- 4.Calcula el número total de alumnos matriculados en asignaturas de un género específico en un semestre determinado.
select count(a.id) from alumno a left join asignatura asig on a.id = asig.id where asig.tipo = 'basica' and asig.cuatrimestre = 1;

-- 5.Encuentra los alumnos que han cursado todas las asignaturas de un grado específico
select a.id, a.nombre, apellido1 from alumno a left join asignatura asig on a.id = asig.id inner join grado g on asig.id_grado = g.id where g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

-- 6.Lista los tres grados con mayor número de asignaturas cursadas en el último semestre.
select distinct g.id, g.nombre, asig.nombre, count(g.id) from grado g inner join asignatura asig on g.id = asig.id_grado where asig.cuatrimestre = '2' group by 1,3 order by 4 desc limit 3;

-- 7.Muestra los cinco profesores con menos asignaturas impartidas en el último año académico.
select p.id, p.nif,p.nombre, p.apellido1, apellido2, p.ciudad, count(p.id) as cantidad_asignaturas from profesor p inner join asignatura a on p.id = a.id_profesor where a.cuatrimestre = 2 group by 1;

-- 8.Calcula el promedio de edad de los alumnos al momento de su primera matrícula.
-- select avg(fecha_nacimiento), nombre from alumno group by 2;

-- 9.Encuentra los cinco profesores que han impartido más clases de un mismo grado.
select p.id, p.nombre, g.nombre, count(p.id) from profesor p inner join asignatura a on a.id_profesor = p.id inner join grado g on a.id_grado = g.id group by 1, 3;

-- 10.Genera un informe con los alumnos que han cursado más de 10 asignaturas en el último año.
select a.id, a.nombre from alumno a inner join alumno_se_matricula_asignatura alm on a.id = alm.id_alumno inner join curso_escolar c on alm.id_curso_escolar = c.id ;
-- 11. Calcula el promedio de créditos de las asignaturas por grado.
select g.nombre, avg(a.creditos) as promedio_creditos from asignatura a inner join grado g on a.id_grado = g.id group by 1;
  
-- 12.Lista las cinco asignaturas más largas (en horas) impartidas en el último semestre. "no existen horas en la base de datos"
-- 13.Muestra los alumnos que han cursado más asignaturas de un género específico.
select a.id, a.nif, a.nombre, a.apellido1, asi.nombre, count(a.id) as cantidad_alumnos from alumno a right join asignatura asi on a.id = asi.id where asi.nombre = 'Planificación y Gestión de Proyectos Informáticos' group by 1, 5 order by 6 desc;

-- 14.Encuentra la cantidad total de horas cursadas por cada alumno en el último semestre. "no existen horas en la base de datos"
-- 15. Muestra el número de asignaturas impartidas diariamente en cada mes del último trimestre.
-- 16.Calcula el total de asignaturas impartidas por cada profesor en el último semestre.
select count(a.id), p.nombre from asignatura a inner join profesor p on a.id = p.id group by 2;
-- 17.Encuentra al alumno con la matrícula más reciente.
-- 18.Lista los cinco grados con mayor número de alumnos matriculados durante los últimos tres meses.
-- 19.Obtén la cantidad de asignaturas cursadas por cada alumno en el último semestre.
-- 20.Lista los profesores que no han impartido clases en el último año académico.
select p.id, p.nombre from profesor p right join curso_escolar c on p.id = c.id where c.anyo_fin != '2018';