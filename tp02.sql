create database tp02

go

use tp02

go

create table cliente (
	cd_cnpj numeric primary key,
	nm_razao_social varchar (50)
)

go 

create table seguradora (
	cd_cnpj numeric primary key,
	nm_razao_social varchar (50)
)

go

create table plano (
	cd_plano numeric primary key,
	nm_plano varchar(60)
)

go

create table contrato (
	cd_contrato numeric primary key,
	dt_assinatura date,
	cd_cnpj_cliente numeric,
	cd_cnpj_seguradora numeric,
	foreign key (cd_cnpj_cliente) references cliente,
	foreign key (cd_cnpj_seguradora) references seguradora
)

go

create table apolice (
	cd_apolice numeric primary key,
	dt_validade date,
	cd_plano numeric,
	cd_contrato numeric,
	foreign key (cd_contrato) references contrato,
	foreign key (cd_plano) references plano
)

go

create table segurado (
	cd_segurado numeric primary key,
	nm_segurado varchar(50),
	dt_nascimento date,
	cd_apolice numeric,
	foreign key (cd_apolice) references apolice,
	ic_titular varchar(50)
	
)


go

insert into cliente 
	values
	(1, 'Urso'),
	(2, 'Polar')

go

insert into seguradora
	values
	(3, 'Seguro'),
	(4, 'Força')
go

insert into plano 
	values
	(5, 'Plano1'),
	(6, 'Plano2')

go

insert into contrato
	values
	(7, '2003-07-02', 1, 3),
	(8, '2004-05-09', 2, 4)


go



insert into apolice 
	values
	(9, '2024-02-08', 5, 7),
	(10, '2024-08-01', 6, 8)

go

insert into segurado
	values
	(11, 'Sol', '2004-02-01', 9, 'Titular1'),
	(12, 'Lua', '2003-08-01', 10, 'Titular2')

