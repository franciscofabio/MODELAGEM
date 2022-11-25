-- Criação do Banco de Dados para o cenário de E-commerce --
create database ecommerce;
-- drop database ecommerce;
use ecommerce;

-- criar tabela de Forma de pagamento --
create table if not exists typePayment (
  idtypePayment int not null auto_increment,
  payDescription VARCHAR(45) NOT NULL,
  primary key (idtypePayment)
);

-- criar tabela de cliente --
create table clients(
	idClient int auto_increment primary key,
    idCtypePayment int,
    fname varchar(20),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    address varchar(60),
    birth_date date,
    constraint unique_cpf_client unique (CPF),
    constraint fk_clients_formapag foreign key (idCtypePayment) references typePayment(idtypePayment)
);

alter table clients auto_increment=1;

-- criar tabela de produto
create table product(
	idProduct int auto_increment primary key,
    descript char(30) not null,
    classification_kids bool default false,
    category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Moveis') not null,
    evaluation float default 0,
    size varchar(10),
    valor float not null
);

-- criar tabela de pedido --
create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    orderValue float,
    paymentCash bool default false,
    paymentPix bool default false,
    -- constraint fk_order_payment foreign key (idOpayment) references payments(idClient, idPayment),
    constraint fk_order_client foreign key (idOrderClient) references clients(idClient)
			on update cascade
);

-- criar tabela de estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255)
);

-- criar tabela PessoaJuridica
create table if not exists legalEntity(
	idlegalEntity int not null auto_increment,
    business_name VARCHAR(255) NOT NULL, -- Razão Social 
    fantasy_name VARCHAR(255) NULL,     -- Nome Fantasia
	contact VARCHAR(11) NOT NULL,
	address VARCHAR(45) NOT NULL,
    cnpj CHAR(15) NULL,
    primary key (idlegalEntity),
    constraint unique_business_name unique (business_name),
    constraint unique_cnpj_legalEntity unique (CNPJ)
);

-- criar tabela de fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    idSupplegalEntity INT NOT NULL,
    activate bool default true,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    constraint fk_supplier_legalEntity foreign key (idSupplegalEntity)
    references legalEntity (idlegalEntity)
);

-- criar tabela de vendedor-terceiro
create table seller(
	idSeller int not null auto_increment,
    idSlegalEntity INT NOT NULL,
    activate bool default true,
    activate_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    classification ENUM("Bronze", "Prata", "Ouro", "Diamante") DEFAULT 'Bronze',
    primary key (idSeller),
    constraint fk_seller_legalEntity foreign key (idSlegalEntity)
    references legalEntity (idlegalEntity)
);

-- criar produto_fornecedor
create table productSupplier(
	idPsSupplier int not null,
	idPsProduct int not null,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier)
    on update cascade,
    constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
    on update cascade
);

-- criar tabela de produtos_vendedor-terceiro
create table productSeller(
	idPseller INT NOT NULL,
    idPproduct INT NOT NULL,
    prodQuantity int default 1,
    primary key (idPseller, idPproduct),
    constraint fk_product_seller_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_seller_product foreign key (idPproduct) references product(idProduct)
);

-- criar tabela de produtos_pedido(Itens de pedido)
create table productOrder(
    idPOorder int not null,
	idPOproduct int not null,
    poQuantity int default 1,
    poStatus enum('Disponível','Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_productOrder_product foreign key (idPOproduct) references product(idProduct),
    constraint fk_productOrder_orders foreign key (idPOorder) references orders(idOrder)
);

-- criar produto_em_estoque
create table storageLocation(
	idLstorage int not null,
	idLproduct int not null,
    quantity int default 0,
    primary key (idLproduct, idLstorage),
    constraint fk_storageLocation_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storageLocation_storage foreign key (idLstorage) references productStorage(idProdStorage)
);

-- criar tabela de entrega
create table if not exists delivery(
  idDelivery int not null auto_increment,
  region char(12) not null, -- uf do estado
  return_period_days int not null default 7, -- periodo de devolução em dias
  primary key (idDelivery)
);

-- criar tabela de pedidos entregues
create table if not exists orders_delivered (
	idODPOrder int not null,
	idODDelivery int not null, -- representa o periodo de devolução
    delivered_date datetime not null,
    delivered_status enum('Finalizada','Cancelada','Retornada') default 'Finalizada',
    tracking_code varchar(45) not null, -- codigo de rastreio
	primary key (idODPOrder, idODDelivery),
	constraint orders_delivered_orders foreign key (idODPOrder)
    references orders (idOrder),
    constraint fk_orders_delivered_delivery foreign key (idODDelivery)
    references delivery (idDelivery)
);

-- criar tabela de pedidos pagos por cliente - CORRIGIR
create table if not exists orders_paid_by_clients(
	idOPCOrders int not null,
    idOPCClient int not null,
    idOPCtypePayment int not null, -- link com forma de pagamento do cliente
    date_payment TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    primary key (idOPCOrders, idOPCClient),
	constraint fk_orders_paid_by_clients_orders foreign key (idOPCOrders)
    references orders(idOrder),
	constraint fk_orders_paid_by_clients_clients foreign key (idOPCClient)
    references clients(idClient),
    constraint fk_orders_paid_by_clients_clients2 foreign key (idOPCtypePayment)
    references clients(idCtypePayment)
);

show tables;

show databases;
use information_schema;
show tables;
desc table_constraints;
desc referential_constraints;
select * from referential_constraints;
select * from referential_constraints where constraint_schema ='ecommerce';
