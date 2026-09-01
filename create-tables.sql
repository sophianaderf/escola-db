-- Active: 1788283803189@@127.0.0.1@5432@escola
CREATE TABLE IF NOT EXISTS "alunos" (
	"rm" VARCHAR(255) NOT NULL,
	"data_nascimento" DATE NOT NULL,
	"email" VARCHAR(100) NOT NULL UNIQUE,
	PRIMARY KEY("rm")
);

CREATE TABLE IF NOT EXISTS "cursos" (
	"cod_curso" VARCHAR(255) NOT NULL,
	"nome" VARCHAR(255) NOT NULL,
	"qtde_semestres" INTEGER NOT NULL,
	PRIMARY KEY("cod_curso")
);

CREATE TABLE IF NOT EXISTS "disciplinas" (
	"cod_disciplina" VARCHAR(255) NOT NULL,
	"nome" VARCHAR(100) NOT NULL,
	"carga_horaria" INTEGER NOT NULL,
	"cod_curso" VARCHAR(255) NOT NULL,
	PRIMARY KEY("cod_disciplina")
);

CREATE TABLE IF NOT EXISTS "turmas" (
	"cod_turma" VARCHAR(255) NOT NULL,
	"ano" INTEGER NOT NULL,
	"cod_curso" VARCHAR(255) NOT NULL,
	PRIMARY KEY("cod_turma")
);

CREATE TABLE IF NOT EXISTS "professores" (
	"ni_professor" VARCHAR(255) NOT NULL,
	"nome" VARCHAR(100) NOT NULL,
	"email" VARCHAR(255) NOT NULL,
	PRIMARY KEY("ni_professor")
);

CREATE TABLE IF NOT EXISTS "especialidades" (
	"cod_especialidade" VARCHAR(255) NOT NULL,
	"descricao" TEXT NOT NULL,
	"ni_professor" VARCHAR(255) NOT NULL,
	PRIMARY KEY("cod_especialidade")
);

CREATE TABLE IF NOT EXISTS "professores_disciplinas" (
	"ni_professor" VARCHAR(255) NOT NULL,
	"cod_disciplina" VARCHAR(255) NOT NULL,
	PRIMARY KEY("ni_professor", "cod_disciplina")
);

CREATE TABLE IF NOT EXISTS "alunos_turmas" (
	"rm_aluno" VARCHAR(255) NOT NULL,
	"cod_turma" VARCHAR(255) NOT NULL,
	PRIMARY KEY("rm_aluno", "cod_turma")
);

CREATE TABLE IF NOT EXISTS "notas" (
	"rm_aluno" VARCHAR(255) NOT NULL,
	"cod_turma" VARCHAR(255) NOT NULL,
	"cod_disciplina" VARCHAR(255) NOT NULL,
	"ano" INTEGER NOT NULL,
	"semestre" INTEGER NOT NULL,
	"nota" DECIMAL NOT NULL,
	PRIMARY KEY("rm_aluno", "cod_turma", "cod_disciplina")
);

ALTER TABLE "disciplinas"
ADD FOREIGN KEY("cod_curso") REFERENCES "cursos"("cod_curso")
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE "turmas"
ADD FOREIGN KEY("cod_curso") REFERENCES "cursos"("cod_curso")
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE "especialidades"
ADD FOREIGN KEY("ni_professor") REFERENCES "professores"("ni_professor")
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE "professores_disciplinas"
ADD FOREIGN KEY("ni_professor") REFERENCES "professores"("ni_professor")
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE "professores_disciplinas"
ADD FOREIGN KEY("cod_disciplina") REFERENCES "disciplinas"("cod_disciplina")
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE "alunos_turmas"
ADD FOREIGN KEY("rm_aluno") REFERENCES "alunos"("rm")
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE "alunos_turmas"
ADD FOREIGN KEY("cod_turma") REFERENCES "turmas"("cod_turma")
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE "notas"
ADD FOREIGN KEY("rm_aluno") REFERENCES "alunos"("rm")
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE "notas"
ADD FOREIGN KEY("cod_turma") REFERENCES "turmas"("cod_turma")
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE "notas"
ADD FOREIGN KEY("cod_disciplina") REFERENCES "disciplinas"("cod_disciplina")
ON UPDATE NO ACTION ON DELETE NO ACTION;