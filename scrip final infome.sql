-- CREACION DE BASE DE DATOS
CREATE DATABASE DREA_PAGOS
ON PRIMARY
	(NAME = 'Drea_Pagos',
	 FILENAME = 'C:\DataDrea\pagos\Drea_Pagos.mdf',
	 SIZE = 100MB,
	 FILEGROWTH=25%)
LOG ON
	(NAME = 'Drea_PagosLog',
     FILENAME = 'D:\LogDrea\pagos_log\Drea_PagosLog.ldf',
	 SIZE = 10MB,
	 FILEGROWTH=25%)
GO

USE DREA_PAGOS
GO

-- CRACION DE ESQUEMAS
Create SCHEMA Persona;
Create Schema Boleta;
Create Schema [Admin];
go

-- CREACION DE TABLAS Y RESTRICIONES DE INTEGRIDAD
USE DREA_PAGOS
Go

Create Table Persona.Banco
( 
	Banco_ID             Int Primary Key Identity(1,1),
	Banco_nombre         Varchar(50)  NOT NULL 
)
Go

Create Table Persona.Banco_Cuenta
( 
	BancoC_ID            Int Primary Key Identity(1,1),
	BancoC_CuentaID      Int NOT NULL,
	BancoC_BancoID       Int NOT NULL
)
Go

Create Table Persona.Cargo
( 
	Cargo_ID             Int Primary Key Identity(1,1),
	Cargo_nombre         Varchar(50) NOT NULL,
	Cargo_descripcion    Varchar(100),
	Cargo_numero         Varchar(20) NOT NULL 
)
Go

Create Table Persona.Cuenta_Bancaria
( 
	Cuenta_ID            Int Primary Key Identity(1,1),
	Cuenta_numero        Varchar(20) NOT NULL,
	Cuenta_tipoMoneda    Varchar(20) NOT NULL,
	Cuenta_estado        Varchar(20) NOT NULL,
	Cuenta_TrabID        Int NOT NULL,
	Cuenta_fechaActualiazcion Date,
	CONSTRAINT CHK_Moneda CHECK (Cuenta_tipoMoneda IN ('Soles', 'Dolares', 'Euros')),
	CONSTRAINT CHK_estado CHECK (Cuenta_estado IN ('activo', 'inactivo', 'invalido')),
	CONSTRAINT CHK_fecha CHECK (Cuenta_fechaActualiazcion >= '1970-01-01' AND 
								Cuenta_fechaActualiazcion <= CONVERT(DATE, GETDATE()))
)
Go

Create Table Persona.Establecimiento
( 
	Esta_ID              Int Primary Key Identity(1,1),
	Esta_nombre          Varchar(100)  NOT NULL,
	Esta_codigo          Varchar(20)  NOT NULL 
)
Go

Create Table Persona.Grupo_Ocupacional
( 
	Grupo_ID             Int Primary Key Identity(1,1),
	Grupo_nombre         Varchar(30) NOT NULL,
	Grupo_descripcion    Varchar(100),
	Grupo_codigo         Varchar(20) NOT NULL,
	Grupo_nombreCorto    Varchar(10) NOT NULL 
)
Go

Create Table Boleta.Haber_Descuento
( 
	Haber_ID             Int Primary Key Identity(1,1),
	Haber_codigo         Varchar(20) NOT NULL,
	Haber_nombre         Varchar(50) NOT NULL,
	Haber_descripcion    Varchar(100),
	Haber_descripcionSimple Varchar(50),
	Haber_esImponible    Bit  NOT NULL,
	Haber_tipo           Varchar(50)  NOT NULL 
)
Go

Create Table Persona.Nivel_Magisterial
( 
	Nivel_ID             Int Primary Key Identity(1,1),
	Nivel_nombre         Varchar(50)  NOT NULL,
	Nivel_codigo         Varchar(20)  NOT NULL,
	Nivel_descripcion    Varchar(100)
)
Go

Create Table Boleta.Pago
( 
	Pago_ID              Int Primary Key Identity(1,1),
	Pago_fecha           Datetime  NOT NULL,
	Pago_montoLiquido    Decimal(10,2)  NOT NULL,
	Pago_totalDescuento  Decimal(10,2)  NOT NULL,
	Pago_totalHaber      Decimal(10,2)  NOT NULL,
	Pago_montoImponible  Decimal(10,2)  NOT NULL,
	Pago_seguro          Decimal(10,2)  NULL,
	Pago_cFijo           Decimal(10,2)  NULL,
	Pago_cVariable       Decimal(10,2)  NULL,
	Pago_UserID          Int NOT NULL,
	Pago_TrabID          Int NOT NULL,
	CONSTRAINT CHK_montoLiquido CHECK (Pago_montoLiquido >= 0),
	CONSTRAINT CHK_totalDescuento CHECK (Pago_totalDescuento >= 0),
	CONSTRAINT CHK_totalHaber CHECK (Pago_totalHaber >= 0),
	CONSTRAINT CHK_montoImponible CHECK (Pago_montoImponible >= 0),
	CONSTRAINT CHK_seguro CHECK (Pago_seguro >= 0),
	CONSTRAINT CHK_cFijo CHECK (Pago_cFijo >= 0),
	CONSTRAINT CHK_cVariable CHECK (Pago_cVariable  >= 0),
)
Go

Create Table Boleta.Pago_Detalle
( 
	Pagod_ID             Int Primary Key Identity(1,1),
	Pagod_montoParcial   Decimal(10,2)  NOT NULL,
	Pagod_PagoID         Int NOT NULL,
	Pagod_HaberID        Int NOT NULL,
	CONSTRAINT CHK_montoParcial CHECK (Pagod_montoParcial  >= 0),
)
Go

Create Table [Admin].Permiso
( 
	Permiso_ID           Int Primary Key Identity(1,1),
	Permiso_nombre       Varchar(50)  NOT NULL,
	Permiso_slug         Varchar(30),
	Permiso_descripcion  Varchar(100),
	Rol_ID               Int NOT NULL
)
Go

Create Table Persona.Regimen_Laboral
( 
	Regl_ID              Int Primary Key Identity(1,1),
	Regl_nombre          Varchar(50)  NOT NULL,
	Regl_nombreCorto     Varchar(10),
	Regl_descripcion     Varchar(100) 
)
Go

Create Table Persona.Regimen_Pensionario
( 
	Regp_ID              Int Primary Key Identity(1,1),
	Regp_tipo            Varchar(30)  NOT NULL,
	Regp_descripcion     Varchar(100)  NULL 
)
Go

Create Table [Admin].Rol
( 
	Rol_ID               Int Primary Key Identity(1,1),
	Rol_nombre           Varchar(50)  NOT NULL,
	Rol_slug             Varchar(50),
	Rol_descripcion      Varchar(100)
)
Go

Create Table Persona.Tipo_Servidor
( 
	Servidor_ID          Int Primary Key Identity(1,1),
	Servidor_nombre      Varchar(50)  NOT NULL,
	Servidor_descripcion Varchar(100) 
)
Go

Create Table Persona.Trab__Grupo
( 
	TrabG_ID             Int Primary Key Identity(1,1),
	TrabG_TrabID         Int NOT NULL,
	TrabG_GrupoID        Int NOT NULL,
	TrabG_fechaActua     Date,
	CONSTRAINT CHK_fechaActua CHECK (TrabG_fechaActua >= '1900-01-01')
)
Go

Create Table Persona.Trab_cargo
( 
	TrabCargo_ID         Int Primary Key Identity(1,1),
	TrabCargo_CargoID    Int  NOT NULL,
	TrabCargo_TrabID     Int  NOT NULL,
	TrabCargo_fechaActualizacion Date,
	CONSTRAINT CHK_fechaActualizacion CHECK (TrabCargo_fechaActualizacion >= '1900-01-01')
)
Go

Create Table Persona.Trab_Establecimiento
( 
	TrabEsta_ID          Int Primary Key Identity(1,1),
	TrabEsta_TrabID      Int  NOT NULL,
	TrabEsta_EstaID      Int  NOT NULL,
	TrabEsta_fechaInicio Date,
	TrabEsta_fechaFin    Date,
	CONSTRAINT CHK_fechaInicio CHECK (TrabEsta_fechaInicio >= '1900-01-01' and 
									  TrabEsta_fechaFin <= '2090-01-01'),
	CONSTRAINT CHK_fechafin CHECK (TrabEsta_fechaFin >= '1900-01-01' and 
								   TrabEsta_fechaFin <= '2090-01-01')
)
Go

Create Table Persona.Trab_Nivel
( 
	TrabN_ID             Int Primary Key Identity(1,1),
	TrabN_TrabID         Int NOT NULL,
	TrabN_NivelID        Int NOT NULL,
	TrabN_fechaActualizacion Date,
	CONSTRAINT CHK_TrabNfecha CHECK (TrabN_fechaActualizacion >= '1900-01-01' and 
									 TrabN_fechaActualizacion <= '2090-01-01'),
)
Go

Create Table Persona.Trab_RegimenLaboral
( 
	TrabReg_ID           Int Primary Key Identity(1,1),
	TrabReg_ReglID       Int  NOT NULL,
	TrabReg_TrabID       Int  NOT NULL,
	TrabReg_fechaActualizacion Date,
	CONSTRAINT CHK_TrabRegfecha CHECK (TrabReg_fechaActualizacion >= '1900-01-01' and 
									 TrabReg_fechaActualizacion <= '2090-01-01'),
)
Go

Create Table Persona.Trab_RegimenPension
( 
	TrabPen_ID           Int Primary Key Identity(1,1),
	TrabPen_TrabID       Int  NOT NULL,
	TrabPen_RegpID       Int  NOT NULL 
)
Go

Create Table Persona.Trab_Servidor
( 
	TrabS_ID             Int Primary Key Identity(1,1),
	TrabS_ServidorID     Int  NOT NULL,
	TrabS_TrabID         Int  NOT NULL,
	TrabS_fechaActua     Date,
	CONSTRAINT CHK_TrabSfecha CHECK (TrabS_fechaActua >= '1900-01-01' and 
									 TrabS_fechaActua <= '2090-01-01'),
)
Go

Create Table Persona.Trabajador
( 
	Trab_ID              Int Primary Key Identity(1,1),
	Trab_primerNombre    Varchar(30)  NOT NULL,
	Trab_segundoNombre   Varchar(30),
	Trab_apellidoPaterno Varchar(30)  NOT NULL,
	Trab_apellidoMaterno Varchar(30)  NOT NULL,
	Trab_dni             Varchar(10)  NOT NULL,
	Trab_codigoModular   Varchar(20)  NOT NULL,
	Trab_estado          Varchar(20)  NOT NULL,
	Trab_fechaNacimiento Date  NOT NULL,
	Trab_horaSemanal     Int  NULL,
	Trab_situacion       Varchar(20)  NOT NULL,
	CONSTRAINT CHK_Trabestado CHECK (Trab_estado IN ('activo','cesante','sobreviviente')),
	CONSTRAINT CHK_fechaN CHECK (Trab_fechaNacimiento <= CONVERT(DATE, GETDATE())),
	CONSTRAINT CHK_situacion CHECK (Trab_situacion IN ('habilitado','suspendido','baja'))
)
Go

Create Table [Admin].[User]
( 
	[User_ID]            Int Primary Key Identity(1,1),
	User_nombre          Varchar(50)  NOT NULL,
	User_cuenta          Varchar(50)  NOT NULL,
	User_email           Varchar(50)  NOT NULL,
	User_dni             Varchar(10)  NOT NULL,
	User_emailVerificado Bit  NOT NULL,
	User_password        Varchar(50)  NOT NULL,
	User_estado          Varchar(20)  NOT NULL,
	CONSTRAINT CHK_userestado CHECK (User_estado IN ('activo','inactivo')),
)
Go

Create Table [Admin].User_Rol
( 
	UserRol_ID           Int Primary Key Identity(1,1),
	UserRol_UserD        Int  NOT NULL,
	UserRol_RolID        Int  NOT NULL 
)
Go

-- CREACION DE LAS LLAVES FORANEAS
Alter Table Persona.Banco_Cuenta
Add Constraint R_30 Foreign Key (BancoC_CuentaID) References Persona.Cuenta_Bancaria(Cuenta_ID)
On Delete No Action
On Update No Action
Go

Alter Table Persona.Banco_Cuenta
Add Constraint R_31 Foreign Key (BancoC_BancoID) References Persona.Banco(Banco_ID)
On Delete No Action
On Update No Action
Go

Alter Table Persona.Cuenta_Bancaria
Add Constraint R_29 Foreign Key (Cuenta_TrabID) References Persona.Trabajador(Trab_ID)
On Delete No Action
On Update No Action
Go

Alter Table Boleta.Pago
Add Constraint R_17 Foreign Key (Pago_UserID) References [Admin].[User]([User_ID])
On Delete No Action
On Update No Action
Go

Alter Table Boleta.Pago
Add Constraint R_43 Foreign Key (Pago_TrabID) References Persona.Trabajador(Trab_ID)
On Delete No Action
On Update No Action
Go

Alter Table Boleta.Pago_Detalle
Add Constraint R_15 Foreign Key (Pagod_PagoID) References Boleta.Pago(Pago_ID)
On Delete No Action
On Update No Action
Go

Alter Table Boleta.Pago_Detalle
Add Constraint R_16 Foreign Key (Pagod_HaberID) References Boleta.Haber_Descuento(Haber_ID)
On Delete No Action
On Update No Action
Go

Alter Table [Admin].Permiso
Add Constraint R_42 Foreign Key (Permiso_RolID) References [Admin].Rol(Rol_ID)
On Delete No Action
On Update No Action
Go

Alter Table Persona.Trab__Grupo
Add Constraint R_36 Foreign Key (TrabG_TrabID) References Persona.Trabajador(Trab_ID)
On Delete No Action
On Update No Action
Go

Alter Table Persona.Trab__Grupo
Add Constraint R_37 Foreign Key (TrabG_GrupoID) References Persona.Grupo_Ocupacional(Grupo_ID)
On Delete No Action
On Update No Action
Go

Alter Table Persona.Trab_cargo
Add Constraint R_27 Foreign Key (TrabCargo_CargoID) References Persona.Cargo(Cargo_ID)
On Delete No Action
On Update No Action
Go

Alter Table Persona.Trab_cargo
Add Constraint R_28 Foreign Key (TrabCargo_TrabID) References Persona.Trabajador(Trab_ID)
On Delete No Action
On Update No Action
Go

Alter Table Persona.Trab_Establecimiento
Add Constraint R_25 Foreign Key (TrabEsta_TrabID) References Persona.Trabajador(Trab_ID)
On Delete No Action
On Update No Action
Go

Alter Table Persona.Trab_Establecimiento
Add Constraint R_26 Foreign Key (TrabEsta_EstaID) References Persona.Establecimiento(Esta_ID)
On Delete No Action
On Update No Action
Go

Alter Table Persona.Trab_Nivel
Add Constraint R_32 Foreign Key (TrabN_TrabID) References Persona.Trabajador(Trab_ID)
On Delete No Action
On Update No Action
Go

Alter Table Persona.Trab_Nivel
Add Constraint R_33 Foreign Key (TrabN_NivelID) References Persona.Nivel_Magisterial(Nivel_ID)
On Delete No Action
On Update No Action
Go

Alter Table Persona.Trab_RegimenLaboral
Add Constraint R_22 Foreign Key (TrabReg_ReglID) References Persona.Regimen_Laboral(Regl_ID)
On Delete No Action
On Update No Action
Go

Alter Table Persona.Trab_RegimenLaboral
Add Constraint R_23 Foreign Key (TrabReg_TrabID) References Persona.Trabajador(Trab_ID)
On Delete No Action
On Update No Action
Go

Alter Table Persona.Trab_RegimenPension
Add Constraint R_34 Foreign Key (TrabPen_TrabID) References Persona.Trabajador(Trab_ID)
On Delete No Action
On Update No Action
Go

Alter Table Persona.Trab_RegimenPension
Add Constraint R_35 Foreign Key (TrabPen_RegpID) References Persona.Regimen_Pensionario(Regp_ID)
On Delete No Action
On Update No Action
Go

Alter Table Persona.Trab_Servidor
Add Constraint R_38 Foreign Key (TrabS_ServidorID) References Persona.Tipo_Servidor(Servidor_ID)
On Delete No Action
On Update No Action
Go

Alter Table Persona.Trab_Servidor
Add Constraint R_39 Foreign Key (TrabS_TrabID) References Persona.Trabajador(Trab_ID)
On Delete No Action
On Update No Action
Go

Alter Table [Admin].User_Rol
Add Constraint R_40 Foreign Key (UserRol_UserID) References [Admin].[User]([User_ID])
On Delete No Action
On Update No Action
Go

Alter Table [Admin].User_Rol
Add Constraint R_41 Foreign Key (UserRol_RolID) References [Admin].Rol(Rol_ID)
On Delete No Action
On Update No Action
Go