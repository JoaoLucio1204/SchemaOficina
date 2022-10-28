create database oficina;
use oficina;

create table cliente(
	idCliente int auto_increment primary key,
    nome varchar(30) not null, 
    cpf char(11) not null,
    endereco varchar (30) not null
);

create table veiculo(
	idVeiculo int auto_increment primary key,
    idCliente int,
    placa varchar(10) not null,
    modelo varchar(10) not null,
    constraint fk_veiculo_cliente foreign key(idCliente) references cliente(idCliente)
);

create table mecanico(
	idMecanico int auto_increment primary key,
    idVeiculo int,
    nome varchar(20),
    especialidade varchar(10),
    constraint fk_mecanico_veiculo foreign key(idVeiculo) references veiculo(idVeiculo)
);

create table ordemservico(
	idOrdemServico int auto_increment primary key,
    idMecanico int,
    valor float,
    dataEmissao date,
    dataEntrega date,
    constraint fk_mecanico_os foreign key (idMecanico) references mecanico(idMecanico)
);

insert into cliente value (2, 'Carlos Eduardo', '00363378626', 'Rua tres'),
							(3, 'Jean Carlo', '12345678911', 'Rua Jsete'),
                            (4, 'Giovana Maria', '98765432122', 'Rua oito'),
                            (5, 'Bruna', '11111111111', 'Rua Joao Chapuis');
                            
insert into veiculo value (2, 1, 'gyq5282', 'corsa'),
						(3, 2, 'hjl98700', 'palio');
                        
insert into mecanico value (1, 1, 'Alexandre', 'Eletrica');

insert into ordemservico value (1, 1, 350, '2022-10-28', '2022-11-03');

select * from cliente;
select * from veiculo;
select * from mecanico;
select * from ordemservico;

select cliente.nome, veiculo.modelo, veiculo.placa, mecanico.nome as mecanico, ordemservico.idOrdemServico as OS, 
		ordemservico.valor from cliente inner join veiculo
on cliente.idCliente = veiculo.idCliente
inner join mecanico
on mecanico.idVeiculo = veiculo.idVeiculo
inner join ordemservico
on ordemservico.idMecanico = mecanico.idMecanico;