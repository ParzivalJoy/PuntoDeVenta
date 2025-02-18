PGDMP     "    -            
    y            puntodeventa    13.4    13.4 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17161    puntodeventa    DATABASE     i   CREATE DATABASE puntodeventa WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE puntodeventa;
                postgres    false                        2615    2200    puntoventa1    SCHEMA        CREATE SCHEMA puntoventa1;
    DROP SCHEMA puntoventa1;
                puntoventa1    false            �           0    0    SCHEMA puntoventa1    COMMENT     ;   COMMENT ON SCHEMA puntoventa1 IS 'standard public schema';
                   puntoventa1    false    3                        0    0    SCHEMA puntoventa1    ACL     ^   REVOKE ALL ON SCHEMA puntoventa1 FROM postgres;
REVOKE ALL ON SCHEMA puntoventa1 FROM PUBLIC;
                   puntoventa1    false    3                       1259    17542    empresas    TABLE     O   CREATE TABLE public.empresas (
    idempresa bigint,
    nombreempresa text
);
    DROP TABLE public.empresas;
       public         heap    postgres    false                       1259    17548    usuariosgenerales    TABLE     �   CREATE TABLE public.usuariosgenerales (
    idusuariogeneral bigint,
    usuariogeneral text,
    contrasenausuariogeneral text,
    idempresa bigint
);
 %   DROP TABLE public.usuariosgenerales;
       public         heap    postgres    false            �            1259    17162    categorias_idcategoria_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.categorias_idcategoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE puntoventa1.categorias_idcategoria_seq;
       puntoventa1          postgres    false    3            �            1259    17164 
   categorias    TABLE     �   CREATE TABLE puntoventa1.categorias (
    idcategoria bigint DEFAULT nextval('puntoventa1.categorias_idcategoria_seq'::regclass) NOT NULL,
    nombrecategoria text NOT NULL
);
 #   DROP TABLE puntoventa1.categorias;
       puntoventa1         heap    postgres    false    201    3            �            1259    17171    complementos_idcomplemento_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.complementos_idcomplemento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE puntoventa1.complementos_idcomplemento_seq;
       puntoventa1          postgres    false    3            �            1259    17173    complementos    TABLE     G  CREATE TABLE puntoventa1.complementos (
    idcomplemento bigint DEFAULT nextval('puntoventa1.complementos_idcomplemento_seq'::regclass) NOT NULL,
    nombrecomplemento text NOT NULL,
    preciocomplemento double precision NOT NULL,
    descripcioncomplemento text,
    idproducto text NOT NULL,
    idproductooriginal text
);
 %   DROP TABLE puntoventa1.complementos;
       puntoventa1         heap    postgres    false    203    3            �            1259    17180    cortescaja_idcortecaja_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.cortescaja_idcortecaja_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE puntoventa1.cortescaja_idcortecaja_seq;
       puntoventa1          postgres    false    3            �            1259    17182 
   cortescaja    TABLE     �  CREATE TABLE puntoventa1.cortescaja (
    idcortecaja bigint DEFAULT nextval('puntoventa1.cortescaja_idcortecaja_seq'::regclass) NOT NULL,
    subtotalcorte double precision NOT NULL,
    totalcorte double precision NOT NULL,
    saldoapertura double precision NOT NULL,
    idusuario bigint NOT NULL,
    fechaapertura timestamp with time zone NOT NULL,
    fechacorte timestamp with time zone NOT NULL,
    idcuenta bigint
);
 #   DROP TABLE puntoventa1.cortescaja;
       puntoventa1         heap    postgres    false    205    3                       1259    17854    cuenta    TABLE     �   CREATE TABLE puntoventa1.cuenta (
    idcuenta bigint,
    numerocuenta bigint,
    titularcuenta text,
    bancocuenta text,
    clabecuenta bigint,
    qrcuenta character varying
);
    DROP TABLE puntoventa1.cuenta;
       puntoventa1         heap    postgres    false    3            �            1259    17189     detalleventas_iddetalleventa_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.detalleventas_iddetalleventa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE puntoventa1.detalleventas_iddetalleventa_seq;
       puntoventa1          postgres    false    3            �            1259    17198    empleados_idempleado_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.empleados_idempleado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE puntoventa1.empleados_idempleado_seq;
       puntoventa1          postgres    false    3            �            1259    17200 	   empleados    TABLE     6  CREATE TABLE puntoventa1.empleados (
    idempleado bigint DEFAULT nextval('puntoventa1.empleados_idempleado_seq'::regclass) NOT NULL,
    nombreempleado text NOT NULL,
    fechacontra date NOT NULL,
    dirempleado text NOT NULL,
    telempleado bigint NOT NULL,
    emailempleado text,
    idcargo bigint
);
 "   DROP TABLE puntoventa1.empleados;
       puntoventa1         heap    postgres    false    208    3            �            1259    17207    ingredientes    TABLE     �   CREATE TABLE puntoventa1.ingredientes (
    idingrediente text NOT NULL,
    nombreingrediente text NOT NULL,
    idunidad bigint NOT NULL,
    cantidadingrediente double precision NOT NULL,
    cantidadnotificacioningrediente double precision
);
 %   DROP TABLE puntoventa1.ingredientes;
       puntoventa1         heap    postgres    false    3            �            1259    17213 +   ingredientesproveedores_idingredientesp_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.ingredientesproveedores_idingredientesp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE puntoventa1.ingredientesproveedores_idingredientesp_seq;
       puntoventa1          postgres    false    3            �            1259    17215    ingredientesproveedores    TABLE     W  CREATE TABLE puntoventa1.ingredientesproveedores (
    idingredientesp bigint DEFAULT nextval('puntoventa1.ingredientesproveedores_idingredientesp_seq'::regclass) NOT NULL,
    idproveedor bigint NOT NULL,
    cantidad double precision NOT NULL,
    costo double precision NOT NULL,
    fecha date NOT NULL,
    idingrediente text NOT NULL
);
 0   DROP TABLE puntoventa1.ingredientesproveedores;
       puntoventa1         heap    postgres    false    211    3            �            1259    17222    modificadores_idmodificador_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.modificadores_idmodificador_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE puntoventa1.modificadores_idmodificador_seq;
       puntoventa1          postgres    false    3            �            1259    17224    modificadores    TABLE       CREATE TABLE puntoventa1.modificadores (
    idmodificador bigint DEFAULT nextval('puntoventa1.modificadores_idmodificador_seq'::regclass) NOT NULL,
    nombremodificador text NOT NULL,
    preciomodificador double precision NOT NULL,
    obligatorio boolean NOT NULL
);
 &   DROP TABLE puntoventa1.modificadores;
       puntoventa1         heap    postgres    false    213    3            �            1259    17231 *   modificadoresopciones_idmodificadoreso_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.modificadoresopciones_idmodificadoreso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE puntoventa1.modificadoresopciones_idmodificadoreso_seq;
       puntoventa1          postgres    false    3            �            1259    17233    modificadoresopciones    TABLE     �   CREATE TABLE puntoventa1.modificadoresopciones (
    idmodificadoreso bigint DEFAULT nextval('puntoventa1.modificadoresopciones_idmodificadoreso_seq'::regclass) NOT NULL,
    idmodificador bigint NOT NULL,
    idopcionmodificador bigint NOT NULL
);
 .   DROP TABLE puntoventa1.modificadoresopciones;
       puntoventa1         heap    postgres    false    215    3            �            1259    17237    movimientos_idmovimiento_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.movimientos_idmovimiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE puntoventa1.movimientos_idmovimiento_seq;
       puntoventa1          postgres    false    3            �            1259    17239    movimientos    TABLE     \  CREATE TABLE puntoventa1.movimientos (
    descripcion text NOT NULL,
    fechamovimiento timestamp with time zone NOT NULL,
    idmovimiento bigint DEFAULT nextval('puntoventa1.movimientos_idmovimiento_seq'::regclass) NOT NULL,
    razon text NOT NULL,
    tipo text NOT NULL,
    total double precision NOT NULL,
    idusuario bigint NOT NULL
);
 $   DROP TABLE puntoventa1.movimientos;
       puntoventa1         heap    postgres    false    217    3            �            1259    17246     opciones_idopcionmodificador_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.opciones_idopcionmodificador_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE puntoventa1.opciones_idopcionmodificador_seq;
       puntoventa1          postgres    false    3            �            1259    17248    opciones    TABLE        CREATE TABLE puntoventa1.opciones (
    idopcionmodificador bigint DEFAULT nextval('puntoventa1.opciones_idopcionmodificador_seq'::regclass) NOT NULL,
    nombreopcion text NOT NULL,
    precioopcionmodificador double precision NOT NULL,
    idingrediente text,
    opcionporcion text
);
 !   DROP TABLE puntoventa1.opciones;
       puntoventa1         heap    postgres    false    219    3            �            1259    17255    pagos_idpago_seq    SEQUENCE     ~   CREATE SEQUENCE puntoventa1.pagos_idpago_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE puntoventa1.pagos_idpago_seq;
       puntoventa1          postgres    false    3            �            1259    17257    pagos    TABLE     �   CREATE TABLE puntoventa1.pagos (
    idpago bigint DEFAULT nextval('puntoventa1.pagos_idpago_seq'::regclass) NOT NULL,
    tipopago text NOT NULL
);
    DROP TABLE puntoventa1.pagos;
       puntoventa1         heap    postgres    false    221    3            �            1259    17264    perfil_idcargo_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.perfil_idcargo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE puntoventa1.perfil_idcargo_seq;
       puntoventa1          postgres    false    3            �            1259    17266    perfil    TABLE     �   CREATE TABLE puntoventa1.perfil (
    idcargo bigint DEFAULT nextval('puntoventa1.perfil_idcargo_seq'::regclass) NOT NULL,
    nombrecargo text NOT NULL
);
    DROP TABLE puntoventa1.perfil;
       puntoventa1         heap    postgres    false    223    3            �            1259    17273    permisos_idpermiso_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.permisos_idpermiso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE puntoventa1.permisos_idpermiso_seq;
       puntoventa1          postgres    false    3            �            1259    17275    permisos    TABLE     �   CREATE TABLE puntoventa1.permisos (
    idpermiso bigint DEFAULT nextval('puntoventa1.permisos_idpermiso_seq'::regclass) NOT NULL,
    permiso text NOT NULL
);
 !   DROP TABLE puntoventa1.permisos;
       puntoventa1         heap    postgres    false    225    3            �            1259    17282    permisosusuarios_idpermiso_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.permisosusuarios_idpermiso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE puntoventa1.permisosusuarios_idpermiso_seq;
       puntoventa1          postgres    false    3            �            1259    17284    permisosusuarios    TABLE     �   CREATE TABLE puntoventa1.permisosusuarios (
    idpu bigint DEFAULT nextval('puntoventa1.permisosusuarios_idpermiso_seq'::regclass) NOT NULL,
    idusuario bigint NOT NULL,
    idpermiso bigint NOT NULL,
    acceso boolean
);
 )   DROP TABLE puntoventa1.permisosusuarios;
       puntoventa1         heap    postgres    false    227    3            �            1259    17288 	   productos    TABLE     �  CREATE TABLE puntoventa1.productos (
    idproducto text NOT NULL,
    nombreproducto text NOT NULL,
    precioproducto double precision NOT NULL,
    costoproducto double precision,
    descripcionproducto text,
    idcategoria bigint,
    idunidad bigint NOT NULL,
    cantidadproducto double precision,
    cantidadnotificacionproducto double precision,
    imagebproducto character varying
);
 "   DROP TABLE puntoventa1.productos;
       puntoventa1         heap    postgres    false    3            �            1259    17294 &   productoscomplementos_idproductosc_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.productoscomplementos_idproductosc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE puntoventa1.productoscomplementos_idproductosc_seq;
       puntoventa1          postgres    false    3            �            1259    17296 &   productosingredientes_idproductosi_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.productosingredientes_idproductosi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE puntoventa1.productosingredientes_idproductosi_seq;
       puntoventa1          postgres    false    3            �            1259    17298    productosingredientes    TABLE       CREATE TABLE puntoventa1.productosingredientes (
    idproductosi bigint DEFAULT nextval('puntoventa1.productosingredientes_idproductosi_seq'::regclass) NOT NULL,
    idproducto text NOT NULL,
    idingrediente text NOT NULL,
    porcion double precision NOT NULL
);
 .   DROP TABLE puntoventa1.productosingredientes;
       puntoventa1         heap    postgres    false    231    3            �            1259    17305 '   productosmodificadores_idproductosm_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.productosmodificadores_idproductosm_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE puntoventa1.productosmodificadores_idproductosm_seq;
       puntoventa1          postgres    false    3            �            1259    17307    productosmodificadores    TABLE     �   CREATE TABLE puntoventa1.productosmodificadores (
    idproductosm bigint DEFAULT nextval('puntoventa1.productosmodificadores_idproductosm_seq'::regclass) NOT NULL,
    idproducto text NOT NULL,
    idmodificador bigint NOT NULL
);
 /   DROP TABLE puntoventa1.productosmodificadores;
       puntoventa1         heap    postgres    false    233    3            �            1259    17314 %   productosproveedores_idproductosp_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.productosproveedores_idproductosp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE puntoventa1.productosproveedores_idproductosp_seq;
       puntoventa1          postgres    false    3            �            1259    17316    productosproveedores    TABLE     H  CREATE TABLE puntoventa1.productosproveedores (
    idproductosp bigint DEFAULT nextval('puntoventa1.productosproveedores_idproductosp_seq'::regclass) NOT NULL,
    idproveedor bigint NOT NULL,
    idproducto text NOT NULL,
    cantidad double precision NOT NULL,
    costo double precision NOT NULL,
    fecha date NOT NULL
);
 -   DROP TABLE puntoventa1.productosproveedores;
       puntoventa1         heap    postgres    false    235    3            �            1259    17323    proveedores_idproveedor_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.proveedores_idproveedor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE puntoventa1.proveedores_idproveedor_seq;
       puntoventa1          postgres    false    3            �            1259    17325    proveedores    TABLE       CREATE TABLE puntoventa1.proveedores (
    idproveedor bigint DEFAULT nextval('puntoventa1.proveedores_idproveedor_seq'::regclass) NOT NULL,
    compania text NOT NULL,
    nombreproveedor text NOT NULL,
    direccionproveedor text NOT NULL,
    telproveedor bigint NOT NULL
);
 $   DROP TABLE puntoventa1.proveedores;
       puntoventa1         heap    postgres    false    237    3            �            1259    17332    reportesmermas_idmerma_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.reportesmermas_idmerma_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE puntoventa1.reportesmermas_idmerma_seq;
       puntoventa1          postgres    false    3            �            1259    17334    reportesmermas    TABLE       CREATE TABLE puntoventa1.reportesmermas (
    idmerma bigint DEFAULT nextval('puntoventa1.reportesmermas_idmerma_seq'::regclass) NOT NULL,
    idproducto text NOT NULL,
    cantidadmerma double precision NOT NULL,
    descripcionmerma text NOT NULL,
    fechareporte date NOT NULL
);
 '   DROP TABLE puntoventa1.reportesmermas;
       puntoventa1         heap    postgres    false    239    3            �            1259    17341    temas    TABLE     m   CREATE TABLE puntoventa1.temas (
    idtema bigint NOT NULL,
    modo text,
    color text,
    logo text
);
    DROP TABLE puntoventa1.temas;
       puntoventa1         heap    postgres    false    3            �            1259    17347    unidades_idunidad_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.unidades_idunidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE puntoventa1.unidades_idunidad_seq;
       puntoventa1          postgres    false    3            �            1259    17349    unidades    TABLE     �   CREATE TABLE puntoventa1.unidades (
    idunidad bigint DEFAULT nextval('puntoventa1.unidades_idunidad_seq'::regclass) NOT NULL,
    nombreunidad text NOT NULL
);
 !   DROP TABLE puntoventa1.unidades;
       puntoventa1         heap    postgres    false    242    3            �            1259    17356    usuarios_idusuario_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.usuarios_idusuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE puntoventa1.usuarios_idusuario_seq;
       puntoventa1          postgres    false    3            �            1259    17358    usuarios    TABLE     *  CREATE TABLE puntoventa1.usuarios (
    idusuario bigint DEFAULT nextval('puntoventa1.usuarios_idusuario_seq'::regclass) NOT NULL,
    usuario text NOT NULL,
    contrasena text NOT NULL,
    estado boolean,
    intentos bigint,
    fechaalta date,
    fechavigencia date,
    idempleado bigint
);
 !   DROP TABLE puntoventa1.usuarios;
       puntoventa1         heap    postgres    false    244    3            �            1259    17365    ventas_idventa_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.ventas_idventa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE puntoventa1.ventas_idventa_seq;
       puntoventa1          postgres    false    3            �            1259    17367    ventas    TABLE       CREATE TABLE puntoventa1.ventas (
    idventa bigint DEFAULT nextval('puntoventa1.ventas_idventa_seq'::regclass) NOT NULL,
    idusuario bigint,
    idcliente bigint,
    idpago bigint,
    totalventa double precision,
    fechaventa date,
    horaventa time without time zone
);
    DROP TABLE puntoventa1.ventas;
       puntoventa1         heap    postgres    false    246    3            �            1259    17437    ventascomplemento    TABLE       CREATE TABLE puntoventa1.ventascomplemento (
    idventascomplemento integer NOT NULL,
    idusuario bigint,
    idventa integer NOT NULL,
    idcomplemento bigint,
    nombrecomplemento text,
    cantidad bigint,
    subtotal double precision,
    totalcomplemento double precision
);
 *   DROP TABLE puntoventa1.ventascomplemento;
       puntoventa1         heap    postgres    false    3                        1259    17489    ventascomplemento_idventa_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.ventascomplemento_idventa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE puntoventa1.ventascomplemento_idventa_seq;
       puntoventa1          postgres    false    3    249                       0    0    ventascomplemento_idventa_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE puntoventa1.ventascomplemento_idventa_seq OWNED BY puntoventa1.ventascomplemento.idventa;
          puntoventa1          postgres    false    256            �            1259    17483 )   ventascomplemento_idventascomplemento_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.ventascomplemento_idventascomplemento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE puntoventa1.ventascomplemento_idventascomplemento_seq;
       puntoventa1          postgres    false    3    249                       0    0 )   ventascomplemento_idventascomplemento_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE puntoventa1.ventascomplemento_idventascomplemento_seq OWNED BY puntoventa1.ventascomplemento.idventascomplemento;
          puntoventa1          postgres    false    255            �            1259    17443    ventasmodificadores    TABLE     C  CREATE TABLE puntoventa1.ventasmodificadores (
    idventamodificadores integer NOT NULL,
    idusuario bigint,
    idventa integer NOT NULL,
    idmodificador bigint,
    idopcionmodificador bigint,
    nombremodificador text,
    nombreopcion text,
    subtotal double precision,
    totalmodificador double precision
);
 ,   DROP TABLE puntoventa1.ventasmodificadores;
       puntoventa1         heap    postgres    false    3                       1259    17505    ventasmodificadores_idventa_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.ventasmodificadores_idventa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE puntoventa1.ventasmodificadores_idventa_seq;
       puntoventa1          postgres    false    3    250                       0    0    ventasmodificadores_idventa_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE puntoventa1.ventasmodificadores_idventa_seq OWNED BY puntoventa1.ventasmodificadores.idventa;
          puntoventa1          postgres    false    258                       1259    17499 ,   ventasmodificadores_idventamodificadores_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.ventasmodificadores_idventamodificadores_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 H   DROP SEQUENCE puntoventa1.ventasmodificadores_idventamodificadores_seq;
       puntoventa1          postgres    false    3    250                       0    0 ,   ventasmodificadores_idventamodificadores_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE puntoventa1.ventasmodificadores_idventamodificadores_seq OWNED BY puntoventa1.ventasmodificadores.idventamodificadores;
          puntoventa1          postgres    false    257            �            1259    17431    ventasproducto    TABLE       CREATE TABLE puntoventa1.ventasproducto (
    idventaproducto integer NOT NULL,
    idusuario bigint,
    idventa integer NOT NULL,
    idproducto text,
    cantidad bigint,
    nombreproducto text,
    notas text,
    subtotal double precision,
    totalproductos double precision
);
 '   DROP TABLE puntoventa1.ventasproducto;
       puntoventa1         heap    postgres    false    3            �            1259    17474    ventasproducto_idventa_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.ventasproducto_idventa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE puntoventa1.ventasproducto_idventa_seq;
       puntoventa1          postgres    false    248    3                       0    0    ventasproducto_idventa_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE puntoventa1.ventasproducto_idventa_seq OWNED BY puntoventa1.ventasproducto.idventa;
          puntoventa1          postgres    false    254            �            1259    17468 "   ventasproducto_idventaproducto_seq    SEQUENCE     �   CREATE SEQUENCE puntoventa1.ventasproducto_idventaproducto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE puntoventa1.ventasproducto_idventaproducto_seq;
       puntoventa1          postgres    false    3    248                       0    0 "   ventasproducto_idventaproducto_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE puntoventa1.ventasproducto_idventaproducto_seq OWNED BY puntoventa1.ventasproducto.idventaproducto;
          puntoventa1          postgres    false    253            �            1259    17466    ventasproducto_idventas    SEQUENCE     �   CREATE SEQUENCE puntoventa1.ventasproducto_idventas
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999
    CACHE 1
    CYCLE;
 3   DROP SEQUENCE puntoventa1.ventasproducto_idventas;
       puntoventa1          postgres    false    3            �            1259    17464    ventasproducto_idventasproducto    SEQUENCE     �   CREATE SEQUENCE puntoventa1.ventasproducto_idventasproducto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999
    CACHE 1
    CYCLE;
 ;   DROP SEQUENCE puntoventa1.ventasproducto_idventasproducto;
       puntoventa1          postgres    false    3                       2604    17485 %   ventascomplemento idventascomplemento    DEFAULT     �   ALTER TABLE ONLY puntoventa1.ventascomplemento ALTER COLUMN idventascomplemento SET DEFAULT nextval('puntoventa1.ventascomplemento_idventascomplemento_seq'::regclass);
 Y   ALTER TABLE puntoventa1.ventascomplemento ALTER COLUMN idventascomplemento DROP DEFAULT;
       puntoventa1          postgres    false    255    249                       2604    17491    ventascomplemento idventa    DEFAULT     �   ALTER TABLE ONLY puntoventa1.ventascomplemento ALTER COLUMN idventa SET DEFAULT nextval('puntoventa1.ventascomplemento_idventa_seq'::regclass);
 M   ALTER TABLE puntoventa1.ventascomplemento ALTER COLUMN idventa DROP DEFAULT;
       puntoventa1          postgres    false    256    249                       2604    17501 (   ventasmodificadores idventamodificadores    DEFAULT     �   ALTER TABLE ONLY puntoventa1.ventasmodificadores ALTER COLUMN idventamodificadores SET DEFAULT nextval('puntoventa1.ventasmodificadores_idventamodificadores_seq'::regclass);
 \   ALTER TABLE puntoventa1.ventasmodificadores ALTER COLUMN idventamodificadores DROP DEFAULT;
       puntoventa1          postgres    false    257    250            	           2604    17507    ventasmodificadores idventa    DEFAULT     �   ALTER TABLE ONLY puntoventa1.ventasmodificadores ALTER COLUMN idventa SET DEFAULT nextval('puntoventa1.ventasmodificadores_idventa_seq'::regclass);
 O   ALTER TABLE puntoventa1.ventasmodificadores ALTER COLUMN idventa DROP DEFAULT;
       puntoventa1          postgres    false    258    250                       2604    17470    ventasproducto idventaproducto    DEFAULT     �   ALTER TABLE ONLY puntoventa1.ventasproducto ALTER COLUMN idventaproducto SET DEFAULT nextval('puntoventa1.ventasproducto_idventaproducto_seq'::regclass);
 R   ALTER TABLE puntoventa1.ventasproducto ALTER COLUMN idventaproducto DROP DEFAULT;
       puntoventa1          postgres    false    253    248                       2604    17476    ventasproducto idventa    DEFAULT     �   ALTER TABLE ONLY puntoventa1.ventasproducto ALTER COLUMN idventa SET DEFAULT nextval('puntoventa1.ventasproducto_idventa_seq'::regclass);
 J   ALTER TABLE puntoventa1.ventasproducto ALTER COLUMN idventa DROP DEFAULT;
       puntoventa1          postgres    false    254    248            �          0    17542    empresas 
   TABLE DATA           <   COPY public.empresas (idempresa, nombreempresa) FROM stdin;
    public          postgres    false    259   ��       �          0    17548    usuariosgenerales 
   TABLE DATA           r   COPY public.usuariosgenerales (idusuariogeneral, usuariogeneral, contrasenausuariogeneral, idempresa) FROM stdin;
    public          postgres    false    260   ��       �          0    17164 
   categorias 
   TABLE DATA           G   COPY puntoventa1.categorias (idcategoria, nombrecategoria) FROM stdin;
    puntoventa1          postgres    false    202   �       �          0    17173    complementos 
   TABLE DATA           �   COPY puntoventa1.complementos (idcomplemento, nombrecomplemento, preciocomplemento, descripcioncomplemento, idproducto, idproductooriginal) FROM stdin;
    puntoventa1          postgres    false    204   ��       �          0    17182 
   cortescaja 
   TABLE DATA           �   COPY puntoventa1.cortescaja (idcortecaja, subtotalcorte, totalcorte, saldoapertura, idusuario, fechaapertura, fechacorte, idcuenta) FROM stdin;
    puntoventa1          postgres    false    206   ��       �          0    17854    cuenta 
   TABLE DATA           p   COPY puntoventa1.cuenta (idcuenta, numerocuenta, titularcuenta, bancocuenta, clabecuenta, qrcuenta) FROM stdin;
    puntoventa1          postgres    false    261   �       �          0    17200 	   empleados 
   TABLE DATA           �   COPY puntoventa1.empleados (idempleado, nombreempleado, fechacontra, dirempleado, telempleado, emailempleado, idcargo) FROM stdin;
    puntoventa1          postgres    false    209   [�       �          0    17207    ingredientes 
   TABLE DATA           �   COPY puntoventa1.ingredientes (idingrediente, nombreingrediente, idunidad, cantidadingrediente, cantidadnotificacioningrediente) FROM stdin;
    puntoventa1          postgres    false    210   S�       �          0    17215    ingredientesproveedores 
   TABLE DATA           {   COPY puntoventa1.ingredientesproveedores (idingredientesp, idproveedor, cantidad, costo, fecha, idingrediente) FROM stdin;
    puntoventa1          postgres    false    212   ��       �          0    17224    modificadores 
   TABLE DATA           n   COPY puntoventa1.modificadores (idmodificador, nombremodificador, preciomodificador, obligatorio) FROM stdin;
    puntoventa1          postgres    false    214   ��       �          0    17233    modificadoresopciones 
   TABLE DATA           j   COPY puntoventa1.modificadoresopciones (idmodificadoreso, idmodificador, idopcionmodificador) FROM stdin;
    puntoventa1          postgres    false    216   ��       �          0    17239    movimientos 
   TABLE DATA           u   COPY puntoventa1.movimientos (descripcion, fechamovimiento, idmovimiento, razon, tipo, total, idusuario) FROM stdin;
    puntoventa1          postgres    false    218   &�       �          0    17248    opciones 
   TABLE DATA           �   COPY puntoventa1.opciones (idopcionmodificador, nombreopcion, precioopcionmodificador, idingrediente, opcionporcion) FROM stdin;
    puntoventa1          postgres    false    220   �       �          0    17257    pagos 
   TABLE DATA           6   COPY puntoventa1.pagos (idpago, tipopago) FROM stdin;
    puntoventa1          postgres    false    222   I�       �          0    17266    perfil 
   TABLE DATA           ;   COPY puntoventa1.perfil (idcargo, nombrecargo) FROM stdin;
    puntoventa1          postgres    false    224   ��       �          0    17275    permisos 
   TABLE DATA           ;   COPY puntoventa1.permisos (idpermiso, permiso) FROM stdin;
    puntoventa1          postgres    false    226   ��       �          0    17284    permisosusuarios 
   TABLE DATA           S   COPY puntoventa1.permisosusuarios (idpu, idusuario, idpermiso, acceso) FROM stdin;
    puntoventa1          postgres    false    228   ��       �          0    17288 	   productos 
   TABLE DATA           �   COPY puntoventa1.productos (idproducto, nombreproducto, precioproducto, costoproducto, descripcionproducto, idcategoria, idunidad, cantidadproducto, cantidadnotificacionproducto, imagebproducto) FROM stdin;
    puntoventa1          postgres    false    229   (�       �          0    17298    productosingredientes 
   TABLE DATA           f   COPY puntoventa1.productosingredientes (idproductosi, idproducto, idingrediente, porcion) FROM stdin;
    puntoventa1          postgres    false    232   ��       �          0    17307    productosmodificadores 
   TABLE DATA           ^   COPY puntoventa1.productosmodificadores (idproductosm, idproducto, idmodificador) FROM stdin;
    puntoventa1          postgres    false    234   ��       �          0    17316    productosproveedores 
   TABLE DATA           r   COPY puntoventa1.productosproveedores (idproductosp, idproveedor, idproducto, cantidad, costo, fecha) FROM stdin;
    puntoventa1          postgres    false    236   ��       �          0    17325    proveedores 
   TABLE DATA           t   COPY puntoventa1.proveedores (idproveedor, compania, nombreproveedor, direccionproveedor, telproveedor) FROM stdin;
    puntoventa1          postgres    false    238   6�       �          0    17334    reportesmermas 
   TABLE DATA           q   COPY puntoventa1.reportesmermas (idmerma, idproducto, cantidadmerma, descripcionmerma, fechareporte) FROM stdin;
    puntoventa1          postgres    false    240   g�       �          0    17341    temas 
   TABLE DATA           ?   COPY puntoventa1.temas (idtema, modo, color, logo) FROM stdin;
    puntoventa1          postgres    false    241   ��       �          0    17349    unidades 
   TABLE DATA           ?   COPY puntoventa1.unidades (idunidad, nombreunidad) FROM stdin;
    puntoventa1          postgres    false    243   ��       �          0    17358    usuarios 
   TABLE DATA              COPY puntoventa1.usuarios (idusuario, usuario, contrasena, estado, intentos, fechaalta, fechavigencia, idempleado) FROM stdin;
    puntoventa1          postgres    false    245   �       �          0    17367    ventas 
   TABLE DATA           o   COPY puntoventa1.ventas (idventa, idusuario, idcliente, idpago, totalventa, fechaventa, horaventa) FROM stdin;
    puntoventa1          postgres    false    247   u�       �          0    17437    ventascomplemento 
   TABLE DATA           �   COPY puntoventa1.ventascomplemento (idventascomplemento, idusuario, idventa, idcomplemento, nombrecomplemento, cantidad, subtotal, totalcomplemento) FROM stdin;
    puntoventa1          postgres    false    249   ��       �          0    17443    ventasmodificadores 
   TABLE DATA           �   COPY puntoventa1.ventasmodificadores (idventamodificadores, idusuario, idventa, idmodificador, idopcionmodificador, nombremodificador, nombreopcion, subtotal, totalmodificador) FROM stdin;
    puntoventa1          postgres    false    250   ]�       �          0    17431    ventasproducto 
   TABLE DATA           �   COPY puntoventa1.ventasproducto (idventaproducto, idusuario, idventa, idproducto, cantidad, nombreproducto, notas, subtotal, totalproductos) FROM stdin;
    puntoventa1          postgres    false    248   ��                  0    0    categorias_idcategoria_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('puntoventa1.categorias_idcategoria_seq', 14, true);
          puntoventa1          postgres    false    201                       0    0    complementos_idcomplemento_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('puntoventa1.complementos_idcomplemento_seq', 1, false);
          puntoventa1          postgres    false    203            	           0    0    cortescaja_idcortecaja_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('puntoventa1.cortescaja_idcortecaja_seq', 1, true);
          puntoventa1          postgres    false    205            
           0    0     detalleventas_iddetalleventa_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('puntoventa1.detalleventas_iddetalleventa_seq', 1, false);
          puntoventa1          postgres    false    207                       0    0    empleados_idempleado_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('puntoventa1.empleados_idempleado_seq', 23, true);
          puntoventa1          postgres    false    208                       0    0 +   ingredientesproveedores_idingredientesp_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('puntoventa1.ingredientesproveedores_idingredientesp_seq', 1, false);
          puntoventa1          postgres    false    211                       0    0    modificadores_idmodificador_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('puntoventa1.modificadores_idmodificador_seq', 1, false);
          puntoventa1          postgres    false    213                       0    0 *   modificadoresopciones_idmodificadoreso_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('puntoventa1.modificadoresopciones_idmodificadoreso_seq', 1, false);
          puntoventa1          postgres    false    215                       0    0    movimientos_idmovimiento_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('puntoventa1.movimientos_idmovimiento_seq', 3, true);
          puntoventa1          postgres    false    217                       0    0     opciones_idopcionmodificador_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('puntoventa1.opciones_idopcionmodificador_seq', 1, false);
          puntoventa1          postgres    false    219                       0    0    pagos_idpago_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('puntoventa1.pagos_idpago_seq', 1, false);
          puntoventa1          postgres    false    221                       0    0    perfil_idcargo_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('puntoventa1.perfil_idcargo_seq', 1, false);
          puntoventa1          postgres    false    223                       0    0    permisos_idpermiso_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('puntoventa1.permisos_idpermiso_seq', 1, false);
          puntoventa1          postgres    false    225                       0    0    permisosusuarios_idpermiso_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('puntoventa1.permisosusuarios_idpermiso_seq', 24, true);
          puntoventa1          postgres    false    227                       0    0 &   productoscomplementos_idproductosc_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('puntoventa1.productoscomplementos_idproductosc_seq', 1, false);
          puntoventa1          postgres    false    230                       0    0 &   productosingredientes_idproductosi_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('puntoventa1.productosingredientes_idproductosi_seq', 1, false);
          puntoventa1          postgres    false    231                       0    0 '   productosmodificadores_idproductosm_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('puntoventa1.productosmodificadores_idproductosm_seq', 1, false);
          puntoventa1          postgres    false    233                       0    0 %   productosproveedores_idproductosp_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('puntoventa1.productosproveedores_idproductosp_seq', 2, true);
          puntoventa1          postgres    false    235                       0    0    proveedores_idproveedor_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('puntoventa1.proveedores_idproveedor_seq', 1, true);
          puntoventa1          postgres    false    237                       0    0    reportesmermas_idmerma_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('puntoventa1.reportesmermas_idmerma_seq', 1, false);
          puntoventa1          postgres    false    239                       0    0    unidades_idunidad_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('puntoventa1.unidades_idunidad_seq', 5, true);
          puntoventa1          postgres    false    242                       0    0    usuarios_idusuario_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('puntoventa1.usuarios_idusuario_seq', 6, true);
          puntoventa1          postgres    false    244                       0    0    ventas_idventa_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('puntoventa1.ventas_idventa_seq', 69, true);
          puntoventa1          postgres    false    246                       0    0    ventascomplemento_idventa_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('puntoventa1.ventascomplemento_idventa_seq', 11, true);
          puntoventa1          postgres    false    256                       0    0 )   ventascomplemento_idventascomplemento_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('puntoventa1.ventascomplemento_idventascomplemento_seq', 11, true);
          puntoventa1          postgres    false    255                        0    0    ventasmodificadores_idventa_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('puntoventa1.ventasmodificadores_idventa_seq', 4, true);
          puntoventa1          postgres    false    258            !           0    0 ,   ventasmodificadores_idventamodificadores_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('puntoventa1.ventasmodificadores_idventamodificadores_seq', 4, true);
          puntoventa1          postgres    false    257            "           0    0    ventasproducto_idventa_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('puntoventa1.ventasproducto_idventa_seq', 63, true);
          puntoventa1          postgres    false    254            #           0    0 "   ventasproducto_idventaproducto_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('puntoventa1.ventasproducto_idventaproducto_seq', 64, true);
          puntoventa1          postgres    false    253            $           0    0    ventasproducto_idventas    SEQUENCE SET     K   SELECT pg_catalog.setval('puntoventa1.ventasproducto_idventas', 1, false);
          puntoventa1          postgres    false    252            %           0    0    ventasproducto_idventasproducto    SEQUENCE SET     S   SELECT pg_catalog.setval('puntoventa1.ventasproducto_idventasproducto', 1, false);
          puntoventa1          postgres    false    251                       2606    17375    categorias Categorias_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY puntoventa1.categorias
    ADD CONSTRAINT "Categorias_pkey" PRIMARY KEY (idcategoria);
 K   ALTER TABLE ONLY puntoventa1.categorias DROP CONSTRAINT "Categorias_pkey";
       puntoventa1            postgres    false    202                       2606    17377    complementos Complementos_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY puntoventa1.complementos
    ADD CONSTRAINT "Complementos_pkey" PRIMARY KEY (idcomplemento);
 O   ALTER TABLE ONLY puntoventa1.complementos DROP CONSTRAINT "Complementos_pkey";
       puntoventa1            postgres    false    204                       2606    17379    cortescaja CorteCaja_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY puntoventa1.cortescaja
    ADD CONSTRAINT "CorteCaja_pkey" PRIMARY KEY (idcortecaja);
 J   ALTER TABLE ONLY puntoventa1.cortescaja DROP CONSTRAINT "CorteCaja_pkey";
       puntoventa1            postgres    false    206                       2606    17383    empleados Empleados_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY puntoventa1.empleados
    ADD CONSTRAINT "Empleados_pkey" PRIMARY KEY (idempleado);
 I   ALTER TABLE ONLY puntoventa1.empleados DROP CONSTRAINT "Empleados_pkey";
       puntoventa1            postgres    false    209                       2606    17385    pagos FormaPago_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY puntoventa1.pagos
    ADD CONSTRAINT "FormaPago_pkey" PRIMARY KEY (idpago);
 E   ALTER TABLE ONLY puntoventa1.pagos DROP CONSTRAINT "FormaPago_pkey";
       puntoventa1            postgres    false    222                       2606    17387     modificadores Modificadores_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY puntoventa1.modificadores
    ADD CONSTRAINT "Modificadores_pkey" PRIMARY KEY (idmodificador);
 Q   ALTER TABLE ONLY puntoventa1.modificadores DROP CONSTRAINT "Modificadores_pkey";
       puntoventa1            postgres    false    214                       2606    17389    opciones OpcionModificador_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY puntoventa1.opciones
    ADD CONSTRAINT "OpcionModificador_pkey" PRIMARY KEY (idopcionmodificador);
 P   ALTER TABLE ONLY puntoventa1.opciones DROP CONSTRAINT "OpcionModificador_pkey";
       puntoventa1            postgres    false    220            !           2606    17391    perfil Perfil_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY puntoventa1.perfil
    ADD CONSTRAINT "Perfil_pkey" PRIMARY KEY (idcargo);
 C   ALTER TABLE ONLY puntoventa1.perfil DROP CONSTRAINT "Perfil_pkey";
       puntoventa1            postgres    false    224            %           2606    17393 '   permisosusuarios Permisos-Usuarios_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY puntoventa1.permisosusuarios
    ADD CONSTRAINT "Permisos-Usuarios_pkey" PRIMARY KEY (idpu);
 X   ALTER TABLE ONLY puntoventa1.permisosusuarios DROP CONSTRAINT "Permisos-Usuarios_pkey";
       puntoventa1            postgres    false    228            /           2606    17395    proveedores Proveedor_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY puntoventa1.proveedores
    ADD CONSTRAINT "Proveedor_pkey" PRIMARY KEY (idproveedor);
 K   ALTER TABLE ONLY puntoventa1.proveedores DROP CONSTRAINT "Proveedor_pkey";
       puntoventa1            postgres    false    238            5           2606    17397    unidades Unidades_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY puntoventa1.unidades
    ADD CONSTRAINT "Unidades_pkey" PRIMARY KEY (idunidad);
 G   ALTER TABLE ONLY puntoventa1.unidades DROP CONSTRAINT "Unidades_pkey";
       puntoventa1            postgres    false    243            7           2606    17399    usuarios Usuarios_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY puntoventa1.usuarios
    ADD CONSTRAINT "Usuarios_pkey" PRIMARY KEY (idusuario);
 G   ALTER TABLE ONLY puntoventa1.usuarios DROP CONSTRAINT "Usuarios_pkey";
       puntoventa1            postgres    false    245            9           2606    17401    ventas Venta_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY puntoventa1.ventas
    ADD CONSTRAINT "Venta_pkey" PRIMARY KEY (idventa);
 B   ALTER TABLE ONLY puntoventa1.ventas DROP CONSTRAINT "Venta_pkey";
       puntoventa1            postgres    false    247                       2606    17403    ingredientes ingredientes_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY puntoventa1.ingredientes
    ADD CONSTRAINT ingredientes_pkey PRIMARY KEY (idingrediente);
 M   ALTER TABLE ONLY puntoventa1.ingredientes DROP CONSTRAINT ingredientes_pkey;
       puntoventa1            postgres    false    210                       2606    17405 4   ingredientesproveedores ingredientesproveedores_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY puntoventa1.ingredientesproveedores
    ADD CONSTRAINT ingredientesproveedores_pkey PRIMARY KEY (idingredientesp);
 c   ALTER TABLE ONLY puntoventa1.ingredientesproveedores DROP CONSTRAINT ingredientesproveedores_pkey;
       puntoventa1            postgres    false    212                       2606    17407 0   modificadoresopciones modificadoresopciones_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY puntoventa1.modificadoresopciones
    ADD CONSTRAINT modificadoresopciones_pkey PRIMARY KEY (idmodificadoreso);
 _   ALTER TABLE ONLY puntoventa1.modificadoresopciones DROP CONSTRAINT modificadoresopciones_pkey;
       puntoventa1            postgres    false    216                       2606    17409    movimientos movimiento_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY puntoventa1.movimientos
    ADD CONSTRAINT movimiento_pkey PRIMARY KEY (idmovimiento);
 J   ALTER TABLE ONLY puntoventa1.movimientos DROP CONSTRAINT movimiento_pkey;
       puntoventa1            postgres    false    218            '           2606    17411    productos productos_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY puntoventa1.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (idproducto);
 G   ALTER TABLE ONLY puntoventa1.productos DROP CONSTRAINT productos_pkey;
       puntoventa1            postgres    false    229            )           2606    17413 0   productosingredientes productosingredientes_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY puntoventa1.productosingredientes
    ADD CONSTRAINT productosingredientes_pkey PRIMARY KEY (idproductosi);
 _   ALTER TABLE ONLY puntoventa1.productosingredientes DROP CONSTRAINT productosingredientes_pkey;
       puntoventa1            postgres    false    232            +           2606    17415 2   productosmodificadores productosmodificadores_pkey 
   CONSTRAINT        ALTER TABLE ONLY puntoventa1.productosmodificadores
    ADD CONSTRAINT productosmodificadores_pkey PRIMARY KEY (idproductosm);
 a   ALTER TABLE ONLY puntoventa1.productosmodificadores DROP CONSTRAINT productosmodificadores_pkey;
       puntoventa1            postgres    false    234            -           2606    17417 .   productosproveedores productosproveedores_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY puntoventa1.productosproveedores
    ADD CONSTRAINT productosproveedores_pkey PRIMARY KEY (idproductosp);
 ]   ALTER TABLE ONLY puntoventa1.productosproveedores DROP CONSTRAINT productosproveedores_pkey;
       puntoventa1            postgres    false    236            1           2606    17419 "   reportesmermas reportesmermas_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY puntoventa1.reportesmermas
    ADD CONSTRAINT reportesmermas_pkey PRIMARY KEY (idmerma);
 Q   ALTER TABLE ONLY puntoventa1.reportesmermas DROP CONSTRAINT reportesmermas_pkey;
       puntoventa1            postgres    false    240            3           2606    17421    temas temas_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY puntoventa1.temas
    ADD CONSTRAINT temas_pkey PRIMARY KEY (idtema);
 ?   ALTER TABLE ONLY puntoventa1.temas DROP CONSTRAINT temas_pkey;
       puntoventa1            postgres    false    241            #           2606    17423    permisos ´permisos_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY puntoventa1.permisos
    ADD CONSTRAINT "´permisos_pkey" PRIMARY KEY (idpermiso);
 I   ALTER TABLE ONLY puntoventa1.permisos DROP CONSTRAINT "´permisos_pkey";
       puntoventa1            postgres    false    226            �      x�3�,(�+�/K�+I4����� ?r      �      x�3��*���742�0�L9�b���� dHs      �   h   x�3�t*MJ�IUIMT�/�L��K�QN-�L-�2B�t-.(J-.·I#K��%3`r&�r~�%�ECM9#��K�J\�2󲋹��$�%�&�\1z\\\ �/�      �   ,   x�3�NL*�,I,洀3�2�3�s8A�W� Qk�      �   >   x�%��� ��d
:Ӓ��	��
*�eSt�tu\�B��E�^�+��m��󚶚�}��^      �   /   x�3�4��,)�I,�tJ�K��}S��S�����ܹb���� �{�      �   �   x���Mk�0��+=7X�G�[`��Vع0�F��93(iX���,m)�ґ	�$?zQG�J�R��F��ܳ=7ĝ���l����"Y;bi2i��Z�^��9�M^x�Q�uT��U���D�(�a~T���]�F�Y�plon>��v������Fq��� �xe���WO��)������'X���n~`�x�ޓ\�I�CS�����lZT����>/1���_���"���H�P���      �   O   x�300�H,H�4�44�4�200�N�s8��|#N�����DNSN#Nc���	X(U!5�$�(�ӄ��Հ+F��� ��      �      x������ � �      �      x�3�I�M<�1�Ӏ��+F��� ;	      �      x�3�4�4�2�F\�@Ҙ+F��� !��      �   �   x�uͱj�0��Y~��!F'�lYc����.WKuD�d�$���}�*��x�v|p�����9��5x��e�6�����#�܋PR�q+[��`gP׃�Ԗ�(&N3.�-�í\�|���j�ch��8�k���?W�B��F65遈��A�+��&>��KL�J,��O ;��4� �zh5�w��_�}���o�_
��VWU��jWN      �   8   x�3�t��L��4�44�4�2��MM�L��s�"Ɯ�E�y)���@%F@�=... X"r      �   2   x�3�tMKM.�,��2�)J�+NK-J�K�L�2�I,�J-I����� "4�      �   "   x�3�tO-J�+I�2�K�KIM�/����� h�3      �      x������ � �      �   >   x�ʻ�@�x]:�}酘
�_�F~�;V8^���O�A�d����`:��3��<��Ϊ�      �   x   x�5�A
�0F���S�e�5�^t�fbB��D&-�J�ËI-.����԰�d�y�#L���Hi݆h�u��D`¼z_�-��|%CD#��5/���~��6�)W)���!��h���`����%L      �      x�3�4000&��\1z\\\  ��      �      x�3�4000�4����� ��      �   '   x�3�4�4000�45�46�4202�54�50����� K��      �   !   x�3����S((�/KMM�/��4������ \X      �      x������ � �      �   )   x�3���L�(�L�)M�(�+�WHIUK�+I����� ��	�      �   5   x�3�����O/J��/�2�2�9s2K����̜L(ǔ� 3�*�+F��� �      �   c   x�3��M�,J���Ɩ�%�1~Pd�eę����chd�` )0�2��*�����F��iHq�q�'%e�*x����s�%�����!T�W� ��%      �   n  x�}�]�!���]�"�@�'���ؠ2�d�*���IO�¥,X{��Ɓ�HO����J�d������&�&#'"�h"��3��Az"c'T�D(N$y�䙒gJ�)y��3����̔'"�h"�烴T�;��H�,��E���x��;5g9n���^j��.D.uq&���Nt1���IA�i�� �ˣ��� k�M=���oq@�^��z�@�k��[jd J�
8&|��MNT�t�h���.�#@�+Y]�^����~:��������Y�����T�p�NOu�x��gt��\�\���z�8�Wx���>��S�o:�Y�4ا?	�]�H�l��>t�jǹ�����e�;� �X�	�      �   Z   x�m�;�0�99j�M���R6V���e�(K��!1Ib�u��q���kG�$��83s�
��ܘ��ܙ-���O`3��t[T���7�      �   F   x�3�4�4Ð�����9�32��9M9M���rF8�9��:��r��)��y���@�e�5��7F��� "y�      �   n  x�}սjA��z�*ra���mӛ&��!l,�^~�l�B�; ��1��	�n_ݚ5mc���ty���?���b�W����ڲ��^?�_���Dۢ=f�*�Q�eƬ�:��{&�;��Cm��d̰���b"ta~@1���8[�R�-�)�@��-�*+Y(Tec@�`�����H2S��2S��2S��2S��2S��2S��2S��2S��1S��1S��1S����`j��`j��`j��`j��`j��aj��a���a���a���ݞr{͉v߯O/34=�Jg�Jg�Jg�JߪCc��!e�`h���ƽ�������0@Yf��Rf��Z�\�r	�,�r��^�x	�dx����C��     