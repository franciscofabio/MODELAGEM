-- Criação do Banco de Dados para o cenário de Oficina --
create database oficina;
-- drop database oficina;
use oficina;

CREATE TABLE IF NOT EXISTS `mydb`.`Equipe` (
  `idEquipe` INT NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEquipe`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pessoa` (
  `idPessoa` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPessoa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL,
  `Ativo` TINYINT NOT NULL,
  `credito` FLOAT NOT NULL,
  `Pessoa_idPessoa` INT NOT NULL,
  `documento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_Cliente_Pessoa1_idx` (`Pessoa_idPessoa` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Pessoa1`
    FOREIGN KEY (`Pessoa_idPessoa`)
    REFERENCES `mydb`.`Pessoa` (`idPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Veiculo` (
  `idVeiculo` INT NOT NULL,
  `Placa` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `cor` VARCHAR(45) NOT NULL,
  `Equipe_idEquipe` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idVeiculo`, `Equipe_idEquipe`, `Cliente_idCliente`),
  INDEX `fk_Veiculo_Equipe1_idx` (`Equipe_idEquipe` ASC) VISIBLE,
  INDEX `fk_Veiculo_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Veiculo_Equipe1`
    FOREIGN KEY (`Equipe_idEquipe`)
    REFERENCES `mydb`.`Equipe` (`idEquipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Veiculo_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Funcionario` (
  `idFuncionario` INT NOT NULL,
  `matricula` VARCHAR(45) NOT NULL,
  `data_admissao` DATETIME NOT NULL,
  `data_demissao` DATETIME NULL,
  `cargo` VARCHAR(45) NOT NULL,
  `departamento` VARCHAR(45) NOT NULL,
  `Pessoa_idPessoa` INT NOT NULL,
  PRIMARY KEY (`idFuncionario`),
  INDEX `fk_Funcionario_Pessoa1_idx` (`Pessoa_idPessoa` ASC) VISIBLE,
  CONSTRAINT `fk_Funcionario_Pessoa1`
    FOREIGN KEY (`Pessoa_idPessoa`)
    REFERENCES `mydb`.`Pessoa` (`idPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Mecanico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mecanico` (
  `idMecanico` INT NOT NULL,
  `codigo` VARCHAR(45) NOT NULL,
  `especialidade` VARCHAR(45) NOT NULL,
  `Equipe_idEquipe` INT NOT NULL,
  `Funcionario_idFuncionario` INT NOT NULL,
  PRIMARY KEY (`idMecanico`, `Equipe_idEquipe`),
  INDEX `fk_Mecanico_Equipe1_idx` (`Equipe_idEquipe` ASC) VISIBLE,
  INDEX `fk_Mecanico_Funcionario1_idx` (`Funcionario_idFuncionario` ASC) VISIBLE,
  CONSTRAINT `fk_Mecanico_Equipe1`
    FOREIGN KEY (`Equipe_idEquipe`)
    REFERENCES `mydb`.`Equipe` (`idEquipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mecanico_Funcionario1`
    FOREIGN KEY (`Funcionario_idFuncionario`)
    REFERENCES `mydb`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Servicos` (
  `idServicos` INT NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `qtd_horas` INT NOT NULL,
  PRIMARY KEY (`idServicos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OS` (
  `idOS` INT NOT NULL,
  `DataEmissao` DATETIME NOT NULL,
  `Equipe_idEquipe` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Status` TINYINT NOT NULL,
  `vlr_servico` FLOAT NOT NULL,
  `vlr_pecas` FLOAT NOT NULL,
  `vlr_pagar` FLOAT NOT NULL,
  `DataEntrega` DATETIME NOT NULL,
  PRIMARY KEY (`idOS`, `Equipe_idEquipe`, `Cliente_idCliente`),
  INDEX `fk_OS_Equipe1_idx` (`Equipe_idEquipe` ASC) VISIBLE,
  INDEX `fk_OS_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_OS_Equipe1`
    FOREIGN KEY (`Equipe_idEquipe`)
    REFERENCES `mydb`.`Equipe` (`idEquipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OS_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Mao_de_obra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mao_de_obra` (
  `idMao_de_obra` INT NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `valor` FLOAT NOT NULL,
  `Servicos_idServicos` INT NOT NULL,
  PRIMARY KEY (`idMao_de_obra`, `Servicos_idServicos`),
  INDEX `fk_Mao_de_obra_Servicos1_idx` (`Servicos_idServicos` ASC) VISIBLE,
  CONSTRAINT `fk_Mao_de_obra_Servicos1`
    FOREIGN KEY (`Servicos_idServicos`)
    REFERENCES `mydb`.`Servicos` (`idServicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pecas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pecas` (
  `idPecas` INT NOT NULL,
  `codigo` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `valor` VARCHAR(45) NULL,
  PRIMARY KEY (`idPecas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Servicos_OS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Servicos_OS` (
  `OS_idOS` INT NOT NULL,
  `Servicos_idServicos` INT NOT NULL,
  `valor` FLOAT NULL,
  PRIMARY KEY (`OS_idOS`, `Servicos_idServicos`),
  INDEX `fk_OS_has_Servicos_Servicos1_idx` (`Servicos_idServicos` ASC) VISIBLE,
  INDEX `fk_OS_has_Servicos_OS1_idx` (`OS_idOS` ASC) VISIBLE,
  CONSTRAINT `fk_OS_has_Servicos_OS1`
    FOREIGN KEY (`OS_idOS`)
    REFERENCES `mydb`.`OS` (`idOS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OS_has_Servicos_Servicos1`
    FOREIGN KEY (`Servicos_idServicos`)
    REFERENCES `mydb`.`Servicos` (`idServicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pecas_OS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pecas_OS` (
  `OS_idOS` INT NOT NULL,
  `OS_Equipe_idEquipe` INT NOT NULL,
  `Pecas_idPecas` INT NOT NULL,
  `qtd` INT NOT NULL,
  `valor` FLOAT NOT NULL,
  PRIMARY KEY (`OS_idOS`, `OS_Equipe_idEquipe`, `Pecas_idPecas`),
  INDEX `fk_OS_has_Pecas_Pecas1_idx` (`Pecas_idPecas` ASC) VISIBLE,
  INDEX `fk_OS_has_Pecas_OS1_idx` (`OS_idOS` ASC, `OS_Equipe_idEquipe` ASC) VISIBLE,
  CONSTRAINT `fk_OS_has_Pecas_OS1`
    FOREIGN KEY (`OS_idOS` , `OS_Equipe_idEquipe`)
    REFERENCES `mydb`.`OS` (`idOS` , `Equipe_idEquipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OS_has_Pecas_Pecas1`
    FOREIGN KEY (`Pecas_idPecas`)
    REFERENCES `mydb`.`Pecas` (`idPecas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fornecedor` (
  `idFornecedor` INT NOT NULL,
  `Ativo` TINYINT NOT NULL,
  `cnpj` VARCHAR(45) NOT NULL,
  `razao_social` VARCHAR(45) NOT NULL,
  `Pessoa_idPessoa` INT NOT NULL,
  PRIMARY KEY (`idFornecedor`),
  INDEX `fk_Fornecedor_Pessoa1_idx` (`Pessoa_idPessoa` ASC) VISIBLE,
  CONSTRAINT `fk_Fornecedor_Pessoa1`
    FOREIGN KEY (`Pessoa_idPessoa`)
    REFERENCES `mydb`.`Pessoa` (`idPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pecas_Fornecidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pecas_Fornecidas` (
  `Fornecedor_idFornecedor` INT NOT NULL,
  `Pecas_idPecas` INT NOT NULL,
  `qtd` INT NOT NULL,
  PRIMARY KEY (`Fornecedor_idFornecedor`, `Pecas_idPecas`),
  INDEX `fk_Fornecedor_has_Pecas_Pecas1_idx` (`Pecas_idPecas` ASC) VISIBLE,
  INDEX `fk_Fornecedor_has_Pecas_Fornecedor1_idx` (`Fornecedor_idFornecedor` ASC) VISIBLE,
  CONSTRAINT `fk_Fornecedor_has_Pecas_Fornecedor1`
    FOREIGN KEY (`Fornecedor_idFornecedor`)
    REFERENCES `mydb`.`Fornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fornecedor_has_Pecas_Pecas1`
    FOREIGN KEY (`Pecas_idPecas`)
    REFERENCES `mydb`.`Pecas` (`idPecas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
