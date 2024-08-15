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
-- Name: astronaut; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronaut (
    astronaut_id integer NOT NULL,
    name character varying(20) NOT NULL,
    missions_completed integer NOT NULL,
    is_active boolean NOT NULL,
    biography text
);


ALTER TABLE public.astronaut OWNER TO freecodecamp;

--
-- Name: astronaut_astronaut_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronaut_astronaut_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronaut_astronaut_id_seq OWNER TO freecodecamp;

--
-- Name: astronaut_astronaut_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronaut_astronaut_id_seq OWNED BY public.astronaut.astronaut_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    is_spiral boolean NOT NULL,
    type character varying(10),
    age_in_billions_of_years numeric(5,2),
    description text
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
    name character varying(20) NOT NULL,
    has_atmosphere boolean NOT NULL,
    type character varying(10),
    diameter_km integer NOT NULL,
    description text,
    planet_id integer
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    has_rings boolean NOT NULL,
    type character varying(10),
    mass_in_earth_masses numeric(10,3),
    orbital_period_days integer,
    star_id integer
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
    name character varying(20) NOT NULL,
    is_main_sequence boolean NOT NULL,
    type character varying(10),
    mass_in_solar_masses numeric(5,2),
    temperature integer NOT NULL,
    galaxy_id integer
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
-- Name: astronaut astronaut_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut ALTER COLUMN astronaut_id SET DEFAULT nextval('public.astronaut_astronaut_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: astronaut; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronaut VALUES (1, 'Neil Armstrong', 2, false, 'First person to walk on the Moon.');
INSERT INTO public.astronaut VALUES (2, 'Buzz Aldrin', 2, false, 'Second person to walk on the Moon.');
INSERT INTO public.astronaut VALUES (3, 'Sally Ride', 2, false, 'First American woman in space.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, 'Spiral', 13.50, 'A barred spiral galaxy containing our Solar System.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', true, 'Spiral', 10.00, 'The nearest spiral galaxy to the Milky Way and the largest in the local group.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', true, 'Spiral', 12.30, 'A member of the local group of galaxies.');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', true, 'Spiral', 6.00, 'Known for its spiral structure.');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', false, 'Elliptical', 10.20, 'An unbarred spiral galaxy in the constellation Virgo.');
INSERT INTO public.galaxy VALUES (6, 'Black Eye', true, 'Spiral', 7.30, 'Also known as the Evil Eye Galaxy due to the dark band of absorbing dust...');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', false, NULL, 3474, 'The Earth’s only natural satellite.', 39);
INSERT INTO public.moon VALUES (2, 'Phobos', false, NULL, 22, 'A moon of Mars, small and irregularly shaped.', 37);
INSERT INTO public.moon VALUES (3, 'Deimos', false, NULL, 12, 'The smaller of the two moons of Mars.', 38);
INSERT INTO public.moon VALUES (4, 'Io', true, NULL, 3643, 'A moon of Jupiter, the most volcanically active body in the solar system.', 39);
INSERT INTO public.moon VALUES (5, 'Europa', true, NULL, 3122, 'A moon of Jupiter, believed to have a subsurface ocean.', 40);
INSERT INTO public.moon VALUES (6, 'Ganymede', true, NULL, 5262, 'The largest moon in the solar system, orbiting Jupiter.', 41);
INSERT INTO public.moon VALUES (7, 'Callisto', false, NULL, 4821, 'A heavily cratered moon of Jupiter.', 42);
INSERT INTO public.moon VALUES (8, 'Kepler-22b I', false, NULL, 300, 'A moon orbiting Kepler-22b.', 43);
INSERT INTO public.moon VALUES (9, 'Kepler-22b II', false, NULL, 200, 'Another moon orbiting Kepler-22b.', 44);
INSERT INTO public.moon VALUES (10, 'Gliese 581d I', false, NULL, 150, 'A moon orbiting Gliese 581d.', 45);
INSERT INTO public.moon VALUES (11, 'Proxima b I', false, NULL, 100, 'A moon orbiting Proxima b.', 46);
INSERT INTO public.moon VALUES (12, 'Vega IXa', true, NULL, 500, 'A moon orbiting Vega IX.', 47);
INSERT INTO public.moon VALUES (13, 'Vega IXb', true, NULL, 600, 'Another moon orbiting Vega IX.', 48);
INSERT INTO public.moon VALUES (14, 'Vega Xa', false, NULL, 400, 'A moon orbiting Vega X.', 37);
INSERT INTO public.moon VALUES (15, 'Rigel Ia', true, NULL, 700, 'A moon orbiting Rigel I.', 38);
INSERT INTO public.moon VALUES (16, 'Rigel Ib', false, NULL, 800, 'Another moon orbiting Rigel I.', 39);
INSERT INTO public.moon VALUES (17, 'Rigel IIa', true, NULL, 350, 'A moon orbiting Rigel II.', 40);
INSERT INTO public.moon VALUES (18, 'Rigel IIb', true, NULL, 300, 'Another moon orbiting Rigel II.', 41);
INSERT INTO public.moon VALUES (19, 'Rigel IIIa', false, NULL, 550, 'A moon orbiting Rigel III.', 42);
INSERT INTO public.moon VALUES (20, 'Rigel IVa', false, NULL, 650, 'A moon orbiting Rigel IV.', 43);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (37, 'Earth', false, NULL, 1.000, 365, 2);
INSERT INTO public.planet VALUES (38, 'Mars', false, NULL, 0.107, 687, 7);
INSERT INTO public.planet VALUES (39, 'Jupiter', true, NULL, 317.800, 4333, 7);
INSERT INTO public.planet VALUES (40, 'Kepler-22b', false, NULL, 2.400, 289, 2);
INSERT INTO public.planet VALUES (41, 'Gliese 581d', false, NULL, 7.000, 67, 3);
INSERT INTO public.planet VALUES (42, 'Proxima b', false, NULL, 1.270, 11, 4);
INSERT INTO public.planet VALUES (43, 'Vega IX', false, NULL, 0.500, 1000, 5);
INSERT INTO public.planet VALUES (44, 'Vega X', false, NULL, 0.700, 1500, 5);
INSERT INTO public.planet VALUES (45, 'Rigel I', false, NULL, 4.000, 500, 6);
INSERT INTO public.planet VALUES (46, 'Rigel II', true, NULL, 8.000, 1000, 6);
INSERT INTO public.planet VALUES (47, 'Rigel III', false, NULL, 1.500, 200, 6);
INSERT INTO public.planet VALUES (48, 'Rigel IV', false, NULL, 3.000, 800, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sun', true, NULL, 1.00, 5778, 1);
INSERT INTO public.star VALUES (3, 'Sirius', true, NULL, 2.06, 9940, 2);
INSERT INTO public.star VALUES (4, 'Betelgeuse', false, NULL, 18.00, 3500, 3);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', true, NULL, 0.12, 3042, 1);
INSERT INTO public.star VALUES (6, 'Vega', true, NULL, 2.14, 9602, 2);
INSERT INTO public.star VALUES (7, 'Rigel', false, NULL, 21.00, 12100, 3);


--
-- Name: astronaut_astronaut_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronaut_astronaut_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 48, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: astronaut astronaut_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT astronaut_name_key UNIQUE (name);


--
-- Name: astronaut astronaut_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT astronaut_pkey PRIMARY KEY (astronaut_id);


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
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


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

