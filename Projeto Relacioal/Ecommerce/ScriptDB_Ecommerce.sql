-- Criação do Banco de Dados para o cenário de E-commerce --
create database ecommerce;
-- drop database ecommerce;
use ecommerce;

-- criar tabela de cliente --
create table clients(
	idClient int auto_increment primary key,
    fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    address varchar(60),
    constraint unique_cpf_client unique (CPF)
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
    valor float
);

-- criar tabela de pagamentos
create table payments(
	idClient int,
    idPayment int,
    typePayment enum('Cartão','Dois cartões') not null,
    TypeCard enum('Credito','Debito') not null,
    limitAvailable float,
    primary key(idClient, idPayment),
    constraint fk_payments_clients foreign key (idClient) references clients (idClient)
);

-- criar tabela de pedido --
create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false,
    paymentPix bool default false,
    idOpayment int,
    -- constraint fk_order_payment foreign key (idOpayment) references payments(idClient, idPayment),
    constraint fk_order_client foreign key (idOrderClient) references clients(idClient)
			on update cascade
);

-- criar tabela de estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255)
);

-- criar tabela de fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    socialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);

-- criar tabela de vendedor-terceiro
create table seller(
	idSeller int auto_increment primary key,
    socialName varchar(255) not null,
    abstName varchar(255),
    CNPJ char(15),
    CPF char(11),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

-- criar tabela de produtos_vendedor-terceiro
create table productSeller(
	idPseller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key (idPseller, idPproduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idPproduct) references product(idProduct)
);

-- criar tabela de produtos_pedido
create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponível','Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_productOrder_product foreign key (idPOproduct) references product(idProduct),
    constraint fk_productOrder_orders foreign key (idPOorder) references orders(idOrder)
);

-- criar produto_em_estoque
create table storageLocation(
	idLproduct int,
    idLstorage int,
    quantity int default 0,
    primary key (idLproduct, idLstorage),
    constraint fk_storageLocation_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storageLocation_storage foreign key (idLstorage) references productStorage(idProdStorage)
);

-- criar produto_fornecedor
create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_product_supplier foreign key (idPsProduct) references product(idProduct)
);

show tables;

show databases;
use information_schema;
show tables;
desc table_constraints;
desc referential_constraints;
select * from referential_constraints;
select * from referential_constraints where constraint_schema ='ecommerce';
