/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     11/11/2021 14:55:44                          */
/*==============================================================*/

USE Funeraria;

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CLIENTE') and o.name = 'FK_CLIENTE_EMPLEADO__EMPLEADO')
alter table CLIENTE
   drop constraint FK_CLIENTE_EMPLEADO__EMPLEADO
go


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('EMPLEADO') and o.name = 'FK_EMPLEADO_EMPRESA_E_EMPRESA')
alter table EMPLEADO
   drop constraint FK_EMPLEADO_EMPRESA_E_EMPRESA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SERVICIO') and o.name = 'FK_SERVICIO_EMPLEADO__EMPLEADO')
alter table SERVICIO
   drop constraint FK_SERVICIO_EMPLEADO__EMPLEADO
go


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SERVICIO') and o.name = 'FK_SERVICIO_SERVICIOA_SERVICIO')
alter table SERVICIO
   drop constraint FK_SERVICIO_SERVICIOA_SERVICIO
go


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SERVICIO') and o.name = 'FK_SERVICIO_SOLICITUD_SOLICITU')
alter table SERVICIO
   drop constraint FK_SERVICIO_SOLICITUD_SOLICITU
go


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SERVICIO') and o.name = 'FK_SERVICIO_VELATORIO_SALAVELA')
alter table SERVICIO
   drop constraint FK_SERVICIO_VELATORIO_SALAVELA
go


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SOLICITUD') and o.name = 'FK_SOLICITU_CLIENTE_S_CLIENTE')
alter table SOLICITUD
   drop constraint FK_SOLICITU_CLIENTE_S_CLIENTE
go


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VELATORIO_FALLECIDO') and o.name = 'FK_VELATORI_VELATORIO_FALLECID')
alter table VELATORIO_FALLECIDO
   drop constraint FK_VELATORI_VELATORIO_FALLECID
go


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VELATORIO_FALLECIDO') and o.name = 'FK_VELATORI_VELATORIO_SALAVELA')
alter table VELATORIO_FALLECIDO
   drop constraint FK_VELATORI_VELATORIO_SALAVELA
go


drop index if exists CLIENTE.EMPLEADO_CLIENTE_FK;

drop index if exists CLIENTE.CLIENTE_PK;

drop table if exists CLIENTE;

drop index if exists EMPLEADO.EMPRESA_EMPLEADO_FK;

drop index if exists EMPLEADO.EMPLEADO_PK;

drop table if exists EMPLEADO;

drop index if exists EMPRESA.EMPRESA_PK;

drop table if exists EMPRESA;

drop index if exists FALLECIDO.FALLECIDO_PK;

drop table if exists FALLECIDO;

drop index if exists SALAVELACION.SALAVELACION_PK;

drop table if exists SALAVELACION;

drop index if exists SERVICIO.SOLICITUD_SERVICIO_FK;

drop index if exists SERVICIO.VELATORIO_SERVICIO_FK;

drop index if exists SERVICIO.EMPLEADO_SERVICIO_FK;

drop index if exists SERVICIO.SERVICIOADICIONAL_SERVICIO_FK;

drop index if exists SERVICIO.SERVICIO_PK;

drop table if exists SERVICIO;

drop index if exists SERVICIOADICIONAL.SERVICIOADICIONAL_PK;

drop table if exists SERVICIOADICIONAL;

drop index if exists SOLICITUD.CLIENTE_SOLICITUD_FK;

drop index if exists SOLICITUD.SOLICITUD_PK;

drop table if exists SOLICITUD;

drop index if exists VELATORIO_FALLECIDO.VELATORIO_FALLECIDO_FK;

drop index if exists VELATORIO_FALLECIDO.VELATORIO_FALLECIDO2_FK;

drop index if exists VELATORIO_FALLECIDO.VELATORIO_FALLECIDO_PK;

drop table if exists VELATORIO_FALLECIDO;
if exists (select 1
            from  sysindexes
           where  id    = object_id('CLIENTE')
            and   name  = 'EMPLEADO_CLIENTE_FK'
            and   indid > 0
            and   indid < 255)
   drop index CLIENTE.EMPLEADO_CLIENTE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CLIENTE')
            and   type = 'U')
   drop table CLIENTE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('EMPLEADO')
            and   name  = 'EMPRESA_EMPLEADO_FK'
            and   indid > 0
            and   indid < 255)
   drop index EMPLEADO.EMPRESA_EMPLEADO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('EMPLEADO')
            and   type = 'U')
   drop table EMPLEADO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('EMPRESA')
            and   type = 'U')
   drop table EMPRESA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FALLECIDO')
            and   type = 'U')
   drop table FALLECIDO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SALAVELACION')
            and   type = 'U')
   drop table SALAVELACION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SERVICIO')
            and   name  = 'SOLICITUD_SERVICIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index SERVICIO.SOLICITUD_SERVICIO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SERVICIO')
            and   name  = 'VELATORIO_SERVICIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index SERVICIO.VELATORIO_SERVICIO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SERVICIO')
            and   name  = 'EMPLEADO_SERVICIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index SERVICIO.EMPLEADO_SERVICIO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SERVICIO')
            and   name  = 'SERVICIOADICIONAL_SERVICIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index SERVICIO.SERVICIOADICIONAL_SERVICIO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SERVICIO')
            and   type = 'U')
   drop table SERVICIO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SERVICIOADICIONAL')
            and   type = 'U')
   drop table SERVICIOADICIONAL
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SOLICITUD')
            and   name  = 'CLIENTE_SOLICITUD_FK'
            and   indid > 0
            and   indid < 255)
   drop index SOLICITUD.CLIENTE_SOLICITUD_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SOLICITUD')
            and   type = 'U')
   drop table SOLICITUD
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VELATORIO_FALLECIDO')
            and   name  = 'VELATORIO_FALLECIDO_FK'
            and   indid > 0
            and   indid < 255)
   drop index VELATORIO_FALLECIDO.VELATORIO_FALLECIDO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VELATORIO_FALLECIDO')
            and   name  = 'VELATORIO_FALLECIDO2_FK'
            and   indid > 0
            and   indid < 255)
   drop index VELATORIO_FALLECIDO.VELATORIO_FALLECIDO2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('VELATORIO_FALLECIDO')
            and   type = 'U')
   drop table VELATORIO_FALLECIDO
go


/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE 
(
   ID_CLIENTE           integer                        not null,
   ID_EMPLEADO          integer                        null,
   NOMBRESCL            varchar(35)                    not null,
   APELLIDOSCL          varchar(35)                    not null,
   IDENTIFICACIONCL     varchar(10)                    not null,
   DIRECCIONCL          varchar(35)                    not null,
   TELEFONOCL           varchar(10)                    not null,
   CIUDADCL             varchar(25)                    not null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

--1
insert into CLIENTE(ID_CLIENTE,ID_EMPLEADO,NOMBRESCL,APELLIDOSCL,IDENTIFICACIONCL,DIRECCIONCL,TELEFONOCL,CIUDADCL)
values(1,1,'Pedro Anastacio','Lucas Loor','1369875874','Los Esteros','0987563247','Manta');
--2
insert into CLIENTE(ID_CLIENTE,ID_EMPLEADO,NOMBRESCL,APELLIDOSCL,IDENTIFICACIONCL,DIRECCIONCL,TELEFONOCL,CIUDADCL)
values(2,2,'Maria Anastacio','Alcivar Loor','1309845894','olivos','0977263357','Portoviejo');


/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
ID_CLIENTE ASC
);

/*==============================================================*/
/* Index: EMPLEADO_CLIENTE_FK                                   */
/*==============================================================*/
create index EMPLEADO_CLIENTE_FK on CLIENTE (
ID_EMPLEADO ASC
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO 
(
   ID_EMPLEADO          integer                        not null,
   ID_EMPRESA           integer                        null,
   TIPOEMPLEADO         varchar(35)                    not null,
   NOMBRESC             varchar(35)                    not null,
   APELLIDOSC           varchar(35)                    not null,
   IDENTIFICACION_      varchar(10)                    not null,
   DIRECCION_           varchar(35)                    not null,
   FECHANACIMIENTO      date                           not null,
   FECHAINGRESOL        date                           not null,
   constraint PK_EMPLEADO primary key (ID_EMPLEADO)
);

insert into EMPLEADO(ID_EMPLEADO,ID_EMPRESA,TIPOEMPLEADO,NOMBRESC,APELLIDOSC,IDENTIFICACION_,DIRECCION_,FECHANACIMIENTO,FECHAINGRESOL)
values(1,1,'Secretaria','Maria Lourdes','Lucas Alava','1356987451','av. 4 noviembre','17/8/1989','20/5/2018');
--2
insert into EMPLEADO(ID_EMPLEADO,ID_EMPRESA,TIPOEMPLEADO,NOMBRESC,APELLIDOSC,IDENTIFICACION_,DIRECCION_,FECHANACIMIENTO,FECHAINGRESOL)
values(2,1,'Secretaria','Maria Isabel','Lucas Lucas','1308965741','av. 14 noviembre','17/10/1990','20/5/2018');

/*==============================================================*/
/* Index: EMPLEADO_PK                                           */
/*==============================================================*/
create unique index EMPLEADO_PK on EMPLEADO (
ID_EMPLEADO ASC
);

/*==============================================================*/
/* Index: EMPRESA_EMPLEADO_FK                                   */
/*==============================================================*/
create index EMPRESA_EMPLEADO_FK on EMPLEADO (
ID_EMPRESA ASC
);

/*==============================================================*/
/* Table: EMPRESA                                               */
/*==============================================================*/
create table EMPRESA 
(
   ID_EMPRESA           integer                        not null,
   NOMBRE               varchar(35)                    not null,
   DIRECCION            varchar(35)                    not null,
   TELEFONO             varchar(10)                    not null,
   CIUDAD               varchar(35)                    not null,
   constraint PK_EMPRESA primary key (ID_EMPRESA)
);

insert into EMPRESA(ID_EMPRESA,NOMBRE,DIRECCION,TELEFONO,CIUDAD)
values(1,'Eternidad','av. 8 octubre','098746521','Manta');



/*==============================================================*/
/* Index: EMPRESA_PK                                            */
/*==============================================================*/
create unique index EMPRESA_PK on EMPRESA (
ID_EMPRESA ASC
);

/*==============================================================*/
/* Table: FALLECIDO                                             */
/*==============================================================*/
create table FALLECIDO 
(
   ID_FALLECIDO         integer                        not null,
   NOMBRESF             varchar(25)                    not null,
   APELLIDOSF           varchar(35)                    not null,
   GENERO               varchar(20)                    not null,
   FECHANA              date                           not null,
   HORAFA               time                           not null,
   FECHADIF             date                           not null,
   CAUSAS               varchar(35)                    not null,
   constraint PK_FALLECIDO primary key (ID_FALLECIDO)
);

insert into FALLECIDO(ID_FALLECIDO,NOMBRESF,APELLIDOSF,GENERO,FECHANA,HORAFA,FECHADIF,CAUSAS)
values(1,'Carlos Ernesto','Reyes Sanchez','Hombre','10/9/1968','10:00','5/9/2004','Infarto');
--2
insert into FALLECIDO(ID_FALLECIDO,NOMBRESF,APELLIDOSF,GENERO,FECHANA,HORAFA,FECHADIF,CAUSAS)
values(2,'Luis Carlos','Zambrano Loor','Hombre','18/10/1978','14:00','8/9/2005','Accidente');
--3
insert into FALLECIDO(ID_FALLECIDO,NOMBRESF,APELLIDOSF,GENERO,FECHANA,HORAFA,FECHADIF,CAUSAS)
values(3,'Luisa Isabel','Aragundi Centeno','Mujer','20/10/1989','15:22','8/12/2018','Accidente');
--4
insert into FALLECIDO(ID_FALLECIDO,NOMBRESF,APELLIDOSF,GENERO,FECHANA,HORAFA,FECHADIF,CAUSAS)
values(4,'Maria Efigenia','Demera Lucas','Mujer','18/10/1989','11:22','8/10/2018','Mala Practica Medica');



/*==============================================================*/
/* Index: FALLECIDO_PK                                          */
/*==============================================================*/
create unique index FALLECIDO_PK on FALLECIDO (
ID_FALLECIDO ASC
);

/*==============================================================*/
/* Table: SALAVELACION                                          */
/*==============================================================*/
create table SALAVELACION 
(
   ID_SALA              integer                        not null,
   NOMBRESALA           varchar(35)                    not null,
   DIMENSIONESVELA      varchar(35)                    not null,
   DIRECCIONV           varchar(35)                    not null,
   CAPACIDADPER         varchar(20)                    not null,
   HORARESERVA          time                           not null,
   NUMEROVELACION       numeric(6,2)                    not null
   constraint PK_SALAVELACION primary key (ID_SALA)
);

insert into SALAVELACION(ID_SALA,NOMBRESALA,DIMENSIONESVELA,DIRECCIONV,CAPACIDADPER,HORARESERVA,NUMEROVELACION)
values(1,'sala principal','8x6','av, 21 de noviembre','20','10:00','1');
--2
insert into SALAVELACION(ID_SALA,NOMBRESALA,DIMENSIONESVELA,DIRECCIONV,CAPACIDADPER,HORARESERVA,NUMEROVELACION)
values(2,'sala secundaria','8x6','av, 21 de noviembre','20','14:00','1');
--3
insert into SALAVELACION(ID_SALA,NOMBRESALA,DIMENSIONESVELA,DIRECCIONV,CAPACIDADPER,HORARESERVA,NUMEROVELACION)
values(3,'sala secundaria','8x6','av, 21 de noviembre','20','18:00','1');


/*==============================================================*/
/* Index: SALAVELACION_PK                                       */
/*==============================================================*/
create unique index SALAVELACION_PK on SALAVELACION (
ID_SALA ASC
);

/*==============================================================*/
/* Table: SERVICIO                                              */
/*==============================================================*/
create table SERVICIO 
(
   ID_SERVICIO          integer                        not null,
   ID_SERVICIOA         integer                        null,
   ID_EMPLEADO          integer                        null,
   ID_SALA              integer                        null,
   ID_SOLICITUD         integer                        null,
   TIPOSERVICIO         varchar(35)                    not null,
   COSTOSERVICIO        numeric(6,2)                    not null,
   IVASERVICIO          numeric(6,2)                   not null,
   constraint PK_SERVICIO primary key (ID_SERVICIO)
);

insert into SERVICIO(ID_SERVICIO,ID_SERVICIOA,ID_EMPLEADO,ID_SALA,ID_SOLICITUD,TIPOSERVICIO,COSTOSERVICIO,IVASERVICIO)
values(1,1,1,1,1,'Transporte Cementerio',50,10);
--2
insert into SERVICIO(ID_SERVICIO,ID_SERVICIOA,ID_EMPLEADO,ID_SALA,ID_SOLICITUD,TIPOSERVICIO,COSTOSERVICIO,IVASERVICIO)
values(2,2,2,2,2,'Servicio Musical',50,10);
--3
insert into SERVICIO(ID_SERVICIO,ID_SERVICIOA,ID_EMPLEADO,ID_SALA,ID_SOLICITUD,TIPOSERVICIO,COSTOSERVICIO,IVASERVICIO)
values(3,3,3,3,3,'Servicio del Cafe',25,10);
--4
insert into SERVICIO(ID_SERVICIO,ID_SERVICIOA,ID_EMPLEADO,ID_SALA,ID_SOLICITUD,TIPOSERVICIO,COSTOSERVICIO,IVASERVICIO)
values(4,4,4,4,4,'Transporte Cementerio',80,10);



/*==============================================================*/
/* Index: SERVICIO_PK                                           */
/*==============================================================*/
create unique index SERVICIO_PK on SERVICIO (
ID_SERVICIO ASC
);

/*==============================================================*/
/* Index: SERVICIOADICIONAL_SERVICIO_FK                         */
/*==============================================================*/
create index SERVICIOADICIONAL_SERVICIO_FK on SERVICIO (
ID_SERVICIOA ASC
);

/*==============================================================*/
/* Index: EMPLEADO_SERVICIO_FK                                  */
/*==============================================================*/
create index EMPLEADO_SERVICIO_FK on SERVICIO (
ID_EMPLEADO ASC
);

/*==============================================================*/
/* Index: VELATORIO_SERVICIO_FK                                 */
/*==============================================================*/
create index VELATORIO_SERVICIO_FK on SERVICIO (
ID_SALA ASC
);

/*==============================================================*/
/* Index: SOLICITUD_SERVICIO_FK                                 */
/*==============================================================*/
create index SOLICITUD_SERVICIO_FK on SERVICIO (
ID_SOLICITUD ASC
);

/*==============================================================*/
/* Table: SERVICIOADICIONAL                                     */
/*==============================================================*/
create table SERVICIOADICIONAL 
(
   ID_SERVICIOA         integer                        not null,
   TIPOSERVICIOA        varchar(35)                    not null,
   HORASERVICIOA        time                           not null,
   COSTOSERVICIOA       numeric(6,2)                   not null,
   FECHASERVICIOA       date                           not null
   constraint PK_SERVICIOADICIONAL primary key (ID_SERVICIOA)
);

insert into SERVICIOADICIONAL(ID_SERVICIOA,TIPOSERVICIOA,HORASERVICIOA,COSTOSERVICIOA,FECHASERVICIOA)
values(1,'Maquillaje','9:00',25,'7/9/2004');
--2
insert into SERVICIOADICIONAL(ID_SERVICIOA,TIPOSERVICIOA,HORASERVICIOA,COSTOSERVICIOA,FECHASERVICIOA)
values(2,'Embalsamiento','10:00',30,'11/9/2005');
--
insert into SERVICIOADICIONAL(ID_SERVICIOA,TIPOSERVICIOA,HORASERVICIOA,COSTOSERVICIOA,FECHASERVICIOA)
values(3,'Embalsamiento','11:10',30,'10/9/2018');



/*==============================================================*/
/* Index: SERVICIOADICIONAL_PK                                  */
/*==============================================================*/
create unique index SERVICIOADICIONAL_PK on SERVICIOADICIONAL (
ID_SERVICIOA ASC
);

/*==============================================================*/
/* Table: SOLICITUD                                             */
/*==============================================================*/
create table SOLICITUD 
(
   ID_SOLICITUD         integer                        not null,
   ID_CLIENTE           integer                        null,
   TIPOSOLICITUD        varchar(36)                    not null,
   NUMEROSOLICITUD      varchar(35)                    not null,
   FECHASOLICITUD       date                           not null,
   HORASOLICTUD         time                           not null,
   constraint PK_SOLICITUD primary key (ID_SOLICITUD)
);

insert into SOLICITUD(ID_SOLICITUD,ID_CLIENTE,TIPOSOLICITUD,NUMEROSOLICITUD,FECHASOLICITUD,HORASOLICTUD)
values(1,1,'Alquilar Sala','1','10/3/2004','11:00');
--2
insert into SOLICITUD(ID_SOLICITUD,ID_CLIENTE,TIPOSOLICITUD,NUMEROSOLICITUD,FECHASOLICITUD,HORASOLICTUD)
values(2,2,'Alquilar Sala','1','10/4/2004','14:00');


/*==============================================================*/
/* Index: SOLICITUD_PK                                          */
/*==============================================================*/
create unique index SOLICITUD_PK on SOLICITUD (
ID_SOLICITUD ASC
);

/*==============================================================*/
/* Index: CLIENTE_SOLICITUD_FK                                  */
/*==============================================================*/
create index CLIENTE_SOLICITUD_FK on SOLICITUD (
ID_CLIENTE ASC
);

/*==============================================================*/
/* Table: VELATORIO_FALLECIDO                                   */
/*==============================================================*/
create table VELATORIO_FALLECIDO 
(
   ID_FALLECIDO         integer                        not null,
   ID_SALA              integer                        not null,
   OBSERVACION          varchar(25)                    not null,
   NUMEROFALLE          numeric(6,2)                   not null,

   constraint PK_VELATORIO_FALLECIDO primary key (ID_FALLECIDO, ID_SALA)
);

insert into VELATORIO_FALLECIDO(ID_FALLECIDO,ID_SALA,OBSERVACION,NUMEROFALLE)
values(1,1,'Buena Atencion',1);
--2
insert into VELATORIO_FALLECIDO(ID_FALLECIDO,ID_SALA,OBSERVACION,NUMEROFALLE)
values(2,2,'Excelente Atencion',2);


/*==============================================================*/
/* Index: VELATORIO_FALLECIDO_PK                                */
/*==============================================================*/
create unique index VELATORIO_FALLECIDO_PK on VELATORIO_FALLECIDO (
ID_FALLECIDO ASC,
ID_SALA ASC
);

/*==============================================================*/
/* Index: VELATORIO_FALLECIDO2_FK                               */
/*==============================================================*/
create index VELATORIO_FALLECIDO2_FK on VELATORIO_FALLECIDO (
ID_SALA ASC
);

/*==============================================================*/
/* Index: VELATORIO_FALLECIDO_FK                                */
/*==============================================================*/
create index VELATORIO_FALLECIDO_FK on VELATORIO_FALLECIDO (
ID_FALLECIDO ASC
);

alter table CLIENTE
   add constraint FK_CLIENTE_EMPLEADO__EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO)
go

alter table EMPLEADO
   add constraint FK_EMPLEADO_EMPRESA_E_EMPRESA foreign key (ID_EMPRESA)
      references EMPRESA (ID_EMPRESA)
go

alter table SERVICIO
   add constraint FK_SERVICIO_EMPLEADO__EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO)
go

alter table SERVICIO
   add constraint FK_SERVICIO_SERVICIOA_SERVICIO foreign key (ID_SERVICIOA)
      references SERVICIOADICIONAL (ID_SERVICIOA)
go

alter table SERVICIO
   add constraint FK_SERVICIO_SOLICITUD_SOLICITU foreign key (ID_SOLICITUD)
      references SOLICITUD (ID_SOLICITUD)
go

alter table SERVICIO
   add constraint FK_SERVICIO_VELATORIO_SALAVELA foreign key (ID_SALA)
      references SALAVELACION (ID_SALA)
go

alter table SOLICITUD
   add constraint FK_SOLICITU_CLIENTE_S_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
go

alter table VELATORIO_FALLECIDO
   add constraint FK_VELATORI_VELATORIO_FALLECID foreign key (ID_FALLECIDO)
      references FALLECIDO (ID_FALLECIDO)
go

alter table VELATORIO_FALLECIDO
   add constraint FK_VELATORI_VELATORIO_SALAVELA foreign key (ID_SALA)
      references SALAVELACION (ID_SALA)
go


-----Partes de las consultas--
--Consulta Numero #1--
--Mostrar histórico de tiempo entre momento de defunción y momento de embalsamiento 
--para cada difunto. En una columna debe aparecer nombres y apellidos del difunto, en 
--otra columna debe aparecer el tiempo en horas y minutos transcurridos entre momento 
--de defunción y momento de embalsamamiento.

select NOMBRESF,APELLIDOSF,
sum(DATEDIFF(MINUTE,HORASERVICIOA,HORAFA ))/ 60 as [horasTranscurridas],
sum(DATEDIFF(MINUTE,HORASERVICIOA,HORAFA ))% 60 as [minutosTranscurridas],
TIPOSERVICIOA
from FALLECIDO inner join SERVICIOADICIONAL 
on ID_FALLECIDO=ID_SERVICIOA and TIPOSERVICIOA='Embalsamiento'
group by NOMBRESF,APELLIDOSF,TIPOSERVICIOA,HORAFA,HORASERVICIOA
order by TIPOSERVICIOA;

 /*Mostrar el histórico de cada sala de velación. En una columna debe aparecer el nombre 
de la sala de velación, en otra columna la cantidad de difuntos que han estado en ella, en 
otra columna la cantidad de dinero cobrado por el total de servicios vendidos en esa sala 
para cada caso.*/

---
select COUNT(DISTINCT NUMEROVELACION)as CANTIDADDIFUNTOS,
 NOMBRESALA,TIPOSERVICIO, 
SUM(COSTOSERVICIO * IVASERVICIO)as TOTALSERVICIOS 
from  SALAVELACION left join SERVICIO
on SERVICIO.ID_SERVICIO = SALAVELACION.ID_SALA 
/*WHERE NOMBRESALA = 'sala secundaria'*/
group by NOMBRESALA,NUMEROVELACION,TIPOSERVICIO
order by NOMBRESALA;



/*Mostrar el histórico de servicios vendidos por la funeraria. En una columna debe aparecer 
el nombre del servicio, en otra columna la cantidad de difuntos para los cuales se ha 
contratado ese servicio, en otra columna la cantidad de dinero que la funeraria ha 
cobrado por ese servicio en total hasta el momento Ejemplo: transporte cementerio.*/

select TIPOSERVICIO, COUNT (NOMBRESF) AS CANTIDADNOMBREFALLECIDO,FECHADIF,

SUM(COSTOSERVICIO * IVASERVICIO)AS TOTALSERVICIO
from SERVICIO LEFT JOIN FALLECIDO
ON SERVICIO.ID_SERVICIO= FALLECIDO.ID_FALLECIDO
WHERE TIPOSERVICIO= 'Transporte Cementerio'
group by NOMBRESF,TIPOSERVICIO,FECHADIF;


/*Mostrar el histórico de casos de defunción. Debe aparecer en una columna la causa de 
defunción, en otra columna la cantidad de hombres muertos por esa causa, en otra 
columna la cantidad de mujeres muertas por esa causa. ejemplo: Accidente*/


------
SELECT CAUSAS,  GENERO as CANTIDAD_HOMBRE_MUJER,NOMBRESF,APELLIDOSF 
FROM FALLECIDO left join VELATORIO_FALLECIDO 
on VELATORIO_FALLECIDO.ID_SALA=FALLECIDO.ID_FALLECIDO 
and FALLECIDO.ID_FALLECIDO=ID_SALA
WHERE CAUSAS= 'Accidente'
group by CAUSAS,GENERO,NOMBRESF,APELLIDOSF 
order by GENERO ;




