/*==============================================================*/
/* Table: CHEFS                                                 */
/*==============================================================*/
create table CHEFS (
   id_chef              int                  not null,
   Nombre               varchar(30)          null,
   Apellido             varchar(20)          null,
   Cedula               varchar(20)          null,
   Telefono             varchar(20)          null,
   correo               varchar(30)           null,
   Esc_gastronomica     varchar(30)          null,
   Especialidad         varchar(30)          null,
   salario              float                null,
   constraint pk_chefs primary key nonclustered (id_chef)
)
go
/*==============================================================*/
/* Table: CLIENTES                                              */
/*==============================================================*/
create table CLIENTES (
   id_clientes         int                  not null,
   Cedula               varchar(30)             null,
   Nombres              varchar(50)         null,
   Apellidos            varchar(50)         null,
   Telefono             varchar(20)         null,
   Correo               varchar(50)         null,
   Direccion            varchar(50)         null,
   constraint pk_clientes primary key nonclustered (id_clientes)
)
go

/*==============================================================*/
/* Table: MESEROS                                               */
/*==============================================================*/
create table MESEROS (
   id_mesero            int                  not null,
   Cedula               varchar(40)          null,
   Nombres              varchar(40)          null,
   Apellidos            varchar(40)          null,
   Telefonos            varchar(40)                 null,
   correo               varchar(40)          null,
   Edad                 int                  null,
   salario              float                null,
   constraint pk_mesero primary key nonclustered (id_mesero)
)
go



/*==============================================================*/
/* Table: RECETAS                                               */
/*==============================================================*/
create table RECETAS (
   id_recetas           int                  not null,
   id_chefsfk	        int                  null,
   Titulo               varchar(40)          null,
   Descripcion          varchar(40)          null,
   Tiempo_preparacion   time                 null,
   Cantidad_ingrediente varchar              null,
   Cantidad_comensales   int                 null,
   año                   int                 null,
   constraint pk_recetas primary key nonclustered (id_recetas)
)
go
/*==============================================================*/
/* Table: HORARIO_CHEF                                          */
/*==============================================================*/
create table HORARIO_CHEF (
   id_horario           int               not null,
   id_cheffk2           int              null,
   id_menufk            int               null,
   fecha_entrada        date              null,
   fecha_salida         date              null,
   hora_entrada         time              null,
   hora_salida          time              null,
   constraint pk_horario_chef primary key nonclustered (id_horario)
)
go

/*==============================================================*/
/* Table: INGREDIENTES                                          */
/*==============================================================*/
create table INGREDIENTES (
   id_ingredientes       int                 not null,
   id_recetasfk          int                 null,
   nombre               varchar(40)          null,
   Costo                float                null, 
   constraint pk_ingredientes primary key nonclustered (id_ingredientes)
)
go

/*==============================================================*/
/* Table: PLATOS                                                */
/*==============================================================*/
create table PLATOS (
   id_platos            int                  not null,
   id_menufk              int                null,
   id_recetasfk           int                null,
   descripcion          varchar(40)          null,
   costo               float                 null,
   constraint pk_platos primary key nonclustered (id_platos)
)
go

/*==============================================================*/
/* Table: MENU_CARTA                                            */
/*==============================================================*/
create table MENU_CARTA (
   id_menu              int                  not null,
   id_clientesfk         int                  null,
   descripcion         varchar(40)          null,
   constraint pk_menu_carta primary key nonclustered (id_menu)
)
go

/*==============================================================*/
/* Table: PEDIDO_CLIENTE                                        */
/*==============================================================*/
create table PEDIDO_CLIENTE (
   id_pedido            int                  not null,
   id_clientesfk2         int                  null,
   id_meserofk            int                  null,
   descripcion          varchar(40)          null,
   costo                 float	             null,	
   fecha_pedido          date                null,
   constraint pk_pedido_cliente primary key nonclustered (id_pedido)
)
go
/*==============================================================*/
/* Table: RESERVACION                                                 */
/*==============================================================*/
create table RESERVACION (
   id_reserva           int                  not null,
   id_clientesfk3         int               null,
   fecha_reserva        date                null,
   hora_reserva         time                null,
   descripcion          varchar(40)         null,
   total_transferencia  float               null,
   estado_reservacion   varchar(40)         null,
   constraint pk_reservacion primary key nonclustered (id_reserva)
)
go
select * from RESERVACION

/*==============================================================*/
/* Table: SALONES                                                 */
/*==============================================================*/
create table SALONES (
   id_reservafk           int                  null,
   tipo_salon           varchar(40)          null,
   capacidad            varchar(40)          null,
   id_salones           int                  not null,
   constraint pk_salones primary key nonclustered (id_salones)
)
go

/*==============================================================*/
/* Table: MESAS                                                 */
/*==============================================================*/
create table MESAS (
   id_mesas             int                  not null,
   id_meserofk            int                  null,
   id_salonesfk           int                  null,
   estado               varchar(30)          null,
   capacidad            int                  null,
   numero_mesa          int                  null,
   constraint pk_mesas primary key nonclustered (id_mesas)
)
go

create table PEDIDO_CHEF (
   id_pedido            int                  not null,
   id_meserofk3           int                  null,
   id_cheffk3              int                  null,
   descripcion          varchar(40)          null,
   constraint pk_pedido_chef primary key nonclustered (id_pedido)
)
go

create table HORARIO_MESERO (
   id_meseropk           int                  null,
   fecha_entrada        date             not null,
   fecha_salida         date             not null,
   hora_entrada         time             not null,
   hora_salida          time             not null,
   id_meseros           int                  not null,
   constraint pk_horario_mesero primary key nonclustered (id_meseros)
)
go

alter table HORARIO_MESERO
   add constraint FK_HORARIO__RELATIONS_MESEROS foreign key (id_meseropk)
      references MESEROS (id_mesero)
go

alter table PLATOS
   add constraint FK_PLATOS_REFERENCE_RECETAS foreign key (id_recetasfk)
      references RECETAS (id_recetas)
go

alter table PLATOS
   add constraint FK_PLATOS_RELATIONS_MENU_CAR foreign key (id_menufk)
      references MENU_CARTA (id_menu)
go

alter table HORARIO_CHEF
   add constraint FK_HORARIO__TIENE_CHEFS foreign key (id_cheffk2)
      references CHEFS (id_chef)
go
alter table HORARIO_CHEF
   add constraint FK_HORARIO__TIENE_MENU foreign key (id_menufk)
      references MENU_CARTA (id_menu)
go

alter table RECETAS
   add constraint FK_RECETAS_RELATIONS_CHEFS foreign key (id_chefsfk)
      references CHEFS (id_chef)
go

alter table PEDIDO_CLIENTE
   add constraint FK_PEDIDO_C_GUARDA_MESEROS foreign key (id_meserofk)
      references MESEROS (id_mesero)
go

alter table PEDIDO_CLIENTE
   add constraint FK_PEDIDO_C_RELATIONS_CLIENTES foreign key (id_clientesfk2)
      references CLIENTES (id_clientes)
go

alter table RESERVACION
   add constraint FK_RESERVAC_RELATIONS_CLIENTES foreign key (id_clientesfk2)
      references CLIENTES (id_clientes)
go

alter table SALONES
   add constraint FK_SALONES_RELATIONS_RESERVAC foreign key (id_reservafk)
      references RESERVACION (id_reserva)
go

alter table MESAS
   add constraint FK_MESAS_RELATIONS_MESEROS foreign key (id_meserofk)
      references MESEROS (id_mesero)
go

alter table MESAS
   add constraint FK_MESAS_RELATIONS_SALONES foreign key (id_salonesfk)
      references SALONES (id_salones)
go

alter table PEDIDO_CHEF
   add constraint FK_PEDIDO_C_GUARDAR_MESEROS foreign key (id_meserofk3)
      references MESEROS (id_mesero)
go

alter table PEDIDO_CHEF
   add constraint FK_PEDIDO_C_RELATIONS_CHEFS foreign key (id_cheffk3)
      references CHEFS (id_chef)
go

alter table INGREDIENTES
   add constraint FK_INGREDIE_RELATIONS_RECETAS foreign key (id_recetasfk)
      references RECETAS (id_recetas)
go

alter table MENU_CARTA
   add constraint FK_INGREDIE_RELATIONS_MENU foreign key (id_clientesfk)
      references CLIENTES (id_clientes)
go


select * from CHEFS

 SELECT* FROM PEDIDO_CLIENTE

INSERT INTO CHEFS(id_chef, Nombre, Apellido, Cedula,Telefono,correo,Esc_gastronomica,Especialidad,salario) 
VALUES (1, 'Juan', 'Macias','1309448594','0984766738','Juan@gmail.com', 'Masterschefs' ,'Mariscos',400.00),
       (2, 'Carlos', 'Gomez','1309485494','098765556','Calos@gmail.com','Esc. Artes culinarias','Parrilladas',450.00),
	   (3, 'Jesus', 'Zambrano','1317069381','09875435','Jesus@gmail.com','Esc. De Gastronomis Ecuador','Parrilladas',450.00)
	   select * from CHEFS

INSERT INTO CLIENTES(id_clientes,Cedula, Nombres, Apellidos, telefono,correo,direccion) 
VALUES (6,'13098476484', 'Larry', 'Rojas','097631568', 'Larry@gmail.com' ,'Barrio cuba'),
        (7,'1204237843', 'Nelson', 'Lopez','09123478', 'Nelson@gmail.com' ,'Barrio Santana calle 200'),
		(8,'1309876362', 'Pedro', 'Loaiza','09876453', 'Pedro@gmail.com' ,'Manta-cdla jokay'),
		(9,'1308745765', 'Darwin', 'Aguirre','093289498', 'Darwin@gmail.com' ,'launivercitaria'),
		(10,'130948757', 'Brian', 'Zambrano','092935989', 'Brian@gmail.com' ,'urbirrios Calle 113'),
	   (1,'120948757', 'Karla', 'Macias','09876532', 'karla@gmail.com' ,'Manta-cdla jokay'),
       (2,'130948756', 'Jean', 'gomez', '30098761','jean@gmail.com','Universitaria-Umiña' ),
	   (3,'134857499', 'Leo', 'lopez','09826443','karla@gmail.com' ,'Calle 13 av16'),
	   (4,'130987436', 'Arnaldo', 'Barcia','09826443','Arnaldo@gmail.com' ,'Calle 12 av 35'),
	   (5,'130143255', 'Andres', 'Zambrano','09826443','Andres@gmail.com' ,'Calle Brasil av 20')
	   
INSERT INTO MESEROS(id_mesero,Cedula, Nombres, Apellidos, Telefonos,correo,Edad,Salario) 
VALUES  (4,'12345680', 'Alexander', 'Santana','098765452','Alexander@hotmail.com',26 ,450.00),
	   (1,'12345680', 'Diego', 'Macias','09876532','Macias@hotmail.com',26 ,450.00),
       (2,'122345790', 'Jose', 'gomez', '30098761','Jose@hotmail.com',30,480.00 ),
	   (3,'12345950', 'Sofia', 'lopez','09826443','Sofia@gmail.com',31,500.00)
	   
INSERT INTO MENU_CARTA(id_menu,id_clientesfk,descripcion) 
VALUES   (2,2,'Mariscos'),
	    (1,1,'Menus gastronomico')
		
	SELECT *FROM MENU_CARTA	

       

INSERT INTO HORARIO_MESERO(id_meseropk, fecha_entrada,fecha_salida,hora_entrada,hora_salida,id_meseros) 
VALUES  (3,'12-05-2020','12-05-2020','15:00','23:00',3),
	    (4,'12-05-2020','12-05-2020','15:00','23:00',4),
	    (1,'12-05-2020','12-05-2020','15:00','23:00',1),
        (2,'12-05-2020','12-05-2020','15:00','23:00',2)
	   


INSERT INTO HORARIO_CHEF(id_horario,id_cheffk2,id_menufk,fecha_entrada,fecha_salida,hora_entrada,hora_salida) 
VALUES (1,1,1,'12-05-2020','13-05-2021','15:00','23:00'),
        (2,2,1,'14-05-2020','15-05-2021','15:00','23:00'),
		(3,3,1,'16-05-2020','1-05-2021','15:00','23:00')
		

INSERT INTO SALONES(id_reservafk,tipo_salon,capacidad,id_salones) 
VALUES (3, 'regular','40 personas',3),
	    (4, 'intermedio','30 personas',4),
	   (1, 'Vip','10 personas',1),
       (2, 'Intermedio','30 personas',2)
	   SELECT *from SALONES
	   
INSERT INTO PLATOS(id_platos,id_menufk,id_recetasfk,descripcion,costo) 
VALUES (3, 3,3,'Carne asada',10.00),
	   (4, 3,4,'Pollo a la plancha',10.00),
       (2, 1,2,'Ceviche de pezcado',10.00),
	   (1, 1,1,'Apanado de pescado',10.00)

       
       
INSERT INTO MENU_CARTA(id_menu,id_clientesfk,descripcion) 
VALUES  (3,3,'Parrilladas'),
	    (4,1,'porcion pequeña')

	   
INSERT INTO MESAS(id_mesas,id_meserofk,id_salonesfk,estado,capacidad,numero_mesa) 
VALUES  (3,2,2,'ocupada',5,3),
	    (4,3,3,'ocupada',7,4),
		(1,1,1,'ocupada',5,1),
		(2,1,1,'ocupada',3,2)
		
		
INSERT INTO RESERVACION(id_reserva,id_clientesfk3,hora_reserva,fecha_reserva,descripcion,total_transferencia,estado_reservacion) 
VALUES   
        (3,3,'20:00','20-02-2021','pareja' ,22.05,'aceptada'),
		(4,4,'19:00','22-02-2021','familiar' ,15.35,'aceptada'),
		(1,1,'19:00','22-02-2021','familiar' ,22.05 ,'aceptada'),
		(2,2,'19:00','22-02-2021','familiar' ,22.05,'aceptada'),
		(5,1,'21:00','22-02-2021','familiar' ,22.05,'cancelada'),
		(6,1,'19:00','22-02-2021','pareja' ,22.05,'cancelada')
		select * from RESERVACION

INSERT INTO PEDIDO_CLIENTE(id_pedido,id_clientesfk2,id_meserofk,descripcion,costo,fecha_pedido) 
VALUES   (6,1,1,'poca sal',10.50,'22-02-2021')
	    (5,1,3,'completo',10.00,'27-03-2021'),
        (4,3,2,'completo',10.00,'24-02-2021'),
		(2,1,1,'poco arroz',7.50,'23-02-2021'),
		(3,2,1,'completo',7.50,'23-02-2021'),
       (1,1,1,'plato sin cevolla',10.50,'22-02-2021')
		
select* from PEDIDO_CLIENTE

INSERT INTO RECETAS(id_recetas,id_chefsfk,titulo,descripcion,tiempo_preparacion,cantidad_ingrediente,cantidad_comensales,año) 
VALUES (1,1,'Apanado de pezcado','receta sencilla','1:00','5',2,2020),
		(2,1,'ceviche de pezcado','receta sencilla','3:00','5',5,2020),
		(3,2,'carne asada','receta sencilla','2:00','2:00',5,2021),
		(4,2,'pollo a la plancha','receta sencilla','1:00','5',5,2021)
select * from RECETAS
		

INSERT INTO INGREDIENTES(id_ingredientes,id_recetasfk,nombre,Costo) 
VALUES  (8,3,'carne',3.00),
	     (9,3,'Arroz',0.50),
		 (10,3,'lentejas',0.30),
		 (11,3,'platano',0.50),
		(1,1,'pezcado',3.00),
		(2,1,'limon',1.00),
		(3,1,'cevolla', 0.25),
		(4,1,'tomate',0.25),
		(5,1,'pimiento',0.25),
		(6,1,'sal',1.00),
		(7,1,'chifle',0.30)
		

select * from INGREDIENTES 


--Cantidad que un cliente a reservado cuantas veces cancelo y cuantas veces confirmo y la fecha de las reservaciones 

select  nombres,fecha_reserva
from RESERVACION s inner join  CLIENTES c
on   c.id_clientes=id_clientesfk3
where nombres='Karla' order by nombres desc 
select    count(estado_reservacion) as resevaciones_confirmadas
from RESERVACION s inner join CLIENTES  c on id_clientes=s.id_clientesfk3 where Nombres='Karla' and estado_reservacion ='aceptada'

select    count(estado_reservacion) as resevaciones_cancelada

from RESERVACION s inner join CLIENTES  c on id_clientes=s.id_clientesfk3  where nombres='Karla' and estado_reservacion='cancelada'

select    count(id_reserva) as total_reserva 

from reservacion s inner join clientes  c on id_clientes=s.id_clientesfk3  where nombres='Karla'


select * from RESERVACION


--Fecha en que se vendio mas plato y el total de la venta del dia

select p.fecha_pedido
from PEDIDO_CLIENTE p 
where fecha_pedido='2021-02-22'
select    count(costo) as total_Platos_vendidos

from PEDIDO_CLIENTE P inner join CLIENTES  c on id_clientes=p.id_clientesfk2  where fecha_pedido= '2021-02-22'

select    sum(costo) as total_Venta_Dia 

from PEDIDO_CLIENTE   where fecha_pedido='2021-02-22'


--cantidad de recetas sugeridadas por el chefs por año 

select   count(id_recetas) as total_recetas

from RECETAS  where id_chefsfk = 1 

SELECT año,Nombre,Titulo,Descripcion

from RECETAS inner join CHEFS on id_chef=id_chefsfk where año = 2020

---Mostrar costo de produccion y costo de venta de un plato


SELECT p.costo as costo_venta, p.descripcion

from RECETAS r  inner join PLATOS p on p.id_recetasfk=r.id_recetas where p.descripcion= 'Carne asada'

select    sum(Costo) as costo_produccion

from INGREDIENTES where id_recetasfk = 3
