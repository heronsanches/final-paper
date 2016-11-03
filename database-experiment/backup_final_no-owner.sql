--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: master; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA master;


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = master, pg_catalog;

--
-- Name: basket_id_basket_seq; Type: SEQUENCE; Schema: master; Owner: -
--

CREATE SEQUENCE basket_id_basket_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: basket; Type: TABLE; Schema: master; Owner: -
--

CREATE TABLE basket (
    id_basket bigint DEFAULT nextval('basket_id_basket_seq'::regclass) NOT NULL,
    bool_side_effect boolean DEFAULT false NOT NULL
);


--
-- Name: basket_item; Type: TABLE; Schema: master; Owner: -
--

CREATE TABLE basket_item (
    id_basket bigint NOT NULL,
    id_item integer NOT NULL,
    num_quantity integer NOT NULL
);


--
-- Name: client_id_client_seq; Type: SEQUENCE; Schema: master; Owner: -
--

CREATE SEQUENCE client_id_client_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: client; Type: TABLE; Schema: master; Owner: -
--

CREATE TABLE client (
    id_client integer DEFAULT nextval('client_id_client_seq'::regclass) NOT NULL,
    txt_fcm_token character varying NOT NULL
);


--
-- Name: id_request_answer_seq; Type: SEQUENCE; Schema: master; Owner: -
--

CREATE SEQUENCE id_request_answer_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: id_tuple_seq; Type: SEQUENCE; Schema: master; Owner: -
--

CREATE SEQUENCE id_tuple_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: item_id_tem_seq; Type: SEQUENCE; Schema: master; Owner: -
--

CREATE SEQUENCE item_id_tem_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: item; Type: TABLE; Schema: master; Owner: -
--

CREATE TABLE item (
    id_item integer DEFAULT nextval('item_id_tem_seq'::regclass) NOT NULL,
    num_width double precision DEFAULT 0 NOT NULL,
    num_height double precision NOT NULL,
    num_length double precision DEFAULT 0 NOT NULL,
    num_mass double precision NOT NULL,
    txt_name character varying NOT NULL,
    txt_description character varying DEFAULT ''::character varying NOT NULL,
    txt_alternative_id character varying DEFAULT ''::character varying NOT NULL,
    num_diameter double precision DEFAULT 0 NOT NULL
);


--
-- Name: request_answer; Type: TABLE; Schema: master; Owner: -
--

CREATE TABLE request_answer (
    id_request_answer bigint DEFAULT nextval('id_request_answer_seq'::regclass) NOT NULL,
    txt_request_path character varying NOT NULL,
    txt_parameter character varying NOT NULL,
    date_timestamp timestamp without time zone NOT NULL,
    txt_type character varying(4) NOT NULL,
    txt_answer character varying NOT NULL,
    id_tuple bigint NOT NULL
);


--
-- Name: tuple; Type: TABLE; Schema: master; Owner: -
--

CREATE TABLE tuple (
    id_tuple bigint DEFAULT nextval('id_tuple_seq'::regclass) NOT NULL,
    bool_side_effect boolean DEFAULT false NOT NULL
);


--
-- Data for Name: basket; Type: TABLE DATA; Schema: master; Owner: -
--

COPY basket (id_basket, bool_side_effect) FROM stdin;
1	f
2	f
3	f
4	f
5	f
6	t
7	t
8	t
9	t
10	t
11	f
12	f
13	f
14	f
15	f
16	t
17	t
18	t
19	t
21	f
22	f
23	f
24	f
25	f
26	t
27	t
28	t
29	t
30	t
31	f
32	f
34	f
35	t
38	f
39	f
40	f
41	f
43	t
45	t
46	t
47	f
48	f
49	t
50	t
51	f
52	f
53	f
54	f
56	t
57	f
58	f
61	f
59	t
60	t
63	f
65	f
66	f
62	t
64	t
\.


--
-- Name: basket_id_basket_seq; Type: SEQUENCE SET; Schema: master; Owner: -
--

SELECT pg_catalog.setval('basket_id_basket_seq', 66, true);


--
-- Data for Name: basket_item; Type: TABLE DATA; Schema: master; Owner: -
--

COPY basket_item (id_basket, id_item, num_quantity) FROM stdin;
1	1	1
1	15	2
1	8	1
1	28	1
2	9	1
2	29	1
2	12	1
2	4	1
2	2	1
2	22	2
3	20	1
3	22	1
3	18	1
3	11	1
3	10	1
3	9	1
3	17	1
4	20	4
4	22	2
4	15	1
4	12	1
4	8	1
5	20	2
5	9	3
5	8	1
5	22	1
5	11	1
5	15	1
6	2	4
6	16	3
6	1	2
6	28	2
6	20	1
6	11	1
6	3	1
6	4	1
6	13	1
6	22	1
6	15	1
6	29	1
7	13	2
7	20	1
7	8	1
7	18	1
7	29	1
8	23	2
8	16	2
8	10	2
8	15	1
8	22	1
8	1	1
9	28	2
9	23	1
9	22	2
9	2	2
9	29	1
9	20	1
10	27	1
10	16	1
10	5	1
10	12	1
10	11	1
11	10	2
11	4	1
11	5	1
11	9	1
11	3	1
11	13	1
12	6	1
12	10	1
12	18	1
12	11	1
12	1	1
13	17	2
13	13	1
13	9	1
13	16	1
13	14	1
13	1	1
14	16	2
14	18	1
14	3	1
14	12	2
14	10	1
15	8	2
15	4	2
15	10	2
15	6	1
15	5	1
15	1	1
15	11	1
15	7	1
16	15	2
16	2	2
16	22	2
16	18	1
16	1	1
16	17	1
16	9	1
16	29	1
17	22	2
17	20	1
17	3	1
17	29	1
17	27	1
7	26	2
8	26	1
9	26	1
17	26	2
18	2	5
18	20	6
18	15	2
18	16	2
18	11	1
18	12	1
18	8	1
18	1	1
18	23	1
19	28	3
19	13	2
19	29	1
19	23	1
19	27	1
21	22	2
21	4	3
21	10	4
21	20	2
21	13	1
21	8	1
21	9	1
21	17	1
22	10	2
22	12	3
22	13	2
22	9	6
22	3	2
22	4	2
22	20	1
22	8	1
22	6	1
22	15	1
23	14	2
24	18	2
25	11	5
26	2	5
26	22	8
26	20	10
27	20	10
27	23	2
27	29	2
28	20	5
28	23	2
28	27	1
29	29	3
29	20	3
29	23	1
29	26	2
30	2	4
30	22	5
30	20	4
30	29	3
30	26	1
30	23	1
31	2	3
31	20	3
32	20	3
32	10	1
34	29	3
34	20	1
35	26	4
35	2	2
35	8	1
38	12	3
38	22	1
38	10	1
38	13	1
39	10	2
39	22	2
39	6	1
39	13	1
40	20	3
40	3	2
40	9	2
40	8	1
40	4	1
40	10	1
41	1	4
41	16	3
41	5	2
41	11	1
43	15	4
43	11	6
43	1	5
43	9	5
43	14	2
43	4	2
43	5	2
43	28	3
43	17	2
43	18	2
43	12	1
43	10	1
43	3	1
43	6	1
43	20	1
43	16	1
43	7	1
43	13	1
45	22	3
45	20	3
45	13	2
45	16	3
45	1	4
45	4	4
45	8	1
45	9	2
45	5	2
45	12	3
45	3	2
45	11	1
45	6	1
46	23	3
46	26	1
46	3	1
46	13	1
46	8	1
46	22	1
46	20	1
47	22	3
47	2	2
48	29	2
48	20	1
49	23	3
49	26	2
49	20	1
49	1	1
49	28	1
49	29	1
49	4	1
49	18	1
49	9	1
50	26	4
50	27	1
50	2	2
50	12	1
50	8	1
51	15	1
52	20	2
52	22	1
52	3	2
52	8	1
52	1	1
52	11	1
53	20	2
53	28	2
53	12	1
54	13	2
54	3	1
54	22	1
54	17	1
56	20	2
56	13	2
56	9	2
56	10	1
56	22	1
56	27	1
56	26	1
57	22	3
57	20	3
57	2	1
57	8	1
57	13	1
57	29	1
58	1	3
58	16	2
58	7	1
58	11	3
58	18	2
58	10	1
58	13	1
58	12	1
59	28	2
59	29	1
59	9	3
59	2	17
59	1	1
59	10	2
59	16	1
59	8	1
60	23	1
60	20	2
60	2	1
60	22	1
60	4	1
60	3	1
60	9	1
60	12	1
60	26	1
61	2	3
61	20	1
61	28	1
61	23	1
62	29	1
62	20	1
62	10	3
62	13	1
62	9	1
62	1	1
62	8	1
62	14	1
62	26	1
63	22	2
63	3	4
63	18	2
63	1	1
63	14	1
63	11	1
63	7	1
63	12	1
63	10	1
63	4	1
63	17	2
64	15	3
64	23	1
64	26	1
64	22	1
64	16	1
65	1	3
65	9	2
65	7	2
65	22	1
65	13	1
65	20	2
65	16	1
65	6	1
65	11	1
65	14	1
65	18	1
65	12	1
66	15	1
66	13	1
66	14	2
66	16	2
66	11	3
66	4	3
66	9	3
66	20	1
66	5	5
66	12	1
66	1	1
66	28	1
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: master; Owner: -
--

COPY client (id_client, txt_fcm_token) FROM stdin;
1	e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj
\.


--
-- Name: client_id_client_seq; Type: SEQUENCE SET; Schema: master; Owner: -
--

SELECT pg_catalog.setval('client_id_client_seq', 1, true);


--
-- Name: id_request_answer_seq; Type: SEQUENCE SET; Schema: master; Owner: -
--

SELECT pg_catalog.setval('id_request_answer_seq', 2625, true);


--
-- Name: id_tuple_seq; Type: SEQUENCE SET; Schema: master; Owner: -
--

SELECT pg_catalog.setval('id_tuple_seq', 407, true);


--
-- Data for Name: item; Type: TABLE DATA; Schema: master; Owner: -
--

COPY item (id_item, num_width, num_height, num_length, num_mass, txt_name, txt_description, txt_alternative_id, num_diameter) FROM stdin;
1	0	0.0309999999999999998	0	0.00300000000000000006	Refrigerante nº 4 - Soda		30030_sd	0.00899999999999999932
2	0.0100000000000000002	0.0140000000000000003	0.0299999999999999989	0.00100000000000000002	Caixa Pasta de dente - vermelha.		10044_vm	0
3	0.00400000000000000008	0.0200000000000000004	0.0140000000000000003	0.00100000000000000002	Batata		25059	0
4	0.00400000000000000008	0.0200000000000000004	0.0140000000000000003	0.00100000000000000002	Café		25053	0
5	0	0.0149999999999999994	0	0.00300000000000000006	Café Classic		25047	0.00800000000000000017
6	0.0050000000000000001	0.0200000000000000004	0.0109999999999999994	0.00100000000000000002	Cerveja em lata III		20027	0
7	0	0.0280000000000000006	0	0.00100000000000000002	Champanhe - Azul		20041	0.00700000000000000015
9	0.00400000000000000008	0.0200000000000000004	0.0140000000000000003	0.00100000000000000002	Farinha de Trigo		25057	0
11	0	0.0299999999999999989	0	0.00100000000000000002	Garrafa de Rum		20038	0.00800000000000000017
12	0.0120000000000000002	0.0160000000000000003	0.00400000000000000008	0.00400000000000000008	Goiabada		22040	0
14	0	0.0299999999999999989	0	0.00100000000000000002	Garrafa de Vodka Special		20037	0.00800000000000000017
15	0.0269999999999999997	0.0140000000000000003	0.0179999999999999986	0.00100000000000000002	Pote de sorvete		25018	0
16	0	0.0320000000000000007	0	0.00200000000000000004	Vinho branco		20031	0.00700000000000000015
18	0.0120000000000000002	0.0299999999999999989	0.00600000000000000012	0.00200000000000000004	Limpa vidros		83020	0
20	0.0210000000000000013	0.0149999999999999994	0.00700000000000000015	0.00200000000000000004	Sabonete - II		10038	0
22	0.0149999999999999994	0.0240000000000000005	0.00800000000000000017	0.00100000000000000002	Sabão em pó - II		83003	0
23	0.0189999999999999995	0.0299999999999999989	0.0389999999999999999	0.0179999999999999986	Baú simples		68101	0
26	0.0459999999999999992	0.0609999999999999987	0.0170000000000000012	0.00600000000000000012	Prateleira de acrílico pequena		67003	0
8	0.0160000000000000003	0.0250000000000000014	0.00400000000000000008	0.00100000000000000002	Farinha de trigo	sol	25010	0
29	0	0.0299999999999999989	0	0.00300000000000000006	Barril em madeira	médio	81018md	0.0219999999999999987
10	0.0129999999999999994	0.0170000000000000012	0.00630000000000000004	0.00200000000000000004	Fermento em pó		25016	0
27	0.076999999999999999	0.0196999999999999988	0.0379999999999999991	0.00100000000000000002	Colchão p/ berço azul		14004_az	0
17	0.0100000000000000002	0.0432000000000000023	0	0.00100000000000000002	Jogo de esfregões		83021	0
13	0.0181000000000000015	0.0258	0.00169999999999999991	0.00100000000000000002	Pão de Queijo		25027	0
28	0.0219999999999999987	0.0412000000000000005	0.0134999999999999998	0.00100000000000000002	Rastelo		52002	0
\.


--
-- Name: item_id_tem_seq; Type: SEQUENCE SET; Schema: master; Owner: -
--

SELECT pg_catalog.setval('item_id_tem_seq', 29, true);


--
-- Data for Name: request_answer; Type: TABLE DATA; Schema: master; Owner: -
--

COPY request_answer (id_request_answer, txt_request_path, txt_parameter, date_timestamp, txt_type, txt_answer, id_tuple) FROM stdin;
194	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-09 01:09:34.673	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-09 01:09:35.975","description":"freight home intelligent elevator"}}	33
195	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-09 01:09:37.054	GET	{"message":{"on":true,"moving":false,"maxMass":0.2,"mass":0.0,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-09 01:09:37.058","description":"freight home intelligent car"},"status":4}	33
196	http://localhost:8080/has/arduino/arduino/car/go-to-elevator	[{"width":0.015,"height":0.06,"length":0.005,"mass":0.1,"id":2},{"width":0.065,"height":0.11,"length":0.001,"mass":0.01}]	2016-09-09 01:09:38.106	PUT	{"status":4,"message":"{moving:true}"}	33
197	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-09 01:09:34.673	PUT	{"status":4,"message":{"message":"service activated"}}	33
198	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-09 01:09:41.125	PUT	{"status":4}	33
199	https://fcm.googleapis.com/fcm/send	{}	2016-09-09 01:09:55.524	POST	{"multicast_id":6468950317592538312,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473394195412366%aa7e4a83f9fd7ecd"}]}	33
200	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-09 01:09:53.814	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	33
201	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-09 01:14:23.855	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-09 01:14:26.301","description":"freight home intelligent elevator"}}	34
202	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-09 01:14:27.39	GET	{"message":{"on":true,"moving":false,"maxMass":0.2,"mass":0.0,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-09 01:14:27.393","description":"freight home intelligent car"},"status":4}	34
203	http://localhost:8080/has/arduino/arduino/car/go-to-elevator	[{"width":0.015,"height":0.06,"length":0.005,"mass":0.1,"id":2},{"width":0.065,"height":0.11,"length":0.001,"mass":0.01}]	2016-09-09 01:14:28.424	PUT	{"status":4,"message":"{moving:true}"}	34
204	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-09 01:14:23.855	PUT	{"status":4,"message":{"message":"service activated"}}	34
205	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-09 01:14:31.443	PUT	{"status":4}	34
206	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-09 01:14:46.236	POST	{"multicast_id":8868987582959296932,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473394486119451%aa7e4a83f9fd7ecd"}]}	34
207	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-09 01:14:44.156	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	34
208	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-10 01:52:45.46	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-10 01:52:50.522","description":"freight home intelligent elevator"}}	35
209	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-10 01:52:51.645	GET	{"message":{"on":true,"moving":false,"maxMass":0.2,"mass":0.0,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-09-10 01:52:51.663","description":"freight home intelligent car"},"status":4}	35
210	http://localhost:8080/has/arduino/arduino/car/go-to-elevator	[{"width":0.015,"height":0.06,"length":0.005,"mass":0.1,"id":2},{"width":0.065,"height":0.11,"length":0.001,"mass":0.01}]	2016-09-10 01:52:52.717	PUT	{"status":4,"message":"{moving:true}"}	35
211	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-10 01:52:45.46	PUT	{"status":4,"message":{"message":"service activated"}}	35
212	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-10 01:52:55.742	PUT	{"status":4}	35
213	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-10 01:53:11.463	POST	{"multicast_id":5763578353410106330,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473483191359401%aa7e4a83f9fd7ecd"}]}	35
214	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-10 01:53:08.933	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	35
215	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-10 01:53:18.986	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-10 01:53:20.229","description":"freight home intelligent elevator"}}	36
216	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-10 01:53:21.269	GET	{"message":{"on":true,"moving":false,"maxMass":0.2,"mass":0.0,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-10 01:53:21.275","description":"freight home intelligent car"},"status":4}	36
217	http://localhost:8080/has/arduino/arduino/car/go-to-elevator	[{"width":0.015,"height":0.06,"length":0.005,"mass":0.1,"id":2},{"width":0.065,"height":0.11,"length":0.001,"mass":0.01}]	2016-09-10 01:53:22.305	PUT	{"status":4,"message":"{moving:true}"}	36
218	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-10 01:53:18.986	PUT	{"status":4,"message":{"message":"service activated"}}	36
219	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-10 01:53:25.325	PUT	{"status":4}	36
220	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-10 01:53:39.419	POST	{"multicast_id":7220279312943854005,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473483219335181%aa7e4a83f9fd7ecd"}]}	36
221	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-10 01:53:38.023	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	36
222	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-10 01:55:00.118	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-10 01:55:01.444","description":"freight home intelligent elevator"}}	37
223	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-10 01:55:02.462	GET	{"message":{"on":true,"moving":false,"maxMass":0.2,"mass":0.0,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-10 01:55:02.466","description":"freight home intelligent car"},"status":4}	37
224	http://localhost:8080/has/arduino/arduino/car/go-to-elevator	[{"width":0.015,"height":0.06,"length":0.005,"mass":0.1,"id":2},{"width":0.065,"height":0.11,"length":0.001,"mass":0.01}]	2016-09-10 01:55:03.496	PUT	{"status":4,"message":"{moving:true}"}	37
225	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-10 01:55:00.118	PUT	{"status":4,"message":{"message":"service activated"}}	37
226	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-10 01:55:06.516	PUT	{"status":4}	37
227	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-10 01:55:20.933	POST	{"multicast_id":6256167629294262835,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473483320829709%aa7e4a83f9fd7ecd"}]}	37
228	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-10 01:55:19.18	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	37
229	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-10 01:55:36.506	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-10 01:55:47.74","description":"freight home intelligent elevator"}}	38
230	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-10 01:55:48.765	GET	{"message":{"on":true,"moving":false,"maxMass":0.2,"mass":0.0,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-10 01:55:48.769","description":"freight home intelligent car"},"status":4}	38
231	http://localhost:8080/has/arduino/arduino/car/go-to-elevator	[{"width":0.015,"height":0.06,"length":0.005,"mass":0.1,"id":2},{"width":0.065,"height":0.11,"length":0.001,"mass":0.01}]	2016-09-10 01:55:49.804	PUT	{"status":4,"message":"{moving:true}"}	38
232	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-10 01:55:36.506	PUT	{"status":4,"message":{"message":"service activated"}}	38
233	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-10 01:55:52.823	PUT	{"status":4}	38
235	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-10 01:56:05.482	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	38
236	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-10 02:00:15.265	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-10 02:00:16.497","description":"freight home intelligent elevator"}}	39
237	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-10 02:00:17.531	GET	{"message":{"on":true,"moving":false,"maxMass":0.2,"mass":0.0,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-10 02:00:17.536","description":"freight home intelligent car"},"status":4}	39
238	http://localhost:8080/has/arduino/arduino/car/go-to-elevator	[{"width":0.015,"height":0.06,"length":0.005,"mass":0.1,"id":2},{"width":0.065,"height":0.11,"length":0.001,"mass":0.01}]	2016-09-10 02:00:18.561	PUT	{"status":4,"message":"{moving:true}"}	39
239	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-10 02:00:15.265	PUT	{"status":4,"message":{"message":"service activated"}}	39
240	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-10 02:00:21.581	PUT	{"status":4}	39
241	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-10 02:00:39.508	POST	{"multicast_id":8819399168849564963,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473483639414085%aa7e4a83f9fd7ecd"}]}	39
242	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-10 02:00:37.253	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	39
243	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-10 02:00:47.56	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-10 02:00:48.927","description":"freight home intelligent elevator"}}	40
244	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-10 02:00:52.97	GET	{"message":{"on":true,"moving":false,"maxMass":0.2,"mass":0.0,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-10 02:00:52.973","description":"freight home intelligent car"},"status":4}	40
245	http://localhost:8080/has/arduino/arduino/car/go-to-elevator	[{"width":0.015,"height":0.06,"length":0.005,"mass":0.1,"id":2},{"width":0.065,"height":0.11,"length":0.001,"mass":0.01}]	2016-09-10 02:00:54.012	PUT	{"status":4,"message":"{moving:true}"}	40
246	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-10 02:00:47.56	PUT	{"status":4,"message":{"message":"service activated"}}	40
247	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-10 02:00:57.031	PUT	{"status":4}	40
248	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-10 02:01:11.769	POST	{"multicast_id":8528721175575051932,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473483671678177%aa7e4a83f9fd7ecd"}]}	40
249	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-10 02:01:10.042	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	40
305	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-10 02:39:50.368	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	48
250	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-10 02:01:21.99	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-10 02:01:28.045","description":"freight home intelligent elevator"}}	41
251	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-10 02:01:29.083	GET	{"message":{"on":true,"moving":false,"maxMass":0.2,"mass":0.0,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-10 02:01:29.086","description":"freight home intelligent car"},"status":4}	41
252	http://localhost:8080/has/arduino/arduino/car/go-to-elevator	[{"width":0.015,"height":0.06,"length":0.005,"mass":0.1,"id":2},{"width":0.065,"height":0.11,"length":0.001,"mass":0.01}]	2016-09-10 02:01:30.12	PUT	{"status":4,"message":"{moving:true}"}	41
253	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-10 02:01:21.99	PUT	{"status":4,"message":{"message":"service activated"}}	41
254	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-10 02:01:33.138	PUT	{"status":4}	41
255	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-10 02:01:48.161	POST	{"multicast_id":8985757016273853555,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473483708059116%aa7e4a83f9fd7ecd"}]}	41
256	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-10 02:01:45.803	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	41
257	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-10 02:04:36.077	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-10 02:04:37.434","description":"freight home intelligent elevator"}}	42
258	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-10 02:04:38.473	GET	{"message":{"on":true,"moving":false,"maxMass":0.2,"mass":0.0,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-10 02:04:38.477","description":"freight home intelligent car"},"status":4}	42
259	http://localhost:8080/has/arduino/arduino/car/go-to-elevator	[{"width":0.015,"height":0.06,"length":0.005,"mass":0.1,"id":2},{"width":0.065,"height":0.11,"length":0.001,"mass":0.01}]	2016-09-10 02:04:39.502	PUT	{"status":4,"message":"{moving:true}"}	42
260	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-10 02:04:36.077	PUT	{"status":4,"message":{"message":"service activated"}}	42
261	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-10 02:04:42.521	PUT	{"status":4}	42
262	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-10 02:04:56.953	POST	{"multicast_id":7415720871614321743,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473483896853003%aa7e4a83f9fd7ecd"}]}	42
263	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-10 02:04:55.193	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	42
264	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-10 02:06:21.678	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-10 02:06:22.786","description":"freight home intelligent elevator"}}	43
265	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-10 02:06:23.839	GET	{"message":{"on":true,"moving":false,"maxMass":0.2,"mass":0.0,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-10 02:06:23.842","description":"freight home intelligent car"},"status":4}	43
266	http://localhost:8080/has/arduino/arduino/car/go-to-elevator	[{"width":0.015,"height":0.06,"length":0.005,"mass":0.1,"id":2},{"width":0.065,"height":0.11,"length":0.001,"mass":0.01}]	2016-09-10 02:06:24.867	PUT	{"status":4,"message":"{moving:true}"}	43
267	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-10 02:06:21.678	PUT	{"status":4,"message":{"message":"service activated"}}	43
268	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-10 02:06:27.885	PUT	{"status":4}	43
269	https://fcm.googleapis.com/fcm/send	{}	2016-09-10 02:06:42.499	POST	{"multicast_id":7502207778708217538,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473484002405267%aa7e4a83f9fd7ecd"}]}	43
270	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-10 02:06:40.593	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	43
271	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-10 02:07:19.519	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-10 02:07:20.766","description":"freight home intelligent elevator"}}	44
272	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-10 02:07:21.797	GET	{"message":{"on":true,"moving":false,"maxMass":0.2,"mass":0.0,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-10 02:07:21.801","description":"freight home intelligent car"},"status":4}	44
273	http://localhost:8080/has/arduino/arduino/car/go-to-elevator	[{"width":0.015,"height":0.06,"length":0.005,"mass":0.1,"id":2},{"width":0.065,"height":0.11,"length":0.001,"mass":0.01}]	2016-09-10 02:07:22.845	PUT	{"status":4,"message":"{moving:true}"}	44
274	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-10 02:07:19.518	PUT	{"status":4,"message":{"message":"service activated"}}	44
275	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-10 02:07:25.864	PUT	{"status":4}	44
276	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-10 02:07:40.603	POST	{"multicast_id":6970681325174632880,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473484060512672%aa7e4a83f9fd7ecd"}]}	44
277	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-10 02:07:38.867	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	44
278	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-10 02:36:21.487	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-10 02:36:24.646","description":"freight home intelligent elevator"}}	45
279	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-10 02:36:25.692	GET	{"message":{"on":true,"moving":false,"maxMass":0.2,"mass":0.0,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-10 02:36:25.695","description":"freight home intelligent car"},"status":4}	45
280	http://localhost:8080/has/arduino/arduino/car/go-to-elevator	[{"width":0.015,"height":0.06,"length":0.005,"mass":0.1,"id":2},{"width":0.065,"height":0.11,"length":0.001,"mass":0.01}]	2016-09-10 02:36:26.724	PUT	{"status":4,"message":"{moving:true}"}	45
281	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-10 02:36:21.487	PUT	{"status":4,"message":{"message":"service activated"}}	45
282	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-10 02:36:29.742	PUT	{"status":4}	45
283	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-10 02:36:44.408	POST	{"multicast_id":5282407283597665426,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473485804301191%aa7e4a83f9fd7ecd"}]}	45
284	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-10 02:36:42.448	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	45
285	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-10 02:36:55.846	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-10 02:36:57.189","description":"freight home intelligent elevator"}}	46
286	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-10 02:36:58.225	GET	{"message":{"on":true,"moving":false,"maxMass":0.2,"mass":0.0,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-10 02:36:58.229","description":"freight home intelligent car"},"status":4}	46
287	http://localhost:8080/has/arduino/arduino/car/go-to-elevator	[{"width":0.015,"height":0.06,"length":0.005,"mass":0.1,"id":2},{"width":0.065,"height":0.11,"length":0.001,"mass":0.01}]	2016-09-10 02:36:59.27	PUT	{"status":4,"message":"{moving:true}"}	46
288	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-10 02:36:55.846	PUT	{"status":4,"message":{"message":"service activated"}}	46
289	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-10 02:37:02.289	PUT	{"status":4}	46
290	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-10 02:37:31.876	POST	{"multicast_id":6495822671335640446,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473485851775828%aa7e4a83f9fd7ecd"}]}	46
291	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-10 02:37:14.948	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	46
292	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-10 02:38:31.097	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-10 02:38:32.363","description":"freight home intelligent elevator"}}	47
293	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-10 02:38:33.383	GET	{"message":{"on":true,"moving":false,"maxMass":0.2,"mass":0.0,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-10 02:38:33.386","description":"freight home intelligent car"},"status":4}	47
294	http://localhost:8080/has/arduino/arduino/car/go-to-elevator	[{"width":0.015,"height":0.06,"length":0.005,"mass":0.1,"id":2},{"width":0.065,"height":0.11,"length":0.001,"mass":0.01}]	2016-09-10 02:38:34.43	PUT	{"status":4,"message":"{moving:true}"}	47
295	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-10 02:38:31.097	PUT	{"status":4,"message":{"message":"service activated"}}	47
296	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-10 02:38:37.448	PUT	{"status":4}	47
297	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-10 02:38:52.015	POST	{"multicast_id":5278469454764196554,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473485931914314%aa7e4a83f9fd7ecd"}]}	47
298	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-10 02:38:50.128	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	47
299	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-10 02:39:31.529	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-10 02:39:32.615","description":"freight home intelligent elevator"}}	48
300	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-10 02:39:33.64	GET	{"message":{"on":true,"moving":false,"maxMass":0.2,"mass":0.0,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-10 02:39:33.643","description":"freight home intelligent car"},"status":4}	48
301	http://localhost:8080/has/arduino/arduino/car/go-to-elevator	[{"width":0.015,"height":0.06,"length":0.005,"mass":0.1,"id":2},{"width":0.065,"height":0.11,"length":0.001,"mass":0.01}]	2016-09-10 02:39:34.667	PUT	{"status":4,"message":"{moving:true}"}	48
302	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-10 02:39:31.529	PUT	{"status":4,"message":{"message":"service activated"}}	48
303	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-10 02:39:37.686	PUT	{"status":4}	48
304	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-10 02:39:52.141	POST	{"multicast_id":7465988279015417893,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473485992042289%aa7e4a83f9fd7ecd"}]}	48
306	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-10 02:39:55.399	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-10 02:39:56.304","description":"freight home intelligent elevator"}}	49
307	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-10 02:39:57.33	GET	{"message":{"on":true,"moving":false,"maxMass":0.2,"mass":0.0,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-10 02:39:57.333","description":"freight home intelligent car"},"status":4}	49
308	http://localhost:8080/has/arduino/arduino/car/go-to-elevator	[{"width":0.015,"height":0.06,"length":0.005,"mass":0.1,"id":2},{"width":0.065,"height":0.11,"length":0.001,"mass":0.01}]	2016-09-10 02:39:58.361	PUT	{"status":4,"message":"{moving:true}"}	49
309	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-10 02:39:55.399	PUT	{"status":4,"message":{"message":"service activated"}}	49
310	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-10 02:40:01.38	PUT	{"status":4}	49
311	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-10 02:40:15.764	POST	{"multicast_id":8849445963144000238,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473486015673265%aa7e4a83f9fd7ecd"}]}	49
312	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-10 02:40:14.048	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	49
313	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-10 02:40:19.579	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-10 02:40:20.478","description":"freight home intelligent elevator"}}	50
314	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-10 02:40:21.494	GET	{"message":{"on":true,"moving":false,"maxMass":0.2,"mass":0.0,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-10 02:40:21.498","description":"freight home intelligent car"},"status":4}	50
315	http://localhost:8080/has/arduino/arduino/car/go-to-elevator	[{"width":0.015,"height":0.06,"length":0.005,"mass":0.1,"id":2},{"width":0.065,"height":0.11,"length":0.001,"mass":0.01}]	2016-09-10 02:40:22.529	PUT	{"status":4,"message":"{moving:true}"}	50
316	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-10 02:40:19.579	PUT	{"status":4,"message":{"message":"service activated"}}	50
317	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-10 02:40:25.552	PUT	{"status":4}	50
318	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-10 02:40:40.318	POST	{"multicast_id":5457932073713139952,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473486040232823%aa7e4a83f9fd7ecd"}]}	50
319	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-10 02:40:38.162	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	50
320	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-10 02:42:27.274	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-10 02:42:28.583","description":"freight home intelligent elevator"}}	51
321	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-10 02:42:29.622	GET	{"message":{"on":true,"moving":false,"maxMass":0.2,"mass":0.0,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-10 02:42:29.626","description":"freight home intelligent car"},"status":4}	51
322	http://localhost:8080/has/arduino/arduino/car/go-to-elevator	[{"width":0.015,"height":0.06,"length":0.005,"mass":0.1,"id":2},{"width":0.065,"height":0.11,"length":0.001,"mass":0.01}]	2016-09-10 02:42:30.656	PUT	{"status":4,"message":"{moving:true}"}	51
323	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-10 02:42:27.274	PUT	{"status":4,"message":{"message":"service activated"}}	51
324	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-10 02:42:33.675	PUT	{"status":4}	51
325	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-10 02:42:48.205	POST	{"multicast_id":6762795270567725959,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473486168101151%aa7e4a83f9fd7ecd"}]}	51
326	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-10 02:42:46.348	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	51
327	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-10 02:43:40.734	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-10 02:43:41.808","description":"freight home intelligent elevator"}}	52
328	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-10 02:43:42.837	GET	{"message":{"on":true,"moving":false,"maxMass":0.2,"mass":0.0,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-10 02:43:42.839","description":"freight home intelligent car"},"status":4}	52
329	http://localhost:8080/has/arduino/arduino/car/go-to-elevator	[{"width":0.015,"height":0.06,"length":0.005,"mass":0.1,"id":2},{"width":0.065,"height":0.11,"length":0.001,"mass":0.01}]	2016-09-10 02:43:43.884	PUT	{"status":4,"message":"{moving:true}"}	52
330	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-10 02:43:40.734	PUT	{"status":4,"message":{"message":"service activated"}}	52
331	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-10 02:43:46.903	PUT	{"status":4}	52
332	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-10 02:44:01.333	POST	{"multicast_id":8339271697137746812,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473486241240718%aa7e4a83f9fd7ecd"}]}	52
333	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-10 02:43:59.568	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	52
334	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-12 22:42:56.022	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-12 22:43:01.009","description":"freight home intelligent elevator"}}	53
336	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-12 22:42:56.022	PUT	{"status":6,"message":{"message":"unknown","reason":"unknown"}}	53
337	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-12 22:47:38.302	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-12 22:47:41.686","description":"freight home intelligent elevator"}}	54
338	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-12 22:47:42.748	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-09-12 22:47:42.763","description":"freight home intelligent car"},"basket":"","status":4}	54
339	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-12 22:47:38.302	PUT	{"status":6,"message":{"message":"operation not allowed","reason":"constraints between elevator and car"}}	54
340	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-12 22:54:27.1	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-12 22:54:29.045","description":"freight home intelligent elevator"}}	55
341	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-12 22:54:30.156	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-09-12 22:54:30.173","description":"freight home intelligent car"},"basket":"","status":4}	55
342	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-12 22:54:27.1	PUT	{"status":6,"message":{"message":"operation not allowed","reason":"constraints between elevator and car"}}	55
343	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-12 22:57:37.837	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-12 22:57:39.284","description":"freight home intelligent elevator"}}	56
344	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-12 22:57:40.382	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-09-12 22:57:40.389","description":"freight home intelligent car"},"basket":"","status":4}	56
345	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-12 22:57:37.837	PUT	{"status":6,"message":{"message":"operation not allowed","reason":"constraints between elevator and car"}}	56
346	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-12 23:00:44.125	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-12 23:00:46.703","description":"freight home intelligent elevator"}}	57
347	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-12 23:00:47.772	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-09-12 23:00:47.778","description":"freight home intelligent car"},"basket":"","status":4}	57
348	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-12 23:00:48.831	PUT	{"status":4,"message":"{moving:true}"}	57
349	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-12 23:00:44.125	PUT	{"status":4,"message":{"message":"service activated"}}	57
350	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-12 23:00:51.854	PUT	{"status":4}	57
351	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-12 23:01:07.028	POST	{"multicast_id":6400257492693111908,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473732066943183%aa7e4a83f9fd7ecd"}]}	57
352	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-12 23:01:04.831	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	57
353	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-12 23:01:18.084	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-12 23:01:19.187","description":"freight home intelligent elevator"}}	58
354	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-12 23:01:20.248	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-12 23:01:20.25","description":"freight home intelligent car"},"basket":"","status":4}	58
355	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-12 23:01:21.789	PUT	{"status":4,"message":"{moving:true}"}	58
356	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-12 23:01:18.084	PUT	{"status":4,"message":{"message":"service activated"}}	58
357	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-12 23:01:24.807	PUT	{"status":4}	58
358	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-12 23:01:49.747	POST	{"multicast_id":6373653253610084117,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473732109647776%aa7e4a83f9fd7ecd"}]}	58
359	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-12 23:01:37.792	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	58
360	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-12 23:02:14.973	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-12 23:02:15.894","description":"freight home intelligent elevator"}}	59
445	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:08:34.606	PUT	{"status":4,"message":"{moving:true}"}	71
361	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-12 23:02:16.948	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-12 23:02:16.951","description":"freight home intelligent car"},"basket":"","status":4}	59
362	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-12 23:02:18.496	PUT	{"status":4,"message":"{moving:true}"}	59
363	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-12 23:02:14.973	PUT	{"status":4,"message":{"message":"service activated"}}	59
364	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-12 23:02:21.516	PUT	{"status":4}	59
365	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-12 23:02:36.609	POST	{"multicast_id":5227557205727830182,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473732156016457%aa7e4a83f9fd7ecd"}]}	59
366	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-12 23:02:34.2	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	59
367	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-12 23:03:18.634	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-12 23:03:25.409","description":"freight home intelligent elevator"}}	60
368	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-12 23:03:26.903	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-12 23:03:26.907","description":"freight home intelligent car"},"basket":"","status":4}	60
369	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-12 23:03:27.969	PUT	{"status":4,"message":"{moving:true}"}	60
370	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-12 23:03:18.634	PUT	{"status":4,"message":{"message":"service activated"}}	60
371	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-12 23:03:30.988	PUT	{"status":4}	60
372	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-12 23:03:45.299	POST	{"multicast_id":8283007011819602583,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473732225216174%aa7e4a83f9fd7ecd"}]}	60
373	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-12 23:03:43.515	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	60
374	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-12 23:05:02.305	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-12 23:05:03.396","description":"freight home intelligent elevator"}}	61
375	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-12 23:05:04.454	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-12 23:05:04.457","description":"freight home intelligent car"},"basket":"","status":4}	61
376	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-12 23:05:05.975	PUT	{"status":4,"message":"{moving:true}"}	61
377	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-12 23:05:08.994	PUT	{"status":4}	61
378	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-12 23:05:02.304	PUT	{"status":4,"message":{"message":"service activated"}}	61
379	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-12 23:05:27.29	POST	{"multicast_id":7452049546707182812,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473732327196007%aa7e4a83f9fd7ecd"}]}	61
380	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-12 23:05:21.62	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	61
381	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-12 23:06:55.546	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-12 23:06:59.0","description":"freight home intelligent elevator"}}	62
382	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-12 23:07:00.056	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-12 23:07:00.06","description":"freight home intelligent car"},"basket":"","status":4}	62
383	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-12 23:07:01.101	PUT	{"status":4,"message":"{moving:true}"}	62
384	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-12 23:06:55.546	PUT	{"status":4,"message":{"message":"service activated"}}	62
385	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-12 23:07:04.119	PUT	{"status":4}	62
386	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-12 23:07:19.984	POST	{"multicast_id":8395387213332350119,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473732439903810%aa7e4a83f9fd7ecd"}]}	62
387	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-12 23:07:16.867	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	62
388	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-12 23:07:23.602	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-12 23:07:24.512","description":"freight home intelligent elevator"}}	63
446	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:08:30.8	PUT	{"status":4,"message":{"message":"service activated"}}	71
389	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-12 23:07:25.559	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-12 23:07:25.562","description":"freight home intelligent car"},"basket":"","status":4}	63
390	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-12 23:07:27.065	PUT	{"status":4,"message":"{moving:true}"}	63
391	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-12 23:07:23.602	PUT	{"status":4,"message":{"message":"service activated"}}	63
392	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-12 23:07:30.084	PUT	{"status":4}	63
393	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-12 23:07:48.53	POST	{"multicast_id":8654673847886011224,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473732468450090%aa7e4a83f9fd7ecd"}]}	63
394	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-12 23:07:45.581	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	63
395	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:03:47.278	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-13 00:03:49.235","description":"freight home intelligent elevator"}}	64
396	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:03:50.313	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:03:50.317","description":"freight home intelligent car"},"basket":"","status":4}	64
397	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:03:51.371	PUT	{"status":4,"message":"{moving:true}"}	64
398	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:03:47.278	PUT	{"status":4,"message":{"message":"service activated"}}	64
399	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 00:03:54.39	PUT	{"status":4}	64
400	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-13 00:04:09.915	POST	{"multicast_id":5585934215274805378,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473735849816014%aa7e4a83f9fd7ecd"}]}	64
401	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-13 00:04:07.112	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	64
402	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:04:19.847	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-13 00:04:21.091","description":"freight home intelligent elevator"}}	65
403	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:04:23.149	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:04:23.152","description":"freight home intelligent car"},"basket":"","status":4}	65
404	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:04:24.2	PUT	{"status":4,"message":"{moving:true}"}	65
405	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:04:19.847	PUT	{"status":4,"message":{"message":"service activated"}}	65
406	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 00:04:27.217	PUT	{"status":4}	65
407	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-13 00:04:41.793	POST	{"multicast_id":7896703898832759456,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473735881695121%aa7e4a83f9fd7ecd"}]}	65
408	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-13 00:04:39.912	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	65
409	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:04:48.317	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-13 00:04:49.236","description":"freight home intelligent elevator"}}	66
410	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:04:50.29	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:04:50.294","description":"freight home intelligent car"},"basket":"","status":4}	66
411	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:04:51.52	PUT	{"status":4,"message":"{moving:true}"}	66
412	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:04:48.317	PUT	{"status":4,"message":{"message":"service activated"}}	66
413	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 00:04:54.538	PUT	{"status":4}	66
414	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-13 00:05:10.53	POST	{"multicast_id":8989368921739337122,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473735910433952%aa7e4a83f9fd7ecd"}]}	66
415	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-13 00:05:09.082	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	66
416	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:05:16.569	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-13 00:05:17.509","description":"freight home intelligent elevator"}}	67
447	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 00:08:37.625	PUT	{"status":4}	71
417	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:05:18.559	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:05:18.562","description":"freight home intelligent car"},"basket":"","status":4}	67
418	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:05:19.617	PUT	{"status":4,"message":"{moving:true}"}	67
419	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:05:16.569	PUT	{"status":4,"message":{"message":"service activated"}}	67
420	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 00:05:22.636	PUT	{"status":4}	67
421	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-13 00:05:36.91	POST	{"multicast_id":5817060218141389657,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473735936817433%aa7e4a83f9fd7ecd"}]}	67
422	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-13 00:05:35.322	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	67
423	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:05:42.248	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-13 00:05:43.146","description":"freight home intelligent elevator"}}	68
424	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:05:44.226	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:05:44.227","description":"freight home intelligent car"},"basket":"","status":4}	68
425	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:05:45.73	PUT	{"status":4,"message":"{moving:true}"}	68
426	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:05:42.248	PUT	{"status":4,"message":{"message":"service activated"}}	68
427	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 00:05:48.747	PUT	{"status":4}	68
428	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-13 00:06:06.33	POST	{"multicast_id":9138906833076588324,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473735966230549%aa7e4a83f9fd7ecd"}]}	68
429	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-13 00:06:01.434	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	68
430	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:06:25.7	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-13 00:06:27.077","description":"freight home intelligent elevator"}}	69
431	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:06:28.613	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:06:28.616","description":"freight home intelligent car"},"basket":"","status":4}	69
432	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:06:29.681	PUT	{"status":4,"message":"{moving:true}"}	69
433	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:06:25.7	PUT	{"status":4,"message":{"message":"service activated"}}	69
434	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-13 00:06:59.329	POST	{"multicast_id":6407551249337138916,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473736019232090%aa7e4a83f9fd7ecd"}]}	69
435	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-13 00:06:54.665	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	69
436	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:07:54.6	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-13 00:07:55.947","description":"freight home intelligent elevator"}}	70
437	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:07:57.009	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:07:57.014","description":"freight home intelligent car"},"basket":"","status":4}	70
438	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:07:58.053	PUT	{"status":4,"message":"{moving:true}"}	70
439	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:07:54.6	PUT	{"status":4,"message":{"message":"service activated"}}	70
440	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 00:08:01.074	PUT	{"status":4}	70
441	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-13 00:08:15.279	POST	{"multicast_id":6716542742882890819,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473736095193767%aa7e4a83f9fd7ecd"}]}	70
442	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-13 00:08:13.689	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	70
443	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:08:30.8	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-13 00:08:32.098","description":"freight home intelligent elevator"}}	71
444	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:08:33.564	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:08:33.567","description":"freight home intelligent car"},"basket":"","status":4}	71
448	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-13 00:08:59.358	POST	{"multicast_id":8531838327265063366,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473736139272901%aa7e4a83f9fd7ecd"}]}	71
449	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-13 00:08:50.743	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	71
450	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:09:03.719	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-13 00:09:05.013","description":"freight home intelligent elevator"}}	72
451	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:09:06.095	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:09:06.098","description":"freight home intelligent car"},"basket":"","status":4}	72
452	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:09:07.139	PUT	{"status":4,"message":"{moving:true}"}	72
453	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:09:03.719	PUT	{"status":4,"message":{"message":"service activated"}}	72
454	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 00:09:10.159	PUT	{"status":4}	72
455	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-13 00:09:24.187	POST	{"multicast_id":5153421576783737256,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473736164103369%aa7e4a83f9fd7ecd"}]}	72
456	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-13 00:09:22.723	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	72
457	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:09:37.031	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-13 00:09:38.38","description":"freight home intelligent elevator"}}	73
458	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:09:40.841	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:09:40.844","description":"freight home intelligent car"},"basket":"","status":4}	73
459	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:09:41.891	PUT	{"status":4,"message":"{moving:true}"}	73
460	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:09:37.031	PUT	{"status":4,"message":{"message":"service activated"}}	73
461	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 00:09:44.909	PUT	{"status":4}	73
462	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-13 00:09:59.343	POST	{"multicast_id":5126280137897946092,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473736199252618%aa7e4a83f9fd7ecd"}]}	73
463	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-13 00:09:57.592	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	73
464	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:10:03.742	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-13 00:10:04.646","description":"freight home intelligent elevator"}}	74
465	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:10:05.699	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:10:05.702","description":"freight home intelligent car"},"basket":"","status":4}	74
466	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:10:07.194	PUT	{"status":4,"message":"{moving:true}"}	74
467	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:10:03.742	PUT	{"status":4,"message":{"message":"service activated"}}	74
468	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 00:10:10.211	PUT	{"status":4}	74
469	https://fcm.googleapis.com/fcm/send	{}	2016-09-13 00:10:25.021	POST	{"multicast_id":4924669483528421356,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473736224920613%aa7e4a83f9fd7ecd"}]}	74
470	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-13 00:10:22.71	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	74
471	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:10:41.074	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-13 00:10:47.327","description":"freight home intelligent elevator"}}	75
472	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:10:49.389	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:10:49.392","description":"freight home intelligent car"},"basket":"","status":4}	75
473	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:10:50.443	PUT	{"status":4,"message":"{moving:true}"}	75
474	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:10:41.074	PUT	{"status":4,"message":{"message":"service activated"}}	75
475	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 00:10:53.461	PUT	{"status":4}	75
476	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-13 00:11:10.222	POST	{"multicast_id":7691086039058283555,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473736270120459%aa7e4a83f9fd7ecd"}]}	75
477	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-13 00:11:08.612	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	75
478	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:11:24.314	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-13 00:11:25.747","description":"freight home intelligent elevator"}}	76
479	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:11:26.826	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:11:26.829","description":"freight home intelligent car"},"basket":"","status":4}	76
480	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:11:28.297	PUT	{"status":4,"message":"{moving:true}"}	76
481	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:11:24.314	PUT	{"status":4,"message":{"message":"service activated"}}	76
482	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 00:11:31.315	PUT	{"status":4}	76
483	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-13 00:11:46.499	POST	{"multicast_id":6411194458337509568,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473736306397625%aa7e4a83f9fd7ecd"}]}	76
484	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-13 00:11:44.002	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	76
485	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:12:02.348	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-13 00:12:03.821","description":"freight home intelligent elevator"}}	77
486	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:12:05.306	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:12:05.309","description":"freight home intelligent car"},"basket":"","status":4}	77
487	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:12:06.358	PUT	{"status":4,"message":"{moving:true}"}	77
488	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:12:02.348	PUT	{"status":4,"message":{"message":"service activated"}}	77
489	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 00:12:09.376	PUT	{"status":4}	77
490	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-13 00:12:26.6	POST	{"multicast_id":6865866723680519367,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473736346514428%aa7e4a83f9fd7ecd"}]}	77
491	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-13 00:12:22.043	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	77
492	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:12:50.885	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-13 00:13:01.003","description":"freight home intelligent elevator"}}	78
493	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:13:02.041	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:13:02.044","description":"freight home intelligent car"},"basket":"","status":4}	78
494	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:13:03.117	PUT	{"status":4,"message":"{moving:true}"}	78
495	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:12:50.885	PUT	{"status":4,"message":{"message":"service activated"}}	78
496	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 00:13:06.135	PUT	{"status":4}	78
497	https://fcm.googleapis.com/fcm/send	{}	2016-09-13 00:13:24.205	POST	{"multicast_id":9171229105984639556,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473736404113703%aa7e4a83f9fd7ecd"}]}	78
498	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-13 00:13:21.63	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	78
499	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:13:50.875	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-13 00:13:52.332","description":"freight home intelligent elevator"}}	79
500	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:13:53.822	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:13:53.825","description":"freight home intelligent car"},"basket":"","status":4}	79
501	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:13:55.863	PUT	{"status":4,"message":"{moving:true}"}	79
502	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:13:50.875	PUT	{"status":4,"message":{"message":"service activated"}}	79
503	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 00:13:58.882	PUT	{"status":4}	79
504	https://fcm.googleapis.com/fcm/send	{}	2016-09-13 00:14:14.942	POST	{"multicast_id":7195539564679200648,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473736454858786%aa7e4a83f9fd7ecd"}]}	79
505	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-13 00:14:11.553	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	79
506	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:14:30.299	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":true,"timestamp":"2016-09-13 00:14:32.345","description":"freight home intelligent elevator"}}	80
507	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:14:34.391	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:14:34.394","description":"freight home intelligent car"},"basket":"","status":4}	80
508	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:14:35.434	PUT	{"status":4,"message":"{moving:true}"}	80
509	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:14:30.299	PUT	{"status":4,"message":{"message":"service activated"}}	80
510	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 00:14:38.453	PUT	{"status":4}	80
511	https://fcm.googleapis.com/fcm/send	{}	2016-09-13 00:14:52.706	POST	{"multicast_id":8541375762431567440,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473736492596716%aa7e4a83f9fd7ecd"}]}	80
512	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-13 00:14:50.93	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	80
513	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:15:04.347	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":true,"timestamp":"2016-09-13 00:15:05.578","description":"freight home intelligent elevator"}}	81
514	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:15:06.624	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:15:06.627","description":"freight home intelligent car"},"basket":"","status":4}	81
515	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:15:08.688	PUT	{"status":4,"message":"{moving:true}"}	81
516	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:15:04.347	PUT	{"status":4,"message":{"message":"service activated"}}	81
517	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 00:15:11.705	PUT	{"status":4}	81
518	https://fcm.googleapis.com/fcm/send	{}	2016-09-13 00:15:26.836	POST	{"multicast_id":7619828852289339729,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473736526750352%aa7e4a83f9fd7ecd"}]}	81
519	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-13 00:15:24.375	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	81
520	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:15:53.537	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":true,"timestamp":"2016-09-13 00:15:54.611","description":"freight home intelligent elevator"}}	82
521	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:15:55.65	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:15:55.652","description":"freight home intelligent car"},"basket":"","status":4}	82
522	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:15:56.677	PUT	{"status":4,"message":"{moving:true}"}	82
523	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:15:53.537	PUT	{"status":4,"message":{"message":"service activated"}}	82
524	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 00:15:59.695	PUT	{"status":4}	82
525	https://fcm.googleapis.com/fcm/send	{}	2016-09-13 00:16:13.908	POST	{"multicast_id":5103733274019185692,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473736573824266%aa7e4a83f9fd7ecd"}]}	82
526	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-13 00:16:12.171	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	82
527	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:28:01.397	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-13 00:28:03.267","description":"freight home intelligent elevator"}}	83
528	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:28:04.755	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:28:04.76","description":"freight home intelligent car"},"basket":"","status":4}	83
529	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:28:05.797	PUT	{"status":4,"message":"{moving:true}"}	83
530	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:28:01.396	PUT	{"status":4,"message":{"message":"service activated"}}	83
531	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 00:28:08.816	PUT	{"status":4}	83
532	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-13 00:28:23.297	POST	{"multicast_id":6201495348080099499,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473737303222197%aa7e4a83f9fd7ecd"}]}	83
533	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-13 00:28:21.513	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	83
534	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:28:26.932	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-13 00:28:27.834","description":"freight home intelligent elevator"}}	84
535	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:28:28.882	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:28:28.885","description":"freight home intelligent car"},"basket":"","status":4}	84
536	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:28:29.929	PUT	{"status":4,"message":"{moving:true}"}	84
537	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:28:26.932	PUT	{"status":4,"message":{"message":"service activated"}}	84
538	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 00:28:32.947	PUT	{"status":4}	84
737	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 00:01:46.545	PUT	{"status":4}	113
539	https://fcm.googleapis.com/fcm/send	{}	2016-09-13 00:28:47.958	POST	{"multicast_id":7058999963284952144,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473737327862717%aa7e4a83f9fd7ecd"}]}	84
540	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-13 00:28:46.013	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	84
541	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:29:44.956	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-13 00:29:46.28","description":"freight home intelligent elevator"}}	85
542	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:29:47.337	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:29:47.34","description":"freight home intelligent car"},"basket":"","status":4}	85
543	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:29:48.384	PUT	{"status":4,"message":"{moving:true}"}	85
544	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:29:44.956	PUT	{"status":4,"message":{"message":"service activated"}}	85
545	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 00:29:51.402	PUT	{"status":4}	85
546	https://fcm.googleapis.com/fcm/send	{}	2016-09-13 00:30:06.412	POST	{"multicast_id":8789194042718729431,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473737406334384%aa7e4a83f9fd7ecd"}]}	85
547	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-13 00:30:04.093	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	85
548	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:30:19.512	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-13 00:30:20.836","description":"freight home intelligent elevator"}}	86
549	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:30:21.879	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:30:21.882","description":"freight home intelligent car"},"basket":"","status":4}	86
550	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:30:22.93	PUT	{"status":4,"message":"{moving:true}"}	86
551	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:30:19.512	PUT	{"status":4,"message":{"message":"service activated"}}	86
552	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 00:30:25.948	PUT	{"status":4}	86
553	https://fcm.googleapis.com/fcm/send	{}	2016-09-13 00:30:40.4	POST	{"multicast_id":8496321529351450763,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473737440303661%aa7e4a83f9fd7ecd"}]}	86
554	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-13 00:30:38.633	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	86
555	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:30:52.522	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-13 00:30:55.712","description":"freight home intelligent elevator"}}	87
556	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:30:58.213	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:30:58.216","description":"freight home intelligent car"},"basket":"","status":4}	87
557	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:30:59.654	PUT	{"status":4,"message":"{moving:true}"}	87
558	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:30:52.522	PUT	{"status":4,"message":{"message":"service activated"}}	87
559	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 00:31:02.674	PUT	{"status":4}	87
560	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-13 00:31:17.68	POST	{"multicast_id":8965379690464729838,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473737477581007%aa7e4a83f9fd7ecd"}]}	87
561	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-13 00:31:15.363	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	87
562	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:31:20.432	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-13 00:31:21.331","description":"freight home intelligent elevator"}}	88
563	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:31:22.384	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:31:22.386","description":"freight home intelligent car"},"basket":"","status":4}	88
564	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:31:23.432	PUT	{"status":4,"message":"{moving:true}"}	88
565	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:31:20.432	PUT	{"status":4,"message":{"message":"service activated"}}	88
566	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 00:31:26.45	PUT	{"status":4}	88
567	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-13 00:31:43.154	POST	{"multicast_id":6629320352026933870,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473737503075209%aa7e4a83f9fd7ecd"}]}	88
568	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-13 00:31:41.777	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	88
602	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-13 04:50:34.945	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	92
569	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:33:40.988	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-13 00:33:44.656","description":"freight home intelligent elevator"}}	89
570	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:33:46.152	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:33:46.154","description":"freight home intelligent car"},"basket":"","status":4}	89
571	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:33:47.206	PUT	{"status":4,"message":"{moving:true}"}	89
572	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:33:40.988	PUT	{"status":4,"message":{"message":"service activated"}}	89
573	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 00:33:50.224	PUT	{"status":4}	89
574	https://fcm.googleapis.com/fcm/send	{}	2016-09-13 00:34:04.965	POST	{"multicast_id":7696890489278651612,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473737644873361%aa7e4a83f9fd7ecd"}]}	89
575	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-13 00:34:03.393	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	89
576	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:34:16.513	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-13 00:34:17.908","description":"freight home intelligent elevator"}}	90
577	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:34:19.942	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:34:19.944","description":"freight home intelligent car"},"basket":"","status":4}	90
578	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:34:20.987	PUT	{"status":4,"message":"{moving:true}"}	90
579	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:34:16.513	PUT	{"status":4,"message":{"message":"service activated"}}	90
580	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 00:34:24.005	PUT	{"status":4}	90
581	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-13 00:34:39.463	POST	{"multicast_id":8462925262944581851,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473737679369387%aa7e4a83f9fd7ecd"}]}	90
582	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-13 00:34:37.083	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	90
583	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 00:34:42.633	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-13 00:34:44.005","description":"freight home intelligent elevator"}}	91
584	http://localhost:8080/has/arduino/arduino/car/actual-info		2016-09-13 00:34:46.043	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 00:34:46.046","description":"freight home intelligent car"},"basket":"","status":4}	91
585	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 00:34:47.084	PUT	{"status":4,"message":"{moving:true}"}	91
586	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 00:34:42.633	PUT	{"status":4,"message":{"message":"service activated"}}	91
587	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 00:34:50.102	PUT	{"status":4}	91
588	https://fcm.googleapis.com/fcm/send	{}	2016-09-13 00:35:04.378	POST	{"multicast_id":6886677253430258552,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473737704288040%aa7e4a83f9fd7ecd"}]}	91
589	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-13 00:35:02.951	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	91
596	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 04:50:09.892	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":true,"timestamp":"2016-09-13 04:50:12.345","description":"freight home intelligent elevator"}}	92
597	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-13 04:50:14.877	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-09-13 04:50:14.898","description":"freight home intelligent car"},"basket":"org.glassfish.json.JsonArrayBuilderImpl@4a9af141","status":4}	92
598	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 04:50:16.84	PUT	{"status":4,"message":"{moving:true}"}	92
599	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 04:50:09.891	PUT	{"status":4,"message":{"message":"service activated"}}	92
600	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 04:50:19.871	PUT	{"status":4}	92
601	https://fcm.googleapis.com/fcm/send	{}	2016-09-13 04:50:36.931	POST	{"multicast_id":4812716255082743595,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473753036782894%aa7e4a83f9fd7ecd"}]}	92
603	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 04:57:22.722	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":true,"timestamp":"2016-09-13 04:57:24.049","description":"freight home intelligent elevator"}}	93
604	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-13 04:57:25.097	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-13 04:57:25.103","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	93
605	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 04:57:26.99	PUT	{"status":4,"message":"{moving:true}"}	93
606	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 04:57:22.722	PUT	{"status":4,"message":{"message":"service activated"}}	93
607	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 04:57:30.01	PUT	{"status":4}	93
608	https://fcm.googleapis.com/fcm/send	{}	2016-09-13 04:57:45.043	POST	{"multicast_id":4700671439458546399,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473753464954028%aa7e4a83f9fd7ecd"}]}	93
609	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-13 04:57:43.095	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	93
610	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 05:14:50.057	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":true,"timestamp":"2016-09-13 05:14:52.165","description":"freight home intelligent elevator"}}	94
611	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-13 05:14:53.224	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-09-13 05:14:53.241","description":"freight home intelligent car"},"basket":"{\\"basket\\":[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]}","status":4}	94
612	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 05:14:55.159	PUT	{"status":4,"message":"{moving:true}"}	94
613	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 05:14:50.057	PUT	{"status":4,"message":{"message":"service activated"}}	94
614	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 05:14:58.183	PUT	{"status":4}	94
615	https://fcm.googleapis.com/fcm/send	{}	2016-09-13 05:15:13.911	POST	{"multicast_id":8385680645974955509,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473754513818214%aa7e4a83f9fd7ecd"}]}	94
616	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-13 05:15:11.075	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	94
617	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-13 05:19:02.794	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":true,"timestamp":"2016-09-13 05:19:04.218","description":"freight home intelligent elevator"}}	95
618	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-13 05:19:05.277	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-09-13 05:19:05.292","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	95
619	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-13 05:19:07.212	PUT	{"status":4,"message":"{moving:true}"}	95
620	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-13 05:19:02.794	PUT	{"status":4,"message":{"message":"service activated"}}	95
621	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-13 05:19:10.237	PUT	{"status":4}	95
622	https://fcm.googleapis.com/fcm/send	{}	2016-09-13 05:19:25.058	POST	{"multicast_id":8747495136001294335,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473754764950282%aa7e4a83f9fd7ecd"}]}	95
623	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-13 05:19:23.208	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	95
625	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-14 22:40:39.88	PUT	{"status":6,"message":{"message":"unknown","reason":"unknown"}}	96
627	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-14 22:43:50.564	PUT	{"status":6,"message":{"message":"unknown","reason":"unknown"}}	97
628	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-14 22:52:37.152	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-14 22:52:39.627","description":"freight home intelligent elevator"}}	98
629	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-14 22:52:40.748	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-09-14 22:52:40.766","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	98
630	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-14 22:52:42.724	PUT	{"status":4,"message":"{moving:true}"}	98
631	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-14 22:52:37.152	PUT	{"status":4,"message":{"message":"service activated"}}	98
632	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-14 22:52:45.752	PUT	{"status":4}	98
633	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-14 22:53:09.717	POST	{"multicast_id":4954268210050750182,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473904389567661%aa7e4a83f9fd7ecd"}]}	98
634	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-14 22:52:59.196	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	98
635	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-14 22:53:29.778	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-14 22:53:30.667","description":"freight home intelligent elevator"}}	99
636	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-14 22:53:31.722	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-14 22:53:31.731","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	99
637	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-14 22:53:33.702	PUT	{"status":4,"message":"{moving:true}"}	99
638	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-14 22:53:29.778	PUT	{"status":4,"message":{"message":"service activated"}}	99
639	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-14 22:53:36.727	PUT	{"status":4}	99
640	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-14 22:53:51.762	POST	{"multicast_id":7291943751021604795,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473904431591035%aa7e4a83f9fd7ecd"}]}	99
641	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-14 22:53:49.661	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	99
642	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-14 23:00:50.385	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":true,"timestamp":"2016-09-14 23:00:52.799","description":"freight home intelligent elevator"}}	100
643	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-14 23:00:53.865	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-14 23:00:53.871","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	100
644	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-14 23:00:55.809	PUT	{"status":4,"message":"{moving:true}"}	100
645	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-14 23:00:50.385	PUT	{"status":4,"message":{"message":"service activated"}}	100
646	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-14 23:00:58.833	PUT	{"status":4}	100
647	https://fcm.googleapis.com/fcm/send	{}	2016-09-14 23:01:15.037	POST	{"multicast_id":5669489151433658676,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473904874916375%aa7e4a83f9fd7ecd"}]}	100
648	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-14 23:01:12.805	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	100
649	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-14 23:01:26.033	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-14 23:01:27.296","description":"freight home intelligent elevator"}}	101
650	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-14 23:01:28.349	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-14 23:01:28.355","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	101
651	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-14 23:01:31.523	PUT	{"status":4,"message":"{moving:true}"}	101
652	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-14 23:01:26.033	PUT	{"status":4,"message":{"message":"service activated"}}	101
653	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-14 23:01:34.546	PUT	{"status":4}	101
654	https://fcm.googleapis.com/fcm/send	{}	2016-09-14 23:01:50.91	POST	{"multicast_id":7355659840565323354,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473904910745234%aa7e4a83f9fd7ecd"}]}	101
655	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-14 23:01:48.067	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	101
656	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-14 23:02:09.684	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-14 23:02:10.945","description":"freight home intelligent elevator"}}	102
683	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-14 23:05:04.584	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	105
684	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-14 23:05:15.87	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-14 23:05:16.939","description":"freight home intelligent elevator"}}	106
657	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-14 23:02:11.999	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-14 23:02:12.005","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	102
658	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-14 23:02:13.92	PUT	{"status":4,"message":"{moving:true}"}	102
659	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-14 23:02:09.684	PUT	{"status":4,"message":{"message":"service activated"}}	102
660	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-14 23:02:16.944	PUT	{"status":4}	102
661	https://fcm.googleapis.com/fcm/send	{}	2016-09-14 23:02:31.9	POST	{"multicast_id":5069696323899624403,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473904951796608%aa7e4a83f9fd7ecd"}]}	102
662	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-14 23:02:30.065	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	102
663	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-14 23:02:44.461	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-14 23:02:45.734","description":"freight home intelligent elevator"}}	103
664	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-14 23:02:46.788	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-14 23:02:46.795","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	103
665	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-14 23:02:48.76	PUT	{"status":4,"message":"{moving:true}"}	103
666	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-14 23:02:44.461	PUT	{"status":4,"message":{"message":"service activated"}}	103
667	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-14 23:02:51.782	PUT	{"status":4}	103
668	https://fcm.googleapis.com/fcm/send	{}	2016-09-14 23:03:06.748	POST	{"multicast_id":7263509019367406286,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473904986648903%aa7e4a83f9fd7ecd"}]}	103
669	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-14 23:03:05.016	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	103
670	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-14 23:03:31.465	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-14 23:03:32.795","description":"freight home intelligent elevator"}}	104
671	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-14 23:03:33.856	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-14 23:03:33.861","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	104
672	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-14 23:03:35.818	PUT	{"status":4,"message":"{moving:true}"}	104
673	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-14 23:03:31.465	PUT	{"status":4,"message":{"message":"service activated"}}	104
674	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-14 23:03:38.839	PUT	{"status":4}	104
675	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-14 23:03:54.229	POST	{"multicast_id":8742768597138032134,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473905034144465%aa7e4a83f9fd7ecd"}]}	104
676	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-14 23:03:51.879	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	104
677	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-14 23:04:12.126	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-14 23:04:28.548","description":"freight home intelligent elevator"}}	105
678	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-14 23:04:30.079	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-14 23:04:30.084","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	105
679	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-14 23:04:48.35	PUT	{"status":4,"message":"{moving:true}"}	105
680	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-14 23:04:12.126	PUT	{"status":4,"message":{"message":"service activated"}}	105
681	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-14 23:04:51.373	PUT	{"status":4}	105
682	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-14 23:05:11.717	POST	{"multicast_id":6745065765297737665,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473905111587913%aa7e4a83f9fd7ecd"}]}	105
685	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-14 23:05:21.702	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-14 23:05:21.705","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	106
686	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-14 23:05:26.34	PUT	{"status":4,"message":"{moving:true}"}	106
687	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-14 23:05:15.87	PUT	{"status":4,"message":{"message":"service activated"}}	106
688	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-14 23:05:29.362	PUT	{"status":4}	106
689	https://fcm.googleapis.com/fcm/send	{}	2016-09-14 23:05:45.178	POST	{"multicast_id":5154661077861045215,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473905145066055%aa7e4a83f9fd7ecd"}]}	106
690	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-14 23:05:42.872	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	106
691	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-14 23:43:05.95	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-14 23:43:07.041","description":"freight home intelligent elevator"}}	107
692	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-14 23:43:08.372	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-14 23:43:08.381","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	107
693	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-14 23:43:11.125	PUT	{"status":4,"message":"{moving:true}"}	107
694	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-14 23:43:05.95	PUT	{"status":4,"message":{"message":"service activated"}}	107
695	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-14 23:43:14.144	PUT	{"status":4}	107
696	https://fcm.googleapis.com/fcm/send	{}	2016-09-14 23:43:29.439	POST	{"multicast_id":4948176132371706379,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473907409330549%aa7e4a83f9fd7ecd"}]}	107
697	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-14 23:43:27.243	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	107
698	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-14 23:50:05.604	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-14 23:50:06.887","description":"freight home intelligent elevator"}}	108
699	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-14 23:50:08.448	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-14 23:50:08.452","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	108
700	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-14 23:50:10.565	PUT	{"status":4,"message":"{moving:true}"}	108
701	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-14 23:50:05.604	PUT	{"status":4,"message":{"message":"service activated"}}	108
702	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-14 23:50:13.586	PUT	{"status":4}	108
703	https://fcm.googleapis.com/fcm/send	{}	2016-09-14 23:50:28.475	POST	{"multicast_id":7860131599081893173,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473907828378332%aa7e4a83f9fd7ecd"}]}	108
704	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-14 23:50:26.689	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	108
705	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-14 23:56:05.903	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-14 23:56:07.801","description":"freight home intelligent elevator"}}	109
706	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-14 23:56:08.853	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-14 23:56:08.86","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	109
707	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-14 23:56:10.778	PUT	{"status":4,"message":"{moving:true}"}	109
708	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-14 23:56:05.903	PUT	{"status":4,"message":{"message":"service activated"}}	109
709	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-14 23:56:13.799	PUT	{"status":4}	109
710	https://fcm.googleapis.com/fcm/send	{}	2016-09-14 23:56:29.001	POST	{"multicast_id":7140734308433073991,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473908188875552%aa7e4a83f9fd7ecd"}]}	109
711	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-14 23:56:26.742	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	109
736	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 00:01:39.295	PUT	{"status":4,"message":{"message":"service activated"}}	113
1739	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 23:20:01.537	PUT	{"status":4}	255
712	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-14 23:58:39.626	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-14 23:58:41.588","description":"freight home intelligent elevator"}}	110
713	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-14 23:58:42.626	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-14 23:58:42.63","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	110
714	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-14 23:58:44.533	PUT	{"status":4,"message":"{moving:true}"}	110
715	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-14 23:58:47.553	PUT	{"status":4}	110
716	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-14 23:58:39.626	PUT	{"status":4,"message":{"message":"service activated"}}	110
717	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-14 23:59:03.564	POST	{"multicast_id":8356405673716607800,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473908343476900%aa7e4a83f9fd7ecd"}]}	110
718	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-14 23:59:01.64	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	110
719	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-14 23:59:38.105	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-14 23:59:45.027","description":"freight home intelligent elevator"}}	111
720	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-14 23:59:46.097	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-14 23:59:46.101","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	111
721	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-14 23:59:48.916	PUT	{"status":4,"message":"{moving:true}"}	111
722	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-14 23:59:38.105	PUT	{"status":4,"message":{"message":"service activated"}}	111
723	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-14 23:59:51.936	PUT	{"status":4}	111
724	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 00:00:07.259	POST	{"multicast_id":4857797873979203982,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473908407159864%aa7e4a83f9fd7ecd"}]}	111
725	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 00:00:05.481	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	111
726	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 00:01:08.168	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 00:01:09.248","description":"freight home intelligent elevator"}}	112
727	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 00:01:11.281	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 00:01:11.285","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	112
728	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 00:01:13.195	PUT	{"status":4,"message":"{moving:true}"}	112
729	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 00:01:08.168	PUT	{"status":4,"message":{"message":"service activated"}}	112
730	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 00:01:16.215	PUT	{"status":4}	112
731	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 00:01:31.04	POST	{"multicast_id":8232240860044638030,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473908490937907%aa7e4a83f9fd7ecd"}]}	112
732	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 00:01:29.29	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	112
733	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 00:01:39.295	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 00:01:40.594","description":"freight home intelligent elevator"}}	113
734	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 00:01:41.63	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 00:01:41.633","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	113
735	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 00:01:43.523	PUT	{"status":4,"message":"{moving:true}"}	113
738	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 00:02:02.385	POST	{"multicast_id":7344147839020509426,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473908522281877%aa7e4a83f9fd7ecd"}]}	113
739	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 00:02:00.634	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	113
740	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 00:02:17.486	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 00:02:19.041","description":"freight home intelligent elevator"}}	114
741	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 00:02:20.11	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 00:02:20.114","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	114
742	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 00:02:23.498	PUT	{"status":4,"message":"{moving:true}"}	114
743	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 00:02:17.486	PUT	{"status":4,"message":{"message":"service activated"}}	114
744	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 00:02:26.518	PUT	{"status":4}	114
745	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 00:02:41.353	POST	{"multicast_id":8497231081721807135,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473908561261382%aa7e4a83f9fd7ecd"}]}	114
746	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 00:02:39.611	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	114
747	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 00:02:43.845	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 00:02:44.744","description":"freight home intelligent elevator"}}	115
748	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 00:02:45.863	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 00:02:45.866","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	115
749	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 00:02:47.766	PUT	{"status":4,"message":"{moving:true}"}	115
750	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 00:02:43.845	PUT	{"status":4,"message":{"message":"service activated"}}	115
751	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 00:02:50.786	PUT	{"status":4}	115
752	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 00:03:14.192	POST	{"multicast_id":4675370380077204676,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473908594085297%aa7e4a83f9fd7ecd"}]}	115
753	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 00:03:07.19	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	115
754	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 00:03:20.026	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 00:03:20.931","description":"freight home intelligent elevator"}}	116
755	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 00:03:21.977	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 00:03:21.981","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	116
756	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 00:03:24.373	PUT	{"status":4,"message":"{moving:true}"}	116
757	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 00:03:20.026	PUT	{"status":4,"message":{"message":"service activated"}}	116
758	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 00:03:27.392	PUT	{"status":4}	116
759	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 00:03:42.671	POST	{"multicast_id":9119564662521867038,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473908622549118%aa7e4a83f9fd7ecd"}]}	116
760	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 00:03:40.471	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	116
761	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 00:04:26.281	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 00:04:27.568","description":"freight home intelligent elevator"}}	117
2013	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 21:47:28.9	PUT	{"status":4}	295
762	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 00:04:28.633	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 00:04:28.637","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	117
763	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 00:04:31.89	PUT	{"status":4,"message":"{moving:true}"}	117
764	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 00:04:26.281	PUT	{"status":4,"message":{"message":"service activated"}}	117
765	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 00:04:34.912	PUT	{"status":4}	117
766	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 00:04:56.31	POST	{"multicast_id":6588590279150786740,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473908696207498%aa7e4a83f9fd7ecd"}]}	117
767	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 00:04:48.46	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	117
768	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 00:05:12.398	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 00:05:13.299","description":"freight home intelligent elevator"}}	118
769	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 00:05:14.341	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 00:05:14.345","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	118
770	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 00:05:16.718	PUT	{"status":4,"message":"{moving:true}"}	118
771	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 00:05:12.398	PUT	{"status":4,"message":{"message":"service activated"}}	118
772	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 00:05:19.738	PUT	{"status":4}	118
773	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 00:05:36.212	POST	{"multicast_id":6932345984345802014,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473908736077240%aa7e4a83f9fd7ecd"}]}	118
774	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 00:05:33.7	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	118
775	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 00:06:22.995	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 00:06:24.413","description":"freight home intelligent elevator"}}	119
776	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 00:06:25.438	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 00:06:25.442","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	119
777	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 00:06:27.356	PUT	{"status":4,"message":"{moving:true}"}	119
778	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 00:06:22.995	PUT	{"status":4,"message":{"message":"service activated"}}	119
779	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 00:06:30.376	PUT	{"status":4}	119
780	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 00:06:48.344	POST	{"multicast_id":8499871513052648399,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473908808254149%aa7e4a83f9fd7ecd"}]}	119
781	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 00:06:46.46	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	119
782	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 00:07:16.13	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 00:07:17.456","description":"freight home intelligent elevator"}}	120
783	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 00:07:18.479	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 00:07:18.482","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	120
784	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 00:07:20.394	PUT	{"status":4,"message":"{moving:true}"}	120
785	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 00:07:16.13	PUT	{"status":4,"message":{"message":"service activated"}}	120
786	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 00:07:23.414	PUT	{"status":4}	120
787	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 00:07:39.229	POST	{"multicast_id":8692267023712723338,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473908859146990%aa7e4a83f9fd7ecd"}]}	120
788	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 00:07:37.49	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	120
789	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 00:08:06.062	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 00:08:07.476","description":"freight home intelligent elevator"}}	121
790	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 00:08:08.511	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 00:08:08.515","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	121
791	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 00:08:10.454	PUT	{"status":4,"message":"{moving:true}"}	121
792	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 00:08:06.062	PUT	{"status":4,"message":{"message":"service activated"}}	121
793	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 00:08:13.474	PUT	{"status":4}	121
794	https://fcm.googleapis.com/fcm/send	{}	2016-09-15 00:08:33.335	POST	{"multicast_id":4950229499824814592,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473908913202176%aa7e4a83f9fd7ecd"}]}	121
795	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-15 00:08:26.572	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	121
796	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 00:11:32.427	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 00:11:34.701","description":"freight home intelligent elevator"}}	122
797	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 00:11:36.181	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 00:11:36.185","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	122
798	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 00:11:38.116	PUT	{"status":4,"message":"{moving:true}"}	122
799	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 00:11:32.427	PUT	{"status":4,"message":{"message":"service activated"}}	122
800	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 00:11:41.135	PUT	{"status":4}	122
801	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 00:11:56.971	POST	{"multicast_id":5284813917430650293,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473909116870623%aa7e4a83f9fd7ecd"}]}	122
802	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 00:11:55.227	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	122
803	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 00:12:12.075	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 00:12:13.294","description":"freight home intelligent elevator"}}	123
804	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 00:12:14.318	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 00:12:14.322","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	123
805	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 00:12:17.232	PUT	{"status":4,"message":"{moving:true}"}	123
806	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 00:12:12.075	PUT	{"status":4,"message":{"message":"service activated"}}	123
807	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 00:12:20.25	PUT	{"status":4}	123
808	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 00:12:35.871	POST	{"multicast_id":7301829459037087755,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473909155776894%aa7e4a83f9fd7ecd"}]}	123
809	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 00:12:33.132	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	123
810	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 00:12:45.097	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 00:12:46.571","description":"freight home intelligent elevator"}}	124
886	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 00:53:55.821	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	134
811	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 00:12:47.62	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 00:12:47.624","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	124
812	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 00:12:49.549	PUT	{"status":4,"message":"{moving:true}"}	124
813	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 00:12:45.097	PUT	{"status":4,"message":{"message":"service activated"}}	124
814	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 00:12:52.568	PUT	{"status":4}	124
815	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 00:13:07.508	POST	{"multicast_id":4925351730100105250,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473909187405132%aa7e4a83f9fd7ecd"}]}	124
816	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 00:13:05.64	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	124
817	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 00:13:17.435	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 00:13:19.137","description":"freight home intelligent elevator"}}	125
818	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 00:13:20.163	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 00:13:20.166","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	125
819	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 00:13:22.523	PUT	{"status":4,"message":"{moving:true}"}	125
820	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 00:13:17.435	PUT	{"status":4,"message":{"message":"service activated"}}	125
821	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 00:13:25.543	PUT	{"status":4}	125
822	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 00:13:46.013	POST	{"multicast_id":8642626078464106198,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473909225893291%aa7e4a83f9fd7ecd"}]}	125
823	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 00:13:38.62	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	125
824	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 00:13:50.916	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 00:13:52.346","description":"freight home intelligent elevator"}}	126
825	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 00:13:53.383	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 00:13:53.387","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	126
826	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 00:13:55.308	PUT	{"status":4,"message":"{moving:true}"}	126
827	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 00:13:50.916	PUT	{"status":4,"message":{"message":"service activated"}}	126
828	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 00:13:58.328	PUT	{"status":4}	126
829	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 00:14:12.831	POST	{"multicast_id":9125707488855582514,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473909252715259%aa7e4a83f9fd7ecd"}]}	126
830	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 00:14:11.41	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	126
831	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 00:14:15.547	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 00:14:16.454","description":"freight home intelligent elevator"}}	127
832	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 00:14:17.496	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 00:14:17.499","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	127
833	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 00:14:19.41	PUT	{"status":4,"message":"{moving:true}"}	127
834	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 00:14:15.547	PUT	{"status":4,"message":{"message":"service activated"}}	127
835	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 00:14:22.43	PUT	{"status":4}	127
836	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 00:14:37.747	POST	{"multicast_id":7693229460191431274,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473909277654681%aa7e4a83f9fd7ecd"}]}	127
837	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 00:14:36.01	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	127
838	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 00:14:43.817	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 00:14:45.214","description":"freight home intelligent elevator"}}	128
839	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 00:14:46.259	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 00:14:46.262","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	128
840	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 00:14:48.197	PUT	{"status":4,"message":"{moving:true}"}	128
841	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 00:14:43.817	PUT	{"status":4,"message":{"message":"service activated"}}	128
842	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 00:14:51.215	PUT	{"status":4}	128
843	https://fcm.googleapis.com/fcm/send	{}	2016-09-15 00:15:07.133	POST	{"multicast_id":7544274041336662205,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473909307032767%aa7e4a83f9fd7ecd"}]}	128
844	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-15 00:15:04.29	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	128
845	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 00:17:20.673	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 00:17:22.468","description":"freight home intelligent elevator"}}	129
846	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 00:17:23.504	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 00:17:23.508","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	129
847	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 00:17:25.402	PUT	{"status":4,"message":"{moving:true}"}	129
848	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 00:17:20.673	PUT	{"status":4,"message":{"message":"service activated"}}	129
849	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 00:17:28.421	PUT	{"status":4}	129
850	https://fcm.googleapis.com/fcm/send	{}	2016-09-15 00:17:43.651	POST	{"multicast_id":5830991893103066443,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473909463558833%aa7e4a83f9fd7ecd"}]}	129
851	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-15 00:17:41.511	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	129
852	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 00:20:28.674	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 00:20:30.094","description":"freight home intelligent elevator"}}	130
853	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 00:20:31.129	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 00:20:31.132","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	130
854	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 00:20:33.045	PUT	{"status":4,"message":"{moving:true}"}	130
855	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 00:20:28.674	PUT	{"status":4,"message":{"message":"service activated"}}	130
856	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 00:20:36.064	PUT	{"status":4}	130
857	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 00:20:50.911	POST	{"multicast_id":7160210965635950586,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473909650819290%aa7e4a83f9fd7ecd"}]}	130
858	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 00:20:49.171	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	130
859	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 00:51:25.483	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 00:51:32.395","description":"freight home intelligent elevator"}}	131
885	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 00:53:57.599	POST	{"multicast_id":8285931652233017386,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473911637490132%aa7e4a83f9fd7ecd"}]}	134
2475	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-26 15:26:09.046	PUT	{"status":4}	377
860	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 00:51:33.435	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 00:51:33.438","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	131
861	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 00:51:35.328	PUT	{"status":4,"message":"{moving:true}"}	131
862	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 00:51:25.483	PUT	{"status":4,"message":{"message":"service activated"}}	131
863	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 00:51:38.346	PUT	{"status":4}	131
864	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 00:52:03.155	POST	{"multicast_id":6249226823074669818,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473911523044725%aa7e4a83f9fd7ecd"}]}	131
865	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 00:51:51.476	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	131
866	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 00:52:17.316	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 00:52:19.211","description":"freight home intelligent elevator"}}	132
867	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 00:52:20.258	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 00:52:20.261","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	132
868	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 00:52:22.18	PUT	{"status":4,"message":"{moving:true}"}	132
869	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 00:52:17.316	PUT	{"status":4,"message":{"message":"service activated"}}	132
870	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 00:52:25.199	PUT	{"status":4}	132
871	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 00:52:46.435	POST	{"multicast_id":8243779067672628302,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473911566338112%aa7e4a83f9fd7ecd"}]}	132
872	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 00:52:39.124	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	132
873	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 00:52:52.925	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 00:52:53.818","description":"freight home intelligent elevator"}}	133
874	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 00:52:54.869	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 00:52:54.873","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	133
875	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 00:53:13.823	PUT	{"status":4,"message":"{moving:true}"}	133
876	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 00:52:52.925	PUT	{"status":4,"message":{"message":"service activated"}}	133
877	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 00:53:16.843	PUT	{"status":4}	133
878	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 00:53:32.737	POST	{"multicast_id":8468449949884364453,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473911612624785%aa7e4a83f9fd7ecd"}]}	133
879	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 00:53:29.846	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	133
880	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 00:53:35.865	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 00:53:36.769","description":"freight home intelligent elevator"}}	134
881	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 00:53:37.816	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 00:53:37.819","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	134
882	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 00:53:39.743	PUT	{"status":4,"message":"{moving:true}"}	134
883	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 00:53:35.865	PUT	{"status":4,"message":{"message":"service activated"}}	134
884	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 00:53:42.762	PUT	{"status":4}	134
887	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 00:54:14.459	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 00:54:15.353","description":"freight home intelligent elevator"}}	135
888	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 00:54:16.405	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 00:54:16.408","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	135
889	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 00:54:18.323	PUT	{"status":4,"message":"{moving:true}"}	135
890	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 00:54:14.459	PUT	{"status":4,"message":{"message":"service activated"}}	135
891	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 00:54:21.342	PUT	{"status":4}	135
892	https://fcm.googleapis.com/fcm/send	{}	2016-09-15 00:54:36.498	POST	{"multicast_id":5189573053306729974,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473911676411550%aa7e4a83f9fd7ecd"}]}	135
893	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-15 00:54:34.434	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	135
894	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 00:54:49.987	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 00:54:50.894","description":"freight home intelligent elevator"}}	136
895	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 00:54:51.964	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 00:54:51.967","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	136
896	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 00:54:54.319	PUT	{"status":4,"message":"{moving:true}"}	136
897	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 00:54:49.986	PUT	{"status":4,"message":{"message":"service activated"}}	136
898	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 00:54:57.338	PUT	{"status":4}	136
899	https://fcm.googleapis.com/fcm/send	{}	2016-09-15 00:55:17.533	POST	{"multicast_id":6879312986150390673,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473911717427747%aa7e4a83f9fd7ecd"}]}	136
900	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-15 00:55:10.394	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	136
901	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 00:55:31.017	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 00:55:31.911","description":"freight home intelligent elevator"}}	137
902	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 00:55:32.938	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 00:55:32.941","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	137
903	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 00:55:34.862	PUT	{"status":4,"message":"{moving:true}"}	137
904	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 00:55:31.017	PUT	{"status":4,"message":{"message":"service activated"}}	137
905	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 00:55:37.881	PUT	{"status":4}	137
906	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 00:55:52.955	POST	{"multicast_id":7731242223100744721,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473911752870573%aa7e4a83f9fd7ecd"}]}	137
907	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 00:55:50.81	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	137
908	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 00:56:08.843	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 00:56:09.731","description":"freight home intelligent elevator"}}	138
909	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 00:56:13.773	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 00:56:13.777","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	138
910	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 00:56:16.667	PUT	{"status":4,"message":"{moving:true}"}	138
911	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 00:56:08.843	PUT	{"status":4,"message":{"message":"service activated"}}	138
912	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 00:56:19.685	PUT	{"status":4}	138
1037	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 01:38:53.546	PUT	{"status":4,"message":{"message":"service activated"}}	156
913	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 00:56:35.382	POST	{"multicast_id":6683923518607771950,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473911795279297%aa7e4a83f9fd7ecd"}]}	138
914	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 00:56:33.203	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	138
915	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 01:03:47.143	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 01:03:48.763","description":"freight home intelligent elevator"}}	139
916	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 01:03:49.789	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 01:03:49.792","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	139
917	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 01:03:51.684	PUT	{"status":4,"message":"{moving:true}"}	139
918	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 01:03:47.143	PUT	{"status":4,"message":{"message":"service activated"}}	139
919	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 01:03:54.703	PUT	{"status":4}	139
920	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 01:04:09.409	POST	{"multicast_id":5509511793876291609,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473912249303457%aa7e4a83f9fd7ecd"}]}	139
921	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 01:04:07.674	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	139
922	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 01:04:13.914	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 01:04:14.806","description":"freight home intelligent elevator"}}	140
923	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 01:04:15.838	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 01:04:15.841","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	140
924	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 01:04:17.765	PUT	{"status":4,"message":"{moving:true}"}	140
925	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 01:04:13.914	PUT	{"status":4,"message":{"message":"service activated"}}	140
926	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 01:04:20.783	PUT	{"status":4}	140
927	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 01:04:35.093	POST	{"multicast_id":6465153586191299170,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473912274987558%aa7e4a83f9fd7ecd"}]}	140
928	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 01:04:33.704	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	140
929	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 01:04:50.405	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 01:04:51.649","description":"freight home intelligent elevator"}}	141
930	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 01:04:52.69	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 01:04:52.693","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	141
931	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 01:04:54.574	PUT	{"status":4,"message":"{moving:true}"}	141
932	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 01:04:50.405	PUT	{"status":4,"message":{"message":"service activated"}}	141
933	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 01:04:57.593	PUT	{"status":4}	141
934	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 01:05:12.226	POST	{"multicast_id":9092425551116563908,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473912312126206%aa7e4a83f9fd7ecd"}]}	141
935	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 01:05:10.504	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	141
936	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 01:06:13.475	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 01:06:14.931","description":"freight home intelligent elevator"}}	142
1038	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 01:39:01.885	PUT	{"status":4}	156
937	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 01:06:15.951	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 01:06:15.954","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	142
938	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 01:06:17.869	PUT	{"status":4,"message":"{moving:true}"}	142
939	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 01:06:13.475	PUT	{"status":4,"message":{"message":"service activated"}}	142
940	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 01:06:20.887	PUT	{"status":4}	142
941	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 01:06:38.304	POST	{"multicast_id":7850590040502798325,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473912398221998%aa7e4a83f9fd7ecd"}]}	142
942	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 01:06:34.255	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	142
943	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 01:20:19.283	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 01:20:20.579","description":"freight home intelligent elevator"}}	143
944	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 01:20:21.602	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 01:20:21.606","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	143
945	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 01:20:23.501	PUT	{"status":4,"message":"{moving:true}"}	143
946	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 01:20:19.283	PUT	{"status":4,"message":{"message":"service activated"}}	143
947	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 01:20:26.52	PUT	{"status":4}	143
948	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 01:20:41.007	POST	{"multicast_id":6909911470359911712,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473913240912985%aa7e4a83f9fd7ecd"}]}	143
949	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 01:20:39.309	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	143
950	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 01:21:29.598	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 01:21:31.081","description":"freight home intelligent elevator"}}	144
951	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 01:21:32.112	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 01:21:32.115","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	144
952	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 01:21:33.998	PUT	{"status":4,"message":"{moving:true}"}	144
953	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 01:21:29.598	PUT	{"status":4,"message":{"message":"service activated"}}	144
954	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 01:21:37.018	PUT	{"status":4}	144
955	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 01:21:52.208	POST	{"multicast_id":5053035682820510370,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473913312110829%aa7e4a83f9fd7ecd"}]}	144
956	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 01:21:49.933	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	144
957	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 01:21:58.627	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 01:21:59.51","description":"freight home intelligent elevator"}}	145
958	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 01:22:00.553	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 01:22:00.556","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	145
959	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 01:22:03.153	PUT	{"status":4,"message":"{moving:true}"}	145
960	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 01:21:58.627	PUT	{"status":4,"message":{"message":"service activated"}}	145
961	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 01:22:06.172	PUT	{"status":4}	145
962	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 01:22:20.611	POST	{"multicast_id":4922153727327872492,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473913340512232%aa7e4a83f9fd7ecd"}]}	145
963	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 01:22:19.073	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	145
964	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 01:22:34.168	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 01:22:35.616","description":"freight home intelligent elevator"}}	146
965	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 01:22:37.144	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 01:22:37.147","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	146
966	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 01:22:39.022	PUT	{"status":4,"message":"{moving:true}"}	146
967	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 01:22:34.168	PUT	{"status":4,"message":{"message":"service activated"}}	146
968	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 01:22:42.04	PUT	{"status":4}	146
969	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 01:22:57.254	POST	{"multicast_id":5453396116361222198,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473913377169490%aa7e4a83f9fd7ecd"}]}	146
970	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 01:22:54.976	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	146
971	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 01:23:01.388	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 01:23:02.279","description":"freight home intelligent elevator"}}	147
972	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 01:23:03.312	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 01:23:03.315","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	147
973	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 01:23:05.188	PUT	{"status":4,"message":"{moving:true}"}	147
974	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 01:23:01.388	PUT	{"status":4,"message":{"message":"service activated"}}	147
975	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 01:23:08.206	PUT	{"status":4}	147
976	https://fcm.googleapis.com/fcm/send	{}	2016-09-15 01:23:22.524	POST	{"multicast_id":6244018779086648533,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473913402411365%aa7e4a83f9fd7ecd"}]}	147
977	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-15 01:23:21.113	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	147
978	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 01:24:30.284	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 01:24:31.509","description":"freight home intelligent elevator"}}	148
979	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 01:24:32.533	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 01:24:32.536","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	148
980	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 01:24:34.409	PUT	{"status":4,"message":"{moving:true}"}	148
981	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 01:24:30.284	PUT	{"status":4,"message":{"message":"service activated"}}	148
982	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 01:24:37.428	PUT	{"status":4}	148
983	https://fcm.googleapis.com/fcm/send	{}	2016-09-15 01:24:52.375	POST	{"multicast_id":6720261663261348242,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473913492269105%aa7e4a83f9fd7ecd"}]}	148
984	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-15 01:24:50.354	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	148
985	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 01:27:53.863	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 01:27:55.242","description":"freight home intelligent elevator"}}	149
1011	https://fcm.googleapis.com/fcm/send	{}	2016-09-15 01:32:53.56	POST	{"multicast_id":7199322670517859379,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473913973463788%aa7e4a83f9fd7ecd"}]}	152
1012	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-15 01:32:46.673	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	152
986	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 01:27:56.26	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 01:27:56.263","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	149
987	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 01:27:58.15	PUT	{"status":4,"message":"{moving:true}"}	149
988	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 01:27:53.863	PUT	{"status":4,"message":{"message":"service activated"}}	149
989	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 01:28:01.169	PUT	{"status":4}	149
990	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 01:28:16.779	POST	{"multicast_id":5217152026980459372,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473913696676309%aa7e4a83f9fd7ecd"}]}	149
991	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 01:28:14.083	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	149
992	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 01:28:42.04	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 01:28:43.256","description":"freight home intelligent elevator"}}	150
993	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 01:28:44.285	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 01:28:44.288","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	150
994	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 01:28:46.213	PUT	{"status":4,"message":"{moving:true}"}	150
995	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 01:28:42.04	PUT	{"status":4,"message":{"message":"service activated"}}	150
996	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 01:28:49.23	PUT	{"status":4}	150
997	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 01:29:03.831	POST	{"multicast_id":5609355743390417105,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473913743740975%aa7e4a83f9fd7ecd"}]}	150
998	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 01:29:02.148	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	150
999	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 01:31:21.413	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 01:31:22.9","description":"freight home intelligent elevator"}}	151
1000	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 01:31:23.927	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 01:31:23.93","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	151
1001	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 01:31:26.301	PUT	{"status":4,"message":"{moving:true}"}	151
1002	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 01:31:21.413	PUT	{"status":4,"message":{"message":"service activated"}}	151
1003	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 01:31:29.319	PUT	{"status":4}	151
1004	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 01:31:43.89	POST	{"multicast_id":5241316628468394985,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473913903813570%aa7e4a83f9fd7ecd"}]}	151
1005	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 01:31:42.233	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	151
1006	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 01:32:26.321	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 01:32:27.799","description":"freight home intelligent elevator"}}	152
1007	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 01:32:28.837	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 01:32:28.839","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	152
1008	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 01:32:30.73	PUT	{"status":4,"message":"{moving:true}"}	152
1009	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 01:32:26.321	PUT	{"status":4,"message":{"message":"service activated"}}	152
1010	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 01:32:33.75	PUT	{"status":4}	152
1013	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 01:33:19.302	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 01:33:20.98","description":"freight home intelligent elevator"}}	153
1014	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 01:33:22.006	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 01:33:22.008","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	153
1015	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 01:33:23.909	PUT	{"status":4,"message":"{moving:true}"}	153
1016	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 01:33:19.302	PUT	{"status":4,"message":{"message":"service activated"}}	153
1017	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 01:33:26.928	PUT	{"status":4}	153
1018	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 01:33:42.241	POST	{"multicast_id":8398800328775666439,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473914022144959%aa7e4a83f9fd7ecd"}]}	153
1019	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 01:33:40.322	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	153
1020	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 01:34:16.873	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 01:34:18.315","description":"freight home intelligent elevator"}}	154
1021	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 01:34:19.768	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 01:34:19.77","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	154
1022	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 01:34:21.665	PUT	{"status":4,"message":"{moving:true}"}	154
1023	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 01:34:16.873	PUT	{"status":4,"message":{"message":"service activated"}}	154
1024	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 01:34:24.684	PUT	{"status":4}	154
1025	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 01:34:39.44	POST	{"multicast_id":4744535677789759481,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473914079326456%aa7e4a83f9fd7ecd"}]}	154
1026	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 01:34:37.502	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	154
1027	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 01:37:49.872	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 01:37:51.964","description":"freight home intelligent elevator"}}	155
1028	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 01:37:52.985	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 01:37:52.988","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	155
1029	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 01:37:56.303	PUT	{"status":4,"message":"{moving:true}"}	155
1030	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 01:37:49.872	PUT	{"status":4,"message":{"message":"service activated"}}	155
1031	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 01:37:59.322	PUT	{"status":4}	155
1032	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 01:38:14.883	POST	{"multicast_id":5591789377737434172,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473914294767747%aa7e4a83f9fd7ecd"}]}	155
1033	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 01:38:12.242	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	155
1034	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 01:38:53.546	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 01:38:54.932","description":"freight home intelligent elevator"}}	156
1035	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 01:38:55.97	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 01:38:55.973","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	156
1036	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 01:38:58.867	PUT	{"status":4,"message":"{moving:true}"}	156
1039	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 01:39:18.144	POST	{"multicast_id":8496768987933207870,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473914358069350%aa7e4a83f9fd7ecd"}]}	156
1040	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 01:39:16.302	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	156
1041	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 01:47:24.987	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 01:47:26.39","description":"freight home intelligent elevator"}}	157
1042	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 01:47:27.421	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 01:47:27.425","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	157
1043	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 01:47:29.297	PUT	{"status":4,"message":"{moving:true}"}	157
1044	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 01:47:24.987	PUT	{"status":4,"message":{"message":"service activated"}}	157
1045	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 01:47:32.316	PUT	{"status":4}	157
1046	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 01:47:47.163	POST	{"multicast_id":8645019407551982151,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473914867056695%aa7e4a83f9fd7ecd"}]}	157
1047	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 01:47:45.262	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	157
1048	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 01:48:31.743	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 01:48:33.158","description":"freight home intelligent elevator"}}	158
1049	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 01:48:34.188	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 01:48:34.192","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	158
1050	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 01:48:36.083	PUT	{"status":4,"message":"{moving:true}"}	158
1051	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 01:48:31.743	PUT	{"status":4,"message":{"message":"service activated"}}	158
1052	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 01:48:39.102	PUT	{"status":4}	158
1053	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 01:48:54.177	POST	{"multicast_id":6851300624961261939,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473914934064579%aa7e4a83f9fd7ecd"}]}	158
1054	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 01:48:52.021	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	158
1055	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 01:49:09.57	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 01:49:11.456","description":"freight home intelligent elevator"}}	159
1056	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 01:49:12.482	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 01:49:12.486","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	159
1057	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 01:49:14.365	PUT	{"status":4,"message":"{moving:true}"}	159
1058	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 01:49:09.57	PUT	{"status":4,"message":{"message":"service activated"}}	159
1059	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 01:49:17.384	PUT	{"status":4}	159
1060	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 01:49:32.208	POST	{"multicast_id":5238137188337374935,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473914972094908%aa7e4a83f9fd7ecd"}]}	159
1061	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 01:49:30.301	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	159
1062	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 02:06:07.026	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 02:06:09.06","description":"freight home intelligent elevator"}}	160
1113	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 05:09:09.887	PUT	{"status":4,"message":"{moving:true}"}	167
1063	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 02:06:10.092	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 02:06:10.098","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	160
1064	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 02:06:12	PUT	{"status":4,"message":"{moving:true}"}	160
1065	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 02:06:07.026	PUT	{"status":4,"message":{"message":"service activated"}}	160
1066	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 02:06:15.019	PUT	{"status":4}	160
1067	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 02:06:30.842	POST	{"multicast_id":5145490974218845035,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473915990757395%aa7e4a83f9fd7ecd"}]}	160
1068	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 02:06:28.4	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	160
1069	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 02:06:39.637	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 02:06:41.109","description":"freight home intelligent elevator"}}	161
1070	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 02:06:42.134	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 02:06:42.137","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	161
1071	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 02:06:44.459	PUT	{"status":4,"message":"{moving:true}"}	161
1072	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 02:06:39.637	PUT	{"status":4,"message":{"message":"service activated"}}	161
1073	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 02:06:47.478	PUT	{"status":4}	161
1074	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 02:07:02.09	POST	{"multicast_id":5714584471689004835,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473916021989153%aa7e4a83f9fd7ecd"}]}	161
1075	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 02:07:00.394	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	161
1076	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 02:24:58.017	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 02:25:02.392","description":"freight home intelligent elevator"}}	162
1077	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 02:25:03.407	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 02:25:03.41","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	162
1078	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 02:25:05.296	PUT	{"status":4,"message":"{moving:true}"}	162
1079	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 02:24:58.017	PUT	{"status":4,"message":{"message":"service activated"}}	162
1080	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 02:25:08.314	PUT	{"status":4}	162
1081	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 02:25:23.109	POST	{"multicast_id":7177188304658920981,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473917123017416%aa7e4a83f9fd7ecd"}]}	162
1082	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 02:25:21.23	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	162
1083	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 02:25:41.198	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 02:25:42.615","description":"freight home intelligent elevator"}}	163
1084	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 02:25:43.661	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 02:25:43.664","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	163
1085	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 02:25:45.555	PUT	{"status":4,"message":"{moving:true}"}	163
1086	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 02:25:41.198	PUT	{"status":4,"message":{"message":"service activated"}}	163
1087	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 02:25:48.574	PUT	{"status":4}	163
1088	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 02:26:03.307	POST	{"multicast_id":6981833825109210836,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473917163223386%aa7e4a83f9fd7ecd"}]}	163
1089	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 02:26:01.433	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	163
1090	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 02:41:31.571	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 02:41:33.424","description":"freight home intelligent elevator"}}	164
1091	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 02:41:34.885	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 02:41:34.888","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	164
1092	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 02:41:36.784	PUT	{"status":4,"message":"{moving:true}"}	164
1093	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 02:41:31.571	PUT	{"status":4,"message":{"message":"service activated"}}	164
1094	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 02:41:39.802	PUT	{"status":4}	164
1095	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 02:41:59.66	POST	{"multicast_id":5551956549467820918,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473918119558878%aa7e4a83f9fd7ecd"}]}	164
1096	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 02:41:52.718	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	164
1097	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 02:42:10.456	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 02:42:11.824","description":"freight home intelligent elevator"}}	165
1098	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 02:42:12.841	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 02:42:12.844","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	165
1099	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 02:42:15.183	PUT	{"status":4,"message":"{moving:true}"}	165
1100	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 02:42:10.456	PUT	{"status":4,"message":{"message":"service activated"}}	165
1101	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 02:42:18.201	PUT	{"status":4}	165
1102	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 02:42:32.793	POST	{"multicast_id":8245026319897744256,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473918152713362%aa7e4a83f9fd7ecd"}]}	165
1103	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 02:42:31.121	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	165
1104	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 05:07:52.23	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 05:07:53.514","description":"freight home intelligent elevator"}}	166
1105	http://localhost:8080/has/arduino/arduino/car/actual-info	1	2016-09-15 05:07:54.563	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 05:07:54.57","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022}]","status":4}	166
1106	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 05:07:56.449	PUT	{"status":4,"message":"{moving:true}"}	166
1107	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 05:07:52.23	PUT	{"status":4,"message":{"message":"service activated"}}	166
1108	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 05:07:59.469	PUT	{"status":4}	166
1109	https://fcm.googleapis.com/fcm/send	{}	2016-09-15 05:08:19.348	POST	{"multicast_id":7203801052964663178,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473926899263626%aa7e4a83f9fd7ecd"}]}	166
1110	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-15 05:08:12.476	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	166
1111	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 05:09:05.73	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 05:09:06.973","description":"freight home intelligent elevator"}}	167
1112	http://localhost:8080/has/arduino/arduino/car/actual-info	5	2016-09-15 05:09:08.001	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 05:09:08.003","description":"freight home intelligent car"},"basket":"[]","status":4}	167
1114	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 05:09:05.73	PUT	{"status":4,"message":{"message":"service activated"}}	167
1115	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 05:09:12.906	PUT	{"status":4}	167
1116	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 05:09:27.609	POST	{"multicast_id":7326237434951763114,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473926967497732%aa7e4a83f9fd7ecd"}]}	167
1117	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 05:09:25.846	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	167
1118	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 05:09:34.719	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 05:09:35.613","description":"freight home intelligent elevator"}}	168
1119	http://localhost:8080/has/arduino/arduino/car/actual-info	5	2016-09-15 05:09:36.664	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 05:09:36.667","description":"freight home intelligent car"},"basket":"[]","status":4}	168
1120	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 05:09:38.889	PUT	{"status":4,"message":"{moving:true}"}	168
1121	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 05:09:34.719	PUT	{"status":4,"message":{"message":"service activated"}}	168
1122	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 05:09:41.908	PUT	{"status":4}	168
1123	https://fcm.googleapis.com/fcm/send	{}	2016-09-15 05:09:56.297	POST	{"multicast_id":5889649649743096949,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473926996198775%aa7e4a83f9fd7ecd"}]}	168
1124	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-15 05:09:54.836	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	168
1125	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 05:10:07.142	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 05:10:08.434","description":"freight home intelligent elevator"}}	169
1126	http://localhost:8080/has/arduino/arduino/car/actual-info	5	2016-09-15 05:10:09.924	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 05:10:09.927","description":"freight home intelligent car"},"basket":"[]","status":4}	169
1127	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 05:10:11.819	PUT	{"status":4,"message":"{moving:true}"}	169
1128	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 05:10:07.142	PUT	{"status":4,"message":{"message":"service activated"}}	169
1129	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 05:10:14.838	PUT	{"status":4}	169
1130	https://fcm.googleapis.com/fcm/send	{}	2016-09-15 05:10:29.529	POST	{"multicast_id":8427524734996650242,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473927029429882%aa7e4a83f9fd7ecd"}]}	169
1131	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-15 05:10:27.826	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	169
1132	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 05:22:59.651	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 05:23:01.671","description":"freight home intelligent elevator"}}	170
1133	http://localhost:8080/has/arduino/arduino/car/actual-info	5	2016-09-15 05:23:02.718	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 05:23:02.721","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.02,\\"num_length\\":0.014,\\"num_mass\\":0.001,\\"num_width\\":0.004},{\\"num_height\\":0.03,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.0},{\\"num_height\\":0.014,\\"num_length\\":0.018,\\"num_mass\\":0.001,\\"num_width\\":0.027},{\\"num_height\\":0.015,\\"num_length\\":0.007,\\"num_mass\\":0.002,\\"num_width\\":0.021},{\\"num_height\\":0.024,\\"num_length\\":0.008,\\"num_mass\\":0.001,\\"num_width\\":0.015},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016}]","status":4}	170
1134	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 05:23:04.6	PUT	{"status":4,"message":"{moving:true}"}	170
1135	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 05:22:59.651	PUT	{"status":4,"message":{"message":"service activated"}}	170
1136	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 05:23:07.618	PUT	{"status":4}	170
1137	https://fcm.googleapis.com/fcm/send	{}	2016-09-15 05:23:22.175	POST	{"multicast_id":5083783081503262612,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473927802075245%aa7e4a83f9fd7ecd"}]}	170
1138	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-15 05:23:20.486	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	170
1139	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 05:25:34.103	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 05:25:35.172","description":"freight home intelligent elevator"}}	171
1140	http://localhost:8080/has/arduino/arduino/car/actual-info	6	2016-09-15 05:25:36.199	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 05:25:36.201","description":"freight home intelligent car"},"basket":"[]","status":4}	171
1141	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 05:25:38.079	PUT	{"status":4,"message":"{moving:true}"}	171
1142	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 05:25:34.103	PUT	{"status":4,"message":{"message":"service activated"}}	171
1143	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 05:25:41.097	PUT	{"status":4}	171
1229	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 06:56:54.022	PUT	{"status":4,"message":{"message":"service activated"}}	184
1144	https://fcm.googleapis.com/fcm/send	{}	2016-09-15 05:25:56.383	POST	{"multicast_id":6934211286132738512,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473927956280615%aa7e4a83f9fd7ecd"}]}	171
1145	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-15 05:25:54.037	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	171
1146	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 05:26:23.474	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 05:26:24.868","description":"freight home intelligent elevator"}}	172
1147	http://localhost:8080/has/arduino/arduino/car/actual-info	6	2016-09-15 05:26:25.901	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 05:26:25.904","description":"freight home intelligent car"},"basket":"[]","status":4}	172
1148	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 05:26:27.774	PUT	{"status":4,"message":"{moving:true}"}	172
1149	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 05:26:23.474	PUT	{"status":4,"message":{"message":"service activated"}}	172
1150	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 05:26:30.793	PUT	{"status":4}	172
1151	https://fcm.googleapis.com/fcm/send	{}	2016-09-15 05:26:46.092	POST	{"multicast_id":7760831861865810585,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473928005992124%aa7e4a83f9fd7ecd"}]}	172
1152	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-15 05:26:43.737	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	172
1153	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 05:53:43.833	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 05:53:46.234","description":"freight home intelligent elevator"}}	173
1154	http://localhost:8080/has/arduino/arduino/car/actual-info	7	2016-09-15 05:53:47.28	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 05:53:47.286","description":"freight home intelligent car"},"basket":"[]","status":4}	173
1155	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 05:53:49.161	PUT	{"status":4,"message":"{moving:true}"}	173
1156	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 05:53:43.833	PUT	{"status":4,"message":{"message":"service activated"}}	173
1157	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 05:53:52.18	PUT	{"status":4}	173
1158	https://fcm.googleapis.com/fcm/send	{}	2016-09-15 05:54:06.873	POST	{"multicast_id":6070581777295330340,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473929646770585%aa7e4a83f9fd7ecd"}]}	173
1159	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-15 05:54:05.01	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	173
1160	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 05:54:35.455	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 05:54:36.888","description":"freight home intelligent elevator"}}	174
1161	http://localhost:8080/has/arduino/arduino/car/actual-info	7	2016-09-15 05:54:38.363	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 05:54:38.365","description":"freight home intelligent car"},"basket":"[]","status":4}	174
1162	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 05:54:40.254	PUT	{"status":4,"message":"{moving:true}"}	174
1163	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 05:54:35.454	PUT	{"status":4,"message":{"message":"service activated"}}	174
1164	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 05:54:43.273	PUT	{"status":4}	174
1165	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 05:54:58.616	POST	{"multicast_id":6664446322722611847,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473929698515956%aa7e4a83f9fd7ecd"}]}	174
1166	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 05:54:56.208	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	174
1167	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 05:55:03.443	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 05:55:04.326","description":"freight home intelligent elevator"}}	175
1168	http://localhost:8080/has/arduino/arduino/car/actual-info	7	2016-09-15 05:55:05.347	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 05:55:05.35","description":"freight home intelligent car"},"basket":"[]","status":4}	175
1169	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 05:55:07.798	PUT	{"status":4,"message":"{moving:true}"}	175
1170	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 05:55:03.443	PUT	{"status":4,"message":{"message":"service activated"}}	175
1171	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 05:55:10.816	PUT	{"status":4}	175
1172	https://fcm.googleapis.com/fcm/send	{}	2016-09-15 05:55:25.105	POST	{"multicast_id":7149388935410868324,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473929725010275%aa7e4a83f9fd7ecd"}]}	175
1173	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-15 05:55:23.74	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	175
1174	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 05:55:56.164	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 05:55:57.386","description":"freight home intelligent elevator"}}	176
1175	http://localhost:8080/has/arduino/arduino/car/actual-info	7	2016-09-15 05:55:58.883	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 05:55:58.885","description":"freight home intelligent car"},"basket":"[]","status":4}	176
1176	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 05:56:01.227	PUT	{"status":4,"message":"{moving:true}"}	176
1177	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 05:55:56.164	PUT	{"status":4,"message":{"message":"service activated"}}	176
1178	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 05:56:04.246	PUT	{"status":4}	176
1179	https://fcm.googleapis.com/fcm/send	{}	2016-09-15 05:56:19.103	POST	{"multicast_id":5692038658687877038,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473929779006168%aa7e4a83f9fd7ecd"}]}	176
1180	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-15 05:56:17.083	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	176
1181	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 05:56:24.414	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 05:56:25.298","description":"freight home intelligent elevator"}}	177
1182	http://localhost:8080/has/arduino/arduino/car/actual-info	7	2016-09-15 05:56:26.316	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 05:56:26.318","description":"freight home intelligent car"},"basket":"[]","status":4}	177
1183	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 05:56:28.686	PUT	{"status":4,"message":"{moving:true}"}	177
1184	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 05:56:24.414	PUT	{"status":4,"message":{"message":"service activated"}}	177
1185	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 05:56:31.706	PUT	{"status":4}	177
1186	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 05:56:47.122	POST	{"multicast_id":4734477146929709457,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473929807041886%aa7e4a83f9fd7ecd"}]}	177
1187	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 05:56:44.628	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	177
1188	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 05:56:49.364	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 05:56:50.753","description":"freight home intelligent elevator"}}	178
1189	http://localhost:8080/has/arduino/arduino/car/actual-info	7	2016-09-15 05:56:52.796	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 05:56:52.799","description":"freight home intelligent car"},"basket":"[]","status":4}	178
1190	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 05:56:54.718	PUT	{"status":4,"message":"{moving:true}"}	178
1191	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 05:56:49.364	PUT	{"status":4,"message":{"message":"service activated"}}	178
1192	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 05:56:57.736	PUT	{"status":4}	178
1193	https://fcm.googleapis.com/fcm/send	{}	2016-09-15 05:57:13.957	POST	{"multicast_id":6285431636745584231,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473929833839364%aa7e4a83f9fd7ecd"}]}	178
1194	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-15 05:57:11.018	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	178
1195	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 06:14:09.352	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 06:14:11.861","description":"freight home intelligent elevator"}}	179
1196	http://localhost:8080/has/arduino/arduino/car/actual-info	7	2016-09-15 06:14:12.918	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 06:14:12.921","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.021,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.012},{\\"num_height\\":0.03,\\"num_length\\":0.006,\\"num_mass\\":0.002,\\"num_width\\":0.012},{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1},{\\"num_height\\":0.015,\\"num_length\\":0.007,\\"num_mass\\":0.002,\\"num_width\\":0.021},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.03,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0}]","status":4}	179
1197	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 06:14:15.294	PUT	{"status":4,"message":"{moving:true}"}	179
1198	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 06:14:09.352	PUT	{"status":4,"message":{"message":"service activated"}}	179
1199	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 06:14:18.312	PUT	{"status":4}	179
1200	https://fcm.googleapis.com/fcm/send	{}	2016-09-15 06:14:33.108	POST	{"multicast_id":5987508309421805321,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473930873004131%aa7e4a83f9fd7ecd"}]}	179
1201	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-15 06:14:31.239	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	179
1202	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 06:15:26.961	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 06:15:28.364","description":"freight home intelligent elevator"}}	180
1230	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 06:57:02.372	PUT	{"status":4}	184
1231	https://fcm.googleapis.com/fcm/send	{}	2016-09-15 06:57:20.001	POST	{"multicast_id":4685509659927281024,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473933439853641%aa7e4a83f9fd7ecd"}]}	184
1203	http://localhost:8080/has/arduino/arduino/car/actual-info	7	2016-09-15 06:15:29.399	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 06:15:29.402","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.021,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.012},{\\"num_height\\":0.03,\\"num_length\\":0.006,\\"num_mass\\":0.002,\\"num_width\\":0.012},{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1},{\\"num_height\\":0.015,\\"num_length\\":0.007,\\"num_mass\\":0.002,\\"num_width\\":0.021},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.03,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0}]","status":4}	180
1204	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 06:15:31.304	PUT	{"status":4,"message":"{moving:true}"}	180
1205	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 06:15:26.961	PUT	{"status":4,"message":{"message":"service activated"}}	180
1206	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 06:15:34.326	PUT	{"status":4}	180
1207	https://fcm.googleapis.com/fcm/send	{}	2016-09-15 06:15:49.282	POST	{"multicast_id":5509304670971315950,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473930949185650%aa7e4a83f9fd7ecd"}]}	180
1208	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-15 06:15:47.239	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	180
1209	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 06:42:20.771	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 06:42:24.32","description":"freight home intelligent elevator"}}	181
1210	http://localhost:8080/has/arduino/arduino/car/actual-info	7	2016-09-15 06:42:25.364	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 06:42:25.367","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.021,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.012},{\\"num_height\\":0.03,\\"num_length\\":0.006,\\"num_mass\\":0.002,\\"num_width\\":0.012},{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1},{\\"num_height\\":0.015,\\"num_length\\":0.007,\\"num_mass\\":0.002,\\"num_width\\":0.021},{\\"num_height\\":0.025,\\"num_length\\":0.004,\\"num_mass\\":0.001,\\"num_width\\":0.016},{\\"num_height\\":0.03,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0}]","status":4}	181
1211	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 06:42:27.245	PUT	{"status":4,"message":"{moving:true}"}	181
1212	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 06:42:20.771	PUT	{"status":4,"message":{"message":"service activated"}}	181
1213	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 06:42:30.262	PUT	{"status":4}	181
1214	https://fcm.googleapis.com/fcm/send	{}	2016-09-15 06:42:55.801	POST	{"multicast_id":8973662386799662737,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473932575711083%aa7e4a83f9fd7ecd"}]}	181
1215	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-15 06:42:44.529	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	181
1216	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 06:44:34.12	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 06:44:35.344","description":"freight home intelligent elevator"}}	182
1217	http://localhost:8080/has/arduino/arduino/car/actual-info	9	2016-09-15 06:44:36.372	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 06:44:36.374","description":"freight home intelligent car"},"basket":"[]","status":4}	182
1218	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 06:44:40.662	PUT	{"status":4,"message":"{moving:true}"}	182
1219	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 06:44:34.12	PUT	{"status":4,"message":{"message":"service activated"}}	182
1220	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 06:44:43.68	PUT	{"status":4}	182
1221	https://fcm.googleapis.com/fcm/send	{}	2016-09-15 06:44:59.415	POST	{"multicast_id":8890286121978159488,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473932699325146%aa7e4a83f9fd7ecd"}]}	182
1222	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-15 06:44:56.611	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	182
1223	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 06:45:02.557	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 06:45:03.443","description":"freight home intelligent elevator"}}	183
1224	https://fcm.googleapis.com/fcm/send	{}	2016-09-15 06:45:41.932	POST	{"multicast_id":7835999260375653763,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473932741844260%aa7e4a83f9fd7ecd"}]}	183
1225	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-15 06:45:39.449	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	183
1226	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 06:56:54.022	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 06:56:55.43","description":"freight home intelligent elevator"}}	184
1227	http://localhost:8080/has/arduino/arduino/car/actual-info	9	2016-09-15 06:56:56.96	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 06:56:56.966","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.024,\\"num_length\\":0.008,\\"num_mass\\":0.001,\\"num_width\\":0.015},{\\"num_height\\":0.014,\\"num_length\\":0.03,\\"num_mass\\":0.001,\\"num_width\\":0.01},{\\"num_height\\":0.03,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.015,\\"num_length\\":0.007,\\"num_mass\\":0.002,\\"num_width\\":0.021},{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1}]","status":4}	184
1228	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 06:56:59.352	PUT	{"status":4,"message":"{moving:true}"}	184
1232	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-15 06:57:15.344	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	184
1233	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-15 06:57:31.689	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-15 06:57:33.228","description":"freight home intelligent elevator"}}	185
1234	http://localhost:8080/has/arduino/arduino/car/actual-info	9	2016-09-15 06:57:34.298	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-15 06:57:34.3","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.042,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.022},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.024,\\"num_length\\":0.008,\\"num_mass\\":0.001,\\"num_width\\":0.015},{\\"num_height\\":0.014,\\"num_length\\":0.03,\\"num_mass\\":0.001,\\"num_width\\":0.01},{\\"num_height\\":0.03,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0},{\\"num_height\\":0.015,\\"num_length\\":0.007,\\"num_mass\\":0.002,\\"num_width\\":0.021},{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1}]","status":4}	185
1235	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-15 06:57:36.188	PUT	{"status":4,"message":"{moving:true}"}	185
1236	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-15 06:57:31.689	PUT	{"status":4,"message":{"message":"service activated"}}	185
1237	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-15 06:57:39.206	PUT	{"status":4}	185
1238	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-15 06:57:54.972	POST	{"multicast_id":8991960692218893204,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1473933474842489%aa7e4a83f9fd7ecd"}]}	185
1239	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-15 06:57:52.169	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	185
1240	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 02:19:22.458	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 02:19:27.581","description":"freight home intelligent elevator"}}	186
1241	http://localhost:8080/has/arduino/arduino/car/actual-info	11	2016-09-17 02:19:28.734	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-09-17 02:19:28.748","description":"freight home intelligent car"},"basket":"[]","status":4}	186
1242	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 02:19:30.613	PUT	{"status":4,"message":"{moving:true}"}	186
1243	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 02:19:22.457	PUT	{"status":4,"message":{"message":"service activated"}}	186
1244	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 02:19:35.696	PUT	{"status":4}	186
1245	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 02:19:37.166	PUT	{"status":4}	186
1246	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 02:19:50.954	POST	{"multicast_id":5135527710414423515,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474089590858900%aa7e4a83f9fd7ecd"}]}	186
1247	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 02:19:51.402	POST	{"multicast_id":5409062048476938272,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474089591319383%aa7e4a83f9fd7ecd"}]}	186
1248	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 02:19:48.991	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	186
1249	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 02:19:50.05	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	186
1252	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 02:20:17.67	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":true,"timestamp":"2016-09-17 02:20:18.64","description":"freight home intelligent elevator"}}	187
1253	http://localhost:8080/has/arduino/arduino/car/actual-info	11	2016-09-17 02:20:19.659	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 02:20:19.663","description":"freight home intelligent car"},"basket":"[]","status":4}	187
1254	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 02:20:21.5	PUT	{"status":4,"message":"{moving:true}"}	187
1255	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 02:20:17.67	PUT	{"status":4,"message":{"message":"service activated"}}	187
1256	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 02:20:24.519	PUT	{"status":4}	187
1257	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 02:20:25.943	PUT	{"status":4}	187
1258	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 02:20:40.467	POST	{"multicast_id":5516498780462448589,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474089640369744%aa7e4a83f9fd7ecd"}]}	187
1259	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 02:20:40.917	POST	{"multicast_id":9185014207970369714,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474089640811812%aa7e4a83f9fd7ecd"}]}	187
1260	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 02:20:37.598	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	187
1261	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 02:20:38.87	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	187
1264	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 02:24:19.639	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 02:24:23.888","description":"freight home intelligent elevator"}}	188
1265	http://localhost:8080/has/arduino/arduino/car/actual-info	11	2016-09-17 02:24:26.081	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-09-17 02:24:26.1","description":"freight home intelligent car"},"basket":"[]","status":4}	188
1266	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 02:24:28.986	PUT	{"status":4,"message":"{moving:true}"}	188
1267	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 02:24:19.639	PUT	{"status":4,"message":{"message":"service activated"}}	188
1268	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 02:24:32.015	PUT	{"status":4}	188
1269	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 02:24:47.259	POST	{"multicast_id":5643040505254300926,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474089887151500%aa7e4a83f9fd7ecd"}]}	188
1270	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 02:24:45.326	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	188
1271	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 02:25:14.976	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 02:25:16.268","description":"freight home intelligent elevator"}}	189
1272	http://localhost:8080/has/arduino/arduino/car/actual-info	11	2016-09-17 02:25:17.298	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 02:25:17.305","description":"freight home intelligent car"},"basket":"[]","status":4}	189
1273	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 02:25:19.155	PUT	{"status":4,"message":"{moving:true}"}	189
1274	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 02:25:14.976	PUT	{"status":4,"message":{"message":"service activated"}}	189
1275	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 02:25:22.181	PUT	{"status":4}	189
1276	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 02:25:37.724	POST	{"multicast_id":8014146777897892962,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474089937617199%aa7e4a83f9fd7ecd"}]}	189
1277	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 02:25:35.014	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	189
1278	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 02:25:56.654	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 02:25:57.875","description":"freight home intelligent elevator"}}	190
1279	http://localhost:8080/has/arduino/arduino/car/actual-info	11	2016-09-17 02:25:58.899	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 02:25:58.906","description":"freight home intelligent car"},"basket":"[]","status":4}	190
1280	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 02:26:00.77	PUT	{"status":4,"message":"{moving:true}"}	190
1281	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 02:25:56.654	PUT	{"status":4,"message":{"message":"service activated"}}	190
1282	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 02:26:03.793	PUT	{"status":4}	190
1283	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 02:26:19.381	POST	{"multicast_id":8786896803460060004,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474089979270864%aa7e4a83f9fd7ecd"}]}	190
1284	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 02:26:17.708	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	190
1285	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 16:22:10.58	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 16:22:15.529","description":"freight home intelligent elevator"}}	191
1286	http://localhost:8080/has/arduino/arduino/car/actual-info	12	2016-09-17 16:22:17.129	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-09-17 16:22:17.14","description":"freight home intelligent car"},"basket":"[]","status":4}	191
1287	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 16:22:20.318	PUT	{"status":4,"message":"{moving:true}"}	191
1288	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 16:22:10.58	PUT	{"status":4,"message":{"message":"service activated"}}	191
1289	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 16:22:23.339	PUT	{"status":4}	191
1290	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 16:22:38.433	POST	{"multicast_id":5666944173955490363,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474140158321067%aa7e4a83f9fd7ecd"}]}	191
1291	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 16:22:36.594	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	191
1292	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 16:22:47.497	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 16:22:54.173","description":"freight home intelligent elevator"}}	192
1293	http://localhost:8080/has/arduino/arduino/car/actual-info	12	2016-09-17 16:22:55.234	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 16:22:55.24","description":"freight home intelligent car"},"basket":"[]","status":4}	192
1294	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 16:22:57.554	PUT	{"status":4,"message":"{moving:true}"}	192
1295	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 16:22:47.497	PUT	{"status":4,"message":{"message":"service activated"}}	192
1296	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 16:23:00.573	PUT	{"status":4}	192
1297	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 16:23:14.908	POST	{"multicast_id":9104355672511762850,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474140194799647%aa7e4a83f9fd7ecd"}]}	192
1298	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 16:23:13.345	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	192
1299	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 16:23:25.167	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 16:23:27.416","description":"freight home intelligent elevator"}}	193
1300	http://localhost:8080/has/arduino/arduino/car/actual-info	12	2016-09-17 16:23:28.466	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 16:23:28.47","description":"freight home intelligent car"},"basket":"[]","status":4}	193
1301	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 16:23:31.331	PUT	{"status":4,"message":"{moving:true}"}	193
1302	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 16:23:25.167	PUT	{"status":4,"message":{"message":"service activated"}}	193
1303	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 16:23:34.35	PUT	{"status":4}	193
1304	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 16:24:10.231	POST	{"multicast_id":5208495959143475277,"success":0,"failure":1,"canonical_ids":0,"results":[{"error":"InternalServerError"}]}	193
1305	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 16:23:47.252	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	193
1306	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 16:32:03.765	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":true,"timestamp":"2016-09-17 16:32:05.122","description":"freight home intelligent elevator"}}	194
1307	http://localhost:8080/has/arduino/arduino/car/actual-info	12	2016-09-17 16:32:06.169	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 16:32:06.173","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.02,\\"num_length\\":0.011,\\"num_mass\\":0.001,\\"num_width\\":0.005},{\\"num_height\\":0.017,\\"num_length\\":0.0,\\"num_mass\\":0.002,\\"num_width\\":0.013},{\\"num_height\\":0.03,\\"num_length\\":0.006,\\"num_mass\\":0.002,\\"num_width\\":0.012},{\\"num_height\\":0.03,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.0},{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0}]","status":4}	194
1308	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 16:32:08.028	PUT	{"status":4,"message":"{moving:true}"}	194
1309	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 16:32:03.765	PUT	{"status":4,"message":{"message":"service activated"}}	194
1310	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 16:32:11.048	PUT	{"status":4}	194
1311	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 16:32:25.481	POST	{"multicast_id":7309867648464446011,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474140745385607%aa7e4a83f9fd7ecd"}]}	194
1312	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 16:32:23.79	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	194
1313	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 16:32:29.946	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":true,"timestamp":"2016-09-17 16:32:30.803","description":"freight home intelligent elevator"}}	195
1314	http://localhost:8080/has/arduino/arduino/car/actual-info	12	2016-09-17 16:32:31.871	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 16:32:31.874","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.02,\\"num_length\\":0.011,\\"num_mass\\":0.001,\\"num_width\\":0.005},{\\"num_height\\":0.017,\\"num_length\\":0.0,\\"num_mass\\":0.002,\\"num_width\\":0.013},{\\"num_height\\":0.03,\\"num_length\\":0.006,\\"num_mass\\":0.002,\\"num_width\\":0.012},{\\"num_height\\":0.03,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.0},{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0}]","status":4}	195
1315	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 16:32:33.738	PUT	{"status":4,"message":"{moving:true}"}	195
1316	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 16:32:29.946	PUT	{"status":4,"message":{"message":"service activated"}}	195
1317	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 16:32:36.758	PUT	{"status":4}	195
1318	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 16:32:51.057	POST	{"multicast_id":7342252659418474719,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474140770951351%aa7e4a83f9fd7ecd"}]}	195
1319	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 16:32:49.709	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	195
1320	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 16:42:20.936	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":true,"timestamp":"2016-09-17 16:42:33.279","description":"freight home intelligent elevator"}}	196
1321	http://localhost:8080/has/arduino/arduino/car/actual-info	12	2016-09-17 16:42:34.332	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 16:42:34.336","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.02,\\"num_length\\":0.011,\\"num_mass\\":0.001,\\"num_width\\":0.005},{\\"num_height\\":0.017,\\"num_length\\":0.0,\\"num_mass\\":0.002,\\"num_width\\":0.013},{\\"num_height\\":0.03,\\"num_length\\":0.006,\\"num_mass\\":0.002,\\"num_width\\":0.012},{\\"num_height\\":0.03,\\"num_length\\":0.0,\\"num_mass\\":0.001,\\"num_width\\":0.0},{\\"num_height\\":0.031,\\"num_length\\":0.0,\\"num_mass\\":0.003,\\"num_width\\":0.0}]","status":4}	196
1322	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 16:42:36.219	PUT	{"status":4,"message":"{moving:true}"}	196
1323	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 16:42:20.936	PUT	{"status":4,"message":{"message":"service activated"}}	196
1324	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 16:42:39.239	PUT	{"status":4}	196
1325	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 16:42:54.188	POST	{"multicast_id":6891636305367444945,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474141374073683%aa7e4a83f9fd7ecd"}]}	196
1326	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 16:42:52.619	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	196
1327	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 16:51:58.139	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 16:51:59.489","description":"freight home intelligent elevator"}}	197
1328	http://localhost:8080/has/arduino/arduino/car/actual-info	15	2016-09-17 16:52:00.53	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 16:52:00.537","description":"freight home intelligent car"},"basket":"[]","status":4}	197
1329	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 16:52:02.399	PUT	{"status":4,"message":"{moving:true}"}	197
1330	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 16:51:58.139	PUT	{"status":4,"message":{"message":"service activated"}}	197
1331	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 16:52:05.419	PUT	{"status":4}	197
1332	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 16:52:19.882	POST	{"multicast_id":7626185231761128595,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474141939773062%aa7e4a83f9fd7ecd"}]}	197
1333	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 16:52:18.155	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	197
1334	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 17:30:14.275	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 17:30:16.315","description":"freight home intelligent elevator"}}	198
1335	http://localhost:8080/has/arduino/arduino/car/actual-info	16	2016-09-17 17:30:17.386	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 17:30:17.392","description":"freight home intelligent car"},"basket":"[]","status":4}	198
1336	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 17:30:19.264	PUT	{"status":4,"message":"{moving:true}"}	198
1337	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 17:30:14.275	PUT	{"status":4,"message":{"message":"service activated"}}	198
1338	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 17:30:22.284	PUT	{"status":4}	198
1339	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 17:30:37.406	POST	{"multicast_id":4749766785579977203,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474144237289113%aa7e4a83f9fd7ecd"}]}	198
1340	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 17:30:35.231	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	198
1341	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 17:30:45.715	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 17:30:46.939","description":"freight home intelligent elevator"}}	199
1342	http://localhost:8080/has/arduino/arduino/car/actual-info	16	2016-09-17 17:30:48	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 17:30:48.003","description":"freight home intelligent car"},"basket":"[]","status":4}	199
1343	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 17:30:49.903	PUT	{"status":4,"message":"{moving:true}"}	199
1344	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 17:30:45.715	PUT	{"status":4,"message":{"message":"service activated"}}	199
1345	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 17:30:52.921	PUT	{"status":4}	199
1346	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 17:31:07.397	POST	{"multicast_id":7328479391338767890,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474144267290310%aa7e4a83f9fd7ecd"}]}	199
1347	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 17:31:05.86	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	199
1348	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 17:43:46.61	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 17:43:47.999","description":"freight home intelligent elevator"}}	200
1349	http://localhost:8080/has/arduino/arduino/car/actual-info	17	2016-09-17 17:43:49.038	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 17:43:49.044","description":"freight home intelligent car"},"basket":"[]","status":4}	200
1350	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 17:43:50.923	PUT	{"status":4,"message":"{moving:true}"}	200
1351	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 17:43:46.61	PUT	{"status":4,"message":{"message":"service activated"}}	200
1352	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 17:43:53.943	PUT	{"status":4}	200
1353	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 17:44:09.606	POST	{"multicast_id":8881346184596951160,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474145049496168%aa7e4a83f9fd7ecd"}]}	200
1354	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 17:44:06.851	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	200
1355	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 17:44:14.367	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 17:44:15.266","description":"freight home intelligent elevator"}}	201
1356	http://localhost:8080/has/arduino/arduino/car/actual-info	17	2016-09-17 17:44:16.847	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 17:44:16.851","description":"freight home intelligent car"},"basket":"[]","status":4}	201
1357	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 17:44:19.09	PUT	{"status":4,"message":"{moving:true}"}	201
1358	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 17:44:14.367	PUT	{"status":4,"message":{"message":"service activated"}}	201
1359	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 17:44:22.11	PUT	{"status":4}	201
1360	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 17:44:37.071	POST	{"multicast_id":7959615395590543512,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474145076984372%aa7e4a83f9fd7ecd"}]}	201
1361	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 17:44:35.072	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	201
1362	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 17:44:44.887	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 17:44:45.76","description":"freight home intelligent elevator"}}	202
1363	http://localhost:8080/has/arduino/arduino/car/actual-info	17	2016-09-17 17:44:46.814	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 17:44:46.819","description":"freight home intelligent car"},"basket":"[]","status":4}	202
1364	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 17:44:49.168	PUT	{"status":4,"message":"{moving:true}"}	202
1365	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 17:44:44.887	PUT	{"status":4,"message":{"message":"service activated"}}	202
1366	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 17:44:52.188	PUT	{"status":4}	202
1367	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 17:45:07.102	POST	{"multicast_id":8890105137984684040,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474145107000649%aa7e4a83f9fd7ecd"}]}	202
1368	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 17:45:05.572	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	202
1369	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 17:45:10.448	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 17:45:11.361","description":"freight home intelligent elevator"}}	203
1370	http://localhost:8080/has/arduino/arduino/car/actual-info	17	2016-09-17 17:45:12.431	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 17:45:12.434","description":"freight home intelligent car"},"basket":"[]","status":4}	203
1371	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 17:45:14.323	PUT	{"status":4,"message":"{moving:true}"}	203
1372	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 17:45:10.447	PUT	{"status":4,"message":{"message":"service activated"}}	203
1373	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 17:45:17.343	PUT	{"status":4}	203
1374	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 17:45:32.368	POST	{"multicast_id":8730383312218844273,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474145132284737%aa7e4a83f9fd7ecd"}]}	203
1375	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 17:45:30.692	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	203
1376	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 17:45:44.138	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 17:45:45.039","description":"freight home intelligent elevator"}}	204
1377	http://localhost:8080/has/arduino/arduino/car/actual-info	17	2016-09-17 17:45:46.12	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 17:45:46.123","description":"freight home intelligent car"},"basket":"[]","status":4}	204
1378	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 17:45:48.036	PUT	{"status":4,"message":"{moving:true}"}	204
1379	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 17:45:44.138	PUT	{"status":4,"message":{"message":"service activated"}}	204
1380	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 17:45:51.056	PUT	{"status":4}	204
1381	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 17:46:05.787	POST	{"multicast_id":4655572712939765474,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474145165698328%aa7e4a83f9fd7ecd"}]}	204
1382	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 17:46:03.854	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	204
1383	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 17:50:20.481	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 17:50:21.758","description":"freight home intelligent elevator"}}	205
1384	http://localhost:8080/has/arduino/arduino/car/actual-info	17	2016-09-17 17:50:22.781	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 17:50:22.784","description":"freight home intelligent car"},"basket":"[]","status":4}	205
1385	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 17:50:24.651	PUT	{"status":4,"message":"{moving:true}"}	205
1386	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 17:50:20.481	PUT	{"status":4,"message":{"message":"service activated"}}	205
1387	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 17:50:27.67	PUT	{"status":4}	205
1388	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 17:50:47.552	POST	{"multicast_id":6894953774414085873,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474145447454841%aa7e4a83f9fd7ecd"}]}	205
1389	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 17:50:40.617	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	205
1390	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 17:51:01.552	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 17:51:07.775","description":"freight home intelligent elevator"}}	206
1391	http://localhost:8080/has/arduino/arduino/car/actual-info	17	2016-09-17 17:51:08.815	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 17:51:08.819","description":"freight home intelligent car"},"basket":"[]","status":4}	206
1392	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 17:51:11.153	PUT	{"status":4,"message":"{moving:true}"}	206
1393	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 17:51:01.552	PUT	{"status":4,"message":{"message":"service activated"}}	206
1394	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 17:51:14.172	PUT	{"status":4}	206
1395	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 17:51:28.781	POST	{"multicast_id":8705672163830752742,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474145488685308%aa7e4a83f9fd7ecd"}]}	206
1396	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 17:51:26.943	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	206
1397	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 17:51:32.163	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 17:51:33.012","description":"freight home intelligent elevator"}}	207
1398	http://localhost:8080/has/arduino/arduino/car/actual-info	17	2016-09-17 17:51:34.037	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 17:51:34.041","description":"freight home intelligent car"},"basket":"[]","status":4}	207
1399	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 17:51:35.895	PUT	{"status":4,"message":"{moving:true}"}	207
1400	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 17:51:32.163	PUT	{"status":4,"message":{"message":"service activated"}}	207
1401	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 17:51:38.914	PUT	{"status":4}	207
1402	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 17:51:53.98	POST	{"multicast_id":5031541225045779816,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474145513881222%aa7e4a83f9fd7ecd"}]}	207
1403	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 17:51:52.64	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	207
1463	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 18:57:42.695	PUT	{"status":4,"message":{"message":"service activated"}}	216
1404	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 17:51:59.383	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 17:52:00.236","description":"freight home intelligent elevator"}}	208
1405	http://localhost:8080/has/arduino/arduino/car/actual-info	17	2016-09-17 17:52:01.291	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 17:52:01.294","description":"freight home intelligent car"},"basket":"[]","status":4}	208
1406	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 17:52:03.145	PUT	{"status":4,"message":"{moving:true}"}	208
1407	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 17:51:59.383	PUT	{"status":4,"message":{"message":"service activated"}}	208
1408	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 17:52:06.164	PUT	{"status":4}	208
1409	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 17:52:20.884	POST	{"multicast_id":5108595557608933269,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474145540790301%aa7e4a83f9fd7ecd"}]}	208
1410	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 17:52:18.993	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	208
1411	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 17:52:37.759	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 17:52:38.626","description":"freight home intelligent elevator"}}	209
1412	http://localhost:8080/has/arduino/arduino/car/actual-info	17	2016-09-17 17:52:39.669	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 17:52:39.673","description":"freight home intelligent car"},"basket":"[]","status":4}	209
1413	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 17:52:42.002	PUT	{"status":4,"message":"{moving:true}"}	209
1414	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 17:52:37.759	PUT	{"status":4,"message":{"message":"service activated"}}	209
1415	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 17:52:45.021	PUT	{"status":4}	209
1416	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 17:53:00.88	POST	{"multicast_id":7341320605180506632,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474145580771489%aa7e4a83f9fd7ecd"}]}	209
1417	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 17:52:57.921	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	209
1418	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 17:53:16.674	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 17:53:17.996","description":"freight home intelligent elevator"}}	210
1419	http://localhost:8080/has/arduino/arduino/car/actual-info	17	2016-09-17 17:53:19.084	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 17:53:19.088","description":"freight home intelligent car"},"basket":"[]","status":4}	210
1420	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 17:53:20.96	PUT	{"status":4,"message":"{moving:true}"}	210
1421	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 17:53:16.674	PUT	{"status":4,"message":{"message":"service activated"}}	210
1422	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 17:53:23.979	PUT	{"status":4}	210
1423	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 17:53:45.045	POST	{"multicast_id":8555900095180395197,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474145624944701%aa7e4a83f9fd7ecd"}]}	210
1424	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 17:53:37.923	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	210
1425	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 18:53:30.629	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 18:53:33.009","description":"freight home intelligent elevator"}}	211
1426	http://localhost:8080/has/arduino/arduino/car/actual-info	18	2016-09-17 18:53:34.058	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 18:53:34.064","description":"freight home intelligent car"},"basket":"[]","status":4}	211
1427	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 18:53:37.185	PUT	{"status":4,"message":"{moving:true}"}	211
1428	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 18:53:30.628	PUT	{"status":4,"message":{"message":"service activated"}}	211
1429	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 18:53:40.204	PUT	{"status":4}	211
1430	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 18:53:55.81	POST	{"multicast_id":9115212429920597362,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474149235686341%aa7e4a83f9fd7ecd"}]}	211
1431	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 18:53:53.046	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	211
1432	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 18:54:00.554	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 18:54:01.405","description":"freight home intelligent elevator"}}	212
1464	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 18:57:49.826	PUT	{"status":4}	216
1433	http://localhost:8080/has/arduino/arduino/car/actual-info	18	2016-09-17 18:54:02.991	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 18:54:02.994","description":"freight home intelligent car"},"basket":"[]","status":4}	212
1434	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 18:54:04.85	PUT	{"status":4,"message":"{moving:true}"}	212
1435	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 18:54:00.554	PUT	{"status":4,"message":{"message":"service activated"}}	212
1436	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 18:54:07.869	PUT	{"status":4}	212
1437	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 18:54:22.151	POST	{"multicast_id":5905645912212310727,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474149262059256%aa7e4a83f9fd7ecd"}]}	212
1438	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 18:54:20.793	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	212
1439	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 18:54:35.605	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 18:54:36.956","description":"freight home intelligent elevator"}}	213
1440	http://localhost:8080/has/arduino/arduino/car/actual-info	18	2016-09-17 18:54:37.986	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 18:54:37.989","description":"freight home intelligent car"},"basket":"[]","status":4}	213
1441	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 18:54:39.829	PUT	{"status":4,"message":"{moving:true}"}	213
1442	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 18:54:35.605	PUT	{"status":4,"message":{"message":"service activated"}}	213
1443	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 18:54:42.848	PUT	{"status":4}	213
1444	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 18:54:58.91	POST	{"multicast_id":7109058280472557311,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474149298800445%aa7e4a83f9fd7ecd"}]}	213
1445	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 18:54:56.753	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	213
1446	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 18:55:05.539	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 18:55:06.398","description":"freight home intelligent elevator"}}	214
1447	http://localhost:8080/has/arduino/arduino/car/actual-info	18	2016-09-17 18:55:07.815	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 18:55:07.819","description":"freight home intelligent car"},"basket":"[]","status":4}	214
1448	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 18:55:09.696	PUT	{"status":4,"message":"{moving:true}"}	214
1449	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 18:55:05.539	PUT	{"status":4,"message":{"message":"service activated"}}	214
1450	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 18:55:12.715	PUT	{"status":4}	214
1451	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 18:55:27.026	POST	{"multicast_id":5441085646458645119,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474149326926659%aa7e4a83f9fd7ecd"}]}	214
1452	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 18:55:25.643	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	214
1453	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 18:57:02.9	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 18:57:04.281","description":"freight home intelligent elevator"}}	215
1454	http://localhost:8080/has/arduino/arduino/car/actual-info	18	2016-09-17 18:57:05.291	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 18:57:05.294","description":"freight home intelligent car"},"basket":"[]","status":4}	215
1455	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 18:57:07.142	PUT	{"status":4,"message":"{moving:true}"}	215
1456	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 18:57:02.9	PUT	{"status":4,"message":{"message":"service activated"}}	215
1457	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 18:57:10.161	PUT	{"status":4}	215
1458	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 18:57:24.773	POST	{"multicast_id":8578515974892019244,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474149444624748%aa7e4a83f9fd7ecd"}]}	215
1459	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 18:57:23.013	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	215
1460	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 18:57:42.695	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 18:57:43.923","description":"freight home intelligent elevator"}}	216
1461	http://localhost:8080/has/arduino/arduino/car/actual-info	18	2016-09-17 18:57:44.944	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 18:57:44.948","description":"freight home intelligent car"},"basket":"[]","status":4}	216
1462	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 18:57:46.808	PUT	{"status":4,"message":"{moving:true}"}	216
1465	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 18:58:09.645	POST	{"multicast_id":5358250078345459904,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474149489363400%aa7e4a83f9fd7ecd"}]}	216
1466	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 18:58:02.743	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	216
1467	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 19:16:47.079	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 19:16:54.232","description":"freight home intelligent elevator"}}	217
1468	http://localhost:8080/has/arduino/arduino/car/actual-info	19	2016-09-17 19:16:55.279	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 19:16:55.284","description":"freight home intelligent car"},"basket":"[]","status":4}	217
1469	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 19:16:58.056	PUT	{"status":4,"message":"{moving:true}"}	217
1470	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 19:16:47.079	PUT	{"status":4,"message":{"message":"service activated"}}	217
1471	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 19:17:01.075	PUT	{"status":4}	217
1472	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 19:17:15.95	POST	{"multicast_id":8149815038103712396,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474150635844171%aa7e4a83f9fd7ecd"}]}	217
1473	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 19:17:14.044	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	217
1474	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 19:17:19.804	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 19:17:20.687","description":"freight home intelligent elevator"}}	218
1475	http://localhost:8080/has/arduino/arduino/car/actual-info	19	2016-09-17 19:17:21.715	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 19:17:21.718","description":"freight home intelligent car"},"basket":"[]","status":4}	218
1476	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 19:17:23.592	PUT	{"status":4,"message":"{moving:true}"}	218
1477	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 19:17:19.804	PUT	{"status":4,"message":{"message":"service activated"}}	218
1478	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 19:17:26.61	PUT	{"status":4}	218
1479	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 19:17:42.263	POST	{"multicast_id":8092765135888706734,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474150662171108%aa7e4a83f9fd7ecd"}]}	218
1480	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 19:17:39.463	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	218
1481	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 19:27:04.993	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 19:27:06.349","description":"freight home intelligent elevator"}}	219
1482	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 19:27:07.834	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 19:27:07.836","description":"freight home intelligent car"},"basket":"[]","status":4}	219
1483	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 19:27:10.122	PUT	{"status":4,"message":"{moving:true}"}	219
1484	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 19:27:04.993	PUT	{"status":4,"message":{"message":"service activated"}}	219
1485	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 19:27:13.141	PUT	{"status":4}	219
1486	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 19:27:29.375	POST	{"multicast_id":7118420401298095372,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474151249266911%aa7e4a83f9fd7ecd"}]}	219
1487	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 19:27:26.045	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	219
1488	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 19:28:18.228	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 19:28:24.494","description":"freight home intelligent elevator"}}	220
1489	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 19:28:26.513	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 19:28:26.516","description":"freight home intelligent car"},"basket":"[]","status":4}	220
1490	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 19:28:28.36	PUT	{"status":4,"message":"{moving:true}"}	220
1491	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 19:28:18.228	PUT	{"status":4,"message":{"message":"service activated"}}	220
1492	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 19:28:31.379	PUT	{"status":4}	220
1493	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 19:28:46.047	POST	{"multicast_id":5491001225748754210,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474151325935437%aa7e4a83f9fd7ecd"}]}	220
1494	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 19:28:44.285	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	220
1495	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 19:28:52.842	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 19:28:53.713","description":"freight home intelligent elevator"}}	221
1496	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 19:28:55.153	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 19:28:55.156","description":"freight home intelligent car"},"basket":"[]","status":4}	221
1497	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 19:28:57.019	PUT	{"status":4,"message":"{moving:true}"}	221
1498	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 19:28:52.842	PUT	{"status":4,"message":{"message":"service activated"}}	221
1499	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 19:29:00.037	PUT	{"status":4}	221
1500	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 19:29:14.184	POST	{"multicast_id":6905969488518328406,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474151354067882%aa7e4a83f9fd7ecd"}]}	221
1501	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 19:29:12.756	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	221
1502	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 19:29:20.758	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 19:29:22.624","description":"freight home intelligent elevator"}}	222
1503	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 19:29:23.65	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 19:29:23.653","description":"freight home intelligent car"},"basket":"[]","status":4}	222
1504	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 19:29:25.699	PUT	{"status":4,"message":"{moving:true}"}	222
1505	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 19:29:20.758	PUT	{"status":4,"message":{"message":"service activated"}}	222
1506	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 19:29:28.718	PUT	{"status":4}	222
1507	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 19:29:44.22	POST	{"multicast_id":5658265770356073501,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474151384127859%aa7e4a83f9fd7ecd"}]}	222
1508	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 19:29:42.075	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	222
1509	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 19:30:04.203	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 19:30:06.109","description":"freight home intelligent elevator"}}	223
1510	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 19:30:07.565	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 19:30:07.568","description":"freight home intelligent car"},"basket":"[]","status":4}	223
1511	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 19:30:09.423	PUT	{"status":4,"message":"{moving:true}"}	223
1512	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 19:30:04.203	PUT	{"status":4,"message":{"message":"service activated"}}	223
1513	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 19:30:12.441	PUT	{"status":4}	223
1514	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 19:30:27.11	POST	{"multicast_id":5202481618779121199,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474151427003369%aa7e4a83f9fd7ecd"}]}	223
1515	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 19:30:25.365	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	223
1516	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 20:29:59.713	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 20:30:03.27","description":"freight home intelligent elevator"}}	224
1517	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 20:30:04.357	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 20:30:04.362","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1}]","status":4}	224
1518	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 20:30:06.293	PUT	{"status":4,"message":"{moving:true}"}	224
1519	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 20:29:59.713	PUT	{"status":4,"message":{"message":"service activated"}}	224
1520	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 20:30:09.314	PUT	{"status":4}	224
1521	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 20:30:24.971	POST	{"multicast_id":6122734449165106189,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474155024882311%aa7e4a83f9fd7ecd"}]}	224
1522	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 20:30:23.262	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	224
1523	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 20:30:43.36	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 20:30:45.194","description":"freight home intelligent elevator"}}	225
1524	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 20:30:46.218	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 20:30:46.221","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1}]","status":4}	225
1525	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 20:30:48.563	PUT	{"status":4,"message":"{moving:true}"}	225
1526	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 20:30:43.36	PUT	{"status":4,"message":{"message":"service activated"}}	225
1527	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 20:30:51.581	PUT	{"status":4}	225
1528	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 20:31:06.39	POST	{"multicast_id":6257053200001114204,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474155066294653%aa7e4a83f9fd7ecd"}]}	225
1529	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 20:31:04.542	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	225
1530	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 20:31:11.201	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 20:31:12.082","description":"freight home intelligent elevator"}}	226
1531	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 20:31:13.109	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 20:31:13.112","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1}]","status":4}	226
1532	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 20:31:15.631	PUT	{"status":4,"message":"{moving:true}"}	226
1533	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 20:31:11.201	PUT	{"status":4,"message":{"message":"service activated"}}	226
1534	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 20:31:18.65	PUT	{"status":4}	226
1535	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 20:31:34.014	POST	{"multicast_id":9127109854090885568,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474155093920713%aa7e4a83f9fd7ecd"}]}	226
1536	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 20:31:31.632	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	226
1537	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 20:42:51.062	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 20:42:52.284","description":"freight home intelligent elevator"}}	227
1538	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 20:42:53.309	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 20:42:53.312","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1}]","status":4}	227
1539	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 20:42:56.616	PUT	{"status":4,"message":"{moving:true}"}	227
1540	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 20:42:51.062	PUT	{"status":4,"message":{"message":"service activated"}}	227
1541	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 20:42:59.634	PUT	{"status":4}	227
1542	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 20:43:15.085	POST	{"multicast_id":6910556043374159508,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474155794186338%aa7e4a83f9fd7ecd"}]}	227
1543	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 20:43:12.354	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	227
1544	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 20:43:18.383	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 20:43:20.25","description":"freight home intelligent elevator"}}	228
1545	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 20:43:21.267	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 20:43:21.27","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1}]","status":4}	228
1546	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 20:43:24.096	PUT	{"status":4,"message":"{moving:true}"}	228
1547	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 20:43:18.383	PUT	{"status":4,"message":{"message":"service activated"}}	228
1548	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 20:43:27.115	PUT	{"status":4}	228
1549	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 20:43:48.563	POST	{"multicast_id":9120532536811576334,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474155821321494%aa7e4a83f9fd7ecd"}]}	228
1550	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 20:43:40.032	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	228
1737	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 23:19:58.519	PUT	{"status":4,"message":"{moving:true}"}	255
1551	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 20:53:50.679	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 20:53:51.85","description":"freight home intelligent elevator"}}	229
1552	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 20:53:52.908	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 20:53:52.913","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1}]","status":4}	229
1553	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 20:53:55.812	PUT	{"status":4,"message":"{moving:true}"}	229
1554	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 20:53:50.679	PUT	{"status":4,"message":{"message":"service activated"}}	229
1555	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 20:53:58.832	PUT	{"status":4}	229
1556	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 20:54:14.341	POST	{"multicast_id":6795159046824291565,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474156454237910%aa7e4a83f9fd7ecd"}]}	229
1557	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 20:54:11.788	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	229
1558	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 20:59:18.508	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 20:59:20.0","description":"freight home intelligent elevator"}}	230
1559	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 20:59:21.042	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 20:59:21.045","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1}]","status":4}	230
1560	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 20:59:22.958	PUT	{"status":4,"message":"{moving:true}"}	230
1561	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 20:59:18.508	PUT	{"status":4,"message":{"message":"service activated"}}	230
1562	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 20:59:25.976	PUT	{"status":4}	230
1563	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 20:59:40.682	POST	{"multicast_id":6684806597219800766,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474156780572343%aa7e4a83f9fd7ecd"}]}	230
1564	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 20:59:38.932	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	230
1565	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 21:00:02.959	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 21:00:04.399","description":"freight home intelligent elevator"}}	231
1566	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 21:00:05.877	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 21:00:05.88","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1}]","status":4}	231
1567	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 21:00:07.747	PUT	{"status":4,"message":"{moving:true}"}	231
1568	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 21:00:02.959	PUT	{"status":4,"message":{"message":"service activated"}}	231
1569	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 21:00:10.766	PUT	{"status":4}	231
1570	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 21:00:30.41	POST	{"multicast_id":4783590378039121846,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474156830268916%aa7e4a83f9fd7ecd"}]}	231
1571	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 21:00:23.51	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	231
1572	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 21:10:25.562	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 21:10:29.225","description":"freight home intelligent elevator"}}	232
1573	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 21:10:30.343	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 21:10:30.349","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1}]","status":4}	232
1574	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 21:10:33.253	PUT	{"status":4,"message":"{moving:true}"}	232
1575	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 21:10:25.562	PUT	{"status":4,"message":{"message":"service activated"}}	232
1576	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 21:10:36.272	PUT	{"status":4}	232
1577	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 21:10:51.826	POST	{"multicast_id":7689166057609906164,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474157451714968%aa7e4a83f9fd7ecd"}]}	232
1578	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 21:10:49.929	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	232
1581	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 21:34:23.716	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 21:34:28.442","description":"freight home intelligent elevator"}}	233
1582	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 21:34:29.464	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 21:34:29.469","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1}]","status":4}	233
1583	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 21:34:32.372	PUT	{"status":4,"message":"{moving:true}"}	233
1584	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 21:34:23.716	PUT	{"status":4,"message":{"message":"service activated"}}	233
1585	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 21:34:35.39	PUT	{"status":4}	233
1586	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 21:34:55.694	POST	{"multicast_id":5982055379656207870,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474158895536769%aa7e4a83f9fd7ecd"}]}	233
1587	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 21:34:48.733	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	233
1588	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 21:35:06.756	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 21:35:07.782","description":"freight home intelligent elevator"}}	234
1589	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 21:35:08.878	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 21:35:08.882","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1}]","status":4}	234
1590	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 21:35:11.927	PUT	{"status":4,"message":"{moving:true}"}	234
1591	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 21:35:06.756	PUT	{"status":4,"message":{"message":"service activated"}}	234
1592	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 21:35:14.946	PUT	{"status":4}	234
1593	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 21:35:30.201	POST	{"multicast_id":8608712888834947771,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474158930098230%aa7e4a83f9fd7ecd"}]}	234
1594	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 21:35:27.894	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	234
1595	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 21:35:42.06	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 21:35:42.993","description":"freight home intelligent elevator"}}	235
1596	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 21:35:44.04	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 21:35:44.043","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1}]","status":4}	235
1597	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 21:35:45.906	PUT	{"status":4,"message":"{moving:true}"}	235
1598	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 21:35:42.06	PUT	{"status":4,"message":{"message":"service activated"}}	235
1602	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 21:55:30.969	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 21:55:34.397","description":"freight home intelligent elevator"}}	236
1603	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 21:55:35.895	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 21:55:35.901","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1}]","status":4}	236
1604	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 21:55:38.765	PUT	{"status":4,"message":"{moving:true}"}	236
1605	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 21:55:30.969	PUT	{"status":4,"message":{"message":"service activated"}}	236
1606	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 21:55:41.783	PUT	{"status":4}	236
1607	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 21:55:56.415	POST	{"multicast_id":8521175019722418689,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474160156305922%aa7e4a83f9fd7ecd"}]}	236
1608	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 21:55:54.714	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	236
1609	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 21:56:07.458	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 21:56:08.845","description":"freight home intelligent elevator"}}	237
1610	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 21:56:09.874	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 21:56:09.876","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1}]","status":4}	237
1611	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 21:56:11.766	PUT	{"status":4,"message":"{moving:true}"}	237
1612	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 21:56:07.458	PUT	{"status":4,"message":{"message":"service activated"}}	237
1613	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 21:56:14.784	PUT	{"status":4}	237
1614	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 21:56:29.384	POST	{"multicast_id":8330508100505189901,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474160189295699%aa7e4a83f9fd7ecd"}]}	237
1615	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 21:56:27.702	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	237
1616	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 21:56:41.178	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 21:56:42.407","description":"freight home intelligent elevator"}}	238
1617	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 21:56:43.44	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 21:56:43.443","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1}]","status":4}	238
1618	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 21:56:45.316	PUT	{"status":4,"message":"{moving:true}"}	238
1619	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 21:56:41.178	PUT	{"status":4,"message":{"message":"service activated"}}	238
1620	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 21:56:48.335	PUT	{"status":4}	238
1621	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 21:57:03.194	POST	{"multicast_id":8049816144947182174,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474160223078005%aa7e4a83f9fd7ecd"}]}	238
1622	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 21:57:01.253	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	238
1623	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 22:12:55.856	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 22:12:57.896","description":"freight home intelligent elevator"}}	239
1624	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 22:12:58.923	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 22:12:58.926","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1}]","status":4}	239
1625	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 22:13:00.811	PUT	{"status":4,"message":"{moving:true}"}	239
1626	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 22:12:55.856	PUT	{"status":4,"message":{"message":"service activated"}}	239
1627	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 22:13:03.829	PUT	{"status":4}	239
1628	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 22:13:18.874	POST	{"multicast_id":8266161179517224366,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474161198778457%aa7e4a83f9fd7ecd"}]}	239
1629	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 22:13:17.185	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	239
2502	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-30 23:05:38.115	PUT	{"status":4,"message":"{moving:true}"}	385
1630	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 22:13:22.034	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 22:13:22.887","description":"freight home intelligent elevator"}}	240
1631	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 22:13:23.897	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 22:13:23.901","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1}]","status":4}	240
1632	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 22:13:25.75	PUT	{"status":4,"message":"{moving:true}"}	240
1633	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 22:13:22.034	PUT	{"status":4,"message":{"message":"service activated"}}	240
1634	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 22:13:28.77	PUT	{"status":4}	240
1635	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 22:13:43.397	POST	{"multicast_id":6790437979990502738,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474161222977380%aa7e4a83f9fd7ecd"}]}	240
1636	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 22:13:41.693	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	240
1637	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 22:33:24.807	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 22:33:26.982","description":"freight home intelligent elevator"}}	241
1638	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 22:33:28	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 22:33:28.003","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1}]","status":4}	241
1639	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 22:33:29.844	PUT	{"status":4,"message":"{moving:true}"}	241
1640	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 22:33:24.807	PUT	{"status":4,"message":{"message":"service activated"}}	241
1641	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 22:33:32.862	PUT	{"status":4}	241
1642	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 22:33:47.473	POST	{"multicast_id":7338184757531286376,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474162427366391%aa7e4a83f9fd7ecd"}]}	241
1643	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 22:33:45.588	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	241
1644	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 22:38:28.328	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 22:38:29.923","description":"freight home intelligent elevator"}}	242
1645	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 22:38:30.964	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 22:38:30.967","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046}]","status":4}	242
1646	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 22:38:32.84	PUT	{"status":4,"message":"{moving:true}"}	242
1647	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 22:38:28.328	PUT	{"status":4,"message":{"message":"service activated"}}	242
1648	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 22:38:35.86	PUT	{"status":4}	242
1649	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 22:38:50.487	POST	{"multicast_id":5675246483860899913,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474162730369340%aa7e4a83f9fd7ecd"}]}	242
1650	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 22:38:48.778	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	242
1651	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 22:39:06.725	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 22:39:07.921","description":"freight home intelligent elevator"}}	243
1652	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 22:39:08.982	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 22:39:08.984","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046}]","status":4}	243
1653	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 22:39:13.099	PUT	{"status":4,"message":"{moving:true}"}	243
1654	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 22:39:16.118	PUT	{"status":4}	243
1655	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 22:39:06.725	PUT	{"status":4,"message":{"message":"service activated"}}	243
1656	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 22:39:30.82	POST	{"multicast_id":8558294792393565011,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474162770702975%aa7e4a83f9fd7ecd"}]}	243
1657	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 22:39:29.052	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	243
1658	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 22:39:35.539	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 22:39:36.41","description":"freight home intelligent elevator"}}	244
1659	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 22:39:37.458	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 22:39:37.461","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046}]","status":4}	244
1660	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 22:39:49.696	PUT	{"status":4,"message":"{moving:true}"}	244
1661	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 22:39:35.539	PUT	{"status":4,"message":{"message":"service activated"}}	244
1662	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 22:39:52.714	PUT	{"status":4}	244
1663	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 22:40:07.885	POST	{"multicast_id":4893515053643867503,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474162807768820%aa7e4a83f9fd7ecd"}]}	244
1664	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 22:40:06.171	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	244
1665	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 22:56:15.188	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 22:56:17.679","description":"freight home intelligent elevator"}}	245
1666	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 22:56:18.725	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 22:56:18.731","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046}]","status":4}	245
1667	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 22:56:20.603	PUT	{"status":4,"message":"{moving:true}"}	245
1668	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 22:56:15.188	PUT	{"status":4,"message":{"message":"service activated"}}	245
1669	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 22:56:23.622	PUT	{"status":4}	245
1670	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 22:56:37.98	POST	{"multicast_id":7229709274275883348,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474163797879777%aa7e4a83f9fd7ecd"}]}	245
1671	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 22:56:36.452	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	245
1672	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 22:56:42.481	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 22:56:43.356","description":"freight home intelligent elevator"}}	246
1673	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 22:56:44.911	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 22:56:44.913","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046}]","status":4}	246
1674	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 22:56:50.247	PUT	{"status":4}	246
1675	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 22:56:47.228	PUT	{"status":4,"message":"{moving:true}"}	246
1676	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 22:56:42.481	PUT	{"status":4,"message":{"message":"service activated"}}	246
1677	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 22:57:07.05	POST	{"multicast_id":6402210970617163448,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474163826960883%aa7e4a83f9fd7ecd"}]}	246
1678	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 22:57:05.669	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	246
1679	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 22:57:10.061	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 22:57:10.916","description":"freight home intelligent elevator"}}	247
1680	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 22:57:11.96	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 22:57:11.962","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046}]","status":4}	247
1681	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 22:57:13.851	PUT	{"status":4,"message":"{moving:true}"}	247
1682	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 22:57:10.061	PUT	{"status":4,"message":{"message":"service activated"}}	247
1683	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 22:57:16.87	PUT	{"status":4}	247
1684	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 22:57:32.018	POST	{"multicast_id":9196324958190044164,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474163851923550%aa7e4a83f9fd7ecd"}]}	247
1685	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 22:57:29.801	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	247
1686	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 22:57:36.872	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 22:57:37.734","description":"freight home intelligent elevator"}}	248
1687	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 22:57:38.783	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 22:57:38.786","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046}]","status":4}	248
1688	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 22:57:40.654	PUT	{"status":4,"message":"{moving:true}"}	248
1689	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 22:57:36.872	PUT	{"status":4,"message":{"message":"service activated"}}	248
1690	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 22:57:43.672	PUT	{"status":4}	248
1691	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 22:57:57.906	POST	{"multicast_id":8549750012241328454,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474163877796864%aa7e4a83f9fd7ecd"}]}	248
1692	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 22:57:56.537	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	248
1693	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 22:58:06.582	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 22:58:07.994","description":"freight home intelligent elevator"}}	249
1694	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 22:58:09.036	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 22:58:09.039","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046}]","status":4}	249
1695	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 22:58:10.918	PUT	{"status":4,"message":"{moving:true}"}	249
1696	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 22:58:06.582	PUT	{"status":4,"message":{"message":"service activated"}}	249
1697	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 22:58:13.938	PUT	{"status":4}	249
1698	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 22:58:29.036	POST	{"multicast_id":8913316706044919377,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474163908930020%aa7e4a83f9fd7ecd"}]}	249
1699	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 22:58:27.341	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	249
1700	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 23:01:37.031	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 23:01:38.756","description":"freight home intelligent elevator"}}	250
1701	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 23:01:39.776	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 23:01:39.778","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046}]","status":4}	250
1702	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 23:01:41.634	PUT	{"status":4,"message":"{moving:true}"}	250
1703	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 23:01:37.031	PUT	{"status":4,"message":{"message":"service activated"}}	250
1704	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 23:01:44.653	PUT	{"status":4}	250
1705	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 23:01:59.262	POST	{"multicast_id":8513780855719095057,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474164119141510%aa7e4a83f9fd7ecd"}]}	250
1706	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 23:01:57.552	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	250
1707	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 23:02:11.634	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 23:02:12.972","description":"freight home intelligent elevator"}}	251
1708	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 23:02:14.061	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 23:02:14.063","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046}]","status":4}	251
1709	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 23:02:15.94	PUT	{"status":4,"message":"{moving:true}"}	251
1710	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 23:02:11.634	PUT	{"status":4,"message":{"message":"service activated"}}	251
1711	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 23:02:18.959	PUT	{"status":4}	251
1738	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 23:19:54.379	PUT	{"status":4,"message":{"message":"service activated"}}	255
1712	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 23:02:39.635	POST	{"multicast_id":7195041036718597239,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474164159532951%aa7e4a83f9fd7ecd"}]}	251
1713	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 23:02:31.861	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	251
1714	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 23:02:49.511	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 23:02:50.887","description":"freight home intelligent elevator"}}	252
1715	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 23:02:51.917	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 23:02:51.919","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046}]","status":4}	252
1716	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 23:02:53.781	PUT	{"status":4,"message":"{moving:true}"}	252
1717	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 23:02:49.511	PUT	{"status":4,"message":{"message":"service activated"}}	252
1718	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 23:02:56.798	PUT	{"status":4}	252
1719	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 23:03:23.522	POST	{"multicast_id":5892634118766756684,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474164203399554%aa7e4a83f9fd7ecd"}]}	252
1720	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 23:03:09.64	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	252
1721	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 23:18:45.663	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 23:18:47.864","description":"freight home intelligent elevator"}}	253
1722	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 23:18:49.934	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 23:18:49.939","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046}]","status":4}	253
1723	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 23:18:51.803	PUT	{"status":4,"message":"{moving:true}"}	253
1724	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 23:18:45.663	PUT	{"status":4,"message":{"message":"service activated"}}	253
1725	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 23:18:54.822	PUT	{"status":4}	253
1726	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 23:19:09.373	POST	{"multicast_id":5412988673304759707,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474165149282688%aa7e4a83f9fd7ecd"}]}	253
1727	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 23:19:07.533	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	253
1728	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 23:19:18.439	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 23:19:20.249","description":"freight home intelligent elevator"}}	254
1729	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 23:19:21.296	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 23:19:21.299","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046}]","status":4}	254
1730	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 23:19:23.168	PUT	{"status":4,"message":"{moving:true}"}	254
1731	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 23:19:18.439	PUT	{"status":4,"message":{"message":"service activated"}}	254
1732	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 23:19:26.186	PUT	{"status":4}	254
1733	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 23:19:41.014	POST	{"multicast_id":6900291597643824415,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474165180880358%aa7e4a83f9fd7ecd"}]}	254
1734	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 23:19:39.093	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	254
1735	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 23:19:54.379	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 23:19:55.591","description":"freight home intelligent elevator"}}	255
1736	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 23:19:56.637	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 23:19:56.64","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046}]","status":4}	255
1740	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-17 23:20:16.36	POST	{"multicast_id":8533820144405546637,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474165216272479%aa7e4a83f9fd7ecd"}]}	255
1741	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-17 23:20:14.445	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	255
1742	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 23:20:27.59	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 23:20:28.882","description":"freight home intelligent elevator"}}	256
1743	http://localhost:8080/has/arduino/arduino/car/actual-info	20	2016-09-17 23:20:29.906	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-17 23:20:29.909","description":"freight home intelligent car"},"basket":"[{\\"num_height\\":0.042,\\"num_length\\":0.023,\\"num_mass\\":0.004,\\"num_width\\":0.1},{\\"num_height\\":0.03,\\"num_length\\":0.039,\\"num_mass\\":0.018,\\"num_width\\":0.019},{\\"num_height\\":0.061,\\"num_length\\":0.017,\\"num_mass\\":0.006,\\"num_width\\":0.046}]","status":4}	256
1744	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-17 23:20:31.773	PUT	{"status":4,"message":"{moving:true}"}	256
1745	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-17 23:20:27.59	PUT	{"status":4,"message":{"message":"service activated"}}	256
1746	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-17 23:20:34.79	PUT	{"status":4}	256
1747	https://fcm.googleapis.com/fcm/send	{}	2016-09-17 23:20:50.523	POST	{"multicast_id":7043545020350024192,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474165250424600%aa7e4a83f9fd7ecd"}]}	256
1748	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-17 23:20:47.713	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	256
1749	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-17 23:23:35.67	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-17 23:24:08.082","description":"freight home intelligent elevator"}}	257
1750	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 18:19:59.665	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 18:20:03.945","description":"freight home intelligent elevator"}}	258
1751	http://localhost:8080/has/arduino/arduino/car/actual-info	38	2016-09-18 18:20:05.207	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-09-18 18:20:05.22","description":"freight home intelligent car"},"basket":"[]","status":4}	258
1752	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 18:20:09.736	PUT	{"status":4,"message":"{moving:true}"}	258
1753	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 18:19:59.665	PUT	{"status":4,"message":{"message":"service activated"}}	258
1754	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 18:20:12.757	PUT	{"status":4}	258
1755	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 18:20:31.655	POST	{"multicast_id":7068746908671503492,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474233631519969%aa7e4a83f9fd7ecd"}]}	258
1756	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 18:20:28.225	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	258
1757	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 18:23:51.531	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 18:23:55.743","description":"freight home intelligent elevator"}}	259
1758	http://localhost:8080/has/arduino/arduino/car/actual-info	39	2016-09-18 18:23:58.182	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 18:23:58.188","description":"freight home intelligent car"},"basket":"[]","status":4}	259
1759	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 18:24:03	PUT	{"status":4,"message":"{moving:true}"}	259
1760	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 18:23:51.531	PUT	{"status":4,"message":{"message":"service activated"}}	259
1761	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 18:24:06.019	PUT	{"status":4}	259
1762	https://fcm.googleapis.com/fcm/send	{}	2016-09-18 18:24:23.397	POST	{"multicast_id":4789255951960951036,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474233863007956%aa7e4a83f9fd7ecd"}]}	259
1763	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-18 18:24:21.225	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	259
1764	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 18:28:09.493	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 18:28:11.181","description":"freight home intelligent elevator"}}	260
1765	http://localhost:8080/has/arduino/arduino/car/actual-info	40	2016-09-18 18:28:13.525	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 18:28:13.529","description":"freight home intelligent car"},"basket":"[]","status":4}	260
1766	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 18:28:16.378	PUT	{"status":4,"message":"{moving:true}"}	260
1767	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 18:28:09.493	PUT	{"status":4,"message":{"message":"service activated"}}	260
1768	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 18:28:19.396	PUT	{"status":4}	260
2011	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 21:47:25.881	PUT	{"status":4,"message":"{moving:true}"}	295
1769	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 18:28:34.028	POST	{"multicast_id":5864416537318984211,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474234113892497%aa7e4a83f9fd7ecd"}]}	260
1770	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 18:28:32.414	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	260
1771	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 18:33:07.092	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 18:33:08.373","description":"freight home intelligent elevator"}}	261
1772	http://localhost:8080/has/arduino/arduino/car/actual-info	41	2016-09-18 18:33:09.428	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 18:33:09.432","description":"freight home intelligent car"},"basket":"[]","status":4}	261
1773	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 18:33:11.282	PUT	{"status":4,"message":"{moving:true}"}	261
1774	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 18:33:07.092	PUT	{"status":4,"message":{"message":"service activated"}}	261
1775	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 18:33:14.302	PUT	{"status":4}	261
1776	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 18:33:29.151	POST	{"multicast_id":8579483163403974103,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474234408607164%aa7e4a83f9fd7ecd"}]}	261
1777	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 18:33:27.178	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	261
1778	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 19:01:45.854	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 19:01:48.056","description":"freight home intelligent elevator"}}	262
1779	http://localhost:8080/has/arduino/arduino/car/actual-info	42	2016-09-18 19:01:49.928	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 19:01:49.933","description":"freight home intelligent car"},"basket":"[]","status":4}	262
1780	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 19:01:52.06	PUT	{"status":4,"message":"{moving:true}"}	262
1781	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 19:01:45.854	PUT	{"status":4,"message":{"message":"service activated"}}	262
1782	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 19:01:55.078	PUT	{"status":4}	262
1783	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 19:02:10.958	POST	{"multicast_id":6478357548365455631,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474236130822877%aa7e4a83f9fd7ecd"}]}	262
1784	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 19:02:08.851	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	262
1785	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 19:02:27.349	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 19:02:30.262","description":"freight home intelligent elevator"}}	263
1786	http://localhost:8080/has/arduino/arduino/car/actual-info	42	2016-09-18 19:02:31.707	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 19:02:31.71","description":"freight home intelligent car"},"basket":"[]","status":4}	263
1787	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 19:02:33.574	PUT	{"status":4,"message":"{moving:true}"}	263
1788	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 19:02:27.349	PUT	{"status":4,"message":{"message":"service activated"}}	263
1789	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 19:02:36.594	PUT	{"status":4}	263
1790	https://fcm.googleapis.com/fcm/send	{}	2016-09-18 19:02:52.347	POST	{"multicast_id":6574724826538245994,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474236172226114%aa7e4a83f9fd7ecd"}]}	263
1791	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-18 19:02:50.012	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	263
1792	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 19:02:59.701	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 19:03:01.774","description":"freight home intelligent elevator"}}	264
1793	http://localhost:8080/has/arduino/arduino/car/actual-info	42	2016-09-18 19:03:02.955	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 19:03:02.959","description":"freight home intelligent car"},"basket":"[]","status":4}	264
1794	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 19:03:05.951	PUT	{"status":4,"message":"{moving:true}"}	264
1795	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 19:02:59.701	PUT	{"status":4,"message":{"message":"service activated"}}	264
1796	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 19:03:08.969	PUT	{"status":4}	264
1797	https://fcm.googleapis.com/fcm/send	{}	2016-09-18 19:03:25.085	POST	{"multicast_id":5907107649984570016,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474236204945287%aa7e4a83f9fd7ecd"}]}	264
1798	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-18 19:03:22.513	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	264
1799	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 19:07:03.629	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 19:07:04.841","description":"freight home intelligent elevator"}}	265
1800	http://localhost:8080/has/arduino/arduino/car/actual-info	42	2016-09-18 19:07:05.987	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 19:07:05.99","description":"freight home intelligent car"},"basket":"[]","status":4}	265
1801	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 19:07:08.104	PUT	{"status":4,"message":"{moving:true}"}	265
1802	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 19:07:03.629	PUT	{"status":4,"message":{"message":"service activated"}}	265
1803	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 19:07:11.123	PUT	{"status":4}	265
1804	https://fcm.googleapis.com/fcm/send	{}	2016-09-18 19:07:25.758	POST	{"multicast_id":7100620454017552744,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474236445637696%aa7e4a83f9fd7ecd"}]}	265
1805	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-18 19:07:24.083	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	265
1806	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 19:07:32.607	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 19:07:33.494","description":"freight home intelligent elevator"}}	266
1807	http://localhost:8080/has/arduino/arduino/car/actual-info	42	2016-09-18 19:07:34.665	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 19:07:34.668","description":"freight home intelligent car"},"basket":"[]","status":4}	266
1808	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 19:07:36.892	PUT	{"status":4,"message":"{moving:true}"}	266
1809	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 19:07:32.607	PUT	{"status":4,"message":{"message":"service activated"}}	266
1810	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 19:07:39.91	PUT	{"status":4}	266
1811	https://fcm.googleapis.com/fcm/send	{}	2016-09-18 19:07:54.908	POST	{"multicast_id":5511169466444149731,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474236474813487%aa7e4a83f9fd7ecd"}]}	266
1812	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-18 19:07:53.299	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	266
1813	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 19:12:14.557	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 19:12:15.858","description":"freight home intelligent elevator"}}	267
1814	http://localhost:8080/has/arduino/arduino/car/actual-info	42	2016-09-18 19:12:16.993	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 19:12:16.996","description":"freight home intelligent car"},"basket":"[]","status":4}	267
1815	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 19:12:18.931	PUT	{"status":4,"message":"{moving:true}"}	267
1816	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 19:12:14.557	PUT	{"status":4,"message":{"message":"service activated"}}	267
1817	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 19:12:21.951	PUT	{"status":4}	267
1818	https://fcm.googleapis.com/fcm/send	{}	2016-09-18 19:12:36.354	POST	{"multicast_id":7008037230117341021,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474236756239329%aa7e4a83f9fd7ecd"}]}	267
1819	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-18 19:12:34.723	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	267
1820	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 19:12:57.272	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 19:13:04.009","description":"freight home intelligent elevator"}}	268
1821	http://localhost:8080/has/arduino/arduino/car/actual-info	42	2016-09-18 19:13:06.28	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 19:13:06.283","description":"freight home intelligent car"},"basket":"[]","status":4}	268
1822	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 19:13:08.885	PUT	{"status":4,"message":"{moving:true}"}	268
1823	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 19:12:57.272	PUT	{"status":4,"message":{"message":"service activated"}}	268
1824	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 19:13:11.903	PUT	{"status":4}	268
1825	https://fcm.googleapis.com/fcm/send	{}	2016-09-18 19:13:27.319	POST	{"multicast_id":8327627559504067732,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474236807218539%aa7e4a83f9fd7ecd"}]}	268
1826	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-18 19:13:25.773	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	268
1827	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 19:18:52.749	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 19:18:54.602","description":"freight home intelligent elevator"}}	269
1828	http://localhost:8080/has/arduino/arduino/car/actual-info	42	2016-09-18 19:18:55.721	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 19:18:55.725","description":"freight home intelligent car"},"basket":"[]","status":4}	269
1829	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 19:18:57.602	PUT	{"status":4,"message":"{moving:true}"}	269
1830	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 19:18:52.749	PUT	{"status":4,"message":{"message":"service activated"}}	269
1831	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 19:19:00.621	PUT	{"status":4}	269
1832	https://fcm.googleapis.com/fcm/send	{}	2016-09-18 19:19:16.776	POST	{"multicast_id":8620126374932607838,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474237156547655%aa7e4a83f9fd7ecd"}]}	269
1833	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-18 19:19:14.593	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	269
1834	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 19:19:22.373	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 19:19:23.247","description":"freight home intelligent elevator"}}	270
1835	http://localhost:8080/has/arduino/arduino/car/actual-info	42	2016-09-18 19:19:24.48	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 19:19:24.482","description":"freight home intelligent car"},"basket":"[]","status":4}	270
1836	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 19:19:26.348	PUT	{"status":4,"message":"{moving:true}"}	270
1837	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 19:19:22.373	PUT	{"status":4,"message":{"message":"service activated"}}	270
1838	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 19:19:29.365	PUT	{"status":4}	270
1839	https://fcm.googleapis.com/fcm/send	{}	2016-09-18 19:19:44.174	POST	{"multicast_id":6651094029497391386,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474237184075493%aa7e4a83f9fd7ecd"}]}	270
1840	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-18 19:19:42.315	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	270
1841	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 20:17:49.783	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 20:17:51.729","description":"freight home intelligent elevator"}}	271
1842	http://localhost:8080/has/arduino/arduino/car/actual-info	47	2016-09-18 20:17:53.239	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 20:17:53.245","description":"freight home intelligent car"},"basket":"[]","status":4}	271
1843	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 20:17:55.092	PUT	{"status":4,"message":"{moving:true}"}	271
1844	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 20:17:49.783	PUT	{"status":4,"message":{"message":"service activated"}}	271
1845	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 20:17:58.112	PUT	{"status":4}	271
1846	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 20:18:12.667	POST	{"multicast_id":7418800259148124262,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474240692561991%aa7e4a83f9fd7ecd"}]}	271
1847	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 20:18:10.94	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	271
1848	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 20:19:27.14	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 20:19:28.479","description":"freight home intelligent elevator"}}	272
1849	http://localhost:8080/has/arduino/arduino/car/actual-info	47	2016-09-18 20:19:29.583	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 20:19:29.586","description":"freight home intelligent car"},"basket":"[]","status":4}	272
1850	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 20:19:31.477	PUT	{"status":4,"message":"{moving:true}"}	272
1851	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 20:19:27.14	PUT	{"status":4,"message":{"message":"service activated"}}	272
1852	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 20:19:34.496	PUT	{"status":4}	272
1853	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 20:19:48.996	POST	{"multicast_id":6798303211395710760,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474240788885359%aa7e4a83f9fd7ecd"}]}	272
1854	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 20:19:47.428	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	272
1855	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 20:20:01.809	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 20:20:03.06","description":"freight home intelligent elevator"}}	273
1856	http://localhost:8080/has/arduino/arduino/car/actual-info	47	2016-09-18 20:20:05.127	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 20:20:05.131","description":"freight home intelligent car"},"basket":"[]","status":4}	273
1857	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 20:20:06.98	PUT	{"status":4,"message":"{moving:true}"}	273
1858	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 20:20:01.809	PUT	{"status":4,"message":{"message":"service activated"}}	273
1859	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 20:20:09.998	PUT	{"status":4}	273
1860	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 20:20:24.513	POST	{"multicast_id":8632205525299690956,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474240824388290%aa7e4a83f9fd7ecd"}]}	273
1861	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 20:20:22.948	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	273
1862	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 20:25:48.368	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 20:25:49.784","description":"freight home intelligent elevator"}}	274
1863	http://localhost:8080/has/arduino/arduino/car/actual-info	48	2016-09-18 20:25:50.872	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 20:25:50.875","description":"freight home intelligent car"},"basket":"[]","status":4}	274
1864	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 20:25:53.202	PUT	{"status":4,"message":"{moving:true}"}	274
1865	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 20:25:48.368	PUT	{"status":4,"message":{"message":"service activated"}}	274
1866	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 20:25:56.22	PUT	{"status":4}	274
1867	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 20:26:11.794	POST	{"multicast_id":7938659162188044825,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474241171637518%aa7e4a83f9fd7ecd"}]}	274
1868	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 20:26:09.075	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	274
1869	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 20:26:26.687	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 20:26:27.887","description":"freight home intelligent elevator"}}	275
1870	http://localhost:8080/has/arduino/arduino/car/actual-info	48	2016-09-18 20:26:28.93	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 20:26:28.932","description":"freight home intelligent car"},"basket":"[]","status":4}	275
1871	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 20:26:30.785	PUT	{"status":4,"message":"{moving:true}"}	275
1872	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 20:26:26.687	PUT	{"status":4,"message":{"message":"service activated"}}	275
1873	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 20:26:33.803	PUT	{"status":4}	275
1874	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 20:26:48.594	POST	{"multicast_id":7824373685492576743,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474241208480592%aa7e4a83f9fd7ecd"}]}	275
1875	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 20:26:47.038	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	275
1876	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 20:27:40.882	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 20:27:42.058","description":"freight home intelligent elevator"}}	276
1877	http://localhost:8080/has/arduino/arduino/car/actual-info	48	2016-09-18 20:27:44.093	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 20:27:44.096","description":"freight home intelligent car"},"basket":"[]","status":4}	276
1878	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 20:27:45.944	PUT	{"status":4,"message":"{moving:true}"}	276
1879	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 20:27:40.882	PUT	{"status":4,"message":{"message":"service activated"}}	276
1880	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 20:27:48.962	PUT	{"status":4}	276
1881	https://fcm.googleapis.com/fcm/send	{}	2016-09-18 20:28:08.44	POST	{"multicast_id":5910311909383455296,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474241288322703%aa7e4a83f9fd7ecd"}]}	276
1882	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-18 20:28:01.878	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	276
1883	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 20:29:05.032	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 20:29:06.751","description":"freight home intelligent elevator"}}	277
1884	http://localhost:8080/has/arduino/arduino/car/actual-info	48	2016-09-18 20:29:07.86	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 20:29:07.863","description":"freight home intelligent car"},"basket":"[]","status":4}	277
1885	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 20:29:10.733	PUT	{"status":4,"message":"{moving:true}"}	277
1886	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 20:29:05.031	PUT	{"status":4,"message":{"message":"service activated"}}	277
1887	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 20:29:13.751	PUT	{"status":4}	277
1888	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 20:29:28.514	POST	{"multicast_id":7428011845792068435,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474241368356596%aa7e4a83f9fd7ecd"}]}	277
1889	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 20:29:26.728	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	277
1890	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 20:34:45.344	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 20:34:55.342","description":"freight home intelligent elevator"}}	278
1891	http://localhost:8080/has/arduino/arduino/car/actual-info	49	2016-09-18 20:34:56.387	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 20:34:56.39","description":"freight home intelligent car"},"basket":"[]","status":4}	278
1892	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 20:34:58.272	PUT	{"status":4,"message":"{moving:true}"}	278
1893	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 20:34:45.344	PUT	{"status":4,"message":{"message":"service activated"}}	278
1894	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 20:35:01.29	PUT	{"status":4}	278
1895	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 20:35:17.223	POST	{"multicast_id":8738753598958134264,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474241717106537%aa7e4a83f9fd7ecd"}]}	278
1896	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 20:35:15.21	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	278
1897	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 20:35:57.854	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 20:35:59.04","description":"freight home intelligent elevator"}}	279
1898	http://localhost:8080/has/arduino/arduino/car/actual-info	49	2016-09-18 20:36:00.105	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 20:36:00.108","description":"freight home intelligent car"},"basket":"[]","status":4}	279
1899	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 20:36:01.958	PUT	{"status":4,"message":"{moving:true}"}	279
1900	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 20:35:57.854	PUT	{"status":4,"message":{"message":"service activated"}}	279
1901	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 20:36:04.976	PUT	{"status":4}	279
1902	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 20:36:20.968	POST	{"multicast_id":6403405726480955855,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474241780871003%aa7e4a83f9fd7ecd"}]}	279
1903	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 20:36:18.899	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	279
1904	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 20:36:33.746	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 20:36:35.094","description":"freight home intelligent elevator"}}	280
1905	http://localhost:8080/has/arduino/arduino/car/actual-info	49	2016-09-18 20:36:36.617	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 20:36:36.62","description":"freight home intelligent car"},"basket":"[]","status":4}	280
1906	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 20:36:38.499	PUT	{"status":4,"message":"{moving:true}"}	280
1907	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 20:36:33.746	PUT	{"status":4,"message":{"message":"service activated"}}	280
1908	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 20:36:41.517	PUT	{"status":4}	280
1909	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 20:36:55.988	POST	{"multicast_id":7773414070336368032,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474241815873849%aa7e4a83f9fd7ecd"}]}	280
1910	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 20:36:54.439	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	280
1911	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 20:37:21.279	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 20:37:22.512","description":"freight home intelligent elevator"}}	281
1912	http://localhost:8080/has/arduino/arduino/car/actual-info	49	2016-09-18 20:37:24.035	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 20:37:24.038","description":"freight home intelligent car"},"basket":"[]","status":4}	281
1913	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 20:37:25.914	PUT	{"status":4,"message":"{moving:true}"}	281
1914	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 20:37:21.279	PUT	{"status":4,"message":{"message":"service activated"}}	281
1915	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 20:37:28.932	PUT	{"status":4}	281
1916	https://fcm.googleapis.com/fcm/send	{}	2016-09-18 20:37:45.362	POST	{"multicast_id":7549164067521190740,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474241865250084%aa7e4a83f9fd7ecd"}]}	281
1917	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-18 20:37:43.789	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	281
1918	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 20:44:37.025	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 20:44:38.671","description":"freight home intelligent elevator"}}	282
1919	http://localhost:8080/has/arduino/arduino/car/actual-info	50	2016-09-18 20:44:39.706	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 20:44:39.708","description":"freight home intelligent car"},"basket":"[]","status":4}	282
1920	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 20:44:41.57	PUT	{"status":4,"message":"{moving:true}"}	282
1921	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 20:44:37.025	PUT	{"status":4,"message":{"message":"service activated"}}	282
1922	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 20:44:44.588	PUT	{"status":4}	282
1923	https://fcm.googleapis.com/fcm/send	{}	2016-09-18 20:44:59.821	POST	{"multicast_id":9008415605369781024,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474242299251184%aa7e4a83f9fd7ecd"}]}	282
1924	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-18 20:44:57.34	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	282
1925	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 21:27:17.012	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 21:27:18.881","description":"freight home intelligent elevator"}}	283
1926	http://localhost:8080/has/arduino/arduino/car/actual-info	51	2016-09-18 21:27:19.941	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 21:27:19.946","description":"freight home intelligent car"},"basket":"[]","status":4}	283
1927	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 21:27:21.843	PUT	{"status":4,"message":"{moving:true}"}	283
1928	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 21:27:17.012	PUT	{"status":4,"message":{"message":"service activated"}}	283
1929	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 21:27:24.862	PUT	{"status":4}	283
1930	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 21:27:40.44	POST	{"multicast_id":7534501005811076343,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474244860212583%aa7e4a83f9fd7ecd"}]}	283
1931	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 21:27:38.738	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	283
1932	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 21:28:00.15	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 21:28:01.386","description":"freight home intelligent elevator"}}	284
1933	http://localhost:8080/has/arduino/arduino/car/actual-info	51	2016-09-18 21:28:02.426	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 21:28:02.428","description":"freight home intelligent car"},"basket":"[]","status":4}	284
1934	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 21:28:04.294	PUT	{"status":4,"message":"{moving:true}"}	284
1935	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 21:28:00.15	PUT	{"status":4,"message":{"message":"service activated"}}	284
1936	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 21:28:07.312	PUT	{"status":4}	284
1937	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 21:28:22.741	POST	{"multicast_id":5554089309490442928,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474244902622346%aa7e4a83f9fd7ecd"}]}	284
1938	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 21:28:21.184	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	284
1939	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 21:32:46.421	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 21:32:47.855","description":"freight home intelligent elevator"}}	285
1940	http://localhost:8080/has/arduino/arduino/car/actual-info	51	2016-09-18 21:32:49.406	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 21:32:49.408","description":"freight home intelligent car"},"basket":"[]","status":4}	285
1941	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 21:32:51.795	PUT	{"status":4,"message":"{moving:true}"}	285
1942	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 21:32:46.421	PUT	{"status":4,"message":{"message":"service activated"}}	285
1943	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 21:32:54.813	PUT	{"status":4}	285
1944	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 21:33:09.412	POST	{"multicast_id":5027927024222668646,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474245189310634%aa7e4a83f9fd7ecd"}]}	285
1945	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 21:33:07.777	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	285
1946	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 21:33:19.791	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 21:33:21.202","description":"freight home intelligent elevator"}}	286
1947	http://localhost:8080/has/arduino/arduino/car/actual-info	51	2016-09-18 21:33:23.135	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 21:33:23.138","description":"freight home intelligent car"},"basket":"[]","status":4}	286
1948	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 21:33:27.491	PUT	{"status":4,"message":"{moving:true}"}	286
1949	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 21:33:19.791	PUT	{"status":4,"message":{"message":"service activated"}}	286
1950	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 21:33:30.509	PUT	{"status":4}	286
2012	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 21:47:21.687	PUT	{"status":4,"message":{"message":"service activated"}}	295
1951	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 21:33:44.809	POST	{"multicast_id":8301016541549510074,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474245224696567%aa7e4a83f9fd7ecd"}]}	286
1952	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 21:33:43.273	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	286
1953	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 21:38:23.785	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 21:38:25.017","description":"freight home intelligent elevator"}}	287
1954	http://localhost:8080/has/arduino/arduino/car/actual-info	51	2016-09-18 21:38:26.119	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 21:38:26.122","description":"freight home intelligent car"},"basket":"[]","status":4}	287
1955	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 21:38:28.146	PUT	{"status":4,"message":"{moving:true}"}	287
1956	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 21:38:23.785	PUT	{"status":4,"message":{"message":"service activated"}}	287
1957	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 21:38:31.164	PUT	{"status":4}	287
1958	https://fcm.googleapis.com/fcm/send	{}	2016-09-18 21:38:45.937	POST	{"multicast_id":9129479438287984542,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474245525841395%aa7e4a83f9fd7ecd"}]}	287
1959	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-18 21:38:44.384	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	287
1960	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 21:38:52.013	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 21:38:52.882","description":"freight home intelligent elevator"}}	288
1961	http://localhost:8080/has/arduino/arduino/car/actual-info	51	2016-09-18 21:38:53.933	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 21:38:53.936","description":"freight home intelligent car"},"basket":"[]","status":4}	288
1962	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 21:38:56.452	PUT	{"status":4,"message":"{moving:true}"}	288
1963	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 21:38:52.012	PUT	{"status":4,"message":{"message":"service activated"}}	288
1964	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 21:38:59.47	PUT	{"status":4}	288
1965	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 21:39:13.777	POST	{"multicast_id":4611943630319708102,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474245553639326%aa7e4a83f9fd7ecd"}]}	288
1966	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 21:39:12.362	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	288
1967	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 21:39:18.611	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 21:39:19.485","description":"freight home intelligent elevator"}}	289
1968	http://localhost:8080/has/arduino/arduino/car/actual-info	51	2016-09-18 21:39:20.529	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 21:39:20.532","description":"freight home intelligent car"},"basket":"[]","status":4}	289
1969	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 21:39:22.625	PUT	{"status":4,"message":"{moving:true}"}	289
1970	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 21:39:18.611	PUT	{"status":4,"message":{"message":"service activated"}}	289
1971	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 21:39:25.644	PUT	{"status":4}	289
1972	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 21:39:40.733	POST	{"multicast_id":6945816840229873569,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474245580190920%aa7e4a83f9fd7ecd"}]}	289
1973	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 21:39:38.747	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	289
1974	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 21:39:52.843	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 21:39:53.699","description":"freight home intelligent elevator"}}	290
1975	http://localhost:8080/has/arduino/arduino/car/actual-info	51	2016-09-18 21:39:54.756	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 21:39:54.758","description":"freight home intelligent car"},"basket":"[]","status":4}	290
1976	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 21:39:56.639	PUT	{"status":4,"message":"{moving:true}"}	290
1977	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 21:39:52.843	PUT	{"status":4,"message":{"message":"service activated"}}	290
1978	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 21:39:59.657	PUT	{"status":4}	290
1979	https://fcm.googleapis.com/fcm/send	{}	2016-09-18 21:40:14.622	POST	{"multicast_id":6340729315806177899,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474245614500402%aa7e4a83f9fd7ecd"}]}	290
1980	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-18 21:40:13.047	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	290
1981	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 21:44:38.575	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 21:44:40.802","description":"freight home intelligent elevator"}}	291
1982	http://localhost:8080/has/arduino/arduino/car/actual-info	51	2016-09-18 21:44:41.862	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 21:44:41.865","description":"freight home intelligent car"},"basket":"[]","status":4}	291
1983	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 21:44:45.306	PUT	{"status":4,"message":"{moving:true}"}	291
1984	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 21:44:38.575	PUT	{"status":4,"message":{"message":"service activated"}}	291
1985	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 21:44:48.324	PUT	{"status":4}	291
1986	https://fcm.googleapis.com/fcm/send	{}	2016-09-18 21:45:03.069	POST	{"multicast_id":7148942203944167819,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474245902939480%aa7e4a83f9fd7ecd"}]}	291
1987	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-18 21:45:01.477	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	291
1988	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 21:45:24.067	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 21:45:25.251","description":"freight home intelligent elevator"}}	292
1989	http://localhost:8080/has/arduino/arduino/car/actual-info	51	2016-09-18 21:45:26.317	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 21:45:26.32","description":"freight home intelligent car"},"basket":"[]","status":4}	292
1990	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 21:45:28.19	PUT	{"status":4,"message":"{moving:true}"}	292
1991	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 21:45:31.208	PUT	{"status":4}	292
1992	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 21:45:24.067	PUT	{"status":4,"message":{"message":"service activated"}}	292
1993	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 21:45:45.49	POST	{"multicast_id":7027667434973703490,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474245945380296%aa7e4a83f9fd7ecd"}]}	292
1994	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 21:45:43.924	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	292
1995	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 21:45:50.811	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 21:45:51.664","description":"freight home intelligent elevator"}}	293
1996	http://localhost:8080/has/arduino/arduino/car/actual-info	51	2016-09-18 21:45:52.756	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 21:45:52.758","description":"freight home intelligent car"},"basket":"[]","status":4}	293
1997	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 21:45:57.912	PUT	{"status":4}	293
1998	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 21:45:54.894	PUT	{"status":4,"message":"{moving:true}"}	293
1999	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 21:45:50.811	PUT	{"status":4,"message":{"message":"service activated"}}	293
2000	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 21:46:16.099	POST	{"multicast_id":6347758198070854981,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474245975975939%aa7e4a83f9fd7ecd"}]}	293
2001	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 21:46:14.448	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	293
2002	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 21:46:53.855	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 21:46:55.133","description":"freight home intelligent elevator"}}	294
2003	http://localhost:8080/has/arduino/arduino/car/actual-info	51	2016-09-18 21:46:56.224	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 21:46:56.226","description":"freight home intelligent car"},"basket":"[]","status":4}	294
2004	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 21:46:58.575	PUT	{"status":4,"message":"{moving:true}"}	294
2005	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 21:47:01.594	PUT	{"status":4}	294
2006	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 21:46:53.855	PUT	{"status":4,"message":{"message":"service activated"}}	294
2007	https://fcm.googleapis.com/fcm/send	{}	2016-09-18 21:47:17.083	POST	{"multicast_id":7723510113534474222,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474246036954834%aa7e4a83f9fd7ecd"}]}	294
2008	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-18 21:47:14.493	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	294
2009	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 21:47:21.688	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 21:47:22.542","description":"freight home intelligent elevator"}}	295
2010	http://localhost:8080/has/arduino/arduino/car/actual-info	51	2016-09-18 21:47:23.599	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 21:47:23.601","description":"freight home intelligent car"},"basket":"[]","status":4}	295
2014	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 21:47:44.271	POST	{"multicast_id":8476681015550955223,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474246064098306%aa7e4a83f9fd7ecd"}]}	295
2015	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 21:47:41.806	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	295
2016	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 21:47:53.928	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 21:47:55.362","description":"freight home intelligent elevator"}}	296
2017	http://localhost:8080/has/arduino/arduino/car/actual-info	51	2016-09-18 21:47:57.675	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 21:47:57.678","description":"freight home intelligent car"},"basket":"[]","status":4}	296
2018	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 21:47:59.593	PUT	{"status":4,"message":"{moving:true}"}	296
2019	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 21:47:53.928	PUT	{"status":4,"message":{"message":"service activated"}}	296
2020	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 21:48:02.611	PUT	{"status":4}	296
2021	https://fcm.googleapis.com/fcm/send	{}	2016-09-18 21:48:17.08	POST	{"multicast_id":4694610948873771861,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474246096960928%aa7e4a83f9fd7ecd"}]}	296
2022	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-18 21:48:15.533	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	296
2023	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 21:50:45.049	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 21:50:51.493","description":"freight home intelligent elevator"}}	297
2024	http://localhost:8080/has/arduino/arduino/car/actual-info	51	2016-09-18 21:50:52.537	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 21:50:52.539","description":"freight home intelligent car"},"basket":"[]","status":4}	297
2025	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 21:50:55.982	PUT	{"status":4,"message":"{moving:true}"}	297
2026	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 21:50:45.049	PUT	{"status":4,"message":{"message":"service activated"}}	297
2027	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 21:50:59	PUT	{"status":4}	297
2028	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 21:51:13.578	POST	{"multicast_id":6343219636640634602,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474246273470293%aa7e4a83f9fd7ecd"}]}	297
2029	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 21:51:11.955	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	297
2030	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 21:51:19.686	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 21:51:20.543","description":"freight home intelligent elevator"}}	298
2031	http://localhost:8080/has/arduino/arduino/car/actual-info	51	2016-09-18 21:51:21.584	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 21:51:21.586","description":"freight home intelligent car"},"basket":"[]","status":4}	298
2032	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 21:51:23.792	PUT	{"status":4,"message":"{moving:true}"}	298
2033	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 21:51:19.686	PUT	{"status":4,"message":{"message":"service activated"}}	298
2034	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 21:51:26.81	PUT	{"status":4}	298
2035	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 21:51:42.002	POST	{"multicast_id":8133072562091257164,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474246301901159%aa7e4a83f9fd7ecd"}]}	298
2036	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 21:51:39.637	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	298
2037	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 21:51:50.628	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 21:51:51.541","description":"freight home intelligent elevator"}}	299
2038	http://localhost:8080/has/arduino/arduino/car/actual-info	51	2016-09-18 21:51:52.607	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 21:51:52.61","description":"freight home intelligent car"},"basket":"[]","status":4}	299
2039	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 21:51:54.962	PUT	{"status":4,"message":"{moving:true}"}	299
2040	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 21:51:50.628	PUT	{"status":4,"message":{"message":"service activated"}}	299
2041	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 21:51:57.98	PUT	{"status":4}	299
2042	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 21:52:12.604	POST	{"multicast_id":5466698231434815874,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474246332495390%aa7e4a83f9fd7ecd"}]}	299
2043	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 21:52:10.866	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	299
2044	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 21:54:39.52	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 21:54:40.76","description":"freight home intelligent elevator"}}	300
2045	http://localhost:8080/has/arduino/arduino/car/actual-info	51	2016-09-18 21:54:41.832	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 21:54:41.834","description":"freight home intelligent car"},"basket":"[]","status":4}	300
2046	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 21:54:43.663	PUT	{"status":4,"message":"{moving:true}"}	300
2047	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 21:54:39.52	PUT	{"status":4,"message":{"message":"service activated"}}	300
2048	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 21:54:46.681	PUT	{"status":4}	300
2049	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 21:55:01.615	POST	{"multicast_id":7764798228825087187,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474246501466938%aa7e4a83f9fd7ecd"}]}	300
2050	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 21:54:59.626	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	300
2051	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 21:55:14.657	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 21:55:15.943","description":"freight home intelligent elevator"}}	301
2052	http://localhost:8080/has/arduino/arduino/car/actual-info	51	2016-09-18 21:55:17.079	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 21:55:17.081","description":"freight home intelligent car"},"basket":"[]","status":4}	301
2053	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 21:55:19.225	PUT	{"status":4,"message":"{moving:true}"}	301
2054	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 21:55:14.657	PUT	{"status":4,"message":{"message":"service activated"}}	301
2055	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 21:55:22.243	PUT	{"status":4}	301
2056	https://fcm.googleapis.com/fcm/send	{}	2016-09-18 21:55:43.186	POST	{"multicast_id":8029382893663582046,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474246543042822%aa7e4a83f9fd7ecd"}]}	301
2057	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-18 21:55:35.711	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	301
2058	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 21:55:51.888	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 21:55:52.868","description":"freight home intelligent elevator"}}	302
2059	http://localhost:8080/has/arduino/arduino/car/actual-info	51	2016-09-18 21:55:53.927	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 21:55:53.929","description":"freight home intelligent car"},"basket":"[]","status":4}	302
2060	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 21:55:55.997	PUT	{"status":4,"message":"{moving:true}"}	302
2061	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 21:55:51.888	PUT	{"status":4,"message":{"message":"service activated"}}	302
2062	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 21:55:59.015	PUT	{"status":4}	302
2063	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 21:56:14.466	POST	{"multicast_id":5837738406689687761,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474246574321502%aa7e4a83f9fd7ecd"}]}	302
2064	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 21:56:11.911	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	302
2065	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 21:56:20.578	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 21:56:21.611","description":"freight home intelligent elevator"}}	303
2066	http://localhost:8080/has/arduino/arduino/car/actual-info	51	2016-09-18 21:56:22.659	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 21:56:22.662","description":"freight home intelligent car"},"basket":"[]","status":4}	303
2067	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 21:56:24.549	PUT	{"status":4,"message":"{moving:true}"}	303
2068	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 21:56:20.578	PUT	{"status":4,"message":{"message":"service activated"}}	303
2069	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 21:56:27.567	PUT	{"status":4}	303
2070	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 21:56:42.734	POST	{"multicast_id":4685755407677480515,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474246602604465%aa7e4a83f9fd7ecd"}]}	303
2071	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 21:56:40.313	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	303
2153	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-19 03:59:54.122	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	319
2072	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 21:59:23.421	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 21:59:24.854","description":"freight home intelligent elevator"}}	304
2073	http://localhost:8080/has/arduino/arduino/car/actual-info	51	2016-09-18 21:59:25.872	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 21:59:25.874","description":"freight home intelligent car"},"basket":"[]","status":4}	304
2074	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 21:59:27.769	PUT	{"status":4,"message":"{moving:true}"}	304
2075	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 21:59:23.421	PUT	{"status":4,"message":{"message":"service activated"}}	304
2076	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 21:59:30.786	PUT	{"status":4}	304
2077	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 21:59:51.707	POST	{"multicast_id":4821949744396801559,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474246791587393%aa7e4a83f9fd7ecd"}]}	304
2078	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 21:59:43.744	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	304
2079	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 22:00:00.9	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 22:00:07.093","description":"freight home intelligent elevator"}}	305
2080	http://localhost:8080/has/arduino/arduino/car/actual-info	51	2016-09-18 22:00:08.127	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 22:00:08.13","description":"freight home intelligent car"},"basket":"[]","status":4}	305
2081	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 22:00:10.036	PUT	{"status":4,"message":"{moving:true}"}	305
2082	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 22:00:00.9	PUT	{"status":4,"message":{"message":"service activated"}}	305
2083	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 22:00:13.053	PUT	{"status":4}	305
2084	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 22:00:27.763	POST	{"multicast_id":6272360407568336779,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474246827647444%aa7e4a83f9fd7ecd"}]}	305
2085	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 22:00:26.064	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	305
2086	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 22:00:30.571	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 22:00:31.423","description":"freight home intelligent elevator"}}	306
2087	http://localhost:8080/has/arduino/arduino/car/actual-info	51	2016-09-18 22:00:32.461	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 22:00:32.464","description":"freight home intelligent car"},"basket":"[]","status":4}	306
2088	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 22:00:34.381	PUT	{"status":4,"message":"{moving:true}"}	306
2089	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 22:00:30.571	PUT	{"status":4,"message":{"message":"service activated"}}	306
2090	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 22:00:37.399	PUT	{"status":4}	306
2091	https://fcm.googleapis.com/fcm/send	{}	2016-09-18 22:00:53.296	POST	{"multicast_id":7347264736858221442,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474246853178446%aa7e4a83f9fd7ecd"}]}	306
2092	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-18 22:00:50.924	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	306
2093	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 22:03:29.141	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 22:03:30.35","description":"freight home intelligent elevator"}}	307
2094	http://localhost:8080/has/arduino/arduino/car/actual-info	51	2016-09-18 22:03:31.432	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 22:03:31.434","description":"freight home intelligent car"},"basket":"[]","status":4}	307
2095	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 22:03:33.287	PUT	{"status":4,"message":"{moving:true}"}	307
2096	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 22:03:29.141	PUT	{"status":4,"message":{"message":"service activated"}}	307
2097	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 22:03:36.305	PUT	{"status":4}	307
2098	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 22:03:50.827	POST	{"multicast_id":6667733451386963337,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474247030716181%aa7e4a83f9fd7ecd"}]}	307
2099	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 22:03:49.244	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	307
2100	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-18 22:04:01.492	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-18 22:04:02.72","description":"freight home intelligent elevator"}}	308
2329	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-27 23:14:28.731	PUT	{"status":4,"message":"{moving:true}"}	349
2101	http://localhost:8080/has/arduino/arduino/car/actual-info	51	2016-09-18 22:04:03.794	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-18 22:04:03.797","description":"freight home intelligent car"},"basket":"[]","status":4}	308
2102	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-18 22:04:05.929	PUT	{"status":4,"message":"{moving:true}"}	308
2103	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-18 22:04:01.492	PUT	{"status":4,"message":{"message":"service activated"}}	308
2104	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-18 22:04:08.946	PUT	{"status":4}	308
2105	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-18 22:04:23.367	POST	{"multicast_id":9006405909096993646,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474247063249906%aa7e4a83f9fd7ecd"}]}	308
2106	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-18 22:04:21.803	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	308
2107	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-19 02:42:40.631	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-19 02:42:42.656","description":"freight home intelligent elevator"}}	309
2108	http://localhost:8080/has/arduino/arduino/car/actual-info	56	2016-09-19 02:42:43.712	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-19 02:42:43.719","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	309
2109	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-19 02:45:15.193	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-19 02:45:16.532","description":"freight home intelligent elevator"}}	310
2110	http://localhost:8080/has/arduino/arduino/car/actual-info	56	2016-09-19 02:45:17.604	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-09-19 02:45:17.623","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	310
2111	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-19 02:46:53.609	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-19 02:46:54.914","description":"freight home intelligent elevator"}}	311
2112	http://localhost:8080/has/arduino/arduino/car/actual-info	54	2016-09-19 02:46:55.967	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-09-19 02:46:55.976","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	311
2113	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-19 02:46:57.871	PUT	{"status":4,"message":"{moving:true}"}	311
2114	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-19 02:46:53.609	PUT	{"status":4,"message":{"message":"service activated"}}	311
2115	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-19 02:47:00.894	PUT	{"status":4}	311
2116	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-19 02:47:23.754	POST	{"multicast_id":8697671959387322455,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474264043658878%aa7e4a83f9fd7ecd"}]}	311
2117	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-19 02:47:13.83	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	311
2118	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-19 02:52:08.548	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-19 02:52:09.925","description":"freight home intelligent elevator"}}	312
2119	http://localhost:8080/has/arduino/arduino/car/actual-info	37	2016-09-19 02:52:10.956	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-19 02:52:10.961","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	312
2120	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-19 03:39:40.598	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-19 03:39:42.93","description":"freight home intelligent elevator"}}	313
2121	http://localhost:8080/has/arduino/arduino/car/actual-info	54	2016-09-19 03:39:44.986	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-09-19 03:39:45.005","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	313
2122	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-19 03:39:47.973	PUT	{"status":4,"message":"{moving:true}"}	313
2123	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-19 03:39:40.598	PUT	{"status":4,"message":{"message":"service activated"}}	313
2124	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-19 03:39:50.997	PUT	{"status":4}	313
2125	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-19 03:40:05.799	POST	{"multicast_id":8526393372115024885,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474267205723774%aa7e4a83f9fd7ecd"}]}	313
2126	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-19 03:40:03.93	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	313
2330	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-27 23:14:23.138	PUT	{"status":4,"message":{"message":"service activated"}}	349
2127	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-19 03:41:03.006	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-19 03:41:04.252","description":"freight home intelligent elevator"}}	314
2128	http://localhost:8080/has/arduino/arduino/car/actual-info	46	2016-09-19 03:41:05.25	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-19 03:41:05.258","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	314
2129	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-19 03:48:26.53	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-19 03:48:27.943","description":"freight home intelligent elevator"}}	315
2130	http://localhost:8080/has/arduino/arduino/car/actual-info	56	2016-09-19 03:48:28.968	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-19 03:48:28.975","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	315
2131	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-19 03:49:04.962	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-19 03:49:06.185","description":"freight home intelligent elevator"}}	316
2132	http://localhost:8080/has/arduino/arduino/car/actual-info	54	2016-09-19 03:49:07.179	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-19 03:49:07.185","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	316
2133	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-19 03:49:09.044	PUT	{"status":4,"message":"{moving:true}"}	316
2134	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-19 03:49:04.962	PUT	{"status":4,"message":{"message":"service activated"}}	316
2135	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-19 03:49:12.065	PUT	{"status":4}	316
2136	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-19 03:49:27.441	POST	{"multicast_id":9140516672846372800,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474267767347534%aa7e4a83f9fd7ecd"}]}	316
2137	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-19 03:49:24.928	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	316
2138	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-19 03:49:48.373	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-19 03:49:49.551","description":"freight home intelligent elevator"}}	317
2139	http://localhost:8080/has/arduino/arduino/car/actual-info	45	2016-09-19 03:49:50.573	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-19 03:49:50.58","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	317
2140	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-19 03:55:47.594	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-19 03:55:49.599","description":"freight home intelligent elevator"}}	318
2141	http://localhost:8080/has/arduino/arduino/car/actual-info	39	2016-09-19 03:55:50.616	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-19 03:55:50.622","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	318
2142	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-19 03:55:52.519	PUT	{"status":4,"message":"{moving:true}"}	318
2143	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-19 03:55:47.594	PUT	{"status":4,"message":{"message":"service activated"}}	318
2144	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-19 03:55:55.54	PUT	{"status":4}	318
2145	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-19 03:56:10.242	POST	{"multicast_id":6456137716817699738,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474268170144935%aa7e4a83f9fd7ecd"}]}	318
2146	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-19 03:56:08.45	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	318
2147	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-19 03:59:34.216	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-19 03:59:35.439","description":"freight home intelligent elevator"}}	319
2148	http://localhost:8080/has/arduino/arduino/car/actual-info	47	2016-09-19 03:59:36.439	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-19 03:59:36.444","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	319
2149	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-19 03:59:38.301	PUT	{"status":4,"message":"{moving:true}"}	319
2150	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-19 03:59:34.216	PUT	{"status":4,"message":{"message":"service activated"}}	319
2151	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-19 03:59:41.323	PUT	{"status":4}	319
2152	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-19 03:59:55.777	POST	{"multicast_id":8081464244323407104,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474268395694291%aa7e4a83f9fd7ecd"}]}	319
2331	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-27 23:14:31.75	PUT	{"status":4}	349
2154	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-19 04:00:09.675	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-19 04:00:10.878","description":"freight home intelligent elevator"}}	320
2155	http://localhost:8080/has/arduino/arduino/car/actual-info	48	2016-09-19 04:00:11.888	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-19 04:00:11.892","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	320
2156	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-19 04:00:13.73	PUT	{"status":4,"message":"{moving:true}"}	320
2157	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-19 04:00:09.675	PUT	{"status":4,"message":{"message":"service activated"}}	320
2158	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-19 04:00:16.752	PUT	{"status":4}	320
2159	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-19 04:00:31.351	POST	{"multicast_id":7437437079480522184,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474268431262306%aa7e4a83f9fd7ecd"}]}	320
2160	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-19 04:00:29.67	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	320
2161	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-19 04:35:33	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-19 04:35:34.996","description":"freight home intelligent elevator"}}	321
2162	http://localhost:8080/has/arduino/arduino/car/actual-info	47	2016-09-19 04:35:37.03	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-19 04:35:37.037","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	321
2163	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-19 04:35:38.889	PUT	{"status":4,"message":"{moving:true}"}	321
2164	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-19 04:35:33	PUT	{"status":4,"message":{"message":"service activated"}}	321
2165	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-19 04:35:41.908	PUT	{"status":4}	321
2166	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-19 04:35:56.937	POST	{"multicast_id":6138069948174997541,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474270556853477%aa7e4a83f9fd7ecd"}]}	321
2167	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-19 04:35:54.743	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	321
2168	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-19 04:37:16.785	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-19 04:37:17.851","description":"freight home intelligent elevator"}}	322
2169	http://localhost:8080/has/arduino/arduino/car/actual-info	48	2016-09-19 04:37:18.849	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-19 04:37:18.854","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	322
2170	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-19 04:37:20.701	PUT	{"status":4,"message":"{moving:true}"}	322
2171	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-19 04:37:16.785	PUT	{"status":4,"message":{"message":"service activated"}}	322
2172	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-19 04:37:23.721	PUT	{"status":4}	322
2173	https://fcm.googleapis.com/fcm/send	{}	2016-09-19 04:37:38.333	POST	{"multicast_id":8988635133385048952,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474270658247739%aa7e4a83f9fd7ecd"}]}	322
2174	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-19 04:37:36.659	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	322
2175	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-19 04:38:40.525	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-19 04:38:41.587","description":"freight home intelligent elevator"}}	323
2176	http://localhost:8080/has/arduino/arduino/car/actual-info	48	2016-09-19 04:38:42.593	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-19 04:38:42.597","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	323
2177	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-19 04:38:44.457	PUT	{"status":4,"message":"{moving:true}"}	323
2178	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-19 04:38:40.525	PUT	{"status":4,"message":{"message":"service activated"}}	323
2179	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-19 04:38:47.476	PUT	{"status":4}	323
2180	https://fcm.googleapis.com/fcm/send	{}	2016-09-19 04:39:02.068	POST	{"multicast_id":8341329773986854639,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474270741975367%aa7e4a83f9fd7ecd"}]}	323
2181	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-19 04:39:00.38	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	323
2182	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-19 04:39:50.953	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-19 04:39:52.229","description":"freight home intelligent elevator"}}	324
2392	https://fcm.googleapis.com/fcm/send	{}	2016-10-26 14:29:40.056	POST	{"multicast_id":6136569021174336648,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477502979901359%aa7e4a83f9fd7ecd"}]}	360
2183	http://localhost:8080/has/arduino/arduino/car/actual-info	48	2016-09-19 04:39:53.217	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-19 04:39:53.221","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	324
2184	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-19 04:39:55.553	PUT	{"status":4,"message":"{moving:true}"}	324
2185	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-19 04:39:50.953	PUT	{"status":4,"message":{"message":"service activated"}}	324
2186	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-19 04:39:58.574	PUT	{"status":4}	324
2187	https://fcm.googleapis.com/fcm/send	{}	2016-09-19 04:40:12.991	POST	{"multicast_id":7731229691841303966,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474270812908769%aa7e4a83f9fd7ecd"}]}	324
2188	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-19 04:40:11.481	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	324
2189	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-19 04:41:34.111	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-19 04:41:35.313","description":"freight home intelligent elevator"}}	325
2190	http://localhost:8080/has/arduino/arduino/car/actual-info	48	2016-09-19 04:41:36.319	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-19 04:41:36.325","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	325
2191	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-19 04:41:39.168	PUT	{"status":4,"message":"{moving:true}"}	325
2192	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-19 04:41:34.111	PUT	{"status":4,"message":{"message":"service activated"}}	325
2193	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-19 04:41:42.188	PUT	{"status":4}	325
2194	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-19 04:41:57.158	POST	{"multicast_id":8687934437886962354,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1474270917068995%aa7e4a83f9fd7ecd"}]}	325
2195	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-19 04:41:55.1	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	325
2196	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-19 04:45:46.809	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-19 04:45:48.045","description":"freight home intelligent elevator"}}	326
2197	http://localhost:8080/has/arduino/arduino/car/actual-info	49	2016-09-19 04:45:49.04	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-19 04:45:49.044","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	326
2198	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-19 04:46:21.295	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-19 04:46:22.57","description":"freight home intelligent elevator"}}	327
2199	http://localhost:8080/has/arduino/arduino/car/actual-info	49	2016-09-19 04:46:23.582	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-19 04:46:23.586","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	327
2200	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-19 04:47:47.296	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-19 04:47:48.534","description":"freight home intelligent elevator"}}	328
2201	http://localhost:8080/has/arduino/arduino/car/actual-info	50	2016-09-19 04:47:50.023	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-19 04:47:50.028","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	328
2203	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-27 20:21:22.185	PUT	{"status":6,"message":{"message":"unknown","reason":"unknown"}}	329
2205	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-27 20:31:31.426	PUT	{"status":6,"message":{"message":"unknown","reason":"unknown"}}	330
2206	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-27 20:37:51.318	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-27 20:37:55.326","description":"freight home intelligent elevator"}}	331
2207	http://localhost:8080/has/arduino/arduino/car/actual-info	57	2016-09-27 20:37:56.484	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-09-27 20:37:56.505","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	331
2208	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-27 20:37:58.539	PUT	{"status":4,"message":"{moving:true}"}	331
2209	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-27 20:37:51.318	PUT	{"status":4,"message":{"message":"service activated"}}	331
2210	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-27 20:38:01.564	PUT	{"status":4}	331
2211	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-27 20:38:17.192	POST	{"multicast_id":8602739013770146870,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1475019497048959%aa7e4a83f9fd7ecd"}]}	331
2212	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-27 20:38:14.884	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	331
2213	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-27 20:38:49.504	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-27 20:38:50.763","description":"freight home intelligent elevator"}}	332
2214	http://localhost:8080/has/arduino/arduino/car/actual-info	57	2016-09-27 20:38:51.782	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-27 20:38:51.791","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	332
2215	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-27 20:38:53.658	PUT	{"status":4,"message":"{moving:true}"}	332
2216	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-27 20:38:49.504	PUT	{"status":4,"message":{"message":"service activated"}}	332
2217	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-27 20:38:56.684	PUT	{"status":4}	332
2219	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-27 20:39:09.624	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	332
2220	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-27 20:41:26.917	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-27 20:41:27.776","description":"freight home intelligent elevator"}}	333
2221	http://localhost:8080/has/arduino/arduino/car/actual-info	57	2016-09-27 20:41:28.817	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-27 20:41:28.822","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	333
2222	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-27 20:41:30.683	PUT	{"status":4,"message":"{moving:true}"}	333
2223	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-27 20:41:26.917	PUT	{"status":4,"message":{"message":"service activated"}}	333
2224	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-27 20:41:33.703	PUT	{"status":4}	333
2225	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-27 20:41:48.216	POST	{"multicast_id":8507738845514247562,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1475019708109731%aa7e4a83f9fd7ecd"}]}	333
2226	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-27 20:41:46.624	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	333
2227	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-27 20:43:41.849	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-27 20:43:43.035","description":"freight home intelligent elevator"}}	334
2228	http://localhost:8080/has/arduino/arduino/car/actual-info	57	2016-09-27 20:43:44.076	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-27 20:43:44.081","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	334
2229	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-27 20:43:46.381	PUT	{"status":4,"message":"{moving:true}"}	334
2230	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-27 20:43:41.849	PUT	{"status":4,"message":{"message":"service activated"}}	334
2231	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-27 20:43:49.401	PUT	{"status":4}	334
2232	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-27 20:44:03.697	POST	{"multicast_id":7755050878202905130,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1475019843603213%aa7e4a83f9fd7ecd"}]}	334
2233	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-27 20:44:02.319	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	334
2234	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-27 20:44:16.145	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-27 20:44:17.367","description":"freight home intelligent elevator"}}	335
2235	http://localhost:8080/has/arduino/arduino/car/actual-info	57	2016-09-27 20:44:18.413	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-27 20:44:18.418","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	335
2236	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-27 20:44:20.281	PUT	{"status":4,"message":"{moving:true}"}	335
2237	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-27 20:44:16.145	PUT	{"status":4,"message":{"message":"service activated"}}	335
2238	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-27 20:44:23.303	PUT	{"status":4}	335
2239	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-27 20:44:37.95	POST	{"multicast_id":8310009364352164367,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1475019877841239%aa7e4a83f9fd7ecd"}]}	335
2240	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-27 20:44:36.224	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	335
2241	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-27 20:44:44.821	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-27 20:44:46.036","description":"freight home intelligent elevator"}}	336
2393	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-10-26 14:29:38.237	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	360
2242	http://localhost:8080/has/arduino/arduino/car/actual-info	57	2016-09-27 20:44:47.05	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-27 20:44:47.054","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	336
2243	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-27 20:44:49.278	PUT	{"status":4,"message":"{moving:true}"}	336
2244	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-27 20:44:44.821	PUT	{"status":4,"message":{"message":"service activated"}}	336
2245	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-27 20:44:52.297	PUT	{"status":4}	336
2246	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-27 20:45:06.605	POST	{"multicast_id":6702162946747133087,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1475019906500208%aa7e4a83f9fd7ecd"}]}	336
2247	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-27 20:45:05.204	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	336
2248	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-27 20:51:41.709	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-27 20:51:42.919","description":"freight home intelligent elevator"}}	337
2249	http://localhost:8080/has/arduino/arduino/car/actual-info	57	2016-09-27 20:51:43.966	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-27 20:51:43.971","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	337
2250	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-27 20:51:47.323	PUT	{"status":4,"message":"{moving:true}"}	337
2251	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-27 20:51:41.709	PUT	{"status":4,"message":{"message":"service activated"}}	337
2252	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-27 20:51:50.344	PUT	{"status":4}	337
2253	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-27 20:52:05.605	POST	{"multicast_id":8700572935569025909,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1475020325490304%aa7e4a83f9fd7ecd"}]}	337
2254	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-27 20:52:03.259	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	337
2255	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-27 21:00:48.239	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-27 21:00:54.463","description":"freight home intelligent elevator"}}	338
2256	http://localhost:8080/has/arduino/arduino/car/actual-info	58	2016-09-27 21:00:55.515	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-27 21:00:55.519","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	338
2257	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-27 21:00:57.885	PUT	{"status":4,"message":"{moving:true}"}	338
2258	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-27 21:00:48.239	PUT	{"status":4,"message":{"message":"service activated"}}	338
2259	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-27 21:01:00.907	PUT	{"status":4}	338
2260	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-27 21:01:15.604	POST	{"multicast_id":6413867147169700819,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1475020875491639%aa7e4a83f9fd7ecd"}]}	338
2261	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-27 21:01:13.844	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	338
2262	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-27 21:08:42.455	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-27 21:08:44.064","description":"freight home intelligent elevator"}}	339
2263	http://localhost:8080/has/arduino/arduino/car/actual-info	59	2016-09-27 21:08:45.07	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-27 21:08:45.075","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	339
2264	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-27 21:10:03.746	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-27 21:10:05.051","description":"freight home intelligent elevator"}}	340
2265	http://localhost:8080/has/arduino/arduino/car/actual-info	59	2016-09-27 21:10:06.073	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-27 21:10:06.079","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	340
2266	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-27 21:10:08.421	PUT	{"status":4,"message":"{moving:true}"}	340
2267	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-27 21:10:03.746	PUT	{"status":4,"message":{"message":"service activated"}}	340
2268	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-27 21:10:11.442	PUT	{"status":4}	340
2269	https://fcm.googleapis.com/fcm/send	{}	2016-09-27 21:10:27.135	POST	{"multicast_id":5935994959799073478,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1475021427021909%aa7e4a83f9fd7ecd"}]}	340
2270	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-27 21:10:24.224	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	340
2271	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-27 21:20:22.087	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-27 21:20:23.517","description":"freight home intelligent elevator"}}	341
2272	http://localhost:8080/has/arduino/arduino/car/actual-info	60	2016-09-27 21:20:24.526	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-27 21:20:24.529","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	341
2273	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-27 21:20:26.367	PUT	{"status":4,"message":"{moving:true}"}	341
2274	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-27 21:20:22.087	PUT	{"status":4,"message":{"message":"service activated"}}	341
2275	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-27 21:20:29.386	PUT	{"status":4}	341
2276	https://fcm.googleapis.com/fcm/send	{}	2016-09-27 21:20:44.076	POST	{"multicast_id":5589029527077416943,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1475022043982454%aa7e4a83f9fd7ecd"}]}	341
2277	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-27 21:20:42.311	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	341
2278	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-27 21:25:27.354	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-27 21:25:29.376","description":"freight home intelligent elevator"}}	342
2279	http://localhost:8080/has/arduino/arduino/car/actual-info	61	2016-09-27 21:25:30.362	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-27 21:25:30.367","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	342
2280	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-27 21:25:33.13	PUT	{"status":4,"message":"{moving:true}"}	342
2281	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-27 21:25:27.354	PUT	{"status":4,"message":{"message":"service activated"}}	342
2282	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-27 21:25:36.151	PUT	{"status":4}	342
2283	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-27 21:25:50.777	POST	{"multicast_id":5751043969520282441,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1475022350671036%aa7e4a83f9fd7ecd"}]}	342
2284	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-27 21:25:49.044	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	342
2285	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-27 22:51:55.101	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-27 22:51:56.746","description":"freight home intelligent elevator"}}	343
2286	http://localhost:8080/has/arduino/arduino/car/actual-info	62	2016-09-27 22:51:57.769	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-27 22:51:57.776","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	343
2287	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-27 22:52:00.112	PUT	{"status":4,"message":"{moving:true}"}	343
2288	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-27 22:51:55.101	PUT	{"status":4,"message":{"message":"service activated"}}	343
2289	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-27 22:52:03.133	PUT	{"status":4}	343
2290	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-27 22:52:19.78	POST	{"multicast_id":7198322645681517817,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1475027539683589%aa7e4a83f9fd7ecd"}]}	343
2291	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-27 22:52:17.06	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	343
2292	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-27 22:52:29.551	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-27 22:52:30.782","description":"freight home intelligent elevator"}}	344
2293	http://localhost:8080/has/arduino/arduino/car/actual-info	62	2016-09-27 22:52:31.784	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-27 22:52:31.788","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	344
2294	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-27 22:52:33.628	PUT	{"status":4,"message":"{moving:true}"}	344
2295	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-27 22:52:29.551	PUT	{"status":4,"message":{"message":"service activated"}}	344
2296	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-27 22:52:36.649	PUT	{"status":4}	344
2297	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-27 22:52:51.621	POST	{"multicast_id":5980943018833908981,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1475027571523951%aa7e4a83f9fd7ecd"}]}	344
2298	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-27 22:52:49.567	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	344
2299	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-27 22:52:57.052	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-27 22:52:57.943","description":"freight home intelligent elevator"}}	345
2300	http://localhost:8080/has/arduino/arduino/car/actual-info	62	2016-09-27 22:52:58.95	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-27 22:52:58.955","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	345
2301	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-27 22:53:00.837	PUT	{"status":4,"message":"{moving:true}"}	345
2302	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-27 22:52:57.052	PUT	{"status":4,"message":{"message":"service activated"}}	345
2303	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-27 22:53:03.858	PUT	{"status":4}	345
2304	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-27 22:53:18.172	POST	{"multicast_id":7360830788506476355,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1475027598084395%aa7e4a83f9fd7ecd"}]}	345
2305	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-27 22:53:16.777	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	345
2306	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-27 23:06:06.785	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-27 23:06:08.06","description":"freight home intelligent elevator"}}	346
2307	http://localhost:8080/has/arduino/arduino/car/actual-info	64	2016-09-27 23:06:09.062	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-27 23:06:09.066","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	346
2308	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-27 23:06:12.374	PUT	{"status":4,"message":"{moving:true}"}	346
2309	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-27 23:06:06.785	PUT	{"status":4,"message":{"message":"service activated"}}	346
2310	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-27 23:06:15.394	PUT	{"status":4}	346
2311	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-27 23:06:30.526	POST	{"multicast_id":4707021431656343509,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1475028390424557%aa7e4a83f9fd7ecd"}]}	346
2312	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-27 23:06:28.119	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	346
2313	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-27 23:06:34.164	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-27 23:06:35.052","description":"freight home intelligent elevator"}}	347
2314	http://localhost:8080/has/arduino/arduino/car/actual-info	64	2016-09-27 23:06:36.526	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-27 23:06:36.53","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	347
2315	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-27 23:06:43.767	PUT	{"status":4,"message":"{moving:true}"}	347
2316	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-27 23:06:34.164	PUT	{"status":4,"message":{"message":"service activated"}}	347
2317	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-27 23:06:46.787	PUT	{"status":4}	347
2318	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-27 23:07:02.07	POST	{"multicast_id":5735789381773867903,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1475028421958601%aa7e4a83f9fd7ecd"}]}	347
2319	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-27 23:06:59.747	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	347
2320	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-27 23:13:17.814	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-27 23:13:19.053","description":"freight home intelligent elevator"}}	348
2321	http://localhost:8080/has/arduino/arduino/car/actual-info	64	2016-09-27 23:13:20.079	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-27 23:13:20.082","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	348
2322	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-27 23:13:21.955	PUT	{"status":4,"message":"{moving:true}"}	348
2323	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-27 23:13:17.814	PUT	{"status":4,"message":{"message":"service activated"}}	348
2324	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-27 23:13:24.975	PUT	{"status":4}	348
2325	https://fcm.googleapis.com/fcm/send	{}	2016-09-27 23:13:40.756	POST	{"multicast_id":5830682705621152622,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1475028820647670%aa7e4a83f9fd7ecd"}]}	348
2326	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-09-27 23:13:38.36	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	348
2327	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-27 23:14:23.138	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-27 23:14:24.87","description":"freight home intelligent elevator"}}	349
2328	http://localhost:8080/has/arduino/arduino/car/actual-info	64	2016-09-27 23:14:25.885	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-27 23:14:25.889","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	349
2332	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-27 23:14:48.086	POST	{"multicast_id":6275074608757033545,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1475028887969809%aa7e4a83f9fd7ecd"}]}	349
2333	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-27 23:14:44.918	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	349
2334	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-27 23:27:08.11	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-27 23:27:10.297","description":"freight home intelligent elevator"}}	350
2335	http://localhost:8080/has/arduino/arduino/car/actual-info	65	2016-09-27 23:27:11.308	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-27 23:27:11.313","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	350
2336	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-27 23:27:13.606	PUT	{"status":4,"message":"{moving:true}"}	350
2337	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-27 23:27:08.11	PUT	{"status":4,"message":{"message":"service activated"}}	350
2338	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-27 23:27:16.626	PUT	{"status":4}	350
2339	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-27 23:27:31.58	POST	{"multicast_id":7517998561494482810,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1475029651486290%aa7e4a83f9fd7ecd"}]}	350
2340	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-27 23:27:30.062	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	350
2341	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-09-27 23:41:09.7	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-09-27 23:41:10.98","description":"freight home intelligent elevator"}}	351
2342	http://localhost:8080/has/arduino/arduino/car/actual-info	66	2016-09-27 23:41:12.003	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-09-27 23:41:12.009","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	351
2343	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-09-27 23:41:14.779	PUT	{"status":4,"message":"{moving:true}"}	351
2344	http://localhost:8080/has/fim/pc/system/take-freight		2016-09-27 23:41:09.7	PUT	{"status":4,"message":{"message":"service activated"}}	351
2345	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-09-27 23:41:17.8	PUT	{"status":4}	351
2346	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"elevator is taking the object","service":"Freight Home Service"}}	2016-09-27 23:41:32.459	POST	{"multicast_id":6502307724887850608,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1475030492346943%aa7e4a83f9fd7ecd"}]}	351
2347	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-09-27 23:41:30.748	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	351
2349	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-26 13:58:54.767	PUT	{"status":6,"message":{"message":"unknown","reason":"unknown"}}	352
2350	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 14:14:50.988	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-26 14:14:54.93","description":"freight home intelligent elevator"}}	353
2351	http://localhost:8080/has/arduino/arduino/car/actual-info	25	2016-10-26 14:14:56.042	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-10-26 14:14:56.053","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	353
2352	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-26 14:14:50.988	PUT	{"status":6,"message":{"message":"unknown","reason":"unknown"}}	353
2353	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 14:15:12.335	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-26 14:15:13.776","description":"freight home intelligent elevator"}}	354
2354	http://localhost:8080/has/arduino/arduino/car/actual-info	25	2016-10-26 14:15:14.836	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-10-26 14:15:14.841","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	354
2355	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-26 14:15:12.335	PUT	{"status":6,"message":{"message":"unknown","reason":"unknown"}}	354
2356	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 14:16:43.091	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":true,"timestamp":"2016-10-26 14:16:44.211","description":"freight home intelligent elevator"}}	355
2357	http://localhost:8080/has/arduino/arduino/car/actual-info	25	2016-10-26 14:16:45.242	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-10-26 14:16:45.247","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	355
2358	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-26 14:16:43.091	PUT	{"status":6,"message":{"message":"unknown","reason":"unknown"}}	355
2359	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 14:20:18.865	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":true,"timestamp":"2016-10-26 14:20:20.531","description":"freight home intelligent elevator"}}	356
2360	http://localhost:8080/has/arduino/arduino/car/actual-info	12	2016-10-26 14:20:21.582	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-10-26 14:20:21.586","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	356
2361	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-26 14:20:23.546	PUT	{"status":4,"message":"{moving:true}"}	356
2362	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-26 14:20:18.865	PUT	{"status":4,"message":{"message":"service activated"}}	356
2363	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-26 14:20:26.567	PUT	{"status":4}	356
2364	https://fcm.googleapis.com/fcm/send	{}	2016-10-26 14:20:41.81	POST	{"multicast_id":8911775638960319053,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477502441689718%aa7e4a83f9fd7ecd"}]}	356
2365	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-10-26 14:20:39.78	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	356
2366	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 14:23:25.878	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":true,"timestamp":"2016-10-26 14:23:27.041","description":"freight home intelligent elevator"}}	357
2367	http://localhost:8080/has/arduino/arduino/car/actual-info	10	2016-10-26 14:23:28.067	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-26 14:23:28.071","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	357
2368	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-26 14:23:29.937	PUT	{"status":4,"message":"{moving:true}"}	357
2369	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-26 14:23:25.878	PUT	{"status":4,"message":{"message":"service activated"}}	357
2370	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-26 14:23:32.955	PUT	{"status":4}	357
2371	https://fcm.googleapis.com/fcm/send	{}	2016-10-26 14:23:47.376	POST	{"multicast_id":7561267538130702105,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477502627247586%aa7e4a83f9fd7ecd"}]}	357
2372	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-10-26 14:23:45.67	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	357
2373	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 14:24:46.692	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":true,"timestamp":"2016-10-26 14:24:47.972","description":"freight home intelligent elevator"}}	358
2374	http://localhost:8080/has/arduino/arduino/car/actual-info	10	2016-10-26 14:24:49.019	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-26 14:24:49.026","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	358
2375	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-26 14:24:50.963	PUT	{"status":4,"message":"{moving:true}"}	358
2376	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-26 14:24:46.692	PUT	{"status":4,"message":{"message":"service activated"}}	358
2377	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-26 14:24:53.983	PUT	{"status":4}	358
2378	https://fcm.googleapis.com/fcm/send	{}	2016-10-26 14:25:08.859	POST	{"multicast_id":7912505493518388935,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477502708726205%aa7e4a83f9fd7ecd"}]}	358
2379	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-10-26 14:25:07.147	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	358
2380	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 14:27:05.859	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-26 14:27:07.088","description":"freight home intelligent elevator"}}	359
2381	http://localhost:8080/has/arduino/arduino/car/actual-info	10	2016-10-26 14:27:08.129	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-26 14:27:08.133","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	359
2382	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-26 14:27:10.045	PUT	{"status":4,"message":"{moving:true}"}	359
2383	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-26 14:27:05.859	PUT	{"status":4,"message":{"message":"service activated"}}	359
2384	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-26 14:27:13.062	PUT	{"status":4}	359
2385	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"Elevador levando cesta!","service":"Freight Home Service"}}	2016-10-26 14:27:28.037	POST	{"multicast_id":6427691959597947136,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477502847924893%aa7e4a83f9fd7ecd"}]}	359
2386	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-10-26 14:27:26.013	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	359
2387	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 14:29:17.707	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-26 14:29:19.287","description":"freight home intelligent elevator"}}	360
2388	http://localhost:8080/has/arduino/arduino/car/actual-info	10	2016-10-26 14:29:20.303	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-26 14:29:20.309","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	360
2389	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-26 14:29:22.268	PUT	{"status":4,"message":"{moving:true}"}	360
2390	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-26 14:29:17.707	PUT	{"status":4,"message":{"message":"service activated"}}	360
2391	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-26 14:29:25.287	PUT	{"status":4}	360
2394	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 14:33:54.826	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-26 14:33:56.58","description":"freight home intelligent elevator"}}	361
2395	http://localhost:8080/has/arduino/arduino/car/actual-info	10	2016-10-26 14:33:57.616	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-26 14:33:57.62","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	361
2396	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-26 14:33:59.502	PUT	{"status":4,"message":"{moving:true}"}	361
2397	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-26 14:33:54.826	PUT	{"status":4,"message":{"message":"service activated"}}	361
2398	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-26 14:34:02.521	PUT	{"status":4}	361
2399	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"Elevador levando cesta!","service":"Freight Home Service"}}	2016-10-26 14:34:17.068	POST	{"multicast_id":5441247587404134298,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477503256950405%aa7e4a83f9fd7ecd"}]}	361
2400	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-10-26 14:34:15.424	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	361
2401	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 14:34:39.433	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-26 14:34:40.611","description":"freight home intelligent elevator"}}	362
2402	http://localhost:8080/has/arduino/arduino/car/actual-info	10	2016-10-26 14:34:41.632	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-26 14:34:41.636","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	362
2403	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-26 14:34:43.49	PUT	{"status":4,"message":"{moving:true}"}	362
2404	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-26 14:34:39.433	PUT	{"status":4,"message":{"message":"service activated"}}	362
2405	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-26 14:34:46.51	PUT	{"status":4}	362
2406	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"Elevador levando cesta!","service":"Freight Home Service"}}	2016-10-26 14:35:00.973	POST	{"multicast_id":8809275828168597192,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477503300836116%aa7e4a83f9fd7ecd"}]}	362
2407	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-10-26 14:34:59.44	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	362
2408	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 14:38:48.772	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-26 14:38:50.067","description":"freight home intelligent elevator"}}	363
2409	http://localhost:8080/has/arduino/arduino/car/actual-info	10	2016-10-26 14:38:51.107	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-26 14:38:51.112","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	363
2410	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-26 14:38:53.047	PUT	{"status":4,"message":"{moving:true}"}	363
2411	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-26 14:38:48.772	PUT	{"status":4,"message":{"message":"service activated"}}	363
2412	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-26 14:38:56.069	PUT	{"status":4}	363
2413	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"Elevador levando cesta!","service":"Freight Home Service"}}	2016-10-26 14:39:10.322	POST	{"multicast_id":5838827969076190585,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477503550209099%aa7e4a83f9fd7ecd"}]}	363
2414	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-10-26 14:39:08.8	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	363
2415	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 15:00:08.516	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-26 15:00:10.82","description":"freight home intelligent elevator"}}	364
2416	http://localhost:8080/has/arduino/arduino/car/actual-info	10	2016-10-26 15:00:11.9	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-26 15:00:11.904","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	364
2417	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-26 15:00:13.983	PUT	{"status":4,"message":"{moving:true}"}	364
2418	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-26 15:00:08.516	PUT	{"status":4,"message":{"message":"service activated"}}	364
2419	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-26 15:00:17.002	PUT	{"status":4}	364
2420	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"Elevador levando cesta!","service":"Freight Home Service"}}	2016-10-26 15:00:32.02	POST	{"multicast_id":8873595201743378892,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477504831893198%aa7e4a83f9fd7ecd"}]}	364
2421	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-10-26 15:00:29.941	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	364
2448	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-26 15:17:13.618	PUT	{"status":4}	371
2422	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 15:14:09.269	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-26 15:14:10.561","description":"freight home intelligent elevator"}}	365
2423	http://localhost:8080/has/arduino/arduino/car/actual-info	10	2016-10-26 15:14:11.6	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-26 15:14:11.605","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	365
2424	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-26 15:14:13.539	PUT	{"status":4,"message":"{moving:true}"}	365
2425	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-26 15:14:09.269	PUT	{"status":4,"message":{"message":"service activated"}}	365
2426	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-26 15:14:16.558	PUT	{"status":4}	365
2427	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"Elevador levando cesta!","service":"Freight Home Service"}}	2016-10-26 15:14:31.139	POST	{"multicast_id":8741069190436301933,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477505671021488%aa7e4a83f9fd7ecd"}]}	365
2428	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-10-26 15:14:29.501	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	365
2429	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 15:14:42.813	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-26 15:14:49.183","description":"freight home intelligent elevator"}}	366
2430	http://localhost:8080/has/arduino/arduino/car/actual-info	12	2016-10-26 15:14:50.199	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-26 15:14:50.203","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	366
2431	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-26 15:14:55.063	PUT	{"status":4,"message":"{moving:true}"}	366
2432	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-26 15:14:42.813	PUT	{"status":4,"message":{"message":"service activated"}}	366
2433	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-26 15:14:58.081	PUT	{"status":4}	366
2434	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"Elevador levando cesta!","service":"Freight Home Service"}}	2016-10-26 15:15:12.999	POST	{"multicast_id":4639155049389657497,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477505712862662%aa7e4a83f9fd7ecd"}]}	366
2435	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-10-26 15:15:10.879	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	366
2436	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 15:15:24.704	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-26 15:15:26.049","description":"freight home intelligent elevator"}}	367
2437	http://localhost:8080/has/arduino/arduino/car/actual-info	16	2016-10-26 15:15:27.046	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-26 15:15:27.05","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	367
2438	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 15:15:46.994	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-26 15:15:47.868","description":"freight home intelligent elevator"}}	368
2439	http://localhost:8080/has/arduino/arduino/car/actual-info	17	2016-10-26 15:15:48.881	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-26 15:15:48.885","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	368
2440	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 15:16:17.404	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-26 15:16:18.765","description":"freight home intelligent elevator"}}	369
2441	http://localhost:8080/has/arduino/arduino/car/actual-info	50	2016-10-26 15:16:19.767	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-26 15:16:19.77","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	369
2442	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 15:16:45.585	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-26 15:16:46.501","description":"freight home intelligent elevator"}}	370
2443	http://localhost:8080/has/arduino/arduino/car/actual-info	56	2016-10-26 15:16:47.503	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-26 15:16:47.506","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	370
2444	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 15:17:06.835	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-26 15:17:07.701","description":"freight home intelligent elevator"}}	371
2445	http://localhost:8080/has/arduino/arduino/car/actual-info	54	2016-10-26 15:17:08.717	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-26 15:17:08.721","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	371
2446	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-26 15:17:10.6	PUT	{"status":4,"message":"{moving:true}"}	371
2447	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-26 15:17:06.835	PUT	{"status":4,"message":{"message":"service activated"}}	371
2449	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"Elevador levando cesta!","service":"Freight Home Service"}}	2016-10-26 15:17:28.312	POST	{"multicast_id":7728964468988052484,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477505848188988%aa7e4a83f9fd7ecd"}]}	371
2450	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-10-26 15:17:26.53	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	371
2451	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 15:21:49.433	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-26 15:21:50.695","description":"freight home intelligent elevator"}}	372
2452	http://localhost:8080/has/arduino/arduino/car/actual-info	30	2016-10-26 15:21:51.731	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-26 15:21:51.734","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	372
2453	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 15:22:24.354	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-26 15:22:26.089","description":"freight home intelligent elevator"}}	373
2454	http://localhost:8080/has/arduino/arduino/car/actual-info	30	2016-10-26 15:22:27.122	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-26 15:22:27.125","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	373
2455	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 15:23:47.537	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-26 15:23:48.844","description":"freight home intelligent elevator"}}	374
2456	http://localhost:8080/has/arduino/arduino/car/actual-info	6	2016-10-26 15:23:49.865	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-26 15:23:49.871","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	374
2457	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 15:24:03.575	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-26 15:24:04.456","description":"freight home intelligent elevator"}}	375
2458	http://localhost:8080/has/arduino/arduino/car/actual-info	3	2016-10-26 15:24:05.474	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-26 15:24:05.478","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	375
2459	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-26 15:24:07.384	PUT	{"status":4,"message":"{moving:true}"}	375
2460	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-26 15:24:03.575	PUT	{"status":4,"message":{"message":"service activated"}}	375
2461	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-26 15:24:10.403	PUT	{"status":4}	375
2462	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"Elevador levando cesta!","service":"Freight Home Service"}}	2016-10-26 15:24:25.086	POST	{"multicast_id":7455152058669331833,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477506264961723%aa7e4a83f9fd7ecd"}]}	375
2463	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-10-26 15:24:23.341	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	375
2464	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 15:25:31.043	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-26 15:25:32.424","description":"freight home intelligent elevator"}}	376
2465	http://localhost:8080/has/arduino/arduino/car/actual-info	3	2016-10-26 15:25:33.438	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-26 15:25:33.441","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	376
2466	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-26 15:25:35.295	PUT	{"status":4,"message":"{moving:true}"}	376
2467	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-26 15:25:31.043	PUT	{"status":4,"message":{"message":"service activated"}}	376
2468	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-26 15:25:38.314	PUT	{"status":4}	376
2469	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"Elevador levando cesta!","service":"Freight Home Service"}}	2016-10-26 15:25:52.778	POST	{"multicast_id":8123997757803502871,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477506352653015%aa7e4a83f9fd7ecd"}]}	376
2470	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-10-26 15:25:51.231	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	376
2471	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 15:26:01.732	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-26 15:26:03.098","description":"freight home intelligent elevator"}}	377
2472	http://localhost:8080/has/arduino/arduino/car/actual-info	10	2016-10-26 15:26:04.172	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-26 15:26:04.175","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	377
2473	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-26 15:26:06.026	PUT	{"status":4,"message":"{moving:true}"}	377
2474	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-26 15:26:01.732	PUT	{"status":4,"message":{"message":"service activated"}}	377
2476	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"Elevador levando cesta!","service":"Freight Home Service"}}	2016-10-26 15:26:23.3	POST	{"multicast_id":8967200895843511321,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477506383161935%aa7e4a83f9fd7ecd"}]}	377
2477	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-10-26 15:26:21.768	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	377
2478	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 15:26:30.933	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-26 15:26:31.797","description":"freight home intelligent elevator"}}	378
2479	http://localhost:8080/has/arduino/arduino/car/actual-info	17	2016-10-26 15:26:32.8	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-26 15:26:32.803","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	378
2480	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 15:26:43.913	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-26 15:26:44.794","description":"freight home intelligent elevator"}}	379
2481	http://localhost:8080/has/arduino/arduino/car/actual-info	17	2016-10-26 15:26:45.828	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-26 15:26:45.831","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	379
2482	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-26 15:26:56.353	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-26 15:26:57.27","description":"freight home intelligent elevator"}}	380
2483	http://localhost:8080/has/arduino/arduino/car/actual-info	17	2016-10-26 15:26:58.293	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-26 15:26:58.297","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	380
2484	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-30 19:47:26.281	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-30 18:47:34.83","description":"freight home intelligent elevator"}}	381
2485	http://localhost:8080/has/arduino/arduino/car/actual-info	25	2016-10-30 19:47:35.968	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-10-30 19:47:36.041","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	381
2486	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-30 19:47:38.035	PUT	{"status":6,"message":""}	381
2487	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-30 19:47:26.28	PUT	{"status":6,"message":{"message":"the car service can not be fired","reason":""}}	381
2488	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-30 19:51:19.337	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-30 18:51:21.436","description":"freight home intelligent elevator"}}	382
2489	http://localhost:8080/has/arduino/arduino/car/actual-info	10	2016-10-30 19:51:22.512	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-10-30 19:51:22.56","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	382
2490	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-30 19:51:26.551	PUT	{"status":6,"message":""}	382
2491	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-30 19:51:19.337	PUT	{"status":6,"message":{"message":"the car service can not be fired","reason":""}}	382
2492	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-30 20:00:05.698	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-30 19:00:08.705","description":"freight home intelligent elevator"}}	383
2493	http://localhost:8080/has/arduino/arduino/car/actual-info	17	2016-10-30 20:00:09.806	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-10-30 20:00:09.856","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	383
2494	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-30 20:00:11.911	PUT	{"status":6,"message":""}	383
2495	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-30 20:00:05.698	PUT	{"status":6,"message":{"message":"the car service can not be fired","reason":""}}	383
2496	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-30 20:02:31.386	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-30 19:02:34.944","description":"freight home intelligent elevator"}}	384
2497	http://localhost:8080/has/arduino/arduino/car/actual-info	17	2016-10-30 20:02:36.662	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-10-30 20:02:36.781","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	384
2498	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-30 20:02:39.275	PUT	{"status":6,"message":""}	384
2499	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-30 20:02:31.384	PUT	{"status":6,"message":{"message":"the car service can not be fired","reason":""}}	384
2500	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-30 23:05:24.605	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-30 23:05:34.491","description":"freight home intelligent elevator"}}	385
2501	http://localhost:8080/has/arduino/arduino/car/actual-info	25	2016-10-30 23:05:35.639	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-10-30 23:05:35.653","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	385
2503	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-30 23:05:24.605	PUT	{"status":4,"message":{"message":"service activated"}}	385
2504	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-30 23:05:41.137	PUT	{"status":4}	385
2505	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"Elevador levando cesta!","service":"Freight Home Service"}}	2016-10-30 23:06:01.494	POST	{"multicast_id":5507804664922245013,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477879561375475%aa7e4a83f9fd7ecd"}]}	385
2506	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-10-30 23:05:54.83	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	385
2507	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-30 23:07:19.865	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-30 23:07:24.062","description":"freight home intelligent elevator"}}	386
2508	http://localhost:8080/has/arduino/arduino/car/actual-info	17	2016-10-30 23:07:25.093	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-30 23:07:25.097","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	386
2509	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-30 23:08:35.96	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-30 23:08:37.16","description":"freight home intelligent elevator"}}	387
2510	http://localhost:8080/has/arduino/arduino/car/actual-info	14	2016-10-30 23:08:38.176	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-30 23:08:38.18","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	387
2511	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-30 23:08:40.051	PUT	{"status":4,"message":"{moving:true}"}	387
2512	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-30 23:08:35.96	PUT	{"status":4,"message":{"message":"service activated"}}	387
2513	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-30 23:08:43.07	PUT	{"status":4}	387
2514	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"Elevador levando cesta!","service":"Freight Home Service"}}	2016-10-30 23:09:02.395	POST	{"multicast_id":7843707771212094178,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477879742293308%aa7e4a83f9fd7ecd"}]}	387
2515	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-10-30 23:08:56.008	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	387
2516	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-30 23:38:41.965	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-30 23:38:43.21","description":"freight home intelligent elevator"}}	388
2517	http://localhost:8080/has/arduino/arduino/car/actual-info	22	2016-10-30 23:38:44.246	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-30 23:38:44.251","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	388
2518	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-30 23:39:39.753	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-30 23:39:40.908","description":"freight home intelligent elevator"}}	389
2519	http://localhost:8080/has/arduino/arduino/car/actual-info	22	2016-10-30 23:39:41.926	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-30 23:39:41.93","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	389
2520	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-30 23:58:32.002	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-30 23:58:38.876","description":"freight home intelligent elevator"}}	390
2521	http://localhost:8080/has/arduino/arduino/car/actual-info	60	2016-10-30 23:58:39.897	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-30 23:58:39.902","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	390
2522	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-31 00:08:45.675	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-31 00:08:51.827","description":"freight home intelligent elevator"}}	391
2523	http://localhost:8080/has/arduino/arduino/car/actual-info	60	2016-10-31 00:08:52.874	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-31 00:08:52.881","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	391
2524	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-31 00:11:41.41	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-31 00:11:42.863","description":"freight home intelligent elevator"}}	392
2525	http://localhost:8080/has/arduino/arduino/car/actual-info	57	2016-10-31 00:11:43.891	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-31 00:11:43.895","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	392
2526	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-31 00:14:16.434	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-31 00:14:23.389","description":"freight home intelligent elevator"}}	393
2527	http://localhost:8080/has/arduino/arduino/car/actual-info	54	2016-10-31 00:14:24.449	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-31 00:14:24.452","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	393
2528	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-31 00:14:26.363	PUT	{"status":4,"message":"{moving:true}"}	393
2529	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-31 00:14:16.434	PUT	{"status":4,"message":{"message":"service activated"}}	393
2530	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-31 00:14:29.381	PUT	{"status":4}	393
2531	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"Elevador levando cesta!","service":"Freight Home Service"}}	2016-10-31 00:14:44.488	POST	{"multicast_id":4987641895779327599,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477883684406918%aa7e4a83f9fd7ecd"}]}	393
2532	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-10-31 00:14:42.712	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	393
2533	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-31 00:14:59.258	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-31 00:15:01.006","description":"freight home intelligent elevator"}}	394
2534	http://localhost:8080/has/arduino/arduino/car/actual-info	48	2016-10-31 00:15:03.487	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-31 00:15:03.491","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	394
2535	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-31 00:15:08.412	PUT	{"status":4,"message":"{moving:true}"}	394
2536	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-31 00:14:59.258	PUT	{"status":4,"message":{"message":"service activated"}}	394
2537	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-31 00:15:11.43	PUT	{"status":4}	394
2538	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"Elevador levando cesta!","service":"Freight Home Service"}}	2016-10-31 00:15:26.344	POST	{"multicast_id":5619147222892748691,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477883726262918%aa7e4a83f9fd7ecd"}]}	394
2539	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-10-31 00:15:24.346	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	394
2540	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-31 00:17:32.096	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-31 00:17:33.568","description":"freight home intelligent elevator"}}	395
2541	http://localhost:8080/has/arduino/arduino/car/actual-info	34	2016-10-31 00:17:34.58	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-31 00:17:34.585","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	395
2542	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-31 00:17:36.447	PUT	{"status":4,"message":"{moving:true}"}	395
2543	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-31 00:17:32.096	PUT	{"status":4,"message":{"message":"service activated"}}	395
2544	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-31 00:17:39.466	PUT	{"status":4}	395
2545	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"Elevador levando cesta!","service":"Freight Home Service"}}	2016-10-31 00:17:59.802	POST	{"multicast_id":7889817372728517658,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477883879712284%aa7e4a83f9fd7ecd"}]}	395
2546	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-10-31 00:17:52.367	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	395
2547	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-31 00:24:51.353	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-31 00:24:57.794","description":"freight home intelligent elevator"}}	396
2548	http://localhost:8080/has/arduino/arduino/car/actual-info	34	2016-10-31 00:24:58.826	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-31 00:24:58.829","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	396
2549	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-31 00:25:03.705	PUT	{"status":4}	396
2550	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-31 00:25:00.686	PUT	{"status":4,"message":"{moving:true}"}	396
2551	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-31 00:24:51.353	PUT	{"status":4,"message":{"message":"service activated"}}	396
2552	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"Elevador levando cesta!","service":"Freight Home Service"}}	2016-10-31 00:26:21.443	POST	{"multicast_id":6765687578155145254,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477884381368482%aa7e4a83f9fd7ecd"}]}	396
2553	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-10-31 00:25:16.604	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	396
2554	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-31 00:26:31.814	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-31 00:26:33.186","description":"freight home intelligent elevator"}}	397
2555	http://localhost:8080/has/arduino/arduino/car/actual-info	34	2016-10-31 00:26:34.182	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-31 00:26:34.185","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	397
2556	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-31 00:26:36.605	PUT	{"status":4,"message":"{moving:true}"}	397
2557	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-31 00:26:31.814	PUT	{"status":4,"message":{"message":"service activated"}}	397
2558	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-31 00:26:39.624	PUT	{"status":4}	397
2559	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"Elevador levando cesta!","service":"Freight Home Service"}}	2016-10-31 00:26:54.204	POST	{"multicast_id":6048698365999670386,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477884414116859%aa7e4a83f9fd7ecd"}]}	397
2560	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-10-31 00:26:52.533	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	397
2561	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-31 00:32:27.438	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-31 00:32:29.636","description":"freight home intelligent elevator"}}	398
2562	http://localhost:8080/has/arduino/arduino/car/actual-info	34	2016-10-31 00:32:30.678	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-10-31 00:32:30.699","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	398
2563	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-31 00:32:32.705	PUT	{"status":4,"message":"{moving:true}"}	398
2564	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-31 00:32:27.437	PUT	{"status":4,"message":{"message":"service activated"}}	398
2565	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-31 00:32:35.735	PUT	{"status":4}	398
2566	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"Elevador levando cesta!","service":"Freight Home Service"}}	2016-10-31 00:32:50.345	POST	{"multicast_id":6865189314762947321,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477884770271107%aa7e4a83f9fd7ecd"}]}	398
2567	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-10-31 00:32:48.705	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	398
2568	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-31 00:33:07.92	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-31 00:33:09.106","description":"freight home intelligent elevator"}}	399
2569	http://localhost:8080/has/arduino/arduino/car/actual-info	34	2016-10-31 00:33:10.108	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-31 00:33:10.117","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	399
2570	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-31 00:33:12.021	PUT	{"status":4,"message":"{moving:true}"}	399
2571	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-31 00:33:07.92	PUT	{"status":4,"message":{"message":"service activated"}}	399
2572	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-31 00:33:15.044	PUT	{"status":4}	399
2573	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"Elevador levando cesta!","service":"Freight Home Service"}}	2016-10-31 00:33:30.321	POST	{"multicast_id":8260941904782363742,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477884810244798%aa7e4a83f9fd7ecd"}]}	399
2574	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-10-31 00:33:27.934	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	399
2575	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-31 00:33:38.502	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-31 00:33:39.677","description":"freight home intelligent elevator"}}	400
2576	http://localhost:8080/has/arduino/arduino/car/actual-info	34	2016-10-31 00:33:40.667	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-31 00:33:40.671","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	400
2577	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-31 00:33:43.011	PUT	{"status":4,"message":"{moving:true}"}	400
2578	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-31 00:33:38.502	PUT	{"status":4,"message":{"message":"service activated"}}	400
2579	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-31 00:33:46.034	PUT	{"status":4}	400
2580	https://fcm.googleapis.com/fcm/send	{}	2016-10-31 00:34:00.05	POST	{"multicast_id":6496012800368243695,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477884839962071%aa7e4a83f9fd7ecd"}]}	400
2581	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":6,"message":{"message":"elevator door obstructed"}}	2016-10-31 00:33:58.924	PUT	{"status":6,"message":{"message":"elevator door obstructed"}}	400
2583	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-31 00:35:26.088	PUT	{"status":6,"message":{"message":"unknown","reason":"unknown"}}	401
2584	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-31 00:36:39.637	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-31 00:36:43.682","description":"freight home intelligent elevator"}}	402
2585	http://localhost:8080/has/arduino/arduino/car/actual-info	34	2016-10-31 00:36:44.88	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.0,"timestamp":"2016-10-31 00:36:44.9","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	402
2586	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-31 00:36:53.962	PUT	{"status":4,"message":"{moving:true}"}	402
2587	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-31 00:36:39.637	PUT	{"status":4,"message":{"message":"service activated"}}	402
2588	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-31 00:36:56.99	PUT	{"status":4}	402
2589	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"Elevador levando cesta!","service":"Freight Home Service"}}	2016-10-31 00:37:25.087	POST	{"multicast_id":5274966925453716328,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477885044999772%aa7e4a83f9fd7ecd"}]}	402
2590	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-10-31 00:37:11.566	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	402
2591	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-31 00:38:02.464	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-31 00:38:04.614","description":"freight home intelligent elevator"}}	403
2592	http://localhost:8080/has/arduino/arduino/car/actual-info	34	2016-10-31 00:38:05.661	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-31 00:38:05.668","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	403
2593	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-31 00:38:07.523	PUT	{"status":4,"message":"{moving:true}"}	403
2594	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-31 00:38:02.464	PUT	{"status":4,"message":{"message":"service activated"}}	403
2595	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-31 00:38:10.548	PUT	{"status":4}	403
2596	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"Elevador levando cesta!","service":"Freight Home Service"}}	2016-10-31 00:38:30.027	POST	{"multicast_id":8314773467437579292,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477885109927130%aa7e4a83f9fd7ecd"}]}	403
2597	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-10-31 00:38:23.506	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	403
2598	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-31 00:39:06.096	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-31 00:39:07.372","description":"freight home intelligent elevator"}}	404
2599	http://localhost:8080/has/arduino/arduino/car/actual-info	34	2016-10-31 00:39:08.852	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-31 00:39:08.858","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	404
2600	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-31 00:39:10.78	PUT	{"status":4,"message":"{moving:true}"}	404
2601	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-31 00:39:06.096	PUT	{"status":4,"message":{"message":"service activated"}}	404
2602	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-31 00:39:13.804	PUT	{"status":4}	404
2603	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"Elevador levando cesta!","service":"Freight Home Service"}}	2016-10-31 00:40:35.35	POST	{"multicast_id":4908402016024872664,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477885235257279%aa7e4a83f9fd7ecd"}]}	404
2604	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-10-31 00:39:30.369	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	404
2605	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-31 00:41:25.123	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-31 00:41:37.803","description":"freight home intelligent elevator"}}	405
2606	http://localhost:8080/has/arduino/arduino/car/actual-info	34	2016-10-31 00:41:38.901	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-31 00:41:38.906","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	405
2607	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-31 00:41:41.9	PUT	{"status":4,"message":"{moving:true}"}	405
2608	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-31 00:41:25.123	PUT	{"status":4,"message":{"message":"service activated"}}	405
2609	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-31 00:41:44.924	PUT	{"status":4}	405
2610	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"Elevador levando cesta!","service":"Freight Home Service"}}	2016-10-31 00:42:00.567	POST	{"multicast_id":8607637710053677665,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477885320488829%aa7e4a83f9fd7ecd"}]}	405
2611	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-10-31 00:41:58.116	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	405
2612	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-31 00:43:20.076	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-31 00:43:21.318","description":"freight home intelligent elevator"}}	406
2613	http://localhost:8080/has/arduino/arduino/car/actual-info	34	2016-10-31 00:43:23.405	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-31 00:43:23.41","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	406
2614	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-31 00:43:25.438	PUT	{"status":4,"message":"{moving:true}"}	406
2615	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-31 00:43:20.076	PUT	{"status":4,"message":{"message":"service activated"}}	406
2616	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-31 00:43:28.459	PUT	{"status":4}	406
2617	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"Elevador levando cesta!","service":"Freight Home Service"}}	2016-10-31 00:43:43.572	POST	{"multicast_id":9133068168770403064,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477885423497323%aa7e4a83f9fd7ecd"}]}	406
2618	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-10-31 00:43:42.415	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	406
2619	http://192.168.1.199/has/raspberry/elevator/actual-info		2016-10-31 00:45:02.104	GET	{"status":4,"message":{"on":true,"moving":false,"floor":0,"maxMass":0.2,"mass":0.0,"width":0.07,"length":0.118,"height":0.097,"obstacleSensor":false,"timestamp":"2016-10-31 00:45:03.678","description":"freight home intelligent elevator"}}	407
2620	http://localhost:8080/has/arduino/arduino/car/actual-info	34	2016-10-31 00:45:05.707	GET	{"car":{"moving":false,"maxMass":0.9,"width":0.147,"length":0.105,"height":0.097,"obstacleSensor":false,"distanceSensor":0.05,"timestamp":"2016-10-31 00:45:05.713","description":"freight home intelligent car"},"basket":"instanceToAnalysing.arff","status":4}	407
2621	http://localhost:8080/has/arduino/arduino/car/go-to-elevator		2016-10-31 00:45:11.597	PUT	{"status":4,"message":"{moving:true}"}	407
2622	http://localhost:8080/has/fim/pc/system/take-freight		2016-10-31 00:45:02.104	PUT	{"status":4,"message":{"message":"service activated"}}	407
2623	http://localhost:8080/has/fim/pc/system/client-fcm-update-token		2016-10-31 00:45:14.618	PUT	{"status":4}	407
2624	https://fcm.googleapis.com/fcm/send	{"to":"e4XcA4-MS3Q:APA91bHCufuGtBqit5o4BXclEo7T4CQZHPwh9YS5-fAnWMTTLsf8-GhAPGucx6227vXgt192L3DLF2RhprB6GE-7Hu4R9Qz-vBwIjPeivyqxr8fmSsmX0jgMUqDGt3l-gITbQnu6GnYj","data":{"message":"Elevador levando cesta!","service":"Freight Home Service"}}	2016-10-31 00:45:29.008	POST	{"multicast_id":8559881168249735530,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1477885528937225%aa7e4a83f9fd7ecd"}]}	407
2625	http://localhost:8080/has/fim/pc/system/observer-execution-freight	{"status":4,"message":{"message":"elevator is taking the object"}}	2016-10-31 00:45:27.615	PUT	{"status":4,"message":{"message":"elevator is taking the object"}}	407
\.


--
-- Data for Name: tuple; Type: TABLE DATA; Schema: master; Owner: -
--

COPY tuple (id_tuple, bool_side_effect) FROM stdin;
33	f
34	f
35	f
36	f
37	f
38	f
39	f
40	f
41	f
42	f
43	f
44	f
45	f
46	f
47	f
48	f
49	f
50	f
51	f
52	f
53	f
54	f
55	f
56	f
57	f
58	f
59	f
60	f
61	f
62	f
63	f
64	f
65	f
66	f
67	f
68	f
69	f
70	f
71	f
72	f
73	f
74	f
75	f
76	f
77	f
78	f
79	f
80	f
81	f
82	f
83	f
84	f
85	f
86	f
87	f
88	f
89	f
90	f
91	f
92	f
93	t
94	t
95	t
96	f
97	f
98	f
99	f
100	t
101	t
102	t
103	t
104	f
105	f
106	t
107	t
108	t
109	t
110	f
111	f
112	f
113	f
114	f
115	f
116	f
117	f
118	f
119	f
120	f
121	t
122	f
123	f
124	f
125	f
126	f
127	f
128	t
129	t
130	f
131	f
132	f
133	f
134	f
135	t
136	t
137	f
138	f
139	f
140	f
141	f
142	f
143	f
144	f
145	f
146	f
147	t
148	t
149	f
150	f
151	f
152	t
153	f
154	f
155	f
156	f
157	f
158	f
159	f
160	f
161	f
162	f
163	f
164	f
165	f
166	t
167	f
168	t
169	t
170	t
171	t
172	t
173	t
174	f
175	t
176	t
177	f
178	t
179	t
180	t
181	t
182	t
183	t
184	t
185	f
186	f
189	f
187	t
188	t
190	f
191	f
192	f
193	f
194	t
195	t
196	f
197	f
198	t
199	t
200	f
201	f
202	f
203	f
204	f
205	f
206	t
207	f
208	f
209	t
210	f
211	f
212	f
213	f
214	f
215	t
216	t
217	f
218	f
219	f
220	f
221	t
222	f
223	t
224	t
225	t
226	f
227	t
228	f
229	f
230	f
231	f
232	f
233	f
234	t
235	f
236	t
237	f
238	t
239	f
240	t
241	t
242	f
243	t
244	t
245	t
246	t
247	f
248	t
249	f
250	f
251	f
252	f
253	f
254	t
255	f
256	t
257	f
258	f
259	t
260	f
261	f
262	f
263	t
264	t
265	t
266	t
267	t
268	t
269	t
270	t
271	f
272	f
273	f
274	f
275	f
276	t
277	f
278	f
279	f
280	f
281	t
282	t
283	f
284	f
285	f
286	f
287	t
288	f
289	f
290	t
291	t
292	f
293	f
294	t
295	f
296	t
297	f
298	f
299	f
300	f
301	t
302	f
303	f
304	f
305	f
306	t
307	f
308	f
309	f
310	f
311	f
312	f
313	f
314	f
315	f
316	f
317	f
318	f
319	f
320	f
321	f
322	t
323	t
324	t
325	f
326	f
327	f
328	f
329	f
330	f
331	f
332	f
333	f
334	f
335	f
336	f
337	f
338	f
339	f
340	t
341	t
342	f
343	f
344	f
345	f
346	f
347	f
348	t
349	f
350	f
351	f
352	f
353	f
354	f
355	f
356	t
357	t
358	t
359	f
360	t
361	f
362	f
363	f
364	f
365	f
366	f
367	f
368	f
369	f
370	f
371	f
372	f
373	f
374	f
375	f
376	f
377	f
378	f
379	f
380	f
381	f
382	f
383	f
384	f
385	f
386	f
387	f
388	f
389	f
390	f
391	f
392	f
393	f
394	f
395	f
396	f
397	f
398	f
399	f
400	t
401	f
402	f
403	f
404	f
405	f
406	f
407	f
\.


--
-- Name: basket_item_pk; Type: CONSTRAINT; Schema: master; Owner: -
--

ALTER TABLE ONLY basket_item
    ADD CONSTRAINT basket_item_pk PRIMARY KEY (id_basket, id_item);


--
-- Name: basket_pk; Type: CONSTRAINT; Schema: master; Owner: -
--

ALTER TABLE ONLY basket
    ADD CONSTRAINT basket_pk PRIMARY KEY (id_basket);


--
-- Name: client_pk; Type: CONSTRAINT; Schema: master; Owner: -
--

ALTER TABLE ONLY client
    ADD CONSTRAINT client_pk PRIMARY KEY (id_client);


--
-- Name: object_pk; Type: CONSTRAINT; Schema: master; Owner: -
--

ALTER TABLE ONLY item
    ADD CONSTRAINT object_pk PRIMARY KEY (id_item);


--
-- Name: request_answer_pk; Type: CONSTRAINT; Schema: master; Owner: -
--

ALTER TABLE ONLY request_answer
    ADD CONSTRAINT request_answer_pk PRIMARY KEY (id_request_answer);


--
-- Name: tuple_pk; Type: CONSTRAINT; Schema: master; Owner: -
--

ALTER TABLE ONLY tuple
    ADD CONSTRAINT tuple_pk PRIMARY KEY (id_tuple);


--
-- Name: idx_txt_alternative_id; Type: INDEX; Schema: master; Owner: -
--

CREATE INDEX idx_txt_alternative_id ON item USING btree (txt_alternative_id);


--
-- Name: basket_basket_item_fk; Type: FK CONSTRAINT; Schema: master; Owner: -
--

ALTER TABLE ONLY basket_item
    ADD CONSTRAINT basket_basket_item_fk FOREIGN KEY (id_basket) REFERENCES basket(id_basket);


--
-- Name: item_basket_item_fk; Type: FK CONSTRAINT; Schema: master; Owner: -
--

ALTER TABLE ONLY basket_item
    ADD CONSTRAINT item_basket_item_fk FOREIGN KEY (id_item) REFERENCES item(id_item);


--
-- Name: tuple_request_answer_fk; Type: FK CONSTRAINT; Schema: master; Owner: -
--

ALTER TABLE ONLY request_answer
    ADD CONSTRAINT tuple_request_answer_fk FOREIGN KEY (id_tuple) REFERENCES tuple(id_tuple);


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM tcc;
GRANT ALL ON SCHEMA public TO tcc;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

