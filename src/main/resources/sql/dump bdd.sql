--
-- PostgreSQL database dump
--
 -- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2
 -- Started on 2020-02-21 10:38:32

SET statement_timeout = 0;


SET lock_timeout = 0;


SET idle_in_transaction_session_timeout = 0;


SET client_encoding = 'UTF8';


SET standard_conforming_strings = ON;


SELECT pg_catalog.set_config('search_path', '', FALSE);


SET check_function_bodies = FALSE;


SET client_min_messages = warning;


SET row_security = OFF;


DROP DATABASE "db_oc_escaladeV1";

--
-- TOC entry 2916 (class 1262 OID 26168)
-- Name: db_oc_escaladeV1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "db_oc_escaladeV1" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';


ALTER DATABASE "db_oc_escaladeV1" OWNER TO postgres;

\connect "db_oc_escaladeV1"
SET statement_timeout = 0;


SET lock_timeout = 0;


SET idle_in_transaction_session_timeout = 0;


SET client_encoding = 'UTF8';


SET standard_conforming_strings = ON;


SELECT pg_catalog.set_config('search_path', '', FALSE);


SET check_function_bodies = FALSE;


SET client_min_messages = warning;


SET row_security = OFF;

--
-- TOC entry 213 (class 1259 OID 26279)
-- Name: commentaire_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.commentaire_seq
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


ALTER TABLE public.commentaire_seq OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 26281)
-- Name: longueur_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.longueur_seq
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


ALTER TABLE public.longueur_seq OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 26271)
-- Name: secteur_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.secteur_seq
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


ALTER TABLE public.secteur_seq OWNER TO postgres;


SET default_tablespace = '';


SET default_with_oids = FALSE;

--
-- TOC entry 197 (class 1259 OID 26171)
-- Name: t_site_escalade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_site_escalade (sit_id integer NOT NULL,
                                                    sit_loc_pays CHARACTER varying(32) NOT NULL,
                                                                                       sit_adresse CHARACTER varying(64) NOT NULL,
                                                                                                                         sit_nom CHARACTER varying(32) NOT NULL,
                                                                                                                                                       sit_tag CHARACTER varying(32));


ALTER TABLE public.t_site_escalade OWNER TO postgres;

--
-- TOC entry 2917 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN t_site_escalade.sit_tag; Type: COMMENT; Schema: public; Owner: postgres
--
 COMMENT ON COLUMN public.t_site_escalade.sit_tag IS 'F6 :Unmembredel''associationdoitpouvoirtaguerunsited’escaladeenregistré sur la plateforme comme « Officiel Les amis de l’escalade ».';

--
-- TOC entry 196 (class 1259 OID 26169)
-- Name: site_escalade_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.site_escalade_site_id_seq
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


ALTER TABLE public.site_escalade_site_id_seq OWNER TO postgres;

--
-- TOC entry 2918 (class 0 OID 0)
-- Dependencies: 196
-- Name: site_escalade_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.site_escalade_site_id_seq OWNED BY public.t_site_escalade.sit_id;

--
-- TOC entry 210 (class 1259 OID 26273)
-- Name: site_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.site_seq
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


ALTER TABLE public.site_seq OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 26215)
-- Name: t_commentaire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_commentaire (commentaire_id integer NOT NULL,
                                                          sit_id integer NOT NULL,
                                                                         utilisateur_id integer NOT NULL,
                                                                                                com_horodatage_creation TIMESTAMP WITHOUT TIME ZONE NOT NULL,
                                                                                                                                                    com_texte CHARACTER varying(140) NOT NULL);


ALTER TABLE public.t_commentaire OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 26213)
-- Name: t_commentaire_commentaire_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_commentaire_commentaire_id_seq
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


ALTER TABLE public.t_commentaire_commentaire_id_seq OWNER TO postgres;

--
-- TOC entry 2919 (class 0 OID 0)
-- Dependencies: 206
-- Name: t_commentaire_commentaire_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_commentaire_commentaire_id_seq OWNED BY public.t_commentaire.commentaire_id;

--
-- TOC entry 202 (class 1259 OID 26193)
-- Name: t_longueur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_longueur (lon_id integer NOT NULL,
                                               voi_id integer NOT NULL,
                                                              lon_nom CHARACTER varying(32) NOT NULL,
                                                                                            lon_cotation CHARACTER varying(5) NOT NULL);


ALTER TABLE public.t_longueur OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 26198)
-- Name: t_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_role (role_id integer NOT NULL,
                                            rol_nom CHARACTER varying(32) NOT NULL);


ALTER TABLE public.t_role OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 26221)
-- Name: t_role_utilisateur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_role_utilisateur (role_id integer NOT NULL,
                                                        utilisateur_id integer NOT NULL);


ALTER TABLE public.t_role_utilisateur OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 26179)
-- Name: t_secteur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_secteur (secteur_id integer NOT NULL,
                                                  sit_id integer NOT NULL,
                                                                 sec_nom CHARACTER varying(32) NOT NULL);


ALTER TABLE public.t_secteur OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 26177)
-- Name: t_secteur_secteur_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_secteur_secteur_id_seq
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


ALTER TABLE public.t_secteur_secteur_id_seq OWNER TO postgres;

--
-- TOC entry 2920 (class 0 OID 0)
-- Dependencies: 198
-- Name: t_secteur_secteur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_secteur_secteur_id_seq OWNED BY public.t_secteur.secteur_id;

--
-- TOC entry 205 (class 1259 OID 26208)
-- Name: t_topo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_topo (topo_id integer NOT NULL,
                                            utilisateur_createur_id integer NOT NULL,
                                                                            utilisateur_emprunteur_id integer, top_date_parution CHARACTER varying(25) NOT NULL,
                                                                                                                                                       top_nom CHARACTER varying(32) NOT NULL,
                                                                                                                                                                                     top_description CHARACTER varying(350) NOT NULL,
                                                                                                                                                                                                                            top_lieu CHARACTER varying(32) NOT NULL,
                                                                                                                                                                                                                                                           top_disponibilite boolean NOT NULL,
                                                                                                                                                                                                                                                                                     top_confirmation_reservation boolean DEFAULT FALSE,
                                                                                                                                                                                                                                                                                                                                  top_demande_reservation CHARACTER varying(12) DEFAULT NULL::CHARACTER varying);


ALTER TABLE public.t_topo OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 26203)
-- Name: t_utilisateur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_utilisateur (utilisateur_id integer NOT NULL,
                                                          utill_nom CHARACTER varying(32) NOT NULL,
                                                                                          utill_prenom CHARACTER varying(32) NOT NULL,
                                                                                                                             utill_telephone CHARACTER varying(12) NOT NULL,
                                                                                                                                                                   utill_mail CHARACTER varying(32) NOT NULL,
                                                                                                                                                                                                    utill_mot_de_passe CHARACTER varying(255) NOT NULL,
                                                                                                                                                                                                                                              util_pseudo CHARACTER varying(12) NOT NULL);


ALTER TABLE public.t_utilisateur OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 26187)
-- Name: t_voie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_voie (voi_id integer NOT NULL,
                                           secteur_id integer NOT NULL,
                                                              voi_nom CHARACTER varying(32) NOT NULL,
                                                                                            voi_altitude CHARACTER varying(32) NOT NULL,
                                                                                                                               voi_type_roche CHARACTER varying(32) NOT NULL);


ALTER TABLE public.t_voie OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 26283)
-- Name: topo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.topo_seq
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


ALTER TABLE public.topo_seq OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 26275)
-- Name: utilisateur_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilisateur_seq
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


ALTER TABLE public.utilisateur_seq OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 26277)
-- Name: voie_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.voie_seq
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


ALTER TABLE public.voie_seq OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 26185)
-- Name: voie_voie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.voie_voie_id_seq
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


ALTER TABLE public.voie_voie_id_seq OWNER TO postgres;

--
-- TOC entry 2921 (class 0 OID 0)
-- Dependencies: 200
-- Name: voie_voie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.voie_voie_id_seq OWNED BY public.t_voie.voi_id;

--
-- TOC entry 2742 (class 2604 OID 26218)
-- Name: t_commentaire commentaire_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_commentaire
ALTER COLUMN commentaire_id
SET DEFAULT nextval('public.t_commentaire_commentaire_id_seq'::regclass);

--
-- TOC entry 2738 (class 2604 OID 26182)
-- Name: t_secteur secteur_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_secteur
ALTER COLUMN secteur_id
SET DEFAULT nextval('public.t_secteur_secteur_id_seq'::regclass);

--
-- TOC entry 2737 (class 2604 OID 26174)
-- Name: t_site_escalade sit_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_site_escalade
ALTER COLUMN sit_id
SET DEFAULT nextval('public.site_escalade_site_id_seq'::regclass);

--
-- TOC entry 2739 (class 2604 OID 26190)
-- Name: t_voie voi_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_voie
ALTER COLUMN voi_id
SET DEFAULT nextval('public.voie_voie_id_seq'::regclass);

-- Completed on 2020-02-21 10:38:32
 --
-- PostgreSQL database dump complete
--
