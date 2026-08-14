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
    name character varying(50) NOT NULL,
    description text,
    is_spherical boolean,
    has_life boolean,
    galaxy_types integer,
    age_in_million_of_years numeric(8,2)
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
-- Name: galaxy_star_planet_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_star_planet_moon (
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying(40),
    galaxy_star_planet_moon_id integer NOT NULL
);


ALTER TABLE public.galaxy_star_planet_moon OWNER TO freecodecamp;

--
-- Name: galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq OWNED BY public.galaxy_star_planet_moon.galaxy_star_planet_moon_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    moon_types integer,
    age_in_million_of_years numeric(8,2),
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
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    planet_types integer,
    age_in_million_of_years numeric(8,2),
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
    name character varying(50) NOT NULL,
    description text,
    is_spherical boolean,
    has_life boolean,
    star_types integer,
    age_in_million_of_years numeric(8,2),
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon ALTER COLUMN galaxy_star_planet_moon_id SET DEFAULT nextval('public.galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy contains hundreds of billions of stars,gas and dust.it has a massive black hole at its center', false, true, 1, 13600.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'This is our nearest big neighbor galaxy.it is moving closer to the milky way.they will crash together in billion of years.', false, false, 2, 10000.00);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'It looks like a mexican hat. it has a bright center and a thick dark ring of dust.', false, false, 3, 13000.00);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'This is the third largest member of our local group of galaxies.it is rich in gas and forms new stars fast', false, false, 4, 15000.00);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic cloud', 'This is a satellite galaxy of the milky waay.it is visible from the southern hemisphere.', false, false, 5, 1100.00);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'It is famous for its long,winding spiral arms.a smaller galaxy is attached to one of its arm ,pulling on it.', false, false, 6, 400.00);


--
-- Data for Name: galaxy_star_planet_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_star_planet_moon VALUES (1, 1, 3, 1, 'First combination', 1);
INSERT INTO public.galaxy_star_planet_moon VALUES (1, 1, 4, 2, 'Second combination', 2);
INSERT INTO public.galaxy_star_planet_moon VALUES (1, 1, 4, 3, 'Third combination', 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'THE MOON', 'Earths only natural satellite. It is covered in grey craters, dark volcanic plains, and regolitic dust.', false, true, 1, 4500.00, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger and closer of Mars two small moons, it is heavily cratered and orbiting so low it will eventually crash into Mars.', false, false, 2, 4500.00, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', ' Mars outermost moon, covered in a thick layer of dust that fills in its craters, making it look smoother than Phobos.', false, false, 3, 4500.00, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'The largest moon in the entire solar system—it is even bigger than the planet Mercury. It possesses its own magnetic field.', false, true, 4, 4500.00, 5);
INSERT INTO public.moon VALUES (5, 'Europa', ' A highly reflective moon with a smooth, bright crust of cracked water ice and very few craters.', false, true, 5, 4500.00, 5);
INSERT INTO public.moon VALUES (6, 'Io', 'The most volcanically active world in our solar system, covered in yellow, red, and black sulfur compounds.', false, true, 6, 4500.00, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'The most heavily cratered object in the solar system, with an ancient landscape unchanged for billions of years.', false, true, 7, 4500.00, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', ' A small, bright-red moon orbiting deep inside Jupiters intense radiation belts.', false, false, 8, 4500.00, 5);
INSERT INTO public.moon VALUES (9, 'Himalia', 'The largest of Jupiters irregular outer moons, likely an asteroid captured by the planets gravity early on.', false, false, 9, 4500.00, 5);
INSERT INTO public.moon VALUES (10, 'Valetudo', 'A tiny outer moon orbiting backward compared to the other outer moons, putting it on a collision course with them.', false, false, 10, 4500.00, 5);
INSERT INTO public.moon VALUES (11, 'Titan', 'A giant moon with a thick nitrogen atmosphere, featuring rivers and lakes made of liquid methane and ethane.', false, false, 11, 4500.00, 6);
INSERT INTO public.moon VALUES (12, 'Enceladus', 'A small, brilliant ice moon that shoots towering geysers of water vapor, ice particles, and organic chemicals into space.', false, true, 12, 4500.00, 6);
INSERT INTO public.moon VALUES (13, 'Mimas', 'Famous for its giant Herschel crater, which makes it look exactly like the Death Star from Star Wars.', false, true, 13, 4500.00, 6);
INSERT INTO public.moon VALUES (14, 'Ipateus', 'A two-toned moon with one side as dark as coal and the other side bright as snow. It has a mountain ridge around its equator.', false, true, 14, 4500.00, 6);
INSERT INTO public.moon VALUES (15, 'Rhea', 'Saturns second-largest moon, consisting mostly of water ice with a heavily cratered surface.', false, true, 15, 4500.00, 6);
INSERT INTO public.moon VALUES (16, 'Dione', 'An ice moon featuring massive, bright ice cliffs that stretch across its dark hemisphere.', false, true, 16, 4500.00, 6);
INSERT INTO public.moon VALUES (17, 'Tethys', ' A heavily cratered ice moon dominated by a massive trench, Ithaca Chasma, which stretches across 75% of its surface.', false, true, 17, 4500.00, 6);
INSERT INTO public.moon VALUES (18, 'Hyperion', ' A low-density moon packed with empty pores, giving it a sponge-like look. It spins erratically and chaotically.', false, false, 18, 4500.00, 6);
INSERT INTO public.moon VALUES (19, 'Phoebe', 'A dark, scarred moon originating from the distant Kuiper Belt before being captured by Saturns gravity.', false, false, 19, 4500.00, 6);
INSERT INTO public.moon VALUES (20, 'Pan', 'A tiny moon that sweeps through Saturns rings, collecting ring dust along its equator to form its distinct ridge shape.', false, false, 20, 4500.00, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The smallest, innermost planet, featuring a heavily cratered surface and no atmosphere.', false, true, 1, 4500.00, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'A rocky planet with a runaway greenhouse effect and an atmosphere full of sulfuric acid', false, true, 2, 4500.00, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'A rocky planet covered in 70% liquid water with a protective nitrogen-oxygen atmosphere.', true, true, 3, 4540.00, 1);
INSERT INTO public.planet VALUES (4, 'Mars', ' A cold, dry desert planet covered in iron oxide dust, giving it a distinct red profile.', false, true, 4, 4600.00, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'A massive gas giant made of hydrogen and helium, famous for its roaring Great Red spot storm.', false, false, 5, 4600.00, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'A massive gas giant world universally recognized for its stunning, wide ice-and-rock ring system.', false, false, 6, 4500.00, 1);
INSERT INTO public.planet VALUES (7, 'Proxima Centauri b', 'An earth sized rocky exoplanet orbiting within the habitable zone of our closest stellar neighbor.', false, true, 7, 4800.00, 2);
INSERT INTO public.planet VALUES (8, 'Proxima Centauri c', 'A super earth or mini neptune orbting much further out in the freezing,dark outer edges of the system.', false, true, 8, 4800.00, 2);
INSERT INTO public.planet VALUES (9, 'TRAPPIST-1b', 'The innermost planet of this system ;it is rocky,slightly larger than earth,and orbits incredibly close to its star.', false, true, 9, 7600.00, 4);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1d', 'A small rocky planet orbiting on the inner edge of its stars habitable zone.', false, true, 10, 7600.00, 4);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 'A rocky planet considered an almost perfect earth analogue in terms of size,mass,and stellar heating.', false, true, 11, 7600.00, 4);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1f', 'A rocky ,ice-rich planet orbiting in the slightly colder ,outer region of the TRAPPIST-1 system.', false, true, 12, 7600.00, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'It is a yellow dwarf star at the center of our solar system.it provides the energy and light that power earth.', true, true, 1, 4600.00, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'This is a small ,dim red dwarf star.It is the absolute closest star to our sun.', true, false, 2, 4800.00, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'A massive,bright red supergiant located in the Orion constellation.It is nearing the end of its life and will explode soon in cosmic terms.', false, false, 3, 7600.00, 1);
INSERT INTO public.star VALUES (4, 'TRAPPIST-1', 'An ultra cool red dwarf star that is barely larger than planet jupiter', true, false, 4, 7600.00, 1);
INSERT INTO public.star VALUES (5, 'Methuselah star', 'An ancient metal poor subgiant star located 200 light years from earth.it is formed right after the big bang.', true, false, 5, 13700.00, 1);
INSERT INTO public.star VALUES (6, 'Alfa Andromeda', 'Massive blue supergiants and hypergiants detected by hubble inside the neighboring andromeda galaxy.', true, false, 6, 20.00, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT galaxy_star_planet_moon_name_key UNIQUE (name);


--
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT galaxy_star_planet_moon_pkey PRIMARY KEY (galaxy_star_planet_moon_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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

