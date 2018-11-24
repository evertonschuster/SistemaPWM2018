--CREATE DataBase IF NOT EXISTS sistemaspoo2;



CREATE TABLE IF NOT EXISTS Marca (
  idMarca SERIAL,
  descricao VARCHAR(45) NULL,
  PRIMARY KEY (idMarca));

CREATE TABLE IF NOT EXISTS Modelo (
  idModelo SERIAL,
  descricao VARCHAR(45) NULL,
  idMarca INT NOT NULL,
  PRIMARY KEY (idModelo),
  FOREIGN KEY (idMarca) REFERENCES Marca (idMarca));


CREATE TABLE IF NOT EXISTS Cliente (
	idCliente SERIAL,
	Nome varchar(255), 
	CPF varchar(15), 
	RG varchar(15),
	Email  varChar(255),
	primary key (idCLiente));


CREATE TABLE IF NOT EXISTS Veiculo (
	idVeiculo SERIAL,
	idModelo INT NOT NULL,
	nome VARCHAR(255) NULL,
	placa VARCHAR(45) NULL,
	chassis VARCHAR(45) NULL,
	idCliente INT NOT NULL,
	PRIMARY KEY (idVeiculo),
	FOREIGN KEY (IdModelo) REFERENCES Modelo (idModelo),
	FOREIGN KEY (IdCliente) REFERENCES Cliente (idCliente));



CREATE TABLE IF NOT EXISTS Servico (
	idServico SERIAL,
	descricao VARCHAR(45) NULL,
	valor DECIMAL(4) NULL,
	PRIMARY KEY (idServico));
  
CREATE TABLE IF NOT EXISTS Funcionario (
	idFuncionario SERIAL,
	Nome VARCHAR(255) NULL,
	CPF VARCHAR(45) NULL,
	RG VARCHAR(45) NULL,
	Email VARCHAR(45) NULL,
	Salario DECIMAL(4) NULL,
	PRIMARY KEY (idFuncionario));

  
CREATE TABLE IF NOT EXISTS Usuario (
  idUsuario SERIAL,
  nome VARCHAR(255) NULL,
  email VARCHAR(255) NULL,
  senha VARCHAR(255) NULL,
  perfil VARCHAR(255) NULL,
  PRIMARY KEY (idUsuario));
  
  create table os (
	idOs SERIAL,
	idVeiculo int,	
	idServico int ,
	idFuncionario int,
	quantidade int,
	valor DECIMAL(4),
	dataIncusao date,
	valorTotal DECIMAL(4),
	Status varChar(20),
	PRIMARY KEY (idOs),
	FOREIGN KEY (idVeiculo) REFERENCES Veiculo (idVeiculo),
	FOREIGN KEY (idServico) REFERENCES Servico (idServico),
	FOREIGN KEY (idFuncionario) REFERENCES Funcionario (idFuncionario)

	);
	
	
INSERT INTO cliente(
             nome, cpf, rg, email)
    VALUES ( 'Everton', '09088634971', '1234353', 'everto@asdasd.com');

INSERT INTO cliente(
             nome, cpf, rg, email)
    VALUES ( 'Jean', '09088632371', '1234353', 'jean@asdasd.com');

INSERT INTO cliente(
             nome, cpf, rg, email)
    VALUES ( 'matheus', '09128634971', '1234353', 'matheus@asdasd.com');

INSERT INTO cliente(
             nome, cpf, rg, email)
    VALUES ( 'aline', '09088123971', '1234353', 'aline@asdasd.com');