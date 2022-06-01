--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: attribute_values; Type: TABLE; Schema: public; Owner: jackriley
--

CREATE TABLE public.attribute_values (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    title text NOT NULL,
    attribute_id uuid NOT NULL
);


ALTER TABLE public.attribute_values OWNER TO jackriley;

--
-- Name: attributes; Type: TABLE; Schema: public; Owner: jackriley
--

CREATE TABLE public.attributes (
    title text NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    CONSTRAINT attributes_title_len CHECK ((length(title) < 200))
);


ALTER TABLE public.attributes OWNER TO jackriley;

--
-- Name: service_attribute_lines; Type: TABLE; Schema: public; Owner: jackriley
--

CREATE TABLE public.service_attribute_lines (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    service_id uuid NOT NULL,
    attribute_id uuid NOT NULL
);


ALTER TABLE public.service_attribute_lines OWNER TO jackriley;

--
-- Name: service_attribute_values; Type: TABLE; Schema: public; Owner: jackriley
--

CREATE TABLE public.service_attribute_values (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    line_id uuid NOT NULL,
    attribute_value_id uuid NOT NULL
);


ALTER TABLE public.service_attribute_values OWNER TO jackriley;

--
-- Name: service_variant_combination; Type: TABLE; Schema: public; Owner: jackriley
--

CREATE TABLE public.service_variant_combination (
    service_variant_id uuid NOT NULL,
    service_attribute_value_id uuid NOT NULL
);


ALTER TABLE public.service_variant_combination OWNER TO jackriley;

--
-- Name: service_variants; Type: TABLE; Schema: public; Owner: jackriley
--

CREATE TABLE public.service_variants (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    service_id uuid NOT NULL,
    fee numeric,
    service_attribute_value_ids uuid[]
);


ALTER TABLE public.service_variants OWNER TO jackriley;

--
-- Name: services; Type: TABLE; Schema: public; Owner: jackriley
--

CREATE TABLE public.services (
    title text NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE public.services OWNER TO jackriley;

--
-- Data for Name: attribute_values; Type: TABLE DATA; Schema: public; Owner: jackriley
--

COPY public.attribute_values (id, title, attribute_id) FROM stdin;
dd6ca79e-f990-49e7-bbbb-b7cff19637cd	Corp	98b1e939-fae7-45aa-b7cc-73c7f5c8e40e
e4ae3ed0-c89d-45ae-a5c9-1e3c166f1ea0	Alabama	2d235cd6-3a77-4015-8aae-7cb8e2e91c64
47098832-9e60-445c-90a0-0f0b1d8c25fc	Delaware	2d235cd6-3a77-4015-8aae-7cb8e2e91c64
5865863a-0803-48f3-a9b5-e65a89b5fc25	New Jersey	2d235cd6-3a77-4015-8aae-7cb8e2e91c64
dfb12ac0-d7e3-4834-83e1-a4483c370cef	Texas	2d235cd6-3a77-4015-8aae-7cb8e2e91c64
644aa685-af46-4f2e-8ecd-36d864070af7	Wisconsin	2d235cd6-3a77-4015-8aae-7cb8e2e91c64
3e93aac9-5f37-4e78-8158-11613d9cc9c6	New York	2d235cd6-3a77-4015-8aae-7cb8e2e91c64
660016e3-8c6f-4a05-b7de-733ae28be0ac	S Corp	98b1e939-fae7-45aa-b7cc-73c7f5c8e40e
2e4999f6-3e85-439d-b792-92802dcd1472	LP	98b1e939-fae7-45aa-b7cc-73c7f5c8e40e
441b2154-2409-49c1-bef1-484a82a33631	PartnerShip	98b1e939-fae7-45aa-b7cc-73c7f5c8e40e
\.


--
-- Data for Name: attributes; Type: TABLE DATA; Schema: public; Owner: jackriley
--

COPY public.attributes (title, id) FROM stdin;
Jurisdiction	2d235cd6-3a77-4015-8aae-7cb8e2e91c64
Entity Type	98b1e939-fae7-45aa-b7cc-73c7f5c8e40e
Filing Speed	b2ee5840-5c32-4703-a18d-abd1e257fe70
\.


--
-- Data for Name: service_attribute_lines; Type: TABLE DATA; Schema: public; Owner: jackriley
--

COPY public.service_attribute_lines (id, service_id, attribute_id) FROM stdin;
a58e9091-d1e4-4cbe-8309-785c4aa5b801	418d4bdc-1115-4625-a7fe-cd22b10755fe	2d235cd6-3a77-4015-8aae-7cb8e2e91c64
340fd783-8a83-4ccc-97fe-b2aec87a58e9	418d4bdc-1115-4625-a7fe-cd22b10755fe	98b1e939-fae7-45aa-b7cc-73c7f5c8e40e
0691160e-0102-490d-b4fb-d05ee5830054	418d4bdc-1115-4625-a7fe-cd22b10755fe	b2ee5840-5c32-4703-a18d-abd1e257fe70
\.


--
-- Data for Name: service_attribute_values; Type: TABLE DATA; Schema: public; Owner: jackriley
--

COPY public.service_attribute_values (id, line_id, attribute_value_id) FROM stdin;
e431e3f4-ec62-4f3d-92d0-6342348db44f	a58e9091-d1e4-4cbe-8309-785c4aa5b801	e4ae3ed0-c89d-45ae-a5c9-1e3c166f1ea0
c5d0df65-e6a6-4def-afda-0d8db03936ad	a58e9091-d1e4-4cbe-8309-785c4aa5b801	47098832-9e60-445c-90a0-0f0b1d8c25fc
834188f5-e911-4ccf-ae49-718c69c0adc3	340fd783-8a83-4ccc-97fe-b2aec87a58e9	dd6ca79e-f990-49e7-bbbb-b7cff19637cd
d5b34783-ebee-40ca-ab81-15d3ded9155e	a58e9091-d1e4-4cbe-8309-785c4aa5b801	5865863a-0803-48f3-a9b5-e65a89b5fc25
243aa063-9fa1-4fd0-9a4e-3662749e7e0a	a58e9091-d1e4-4cbe-8309-785c4aa5b801	dfb12ac0-d7e3-4834-83e1-a4483c370cef
7e99238d-cc04-44f2-8ddb-26124f3bf76c	a58e9091-d1e4-4cbe-8309-785c4aa5b801	644aa685-af46-4f2e-8ecd-36d864070af7
66fef13f-41a6-4c0d-b8b2-a60f97025fb8	a58e9091-d1e4-4cbe-8309-785c4aa5b801	3e93aac9-5f37-4e78-8158-11613d9cc9c6
400134e9-4caa-48f8-b60c-061c339ccce1	340fd783-8a83-4ccc-97fe-b2aec87a58e9	660016e3-8c6f-4a05-b7de-733ae28be0ac
219e0a21-83b7-4bd0-bbff-9b5ff516929b	340fd783-8a83-4ccc-97fe-b2aec87a58e9	2e4999f6-3e85-439d-b792-92802dcd1472
161cf784-defb-480c-b752-9ae1bc144905	340fd783-8a83-4ccc-97fe-b2aec87a58e9	441b2154-2409-49c1-bef1-484a82a33631
\.


--
-- Data for Name: service_variant_combination; Type: TABLE DATA; Schema: public; Owner: jackriley
--

COPY public.service_variant_combination (service_variant_id, service_attribute_value_id) FROM stdin;
d2b98cb1-3788-4975-9dde-16fb6274f414	e431e3f4-ec62-4f3d-92d0-6342348db44f
d2b98cb1-3788-4975-9dde-16fb6274f414	834188f5-e911-4ccf-ae49-718c69c0adc3
67511cb1-83f3-4352-baa2-8d5445c167f5	e431e3f4-ec62-4f3d-92d0-6342348db44f
67511cb1-83f3-4352-baa2-8d5445c167f5	400134e9-4caa-48f8-b60c-061c339ccce1
8f792ab9-9158-44b3-a829-211ed0b0384e	c5d0df65-e6a6-4def-afda-0d8db03936ad
8f792ab9-9158-44b3-a829-211ed0b0384e	834188f5-e911-4ccf-ae49-718c69c0adc3
\.


--
-- Data for Name: service_variants; Type: TABLE DATA; Schema: public; Owner: jackriley
--

COPY public.service_variants (id, service_id, fee, service_attribute_value_ids) FROM stdin;
d2b98cb1-3788-4975-9dde-16fb6274f414	418d4bdc-1115-4625-a7fe-cd22b10755fe	41	{e431e3f4-ec62-4f3d-92d0-6342348db44f,834188f5-e911-4ccf-ae49-718c69c0adc3}
67511cb1-83f3-4352-baa2-8d5445c167f5	418d4bdc-1115-4625-a7fe-cd22b10755fe	0	{e431e3f4-ec62-4f3d-92d0-6342348db44f,400134e9-4caa-48f8-b60c-061c339ccce1}
8f792ab9-9158-44b3-a829-211ed0b0384e	418d4bdc-1115-4625-a7fe-cd22b10755fe	0	{c5d0df65-e6a6-4def-afda-0d8db03936ad,834188f5-e911-4ccf-ae49-718c69c0adc3}
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: jackriley
--

COPY public.services (title, id) FROM stdin;
Formation	418d4bdc-1115-4625-a7fe-cd22b10755fe
\.


--
-- Name: attribute_values attribute_values_pkey; Type: CONSTRAINT; Schema: public; Owner: jackriley
--

ALTER TABLE ONLY public.attribute_values
    ADD CONSTRAINT attribute_values_pkey PRIMARY KEY (id);


--
-- Name: attribute_values attribute_values_title_len; Type: CHECK CONSTRAINT; Schema: public; Owner: jackriley
--

ALTER TABLE public.attribute_values
    ADD CONSTRAINT attribute_values_title_len CHECK ((length(title) < 200)) NOT VALID;


--
-- Name: attributes attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: jackriley
--

ALTER TABLE ONLY public.attributes
    ADD CONSTRAINT attributes_pkey PRIMARY KEY (id);


--
-- Name: service_attribute_lines service_attribute_line_pkey; Type: CONSTRAINT; Schema: public; Owner: jackriley
--

ALTER TABLE ONLY public.service_attribute_lines
    ADD CONSTRAINT service_attribute_line_pkey PRIMARY KEY (id);


--
-- Name: service_attribute_values service_attribute_values_pkey; Type: CONSTRAINT; Schema: public; Owner: jackriley
--

ALTER TABLE ONLY public.service_attribute_values
    ADD CONSTRAINT service_attribute_values_pkey PRIMARY KEY (id);


--
-- Name: service_variants service_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: jackriley
--

ALTER TABLE ONLY public.service_variants
    ADD CONSTRAINT service_variants_pkey PRIMARY KEY (id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: jackriley
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: services services_title_len; Type: CHECK CONSTRAINT; Schema: public; Owner: jackriley
--

ALTER TABLE public.services
    ADD CONSTRAINT services_title_len CHECK ((length(title) < 200)) NOT VALID;


--
-- Name: service_attribute_lines unique_attribute_line_per_service; Type: CONSTRAINT; Schema: public; Owner: jackriley
--

ALTER TABLE ONLY public.service_attribute_lines
    ADD CONSTRAINT unique_attribute_line_per_service UNIQUE (service_id, attribute_id) INCLUDE (service_id, attribute_id);


--
-- Name: service_attribute_values unique_service_attribute_values_to_line; Type: CONSTRAINT; Schema: public; Owner: jackriley
--

ALTER TABLE ONLY public.service_attribute_values
    ADD CONSTRAINT unique_service_attribute_values_to_line UNIQUE (line_id, attribute_value_id) INCLUDE (line_id, attribute_value_id);


--
-- Name: service_variants unique_service_variants; Type: CONSTRAINT; Schema: public; Owner: jackriley
--

ALTER TABLE ONLY public.service_variants
    ADD CONSTRAINT unique_service_variants UNIQUE (service_id, service_attribute_value_ids) INCLUDE (service_id, service_attribute_value_ids);


--
-- Name: fki_service_id_fkey; Type: INDEX; Schema: public; Owner: jackriley
--

CREATE INDEX fki_service_id_fkey ON public.service_variants USING btree (service_id);


--
-- Name: fki_service_line_id; Type: INDEX; Schema: public; Owner: jackriley
--

CREATE INDEX fki_service_line_id ON public.service_attribute_values USING btree (line_id);


--
-- Name: service_attribute_lines attribute_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jackriley
--

ALTER TABLE ONLY public.service_attribute_lines
    ADD CONSTRAINT attribute_id_fkey FOREIGN KEY (attribute_id) REFERENCES public.attributes(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: service_attribute_values attribute_value_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jackriley
--

ALTER TABLE ONLY public.service_attribute_values
    ADD CONSTRAINT attribute_value_fkey FOREIGN KEY (attribute_value_id) REFERENCES public.attribute_values(id) NOT VALID;


--
-- Name: service_variant_combination service_attribute_value_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jackriley
--

ALTER TABLE ONLY public.service_variant_combination
    ADD CONSTRAINT service_attribute_value_fkey FOREIGN KEY (service_attribute_value_id) REFERENCES public.service_attribute_values(id) NOT VALID;


--
-- Name: service_attribute_lines service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jackriley
--

ALTER TABLE ONLY public.service_attribute_lines
    ADD CONSTRAINT service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: service_variants service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jackriley
--

ALTER TABLE ONLY public.service_variants
    ADD CONSTRAINT service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: service_attribute_values service_line_id; Type: FK CONSTRAINT; Schema: public; Owner: jackriley
--

ALTER TABLE ONLY public.service_attribute_values
    ADD CONSTRAINT service_line_id FOREIGN KEY (line_id) REFERENCES public.service_attribute_lines(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: service_variant_combination service_variant_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jackriley
--

ALTER TABLE ONLY public.service_variant_combination
    ADD CONSTRAINT service_variant_fkey FOREIGN KEY (service_variant_id) REFERENCES public.service_variants(id) ON DELETE CASCADE NOT VALID;


--
-- PostgreSQL database dump complete
--
