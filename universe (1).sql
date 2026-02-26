--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    type character varying(30),
    location character varying(30),
    size integer,
    coolness_factor integer NOT NULL
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
    name character varying(30),
    galaxy_id integer NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(5,1),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    moon_id integer,
    name character varying(30),
    coolness_factor integer NOT NULL
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    galaxy_id integer NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(5,1),
    star_id integer NOT NULL,
    coolness_factor integer NOT NULL
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
    name character varying(30),
    galaxy_id integer NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(5,1),
    coolness_factor integer NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'Hercules A', NULL, NULL, NULL, 1);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'near', 'close', 1, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'far', NULL, NULL, 1);
INSERT INTO public.galaxy VALUES (4, NULL, 'wide', 'far', 2, 1);
INSERT INTO public.galaxy VALUES (5, NULL, NULL, 'far', 6, 1);
INSERT INTO public.galaxy VALUES (6, NULL, NULL, 'very far', 12, 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Lunar', 1, 'Our Moon', false, true, 4601.0, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 1, 'Mars Moon', false, true, 4602.0, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 1, 'Other Mars  Moon', false, true, 4603.0, 2);
INSERT INTO public.moon VALUES (4, NULL, 1, NULL, false, NULL, NULL, 2);
INSERT INTO public.moon VALUES (5, NULL, 1, NULL, false, NULL, NULL, 3);
INSERT INTO public.moon VALUES (6, NULL, 1, NULL, false, NULL, NULL, 4);
INSERT INTO public.moon VALUES (7, NULL, 1, NULL, false, NULL, NULL, 3);
INSERT INTO public.moon VALUES (8, NULL, 1, NULL, false, NULL, NULL, 6);
INSERT INTO public.moon VALUES (9, NULL, 1, NULL, false, NULL, NULL, 7);
INSERT INTO public.moon VALUES (10, NULL, 1, NULL, false, NULL, NULL, 4);
INSERT INTO public.moon VALUES (11, NULL, 1, NULL, false, NULL, NULL, 8);
INSERT INTO public.moon VALUES (12, NULL, 1, NULL, false, NULL, NULL, 4);
INSERT INTO public.moon VALUES (13, NULL, 1, NULL, false, NULL, NULL, 8);
INSERT INTO public.moon VALUES (14, NULL, 1, NULL, false, NULL, NULL, 8);
INSERT INTO public.moon VALUES (15, NULL, 1, NULL, false, NULL, NULL, 5);
INSERT INTO public.moon VALUES (16, NULL, 1, NULL, false, NULL, NULL, 7);
INSERT INTO public.moon VALUES (17, NULL, 1, NULL, false, NULL, NULL, 3);
INSERT INTO public.moon VALUES (18, NULL, 1, NULL, false, NULL, NULL, 2);
INSERT INTO public.moon VALUES (19, NULL, 1, NULL, false, NULL, NULL, 7);
INSERT INTO public.moon VALUES (20, NULL, 1, NULL, false, NULL, NULL, 7);
INSERT INTO public.moon VALUES (21, NULL, 1, NULL, false, NULL, NULL, 7);
INSERT INTO public.moon VALUES (22, NULL, 1, NULL, false, NULL, NULL, 5);
INSERT INTO public.moon VALUES (23, NULL, 1, NULL, false, NULL, NULL, 5);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 1, 1, 1, 1, 'near', 3);
INSERT INTO public.more_info VALUES (2, 1, 2, 1, 1, NULL, 3);
INSERT INTO public.more_info VALUES (3, NULL, 2, 2, 1, 'null', 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Our planet', true, true, 4600.0, 1, 3);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Closest next planet', false, true, 4603.0, 1, 3);
INSERT INTO public.planet VALUES (3, 'Mercury', 1, 'Closest to Sun', false, true, 4502.0, 1, 3);
INSERT INTO public.planet VALUES (4, 'Venus', 1, NULL, NULL, NULL, NULL, 1, 3);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, NULL, NULL, NULL, NULL, 1, 3);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, NULL, NULL, NULL, NULL, 1, 3);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, NULL, NULL, NULL, NULL, 1, 3);
INSERT INTO public.planet VALUES (8, 'Saturn', 1, NULL, NULL, NULL, NULL, 1, 3);
INSERT INTO public.planet VALUES (9, 'Ceres', 1, NULL, NULL, NULL, NULL, 1, 3);
INSERT INTO public.planet VALUES (10, 'Pluto', 1, NULL, NULL, NULL, NULL, 1, 3);
INSERT INTO public.planet VALUES (11, 'Makemake', 1, NULL, NULL, NULL, NULL, 1, 3);
INSERT INTO public.planet VALUES (12, 'Eris', 1, NULL, NULL, NULL, NULL, 1, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'This is our solar sytem sun', false, true, 4600.0, 2);
INSERT INTO public.star VALUES (2, 'Canis Majoris', 1, 'Really big star', false, true, 10.0, 2);
INSERT INTO public.star VALUES (3, 'AH Scorpii', 1, 'Another big star', false, true, 8.0, 2);
INSERT INTO public.star VALUES (5, 'unknown star1', 1, NULL, NULL, NULL, 2345.0, 2);
INSERT INTO public.star VALUES (6, 'unknown star2', 3, NULL, true, NULL, 2412.3, 2);
INSERT INTO public.star VALUES (7, 'unknown star3', 2, NULL, true, false, 3442.3, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_more_info_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: more_info more_info_id_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_id_pkey PRIMARY KEY (more_info_id);


--
-- Name: more_info more_info_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_id_unique UNIQUE (more_info_id);


--
-- Name: galaxy name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: moon name_moon_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name_moon_unique UNIQUE (name);


--
-- Name: star name_star_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name_star_unique UNIQUE (name);


--
-- Name: planet name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

