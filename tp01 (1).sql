create database tp01

use tp01

create table vendedor (
	cd_vendedor int not null primary key,
	nm_vendedor varchar(20),
	ds_endereco varchar(100),
	pc_comissao int)

go

create table cliente (
	cd_cliente int not null primary key,
	nm_cliente varchar(50),
	ds_endereco varchar(100),
	vl_faturamento int,
	vl_limite int,
	cd_vendedor int)

go

create table armazem (
	cd_armazem int not null primary key,
	ds_endereco varchar(100))

go

create table peça (
	cd_peca int not null primary key,
	ds_peca varchar(100),
	vl_peca int,
	qt_estoque int,
	cd_armazem int)

go

create table pedido (
	cd_pedido int primary key,
	dt_pedido date,
	cd_cliente int,
	cd_vendedor int,
	cd_peca int)

go 

alter table cliente 
	add foreign key (cd_vendedor)
	references vendedor

go

alter table peça 
	add foreign key (cd_armazem)
	references armazem

go

alter table pedido
	add foreign key (cd_cliente)
	references cliente

go

alter table pedido
	add foreign key (cd_vendedor)
	references vendedor

go

alter table pedido
	add foreign key (cd_peca)
	references peça

