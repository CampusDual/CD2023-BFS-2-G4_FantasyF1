--
-- PostgreSQL database dump
--

-- Dumped from database version 11.16 (Debian 11.16-0+deb10u1)
-- Dumped by pg_dump version 14.2

-- Started on 2023-11-29 15:10:34

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

DROP DATABASE "2023_BFS_2_G4";
--
-- TOC entry 3117 (class 1262 OID 290895)
-- Name: 2023_BFS_2_G4; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE "2023_BFS_2_G4" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


\connect "2023_BFS_2_G4"

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 3118 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

--
-- TOC entry 214 (class 1259 OID 291988)
-- Name: competitions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.competitions (
    comp_id integer NOT NULL,
    comp_name character varying(255) NOT NULL,
    comp_description character varying(500),
    comp_ispublic boolean NOT NULL,
    comp_code character varying(500)
);


--
-- TOC entry 213 (class 1259 OID 291986)
-- Name: competitions_comp_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.competitions_comp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3119 (class 0 OID 0)
-- Dependencies: 213
-- Name: competitions_comp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.competitions_comp_id_seq OWNED BY public.competitions.comp_id;


--
-- TOC entry 216 (class 1259 OID 292180)
-- Name: pilots; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pilots (
    pil_id integer NOT NULL,
    pil_name character varying(50) NOT NULL,
    pil_surname character varying(100) NOT NULL,
    pil_price integer DEFAULT 0 NOT NULL,
    pil_nationality character varying(100) NOT NULL,
    pil_driver_id character varying(50) NOT NULL,
    pil_number integer NOT NULL,
    pil_birthday date NOT NULL,
    pil_url character varying(100) NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 292178)
-- Name: pilots_pil_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pilots_pil_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3120 (class 0 OID 0)
-- Dependencies: 215
-- Name: pilots_pil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pilots_pil_id_seq OWNED BY public.pilots.pil_id;


--
-- TOC entry 230 (class 1259 OID 295740)
-- Name: pilots_prices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pilots_prices (
    pp_id integer NOT NULL,
    pp_former_price integer,
    pp_new_price integer NOT NULL,
    pil_id integer NOT NULL,
    rac_id integer
);


--
-- TOC entry 229 (class 1259 OID 295738)
-- Name: pilots_prices_pp_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pilots_prices_pp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3121 (class 0 OID 0)
-- Dependencies: 229
-- Name: pilots_prices_pp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pilots_prices_pp_id_seq OWNED BY public.pilots_prices.pp_id;


--
-- TOC entry 222 (class 1259 OID 294294)
-- Name: races; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.races (
    rac_id integer NOT NULL,
    rac_name character varying(100) NOT NULL,
    rac_circuit_name character varying(100) NOT NULL,
    rac_circuit_id character varying(50) NOT NULL,
    rac_round integer NOT NULL,
    rac_date date,
    rac_url character varying(100) NOT NULL,
    rac_locality character varying(100),
    rac_country character varying(100)
);


--
-- TOC entry 228 (class 1259 OID 295010)
-- Name: races_points; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.races_points (
    rp_id integer NOT NULL,
    rp_points integer NOT NULL,
    ucp_id integer NOT NULL,
    res_id integer NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 295008)
-- Name: races_points_rp_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.races_points_rp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3122 (class 0 OID 0)
-- Dependencies: 227
-- Name: races_points_rp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.races_points_rp_id_seq OWNED BY public.races_points.rp_id;


--
-- TOC entry 221 (class 1259 OID 294292)
-- Name: races_rac_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.races_rac_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3123 (class 0 OID 0)
-- Dependencies: 221
-- Name: races_rac_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.races_rac_id_seq OWNED BY public.races.rac_id;


--
-- TOC entry 226 (class 1259 OID 294429)
-- Name: results; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.results (
    res_id integer NOT NULL,
    pil_id integer NOT NULL,
    rac_id integer NOT NULL,
    res_points integer NOT NULL,
    res_position integer NOT NULL,
    res_position_text character varying(10) NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 294427)
-- Name: results_res_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.results_res_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3124 (class 0 OID 0)
-- Dependencies: 225
-- Name: results_res_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.results_res_id_seq OWNED BY public.results.res_id;


--
-- TOC entry 218 (class 1259 OID 292188)
-- Name: teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    team_name character varying(50),
    team_price integer
);


--
-- TOC entry 217 (class 1259 OID 292186)
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3125 (class 0 OID 0)
-- Dependencies: 217
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- TOC entry 212 (class 1259 OID 291283)
-- Name: ti18n; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ti18n (
    id_i18n integer NOT NULL,
    class_name character varying(150),
    i18n_description character varying(250)
);


--
-- TOC entry 211 (class 1259 OID 291281)
-- Name: ti18n_id_i18n_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ti18n_id_i18n_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3126 (class 0 OID 0)
-- Dependencies: 211
-- Name: ti18n_id_i18n_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ti18n_id_i18n_seq OWNED BY public.ti18n.id_i18n;


--
-- TOC entry 210 (class 1259 OID 291272)
-- Name: ti18n_value; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ti18n_value (
    id_i18n_value integer NOT NULL,
    id_i18n integer NOT NULL,
    "KEY" character varying(250),
    es_es character varying(10485760),
    en_us character varying(10485760),
    gl_es character varying(10485760)
);


--
-- TOC entry 209 (class 1259 OID 291270)
-- Name: ti18n_value_id_i18n_value_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ti18n_value_id_i18n_value_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3127 (class 0 OID 0)
-- Dependencies: 209
-- Name: ti18n_value_id_i18n_value_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ti18n_value_id_i18n_value_seq OWNED BY public.ti18n_value.id_i18n_value;


--
-- TOC entry 198 (class 1259 OID 291152)
-- Name: trole; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trole (
    id_rolename integer NOT NULL,
    rolename character varying(255),
    xmlclientpermission character varying(10485760)
);


--
-- TOC entry 197 (class 1259 OID 291150)
-- Name: trole_id_rolename_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trole_id_rolename_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3128 (class 0 OID 0)
-- Dependencies: 197
-- Name: trole_id_rolename_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trole_id_rolename_seq OWNED BY public.trole.id_rolename;


--
-- TOC entry 204 (class 1259 OID 291192)
-- Name: trole_server_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trole_server_permission (
    id_role_server_permission integer NOT NULL,
    id_rolename integer,
    id_server_permission integer
);


--
-- TOC entry 203 (class 1259 OID 291190)
-- Name: trole_server_permission_id_role_server_permission_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trole_server_permission_id_role_server_permission_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3129 (class 0 OID 0)
-- Dependencies: 203
-- Name: trole_server_permission_id_role_server_permission_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trole_server_permission_id_role_server_permission_seq OWNED BY public.trole_server_permission.id_role_server_permission;


--
-- TOC entry 202 (class 1259 OID 291181)
-- Name: tserver_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tserver_permission (
    id_server_permission integer NOT NULL,
    permission_name character varying(10485760)
);


--
-- TOC entry 201 (class 1259 OID 291179)
-- Name: tserver_permission_id_server_permission_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tserver_permission_id_server_permission_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3130 (class 0 OID 0)
-- Dependencies: 201
-- Name: tserver_permission_id_server_permission_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tserver_permission_id_server_permission_seq OWNED BY public.tserver_permission.id_server_permission;


--
-- TOC entry 206 (class 1259 OID 291220)
-- Name: tsetting; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tsetting (
    id_setting integer NOT NULL,
    setting_key character varying(10485760),
    setting_value character varying(10485760),
    setting_comment character varying(10485760)
);


--
-- TOC entry 205 (class 1259 OID 291218)
-- Name: tsetting_id_setting_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tsetting_id_setting_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3131 (class 0 OID 0)
-- Dependencies: 205
-- Name: tsetting_id_setting_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tsetting_id_setting_seq OWNED BY public.tsetting.id_setting;


--
-- TOC entry 196 (class 1259 OID 291140)
-- Name: tuser; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tuser (
    user_ character varying(50) NOT NULL,
    password character varying(255),
    name character varying(50),
    surname character varying(50),
    email character varying(50),
    nif character varying(50),
    userblocked timestamp without time zone,
    lastpasswordupdate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    firstlogin boolean DEFAULT true
);


--
-- TOC entry 208 (class 1259 OID 291243)
-- Name: tuser_preference; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tuser_preference (
    id_user_preference integer NOT NULL,
    preference_name character varying(150),
    user_login character varying(150),
    preference_value character varying(10485760)
);


--
-- TOC entry 207 (class 1259 OID 291241)
-- Name: tuser_preference_id_user_preference_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tuser_preference_id_user_preference_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3132 (class 0 OID 0)
-- Dependencies: 207
-- Name: tuser_preference_id_user_preference_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tuser_preference_id_user_preference_seq OWNED BY public.tuser_preference.id_user_preference;


--
-- TOC entry 200 (class 1259 OID 291163)
-- Name: tuser_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tuser_role (
    id_user_role integer NOT NULL,
    id_rolename integer,
    user_ character varying(50)
);


--
-- TOC entry 199 (class 1259 OID 291161)
-- Name: tuser_role_id_user_role_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tuser_role_id_user_role_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 199
-- Name: tuser_role_id_user_role_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tuser_role_id_user_role_seq OWNED BY public.tuser_role.id_user_role;


--
-- TOC entry 220 (class 1259 OID 292384)
-- Name: users_competitions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users_competitions (
    uc_id integer NOT NULL,
    comp_id integer NOT NULL,
    user_ character varying(50) NOT NULL,
    uc_available_money integer DEFAULT 150000.00 NOT NULL,
    team_id integer,
    CONSTRAINT ck_available_money_min CHECK (((uc_available_money)::numeric >= (0)::numeric))
);


--
-- TOC entry 219 (class 1259 OID 292382)
-- Name: user_competition_uc_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_competition_uc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3134 (class 0 OID 0)
-- Dependencies: 219
-- Name: user_competition_uc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_competition_uc_id_seq OWNED BY public.users_competitions.uc_id;


--
-- TOC entry 224 (class 1259 OID 294371)
-- Name: users_competitions_pilots; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users_competitions_pilots (
    ucp_id integer NOT NULL,
    uc_id integer NOT NULL,
    pil_id integer NOT NULL,
    ucp_date_purchased date NOT NULL,
    ucp_date_sold date,
    ucp_price_purchased integer NOT NULL,
    ucp_price_sold integer
);


--
-- TOC entry 223 (class 1259 OID 294369)
-- Name: users_competitions_pilots_ucp_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_competitions_pilots_ucp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3135 (class 0 OID 0)
-- Dependencies: 223
-- Name: users_competitions_pilots_ucp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_competitions_pilots_ucp_id_seq OWNED BY public.users_competitions_pilots.ucp_id;


--
-- TOC entry 2893 (class 2604 OID 291991)
-- Name: competitions comp_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.competitions ALTER COLUMN comp_id SET DEFAULT nextval('public.competitions_comp_id_seq'::regclass);


--
-- TOC entry 2894 (class 2604 OID 292183)
-- Name: pilots pil_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pilots ALTER COLUMN pil_id SET DEFAULT nextval('public.pilots_pil_id_seq'::regclass);


--
-- TOC entry 2904 (class 2604 OID 295743)
-- Name: pilots_prices pp_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pilots_prices ALTER COLUMN pp_id SET DEFAULT nextval('public.pilots_prices_pp_id_seq'::regclass);


--
-- TOC entry 2900 (class 2604 OID 294297)
-- Name: races rac_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.races ALTER COLUMN rac_id SET DEFAULT nextval('public.races_rac_id_seq'::regclass);


--
-- TOC entry 2903 (class 2604 OID 295013)
-- Name: races_points rp_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.races_points ALTER COLUMN rp_id SET DEFAULT nextval('public.races_points_rp_id_seq'::regclass);


--
-- TOC entry 2902 (class 2604 OID 294432)
-- Name: results res_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.results ALTER COLUMN res_id SET DEFAULT nextval('public.results_res_id_seq'::regclass);


--
-- TOC entry 2896 (class 2604 OID 292191)
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- TOC entry 2892 (class 2604 OID 291286)
-- Name: ti18n id_i18n; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ti18n ALTER COLUMN id_i18n SET DEFAULT nextval('public.ti18n_id_i18n_seq'::regclass);


--
-- TOC entry 2891 (class 2604 OID 291275)
-- Name: ti18n_value id_i18n_value; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ti18n_value ALTER COLUMN id_i18n_value SET DEFAULT nextval('public.ti18n_value_id_i18n_value_seq'::regclass);


--
-- TOC entry 2885 (class 2604 OID 291155)
-- Name: trole id_rolename; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole ALTER COLUMN id_rolename SET DEFAULT nextval('public.trole_id_rolename_seq'::regclass);


--
-- TOC entry 2888 (class 2604 OID 291195)
-- Name: trole_server_permission id_role_server_permission; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole_server_permission ALTER COLUMN id_role_server_permission SET DEFAULT nextval('public.trole_server_permission_id_role_server_permission_seq'::regclass);


--
-- TOC entry 2887 (class 2604 OID 291184)
-- Name: tserver_permission id_server_permission; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tserver_permission ALTER COLUMN id_server_permission SET DEFAULT nextval('public.tserver_permission_id_server_permission_seq'::regclass);


--
-- TOC entry 2889 (class 2604 OID 291223)
-- Name: tsetting id_setting; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tsetting ALTER COLUMN id_setting SET DEFAULT nextval('public.tsetting_id_setting_seq'::regclass);


--
-- TOC entry 2890 (class 2604 OID 291246)
-- Name: tuser_preference id_user_preference; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_preference ALTER COLUMN id_user_preference SET DEFAULT nextval('public.tuser_preference_id_user_preference_seq'::regclass);


--
-- TOC entry 2886 (class 2604 OID 291166)
-- Name: tuser_role id_user_role; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_role ALTER COLUMN id_user_role SET DEFAULT nextval('public.tuser_role_id_user_role_seq'::regclass);


--
-- TOC entry 2897 (class 2604 OID 292387)
-- Name: users_competitions uc_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_competitions ALTER COLUMN uc_id SET DEFAULT nextval('public.user_competition_uc_id_seq'::regclass);


--
-- TOC entry 2901 (class 2604 OID 294374)
-- Name: users_competitions_pilots ucp_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_competitions_pilots ALTER COLUMN ucp_id SET DEFAULT nextval('public.users_competitions_pilots_ucp_id_seq'::regclass);


--
-- TOC entry 3095 (class 0 OID 291988)
-- Dependencies: 214
-- Data for Name: competitions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.competitions VALUES (1, 'Os vacalouras', 'A canto está o rapante?', true, '');
INSERT INTO public.competitions VALUES (2, 'Karting Sanxenxo', 'From Sanxenxo to Shakira', true, '');
INSERT INTO public.competitions VALUES (3, 'Las Vegas GP', 'El nano gana la 33 en Las Vegas', true, '');
INSERT INTO public.competitions VALUES (4, 'Competi de Asunción', 'La mejor competición del estado.', true, '');
INSERT INTO public.competitions VALUES (8, 'O Freixo', 'Quen gañe cena gratis! ', false, '12122447116102023le');
INSERT INTO public.competitions VALUES (11, 'Competi Monca', 'Dias de formula 1', true, '');
INSERT INTO public.competitions VALUES (16, 'Formula1', 'Competición para los amantes de este deporte.', false, '83049684822102023lula');
INSERT INTO public.competitions VALUES (17, 'Competición Blanco', 'Competición de Os louros', true, '');
INSERT INTO public.competitions VALUES (5, 'Vamos 33', 'Verstappen deja alguna carrera para los demas', false, '121112672816102023lula');
INSERT INTO public.competitions VALUES (15, 'FRONT 2023', 'Hola compis', false, '125430442521102023ALBA');
INSERT INTO public.competitions VALUES (14, 'El barrio 2023', 'La competi del mejor barrio del mundo!', true, '');
INSERT INTO public.competitions VALUES (9, 'Late but not last', 'No seremos los mejores pero al menos no somos los últimos!', true, '');
INSERT INTO public.competitions VALUES (10, 'Hamilton Haters', 'Vamos Fernando!!!', true, '');
INSERT INTO public.competitions VALUES (12, 'Los del Bootcamp', 'Hola mundo', true, '');
INSERT INTO public.competitions VALUES (7, 'Nonina', 'Venga béticos, uníos!!!', true, '');
INSERT INTO public.competitions VALUES (18, 'Competi Romulanos', 'Competicion para la gente de Cáceres.', true, '');
INSERT INTO public.competitions VALUES (13, 'Susana team', 'A ver si en esta le ganamos a Pepe!!', true, '');
INSERT INTO public.competitions VALUES (6, 'Desafío binario', 'Ya sabéis las normas: el que pierda paga los cafés!', false, '121153319316102023nani');
INSERT INTO public.competitions VALUES (25, 'Carrera al Debugging Supremo', 'La batalla por la supremacía en el debuggeo ha comenzado.', true, '');


--
-- TOC entry 3097 (class 0 OID 292180)
-- Dependencies: 216
-- Data for Name: pilots; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.pilots VALUES (21, 'Max', 'Verstappen', 130000, 'Dutch', 'max_verstappen', 33, '1997-09-30', 'http://en.wikipedia.org/wiki/Max_Verstappen');
INSERT INTO public.pilots VALUES (9, 'Charles', 'Leclerc', 100000, 'Monegasque', 'leclerc', 16, '1997-10-16', 'http://en.wikipedia.org/wiki/Charles_Leclerc');
INSERT INTO public.pilots VALUES (8, 'Liam', 'Lawson', 20000, 'New Zealander', 'lawson', 15, '2002-02-11', 'http://en.wikipedia.org/wiki/Liam_Lawson');
INSERT INTO public.pilots VALUES (13, 'Sergio', 'Pérez', 90000, 'Mexican', 'perez', 11, '1990-01-26', 'http://en.wikipedia.org/wiki/Sergio_P%C3%A9rez');
INSERT INTO public.pilots VALUES (12, 'Esteban', 'Ocon', 90000, 'French', 'ocon', 31, '1996-09-17', 'http://en.wikipedia.org/wiki/Esteban_Ocon');
INSERT INTO public.pilots VALUES (19, 'Lance', 'Stroll', 80000, 'Canadian', 'stroll', 18, '1998-10-29', 'http://en.wikipedia.org/wiki/Lance_Stroll');
INSERT INTO public.pilots VALUES (17, 'Carlos', 'Sainz', 80000, 'Spanish', 'sainz', 55, '1994-09-01', 'http://en.wikipedia.org/wiki/Carlos_Sainz_Jr.');
INSERT INTO public.pilots VALUES (6, 'Lewis', 'Hamilton', 70000, 'British', 'hamilton', 44, '1985-01-07', 'http://en.wikipedia.org/wiki/Lewis_Hamilton');
INSERT INTO public.pilots VALUES (16, 'George', 'Russell', 70000, 'British', 'russell', 63, '1998-02-15', 'http://en.wikipedia.org/wiki/George_Russell_(racing_driver)');
INSERT INTO public.pilots VALUES (2, 'Fernando', 'Alonso', 60000, 'Spanish', 'alonso', 14, '1981-07-29', 'http://en.wikipedia.org/wiki/Fernando_Alonso');
INSERT INTO public.pilots VALUES (14, 'Oscar', 'Piastri', 60000, 'Australian', 'piastri', 81, '2001-04-06', 'http://en.wikipedia.org/wiki/Oscar_Piastri');
INSERT INTO public.pilots VALUES (5, 'Pierre', 'Gasly', 50000, 'French', 'gasly', 10, '1996-02-07', 'http://en.wikipedia.org/wiki/Pierre_Gasly');
INSERT INTO public.pilots VALUES (1, 'Alexander', 'Albon', 50000, 'Thai', 'albon', 23, '1996-03-23', 'http://en.wikipedia.org/wiki/Alexander_Albon');
INSERT INTO public.pilots VALUES (10, 'Kevin', 'Magnussen', 40000, 'Danish', 'kevin_magnussen', 20, '1992-10-05', 'http://en.wikipedia.org/wiki/Kevin_Magnussen');
INSERT INTO public.pilots VALUES (15, 'Daniel', 'Ricciardo', 40000, 'Australian', 'ricciardo', 3, '1989-07-01', 'http://en.wikipedia.org/wiki/Daniel_Ricciardo');
INSERT INTO public.pilots VALUES (22, 'Guanyu', 'Zhou', 30000, 'Chinese', 'zhou', 24, '1999-05-30', 'http://en.wikipedia.org/wiki/Zhou_Guanyu');
INSERT INTO public.pilots VALUES (18, 'Logan', 'Sargeant', 30000, 'American', 'sargeant', 2, '2000-12-31', 'http://en.wikipedia.org/wiki/Logan_Sargeant');
INSERT INTO public.pilots VALUES (3, 'Valtteri', 'Bottas', 20000, 'Finnish', 'bottas', 77, '1989-08-28', 'http://en.wikipedia.org/wiki/Valtteri_Bottas');
INSERT INTO public.pilots VALUES (20, 'Yuki', 'Tsunoda', 20000, 'Japanese', 'tsunoda', 22, '2000-05-11', 'http://en.wikipedia.org/wiki/Yuki_Tsunoda');
INSERT INTO public.pilots VALUES (7, 'Nico', 'Hülkenberg', 10000, 'German', 'hulkenberg', 27, '1987-08-19', 'http://en.wikipedia.org/wiki/Nico_H%C3%BClkenberg');
INSERT INTO public.pilots VALUES (11, 'Lando', 'Norris', 10000, 'British', 'norris', 4, '1999-11-13', 'http://en.wikipedia.org/wiki/Lando_Norris');
INSERT INTO public.pilots VALUES (4, 'Nyck', 'de Vries', 20000, 'Dutch', 'de_vries', 21, '1995-02-06', 'http://en.wikipedia.org/wiki/Nyck_de_Vries');


--
-- TOC entry 3111 (class 0 OID 295740)
-- Dependencies: 230
-- Data for Name: pilots_prices; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.pilots_prices VALUES (1, 10000, 10000, 1, NULL);
INSERT INTO public.pilots_prices VALUES (2, 40000, 40000, 2, NULL);
INSERT INTO public.pilots_prices VALUES (3, 50000, 50000, 3, NULL);
INSERT INTO public.pilots_prices VALUES (4, 20000, 20000, 4, NULL);
INSERT INTO public.pilots_prices VALUES (5, 70000, 70000, 5, NULL);
INSERT INTO public.pilots_prices VALUES (6, 80000, 80000, 6, NULL);
INSERT INTO public.pilots_prices VALUES (7, 30000, 30000, 7, NULL);
INSERT INTO public.pilots_prices VALUES (8, 10000, 10000, 8, NULL);
INSERT INTO public.pilots_prices VALUES (9, 90000, 90000, 9, NULL);
INSERT INTO public.pilots_prices VALUES (10, 30000, 30000, 10, NULL);
INSERT INTO public.pilots_prices VALUES (11, 60000, 60000, 11, NULL);
INSERT INTO public.pilots_prices VALUES (12, 70000, 70000, 12, NULL);
INSERT INTO public.pilots_prices VALUES (13, 100000, 100000, 13, NULL);
INSERT INTO public.pilots_prices VALUES (14, 60000, 60000, 14, NULL);
INSERT INTO public.pilots_prices VALUES (15, 10000, 10000, 15, NULL);
INSERT INTO public.pilots_prices VALUES (16, 80000, 80000, 16, NULL);
INSERT INTO public.pilots_prices VALUES (17, 90000, 90000, 17, NULL);
INSERT INTO public.pilots_prices VALUES (18, 10000, 10000, 18, NULL);
INSERT INTO public.pilots_prices VALUES (19, 40000, 40000, 19, NULL);
INSERT INTO public.pilots_prices VALUES (20, 20000, 20000, 20, NULL);
INSERT INTO public.pilots_prices VALUES (21, 130000, 130000, 21, NULL);
INSERT INTO public.pilots_prices VALUES (22, 50000, 50000, 22, NULL);
INSERT INTO public.pilots_prices VALUES (23, 130000, 130000, 21, 1);
INSERT INTO public.pilots_prices VALUES (24, 100000, 100000, 13, 1);
INSERT INTO public.pilots_prices VALUES (25, 40000, 90000, 2, 1);
INSERT INTO public.pilots_prices VALUES (26, 90000, 90000, 17, 1);
INSERT INTO public.pilots_prices VALUES (27, 80000, 80000, 6, 1);
INSERT INTO public.pilots_prices VALUES (28, 40000, 80000, 19, 1);
INSERT INTO public.pilots_prices VALUES (29, 80000, 70000, 16, 1);
INSERT INTO public.pilots_prices VALUES (30, 50000, 70000, 3, 1);
INSERT INTO public.pilots_prices VALUES (31, 70000, 60000, 5, 1);
INSERT INTO public.pilots_prices VALUES (32, 10000, 60000, 1, 1);
INSERT INTO public.pilots_prices VALUES (33, 20000, 50000, 20, 1);
INSERT INTO public.pilots_prices VALUES (34, 10000, 50000, 18, 1);
INSERT INTO public.pilots_prices VALUES (35, 10000, 40000, 10, 1);
INSERT INTO public.pilots_prices VALUES (36, 50000, 40000, 4, 1);
INSERT INTO public.pilots_prices VALUES (37, 20000, 30000, 7, 1);
INSERT INTO public.pilots_prices VALUES (38, 50000, 30000, 22, 1);
INSERT INTO public.pilots_prices VALUES (39, 60000, 20000, 11, 1);
INSERT INTO public.pilots_prices VALUES (40, 90000, 20000, 12, 1);
INSERT INTO public.pilots_prices VALUES (41, 90000, 10000, 9, 1);
INSERT INTO public.pilots_prices VALUES (42, 60000, 10000, 14, 1);
INSERT INTO public.pilots_prices VALUES (43, 100000, 130000, 13, 2);
INSERT INTO public.pilots_prices VALUES (44, 130000, 100000, 21, 2);
INSERT INTO public.pilots_prices VALUES (45, 90000, 90000, 2, 2);
INSERT INTO public.pilots_prices VALUES (46, 70000, 90000, 16, 2);
INSERT INTO public.pilots_prices VALUES (47, 80000, 80000, 6, 2);
INSERT INTO public.pilots_prices VALUES (48, 90000, 80000, 17, 2);
INSERT INTO public.pilots_prices VALUES (49, 10000, 70000, 9, 2);
INSERT INTO public.pilots_prices VALUES (50, 20000, 70000, 12, 2);
INSERT INTO public.pilots_prices VALUES (51, 60000, 60000, 5, 2);
INSERT INTO public.pilots_prices VALUES (52, 40000, 60000, 10, 2);
INSERT INTO public.pilots_prices VALUES (53, 50000, 50000, 20, 2);
INSERT INTO public.pilots_prices VALUES (54, 30000, 50000, 7, 2);
INSERT INTO public.pilots_prices VALUES (55, 30000, 40000, 22, 2);
INSERT INTO public.pilots_prices VALUES (56, 40000, 40000, 4, 2);
INSERT INTO public.pilots_prices VALUES (57, 10000, 30000, 14, 2);
INSERT INTO public.pilots_prices VALUES (58, 50000, 30000, 18, 2);
INSERT INTO public.pilots_prices VALUES (59, 20000, 20000, 11, 2);
INSERT INTO public.pilots_prices VALUES (60, 70000, 20000, 3, 2);
INSERT INTO public.pilots_prices VALUES (61, 60000, 10000, 1, 2);
INSERT INTO public.pilots_prices VALUES (62, 80000, 10000, 19, 2);
INSERT INTO public.pilots_prices VALUES (63, 100000, 130000, 21, 3);
INSERT INTO public.pilots_prices VALUES (64, 80000, 100000, 6, 3);
INSERT INTO public.pilots_prices VALUES (65, 90000, 90000, 2, 3);
INSERT INTO public.pilots_prices VALUES (66, 10000, 90000, 19, 3);
INSERT INTO public.pilots_prices VALUES (67, 130000, 80000, 13, 3);
INSERT INTO public.pilots_prices VALUES (68, 20000, 80000, 11, 3);
INSERT INTO public.pilots_prices VALUES (69, 50000, 70000, 7, 3);
INSERT INTO public.pilots_prices VALUES (70, 30000, 70000, 14, 3);
INSERT INTO public.pilots_prices VALUES (71, 40000, 60000, 22, 3);
INSERT INTO public.pilots_prices VALUES (72, 50000, 60000, 20, 3);
INSERT INTO public.pilots_prices VALUES (73, 20000, 50000, 3, 3);
INSERT INTO public.pilots_prices VALUES (74, 80000, 50000, 17, 3);
INSERT INTO public.pilots_prices VALUES (75, 60000, 40000, 5, 3);
INSERT INTO public.pilots_prices VALUES (76, 70000, 40000, 12, 3);
INSERT INTO public.pilots_prices VALUES (77, 40000, 30000, 4, 3);
INSERT INTO public.pilots_prices VALUES (78, 30000, 30000, 18, 3);
INSERT INTO public.pilots_prices VALUES (79, 60000, 20000, 10, 3);
INSERT INTO public.pilots_prices VALUES (80, 90000, 20000, 16, 3);
INSERT INTO public.pilots_prices VALUES (81, 10000, 10000, 1, 3);
INSERT INTO public.pilots_prices VALUES (82, 70000, 10000, 9, 3);
INSERT INTO public.pilots_prices VALUES (83, 80000, 130000, 13, 4);
INSERT INTO public.pilots_prices VALUES (84, 130000, 100000, 21, 4);
INSERT INTO public.pilots_prices VALUES (85, 10000, 90000, 9, 4);
INSERT INTO public.pilots_prices VALUES (86, 90000, 90000, 2, 4);
INSERT INTO public.pilots_prices VALUES (87, 50000, 80000, 17, 4);
INSERT INTO public.pilots_prices VALUES (88, 100000, 80000, 6, 4);
INSERT INTO public.pilots_prices VALUES (89, 90000, 70000, 19, 4);
INSERT INTO public.pilots_prices VALUES (90, 20000, 70000, 16, 4);
INSERT INTO public.pilots_prices VALUES (91, 80000, 60000, 11, 4);
INSERT INTO public.pilots_prices VALUES (92, 60000, 60000, 20, 4);
INSERT INTO public.pilots_prices VALUES (93, 70000, 50000, 14, 4);
INSERT INTO public.pilots_prices VALUES (94, 10000, 50000, 1, 4);
INSERT INTO public.pilots_prices VALUES (95, 20000, 40000, 10, 4);
INSERT INTO public.pilots_prices VALUES (96, 40000, 40000, 5, 4);
INSERT INTO public.pilots_prices VALUES (97, 40000, 30000, 12, 4);
INSERT INTO public.pilots_prices VALUES (98, 30000, 30000, 18, 4);
INSERT INTO public.pilots_prices VALUES (99, 70000, 20000, 7, 4);
INSERT INTO public.pilots_prices VALUES (100, 50000, 20000, 3, 4);
INSERT INTO public.pilots_prices VALUES (101, 60000, 10000, 22, 4);
INSERT INTO public.pilots_prices VALUES (102, 30000, 10000, 4, 4);
INSERT INTO public.pilots_prices VALUES (103, 100000, 130000, 21, 5);
INSERT INTO public.pilots_prices VALUES (104, 130000, 100000, 13, 5);
INSERT INTO public.pilots_prices VALUES (105, 90000, 90000, 2, 5);
INSERT INTO public.pilots_prices VALUES (106, 70000, 90000, 16, 5);
INSERT INTO public.pilots_prices VALUES (107, 80000, 80000, 17, 5);
INSERT INTO public.pilots_prices VALUES (108, 80000, 80000, 6, 5);
INSERT INTO public.pilots_prices VALUES (109, 90000, 70000, 9, 5);
INSERT INTO public.pilots_prices VALUES (110, 40000, 70000, 5, 5);
INSERT INTO public.pilots_prices VALUES (111, 30000, 60000, 12, 5);
INSERT INTO public.pilots_prices VALUES (112, 40000, 60000, 10, 5);
INSERT INTO public.pilots_prices VALUES (113, 60000, 50000, 20, 5);
INSERT INTO public.pilots_prices VALUES (114, 70000, 50000, 19, 5);
INSERT INTO public.pilots_prices VALUES (115, 20000, 40000, 3, 5);
INSERT INTO public.pilots_prices VALUES (116, 50000, 40000, 1, 5);
INSERT INTO public.pilots_prices VALUES (117, 20000, 30000, 7, 5);
INSERT INTO public.pilots_prices VALUES (118, 10000, 30000, 22, 5);
INSERT INTO public.pilots_prices VALUES (119, 60000, 20000, 11, 5);
INSERT INTO public.pilots_prices VALUES (120, 10000, 20000, 4, 5);
INSERT INTO public.pilots_prices VALUES (121, 50000, 10000, 14, 5);
INSERT INTO public.pilots_prices VALUES (122, 30000, 10000, 18, 5);
INSERT INTO public.pilots_prices VALUES (123, 130000, 130000, 21, 6);
INSERT INTO public.pilots_prices VALUES (124, 90000, 100000, 2, 6);
INSERT INTO public.pilots_prices VALUES (125, 60000, 90000, 12, 6);
INSERT INTO public.pilots_prices VALUES (126, 80000, 90000, 6, 6);
INSERT INTO public.pilots_prices VALUES (127, 90000, 80000, 16, 6);
INSERT INTO public.pilots_prices VALUES (128, 70000, 80000, 9, 6);
INSERT INTO public.pilots_prices VALUES (129, 70000, 70000, 5, 6);
INSERT INTO public.pilots_prices VALUES (130, 80000, 70000, 17, 6);
INSERT INTO public.pilots_prices VALUES (131, 20000, 60000, 11, 6);
INSERT INTO public.pilots_prices VALUES (132, 10000, 60000, 14, 6);
INSERT INTO public.pilots_prices VALUES (133, 40000, 50000, 3, 6);
INSERT INTO public.pilots_prices VALUES (134, 20000, 50000, 4, 6);
INSERT INTO public.pilots_prices VALUES (135, 30000, 40000, 22, 6);
INSERT INTO public.pilots_prices VALUES (136, 40000, 40000, 1, 6);
INSERT INTO public.pilots_prices VALUES (137, 50000, 30000, 20, 6);
INSERT INTO public.pilots_prices VALUES (138, 100000, 30000, 13, 6);
INSERT INTO public.pilots_prices VALUES (139, 30000, 20000, 7, 6);
INSERT INTO public.pilots_prices VALUES (140, 10000, 20000, 18, 6);
INSERT INTO public.pilots_prices VALUES (141, 60000, 10000, 10, 6);
INSERT INTO public.pilots_prices VALUES (142, 50000, 10000, 19, 6);
INSERT INTO public.pilots_prices VALUES (143, 130000, 130000, 21, 7);
INSERT INTO public.pilots_prices VALUES (144, 90000, 100000, 6, 7);
INSERT INTO public.pilots_prices VALUES (145, 80000, 90000, 16, 7);
INSERT INTO public.pilots_prices VALUES (146, 30000, 90000, 13, 7);
INSERT INTO public.pilots_prices VALUES (147, 70000, 80000, 17, 7);
INSERT INTO public.pilots_prices VALUES (148, 10000, 80000, 19, 7);
INSERT INTO public.pilots_prices VALUES (149, 100000, 70000, 2, 7);
INSERT INTO public.pilots_prices VALUES (150, 90000, 70000, 12, 7);
INSERT INTO public.pilots_prices VALUES (151, 40000, 60000, 22, 7);
INSERT INTO public.pilots_prices VALUES (152, 70000, 60000, 5, 7);
INSERT INTO public.pilots_prices VALUES (153, 80000, 50000, 9, 7);
INSERT INTO public.pilots_prices VALUES (154, 30000, 50000, 20, 7);
INSERT INTO public.pilots_prices VALUES (155, 60000, 40000, 14, 7);
INSERT INTO public.pilots_prices VALUES (156, 50000, 40000, 4, 7);
INSERT INTO public.pilots_prices VALUES (157, 20000, 30000, 7, 7);
INSERT INTO public.pilots_prices VALUES (158, 40000, 30000, 1, 7);
INSERT INTO public.pilots_prices VALUES (159, 60000, 20000, 11, 7);
INSERT INTO public.pilots_prices VALUES (160, 10000, 20000, 10, 7);
INSERT INTO public.pilots_prices VALUES (161, 50000, 10000, 3, 7);
INSERT INTO public.pilots_prices VALUES (162, 20000, 10000, 18, 7);
INSERT INTO public.pilots_prices VALUES (163, 130000, 130000, 21, 8);
INSERT INTO public.pilots_prices VALUES (164, 70000, 100000, 2, 8);
INSERT INTO public.pilots_prices VALUES (165, 100000, 90000, 6, 8);
INSERT INTO public.pilots_prices VALUES (166, 50000, 90000, 9, 8);
INSERT INTO public.pilots_prices VALUES (167, 80000, 80000, 17, 8);
INSERT INTO public.pilots_prices VALUES (168, 90000, 80000, 13, 8);
INSERT INTO public.pilots_prices VALUES (169, 30000, 70000, 1, 8);
INSERT INTO public.pilots_prices VALUES (170, 70000, 70000, 12, 8);
INSERT INTO public.pilots_prices VALUES (171, 80000, 60000, 19, 8);
INSERT INTO public.pilots_prices VALUES (172, 10000, 60000, 3, 8);
INSERT INTO public.pilots_prices VALUES (173, 40000, 50000, 14, 8);
INSERT INTO public.pilots_prices VALUES (174, 60000, 50000, 5, 8);
INSERT INTO public.pilots_prices VALUES (175, 20000, 40000, 11, 8);
INSERT INTO public.pilots_prices VALUES (176, 50000, 40000, 20, 8);
INSERT INTO public.pilots_prices VALUES (177, 30000, 30000, 7, 8);
INSERT INTO public.pilots_prices VALUES (178, 60000, 30000, 22, 8);
INSERT INTO public.pilots_prices VALUES (179, 20000, 20000, 10, 8);
INSERT INTO public.pilots_prices VALUES (180, 40000, 20000, 4, 8);
INSERT INTO public.pilots_prices VALUES (181, 90000, 10000, 16, 8);
INSERT INTO public.pilots_prices VALUES (182, 10000, 10000, 18, 8);
INSERT INTO public.pilots_prices VALUES (183, 130000, 130000, 21, 9);
INSERT INTO public.pilots_prices VALUES (184, 90000, 100000, 9, 9);
INSERT INTO public.pilots_prices VALUES (185, 80000, 90000, 13, 9);
INSERT INTO public.pilots_prices VALUES (186, 40000, 90000, 11, 9);
INSERT INTO public.pilots_prices VALUES (187, 100000, 80000, 2, 9);
INSERT INTO public.pilots_prices VALUES (188, 80000, 80000, 17, 9);
INSERT INTO public.pilots_prices VALUES (189, 10000, 70000, 16, 9);
INSERT INTO public.pilots_prices VALUES (190, 90000, 70000, 6, 9);
INSERT INTO public.pilots_prices VALUES (191, 60000, 60000, 19, 9);
INSERT INTO public.pilots_prices VALUES (192, 50000, 60000, 5, 9);
INSERT INTO public.pilots_prices VALUES (193, 70000, 50000, 1, 9);
INSERT INTO public.pilots_prices VALUES (194, 30000, 50000, 22, 9);
INSERT INTO public.pilots_prices VALUES (195, 10000, 40000, 18, 9);
INSERT INTO public.pilots_prices VALUES (196, 70000, 40000, 12, 9);
INSERT INTO public.pilots_prices VALUES (197, 60000, 30000, 3, 9);
INSERT INTO public.pilots_prices VALUES (198, 50000, 30000, 14, 9);
INSERT INTO public.pilots_prices VALUES (199, 20000, 20000, 4, 9);
INSERT INTO public.pilots_prices VALUES (200, 20000, 20000, 10, 9);
INSERT INTO public.pilots_prices VALUES (201, 40000, 10000, 20, 9);
INSERT INTO public.pilots_prices VALUES (202, 30000, 10000, 7, 9);
INSERT INTO public.pilots_prices VALUES (203, 130000, 130000, 21, 10);
INSERT INTO public.pilots_prices VALUES (204, 90000, 100000, 11, 10);
INSERT INTO public.pilots_prices VALUES (205, 70000, 90000, 6, 10);
INSERT INTO public.pilots_prices VALUES (206, 30000, 90000, 14, 10);
INSERT INTO public.pilots_prices VALUES (207, 70000, 80000, 16, 10);
INSERT INTO public.pilots_prices VALUES (208, 90000, 80000, 13, 10);
INSERT INTO public.pilots_prices VALUES (209, 80000, 70000, 2, 10);
INSERT INTO public.pilots_prices VALUES (210, 50000, 70000, 1, 10);
INSERT INTO public.pilots_prices VALUES (211, 100000, 60000, 9, 10);
INSERT INTO public.pilots_prices VALUES (212, 80000, 60000, 17, 10);
INSERT INTO public.pilots_prices VALUES (213, 40000, 50000, 18, 10);
INSERT INTO public.pilots_prices VALUES (214, 30000, 50000, 3, 10);
INSERT INTO public.pilots_prices VALUES (215, 10000, 40000, 7, 10);
INSERT INTO public.pilots_prices VALUES (216, 60000, 40000, 19, 10);
INSERT INTO public.pilots_prices VALUES (217, 50000, 30000, 22, 10);
INSERT INTO public.pilots_prices VALUES (218, 10000, 30000, 20, 10);
INSERT INTO public.pilots_prices VALUES (219, 20000, 20000, 4, 10);
INSERT INTO public.pilots_prices VALUES (220, 60000, 20000, 5, 10);
INSERT INTO public.pilots_prices VALUES (221, 20000, 10000, 10, 10);
INSERT INTO public.pilots_prices VALUES (222, 40000, 10000, 12, 10);
INSERT INTO public.pilots_prices VALUES (223, 130000, 130000, 21, 11);
INSERT INTO public.pilots_prices VALUES (224, 100000, 100000, 11, 11);
INSERT INTO public.pilots_prices VALUES (225, 80000, 90000, 13, 11);
INSERT INTO public.pilots_prices VALUES (226, 90000, 90000, 6, 11);
INSERT INTO public.pilots_prices VALUES (227, 90000, 80000, 14, 11);
INSERT INTO public.pilots_prices VALUES (228, 80000, 80000, 16, 11);
INSERT INTO public.pilots_prices VALUES (229, 60000, 70000, 9, 11);
INSERT INTO public.pilots_prices VALUES (230, 60000, 70000, 17, 11);
INSERT INTO public.pilots_prices VALUES (231, 70000, 60000, 2, 11);
INSERT INTO public.pilots_prices VALUES (232, 40000, 60000, 19, 11);
INSERT INTO public.pilots_prices VALUES (233, 70000, 50000, 1, 11);
INSERT INTO public.pilots_prices VALUES (234, 50000, 50000, 3, 11);
INSERT INTO public.pilots_prices VALUES (235, 10000, 40000, 15, 11);
INSERT INTO public.pilots_prices VALUES (236, 40000, 40000, 7, 11);
INSERT INTO public.pilots_prices VALUES (237, 30000, 30000, 20, 11);
INSERT INTO public.pilots_prices VALUES (238, 30000, 30000, 22, 11);
INSERT INTO public.pilots_prices VALUES (239, 10000, 20000, 10, 11);
INSERT INTO public.pilots_prices VALUES (240, 50000, 20000, 18, 11);
INSERT INTO public.pilots_prices VALUES (241, 10000, 10000, 12, 11);
INSERT INTO public.pilots_prices VALUES (242, 20000, 10000, 5, 11);
INSERT INTO public.pilots_prices VALUES (243, 130000, 130000, 21, 12);
INSERT INTO public.pilots_prices VALUES (244, 90000, 100000, 13, 12);
INSERT INTO public.pilots_prices VALUES (245, 70000, 90000, 9, 12);
INSERT INTO public.pilots_prices VALUES (246, 90000, 90000, 6, 12);
INSERT INTO public.pilots_prices VALUES (247, 60000, 80000, 2, 12);
INSERT INTO public.pilots_prices VALUES (248, 80000, 80000, 16, 12);
INSERT INTO public.pilots_prices VALUES (249, 100000, 70000, 11, 12);
INSERT INTO public.pilots_prices VALUES (250, 10000, 70000, 12, 12);
INSERT INTO public.pilots_prices VALUES (251, 60000, 60000, 19, 12);
INSERT INTO public.pilots_prices VALUES (252, 30000, 60000, 20, 12);
INSERT INTO public.pilots_prices VALUES (253, 10000, 50000, 5, 12);
INSERT INTO public.pilots_prices VALUES (254, 50000, 50000, 3, 12);
INSERT INTO public.pilots_prices VALUES (255, 30000, 40000, 22, 12);
INSERT INTO public.pilots_prices VALUES (256, 50000, 40000, 1, 12);
INSERT INTO public.pilots_prices VALUES (257, 20000, 30000, 10, 12);
INSERT INTO public.pilots_prices VALUES (258, 40000, 30000, 15, 12);
INSERT INTO public.pilots_prices VALUES (259, 20000, 20000, 18, 12);
INSERT INTO public.pilots_prices VALUES (260, 40000, 20000, 7, 12);
INSERT INTO public.pilots_prices VALUES (261, 70000, 10000, 17, 12);
INSERT INTO public.pilots_prices VALUES (262, 80000, 10000, 14, 12);
INSERT INTO public.pilots_prices VALUES (263, 130000, 130000, 21, 13);
INSERT INTO public.pilots_prices VALUES (264, 80000, 100000, 2, 13);
INSERT INTO public.pilots_prices VALUES (265, 50000, 90000, 5, 13);
INSERT INTO public.pilots_prices VALUES (266, 100000, 90000, 13, 13);
INSERT INTO public.pilots_prices VALUES (267, 10000, 80000, 17, 13);
INSERT INTO public.pilots_prices VALUES (268, 90000, 80000, 6, 13);
INSERT INTO public.pilots_prices VALUES (269, 70000, 70000, 11, 13);
INSERT INTO public.pilots_prices VALUES (270, 40000, 70000, 1, 13);
INSERT INTO public.pilots_prices VALUES (271, 10000, 60000, 14, 13);
INSERT INTO public.pilots_prices VALUES (272, 70000, 60000, 12, 13);
INSERT INTO public.pilots_prices VALUES (273, 60000, 50000, 19, 13);
INSERT INTO public.pilots_prices VALUES (274, 20000, 50000, 7, 13);
INSERT INTO public.pilots_prices VALUES (275, 10000, 40000, 8, 13);
INSERT INTO public.pilots_prices VALUES (276, 50000, 40000, 3, 13);
INSERT INTO public.pilots_prices VALUES (277, 60000, 30000, 20, 13);
INSERT INTO public.pilots_prices VALUES (278, 30000, 30000, 10, 13);
INSERT INTO public.pilots_prices VALUES (279, 80000, 20000, 16, 13);
INSERT INTO public.pilots_prices VALUES (280, 40000, 20000, 22, 13);
INSERT INTO public.pilots_prices VALUES (281, 90000, 10000, 9, 13);
INSERT INTO public.pilots_prices VALUES (282, 20000, 10000, 18, 13);
INSERT INTO public.pilots_prices VALUES (283, 130000, 130000, 21, 14);
INSERT INTO public.pilots_prices VALUES (284, 90000, 100000, 13, 14);
INSERT INTO public.pilots_prices VALUES (285, 80000, 90000, 17, 14);
INSERT INTO public.pilots_prices VALUES (286, 10000, 90000, 9, 14);
INSERT INTO public.pilots_prices VALUES (287, 20000, 80000, 16, 14);
INSERT INTO public.pilots_prices VALUES (288, 80000, 80000, 6, 14);
INSERT INTO public.pilots_prices VALUES (289, 70000, 70000, 1, 14);
INSERT INTO public.pilots_prices VALUES (290, 70000, 70000, 11, 14);
INSERT INTO public.pilots_prices VALUES (291, 100000, 60000, 2, 14);
INSERT INTO public.pilots_prices VALUES (292, 40000, 60000, 3, 14);
INSERT INTO public.pilots_prices VALUES (293, 40000, 50000, 8, 14);
INSERT INTO public.pilots_prices VALUES (294, 60000, 50000, 14, 14);
INSERT INTO public.pilots_prices VALUES (295, 10000, 40000, 18, 14);
INSERT INTO public.pilots_prices VALUES (296, 20000, 40000, 22, 14);
INSERT INTO public.pilots_prices VALUES (297, 90000, 30000, 5, 14);
INSERT INTO public.pilots_prices VALUES (298, 50000, 30000, 19, 14);
INSERT INTO public.pilots_prices VALUES (299, 50000, 20000, 7, 14);
INSERT INTO public.pilots_prices VALUES (300, 30000, 20000, 10, 14);
INSERT INTO public.pilots_prices VALUES (301, 60000, 10000, 12, 14);
INSERT INTO public.pilots_prices VALUES (302, 30000, 10000, 20, 14);
INSERT INTO public.pilots_prices VALUES (303, 90000, 130000, 17, 15);
INSERT INTO public.pilots_prices VALUES (304, 70000, 100000, 11, 15);
INSERT INTO public.pilots_prices VALUES (305, 80000, 90000, 6, 15);
INSERT INTO public.pilots_prices VALUES (306, 90000, 90000, 9, 15);
INSERT INTO public.pilots_prices VALUES (307, 130000, 80000, 21, 15);
INSERT INTO public.pilots_prices VALUES (308, 30000, 80000, 5, 15);
INSERT INTO public.pilots_prices VALUES (309, 50000, 70000, 14, 15);
INSERT INTO public.pilots_prices VALUES (310, 100000, 70000, 13, 15);
INSERT INTO public.pilots_prices VALUES (311, 50000, 60000, 8, 15);
INSERT INTO public.pilots_prices VALUES (312, 20000, 60000, 10, 15);
INSERT INTO public.pilots_prices VALUES (313, 70000, 50000, 1, 15);
INSERT INTO public.pilots_prices VALUES (314, 40000, 50000, 22, 15);
INSERT INTO public.pilots_prices VALUES (315, 20000, 40000, 7, 15);
INSERT INTO public.pilots_prices VALUES (316, 40000, 40000, 18, 15);
INSERT INTO public.pilots_prices VALUES (317, 60000, 30000, 2, 15);
INSERT INTO public.pilots_prices VALUES (318, 80000, 30000, 16, 15);
INSERT INTO public.pilots_prices VALUES (319, 60000, 20000, 3, 15);
INSERT INTO public.pilots_prices VALUES (320, 10000, 20000, 12, 15);
INSERT INTO public.pilots_prices VALUES (321, 10000, 10000, 20, 15);
INSERT INTO public.pilots_prices VALUES (322, 30000, 10000, 19, 15);
INSERT INTO public.pilots_prices VALUES (323, 80000, 130000, 21, 16);
INSERT INTO public.pilots_prices VALUES (324, 100000, 100000, 11, 16);
INSERT INTO public.pilots_prices VALUES (325, 70000, 90000, 14, 16);
INSERT INTO public.pilots_prices VALUES (326, 90000, 90000, 9, 16);
INSERT INTO public.pilots_prices VALUES (327, 90000, 80000, 6, 16);
INSERT INTO public.pilots_prices VALUES (328, 130000, 80000, 17, 16);
INSERT INTO public.pilots_prices VALUES (329, 30000, 70000, 16, 16);
INSERT INTO public.pilots_prices VALUES (330, 30000, 70000, 2, 16);
INSERT INTO public.pilots_prices VALUES (331, 20000, 60000, 12, 16);
INSERT INTO public.pilots_prices VALUES (332, 80000, 60000, 5, 16);
INSERT INTO public.pilots_prices VALUES (333, 60000, 50000, 8, 16);
INSERT INTO public.pilots_prices VALUES (334, 10000, 50000, 20, 16);
INSERT INTO public.pilots_prices VALUES (335, 50000, 40000, 22, 16);
INSERT INTO public.pilots_prices VALUES (336, 40000, 40000, 7, 16);
INSERT INTO public.pilots_prices VALUES (337, 60000, 30000, 10, 16);
INSERT INTO public.pilots_prices VALUES (338, 50000, 30000, 1, 16);
INSERT INTO public.pilots_prices VALUES (339, 40000, 20000, 18, 16);
INSERT INTO public.pilots_prices VALUES (340, 10000, 20000, 19, 16);
INSERT INTO public.pilots_prices VALUES (341, 70000, 10000, 13, 16);
INSERT INTO public.pilots_prices VALUES (342, 20000, 10000, 3, 16);
INSERT INTO public.pilots_prices VALUES (343, 130000, 130000, 21, 17);
INSERT INTO public.pilots_prices VALUES (344, 90000, 100000, 14, 17);
INSERT INTO public.pilots_prices VALUES (345, 100000, 90000, 11, 17);
INSERT INTO public.pilots_prices VALUES (346, 70000, 90000, 16, 17);
INSERT INTO public.pilots_prices VALUES (347, 90000, 80000, 9, 17);
INSERT INTO public.pilots_prices VALUES (348, 70000, 80000, 2, 17);
INSERT INTO public.pilots_prices VALUES (349, 60000, 70000, 12, 17);
INSERT INTO public.pilots_prices VALUES (350, 10000, 70000, 3, 17);
INSERT INTO public.pilots_prices VALUES (351, 40000, 60000, 22, 17);
INSERT INTO public.pilots_prices VALUES (352, 10000, 60000, 13, 17);
INSERT INTO public.pilots_prices VALUES (353, 20000, 50000, 19, 17);
INSERT INTO public.pilots_prices VALUES (354, 60000, 50000, 5, 17);
INSERT INTO public.pilots_prices VALUES (355, 30000, 40000, 1, 17);
INSERT INTO public.pilots_prices VALUES (356, 30000, 40000, 10, 17);
INSERT INTO public.pilots_prices VALUES (357, 50000, 30000, 20, 17);
INSERT INTO public.pilots_prices VALUES (358, 40000, 30000, 7, 17);
INSERT INTO public.pilots_prices VALUES (359, 50000, 20000, 8, 17);
INSERT INTO public.pilots_prices VALUES (360, 20000, 20000, 18, 17);
INSERT INTO public.pilots_prices VALUES (361, 80000, 10000, 6, 17);
INSERT INTO public.pilots_prices VALUES (362, 80000, 10000, 17, 17);
INSERT INTO public.pilots_prices VALUES (363, 130000, 130000, 21, 18);
INSERT INTO public.pilots_prices VALUES (364, 90000, 100000, 11, 18);
INSERT INTO public.pilots_prices VALUES (365, 10000, 90000, 17, 18);
INSERT INTO public.pilots_prices VALUES (366, 60000, 90000, 13, 18);
INSERT INTO public.pilots_prices VALUES (367, 90000, 80000, 16, 18);
INSERT INTO public.pilots_prices VALUES (368, 50000, 80000, 5, 18);
INSERT INTO public.pilots_prices VALUES (369, 50000, 70000, 19, 18);
INSERT INTO public.pilots_prices VALUES (370, 30000, 70000, 20, 18);
INSERT INTO public.pilots_prices VALUES (371, 40000, 60000, 1, 18);
INSERT INTO public.pilots_prices VALUES (372, 20000, 60000, 18, 18);
INSERT INTO public.pilots_prices VALUES (373, 30000, 50000, 7, 18);
INSERT INTO public.pilots_prices VALUES (374, 70000, 50000, 3, 18);
INSERT INTO public.pilots_prices VALUES (375, 60000, 40000, 22, 18);
INSERT INTO public.pilots_prices VALUES (376, 40000, 40000, 10, 18);
INSERT INTO public.pilots_prices VALUES (377, 30000, 30000, 15, 18);
INSERT INTO public.pilots_prices VALUES (378, 80000, 30000, 2, 18);
INSERT INTO public.pilots_prices VALUES (379, 100000, 20000, 14, 18);
INSERT INTO public.pilots_prices VALUES (380, 70000, 20000, 12, 18);
INSERT INTO public.pilots_prices VALUES (381, 10000, 10000, 6, 18);
INSERT INTO public.pilots_prices VALUES (382, 80000, 10000, 9, 18);
INSERT INTO public.pilots_prices VALUES (383, 130000, 130000, 21, 19);
INSERT INTO public.pilots_prices VALUES (384, 10000, 100000, 6, 19);
INSERT INTO public.pilots_prices VALUES (385, 10000, 90000, 9, 19);
INSERT INTO public.pilots_prices VALUES (386, 90000, 90000, 17, 19);
INSERT INTO public.pilots_prices VALUES (387, 100000, 80000, 11, 19);
INSERT INTO public.pilots_prices VALUES (388, 80000, 80000, 16, 19);
INSERT INTO public.pilots_prices VALUES (389, 30000, 70000, 15, 19);
INSERT INTO public.pilots_prices VALUES (390, 20000, 70000, 14, 19);
INSERT INTO public.pilots_prices VALUES (391, 60000, 60000, 1, 19);
INSERT INTO public.pilots_prices VALUES (392, 20000, 60000, 12, 19);
INSERT INTO public.pilots_prices VALUES (393, 80000, 50000, 5, 19);
INSERT INTO public.pilots_prices VALUES (394, 70000, 50000, 20, 19);
INSERT INTO public.pilots_prices VALUES (395, 50000, 40000, 7, 19);
INSERT INTO public.pilots_prices VALUES (396, 40000, 40000, 22, 19);
INSERT INTO public.pilots_prices VALUES (397, 50000, 30000, 3, 19);
INSERT INTO public.pilots_prices VALUES (398, 60000, 30000, 18, 19);
INSERT INTO public.pilots_prices VALUES (399, 70000, 20000, 19, 19);
INSERT INTO public.pilots_prices VALUES (400, 30000, 20000, 2, 19);
INSERT INTO public.pilots_prices VALUES (401, 40000, 10000, 10, 19);
INSERT INTO public.pilots_prices VALUES (402, 90000, 10000, 13, 19);
INSERT INTO public.pilots_prices VALUES (403, 130000, 130000, 21, 20);
INSERT INTO public.pilots_prices VALUES (404, 80000, 100000, 11, 20);
INSERT INTO public.pilots_prices VALUES (405, 20000, 90000, 2, 20);
INSERT INTO public.pilots_prices VALUES (406, 10000, 90000, 13, 20);
INSERT INTO public.pilots_prices VALUES (407, 20000, 80000, 19, 20);
INSERT INTO public.pilots_prices VALUES (408, 90000, 80000, 17, 20);
INSERT INTO public.pilots_prices VALUES (409, 50000, 70000, 5, 20);
INSERT INTO public.pilots_prices VALUES (410, 100000, 70000, 6, 20);
INSERT INTO public.pilots_prices VALUES (411, 50000, 60000, 20, 20);
INSERT INTO public.pilots_prices VALUES (412, 60000, 60000, 12, 20);
INSERT INTO public.pilots_prices VALUES (413, 30000, 50000, 18, 20);
INSERT INTO public.pilots_prices VALUES (414, 40000, 50000, 7, 20);
INSERT INTO public.pilots_prices VALUES (415, 70000, 40000, 15, 20);
INSERT INTO public.pilots_prices VALUES (416, 70000, 40000, 14, 20);
INSERT INTO public.pilots_prices VALUES (417, 80000, 30000, 16, 20);
INSERT INTO public.pilots_prices VALUES (418, 30000, 30000, 3, 20);
INSERT INTO public.pilots_prices VALUES (419, 40000, 20000, 22, 20);
INSERT INTO public.pilots_prices VALUES (420, 10000, 20000, 10, 20);
INSERT INTO public.pilots_prices VALUES (421, 60000, 10000, 1, 20);
INSERT INTO public.pilots_prices VALUES (422, 90000, 10000, 9, 20);
INSERT INTO public.pilots_prices VALUES (423, 130000, 130000, 21, 21);
INSERT INTO public.pilots_prices VALUES (424, 10000, 100000, 9, 21);
INSERT INTO public.pilots_prices VALUES (425, 90000, 90000, 13, 21);
INSERT INTO public.pilots_prices VALUES (426, 60000, 90000, 12, 21);
INSERT INTO public.pilots_prices VALUES (427, 80000, 80000, 19, 21);
INSERT INTO public.pilots_prices VALUES (428, 80000, 80000, 17, 21);
INSERT INTO public.pilots_prices VALUES (429, 70000, 70000, 6, 21);
INSERT INTO public.pilots_prices VALUES (430, 30000, 70000, 16, 21);
INSERT INTO public.pilots_prices VALUES (431, 90000, 60000, 2, 21);
INSERT INTO public.pilots_prices VALUES (432, 40000, 60000, 14, 21);
INSERT INTO public.pilots_prices VALUES (433, 70000, 50000, 5, 21);
INSERT INTO public.pilots_prices VALUES (434, 10000, 50000, 1, 21);
INSERT INTO public.pilots_prices VALUES (435, 20000, 40000, 10, 21);
INSERT INTO public.pilots_prices VALUES (436, 40000, 40000, 15, 21);
INSERT INTO public.pilots_prices VALUES (437, 20000, 30000, 22, 21);
INSERT INTO public.pilots_prices VALUES (438, 50000, 30000, 18, 21);
INSERT INTO public.pilots_prices VALUES (439, 30000, 20000, 3, 21);
INSERT INTO public.pilots_prices VALUES (440, 60000, 20000, 20, 21);
INSERT INTO public.pilots_prices VALUES (441, 50000, 10000, 7, 21);
INSERT INTO public.pilots_prices VALUES (442, 100000, 10000, 11, 21);


--
-- TOC entry 3103 (class 0 OID 294294)
-- Dependencies: 222
-- Data for Name: races; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.races VALUES (1, 'Bahrain Grand Prix', 'Bahrain International Circuit', 'bahrain', 1, '2023-03-05', 'https://en.wikipedia.org/wiki/2023_Bahrain_Grand_Prix', 'Sakhir', 'Bahrain');
INSERT INTO public.races VALUES (2, 'Saudi Arabian Grand Prix', 'Jeddah Corniche Circuit', 'jeddah', 2, '2023-03-19', 'https://en.wikipedia.org/wiki/2023_Saudi_Arabian_Grand_Prix', 'Jeddah', 'Saudi Arabia');
INSERT INTO public.races VALUES (3, 'Australian Grand Prix', 'Albert Park Grand Prix Circuit', 'albert_park', 3, '2023-04-02', 'https://en.wikipedia.org/wiki/2023_Australian_Grand_Prix', 'Melbourne', 'Australia');
INSERT INTO public.races VALUES (4, 'Azerbaijan Grand Prix', 'Baku City Circuit', 'baku', 4, '2023-04-30', 'https://en.wikipedia.org/wiki/2023_Azerbaijan_Grand_Prix', 'Baku', 'Azerbaijan');
INSERT INTO public.races VALUES (5, 'Miami Grand Prix', 'Miami International Autodrome', 'miami', 5, '2023-05-07', 'https://en.wikipedia.org/wiki/2023_Miami_Grand_Prix', 'Miami', 'USA');
INSERT INTO public.races VALUES (6, 'Monaco Grand Prix', 'Circuit de Monaco', 'monaco', 6, '2023-05-28', 'https://en.wikipedia.org/wiki/2023_Monaco_Grand_Prix', 'Monte-Carlo', 'Monaco');
INSERT INTO public.races VALUES (7, 'Spanish Grand Prix', 'Circuit de Barcelona-Catalunya', 'catalunya', 7, '2023-06-04', 'https://en.wikipedia.org/wiki/2023_Spanish_Grand_Prix', 'Montmeló', 'Spain');
INSERT INTO public.races VALUES (8, 'Canadian Grand Prix', 'Circuit Gilles Villeneuve', 'villeneuve', 8, '2023-06-18', 'https://en.wikipedia.org/wiki/2023_Canadian_Grand_Prix', 'Montreal', 'Canada');
INSERT INTO public.races VALUES (9, 'Austrian Grand Prix', 'Red Bull Ring', 'red_bull_ring', 9, '2023-07-02', 'https://en.wikipedia.org/wiki/2023_Austrian_Grand_Prix', 'Spielberg', 'Austria');
INSERT INTO public.races VALUES (10, 'British Grand Prix', 'Silverstone Circuit', 'silverstone', 10, '2023-07-09', 'https://en.wikipedia.org/wiki/2023_British_Grand_Prix', 'Silverstone', 'UK');
INSERT INTO public.races VALUES (11, 'Hungarian Grand Prix', 'Hungaroring', 'hungaroring', 11, '2023-07-23', 'https://en.wikipedia.org/wiki/2023_Hungarian_Grand_Prix', 'Budapest', 'Hungary');
INSERT INTO public.races VALUES (12, 'Belgian Grand Prix', 'Circuit de Spa-Francorchamps', 'spa', 12, '2023-07-30', 'https://en.wikipedia.org/wiki/2023_Belgian_Grand_Prix', 'Spa', 'Belgium');
INSERT INTO public.races VALUES (13, 'Dutch Grand Prix', 'Circuit Park Zandvoort', 'zandvoort', 13, '2023-08-27', 'https://en.wikipedia.org/wiki/2023_Dutch_Grand_Prix', 'Zandvoort', 'Netherlands');
INSERT INTO public.races VALUES (14, 'Italian Grand Prix', 'Autodromo Nazionale di Monza', 'monza', 14, '2023-09-03', 'https://en.wikipedia.org/wiki/2023_Italian_Grand_Prix', 'Monza', 'Italy');
INSERT INTO public.races VALUES (15, 'Singapore Grand Prix', 'Marina Bay Street Circuit', 'marina_bay', 15, '2023-09-17', 'https://en.wikipedia.org/wiki/2023_Singapore_Grand_Prix', 'Marina Bay', 'Singapore');
INSERT INTO public.races VALUES (16, 'Japanese Grand Prix', 'Suzuka Circuit', 'suzuka', 16, '2023-09-24', 'https://en.wikipedia.org/wiki/2023_Japanese_Grand_Prix', 'Suzuka', 'Japan');
INSERT INTO public.races VALUES (17, 'Qatar Grand Prix', 'Losail International Circuit', 'losail', 17, '2023-10-08', 'https://en.wikipedia.org/wiki/2023_Qatar_Grand_Prix', 'Al Daayen', 'Qatar');
INSERT INTO public.races VALUES (18, 'United States Grand Prix', 'Circuit of the Americas', 'americas', 18, '2023-10-22', 'https://en.wikipedia.org/wiki/2023_United_States_Grand_Prix', 'Austin', 'USA');
INSERT INTO public.races VALUES (19, 'Mexico City Grand Prix', 'Autódromo Hermanos Rodríguez', 'rodriguez', 19, '2023-10-29', 'https://en.wikipedia.org/wiki/2023_Mexico_City_Grand_Prix', 'Mexico City', 'Mexico');
INSERT INTO public.races VALUES (20, 'São Paulo Grand Prix', 'Autódromo José Carlos Pace', 'interlagos', 20, '2023-11-05', 'https://en.wikipedia.org/wiki/2023_S%C3%A3o_Paulo_Grand_Prix', 'São Paulo', 'Brazil');
INSERT INTO public.races VALUES (21, 'Las Vegas Grand Prix', 'Las Vegas Strip Street Circuit', 'vegas', 21, '2023-11-18', 'https://en.wikipedia.org/wiki/2023_Las_Vegas_Grand_Prix', 'Las Vegas', 'United States');
INSERT INTO public.races VALUES (22, 'Abu Dhabi Grand Prix', 'Yas Marina Circuit', 'yas_marina', 22, '2023-11-26', 'https://en.wikipedia.org/wiki/2023_Abu_Dhabi_Grand_Prix', 'Abu Dhabi', 'UAE');


--
-- TOC entry 3109 (class 0 OID 295010)
-- Dependencies: 228
-- Data for Name: races_points; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.races_points VALUES (1, 25, 3, 1);
INSERT INTO public.races_points VALUES (2, 25, 23, 1);
INSERT INTO public.races_points VALUES (3, 25, 43, 1);
INSERT INTO public.races_points VALUES (4, 25, 55, 1);
INSERT INTO public.races_points VALUES (5, 25, 57, 1);
INSERT INTO public.races_points VALUES (6, 18, 2, 2);
INSERT INTO public.races_points VALUES (7, 18, 9, 2);
INSERT INTO public.races_points VALUES (8, 18, 20, 2);
INSERT INTO public.races_points VALUES (9, 18, 34, 2);
INSERT INTO public.races_points VALUES (10, 18, 46, 2);
INSERT INTO public.races_points VALUES (11, 18, 50, 2);
INSERT INTO public.races_points VALUES (12, 18, 53, 2);
INSERT INTO public.races_points VALUES (13, 18, 68, 2);
INSERT INTO public.races_points VALUES (14, 15, 1, 3);
INSERT INTO public.races_points VALUES (15, 15, 21, 3);
INSERT INTO public.races_points VALUES (16, 15, 25, 3);
INSERT INTO public.races_points VALUES (17, 15, 36, 3);
INSERT INTO public.races_points VALUES (18, 12, 6, 4);
INSERT INTO public.races_points VALUES (19, 12, 10, 4);
INSERT INTO public.races_points VALUES (20, 12, 22, 4);
INSERT INTO public.races_points VALUES (21, 12, 24, 4);
INSERT INTO public.races_points VALUES (22, 12, 35, 4);
INSERT INTO public.races_points VALUES (23, 12, 60, 4);
INSERT INTO public.races_points VALUES (24, 10, 13, 5);
INSERT INTO public.races_points VALUES (25, 10, 17, 5);
INSERT INTO public.races_points VALUES (26, 10, 32, 5);
INSERT INTO public.races_points VALUES (27, 10, 58, 5);
INSERT INTO public.races_points VALUES (28, 10, 67, 5);
INSERT INTO public.races_points VALUES (29, 8, 37, 6);
INSERT INTO public.races_points VALUES (30, 8, 44, 6);
INSERT INTO public.races_points VALUES (31, 8, 47, 6);
INSERT INTO public.races_points VALUES (32, 8, 62, 6);
INSERT INTO public.races_points VALUES (33, 6, 59, 7);
INSERT INTO public.races_points VALUES (34, 6, 66, 7);
INSERT INTO public.races_points VALUES (35, 4, 7, 8);
INSERT INTO public.races_points VALUES (36, 4, 15, 8);
INSERT INTO public.races_points VALUES (37, 4, 28, 8);
INSERT INTO public.races_points VALUES (38, 4, 31, 8);
INSERT INTO public.races_points VALUES (39, 2, 40, 9);
INSERT INTO public.races_points VALUES (40, 2, 54, 9);
INSERT INTO public.races_points VALUES (41, 1, 18, 10);
INSERT INTO public.races_points VALUES (42, 1, 30, 10);
INSERT INTO public.races_points VALUES (43, 0, 4, 11);
INSERT INTO public.races_points VALUES (44, 0, 19, 11);
INSERT INTO public.races_points VALUES (45, 0, 69, 11);
INSERT INTO public.races_points VALUES (46, 0, 61, 12);
INSERT INTO public.races_points VALUES (47, 0, 64, 12);
INSERT INTO public.races_points VALUES (48, 0, 41, 13);
INSERT INTO public.races_points VALUES (49, 0, 16, 15);
INSERT INTO public.races_points VALUES (50, 0, 26, 15);
INSERT INTO public.races_points VALUES (51, 0, 51, 16);
INSERT INTO public.races_points VALUES (52, 0, 38, 17);
INSERT INTO public.races_points VALUES (53, -2, 27, 19);
INSERT INTO public.races_points VALUES (54, -2, 48, 19);
INSERT INTO public.races_points VALUES (55, -2, 65, 19);
INSERT INTO public.races_points VALUES (56, -2, 29, 20);
INSERT INTO public.races_points VALUES (57, -2, 52, 20);
INSERT INTO public.races_points VALUES (58, -2, 63, 20);
INSERT INTO public.races_points VALUES (59, 25, 2, 21);
INSERT INTO public.races_points VALUES (60, 25, 9, 21);
INSERT INTO public.races_points VALUES (61, 25, 20, 21);
INSERT INTO public.races_points VALUES (62, 25, 34, 21);
INSERT INTO public.races_points VALUES (63, 25, 46, 21);
INSERT INTO public.races_points VALUES (64, 25, 50, 21);
INSERT INTO public.races_points VALUES (65, 25, 53, 21);
INSERT INTO public.races_points VALUES (66, 25, 68, 21);
INSERT INTO public.races_points VALUES (67, 19, 3, 22);
INSERT INTO public.races_points VALUES (68, 19, 23, 22);
INSERT INTO public.races_points VALUES (69, 19, 43, 22);
INSERT INTO public.races_points VALUES (70, 19, 55, 22);
INSERT INTO public.races_points VALUES (71, 19, 57, 22);
INSERT INTO public.races_points VALUES (72, 15, 1, 23);
INSERT INTO public.races_points VALUES (73, 15, 21, 23);
INSERT INTO public.races_points VALUES (74, 15, 25, 23);
INSERT INTO public.races_points VALUES (75, 15, 36, 23);
INSERT INTO public.races_points VALUES (76, 12, 59, 24);
INSERT INTO public.races_points VALUES (77, 12, 66, 24);
INSERT INTO public.races_points VALUES (78, 10, 13, 25);
INSERT INTO public.races_points VALUES (79, 10, 17, 25);
INSERT INTO public.races_points VALUES (80, 10, 32, 25);
INSERT INTO public.races_points VALUES (81, 10, 58, 25);
INSERT INTO public.races_points VALUES (82, 10, 67, 25);
INSERT INTO public.races_points VALUES (83, 8, 6, 26);
INSERT INTO public.races_points VALUES (84, 8, 10, 26);
INSERT INTO public.races_points VALUES (85, 8, 22, 26);
INSERT INTO public.races_points VALUES (86, 8, 24, 26);
INSERT INTO public.races_points VALUES (87, 8, 35, 26);
INSERT INTO public.races_points VALUES (88, 8, 60, 26);
INSERT INTO public.races_points VALUES (89, 6, 27, 27);
INSERT INTO public.races_points VALUES (90, 6, 48, 27);
INSERT INTO public.races_points VALUES (91, 6, 65, 27);
INSERT INTO public.races_points VALUES (92, 2, 40, 29);
INSERT INTO public.races_points VALUES (93, 2, 54, 29);
INSERT INTO public.races_points VALUES (94, 1, 41, 30);
INSERT INTO public.races_points VALUES (95, 0, 4, 31);
INSERT INTO public.races_points VALUES (96, 0, 19, 31);
INSERT INTO public.races_points VALUES (97, 0, 69, 31);
INSERT INTO public.races_points VALUES (98, 0, 16, 32);
INSERT INTO public.races_points VALUES (99, 0, 26, 32);
INSERT INTO public.races_points VALUES (100, 0, 51, 33);
INSERT INTO public.races_points VALUES (101, 0, 29, 35);
INSERT INTO public.races_points VALUES (102, 0, 52, 35);
INSERT INTO public.races_points VALUES (103, 0, 63, 35);
INSERT INTO public.races_points VALUES (104, 0, 61, 36);
INSERT INTO public.races_points VALUES (105, 0, 64, 36);
INSERT INTO public.races_points VALUES (106, 0, 38, 37);
INSERT INTO public.races_points VALUES (107, 0, 7, 38);
INSERT INTO public.races_points VALUES (108, 0, 15, 38);
INSERT INTO public.races_points VALUES (109, 0, 28, 38);
INSERT INTO public.races_points VALUES (110, 0, 31, 38);
INSERT INTO public.races_points VALUES (111, -2, 18, 39);
INSERT INTO public.races_points VALUES (112, -2, 30, 39);
INSERT INTO public.races_points VALUES (113, -2, 37, 40);
INSERT INTO public.races_points VALUES (114, -2, 44, 40);
INSERT INTO public.races_points VALUES (115, -2, 47, 40);
INSERT INTO public.races_points VALUES (116, -2, 62, 40);
INSERT INTO public.races_points VALUES (117, 25, 23, 41);
INSERT INTO public.races_points VALUES (118, 25, 43, 41);
INSERT INTO public.races_points VALUES (119, 25, 55, 41);
INSERT INTO public.races_points VALUES (120, 25, 57, 41);
INSERT INTO public.races_points VALUES (121, 18, 13, 42);
INSERT INTO public.races_points VALUES (122, 18, 17, 42);
INSERT INTO public.races_points VALUES (123, 18, 32, 42);
INSERT INTO public.races_points VALUES (124, 18, 58, 42);
INSERT INTO public.races_points VALUES (125, 18, 67, 42);
INSERT INTO public.races_points VALUES (126, 15, 1, 43);
INSERT INTO public.races_points VALUES (127, 15, 21, 43);
INSERT INTO public.races_points VALUES (128, 15, 25, 43);
INSERT INTO public.races_points VALUES (129, 15, 36, 43);
INSERT INTO public.races_points VALUES (130, 12, 37, 44);
INSERT INTO public.races_points VALUES (131, 12, 44, 44);
INSERT INTO public.races_points VALUES (132, 12, 47, 44);
INSERT INTO public.races_points VALUES (133, 12, 62, 44);
INSERT INTO public.races_points VALUES (134, 11, 2, 45);
INSERT INTO public.races_points VALUES (135, 11, 9, 45);
INSERT INTO public.races_points VALUES (136, 11, 20, 45);
INSERT INTO public.races_points VALUES (137, 11, 34, 45);
INSERT INTO public.races_points VALUES (138, 11, 46, 45);
INSERT INTO public.races_points VALUES (139, 11, 50, 45);
INSERT INTO public.races_points VALUES (140, 11, 53, 45);
INSERT INTO public.races_points VALUES (141, 11, 68, 45);
INSERT INTO public.races_points VALUES (142, 8, 38, 46);
INSERT INTO public.races_points VALUES (143, 6, 16, 47);
INSERT INTO public.races_points VALUES (144, 6, 26, 47);
INSERT INTO public.races_points VALUES (145, 4, 29, 48);
INSERT INTO public.races_points VALUES (146, 4, 52, 48);
INSERT INTO public.races_points VALUES (147, 4, 63, 48);
INSERT INTO public.races_points VALUES (148, 4, 71, 48);
INSERT INTO public.races_points VALUES (149, 2, 51, 49);
INSERT INTO public.races_points VALUES (150, 1, 4, 50);
INSERT INTO public.races_points VALUES (151, 1, 19, 50);
INSERT INTO public.races_points VALUES (152, 1, 69, 50);
INSERT INTO public.races_points VALUES (153, 0, 7, 51);
INSERT INTO public.races_points VALUES (154, 0, 15, 51);
INSERT INTO public.races_points VALUES (155, 0, 28, 51);
INSERT INTO public.races_points VALUES (156, 0, 31, 51);
INSERT INTO public.races_points VALUES (157, 0, 6, 52);
INSERT INTO public.races_points VALUES (158, 0, 10, 52);
INSERT INTO public.races_points VALUES (159, 0, 22, 52);
INSERT INTO public.races_points VALUES (160, 0, 24, 52);
INSERT INTO public.races_points VALUES (161, 0, 35, 52);
INSERT INTO public.races_points VALUES (162, 0, 60, 52);
INSERT INTO public.races_points VALUES (163, 0, 40, 53);
INSERT INTO public.races_points VALUES (164, 0, 54, 53);
INSERT INTO public.races_points VALUES (165, 0, 61, 56);
INSERT INTO public.races_points VALUES (166, 0, 64, 56);
INSERT INTO public.races_points VALUES (167, 0, 41, 57);
INSERT INTO public.races_points VALUES (168, -2, 59, 58);
INSERT INTO public.races_points VALUES (169, -2, 66, 58);
INSERT INTO public.races_points VALUES (170, -2, 18, 59);
INSERT INTO public.races_points VALUES (171, -2, 30, 59);
INSERT INTO public.races_points VALUES (172, -2, 27, 60);
INSERT INTO public.races_points VALUES (173, -2, 48, 60);
INSERT INTO public.races_points VALUES (174, -2, 65, 60);
INSERT INTO public.races_points VALUES (175, 25, 2, 61);
INSERT INTO public.races_points VALUES (176, 25, 9, 61);
INSERT INTO public.races_points VALUES (177, 25, 20, 61);
INSERT INTO public.races_points VALUES (178, 25, 46, 61);
INSERT INTO public.races_points VALUES (179, 25, 50, 61);
INSERT INTO public.races_points VALUES (180, 25, 53, 61);
INSERT INTO public.races_points VALUES (181, 25, 68, 61);
INSERT INTO public.races_points VALUES (182, 25, 99, 61);
INSERT INTO public.races_points VALUES (183, 18, 23, 62);
INSERT INTO public.races_points VALUES (184, 18, 55, 62);
INSERT INTO public.races_points VALUES (185, 18, 57, 62);
INSERT INTO public.races_points VALUES (186, 18, 73, 62);
INSERT INTO public.races_points VALUES (187, 18, 94, 62);
INSERT INTO public.races_points VALUES (188, 15, 48, 63);
INSERT INTO public.races_points VALUES (189, 15, 65, 63);
INSERT INTO public.races_points VALUES (190, 15, 96, 63);
INSERT INTO public.races_points VALUES (191, 12, 21, 64);
INSERT INTO public.races_points VALUES (192, 12, 25, 64);
INSERT INTO public.races_points VALUES (193, 12, 36, 64);
INSERT INTO public.races_points VALUES (194, 12, 74, 64);
INSERT INTO public.races_points VALUES (195, 12, 83, 64);
INSERT INTO public.races_points VALUES (196, 12, 87, 64);
INSERT INTO public.races_points VALUES (197, 12, 93, 64);
INSERT INTO public.races_points VALUES (198, 10, 6, 65);
INSERT INTO public.races_points VALUES (199, 10, 10, 65);
INSERT INTO public.races_points VALUES (200, 10, 22, 65);
INSERT INTO public.races_points VALUES (201, 10, 24, 65);
INSERT INTO public.races_points VALUES (202, 10, 35, 65);
INSERT INTO public.races_points VALUES (203, 10, 60, 65);
INSERT INTO public.races_points VALUES (204, 10, 75, 65);
INSERT INTO public.races_points VALUES (205, 10, 88, 65);
INSERT INTO public.races_points VALUES (206, 10, 92, 65);
INSERT INTO public.races_points VALUES (207, 8, 13, 66);
INSERT INTO public.races_points VALUES (208, 8, 32, 66);
INSERT INTO public.races_points VALUES (209, 8, 58, 66);
INSERT INTO public.races_points VALUES (210, 6, 37, 67);
INSERT INTO public.races_points VALUES (211, 6, 44, 67);
INSERT INTO public.races_points VALUES (212, 6, 47, 67);
INSERT INTO public.races_points VALUES (213, 5, 59, 68);
INSERT INTO public.races_points VALUES (214, 5, 66, 68);
INSERT INTO public.races_points VALUES (215, 5, 97, 68);
INSERT INTO public.races_points VALUES (216, 2, 38, 69);
INSERT INTO public.races_points VALUES (217, 1, 4, 70);
INSERT INTO public.races_points VALUES (218, 1, 19, 70);
INSERT INTO public.races_points VALUES (219, 1, 69, 70);
INSERT INTO public.races_points VALUES (220, 1, 90, 70);
INSERT INTO public.races_points VALUES (221, 0, 29, 71);
INSERT INTO public.races_points VALUES (222, 0, 52, 71);
INSERT INTO public.races_points VALUES (223, 0, 63, 71);
INSERT INTO public.races_points VALUES (224, 0, 98, 71);
INSERT INTO public.races_points VALUES (225, 0, 18, 72);
INSERT INTO public.races_points VALUES (226, 0, 30, 72);
INSERT INTO public.races_points VALUES (227, 0, 41, 73);
INSERT INTO public.races_points VALUES (228, 0, 77, 73);
INSERT INTO public.races_points VALUES (229, 0, 40, 74);
INSERT INTO public.races_points VALUES (230, 0, 54, 74);
INSERT INTO public.races_points VALUES (231, 0, 89, 74);
INSERT INTO public.races_points VALUES (232, 0, 84, 75);
INSERT INTO public.races_points VALUES (233, 0, 64, 76);
INSERT INTO public.races_points VALUES (234, 0, 85, 76);
INSERT INTO public.races_points VALUES (235, 0, 91, 76);
INSERT INTO public.races_points VALUES (236, 0, 16, 77);
INSERT INTO public.races_points VALUES (237, 0, 26, 77);
INSERT INTO public.races_points VALUES (238, 0, 7, 78);
INSERT INTO public.races_points VALUES (239, 0, 15, 78);
INSERT INTO public.races_points VALUES (240, 0, 31, 78);
INSERT INTO public.races_points VALUES (241, 0, 100, 78);
INSERT INTO public.races_points VALUES (242, -2, 51, 79);
INSERT INTO public.races_points VALUES (243, -2, 86, 79);
INSERT INTO public.races_points VALUES (244, 26, 23, 81);
INSERT INTO public.races_points VALUES (245, 26, 55, 81);
INSERT INTO public.races_points VALUES (246, 26, 57, 81);
INSERT INTO public.races_points VALUES (247, 26, 73, 81);
INSERT INTO public.races_points VALUES (248, 26, 94, 81);
INSERT INTO public.races_points VALUES (249, 18, 2, 82);
INSERT INTO public.races_points VALUES (250, 18, 9, 82);
INSERT INTO public.races_points VALUES (251, 18, 20, 82);
INSERT INTO public.races_points VALUES (252, 18, 46, 82);
INSERT INTO public.races_points VALUES (253, 18, 50, 82);
INSERT INTO public.races_points VALUES (254, 18, 53, 82);
INSERT INTO public.races_points VALUES (255, 18, 68, 82);
INSERT INTO public.races_points VALUES (256, 18, 99, 82);
INSERT INTO public.races_points VALUES (257, 15, 21, 83);
INSERT INTO public.races_points VALUES (258, 15, 25, 83);
INSERT INTO public.races_points VALUES (259, 15, 36, 83);
INSERT INTO public.races_points VALUES (260, 15, 74, 83);
INSERT INTO public.races_points VALUES (261, 15, 83, 83);
INSERT INTO public.races_points VALUES (262, 15, 87, 83);
INSERT INTO public.races_points VALUES (263, 15, 93, 83);
INSERT INTO public.races_points VALUES (264, 12, 59, 84);
INSERT INTO public.races_points VALUES (265, 12, 66, 84);
INSERT INTO public.races_points VALUES (266, 12, 97, 84);
INSERT INTO public.races_points VALUES (267, 10, 6, 85);
INSERT INTO public.races_points VALUES (268, 10, 10, 85);
INSERT INTO public.races_points VALUES (269, 10, 22, 85);
INSERT INTO public.races_points VALUES (270, 10, 24, 85);
INSERT INTO public.races_points VALUES (271, 10, 35, 85);
INSERT INTO public.races_points VALUES (272, 10, 60, 85);
INSERT INTO public.races_points VALUES (273, 10, 75, 85);
INSERT INTO public.races_points VALUES (274, 10, 88, 85);
INSERT INTO public.races_points VALUES (275, 10, 92, 85);
INSERT INTO public.races_points VALUES (276, 8, 13, 86);
INSERT INTO public.races_points VALUES (277, 8, 32, 86);
INSERT INTO public.races_points VALUES (278, 8, 58, 86);
INSERT INTO public.races_points VALUES (279, 6, 48, 87);
INSERT INTO public.races_points VALUES (280, 6, 65, 87);
INSERT INTO public.races_points VALUES (281, 6, 96, 87);
INSERT INTO public.races_points VALUES (282, 4, 40, 88);
INSERT INTO public.races_points VALUES (283, 4, 54, 88);
INSERT INTO public.races_points VALUES (284, 4, 89, 88);
INSERT INTO public.races_points VALUES (285, 2, 84, 89);
INSERT INTO public.races_points VALUES (286, 1, 41, 90);
INSERT INTO public.races_points VALUES (287, 1, 77, 90);
INSERT INTO public.races_points VALUES (288, 0, 4, 91);
INSERT INTO public.races_points VALUES (289, 0, 19, 91);
INSERT INTO public.races_points VALUES (290, 0, 69, 91);
INSERT INTO public.races_points VALUES (291, 0, 90, 91);
INSERT INTO public.races_points VALUES (292, 0, 37, 92);
INSERT INTO public.races_points VALUES (293, 0, 44, 92);
INSERT INTO public.races_points VALUES (294, 0, 47, 92);
INSERT INTO public.races_points VALUES (295, 0, 7, 93);
INSERT INTO public.races_points VALUES (296, 0, 15, 93);
INSERT INTO public.races_points VALUES (297, 0, 31, 93);
INSERT INTO public.races_points VALUES (298, 0, 100, 93);
INSERT INTO public.races_points VALUES (299, 0, 18, 94);
INSERT INTO public.races_points VALUES (300, 0, 30, 94);
INSERT INTO public.races_points VALUES (301, 0, 16, 95);
INSERT INTO public.races_points VALUES (302, 0, 26, 95);
INSERT INTO public.races_points VALUES (303, 0, 51, 96);
INSERT INTO public.races_points VALUES (304, 0, 86, 96);
INSERT INTO public.races_points VALUES (305, 0, 38, 97);
INSERT INTO public.races_points VALUES (306, 0, 29, 99);
INSERT INTO public.races_points VALUES (307, 0, 52, 99);
INSERT INTO public.races_points VALUES (308, 0, 63, 99);
INSERT INTO public.races_points VALUES (309, 0, 98, 99);
INSERT INTO public.races_points VALUES (310, 0, 64, 100);
INSERT INTO public.races_points VALUES (311, 0, 85, 100);
INSERT INTO public.races_points VALUES (312, 0, 91, 100);
INSERT INTO public.races_points VALUES (313, 25, 23, 101);
INSERT INTO public.races_points VALUES (314, 25, 55, 101);
INSERT INTO public.races_points VALUES (315, 25, 57, 101);
INSERT INTO public.races_points VALUES (316, 25, 73, 101);
INSERT INTO public.races_points VALUES (317, 25, 94, 101);
INSERT INTO public.races_points VALUES (318, 18, 21, 102);
INSERT INTO public.races_points VALUES (319, 18, 25, 102);
INSERT INTO public.races_points VALUES (320, 18, 36, 102);
INSERT INTO public.races_points VALUES (321, 18, 74, 102);
INSERT INTO public.races_points VALUES (322, 18, 83, 102);
INSERT INTO public.races_points VALUES (323, 18, 87, 102);
INSERT INTO public.races_points VALUES (324, 18, 93, 102);
INSERT INTO public.races_points VALUES (325, 15, 84, 103);
INSERT INTO public.races_points VALUES (326, 13, 13, 104);
INSERT INTO public.races_points VALUES (327, 13, 32, 104);
INSERT INTO public.races_points VALUES (328, 13, 58, 104);
INSERT INTO public.races_points VALUES (329, 10, 59, 105);
INSERT INTO public.races_points VALUES (330, 10, 66, 105);
INSERT INTO public.races_points VALUES (331, 10, 97, 105);
INSERT INTO public.races_points VALUES (332, 8, 48, 106);
INSERT INTO public.races_points VALUES (333, 8, 65, 106);
INSERT INTO public.races_points VALUES (334, 8, 96, 106);
INSERT INTO public.races_points VALUES (335, 6, 40, 107);
INSERT INTO public.races_points VALUES (336, 6, 54, 107);
INSERT INTO public.races_points VALUES (337, 6, 89, 107);
INSERT INTO public.races_points VALUES (338, 4, 6, 108);
INSERT INTO public.races_points VALUES (339, 4, 10, 108);
INSERT INTO public.races_points VALUES (340, 4, 22, 108);
INSERT INTO public.races_points VALUES (341, 4, 24, 108);
INSERT INTO public.races_points VALUES (342, 4, 35, 108);
INSERT INTO public.races_points VALUES (343, 4, 60, 108);
INSERT INTO public.races_points VALUES (344, 4, 75, 108);
INSERT INTO public.races_points VALUES (345, 4, 88, 108);
INSERT INTO public.races_points VALUES (346, 4, 92, 108);
INSERT INTO public.races_points VALUES (347, 2, 38, 109);
INSERT INTO public.races_points VALUES (348, 1, 29, 110);
INSERT INTO public.races_points VALUES (349, 1, 52, 110);
INSERT INTO public.races_points VALUES (350, 1, 63, 110);
INSERT INTO public.races_points VALUES (351, 1, 98, 110);
INSERT INTO public.races_points VALUES (352, 0, 7, 111);
INSERT INTO public.races_points VALUES (353, 0, 15, 111);
INSERT INTO public.races_points VALUES (354, 0, 31, 111);
INSERT INTO public.races_points VALUES (355, 0, 100, 111);
INSERT INTO public.races_points VALUES (356, 0, 51, 113);
INSERT INTO public.races_points VALUES (357, 0, 86, 113);
INSERT INTO public.races_points VALUES (358, 0, 18, 114);
INSERT INTO public.races_points VALUES (359, 0, 30, 114);
INSERT INTO public.races_points VALUES (360, 0, 4, 115);
INSERT INTO public.races_points VALUES (361, 0, 19, 115);
INSERT INTO public.races_points VALUES (362, 0, 69, 115);
INSERT INTO public.races_points VALUES (363, 0, 90, 115);
INSERT INTO public.races_points VALUES (364, 0, 2, 116);
INSERT INTO public.races_points VALUES (365, 0, 9, 116);
INSERT INTO public.races_points VALUES (366, 0, 20, 116);
INSERT INTO public.races_points VALUES (367, 0, 46, 116);
INSERT INTO public.races_points VALUES (368, 0, 50, 116);
INSERT INTO public.races_points VALUES (369, 0, 53, 116);
INSERT INTO public.races_points VALUES (370, 0, 68, 116);
INSERT INTO public.races_points VALUES (371, 0, 99, 116);
INSERT INTO public.races_points VALUES (372, 0, 16, 117);
INSERT INTO public.races_points VALUES (373, 0, 26, 117);
INSERT INTO public.races_points VALUES (374, 0, 64, 118);
INSERT INTO public.races_points VALUES (375, 0, 85, 118);
INSERT INTO public.races_points VALUES (376, 0, 91, 118);
INSERT INTO public.races_points VALUES (377, -2, 41, 119);
INSERT INTO public.races_points VALUES (378, -2, 77, 119);
INSERT INTO public.races_points VALUES (379, -2, 37, 120);
INSERT INTO public.races_points VALUES (380, -2, 44, 120);
INSERT INTO public.races_points VALUES (381, -2, 47, 120);
INSERT INTO public.races_points VALUES (382, 26, 23, 121);
INSERT INTO public.races_points VALUES (383, 26, 55, 121);
INSERT INTO public.races_points VALUES (384, 26, 57, 121);
INSERT INTO public.races_points VALUES (385, 26, 73, 121);
INSERT INTO public.races_points VALUES (386, 26, 94, 121);
INSERT INTO public.races_points VALUES (387, 18, 13, 122);
INSERT INTO public.races_points VALUES (388, 18, 32, 122);
INSERT INTO public.races_points VALUES (389, 18, 58, 122);
INSERT INTO public.races_points VALUES (390, 18, 101, 122);
INSERT INTO public.races_points VALUES (391, 18, 103, 122);
INSERT INTO public.races_points VALUES (392, 15, 59, 123);
INSERT INTO public.races_points VALUES (393, 15, 66, 123);
INSERT INTO public.races_points VALUES (394, 15, 106, 123);
INSERT INTO public.races_points VALUES (395, 12, 2, 124);
INSERT INTO public.races_points VALUES (396, 12, 9, 124);
INSERT INTO public.races_points VALUES (397, 12, 20, 124);
INSERT INTO public.races_points VALUES (398, 12, 46, 124);
INSERT INTO public.races_points VALUES (399, 12, 50, 124);
INSERT INTO public.races_points VALUES (400, 12, 53, 124);
INSERT INTO public.races_points VALUES (401, 12, 68, 124);
INSERT INTO public.races_points VALUES (402, 12, 99, 124);
INSERT INTO public.races_points VALUES (403, 10, 10, 125);
INSERT INTO public.races_points VALUES (404, 10, 22, 125);
INSERT INTO public.races_points VALUES (405, 10, 24, 125);
INSERT INTO public.races_points VALUES (406, 10, 35, 125);
INSERT INTO public.races_points VALUES (407, 10, 60, 125);
INSERT INTO public.races_points VALUES (408, 10, 75, 125);
INSERT INTO public.races_points VALUES (409, 10, 88, 125);
INSERT INTO public.races_points VALUES (410, 10, 92, 125);
INSERT INTO public.races_points VALUES (411, 10, 107, 125);
INSERT INTO public.races_points VALUES (412, 8, 37, 126);
INSERT INTO public.races_points VALUES (413, 8, 44, 126);
INSERT INTO public.races_points VALUES (414, 8, 47, 126);
INSERT INTO public.races_points VALUES (415, 6, 21, 127);
INSERT INTO public.races_points VALUES (416, 6, 25, 127);
INSERT INTO public.races_points VALUES (417, 6, 36, 127);
INSERT INTO public.races_points VALUES (418, 6, 74, 127);
INSERT INTO public.races_points VALUES (419, 6, 83, 127);
INSERT INTO public.races_points VALUES (420, 6, 87, 127);
INSERT INTO public.races_points VALUES (421, 6, 93, 127);
INSERT INTO public.races_points VALUES (422, 4, 84, 128);
INSERT INTO public.races_points VALUES (423, 2, 51, 129);
INSERT INTO public.races_points VALUES (424, 2, 86, 129);
INSERT INTO public.races_points VALUES (425, 1, 40, 130);
INSERT INTO public.races_points VALUES (426, 1, 54, 130);
INSERT INTO public.races_points VALUES (427, 1, 89, 130);
INSERT INTO public.races_points VALUES (428, 0, 48, 131);
INSERT INTO public.races_points VALUES (429, 0, 65, 131);
INSERT INTO public.races_points VALUES (430, 0, 96, 131);
INSERT INTO public.races_points VALUES (431, 0, 4, 132);
INSERT INTO public.races_points VALUES (432, 0, 19, 132);
INSERT INTO public.races_points VALUES (433, 0, 69, 132);
INSERT INTO public.races_points VALUES (434, 0, 109, 132);
INSERT INTO public.races_points VALUES (435, 0, 29, 133);
INSERT INTO public.races_points VALUES (436, 0, 52, 133);
INSERT INTO public.races_points VALUES (437, 0, 63, 133);
INSERT INTO public.races_points VALUES (438, 0, 16, 135);
INSERT INTO public.races_points VALUES (439, 0, 26, 135);
INSERT INTO public.races_points VALUES (440, 0, 104, 135);
INSERT INTO public.races_points VALUES (441, 0, 18, 136);
INSERT INTO public.races_points VALUES (442, 0, 30, 136);
INSERT INTO public.races_points VALUES (443, 0, 38, 137);
INSERT INTO public.races_points VALUES (444, 0, 102, 137);
INSERT INTO public.races_points VALUES (445, 0, 108, 137);
INSERT INTO public.races_points VALUES (446, 0, 41, 138);
INSERT INTO public.races_points VALUES (447, 0, 77, 138);
INSERT INTO public.races_points VALUES (448, 0, 7, 139);
INSERT INTO public.races_points VALUES (449, 0, 15, 139);
INSERT INTO public.races_points VALUES (450, 0, 31, 139);
INSERT INTO public.races_points VALUES (451, 0, 64, 140);
INSERT INTO public.races_points VALUES (452, 0, 85, 140);
INSERT INTO public.races_points VALUES (453, 25, 23, 141);
INSERT INTO public.races_points VALUES (454, 25, 55, 141);
INSERT INTO public.races_points VALUES (455, 25, 57, 141);
INSERT INTO public.races_points VALUES (456, 25, 73, 141);
INSERT INTO public.races_points VALUES (457, 25, 94, 141);
INSERT INTO public.races_points VALUES (458, 18, 21, 142);
INSERT INTO public.races_points VALUES (459, 18, 25, 142);
INSERT INTO public.races_points VALUES (460, 18, 36, 142);
INSERT INTO public.races_points VALUES (461, 18, 74, 142);
INSERT INTO public.races_points VALUES (462, 18, 83, 142);
INSERT INTO public.races_points VALUES (463, 18, 87, 142);
INSERT INTO public.races_points VALUES (464, 18, 93, 142);
INSERT INTO public.races_points VALUES (465, 15, 13, 143);
INSERT INTO public.races_points VALUES (466, 15, 32, 143);
INSERT INTO public.races_points VALUES (467, 15, 58, 143);
INSERT INTO public.races_points VALUES (468, 15, 101, 143);
INSERT INTO public.races_points VALUES (469, 15, 103, 143);
INSERT INTO public.races_points VALUES (470, 12, 48, 144);
INSERT INTO public.races_points VALUES (471, 12, 65, 144);
INSERT INTO public.races_points VALUES (472, 12, 96, 144);
INSERT INTO public.races_points VALUES (473, 10, 10, 145);
INSERT INTO public.races_points VALUES (474, 10, 22, 145);
INSERT INTO public.races_points VALUES (475, 10, 24, 145);
INSERT INTO public.races_points VALUES (476, 10, 35, 145);
INSERT INTO public.races_points VALUES (477, 10, 60, 145);
INSERT INTO public.races_points VALUES (478, 10, 75, 145);
INSERT INTO public.races_points VALUES (479, 10, 88, 145);
INSERT INTO public.races_points VALUES (480, 10, 92, 145);
INSERT INTO public.races_points VALUES (481, 10, 107, 145);
INSERT INTO public.races_points VALUES (482, 9, 2, 146);
INSERT INTO public.races_points VALUES (483, 9, 9, 146);
INSERT INTO public.races_points VALUES (484, 9, 20, 146);
INSERT INTO public.races_points VALUES (485, 9, 46, 146);
INSERT INTO public.races_points VALUES (486, 9, 50, 146);
INSERT INTO public.races_points VALUES (487, 9, 53, 146);
INSERT INTO public.races_points VALUES (488, 9, 68, 146);
INSERT INTO public.races_points VALUES (489, 9, 99, 146);
INSERT INTO public.races_points VALUES (490, 6, 18, 147);
INSERT INTO public.races_points VALUES (491, 6, 30, 147);
INSERT INTO public.races_points VALUES (492, 4, 84, 148);
INSERT INTO public.races_points VALUES (493, 2, 37, 149);
INSERT INTO public.races_points VALUES (494, 2, 44, 149);
INSERT INTO public.races_points VALUES (495, 2, 47, 149);
INSERT INTO public.races_points VALUES (496, 1, 7, 150);
INSERT INTO public.races_points VALUES (497, 1, 15, 150);
INSERT INTO public.races_points VALUES (498, 1, 31, 150);
INSERT INTO public.races_points VALUES (499, 0, 29, 151);
INSERT INTO public.races_points VALUES (500, 0, 52, 151);
INSERT INTO public.races_points VALUES (501, 0, 63, 151);
INSERT INTO public.races_points VALUES (502, 0, 40, 152);
INSERT INTO public.races_points VALUES (503, 0, 54, 152);
INSERT INTO public.races_points VALUES (504, 0, 89, 152);
INSERT INTO public.races_points VALUES (505, 0, 38, 153);
INSERT INTO public.races_points VALUES (506, 0, 102, 153);
INSERT INTO public.races_points VALUES (507, 0, 108, 153);
INSERT INTO public.races_points VALUES (508, 0, 4, 154);
INSERT INTO public.races_points VALUES (509, 0, 19, 154);
INSERT INTO public.races_points VALUES (510, 0, 69, 154);
INSERT INTO public.races_points VALUES (511, 0, 109, 154);
INSERT INTO public.races_points VALUES (512, 0, 16, 155);
INSERT INTO public.races_points VALUES (513, 0, 26, 155);
INSERT INTO public.races_points VALUES (514, 0, 104, 155);
INSERT INTO public.races_points VALUES (515, 0, 51, 156);
INSERT INTO public.races_points VALUES (516, 0, 86, 156);
INSERT INTO public.races_points VALUES (517, 0, 41, 157);
INSERT INTO public.races_points VALUES (518, 0, 77, 157);
INSERT INTO public.races_points VALUES (519, -2, 59, 159);
INSERT INTO public.races_points VALUES (520, -2, 66, 159);
INSERT INTO public.races_points VALUES (521, -2, 106, 159);
INSERT INTO public.races_points VALUES (522, -2, 64, 160);
INSERT INTO public.races_points VALUES (523, -2, 85, 160);
INSERT INTO public.races_points VALUES (524, 26, 23, 161);
INSERT INTO public.races_points VALUES (525, 26, 55, 161);
INSERT INTO public.races_points VALUES (526, 26, 57, 161);
INSERT INTO public.races_points VALUES (527, 26, 73, 161);
INSERT INTO public.races_points VALUES (528, 26, 94, 161);
INSERT INTO public.races_points VALUES (529, 18, 48, 162);
INSERT INTO public.races_points VALUES (530, 18, 65, 162);
INSERT INTO public.races_points VALUES (531, 18, 96, 162);
INSERT INTO public.races_points VALUES (532, 15, 2, 163);
INSERT INTO public.races_points VALUES (533, 15, 9, 163);
INSERT INTO public.races_points VALUES (534, 15, 20, 163);
INSERT INTO public.races_points VALUES (535, 15, 46, 163);
INSERT INTO public.races_points VALUES (536, 15, 50, 163);
INSERT INTO public.races_points VALUES (537, 15, 53, 163);
INSERT INTO public.races_points VALUES (538, 15, 68, 163);
INSERT INTO public.races_points VALUES (539, 15, 99, 163);
INSERT INTO public.races_points VALUES (540, 12, 38, 164);
INSERT INTO public.races_points VALUES (541, 12, 102, 164);
INSERT INTO public.races_points VALUES (542, 12, 108, 164);
INSERT INTO public.races_points VALUES (543, 10, 21, 165);
INSERT INTO public.races_points VALUES (544, 10, 25, 165);
INSERT INTO public.races_points VALUES (545, 10, 36, 165);
INSERT INTO public.races_points VALUES (546, 10, 74, 165);
INSERT INTO public.races_points VALUES (547, 10, 83, 165);
INSERT INTO public.races_points VALUES (548, 10, 87, 165);
INSERT INTO public.races_points VALUES (549, 10, 93, 165);
INSERT INTO public.races_points VALUES (550, 8, 10, 166);
INSERT INTO public.races_points VALUES (551, 8, 22, 166);
INSERT INTO public.races_points VALUES (552, 8, 24, 166);
INSERT INTO public.races_points VALUES (553, 8, 35, 166);
INSERT INTO public.races_points VALUES (554, 8, 60, 166);
INSERT INTO public.races_points VALUES (555, 8, 75, 166);
INSERT INTO public.races_points VALUES (556, 8, 88, 166);
INSERT INTO public.races_points VALUES (557, 8, 92, 166);
INSERT INTO public.races_points VALUES (558, 8, 107, 166);
INSERT INTO public.races_points VALUES (559, 6, 59, 167);
INSERT INTO public.races_points VALUES (560, 6, 66, 167);
INSERT INTO public.races_points VALUES (561, 6, 106, 167);
INSERT INTO public.races_points VALUES (562, 4, 13, 168);
INSERT INTO public.races_points VALUES (563, 4, 32, 168);
INSERT INTO public.races_points VALUES (564, 4, 58, 168);
INSERT INTO public.races_points VALUES (565, 4, 101, 168);
INSERT INTO public.races_points VALUES (566, 4, 103, 168);
INSERT INTO public.races_points VALUES (567, 2, 37, 169);
INSERT INTO public.races_points VALUES (568, 2, 44, 169);
INSERT INTO public.races_points VALUES (569, 2, 47, 169);
INSERT INTO public.races_points VALUES (570, 1, 40, 170);
INSERT INTO public.races_points VALUES (571, 1, 54, 170);
INSERT INTO public.races_points VALUES (572, 1, 89, 170);
INSERT INTO public.races_points VALUES (573, 0, 18, 171);
INSERT INTO public.races_points VALUES (574, 0, 30, 171);
INSERT INTO public.races_points VALUES (575, 0, 51, 172);
INSERT INTO public.races_points VALUES (576, 0, 86, 172);
INSERT INTO public.races_points VALUES (577, 0, 64, 173);
INSERT INTO public.races_points VALUES (578, 0, 85, 173);
INSERT INTO public.races_points VALUES (579, 0, 84, 174);
INSERT INTO public.races_points VALUES (580, 0, 7, 175);
INSERT INTO public.races_points VALUES (581, 0, 15, 175);
INSERT INTO public.races_points VALUES (582, 0, 31, 175);
INSERT INTO public.races_points VALUES (583, 0, 29, 176);
INSERT INTO public.races_points VALUES (584, 0, 52, 176);
INSERT INTO public.races_points VALUES (585, 0, 63, 176);
INSERT INTO public.races_points VALUES (586, 0, 41, 178);
INSERT INTO public.races_points VALUES (587, 0, 77, 178);
INSERT INTO public.races_points VALUES (588, 0, 4, 179);
INSERT INTO public.races_points VALUES (589, 0, 19, 179);
INSERT INTO public.races_points VALUES (590, 0, 69, 179);
INSERT INTO public.races_points VALUES (591, 0, 109, 179);
INSERT INTO public.races_points VALUES (592, -2, 16, 180);
INSERT INTO public.races_points VALUES (593, -2, 26, 180);
INSERT INTO public.races_points VALUES (594, -2, 104, 180);
INSERT INTO public.races_points VALUES (595, 26, 23, 181);
INSERT INTO public.races_points VALUES (596, 26, 55, 181);
INSERT INTO public.races_points VALUES (597, 26, 57, 181);
INSERT INTO public.races_points VALUES (598, 26, 73, 181);
INSERT INTO public.races_points VALUES (599, 26, 111, 181);
INSERT INTO public.races_points VALUES (600, 18, 38, 182);
INSERT INTO public.races_points VALUES (601, 18, 102, 182);
INSERT INTO public.races_points VALUES (602, 18, 115, 182);
INSERT INTO public.races_points VALUES (603, 15, 13, 183);
INSERT INTO public.races_points VALUES (604, 15, 32, 183);
INSERT INTO public.races_points VALUES (605, 15, 58, 183);
INSERT INTO public.races_points VALUES (606, 15, 101, 183);
INSERT INTO public.races_points VALUES (607, 15, 103, 183);
INSERT INTO public.races_points VALUES (608, 12, 29, 184);
INSERT INTO public.races_points VALUES (609, 12, 52, 184);
INSERT INTO public.races_points VALUES (610, 12, 63, 184);
INSERT INTO public.races_points VALUES (611, 10, 59, 185);
INSERT INTO public.races_points VALUES (612, 10, 66, 185);
INSERT INTO public.races_points VALUES (613, 10, 106, 185);
INSERT INTO public.races_points VALUES (614, 10, 110, 185);
INSERT INTO public.races_points VALUES (615, 8, 2, 186);
INSERT INTO public.races_points VALUES (616, 8, 9, 186);
INSERT INTO public.races_points VALUES (617, 8, 20, 186);
INSERT INTO public.races_points VALUES (618, 8, 46, 186);
INSERT INTO public.races_points VALUES (619, 8, 50, 186);
INSERT INTO public.races_points VALUES (620, 8, 53, 186);
INSERT INTO public.races_points VALUES (621, 8, 68, 186);
INSERT INTO public.races_points VALUES (622, 8, 113, 186);
INSERT INTO public.races_points VALUES (623, 6, 21, 187);
INSERT INTO public.races_points VALUES (624, 6, 25, 187);
INSERT INTO public.races_points VALUES (625, 6, 36, 187);
INSERT INTO public.races_points VALUES (626, 6, 74, 187);
INSERT INTO public.races_points VALUES (627, 6, 83, 187);
INSERT INTO public.races_points VALUES (628, 6, 87, 187);
INSERT INTO public.races_points VALUES (629, 6, 93, 187);
INSERT INTO public.races_points VALUES (630, 4, 18, 188);
INSERT INTO public.races_points VALUES (631, 4, 30, 188);
INSERT INTO public.races_points VALUES (632, 4, 114, 188);
INSERT INTO public.races_points VALUES (633, 2, 48, 189);
INSERT INTO public.races_points VALUES (634, 2, 65, 189);
INSERT INTO public.races_points VALUES (635, 1, 10, 190);
INSERT INTO public.races_points VALUES (636, 1, 22, 190);
INSERT INTO public.races_points VALUES (637, 1, 24, 190);
INSERT INTO public.races_points VALUES (638, 1, 35, 190);
INSERT INTO public.races_points VALUES (639, 1, 60, 190);
INSERT INTO public.races_points VALUES (640, 1, 75, 190);
INSERT INTO public.races_points VALUES (641, 1, 88, 190);
INSERT INTO public.races_points VALUES (642, 1, 92, 190);
INSERT INTO public.races_points VALUES (643, 1, 107, 190);
INSERT INTO public.races_points VALUES (644, 0, 64, 191);
INSERT INTO public.races_points VALUES (645, 0, 85, 191);
INSERT INTO public.races_points VALUES (646, 0, 7, 192);
INSERT INTO public.races_points VALUES (647, 0, 15, 192);
INSERT INTO public.races_points VALUES (648, 0, 31, 192);
INSERT INTO public.races_points VALUES (649, 0, 16, 193);
INSERT INTO public.races_points VALUES (650, 0, 26, 193);
INSERT INTO public.races_points VALUES (651, 0, 37, 194);
INSERT INTO public.races_points VALUES (652, 0, 44, 194);
INSERT INTO public.races_points VALUES (653, 0, 47, 194);
INSERT INTO public.races_points VALUES (654, 0, 51, 195);
INSERT INTO public.races_points VALUES (655, 0, 86, 195);
INSERT INTO public.races_points VALUES (656, 0, 4, 196);
INSERT INTO public.races_points VALUES (657, 0, 19, 196);
INSERT INTO public.races_points VALUES (658, 0, 69, 196);
INSERT INTO public.races_points VALUES (659, 0, 116, 196);
INSERT INTO public.races_points VALUES (660, 0, 40, 198);
INSERT INTO public.races_points VALUES (661, 0, 54, 198);
INSERT INTO public.races_points VALUES (662, 0, 89, 198);
INSERT INTO public.races_points VALUES (663, -2, 41, 199);
INSERT INTO public.races_points VALUES (664, -2, 77, 199);
INSERT INTO public.races_points VALUES (665, -2, 84, 200);
INSERT INTO public.races_points VALUES (666, 26, 23, 201);
INSERT INTO public.races_points VALUES (667, 26, 55, 201);
INSERT INTO public.races_points VALUES (668, 26, 57, 201);
INSERT INTO public.races_points VALUES (669, 26, 73, 201);
INSERT INTO public.races_points VALUES (670, 26, 111, 201);
INSERT INTO public.races_points VALUES (671, 18, 38, 202);
INSERT INTO public.races_points VALUES (672, 18, 102, 202);
INSERT INTO public.races_points VALUES (673, 18, 115, 202);
INSERT INTO public.races_points VALUES (674, 15, 2, 203);
INSERT INTO public.races_points VALUES (675, 15, 9, 203);
INSERT INTO public.races_points VALUES (676, 15, 20, 203);
INSERT INTO public.races_points VALUES (677, 15, 46, 203);
INSERT INTO public.races_points VALUES (678, 15, 50, 203);
INSERT INTO public.races_points VALUES (679, 15, 53, 203);
INSERT INTO public.races_points VALUES (680, 15, 68, 203);
INSERT INTO public.races_points VALUES (681, 15, 113, 203);
INSERT INTO public.races_points VALUES (682, 12, 13, 204);
INSERT INTO public.races_points VALUES (683, 12, 32, 204);
INSERT INTO public.races_points VALUES (684, 12, 58, 204);
INSERT INTO public.races_points VALUES (685, 12, 101, 204);
INSERT INTO public.races_points VALUES (686, 12, 103, 204);
INSERT INTO public.races_points VALUES (687, 10, 29, 205);
INSERT INTO public.races_points VALUES (688, 10, 52, 205);
INSERT INTO public.races_points VALUES (689, 10, 63, 205);
INSERT INTO public.races_points VALUES (690, 8, 59, 206);
INSERT INTO public.races_points VALUES (691, 8, 66, 206);
INSERT INTO public.races_points VALUES (692, 8, 106, 206);
INSERT INTO public.races_points VALUES (693, 8, 110, 206);
INSERT INTO public.races_points VALUES (694, 6, 48, 207);
INSERT INTO public.races_points VALUES (695, 6, 65, 207);
INSERT INTO public.races_points VALUES (696, 4, 10, 208);
INSERT INTO public.races_points VALUES (697, 4, 22, 208);
INSERT INTO public.races_points VALUES (698, 4, 24, 208);
INSERT INTO public.races_points VALUES (699, 4, 35, 208);
INSERT INTO public.races_points VALUES (700, 4, 60, 208);
INSERT INTO public.races_points VALUES (701, 4, 75, 208);
INSERT INTO public.races_points VALUES (702, 4, 88, 208);
INSERT INTO public.races_points VALUES (703, 4, 92, 208);
INSERT INTO public.races_points VALUES (704, 4, 107, 208);
INSERT INTO public.races_points VALUES (705, 2, 21, 209);
INSERT INTO public.races_points VALUES (706, 2, 25, 209);
INSERT INTO public.races_points VALUES (707, 2, 36, 209);
INSERT INTO public.races_points VALUES (708, 2, 74, 209);
INSERT INTO public.races_points VALUES (709, 2, 83, 209);
INSERT INTO public.races_points VALUES (710, 2, 87, 209);
INSERT INTO public.races_points VALUES (711, 2, 93, 209);
INSERT INTO public.races_points VALUES (712, 1, 37, 210);
INSERT INTO public.races_points VALUES (713, 1, 44, 210);
INSERT INTO public.races_points VALUES (714, 1, 47, 210);
INSERT INTO public.races_points VALUES (715, 0, 18, 211);
INSERT INTO public.races_points VALUES (716, 0, 30, 211);
INSERT INTO public.races_points VALUES (717, 0, 114, 211);
INSERT INTO public.races_points VALUES (718, 0, 7, 212);
INSERT INTO public.races_points VALUES (719, 0, 15, 212);
INSERT INTO public.races_points VALUES (720, 0, 31, 212);
INSERT INTO public.races_points VALUES (721, 0, 105, 213);
INSERT INTO public.races_points VALUES (722, 0, 16, 214);
INSERT INTO public.races_points VALUES (723, 0, 26, 214);
INSERT INTO public.races_points VALUES (724, 0, 4, 215);
INSERT INTO public.races_points VALUES (725, 0, 19, 215);
INSERT INTO public.races_points VALUES (726, 0, 69, 215);
INSERT INTO public.races_points VALUES (727, 0, 116, 215);
INSERT INTO public.races_points VALUES (728, 0, 51, 216);
INSERT INTO public.races_points VALUES (729, 0, 86, 216);
INSERT INTO public.races_points VALUES (730, 0, 41, 217);
INSERT INTO public.races_points VALUES (731, 0, 77, 217);
INSERT INTO public.races_points VALUES (732, -2, 64, 218);
INSERT INTO public.races_points VALUES (733, -2, 85, 218);
INSERT INTO public.races_points VALUES (734, -2, 84, 219);
INSERT INTO public.races_points VALUES (735, -2, 40, 220);
INSERT INTO public.races_points VALUES (736, -2, 54, 220);
INSERT INTO public.races_points VALUES (737, -2, 89, 220);
INSERT INTO public.races_points VALUES (738, 25, 23, 221);
INSERT INTO public.races_points VALUES (739, 25, 55, 221);
INSERT INTO public.races_points VALUES (740, 25, 57, 221);
INSERT INTO public.races_points VALUES (741, 25, 73, 221);
INSERT INTO public.races_points VALUES (742, 25, 111, 221);
INSERT INTO public.races_points VALUES (743, 18, 2, 222);
INSERT INTO public.races_points VALUES (744, 18, 9, 222);
INSERT INTO public.races_points VALUES (745, 18, 20, 222);
INSERT INTO public.races_points VALUES (746, 18, 46, 222);
INSERT INTO public.races_points VALUES (747, 18, 50, 222);
INSERT INTO public.races_points VALUES (748, 18, 53, 222);
INSERT INTO public.races_points VALUES (749, 18, 68, 222);
INSERT INTO public.races_points VALUES (750, 18, 113, 222);
INSERT INTO public.races_points VALUES (751, 15, 48, 223);
INSERT INTO public.races_points VALUES (752, 15, 65, 223);
INSERT INTO public.races_points VALUES (753, 13, 13, 224);
INSERT INTO public.races_points VALUES (754, 13, 32, 224);
INSERT INTO public.races_points VALUES (755, 13, 58, 224);
INSERT INTO public.races_points VALUES (756, 13, 101, 224);
INSERT INTO public.races_points VALUES (757, 13, 103, 224);
INSERT INTO public.races_points VALUES (758, 10, 21, 225);
INSERT INTO public.races_points VALUES (759, 10, 25, 225);
INSERT INTO public.races_points VALUES (760, 10, 36, 225);
INSERT INTO public.races_points VALUES (761, 10, 74, 225);
INSERT INTO public.races_points VALUES (762, 10, 83, 225);
INSERT INTO public.races_points VALUES (763, 10, 87, 225);
INSERT INTO public.races_points VALUES (764, 10, 93, 225);
INSERT INTO public.races_points VALUES (765, 8, 59, 226);
INSERT INTO public.races_points VALUES (766, 8, 66, 226);
INSERT INTO public.races_points VALUES (767, 8, 106, 226);
INSERT INTO public.races_points VALUES (768, 8, 110, 226);
INSERT INTO public.races_points VALUES (769, 6, 38, 227);
INSERT INTO public.races_points VALUES (770, 6, 102, 227);
INSERT INTO public.races_points VALUES (771, 6, 115, 227);
INSERT INTO public.races_points VALUES (772, 4, 84, 228);
INSERT INTO public.races_points VALUES (773, 2, 37, 229);
INSERT INTO public.races_points VALUES (774, 2, 44, 229);
INSERT INTO public.races_points VALUES (775, 2, 47, 229);
INSERT INTO public.races_points VALUES (776, 1, 4, 230);
INSERT INTO public.races_points VALUES (777, 1, 19, 230);
INSERT INTO public.races_points VALUES (778, 1, 69, 230);
INSERT INTO public.races_points VALUES (779, 1, 116, 230);
INSERT INTO public.races_points VALUES (780, 0, 40, 231);
INSERT INTO public.races_points VALUES (781, 0, 54, 231);
INSERT INTO public.races_points VALUES (782, 0, 89, 231);
INSERT INTO public.races_points VALUES (783, 0, 7, 232);
INSERT INTO public.races_points VALUES (784, 0, 15, 232);
INSERT INTO public.races_points VALUES (785, 0, 31, 232);
INSERT INTO public.races_points VALUES (786, 0, 51, 233);
INSERT INTO public.races_points VALUES (787, 0, 86, 233);
INSERT INTO public.races_points VALUES (788, 0, 18, 234);
INSERT INTO public.races_points VALUES (789, 0, 30, 234);
INSERT INTO public.races_points VALUES (790, 0, 114, 234);
INSERT INTO public.races_points VALUES (791, 0, 41, 235);
INSERT INTO public.races_points VALUES (792, 0, 77, 235);
INSERT INTO public.races_points VALUES (793, 0, 105, 236);
INSERT INTO public.races_points VALUES (794, 0, 64, 237);
INSERT INTO public.races_points VALUES (795, 0, 85, 237);
INSERT INTO public.races_points VALUES (796, 0, 16, 238);
INSERT INTO public.races_points VALUES (797, 0, 26, 238);
INSERT INTO public.races_points VALUES (798, -2, 10, 239);
INSERT INTO public.races_points VALUES (799, -2, 22, 239);
INSERT INTO public.races_points VALUES (800, -2, 24, 239);
INSERT INTO public.races_points VALUES (801, -2, 35, 239);
INSERT INTO public.races_points VALUES (802, -2, 60, 239);
INSERT INTO public.races_points VALUES (803, -2, 75, 239);
INSERT INTO public.races_points VALUES (804, -2, 88, 239);
INSERT INTO public.races_points VALUES (805, -2, 92, 239);
INSERT INTO public.races_points VALUES (806, -2, 107, 239);
INSERT INTO public.races_points VALUES (807, -2, 29, 240);
INSERT INTO public.races_points VALUES (808, -2, 52, 240);
INSERT INTO public.races_points VALUES (809, -2, 63, 240);
INSERT INTO public.races_points VALUES (810, 25, 23, 241);
INSERT INTO public.races_points VALUES (811, 25, 55, 241);
INSERT INTO public.races_points VALUES (812, 25, 57, 241);
INSERT INTO public.races_points VALUES (813, 25, 73, 241);
INSERT INTO public.races_points VALUES (814, 25, 111, 241);
INSERT INTO public.races_points VALUES (815, 19, 21, 242);
INSERT INTO public.races_points VALUES (816, 19, 25, 242);
INSERT INTO public.races_points VALUES (817, 19, 36, 242);
INSERT INTO public.races_points VALUES (818, 19, 74, 242);
INSERT INTO public.races_points VALUES (819, 19, 83, 242);
INSERT INTO public.races_points VALUES (820, 19, 87, 242);
INSERT INTO public.races_points VALUES (821, 19, 93, 242);
INSERT INTO public.races_points VALUES (822, 15, 40, 243);
INSERT INTO public.races_points VALUES (823, 15, 54, 243);
INSERT INTO public.races_points VALUES (824, 15, 89, 243);
INSERT INTO public.races_points VALUES (825, 12, 2, 244);
INSERT INTO public.races_points VALUES (826, 12, 9, 244);
INSERT INTO public.races_points VALUES (827, 12, 20, 244);
INSERT INTO public.races_points VALUES (828, 12, 46, 244);
INSERT INTO public.races_points VALUES (829, 12, 50, 244);
INSERT INTO public.races_points VALUES (830, 12, 53, 244);
INSERT INTO public.races_points VALUES (831, 12, 68, 244);
INSERT INTO public.races_points VALUES (832, 10, 10, 245);
INSERT INTO public.races_points VALUES (833, 10, 22, 245);
INSERT INTO public.races_points VALUES (834, 10, 24, 245);
INSERT INTO public.races_points VALUES (835, 10, 35, 245);
INSERT INTO public.races_points VALUES (836, 10, 60, 245);
INSERT INTO public.races_points VALUES (837, 10, 75, 245);
INSERT INTO public.races_points VALUES (838, 10, 88, 245);
INSERT INTO public.races_points VALUES (839, 10, 92, 245);
INSERT INTO public.races_points VALUES (840, 10, 107, 245);
INSERT INTO public.races_points VALUES (841, 8, 13, 246);
INSERT INTO public.races_points VALUES (842, 8, 32, 246);
INSERT INTO public.races_points VALUES (843, 8, 58, 246);
INSERT INTO public.races_points VALUES (844, 8, 101, 246);
INSERT INTO public.races_points VALUES (845, 8, 121, 246);
INSERT INTO public.races_points VALUES (846, 6, 38, 247);
INSERT INTO public.races_points VALUES (847, 6, 102, 247);
INSERT INTO public.races_points VALUES (848, 6, 120, 247);
INSERT INTO public.races_points VALUES (849, 4, 18, 248);
INSERT INTO public.races_points VALUES (850, 4, 30, 248);
INSERT INTO public.races_points VALUES (851, 2, 29, 249);
INSERT INTO public.races_points VALUES (852, 2, 52, 249);
INSERT INTO public.races_points VALUES (853, 2, 63, 249);
INSERT INTO public.races_points VALUES (854, 2, 117, 249);
INSERT INTO public.races_points VALUES (855, 1, 84, 250);
INSERT INTO public.races_points VALUES (856, 1, 119, 250);
INSERT INTO public.races_points VALUES (857, 0, 37, 251);
INSERT INTO public.races_points VALUES (858, 0, 44, 251);
INSERT INTO public.races_points VALUES (859, 0, 47, 251);
INSERT INTO public.races_points VALUES (860, 0, 16, 252);
INSERT INTO public.races_points VALUES (861, 0, 26, 252);
INSERT INTO public.races_points VALUES (862, 0, 56, 253);
INSERT INTO public.races_points VALUES (863, 0, 118, 253);
INSERT INTO public.races_points VALUES (864, 0, 7, 254);
INSERT INTO public.races_points VALUES (865, 0, 15, 254);
INSERT INTO public.races_points VALUES (866, 0, 31, 254);
INSERT INTO public.races_points VALUES (867, 0, 4, 255);
INSERT INTO public.races_points VALUES (868, 0, 19, 255);
INSERT INTO public.races_points VALUES (869, 0, 69, 255);
INSERT INTO public.races_points VALUES (870, 0, 116, 255);
INSERT INTO public.races_points VALUES (871, 0, 41, 256);
INSERT INTO public.races_points VALUES (872, 0, 77, 256);
INSERT INTO public.races_points VALUES (873, 0, 59, 257);
INSERT INTO public.races_points VALUES (874, 0, 66, 257);
INSERT INTO public.races_points VALUES (875, 0, 106, 257);
INSERT INTO public.races_points VALUES (876, -2, 51, 258);
INSERT INTO public.races_points VALUES (877, -2, 86, 258);
INSERT INTO public.races_points VALUES (878, -2, 48, 259);
INSERT INTO public.races_points VALUES (879, -2, 65, 259);
INSERT INTO public.races_points VALUES (880, -2, 64, 260);
INSERT INTO public.races_points VALUES (881, -2, 85, 260);
INSERT INTO public.races_points VALUES (882, 25, 23, 261);
INSERT INTO public.races_points VALUES (883, 25, 55, 261);
INSERT INTO public.races_points VALUES (884, 25, 57, 261);
INSERT INTO public.races_points VALUES (885, 25, 73, 261);
INSERT INTO public.races_points VALUES (886, 25, 111, 261);
INSERT INTO public.races_points VALUES (887, 18, 2, 262);
INSERT INTO public.races_points VALUES (888, 18, 9, 262);
INSERT INTO public.races_points VALUES (889, 18, 20, 262);
INSERT INTO public.races_points VALUES (890, 18, 46, 262);
INSERT INTO public.races_points VALUES (891, 18, 50, 262);
INSERT INTO public.races_points VALUES (892, 18, 53, 262);
INSERT INTO public.races_points VALUES (893, 18, 68, 262);
INSERT INTO public.races_points VALUES (894, 15, 10, 263);
INSERT INTO public.races_points VALUES (895, 15, 22, 263);
INSERT INTO public.races_points VALUES (896, 15, 24, 263);
INSERT INTO public.races_points VALUES (897, 15, 35, 263);
INSERT INTO public.races_points VALUES (898, 15, 60, 263);
INSERT INTO public.races_points VALUES (899, 15, 75, 263);
INSERT INTO public.races_points VALUES (900, 15, 88, 263);
INSERT INTO public.races_points VALUES (901, 15, 92, 263);
INSERT INTO public.races_points VALUES (902, 15, 107, 263);
INSERT INTO public.races_points VALUES (903, 12, 48, 264);
INSERT INTO public.races_points VALUES (904, 12, 65, 264);
INSERT INTO public.races_points VALUES (905, 10, 59, 265);
INSERT INTO public.races_points VALUES (906, 10, 66, 265);
INSERT INTO public.races_points VALUES (907, 10, 106, 265);
INSERT INTO public.races_points VALUES (908, 8, 13, 266);
INSERT INTO public.races_points VALUES (909, 8, 32, 266);
INSERT INTO public.races_points VALUES (910, 8, 58, 266);
INSERT INTO public.races_points VALUES (911, 8, 101, 266);
INSERT INTO public.races_points VALUES (912, 8, 121, 266);
INSERT INTO public.races_points VALUES (913, 6, 18, 267);
INSERT INTO public.races_points VALUES (914, 6, 30, 267);
INSERT INTO public.races_points VALUES (915, 4, 38, 268);
INSERT INTO public.races_points VALUES (916, 4, 102, 268);
INSERT INTO public.races_points VALUES (917, 4, 120, 268);
INSERT INTO public.races_points VALUES (918, 2, 21, 269);
INSERT INTO public.races_points VALUES (919, 2, 25, 269);
INSERT INTO public.races_points VALUES (920, 2, 36, 269);
INSERT INTO public.races_points VALUES (921, 2, 74, 269);
INSERT INTO public.races_points VALUES (922, 2, 83, 269);
INSERT INTO public.races_points VALUES (923, 2, 87, 269);
INSERT INTO public.races_points VALUES (924, 2, 93, 269);
INSERT INTO public.races_points VALUES (925, 1, 7, 270);
INSERT INTO public.races_points VALUES (926, 1, 15, 270);
INSERT INTO public.races_points VALUES (927, 1, 31, 270);
INSERT INTO public.races_points VALUES (928, 0, 56, 271);
INSERT INTO public.races_points VALUES (929, 0, 118, 271);
INSERT INTO public.races_points VALUES (930, 0, 29, 272);
INSERT INTO public.races_points VALUES (931, 0, 52, 272);
INSERT INTO public.races_points VALUES (932, 0, 63, 272);
INSERT INTO public.races_points VALUES (933, 0, 117, 272);
INSERT INTO public.races_points VALUES (934, 0, 64, 273);
INSERT INTO public.races_points VALUES (935, 0, 85, 273);
INSERT INTO public.races_points VALUES (936, 0, 51, 274);
INSERT INTO public.races_points VALUES (937, 0, 86, 274);
INSERT INTO public.races_points VALUES (938, 0, 40, 275);
INSERT INTO public.races_points VALUES (939, 0, 54, 275);
INSERT INTO public.races_points VALUES (940, 0, 89, 275);
INSERT INTO public.races_points VALUES (941, 0, 37, 276);
INSERT INTO public.races_points VALUES (942, 0, 44, 276);
INSERT INTO public.races_points VALUES (943, 0, 47, 276);
INSERT INTO public.races_points VALUES (944, 0, 16, 277);
INSERT INTO public.races_points VALUES (945, 0, 26, 277);
INSERT INTO public.races_points VALUES (946, 0, 41, 278);
INSERT INTO public.races_points VALUES (947, 0, 77, 278);
INSERT INTO public.races_points VALUES (948, -2, 84, 279);
INSERT INTO public.races_points VALUES (949, -2, 119, 279);
INSERT INTO public.races_points VALUES (950, -2, 4, 280);
INSERT INTO public.races_points VALUES (951, -2, 19, 280);
INSERT INTO public.races_points VALUES (952, -2, 69, 280);
INSERT INTO public.races_points VALUES (953, -2, 116, 280);
INSERT INTO public.races_points VALUES (954, 25, 10, 281);
INSERT INTO public.races_points VALUES (955, 25, 22, 281);
INSERT INTO public.races_points VALUES (956, 25, 24, 281);
INSERT INTO public.races_points VALUES (957, 25, 35, 281);
INSERT INTO public.races_points VALUES (958, 25, 60, 281);
INSERT INTO public.races_points VALUES (959, 25, 75, 281);
INSERT INTO public.races_points VALUES (960, 25, 88, 281);
INSERT INTO public.races_points VALUES (961, 25, 92, 281);
INSERT INTO public.races_points VALUES (962, 25, 107, 281);
INSERT INTO public.races_points VALUES (963, 18, 38, 282);
INSERT INTO public.races_points VALUES (964, 18, 102, 282);
INSERT INTO public.races_points VALUES (965, 18, 120, 282);
INSERT INTO public.races_points VALUES (966, 16, 13, 283);
INSERT INTO public.races_points VALUES (967, 16, 32, 283);
INSERT INTO public.races_points VALUES (968, 16, 58, 283);
INSERT INTO public.races_points VALUES (969, 16, 101, 283);
INSERT INTO public.races_points VALUES (970, 16, 121, 283);
INSERT INTO public.races_points VALUES (971, 12, 48, 284);
INSERT INTO public.races_points VALUES (972, 12, 65, 284);
INSERT INTO public.races_points VALUES (973, 10, 23, 285);
INSERT INTO public.races_points VALUES (974, 10, 55, 285);
INSERT INTO public.races_points VALUES (975, 10, 57, 285);
INSERT INTO public.races_points VALUES (976, 10, 73, 285);
INSERT INTO public.races_points VALUES (977, 10, 111, 285);
INSERT INTO public.races_points VALUES (978, 8, 40, 286);
INSERT INTO public.races_points VALUES (979, 8, 54, 286);
INSERT INTO public.races_points VALUES (980, 8, 89, 286);
INSERT INTO public.races_points VALUES (981, 6, 29, 287);
INSERT INTO public.races_points VALUES (982, 6, 52, 287);
INSERT INTO public.races_points VALUES (983, 6, 63, 287);
INSERT INTO public.races_points VALUES (984, 6, 117, 287);
INSERT INTO public.races_points VALUES (985, 4, 2, 288);
INSERT INTO public.races_points VALUES (986, 4, 9, 288);
INSERT INTO public.races_points VALUES (987, 4, 20, 288);
INSERT INTO public.races_points VALUES (988, 4, 46, 288);
INSERT INTO public.races_points VALUES (989, 4, 50, 288);
INSERT INTO public.races_points VALUES (990, 4, 53, 288);
INSERT INTO public.races_points VALUES (991, 4, 68, 288);
INSERT INTO public.races_points VALUES (992, 2, 56, 289);
INSERT INTO public.races_points VALUES (993, 2, 118, 289);
INSERT INTO public.races_points VALUES (994, 1, 41, 290);
INSERT INTO public.races_points VALUES (995, 1, 77, 290);
INSERT INTO public.races_points VALUES (996, 0, 18, 291);
INSERT INTO public.races_points VALUES (997, 0, 30, 291);
INSERT INTO public.races_points VALUES (998, 0, 51, 292);
INSERT INTO public.races_points VALUES (999, 0, 86, 292);
INSERT INTO public.races_points VALUES (1000, 0, 16, 293);
INSERT INTO public.races_points VALUES (1001, 0, 26, 293);
INSERT INTO public.races_points VALUES (1002, 0, 64, 294);
INSERT INTO public.races_points VALUES (1003, 0, 85, 294);
INSERT INTO public.races_points VALUES (1004, 0, 21, 295);
INSERT INTO public.races_points VALUES (1005, 0, 25, 295);
INSERT INTO public.races_points VALUES (1006, 0, 36, 295);
INSERT INTO public.races_points VALUES (1007, 0, 74, 295);
INSERT INTO public.races_points VALUES (1008, 0, 83, 295);
INSERT INTO public.races_points VALUES (1009, 0, 87, 295);
INSERT INTO public.races_points VALUES (1010, 0, 93, 295);
INSERT INTO public.races_points VALUES (1011, 0, 59, 296);
INSERT INTO public.races_points VALUES (1012, 0, 66, 296);
INSERT INTO public.races_points VALUES (1013, 0, 106, 296);
INSERT INTO public.races_points VALUES (1014, -2, 7, 297);
INSERT INTO public.races_points VALUES (1015, -2, 15, 297);
INSERT INTO public.races_points VALUES (1016, -2, 31, 297);
INSERT INTO public.races_points VALUES (1017, -2, 84, 298);
INSERT INTO public.races_points VALUES (1018, -2, 119, 298);
INSERT INTO public.races_points VALUES (1019, -2, 4, 299);
INSERT INTO public.races_points VALUES (1020, -2, 19, 299);
INSERT INTO public.races_points VALUES (1021, -2, 69, 299);
INSERT INTO public.races_points VALUES (1022, -2, 116, 299);
INSERT INTO public.races_points VALUES (1023, -5, 37, 300);
INSERT INTO public.races_points VALUES (1024, -5, 44, 300);
INSERT INTO public.races_points VALUES (1025, -5, 47, 300);
INSERT INTO public.races_points VALUES (1026, 26, 23, 301);
INSERT INTO public.races_points VALUES (1027, 26, 55, 301);
INSERT INTO public.races_points VALUES (1028, 26, 57, 301);
INSERT INTO public.races_points VALUES (1029, 26, 73, 301);
INSERT INTO public.races_points VALUES (1030, 26, 111, 301);
INSERT INTO public.races_points VALUES (1031, 18, 38, 302);
INSERT INTO public.races_points VALUES (1032, 18, 102, 302);
INSERT INTO public.races_points VALUES (1033, 15, 29, 303);
INSERT INTO public.races_points VALUES (1034, 15, 52, 303);
INSERT INTO public.races_points VALUES (1035, 15, 63, 303);
INSERT INTO public.races_points VALUES (1036, 12, 48, 304);
INSERT INTO public.races_points VALUES (1037, 12, 65, 304);
INSERT INTO public.races_points VALUES (1038, 12, 124, 304);
INSERT INTO public.races_points VALUES (1039, 10, 13, 305);
INSERT INTO public.races_points VALUES (1040, 10, 32, 305);
INSERT INTO public.races_points VALUES (1041, 10, 58, 305);
INSERT INTO public.races_points VALUES (1042, 10, 101, 305);
INSERT INTO public.races_points VALUES (1043, 10, 121, 305);
INSERT INTO public.races_points VALUES (1044, 8, 10, 306);
INSERT INTO public.races_points VALUES (1045, 8, 22, 306);
INSERT INTO public.races_points VALUES (1046, 8, 24, 306);
INSERT INTO public.races_points VALUES (1047, 8, 35, 306);
INSERT INTO public.races_points VALUES (1048, 8, 60, 306);
INSERT INTO public.races_points VALUES (1049, 8, 75, 306);
INSERT INTO public.races_points VALUES (1050, 8, 88, 306);
INSERT INTO public.races_points VALUES (1051, 8, 92, 306);
INSERT INTO public.races_points VALUES (1052, 8, 107, 306);
INSERT INTO public.races_points VALUES (1053, 6, 59, 307);
INSERT INTO public.races_points VALUES (1054, 6, 66, 307);
INSERT INTO public.races_points VALUES (1055, 6, 106, 307);
INSERT INTO public.races_points VALUES (1056, 6, 123, 307);
INSERT INTO public.races_points VALUES (1057, 4, 21, 308);
INSERT INTO public.races_points VALUES (1058, 4, 25, 308);
INSERT INTO public.races_points VALUES (1059, 4, 36, 308);
INSERT INTO public.races_points VALUES (1060, 4, 74, 308);
INSERT INTO public.races_points VALUES (1061, 4, 83, 308);
INSERT INTO public.races_points VALUES (1062, 4, 87, 308);
INSERT INTO public.races_points VALUES (1063, 2, 84, 309);
INSERT INTO public.races_points VALUES (1064, 1, 40, 310);
INSERT INTO public.races_points VALUES (1065, 1, 54, 310);
INSERT INTO public.races_points VALUES (1066, 1, 89, 310);
INSERT INTO public.races_points VALUES (1067, 0, 56, 311);
INSERT INTO public.races_points VALUES (1068, 0, 4, 312);
INSERT INTO public.races_points VALUES (1069, 0, 19, 312);
INSERT INTO public.races_points VALUES (1070, 0, 69, 312);
INSERT INTO public.races_points VALUES (1071, 0, 127, 312);
INSERT INTO public.races_points VALUES (1072, 0, 51, 313);
INSERT INTO public.races_points VALUES (1073, 0, 86, 313);
INSERT INTO public.races_points VALUES (1074, 0, 16, 314);
INSERT INTO public.races_points VALUES (1075, 0, 26, 314);
INSERT INTO public.races_points VALUES (1076, 0, 41, 315);
INSERT INTO public.races_points VALUES (1077, 0, 77, 315);
INSERT INTO public.races_points VALUES (1078, -2, 18, 316);
INSERT INTO public.races_points VALUES (1079, -2, 30, 316);
INSERT INTO public.races_points VALUES (1080, -2, 64, 317);
INSERT INTO public.races_points VALUES (1081, -2, 85, 317);
INSERT INTO public.races_points VALUES (1082, -2, 126, 317);
INSERT INTO public.races_points VALUES (1083, -2, 37, 318);
INSERT INTO public.races_points VALUES (1084, -2, 44, 318);
INSERT INTO public.races_points VALUES (1085, -2, 47, 318);
INSERT INTO public.races_points VALUES (1086, -2, 2, 319);
INSERT INTO public.races_points VALUES (1087, -2, 9, 319);
INSERT INTO public.races_points VALUES (1088, -2, 20, 319);
INSERT INTO public.races_points VALUES (1089, -2, 46, 319);
INSERT INTO public.races_points VALUES (1090, -2, 50, 319);
INSERT INTO public.races_points VALUES (1091, -2, 53, 319);
INSERT INTO public.races_points VALUES (1092, -2, 68, 319);
INSERT INTO public.races_points VALUES (1093, -2, 125, 319);
INSERT INTO public.races_points VALUES (1094, -2, 7, 320);
INSERT INTO public.races_points VALUES (1095, -2, 15, 320);
INSERT INTO public.races_points VALUES (1096, -2, 31, 320);
INSERT INTO public.races_points VALUES (1097, -2, 122, 320);
INSERT INTO public.races_points VALUES (1098, 26, 23, 321);
INSERT INTO public.races_points VALUES (1099, 26, 55, 321);
INSERT INTO public.races_points VALUES (1100, 26, 57, 321);
INSERT INTO public.races_points VALUES (1101, 26, 73, 321);
INSERT INTO public.races_points VALUES (1102, 26, 111, 321);
INSERT INTO public.races_points VALUES (1103, 18, 29, 322);
INSERT INTO public.races_points VALUES (1104, 18, 52, 322);
INSERT INTO public.races_points VALUES (1105, 18, 63, 322);
INSERT INTO public.races_points VALUES (1106, 15, 38, 323);
INSERT INTO public.races_points VALUES (1107, 15, 102, 323);
INSERT INTO public.races_points VALUES (1108, 12, 59, 324);
INSERT INTO public.races_points VALUES (1109, 12, 66, 324);
INSERT INTO public.races_points VALUES (1110, 12, 106, 324);
INSERT INTO public.races_points VALUES (1111, 12, 123, 324);
INSERT INTO public.races_points VALUES (1112, 10, 48, 325);
INSERT INTO public.races_points VALUES (1113, 10, 65, 325);
INSERT INTO public.races_points VALUES (1114, 10, 124, 325);
INSERT INTO public.races_points VALUES (1115, 8, 21, 326);
INSERT INTO public.races_points VALUES (1116, 8, 25, 326);
INSERT INTO public.races_points VALUES (1117, 8, 36, 326);
INSERT INTO public.races_points VALUES (1118, 8, 74, 326);
INSERT INTO public.races_points VALUES (1119, 8, 83, 326);
INSERT INTO public.races_points VALUES (1120, 8, 87, 326);
INSERT INTO public.races_points VALUES (1121, 6, 84, 327);
INSERT INTO public.races_points VALUES (1122, 4, 7, 328);
INSERT INTO public.races_points VALUES (1123, 4, 15, 328);
INSERT INTO public.races_points VALUES (1124, 4, 31, 328);
INSERT INTO public.races_points VALUES (1125, 4, 122, 328);
INSERT INTO public.races_points VALUES (1126, 2, 51, 329);
INSERT INTO public.races_points VALUES (1127, 2, 86, 329);
INSERT INTO public.races_points VALUES (1128, 1, 2, 330);
INSERT INTO public.races_points VALUES (1129, 1, 9, 330);
INSERT INTO public.races_points VALUES (1130, 1, 20, 330);
INSERT INTO public.races_points VALUES (1131, 1, 46, 330);
INSERT INTO public.races_points VALUES (1132, 1, 50, 330);
INSERT INTO public.races_points VALUES (1133, 1, 53, 330);
INSERT INTO public.races_points VALUES (1134, 1, 68, 330);
INSERT INTO public.races_points VALUES (1135, 1, 125, 330);
INSERT INTO public.races_points VALUES (1136, 0, 37, 331);
INSERT INTO public.races_points VALUES (1137, 0, 44, 331);
INSERT INTO public.races_points VALUES (1138, 0, 47, 331);
INSERT INTO public.races_points VALUES (1139, 0, 40, 332);
INSERT INTO public.races_points VALUES (1140, 0, 54, 332);
INSERT INTO public.races_points VALUES (1141, 0, 89, 332);
INSERT INTO public.races_points VALUES (1142, 0, 18, 333);
INSERT INTO public.races_points VALUES (1143, 0, 30, 333);
INSERT INTO public.races_points VALUES (1144, 0, 41, 334);
INSERT INTO public.races_points VALUES (1145, 0, 77, 334);
INSERT INTO public.races_points VALUES (1146, 0, 4, 335);
INSERT INTO public.races_points VALUES (1147, 0, 19, 335);
INSERT INTO public.races_points VALUES (1148, 0, 69, 335);
INSERT INTO public.races_points VALUES (1149, 0, 127, 335);
INSERT INTO public.races_points VALUES (1150, 0, 16, 336);
INSERT INTO public.races_points VALUES (1151, 0, 26, 336);
INSERT INTO public.races_points VALUES (1152, 0, 56, 337);
INSERT INTO public.races_points VALUES (1153, -2, 64, 338);
INSERT INTO public.races_points VALUES (1154, -2, 85, 338);
INSERT INTO public.races_points VALUES (1155, -2, 126, 338);
INSERT INTO public.races_points VALUES (1156, -2, 13, 339);
INSERT INTO public.races_points VALUES (1157, -2, 32, 339);
INSERT INTO public.races_points VALUES (1158, -2, 58, 339);
INSERT INTO public.races_points VALUES (1159, -2, 101, 339);
INSERT INTO public.races_points VALUES (1160, -2, 121, 339);
INSERT INTO public.races_points VALUES (1161, -5, 10, 340);
INSERT INTO public.races_points VALUES (1162, -5, 22, 340);
INSERT INTO public.races_points VALUES (1163, -5, 24, 340);
INSERT INTO public.races_points VALUES (1164, -5, 35, 340);
INSERT INTO public.races_points VALUES (1165, -5, 60, 340);
INSERT INTO public.races_points VALUES (1166, -5, 75, 340);
INSERT INTO public.races_points VALUES (1167, -5, 88, 340);
INSERT INTO public.races_points VALUES (1168, -5, 92, 340);
INSERT INTO public.races_points VALUES (1169, -5, 107, 340);
INSERT INTO public.races_points VALUES (1170, 25, 23, 341);
INSERT INTO public.races_points VALUES (1171, 25, 55, 341);
INSERT INTO public.races_points VALUES (1172, 25, 57, 341);
INSERT INTO public.races_points VALUES (1173, 25, 73, 341);
INSERT INTO public.races_points VALUES (1174, 25, 111, 341);
INSERT INTO public.races_points VALUES (1175, 18, 38, 342);
INSERT INTO public.races_points VALUES (1176, 18, 102, 342);
INSERT INTO public.races_points VALUES (1177, 15, 10, 343);
INSERT INTO public.races_points VALUES (1178, 15, 22, 343);
INSERT INTO public.races_points VALUES (1179, 15, 24, 343);
INSERT INTO public.races_points VALUES (1180, 15, 35, 343);
INSERT INTO public.races_points VALUES (1181, 15, 60, 343);
INSERT INTO public.races_points VALUES (1182, 15, 75, 343);
INSERT INTO public.races_points VALUES (1183, 15, 88, 343);
INSERT INTO public.races_points VALUES (1184, 15, 92, 343);
INSERT INTO public.races_points VALUES (1185, 15, 107, 343);
INSERT INTO public.races_points VALUES (1186, 12, 2, 344);
INSERT INTO public.races_points VALUES (1187, 12, 9, 344);
INSERT INTO public.races_points VALUES (1188, 12, 20, 344);
INSERT INTO public.races_points VALUES (1189, 12, 46, 344);
INSERT INTO public.races_points VALUES (1190, 12, 50, 344);
INSERT INTO public.races_points VALUES (1191, 12, 53, 344);
INSERT INTO public.races_points VALUES (1192, 12, 68, 344);
INSERT INTO public.races_points VALUES (1193, 12, 125, 344);
INSERT INTO public.races_points VALUES (1194, 10, 59, 345);
INSERT INTO public.races_points VALUES (1195, 10, 66, 345);
INSERT INTO public.races_points VALUES (1196, 10, 106, 345);
INSERT INTO public.races_points VALUES (1197, 10, 123, 345);
INSERT INTO public.races_points VALUES (1198, 8, 40, 346);
INSERT INTO public.races_points VALUES (1199, 8, 54, 346);
INSERT INTO public.races_points VALUES (1200, 8, 89, 346);
INSERT INTO public.races_points VALUES (1201, 6, 37, 347);
INSERT INTO public.races_points VALUES (1202, 6, 44, 347);
INSERT INTO public.races_points VALUES (1203, 6, 47, 347);
INSERT INTO public.races_points VALUES (1204, 5, 4, 348);
INSERT INTO public.races_points VALUES (1205, 5, 19, 348);
INSERT INTO public.races_points VALUES (1206, 5, 69, 348);
INSERT INTO public.races_points VALUES (1207, 5, 127, 348);
INSERT INTO public.races_points VALUES (1208, 2, 18, 349);
INSERT INTO public.races_points VALUES (1209, 2, 30, 349);
INSERT INTO public.races_points VALUES (1210, 1, 64, 350);
INSERT INTO public.races_points VALUES (1211, 1, 85, 350);
INSERT INTO public.races_points VALUES (1212, 1, 126, 350);
INSERT INTO public.races_points VALUES (1213, 0, 16, 351);
INSERT INTO public.races_points VALUES (1214, 0, 26, 351);
INSERT INTO public.races_points VALUES (1215, 0, 7, 352);
INSERT INTO public.races_points VALUES (1216, 0, 15, 352);
INSERT INTO public.races_points VALUES (1217, 0, 31, 352);
INSERT INTO public.races_points VALUES (1218, 0, 122, 352);
INSERT INTO public.races_points VALUES (1219, 0, 51, 353);
INSERT INTO public.races_points VALUES (1220, 0, 86, 353);
INSERT INTO public.races_points VALUES (1221, 0, 41, 354);
INSERT INTO public.races_points VALUES (1222, 0, 77, 354);
INSERT INTO public.races_points VALUES (1223, 0, 105, 355);
INSERT INTO public.races_points VALUES (1224, -2, 21, 356);
INSERT INTO public.races_points VALUES (1225, -2, 25, 356);
INSERT INTO public.races_points VALUES (1226, -2, 36, 356);
INSERT INTO public.races_points VALUES (1227, -2, 74, 356);
INSERT INTO public.races_points VALUES (1228, -2, 83, 356);
INSERT INTO public.races_points VALUES (1229, -2, 87, 356);
INSERT INTO public.races_points VALUES (1230, -2, 29, 357);
INSERT INTO public.races_points VALUES (1231, -2, 52, 357);
INSERT INTO public.races_points VALUES (1232, -2, 63, 357);
INSERT INTO public.races_points VALUES (1233, -2, 84, 358);
INSERT INTO public.races_points VALUES (1242, 25, 23, 361);
INSERT INTO public.races_points VALUES (1243, 25, 55, 361);
INSERT INTO public.races_points VALUES (1244, 25, 57, 361);
INSERT INTO public.races_points VALUES (1245, 25, 73, 361);
INSERT INTO public.races_points VALUES (1246, 25, 111, 361);
INSERT INTO public.races_points VALUES (1247, 19, 13, 362);
INSERT INTO public.races_points VALUES (1248, 19, 32, 362);
INSERT INTO public.races_points VALUES (1249, 19, 58, 362);
INSERT INTO public.races_points VALUES (1250, 19, 101, 362);
INSERT INTO public.races_points VALUES (1251, 19, 121, 362);
INSERT INTO public.races_points VALUES (1252, 15, 48, 363);
INSERT INTO public.races_points VALUES (1253, 15, 65, 363);
INSERT INTO public.races_points VALUES (1254, 15, 124, 363);
INSERT INTO public.races_points VALUES (1255, 12, 10, 364);
INSERT INTO public.races_points VALUES (1256, 12, 22, 364);
INSERT INTO public.races_points VALUES (1257, 12, 24, 364);
INSERT INTO public.races_points VALUES (1258, 12, 35, 364);
INSERT INTO public.races_points VALUES (1259, 12, 60, 364);
INSERT INTO public.races_points VALUES (1260, 12, 75, 364);
INSERT INTO public.races_points VALUES (1261, 12, 88, 364);
INSERT INTO public.races_points VALUES (1262, 12, 92, 364);
INSERT INTO public.races_points VALUES (1263, 12, 107, 364);
INSERT INTO public.races_points VALUES (1264, 10, 38, 365);
INSERT INTO public.races_points VALUES (1265, 10, 102, 365);
INSERT INTO public.races_points VALUES (1266, 8, 59, 366);
INSERT INTO public.races_points VALUES (1267, 8, 66, 366);
INSERT INTO public.races_points VALUES (1268, 8, 106, 366);
INSERT INTO public.races_points VALUES (1269, 6, 105, 367);
INSERT INTO public.races_points VALUES (1270, 4, 29, 368);
INSERT INTO public.races_points VALUES (1271, 4, 52, 368);
INSERT INTO public.races_points VALUES (1272, 4, 63, 368);
INSERT INTO public.races_points VALUES (1273, 4, 129, 368);
INSERT INTO public.races_points VALUES (1274, 2, 18, 369);
INSERT INTO public.races_points VALUES (1275, 2, 30, 369);
INSERT INTO public.races_points VALUES (1276, 1, 84, 370);
INSERT INTO public.races_points VALUES (1277, 1, 128, 370);
INSERT INTO public.races_points VALUES (1278, 0, 40, 371);
INSERT INTO public.races_points VALUES (1279, 0, 54, 371);
INSERT INTO public.races_points VALUES (1280, 0, 89, 371);
INSERT INTO public.races_points VALUES (1281, 0, 4, 372);
INSERT INTO public.races_points VALUES (1282, 0, 19, 372);
INSERT INTO public.races_points VALUES (1283, 0, 69, 372);
INSERT INTO public.races_points VALUES (1284, 0, 127, 372);
INSERT INTO public.races_points VALUES (1285, 0, 16, 373);
INSERT INTO public.races_points VALUES (1286, 0, 26, 373);
INSERT INTO public.races_points VALUES (1287, 0, 51, 374);
INSERT INTO public.races_points VALUES (1288, 0, 86, 374);
INSERT INTO public.races_points VALUES (1289, 0, 7, 375);
INSERT INTO public.races_points VALUES (1290, 0, 15, 375);
INSERT INTO public.races_points VALUES (1291, 0, 31, 375);
INSERT INTO public.races_points VALUES (1292, 0, 64, 376);
INSERT INTO public.races_points VALUES (1293, 0, 85, 376);
INSERT INTO public.races_points VALUES (1294, 0, 126, 376);
INSERT INTO public.races_points VALUES (1295, 0, 37, 377);
INSERT INTO public.races_points VALUES (1235, -5, 32, 359);
INSERT INTO public.races_points VALUES (1236, -5, 58, 359);
INSERT INTO public.races_points VALUES (1237, -5, 101, 359);
INSERT INTO public.races_points VALUES (1238, -5, 121, 359);
INSERT INTO public.races_points VALUES (1239, -5, 48, 360);
INSERT INTO public.races_points VALUES (1240, -5, 65, 360);
INSERT INTO public.races_points VALUES (1241, -5, 124, 360);
INSERT INTO public.races_points VALUES (1296, 0, 44, 377);
INSERT INTO public.races_points VALUES (1297, 0, 47, 377);
INSERT INTO public.races_points VALUES (1298, -2, 21, 378);
INSERT INTO public.races_points VALUES (1299, -2, 25, 378);
INSERT INTO public.races_points VALUES (1300, -2, 36, 378);
INSERT INTO public.races_points VALUES (1301, -2, 74, 378);
INSERT INTO public.races_points VALUES (1302, -2, 83, 378);
INSERT INTO public.races_points VALUES (1303, -2, 87, 378);
INSERT INTO public.races_points VALUES (1304, -2, 41, 379);
INSERT INTO public.races_points VALUES (1305, -2, 77, 379);
INSERT INTO public.races_points VALUES (1306, -2, 2, 380);
INSERT INTO public.races_points VALUES (1307, -2, 9, 380);
INSERT INTO public.races_points VALUES (1308, -2, 20, 380);
INSERT INTO public.races_points VALUES (1309, -2, 46, 380);
INSERT INTO public.races_points VALUES (1310, -2, 50, 380);
INSERT INTO public.races_points VALUES (1311, -2, 53, 380);
INSERT INTO public.races_points VALUES (1312, -2, 68, 380);
INSERT INTO public.races_points VALUES (1313, -2, 125, 380);
INSERT INTO public.races_points VALUES (1314, 25, 23, 381);
INSERT INTO public.races_points VALUES (1315, 25, 55, 381);
INSERT INTO public.races_points VALUES (1316, 25, 57, 381);
INSERT INTO public.races_points VALUES (1317, 25, 73, 381);
INSERT INTO public.races_points VALUES (1318, 25, 111, 381);
INSERT INTO public.races_points VALUES (1319, 19, 38, 382);
INSERT INTO public.races_points VALUES (1320, 19, 102, 382);
INSERT INTO public.races_points VALUES (1321, 15, 21, 383);
INSERT INTO public.races_points VALUES (1322, 15, 25, 383);
INSERT INTO public.races_points VALUES (1323, 15, 36, 383);
INSERT INTO public.races_points VALUES (1324, 15, 74, 383);
INSERT INTO public.races_points VALUES (1325, 15, 83, 383);
INSERT INTO public.races_points VALUES (1326, 15, 87, 383);
INSERT INTO public.races_points VALUES (1327, 12, 2, 384);
INSERT INTO public.races_points VALUES (1328, 12, 9, 384);
INSERT INTO public.races_points VALUES (1329, 12, 20, 384);
INSERT INTO public.races_points VALUES (1330, 12, 46, 384);
INSERT INTO public.races_points VALUES (1331, 12, 50, 384);
INSERT INTO public.races_points VALUES (1332, 12, 53, 384);
INSERT INTO public.races_points VALUES (1333, 12, 68, 384);
INSERT INTO public.races_points VALUES (1334, 12, 125, 384);
INSERT INTO public.races_points VALUES (1335, 10, 37, 385);
INSERT INTO public.races_points VALUES (1336, 10, 44, 385);
INSERT INTO public.races_points VALUES (1337, 10, 47, 385);
INSERT INTO public.races_points VALUES (1338, 8, 10, 386);
INSERT INTO public.races_points VALUES (1339, 8, 22, 386);
INSERT INTO public.races_points VALUES (1340, 8, 24, 386);
INSERT INTO public.races_points VALUES (1341, 8, 35, 386);
INSERT INTO public.races_points VALUES (1342, 8, 60, 386);
INSERT INTO public.races_points VALUES (1343, 8, 75, 386);
INSERT INTO public.races_points VALUES (1344, 8, 88, 386);
INSERT INTO public.races_points VALUES (1345, 8, 92, 386);
INSERT INTO public.races_points VALUES (1346, 8, 107, 386);
INSERT INTO public.races_points VALUES (1347, 6, 40, 387);
INSERT INTO public.races_points VALUES (1348, 6, 54, 387);
INSERT INTO public.races_points VALUES (1349, 6, 89, 387);
INSERT INTO public.races_points VALUES (1350, 4, 13, 388);
INSERT INTO public.races_points VALUES (1351, 4, 32, 388);
INSERT INTO public.races_points VALUES (1352, 4, 58, 388);
INSERT INTO public.races_points VALUES (1353, 4, 101, 388);
INSERT INTO public.races_points VALUES (1354, 4, 121, 388);
INSERT INTO public.races_points VALUES (1355, 2, 4, 389);
INSERT INTO public.races_points VALUES (1356, 2, 19, 389);
INSERT INTO public.races_points VALUES (1357, 2, 69, 389);
INSERT INTO public.races_points VALUES (1358, 2, 127, 389);
INSERT INTO public.races_points VALUES (1359, 1, 84, 390);
INSERT INTO public.races_points VALUES (1360, 1, 128, 390);
INSERT INTO public.races_points VALUES (1361, 0, 64, 391);
INSERT INTO public.races_points VALUES (1362, 0, 85, 391);
INSERT INTO public.races_points VALUES (1363, 0, 126, 391);
INSERT INTO public.races_points VALUES (1364, 0, 16, 392);
INSERT INTO public.races_points VALUES (1365, 0, 26, 392);
INSERT INTO public.races_points VALUES (1366, 0, 105, 393);
INSERT INTO public.races_points VALUES (1367, 0, 29, 394);
INSERT INTO public.races_points VALUES (1368, 0, 52, 394);
INSERT INTO public.races_points VALUES (1369, 0, 63, 394);
INSERT INTO public.races_points VALUES (1370, 0, 129, 394);
INSERT INTO public.races_points VALUES (1371, -2, 59, 395);
INSERT INTO public.races_points VALUES (1372, -2, 66, 395);
INSERT INTO public.races_points VALUES (1373, -2, 106, 395);
INSERT INTO public.races_points VALUES (1374, -2, 7, 396);
INSERT INTO public.races_points VALUES (1375, -2, 15, 396);
INSERT INTO public.races_points VALUES (1376, -2, 31, 396);
INSERT INTO public.races_points VALUES (1377, -2, 51, 397);
INSERT INTO public.races_points VALUES (1378, -2, 86, 397);
INSERT INTO public.races_points VALUES (1379, -2, 41, 398);
INSERT INTO public.races_points VALUES (1380, -2, 77, 398);
INSERT INTO public.races_points VALUES (1381, -2, 18, 399);
INSERT INTO public.races_points VALUES (1382, -2, 30, 399);
INSERT INTO public.races_points VALUES (1383, -5, 48, 400);
INSERT INTO public.races_points VALUES (1384, -5, 65, 400);
INSERT INTO public.races_points VALUES (1385, -5, 124, 400);
INSERT INTO public.races_points VALUES (1386, 25, 23, 401);
INSERT INTO public.races_points VALUES (1387, 25, 55, 401);
INSERT INTO public.races_points VALUES (1388, 25, 57, 401);
INSERT INTO public.races_points VALUES (1389, 25, 73, 401);
INSERT INTO public.races_points VALUES (1390, 25, 131, 401);
INSERT INTO public.races_points VALUES (1391, 18, 48, 402);
INSERT INTO public.races_points VALUES (1392, 18, 65, 402);
INSERT INTO public.races_points VALUES (1393, 18, 124, 402);
INSERT INTO public.races_points VALUES (1394, 15, 2, 403);
INSERT INTO public.races_points VALUES (1395, 15, 9, 403);
INSERT INTO public.races_points VALUES (1396, 15, 20, 403);
INSERT INTO public.races_points VALUES (1397, 15, 46, 403);
INSERT INTO public.races_points VALUES (1398, 15, 50, 403);
INSERT INTO public.races_points VALUES (1399, 15, 53, 403);
INSERT INTO public.races_points VALUES (1400, 15, 68, 403);
INSERT INTO public.races_points VALUES (1401, 15, 125, 403);
INSERT INTO public.races_points VALUES (1402, 12, 84, 404);
INSERT INTO public.races_points VALUES (1403, 10, 37, 405);
INSERT INTO public.races_points VALUES (1404, 10, 44, 405);
INSERT INTO public.races_points VALUES (1405, 10, 47, 405);
INSERT INTO public.races_points VALUES (1406, 10, 135, 405);
INSERT INTO public.races_points VALUES (1407, 8, 10, 406);
INSERT INTO public.races_points VALUES (1408, 8, 22, 406);
INSERT INTO public.races_points VALUES (1409, 8, 24, 406);
INSERT INTO public.races_points VALUES (1410, 8, 35, 406);
INSERT INTO public.races_points VALUES (1411, 8, 60, 406);
INSERT INTO public.races_points VALUES (1412, 8, 75, 406);
INSERT INTO public.races_points VALUES (1413, 8, 88, 406);
INSERT INTO public.races_points VALUES (1414, 8, 92, 406);
INSERT INTO public.races_points VALUES (1415, 8, 107, 406);
INSERT INTO public.races_points VALUES (1416, 6, 13, 407);
INSERT INTO public.races_points VALUES (1417, 6, 32, 407);
INSERT INTO public.races_points VALUES (1418, 6, 58, 407);
INSERT INTO public.races_points VALUES (1419, 6, 101, 407);
INSERT INTO public.races_points VALUES (1420, 6, 121, 407);
INSERT INTO public.races_points VALUES (1421, 4, 59, 408);
INSERT INTO public.races_points VALUES (1422, 4, 66, 408);
INSERT INTO public.races_points VALUES (1423, 4, 106, 408);
INSERT INTO public.races_points VALUES (1424, 2, 21, 409);
INSERT INTO public.races_points VALUES (1425, 2, 25, 409);
INSERT INTO public.races_points VALUES (1426, 2, 36, 409);
INSERT INTO public.races_points VALUES (1427, 2, 74, 409);
INSERT INTO public.races_points VALUES (1428, 2, 83, 409);
INSERT INTO public.races_points VALUES (1429, 2, 87, 409);
INSERT INTO public.races_points VALUES (1430, 2, 132, 409);
INSERT INTO public.races_points VALUES (1431, 2, 29, 410);
INSERT INTO public.races_points VALUES (1432, 2, 52, 410);
INSERT INTO public.races_points VALUES (1433, 2, 63, 410);
INSERT INTO public.races_points VALUES (1434, 2, 134, 410);
INSERT INTO public.races_points VALUES (1435, 0, 40, 411);
INSERT INTO public.races_points VALUES (1436, 0, 54, 411);
INSERT INTO public.races_points VALUES (1437, 0, 89, 411);
INSERT INTO public.races_points VALUES (1438, 0, 18, 412);
INSERT INTO public.races_points VALUES (1439, 0, 30, 412);
INSERT INTO public.races_points VALUES (1440, 0, 41, 413);
INSERT INTO public.races_points VALUES (1441, 0, 77, 413);
INSERT INTO public.races_points VALUES (1442, 0, 51, 415);
INSERT INTO public.races_points VALUES (1443, 0, 86, 415);
INSERT INTO public.races_points VALUES (1444, 0, 64, 416);
INSERT INTO public.races_points VALUES (1445, 0, 85, 416);
INSERT INTO public.races_points VALUES (1446, 0, 7, 417);
INSERT INTO public.races_points VALUES (1447, 0, 15, 417);
INSERT INTO public.races_points VALUES (1448, 0, 31, 417);
INSERT INTO public.races_points VALUES (1449, 0, 4, 418);
INSERT INTO public.races_points VALUES (1450, 0, 19, 418);
INSERT INTO public.races_points VALUES (1451, 0, 69, 418);
INSERT INTO public.races_points VALUES (1452, 0, 127, 418);
INSERT INTO public.races_points VALUES (1453, 0, 16, 419);
INSERT INTO public.races_points VALUES (1454, 0, 26, 419);
INSERT INTO public.races_points VALUES (1455, 0, 133, 419);
INSERT INTO public.races_points VALUES (1456, -2, 38, 420);
INSERT INTO public.races_points VALUES (1457, -2, 102, 420);
INSERT INTO public.races_points VALUES (1234, -5, 13, 359);


--
-- TOC entry 3107 (class 0 OID 294429)
-- Dependencies: 226
-- Data for Name: results; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.results VALUES (1, 21, 1, 25, 1, '1');
INSERT INTO public.results VALUES (2, 13, 1, 18, 2, '2');
INSERT INTO public.results VALUES (3, 2, 1, 15, 3, '3');
INSERT INTO public.results VALUES (4, 17, 1, 12, 4, '4');
INSERT INTO public.results VALUES (5, 6, 1, 10, 5, '5');
INSERT INTO public.results VALUES (6, 19, 1, 8, 6, '6');
INSERT INTO public.results VALUES (7, 16, 1, 6, 7, '7');
INSERT INTO public.results VALUES (8, 3, 1, 4, 8, '8');
INSERT INTO public.results VALUES (9, 5, 1, 2, 9, '9');
INSERT INTO public.results VALUES (10, 1, 1, 1, 10, '10');
INSERT INTO public.results VALUES (11, 20, 1, 0, 11, '11');
INSERT INTO public.results VALUES (12, 18, 1, 0, 12, '12');
INSERT INTO public.results VALUES (13, 10, 1, 0, 13, '13');
INSERT INTO public.results VALUES (14, 4, 1, 0, 14, '14');
INSERT INTO public.results VALUES (15, 7, 1, 0, 15, '15');
INSERT INTO public.results VALUES (16, 22, 1, 0, 16, '16');
INSERT INTO public.results VALUES (17, 11, 1, 0, 17, '17');
INSERT INTO public.results VALUES (18, 12, 1, -2, 18, 'DNF');
INSERT INTO public.results VALUES (19, 9, 1, -2, 19, 'DNF');
INSERT INTO public.results VALUES (20, 14, 1, -2, 20, 'DNF');
INSERT INTO public.results VALUES (21, 13, 2, 25, 1, '1');
INSERT INTO public.results VALUES (22, 21, 2, 19, 2, '2');
INSERT INTO public.results VALUES (23, 2, 2, 15, 3, '3');
INSERT INTO public.results VALUES (24, 16, 2, 12, 4, '4');
INSERT INTO public.results VALUES (25, 6, 2, 10, 5, '5');
INSERT INTO public.results VALUES (26, 17, 2, 8, 6, '6');
INSERT INTO public.results VALUES (27, 9, 2, 6, 7, '7');
INSERT INTO public.results VALUES (28, 12, 2, 4, 8, '8');
INSERT INTO public.results VALUES (29, 5, 2, 2, 9, '9');
INSERT INTO public.results VALUES (30, 10, 2, 1, 10, '10');
INSERT INTO public.results VALUES (31, 20, 2, 0, 11, '11');
INSERT INTO public.results VALUES (32, 7, 2, 0, 12, '12');
INSERT INTO public.results VALUES (33, 22, 2, 0, 13, '13');
INSERT INTO public.results VALUES (34, 4, 2, 0, 14, '14');
INSERT INTO public.results VALUES (35, 14, 2, 0, 15, '15');
INSERT INTO public.results VALUES (36, 18, 2, 0, 16, '16');
INSERT INTO public.results VALUES (37, 11, 2, 0, 17, '17');
INSERT INTO public.results VALUES (38, 3, 2, 0, 18, '18');
INSERT INTO public.results VALUES (39, 1, 2, -2, 19, 'DNF');
INSERT INTO public.results VALUES (40, 19, 2, -2, 20, 'DNF');
INSERT INTO public.results VALUES (41, 21, 3, 25, 1, '1');
INSERT INTO public.results VALUES (42, 6, 3, 18, 2, '2');
INSERT INTO public.results VALUES (43, 2, 3, 15, 3, '3');
INSERT INTO public.results VALUES (44, 19, 3, 12, 4, '4');
INSERT INTO public.results VALUES (45, 13, 3, 11, 5, '5');
INSERT INTO public.results VALUES (46, 11, 3, 8, 6, '6');
INSERT INTO public.results VALUES (47, 7, 3, 6, 7, '7');
INSERT INTO public.results VALUES (48, 14, 3, 4, 8, '8');
INSERT INTO public.results VALUES (49, 22, 3, 2, 9, '9');
INSERT INTO public.results VALUES (50, 20, 3, 1, 10, '10');
INSERT INTO public.results VALUES (51, 3, 3, 0, 11, '11');
INSERT INTO public.results VALUES (52, 17, 3, 0, 12, '12');
INSERT INTO public.results VALUES (53, 5, 3, 0, 13, '13');
INSERT INTO public.results VALUES (54, 12, 3, 0, 14, '14');
INSERT INTO public.results VALUES (55, 4, 3, 0, 15, '15');
INSERT INTO public.results VALUES (56, 18, 3, 0, 16, '16');
INSERT INTO public.results VALUES (57, 10, 3, 0, 17, '17');
INSERT INTO public.results VALUES (58, 16, 3, -2, 18, 'DNF');
INSERT INTO public.results VALUES (59, 1, 3, -2, 19, 'DNF');
INSERT INTO public.results VALUES (60, 9, 3, -2, 20, 'DNF');
INSERT INTO public.results VALUES (61, 13, 4, 25, 1, '1');
INSERT INTO public.results VALUES (62, 21, 4, 18, 2, '2');
INSERT INTO public.results VALUES (63, 9, 4, 15, 3, '3');
INSERT INTO public.results VALUES (64, 2, 4, 12, 4, '4');
INSERT INTO public.results VALUES (65, 17, 4, 10, 5, '5');
INSERT INTO public.results VALUES (66, 6, 4, 8, 6, '6');
INSERT INTO public.results VALUES (67, 19, 4, 6, 7, '7');
INSERT INTO public.results VALUES (68, 16, 4, 5, 8, '8');
INSERT INTO public.results VALUES (69, 11, 4, 2, 9, '9');
INSERT INTO public.results VALUES (70, 20, 4, 1, 10, '10');
INSERT INTO public.results VALUES (71, 14, 4, 0, 11, '11');
INSERT INTO public.results VALUES (72, 1, 4, 0, 12, '12');
INSERT INTO public.results VALUES (73, 10, 4, 0, 13, '13');
INSERT INTO public.results VALUES (74, 5, 4, 0, 14, '14');
INSERT INTO public.results VALUES (75, 12, 4, 0, 15, '15');
INSERT INTO public.results VALUES (76, 18, 4, 0, 16, '16');
INSERT INTO public.results VALUES (77, 7, 4, 0, 17, '17');
INSERT INTO public.results VALUES (78, 3, 4, 0, 18, '18');
INSERT INTO public.results VALUES (79, 22, 4, -2, 19, 'DNF');
INSERT INTO public.results VALUES (80, 4, 4, -2, 20, 'DNF');
INSERT INTO public.results VALUES (81, 21, 5, 26, 1, '1');
INSERT INTO public.results VALUES (82, 13, 5, 18, 2, '2');
INSERT INTO public.results VALUES (83, 2, 5, 15, 3, '3');
INSERT INTO public.results VALUES (84, 16, 5, 12, 4, '4');
INSERT INTO public.results VALUES (85, 17, 5, 10, 5, '5');
INSERT INTO public.results VALUES (86, 6, 5, 8, 6, '6');
INSERT INTO public.results VALUES (87, 9, 5, 6, 7, '7');
INSERT INTO public.results VALUES (88, 5, 5, 4, 8, '8');
INSERT INTO public.results VALUES (89, 12, 5, 2, 9, '9');
INSERT INTO public.results VALUES (90, 10, 5, 1, 10, '10');
INSERT INTO public.results VALUES (91, 20, 5, 0, 11, '11');
INSERT INTO public.results VALUES (92, 19, 5, 0, 12, '12');
INSERT INTO public.results VALUES (93, 3, 5, 0, 13, '13');
INSERT INTO public.results VALUES (94, 1, 5, 0, 14, '14');
INSERT INTO public.results VALUES (95, 7, 5, 0, 15, '15');
INSERT INTO public.results VALUES (96, 22, 5, 0, 16, '16');
INSERT INTO public.results VALUES (97, 11, 5, 0, 17, '17');
INSERT INTO public.results VALUES (98, 4, 5, 0, 18, '18');
INSERT INTO public.results VALUES (99, 14, 5, 0, 19, '19');
INSERT INTO public.results VALUES (100, 18, 5, 0, 20, '20');
INSERT INTO public.results VALUES (101, 21, 6, 25, 1, '1');
INSERT INTO public.results VALUES (102, 2, 6, 18, 2, '2');
INSERT INTO public.results VALUES (103, 12, 6, 15, 3, '3');
INSERT INTO public.results VALUES (104, 6, 6, 13, 4, '4');
INSERT INTO public.results VALUES (105, 16, 6, 10, 5, '5');
INSERT INTO public.results VALUES (106, 9, 6, 8, 6, '6');
INSERT INTO public.results VALUES (107, 5, 6, 6, 7, '7');
INSERT INTO public.results VALUES (108, 17, 6, 4, 8, '8');
INSERT INTO public.results VALUES (109, 11, 6, 2, 9, '9');
INSERT INTO public.results VALUES (110, 14, 6, 1, 10, '10');
INSERT INTO public.results VALUES (111, 3, 6, 0, 11, '11');
INSERT INTO public.results VALUES (112, 4, 6, 0, 12, '12');
INSERT INTO public.results VALUES (113, 22, 6, 0, 13, '13');
INSERT INTO public.results VALUES (114, 1, 6, 0, 14, '14');
INSERT INTO public.results VALUES (115, 20, 6, 0, 15, '15');
INSERT INTO public.results VALUES (116, 13, 6, 0, 16, '16');
INSERT INTO public.results VALUES (117, 7, 6, 0, 17, '17');
INSERT INTO public.results VALUES (118, 18, 6, 0, 18, '18');
INSERT INTO public.results VALUES (119, 10, 6, -2, 19, 'DNF');
INSERT INTO public.results VALUES (120, 19, 6, -2, 20, 'DNF');
INSERT INTO public.results VALUES (121, 21, 7, 26, 1, '1');
INSERT INTO public.results VALUES (122, 6, 7, 18, 2, '2');
INSERT INTO public.results VALUES (123, 16, 7, 15, 3, '3');
INSERT INTO public.results VALUES (124, 13, 7, 12, 4, '4');
INSERT INTO public.results VALUES (125, 17, 7, 10, 5, '5');
INSERT INTO public.results VALUES (126, 19, 7, 8, 6, '6');
INSERT INTO public.results VALUES (127, 2, 7, 6, 7, '7');
INSERT INTO public.results VALUES (128, 12, 7, 4, 8, '8');
INSERT INTO public.results VALUES (129, 22, 7, 2, 9, '9');
INSERT INTO public.results VALUES (130, 5, 7, 1, 10, '10');
INSERT INTO public.results VALUES (131, 9, 7, 0, 11, '11');
INSERT INTO public.results VALUES (132, 20, 7, 0, 12, '12');
INSERT INTO public.results VALUES (133, 14, 7, 0, 13, '13');
INSERT INTO public.results VALUES (134, 4, 7, 0, 14, '14');
INSERT INTO public.results VALUES (135, 7, 7, 0, 15, '15');
INSERT INTO public.results VALUES (136, 1, 7, 0, 16, '16');
INSERT INTO public.results VALUES (137, 11, 7, 0, 17, '17');
INSERT INTO public.results VALUES (138, 10, 7, 0, 18, '18');
INSERT INTO public.results VALUES (139, 3, 7, 0, 19, '19');
INSERT INTO public.results VALUES (140, 18, 7, 0, 20, '20');
INSERT INTO public.results VALUES (141, 21, 8, 25, 1, '1');
INSERT INTO public.results VALUES (142, 2, 8, 18, 2, '2');
INSERT INTO public.results VALUES (143, 6, 8, 15, 3, '3');
INSERT INTO public.results VALUES (144, 9, 8, 12, 4, '4');
INSERT INTO public.results VALUES (145, 17, 8, 10, 5, '5');
INSERT INTO public.results VALUES (146, 13, 8, 9, 6, '6');
INSERT INTO public.results VALUES (147, 1, 8, 6, 7, '7');
INSERT INTO public.results VALUES (148, 12, 8, 4, 8, '8');
INSERT INTO public.results VALUES (149, 19, 8, 2, 9, '9');
INSERT INTO public.results VALUES (150, 3, 8, 1, 10, '10');
INSERT INTO public.results VALUES (151, 14, 8, 0, 11, '11');
INSERT INTO public.results VALUES (152, 5, 8, 0, 12, '12');
INSERT INTO public.results VALUES (153, 11, 8, 0, 13, '13');
INSERT INTO public.results VALUES (154, 20, 8, 0, 14, '14');
INSERT INTO public.results VALUES (155, 7, 8, 0, 15, '15');
INSERT INTO public.results VALUES (156, 22, 8, 0, 16, '16');
INSERT INTO public.results VALUES (157, 10, 8, 0, 17, '17');
INSERT INTO public.results VALUES (158, 4, 8, 0, 18, '18');
INSERT INTO public.results VALUES (159, 16, 8, -2, 19, 'DNF');
INSERT INTO public.results VALUES (160, 18, 8, -2, 20, 'DNF');
INSERT INTO public.results VALUES (161, 21, 9, 26, 1, '1');
INSERT INTO public.results VALUES (162, 9, 9, 18, 2, '2');
INSERT INTO public.results VALUES (163, 13, 9, 15, 3, '3');
INSERT INTO public.results VALUES (164, 11, 9, 12, 4, '4');
INSERT INTO public.results VALUES (165, 2, 9, 10, 5, '5');
INSERT INTO public.results VALUES (166, 17, 9, 8, 6, '6');
INSERT INTO public.results VALUES (167, 16, 9, 6, 7, '7');
INSERT INTO public.results VALUES (168, 6, 9, 4, 8, '8');
INSERT INTO public.results VALUES (169, 19, 9, 2, 9, '9');
INSERT INTO public.results VALUES (170, 5, 9, 1, 10, '10');
INSERT INTO public.results VALUES (171, 1, 9, 0, 11, '11');
INSERT INTO public.results VALUES (172, 22, 9, 0, 12, '12');
INSERT INTO public.results VALUES (173, 18, 9, 0, 13, '13');
INSERT INTO public.results VALUES (174, 12, 9, 0, 14, '14');
INSERT INTO public.results VALUES (175, 3, 9, 0, 15, '15');
INSERT INTO public.results VALUES (176, 14, 9, 0, 16, '16');
INSERT INTO public.results VALUES (177, 4, 9, 0, 17, '17');
INSERT INTO public.results VALUES (178, 10, 9, 0, 18, '18');
INSERT INTO public.results VALUES (179, 20, 9, 0, 19, '19');
INSERT INTO public.results VALUES (180, 7, 9, -2, 20, 'DNF');
INSERT INTO public.results VALUES (181, 21, 10, 26, 1, '1');
INSERT INTO public.results VALUES (182, 11, 10, 18, 2, '2');
INSERT INTO public.results VALUES (183, 6, 10, 15, 3, '3');
INSERT INTO public.results VALUES (184, 14, 10, 12, 4, '4');
INSERT INTO public.results VALUES (185, 16, 10, 10, 5, '5');
INSERT INTO public.results VALUES (186, 13, 10, 8, 6, '6');
INSERT INTO public.results VALUES (187, 2, 10, 6, 7, '7');
INSERT INTO public.results VALUES (188, 1, 10, 4, 8, '8');
INSERT INTO public.results VALUES (189, 9, 10, 2, 9, '9');
INSERT INTO public.results VALUES (190, 17, 10, 1, 10, '10');
INSERT INTO public.results VALUES (191, 18, 10, 0, 11, '11');
INSERT INTO public.results VALUES (192, 3, 10, 0, 12, '12');
INSERT INTO public.results VALUES (193, 7, 10, 0, 13, '13');
INSERT INTO public.results VALUES (194, 19, 10, 0, 14, '14');
INSERT INTO public.results VALUES (195, 22, 10, 0, 15, '15');
INSERT INTO public.results VALUES (196, 20, 10, 0, 16, '16');
INSERT INTO public.results VALUES (197, 4, 10, 0, 17, '17');
INSERT INTO public.results VALUES (198, 5, 10, 0, 18, '18');
INSERT INTO public.results VALUES (199, 10, 10, -2, 19, 'DNF');
INSERT INTO public.results VALUES (200, 12, 10, -2, 20, 'DNF');
INSERT INTO public.results VALUES (201, 21, 11, 26, 1, '1');
INSERT INTO public.results VALUES (202, 11, 11, 18, 2, '2');
INSERT INTO public.results VALUES (203, 13, 11, 15, 3, '3');
INSERT INTO public.results VALUES (204, 6, 11, 12, 4, '4');
INSERT INTO public.results VALUES (205, 14, 11, 10, 5, '5');
INSERT INTO public.results VALUES (206, 16, 11, 8, 6, '6');
INSERT INTO public.results VALUES (207, 9, 11, 6, 7, '7');
INSERT INTO public.results VALUES (208, 17, 11, 4, 8, '8');
INSERT INTO public.results VALUES (209, 2, 11, 2, 9, '9');
INSERT INTO public.results VALUES (210, 19, 11, 1, 10, '10');
INSERT INTO public.results VALUES (211, 1, 11, 0, 11, '11');
INSERT INTO public.results VALUES (212, 3, 11, 0, 12, '12');
INSERT INTO public.results VALUES (213, 15, 11, 0, 13, '13');
INSERT INTO public.results VALUES (214, 7, 11, 0, 14, '14');
INSERT INTO public.results VALUES (215, 20, 11, 0, 15, '15');
INSERT INTO public.results VALUES (216, 22, 11, 0, 16, '16');
INSERT INTO public.results VALUES (217, 10, 11, 0, 17, '17');
INSERT INTO public.results VALUES (218, 18, 11, -2, 18, 'DNF');
INSERT INTO public.results VALUES (219, 12, 11, -2, 19, 'DNF');
INSERT INTO public.results VALUES (220, 5, 11, -2, 20, 'DNF');
INSERT INTO public.results VALUES (221, 21, 12, 25, 1, '1');
INSERT INTO public.results VALUES (222, 13, 12, 18, 2, '2');
INSERT INTO public.results VALUES (223, 9, 12, 15, 3, '3');
INSERT INTO public.results VALUES (224, 6, 12, 13, 4, '4');
INSERT INTO public.results VALUES (225, 2, 12, 10, 5, '5');
INSERT INTO public.results VALUES (226, 16, 12, 8, 6, '6');
INSERT INTO public.results VALUES (227, 11, 12, 6, 7, '7');
INSERT INTO public.results VALUES (228, 12, 12, 4, 8, '8');
INSERT INTO public.results VALUES (229, 19, 12, 2, 9, '9');
INSERT INTO public.results VALUES (230, 20, 12, 1, 10, '10');
INSERT INTO public.results VALUES (231, 5, 12, 0, 11, '11');
INSERT INTO public.results VALUES (232, 3, 12, 0, 12, '12');
INSERT INTO public.results VALUES (233, 22, 12, 0, 13, '13');
INSERT INTO public.results VALUES (234, 1, 12, 0, 14, '14');
INSERT INTO public.results VALUES (235, 10, 12, 0, 15, '15');
INSERT INTO public.results VALUES (236, 15, 12, 0, 16, '16');
INSERT INTO public.results VALUES (237, 18, 12, 0, 17, '17');
INSERT INTO public.results VALUES (238, 7, 12, 0, 18, '18');
INSERT INTO public.results VALUES (239, 17, 12, -2, 19, 'DNF');
INSERT INTO public.results VALUES (240, 14, 12, -2, 20, 'DNF');
INSERT INTO public.results VALUES (241, 21, 13, 25, 1, '1');
INSERT INTO public.results VALUES (242, 2, 13, 19, 2, '2');
INSERT INTO public.results VALUES (243, 5, 13, 15, 3, '3');
INSERT INTO public.results VALUES (244, 13, 13, 12, 4, '4');
INSERT INTO public.results VALUES (245, 17, 13, 10, 5, '5');
INSERT INTO public.results VALUES (246, 6, 13, 8, 6, '6');
INSERT INTO public.results VALUES (247, 11, 13, 6, 7, '7');
INSERT INTO public.results VALUES (248, 1, 13, 4, 8, '8');
INSERT INTO public.results VALUES (249, 14, 13, 2, 9, '9');
INSERT INTO public.results VALUES (250, 12, 13, 1, 10, '10');
INSERT INTO public.results VALUES (251, 19, 13, 0, 11, '11');
INSERT INTO public.results VALUES (252, 7, 13, 0, 12, '12');
INSERT INTO public.results VALUES (253, 8, 13, 0, 13, '13');
INSERT INTO public.results VALUES (254, 3, 13, 0, 14, '14');
INSERT INTO public.results VALUES (255, 20, 13, 0, 15, '15');
INSERT INTO public.results VALUES (256, 10, 13, 0, 16, '16');
INSERT INTO public.results VALUES (257, 16, 13, 0, 17, '17');
INSERT INTO public.results VALUES (258, 22, 13, -2, 18, 'DNF');
INSERT INTO public.results VALUES (259, 9, 13, -2, 19, 'DNF');
INSERT INTO public.results VALUES (260, 18, 13, -2, 20, 'DNF');
INSERT INTO public.results VALUES (261, 21, 14, 25, 1, '1');
INSERT INTO public.results VALUES (262, 13, 14, 18, 2, '2');
INSERT INTO public.results VALUES (263, 17, 14, 15, 3, '3');
INSERT INTO public.results VALUES (264, 9, 14, 12, 4, '4');
INSERT INTO public.results VALUES (265, 16, 14, 10, 5, '5');
INSERT INTO public.results VALUES (266, 6, 14, 8, 6, '6');
INSERT INTO public.results VALUES (267, 1, 14, 6, 7, '7');
INSERT INTO public.results VALUES (268, 11, 14, 4, 8, '8');
INSERT INTO public.results VALUES (269, 2, 14, 2, 9, '9');
INSERT INTO public.results VALUES (270, 3, 14, 1, 10, '10');
INSERT INTO public.results VALUES (271, 8, 14, 0, 11, '11');
INSERT INTO public.results VALUES (272, 14, 14, 0, 12, '12');
INSERT INTO public.results VALUES (273, 18, 14, 0, 13, '13');
INSERT INTO public.results VALUES (274, 22, 14, 0, 14, '14');
INSERT INTO public.results VALUES (275, 5, 14, 0, 15, '15');
INSERT INTO public.results VALUES (276, 19, 14, 0, 16, '16');
INSERT INTO public.results VALUES (277, 7, 14, 0, 17, '17');
INSERT INTO public.results VALUES (278, 10, 14, 0, 18, '18');
INSERT INTO public.results VALUES (279, 12, 14, -2, 19, 'DNF');
INSERT INTO public.results VALUES (280, 20, 14, -2, 20, 'DNF');
INSERT INTO public.results VALUES (281, 17, 15, 25, 1, '1');
INSERT INTO public.results VALUES (282, 11, 15, 18, 2, '2');
INSERT INTO public.results VALUES (283, 6, 15, 16, 3, '3');
INSERT INTO public.results VALUES (284, 9, 15, 12, 4, '4');
INSERT INTO public.results VALUES (285, 21, 15, 10, 5, '5');
INSERT INTO public.results VALUES (286, 5, 15, 8, 6, '6');
INSERT INTO public.results VALUES (287, 14, 15, 6, 7, '7');
INSERT INTO public.results VALUES (288, 13, 15, 4, 8, '8');
INSERT INTO public.results VALUES (289, 8, 15, 2, 9, '9');
INSERT INTO public.results VALUES (290, 10, 15, 1, 10, '10');
INSERT INTO public.results VALUES (291, 1, 15, 0, 11, '11');
INSERT INTO public.results VALUES (292, 22, 15, 0, 12, '12');
INSERT INTO public.results VALUES (293, 7, 15, 0, 13, '13');
INSERT INTO public.results VALUES (294, 18, 15, 0, 14, '14');
INSERT INTO public.results VALUES (295, 2, 15, 0, 15, '15');
INSERT INTO public.results VALUES (296, 16, 15, 0, 16, '16');
INSERT INTO public.results VALUES (297, 3, 15, -2, 17, 'DNF');
INSERT INTO public.results VALUES (298, 12, 15, -2, 18, 'DNF');
INSERT INTO public.results VALUES (299, 20, 15, -2, 19, 'DNF');
INSERT INTO public.results VALUES (300, 19, 15, -5, 20, 'DNS');
INSERT INTO public.results VALUES (301, 21, 16, 26, 1, '1');
INSERT INTO public.results VALUES (302, 11, 16, 18, 2, '2');
INSERT INTO public.results VALUES (303, 14, 16, 15, 3, '3');
INSERT INTO public.results VALUES (304, 9, 16, 12, 4, '4');
INSERT INTO public.results VALUES (305, 6, 16, 10, 5, '5');
INSERT INTO public.results VALUES (306, 17, 16, 8, 6, '6');
INSERT INTO public.results VALUES (307, 16, 16, 6, 7, '7');
INSERT INTO public.results VALUES (308, 2, 16, 4, 8, '8');
INSERT INTO public.results VALUES (309, 12, 16, 2, 9, '9');
INSERT INTO public.results VALUES (310, 5, 16, 1, 10, '10');
INSERT INTO public.results VALUES (311, 8, 16, 0, 11, '11');
INSERT INTO public.results VALUES (312, 20, 16, 0, 12, '12');
INSERT INTO public.results VALUES (313, 22, 16, 0, 13, '13');
INSERT INTO public.results VALUES (314, 7, 16, 0, 14, '14');
INSERT INTO public.results VALUES (315, 10, 16, 0, 15, '15');
INSERT INTO public.results VALUES (316, 1, 16, -2, 16, 'DNF');
INSERT INTO public.results VALUES (317, 18, 16, -2, 17, 'DNF');
INSERT INTO public.results VALUES (318, 19, 16, -2, 18, 'DNF');
INSERT INTO public.results VALUES (319, 13, 16, -2, 19, 'DNF');
INSERT INTO public.results VALUES (320, 3, 16, -2, 20, 'DNF');
INSERT INTO public.results VALUES (321, 21, 17, 26, 1, '1');
INSERT INTO public.results VALUES (322, 14, 17, 18, 2, '2');
INSERT INTO public.results VALUES (323, 11, 17, 15, 3, '3');
INSERT INTO public.results VALUES (324, 16, 17, 12, 4, '4');
INSERT INTO public.results VALUES (325, 9, 17, 10, 5, '5');
INSERT INTO public.results VALUES (326, 2, 17, 8, 6, '6');
INSERT INTO public.results VALUES (327, 12, 17, 6, 7, '7');
INSERT INTO public.results VALUES (328, 3, 17, 4, 8, '8');
INSERT INTO public.results VALUES (329, 22, 17, 2, 9, '9');
INSERT INTO public.results VALUES (330, 13, 17, 1, 10, '10');
INSERT INTO public.results VALUES (331, 19, 17, 0, 11, '11');
INSERT INTO public.results VALUES (332, 5, 17, 0, 12, '12');
INSERT INTO public.results VALUES (333, 1, 17, 0, 13, '13');
INSERT INTO public.results VALUES (334, 10, 17, 0, 14, '14');
INSERT INTO public.results VALUES (335, 20, 17, 0, 15, '15');
INSERT INTO public.results VALUES (336, 7, 17, 0, 16, '16');
INSERT INTO public.results VALUES (337, 8, 17, 0, 17, '17');
INSERT INTO public.results VALUES (338, 18, 17, -2, 18, 'DNF');
INSERT INTO public.results VALUES (339, 6, 17, -2, 19, 'DNF');
INSERT INTO public.results VALUES (340, 17, 17, -5, 20, 'DNS');
INSERT INTO public.results VALUES (341, 21, 18, 25, 1, '1');
INSERT INTO public.results VALUES (342, 11, 18, 18, 2, '2');
INSERT INTO public.results VALUES (343, 17, 18, 15, 3, '3');
INSERT INTO public.results VALUES (344, 13, 18, 12, 4, '4');
INSERT INTO public.results VALUES (345, 16, 18, 10, 5, '5');
INSERT INTO public.results VALUES (346, 5, 18, 8, 6, '6');
INSERT INTO public.results VALUES (347, 19, 18, 6, 7, '7');
INSERT INTO public.results VALUES (348, 20, 18, 5, 8, '8');
INSERT INTO public.results VALUES (349, 1, 18, 2, 9, '9');
INSERT INTO public.results VALUES (350, 18, 18, 1, 10, '10');
INSERT INTO public.results VALUES (351, 7, 18, 0, 11, '11');
INSERT INTO public.results VALUES (352, 3, 18, 0, 12, '12');
INSERT INTO public.results VALUES (353, 22, 18, 0, 13, '13');
INSERT INTO public.results VALUES (354, 10, 18, 0, 14, '14');
INSERT INTO public.results VALUES (355, 15, 18, 0, 15, '15');
INSERT INTO public.results VALUES (356, 2, 18, -2, 16, 'DNF');
INSERT INTO public.results VALUES (357, 14, 18, -2, 17, 'DNF');
INSERT INTO public.results VALUES (358, 12, 18, -2, 18, 'DNF');
INSERT INTO public.results VALUES (361, 21, 19, 25, 1, '1');
INSERT INTO public.results VALUES (362, 6, 19, 19, 2, '2');
INSERT INTO public.results VALUES (363, 9, 19, 15, 3, '3');
INSERT INTO public.results VALUES (364, 17, 19, 12, 4, '4');
INSERT INTO public.results VALUES (365, 11, 19, 10, 5, '5');
INSERT INTO public.results VALUES (366, 16, 19, 8, 6, '6');
INSERT INTO public.results VALUES (367, 15, 19, 6, 7, '7');
INSERT INTO public.results VALUES (368, 14, 19, 4, 8, '8');
INSERT INTO public.results VALUES (369, 1, 19, 2, 9, '9');
INSERT INTO public.results VALUES (370, 12, 19, 1, 10, '10');
INSERT INTO public.results VALUES (371, 5, 19, 0, 11, '11');
INSERT INTO public.results VALUES (372, 20, 19, 0, 12, '12');
INSERT INTO public.results VALUES (373, 7, 19, 0, 13, '13');
INSERT INTO public.results VALUES (374, 22, 19, 0, 14, '14');
INSERT INTO public.results VALUES (375, 3, 19, 0, 15, '15');
INSERT INTO public.results VALUES (376, 18, 19, 0, 16, '16');
INSERT INTO public.results VALUES (377, 19, 19, 0, 17, '17');
INSERT INTO public.results VALUES (378, 2, 19, -2, 18, 'DNF');
INSERT INTO public.results VALUES (379, 10, 19, -2, 19, 'DNF');
INSERT INTO public.results VALUES (380, 13, 19, -2, 20, 'DNF');
INSERT INTO public.results VALUES (381, 21, 20, 25, 1, '1');
INSERT INTO public.results VALUES (382, 11, 20, 19, 2, '2');
INSERT INTO public.results VALUES (383, 2, 20, 15, 3, '3');
INSERT INTO public.results VALUES (384, 13, 20, 12, 4, '4');
INSERT INTO public.results VALUES (385, 19, 20, 10, 5, '5');
INSERT INTO public.results VALUES (386, 17, 20, 8, 6, '6');
INSERT INTO public.results VALUES (387, 5, 20, 6, 7, '7');
INSERT INTO public.results VALUES (388, 6, 20, 4, 8, '8');
INSERT INTO public.results VALUES (389, 20, 20, 2, 9, '9');
INSERT INTO public.results VALUES (390, 12, 20, 1, 10, '10');
INSERT INTO public.results VALUES (391, 18, 20, 0, 11, '11');
INSERT INTO public.results VALUES (392, 7, 20, 0, 12, '12');
INSERT INTO public.results VALUES (393, 15, 20, 0, 13, '13');
INSERT INTO public.results VALUES (394, 14, 20, 0, 14, '14');
INSERT INTO public.results VALUES (395, 16, 20, -2, 15, 'DNF');
INSERT INTO public.results VALUES (396, 3, 20, -2, 16, 'DNF');
INSERT INTO public.results VALUES (397, 22, 20, -2, 17, 'DNF');
INSERT INTO public.results VALUES (398, 10, 20, -2, 18, 'DNF');
INSERT INTO public.results VALUES (399, 1, 20, -2, 19, 'DNF');
INSERT INTO public.results VALUES (400, 9, 20, -5, 20, 'DNS');
INSERT INTO public.results VALUES (401, 21, 21, 25, 1, '1');
INSERT INTO public.results VALUES (402, 9, 21, 18, 2, '2');
INSERT INTO public.results VALUES (403, 13, 21, 15, 3, '3');
INSERT INTO public.results VALUES (404, 12, 21, 12, 4, '4');
INSERT INTO public.results VALUES (405, 19, 21, 10, 5, '5');
INSERT INTO public.results VALUES (406, 17, 21, 8, 6, '6');
INSERT INTO public.results VALUES (407, 6, 21, 6, 7, '7');
INSERT INTO public.results VALUES (408, 16, 21, 4, 8, '8');
INSERT INTO public.results VALUES (409, 2, 21, 2, 9, '9');
INSERT INTO public.results VALUES (410, 14, 21, 2, 10, '10');
INSERT INTO public.results VALUES (411, 5, 21, 0, 11, '11');
INSERT INTO public.results VALUES (412, 1, 21, 0, 12, '12');
INSERT INTO public.results VALUES (413, 10, 21, 0, 13, '13');
INSERT INTO public.results VALUES (414, 15, 21, 0, 14, '14');
INSERT INTO public.results VALUES (415, 22, 21, 0, 15, '15');
INSERT INTO public.results VALUES (416, 18, 21, 0, 16, '16');
INSERT INTO public.results VALUES (417, 3, 21, 0, 17, '17');
INSERT INTO public.results VALUES (418, 20, 21, 0, 18, '18');
INSERT INTO public.results VALUES (419, 7, 21, 0, 19, '19');
INSERT INTO public.results VALUES (420, 11, 21, -2, 20, 'DNF');
INSERT INTO public.results VALUES (359, 6, 18, -5, 19, 'DSQ');
INSERT INTO public.results VALUES (360, 9, 18, -5, 20, 'DSQ');


--
-- TOC entry 3099 (class 0 OID 292188)
-- Dependencies: 218
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.teams VALUES (1, 'Mercedes', 50000);
INSERT INTO public.teams VALUES (2, 'Alpine', 40000);
INSERT INTO public.teams VALUES (3, 'Haas', 20000);
INSERT INTO public.teams VALUES (4, 'McLaren', 40000);
INSERT INTO public.teams VALUES (5, 'Red Bull', 70000);
INSERT INTO public.teams VALUES (6, 'Aston Martin', 30000);
INSERT INTO public.teams VALUES (7, 'Alphatauri', 20000);
INSERT INTO public.teams VALUES (8, 'Ferrari', 50000);
INSERT INTO public.teams VALUES (9, 'Alfa Romeo', 30000);
INSERT INTO public.teams VALUES (10, 'Williams', 10000);


--
-- TOC entry 3093 (class 0 OID 291283)
-- Dependencies: 212
-- Data for Name: ti18n; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.ti18n VALUES (0, 'i18n.bundle', 'Resource bundle in database');


--
-- TOC entry 3091 (class 0 OID 291272)
-- Dependencies: 210
-- Data for Name: ti18n_value; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3079 (class 0 OID 291152)
-- Dependencies: 198
-- Data for Name: trole; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.trole VALUES (0, 'admin', '<?xml version="1.0" encoding="UTF-8"?><security></security>');


--
-- TOC entry 3085 (class 0 OID 291192)
-- Dependencies: 204
-- Data for Name: trole_server_permission; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.trole_server_permission VALUES (0, 0, 0);


--
-- TOC entry 3083 (class 0 OID 291181)
-- Dependencies: 202
-- Data for Name: tserver_permission; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tserver_permission VALUES (0, 'com.ontimize.jee.common.services.user.IUserInformationService/getUserInformation');


--
-- TOC entry 3087 (class 0 OID 291220)
-- Dependencies: 206
-- Data for Name: tsetting; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tsetting VALUES (0, 'mail_host', 'smtp.gmail.com', 'Host del servidor');
INSERT INTO public.tsetting VALUES (1, 'mail_port', '587', 'Puerto del servidor de email');
INSERT INTO public.tsetting VALUES (2, 'mail_protocol', 'smtp', 'Protocolo de env\u005cu00edo de mails');
INSERT INTO public.tsetting VALUES (3, 'mail_user', 'mi.mail@example.com', 'Usuario para el env\u005cu00edo de mails');
INSERT INTO public.tsetting VALUES (4, 'mail_password', 'mis_credenciales', 'Password del servidor de mail');
INSERT INTO public.tsetting VALUES (5, 'mail_encoding', 'UTF-8', 'Codificaci\u005cu00f3n de mails');
INSERT INTO public.tsetting VALUES (6, 'mail_properties', 'mail.smtp.auth:true;mail.smtp.starttls.enable:true;', 'Propiedades de mails');
INSERT INTO public.tsetting VALUES (7, 'report_folder', 'C:/applications/ontimize-boot-app/reports', 'Carpeta de las plantillas de report');


--
-- TOC entry 3077 (class 0 OID 291140)
-- Dependencies: 196
-- Data for Name: tuser; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tuser VALUES ('demo', 'demouser', 'demo', 'demo', NULL, '44460713B', NULL, NULL, NULL);
INSERT INTO public.tuser VALUES ('prueba', 'prueba', 'prueba', 'prueba', NULL, '44460713B', NULL, NULL, NULL);
INSERT INTO public.tuser VALUES ('german', '123', 'German', 'Seoane', 'dg@gmail.com', '4325532', NULL, '2023-09-29 10:04:14.253704', true);
INSERT INTO public.tuser VALUES ('pablo', '123', 'Pablo', 'Lopez', 'den@gmail.com', '124412', NULL, '2023-09-29 10:04:14.253704', true);
INSERT INTO public.tuser VALUES ('laura', '123', 'Laura', 'Machado', 'lau@gmail.com', '55564656p', NULL, '2023-09-29 10:04:14.253704', true);
INSERT INTO public.tuser VALUES ('peli', '123', 'Cesar', 'Seoane', 'peli@gmail.com', '432545532', NULL, '2023-09-29 10:06:36.928764', true);
INSERT INTO public.tuser VALUES ('lula', '123', 'Gaia', 'Sorre', 'lula@gmail.com', '1244122232', NULL, '2023-09-29 10:06:36.928764', true);
INSERT INTO public.tuser VALUES ('nani', '123', 'Cesar', 'Mango', 'nani@gmail.com', '5556234656p', NULL, '2023-09-29 10:06:36.928764', true);
INSERT INTO public.tuser VALUES ('paco', '123', 'Francisco', 'Ferradas Pacheco', 'paco@gmail.com', NULL, NULL, '2023-10-03 10:09:32.932939', true);
INSERT INTO public.tuser VALUES ('le', '123', 'Leticia', 'Prieto', 'leticia@gmail.com', NULL, NULL, '2023-10-03 13:20:47.223125', true);
INSERT INTO public.tuser VALUES ('pepa', '123', 'Pepa', 'Borbón', 'pepa@gmail.com', NULL, NULL, '2023-10-19 14:21:10.316769', true);
INSERT INTO public.tuser VALUES ('david', '123', NULL, NULL, NULL, NULL, NULL, '2023-11-10 09:59:26.868374', true);
INSERT INTO public.tuser VALUES ('lola', '123', NULL, NULL, 'loga@gmail.com', NULL, NULL, '2023-11-17 09:00:50.690316', true);
INSERT INTO public.tuser VALUES ('Sandra', '123', NULL, NULL, 'sandra@gmail.com', NULL, NULL, '2023-11-17 09:23:20.046794', true);
INSERT INTO public.tuser VALUES ('Alberto', '123', NULL, NULL, 'd@gmail.com', NULL, NULL, '2023-11-17 10:08:01.76278', true);
INSERT INTO public.tuser VALUES ('DavidBootcamp', '123', NULL, NULL, 'davis@gmail.com', NULL, NULL, '2023-11-20 08:49:06.907311', true);
INSERT INTO public.tuser VALUES ('EDU', '123', NULL, NULL, 'edu@gmail.com', NULL, NULL, '2023-11-21 12:42:33.848366', true);
INSERT INTO public.tuser VALUES ('ALBA', '123', NULL, NULL, 'ALBA@GMAIL.COM', NULL, NULL, '2023-11-21 12:54:12.832007', true);
INSERT INTO public.tuser VALUES ('Dani', '123456', NULL, NULL, 'dani@gmail.com', NULL, NULL, '2023-11-22 09:04:41.1802', true);
INSERT INTO public.tuser VALUES ('ashahaha', '123', NULL, NULL, 'ahaha@ahaha.com', NULL, NULL, '2023-11-23 13:55:24.458316', true);
INSERT INTO public.tuser VALUES ('agagaga', '123', NULL, NULL, 'agagaga@gmail.com', NULL, NULL, '2023-11-23 13:56:04.761415', true);
INSERT INTO public.tuser VALUES ('alalala', '123', NULL, NULL, 'alalala@gmail.com', NULL, NULL, '2023-11-23 13:58:31.581545', true);
INSERT INTO public.tuser VALUES ('Fernando', '12345678', NULL, NULL, 'fernando@gmail.com', NULL, NULL, '2023-11-26 00:45:26.349928', true);
INSERT INTO public.tuser VALUES ('Beatriz', 'contrase', NULL, NULL, 'beatriz@gmail.com', NULL, NULL, '2023-11-27 13:17:46.214543', true);


--
-- TOC entry 3089 (class 0 OID 291243)
-- Dependencies: 208
-- Data for Name: tuser_preference; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tuser_preference VALUES (0, 'user_preference', 'demo', 'Iw0KI1R1ZSBNYXkgMTYgMTI6NTc6MDYgQ0VTVCAyMDE3DQpkZW1vX2FwcF9zdGF0dXNfYmFyX3Zpc2libGU9eWVzDQpkZW1vX2FkanVzdF90cmVlX3NwYWNlPXRydWUNCmRlbW9fYXBwX3dpbmRvd19zdGF0ZT0wDQpkZW1vX3RhYmxlX2NvbmZfc29ydF9maWx0ZXJfZm9ybUN1c3RvbWVyLnhtbF9DdXN0b21lclNlcnZpY2UuY3VzdG9tZXJfVEVTVD1udWxsO251bGw7U1VSTkFNRVw9OThcOjF8SURcPTc1XDoyfE5BTUVcPTk5XDozfENVU1RPTUVSVFlQRUlEXD0wXDo0fENVU1RPTUVSSURcPTEyNVw6NXxBRERSRVNTXD0xMjNcOjZ8UEhPTkVcPTEyMVw6N3xTVEFSVERBVEVcPTEzNlw6OHxMT05HSVRVREVcPTExNlw6OXxMQVRJVFVERVw9MTEzXDoxMHxFTUFJTFw9MTcwXDoxMnw7QkFTRTY0ck8wQUJYTnlBQk5xWVhaaExuVjBhV3d1U0dGemFIUmhZbXhsRTdzUEpTRks1TGdEQUFKR0FBcHNiMkZrUm1GamRHOXlTUUFKZEdoeVpYTm9iMnhrZUhBL1FBQUFBQUFBQ0hjSUFBQUFDd0FBQUFCNA0KZGVtb190YWJsZV9jb25mX3NvcnRfZmlsdGVyX2NvbmZpZ3VyYXRpb25zX2Zvcm1DdXN0b21lci54bWxfQ3VzdG9tZXJTZXJ2aWNlLmN1c3RvbWVyPVRFU1QNCmRlbW9fdGFibGVfY29udHJvbF9wYW5lbF9mb3JtQWNjb3VudHMtZGV0YWlsLnhtbF9Nb3ZlbWVudFNlcnZpY2UubW92ZW1lbnQ9Z3JvdXB0YWJsZWtleTtkZWZhdWx0Y2hhcnRidXR0b247ZXhjZWxleHBvcnRidXR0b247c3Vtcm93YnV0dG9uO2NhbGN1bGVkY29sc2J1dHRvbjtwcmludGluZ2J1dHRvbjtmaWx0ZXJzYXZlYnV0dG9uO3Zpc2libGVjb2xzYnV0dG9uO2h0bWxleHBvcnRidXR0b247Y29weWJ1dHRvbjtncm91cHRhYmxla2V5O2luc2VydGJ1dHRvbjtyZWZyZXNoYnV0dG9uDQpkZW1vX2Zvcm1CcmFuY2hlcy1kZXRhaWwueG1sPTg4MDs1MDU7LTExNTA7MzY5DQpkZW1vX2RldGFpbF9kaWFsb2dfc2l6ZV9wb3NpdGlvbl9mb3JtQ3VzdG9tZXIueG1sX0N1c3RvbWVyU2VydmljZS5jdXN0b21lcj03NDk7MzUwOy0xOTA1OzM5MQ0KZGVtb19hcHBfdG9vbGJhcl9sb2NhdGlvbj1Ob3J0aA0KZGVtb19hcHBfd2luZG93X3Bvc2l0aW9uPS0xNTgwOzExDQpkZW1vX2FwcF93aW5kb3dfc2l6ZT0xNTg0OzEwNDQNCmRlbW9fZm9ybUVtcGxveWVlcy1kZXRhaWwueG1sPTExMTY7NzM5OzYxMDsxOTUNCmRlbW9fZm9ybUFjY291bnRzLWRldGFpbC54bWw9OTE1OzUwMDstMTE1MDszNjkNCg==');


--
-- TOC entry 3081 (class 0 OID 291163)
-- Dependencies: 200
-- Data for Name: tuser_role; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tuser_role VALUES (0, 0, 'demo');
INSERT INTO public.tuser_role VALUES (1, 0, 'prueba');


--
-- TOC entry 3101 (class 0 OID 292384)
-- Dependencies: 220
-- Data for Name: users_competitions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users_competitions VALUES (287, 1, 'ALBA', 110000, NULL);
INSERT INTO public.users_competitions VALUES (250, 7, 'lula', 10000, NULL);
INSERT INTO public.users_competitions VALUES (288, 16, 'lula', 150000, NULL);
INSERT INTO public.users_competitions VALUES (243, 2, 'nani', 100000, NULL);
INSERT INTO public.users_competitions VALUES (251, 1, 'nani', 50000, NULL);
INSERT INTO public.users_competitions VALUES (292, 17, 'lula', 10000, NULL);
INSERT INTO public.users_competitions VALUES (253, 8, 'le', 80000, NULL);
INSERT INTO public.users_competitions VALUES (293, 17, 'le', 30000, NULL);
INSERT INTO public.users_competitions VALUES (254, 4, 'le', 70000, NULL);
INSERT INTO public.users_competitions VALUES (255, 4, 'nani', 80000, NULL);
INSERT INTO public.users_competitions VALUES (256, 6, 'le', 60000, NULL);
INSERT INTO public.users_competitions VALUES (257, 4, 'lula', 60000, NULL);
INSERT INTO public.users_competitions VALUES (259, 5, 'le', 10000, NULL);
INSERT INTO public.users_competitions VALUES (262, 8, 'nani', 40000, NULL);
INSERT INTO public.users_competitions VALUES (271, 7, 'laura', 0, NULL);
INSERT INTO public.users_competitions VALUES (267, 4, 'paco', 70000, NULL);
INSERT INTO public.users_competitions VALUES (264, 3, 'nani', 40000, NULL);
INSERT INTO public.users_competitions VALUES (263, 8, 'lula', 40000, NULL);
INSERT INTO public.users_competitions VALUES (261, 6, 'lula', 140000, NULL);
INSERT INTO public.users_competitions VALUES (260, 6, 'paco', 20000, NULL);
INSERT INTO public.users_competitions VALUES (273, 10, 'laura', 150000, NULL);
INSERT INTO public.users_competitions VALUES (266, 2, 'paco', 240000, NULL);
INSERT INTO public.users_competitions VALUES (265, 3, 'le', 40000, NULL);
INSERT INTO public.users_competitions VALUES (249, 6, 'nani', 20000, NULL);
INSERT INTO public.users_competitions VALUES (274, 7, 'paco', 150000, NULL);
INSERT INTO public.users_competitions VALUES (246, 5, 'lula', 10000, NULL);
INSERT INTO public.users_competitions VALUES (268, 2, 'le', 30000, NULL);
INSERT INTO public.users_competitions VALUES (244, 3, 'paco', 0, NULL);
INSERT INTO public.users_competitions VALUES (270, 5, 'nani', 20000, NULL);
INSERT INTO public.users_competitions VALUES (269, 8, 'paco', 0, NULL);
INSERT INTO public.users_competitions VALUES (248, 1, 'paco', 100000, NULL);
INSERT INTO public.users_competitions VALUES (275, 9, 'lola', 150000, NULL);
INSERT INTO public.users_competitions VALUES (252, 1, 'lula', 30000, NULL);
INSERT INTO public.users_competitions VALUES (276, 11, 'Sandra', 150000, NULL);
INSERT INTO public.users_competitions VALUES (277, 8, 'Sandra', 150000, NULL);
INSERT INTO public.users_competitions VALUES (272, 9, 'laura', 10000, NULL);
INSERT INTO public.users_competitions VALUES (290, 17, 'paco', 250000, NULL);
INSERT INTO public.users_competitions VALUES (278, 12, 'Alberto', 150000, NULL);
INSERT INTO public.users_competitions VALUES (279, 8, 'Alberto', 150000, NULL);
INSERT INTO public.users_competitions VALUES (295, 18, 'Dani', 0, NULL);
INSERT INTO public.users_competitions VALUES (245, 4, 'laura', 60000, NULL);
INSERT INTO public.users_competitions VALUES (280, 13, 'laura', 150000, NULL);
INSERT INTO public.users_competitions VALUES (303, 7, 'nani', 60000, NULL);
INSERT INTO public.users_competitions VALUES (281, 13, 'paco', 150000, NULL);
INSERT INTO public.users_competitions VALUES (283, 14, 'DavidBootcamp', 150000, NULL);
INSERT INTO public.users_competitions VALUES (242, 1, 'le', 10000, NULL);
INSERT INTO public.users_competitions VALUES (291, 17, 'nani', 0, NULL);
INSERT INTO public.users_competitions VALUES (282, 1, 'DavidBootcamp', 80000, NULL);
INSERT INTO public.users_competitions VALUES (258, 6, 'laura', 0, NULL);
INSERT INTO public.users_competitions VALUES (247, 1, 'laura', 170000, NULL);
INSERT INTO public.users_competitions VALUES (284, 1, 'EDU', 150000, NULL);
INSERT INTO public.users_competitions VALUES (286, 8, 'ALBA', 150000, NULL);
INSERT INTO public.users_competitions VALUES (285, 15, 'ALBA', 10000, NULL);
INSERT INTO public.users_competitions VALUES (294, 1, 'Dani', 80000, NULL);
INSERT INTO public.users_competitions VALUES (296, 12, 'Dani', 150000, NULL);
INSERT INTO public.users_competitions VALUES (309, 6, 'Dani', 150000, NULL);
INSERT INTO public.users_competitions VALUES (308, 25, 'Dani', 0, NULL);
INSERT INTO public.users_competitions VALUES (289, 17, 'Dani', 0, NULL);


--
-- TOC entry 3105 (class 0 OID 294371)
-- Dependencies: 224
-- Data for Name: users_competitions_pilots; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users_competitions_pilots VALUES (2, 242, 13, '2023-11-16', NULL, 60000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (4, 251, 20, '2023-11-16', NULL, 30000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (7, 251, 3, '2023-11-16', NULL, 70000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (9, 253, 13, '2023-11-16', NULL, 60000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (8, 253, 19, '2023-11-16', '2023-11-16', 50000, 50000);
INSERT INTO public.users_competitions_pilots VALUES (10, 253, 17, '2023-11-16', NULL, 10000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (13, 254, 6, '2023-11-16', NULL, 10000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (12, 254, 8, '2023-11-16', '2023-11-16', 20000, 20000);
INSERT INTO public.users_competitions_pilots VALUES (15, 254, 3, '2023-11-16', NULL, 70000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (16, 255, 7, '2023-11-16', NULL, 30000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (18, 255, 1, '2023-11-16', NULL, 40000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (19, 256, 20, '2023-11-16', NULL, 30000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (20, 256, 13, '2023-11-16', NULL, 60000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (21, 257, 2, '2023-11-16', NULL, 80000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (22, 257, 17, '2023-11-16', NULL, 10000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (23, 259, 21, '2023-11-16', NULL, 130000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (24, 259, 17, '2023-11-16', NULL, 10000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (25, 262, 2, '2023-11-16', NULL, 80000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (26, 262, 7, '2023-11-16', NULL, 30000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (29, 263, 14, '2023-11-16', NULL, 100000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (30, 264, 1, '2023-11-16', NULL, 40000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (31, 264, 3, '2023-11-16', NULL, 70000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (32, 263, 6, '2023-11-16', NULL, 10000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (35, 261, 17, '2023-11-16', NULL, 10000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (33, 260, 21, '2023-11-16', '2023-11-16', 130000, 130000);
INSERT INTO public.users_competitions_pilots VALUES (36, 260, 2, '2023-11-16', NULL, 80000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (38, 245, 11, '2023-11-16', NULL, 90000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (40, 260, 5, '2023-11-16', NULL, 50000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (41, 243, 10, '2023-11-16', NULL, 40000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (44, 265, 19, '2023-11-16', NULL, 50000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (46, 265, 13, '2023-11-16', NULL, 60000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (47, 267, 19, '2023-11-16', NULL, 50000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (48, 246, 9, '2023-11-16', NULL, 80000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (50, 246, 13, '2023-11-16', NULL, 60000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (51, 268, 22, '2023-11-16', NULL, 60000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (52, 244, 14, '2023-11-16', NULL, 100000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (53, 268, 13, '2023-11-16', NULL, 60000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (54, 244, 5, '2023-11-16', NULL, 50000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (55, 269, 21, '2023-11-16', NULL, 130000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (56, 269, 8, '2023-11-16', NULL, 20000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (57, 250, 21, '2023-11-16', NULL, 130000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (58, 250, 6, '2023-11-16', NULL, 10000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (39, 249, 8, '2023-11-16', '2023-11-16', 20000, 20000);
INSERT INTO public.users_competitions_pilots VALUES (42, 243, 4, '2023-11-16', '2023-11-16', 20000, 20000);
INSERT INTO public.users_competitions_pilots VALUES (60, 243, 17, '2023-11-16', NULL, 10000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (11, 247, 15, '2023-11-16', '2023-11-16', 10000, 10000);
INSERT INTO public.users_competitions_pilots VALUES (5, 248, 14, '2023-11-16', '2023-11-16', 100000, 100000);
INSERT INTO public.users_competitions_pilots VALUES (14, 252, 16, '2023-11-16', '2023-11-16', 90000, 90000);
INSERT INTO public.users_competitions_pilots VALUES (45, 266, 8, '2023-11-16', '2023-11-16', 20000, 20000);
INSERT INTO public.users_competitions_pilots VALUES (65, 252, 9, '2023-11-16', NULL, 80000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (66, 271, 16, '2023-11-16', NULL, 90000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (68, 271, 13, '2023-11-16', NULL, 60000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (49, 267, 14, '2023-11-16', '2023-11-16', 100000, 100000);
INSERT INTO public.users_competitions_pilots VALUES (69, 267, 20, '2023-11-16', NULL, 30000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (3, 247, 21, '2023-11-16', '2023-11-16', 130000, 100000);
INSERT INTO public.users_competitions_pilots VALUES (70, 247, 7, '2023-11-16', '2023-11-16', 50000, 50000);
INSERT INTO public.users_competitions_pilots VALUES (67, 266, 6, '2023-11-16', '2023-11-16', 10000, 100000);
INSERT INTO public.users_competitions_pilots VALUES (43, 266, 21, '2023-11-16', '2023-11-16', 130000, 130000);
INSERT INTO public.users_competitions_pilots VALUES (62, 248, 19, '2023-11-16', '2023-11-16', 50000, 90000);
INSERT INTO public.users_competitions_pilots VALUES (28, 258, 3, '2023-11-16', '2023-11-17', 70000, 50000);
INSERT INTO public.users_competitions_pilots VALUES (27, 258, 9, '2023-11-16', '2023-11-17', 80000, 10000);
INSERT INTO public.users_competitions_pilots VALUES (71, 247, 14, '2023-11-16', '2023-11-17', 30000, 70000);
INSERT INTO public.users_competitions_pilots VALUES (17, 252, 6, '2023-11-16', '2023-11-17', 10000, 100000);
INSERT INTO public.users_competitions_pilots VALUES (73, 252, 21, '2023-11-17', NULL, 130000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (74, 272, 2, '2023-11-17', NULL, 90000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (75, 272, 17, '2023-11-17', NULL, 50000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (61, 247, 18, '2023-11-16', '2023-11-17', 20000, 30000);
INSERT INTO public.users_competitions_pilots VALUES (34, 245, 13, '2023-11-16', '2023-11-17', 60000, 80000);
INSERT INTO public.users_competitions_pilots VALUES (77, 245, 10, '2023-11-17', NULL, 20000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (79, 281, 5, '2023-11-17', '2023-11-17', 40000, 40000);
INSERT INTO public.users_competitions_pilots VALUES (78, 281, 9, '2023-11-17', '2023-11-17', 10000, 10000);
INSERT INTO public.users_competitions_pilots VALUES (80, 281, 6, '2023-11-17', '2023-11-17', 100000, 100000);
INSERT INTO public.users_competitions_pilots VALUES (1, 242, 2, '2023-11-16', '2023-11-20', 80000, 90000);
INSERT INTO public.users_competitions_pilots VALUES (82, 242, 12, '2023-11-20', '2023-11-20', 40000, 40000);
INSERT INTO public.users_competitions_pilots VALUES (83, 242, 2, '2023-11-20', NULL, 90000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (84, 282, 12, '2023-11-20', NULL, 40000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (81, 282, 6, '2023-11-20', '2023-11-20', 100000, 100000);
INSERT INTO public.users_competitions_pilots VALUES (85, 282, 18, '2023-11-20', NULL, 30000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (86, 258, 22, '2023-11-20', NULL, 60000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (76, 247, 19, '2023-11-17', '2023-11-21', 90000, 90000);
INSERT INTO public.users_competitions_pilots VALUES (72, 247, 16, '2023-11-17', '2023-11-21', 20000, 20000);
INSERT INTO public.users_competitions_pilots VALUES (87, 285, 2, '2023-11-21', NULL, 90000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (88, 285, 17, '2023-11-21', NULL, 50000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (89, 287, 5, '2023-11-21', NULL, 40000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (92, 293, 17, '2023-11-22', NULL, 50000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (95, 293, 6, '2023-11-22', '2023-11-22', 100000, 100000);
INSERT INTO public.users_competitions_pilots VALUES (90, 291, 20, '2023-11-22', '2023-11-22', 60000, 30000);
INSERT INTO public.users_competitions_pilots VALUES (91, 291, 18, '2023-11-22', '2023-11-22', 30000, 20000);
INSERT INTO public.users_competitions_pilots VALUES (100, 293, 3, '2023-11-22', '2023-11-22', 50000, 50000);
INSERT INTO public.users_competitions_pilots VALUES (98, 289, 14, '2023-11-22', '2023-11-22', 70000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (97, 292, 16, '2023-11-22', '2023-11-22', 20000, 80000);
INSERT INTO public.users_competitions_pilots VALUES (6, 248, 17, '2023-11-16', '2023-11-22', 10000, 70000);
INSERT INTO public.users_competitions_pilots VALUES (106, 248, 16, '2023-11-22', NULL, 80000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (107, 248, 17, '2023-11-22', NULL, 70000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (109, 293, 20, '2023-11-22', '2023-11-22', 30000, 10000);
INSERT INTO public.users_competitions_pilots VALUES (96, 290, 9, '2023-11-22', '2023-11-22', 10000, 100000);
INSERT INTO public.users_competitions_pilots VALUES (94, 290, 21, '2023-11-22', '2023-11-22', 130000, 130000);
INSERT INTO public.users_competitions_pilots VALUES (99, 289, 13, '2023-11-22', '2023-11-22', 80000, 90000);
INSERT INTO public.users_competitions_pilots VALUES (108, 292, 11, '2023-11-22', '2023-11-22', 60000, 90000);
INSERT INTO public.users_competitions_pilots VALUES (112, 292, 9, '2023-11-22', '2023-11-22', 100000, 100000);
INSERT INTO public.users_competitions_pilots VALUES (104, 291, 7, '2023-11-22', '2023-11-22', 20000, 10000);
INSERT INTO public.users_competitions_pilots VALUES (114, 293, 1, '2023-11-22', '2023-11-22', 50000, 40000);
INSERT INTO public.users_competitions_pilots VALUES (110, 290, 16, '2023-11-22', '2023-11-22', 70000, 80000);
INSERT INTO public.users_competitions_pilots VALUES (115, 290, 11, '2023-11-22', '2023-11-22', 90000, 70000);
INSERT INTO public.users_competitions_pilots VALUES (103, 291, 6, '2023-11-22', '2023-11-22', 90000, 90000);
INSERT INTO public.users_competitions_pilots VALUES (113, 292, 13, '2023-11-22', '2023-11-22', 90000, 100000);
INSERT INTO public.users_competitions_pilots VALUES (118, 290, 8, '2023-11-22', '2023-11-22', 10000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (117, 290, 14, '2023-11-22', '2023-11-22', 10000, 70000);
INSERT INTO public.users_competitions_pilots VALUES (93, 292, 2, '2023-11-22', '2023-11-22', 90000, 30000);
INSERT INTO public.users_competitions_pilots VALUES (116, 291, 20, '2023-11-22', '2023-11-22', 10000, 10000);
INSERT INTO public.users_competitions_pilots VALUES (119, 291, 12, '2023-11-22', '2023-11-22', 70000, 20000);
INSERT INTO public.users_competitions_pilots VALUES (120, 293, 11, '2023-11-22', '2023-11-22', 70000, 100000);
INSERT INTO public.users_competitions_pilots VALUES (125, 293, 13, '2023-11-22', NULL, 70000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (122, 290, 3, '2023-11-22', '2023-11-22', 20000, 50000);
INSERT INTO public.users_competitions_pilots VALUES (105, 289, 15, '2023-11-22', '2023-11-22', 10000, 40000);
INSERT INTO public.users_competitions_pilots VALUES (124, 292, 9, '2023-11-22', '2023-11-22', 90000, 100000);
INSERT INTO public.users_competitions_pilots VALUES (121, 292, 6, '2023-11-22', '2023-11-22', 90000, 70000);
INSERT INTO public.users_competitions_pilots VALUES (101, 294, 6, '2023-11-22', '2023-11-24', 90000, 70000);
INSERT INTO public.users_competitions_pilots VALUES (102, 294, 11, '2023-11-22', '2023-11-24', 60000, 10000);
INSERT INTO public.users_competitions_pilots VALUES (59, 249, 16, '2023-11-16', '2023-11-26', 90000, 70000);
INSERT INTO public.users_competitions_pilots VALUES (63, 270, 14, '2023-11-16', '2023-11-26', 100000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (64, 270, 18, '2023-11-16', '2023-11-26', 20000, 30000);
INSERT INTO public.users_competitions_pilots VALUES (123, 290, 16, '2023-11-22', '2023-11-22', 30000, 80000);
INSERT INTO public.users_competitions_pilots VALUES (129, 290, 14, '2023-11-22', '2023-11-22', 20000, 40000);
INSERT INTO public.users_competitions_pilots VALUES (128, 290, 12, '2023-11-22', '2023-11-22', 20000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (111, 289, 21, '2023-11-22', '2023-11-22', 130000, 130000);
INSERT INTO public.users_competitions_pilots VALUES (130, 290, 21, '2023-11-22', '2023-11-22', 130000, 130000);
INSERT INTO public.users_competitions_pilots VALUES (131, 290, 21, '2023-11-22', NULL, 130000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (126, 291, 18, '2023-11-22', '2023-11-22', 40000, 50000);
INSERT INTO public.users_competitions_pilots VALUES (134, 291, 14, '2023-11-22', '2023-11-22', 40000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (132, 290, 2, '2023-11-22', '2023-11-22', 90000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (136, 290, 11, '2023-11-22', '2023-11-22', 10000, 10000);
INSERT INTO public.users_competitions_pilots VALUES (137, 290, 16, '2023-11-22', NULL, 70000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (127, 291, 20, '2023-11-22', '2023-11-22', 10000, 20000);
INSERT INTO public.users_competitions_pilots VALUES (138, 291, 12, '2023-11-22', '2023-11-22', 90000, 90000);
INSERT INTO public.users_competitions_pilots VALUES (135, 289, 19, '2023-11-22', '2023-11-22', 80000, 80000);
INSERT INTO public.users_competitions_pilots VALUES (133, 289, 7, '2023-11-22', '2023-11-22', 50000, 10000);
INSERT INTO public.users_competitions_pilots VALUES (141, 289, 12, '2023-11-22', '2023-11-22', 90000, 90000);
INSERT INTO public.users_competitions_pilots VALUES (143, 289, 14, '2023-11-22', '2023-11-22', 60000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (139, 295, 2, '2023-11-22', '2023-11-22', 60000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (140, 295, 5, '2023-11-22', '2023-11-22', 50000, 50000);
INSERT INTO public.users_competitions_pilots VALUES (145, 295, 19, '2023-11-22', '2023-11-22', 80000, 80000);
INSERT INTO public.users_competitions_pilots VALUES (142, 289, 19, '2023-11-22', '2023-11-22', 80000, 80000);
INSERT INTO public.users_competitions_pilots VALUES (144, 289, 2, '2023-11-22', '2023-11-22', 60000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (146, 289, 19, '2023-11-22', '2023-11-22', 80000, 80000);
INSERT INTO public.users_competitions_pilots VALUES (147, 289, 14, '2023-11-22', '2023-11-22', 60000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (153, 289, 14, '2023-11-22', '2023-11-22', 60000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (148, 292, 9, '2023-11-22', '2023-11-23', 100000, 100000);
INSERT INTO public.users_competitions_pilots VALUES (149, 292, 6, '2023-11-22', '2023-11-23', 70000, 70000);
INSERT INTO public.users_competitions_pilots VALUES (155, 292, 9, '2023-11-23', NULL, 100000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (156, 292, 6, '2023-11-23', NULL, 70000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (152, 289, 19, '2023-11-22', '2023-11-23', 80000, 80000);
INSERT INTO public.users_competitions_pilots VALUES (154, 289, 2, '2023-11-22', '2023-11-23', 60000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (159, 289, 12, '2023-11-23', '2023-11-23', 90000, 90000);
INSERT INTO public.users_competitions_pilots VALUES (161, 289, 14, '2023-11-23', '2023-11-23', 60000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (162, 289, 2, '2023-11-23', '2023-11-23', 60000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (160, 289, 19, '2023-11-23', '2023-11-23', 80000, 80000);
INSERT INTO public.users_competitions_pilots VALUES (158, 296, 17, '2023-11-23', '2023-11-23', 80000, 80000);
INSERT INTO public.users_competitions_pilots VALUES (157, 296, 6, '2023-11-23', '2023-11-23', 70000, 70000);
INSERT INTO public.users_competitions_pilots VALUES (166, 289, 14, '2023-11-23', '2023-11-23', 60000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (151, 295, 17, '2023-11-22', '2023-11-23', 80000, 80000);
INSERT INTO public.users_competitions_pilots VALUES (150, 295, 6, '2023-11-22', '2023-11-23', 70000, 70000);
INSERT INTO public.users_competitions_pilots VALUES (168, 295, 6, '2023-11-23', NULL, 70000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (169, 295, 17, '2023-11-23', NULL, 80000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (165, 289, 19, '2023-11-23', '2023-11-23', 80000, 80000);
INSERT INTO public.users_competitions_pilots VALUES (167, 289, 2, '2023-11-23', '2023-11-23', 60000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (171, 289, 14, '2023-11-23', '2023-11-23', 60000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (172, 289, 2, '2023-11-23', '2023-11-24', 60000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (170, 289, 19, '2023-11-23', '2023-11-24', 80000, 80000);
INSERT INTO public.users_competitions_pilots VALUES (173, 291, 12, '2023-11-24', NULL, 90000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (164, 296, 17, '2023-11-23', '2023-11-24', 80000, 80000);
INSERT INTO public.users_competitions_pilots VALUES (163, 296, 6, '2023-11-23', '2023-11-24', 70000, 70000);
INSERT INTO public.users_competitions_pilots VALUES (177, 289, 14, '2023-11-24', '2023-11-24', 60000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (176, 289, 19, '2023-11-24', '2023-11-24', 80000, 80000);
INSERT INTO public.users_competitions_pilots VALUES (178, 289, 2, '2023-11-24', '2023-11-24', 60000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (175, 296, 17, '2023-11-24', '2023-11-24', 80000, 80000);
INSERT INTO public.users_competitions_pilots VALUES (174, 296, 6, '2023-11-24', '2023-11-24', 70000, 70000);
INSERT INTO public.users_competitions_pilots VALUES (182, 289, 14, '2023-11-24', '2023-11-24', 60000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (181, 289, 19, '2023-11-24', '2023-11-24', 80000, 80000);
INSERT INTO public.users_competitions_pilots VALUES (183, 289, 2, '2023-11-24', '2023-11-24', 60000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (187, 289, 14, '2023-11-24', '2023-11-24', 60000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (188, 289, 2, '2023-11-24', '2023-11-24', 60000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (186, 289, 19, '2023-11-24', '2023-11-24', 80000, 80000);
INSERT INTO public.users_competitions_pilots VALUES (192, 289, 14, '2023-11-24', '2023-11-24', 60000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (37, 249, 19, '2023-11-16', '2023-11-26', 50000, 80000);
INSERT INTO public.users_competitions_pilots VALUES (194, 249, 19, '2023-11-26', NULL, 80000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (195, 249, 14, '2023-11-26', NULL, 60000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (196, 270, 15, '2023-11-26', NULL, 40000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (197, 270, 14, '2023-11-26', NULL, 60000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (198, 303, 1, '2023-11-26', '2023-11-26', 50000, 50000);
INSERT INTO public.users_competitions_pilots VALUES (199, 303, 15, '2023-11-26', '2023-11-26', 40000, 40000);
INSERT INTO public.users_competitions_pilots VALUES (200, 303, 1, '2023-11-26', NULL, 50000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (201, 303, 15, '2023-11-26', NULL, 40000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (191, 289, 19, '2023-11-24', '2023-11-27', 80000, 80000);
INSERT INTO public.users_competitions_pilots VALUES (193, 289, 2, '2023-11-24', '2023-11-27', 60000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (205, 289, 14, '2023-11-27', '2023-11-27', 60000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (204, 289, 19, '2023-11-27', '2023-11-27', 80000, 80000);
INSERT INTO public.users_competitions_pilots VALUES (206, 289, 2, '2023-11-27', '2023-11-27', 60000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (210, 289, 14, '2023-11-27', '2023-11-27', 60000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (209, 289, 19, '2023-11-27', '2023-11-27', 80000, 80000);
INSERT INTO public.users_competitions_pilots VALUES (211, 289, 2, '2023-11-27', '2023-11-27', 60000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (212, 308, 6, '2023-11-27', NULL, 70000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (213, 308, 17, '2023-11-27', NULL, 80000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (214, 289, 19, '2023-11-27', NULL, 80000, NULL);
INSERT INTO public.users_competitions_pilots VALUES (215, 289, 14, '2023-11-27', '2023-11-27', 60000, 60000);
INSERT INTO public.users_competitions_pilots VALUES (216, 289, 2, '2023-11-27', NULL, 60000, NULL);


--
-- TOC entry 3136 (class 0 OID 0)
-- Dependencies: 213
-- Name: competitions_comp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.competitions_comp_id_seq', 25, true);


--
-- TOC entry 3137 (class 0 OID 0)
-- Dependencies: 215
-- Name: pilots_pil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pilots_pil_id_seq', 22, true);


--
-- TOC entry 3138 (class 0 OID 0)
-- Dependencies: 229
-- Name: pilots_prices_pp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pilots_prices_pp_id_seq', 442, true);


--
-- TOC entry 3139 (class 0 OID 0)
-- Dependencies: 227
-- Name: races_points_rp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.races_points_rp_id_seq', 1457, true);


--
-- TOC entry 3140 (class 0 OID 0)
-- Dependencies: 221
-- Name: races_rac_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.races_rac_id_seq', 22, true);


--
-- TOC entry 3141 (class 0 OID 0)
-- Dependencies: 225
-- Name: results_res_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.results_res_id_seq', 420, true);


--
-- TOC entry 3142 (class 0 OID 0)
-- Dependencies: 217
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 10, true);


--
-- TOC entry 3143 (class 0 OID 0)
-- Dependencies: 211
-- Name: ti18n_id_i18n_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ti18n_id_i18n_seq', 1, false);


--
-- TOC entry 3144 (class 0 OID 0)
-- Dependencies: 209
-- Name: ti18n_value_id_i18n_value_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ti18n_value_id_i18n_value_seq', 1, false);


--
-- TOC entry 3145 (class 0 OID 0)
-- Dependencies: 197
-- Name: trole_id_rolename_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.trole_id_rolename_seq', 1, false);


--
-- TOC entry 3146 (class 0 OID 0)
-- Dependencies: 203
-- Name: trole_server_permission_id_role_server_permission_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.trole_server_permission_id_role_server_permission_seq', 1, false);


--
-- TOC entry 3147 (class 0 OID 0)
-- Dependencies: 201
-- Name: tserver_permission_id_server_permission_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tserver_permission_id_server_permission_seq', 1, false);


--
-- TOC entry 3148 (class 0 OID 0)
-- Dependencies: 205
-- Name: tsetting_id_setting_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tsetting_id_setting_seq', 1, false);


--
-- TOC entry 3149 (class 0 OID 0)
-- Dependencies: 207
-- Name: tuser_preference_id_user_preference_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tuser_preference_id_user_preference_seq', 1, false);


--
-- TOC entry 3150 (class 0 OID 0)
-- Dependencies: 199
-- Name: tuser_role_id_user_role_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tuser_role_id_user_role_seq', 1, false);


--
-- TOC entry 3151 (class 0 OID 0)
-- Dependencies: 219
-- Name: user_competition_uc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_competition_uc_id_seq', 309, true);


--
-- TOC entry 3152 (class 0 OID 0)
-- Dependencies: 223
-- Name: users_competitions_pilots_ucp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_competitions_pilots_ucp_id_seq', 216, true);


--
-- TOC entry 2924 (class 2606 OID 291996)
-- Name: competitions competitions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.competitions
    ADD CONSTRAINT competitions_pkey PRIMARY KEY (comp_id);


--
-- TOC entry 2926 (class 2606 OID 292185)
-- Name: pilots pilots_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pilots
    ADD CONSTRAINT pilots_pkey PRIMARY KEY (pil_id);


--
-- TOC entry 2940 (class 2606 OID 295745)
-- Name: pilots_prices pilots_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pilots_prices
    ADD CONSTRAINT pilots_prices_pkey PRIMARY KEY (pp_id);


--
-- TOC entry 2932 (class 2606 OID 294299)
-- Name: races races_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.races
    ADD CONSTRAINT races_pkey PRIMARY KEY (rac_id);


--
-- TOC entry 2938 (class 2606 OID 295015)
-- Name: races_points races_points_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.races_points
    ADD CONSTRAINT races_points_pkey PRIMARY KEY (rp_id);


--
-- TOC entry 2936 (class 2606 OID 294434)
-- Name: results results_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_pkey PRIMARY KEY (res_id);


--
-- TOC entry 2928 (class 2606 OID 292193)
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- TOC entry 2922 (class 2606 OID 291288)
-- Name: ti18n ti18n_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ti18n
    ADD CONSTRAINT ti18n_pkey PRIMARY KEY (id_i18n);


--
-- TOC entry 2920 (class 2606 OID 291280)
-- Name: ti18n_value ti18n_value_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ti18n_value
    ADD CONSTRAINT ti18n_value_pkey PRIMARY KEY (id_i18n_value);


--
-- TOC entry 2908 (class 2606 OID 291160)
-- Name: trole trole_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole
    ADD CONSTRAINT trole_pkey PRIMARY KEY (id_rolename);


--
-- TOC entry 2914 (class 2606 OID 291197)
-- Name: trole_server_permission trole_server_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole_server_permission
    ADD CONSTRAINT trole_server_permission_pkey PRIMARY KEY (id_role_server_permission);


--
-- TOC entry 2912 (class 2606 OID 291189)
-- Name: tserver_permission tserver_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tserver_permission
    ADD CONSTRAINT tserver_permission_pkey PRIMARY KEY (id_server_permission);


--
-- TOC entry 2916 (class 2606 OID 291228)
-- Name: tsetting tsetting_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tsetting
    ADD CONSTRAINT tsetting_pkey PRIMARY KEY (id_setting);


--
-- TOC entry 2906 (class 2606 OID 291149)
-- Name: tuser tuser_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser
    ADD CONSTRAINT tuser_pkey PRIMARY KEY (user_);


--
-- TOC entry 2918 (class 2606 OID 291251)
-- Name: tuser_preference tuser_preference_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_preference
    ADD CONSTRAINT tuser_preference_pkey PRIMARY KEY (id_user_preference);


--
-- TOC entry 2910 (class 2606 OID 291168)
-- Name: tuser_role tuser_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_role
    ADD CONSTRAINT tuser_role_pkey PRIMARY KEY (id_user_role);


--
-- TOC entry 2930 (class 2606 OID 292391)
-- Name: users_competitions user_competition_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_competitions
    ADD CONSTRAINT user_competition_pkey PRIMARY KEY (uc_id);


--
-- TOC entry 2934 (class 2606 OID 294376)
-- Name: users_competitions_pilots users_competitions_pilots_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_competitions_pilots
    ADD CONSTRAINT users_competitions_pilots_pkey PRIMARY KEY (ucp_id);


--
-- TOC entry 2945 (class 2606 OID 292392)
-- Name: users_competitions fk_comp_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_competitions
    ADD CONSTRAINT fk_comp_id FOREIGN KEY (comp_id) REFERENCES public.competitions(comp_id);


--
-- TOC entry 2948 (class 2606 OID 294377)
-- Name: users_competitions_pilots fk_pil_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_competitions_pilots
    ADD CONSTRAINT fk_pil_id FOREIGN KEY (pil_id) REFERENCES public.pilots(pil_id);


--
-- TOC entry 2950 (class 2606 OID 294435)
-- Name: results fk_pil_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT fk_pil_id FOREIGN KEY (pil_id) REFERENCES public.pilots(pil_id);


--
-- TOC entry 2954 (class 2606 OID 295746)
-- Name: pilots_prices fk_pil_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pilots_prices
    ADD CONSTRAINT fk_pil_id FOREIGN KEY (pil_id) REFERENCES public.pilots(pil_id);


--
-- TOC entry 2951 (class 2606 OID 294440)
-- Name: results fk_rac_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT fk_rac_id FOREIGN KEY (rac_id) REFERENCES public.races(rac_id);


--
-- TOC entry 2955 (class 2606 OID 295778)
-- Name: pilots_prices fk_rac_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pilots_prices
    ADD CONSTRAINT fk_rac_id FOREIGN KEY (rac_id) REFERENCES public.races(rac_id);


--
-- TOC entry 2953 (class 2606 OID 295131)
-- Name: races_points fk_res_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.races_points
    ADD CONSTRAINT fk_res_id FOREIGN KEY (res_id) REFERENCES public.results(res_id);


--
-- TOC entry 2947 (class 2606 OID 294638)
-- Name: users_competitions fk_team_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_competitions
    ADD CONSTRAINT fk_team_id FOREIGN KEY (team_id) REFERENCES public.teams(team_id);


--
-- TOC entry 2942 (class 2606 OID 291174)
-- Name: tuser_role fk_trole; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_role
    ADD CONSTRAINT fk_trole FOREIGN KEY (id_rolename) REFERENCES public.trole(id_rolename);


--
-- TOC entry 2943 (class 2606 OID 291198)
-- Name: trole_server_permission fk_trole_server_permission; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole_server_permission
    ADD CONSTRAINT fk_trole_server_permission FOREIGN KEY (id_rolename) REFERENCES public.trole(id_rolename);


--
-- TOC entry 2944 (class 2606 OID 291203)
-- Name: trole_server_permission fk_tserver_permission; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole_server_permission
    ADD CONSTRAINT fk_tserver_permission FOREIGN KEY (id_server_permission) REFERENCES public.tserver_permission(id_server_permission);


--
-- TOC entry 2941 (class 2606 OID 291169)
-- Name: tuser_role fk_tuser; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_role
    ADD CONSTRAINT fk_tuser FOREIGN KEY (user_) REFERENCES public.tuser(user_);


--
-- TOC entry 2949 (class 2606 OID 294633)
-- Name: users_competitions_pilots fk_uc_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_competitions_pilots
    ADD CONSTRAINT fk_uc_id FOREIGN KEY (uc_id) REFERENCES public.users_competitions(uc_id);


--
-- TOC entry 2952 (class 2606 OID 295016)
-- Name: races_points fk_ucp_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.races_points
    ADD CONSTRAINT fk_ucp_id FOREIGN KEY (ucp_id) REFERENCES public.users_competitions_pilots(ucp_id);


--
-- TOC entry 2946 (class 2606 OID 292397)
-- Name: users_competitions fk_user_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_competitions
    ADD CONSTRAINT fk_user_ FOREIGN KEY (user_) REFERENCES public.tuser(user_);


-- Completed on 2023-11-29 15:10:39

--
-- PostgreSQL database dump complete
--

