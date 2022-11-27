-- Criação do Banco de Dados para o cenário de Oficina --
create database oficina;
-- drop database oficina;
use oficina;

-- Tabela de Equipe
CREATE TABLE IF NOT EXISTS Equipe (
  idEquipe INT NOT NULL auto_increment,
  descricao VARCHAR(45) NOT NULL,
  PRIMARY KEY (idEquipe)
);

-- Tabela de Pessoa
CREATE TABLE IF NOT EXISTS Pessoa (
  idPessoa INT NOT NULL auto_increment,
  nome VARCHAR(45) NOT NULL,
  telefone VARCHAR(13) NOT NULL,
  email VARCHAR(45) NOT NULL,
  endereco VARCHAR(50) NOT NULL,
  PRIMARY KEY (idPessoa)
);


-- Tabela Cliente
CREATE TABLE IF NOT EXISTS Cliente (
  idCliente INT NOT NULL auto_increment,
  ativo BOOL NOT NULL default True,
  credito FLOAT NOT NULL default 0,
  pessoa_idPessoa INT NOT NULL,
  documento VARCHAR(11) NOT NULL,
  PRIMARY KEY (idCliente),
  constraint fk_cliente_pessoa foreign key (pessoa_idPessoa) references Pessoa(idPessoa)
);

-- Tabela Veiculo
CREATE TABLE IF NOT EXISTS Veiculo (
  idVeiculo INT NOT NULL auto_increment,
  placa VARCHAR(10) NOT NULL,
  marca VARCHAR(45) NOT NULL,
  modelo VARCHAR(45) NOT NULL,
  cor VARCHAR(45) NOT NULL,
  ano CHAR(4) NOT NULL,
  equipe_idEquipe INT NOT NULL,
  cliente_idCliente INT NOT NULL,
  PRIMARY KEY (idVeiculo),
  constraint fk_veiculo_equipe foreign key (equipe_idEquipe) references Equipe(idEquipe),
  constraint fk_veiculo_cliente foreign key (cliente_idCliente) references Cliente(idCliente)
);

-- Tabela Funcionario
CREATE TABLE IF NOT EXISTS Funcionario (
  idFuncionario INT NOT NULL auto_increment,
  Pessoa_idPessoa INT NOT NULL,
  matricula VARCHAR(45) NOT NULL,
  data_admissao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  data_demissao DATE NULL,
  cargo ENUM('Gerente','Supervisor','Consultor','Mecânico','Recepcionista','Estagiario') NOT NULL,
  departamento ENUM('Administratção','Financeiro','Vendas','Oficina','RH','Marketing') NOT NULL default 'Administratção',
  PRIMARY KEY (idFuncionario),
  constraint fk_funcionario_pessoa foreign key (Pessoa_idPessoa) references Pessoa(idPessoa)  
);

-- Tabela Mecanico
CREATE TABLE IF NOT EXISTS Mecanico (
  idMecanico INT NOT NULL auto_increment,
  codigo VARCHAR(45) NOT NULL,
  especialidade ENUM('Reparador de Sistemas','Eletica','Audio','Customizador','Estetica','Funileiro','Martelinho de Ouro','Pintura') NOT NULL,
  equipe_idEquipe INT NOT NULL,
  funcionario_idFuncionario INT NOT NULL,
  PRIMARY KEY (idMecanico),
  constraint fk_mecanico_equipe foreign key (equipe_idEquipe) references Equipe(idEquipe),
  constraint fk_mecanico_funcionario foreign key (funcionario_idFuncionario) references Funcionario(idFuncionario) 
);

-- Tabela de Servicos
CREATE TABLE IF NOT EXISTS Servicos (
  idServicos INT NOT NULL auto_increment,
  descricao VARCHAR(45) NOT NULL,
  qtd_horas INT NOT NULL default 1,
  PRIMARY KEY (idServicos)
);

-- Tabela OS
CREATE TABLE IF NOT EXISTS OS (
  idOS INT NOT NULL auto_increment,
  dataEmissao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  cliente_idCliente INT NOT NULL,
  equipe_idEquipe INT NOT NULL,
  statusOS ENUM('Pendente','Aprovada','Em andamento','avaliação','Liberado','Cancelada','Finalizada') NOT NULL default 'Pendente',
  vlr_pagar FLOAT NOT NULL default 0,
  dataEntrega DATETIME NOT NULL,
  PRIMARY KEY (idOS, cliente_idCliente),
  constraint fk_os_equipe foreign key (equipe_idEquipe) references Equipe(idEquipe),
  constraint fk_os_cliente foreign key (cliente_idCliente) references Cliente(idCliente)
);

-- Tabela de Mao de Obra
CREATE TABLE IF NOT EXISTS Mao_de_obra (
  idMao_de_obra INT NOT NULL auto_increment,
  servicos_idServicos INT NOT NULL,
  descricao VARCHAR(30) NOT NULL,
  valor FLOAT NOT NULL default 650.00,
  PRIMARY KEY (idMao_de_obra),
  constraint fk_mao_de_obra_servicos foreign key (servicos_idServicos) references Servicos(idServicos)
);

-- Tabela Peças
CREATE TABLE IF NOT EXISTS Pecas (
  idPecas INT NOT NULL auto_increment,
  codigo VARCHAR(45) NOT NULL,
  nome VARCHAR(45) NOT NULL,
  valor FLOAT NOT NULL default 0,
  PRIMARY KEY (idPecas)
);

-- Tabela Servicos_OS
CREATE TABLE IF NOT EXISTS Servicos_OS (
  OS_idOS INT NOT NULL,
  servicos_idServicos INT NOT NULL,
  qtd INT NOT NULL default 1,
  valor FLOAT NULL default 0,
  PRIMARY KEY (OS_idOS, servicos_idServicos),
  constraint fk_servicos_os_os foreign key (OS_idOS) references OS(idOS),
  constraint fk_servicos_os_servicos foreign key (servicos_idServicos) references Servicos(idServicos)
);

-- Tabela Pecas_OS
CREATE TABLE IF NOT EXISTS Pecas_OS (
  OS_idOS INT NOT NULL,
  pecas_idPecas INT NOT NULL,
  qtd INT NOT NULL default 1,
  valor FLOAT NOT NULL default 0,
  PRIMARY KEY (OS_idOS, pecas_idPecas),
  constraint fk_pecas_os_os foreign key (OS_idOS) references OS(idOS),
  constraint fk_pecas_os_pecas foreign key (pecas_idPecas) references Pecas(idPecas)
);

-- Tabela Fornecedor
CREATE TABLE IF NOT EXISTS Fornecedor (
  idFornecedor INT NOT NULL auto_increment,
  pessoa_idPessoa INT NOT NULL,
  ativo BOOL NOT NULL default True,
  cnpj VARCHAR(14) NOT NULL,
  razao_social VARCHAR(45) NOT NULL,
  PRIMARY KEY (idFornecedor),
  constraint unique_cnpj unique (cnpj),
  constraint unique_razao_social unique (razao_social),
  constraint fk_fornecedor_pessoa foreign key (pessoa_idPessoa) references Pessoa(idPessoa)
);

-- Tabela Pecas_Fornecedor
CREATE TABLE IF NOT EXISTS Pecas_Fornecidas (
  fornecedor_idFornecedor INT NOT NULL,
  pecas_idPecas INT NOT NULL,
  qtd INT NOT NULL default 5,
  PRIMARY KEY (fornecedor_idFornecedor, pecas_idPecas),
  constraint fk_pecas_fornecedor_fornecedor foreign key (fornecedor_idFornecedor) references Fornecedor(idFornecedor),
  constraint fk_pecas_fornecedor_pecas foreign key (pecas_idPecas) references Pecas(idPecas)
);

show tables;

show databases;
use information_schema;
show tables;
desc table_constraints;
desc referential_constraints;
select * from referential_constraints;
select * from referential_constraints where constraint_schema ='oficina';
