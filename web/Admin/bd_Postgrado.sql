-- SQL Manager for PostgreSQL 5.5.1.45206
-- ---------------------------------------
-- Host      : localhost
-- Database  : bd_Postgrado
-- Version   : PostgreSQL 9.5.0, compiled by Visual C++ build 1800, 32-bit



SET search_path = public, pg_catalog;
ALTER TABLE ONLY public.provincia DROP CONSTRAINT provincia_fk;
ALTER TABLE ONLY public.ciudad DROP CONSTRAINT ciudad_fk;
ALTER TABLE ONLY public.ciudad DROP CONSTRAINT ciudad_pkey;
ALTER TABLE ONLY public.provincia DROP CONSTRAINT provincia_pkey;
ALTER TABLE ONLY public.pais DROP CONSTRAINT pais_pkey;
ALTER TABLE ONLY public.asistencia DROP CONSTRAINT asistencia_fk1;
ALTER TABLE ONLY public.asistencia DROP CONSTRAINT asistencia_fk;
ALTER TABLE ONLY public.asistencia DROP CONSTRAINT asistencia_pkey;
ALTER TABLE ONLY public.notas DROP CONSTRAINT notas_fk1;
ALTER TABLE ONLY public.notas DROP CONSTRAINT notas_fk;
ALTER TABLE ONLY public.notas DROP CONSTRAINT notas_pkey;
ALTER TABLE ONLY public.modulo DROP CONSTRAINT modulo_fk1;
ALTER TABLE ONLY public.modulo DROP CONSTRAINT modulo_fk;
ALTER TABLE ONLY public.modulo DROP CONSTRAINT modulo_pkey;
ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_fk;
ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
ALTER TABLE ONLY public.tipo_usuario DROP CONSTRAINT tipo_usuario_pkey;
ALTER TABLE ONLY public.palabras_clave DROP CONSTRAINT palabras_clave_fk;
ALTER TABLE ONLY public.palabras_clave DROP CONSTRAINT palabras_clave_pkey;
ALTER TABLE ONLY public.tesis DROP CONSTRAINT tesis_fk;
ALTER TABLE ONLY public.tesis DROP CONSTRAINT tesis_pkey;
ALTER TABLE ONLY public.matricula DROP CONSTRAINT matricula_fk1;
ALTER TABLE ONLY public.precio DROP CONSTRAINT precio_fk1;
ALTER TABLE ONLY public.promocion DROP CONSTRAINT promocion_fk;
ALTER TABLE ONLY public.promocion DROP CONSTRAINT promocion_pkey;
ALTER TABLE ONLY public.pago DROP CONSTRAINT pago_fk1;
ALTER TABLE ONLY public.matricula DROP CONSTRAINT matricula_fk;
ALTER TABLE ONLY public.fi_entrevista DROP CONSTRAINT fi_entrevista_fk;
ALTER TABLE ONLY public.requisitos DROP CONSTRAINT requisitos_fk;
ALTER TABLE ONLY public.requisitos DROP CONSTRAINT requisitos_pkey;
ALTER TABLE ONLY public.maestria DROP CONSTRAINT maestria_pkey;
ALTER TABLE ONLY public.precio DROP CONSTRAINT precio_fk;
ALTER TABLE ONLY public.precio DROP CONSTRAINT precio_pkey;
ALTER TABLE ONLY public.pago DROP CONSTRAINT pago_fk;
ALTER TABLE ONLY public.pago DROP CONSTRAINT pago_pkey;
ALTER TABLE ONLY public.tipo_pago DROP CONSTRAINT tipo_pago_pkey;
ALTER TABLE ONLY public.matricula DROP CONSTRAINT matricula_pkey;
ALTER TABLE ONLY public.tipo_precio DROP CONSTRAINT tipo_precio_pkey;
ALTER TABLE ONLY public.fi_entrevista DROP CONSTRAINT fi_entrevista_pkey;
ALTER TABLE ONLY public.fi_estudiante DROP CONSTRAINT fi_estudiante_pkey;
DROP FUNCTION public.usuario_acceso (userr varchar, passs varchar);
DROP TABLE public.ciudad;
DROP TABLE public.provincia;
DROP TABLE public.pais;
DROP TABLE public.asistencia;
DROP TABLE public.notas;
DROP TABLE public.modulo;
DROP TABLE public.usuario;
DROP TABLE public.tipo_usuario;
DROP TABLE public.palabras_clave;
DROP TABLE public.tesis;
DROP TABLE public.promocion;
DROP TABLE public.requisitos;
DROP TABLE public.maestria;
DROP TABLE public.precio;
DROP TABLE public.pago;
DROP TABLE public.tipo_pago;
DROP TABLE public.matricula;
DROP TABLE public.tipo_precio;
DROP TABLE public.fi_entrevista;
DROP TABLE public.fi_estudiante;
SET check_function_bodies = false;
--
-- Definition for function usuario_acceso (OID = 25121) : 
--
CREATE FUNCTION public.usuario_acceso (
  userr character varying,
  passs character varying
)
RETURNS TABLE (
  usr_nombres character varying,
  usr_apellidos character varying,
  usr_cedula character varying,
  role_name character varying
)
AS 
$body$
select public.usuario.nombres, 
public.usuario.apellidos,
public.usuario.ced_pasaporte,
tipo_usuario.descripcion 
from public.tipo_usuario  
inner join public.usuario 
on public.tipo_usuario.id=public.usuario.id_tipo_usuario 
where usuario.clave =passs and usuario.nick =userr;
$body$
LANGUAGE sql;
--
-- Structure for table fi_estudiante (OID = 24849) : 
--
CREATE TABLE public.fi_estudiante (
    ced_pasaporte varchar(20) NOT NULL,
    nombres varchar(50),
    apellidos varchar(50),
    email varchar(50),
    celular varchar(10),
    fecha_nac date,
    ciudad_nac varchar(50),
    provincia_nac varchar(50),
    pais_nac varchar(30),
    sexo char(1),
    estado_civil char(1),
    ciudad_domicilio varchar(50),
    provincia_domicilio varchar(50),
    pais_domicilio varchar(30),
    ciudad_trabajo varchar(50),
    provincia_trabajo varchar(50),
    pais_trabajo varchar(30),
    ciudad_titulo varchar(50),
    provincia_titulo varchar(50),
    pais_titulo varchar(30),
    universidad_titulo varchar(70),
    titulo varchar(50),
    lugar_trabajo varchar(50),
    cargo varchar(30),
    direccion_trabajo varchar(70),
    direccion_domicilio varchar(70),
    telefono_domicilio varchar(10),
    telefono_trabajo varchar(10),
    email_trabajo varchar(50)
)
WITH (oids = false);
--
-- Structure for table fi_entrevista (OID = 24857) : 
--
CREATE TABLE public.fi_entrevista (
    id serial NOT NULL,
    lugar varchar(50),
    fecha date,
    hora time without time zone,
    ruta_requisitos varchar(255),
    estado char(1),
    ced_pasaporte varchar(20) NOT NULL
)
WITH (oids = false);
--
-- Structure for table tipo_precio (OID = 24863) : 
--
CREATE TABLE public.tipo_precio (
    id serial NOT NULL,
    descripcion varchar(50),
    estado char(1)
)
WITH (oids = false);
--
-- Structure for table matricula (OID = 24867) : 
--
CREATE TABLE public.matricula (
    n_matricula integer NOT NULL,
    fecha_matricula date,
    dsc_colegiatura integer,
    fecha_graduacion date,
    estado char(1),
    ced_pasaporte varchar(20) NOT NULL,
    id_promocion integer NOT NULL
)
WITH (oids = false);
--
-- Structure for table tipo_pago (OID = 24872) : 
--
CREATE TABLE public.tipo_pago (
    id serial NOT NULL,
    descripcion varchar(20)
)
WITH (oids = false);
--
-- Structure for table pago (OID = 24878) : 
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
-- Structure for table precio (OID = 24884) : 
--
CREATE TABLE public.precio (
    id serial NOT NULL,
    valor money,
    fecha_inicio date,
    fecha_fin time without time zone,
    id_tipo_precio integer NOT NULL,
    id_maestria integer NOT NULL
)
WITH (oids = false);
--
-- Structure for table maestria (OID = 24890) : 
--
CREATE TABLE public.maestria (
    id serial NOT NULL,
    descripcion varchar(255),
    estado char(1)
)
WITH (oids = false);
--
-- Structure for table requisitos (OID = 24896) : 
--
CREATE TABLE public.requisitos (
    id serial NOT NULL,
    descripcion varchar(255),
    id_maestria integer NOT NULL,
    estado char(1)
)
WITH (oids = false);
--
-- Structure for table promocion (OID = 24902) : 
--
CREATE TABLE public.promocion (
    id serial NOT NULL,
    fecha_resolucion date,
    descripcion varchar(70),
    fecha_inicio date,
    fecha_fin date,
    cupo integer,
    n_cuotas integer,
    id_maestria integer NOT NULL
)
WITH (oids = false);
--
-- Structure for table tesis (OID = 24908) : 
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
-- Structure for table palabras_clave (OID = 24917) : 
--
CREATE TABLE public.palabras_clave (
    id serial NOT NULL,
    descripcion varchar(20),
    id_tesis integer NOT NULL
)
WITH (oids = false);
--
-- Structure for table tipo_usuario (OID = 24923) : 
--
CREATE TABLE public.tipo_usuario (
    id serial NOT NULL,
    descripcion varchar(20)
)
WITH (oids = false);
--
-- Structure for table usuario (OID = 24927) : 
--
CREATE TABLE public.usuario (
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
    clave char(64),
    id_tipo_usuario integer NOT NULL,
    estado char(1),
    nick varchar(10)
)
WITH (oids = false);
--
-- Structure for table modulo (OID = 24935) : 
--
CREATE TABLE public.modulo (
    id serial NOT NULL,
    descripcion varchar(10),
    ced_usuario varchar(20) NOT NULL,
    creditos integer,
    id_promocion integer NOT NULL
)
WITH (oids = false);
--
-- Structure for table notas (OID = 24941) : 
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
-- Structure for table asistencia (OID = 24950) : 
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
-- Structure for table pais (OID = 24956) : 
--
CREATE TABLE public.pais (
    id serial NOT NULL,
    descripcion varchar(50)
)
WITH (oids = false);
--
-- Structure for table provincia (OID = 24962) : 
--
CREATE TABLE public.provincia (
    id serial NOT NULL,
    descripcion varchar(50),
    id_pais integer NOT NULL
)
WITH (oids = false);
--
-- Structure for table ciudad (OID = 24968) : 
--
CREATE TABLE public.ciudad (
    id serial NOT NULL,
    descripcion varchar(50),
    id_provincia integer NOT NULL
)
WITH (oids = false);
--
-- Data for table public.tipo_usuario (OID = 24923) (LIMIT 0,2)
--
INSERT INTO tipo_usuario (id, descripcion)
VALUES (1, 'Administrador');

INSERT INTO tipo_usuario (id, descripcion)
VALUES (2, 'Secretario(a)');

--
-- Data for table public.usuario (OID = 24927) (LIMIT 0,1)
--
INSERT INTO usuario (ced_pasaporte, nombres, apellidos, direccion, telefono, email, estado_civil, sexo, fecha_nac, celular, clave, id_tipo_usuario, estado, nick)
VALUES ('1204466740', 'LUIS', 'GAVILANES', NULL, NULL, 'lujoca12@hotmail.com', NULL, NULL, '1986-12-09', NULL, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, NULL, NULL);

--
-- Definition for index fi_estudiante_pkey (OID = 24972) : 
--
ALTER TABLE ONLY fi_estudiante
    ADD CONSTRAINT fi_estudiante_pkey
    PRIMARY KEY (ced_pasaporte);
--
-- Definition for index fi_entrevista_pkey (OID = 24974) : 
--
ALTER TABLE ONLY fi_entrevista
    ADD CONSTRAINT fi_entrevista_pkey
    PRIMARY KEY (id);
--
-- Definition for index tipo_precio_pkey (OID = 24976) : 
--
ALTER TABLE ONLY tipo_precio
    ADD CONSTRAINT tipo_precio_pkey
    PRIMARY KEY (id);
--
-- Definition for index matricula_pkey (OID = 24978) : 
--
ALTER TABLE ONLY matricula
    ADD CONSTRAINT matricula_pkey
    PRIMARY KEY (n_matricula);
--
-- Definition for index tipo_pago_pkey (OID = 24980) : 
--
ALTER TABLE ONLY tipo_pago
    ADD CONSTRAINT tipo_pago_pkey
    PRIMARY KEY (id);
--
-- Definition for index pago_pkey (OID = 24982) : 
--
ALTER TABLE ONLY pago
    ADD CONSTRAINT pago_pkey
    PRIMARY KEY (id);
--
-- Definition for index pago_fk (OID = 24984) : 
--
ALTER TABLE ONLY pago
    ADD CONSTRAINT pago_fk
    FOREIGN KEY (id_tipo_pago) REFERENCES tipo_pago(id);
--
-- Definition for index precio_pkey (OID = 24989) : 
--
ALTER TABLE ONLY precio
    ADD CONSTRAINT precio_pkey
    PRIMARY KEY (id);
--
-- Definition for index precio_fk (OID = 24991) : 
--
ALTER TABLE ONLY precio
    ADD CONSTRAINT precio_fk
    FOREIGN KEY (id_tipo_precio) REFERENCES tipo_precio(id);
--
-- Definition for index maestria_pkey (OID = 24996) : 
--
ALTER TABLE ONLY maestria
    ADD CONSTRAINT maestria_pkey
    PRIMARY KEY (id);
--
-- Definition for index requisitos_pkey (OID = 24998) : 
--
ALTER TABLE ONLY requisitos
    ADD CONSTRAINT requisitos_pkey
    PRIMARY KEY (id);
--
-- Definition for index requisitos_fk (OID = 25000) : 
--
ALTER TABLE ONLY requisitos
    ADD CONSTRAINT requisitos_fk
    FOREIGN KEY (id_maestria) REFERENCES maestria(id);
--
-- Definition for index fi_entrevista_fk (OID = 25005) : 
--
ALTER TABLE ONLY fi_entrevista
    ADD CONSTRAINT fi_entrevista_fk
    FOREIGN KEY (ced_pasaporte) REFERENCES fi_estudiante(ced_pasaporte) ON UPDATE CASCADE;
--
-- Definition for index matricula_fk (OID = 25010) : 
--
ALTER TABLE ONLY matricula
    ADD CONSTRAINT matricula_fk
    FOREIGN KEY (ced_pasaporte) REFERENCES fi_estudiante(ced_pasaporte) ON UPDATE CASCADE;
--
-- Definition for index pago_fk1 (OID = 25015) : 
--
ALTER TABLE ONLY pago
    ADD CONSTRAINT pago_fk1
    FOREIGN KEY (id_matricula) REFERENCES matricula(n_matricula) ON UPDATE CASCADE;
--
-- Definition for index promocion_pkey (OID = 25020) : 
--
ALTER TABLE ONLY promocion
    ADD CONSTRAINT promocion_pkey
    PRIMARY KEY (id);
--
-- Definition for index promocion_fk (OID = 25022) : 
--
ALTER TABLE ONLY promocion
    ADD CONSTRAINT promocion_fk
    FOREIGN KEY (id_maestria) REFERENCES maestria(id);
--
-- Definition for index precio_fk1 (OID = 25027) : 
--
ALTER TABLE ONLY precio
    ADD CONSTRAINT precio_fk1
    FOREIGN KEY (id_maestria) REFERENCES maestria(id);
--
-- Definition for index matricula_fk1 (OID = 25032) : 
--
ALTER TABLE ONLY matricula
    ADD CONSTRAINT matricula_fk1
    FOREIGN KEY (id_promocion) REFERENCES promocion(id);
--
-- Definition for index tesis_pkey (OID = 25037) : 
--
ALTER TABLE ONLY tesis
    ADD CONSTRAINT tesis_pkey
    PRIMARY KEY (id);
--
-- Definition for index tesis_fk (OID = 25039) : 
--
ALTER TABLE ONLY tesis
    ADD CONSTRAINT tesis_fk
    FOREIGN KEY (id_maestria) REFERENCES maestria(id);
--
-- Definition for index palabras_clave_pkey (OID = 25044) : 
--
ALTER TABLE ONLY palabras_clave
    ADD CONSTRAINT palabras_clave_pkey
    PRIMARY KEY (id);
--
-- Definition for index palabras_clave_fk (OID = 25046) : 
--
ALTER TABLE ONLY palabras_clave
    ADD CONSTRAINT palabras_clave_fk
    FOREIGN KEY (id_tesis) REFERENCES tesis(id);
--
-- Definition for index tipo_usuario_pkey (OID = 25051) : 
--
ALTER TABLE ONLY tipo_usuario
    ADD CONSTRAINT tipo_usuario_pkey
    PRIMARY KEY (id);
--
-- Definition for index usuario_pkey (OID = 25053) : 
--
ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey
    PRIMARY KEY (ced_pasaporte);
--
-- Definition for index usuario_fk (OID = 25055) : 
--
ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_fk
    FOREIGN KEY (id_tipo_usuario) REFERENCES tipo_usuario(id);
--
-- Definition for index modulo_pkey (OID = 25060) : 
--
ALTER TABLE ONLY modulo
    ADD CONSTRAINT modulo_pkey
    PRIMARY KEY (id);
--
-- Definition for index modulo_fk (OID = 25062) : 
--
ALTER TABLE ONLY modulo
    ADD CONSTRAINT modulo_fk
    FOREIGN KEY (ced_usuario) REFERENCES usuario(ced_pasaporte) ON UPDATE CASCADE;
--
-- Definition for index modulo_fk1 (OID = 25067) : 
--
ALTER TABLE ONLY modulo
    ADD CONSTRAINT modulo_fk1
    FOREIGN KEY (id_promocion) REFERENCES promocion(id);
--
-- Definition for index notas_pkey (OID = 25072) : 
--
ALTER TABLE ONLY notas
    ADD CONSTRAINT notas_pkey
    PRIMARY KEY (id);
--
-- Definition for index notas_fk (OID = 25074) : 
--
ALTER TABLE ONLY notas
    ADD CONSTRAINT notas_fk
    FOREIGN KEY (id_matricula) REFERENCES matricula(n_matricula);
--
-- Definition for index notas_fk1 (OID = 25079) : 
--
ALTER TABLE ONLY notas
    ADD CONSTRAINT notas_fk1
    FOREIGN KEY (id_modulo) REFERENCES modulo(id);
--
-- Definition for index asistencia_pkey (OID = 25084) : 
--
ALTER TABLE ONLY asistencia
    ADD CONSTRAINT asistencia_pkey
    PRIMARY KEY (id);
--
-- Definition for index asistencia_fk (OID = 25086) : 
--
ALTER TABLE ONLY asistencia
    ADD CONSTRAINT asistencia_fk
    FOREIGN KEY (id_modulo) REFERENCES modulo(id);
--
-- Definition for index asistencia_fk1 (OID = 25091) : 
--
ALTER TABLE ONLY asistencia
    ADD CONSTRAINT asistencia_fk1
    FOREIGN KEY (id_matricula) REFERENCES matricula(n_matricula);
--
-- Definition for index pais_pkey (OID = 25096) : 
--
ALTER TABLE ONLY pais
    ADD CONSTRAINT pais_pkey
    PRIMARY KEY (id);
--
-- Definition for index provincia_pkey (OID = 25098) : 
--
ALTER TABLE ONLY provincia
    ADD CONSTRAINT provincia_pkey
    PRIMARY KEY (id);
--
-- Definition for index ciudad_pkey (OID = 25100) : 
--
ALTER TABLE ONLY ciudad
    ADD CONSTRAINT ciudad_pkey
    PRIMARY KEY (id);
--
-- Definition for index ciudad_fk (OID = 25102) : 
--
ALTER TABLE ONLY ciudad
    ADD CONSTRAINT ciudad_fk
    FOREIGN KEY (id_provincia) REFERENCES provincia(id);
--
-- Definition for index provincia_fk (OID = 25107) : 
--
ALTER TABLE ONLY provincia
    ADD CONSTRAINT provincia_fk
    FOREIGN KEY (id_pais) REFERENCES pais(id);
--
-- Data for sequence public.fi_entrevista_id_seq (OID = 24855)
--
SELECT pg_catalog.setval('fi_entrevista_id_seq', 1, false);
--
-- Data for sequence public.tipo_precio_id_seq (OID = 24861)
--
SELECT pg_catalog.setval('tipo_precio_id_seq', 1, false);
--
-- Data for sequence public.tipo_pago_id_seq (OID = 24870)
--
SELECT pg_catalog.setval('tipo_pago_id_seq', 1, false);
--
-- Data for sequence public.pago_id_seq (OID = 24876)
--
SELECT pg_catalog.setval('pago_id_seq', 1, false);
--
-- Data for sequence public.precio_id_seq (OID = 24882)
--
SELECT pg_catalog.setval('precio_id_seq', 1, false);
--
-- Data for sequence public.maestria_id_seq (OID = 24888)
--
SELECT pg_catalog.setval('maestria_id_seq', 1, false);
--
-- Data for sequence public.requisitos_id_seq (OID = 24894)
--
SELECT pg_catalog.setval('requisitos_id_seq', 1, false);
--
-- Data for sequence public.promocion_id_seq (OID = 24900)
--
SELECT pg_catalog.setval('promocion_id_seq', 1, false);
--
-- Data for sequence public.tesis_id_seq (OID = 24906)
--
SELECT pg_catalog.setval('tesis_id_seq', 1, false);
--
-- Data for sequence public.palabras_clave_id_seq (OID = 24915)
--
SELECT pg_catalog.setval('palabras_clave_id_seq', 1, false);
--
-- Data for sequence public.tipo_usuario_id_seq (OID = 24921)
--
SELECT pg_catalog.setval('tipo_usuario_id_seq', 1, false);
--
-- Data for sequence public.modulo_id_seq (OID = 24933)
--
SELECT pg_catalog.setval('modulo_id_seq', 1, false);
--
-- Data for sequence public.notas_id_seq (OID = 24939)
--
SELECT pg_catalog.setval('notas_id_seq', 1, false);
--
-- Data for sequence public.asistencia_id_seq (OID = 24948)
--
SELECT pg_catalog.setval('asistencia_id_seq', 1, false);
--
-- Data for sequence public.pais_id_seq (OID = 24954)
--
SELECT pg_catalog.setval('pais_id_seq', 1, false);
--
-- Data for sequence public.provincia_id_seq (OID = 24960)
--
SELECT pg_catalog.setval('provincia_id_seq', 1, false);
--
-- Data for sequence public.ciudad_id_seq (OID = 24966)
--
SELECT pg_catalog.setval('ciudad_id_seq', 1, false);
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';
