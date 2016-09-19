--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: master; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA master;


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = master, pg_catalog;

--
-- Name: basket_id_basket_seq; Type: SEQUENCE; Schema: master; Owner: -
--

CREATE SEQUENCE basket_id_basket_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: basket; Type: TABLE; Schema: master; Owner: -
--

CREATE TABLE basket (
    id_basket bigint DEFAULT nextval('basket_id_basket_seq'::regclass) NOT NULL,
    bool_side_effect boolean DEFAULT false NOT NULL
);


--
-- Name: basket_item; Type: TABLE; Schema: master; Owner: -
--

CREATE TABLE basket_item (
    id_basket bigint NOT NULL,
    id_item integer NOT NULL,
    num_quantity integer NOT NULL
);


--
-- Name: client_id_client_seq; Type: SEQUENCE; Schema: master; Owner: -
--

CREATE SEQUENCE client_id_client_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: client; Type: TABLE; Schema: master; Owner: -
--

CREATE TABLE client (
    id_client integer DEFAULT nextval('client_id_client_seq'::regclass) NOT NULL,
    txt_fcm_token character varying NOT NULL
);


--
-- Name: id_request_answer_seq; Type: SEQUENCE; Schema: master; Owner: -
--

CREATE SEQUENCE id_request_answer_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: id_tuple_seq; Type: SEQUENCE; Schema: master; Owner: -
--

CREATE SEQUENCE id_tuple_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: item_id_tem_seq; Type: SEQUENCE; Schema: master; Owner: -
--

CREATE SEQUENCE item_id_tem_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: item; Type: TABLE; Schema: master; Owner: -
--

CREATE TABLE item (
    id_item integer DEFAULT nextval('item_id_tem_seq'::regclass) NOT NULL,
    num_width double precision DEFAULT 0 NOT NULL,
    num_height double precision NOT NULL,
    num_length double precision DEFAULT 0 NOT NULL,
    num_mass double precision NOT NULL,
    txt_name character varying NOT NULL,
    txt_description character varying DEFAULT ''::character varying NOT NULL,
    txt_alternative_id character varying DEFAULT ''::character varying NOT NULL,
    num_diameter double precision DEFAULT 0 NOT NULL
);


--
-- Name: request_answer; Type: TABLE; Schema: master; Owner: -
--

CREATE TABLE request_answer (
    id_request_answer bigint DEFAULT nextval('id_request_answer_seq'::regclass) NOT NULL,
    txt_request_path character varying NOT NULL,
    txt_parameter character varying NOT NULL,
    date_timestamp timestamp without time zone NOT NULL,
    txt_type character varying(4) NOT NULL,
    txt_answer character varying NOT NULL,
    id_tuple bigint NOT NULL
);


--
-- Name: tuple; Type: TABLE; Schema: master; Owner: -
--

CREATE TABLE tuple (
    id_tuple bigint DEFAULT nextval('id_tuple_seq'::regclass) NOT NULL,
    bool_side_effect boolean DEFAULT false NOT NULL
);


--
-- Name: basket_item_pk; Type: CONSTRAINT; Schema: master; Owner: -
--

ALTER TABLE ONLY basket_item
    ADD CONSTRAINT basket_item_pk PRIMARY KEY (id_basket, id_item);


--
-- Name: basket_pk; Type: CONSTRAINT; Schema: master; Owner: -
--

ALTER TABLE ONLY basket
    ADD CONSTRAINT basket_pk PRIMARY KEY (id_basket);


--
-- Name: client_pk; Type: CONSTRAINT; Schema: master; Owner: -
--

ALTER TABLE ONLY client
    ADD CONSTRAINT client_pk PRIMARY KEY (id_client);


--
-- Name: object_pk; Type: CONSTRAINT; Schema: master; Owner: -
--

ALTER TABLE ONLY item
    ADD CONSTRAINT object_pk PRIMARY KEY (id_item);


--
-- Name: request_answer_pk; Type: CONSTRAINT; Schema: master; Owner: -
--

ALTER TABLE ONLY request_answer
    ADD CONSTRAINT request_answer_pk PRIMARY KEY (id_request_answer);


--
-- Name: tuple_pk; Type: CONSTRAINT; Schema: master; Owner: -
--

ALTER TABLE ONLY tuple
    ADD CONSTRAINT tuple_pk PRIMARY KEY (id_tuple);


--
-- Name: idx_txt_alternative_id; Type: INDEX; Schema: master; Owner: -
--

CREATE INDEX idx_txt_alternative_id ON item USING btree (txt_alternative_id);


--
-- Name: basket_basket_item_fk; Type: FK CONSTRAINT; Schema: master; Owner: -
--

ALTER TABLE ONLY basket_item
    ADD CONSTRAINT basket_basket_item_fk FOREIGN KEY (id_basket) REFERENCES basket(id_basket);


--
-- Name: item_basket_item_fk; Type: FK CONSTRAINT; Schema: master; Owner: -
--

ALTER TABLE ONLY basket_item
    ADD CONSTRAINT item_basket_item_fk FOREIGN KEY (id_item) REFERENCES item(id_item);


--
-- Name: tuple_request_answer_fk; Type: FK CONSTRAINT; Schema: master; Owner: -
--

ALTER TABLE ONLY request_answer
    ADD CONSTRAINT tuple_request_answer_fk FOREIGN KEY (id_tuple) REFERENCES tuple(id_tuple);


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM tcc;
GRANT ALL ON SCHEMA public TO tcc;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

