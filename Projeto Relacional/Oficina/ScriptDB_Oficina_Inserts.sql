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
              (2, 4,'Pendente', 3500.00, '2023-01-01 10:30:00'),
              (3, 4,'Finalizada', 5200.00, '2022-11-28 08:30:00'),
              (1, 2,'Cancelada', 620.00, '2023-01-15 09:30:00');



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
select count(*) as Total from clients; 
select max(valor) as MAIOR_VALOR from product;
select min(valor) as MENOR_VALOR from product;
select round(avg(valor),2) as MEDIA_VLR_PRODUTO from product;

-- Definindo Ordenação de dados com ORDER BY
select * from clients c, orders o where c.idClient = idOrderClient order by idClient;

select concat(fname,' ',Lname) as Client_, idOrder as Order_, orderStatus as Status_ 
	from clients c, orders o 
    where c.idClient = idOrderClient;

 select count(*) from clients c, orders o 
			where c.idClient = idOrderClient;
              
select * from clients left outer join orders ON idClient = idOrderClient;

select * from clients left outer join orders ON idClient = idOrderClient;

select * from clients inner join orders ON idClient = idOrderClient
					inner join productOrder ON idPOorder = idOrder;
                    
-- Recuperar pedidos com os produto associado
select * from clients c 
			inner join orders o ON c.idClient = o.idOrderClient
			inner join productOrder p ON p.idPOorder = o.idOrder
		group by idClient;
-- Mais organizado
select o.idOrder as PEDIDO, o.orderDescription as DESCRIÇÃO,
			concat(c.fname,' ',c.Lname) as CLIENTE, c.CPF, c.address as ENDEREÇO,
            c.birth_date as DATA_NASCIMENTO, p.idPOproduct as ID_PRODUTO, 
            p.poQuantity as QTD, p.poStatus as STATUS_ITEM,
            o.sendValue as FRETE, o.orderValue as VALOR_PEDIDO
			from clients c 
			inner join orders o ON c.idClient = o.idOrderClient
			inner join productOrder p ON p.idPOorder = o.idOrder;
            
-- Recuperar produtos com dados do clientes e com os itens do pedido, descrição produto,
-- qtd e valores dos itens e do tatal do pedido e frete com alias em portugues.
select o.idOrder as PEDIDO, o.orderDescription as DESCRIÇÃO,
			concat(c.fname,' ',c.Lname) as CLIENTE, p.idPOproduct as COD_PRODUTO, 
            pd.descript as PRODUTO, pd.valor as VLR_UNIT,
            p.poQuantity as QTD, p.poStatus as STATUS_ITEM,
            o.sendValue as FRETE, o.orderValue as VALOR_PEDIDO
			from clients c 
			inner join orders o ON c.idClient = o.idOrderClient
			inner join productOrder p ON p.idPOorder = o.idOrder
            inner join product pd ON pd.idProduct = p.idPOproduct order by PEDIDO;
 
 -- Recupera os pedidos realizados por cliente com nome completo
 -- do cliente, status do pedido, valor de frete, valor do pedido
 -- valor total do pedido (vlr pedido + vlr frete)
 select c.idClient, concat(fname,' ',Lname) as Name_, o.orderStatus, o.idOrder,
				o.sendValue, o.orderValue, 
				round(o.orderValue + o.sendValue,2) as amount_to_pay
				from clients c inner join orders o 
				ON c.idClient = o.idOrderClient order by idClient;  
                
-- Recuperar quantos pedidos foram realizados por cliente?
 select c.idClient, concat(fname,' ',Lname) as Name_, count(*) as Qtd_orders from clients c inner join orders o 
				ON c.idClient = o.idOrderClient
                group by idClient;  
 
 -- Recuperar quantos pedidos foram realizados por cliente e o valor da soma dos pedidos
 -- soma do valor com frete.
 select c.idClient, concat(fname,' ',Lname) as Name_, count(*) as Qtd_orders,
				round(sum(o.orderValue),2) as sum_orderValue,
                round((sum(o.orderValue) + sum(o.sendValue)),2) as sum_orderValue_amount
				from clients c inner join orders o 
				ON c.idClient = o.idOrderClient
                where c.idClient = c.idClient
                group by idClient;  
                    



