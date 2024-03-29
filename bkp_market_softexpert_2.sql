toc.dat                                                                                             0000600 0004000 0002000 00000021776 13557065126 0014466 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       %                
    w            market_softexpert    11.4    11.4 !    "           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false         #           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false         $           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false         %           1262    42797    market_softexpert    DATABASE        CREATE DATABASE market_softexpert WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
 !   DROP DATABASE market_softexpert;
             postgres    false         Ç            1259    42837    group_products    TABLE     ¶   CREATE TABLE public.group_products (
    id integer NOT NULL,
    description text,
    tax real,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
 "   DROP TABLE public.group_products;
       public         postgres    false         Æ            1259    42835    group_products_id_seq    SEQUENCE        CREATE SEQUENCE public.group_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.group_products_id_seq;
       public       postgres    false    199         &           0    0    group_products_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.group_products_id_seq OWNED BY public.group_products.id;
            public       postgres    false    198         Å            1259    42826    products    TABLE     ç   CREATE TABLE public.products (
    id integer NOT NULL,
    group_product_id integer,
    description text,
    price real,
    unid character(2),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
    DROP TABLE public.products;
       public         postgres    false         Ä            1259    42824    products_id_seq    SEQUENCE        CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public       postgres    false    197         '           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
            public       postgres    false    196         Ë            1259    42856 
   sale_items    TABLE     I  CREATE TABLE public.sale_items (
    id integer NOT NULL,
    sale_id integer,
    product_id integer,
    description text,
    unid character(50),
    qtd_unids real,
    price_unit real,
    total real,
    tax real,
    tax_total_item real,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
    DROP TABLE public.sale_items;
       public         postgres    false         Ê            1259    42854    sale_items_id_seq    SEQUENCE        CREATE SEQUENCE public.sale_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.sale_items_id_seq;
       public       postgres    false    203         (           0    0    sale_items_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.sale_items_id_seq OWNED BY public.sale_items.id;
            public       postgres    false    202         É            1259    42848    sales    TABLE     ß   CREATE TABLE public.sales (
    id integer NOT NULL,
    client character(100),
    total real,
    tax_total real,
    qtd_items integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
    DROP TABLE public.sales;
       public         postgres    false         È            1259    42846    sales_id_seq    SEQUENCE        CREATE SEQUENCE public.sales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.sales_id_seq;
       public       postgres    false    201         )           0    0    sales_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.sales_id_seq OWNED BY public.sales.id;
            public       postgres    false    200         
           2604    42840    group_products id    DEFAULT     v   ALTER TABLE ONLY public.group_products ALTER COLUMN id SET DEFAULT nextval('public.group_products_id_seq'::regclass);
 @   ALTER TABLE public.group_products ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    199    199         
           2604    42829    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    196    197    197         
           2604    42859    sale_items id    DEFAULT     n   ALTER TABLE ONLY public.sale_items ALTER COLUMN id SET DEFAULT nextval('public.sale_items_id_seq'::regclass);
 <   ALTER TABLE public.sale_items ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    203    203         
           2604    42851    sales id    DEFAULT     d   ALTER TABLE ONLY public.sales ALTER COLUMN id SET DEFAULT nextval('public.sales_id_seq'::regclass);
 7   ALTER TABLE public.sales ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200    201                   0    42837    group_products 
   TABLE DATA               V   COPY public.group_products (id, description, tax, created_at, updated_at) FROM stdin;
    public       postgres    false    199       2843.dat           0    42826    products 
   TABLE DATA               j   COPY public.products (id, group_product_id, description, price, unid, created_at, updated_at) FROM stdin;
    public       postgres    false    197       2841.dat           0    42856 
   sale_items 
   TABLE DATA                  COPY public.sale_items (id, sale_id, product_id, description, unid, qtd_unids, price_unit, total, tax, tax_total_item, created_at, updated_at) FROM stdin;
    public       postgres    false    203       2847.dat           0    42848    sales 
   TABLE DATA               `   COPY public.sales (id, client, total, tax_total, qtd_items, created_at, updated_at) FROM stdin;
    public       postgres    false    201       2845.dat *           0    0    group_products_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.group_products_id_seq', 4, true);
            public       postgres    false    198         +           0    0    products_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.products_id_seq', 8, true);
            public       postgres    false    196         ,           0    0    sale_items_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.sale_items_id_seq', 107, true);
            public       postgres    false    202         -           0    0    sales_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.sales_id_seq', 114, true);
            public       postgres    false    200         
           2606    42845 "   group_products group_products_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.group_products
    ADD CONSTRAINT group_products_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.group_products DROP CONSTRAINT group_products_pkey;
       public         postgres    false    199         
           2606    42834    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public         postgres    false    197         
           2606    42864    sale_items sale_items_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.sale_items
    ADD CONSTRAINT sale_items_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.sale_items DROP CONSTRAINT sale_items_pkey;
       public         postgres    false    203         
           2606    42853    sales sales_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.sales DROP CONSTRAINT sales_pkey;
       public         postgres    false    201         
           2606    42865 "   sale_items sale_items_sale_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.sale_items
    ADD CONSTRAINT sale_items_sale_id_fkey FOREIGN KEY (sale_id) REFERENCES public.sales(id);
 L   ALTER TABLE ONLY public.sale_items DROP CONSTRAINT sale_items_sale_id_fkey;
       public       postgres    false    201    203    2715          2843.dat                                                                                            0000600 0004000 0002000 00000000330 13557065126 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	Grupo Teste 2	22.6000004	2019-10-30 03:55:33-03	2019-10-30 04:18:30-03
1	Grupo Teste 1	15.6000004	2019-10-30 03:53:14-03	2019-10-30 04:18:47-03
3	Grupo Teste 3	10	2019-10-30 04:20:13-03	2019-10-30 04:20:13-03
\.


                                                                                                                                                                                                                                                                                                        2841.dat                                                                                            0000600 0004000 0002000 00000000617 13557065126 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	Teste	154.25	Un	2019-10-30 10:29:03-03	2019-10-30 10:29:03-03
3	3	Produto teste 3	18.5	Un	2019-10-30 10:34:43-03	2019-10-30 10:34:43-03
4	0	Produto teste 4	54.6899986	Un	2019-10-30 11:49:35-03	2019-10-30 14:11:29-03
5	2	Produto teste 5	48.6500015	Cx	2019-10-30 15:01:57-03	2019-10-30 15:05:50-03
8	1	Pano de prato rosa com bolinha amarela	5	Un	2019-11-01 15:15:52-03	2019-11-01 15:15:52-03
\.


                                                                                                                 2847.dat                                                                                            0000600 0004000 0002000 00000033534 13557065126 0014300 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	60	3	Produto teste 3	Un                                                	1	18.5	20.3500004	10	1.85000002	2019-11-01 04:00:09-03	2019-11-01 04:00:09-03
2	\N	\N	\N	\N	\N	\N	\N	\N	\N	2019-11-01 04:19:03-03	2019-11-01 04:19:03-03
3	60	3	Produto teste 3	Un                                                	1	18.5	20.3500004	10	1.85000002	2019-11-01 04:22:15-03	2019-11-01 04:22:15-03
4	60	5	Produto teste 5	Cx                                                	2	48.6500015	59.6399994	22.6000004	10.9948997	2019-11-01 04:27:09-03	2019-11-01 04:27:09-03
5	\N	\N	\N	\N	\N	\N	\N	\N	\N	2019-11-01 10:08:49-03	2019-11-01 10:08:49-03
6	62	3	Produto teste 3	Un                                                	2	18.5	20.3500004	10	1.85000002	2019-11-01 10:11:04-03	2019-11-01 10:11:04-03
7	62	5	Produto teste 5	Cx                                                	3	48.6500015	59.6399994	22.6000004	10.9948997	2019-11-01 10:11:48-03	2019-11-01 10:11:48-03
8	63	5	Produto teste 5	Cx                                                	3	48.6500015	59.6399994	22.6000004	10.9948997	2019-11-01 10:22:45-03	2019-11-01 10:22:45-03
9	64	1	Teste	Un                                                	2	154.25	178.309998	15.6000004	24.0629997	2019-11-01 10:23:17-03	2019-11-01 10:23:17-03
10	64	5	Produto teste 5	Cx                                                	1	48.6500015	59.6399994	22.6000004	10.9948997	2019-11-01 10:24:10-03	2019-11-01 10:24:10-03
11	65	1	Teste	Un                                                	1	154.25	178.309998	15.6000004	24.0629997	2019-11-01 10:26:42-03	2019-11-01 10:26:42-03
12	66	1	Teste	Un                                                	1	154.25	178.309998	15.6000004	24.0629997	2019-11-01 10:57:04-03	2019-11-01 10:57:04-03
13	67	3	Produto teste 3	Un                                                	2	18.5	20.3500004	10	1.85000002	2019-11-01 11:01:39-03	2019-11-01 11:01:39-03
14	68	3	Produto teste 3	Un                                                	2	18.5	20.3500004	10	1.85000002	2019-11-01 13:09:20-03	2019-11-01 13:09:20-03
15	68	5	Produto teste 5	Cx                                                	2	48.6500015	59.6399994	22.6000004	10.9948997	2019-11-01 13:09:56-03	2019-11-01 13:09:56-03
16	72	1	Teste	Un                                                	1	154.25	178.309998	15.6000004	24.0629997	2019-11-01 13:32:05-03	2019-11-01 13:32:05-03
17	73	1	Teste	Un                                                	1	154.25	178.309998	15.6000004	24.0629997	2019-11-01 13:33:08-03	2019-11-01 13:33:08-03
18	74	3	Produto teste 3	Un                                                	1	18.5	20.3500004	10	\N	2019-11-01 13:34:05-03	2019-11-01 13:34:05-03
19	75	1	Teste	Un                                                	1	154.25	178.309998	15.6000004	\N	2019-11-01 13:36:05-03	2019-11-01 13:36:05-03
20	75	3	Produto teste 3	Un                                                	1	18.5	20.3500004	10	1.85000002	2019-11-01 13:37:37-03	2019-11-01 13:37:37-03
21	76	1	Teste	Un                                                	1	154.25	178.309998	15.6000004	24.0629997	2019-11-01 13:39:20-03	2019-11-01 13:39:20-03
22	76	3	Produto teste 3	Un                                                	3	18.5	20.3500004	10	1.85000002	2019-11-01 13:39:45-03	2019-11-01 13:39:45-03
23	77	1	Teste	Un                                                	1	154.25	178.309998	15.6000004	24.0629997	2019-11-01 13:44:05-03	2019-11-01 13:44:05-03
24	77	3	Produto teste 3	Un                                                	3	18.5	20.3500004	10	1.85000002	2019-11-01 13:44:25-03	2019-11-01 13:44:25-03
25	78	1	Teste	Un                                                	2	154.25	178.309998	15.6000004	24.0629997	2019-11-01 13:45:52-03	2019-11-01 13:45:52-03
26	78	3	Produto teste 3	Un                                                	1	18.5	20.3500004	10	1.85000002	2019-11-01 13:45:57-03	2019-11-01 13:45:57-03
27	78	5	Produto teste 5	Cx                                                	1	48.6500015	59.6399994	22.6000004	10.9948997	2019-11-01 13:46:01-03	2019-11-01 13:46:01-03
28	78	3	Produto teste 3	Un                                                	3	18.5	20.3500004	10	1.85000002	2019-11-01 13:46:34-03	2019-11-01 13:46:34-03
29	78	3	Produto teste 3	Un                                                	3	18.5	20.3500004	10	1.85000002	2019-11-01 13:46:36-03	2019-11-01 13:46:36-03
30	78	3	Produto teste 3	Un                                                	3	18.5	20.3500004	10	1.85000002	2019-11-01 13:46:36-03	2019-11-01 13:46:36-03
31	78	3	Produto teste 3	Un                                                	3	18.5	20.3500004	10	1.85000002	2019-11-01 13:46:36-03	2019-11-01 13:46:36-03
32	79	3	Produto teste 3	Un                                                	2	18.5	20.3500004	10	1.85000002	2019-11-01 13:56:56-03	2019-11-01 13:56:56-03
33	79	5	Produto teste 5	Cx                                                	2	48.6500015	59.6399994	22.6000004	10.9948997	2019-11-01 13:57:10-03	2019-11-01 13:57:10-03
34	82	3	Produto teste 3	Un                                                	2	18.5	20.3500004	10	1.85000002	2019-11-01 14:07:22-03	2019-11-01 14:07:22-03
35	82	5	Produto teste 5	Cx                                                	2	48.6500015	59.6399994	22.6000004	10.9948997	2019-11-01 14:08:26-03	2019-11-01 14:08:26-03
36	83	1	Teste	Un                                                	2	154.25	178.309998	15.6000004	24.0629997	2019-11-01 14:22:25-03	2019-11-01 14:22:25-03
37	83	3	Produto teste 3	Un                                                	4	18.5	20.3500004	10	1.85000002	2019-11-01 14:22:37-03	2019-11-01 14:22:37-03
38	83	5	Produto teste 5	Cx                                                	2	48.6500015	59.6399994	22.6000004	10.9948997	2019-11-01 14:23:33-03	2019-11-01 14:23:33-03
39	85	3	Produto teste 3	Un                                                	1	18.5	20.3500004	10	1.85000002	2019-11-01 14:46:15-03	2019-11-01 14:46:15-03
40	86	4	Produto teste 4	Un                                                	1	54.6899986	54.6899986	0	0	2019-11-01 14:51:14-03	2019-11-01 14:51:14-03
41	86	3	Produto teste 3	Un                                                	2	18.5	20.3500004	10	1.85000002	2019-11-01 14:51:33-03	2019-11-01 14:51:33-03
42	86	5	Produto teste 5	Cx                                                	2	48.6500015	59.6399994	22.6000004	10.9948997	2019-11-01 14:51:53-03	2019-11-01 14:51:53-03
43	87	4	Produto teste 4	Un                                                	1	54.6899986	54.6899986	0	0	2019-11-01 14:54:42-03	2019-11-01 14:54:42-03
44	87	3	Produto teste 3	Un                                                	1	18.5	20.3500004	10	1.85000002	2019-11-01 14:54:52-03	2019-11-01 14:54:52-03
48	89	4	Produto teste 4	Un                                                	1	54.6899986	54.6899986	0	0	2019-11-01 15:10:20-03	2019-11-01 15:10:20-03
49	89	3	Produto teste 3	Un                                                	1	18.5	20.3500004	10	1.85000002	2019-11-01 15:10:41-03	2019-11-01 15:10:41-03
50	89	5	Produto teste 5	Cx                                                	2	48.6500015	59.6399994	22.6000004	10.9948997	2019-11-01 15:11:19-03	2019-11-01 15:11:19-03
51	89	1	Teste	Un                                                	1	154.25	178.309998	15.6000004	24.0629997	2019-11-01 15:12:42-03	2019-11-01 15:12:42-03
52	89	3	Produto teste 3	Un                                                	2	18.5	20.3500004	10	1.85000002	2019-11-01 15:13:26-03	2019-11-01 15:13:26-03
53	89	5	Produto teste 5	Cx                                                	3	48.6500015	59.6399994	22.6000004	10.9948997	2019-11-01 15:13:33-03	2019-11-01 15:13:33-03
54	89	7	Produto teste 5	Un                                                	3	48	48	0	0	2019-11-01 15:13:39-03	2019-11-01 15:13:39-03
55	89	1	Teste	Un                                                	1	154.25	178.309998	15.6000004	24.0629997	2019-11-01 15:13:45-03	2019-11-01 15:13:45-03
56	89	5	Produto teste 5	Cx                                                	3	48.6500015	59.6399994	22.6000004	10.9948997	2019-11-01 15:13:50-03	2019-11-01 15:13:50-03
57	89	5	Produto teste 5	Cx                                                	3	48.6500015	59.6399994	22.6000004	10.9948997	2019-11-01 15:13:52-03	2019-11-01 15:13:52-03
58	89	5	Produto teste 5	Cx                                                	3	48.6500015	59.6399994	22.6000004	10.9948997	2019-11-01 15:13:53-03	2019-11-01 15:13:53-03
59	89	5	Produto teste 5	Cx                                                	3	48.6500015	59.6399994	22.6000004	10.9948997	2019-11-01 15:13:55-03	2019-11-01 15:13:55-03
60	89	5	Produto teste 5	Cx                                                	3	48.6500015	59.6399994	22.6000004	10.9948997	2019-11-01 15:13:56-03	2019-11-01 15:13:56-03
61	89	5	Produto teste 5	Cx                                                	3	48.6500015	59.6399994	22.6000004	10.9948997	2019-11-01 15:13:57-03	2019-11-01 15:13:57-03
62	90	8	Pano de prato rosa com bolinha amarela	Un                                                	3	5	5.78000021	15.6000004	0.779999971	2019-11-01 15:16:56-03	2019-11-01 15:16:56-03
63	91	3	Produto teste 3	Un                                                	1	18.5	20.3500004	10	1.85000002	2019-11-01 15:43:28-03	2019-11-01 15:43:28-03
64	93	3	Produto teste 3	Un                                                	2	18.5	20.3500004	10	1.85000002	2019-11-01 15:43:48-03	2019-11-01 15:43:48-03
70	97	3	Produto teste 3	Un                                                	1	18.5	20.3500004	10	1.85000002	2019-11-01 16:05:53-03	2019-11-01 16:05:53-03
71	98	3	Produto teste 3	Un                                                	1	18.5	20.3500004	10	1.85000002	2019-11-01 16:22:14-03	2019-11-01 16:22:14-03
73	98	7	Produto teste 5	Un                                                	1	48	48	0	0	2019-11-01 16:22:38-03	2019-11-01 16:22:38-03
76	104	3	Produto teste 3	Un                                                	1	18.5	20.3500004	10	1.85000002	2019-11-01 16:34:33-03	2019-11-01 16:34:33-03
78	104	7	Produto teste 5	Un                                                	1	48	48	0	0	2019-11-01 16:34:37-03	2019-11-01 16:34:37-03
83	106	5	Produto teste 5	Cx                                                	3	48.6500015	59.6399994	22.6000004	10.9948997	2019-11-01 17:23:16-03	2019-11-01 17:23:16-03
84	106	5	Produto teste 5	Cx                                                	3	48.6500015	59.6399994	22.6000004	10.9948997	2019-11-01 17:23:19-03	2019-11-01 17:23:19-03
85	106	8	Pano de prato rosa com bolinha amarela	Un                                                	2	5	5.78000021	15.6000004	0.779999971	2019-11-01 17:23:22-03	2019-11-01 17:23:22-03
86	106	3	Produto teste 3	Un                                                	2	18.5	20.3500004	10	1.85000002	2019-11-01 17:24:18-03	2019-11-01 17:24:18-03
87	106	1	Teste	Un                                                	2	154.25	178.309998	15.6000004	24.0629997	2019-11-01 17:24:23-03	2019-11-01 17:24:23-03
88	106	1	Teste	Un                                                	2	154.25	178.309998	15.6000004	24.0629997	2019-11-01 17:24:24-03	2019-11-01 17:24:24-03
89	106	1	Teste	Un                                                	2	154.25	178.309998	15.6000004	24.0629997	2019-11-01 17:24:25-03	2019-11-01 17:24:25-03
90	107	3	Produto teste 3	Un                                                	1	18.5	20.3500004	10	1.85000002	2019-11-01 17:29:16-03	2019-11-01 17:29:16-03
91	109	3	Produto teste 3	Un                                                	1	18.5	20.3500004	10	1.85000002	2019-11-01 17:31:21-03	2019-11-01 17:31:21-03
92	109	5	Produto teste 5	Cx                                                	1	48.6500015	59.6399994	22.6000004	10.9948997	2019-11-01 17:31:36-03	2019-11-01 17:31:36-03
93	109	8	Pano de prato rosa com bolinha amarela	Un                                                	1	5	5.78000021	15.6000004	0.779999971	2019-11-01 17:31:39-03	2019-11-01 17:31:39-03
94	110	3	Produto teste 3	Un                                                	2	18.5	20.3500004	10	1.85000002	2019-11-01 17:37:19-03	2019-11-01 17:37:19-03
95	110	4	Produto teste 4	Un                                                	1	54.6899986	54.6899986	0	0	2019-11-01 17:37:24-03	2019-11-01 17:37:24-03
96	110	8	Pano de prato rosa com bolinha amarela	Un                                                	1	5	5.78000021	15.6000004	0.779999971	2019-11-01 17:37:26-03	2019-11-01 17:37:26-03
97	111	3	Produto teste 3	Un                                                	1	18.5	20.3500004	10	1.85000002	2019-11-01 17:38:13-03	2019-11-01 17:38:13-03
98	111	4	Produto teste 4	Un                                                	3	54.6899986	54.6899986	0	0	2019-11-01 17:38:16-03	2019-11-01 17:38:16-03
99	112	4	Produto teste 4	Un                                                	1	54.6899986	54.6899986	0	0	2019-11-01 17:38:45-03	2019-11-01 17:38:45-03
100	112	5	Produto teste 5	Cx                                                	3	48.6500015	59.6399994	22.6000004	10.9948997	2019-11-01 17:38:49-03	2019-11-01 17:38:49-03
101	113	3	Produto teste 3	Un                                                	1	18.5	20.3500004	10	1.85000002	2019-11-01 17:41:44-03	2019-11-01 17:41:44-03
102	113	4	Produto teste 4	Un                                                	1	54.6899986	54.6899986	0	0	2019-11-01 17:41:48-03	2019-11-01 17:41:48-03
103	113	8	Pano de prato rosa com bolinha amarela	Un                                                	1	5	5.78000021	15.6000004	0.779999971	2019-11-01 17:41:52-03	2019-11-01 17:41:52-03
104	114	3	Produto teste 3	Un                                                	1	18.5	20.3500004	10	1.85000002	2019-11-01 17:45:25-03	2019-11-01 17:45:25-03
105	114	4	Produto teste 4	Un                                                	1	54.6899986	54.6899986	0	0	2019-11-01 17:45:26-03	2019-11-01 17:45:26-03
106	114	8	Pano de prato rosa com bolinha amarela	Un                                                	1	5	5.78000021	15.6000004	0.779999971	2019-11-01 17:45:30-03	2019-11-01 17:45:30-03
107	114	4	Produto teste 4	Un                                                	100	54.6899986	54.6899986	0	0	2019-11-01 17:47:53-03	2019-11-01 17:47:53-03
\.


                                                                                                                                                                    2845.dat                                                                                            0000600 0004000 0002000 00000015260 13557065126 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	NÃ£o Informado                                                                                       	\N	\N	\N	2019-10-31 19:09:44-03	2019-10-31 19:09:44-03
74	Thiago de Oliveira                                                                                  	0	0	0	2019-11-01 13:33:52-03	2019-11-01 13:33:57-03
75	Thiago de Oliveira                                                                                  	0	0	0	2019-11-01 13:35:53-03	2019-11-01 13:35:59-03
97	Thiago de Oliveira                                                                                  	20.3500004	1.85000002	1	2019-11-01 16:05:45-03	2019-11-01 16:05:54-03
76	Thiago de Oliveira                                                                                  	178.309998	24.0629997	0	2019-11-01 13:39:09-03	2019-11-01 13:39:25-03
60	Thiago de Oliveira                                                                                  	0	0	0	2019-11-01 03:59:38-03	2019-11-01 04:22:10-03
62	Thiago de Oliveira 123                                                                              	0	0	0	2019-11-01 10:10:43-03	2019-11-01 10:10:49-03
63	Thiago de Oliveira 123                                                                              	0	0	0	2019-11-01 10:21:48-03	2019-11-01 10:21:52-03
64	Thiago de Oliveira                                                                                  	0	0	0	2019-11-01 10:23:00-03	2019-11-01 10:23:05-03
65	Thiago de Oliveira 123                                                                              	0	0	0	2019-11-01 10:26:31-03	2019-11-01 10:26:36-03
66	Thiago de Oliveira 123                                                                              	0	0	0	2019-11-01 10:56:56-03	2019-11-01 10:56:59-03
67	Thiago de Oliveira                                                                                  	0	0	0	2019-11-01 11:01:28-03	2019-11-01 11:01:33-03
68	Thiago de Oliveira                                                                                  	0	0	0	2019-11-01 13:08:51-03	2019-11-01 13:09:20-03
77	Thiago de Oliveira                                                                                  	178.309998	24.0629997	1	2019-11-01 13:43:57-03	2019-11-01 13:44:06-03
69	Thiago de Oliveira 123                                                                              	0	0	0	2019-11-01 13:12:24-03	2019-11-01 13:13:49-03
107	Thiago de Oliveira                                                                                  	20.3500004	1.85000002	1	2019-11-01 17:29:07-03	2019-11-01 17:29:17-03
78	Thiago de Oliveira                                                                                  	356.619995	48.1259995	1	2019-11-01 13:45:39-03	2019-11-01 13:45:52-03
89	Thiago de Oliveira                                                                                  	1988.07996	306.519989	14	2019-11-01 15:10:05-03	2019-11-01 15:13:57-03
70	Thiago de Oliveira                                                                                  	0	0	0	2019-11-01 13:13:52-03	2019-11-01 13:22:02-03
71	Thiago de Oliveira 123                                                                              	0	0	0	2019-11-01 13:22:02-03	2019-11-01 13:22:09-03
72	Thiago de Oliveira                                                                                  	0	0	0	2019-11-01 13:28:36-03	2019-11-01 13:28:49-03
83	Thiago de Oliveira                                                                                  	557.299988	48.1399994	3	2019-11-01 14:22:09-03	2019-11-01 14:44:49-03
73	Thiago de Oliveira                                                                                  	0	0	0	2019-11-01 13:32:12-03	2019-11-01 13:33:00-03
79	Thiago de Oliveira                                                                                  	40.7000008	3.70000005	1	2019-11-01 13:56:44-03	2019-11-01 13:57:03-03
85	Thiago de Oliveira                                                                                  	20.3500004	1.85000002	1	2019-11-01 14:46:06-03	2019-11-01 14:46:19-03
90	Athur Ribeiro de Oliveira                                                                           	17.3400002	2.33999991	1	2019-11-01 15:16:13-03	2019-11-01 15:16:56-03
82	Thiago de Oliveira                                                                                  	159.979996	3.70000005	2	2019-11-01 14:07:05-03	2019-11-01 14:17:54-03
108	 -                                                                                                  	\N	\N	\N	2019-11-01 17:31:12-03	2019-11-01 17:31:12-03
86	Thiago de Oliveira                                                                                  	214.669998	0	3	2019-11-01 14:50:52-03	2019-11-01 14:51:55-03
91	Thiago de Oliveira                                                                                  	20.3500004	1.85000002	1	2019-11-01 15:43:22-03	2019-11-01 15:43:29-03
87	Thiago de Oliveira                                                                                  	75.0400009	0	2	2019-11-01 14:54:30-03	2019-11-01 14:54:56-03
93	Thiago de Oliveira                                                                                  	40.7000008	3.70000005	1	2019-11-01 15:43:38-03	2019-11-01 15:43:48-03
111	Thiago de Oliveira                                                                                  	184.419998	1.85000002	2	2019-11-01 17:38:07-03	2019-11-01 17:38:16-03
98	Thiago de Oliveira                                                                                  	68.3499985	1.85000002	2	2019-11-01 16:14:05-03	2019-11-01 16:24:59-03
104	Thiago de Oliveira                                                                                  	68.3499985	1.85000002	2	2019-11-01 16:34:25-03	2019-11-01 16:34:41-03
113	Thiago de Oliveira                                                                                  	80.8199997	2.63000011	3	2019-11-01 17:41:34-03	2019-11-01 17:41:53-03
110	Thiago de Oliveira                                                                                  	101.169998	4.48000002	3	2019-11-01 17:36:35-03	2019-11-01 17:37:27-03
106	Thiago de Oliveira                                                                                  	1479.95996	215.610001	7	2019-11-01 17:23:07-03	2019-11-01 17:24:25-03
109	Thiago de Oliveira                                                                                  	85.7699966	13.6199999	3	2019-11-01 17:31:15-03	2019-11-01 17:31:40-03
112	Thiago de Oliveira                                                                                  	233.610001	32.9799995	2	2019-11-01 17:38:39-03	2019-11-01 17:38:49-03
114	Thiago de Oliveira                                                                                  	5549.81982	2.63000011	4	2019-11-01 17:45:18-03	2019-11-01 17:47:54-03
\.


                                                                                                                                                                                                                                                                                                                                                restore.sql                                                                                         0000600 0004000 0002000 00000020051 13557065126 0015374 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE market_softexpert;
--
-- Name: market_softexpert; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE market_softexpert WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';


ALTER DATABASE market_softexpert OWNER TO postgres;

\connect market_softexpert

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: group_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_products (
    id integer NOT NULL,
    description text,
    tax real,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.group_products OWNER TO postgres;

--
-- Name: group_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_products_id_seq OWNER TO postgres;

--
-- Name: group_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_products_id_seq OWNED BY public.group_products.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    group_product_id integer,
    description text,
    price real,
    unid character(2),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: sale_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sale_items (
    id integer NOT NULL,
    sale_id integer,
    product_id integer,
    description text,
    unid character(50),
    qtd_unids real,
    price_unit real,
    total real,
    tax real,
    tax_total_item real,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.sale_items OWNER TO postgres;

--
-- Name: sale_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sale_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sale_items_id_seq OWNER TO postgres;

--
-- Name: sale_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sale_items_id_seq OWNED BY public.sale_items.id;


--
-- Name: sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales (
    id integer NOT NULL,
    client character(100),
    total real,
    tax_total real,
    qtd_items integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.sales OWNER TO postgres;

--
-- Name: sales_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_id_seq OWNER TO postgres;

--
-- Name: sales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_id_seq OWNED BY public.sales.id;


--
-- Name: group_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_products ALTER COLUMN id SET DEFAULT nextval('public.group_products_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: sale_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_items ALTER COLUMN id SET DEFAULT nextval('public.sale_items_id_seq'::regclass);


--
-- Name: sales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales ALTER COLUMN id SET DEFAULT nextval('public.sales_id_seq'::regclass);


--
-- Data for Name: group_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_products (id, description, tax, created_at, updated_at) FROM stdin;
\.
COPY public.group_products (id, description, tax, created_at, updated_at) FROM '$$PATH$$/2843.dat';

--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, group_product_id, description, price, unid, created_at, updated_at) FROM stdin;
\.
COPY public.products (id, group_product_id, description, price, unid, created_at, updated_at) FROM '$$PATH$$/2841.dat';

--
-- Data for Name: sale_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sale_items (id, sale_id, product_id, description, unid, qtd_unids, price_unit, total, tax, tax_total_item, created_at, updated_at) FROM stdin;
\.
COPY public.sale_items (id, sale_id, product_id, description, unid, qtd_unids, price_unit, total, tax, tax_total_item, created_at, updated_at) FROM '$$PATH$$/2847.dat';

--
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales (id, client, total, tax_total, qtd_items, created_at, updated_at) FROM stdin;
\.
COPY public.sales (id, client, total, tax_total, qtd_items, created_at, updated_at) FROM '$$PATH$$/2845.dat';

--
-- Name: group_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_products_id_seq', 4, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 8, true);


--
-- Name: sale_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sale_items_id_seq', 107, true);


--
-- Name: sales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_id_seq', 114, true);


--
-- Name: group_products group_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_products
    ADD CONSTRAINT group_products_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: sale_items sale_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_items
    ADD CONSTRAINT sale_items_pkey PRIMARY KEY (id);


--
-- Name: sales sales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (id);


--
-- Name: sale_items sale_items_sale_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_items
    ADD CONSTRAINT sale_items_sale_id_fkey FOREIGN KEY (sale_id) REFERENCES public.sales(id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       