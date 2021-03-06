-- SQL Manager for PostgreSQL 5.5.1.45206
-- ---------------------------------------
-- Host      : localhost
-- Database  : bd_postgrado
-- Version   : PostgreSQL 9.4.4, compiled by Visual C++ build 1800, 32-bit



SET search_path = public, pg_catalog;
DROP FUNCTION IF EXISTS public.obtenertiposusuarios ();
DROP FUNCTION IF EXISTS public.eliminarpermisotodosusuarios (idpermiso integer, estadoo char);
DROP FUNCTION IF EXISTS public.actualizarpermisodetalles (_id integer, _descripcion varchar, _form varchar, _orden integer);
DROP TABLE IF EXISTS public.estudios_realizados;
DROP TABLE IF EXISTS public.titulo;
DROP TABLE IF EXISTS public.universidad;
DROP TABLE IF EXISTS public.datos_nac;
DROP TABLE IF EXISTS public.datos_lab;
DROP TABLE IF EXISTS public.datos_dom;
DROP TABLE IF EXISTS public.detalle_permiso;
DROP TABLE IF EXISTS public.permiso;
DROP TABLE IF EXISTS public.parroquia;
DROP TABLE IF EXISTS public.canton;
DROP TABLE IF EXISTS public.provincia;
DROP TABLE IF EXISTS public.pais;
DROP TABLE IF EXISTS public.asistencia;
DROP TABLE IF EXISTS public.notas;
DROP TABLE IF EXISTS public.modulo;
DROP TABLE IF EXISTS public.usuario;
DROP TABLE IF EXISTS public.tipo_usuario;
DROP TABLE IF EXISTS public.palabras_clave;
DROP TABLE IF EXISTS public.tesis;
DROP TABLE IF EXISTS public.requisitos;
DROP TABLE IF EXISTS public.precio;
DROP TABLE IF EXISTS public.pago;
DROP TABLE IF EXISTS public.tipo_pago;
DROP TABLE IF EXISTS public.matricula;
DROP TABLE IF EXISTS public.promocion;
DROP TABLE IF EXISTS public.maestria;
DROP TABLE IF EXISTS public.tipo_precio;
DROP TABLE IF EXISTS public.entrevista;
DROP TABLE IF EXISTS public.estudiante;
DROP FUNCTION IF EXISTS public.obtenermenunavusuario (codigo integer);
DROP FUNCTION IF EXISTS public.registrar_permisos (padre integer, nombre varchar, orden integer, form varchar);
DROP FUNCTION IF EXISTS public.usuario_acceso (userr varchar, passs varchar);
DROP FUNCTION IF EXISTS public.obtener_arbol_permisodetalles (codigousuario integer, permisoid integer);
DROP FUNCTION IF EXISTS public.registrarpermisosxusuarios (idpermiso integer, idusuario integer, estadoo char);
DROP FUNCTION IF EXISTS public.obtener_arbol_permisos ();
DROP FUNCTION IF EXISTS public.obtener_usuarios ();
DROP FUNCTION IF EXISTS public.obtener_padres ();
--
-- Definition for function obtener_padres (OID = 35914) : 
--
SET check_function_bodies = false;
CREATE FUNCTION public.obtener_padres (
)
RETURNS TABLE (
  id integer,
  descripcion character varying
)
AS 
$body$
select public.permiso.id, 
public.permiso.descripcion
from public.permiso  
where permiso.padre =0 order by public.permiso.descripcion ASC;
$body$
LANGUAGE sql;
--
-- Definition for function obtener_usuarios (OID = 35915) : 
--
CREATE FUNCTION public.obtener_usuarios (
)
RETURNS TABLE (
  id integer,
  nombres character varying,
  apellidos character varying,
  tipousuario character varying
)
AS 
$body$
select public.usuario.id,
public.usuario.nombres,
public.usuario.apellidos,
public.tipo_usuario.descripcion
from public.tipo_usuario
inner join public.usuario
on public.tipo_usuario.id=public.usuario.id_tipo_usuario
order by public.usuario.nombres ASC;
$body$
LANGUAGE sql;
--
-- Definition for function obtener_arbol_permisos (OID = 35916) : 
--
CREATE FUNCTION public.obtener_arbol_permisos (
)
RETURNS TABLE (
  id integer,
  descripcion character varying,
  padre integer,
  orden integer,
  estado character
)
AS 
$body$
select public.permiso.id, 
public.permiso.descripcion,
public.permiso.padre,
public.permiso.orden,
public.permiso.estado
from public.permiso
where public.permiso.estado = '1'
order by orden,
  public.permiso.descripcion ASC;
$body$
LANGUAGE sql;
--
-- Definition for function registrarpermisosxusuarios (OID = 35917) : 
--
CREATE FUNCTION public.registrarpermisosxusuarios (
  idpermiso integer,
  idusuario integer,
  estadoo character
)
RETURNS void
AS 
$body$
DECLARE
_userPermiso integer;
_userId integer;
begin
-- || Obtener usuario Permiso
SELECT into _userPermiso 
    public.detalle_permiso.id_permiso
 FROM
  public.detalle_permiso
WHERE
  public.detalle_permiso.id_permiso = idpermiso;
-- || Obtener usuario id
SELECT into _userId
  public.detalle_permiso.id_usuario
 FROM
  public.detalle_permiso
WHERE
  public.detalle_permiso.id_permiso = idpermiso AND 
  public.detalle_permiso.id_usuario = idusuario;
  
IF _userPermiso = idpermiso THEN
   IF _userId = idusuario THEN
      UPDATE public.detalle_permiso SET estado = estadoo 
WHERE
  public.detalle_permiso.id_permiso = idpermiso AND 
  public.detalle_permiso.id_usuario = idusuario;
  ELSE
	INSERT INTO public.detalle_permiso (id_permiso, id_usuario,estado)
	VALUES (idPermiso,idUsuario, estadoo);
   END IF; 
ELSE
    INSERT INTO public.detalle_permiso (id_permiso, id_usuario,estado)
    VALUES (idPermiso,idUsuario, estadoo);
END IF;
end;
$body$
LANGUAGE plpgsql;
--
-- Definition for function obtener_arbol_permisodetalles (OID = 35918) : 
--
CREATE FUNCTION public.obtener_arbol_permisodetalles (
  codigousuario integer,
  permisoid integer
)
RETURNS TABLE (
  detallepermisoestado character
)
AS 
$body$
SELECT 
   public.detalle_permiso.estado
FROM
  public.permiso
  INNER JOIN public.detalle_permiso ON (public.permiso.id = public.detalle_permiso.id_permiso)
WHERE
  public.detalle_permiso.id_usuario = codigoUsuario and 
  public.detalle_permiso.id_permiso = permisoId;
$body$
LANGUAGE sql;
--
-- Definition for function usuario_acceso (OID = 35919) : 
--
CREATE FUNCTION public.usuario_acceso (
  userr character varying,
  passs character varying
)
RETURNS TABLE (
  usr_nombres character varying,
  usr_apellidos character varying,
  usr_id integer,
  role_name character varying
)
AS 
$body$
select public.usuario.nombres,
public.usuario.apellidos,
public.usuario.id,
tipo_usuario.descripcion
from public.tipo_usuario
inner join public.usuario
on public.tipo_usuario.id=public.usuario.id_tipo_usuario
where usuario.clave =passs and usuario.nick =userr;
$body$
LANGUAGE sql;
--
-- Definition for function registrar_permisos (OID = 35920) : 
--
CREATE FUNCTION public.registrar_permisos (
  padre integer,
  nombre character varying,
  orden integer,
  form character varying
)
RETURNS void
AS 
$body$
    INSERT INTO public.permiso (descripcion, padre,form, orden, estado)
    VALUES (nombre,padre,form, orden, '1');
$body$
LANGUAGE sql;
--
-- Definition for function obtenermenunavusuario (OID = 35921) : 
--
CREATE FUNCTION public.obtenermenunavusuario (
  codigo integer
)
RETURNS TABLE (
  permisopadre integer,
  descripcion character varying,
  url character varying,
  idpermiso integer,
  orden integer
)
AS 
$body$
SELECT 
  public.permiso.padre,
  public.permiso.descripcion,
  public.permiso.form,
  public.permiso.id,
  public.permiso.orden
FROM
  public.permiso
  INNER JOIN public.detalle_permiso ON (public.permiso.id = public.detalle_permiso.id_permiso)
WHERE
  public.detalle_permiso.id_usuario = codigo AND 
  public.permiso.estado = '1' AND 
  public.detalle_permiso.estado <> '0'
ORDER BY
  public.permiso.orden,
  public.permiso.descripcion ASC;
$body$
LANGUAGE sql;
--
-- Definition for function actualizarpermisodetalles (OID = 36326) : 
--
CREATE FUNCTION public.actualizarpermisodetalles (
  _id integer,
  _descripcion character varying,
  _form character varying,
  _orden integer
)
RETURNS void
AS 
$body$
    UPDATE public.permiso SET descripcion=_descripcion, form = _form, orden= _orden 
    WHERE id = _id;
$body$
LANGUAGE sql;
--
-- Definition for function eliminarpermisotodosusuarios (OID = 36327) : 
--
CREATE FUNCTION public.eliminarpermisotodosusuarios (
  idpermiso integer,
  estadoo character
)
RETURNS void
AS 
$body$
    UPDATE public.permiso
SET
    estado = estadoo
WHERE
  public.permiso.id = idpermiso
$body$
LANGUAGE sql;
--
-- Definition for function obtenertiposusuarios (OID = 36328) : 
--
CREATE FUNCTION public.obtenertiposusuarios (
)
RETURNS TABLE (
  id integer,
  nombres character varying
)
AS 
$body$
SELECT 
  public.tipo_usuario.id,
  public.tipo_usuario.descripcion
FROM
  public.tipo_usuario
order by public.tipo_usuario.descripcion ASC;
$body$
LANGUAGE sql;
--
-- Structure for table estudiante (OID = 35925) : 
--
CREATE TABLE public.estudiante (
    id serial NOT NULL,
    ced_pasaporte varchar(20) NOT NULL,
    nombres varchar(50),
    apellidos varchar(50),
    email varchar(50),
    celular varchar(10),
    fecha_nac date,
    sexo char(1),
    estado_civil char(1),
    pais_origen varchar(25),
    dsc_colegiatura integer
)
WITH (oids = false);
--
-- Structure for table entrevista (OID = 35931) : 
--
CREATE TABLE public.entrevista (
    id serial NOT NULL,
    lugar varchar(50),
    fecha date,
    hora time without time zone,
    estado char(1),
    id_estudiante integer NOT NULL,
    id_usuario integer NOT NULL
)
WITH (oids = false);
--
-- Structure for table tipo_precio (OID = 35937) : 
--
CREATE TABLE public.tipo_precio (
    id serial NOT NULL,
    descripcion varchar(50),
    estado char(1)
)
WITH (oids = false);
--
-- Structure for table matricula (OID = 35943) : 
--
CREATE TABLE public.matricula (
    id serial NOT NULL,
    n_matricula integer NOT NULL,
    fecha_matricula date,
    dsc_colegiatura integer,
    estado char(1),
    id_promocion integer NOT NULL,
    id_estudiante integer NOT NULL
)
WITH (oids = false);
--
-- Structure for table tipo_pago (OID = 35949) : 
--
CREATE TABLE public.tipo_pago (
    id serial NOT NULL,
    descripcion varchar(20)
)
WITH (oids = false);
--
-- Structure for table pago (OID = 35955) : 
--
CREATE TABLE public.pago (
    id serial NOT NULL,
    valor money,
    fecha date,
    id_comprobante varchar(20),
    ruta_comprobante varchar(255),
    id_tipo_pago integer NOT NULL,
    id_matricula integer NOT NULL
)
WITH (oids = false);
--
-- Structure for table precio (OID = 35961) : 
--
CREATE TABLE public.precio (
    id serial NOT NULL,
    valor money,
    fecha_inicio date,
    fecha_fin time without time zone,
    id_tipo_precio integer NOT NULL,
    id_promocion integer NOT NULL
)
WITH (oids = false);
--
-- Structure for table maestria (OID = 35967) : 
--
CREATE TABLE public.maestria (
    id serial NOT NULL,
    descripcion varchar(255),
    estado char(1)
)
WITH (oids = false);
--
-- Structure for table requisitos (OID = 35973) : 
--
CREATE TABLE public.requisitos (
    id serial NOT NULL,
    descripcion varchar(255),
    id_maestria integer NOT NULL,
    estado char(1),
    respaldo char(1)
)
WITH (oids = false);
--
-- Structure for table promocion (OID = 35979) : 
--
CREATE TABLE public.promocion (
    id serial NOT NULL,
    descripcion integer,
    fecha_resolucion date,
    fecha_inicio date,
    fecha_fin date,
    cupo integer,
    n_cuotas integer,
    id_maestria integer NOT NULL,
    id_usuario integer NOT NULL
)
WITH (oids = false);
--
-- Structure for table tesis (OID = 35985) : 
--
CREATE TABLE public.tesis (
    id serial NOT NULL,
    titulo varchar(255),
    autor varchar(50),
    fecha date,
    ruta varchar(255),
    resumen text,
    id_maestria integer NOT NULL
)
WITH (oids = false);
--
-- Structure for table palabras_clave (OID = 35994) : 
--
CREATE TABLE public.palabras_clave (
    id serial NOT NULL,
    descripcion varchar(20),
    id_tesis integer NOT NULL
)
WITH (oids = false);
--
-- Structure for table tipo_usuario (OID = 36000) : 
--
CREATE TABLE public.tipo_usuario (
    id serial NOT NULL,
    descripcion varchar(20)
)
WITH (oids = false);
--
-- Structure for table usuario (OID = 36006) : 
--
CREATE TABLE public.usuario (
    id serial NOT NULL,
    ced_pasaporte varchar(20) NOT NULL,
    nombres varchar(30),
    apellidos varchar(30),
    direccion varchar(70),
    telefono varchar(10),
    email varchar,
    estado_civil char(1),
    sexo char(1),
    fecha_nac date,
    celular varchar(10),
    estado char(1),
    nick varchar(10),
    clave char(64),
    usuario_bd varchar(10),
    clave_bd char(64),
    id_tipo_usuario integer NOT NULL
)
WITH (oids = false);
--
-- Structure for table modulo (OID = 36015) : 
--
CREATE TABLE public.modulo (
    id serial NOT NULL,
    descripcion integer,
    creditos integer,
    id_promocion integer NOT NULL,
    id_usuario integer NOT NULL
)
WITH (oids = false);
--
-- Structure for table notas (OID = 36021) : 
--
CREATE TABLE public.notas (
    id serial NOT NULL,
    nota numeric(4,2),
    observacion text,
    estado char(1),
    id_modulo integer NOT NULL,
    nota_texto varchar(50),
    id_matricula integer NOT NULL
)
WITH (oids = false);
--
-- Structure for table asistencia (OID = 36030) : 
--
CREATE TABLE public.asistencia (
    id serial NOT NULL,
    estado char(1),
    observacion varchar(50),
    id_matricula integer NOT NULL,
    id_modulo integer NOT NULL
)
WITH (oids = false);
--
-- Structure for table pais (OID = 36036) : 
--
CREATE TABLE public.pais (
    id serial NOT NULL,
    descripcion varchar(50)
)
WITH (oids = false);
--
-- Structure for table provincia (OID = 36042) : 
--
CREATE TABLE public.provincia (
    id serial NOT NULL,
    descripcion varchar(50),
    id_pais integer NOT NULL,
    codigo varchar(10)
)
WITH (oids = false);
--
-- Structure for table canton (OID = 36048) : 
--
CREATE TABLE public.canton (
    id serial NOT NULL,
    descripcion varchar(50),
    codigo varchar(10),
    id_provincia integer NOT NULL
)
WITH (oids = false);
--
-- Structure for table parroquia (OID = 36054) : 
--
CREATE TABLE public.parroquia (
    id serial NOT NULL,
    descripcion varchar(50),
    codigo varchar(10),
    id_canton integer NOT NULL
)
WITH (oids = false);
--
-- Structure for table permiso (OID = 36060) : 
--
CREATE TABLE public.permiso (
    id serial NOT NULL,
    descripcion varchar(50),
    padre integer,
    form varchar(250),
    orden integer,
    estado char(1)
)
WITH (oids = false);
--
-- Structure for table detalle_permiso (OID = 36066) : 
--
CREATE TABLE public.detalle_permiso (
    id serial NOT NULL,
    id_permiso integer,
    id_usuario integer,
    estado char(1)
)
WITH (oids = false);
--
-- Structure for table datos_dom (OID = 36072) : 
--
CREATE TABLE public.datos_dom (
    id serial NOT NULL,
    direccion varchar(100),
    telefono varchar(10),
    id_parroquia integer,
    id_estudiante integer
)
WITH (oids = false);
--
-- Structure for table datos_lab (OID = 36078) : 
--
CREATE TABLE public.datos_lab (
    id serial NOT NULL,
    empresa varchar(100),
    direccion varchar(100),
    telefono varchar(10),
    email varchar(50),
    id_parroquia integer,
    id_estudiante integer
)
WITH (oids = false);
--
-- Structure for table datos_nac (OID = 36084) : 
--
CREATE TABLE public.datos_nac (
    id serial NOT NULL,
    fecha_nac date,
    id_parroquia integer,
    id_estudiante integer
)
WITH (oids = false);
--
-- Structure for table universidad (OID = 36090) : 
--
CREATE TABLE public.universidad (
    id serial NOT NULL,
    descripcion varchar(100)
)
WITH (oids = false);
--
-- Structure for table estudios_realizados (OID = 36096) : 
--
CREATE TABLE public.estudios_realizados (
    id serial NOT NULL,
    id_estudiante integer,
    id_universidad integer,
    id_titulo integer
)
WITH (oids = false);
--
-- Structure for table titulo (OID = 36102) : 
--
CREATE TABLE public.titulo (
    id serial NOT NULL,
    descripcion varchar(70),
    n_senecyt varchar(20)
)
WITH (oids = false);
--
-- Data for table public.tipo_usuario (OID = 36000) (LIMIT 0,3)
--
INSERT INTO tipo_usuario (id, descripcion)
VALUES (1, 'Administrador');

INSERT INTO tipo_usuario (id, descripcion)
VALUES (2, 'Secretario(a)');

INSERT INTO tipo_usuario (id, descripcion)
VALUES (3, 'Profesor(a)');

--
-- Data for table public.usuario (OID = 36006) (LIMIT 0,2)
--
INSERT INTO usuario (id, ced_pasaporte, nombres, apellidos, direccion, telefono, email, estado_civil, sexo, fecha_nac, celular, estado, nick, clave, usuario_bd, clave_bd, id_tipo_usuario)
VALUES (1, '0928404672', 'chiting peter', 'ching sánchez', 'calle 7 de octubre y tercera', '052751675', 'chiting23@gmail.com', 's', 'm', '1992-09-23', '0993029374', '1', 'admin', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL, 1);

INSERT INTO usuario (id, ced_pasaporte, nombres, apellidos, direccion, telefono, email, estado_civil, sexo, fecha_nac, celular, estado, nick, clave, usuario_bd, clave_bd, id_tipo_usuario)
VALUES (2, '1204466740', 'LUIS', 'GAVILANES', NULL, NULL, 'lujoca12@hotmail.com', 's', 'm', NULL, NULL, '1', 'usuario', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL, 2);

--
-- Data for table public.permiso (OID = 36060) (LIMIT 0,10)
--
INSERT INTO permiso (id, descripcion, padre, form, orden, estado)
VALUES (19, 'REGISTRAR', 18, 'CargarPaginaURL(''cargar_Elementos'',''/SISFIAC/Modulo/Academico/registrarnotas'')', 1, '1');

INSERT INTO permiso (id, descripcion, padre, form, orden, estado)
VALUES (20, 'MAESTRIAS', 0, '', 1, '1');

INSERT INTO permiso (id, descripcion, padre, form, orden, estado)
VALUES (21, 'REGISTRAR', 20, 'CargarPaginaURL(''cargar_Elementos'',''/SISFIAC/Modulo/Academico/registrarMaestrias'')', 1, '1');

INSERT INTO permiso (id, descripcion, padre, form, orden, estado)
VALUES (18, 'NOTAS', 0, NULL, 1, '1');

INSERT INTO permiso (id, descripcion, padre, form, orden, estado)
VALUES (7, 'ASISTENCIA', 0, '', 1, '1');

INSERT INTO permiso (id, descripcion, padre, form, orden, estado)
VALUES (15, 'NUEVA', 7, 'CargarPaginaURL(''cargar_Elementos'',''/SISFIAC/Modulo/Academico/registrarAsistencias'')', 1, '1');

INSERT INTO permiso (id, descripcion, padre, form, orden, estado)
VALUES (17, 'ELIMINAR', 5, 'CargarPaginaURL(''cargar_Elementos'',''/SISFIAC/Modulo/Academico/eliminarDocente'')', 3, '1');

INSERT INTO permiso (id, descripcion, padre, form, orden, estado)
VALUES (16, 'MODIFICAR', 5, 'CargarPaginaURL(''cargar_Elementos'',''/SISFIAC/Modulo/Academico/modificarDocente'')', 2, '1');

INSERT INTO permiso (id, descripcion, padre, form, orden, estado)
VALUES (14, 'NUEVO', 5, 'CargarPaginaURL(''cargar_Elementos'',''/SISFIAC/Modulo/Academico/registrarDocente'')', 1, '1');

INSERT INTO permiso (id, descripcion, padre, form, orden, estado)
VALUES (5, 'DOCENTES', 0, '', 1, '1');

--
-- Data for table public.detalle_permiso (OID = 36066) (LIMIT 0,16)
--
INSERT INTO detalle_permiso (id, id_permiso, id_usuario, estado)
VALUES (40, 7, 1, '1');

INSERT INTO detalle_permiso (id, id_permiso, id_usuario, estado)
VALUES (39, 15, 1, '1');

INSERT INTO detalle_permiso (id, id_permiso, id_usuario, estado)
VALUES (45, 21, 1, '1');

INSERT INTO detalle_permiso (id, id_permiso, id_usuario, estado)
VALUES (46, 20, 1, '1');

INSERT INTO detalle_permiso (id, id_permiso, id_usuario, estado)
VALUES (47, 18, 1, '1');

INSERT INTO detalle_permiso (id, id_permiso, id_usuario, estado)
VALUES (48, 19, 1, '1');

INSERT INTO detalle_permiso (id, id_permiso, id_usuario, estado)
VALUES (43, 14, 2, '1');

INSERT INTO detalle_permiso (id, id_permiso, id_usuario, estado)
VALUES (42, 16, 2, '1');

INSERT INTO detalle_permiso (id, id_permiso, id_usuario, estado)
VALUES (41, 5, 2, '1');

INSERT INTO detalle_permiso (id, id_permiso, id_usuario, estado)
VALUES (44, 17, 2, '1');

INSERT INTO detalle_permiso (id, id_permiso, id_usuario, estado)
VALUES (52, 17, 1, '1');

INSERT INTO detalle_permiso (id, id_permiso, id_usuario, estado)
VALUES (51, 16, 1, '1');

INSERT INTO detalle_permiso (id, id_permiso, id_usuario, estado)
VALUES (50, 14, 1, '1');

INSERT INTO detalle_permiso (id, id_permiso, id_usuario, estado)
VALUES (49, 5, 1, '1');

INSERT INTO detalle_permiso (id, id_permiso, id_usuario, estado)
VALUES (53, 21, 2, '1');

INSERT INTO detalle_permiso (id, id_permiso, id_usuario, estado)
VALUES (54, 20, 2, '1');

--
-- Definition for index permiso_pkey (OID = 36106) : 
--
ALTER TABLE ONLY permiso
    ADD CONSTRAINT permiso_pkey
    PRIMARY KEY (id);
--
-- Definition for index detalle_permisos_pkey (OID = 36108) : 
--
ALTER TABLE ONLY detalle_permiso
    ADD CONSTRAINT detalle_permisos_pkey
    PRIMARY KEY (id);
--
-- Definition for index datos_dom_pkey (OID = 36110) : 
--
ALTER TABLE ONLY datos_dom
    ADD CONSTRAINT datos_dom_pkey
    PRIMARY KEY (id);
--
-- Definition for index datos_lab_pkey (OID = 36112) : 
--
ALTER TABLE ONLY datos_lab
    ADD CONSTRAINT datos_lab_pkey
    PRIMARY KEY (id);
--
-- Definition for index datos_nac_pkey (OID = 36114) : 
--
ALTER TABLE ONLY datos_nac
    ADD CONSTRAINT datos_nac_pkey
    PRIMARY KEY (id);
--
-- Definition for index universidad_pkey (OID = 36116) : 
--
ALTER TABLE ONLY universidad
    ADD CONSTRAINT universidad_pkey
    PRIMARY KEY (id);
--
-- Definition for index estudios_realizados_pkey (OID = 36118) : 
--
ALTER TABLE ONLY estudios_realizados
    ADD CONSTRAINT estudios_realizados_pkey
    PRIMARY KEY (id);
--
-- Definition for index titulo_pkey (OID = 36120) : 
--
ALTER TABLE ONLY titulo
    ADD CONSTRAINT titulo_pkey
    PRIMARY KEY (id);
--
-- Definition for index tipo_precio_pkey (OID = 36122) : 
--
ALTER TABLE ONLY tipo_precio
    ADD CONSTRAINT tipo_precio_pkey
    PRIMARY KEY (id);
--
-- Definition for index matricula_pkey (OID = 36124) : 
--
ALTER TABLE ONLY matricula
    ADD CONSTRAINT matricula_pkey
    PRIMARY KEY (id);
--
-- Definition for index tipo_pago_pkey (OID = 36126) : 
--
ALTER TABLE ONLY tipo_pago
    ADD CONSTRAINT tipo_pago_pkey
    PRIMARY KEY (id);
--
-- Definition for index pago_pkey (OID = 36128) : 
--
ALTER TABLE ONLY pago
    ADD CONSTRAINT pago_pkey
    PRIMARY KEY (id);
--
-- Definition for index pago_fk (OID = 36130) : 
--
ALTER TABLE ONLY pago
    ADD CONSTRAINT pago_fk
    FOREIGN KEY (id_tipo_pago) REFERENCES tipo_pago(id);
--
-- Definition for index precio_pkey (OID = 36135) : 
--
ALTER TABLE ONLY precio
    ADD CONSTRAINT precio_pkey
    PRIMARY KEY (id);
--
-- Definition for index precio_fk (OID = 36137) : 
--
ALTER TABLE ONLY precio
    ADD CONSTRAINT precio_fk
    FOREIGN KEY (id_tipo_precio) REFERENCES tipo_precio(id);
--
-- Definition for index maestria_pkey (OID = 36142) : 
--
ALTER TABLE ONLY maestria
    ADD CONSTRAINT maestria_pkey
    PRIMARY KEY (id);
--
-- Definition for index requisitos_pkey (OID = 36144) : 
--
ALTER TABLE ONLY requisitos
    ADD CONSTRAINT requisitos_pkey
    PRIMARY KEY (id);
--
-- Definition for index requisitos_fk (OID = 36146) : 
--
ALTER TABLE ONLY requisitos
    ADD CONSTRAINT requisitos_fk
    FOREIGN KEY (id_maestria) REFERENCES maestria(id);
--
-- Definition for index pago_fk1 (OID = 36151) : 
--
ALTER TABLE ONLY pago
    ADD CONSTRAINT pago_fk1
    FOREIGN KEY (id_matricula) REFERENCES matricula(id);
--
-- Definition for index promocion_pkey (OID = 36156) : 
--
ALTER TABLE ONLY promocion
    ADD CONSTRAINT promocion_pkey
    PRIMARY KEY (id);
--
-- Definition for index promocion_fk (OID = 36158) : 
--
ALTER TABLE ONLY promocion
    ADD CONSTRAINT promocion_fk
    FOREIGN KEY (id_maestria) REFERENCES maestria(id);
--
-- Definition for index precio_fk1 (OID = 36163) : 
--
ALTER TABLE ONLY precio
    ADD CONSTRAINT precio_fk1
    FOREIGN KEY (id_promocion) REFERENCES promocion(id);
--
-- Definition for index matricula_fk1 (OID = 36168) : 
--
ALTER TABLE ONLY matricula
    ADD CONSTRAINT matricula_fk1
    FOREIGN KEY (id_promocion) REFERENCES promocion(id);
--
-- Definition for index tesis_pkey (OID = 36173) : 
--
ALTER TABLE ONLY tesis
    ADD CONSTRAINT tesis_pkey
    PRIMARY KEY (id);
--
-- Definition for index tesis_fk (OID = 36175) : 
--
ALTER TABLE ONLY tesis
    ADD CONSTRAINT tesis_fk
    FOREIGN KEY (id_maestria) REFERENCES maestria(id);
--
-- Definition for index palabras_clave_pkey (OID = 36180) : 
--
ALTER TABLE ONLY palabras_clave
    ADD CONSTRAINT palabras_clave_pkey
    PRIMARY KEY (id);
--
-- Definition for index palabras_clave_fk (OID = 36182) : 
--
ALTER TABLE ONLY palabras_clave
    ADD CONSTRAINT palabras_clave_fk
    FOREIGN KEY (id_tesis) REFERENCES tesis(id);
--
-- Definition for index tipo_usuario_pkey (OID = 36187) : 
--
ALTER TABLE ONLY tipo_usuario
    ADD CONSTRAINT tipo_usuario_pkey
    PRIMARY KEY (id);
--
-- Definition for index usuario_fk (OID = 36189) : 
--
ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_fk
    FOREIGN KEY (id_tipo_usuario) REFERENCES tipo_usuario(id);
--
-- Definition for index modulo_pkey (OID = 36194) : 
--
ALTER TABLE ONLY modulo
    ADD CONSTRAINT modulo_pkey
    PRIMARY KEY (id);
--
-- Definition for index modulo_fk1 (OID = 36196) : 
--
ALTER TABLE ONLY modulo
    ADD CONSTRAINT modulo_fk1
    FOREIGN KEY (id_promocion) REFERENCES promocion(id);
--
-- Definition for index notas_pkey (OID = 36201) : 
--
ALTER TABLE ONLY notas
    ADD CONSTRAINT notas_pkey
    PRIMARY KEY (id);
--
-- Definition for index notas_fk (OID = 36203) : 
--
ALTER TABLE ONLY notas
    ADD CONSTRAINT notas_fk
    FOREIGN KEY (id_matricula) REFERENCES matricula(id);
--
-- Definition for index notas_fk1 (OID = 36208) : 
--
ALTER TABLE ONLY notas
    ADD CONSTRAINT notas_fk1
    FOREIGN KEY (id_modulo) REFERENCES modulo(id);
--
-- Definition for index asistencia_pkey (OID = 36213) : 
--
ALTER TABLE ONLY asistencia
    ADD CONSTRAINT asistencia_pkey
    PRIMARY KEY (id);
--
-- Definition for index asistencia_fk (OID = 36215) : 
--
ALTER TABLE ONLY asistencia
    ADD CONSTRAINT asistencia_fk
    FOREIGN KEY (id_modulo) REFERENCES modulo(id);
--
-- Definition for index asistencia_fk1 (OID = 36220) : 
--
ALTER TABLE ONLY asistencia
    ADD CONSTRAINT asistencia_fk1
    FOREIGN KEY (id_matricula) REFERENCES matricula(id);
--
-- Definition for index pais_pkey (OID = 36225) : 
--
ALTER TABLE ONLY pais
    ADD CONSTRAINT pais_pkey
    PRIMARY KEY (id);
--
-- Definition for index provincia_pkey (OID = 36227) : 
--
ALTER TABLE ONLY provincia
    ADD CONSTRAINT provincia_pkey
    PRIMARY KEY (id);
--
-- Definition for index provincia_fk (OID = 36229) : 
--
ALTER TABLE ONLY provincia
    ADD CONSTRAINT provincia_fk
    FOREIGN KEY (id_pais) REFERENCES pais(id);
--
-- Definition for index canton_pkey (OID = 36234) : 
--
ALTER TABLE ONLY canton
    ADD CONSTRAINT canton_pkey
    PRIMARY KEY (id);
--
-- Definition for index parroquia_pkey (OID = 36236) : 
--
ALTER TABLE ONLY parroquia
    ADD CONSTRAINT parroquia_pkey
    PRIMARY KEY (id);
--
-- Definition for index canton_fk (OID = 36238) : 
--
ALTER TABLE ONLY canton
    ADD CONSTRAINT canton_fk
    FOREIGN KEY (id_provincia) REFERENCES provincia(id);
--
-- Definition for index parroquia_fk (OID = 36243) : 
--
ALTER TABLE ONLY parroquia
    ADD CONSTRAINT parroquia_fk
    FOREIGN KEY (id_canton) REFERENCES canton(id);
--
-- Definition for index entrevista_pkey (OID = 36248) : 
--
ALTER TABLE ONLY entrevista
    ADD CONSTRAINT entrevista_pkey
    PRIMARY KEY (id);
--
-- Definition for index estudiante_pkey (OID = 36250) : 
--
ALTER TABLE ONLY estudiante
    ADD CONSTRAINT estudiante_pkey
    PRIMARY KEY (id);
--
-- Definition for index entrevista_fk (OID = 36252) : 
--
ALTER TABLE ONLY entrevista
    ADD CONSTRAINT entrevista_fk
    FOREIGN KEY (id_estudiante) REFERENCES estudiante(id);
--
-- Definition for index matricula_fk (OID = 36257) : 
--
ALTER TABLE ONLY matricula
    ADD CONSTRAINT matricula_fk
    FOREIGN KEY (id_estudiante) REFERENCES estudiante(id);
--
-- Definition for index usuario_pkey (OID = 36262) : 
--
ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey
    PRIMARY KEY (id);
--
-- Definition for index modulo_fk (OID = 36264) : 
--
ALTER TABLE ONLY modulo
    ADD CONSTRAINT modulo_fk
    FOREIGN KEY (id_usuario) REFERENCES usuario(id);
--
-- Definition for index datos_dom_fk (OID = 36269) : 
--
ALTER TABLE ONLY datos_dom
    ADD CONSTRAINT datos_dom_fk
    FOREIGN KEY (id_parroquia) REFERENCES parroquia(id);
--
-- Definition for index datos_dom_fk1 (OID = 36274) : 
--
ALTER TABLE ONLY datos_dom
    ADD CONSTRAINT datos_dom_fk1
    FOREIGN KEY (id_estudiante) REFERENCES estudiante(id);
--
-- Definition for index datos_lab_fk (OID = 36279) : 
--
ALTER TABLE ONLY datos_lab
    ADD CONSTRAINT datos_lab_fk
    FOREIGN KEY (id_parroquia) REFERENCES parroquia(id);
--
-- Definition for index datos_lab_fk1 (OID = 36284) : 
--
ALTER TABLE ONLY datos_lab
    ADD CONSTRAINT datos_lab_fk1
    FOREIGN KEY (id_estudiante) REFERENCES estudiante(id);
--
-- Definition for index datos_nac_fk (OID = 36289) : 
--
ALTER TABLE ONLY datos_nac
    ADD CONSTRAINT datos_nac_fk
    FOREIGN KEY (id_parroquia) REFERENCES parroquia(id);
--
-- Definition for index datos_nac_fk1 (OID = 36294) : 
--
ALTER TABLE ONLY datos_nac
    ADD CONSTRAINT datos_nac_fk1
    FOREIGN KEY (id_estudiante) REFERENCES estudiante(id);
--
-- Definition for index estudios_realizados_fk (OID = 36299) : 
--
ALTER TABLE ONLY estudios_realizados
    ADD CONSTRAINT estudios_realizados_fk
    FOREIGN KEY (id_universidad) REFERENCES universidad(id);
--
-- Definition for index estudios_realizados_fk1 (OID = 36304) : 
--
ALTER TABLE ONLY estudios_realizados
    ADD CONSTRAINT estudios_realizados_fk1
    FOREIGN KEY (id_estudiante) REFERENCES estudiante(id);
--
-- Definition for index estudios_realizados_fk2 (OID = 36309) : 
--
ALTER TABLE ONLY estudios_realizados
    ADD CONSTRAINT estudios_realizados_fk2
    FOREIGN KEY (id_titulo) REFERENCES titulo(id);
--
-- Definition for index detalle_permiso_fk (OID = 36314) : 
--
ALTER TABLE ONLY detalle_permiso
    ADD CONSTRAINT detalle_permiso_fk
    FOREIGN KEY (id_usuario) REFERENCES usuario(id);
--
-- Definition for index detalle_permiso_fk2 (OID = 36319) : 
--
ALTER TABLE ONLY detalle_permiso
    ADD CONSTRAINT detalle_permiso_fk2
    FOREIGN KEY (id_permiso) REFERENCES permiso(id);
--
-- Data for sequence public.estudiante_id_seq (OID = 35923)
--
SELECT pg_catalog.setval('estudiante_id_seq', 1, false);
--
-- Data for sequence public.entrevista_id_seq (OID = 35929)
--
SELECT pg_catalog.setval('entrevista_id_seq', 1, false);
--
-- Data for sequence public.tipo_precio_id_seq (OID = 35935)
--
SELECT pg_catalog.setval('tipo_precio_id_seq', 1, false);
--
-- Data for sequence public.matricula_id_seq (OID = 35941)
--
SELECT pg_catalog.setval('matricula_id_seq', 1, false);
--
-- Data for sequence public.tipo_pago_id_seq (OID = 35947)
--
SELECT pg_catalog.setval('tipo_pago_id_seq', 1, false);
--
-- Data for sequence public.pago_id_seq (OID = 35953)
--
SELECT pg_catalog.setval('pago_id_seq', 1, false);
--
-- Data for sequence public.precio_id_seq (OID = 35959)
--
SELECT pg_catalog.setval('precio_id_seq', 1, false);
--
-- Data for sequence public.maestria_id_seq (OID = 35965)
--
SELECT pg_catalog.setval('maestria_id_seq', 1, false);
--
-- Data for sequence public.requisitos_id_seq (OID = 35971)
--
SELECT pg_catalog.setval('requisitos_id_seq', 1, false);
--
-- Data for sequence public.promocion_id_seq (OID = 35977)
--
SELECT pg_catalog.setval('promocion_id_seq', 1, false);
--
-- Data for sequence public.tesis_id_seq (OID = 35983)
--
SELECT pg_catalog.setval('tesis_id_seq', 1, false);
--
-- Data for sequence public.palabras_clave_id_seq (OID = 35992)
--
SELECT pg_catalog.setval('palabras_clave_id_seq', 1, false);
--
-- Data for sequence public.tipo_usuario_id_seq (OID = 35998)
--
SELECT pg_catalog.setval('tipo_usuario_id_seq', 3, true);
--
-- Data for sequence public.usuario_id_seq (OID = 36004)
--
SELECT pg_catalog.setval('usuario_id_seq', 2, true);
--
-- Data for sequence public.modulo_id_seq (OID = 36013)
--
SELECT pg_catalog.setval('modulo_id_seq', 1, false);
--
-- Data for sequence public.notas_id_seq (OID = 36019)
--
SELECT pg_catalog.setval('notas_id_seq', 1, false);
--
-- Data for sequence public.asistencia_id_seq (OID = 36028)
--
SELECT pg_catalog.setval('asistencia_id_seq', 1, false);
--
-- Data for sequence public.pais_id_seq (OID = 36034)
--
SELECT pg_catalog.setval('pais_id_seq', 1, false);
--
-- Data for sequence public.provincia_id_seq (OID = 36040)
--
SELECT pg_catalog.setval('provincia_id_seq', 1, false);
--
-- Data for sequence public.canton_id_seq (OID = 36046)
--
SELECT pg_catalog.setval('canton_id_seq', 1, false);
--
-- Data for sequence public.parroquia_id_seq (OID = 36052)
--
SELECT pg_catalog.setval('parroquia_id_seq', 1, false);
--
-- Data for sequence public.permiso_id_seq (OID = 36058)
--
SELECT pg_catalog.setval('permiso_id_seq', 21, true);
--
-- Data for sequence public.detalle_permiso_id_seq (OID = 36064)
--
SELECT pg_catalog.setval('detalle_permiso_id_seq', 54, true);
--
-- Data for sequence public.datos_dom_id_seq (OID = 36070)
--
SELECT pg_catalog.setval('datos_dom_id_seq', 1, false);
--
-- Data for sequence public.datos_lab_id_seq (OID = 36076)
--
SELECT pg_catalog.setval('datos_lab_id_seq', 1, false);
--
-- Data for sequence public.datos_nac_id_seq (OID = 36082)
--
SELECT pg_catalog.setval('datos_nac_id_seq', 1, false);
--
-- Data for sequence public.universidad_id_seq (OID = 36088)
--
SELECT pg_catalog.setval('universidad_id_seq', 1, false);
--
-- Data for sequence public.estudios_realizados_id_seq (OID = 36094)
--
SELECT pg_catalog.setval('estudios_realizados_id_seq', 1, false);
--
-- Data for sequence public.titulo_id_seq (OID = 36100)
--
SELECT pg_catalog.setval('titulo_id_seq', 1, false);
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';
