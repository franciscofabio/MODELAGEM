use oficina;
show tables;

insert into Equipe (descricao)
		values('EQ01-REVISAO'),
			  ('EQ02-RECALL'),
              ('EQ03-TESTES'),
              ('EQ04-MANUTENÇÃO GERAL'),
              ('EQ05-MONTAGEM E REPAROS'),
              ('EQ06-AVALIAÇÃO E LAUDOS');

insert into Pessoa (nome, telefone, email, endereco)
		values('Mauro Lisboa Tavares','61986254571', 'mauro@email.com','QD 01 Rua Tal de Tal Bairro Suzano 105'),
			  ('Fracklin de Macedo','61993521589', 'francklin@email.com','CL5 QD1 Taguatinga Norte 20'),
              ('Herique de Farias','61986254571', 'henrique@email.com','QD 22 Rua Tal de Tal Bairro Suzano 222'),
              ('Paulo Renato','61983325471', 'paulo@email.com','QD 01 Rua Tal de Tal Bairro Duarte 227'),
              ('Ney de Cardoso','61986001271', 'ney@email.com','QD 07 Rua Tal de Tal Bairro Meire 301'),
              ('Rutte Neymwer','61980054599', 'rutte@email.com','QD 22 Rua Tal de Tal Bairro Corrente 720'),
              ('Jandira Britto','61999255521', 'jandira@email.com','QD 13 Rua Tal de Tal Bairro Alencar 105');

insert into Cliente (ativo, credito, pessoa_idPessoa, documento)
		values(default, default, 4, '02155899452'),
			  (True, 50.30, 7, '02268749452'),
              (false, default, 1, '02564877455');

insert into Veiculo (placa, marca, modelo, cor, ano, equipe_idEquipe, cliente_idCliente)
		values('JJS-3065','Peugeot','504 GRD 2.3 Diesel', 'Preto','1994', 4, 3),
              ('JGO-3815','Dodge','Dakota Sport 5.2 V8', 'Branco','2015', 1, 2),
              ('JKY-0757','GREAT WALL','HOVER CUV 2.4 16V 4WD 5p Mec.', 'Vermelho','2016', 2, 1),
              ('KCO-4256','Citroen','AIRCROSS Live 1.5 Flex 8V 5p Mec.', 'Prata','2022', 3, 3),
              ('KEY-0317','MINI','COOPER S 1.6 Aut.', 'Azul','2000', 5, 2);

insert into Funcionario (Pessoa_idPessoa, matricula, data_demissao, cargo, departamento)
		values(2,'0063',null, 'Supervisor','Administratção'),
              (3,'0064','2023-01-30','Mêcanico', 'Oficina');

insert into Mecanico (codigo, especialidade, equipe_idEquipe, funcionario_idFuncionario)
		values('MEC0030','Reparador de Sistemas',5,2),
			  ('MEC0031','Estetica',4,1);

insert into Servicos (descricao, qtd_horas)
		values('TROCA DE KIT DE FREIO',default),
			  ('TROCA DE OLEO DO MOTOR',2),
              ('ALINHAMENTO E BALANCEAMENTO',2),
              ('DESENPENO DE ROTAS',2),
              ('REPAROS DE PENEUS',2),
              ('REVISÃO DE 10KM',2),
              ('REVISÃO DE 20KM',2),
              ('REVISÃO DE 30KM',3),
              ('REVISÃO DE 40KM',4),
              ('REVISÃO DE 50KM',2),
              ('REVISÃO DE 60KM',2),
              ('REVISÃO DE 70KM',2),
              ('REVISÃO DE 80KM',4),
              ('REVISÃO DE =>90KM',4),
              ('TROCA DE PENEUS',default);

insert into OS (cliente_idCliente, equipe_idEquipe, statusOS, vlr_pagar, dataEntrega)
		values(1, 4, default, 1200.00, '2022-11-30 14:30:00'),
			  (3, 5,'Aprovada', 980.99, '2022-12-10 18:30:00'),
              (2, 4,'Pendente', 170.00, '2023-01-01 10:30:00'),
              (3, 4,'Finalizada', 430.00, '2022-11-28 08:30:00'),
              (1, 2,'Cancelada', 650.00, '2023-01-15 09:30:00');

insert into Mao_de_obra (servicos_idServicos, descricao, valor)
		values(1, 'MÃO DE OBRA P/ RETIRADA E SUBSTITUIÇÃO DE KIT E FREIOS', 600.00),
			  (2, 'MÃO DE OBRA P/ TROCA DE OLEO DO MOTOR E OUTROS', 80.00),
              (3, 'MÃO DE OBRA P/ GERAL BASICA', 60.00),
              (4, 'MÃO DE OBRA P/ GERAL BASICA', 60.00),
              (5, 'REPAROS BORRACHARIA', 50.00),
              (6, 'MÃO DE OBRA P/ REVISÃO 10KM A 40KM', 250.00),
              (7, 'MÃO DE OBRA P/ REVISÃO 10KM A 40KM', 250.00),
              (8, 'MÃO DE OBRA P/ REVISÃO 10KM A 40KM', 250.00),
              (9, 'MÃO DE OBRA P/ REVISÃO 10KM A 40KM', 250.00),
              (10, 'MÃO DE OBRA P/ REVISÃO >=40KM', default),
              (11, 'MÃO DE OBRA P/ REVISÃO >=40KM', default),
              (12, 'MÃO DE OBRA P/ REVISÃO >=40KM', default),
              (13, 'MÃO DE OBRA P/ REVISÃO >=40KM', default),
              (14, 'MÃO DE OBRA P/ REVISÃO >=40KM', default),
              (15, 'MÃO DE OBRA P/ TROCAS EQUIPAMENTOS BORRACHARIA', 25.00);
              
insert into Pecas (codigo, nome, valor)
	values('1010','FILTRO DE OLEO',80.00),
		  ('1020','FILTRO DE COMBUSTIVEL',90.00),
          ('1030','FILTRO DE AR',110.00),
          ('1040','AMORTECEDOR DA SUSPENSÃO',410.00),
          ('1050','ANEL DE PISTÃO',90.00),
          ('1060','BRONZINA',190.00),
          ('1070','LÂMPADA PARA VEICULO',10.99),
          ('1080','BATERIA',390.00),
          ('1090','CATALISADOR',180.00),
          ('1100','FLUIDO DE FREIO',90.00);

insert into Servicos_OS (OS_idOS, servicos_idServicos, qtd, valor)
	values(1,9,1,250.00),
		  (1,1,1,600.00),
          (1,5,2,100.00),
          (2,14,1,500.00),
          (2,3,1,80.00),
          (4,6,1,250.00),
          (5,1,1,600.00),
          (5,5,1,50.00);

insert into Pecas_OS (OS_idOS, pecas_idPecas, qtd, valor)
	values(1,3,1,110.00),
		  (1,6,1,190.00),
          (2,7,1,10.99),
          (2,4,1,410.00),
          (3,10,1,90.00),
          (4,9,1,180.00);

insert into Fornecedor (pessoa_idPessoa, ativo, cnpj, razao_social)
	values(5,default,'20763803000105','Braga Leles Fornecimento LTDA'),
		  (6,True,'19881986000184','Neymwer Acessorios & Pecas ME');
          
insert into Pecas_Fornecidas (fornecedor_idFornecedor, pecas_idPecas, qtd)
	values(1,3, 60),
          (1,4, 5),
          (1,6, default),
          (1,7, 100),
          (1,8, default),
          (1,9, 30),
          (1,10, 20),
          (2,1, default),
          (2,2, 35),
          (2,4, 11),
          (2,5, 9),
          (2,9, 13),
          (2,10, 21);

-- Recuperações simples com SELECT Statement        
select * from Equipe;
select * from Pessoa; -- 7
select * from Cliente;        
select * from Veiculo;        
select * from Funcionario;
select * from Mecanico;
select * from Servicos;
select * from OS;
select * from Mao_de_obra;
select * from Pecas;
select * from Servicos_OS order by OS_idOS;  
select * from Pecas_OS order by OS_idOS;  
select * from Fornecedor;	
select * from Pecas_Fornecidas;

-- Usando funções de agregação COUNT, AVG, SUM, MAX E MIN
-- Usando o ROUND() para delimitar 2 casas decimais para a media.
select count(*) as Total from Cliente; 
select count(*) as Total from Cliente where credito > 0;
select count(*) as Total from Pessoa;
select count(*) as Total from Funcionario;
select count(*) as Total from Equipe;
-- Contando qtos veiculos possui placa iniciando com a letra J.
select count(*) as Total from Veiculo where placa LIKE 'J%';

select max(vlr_pagar) as MAIOR_VALOR from OS;
select min(vlr_pagar) as MENOR_VALOR from OS;
select round(avg(vlr_pagar),2) as MEDIA_VLR_PAGAR from OS;

select*from OS;
-- Recuperar OS com os serviços, mão de obra e peças associado
select * from Cliente c 
			inner join OS o ON c.idCliente = o.cliente_idCliente
			inner join Servicos_OS so ON o.idOS = so.OS_idOS
            inner join Mao_de_obra mo ON so.servicos_idServicos = mo.servicos_idServicos
            inner join Pecas_OS po ON o.idOS = po.OS_idOS
		group by idCliente;

            
