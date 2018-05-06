--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: main_edge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_edge (
    id integer NOT NULL,
    destination_id integer NOT NULL,
    origin_id integer NOT NULL,
    line public.geometry(LineString,4326)
);


ALTER TABLE public.main_edge OWNER TO postgres;

--
-- Name: main_edge_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_edge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_edge_id_seq OWNER TO postgres;

--
-- Name: main_edge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_edge_id_seq OWNED BY public.main_edge.id;


--
-- Name: main_node; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_node (
    id integer NOT NULL,
    name text NOT NULL,
    location public.geometry(Point,4326) NOT NULL
);


ALTER TABLE public.main_node OWNER TO postgres;

--
-- Name: main_node_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_node_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_node_id_seq OWNER TO postgres;

--
-- Name: main_node_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_node_id_seq OWNED BY public.main_node.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: main_edge id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_edge ALTER COLUMN id SET DEFAULT nextval('public.main_edge_id_seq'::regclass);


--
-- Name: main_node id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_node ALTER COLUMN id SET DEFAULT nextval('public.main_node_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add node	7	add_node
20	Can change node	7	change_node
21	Can delete node	7	delete_node
22	Can add edge	8	add_edge
23	Can change edge	8	change_edge
24	Can delete edge	8	delete_edge
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$36000$hEyzhI897jAb$Q77YdfCG6MuOoInbXCVeXS+99eIduZZv4t6YmqjWR8k=	2018-05-05 13:06:31.974+03	t	geoteam				t	t	2018-05-05 13:06:08.725+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-05-05 14:43:48.329+03	16	Peponia -> Ag. Eleni	2	[]	8	1
2	2018-05-05 14:44:11.382+03	15	Adelfiko -> Peponia	2	[]	8	1
3	2018-05-05 14:44:26.066+03	14	Adelfiko -> Koumaria	2	[]	8	1
4	2018-05-05 14:44:29.692+03	13	Koumaria -> K. Kamila	2	[]	8	1
5	2018-05-05 14:44:33.014+03	12	Koumaria -> A. Kamila	2	[]	8	1
6	2018-05-05 14:44:40.269+03	11	Ag. Eleni -> Skoutari	2	[]	8	1
7	2018-05-05 14:44:44.536+03	10	Peponia -> Skoutari	2	[]	8	1
8	2018-05-05 14:44:48.965+03	9	K. Kamila -> Skoutari	2	[]	8	1
9	2018-05-05 14:44:52.202+03	8	Koumaria -> K. Mitrousi	2	[]	8	1
10	2018-05-05 14:44:56.929+03	7	K. Kamila -> K. Mitrousi	2	[]	8	1
11	2018-05-05 14:45:30.76+03	6	A. Kamila -> K. Mitrousi	2	[]	8	1
12	2018-05-05 14:45:38.876+03	1	Provatas -> Serres	2	[]	8	1
13	2018-05-05 14:45:48.219+03	2	K. Kamila -> Serres	2	[]	8	1
14	2018-05-05 14:45:56.173+03	3	Skoutari -> Serres	2	[]	8	1
15	2018-05-05 14:46:03.79+03	5	A. Kamila -> Provatas	2	[]	8	1
16	2018-05-05 17:08:27.409+03	31	Adelfiko -> Ag. Eleni	3		8	1
17	2018-05-05 17:08:27.414+03	30	Adelfiko -> Peponia	3		8	1
18	2018-05-05 17:08:27.42+03	29	Skoutari -> Peponia	3		8	1
19	2018-05-05 17:08:27.422+03	28	Koumaria -> Skoutari	3		8	1
20	2018-05-05 17:08:27.423+03	27	K. Mitrousi -> Skoutari	3		8	1
21	2018-05-05 17:08:27.424+03	26	A. Kamila -> Ag. Eleni	3		8	1
22	2018-05-05 17:08:27.425+03	25	A. Kamila -> Adelfiko	3		8	1
23	2018-05-05 17:08:27.426+03	24	A. Kamila -> Koumaria	3		8	1
24	2018-05-05 17:08:27.427+03	23	K. Kamila -> Skoutari	3		8	1
25	2018-05-05 17:08:27.428+03	22	K. Kamila -> Koumaria	3		8	1
26	2018-05-05 17:08:27.429+03	21	K. Kamila -> K. Mitrousi	3		8	1
27	2018-05-05 17:08:27.431+03	20	Provatas -> K. Mitrousi	3		8	1
28	2018-05-05 17:08:27.435+03	19	Serres -> K. Kamila	3		8	1
29	2018-05-05 17:08:27.436+03	18	Serres -> A. Kamila	3		8	1
30	2018-05-05 17:08:27.437+03	17	Serres -> Provatas	3		8	1
31	2018-05-05 17:08:27.438+03	16	Peponia -> Ag. Eleni	3		8	1
32	2018-05-05 17:08:27.439+03	15	Adelfiko -> Peponia	3		8	1
33	2018-05-05 17:08:27.44+03	14	Adelfiko -> Koumaria	3		8	1
34	2018-05-05 17:08:27.441+03	13	Koumaria -> K. Kamila	3		8	1
35	2018-05-05 17:08:27.442+03	12	Koumaria -> A. Kamila	3		8	1
36	2018-05-05 17:08:27.443+03	11	Ag. Eleni -> Skoutari	3		8	1
37	2018-05-05 17:08:27.445+03	10	Peponia -> Skoutari	3		8	1
38	2018-05-05 17:08:27.446+03	9	K. Kamila -> Skoutari	3		8	1
39	2018-05-05 17:08:27.447+03	8	Koumaria -> K. Mitrousi	3		8	1
40	2018-05-05 17:08:27.448+03	7	K. Kamila -> K. Mitrousi	3		8	1
41	2018-05-05 17:08:27.449+03	6	A. Kamila -> K. Mitrousi	3		8	1
42	2018-05-05 17:08:27.45+03	5	A. Kamila -> Provatas	3		8	1
43	2018-05-05 17:08:27.451+03	3	Skoutari -> Serres	3		8	1
44	2018-05-05 17:08:27.452+03	2	K. Kamila -> Serres	3		8	1
45	2018-05-05 17:08:27.453+03	1	Provatas -> Serres	3		8	1
46	2018-05-05 17:08:46.203+03	60	Adelfiko	3		7	1
47	2018-05-05 17:08:46.207+03	59	Ag. Eleni	3		7	1
48	2018-05-05 17:08:46.209+03	58	Peponia	3		7	1
49	2018-05-05 17:08:46.212+03	57	Koumaria	3		7	1
50	2018-05-05 17:08:46.215+03	56	K. Kamila	3		7	1
51	2018-05-05 17:08:46.216+03	55	A. Kamila	3		7	1
52	2018-05-05 17:08:46.218+03	54	K. Mitrousi	3		7	1
53	2018-05-05 17:08:46.219+03	53	Skoutari	3		7	1
54	2018-05-05 17:08:46.221+03	52	Provatas	3		7	1
55	2018-05-05 17:08:46.222+03	51	Serres	3		7	1
56	2018-05-05 17:08:46.223+03	50	Adelfiko	3		7	1
57	2018-05-05 17:08:46.225+03	49	Ag. Eleni	3		7	1
58	2018-05-05 17:08:46.231+03	48	Peponia	3		7	1
59	2018-05-05 17:08:46.233+03	47	Koumaria	3		7	1
60	2018-05-05 17:08:46.235+03	46	K. Kamila	3		7	1
61	2018-05-05 17:08:46.236+03	45	A. Kamila	3		7	1
62	2018-05-05 17:08:46.238+03	44	K. Mitrousi	3		7	1
63	2018-05-05 17:08:46.239+03	43	Skoutari	3		7	1
64	2018-05-05 17:08:46.241+03	42	Provatas	3		7	1
65	2018-05-05 17:08:46.242+03	41	Serres	3		7	1
66	2018-05-05 17:08:46.244+03	40	Adelfiko	3		7	1
67	2018-05-05 17:08:46.248+03	39	Ag. Eleni	3		7	1
68	2018-05-05 17:08:46.25+03	38	Peponia	3		7	1
69	2018-05-05 17:08:46.251+03	37	Koumaria	3		7	1
70	2018-05-05 17:08:46.252+03	36	K. Kamila	3		7	1
71	2018-05-05 17:08:46.254+03	35	A. Kamila	3		7	1
72	2018-05-05 17:08:46.255+03	34	K. Mitrousi	3		7	1
73	2018-05-05 17:08:46.256+03	33	Skoutari	3		7	1
74	2018-05-05 17:08:46.257+03	32	Provatas	3		7	1
75	2018-05-05 17:08:46.259+03	31	Serres	3		7	1
76	2018-05-05 17:08:46.261+03	30	Adelfiko	3		7	1
77	2018-05-05 17:08:46.262+03	29	Ag. Eleni	3		7	1
78	2018-05-05 17:08:46.264+03	28	Peponia	3		7	1
79	2018-05-05 17:08:46.265+03	27	Koumaria	3		7	1
80	2018-05-05 17:08:46.267+03	26	K. Kamila	3		7	1
81	2018-05-05 17:08:46.269+03	25	A. Kamila	3		7	1
82	2018-05-05 17:08:46.27+03	24	K. Mitrousi	3		7	1
83	2018-05-05 17:08:46.271+03	23	Skoutari	3		7	1
84	2018-05-05 17:08:46.273+03	22	Provatas	3		7	1
85	2018-05-05 17:08:46.276+03	21	Serres	3		7	1
86	2018-05-05 17:08:46.282+03	20	Adelfiko	3		7	1
87	2018-05-05 17:08:46.283+03	19	Ag. Eleni	3		7	1
88	2018-05-05 17:08:46.285+03	18	Peponia	3		7	1
89	2018-05-05 17:08:46.286+03	17	Koumaria	3		7	1
90	2018-05-05 17:08:46.287+03	16	K. Kamila	3		7	1
91	2018-05-05 17:08:46.289+03	15	A. Kamila	3		7	1
92	2018-05-05 17:08:46.29+03	14	K. Mitrousi	3		7	1
93	2018-05-05 17:08:46.292+03	13	Skoutari	3		7	1
94	2018-05-05 17:08:46.293+03	12	Provatas	3		7	1
95	2018-05-05 17:08:46.297+03	11	Serres	3		7	1
96	2018-05-05 17:08:46.299+03	10	Peponia	3		7	1
97	2018-05-05 17:08:46.3+03	9	Ag. Eleni	3		7	1
98	2018-05-05 17:08:46.302+03	8	Adelfiko	3		7	1
99	2018-05-05 17:08:46.303+03	7	Skoutari	3		7	1
100	2018-05-05 17:08:46.304+03	6	Koumaria	3		7	1
101	2018-05-05 17:08:46.305+03	5	K. Mitrousi	3		7	1
102	2018-05-05 17:08:46.307+03	4	K. Kamila	3		7	1
103	2018-05-05 17:08:46.308+03	3	A. Kamila	3		7	1
104	2018-05-05 17:08:46.309+03	2	Provatas	3		7	1
105	2018-05-05 17:08:46.311+03	1	Serres	3		7	1
106	2018-05-05 17:11:28.459+03	70	Adelfiko	3		7	1
107	2018-05-05 17:11:28.462+03	69	Ag. Eleni	3		7	1
108	2018-05-05 17:11:28.465+03	68	Peponia	3		7	1
109	2018-05-05 17:11:28.466+03	67	Koumaria	3		7	1
110	2018-05-05 17:11:28.468+03	66	K. Kamila	3		7	1
111	2018-05-05 17:11:28.47+03	65	A. Kamila	3		7	1
112	2018-05-05 17:11:28.471+03	64	K. Mitrousi	3		7	1
113	2018-05-05 17:11:28.472+03	63	Skoutari	3		7	1
114	2018-05-05 17:11:28.474+03	62	Provatas	3		7	1
115	2018-05-05 17:11:28.475+03	61	Serres	3		7	1
116	2018-05-05 17:12:49.116+03	80	Adelfiko	3		7	1
117	2018-05-05 17:12:49.12+03	79	Ag. Eleni	3		7	1
118	2018-05-05 17:12:49.121+03	78	Peponia	3		7	1
119	2018-05-05 17:12:49.123+03	77	Koumaria	3		7	1
120	2018-05-05 17:12:49.127+03	76	K. Kamila	3		7	1
121	2018-05-05 17:12:49.13+03	75	A. Kamila	3		7	1
122	2018-05-05 17:12:49.132+03	74	K. Mitrousi	3		7	1
123	2018-05-05 17:12:49.133+03	73	Skoutari	3		7	1
124	2018-05-05 17:12:49.134+03	72	Provatas	3		7	1
125	2018-05-05 17:12:49.135+03	71	Serres	3		7	1
126	2018-05-05 17:18:12.39+03	90	Adelfiko	3		7	1
127	2018-05-05 17:18:12.394+03	89	Ag. Eleni	3		7	1
128	2018-05-05 17:18:12.395+03	88	Peponia	3		7	1
129	2018-05-05 17:18:12.396+03	87	Koumaria	3		7	1
130	2018-05-05 17:18:12.397+03	86	K. Kamila	3		7	1
131	2018-05-05 17:18:12.398+03	85	A. Kamila	3		7	1
132	2018-05-05 17:18:12.399+03	84	K. Mitrousi	3		7	1
133	2018-05-05 17:18:12.4+03	83	Skoutari	3		7	1
134	2018-05-05 17:18:12.401+03	82	Provatas	3		7	1
135	2018-05-05 17:18:12.402+03	81	Serres	3		7	1
136	2018-05-05 17:23:03.181+03	110	Adelfiko	3		7	1
137	2018-05-05 17:23:03.203+03	109	Ag. Eleni	3		7	1
138	2018-05-05 17:23:03.235+03	108	Peponia	3		7	1
139	2018-05-05 17:23:03.282+03	107	Koumaria	3		7	1
140	2018-05-05 17:23:03.303+03	106	K. Kamila	3		7	1
141	2018-05-05 17:23:03.304+03	105	A. Kamila	3		7	1
142	2018-05-05 17:23:03.306+03	104	K. Mitrousi	3		7	1
143	2018-05-05 17:23:03.311+03	103	Skoutari	3		7	1
144	2018-05-05 17:23:03.313+03	102	Provatas	3		7	1
145	2018-05-05 17:23:03.314+03	101	Serres	3		7	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	group
3	auth	permission
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	main	node
8	main	edge
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-05-05 11:03:34.072+03
2	auth	0001_initial	2018-05-05 11:03:35.233+03
3	admin	0001_initial	2018-05-05 11:03:35.434+03
4	admin	0002_logentry_remove_auto_add	2018-05-05 11:03:35.477+03
5	contenttypes	0002_remove_content_type_name	2018-05-05 11:03:35.596+03
6	auth	0002_alter_permission_name_max_length	2018-05-05 11:03:35.636+03
7	auth	0003_alter_user_email_max_length	2018-05-05 11:03:35.661+03
8	auth	0004_alter_user_username_opts	2018-05-05 11:03:35.679+03
9	auth	0005_alter_user_last_login_null	2018-05-05 11:03:35.696+03
10	auth	0006_require_contenttypes_0002	2018-05-05 11:03:35.699+03
11	auth	0007_alter_validators_add_error_messages	2018-05-05 11:03:35.714+03
12	auth	0008_alter_user_username_max_length	2018-05-05 11:03:35.809+03
13	sessions	0001_initial	2018-05-05 11:03:36.026+03
14	main	0001_initial	2018-05-05 11:05:11.085+03
15	main	0002_edge_line	2018-05-05 14:41:00.299+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
1x6iql8fky641xkg2awl7hvm668qbrrq	MTg1MzBjNGFmNzFlZTg1OWVkMTY4NmM1NjdlMDBjMjUwNTQzYmVhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMzMzc4ZTc1NjkzZTlhNDQ4ZWEwYzJkM2ZmOTAzMjQ4NThhNzQ5MWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-05-19 13:06:31.975+03
\.


--
-- Data for Name: main_edge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_edge (id, destination_id, origin_id, line) FROM stdin;
224	282	281	0102000020E610000002000000DC9C4A06808A374040C23060C98B44404B0169FF03643740172CD505BC884440
225	283	281	0102000020E610000002000000DC9C4A06808A374040C23060C98B444097FE25A94C853740CE6F986890824440
226	284	281	0102000020E610000002000000DC9C4A06808A374040C23060C98B44400762D9CC21753740F37684D382874440
227	285	282	0102000020E6100000020000004B0169FF03643740172CD505BC884440251FBB0B946C3740F3599E0777874440
228	285	284	0102000020E6100000020000000762D9CC21753740F37684D382874440251FBB0B946C3740F3599E0777874440
229	286	284	0102000020E6100000020000000762D9CC21753740F37684D382874440BF620D17B97B37408C69A67B9D824440
230	287	284	0102000020E6100000020000000762D9CC21753740F37684D3828744409B02999D456F37406F4562821A824440
231	286	283	0102000020E61000000200000097FE25A94C853740CE6F986890824440BF620D17B97B37408C69A67B9D824440
232	288	283	0102000020E61000000200000097FE25A94C853740CE6F9868908244400403081F4A843740AFB48CD47B7E4440
233	289	283	0102000020E61000000200000097FE25A94C853740CE6F986890824440D40D1478278F37403C889D2974804440
234	287	285	0102000020E610000002000000251FBB0B946C3740F3599E07778744409B02999D456F37406F4562821A824440
235	287	286	0102000020E610000002000000BF620D17B97B37408C69A67B9D8244409B02999D456F37406F4562821A824440
236	290	287	0102000020E6100000020000009B02999D456F37406F4562821A824440DDB1D8261575374064062AE3DF814440
237	290	288	0102000020E6100000020000000403081F4A843740AFB48CD47B7E4440DDB1D8261575374064062AE3DF814440
238	289	288	0102000020E6100000020000000403081F4A843740AFB48CD47B7E4440D40D1478278F37403C889D2974804440
\.


--
-- Data for Name: main_node; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_node (id, name, location) FROM stdin;
281	Serres	0101000020E6100000DC9C4A06808A374040C23060C98B4440
282	Provatas	0101000020E61000004B0169FF03643740172CD505BC884440
283	Skoutari	0101000020E610000097FE25A94C853740CE6F986890824440
284	K. Mitrousi	0101000020E61000000762D9CC21753740F37684D382874440
285	A. Kamila	0101000020E6100000251FBB0B946C3740F3599E0777874440
286	K. Kamila	0101000020E6100000BF620D17B97B37408C69A67B9D824440
287	Koumaria	0101000020E61000009B02999D456F37406F4562821A824440
288	Peponia	0101000020E61000000403081F4A843740AFB48CD47B7E4440
289	Ag. Eleni	0101000020E6100000D40D1478278F37403C889D2974804440
290	Adelfiko	0101000020E6100000DDB1D8261575374064062AE3DF814440
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 24, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 145, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 15, true);


--
-- Name: main_edge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_edge_id_seq', 238, true);


--
-- Name: main_node_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_node_id_seq', 290, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: main_edge main_edge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_edge
    ADD CONSTRAINT main_edge_pkey PRIMARY KEY (id);


--
-- Name: main_node main_node_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_node
    ADD CONSTRAINT main_node_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: main_edge_destination_id_5cdf4b3f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_edge_destination_id_5cdf4b3f ON public.main_edge USING btree (destination_id);


--
-- Name: main_edge_line_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_edge_line_id ON public.main_edge USING gist (line);


--
-- Name: main_edge_origin_id_155fa912; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_edge_origin_id_155fa912 ON public.main_edge USING btree (origin_id);


--
-- Name: main_node_location_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_node_location_id ON public.main_node USING gist (location);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_edge main_edge_destination_id_5cdf4b3f_fk_main_node_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_edge
    ADD CONSTRAINT main_edge_destination_id_5cdf4b3f_fk_main_node_id FOREIGN KEY (destination_id) REFERENCES public.main_node(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_edge main_edge_origin_id_155fa912_fk_main_node_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_edge
    ADD CONSTRAINT main_edge_origin_id_155fa912_fk_main_node_id FOREIGN KEY (origin_id) REFERENCES public.main_node(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

