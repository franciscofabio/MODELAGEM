use ecommerce;
show tables;

insert into typePayment (payDescription)
		values('Cartão Débito'),
			  ('Cartão Credito'),
              ('PIX'),
              ('Boleto'),
              ('Dinheiro'),
              ('Credito Cliente');

insert into clients (idCtypePayment, fname, Minit, Lname, CPF, address, birth_date)
		values(3,'Maria', 'M','Silva', '45793436030', 'rua silva pena 29, carangola - Cidade das flores', '1989-09-09'),
			  (1,'Matheus','O','Pimentel', '72214856072', 'rua alameda 289, Centro - Cidade das flores', '1992-12-13'),
              (6,'Lucas','E','Moraes', '68022183059', 'Travessa Rio de Janeiro 819 Eldorado', '1947-04-20'),
              (2,'Julia','L','Limeiro', '62225129096', 'Rua Catulo da Paixão Cearense 219 - Brisamar', '1992-11-14'),
              (5,'Francisco Fábio','A','Ferreira', '54156745007', 'Quadra SQS 304 LT325 - Asa Sul', '1989-08-09'),
              (3,'Jaimes','K','Chimotto', '02572834049', 'Rua Sebastiana Fernandes 800 - Residencial Camargo', '1997-03-07'),
              (4,'Alleff','W','Gimennnes', '56266707004', 'Avenida dos Pombos 272 - Marabaixo', '2001-09-23');

insert into product (descript, classification_kids, category, evaluation, size, valor)
		values('Fone de ouvido',false,'Eletrônico','4',null,35.50),
			  ('Kit Cozinha Cook',true,'Brinquedos','5',null,990.50),
              ('Barbie Elsa',true,'Brinquedos','3',null,180.99),
              ('Memoria RAM DDR4 8G',false,'Eletrônico','5',null,199.99),
              ('SSD 1TB Kingston',false,'Eletrônico','5',null,890.00),
              ('PenDrive 64GB SanDisk',false,'Eletrônico','4',null,99.00),
              ('Camisa Polo Branca G',false,'Vestimenta','5',null,65.00),
              ('Caixa de Chocolate Garoto',false,'Alimentos','5',null,12.00),
			  ('Cadeira Gamer Strata',false,'Moveis','3',null,1299.00),
              ('Bola Futebol',true,'Brinquedos','3',null,32.99);

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, orderValue, paymentCash, paymentPix)
		values(2,'Confirmado','Pedido Especial',390.00, 3488.00, false, false),
              (7,'Cancelado','Pedido Staff',39.00, 100.50, false, false),
              (3,'Confirmado','Pedido Devolução',79.90, 180.99, false, true),
              (6,'Confirmado','Pedido Geral',121.00, 111.00, false, true),
              (4,'Em processamento','Pedido Geral',44.00, 990.50, true, false),
              (4,'Cancelado','Pedido Geral',390.00, 1289.98, false, false),
              (4,'Confirmado','Pedido Geral',299.00, 659.80, false, false),
              (5,'Confirmado','Pedido Geral',90.00, 495.00, false, false),
              (7,'Confirmado','Pedido Atacado',100.00, 3786.99, false, false),
		      (1,'Em processamento','Pedido Atacado',86.00, 216.49, false, false);

insert into productStorage (storageLocation)
		values('Asa Sul-DF'),
			  ('Taguatinga-DF'),
              ('Valparaiso-GO'),
              ('Planaltina-DF'), 
              ('Guarulhos-SP'), 
              ('Jundiai-SP'),
              ('Niterói-RJ'),
              ('Rio de Janeiro-RJ'), 
              ('Porto Seguro-BA'); 

insert into legalEntity (business_name, fantasy_name, contact, address, cnpj)
		values('Fornecedor Jão de Oliveira','Fornecedor1','36888778955','Rua Tal de Tavares 96','365965800010025'),
			  ('Matias Sales de Orlandes','Vendas C&A Acessorios','33218778300','Rua Tal de Alburquerk 96','232565800010025'),
              ('Eletronicos e Acessorios LTDA','Fornecedor Texeira Eletronicos LTDA','35236878311','Sampa Centro 256','253687800032587'),
              ('Leoneu Aguiar','Aguiar venda de Peliculas','35236878311','Rua Centro 1222','235687800032587'),
              ('Clara de Andrade Nunes','Clara e Vitor Fornecimentos ME','1527086535','Rua Gervásio José do Nascimento 663','02694596000100'),
              ('Regina Juliana Julia Gomes','RJJG Vendas LTDA','8337605832','Rua Batista Leite 927 Bairro São José','79786608690'),
              ('Benedita Luiza Isabelly','Benedita Eletronicos & Brinquedos ME','61996120975','Rua Pedra da Gávea 321 Centro','26228911000164');

insert into supplier (idSupplegalEntity, activate)
		values(1,True),
			  (3,True),
              (5,False);

insert into seller (idSlegalEntity, activate, classification)
		values(2,True, 'Ouro'),
			  (6,False, 'Prata'),
              (7,True, 'Ouro'),
			  (4, default, default); -- Testando inserção de valores default

insert into productSupplier (idPsSupplier, idPsProduct, quantity)
		values(2,1,20),
	          (2,4,10),
              (2,5,15),
              (2,6,5),
              (1,9,5),
              (1,7,3),
              (1,5,10),
              (3,2,11),
              (3,3,21),
              (3,9,3),
              (3,10,2);
              
insert into productSeller (idPseller, idPproduct, prodQuantity)
		values(1,1,3),
	          (1,4,20),
              (1,5,13),
              (2,6,5),
              (2,9,5),
              (2,7,3),
              (3,5,1),
              (3,2,21),
              (3,3,21),
              (4,9,30),
              (4,10,2);

insert into productOrder (idPOorder, idPOproduct, poQuantity, poStatus)
		values(1,9,2,'Disponível'),
              (1,5,1,'Disponível'),
              (2,7,3,'Disponível'),
              (2,1,1,'Disponível'),
              (3,3,1,'Disponível'),
              (4,8,1,'Disponível'),
              (4,6,1,'Disponível'),
              (5,2,1,'Disponível'),
              (6,4,2,'Disponível'),
              (6,5,1,'Disponível'),
              (7,10,20,'Sem estoque'),
              (8,7,5,'Sem estoque'),
              (8,1,2,'Disponível'),
              (8,6,1,'Disponível'),
              (9,9,2,'Disponível'),
              (9,6,1,'Disponível'),
              (9,5,1,'Disponível'),
              (9,4,1,'Disponível'),
              (10,1,1,'Disponível'),
              (10,3,1,'Disponível');

insert into storageLocation (idLstorage, idLproduct, quantity)
		values(1,1,100),
			  (1,2,80),
              (1,3,30),
              (1,4,15),
              (1,6,13),
              (1,8,25),
              (2,1,80),
              (2,3,30),
              (2,4,15),
              (2,7,13),
              (2,8,25),
              (2,9,5),
              (2,10,1),
			  (3,1,15),
              (3,2,8),
              (3,3,2),
              (3,5,5),
              (3,6,1),
              (3,7,65),
              (3,8,13),
              (4,1,10),
              (4,2,8),
              (4,3,20),
              (4,4,50),
              (4,5,13),
              (4,6,10),
              (4,7,11),
              (4,8,17),
              (4,9,5),
              (4,10,3),
              (5,1,1),
              (5,2,80),
              (5,3,10),
              (5,4,55),
              (5,5,10),
              (5,6,10),
              (5,7,10),
              (5,8,12),
              (5,9,5),
              (5,10,2),
              (6,1,10),
              (6,2,8),
              (6,3,20),
              (6,4,50),
              (6,5,13),
              (6,6,10),
              (6,7,11),
              (6,8,17),
              (6,9,5),
              (6,10,3),
              (7,1,10),
              (7,2,8),
              (7,3,20),
              (7,4,50),
              (7,5,13),
              (7,6,10),
              (7,7,11),
              (7,8,17),
              (7,9,5),
              (7,10,3),
              (8,1,10),
              (8,2,8),
              (8,3,20),
              (8,4,50),
              (8,5,13),
              (8,6,10),
              (8,7,11),
              (9,2,17),
              (9,3,5),
              (9,6,3),
              (9,7,17),
              (9,9,5),
              (9,10,3);          
        
insert into delivery (region, return_period_days)
		values('Norte',12),
			  ('Nordeste',14),
			  ('Centro-Oeste',7),
			  ('Sudeste',9),
			  ('Sul',12);	

insert into orders_delivered (idODPOrder, idODDelivery, delivered_date, delivered_status, tracking_code)
		values(1, 5, '2022-10-30 14:50:30','Finalizada','SL123456789SL'),
              (2, 5, '2022-10-20 14:50:30','Cancelada','SL123456789SL'),
              (3, 3, '2022-08-14 14:50:30','Finalizada','SL123456789CO'),
              (4, 3, '2022-05-30 14:50:30','Finalizada','SL123456789CO'),
              (5, 2, '2022-12-24 14:50:30','Finalizada','SL123981001ND'),
              (6, 5, '2022-10-09 14:50:30','Finalizada','SL102156021SL'),
              (7, 1, '2022-07-12 14:50:30','Finalizada','SL025455485NT'),
              (8, 2, '2022-12-31 14:50:30','Retornada','SL123256389ND'),
              (9, 4, '2022-12-07 14:50:30','Finalizada','SL526356789SD'),
              (10, 5, '2022-11-30 14:50:30','Retornada','SL122541879SL');
        
insert into orders_paid_by_clients (idOPCOrders, idOPCClient, idOPCtypePayment)
		values(1,7,1),
              (2,7,4),
              (3,1,3),
              (4,4,3),
              (5,2,6),
              (6,6,2),
              (7,5,5),
              (8,7,2),
              (9,1,1),
              (10,7,6);

-- Recuperações simples com SELECT Statement        
select * from typePayment;
select * from clients; -- 7
select * from product;        
select * from orders;        
select * from productStorage;
select * from legalEntity;
select * from supplier;
select * from seller;
select * from productSupplier;
select * from productSeller;
select * from productOrder order by idPOorder;  
select * from storageLocation order by idLstorage;  
select * from delivery;	
select * from orders_delivered;
select * from orders_paid_by_clients order by idOPCClient;

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
                    



