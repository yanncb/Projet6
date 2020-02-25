
SQLFormat
Online SQL formatting service

    Home Format SQL statements
    About Learn about this tool
    Source Code Formatter Code (Python)
    API Use it everywhere

SQLFormat is a free online formatter for SQL statements. Enter your SQL statement in the textarea below and click "Format SQL" [Ctrl+Enter]. To upload a file use the button right below the textarea.

In addition to this web interface SQLFormat provides an API. Or you can download the Python module that powers this service to use it in your own applications. See source code for details.
Type your SQL here:
Accepted file types are plain text files and SQLite3 databases, maximal file size is 1 MB.
Options: Show plain text | Copy to clipboard | Print result

--
-- PostgreSQL database dump
--
 -- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2
 -- Started on 2020-02-21 10:42:23

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

--
-- TOC entry 2902 (class 0 OID 26215)
-- Dependencies: 207
-- Data for Name: t_commentaire; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.t_commentaire (commentaire_id, sit_id, utilisateur_id, com_horodatage_creation, com_texte)
VALUES (6, 1, 8, '2020-02-17 12:00:22.948', 'coucou c moi');

--
-- TOC entry 2897 (class 0 OID 26193)
-- Dependencies: 202
-- Data for Name: t_longueur; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.t_longueur (lon_id, voi_id, lon_nom, lon_cotation)
VALUES (6, 3, 're', 'zrez');


INSERT INTO public.t_longueur (lon_id, voi_id, lon_nom, lon_cotation)
VALUES (9, 6, '1', '6B');


INSERT INTO public.t_longueur (lon_id, voi_id, lon_nom, lon_cotation)
VALUES (10, 6, 'Longueur 2', '4C');


INSERT INTO public.t_longueur (lon_id, voi_id, lon_nom, lon_cotation)
VALUES (7, 5, 'longueur 222', 'b3');


INSERT INTO public.t_longueur (lon_id, voi_id, lon_nom, lon_cotation)
VALUES (8, 5, 'Longueur 23', '4C');

--
-- TOC entry 2898 (class 0 OID 26198)
-- Dependencies: 203
-- Data for Name: t_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.t_role (role_id, rol_nom)
VALUES (1, 'ADMIN');


INSERT INTO public.t_role (role_id, rol_nom)
VALUES (2, 'MEMBRE');

--
-- TOC entry 2903 (class 0 OID 26221)
-- Dependencies: 208
-- Data for Name: t_role_utilisateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.t_role_utilisateur (role_id, utilisateur_id)
VALUES (1, 8);

--
-- TOC entry 2894 (class 0 OID 26179)
-- Dependencies: 199
-- Data for Name: t_secteur; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.t_secteur (secteur_id, sit_id, sec_nom)
VALUES (1, 1, 'Secteur 1');


INSERT INTO public.t_secteur (secteur_id, sit_id, sec_nom)
VALUES (2, 1, 'Secteur 2 1');

--
-- TOC entry 2892 (class 0 OID 26171)
-- Dependencies: 197
-- Data for Name: t_site_escalade; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.t_site_escalade (sit_id, sit_loc_pays, sit_adresse, sit_nom, sit_tag)
VALUES (2, 'France', '8 rue du puit', 'Mont st michel !', 'Amis de l''escalade');


INSERT INTO public.t_site_escalade (sit_id, sit_loc_pays, sit_adresse, sit_nom, sit_tag)
VALUES (1, 'Espagne', '2 rue du coin', 'garlaban', NULL);

--
-- TOC entry 2900 (class 0 OID 26208)
-- Dependencies: 205
-- Data for Name: t_topo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.t_topo (topo_id, utilisateur_createur_id, utilisateur_emprunteur_id, top_date_parution, top_nom, top_description, top_lieu, top_disponibilite, top_confirmation_reservation, top_demande_reservation)
VALUES (8, 8, NULL, '1111-11-11', 'Agen', 'le topo c''est rigolo', 'Garlaban', FALSE, TRUE, 'Validée');


INSERT INTO public.t_topo (topo_id, utilisateur_createur_id, utilisateur_emprunteur_id, top_date_parution, top_nom, top_description, top_lieu, top_disponibilite, top_confirmation_reservation, top_demande_reservation)
VALUES (10, 11, NULL, '2020-12-31', 'toptop', 'Le topo est beau', 'Garlaban', TRUE, FALSE, NULL);


INSERT INTO public.t_topo (topo_id, utilisateur_createur_id, utilisateur_emprunteur_id, top_date_parution, top_nom, top_description, top_lieu, top_disponibilite, top_confirmation_reservation, top_demande_reservation)
VALUES (9, 8, 11, '1212-12-12', 'TopoNom', 'Le topo est beau', 'Garlaban', TRUE, FALSE, 'En cours');

--
-- TOC entry 2899 (class 0 OID 26203)
-- Dependencies: 204
-- Data for Name: t_utilisateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.t_utilisateur (utilisateur_id, utill_nom, utill_prenom, utill_telephone, utill_mail, utill_mot_de_passe, util_pseudo)
VALUES (6, 'DUPOND', 'louis', '0600000000', 'coucou@enedis.fr', '$2a$10$hzct7elQGLTrdH.TGI2BCezRh7dddKGTU9y7UMAFkyWis6F/DlsTa', 'user');


INSERT INTO public.t_utilisateur (utilisateur_id, utill_nom, utill_prenom, utill_telephone, utill_mail, utill_mot_de_passe, util_pseudo)
VALUES (7, 'DUPOND', 'David', '0600000000', 'coucou@enedis.fr', '$2a$10$a9Y2jBlha2szudSya7/K2etwhizMNdIu4mCUFq9aV/okdbDsVfoRK', 'azerty');


INSERT INTO public.t_utilisateur (utilisateur_id, utill_nom, utill_prenom, utill_telephone, utill_mail, utill_mot_de_passe, util_pseudo)
VALUES (8, 'admin', 'admin', '0600000000', 'admin@admin.fr', '$2a$10$8u1edwUO1XonK5EevHo8n.hNFyrcELEHj6MVkFk37jKPHgVbl2UIS', 'admin');


INSERT INTO public.t_utilisateur (utilisateur_id, utill_nom, utill_prenom, utill_telephone, utill_mail, utill_mot_de_passe, util_pseudo)
VALUES (9, 'DUPOND', 'prenom', '0600000000', 'coucou@enedis.fr', '$2a$10$/q5i4hVOUexSydeRqohcBeN.krGbu7COEZlftHC/0fpq8YEXyu5C2', 'pseudo');


INSERT INTO public.t_utilisateur (utilisateur_id, utill_nom, utill_prenom, utill_telephone, utill_mail, utill_mot_de_passe, util_pseudo)
VALUES (10, 'Moutard', 'Colonel', '0600000000', 'coucou@enedis.fr', '$2a$10$0HRcDyLCDHYPzZZldH3E2uIlwWTprXaj9pUQA4kemL4FEY1sNn.Q2', 'cluedo');


INSERT INTO public.t_utilisateur (utilisateur_id, utill_nom, utill_prenom, utill_telephone, utill_mail, utill_mot_de_passe, util_pseudo)
VALUES (11, 'membre', 'Jean-michel', '0600000000', 'coucou@enedis.fr', '$2a$10$TUA2voinjJ5lzKzjdcD9p.kGr7ETb0/x3mFqxFDtVU1J3dszWR0gu', 'membre');

--
-- TOC entry 2896 (class 0 OID 26187)
-- Dependencies: 201
-- Data for Name: t_voie; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.t_voie (voi_id, secteur_id, voi_nom, voi_altitude, voi_type_roche)
VALUES (5, 1, '2', '600', 'ardoise');


INSERT INTO public.t_voie (voi_id, secteur_id, voi_nom, voi_altitude, voi_type_roche)
VALUES (3, 1, '11', '1231', 'granit');


INSERT INTO public.t_voie (voi_id, secteur_id, voi_nom, voi_altitude, voi_type_roche)
VALUES (6, 2, '12', '1000', 'granit');

--
-- TOC entry 2922 (class 0 OID 0)
-- Dependencies: 213
-- Name: commentaire_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.commentaire_seq', 8, TRUE);

--
-- TOC entry 2923 (class 0 OID 0)
-- Dependencies: 214
-- Name: longueur_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.longueur_seq', 10, TRUE);

--
-- TOC entry 2924 (class 0 OID 0)
-- Dependencies: 209
-- Name: secteur_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.secteur_seq', 4, TRUE);

--
-- TOC entry 2925 (class 0 OID 0)
-- Dependencies: 196
-- Name: site_escalade_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.site_escalade_site_id_seq', 1, FALSE);

--
-- TOC entry 2926 (class 0 OID 0)
-- Dependencies: 210
-- Name: site_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.site_seq', 3, TRUE);

--
-- TOC entry 2927 (class 0 OID 0)
-- Dependencies: 206
-- Name: t_commentaire_commentaire_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_commentaire_commentaire_id_seq', 1, FALSE);

--
-- TOC entry 2928 (class 0 OID 0)
-- Dependencies: 198
-- Name: t_secteur_secteur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_secteur_secteur_id_seq', 1, FALSE);

--
-- TOC entry 2929 (class 0 OID 0)
-- Dependencies: 215
-- Name: topo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.topo_seq', 10, TRUE);

--
-- TOC entry 2930 (class 0 OID 0)
-- Dependencies: 211
-- Name: utilisateur_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilisateur_seq', 11, TRUE);

--
-- TOC entry 2931 (class 0 OID 0)
-- Dependencies: 212
-- Name: voie_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.voie_seq', 6, TRUE);

--
-- TOC entry 2932 (class 0 OID 0)
-- Dependencies: 200
-- Name: voie_voie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.voie_voie_id_seq', 1, FALSE);

--
-- TOC entry 2758 (class 2606 OID 26220)
-- Name: t_commentaire t_commentaire_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_commentaire ADD CONSTRAINT t_commentaire_pk PRIMARY KEY (commentaire_id);

--
-- TOC entry 2750 (class 2606 OID 26197)
-- Name: t_longueur t_longueur_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_longueur ADD CONSTRAINT t_longueur_pk PRIMARY KEY (lon_id);

--
-- TOC entry 2752 (class 2606 OID 26202)
-- Name: t_role t_role_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_role ADD CONSTRAINT t_role_pk PRIMARY KEY (role_id);

--
-- TOC entry 2760 (class 2606 OID 26225)
-- Name: t_role_utilisateur t_role_utilisateur_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_role_utilisateur ADD CONSTRAINT t_role_utilisateur_pk PRIMARY KEY (role_id,
                                                                                             utilisateur_id);

--
-- TOC entry 2746 (class 2606 OID 26184)
-- Name: t_secteur t_secteur_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_secteur ADD CONSTRAINT t_secteur_pk PRIMARY KEY (secteur_id);

--
-- TOC entry 2744 (class 2606 OID 26176)
-- Name: t_site_escalade t_site_escalade_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_site_escalade ADD CONSTRAINT t_site_escalade_pk PRIMARY KEY (sit_id);

--
-- TOC entry 2756 (class 2606 OID 26212)
-- Name: t_topo t_topo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_topo ADD CONSTRAINT t_topo_pk PRIMARY KEY (topo_id);

--
-- TOC entry 2754 (class 2606 OID 26207)
-- Name: t_utilisateur t_utilisateur_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_utilisateur ADD CONSTRAINT t_utilisateur_pk PRIMARY KEY (utilisateur_id);

--
-- TOC entry 2748 (class 2606 OID 26192)
-- Name: t_voie t_voie_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_voie ADD CONSTRAINT t_voie_pk PRIMARY KEY (voi_id);

--
-- TOC entry 2761 (class 2606 OID 26226)
-- Name: t_secteur secteur_site_escalade_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_secteur ADD CONSTRAINT secteur_site_escalade_fk
FOREIGN KEY (sit_id) REFERENCES public.t_site_escalade(sit_id);

--
-- TOC entry 2768 (class 2606 OID 26246)
-- Name: t_role_utilisateur t_role_t_role_utilisateur_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_role_utilisateur ADD CONSTRAINT t_role_t_role_utilisateur_fk
FOREIGN KEY (role_id) REFERENCES public.t_role(role_id);

--
-- TOC entry 2762 (class 2606 OID 26236)
-- Name: t_voie t_secteur_t_voie_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_voie ADD CONSTRAINT t_secteur_t_voie_fk
FOREIGN KEY (secteur_id) REFERENCES public.t_secteur(secteur_id);

--
-- TOC entry 2766 (class 2606 OID 26231)
-- Name: t_commentaire t_site_escalade_t_commentaire_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_commentaire ADD CONSTRAINT t_site_escalade_t_commentaire_fk
FOREIGN KEY (sit_id) REFERENCES public.t_site_escalade(sit_id);

--
-- TOC entry 2767 (class 2606 OID 26256)
-- Name: t_commentaire t_utilisateur_t_commentaire_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_commentaire ADD CONSTRAINT t_utilisateur_t_commentaire_fk
FOREIGN KEY (utilisateur_id) REFERENCES public.t_utilisateur(utilisateur_id);

--
-- TOC entry 2769 (class 2606 OID 26251)
-- Name: t_role_utilisateur t_utilisateur_t_role_utilisateur_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_role_utilisateur ADD CONSTRAINT t_utilisateur_t_role_utilisateur_fk
FOREIGN KEY (utilisateur_id) REFERENCES public.t_utilisateur(utilisateur_id);

--
-- TOC entry 2764 (class 2606 OID 26261)
-- Name: t_topo t_utilisateur_t_topo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_topo ADD CONSTRAINT t_utilisateur_t_topo_fk
FOREIGN KEY (utilisateur_emprunteur_id) REFERENCES public.t_utilisateur(utilisateur_id);

--
-- TOC entry 2765 (class 2606 OID 26266)
-- Name: t_topo t_utilisateur_t_topo_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_topo ADD CONSTRAINT t_utilisateur_t_topo_fk1
FOREIGN KEY (utilisateur_createur_id) REFERENCES public.t_utilisateur(utilisateur_id);

--
-- TOC entry 2763 (class 2606 OID 26241)
-- Name: t_longueur t_voie_t_longueur_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_longueur ADD CONSTRAINT t_voie_t_longueur_fk
FOREIGN KEY (voi_id) REFERENCES public.t_voie(voi_id);

-- Completed on 2020-02-21 10:42:23
 --
-- PostgreSQL database dump complete
--
