--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.16
-- Dumped by pg_dump version 9.5.8

-- Started on 2017-09-06 14:38:07 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 11761)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2666 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 77556)
-- Name: core_admin_module; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE core_admin_module (
    uid integer NOT NULL,
    company_uid integer NOT NULL,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    name character varying(255) NOT NULL
);


ALTER TABLE core_admin_module OWNER TO symfony;

--
-- TOC entry 199 (class 1259 OID 77571)
-- Name: core_admin_module_admin_group; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE core_admin_module_admin_group (
    module_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE core_admin_module_admin_group OWNER TO symfony;

--
-- TOC entry 171 (class 1259 OID 77500)
-- Name: core_admin_module_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE core_admin_module_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_admin_module_uid_seq OWNER TO symfony;

--
-- TOC entry 198 (class 1259 OID 77564)
-- Name: core_admin_module_user_group; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE core_admin_module_user_group (
    module_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE core_admin_module_user_group OWNER TO symfony;

--
-- TOC entry 235 (class 1259 OID 86426)
-- Name: core_admin_user_module_config; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE core_admin_user_module_config (
    uid integer NOT NULL,
    company_uid integer NOT NULL,
    user_id integer,
    module_id integer,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    level character varying(255) NOT NULL
);


ALTER TABLE core_admin_user_module_config OWNER TO symfony;

--
-- TOC entry 230 (class 1259 OID 86416)
-- Name: core_admin_user_module_config_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE core_admin_user_module_config_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_admin_user_module_config_uid_seq OWNER TO symfony;

--
-- TOC entry 200 (class 1259 OID 77578)
-- Name: core_cms_picture; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE core_cms_picture (
    uid integer NOT NULL,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    alt character varying(200) DEFAULT NULL::character varying,
    extension character varying(10) NOT NULL,
    webpath character varying(300) NOT NULL,
    random_key character varying(255) NOT NULL
);


ALTER TABLE core_cms_picture OWNER TO symfony;

--
-- TOC entry 172 (class 1259 OID 77502)
-- Name: core_cms_picture_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE core_cms_picture_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_cms_picture_uid_seq OWNER TO symfony;

--
-- TOC entry 207 (class 1259 OID 77672)
-- Name: core_customer_address; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE core_customer_address (
    uid integer NOT NULL,
    company_uid integer NOT NULL,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    street character varying(255) DEFAULT NULL::character varying,
    complement character varying(255) DEFAULT NULL::character varying,
    postal_code character varying(255) DEFAULT NULL::character varying,
    city character varying(255) DEFAULT NULL::character varying,
    country character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE core_customer_address OWNER TO symfony;

--
-- TOC entry 177 (class 1259 OID 77512)
-- Name: core_customer_address_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE core_customer_address_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_customer_address_uid_seq OWNER TO symfony;

--
-- TOC entry 205 (class 1259 OID 77647)
-- Name: core_customer_contact; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE core_customer_contact (
    uid integer NOT NULL,
    company_uid integer NOT NULL,
    picture_id integer,
    firm_id integer,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    gender character varying(20) NOT NULL,
    first_name character varying(100) DEFAULT NULL::character varying,
    last_name character varying(100) DEFAULT NULL::character varying,
    email character varying(100) NOT NULL,
    firm_role character varying(100) DEFAULT NULL::character varying,
    phone character varying(20) DEFAULT NULL::character varying,
    meeting_description text,
    meeting_reason character varying(50) DEFAULT NULL::character varying,
    other_meeting_reason text,
    random_key character varying(255) NOT NULL
);


ALTER TABLE core_customer_contact OWNER TO symfony;

--
-- TOC entry 206 (class 1259 OID 77665)
-- Name: core_customer_contact_tag; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE core_customer_contact_tag (
    contact_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE core_customer_contact_tag OWNER TO symfony;

--
-- TOC entry 176 (class 1259 OID 77510)
-- Name: core_customer_contact_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE core_customer_contact_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_customer_contact_uid_seq OWNER TO symfony;

--
-- TOC entry 204 (class 1259 OID 77633)
-- Name: core_customer_demand; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE core_customer_demand (
    uid integer NOT NULL,
    company_uid integer NOT NULL,
    contact_uid integer,
    firm_uid integer,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    asked_at timestamp(0) without time zone NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    tags character varying(255) DEFAULT NULL::character varying,
    completed boolean DEFAULT false NOT NULL,
    completed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE core_customer_demand OWNER TO symfony;

--
-- TOC entry 203 (class 1259 OID 77619)
-- Name: core_customer_demand_message; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE core_customer_demand_message (
    uid integer NOT NULL,
    company_uid integer NOT NULL,
    external_author_uid integer,
    internal_author_uid integer,
    customer_demand_uid integer NOT NULL,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    content text NOT NULL,
    hidden boolean NOT NULL,
    received_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE core_customer_demand_message OWNER TO symfony;

--
-- TOC entry 174 (class 1259 OID 77506)
-- Name: core_customer_demand_message_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE core_customer_demand_message_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_customer_demand_message_uid_seq OWNER TO symfony;

--
-- TOC entry 175 (class 1259 OID 77508)
-- Name: core_customer_demand_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE core_customer_demand_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_customer_demand_uid_seq OWNER TO symfony;

--
-- TOC entry 201 (class 1259 OID 77589)
-- Name: core_customer_firm; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE core_customer_firm (
    uid integer NOT NULL,
    company_uid integer NOT NULL,
    address_uid integer,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    name character varying(255) NOT NULL,
    email character varying(255) DEFAULT NULL::character varying,
    website character varying(255) DEFAULT NULL::character varying,
    first_contacted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status character varying(20) NOT NULL,
    legal_name character varying(255) DEFAULT NULL::character varying,
    legal_status character varying(255) DEFAULT NULL::character varying,
    phone character varying(30) DEFAULT NULL::character varying,
    siren character varying(255) DEFAULT NULL::character varying,
    siret character varying(255) DEFAULT NULL::character varying,
    is_pro boolean DEFAULT false NOT NULL,
    vat_accountable boolean DEFAULT false NOT NULL,
    vat_identifier character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE core_customer_firm OWNER TO symfony;

--
-- TOC entry 202 (class 1259 OID 77612)
-- Name: core_customer_firm_tag; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE core_customer_firm_tag (
    firm_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE core_customer_firm_tag OWNER TO symfony;

--
-- TOC entry 173 (class 1259 OID 77504)
-- Name: core_customer_firm_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE core_customer_firm_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_customer_firm_uid_seq OWNER TO symfony;

--
-- TOC entry 208 (class 1259 OID 77709)
-- Name: core_oauth_server_access_token; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE core_oauth_server_access_token (
    id integer NOT NULL,
    client_id integer NOT NULL,
    user_id integer,
    token character varying(255) NOT NULL,
    expires_at integer,
    scope character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE core_oauth_server_access_token OWNER TO symfony;

--
-- TOC entry 178 (class 1259 OID 77518)
-- Name: core_oauth_server_access_token_id_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE core_oauth_server_access_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_oauth_server_access_token_id_seq OWNER TO symfony;

--
-- TOC entry 211 (class 1259 OID 77741)
-- Name: core_oauth_server_auth_code; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE core_oauth_server_auth_code (
    id integer NOT NULL,
    client_id integer NOT NULL,
    user_id integer,
    token character varying(255) NOT NULL,
    redirect_uri text NOT NULL,
    expires_at integer,
    scope character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE core_oauth_server_auth_code OWNER TO symfony;

--
-- TOC entry 181 (class 1259 OID 77524)
-- Name: core_oauth_server_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE core_oauth_server_auth_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_oauth_server_auth_code_id_seq OWNER TO symfony;

--
-- TOC entry 209 (class 1259 OID 77721)
-- Name: core_oauth_server_client; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE core_oauth_server_client (
    id integer NOT NULL,
    random_id character varying(255) NOT NULL,
    redirect_uris text NOT NULL,
    secret character varying(255) NOT NULL,
    allowed_grant_types text NOT NULL
);


ALTER TABLE core_oauth_server_client OWNER TO symfony;

--
-- TOC entry 2667 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN core_oauth_server_client.redirect_uris; Type: COMMENT; Schema: public; Owner: symfony
--

COMMENT ON COLUMN core_oauth_server_client.redirect_uris IS '(DC2Type:array)';


--
-- TOC entry 2668 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN core_oauth_server_client.allowed_grant_types; Type: COMMENT; Schema: public; Owner: symfony
--

COMMENT ON COLUMN core_oauth_server_client.allowed_grant_types IS '(DC2Type:array)';


--
-- TOC entry 179 (class 1259 OID 77520)
-- Name: core_oauth_server_client_id_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE core_oauth_server_client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_oauth_server_client_id_seq OWNER TO symfony;

--
-- TOC entry 210 (class 1259 OID 77729)
-- Name: core_oauth_server_refresh_token; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE core_oauth_server_refresh_token (
    id integer NOT NULL,
    client_id integer NOT NULL,
    user_id integer,
    token character varying(255) NOT NULL,
    expires_at integer,
    scope character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE core_oauth_server_refresh_token OWNER TO symfony;

--
-- TOC entry 180 (class 1259 OID 77522)
-- Name: core_oauth_server_refresh_token_id_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE core_oauth_server_refresh_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_oauth_server_refresh_token_id_seq OWNER TO symfony;

--
-- TOC entry 217 (class 1259 OID 77811)
-- Name: core_user_company; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE core_user_company (
    uid integer NOT NULL,
    picture_id integer,
    address_id integer,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    name character varying(255) NOT NULL,
    random_key character varying(255) NOT NULL,
    legal_identifier character varying(255) DEFAULT NULL::character varying,
    legal_status character varying(255) DEFAULT NULL::character varying,
    capital double precision,
    contact_email character varying(50) DEFAULT NULL::character varying,
    contact_phone character varying(50) DEFAULT NULL::character varying,
    iban character varying(50) DEFAULT NULL::character varying,
    social_reason character varying(255) DEFAULT 'Social Reason'::character varying NOT NULL,
    ape_code character varying(50) DEFAULT NULL::character varying,
    contact_fax character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE core_user_company OWNER TO symfony;

--
-- TOC entry 185 (class 1259 OID 77532)
-- Name: core_user_company_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE core_user_company_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_user_company_uid_seq OWNER TO symfony;

--
-- TOC entry 212 (class 1259 OID 77753)
-- Name: core_user_group; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE core_user_group (
    uid integer NOT NULL,
    company_uid integer NOT NULL,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    name character varying(255) NOT NULL,
    admin_type boolean NOT NULL,
    feature boolean NOT NULL,
    roles text NOT NULL
);


ALTER TABLE core_user_group OWNER TO symfony;

--
-- TOC entry 2669 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN core_user_group.roles; Type: COMMENT; Schema: public; Owner: symfony
--

COMMENT ON COLUMN core_user_group.roles IS '(DC2Type:array)';


--
-- TOC entry 213 (class 1259 OID 77764)
-- Name: core_user_group_group; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE core_user_group_group (
    group_id integer NOT NULL,
    sub_group_id integer NOT NULL
);


ALTER TABLE core_user_group_group OWNER TO symfony;

--
-- TOC entry 182 (class 1259 OID 77526)
-- Name: core_user_group_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE core_user_group_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_user_group_uid_seq OWNER TO symfony;

--
-- TOC entry 216 (class 1259 OID 77800)
-- Name: core_user_notification; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE core_user_notification (
    uid integer NOT NULL,
    user_uid integer,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    datas text NOT NULL,
    text text NOT NULL,
    type character varying(255) NOT NULL,
    seen boolean NOT NULL
);


ALTER TABLE core_user_notification OWNER TO symfony;

--
-- TOC entry 2670 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN core_user_notification.datas; Type: COMMENT; Schema: public; Owner: symfony
--

COMMENT ON COLUMN core_user_notification.datas IS '(DC2Type:array)';


--
-- TOC entry 184 (class 1259 OID 77530)
-- Name: core_user_notification_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE core_user_notification_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_user_notification_uid_seq OWNER TO symfony;

--
-- TOC entry 214 (class 1259 OID 77771)
-- Name: core_user_user; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE core_user_user (
    uid integer NOT NULL,
    company_uid integer NOT NULL,
    picture_id integer,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    email character varying(255) NOT NULL,
    email_canonical character varying(255) NOT NULL,
    first_name character varying(50) DEFAULT NULL::character varying,
    last_name character varying(50) DEFAULT NULL::character varying,
    phone character varying(20) DEFAULT NULL::character varying,
    nationality character varying(30) DEFAULT NULL::character varying,
    role_label character varying(100) DEFAULT NULL::character varying,
    locale character varying(5) NOT NULL,
    gender character varying(20) NOT NULL,
    password character varying(255) NOT NULL,
    salt character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    expired boolean NOT NULL,
    locked boolean NOT NULL,
    credentials_expired boolean NOT NULL,
    confirmation_token character varying(255) DEFAULT NULL::character varying,
    password_requested_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    last_login timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    roles text NOT NULL,
    phone_validated boolean NOT NULL,
    phone_code character varying(255) DEFAULT NULL::character varying,
    phone_request_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    random_key character varying(255) NOT NULL
);


ALTER TABLE core_user_user OWNER TO symfony;

--
-- TOC entry 2671 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN core_user_user.roles; Type: COMMENT; Schema: public; Owner: symfony
--

COMMENT ON COLUMN core_user_user.roles IS '(DC2Type:array)';


--
-- TOC entry 215 (class 1259 OID 77793)
-- Name: core_user_user_group; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE core_user_user_group (
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE core_user_user_group OWNER TO symfony;

--
-- TOC entry 183 (class 1259 OID 77528)
-- Name: core_user_user_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE core_user_user_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_user_user_uid_seq OWNER TO symfony;

--
-- TOC entry 223 (class 1259 OID 77898)
-- Name: crm_bill_bill; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE crm_bill_bill (
    uid integer NOT NULL,
    company_uid integer NOT NULL,
    quote_id integer,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    reference character varying(50) DEFAULT NULL::character varying,
    billing_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    due_for timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    validated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    paid boolean DEFAULT false NOT NULL,
    file_path character varying(255) DEFAULT NULL::character varying,
    tax_in_total double precision NOT NULL,
    is_adjustment boolean DEFAULT false NOT NULL,
    tax_in_adjustment double precision DEFAULT 0::double precision,
    tax_ex_adjustment double precision DEFAULT 0::double precision,
    status character varying(50) DEFAULT 'bill.status.created'::character varying NOT NULL,
    accounting_id integer,
    deposit boolean DEFAULT false NOT NULL,
    balance boolean DEFAULT false NOT NULL,
    tax_ex_total double precision NOT NULL,
    quote_percentage double precision NOT NULL,
    last_reminder_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    sale_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    note text
);


ALTER TABLE crm_bill_bill OWNER TO symfony;

--
-- TOC entry 191 (class 1259 OID 77544)
-- Name: crm_bill_bill_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE crm_bill_bill_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm_bill_bill_uid_seq OWNER TO symfony;

--
-- TOC entry 220 (class 1259 OID 77849)
-- Name: crm_bill_company_config; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE crm_bill_company_config (
    uid integer NOT NULL,
    company_uid integer NOT NULL,
    bill_prefix_config_id integer,
    quote_prefix_config_id integer,
    credit_note_prefix_config_id integer,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    terms_of_payment text,
    general_conditions text,
    vat_identifier text,
    put_gcin_bills boolean DEFAULT false NOT NULL,
    after_sale_conditions text,
    g_cdate timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE crm_bill_company_config OWNER TO symfony;

--
-- TOC entry 188 (class 1259 OID 77538)
-- Name: crm_bill_company_config_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE crm_bill_company_config_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm_bill_company_config_uid_seq OWNER TO symfony;

--
-- TOC entry 226 (class 1259 OID 77942)
-- Name: crm_bill_credit_note; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE crm_bill_credit_note (
    uid integer NOT NULL,
    company_uid integer NOT NULL,
    bill_id integer,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    reference character varying(50) DEFAULT NULL::character varying,
    amount double precision NOT NULL,
    unpaid boolean DEFAULT false NOT NULL,
    accounting_id integer
);


ALTER TABLE crm_bill_credit_note OWNER TO symfony;

--
-- TOC entry 194 (class 1259 OID 77550)
-- Name: crm_bill_credit_note_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE crm_bill_credit_note_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm_bill_credit_note_uid_seq OWNER TO symfony;

--
-- TOC entry 221 (class 1259 OID 77864)
-- Name: crm_bill_payment; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE crm_bill_payment (
    uid integer NOT NULL,
    company_uid integer NOT NULL,
    bill_id integer,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    processed_at timestamp(0) without time zone NOT NULL,
    amount double precision NOT NULL,
    means character varying(50) DEFAULT NULL::character varying,
    note text
);


ALTER TABLE crm_bill_payment OWNER TO symfony;

--
-- TOC entry 189 (class 1259 OID 77540)
-- Name: crm_bill_payment_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE crm_bill_payment_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm_bill_payment_uid_seq OWNER TO symfony;

--
-- TOC entry 225 (class 1259 OID 77934)
-- Name: crm_bill_prefix_config; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE crm_bill_prefix_config (
    uid integer NOT NULL,
    company_uid integer NOT NULL,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    prefix character varying(50) NOT NULL,
    absolute boolean NOT NULL,
    padding_size integer NOT NULL,
    starting_id integer NOT NULL
);


ALTER TABLE crm_bill_prefix_config OWNER TO symfony;

--
-- TOC entry 193 (class 1259 OID 77548)
-- Name: crm_bill_prefix_config_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE crm_bill_prefix_config_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm_bill_prefix_config_uid_seq OWNER TO symfony;

--
-- TOC entry 222 (class 1259 OID 77877)
-- Name: crm_bill_product; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE crm_bill_product (
    uid integer NOT NULL,
    company_uid integer NOT NULL,
    product_type_id integer,
    quote_id integer,
    credit_note_id integer,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    name character varying(30) NOT NULL,
    description text,
    unit_price double precision NOT NULL,
    discount double precision,
    vat double precision NOT NULL,
    category character varying(255) DEFAULT 'Category'::character varying NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    quantity double precision DEFAULT 0::double precision NOT NULL,
    currency character varying(255) DEFAULT NULL::character varying,
    is_option boolean DEFAULT false NOT NULL,
    rank integer DEFAULT 1 NOT NULL,
    selected boolean DEFAULT false NOT NULL,
    purchase_price double precision,
    accounting_reference character varying(50) DEFAULT ''::character varying NOT NULL,
    vat_accounting_reference character varying(50) DEFAULT ''::character varying NOT NULL,
    turnover double precision,
    margin double precision
);


ALTER TABLE crm_bill_product OWNER TO symfony;

--
-- TOC entry 224 (class 1259 OID 77921)
-- Name: crm_bill_product_type; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE crm_bill_product_type (
    uid integer NOT NULL,
    company_uid integer NOT NULL,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    name character varying(30) NOT NULL,
    description text,
    unit_price double precision NOT NULL,
    discount double precision,
    vat double precision NOT NULL,
    category character varying(255) DEFAULT 'Category'::character varying NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    purchase_price double precision,
    accounting_reference character varying(50) DEFAULT ''::character varying NOT NULL,
    vat_accounting_reference character varying(50) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE crm_bill_product_type OWNER TO symfony;

--
-- TOC entry 192 (class 1259 OID 77546)
-- Name: crm_bill_product_type_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE crm_bill_product_type_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm_bill_product_type_uid_seq OWNER TO symfony;

--
-- TOC entry 190 (class 1259 OID 77542)
-- Name: crm_bill_product_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE crm_bill_product_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm_bill_product_uid_seq OWNER TO symfony;

--
-- TOC entry 227 (class 1259 OID 77953)
-- Name: crm_bill_quote; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE crm_bill_quote (
    uid integer NOT NULL,
    company_uid integer NOT NULL,
    contact_uid integer NOT NULL,
    user_id integer NOT NULL,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    reference character varying(30) NOT NULL,
    status character varying(50) NOT NULL,
    valid_until timestamp(0) without time zone NOT NULL,
    project_name character varying(50) NOT NULL,
    excluding_taxes_discount double precision,
    including_taxes_discount double precision,
    note text,
    terms_of_payment text,
    sent_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    tax_totals text,
    project_start_date timestamp(0) without time zone NOT NULL,
    duration double precision DEFAULT 1::double precision NOT NULL,
    duration_unit character varying(50) NOT NULL,
    recurrence character varying(50) DEFAULT 'quote.recurrence.one_time'::character varying NOT NULL,
    first_billing_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    periodicity character varying(50) DEFAULT NULL::character varying,
    period_count integer,
    next_recurrent_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    last_renewal_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    accounting_id integer NOT NULL,
    discount_conditions character varying(255) DEFAULT NULL::character varying,
    after_sale_conditions text,
    validated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE crm_bill_quote OWNER TO symfony;

--
-- TOC entry 2672 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN crm_bill_quote.tax_totals; Type: COMMENT; Schema: public; Owner: symfony
--

COMMENT ON COLUMN crm_bill_quote.tax_totals IS '(DC2Type:array)';


--
-- TOC entry 195 (class 1259 OID 77552)
-- Name: crm_bill_quote_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE crm_bill_quote_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm_bill_quote_uid_seq OWNER TO symfony;

--
-- TOC entry 228 (class 1259 OID 77974)
-- Name: crm_hr_cv_document; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE crm_hr_cv_document (
    uid integer NOT NULL,
    company_uid integer NOT NULL,
    pdf_id integer,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    age integer,
    email character varying(255) NOT NULL,
    phone character varying(255),
    job_search character varying(255) DEFAULT NULL::character varying,
    receipt_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    reception_method character varying(255) DEFAULT NULL::character varying,
    talk_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    email_response_type character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    random_key character varying(255) NOT NULL
);


ALTER TABLE crm_hr_cv_document OWNER TO symfony;

--
-- TOC entry 196 (class 1259 OID 77554)
-- Name: crm_hr_cv_document_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE crm_hr_cv_document_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm_hr_cv_document_uid_seq OWNER TO symfony;

--
-- TOC entry 237 (class 1259 OID 86447)
-- Name: crm_marketing_campaign; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE crm_marketing_campaign (
    uid integer NOT NULL,
    company_uid integer NOT NULL,
    contact_list_uid integer NOT NULL,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    mailchimp_id character varying(100) DEFAULT NULL::character varying,
    title character varying(100) DEFAULT NULL::character varying,
    subject character varying(100) DEFAULT NULL::character varying,
    from_name character varying(100) DEFAULT NULL::character varying,
    reply_to character varying(100) DEFAULT NULL::character varying,
    mailchimp_url character varying(100) DEFAULT NULL::character varying
);


ALTER TABLE crm_marketing_campaign OWNER TO symfony;

--
-- TOC entry 232 (class 1259 OID 86420)
-- Name: crm_marketing_campaign_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE crm_marketing_campaign_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm_marketing_campaign_uid_seq OWNER TO symfony;

--
-- TOC entry 238 (class 1259 OID 86465)
-- Name: crm_marketing_config; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE crm_marketing_config (
    uid integer NOT NULL,
    company_uid integer NOT NULL,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    access_token character varying(100) DEFAULT NULL::character varying,
    api_endpoint character varying(100) DEFAULT NULL::character varying,
    meta text
);


ALTER TABLE crm_marketing_config OWNER TO symfony;

--
-- TOC entry 2673 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN crm_marketing_config.meta; Type: COMMENT; Schema: public; Owner: symfony
--

COMMENT ON COLUMN crm_marketing_config.meta IS '(DC2Type:array)';


--
-- TOC entry 233 (class 1259 OID 86422)
-- Name: crm_marketing_config_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE crm_marketing_config_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm_marketing_config_uid_seq OWNER TO symfony;

--
-- TOC entry 239 (class 1259 OID 86478)
-- Name: crm_marketing_contact_list; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE crm_marketing_contact_list (
    uid integer NOT NULL,
    company_uid integer NOT NULL,
    tag_id integer,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    name character varying(100) NOT NULL,
    mailchimp_id character varying(100) DEFAULT NULL::character varying
);


ALTER TABLE crm_marketing_contact_list OWNER TO symfony;

--
-- TOC entry 240 (class 1259 OID 86488)
-- Name: crm_marketing_contact_list_contact; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE crm_marketing_contact_list_contact (
    list_id integer NOT NULL,
    contact_id integer NOT NULL
);


ALTER TABLE crm_marketing_contact_list_contact OWNER TO symfony;

--
-- TOC entry 234 (class 1259 OID 86424)
-- Name: crm_marketing_contact_list_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE crm_marketing_contact_list_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm_marketing_contact_list_uid_seq OWNER TO symfony;

--
-- TOC entry 236 (class 1259 OID 86436)
-- Name: crm_marketing_contact_meta; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE crm_marketing_contact_meta (
    uid integer NOT NULL,
    company_uid integer NOT NULL,
    contact_uid integer NOT NULL,
    contact_list_uid integer NOT NULL,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    mailchimp_id character varying(100) DEFAULT NULL::character varying
);


ALTER TABLE crm_marketing_contact_meta OWNER TO symfony;

--
-- TOC entry 231 (class 1259 OID 86418)
-- Name: crm_marketing_contact_meta_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE crm_marketing_contact_meta_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm_marketing_contact_meta_uid_seq OWNER TO symfony;

--
-- TOC entry 229 (class 1259 OID 86411)
-- Name: doctrine_migration_versions; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE doctrine_migration_versions (
    version character varying(255) NOT NULL
);


ALTER TABLE doctrine_migration_versions OWNER TO symfony;

--
-- TOC entry 244 (class 1259 OID 88508)
-- Name: utils_faq_category; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE utils_faq_category (
    uid integer NOT NULL,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    title text NOT NULL
);


ALTER TABLE utils_faq_category OWNER TO symfony;

--
-- TOC entry 2674 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN utils_faq_category.title; Type: COMMENT; Schema: public; Owner: symfony
--

COMMENT ON COLUMN utils_faq_category.title IS '(DC2Type:array)';


--
-- TOC entry 242 (class 1259 OID 88495)
-- Name: utils_faq_category_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE utils_faq_category_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE utils_faq_category_uid_seq OWNER TO symfony;

--
-- TOC entry 243 (class 1259 OID 88497)
-- Name: utils_faq_entry; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE utils_faq_entry (
    uid integer NOT NULL,
    category integer,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    question text NOT NULL,
    answer text NOT NULL
);


ALTER TABLE utils_faq_entry OWNER TO symfony;

--
-- TOC entry 2675 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN utils_faq_entry.question; Type: COMMENT; Schema: public; Owner: symfony
--

COMMENT ON COLUMN utils_faq_entry.question IS '(DC2Type:array)';


--
-- TOC entry 2676 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN utils_faq_entry.answer; Type: COMMENT; Schema: public; Owner: symfony
--

COMMENT ON COLUMN utils_faq_entry.answer IS '(DC2Type:array)';


--
-- TOC entry 241 (class 1259 OID 88493)
-- Name: utils_faq_entry_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE utils_faq_entry_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE utils_faq_entry_uid_seq OWNER TO symfony;

--
-- TOC entry 218 (class 1259 OID 77829)
-- Name: utils_note_note; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE utils_note_note (
    uid integer NOT NULL,
    company_uid integer NOT NULL,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    text character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE utils_note_note OWNER TO symfony;

--
-- TOC entry 186 (class 1259 OID 77534)
-- Name: utils_note_note_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE utils_note_note_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE utils_note_note_uid_seq OWNER TO symfony;

--
-- TOC entry 219 (class 1259 OID 77838)
-- Name: utils_tag_tag; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE utils_tag_tag (
    uid integer NOT NULL,
    company_uid integer NOT NULL,
    deleted boolean NOT NULL,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    label character varying(255) NOT NULL,
    color character varying(255) NOT NULL,
    white_text boolean NOT NULL,
    category character varying(255) NOT NULL
);


ALTER TABLE utils_tag_tag OWNER TO symfony;

--
-- TOC entry 187 (class 1259 OID 77536)
-- Name: utils_tag_tag_uid_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE utils_tag_tag_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE utils_tag_tag_uid_seq OWNER TO symfony;

--
-- TOC entry 2611 (class 0 OID 77556)
-- Dependencies: 197
-- Data for Name: core_admin_module; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY core_admin_module (uid, company_uid, deleted, deleted_at, created_at, updated_at, name) FROM stdin;
1	1	f	\N	2016-11-28 16:26:36	2016-11-28 16:26:36	module.core_user
2	1	f	\N	2016-11-28 16:26:36	2016-11-28 16:26:36	module.core_customer
3	1	f	\N	2016-11-28 16:26:36	2016-11-28 16:26:36	module.crm_bill
4	1	f	\N	2016-11-28 16:26:36	2016-11-28 16:26:36	module.crm_hr
5	2	f	\N	2016-11-29 09:13:14	2016-11-29 09:13:14	module.core_user
6	2	f	\N	2016-11-29 09:13:15	2016-11-29 09:13:15	module.core_customer
7	2	f	\N	2016-11-29 09:13:15	2016-11-29 09:13:15	module.crm_bill
8	2	f	\N	2016-11-29 09:13:15	2016-11-29 09:13:15	module.crm_hr
9	3	f	\N	2017-05-11 11:23:37	2017-05-11 11:23:38	module.core_user
10	3	f	\N	2017-05-11 11:23:38	2017-05-11 11:23:38	module.core_customer
11	3	f	\N	2017-05-11 11:23:38	2017-05-11 11:23:38	module.crm_bill
12	3	f	\N	2017-05-11 11:23:38	2017-05-11 11:23:39	module.crm_hr
13	4	f	\N	2017-05-11 14:24:33	2017-05-11 14:24:34	module.core_user
14	4	f	\N	2017-05-11 14:24:34	2017-05-11 14:24:36	module.core_customer
15	4	f	\N	2017-05-11 14:24:36	2017-05-11 14:24:36	module.crm_bill
16	4	f	\N	2017-05-11 14:24:36	2017-05-11 14:24:36	module.crm_hr
17	5	f	\N	2017-05-11 14:42:58	2017-05-11 14:42:59	module.core_user
18	5	f	\N	2017-05-11 14:42:59	2017-05-11 14:43:00	module.core_customer
19	5	f	\N	2017-05-11 14:43:00	2017-05-11 14:43:00	module.crm_bill
20	5	f	\N	2017-05-11 14:43:00	2017-05-11 14:43:00	module.crm_hr
21	6	f	\N	2017-05-15 15:07:07	2017-05-15 15:07:07	module.core_user
22	6	f	\N	2017-05-15 15:07:07	2017-05-15 15:07:07	module.core_customer
23	6	f	\N	2017-05-15 15:07:07	2017-05-15 15:07:07	module.crm_bill
24	6	f	\N	2017-05-15 15:07:07	2017-05-15 15:07:07	module.crm_hr
25	7	f	\N	2017-05-15 17:30:41	2017-05-15 17:30:42	module.core_user
26	7	f	\N	2017-05-15 17:30:42	2017-05-15 17:30:42	module.core_customer
27	7	f	\N	2017-05-15 17:30:42	2017-05-15 17:30:42	module.crm_bill
28	7	f	\N	2017-05-15 17:30:42	2017-05-15 17:30:42	module.crm_hr
29	8	f	\N	2017-06-02 05:49:23	2017-06-02 05:49:23	module.core_user
30	8	f	\N	2017-06-02 05:49:23	2017-06-02 05:49:23	module.core_customer
31	8	f	\N	2017-06-02 05:49:23	2017-06-02 05:49:23	module.crm_bill
32	8	f	\N	2017-06-02 05:49:23	2017-06-02 05:49:24	module.crm_hr
33	9	f	\N	2017-06-02 11:19:33	2017-06-02 11:19:33	module.core_user
34	9	f	\N	2017-06-02 11:19:33	2017-06-02 11:19:33	module.core_customer
35	9	f	\N	2017-06-02 11:19:33	2017-06-02 11:19:33	module.crm_bill
36	9	f	\N	2017-06-02 11:19:33	2017-06-02 11:19:33	module.crm_hr
\.


--
-- TOC entry 2613 (class 0 OID 77571)
-- Dependencies: 199
-- Data for Name: core_admin_module_admin_group; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY core_admin_module_admin_group (module_id, group_id) FROM stdin;
1	3
1	6
3	28
5	33
5	36
7	58
9	63
9	66
10	93
11	88
13	96
13	99
14	126
15	121
17	129
17	132
18	159
19	154
21	162
21	165
22	192
23	187
25	195
25	198
26	225
27	220
29	228
29	231
30	258
31	253
33	261
33	264
34	291
35	286
\.


--
-- TOC entry 2677 (class 0 OID 0)
-- Dependencies: 171
-- Name: core_admin_module_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('core_admin_module_uid_seq', 36, true);


--
-- TOC entry 2612 (class 0 OID 77564)
-- Dependencies: 198
-- Data for Name: core_admin_module_user_group; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY core_admin_module_user_group (module_id, group_id) FROM stdin;
2	7
2	9
2	11
2	13
2	15
2	8
2	10
2	12
2	14
2	16
3	25
3	21
3	19
3	23
3	26
3	22
3	20
3	24
3	27
3	7
3	9
3	11
3	13
3	15
3	8
3	10
3	12
3	14
3	16
4	29
4	30
6	37
6	39
6	41
6	43
6	45
6	38
6	40
6	42
6	44
6	46
7	55
7	51
7	49
7	53
7	56
7	52
7	50
7	54
7	57
7	37
7	39
7	41
7	43
7	45
7	38
7	40
7	42
7	44
7	46
8	59
8	60
10	67
10	69
10	71
10	73
10	75
10	68
10	70
10	72
10	74
10	76
10	91
10	92
11	85
11	81
11	79
11	83
11	86
11	82
11	80
11	84
11	87
12	89
12	90
14	100
14	102
14	104
14	106
14	108
14	101
14	103
14	105
14	107
14	109
14	124
14	125
15	118
15	114
15	112
15	116
15	119
15	115
15	113
15	117
15	120
16	122
16	123
18	133
18	135
18	137
18	139
18	141
18	134
18	136
18	138
18	140
18	142
18	157
18	158
19	151
19	147
19	145
19	149
19	152
19	148
19	146
19	150
19	153
20	155
20	156
22	166
22	168
22	170
22	172
22	174
22	167
22	169
22	171
22	173
22	175
22	190
22	191
23	184
23	180
23	178
23	182
23	185
23	181
23	179
23	183
23	186
24	188
24	189
26	199
26	201
26	203
26	205
26	207
26	200
26	202
26	204
26	206
26	208
26	223
26	224
27	217
27	213
27	211
27	215
27	218
27	214
27	212
27	216
27	219
28	221
28	222
30	232
30	234
30	236
30	238
30	240
30	233
30	235
30	237
30	239
30	241
30	256
30	257
31	250
31	246
31	244
31	248
31	251
31	247
31	245
31	249
31	252
32	254
32	255
34	265
34	267
34	269
34	271
34	273
34	266
34	268
34	270
34	272
34	274
34	289
34	290
35	283
35	279
35	277
35	281
35	284
35	280
35	278
35	282
35	285
36	287
36	288
\.


--
-- TOC entry 2649 (class 0 OID 86426)
-- Dependencies: 235
-- Data for Name: core_admin_user_module_config; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY core_admin_user_module_config (uid, company_uid, user_id, module_id, deleted, deleted_at, created_at, updated_at, level) FROM stdin;
1	1	1	4	f	\N	2017-02-24 16:42:05	\N	core_admin.level.admin
2	1	1	3	f	\N	2017-02-24 16:42:06	\N	core_admin.level.admin
3	1	1	2	f	\N	2017-02-24 16:42:06	\N	core_admin.level.admin
4	1	1	1	f	\N	2017-02-24 16:42:06	\N	core_admin.level.admin
5	2	2	8	f	\N	2017-02-24 16:42:07	\N	core_admin.level.admin
6	2	2	7	f	\N	2017-02-24 16:42:07	\N	core_admin.level.admin
7	2	2	6	f	\N	2017-02-24 16:42:07	\N	core_admin.level.admin
8	2	2	5	f	\N	2017-02-24 16:42:07	\N	core_admin.level.admin
9	2	3	8	f	\N	2017-02-24 16:42:07	\N	core_admin.level.admin
10	2	3	7	f	\N	2017-02-24 16:42:07	\N	core_admin.level.admin
11	2	3	6	f	\N	2017-02-24 16:42:07	\N	core_admin.level.admin
12	2	3	5	f	\N	2017-02-24 16:42:07	\N	core_admin.level.admin
13	1	4	4	f	\N	2017-02-24 16:42:07	\N	core_admin.level.admin
14	1	4	3	f	\N	2017-02-24 16:42:07	\N	core_admin.level.admin
15	1	4	2	f	\N	2017-02-24 16:42:07	\N	core_admin.level.admin
16	1	4	1	f	\N	2017-02-24 16:42:07	\N	core_admin.level.admin
17	3	5	12	f	\N	2017-05-11 11:23:42	\N	core_admin.level.admin
18	3	5	11	f	\N	2017-05-11 11:23:43	\N	core_admin.level.admin
19	3	5	10	f	\N	2017-05-11 11:23:43	\N	core_admin.level.admin
20	3	5	9	f	\N	2017-05-11 11:23:43	\N	core_admin.level.admin
21	4	6	16	f	\N	2017-05-11 14:24:45	\N	core_admin.level.admin
22	4	6	15	f	\N	2017-05-11 14:24:45	\N	core_admin.level.admin
23	4	6	14	f	\N	2017-05-11 14:24:45	\N	core_admin.level.admin
24	4	6	13	f	\N	2017-05-11 14:24:45	\N	core_admin.level.admin
25	5	7	20	f	\N	2017-05-11 14:43:01	\N	core_admin.level.admin
26	5	7	19	f	\N	2017-05-11 14:43:01	\N	core_admin.level.admin
27	5	7	18	f	\N	2017-05-11 14:43:01	\N	core_admin.level.admin
28	5	7	17	f	\N	2017-05-11 14:43:01	\N	core_admin.level.admin
29	6	8	24	f	\N	2017-05-15 15:07:09	\N	core_admin.level.admin
30	6	8	23	f	\N	2017-05-15 15:07:09	\N	core_admin.level.admin
31	6	8	22	f	\N	2017-05-15 15:07:09	\N	core_admin.level.admin
32	6	8	21	f	\N	2017-05-15 15:07:09	\N	core_admin.level.admin
33	7	9	25	f	\N	2017-05-15 17:30:57	\N	core_admin.level.admin
34	7	9	26	f	\N	2017-05-15 17:30:57	\N	core_admin.level.admin
35	7	9	27	f	\N	2017-05-15 17:30:57	\N	core_admin.level.admin
36	7	9	28	f	\N	2017-05-15 17:30:57	\N	core_admin.level.admin
37	8	10	29	f	\N	2017-06-02 05:49:29	\N	core_admin.level.admin
38	8	10	30	f	\N	2017-06-02 05:49:29	\N	core_admin.level.admin
39	8	10	31	f	\N	2017-06-02 05:49:29	\N	core_admin.level.admin
40	8	10	32	f	\N	2017-06-02 05:49:29	\N	core_admin.level.admin
41	9	11	33	f	\N	2017-06-02 11:19:35	\N	core_admin.level.admin
42	9	11	34	f	\N	2017-06-02 11:19:35	\N	core_admin.level.admin
43	9	11	35	f	\N	2017-06-02 11:19:35	\N	core_admin.level.admin
44	9	11	36	f	\N	2017-06-02 11:19:35	\N	core_admin.level.admin
\.


--
-- TOC entry 2678 (class 0 OID 0)
-- Dependencies: 230
-- Name: core_admin_user_module_config_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('core_admin_user_module_config_uid_seq', 44, true);


--
-- TOC entry 2614 (class 0 OID 77578)
-- Dependencies: 200
-- Data for Name: core_cms_picture; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY core_cms_picture (uid, deleted, deleted_at, created_at, updated_at, alt, extension, webpath, random_key) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 0)
-- Dependencies: 172
-- Name: core_cms_picture_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('core_cms_picture_uid_seq', 1, false);


--
-- TOC entry 2621 (class 0 OID 77672)
-- Dependencies: 207
-- Data for Name: core_customer_address; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY core_customer_address (uid, company_uid, deleted, deleted_at, created_at, updated_at, street, complement, postal_code, city, country) FROM stdin;
2	1	f	\N	2016-11-28 16:26:36	\N	3 rue des Perches	2ème étage	31000	Toulouse	\N
3	2	f	\N	2016-11-29 09:13:12	\N	\N	\N	\N	\N	\N
1	1	f	\N	2016-11-28 16:26:35	2016-12-20 12:22:44	4 Rue de l'Agout		81370	St Sulpice	France
4	1	f	\N	2016-12-20 12:26:35	\N	118-130 Avenue Jean Jaures	\N	75019	Paris	France
5	1	f	\N	2016-12-20 15:29:36	\N	 77 CHEMIN DE LESPINASSE 	\N	31140	Aucamville	France
6	1	f	\N	2016-12-20 15:40:18	\N	77 chemin de Lespinasse	\N	31140	Aucamville	France
7	1	f	\N	2016-12-20 16:44:48	2016-12-20 17:46:02	15 rue Ali lbn Abi Taleb		01000	Tunis	Tunisie
8	1	f	\N	2017-01-06 12:31:44	2017-01-06 12:33:23	413, rue d'Esparsac 	\N	82500	Beaumont-de-Lomagne	France
9	1	f	\N	2017-01-23 17:03:19	\N	52 Boulevard Gabriel Koening		31300	Toulouse	France
11	1	f	\N	2017-03-24 10:58:50	2017-03-24 11:07:02	Chemin de Moulis		31200	Toulouse	France
12	1	f	\N	2017-03-29 19:23:56	2017-03-29 19:25:55	1515 Route de Montastruc			Bazus	\N
13	1	f	\N	2017-04-24 15:50:06	\N	73 Rue Fondaudege 	\N	33000	Bordeaux	France
14	3	f	\N	2017-05-11 11:23:31	\N	\N	\N	\N	\N	\N
15	4	f	\N	2017-05-11 14:24:29	\N	\N	\N	\N	\N	\N
16	5	f	\N	2017-05-11 14:42:55	\N	\N	\N	\N	\N	\N
17	6	f	\N	2017-05-15 15:07:05	\N	\N	\N	\N	\N	\N
18	7	f	\N	2017-05-15 17:30:40	\N	\N	\N	\N	\N	\N
19	8	f	\N	2017-06-02 05:49:19	\N	\N	\N	\N	\N	\N
20	9	f	\N	2017-06-02 11:19:31	\N	\N	\N	\N	\N	\N
21	1	f	\N	2017-06-06 15:30:05	\N	\N	\N	\N	\N	\N
10	1	f	\N	2017-03-14 17:07:01	2017-07-27 14:39:30	1238 Bertalai	\N	81500	Ambres	France
\.


--
-- TOC entry 2680 (class 0 OID 0)
-- Dependencies: 177
-- Name: core_customer_address_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('core_customer_address_uid_seq', 21, true);


--
-- TOC entry 2619 (class 0 OID 77647)
-- Dependencies: 205
-- Data for Name: core_customer_contact; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY core_customer_contact (uid, company_uid, picture_id, firm_id, deleted, deleted_at, created_at, updated_at, gender, first_name, last_name, email, firm_role, phone, meeting_description, meeting_reason, other_meeting_reason, random_key) FROM stdin;
3	1	\N	2	f	\N	2016-12-20 12:26:36	\N	gender.male	Christian	Picquart	cpicquart@aol.com	Gérant	\N	CRM	client.meeting_reason.partnership		04a6941d8732582452bcb16afcd4daa8
4	1	\N	3	f	\N	2016-12-20 15:29:37	\N	gender.male	Thibauld	Tourneur	t@lb.fr	\N	0562750393	ERP	client.meeting_reason.solicitation		73e7c9149a2f023397c356fe37558f59
5	1	\N	4	f	\N	2016-12-20 15:40:18	\N	gender.male	Thibauld	Tourneur	th@bt.fr	Gérant		ERP	client.meeting_reason.solicitation		01a09c110853ce4ceab4c1121ba3fb57
6	1	\N	5	f	\N	2016-12-20 16:44:48	\N	gender.male	Christian	Picquart	cpicquart@aol.com	\N	\N	\N	\N	\N	f13b17f569dd851a8da17df49eb8a284
7	1	\N	6	f	\N	2017-01-06 12:31:51	\N	gender.female	Diane	Aoueille	vistalomagne@gmail.com	\N	0563645189	Refonte site web	client.meeting_reason.tender		0f4550200ae32ab4fef189c2cb5e6d75
8	1	\N	7	f	\N	2017-01-23 17:03:21	\N	gender.male	Emmanuel	Cathala	emmanuel@bilobia.fr	\N	06 68 13 12 93	Tom Pharmacie	client.meeting_reason.partnership		20c5bf835723faa42db04e4bde249f7a
1	1	\N	1	t	2017-03-04 15:30:14	2016-11-28 16:26:36	\N	gender.male	Michel	Contact	michel@cont.act	Testeur	\N	\N	\N	\N	5c94813fd459b2acdfabadd10633b833
2	1	\N	1	t	2017-03-04 15:30:26	2016-11-28 16:26:36	\N	gender.male	Michelle	Contact	michelle@cont.act	Commerciale	\N	\N	\N	\N	474c9db71e0190cb0e975c583a5c4fd5
9	1	\N	8	f	\N	2017-03-14 17:07:03	\N	gender.male	Claude	Zollet	czollet@gmail.com	\N	\N	\N	client.meeting_reason.incoming_call	\N	6ae51c4995877c70d4b2e8a417d098a8
11	1	\N	10	f	\N	2017-03-29 19:23:57	\N	gender.male	David 	Frambourg	frambourg-conseil@orange.fr	\N		Site vitrine	client.meeting_reason.incoming_call	\N	fa7f45af7567b9989d4de7cd6588ee4a
12	1	\N	11	f	\N	2017-04-24 15:50:09	\N	gender.male	FERNANDES	GEREMANO	contact@weglio.fr	Directeur		CRM	client.meeting_reason.partnership		00060f6ee7282ea07090ba7c10ab5c89
10	1	\N	9	f	\N	2017-03-24 10:58:54	2017-05-15 12:23:15	gender.female	Sylvie	Dutarte	s@wanadoo.fr	\N	\N	\N	client.meeting_reason.incoming_call	\N	ff4e1fcbba94ba61c75043cccfede10e
13	1	\N	12	f	\N	2017-06-06 15:30:07	2017-06-06 15:33:56	gender.male	Olivier	Couraud	olivier.claire8@orange.fr	\N	\N	\N	client.meeting_reason.incoming_call	\N	271fb7e388c71c599628b2549a0cbf47
\.


--
-- TOC entry 2620 (class 0 OID 77665)
-- Dependencies: 206
-- Data for Name: core_customer_contact_tag; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY core_customer_contact_tag (contact_id, tag_id) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 0)
-- Dependencies: 176
-- Name: core_customer_contact_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('core_customer_contact_uid_seq', 13, true);


--
-- TOC entry 2618 (class 0 OID 77633)
-- Dependencies: 204
-- Data for Name: core_customer_demand; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY core_customer_demand (uid, company_uid, contact_uid, firm_uid, deleted, deleted_at, created_at, updated_at, asked_at, title, description, tags, completed, completed_at) FROM stdin;
1	1	1	1	f	\N	2016-11-28 16:26:36	\N	2016-11-28 16:26:36	Refonte Presta	Le site est actuellement en 1.5, il faut le passer en 1.6 avant septembre.	\N	f	\N
2	1	9	8	f	\N	2017-03-15 16:22:37	2017-03-15 16:23:41	2017-03-15 16:21:44	new demand	test	\N	t	2017-03-15 16:23:36
\.


--
-- TOC entry 2617 (class 0 OID 77619)
-- Dependencies: 203
-- Data for Name: core_customer_demand_message; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY core_customer_demand_message (uid, company_uid, external_author_uid, internal_author_uid, customer_demand_uid, deleted, deleted_at, created_at, updated_at, content, hidden, received_at) FROM stdin;
1	1	\N	1	1	f	\N	2016-11-28 16:26:36	\N	Réponse numéro 1	f	2016-11-28 16:26:36
2	1	1	\N	1	f	\N	2016-11-28 16:26:36	\N	Réponse numéro 2 (client)	f	2016-11-28 16:26:36
\.


--
-- TOC entry 2682 (class 0 OID 0)
-- Dependencies: 174
-- Name: core_customer_demand_message_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('core_customer_demand_message_uid_seq', 2, true);


--
-- TOC entry 2683 (class 0 OID 0)
-- Dependencies: 175
-- Name: core_customer_demand_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('core_customer_demand_uid_seq', 2, true);


--
-- TOC entry 2615 (class 0 OID 77589)
-- Dependencies: 201
-- Data for Name: core_customer_firm; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY core_customer_firm (uid, company_uid, address_uid, deleted, deleted_at, created_at, updated_at, name, email, website, first_contacted_at, status, legal_name, legal_status, phone, siren, siret, is_pro, vat_accountable, vat_identifier) FROM stdin;
1	1	2	f	\N	2016-11-28 16:26:36	\N	Client Inc.	\N	\N	2016-11-28 16:26:36	firm.status.prospect	\N	\N	\N	\N	\N	f	f	\N
2	1	4	f	\N	2016-12-20 12:26:35	\N	Aequitas	\N	\N	2016-12-20 12:24:20	firm.status.customer	\N	\N	\N	805051703	80505170300017	t	t	FR 39 805051703
4	1	6	f	\N	2016-12-20 15:40:18	\N	La boutique du filtre	\N	\N	2016-12-20 15:37:54	firm.status.customer	\N	\N	0562750393	823196951	\N	t	t	
5	1	7	f	\N	2016-12-20 16:44:48	2017-01-03 15:52:35	DREAM LIFE	\N	\N	2016-12-20 16:40:35	firm.status.customer	\N	\N	\N	\N	\N	t	f	\N
6	1	8	f	\N	2017-01-06 12:31:48	2017-01-06 12:33:18	Vis ta lomagne	\N	www.vistalomagne.fr	2017-01-06 12:29:41	firm.status.prospect	\N	\N	0563645189	\N	asso	t	f	
7	1	9	f	\N	2017-01-23 17:03:20	\N	Bilobia	\N	\N	2017-01-23 16:56:20	firm.status.prospect	\N	\N	\N	815260468		t	t	FR39815260468
3	1	5	f	\N	2016-12-20 15:29:37	2017-02-01 09:18:31	La boutique du tracteur	\N	\N	2016-12-20 15:19:38	firm.status.customer	\N	\N	\N	429330293	42933029300037	t	t	FR 59 429330293
9	1	11	f	\N	2017-03-24 10:58:52	2017-03-24 11:52:14	Sylvie Voyance	\N	\N	2017-03-24 10:58:42	firm.status.customer	\N	\N	\N	\N	\N	f	f	
10	1	12	f	\N	2017-03-29 19:23:57	2017-03-29 19:25:55	Frambourg Conseil	\N	\N	2017-03-29 19:23:05	firm.status.prospect	\N	\N	\N	508 702 966	50870296600021	t	t	
11	1	13	f	\N	2017-04-24 15:50:08	\N	PSE33	\N	http://www.pse-33.fr/	2017-04-24 15:48:32	firm.status.prospect	\N	AP	 05.47.29.46.82	482 892 981 	482 892 981 00051	t	t	FR57482892981
12	1	21	f	\N	2017-06-06 15:30:06	2017-06-06 15:33:56	Olivier Claire	\N	\N	2017-06-06 15:30:02	firm.status.prospect	\N	\N	\N	\N	\N	f	f	
8	1	10	f	\N	2017-03-14 17:07:01	2017-07-27 14:39:29	Mozaic Trading	\N	\N	2017-03-14 17:06:52	firm.status.customer	\N	\N	\N	\N	\N	f	f	
\.


--
-- TOC entry 2616 (class 0 OID 77612)
-- Dependencies: 202
-- Data for Name: core_customer_firm_tag; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY core_customer_firm_tag (firm_id, tag_id) FROM stdin;
\.


--
-- TOC entry 2684 (class 0 OID 0)
-- Dependencies: 173
-- Name: core_customer_firm_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('core_customer_firm_uid_seq', 12, true);


--
-- TOC entry 2622 (class 0 OID 77709)
-- Dependencies: 208
-- Data for Name: core_oauth_server_access_token; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY core_oauth_server_access_token (id, client_id, user_id, token, expires_at, scope) FROM stdin;
1	1	2	OWVhYmE4ODRmMGNlZGI2YTdiZWMyZTU1NTc2ZmM1M2Q3NWQ5OTYxM2ZhNzcyMTA5M2IxZDc2MzUxYzY0OTY4Mg	1480413421	\N
2	1	1	OGY3YWQwNGY3ZjI0MzQ3YTA3N2QzZmUzYTFhNmI3MDliN2Y2ZTZjM2Y1YzVhZTM2ZDcxMTFiNGMzMmJmYWNhOA	1480414516	\N
3	1	1	OWZiNTM4Y2ZhMWIzM2YzNTQyYzFjNjBhMzgyN2E5NmI4NDgzZjcxMjk5ZDFjNzlmNzgwMjJhY2EzYTk1YmVkNA	1480415814	\N
4	1	2	YzNjMTU2OGE0Mzg0ZDU0ZTA4ZWQyY2VjMjBmNDg3YzBiOGZiZTJhZGE3Y2Q0YjliMGY2ZDhjZmU0YTE3MGVkYw	1480415881	\N
5	1	3	MWVlODQyZTE5NTU4YmU3YzMzY2NiMGNlYmM0NDUzYWM0ZWNmMzNiYjY3NzM1YTNhZjU4NWM2MThlZGRkODY4Yg	1480415952	\N
6	1	1	MzBiMzdkOGFlY2Q5NmY1YjIyMTljNDA1YWY5NzgxNDI4NmU1ZjY2NjJkYjBlOGNmMjc5ZmZhMzZiMmVjZGUzMw	1480439034	\N
7	1	1	ODljNDBjZjIwZjU2ODNlODU2ZWQ4MGQ3MmI2NGY0MzU1YjIwNTNiYTAxOGE2NGE1M2E3MTg2ZjA1MDk4ZTIxNA	1482236203	\N
8	1	1	MjRmNWJlY2UwMjc3N2Y5MjU2NzBjMWYxMjZkNTY4NjkzMWZhMDE2MmFkOTQ1YzhiYjNlZWM4YTc4MjNhMGIwZg	1482236364	\N
9	1	1	NzdhMjU4NzZlOWQwMmY3OTNlYjVmODNmMDE2OTE3YzY3Y2E0M2EyNDhiOThhYjY2N2Q0ZWQ3ZDY4MmU0OTBhZg	1482236424	\N
10	1	1	MTZkMDYzMzA2YjVhODU1ZjBjYzUwNjYyMGI0NzQwZjc5YzFhYmI1MGEyNjA3MTU1NGIzYTJjOWRmZjg5YTYxMw	1482236918	\N
11	1	4	ZTUyYzdiMTY1NDYyNDMwN2Y4NDk4ZTM3M2M0Yzg4NTE1MGE1NTMyZGM0ZTk0N2YyOWM1YWY4YTBlZjZkOGQ5MA	1482237028	\N
12	1	4	MWJkZjFhNWM4MDU1MTZjYzQwZTBlYTA0MTlhYWUxN2ViNDAxYmEyNzZjNWY4YmIwYTYwZDA1ZTg1ZmYzNWUxMQ	1482246541	\N
13	1	1	MTRmMmY2YmM5MmViY2NlYTBhZjIyMDY2OTc5YzUyZDkxZWNkNDcwZTllM2QwNWFmYTdlZTlmZmU5ZmNlODIxOA	1482251652	\N
14	1	4	YTI1NDYxZWM3MGZlYzQzYjk3MDA3ODA4YzNjZmMxZTc3MGZjYTRkYTg2MmFkN2Y5NWVmMzYzMjUyN2E5Yjg3Mg	1482255891	\N
15	1	1	NDJkNjdmZjk2MjlhOWQ1ZDJmYjJlMTY3N2RlZTY3NWYxYTdjZWMzMTcyMGYxMmNlOTZkOGE5NzIxNTUxMzkwOQ	1483458669	\N
16	1	1	MjkxZDIzZGQ4MzFiNWFlZGE5MWU4NzQzOTM5YWFkZGM2NTUyYTc4ZTQzNWIwOGMzY2NkNDVhOGI4MWEyZThlYg	1483619502	\N
17	1	1	MjNjNDA0M2Q3NDM5NTM3YTU1ZTBkMzQwN2RmYTJlNTRjNThhNjU4MjA2NzE0ZjMzODY0ZWM2NjFjYmUxY2Q1Yw	1483705774	\N
18	1	1	YjQ4OTZiMjZjYzQ3OGI0MWRkYzVhNjI3YzNjZWQyNzkxZmFjYWU4MjMxMzFjODc5NTZkN2Y3NjQ3OTFhMjJmYg	1484310686	\N
19	1	1	MTlkMDBiMWY4Mzg0OTk0ZTUyODA4MTk0MTUzOGM0ODU0YjBhZWU0ODAzZjJlZjFlZDY1YjFkYTFhZGFlNjA1MQ	1484327174	\N
20	1	1	NTkwMGE5MGExMjViMTkzZDlhMDlkODBhYTZiZmI5YzlmZTQ2ZmI5OWU4NDkwZTMyYmNmNzU5MGRlNDc2ZjI2Yw	1484560579	\N
21	1	1	M2FlMjkwZmIwZjRjZjhmNGYwNjI3ZDZjNmZiZDc3MmEzZDA2MWIyMjJhNjkyODdhZmZiMTAyMzNhMDgzYTdhYg	1484827158	\N
22	1	1	MTVjMWM5ZDg5YjNkYzZlZWJhY2JjODU5NmRmN2ZiMWM5N2M3YWIwNjU5M2U0NGY2ZWNkZDMwZjY0MmI4YjYzNw	1485190547	\N
23	1	1	YzcwNWVlZmY2NmNmZGJkMDY5NmRiYmE3YWVmZTc1ZGM1M2U0ZWI3ZGMzMTUyNzBiMWM0NjIyMDQzMDI0NjY4OA	1485940564	\N
24	1	1	OTQ1ZWZlNmRmZDcxMzhjZmUyZWU1NjA2YTY4YWE4ZjgyNDIzZjYwYmJlNWNiZTdiNGI3ZWMzNzQ4YTkzYzI0NA	1485958255	\N
25	1	1	MzJiODA0NDQ5Yjk1YjdiMTA3YTA1NzNlMzQ0N2RiY2YxNDQxNTk3ZWNkOGI1MTZiMDE1MmMwMTI0ZGNiOTE3YQ	1486548851	\N
26	1	1	ZDVmMTJlYmNiYjllOTI1ZDQwZjM5OTcwYzE4N2VhZGRkYTIyZGRhOTdkMzFmOTViMmRhNTJiMzExMDJiY2JlNw	1486555047	\N
27	1	1	NDRmOTgwMDAyNDUwMDNmYTc1ZDcxNGE1MmEwMGZmM2M5MTM0ZDFkNTllMzZiODAxMzAwY2EzNWI2MjcwMzA2MQ	1487000416	\N
28	1	1	NDM5ZGZkZjFmMzQ2MTJlMWY3MWE1MDdiZGM1YzQxNjMwMjYyYTFhMjVjYzg5Yjk0YWI1YWFkODgwODE1MGJhMw	1487001534	\N
29	1	1	ZDYxYWMzOTBhODQ1MzRkMjA2NjE4YTljMWYzNzg2MWQ2OTY3ODg4MGVhYjQ4NDQ1ODg2ZGEyZTUwMzkzZjg2ZQ	1487066597	\N
30	1	1	Zjc4ODM0NDY5OTA3YjhkZmQ4ZDYxYjE3ZTQ5MWZkZGQwM2IyYzkzZjNlOWEyYTczNDMwZmFhNzVkNWU5ODI4OQ	1487697916	\N
31	1	1	MTUzYmYwNGU3YjY1YTAxYjI2MzUyYjdkZWViMzY5ZGIxZjc0YmRkYjk5NmM3MTFiOGQzZTlkZDIyMDlhZGQ1Mw	1487853165	\N
32	1	1	YTRjODQ1NDJlYjQzZjdlNDc1ZmFhNzU0MjdiMTNmMzk2MGI2MzAxMjFmODBkNWQ1YjRhNWIzNTVlMTVkNTdiNg	1487952482	\N
33	1	1	MjljMjY1ZDllMDZmYWZkNDJjNzMyNmE5MTU2Y2IzMjU4ZjFlMzk4OTU1Y2EyMmI3OGRkZWQyYjAzZDE4ZDBkZQ	1488121439	\N
34	1	1	YjI3MWM5NmI5NTA1ODBjMTU0YWFhNzIwNjI1ODI3ZDhhNWVjMjBiNTlhOWIyOWQ2Yjg5YzcwZGY0NDRhYWFmMA	1488193269	\N
35	1	1	OGUxYzcxNjAzNGVmNDg3OGVlMjY0ZTlkNzUzMDE2ZjUyZmQ4ZjIwMjRlN2U5NDg2MjY0Y2JkYzBmNzI3NmQ3OQ	1488641205	\N
36	1	1	MzgzNmI5YmM1YjhhZTRmYzg1OWFmNDcxZGQxZWJhM2Y4N2UxOGRhMGVlMDRmMGEzMDhlMzEyYWFjYjRkOGU4NQ	1488907888	\N
37	1	1	OGMwMzE5OGIzNDk1Y2U3MzI0NDY4YjQ0YzFjZDg1NTE2NjMxOGFhODVkNGUxZDdlOWI0MmYzZDM1Mzk3ODQ1OA	1488963754	\N
38	1	1	NTQzZTE4MDUwOTMzZDk4YTk1MjY3NjUxYWM5MzNiZWNjODkyMGZkYzRlNzQxNWY0ZmNjNTkzMWRjZWQ4OWVjMQ	1488967472	\N
39	1	1	YWNjZmQxMzdiNzgzZjZhOTMzYTlhZmY4NmE1NTYwNTIwOGJhZWQzY2RiZjk0ZmI1N2I3ZjE0ZDM0YjYzZWYxMA	1488981762	\N
40	1	1	YjcwMWQ1MDY4M2M5ODA1NTc0ZTM3MDU2ZDAyZGYyYzhlMmIyZWFjMWZjN2UwODcxNzg1YTYyYzUwYmUyMDRkYQ	1488985555	\N
41	1	1	M2RiZjZkN2IxNmE4Yzc3NDgyODE3ODcyZDAzYmI2YmQ5NjYwOWJhOWYxNTA2YTQwZjJhNDIzOTZiN2U0ZTZiYw	1489051830	\N
42	1	1	ZDNhNjMzMjdiMjhhZjBkZjlhMTJhZGNjNzA4ZjE1N2QyYzFmM2NmNzQ5Nzk3ZjcxMTA2OGY5YWFlZGU3ZTlkNg	1489074314	\N
43	1	1	OTk2NDRiZmYzOTlkYzVkNGZlMmZlMTk3ZDg3NmIxZWI3ZjNkNjkxODdkMmIyYjNlYTZkZmY4MzhmYjEzNDBiNQ	1489406920	\N
44	1	1	NWQyMmFkNGExZDA1MTljMzc0OWU4NjFjMWU0MzgyOWI3NmMwNWY0MDRjM2MxZjAxZjcyZjE4ODY0MWM3NmJhYg	1489510501	\N
45	1	1	YzUwNDU3ZjQyYTQ1Mjg3YjQxYzc1YzBjZjM0NWEyZDdhN2NiOWViZjkxOTY2MjdkNjMyNDVlZmNlMzBmZjYwZQ	1489594676	\N
46	1	1	MjliNWY0OWQ0ZWRjZjcwMjk0MDNlMDI2NDdiMzQyODAxZTUyMjhiZWE3YzU2M2M2OTFjOGUzZDQ5MTQxNGJmYg	1489743446	\N
47	1	1	ODU3MzZmNzRmODI5MGU5OGFmZDY0ZDc3YjFlZGRmMDI0Y2U0ZGNhZDJjZjNlMmJjOWZlZTA1YTU5NThlNDJmZQ	1489748334	\N
48	1	1	ODY2NWIyOGQ0OGMxN2QwYWZiNDY5NjY0ODhhMzY3YWE5NzY4OGY5MzhhZTlhNzIwNjg4ZmIyMDU4Njk0NGEyZQ	1489751750	\N
49	1	1	MTEyZWE1ZTcyZDg0MmNjYmE5MDk5NjkxOTgwNjE2N2NhZGUxYTA3NmFiZGNiZDAxYjQ1MGI4MmQxMTc5YWFjMg	1489751962	\N
50	1	1	NDNiY2U0YzI3YjdkZmQxMDA0NGU1ZGVhMjMzNTBhYzg1ZjFhZTQ3NmE4ZGYzNDI0YTRiODY3ZTdmYzQ5NmMxZQ	1489754459	\N
51	1	1	MzdiODc3NmUwMjRlMTE4MzY4ODUzMTA3ZTZhNmE5MTRhZGFiNTkxZGJmZTgwZGFiOWE5MjRkNzY0NTg1NmFlMw	1490006991	\N
52	1	1	MTRkNTRmMDBmMGI4ZjBjODIxYTcyZjUwNjY0YTVkM2VjMzMzODExNjJmZmE0MGRkYWEzODYyYjE4MjQyZmQ1YQ	1490211328	\N
53	1	1	ODFjMWZhZjRjZWE4ODM1YzY4OWE2MzU5M2I1ZWFhZDA4ODgwMmQzZWY1ODg0NDRjOTA4ZWZkYmMxNjJhYmQ3ZQ	1490352864	\N
54	1	1	NmRhZjRlMmNjOTI5MWU4ZTEyYzQyYmJkOWJhNmMzZTc0ZjJlNmJlZTJkMGY3OTQwYjc2NmUyODVhYWE3ZDc5Yw	1490357843	\N
55	1	1	NjdiNTBhY2NmYjQ1NDQwNGE0YjJiZTkyZTQ4NmYwMzk2OGM0OGE4Yzk3OWUyOWQ5YTQyYjA5MTNhZTJiNGFmYQ	1490376931	\N
56	1	1	MjY4YzFhNTgxZjQ5NDcyMTI1ZjBjN2FhZTllMjYzYWU4NzMzNWJiOWEyNWEyMjA3MTVkNzFmYjg1NjQ1ZWYwNg	1490692384	\N
57	1	1	YTdhZTJjN2Q5NzczNTg1M2M1ZTAzZDdmYzFjNWViNWU1YTZjOTg1ZmYzNzI4ODJiZDU5ZWI2OWNjN2Q3NDdlOQ	1490720094	\N
58	1	1	NDUwNWYxYmY3NWYxMjEzOWJlMGU5Y2Y0YTcwYzIxMGI0ZTdlYWJhY2RjY2UyM2FlMDEzYTBlOTIxMTBmZWJkMA	1490811729	\N
59	1	1	Mzg1NzczZWZiYzhkODgyYTQ0MjZmZWFmNDUzMjdlNTRmMzdkYWZhNTAzODFjY2Y4NDkxOWVjMDBlYzgyYTRjOA	1491324419	\N
60	1	1	ODZlMWQ1NGY0ZTUyNDkwMjgzMTBiNTcyZDE5YWVhYjU3MTRiY2IyZThhZDg1YTNmNGM3ZDc0MzQ5ZWNhMTJlNg	1491497152	\N
61	1	1	ODAyMTk5OWI3MjQ2MzFlMGFmMDg3MDU4ODg0YzZkMTkwZGMwZGE1MGYwZGZkOTVkZTdhZmNlNGQ0ZGZlOTk5Nw	1492074719	\N
62	1	1	YjlhZDU5NTk2ZjEyYTMyYzFlMzI2ODVlNGU0YTk1MzEzNWM2NjEwMjVjOGM2MWRhZTQ3MzEwNDVkZGI3ZmY0Mw	1492511399	\N
63	1	1	NjZmMWYzZDczNGU0Yjg5MDA2NjA5Mjk2NDRkY2E2ODcxNzc0MjQ4YmI1Y2I4YTZmYWUxMzhmYzE4NzMzYzE1NA	1492533678	\N
64	1	1	NzUxZmY2ZWM0NGViOWUwZmE4M2VlNWRmNGRlNWMzODUxYzdhOTY3ZWNlZmJlYWU3NjFiODBkZjM1OTgwNzZkYw	1492544446	\N
65	1	1	NDgzNjk2MjRmYjE2Y2VmNDRhYzI1OGNiNmVjNmMwNjBmNDRmZmJlMWNjZDlhZmEyYjRmN2YwZjZjM2ViZmViNQ	1492622324	\N
66	1	1	MmYxNWM3YmYzOTJlOTc0YTJiNTM4MzE0MjgwZjY4MjE4Mjc4Njc0MTgzZmFkNzhkMGViNTc1NjlhOGFhYmQ1MQ	1492708516	\N
67	1	1	NGM0NWQ2YzE5N2RiMGY2YWJmNzQ4ZmNiM2MwMGQzMzFiYTJiY2JlNTdhYmUzYmYzZDFiODUwZGU5ZmU2MDY5Zg	1493045048	\N
68	1	1	ZjNjMWRiY2JmZTg5ZTAxMGI1YTdmZGY4M2JjYzM3Y2MwNWY1ODQ3OGI3OTVmNTBkZjZmNjlhMWYyYTY1ZjNhZA	1493051340	\N
69	1	1	NTFjZTE0YmJkMzU0NzFmYjMzN2QwZTdhYTIyMjY5MGRhZTAyZjhhMWZjMjQyN2FmNDdlZGNlMTJjMzhhYTA3Zg	1493131481	\N
70	1	1	OGMyODRjM2M5NWNiNGNjMjIxY2VlMzEwZWE3MDFmOTRlZThlM2ZmNDJiYmRmNGIxNzRhYTkyMjRhY2RhMDEwNw	1493131484	\N
71	1	1	NTk3YmFjZTYxYzMxOTdiNmY2MDViMzg5MDI5Njc1ZTEzNTEwOGE0ZjI1ZWU3OGRjMmY0NGYxNWNjZTcwYjBiNQ	1493138706	\N
72	1	1	NDc5N2FlMWNlMjlhNWRiNTUyNzAxYmU4YjFjMWRhNzgxZWQxMGJiM2QyZmRjZjkxNmNmMTdkNmI5ZGExNmUzNg	1493202482	\N
73	1	1	ZjFjNmI1N2U2MzYxYjljN2Q5MjBjMDBmNTlhODFhNGRlNDRhMDA4ZTQ5YWM2MTk3N2RjYmJjOWNhMGYwNWEzOQ	1493378147	\N
74	1	1	NDZhZWUxZjc0ZGY2ZTczMjRmY2Q1YzBhZTUwMDkxYzI0NzRhNzEwZjM3NGFjYTk0NGFmZTI0NTJiMzEzOTBkMg	1493387537	\N
75	1	1	M2U4YWMzZWM1MTRhNTA0MzIzMzg2NzM5ZjZiMjg1NDAwYWRlOGFhMTc3NjVkNTdiOWY3OTE2YTkzYmNkZjhkMg	1494329501	\N
76	1	1	ZWYwNDBkYzVhZWMzZWM4NzZmNzUwZTQ5NTAzMzliYjNiMGRlZDIzMjQ1MDlhOTdhNzRiMzlhMTk0ZGZhMGNjNQ	1494499713	\N
77	1	1	NDFjMTY4MDlmZjhkZDU4ZjYzZGY0YWM1Zjc5Mzg0ZGNkOTc5ZTVkNzYzMTc4MjIyOGNlY2RhYTY5YWQ2ZWRmZA	1494521637	\N
78	1	1	OGYxNTRjODA2YmFjYjI2NzdkOGNiNTJkNzcyNGIwYjY0OWVhNjVhM2NmZmMyZTUzYzBmYzcxODdhYmEwM2UzZA	1494845571	\N
79	1	1	NjdlNTBiMTMwNGRkZDQ1YmYxMzYwNzhmYWUzNTJkMmYzM2FlOWFlZjAxNTZjMGEyMzZiMmYzYTJjNTM4NmQ0NQ	1494847345	\N
80	1	1	ZTYwYmY2YmVkMjc2YzRiOTU5OWU4MWIxMGRkMmVlM2I1MzA4NzAxNmYyNThmMDBmZjEzYjIwY2RiNjQ2OWQwZA	1494848659	\N
81	1	1	NDk5Y2RkYzRmMmRjZGQ0ZTBkNGQ3MWZhNzBjZmI1YWE0MjcwM2VkNzA1NDYxYWI0ZmQ4OTg3Yjg5MjczOTI3YQ	1494849157	\N
82	1	1	NTY5NjRhMDAxZjgyZTUzMzk3MDI1ODdmZWQ4ZWNlNmIyYzFmNTBmZDBhYzc0NWI1ZDAwN2ZjYTdjMWRmM2E2ZA	1494849343	\N
83	1	6	MDNkNDc3MTNlMTMyNzdiNjVjMTU4MjNjNjRmZmJjNDk1MGViNDE0YmNhZDE4OTBhMDM2YjMxN2EyNWUwZjJmYw	1494866085	\N
84	1	1	OGFhNzYxYzhmYWEwMzEwMmE0ZGU1NTRlY2EzMmNhZDY1ZTYxMGVmNGE5NDIxYmQyNTY1NzE4YmU4OTFjMDM3YQ	1494866451	\N
85	1	1	ZTk0NWQ0ZjU4MWM4MWNkMzMyZDdiYjAxYmE3MDY0Y2ZiZDNiYzg1MjI4ZDg4MjBhNGRmNTY1NjFhOWZiYTU3MA	1494940393	\N
86	1	1	MzRjNGI3MDBjZDI1NzQ4ZDViOTE1YTIyODhiYTA5MjIwNjczMTBmOTc5MjdhNTMwZTRhMTgzMTY4ZWRhNDVmYg	1495117457	\N
87	1	1	ZDU1MGY3MTA4ZjJjZjA1MWY0YjQyZWQ3MmI3NjllNzgwNDBjMzQwODYxNzZmOTMzNmEzOWQyYzYwYjFhMjM2NQ	1496153848	\N
88	1	10	OTkwMjY4OTk2ZDgyZGY1Njk0NjU5YTM2YTFlOTE1MDRkNGE4NmYzMTEyZGJhZjlmZTM2ZjU1ZTEwNjJiMTczNw	1496392848	\N
89	1	1	Nzc5MmI4YzRiN2QyMzU2YmU2OTRiMjg5YjA4YWViZjdiYjFiNWYyMGIwODliYWI2ZjY2NzRhZjRjYjcyZjYwOQ	1496758713	\N
90	1	1	MDMyNTRlODdlNWFmNTk0MzVmMTU3Yzk0NzU1NmQ4MzdjYWM5NDk0MWM2ZjQ5YjYyMWI2ODFjNDMyYWUzYWQ3NA	1496759698	\N
91	1	1	NDYxMTlkZWZkYmY1MWY2Yzg1ZGY3Y2M2MWZmMTMxYjZmOGYyOTNiNzE0Y2M2NzJlNjQ2YzFiMGZlY2ZhYjZlMQ	1497263010	\N
92	1	1	MTQwYjg5YmY3ODI4OTNmYzA3N2JiNjIwNzkyYzNlYjE0ZDI5OWYzZjg0OTJjNzdjMjJhODZkN2MwMjk2ZjMyYQ	1497267314	\N
93	1	1	MjRkZWNkNTVmNTJmNjg1M2U4ZjVlZjg2YzU2ZjdkOWUzNDA0ZTMzZGU0ZTRlZDA2Yzc2MWNlMTAwNGJhZDljMQ	1497277477	\N
94	1	1	ZjBjZTQ3OTkyYTcyNjI2OTRlMmE0ZjVlNDE0ZDRlZmVlZjljYzk4OTRmZjg2ZDY2MWRmYmVmMWJhMTM2ZjM5OA	1497347191	\N
95	1	1	Mzg1NTIyNTNhNzZkYmY2ZDJlN2JmMTgzNmQ2ZTQwNzVlMDIzYTBmMjk2MGY0YTVjMjEwMWIwYTg2ZmU4NGViZg	1497434425	\N
96	1	1	MDM1ZmFiZjQ0N2MyOTlkODMyZDM5Mjg0NGMwMGUyM2I3YWIwZGNjZTU1YjhmNGEyN2ExNDVhYTdiNWNlMGI5NA	1498039132	\N
97	1	1	MjJmYzdjZjM0MzQ4MGMxNTljOWYxZTQzZGJlNzljNWJlODBhMTU3MWY2MmJmZDM3ZjZiZWFjYzNiZTU2M2ZjNA	1498216752	\N
98	1	1	ODJlNDVkODA1ODBhMWVjNDA2MmM5M2QxNjM5NDFmNTlhNjIxZGNmN2E0YjgyZWM0NTIxMDZkMjgxM2NhOThjMw	1498468546	\N
99	1	1	ODEwOWEzZWMwMjAxZWQ5OGQ1OGM0Yzg1YjI2ODFkZDI1Y2MyZDU4MTM4MzI3OGYzNGVjZjFiNjg0OTc5ZjliYw	1498471145	\N
100	1	1	ZTkwZWU4MmQxZWZhODMyOGM1ZDQ5NTZkMzAyYWJiODdlODYwNjQyMjBhMmIzMWNkZjY3OTg0YjAyZWFmOTMyMw	1498471848	\N
101	1	1	MWUyNzRkMTUwNTIyM2JhMmQ3YmJhYWU2ZDcxNDAyODQ5NGRkYWQxNTIxNjMxZGY4NDhjZTRhZmMwYTI0NWE2YQ	1498472086	\N
102	1	1	ZjJlMmYwZDUzMzZiMzE0NzZkMGE3N2M1NDBjNjA3NGEyMzYxNjMyNWFkMTQ0YWYwOTBlOTlkMzA3ZmMwNGRhMg	1498666034	\N
103	1	1	YjYzNGU0M2JkYjdlYWYyM2Q4MGFhMTVmODcyMWM5YzcwNjI0YjgxMDExN2ZmMjQ5MDEwNWJjYmZkMzI5YmRmOQ	1498732116	\N
104	1	1	NjQxNDA4ZjVkZjE1MzExOTM5ZTMxYzk4ZDJkNjAxOWIxY2QxNmUxOGJhMzkxODZmODIzOThjZDZhYmQyZGMzZA	1499074936	\N
105	1	1	YWZiMDc3NDFkNGQxN2JjOGQ4ZGUyOTY2N2Y3NGY4NDZiOTI2ZjVjY2Y0OWI1YjY1NjJkMmU4ODBlNjM2YWI4Zg	1499680616	\N
106	1	1	ZTZiOWZmOTY2M2NlYmU1NTZiNjQ2ZWJhZTFkZjIzYzllZmY0NDdjOTA2NmNkOTZkODY0M2M5MzYyMzEyZjBiMw	1499680617	\N
107	1	1	ZTg0ZjFmMmZmNjhiNDc5MDY3Nzg5OTYzYmNkYmE0N2Q1MzhlYmY0NjYzMGUzYjdjOTlhM2Y3NTUwNzQ5YTBhMg	1499846977	\N
108	1	1	YTU1NWU5NzJhOGQwZjM1MmU0MGYyMTg4ZTliNTJkODhiYmFlNTQ5MTE1OGYyOWE0NTYzMzEzMzFkZjAwMWFmMw	1500368123	\N
109	1	1	MGYyYWY5NWVmNTYwZGVhOWM3M2VhMjJkZjFmYjA0YTFjZWRjODA4OWRhYTM4YjY1OTlkMWE2MmYyNDdmMDc0ZA	1500538973	\N
111	1	1	M2RmMzE2NmE5MTJkMzZjOWJmYjQ4OWQ1Zjg0ODY1OWUzNzY1ODIwZThiZjliMmY0ZmE4YmQ3NTM5YjIyYjY0OQ	1500992111	\N
110	1	1	OWMxZDYxYzkwOWVjYTFiNDg0ZjBlZDQyZGYxZmRmYzQ0Y2NmMzg0MGU4ODMyODQ1ZjE5MGY2OGM3MDc3ZDgyYg	1500992111	\N
112	1	1	NGI2Yjc3NDY0M2EyMjNlN2IwNGE5ZjFhYjRhZTIyYTI3MmIyZTZjZWU3M2ZhZmNjZTU2ZTQ5ZDg5YjY0NDU0Mg	1501059202	\N
113	1	1	MjE3ODhhOTA0MmFiZjllOGE5NDZhYjNkOTljZDJkNTczODYxODc0NTZiNGFhODRjZGMyYWU0NDM3OTZhNmQ5Mw	1501059206	\N
114	1	1	ZDQyYzJkM2M3ZTcxYjgwMTk2ZGUxNTRjOThjYmIwNzFiNzBkNjVmYzhlODMwNDQxNzgwNmQ1NWM3NDMxNWRlYg	1501065189	\N
115	1	1	OWMwZTA2Njc0YjQ4ZGQzOTZlOTI0Mjc4NjJmMDM2MGE4OGQ0ZDIwNTAyYzVkMDQ1NTI2NTc0MjQ4YjA4NzI3Yg	1501065193	\N
116	1	1	OTQ4YTI0NzVjM2I3MDI3YjJhNWE1MjMzN2U5ZDNkN2RhNjk3NjIyY2RjZjQ2MzQzMzllNjQ2YTZkYmJiYjQ4Yw	1501162649	\N
117	1	1	YWE5ODdjNzk3NzBmOTZiNWNhOGJmOWYzM2VlOTU4ZjkwZDBkNWJhOWE5Mzk5MjUwNzY3Mzg5OWNmZjExNjRiYg	1501253375	\N
118	1	1	NjFmZmJjNmM2MzRhZDhjN2E3NGQyMmVlMjAwMzQ5MjEzYTAwNzhhM2Q0ZDM4ODFjMTdkMmE5MjgyMTAzZjQ2Zg	1501577241	\N
119	1	1	NjA2MTk2YmNlYjdhMTczZGQ1ZTc2YWJmNmYzZWNkMTVmMjg1ZGYxNDRmMWJiMGUzMDhhOWYwMjI4ZmVkMzRmMg	1501747694	\N
120	1	1	NmExMWYwY2RkZGU5YzA0ZGUwNWE5ZDcyNjYzMWY3YTQ2N2Y3NjNmYjUzZWM5M2IzZWY0MDY2MjBhYjZiYWEyOQ	1501747699	\N
121	1	1	M2Q5ZDQzYWJjZGNjNzNiMjY1MzkwMjZkZTEyYjE5OWQyZmM5ZWIwOGRhMjVhZjkxOWQ5ZGJhOWQzNTA5ODliNw	1501752530	\N
122	1	1	ODU0NzJmYjZkYTE3ODM0ZTc0NmI5ZDQxZDE2N2JhMWE5MjY1MGQxMGZiMWQxN2UyYTliNWY2ZjkzZGZjNGUwYw	1502982458	\N
123	1	1	MDg5M2Y2OTZhNzhkNjM5ODgxMjQ4NzE4Y2U3NzBkNGIwZjUyMTc5NzRkZDUyYzY2MTdmN2Q1MmY2YWVlNjI2Mg	1504599881	\N
124	1	1	MjVjNDU3Yzk5NzU2OGFhYmVlZDY5OTNiMzVhNTk3ZGRjMTNkMDExOWFmMDI3N2NhZDVhZDU2YzU3MDQxZjVmNw	1504599887	\N
125	1	1	OTE1MDBkZjgwZWQ0MjhlMzY4NWZmZmViZDk4Yjc1NDNjMGQ0MzZkNjhhZTIxMzEzZjY0NTYzOTYzZGJlZmQ0Nw	1504605142	\N
126	1	1	MWI3ZjY2YTc3YmRkZjRhNmZmNmQ3OGNhZWRjYjE3MjA2Yjc5NWZkMzcyODZkZTAwN2M5NjM3ZmZlMjRjMDlhNw	1504605146	\N
\.


--
-- TOC entry 2685 (class 0 OID 0)
-- Dependencies: 178
-- Name: core_oauth_server_access_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('core_oauth_server_access_token_id_seq', 126, true);


--
-- TOC entry 2625 (class 0 OID 77741)
-- Dependencies: 211
-- Data for Name: core_oauth_server_auth_code; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY core_oauth_server_auth_code (id, client_id, user_id, token, redirect_uri, expires_at, scope) FROM stdin;
\.


--
-- TOC entry 2686 (class 0 OID 0)
-- Dependencies: 181
-- Name: core_oauth_server_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('core_oauth_server_auth_code_id_seq', 1, false);


--
-- TOC entry 2623 (class 0 OID 77721)
-- Dependencies: 209
-- Data for Name: core_oauth_server_client; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY core_oauth_server_client (id, random_id, redirect_uris, secret, allowed_grant_types) FROM stdin;
1	l6wdkbi02b4oss4c0484k4c8ssso4coc8w0ookgc4scskcw8c	a:0:{}	h5dmbjzwopskcs4wogswsco8ggwc4oogw4sco0g8gscwk84kw	a:1:{i:0;s:8:"password";}
\.


--
-- TOC entry 2687 (class 0 OID 0)
-- Dependencies: 179
-- Name: core_oauth_server_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('core_oauth_server_client_id_seq', 1, true);


--
-- TOC entry 2624 (class 0 OID 77729)
-- Dependencies: 210
-- Data for Name: core_oauth_server_refresh_token; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY core_oauth_server_refresh_token (id, client_id, user_id, token, expires_at, scope) FROM stdin;
1	1	2	ZWQ5Mzg5MjQ0ZGJlZGExNjYwOWMzOGMwY2NlNzBkMWM1YzM2ODFlN2JhMGU5MDJlMjliYmU2OGIxM2ZkZDA0NQ	1481619421	\N
2	1	1	OTA4ZWUyZjc5MTVlNWRmZjBhMTM5NzI3MzI0ZjZkOGU0NzFlZWFmMGQ1YWI3OTVhNzBiMWZlZjUyYzA3YmYzMA	1481620516	\N
3	1	1	MTczZjdiZGI4ZTIyMTM5OTVlZTNlNDRhYjQ4YWQxYjQ5ZDY4YjcxZjIwNjVkMjRmYmIyNjI0OWI3ZDY3NTQxYg	1481621814	\N
4	1	2	ZGRlOGVhMGUxNTIzZWJmYmQwMmE4NGNmZjA3M2IwNWUzZmU4NjI0ZTIwNDdlNzAzNjZlMTU3YTMyMmY3Y2U1Nw	1481621882	\N
5	1	3	NjNlNDQxMTlkODVjYWNlZTY5Y2VjNmJkYzg0Njc1YTFhNmYxMDg4Y2Y4NDE2Y2FkN2RjNmFlNDMyMmM3MTY2Ng	1481621952	\N
6	1	1	OGJkYzcyYmY3N2FjNDRhMmE4Yzg5NDcxNjY0ZDBhZWVmOTRjNGQ0ZTQ3MGU3MDRhMDEzMmViZWUxZWUzMGUzNw	1481645035	\N
7	1	1	ZjM0MzAxYzE5MzNkOTE4ZGY0MThmMzQzMDNiN2EyZjM3NWRmYmM3ZWQzOGRhNmMxZDFiMjEyY2NhMmM5MjI3OQ	1483442204	\N
8	1	1	OGZmNDczYzE5MTBiOTlhOWVlYzBlNjdiN2UxMTIzYTgzZTFjZDUxOTY4MzMzODZmOTM4Y2JmM2Q2ZGFmY2U3MA	1483442364	\N
9	1	1	OTUxODVkY2U2MGVhOTYwY2E1ODk2MTQ5NDIyYTdmNTQwM2Y2ZDBhMTRmYjliODZiODI4NTFmNzhiMzA1YjBiNg	1483442424	\N
10	1	1	YTQzODA1MDAzZWY2MGQ3MWM2YjA1N2E1YWE4NTU4MDk4MmU3MjkyZmJmMzVkMGMyYzBjZWJiYTk5ZTc1NjdkYw	1483442918	\N
11	1	4	ZTc2MjQ2OGFhZDIwY2I2NGJiNzcyMWVjM2VhYzBjMGYwMzNiNDgxYTk0Y2YwNzJlOGJmYWE4ZDU5ZjczMzMzYg	1483443028	\N
12	1	4	YTA4NDc3OGUwY2VlNzVlOTJlMzVmOTY0NjhkZWMzY2MzYjBkZmM4N2ZiNDQ5Y2Q2ZDE3M2VkMmMyYWI5ZDc1ZA	1483452541	\N
13	1	1	MjdkYzA4ZDQxYmMzODIyNTc1NTZlNDlhODYzNTgwNTg0ZTVmMGRlYTRjYzVmNTRlN2IwNTI4OWZkNWEzYTVhZA	1483457652	\N
14	1	4	YTczNTQyZDEwYWM2ZjNjMDgxM2FlYjUzNjM3NTQ4NDc1NDY5YjBmZTMyZTczNWY1NDc5Nzg3YzhiYTM0YWM1MA	1483461891	\N
15	1	1	ZGMxN2ZlNjBmMzcyM2I2ZjE1MTExMWIxNDlkYjIxNzdiYmU2ZDU0NmFjZDhjOTBmY2U1ODU4NjliZjllZjA4MA	1484664670	\N
16	1	1	ZWNjOGNkYjc1ZDc5ODA5NzgwM2RmZTUxOGJlY2NhM2M4YmZkMmNkZmZiMjNhNmUwOWNiMjdjNzY2ODQwZTA3ZQ	1484825503	\N
17	1	1	NjM0OTEyOGYzYzUwMTc5NzFjZmI2ZjE2MGUzYTNhNDA2ZDFmZmQyYzU2YjY3NjgyMTQwNmM2M2RhYzJmN2UyZA	1484911774	\N
18	1	1	Mzg5ZTMwOTVlOGFkOWY1YWJmMmY5ZGI3YzAzYzA4YWM3MWJjZWQ4OGFiNTQyY2NmOGNhYTQ0NjIxNzcyN2I0Yg	1485516686	\N
19	1	1	ZGMwM2I0NGRlZjM4MzQzM2U0NTQ4OTQyZDJkODI2OWI1ZTU4NmNlNWU1YTIwZGI5ZjJiNTk1NTkyYmMxZTZmOQ	1485533174	\N
20	1	1	ZWFjYTA5OTFkZTZiZGYyZmJlMDMzOGY4OTQzN2E0M2Y3NDJkNTUzYzRiYTFiZWJhYmZlNzhlNmRkMzg5YWVlOA	1485766579	\N
21	1	1	ZGYzMzNkNzI5NzJiNTZhYWQwMmM1ZTg5MTNlNWEzNmFlYTczNTJhOWM5MTJkM2YyZDcxZGJlNWM5ZWVmZTFjNw	1486033158	\N
22	1	1	OTA0ODMzNjNjNjQ4ZTUzMzYxMmJlMTRjY2JhZWEzNmIxMTY3N2ZjMjdkYzAyYjdlNGUxNGRhOTcxZmE4YzExZA	1486396547	\N
23	1	1	ZDk1MjdkMmZjMjAzYzc2YjU3N2RkNmZmMmMyYTZiMjc2NWI1MWViNmNkNzE2MzU0OWE0OGI1MmI3NTkwYjU2Nw	1487146565	\N
24	1	1	Y2E5OWY2M2U5NThlNmM3MWQ3MGUyZDVhODNjZWExMTAxNDE4NGJkZDVmNThiNjdjMzcyZDg3MDc4ODdiOTQzOA	1487164255	\N
25	1	1	MzlmZDI4MGY0ZGE3ZTJkYWFjMWQ5MTRkNDY5NGU5MGNjNzdmMzRjOGFjNzkzOWQyNzk5OWM5Mjg1YjVhNDIwMA	1487754851	\N
26	1	1	NzgwM2UyMjEyMGJkZDRkM2UyZGUzYmViYjFhNTRiYWEzNTRiNjMyZjJkYTc1NzJkYjBiMTQzODM5OGE1MDZiMQ	1487761047	\N
27	1	1	Y2QwYjZiY2UxZTQ3ODA0ZDVlZDNmMjYxM2ZlZDExMTViYzAxNTY3ZjYwZjE2M2FlMDE2NWMyMWY2MWQ5NWZiMw	1488206416	\N
28	1	1	NjlkMTA0MTRmZDg1N2EyMWEyMTE0YmJlZDg5MjliZGViNDM0YWVlMzVjNzc4NTM1NGUwYzllYmI4NDg4NTQyMA	1488207534	\N
29	1	1	ZDIyNDk5NWQ3MDlhY2JkMDNkNmM1MWJmMTg4YWVhMzI3MDRmODc0OTdlZWViOTIyNjAyNmFiMTQ5NzBkMmZhZg	1488272597	\N
30	1	1	MGE2NzlhMDhjOGM2MzIyOTFjNTdlN2Q2MWUzZWRiNTkzNGQ5ZjhlYTM3ZDk0YzAwNzdjMzA0OWQ0MTQzNzRlMg	1488903916	\N
31	1	1	MjYxMDIwMDU0YjAwNmIwNzgzOTE5OGI0MjI1MTE0Y2I4NDBlOWQ1YWEyMTlhZWVkZWNiNDI3OWNkYmZkY2I1ZQ	1489059165	\N
32	1	1	NTNlZDhmZGM2M2M1ZWVkMjEwYTk1OGMzNWJhMjg4NjZmY2I3NzYyMmJmYmMyNWI2MzRjNzQyOTBkYjI1ZTZiNA	1489158482	\N
33	1	1	ZDNlNmQ1NmNlNmFjZjAzYjNiMDI5YTkyM2VjNWZjNjAxNTdjN2U2NmMwNWRkNWQyOWIzMmFjNGNjMjViZTI0Nw	1489327440	\N
34	1	1	YzE4OGI4YTU1MWM0MTIwMWRhMDllMjg3MGQ1MWE1YTIxZTMyNWNhNDBlMGMzNTk3M2EwZTcyMWRiMjk3OWQ4Ng	1489399269	\N
35	1	1	YjllYTkzOTRiMmFmMjJhYjkxMDY3ZWMzNjEzOTZjMzAxYTdkYzBhMmU0OGQwODNlNTY3ZTMyZTQ5MDQyYTM5Ng	1489847205	\N
36	1	1	MWY5MTE5NzdlMWZjZjljMTAyYmEyMGRmOGNhZTU2NThmYjA5MmFmOTY5YjM5M2UzM2JkOTdiMDM2YzliNzcxMg	1490113888	\N
37	1	1	ZGUxNzkxZGVkYTljMDRjNGZjMzA4ZjIzZmRhMjRmMTFmZWZiOTkzMzMwNTRjZDg1ZDRkNWE3MWIxOTc3OWVhOA	1490169754	\N
38	1	1	ZjRhYzFlMDM3YmVmMmEzZDgzZDYyOWUzZTIyNjNkYTg3Y2RiYTRkNTdhNjRmM2QxMzA4YzllZTBhZDBhMDczNA	1490173472	\N
39	1	1	NTRhNDQwZGE4YTk3ZTg3ZDU2OWUyNWJjM2E4ZWZiMjY1YjdiOWE2NjA5YTUwOTAzMTJmNTA2M2FiMmMyMTk2ZA	1490187762	\N
40	1	1	M2M3NjFjMzdkMGJlMjMxNDdjNDYwOTc1MWFiMjVlMzNmNWMxODIwN2VhYjcxYjZmYjc5OWI2M2Q2ZGI2MmY1OQ	1490191555	\N
41	1	1	OWVlMDQ3ZWU0MWMzZDZmNmZlZTlkZWNmMjUyNTE0ZjdjMWVhMDI3ZjQ0OTUzZGVhZTdlMGVkNmNlMWQ0NzcyMw	1490257830	\N
42	1	1	Njk3ZDAyZDdhNGQxYTgwMzM3MWFkNTA0NjRkMDk3ZmI5N2IyYWQzMDNmYWVkMDEzOTNmODc2NTJhNjZjMjNjOQ	1490280314	\N
43	1	1	MmFiNjMxY2JhNDY1M2Y3NDI5NDI0Mjc1NTY4M2M0YWU1NTAzNjYyYjEyODNjN2ZkYmRkNjU3OWY5NjcwMjBjMw	1490612920	\N
44	1	1	YTM1YTc5YzZkY2I0OTMyNzhlMjM5OWRjMmQ0YzlmNDdhMTE2ZGJkNGYxZjAzZmEwNmNkZmMzODE0Mjg3ZjA2Yg	1490716501	\N
45	1	1	MmI0NjRiOTM0MDlmMTI4MTg2OTZiNTY2NGY3NmYzZThlYjEyYzc0NjY3NzhiZTI3Nzg0OTVmZWFjOTM0NzA0OA	1490800676	\N
46	1	1	OThkZGQ2MTcyMDkzNWU0MjAzYjYxMTZjYzNjMTQzMDg1NDhhZTJiN2M1NmNiNTUyOTliNTc4OTA3OWFjMTFhYg	1490949446	\N
47	1	1	NmFlMTM3ZTI2MTAyMWM5YjcyMzRlYWE3NTQwOTM3MjEyYzFjZmY2NDJhOTkzM2YzZWFiN2NjY2NmNmRkYTlhNw	1490954334	\N
48	1	1	Y2RjYmYzNjE4NmY5YmUwYjM4Nzc2MmQxNjg2NjdmZDk0MTI3ZDYxZTNjYTI3N2Q0ZjBhYWI5NWI5ZjIxNzk1NA	1490957750	\N
49	1	1	ZTEwMzBmZjg1Mjc3NjkyNGQzZjBmZmZiNzljNTFiMmNhNDUxZmRlN2M5MzFjNjVlNjdkZGU5NDkzN2QzN2Q5ZA	1490957962	\N
50	1	1	NWYxNTkyNmM2ODk0MWQ5YmQyNjg2OGI1ZmJkODg5Nzc3NjllNTVmOWVmN2ZhZjdlMWFmYmU3MTBjY2Y4MTdkOQ	1490960459	\N
51	1	1	ZDAxMzNmY2RhN2U4YjZjYTJkNDdiMWVjYWIzYjlmMGY5ZThiNTA2ZDFiNmI5YmZiN2U5OTk0NTRlMmNjMzc3Nw	1491212991	\N
52	1	1	MTBiM2UyZTEyZGZjYmQ2MmU5NGRhZDE3ZWZhOTE4ZWJhMjllNTdiZWY3NmI2ZTczYWNjYjg5YzA4ZjYyYmQzZg	1491417328	\N
53	1	1	MWQzODI5MzhkZDE0NzJiMDZkZGY1MzJkNTAxODk1NDlmMjFiNDAyNTg2NTZiMWI4NzNjNzQxZWJiYThkNzdjZA	1491558864	\N
54	1	1	MzNjOGU0MGEzNjM4YjEzZTFjNjdjOGRmMWYxZTBjMGU4ZTljZmY0NzBiMmQxMmQ5NDQ3MjA3ZmU2ZGI4ZjRkMQ	1491563843	\N
55	1	1	ZjgzY2YxYjczYTdjMjNjM2ExNmZiMzIyNWU5YzIzN2E3ZjFlOTA1YTIxNjYwNzc4YmZiOGFlOTNmOTBlZTViNg	1491582931	\N
56	1	1	YTgwMGQ3NzNiOTE4NGY4ODFiZjA3MmZkNWY2NDU0ZjkxNjllMzFhOWM3ZjVhYTE0YzU0NDcxZmQxNWI1ZmVlOQ	1491898384	\N
57	1	1	Y2U1ZTc5OWYzZjkyZTM4MTRiOGQ3ODQ1YjBiOWRjY2JjOWNjN2IxYzg5NzAxZTI3YjQ1ZjFmNjJhNDNhMGI0MQ	1491926094	\N
58	1	1	OGNkZjI5YTI5OWRjNDI4YTE1ZWE1NTNkNjcwYjE1NTg0Y2Q2NGJjODE2YjViZmU2ZjJmOTI5M2M2OGY2NzBlMA	1492017729	\N
59	1	1	YjYxMDExMzNjYjJjMzZjY2YxYzgyNjVmNGFiNjIwZmY3ZWRiM2VkNjVhMzBhNThjYzkwZjJiOWY4YjRhYWI1ZA	1492530419	\N
60	1	1	ZTc1MmI2NDkxZGMyMGIwZjg3OTJlYzQyNGUzOGRkN2JjMzhjOTMwZmJiZDk4YWRkZWY5MmMzNWJhZTliY2JmZQ	1492703152	\N
61	1	1	M2ZhMTM5NDI0NGY2YjQ3ZTg5NTNhOGQ1OTM3NWQ3ZmZmZjM2ZDM0NWJmYTAwNjU4MjU1OTY5NzEwYjZmNjJiZQ	1493280719	\N
62	1	1	YzZkYmJkYmE5OWUwZWZhYmYyN2U1ODQ2ZWFkNDRmYThjNWRiMzkxNGRlZTQxN2E3ZjE4YWFjNzIxZGIzZjhhMw	1493717399	\N
63	1	1	MjU0M2M0NTk4OWU4NDMyYmIwMGQzMGEzMjM0NGU0NzYzZDk4YWQ1NWI3MGZjMWIxNDNkM2M0NWZkNGFkYTJjNQ	1493739678	\N
64	1	1	ZDMxYjE5N2E1N2E0YzQxMTZjYzA5NWY0MDBjZTM4Yzg1MTI3YmJiN2Y1MDc5YzIyZTM1MzlkODM1YWIyNGI3MA	1493750446	\N
65	1	1	ODc3MWVhMTIwZTgyNzZkZTBkZWZkNjk1Y2VhYWM1Nzk3MzIyZDRiNTRjYTc1Yjk5NWMwN2JkYTczMTAwMzhmZQ	1493828324	\N
66	1	1	OWZlM2U4ZjYwNWI2NjgyMjljNzJlYTI5NWY1Nzk0NWE2YTdmYWFiNGE0NmJlODg4MWUwNWI0NWQzMmNkYjFhYQ	1493914516	\N
67	1	1	NDIxM2JlMjM3Zjg3M2VlYjE3MjkxOTU5OTAyNzFlMWE1MjgzNmE5YmVlMmQ4MjUwNzJlNjFiYTczZGIyMDM3NQ	1494251048	\N
68	1	1	NjFiNzFmNmRkMzRmMThiNzQzZjQ4MjAyYjBiMjlmNmVjNmRkZmRjNzgzMGZkNWI1NWM4MGRjNTZkNjQwZTk4MA	1494257340	\N
69	1	1	YTJhOGFhZjYzZjJkOWU4NzgwYjE1ZmNlMDYxNzM1ZDA1Mjk3Y2I4MDc1NmI1N2YyN2FlZmRkZTU1OGFlZDQ3MQ	1494337483	\N
70	1	1	ZDg5MGU1ZmIwNTc1OWRiMWNiZjk3MGE2YTg4ZTRjNzQzNDJjNWNmZTY3YjZiNWRiMTA5NTg1NGQ2MTkxNmU4OA	1494337484	\N
71	1	1	NWViZWQ2NzlkZGQ0Y2IxZjk3MmEyNWI5NjljMzk3NzE1NTZkZGRiYTUzOTMzNjAxZDNiODVlZWU1NDc0MGU2Nw	1494344706	\N
72	1	1	YzUzNDY5MDBmZTYyYzJjOTFhMTdmMWUyYWY3NjVkNDRkMWY1ZjE5YTkwNTZiMjgzMjFhODNlZDlkZmY5M2FjNQ	1494408482	\N
73	1	1	YjdjMTQzYjZlNjRjMGZlZjQyYzA5MzhkMDdhOTljOTAyNDVjMDk2YTEzMWJmYTkzM2FkYWJiODU1ODNlMmU1Yg	1494584147	\N
74	1	1	MGNiMDRhZjIxNTA1MTI5Mzc4MDQ1NmZlZGI2NGRkZjI2OWMwOTdjOTUzZDIyZGZiYmU5MDVhYzg2NjViZGNmNg	1494593537	\N
75	1	1	MzI5ZmQzN2YxMmRlNTY4YWI1NDkxMmE1MDY4NzdkNzlhMDNkM2M3ODNkNjFhOGNkZTc5NTcxYTVhZGE0YmRmNQ	1495535501	\N
76	1	1	Njk5MDc1ZWMyNWZkNmY3NGM3OTAwYTdmN2I1NWZjMmRhOWVmZTQxMWFiZjdjNzIwNGIzZjY5MzJkNzRhN2JjMQ	1495705713	\N
77	1	1	NmVhNGNiOTUxZjQyMTExZGI5MGVkZDgyOGVkZGY5Yzk5ZjVkYTdhOTViZTc3YzA5NmYzYWU0MWJjZmNhYzk1Yw	1495727637	\N
78	1	1	ZmJmZDAzYzY2MTE1ZDBhOTYwYTJlNjI3YjlkYjRmMzljNTk0YzA1OTAyMTM2MWI0YjIzMjVjNmVlMzQ4Y2Y5MA	1496051571	\N
79	1	1	YzBlOWE3YmMyZjQ1NWQ2Nzc2YjNmYTUzZTcyNTQ5NjNiNDUwZjlmZmZhMWEwYjQ4OGUyNDllNTllYTk0YWVkYg	1496053345	\N
80	1	1	OTFiZWZjY2I3MzI2ZjI0MDIwYjQzYTk0OTE4MGYyODY3MmZhN2E0MjA5MzgyM2M0OTllY2NjN2IyMjdkNjc1YQ	1496054659	\N
81	1	1	NDZmZjgxN2UxYmQ0YzYzMjI5MTI2Y2E2YWVhNTg4MzNiZjBhNjdjMjAwMzUzNDc0OTlmOTYyYWFkYmQyOThhMA	1496055157	\N
82	1	1	M2Q2MjYwYzRiMzczYjFlYTQ4YmRmZDg5NmY3N2IwNjRjN2M1MmYwNjJkZjI5Yzg1NTIzZTRhZjZmMjA3Zjc4Yg	1496055343	\N
83	1	6	ZmIzOGY4OGUzOTUwMWRkOTIxNmM4M2Y3ZjZhOGY0ZWZjOTM3ZWE4MzIxN2I3MGM4NTkwYTlmZWE2Y2VhMGYyMA	1496072085	\N
84	1	1	MGY1N2E1YmQ0ZWRmZGE4OTYyODRkZDQxYmVhZThkNzkyOTJiYzYzN2Q4OTk5NGMxYmE5Njc3OWQyMWZkMGI2Ng	1496072451	\N
85	1	1	NGFjZThiNWE3NjJiZDJiNzM4MDQ2NDI3NDFkZTYxZTRiOWVlZDBmMWY5YWQ5Y2MyYjc5ODc2MzhkMDlhMjQ0Mg	1496146393	\N
86	1	1	YjAxYjA3MGNiZTBkNzExMTFhMDBmYmEzYjViZTk0NWY2Zjg1MTYzYzE5NGZhMmZhYTEwZmE2NmI5YWU2NmNiMw	1496323457	\N
87	1	1	YTQ0ZWJkZjQ0ZWY1MDEzYTU4MTkxODEwNjZmYjUxNGJjMWY2MTUxMDlmMzY2Y2M3OTZiYmE1YmRiYTEwYjE4Yg	1497359848	\N
88	1	10	MThmYTBhYjI2NTg0ZDA5ZTllMmVhODVkZjJmNjhiMWM1MDAyZjQ4ZWZkYzUzMTljZTIwNGMyYjU3ZGI4YzU4YQ	1497598848	\N
89	1	1	ZTVkMDU1OTIwZTM4ZjQ5MzhlYmYyM2FiNDc0NjY1YjliYWJjMTdjMGY0NjRjOGE3ODc4ODk4ZDFhYTNkMTQzZQ	1497964713	\N
90	1	1	NjdiYWY5ODEwMWY5MzQzODJiOWUxZDllNTAxNDk3MDgyZGY1OTI0MjRiMzc2N2VmMTE0YmI0OWY0ODMwM2ViNQ	1497965698	\N
91	1	1	OTcxYTI4OTYyNDBhOTNkNDgxZjI1M2Q2MTEyZDQ3YWJmMTg4ZGQ4Y2IxNjhkN2JjMjQxOTJhMDhiNmUzYjYzMw	1498469011	\N
92	1	1	YzViMWI0NDI2MjcyNGIyYzA2ZWJjNDBiYzJmYWQyNWNiMmQxZGFkYjI1YmQwNzBmYWViOWM4OTQxY2E1Y2Q5ZQ	1498473314	\N
93	1	1	YjhlMGFmOTE3YTNjODhiNDhhMmQ4ZjdiZDM4ZThjZmIyYWEyZThiNTY5YzQyZTFkMzcwMzRlNTkwNTcwZTlhYQ	1498483477	\N
94	1	1	MzY4YjEwZTk1NDFhYmVjNjdmOWRjODFhZmQ1YTkxZTM4ZDkzODlhZGY4ZTAyODE0NDQyNzdkZDQzNjQ3N2FjMA	1498553191	\N
95	1	1	NWVjMzJkOWExYzZmYzE0YWU2ZWNhYTI5MWYyMDExY2U1YWEyMGIyNTUyYjg1ZThhZWVmZmU1YmM5NTM0YzUwNw	1498640427	\N
96	1	1	ZDVkYjlkZThjNWUyOWI0MjE3MTYzMzBkYzZlMzNjMzcxOThlZjc5NDAzNjBkMDg0MGRiZmYyYzhjMzhlZDM5Mw	1499245132	\N
97	1	1	NDAwYzViOGFkNTQzNjZmOWE0MWZlNDliNzJlNGY5YTAxOGFkZjk2YjU1OTQwYjZiYjllYTYwMTk4OTZiMzEzYQ	1499422752	\N
98	1	1	NTIxNGE2MTBkNDhkNGM5NmIyM2RmOTVmM2E0MTIzYTgyMGM4MDRlNWZlZjFhYTMwNDljYzdiYTI4YWI0OTRmZA	1499674547	\N
99	1	1	MDVhOWVlZjA2ZmFkOTlhOWEyMjlhMWE1NTcwZTg3MDU1ZjljMmE2ZGM4YWM1ZTJiNWZhNjM1OWJkMTk1MDdkOQ	1499677145	\N
100	1	1	YzgwMWI0NGJjYTg5NGVhYWQxNGJjMWM1NzE0NmUwODk0OWVkOTgxYjQ4YjVlOGVkNzljOWZkNmU2NDI5MTY3Mw	1499677848	\N
101	1	1	OGQ1Nzk3N2JiNDVjYTBlMDA0NzA5N2MwNTc2OWYyNGEwODhhYWJlNjIzYWQ3OTFlYzk2OWJjZmM3MTVkYzdhYw	1499678086	\N
102	1	1	NGZmYmI1OGIyZWUyNzJmNjA1NDA4NTY1ZGU1ZGZhMGY2ZGE5ZWI0ODcwODRjZGY1OGFhOGFlYWZkMDUxZjNkMw	1499872034	\N
103	1	1	ZjNmZTlkYTRiMDE0YmI4YWM5ZTBlMmRjNmQ0YjRiYzcwOWI2MWE0OWYzYzU0OTVkODUwYTcxNTU0NDhhYmMwYQ	1499938116	\N
104	1	1	ZjViNGJlODM0YzNhM2FjNTkwNjA2M2U2ZGFmNjFhMzQyNzJkZDQ2OWUwYTZmNDNiYTJiNGUwMzZmM2RkMzNiNQ	1500280936	\N
105	1	1	ODQ0MWU4MzAwMDk5NTgzNTNkYzE0ZDY0OWQzNTAxOTdlMDc4ZWFkOTU2NWE4ZWM2YWYyODFkZDhiNmM4YzkwZQ	1500886617	\N
106	1	1	MzM1ZTJkZGMyZjI2ZmNlMDZkNmZiODcwMDQ3YWFjN2I0NjM5NjI2MjZlMGRmY2E3MGJmODU2YTI4YWI0Y2IwMw	1500886617	\N
107	1	1	ZGM3ZmViNDdiMTEzNDM5ZWM4MDVjOTM1MmVhMWZjYzJjNzIwMmQxNDcyZWQ2Njc5NTZiY2FlYWI0MTc1ZDZhMA	1501052977	\N
108	1	1	MTU4NmIwNGYyNmEwMjYwOTkwOTQ2NmFjNjhmYTRhNWQ0NTgxYjg1MTRjNjhkNTVkMmZhNTRkMGQyOTY5NGQ2ZA	1501574124	\N
109	1	1	MmVkZTMwMzQ5ZDNkZDc1M2MzMGFlMGQ5NDNjNDlkZmRkOGZmZDRkNTYxY2Q3MTVmZWE5ZWE5ZGRmYTc1OWQ1OA	1501744973	\N
111	1	1	N2M1ZGFjNmU5ZjFiYWY3NWY3ZmMxOTRhMDFjMDQ4YmZmZjAwYzc5YWZhOTkwZDM5YTM1MDZmZjNkZjE1ZGQwYw	1502198111	\N
110	1	1	MjU1OGIxZmNhMGZiNzUxNWJhMmJmMDIzOWI5NTk4OTAyZDRhMTkwNDZlODkyYjAwZTI4ZmMxZjZlMmE2OTQ4Yw	1502198111	\N
112	1	1	NjRlMWM0NjBlZjc2ZmYzYmExOTE2MzRkNTUzYjVmOTEyNjgyODJhNjNiNDNlNDUwMjA4YjcwNzNiMWE3NGY0ZQ	1502265202	\N
113	1	1	OGM4OTgzZmY1Mjg5YzlhNDk1MTcxZmQyM2YzMGI1YzkzOGFmZThhNGRlNWQ1ZDRiMmFhNDBjMDFiZWRkZGQzMA	1502265206	\N
114	1	1	NzQyZjkxOTg1MjgzNjI2ZmEzOGUxMjc1ZDM2OTE1ODIzMTY5MjZkNmMwMmUzMGI1NGRhYzg3ZDdjNGMzYmRmNw	1502271189	\N
115	1	1	N2FjODQxMWFhYWZkOGMyZjBjMGFlNDU5ZGEzNjQ1NzIzY2E3ZTFhOWE0ZDI2NzExY2YzNWQ1NjE4NWE4NjNiNQ	1502271193	\N
116	1	1	NGEwMDIyMDE2NTI1MTQzYjY4MTdmY2U1NjUzZGM4NzU0YTcyYjcyODVjYmQ2OTFlNjUzY2UyOWIwNmMwNmEwMw	1502368649	\N
117	1	1	ZjhkM2Y5ZmRjYTZmMDgxNjdmZDI5NzM2NmRhYTUyNzBjMWIyZDBkYzZjNWEzNTQ0MWQ2YzUyNjJmNDgyODgwNQ	1502459375	\N
118	1	1	NjFmYzljMmQyNDRhM2ZhOTQxYjZkYjA3MzY5MDAwNjQyNGZjMTc5MzVkNWIwMDYxNjVjZDk5NDJlZDc4MDQ4Mw	1502783241	\N
119	1	1	NjQzOTg1ZGZhMjA5OTlkNmM4YzY0OWZmNGZkODk1MGQyZDcxZTY1OWMzZmRjNjM1Njk0ODQ4OWJhMmQyZDA5MQ	1502953694	\N
120	1	1	YjBjMzQwZjQ5ZWM1YjlhZTEzMzBmOWFjOTE0NzgzMzczNzNjYzI3ZmI2N2MxMjNmM2ZmNjE3NjM1Y2ExMmYzOA	1502953699	\N
121	1	1	NjFhOGMwZTMwN2Y4Zjg5ZjYzNzNmZDMwMmMxMjA2ODQzMTUxYzU5OTk0YzlhOGUxNmJhM2M0ZDZiY2M4N2QzMA	1502958530	\N
122	1	1	MjFlZTEyNTI4NzMwYmE3OGJiYzMwMmQ5ZTYwMTYxMjM5ZGY4MTVjMWQ5MjMxZWQ1YTkxNjJjMDgyNzBhYjM3Nw	1504188458	\N
123	1	1	MTJlNDZjNzE1OTE1YTZkMDY0YTFjZTE0NGM3OGJjYWFjYWEwNDEyM2VkZjk2MGQ3ZWU3N2RhMTMxOWE5NjU1OQ	1505805882	\N
124	1	1	MjAyMzE5OWJmOGIyNTYxYTYxNDNiYmIxYzlhZjE2ZmZkMzRjNmE1Y2NmM2NlZmQ4YzAyYjhmM2E2Yjc2MjAyMA	1505805887	\N
125	1	1	MGIyY2U4ZGFhYzNjNDlhMTVjNjZkZGQ5NDJlMGUyNmU4OTUxYzIwNjJkM2NlYTM0ZTY0MmZmYjQxMGU0Yjk1Mw	1505811142	\N
126	1	1	OTI1ZDFkY2U2ZTFhNGMwNzc4ZTkxOGVlNjRmOThjZTVjN2M5ODUzZDJiNGY0YmRhOWY3ZDcxNjI2NzkzMWZjYQ	1505811146	\N
\.


--
-- TOC entry 2688 (class 0 OID 0)
-- Dependencies: 180
-- Name: core_oauth_server_refresh_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('core_oauth_server_refresh_token_id_seq', 126, true);


--
-- TOC entry 2631 (class 0 OID 77811)
-- Dependencies: 217
-- Data for Name: core_user_company; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY core_user_company (uid, picture_id, address_id, deleted, deleted_at, created_at, updated_at, name, random_key, legal_identifier, legal_status, capital, contact_email, contact_phone, iban, social_reason, ape_code, contact_fax) FROM stdin;
2	\N	3	f	\N	2016-11-29 09:13:11	2016-11-29 09:13:12	Test	442f1fe1118c24c1cb6e47adb64f14d0	\N	\N	\N	\N	\N	\N	Test	\N	\N
1	\N	1	f	\N	2016-11-28 16:26:35	2016-12-20 12:22:43	LET'S GO	800af44bd8360fc3ea7e7696e4455648	818 946 923	SAS	2000		\N	-	Let'sGo	\N	\N
3	\N	14	f	\N	2017-05-11 11:23:30	2017-05-11 11:23:31	Class-Web	6878caef1cd5079c07652d1406ea21b1	\N	\N	\N	\N	\N	\N	Class-Web	\N	\N
4	\N	15	f	\N	2017-05-11 14:24:28	2017-05-11 14:24:29	class-web	821e211a87eaf8807539c712db48d394	\N	\N	\N	\N	\N	\N	class-web	\N	\N
5	\N	16	f	\N	2017-05-11 14:42:55	2017-05-11 14:42:56	Class-Web & Let's Go éé !	763a0bfb638d801477beed44e66512ae	\N	\N	\N	\N	\N	\N	Class-Web & Let's Go éé !	\N	\N
6	\N	17	f	\N	2017-05-15 15:07:03	2017-05-15 15:07:05	Class-Web	df7ec709c1bfd50667bf46e815cb7ce2	\N	\N	\N	\N	\N	\N	Class-Web	\N	\N
7	\N	18	f	\N	2017-05-15 17:30:40	2017-05-15 17:30:40	Class-Web	dad7b67053ea7fa4f506af8dc3ce5539	\N	\N	\N	\N	\N	\N	Class-Web	\N	\N
8	\N	19	f	\N	2017-06-02 05:49:18	2017-06-02 05:49:19	Bordil	47e53e01a5431f2aeb7b6f5c4c40eb88	\N	\N	\N	\N	\N	\N	Bordil	\N	\N
9	\N	20	f	\N	2017-06-02 11:19:31	2017-06-02 11:19:31	Bordil	31a780dbafd5c3d5023a70f09d2e6534	\N	\N	\N	\N	\N	\N	Bordil	\N	\N
\.


--
-- TOC entry 2689 (class 0 OID 0)
-- Dependencies: 185
-- Name: core_user_company_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('core_user_company_uid_seq', 9, true);


--
-- TOC entry 2626 (class 0 OID 77753)
-- Dependencies: 212
-- Data for Name: core_user_group; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY core_user_group (uid, company_uid, deleted, deleted_at, created_at, updated_at, name, admin_type, feature, roles) FROM stdin;
1	1	f	\N	2016-11-28 16:26:35	\N	group.user	f	t	a:0:{}
2	1	f	\N	2016-11-28 16:26:35	\N	group.admin	t	t	a:1:{i:0;s:10:"ROLE_ADMIN";}
3	1	f	\N	2016-11-28 16:26:36	\N	group.admin.core_user.user	t	f	a:3:{i:0;s:24:"ROLE_CORE_USER_USER_POST";i:1;s:23:"ROLE_CORE_USER_USER_PUT";i:2;s:26:"ROLE_CORE_USER_USER_DELETE";}
4	1	f	\N	2016-11-28 16:26:36	\N	group.user.core_user.user	f	f	a:2:{i:0;s:24:"ROLE_CORE_USER_USER_CGET";i:1;s:23:"ROLE_CORE_USER_USER_GET";}
5	1	f	\N	2016-11-28 16:26:36	\N	group.user.core_user.company	f	f	a:1:{i:0;s:26:"ROLE_CORE_USER_COMPANY_GET";}
6	1	f	\N	2016-11-28 16:26:36	\N	group.admin.core_user.company	t	f	a:1:{i:0;s:26:"ROLE_CORE_USER_COMPANY_PUT";}
7	1	f	\N	2016-11-28 16:26:36	\N	group.user.core_customer.address	f	f	a:2:{i:0;s:30:"ROLE_CORE_CUSTOMER_ADDRESS_GET";i:1;s:31:"ROLE_CORE_CUSTOMER_ADDRESS_CGET";}
8	1	f	\N	2016-11-28 16:26:36	\N	group.admin.core_customer.address	t	f	a:3:{i:0;s:31:"ROLE_CORE_CUSTOMER_ADDRESS_POST";i:1;s:30:"ROLE_CORE_CUSTOMER_ADDRESS_PUT";i:2;s:33:"ROLE_CORE_CUSTOMER_ADDRESS_DELETE";}
9	1	f	\N	2016-11-28 16:26:36	\N	group.user.core_customer.contact	f	f	a:2:{i:0;s:30:"ROLE_CORE_CUSTOMER_CONTACT_GET";i:1;s:31:"ROLE_CORE_CUSTOMER_CONTACT_CGET";}
10	1	f	\N	2016-11-28 16:26:36	\N	group.admin.core_customer.contact	t	f	a:3:{i:0;s:31:"ROLE_CORE_CUSTOMER_CONTACT_POST";i:1;s:30:"ROLE_CORE_CUSTOMER_CONTACT_PUT";i:2;s:33:"ROLE_CORE_CUSTOMER_CONTACT_DELETE";}
11	1	f	\N	2016-11-28 16:26:36	\N	group.user.core_customer.customerdemand	f	f	a:2:{i:0;s:37:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_GET";i:1;s:38:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_CGET";}
12	1	f	\N	2016-11-28 16:26:36	\N	group.admin.core_customer.customerdemand	t	f	a:3:{i:0;s:38:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_POST";i:1;s:37:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_PUT";i:2;s:40:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_DELETE";}
13	1	f	\N	2016-11-28 16:26:36	\N	group.user.core_customer.customerdemandmessage	f	f	a:2:{i:0;s:44:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_GET";i:1;s:45:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_CGET";}
14	1	f	\N	2016-11-28 16:26:36	\N	group.admin.core_customer.customerdemandmessage	t	f	a:3:{i:0;s:45:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_POST";i:1;s:44:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_PUT";i:2;s:47:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_DELETE";}
15	1	f	\N	2016-11-28 16:26:36	\N	group.user.core_customer.firm	f	f	a:2:{i:0;s:27:"ROLE_CORE_CUSTOMER_FIRM_GET";i:1;s:28:"ROLE_CORE_CUSTOMER_FIRM_CGET";}
16	1	f	\N	2016-11-28 16:26:36	\N	group.admin.core_customer.firm	t	f	a:3:{i:0;s:28:"ROLE_CORE_CUSTOMER_FIRM_POST";i:1;s:27:"ROLE_CORE_CUSTOMER_FIRM_PUT";i:2;s:30:"ROLE_CORE_CUSTOMER_FIRM_DELETE";}
17	1	f	\N	2016-11-28 16:26:36	\N	group.user.utils_utils.tag	f	f	a:2:{i:0;s:25:"ROLE_UTILS_UTILS_TAG_CGET";i:1;s:24:"ROLE_UTILS_UTILS_TAG_GET";}
18	1	f	\N	2016-11-28 16:26:36	\N	group.admin.utils_utils.tag	t	f	a:3:{i:0;s:25:"ROLE_UTILS_UTILS_TAG_POST";i:1;s:24:"ROLE_UTILS_UTILS_TAG_PUT";i:2;s:27:"ROLE_UTILS_UTILS_TAG_DELETE";}
19	1	f	\N	2016-11-28 16:26:36	\N	group.user.crm_bill.product_type	f	f	a:2:{i:0;s:30:"ROLE_CRM_BILL_PRODUCT_TYPE_GET";i:1;s:31:"ROLE_CRM_BILL_PRODUCT_TYPE_CGET";}
20	1	f	\N	2016-11-28 16:26:36	\N	group.admin.crm_bill.product_type	t	f	a:3:{i:0;s:31:"ROLE_CRM_BILL_PRODUCT_TYPE_POST";i:1;s:30:"ROLE_CRM_BILL_PRODUCT_TYPE_PUT";i:2;s:33:"ROLE_CRM_BILL_PRODUCT_TYPE_DELETE";}
21	1	f	\N	2016-11-28 16:26:36	\N	group.user.crm_bill.product	f	f	a:2:{i:0;s:25:"ROLE_CRM_BILL_PRODUCT_GET";i:1;s:26:"ROLE_CRM_BILL_PRODUCT_CGET";}
22	1	f	\N	2016-11-28 16:26:36	\N	group.admin.crm_bill.product	t	f	a:3:{i:0;s:26:"ROLE_CRM_BILL_PRODUCT_POST";i:1;s:25:"ROLE_CRM_BILL_PRODUCT_PUT";i:2;s:28:"ROLE_CRM_BILL_PRODUCT_DELETE";}
23	1	f	\N	2016-11-28 16:26:36	\N	group.user.crm_bill.quote	f	f	a:2:{i:0;s:23:"ROLE_CRM_BILL_QUOTE_GET";i:1;s:24:"ROLE_CRM_BILL_QUOTE_CGET";}
24	1	f	\N	2016-11-28 16:26:36	\N	group.admin.crm_bill.quote	t	f	a:3:{i:0;s:24:"ROLE_CRM_BILL_QUOTE_POST";i:1;s:23:"ROLE_CRM_BILL_QUOTE_PUT";i:2;s:26:"ROLE_CRM_BILL_QUOTE_DELETE";}
25	1	f	\N	2016-11-28 16:26:36	\N	group.user.crm_bill.bill	f	f	a:2:{i:0;s:22:"ROLE_CRM_BILL_BILL_GET";i:1;s:23:"ROLE_CRM_BILL_BILL_CGET";}
26	1	f	\N	2016-11-28 16:26:36	\N	group.admin.crm_bill.bill	t	f	a:3:{i:0;s:23:"ROLE_CRM_BILL_BILL_POST";i:1;s:22:"ROLE_CRM_BILL_BILL_PUT";i:2;s:25:"ROLE_CRM_BILL_BILL_DELETE";}
27	1	f	\N	2016-11-28 16:26:36	\N	group.user.crm_bill.config	f	f	a:2:{i:0;s:24:"ROLE_CRM_BILL_CONFIG_GET";i:1;s:25:"ROLE_CRM_BILL_CONFIG_CGET";}
28	1	f	\N	2016-11-28 16:26:36	\N	group.admin.crm_bill.config	t	f	a:3:{i:0;s:25:"ROLE_CRM_BILL_CONFIG_POST";i:1;s:24:"ROLE_CRM_BILL_CONFIG_PUT";i:2;s:27:"ROLE_CRM_BILL_CONFIG_DELETE";}
29	1	f	\N	2016-11-28 16:26:36	\N	group.user.crm_hr.cv	f	f	a:2:{i:0;s:19:"ROLE_CRM_HR_CV_CGET";i:1;s:18:"ROLE_CRM_HR_CV_GET";}
30	1	f	\N	2016-11-28 16:26:36	\N	group.admin.crm_hr.cv	t	f	a:3:{i:0;s:19:"ROLE_CRM_HR_CV_POST";i:1;s:18:"ROLE_CRM_HR_CV_PUT";i:2;s:21:"ROLE_CRM_HR_CV_DELETE";}
31	2	f	\N	2016-11-29 09:13:14	\N	group.user	f	t	a:0:{}
32	2	f	\N	2016-11-29 09:13:14	\N	group.admin	t	t	a:1:{i:0;s:10:"ROLE_ADMIN";}
33	2	f	\N	2016-11-29 09:13:14	\N	group.admin.core_user.user	t	f	a:3:{i:0;s:24:"ROLE_CORE_USER_USER_POST";i:1;s:23:"ROLE_CORE_USER_USER_PUT";i:2;s:26:"ROLE_CORE_USER_USER_DELETE";}
34	2	f	\N	2016-11-29 09:13:14	\N	group.user.core_user.user	f	f	a:2:{i:0;s:24:"ROLE_CORE_USER_USER_CGET";i:1;s:23:"ROLE_CORE_USER_USER_GET";}
35	2	f	\N	2016-11-29 09:13:14	\N	group.user.core_user.company	f	f	a:1:{i:0;s:26:"ROLE_CORE_USER_COMPANY_GET";}
36	2	f	\N	2016-11-29 09:13:14	\N	group.admin.core_user.company	t	f	a:1:{i:0;s:26:"ROLE_CORE_USER_COMPANY_PUT";}
37	2	f	\N	2016-11-29 09:13:14	\N	group.user.core_customer.address	f	f	a:2:{i:0;s:30:"ROLE_CORE_CUSTOMER_ADDRESS_GET";i:1;s:31:"ROLE_CORE_CUSTOMER_ADDRESS_CGET";}
38	2	f	\N	2016-11-29 09:13:14	\N	group.admin.core_customer.address	t	f	a:3:{i:0;s:31:"ROLE_CORE_CUSTOMER_ADDRESS_POST";i:1;s:30:"ROLE_CORE_CUSTOMER_ADDRESS_PUT";i:2;s:33:"ROLE_CORE_CUSTOMER_ADDRESS_DELETE";}
39	2	f	\N	2016-11-29 09:13:14	\N	group.user.core_customer.contact	f	f	a:2:{i:0;s:30:"ROLE_CORE_CUSTOMER_CONTACT_GET";i:1;s:31:"ROLE_CORE_CUSTOMER_CONTACT_CGET";}
40	2	f	\N	2016-11-29 09:13:14	\N	group.admin.core_customer.contact	t	f	a:3:{i:0;s:31:"ROLE_CORE_CUSTOMER_CONTACT_POST";i:1;s:30:"ROLE_CORE_CUSTOMER_CONTACT_PUT";i:2;s:33:"ROLE_CORE_CUSTOMER_CONTACT_DELETE";}
41	2	f	\N	2016-11-29 09:13:14	\N	group.user.core_customer.customerdemand	f	f	a:2:{i:0;s:37:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_GET";i:1;s:38:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_CGET";}
42	2	f	\N	2016-11-29 09:13:14	\N	group.admin.core_customer.customerdemand	t	f	a:3:{i:0;s:38:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_POST";i:1;s:37:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_PUT";i:2;s:40:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_DELETE";}
242	8	f	\N	2017-06-02 05:49:22	\N	group.user.utils_tag.tag	f	f	a:2:{i:0;s:23:"ROLE_UTILS_TAG_TAG_CGET";i:1;s:22:"ROLE_UTILS_TAG_TAG_GET";}
43	2	f	\N	2016-11-29 09:13:14	\N	group.user.core_customer.customerdemandmessage	f	f	a:2:{i:0;s:44:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_GET";i:1;s:45:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_CGET";}
44	2	f	\N	2016-11-29 09:13:14	\N	group.admin.core_customer.customerdemandmessage	t	f	a:3:{i:0;s:45:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_POST";i:1;s:44:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_PUT";i:2;s:47:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_DELETE";}
45	2	f	\N	2016-11-29 09:13:14	\N	group.user.core_customer.firm	f	f	a:2:{i:0;s:27:"ROLE_CORE_CUSTOMER_FIRM_GET";i:1;s:28:"ROLE_CORE_CUSTOMER_FIRM_CGET";}
46	2	f	\N	2016-11-29 09:13:14	\N	group.admin.core_customer.firm	t	f	a:3:{i:0;s:28:"ROLE_CORE_CUSTOMER_FIRM_POST";i:1;s:27:"ROLE_CORE_CUSTOMER_FIRM_PUT";i:2;s:30:"ROLE_CORE_CUSTOMER_FIRM_DELETE";}
47	2	f	\N	2016-11-29 09:13:14	\N	group.user.utils_utils.tag	f	f	a:2:{i:0;s:25:"ROLE_UTILS_UTILS_TAG_CGET";i:1;s:24:"ROLE_UTILS_UTILS_TAG_GET";}
48	2	f	\N	2016-11-29 09:13:14	\N	group.admin.utils_utils.tag	t	f	a:3:{i:0;s:25:"ROLE_UTILS_UTILS_TAG_POST";i:1;s:24:"ROLE_UTILS_UTILS_TAG_PUT";i:2;s:27:"ROLE_UTILS_UTILS_TAG_DELETE";}
49	2	f	\N	2016-11-29 09:13:14	\N	group.user.crm_bill.product_type	f	f	a:2:{i:0;s:30:"ROLE_CRM_BILL_PRODUCT_TYPE_GET";i:1;s:31:"ROLE_CRM_BILL_PRODUCT_TYPE_CGET";}
50	2	f	\N	2016-11-29 09:13:14	\N	group.admin.crm_bill.product_type	t	f	a:3:{i:0;s:31:"ROLE_CRM_BILL_PRODUCT_TYPE_POST";i:1;s:30:"ROLE_CRM_BILL_PRODUCT_TYPE_PUT";i:2;s:33:"ROLE_CRM_BILL_PRODUCT_TYPE_DELETE";}
51	2	f	\N	2016-11-29 09:13:14	\N	group.user.crm_bill.product	f	f	a:2:{i:0;s:25:"ROLE_CRM_BILL_PRODUCT_GET";i:1;s:26:"ROLE_CRM_BILL_PRODUCT_CGET";}
52	2	f	\N	2016-11-29 09:13:14	\N	group.admin.crm_bill.product	t	f	a:3:{i:0;s:26:"ROLE_CRM_BILL_PRODUCT_POST";i:1;s:25:"ROLE_CRM_BILL_PRODUCT_PUT";i:2;s:28:"ROLE_CRM_BILL_PRODUCT_DELETE";}
53	2	f	\N	2016-11-29 09:13:14	\N	group.user.crm_bill.quote	f	f	a:2:{i:0;s:23:"ROLE_CRM_BILL_QUOTE_GET";i:1;s:24:"ROLE_CRM_BILL_QUOTE_CGET";}
54	2	f	\N	2016-11-29 09:13:14	\N	group.admin.crm_bill.quote	t	f	a:3:{i:0;s:24:"ROLE_CRM_BILL_QUOTE_POST";i:1;s:23:"ROLE_CRM_BILL_QUOTE_PUT";i:2;s:26:"ROLE_CRM_BILL_QUOTE_DELETE";}
55	2	f	\N	2016-11-29 09:13:14	\N	group.user.crm_bill.bill	f	f	a:2:{i:0;s:22:"ROLE_CRM_BILL_BILL_GET";i:1;s:23:"ROLE_CRM_BILL_BILL_CGET";}
56	2	f	\N	2016-11-29 09:13:14	\N	group.admin.crm_bill.bill	t	f	a:3:{i:0;s:23:"ROLE_CRM_BILL_BILL_POST";i:1;s:22:"ROLE_CRM_BILL_BILL_PUT";i:2;s:25:"ROLE_CRM_BILL_BILL_DELETE";}
57	2	f	\N	2016-11-29 09:13:14	\N	group.user.crm_bill.config	f	f	a:2:{i:0;s:24:"ROLE_CRM_BILL_CONFIG_GET";i:1;s:25:"ROLE_CRM_BILL_CONFIG_CGET";}
58	2	f	\N	2016-11-29 09:13:14	\N	group.admin.crm_bill.config	t	f	a:3:{i:0;s:25:"ROLE_CRM_BILL_CONFIG_POST";i:1;s:24:"ROLE_CRM_BILL_CONFIG_PUT";i:2;s:27:"ROLE_CRM_BILL_CONFIG_DELETE";}
59	2	f	\N	2016-11-29 09:13:14	\N	group.user.crm_hr.cv	f	f	a:2:{i:0;s:19:"ROLE_CRM_HR_CV_CGET";i:1;s:18:"ROLE_CRM_HR_CV_GET";}
60	2	f	\N	2016-11-29 09:13:14	\N	group.admin.crm_hr.cv	t	f	a:3:{i:0;s:19:"ROLE_CRM_HR_CV_POST";i:1;s:18:"ROLE_CRM_HR_CV_PUT";i:2;s:21:"ROLE_CRM_HR_CV_DELETE";}
61	3	f	\N	2017-05-11 11:23:36	\N	group.user	f	t	a:0:{}
62	3	f	\N	2017-05-11 11:23:36	\N	group.admin	t	t	a:1:{i:0;s:10:"ROLE_ADMIN";}
63	3	f	\N	2017-05-11 11:23:36	\N	group.admin.core_user.user	t	f	a:3:{i:0;s:24:"ROLE_CORE_USER_USER_POST";i:1;s:23:"ROLE_CORE_USER_USER_PUT";i:2;s:26:"ROLE_CORE_USER_USER_DELETE";}
64	3	f	\N	2017-05-11 11:23:36	\N	group.user.core_user.user	f	f	a:2:{i:0;s:24:"ROLE_CORE_USER_USER_CGET";i:1;s:23:"ROLE_CORE_USER_USER_GET";}
65	3	f	\N	2017-05-11 11:23:36	\N	group.user.core_user.company	f	f	a:1:{i:0;s:26:"ROLE_CORE_USER_COMPANY_GET";}
66	3	f	\N	2017-05-11 11:23:36	\N	group.admin.core_user.company	t	f	a:1:{i:0;s:26:"ROLE_CORE_USER_COMPANY_PUT";}
67	3	f	\N	2017-05-11 11:23:37	\N	group.user.core_customer.address	f	f	a:2:{i:0;s:30:"ROLE_CORE_CUSTOMER_ADDRESS_GET";i:1;s:31:"ROLE_CORE_CUSTOMER_ADDRESS_CGET";}
68	3	f	\N	2017-05-11 11:23:37	\N	group.admin.core_customer.address	t	f	a:3:{i:0;s:31:"ROLE_CORE_CUSTOMER_ADDRESS_POST";i:1;s:30:"ROLE_CORE_CUSTOMER_ADDRESS_PUT";i:2;s:33:"ROLE_CORE_CUSTOMER_ADDRESS_DELETE";}
69	3	f	\N	2017-05-11 11:23:37	\N	group.user.core_customer.contact	f	f	a:2:{i:0;s:30:"ROLE_CORE_CUSTOMER_CONTACT_GET";i:1;s:31:"ROLE_CORE_CUSTOMER_CONTACT_CGET";}
70	3	f	\N	2017-05-11 11:23:37	\N	group.admin.core_customer.contact	t	f	a:3:{i:0;s:31:"ROLE_CORE_CUSTOMER_CONTACT_POST";i:1;s:30:"ROLE_CORE_CUSTOMER_CONTACT_PUT";i:2;s:33:"ROLE_CORE_CUSTOMER_CONTACT_DELETE";}
71	3	f	\N	2017-05-11 11:23:37	\N	group.user.core_customer.customerdemand	f	f	a:2:{i:0;s:37:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_GET";i:1;s:38:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_CGET";}
72	3	f	\N	2017-05-11 11:23:37	\N	group.admin.core_customer.customerdemand	t	f	a:3:{i:0;s:38:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_POST";i:1;s:37:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_PUT";i:2;s:40:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_DELETE";}
73	3	f	\N	2017-05-11 11:23:37	\N	group.user.core_customer.customerdemandmessage	f	f	a:2:{i:0;s:44:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_GET";i:1;s:45:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_CGET";}
74	3	f	\N	2017-05-11 11:23:37	\N	group.admin.core_customer.customerdemandmessage	t	f	a:3:{i:0;s:45:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_POST";i:1;s:44:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_PUT";i:2;s:47:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_DELETE";}
75	3	f	\N	2017-05-11 11:23:37	\N	group.user.core_customer.firm	f	f	a:2:{i:0;s:27:"ROLE_CORE_CUSTOMER_FIRM_GET";i:1;s:28:"ROLE_CORE_CUSTOMER_FIRM_CGET";}
76	3	f	\N	2017-05-11 11:23:37	\N	group.admin.core_customer.firm	t	f	a:3:{i:0;s:28:"ROLE_CORE_CUSTOMER_FIRM_POST";i:1;s:27:"ROLE_CORE_CUSTOMER_FIRM_PUT";i:2;s:30:"ROLE_CORE_CUSTOMER_FIRM_DELETE";}
77	3	f	\N	2017-05-11 11:23:37	\N	group.user.utils_tag.tag	f	f	a:2:{i:0;s:23:"ROLE_UTILS_TAG_TAG_CGET";i:1;s:22:"ROLE_UTILS_TAG_TAG_GET";}
78	3	f	\N	2017-05-11 11:23:37	\N	group.admin.utils_tag.tag	t	f	a:3:{i:0;s:23:"ROLE_UTILS_TAG_TAG_POST";i:1;s:22:"ROLE_UTILS_TAG_TAG_PUT";i:2;s:25:"ROLE_UTILS_TAG_TAG_DELETE";}
79	3	f	\N	2017-05-11 11:23:37	\N	group.user.crm_bill.product_type	f	f	a:2:{i:0;s:30:"ROLE_CRM_BILL_PRODUCT_TYPE_GET";i:1;s:31:"ROLE_CRM_BILL_PRODUCT_TYPE_CGET";}
80	3	f	\N	2017-05-11 11:23:37	\N	group.admin.crm_bill.product_type	t	f	a:3:{i:0;s:31:"ROLE_CRM_BILL_PRODUCT_TYPE_POST";i:1;s:30:"ROLE_CRM_BILL_PRODUCT_TYPE_PUT";i:2;s:33:"ROLE_CRM_BILL_PRODUCT_TYPE_DELETE";}
81	3	f	\N	2017-05-11 11:23:37	\N	group.user.crm_bill.product	f	f	a:2:{i:0;s:25:"ROLE_CRM_BILL_PRODUCT_GET";i:1;s:26:"ROLE_CRM_BILL_PRODUCT_CGET";}
82	3	f	\N	2017-05-11 11:23:37	\N	group.admin.crm_bill.product	t	f	a:3:{i:0;s:26:"ROLE_CRM_BILL_PRODUCT_POST";i:1;s:25:"ROLE_CRM_BILL_PRODUCT_PUT";i:2;s:28:"ROLE_CRM_BILL_PRODUCT_DELETE";}
83	3	f	\N	2017-05-11 11:23:37	\N	group.user.crm_bill.quote	f	f	a:2:{i:0;s:23:"ROLE_CRM_BILL_QUOTE_GET";i:1;s:24:"ROLE_CRM_BILL_QUOTE_CGET";}
84	3	f	\N	2017-05-11 11:23:37	\N	group.admin.crm_bill.quote	t	f	a:3:{i:0;s:24:"ROLE_CRM_BILL_QUOTE_POST";i:1;s:23:"ROLE_CRM_BILL_QUOTE_PUT";i:2;s:26:"ROLE_CRM_BILL_QUOTE_DELETE";}
85	3	f	\N	2017-05-11 11:23:37	\N	group.user.crm_bill.bill	f	f	a:2:{i:0;s:22:"ROLE_CRM_BILL_BILL_GET";i:1;s:23:"ROLE_CRM_BILL_BILL_CGET";}
86	3	f	\N	2017-05-11 11:23:37	\N	group.admin.crm_bill.bill	t	f	a:3:{i:0;s:23:"ROLE_CRM_BILL_BILL_POST";i:1;s:22:"ROLE_CRM_BILL_BILL_PUT";i:2;s:25:"ROLE_CRM_BILL_BILL_DELETE";}
87	3	f	\N	2017-05-11 11:23:37	\N	group.user.crm_bill.config	f	f	a:2:{i:0;s:24:"ROLE_CRM_BILL_CONFIG_GET";i:1;s:25:"ROLE_CRM_BILL_CONFIG_CGET";}
88	3	f	\N	2017-05-11 11:23:37	\N	group.admin.crm_bill.config	t	f	a:3:{i:0;s:25:"ROLE_CRM_BILL_CONFIG_POST";i:1;s:24:"ROLE_CRM_BILL_CONFIG_PUT";i:2;s:27:"ROLE_CRM_BILL_CONFIG_DELETE";}
89	3	f	\N	2017-05-11 11:23:37	\N	group.user.crm_hr.cv	f	f	a:2:{i:0;s:19:"ROLE_CRM_HR_CV_CGET";i:1;s:18:"ROLE_CRM_HR_CV_GET";}
90	3	f	\N	2017-05-11 11:23:37	\N	group.admin.crm_hr.cv	t	f	a:3:{i:0;s:19:"ROLE_CRM_HR_CV_POST";i:1;s:18:"ROLE_CRM_HR_CV_PUT";i:2;s:21:"ROLE_CRM_HR_CV_DELETE";}
91	3	f	\N	2017-05-11 11:23:37	\N	group.user.crm_marketing.contact_list	t	f	a:5:{i:0;s:36:"ROLE_CRM_MARKETING_CONTACT_LIST_CGET";i:1;s:35:"ROLE_CRM_MARKETING_CONTACT_LIST_GET";i:2;s:36:"ROLE_CRM_MARKETING_CONTACT_LIST_POST";i:3;s:35:"ROLE_CRM_MARKETING_CONTACT_LIST_PUT";i:4;s:38:"ROLE_CRM_MARKETING_CONTACT_LIST_DELETE";}
92	3	f	\N	2017-05-11 11:23:37	\N	group.user.crm_marketing.campaign	t	f	a:5:{i:0;s:32:"ROLE_CRM_MARKETING_CAMPAIGN_CGET";i:1;s:31:"ROLE_CRM_MARKETING_CAMPAIGN_GET";i:2;s:32:"ROLE_CRM_MARKETING_CAMPAIGN_POST";i:3;s:31:"ROLE_CRM_MARKETING_CAMPAIGN_PUT";i:4;s:34:"ROLE_CRM_MARKETING_CAMPAIGN_DELETE";}
93	3	f	\N	2017-05-11 11:23:37	\N	group.admin.crm_marketing.config	t	f	a:3:{i:0;s:29:"ROLE_CRM_MARKETING_CONFIG_GET";i:1;s:30:"ROLE_CRM_MARKETING_CONFIG_POST";i:2;s:29:"ROLE_CRM_MARKETING_CONFIG_PUT";}
94	4	f	\N	2017-05-11 14:24:32	\N	group.user	f	t	a:0:{}
95	4	f	\N	2017-05-11 14:24:32	\N	group.admin	t	t	a:1:{i:0;s:10:"ROLE_ADMIN";}
96	4	f	\N	2017-05-11 14:24:32	\N	group.admin.core_user.user	t	f	a:3:{i:0;s:24:"ROLE_CORE_USER_USER_POST";i:1;s:23:"ROLE_CORE_USER_USER_PUT";i:2;s:26:"ROLE_CORE_USER_USER_DELETE";}
97	4	f	\N	2017-05-11 14:24:32	\N	group.user.core_user.user	f	f	a:2:{i:0;s:24:"ROLE_CORE_USER_USER_CGET";i:1;s:23:"ROLE_CORE_USER_USER_GET";}
98	4	f	\N	2017-05-11 14:24:32	\N	group.user.core_user.company	f	f	a:1:{i:0;s:26:"ROLE_CORE_USER_COMPANY_GET";}
99	4	f	\N	2017-05-11 14:24:32	\N	group.admin.core_user.company	t	f	a:1:{i:0;s:26:"ROLE_CORE_USER_COMPANY_PUT";}
100	4	f	\N	2017-05-11 14:24:32	\N	group.user.core_customer.address	f	f	a:2:{i:0;s:30:"ROLE_CORE_CUSTOMER_ADDRESS_GET";i:1;s:31:"ROLE_CORE_CUSTOMER_ADDRESS_CGET";}
101	4	f	\N	2017-05-11 14:24:32	\N	group.admin.core_customer.address	t	f	a:3:{i:0;s:31:"ROLE_CORE_CUSTOMER_ADDRESS_POST";i:1;s:30:"ROLE_CORE_CUSTOMER_ADDRESS_PUT";i:2;s:33:"ROLE_CORE_CUSTOMER_ADDRESS_DELETE";}
102	4	f	\N	2017-05-11 14:24:32	\N	group.user.core_customer.contact	f	f	a:2:{i:0;s:30:"ROLE_CORE_CUSTOMER_CONTACT_GET";i:1;s:31:"ROLE_CORE_CUSTOMER_CONTACT_CGET";}
103	4	f	\N	2017-05-11 14:24:32	\N	group.admin.core_customer.contact	t	f	a:3:{i:0;s:31:"ROLE_CORE_CUSTOMER_CONTACT_POST";i:1;s:30:"ROLE_CORE_CUSTOMER_CONTACT_PUT";i:2;s:33:"ROLE_CORE_CUSTOMER_CONTACT_DELETE";}
104	4	f	\N	2017-05-11 14:24:32	\N	group.user.core_customer.customerdemand	f	f	a:2:{i:0;s:37:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_GET";i:1;s:38:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_CGET";}
105	4	f	\N	2017-05-11 14:24:32	\N	group.admin.core_customer.customerdemand	t	f	a:3:{i:0;s:38:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_POST";i:1;s:37:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_PUT";i:2;s:40:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_DELETE";}
106	4	f	\N	2017-05-11 14:24:32	\N	group.user.core_customer.customerdemandmessage	f	f	a:2:{i:0;s:44:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_GET";i:1;s:45:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_CGET";}
107	4	f	\N	2017-05-11 14:24:32	\N	group.admin.core_customer.customerdemandmessage	t	f	a:3:{i:0;s:45:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_POST";i:1;s:44:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_PUT";i:2;s:47:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_DELETE";}
108	4	f	\N	2017-05-11 14:24:32	\N	group.user.core_customer.firm	f	f	a:2:{i:0;s:27:"ROLE_CORE_CUSTOMER_FIRM_GET";i:1;s:28:"ROLE_CORE_CUSTOMER_FIRM_CGET";}
109	4	f	\N	2017-05-11 14:24:32	\N	group.admin.core_customer.firm	t	f	a:3:{i:0;s:28:"ROLE_CORE_CUSTOMER_FIRM_POST";i:1;s:27:"ROLE_CORE_CUSTOMER_FIRM_PUT";i:2;s:30:"ROLE_CORE_CUSTOMER_FIRM_DELETE";}
110	4	f	\N	2017-05-11 14:24:32	\N	group.user.utils_tag.tag	f	f	a:2:{i:0;s:23:"ROLE_UTILS_TAG_TAG_CGET";i:1;s:22:"ROLE_UTILS_TAG_TAG_GET";}
111	4	f	\N	2017-05-11 14:24:32	\N	group.admin.utils_tag.tag	t	f	a:3:{i:0;s:23:"ROLE_UTILS_TAG_TAG_POST";i:1;s:22:"ROLE_UTILS_TAG_TAG_PUT";i:2;s:25:"ROLE_UTILS_TAG_TAG_DELETE";}
112	4	f	\N	2017-05-11 14:24:32	\N	group.user.crm_bill.product_type	f	f	a:2:{i:0;s:30:"ROLE_CRM_BILL_PRODUCT_TYPE_GET";i:1;s:31:"ROLE_CRM_BILL_PRODUCT_TYPE_CGET";}
113	4	f	\N	2017-05-11 14:24:32	\N	group.admin.crm_bill.product_type	t	f	a:3:{i:0;s:31:"ROLE_CRM_BILL_PRODUCT_TYPE_POST";i:1;s:30:"ROLE_CRM_BILL_PRODUCT_TYPE_PUT";i:2;s:33:"ROLE_CRM_BILL_PRODUCT_TYPE_DELETE";}
114	4	f	\N	2017-05-11 14:24:32	\N	group.user.crm_bill.product	f	f	a:2:{i:0;s:25:"ROLE_CRM_BILL_PRODUCT_GET";i:1;s:26:"ROLE_CRM_BILL_PRODUCT_CGET";}
115	4	f	\N	2017-05-11 14:24:32	\N	group.admin.crm_bill.product	t	f	a:3:{i:0;s:26:"ROLE_CRM_BILL_PRODUCT_POST";i:1;s:25:"ROLE_CRM_BILL_PRODUCT_PUT";i:2;s:28:"ROLE_CRM_BILL_PRODUCT_DELETE";}
116	4	f	\N	2017-05-11 14:24:33	\N	group.user.crm_bill.quote	f	f	a:2:{i:0;s:23:"ROLE_CRM_BILL_QUOTE_GET";i:1;s:24:"ROLE_CRM_BILL_QUOTE_CGET";}
117	4	f	\N	2017-05-11 14:24:33	\N	group.admin.crm_bill.quote	t	f	a:3:{i:0;s:24:"ROLE_CRM_BILL_QUOTE_POST";i:1;s:23:"ROLE_CRM_BILL_QUOTE_PUT";i:2;s:26:"ROLE_CRM_BILL_QUOTE_DELETE";}
118	4	f	\N	2017-05-11 14:24:33	\N	group.user.crm_bill.bill	f	f	a:2:{i:0;s:22:"ROLE_CRM_BILL_BILL_GET";i:1;s:23:"ROLE_CRM_BILL_BILL_CGET";}
119	4	f	\N	2017-05-11 14:24:33	\N	group.admin.crm_bill.bill	t	f	a:3:{i:0;s:23:"ROLE_CRM_BILL_BILL_POST";i:1;s:22:"ROLE_CRM_BILL_BILL_PUT";i:2;s:25:"ROLE_CRM_BILL_BILL_DELETE";}
120	4	f	\N	2017-05-11 14:24:33	\N	group.user.crm_bill.config	f	f	a:2:{i:0;s:24:"ROLE_CRM_BILL_CONFIG_GET";i:1;s:25:"ROLE_CRM_BILL_CONFIG_CGET";}
121	4	f	\N	2017-05-11 14:24:33	\N	group.admin.crm_bill.config	t	f	a:3:{i:0;s:25:"ROLE_CRM_BILL_CONFIG_POST";i:1;s:24:"ROLE_CRM_BILL_CONFIG_PUT";i:2;s:27:"ROLE_CRM_BILL_CONFIG_DELETE";}
122	4	f	\N	2017-05-11 14:24:33	\N	group.user.crm_hr.cv	f	f	a:2:{i:0;s:19:"ROLE_CRM_HR_CV_CGET";i:1;s:18:"ROLE_CRM_HR_CV_GET";}
123	4	f	\N	2017-05-11 14:24:33	\N	group.admin.crm_hr.cv	t	f	a:3:{i:0;s:19:"ROLE_CRM_HR_CV_POST";i:1;s:18:"ROLE_CRM_HR_CV_PUT";i:2;s:21:"ROLE_CRM_HR_CV_DELETE";}
124	4	f	\N	2017-05-11 14:24:33	\N	group.user.crm_marketing.contact_list	t	f	a:5:{i:0;s:36:"ROLE_CRM_MARKETING_CONTACT_LIST_CGET";i:1;s:35:"ROLE_CRM_MARKETING_CONTACT_LIST_GET";i:2;s:36:"ROLE_CRM_MARKETING_CONTACT_LIST_POST";i:3;s:35:"ROLE_CRM_MARKETING_CONTACT_LIST_PUT";i:4;s:38:"ROLE_CRM_MARKETING_CONTACT_LIST_DELETE";}
125	4	f	\N	2017-05-11 14:24:33	\N	group.user.crm_marketing.campaign	t	f	a:5:{i:0;s:32:"ROLE_CRM_MARKETING_CAMPAIGN_CGET";i:1;s:31:"ROLE_CRM_MARKETING_CAMPAIGN_GET";i:2;s:32:"ROLE_CRM_MARKETING_CAMPAIGN_POST";i:3;s:31:"ROLE_CRM_MARKETING_CAMPAIGN_PUT";i:4;s:34:"ROLE_CRM_MARKETING_CAMPAIGN_DELETE";}
126	4	f	\N	2017-05-11 14:24:33	\N	group.admin.crm_marketing.config	t	f	a:3:{i:0;s:29:"ROLE_CRM_MARKETING_CONFIG_GET";i:1;s:30:"ROLE_CRM_MARKETING_CONFIG_POST";i:2;s:29:"ROLE_CRM_MARKETING_CONFIG_PUT";}
127	5	f	\N	2017-05-11 14:42:57	\N	group.user	f	t	a:0:{}
128	5	f	\N	2017-05-11 14:42:57	\N	group.admin	t	t	a:1:{i:0;s:10:"ROLE_ADMIN";}
129	5	f	\N	2017-05-11 14:42:57	\N	group.admin.core_user.user	t	f	a:3:{i:0;s:24:"ROLE_CORE_USER_USER_POST";i:1;s:23:"ROLE_CORE_USER_USER_PUT";i:2;s:26:"ROLE_CORE_USER_USER_DELETE";}
130	5	f	\N	2017-05-11 14:42:57	\N	group.user.core_user.user	f	f	a:2:{i:0;s:24:"ROLE_CORE_USER_USER_CGET";i:1;s:23:"ROLE_CORE_USER_USER_GET";}
131	5	f	\N	2017-05-11 14:42:57	\N	group.user.core_user.company	f	f	a:1:{i:0;s:26:"ROLE_CORE_USER_COMPANY_GET";}
132	5	f	\N	2017-05-11 14:42:57	\N	group.admin.core_user.company	t	f	a:1:{i:0;s:26:"ROLE_CORE_USER_COMPANY_PUT";}
133	5	f	\N	2017-05-11 14:42:57	\N	group.user.core_customer.address	f	f	a:2:{i:0;s:30:"ROLE_CORE_CUSTOMER_ADDRESS_GET";i:1;s:31:"ROLE_CORE_CUSTOMER_ADDRESS_CGET";}
134	5	f	\N	2017-05-11 14:42:57	\N	group.admin.core_customer.address	t	f	a:3:{i:0;s:31:"ROLE_CORE_CUSTOMER_ADDRESS_POST";i:1;s:30:"ROLE_CORE_CUSTOMER_ADDRESS_PUT";i:2;s:33:"ROLE_CORE_CUSTOMER_ADDRESS_DELETE";}
135	5	f	\N	2017-05-11 14:42:57	\N	group.user.core_customer.contact	f	f	a:2:{i:0;s:30:"ROLE_CORE_CUSTOMER_CONTACT_GET";i:1;s:31:"ROLE_CORE_CUSTOMER_CONTACT_CGET";}
136	5	f	\N	2017-05-11 14:42:57	\N	group.admin.core_customer.contact	t	f	a:3:{i:0;s:31:"ROLE_CORE_CUSTOMER_CONTACT_POST";i:1;s:30:"ROLE_CORE_CUSTOMER_CONTACT_PUT";i:2;s:33:"ROLE_CORE_CUSTOMER_CONTACT_DELETE";}
137	5	f	\N	2017-05-11 14:42:57	\N	group.user.core_customer.customerdemand	f	f	a:2:{i:0;s:37:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_GET";i:1;s:38:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_CGET";}
138	5	f	\N	2017-05-11 14:42:57	\N	group.admin.core_customer.customerdemand	t	f	a:3:{i:0;s:38:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_POST";i:1;s:37:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_PUT";i:2;s:40:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_DELETE";}
139	5	f	\N	2017-05-11 14:42:57	\N	group.user.core_customer.customerdemandmessage	f	f	a:2:{i:0;s:44:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_GET";i:1;s:45:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_CGET";}
140	5	f	\N	2017-05-11 14:42:57	\N	group.admin.core_customer.customerdemandmessage	t	f	a:3:{i:0;s:45:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_POST";i:1;s:44:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_PUT";i:2;s:47:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_DELETE";}
141	5	f	\N	2017-05-11 14:42:57	\N	group.user.core_customer.firm	f	f	a:2:{i:0;s:27:"ROLE_CORE_CUSTOMER_FIRM_GET";i:1;s:28:"ROLE_CORE_CUSTOMER_FIRM_CGET";}
142	5	f	\N	2017-05-11 14:42:57	\N	group.admin.core_customer.firm	t	f	a:3:{i:0;s:28:"ROLE_CORE_CUSTOMER_FIRM_POST";i:1;s:27:"ROLE_CORE_CUSTOMER_FIRM_PUT";i:2;s:30:"ROLE_CORE_CUSTOMER_FIRM_DELETE";}
143	5	f	\N	2017-05-11 14:42:57	\N	group.user.utils_tag.tag	f	f	a:2:{i:0;s:23:"ROLE_UTILS_TAG_TAG_CGET";i:1;s:22:"ROLE_UTILS_TAG_TAG_GET";}
144	5	f	\N	2017-05-11 14:42:57	\N	group.admin.utils_tag.tag	t	f	a:3:{i:0;s:23:"ROLE_UTILS_TAG_TAG_POST";i:1;s:22:"ROLE_UTILS_TAG_TAG_PUT";i:2;s:25:"ROLE_UTILS_TAG_TAG_DELETE";}
145	5	f	\N	2017-05-11 14:42:57	\N	group.user.crm_bill.product_type	f	f	a:2:{i:0;s:30:"ROLE_CRM_BILL_PRODUCT_TYPE_GET";i:1;s:31:"ROLE_CRM_BILL_PRODUCT_TYPE_CGET";}
146	5	f	\N	2017-05-11 14:42:57	\N	group.admin.crm_bill.product_type	t	f	a:3:{i:0;s:31:"ROLE_CRM_BILL_PRODUCT_TYPE_POST";i:1;s:30:"ROLE_CRM_BILL_PRODUCT_TYPE_PUT";i:2;s:33:"ROLE_CRM_BILL_PRODUCT_TYPE_DELETE";}
147	5	f	\N	2017-05-11 14:42:57	\N	group.user.crm_bill.product	f	f	a:2:{i:0;s:25:"ROLE_CRM_BILL_PRODUCT_GET";i:1;s:26:"ROLE_CRM_BILL_PRODUCT_CGET";}
148	5	f	\N	2017-05-11 14:42:57	\N	group.admin.crm_bill.product	t	f	a:3:{i:0;s:26:"ROLE_CRM_BILL_PRODUCT_POST";i:1;s:25:"ROLE_CRM_BILL_PRODUCT_PUT";i:2;s:28:"ROLE_CRM_BILL_PRODUCT_DELETE";}
149	5	f	\N	2017-05-11 14:42:57	\N	group.user.crm_bill.quote	f	f	a:2:{i:0;s:23:"ROLE_CRM_BILL_QUOTE_GET";i:1;s:24:"ROLE_CRM_BILL_QUOTE_CGET";}
150	5	f	\N	2017-05-11 14:42:57	\N	group.admin.crm_bill.quote	t	f	a:3:{i:0;s:24:"ROLE_CRM_BILL_QUOTE_POST";i:1;s:23:"ROLE_CRM_BILL_QUOTE_PUT";i:2;s:26:"ROLE_CRM_BILL_QUOTE_DELETE";}
151	5	f	\N	2017-05-11 14:42:57	\N	group.user.crm_bill.bill	f	f	a:2:{i:0;s:22:"ROLE_CRM_BILL_BILL_GET";i:1;s:23:"ROLE_CRM_BILL_BILL_CGET";}
152	5	f	\N	2017-05-11 14:42:57	\N	group.admin.crm_bill.bill	t	f	a:3:{i:0;s:23:"ROLE_CRM_BILL_BILL_POST";i:1;s:22:"ROLE_CRM_BILL_BILL_PUT";i:2;s:25:"ROLE_CRM_BILL_BILL_DELETE";}
153	5	f	\N	2017-05-11 14:42:57	\N	group.user.crm_bill.config	f	f	a:2:{i:0;s:24:"ROLE_CRM_BILL_CONFIG_GET";i:1;s:25:"ROLE_CRM_BILL_CONFIG_CGET";}
154	5	f	\N	2017-05-11 14:42:57	\N	group.admin.crm_bill.config	t	f	a:3:{i:0;s:25:"ROLE_CRM_BILL_CONFIG_POST";i:1;s:24:"ROLE_CRM_BILL_CONFIG_PUT";i:2;s:27:"ROLE_CRM_BILL_CONFIG_DELETE";}
155	5	f	\N	2017-05-11 14:42:58	\N	group.user.crm_hr.cv	f	f	a:2:{i:0;s:19:"ROLE_CRM_HR_CV_CGET";i:1;s:18:"ROLE_CRM_HR_CV_GET";}
156	5	f	\N	2017-05-11 14:42:58	\N	group.admin.crm_hr.cv	t	f	a:3:{i:0;s:19:"ROLE_CRM_HR_CV_POST";i:1;s:18:"ROLE_CRM_HR_CV_PUT";i:2;s:21:"ROLE_CRM_HR_CV_DELETE";}
157	5	f	\N	2017-05-11 14:42:58	\N	group.user.crm_marketing.contact_list	t	f	a:5:{i:0;s:36:"ROLE_CRM_MARKETING_CONTACT_LIST_CGET";i:1;s:35:"ROLE_CRM_MARKETING_CONTACT_LIST_GET";i:2;s:36:"ROLE_CRM_MARKETING_CONTACT_LIST_POST";i:3;s:35:"ROLE_CRM_MARKETING_CONTACT_LIST_PUT";i:4;s:38:"ROLE_CRM_MARKETING_CONTACT_LIST_DELETE";}
158	5	f	\N	2017-05-11 14:42:58	\N	group.user.crm_marketing.campaign	t	f	a:5:{i:0;s:32:"ROLE_CRM_MARKETING_CAMPAIGN_CGET";i:1;s:31:"ROLE_CRM_MARKETING_CAMPAIGN_GET";i:2;s:32:"ROLE_CRM_MARKETING_CAMPAIGN_POST";i:3;s:31:"ROLE_CRM_MARKETING_CAMPAIGN_PUT";i:4;s:34:"ROLE_CRM_MARKETING_CAMPAIGN_DELETE";}
159	5	f	\N	2017-05-11 14:42:58	\N	group.admin.crm_marketing.config	t	f	a:3:{i:0;s:29:"ROLE_CRM_MARKETING_CONFIG_GET";i:1;s:30:"ROLE_CRM_MARKETING_CONFIG_POST";i:2;s:29:"ROLE_CRM_MARKETING_CONFIG_PUT";}
160	6	f	\N	2017-05-15 15:07:06	\N	group.user	f	t	a:0:{}
161	6	f	\N	2017-05-15 15:07:06	\N	group.admin	t	t	a:1:{i:0;s:10:"ROLE_ADMIN";}
162	6	f	\N	2017-05-15 15:07:06	\N	group.admin.core_user.user	t	f	a:3:{i:0;s:24:"ROLE_CORE_USER_USER_POST";i:1;s:23:"ROLE_CORE_USER_USER_PUT";i:2;s:26:"ROLE_CORE_USER_USER_DELETE";}
163	6	f	\N	2017-05-15 15:07:06	\N	group.user.core_user.user	f	f	a:2:{i:0;s:24:"ROLE_CORE_USER_USER_CGET";i:1;s:23:"ROLE_CORE_USER_USER_GET";}
164	6	f	\N	2017-05-15 15:07:06	\N	group.user.core_user.company	f	f	a:1:{i:0;s:26:"ROLE_CORE_USER_COMPANY_GET";}
165	6	f	\N	2017-05-15 15:07:06	\N	group.admin.core_user.company	t	f	a:1:{i:0;s:26:"ROLE_CORE_USER_COMPANY_PUT";}
166	6	f	\N	2017-05-15 15:07:06	\N	group.user.core_customer.address	f	f	a:2:{i:0;s:30:"ROLE_CORE_CUSTOMER_ADDRESS_GET";i:1;s:31:"ROLE_CORE_CUSTOMER_ADDRESS_CGET";}
167	6	f	\N	2017-05-15 15:07:06	\N	group.admin.core_customer.address	t	f	a:3:{i:0;s:31:"ROLE_CORE_CUSTOMER_ADDRESS_POST";i:1;s:30:"ROLE_CORE_CUSTOMER_ADDRESS_PUT";i:2;s:33:"ROLE_CORE_CUSTOMER_ADDRESS_DELETE";}
168	6	f	\N	2017-05-15 15:07:06	\N	group.user.core_customer.contact	f	f	a:2:{i:0;s:30:"ROLE_CORE_CUSTOMER_CONTACT_GET";i:1;s:31:"ROLE_CORE_CUSTOMER_CONTACT_CGET";}
169	6	f	\N	2017-05-15 15:07:06	\N	group.admin.core_customer.contact	t	f	a:3:{i:0;s:31:"ROLE_CORE_CUSTOMER_CONTACT_POST";i:1;s:30:"ROLE_CORE_CUSTOMER_CONTACT_PUT";i:2;s:33:"ROLE_CORE_CUSTOMER_CONTACT_DELETE";}
170	6	f	\N	2017-05-15 15:07:06	\N	group.user.core_customer.customerdemand	f	f	a:2:{i:0;s:37:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_GET";i:1;s:38:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_CGET";}
171	6	f	\N	2017-05-15 15:07:06	\N	group.admin.core_customer.customerdemand	t	f	a:3:{i:0;s:38:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_POST";i:1;s:37:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_PUT";i:2;s:40:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_DELETE";}
172	6	f	\N	2017-05-15 15:07:06	\N	group.user.core_customer.customerdemandmessage	f	f	a:2:{i:0;s:44:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_GET";i:1;s:45:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_CGET";}
173	6	f	\N	2017-05-15 15:07:06	\N	group.admin.core_customer.customerdemandmessage	t	f	a:3:{i:0;s:45:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_POST";i:1;s:44:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_PUT";i:2;s:47:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_DELETE";}
174	6	f	\N	2017-05-15 15:07:06	\N	group.user.core_customer.firm	f	f	a:2:{i:0;s:27:"ROLE_CORE_CUSTOMER_FIRM_GET";i:1;s:28:"ROLE_CORE_CUSTOMER_FIRM_CGET";}
175	6	f	\N	2017-05-15 15:07:06	\N	group.admin.core_customer.firm	t	f	a:3:{i:0;s:28:"ROLE_CORE_CUSTOMER_FIRM_POST";i:1;s:27:"ROLE_CORE_CUSTOMER_FIRM_PUT";i:2;s:30:"ROLE_CORE_CUSTOMER_FIRM_DELETE";}
176	6	f	\N	2017-05-15 15:07:06	\N	group.user.utils_tag.tag	f	f	a:2:{i:0;s:23:"ROLE_UTILS_TAG_TAG_CGET";i:1;s:22:"ROLE_UTILS_TAG_TAG_GET";}
177	6	f	\N	2017-05-15 15:07:06	\N	group.admin.utils_tag.tag	t	f	a:3:{i:0;s:23:"ROLE_UTILS_TAG_TAG_POST";i:1;s:22:"ROLE_UTILS_TAG_TAG_PUT";i:2;s:25:"ROLE_UTILS_TAG_TAG_DELETE";}
178	6	f	\N	2017-05-15 15:07:06	\N	group.user.crm_bill.product_type	f	f	a:2:{i:0;s:30:"ROLE_CRM_BILL_PRODUCT_TYPE_GET";i:1;s:31:"ROLE_CRM_BILL_PRODUCT_TYPE_CGET";}
179	6	f	\N	2017-05-15 15:07:06	\N	group.admin.crm_bill.product_type	t	f	a:3:{i:0;s:31:"ROLE_CRM_BILL_PRODUCT_TYPE_POST";i:1;s:30:"ROLE_CRM_BILL_PRODUCT_TYPE_PUT";i:2;s:33:"ROLE_CRM_BILL_PRODUCT_TYPE_DELETE";}
180	6	f	\N	2017-05-15 15:07:06	\N	group.user.crm_bill.product	f	f	a:2:{i:0;s:25:"ROLE_CRM_BILL_PRODUCT_GET";i:1;s:26:"ROLE_CRM_BILL_PRODUCT_CGET";}
181	6	f	\N	2017-05-15 15:07:06	\N	group.admin.crm_bill.product	t	f	a:3:{i:0;s:26:"ROLE_CRM_BILL_PRODUCT_POST";i:1;s:25:"ROLE_CRM_BILL_PRODUCT_PUT";i:2;s:28:"ROLE_CRM_BILL_PRODUCT_DELETE";}
182	6	f	\N	2017-05-15 15:07:06	\N	group.user.crm_bill.quote	f	f	a:2:{i:0;s:23:"ROLE_CRM_BILL_QUOTE_GET";i:1;s:24:"ROLE_CRM_BILL_QUOTE_CGET";}
183	6	f	\N	2017-05-15 15:07:06	\N	group.admin.crm_bill.quote	t	f	a:3:{i:0;s:24:"ROLE_CRM_BILL_QUOTE_POST";i:1;s:23:"ROLE_CRM_BILL_QUOTE_PUT";i:2;s:26:"ROLE_CRM_BILL_QUOTE_DELETE";}
184	6	f	\N	2017-05-15 15:07:06	\N	group.user.crm_bill.bill	f	f	a:2:{i:0;s:22:"ROLE_CRM_BILL_BILL_GET";i:1;s:23:"ROLE_CRM_BILL_BILL_CGET";}
185	6	f	\N	2017-05-15 15:07:06	\N	group.admin.crm_bill.bill	t	f	a:3:{i:0;s:23:"ROLE_CRM_BILL_BILL_POST";i:1;s:22:"ROLE_CRM_BILL_BILL_PUT";i:2;s:25:"ROLE_CRM_BILL_BILL_DELETE";}
186	6	f	\N	2017-05-15 15:07:06	\N	group.user.crm_bill.config	f	f	a:2:{i:0;s:24:"ROLE_CRM_BILL_CONFIG_GET";i:1;s:25:"ROLE_CRM_BILL_CONFIG_CGET";}
187	6	f	\N	2017-05-15 15:07:06	\N	group.admin.crm_bill.config	t	f	a:3:{i:0;s:25:"ROLE_CRM_BILL_CONFIG_POST";i:1;s:24:"ROLE_CRM_BILL_CONFIG_PUT";i:2;s:27:"ROLE_CRM_BILL_CONFIG_DELETE";}
188	6	f	\N	2017-05-15 15:07:07	\N	group.user.crm_hr.cv	f	f	a:2:{i:0;s:19:"ROLE_CRM_HR_CV_CGET";i:1;s:18:"ROLE_CRM_HR_CV_GET";}
189	6	f	\N	2017-05-15 15:07:07	\N	group.admin.crm_hr.cv	t	f	a:3:{i:0;s:19:"ROLE_CRM_HR_CV_POST";i:1;s:18:"ROLE_CRM_HR_CV_PUT";i:2;s:21:"ROLE_CRM_HR_CV_DELETE";}
190	6	f	\N	2017-05-15 15:07:07	\N	group.user.crm_marketing.contact_list	t	f	a:5:{i:0;s:36:"ROLE_CRM_MARKETING_CONTACT_LIST_CGET";i:1;s:35:"ROLE_CRM_MARKETING_CONTACT_LIST_GET";i:2;s:36:"ROLE_CRM_MARKETING_CONTACT_LIST_POST";i:3;s:35:"ROLE_CRM_MARKETING_CONTACT_LIST_PUT";i:4;s:38:"ROLE_CRM_MARKETING_CONTACT_LIST_DELETE";}
191	6	f	\N	2017-05-15 15:07:07	\N	group.user.crm_marketing.campaign	t	f	a:5:{i:0;s:32:"ROLE_CRM_MARKETING_CAMPAIGN_CGET";i:1;s:31:"ROLE_CRM_MARKETING_CAMPAIGN_GET";i:2;s:32:"ROLE_CRM_MARKETING_CAMPAIGN_POST";i:3;s:31:"ROLE_CRM_MARKETING_CAMPAIGN_PUT";i:4;s:34:"ROLE_CRM_MARKETING_CAMPAIGN_DELETE";}
192	6	f	\N	2017-05-15 15:07:07	\N	group.admin.crm_marketing.config	t	f	a:3:{i:0;s:29:"ROLE_CRM_MARKETING_CONFIG_GET";i:1;s:30:"ROLE_CRM_MARKETING_CONFIG_POST";i:2;s:29:"ROLE_CRM_MARKETING_CONFIG_PUT";}
193	7	f	\N	2017-05-15 17:30:41	\N	group.user	f	t	a:0:{}
194	7	f	\N	2017-05-15 17:30:41	\N	group.admin	t	t	a:1:{i:0;s:10:"ROLE_ADMIN";}
195	7	f	\N	2017-05-15 17:30:41	\N	group.admin.core_user.user	t	f	a:3:{i:0;s:24:"ROLE_CORE_USER_USER_POST";i:1;s:23:"ROLE_CORE_USER_USER_PUT";i:2;s:26:"ROLE_CORE_USER_USER_DELETE";}
196	7	f	\N	2017-05-15 17:30:41	\N	group.user.core_user.user	f	f	a:2:{i:0;s:24:"ROLE_CORE_USER_USER_CGET";i:1;s:23:"ROLE_CORE_USER_USER_GET";}
197	7	f	\N	2017-05-15 17:30:41	\N	group.user.core_user.company	f	f	a:1:{i:0;s:26:"ROLE_CORE_USER_COMPANY_GET";}
198	7	f	\N	2017-05-15 17:30:41	\N	group.admin.core_user.company	t	f	a:1:{i:0;s:26:"ROLE_CORE_USER_COMPANY_PUT";}
199	7	f	\N	2017-05-15 17:30:41	\N	group.user.core_customer.address	f	f	a:2:{i:0;s:30:"ROLE_CORE_CUSTOMER_ADDRESS_GET";i:1;s:31:"ROLE_CORE_CUSTOMER_ADDRESS_CGET";}
200	7	f	\N	2017-05-15 17:30:41	\N	group.admin.core_customer.address	t	f	a:3:{i:0;s:31:"ROLE_CORE_CUSTOMER_ADDRESS_POST";i:1;s:30:"ROLE_CORE_CUSTOMER_ADDRESS_PUT";i:2;s:33:"ROLE_CORE_CUSTOMER_ADDRESS_DELETE";}
201	7	f	\N	2017-05-15 17:30:41	\N	group.user.core_customer.contact	f	f	a:2:{i:0;s:30:"ROLE_CORE_CUSTOMER_CONTACT_GET";i:1;s:31:"ROLE_CORE_CUSTOMER_CONTACT_CGET";}
202	7	f	\N	2017-05-15 17:30:41	\N	group.admin.core_customer.contact	t	f	a:3:{i:0;s:31:"ROLE_CORE_CUSTOMER_CONTACT_POST";i:1;s:30:"ROLE_CORE_CUSTOMER_CONTACT_PUT";i:2;s:33:"ROLE_CORE_CUSTOMER_CONTACT_DELETE";}
203	7	f	\N	2017-05-15 17:30:41	\N	group.user.core_customer.customerdemand	f	f	a:2:{i:0;s:37:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_GET";i:1;s:38:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_CGET";}
204	7	f	\N	2017-05-15 17:30:41	\N	group.admin.core_customer.customerdemand	t	f	a:3:{i:0;s:38:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_POST";i:1;s:37:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_PUT";i:2;s:40:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_DELETE";}
205	7	f	\N	2017-05-15 17:30:41	\N	group.user.core_customer.customerdemandmessage	f	f	a:2:{i:0;s:44:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_GET";i:1;s:45:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_CGET";}
206	7	f	\N	2017-05-15 17:30:41	\N	group.admin.core_customer.customerdemandmessage	t	f	a:3:{i:0;s:45:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_POST";i:1;s:44:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_PUT";i:2;s:47:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_DELETE";}
207	7	f	\N	2017-05-15 17:30:41	\N	group.user.core_customer.firm	f	f	a:2:{i:0;s:27:"ROLE_CORE_CUSTOMER_FIRM_GET";i:1;s:28:"ROLE_CORE_CUSTOMER_FIRM_CGET";}
208	7	f	\N	2017-05-15 17:30:41	\N	group.admin.core_customer.firm	t	f	a:3:{i:0;s:28:"ROLE_CORE_CUSTOMER_FIRM_POST";i:1;s:27:"ROLE_CORE_CUSTOMER_FIRM_PUT";i:2;s:30:"ROLE_CORE_CUSTOMER_FIRM_DELETE";}
209	7	f	\N	2017-05-15 17:30:41	\N	group.user.utils_tag.tag	f	f	a:2:{i:0;s:23:"ROLE_UTILS_TAG_TAG_CGET";i:1;s:22:"ROLE_UTILS_TAG_TAG_GET";}
210	7	f	\N	2017-05-15 17:30:41	\N	group.admin.utils_tag.tag	t	f	a:3:{i:0;s:23:"ROLE_UTILS_TAG_TAG_POST";i:1;s:22:"ROLE_UTILS_TAG_TAG_PUT";i:2;s:25:"ROLE_UTILS_TAG_TAG_DELETE";}
211	7	f	\N	2017-05-15 17:30:41	\N	group.user.crm_bill.product_type	f	f	a:2:{i:0;s:30:"ROLE_CRM_BILL_PRODUCT_TYPE_GET";i:1;s:31:"ROLE_CRM_BILL_PRODUCT_TYPE_CGET";}
212	7	f	\N	2017-05-15 17:30:41	\N	group.admin.crm_bill.product_type	t	f	a:3:{i:0;s:31:"ROLE_CRM_BILL_PRODUCT_TYPE_POST";i:1;s:30:"ROLE_CRM_BILL_PRODUCT_TYPE_PUT";i:2;s:33:"ROLE_CRM_BILL_PRODUCT_TYPE_DELETE";}
213	7	f	\N	2017-05-15 17:30:41	\N	group.user.crm_bill.product	f	f	a:2:{i:0;s:25:"ROLE_CRM_BILL_PRODUCT_GET";i:1;s:26:"ROLE_CRM_BILL_PRODUCT_CGET";}
214	7	f	\N	2017-05-15 17:30:41	\N	group.admin.crm_bill.product	t	f	a:3:{i:0;s:26:"ROLE_CRM_BILL_PRODUCT_POST";i:1;s:25:"ROLE_CRM_BILL_PRODUCT_PUT";i:2;s:28:"ROLE_CRM_BILL_PRODUCT_DELETE";}
215	7	f	\N	2017-05-15 17:30:41	\N	group.user.crm_bill.quote	f	f	a:2:{i:0;s:23:"ROLE_CRM_BILL_QUOTE_GET";i:1;s:24:"ROLE_CRM_BILL_QUOTE_CGET";}
216	7	f	\N	2017-05-15 17:30:41	\N	group.admin.crm_bill.quote	t	f	a:3:{i:0;s:24:"ROLE_CRM_BILL_QUOTE_POST";i:1;s:23:"ROLE_CRM_BILL_QUOTE_PUT";i:2;s:26:"ROLE_CRM_BILL_QUOTE_DELETE";}
217	7	f	\N	2017-05-15 17:30:41	\N	group.user.crm_bill.bill	f	f	a:2:{i:0;s:22:"ROLE_CRM_BILL_BILL_GET";i:1;s:23:"ROLE_CRM_BILL_BILL_CGET";}
218	7	f	\N	2017-05-15 17:30:41	\N	group.admin.crm_bill.bill	t	f	a:3:{i:0;s:23:"ROLE_CRM_BILL_BILL_POST";i:1;s:22:"ROLE_CRM_BILL_BILL_PUT";i:2;s:25:"ROLE_CRM_BILL_BILL_DELETE";}
219	7	f	\N	2017-05-15 17:30:41	\N	group.user.crm_bill.config	f	f	a:2:{i:0;s:24:"ROLE_CRM_BILL_CONFIG_GET";i:1;s:25:"ROLE_CRM_BILL_CONFIG_CGET";}
220	7	f	\N	2017-05-15 17:30:41	\N	group.admin.crm_bill.config	t	f	a:3:{i:0;s:25:"ROLE_CRM_BILL_CONFIG_POST";i:1;s:24:"ROLE_CRM_BILL_CONFIG_PUT";i:2;s:27:"ROLE_CRM_BILL_CONFIG_DELETE";}
221	7	f	\N	2017-05-15 17:30:41	\N	group.user.crm_hr.cv	f	f	a:2:{i:0;s:19:"ROLE_CRM_HR_CV_CGET";i:1;s:18:"ROLE_CRM_HR_CV_GET";}
222	7	f	\N	2017-05-15 17:30:41	\N	group.admin.crm_hr.cv	t	f	a:3:{i:0;s:19:"ROLE_CRM_HR_CV_POST";i:1;s:18:"ROLE_CRM_HR_CV_PUT";i:2;s:21:"ROLE_CRM_HR_CV_DELETE";}
223	7	f	\N	2017-05-15 17:30:41	\N	group.user.crm_marketing.contact_list	t	f	a:5:{i:0;s:36:"ROLE_CRM_MARKETING_CONTACT_LIST_CGET";i:1;s:35:"ROLE_CRM_MARKETING_CONTACT_LIST_GET";i:2;s:36:"ROLE_CRM_MARKETING_CONTACT_LIST_POST";i:3;s:35:"ROLE_CRM_MARKETING_CONTACT_LIST_PUT";i:4;s:38:"ROLE_CRM_MARKETING_CONTACT_LIST_DELETE";}
224	7	f	\N	2017-05-15 17:30:41	\N	group.user.crm_marketing.campaign	t	f	a:5:{i:0;s:32:"ROLE_CRM_MARKETING_CAMPAIGN_CGET";i:1;s:31:"ROLE_CRM_MARKETING_CAMPAIGN_GET";i:2;s:32:"ROLE_CRM_MARKETING_CAMPAIGN_POST";i:3;s:31:"ROLE_CRM_MARKETING_CAMPAIGN_PUT";i:4;s:34:"ROLE_CRM_MARKETING_CAMPAIGN_DELETE";}
225	7	f	\N	2017-05-15 17:30:41	\N	group.admin.crm_marketing.config	t	f	a:3:{i:0;s:29:"ROLE_CRM_MARKETING_CONFIG_GET";i:1;s:30:"ROLE_CRM_MARKETING_CONFIG_POST";i:2;s:29:"ROLE_CRM_MARKETING_CONFIG_PUT";}
226	8	f	\N	2017-06-02 05:49:22	\N	group.user	f	t	a:0:{}
227	8	f	\N	2017-06-02 05:49:22	\N	group.admin	t	t	a:1:{i:0;s:10:"ROLE_ADMIN";}
228	8	f	\N	2017-06-02 05:49:22	\N	group.admin.core_user.user	t	f	a:3:{i:0;s:24:"ROLE_CORE_USER_USER_POST";i:1;s:23:"ROLE_CORE_USER_USER_PUT";i:2;s:26:"ROLE_CORE_USER_USER_DELETE";}
229	8	f	\N	2017-06-02 05:49:22	\N	group.user.core_user.user	f	f	a:2:{i:0;s:24:"ROLE_CORE_USER_USER_CGET";i:1;s:23:"ROLE_CORE_USER_USER_GET";}
230	8	f	\N	2017-06-02 05:49:22	\N	group.user.core_user.company	f	f	a:1:{i:0;s:26:"ROLE_CORE_USER_COMPANY_GET";}
231	8	f	\N	2017-06-02 05:49:22	\N	group.admin.core_user.company	t	f	a:1:{i:0;s:26:"ROLE_CORE_USER_COMPANY_PUT";}
232	8	f	\N	2017-06-02 05:49:22	\N	group.user.core_customer.address	f	f	a:2:{i:0;s:30:"ROLE_CORE_CUSTOMER_ADDRESS_GET";i:1;s:31:"ROLE_CORE_CUSTOMER_ADDRESS_CGET";}
233	8	f	\N	2017-06-02 05:49:22	\N	group.admin.core_customer.address	t	f	a:3:{i:0;s:31:"ROLE_CORE_CUSTOMER_ADDRESS_POST";i:1;s:30:"ROLE_CORE_CUSTOMER_ADDRESS_PUT";i:2;s:33:"ROLE_CORE_CUSTOMER_ADDRESS_DELETE";}
234	8	f	\N	2017-06-02 05:49:22	\N	group.user.core_customer.contact	f	f	a:2:{i:0;s:30:"ROLE_CORE_CUSTOMER_CONTACT_GET";i:1;s:31:"ROLE_CORE_CUSTOMER_CONTACT_CGET";}
235	8	f	\N	2017-06-02 05:49:22	\N	group.admin.core_customer.contact	t	f	a:3:{i:0;s:31:"ROLE_CORE_CUSTOMER_CONTACT_POST";i:1;s:30:"ROLE_CORE_CUSTOMER_CONTACT_PUT";i:2;s:33:"ROLE_CORE_CUSTOMER_CONTACT_DELETE";}
236	8	f	\N	2017-06-02 05:49:22	\N	group.user.core_customer.customerdemand	f	f	a:2:{i:0;s:37:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_GET";i:1;s:38:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_CGET";}
237	8	f	\N	2017-06-02 05:49:22	\N	group.admin.core_customer.customerdemand	t	f	a:3:{i:0;s:38:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_POST";i:1;s:37:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_PUT";i:2;s:40:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_DELETE";}
238	8	f	\N	2017-06-02 05:49:22	\N	group.user.core_customer.customerdemandmessage	f	f	a:2:{i:0;s:44:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_GET";i:1;s:45:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_CGET";}
239	8	f	\N	2017-06-02 05:49:22	\N	group.admin.core_customer.customerdemandmessage	t	f	a:3:{i:0;s:45:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_POST";i:1;s:44:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_PUT";i:2;s:47:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_DELETE";}
240	8	f	\N	2017-06-02 05:49:22	\N	group.user.core_customer.firm	f	f	a:2:{i:0;s:27:"ROLE_CORE_CUSTOMER_FIRM_GET";i:1;s:28:"ROLE_CORE_CUSTOMER_FIRM_CGET";}
241	8	f	\N	2017-06-02 05:49:22	\N	group.admin.core_customer.firm	t	f	a:3:{i:0;s:28:"ROLE_CORE_CUSTOMER_FIRM_POST";i:1;s:27:"ROLE_CORE_CUSTOMER_FIRM_PUT";i:2;s:30:"ROLE_CORE_CUSTOMER_FIRM_DELETE";}
243	8	f	\N	2017-06-02 05:49:22	\N	group.admin.utils_tag.tag	t	f	a:3:{i:0;s:23:"ROLE_UTILS_TAG_TAG_POST";i:1;s:22:"ROLE_UTILS_TAG_TAG_PUT";i:2;s:25:"ROLE_UTILS_TAG_TAG_DELETE";}
244	8	f	\N	2017-06-02 05:49:22	\N	group.user.crm_bill.product_type	f	f	a:2:{i:0;s:30:"ROLE_CRM_BILL_PRODUCT_TYPE_GET";i:1;s:31:"ROLE_CRM_BILL_PRODUCT_TYPE_CGET";}
245	8	f	\N	2017-06-02 05:49:22	\N	group.admin.crm_bill.product_type	t	f	a:3:{i:0;s:31:"ROLE_CRM_BILL_PRODUCT_TYPE_POST";i:1;s:30:"ROLE_CRM_BILL_PRODUCT_TYPE_PUT";i:2;s:33:"ROLE_CRM_BILL_PRODUCT_TYPE_DELETE";}
246	8	f	\N	2017-06-02 05:49:22	\N	group.user.crm_bill.product	f	f	a:2:{i:0;s:25:"ROLE_CRM_BILL_PRODUCT_GET";i:1;s:26:"ROLE_CRM_BILL_PRODUCT_CGET";}
247	8	f	\N	2017-06-02 05:49:22	\N	group.admin.crm_bill.product	t	f	a:3:{i:0;s:26:"ROLE_CRM_BILL_PRODUCT_POST";i:1;s:25:"ROLE_CRM_BILL_PRODUCT_PUT";i:2;s:28:"ROLE_CRM_BILL_PRODUCT_DELETE";}
248	8	f	\N	2017-06-02 05:49:22	\N	group.user.crm_bill.quote	f	f	a:2:{i:0;s:23:"ROLE_CRM_BILL_QUOTE_GET";i:1;s:24:"ROLE_CRM_BILL_QUOTE_CGET";}
249	8	f	\N	2017-06-02 05:49:22	\N	group.admin.crm_bill.quote	t	f	a:3:{i:0;s:24:"ROLE_CRM_BILL_QUOTE_POST";i:1;s:23:"ROLE_CRM_BILL_QUOTE_PUT";i:2;s:26:"ROLE_CRM_BILL_QUOTE_DELETE";}
250	8	f	\N	2017-06-02 05:49:22	\N	group.user.crm_bill.bill	f	f	a:2:{i:0;s:22:"ROLE_CRM_BILL_BILL_GET";i:1;s:23:"ROLE_CRM_BILL_BILL_CGET";}
251	8	f	\N	2017-06-02 05:49:22	\N	group.admin.crm_bill.bill	t	f	a:3:{i:0;s:23:"ROLE_CRM_BILL_BILL_POST";i:1;s:22:"ROLE_CRM_BILL_BILL_PUT";i:2;s:25:"ROLE_CRM_BILL_BILL_DELETE";}
252	8	f	\N	2017-06-02 05:49:22	\N	group.user.crm_bill.config	f	f	a:2:{i:0;s:24:"ROLE_CRM_BILL_CONFIG_GET";i:1;s:25:"ROLE_CRM_BILL_CONFIG_CGET";}
253	8	f	\N	2017-06-02 05:49:22	\N	group.admin.crm_bill.config	t	f	a:3:{i:0;s:25:"ROLE_CRM_BILL_CONFIG_POST";i:1;s:24:"ROLE_CRM_BILL_CONFIG_PUT";i:2;s:27:"ROLE_CRM_BILL_CONFIG_DELETE";}
254	8	f	\N	2017-06-02 05:49:23	\N	group.user.crm_hr.cv	f	f	a:2:{i:0;s:19:"ROLE_CRM_HR_CV_CGET";i:1;s:18:"ROLE_CRM_HR_CV_GET";}
255	8	f	\N	2017-06-02 05:49:23	\N	group.admin.crm_hr.cv	t	f	a:3:{i:0;s:19:"ROLE_CRM_HR_CV_POST";i:1;s:18:"ROLE_CRM_HR_CV_PUT";i:2;s:21:"ROLE_CRM_HR_CV_DELETE";}
256	8	f	\N	2017-06-02 05:49:23	\N	group.user.crm_marketing.contact_list	t	f	a:5:{i:0;s:36:"ROLE_CRM_MARKETING_CONTACT_LIST_CGET";i:1;s:35:"ROLE_CRM_MARKETING_CONTACT_LIST_GET";i:2;s:36:"ROLE_CRM_MARKETING_CONTACT_LIST_POST";i:3;s:35:"ROLE_CRM_MARKETING_CONTACT_LIST_PUT";i:4;s:38:"ROLE_CRM_MARKETING_CONTACT_LIST_DELETE";}
257	8	f	\N	2017-06-02 05:49:23	\N	group.user.crm_marketing.campaign	t	f	a:5:{i:0;s:32:"ROLE_CRM_MARKETING_CAMPAIGN_CGET";i:1;s:31:"ROLE_CRM_MARKETING_CAMPAIGN_GET";i:2;s:32:"ROLE_CRM_MARKETING_CAMPAIGN_POST";i:3;s:31:"ROLE_CRM_MARKETING_CAMPAIGN_PUT";i:4;s:34:"ROLE_CRM_MARKETING_CAMPAIGN_DELETE";}
258	8	f	\N	2017-06-02 05:49:23	\N	group.admin.crm_marketing.config	t	f	a:3:{i:0;s:29:"ROLE_CRM_MARKETING_CONFIG_GET";i:1;s:30:"ROLE_CRM_MARKETING_CONFIG_POST";i:2;s:29:"ROLE_CRM_MARKETING_CONFIG_PUT";}
259	9	f	\N	2017-06-02 11:19:32	\N	group.user	f	t	a:0:{}
260	9	f	\N	2017-06-02 11:19:32	\N	group.admin	t	t	a:1:{i:0;s:10:"ROLE_ADMIN";}
261	9	f	\N	2017-06-02 11:19:32	\N	group.admin.core_user.user	t	f	a:3:{i:0;s:24:"ROLE_CORE_USER_USER_POST";i:1;s:23:"ROLE_CORE_USER_USER_PUT";i:2;s:26:"ROLE_CORE_USER_USER_DELETE";}
262	9	f	\N	2017-06-02 11:19:32	\N	group.user.core_user.user	f	f	a:2:{i:0;s:24:"ROLE_CORE_USER_USER_CGET";i:1;s:23:"ROLE_CORE_USER_USER_GET";}
263	9	f	\N	2017-06-02 11:19:32	\N	group.user.core_user.company	f	f	a:1:{i:0;s:26:"ROLE_CORE_USER_COMPANY_GET";}
264	9	f	\N	2017-06-02 11:19:32	\N	group.admin.core_user.company	t	f	a:1:{i:0;s:26:"ROLE_CORE_USER_COMPANY_PUT";}
265	9	f	\N	2017-06-02 11:19:32	\N	group.user.core_customer.address	f	f	a:2:{i:0;s:30:"ROLE_CORE_CUSTOMER_ADDRESS_GET";i:1;s:31:"ROLE_CORE_CUSTOMER_ADDRESS_CGET";}
266	9	f	\N	2017-06-02 11:19:32	\N	group.admin.core_customer.address	t	f	a:3:{i:0;s:31:"ROLE_CORE_CUSTOMER_ADDRESS_POST";i:1;s:30:"ROLE_CORE_CUSTOMER_ADDRESS_PUT";i:2;s:33:"ROLE_CORE_CUSTOMER_ADDRESS_DELETE";}
267	9	f	\N	2017-06-02 11:19:32	\N	group.user.core_customer.contact	f	f	a:2:{i:0;s:30:"ROLE_CORE_CUSTOMER_CONTACT_GET";i:1;s:31:"ROLE_CORE_CUSTOMER_CONTACT_CGET";}
268	9	f	\N	2017-06-02 11:19:32	\N	group.admin.core_customer.contact	t	f	a:3:{i:0;s:31:"ROLE_CORE_CUSTOMER_CONTACT_POST";i:1;s:30:"ROLE_CORE_CUSTOMER_CONTACT_PUT";i:2;s:33:"ROLE_CORE_CUSTOMER_CONTACT_DELETE";}
269	9	f	\N	2017-06-02 11:19:32	\N	group.user.core_customer.customerdemand	f	f	a:2:{i:0;s:37:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_GET";i:1;s:38:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_CGET";}
270	9	f	\N	2017-06-02 11:19:32	\N	group.admin.core_customer.customerdemand	t	f	a:3:{i:0;s:38:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_POST";i:1;s:37:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_PUT";i:2;s:40:"ROLE_CORE_CUSTOMER_CUSTOMERDEMAND_DELETE";}
271	9	f	\N	2017-06-02 11:19:32	\N	group.user.core_customer.customerdemandmessage	f	f	a:2:{i:0;s:44:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_GET";i:1;s:45:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_CGET";}
272	9	f	\N	2017-06-02 11:19:32	\N	group.admin.core_customer.customerdemandmessage	t	f	a:3:{i:0;s:45:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_POST";i:1;s:44:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_PUT";i:2;s:47:"ROLE_CORE_CUSTOMER_CUSTOMERDEMANDMESSAGE_DELETE";}
273	9	f	\N	2017-06-02 11:19:32	\N	group.user.core_customer.firm	f	f	a:2:{i:0;s:27:"ROLE_CORE_CUSTOMER_FIRM_GET";i:1;s:28:"ROLE_CORE_CUSTOMER_FIRM_CGET";}
274	9	f	\N	2017-06-02 11:19:32	\N	group.admin.core_customer.firm	t	f	a:3:{i:0;s:28:"ROLE_CORE_CUSTOMER_FIRM_POST";i:1;s:27:"ROLE_CORE_CUSTOMER_FIRM_PUT";i:2;s:30:"ROLE_CORE_CUSTOMER_FIRM_DELETE";}
275	9	f	\N	2017-06-02 11:19:32	\N	group.user.utils_tag.tag	f	f	a:2:{i:0;s:23:"ROLE_UTILS_TAG_TAG_CGET";i:1;s:22:"ROLE_UTILS_TAG_TAG_GET";}
276	9	f	\N	2017-06-02 11:19:32	\N	group.admin.utils_tag.tag	t	f	a:3:{i:0;s:23:"ROLE_UTILS_TAG_TAG_POST";i:1;s:22:"ROLE_UTILS_TAG_TAG_PUT";i:2;s:25:"ROLE_UTILS_TAG_TAG_DELETE";}
277	9	f	\N	2017-06-02 11:19:32	\N	group.user.crm_bill.product_type	f	f	a:2:{i:0;s:30:"ROLE_CRM_BILL_PRODUCT_TYPE_GET";i:1;s:31:"ROLE_CRM_BILL_PRODUCT_TYPE_CGET";}
278	9	f	\N	2017-06-02 11:19:32	\N	group.admin.crm_bill.product_type	t	f	a:3:{i:0;s:31:"ROLE_CRM_BILL_PRODUCT_TYPE_POST";i:1;s:30:"ROLE_CRM_BILL_PRODUCT_TYPE_PUT";i:2;s:33:"ROLE_CRM_BILL_PRODUCT_TYPE_DELETE";}
279	9	f	\N	2017-06-02 11:19:32	\N	group.user.crm_bill.product	f	f	a:2:{i:0;s:25:"ROLE_CRM_BILL_PRODUCT_GET";i:1;s:26:"ROLE_CRM_BILL_PRODUCT_CGET";}
280	9	f	\N	2017-06-02 11:19:32	\N	group.admin.crm_bill.product	t	f	a:3:{i:0;s:26:"ROLE_CRM_BILL_PRODUCT_POST";i:1;s:25:"ROLE_CRM_BILL_PRODUCT_PUT";i:2;s:28:"ROLE_CRM_BILL_PRODUCT_DELETE";}
281	9	f	\N	2017-06-02 11:19:32	\N	group.user.crm_bill.quote	f	f	a:2:{i:0;s:23:"ROLE_CRM_BILL_QUOTE_GET";i:1;s:24:"ROLE_CRM_BILL_QUOTE_CGET";}
282	9	f	\N	2017-06-02 11:19:32	\N	group.admin.crm_bill.quote	t	f	a:3:{i:0;s:24:"ROLE_CRM_BILL_QUOTE_POST";i:1;s:23:"ROLE_CRM_BILL_QUOTE_PUT";i:2;s:26:"ROLE_CRM_BILL_QUOTE_DELETE";}
283	9	f	\N	2017-06-02 11:19:32	\N	group.user.crm_bill.bill	f	f	a:2:{i:0;s:22:"ROLE_CRM_BILL_BILL_GET";i:1;s:23:"ROLE_CRM_BILL_BILL_CGET";}
284	9	f	\N	2017-06-02 11:19:32	\N	group.admin.crm_bill.bill	t	f	a:3:{i:0;s:23:"ROLE_CRM_BILL_BILL_POST";i:1;s:22:"ROLE_CRM_BILL_BILL_PUT";i:2;s:25:"ROLE_CRM_BILL_BILL_DELETE";}
285	9	f	\N	2017-06-02 11:19:32	\N	group.user.crm_bill.config	f	f	a:2:{i:0;s:24:"ROLE_CRM_BILL_CONFIG_GET";i:1;s:25:"ROLE_CRM_BILL_CONFIG_CGET";}
286	9	f	\N	2017-06-02 11:19:32	\N	group.admin.crm_bill.config	t	f	a:3:{i:0;s:25:"ROLE_CRM_BILL_CONFIG_POST";i:1;s:24:"ROLE_CRM_BILL_CONFIG_PUT";i:2;s:27:"ROLE_CRM_BILL_CONFIG_DELETE";}
287	9	f	\N	2017-06-02 11:19:32	\N	group.user.crm_hr.cv	f	f	a:2:{i:0;s:19:"ROLE_CRM_HR_CV_CGET";i:1;s:18:"ROLE_CRM_HR_CV_GET";}
288	9	f	\N	2017-06-02 11:19:32	\N	group.admin.crm_hr.cv	t	f	a:3:{i:0;s:19:"ROLE_CRM_HR_CV_POST";i:1;s:18:"ROLE_CRM_HR_CV_PUT";i:2;s:21:"ROLE_CRM_HR_CV_DELETE";}
289	9	f	\N	2017-06-02 11:19:32	\N	group.user.crm_marketing.contact_list	t	f	a:5:{i:0;s:36:"ROLE_CRM_MARKETING_CONTACT_LIST_CGET";i:1;s:35:"ROLE_CRM_MARKETING_CONTACT_LIST_GET";i:2;s:36:"ROLE_CRM_MARKETING_CONTACT_LIST_POST";i:3;s:35:"ROLE_CRM_MARKETING_CONTACT_LIST_PUT";i:4;s:38:"ROLE_CRM_MARKETING_CONTACT_LIST_DELETE";}
290	9	f	\N	2017-06-02 11:19:32	\N	group.user.crm_marketing.campaign	t	f	a:5:{i:0;s:32:"ROLE_CRM_MARKETING_CAMPAIGN_CGET";i:1;s:31:"ROLE_CRM_MARKETING_CAMPAIGN_GET";i:2;s:32:"ROLE_CRM_MARKETING_CAMPAIGN_POST";i:3;s:31:"ROLE_CRM_MARKETING_CAMPAIGN_PUT";i:4;s:34:"ROLE_CRM_MARKETING_CAMPAIGN_DELETE";}
291	9	f	\N	2017-06-02 11:19:32	\N	group.admin.crm_marketing.config	t	f	a:3:{i:0;s:29:"ROLE_CRM_MARKETING_CONFIG_GET";i:1;s:30:"ROLE_CRM_MARKETING_CONFIG_POST";i:2;s:29:"ROLE_CRM_MARKETING_CONFIG_PUT";}
\.


--
-- TOC entry 2627 (class 0 OID 77764)
-- Dependencies: 213
-- Data for Name: core_user_group_group; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY core_user_group_group (group_id, sub_group_id) FROM stdin;
1	5
2	3
2	6
3	4
6	5
8	7
2	8
10	9
2	10
12	11
2	12
14	13
2	14
16	15
2	16
18	17
1	17
2	18
20	19
1	18
2	20
22	21
2	22
24	23
2	24
26	25
2	26
28	27
2	28
30	29
2	30
31	35
32	33
32	36
33	34
36	35
38	37
32	38
40	39
32	40
42	41
32	42
44	43
32	44
46	45
32	46
48	47
31	47
32	48
50	49
31	48
32	50
52	51
32	52
54	53
32	54
56	55
32	56
58	57
32	58
60	59
32	60
61	64
61	65
62	63
62	66
63	64
66	65
68	67
62	68
70	69
62	70
72	71
62	72
74	73
62	74
76	75
62	76
78	77
61	77
62	78
80	79
61	78
62	80
82	81
62	82
84	83
62	84
86	85
62	86
88	87
62	88
90	89
62	90
62	91
62	92
62	93
94	97
94	98
95	96
95	99
96	97
99	98
101	100
95	101
103	102
95	103
105	104
95	105
107	106
95	107
109	108
95	109
111	110
94	110
95	111
113	112
94	111
95	113
115	114
95	115
117	116
95	117
119	118
95	119
121	120
95	121
123	122
95	123
95	124
95	125
95	126
127	130
127	131
128	129
128	132
129	130
132	131
134	133
128	134
136	135
128	136
138	137
128	138
140	139
128	140
142	141
128	142
144	143
127	143
128	144
146	145
127	144
128	146
148	147
128	148
150	149
128	150
152	151
128	152
154	153
128	154
156	155
128	156
128	157
128	158
128	159
160	163
160	164
161	162
161	165
162	163
165	164
167	166
161	167
169	168
161	169
171	170
161	171
173	172
161	173
175	174
161	175
177	176
160	176
161	177
179	178
160	177
161	179
181	180
161	181
183	182
161	183
185	184
161	185
187	186
161	187
189	188
161	189
161	190
161	191
161	192
193	196
193	197
194	195
194	198
195	196
198	197
200	199
194	200
202	201
194	202
204	203
194	204
206	205
194	206
208	207
194	208
210	209
193	209
194	210
212	211
193	210
194	212
214	213
194	214
216	215
194	216
218	217
194	218
220	219
194	220
222	221
194	222
194	223
194	224
194	225
226	229
226	230
227	228
227	231
228	229
231	230
233	232
227	233
235	234
227	235
237	236
227	237
239	238
227	239
241	240
227	241
243	242
226	242
227	243
245	244
226	243
227	245
247	246
227	247
249	248
227	249
251	250
227	251
253	252
227	253
255	254
227	255
227	256
227	257
227	258
259	262
259	263
260	261
260	264
261	262
264	263
266	265
260	266
268	267
260	268
270	269
260	270
272	271
260	272
274	273
260	274
276	275
259	275
260	276
278	277
259	276
260	278
280	279
260	280
282	281
260	282
284	283
260	284
286	285
260	286
288	287
260	288
260	289
260	290
260	291
\.


--
-- TOC entry 2690 (class 0 OID 0)
-- Dependencies: 182
-- Name: core_user_group_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('core_user_group_uid_seq', 291, true);


--
-- TOC entry 2630 (class 0 OID 77800)
-- Dependencies: 216
-- Data for Name: core_user_notification; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY core_user_notification (uid, user_uid, deleted, deleted_at, created_at, updated_at, datas, text, type, seen) FROM stdin;
1	\N	f	\N	2016-11-28 16:26:36	\N	a:1:{i:0;C:27:"Core\\UserBundle\\Entity\\User":187:{a:5:{i:0;i:1;i:1;s:10:"admin@cr.m";i:2;s:88:"9mfE4PWeyxHj2JzquuKZPaoiraBxDuoibKailxUxFe78uwFZUSlxrzRDKz2JeczkHugiDjReWDyzWZHnrrXOhQ==";i:3;s:31:"fums1oj72o00k0kccgw480ggscws400";i:4;b:1;}}}	Un nouvel utilisateur s'est inscrit	core_user.user.created	f
2	\N	f	\N	2016-11-29 09:13:16	\N	a:1:{i:0;C:27:"Core\\UserBundle\\Entity\\User":199:{a:5:{i:0;i:2;i:1;s:22:"gabriel+1@class-web.fr";i:2;s:88:"ggBAsMxtKeTTRQ+e1FUQpJnBnfySV1hX4uAj2cSppM+bkPElR3y86rPhs504fO9na2WY7sBPT2ywvQc2ZdrUiA==";i:3;s:31:"i4y95cecf5kww8so8kc0840k4k8800g";i:4;b:0;}}}	Un nouvel utilisateur s'est inscrit	core_user.user.created	f
3	\N	f	\N	2016-11-29 10:38:38	\N	a:1:{i:0;C:27:"Core\\UserBundle\\Entity\\User":199:{a:5:{i:0;i:3;i:1;s:22:"gabriel+2@class-web.fr";i:2;s:88:"vHXpKnTOIWjtkbEQcQ5lbtZewz0wXOvISrQVb/aaWLT5xamD0gSrNR/jtv/vUChpZQ8l1edgwi3BzQmV280ibA==";i:3;s:31:"5j3eyz1dun8k40k4gswc8wcc0s4kcgc";i:4;b:0;}}}	Un nouvel utilisateur s'est inscrit	core_user.user.created	f
4	\N	f	\N	2016-12-20 12:29:52	\N	a:1:{i:0;C:27:"Core\\UserBundle\\Entity\\User":197:{a:5:{i:0;i:4;i:1;s:20:"splenat@class-web.fr";i:2;s:88:"ucQaTiqZ6DO+Emrj10MRikKZKAPzqX7B36RVhcAKHOyRUtHHMwvooqxmPkrviMpZEL47O7g8fa+IAJ5kz1JRog==";i:3;s:31:"poq0ps5jmk0scwgowsgcgkwg8kkgwk0";i:4;b:0;}}}	Un nouvel utilisateur s'est inscrit	core_user.user.created	f
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 184
-- Name: core_user_notification_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('core_user_notification_uid_seq', 4, true);


--
-- TOC entry 2628 (class 0 OID 77771)
-- Dependencies: 214
-- Data for Name: core_user_user; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY core_user_user (uid, company_uid, picture_id, deleted, deleted_at, created_at, updated_at, email, email_canonical, first_name, last_name, phone, nationality, role_label, locale, gender, password, salt, enabled, expired, locked, credentials_expired, confirmation_token, password_requested_at, last_login, roles, phone_validated, phone_code, phone_request_at, random_key) FROM stdin;
8	6	\N	f	\N	2017-05-15 15:07:09	2017-05-15 15:07:09	romainr@class-web.fr	romainr@class-web.fr	Romain	ROUQUET	\N	\N	\N	fr	gender.male	E8j5NYB7sfydpJkk6wn7C+spAsHzaCYKwL5hQP/i4OWH1rkjoOjT7GvHTxBzYyw8xuAdeUKo+vtoxIEp3mNc7w==	azprb9gvcbkg8gg4c4ww8koc04w84gw	f	f	f	f	lpcb9bj2j5cs000os8kogk8ss880ksw	\N	\N	a:1:{i:0;s:9:"ROLE_USER";}	f	\N	\N	7281558976d7ddbd582d13c04f5d69f4
3	2	\N	f	\N	2016-11-29 10:38:38	2017-02-24 16:42:07	gabriel+2@class-web.fr	gabriel+2@class-web.fr	G2	G2		\N	\N	fr	gender.male	kC1ZN99ETQkZmtg9sPejzVi+gmORoNis2cQU0O0lZNLqOJOiQnsFmvkCPqZcT/IsKV5SPCEZQYr7LGu5ANDs2A==	5j3eyz1dun8k40k4gswc8wcc0s4kcgc	t	f	f	f	\N	\N	\N	a:1:{i:0;s:9:"ROLE_USER";}	f	\N	\N	aaeff8499ad76e4a8b47f5ecd6132dfb
4	1	\N	f	\N	2016-12-20 12:29:50	2017-02-24 16:42:07	splenat@class-web.fr	splenat@class-web.fr	Sébastien	Plénat		\N	Président	fr	gender.male	XynIXmzuS8mSX9XosIKRbuFiBB+XVtziBTndw0ZZNnwsPKgx/J39yFv3Kv7W3iCBRdrJLbxmtyWD2togbXNmLQ==	poq0ps5jmk0scwgowsgcgkwg8kkgwk0	t	f	f	f	\N	\N	\N	a:1:{i:0;s:9:"ROLE_USER";}	f	\N	\N	a3eeec940724701c61efcb00c9a99f3a
5	3	\N	f	\N	2017-05-11 11:23:42	2017-05-11 11:23:43	jeremy@class-web.fr	jeremy@class-web.fr	\N	\N	\N	\N	\N	fr	gender.male	0WD1ew5rfOSc+XViU8E7RA7qk4spbPjFtDIZQ8pfd18ojeQBJ+NXBaCHq8gC50qCBeRnIv5x4KsIneVjU6dz+w==	2yvfkt7tp9yc8wkg888gwcow0owokg4	f	f	f	f	2gv2l318mq680os8wcog440ogsg8cwo	\N	\N	a:1:{i:0;s:9:"ROLE_USER";}	f	\N	\N	3b40e19f180399fa10adf097ac161ef7
11	9	\N	f	\N	2017-06-02 11:19:35	2017-06-02 11:19:35	ahmedabdelkarimibrahim@yahoo.fr	ahmedabdelkarimibrahim@yahoo.fr	\N	\N	\N	\N	\N	fr	gender.male	c/Q83/f1R8f/k2vFM5z7fwWuMrAU17h3uCQ/zEnhhJf4TyJb9cVak/JFIY+ySVcXqa1fec6imk1rhoAuC7fZFg==	8c2fdyqnl1ss8c088ss8ckgow4w4kgw	f	f	f	f	nmb41m4peas044ssksokks4swk4okkw	\N	\N	a:1:{i:0;s:9:"ROLE_USER";}	f	\N	\N	bac8b151071d1983f06898106abec4fc
9	7	\N	f	\N	2017-05-15 17:30:57	2017-05-15 17:30:57	romainr+1@class-web.fr	romainr+1@class-web.fr	Romain	ROUQUET	\N	\N	\N	fr	gender.male	c0Kn+Yq1XAvSg/ogLUwoIsRaDKQa0cKKYrhz69j2ySmphpAIWs6K931kAI3Q06SflFffXdEWi2V474fItL7JlA==	8ftw1fimz10cwg0s00o48wgo4kk8480	f	f	f	f	4cf6v8otuwu8ocsg4ck8c00og0c0s84	\N	\N	a:1:{i:0;s:9:"ROLE_USER";}	f	\N	\N	3c65341cd4d267b8eb22ce96b1836256
6	4	\N	f	\N	2017-05-11 14:24:45	2017-05-15 17:34:45	jeremy+1@class-web.fr	jeremy+1@class-web.fr	jeremy	denichere	\N	\N	\N	fr	gender.male	r1NQJzV1o9McCH7kOKfsDZUh5clbMi7vFosdrrARu2Ol/dbxqRLbzbrGwDUD0kUkVk3aeFXKHUPIxbU3G8XjXw==	ls1xv9my1uoks040wg80kog0kc0488g	t	f	f	f	\N	\N	\N	a:1:{i:0;s:9:"ROLE_USER";}	f	\N	\N	a894380128539f549c6432ba3b0e5312
1	1	\N	f	\N	2016-11-28 16:26:36	2017-02-24 16:42:07	admin@cr.m	admin@cr.m	Michel	Admin	\N	\N	\N	fr	gender.male	9mfE4PWeyxHj2JzquuKZPaoiraBxDuoibKailxUxFe78uwFZUSlxrzRDKz2JeczkHugiDjReWDyzWZHnrrXOhQ==	fums1oj72o00k0kccgw480ggscws400	t	f	f	f	\N	\N	\N	a:3:{i:0;s:24:"ROLE_NOTIFICATION_DELETE";i:1;s:24:"ROLE_NOTIFICATION_UPDATE";i:2;s:9:"ROLE_USER";}	f	\N	\N	6b649810c0a95c88ca5979f6e1902612
2	2	\N	f	\N	2016-11-29 09:13:16	2017-02-24 16:42:07	gabriel+1@class-web.fr	gabriel+1@class-web.fr	\N	\N	\N	\N	\N	fr	gender.male	5BHWt7Rl07Rv5MQC2zhfc9UIkeJq+5D1/BVoXOkKlxqRDE9qKLqqSJF55Vs6zwdIUPc15G7aM84d6IuOm9XegQ==	i4y95cecf5kww8so8kc0840k4k8800g	t	f	f	f	\N	\N	\N	a:1:{i:0;s:9:"ROLE_USER";}	f	\N	\N	62b7d4377e83c1b5f3ed0e67413e3b9c
7	5	\N	f	\N	2017-05-11 14:43:01	2017-05-11 14:43:01	jeremy+2@class-web.fr	jeremy+2@class-web.fr	Jérémy	Denichère	\N	\N	\N	fr	gender.male	UCfUk/C+H9l78j1ETJ+izHwvI0JRgGEBEYTDUJWgZULnPyGNheiiyYTcmI5kcOqfEomu6sb5MYnVhE0e4TPKXw==	5qwezcyq984c8kwg8s4o40wgc4gggck	f	f	f	f	cu42atvnw1s08k8ckogk8g0oosokckw	\N	\N	a:1:{i:0;s:9:"ROLE_USER";}	f	\N	\N	47f3f82e459ca9d290d5305c10f0f2cd
10	8	\N	f	\N	2017-06-02 05:49:29	2017-06-02 09:40:48	Ahmedabdelkarimibrahim@yahoo.fr	ahmedabdelkarimibrahim@yahoo.fr	Ahmed	Ibrahim	\N	\N	\N	fr	gender.male	eBUvTOE7i0PktSw9kSGKkL60nLxEyB99c7ZPhzKY50V/mEOynRpPc9ivTLV2jaRc662HxBNkRsrSwn+lZPVoFA==	kmsehyauik0ss8cs0cw0kw0c0o44cok	t	f	f	f	\N	\N	\N	a:1:{i:0;s:9:"ROLE_USER";}	f	\N	\N	9aceb23f53190f4a55eb6fa9621f2e2c
\.


--
-- TOC entry 2629 (class 0 OID 77793)
-- Dependencies: 215
-- Data for Name: core_user_user_group; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY core_user_user_group (user_id, group_id) FROM stdin;
1	29
1	30
1	7
1	8
1	9
1	10
1	11
1	12
1	13
1	14
1	15
1	16
1	19
1	20
1	21
1	22
1	23
1	24
1	25
1	26
1	27
1	28
1	3
1	6
1	1
2	59
2	60
2	37
2	38
2	39
2	40
2	41
2	42
2	43
2	44
2	45
2	46
2	49
2	50
2	51
2	52
2	53
2	54
2	55
2	56
2	57
2	58
2	33
2	36
2	31
3	37
3	38
3	39
3	40
3	41
3	42
3	43
3	44
3	45
3	46
3	49
3	50
3	51
3	52
3	53
3	54
3	55
3	56
3	57
3	58
3	59
3	60
3	33
3	36
3	31
4	29
4	30
4	7
4	8
4	9
4	10
4	11
4	12
4	13
4	14
4	15
4	16
4	19
4	20
4	21
4	22
4	23
4	24
4	25
4	26
4	27
4	3
4	6
4	28
4	1
1	2
2	32
3	32
4	2
5	62
5	61
6	95
6	94
7	128
7	127
8	161
8	160
9	194
9	193
10	227
10	226
11	260
11	259
\.


--
-- TOC entry 2692 (class 0 OID 0)
-- Dependencies: 183
-- Name: core_user_user_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('core_user_user_uid_seq', 11, true);


--
-- TOC entry 2637 (class 0 OID 77898)
-- Dependencies: 223
-- Data for Name: crm_bill_bill; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY crm_bill_bill (uid, company_uid, quote_id, deleted, deleted_at, created_at, updated_at, reference, billing_date, due_for, validated_at, paid, file_path, tax_in_total, is_adjustment, tax_in_adjustment, tax_ex_adjustment, status, accounting_id, deposit, balance, tax_ex_total, quote_percentage, last_reminder_date, sale_date, note) FROM stdin;
1	1	4	f	\N	2017-01-03 15:52:37	2017-04-20 18:44:21	FA-201702-000006	2017-02-14 10:03:47	2017-02-28 00:00:00	2017-02-14 10:04:09	f	\N	5388	f	\N	\N	bill.status.settled	6	t	f	5388	30	\N	2017-02-14 10:03:47	\N
15	1	20	f	\N	2017-09-05 09:32:00	2017-09-05 09:33:23	FA-201709-000011	2017-09-05 09:32:53	2017-09-05 09:32:53	2017-09-05 09:33:23	f	\N	1728	t	\N	\N	bill.status.ready	11	f	t	1440	100	\N	2017-09-05 09:32:53	\N
10	1	11	f	\N	2017-03-24 11:52:15	2017-04-20 18:45:41	FA-201703-000007	2017-03-24 11:52:41	2017-04-23 11:52:41	2017-03-24 11:53:02	f	\N	960	t	0	0	bill.status.settled	7	f	t	800	100	\N	2017-03-24 11:52:41	\N
6	1	2	f	\N	2017-02-01 09:18:32	2017-02-01 09:18:32	-	\N	\N	\N	f	\N	6631.19999999999982	f	\N	\N	bill.status.created	\N	f	t	5526	30	\N	\N	\N
4	1	2	f	\N	2017-02-01 09:18:32	2017-04-26 11:36:21	FA-201702-000003	2017-02-01 09:19:59	2017-02-01 09:19:59	2017-02-01 09:20:29	f	\N	7736.39999999999964	t	0	0	bill.status.ready	3	t	f	6447	35	\N	2017-02-01 09:19:59	
8	1	3	f	\N	2017-02-01 09:22:09	2017-02-01 09:22:09	-	\N	\N	\N	f	\N	6631.19999999999982	f	\N	\N	bill.status.created	\N	f	t	5526	30	\N	\N	\N
3	1	4	f	\N	2017-01-03 15:52:37	2017-04-28 14:56:58	FA-201704-000008	2017-04-28 14:52:57	2017-04-28 14:52:57	2017-04-28 14:53:18	f	\N	5388	f	\N	\N	bill.status.ready	8	f	t	5388	30	\N	2017-04-28 14:52:57	Déjà payé : \n- Facture FA 201701 000001 : 7184 €\n- Facture FA 201702 000006 : 5388 €
11	1	16	f	\N	2017-06-26 10:42:20	2017-06-26 10:42:58	FA-201706-000009	2017-06-26 10:42:49	2017-08-26 10:42:49	2017-06-26 10:42:58	f	\N	13262.3999999999996	t	\N	\N	bill.status.ready	9	f	t	11052	100	\N	2017-06-26 10:42:49	\N
5	1	2	f	\N	2017-02-01 09:18:32	2017-02-01 14:13:56	FA-201702-000002	2017-01-02 00:00:00	2017-01-09 00:00:00	2017-02-01 09:20:04	f	\N	7736.39999999999964	f	\N	\N	bill.status.settled	2	t	f	6447	35	\N	2017-02-01 09:18:22	\N
12	1	17	f	\N	2017-06-26 10:44:14	2017-06-26 10:44:14	-	\N	\N	\N	f	\N	13262.3999999999996	t	\N	\N	bill.status.created	\N	f	t	11052	100	\N	\N	\N
7	1	3	f	\N	2017-02-01 09:22:09	2017-02-01 14:14:23	FA-201702-000004	2017-01-02 00:00:00	2017-01-09 00:00:00	2017-02-01 09:23:01	f	\N	7736.39999999999964	t	0	0	bill.status.settled	4	t	f	6447	35	\N	2017-02-01 09:22:17	\N
9	1	3	f	\N	2017-02-01 09:22:09	2017-02-08 11:59:18	FA-201702-000005	2017-02-01 09:23:08	2017-02-01 09:23:08	2017-02-01 09:23:32	f	\N	7736.39999999999964	f	\N	\N	bill.status.settled	5	t	f	6447	35	\N	2017-02-01 09:23:08	\N
13	1	18	f	\N	2017-06-26 10:51:56	2017-06-26 10:51:56	-	\N	\N	\N	f	\N	13262.3999999999996	t	\N	\N	bill.status.created	\N	f	t	11052	100	\N	\N	\N
2	1	4	f	\N	2017-01-03 15:52:37	2017-04-20 18:43:53	FA-201701-000001	2017-01-03 15:54:17	2017-01-03 15:54:17	2017-01-03 15:54:39	f	\N	7184	t	0	0	bill.status.settled	1	t	f	7184	40	\N	2017-01-03 15:54:17	\N
14	1	19	f	\N	2017-07-18 10:05:34	2017-07-26 11:42:31	FA-201707-000010	2017-07-18 10:05:46	2017-09-16 10:05:46	2017-07-18 10:06:30	f	\N	33504	t	\N	\N	bill.status.ready	10	f	t	27920	100	\N	2017-07-18 10:05:46	Montant déjà réglé : 10 800 € TTC\nRestant dû : 22 704 € TTC
\.


--
-- TOC entry 2693 (class 0 OID 0)
-- Dependencies: 191
-- Name: crm_bill_bill_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('crm_bill_bill_uid_seq', 15, true);


--
-- TOC entry 2634 (class 0 OID 77849)
-- Dependencies: 220
-- Data for Name: crm_bill_company_config; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY crm_bill_company_config (uid, company_uid, bill_prefix_config_id, quote_prefix_config_id, credit_note_prefix_config_id, deleted, deleted_at, created_at, updated_at, terms_of_payment, general_conditions, vat_identifier, put_gcin_bills, after_sale_conditions, g_cdate) FROM stdin;
2	2	4	5	6	f	\N	2016-11-29 09:13:13	\N	\N	\N	\N	f	\N	\N
1	1	1	2	3	f	\N	2016-11-28 16:26:35	2017-03-07 18:12:47	Se reporter à l'article 4 (Prix et modalités de paiement) des CGV.	Conditions générales de vente \n(applicables au 11 Mars 2016)\n\nArticle 1 - Objet des présentes conditions générales\nLes présentes conditions générales ont pour objet de préciser les conditions dans lesquelles le FOURNISSEUR concède à l’UTILISATEUR un droit d’utilisation du PROGICIEL et assure la maintenance dudit PROGICIEL.\n\nArticle 2 - Utilisation du PROGICIEL\nLe PROGICIEL s’adresse à des utilisateurs (confirmés ou non).\nL’UTILISATEUR a testé le PROGICIEL avant la signature du bon de commande.\n\nArticle 3 - Droit d’utilisation\nLe FOURNISSEUR concède à l’UTILISATEUR un droit personnel et non exclusif d’utilisation du PROGICIEL pour ses propres besoins.. L’UTILISATEUR se porte fort du respect des présentes conditions générales par ses personnels et sous-traitants. Le droit d’utilisation est conféré pour la durée des droits de propriété intellectuelle sur le PROGICIEL.\n\nArticle 4 - Prix et modalités de paiement\nEn contrepartie de la licence d’utilisation du PROGICIEL, l’UTILISATEUR s’engage à régler le prix indiqué dans le bon de commande. Le règlement se fera par chèque , prélèvement, carte de crédit ou virement bancaire à réception de la commande. L’UTILISATEUR ne dispose que d’un droit d’utilisation du PROGICIEL et ne sera pas propriétaire de son support.\n\nArticle 5 - Garantie et Maintenance\nLa période de garantie s’étend sur la durée de l’abonnement à compter du jour de la mise en place de la solution pour le client. \nPendant cette période, le Concédant garantit le Licencié contre toute survenance d’anomalies, incidents, erreurs ou défaut de fonctionnement par rapport aux spécifications. Un registre des anomalies et un registre des interventions du Concédant seront tenus à cet effet. Le Concédant s’engage à ce titre à remédier sans frais à l’incident détecté, identifié et reproductible par le Licencié. Cependant, les frais de séjour et de déplacement du personnel qui s’avéreraient nécessaires pour remédier à l’incident seront remboursés au Concédant par le Licencié sur présentation des justificatifs. Si la demande d’intervention est motivée par un incident non imputable au progiciel dans sa version remise par le Concédant, celui-ci facturera, en sus des frais de séjour et déplacement, le temps passé au prix en vigueur chez le Concédant à la date de l’intervention.\nTout service ou assistance non prévu dans le cadre de la maintenance ou du présent contrat devra faire l’objet d’un avenant.\n\nArticle 6 - Résiliation\n6.1 Par le FOURNISSEUR\nLe FOURNISSEUR se réserve la possibilité de résilier unilatéralement et de plein droit la licence d’utilisation et les prestations de maintenance, et ce, sans préjudice de tous dommages et intérêts dans les cas suivants : \n•\tredressement judiciaire ou liquidation de l’UTILISATEUR, sous réserve des conditions prévues par la loi du 25 janvier 1985,\n•\tnon-paiement par l’UTILISATEUR de la redevance d’utilisation, de la licence d’utilisation ou de la redevance de maintenance à chaque échéance contractuelle, pour le compte de l’UTILISATEUR, après une mise en demeure adressée à l’UTILISATEUR par lettre recommandée avec avis de réception et restée sans effet dans un délai de 15 jours,\n•\tatteinte aux droits d’auteur\n En cas de résiliation, l’UTILISATEUR s’engage à procéder, sur chaque poste, à la désinstallation du PROGICIEL si celui-ci a été déployé chez le client.\n\n6.2 Par l’UTILISATEUR\nL’UTILISATEUR peut résilier les prestations à leur échéance annuelle, avec un préavis de 2 mois, par simple notification par lettre recommandée avec avis de réception adressé au FOURNISSEUR.\nArticle 7 - Sous-licence\nL’UTILISATEUR ne pourra utiliser le PROGICIEL que pour ses propres besoins. Il s’interdit à ce titre d’octroyer des sous-licences. L’UTILISATEUR ne pourra concéder, même gratuitement, le droit d’utilisation à des tiers.\n\nArticle 8 - Propriété\nLe PROGICIEL et sa documentation dont il est fait mention à l’article 3, ainsi que toute copie, restent la propriété exclusive du FOURNISSEUR, qui se réserve la qualité d’auteur conformément aux dispositions du code de la propriété intellectuelle. Le PROGICIEL ne peut être cédé, apporté ou transféré sans l’accord du FOURNISSEUR. Le FOURNISSEUR garantit l’UTILISATEUR de toute procédure en contrefaçon qui serait engagée contre lui, à condition toutefois qu’il en soit avisé par écrit et dans les meilleurs délais par l’UTILISATEUR et que le PROGICIEL n’ait pas été modifié par l’UTILISATEUR. La licence accordée par le FOURNISSEUR donne à l’UTILISATEUR le droit d’utilisation du PROGICIEL appartenant au FOURNISSEUR, sur le matériel désigné dans le bon de commande, ce qui implique que :\nL’UTILISATEUR s’engage à n’utiliser ce PROGICIEL que pour ses propres besoins. Il s’interdit de fournir le PROGICIEL sous quelque forme que ce soit ou de le mettre à disposition de quiconque à l’exception de ses employés,\nL’UTILISATEUR s’engage à ne pas développer ou commercialiser le PROGICIEL objet du présent bon de commande ou des produits susceptibles de le concurrencer,\nLe FOURNISSEUR concède à l’UTILISATEUR, à titre personnel, non cessible et non exclusif le droit d’utiliser le PROGICIEL, dans la limite du nombre d’utilisateurs indiqués dans le bon de commande.\n L’UTILISATEUR ne pourra pas modifier le PROGICIEL, ni l’adapter sauf autorisation expresse écrite préalable du FOURNISSEUR.\n L’UTILISATEUR ne pourra corriger les erreurs affectant le PROGICIEL, les parties convenant expressément de réserver cette correction au FOURNISSEUR.\n\nArticle 9 - Incessibilité\nIl est expressément convenu que les droits concédés par le FOURNISSEUR ne peuvent être cédés à un tiers par l’UTILISATEUR. Les droits d’utilisation ne sont pas cessibles, même en cas de cession du fonds, de location-gérance, de fusion ou de toute autre opération au terme de laquelle les droits de l’UTILISATEUR seraient transférés à un tiers.\n\n\nArticle 10 - Matériel\nLe droit d’utilisation du Progiciel est concédé pour le matériel désigné par le Licencié, dont la description figure en annexe X, à l’adresse du site du Licencié. \nLe Licencié est responsable du bon fonctionnement du matériel et de la conformité de son environnement aux spécifications du constructeur. L’utilisation du Progiciel sur tout autre matériel, même exploité par le licencié, est interdite. Toute modification du matériel désigné ou installation supplémentaire au matériel désigné devront faire l’objet d’un avenant entre le Licencié et le Concédant. \nLe droit d’utilisation peut être transféré exceptionnellement et provisoirement sur un matériel de secours d’un des sites du Licencié, si le site ou le matériel du Licencié est temporairement indisponible ou inutilisable. Le cas échéant, le Licencié a l’obligation d’en avertir le Concédant par lettre recommandée avec accusé de réception. En dehors de ce cas, tout transfert du Progiciel sur un site n’appartenant pas au Licencié ou sur un matériel autre que celui désigné en annexe 3 doit faire l’objet de l’accord écrit préalable du Concédant, qui se réserve le droit de refuser le transfert. Dans le cas où le transfert est susceptible de nécessiter une intervention du Concédant, à la charge du Licencié, au titre de l’assistance ou de la maintenance, le Licencié devra en aviser le Concédant par lettre recommandée avec accusé de réception avec un préavis de trois mois. Le Licencié s’engage à détruire, sans délai, le Progiciel et ses copies sur le matériel de secours, en cas d’indisponibilité temporaire, ou sur l’ancien matériel en cas de transfert définitif. A défaut, le Concédant se réserve le droit de facturer le droit de mise à disposition supplémentaire.\n\nArticle 11 - Remise et installation du PROGICIEL\nLe FOURNISSEUR mettra en place un environnement sur ses serveurs ou sur celui de l’UTILISATEUR le PROGICIEL composé des programmes délivrés en langage directement assimilable par l’ordinateur prévu dans la configuration, et sa documentation. En cas de déploiement chez le client, il appartient au responsable du projet désigné par l’UTILISATEUR de s’assurer du bon fonctionnement de celui-ci avant de procéder à sa diffusion sur les autres matériels de l’UTILISATEUR. Le FOURNISSEUR ne pourra être tenu pour responsable des retards causés par l’indisponibilité du matériel désigné ou du personnel devant être fourni par l’UTILISATEUR. \nSi des travaux complémentaires sont demandés par l’UTILISATEUR, ils devront faire l’objet d’une convention séparée.\n L’installation sera réputée réalisée dès l’installation physique du PROGICIEL sur le matériel.\n\nArticle 12 - Copie de sauvegarde\nL’UTILISATEUR ne pourra faire que les copies de sauvegarde s’avérant nécessaires pour son exploitation, à titre de sécurité. Ces copies resteront la propriété du FOURNISSEUR et devront faire l’objet d’un inventaire accessible à ce dernier.\n\nArticle 13 - Divulgation\nLe PROGICIEL fait partie des secrets de fabrication et du savoir-faire du FOURNISSEUR et devra être considéré par L’UTILISATEUR comme une information confidentielle, qu’il puisse ou non être protégé par un droit de propriété intellectuelle, brevet, droit d’auteur, ou d’une autre façon. \nA ce titre, l’UTILISATEUR s’interdit de communiquer le PROGICIEL dans ses versions sources ou exécutables ainsi que les programmes et autres éléments (documentation, etc.) constituant tout ou partie du progiciel. L’UTILISATEUR s’engage également à prendre toutes les mesures nécessaires pour que le PROGICIEL et sa documentation ne soient pas mis à la disposition de tiers et s’engage à ce que ses collaborateurs ou son personnel respectent ces obligations et les droits d’auteur du FOURNISSEUR. L’UTILISATEUR s’engage à prendre toutes les précautions nécessaires pour éviter la divulgation ou la reproduction ou l’utilisation illicite par ses personnels et prestataires, notamment en faisant signer à ces derniers un engagement personnel de confidentialité. L’UTILISATEUR s’interdit d’utiliser les spécifications du PROGICIEL pour créer ou permettre la création d’un programme ayant la même destination. \nDe convention expresse, le FOURNISSEUR est autorisé à vérifier à tout moment le respect de ces obligations. Dans le cas où l’UTILISATEUR ne respecterait pas les obligations mentionnées au présent article, le FOURNISSEUR se réserve le droit de réclamer à l’UTILISATEUR une indemnité d’un montant égal à deux fois le montant correspondant au prix de la redevance d’utilisation pris en charge par l’UTILISATEUR pour son compte et révisé selon l’indice Syntec.\n\nArticle 14 - Modifications\nL’UTILISATEUR s’engage à n’apporter aucune modification aux éléments remis par le FOURNISSEUR, sans l’accord préalable et écrit de celui-ci. Le non respect : de cette clause déchoit l’UTILISATEUR du bénéfice de La garantie et de la maintenance sans que l’UTILISATEUR puisse prétendre à une quelconque indemnité de ce fait.\n\nArticle 15 - Responsabilité\nLe FOURNISSEUR est soumis à une obligation de moyen, à l’exclusion de tout autre. Il garantit la conformité du PROGICIEL aux spécifications décrites dans sa documentation. L’UTILISATEUR assume toutes les responsabilités autres que celle de conformité du PROGICIEL aux spécifications et notamment celles qui concernent :\n-\t l’adéquation du PROGICIEL à ses besoins,\n-\t l’exploitation du PROGICIEL,\n-\t la qualification et la compétence de son personnel. \nEn cas de déploiement chez L’UTILISATEUR, celui-ci est en outre responsable de la protection des données enregistrées et de la réparation des bases de données, des résultats obtenus, de la conformité de l’utilisation du PROGICIEL à la législation et notamment des déclarations auprès de la Commission Nationale pour l’Informatique et les Libertés (CNIL) relatives au traitement informatisé des données nominatives. Le FOURNISSEUR dégage toute responsabilité en cas de non conformité du PROGICIEL à la réglementation en vigueur au cours d’une période donnée si les prestations de maintenance ne sont pas commandées pour cette période. Il appartient à l’UTILISATEUR de développer les procédures d’exploitation et de mettre en place les points de contrôle et mécanismes de sécurité appropriés à la sauvegarde et à la remise en état des données en cas d’anomalies dans le déroulement des programmes.\n L’UTILISATEUR assume seul les éventuels dysfonctionnements et dommages dus à une modification du PROGICIEL, même minime, effectuée avec ou sans l’autorisation du FOURNISSEUR. L’UTILISATEUR reconnaît expressément avoir reçu du FOURNISSEUR toutes les informations nécessaires lui permettant d’apprécier l’adéquation du PROGICIEL à ses besoins et de prendre toutes les précautions utiles pour sa mise en œuvre et son exploitation. Le FOURNISSEUR ne sera en aucun cas tenu de réparer d’éventuels dommages directs ou indirects, même s’il a été informé de tels dommages. L’UTILISATEUR sera seul responsable de l’utilisation du PROGICIEL.\n\nArticle 16 - Litiges\nLe bon de commande et les présentes conditions générales sont soumis à la Loi Française. Tout litige relatif à l’interprétation ou à l’exécution du bon de commande et des présentes conditions générales sera soumis aux tribunaux compétents de Toulouse.\n\nArticle 17 - Intégralité - Non validité partielle\nLe ou les Bons de commande et les présentes conditions générales expriment l’intégralité des obligations des parties. Aucun document ne pourra engendrer d’obligations au titre du présent bon de commande s’il n’est l’objet d’un avenant signé par les parties. Si une ou plusieurs dispositions d’un bon de commande ou des conditions générales sont tenues pour non valides par une loi ou un règlement, ou déclarées telles par décision définitive d’une juridiction compétente, elles seront réputées non écrites, les autres dispositions du présent bon de commande et des présentes conditions générales garderont toute leur force et leur portée.\n\nArticle 18 - Election de domicile\nLes parties élisent domicile, sauf dérogation expresse convenue d’un commun accord, aux adresses de leur siège respectif.	FR46818946923	t	Se reporter à l'article 5 (Garantie et maintenance) des CGV.	\N
3	3	7	8	9	f	\N	2017-05-11 11:23:34	\N	\N	\N	\N	f	\N	\N
4	4	10	11	12	f	\N	2017-05-11 14:24:32	\N	\N	\N	\N	f	\N	\N
5	5	13	14	15	f	\N	2017-05-11 14:42:56	\N	\N	\N	\N	f	\N	\N
6	6	16	17	18	f	\N	2017-05-15 15:07:05	\N	\N	\N	\N	f	\N	\N
7	7	19	20	21	f	\N	2017-05-15 17:30:41	\N	\N	\N	\N	f	\N	\N
8	8	22	23	24	f	\N	2017-06-02 05:49:21	\N	\N	\N	\N	f	\N	\N
9	9	25	26	27	f	\N	2017-06-02 11:19:31	\N	\N	\N	\N	f	\N	\N
\.


--
-- TOC entry 2694 (class 0 OID 0)
-- Dependencies: 188
-- Name: crm_bill_company_config_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('crm_bill_company_config_uid_seq', 9, true);


--
-- TOC entry 2640 (class 0 OID 77942)
-- Dependencies: 226
-- Data for Name: crm_bill_credit_note; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY crm_bill_credit_note (uid, company_uid, bill_id, deleted, deleted_at, created_at, updated_at, reference, amount, unpaid, accounting_id) FROM stdin;
\.


--
-- TOC entry 2695 (class 0 OID 0)
-- Dependencies: 194
-- Name: crm_bill_credit_note_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('crm_bill_credit_note_uid_seq', 1, false);


--
-- TOC entry 2635 (class 0 OID 77864)
-- Dependencies: 221
-- Data for Name: crm_bill_payment; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY crm_bill_payment (uid, company_uid, bill_id, deleted, deleted_at, created_at, updated_at, processed_at, amount, means, note) FROM stdin;
1	1	5	f	\N	2017-02-01 14:13:56	\N	2017-02-01 14:13:36	7736.39999999999964	Virement	\N
2	1	7	f	\N	2017-02-01 14:14:22	\N	2017-02-01 14:14:04	7736.39999999999964	Virement	\N
3	1	9	f	\N	2017-02-08 11:59:17	\N	2017-02-07 00:00:00	7736.39999999999964	Virement	\N
4	1	2	f	\N	2017-04-20 18:43:52	\N	2017-04-20 18:43:23	7184	Virement	\N
5	1	1	f	\N	2017-04-20 18:44:20	\N	2017-02-28 18:44:00	5388	Virement	\N
6	1	10	f	\N	2017-04-20 18:45:41	\N	2017-04-20 18:45:25	960	Chèque	\N
7	1	14	f	\N	2017-07-26 11:35:12	\N	2017-07-26 11:34:45	10800	Chèque	
\.


--
-- TOC entry 2696 (class 0 OID 0)
-- Dependencies: 189
-- Name: crm_bill_payment_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('crm_bill_payment_uid_seq', 7, true);


--
-- TOC entry 2639 (class 0 OID 77934)
-- Dependencies: 225
-- Data for Name: crm_bill_prefix_config; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY crm_bill_prefix_config (uid, company_uid, deleted, deleted_at, created_at, updated_at, prefix, absolute, padding_size, starting_id) FROM stdin;
4	2	f	\N	2016-11-29 09:13:12	\N	FA	f	6	1
5	2	f	\N	2016-11-29 09:13:13	\N	DV	f	6	1
6	2	f	\N	2016-11-29 09:13:13	\N	AV	f	6	1
1	1	f	\N	2016-11-28 16:26:35	2017-03-07 18:12:47	FA	f	6	1
3	1	f	\N	2016-11-28 16:26:35	2017-03-07 18:12:47	AV	f	6	1
2	1	f	\N	2016-11-28 16:26:35	2017-03-07 18:12:47	DV	f	6	1
7	3	f	\N	2017-05-11 11:23:33	\N	FA	f	6	1
8	3	f	\N	2017-05-11 11:23:33	\N	DV	f	6	1
9	3	f	\N	2017-05-11 11:23:33	\N	AV	f	6	1
10	4	f	\N	2017-05-11 14:24:30	\N	FA	f	6	1
11	4	f	\N	2017-05-11 14:24:31	\N	DV	f	6	1
12	4	f	\N	2017-05-11 14:24:32	\N	AV	f	6	1
13	5	f	\N	2017-05-11 14:42:56	\N	FA	f	6	1
14	5	f	\N	2017-05-11 14:42:56	\N	DV	f	6	1
15	5	f	\N	2017-05-11 14:42:56	\N	AV	f	6	1
16	6	f	\N	2017-05-15 15:07:05	\N	FA	f	6	1
17	6	f	\N	2017-05-15 15:07:05	\N	DV	f	6	1
18	6	f	\N	2017-05-15 15:07:05	\N	AV	f	6	1
19	7	f	\N	2017-05-15 17:30:41	\N	FA	f	6	1
20	7	f	\N	2017-05-15 17:30:41	\N	DV	f	6	1
21	7	f	\N	2017-05-15 17:30:41	\N	AV	f	6	1
22	8	f	\N	2017-06-02 05:49:21	\N	FA	f	6	1
23	8	f	\N	2017-06-02 05:49:21	\N	DV	f	6	1
24	8	f	\N	2017-06-02 05:49:21	\N	AV	f	6	1
25	9	f	\N	2017-06-02 11:19:31	\N	FA	f	6	1
26	9	f	\N	2017-06-02 11:19:31	\N	DV	f	6	1
27	9	f	\N	2017-06-02 11:19:31	\N	AV	f	6	1
\.


--
-- TOC entry 2697 (class 0 OID 0)
-- Dependencies: 193
-- Name: crm_bill_prefix_config_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('crm_bill_prefix_config_uid_seq', 27, true);


--
-- TOC entry 2636 (class 0 OID 77877)
-- Dependencies: 222
-- Data for Name: crm_bill_product; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY crm_bill_product (uid, company_uid, product_type_id, quote_id, credit_note_id, deleted, deleted_at, created_at, updated_at, name, description, unit_price, discount, vat, category, enabled, quantity, currency, is_option, rank, selected, purchase_price, accounting_reference, vat_accounting_reference, turnover, margin) FROM stdin;
2	1	\N	1	\N	f	\N	2016-12-20 12:37:08	2016-12-20 15:13:09	Abonnement Annuel	Abonnement Annuel pour un (1) utilisateur	960	0	20	Abonnement	t	1	\N	f	2	f	\N			\N	\N
1	1	\N	1	\N	f	\N	2016-12-20 12:37:08	2016-12-20 15:13:09	Développements Spécifiques CRM	Développements spécifiques sur la base du logiciel Tom en vu de répondre au cahier des charges annexé au devis.	17000	0	20	Développements	t	1	\N	f	1	f	\N			\N	\N
3	1	\N	2	\N	f	\N	2016-12-20 15:37:17	\N	Formation Era	Formation à l'utilisation de l'ERP\n\nFormation d'une journée pour une personne sur l'utilisation de l'ERP.\nLa journée de formation peut être prise en charge par votre OPCA.	300	0	20	Formation	t	1	\N	f	2	f	\N			\N	\N
4	1	\N	2	\N	f	\N	2016-12-20 15:37:17	\N	Era	Intégration du logiciel ERA\n\nIntégration du logiciel ERA au système de vente en ligne du client sur 2 boutiques e-commerce : \n- La boutique du filtre\n- La boutique du tracteur\n\nL'intégration au système du client est réalisée en adéquation avec le cahier des charges validé par le client en date du : 22/06/2016 nommé cahier des charges ERP V1.0.\nS'agissant d'un seul et même logiciel à lier sur les 2 boutiques, la prestation doit obligatoirement se réaliser sur les 2 boutiques, bien que s'agissant de deux devis séparés.	17000	0	20	ERP	t	1	\N	f	1	f	\N			\N	\N
5	1	\N	2	\N	f	\N	2016-12-20 15:37:17	\N	Abonnement annuel	Abonnement annuel à l'ERP	60	0	20	Abonnement	t	12	\N	f	3	f	\N			\N	\N
6	1	\N	2	\N	f	\N	2016-12-20 15:37:17	\N	Licence annuelle	Licence annuelle à l'ERP	400	0	20	Licence Era	t	1	\N	f	4	f	\N			\N	\N
8	1	\N	3	\N	f	\N	2016-12-20 15:42:00	\N	Abonnement annuel	Abonnement annuel à l'ERP	60	0	20	Abonnement	t	12	\N	f	3	f	\N			\N	\N
9	1	\N	3	\N	f	\N	2016-12-20 15:42:00	\N	Formation Era	Formation à l'utilisation de l'ERP\n\nFormation d'une journée pour une personne sur l'utilisation de l'ERP.\nLa journée de formation peut être prise en charge par votre OPCA.	300	0	20	Formation	t	1	\N	f	2	f	\N			\N	\N
10	1	\N	3	\N	f	\N	2016-12-20 15:42:00	\N	Era	Intégration du logiciel ERA\n\nIntégration du logiciel ERA au système de vente en ligne du client sur 2 boutiques e-commerce : \n- La boutique du filtre\n- La boutique du tracteur\n\nL'intégration au système du client est réalisée en adéquation avec le cahier des charges validé par le client en date du : 22/06/2016 nommé cahier des charges ERP V1.0.\nS'agissant d'un seul et même logiciel à lier sur les 2 boutiques, la prestation doit obligatoirement se réaliser sur les 2 boutiques, bien que s'agissant de deux devis séparés.	17000	0	20	ERP	t	1	\N	f	1	f	\N			\N	\N
7	1	\N	3	\N	f	\N	2016-12-20 15:42:00	\N	Licence annuelle	Licence annuelle à l'ERP	400	0	20	Licence Era	t	1	\N	f	4	f	\N			\N	\N
12	1	\N	4	\N	f	\N	2016-12-20 16:48:45	2016-12-20 16:50:09	Développements Spécifiques CRM	Développements spécifiques sur la base du logiciel Tom en vu de répondre au cahier des charges annexé au devis.	17000	0	0	Développements	t	1	\N	f	1	f	\N			\N	\N
11	1	\N	4	\N	f	\N	2016-12-20 16:48:45	2016-12-20 16:50:09	Abonnement Annuel	Abonnement Annuel pour un (1) utilisateur	960	0	0	Abonnement	t	1	\N	f	2	f	\N			\N	\N
13	1	\N	5	\N	f	\N	2017-01-06 12:36:38	\N	Développement spécifique	Création d'un module permettant la répartition des paiements entre chaque commerçant concerné par la commande.	2700	0	20	Dev	t	1	\N	f	1	f	\N			\N	\N
14	1	\N	6	\N	f	\N	2017-01-23 17:07:22	2017-01-23 17:10:02	Tom CRM	Abonnement annuel au CRM Tom avec les fonctionnalités présentes lors des tests client de décembre 2016.\nEngagement de 12 mois avec tacite reconduction.	40	0	20	CRM	t	12	\N	f	1	f	\N			\N	\N
15	1	\N	7	\N	t	2017-04-18 11:32:29	2017-03-07 17:40:02	2017-03-24 12:20:21	CRM	Modifications du site prestashop aequitas et modifications du CRM lié suivant le cahier des charges qui nous a été fourni par mail le 21/02/2017 nommé : "SPECIFICATIONS TECHNIQUES RENDUES NECESSAIRES PAR LES EVOLUTIONS DECIDEES PAR AEQUITAS ET APPLICABLES A COMPTER DU 1 ER AVRIL 2017"\n\n+ Développement pour une reise à zéro des comptes globaux au 31 octobre de chaque année.\n\n\n\n	17000	0	20	Développements	t	1	\N	f	1	f	1660	411aequitas	445710	17000	15340
18	1	\N	8	\N	f	\N	2017-03-09 10:04:41	2017-03-28 10:46:15	La boutique du filtre	Création du site internet la boutique du filtre en symfony : \n- Création de la charte graphique\n- Intégration de la charte graphique\n- Développements spécifiques \n- Référencement naturel\n- Reprise et intégration du contenu depuis le site existant vers la version symfony\n- Redirection des fiches produit actuelles vers les nouvelles\n- Maintenance à vie incluse dans l'abonnement à la plateforme\n\nLe site web sera géré sur la même plateforme que la boutique du tracteur, et les logiciels liés.\n\nLes frais et abonnements nécessaires au fonctionnement du site (comme le TPE) ne peuvent être pris en compte dans le devis, et seront à régler directement auprès des prestataires concernés.	15000	0	20	E-commerce	t	1	\N	f	2	f	4200	411tracteur	445710	15000	10800
20	1	\N	9	\N	f	\N	2017-03-14 17:07:06	2017-03-14 17:13:00	Era	Développement de fonctionnalités personnalisées sur le logiciel ERA (ERP) en vu de répondre de manière précise et exhaustive quant aux fonctionnalités nécessaires dans le process de production du client. \nL'ERP permettra au client de gérer parfaitement sa production et également la partie commercialisation de son activité. \nL'ERP permettra de gérer les stocks des 2 boutiques physiques et également les stocks du site de vente en ligne.	17000	0	20	ERP	t	1	\N	f	3	f	10000	411mozaic	445710	17000	7000
31	1	\N	10	\N	f	\N	2017-03-17 11:40:47	2017-03-20 11:10:47	Intégration du CRM	Intégration du CRM dans l'ERP.	10000	0	20	Fusion	t	1	\N	f	2	f	3000	411tracteur	445710	10000	7000
22	1	\N	9	\N	f	\N	2017-03-14 17:07:06	2017-03-14 17:13:00	Audit	Diagnostique des besoins numériques de l'entreprise. Bilan permettant d'orienter et conseiller l'entreprise et débouchant sur une proposition de stratégie numérique à mettre en oeuvre. Analyse de la situation numérique de l'entreprise, analyse du processus de fabrication et de commercialisation, production d'un rapport permettant de mettre en oeuvre une stratégie de développement numérique adaptée.	3000	0	20	Audit	t	1	\N	f	1	f	300	401mozaic	445710	3000	2700
21	1	\N	9	\N	f	\N	2017-03-14 17:07:06	2017-03-14 17:13:00	Shop	Création et développement d'un site de vente en ligne permettant au client de posséder un nouveau canal de distribution, tout en intégrant celui-ci dans la stratégie commerciale déployée en amont par le client.	3000	0	20	Ecommerce	t	1	\N	f	2	f	300		445710	3000	2700
45	1	\N	10	\N	t	2017-03-17 12:05:30	2017-03-17 12:01:32	2017-03-17 12:01:32	Nouvelle prestation	La nouvelle prestation	50	0	20	Infogérance	t	1	\N	f	9	f	\N		445710	50	1
19	1	\N	9	\N	f	\N	2017-03-14 17:07:06	2017-03-14 17:13:00	Tom	Déploiement de la solution TOM (CRM) ayant pour but la valorisation de la gestion client et la facturation. Les fonctionnalités suivantes seront déployées : \n- Gestion des clients / prospects \n- Devis & Facturation \n- Gestion des utilisateurs	3000	0	20	CRM	t	1	\N	f	4	f	300	411mozaic	445710	3000	2700
23	1	\N	9	\N	f	\N	2017-03-14 17:13:00	2017-03-14 17:13:00	Abonnement Era	Abonnement annuel à la solution ERP Era.\nPour un utilisateur.	120	0	20	Abonnement	t	12	\N	f	5	f	300	411mozaic	445710	1440	-2160
24	1	\N	9	\N	f	\N	2017-03-14 17:13:00	2017-03-14 17:13:00	Abonnement Tom	Abonnement annuel au logiciel Tom pour un utilisateur.	40	0	20	Abonnement	t	12	\N	f	6	f	40	411mozaic	445710	480	0
30	1	\N	10	\N	f	\N	2017-03-17 11:40:46	2017-03-20 11:10:47	Boutique du tracteur	Création du site internet la boutique du tracteur en Prestashop : \n- Création de la charte graphique\n- Intégration de la charte graphique\n- Développements spécifiques \n- Référencement naturel\n- Reprise et intégration du contenu depuis le site existant vers la version prestashop\n- Redirection des fiches produit actuelles vers les nouvelles	25000	0	20	E-commerce	t	1	\N	f	1	f	10000	411tracteur	445710	25000	15000
29	1	\N	8	\N	f	\N	2017-03-17 11:12:57	2017-03-28 10:46:13	Import des données	Export des données depuis Octave.\nIntervention sur les fichiers afin de les rendre compatible.\nImport des fichiers dans la solution.	5000	0	20	Import	t	1	\N	f	5	f	2000	411tracteur	445710	5000	3000
26	1	\N	8	\N	f	\N	2017-03-17 11:10:17	2017-03-28 10:46:13	Blogs liés aux boutiques	Création des blogs liés.\n\n- Création des chartes graphiques\n- Intégration des chartes graphiques\n- Référencement naturel\n\nCréation et intégration des blogs dans les 2 boutiques.\nLes clients auront ainsi un blog intégré dans chaque boutique, permettant ainsi une conservation du panier qu'il soit sur la partie shop ou la partie blog.	5000	0	20	Blog	t	1	\N	f	4	f	3000	411tracteur	445710	5000	2000
48	1	\N	10	\N	t	2017-03-17 12:11:22	2017-03-17 12:10:48	2017-03-17 12:10:49	Produit test	Un produit test	50	0	20	Formation	t	1	\N	f	9	f	\N		445710	50	1
32	1	\N	10	\N	f	\N	2017-03-17 11:40:47	2017-03-20 11:10:47	Laison CRM Prestashop	Liaison des fonctionnalités du CRM aux sites Prestashop nécessitant des développements spécifiques sur Prestashop et sur le CRM.	6000	0	20	Fusion	t	1	\N	f	3	f	3000	411tracteur	445710	6000	3000
17	1	\N	8	\N	f	\N	2017-03-09 10:04:41	2017-03-28 10:46:12	Formation	Formation utilisateur pour 5 personnes sur la plateforme digitale tout en un.	8000	0	20	Formation	t	1	\N	f	6	f	600	411tracteur	445710	8000	7400
33	1	\N	10	\N	f	\N	2017-03-17 11:40:47	2017-03-20 11:10:47	Import données Octave	Export des données depuis Octave vers l'ERP et vers Prestashop.\n\nCorrections sur les fichiers exportés.\nImport des données\nIntervention sur les bases de données Prestashop	6000	0	20	Fusion	t	1	\N	f	4	f	3000		445710	6000	3000
27	1	\N	8	\N	f	\N	2017-03-17 11:10:17	2017-03-28 10:46:12	Intégration du CRM dans l'ERP	Intégration du CRM dans l'ERP (comprend la licence à vie)	8000	0	20	Fusion	t	1	\N	f	3	f	3000		445710	8000	5000
50	1	\N	10	\N	t	2017-03-17 12:41:37	2017-03-17 12:12:53	2017-03-17 12:39:38	Test 3	\N	200	0	20	Fusion	t	1	\N	f	9	f	\N		445710	200	1
54	1	\N	10	\N	f	\N	2017-03-17 12:47:50	2017-03-20 11:10:48	Maintenance annuelle	- Correction des bugs Prestashop\n- Evolution de Prestashop\n- MAJ de Prestashop\n- MAJ de sécurité\n- MAJ des modules	8500	0	20	tma	t	1	\N	f	9	f	\N		445710	8500	1
55	1	\N	10	\N	f	\N	2017-03-20 11:07:49	2017-03-20 11:10:48	Abonnement annuel (ERP + CRM)	Abonnement annuel à l'ERP + CRM	120	0	20	Abonnement	t	12	\N	f	10	f	600	411tracteur	445710	1440	-5760
95	1	\N	14	\N	f	\N	2017-06-06 15:30:10	2017-06-06 15:37:59	Attribution des ventes	Attribution des ventes et store locator en fonction des ventes + génération automatique d'appel à facture	2400	0	20	Développements	t	1	\N	f	1	f	1800	411olivierclaire	445710	2400	600
37	1	\N	10	\N	f	\N	2017-03-17 11:50:42	2017-03-20 11:10:47	Infogérance annuelle	Infogérance du serveur sur lequel est hébergé la solution Prestashop.	1800	0	20	Infogérance	t	1	\N	f	8	f	500	411tracteur	445710	1800	1300
34	1	\N	10	\N	f	\N	2017-03-17 11:50:41	2017-03-20 11:10:48	Formation	Formation utilisateur pour 5 personnes	8000	0	20	Formation	t	1	\N	f	6	f	1000	411tracteur	445710	8000	7000
35	1	\N	10	\N	f	\N	2017-03-17 11:50:41	2017-03-20 11:10:47	Hébergement annuel	Hébergement annuel pour les boutiques Prestashop.\nServeur dédié OVH SP 128	1900	0	20	Hébergement	t	1	\N	f	7	f	1700	411tracteur	445710	1900	200
67	1	\N	7	\N	f	\N	2017-04-18 11:47:55	2017-04-18 11:55:07	CRM	 Suppression des lots de cartes	1300	0	20	CRM	t	1	\N	f	7	f	280	411aequitas	445710	1300	1020
86	1	\N	7	\N	f	\N	2017-04-18 11:52:43	2017-04-18 11:55:07	Web	Nouvelle page d'accueil	700	0	20	Web	t	1	\N	f	14	f	140	411aequitas	445710	700	560
57	1	\N	11	\N	f	\N	2017-03-24 10:58:56	2017-03-24 10:58:56	Site Internet	Refonte du site internet voyance-par-telephone-immediate.fr/	1000	20	20	Site vitrine	t	1	\N	f	1	f	300	411sylvievoyance	445710	800	500
61	1	\N	12	\N	f	\N	2017-03-29 19:34:03	2017-04-18 11:31:24	Hébergement	- Contrat annuel \n- Le taux de disponibilité garanti est de 99,9 % par mois\n- Serveur en cloud\n- Langage PHP version 5.5 et php.ini personnalisable\n- Nombre de bases de données et d’utilisateurs illimités\n- Base de données Mysql 5\n- Nombre de boîtes emails illimitées\n- Support IMAP, Pop3, Smtp\n- Accès webmail\n- Nombre de domaines et sous-domaines illimités\n- Gestion des domaines externes\n- Accès distant FTP, SSH\nLe Prestataire se reverse le droit après soumission au Client de modifier les caractéristiques et tarifs de l’hébergement si nécessaire afin d’assurer le bon fonctionnement des sites internet et leurs évolutions.\n	100	0	20	Hébergement	t	1	\N	f	3	f	10	411frambourg	445710	100	90
16	1	\N	8	\N	f	\N	2017-03-09 10:04:41	2017-03-28 10:46:12	La boutique du tracteur	Création et intégration du back office et des fonctionnalités liées au sites de vente en ligne dans la plateforme digitale : (10K)\n- La boutique du tracteur\n- La boutique du filtre\n\nCréation du site internet la boutique du tracteur en symfony : (24K)\n- Création de la charte graphique\n- Intégration de la charte graphique\n- Développements spécifiques \n- Référencement naturel\n- Reprise et intégration du contenu depuis le site existant vers la version symfony\n- Redirection des fiches produit actuelles vers les nouvelles\n- Maintenance à vie incluse dans l'abonnement à la plateforme\n	34000	0	20	E-commerce	t	1	\N	f	1	f	25200	411tracteur	445710	34000	8800
58	1	\N	12	\N	f	\N	2017-03-29 19:34:03	2017-04-18 11:31:24	Création site institutionnel	- Intégration des contenus fournis par le client (textes, photos et vidéos)\n- Un slider, une présentation des services, une présentation de la société et une présentation du personnel. \n- Design du site moderne et épuré \n	1500	0	20	Site vitrine	t	1	\N	f	1	f	50	411frambourg	445710	1500	1450
56	1	\N	8	\N	f	\N	2017-03-20 11:09:31	2017-03-28 10:46:15	Abonnement annuel Plateforme	Abonnement annuel à la plateforme digitale : \n- ERP\n- CRM\n- Sites web ecommerce\n- Blogs	120	0	20	Abonnement	t	12	\N	f	7	f	60	411tracteur	445710	1440	720
59	1	\N	12	\N	f	\N	2017-03-29 19:34:03	2017-04-18 11:31:24	Formation	Formation d'une demi journée pour une personne pour l'utilisation du site internet dans les locaux du client.	350	0	20	Formation	t	1	\N	f	4	f	100	411frambourg	445710	350	250
74	1	\N	7	\N	f	\N	2017-04-18 11:47:56	2017-04-18 11:55:07	CRM	Commission VP	1900	0	20	CRM	t	1	\N	f	10	f	420	411aequitas	445710	1900	1480
87	1	\N	7	\N	f	\N	2017-04-18 11:53:27	2017-04-18 11:55:07	Web	 Inscription en direct (avec Fidelpass)	1900	0	20	Web	t	1	\N	f	15	f	420	411aequitas	445710	1900	1480
70	1	\N	7	\N	f	\N	2017-04-18 11:47:56	2017-04-18 11:55:08	CRM	Suppression de R0	500	0	20	CRM	t	1	\N	f	8	f	70	411aequitas	445710	500	430
72	1	\N	7	\N	f	\N	2017-04-18 11:47:56	2017-04-18 11:55:08	CRM	Mensualisation des BAO	1900	0	20	CRM	t	1	\N	f	9	f	420	411aequitas	445710	1900	1480
91	1	1	13	\N	f	\N	2017-04-24 16:01:00	2017-04-24 16:01:00	Abonnement Tom	Abonnement au logiciel Tom pour un utilisateur avec engagement de 12 mois disposant des fonctionnalités suivantes : \nParamètrages personnalisés de la société utilisatrice\n\n- Facturation\nDevis; Factures; Avoirs; Stats produits; Stats catégories; Configuration\nAvec export des factures, des devis et des avoirs\n\n- Gestion clients\nAjout, suppression et modification de contacts; liste des entreprises; gestion des labels (prospect, client...); Configuration\n\n- RH\nCréation et gestion des CV reçus\n\n- Gestion des utilisateurs\n	40	0	20	Abonnement 	t	12	\N	f	2	f	40	411pse33	445710	480	0
71	1	\N	7	\N	f	\N	2017-04-18 11:47:56	2017-04-18 11:55:08	CRM	Codes promo ambassadeur	700	0	20	CRM	t	1	\N	f	12	f	140	411aequitas	445710	700	560
90	1	2	13	\N	f	\N	2017-04-24 16:01:00	2017-04-24 16:01:00	Déploiement du CRM	Déploiement du CRM sur nos serveurs et création des accès distants pour le client.\n\nCela n'inclut pas les éventuelles liaisons que Let'sGo pourrait être amenée à réaliser afin que le CRM communique avec un site internet.\nLes passerelles feront le cas échéant l'objet d'un devis supplémentaire.	250	0	20	Déploiement	t	1	\N	f	1	f	20	411pse33	445710	250	230
73	1	\N	7	\N	f	\N	2017-04-18 11:47:56	2017-04-18 11:55:08	CRM	Nouveau râteau PA pour VIP	1300	0	20	CRM	t	1	\N	f	11	f	280	411aequitas	445710	1300	1020
69	1	\N	7	\N	f	\N	2017-04-18 11:47:56	2017-04-18 11:55:08	CRM	Nouveaux types de cartes	700	0	20	CRM	t	1	\N	f	6	f	140	411aequitas	445710	700	560
89	1	\N	7	\N	f	\N	2017-04-18 11:55:08	2017-04-18 11:55:08	Web	Code promo ambassadeur	700	0	20	Web	t	1	\N	f	17	f	140	411aequitas	445710	700	560
88	1	\N	7	\N	f	\N	2017-04-18 11:54:16	2017-04-18 11:55:07	Web	Rattachement des ambassadeurs par région	1900	0	20	Web	t	1	\N	f	16	f	420	411aequitas	445710	1900	1480
85	1	\N	7	\N	f	\N	2017-04-18 11:51:54	2017-04-18 11:55:07	Web	Pages publiques/privées	1300	0	20	Web	t	1	\N	f	13	f	280	411aequitas	445710	1300	1020
102	1	\N	15	\N	f	\N	2017-06-26 10:31:39	2017-06-26 10:31:39	Abonnement annuel	Abonnement annuel à l'ERP	60	0	20	Abonnement	t	12	\N	f	3	f	\N			720	1
103	1	\N	15	\N	f	\N	2017-06-26 10:31:39	2017-06-26 10:31:39	Licence annuelle	Licence annuelle à l'ERP	400	0	20	Licence Era	t	1	\N	f	4	f	\N			400	1
93	1	\N	14	\N	t	2017-06-06 15:33:53	2017-06-06 15:30:10	2017-06-06 15:30:43	Abonnement au CRM	Abonnement au logiciel Tom pour un utilisateur avec engagement de 12 mois disposant des fonctionnalités suivantes : \nParamètrages personnalisés de la société utilisatrice\n\n- Facturation\nDevis; Factures; Avoirs; Stats produits; Stats catégories; Configuration\nAvec export des factures, des devis et des avoirs\n\n- Gestion clients\nAjout, suppression et modification de contacts; liste des entreprises; gestion des labels (prospect, client...); Configuration\n\n- RH\nCréation et gestion des CV reçus\n\n- Gestion des utilisateurs\n- Hébergement \n- Maintennace	80	0	20	Abonnement	t	1	\N	f	2	f	40	411olivierclaire	445710	80	40
105	1	\N	15	\N	f	\N	2017-06-26 10:31:39	2017-06-26 10:31:39	Formation Era	Formation à l'utilisation de l'ERP\n\nFormation d'une journée pour une personne sur l'utilisation de l'ERP.\nLa journée de formation peut être prise en charge par votre OPCA.	300	0	20	Formation	t	1	\N	f	1	f	\N			300	1
104	1	\N	15	\N	f	\N	2017-06-26 10:31:39	2017-06-26 10:31:39	Era	Intégration du logiciel ERA\n\nIntégration du logiciel ERA au système de vente en ligne du client sur 2 boutiques e-commerce : \n- La boutique du filtre\n- La boutique du tracteur\n\nL'intégration au système du client est réalisée en adéquation avec le cahier des charges validé par le client en date du : 22/06/2016 nommé cahier des charges ERP V1.0.\nS'agissant d'un seul et même logiciel à lier sur les 2 boutiques, la prestation doit obligatoirement se réaliser sur les 2 boutiques, bien que s'agissant de deux devis séparés.	17000	0	20	ERP	t	1	\N	f	2	f	\N			17000	1
100	1	\N	14	\N	f	\N	2017-06-06 15:37:30	2017-06-06 15:37:59	Abonnement au CRM 	Abonnement au logiciel Tom pour un utilisateur avec engagement de 12 mois disposant des fonctionnalités suivantes : \nParamètrages personnalisés de la société utilisatrice\n\n- Facturation\nDevis; Factures; Avoirs; Stats produits; Stats catégories; Configuration\nAvec export des factures, des devis et des avoirs\n\n- Gestion clients\nAjout, suppression et modification de contacts; liste des entreprises; gestion des labels (prospect, client...); Configuration\n\n- RH\nCréation et gestion des CV reçus\n\n- Gestion des utilisateurs\n	80	0	20	Abonnement	t	12	\N	f	2	f	\N	411olivierclaire	445710	960	1
106	1	\N	16	\N	f	\N	2017-06-26 10:42:01	2017-06-26 10:42:01	ERP	Finalisation de la mise en place et du déploiement du logiciel ERP.	11052	0	20	ERP	t	1	\N	f	1	f	\N	411tracteur	445710	11052	1
107	1	\N	17	\N	f	\N	2017-06-26 10:43:54	2017-06-26 10:43:54	ERP	Finalisation de la mise en place et du déploiement du logiciel ERP.	11052	0	20	ERP	t	1	\N	f	1	f	\N	411tracteur	445710	11052	1
111	1	\N	19	\N	f	\N	2017-07-18 10:04:17	2017-07-18 10:04:17	Era	Développement de fonctionnalités personnalisées sur le logiciel ERA (ERP) en vu de répondre de manière précise et exhaustive quant aux fonctionnalités nécessaires dans le process de production du client. \nL'ERP permettra au client de gérer parfaitement sa production et également la partie commercialisation de son activité. \nL'ERP permettra de gérer les stocks des 2 boutiques physiques et également les stocks du site de vente en ligne.	17000	0	20	ERP	t	1	\N	f	1	f	10000	411mozaic	445710	17000	7000
110	1	\N	19	\N	f	\N	2017-07-18 10:04:17	2017-07-18 10:04:17	Audit	Diagnostique des besoins numériques de l'entreprise. Bilan permettant d'orienter et conseiller l'entreprise et débouchant sur une proposition de stratégie numérique à mettre en oeuvre. Analyse de la situation numérique de l'entreprise, analyse du processus de fabrication et de commercialisation, production d'un rapport permettant de mettre en oeuvre une stratégie de développement numérique adaptée.	3000	0	20	Audit	t	1	\N	f	2	f	300	401mozaic	445710	3000	2700
108	1	\N	18	\N	f	\N	2017-06-26 10:51:04	2017-06-26 10:51:38	ERP	Livraison de l'ERP	11052	0	20	ERP	t	1	\N	f	1	f	\N	411tracteur	445710	11052	1
109	1	\N	19	\N	f	\N	2017-07-18 10:04:17	2017-07-18 10:04:17	Shop	Création et développement d'un site de vente en ligne permettant au client de posséder un nouveau canal de distribution, tout en intégrant celui-ci dans la stratégie commerciale déployée en amont par le client.	3000	0	20	Ecommerce	t	1	\N	f	3	f	300		445710	3000	2700
112	1	\N	19	\N	f	\N	2017-07-18 10:04:18	2017-07-18 10:04:18	Abonnement Tom	Abonnement annuel au logiciel Tom pour un utilisateur.	40	0	20	Abonnement	t	12	\N	f	6	f	40	411mozaic	445710	480	0
113	1	\N	19	\N	f	\N	2017-07-18 10:04:18	2017-07-18 10:04:18	Abonnement Era	Abonnement annuel à la solution ERP Era.\nPour un utilisateur.	120	0	20	Abonnement	t	12	\N	f	5	f	300	411mozaic	445710	1440	-2160
114	1	\N	19	\N	f	\N	2017-07-18 10:04:18	2017-07-18 10:04:18	Tom	Déploiement de la solution TOM (CRM) ayant pour but la valorisation de la gestion client et la facturation. Les fonctionnalités suivantes seront déployées : \n- Gestion des clients / prospects \n- Devis & Facturation \n- Gestion des utilisateurs	3000	0	20	CRM	t	1	\N	f	4	f	300	411mozaic	445710	3000	2700
115	1	3	20	\N	f	\N	2017-09-05 09:30:45	2017-09-05 09:30:45	Abonnement Annuel Era 	Abonnement annuel à l'ERP Era pour 1 utilisateur	120	0	20	Abonnement	t	12	\N	f	1	f	120	411tracteur	445710	1440	0
\.


--
-- TOC entry 2638 (class 0 OID 77921)
-- Dependencies: 224
-- Data for Name: crm_bill_product_type; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY crm_bill_product_type (uid, company_uid, deleted, deleted_at, created_at, updated_at, name, description, unit_price, discount, vat, category, enabled, purchase_price, accounting_reference, vat_accounting_reference) FROM stdin;
2	1	f	\N	2017-04-24 16:00:59	\N	Déploiement du CRM	Déploiement du CRM sur nos serveurs et création des accès distants pour le client.\n\nCela n'inclut pas les éventuelles liaisons que Let'sGo pourrait être amenée à réaliser afin que le CRM communique avec un site internet.\nLes passerelles feront le cas échéant l'objet d'un devis supplémentaire.	250	0	20	Déploiement	t	20	411pse33	445710
1	1	f	\N	2017-04-24 16:00:59	\N	Abonnement Tom	Abonnement au logiciel Tom pour un utilisateur avec engagement de 12 mois disposant des fonctionnalités suivantes : \nParamètrages personnalisés de la société utilisatrice\n\n- Facturation\nDevis; Factures; Avoirs; Stats produits; Stats catégories; Configuration\nAvec export des factures, des devis et des avoirs\n\n- Gestion clients\nAjout, suppression et modification de contacts; liste des entreprises; gestion des labels (prospect, client...); Configuration\n\n- RH\nCréation et gestion des CV reçus\n\n- Gestion des utilisateurs\n	40	0	20	Abonnement 	t	40	411pse33	445710
3	1	f	\N	2017-09-05 09:30:44	\N	Abonnement Annuel Era 	Abonnement annuel à l'ERP Era pour 1 utilisateur	120	0	20	Abonnement	t	120	411tracteur	445710
\.


--
-- TOC entry 2698 (class 0 OID 0)
-- Dependencies: 192
-- Name: crm_bill_product_type_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('crm_bill_product_type_uid_seq', 3, true);


--
-- TOC entry 2699 (class 0 OID 0)
-- Dependencies: 190
-- Name: crm_bill_product_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('crm_bill_product_uid_seq', 115, true);


--
-- TOC entry 2641 (class 0 OID 77953)
-- Dependencies: 227
-- Data for Name: crm_bill_quote; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY crm_bill_quote (uid, company_uid, contact_uid, user_id, deleted, deleted_at, created_at, updated_at, reference, status, valid_until, project_name, excluding_taxes_discount, including_taxes_discount, note, terms_of_payment, sent_at, tax_totals, project_start_date, duration, duration_unit, recurrence, first_billing_date, periodicity, period_count, next_recurrent_date, last_renewal_date, accounting_id, discount_conditions, after_sale_conditions, validated_at) FROM stdin;
5	1	7	4	f	\N	2017-01-06 12:36:37	2017-01-23 17:08:00	DV-201701-000005	quote.status.sent	2017-02-06 12:36:30	Vis ta lomagne	0	0	Exécution du contrat en fonction de l'attribution de l'appel d'offre sur la refonte du site internet.	Se reporter à l'article 4 (Prix et modalités de paiement) des CGV.	\N	N;	2017-01-06 12:33:44	6	crm_bill.duration.week	quote.recurrence.one_time	\N	crm_bill.periodicity.month	6	\N	\N	5	Pas d'escompte.	Se reporter à l'article 5 (Garantie et maintenance) des CGV.	\N
1	1	3	4	f	\N	2016-12-20 12:37:05	2016-12-20 15:13:08	DV-201612-000001	quote.status.draft	2017-01-20 15:13:05	Dream Life	0	0	Le devis a été établi en fonction du cahier des charges et des questions s'y rapportant. Documents joints en annexes du présent devis.\n40 % à la commande\n30 % au 15 janvier 2017\nSolde à la livraison	Se reporter à l'article 4 (Prix et modalités de paiement) des CGV.	\N	N;	2016-12-20 12:33:26	7	crm_bill.duration.week	quote.recurrence.one_time	\N	crm_bill.periodicity.month	6	\N	\N	1	Escompte pour paiement anticipé : Néant	Se reporter à l'article 5 (Garantie et maintenance) des CGV.	\N
4	1	6	4	f	\N	2016-12-20 16:48:44	2017-01-03 15:52:34	DV-201612-000004	quote.status.validated	2017-01-20 16:50:05	Dream Life	0	0	Le devis a été établi en fonction du cahier des charges et des questions s'y rapportant. Documents joints en annexes du présent devis.\n40 % à la commande\n30 % au 15 janvier 2017\nSolde à la livraison	Exonération TVA, art. 262 ter-I du code général des impôts.\nSe reporter à l'article 4 (Prix et modalités de paiement) des CGV.	\N	N;	2016-12-20 12:33:26	7	crm_bill.duration.week	quote.recurrence.one_time	\N	crm_bill.periodicity.month	6	\N	\N	4	Escompte pour paiement anticipé : Néant	Se reporter à l'article 5 (Garantie et maintenance) des CGV.	\N
2	1	4	4	f	\N	2016-12-20 15:37:16	2017-02-01 09:18:30	DV-201612-000002	quote.status.validated	2017-01-20 15:37:13	La boutique du tracteur	0	0	35 % au 23/12/2016\n35 % au 23/01/2017\nSolde à la livraison	Se reporter à l'article 4 (Prix et modalités de paiement) des CGV.	\N	N;	2016-12-20 15:29:54	10	crm_bill.duration.week	quote.recurrence.one_time	\N	crm_bill.periodicity.month	6	\N	\N	2	Escompte néant	Se reporter à l'article 5 (Garantie et maintenance) des CGV.	\N
3	1	5	4	f	\N	2016-12-20 15:41:59	2017-02-01 09:22:08	DV-201612-000003	quote.status.validated	2017-01-20 15:41:56	La boutique du filtre	0	0	35 % au 23/12/2016\n35 % au 23/01/2017\nSolde à la livraison	Se reporter à l'article 4 (Prix et modalités de paiement) des CGV.	\N	N;	2016-12-20 15:29:54	10	crm_bill.duration.week	quote.recurrence.one_time	\N	crm_bill.periodicity.month	6	\N	\N	3	Escompte néant	Se reporter à l'article 5 (Garantie et maintenance) des CGV.	\N
12	1	11	4	f	\N	2017-03-29 19:34:02	2017-04-18 20:41:26	DV-201703-000012	quote.status.sent	2017-05-18 11:31:12	Neckebroeck	0	0	\N	Se reporter à l'article 4 (Prix et modalités de paiement) des CGV.	2017-04-18 20:41:26	N;	2017-03-29 19:26:07	1	crm_bill.duration.month	quote.recurrence.one_time	\N	crm_bill.periodicity.month	6	\N	\N	12	\N	Se reporter à l'article 5 (Garantie et maintenance) des CGV.	\N
8	1	4	4	f	\N	2017-03-09 10:04:40	2017-03-28 10:46:08	DV-201703-000008	quote.status.sent	2017-04-28 10:46:01	Plateforme digitale tout en un	10	0	\N	Se reporter à l'article 4 (Prix et modalités de paiement) des CGV.	2017-03-09 10:11:03	N;	2017-03-09 09:47:35	3	crm_bill.duration.month	quote.recurrence.recurrent	\N	crm_bill.periodicity.month	6	\N	\N	8	\N	Se reporter à l'article 5 (Garantie et maintenance) des CGV.	\N
6	1	8	4	f	\N	2017-01-23 17:07:20	2017-04-18 20:44:53	DV-201701-000006	quote.status.refused	2017-02-23 17:09:51	Bilobia	0	0	Ouverture des accès après règlement de la première mensualité.\nLes mensualités suivantes doivent être réglées par virement ou prélèvement.	Se reporter à l'article 4 (Prix et modalités de paiement) des CGV.	2017-02-26 15:08:46	N;	2017-01-23 17:03:32	1	crm_bill.duration.month	quote.recurrence.recurrent	\N	crm_bill.periodicity.month	6	\N	\N	6	Pas d'escompte	Se reporter à l'article 5 (Garantie et maintenance) des CGV.	\N
11	1	10	4	f	\N	2017-03-24 10:58:55	2017-03-24 11:52:13	DV-201703-000011	quote.status.validated	2017-04-24 10:58:42	Sylvie Voyance	0	0	\N	Se reporter à l'article 4 (Prix et modalités de paiement) des CGV.	2017-03-24 11:52:01	N;	2017-03-24 10:54:44	2	crm_bill.duration.week	quote.recurrence.one_time	\N	crm_bill.periodicity.month	6	\N	\N	11	\N	Se reporter à l'article 5 (Garantie et maintenance) des CGV.	2017-03-24 11:52:13
7	1	3	4	f	\N	2017-03-07 17:39:59	2017-04-18 11:55:06	DV-201703-000007	quote.status.sent	2017-05-18 11:54:59	Aequitas 3.0	0	0	\N	Se reporter à l'article 4 (Prix et modalités de paiement) des CGV.	2017-03-09 10:11:12	N;	2017-03-07 17:33:19	7	crm_bill.duration.week	quote.recurrence.recurrent	\N	crm_bill.periodicity.month	6	\N	\N	7	\N	Se reporter à l'article 5 (Garantie et maintenance) des CGV.	\N
13	1	12	1	f	\N	2017-04-24 16:00:57	\N	DV-201704-000013	quote.status.draft	2017-05-24 16:00:50	PSE33	0	0	\N	Se reporter à l'article 4 (Prix et modalités de paiement) des CGV.	\N	N;	2017-04-24 15:50:19	1	crm_bill.duration.week	quote.recurrence.one_time	\N	crm_bill.periodicity.month	6	\N	\N	13	\N	Se reporter à l'article 5 (Garantie et maintenance) des CGV.	\N
9	1	9	4	f	\N	2017-03-14 17:07:05	2017-07-18 09:58:50	DV-201703-000009	quote.status.validated	2017-04-14 17:12:54	Mozaic café	0	0	\N	Se reporter à l'article 4 (Prix et modalités de paiement) des CGV.	2017-03-14 17:07:18	N;	2016-11-25 16:57:22	3	crm_bill.duration.month	quote.recurrence.recurrent	2017-04-28 15:19:42	crm_bill.periodicity.month	3	2017-07-28 15:19:42	2017-07-28 15:19:42	9	\N	Se reporter à l'article 5 (Garantie et maintenance) des CGV.	2017-06-06 15:21:12
10	1	4	4	f	\N	2017-03-17 11:40:46	2017-03-24 12:20:54	DV-201703-000010	quote.status.sent	2017-04-20 11:10:40	Tracteur PS + Inté CRM	0	0	\N	Se reporter à l'article 4 (Prix et modalités de paiement) des CGV.	2017-03-24 12:20:54	N;	2017-03-17 11:27:17	3	crm_bill.duration.month	quote.recurrence.recurrent	\N	crm_bill.periodicity.month	6	\N	\N	10	\N	Se reporter à l'article 5 (Garantie et maintenance) des CGV.	\N
15	1	4	1	f	\N	2017-06-26 10:31:35	2017-06-26 10:32:40	DV-201706-000015	quote.status.refused	2017-07-26 10:31:28	La boutique du tracteur	0	0	35 % au 23/12/2016\n35 % au 23/01/2017\nSolde à la livraison	Se reporter à l'article 4 (Prix et modalités de paiement) des CGV.	2017-06-26 10:31:54	N;	2016-12-20 15:29:54	10	crm_bill.duration.week	quote.recurrence.one_time	\N	crm_bill.periodicity.month	6	\N	\N	15	Escompte néant	Se reporter à l'article 5 (Garantie et maintenance) des CGV.	\N
14	1	13	1	f	\N	2017-06-06 15:30:08	2017-06-06 15:37:58	DV-201706-000014	quote.status.draft	2017-07-06 15:37:57	Olivier Claire	0	0	\N	Se reporter à l'article 4 (Prix et modalités de paiement) des CGV.	\N	N;	2017-06-06 15:22:13	1	crm_bill.duration.month	quote.recurrence.one_time	\N	crm_bill.periodicity.month	6	\N	\N	14	\N	Se reporter à l'article 5 (Garantie et maintenance) des CGV.	\N
16	1	4	4	f	\N	2017-06-26 10:39:30	2017-06-26 10:42:18	DV-201706-000016	quote.status.validated	2017-07-26 10:42:00	Boutique du tracteur	0	0	35 % au 23/12/2016\n35 % au 23/01/2017\nSolde à la livraison	Se reporter à l'article 4 (Prix et modalités de paiement) des CGV.	2017-06-26 10:42:07	N;	2016-12-20 15:29:54	10	crm_bill.duration.week	quote.recurrence.one_time	\N	crm_bill.periodicity.month	6	\N	\N	16	Escompte néant	Se reporter à l'article 5 (Garantie et maintenance) des CGV.	2017-06-26 10:42:18
19	1	9	4	f	\N	2017-07-18 10:04:12	2017-07-18 10:05:30	DV-201707-000019	quote.status.validated	2017-08-18 10:04:05	Mozaic	0	0	\N	Se reporter à l'article 4 (Prix et modalités de paiement) des CGV.	2017-07-18 10:04:52	N;	2016-11-25 16:57:22	3	crm_bill.duration.month	quote.recurrence.one_time	\N	crm_bill.periodicity.month	3	\N	\N	19	\N	Se reporter à l'article 5 (Garantie et maintenance) des CGV.	2017-07-18 10:05:30
17	1	4	1	f	\N	2017-06-26 10:43:53	2017-06-26 10:44:14	DV-201706-000017	quote.status.validated	2017-07-26 10:43:53	Boutique du tracteur	0	0	35 % au 23/12/2016\n35 % au 23/01/2017\nSolde à la livraison	Se reporter à l'article 4 (Prix et modalités de paiement) des CGV.	2017-06-26 10:44:03	N;	2016-12-20 15:29:54	10	crm_bill.duration.week	quote.recurrence.one_time	\N	crm_bill.periodicity.month	6	\N	\N	17	Escompte néant	Se reporter à l'article 5 (Garantie et maintenance) des CGV.	2017-06-26 10:44:14
20	1	5	1	f	\N	2017-09-05 09:30:43	2017-09-05 09:31:59	DV-201709-000020	quote.status.validated	2017-10-05 09:30:39	Boutique filtre	0	0	\N	Se reporter à l'article 4 (Prix et modalités de paiement) des CGV.	2017-09-05 09:31:21	N;	2017-09-05 09:28:40	1	crm_bill.duration.week	quote.recurrence.one_time	\N	crm_bill.periodicity.month	6	\N	\N	20	\N	Se reporter à l'article 5 (Garantie et maintenance) des CGV.	2017-09-05 09:31:59
18	1	4	4	f	\N	2017-06-26 10:51:03	2017-06-26 10:51:56	DV-201706-000018	quote.status.validated	2017-07-26 10:51:37	Boutique tracteur	0	0	\N	Se reporter à l'article 4 (Prix et modalités de paiement) des CGV.	2017-06-26 10:51:14	N;	2016-12-13 10:48:53	12	crm_bill.duration.week	quote.recurrence.one_time	\N	crm_bill.periodicity.month	6	\N	\N	18	\N	Se reporter à l'article 5 (Garantie et maintenance) des CGV.	2017-06-26 10:51:56
\.


--
-- TOC entry 2700 (class 0 OID 0)
-- Dependencies: 195
-- Name: crm_bill_quote_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('crm_bill_quote_uid_seq', 20, true);


--
-- TOC entry 2642 (class 0 OID 77974)
-- Dependencies: 228
-- Data for Name: crm_hr_cv_document; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY crm_hr_cv_document (uid, company_uid, pdf_id, deleted, deleted_at, created_at, updated_at, first_name, last_name, age, email, phone, job_search, receipt_date, reception_method, talk_date, email_response_type, status, random_key) FROM stdin;
\.


--
-- TOC entry 2701 (class 0 OID 0)
-- Dependencies: 196
-- Name: crm_hr_cv_document_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('crm_hr_cv_document_uid_seq', 1, false);


--
-- TOC entry 2651 (class 0 OID 86447)
-- Dependencies: 237
-- Data for Name: crm_marketing_campaign; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY crm_marketing_campaign (uid, company_uid, contact_list_uid, deleted, deleted_at, created_at, updated_at, mailchimp_id, title, subject, from_name, reply_to, mailchimp_url) FROM stdin;
\.


--
-- TOC entry 2702 (class 0 OID 0)
-- Dependencies: 232
-- Name: crm_marketing_campaign_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('crm_marketing_campaign_uid_seq', 1, false);


--
-- TOC entry 2652 (class 0 OID 86465)
-- Dependencies: 238
-- Data for Name: crm_marketing_config; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY crm_marketing_config (uid, company_uid, deleted, deleted_at, created_at, updated_at, access_token, api_endpoint, meta) FROM stdin;
\.


--
-- TOC entry 2703 (class 0 OID 0)
-- Dependencies: 233
-- Name: crm_marketing_config_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('crm_marketing_config_uid_seq', 1, false);


--
-- TOC entry 2653 (class 0 OID 86478)
-- Dependencies: 239
-- Data for Name: crm_marketing_contact_list; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY crm_marketing_contact_list (uid, company_uid, tag_id, deleted, deleted_at, created_at, updated_at, name, mailchimp_id) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 86488)
-- Dependencies: 240
-- Data for Name: crm_marketing_contact_list_contact; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY crm_marketing_contact_list_contact (list_id, contact_id) FROM stdin;
\.


--
-- TOC entry 2704 (class 0 OID 0)
-- Dependencies: 234
-- Name: crm_marketing_contact_list_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('crm_marketing_contact_list_uid_seq', 1, false);


--
-- TOC entry 2650 (class 0 OID 86436)
-- Dependencies: 236
-- Data for Name: crm_marketing_contact_meta; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY crm_marketing_contact_meta (uid, company_uid, contact_uid, contact_list_uid, deleted, deleted_at, created_at, updated_at, mailchimp_id) FROM stdin;
\.


--
-- TOC entry 2705 (class 0 OID 0)
-- Dependencies: 231
-- Name: crm_marketing_contact_meta_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('crm_marketing_contact_meta_uid_seq', 1, false);


--
-- TOC entry 2643 (class 0 OID 86411)
-- Dependencies: 229
-- Data for Name: doctrine_migration_versions; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY doctrine_migration_versions (version) FROM stdin;
20170120142627
20170214103324
20170214111424
20170308131806
\.


--
-- TOC entry 2658 (class 0 OID 88508)
-- Dependencies: 244
-- Data for Name: utils_faq_category; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY utils_faq_category (uid, deleted, deleted_at, created_at, updated_at, title) FROM stdin;
\.


--
-- TOC entry 2706 (class 0 OID 0)
-- Dependencies: 242
-- Name: utils_faq_category_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('utils_faq_category_uid_seq', 1, false);


--
-- TOC entry 2657 (class 0 OID 88497)
-- Dependencies: 243
-- Data for Name: utils_faq_entry; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY utils_faq_entry (uid, category, deleted, deleted_at, created_at, updated_at, question, answer) FROM stdin;
\.


--
-- TOC entry 2707 (class 0 OID 0)
-- Dependencies: 241
-- Name: utils_faq_entry_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('utils_faq_entry_uid_seq', 1, false);


--
-- TOC entry 2632 (class 0 OID 77829)
-- Dependencies: 218
-- Data for Name: utils_note_note; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY utils_note_note (uid, company_uid, deleted, deleted_at, created_at, updated_at, text) FROM stdin;
1	1	f	\N	2016-11-28 16:26:35	\N	
2	2	f	\N	2016-11-29 09:13:12	\N	
3	3	f	\N	2017-05-11 11:23:31	\N	
4	4	f	\N	2017-05-11 14:24:29	\N	
5	5	f	\N	2017-05-11 14:42:56	\N	
6	6	f	\N	2017-05-15 15:07:05	\N	
7	7	f	\N	2017-05-15 17:30:40	\N	
8	8	f	\N	2017-06-02 05:49:19	\N	
9	9	f	\N	2017-06-02 11:19:31	\N	
\.


--
-- TOC entry 2708 (class 0 OID 0)
-- Dependencies: 186
-- Name: utils_note_note_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('utils_note_note_uid_seq', 9, true);


--
-- TOC entry 2633 (class 0 OID 77838)
-- Dependencies: 219
-- Data for Name: utils_tag_tag; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY utils_tag_tag (uid, company_uid, deleted, deleted_at, created_at, updated_at, label, color, white_text, category) FROM stdin;
\.


--
-- TOC entry 2709 (class 0 OID 0)
-- Dependencies: 187
-- Name: utils_tag_tag_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('utils_tag_tag_uid_seq', 1, false);


--
-- TOC entry 2251 (class 2606 OID 77575)
-- Name: core_admin_module_admin_group_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_admin_module_admin_group
    ADD CONSTRAINT core_admin_module_admin_group_pkey PRIMARY KEY (module_id, group_id);


--
-- TOC entry 2244 (class 2606 OID 77562)
-- Name: core_admin_module_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_admin_module
    ADD CONSTRAINT core_admin_module_pkey PRIMARY KEY (uid);


--
-- TOC entry 2247 (class 2606 OID 77568)
-- Name: core_admin_module_user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_admin_module_user_group
    ADD CONSTRAINT core_admin_module_user_group_pkey PRIMARY KEY (module_id, group_id);


--
-- TOC entry 2374 (class 2606 OID 86432)
-- Name: core_admin_user_module_config_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_admin_user_module_config
    ADD CONSTRAINT core_admin_user_module_config_pkey PRIMARY KEY (uid);


--
-- TOC entry 2255 (class 2606 OID 77588)
-- Name: core_cms_picture_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_cms_picture
    ADD CONSTRAINT core_cms_picture_pkey PRIMARY KEY (uid);


--
-- TOC entry 2285 (class 2606 OID 77686)
-- Name: core_customer_address_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_customer_address
    ADD CONSTRAINT core_customer_address_pkey PRIMARY KEY (uid);


--
-- TOC entry 2276 (class 2606 OID 77661)
-- Name: core_customer_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_customer_contact
    ADD CONSTRAINT core_customer_contact_pkey PRIMARY KEY (uid);


--
-- TOC entry 2281 (class 2606 OID 77669)
-- Name: core_customer_contact_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_customer_contact_tag
    ADD CONSTRAINT core_customer_contact_tag_pkey PRIMARY KEY (contact_id, tag_id);


--
-- TOC entry 2265 (class 2606 OID 77628)
-- Name: core_customer_demand_message_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_customer_demand_message
    ADD CONSTRAINT core_customer_demand_message_pkey PRIMARY KEY (uid);


--
-- TOC entry 2271 (class 2606 OID 77643)
-- Name: core_customer_demand_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_customer_demand
    ADD CONSTRAINT core_customer_demand_pkey PRIMARY KEY (uid);


--
-- TOC entry 2257 (class 2606 OID 77609)
-- Name: core_customer_firm_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_customer_firm
    ADD CONSTRAINT core_customer_firm_pkey PRIMARY KEY (uid);


--
-- TOC entry 2261 (class 2606 OID 77616)
-- Name: core_customer_firm_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_customer_firm_tag
    ADD CONSTRAINT core_customer_firm_tag_pkey PRIMARY KEY (firm_id, tag_id);


--
-- TOC entry 2288 (class 2606 OID 77717)
-- Name: core_oauth_server_access_token_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_oauth_server_access_token
    ADD CONSTRAINT core_oauth_server_access_token_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 77749)
-- Name: core_oauth_server_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_oauth_server_auth_code
    ADD CONSTRAINT core_oauth_server_auth_code_pkey PRIMARY KEY (id);


--
-- TOC entry 2293 (class 2606 OID 77728)
-- Name: core_oauth_server_client_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_oauth_server_client
    ADD CONSTRAINT core_oauth_server_client_pkey PRIMARY KEY (id);


--
-- TOC entry 2295 (class 2606 OID 77737)
-- Name: core_oauth_server_refresh_token_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_oauth_server_refresh_token
    ADD CONSTRAINT core_oauth_server_refresh_token_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 77826)
-- Name: core_user_company_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_user_company
    ADD CONSTRAINT core_user_company_pkey PRIMARY KEY (uid);


--
-- TOC entry 2308 (class 2606 OID 77768)
-- Name: core_user_group_group_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_user_group_group
    ADD CONSTRAINT core_user_group_group_pkey PRIMARY KEY (group_id, sub_group_id);


--
-- TOC entry 2305 (class 2606 OID 77762)
-- Name: core_user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_user_group
    ADD CONSTRAINT core_user_group_pkey PRIMARY KEY (uid);


--
-- TOC entry 2320 (class 2606 OID 77809)
-- Name: core_user_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_user_notification
    ADD CONSTRAINT core_user_notification_pkey PRIMARY KEY (uid);


--
-- TOC entry 2316 (class 2606 OID 77797)
-- Name: core_user_user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_user_user_group
    ADD CONSTRAINT core_user_user_group_pkey PRIMARY KEY (user_id, group_id);


--
-- TOC entry 2312 (class 2606 OID 77790)
-- Name: core_user_user_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_user_user
    ADD CONSTRAINT core_user_user_pkey PRIMARY KEY (uid);


--
-- TOC entry 2349 (class 2606 OID 77918)
-- Name: crm_bill_bill_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_bill_bill
    ADD CONSTRAINT crm_bill_bill_pkey PRIMARY KEY (uid);


--
-- TOC entry 2333 (class 2606 OID 77859)
-- Name: crm_bill_company_config_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_bill_company_config
    ADD CONSTRAINT crm_bill_company_config_pkey PRIMARY KEY (uid);


--
-- TOC entry 2359 (class 2606 OID 77950)
-- Name: crm_bill_credit_note_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_bill_credit_note
    ADD CONSTRAINT crm_bill_credit_note_pkey PRIMARY KEY (uid);


--
-- TOC entry 2339 (class 2606 OID 77874)
-- Name: crm_bill_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_bill_payment
    ADD CONSTRAINT crm_bill_payment_pkey PRIMARY KEY (uid);


--
-- TOC entry 2356 (class 2606 OID 77940)
-- Name: crm_bill_prefix_config_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_bill_prefix_config
    ADD CONSTRAINT crm_bill_prefix_config_pkey PRIMARY KEY (uid);


--
-- TOC entry 2343 (class 2606 OID 77893)
-- Name: crm_bill_product_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_bill_product
    ADD CONSTRAINT crm_bill_product_pkey PRIMARY KEY (uid);


--
-- TOC entry 2353 (class 2606 OID 77932)
-- Name: crm_bill_product_type_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_bill_product_type
    ADD CONSTRAINT crm_bill_product_type_pkey PRIMARY KEY (uid);


--
-- TOC entry 2363 (class 2606 OID 77970)
-- Name: crm_bill_quote_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_bill_quote
    ADD CONSTRAINT crm_bill_quote_pkey PRIMARY KEY (uid);


--
-- TOC entry 2368 (class 2606 OID 77987)
-- Name: crm_hr_cv_document_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_hr_cv_document
    ADD CONSTRAINT crm_hr_cv_document_pkey PRIMARY KEY (uid);


--
-- TOC entry 2384 (class 2606 OID 86462)
-- Name: crm_marketing_campaign_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_marketing_campaign
    ADD CONSTRAINT crm_marketing_campaign_pkey PRIMARY KEY (uid);


--
-- TOC entry 2388 (class 2606 OID 86476)
-- Name: crm_marketing_config_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_marketing_config
    ADD CONSTRAINT crm_marketing_config_pkey PRIMARY KEY (uid);


--
-- TOC entry 2395 (class 2606 OID 86492)
-- Name: crm_marketing_contact_list_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_marketing_contact_list_contact
    ADD CONSTRAINT crm_marketing_contact_list_contact_pkey PRIMARY KEY (list_id, contact_id);


--
-- TOC entry 2391 (class 2606 OID 86485)
-- Name: crm_marketing_contact_list_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_marketing_contact_list
    ADD CONSTRAINT crm_marketing_contact_list_pkey PRIMARY KEY (uid);


--
-- TOC entry 2379 (class 2606 OID 86443)
-- Name: crm_marketing_contact_meta_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_marketing_contact_meta
    ADD CONSTRAINT crm_marketing_contact_meta_pkey PRIMARY KEY (uid);


--
-- TOC entry 2372 (class 2606 OID 86415)
-- Name: doctrine_migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);


--
-- TOC entry 2402 (class 2606 OID 88517)
-- Name: utils_faq_category_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY utils_faq_category
    ADD CONSTRAINT utils_faq_category_pkey PRIMARY KEY (uid);


--
-- TOC entry 2400 (class 2606 OID 88506)
-- Name: utils_faq_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY utils_faq_entry
    ADD CONSTRAINT utils_faq_entry_pkey PRIMARY KEY (uid);


--
-- TOC entry 2328 (class 2606 OID 77836)
-- Name: utils_note_note_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY utils_note_note
    ADD CONSTRAINT utils_note_note_pkey PRIMARY KEY (uid);


--
-- TOC entry 2331 (class 2606 OID 77847)
-- Name: utils_utils_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY utils_tag_tag
    ADD CONSTRAINT utils_utils_tag_pkey PRIMARY KEY (uid);


--
-- TOC entry 2296 (class 1259 OID 77739)
-- Name: idx_11d77dfd19eb6921; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_11d77dfd19eb6921 ON core_oauth_server_refresh_token USING btree (client_id);


--
-- TOC entry 2297 (class 1259 OID 77740)
-- Name: idx_11d77dfda76ed395; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_11d77dfda76ed395 ON core_oauth_server_refresh_token USING btree (user_id);


--
-- TOC entry 2326 (class 1259 OID 77837)
-- Name: idx_13e4bc745768826e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_13e4bc745768826e ON utils_note_note USING btree (company_uid);


--
-- TOC entry 2364 (class 1259 OID 77971)
-- Name: idx_181fa8e25768826e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_181fa8e25768826e ON crm_bill_quote USING btree (company_uid);


--
-- TOC entry 2365 (class 1259 OID 77973)
-- Name: idx_181fa8e2a76ed395; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_181fa8e2a76ed395 ON crm_bill_quote USING btree (user_id);


--
-- TOC entry 2366 (class 1259 OID 77972)
-- Name: idx_181fa8e2aea1673e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_181fa8e2aea1673e ON crm_bill_quote USING btree (contact_uid);


--
-- TOC entry 2344 (class 1259 OID 77895)
-- Name: idx_1b69f2f614959723; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_1b69f2f614959723 ON crm_bill_product USING btree (product_type_id);


--
-- TOC entry 2345 (class 1259 OID 77897)
-- Name: idx_1b69f2f61c696f7a; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_1b69f2f61c696f7a ON crm_bill_product USING btree (credit_note_id);


--
-- TOC entry 2346 (class 1259 OID 77894)
-- Name: idx_1b69f2f65768826e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_1b69f2f65768826e ON crm_bill_product USING btree (company_uid);


--
-- TOC entry 2347 (class 1259 OID 77896)
-- Name: idx_1b69f2f6db805178; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_1b69f2f6db805178 ON crm_bill_product USING btree (quote_id);


--
-- TOC entry 2248 (class 1259 OID 77569)
-- Name: idx_1c37f865afc2b591; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_1c37f865afc2b591 ON core_admin_module_user_group USING btree (module_id);


--
-- TOC entry 2249 (class 1259 OID 77570)
-- Name: idx_1c37f865fe54d947; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_1c37f865fe54d947 ON core_admin_module_user_group USING btree (group_id);


--
-- TOC entry 2389 (class 1259 OID 86477)
-- Name: idx_1fa0fb7c5768826e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_1fa0fb7c5768826e ON crm_marketing_config USING btree (company_uid);


--
-- TOC entry 2357 (class 1259 OID 77941)
-- Name: idx_332d5b9a5768826e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_332d5b9a5768826e ON crm_bill_prefix_config USING btree (company_uid);


--
-- TOC entry 2277 (class 1259 OID 77662)
-- Name: idx_357267825768826e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_357267825768826e ON core_customer_contact USING btree (company_uid);


--
-- TOC entry 2278 (class 1259 OID 77664)
-- Name: idx_3572678289af7860; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_3572678289af7860 ON core_customer_contact USING btree (firm_id);


--
-- TOC entry 2321 (class 1259 OID 77810)
-- Name: idx_389003f4b88d678d; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_389003f4b88d678d ON core_user_notification USING btree (user_uid);


--
-- TOC entry 2369 (class 1259 OID 77988)
-- Name: idx_39c62f495768826e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_39c62f495768826e ON crm_hr_cv_document USING btree (company_uid);


--
-- TOC entry 2334 (class 1259 OID 77862)
-- Name: idx_3e949f7d10538fa2; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_3e949f7d10538fa2 ON crm_bill_company_config USING btree (quote_prefix_config_id);


--
-- TOC entry 2335 (class 1259 OID 77861)
-- Name: idx_3e949f7d41b0534f; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_3e949f7d41b0534f ON crm_bill_company_config USING btree (bill_prefix_config_id);


--
-- TOC entry 2336 (class 1259 OID 77863)
-- Name: idx_3e949f7d510caa1a; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_3e949f7d510caa1a ON crm_bill_company_config USING btree (credit_note_prefix_config_id);


--
-- TOC entry 2337 (class 1259 OID 77860)
-- Name: idx_3e949f7d5768826e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_3e949f7d5768826e ON crm_bill_company_config USING btree (company_uid);


--
-- TOC entry 2266 (class 1259 OID 77629)
-- Name: idx_3ef971a15768826e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_3ef971a15768826e ON core_customer_demand_message USING btree (company_uid);


--
-- TOC entry 2267 (class 1259 OID 77631)
-- Name: idx_3ef971a16834ada2; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_3ef971a16834ada2 ON core_customer_demand_message USING btree (internal_author_uid);


--
-- TOC entry 2268 (class 1259 OID 77630)
-- Name: idx_3ef971a1a8225d58; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_3ef971a1a8225d58 ON core_customer_demand_message USING btree (external_author_uid);


--
-- TOC entry 2269 (class 1259 OID 77632)
-- Name: idx_3ef971a1d76c8169; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_3ef971a1d76c8169 ON core_customer_demand_message USING btree (customer_demand_uid);


--
-- TOC entry 2392 (class 1259 OID 86486)
-- Name: idx_423795855768826e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_423795855768826e ON crm_marketing_contact_list USING btree (company_uid);


--
-- TOC entry 2360 (class 1259 OID 77952)
-- Name: idx_4e2cff0b1a8c12f5; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_4e2cff0b1a8c12f5 ON crm_bill_credit_note USING btree (bill_id);


--
-- TOC entry 2361 (class 1259 OID 77951)
-- Name: idx_4e2cff0b5768826e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_4e2cff0b5768826e ON crm_bill_credit_note USING btree (company_uid);


--
-- TOC entry 2317 (class 1259 OID 77798)
-- Name: idx_5599bb29a76ed395; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_5599bb29a76ed395 ON core_user_user_group USING btree (user_id);


--
-- TOC entry 2318 (class 1259 OID 77799)
-- Name: idx_5599bb29fe54d947; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_5599bb29fe54d947 ON core_user_user_group USING btree (group_id);


--
-- TOC entry 2286 (class 1259 OID 77687)
-- Name: idx_745eee3b5768826e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_745eee3b5768826e ON core_customer_address USING btree (company_uid);


--
-- TOC entry 2252 (class 1259 OID 77576)
-- Name: idx_7e1ff056afc2b591; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_7e1ff056afc2b591 ON core_admin_module_admin_group USING btree (module_id);


--
-- TOC entry 2253 (class 1259 OID 77577)
-- Name: idx_7e1ff056fe54d947; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_7e1ff056fe54d947 ON core_admin_module_admin_group USING btree (group_id);


--
-- TOC entry 2258 (class 1259 OID 77611)
-- Name: idx_8a31cfd518d55c89; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_8a31cfd518d55c89 ON core_customer_firm USING btree (address_uid);


--
-- TOC entry 2259 (class 1259 OID 77610)
-- Name: idx_8a31cfd55768826e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_8a31cfd55768826e ON core_customer_firm USING btree (company_uid);


--
-- TOC entry 2272 (class 1259 OID 77644)
-- Name: idx_8eb4677a5768826e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_8eb4677a5768826e ON core_customer_demand USING btree (company_uid);


--
-- TOC entry 2273 (class 1259 OID 77646)
-- Name: idx_8eb4677a7574a0b5; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_8eb4677a7574a0b5 ON core_customer_demand USING btree (firm_uid);


--
-- TOC entry 2274 (class 1259 OID 77645)
-- Name: idx_8eb4677aaea1673e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_8eb4677aaea1673e ON core_customer_demand USING btree (contact_uid);


--
-- TOC entry 2385 (class 1259 OID 86463)
-- Name: idx_9eabcf3a5768826e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_9eabcf3a5768826e ON crm_marketing_campaign USING btree (company_uid);


--
-- TOC entry 2386 (class 1259 OID 86464)
-- Name: idx_9eabcf3ad83d06bc; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_9eabcf3ad83d06bc ON crm_marketing_campaign USING btree (contact_list_uid);


--
-- TOC entry 2340 (class 1259 OID 77876)
-- Name: idx_a50b72561a8c12f5; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_a50b72561a8c12f5 ON crm_bill_payment USING btree (bill_id);


--
-- TOC entry 2341 (class 1259 OID 77875)
-- Name: idx_a50b72565768826e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_a50b72565768826e ON crm_bill_payment USING btree (company_uid);


--
-- TOC entry 2396 (class 1259 OID 86493)
-- Name: idx_a54de95c3dae168b; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_a54de95c3dae168b ON crm_marketing_contact_list_contact USING btree (list_id);


--
-- TOC entry 2397 (class 1259 OID 86494)
-- Name: idx_a54de95ce7a1254a; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_a54de95ce7a1254a ON crm_marketing_contact_list_contact USING btree (contact_id);


--
-- TOC entry 2375 (class 1259 OID 86433)
-- Name: idx_add987b85768826e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_add987b85768826e ON core_admin_user_module_config USING btree (company_uid);


--
-- TOC entry 2376 (class 1259 OID 86434)
-- Name: idx_add987b8a76ed395; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_add987b8a76ed395 ON core_admin_user_module_config USING btree (user_id);


--
-- TOC entry 2377 (class 1259 OID 86435)
-- Name: idx_add987b8afc2b591; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_add987b8afc2b591 ON core_admin_user_module_config USING btree (module_id);


--
-- TOC entry 2306 (class 1259 OID 77763)
-- Name: idx_b34e3b7c5768826e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_b34e3b7c5768826e ON core_user_group USING btree (company_uid);


--
-- TOC entry 2329 (class 1259 OID 77848)
-- Name: idx_b5b293585768826e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_b5b293585768826e ON utils_tag_tag USING btree (company_uid);


--
-- TOC entry 2313 (class 1259 OID 77791)
-- Name: idx_b872aaa45768826e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_b872aaa45768826e ON core_user_user USING btree (company_uid);


--
-- TOC entry 2350 (class 1259 OID 77919)
-- Name: idx_c8548c645768826e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_c8548c645768826e ON crm_bill_bill USING btree (company_uid);


--
-- TOC entry 2351 (class 1259 OID 77920)
-- Name: idx_c8548c64db805178; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_c8548c64db805178 ON crm_bill_bill USING btree (quote_id);


--
-- TOC entry 2380 (class 1259 OID 86444)
-- Name: idx_d10d79a85768826e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_d10d79a85768826e ON crm_marketing_contact_meta USING btree (company_uid);


--
-- TOC entry 2381 (class 1259 OID 86445)
-- Name: idx_d10d79a8aea1673e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_d10d79a8aea1673e ON crm_marketing_contact_meta USING btree (contact_uid);


--
-- TOC entry 2382 (class 1259 OID 86446)
-- Name: idx_d10d79a8d83d06bc; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_d10d79a8d83d06bc ON crm_marketing_contact_meta USING btree (contact_list_uid);


--
-- TOC entry 2354 (class 1259 OID 77933)
-- Name: idx_d4d067d65768826e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_d4d067d65768826e ON crm_bill_product_type USING btree (company_uid);


--
-- TOC entry 2262 (class 1259 OID 77617)
-- Name: idx_eab5b2389af7860; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_eab5b2389af7860 ON core_customer_firm_tag USING btree (firm_id);


--
-- TOC entry 2263 (class 1259 OID 77618)
-- Name: idx_eab5b23bad26311; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_eab5b23bad26311 ON core_customer_firm_tag USING btree (tag_id);


--
-- TOC entry 2301 (class 1259 OID 77751)
-- Name: idx_ec6661cd19eb6921; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_ec6661cd19eb6921 ON core_oauth_server_auth_code USING btree (client_id);


--
-- TOC entry 2302 (class 1259 OID 77752)
-- Name: idx_ec6661cda76ed395; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_ec6661cda76ed395 ON core_oauth_server_auth_code USING btree (user_id);


--
-- TOC entry 2309 (class 1259 OID 77770)
-- Name: idx_f13a833344fb371e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_f13a833344fb371e ON core_user_group_group USING btree (sub_group_id);


--
-- TOC entry 2310 (class 1259 OID 77769)
-- Name: idx_f13a8333fe54d947; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_f13a8333fe54d947 ON core_user_group_group USING btree (group_id);


--
-- TOC entry 2398 (class 1259 OID 88507)
-- Name: idx_f3d6104d64c19c1; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_f3d6104d64c19c1 ON utils_faq_entry USING btree (category);


--
-- TOC entry 2289 (class 1259 OID 77719)
-- Name: idx_f85d5dc819eb6921; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_f85d5dc819eb6921 ON core_oauth_server_access_token USING btree (client_id);


--
-- TOC entry 2290 (class 1259 OID 77720)
-- Name: idx_f85d5dc8a76ed395; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_f85d5dc8a76ed395 ON core_oauth_server_access_token USING btree (user_id);


--
-- TOC entry 2282 (class 1259 OID 77671)
-- Name: idx_f90d23bbad26311; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_f90d23bbad26311 ON core_customer_contact_tag USING btree (tag_id);


--
-- TOC entry 2283 (class 1259 OID 77670)
-- Name: idx_f90d23be7a1254a; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_f90d23be7a1254a ON core_customer_contact_tag USING btree (contact_id);


--
-- TOC entry 2245 (class 1259 OID 77563)
-- Name: idx_fc5cae095768826e; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_fc5cae095768826e ON core_admin_module USING btree (company_uid);


--
-- TOC entry 2298 (class 1259 OID 77738)
-- Name: uniq_11d77dfd5f37a13b; Type: INDEX; Schema: public; Owner: symfony
--

CREATE UNIQUE INDEX uniq_11d77dfd5f37a13b ON core_oauth_server_refresh_token USING btree (token);


--
-- TOC entry 2279 (class 1259 OID 77663)
-- Name: uniq_35726782ee45bdbf; Type: INDEX; Schema: public; Owner: symfony
--

CREATE UNIQUE INDEX uniq_35726782ee45bdbf ON core_customer_contact USING btree (picture_id);


--
-- TOC entry 2370 (class 1259 OID 77989)
-- Name: uniq_39c62f49511fc912; Type: INDEX; Schema: public; Owner: symfony
--

CREATE UNIQUE INDEX uniq_39c62f49511fc912 ON crm_hr_cv_document USING btree (pdf_id);


--
-- TOC entry 2393 (class 1259 OID 86487)
-- Name: uniq_42379585bad26311; Type: INDEX; Schema: public; Owner: symfony
--

CREATE UNIQUE INDEX uniq_42379585bad26311 ON crm_marketing_contact_list USING btree (tag_id);


--
-- TOC entry 2314 (class 1259 OID 77792)
-- Name: uniq_b872aaa4ee45bdbf; Type: INDEX; Schema: public; Owner: symfony
--

CREATE UNIQUE INDEX uniq_b872aaa4ee45bdbf ON core_user_user USING btree (picture_id);


--
-- TOC entry 2324 (class 1259 OID 77827)
-- Name: uniq_ba02ae9dee45bdbf; Type: INDEX; Schema: public; Owner: symfony
--

CREATE UNIQUE INDEX uniq_ba02ae9dee45bdbf ON core_user_company USING btree (picture_id);


--
-- TOC entry 2325 (class 1259 OID 77828)
-- Name: uniq_ba02ae9df5b7af75; Type: INDEX; Schema: public; Owner: symfony
--

CREATE UNIQUE INDEX uniq_ba02ae9df5b7af75 ON core_user_company USING btree (address_id);


--
-- TOC entry 2303 (class 1259 OID 77750)
-- Name: uniq_ec6661cd5f37a13b; Type: INDEX; Schema: public; Owner: symfony
--

CREATE UNIQUE INDEX uniq_ec6661cd5f37a13b ON core_oauth_server_auth_code USING btree (token);


--
-- TOC entry 2291 (class 1259 OID 77718)
-- Name: uniq_f85d5dc85f37a13b; Type: INDEX; Schema: public; Owner: symfony
--

CREATE UNIQUE INDEX uniq_f85d5dc85f37a13b ON core_oauth_server_access_token USING btree (token);


--
-- TOC entry 2427 (class 2606 OID 78115)
-- Name: fk_11d77dfd19eb6921; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_oauth_server_refresh_token
    ADD CONSTRAINT fk_11d77dfd19eb6921 FOREIGN KEY (client_id) REFERENCES core_oauth_server_client(id);


--
-- TOC entry 2428 (class 2606 OID 78120)
-- Name: fk_11d77dfda76ed395; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_oauth_server_refresh_token
    ADD CONSTRAINT fk_11d77dfda76ed395 FOREIGN KEY (user_id) REFERENCES core_user_user(uid);


--
-- TOC entry 2441 (class 2606 OID 78185)
-- Name: fk_13e4bc745768826e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY utils_note_note
    ADD CONSTRAINT fk_13e4bc745768826e FOREIGN KEY (company_uid) REFERENCES core_user_company(uid);


--
-- TOC entry 2459 (class 2606 OID 78275)
-- Name: fk_181fa8e25768826e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_bill_quote
    ADD CONSTRAINT fk_181fa8e25768826e FOREIGN KEY (company_uid) REFERENCES core_user_company(uid);


--
-- TOC entry 2461 (class 2606 OID 78285)
-- Name: fk_181fa8e2a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_bill_quote
    ADD CONSTRAINT fk_181fa8e2a76ed395 FOREIGN KEY (user_id) REFERENCES core_user_user(uid);


--
-- TOC entry 2460 (class 2606 OID 78280)
-- Name: fk_181fa8e2aea1673e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_bill_quote
    ADD CONSTRAINT fk_181fa8e2aea1673e FOREIGN KEY (contact_uid) REFERENCES core_customer_contact(uid);


--
-- TOC entry 2450 (class 2606 OID 78230)
-- Name: fk_1b69f2f614959723; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_bill_product
    ADD CONSTRAINT fk_1b69f2f614959723 FOREIGN KEY (product_type_id) REFERENCES crm_bill_product_type(uid);


--
-- TOC entry 2452 (class 2606 OID 78240)
-- Name: fk_1b69f2f61c696f7a; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_bill_product
    ADD CONSTRAINT fk_1b69f2f61c696f7a FOREIGN KEY (credit_note_id) REFERENCES crm_bill_credit_note(uid);


--
-- TOC entry 2449 (class 2606 OID 78225)
-- Name: fk_1b69f2f65768826e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_bill_product
    ADD CONSTRAINT fk_1b69f2f65768826e FOREIGN KEY (company_uid) REFERENCES core_user_company(uid);


--
-- TOC entry 2451 (class 2606 OID 78235)
-- Name: fk_1b69f2f6db805178; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_bill_product
    ADD CONSTRAINT fk_1b69f2f6db805178 FOREIGN KEY (quote_id) REFERENCES crm_bill_quote(uid);


--
-- TOC entry 2404 (class 2606 OID 77995)
-- Name: fk_1c37f865afc2b591; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_admin_module_user_group
    ADD CONSTRAINT fk_1c37f865afc2b591 FOREIGN KEY (module_id) REFERENCES core_admin_module(uid);


--
-- TOC entry 2405 (class 2606 OID 78000)
-- Name: fk_1c37f865fe54d947; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_admin_module_user_group
    ADD CONSTRAINT fk_1c37f865fe54d947 FOREIGN KEY (group_id) REFERENCES core_user_group(uid);


--
-- TOC entry 2472 (class 2606 OID 86535)
-- Name: fk_1fa0fb7c5768826e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_marketing_config
    ADD CONSTRAINT fk_1fa0fb7c5768826e FOREIGN KEY (company_uid) REFERENCES core_user_company(uid);


--
-- TOC entry 2456 (class 2606 OID 78260)
-- Name: fk_332d5b9a5768826e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_bill_prefix_config
    ADD CONSTRAINT fk_332d5b9a5768826e FOREIGN KEY (company_uid) REFERENCES core_user_company(uid);


--
-- TOC entry 2419 (class 2606 OID 78070)
-- Name: fk_357267825768826e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_customer_contact
    ADD CONSTRAINT fk_357267825768826e FOREIGN KEY (company_uid) REFERENCES core_user_company(uid);


--
-- TOC entry 2421 (class 2606 OID 78080)
-- Name: fk_3572678289af7860; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_customer_contact
    ADD CONSTRAINT fk_3572678289af7860 FOREIGN KEY (firm_id) REFERENCES core_customer_firm(uid);


--
-- TOC entry 2420 (class 2606 OID 78075)
-- Name: fk_35726782ee45bdbf; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_customer_contact
    ADD CONSTRAINT fk_35726782ee45bdbf FOREIGN KEY (picture_id) REFERENCES core_cms_picture(uid);


--
-- TOC entry 2438 (class 2606 OID 78170)
-- Name: fk_389003f4b88d678d; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_user_notification
    ADD CONSTRAINT fk_389003f4b88d678d FOREIGN KEY (user_uid) REFERENCES core_user_user(uid);


--
-- TOC entry 2463 (class 2606 OID 78295)
-- Name: fk_39c62f49511fc912; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_hr_cv_document
    ADD CONSTRAINT fk_39c62f49511fc912 FOREIGN KEY (pdf_id) REFERENCES core_cms_picture(uid);


--
-- TOC entry 2462 (class 2606 OID 78290)
-- Name: fk_39c62f495768826e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_hr_cv_document
    ADD CONSTRAINT fk_39c62f495768826e FOREIGN KEY (company_uid) REFERENCES core_user_company(uid);


--
-- TOC entry 2445 (class 2606 OID 78205)
-- Name: fk_3e949f7d10538fa2; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_bill_company_config
    ADD CONSTRAINT fk_3e949f7d10538fa2 FOREIGN KEY (quote_prefix_config_id) REFERENCES crm_bill_prefix_config(uid);


--
-- TOC entry 2444 (class 2606 OID 78200)
-- Name: fk_3e949f7d41b0534f; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_bill_company_config
    ADD CONSTRAINT fk_3e949f7d41b0534f FOREIGN KEY (bill_prefix_config_id) REFERENCES crm_bill_prefix_config(uid);


--
-- TOC entry 2446 (class 2606 OID 78210)
-- Name: fk_3e949f7d510caa1a; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_bill_company_config
    ADD CONSTRAINT fk_3e949f7d510caa1a FOREIGN KEY (credit_note_prefix_config_id) REFERENCES crm_bill_prefix_config(uid);


--
-- TOC entry 2443 (class 2606 OID 78195)
-- Name: fk_3e949f7d5768826e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_bill_company_config
    ADD CONSTRAINT fk_3e949f7d5768826e FOREIGN KEY (company_uid) REFERENCES core_user_company(uid);


--
-- TOC entry 2412 (class 2606 OID 78035)
-- Name: fk_3ef971a15768826e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_customer_demand_message
    ADD CONSTRAINT fk_3ef971a15768826e FOREIGN KEY (company_uid) REFERENCES core_user_company(uid);


--
-- TOC entry 2414 (class 2606 OID 78045)
-- Name: fk_3ef971a16834ada2; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_customer_demand_message
    ADD CONSTRAINT fk_3ef971a16834ada2 FOREIGN KEY (internal_author_uid) REFERENCES core_user_user(uid);


--
-- TOC entry 2413 (class 2606 OID 78040)
-- Name: fk_3ef971a1a8225d58; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_customer_demand_message
    ADD CONSTRAINT fk_3ef971a1a8225d58 FOREIGN KEY (external_author_uid) REFERENCES core_customer_contact(uid);


--
-- TOC entry 2415 (class 2606 OID 78050)
-- Name: fk_3ef971a1d76c8169; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_customer_demand_message
    ADD CONSTRAINT fk_3ef971a1d76c8169 FOREIGN KEY (customer_demand_uid) REFERENCES core_customer_demand(uid);


--
-- TOC entry 2473 (class 2606 OID 86540)
-- Name: fk_423795855768826e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_marketing_contact_list
    ADD CONSTRAINT fk_423795855768826e FOREIGN KEY (company_uid) REFERENCES core_user_company(uid);


--
-- TOC entry 2474 (class 2606 OID 86545)
-- Name: fk_42379585bad26311; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_marketing_contact_list
    ADD CONSTRAINT fk_42379585bad26311 FOREIGN KEY (tag_id) REFERENCES utils_tag_tag(uid);


--
-- TOC entry 2458 (class 2606 OID 78270)
-- Name: fk_4e2cff0b1a8c12f5; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_bill_credit_note
    ADD CONSTRAINT fk_4e2cff0b1a8c12f5 FOREIGN KEY (bill_id) REFERENCES crm_bill_bill(uid);


--
-- TOC entry 2457 (class 2606 OID 78265)
-- Name: fk_4e2cff0b5768826e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_bill_credit_note
    ADD CONSTRAINT fk_4e2cff0b5768826e FOREIGN KEY (company_uid) REFERENCES core_user_company(uid);


--
-- TOC entry 2436 (class 2606 OID 78160)
-- Name: fk_5599bb29a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_user_user_group
    ADD CONSTRAINT fk_5599bb29a76ed395 FOREIGN KEY (user_id) REFERENCES core_user_user(uid);


--
-- TOC entry 2437 (class 2606 OID 78165)
-- Name: fk_5599bb29fe54d947; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_user_user_group
    ADD CONSTRAINT fk_5599bb29fe54d947 FOREIGN KEY (group_id) REFERENCES core_user_group(uid);


--
-- TOC entry 2424 (class 2606 OID 78095)
-- Name: fk_745eee3b5768826e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_customer_address
    ADD CONSTRAINT fk_745eee3b5768826e FOREIGN KEY (company_uid) REFERENCES core_user_company(uid);


--
-- TOC entry 2406 (class 2606 OID 78005)
-- Name: fk_7e1ff056afc2b591; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_admin_module_admin_group
    ADD CONSTRAINT fk_7e1ff056afc2b591 FOREIGN KEY (module_id) REFERENCES core_admin_module(uid);


--
-- TOC entry 2407 (class 2606 OID 78010)
-- Name: fk_7e1ff056fe54d947; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_admin_module_admin_group
    ADD CONSTRAINT fk_7e1ff056fe54d947 FOREIGN KEY (group_id) REFERENCES core_user_group(uid);


--
-- TOC entry 2409 (class 2606 OID 78020)
-- Name: fk_8a31cfd518d55c89; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_customer_firm
    ADD CONSTRAINT fk_8a31cfd518d55c89 FOREIGN KEY (address_uid) REFERENCES core_customer_address(uid);


--
-- TOC entry 2408 (class 2606 OID 78015)
-- Name: fk_8a31cfd55768826e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_customer_firm
    ADD CONSTRAINT fk_8a31cfd55768826e FOREIGN KEY (company_uid) REFERENCES core_user_company(uid);


--
-- TOC entry 2416 (class 2606 OID 78055)
-- Name: fk_8eb4677a5768826e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_customer_demand
    ADD CONSTRAINT fk_8eb4677a5768826e FOREIGN KEY (company_uid) REFERENCES core_user_company(uid);


--
-- TOC entry 2418 (class 2606 OID 78065)
-- Name: fk_8eb4677a7574a0b5; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_customer_demand
    ADD CONSTRAINT fk_8eb4677a7574a0b5 FOREIGN KEY (firm_uid) REFERENCES core_customer_firm(uid);


--
-- TOC entry 2417 (class 2606 OID 78060)
-- Name: fk_8eb4677aaea1673e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_customer_demand
    ADD CONSTRAINT fk_8eb4677aaea1673e FOREIGN KEY (contact_uid) REFERENCES core_customer_contact(uid);


--
-- TOC entry 2470 (class 2606 OID 86525)
-- Name: fk_9eabcf3a5768826e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_marketing_campaign
    ADD CONSTRAINT fk_9eabcf3a5768826e FOREIGN KEY (company_uid) REFERENCES core_user_company(uid);


--
-- TOC entry 2471 (class 2606 OID 86530)
-- Name: fk_9eabcf3ad83d06bc; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_marketing_campaign
    ADD CONSTRAINT fk_9eabcf3ad83d06bc FOREIGN KEY (contact_list_uid) REFERENCES crm_marketing_contact_list(uid);


--
-- TOC entry 2448 (class 2606 OID 78220)
-- Name: fk_a50b72561a8c12f5; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_bill_payment
    ADD CONSTRAINT fk_a50b72561a8c12f5 FOREIGN KEY (bill_id) REFERENCES crm_bill_bill(uid);


--
-- TOC entry 2447 (class 2606 OID 78215)
-- Name: fk_a50b72565768826e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_bill_payment
    ADD CONSTRAINT fk_a50b72565768826e FOREIGN KEY (company_uid) REFERENCES core_user_company(uid);


--
-- TOC entry 2475 (class 2606 OID 86550)
-- Name: fk_a54de95c3dae168b; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_marketing_contact_list_contact
    ADD CONSTRAINT fk_a54de95c3dae168b FOREIGN KEY (list_id) REFERENCES crm_marketing_contact_list(uid);


--
-- TOC entry 2476 (class 2606 OID 86555)
-- Name: fk_a54de95ce7a1254a; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_marketing_contact_list_contact
    ADD CONSTRAINT fk_a54de95ce7a1254a FOREIGN KEY (contact_id) REFERENCES core_customer_contact(uid);


--
-- TOC entry 2464 (class 2606 OID 86495)
-- Name: fk_add987b85768826e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_admin_user_module_config
    ADD CONSTRAINT fk_add987b85768826e FOREIGN KEY (company_uid) REFERENCES core_user_company(uid);


--
-- TOC entry 2465 (class 2606 OID 86500)
-- Name: fk_add987b8a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_admin_user_module_config
    ADD CONSTRAINT fk_add987b8a76ed395 FOREIGN KEY (user_id) REFERENCES core_user_user(uid);


--
-- TOC entry 2466 (class 2606 OID 86505)
-- Name: fk_add987b8afc2b591; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_admin_user_module_config
    ADD CONSTRAINT fk_add987b8afc2b591 FOREIGN KEY (module_id) REFERENCES core_admin_module(uid);


--
-- TOC entry 2431 (class 2606 OID 78135)
-- Name: fk_b34e3b7c5768826e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_user_group
    ADD CONSTRAINT fk_b34e3b7c5768826e FOREIGN KEY (company_uid) REFERENCES core_user_company(uid);


--
-- TOC entry 2434 (class 2606 OID 78150)
-- Name: fk_b872aaa45768826e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_user_user
    ADD CONSTRAINT fk_b872aaa45768826e FOREIGN KEY (company_uid) REFERENCES core_user_company(uid);


--
-- TOC entry 2435 (class 2606 OID 78155)
-- Name: fk_b872aaa4ee45bdbf; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_user_user
    ADD CONSTRAINT fk_b872aaa4ee45bdbf FOREIGN KEY (picture_id) REFERENCES core_cms_picture(uid);


--
-- TOC entry 2442 (class 2606 OID 78190)
-- Name: fk_b8c8770b5768826e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY utils_tag_tag
    ADD CONSTRAINT fk_b8c8770b5768826e FOREIGN KEY (company_uid) REFERENCES core_user_company(uid);


--
-- TOC entry 2439 (class 2606 OID 78175)
-- Name: fk_ba02ae9dee45bdbf; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_user_company
    ADD CONSTRAINT fk_ba02ae9dee45bdbf FOREIGN KEY (picture_id) REFERENCES core_cms_picture(uid);


--
-- TOC entry 2440 (class 2606 OID 78180)
-- Name: fk_ba02ae9df5b7af75; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_user_company
    ADD CONSTRAINT fk_ba02ae9df5b7af75 FOREIGN KEY (address_id) REFERENCES core_customer_address(uid);


--
-- TOC entry 2453 (class 2606 OID 78245)
-- Name: fk_c8548c645768826e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_bill_bill
    ADD CONSTRAINT fk_c8548c645768826e FOREIGN KEY (company_uid) REFERENCES core_user_company(uid);


--
-- TOC entry 2454 (class 2606 OID 78250)
-- Name: fk_c8548c64db805178; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_bill_bill
    ADD CONSTRAINT fk_c8548c64db805178 FOREIGN KEY (quote_id) REFERENCES crm_bill_quote(uid);


--
-- TOC entry 2467 (class 2606 OID 86510)
-- Name: fk_d10d79a85768826e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_marketing_contact_meta
    ADD CONSTRAINT fk_d10d79a85768826e FOREIGN KEY (company_uid) REFERENCES core_user_company(uid);


--
-- TOC entry 2468 (class 2606 OID 86515)
-- Name: fk_d10d79a8aea1673e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_marketing_contact_meta
    ADD CONSTRAINT fk_d10d79a8aea1673e FOREIGN KEY (contact_uid) REFERENCES core_customer_contact(uid);


--
-- TOC entry 2469 (class 2606 OID 86520)
-- Name: fk_d10d79a8d83d06bc; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_marketing_contact_meta
    ADD CONSTRAINT fk_d10d79a8d83d06bc FOREIGN KEY (contact_list_uid) REFERENCES crm_marketing_contact_list(uid);


--
-- TOC entry 2455 (class 2606 OID 78255)
-- Name: fk_d4d067d65768826e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY crm_bill_product_type
    ADD CONSTRAINT fk_d4d067d65768826e FOREIGN KEY (company_uid) REFERENCES core_user_company(uid);


--
-- TOC entry 2410 (class 2606 OID 78025)
-- Name: fk_eab5b2389af7860; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_customer_firm_tag
    ADD CONSTRAINT fk_eab5b2389af7860 FOREIGN KEY (firm_id) REFERENCES core_customer_firm(uid);


--
-- TOC entry 2411 (class 2606 OID 78030)
-- Name: fk_eab5b23bad26311; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_customer_firm_tag
    ADD CONSTRAINT fk_eab5b23bad26311 FOREIGN KEY (tag_id) REFERENCES utils_tag_tag(uid);


--
-- TOC entry 2429 (class 2606 OID 78125)
-- Name: fk_ec6661cd19eb6921; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_oauth_server_auth_code
    ADD CONSTRAINT fk_ec6661cd19eb6921 FOREIGN KEY (client_id) REFERENCES core_oauth_server_client(id);


--
-- TOC entry 2430 (class 2606 OID 78130)
-- Name: fk_ec6661cda76ed395; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_oauth_server_auth_code
    ADD CONSTRAINT fk_ec6661cda76ed395 FOREIGN KEY (user_id) REFERENCES core_user_user(uid);


--
-- TOC entry 2433 (class 2606 OID 78145)
-- Name: fk_f13a833344fb371e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_user_group_group
    ADD CONSTRAINT fk_f13a833344fb371e FOREIGN KEY (sub_group_id) REFERENCES core_user_group(uid);


--
-- TOC entry 2432 (class 2606 OID 78140)
-- Name: fk_f13a8333fe54d947; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_user_group_group
    ADD CONSTRAINT fk_f13a8333fe54d947 FOREIGN KEY (group_id) REFERENCES core_user_group(uid);


--
-- TOC entry 2477 (class 2606 OID 88518)
-- Name: fk_f3d6104d64c19c1; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY utils_faq_entry
    ADD CONSTRAINT fk_f3d6104d64c19c1 FOREIGN KEY (category) REFERENCES utils_faq_category(uid);


--
-- TOC entry 2425 (class 2606 OID 78105)
-- Name: fk_f85d5dc819eb6921; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_oauth_server_access_token
    ADD CONSTRAINT fk_f85d5dc819eb6921 FOREIGN KEY (client_id) REFERENCES core_oauth_server_client(id);


--
-- TOC entry 2426 (class 2606 OID 78110)
-- Name: fk_f85d5dc8a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_oauth_server_access_token
    ADD CONSTRAINT fk_f85d5dc8a76ed395 FOREIGN KEY (user_id) REFERENCES core_user_user(uid);


--
-- TOC entry 2423 (class 2606 OID 78090)
-- Name: fk_f90d23bbad26311; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_customer_contact_tag
    ADD CONSTRAINT fk_f90d23bbad26311 FOREIGN KEY (tag_id) REFERENCES utils_tag_tag(uid);


--
-- TOC entry 2422 (class 2606 OID 78085)
-- Name: fk_f90d23be7a1254a; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_customer_contact_tag
    ADD CONSTRAINT fk_f90d23be7a1254a FOREIGN KEY (contact_id) REFERENCES core_customer_contact(uid);


--
-- TOC entry 2403 (class 2606 OID 77990)
-- Name: fk_fc5cae095768826e; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY core_admin_module
    ADD CONSTRAINT fk_fc5cae095768826e FOREIGN KEY (company_uid) REFERENCES core_user_company(uid);


--
-- TOC entry 2665 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-09-06 14:38:53 CEST

--
-- PostgreSQL database dump complete
--

