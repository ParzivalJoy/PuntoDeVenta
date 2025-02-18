PGDMP     &                	    y        
   puntoventa    13.3    13.3 }    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394 
   puntoventa    DATABASE     g   CREATE DATABASE puntoventa WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE puntoventa;
                postgres    false            �            1259    41078    categorias_idcategoria_seq    SEQUENCE     �   CREATE SEQUENCE public.categorias_idcategoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.categorias_idcategoria_seq;
       public          postgres    false            �            1259    24624 
   categorias    TABLE     �   CREATE TABLE public.categorias (
    idcategoria bigint DEFAULT nextval('public.categorias_idcategoria_seq'::regclass) NOT NULL,
    nombrecategoria text NOT NULL
);
    DROP TABLE public.categorias;
       public         heap    postgres    false    226            �            1259    41081    complementos_idcomplemento_seq    SEQUENCE     �   CREATE SEQUENCE public.complementos_idcomplemento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.complementos_idcomplemento_seq;
       public          postgres    false            �            1259    24637    complementos    TABLE        CREATE TABLE public.complementos (
    idcomplemento bigint DEFAULT nextval('public.complementos_idcomplemento_seq'::regclass) NOT NULL,
    nombrecomplemento text NOT NULL,
    preciocomplemento double precision NOT NULL,
    descripcioncomplemento text,
    idproducto text NOT NULL
);
     DROP TABLE public.complementos;
       public         heap    postgres    false    227            �            1259    41057    cortescaja_idcortecaja_seq    SEQUENCE     �   CREATE SEQUENCE public.cortescaja_idcortecaja_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.cortescaja_idcortecaja_seq;
       public          postgres    false            �            1259    16464 
   cortescaja    TABLE     �  CREATE TABLE public.cortescaja (
    idcortecaja bigint DEFAULT nextval('public.cortescaja_idcortecaja_seq'::regclass) NOT NULL,
    subtotalcorte double precision NOT NULL,
    totalcorte double precision NOT NULL,
    saldoapertura double precision NOT NULL,
    idusuario bigint NOT NULL,
    fechaapertura timestamp with time zone NOT NULL,
    fechacorte timestamp with time zone NOT NULL,
    cuenta text
);
    DROP TABLE public.cortescaja;
       public         heap    postgres    false    220            �            1259    41075     detalleventas_iddetalleventa_seq    SEQUENCE     �   CREATE SEQUENCE public.detalleventas_iddetalleventa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.detalleventas_iddetalleventa_seq;
       public          postgres    false            �            1259    24619    detalleventas    TABLE     E  CREATE TABLE public.detalleventas (
    iddetalleventa bigint DEFAULT nextval('public.detalleventas_iddetalleventa_seq'::regclass) NOT NULL,
    idventa bigint NOT NULL,
    cantidad bigint NOT NULL,
    precio double precision NOT NULL,
    descuentoproducto double precision,
    idproducto text NOT NULL,
    nota text
);
 !   DROP TABLE public.detalleventas;
       public         heap    postgres    false    225            �            1259    32837    empleados_idempleado_seq    SEQUENCE     �   CREATE SEQUENCE public.empleados_idempleado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.empleados_idempleado_seq;
       public          postgres    false            �            1259    16403 	   empleados    TABLE     ,  CREATE TABLE public.empleados (
    idempleado bigint DEFAULT nextval('public.empleados_idempleado_seq'::regclass) NOT NULL,
    nombreempleado text NOT NULL,
    fechacontra date NOT NULL,
    dirempleado text NOT NULL,
    telempleado bigint NOT NULL,
    emailempleado text,
    idcargo bigint
);
    DROP TABLE public.empleados;
       public         heap    postgres    false    214            �            1259    49271    ingredientes    TABLE     �   CREATE TABLE public.ingredientes (
    idingrediente text NOT NULL,
    nombreingrediente text NOT NULL,
    idunidad bigint NOT NULL,
    cantidadingrediente double precision NOT NULL,
    cantidadnotificacioningrediente double precision
);
     DROP TABLE public.ingredientes;
       public         heap    postgres    false            �            1259    49388 +   ingredientesproveedores_idingredientesp_seq    SEQUENCE     �   CREATE SEQUENCE public.ingredientesproveedores_idingredientesp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.ingredientesproveedores_idingredientesp_seq;
       public          postgres    false            �            1259    49332    ingredientesproveedores    TABLE     M  CREATE TABLE public.ingredientesproveedores (
    idingredientesp bigint DEFAULT nextval('public.ingredientesproveedores_idingredientesp_seq'::regclass) NOT NULL,
    idproveedor bigint NOT NULL,
    cantidad double precision NOT NULL,
    costo double precision NOT NULL,
    fecha date NOT NULL,
    idingrediente text NOT NULL
);
 +   DROP TABLE public.ingredientesproveedores;
       public         heap    postgres    false    237            �            1259    49406    modificadores_idmodificador_seq    SEQUENCE     �   CREATE SEQUENCE public.modificadores_idmodificador_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.modificadores_idmodificador_seq;
       public          postgres    false            �            1259    16448    modificadores    TABLE     $  CREATE TABLE public.modificadores (
    idmodificador bigint DEFAULT nextval('public.modificadores_idmodificador_seq'::regclass) NOT NULL,
    nombremodificador text NOT NULL,
    preciomodificador double precision NOT NULL,
    obligatorio boolean NOT NULL,
    multiple boolean NOT NULL
);
 !   DROP TABLE public.modificadores;
       public         heap    postgres    false    243            �            1259    49414 *   modificadoresopciones_idmodificadoreso_seq    SEQUENCE     �   CREATE SEQUENCE public.modificadoresopciones_idmodificadoreso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.modificadoresopciones_idmodificadoreso_seq;
       public          postgres    false            �            1259    49409    modificadoresopciones    TABLE     �   CREATE TABLE public.modificadoresopciones (
    idmodificadoreso bigint DEFAULT nextval('public.modificadoresopciones_idmodificadoreso_seq'::regclass) NOT NULL,
    idmodificador bigint NOT NULL,
    idopcionmodificador bigint NOT NULL
);
 )   DROP TABLE public.modificadoresopciones;
       public         heap    postgres    false    245            �            1259    41052    movimientos_idmovimiento_seq    SEQUENCE     �   CREATE SEQUENCE public.movimientos_idmovimiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.movimientos_idmovimiento_seq;
       public          postgres    false            �            1259    41044    movimientos    TABLE     R  CREATE TABLE public.movimientos (
    descripcion text NOT NULL,
    fechamovimiento timestamp with time zone NOT NULL,
    idmovimiento bigint DEFAULT nextval('public.movimientos_idmovimiento_seq'::regclass) NOT NULL,
    razon text NOT NULL,
    tipo text NOT NULL,
    total double precision NOT NULL,
    idusuario bigint NOT NULL
);
    DROP TABLE public.movimientos;
       public         heap    postgres    false    219            �            1259    49403     opciones_idopcionmodificador_seq    SEQUENCE     �   CREATE SEQUENCE public.opciones_idopcionmodificador_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.opciones_idopcionmodificador_seq;
       public          postgres    false            �            1259    16456    opciones    TABLE     �   CREATE TABLE public.opciones (
    idopcionmodificador bigint DEFAULT nextval('public.opciones_idopcionmodificador_seq'::regclass) NOT NULL,
    nombreopcion text NOT NULL,
    precioopcionmodificador double precision NOT NULL
);
    DROP TABLE public.opciones;
       public         heap    postgres    false    242            �            1259    41072    pagos_idpago_seq    SEQUENCE     y   CREATE SEQUENCE public.pagos_idpago_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.pagos_idpago_seq;
       public          postgres    false            �            1259    16411    pagos    TABLE     �   CREATE TABLE public.pagos (
    idpago bigint DEFAULT nextval('public.pagos_idpago_seq'::regclass) NOT NULL,
    tipopago text NOT NULL
);
    DROP TABLE public.pagos;
       public         heap    postgres    false    224            �            1259    41033    perfil_idcargo_seq    SEQUENCE     {   CREATE SEQUENCE public.perfil_idcargo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.perfil_idcargo_seq;
       public          postgres    false            �            1259    16395    perfil    TABLE     �   CREATE TABLE public.perfil (
    idcargo bigint DEFAULT nextval('public.perfil_idcargo_seq'::regclass) NOT NULL,
    nombrecargo text NOT NULL
);
    DROP TABLE public.perfil;
       public         heap    postgres    false    215            �            1259    49385    permisos_idpermiso_seq    SEQUENCE        CREATE SEQUENCE public.permisos_idpermiso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.permisos_idpermiso_seq;
       public          postgres    false            �            1259    49324    permisos    TABLE     �   CREATE TABLE public.permisos (
    idpermiso bigint DEFAULT nextval('public.permisos_idpermiso_seq'::regclass) NOT NULL,
    permiso text NOT NULL
);
    DROP TABLE public.permisos;
       public         heap    postgres    false    236            �            1259    41039    permisosusuarios_idpermiso_seq    SEQUENCE     �   CREATE SEQUENCE public.permisosusuarios_idpermiso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.permisosusuarios_idpermiso_seq;
       public          postgres    false            �            1259    24586    permisosusuarios    TABLE     �   CREATE TABLE public.permisosusuarios (
    idpu bigint DEFAULT nextval('public.permisosusuarios_idpermiso_seq'::regclass) NOT NULL,
    idusuario bigint NOT NULL,
    idpermiso bigint NOT NULL
);
 $   DROP TABLE public.permisosusuarios;
       public         heap    postgres    false    217            �            1259    49316 	   productos    TABLE     �  CREATE TABLE public.productos (
    idproducto text NOT NULL,
    nombreproducto text NOT NULL,
    precioproducto double precision NOT NULL,
    costoproducto double precision,
    descripcionproducto text,
    idcategoria bigint,
    idunidad bigint NOT NULL,
    cantidadproducto double precision,
    cantidadnotificacionproducto double precision,
    rutaimagenproducto bytea
);
    DROP TABLE public.productos;
       public         heap    postgres    false            �            1259    49397 &   productoscomplementos_idproductosc_seq    SEQUENCE     �   CREATE SEQUENCE public.productoscomplementos_idproductosc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.productoscomplementos_idproductosc_seq;
       public          postgres    false            �            1259    49394 &   productosingredientes_idproductosi_seq    SEQUENCE     �   CREATE SEQUENCE public.productosingredientes_idproductosi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.productosingredientes_idproductosi_seq;
       public          postgres    false            �            1259    49348    productosingredientes    TABLE       CREATE TABLE public.productosingredientes (
    idproductosi bigint DEFAULT nextval('public.productosingredientes_idproductosi_seq'::regclass) NOT NULL,
    idproducto text NOT NULL,
    idingrediente text NOT NULL,
    porcion double precision NOT NULL
);
 )   DROP TABLE public.productosingredientes;
       public         heap    postgres    false    239            �            1259    49400 '   productosmodificadores_idproductosm_seq    SEQUENCE     �   CREATE SEQUENCE public.productosmodificadores_idproductosm_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.productosmodificadores_idproductosm_seq;
       public          postgres    false            �            1259    49364    productosmodificadores    TABLE     �   CREATE TABLE public.productosmodificadores (
    idproductosm bigint DEFAULT nextval('public.productosmodificadores_idproductosm_seq'::regclass) NOT NULL,
    idproducto text NOT NULL,
    idmodificador bigint NOT NULL
);
 *   DROP TABLE public.productosmodificadores;
       public         heap    postgres    false    241            �            1259    49391 %   productosproveedores_idproductosp_seq    SEQUENCE     �   CREATE SEQUENCE public.productosproveedores_idproductosp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.productosproveedores_idproductosp_seq;
       public          postgres    false            �            1259    49337    productosproveedores    TABLE     >  CREATE TABLE public.productosproveedores (
    idproductosp bigint DEFAULT nextval('public.productosproveedores_idproductosp_seq'::regclass) NOT NULL,
    idproveedor bigint NOT NULL,
    idproducto text NOT NULL,
    cantidad double precision NOT NULL,
    costo double precision NOT NULL,
    fecha date NOT NULL
);
 (   DROP TABLE public.productosproveedores;
       public         heap    postgres    false    238            �            1259    41060    proveedores_idproveedor_seq    SEQUENCE     �   CREATE SEQUENCE public.proveedores_idproveedor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.proveedores_idproveedor_seq;
       public          postgres    false            �            1259    16469    proveedores    TABLE       CREATE TABLE public.proveedores (
    idproveedor bigint DEFAULT nextval('public.proveedores_idproveedor_seq'::regclass) NOT NULL,
    compania text NOT NULL,
    nombreproveedor text NOT NULL,
    direccionproveedor text NOT NULL,
    telproveedor bigint NOT NULL
);
    DROP TABLE public.proveedores;
       public         heap    postgres    false    221            �            1259    49419    reportesmermas_idmerma_seq    SEQUENCE     �   CREATE SEQUENCE public.reportesmermas_idmerma_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.reportesmermas_idmerma_seq;
       public          postgres    false            �            1259    49225    reportesmermas    TABLE       CREATE TABLE public.reportesmermas (
    idmerma bigint DEFAULT nextval('public.reportesmermas_idmerma_seq'::regclass) NOT NULL,
    idproducto text NOT NULL,
    cantidadmerma double precision NOT NULL,
    descripcionmerma text NOT NULL,
    fechareporte date NOT NULL
);
 "   DROP TABLE public.reportesmermas;
       public         heap    postgres    false    246            �            1259    65637    temas    TABLE     �   CREATE TABLE public.temas (
    idtema bigint NOT NULL,
    primarycolor text NOT NULL,
    bgcolor text NOT NULL,
    secondarycolor text NOT NULL,
    font text NOT NULL
);
    DROP TABLE public.temas;
       public         heap    postgres    false            �            1259    41066    unidades_idunidad_seq    SEQUENCE     ~   CREATE SEQUENCE public.unidades_idunidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.unidades_idunidad_seq;
       public          postgres    false            �            1259    24614    unidades    TABLE     �   CREATE TABLE public.unidades (
    idunidad bigint DEFAULT nextval('public.unidades_idunidad_seq'::regclass) NOT NULL,
    nombreunidad text NOT NULL
);
    DROP TABLE public.unidades;
       public         heap    postgres    false    222            �            1259    41036    usuarios_idusuario_seq    SEQUENCE        CREATE SEQUENCE public.usuarios_idusuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.usuarios_idusuario_seq;
       public          postgres    false            �            1259    24591    usuarios    TABLE        CREATE TABLE public.usuarios (
    idusuario bigint DEFAULT nextval('public.usuarios_idusuario_seq'::regclass) NOT NULL,
    usuario text NOT NULL,
    contrasena text NOT NULL,
    estado boolean,
    intentos bigint,
    fechaalta date,
    fechavigencia date,
    idempleado bigint
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false    216            �            1259    41069    ventas_idventa_seq    SEQUENCE     {   CREATE SEQUENCE public.ventas_idventa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.ventas_idventa_seq;
       public          postgres    false            �            1259    16427    ventas    TABLE     7  CREATE TABLE public.ventas (
    idventa bigint DEFAULT nextval('public.ventas_idventa_seq'::regclass) NOT NULL,
    fechaventa timestamp with time zone NOT NULL,
    totalventa double precision NOT NULL,
    idpago bigint NOT NULL,
    descuento double precision NOT NULL,
    idusuario bigint,
    qr text
);
    DROP TABLE public.ventas;
       public         heap    postgres    false    223            �          0    24624 
   categorias 
   TABLE DATA           B   COPY public.categorias (idcategoria, nombrecategoria) FROM stdin;
    public          postgres    false    212   ��       �          0    24637    complementos 
   TABLE DATA              COPY public.complementos (idcomplemento, nombrecomplemento, preciocomplemento, descripcioncomplemento, idproducto) FROM stdin;
    public          postgres    false    213   :�       �          0    16464 
   cortescaja 
   TABLE DATA           �   COPY public.cortescaja (idcortecaja, subtotalcorte, totalcorte, saldoapertura, idusuario, fechaapertura, fechacorte, cuenta) FROM stdin;
    public          postgres    false    206   W�       �          0    24619    detalleventas 
   TABLE DATA           w   COPY public.detalleventas (iddetalleventa, idventa, cantidad, precio, descuentoproducto, idproducto, nota) FROM stdin;
    public          postgres    false    211   t�       �          0    16403 	   empleados 
   TABLE DATA           ~   COPY public.empleados (idempleado, nombreempleado, fechacontra, dirempleado, telempleado, emailempleado, idcargo) FROM stdin;
    public          postgres    false    201   ��       �          0    49271    ingredientes 
   TABLE DATA           �   COPY public.ingredientes (idingrediente, nombreingrediente, idunidad, cantidadingrediente, cantidadnotificacioningrediente) FROM stdin;
    public          postgres    false    229   Z�       �          0    49332    ingredientesproveedores 
   TABLE DATA           v   COPY public.ingredientesproveedores (idingredientesp, idproveedor, cantidad, costo, fecha, idingrediente) FROM stdin;
    public          postgres    false    232   ��       �          0    16448    modificadores 
   TABLE DATA           s   COPY public.modificadores (idmodificador, nombremodificador, preciomodificador, obligatorio, multiple) FROM stdin;
    public          postgres    false    204   ��       �          0    49409    modificadoresopciones 
   TABLE DATA           e   COPY public.modificadoresopciones (idmodificadoreso, idmodificador, idopcionmodificador) FROM stdin;
    public          postgres    false    244   ۜ       �          0    41044    movimientos 
   TABLE DATA           p   COPY public.movimientos (descripcion, fechamovimiento, idmovimiento, razon, tipo, total, idusuario) FROM stdin;
    public          postgres    false    218   ��       �          0    16456    opciones 
   TABLE DATA           ^   COPY public.opciones (idopcionmodificador, nombreopcion, precioopcionmodificador) FROM stdin;
    public          postgres    false    205   �       �          0    16411    pagos 
   TABLE DATA           1   COPY public.pagos (idpago, tipopago) FROM stdin;
    public          postgres    false    202   2�       �          0    16395    perfil 
   TABLE DATA           6   COPY public.perfil (idcargo, nombrecargo) FROM stdin;
    public          postgres    false    200   O�       �          0    49324    permisos 
   TABLE DATA           6   COPY public.permisos (idpermiso, permiso) FROM stdin;
    public          postgres    false    231   ��       �          0    24586    permisosusuarios 
   TABLE DATA           F   COPY public.permisosusuarios (idpu, idusuario, idpermiso) FROM stdin;
    public          postgres    false    208   ��       �          0    49316 	   productos 
   TABLE DATA           �   COPY public.productos (idproducto, nombreproducto, precioproducto, costoproducto, descripcionproducto, idcategoria, idunidad, cantidadproducto, cantidadnotificacionproducto, rutaimagenproducto) FROM stdin;
    public          postgres    false    230   ��       �          0    49348    productosingredientes 
   TABLE DATA           a   COPY public.productosingredientes (idproductosi, idproducto, idingrediente, porcion) FROM stdin;
    public          postgres    false    234   ̞       �          0    49364    productosmodificadores 
   TABLE DATA           Y   COPY public.productosmodificadores (idproductosm, idproducto, idmodificador) FROM stdin;
    public          postgres    false    235   �       �          0    49337    productosproveedores 
   TABLE DATA           m   COPY public.productosproveedores (idproductosp, idproveedor, idproducto, cantidad, costo, fecha) FROM stdin;
    public          postgres    false    233   �       �          0    16469    proveedores 
   TABLE DATA           o   COPY public.proveedores (idproveedor, compania, nombreproveedor, direccionproveedor, telproveedor) FROM stdin;
    public          postgres    false    207   #�       �          0    49225    reportesmermas 
   TABLE DATA           l   COPY public.reportesmermas (idmerma, idproducto, cantidadmerma, descripcionmerma, fechareporte) FROM stdin;
    public          postgres    false    228   @�       �          0    65637    temas 
   TABLE DATA           T   COPY public.temas (idtema, primarycolor, bgcolor, secondarycolor, font) FROM stdin;
    public          postgres    false    247   ]�       �          0    24614    unidades 
   TABLE DATA           :   COPY public.unidades (idunidad, nombreunidad) FROM stdin;
    public          postgres    false    210   z�       �          0    24591    usuarios 
   TABLE DATA           z   COPY public.usuarios (idusuario, usuario, contrasena, estado, intentos, fechaalta, fechavigencia, idempleado) FROM stdin;
    public          postgres    false    209   ��       �          0    16427    ventas 
   TABLE DATA           c   COPY public.ventas (idventa, fechaventa, totalventa, idpago, descuento, idusuario, qr) FROM stdin;
    public          postgres    false    203   �       �           0    0    categorias_idcategoria_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.categorias_idcategoria_seq', 12, true);
          public          postgres    false    226            �           0    0    complementos_idcomplemento_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.complementos_idcomplemento_seq', 1, false);
          public          postgres    false    227            �           0    0    cortescaja_idcortecaja_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.cortescaja_idcortecaja_seq', 1, false);
          public          postgres    false    220            �           0    0     detalleventas_iddetalleventa_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.detalleventas_iddetalleventa_seq', 1, false);
          public          postgres    false    225            �           0    0    empleados_idempleado_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.empleados_idempleado_seq', 16, true);
          public          postgres    false    214            �           0    0 +   ingredientesproveedores_idingredientesp_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.ingredientesproveedores_idingredientesp_seq', 1, false);
          public          postgres    false    237            �           0    0    modificadores_idmodificador_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.modificadores_idmodificador_seq', 1, false);
          public          postgres    false    243            �           0    0 *   modificadoresopciones_idmodificadoreso_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.modificadoresopciones_idmodificadoreso_seq', 1, false);
          public          postgres    false    245            �           0    0    movimientos_idmovimiento_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.movimientos_idmovimiento_seq', 1, false);
          public          postgres    false    219            �           0    0     opciones_idopcionmodificador_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.opciones_idopcionmodificador_seq', 1, false);
          public          postgres    false    242            �           0    0    pagos_idpago_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.pagos_idpago_seq', 1, false);
          public          postgres    false    224            �           0    0    perfil_idcargo_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.perfil_idcargo_seq', 1, false);
          public          postgres    false    215            �           0    0    permisos_idpermiso_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.permisos_idpermiso_seq', 1, false);
          public          postgres    false    236            �           0    0    permisosusuarios_idpermiso_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.permisosusuarios_idpermiso_seq', 1, false);
          public          postgres    false    217            �           0    0 &   productoscomplementos_idproductosc_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.productoscomplementos_idproductosc_seq', 1, false);
          public          postgres    false    240            �           0    0 &   productosingredientes_idproductosi_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.productosingredientes_idproductosi_seq', 1, false);
          public          postgres    false    239            �           0    0 '   productosmodificadores_idproductosm_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.productosmodificadores_idproductosm_seq', 1, false);
          public          postgres    false    241            �           0    0 %   productosproveedores_idproductosp_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.productosproveedores_idproductosp_seq', 1, false);
          public          postgres    false    238            �           0    0    proveedores_idproveedor_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.proveedores_idproveedor_seq', 1, false);
          public          postgres    false    221            �           0    0    reportesmermas_idmerma_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.reportesmermas_idmerma_seq', 1, false);
          public          postgres    false    246            �           0    0    unidades_idunidad_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.unidades_idunidad_seq', 5, true);
          public          postgres    false    222            �           0    0    usuarios_idusuario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.usuarios_idusuario_seq', 1, false);
          public          postgres    false    216            �           0    0    ventas_idventa_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.ventas_idventa_seq', 1, false);
          public          postgres    false    223            �           2606    24631    categorias Categorias_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT "Categorias_pkey" PRIMARY KEY (idcategoria);
 F   ALTER TABLE ONLY public.categorias DROP CONSTRAINT "Categorias_pkey";
       public            postgres    false    212            �           2606    24644    complementos Complementos_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.complementos
    ADD CONSTRAINT "Complementos_pkey" PRIMARY KEY (idcomplemento);
 J   ALTER TABLE ONLY public.complementos DROP CONSTRAINT "Complementos_pkey";
       public            postgres    false    213            �           2606    16468    cortescaja CorteCaja_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.cortescaja
    ADD CONSTRAINT "CorteCaja_pkey" PRIMARY KEY (idcortecaja);
 E   ALTER TABLE ONLY public.cortescaja DROP CONSTRAINT "CorteCaja_pkey";
       public            postgres    false    206            �           2606    24623    detalleventas DetalleVenta_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.detalleventas
    ADD CONSTRAINT "DetalleVenta_pkey" PRIMARY KEY (iddetalleventa);
 K   ALTER TABLE ONLY public.detalleventas DROP CONSTRAINT "DetalleVenta_pkey";
       public            postgres    false    211            �           2606    16410    empleados Empleados_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT "Empleados_pkey" PRIMARY KEY (idempleado);
 D   ALTER TABLE ONLY public.empleados DROP CONSTRAINT "Empleados_pkey";
       public            postgres    false    201            �           2606    16418    pagos FormaPago_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT "FormaPago_pkey" PRIMARY KEY (idpago);
 @   ALTER TABLE ONLY public.pagos DROP CONSTRAINT "FormaPago_pkey";
       public            postgres    false    202            �           2606    16455     modificadores Modificadores_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.modificadores
    ADD CONSTRAINT "Modificadores_pkey" PRIMARY KEY (idmodificador);
 L   ALTER TABLE ONLY public.modificadores DROP CONSTRAINT "Modificadores_pkey";
       public            postgres    false    204            �           2606    16463    opciones OpcionModificador_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.opciones
    ADD CONSTRAINT "OpcionModificador_pkey" PRIMARY KEY (idopcionmodificador);
 K   ALTER TABLE ONLY public.opciones DROP CONSTRAINT "OpcionModificador_pkey";
       public            postgres    false    205            �           2606    16402    perfil Perfil_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.perfil
    ADD CONSTRAINT "Perfil_pkey" PRIMARY KEY (idcargo);
 >   ALTER TABLE ONLY public.perfil DROP CONSTRAINT "Perfil_pkey";
       public            postgres    false    200            �           2606    24590 '   permisosusuarios Permisos-Usuarios_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.permisosusuarios
    ADD CONSTRAINT "Permisos-Usuarios_pkey" PRIMARY KEY (idpu);
 S   ALTER TABLE ONLY public.permisosusuarios DROP CONSTRAINT "Permisos-Usuarios_pkey";
       public            postgres    false    208            �           2606    16476    proveedores Proveedor_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT "Proveedor_pkey" PRIMARY KEY (idproveedor);
 F   ALTER TABLE ONLY public.proveedores DROP CONSTRAINT "Proveedor_pkey";
       public            postgres    false    207            �           2606    24618    unidades Unidades_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.unidades
    ADD CONSTRAINT "Unidades_pkey" PRIMARY KEY (idunidad);
 B   ALTER TABLE ONLY public.unidades DROP CONSTRAINT "Unidades_pkey";
       public            postgres    false    210            �           2606    24598    usuarios Usuarios_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT "Usuarios_pkey" PRIMARY KEY (idusuario);
 B   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT "Usuarios_pkey";
       public            postgres    false    209            �           2606    16431    ventas Venta_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT "Venta_pkey" PRIMARY KEY (idventa);
 =   ALTER TABLE ONLY public.ventas DROP CONSTRAINT "Venta_pkey";
       public            postgres    false    203            �           2606    49278    ingredientes ingredientes_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.ingredientes
    ADD CONSTRAINT ingredientes_pkey PRIMARY KEY (idingrediente);
 H   ALTER TABLE ONLY public.ingredientes DROP CONSTRAINT ingredientes_pkey;
       public            postgres    false    229                       2606    49336 4   ingredientesproveedores ingredientesproveedores_pkey 
   CONSTRAINT        ALTER TABLE ONLY public.ingredientesproveedores
    ADD CONSTRAINT ingredientesproveedores_pkey PRIMARY KEY (idingredientesp);
 ^   ALTER TABLE ONLY public.ingredientesproveedores DROP CONSTRAINT ingredientesproveedores_pkey;
       public            postgres    false    232            
           2606    49413 0   modificadoresopciones modificadoresopciones_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.modificadoresopciones
    ADD CONSTRAINT modificadoresopciones_pkey PRIMARY KEY (idmodificadoreso);
 Z   ALTER TABLE ONLY public.modificadoresopciones DROP CONSTRAINT modificadoresopciones_pkey;
       public            postgres    false    244            �           2606    41051    movimientos movimiento_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.movimientos
    ADD CONSTRAINT movimiento_pkey PRIMARY KEY (idmovimiento);
 E   ALTER TABLE ONLY public.movimientos DROP CONSTRAINT movimiento_pkey;
       public            postgres    false    218            �           2606    49323    productos productos_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (idproducto);
 B   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_pkey;
       public            postgres    false    230                       2606    49355 0   productosingredientes productosingredientes_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.productosingredientes
    ADD CONSTRAINT productosingredientes_pkey PRIMARY KEY (idproductosi);
 Z   ALTER TABLE ONLY public.productosingredientes DROP CONSTRAINT productosingredientes_pkey;
       public            postgres    false    234                       2606    49371 2   productosmodificadores productosmodificadores_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.productosmodificadores
    ADD CONSTRAINT productosmodificadores_pkey PRIMARY KEY (idproductosm);
 \   ALTER TABLE ONLY public.productosmodificadores DROP CONSTRAINT productosmodificadores_pkey;
       public            postgres    false    235                       2606    49344 .   productosproveedores productosproveedores_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.productosproveedores
    ADD CONSTRAINT productosproveedores_pkey PRIMARY KEY (idproductosp);
 X   ALTER TABLE ONLY public.productosproveedores DROP CONSTRAINT productosproveedores_pkey;
       public            postgres    false    233            �           2606    49232 "   reportesmermas reportesmermas_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.reportesmermas
    ADD CONSTRAINT reportesmermas_pkey PRIMARY KEY (idmerma);
 L   ALTER TABLE ONLY public.reportesmermas DROP CONSTRAINT reportesmermas_pkey;
       public            postgres    false    228                       2606    65644    temas temas_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.temas
    ADD CONSTRAINT temas_pkey PRIMARY KEY (idtema);
 :   ALTER TABLE ONLY public.temas DROP CONSTRAINT temas_pkey;
       public            postgres    false    247                        2606    49331    permisos ´permisos_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.permisos
    ADD CONSTRAINT "´permisos_pkey" PRIMARY KEY (idpermiso);
 D   ALTER TABLE ONLY public.permisos DROP CONSTRAINT "´permisos_pkey";
       public            postgres    false    231            �   n   x����0D�3C(��-"$��k7W�FBӚ����j&����^�l��$.�7��x�C;��5��W�� <᩟�q��gLb��\r��kj�w���/4M�kѯ���g"$      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x���M�0���� �Sm�;��'`�@�~�A��^ ƨc���}�y��dA
��0�D�#?��G��ʞ�������;�FPJ+)Q&f�C�g���oL�5~tqѷq{Y��ঁcp�?P�*8�LL>5�[s��u�o�xR%C	���}���~��tuQ_X"�܍t5�j�o`�5�cW�3�      �   7   x�300�N��4�44�4�200��IM�(MO�4	��9!JL�b���� 8�
�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   "   x�3�tO-J�+I�2�K�KIM�/����� h�3      �      x������ � �      �      x������ � �      �     x���=n�0�g�:AA�0��@�"@W/�j�b(p2��!S'q\�������Djc������@��
�����{m4��?h��z"�\��}��U�fZ��ƇU�R��������,�h�@k�:��X��:�����lJi�q̀.��]t�̭��tX��L��h�ۜ�VfBK��R�Ke�����,D�<�1~�Q��,���da���K�]<p�l1��C?�	�������&uOMӜUI��      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   5   x�3�����O/J��/�2�2�9s2K����̜L(ǔ� 3�*�+F��� �      �   F   x�3��M�,J���Ɩ�%�1~Pd�eę����chd�` )0�2��*�����F��iHq��qqq L%?      �      x������ � �     