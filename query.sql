/*Explorando o Banco de Dados Escola*/

/*Contar a quantidade de registros das tabelas*/
SELECT count(rm) AS qtde_alunos FROM alunos;
SELECT count(nome) AS qtde_cursos FROM cursos;
SELECT count(cod_disciplina) 
    AS qtde_disciplina FROM disciplinas;


/*Filtrar os alunos nascidos no primeiro semestre*/
SELECT * FROM alunos
WHERE data_nascimento 
BETWEEN '2005-01-01' AND '2005-06-01';

/*Filtrar os alunos por parte do nome*/
SELECT email FROM alunos
WHERE email LIKE '%silva%';

/*Filtrar as disciplinas por cod_curso*/
SELECT * FROM disciplinas 
WHERE cod_curso = 'DS';

/*Contar a qtde de disciplinas por cod_curso*/
SELECT count(nome) FROM disciplinas
WHERE cod_curso = 'DS'

/*Filtrar disciplinas com carga horária maior ou igual a 100*/
SELECT * FROM disciplinas
WHERE carga_horaria >= 100;

