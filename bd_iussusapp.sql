--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.22
-- Dumped by pg_dump version 9.5.22

-- Started on 2022-04-08 21:37:05

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
-- TOC entry 2172 (class 0 OID 0)
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
    age_fecha time with time zone,
    age_codcli integer,
    age_notas text
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
-- TOC entry 2173 (class 0 OID 0)
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
-- TOC entry 2174 (class 0 OID 0)
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
-- TOC entry 2175 (class 0 OID 0)
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
-- TOC entry 2176 (class 0 OID 0)
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
    ped_total numeric(12,2),
    ped_codigo integer NOT NULL
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
-- TOC entry 2177 (class 0 OID 0)
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
    pro_costo numeric(12,2),
    pro_precio numeric(12,2),
    pro_unimed integer,
    pro_obse text
);


ALTER TABLE public.producto OWNER TO postgres;

--
-- TOC entry 2178 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN producto.pro_unimed; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.producto.pro_unimed IS '1=Unidad, 2=Metros, 3=Centimetros, 4=Kg';


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
-- TOC entry 2179 (class 0 OID 0)
-- Dependencies: 185
-- Name: producto_pro_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producto_pro_codigo_seq OWNED BY public.producto.pro_codigo;


--
-- TOC entry 2019 (class 2604 OID 32959)
-- Name: age_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agenda ALTER COLUMN age_codigo SET DEFAULT nextval('public.agenda_age_codigo_seq'::regclass);


--
-- TOC entry 2016 (class 2604 OID 24820)
-- Name: cli_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN cli_codigo SET DEFAULT nextval('public.cliente_cli_codigo_seq'::regclass);


--
-- TOC entry 2017 (class 2604 OID 32937)
-- Name: est_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado ALTER COLUMN est_codigo SET DEFAULT nextval('public.estado_est_codigo_seq'::regclass);


--
-- TOC entry 2020 (class 2604 OID 32975)
-- Name: ped_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido ALTER COLUMN ped_codigo SET DEFAULT nextval('public.pedido_ped_codigo_seq'::regclass);


--
-- TOC entry 2021 (class 2604 OID 32986)
-- Name: pedi_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido_detalle ALTER COLUMN pedi_codigo SET DEFAULT nextval('public.detalle_pedido_pedi_codigo_seq'::regclass);


--
-- TOC entry 2018 (class 2604 OID 32948)
-- Name: pro_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto ALTER COLUMN pro_codigo SET DEFAULT nextval('public.producto_pro_codigo_seq'::regclass);


--
-- TOC entry 2159 (class 0 OID 32956)
-- Dependencies: 188
-- Data for Name: agenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agenda (age_codigo, age_fecha, age_codcli, age_notas) FROM stdin;
\.


--
-- TOC entry 2180 (class 0 OID 0)
-- Dependencies: 187
-- Name: agenda_age_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agenda_age_codigo_seq', 1, false);


--
-- TOC entry 2153 (class 0 OID 24817)
-- Dependencies: 182
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (cli_codigo, cli_nombre, cli_apellido, cli_ruci, cli_direccion, cli_telefono, cli_correo, cli_notas) FROM stdin;
1	Luis Modificado	Fernandez	16123-8	Km 8 Monday	0975-253-653	luis1@gmail.com	El proximo pedido seria una taza
60	Melina	Caceras					 
62	Moni	Leguizamon			0982-235-562		 
74	MOnica 512	guitierrez 63	415151	Km 21	0975-895-256	monica123@gmail.com	 
75	Luz 122	suarez	515	Km 22	0975-892-265	\N	 Cliente fiel
76	Sandra modificado	Lopez	151	km 22	0985-253-562	\N	 
\.


--
-- TOC entry 2181 (class 0 OID 0)
-- Dependencies: 181
-- Name: cliente_cli_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_cli_codigo_seq', 76, true);


--
-- TOC entry 2182 (class 0 OID 0)
-- Dependencies: 191
-- Name: detalle_pedido_pedi_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detalle_pedido_pedi_codigo_seq', 1, false);


--
-- TOC entry 2155 (class 0 OID 32934)
-- Dependencies: 184
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estado (est_codigo, est_descripcion) FROM stdin;
2	Terminado
3	Presupuestado
25	Pendiente modificado
\.


--
-- TOC entry 2183 (class 0 OID 0)
-- Dependencies: 183
-- Name: estado_est_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estado_est_codigo_seq', 25, true);


--
-- TOC entry 2161 (class 0 OID 32972)
-- Dependencies: 190
-- Data for Name: pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedido (ped_fecha, ped_codcli, ped_obse, ped_total, ped_codigo) FROM stdin;
\.


--
-- TOC entry 2163 (class 0 OID 32983)
-- Dependencies: 192
-- Data for Name: pedido_detalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedido_detalle (pedi_codigo, pedi_nropedi, pedi_codprodu, pedi_precio, pedi_cant) FROM stdin;
\.


--
-- TOC entry 2184 (class 0 OID 0)
-- Dependencies: 189
-- Name: pedido_ped_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedido_ped_codigo_seq', 1, false);


--
-- TOC entry 2157 (class 0 OID 32945)
-- Dependencies: 186
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producto (pro_codigo, pro_descripcion, pro_costo, pro_precio, pro_unimed, pro_obse) FROM stdin;
1	Taza personalizada	15000.00	30000.00	1	El trabajo lleva una hora para realizarse
5	Remera personalizada 	25000.00	35000.00	1	
7	Termo Perzonalizado modificado	150000.00	200000.00	1	Puede ser con foto y texto
\.


--
-- TOC entry 2185 (class 0 OID 0)
-- Dependencies: 185
-- Name: producto_pro_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producto_pro_codigo_seq', 10, true);


--
-- TOC entry 2029 (class 2606 OID 32964)
-- Name: agenda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agenda
    ADD CONSTRAINT agenda_pkey PRIMARY KEY (age_codigo);


--
-- TOC entry 2023 (class 2606 OID 24825)
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cli_codigo);


--
-- TOC entry 2033 (class 2606 OID 32988)
-- Name: detalle_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido_detalle
    ADD CONSTRAINT detalle_pedido_pkey PRIMARY KEY (pedi_codigo);


--
-- TOC entry 2025 (class 2606 OID 32942)
-- Name: estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (est_codigo);


--
-- TOC entry 2031 (class 2606 OID 32980)
-- Name: pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (ped_codigo);


--
-- TOC entry 2027 (class 2606 OID 32953)
-- Name: producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (pro_codigo);


--
-- TOC entry 2034 (class 2606 OID 32965)
-- Name: agenda_age_codcli_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agenda
    ADD CONSTRAINT agenda_age_codcli_fkey FOREIGN KEY (age_codcli) REFERENCES public.cliente(cli_codigo);


--
-- TOC entry 2037 (class 2606 OID 32994)
-- Name: detalle_pedido_pedi_codprodu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido_detalle
    ADD CONSTRAINT detalle_pedido_pedi_codprodu_fkey FOREIGN KEY (pedi_codprodu) REFERENCES public.producto(pro_codigo);


--
-- TOC entry 2036 (class 2606 OID 32989)
-- Name: detalle_pedido_pedi_nropedi_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido_detalle
    ADD CONSTRAINT detalle_pedido_pedi_nropedi_fkey FOREIGN KEY (pedi_nropedi) REFERENCES public.pedido(ped_codigo);


--
-- TOC entry 2035 (class 2606 OID 32999)
-- Name: pedido_ped_codcli_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_ped_codcli_fkey FOREIGN KEY (ped_codcli) REFERENCES public.cliente(cli_codigo);


--
-- TOC entry 2171 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2022-04-08 21:37:05

--
-- PostgreSQL database dump complete
--

