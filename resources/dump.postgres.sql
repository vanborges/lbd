CREATE TABLE departamento (
    dnome varchar(255) NOT NULL,
    dnumero integer NOT NULL,
    cpf_gerente varchar(11) NULL,
    data_inicio_gerente date
);

CREATE TABLE dependente (
    fcpf varchar(11) NOT NULL,
    nome_dependente varchar(255) NOT NULL,
    sexo character(1),
    datanasc date,
    parentesco varchar(255),
    CONSTRAINT dependente_sexo_check CHECK (sexo IN ('F', 'M'))
);

CREATE TABLE depto_localizacoes (
    dnumero integer NOT NULL,
    dlocal varchar(255) NOT NULL
);

CREATE TABLE funcionario (
    pnome varchar(255) NOT NULL,
    minicial character(1),
    unome varchar(255),
    cpf varchar(11),
    datanasc date,
    endereco varchar(255),
    sexo character(2),
    salario numeric NOT NULL,
    cpf_supervisor varchar(11) NULL,
    dnr integer,
    CONSTRAINT funcionario_sexo_check CHECK (sexo IN ('F', 'M'))
);

CREATE TABLE projeto (
    projnome varchar(255),
    projnumero integer NOT NULL,
    projlocal varchar(255),
    dnum integer NULL
);

CREATE TABLE trabalha_em (
    fcpf varchar(11) NOT NULL,
    pnr integer NOT NULL,
    horas real
);


-- funcionario
INSERT INTO funcionario (pnome, minicial, unome, cpf, datanasc, endereco, sexo, salario, cpf_supervisor, dnr) VALUES ('James', 'E', 'Borg', '888665555', '1937-11-10', '450 Stone, Houston, TX', 'M' , 55000, '12345678', 1);
INSERT INTO funcionario (pnome, minicial, unome, cpf, datanasc, endereco, sexo, salario, cpf_supervisor, dnr) VALUES ('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291 Berry, Bellaire, TX', 'F' , 43000, '888665555', 4);
INSERT INTO funcionario (pnome, minicial, unome, cpf, datanasc, endereco, sexo, salario, cpf_supervisor, dnr) VALUES ('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638 Voss, Housto, TX', 'M' , 40000, '888665555', 5);
INSERT INTO funcionario (pnome, minicial, unome, cpf, datanasc, endereco, sexo, salario, cpf_supervisor, dnr) VALUES ('John', 'B', 'Smith', '12345678', '1965-01-09', '731 Fondren, Houston, TX', 'M' , 30000, '333445555', 5);
INSERT INTO funcionario (pnome, minicial, unome, cpf, datanasc, endereco, sexo, salario, cpf_supervisor, dnr) VALUES ('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975 Fire, Oak Humble, TX', 'M' , 38000, '333445555', 5);
INSERT INTO funcionario (pnome, minicial, unome, cpf, datanasc, endereco, sexo, salario, cpf_supervisor, dnr) VALUES ('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631 Rice, Houston, TX', 'F' , 25000, '333445555', 5);
INSERT INTO funcionario (pnome, minicial, unome, cpf, datanasc, endereco, sexo, salario, cpf_supervisor, dnr) VALUES ('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980 Dallas, Houston, TX', 'M' , 25000, '987654321', 4);
INSERT INTO funcionario (pnome, minicial, unome, cpf, datanasc, endereco, sexo, salario, cpf_supervisor, dnr) VALUES ('Robert', 'F', 'Scott', '943775543', '2042-06-21', '2365 Newcastle Rd, Bellaire, TX', 'M' , 58000, '888665555', 1);
INSERT INTO funcionario (pnome, minicial, unome, cpf, datanasc, endereco, sexo, salario, cpf_supervisor, dnr) VALUES ('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19', '3321 Castle, Spring, TX', 'F' , 25000, '943775543', 4);
INSERT INTO funcionario (pnome, minicial, unome, cpf, datanasc, endereco, sexo, salario, cpf_supervisor, dnr) VALUES ('Vanessa', 'B', 'Borg', '911887776', '1965-01-17', '3321 Castle, Spring, TX', NULL , 10000, '943775543', 4);
INSERT INTO funcionario (pnome, minicial, unome, cpf, datanasc, endereco, sexo, salario, cpf_supervisor, dnr) VALUES ('Asdrubal', 'B', 'Asd', '123456789', '1965-01-18', '3321 Castle, Spring, TX', 'M' , 5000, NULL, 4);
-- departamento
INSERT INTO departamento (dnome, dnumero, cpf_gerente, data_inicio_gerente) VALUES ('Pesquisa', 3, '333445555','1988-05-22');
INSERT INTO departamento (dnome, dnumero, cpf_gerente, data_inicio_gerente) VALUES ('Administracao',4, '987654321','1995-01-01');
INSERT INTO departamento (dnome, dnumero, cpf_gerente, data_inicio_gerente) VALUES ('Sede_administrativa',1, '888665555','1981-06-19');
INSERT INTO departamento (dnome, dnumero, cpf_gerente, data_inicio_gerente) VALUES ('Inovacao',7, NULL, '1980-06-30');
INSERT INTO departamento (dnome, dnumero, cpf_gerente, data_inicio_gerente) VALUES ('Computacao',5, NULL, '1990-06-30');

-- dependente
INSERT INTO dependente (fcpf, nome_dependente, sexo, datanasc, parentesco) VALUES ('333445555','Alice','F','1986-04-05','FILHA');
INSERT INTO dependente (fcpf, nome_dependente, sexo, datanasc, parentesco) VALUES ('333445555','Theodore','M','1983-10-25','FILHO');
INSERT INTO dependente (fcpf, nome_dependente, sexo, datanasc, parentesco) VALUES ('333445555','Joy','F','1958-05-03','CONJUGE');
INSERT INTO dependente (fcpf, nome_dependente, sexo, datanasc, parentesco) VALUES ('123456789','Michael','M','1988-01-04','FILHO');
INSERT INTO dependente (fcpf, nome_dependente, sexo, datanasc, parentesco) VALUES ('123456789','Alice','F','1988-12-30','FILHA');
INSERT INTO dependente (fcpf, nome_dependente, sexo, datanasc, parentesco) VALUES ('123456789','Elizabeth','F','1967-05-05','CONJUGE');
INSERT INTO dependente (fcpf, nome_dependente, sexo, datanasc, parentesco) VALUES ('453453453','John','M','2060-12-12','CONJUGE');

-- depto_localizacoes
INSERT INTO depto_localizacoes (dnumero, dlocal) VALUES (1, 'Houston');
INSERT INTO depto_localizacoes (dnumero, dlocal) VALUES (4, 'Stanford');
INSERT INTO depto_localizacoes (dnumero, dlocal) VALUES (5, 'Bellaire');
INSERT INTO depto_localizacoes (dnumero, dlocal) VALUES (5, 'Sugarland');
INSERT INTO depto_localizacoes (dnumero, dlocal) VALUES (5, 'Houston');


-- projeto
INSERT INTO projeto (projnome, projnumero, projlocal, dnum) VALUES ('Projeto 1', 1, 'Bellaire', 5);
INSERT INTO projeto (projnome, projnumero, projlocal, dnum) VALUES ('Projeto 2', 2, 'Sugarland', 5);
INSERT INTO projeto (projnome, projnumero, projlocal, dnum) VALUES ('Projeto 3', 3, 'Houston', 5);
INSERT INTO projeto (projnome, projnumero, projlocal, dnum) VALUES ('Automatizacao', 10, 'Stanford', 4);
INSERT INTO projeto (projnome, projnumero, projlocal, dnum) VALUES ('Reorganizacao', 20, 'Houston', 1);
INSERT INTO projeto (projnome, projnumero, projlocal, dnum) VALUES ('Novos_Beneficios', 30, 'Stanford', 4);


-- trabalha_em
INSERT INTO trabalha_em (fcpf, pnr, horas) VALUES ('123456789', 1, 32.5);
INSERT INTO trabalha_em (fcpf, pnr, horas) VALUES ('123456789', 2, 7.5);
INSERT INTO trabalha_em (fcpf, pnr, horas) VALUES ('666884444', 3, 40);
INSERT INTO trabalha_em (fcpf, pnr, horas) VALUES ('453453453', 1, 20);
INSERT INTO trabalha_em (fcpf, pnr, horas) VALUES ('453453453', 2, 20);
INSERT INTO trabalha_em (fcpf, pnr, horas) VALUES ('999887777', 30, 30);
INSERT INTO trabalha_em (fcpf, pnr, horas) VALUES ('987987987', 10, 35);
INSERT INTO trabalha_em (fcpf, pnr, horas) VALUES ('987987987', 30, 5);
INSERT INTO trabalha_em (fcpf, pnr, horas) VALUES ('987654321', 30, 20);
INSERT INTO trabalha_em (fcpf, pnr, horas) VALUES ('987654321', 20, 15);
INSERT INTO trabalha_em (fcpf, pnr, horas) VALUES ('888665555', 20, 5);
INSERT INTO trabalha_em (fcpf, pnr, horas) VALUES ('999887777', 10, 5);



ALTER TABLE departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (dnumero);

ALTER TABLE departamento ADD CONSTRAINT cpf_gerente_unique UNIQUE (cpf_gerente);

ALTER TABLE dependente
    ADD CONSTRAINT dependente_pkey PRIMARY KEY (fcpf, nome_dependente);

ALTER TABLE depto_localizacoes
    ADD CONSTRAINT depto_localizacoes_pkey PRIMARY KEY (dnumero, dlocal);

ALTER TABLE funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (cpf);

ALTER TABLE projeto
    ADD CONSTRAINT projeto_pkey PRIMARY KEY (projnumero);

ALTER TABLE trabalha_em
    ADD CONSTRAINT trabalha_em_pkey PRIMARY KEY (fcpf, pnr);

ALTER TABLE departamento
    ADD CONSTRAINT gerente FOREIGN KEY (cpf_gerente) REFERENCES funcionario(cpf);

ALTER TABLE depto_localizacoes
    ADD CONSTRAINT dnumerolocal FOREIGN KEY (dnumero) REFERENCES departamento(dnumero);

ALTER TABLE projeto
    ADD CONSTRAINT dnumprojeto FOREIGN KEY (dnum) REFERENCES departamento(dnumero);

ALTER TABLE funcionario
    ADD CONSTRAINT numerodepto FOREIGN KEY (dnr) REFERENCES departamento(dnumero);

ALTER TABLE trabalha_em
    ADD CONSTRAINT numeroprojeto FOREIGN KEY (pnr) REFERENCES projeto(projnumero);

ALTER TABLE trabalha_em
    ADD CONSTRAINT cpftrabalhaem FOREIGN KEY (fcpf) REFERENCES funcionario(cpf);

ALTER TABLE dependente
    ADD CONSTRAINT cpffuncionario FOREIGN KEY (fcpf) REFERENCES funcionario(cpf);

ALTER TABLE funcionario
    ADD CONSTRAINT supervisor FOREIGN KEY (cpf_supervisor) REFERENCES funcionario(cpf);
