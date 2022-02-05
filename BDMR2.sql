--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

-- Started on 2022-02-05 13:58:08

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

--
-- TOC entry 233 (class 1255 OID 18217)
-- Name: change(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.change() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE 
	cont integer:= 295;
BEGIN
	while(cont < 300) loop
		update pratos
		set ref = 5
		where codigopr = cont;
		cont := cont + 1;
	end loop;
	return cont;
END;
$$;


ALTER FUNCTION public.change() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 200 (class 1259 OID 18218)
-- Name: alimento_legume; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alimento_legume (
    codigoalim integer NOT NULL
);


ALTER TABLE public.alimento_legume OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 18221)
-- Name: alimento_prato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alimento_prato (
    codigopr integer DEFAULT 0 NOT NULL,
    codigoalim integer DEFAULT 0 NOT NULL,
    quantalim double precision
);


ALTER TABLE public.alimento_prato OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 18226)
-- Name: alimento_preco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alimento_preco (
    codigoalim integer,
    valoralim double precision,
    codigorefv integer
);


ALTER TABLE public.alimento_preco OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 18229)
-- Name: alimento_preco_painel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alimento_preco_painel (
    codigoalim integer NOT NULL,
    valormenor double precision,
    valormaior double precision,
    valormedio double precision,
    valormediano double precision
);


ALTER TABLE public.alimento_preco_painel OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 18232)
-- Name: alimento_verdura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alimento_verdura (
    codigoalim integer NOT NULL
);


ALTER TABLE public.alimento_verdura OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 18235)
-- Name: alimentos_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alimentos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alimentos_seq OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 18237)
-- Name: alimentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alimentos (
    codigoalim integer DEFAULT nextval('public.alimentos_seq'::regclass) NOT NULL,
    nomealim text NOT NULL,
    tipoalim character varying(100),
    energiaalim double precision,
    proteinaalim double precision,
    lipideoalim double precision,
    carboidratosalim double precision,
    fibraalim double precision,
    calcioalim double precision,
    magnesioalim double precision,
    ferroalim double precision,
    zincoalim double precision,
    sodioalim double precision,
    vitcalim double precision,
    vitaalim double precision,
    gsatalim double precision,
    acucaralim double precision,
    minprocinnature boolean,
    verdura boolean,
    legume boolean,
    fruta boolean,
    fontevitc boolean
);


ALTER TABLE public.alimentos OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 18244)
-- Name: alimentoverduralegume; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alimentoverduralegume (
    codigoalim integer
);


ALTER TABLE public.alimentoverduralegume OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 18247)
-- Name: cardapios_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cardapios_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cardapios_seq OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 18249)
-- Name: cardapios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cardapios (
    codigoc integer DEFAULT nextval('public.cardapios_seq'::regclass) NOT NULL,
    nomec character varying(50) NOT NULL,
    funcobjcusto double precision NOT NULL,
    funcobjerronut double precision NOT NULL,
    quantdias integer NOT NULL
);


ALTER TABLE public.cardapios OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 18253)
-- Name: prato_acomp_permitido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prato_acomp_permitido (
    codigopr integer DEFAULT 0 NOT NULL,
    acomp_permitido character varying(30)
);


ALTER TABLE public.prato_acomp_permitido OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 18257)
-- Name: prato_refeicao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prato_refeicao_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prato_refeicao_seq OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 18259)
-- Name: prato_refeicao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prato_refeicao (
    codigor integer DEFAULT nextval('public.prato_refeicao_seq'::regclass) NOT NULL,
    codigopr integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.prato_refeicao OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 18263)
-- Name: prato_tem_hortalica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prato_tem_hortalica (
    codigopr integer
);


ALTER TABLE public.prato_tem_hortalica OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 18266)
-- Name: prato_tem_legume; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prato_tem_legume (
    codigopr integer NOT NULL
);


ALTER TABLE public.prato_tem_legume OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 18269)
-- Name: prato_tem_verdura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prato_tem_verdura (
    codigopr integer NOT NULL
);


ALTER TABLE public.prato_tem_verdura OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 18272)
-- Name: prato_tem_verdura_legume; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prato_tem_verdura_legume (
    codigopr integer NOT NULL
);


ALTER TABLE public.prato_tem_verdura_legume OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 18275)
-- Name: prato_tem_verdura_legume_entrada; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prato_tem_verdura_legume_entrada (
    codigopr integer NOT NULL
);


ALTER TABLE public.prato_tem_verdura_legume_entrada OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 18718)
-- Name: prato_verdura_legume_lc_dn; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prato_verdura_legume_lc_dn (
    codigopr integer
);


ALTER TABLE public.prato_verdura_legume_lc_dn OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 18278)
-- Name: pratos_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pratos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pratos_seq OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 18280)
-- Name: pratos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pratos (
    codigopr integer DEFAULT nextval('public.pratos_seq'::regclass) NOT NULL,
    nomepr character varying(100) NOT NULL,
    tipopr character varying(30) DEFAULT NULL::character varying,
    consistenciapr character varying(2) DEFAULT NULL::character varying,
    corpr character varying(10) DEFAULT NULL::character varying,
    presencaferroheme boolean,
    fontevitc boolean,
    ref integer
);


ALTER TABLE public.pratos OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 18287)
-- Name: pratos_combinacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pratos_combinacao (
    codigopr integer NOT NULL,
    codigopr1 integer NOT NULL
);


ALTER TABLE public.pratos_combinacao OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 18290)
-- Name: pratos_princ_sozinhos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pratos_princ_sozinhos (
    codigopr integer NOT NULL
);


ALTER TABLE public.pratos_princ_sozinhos OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 18293)
-- Name: pratos_rejeicao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pratos_rejeicao (
    codigopr integer NOT NULL,
    codigopr1 integer
);


ALTER TABLE public.pratos_rejeicao OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 18296)
-- Name: pratosresumo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pratosresumo (
    codigopr integer,
    nomepr character varying(100),
    tipopr character varying(30),
    consistenciapr character varying(2),
    corpr character varying(10),
    presencaferroheme boolean,
    temverduralegumeentrada boolean,
    servidosozinho boolean
);


ALTER TABLE public.pratosresumo OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 18299)
-- Name: refeicao_cardapio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refeicao_cardapio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refeicao_cardapio_seq OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 18301)
-- Name: refeicao_cardapio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refeicao_cardapio (
    codigoc integer NOT NULL,
    codigor integer DEFAULT nextval('public.refeicao_cardapio_seq'::regclass) NOT NULL
);


ALTER TABLE public.refeicao_cardapio OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 18305)
-- Name: refeicoes_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refeicoes_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refeicoes_seq OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 18307)
-- Name: refeicoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refeicoes (
    codigor integer DEFAULT nextval('public.refeicoes_seq'::regclass) NOT NULL,
    nomer character varying(50) NOT NULL,
    tipor integer NOT NULL,
    valorr double precision NOT NULL,
    codigoref integer NOT NULL
);


ALTER TABLE public.refeicoes OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 18311)
-- Name: referencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.referencia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.referencia_seq OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 18313)
-- Name: referencia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.referencia (
    codigoref integer DEFAULT nextval('public.referencia_seq'::regclass) NOT NULL,
    categoriaref character varying(45) NOT NULL,
    idaderef character varying(10) NOT NULL,
    porcentagemref character varying(5) NOT NULL,
    energiaref double precision NOT NULL,
    proteinaref double precision NOT NULL,
    lipideoref double precision NOT NULL,
    carboidratoref double precision NOT NULL,
    fibraref double precision NOT NULL,
    calcioref double precision NOT NULL,
    magnesioref double precision NOT NULL,
    ferroref double precision NOT NULL,
    zincoref double precision NOT NULL,
    sodioref double precision NOT NULL,
    vitcref double precision NOT NULL,
    vitaref double precision NOT NULL,
    gsatref double precision NOT NULL
);


ALTER TABLE public.referencia OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 18317)
-- Name: referencia_prato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.referencia_prato (
    codigorefpr integer NOT NULL,
    nomerefpr text
);


ALTER TABLE public.referencia_prato OWNER TO postgres;

--
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE referencia_prato; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.referencia_prato IS 'Referências de onde os pratos foram retirados ';


--
-- TOC entry 231 (class 1259 OID 18323)
-- Name: referenciapreco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.referenciapreco (
    codigoref integer NOT NULL,
    descricao character varying(255) NOT NULL
);


ALTER TABLE public.referenciapreco OWNER TO postgres;

--
-- TOC entry 3156 (class 0 OID 18218)
-- Dependencies: 200
-- Data for Name: alimento_legume; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alimento_legume (codigoalim) FROM stdin;
144
157
71
98
134
107
69
73
138
139
162
65
66
67
137
145
147
148
110
113
117
142
127
101
143
130
89
92
126
\.


--
-- TOC entry 3157 (class 0 OID 18221)
-- Dependencies: 201
-- Data for Name: alimento_prato; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alimento_prato (codigopr, codigoalim, quantalim) FROM stdin;
1	458	150
1	492	4
1	511	3
1	599	40
2	53	50
2	264	2
3	200	45
4	19	30
4	458	110
4	459	5
4	492	8
5	458	150
5	491	6
6	8	25
7	13	25
8	182	40
9	222	60
10	7	4
10	163	40
10	458	130
10	492	5
11	35	15
11	82	1
11	110	6
11	157	20
11	158	3
11	272	8
11	458	25
11	463	5
11	489	14
11	513	0.5
11	516	0.6
11	602	5
11	611	10
12	35	25
12	89	11
12	212	10
12	272	4
12	489	11
12	492	10
12	513	0.5
13	35	27
13	272	7
13	489	10
13	492	10
13	513	0.7
14	35	27
14	182	21
14	264	2
14	458	13
14	489	10
14	492	13
14	513	0.7
14	600	0.3
15	4	25
15	458	110
15	459	13
15	492	7
15	600	0.3
16	7	5
16	182	50
16	212	80
16	222	50
16	226	40
16	459	10
16	601	70
17	44	6
17	53	50
17	82	1
17	158	3
17	272	1.5
17	516	0.3
17	603	0.3
17	611	20
18	264	2
18	458	180
18	491	10
18	492	5
19	82	1
19	92	55
19	144	20
19	157	25
19	272	5
19	279	25
19	516	0.5
19	602	3
19	603	0.4
20	7	4
20	182	30
20	226	20
20	458	130
20	492	4
21	458	110
21	492	13
21	604	30
22	43	34
22	82	1
22	87	15
22	162	20
22	272	2
22	372	28
22	516	0.5
22	602	3
22	603	0.3
23	43	37
23	82	1
23	158	3
23	272	2
23	327	22
23	516	0.5
23	602	3
23	603	0.3
24	43	15
24	82	1.5
24	115	10
24	272	3
24	516	0.9
24	602	3
25	42	5
25	44	35
25	67	30
25	82	1
25	115	12
25	272	2
25	516	0.5
25	602	3
26	40	15
26	65	20
26	82	1.5
26	115	20
26	272	4
26	516	0.8
26	562	30
26	602	3
27	82	2
27	110	20
27	149	20
27	272	3.5
27	372	30
27	516	0.9
27	602	5
27	603	0.2
27	604	40
28	82	1
28	121	10
28	272	2
28	329	15
28	489	10
28	516	0.5
28	562	20
29	43	20
29	182	30
29	264	3
29	458	180
29	492	7
29	600	0.3
30	28	15
30	44	45
30	67	60
30	264	1
30	458	150
30	492	5
30	600	0.3
31	82	2
4	590	10
15	590	10
31	115	10
31	121	27
12	626	6
13	625	30
17	618	5
17	625	17
23	626	20
23	618	10
23	629	8
31	272	2
31	329	12
31	421	5
31	489	3
31	516	0.6
31	562	27
31	602	5
32	40	22
32	82	1.5
32	92	25
32	110	25
32	149	15
32	272	3
32	327	17
32	516	0.9
32	602	3
32	610	18
33	40	30
33	82	1.5
33	92	25
33	110	15
33	149	15
33	272	3
33	327	25
33	516	0.9
33	602	4
33	603	0.3
34	82	2
34	126	100
34	272	3
34	409	32
34	516	0.9
34	602	3
34	603	0.4
35	82	1
35	115	30
35	130	35
35	272	2
35	372	30
35	516	0.9
35	602	5
35	603	0.3
36	35	15
36	82	1
36	157	15
36	158	4
36	162	5
36	272	7
36	409	25
36	458	25
36	462	4
36	489	10
36	513	0.7
36	516	0.8
36	602	5
37	82	1.5
37	92	65
37	110	35
37	272	3
37	409	30
37	516	0.8
37	602	3
38	43	15
38	82	1
38	115	10
38	272	2
38	372	25
38	516	0.5
38	602	3
40	42	5
40	44	35
40	67	30
40	82	1
40	115	12
40	272	2
40	409	18
40	516	0.5
40	602	3
41	82	2
41	113	20
41	121	12
41	158	2
41	272	3
41	421	10
41	489	6
41	516	0.6
41	562	20
41	602	6
41	603	0.2
41	604	25
42	4	38
42	82	2
42	110	20
42	121	7
42	272	3
42	329	25
42	516	0.9
42	562	7
42	602	3
42	603	0.1
43	4	38
43	82	2
43	110	20
43	121	7
43	272	3
43	409	25
43	516	0.9
43	562	12
43	602	3
43	603	0.1
44	4	38
44	82	2
44	110	20
44	162	30
44	272	3
44	409	20
44	489	10
44	516	0.7
45	4	35
45	82	1
45	272	2
45	516	0.5
46	4	35
46	82	2
46	98	15
46	110	15
46	272	4
46	516	0.7
46	602	3
47	4	35
47	82	1.5
47	110	25
47	182	20
47	272	4
47	327	18
47	516	0.9
47	603	0.2
48	4	40
48	82	1.5
48	101	20
48	272	3.5
48	409	18
48	516	0.8
48	602	4
49	82	1
49	272	2
49	421	5
49	433	15
49	516	0.5
49	568	20
49	602	8
50	79	20
50	157	15
51	214	60
52	65	30
52	82	2
52	113	20
37	42	8
52	121	25
52	149	20
52	272	3
52	329	30
52	516	0.8
52	562	25
52	602	4
53	33	50
53	82	2
53	149	15
53	272	2
53	436	15
53	516	0.8
53	576	15
53	602	5
53	603	0.2
54	226	40
55	4	40
55	82	1.5
55	156	8
55	272	3
55	409	20
55	462	2
55	516	0.5
55	602	4
56	110	20
57	4	40
57	82	1
57	115	30
57	241	4
57	272	2
57	516	0.5
57	602	10
58	35	12
58	82	1
58	158	3
58	272	3
58	489	3
58	516	0.5
58	602	5
58	607	12
59	82	1
59	92	15
59	272	2
59	327	25
59	516	0.5
59	602	3
60	33	20
60	82	1
60	110	20
60	272	1
60	321	30
60	516	0.5
60	602	3
61	35	2
61	82	1
61	158	3
61	264	2
61	272	3
61	409	30
61	458	50
61	516	1
61	603	0.2
62	33	45
62	82	2
62	115	20
62	272	3
62	329	22
62	489	15
62	516	0.8
62	602	10
63	4	40
63	82	1.5
63	115	25
63	157	20
63	272	4
63	329	25
63	516	0.9
63	562	13
63	603	0.1
64	82	1
64	272	1
64	516	1
64	562	20
65	82	1
65	272	1
65	516	1
65	562	20
66	74	15
66	110	15
67	35	15
67	82	1
67	149	15
67	157	10
67	158	5
67	272	7
67	327	30
67	458	25
67	463	3
67	489	10
67	513	0.7
67	516	0.8
67	602	3
68	35	2
68	40	47
68	82	2
68	101	15
68	110	20
68	264	2
68	272	3
68	409	25
68	458	50
68	516	1.3
68	602	5
69	4	46
69	65	48
69	82	2
69	157	20
69	272	2
69	385	24
69	516	0.5
69	602	8
70	182	25
70	492	2
70	600	0.2
71	65	75
71	82	1
71	157	20
71	158	3
71	272	3
71	327	30
71	516	0.5
71	602	5
71	603	0.2
72	235	55
73	82	1
73	114	2
73	157	20
73	175	30
73	272	3
73	409	20
73	516	0.5
73	602	3
73	603	0.2
74	4	34
74	82	1
74	119	15
74	272	2
74	516	0.5
75	82	1
75	92	55
75	264	2
75	272	3
75	409	32
75	458	15
75	516	0.5
75	603	0.3
76	35	2
76	44	17
76	53	50
76	82	1.5
76	110	30
76	157	20
76	264	2
76	277	28
76	458	50
76	516	0.5
76	602	4
77	53	50
77	79	5
77	82	1
57	618	12
58	618	10
53	618	10
77	98	15
77	158	2
77	272	4
77	409	35
77	516	0.6
77	602	4
78	53	50
78	79	15
78	157	20
78	462	30
78	605	0.2
79	82	1
79	92	55
79	264	2
79	272	3
79	458	15
79	516	0.5
79	603	0.3
80	79	20
81	82	1
81	147	25
81	272	4
81	327	18
81	516	0.5
82	82	1
82	126	25
82	272	3
82	327	22
82	516	0.5
82	598	15
82	602	7
83	67	75
83	82	1
83	157	20
83	158	3
83	272	3
83	516	0.5
83	602	5
83	603	0.2
84	458	80
84	492	6
85	189	42
86	92	40
86	110	15
86	516	0.5
87	82	1
87	126	80
87	264	1
87	272	2
87	329	22
87	458	15
87	463	4
87	516	0.5
87	602	8
88	74	15
89	130	25
89	272	2
89	516	0.5
90	84	20
90	516	0.5
91	82	1
91	149	20
91	272	2
91	516	0.5
91	602	4
92	82	1
92	272	2
92	489	25
92	516	0.5
94	4	35
94	82	1
94	272	2
94	516	0.5
94	578	20
95	4	38
95	82	1.5
95	101	20
95	272	3
95	421	12
95	516	0.5
96	4	35
96	82	1.5
96	149	20
96	272	3
96	489	25
96	516	0.8
96	602	4
97	4	38
97	82	1
97	110	20
97	162	30
97	272	1.5
97	489	10
97	516	0.5
98	4	35
98	82	1
98	110	15
98	272	2
98	516	0.5
98	602	3
100	98	20
101	53	50
101	82	1
101	272	4
101	489	35
101	516	0.5
101	605	0.2
102	44	8
102	53	50
102	82	1
102	98	20
102	158	2
102	272	3
102	327	30
102	516	0.3
102	602	5
102	603	0.3
103	82	1
103	114	2
103	157	20
103	175	30
103	272	3
103	516	0.5
103	602	3
103	603	0.2
103	609	20
104	4	40
104	65	20
104	82	1.5
104	113	20
104	158	3
104	272	3.5
104	329	15
104	516	0.5
104	603	0.2
105	40	41
105	82	1.5
105	158	6
105	272	3
105	327	27
105	463	4
105	516	0.5
105	602	5
105	603	0.3
106	40	40
106	82	1.5
106	110	20
106	150	20
106	272	4
106	409	25
106	516	0.5
106	518	2
102	618	5
102	619	20
103	618	15
104	618	8
105	618	15
105	619	15
106	618	20
106	620	15
101	625	15
105	626	20
87	625	15
107	40	50
107	82	1.5
107	272	3
107	321	30
107	516	0.5
107	602	4
107	603	0.3
108	40	45
108	82	2
108	158	3
108	272	3
108	409	16
108	516	0.5
108	603	3
109	4	26
109	82	2
109	121	25
109	182	15
109	272	1.5
109	329	20
109	516	0.9
109	602	10
109	603	0.2
110	82	1.5
110	103	0.2
110	110	15
110	115	20
110	121	40
110	272	4
110	489	5
110	516	0.8
110	602	3
110	608	15
111	4	40
111	82	1.5
111	115	30
111	241	4
111	272	3
111	329	30
111	516	0.9
111	602	10
112	4	40
112	82	1
112	156	8
112	272	1
112	462	2
112	516	0.5
113	4	35
113	82	1
113	272	4
113	421	20
113	516	0.5
113	578	20
114	4	40
114	82	1
114	101	20
114	272	2
114	516	0.5
114	602	4
115	4	35
115	82	2
115	110	25
115	272	4
115	327	18
115	516	0.9
115	603	0.2
116	42	10
116	458	200
116	492	10
117	163	80
118	607	30
119	462	50
120	40	30
120	82	1
120	110	10
120	113	10
120	126	10
120	272	2
120	409	25
120	516	1
120	599	200
121	182	25
121	222	25
121	226	25
121	458	200
122	458	60
123	74	20
123	79	20
125	451	200
126	40	30
126	82	1
126	87	10
126	98	10
126	117	10
126	272	2
126	327	25
126	516	1
126	599	200
129	515	10
129	599	45
130	110	10
130	121	15
130	272	2
130	516	1
131	92	40
131	272	1
131	516	1
132	36	20
132	458	200
133	515	10
133	599	45
134	7	30
134	458	200
134	492	10
135	13	30
135	468	4
136	8	30
136	468	4
138	115	20
139	110	30
139	162	30
139	516	1
140	82	1
140	92	15
140	158	10
140	272	1
140	516	1
141	117	35
141	262	6
141	463	10
141	468	10
141	516	1
141	599	100
142	87	20
142	101	20
142	262	5
142	516	1
143	14	40
143	458	15
122	616	10
140	609	40
143	489	20
144	7	15
144	182	25
144	458	200
145	142	20
145	157	20
146	7	15
146	182	25
146	222	25
146	226	25
146	458	200
147	42	10
147	458	200
147	491	10
148	182	25
148	222	25
148	458	200
149	13	30
149	262	5
150	238	150
151	82	1
151	272	4
151	372	40
151	516	1
152	82	1
131	623	1
107	618	15
107	619	15
108	618	10
126	618	2
140	620	5
140	619	5
151	618	2
107	626	20
108	626	20
108	628	15
152	110	10
152	127	2
152	272	4
152	327	40
152	516	1
153	158	10
153	272	2
153	399	100
153	414	100
153	516	1
154	89	20
154	272	4
154	399	100
154	414	100
154	516	1
155	101	10
155	110	10
155	272	4
155	329	40
155	516	1
156	82	1
156	158	10
156	272	3
156	516	1
157	82	1
157	89	20
157	158	10
157	272	2
157	516	1
158	272	4
158	409	40
158	516	1
159	272	4
159	409	40
159	516	1
160	4	30
160	44	10
160	82	1
160	110	10
160	272	3
160	409	30
160	516	1
161	82	1
161	272	4
161	433	30
161	516	1
162	101	20
162	272	4
162	433	30
162	516	1
163	40	30
163	42	15
163	82	1
163	101	30
163	262	5
163	272	3
163	409	40
163	458	100
163	516	1
163	599	90
164	40	30
164	82	1
164	158	10
164	272	3
164	409	40
164	516	1
164	599	90
165	272	2
165	329	40
165	516	1
166	65	40
166	272	1
166	516	1
167	4	30
167	44	10
167	82	1
167	110	10
167	162	10
167	272	2
167	516	1
167	599	80
168	89	30
168	272	1
168	516	1
169	458	60
169	613	10
170	113	30
170	272	1
170	516	1
171	35	2
171	44	20
171	82	1
171	262	10
171	458	50
171	516	1
172	110	10
172	121	15
172	127	5
172	272	2
172	516	1
173	40	20
173	44	10
173	82	1
173	101	10
173	110	10
173	158	10
173	272	4
173	516	1
174	126	60
174	262	5
174	458	10
174	516	1
175	65	60
175	262	5
175	458	20
175	516	1
176	74	20
176	111	20
177	74	20
177	157	20
178	79	20
178	142	20
178	157	20
156	609	40
179	74	20
179	98	20
180	98	20
180	149	20
181	101	20
182	110	20
182	157	20
183	111	20
183	157	20
184	110	20
184	111	20
185	115	20
185	157	20
186	113	20
186	117	20
187	458	60
187	612	10
188	149	20
189	149	20
189	157	20
190	142	20
190	149	20
190	157	20
191	35	20
191	44	10
191	110	10
191	272	2
191	327	20
191	458	10
191	463	10
191	489	5
156	618	1
156	623	1
156	624	1
157	618	1
157	623	1
157	624	1
160	618	2
160	623	1
153	618	1
154	618	1
155	618	5
191	513	1
191	516	1
192	35	20
192	44	10
192	71	10
192	110	10
192	272	2
192	458	10
192	468	10
192	489	5
192	513	1
192	516	1
193	35	20
193	44	10
193	157	10
193	162	10
193	272	2
193	458	10
193	468	10
193	489	5
193	513	1
193	516	1
194	35	20
194	44	10
194	71	10
194	157	10
194	272	2
194	458	10
194	468	10
194	489	5
194	513	1
194	516	1
195	35	20
195	44	10
195	71	10
195	110	10
195	272	2
195	409	20
195	458	10
195	463	10
195	468	10
195	489	5
195	513	1
195	516	1
196	35	20
196	44	10
196	71	10
196	110	10
196	272	2
196	409	20
196	458	10
196	463	10
196	489	5
196	513	1
196	516	1
197	14	40
197	458	15
197	489	20
198	14	40
198	458	15
198	489	20
199	35	20
199	43	10
199	272	10
199	458	10
199	462	10
199	489	25
199	492	10
199	513	1
200	4	30
200	82	1
200	110	10
200	272	2
200	409	25
200	516	1
200	599	200
201	43	20
201	82	1
201	272	2
201	327	25
201	516	1
202	40	30
202	71	10
202	82	1
202	110	10
202	126	10
202	272	2
202	327	25
202	516	1
202	599	200
203	35	3
203	82	0.3
203	158	4
203	272	1.5
203	327	40
203	516	0.3
203	602	0.2
204	4	30
204	82	0.4
204	115	15
204	158	3
204	272	3
204	329	40
204	516	0.6
205	115	30
205	272	0.7
205	516	0.05
206	149	35
206	272	0.7
206	516	0.1
207	82	0.3
207	110	15
207	158	3
207	272	1.5
207	327	30
207	489	10
207	516	0.2
207	560	6
207	602	0.3
208	82	0.25
208	158	3
208	272	1.5
208	409	40
208	516	0.2
208	602	0.2
209	98	15
209	121	10
209	272	1
209	516	0.04
210	82	0.25
210	130	50
210	158	3
210	272	1.5
210	409	40
210	458	6
210	516	0.3
210	602	0.2
211	82	0.3
211	147	6
211	158	6
211	272	1.5
211	399	45
211	414	45
211	516	0.3
211	602	0.3
212	92	15
212	110	15
212	162	10
212	272	0.7
212	516	0.06
212	602	0.25
213	4	30
213	82	0.3
213	158	3
213	272	3.5
213	409	30
213	516	0.6
213	602	0.4
204	618	3
205	618	0.7
206	618	0.7
207	618	2
207	620	1.5
208	618	3
208	620	1
209	618	0.7
210	618	2
213	625	15
213	627	9
214	149	25
214	272	0.7
214	516	0.006
215	92	45
215	272	0.8
215	516	0.05
215	602	0.2
216	82	0.25
216	158	3
216	162	20
216	272	1.5
216	409	40
216	516	0.3
216	602	0.2
217	110	30
217	272	0.8
217	516	0.005
217	602	0.2
218	272	0.8
218	516	0.2
218	564	10
218	602	0.1
219	121	10
219	182	15
219	272	1
219	516	0.04
220	92	35
220	272	0.7
220	516	0.06
220	605	0.01
221	4	30
221	82	0.08
221	162	18
221	272	1.5
221	516	0.5
222	92	20
222	162	18
222	516	0.02
222	602	0.3
223	4	30
223	82	0.2
223	110	15
223	114	0.25
223	158	3
223	272	3
223	302	45
223	516	0.6
223	560	2
223	602	0.2
224	162	15
224	272	1
224	489	60
224	516	0.2
224	602	0.3
225	489	60
225	516	0.15
226	92	45
226	158	1.5
226	272	1
226	516	0.1
227	110	15
227	162	8
227	272	1
227	489	60
227	516	0.2
227	602	0.3
229	40	7
229	67	30
229	82	0.2
229	126	20
229	149	20
229	272	5
229	372	30
229	516	1
229	568	20
230	40	7
230	67	20
230	82	0.2
230	92	20
230	149	20
230	272	5
230	372	30
230	516	1
230	562	20
231	52	25
231	468	8
232	52	25
232	264	2.5
235	44	100
235	516	0.5
237	164	80
137	212	150
234	599	150
234	164	50
208	44	3
214	44	1.5
216	44	2.5
236	251	200
223	618	3
223	620	1
224	618	2
226	618	2
226	620	1
226	619	2
227	618	2
46	327	15
21	590	10
18	42	10
40	458	25
109	489	11
110	603	0.2
123	615	3
138	615	3
145	615	1
176	615	3
177	615	3
178	615	3
179	615	3
180	615	3
181	615	3
182	615	3
183	615	3
184	615	3
185	615	3
186	615	3
188	615	3
189	615	3
190	615	3
157	609	30
173	599	80
208	615	0.7
210	615	0.7
211	615	0.7
212	615	0.7
213	615	0.7
214	615	0.7
216	615	0.7
220	615	0.7
226	615	0.7
128	607	25
128	575	25
128	121	50
128	110	12
128	98	10
128	115	20
128	157	10
128	272	2
128	516	0.5
127	4	10
127	272	4
127	35	6
127	489	4.5
127	513	0.3
127	516	0.25
127	101	7.2
127	110	11
127	602	0.8
127	409	20
127	149	20
127	157	15
127	458	24
124	458	12.5
124	35	12.5
124	489	13.5
124	409	70
124	4	40
124	272	1.6
124	157	20
124	110	12
124	516	0.5
124	513	1
39	89	48
39	458	24
39	489	9
39	35	24
39	264	4.5
39	513	1
39	158	30
39	599	48
39	218	37.8
39	82	0.6
39	272	1.5
39	516	0.75
39	605	1
39	44	60
39	110	60
39	609	20
39	464	7.6
228	82	0.3
228	272	1.5
228	355	45
228	516	0.2
228	602	0.2
93	82	1
93	272	1
93	516	1
93	568	20
99	82	1
99	272	1
99	516	1
99	568	20
39	623	5
39	624	5
140	618	1
140	623	1
140	624	1
152	618	1
152	623	1
152	624	1
160	624	2
11	618	6
19	618	8
22	618	10
24	618	5
25	618	5
26	618	10
27	618	10
28	618	10
31	618	10
32	618	5
33	618	10
34	618	15
35	618	12
36	618	5
37	618	10
38	618	5
39	618	14
39	619	12
40	618	5
41	618	10
42	618	10
43	618	10
44	618	15
46	618	10
46	620	10
46	619	5
47	618	10
48	618	10
48	620	5
49	618	18
52	618	10
55	618	8
55	620	3
59	618	10
59	620	5
59	619	5
60	618	15
60	620	10
61	618	15.5
62	618	15
63	618	15
67	618	5
68	618	0.5
68	620	10
69	618	10
71	618	10
73	618	15
75	618	10
76	618	10.5
77	618	8
79	618	10
81	618	8
81	620	5
81	619	12
82	618	8
83	618	10
87	618	12
87	619	15
91	618	13
91	620	10
95	618	10
95	620	12
95	619	10
96	618	13
96	620	10
96	619	10
97	618	15
98	618	10
98	620	10
98	619	5
101	619	10
109	618	15
110	618	10
111	618	12
115	618	10
120	618	2
124	618	7
124	623	10
127	618	3.5
128	618	6
156	619	5
158	618	1
159	618	1
161	618	5
162	618	1
163	618	1
164	618	2
165	618	5
166	618	2
167	618	2
168	618	2
170	618	2
171	618	5
173	618	2
191	618	1
192	618	2
193	618	2
194	618	2
195	618	1
196	618	1
200	618	2
201	618	2
202	618	2
203	618	2.5
203	620	1.5
210	620	1
211	618	3
211	620	1
213	618	3
213	620	1
215	618	0.5
216	618	3
216	620	1
228	618	2.5
228	620	1.5
17	619	10
217	618	0.05
218	619	3
219	618	0.7
221	618	1.5
229	618	1
230	618	4.5
\.


--
-- TOC entry 3158 (class 0 OID 18226)
-- Dependencies: 202
-- Data for Name: alimento_preco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alimento_preco (codigoalim, valoralim, codigorefv) FROM stdin;
182	0.0034	2
214	0.0025	2
225	0.004	2
226	0.004	2
163	0.006	2
164	0.0059	2
165	0.0059	2
232	0.005	2
238	0.006	2
71	0.0039	2
73	0.0039	2
77	0.0086	2
78	0.0086	2
79	0.0086	2
80	0.0086	2
92	0.0037	2
101	0.0118	2
110	0.0035	2
113	0.0035	2
115	0.0075	2
126	0.005	2
149	0.003	2
150	0.003	2
157	0.0048	2
489	0.0328	2
\.


--
-- TOC entry 3159 (class 0 OID 18229)
-- Dependencies: 203
-- Data for Name: alimento_preco_painel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alimento_preco_painel (codigoalim, valormenor, valormaior, valormedio, valormediano) FROM stdin;
4	0.004	0.0266	0.0124	0.0076
7	0.0117	0.0117	0.0117	0.0117
8	0.0085	0.0252	0.0178	0.0191
13	0.011	0.011	0.011	0.011
14	0.0182	0.0182	0.0182	0.0182
19	0.0056	0.0074	0.0064	0.0064
22	0.0043	0.0115	0.0071	0.0055
31	0.0024	0.0065	0.0049	0.0053
33	0.0035	0.005	0.0044	0.0047
35	0.0025	0.0037	0.0031	0.0032
36	0.0045	0.0045	0.0045	0.0045
40	0.0028	0.005	0.0044	0.0049
42	0.0052	0.0072	0.0062	0.0063
43	0.0056	0.0056	0.0056	0.0056
44	0.0011	0.0056	0.0038	0.0038
52	0.0089	0.0124	0.0106	0.0106
53	0.0124	0.0124	0.0124	0.0124
65	0.0023	0.0023	0.0023	0.0023
67	0.0019	0.0023	0.0021	0.0021
71	0.0022	0.0027	0.0025	0.0025
74	0.0044	0.0044	0.0044	0.0044
79	0.0058	0.0058	0.0058	0.0058
82	0.0228	0.023	0.0229	0.0229
84	0.0045	0.0045	0.0045	0.0045
87	0.0045	0.0088	0.0066	0.0066
89	0.0028	0.005	0.0038	0.0038
92	0.0025	0.0043	0.0031	0.0028
98	0.002	0.0039	0.003	0.003
99	0.0233	0.0252	0.0243	0.0243
101	0.003	0.003	0.003	0.003
110	0.0023	0.0031	0.0027	0.0027
111	0.005	0.005	0.005	0.005
113	0.002	0.0032	0.0024	0.002
114	0.0398	0.0398	0.0398	0.0398
115	0.0065	0.0065	0.0065	0.0065
117	0.0044	0.0044	0.0044	0.0044
119	0.003	0.003	0.003	0.003
121	0.0029	0.005	0.0042	0.0045
126	0.0029	0.0032	0.0031	0.0031
127	0.0013	0.0056	0.0038	0.0041
130	0.0028	0.0049	0.0036	0.0031
142	0.0018	0.0031	0.0025	0.0025
144	0.0024	0.0055	0.0044	0.0049
147	0.0042	0.0042	0.0042	0.0042
149	0.0013	0.0028	0.0021	0.0021
150	0.0016	0.0016	0.0016	0.0016
156	0.032	0.032	0.032	0.032
157	0.0028	0.0056	0.0038	0.003
158	0.0056	0.0061	0.0058	0.0058
162	0.0077	0.0077	0.0077	0.0077
163	0.0045	0.0065	0.0055	0.0055
164	0.0038	0.0077	0.0057	0.0057
175	0.0025	0.008	0.0043	0.0034
182	0.0029	0.005	0.0044	0.005
189	0.006	0.0065	0.0062	0.0062
200	0.0043	0.0043	0.0043	0.0043
212	0.0021	0.0049	0.0037	0.0036
214	0.0025	0.0045	0.0033	0.0033
222	0.0045	0.0103	0.0069	0.006
226	0.0045	0.0045	0.0045	0.0045
229	0.0045	0.0046	0.0045	0.0045
235	0.0018	0.0029	0.0023	0.0023
236	0.0049	0.0049	0.0049	0.0049
241	0.006	0.0222	0.0166	0.019
251	0.0043	0.0043	0.0043	0.0043
259	0.0438	0.0438	0.0438	0.0438
262	0.0398	0.04	0.0398	0.0398
263	0.0088	0.0104	0.0096	0.0096
264	0.0088	0.0104	0.0096	0.0096
272	0.0073	0.0118	0.0094	0.0094
277	0.054	0.054	0.054	0.054
279	0.0923	0.0923	0.0923	0.0923
302	0.028	0.028	0.028	0.028
327	0.0225	0.0225	0.0225	0.0225
329	0.026	0.026	0.026	0.026
355	0.015	0.0209	0.0177	0.0173
372	0.025	0.025	0.025	0.025
399	0.0076	0.011	0.0092	0.0091
409	0.0073	0.012	0.0091	0.008
414	0.0076	0.011	0.0092	0.0091
421	0.0098	0.017	0.0136	0.0142
433	0.0164	0.0215	0.019	0.019
436	0.0149	0.0149	0.0149	0.0149
448	0.0126	0.0129	0.0126	0.0126
450	0.0126	0.0129	0.0126	0.0126
451	0.0126	0.0129	0.0126	0.0126
452	0.0126	0.0129	0.0126	0.0126
458	0.0035	0.0035	0.0035	0.0035
459	0.0214	0.0267	0.024	0.0246
462	0.0217	0.0327	0.0264	0.0257
463	0.027	0.0384	0.0327	0.0327
464	0.0633	0.0633	0.0633	0.0633
468	0.0276	0.0276	0.0276	0.0276
491	0.0129	0.0129	0.0129	0.0129
492	0.0006	0.003	0.0023	0.0026
511	0.0121	0.0148	0.0134	0.0134
513	0.0159	0.0159	0.0159	0.0159
515	0.0106	0.0106	0.0106	0.0106
516	0.0009	0.0016	0.0012	0.0012
518	0.004	0.0057	0.0048	0.0048
523	0.0129	0.013	0.0129	0.0129
551	0.0084	0.0084	0.0084	0.0084
560	0.009	0.009	0.009	0.009
562	0.0055	0.0067	0.006	0.0058
564	0.0063	0.0077	0.0069	0.0066
568	0.0062	0.0076	0.0069	0.0069
575	0.0112	0.0112	0.0112	0.0112
576	0.0135	0.0135	0.0135	0.0135
578	0.0128	0.0128	0.0128	0.0128
590	0.0032	0.0032	0.0032	0.0032
45	0.0075	0.011	0.011	0.011
103	0.0018	0	0	0
218	0.0014	0	0	0
238	0.00188	0	0	0
385	0.0176	0	0	0
510	0.007	0	0	0
321	0.0035	0.2	0.0287	0.011
319	0.0356	0.0356	0.0356	0.0356
598	0.0042	0.0065	0.0054	0.0054
599	0.0014	0.0022	0.0018	0.0017
600	0.03	0.03	0.03	0.03
601	0.0126	0.0129	0.0126	0.0126
602	0.005	0.005	0.005	0.005
603	0.0049	0.0049	0.0049	0.0049
604	0.0032	0.0038	0.0035	0.0035
605	0.022	0.0455	0.0305	0.024
606	0.0126	0.0129	0.0126	0.0126
607	0.011	0.0119	0.0115	0.0115
608	0.0095	0.0095	0.0095	0.0095
609	0.0268	0.0361	0.0299	0.0268
610	0.0085	0.0085	0.0085	0.0085
611	0.0043	0.0138	0.009	0.009
612	0.0073	0.0073	0.0073	0.0073
613	0.0073	0.0073	0.0073	0.0073
615	0.002	0.002	0.002	0.002
616	0.0073	0.0073	0.0073	0.0073
618	0.0032	0.0039	0.0035	0.0033
619	0.0028	0.0056	0.0038	0.003
620	0.0024	0.0055	0.0044	0.0049
623	0.01	0.029	0.0209	0.0232
624	0.0116	0.0127	0.0122	0.0122
625	0.0023	0.0031	0.0027	0.0027
626	0.002	0.0039	0.003	0.003
627	0.0077	0.0077	0.0077	0.0077
628	0.0022	0.0027	0.0025	0.0025
629	0.0065	0.0065	0.0065	0.0065
489	0.0072	0.0072	0.0072	0.0072
28	0.0026	0	0	0
\.


--
-- TOC entry 3160 (class 0 OID 18232)
-- Dependencies: 204
-- Data for Name: alimento_verdura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alimento_verdura (codigoalim) FROM stdin;
75
77
78
79
80
83
84
85
108
111
115
119
135
149
150
152
153
156
74
\.


--
-- TOC entry 3162 (class 0 OID 18237)
-- Dependencies: 206
-- Data for Name: alimentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alimentos (codigoalim, nomealim, tipoalim, energiaalim, proteinaalim, lipideoalim, carboidratosalim, fibraalim, calcioalim, magnesioalim, ferroalim, zincoalim, sodioalim, vitcalim, vitaalim, gsatalim, acucaralim, minprocinnature, verdura, legume, fruta, fontevitc) FROM stdin;
164	Abacaxi, cru	Frutas e Derivados	0.4832	0.0086	0.0012	0.1233	0.0099	0.2243	0.1844	0.0026	0.0014	0	0.3462	0	0	0	t	f	f	t	t
169	Acerola, crua	Frutas e Derivados	0.3346	0.0091	0.0021	0.0797	0.0151	0.1255	0.1313	0.0022	0.0015	0	9.4137	3.705	0	0	t	f	f	t	t
170	Acerola, polpa, congelada	Frutas e Derivados	0.2194	0.0059	0	0.0554	0.007	0.0759	0.0866	0.0017	0.0007	0.0128	6.2324	2.88	0	0	t	f	f	t	t
100	Brócolis, cozido	Verduras, Hortaliças e Derivados	0.2464	0.0213	0.0046	0.0437	0.0342	0.5075	0.1455	0.0054	0.0024	0.0212	0.42	0	0.001	0	f	f	f	f	t
187	Caju, polpa, congelada	Frutas e Derivados	0.3657	0.0048	0.0015	0.0935	0.0081	0.0084	0.0707	0.0015	0.0008	0.0416	1.1972	0.33	0	0	t	f	f	t	t
197	Goiaba, branca, com casca, crua	Frutas e Derivados	0.5174	0.009	0.0049	0.124	0.0633	0.0501	0.0704	0.0017	0.0016	0	0.9919	0	0.0006	0	t	f	f	t	t
200	Goiaba, vermelha, com casca, crua	Frutas e Derivados	0.5417	0.0109	0.0044	0.1301	0.0622	0.0445	0.0689	0.0017	0.0013	0	0.806	0.57	0.0005	0	t	f	f	t	t
207	Kiwi, cru	Frutas e Derivados	0.5114	0.0134	0.0063	0.115	0.0265	0.2391	0.1058	0.0025	0.0007	0	0.7078	0.0812	0.0006	0	t	f	f	t	t
208	Laranja, baía, crua	Frutas e Derivados	0.4544	0.0098	0.001	0.1147	0.0112	0.3541	0.0922	0.0014	0.0006	0	0.5687	0.0581	0	0	t	f	f	t	t
209	Laranja, baía, suco	Frutas e Derivados	0.3665	0.0065	0	0.087	0	0.0593	0.078	0.0006	0	0	0.9448	0.06	0	0	t	f	f	t	t
210	Laranja, da terra, crua	Frutas e Derivados	0.5147	0.0108	0.0019	0.1286	0.0398	0.5108	0.1406	0.0015	0.0022	0.0083	0.3468	0	0	0	t	f	f	t	t
211	Laranja, da terra, suco	Frutas e Derivados	0.4096	0.0067	0.0014	0.0957	0.0103	0.1339	0.1011	0.0009	0.0007	0	0.4432	0.0669	0	0	t	f	f	t	t
212	Laranja, lima, crua	Frutas e Derivados	0.457	0.0106	0.0008	0.1153	0.0178	0.3147	0.1016	0.0012	0.0012	0.0111	0.4346	0	0	0	t	f	f	t	t
213	Laranja, lima, suco	Frutas e Derivados	0.3934	0.0071	0.0012	0.0917	0.0042	0.0774	0.1089	0	0.0003	0	0.413	0	0	0	t	f	f	t	t
214	Laranja, pêra, crua	Frutas e Derivados	0.3677	0.0104	0.0013	0.0895	0.0077	0.2189	0.0861	0.0009	0.0006	0	0.5373	0.0138	0	0	t	f	f	t	t
215	Laranja, pêra, suco	Frutas e Derivados	0.3271	0.0074	0.0007	0.0755	0	0.0737	0.0759	0	0	0	0.7334	0.0181	0	0	t	f	f	t	t
218	Limão, cravo, suco	Frutas e Derivados	0.141	0.0033	0	0.0525	0	0.1018	0.0886	0.0008	0	0	0.3278	0.4712	0	0	t	f	f	t	t
219	Limão, galego, suco	Frutas e Derivados	0.2223	0.0057	0.0007	0.0732	0	0.0526	0.0592	0.0005	0.0005	0	0.345	0	0	0	t	f	f	t	t
220	Limão, tahiti, cru	Frutas e Derivados	0.3182	0.0094	0.0014	0.1108	0.0118	0.5098	0.097	0.0018	0.0021	0.0125	0.3824	0	0	0	t	f	f	t	t
225	Mamão, Formosa, cru	Frutas e Derivados	0.4534	0.0082	0.0012	0.1155	0.0181	0.2487	0.1732	0.0023	0.0007	0.0326	0.7853	2.22	0	0	t	f	f	t	t
226	Mamão, Papaia, cru	Frutas e Derivados	0.4016	0.0046	0.0012	0.1044	0.0104	0.2242	0.2218	0.0019	0.0007	0.0163	0.8221	1.77	0	0	t	f	f	t	t
229	Manga, Palmer, crua	Frutas e Derivados	0.7249	0.0041	0.0017	0.1935	0.0163	0.1164	0.0873	0.0009	0.0009	0.0186	0.6552	11.8038	0	0	t	f	f	t	t
239	Morango, cru	Frutas e Derivados	0.3015	0.0089	0.0031	0.0682	0.0172	0.109	0.0967	0.0032	0.0018	0	0.636	0	0	0	t	f	f	t	t
144	Pimentão, verde, cru	Verduras, Hortaliças e Derivados	0.2129	0.0105	0.0015	0.0489	0.0256	0.0876	0.0779	0.0041	0.0014	0	1.0021	0.69	0	0	t	f	t	f	f
150	Repolho, roxo, cru	Verduras, Hortaliças e Derivados	0.3091	0.0191	0.0006	0.072	0.0197	0.4367	0.1802	0.0052	0.0025	0.0234	0.432	0	0	0	t	t	f	f	t
151	Repolho, roxo, refogado	Verduras, Hortaliças e Derivados	0.4177	0.018	0.0124	0.0756	0.0175	0.4259	0.1725	0.0047	0.0026	0.0342	0.4052	0	0.0019	0	f	f	f	f	t
251	Tangerina, Poncã, crua	Frutas e Derivados	0.3783	0.0085	0.0007	0.0961	0.0094	0.1289	0.0773	0.0011	0	0	0.4882	0.7106	0	0	t	f	f	t	t
252	Tangerina, Poncã, suco	Frutas e Derivados	0.3611	0.0052	0	0.088	0	0.0428	0.0646	0	0	0	0.4175	0.7675	0	0	t	f	f	t	t
157	Tomate, com semente, cru	Verduras, Hortaliças e Derivados	0.1534	0.011	0.0017	0.0314	0.0117	0.0694	0.1054	0.0024	0.0014	0.0102	0.2121	0.81	0	0	t	f	t	f	t
597	Noz, crua	Nozes e Sementes	6.2006	0.1397	0.5936	0.1836	0.0725	1.0531	1.5289	0.0204	0.0206	0.0457	0	0	0.056	0	f	f	f	f	f
216	Laranja, valência, crua	Frutas e Derivados	0.4611	0.0077	0.0016	0.1172	0.0173	0.3374	0.144	0.0009	0.0011	0.0063	0.4785	0	0	0	t	f	f	t	t
167	Açaí, polpa, com xarope de guaraná e glucose	Frutas e Derivados	1.103	0.0072	0.0366	0.2146	0.0172	0.2216	0.1273	0.0027	0.0019	0.151	0.1027	0	0.007	0	f	f	f	t	f
224	 Mamão, doce em calda, drenado	Frutas e Derivados	1.9563	0.0019	0.0007	0.54	0.0131	0.2001	0.0581	0.0011	0.0007	0.0291	0.039	0	0	0	f	f	f	t	f
227	 Mamão verde, doce em calda, drenado	Frutas e Derivados	2.0938	0.0032	0.001	0.5764	0.0123	0.1244	0.0454	0.0015	0.0002	0.0474	0	0	0	0	f	f	f	t	f
217	Laranja, valência, suco	Frutas e Derivados	0.362	0.0048	0.0012	0.0855	0.0042	0.0908	0.0959	0	0	0	0	0.03	0	0	t	f	f	t	f
234	Maracujá, suco concentrado, envasado	Frutas e Derivados	0.4197	0.0077	0.0019	0.0964	0.0035	0.0416	0.0416	0.0035	0.0014	0.2169	0.1368	0	0	0	f	f	f	t	f
245	Pêssego, enlatado, em calda	Frutas e Derivados	0.6314	0.0071	0	0.1688	0.0102	0.041	0.0404	0.006	0.0009	0.032	0	0.7131	0	0	f	f	f	t	f
258	Uva, suco concentrado, envasado	Frutas e Derivados	0.5766	0	0	0.1471	0.0023	0.0932	0.0706	0.0012	0.0005	0.0958	0.2097	0	0	0	f	f	f	t	f
244	Pêssego, Aurora, cru	Frutas e Derivados	0.3633	0.0083	0	0.0932	0.0142	0.0323	0.0444	0.0022	0.0006	0	0.0325	0	0	0	t	f	f	t	f
173	Ameixa, em calda, enlatada, drenada 	Frutas e Derivados	1.7736	0.0103	0.0028	0.4766	0.0455	0.3924	0.1449	0.027	0.002	0.0279	0.0515	0	0.001	0	f	f	f	t	f
171	Ameixa, calda, enlatada 	Frutas e Derivados	1.8285	0.0041	0	0.4689	0.0052	0.1315	0.0996	0.0215	0.0014	0.027	0.0427	0	0	0	f	f	f	t	f
176	Banana, doce em barra	Frutas e Derivados	2.8011	0.0217	0.0005	0.7567	0.0383	0.1195	0.4919	0.0061	0.003	0.0988	0	0.4103	0	0	f	f	f	t	f
179	Banana, nanica, crua	Frutas e Derivados	0.9153	0.014	0.0012	0.2385	0.0195	0.0342	0.278	0.0035	0.0018	0	0.0586	0.2044	0	0	f	f	f	t	f
198	Goiaba, doce em pasta	Frutas e Derivados	2.6896	0.0058	0	0.7412	0.0373	0.1006	0.0649	0.004	0.0009	0.037	0.2306	2.0463	0	0	f	f	f	t	f
199	Goiaba, doce, cascão	Frutas e Derivados	2.8559	0.0041	0.001	0.787	0.0437	0.147	0.0967	0.004	0.0014	0.1103	0.3433	0.755	0	0	f	f	f	t	f
617	Goiaba, suco concentrado	Frutas e Derivados	0.58	0	0	0.118	0.054	0	0	0	0	0	0	0	0	0	f	f	f	t	f
195	Figo, enlatado, em calda	Frutas e Derivados	1.8436	0.0056	0.0015	0.5034	0.0198	0.3262	0.0685	0.005	0.0009	0.0687	0.0524	0	0	0	f	f	f	t	f
177	Banana, figo, crua	Frutas e Derivados	1.0508	0.0113	0.0014	0.278	0.028	0.0636	0.3016	0.002	0.0012	0	0.175	0	0	0	t	f	f	t	f
235	Melancia, crua	Frutas e Derivados	0.3261	0.0088	0	0.0814	0.0012	0.0772	0.0963	0.0023	0.001	0	0.0615	0.915	0	0	t	f	f	t	f
236	Melão, cru	Frutas e Derivados	0.2937	0.0068	0	0.0753	0.0025	0.0286	0.0595	0.0023	0.0009	0.1117	0.0868	0.03	0	0	t	f	f	t	f
230	Manga, polpa, congelada	Frutas e Derivados	0.4831	0.0038	0.0023	0.1252	0.0107	0.0712	0.0949	0.0009	0.0007	0.0673	0.249	0	0.001	0	t	f	f	t	f
238	Mexerica, Rio, crua	Frutas e Derivados	0.3687	0.0065	0.0013	0.0934	0.0273	0.1718	0.0821	0.0009	0.0015	0.0182	1.1197	0	0	0	t	f	f	t	f
182	Banana, prata, crua	Frutas e Derivados	0.9825	0.0127	0.0007	0.2596	0.0204	0.0756	0.2629	0.0038	0.0015	0	0.2159	0.4862	0	0	t	f	f	t	f
189	Caqui, chocolate, cru	Frutas e Derivados	0.7135	0.0036	0.0007	0.1933	0.0652	0.1785	0.0855	0.001	0.0019	0.0218	0.2961	0	0	0	t	f	f	t	f
163	Abacate, cru	Frutas e Derivados	0.9615	0.0124	0.084	0.0603	0.0631	0.0792	0.1468	0.0021	0.0022	0	0.0866	0	0.023	0	t	f	f	t	f
172	Ameixa, crua	Frutas e Derivados	0.5254	0.0077	0	0.1385	0.0243	0.0572	0.0548	0.001	0.0005	0	0.0763	0.4081	0	0	t	f	f	t	f
174	Atemóia, crua	Frutas e Derivados	0.9697	0.0097	0.003	0.2533	0.0214	0.2277	0.2484	0.0016	0.0019	0.0078	0.1015	0	0.001	0	t	f	f	t	f
175	Banana, da terra, crua	Frutas e Derivados	1.2802	0.0143	0.0024	0.3367	0.0153	0.0415	0.2379	0.0029	0.0016	0	0.1575	3.5825	0	0	t	f	f	t	f
180	Banana, ouro, crua	Frutas e Derivados	1.1237	0.0148	0.0021	0.2934	0.0195	0.0319	0.2838	0.0034	0.0026	0	0.0756	0.7456	0	0	t	f	f	t	f
181	Banana, pacova, crua	Frutas e Derivados	0.7791	0.0123	0.0008	0.2031	0.0203	0.0549	0.3041	0.0037	0.0014	0.0094	0	0	0	0	t	f	f	t	f
183	Cacau, cru	Frutas e Derivados	0.7429	0.0095	0.0014	0.1941	0.0219	0.121	0.2462	0.0026	0.0059	0.007	0.1356	0	0	0	t	f	f	t	f
184	Cajá-Manga, cru	Frutas e Derivados	0.4558	0.0128	0	0.1143	0.0258	0.1274	0.1128	0.0015	0.0018	0.0144	0.267	0	0	0	t	f	f	t	f
190	Carambola, crua	Frutas e Derivados	0.4574	0.0087	0.0018	0.1148	0.0203	0.0479	0.0736	0.002	0.0024	0.0409	0.6087	0	0	0	t	f	f	t	f
191	Ciriguela, crua	Frutas e Derivados	0.7559	0.014	0.0036	0.1886	0.039	0.2741	0.1796	0.0036	0.0053	0.0168	0.2703	0	0.002	0	t	f	f	t	f
192	Cupuaçu, cru	Frutas e Derivados	0.4942	0.0116	0.0095	0.1043	0.0312	0.1312	0.1817	0.0049	0.0034	0.032	0.2451	0	0.004	0	t	f	f	t	f
193	Cupuaçu, polpa, congelada	Frutas e Derivados	0.488	0.0084	0.0059	0.1139	0.0159	0.0549	0.1391	0.0026	0.0015	0.0069	0.1049	0	0.003	0	t	f	f	t	f
205	Jambo, cru	Frutas e Derivados	0.2691	0.0089	0.0007	0.0649	0.0507	0.138	0.1418	0.0014	0.0011	0.2166	0.0377	0	0	0	t	f	f	t	f
206	Jamelão, cru	Frutas e Derivados	0.4101	0.0055	0.0011	0.1063	0.0178	0.0309	0.0216	0.0005	0.0005	0.0137	0.2707	0.1128	0	0	t	f	f	t	f
186	Caju, cru	Frutas e Derivados	0.4307	0.0097	0.0033	0.1029	0.0168	0.0142	0.1011	0.0015	0.0009	0.0297	2.1933	0.0733	0	0	t	f	f	t	t
221	Maçã, Argentina, com casca, crua	Frutas e Derivados	0.6253	0.0023	0.0025	0.1659	0.0203	0.0339	0.0486	0.0005	0	0.0132	0.0149	0	0.001	0	t	f	f	t	f
223	Macaúba, crua	Frutas e Derivados	4.0428	0.0208	0.4066	0.1395	0.1344	0.6653	0.6605	0.0081	0.0066	0.0065	0.1344	15.3	0.071	0	t	f	f	t	f
228	Manga, Haden, crua	Frutas e Derivados	0.635	0.0041	0.0026	0.1666	0.0158	0.1166	0.0782	0.001	0.0007	0.0055	0.1741	2.43	0.001	0	t	f	f	t	f
246	Pinha, crua	Frutas e Derivados	0.8847	0.0149	0.0032	0.2245	0.0336	0.2088	0.3054	0.0021	0.0024	0.0134	0.359	0	0.001	0	t	f	f	t	f
247	Pitanga, crua	Frutas e Derivados	0.4142	0.0093	0.0017	0.1024	0.0324	0.1788	0.1223	0.004	0.0035	0.017	0.2487	2.31	0	0	t	f	f	t	f
248	Pitanga, polpa, congelada	Frutas e Derivados	0.1911	0.0029	0.0012	0.0476	0.0074	0.078	0.062	0.0037	0.0009	0.0503	0	2.1831	0	0	t	f	f	t	f
249	Romã, crua	Frutas e Derivados	0.5574	0.004	0	0.1511	0.0044	0.0475	0.127	0.0026	0.0067	0.0059	0.0812	0	0	0	t	f	f	t	f
250	Tamarindo, cru	Frutas e Derivados	2.757	0.0321	0.0046	0.7253	0.0645	0.371	0.5911	0.0055	0.0067	0.0036	0.0725	0	0.001	0	t	f	f	t	f
253	Tucumã, cru	Frutas e Derivados	2.6202	0.0209	0.1908	0.2647	0.1265	0.4634	1.2101	0.0057	0.0087	0.0389	0.1799	35.4396	0.0469	0	t	f	f	t	f
254	Umbu, cru	Frutas e Derivados	0.3702	0.0084	0	0.094	0.0198	0.1156	0.1135	0.0009	0.0042	0	0.2406	0	0	0	t	f	f	t	f
255	Umbu, polpa, congelada	Frutas e Derivados	0.3394	0.0051	0.0007	0.0879	0.0134	0.1071	0.0812	0.0021	0.0007	0.0577	0.0395	0	0	0	t	f	f	t	f
256	Uva, Itália, crua	Frutas e Derivados	0.5287	0.0075	0.002	0.1357	0.0092	0.0666	0.0498	0.0014	0	0	0.0329	0.08	0	0	t	f	f	t	f
257	Uva, Rubi, crua	Frutas e Derivados	0.4906	0.0061	0.0016	0.127	0.0093	0.0762	0.0583	0.0017	0	0.0792	0.0186	0	0	0	t	f	f	t	f
168	Açaí, polpa, congelada	Frutas e Derivados	0.5805	0.008	0.0394	0.0621	0.0255	0.3518	0.1704	0.0043	0.0027	0.0518	0	0	0.0073	0	t	f	f	t	f
178	Banana, maçã, crua	Frutas e Derivados	0.8681	0.0175	0.0006	0.2234	0.0259	0.0322	0.2369	0.002	0.0012	0	0.1047	0.0962	0	0	t	f	f	t	f
196	Fruta-pão, crua	Frutas e Derivados	0.6705	0.0108	0.0019	0.1717	0.0555	0.3368	0.2403	0.0023	0.0013	0.008	0.0987	0	0.001	0	t	f	f	t	f
194	Figo, cru	Frutas e Derivados	0.4145	0.0097	0.0016	0.1025	0.0179	0.2739	0.1131	0.002	0.0009	0	0.0079	0	0	0	t	f	f	t	f
201	Graviola, crua	Frutas e Derivados	0.6162	0.0085	0.0021	0.1584	0.0191	0.4012	0.235	0.0017	0.0013	0.0416	0.1914	0	0	0	t	f	f	t	f
202	Graviola, polpa, congelada	Frutas e Derivados	0.3827	0.0057	0.0014	0.0978	0.0119	0.0598	0.0976	0.001	0.0005	0.0305	0.1048	0	0	0	t	f	f	t	f
203	Jabuticaba, crua	Frutas e Derivados	0.5805	0.0061	0.0013	0.1526	0.023	0.0835	0.1778	0.0009	0.0028	0	0.1617	0	0	0	t	f	f	t	f
204	Jaca, crua	Frutas e Derivados	0.8792	0.014	0.0027	0.225	0.0239	0.1125	0.4005	0.0038	0.0017	0.018	0.1482	0	0.001	0	t	f	f	t	f
231	Manga, Tommy Atkins, crua	Frutas e Derivados	0.5069	0.0086	0.0022	0.1277	0.0207	0.0764	0.074	0.0008	0.0008	0	0.0794	1.77	0.001	0	t	f	f	t	f
232	Maracujá, cru	Frutas e Derivados	0.6844	0.0199	0.021	0.1226	0.0114	0.0539	0.2797	0.0056	0.0039	0.0158	0.1984	1.71	0.0022	0	t	f	f	t	f
233	Maracujá, polpa, congelada	Frutas e Derivados	0.3876	0.0081	0.0018	0.096	0.0051	0.0461	0.097	0.0029	0.0019	0.081	0.0726	0	0	0	t	f	f	t	f
240	Nêspera, crua	Frutas e Derivados	0.4254	0.0031	0	0.1153	0.0296	0.1969	0.0972	0.0015	0.0012	0	0.0316	2.55	0	0	t	f	f	t	f
241	Pequi, cru	Frutas e Derivados	2.0497	0.0234	0.1797	0.1297	0.1904	0.3244	0.2977	0.0027	0.0096	0	0.0828	0.9	0	0	t	f	f	t	f
242	Pêra, Park, crua	Frutas e Derivados	0.6059	0.0024	0.0023	0.1607	0.0298	0.0871	0.0612	0.0032	0.0007	0.0098	0.0236	0	0.001	0	t	f	f	t	f
243	Pêra, Williams, crua	Frutas e Derivados	0.5331	0.0057	0.0011	0.1402	0.0301	0.0828	0.0578	0.0009	0.0008	0	0.0283	0	0	0	t	f	f	t	f
237	Mexerica, Murcote, crua	Frutas e Derivados	0.5759	0.0088	0.0013	0.1486	0.0307	0.3307	0.123	0.0007	0.001	0.0117	0.218	0	0	0	t	f	f	t	f
153	Salsa, crua	Verduras, Hortaliças e Derivados	0.3342	0.0326	0.0061	0.0571	0.0185	1.7941	0.209	0.0318	0.0132	0.023	0.5169	26.1487	0.0008	0	f	t	f	f	f
77	Alface, americana, crua	Verduras, Hortaliças e Derivados	0.0879	0.0061	0.0013	0.0175	0.0102	0.1444	0.0574	0.0027	0.0023	0.0731	0.1096	0	0	0	t	t	f	f	f
78	Alface, crespa, crua	Verduras, Hortaliças e Derivados	0.1068	0.0135	0.0016	0.017	0.0183	0.3798	0.1097	0.004	0.0025	0.0338	0.1558	3.51	0	0	t	t	f	f	f
79	Alface, lisa, crua	Verduras, Hortaliças e Derivados	0.1382	0.0169	0.0012	0.0243	0.0233	0.2751	0.0911	0.0061	0.0035	0.0423	0.2139	5.52	0	0	t	t	f	f	f
80	Alface, roxa, crua	Verduras, Hortaliças e Derivados	0.1272	0.0091	0.0019	0.0249	0.0201	0.3383	0.0931	0.0248	0.0023	0.0712	0.1347	4.6863	0	0	t	t	f	f	f
83	Alho-poró, cru	Verduras, Hortaliças e Derivados	0.3151	0.0141	0.0014	0.0688	0.0251	0.3362	0.1069	0.0064	0.0024	0.0176	0.1415	0.2425	0	0	t	t	f	f	f
84	Almeirão, cru	Verduras, Hortaliças e Derivados	0.1803	0.0177	0.0022	0.0334	0.0259	0.195	0.2111	0.0074	0.0029	0.0235	0.0169	8.49	0	0	t	t	f	f	f
108	Cebolinha, crua	Verduras, Hortaliças e Derivados	0.1952	0.0187	0.0035	0.0337	0.0355	0.7985	0.2459	0.0065	0.003	0.016	0.3178	2.0162	0	0	t	t	f	f	f
111	Chicória, crua	Verduras, Hortaliças e Derivados	0.1384	0.0114	0.0014	0.0285	0.022	0.4483	0.1414	0.0045	0.0009	0.1352	0.0654	0	0	0	t	t	f	f	f
115	Couve, manteiga, crua	Verduras, Hortaliças e Derivados	0.2706	0.0287	0.0055	0.0433	0.0312	1.3087	0.3466	0.0045	0.004	0.0617	0.9668	7.44	0.0012	0	t	t	f	f	f
119	Espinafre, Nova Zelândia, cru	Verduras, Hortaliças e Derivados	0.161	0.02	0.0024	0.0257	0.021	0.9751	0.8164	0.0036	0.0027	0.1709	0.0242	7.26	0	0	t	t	f	f	f
149	Repolho, branco, cru	Verduras, Hortaliças e Derivados	0.1712	0.0088	0.0014	0.0386	0.0189	0.3455	0.0851	0.0015	0.0015	0.0364	0.1872	0.09	0	0	t	t	f	f	f
152	Rúcula, crua	Verduras, Hortaliças e Derivados	0.1313	0.0177	0.0011	0.0222	0.0174	1.1656	0.1779	0.0094	0.0023	0.0942	0.4629	7.9912	0	0	t	t	f	f	f
71	Abobrinha, italiana, crua	Verduras, Hortaliças e Derivados	0.1928	0.0114	0.0014	0.0429	0.0135	0.1513	0.1995	0.0024	0.0017	0	0.0687	0.6075	0	0	t	f	t	f	f
98	Beterraba, crua	Verduras, Hortaliças e Derivados	0.4883	0.0195	0.0009	0.1111	0.0337	0.1811	0.2443	0.0032	0.0052	0.0972	0.0312	0	0	0	t	f	t	f	f
134	Maxixe, cru	Verduras, Hortaliças e Derivados	0.1375	0.0139	0.0007	0.0273	0.0219	0.2087	0.0961	0.0035	0.0018	0.1099	0.0963	0.0825	0	0	t	f	t	f	f
625	Cenoura, crua	Tempero	0.3414	0.0132	0.0017	0.0766	0.0318	0.2254	0.1123	0.0018	0.0022	0.0333	0.0512	19.89	0	0	t	f	f	f	f
626	Beterraba, crua	Tempero	0.4883	0.0195	0.0009	0.1111	0.0337	0.1811	0.2443	0.0032	0.0052	0.0972	0.0312	0	0	0	t	f	f	\N	f
627	Vagem, crua	Tempero	0.249	0.0179	0.0017	0.0535	0.0238	0.411	0.1783	0.0043	0.0033	0	0.0115	0.4812	0	0	t	f	f	\N	f
629	Couve, manteiga, crua	Tempero	0.2706	0.0287	0.0055	0.0433	0.0312	1.3087	0.3466	0.0045	0.004	0.0617	0.9668	7.44	0.0012	0	t	f	f	f	f
510	Rapadura	Produtos Açucarados	3.5196	0.0099	0.0007	0.9079	0	0.3049	0.4718	0.0444	0.0056	0.2171	0	0	0	0	f	f	f	f	f
628	Abobrinha, italiana, crua	Tempero	0.1928	0.0114	0.0014	0.0429	0.0135	0.1513	0.1995	0.0024	0.0017	0	0.0687	0.6075	0	0	t	f	f	\N	f
600	Canela em pó	Miscelânias	2.61	0.04	0.03	0.8	0.54	0	0	0	0	0	0	0	0	0	f	f	f	f	f
445	Toucinho, frito	Carnes e Derivados	6.9656	0.2728	0.6431	0	0	0.0944	0.0946	0.0087	0.0084	1.2485	0	0	0.2	0	f	f	f	f	f
307	Pescada, filé, cru	Pescados e Frutos do mar	1.0721	0.1665	0.04	0	0	0.1355	0.228	0.0017	0.0025	0.775	0	1.4358	0.009	0	t	f	f	f	f
165	Abacaxi, polpa, congelada	Frutas e Derivados	0.3059	0.0047	0.0011	0.078	0.0033	0.1354	0.1007	0.0036	0.0006	0.0124	0.0125	0.0338	0	0	t	f	f	t	f
166	Abiu, cru	Frutas e Derivados	0.6242	0.0083	0.007	0.1493	0.017	0.0578	0.093	0.0016	0.001	0	0.1028	0	0.003	0	t	f	f	t	f
222	Maçã, Fuji, com casca, crua	Frutas e Derivados	0.5552	0.0029	0	0.1515	0.0135	0.0192	0.0204	0.0009	0	0	0.0241	0.0525	0	0	t	f	f	t	f
107	Cebola, crua	Verduras, Hortaliças e Derivados	0.3942	0.0171	0.0008	0.0885	0.0219	0.14	0.1192	0.002	0.0017	0.006	0.0467	0	0	0	t	f	t	f	f
310	Pescadinha, crua	Pescados e Frutos do mar	0.7641	0.1548	0.0114	0	0	3.316	0.3378	0.0055	0.0055	1.2034	0	0	0.003	0	t	f	f	f	f
312	Pintado, cru	Pescados e Frutos do mar	0.9108	0.1856	0.0131	0	0	0.12	0.237	0.0022	0.0039	0.4334	0	0	0.006	0	t	f	f	f	f
314	Porquinho, cru	Pescados e Frutos do mar	0.9302	0.2049	0.0061	0	0	0.2588	0.2435	0.0039	0.0066	0.6673	0	0.1396	0.004	0	t	f	f	f	f
518	Shoyu	Miscelânias	0.6093	0.0331	0.0033	0.1165	0	0.1453	0.2363	0.005	0.0019	50.2421	0	0	0	0	f	f	f	f	f
185	Cajá, polpa, congelada	Frutas e Derivados	0.2633	0.0059	0.0017	0.0637	0.0136	0.0916	0.0717	0.0032	0.0005	0.0694	0	1.59	0	0	f	f	f	t	f
49	Pão, de soja	Cereais e Derivados	3.0873	0.1134	0.0358	0.5651	0.0571	0.9024	0.4832	0.0333	0.0146	6.6254	0	0	0.007	0	f	f	f	f	f
50	Pão, glúten, forma	Cereais e Derivados	2.5299	0.1195	0.0273	0.4412	0.0248	1.5572	0.2424	0.0571	0.0128	0.2205	0	0	0.005	0	f	f	f	f	f
476	Chá, mate, infusão 5%	Bebidas (álcoolicas e não álcoolicas)	0.0273	0	0.0005	0.0064	0	0.0064	0.0204	0	0	0	0	0	0	0	f	f	f	f	f
492	Açúcar, cristal	Produtos Açucarados	3.8685	0.0032	0	0.9961	0	0.0759	0.0101	0.0016	0	0	0	0	0	0	f	f	f	f	f
493	Açúcar, mascavo	Produtos Açucarados	3.6855	0.0076	0.0009	0.9445	0	1.2653	0.7995	0.083	0.0048	0.252	0	0	0	0	f	f	f	f	f
494	Açúcar, refinado	Produtos Açucarados	3.8657	0.0032	0	0.9954	0	0.035	0.0055	0.0011	0	0.1216	0	0	0	0	f	f	f	f	f
188	Caju, suco concentrado, envasado	Frutas e Derivados	0.4511	0.004	0.002	0.1073	0.0063	0.0098	0.0845	0.0015	0.0007	0.4504	1.387	0.15	0	0	f	f	f	t	t
505	Maria mole, coco queimado	Produtos Açucarados	3.0663	0.0393	0.0009	0.7506	0.0064	0.1946	0.0599	0.0047	0.0009	0.1429	0	0	0	0	f	f	f	f	f
506	Marmelada	Produtos Açucarados	2.5724	0.004	0.0014	0.7076	0.0407	0.1132	0.058	0.0073	0.0008	0.1088	0	0	0	0	f	f	f	f	f
618	Cebola, crua	Tempero	0.3942	0.0171	0.0008	0.0885	0.0219	0.14	0.1192	0.002	0.0017	0.006	0.0467	0	0	0	t	f	f	f	f
21	Cereais, milho, flocos, com sal	Cereais e Derivados	3.696	0.0729	0.016	0.8084	0.0529	0.0181	0.201	0.0052	0.0061	2.7174	0	0	0.005	0	f	f	f	f	f
22	Cereais, milho, flocos, sem sal	Cereais e Derivados	3.6334	0.0688	0.0118	0.8045	0.0184	0.0197	0.1655	0.0169	0.0033	0.3097	0	0	0.003	0	f	f	f	f	f
23	Cereais, mingau, milho, infantil	Cereais e Derivados	3.9443	0.0643	0.0109	0.8727	0.0321	2.1881	0.1603	0.0303	0.0036	3.994	1.0937	0.2142	0.003	0	f	f	f	f	f
24	Cereais, mistura para vitamina, trigo, cevada e aveia	Cereais e Derivados	3.8113	0.089	0.0212	0.8162	0.0498	5.8425	0.7227	0.1264	0.0202	11.6326	0.1311	0	0.005	0	f	f	f	f	f
25	Cereal matinal, milho	Cereais e Derivados	3.6535	0.0716	0.0096	0.8382	0.0412	1.4292	0.1093	0.0305	0.0763	6.5454	0.1729	0.4638	0.0036	0	f	f	f	f	f
496	Chocolate, ao leite, com castanha do Pará	Produtos Açucarados	5.5888	0.0741	0.3419	0.5538	0.0246	1.7123	0.7957	0.0147	0.013	0.6405	0.0142	0.3615	0.141	0.5	f	f	f	f	f
507	Mel, de abelha	Produtos Açucarados	3.0924	0	0	0.8403	0	0.102	0.0551	0.0025	0.0017	0.0604	0.0074	0	0	0	f	f	f	f	f
508	Melado	Produtos Açucarados	2.9651	0	0	0.7662	0	1.0206	1.1514	0.0539	0.0027	0.0401	0	0	0	0	f	f	f	f	f
509	Quindim	Produtos Açucarados	4.1135	0.0474	0.2443	0.463	0.0322	0.3718	0.149	0.0138	0.0111	0.2737	0	0.7598	0.1133	0	f	f	f	f	f
14	Bolo, mistura para	Cereais e Derivados	4.1863	0.0616	0.0613	0.8471	0.017	0.5888	0.2792	0.0121	0.0058	4.6288	0	0	0.0209	0	f	f	f	f	f
15	Bolo, pronto, aipim	Cereais e Derivados	3.2385	0.0442	0.1275	0.4786	0.0069	0.8502	0.1034	0.0049	0.0042	1.1101	0	0	0.05	0	f	f	f	f	f
16	Bolo, pronto, chocolate	Cereais e Derivados	4.1001	0.0622	0.1847	0.5472	0.0143	0.7458	0.2769	0.0213	0.0071	2.833	0	0	0.055	0	f	f	f	f	f
18	Bolo, pronto, milho	Cereais e Derivados	3.1139	0.048	0.1242	0.4511	0.0071	0.8258	0.1025	0.0065	0.0044	1.3381	0	0.5689	0.045	0	f	f	f	f	f
19	Canjica, branca, crua	Cereais e Derivados	3.576	0.072	0.0097	0.7806	0.055	0.0196	0.1233	0.0032	0.0036	0.0079	0	0	0.003	0	f	f	f	f	f
9	Biscoito, doce, recheado com chocolate	Cereais e Derivados	4.7182	0.064	0.1958	0.7055	0.0296	0.2723	0.4798	0.0227	0.0099	2.392	0.0353	0	0.062	0.32	f	f	f	f	f
10	Biscoito, doce, recheado com morango	Cereais e Derivados	4.7117	0.0572	0.1957	0.7101	0.0153	0.3578	0.271	0.0148	0.0073	2.2982	0	0	0.061	0.3295	f	f	f	f	f
11	Biscoito, doce, wafer, recheado de chocolate	Cereais e Derivados	5.0246	0.0556	0.2467	0.6754	0.018	0.2334	0.4785	0.0244	0.0087	1.3724	0	0	0.065	0.3155	f	f	f	f	f
499	Cocada branca	Produtos Açucarados	4.4885	0.0112	0.1359	0.8138	0.0357	0.0706	0.1741	0.0124	0.0041	0.2899	0	0	0.084	0	f	f	f	f	f
12	Biscoito, doce, wafer, recheado de morango	Cereais e Derivados	5.1345	0.0452	0.264	0.6735	0.0082	0.1371	0.1854	0.0109	0.0051	1.199	0	0	0.067	0.429	f	f	f	f	f
13	Biscoito, salgado, cream cracker	Cereais e Derivados	4.3173	0.1006	0.1444	0.6873	0.0251	0.2	0.3975	0.022	0.0114	8.5436	0	0	0.044	0.008	f	f	f	f	f
17	Bolo, pronto, coco	Cereais e Derivados	3.3344	0.0567	0.113	0.5228	0.0106	0.5711	0.1625	0.0085	0.0068	1.9034	0	0	0.049	0.27	f	f	f	f	f
274	Abadejo, filé, congelado,cozido	Pescados e Frutos do mar	0.911	0.1935	0.0094	0	0	0.1673	0.1574	0.0033	0.0044	1.8934	0	0	0.0038	0	f	f	f	f	f
276	Abadejo, filé, congelado, grelhado	Pescados e Frutos do mar	1.2964	0.2761	0.013	0	0	0.2017	0.2211	0.0033	0.0044	3.0509	0	0.1706	0.0055	0	f	f	f	f	f
277	Atum, conserva em óleo	Pescados e Frutos do mar	1.6591	0.2619	0.06	0	0	0.0652	0.2948	0.0123	0.0059	3.6215	0	0	0.01	0	f	f	f	f	f
284	Camarão, Rio Grande, grande, cozido	Pescados e Frutos do mar	0.9001	0.1897	0.01	0	0	0.8974	0.1891	0.0128	0.0124	3.6655	0	0	0.004	0	f	f	f	f	f
26	Cereal matinal, milho, açúcar	Cereais e Derivados	3.7656	0.0474	0.0067	0.8884	0.0211	0.5642	0.0794	0.039	0.0848	4.0531	0.1455	0.4638	0.0023	0.325	f	f	f	f	f
286	Camarão, Sete Barbas, sem cabeça, com casca, frito	Pescados e Frutos do mar	2.3125	0.1839	0.1562	0.0288	0	9.597	0.7397	0.0244	0.011	0.9906	0	0	0.0247	0	f	f	f	f	f
287	Caranguejo, cozido	Pescados e Frutos do mar	0.8272	0.1848	0.0042	0	0	3.5715	0.5223	0.0286	0.0565	3.6011	0	0	0.002	0	f	f	f	f	f
154	Seleta de legumes, enlatada	Verduras, Hortaliças e Derivados	0.5653	0.0342	0.0035	0.1267	0.0309	0.1616	0.1561	0.0106	0.0053	3.9814	0	3.6625	0.0012	0	f	f	f	f	f
158	Tomate, extrato	Verduras, Hortaliças e Derivados	0.6093	0.0243	0.0019	0.1496	0.028	0.2908	0.2933	0.0209	0.0037	4.9793	0.1801	2.49	0	0	f	f	f	f	f
159	Tomate, molho industrializado	Verduras, Hortaliças e Derivados	0.3845	0.0138	0.009	0.0771	0.0312	0.1173	0.1679	0.0158	0.0013	4.1828	0.0271	1.14	0.001	0	f	f	f	f	f
160	Tomate, purê	Verduras, Hortaliças e Derivados	0.2794	0.0136	0	0.0689	0.0103	0.1324	0.1544	0.0125	0.0033	1.0393	0.0538	1.35	0	0	f	f	f	f	f
161	Tomate, salada	Verduras, Hortaliças e Derivados	0.2055	0.0081	0	0.0512	0.0227	0.0695	0.095	0.0029	0.0017	0.0524	0.128	0	0	0	f	f	f	f	f
368	Carne, bovina, maminha, grelhada	Carnes e Derivados	1.5309	0.3074	0.0242	0	0	0.0417	0.2089	0.0243	0.0558	0.5812	0	0	0.097	0	f	f	f	f	f
370	Carne, bovina, miolo de alcatra, sem gordura, grelhado	Carnes e Derivados	2.4136	0.3193	0.1164	0	0	0.0451	0.2597	0.0317	0.0482	0.5162	0	0	0.051	0	f	f	f	f	f
371	Carne, bovina, músculo, sem gordura, cozido	Carnes e Derivados	1.938	0.3123	0.067	0	0	0.0498	0.1342	0.0236	0.0644	0.6179	0	0.0572	0.029	0	f	f	f	f	f
554	Vatapá	Alimentos Preparados	2.5489	0.06	0.2323	0.0975	0.017	0.4682	0.3932	0.0144	0.0085	8.7985	0	0	0.075	0	f	f	f	f	f
555	Virado à paulista	Alimentos Preparados	3.0695	0.1018	0.2559	0.1411	0.0216	0.4071	0.2181	0.0105	0.0104	3.4553	0	0.1017	0.0828	0	f	f	f	f	f
567	Feijão, preto, cozido	Leguminosas e Derivados	0.7703	0.0448	0.0054	0.1401	0.084	0.29	0.4037	0.0147	0.0072	0.0185	0	0	0.001	0	f	f	f	f	f
577	Lentilha, cozida	Leguminosas e Derivados	0.9264	0.0631	0.0052	0.163	0.0786	0.161	0.2165	0.0148	0.0113	0.0118	0	0	0.001	0	f	f	f	f	f
579	Paçoca, amendoim	Leguminosas e Derivados	4.8693	0.16	0.2608	0.5238	0.0732	0.2248	1.0067	0.0113	0.0156	1.6684	0	0	0.041	0	f	f	f	f	f
580	Pé-de-moleque, amendoim	Leguminosas e Derivados	5.0319	0.1316	0.2805	0.5473	0.0339	0.2711	1.079	0.0126	0.0143	0.1635	0	0	0.0508	0	f	f	f	f	f
583	Soja, extrato solúvel, pó	Leguminosas e Derivados	4.589	0.3569	0.2618	0.2848	0.0731	3.5904	2.1562	0.0701	0.0584	0.8347	0.0921	0	0.033	0	f	f	f	f	f
586	Tremoço, em conserva	Leguminosas e Derivados	1.2064	0.1111	0.0378	0.1239	0.1444	0.1554	0.0352	0.0034	0.0064	18.0876	0	0	0.004	0	f	f	f	f	f
335	Carne, bovina, capa de contra-filé, com gordura, grelhada	Carnes e Derivados	3.117	0.3069	0.2003	0	0	0.0726	0.1838	0.0259	0.062	0.8051	0	0	0.088	0	f	f	f	f	f
337	Carne, bovina, capa de contra-filé, sem gordura, grelhada	Carnes e Derivados	2.3944	0.3506	0.0995	0.0001	0	0.0884	0.2561	0.0284	0.0764	0.8275	0	0	0.043	0	f	f	f	f	f
338	Carne, bovina, charque, cozido	Carnes e Derivados	2.6278	0.3636	0.1192	0	0	0.1485	0.1281	0.0345	0.0609	14.427	0	0	0.048	0	f	f	f	f	f
340	Carne, bovina, contra-filé, à milanesa	Carnes e Derivados	3.5159	0.2061	0.24	0.1217	0.0037	0.1467	0.2704	0.029	0.0286	0.7709	0	0.1508	0.0724	0	f	f	f	f	f
342	Carne, bovina, contra-filé de costela, grelhado	Carnes e Derivados	2.7491	0.2988	0.1633	0	0	0.0429	0.2357	0.0279	0.0668	0.5088	0	0	0.088	0	f	f	f	f	f
347	Carne, bovina, costela, assada	Carnes e Derivados	3.7304	0.2881	0.2772	0	0	0.2801	0.1955	0.0218	0.0545	0.9186	0	0	0.118	0	f	f	f	f	f
388	Croquete, de carne, frito	Carnes e Derivados	3.4674	0.1686	0.2267	0.1815	0	0.1809	0.2952	0.0231	0.033	9.1641	0	0	0.0508	0	f	f	f	f	f
36	Farinha, láctea, de cereais	Cereais e Derivados	4.1485	0.1188	0.0579	0.7777	0.0194	1.9606	0.5769	0.0872	0.0173	1.2507	0.2431	4.9225	0.033	0	f	f	f	f	f
37	Lasanha, massa fresca, cozida	Cereais e Derivados	1.6376	0.0581	0.0116	0.3252	0.0164	0.0997	0.0354	0.0119	0.0041	2.0677	0	0	0.006	0	f	f	f	f	f
38	Lasanha, massa fresca, crua	Cereais e Derivados	2.2031	0.0701	0.0134	0.4506	0.0161	0.1655	0.1259	0.0187	0.0076	6.6671	0	0	0.005	0	f	f	f	f	f
39	Macarrão, instantâneo	Cereais e Derivados	4.3586	0.0879	0.1724	0.6243	0.0561	0.1763	0.1937	0.008	0.005	15.1553	0	0	0	0	f	f	f	f	f
595	Pinhão, cozido	Nozes e Sementes	1.7437	0.0298	0.0075	0.4392	0.156	0.1577	0.5297	0.0076	0.0083	0.0086	0.2769	0	0.003	0	f	f	f	f	f
596	Pupunha, cozida	Nozes e Sementes	2.1853	0.0252	0.1276	0.2957	0.0425	0.2759	0.2529	0.0052	0.0029	0.0091	0.0218	13.1317	0.0307	0	f	f	f	f	f
42	Milho, amido, cru	Cereais e Derivados	3.6137	0.006	0	0.8715	0.0074	0.0106	0.0303	0.0013	0.0008	0.0808	0	0	0	0	f	f	f	f	f
45	Milho, verde, enlatado, drenado	Cereais e Derivados	0.9756	0.0323	0.0235	0.1714	0.0464	0.0217	0.2038	0.0059	0.005	2.6035	0.0174	0.72	0.006	0	f	f	f	f	f
27	Creme de arroz, pó	Cereais e Derivados	3.86	0.0703	0.0123	0.8387	0.0107	0.0709	0.505	0.0063	0.0186	0.0103	0	0	0.004	0	f	f	f	f	f
28	Creme de milho, pó	Cereais e Derivados	3.3303	0.0482	0.0164	0.8615	0.0372	3.2316	0.3006	0.0426	0.0078	5.9379	0.9634	0	0.003	0	f	f	f	f	f
29	Curau, milho verde	Cereais e Derivados	0.7843	0.0236	0.0164	0.1394	0.0046	0.526	0.1596	0.0045	0.004	0.2051	0	0.4821	0.0082	0	f	f	f	f	f
30	Curau, milho verde, mistura para	Cereais e Derivados	4.0229	0.0222	0.1337	0.7982	0.0252	0.3088	0.085	0.0086	0.0024	2.2293	0	0	0.03	0	f	f	f	f	f
7	Aveia, flocos, crua	Cereais e Derivados	3.9382	0.1392	0.085	0.6664	0.0913	0.4789	1.1876	0.0445	0.0263	0.0463	0.0135	0	0.0154	0	t	f	f	f	f
31	Farinha, de arroz, enriquecida	Cereais e Derivados	3.6306	0.0127	0.003	0.855	0.0058	0.0112	0.043	0.3138	0.0848	0.171	1.7359	0	0.002	0	f	f	f	f	f
32	Farinha, de centeio, integral	Cereais e Derivados	3.3578	0.1252	0.0175	0.733	0.1548	0.3392	1.2023	0.0473	0.0266	0.4138	0	0	0.003	0	f	f	f	f	f
34	Farinha, de rosca	Cereais e Derivados	3.7058	0.1138	0.0146	0.7579	0.0482	0.353	0.5688	0.0673	0.0167	3.325	0	0	0.006	0	f	f	f	f	f
51	Pão, milho, forma	Cereais e Derivados	2.9201	0.083	0.0311	0.564	0.043	0.7785	0.2942	0.0304	0.0082	5.0664	0	0	0.006	0	f	f	f	f	f
52	Pão, trigo, forma, integral	Cereais e Derivados	2.5319	0.0943	0.0365	0.4994	0.0688	1.3176	0.6043	0.0299	0.0159	5.061	0	0	0.007	0	f	f	f	f	f
53	Pão, trigo, francês	Cereais e Derivados	2.9981	0.0795	0.031	0.5865	0.0231	0.1575	0.2546	0.01	0.0076	6.4767	0	0.0299	0.01	0	f	f	f	f	f
54	Pão, trigo, sovado	Cereais e Derivados	3.1096	0.084	0.0284	0.6145	0.0243	0.5162	0.2222	0.0227	0.0266	4.3079	0	0	0.008	0	f	f	f	f	f
47	Pamonha, barra para cozimento, pré-cozida	Cereais e Derivados	1.7122	0.0255	0.0485	0.3068	0.0237	0.0416	0.1535	0.0036	0.0042	1.3199	0	0	0.005	0	f	f	f	f	f
48	Pão, aveia, forma	Cereais e Derivados	3.4309	0.1235	0.0569	0.5957	0.0598	1.0869	0.5668	0.0473	0.0173	6.0576	0	0	0.011	0	f	f	f	f	f
598	Trigo para kibe	Cereais e Derivados	3.4	0.16	0	0.66	0.08	0.28	0	0.04	0	0	0	0	0	0	f	f	f	f	f
64	Abóbora, cabotian, cozida	Verduras, Hortaliças e Derivados	0.4804	0.0144	0.0073	0.1076	0.0246	0.0763	0.0911	0.0035	0.0029	0.0145	0.0746	0	0.001	0	f	f	f	f	f
68	Abóbora, moranga, refogada	Verduras, Hortaliças e Derivados	0.29	0.0039	0.008	0.0598	0.0155	0.1908	0.0749	0.0011	0.0008	0.0303	0.0673	1.43	0.0012	0	f	f	f	f	f
289	Corimbatá, assado	Pescados e Frutos do mar	2.6145	0.199	0.1957	0	0	0.223	0.2421	0.0097	0.0075	0.4043	0	0	0.048	0	f	f	f	f	f
290	Corimbatá, cozido	Pescados e Frutos do mar	2.387	0.2013	0.1693	0	0	0.6469	0.2283	0.0062	0.0095	0.3717	0	0	0.0445	0	f	f	f	f	f
293	Corvina grande, assada	Pescados e Frutos do mar	1.4653	0.2677	0.0357	0	0	0.6023	0.241	0.0054	0.0067	0.8535	0	0	0.015	0	f	f	f	f	f
294	Corvina grande, cozida	Pescados e Frutos do mar	1.0008	0.2344	0.0256	0	0	0.6937	0.2222	0.0058	0.0069	0.6839	0	0.1883	0.0075	0	f	f	f	f	f
295	Dourada de água doce, fresca	Pescados e Frutos do mar	1.3121	0.1881	0.0564	0	0	0.1213	0.2626	0.0015	0.0048	0.403	0	0	0.0297	0	f	f	f	f	f
297	Lambari, congelado, frito	Pescados e Frutos do mar	3.2687	0.2843	0.2278	0	0	18.8104	0.6629	0.0081	0.0563	0.6455	0	0.2834	0.055	0	f	f	f	f	f
299	Manjuba, com farinha de trigo, frita	Pescados e Frutos do mar	3.4355	0.2345	0.2259	0.1024	0.0036	7.6331	0.469	0.0304	0.0377	0.3652	0	0.8983	0.0546	0	f	f	f	f	f
300	Manjuba, frita	Pescados e Frutos do mar	3.4933	0.3014	0.2446	0	0	5.7503	0.3166	0.0092	0.0324	0.4061	0	0.362	0.053	0	f	f	f	f	f
55	Pastel, de carne, cru	Cereais e Derivados	2.887	0.1074	0.0879	0.4202	0.0104	0.1669	0.1771	0.0199	0.0166	13.0927	0	0	0.0369	0	f	f	f	f	f
56	Pastel, de carne, frito	Cereais e Derivados	3.8837	0.101	0.2014	0.4377	0.0099	0.1255	0.1444	0.0251	0.0115	10.3989	0	0	0.0483	0	f	f	f	f	f
57	Pastel, de queijo, cru	Cereais e Derivados	3.0847	0.0985	0.0963	0.4595	0.0111	1.547	0.1581	0.0099	0.0097	9.8457	0	0	0	0	f	f	f	f	f
58	Pastel, de queijo, frito	Cereais e Derivados	4.2211	0.0871	0.2267	0.4813	0.0094	1.2613	0.1474	0.0134	0.0076	8.2138	0	0.1758	0	0	f	f	f	f	f
59	Pastel, massa, crua	Cereais e Derivados	3.102	0.069	0.0548	0.5738	0.0141	0.1261	0.1443	0.0106	0.0061	13.442	0	0	0.021	0	f	f	f	f	f
60	Pastel, massa, frita	Cereais e Derivados	5.6967	0.0602	0.4086	0.4934	0.0131	0.1127	0.1274	0.0145	0.0052	11.7467	0	0	0.069	0	f	f	f	f	f
61	Pipoca, com óleo de soja, sem sal	Cereais e Derivados	4.4833	0.0993	0.1594	0.7031	0.1434	0.0283	0.9076	0.0116	0.0205	0.0432	0	0	0.0236	0	f	f	f	f	f
62	Polenta, pré-cozida	Cereais e Derivados	1.0274	0.0229	0.003	0.2331	0.024	0.0109	0.0443	0	0.0005	4.4189	0	0	0	0	f	f	f	f	f
63	Torrada, pão francês	Cereais e Derivados	3.7742	0.1052	0.033	0.7456	0.034	0.1874	0.316	0.0124	0.0091	8.2949	0	0	0.009	0	f	f	f	f	f
522	Chantilly, spray, com gordura vegetal	Outros alimentos industrializados	3.1496	0.0053	0.2727	0.1686	0	0.0227	0.0085	0	0.0007	1.097	0	0	0.259	0	f	f	f	f	f
523	Leite, de coco	Outros alimentos industrializados	1.6616	0.0101	0.1836	0.0219	0.0068	0.0585	0.1683	0.0046	0.0032	0.4429	0	0	0.156	0	f	f	f	f	f
524	Maionese, tradicional com ovos	Outros alimentos industrializados	3.0215	0.0058	0.305	0.079	0	0.0348	0.0086	0.001	0.0006	7.8683	0	0.08	0.041	0	f	f	f	f	f
519	Tempero a base de sal	Miscelânias	0.2133	0.0267	0.0026	0.0207	0.0056	0	0	0	0	325.6	0	0	0	0	f	f	f	f	f
311	Pintado, assado	Pescados e Frutos do mar	1.9156	0.3645	0.0398	0	0	1.1354	0.4236	0.0078	0.021	0.8095	0	0.197	0.018	0	f	f	f	f	f
313	Pintado, grelhado	Pescados e Frutos do mar	1.5219	0.308	0.0229	0	0	0.6898	0.2674	0.0048	0.0076	0.5309	0	0.154	0.011	0	f	f	f	f	f
315	Salmão, filé, com pele, fresco,  grelhado	Pescados e Frutos do mar	2.2873	0.2392	0.1404	0	0	0.2876	0.2779	0.0054	0.0056	0.8514	0	0	0.0314	0	f	f	f	f	f
344	Carne, bovina, contra-filé, com gordura, grelhado	Carnes e Derivados	2.7805	0.324	0.1549	0	0	0.0446	0.1866	0.0235	0.0478	0.5707	0	0	0.074	0	f	f	f	f	f
346	Carne, bovina, contra-filé, sem gordura, grelhado	Carnes e Derivados	1.9369	0.3588	0.0449	0	0	0.05	0.2106	0.0235	0.0514	0.5751	0	0	0.0203	0	f	f	f	f	f
95	Berinjela, cozida	Verduras, Hortaliças e Derivados	0.1885	0.0068	0.0015	0.0447	0.0252	0.1077	0.0882	0.0022	0.0013	0.0132	0	0	0	0	f	f	f	f	f
97	Beterraba, cozida	Verduras, Hortaliças e Derivados	0.3215	0.0129	0.0009	0.0723	0.0188	0.1526	0.1654	0.0024	0.0035	0.2276	0.0124	0	0	0	f	f	f	f	f
99	Biscoito, polvilho doce	Verduras, Hortaliças e Derivados	4.3755	0.0129	0.1225	0.8054	0.0116	0.3045	0.0585	0.0177	0.0015	0.978	0	0	0.024	0	f	f	f	f	f
538	Estrogonofe de frango	Alimentos Preparados	1.5681	0.1755	0.0796	0.0259	0	0.2605	0.2476	0.0152	0.0058	0.9946	0	0.2822	0.0369	0	f	f	f	f	f
540	Feijoada	Alimentos Preparados	1.1693	0.0867	0.0648	0.1164	0.0509	0.3238	0.3185	0.0135	0.0083	2.7822	0	0	0.0192	0	f	f	f	f	f
541	Frango, com açafrão	Alimentos Preparados	1.1278	0.097	0.0617	0.0406	0.0022	0.1299	0.1609	0.0084	0.005	0.2881	0.0528	0.0809	0.0161	0	f	f	f	f	f
542	Macarrão, molho bolognesa	Alimentos Preparados	1.1953	0.0493	0.0089	0.2252	0.0078	0.1055	0.0998	0.0139	0.0075	0.0894	0	0	0.0027	0	f	f	f	f	f
543	Maniçoba	Alimentos Preparados	1.3422	0.0996	0.087	0.0342	0.0216	0.6598	0.2365	0.0322	0.0203	4.067	0	3.3281	0.0289	0	f	f	f	f	f
544	Quibebe	Alimentos Preparados	0.8635	0.0856	0.0267	0.0664	0.0167	0.0768	0.104	0.0078	0.0164	2.4661	0	1.5738	0.0104	0	f	f	f	f	f
545	Salada, de legumes, com maionese	Alimentos Preparados	0.961	0.0105	0.0704	0.0892	0.0222	0.1213	0.0871	0.0023	0.0016	2.2843	0	4.2412	0.0109	0	f	f	f	f	f
259	Azeite, de dendê	Gorduras e Óleos	8.84	0	1	0	0	0	0	0	0	0	0	0	0.431	0	f	f	f	f	f
320	Sardinha, frita	Pescados e Frutos do mar	2.5704	0.3338	0.1269	0	0	4.8207	0.3883	0.0112	0.0164	0.601	0	0	0.026	0	f	f	f	f	f
525	Acarajé	Alimentos Preparados	2.8921	0.0835	0.1993	0.1911	0.0936	1.2442	0.5112	0.0193	0.0119	3.0489	0	0	0.091	0	f	f	f	f	f
527	Baião de dois, arroz e feijão-de-corda	Alimentos Preparados	1.3568	0.0624	0.0323	0.2042	0.0507	0.333	0.1868	0.0056	0.006	0.933	0	0	0.006	0	f	f	f	f	f
528	Barreado	Alimentos Preparados	1.6498	0.1827	0.0953	0.0024	0.0015	0.1451	0.2137	0.0244	0.0483	0.4763	0	0	0.0333	0	f	f	f	f	f
529	Bife à cavalo, com contra filé	Alimentos Preparados	2.9123	0.2366	0.2115	0	0	0.2598	0.1949	0.021	0.0321	0.8287	0	0.368	0.0794	0	f	f	f	f	f
530	Bolinho de arroz	Alimentos Preparados	2.7351	0.0804	0.0829	0.4168	0.0274	0.2357	0.1345	0.0212	0.0086	0.5886	0	0	0.018	0	f	f	f	f	f
531	Camarão à baiana	Alimentos Preparados	1.0078	0.0794	0.0597	0.0317	0.0039	0.4268	0.1486	0.0142	0.0047	0.8479	0.0407	0	0.0164	0	f	f	f	f	f
532	Charuto, de repolho	Alimentos Preparados	0.7823	0.0678	0.0112	0.1013	0.0146	0.2289	0.1346	0.0086	0.0175	0.121	0.0477	0	0.0046	0	f	f	f	f	f
301	Merluza, filé, assado	Pescados e Frutos do mar	1.2191	0.266	0.0092	0	0	0.3591	0.2027	0.0037	0.0089	1.1995	0	0	0.002	0	f	f	f	f	f
303	Merluza, filé, frito	Pescados e Frutos do mar	1.9163	0.2693	0.085	0	0	0.3563	0.3814	0.0038	0.0056	0.8996	0	0	0.014	0	f	f	f	f	f
305	Pescada, branca, frita	Pescados e Frutos do mar	2.2304	0.2736	0.1178	0	0	3.7827	0.3008	0.0051	0.0112	1.0723	0	1.1805	0.023	0	f	f	f	f	f
306	Pescada, filé, com farinha de trigo, frito	Pescados e Frutos do mar	2.8343	0.2144	0.1912	0.0503	0	0.2643	0.284	0.0094	0.0043	0.9051	0	0.525	0.0218	0	f	f	f	f	f
308	Pescada, filé, frito	Pescados e Frutos do mar	1.5427	0.2859	0.0357	0	0	0.1032	0.2112	0.0032	0.0061	1.1491	0	0.1265	0.01	0	f	f	f	f	f
309	Pescada, filé, molho escabeche	Pescados e Frutos do mar	1.4196	0.1175	0.0802	0.0502	0.0078	0.2012	0.1806	0.0147	0.0029	0.5129	0.0689	0.1919	0.0131	0	f	f	f	f	f
422	Lingüiça, porco, frita	Carnes e Derivados	2.7954	0.2045	0.2131	0	0	0.0848	0.1822	0.0087	0.0308	14.3159	0	0	0.065	0	f	f	f	f	f
556	Yakisoba	Alimentos Preparados	1.128	0.0752	0.0261	0.1825	0.0106	0.1395	0.1334	0.0062	0.0068	7.9376	0	0.93	0.0058	0	f	f	f	f	f
322	Tucunaré, filé, congelado, cru	Pescados e Frutos do mar	0.8769	0.1796	0.0122	-0.0005	0	0.1922	0.2564	0.0027	0.0044	0.5655	0	0	0.006	0	t	f	f	f	f
129	Mandioca, cozida	Verduras, Hortaliças e Derivados	1.2536	0.0058	0.003	0.3009	0.0156	0.1863	0.2682	0.0007	0.0017	0.0091	0.1107	0	0.001	0	f	f	f	f	f
349	Carne, bovina, coxão duro, sem gordura, cozido	Carnes e Derivados	2.1662	0.3188	0.0892	0	0	0.0398	0.1379	0.017	0.0497	0.411	0	0.0618	0.035	0	f	f	f	f	f
351	Carne, bovina, coxão mole, sem gordura, cozido	Carnes e Derivados	2.1868	0.3238	0.0891	0	0	0.0373	0.1347	0.0256	0.047	0.435	0	0.074	0.043	0	f	f	f	f	f
353	Carne, bovina, cupim, assado	Carnes e Derivados	3.301	0.2863	0.2304	0	0	0.0762	0.1821	0.027	0.0529	0.7159	0	0	0.055	0	f	f	f	f	f
356	Carne, bovina, fígado, grelhado	Carnes e Derivados	2.2503	0.2986	0.0901	0.042	0	0.0556	0.097	0.0579	0.0395	0.8219	0	437.22	0.047	0	f	f	f	f	f
480	Refrigerante, tipo cola	Bebidas (álcoolicas e não álcoolicas)	0.3351	0	0	0.0866	0	0.0137	0	0	0	0.0712	0	0	0	0.108	f	f	f	f	f
481	Refrigerante, tipo guaraná	Bebidas (álcoolicas e não álcoolicas)	0.387	0	0	0.1	0	0.0141	0	0	0	0.0901	0	0	0	0.1035	f	f	f	f	f
482	Refrigerante, tipo laranja	Bebidas (álcoolicas e não álcoolicas)	0.4563	0	0	0.1179	0	0.0234	0.0121	0	0	0.0927	0	0	0	0.0645	f	f	f	f	f
483	Refrigerante, tipo limão	Bebidas (álcoolicas e não álcoolicas)	0.3972	0	0	0.1026	0	0.0175	0.0053	0	0	0.088	0	0	0	0.06	f	f	f	f	f
498	Chocolate, meio amargo	Produtos Açucarados	4.7492	0.0486	0.2986	0.6242	0.0494	0.4467	1.0736	0.0361	0.0152	0.0887	0.021	0	0.131	0.54	f	f	f	f	f
546	Salada, de legumes, cozida no vapor	Alimentos Preparados	0.3541	0.0201	0.0031	0.0709	0.0251	0.329	0.1858	0.0044	0.003	0.0251	0.2935	7.65	0.0006	0	f	f	f	f	f
547	Salpicão, de frango	Alimentos Preparados	1.4786	0.1393	0.0784	0.0457	0.0041	0.0941	0.1325	0.0032	0.0039	2.4835	0.0926	0.2175	0.0134	0	f	f	f	f	f
539	Feijão tropeiro mineiro	Alimentos Preparados	1.5156	0.1017	0.0679	0.1958	0.0357	0.412	0.3611	0.0216	0.0145	3.6507	0	0.0877	0.0216	0	f	f	f	f	f
548	Sarapatel	Alimentos Preparados	1.2298	0.1847	0.0442	0.0109	0.0041	0.1223	0.128	0.0718	0.0177	2.1562	0	14.6367	0.0139	0	f	f	f	f	f
549	Tabule	Alimentos Preparados	0.5745	0.0205	0.0121	0.1058	0.0208	0.1885	0.1798	0.0055	0.0058	0.0119	0.1622	0	0.0021	0	f	f	f	f	f
358	Carne, bovina, filé mingnon, sem gordura, grelhado	Carnes e Derivados	2.197	0.328	0.0883	0	0	0.0431	0.2826	0.0287	0.0413	0.5791	0	0	0.045	0	f	f	f	f	f
359	Carne, bovina, flanco, sem gordura, cozido	Carnes e Derivados	1.9558	0.2938	0.0777	0	0	0.0353	0.1361	0.0277	0.0555	0.4168	0	0.0528	0.039	0	f	f	f	f	f
361	Carne, bovina, fraldinha, com gordura, cozida	Carnes e Derivados	3.3845	0.2424	0.2605	0	0	0.0321	0.1448	0.0203	0.065	0.3878	0	0	0.121	0	f	f	f	f	f
403	Frango, inteiro, sem pele, assado	Carnes e Derivados	1.8734	0.2803	0.075	0	0	0.0906	0.1388	0.0055	0.0158	0.7027	0	0	0.021	0	f	f	f	f	f
462	Queijo, minas, meia cura	Leites e Derivados	3.2072	0.2121	0.2461	0.0357	0	6.9592	0.2707	0.0022	0.0268	5.0117	0	1.1133	0.1323	0	f	f	f	f	f
504	Maria mole	Produtos Açucarados	3.0124	0.0381	0.0019	0.7355	0.0067	0.1336	0.0689	0.0039	0.0009	0.1531	0	0	0	0	f	f	f	f	f
606	Iogurte, sabor maça verde	Leites e Derivados	0.9869	0.0346	0.0347	0.1462	0.0213	1.2093	0.1152	0.0009	0.0044	0.4478	0.0415	0	0.0198	0	f	f	f	f	f
604	Canjiquinha	Cereais e Derivados	0.6295	0.0124	0.0003	0.135	0.0067	0	0	0	0	0	0	0	0	0	f	f	f	f	f
607	Proteína Texturizada de Soja	Outros alimentos industrializados	3.37	0.46	0.0063	0.41	0.0847	1.16	0.253	0.0941	0.0262	6.52	0	0	0.0028	0	f	f	f	f	f
317	Salmão, sem pele, fresco, grelhado	Pescados e Frutos do mar	2.4271	0.2614	0.1453	0	0	0.1509	0.3786	0.0037	0.005	0.9581	0	0	0.0358	0	f	f	f	f	f
318	Sardinha, assada	Pescados e Frutos do mar	1.6435	0.3218	0.0299	0	0	4.3773	0.5136	0.0125	0.0182	0.7447	0	0	0.017	0	f	f	f	f	f
319	Sardinha, conserva em óleo	Pescados e Frutos do mar	2.8498	0.1594	0.2405	0	0	5.5024	0.3527	0.0354	0.0164	6.6584	0	0	0.041	0	f	f	f	f	f
374	Carne, bovina, paleta, sem gordura, cozida	Carnes e Derivados	1.9365	0.2972	0.074	0	0	0.0564	0.1766	0.0217	0.0682	0.5762	0	0	0.034	0	f	f	f	f	f
404	Frango, inteiro, sem pele, cozido	Carnes e Derivados	1.7039	0.2499	0.0706	0	0	0.0818	0.1235	0.0046	0.0124	0.5089	0	0	0.022	0	f	f	f	f	f
33	Farinha, de milho, amarela	Cereais e Derivados	3.5059	0.0719	0.0147	0.7908	0.0549	0.0129	0.3096	0.0225	0.006	0.4493	0	0.27	0.004	0	t	f	f	f	f
260	Azeite, de oliva, extra virgem	Gorduras e Óleos	8.84	0	1	0	0	0	0	0	0	0	0	0	0.149	0	f	f	f	f	f
261	Manteiga, com sal	Gorduras e Óleos	7.2597	0.0041	0.8236	0.0006	0	0.0942	0.0147	0.0015	0	5.7869	0	9.2355	0.492	0	f	f	f	f	f
262	Manteiga, sem sal	Gorduras e Óleos	7.5754	0.004	0.8604	0	0	0.0361	0.0143	0	0	0.0385	0	10.1309	0.515	0	f	f	f	f	f
86	Batata, baroa, cozida	Verduras, Hortaliças e Derivados	0.8012	0.0085	0.0017	0.1895	0.0176	0.1185	0.0758	0.0042	0.0038	0.021	0.171	0	0	0	f	f	f	f	f
88	Batata, doce, cozida	Verduras, Hortaliças e Derivados	0.7676	0.0064	0.0009	0.1842	0.0221	0.1715	0.1116	0.0019	0.0012	0.027	0.2379	0	0	0	f	f	f	f	f
406	Frango, peito, com pele, assado	Carnes e Derivados	2.1168	0.3342	0.0765	0	0	0.0826	0.1814	0.0048	0.0095	0.557	0	0.1868	0.022	0	f	f	f	f	f
377	Carne, bovina, patinho, sem gordura, grelhado	Carnes e Derivados	2.1926	0.359	0.0731	0	0	0.048	0.2726	0.0303	0.0809	0.6029	0	0	0.031	0	f	f	f	f	f
378	Carne, bovina, peito, sem gordura, cozido	Carnes e Derivados	3.3847	0.2225	0.2699	0	0	0.0403	0.1387	0.016	0.0389	0.5571	0	0	0.117	0	f	f	f	f	f
381	Carne, bovina, picanha, com gordura, grelhada	Carnes e Derivados	2.8877	0.2642	0.1951	0	0	0.04	0.24	0.032	0.055	0.6	0	0	0.079	0	f	f	f	f	f
383	Carne, bovina, picanha, sem gordura, grelhada	Carnes e Derivados	2.3847	0.3191	0.1133	0	0	0.0443	0.2542	0.0355	0.067	0.6066	0	0	0.045	0	f	f	f	f	f
384	Carne, bovina, seca, cozida	Carnes e Derivados	3.128	0.2693	0.2193	0	0	0.1276	0.119	0.0188	0.077	19.4318	0	0	0.105	0	f	f	f	f	f
386	Coxinha de frango, frita	Carnes e Derivados	2.8305	0.0961	0.1184	0.3452	0.0497	0.1833	0.1678	0.0126	0.0051	5.3213	0	0	0.026	0	f	f	f	f	f
331	Carne, bovina, almôndegas, fritas	Carnes e Derivados	2.7181	0.1816	0.1578	0.1429	0	0.2676	0.4812	0.0191	0.0261	10.3026	0	0	0.042	0	f	f	f	f	f
332	Carne, bovina, bucho, cozido	Carnes e Derivados	1.3302	0.2164	0.045	0	0	0.1321	0.0741	0.0058	0.0249	0.382	0	0	0.024	0	f	f	f	f	f
389	Empada de frango, pré-cozida, assada	Carnes e Derivados	3.5819	0.0694	0.1561	0.4749	0.0216	0.1561	0.183	0.0119	0.0064	5.2493	0	0	0	0	f	f	f	f	f
390	Empada, de frango, pré-cozida	Carnes e Derivados	3.7748	0.0734	0.2289	0.3553	0.0222	0.1356	0.1733	0.0075	0.005	7.7073	0.054	0	0.054	0	f	f	f	f	f
511	Café, pó, torrado	Miscelânias	4.1862	0.147	0.1195	0.6575	0.5123	1.0689	1.6512	0.0813	0.0052	0.0113	0	0	0.053	0	f	f	f	f	f
428	Porco, bisteca, frita	Carnes e Derivados	3.1117	0.3375	0.1852	0	0	0.6915	0.2913	0.0082	0.0216	0.6303	0	0.2922	0.0597	0	f	f	f	f	f
429	Porco, bisteca, grelhada	Carnes e Derivados	2.8008	0.2889	0.1738	0	0	0.3431	0.2474	0.0086	0.0235	0.5144	0	0	0.075	0	f	f	f	f	f
430	Porco, costela, assada	Carnes e Derivados	4.0217	0.3022	0.3028	0	0	0.1677	0.1404	0.0104	0.031	0.6268	0	0	0.118	0	f	f	f	f	f
432	Porco, lombo, assado	Carnes e Derivados	2.1023	0.3573	0.064	0	0	0.1951	0.1814	0.0046	0.0176	0.3892	0	0	0.026	0	f	f	f	f	f
435	Porco, pernil, assado	Carnes e Derivados	2.6226	0.3213	0.1386	0	0	0.1759	0.2735	0.0125	0.0325	0.6241	0	0	0.048	0	f	f	f	f	f
438	Presunto, com capa de gordura	Carnes e Derivados	1.2785	0.1437	0.0677	0.014	0	0.1248	0.1704	0.0068	0.0132	10.2077	0	0	0.0195	0	f	f	f	f	f
439	Presunto, sem capa de gordura	Carnes e Derivados	0.9374	0.1429	0.0271	0.0215	0	0.2327	0.1751	0.0083	0.0146	10.3918	0	0	0.0086	0	f	f	f	f	f
440	Quibe, assado	Carnes e Derivados	1.3623	0.1459	0.0268	0.1286	0.019	0.1562	0.3608	0.0215	0.0412	0.3989	0	0	0.0123	0	f	f	f	f	f
470	Bebida isotônica, sabores variados	Bebidas (álcoolicas e não álcoolicas)	0.2561	0	0	0.064	0	0.0123	0	0.0067	0	0.4408	0	0	0	0	f	f	f	f	f
85	Almeirão, refogado	Verduras, Hortaliças e Derivados	0.6508	0.017	0.0485	0.057	0.0343	0.634	0.1728	0.0155	0.0019	0.1452	0.0147	0	0.008	0	f	t	f	f	f
471	Café, infusão 10%	Bebidas (álcoolicas e não álcoolicas)	0.0907	0.0071	0.0007	0.0148	0	0.0316	0.0966	0	0	0.0103	0	0	0	0	f	f	f	f	f
472	Cana, aguardente 1	Bebidas (álcoolicas e não álcoolicas)	2.1566	0	0	0	0	0	0	0	0	0.0315	0	0	0	0	f	f	f	f	f
473	Cana, caldo de	Bebidas (álcoolicas e não álcoolicas)	0.6534	0	0	0.1815	0.0014	0.0908	0.1197	0.0075	0.0005	0	0.0278	0	0	0	f	f	f	f	f
474	Cerveja, pilsen 2	Bebidas (álcoolicas e não álcoolicas)	0.4072	0.0056	0	0.0332	0	0.0499	0.0674	0	0	0.0423	0	0	0	0	f	f	f	f	f
614	Biscoito, Rosquinha de Coco 	Cereais e Derivados	4.2333	0.0833	0.12	0.7	0	0.014	0	0.014	0	3.6333	0	0	0.0233	0.2615	f	f	f	f	f
70	Abobrinha, italiana, cozida	Verduras, Hortaliças e Derivados	0.1504	0.0113	0.002	0.0298	0.0159	0.1673	0.1686	0.0016	0.0026	0.0083	0.0213	0	0.001	0	f	f	f	f	f
72	Abobrinha, italiana, refogada	Verduras, Hortaliças e Derivados	0.2443	0.0107	0.0082	0.0419	0.0138	0.2067	0.1267	0.0036	0.0027	0.0221	0.0753	0.6238	0.0013	0	f	f	f	f	f
90	Batata, frita, tipo chips, industrializada	Verduras, Hortaliças e Derivados	5.4273	0.0558	0.3662	0.5122	0.0246	0.116	0.2424	0.007	0.0059	6.074	0	0	0.129	0	f	f	f	f	f
91	Batata, inglesa, cozida	Verduras, Hortaliças e Derivados	0.5159	0.0116	0	0.1194	0.0134	0.0352	0.0543	0.0019	0.0019	0.0229	0.0376	0	0	0	f	f	f	f	f
93	Batata, inglesa, frita	Verduras, Hortaliças e Derivados	2.6716	0.0497	0.1311	0.3564	0.0806	0.0628	0.1411	0.0044	0.0038	0.0191	0.1634	0	0.021	0	f	f	f	f	f
94	Batata, inglesa, sauté	Verduras, Hortaliças e Derivados	0.6789	0.0129	0.009	0.1409	0.0138	0.0418	0.0646	0.0025	0.0021	0.0818	0	0	0.003	0	f	f	f	f	f
475	Chá, erva-doce, infusão 5%	Bebidas (álcoolicas e não álcoolicas)	0.014	0	0	0.0039	0	0.0193	0.0088	0	0	0.0063	0	0	0	0	f	f	f	f	f
392	Frango, caipira, inteiro, com pele, cozido	Carnes e Derivados	2.4289	0.2388	0.1562	0	0	0.1676	0.1835	0.0166	0.017	0.5609	0	0.4848	0.044	0	f	f	f	f	f
393	Frango, caipira, inteiro, sem pele, cozido	Carnes e Derivados	1.9576	0.2958	0.077	0	0	0.6614	0.2317	0.0212	0.0266	0.5324	0	0.1816	0.022	0	f	f	f	f	f
395	Frango, coração, grelhado	Carnes e Derivados	2.0727	0.2244	0.121	0.0061	0	0.0835	0.2012	0.0653	0.0345	1.2824	0	0	0.035	0	f	f	f	f	f
396	Frango, coxa, com pele, assada	Carnes e Derivados	2.1512	0.2849	0.1036	0.0006	0	0.0834	0.1393	0.0122	0.0255	0.9484	0	0.1792	0.031	0	f	f	f	f	f
398	Frango, coxa, sem pele, cozida	Carnes e Derivados	1.6743	0.2686	0.0585	0	0	0.1178	0.1114	0.0083	0.0283	0.6434	0	0	0.02	0	f	f	f	f	f
401	Frango, filé, à milanesa	Carnes e Derivados	2.2087	0.2846	0.0779	0.0751	0.0113	0.0891	0.3483	0.0108	0.0084	1.2233	0	0.1983	0.016	0	f	f	f	f	f
408	Frango, peito, sem pele, cozido	Carnes e Derivados	1.6287	0.3147	0.0316	0	0	0.0644	0.1376	0.0034	0.0095	0.3617	0	0	0.011	0	f	f	f	f	f
455	Leite, de vaca, achocolatado	Leites e Derivados	0.8282	0.021	0.0217	0.1416	0.0065	0.6979	0.1288	0.0046	0.0031	0.7174	0.0326	0.3894	0.011	0	f	f	f	f	f
456	Leite, de vaca, desnatado, pó	Leites e Derivados	3.6161	0.3469	0.0093	0.5304	0	13.6317	1.0871	0.0093	0.0384	4.3167	0	2.9946	0.006	0	f	f	f	f	f
484	Omelete, de queijo	Ovos e Derivados	2.6801	0.1557	0.2201	0.0044	0	1.6573	0.1427	0.0137	0.0136	2.1605	0	0.5875	0.064	0	f	f	f	f	f
486	Ovo, de galinha, clara, cozida/10minutos	Ovos e Derivados	0.5944	0.1345	0.0009	0	0	0.0623	0.1101	0.0008	0	1.8054	0	0	0	0	f	f	f	f	f
487	Ovo, de galinha, gema, cozida/10minutos	Ovos e Derivados	3.5267	0.159	0.3078	0.0156	0	1.1443	0.0937	0.0292	0.0287	0.4491	0	1.4848	0.092	0	f	f	f	f	f
488	Ovo, de galinha, inteiro, cozido/10minutos	Ovos e Derivados	1.457	0.1329	0.0948	0.0061	0	0.4922	0.1124	0.0152	0.0124	1.459	0	0.3244	0.029	0	f	f	f	f	f
490	Ovo, de galinha, inteiro, frito	Ovos e Derivados	2.4019	0.1562	0.1859	0.0119	0	0.7289	0.1625	0.021	0.0146	1.6611	0	0.9389	0.0412	0	f	f	f	f	f
601	Iogurte  sabor coco	Leites e Derivados	0.9869	0.0346	0.0347	0.1462	0.0213	1.2093	0.1152	0.0009	0.0044	0.4478	0.0415	0	0.0198	0	f	f	f	f	f
611	Salsicha, crua	Carnes e Derivados	2.19	0.139	0.147	0.0767	0	0.34	0.193	0.0287	0.0276	11.95	0	0	0.0438	0	f	f	f	f	f
413	Frango, sobrecoxa, sem pele, assada	Carnes e Derivados	2.3288	0.2918	0.1201	0	0	0.1225	0.1723	0.0117	0.0218	1.0608	0	0.321	0.033	0	f	f	f	f	f
415	Hambúrguer, bovino, cru	Carnes e Derivados	2.1484	0.1316	0.1618	0.0415	0	0.3406	0.2452	0.0189	0.017	8.6946	0	0	0.057	0	f	f	f	f	f
416	Hambúrguer, bovino, frito	Carnes e Derivados	2.5828	0.1997	0.1701	0.0632	0	0.6239	0.597	0.0302	0.0318	12.518	0	0	0.059	0	f	f	f	f	f
417	Hambúrguer, bovino, grelhado	Carnes e Derivados	2.0983	0.1316	0.1243	0.1133	0	0.5621	0.4757	0.0264	0.0302	10.9033	0	0	0.051	0	f	f	f	f	f
419	Lingüiça, frango, frita	Carnes e Derivados	2.4546	0.1832	0.1854	0	0	0.1548	0.2919	0.0079	0.0116	13.7389	0	0	0.05	0	f	f	f	f	f
420	Lingüiça, frango, grelhada	Carnes e Derivados	2.4366	0.1819	0.184	0	0	0.1393	0.211	0.0072	0.0103	13.5149	0	0	0.047	0	f	f	f	f	f
612	Mistura para pudim, Chocolate	Cereais e Derivados	0.03	0.19	0	0.997	0.176	0.0029	0.0042	11	0.0498	2.78	0.0088	0.0178	0.252	0.345	f	f	f	f	f
613	Mistura para pudim, Morango	Cereais e Derivados	0.025	0.192	0	0.935	0.104	0.0006	0.0031	11	0.0498	2.53	0.0076	0.015	0.207	0.4315	f	f	f	f	f
102	Cará, cozido	Verduras, Hortaliças e Derivados	0.7758	0.0153	0.0011	0.1885	0.0263	0.0517	0.1484	0.0031	0.0024	0.0101	0	0	0	0	f	f	f	f	f
423	Lingüiça, porco, grelhada	Carnes e Derivados	2.9649	0.2317	0.219	0	0	0.0814	0.1879	0.0101	0.0348	14.5586	0	0	0.07	0	f	f	f	f	f
424	Mortadela	Carnes e Derivados	2.6882	0.1195	0.2165	0.0582	0	0.6655	0.1914	0.0147	0.0102	12.1217	0	0.2455	0.0612	0	f	f	f	f	f
425	Peru, congelado, assado	Carnes e Derivados	1.6307	0.262	0.0568	0	0	0.1384	0.1154	0.0059	0.0121	6.2788	0	0	0.016	0	f	f	f	f	f
520	Azeitona, preta, conserva	Outros alimentos industrializados	1.9415	0.0116	0.2035	0.0554	0.0456	0.5875	0.0476	0.0545	0.0029	15.6666	0	0	0.035	0	f	f	f	f	f
146	Polvilho, doce	Verduras, Hortaliças e Derivados	3.5123	0.0043	0	0.8677	0.0024	0.2741	0.041	0.0051	0	0.0158	0	0	0	0	f	f	f	f	f
521	Azeitona, verde, conserva	Outros alimentos industrializados	1.3694	0.0095	0.1422	0.041	0.0385	0.4564	0.0394	0.0018	0.0008	13.4718	0	0	0.023	0	f	f	f	f	f
513	Fermento em pó, químico	Miscelânias	0.8972	0.0048	0.0007	0.4391	0	0	0	0	0	100.5241	0	0	0	0	f	f	f	f	f
514	Fermento, biológico, levedura, tablete	Miscelânias	0.8979	0.1696	0.0152	0.077	0.0417	0.1801	0.3845	0.0262	0.11	0.3961	0	0	0	0	f	f	f	f	f
515	Gelatina, sabores variados, pó	Miscelânias	3.8022	0.0889	0	0.8922	0	0.2684	0.0231	0.0033	0	2.3492	0.4	0	0	0	f	f	f	f	f
516	Sal, dietético	Miscelânias	0	0	0	0	0	0	0	0	0	234.3152	0	0	0	0	f	f	f	f	f
517	Sal, grosso	Miscelânias	0	0	0	0	0	0	0	0	0	399.432	0	0	0	0	f	f	f	f	f
558	Amendoim, torrado, salgado	Leguminosas e Derivados	6.0578	0.2248	0.5396	0.187	0.0776	0.3943	1.5934	0.0133	0.0212	3.7573	0	0	0.0974	0	f	f	f	f	f
560	Ervilha, enlatada, drenada	Leguminosas e Derivados	0.7384	0.046	0.0038	0.1344	0.0508	0.2222	0.2319	0.0139	0.0088	3.7211	0	0.1375	0.001	0	f	f	f	f	f
603	Colorífico	Nozes e Sementes	2.5	0	0	0.5	0	0	0	0.05	0	0	0	0	0	0	f	f	f	f	f
441	Quibe, cru	Carnes e Derivados	1.0949	0.1235	0.0167	0.1077	0.0165	0.1209	0.2569	0.0165	0.0275	0.3877	0	0	0.0065	0	f	f	f	f	f
442	Quibe, frito	Carnes e Derivados	2.5383	0.1489	0.158	0.1234	0	0.2173	0.3877	0.0195	0.0278	8.3582	0	0	0.0458	0	f	f	f	f	f
443	Salame	Carnes e Derivados	3.9784	0.2581	0.3064	0.0291	0	0.8702	0.2992	0.0125	0.0315	15.7417	0	0	0.0957	0	f	f	f	f	f
323	Apresuntado	Carnes e Derivados	1.2886	0.1345	0.0669	0.0286	0	0.2258	0.1526	0.0088	0.0165	9.4293	0	0	0.0193	0	f	f	f	f	f
324	Caldo de carne, tablete	Carnes e Derivados	2.4062	0.0782	0.1657	0.1505	0.0058	1.2903	0.2206	0	0	221.7967	0	0	0.078	0	f	f	f	f	f
325	Caldo de galinha, tablete	Carnes e Derivados	2.5145	0.0628	0.2042	0.1065	0.1181	0.1636	0.1279	0.0069	0.0026	222.999	0	0	0.094	0	f	f	f	f	f
326	Carne, bovina, acém, moído, cozido	Carnes e Derivados	2.1242	0.2669	0.1092	0	0	0.0403	0.1707	0.0265	0.081	0.5236	0	0	0.048	0	f	f	f	f	f
327	Carne, bovina, acém, moído, cru	Carnes e Derivados	1.3656	0.1942	0.0595	0	0	0.0261	0.1414	0.0176	0.0633	0.4861	0	0.0696	0.027	0	f	f	f	f	f
328	Carne, bovina, acém, sem gordura, cozido	Carnes e Derivados	2.1461	0.2727	0.1088	0	0	0.0711	0.1444	0.0237	0.0797	0.5617	0	0	0.055	0	f	f	f	f	f
463	Queijo, mozarela	Leites e Derivados	3.2987	0.2265	0.2518	0.0305	0	8.7504	0.2357	0.0031	0.0352	5.8136	0	1.09	0.1423	0	f	f	f	f	f
465	Queijo, pasteurizado	Leites e Derivados	3.0308	0.0936	0.2744	0.0568	0	3.233	0.16	0.0027	0.013	7.8043	0	0.5731	0.159	0	f	f	f	f	f
466	Queijo, petit suisse, morango	Leites e Derivados	1.2111	0.0579	0.0284	0.1846	0	7.3093	0.2651	0.0014	0.0266	4.1247	0	2.7266	0.016	0	f	f	f	f	f
131	Mandioca, farofa, temperada	Verduras, Hortaliças e Derivados	4.0569	0.0206	0.0912	0.803	0.0782	0.6569	0.3434	0.0136	0.0017	5.7451	0	0	0.019	0	f	f	f	f	f
132	Mandioca, frita	Verduras, Hortaliças e Derivados	3.0006	0.0138	0.112	0.5025	0.0187	0.2305	0.9487	0.0032	0.0044	0.0894	0	0	0.017	0	f	f	f	f	f
467	Queijo, prato	Leites e Derivados	3.5988	0.2266	0.2911	0.0188	0	9.3999	0.2827	0.0028	0.0346	5.7977	0	1.2267	0.1629	0	f	f	f	f	f
468	Queijo, requeijão, cremoso	Leites e Derivados	2.5658	0.0963	0.2344	0.0243	0	2.5947	0.1163	0.0012	0.0128	5.5792	0	1.9459	0.137	0	f	f	f	f	f
469	Queijo, ricota	Leites e Derivados	1.3973	0.126	0.0811	0.0379	0	2.5324	0.1181	0.0014	0.0046	2.8258	0	0.5285	0.045	0	f	f	f	f	f
446	Bebida láctea, pêssego	Leites e Derivados	0.5516	0.0213	0.0191	0.0757	0.0029	0.8863	0.0859	0	0.0024	0.4626	0.0205	0	0.011	0	f	f	f	f	f
280	Bacalhau, salgado, refogado	Pescados e Frutos do mar	1.3966	0.2398	0.0361	0.0122	0	0.5912	0.1506	0.0015	0.0056	12.5628	0	0	0.009	0	f	f	f	f	f
281	Cação, posta, com farinha de trigo, frita	Pescados e Frutos do mar	2.0833	0.2495	0.0995	0.031	0.0054	0.3044	0.2551	0.01	0.0055	1.6003	0	0.5213	0.015	0	f	f	f	f	f
282	Cação, posta, cozida	Pescados e Frutos do mar	1.1601	0.2559	0.0075	0	0	0.1032	0.2112	0.0032	0.0061	1.1491	0	0.3525	0.002	0	f	f	f	f	f
283	Cação, posta, crua	Pescados e Frutos do mar	0.8333	0.1785	0.0079	0	0	0.087	0.193	0.002	0.0032	1.7602	0	0.1799	0.001	0	f	f	f	f	f
447	Creme de Leite	Leites e Derivados	2.2148	0.0151	0.2248	0.0451	0	0.8273	0.0754	0.003	0.0029	0.5172	0	1.2767	0.1182	0	f	f	f	f	f
69	Abóbora, pescoço, crua	Verduras, Hortaliças e Derivados	0.2447	0.0067	0.0012	0.0612	0.023	0.0881	0.0742	0.0028	0.0018	0.0075	0.0209	0	0	0	t	f	t	f	f
450	Iogurte, sabor abacaxi	Leites e Derivados	0.9869	0.0346	0.0347	0.1462	0.0213	1.2093	0.1152	0.0009	0.0044	0	0	0	0	0	f	f	f	f	f
451	Iogurte, sabor morango	Leites e Derivados	0.9869	0.0346	0.0347	0.1462	0.0213	1.2093	0.1152	0.0009	0.0044	0.3766	0	0.2703	0.014	0	f	f	f	f	f
452	Iogurte, sabor pêssego	Leites e Derivados	0.9869	0.0346	0.0347	0.1462	0.0213	1.2093	0.1152	0.0009	0.0044	0.3696	0	0.2128	0.014	0	f	f	f	f	f
457	Leite, de vaca, desnatado, UHT	Leites e Derivados	0	0	0	0	0	1.3381	0.1023	0	0.0038	0.5114	0	0	0	0	f	f	f	f	f
461	Queijo, minas, frescal	Leites e Derivados	2.6427	0.1741	0.2018	0.0324	0	5.7925	0.0688	0.0093	0.0029	0.3123	0	1.6051	0.114	0	f	f	f	f	f
464	Queijo, parmesão	Leites e Derivados	4.5296	0.3555	0.3353	0.0166	0	9.9197	0.3337	0.0053	0.0436	18.4408	0	0.6615	0.197	0	f	f	f	f	f
526	Arroz carreteiro	Alimentos Preparados	1.5377	0.1083	0.0712	0.1158	0.015	0.1326	0.0929	0.0096	0.0267	16.2173	0	0	0.032	0	f	f	f	f	f
5	Arroz, tipo 2, cozido	Cereais e Derivados	1.3012	0.0257	0.0036	0.2819	0.0107	0.0333	0.0605	0.0005	0.0055	0.0196	0	0	0.001	0	f	f	f	f	f
3	Arroz, tipo 1, cozido	Cereais e Derivados	1.2826	0.0252	0.0023	0.2806	0.0156	0.0354	0.0225	0.0008	0.0049	0.012	0	0	0.002	0	f	f	f	f	f
1	Arroz, integral, cozido	Cereais e Derivados	1.2353	0.0259	0.01	0.2581	0.0275	0.052	0.587	0.0026	0.0068	0.0124	0	0	0.003	0	f	f	f	f	f
561	Feijão, carioca, cozido	Leguminosas e Derivados	0.7642	0.0478	0.0054	0.1359	0.0851	0.2659	0.4234	0.0129	0.007	0.0176	0	0	0.001	0	f	f	f	f	f
76	Aipo, cru	Verduras, Hortaliças e Derivados	0.1909	0.0076	0.0007	0.0427	0.0096	0.6522	0.0886	0.0072	0.0014	0.0952	0.0588	13.74	0	0	t	f	f	f	f
569	Feijão, rajado, cozido	Leguminosas e Derivados	0.847	0.0554	0.004	0.1527	0.0932	0.2919	0.4171	0.0136	0.0092	0.0069	0	0	0.001	0	f	f	f	f	f
563	Feijão, fradinho, cozido	Leguminosas e Derivados	0.7801	0.0509	0.0064	0.135	0.0747	0.1745	0.3812	0.0106	0.0112	0.0098	0	0	0.002	0	f	f	f	f	f
571	Feijão, rosinha, cozido	Leguminosas e Derivados	0.6787	0.0454	0.0048	0.1182	0.0476	0.1924	0.4296	0.0118	0.0131	0.0208	0	0	0.002	0	f	f	f	f	f
573	Feijão, roxo, cozido	Leguminosas e Derivados	0.7689	0.0572	0.0054	0.1291	0.1151	0.2253	0.3439	0.0141	0.0101	0.0146	0	0	0.001	0	f	f	f	f	f
106	Catalonha, refogada	Verduras, Hortaliças e Derivados	0.6345	0.0195	0.0481	0.0481	0.0365	0.6322	0.1635	0.0118	0.0044	0.2472	0	12.75	0.0071	0	f	f	f	f	f
109	Cenoura, cozida	Verduras, Hortaliças e Derivados	0.2986	0.0085	0.0022	0.0669	0.0263	0.2562	0.1448	0.0009	0.0023	0.0788	0	9.18	0	0	f	f	f	f	f
112	Chuchu, cozido	Verduras, Hortaliças e Derivados	0.1854	0.0041	0	0.0479	0.0104	0.0783	0.0693	0.0006	0.0009	0.0181	0.0557	0	0	0	f	f	f	f	f
116	Couve, manteiga, refogada 	Verduras, Hortaliças e Derivados	0.9034	0.0167	0.0659	0.0871	0.0574	1.7733	0.262	0.005	0.0019	0.1145	0.7694	5.76	0.01	0	f	f	f	f	f
118	Couve-flor, cozida	Verduras, Hortaliças e Derivados	0.1911	0.0124	0.0027	0.0388	0.0213	0.1614	0.0544	0.0013	0.0026	0.0179	0.237	0	0.001	0	f	f	f	f	f
120	Espinafre, Nova Zelândia, refogado	Verduras, Hortaliças e Derivados	0.6725	0.0272	0.0543	0.0424	0.0252	1.1238	1.2271	0.0065	0.0059	0.4702	0.0527	9.3575	0.009	0	f	f	f	f	f
122	Farinha, de mandioca, torrada	Verduras, Hortaliças e Derivados	3.6527	0.0123	0.0029	0.8919	0.0654	0.7553	0.4001	0.0119	0.0036	0.1031	0	0	0.001	0	f	f	f	f	f
123	Farinha, de puba	Verduras, Hortaliças e Derivados	3.6018	0.0162	0.0047	0.8729	0.0424	0.414	0.2749	0.0143	0.0034	0.0361	0	0	0.0023	0	f	f	f	f	f
565	Feijão, jalo, cozido	Leguminosas e Derivados	0.9274	0.0614	0.0051	0.165	0.1387	0.294	0.441	0.0192	0.0101	0.0052	0	0	0.001	0	f	f	f	f	f
387	Croquete, de carne, cru	Carnes e Derivados	2.4577	0.1204	0.1556	0.1395	0	0.155	0.2364	0.0251	0.0267	7.1064	0	0	0	0	f	f	f	f	f
124	Fécula, de mandioca	Verduras, Hortaliças e Derivados	3.3085	0.0052	0.0028	0.8115	0.0065	0.1189	0.0302	0.0011	0	0.0245	0	0	0	0	f	f	f	f	f
136	Nhoque, batata, cozido	Verduras, Hortaliças e Derivados	1.8078	0.0586	0.0194	0.3678	0.0178	0.1142	0.179	0.0165	0.0048	0.0707	0	0.1547	0.0056	0	f	f	f	f	f
74	Acelga, crua	Verduras, Hortaliças e Derivados	0.2094	0.0144	0.0011	0.0463	0.0112	0.4299	0.104	0.0027	0.0031	0.0118	0.2255	0	0	0	t	t	f	f	f
75	Agrião, cru	Verduras, Hortaliças e Derivados	0.1658	0.0269	0.0024	0.0225	0.0214	1.3253	0.1816	0.0311	0.0072	0.0746	0.601	6.87	0	0	t	t	f	f	f
73	Abobrinha, paulista, crua	Verduras, Hortaliças e Derivados	0.3081	0.0064	0.0014	0.0787	0.0261	0.1867	0.0939	0.0017	0.0018	0.005	0.1755	0	0	0	t	f	t	f	f
138	Palmito, juçara, em conserva	Verduras, Hortaliças e Derivados	0.232	0.0179	0.004	0.0433	0.0315	0.5829	0.337	0.003	0.0073	5.1382	0.0198	0	0.001	0	f	f	t	f	f
140	Pão, de queijo, assado	Verduras, Hortaliças e Derivados	3.6308	0.0512	0.2457	0.3424	0.0056	1.0249	0.0824	0.0028	0.0063	7.7349	0	0.6131	0	0	f	f	f	f	f
141	Pão, de queijo, cru	Verduras, Hortaliças e Derivados	2.9454	0.0365	0.1399	0.3851	0.0098	0.8756	0.0683	0.0029	0.0043	4.0499	0	0.475	0.034	0	f	f	f	f	f
533	Cuscuz, de milho, cozido com sal	Alimentos Preparados	1.1346	0.0216	0.0068	0.2528	0.0205	0.0154	0.0272	0.0017	0.002	2.4767	0	0	0.002	0	f	f	f	f	f
534	Cuscuz, paulista	Alimentos Preparados	1.4212	0.0256	0.0465	0.2251	0.0243	0.1416	0.051	0.0033	0.0021	2.3571	0	0	0.018	0	f	f	f	f	f
535	Cuxá, molho	Alimentos Preparados	0.8009	0.0564	0.0359	0.0574	0.0302	1.0548	0.3358	0.0094	0.0057	13.4429	0.1028	0.4887	0.0059	0	f	f	f	f	f
536	Dobradinha	Alimentos Preparados	1.245	0.1977	0.0444	0	0	0.1134	0.0825	0.0101	0.0272	0.2877	0	0	0.025	0	f	f	f	f	f
537	Estrogonofe de carne	Alimentos Preparados	1.7314	0.1503	0.108	0.0298	0	0.2832	0.2151	0.027	0.0204	1.2285	0	0.2763	0.0526	0	f	f	f	f	f
550	Tacacá	Alimentos Preparados	0.4689	0.0696	0.0036	0.0339	0.0021	0.4482	0.299	0.0095	0.0079	13.4906	0	0.5304	0.0018	0	f	f	f	f	f
551	Tapioca, com manteiga	Alimentos Preparados	3.4783	0.0009	0.1091	0.6359	0	0.3003	0.0322	0.0024	0.0004	1.5752	0	0.7527	0.0605	0	f	f	f	f	f
552	Tucupi, com pimenta-de-cheiro	Alimentos Preparados	0.2718	0.0206	0.0028	0.0474	0.0023	0.2826	0.4249	0.0115	0.0085	0.0513	0.464	0.2529	0.0006	0	f	f	f	f	f
410	Frango, peito, sem pele, grelhado	Carnes e Derivados	1.5919	0.3203	0.0248	0	0	0.0534	0.1827	0.0033	0.0078	0.5025	0	0	0.009	0	f	f	f	f	f
411	Frango, sobrecoxa, com pele, assada	Carnes e Derivados	2.596	0.287	0.1519	0	0	0.1068	0.146	0.0121	0.0217	0.9594	0	0.2466	0.042	0	f	f	f	f	f
103	Cará, cru	Verduras, Hortaliças e Derivados	0.9563	0.0228	0.0014	0.2295	0.0727	0.0391	0.1147	0.0021	0.0018	0	0.0879	0	0	0	t	f	f	f	f
263	Margarina, com óleo hidrogenado, com sal (65% de lipídeos)	Gorduras e Óleos	5.9612	0	0.6743	0	0	0.0556	0.0113	0.0009	0	8.9404	0	4.6212	0.149	0	f	f	f	f	f
8	Biscoito, doce, maisena	Cereais e Derivados	4.4282	0.0807	0.1197	0.7523	0.021	0.5445	0.3714	0.0176	0.0103	3.5203	0.0622	0	0.039	0.1611	f	f	f	f	f
20	Canjica, com leite integral	Cereais e Derivados	1.1246	0.0236	0.0124	0.2363	0.0122	0.4256	0.0584	0.0006	0.0028	0.2759	0	0	0.006	0.07	f	f	f	f	f
46	Mingau tradicional, pó	Cereais e Derivados	3.7342	0.0058	0.0037	0.8934	0.0088	5.2205	0.0428	0.4199	0.1521	0.1486	0	15.3324	0.001	0.1339	f	f	f	f	f
460	Leite, fermentado	Leites e Derivados	0.6962	0.0189	0.001	0.1567	0	0.7153	0.0623	0	0.0026	0.3343	0.0049	0	0	0.0785	f	f	f	f	f
479	Refrigerante, tipo água tônica	Bebidas (álcoolicas e não álcoolicas)	0.3078	0	0	0.0795	0	0.0108	0	0	0	0.0829	0	0	0	0.068	f	f	f	f	f
491	Achocolatado, pó	Produtos Açucarados	4.0102	0.042	0.0217	0.9118	0.0389	0.444	0.7674	0.0536	0.0104	0.6479	0	7.9585	0.011	0.825	f	f	f	f	f
495	Chocolate, ao leite	Produtos Açucarados	5.3959	0.0722	0.3027	0.5958	0.0217	1.9119	0.571	0.0158	0.0106	0.771	0	0	0.175	0.56	f	f	f	f	f
512	Capuccino, pó	Miscelânias	4.1741	0.1131	0.0863	0.7361	0.0244	4.6659	0.7085	0.0228	0.0114	3.8229	0	0.5153	0.04	0.6	f	f	f	f	f
616	Mistura para pudim, Baunilha	Cereais e Derivados	1.51	0.055	0.038	0.237	0	1.48	0.16	0.0008	0.0047	1.49	0.0093	0	0.0228	0.445	f	f	f	f	f
264	Margarina, com óleo hidrogenado, sem sal (80% de lipídeos)	Gorduras e Óleos	7.2253	0	0.8173	0	0	0.026	0.0054	0.0005	0	0.7789	0	5.3438	0	0	f	f	f	f	f
265	Margarina, com óleo interesterificado, com sal (65%de lipídeos)	Gorduras e Óleos	5.9445	0	0.6725	0	0	0.0454	0.0123	0	0	5.608	0	3.8539	0.219	0	f	f	f	f	f
266	Margarina, com óleo interesterificado, sem sal (65% de lipídeos)	Gorduras e Óleos	5.9314	0	0.671	0	0	0.0496	0.0115	0.0008	0	0.3319	0	2.451	0.209	0	f	f	f	f	f
267	Óleo, de babaçu	Gorduras e Óleos	8.84	0	1	0	0	0	0	0	0	0	0	0	0.509	0	f	f	f	f	f
453	Leite, condensado	Leites e Derivados	3.1257	0.0767	0.0674	0.57	0	2.4627	0.2198	0.0013	0.0086	0.938	0.0214	0.5295	0.042	0	f	f	f	f	f
454	Leite, de cabra	Leites e Derivados	0.6642	0.0307	0.0375	0.0525	0	1.1225	0.098	0.001	0.0035	0.7395	0	0.3474	0.024	0	f	f	f	f	f
363	Carne, bovina, lagarto, cozido	Carnes e Derivados	2.2247	0.3286	0.0911	0	0	0.0353	0.1296	0.0185	0.0696	0.4754	0	0.0869	0.039	0	f	f	f	f	f
497	Chocolate, ao leite, dietético	Produtos Açucarados	5.5682	0.069	0.3377	0.5632	0.0285	1.8789	0.6721	0.0331	0.0112	0.8471	0.0205	0.0704	0.192	0	f	f	f	f	f
365	Carne, bovina, língua, cozida	Carnes e Derivados	3.149	0.2137	0.248	0	0	0.0593	0.1154	0.0207	0.0409	0.5906	0	0	0.112	0	f	f	f	f	f
477	Chá, preto, infusão 5%	Bebidas (álcoolicas e não álcoolicas)	0.0225	0	0	0.0063	0	0.0025	0.0096	0	0	0	0	0	0	0	f	f	f	f	f
139	Palmito, pupunha, em conserva	Verduras, Hortaliças e Derivados	0.2943	0.0246	0.0045	0.0551	0.0255	0.3244	0.2549	0.0018	0.0036	5.6269	0.0866	0	0	0	f	f	t	f	f
478	Coco, água de	Bebidas (álcoolicas e não álcoolicas)	0.2151	0	0	0.0528	0.0013	0.1884	0.0516	0	0	0.0178	0.0241	0	0	0	f	f	f	f	f
500	Doce, de abóbora, cremoso	Produtos Açucarados	1.9894	0.0092	0.0021	0.5461	0.0228	0.1299	0.0552	0.0085	0	0	0.0011	0	0	0	f	f	f	f	f
501	Doce, de leite, cremoso	Produtos Açucarados	3.0631	0.0548	0.0599	0.5949	0	1.951	0.1626	0.0007	0.0053	1.2009	0	1.0691	0.0132	0	f	f	f	f	f
502	Geléia, mocotó, natural	Produtos Açucarados	1.0609	0.0213	0.0007	0.2423	0	0.0352	0.0075	0.0012	0	0.4268	0	0	0	0	f	f	f	f	f
503	Glicose de milho	Produtos Açucarados	2.9212	0	0	0.7938	0	0.0567	0.019	0.0005	0	0.5893	0	0	0	0	f	f	f	f	f
553	Vaca atolada	Alimentos Preparados	1.449	0.0512	0.0932	0.1006	0.0234	0.6266	0.1575	0.0073	0.012	0.2563	0	0	0.0414	0	f	f	f	f	f
268	Óleo, de canola	Gorduras e Óleos	8.84	0	1	0	0	0	0	0	0	0	0	0	0.079	0	f	f	f	f	f
269	Óleo, de girassol	Gorduras e Óleos	8.84	0	1	0	0	0	0	0	0	0	0	0	0.108	0	f	f	f	f	f
270	Óleo, de milho	Gorduras e Óleos	8.84	0	1	0	0	0	0	0	0	0	0	0	0.152	0	f	f	f	f	f
271	Óleo, de pequi	Gorduras e Óleos	8.84	0	1	0	0	0	0	0	0	0	0	0	0.399	0	f	f	f	f	f
272	Óleo, de soja	Gorduras e Óleos	8.84	0	1	0	0	0	0	0	0	0	0	0	0.152	0	f	f	f	f	f
273	Abadejo, filé, congelado, assado	Pescados e Frutos do mar	1.1162	0.2353	0.0124	0	0	0.2261	0.2025	0.0053	0.0051	3.3439	0	0	0.0057	0	f	f	f	f	f
364	Carne, bovina, lagarto, cru	Carnes e Derivados	1.3486	0.2054	0.0523	0	0	0.0259	0.1967	0.0132	0.0239	0.5356	0	0.0598	0.023	0	t	f	f	f	f
366	Carne, bovina, língua, crua	Carnes e Derivados	2.1525	0.1709	0.1577	0	0	0.0504	0.153	0.017	0.0287	0.7305	0	0	0.068	0	t	f	f	f	f
367	Carne, bovina, maminha, crua	Carnes e Derivados	1.5277	0.2093	0.0703	0	0	0.0283	0.1566	0.0115	0.0348	0.3742	0	0.0953	0.031	0	t	f	f	f	f
275	Abadejo, filé, congelado, cru	Pescados e Frutos do mar	0.5911	0.1308	0.0036	0	0	0.1017	0.145	0.0011	0.0039	0.7852	0	0	0.001	0	t	f	f	f	f
285	Camarão, Rio Grande, grande, cru	Pescados e Frutos do mar	0.4718	0.0999	0.005	0	0	0.5112	0.2737	0.0067	0.0071	2.0113	0	0.6	0.001	0	t	f	f	f	f
288	Corimba, cru	Pescados e Frutos do mar	1.2816	0.1737	0.0599	0.0003	0	0.4005	0.2277	0.005	0.004	0.4701	0	0	0.025	0	t	f	f	f	f
369	Carne, bovina, miolo de alcatra, sem gordura, cru	Carnes e Derivados	1.6287	0.2161	0.0783	0	0	0.0319	0.2002	0.0197	0.0296	0.4305	0	0.1055	0.034	0	t	f	f	f	f
589	Castanha-do-Brasil, crua	Nozes e Sementes	6.4296	0.1454	0.6346	0.1508	0.0793	1.4634	3.6512	0.0231	0.0422	0.0065	0	0	0.153	0	t	f	f	f	f
373	Carne, bovina, paleta, com gordura, crua	Carnes e Derivados	1.5871	0.2141	0.0746	0	0	0.0436	0.1415	0.0176	0.0365	0.649	0	0	0.035	0	t	f	f	f	f
155	Serralha, crua	Verduras, Hortaliças e Derivados	0.304	0.0267	0.0074	0.0495	0.0352	1.2602	0.2955	0.0127	0.0133	0.1935	0.0151	17.01	0.001	0	t	f	f	f	f
40	Macarrão, trigo, cru	Cereais e Derivados	3.7112	0.1	0.013	0.7794	0.0293	0.173	0.2769	0.0088	0.0078	0.0717	0	0	0	0	t	f	f	f	f
576	Guandu, cru	Leguminosas e Derivados	3.4413	0.1896	0.0213	0.64	0.2131	1.2934	1.66	0.0194	0.0202	0.0162	0.0147	0	0.006	0	t	f	f	f	f
578	Lentilha, crua	Leguminosas e Derivados	3.3914	0.2315	0.0077	0.62	0.1694	0.5352	0.9353	0.0705	0.0349	0	0	0	0.001	0	t	f	f	f	f
581	Soja, farinha	Leguminosas e Derivados	4.0396	0.3603	0.1463	0.3844	0.2018	2.0602	2.419	0.1306	0.0454	0.0575	0	0	0	0	t	f	f	f	f
594	Linhaça, semente	Nozes e Sementes	4.951	0.1408	0.3225	0.4331	0.335	2.115	3.4692	0.047	0.0439	0.0867	0	0	0.042	0	t	f	f	f	f
336	Carne, bovina, capa de contra-filé, sem gordura, crua	Carnes e Derivados	1.3106	0.2154	0.0433	0	0	0.065	0.1959	0.0204	0.0459	0.7917	0	0	0.019	0	t	f	f	f	f
339	Carne, bovina, charque, cru	Carnes e Derivados	2.4886	0.2271	0.1684	0	0	0.1518	0.1336	0.0153	0.0389	58.7503	0	0	0.087	0	t	f	f	f	f
582	Soja, extrato solúvel, natural, fluido	Leguminosas e Derivados	0.391	0.0238	0.0161	0.0428	0.0037	0.1652	0.1545	0.0043	0.0028	0.5653	0	0	0.002	0	t	f	f	f	f
584	Soja, queijo (tofu)	Leguminosas e Derivados	0.6449	0.0655	0.0395	0.0213	0.0075	0.8076	0.382	0.0143	0.0089	0.0121	0	0	0.004	0	t	f	f	f	f
334	Carne, bovina, capa de contra-filé, com gordura, crua	Carnes e Derivados	2.1691	0.192	0.1496	0	0	0.0586	0.1745	0.0151	0.0354	0.5754	0	0.1129	0.069	0	t	f	f	f	f
341	Carne, bovina, contra-filé de costela, cru	Carnes e Derivados	2.0244	0.198	0.1307	0	0	0.0316	0.14	0.0156	0.0435	0.3852	0	0.0916	0.067	0	t	f	f	f	f
156	Taioba, crua	Verduras, Hortaliças e Derivados	0.3421	0.029	0.0093	0.0543	0.0445	1.4109	0.3792	0.0191	0.0061	0.0116	0.1794	17.4	0.002	0	t	t	f	f	f
162	Vagem, crua	Verduras, Hortaliças e Derivados	0.249	0.0179	0.0017	0.0535	0.0238	0.411	0.1783	0.0043	0.0033	0	0.0115	0.4812	0	0	t	f	t	f	f
343	Carne, bovina, contra-filé, com gordura, cru	Carnes e Derivados	2.0586	0.2115	0.1281	0	0	0.0367	0.1816	0.0131	0.0279	0.4413	0	0.1076	0.056	0	t	f	f	f	f
291	Corvina de água doce, crua	Pescados e Frutos do mar	1.0101	0.1892	0.0224	0	0	0.3943	0.245	0.0026	0.0036	0.4509	0	0.2436	0.012	0	t	f	f	f	f
292	Corvina do mar, crua	Pescados e Frutos do mar	0.94	0.1857	0.0158	0	0	0	0.2375	0.0038	0.0036	0.6797	0	1.9505	0.007	0	t	f	f	f	f
296	Lambari, congelado, cru	Pescados e Frutos do mar	1.3084	0.1681	0.0655	0	0	11.8128	0.4469	0.0091	0.0334	0.4792	0	0.1292	0.02	0	t	f	f	f	f
298	Lambari, fresco, cru	Pescados e Frutos do mar	1.516	0.1565	0.094	0	0	5.9027	0.3161	0.0063	0.0242	0.4111	0	0	0.034	0	t	f	f	f	f
41	Macarrão, trigo, cru, com ovos	Cereais e Derivados	3.7057	0.1032	0.0197	0.7662	0.023	0.1945	0	0.0092	0.0081	0.1474	0	0	0.0054	0	t	f	f	f	f
43	Milho, fubá, cru	Cereais e Derivados	3.5348	0.0721	0.019	0.7887	0.0471	0.0267	0.4123	0.0085	0.0109	0	0	0.39	0.0043	0	t	f	f	f	f
44	Milho, verde, cru	Cereais e Derivados	1.3817	0.0659	0.0061	0.2856	0.0392	0.0161	0.3258	0.0041	0.0052	0.0112	0	0.48	0.002	0	t	f	f	f	f
321	Sardinha, inteira, crua	Pescados e Frutos do mar	1.139	0.2108	0.0265	0	0	1.6733	0.2853	0.0134	0.0129	0.6039	0	0	0.017	0	t	f	f	f	f
302	Merluza, filé, cru	Pescados e Frutos do mar	0.8913	0.1661	0.0202	0	0	0.204	0.2702	0.0019	0.0033	0.795	0	0	0.009	0	t	f	f	f	f
304	Pescada, branca, crua	Pescados e Frutos do mar	1.1088	0.1626	0.0459	0	0	0.1574	0.192	0.0016	0.0025	0.7617	0	0.0831	0.008	0	t	f	f	f	f
96	Berinjela, crua	Verduras, Hortaliças e Derivados	0.1963	0.0122	0.001	0.0443	0.0287	0.0922	0.1291	0.0025	0.0012	0	0.0301	0.36	0	0	t	f	f	f	f
587	Amêndoa, torrada, salgada	Nozes e Sementes	5.8075	0.1855	0.4732	0.2955	0.1164	2.367	2.221	0.0306	0.0258	2.7852	0	0	0.048	0	t	f	f	f	f
316	Salmão, sem pele, fresco, cru	Pescados e Frutos do mar	1.6978	0.1925	0.0971	0	0	0.0875	0.2742	0.0024	0.0034	0.6424	0	0	0.0247	0	t	f	f	f	f
609	Tilápia, filé, cru	Pescados e Frutos do mar	0.94	0.182	0.0231	0.0001	0	0.1	0.27	0.0056	0.0033	0.52	0	0	0.008	0	t	f	f	f	f
599	Água	Bebidas	0	0	0	0	0	0.003	0.001	0	0	0.005	0	0	0	0	t	f	f	f	f
348	Carne, bovina, costela, crua	Carnes e Derivados	3.5772	0.1671	0.3175	0	0	0	0.1168	0.012	0.027	0.7	0	0.137	0.149	0	t	f	f	f	f
133	Manjericão, cru	Verduras, Hortaliças e Derivados	0.2115	0.0199	0.0039	0.0364	0.0331	2.1092	0.5781	0.0097	0.0046	0.0389	0.0234	15.5225	0.0013	0	t	f	f	f	f
405	Frango, inteiro, sem pele, cru	Carnes e Derivados	1.291	0.2059	0.0457	0	0	0.0652	0.2704	0.0054	0.0124	0.7296	0	0.1101	0.014	0	t	f	f	f	f
376	Carne, bovina, patinho, sem gordura, cru	Carnes e Derivados	1.3347	0.2172	0.0451	0	0	0.033	0.201	0.0178	0.0447	0.4913	0	0.0452	0.02	0	t	f	f	f	f
379	Carne, bovina, peito, sem gordura, cru	Carnes e Derivados	2.5928	0.1756	0.2043	0	0	0.0394	0.1532	0.0131	0.0263	0.6376	0	0.1275	0.082	0	t	f	f	f	f
588	Castanha-de-caju, torrada, salgada	Nozes e Sementes	5.7017	0.1851	0.4628	0.2913	0.0366	0.3259	2.3661	0.0522	0.0472	1.25	0	0	0.077	0	t	f	f	f	f
590	Coco, cru	Nozes e Sementes	4.0649	0.0369	0.4198	0.104	0.0538	0.0648	0.5146	0.0176	0.0094	0.1532	0.0249	0	0.3	0	t	f	f	f	f
81	Alfavaca, crua	Verduras, Hortaliças e Derivados	0.2918	0.0266	0.0048	0.0524	0.0414	2.585	0.8424	0.0126	0.0071	0.0455	0	0	0.001	0	t	f	f	f	f
87	Batata, baroa, crua	Verduras, Hortaliças e Derivados	1.0098	0.0105	0.0017	0.2398	0.0206	0.1713	0.1199	0.003	0.002	0	0.0755	0.3675	0	0	t	f	f	f	f
426	Peru, congelado, cru	Carnes e Derivados	0.9372	0.1808	0.0183	0	0	0.0988	0.1884	0.0087	0.0144	7.1068	0	0	0.004	0	t	f	f	f	f
427	Porco, bisteca, crua	Carnes e Derivados	1.6412	0.215	0.0802	0	0	0.0611	0.2407	0.0053	0.0143	0.5429	0	0	0.035	0	t	f	f	f	f
431	Porco, costela, crua	Carnes e Derivados	2.5561	0.18	0.1982	0	0	0.1453	0.1797	0.009	0.0227	0.8798	0	0	0.074	0	t	f	f	f	f
135	Mostarda, folha, crua	Verduras, Hortaliças e Derivados	0.1811	0.0211	0.0017	0.0324	0.0189	0.6818	0.1562	0.011	0.0028	0.0288	0.3855	0	0	0	t	t	f	f	f
65	Abóbora, cabotian, crua	Verduras, Hortaliças e Derivados	0.386	0.0175	0.0054	0.0836	0.0217	0.1796	0.0882	0.0037	0.0032	0	0.0509	6.69	0.0012	0	t	f	t	f	f
66	Abóbora, menina brasileira, crua	Verduras, Hortaliças e Derivados	0.1361	0.0061	0	0.033	0.0117	0.0874	0.0409	0.0015	0	0	0.015	16.62	0	0	t	f	t	f	f
67	Abóbora, moranga, crua	Verduras, Hortaliças e Derivados	0.1236	0.0096	0.0006	0.0267	0.017	0.0305	0.0185	0	0.0007	0	0.0965	4.17	0	0	t	f	t	f	f
485	Ovo, de codorna, inteiro, cru	Ovos e Derivados	1.7689	0.1369	0.1268	0.0077	0	0.7873	0.1106	0.0335	0.0205	1.2899	0	3.0517	0.089	0	t	f	f	f	f
489	Ovo, de galinha, inteiro, cru	Ovos e Derivados	1.4311	0.1303	0.089	0.0164	0	0.4202	0.1266	0.0156	0.0108	1.6791	0	0.7883	0.026	0	t	f	f	f	f
448	Iogurte, natural	Leites e Derivados	0.5149	0.0406	0.0304	0.0192	0	1.431	0.1125	0	0.0044	0.5162	0.0093	0.225	0.018	0	t	f	f	f	f
449	Iogurte, natural, desnatado	Leites e Derivados	0.4149	0.0383	0.0032	0.0577	0	1.5696	0.1198	0	0.0051	0.5964	0.0035	0	0.002	0	t	f	f	f	f
278	Atum, fresco, cru	Pescados e Frutos do mar	1.175	0.2568	0.0087	0	0	0.0669	0.3223	0.0127	0.004	0.303	0	0.6061	0.005	0	t	f	f	f	f
557	Amendoim, grão, cru	Leguminosas e Derivados	5.4405	0.2719	0.4385	0.2031	0.0804	0	1.7051	0.0253	0.0317	0	0	0	0.087	0	t	f	f	f	f
559	Ervilha, em vagem	Leguminosas e Derivados	0.8809	0.0745	0.0047	0.1423	0.0972	0.2444	0.4176	0.0144	0.0123	0	0.1244	0	0	0	t	f	f	f	f
444	Toucinho, cru	Carnes e Derivados	5.9253	0.1148	0.6026	0	0	0.0239	0.0357	0.0044	0.0021	0.4959	0	0	0.177	0	t	f	f	f	f
279	Bacalhau, salgado, cru	Pescados e Frutos do mar	1.3589	0.2904	0.0132	0	0	1.5697	0.4947	0.0085	0.0067	135.8506	0	0	0.006	0	t	f	f	f	f
4	Arroz, tipo 1, cru	Cereais e Derivados	3.5779	0.0716	0.0034	0.7876	0.0164	0.0441	0.3038	0.0068	0.0122	0.0102	0	0	0.001	0	t	f	f	f	f
6	Arroz, tipo 2, cru	Cereais e Derivados	3.5812	0.0724	0.0028	0.7888	0.0172	0.0483	0.2924	0.006	0.0127	0.0057	0	0	0.001	0	t	f	f	f	f
2	Arroz, integral, cru	Cereais e Derivados	3.5968	0.0732	0.0186	0.7745	0.0482	0.0782	1.0971	0.0095	0.014	0.0165	0	0	0.003	0	t	f	f	f	f
568	Feijão, preto, cru	Leguminosas e Derivados	3.2357	0.2134	0.0124	0.5875	0.2183	1.109	1.8811	0.0646	0.0285	0	0	0	0.002	0	t	f	f	f	f
458	Leite, de vaca, integral	Leites e Derivados	0	0	0	0	0	1.2258	0.0964	0.0003	0.0038	0.6376	0	0.209	0.014	0	t	f	f	f	f
562	Feijão, carioca, cru	Leguminosas e Derivados	3.2903	0.1998	0.0126	0.6122	0.1842	1.2257	2.0995	0.0799	0.029	0	0	0	0.002	0	t	f	f	f	f
459	Leite, de vaca, integral, pó	Leites e Derivados	4.9665	0.2542	0.269	0.3918	0	8.9027	0.7743	0.0052	0.0273	3.232	0	3.6106	0.163	0	t	f	f	f	f
570	Feijão, rajado, cru	Leguminosas e Derivados	3.2584	0.1727	0.0117	0.6293	0.2401	1.1143	1.699	0.1858	0.026	0.1365	0	0	0.004	0	t	f	f	f	f
572	Feijão, rosinha, cru	Leguminosas e Derivados	3.3696	0.2092	0.0133	0.6222	0.2063	0.6766	1.845	0.0532	0.0398	0.2411	0	0	0.006	0	t	f	f	f	f
574	Feijão, roxo, cru	Leguminosas e Derivados	3.3141	0.2217	0.0124	0.5999	0.3384	1.2046	1.6194	0.0692	0.0329	0.0976	0	0	0.003	0	t	f	f	f	f
566	Feijão, jalo, cru	Leguminosas e Derivados	3.2791	0.201	0.0095	0.6148	0.3032	0.9797	1.699	0.0703	0.0301	0.2458	0	0	0.003	0	t	f	f	f	f
575	Grão-de-bico, cru	Leguminosas e Derivados	3.547	0.2123	0.0543	0.5788	0.1236	1.1436	1.4639	0.0538	0.0319	0.0519	0	0	0.009	0	t	f	f	f	f
610	Feijão, branco. cru	Leguminosas e Derivados	3.12	0.234	0.0085	0.603	0.152	1.4	1.61	0.099	0.033	0.16	0	0	0.0022	0	t	f	f	f	f
137	Nabo, cru	Verduras, Hortaliças e Derivados	0.1819	0.012	0.0005	0.0415	0.0264	0.4239	0.146	0.0022	0.0019	0.0246	0.0955	0	0	0	t	f	t	f	f
145	Pimentão, vermelho, cru	Verduras, Hortaliças e Derivados	0.2328	0.0104	0.0015	0.0547	0.0159	0.0637	0.1113	0.0033	0.0015	0	1.5821	1.29	0	0	t	f	t	f	f
147	Quiabo, cru	Verduras, Hortaliças e Derivados	0.2994	0.0192	0.003	0.0637	0.0455	1.1216	0.4997	0.0037	0.0059	0.0089	0.056	0.7396	0	0	t	f	t	f	f
148	Rabanete, cru	Verduras, Hortaliças e Derivados	0.1374	0.0139	0.0007	0.0273	0.0219	0.2087	0.0961	0.0035	0.0018	0.1099	0.0963	0	0	0	t	f	t	f	f
591	Coco,  verde, cru	Nozes e Sementes	4.02	0.038	0.417	0.098	0.05	0.07	0.41	0.017	0.009	0	0	0	0.0314	0	t	f	f	f	f
592	Farinha, de mesocarpo de babaçu, crua	Nozes e Sementes	3.2877	0.0141	0.002	0.7917	0.1786	0.6095	0.3935	0.1833	0.0034	0.1246	0	0	0	0	t	f	f	f	f
593	Gergelim, semente	Nozes e Sementes	5.8355	0.2116	0.5043	0.2162	0.1187	8.2545	3.6069	0.0545	0.0524	0.0257	0	0	0.078	0	t	f	f	f	f
585	Tremoço, cru	Leguminosas e Derivados	3.8128	0.3358	0.1034	0.4379	0.3231	1.7675	1.2143	0.0279	0.0424	0.0329	0.2497	0	0.012	0	t	f	f	f	f
608	Soja em grãos	Leguminosas e Derivados	3.63	0.405	0.221	0.221	0.2167	0	0	0	0	0	0	0	0	0	t	f	f	f	f
564	Feijão, fradinho, cru	Leguminosas e Derivados	3.3916	0.2021	0.0237	0.6124	0.2359	0.7752	1.7839	0.0513	0.0388	0.1031	0	0	0.007	0	t	f	f	f	f
345	Carne, bovina, contra-filé, sem gordura, cru	Carnes e Derivados	1.5662	0.24	0.06	0	0	0.042	0.2063	0.0168	0.0324	0.5289	0	0	0.027	0	t	f	f	f	f
350	Carne, bovina, coxão duro, sem gordura, cru	Carnes e Derivados	1.4797	0.2151	0.0622	0	0	0.0295	0.2111	0.0189	0.0281	0.4855	0	0.062	0.0286	0	t	f	f	f	f
352	Carne, bovina, coxão mole, sem gordura, cru	Carnes e Derivados	1.6907	0.2123	0.0869	0	0	0.0299	0.2072	0.0189	0.0263	0.6053	0	0.0783	0.039	0	t	f	f	f	f
354	Carne, bovina, cupim, cru	Carnes e Derivados	2.214	0.1954	0.153	0	0	0.0357	0.1276	0.0113	0.0242	0.4686	0	0.0811	0.068	0	t	f	f	f	f
355	Carne, bovina, fígado, cru	Carnes e Derivados	1.4105	0.2071	0.0536	0.0111	0	0.0416	0.1242	0.0563	0.0346	0.7592	0	238.101	0.0279	0	t	f	f	f	f
357	Carne, bovina, filé mingnon, sem gordura, cru	Carnes e Derivados	1.4286	0.216	0.0561	0	0	0.0293	0.2139	0.0192	0.0275	0.4886	0	0.1089	0.029	0	t	f	f	f	f
360	Carne, bovina, flanco, sem gordura, cru	Carnes e Derivados	1.4146	0.2	0.0622	0	0	0.0281	0.1785	0.0158	0.0445	0.5422	0	0.0605	0.031	0	t	f	f	f	f
362	Carne, bovina, fraldinha, com gordura, crua	Carnes e Derivados	2.2072	0.1758	0.1615	0	0	0.0311	0.1612	0.0154	0.0419	0.512	0	0.1393	0.073	0	t	f	f	f	f
372	Carne, bovina, músculo, sem gordura, cru	Carnes e Derivados	1.4158	0.2156	0.0549	0	0	0.0364	0.1745	0.0186	0.0365	0.6608	0	0.0573	0.022	0	t	f	f	f	f
375	Carne, bovina, paleta, sem gordura, crua	Carnes e Derivados	1.4094	0.2103	0.0567	0	0	0.0362	0.1751	0.0193	0.0334	0.6586	0	0.0981	0.027	0	t	f	f	f	f
380	Carne, bovina, picanha, com gordura, crua	Carnes e Derivados	2.1288	0.1882	0.1469	0	0	0.0242	0.1422	0.0171	0.0377	0.3762	0	0.1038	0.061	0	t	f	f	f	f
382	Carne, bovina, picanha, sem gordura, crua	Carnes e Derivados	1.3352	0.2125	0.0474	0	0	0.0339	0.2025	0.0213	0.0423	0.6115	0	0	0.02	0	t	f	f	f	f
385	Carne, bovina, seca, crua	Carnes e Derivados	3.1275	0.1966	0.2537	0	0	0.1411	0.1222	0.0133	0.0365	44.3955	0	0	0.087	0	t	f	f	f	f
329	Carne, bovina, acém, sem gordura, cru	Carnes e Derivados	1.4403	0.2082	0.0611	0	0	0.0472	0.1328	0.0151	0.0521	0.4985	0	0.0652	0.028	0	t	f	f	f	f
330	Carne, bovina, almôndegas, cruas	Carnes e Derivados	1.8926	0.1231	0.112	0.0979	0	0.2223	0.2375	0.0156	0.0233	6.2125	0	0	0.039	0	t	f	f	f	f
333	Carne, bovina, bucho, cru	Carnes e Derivados	1.373	0.2053	0.055	0	0	0.0907	0.064	0.0047	0.0213	0.45	0	0	0.033	0	t	f	f	f	f
391	Frango, asa, com pele, crua	Carnes e Derivados	2.1319	0.181	0.1507	0	0	0.1092	0.2322	0.0057	0.0125	0.963	0	0.3112	0.044	0	t	f	f	f	f
433	Porco, lombo, cru	Carnes e Derivados	1.7563	0.226	0.0877	0	0	0.0416	0.2392	0.0047	0.0093	0.5307	0	0	0.033	0	t	f	f	f	f
434	Porco, orelha, salgada, crua	Carnes e Derivados	2.5849	0.1852	0.1989	0	0	0.0544	0.0207	0.0141	0.0057	6.156	0	0	0.073	0	t	f	f	f	f
436	Porco, pernil, cru	Carnes e Derivados	1.8606	0.2013	0.111	0	0	0.1294	0.2288	0.0089	0.0173	1.0189	0	0	0.042	0	t	f	f	f	f
437	Porco, rabo, salgado, cru	Carnes e Derivados	3.7742	0.1558	0.3447	0	0	0.2163	0.036	0.0062	0.0141	11.5767	0	0	0.116	0	t	f	f	f	f
394	Frango, coração, cru	Carnes e Derivados	2.215	0.1258	0.186	0	0	0.0551	0.1983	0.0409	0.0201	0.9506	0	0.2816	0.049	0	t	f	f	f	f
397	Frango, coxa, com pele, crua	Carnes e Derivados	1.6147	0.1709	0.0981	0	0	0.08	0.2581	0.007	0.0197	0.9496	0	0.3007	0.03	0	t	f	f	f	f
399	Frango, coxa, sem pele, crua	Carnes e Derivados	1.1995	0.1781	0.0486	0.0002	0	0.0797	0.2723	0.0078	0.0224	0.9837	0	0.3499	0.016	0	t	f	f	f	f
400	Frango, fígado, cru	Carnes e Derivados	1.0648	0.1759	0.0349	0.0002	0	0.0561	0.2783	0.0954	0.0373	0.8243	0	115.8999	0.013	0	t	f	f	f	f
402	Frango, inteiro, com pele, cru	Carnes e Derivados	2.2632	0.1644	0.1731	0	0	0.063	0.243	0.0062	0.0112	0.6288	0	0.21	0.052	0	t	f	f	f	f
407	Frango, peito, com pele, cru	Carnes e Derivados	1.4947	0.2078	0.0673	0	0	0.0842	0.2829	0.0044	0.006	0.6231	0	0.12	0.022	0	t	f	f	f	f
409	Frango, peito, sem pele, cru	Carnes e Derivados	1.1916	0.2153	0.0302	0	0	0.0736	0.3126	0.0043	0.0066	0.5614	0	0.06	0.011	0	t	f	f	f	f
412	Frango, sobrecoxa, com pele, crua	Carnes e Derivados	2.5453	0.1546	0.209	0	0	0.0709	0.215	0.0071	0.0131	0.6827	0	0.1976	0.065	0	t	f	f	f	f
414	Frango, sobrecoxa, sem pele, crua	Carnes e Derivados	1.618	0.1757	0.0962	0	0	0.0629	0.2633	0.009	0.0167	0.7975	0	0.1176	0.03	0	t	f	f	f	f
418	Lingüiça, frango, crua	Carnes e Derivados	2.1811	0.1424	0.1744	0	0	0.1084	0.1897	0.0047	0.0069	11.2581	0	0	0.052	0	t	f	f	f	f
421	Lingüiça, porco, crua	Carnes e Derivados	2.272	0.1606	0.1758	0	0	0.0613	0.1405	0.0044	0.0136	11.7572	0	0	0.04	0	t	f	f	f	f
104	Caruru, cru	Verduras, Hortaliças e Derivados	0.3403	0.032	0.0059	0.0597	0.0447	4.553	1.9744	0.0446	0.0603	0.1366	0.0536	28.59	0.001	0	t	f	f	f	f
105	Catalonha, crua	Verduras, Hortaliças e Derivados	0.2389	0.0187	0.0028	0.0475	0.0205	0.568	0.173	0.0308	0.0048	0.0939	0.0733	0	0.001	0	t	f	f	f	f
121	Farinha, de mandioca, crua	Verduras, Hortaliças e Derivados	3.6087	0.0155	0.0028	0.879	0.0639	0.6487	0.37	0.0109	0.0039	0.0102	0	0	0.001	0	t	f	f	f	f
125	Feijão, broto, cru	Verduras, Hortaliças e Derivados	0.3872	0.0417	0.001	0.0776	0.0197	0.1448	0.2513	0.0082	0.0057	0.0179	0.12	0	0	0	t	f	f	f	f
128	Jurubeba, crua	Verduras, Hortaliças e Derivados	1.2581	0.0441	0.0391	0.2306	0.2392	1.5102	0.6532	0.0095	0.0063	0.0077	0.1383	0	0.005	0	t	f	f	f	f
35	Farinha, de trigo	Cereais e Derivados	3.6047	0.0979	0.0137	0.7509	0.0235	0.1786	0.31	0.0095	0.0083	0.0074	0	0	0.0031	0	t	f	f	f	f
621	Pimentão, vermelho, cru	Tempero	0.2328	0.0104	0.0015	0.0547	0.0159	0.0637	0.1113	0.0033	0.0015	0	1.5821	1.29	0	0	t	f	f	f	f
615	Vinagre	Tempero	0.25	0	0	0.062	0	0.07	0.05	0.002	0.0094	0	0	0	0	0	f	f	f	f	f
605	Orégano	Tempero	0.66	0.02	0.02	0.1	0	0	0	0	0	0	0	0	0	0	f	f	f	f	f
602	Cheiro verde	Tempero	0.42	0.03	0.01	0.07	0.01	0	0	0	0	0	0	0	0	0	f	f	f	f	f
82	Alho, cru	Tempero	1.1313	0.0701	0.0022	0.2391	0.0432	0.1356	0.2129	0.008	0.0082	0.0536	0	0	0	0	t	f	f	f	f
114	Coentro, folhas desidratadas	Tempero	3.0907	0.2088	0.1039	0.4796	0.3729	7.8381	3.9279	0.8143	0.047	0.1826	0.4077	0	0	0	t	f	f	f	f
623	Cebolinha, crua	Tempero	0.1952	0.0187	0.0035	0.0337	0.0355	0.7985	0.2459	0.0065	0.003	0.016	0.3178	2.0162	0	0	t	f	f	f	f
624	Salsa, crua	Tempero	0.3342	0.0326	0.0061	0.0571	0.0185	1.7941	0.209	0.0318	0.0132	0.023	0.5169	26.1487	0.0008	0	f	f	f	f	f
110	Cenoura, crua	Verduras, Hortaliças e Derivados	0.3414	0.0132	0.0017	0.0766	0.0318	0.2254	0.1123	0.0018	0.0022	0.0333	0.0512	19.89	0	0	t	f	t	f	f
113	Chuchu, cru	Verduras, Hortaliças e Derivados	0.1698	0.007	0.0006	0.0414	0.0128	0.1151	0.0723	0.0017	0.001	0	0.1061	0	0	0	t	f	t	f	f
117	Couve-flor, crua	Verduras, Hortaliças e Derivados	0.2256	0.0191	0.0021	0.0452	0.0235	0.1782	0.1199	0.0053	0.0031	0.0344	0.3605	0.03	0	0	t	f	t	f	f
142	Pepino, cru	Verduras, Hortaliças e Derivados	0.0953	0.0087	0	0.0204	0.0112	0.0962	0.0934	0.0015	0.0013	0	0.0499	0.0538	0	0	t	f	t	f	f
127	Jiló, cru	Verduras, Hortaliças e Derivados	0.2737	0.014	0.0022	0.0619	0.0483	0.1997	0.2063	0.0034	0.0014	0	0.0679	0.19	0.0007	0	t	f	t	f	f
101	Brócolis, cru	Verduras, Hortaliças e Derivados	0.255	0.0364	0.0027	0.0403	0.0288	0.8587	0.2957	0.0061	0.0048	0.0333	0.3428	4.19	0.0014	0	t	f	t	f	t
143	Pimentão, amarelo, cru	Verduras, Hortaliças e Derivados	0.2793	0.0122	0.0044	0.0596	0.0192	0.0961	0.109	0.0041	0.0015	0	2.0136	0.6	0	0	t	f	t	f	t
622	Pimentão, amarelo, cru	Tempero	0.2793	0.0122	0.0044	0.0596	0.0192	0.0961	0.109	0.0041	0.0015	0	2.0136	0.6	0	0	t	f	f	f	t
620	Pimentão, verde, cru	Tempero	0.2129	0.0105	0.0015	0.0489	0.0256	0.0876	0.0779	0.0041	0.0014	0	1.0021	0.69	0	0	t	f	f	f	f
619	Tomate, com semente, cru	Tempero	0.1534	0.011	0.0017	0.0314	0.0117	0.0694	0.1054	0.0024	0.0014	0.0102	0.2121	0.81	0	0	t	f	f	f	t
130	Mandioca, crua	Verduras, Hortaliças e Derivados	1.5142	0.0113	0.003	0.3617	0.0188	0.1519	0.445	0.0027	0.002	0.0215	0.1653	0	0.0006	0	t	f	t	f	f
89	Batata, doce, crua	Verduras, Hortaliças e Derivados	1.1824	0.0126	0.0013	0.282	0.0257	0.2111	0.1689	0.0039	0.002	0.0877	0.1648	0	0	0	t	f	t	f	f
92	Batata, inglesa, crua	Verduras, Hortaliças e Derivados	0.6437	0.0177	0	0.1469	0.0116	0.0355	0.1458	0.0036	0.0024	0	0.3108	0	0	0	t	f	t	f	f
126	Inhame, cru	Verduras, Hortaliças e Derivados	0.967	0.0205	0.0021	0.2323	0.0165	0.118	0.2876	0.0036	0.003	0	0.0562	0	0.0008	0	t	f	t	f	f
\.


--
-- TOC entry 3163 (class 0 OID 18244)
-- Dependencies: 207
-- Data for Name: alimentoverduralegume; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alimentoverduralegume (codigoalim) FROM stdin;
144
157
71
98
134
107
69
73
138
139
162
65
66
67
137
145
147
148
110
113
117
142
127
101
143
130
89
92
126
75
77
78
79
80
83
84
85
108
111
115
119
135
149
150
152
153
156
74
\.


--
-- TOC entry 3165 (class 0 OID 18249)
-- Dependencies: 209
-- Data for Name: cardapios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cardapios (codigoc, nomec, funcobjcusto, funcobjerronut, quantdias) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 18253)
-- Dependencies: 210
-- Data for Name: prato_acomp_permitido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prato_acomp_permitido (codigopr, acomp_permitido) FROM stdin;
27	Nenhum
41	Nenhum
42	Nenhum
43	Nenhum
60	Arroz
61	Arroz
87	Arroz
160	Nenhum
163	Nenhum
164	Nenhum
213	Nenhum
223	Nenhum
32	Nenhum
34	Nenhum
33	Nenhum
37	Nenhum
44	Nenhum
55	Feijão
49	Arroz
53	Arroz
63	Nenhum
68	Nenhum
69	Nenhum
95	Feijão
104	Feijão
105	Nenhum
106	Nenhum
108	Nenhum
111	Feijão
109	Nenhum
120	Nenhum
126	Nenhum
200	Nenhum
201	Nenhum
202	Nenhum
204	Nenhum
229	Nenhum
230	Nenhum
28	Arroz
31	Arroz
52	Arroz
115	Feijão
107	Nenhum
26	Nenhum
173	Nenhum
113	Feijão
46	Nenhum
47	Nenhum
48	Nenhum
\.


--
-- TOC entry 3168 (class 0 OID 18259)
-- Dependencies: 212
-- Data for Name: prato_refeicao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prato_refeicao (codigor, codigopr, id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 18263)
-- Dependencies: 213
-- Data for Name: prato_tem_hortalica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prato_tem_hortalica (codigopr) FROM stdin;
50
66
80
88
90
123
138
145
176
177
178
179
180
181
182
183
184
185
186
188
189
190
267
268
269
270
272
139
141
170
205
\.


--
-- TOC entry 3170 (class 0 OID 18266)
-- Dependencies: 214
-- Data for Name: prato_tem_legume; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prato_tem_legume (codigopr) FROM stdin;
26
52
69
71
104
166
175
25
30
40
83
229
230
192
194
195
196
202
12
154
157
168
39
19
32
33
37
59
75
79
86
131
140
212
215
220
222
226
230
46
77
100
102
126
179
180
209
128
48
68
95
114
142
155
162
163
173
181
127
11
27
32
33
37
42
43
44
46
47
56
60
66
68
76
86
97
98
106
110
115
120
130
139
152
155
160
167
172
173
182
184
191
192
195
196
200
202
207
212
217
223
227
128
127
124
39
41
52
104
120
170
186
126
141
186
34
82
87
120
174
202
229
152
172
35
89
210
145
178
190
19
81
211
11
19
36
50
63
67
69
71
73
76
78
83
103
145
177
178
182
183
185
189
190
193
194
128
127
124
22
36
44
97
139
167
193
212
216
221
222
224
227
\.


--
-- TOC entry 3171 (class 0 OID 18269)
-- Dependencies: 215
-- Data for Name: prato_tem_verdura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prato_tem_verdura (codigopr) FROM stdin;
123
88
66
179
177
176
77
123
50
78
80
178
90
184
183
176
110
205
40
25
24
204
63
128
57
35
138
185
26
38
31
111
62
74
189
127
230
229
27
32
33
214
206
52
53
67
190
188
180
91
96
106
55
112
\.


--
-- TOC entry 3172 (class 0 OID 18272)
-- Dependencies: 216
-- Data for Name: prato_tem_verdura_legume; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prato_tem_verdura_legume (codigopr) FROM stdin;
11
12
19
22
25
26
27
30
32
33
34
35
36
37
39
40
41
42
43
44
46
47
48
50
52
56
59
60
63
66
67
68
69
71
73
75
76
77
78
79
81
82
83
86
87
89
95
97
98
100
102
103
104
106
110
114
115
120
124
126
127
128
130
131
139
140
141
142
145
152
154
155
157
160
162
163
166
167
168
170
172
173
174
175
177
178
179
180
181
182
183
184
185
186
189
190
191
192
193
194
195
196
200
202
207
209
210
211
212
215
216
217
220
221
222
223
224
226
227
229
230
24
31
38
53
55
57
62
74
80
88
90
91
96
111
112
123
138
176
188
204
205
206
214
\.


--
-- TOC entry 3173 (class 0 OID 18275)
-- Dependencies: 217
-- Data for Name: prato_tem_verdura_legume_entrada; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prato_tem_verdura_legume_entrada (codigopr) FROM stdin;
24
25
26
50
56
66
80
83
86
88
90
91
100
123
138
139
141
142
145
166
170
175
176
177
178
179
180
181
182
183
184
185
186
188
189
190
192
193
205
206
212
214
217
222
79
168
89
174
220
226
131
215
\.


--
-- TOC entry 3188 (class 0 OID 18718)
-- Dependencies: 232
-- Data for Name: prato_verdura_legume_lc_dn; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prato_verdura_legume_lc_dn (codigopr) FROM stdin;
11
25
26
27
32
33
34
35
36
37
39
40
44
50
56
59
66
67
69
71
75
79
81
83
86
87
89
95
97
100
104
114
120
126
131
139
140
141
142
145
152
154
155
157
162
163
166
167
168
170
173
174
175
177
178
179
180
181
182
183
184
185
186
189
190
191
192
193
194
195
196
202
211
212
215
217
220
221
222
224
226
227
24
38
55
80
88
90
91
112
123
138
176
188
205
206
214
48
\.


--
-- TOC entry 3175 (class 0 OID 18280)
-- Dependencies: 219
-- Data for Name: pratos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pratos (codigopr, nomepr, tipopr, consistenciapr, corpr, presencaferroheme, fontevitc, ref) FROM stdin;
14	Bolo de Banana	Pão/Cereal	SS	Marrom	f	f	1
15	Arroz Doce com Coco	Sobremesa	LP	Branco	f	f	1
16	Salada de Frutas	Sobremesa	SS	Laranja	f	f	1
17	Pão com Molho de Salsicha	Pão/Cereal	SS	Vermelho	t	f	1
18	Falso Danete	Laticínios	LP	Marrom	f	f	1
20	Vitamina de Banana e Mamão	Laticínios	LP	Laranja	f	f	1
21	Muxá de Canjiquinha	Sobremesa	SS	Amarelo	f	f	1
24	Bambá de Couve	Entrada	LP	Amarelo	f	f	1
25	Creme de Abóbora com Milho Verde	Entrada	LP	Laranja	f	f	1
29	Mingau de Fubá com Banana	Laticínios	LP	Amarelo	f	f	1
30	Mingau de Abóbora com Milho Verde	Laticínios	LP	Laranja	f	f	1
32	Sopa Minestrone	Principal	LP	Laranja	t	f	1
33	Sopa de Macarrão com Hortaliças e Carne Moída	Principal	LP	Laranja	t	f	1
34	Sopa de Inhame com Frango	Principal	LP	Branco	t	f	1
35	Vaca Atolada	Principal	LP	Amarelo	t	f	1
36	Torta Colorida de Frango, Tomate e Vagem	Principal	SS	Laranja	t	f	1
37	Sopa Cremosa de Batata, Cenoura e Frango	Principal	LP	Amarelo	t	f	1
38	Bambá de Couve com Carne	Principal	LP	Amarelo	t	f	1
40	Creme de Abóbora com Milho Verde e Frango 	Principal	LP	Laranja	t	f	1
44	Arroz à Grega com Frango	Principal	SS	Laranja	t	f	1
46	Arroz Colorido com Carne Moída	Principal	SS	Laranja	t	f	1
47	Arroz com Banana e Carne	Principal	SS	Marrom	t	f	1
48	Arroz com Brócolis e Frango	Principal	SS	Branco	t	f	1
49	Feijoada Light	Principal	SS	Marrom	t	f	1
50	Salada de Alface com Tomate	Entrada	SS	Verde	f	f	1
51	Laranja	Fruta	SS	Amarelo	f	f	1
53	Farofa de Feijão	Principal	SS	Marrom	t	f	1
54	Mamão	Fruta	SS	Laranja	f	f	1
55	Arroz com Taioba e Frango	Principal	SS	Verde	t	f	1
56	Salada de Cenoura	Entrada	SS	Laranja	f	f	1
57	Arroz Verde e Amarelo	Arroz	SS	Verde	f	f	1
58	Almôndegas de Soja ao Molho	Principal	SS	Vermelho	f	f	1
62	Farofa com Carne, Ovos e Couve	Principal	SS	Amarelo	t	f	1
63	Baião de Três	Principal	SS	Marrom	t	f	1
64	Feijão Carioca Simples	Feijão	SS	Marrom	f	f	1
65	Feijão Carioca Batido	Feijão	LP	Marrom	f	f	1
66	Salada de Acelga e Cenoura	Entrada	SS	Verde	f	f	1
68	Salada de Macarrão	Principal	SS	Amarelo	t	f	1
69	Risoto de Abóbora com Carne de Sol	Principal	LP	Laranja	t	f	1
70	Banana Caramelizada	Sobremesa	SS	Amarelo	f	f	1
71	Quibebe com Molho de Carne	Principal	LP	Laranja	t	f	1
72	Melancia	Fruta	SS	Vermelho	f	f	1
73	Moqueca de Banana com Frango	Principal	LP	Amarelo	t	f	1
74	Arroz Popeye	Arroz	SS	Verde	f	f	1
75	Purê de Batata com Frango	Principal	SS	Amarelo	t	f	1
78	Pão com Queijo Minas	Pão/Cereal	SS	Amarelo	f	f	1
79	Purê de Batata	Entrada	LP	Branco	f	f	1
80	Salada de Alface	Entrada	SS	Verde	f	f	1
83	Quibebe	Entrada	LP	Laranja	f	f	1
84	Leite Caramelado	Laticínios	LP	Marrom	f	f	1
85	Caqui	Fruta	SS	Vermelho	f	f	1
88	Salada de Acelga	Entrada	SS	Verde	f	f	1
90	Salada de Almeirão	Entrada	SS	Verde	f	f	1
92	Ovos Mexidos	Principal	SS	Amarelo	f	f	1
94	Arroz com Lentilha	Arroz	SS	Branco	f	f	1
95	Arroz com Linguica e Brócolis	Principal	SS	Branco	t	f	1
96	Arroz com Ovos Mexidos	Arroz	SS	Branco	f	f	1
97	Arroz á Grega	Arroz	SS	Branco	f	f	1
98	Arroz Colorido	Arroz	SS	Laranja	f	f	1
100	Salada de Beterraba	Entrada	SS	Roxo	f	f	1
101	Pão com Ovos Mexidos	Pão/Cereal	SS	Amarelo	f	f	1
103	Moqueca de Banana com Tilápia	Principal	LP	Amarelo	t	f	1
104	Arroz com molho de carne e hortaliças	Principal	SS	Vermelho	t	f	1
105	Macarronada a Bolonhesa	Principal	SS	Vermelho	t	f	1
106	Macarrão Oriental	Principal	SS	Vermelho	t	f	1
108	Macarrão ao Molho de Frango 	Principal	SS	Vermelho	t	f	1
109	Farofão de Arroz com Banana, Ovos e Carne	Principal	SS	Amarelo	t	f	1
111	Arroz Verde e Amarelo com Carne	Principal	SS	Verde	t	f	1
112	Arroz com Taioba	Arroz	SS	Verde	f	f	1
113	Arroz com Lentilha e Linguica	Principal	SS	Branco	t	f	1
114	Arroz com Brócolis	Arroz	SS	Branco	f	f	1
115	Arroz com Carne	Principal	SS	Marrom	t	f	1
136	Biscoito Maisena com Requeijão	Pão/Cereal	SS	Amarelo	f	f	2
138	Salada de Couve	Entrada	SS	Verde	f	f	2
143	Bolo de Chocolate (mistura)	Pão/Cereal	SS	Marrom	f	f	2
144	Vitamina de Banana e aveia	Laticínios	LP	Branco	f	f	2
145	Salada de Pepino com Tomate	Entrada	SS	Verde	f	f	2
146	Vitamina de banana, maça e mamão com aveia	Laticínios	LP	Laranja	f	f	2
147	Mingau de Chocolate	Laticínios	LP	Marrom	f	f	2
148	Vitamina de Banana e maçã	Laticínios	LP	Branco	f	f	2
149	Biscoito Cream Cracker com Manteiga	Pão/Cereal	SS	Amarelo	f	f	2
167	Arroz primavera (arroz, vagem, cenoura e milho)	Arroz	SS	Laranja	f	f	2
169	Pudim de Morango (mistura)	Sobremesa	SS	Vermelho	f	f	2
176	Salada de acelga com chicória	Entrada	SS	Verde	f	f	2
177	Salada de acelga com tomate	Entrada	SS	Verde	f	f	2
178	Salada de alface, tomate e pepino	Entrada	SS	Verde	f	f	2
179	Salada de beterraba com acelga	Entrada	SS	Roxo	f	f	2
180	Salada de beterraba com repolho	Entrada	SS	Roxo	f	f	2
181	Salada de brócolis	Entrada	SS	Verde	f	f	2
182	Salada de cenoura com tomate	Entrada	SS	Verde	f	f	2
183	Salada de chicória com tomate	Entrada	SS	Verde	f	f	2
184	Salada de chicória com cenoura	Entrada	SS	Verde	f	f	2
185	Salada de couve com tomate	Entrada	SS	Verde	f	f	2
186	Salada de couve-flor com chuchu	Entrada	SS	Verde	f	f	2
187	Pudim de Chocolate (mistura)	Sobremesa	SS	Marrom	f	f	2
194	Torta de carne moída com legumes (abobrinha, tomate e milho) com requeijão	Principal	SS	Marrom	t	f	2
197	Bolo de Baunilha (mistura)	Pão/Cereal	SS	Branco	f	f	2
198	Bolo de Laranja (mistura)	Pão/Cereal	SS	Laranja	f	f	2
199	Bolo de Fubá com Queijo	Pão/Cereal	SS	Amarelo	f	f	2
19	Bacalhoada 	Principal	SS	Amarelo	t	f	1
22	Polenta à Jardineira	Principal	LP	Amarelo	t	f	1
23	Polenta à Bolonhesa	Principal	LP	Amarelo	t	f	1
27	Canjiquinha com Músculo e Hortaliças	Principal	LP	Amarelo	t	f	1
41	Canjiquinha com Tutu de Feijão	Principal	LP	Amarelo	t	f	1
42	Mexidão com Carne	Principal	SS	Laranja	t	f	1
43	Mexidão com Frango	Principal	SS	Laranja	t	f	1
45	Arroz Simples	Arroz	SS	Branco	f	f	1
59	Carne moída com Batatas	Principal	SS	Marrom	t	f	1
60	Cuscuz com Sardinha	Principal	SS	Amarelo	t	f	1
61	Estrogonofe de Frango	Principal	SS	Vermelho	t	f	1
67	Torta Colorida de Carne Moída, Repolho e Tomate	Principal	SS	Laranja	t	f	1
76	Pão com Atum	Pão/Cereal	SS	Amarelo	t	f	1
77	Pão com Molho de Frango	Pão/Cereal	SS	Amarelo	t	f	1
81	Carne moída com Quiabo	Principal	SS	Laranja	t	f	1
82	Quibe de Forno	Principal	SS	Marrom	t	f	1
87	Escondidinho de Carne e Inhame	Principal	LP	Amarelo	t	f	1
102	Pão com Molho de Carne	Pão/Cereal	SS	Amarelo	t	f	1
134	Mingau de Aveia	Laticínios	LP	Branco	f	f	2
140	Filé de Tilápia assado com batata, pimentão e tomate	Principal	SS	Amarelo	t	f	2
150	Mexerica	Fruta	SS	Laranja	f	f	2
151	Carne de Panela	Principal	SS	Marrom	t	f	2
152	Carne bovina moída com cenoura e jiló	Principal	SS	Marrom	t	f	2
153	Coxa e sobrecoxa ao molho	Principal	SS	Marrom	t	f	2
154	Coxa e sobrecoxa assada com batata doce	Principal	SS	Marrom	t	f	2
155	Cubos bovinos xadrez (cenoura, repolho, brócolis e cebola)	Principal	SS	Marrom	t	f	2
156	Filé de tilápia ao molho com tomate	Principal	SS	Vermelho	t	f	2
157	Filé de tilápia assada com batata doce	Principal	SS	Amarelo	t	f	2
158	Filé de frango grelhado	Principal	SS	Marrom	t	f	2
159	Frango em cubos refogado	Principal	SS	Marrom	t	f	2
160	Galinhada (com milho e cenoura)	Principal	SS	Marrom	t	f	2
161	Isca de lombo suíno acebolada	Principal	SS	Marrom	t	f	2
162	Isca de lombo suíno com brócolis	Principal	SS	Verde	t	f	2
163	Macarrão com frango, molho branco e brócolis	Principal	SS	Branco	t	f	2
164	Macarrão ao molho vermelho com frango	Principal	SS	Vermelho	t	f	2
165	Picadinho de carne bovina acebolado	Principal	SS	Marrom	t	f	2
191	Torta de Carne moída, com queijo e legumes (cenoura, milho, abobrinha e jiló)	Principal	SS	Marrom	t	f	2
195	Torta de Frango com Queijo, Requeijão e Legumes (cenoura, milho e abobrinha) 	Principal	SS	Amarelo	t	f	2
120	Sopa de Macarrão com Frango e Legumes(chuchu, inhame e cenoura)	Principal	SS	Vermelho	t	f	2
122	Pudim de Baunilha (mistura)	Sobremesa	SS	Branco	f	f	2
126	Sopa de Macarrão com carne moída e legumes(batata aipo, couve-flor e beterraba )	Principal	SS	Vermelho	t	f	2
196	Torta de Frango Requeijão e Legumes (cenoura, milho e abobrinha) 	Principal	SS	Amarelo	t	f	2
200	Canja de frango	Principal	LP	Marrom	t	f	2
201	Escaldado de fubá com carne bovina moída	Principal	LP	Marrom	t	f	2
202	Sopa de macarrão com carne moída e legumes	Principal	LP	Vermelho	t	f	2
203	Almôndegas ao Molho	Principal	SS	Vermelho	t	f	3
204	Arroz Carreteiro	Principal	SS	Marrom	t	f	3
207	Carne Colorida	Principal	SS	Vermelho	t	f	3
208	Frango com milho	Principal	SS	Amarelo	t	f	3
210	Bobó de Frango	Principal	LP	Amarelo	t	f	3
211	Frango com Quiabo	Principal	SS	Verde	t	f	3
213	Risoto de Frango	Principal	SS	Branco	t	f	3
216	Frango Brasileirinho	Principal	SS	Vermelho	t	f	3
223	Risoto Marinheiro	Principal	SS	Branco	t	f	3
229	Sopa de Feijão Preto com Carne	Principal	SS	Marrom	t	f	3
230	Sopa Paulista	Principal	SS	Marrom	t	f	3
116	Mingau de Maisena	Laticínios	LP	Amarelo	f	f	2
117	Abacate	Fruta	SS	Verde	f	f	2
118	Rosquinha de Coco	Pão/Cereal	SS	Marrom	f	f	2
119	Queijo em cubos	Pão/Cereal	SS	Branco	f	f	2
121	Vitamina de banana, maça e mamão	Laticínios	LP	Laranja	f	f	2
123	Salada de Acelga com Alface	Entrada	SS	Verde	f	f	2
125	Iogurte de Morango	Laticínios	LP	Vermelho	f	f	2
129	Gelatina de Uva (mistura)	Sobremesa	SS	Roxo	f	f	2
131	Batata Rústica	Entrada	SS	Amarelo	f	f	2
132	Leite com Farinha Láctea	Laticínios	LP	Branco	f	f	2
133	Gelatina de Morango (mistura)	Sobremesa	SS	Vermelho	f	f	2
135	Biscoito Cream Cracker com Requeijão	Pão/Cereal	SS	Amarelo	f	f	2
214	Salada Girassol	Entrada	SS	Verde	f	f	3
218	Feijão Fradinho	Feijão	SS	Marrom	f	f	3
221	Arroz com Vagem	Arroz	SS	Branco	f	f	3
224	Ovos Mexidos com Vagem	Principal	SS	Amarelo	f	f	3
225	Ovo Cozido	Principal	SS	Branco	f	f	3
227	Omelete de Legumes	Principal	SS	Amarelo	f	f	3
231	Pão de Forma com Requeijão	Pão/Cereal	SS	Amarelo	f	f	3
232	Pão de Forma com Margarina	Pão/Cereal	SS	Amarelo	f	f	3
235	Milho Verde	Sobremesa	SS	Amarelo	f	f	3
236	Tangerina	Fruta	SS	Laranja	f	f	3
237	Abacaxi	Fruta	SS	Amarelo	f	f	3
124	Bolo Salgado de Arroz	Principal	SS	Amarelo	t	f	2
127	Torta de Arroz Nutritiva	Principal	SS	Amarelo	t	f	2
128	Farofa Nutritiva	Principal	SS	Laranja	t	f	2
130	Farofa de Cenoura	Entrada	SS	Amarelo	f	f	2
139	Vagem e cenoura cozidas	Entrada	SS	Laranja	f	f	2
141	Couve-flor gratinada	Entrada	SS	Branco	f	f	2
142	Legumes Sauté (Batata Aipo e Brócolis)	Entrada	SS	Amarelo	f	f	2
166	Abóbora cabotiá refogada	Entrada	SS	Laranja	f	f	2
168	Batata doce refogada	Entrada	SS	Amarelo	f	f	2
1	Café com Leite	Laticínios	LP	Marrom	f	f	1
2	Pão com Margarina	Pão/Cereal	SS	Amarelo	f	f	1
3	Goiaba Vermelha	Fruta	SS	Vermelho	f	f	1
4	Canjica com Coco Ralado	Sobremesa	LP	Branco	f	f	1
5	Leite Achocolatado	Laticínios	LP	Marrom	f	f	1
6	Biscoito Maisena	Pão/Cereal	SS	Amarelo	f	f	1
7	Biscoito Cream Cracker	Pão/Cereal	SS	Amarelo	f	f	1
8	Banana	Fruta	SS	Amarelo	f	f	1
9	Maçã	Fruta	SS	Vermelho	f	f	1
10	Vitamina de Abacate	Laticínios	LP	Verde	f	f	1
11	Torta Colorida de Salsicha, Tomate e Cenoura	Principal	SS	Vermelho	t	f	1
12	Bolo Nutritivo	Pão/Cereal	SS	Marrom	f	f	1
13	Bolo de Cenoura	Pão/Cereal	SS	Laranja	f	f	1
26	Sopa de Feijão (macarrão e abóbora)	Principal	LP	Marrom	f	f	1
28	Tutu de Feijão Carioca	Principal	LP	Marrom	t	f	1
31	Feijão Tropeiro Carioca	Principal	SS	Marrom	t	f	1
39	Torta Saborosa de batata-doce com peixe	Principal	SS	Amarelo	t	f	1
52	Feijão Maravilha	Principal	SS	Marrom	t	f	1
86	Batata e Cenoura Cozidas	Entrada	SS	Laranja	f	f	1
89	Mandioca Cozida	Entrada	SS	Amarelo	f	f	1
91	Refogado de Legumes	Entrada	SS	Verde	f	f	1
93	Feijão Preto Batido	Feijão	LP	Preto	f	f	1
99	Feijão Preto Simples	Feijão	SS	Preto	f	f	1
107	Macarrão ao Molho de Sardinha	Principal	SS	Vermelho	t	f	1
110	Farofa de Soja	Entrada	SS	Amarelo	f	f	1
170	Chuchu refogado	Entrada	SS	Verde	f	f	2
171	Creme de milho	Entrada	LP	Amarelo	f	f	2
172	Farofa de cenoura com jiló	Entrada	SS	Amarelo	f	f	2
173	Macarrão primavera (com brócolis, cenoura e milho)	Principal	SS	Amarelo	f	f	2
174	Purê de inhame	Entrada	LP	Amarelo	f	f	2
175	Purê de abóbora cabotiá	Entrada	LP	Laranja	f	f	2
188	Salada de repolho	Entrada	SS	Branco	f	f	2
189	Salada de repolho com tomate	Entrada	SS	Branco	f	f	2
190	Salada de repolho com tomate e pepino	Entrada	SS	Branco	f	f	2
192	Torta de legumes (cenoura, milho e abobrinha) com requeijão	Entrada	SS	Verde	f	f	2
193	Torta de legumes (vagem, tomate e milho) com requeijão	Entrada	SS	Verde	f	f	2
205	Couve à Mineira	Entrada	SS	Verde	f	f	3
206	Repolho à Mineira	Entrada	SS	Verde	f	f	3
209	Farofa de Beterraba	Entrada	SS	Roxo	f	f	3
212	Salada Mista (batata, cenoura e vagem)	Entrada	SS	Laranja	f	f	3
215	Batata Sauté	Entrada	SS	Amarelo	f	f	3
217	Cenoura Sauté	Entrada	SS	Laranja	f	f	3
219	Farofa de Banana	Entrada	SS	Amarelo	f	f	3
220	Batata com Orégano	Entrada	SS	Amarelo	f	f	3
226	Batata em Camadas	Entrada	SS	Amarelo	f	f	3
228	Iscas de Fígado	Principal	SS	Vermelho	t	f	3
222	Batata e Vagem cozidas	Entrada	SS	Verde	f	f	3
137	Suco Natural de Abacaxi	Suco	LP	Amarelo	f	f	2
234	Suco Natural de Laranja	Suco	LP	Amarelo	f	t	2
\.


--
-- TOC entry 3176 (class 0 OID 18287)
-- Dependencies: 220
-- Data for Name: pratos_combinacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pratos_combinacao (codigopr, codigopr1) FROM stdin;
49	138
160	65
213	50
223	50
69	50
\.


--
-- TOC entry 3177 (class 0 OID 18290)
-- Dependencies: 221
-- Data for Name: pratos_princ_sozinhos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pratos_princ_sozinhos (codigopr) FROM stdin;
32
33
34
37
68
105
106
107
108
109
120
126
163
164
202
229
230
27
41
160
200
42
43
173
26
44
46
47
48
63
201
204
\.


--
-- TOC entry 3178 (class 0 OID 18293)
-- Dependencies: 222
-- Data for Name: pratos_rejeicao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pratos_rejeicao (codigopr, codigopr1) FROM stdin;
130	62
130	109
172	62
172	109
209	62
209	109
219	62
219	109
175	75
174	75
\.


--
-- TOC entry 3179 (class 0 OID 18296)
-- Dependencies: 223
-- Data for Name: pratosresumo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pratosresumo (codigopr, nomepr, tipopr, consistenciapr, corpr, presencaferroheme, temverduralegumeentrada, servidosozinho) FROM stdin;
19	Bacalhoada 	Principal	SS	Amarelo	t	f	f
22	Polenta à Jardineira	Principal	LP	Amarelo	t	f	f
23	Polenta à Bolonhesa	Principal	LP	Amarelo	t	f	f
59	Carne moída com Batatas	Principal	SS	Marrom	t	f	f
60	Cuscuz com Sardinha	Principal	SS	Amarelo	t	f	f
61	Estrogonofe de Frango	Principal	SS	Vermelho	t	f	f
67	Torta Colorida de Carne Moída, Repolho e Tomate	Principal	SS	Laranja	t	f	f
76	Pão com Atum	Pão/Cereal	SS	Amarelo	t	f	f
77	Pão com Molho de Frango	Pão/Cereal	SS	Amarelo	t	f	f
81	Carne moída com Quiabo	Principal	SS	Laranja	t	f	f
82	Quibe de Forno	Principal	SS	Marrom	t	f	f
87	Escondidinho de Carne e Inhame	Principal	LP	Amarelo	t	f	f
102	Pão com Molho de Carne	Pão/Cereal	SS	Amarelo	t	f	f
140	Filé de Tilápia assado com batata, pimentão e tomate	Principal	SS	Amarelo	t	f	f
151	Carne de Panela	Principal	SS	Marrom	t	f	f
152	Carne bovina moída com cenoura e jiló	Principal	SS	Marrom	t	f	f
153	Coxa e sobrecoxa ao molho	Principal	SS	Marrom	t	f	f
154	Coxa e sobrecoxa assada com batata doce	Principal	SS	Marrom	t	f	f
155	Cubos bovinos xadrez (cenoura, repolho, brócolis e cebola)	Principal	SS	Marrom	t	f	f
156	Filé de tilápia ao molho com tomate	Principal	SS	Vermelho	t	f	f
157	Filé de tilápia assada com batata doce	Principal	SS	Amarelo	t	f	f
207	Carne Colorida	Principal	SS	Vermelho	t	f	f
260	Legumes na Manteiga (batata doce e inglesa, chuchu, cenoura )	Entrada	SS	Laranja	f	t	f
205	Couve à Mineira	Entrada	SS	Verde	f	t	f
110	Farofa de Soja	Principal	SS	Amarelo	f	t	f
26	Sopa de Feijão (macarrão e abóbora)	Principal	LP	Marrom	f	t	f
130	Farofa de Cenoura	Principal	SS	Amarelo	f	t	f
172	Farofa de cenoura com jiló	Principal	SS	Amarelo	f	t	f
175	Purê de abóbora cabotiá	Principal	LP	Laranja	f	t	f
193	Torta de legumes (vagem, tomate e milho) com requeijão	Principal	SS	Verde	f	t	f
209	Farofa de Beterraba	Principal	SS	Roxo	f	t	f
266	Purê de Batata com Abóbora	Principal	LP	Laranja	f	t	f
128	Farofa Nutritiva	Principal	SS	Laranja	t	t	f
192	Torta de legumes (cenoura, milho e abobrinha) com requeijão	Principal	SS	Verde	f	t	f
158	Filé de frango grelhado	Principal	SS	Marrom	t	f	f
159	Frango em cubos refogado	Principal	SS	Marrom	t	f	f
161	Isca de lombo suíno acebolada	Principal	SS	Marrom	t	f	f
162	Isca de lombo suíno com brócolis	Principal	SS	Verde	t	f	f
165	Picadinho de carne bovina acebolado	Principal	SS	Marrom	t	f	f
191	Torta de Carne moída, com queijo e legumes (cenoura, milho, abobrinha e jiló)	Principal	SS	Marrom	t	f	f
195	Torta de Frango com Queijo, Requeijão e Legumes (cenoura, milho e abobrinha) 	Principal	SS	Amarelo	t	f	f
196	Torta de Frango Requeijão e Legumes (cenoura, milho e abobrinha) 	Principal	SS	Amarelo	t	f	f
203	Almôndegas ao Molho	Principal	SS	Vermelho	t	f	f
208	Frango com milho	Principal	SS	Amarelo	t	f	f
210	Bobó de Frango	Principal	LP	Amarelo	t	f	f
211	Frango com Quiabo	Principal	SS	Verde	t	f	f
213	Risoto de Frango	Principal	SS	Branco	t	f	f
216	Frango Brasileirinho	Principal	SS	Vermelho	t	f	f
174	Purê de inhame	Principal	LP	Amarelo	f	f	f
223	Risoto Marinheiro	Principal	SS	Branco	t	f	f
238	Carne desfiada com mandioca	Principal	SS	Vermelho	t	f	f
239	Almôndega	Principal	SS	Marrom	t	f	f
122	Pudim de Baunilha (mistura)	Sobremesa	SS	Branco	f	f	f
3	Goiaba Vermelha	Fruta	SS	Vermelho	f	f	f
35	Vaca Atolada	Principal	LP	Amarelo	t	f	f
36	Torta Colorida de Frango, Tomate e Vagem	Principal	SS	Laranja	t	f	f
38	Bambá de Couve com Carne	Principal	LP	Amarelo	t	f	f
40	Creme de Abóbora com Milho Verde e Frango 	Principal	LP	Laranja	t	f	f
44	Arroz à Grega com Frango	Principal	SS	Laranja	t	f	f
47	Arroz com Banana e Carne	Principal	SS	Marrom	t	f	f
48	Arroz com Brócolis e Frango	Principal	SS	Branco	t	f	f
55	Arroz com Taioba e Frango	Principal	SS	Verde	t	f	f
49	Feijoada Light	Principal	SS	Marrom	t	f	f
53	Farofa de Feijão	Principal	SS	Marrom	t	f	f
62	Farofa com Carne, Ovos e Couve	Principal	SS	Amarelo	t	f	f
63	Baião de Três	Principal	SS	Marrom	t	f	f
69	Risoto de Abóbora com Carne de Sol	Principal	LP	Laranja	t	f	f
71	Quibebe com Molho de Carne	Principal	LP	Laranja	t	f	f
73	Moqueca de Banana com Frango	Principal	LP	Amarelo	t	f	f
56	Salada de Cenoura	Entrada	SS	Laranja	f	t	f
100	Salada de Beterraba	Entrada	SS	Roxo	f	t	f
24	Bambá de Couve	Entrada	LP	Amarelo	f	t	f
25	Creme de Abóbora com Milho Verde	Entrada	LP	Laranja	f	t	f
83	Quibebe	Entrada	LP	Laranja	f	t	f
50	Salada de Alface com Tomate	Entrada	SS	Verde	f	t	f
250	Ensopado de Frango	Principal	LP	Amarelo	t	f	f
251	Ensopado de Frango com Batata	Principal	LP	Amarelo	t	f	f
256	Frango Assado	Principal	SS	Vermelho	t	f	f
257	Frango Cozido	Principal	SS	Vermelho	t	f	f
265	Pão com Patê de Sardinha	Pão/Cereal	SS	Amarelo	t	f	f
278	Torta de Frango com Tomate e Cenoura	Principal	SS	Amarelo	t	f	f
279	Torta de Sardinha	Principal	SS	Vermelho	t	f	f
280	Torta de Carne Moída com Legumes(chuchu, cenoura e batata)	Principal	SS	Vermelho	t	f	f
2	Pão com Margarina	Pão/Cereal	SS	Amarelo	f	f	f
8	Banana	Fruta	SS	Amarelo	f	f	f
75	Purê de Batata com Frango	Principal	SS	Amarelo	t	f	f
95	Arroz com Linguica e Brócolis	Principal	SS	Branco	t	f	f
103	Moqueca de Banana com Tilápia	Principal	LP	Amarelo	t	f	f
104	Arroz com molho de carne e hortaliças	Principal	SS	Vermelho	t	f	f
111	Arroz Verde e Amarelo com Carne	Principal	SS	Verde	t	f	f
113	Arroz com Lentilha e Linguica	Principal	SS	Branco	t	f	f
201	Escaldado de fubá com carne bovina moída	Principal	LP	Marrom	t	f	f
204	Arroz Carreteiro	Principal	SS	Marrom	t	f	f
241	Arroz com Cenoura e Carne	Principal	SS	Laranja	t	f	f
243	Arroz com Carne e Abóbora	Principal	SS	Amarelo	t	f	f
246	Carne Moída com Cenoura 	Principal	SS	Vermelho	t	f	f
247	Carne Moída com Cenoura e Chuchu	Principal	SS	Vermelho	t	f	f
248	Ensopado de Carne	Principal	LP	Vermelho	t	f	f
249	Empadão de Frango	Principal	SS	Amarelo	t	f	f
4	Canjica com Coco Ralado	Sobremesa	LP	Branco	f	f	f
5	Leite Achocolatado	Laticínios	LP	Marrom	f	f	f
6	Biscoito Maisena	Pão/Cereal	SS	Amarelo	f	f	f
7	Biscoito Cream Cracker	Pão/Cereal	SS	Amarelo	f	f	f
9	Maçã	Fruta	SS	Vermelho	f	f	f
10	Vitamina de Abacate	Laticínios	LP	Verde	f	f	f
12	Bolo Nutritivo	Pão/Cereal	SS	Marrom	f	f	f
13	Bolo de Cenoura	Pão/Cereal	SS	Laranja	f	f	f
14	Bolo de Banana	Pão/Cereal	SS	Marrom	f	f	f
15	Arroz Doce com Coco	Sobremesa	LP	Branco	f	f	f
16	Salada de Frutas	Sobremesa	SS	Laranja	f	f	f
18	Falso Danete	Laticínios	LP	Marrom	f	f	f
20	Vitamina de Banana e Mamão	Laticínios	LP	Laranja	f	f	f
21	Muxá de Canjiquinha	Sobremesa	SS	Amarelo	f	f	f
17	Pão com Molho de Salsicha	Pão/Cereal	SS	Vermelho	t	f	f
29	Mingau de Fubá com Banana	Laticínios	LP	Amarelo	f	f	f
30	Mingau de Abóbora com Milho Verde	Laticínios	LP	Laranja	f	f	f
45	Arroz Simples	Arroz	SS	Branco	f	f	f
51	Laranja	Fruta	SS	Amarelo	f	f	f
54	Mamão	Fruta	SS	Laranja	f	f	f
57	Arroz Verde e Amarelo	Arroz	SS	Verde	f	f	f
58	Almôndegas de Soja ao Molho	Principal	SS	Vermelho	f	f	f
64	Feijão Carioca Simples	Feijão	SS	Marrom	f	f	f
65	Feijão Carioca Batido	Feijão	LP	Marrom	f	f	f
70	Banana Caramelizada	Sobremesa	SS	Amarelo	f	f	f
72	Melancia	Fruta	SS	Vermelho	f	f	f
74	Arroz Popeye	Arroz	SS	Verde	f	f	f
78	Pão com Queijo Minas	Pão/Cereal	SS	Amarelo	f	f	f
84	Leite Caramelado	Laticínios	LP	Marrom	f	f	f
85	Caqui	Fruta	SS	Vermelho	f	f	f
92	Ovos Mexidos	Principal	SS	Amarelo	f	f	f
94	Arroz com Lentilha	Arroz	SS	Branco	f	f	f
96	Arroz com Ovos Mexidos	Arroz	SS	Branco	f	f	f
97	Arroz á Grega	Arroz	SS	Branco	f	f	f
98	Arroz Colorido	Arroz	SS	Laranja	f	f	f
101	Pão com Ovos Mexidos	Pão/Cereal	SS	Amarelo	f	f	f
194	Torta de carne moída com legumes (abobrinha, tomate e milho) com requeijão	Principal	SS	Marrom	t	f	f
112	Arroz com Taioba	Arroz	SS	Verde	f	f	f
114	Arroz com Brócolis	Arroz	SS	Branco	f	f	f
116	Mingau de Maisena	Laticínios	LP	Amarelo	f	f	f
117	Abacate	Fruta	SS	Verde	f	f	f
118	Rosquinha de Coco	Pão/Cereal	SS	Marrom	f	f	f
119	Queijo em cubos	Pão/Cereal	SS	Branco	f	f	f
121	Vitamina de banana, maça e mamão	Laticínios	LP	Laranja	f	f	f
125	Iogurte de Morango	Laticínios	LP	Vermelho	f	f	f
129	Gelatina de Uva (mistura)	Sobremesa	SS	Roxo	f	f	f
11	Torta Colorida de Salsicha, Tomate e Cenoura	Principal	SS	Vermelho	t	f	f
244	Caldo de Batata	Principal	LP	Amarelo	t	f	f
245	Caldo de Mandioca	Principal	LP	Amarelo	t	f	f
252	Escondidinho de Carne com Batata	Principal	LP	Amarelo	t	f	f
253	Escondidinho de Carne com Mandioca	Principal	LP	Amarelo	t	f	f
254	Farofa de Abóbora com Carne Moída	Principal	SS	Amarelo	t	f	f
255	Farofa de Cuscuz com Carne	Principal	SS	Vermelho	t	f	f
214	Salada Girassol	Entrada	SS	Verde	f	t	f
138	Salada de Couve	Entrada	SS	Verde	f	t	f
145	Salada de Pepino com Tomate	Entrada	SS	Verde	f	t	f
176	Salada de acelga com chicória	Entrada	SS	Verde	f	t	f
284	Bolo de Milho em Flocos	Pão/Cereal	SS	Amarelo	f	f	f
197	Bolo de Baunilha (mistura)	Pão/Cereal	SS	Branco	f	f	f
198	Bolo de Laranja (mistura)	Pão/Cereal	SS	Laranja	f	f	f
199	Bolo de Fubá com Queijo	Pão/Cereal	SS	Amarelo	f	f	f
218	Feijão Fradinho	Feijão	SS	Marrom	f	f	f
221	Arroz com Vagem	Arroz	SS	Branco	f	f	f
224	Ovos Mexidos com Vagem	Principal	SS	Amarelo	f	f	f
225	Ovo Cozido	Principal	SS	Branco	f	f	f
227	Omelete de Legumes	Principal	SS	Amarelo	f	f	f
231	Pão de Forma com Requeijão	Pão/Cereal	SS	Amarelo	f	f	f
232	Pão de Forma com Margarina	Pão/Cereal	SS	Amarelo	f	f	f
235	Milho Verde	Sobremesa	SS	Amarelo	f	f	f
236	Tangerina	Fruta	SS	Laranja	f	f	f
237	Abacaxi	Fruta	SS	Amarelo	f	f	f
240	Arroz com Cenoura	Arroz	SS	Laranja	f	f	f
242	Arroz com Cenoura e Milho	Arroz	SS	Laranja	f	f	f
281	Biscoito de Polvilho	Pão/Cereal	SS	Amarelo	f	f	f
282	Bolo de Aipim	Pão/Cereal	SS	Amarelo	f	f	f
283	Bolo de Cenoura com Calda de Chocolate	Pão/Cereal	SS	Laranja	f	f	f
285	Bolo de Trigo	Pão/Cereal	SS	Branco	f	f	f
286	Melão	Fruta	SS	Amarelo	f	f	f
287	Manga	Fruta	SS	Amarelo	f	f	f
288	Mingau de Farinha de Arroz	Laticínios	LP	Amarelo	f	f	f
289	Mingau de Fubá	Laticínios	LP	Amarelo	f	f	f
290	Mingau de Tapioca	Laticínios	LP	Branco	f	f	f
291	Rapadura	Sobremesa	SS	Marrom	f	f	f
292	Torta de Abacaxi	Sobremesa	SS	Amarelo	f	f	f
293	Vitamina de Banana, Mamão e Aveia	Laticínios	LP	Laranja	f	f	f
294	Vitamina de Banana com Aveia e Achocolatado	Laticínios	LP	Marrom	f	f	f
295	Iogurte de Abacaxi	Laticínios	LP	Branco	f	f	f
131	Batata Rústica	Entrada	SS	Amarelo	f	f	f
296	Iogurte de Pêssego	Laticínios	LP	Laranja	f	f	f
297	Iogurte de Coco	Laticínios	LP	Branco	f	f	f
298	Iogurte de Maça Verde	Laticínios	LP	Verde	f	f	f
299	Gelatina de Limão (mistura)	Sobremesa	SS	Verde	f	f	f
300	Gelatina de Abacaxi (mistura)	Sobremesa	SS	Amarelo	f	f	f
28	Tutu de Feijão Carioca	Principal	LP	Marrom	t	f	f
31	Feijão Tropeiro Carioca	Principal	SS	Marrom	t	f	f
52	Feijão Maravilha	Principal	SS	Marrom	t	f	f
39	Torta Saborosa de batata-doce com peixe	Principal	SS	Amarelo	t	f	f
124	Bolo Salgado de Arroz	Principal	SS	Amarelo	t	f	f
127	Torta de Arroz Nutritiva	Principal	SS	Amarelo	t	f	f
89	Mandioca Cozida	Entrada	SS	Amarelo	f	f	f
258	Frigideira de Chuchu com Carne Moída	Principal	SS	Verde	t	f	f
259	Frigideira de Repolho com Carne Moída	Principal	SS	Verde	t	f	f
271	Salpicão Simples	Principal	SS	Laranja	t	f	f
115	Arroz com Carne	Principal	SS	Marrom	t	f	f
46	Arroz Colorido com Carne Moída	Principal	SS	Laranja	t	f	f
66	Salada de Acelga e Cenoura	Entrada	SS	Verde	f	t	f
80	Salada de Alface	Entrada	SS	Verde	f	t	f
88	Salada de Acelga	Entrada	SS	Verde	f	t	f
90	Salada de Almeirão	Entrada	SS	Verde	f	t	f
123	Salada de Acelga com Alface	Entrada	SS	Verde	f	t	f
177	Salada de acelga com tomate	Entrada	SS	Verde	f	t	f
178	Salada de alface, tomate e pepino	Entrada	SS	Verde	f	t	f
179	Salada de beterraba com acelga	Entrada	SS	Roxo	f	t	f
180	Salada de beterraba com repolho	Entrada	SS	Roxo	f	t	f
181	Salada de brócolis	Entrada	SS	Verde	f	t	f
182	Salada de cenoura com tomate	Entrada	SS	Verde	f	t	f
183	Salada de chicória com tomate	Entrada	SS	Verde	f	t	f
184	Salada de chicória com cenoura	Entrada	SS	Verde	f	t	f
185	Salada de couve com tomate	Entrada	SS	Verde	f	t	f
186	Salada de couve-flor com chuchu	Entrada	SS	Verde	f	t	f
188	Salada de repolho	Entrada	SS	Branco	f	t	f
189	Salada de repolho com tomate	Entrada	SS	Branco	f	t	f
190	Salada de repolho com tomate e pepino	Entrada	SS	Branco	f	t	f
267	Salada de Beterraba com Tomate	Entrada	SS	Roxo	f	t	f
268	Salada de Alface, cenoura e milho	Entrada	SS	Laranja	f	t	f
269	Salada de Tomate	Entrada	SS	Vermelho	f	t	f
270	Salada de Alface com cenoura	Entrada	SS	Laranja	f	t	f
272	Salada de Vagem com Tomate	Entrada	SS	Vermelho	f	t	f
139	Vagem e cenoura cozidas	Entrada	SS	Laranja	f	t	f
141	Couve-flor gratinada	Entrada	SS	Branco	f	t	f
86	Batata e Cenoura Cozidas	Entrada	SS	Laranja	f	t	f
91	Refogado de Legumes	Entrada	SS	Verde	f	t	f
142	Legumes Sauté (Batata Aipo e Brócolis)	Entrada	SS	Amarelo	f	t	f
166	Abóbora cabotiá refogada	Entrada	SS	Laranja	f	t	f
42	Mexidão com Carne	Principal	SS	Laranja	t	f	t
206	Repolho à Mineira	Entrada	SS	Verde	f	t	f
212	Salada Mista (batata, cenoura e vagem)	Entrada	SS	Laranja	f	t	f
217	Cenoura Sauté	Entrada	SS	Laranja	f	t	f
222	 Batata e Vagem cozidas	Entrada	SS	Verde	f	t	f
170	Chuchu refogado	Entrada	SS	Verde	f	t	f
230	Sopa Paulista	Principal	SS	Marrom	t	f	t
107	Macarrão ao Molho de Sardinha	Principal	SS	Vermelho	t	f	t
27	Canjiquinha com Músculo e Hortaliças	Principal	LP	Amarelo	t	f	t
41	Canjiquinha com Tutu de Feijão	Principal	LP	Amarelo	t	f	t
43	Mexidão com Frango	Principal	SS	Laranja	t	f	t
160	Galinhada (com milho e cenoura)	Principal	SS	Marrom	t	f	t
163	Macarrão com frango, molho branco e brócolis	Principal	SS	Branco	t	f	t
164	Macarrão ao molho vermelho com frango	Principal	SS	Vermelho	t	f	t
32	Sopa Minestrone	Principal	LP	Laranja	t	f	t
33	Sopa de Macarrão com Hortaliças e Carne Moída	Principal	LP	Laranja	t	f	t
34	Sopa de Inhame com Frango	Principal	LP	Branco	t	f	t
37	Sopa Cremosa de Batata, Cenoura e Frango	Principal	LP	Amarelo	t	f	t
68	Salada de Macarrão	Principal	SS	Amarelo	t	f	t
105	Macarronada a Bolonhesa	Principal	SS	Vermelho	t	f	t
106	Macarrão Oriental	Principal	SS	Vermelho	t	f	t
108	Macarrão ao Molho de Frango 	Principal	SS	Vermelho	t	f	t
109	Farofão de Arroz com Banana, Ovos e Carne	Principal	SS	Amarelo	t	f	t
120	Sopa de Macarrão com Frango e Legumes(chuchu, inhame e cenoura)	Principal	SS	Vermelho	t	f	t
126	Sopa de Macarrão com carne moída e legumes(batata aipo, couve-flor e beterraba )	Principal	SS	Vermelho	t	f	t
200	Canja de frango	Principal	LP	Marrom	t	f	t
202	Sopa de macarrão com carne moída e legumes	Principal	LP	Vermelho	t	f	t
229	Sopa de Feijão Preto com Carne	Principal	SS	Marrom	t	f	t
264	Macarronada com Sardinha	Principal	SS	Vermelho	t	f	t
274	Sopa de Abóbora com Carne Desfiada	Principal	LP	Vermelho	t	f	t
276	Sopa de Feijão com Carne Moída (macarrão, chuchu, abóbora, batata)	Principal	LP	Marrom	t	f	t
275	Sopa de Mandioca com Carne	Principal	LP	Vermelho	t	f	t
277	Sopa de Macarrão com Carne e Legumes(batata,chuchu e abóbora)	Principal	LP	Vermelho	t	f	t
173	Macarrão primavera (com brócolis, cenoura e milho)	Principal	SS	Amarelo	f	f	t
262	Macarrão Alho e Óleo	Principal	SS	Amarelo	f	f	t
263	Macarronada	Principal	SS	Vermelho	f	f	t
79	Purê de Batata	Entrada	LP	Branco	f	f	f
1	Café com Leite	Laticínios	LP	Marrom	f	f	f
132	Leite com Farinha Láctea	Laticínios	LP	Branco	f	f	f
133	Gelatina de Morango (mistura)	Sobremesa	SS	Vermelho	f	f	f
134	Mingau de Aveia	Laticínios	LP	Branco	f	f	f
135	Biscoito Cream Cracker com Requeijão	Pão/Cereal	SS	Amarelo	f	f	f
136	Biscoito Maisena com Requeijão	Pão/Cereal	SS	Amarelo	f	f	f
143	Bolo de Chocolate (mistura)	Pão/Cereal	SS	Marrom	f	f	f
144	Vitamina de Banana e aveia	Laticínios	LP	Branco	f	f	f
146	Vitamina de banana, maça e mamão com aveia	Laticínios	LP	Laranja	f	f	f
147	Mingau de Chocolate	Laticínios	LP	Marrom	f	f	f
148	Vitamina de Banana e maçã	Laticínios	LP	Branco	f	f	f
149	Biscoito Cream Cracker com Manteiga	Pão/Cereal	SS	Amarelo	f	f	f
150	Mexerica	Fruta	SS	Laranja	f	f	f
167	Arroz primavera (arroz, vagem, cenoura e milho)	Arroz	SS	Laranja	f	f	f
169	Pudim de Morango (mistura)	Sobremesa	SS	Vermelho	f	f	f
187	Pudim de Chocolate (mistura)	Sobremesa	SS	Marrom	f	f	f
168	Batata doce refogada	Entrada	SS	Amarelo	f	f	f
171	Creme de milho	Entrada	LP	Amarelo	f	f	f
215	Batata Sauté	Entrada	SS	Amarelo	f	f	f
220	Batata com Orégano	Entrada	SS	Amarelo	f	f	f
226	Batata em Camadas	Entrada	SS	Amarelo	f	f	f
228	Iscas de Fígado	Principal	SS	Vermelho	t	f	f
99	Feijão Preto Simples	Feijão	SS	Preto	f	f	f
93	Feijão Preto Batido	Feijão	LP	Preto	f	f	f
219	Farofa de Banana	Principal	SS	Amarelo	f	f	f
261	Moqueca de Ovo	Principal	SS	Amarelo	f	f	f
\.


--
-- TOC entry 3181 (class 0 OID 18301)
-- Dependencies: 225
-- Data for Name: refeicao_cardapio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refeicao_cardapio (codigoc, codigor) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 18307)
-- Dependencies: 227
-- Data for Name: refeicoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refeicoes (codigor, nomer, tipor, valorr, codigoref) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 18313)
-- Dependencies: 229
-- Data for Name: referencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.referencia (codigoref, categoriaref, idaderef, porcentagemref, energiaref, proteinaref, lipideoref, carboidratoref, fibraref, calcioref, magnesioref, ferroref, zincoref, sodioref, vitcref, vitaref, gsatref) FROM stdin;
1	Creche	7-11 meses	20%	135	4.2	3.4	21.9	0	54	15	2.2	0.6	0	0	0	0
2	Creche	1-3 anos	20%	200	6.3	5	32.5	3.8	100	16	1.4	0.6	0	0	0	0
3	Pre Escola	4-5 anos	20%	270	8.4	6.8	43.9	5	160	26	2	1	0	0	0	0
4	Creche	7-11 meses	30%	200	6.3	5	32.5	0	81	23	3.3	0.9	0	0	0	0
5	Creche	1-3 anos	30%	300	9.4	7.5	48.8	5.7	150	24	2.1	0.9	0	0	0	0
6	Pre Escola	4-5 anos	30%	400	12.5	10	65	7.5	240	39	3	1.5	0	0	0	0
7	Pre Escola	4-5 anos	70%	950	29.7	23.8	154.4	17.5	560	91	7	3.5	1400	19	280	10.5
8	Creche	7-11 meses	70%	450	14	11.3	73.1	0	189	54	7.7	2.1	0	0	0	0
9	Creche	1-3 anos	70%	700	21.9	17.5	114.9	13.3	350	56	4.9	2.1	0	0	0	0
10	Ensino Fundamental	6-10 anos	20%	300	9.4	7.5	48.8	5.4	210	37	1.8	1.3	0	0	0	0
11	Ensino Fundamental	6-10 anos 	30%	450	14	11.3	73.1	8	315	56	2.7	2	0	0	0	0
12	Ensino Fundamental	6-10 anos	70%	1000	31.2	25	162.5	18.7	735	131	6.3	4.7	0	0	0	0
13		5	1	435	13.6	10.9	70.7	6.1	260	63	2.1	1.8	0	0	0	0
14		5	2	650	20.3	16.3	105.6	9	390	95	3.2	2.7	0	0	0	0
15		6	1	500	15.6	12.5	81.3	6.4	260	77	2.6	2	0	0	0	0
16		6	2	750	23.4	18.8	121.8	9.6	390	116	3.9	3	0	0	0	0
17		7	1	450	14	11.3	73.1	6.3	200	71	2.6	1.9	0	0	0	0
18		8	1	435	13.6	10.9	70.3	5.7	220	74	2.1	1.9	0	0	0	0
19		7	2	680	21.3	17	110.5	9.5	300	107	3.9	2.9	0	0	0	0
20		8	2	650	20.3	16.3	105.6	8.5	330	111	3.2	2.9	0	0	0	0
21		7	3	1600	52	40	260	22.1	700	250	9.1	6.8	0	0	0	0
23		8	3	1500	46.9	37.5	243.8	20	770	259	7.5	6.8	0	0	0	0
24		5	3	1500	46.9	37.5	243.8	21.1	910	222	7.5	6.3	0	0	0	0
25		6	3	1700	50	42.5	276.3	22.4	910	271	9.1	7	0	0	0	0
\.


--
-- TOC entry 3186 (class 0 OID 18317)
-- Dependencies: 230
-- Data for Name: referencia_prato; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.referencia_prato (codigorefpr, nomerefpr) FROM stdin;
1	Cartilha Minas Gerais
2	Fichas Uberaba
3	Rio de Janeiro
4	Vitória da Conquista
5	Rafaela
\.


--
-- TOC entry 3187 (class 0 OID 18323)
-- Dependencies: 231
-- Data for Name: referenciapreco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.referenciapreco (codigoref, descricao) FROM stdin;
2	UBERLANDIA
1	CONAB
3	SUPERMERCADO
4	PAINEL
\.


--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 205
-- Name: alimentos_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alimentos_seq', 619, true);


--
-- TOC entry 3196 (class 0 OID 0)
-- Dependencies: 208
-- Name: cardapios_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cardapios_seq', 1, false);


--
-- TOC entry 3197 (class 0 OID 0)
-- Dependencies: 211
-- Name: prato_refeicao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prato_refeicao_seq', 1, false);


--
-- TOC entry 3198 (class 0 OID 0)
-- Dependencies: 218
-- Name: pratos_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pratos_seq', 301, false);


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 224
-- Name: refeicao_cardapio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refeicao_cardapio_seq', 1, false);


--
-- TOC entry 3200 (class 0 OID 0)
-- Dependencies: 226
-- Name: refeicoes_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refeicoes_seq', 1, false);


--
-- TOC entry 3201 (class 0 OID 0)
-- Dependencies: 228
-- Name: referencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.referencia_seq', 26, false);


--
-- TOC entry 2979 (class 2606 OID 18327)
-- Name: alimento_prato alimento_prato_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alimento_prato
    ADD CONSTRAINT alimento_prato_pkey PRIMARY KEY (codigopr, codigoalim);


--
-- TOC entry 2982 (class 2606 OID 18329)
-- Name: alimentos alimentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alimentos
    ADD CONSTRAINT alimentos_pkey PRIMARY KEY (codigoalim);


--
-- TOC entry 2984 (class 2606 OID 18331)
-- Name: cardapios cardapios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cardapios
    ADD CONSTRAINT cardapios_pkey PRIMARY KEY (codigoc);


--
-- TOC entry 2990 (class 2606 OID 18333)
-- Name: prato_refeicao prato_refeicao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prato_refeicao
    ADD CONSTRAINT prato_refeicao_pkey PRIMARY KEY (codigor, codigopr);


--
-- TOC entry 2992 (class 2606 OID 18335)
-- Name: prato_tem_verdura_legume prato_tem_verdura_legume_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prato_tem_verdura_legume
    ADD CONSTRAINT prato_tem_verdura_legume_pkey PRIMARY KEY (codigopr);


--
-- TOC entry 2996 (class 2606 OID 18337)
-- Name: pratos_combinacao pratos_combinacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pratos_combinacao
    ADD CONSTRAINT pratos_combinacao_pkey PRIMARY KEY (codigopr, codigopr1);


--
-- TOC entry 2994 (class 2606 OID 18339)
-- Name: pratos pratos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pratos
    ADD CONSTRAINT pratos_pkey PRIMARY KEY (codigopr);


--
-- TOC entry 2998 (class 2606 OID 18341)
-- Name: pratos_princ_sozinhos pratos_princ_sozinhos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pratos_princ_sozinhos
    ADD CONSTRAINT pratos_princ_sozinhos_pkey PRIMARY KEY (codigopr);


--
-- TOC entry 3001 (class 2606 OID 18343)
-- Name: refeicao_cardapio refeicao_cardapio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refeicao_cardapio
    ADD CONSTRAINT refeicao_cardapio_pkey PRIMARY KEY (codigor, codigoc);


--
-- TOC entry 3003 (class 2606 OID 18345)
-- Name: refeicoes refeicoes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refeicoes
    ADD CONSTRAINT refeicoes_pkey PRIMARY KEY (codigor);


--
-- TOC entry 3005 (class 2606 OID 18347)
-- Name: referencia referencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.referencia
    ADD CONSTRAINT referencia_pkey PRIMARY KEY (codigoref);


--
-- TOC entry 3007 (class 2606 OID 18349)
-- Name: referencia_prato referencia_prato_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.referencia_prato
    ADD CONSTRAINT referencia_prato_pkey PRIMARY KEY (codigorefpr);


--
-- TOC entry 3009 (class 2606 OID 18351)
-- Name: referenciapreco referenciapreco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.referenciapreco
    ADD CONSTRAINT referenciapreco_pkey PRIMARY KEY (codigoref);


--
-- TOC entry 2987 (class 1259 OID 18352)
-- Name: codigor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX codigor ON public.prato_refeicao USING btree (codigor);


--
-- TOC entry 2985 (class 1259 OID 18353)
-- Name: codigorefeicao; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX codigorefeicao ON public.cardapios USING btree (quantdias);


--
-- TOC entry 2986 (class 1259 OID 18354)
-- Name: fk_acomp_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_acomp_idx ON public.prato_acomp_permitido USING btree (codigopr);


--
-- TOC entry 2980 (class 1259 OID 18355)
-- Name: fk_alimento_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_alimento_idx ON public.alimento_prato USING btree (codigoalim);


--
-- TOC entry 2988 (class 1259 OID 18356)
-- Name: fk_prato_refeicao_1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_prato_refeicao_1_idx ON public.prato_refeicao USING btree (codigopr);


--
-- TOC entry 2999 (class 1259 OID 18357)
-- Name: fk_refeicao_cardapio_2_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_refeicao_cardapio_2_idx ON public.refeicao_cardapio USING btree (codigoc);


--
-- TOC entry 3020 (class 2606 OID 18358)
-- Name: prato_tem_verdura_legume codigopr_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prato_tem_verdura_legume
    ADD CONSTRAINT codigopr_fk FOREIGN KEY (codigopr) REFERENCES public.pratos(codigopr);


--
-- TOC entry 3011 (class 2606 OID 18363)
-- Name: alimento_prato fk_alimento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alimento_prato
    ADD CONSTRAINT fk_alimento FOREIGN KEY (codigoalim) REFERENCES public.alimentos(codigoalim) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3014 (class 2606 OID 18368)
-- Name: cardapios fk_cardapios_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cardapios
    ADD CONSTRAINT fk_cardapios_1 FOREIGN KEY (codigoc) REFERENCES public.refeicoes(codigor) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3013 (class 2606 OID 18373)
-- Name: alimento_verdura fk_codigoalim; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alimento_verdura
    ADD CONSTRAINT fk_codigoalim FOREIGN KEY (codigoalim) REFERENCES public.alimentos(codigoalim);


--
-- TOC entry 3010 (class 2606 OID 18378)
-- Name: alimento_legume fk_codigoalim; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alimento_legume
    ADD CONSTRAINT fk_codigoalim FOREIGN KEY (codigoalim) REFERENCES public.alimentos(codigoalim);


--
-- TOC entry 3019 (class 2606 OID 18383)
-- Name: prato_tem_verdura fk_codigopr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prato_tem_verdura
    ADD CONSTRAINT fk_codigopr FOREIGN KEY (codigopr) REFERENCES public.pratos(codigopr);


--
-- TOC entry 3018 (class 2606 OID 18388)
-- Name: prato_tem_legume fk_codigopr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prato_tem_legume
    ADD CONSTRAINT fk_codigopr FOREIGN KEY (codigopr) REFERENCES public.pratos(codigopr);


--
-- TOC entry 3021 (class 2606 OID 18393)
-- Name: prato_tem_verdura_legume_entrada fk_codigopr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prato_tem_verdura_legume_entrada
    ADD CONSTRAINT fk_codigopr FOREIGN KEY (codigopr) REFERENCES public.pratos(codigopr);


--
-- TOC entry 3022 (class 2606 OID 18398)
-- Name: pratos_combinacao fk_comb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pratos_combinacao
    ADD CONSTRAINT fk_comb FOREIGN KEY (codigopr) REFERENCES public.pratos(codigopr) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3012 (class 2606 OID 18403)
-- Name: alimento_prato fk_prato; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alimento_prato
    ADD CONSTRAINT fk_prato FOREIGN KEY (codigopr) REFERENCES public.pratos(codigopr) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3015 (class 2606 OID 18408)
-- Name: prato_acomp_permitido fk_prato; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prato_acomp_permitido
    ADD CONSTRAINT fk_prato FOREIGN KEY (codigopr) REFERENCES public.pratos(codigopr) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3016 (class 2606 OID 18413)
-- Name: prato_refeicao fk_prato_refeicao_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prato_refeicao
    ADD CONSTRAINT fk_prato_refeicao_1 FOREIGN KEY (codigopr) REFERENCES public.pratos(codigopr) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3017 (class 2606 OID 18418)
-- Name: prato_refeicao fk_prato_refeicao_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prato_refeicao
    ADD CONSTRAINT fk_prato_refeicao_2 FOREIGN KEY (codigor) REFERENCES public.refeicoes(codigor) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3023 (class 2606 OID 18423)
-- Name: refeicao_cardapio fk_refeicao_cardapio_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refeicao_cardapio
    ADD CONSTRAINT fk_refeicao_cardapio_1 FOREIGN KEY (codigor) REFERENCES public.refeicoes(codigor) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3024 (class 2606 OID 18428)
-- Name: refeicao_cardapio fk_refeicao_cardapio_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refeicao_cardapio
    ADD CONSTRAINT fk_refeicao_cardapio_2 FOREIGN KEY (codigoc) REFERENCES public.cardapios(codigoc) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3025 (class 2606 OID 18433)
-- Name: refeicoes fk_refeicoes_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refeicoes
    ADD CONSTRAINT fk_refeicoes_1 FOREIGN KEY (codigor) REFERENCES public.pratos(codigopr) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2022-02-05 13:58:08

--
-- PostgreSQL database dump complete
--

