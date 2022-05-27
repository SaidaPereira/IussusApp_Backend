--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.22
-- Dumped by pg_dump version 9.5.22

-- Started on 2022-05-27 16:33:14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2185 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 188 (class 1259 OID 32956)
-- Name: agenda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agenda (
    age_codigo integer NOT NULL,
    age_codcli integer,
    age_notas text,
    age_fecha date
);


ALTER TABLE public.agenda OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 32954)
-- Name: agenda_age_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agenda_age_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agenda_age_codigo_seq OWNER TO postgres;

--
-- TOC entry 2186 (class 0 OID 0)
-- Dependencies: 187
-- Name: agenda_age_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agenda_age_codigo_seq OWNED BY public.agenda.age_codigo;


--
-- TOC entry 182 (class 1259 OID 24817)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    cli_codigo integer NOT NULL,
    cli_nombre character varying(40),
    cli_apellido character varying(40),
    cli_ruci character varying(15),
    cli_direccion character varying,
    cli_telefono character varying(25),
    cli_correo character varying(60),
    cli_notas text
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 24815)
-- Name: cliente_cli_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_cli_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_cli_codigo_seq OWNER TO postgres;

--
-- TOC entry 2187 (class 0 OID 0)
-- Dependencies: 181
-- Name: cliente_cli_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_cli_codigo_seq OWNED BY public.cliente.cli_codigo;


--
-- TOC entry 192 (class 1259 OID 32983)
-- Name: pedido_detalle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedido_detalle (
    pedi_codigo integer NOT NULL,
    pedi_nropedi integer,
    pedi_codprodu integer,
    pedi_precio numeric(12,2),
    pedi_cant integer
);


ALTER TABLE public.pedido_detalle OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 32981)
-- Name: detalle_pedido_pedi_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detalle_pedido_pedi_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detalle_pedido_pedi_codigo_seq OWNER TO postgres;

--
-- TOC entry 2188 (class 0 OID 0)
-- Dependencies: 191
-- Name: detalle_pedido_pedi_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detalle_pedido_pedi_codigo_seq OWNED BY public.pedido_detalle.pedi_codigo;


--
-- TOC entry 184 (class 1259 OID 32934)
-- Name: estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estado (
    est_codigo integer NOT NULL,
    est_descripcion text
);


ALTER TABLE public.estado OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 32932)
-- Name: estado_est_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estado_est_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estado_est_codigo_seq OWNER TO postgres;

--
-- TOC entry 2189 (class 0 OID 0)
-- Dependencies: 183
-- Name: estado_est_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estado_est_codigo_seq OWNED BY public.estado.est_codigo;


--
-- TOC entry 190 (class 1259 OID 32972)
-- Name: pedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedido (
    ped_fecha date,
    ped_codcli integer,
    ped_obse text,
    ped_total numeric(12,0),
    ped_codigo integer NOT NULL,
    ped_codest integer
);


ALTER TABLE public.pedido OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 32970)
-- Name: pedido_ped_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedido_ped_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pedido_ped_codigo_seq OWNER TO postgres;

--
-- TOC entry 2190 (class 0 OID 0)
-- Dependencies: 189
-- Name: pedido_ped_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedido_ped_codigo_seq OWNED BY public.pedido.ped_codigo;


--
-- TOC entry 186 (class 1259 OID 32945)
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto (
    pro_codigo integer NOT NULL,
    pro_descripcion text,
    pro_costo numeric(12,0),
    pro_precio numeric(12,0),
    pro_obse text,
    pro_unimed character varying
);


ALTER TABLE public.producto OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 32943)
-- Name: producto_pro_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producto_pro_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producto_pro_codigo_seq OWNER TO postgres;

--
-- TOC entry 2191 (class 0 OID 0)
-- Dependencies: 185
-- Name: producto_pro_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producto_pro_codigo_seq OWNED BY public.producto.pro_codigo;


--
-- TOC entry 194 (class 1259 OID 33006)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    usu_codigo integer NOT NULL,
    usu_email character varying(50),
    usu_password character varying,
    usu_name character varying(50),
    usu_token character varying,
    usu_img text,
    usu_telefono character varying(25)
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 33004)
-- Name: usuario_usu_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_usu_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_usu_codigo_seq OWNER TO postgres;

--
-- TOC entry 2192 (class 0 OID 0)
-- Dependencies: 193
-- Name: usuario_usu_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_usu_codigo_seq OWNED BY public.usuario.usu_codigo;


--
-- TOC entry 2026 (class 2604 OID 32959)
-- Name: age_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agenda ALTER COLUMN age_codigo SET DEFAULT nextval('public.agenda_age_codigo_seq'::regclass);


--
-- TOC entry 2023 (class 2604 OID 24820)
-- Name: cli_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN cli_codigo SET DEFAULT nextval('public.cliente_cli_codigo_seq'::regclass);


--
-- TOC entry 2024 (class 2604 OID 32937)
-- Name: est_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado ALTER COLUMN est_codigo SET DEFAULT nextval('public.estado_est_codigo_seq'::regclass);


--
-- TOC entry 2027 (class 2604 OID 32975)
-- Name: ped_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido ALTER COLUMN ped_codigo SET DEFAULT nextval('public.pedido_ped_codigo_seq'::regclass);


--
-- TOC entry 2028 (class 2604 OID 32986)
-- Name: pedi_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido_detalle ALTER COLUMN pedi_codigo SET DEFAULT nextval('public.detalle_pedido_pedi_codigo_seq'::regclass);


--
-- TOC entry 2025 (class 2604 OID 32948)
-- Name: pro_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto ALTER COLUMN pro_codigo SET DEFAULT nextval('public.producto_pro_codigo_seq'::regclass);


--
-- TOC entry 2029 (class 2604 OID 33009)
-- Name: usu_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN usu_codigo SET DEFAULT nextval('public.usuario_usu_codigo_seq'::regclass);


--
-- TOC entry 2170 (class 0 OID 32956)
-- Dependencies: 188
-- Data for Name: agenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agenda (age_codigo, age_codcli, age_notas, age_fecha) FROM stdin;
13	78	Llamar para acordar cita	2022-05-27
\.


--
-- TOC entry 2193 (class 0 OID 0)
-- Dependencies: 187
-- Name: agenda_age_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agenda_age_codigo_seq', 13, true);


--
-- TOC entry 2164 (class 0 OID 24817)
-- Dependencies: 182
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (cli_codigo, cli_nombre, cli_apellido, cli_ruci, cli_direccion, cli_telefono, cli_correo, cli_notas) FROM stdin;
1	Carlos	Fernandez	16123-8	Km 8 Monday	0975-253-653	luis1@gmail.com	El proximo pedido seria una taza
87	Luis	Montiel		Km 22	097852132		
89	Emerson Gabriel	Paixao		Remancito	094655532		
78	Adrian	Portillo	5547033	km 15 monday	0973898419	rojasadrian012@gmail.com	Aloha 2
\.


--
-- TOC entry 2194 (class 0 OID 0)
-- Dependencies: 181
-- Name: cliente_cli_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_cli_codigo_seq', 90, true);


--
-- TOC entry 2195 (class 0 OID 0)
-- Dependencies: 191
-- Name: detalle_pedido_pedi_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detalle_pedido_pedi_codigo_seq', 49, true);


--
-- TOC entry 2166 (class 0 OID 32934)
-- Dependencies: 184
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estado (est_codigo, est_descripcion) FROM stdin;
2	Terminado
29	Espera
32	A confirmar
3	Presupuestado
\.


--
-- TOC entry 2196 (class 0 OID 0)
-- Dependencies: 183
-- Name: estado_est_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estado_est_codigo_seq', 32, true);


--
-- TOC entry 2172 (class 0 OID 32972)
-- Dependencies: 190
-- Data for Name: pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedido (ped_fecha, ped_codcli, ped_obse, ped_total, ped_codigo, ped_codest) FROM stdin;
2022-05-25	1		10000	18	2
2022-05-27	89		110000	30	32
\.


--
-- TOC entry 2174 (class 0 OID 32983)
-- Dependencies: 192
-- Data for Name: pedido_detalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedido_detalle (pedi_codigo, pedi_nropedi, pedi_codprodu, pedi_precio, pedi_cant) FROM stdin;
28	18	1	2000.00	5
48	30	18	25000.00	2
49	30	5	30000.00	2
\.


--
-- TOC entry 2197 (class 0 OID 0)
-- Dependencies: 189
-- Name: pedido_ped_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedido_ped_codigo_seq', 30, true);


--
-- TOC entry 2168 (class 0 OID 32945)
-- Dependencies: 186
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producto (pro_codigo, pro_descripcion, pro_costo, pro_precio, pro_obse, pro_unimed) FROM stdin;
5	Remera personalizada 	25000	35000		\N
1	Taza personalizada	15000	30000	El trabajo lleva una hora para realizarse	\N
16	Termo personalizado 2	50000	75000		Unidad
18	Hoppy	25000	30000		Unidad
\.


--
-- TOC entry 2198 (class 0 OID 0)
-- Dependencies: 185
-- Name: producto_pro_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producto_pro_codigo_seq', 18, true);


--
-- TOC entry 2176 (class 0 OID 33006)
-- Dependencies: 194
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (usu_codigo, usu_email, usu_password, usu_name, usu_token, usu_img, usu_telefono) FROM stdin;
1	monica123@gmail.com	Doe123	monica	\N		
3	sai123@gmail.com	123	saida	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VfZW1haWwiOiJzYWkxMjNAZ21haWwuY29tIiwidXN1X2NvZGlnbyI6MywiaWF0IjoxNjUzNjgxNjk2fQ.t2VlIgqRdKqIDc9tsv048-Al6ZVqGyWCzNTDbKKl5eQ	\N	
4	saipereira123@gmail.com	123	sai pereira	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VfZW1haWwiOiJzYWlwZXJlaXJhMTIzQGdtYWlsLmNvbSIsInVzdV9jb2RpZ28iOjQsImlhdCI6MTY1MzY4MTg2MH0.kKCbjeiLCLzR3tQllN1wZVxDevmkDMvV0inJRNiv220	\N	
5	saida1234@gmail.com	123	sai mabel	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VfZW1haWwiOiJzYWlkYTEyMzRAZ21haWwuY29tIiwidXN1X2NvZGlnbyI6NSwiaWF0IjoxNjUzNjgyNDIxfQ.sCH4xCHJkLF0DulVWqp_NdUjzvb52xub5fLAee1CY7Q	data:image/jpeg;base64,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	0484945
\.


--
-- TOC entry 2199 (class 0 OID 0)
-- Dependencies: 193
-- Name: usuario_usu_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_usu_codigo_seq', 5, true);


--
-- TOC entry 2037 (class 2606 OID 32964)
-- Name: agenda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agenda
    ADD CONSTRAINT agenda_pkey PRIMARY KEY (age_codigo);


--
-- TOC entry 2031 (class 2606 OID 24825)
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cli_codigo);


--
-- TOC entry 2041 (class 2606 OID 32988)
-- Name: detalle_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido_detalle
    ADD CONSTRAINT detalle_pedido_pkey PRIMARY KEY (pedi_codigo);


--
-- TOC entry 2033 (class 2606 OID 32942)
-- Name: estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (est_codigo);


--
-- TOC entry 2039 (class 2606 OID 32980)
-- Name: pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (ped_codigo);


--
-- TOC entry 2035 (class 2606 OID 32953)
-- Name: producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (pro_codigo);


--
-- TOC entry 2043 (class 2606 OID 33014)
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (usu_codigo);


--
-- TOC entry 2044 (class 2606 OID 32965)
-- Name: agenda_age_codcli_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agenda
    ADD CONSTRAINT agenda_age_codcli_fkey FOREIGN KEY (age_codcli) REFERENCES public.cliente(cli_codigo);


--
-- TOC entry 2047 (class 2606 OID 32994)
-- Name: detalle_pedido_pedi_codprodu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido_detalle
    ADD CONSTRAINT detalle_pedido_pedi_codprodu_fkey FOREIGN KEY (pedi_codprodu) REFERENCES public.producto(pro_codigo);


--
-- TOC entry 2048 (class 2606 OID 33076)
-- Name: detalle_pedido_pedi_nropedi_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido_detalle
    ADD CONSTRAINT detalle_pedido_pedi_nropedi_fkey FOREIGN KEY (pedi_nropedi) REFERENCES public.pedido(ped_codigo) ON DELETE CASCADE;


--
-- TOC entry 2045 (class 2606 OID 32999)
-- Name: pedido_ped_codcli_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_ped_codcli_fkey FOREIGN KEY (ped_codcli) REFERENCES public.cliente(cli_codigo);


--
-- TOC entry 2046 (class 2606 OID 33027)
-- Name: pedido_ped_codest_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_ped_codest_fkey FOREIGN KEY (ped_codest) REFERENCES public.estado(est_codigo);


--
-- TOC entry 2184 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2022-05-27 16:33:14

--
-- PostgreSQL database dump complete
--

