--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    black_hole_id integer NOT NULL,
    mass_in_suns numeric DEFAULT 0 NOT NULL
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_holes_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_holes_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_holes_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_holes_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_holes_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    distance numeric DEFAULT 0 NOT NULL,
    num_of_stars text,
    life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    stolen boolean DEFAULT false,
    num_of_siblings integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moom_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moom_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moom_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moom_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moom_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    habitable boolean DEFAULT false NOT NULL,
    is_earth boolean DEFAULT false NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    age bigint,
    num_of_planets integer,
    star_system text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_holes_black_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moom_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES ('Sagittarius A', 2, 1, 4000000);
INSERT INTO public.black_hole VALUES ('Gaia BH3', 2, 2, 33);
INSERT INTO public.black_hole VALUES ('M31', 1, 3, 100000000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 260000, '1 trillion', false);
INSERT INTO public.galaxy VALUES (6, 'Knife Edge Galaxy', 200000, 'Unknown', false);
INSERT INTO public.galaxy VALUES (5, 'Helix Nebula', 3, '1', false);
INSERT INTO public.galaxy VALUES (4, 'Godzilla Galaxy', 463000, '1 trillion', false);
INSERT INTO public.galaxy VALUES (3, 'Fried Egg Galaxy', 50000, 'Few billion', false);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 100000, '100 billion', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, 1);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, 1);
INSERT INTO public.moon VALUES (4, 'Mimas', 6, false, 6);
INSERT INTO public.moon VALUES (5, 'Enceladus', 6, false, 6);
INSERT INTO public.moon VALUES (6, 'Tethys', 6, false, 6);
INSERT INTO public.moon VALUES (7, 'Dione', 6, false, 6);
INSERT INTO public.moon VALUES (8, 'Rhea', 6, false, 6);
INSERT INTO public.moon VALUES (9, 'Titan', 6, false, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, false, 6);
INSERT INTO public.moon VALUES (11, 'Io', 3, false, 5);
INSERT INTO public.moon VALUES (12, 'Europa', 3, false, 5);
INSERT INTO public.moon VALUES (13, 'Ganymede', 3, false, 5);
INSERT INTO public.moon VALUES (14, 'Callisto', 3, false, 5);
INSERT INTO public.moon VALUES (1, 'Moon', 1, true, 0);
INSERT INTO public.moon VALUES (15, 'Bianca', 12, false, 7);
INSERT INTO public.moon VALUES (16, 'Cressida', 12, false, 7);
INSERT INTO public.moon VALUES (17, 'Desdemona', 12, false, 7);
INSERT INTO public.moon VALUES (18, 'Juliet', 12, false, 7);
INSERT INTO public.moon VALUES (19, 'Portia', 12, false, 7);
INSERT INTO public.moon VALUES (20, 'Rosalind', 12, false, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, true);
INSERT INTO public.planet VALUES (2, 'Mercury', 1, false, false);
INSERT INTO public.planet VALUES (3, 'Venus', 1, false, false);
INSERT INTO public.planet VALUES (4, 'Mars', 1, false, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, false, false);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 2, false, false);
INSERT INTO public.planet VALUES (10, 'Kepler-444b', 3, false, false);
INSERT INTO public.planet VALUES (11, 'Kepler-444c', 3, false, false);
INSERT INTO public.planet VALUES (12, 'Kepler-444d', 3, false, false);
INSERT INTO public.planet VALUES (13, 'Kepler-444e', 3, false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 4853000000, 3, 'Alpha Centauri');
INSERT INTO public.star VALUES (1, 'Sun', 2, 4600000000, 8, 'Solar System');
INSERT INTO public.star VALUES (3, 'Kepler-444 A', 2, 11200000000, 5, 'Kepler 444');
INSERT INTO public.star VALUES (4, 'Gliese 581', 2, 2001000000, 3, 'Gilese 581 System');
INSERT INTO public.star VALUES (5, 'Alpha Andromedae', 1, 60000000, 4, 'Alpheratz System');
INSERT INTO public.star VALUES (6, 'Sirius', 2, 228000000, 0, 'Sirius System');


--
-- Name: black_holes_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_holes_black_hole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moom_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moom_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: black_hole black_hole_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name UNIQUE (name);


--
-- Name: black_hole black_holes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_holes_pkey PRIMARY KEY (black_hole_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moom_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moom_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: black_hole black_holes_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_holes_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

