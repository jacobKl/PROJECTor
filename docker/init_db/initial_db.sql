--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg120+1)
-- Dumped by pg_dump version 17.2

-- Started on 2025-01-15 08:05:16 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA IF NOT EXISTS public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3534 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 246 (class 1255 OID 16592)
-- Name: give_creator_full_access_function(); Type: FUNCTION; Schema: public; Owner: root
--

CREATE FUNCTION public.give_creator_full_access_function() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
            BEGIN
                INSERT INTO project_participants (created_at, updated_at, user_id, project_id, role_id, status)
                VALUES (NOW(), NOW(), NEW.user_id, NEW.id, 2, 'ACTIVE');
                RETURN NEW;
            END;
            $$;


ALTER FUNCTION public.give_creator_full_access_function() OWNER TO root;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 223 (class 1259 OID 16419)
-- Name: cache; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO root;

--
-- TOC entry 224 (class 1259 OID 16426)
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO root;

--
-- TOC entry 243 (class 1259 OID 16565)
-- Name: comments; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    comment text NOT NULL,
    user_id bigint,
    task_id bigint
);


ALTER TABLE public.comments OWNER TO root;

--
-- TOC entry 242 (class 1259 OID 16564)
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comments_id_seq OWNER TO root;

--
-- TOC entry 3535 (class 0 OID 0)
-- Dependencies: 242
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- TOC entry 229 (class 1259 OID 16451)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO root;

--
-- TOC entry 228 (class 1259 OID 16450)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO root;

--
-- TOC entry 3536 (class 0 OID 0)
-- Dependencies: 228
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 227 (class 1259 OID 16443)
-- Name: job_batches; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO root;

--
-- TOC entry 226 (class 1259 OID 16434)
-- Name: jobs; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO root;

--
-- TOC entry 225 (class 1259 OID 16433)
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO root;

--
-- TOC entry 3537 (class 0 OID 0)
-- Dependencies: 225
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- TOC entry 218 (class 1259 OID 16386)
-- Name: migrations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO root;

--
-- TOC entry 217 (class 1259 OID 16385)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO root;

--
-- TOC entry 3538 (class 0 OID 0)
-- Dependencies: 217
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 233 (class 1259 OID 16477)
-- Name: notifications; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.notifications (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    user_id bigint,
    type character varying(255) NOT NULL,
    message character varying(255) NOT NULL,
    received boolean NOT NULL,
    data json NOT NULL
);


ALTER TABLE public.notifications OWNER TO root;

--
-- TOC entry 232 (class 1259 OID 16476)
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notifications_id_seq OWNER TO root;

--
-- TOC entry 3539 (class 0 OID 0)
-- Dependencies: 232
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- TOC entry 221 (class 1259 OID 16403)
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO root;

--
-- TOC entry 235 (class 1259 OID 16491)
-- Name: project_participants; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.project_participants (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    user_id bigint,
    project_id bigint,
    status text NOT NULL,
    role_id bigint
);


ALTER TABLE public.project_participants OWNER TO root;

--
-- TOC entry 234 (class 1259 OID 16490)
-- Name: project_participants_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.project_participants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.project_participants_id_seq OWNER TO root;

--
-- TOC entry 3540 (class 0 OID 0)
-- Dependencies: 234
-- Name: project_participants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.project_participants_id_seq OWNED BY public.project_participants.id;


--
-- TOC entry 239 (class 1259 OID 16524)
-- Name: project_permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.project_permissions (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    user_id bigint,
    project_id bigint,
    role_id bigint
);


ALTER TABLE public.project_permissions OWNER TO root;

--
-- TOC entry 238 (class 1259 OID 16523)
-- Name: project_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.project_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.project_permissions_id_seq OWNER TO root;

--
-- TOC entry 3541 (class 0 OID 0)
-- Dependencies: 238
-- Name: project_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.project_permissions_id_seq OWNED BY public.project_permissions.id;


--
-- TOC entry 231 (class 1259 OID 16463)
-- Name: projects; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.projects (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    name character varying(255) NOT NULL,
    description text,
    deadline date NOT NULL,
    user_id bigint
);


ALTER TABLE public.projects OWNER TO root;

--
-- TOC entry 230 (class 1259 OID 16462)
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.projects_id_seq OWNER TO root;

--
-- TOC entry 3542 (class 0 OID 0)
-- Dependencies: 230
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- TOC entry 237 (class 1259 OID 16510)
-- Name: roles; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO root;

--
-- TOC entry 236 (class 1259 OID 16509)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO root;

--
-- TOC entry 3543 (class 0 OID 0)
-- Dependencies: 236
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 222 (class 1259 OID 16410)
-- Name: sessions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO root;

--
-- TOC entry 241 (class 1259 OID 16546)
-- Name: tasks; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.tasks (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    name text NOT NULL,
    due_date timestamp(0) without time zone NOT NULL,
    asignee bigint,
    priority text NOT NULL,
    status text NOT NULL,
    description text NOT NULL,
    project_id bigint NOT NULL
);


ALTER TABLE public.tasks OWNER TO root;

--
-- TOC entry 220 (class 1259 OID 16393)
-- Name: users; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO root;

--
-- TOC entry 244 (class 1259 OID 16583)
-- Name: task_asignees; Type: VIEW; Schema: public; Owner: root
--

CREATE VIEW public.task_asignees AS
 SELECT u.email,
    u.name AS user_name,
    p.name AS project_name,
    t.name AS task_name,
    t.priority,
    t.description
   FROM ((public.users u
     JOIN public.tasks t ON ((u.id = t.asignee)))
     JOIN public.projects p ON ((p.id = t.project_id)));


ALTER VIEW public.task_asignees OWNER TO root;

--
-- TOC entry 240 (class 1259 OID 16545)
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tasks_id_seq OWNER TO root;

--
-- TOC entry 3544 (class 0 OID 0)
-- Dependencies: 240
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- TOC entry 245 (class 1259 OID 16588)
-- Name: tasks_in_projects; Type: VIEW; Schema: public; Owner: root
--

CREATE VIEW public.tasks_in_projects AS
 SELECT p.name AS project_name,
    count(t.*) AS tasks_amount
   FROM (public.projects p
     JOIN public.tasks t ON ((p.id = t.project_id)))
  GROUP BY p.name;


ALTER VIEW public.tasks_in_projects OWNER TO root;

--
-- TOC entry 219 (class 1259 OID 16392)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO root;

--
-- TOC entry 3545 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3300 (class 2604 OID 16568)
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- TOC entry 3292 (class 2604 OID 16454)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 3291 (class 2604 OID 16437)
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- TOC entry 3289 (class 2604 OID 16389)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3295 (class 2604 OID 16480)
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- TOC entry 3296 (class 2604 OID 16494)
-- Name: project_participants id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.project_participants ALTER COLUMN id SET DEFAULT nextval('public.project_participants_id_seq'::regclass);


--
-- TOC entry 3298 (class 2604 OID 16527)
-- Name: project_permissions id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.project_permissions ALTER COLUMN id SET DEFAULT nextval('public.project_permissions_id_seq'::regclass);


--
-- TOC entry 3294 (class 2604 OID 16466)
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- TOC entry 3297 (class 2604 OID 16513)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 3299 (class 2604 OID 16549)
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- TOC entry 3290 (class 2604 OID 16396)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3508 (class 0 OID 16419)
-- Dependencies: 223
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- TOC entry 3509 (class 0 OID 16426)
-- Dependencies: 224
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- TOC entry 3528 (class 0 OID 16565)
-- Dependencies: 243
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.comments (id, created_at, updated_at, comment, user_id, task_id) FROM stdin;
1	2025-01-15 07:53:26	2025-01-15 07:53:26	I have sent you all account details via private message on slack.	1	1
2	2025-01-15 08:01:36	2025-01-15 08:01:36	I am able to help in case of problems.	3	1
\.


--
-- TOC entry 3514 (class 0 OID 16451)
-- Dependencies: 229
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 3512 (class 0 OID 16443)
-- Dependencies: 227
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- TOC entry 3511 (class 0 OID 16434)
-- Dependencies: 226
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- TOC entry 3503 (class 0 OID 16386)
-- Dependencies: 218
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2024_12_15_092134_create_projects_table	1
5	2024_12_15_103732_create_notifications_table	1
6	2024_12_15_105731_create_project_participants_table	1
7	2025_01_06_171426_create_roles_table	1
8	2025_01_06_171521_add_role_id_to_participants	1
9	2025_01_08_081624_create_project_permissions_table	1
10	2025_01_08_100156_create_tasks_table	1
11	2025_01_11_230654_create_comments_table	1
12	2025_01_12_172547_create_views	1
\.


--
-- TOC entry 3518 (class 0 OID 16477)
-- Dependencies: 233
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.notifications (id, created_at, updated_at, user_id, type, message, received, data) FROM stdin;
1	2025-01-15 07:50:04	2025-01-15 07:51:03	2	PROJECT_INVITATION	You were invited to project Apollo Launch	t	{"project_id":1,"invitation_id":3}
2	2025-01-15 08:00:50	2025-01-15 08:01:04	3	PROJECT_INVITATION	You were invited to project Apollo Launch	t	{"project_id":1,"invitation_id":4}
\.


--
-- TOC entry 3506 (class 0 OID 16403)
-- Dependencies: 221
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 3520 (class 0 OID 16491)
-- Dependencies: 235
-- Data for Name: project_participants; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.project_participants (id, created_at, updated_at, user_id, project_id, status, role_id) FROM stdin;
1	2025-01-15 07:37:33	2025-01-15 07:37:33	1	1	ACTIVE	2
2	2025-01-15 07:47:10	2025-01-15 07:47:10	1	2	ACTIVE	2
3	2025-01-15 07:50:04	2025-01-15 07:51:03	2	1	ACTIVE	\N
4	2025-01-15 08:00:50	2025-01-15 08:01:04	3	1	ACTIVE	\N
\.


--
-- TOC entry 3524 (class 0 OID 16524)
-- Dependencies: 239
-- Data for Name: project_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.project_permissions (id, created_at, updated_at, user_id, project_id, role_id) FROM stdin;
1	2025-01-15 07:50:04	2025-01-15 07:50:04	2	1	1
2	2025-01-15 08:00:50	2025-01-15 08:00:50	3	1	2
\.


--
-- TOC entry 3516 (class 0 OID 16463)
-- Dependencies: 231
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.projects (id, created_at, updated_at, name, description, deadline, user_id) FROM stdin;
1	2025-01-15 07:37:33	2025-01-15 07:37:33	Apollo Launch	New Apollo project.	2025-01-16	1
2	2025-01-15 07:47:09	2025-01-15 07:47:09	Apollo II Launch	Another new project.	2025-01-10	1
\.


--
-- TOC entry 3522 (class 0 OID 16510)
-- Dependencies: 237
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.roles (id, name, created_at, updated_at) FROM stdin;
1	read_only	2025-01-15 07:35:35	2025-01-15 07:35:35
2	full_access	2025-01-15 07:35:35	2025-01-15 07:35:35
\.


--
-- TOC entry 3507 (class 0 OID 16410)
-- Dependencies: 222
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
hgu1zeQ8QKdbHfA3cUSpT2e5cqb5tf4PuvR3mG5i	1	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.2 Safari/605.1.15	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUW9uMWl0MzV1UkhNaThzUnpIYmhqUWN0dFZzMFZyNUx6eHgzdW5xdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9ub3RpZmljYXRpb25zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9	1736928305
NLSsVKs6PWNBFW6H543hh3irYjkOKANJF4NStbO1	2	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.2 Safari/605.1.15	YTo0OntzOjY6Il90b2tlbiI7czo0MDoic0g0cjNrdjdvRWVBWFV2Rmw2amFsZ1ZITFJEa29pNkM3MWVDMWI3UyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9ub3RpZmljYXRpb25zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9	1736928315
pVWTAcDz14r3o4tODP5uK4ObOKIgsnovr7xOwYcQ	3	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZmJpZm5YcmFFOHRXeUZWcm11ZFcyME5rVHhYSkNvMDFPaDdPazdiWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9ub3RpZmljYXRpb25zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mzt9	1736928099
\.


--
-- TOC entry 3526 (class 0 OID 16546)
-- Dependencies: 241
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.tasks (id, created_at, updated_at, name, due_date, asignee, priority, status, description, project_id) FROM stdin;
1	2025-01-15 07:52:42	2025-01-15 07:52:42	Create dev and staging environment	2025-01-17 08:51:00	2	high	new	User, please make this ASAP.	1
2	2025-01-15 07:55:14	2025-01-15 07:55:14	Data aggregation	2025-01-18 08:55:00	1	urgent	in-progress	Aggregate all data from the client.	1
3	2025-01-15 07:55:43	2025-01-15 07:55:43	Create Projector project	2025-01-15 08:55:00	1	urgent	closed	Create the project.	1
\.


--
-- TOC entry 3505 (class 0 OID 16393)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
1	admin	admin@projector.pl	\N	$2y$12$ZtLZsWofNIc5yv5CM4Jr3eOfbB1Z.XZnUtM1gEpbus6csK50Ps/kW	uyOjIk6MVl7t52gzmab9VuwqPLnTiGtdOl8zyoog1H5cncLCungj6Ova3s2y	2025-01-15 07:36:01	2025-01-15 07:36:01
2	user_readonly	user_readonly@projector.pl	\N	$2y$12$H6AZJHnXXgh8.r8qppoMtOvTtN9KXIvFHGl2m3/YYxE2qzrtBuBia	1G4fG1AQBr0N7aiTSqExgKUBpSLuNljkkNOFIqIJEQsnqjeaaRnix60qeRRW	2025-01-15 07:48:12	2025-01-15 07:48:12
3	user	user@projector.pl	\N	$2y$12$P1qgcfCdxj2gmaA8tGFts.qgkYZ5gqujf5.mjNZfCzmtnF1acQ04O	TCuFVJBG1OpAOjHyCMWNYKGSkNK6DLg07VCxM3ea8SEAVFg0vaSln5WgvSrt	2025-01-15 08:00:25	2025-01-15 08:00:25
\.


--
-- TOC entry 3546 (class 0 OID 0)
-- Dependencies: 242
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.comments_id_seq', 2, true);


--
-- TOC entry 3547 (class 0 OID 0)
-- Dependencies: 228
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 3548 (class 0 OID 0)
-- Dependencies: 225
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- TOC entry 3549 (class 0 OID 0)
-- Dependencies: 217
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.migrations_id_seq', 12, true);


--
-- TOC entry 3550 (class 0 OID 0)
-- Dependencies: 232
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.notifications_id_seq', 2, true);


--
-- TOC entry 3551 (class 0 OID 0)
-- Dependencies: 234
-- Name: project_participants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.project_participants_id_seq', 4, true);


--
-- TOC entry 3552 (class 0 OID 0)
-- Dependencies: 238
-- Name: project_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.project_permissions_id_seq', 2, true);


--
-- TOC entry 3553 (class 0 OID 0)
-- Dependencies: 230
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.projects_id_seq', 2, true);


--
-- TOC entry 3554 (class 0 OID 0)
-- Dependencies: 236
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.roles_id_seq', 2, true);


--
-- TOC entry 3555 (class 0 OID 0)
-- Dependencies: 240
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.tasks_id_seq', 3, true);


--
-- TOC entry 3556 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- TOC entry 3316 (class 2606 OID 16432)
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- TOC entry 3314 (class 2606 OID 16425)
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- TOC entry 3341 (class 2606 OID 16572)
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- TOC entry 3323 (class 2606 OID 16459)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3325 (class 2606 OID 16461)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 3321 (class 2606 OID 16449)
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- TOC entry 3318 (class 2606 OID 16441)
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3302 (class 2606 OID 16391)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3329 (class 2606 OID 16484)
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- TOC entry 3308 (class 2606 OID 16409)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 3331 (class 2606 OID 16498)
-- Name: project_participants project_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.project_participants
    ADD CONSTRAINT project_participants_pkey PRIMARY KEY (id);


--
-- TOC entry 3337 (class 2606 OID 16529)
-- Name: project_permissions project_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.project_permissions
    ADD CONSTRAINT project_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3327 (class 2606 OID 16470)
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- TOC entry 3333 (class 2606 OID 16517)
-- Name: roles roles_name_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_unique UNIQUE (name);


--
-- TOC entry 3335 (class 2606 OID 16515)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3311 (class 2606 OID 16416)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 3339 (class 2606 OID 16553)
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- TOC entry 3304 (class 2606 OID 16402)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 3306 (class 2606 OID 16400)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3319 (class 1259 OID 16442)
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- TOC entry 3309 (class 1259 OID 16418)
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- TOC entry 3312 (class 1259 OID 16417)
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- TOC entry 3354 (class 2620 OID 16593)
-- Name: projects give_creator_full_access; Type: TRIGGER; Schema: public; Owner: root
--

CREATE TRIGGER give_creator_full_access AFTER INSERT ON public.projects FOR EACH ROW EXECUTE FUNCTION public.give_creator_full_access_function();


--
-- TOC entry 3352 (class 2606 OID 16578)
-- Name: comments comments_task_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_task_id_foreign FOREIGN KEY (task_id) REFERENCES public.tasks(id) ON DELETE SET NULL;


--
-- TOC entry 3353 (class 2606 OID 16573)
-- Name: comments comments_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- TOC entry 3343 (class 2606 OID 16485)
-- Name: notifications notifications_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- TOC entry 3344 (class 2606 OID 16504)
-- Name: project_participants project_participants_project_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.project_participants
    ADD CONSTRAINT project_participants_project_id_foreign FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE SET NULL;


--
-- TOC entry 3345 (class 2606 OID 16518)
-- Name: project_participants project_participants_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.project_participants
    ADD CONSTRAINT project_participants_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE SET NULL;


--
-- TOC entry 3346 (class 2606 OID 16499)
-- Name: project_participants project_participants_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.project_participants
    ADD CONSTRAINT project_participants_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- TOC entry 3347 (class 2606 OID 16535)
-- Name: project_permissions project_permissions_project_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.project_permissions
    ADD CONSTRAINT project_permissions_project_id_foreign FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE SET NULL;


--
-- TOC entry 3348 (class 2606 OID 16540)
-- Name: project_permissions project_permissions_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.project_permissions
    ADD CONSTRAINT project_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE SET NULL;


--
-- TOC entry 3349 (class 2606 OID 16530)
-- Name: project_permissions project_permissions_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.project_permissions
    ADD CONSTRAINT project_permissions_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- TOC entry 3342 (class 2606 OID 16471)
-- Name: projects projects_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- TOC entry 3350 (class 2606 OID 16554)
-- Name: tasks tasks_asignee_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_asignee_foreign FOREIGN KEY (asignee) REFERENCES public.users(id);


--
-- TOC entry 3351 (class 2606 OID 16559)
-- Name: tasks tasks_project_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_project_id_foreign FOREIGN KEY (project_id) REFERENCES public.projects(id);


-- Completed on 2025-01-15 08:05:17 UTC

--
-- PostgreSQL database dump complete
--

