Create database MAREACLUB;
Use MAREACLUB;

create table Usuario(
	IdUsuario int primary key auto_increment,
    nome VARCHAR(45),
    login VARCHAR(45),
    senha VARCHAR(14)
		) auto_increment = 100;
        
create table Carros_galeria(
	IdCarro_galeria int primary key auto_increment,
    Modelo VARCHAR(45),
    Cavalaria INT,
    Ano INT,
    Descricao VARCHAR(60)
		);
        
Create table Usuarios_e_galeria(
	IdUsuario_galeria int,
    IdCarro_galeria Int,
    Foreign key (IdUsuario_galeria) REFERENCES Usuario(IdUsuario),
	Foreign key (IdCarro_galeria) REFERENCES Carros_galeria(IdCarro_galeria)
		);
        
Create table Compra_anuncio(
	IdFicha_anuncio int primary key auto_increment,
    Validade date,
    Observacao VARCHAR(60)
		) auto_increment = 10;
        
Create table Anuncios(
	IdAnuncio int primary key auto_increment,
    Modelo VARCHAR(45),
    Ano int,
    Preco INT,
    FkIdUsuario int,
    Foreign key(FkIdUsuario) REFERENCES Usuario(IdUsuario),
    FkIdFicha_anuncio int,
    Foreign key (FkIdFicha_anuncio) REFERENCES Compra_anuncio(IdFicha_anuncio)
		);

select * from Usuario;
select * from Carros_galeria;
select * from Anuncios;
select * from Compra_anuncio;
select * from Usuarios_e_galeria;

            
Insert into Carros_galeria (Modelo, Cavalaria, Ano, Descricao)
	values	('Fiat Marea weekend', '300', '1999', 'Forjada, intercooler e turbina .50'),
			('Fiat Marea sedã', '230', '1999', 'Remapeada, escape em inox 3"'),
            ('Fiat Marea Sedã', '500', '2003', 'Forjada, intercooler, FT550 e turbina roletada'),
            ('Fiat Brava', '250', '1998', 'Swap de motor para 2.4 20v');
            
Insert into Usuarios_e_galeria
	values 	(100, 3),
			(101, 1),
            (102, 2),
            (103, 4),
            (104, 3);
            
Insert into Compra_anuncio (Validade, Observacao)
	values	('2021-05-30', 'Comprado via pix'),
			('2021-06-29', 'Comprado via boleto'),
            ('2021-06-30', 'Comprado via Mercadopago'),
            ('2021-05-30', 'Comprado via pix');

Insert into Anuncios (Modelo, Ano, Preco, FkIdUsuario, FkIdFicha_anuncio)
	values 	('Fiat Marea 2.4', '2003', '18900', 100, 10),
			('Fiat Marea 2.4', '2003', '15000', 101, 11),
            ('Fiat Marea 2.0', '1999', '13000', 102, 12);
            
Select SUM(Anuncios.Preco), AVG(Anuncios.Ano) from Usuario join Anuncios order by Preco desc;

Select Usuario.Nome, Anuncios.Modelo, Anuncios.Ano from Usuario join Anuncios where IdUsuario = FkIdUsuario order by Ano;

Select Usuario.Nome, Carros_galeria.Modelo, Usuarios_e_galeria.IdCarro_galeria, Usuarios_e_galeria.IdUsuario_galeria
from Usuarios_e_galeria
JOIN Usuario on Usuario.IdUsuario = Usuarios_e_galeria.IdUsuario_galeria
Join Carros_galeria on Usuarios_e_galeria.IdCarro_galeria = Carros_galeria.IdCarro_galeria;

select Usuario.Nome, Usuario.Modelo;
