--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.8
-- Dumped by pg_dump version 9.1.8
-- Started on 2013-02-19 22:46:57 BRT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 171 (class 3079 OID 11685)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1959 (class 0 OID 0)
-- Dependencies: 171
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 170 (class 1259 OID 16534)
-- Dependencies: 1923 1924 1925 1926 1927 1928 1929 1930 1931 5
-- Name: tbl_pages; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tbl_pages (
    id integer NOT NULL,
    title character varying(50) DEFAULT NULL::character varying,
    controller character varying(50) DEFAULT NULL::character varying,
    view character varying(50) DEFAULT ''::character varying,
    url character varying(50) DEFAULT NULL::character varying,
    menu character varying(50) DEFAULT NULL::character varying,
    module character varying(50) DEFAULT NULL::character varying,
    "order" integer,
    require_login integer DEFAULT 0,
    group_id integer DEFAULT 0,
    parent_id integer,
    active integer DEFAULT 1
);


ALTER TABLE public.tbl_pages OWNER TO postgres;

--
-- TOC entry 169 (class 1259 OID 16532)
-- Dependencies: 5 170
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_id_seq OWNER TO postgres;

--
-- TOC entry 1960 (class 0 OID 0)
-- Dependencies: 169
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pages_id_seq OWNED BY tbl_pages.id;


--
-- TOC entry 162 (class 1259 OID 16496)
-- Dependencies: 5
-- Name: tbl_acl; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tbl_acl (
    id integer NOT NULL,
    type character varying(4) NOT NULL,
    type_id integer NOT NULL,
    resource_id integer NOT NULL,
    action character varying(5) NOT NULL
);


ALTER TABLE public.tbl_acl OWNER TO postgres;

--
-- TOC entry 1961 (class 0 OID 0)
-- Dependencies: 162
-- Name: COLUMN tbl_acl.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tbl_acl.type IS 'role ou user';


--
-- TOC entry 1962 (class 0 OID 0)
-- Dependencies: 162
-- Name: COLUMN tbl_acl.action; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tbl_acl.action IS 'allow ou deny';


--
-- TOC entry 161 (class 1259 OID 16494)
-- Dependencies: 162 5
-- Name: tbl_acl_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tbl_acl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_acl_id_seq OWNER TO postgres;

--
-- TOC entry 1963 (class 0 OID 0)
-- Dependencies: 161
-- Name: tbl_acl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tbl_acl_id_seq OWNED BY tbl_acl.id;


--
-- TOC entry 164 (class 1259 OID 16504)
-- Dependencies: 5
-- Name: tbl_aclresources; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tbl_aclresources (
    id integer NOT NULL,
    resource character varying(255) NOT NULL,
    description text NOT NULL,
    aclgroup character varying(255) NOT NULL,
    aclgrouporder integer NOT NULL,
    default_value smallint NOT NULL
);


ALTER TABLE public.tbl_aclresources OWNER TO postgres;

--
-- TOC entry 1964 (class 0 OID 0)
-- Dependencies: 164
-- Name: COLUMN tbl_aclresources.default_value; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tbl_aclresources.default_value IS '1 para true ou 0 para false';


--
-- TOC entry 163 (class 1259 OID 16502)
-- Dependencies: 5 164
-- Name: tbl_aclresources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tbl_aclresources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_aclresources_id_seq OWNER TO postgres;

--
-- TOC entry 1965 (class 0 OID 0)
-- Dependencies: 163
-- Name: tbl_aclresources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tbl_aclresources_id_seq OWNED BY tbl_aclresources.id;


--
-- TOC entry 166 (class 1259 OID 16515)
-- Dependencies: 5
-- Name: tbl_aclroles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tbl_aclroles (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    roleorder integer NOT NULL
);


ALTER TABLE public.tbl_aclroles OWNER TO postgres;

--
-- TOC entry 165 (class 1259 OID 16513)
-- Dependencies: 166 5
-- Name: tbl_aclroles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tbl_aclroles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_aclroles_id_seq OWNER TO postgres;

--
-- TOC entry 1966 (class 0 OID 0)
-- Dependencies: 165
-- Name: tbl_aclroles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tbl_aclroles_id_seq OWNED BY tbl_aclroles.id;


--
-- TOC entry 168 (class 1259 OID 16523)
-- Dependencies: 5
-- Name: tbl_users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tbl_users (
    id integer NOT NULL,
    username character varying(128),
    password character varying(60),
    firstname character varying(128),
    prefix character varying(20),
    lastname character varying(500),
    gender character(1),
    roleid integer,
    mail character varying(256)
);


ALTER TABLE public.tbl_users OWNER TO postgres;

--
-- TOC entry 1967 (class 0 OID 0)
-- Dependencies: 168
-- Name: COLUMN tbl_users.gender; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tbl_users.gender IS 'M ou F';


--
-- TOC entry 167 (class 1259 OID 16521)
-- Dependencies: 5 168
-- Name: tbl_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tbl_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_users_id_seq OWNER TO postgres;

--
-- TOC entry 1968 (class 0 OID 0)
-- Dependencies: 167
-- Name: tbl_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tbl_users_id_seq OWNED BY tbl_users.id;


--
-- TOC entry 1918 (class 2604 OID 16499)
-- Dependencies: 162 161 162
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbl_acl ALTER COLUMN id SET DEFAULT nextval('tbl_acl_id_seq'::regclass);


--
-- TOC entry 1919 (class 2604 OID 16507)
-- Dependencies: 163 164 164
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbl_aclresources ALTER COLUMN id SET DEFAULT nextval('tbl_aclresources_id_seq'::regclass);


--
-- TOC entry 1920 (class 2604 OID 16518)
-- Dependencies: 165 166 166
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbl_aclroles ALTER COLUMN id SET DEFAULT nextval('tbl_aclroles_id_seq'::regclass);


--
-- TOC entry 1922 (class 2604 OID 16537)
-- Dependencies: 170 169 170
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbl_pages ALTER COLUMN id SET DEFAULT nextval('pages_id_seq'::regclass);


--
-- TOC entry 1921 (class 2604 OID 16526)
-- Dependencies: 168 167 168
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbl_users ALTER COLUMN id SET DEFAULT nextval('tbl_users_id_seq'::regclass);


--
-- TOC entry 1969 (class 0 OID 0)
-- Dependencies: 169
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pages_id_seq', 1, false);


--
-- TOC entry 1943 (class 0 OID 16496)
-- Dependencies: 162 1952
-- Data for Name: tbl_acl; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tbl_acl (id, type, type_id, resource_id, action) VALUES (1, 'role', 1, 1, 'allow');
INSERT INTO tbl_acl (id, type, type_id, resource_id, action) VALUES (2, 'role', 1, 2, 'allow');
INSERT INTO tbl_acl (id, type, type_id, resource_id, action) VALUES (3, 'role', 1, 3, 'allow');


--
-- TOC entry 1970 (class 0 OID 0)
-- Dependencies: 161
-- Name: tbl_acl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tbl_acl_id_seq', 1, false);


--
-- TOC entry 1945 (class 0 OID 16504)
-- Dependencies: 164 1952
-- Data for Name: tbl_aclresources; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tbl_aclresources (id, resource, description, aclgroup, aclgrouporder, default_value) VALUES (1, 'user_management', '', 'user', 0, 0);
INSERT INTO tbl_aclresources (id, resource, description, aclgroup, aclgrouporder, default_value) VALUES (2, 'relation_manager', '', 'relations', 0, 0);


--
-- TOC entry 1971 (class 0 OID 0)
-- Dependencies: 163
-- Name: tbl_aclresources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tbl_aclresources_id_seq', 1, false);


--
-- TOC entry 1947 (class 0 OID 16515)
-- Dependencies: 166 1952
-- Data for Name: tbl_aclroles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tbl_aclroles (id, name, roleorder) VALUES (1, 'Admin', 1);
INSERT INTO tbl_aclroles (id, name, roleorder) VALUES (2, 'User', 2);
INSERT INTO tbl_aclroles (id, name, roleorder) VALUES (3, 'Guest', 3);


--
-- TOC entry 1972 (class 0 OID 0)
-- Dependencies: 165
-- Name: tbl_aclroles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tbl_aclroles_id_seq', 1, false);


--
-- TOC entry 1951 (class 0 OID 16534)
-- Dependencies: 170 1952
-- Data for Name: tbl_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tbl_pages (id, title, controller, view, url, menu, module, "order", require_login, group_id, parent_id, active) VALUES (1, 'Home', 'welcome', '', NULL, 'main', '', 1, 0, 0, NULL, 1);
INSERT INTO tbl_pages (id, title, controller, view, url, menu, module, "order", require_login, group_id, parent_id, active) VALUES (9, 'Home', 'welcome', '', NULL, 'bottom', '', 0, 1, 0, NULL, 1);
INSERT INTO tbl_pages (id, title, controller, view, url, menu, module, "order", require_login, group_id, parent_id, active) VALUES (2, 'Usuários', 'users', '', NULL, 'main', 'admin', 1, 1, 0, NULL, 1);
INSERT INTO tbl_pages (id, title, controller, view, url, menu, module, "order", require_login, group_id, parent_id, active) VALUES (16, 'Painel de controles do admin', 'auth', '', NULL, NULL, '', NULL, 0, 1, NULL, 1);


--
-- TOC entry 1949 (class 0 OID 16523)
-- Dependencies: 168 1952
-- Data for Name: tbl_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tbl_users (id, username, password, firstname, prefix, lastname, gender, roleid, mail) VALUES (51618, 'brito', 'c33367701511b4f6020ec61ded352059', 'Guilherme', '', 'Brito', 'M', 1, 'brito.gui@gmail.com');


--
-- TOC entry 1973 (class 0 OID 0)
-- Dependencies: 167
-- Name: tbl_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tbl_users_id_seq', 1, false);


--
-- TOC entry 1941 (class 2606 OID 16548)
-- Dependencies: 170 170 1953
-- Name: pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tbl_pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- TOC entry 1933 (class 2606 OID 16501)
-- Dependencies: 162 162 1953
-- Name: tbl_acl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tbl_acl
    ADD CONSTRAINT tbl_acl_pkey PRIMARY KEY (id);


--
-- TOC entry 1935 (class 2606 OID 16512)
-- Dependencies: 164 164 1953
-- Name: tbl_aclresources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tbl_aclresources
    ADD CONSTRAINT tbl_aclresources_pkey PRIMARY KEY (id);


--
-- TOC entry 1937 (class 2606 OID 16520)
-- Dependencies: 166 166 1953
-- Name: tbl_aclroles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tbl_aclroles
    ADD CONSTRAINT tbl_aclroles_pkey PRIMARY KEY (id);


--
-- TOC entry 1939 (class 2606 OID 16531)
-- Dependencies: 168 168 1953
-- Name: tbl_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tbl_users
    ADD CONSTRAINT tbl_users_pkey PRIMARY KEY (id);


--
-- TOC entry 1958 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-02-19 22:46:57 BRT

--
-- PostgreSQL database dump complete
--

