--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12
-- Dumped by pg_dump version 10.12

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: DisbursedDate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DisbursedDate" (
    id integer NOT NULL,
    year character varying(20) NOT NULL,
    weekno character varying(20) NOT NULL,
    disbursed_date date NOT NULL
);


ALTER TABLE public."DisbursedDate" OWNER TO postgres;

--
-- Name: DisbursedDate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."DisbursedDate_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DisbursedDate_id_seq" OWNER TO postgres;

--
-- Name: DisbursedDate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."DisbursedDate_id_seq" OWNED BY public."DisbursedDate".id;


--
-- Name: REACT_reactbasedata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."REACT_reactbasedata" (
    id integer NOT NULL,
    "Fin_year" character varying(15) NOT NULL,
    "Week_no" character varying(15) NOT NULL,
    "Consider_Week_no" character varying(10) NOT NULL,
    "Week_startdate" date NOT NULL,
    "Week_enddate" date NOT NULL,
    "Revision_no" character varying(255) NOT NULL,
    "Letter_refno" character varying(255) NOT NULL,
    "Letter_date" date NOT NULL,
    "Payment_date" date NOT NULL,
    "Disbursement_date" date NOT NULL,
    "Lc_date" date NOT NULL,
    "Interest_levydate" date NOT NULL,
    "Entity" character varying(255) NOT NULL,
    "DevFinal" bigint NOT NULL,
    "Outstandings" bigint NOT NULL,
    "Status" character varying(100) NOT NULL,
    "PayableorReceivable" character varying(25) NOT NULL,
    image_url character varying(200) NOT NULL,
    modified_remarks character varying(255) NOT NULL,
    registration_id character varying(100) NOT NULL,
    "ProRata" bigint NOT NULL
);


ALTER TABLE public."REACT_reactbasedata" OWNER TO postgres;

--
-- Name: REACT_reactbasedata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."REACT_reactbasedata_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."REACT_reactbasedata_id_seq" OWNER TO postgres;

--
-- Name: REACT_reactbasedata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."REACT_reactbasedata_id_seq" OWNED BY public."REACT_reactbasedata".id;


--
-- Name: REACT_reactdisburseddate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."REACT_reactdisburseddate" (
    id integer NOT NULL,
    year character varying(20) NOT NULL,
    weekno character varying(20) NOT NULL,
    disbursed_date date NOT NULL
);


ALTER TABLE public."REACT_reactdisburseddate" OWNER TO postgres;

--
-- Name: REACT_reactdisburseddate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."REACT_reactdisburseddate_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."REACT_reactdisburseddate_id_seq" OWNER TO postgres;

--
-- Name: REACT_reactdisburseddate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."REACT_reactdisburseddate_id_seq" OWNED BY public."REACT_reactdisburseddate".id;


--
-- Name: REACT_reactduepool; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."REACT_reactduepool" (
    id integer NOT NULL,
    year character varying(10) NOT NULL,
    from_year bigint NOT NULL,
    to_year bigint NOT NULL,
    actual_weekno bigint NOT NULL,
    considered_weekno bigint NOT NULL,
    dueinpool bigint NOT NULL,
    transdate timestamp with time zone
);


ALTER TABLE public."REACT_reactduepool" OWNER TO postgres;

--
-- Name: REACT_reactduepool_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."REACT_reactduepool_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."REACT_reactduepool_id_seq" OWNER TO postgres;

--
-- Name: REACT_reactduepool_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."REACT_reactduepool_id_seq" OWNED BY public."REACT_reactduepool".id;


--
-- Name: REACT_repaymentstatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."REACT_repaymentstatus" (
    id integer NOT NULL,
    "Pay_type" character varying(15) NOT NULL,
    "Pay_refno" character varying(100) NOT NULL,
    "Pay_date" date NOT NULL,
    "Pay_amount" bigint NOT NULL,
    "Dev_final" bigint NOT NULL,
    "Due_amount" bigint NOT NULL,
    "Paid_by" character varying(250) NOT NULL,
    "Paid_for" character varying(250) NOT NULL,
    "Remarks" character varying(100) NOT NULL,
    "Status" character varying(50) NOT NULL,
    reject_remarks character varying(255) NOT NULL,
    registration_id_id integer NOT NULL
);


ALTER TABLE public."REACT_repaymentstatus" OWNER TO postgres;

--
-- Name: REACT_repaymentstatus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."REACT_repaymentstatus_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."REACT_repaymentstatus_id_seq" OWNER TO postgres;

--
-- Name: REACT_repaymentstatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."REACT_repaymentstatus_id_seq" OWNED BY public."REACT_repaymentstatus".id;


--
-- Name: Registration_approved; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Registration_approved" (
    "entityName" character varying(255) NOT NULL,
    "regAddress" character varying(255) NOT NULL,
    region character varying(255) NOT NULL,
    "userCategory" character varying(255) NOT NULL,
    "contactName" character varying(255) NOT NULL,
    designation character varying(255) NOT NULL,
    telephone bigint NOT NULL,
    "contactName2" character varying(255) NOT NULL,
    designation2 character varying(255) NOT NULL,
    telephone2 bigint NOT NULL,
    "contactName3" character varying(255),
    designation3 character varying(255),
    telephone3 bigint,
    "accountName" character varying(255) NOT NULL,
    "accountNumber" bigint,
    "bankName" character varying(255) NOT NULL,
    "branchName" character varying(255) NOT NULL,
    "ifscCode" character varying(100) NOT NULL,
    id character varying(255) NOT NULL,
    register_id character varying(100) NOT NULL,
    "accountNumber2" bigint,
    "bankName2" character varying(255),
    "branchName2" character varying(255),
    "ifscCode2" character varying(255),
    "ifscCode3" character varying(255),
    "ifscCode4" character varying(255),
    "ifscCode5" character varying(255),
    "ifscCode6" character varying(255),
    "accountName3" character varying(255),
    "accountName4" character varying(255),
    "accountName5" character varying(255),
    "accountName6" character varying(255),
    "bankName3" character varying(255),
    "bankName4" character varying(255),
    "bankName5" character varying(255),
    "bankName6" character varying(255),
    "branchName3" character varying(255),
    "branchName4" character varying(255),
    "branchName5" character varying(255),
    "branchName6" character varying(255),
    "accountNumber3" bigint,
    "accountNumber4" bigint,
    "accountNumber5" bigint,
    "accountNumber6" bigint,
    pannumber character varying(255),
    gstinnumber character varying(255),
    "accountName2" character varying(255),
    validfrom date NOT NULL,
    validtill date NOT NULL,
    adminremarks character varying(255) NOT NULL,
    remarks character varying(255) NOT NULL,
    tannumber character varying(20) NOT NULL
);


ALTER TABLE public."Registration_approved" OWNER TO postgres;

--
-- Name: Registration_employeeuser1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Registration_employeeuser1" (
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    designation character varying(100) NOT NULL,
    registration_id_id integer NOT NULL,
    usertype character varying(100) NOT NULL,
    empno character varying NOT NULL,
    contact_number bigint
);


ALTER TABLE public."Registration_employeeuser1" OWNER TO postgres;

--
-- Name: Registration_formdata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Registration_formdata" (
    "entityName" character varying(255) NOT NULL,
    "regAddress" character varying(255) NOT NULL,
    region character varying(255) NOT NULL,
    "userCategory" character varying(255) NOT NULL,
    "contactName" character varying(255) NOT NULL,
    designation character varying(255) NOT NULL,
    telephone bigint NOT NULL,
    "contactName2" character varying(255) NOT NULL,
    designation2 character varying(255) NOT NULL,
    telephone2 bigint NOT NULL,
    "contactName3" character varying(255),
    designation3 character varying(255),
    telephone3 bigint,
    "accountName" character varying(255) NOT NULL,
    "accountNumber" bigint NOT NULL,
    "bankName" character varying(255) NOT NULL,
    "branchName" character varying(255) NOT NULL,
    "ifscCode" character varying(100) NOT NULL,
    "accountName2" character varying(255),
    "accountNumber2" bigint,
    "bankName2" character varying(255),
    "branchName2" character varying(255),
    "ifscCode2" character varying(100),
    "accountName3" character varying(255),
    "accountNumber3" bigint,
    "bankName3" character varying(255),
    "branchName3" character varying(255),
    "ifscCode3" character varying(100),
    id character varying(255) NOT NULL,
    register_id character(100) DEFAULT NULL::bpchar,
    "accountName4" character varying(255),
    "accountName5" character varying(255),
    "accountName6" character varying(255),
    "accountNumber4" bigint,
    "accountNumber5" bigint,
    "accountNumber6" bigint,
    "bankName4" character varying(255),
    "bankName5" character varying(255),
    "bankName6" character varying(255),
    "branchName4" character varying(255),
    "branchName5" character varying(255),
    "branchName6" character varying(255),
    "ifscCode4" character varying(100),
    "ifscCode5" character varying(100),
    "ifscCode6" character varying(100),
    remarks character varying(255) NOT NULL,
    "isFinanceVerified" boolean NOT NULL,
    gstinnumber character varying(30) NOT NULL,
    pannumber character varying(15) NOT NULL,
    tannumber character varying(20) NOT NULL,
    "isFinanceApproved" boolean NOT NULL
);


ALTER TABLE public."Registration_formdata" OWNER TO postgres;

--
-- Name: Registration_generalentities1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Registration_generalentities1" (
    id integer NOT NULL,
    alias1 character varying(30) NOT NULL,
    alias2 character varying(30) NOT NULL,
    alias3 character varying(30) NOT NULL,
    alias4 character varying(30),
    fullname character varying(200) NOT NULL,
    dateofregistration date NOT NULL,
    shortname character varying(50) NOT NULL,
    usercategory character varying(100) NOT NULL,
    usertype character varying(100) NOT NULL,
    mobileno bigint NOT NULL,
    registration_id_id integer NOT NULL,
    email character varying(50) NOT NULL
);


ALTER TABLE public."Registration_generalentities1" OWNER TO postgres;

--
-- Name: Registration_generalentities1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Registration_generalentities1_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Registration_generalentities1_id_seq" OWNER TO postgres;

--
-- Name: Registration_generalentities1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Registration_generalentities1_id_seq" OWNED BY public."Registration_generalentities1".id;


--
-- Name: Registration_oldbankdetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Registration_oldbankdetails" (
    id integer NOT NULL,
    "accountName" character varying(255) NOT NULL,
    "accountNumber" bigint NOT NULL,
    "bankName" character varying(255) NOT NULL,
    "branchName" character varying(255) NOT NULL,
    "ifscCode" character varying(100) NOT NULL,
    "accountName2" character varying(255) NOT NULL,
    "accountNumber2" bigint NOT NULL,
    "bankName2" character varying(255) NOT NULL,
    "branchName2" character varying(255) NOT NULL,
    "ifscCode2" character varying(100) NOT NULL,
    "accountName3" character varying(255) NOT NULL,
    "accountNumber3" bigint NOT NULL,
    "bankName3" character varying(255) NOT NULL,
    "branchName3" character varying(255) NOT NULL,
    "ifscCode3" character varying(100) NOT NULL,
    "accountName4" character varying(255) NOT NULL,
    "accountNumber4" bigint NOT NULL,
    "bankName4" character varying(255) NOT NULL,
    "branchName4" character varying(255) NOT NULL,
    "ifscCode4" character varying(100) NOT NULL,
    "accountName5" character varying(255) NOT NULL,
    "accountNumber5" bigint NOT NULL,
    "bankName5" character varying(255) NOT NULL,
    "branchName5" character varying(255) NOT NULL,
    "ifscCode5" character varying(100) NOT NULL,
    "accountName6" character varying(255) NOT NULL,
    "accountNumber6" bigint NOT NULL,
    "bankName6" character varying(255) NOT NULL,
    "branchName6" character varying(255) NOT NULL,
    "ifscCode6" character varying(100) NOT NULL,
    validfrom date NOT NULL,
    validtill date NOT NULL,
    isadminverified boolean NOT NULL,
    register_id_id character varying(255) NOT NULL
);


ALTER TABLE public."Registration_oldbankdetails" OWNER TO postgres;

--
-- Name: Registration_oldbankdetails2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Registration_oldbankdetails2" (
    id integer NOT NULL,
    acctype character varying(50) NOT NULL,
    "accountName" character varying(100) NOT NULL,
    "accountNumber" bigint NOT NULL,
    "bankName" character varying(255) NOT NULL,
    "branchName" character varying(255) NOT NULL,
    "ifscCode" character varying(255) NOT NULL,
    isadminverified boolean NOT NULL,
    validfrom date NOT NULL,
    validtill date NOT NULL,
    register_id_id character varying(255) NOT NULL,
    fullname character varying(255) NOT NULL
);


ALTER TABLE public."Registration_oldbankdetails2" OWNER TO postgres;

--
-- Name: Registration_oldbankdetails2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Registration_oldbankdetails2_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Registration_oldbankdetails2_id_seq" OWNER TO postgres;

--
-- Name: Registration_oldbankdetails2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Registration_oldbankdetails2_id_seq" OWNED BY public."Registration_oldbankdetails2".id;


--
-- Name: Registration_oldbankdetails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Registration_oldbankdetails_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Registration_oldbankdetails_id_seq" OWNER TO postgres;

--
-- Name: Registration_oldbankdetails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Registration_oldbankdetails_id_seq" OWNED BY public."Registration_oldbankdetails".id;


--
-- Name: Registration_olddetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Registration_olddetails" (
    id integer NOT NULL,
    "contactName" character varying(100) NOT NULL,
    "contactName2" character varying(255) NOT NULL,
    "contactName3" character varying(255),
    designation character varying(255) NOT NULL,
    designation2 character varying(255) NOT NULL,
    designation3 character varying(255),
    register_id_id character varying(255) NOT NULL,
    telephone bigint NOT NULL,
    telephone2 bigint NOT NULL,
    telephone3 bigint,
    isadminverified boolean NOT NULL,
    fullname character varying(100) NOT NULL,
    "approvedDate" date NOT NULL
);


ALTER TABLE public."Registration_olddetails" OWNER TO postgres;

--
-- Name: Registration_olddetails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Registration_olddetails_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Registration_olddetails_id_seq" OWNER TO postgres;

--
-- Name: Registration_olddetails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Registration_olddetails_id_seq" OWNED BY public."Registration_olddetails".id;


--
-- Name: Registration_rejected; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Registration_rejected" (
    "entityName" character varying(255) NOT NULL,
    "regAddress" character varying(255) NOT NULL,
    region character varying(255) NOT NULL,
    "userCategory" character varying(255) NOT NULL,
    "contactName" character varying(255) NOT NULL,
    designation character varying(255) NOT NULL,
    telephone bigint NOT NULL,
    "contactName2" character varying(255) NOT NULL,
    designation2 character varying(255) NOT NULL,
    telephone2 bigint NOT NULL,
    "contactName3" character varying(255),
    designation3 character varying(255),
    telephone3 bigint,
    "accountName" character varying(255) NOT NULL,
    "accountNumber" bigint NOT NULL,
    "bankName" character varying(255) NOT NULL,
    "branchName" character varying(255) NOT NULL,
    "ifscCode" character varying(100) NOT NULL,
    id character varying(255) NOT NULL,
    remarks character varying(150) NOT NULL,
    register_id character varying(100) NOT NULL,
    "accountName2" character varying(100),
    "accountName3" character varying(100),
    "accountName4" character varying(100),
    "accountName5" character varying(100),
    "accountName6" character varying(100),
    "bankName2" character varying(255),
    "bankName3" character varying(255),
    "bankName4" character varying(255),
    "bankName5" character varying(255),
    "bankName6" character varying(255),
    "branchName2" character varying(255),
    "branchName3" character varying(255),
    "branchName4" character varying(255),
    "branchName5" character varying(255),
    "branchName6" character varying(255),
    "ifscCode2" character varying(255),
    "ifscCode3" character varying(255),
    "ifscCode4" character varying(255),
    "ifscCode5" character varying(255),
    "ifscCode6" character varying(255),
    "accountNumber2" bigint,
    "accountNumber3" bigint,
    "accountNumber4" bigint,
    "accountNumber5" bigint,
    "accountNumber6" bigint,
    adminremarks character varying(255) NOT NULL,
    gstinnumber character varying(20) NOT NULL,
    pannumber character varying(20) NOT NULL,
    tannumber character varying(20) NOT NULL
);


ALTER TABLE public."Registration_rejected" OWNER TO postgres;

--
-- Name: Registration_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Registration_user" (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    registration_id character varying(30) NOT NULL
);


ALTER TABLE public."Registration_user" OWNER TO postgres;

--
-- Name: Registration_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Registration_user_groups" (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public."Registration_user_groups" OWNER TO postgres;

--
-- Name: Registration_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Registration_user_groups_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Registration_user_groups_id_seq" OWNER TO postgres;

--
-- Name: Registration_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Registration_user_groups_id_seq" OWNED BY public."Registration_user_groups".id;


--
-- Name: Registration_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Registration_user_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Registration_user_id_seq" OWNER TO postgres;

--
-- Name: Registration_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Registration_user_id_seq" OWNED BY public."Registration_user".id;


--
-- Name: Registration_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Registration_user_user_permissions" (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public."Registration_user_user_permissions" OWNER TO postgres;

--
-- Name: Registration_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Registration_user_user_permissions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Registration_user_user_permissions_id_seq" OWNER TO postgres;

--
-- Name: Registration_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Registration_user_user_permissions_id_seq" OWNED BY public."Registration_user_user_permissions".id;


--
-- Name: SRPC_Files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SRPC_Files" (
    id integer NOT NULL,
    year character varying(50) NOT NULL,
    "weekNo" character varying(50) NOT NULL,
    image_url character varying(200) NOT NULL
);


ALTER TABLE public."SRPC_Files" OWNER TO postgres;

--
-- Name: SRPC_Files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SRPC_Files_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SRPC_Files_id_seq" OWNER TO postgres;

--
-- Name: SRPC_Files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SRPC_Files_id_seq" OWNED BY public."SRPC_Files".id;


--
-- Name: SRPC_REACT_Files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SRPC_REACT_Files" (
    id integer NOT NULL,
    year character varying(50) NOT NULL,
    "weekNo" character varying(50) NOT NULL,
    image_url character varying(200) NOT NULL
);


ALTER TABLE public."SRPC_REACT_Files" OWNER TO postgres;

--
-- Name: SRPC_REACT_Files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SRPC_REACT_Files_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SRPC_REACT_Files_id_seq" OWNER TO postgres;

--
-- Name: SRPC_REACT_Files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SRPC_REACT_Files_id_seq" OWNED BY public."SRPC_REACT_Files".id;


--
-- Name: WeeklyUpload_approveauthority; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WeeklyUpload_approveauthority" (
    id integer NOT NULL,
    "Fin_year" character varying(15) NOT NULL,
    "Week_no" integer NOT NULL,
    created_by character varying(100) NOT NULL,
    review_auth1 character varying(100) NOT NULL,
    review_auth2 character varying(100) NOT NULL,
    status integer NOT NULL,
    remarks character varying(100) NOT NULL
);


ALTER TABLE public."WeeklyUpload_approveauthority" OWNER TO postgres;

--
-- Name: WeeklyUpload_approveauthority_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."WeeklyUpload_approveauthority_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."WeeklyUpload_approveauthority_id_seq" OWNER TO postgres;

--
-- Name: WeeklyUpload_approveauthority_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."WeeklyUpload_approveauthority_id_seq" OWNED BY public."WeeklyUpload_approveauthority".id;


--
-- Name: WeeklyUpload_approveauthoritypreviousweeks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WeeklyUpload_approveauthoritypreviousweeks" (
    id integer NOT NULL,
    "Fin_year" character varying(15) NOT NULL,
    "Week_no" integer NOT NULL,
    created_by character varying(100) NOT NULL,
    review_auth1 character varying(100) NOT NULL,
    review_auth2 character varying(100) NOT NULL,
    remarks character varying(100) NOT NULL,
    status integer NOT NULL
);


ALTER TABLE public."WeeklyUpload_approveauthoritypreviousweeks" OWNER TO postgres;

--
-- Name: WeeklyUpload_approveauthoritypreviousweeks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."WeeklyUpload_approveauthoritypreviousweeks_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."WeeklyUpload_approveauthoritypreviousweeks_id_seq" OWNER TO postgres;

--
-- Name: WeeklyUpload_approveauthoritypreviousweeks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."WeeklyUpload_approveauthoritypreviousweeks_id_seq" OWNED BY public."WeeklyUpload_approveauthoritypreviousweeks".id;


--
-- Name: WeeklyUpload_chatallmessages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WeeklyUpload_chatallmessages" (
    id integer NOT NULL,
    user_id character varying(50) NOT NULL,
    message text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    receiver character varying(200) NOT NULL,
    sender character varying(200) NOT NULL
);


ALTER TABLE public."WeeklyUpload_chatallmessages" OWNER TO postgres;

--
-- Name: WeeklyUpload_chatallmessages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."WeeklyUpload_chatallmessages_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."WeeklyUpload_chatallmessages_id_seq" OWNER TO postgres;

--
-- Name: WeeklyUpload_chatallmessages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."WeeklyUpload_chatallmessages_id_seq" OWNED BY public."WeeklyUpload_chatallmessages".id;


--
-- Name: WeeklyUpload_configuremodel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WeeklyUpload_configuremodel" (
    id integer NOT NULL,
    "Fin_year" character varying(15) NOT NULL,
    "Week_no" integer NOT NULL,
    "Week_startdate" date NOT NULL,
    "Week_enddate" date NOT NULL,
    "Revision_no" character varying(255) NOT NULL,
    "Letter_refno" character varying(255) NOT NULL,
    "Letter_date" date NOT NULL,
    "Payment_date" date NOT NULL,
    "Disbursement_date" date NOT NULL,
    "Lc_date" date NOT NULL,
    "Interest_levydate" date NOT NULL,
    "Entity" character varying(255) NOT NULL,
    "DevAdditional" bigint NOT NULL,
    "DevAdditionalSignChange" bigint NOT NULL,
    "DevPostfacto" bigint NOT NULL,
    "DevNormal" bigint NOT NULL,
    "DevFinal" bigint NOT NULL,
    "PayableorReceivable" character varying(25) NOT NULL,
    registration_id character varying(100) NOT NULL,
    modified_remarks character varying(255) NOT NULL,
    image_url character varying(200) NOT NULL,
    "Status" character varying(100) NOT NULL,
    is_entered_payment boolean NOT NULL,
    "Outstandings" bigint NOT NULL,
    "Consider_Week_no" character varying(10) NOT NULL
);


ALTER TABLE public."WeeklyUpload_configuremodel" OWNER TO postgres;

--
-- Name: WeeklyUpload_configuremodel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."WeeklyUpload_configuremodel_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."WeeklyUpload_configuremodel_id_seq" OWNER TO postgres;

--
-- Name: WeeklyUpload_configuremodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."WeeklyUpload_configuremodel_id_seq" OWNED BY public."WeeklyUpload_configuremodel".id;


--
-- Name: WeeklyUpload_dsmduepool; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WeeklyUpload_dsmduepool" (
    id integer NOT NULL,
    year character varying(10) NOT NULL,
    dueinpool bigint NOT NULL,
    actual_weekno character varying(10),
    considered_weekno character varying(10),
    transdate timestamp with time zone,
    from_year bigint NOT NULL,
    to_year bigint NOT NULL
);


ALTER TABLE public."WeeklyUpload_dsmduepool" OWNER TO postgres;

--
-- Name: WeeklyUpload_dsmduepool_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."WeeklyUpload_dsmduepool_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."WeeklyUpload_dsmduepool_id_seq" OWNER TO postgres;

--
-- Name: WeeklyUpload_dsmduepool_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."WeeklyUpload_dsmduepool_id_seq" OWNED BY public."WeeklyUpload_dsmduepool".id;


--
-- Name: WeeklyUpload_finalpaydisburse1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WeeklyUpload_finalpaydisburse1" (
    id integer NOT NULL,
    year character varying(20) NOT NULL,
    weekno character varying(20) NOT NULL,
    pay_constituent character varying(150) NOT NULL,
    devfinal bigint NOT NULL,
    paymentdate date NOT NULL,
    amountpaid bigint NOT NULL,
    outstanding bigint NOT NULL,
    registration_id_id integer NOT NULL
);


ALTER TABLE public."WeeklyUpload_finalpaydisburse1" OWNER TO postgres;

--
-- Name: WeeklyUpload_finalpaydisburse1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."WeeklyUpload_finalpaydisburse1_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."WeeklyUpload_finalpaydisburse1_id_seq" OWNER TO postgres;

--
-- Name: WeeklyUpload_finalpaydisburse1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."WeeklyUpload_finalpaydisburse1_id_seq" OWNED BY public."WeeklyUpload_finalpaydisburse1".id;


--
-- Name: WeeklyUpload_finalreceivedisburse1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WeeklyUpload_finalreceivedisburse1" (
    id integer NOT NULL,
    disburseamount bigint NOT NULL,
    disbursedate date NOT NULL,
    duetopool bigint NOT NULL,
    registration_id_id integer NOT NULL
);


ALTER TABLE public."WeeklyUpload_finalreceivedisburse1" OWNER TO postgres;

--
-- Name: WeeklyUpload_finalreceivedisburse1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."WeeklyUpload_finalreceivedisburse1_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."WeeklyUpload_finalreceivedisburse1_id_seq" OWNER TO postgres;

--
-- Name: WeeklyUpload_finalreceivedisburse1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."WeeklyUpload_finalreceivedisburse1_id_seq" OWNED BY public."WeeklyUpload_finalreceivedisburse1".id;


--
-- Name: WeeklyUpload_miscpaymentstatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WeeklyUpload_miscpaymentstatus" (
    id integer NOT NULL,
    "Pay_type" character varying(15) NOT NULL,
    "Pay_refno" character varying(100) NOT NULL,
    "Pay_date" date NOT NULL,
    "Pay_amount" bigint NOT NULL,
    "Paid_by" character varying(250) NOT NULL,
    "Paid_for" character varying(250) NOT NULL,
    "Remarks" character varying(100) NOT NULL,
    "Fin_year" character varying(15) NOT NULL,
    "Week" character varying(15) NOT NULL,
    registration_id character varying(15) NOT NULL,
    "Actual_Week" character varying(15) NOT NULL,
    dsmduepoolmodel_id character varying(100) NOT NULL
);


ALTER TABLE public."WeeklyUpload_miscpaymentstatus" OWNER TO postgres;

--
-- Name: WeeklyUpload_miscpaymentstatus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."WeeklyUpload_miscpaymentstatus_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."WeeklyUpload_miscpaymentstatus_id_seq" OWNER TO postgres;

--
-- Name: WeeklyUpload_miscpaymentstatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."WeeklyUpload_miscpaymentstatus_id_seq" OWNED BY public."WeeklyUpload_miscpaymentstatus".id;


--
-- Name: WeeklyUpload_moemployeeuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WeeklyUpload_moemployeeuser" (
    id integer NOT NULL,
    empno character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    designation character varying(100) NOT NULL,
    contact_number bigint NOT NULL,
    image_url character varying(200) NOT NULL,
    registration_id character varying(50) NOT NULL
);


ALTER TABLE public."WeeklyUpload_moemployeeuser" OWNER TO postgres;

--
-- Name: WeeklyUpload_moemployeeuser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."WeeklyUpload_moemployeeuser_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."WeeklyUpload_moemployeeuser_id_seq" OWNER TO postgres;

--
-- Name: WeeklyUpload_moemployeeuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."WeeklyUpload_moemployeeuser_id_seq" OWNED BY public."WeeklyUpload_moemployeeuser".id;


--
-- Name: WeeklyUpload_paymentstatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WeeklyUpload_paymentstatus" (
    id integer NOT NULL,
    "Pay_type" character varying(15) NOT NULL,
    "Pay_refno" character varying(100) NOT NULL,
    "Pay_date" date NOT NULL,
    "Pay_amount" bigint NOT NULL,
    "Dev_final" bigint NOT NULL,
    "Remarks" character varying(100),
    registration_id_id integer NOT NULL,
    "Status" character varying(50) NOT NULL,
    reject_remarks character varying,
    "Due_amount" bigint NOT NULL,
    "Paid_by" character varying(250) NOT NULL,
    "Paid_for" character varying(250) NOT NULL
);


ALTER TABLE public."WeeklyUpload_paymentstatus" OWNER TO postgres;

--
-- Name: WeeklyUpload_paymentstatus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."WeeklyUpload_paymentstatus_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."WeeklyUpload_paymentstatus_id_seq" OWNER TO postgres;

--
-- Name: WeeklyUpload_paymentstatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."WeeklyUpload_paymentstatus_id_seq" OWNED BY public."WeeklyUpload_paymentstatus".id;


--
-- Name: WeeklyUpload_surchargemodel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WeeklyUpload_surchargemodel" (
    id integer NOT NULL,
    year character varying(10) NOT NULL,
    month character varying(10) NOT NULL,
    srpc_duedate date NOT NULL,
    devfinal bigint NOT NULL,
    paid_date date NOT NULL,
    paid_amount bigint NOT NULL,
    calinterest bigint NOT NULL,
    reference_id_id integer NOT NULL,
    "Status" character varying(50) NOT NULL,
    actual_paid_date date,
    "isConsideredInBilling" boolean NOT NULL
);


ALTER TABLE public."WeeklyUpload_surchargemodel" OWNER TO postgres;

--
-- Name: WeeklyUpload_surchargemodel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."WeeklyUpload_surchargemodel_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."WeeklyUpload_surchargemodel_id_seq" OWNER TO postgres;

--
-- Name: WeeklyUpload_surchargemodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."WeeklyUpload_surchargemodel_id_seq" OWNED BY public."WeeklyUpload_surchargemodel".id;


--
-- Name: WeeklyUpload_tempdisbursedata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WeeklyUpload_tempdisbursedata" (
    id integer NOT NULL,
    disburseamount bigint NOT NULL,
    duetopool bigint NOT NULL,
    registration_id_id integer NOT NULL
);


ALTER TABLE public."WeeklyUpload_tempdisbursedata" OWNER TO postgres;

--
-- Name: WeeklyUpload_tempdisbursedata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."WeeklyUpload_tempdisbursedata_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."WeeklyUpload_tempdisbursedata_id_seq" OWNER TO postgres;

--
-- Name: WeeklyUpload_tempdisbursedata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."WeeklyUpload_tempdisbursedata_id_seq" OWNED BY public."WeeklyUpload_tempdisbursedata".id;


--
-- Name: WeeklyUpload_tempdisbursedatapreviousweeks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WeeklyUpload_tempdisbursedatapreviousweeks" (
    id integer NOT NULL,
    disburseamount bigint NOT NULL,
    duetopool bigint NOT NULL,
    registration_id_id integer NOT NULL
);


ALTER TABLE public."WeeklyUpload_tempdisbursedatapreviousweeks" OWNER TO postgres;

--
-- Name: WeeklyUpload_tempdisbursedatapreviousweeks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."WeeklyUpload_tempdisbursedatapreviousweeks_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."WeeklyUpload_tempdisbursedatapreviousweeks_id_seq" OWNER TO postgres;

--
-- Name: WeeklyUpload_tempdisbursedatapreviousweeks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."WeeklyUpload_tempdisbursedatapreviousweeks_id_seq" OWNED BY public."WeeklyUpload_tempdisbursedatapreviousweeks".id;


--
-- Name: WeeklyUpload_uniquestate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WeeklyUpload_uniquestate" (
    id integer NOT NULL,
    entity character varying(200) NOT NULL,
    registration_id character varying(100) NOT NULL
);


ALTER TABLE public."WeeklyUpload_uniquestate" OWNER TO postgres;

--
-- Name: WeeklyUpload_uniquestate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."WeeklyUpload_uniquestate_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."WeeklyUpload_uniquestate_id_seq" OWNER TO postgres;

--
-- Name: WeeklyUpload_uniquestate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."WeeklyUpload_uniquestate_id_seq" OWNED BY public."WeeklyUpload_uniquestate".id;


--
-- Name: YearCalendar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."YearCalendar" (
    id integer NOT NULL,
    year character varying(20) NOT NULL,
    weekno character varying(20) NOT NULL,
    "Week_startdate" date NOT NULL,
    "Week_enddate" date NOT NULL,
    srpc_date date NOT NULL,
    due_date date NOT NULL,
    disbursement_date date NOT NULL
);


ALTER TABLE public."YearCalendar" OWNER TO postgres;

--
-- Name: YearCalendar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."YearCalendar_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."YearCalendar_id_seq" OWNER TO postgres;

--
-- Name: YearCalendar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."YearCalendar_id_seq" OWNED BY public."YearCalendar".id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

--
-- Name: bank_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bank_images (
    id integer NOT NULL,
    "entityName" character varying(100) NOT NULL,
    image_url character varying(200) NOT NULL
);


ALTER TABLE public.bank_images OWNER TO postgres;

--
-- Name: bank_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bank_images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bank_images_id_seq OWNER TO postgres;

--
-- Name: bank_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bank_images_id_seq OWNED BY public.bank_images.id;


--
-- Name: bankdetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bankdetails (
    id integer NOT NULL,
    accountname character varying(100) NOT NULL,
    bankname character varying(100) NOT NULL,
    accountnumber integer NOT NULL,
    branchname character varying(100) NOT NULL,
    ifsccode character varying(100) NOT NULL,
    validfrom date NOT NULL,
    validtill date NOT NULL
);


ALTER TABLE public.bankdetails OWNER TO postgres;

--
-- Name: bankdetails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bankdetails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bankdetails_id_seq OWNER TO postgres;

--
-- Name: bankdetails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bankdetails_id_seq OWNED BY public.bankdetails.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: employee_signs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_signs (
    empno character varying(255),
    image_url character varying(255)
);


ALTER TABLE public.employee_signs OWNER TO postgres;

--
-- Name: images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.images (
    id integer NOT NULL,
    "entityName" character varying(100) NOT NULL,
    image_url character varying(200) NOT NULL
);


ALTER TABLE public.images OWNER TO postgres;

--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.images_id_seq OWNER TO postgres;

--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;


--
-- Name: DisbursedDate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DisbursedDate" ALTER COLUMN id SET DEFAULT nextval('public."DisbursedDate_id_seq"'::regclass);


--
-- Name: REACT_reactbasedata id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."REACT_reactbasedata" ALTER COLUMN id SET DEFAULT nextval('public."REACT_reactbasedata_id_seq"'::regclass);


--
-- Name: REACT_reactdisburseddate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."REACT_reactdisburseddate" ALTER COLUMN id SET DEFAULT nextval('public."REACT_reactdisburseddate_id_seq"'::regclass);


--
-- Name: REACT_reactduepool id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."REACT_reactduepool" ALTER COLUMN id SET DEFAULT nextval('public."REACT_reactduepool_id_seq"'::regclass);


--
-- Name: REACT_repaymentstatus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."REACT_repaymentstatus" ALTER COLUMN id SET DEFAULT nextval('public."REACT_repaymentstatus_id_seq"'::regclass);


--
-- Name: Registration_generalentities1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_generalentities1" ALTER COLUMN id SET DEFAULT nextval('public."Registration_generalentities1_id_seq"'::regclass);


--
-- Name: Registration_oldbankdetails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_oldbankdetails" ALTER COLUMN id SET DEFAULT nextval('public."Registration_oldbankdetails_id_seq"'::regclass);


--
-- Name: Registration_oldbankdetails2 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_oldbankdetails2" ALTER COLUMN id SET DEFAULT nextval('public."Registration_oldbankdetails2_id_seq"'::regclass);


--
-- Name: Registration_olddetails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_olddetails" ALTER COLUMN id SET DEFAULT nextval('public."Registration_olddetails_id_seq"'::regclass);


--
-- Name: Registration_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_user" ALTER COLUMN id SET DEFAULT nextval('public."Registration_user_id_seq"'::regclass);


--
-- Name: Registration_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_user_groups" ALTER COLUMN id SET DEFAULT nextval('public."Registration_user_groups_id_seq"'::regclass);


--
-- Name: Registration_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_user_user_permissions" ALTER COLUMN id SET DEFAULT nextval('public."Registration_user_user_permissions_id_seq"'::regclass);


--
-- Name: SRPC_Files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SRPC_Files" ALTER COLUMN id SET DEFAULT nextval('public."SRPC_Files_id_seq"'::regclass);


--
-- Name: SRPC_REACT_Files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SRPC_REACT_Files" ALTER COLUMN id SET DEFAULT nextval('public."SRPC_REACT_Files_id_seq"'::regclass);


--
-- Name: WeeklyUpload_approveauthority id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_approveauthority" ALTER COLUMN id SET DEFAULT nextval('public."WeeklyUpload_approveauthority_id_seq"'::regclass);


--
-- Name: WeeklyUpload_approveauthoritypreviousweeks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_approveauthoritypreviousweeks" ALTER COLUMN id SET DEFAULT nextval('public."WeeklyUpload_approveauthoritypreviousweeks_id_seq"'::regclass);


--
-- Name: WeeklyUpload_chatallmessages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_chatallmessages" ALTER COLUMN id SET DEFAULT nextval('public."WeeklyUpload_chatallmessages_id_seq"'::regclass);


--
-- Name: WeeklyUpload_configuremodel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_configuremodel" ALTER COLUMN id SET DEFAULT nextval('public."WeeklyUpload_configuremodel_id_seq"'::regclass);


--
-- Name: WeeklyUpload_dsmduepool id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_dsmduepool" ALTER COLUMN id SET DEFAULT nextval('public."WeeklyUpload_dsmduepool_id_seq"'::regclass);


--
-- Name: WeeklyUpload_finalpaydisburse1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_finalpaydisburse1" ALTER COLUMN id SET DEFAULT nextval('public."WeeklyUpload_finalpaydisburse1_id_seq"'::regclass);


--
-- Name: WeeklyUpload_finalreceivedisburse1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_finalreceivedisburse1" ALTER COLUMN id SET DEFAULT nextval('public."WeeklyUpload_finalreceivedisburse1_id_seq"'::regclass);


--
-- Name: WeeklyUpload_miscpaymentstatus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_miscpaymentstatus" ALTER COLUMN id SET DEFAULT nextval('public."WeeklyUpload_miscpaymentstatus_id_seq"'::regclass);


--
-- Name: WeeklyUpload_moemployeeuser id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_moemployeeuser" ALTER COLUMN id SET DEFAULT nextval('public."WeeklyUpload_moemployeeuser_id_seq"'::regclass);


--
-- Name: WeeklyUpload_paymentstatus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_paymentstatus" ALTER COLUMN id SET DEFAULT nextval('public."WeeklyUpload_paymentstatus_id_seq"'::regclass);


--
-- Name: WeeklyUpload_surchargemodel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_surchargemodel" ALTER COLUMN id SET DEFAULT nextval('public."WeeklyUpload_surchargemodel_id_seq"'::regclass);


--
-- Name: WeeklyUpload_tempdisbursedata id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_tempdisbursedata" ALTER COLUMN id SET DEFAULT nextval('public."WeeklyUpload_tempdisbursedata_id_seq"'::regclass);


--
-- Name: WeeklyUpload_tempdisbursedatapreviousweeks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_tempdisbursedatapreviousweeks" ALTER COLUMN id SET DEFAULT nextval('public."WeeklyUpload_tempdisbursedatapreviousweeks_id_seq"'::regclass);


--
-- Name: WeeklyUpload_uniquestate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_uniquestate" ALTER COLUMN id SET DEFAULT nextval('public."WeeklyUpload_uniquestate_id_seq"'::regclass);


--
-- Name: YearCalendar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."YearCalendar" ALTER COLUMN id SET DEFAULT nextval('public."YearCalendar_id_seq"'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: bank_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_images ALTER COLUMN id SET DEFAULT nextval('public.bank_images_id_seq'::regclass);


--
-- Name: bankdetails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bankdetails ALTER COLUMN id SET DEFAULT nextval('public.bankdetails_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);


--
-- Data for Name: DisbursedDate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DisbursedDate" (id, year, weekno, disbursed_date) FROM stdin;
10	2020-21	31	2020-11-24
11	2020-21	32	2020-12-07
12	2020-21	33	2020-12-09
14	2020-21	34	2020-12-16
15	2020-21	35	2020-12-23
17	2020-21	36	2020-12-29
18	2020-21	37	2021-01-05
\.


--
-- Data for Name: REACT_reactbasedata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."REACT_reactbasedata" (id, "Fin_year", "Week_no", "Consider_Week_no", "Week_startdate", "Week_enddate", "Revision_no", "Letter_refno", "Letter_date", "Payment_date", "Disbursement_date", "Lc_date", "Interest_levydate", "Entity", "DevFinal", "Outstandings", "Status", "PayableorReceivable", image_url, modified_remarks, registration_id, "ProRata") FROM stdin;
8	2020-21	20	20	2020-08-10	2020-08-16	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-08-25	2020-09-04	2020-09-07	2020-09-07	2020-09-07	ANDHRA PRADESH	898638	898638	Notified	Receivable From Pool	/static/images/SRPC/REACT2020-21/Week_No20/SRPC FileFORTUM FINNSURYA.pdf	null	SRRAP1DS	398780
9	2020-21	20	20	2020-08-10	2020-08-16	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-08-25	2020-09-04	2020-09-07	2020-09-07	2020-09-07	KARNATAKA	9429744	9429744	Notified	Receivable From Pool	/static/images/SRPC/REACT2020-21/Week_No20/SRPC FileFORTUM FINNSURYA.pdf	null	SRRKA1DS	4184550
10	2020-21	20	20	2020-08-10	2020-08-16	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-08-25	2020-09-04	2020-09-07	2020-09-07	2020-09-07	KERALA	3046481	3046481	Notified	Receivable From Pool	/static/images/SRPC/REACT2020-21/Week_No20/SRPC FileFORTUM FINNSURYA.pdf	null	SRRKL1DS	1351909
12	2020-21	20	20	2020-08-10	2020-08-16	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-08-25	2020-09-04	2020-09-07	2020-09-07	2020-09-07	PUDUCHERRY	763841	763841	Notified	Receivable From Pool	/static/images/SRPC/REACT2020-21/Week_No20/SRPC FileFORTUM FINNSURYA.pdf	null	SRRPO1DS	338963
13	2020-21	20	20	2020-08-10	2020-08-16	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-08-25	2020-09-04	2020-09-07	2020-09-07	2020-09-07	TELANGANA	3481912	3481912	Notified	Payable To Pool	/static/images/SRPC/REACT2020-21/Week_No20/SRPC FileFORTUM FINNSURYA.pdf	restored	SRADMIN	3481913
11	2020-21	20	20	2020-08-10	2020-08-16	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-08-25	2020-09-04	2020-09-07	2020-09-07	2020-09-07	TAMIL NADU	2792289	0	Complete	Payable To Pool	/static/images/SRPC/REACT2020-21/Week_No20/SRPC FileFORTUM FINNSURYA.pdf	sdsd	SRRTN1DS	2792289
\.


--
-- Data for Name: REACT_reactdisburseddate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."REACT_reactdisburseddate" (id, year, weekno, disbursed_date) FROM stdin;
\.


--
-- Data for Name: REACT_reactduepool; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."REACT_reactduepool" (id, year, from_year, to_year, actual_weekno, considered_weekno, dueinpool, transdate) FROM stdin;
2	2020-21	2020	2021	20	20	2792289	2021-01-06 12:59:18.74187+05:30
\.


--
-- Data for Name: REACT_repaymentstatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."REACT_repaymentstatus" (id, "Pay_type", "Pay_refno", "Pay_date", "Pay_amount", "Dev_final", "Due_amount", "Paid_by", "Paid_for", "Remarks", "Status", reject_remarks, registration_id_id) FROM stdin;
7	NEFT	sff	2021-01-06	3481912	3481912	0	SRLDC	TELANGANA	ewe	Rejected	not correct date	13
11	NEFT	fdgfgh	2021-01-06	1000000	3481912	1000000	SRLDC	TELANGANA	all paid	Rejected	rejecting	13
10	NEFT	asas	2021-01-06	2481912	3481912	3481912	SRLDC	TELANGANA	dsds	Rejected	rejecting	13
6	NEFT	dsds	2021-01-06	2792289	2792289	0	SRLDC	TAMIL NADU	ok	Approved	Null	11
\.


--
-- Data for Name: Registration_approved; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Registration_approved" ("entityName", "regAddress", region, "userCategory", "contactName", designation, telephone, "contactName2", designation2, telephone2, "contactName3", designation3, telephone3, "accountName", "accountNumber", "bankName", "branchName", "ifscCode", id, register_id, "accountNumber2", "bankName2", "branchName2", "ifscCode2", "ifscCode3", "ifscCode4", "ifscCode5", "ifscCode6", "accountName3", "accountName4", "accountName5", "accountName6", "bankName3", "bankName4", "bankName5", "bankName6", "branchName3", "branchName4", "branchName5", "branchName6", "accountNumber3", "accountNumber4", "accountNumber5", "accountNumber6", pannumber, gstinnumber, "accountName2", validfrom, validtill, adminremarks, remarks, tannumber) FROM stdin;
KARNATAKA TRANSMISSION	dgdfgdf	South	Transmission Licensee	dfghdfgh	DEPUTY MANAGER	555	dfghdfghdgh	jj	5666	\N	\N	\N	kar	123	hhh	uuu	123	4236	SRKAR                                                                                               	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	123	789	\N	2020-09-18	2045-09-06	approved on 18.09.2020	Check all details	456
Transmission Corporation of Andhra Pradesh	Hyderabad	South	Transmission Licensee	ap	ag	9845098450	ap	ag	9845098450	\N	\N	\N	icic	805006222	icic	icic	icic6222	2252	SRRAP1DS                                                                                            	\N																				\N	\N	\N	\N	botctc1235	gst1515rts151t1		2020-09-24	2045-09-06	ALL DETAILS ARE CORRECT	Check all details	1254545400
Kerala Electricity Board (KSEB)	Complex, Pattom, Thiruvanthapuram	South	Transmission Licensee	kseb	dg	9845098450	kseb	dg	9845098450	\N	\N	\N	Kerala State Electricity Board	57065480046	State Bank of Travancore	kerala	sbt00456	6166	SRRKL1DS                                                                                            	\N																				\N	\N	\N	\N	CPOPD12345	18AABCU9603R1ZM		2020-09-24	2045-09-06	Hereby approving the details	Details are correct ,all are perfect	PDES03028F
Tamil Nadu Transmission Corporation Ltd,	TANGEDCO	South	Transmission Licensee	TN	GM	9845098450	TN	DG	9845098450	\N	\N	\N	TANGEDCO	905020484	ICICI Bank	NUNGAMBAKKAM BRANCH	ICIC 0000009	8530	SRRTN1DS                                                                                            	\N																				\N	\N	\N	\N	BONEPJCDH2	GSTNUMBER123455		2020-09-25	2045-09-06	all ok	Check all details	TANNUMBER1
Puducherry Electricity Dept, Puducherry	Main Branch, Puducherry	South	Transmission Licensee	pondy	dg	9845098450	pondy	dg	9845098450	\N	\N	\N	Union Territory of Puducherry	30495445635	State Bank of India	Main Branch, Puducherry	SBIN0000900	5308	SRRPO1DS                                                                                            	\N																				\N	\N	\N	\N	CPOPD12345	18AABCU9603R1ZM		2020-09-25	2045-09-06	Ok	Check all details	PDES03028F
SRTS II POWEGRID HVDCPGCIL(SR) 	ICICI Bank, New Delhi	South	Transmission Licensee	PGHVDC	DN	9845098450	PGHVDC	DG	9845098450	\N	\N	\N	Powergrid	705002702	ICICI Bank	New Delhi	ISDF1250	4559	SRRPG1BY                                                                                            	\N																				\N	\N	\N	\N	SCHVSAKHD1	GST154815454452		2020-09-25	2045-09-06	Ok	Check all details	TANMUAJK12
Goa Electricity Board, GOA	GOA	South	Transmission Licensee	GOA	DGM	9845098450	GOA	DS	9845098450	\N	\N	\N	The Chief Engineer	1505000840	SBI	AUA	001505000840	6216	SRRGO1DS                                                                                            	\N																				\N	\N	\N	\N	BBBBBBBBBB	GST125255252211		2020-09-25	2045-09-06	Ok	Check all details	1234567898
NTPC Ramagundam Stage I & II	New Delhi	South	Generating Station	ntpc	dm	9845098450	ntpc	dd	9845098450	\N	\N	\N	National Thermal Power Corporation	705002440	ICICI Bank	ICICI Bank	ICICI Bank6212	8170	SRRRM1GN                                                                                            	\N																				\N	\N	\N	\N	panmune112	123456789784525		2020-09-25	2045-09-06	Ok	Check all details	1234567897
NTPC Ramagundam Stage III	New Delhi	South	Generating Station	RSTPS	DM	9845098450	RSTPS	DGM	9845098450	\N	\N	\N	National Thermal Power Corporation	705002440	ICICI Bank	New Delhi	ICICI Bank55	5145	SRRRM3GN                                                                                            	\N																				\N	\N	\N	\N	PAN1245684	ASDFG1234567898		2020-09-25	2045-09-06	Ok	Check all details	1234567897
NTPC Talcher Stage II	National Thermal Power Corporation	South	Generating Station	TAL	DN	9845098450	TAL	DM	9845098450	\N	\N	\N	National Thermal Power Corporation	705002440	ICICI Bank	ICICI Bank	ICICI Bank888	8157	SRRTL2GN                                                                                            	\N																				\N	\N	\N	\N	PAN1234568	GTS123456798974		2020-09-25	2045-09-06	Ok	Check all details	TAN1234567
NTPC Simhadri Stage II	SIMHADRI	South	Generating Station	SIMA	GM	9845098450	SIMA	DD	9845098450	\N	\N	\N	National Thermal Power Corporation	705002440	ICICI Bank	ICICI Bank	ICICI Bank122	1204	SRRSM2GN                                                                                            	\N																				\N	\N	\N	\N	PAN1234564	QQQQQQ2222QQ323		2020-09-25	2045-09-06	Ok	Check all details	TANMUMNER0
NTPC Simhadri Stage I	ICICI Bank	South	Generating Station	SIMA	DM	9845098450	AAA	aaa	9845098450	\N	\N	\N	icic	123456789	icic	icic	icic1234	3771	SRRSM1GN                                                                                            	\N																				\N	\N	\N	\N	pan1234124	252525258aa22aa		2020-09-25	2045-09-06	Ok	Check all details	aaaa252525
NTPC Tamilnadu Energy Company Ltd, Chennai	vallur	South	Generating Station	abc	abc	9845098450	abc	abc	9845098450	\N	\N	\N	abc	123456789	icic	icic	icic1234	823	SRRVR1GN                                                                                            	\N																				\N	\N	\N	\N	pan1234567	tanta1234567897		2020-09-25	2045-09-06	Ok	Check all details	tan1234567
NLC TPS II Stage I	NLC-1	South	Generating Station	ABC	ACB	9845098450	ABC	ACB	9845098450	\N	\N	\N	ABC	123456789	ICIC	ICIC	ICIC122	8579	SRRNL1GN                                                                                            	\N																				\N	\N	\N	\N	PAN1234567	TAN12645678125A		2020-09-25	2045-09-06	Ok	Check all details	TANA123456
NLC TPS II Stage II	NLC	South	Generating Station	icic	icic	9845098450	icic	icic	9845098450	\N	\N	\N	ABC	123456789	ICICI	ICIC	ICICI123	9421	SRRNL2GN                                                                                            	\N																				\N	\N	\N	\N	PAN1234562	TATAA1234567890		2020-09-25	2045-09-06	Ok	Check all details	TANA123456
NLC TPS I Expansion	NLCEXP	South	Generating Station	ABC	ABC	9845098450	AA	AA	9845098450	\N	\N	\N	AAA	123456	AA	AA	AAA	1985	SRRNE1GN                                                                                            	\N																				\N	\N	\N	\N	1234567890	123456789123450		2020-09-25	2045-09-06	Ok	Check all details	1234567899
NLC TPS II Expansion	nlcexp	South	Generating Station	aaa	aaa	9845098450	aaa	aaa	98945098450	\N	\N	\N	aaa	123456	aaa	aaa	aaa	8169	SRRNE2GN                                                                                            	\N																				\N	\N	\N	\N	1234567922	gst12345678945s		2020-09-25	2045-09-06	Ok	Check all details	1234678945
NLC Tamilnadu Power Limited, Tuticorin	ntpl	South	Generating Station	aaa	aaa	9845098450	aaa	aa	9845098450	\N	\N	\N	aaa	1234	aaa	aaa	aaa	3401	SRRTU1GN                                                                                            	\N																				\N	\N	\N	\N	1234567890	111111111111111		2020-09-25	2045-09-06	Ok	Check all details	1234567890
NTPC Kudgi Super Thermal Power Plant	KUDGI	South	Generating Station	AAA	AAA	9845098450	AAA	AA	9845098450	\N	\N	\N	AAA	1234	AAA	AAA	AAAA	7919	SRRKT1GN                                                                                            	\N																				\N	\N	\N	\N	1234567890	123456789123456		2020-09-25	2045-09-06	Ok	Check all details	1234567897
New Neyveli Thermal Power Project	NNTPP	South	Generating Station	AAA	AAA	9845098450	AAA	AAA	9845098450	\N	\N	\N	AAA	123456789	AAA	AAA	AAA	6619	SRRNN1GN                                                                                            	\N																				\N	\N	\N	\N	1234567897	123456789777777		2020-09-25	2045-09-06	Ok	Check all details	1234567890
Karnataka Power Transmission Corp. Ltd	Madhavanagar, Cresent Road,Bangalore-560001	South	Transmission Licensee	kptcl	dg	9845098450	kptcl	dg	9845098450	kptcl	dg	9845098450	Karnataka Power Transmission	64022936516	State Bank of Mysore	bangalore	sbi6515	3274	SRRKA1DS                                                                                            	\N																				\N	\N	\N	\N	CPOPD12345	18AABCU9603R1ZM		2020-09-25	2045-09-06	Ok	Details seems to be correct ,but check one more time admin	PDES03028F
SEIL/ TPCIL 	Flat No 501,Vishwa Bharathi Kutir Near Yeshwantpur Metro,Yeshwantpur	South	Seller	Santhosh	asst manager	97789778	Ram Murthy	Manager	876786867867	\N	\N	\N	UDAY SANTHOSH	1234	STATE BANK OF INDIA	Yeshwantpur	SBIN001290	7066	SRRSE1SL                                                                                            	\N																				\N	\N	\N	\N	CPOPD1610L	CPOPD1610L12346		2020-09-29	2045-09-06	ALL ARE CORRECT	All details seems to be correct	CPOPD1610L
ACME KARNAL POWER PROJECT LTD	Ashutosh Singh - O&M Solar, Plot No. 152, Sector -44,Gurgaon,\nHaryana, 122003	South	Generating Station	DSD	DSDS	6656565	SDSDS	dsdsa	5658656865658	\N	\N	\N	steve smith	895623	sharjah bank of corporation	sharjag banka	SBHUY5467TY	6319	SRRAK1GN                                                                                            	\N																				\N	\N	\N	\N	CPOPD1610L	CPOPD1610L9IUY6		2020-09-29	2045-09-06	all details are correct	Check all details	CPOPD1610L
SEMBCORP ENERGY PVT LTD	Sembcorp Gayatri Power Ltd., TP Gudur Mandal, Nellore -\n524344, Andhra Pradesh. 	South	Generating Station	ASAS	SASA	8695865656	SASAS	SASA	8965656586	\N	\N	\N	sANTHOISH	1234	STATE BANK OF INDIA	YESHWANTPUR	SNIB00125	7884	SRRTP1SL                                                                                            	\N																				\N	\N	\N	\N	CPOP1345L7	CPOP1345L73456T		2020-09-29	2045-09-06	dsdsds	Check all details	CPOP1345L7
LANCO KONDAPALI STAGE 2	Sembcorp Gayatri Power Ltd., TP Gudur Mandal, Nellore -\n524344, Andhra Pradesh. 	South	Generating Station	AAD	DSDS	956565	DSDSDSD	DSDSDS	88787878	\N	\N	\N	SUMANTH	1452	STATE BANK OF INDIA	YESHWANTPUR	SBIN145266	6840	SRRLK2SL                                                                                            	\N																				\N	\N	\N	\N	CPOP1345L7	CPOP1345L73456T		2020-09-29	2045-09-06	All details seems to be correct	Check all details	CPOP1345L7
LANCO KONDAPALLI ST3	LANCO-Kondapalli Power Ltd , Plot No: 4, Software Units\nLayout, Hitech City, Madhapur , Hyderabad , PIN: 500081 ,\nTelangana.	South	Generating Station	dsds	dsds	985444	asdffghf	ghsghfdgsgh	86565565	\N	\N	\N	Rajendra	2563	AXIS BANK OF INDIA	MALLESHWARAM	AXIN1456	3348	SRRLK3SL                                                                                            	\N																				\N	\N	\N	\N	CPOPD1610L	CPOPD1610L56487		2020-09-29	2045-09-06	All details seems to be correct	Check all details	CPOPD1610L
Betam Wind Energy Private Limited	Sr. General Manager, Avaada Solarise Energy Pvt Ltd.,910/19 , Suryakiran, Kasturba Gandhi Marg, New Delhi - 110001, India	South	Generating Station	a	b	9845098450	a	a	9845098450	\N	\N	\N	BETAM	123456	icic	betam	icici124	1	SRRBT1GN                                                                                            	\N																				\N	\N	\N	\N	betam12345	123456789012345		2020-09-29	2045-09-06	All details seems to be correct	Check all details	1234567891
COASTAL ENERGY PVT LTD	Coastal Energen Pvt. Ltd 7th Floor, Buhari Towers, 4 Moores\nRoad, Chennai , PIN: 600006, Tamil Nadu .\n	South	Generating Station	dsds	dsds	99565656	dsds	dsd	5365656	\N	\N	\N	Santhosh	1258	State Bank of iNdaia	Malleshwaram	sbin14568	8732	SRRCG1SL                                                                                            	\N																				\N	\N	\N	\N	CPOPD1610L	CPOPD1610L56897		2020-09-29	2045-09-06	All details seems to be correct	Check all details	CPOPD1610L
Orange Sironj wind power pvt Ltd	Assistant General Manager - Electrical, F-9, First Floor , Manisha Plaza -1, Plot No 7, MLU Sector-10, Dwarka, New Delhi- 110075	South	Generating Station	Orange	Orange	9845098450	Orange	Orange	9845098450	\N	\N	\N	ORANGE	123456	ORANGE	ORANGE	ORANGE1234	7675	SRROW1GN                                                                                            	\N																				\N	\N	\N	\N	ORANGE1234	ORANGE222222212		2020-09-29	2045-09-06	All details seems to be correct	Check all details	ORANGE1123
IL&FS ENERGY PVT LTD	Senior General Manager, IL & FS Tamilnadu Power Company\nLtd., C.Pudhupettai (Post),\nParangipettai (Via), Chidambaram (Tk.)	South	Generating Station	sAAS	ASA	898965656	SASAS	SASAS	65686565656	\N	\N	\N	sARLDC MO	2456	CP BANK LIMITED	RAGANNAGUDA	CPOIU78656	233	SRRIL1SL                                                                                            	\N																				\N	\N	\N	\N	CPOPD1610L	CPOOPD1610L4589		2020-09-29	2045-09-06	All details seems to be correct	Check all details	CPOPD1610L
Green Infra Renewable Energy Limited	Executice, Operations & maintenance , Semcorb Green Infra Renewable Energy Ltd, 5th Floor, Tower C, Building No8, DLF Cyber city, Gurgaon - 122202	South	Generating Station	Green Infra 	Green Infra 	9845098450	Green Infra 	Green Infra 	9845098450	\N	\N	\N	Green Infra 	123456	Green Infra 	Green Infra 	Green Infra 1234	9141	SRRGW1GN                                                                                            	\N																				\N	\N	\N	\N	CPOP1345L7	CPOP1345L73456T		2020-09-29	2045-09-06	All details seems to be correct	Check all details	CPOP1345L7
SEMBCORP ENERGY PVT LTD 2	Sembcorp Gayatri Power Ltd., TP Gudur Mandal, Nellore -\n524344, Andhra Pradesh. 	South	Generating Station	SANTHIH	SDGHJH	565656656	GDHJGDHJGH	FGFGHJGH	95565	\N	\N	\N	SUMANTH RAO	4561	CORPORATE BANK	RAGANNAGUDA	CPUITGB123	3075	SRRNC1SL                                                                                            	\N																				\N	\N	\N	\N	CPOPD1610L	CPOPD1610L89457		2020-09-29	2045-09-06	All details seems to be correct	Check all details	CPOPD1610L
ACME HISAR POWER PROJECT LTD	Ashutosh Singh - O&M Solar, Plot No. 152, Sector -44,Gurgaon,\nHaryana, 122003.	South	Generating Station	sds	dsds	566565565	fdgfghjg	ghfgdghj	985656656	\N	\N	\N	Santhosh Ramaswamy	7895	AXIS BANK INDIA LTD	SHARJAH	AXIN3255	5150	SRRAH1GN                                                                                            	\N																				\N	\N	\N	\N	CPOPD1610L	CPOPD1610L58974		2020-09-29	2045-09-06	All details seems to be correct	Check all details	CPOPD1610L
Mytrah Energy (India) Energy Pvt Ltd	Chief Operating officer (Wind & Solar),Mytrah Energy (India) Private Limited, 8001, Q – City, S.No:109,Gachibowli,	South	Generating Station	MYTRAH	DEM	9845098450	MYTRAH	MYTRAH	9845098450	\N	\N	\N	MYTRAH	1234	MYTRAH	MYTRAH	MYTRAH1234	8488	SRRMW1GN                                                                                            	\N																				\N	\N	\N	\N	CPOP1345L7	CPOP1345L73456T		2020-09-29	2045-09-06	All details seems to be correct	Check all details	CPOP1345L7
ACME BHIWADI SOLAR POWER PROJECT LTD	Ashutosh Singh - O&M Solar, Plot No. 152, Sector -44,Gurgaon,\nHaryana, 122003	South	Generating Station	dhshghg	ghjgshjf	85655	dshjgjh	jgsghjgh	565686565	\N	\N	\N	Santhsh	4561	Statae bank of idiaa	Ragannagida	sbin65346	9108	SRRAB1GN                                                                                            	\N																				\N	\N	\N	\N	CPOP1345L7	CPOP1345L73456T		2020-09-29	2045-09-06	All details seems to be correct	Check all details	CPOP1345L7
Avaada Solarise Energy Pvt. Ltd. (Pavagada Solar Park)	Sr. General Manager,Avaada Solarise Energy Pvt Ltd.,910/19 , Suryakiran, Kasturba Gandhi Marg, New Delhi - 110001, India.	South	Generating Station	ravi	d	9845098450	deva	dd	9845098450	\N	\N	\N	a	1234	a	a	aaaa1234	1914	SRRAS1GN                                                                                            	\N																				\N	\N	\N	\N	apcber1234	APCBER123412345		2020-09-29	2045-09-06	All details seems to be correct	Check all details	APCBER1234
AZURE THIRTTY SIX PVT LTD	General Manager , 3rd floor, Asset 301-304, World mark 3,\nAerocity, Delhi, 110037	South	Generating Station	SDGHJG	HGHJDFGHG	5656895656	DFGSHJGD	GDGFHJGH	86568565665	\N	\N	\N	SUMANTH	4562	SANTHHKJHJ	SANTHISHH	SBIN56767	2489	SRRAZ1GN                                                                                            	\N																				\N	\N	\N	\N	CPOD161065	CPOD16106568KLI		2020-09-29	2045-09-06	All details seems to be correct	Check all details	CPOD161065
Azure Power Earth Private Ltd. (Pavagada Solar Park) 	Manager-Project Development, Azure Power Earth Private Ltd.ASSET 301-304 & 307,3rd Floor, World Mark 3, New Delhi - 110037, India.	South	Generating Station	AZUREEARTH	AA	9845098450	AZUREEARTH	AS	9845098450	\N	\N	\N	AZUREEARTH	1234	AZUREEARTH	AZUREEARTH	AZUREEARTH	6503	SRRAE1GN                                                                                            	\N																				\N	\N	\N	\N	AZUREEARTH	AZUREEARTH12345		2020-09-29	2045-09-06	All details seems to be correct	Check all details	AZUREEARTH
KARNATAKA RENEWABLE ENERGY DEVELOPMENT LIMITED (Pavagada Solar Park) 	KREDL	South	Generating Station	KREDL	KREDL	9845098450	KREDL	KREDL	9845098450	\N	\N	\N	KREDL	1234	KREDL	KREDL	KREDL	8962	SRRKR1GN                                                                                            	\N																				\N	\N	\N	\N	CPOP1345L7	CPOP1345L73456T		2020-09-29	2045-09-06	All details seems to be correct	Check all details	CPOP1345L7
Fortum Solar India Private Limited. (Pavagada Solar Park)	FORTUMSOLAR	South	Generating Station	FORTUMSOLAR	FORTUMSOLAR	9845098450	FORTUMSOLAR	FORTUMSOLAR	9845098400	\N	\N	\N	FORTUMSOLAR	1234	FORTUMSOLAR	FORTUMSOLAR	FORTUMSOLAR	8003	SRRFS1GN                                                                                            	\N																				\N	\N	\N	\N	FORTUMSOLA	FORTUMSOLA12345		2020-09-29	2045-09-06	All details seems to be correct	Check all details	FORTUMSOLA
ADYAH BLOCK 3 SOLAR ENERGY PVT LIMITED	ADYAH BLOCK	South	Generating Station	ADYAH BLOCK	ADYAH BLOCK	9845098940	ADYAH BLOCK	ADYAH BLOCK	9845098405	\N	\N	\N	ADYAH BLOCK	1234	ADYAH BLOCK	ADYAH BLOCK	ADYAH BLOCK	9852	SRRAD3GN                                                                                            	\N																				\N	\N	\N	\N	ADYAHBLOCK	ADYAHBLOCK13322		2020-09-29	2045-09-06	All details seems to be correct	Check all details	ADYAHBLOCK
ADYAH BLOCK 6 SOLAR PVT LIMITED	ADYAHB	South	Generating Station	ADYAHB	ADYAHB	9845098450	ADYAHB	ADYAHB	9845098450	\N	\N	\N	ADYAHB	1234	ADYAHB	ADYAHB	ADYAHB	9216	SRRAD6GN                                                                                            	\N																				\N	\N	\N	\N	CPOP1345L7	CPOP1345L73456T		2020-09-29	2045-09-06	All details seems to be correct	Check all details	CPOP1345L7
Yarrow Infra Structure Private Ltd. (Pavagada Solar Park) 	yarrow	South	Generating Station	yarrow	yarrow	9845098450	yarrow	yarrow	9845098450	\N	\N	\N	yarrow	1234	yarrow	yarrow	yarrow	6215	SRRYP1GN                                                                                            	\N																				\N	\N	\N	\N	yarrow1234	yarrow123412345		2020-09-29	2045-09-06	All details seems to be correct	Check all details	yarrow1234
TATA SOLAR POWER PROJECT LTD	Group Head Commercial, Tata Power Renewable Energy\nLtd,Corporate Centre,34 Sant Tukaram Road, Carnac\nBunder,Mumbai 400009,Maharashtra India.	South	Generating Station	Santhosh	ASST MANAGER	65989556	Sumanth	Manager	6568565656	\N	\N	\N	Santhosh	45698	hdfc bank	malleshwaram	SBIYH7878	7517	SRRTA1GN                                                                                            	\N																				\N	\N	\N	\N	CPOD1610L5	CPOD1610L698745		2020-09-29	2045-09-06	All details seems to be correct	Check all details	CPOD1610L4
ReNew Wind Energy (TN2) Private Limited (Pavagada Solar Park	RENEW	South	Generating Station	RENEW	RENEW	9845098450	RENEW	RENEW	9845098450	\N	\N	\N	RENEW	1234	RENEW	RENEW	RENEW	6805	SRRRN1GN                                                                                            	\N																				\N	\N	\N	\N	RENEW12345	RENEW1234512345		2020-09-29	2045-09-06	All details seems to be correct	Check all details	RENEW12345
NTPC ANANTHAPURAM SOLAR POWER PROJECT	Group Head Commercial, 2nd Floor, Block B, Corporate\nCentre, 34, Sant Tukaram Road, Carnac Bunder, Mumbai,\nMaharashtra- 400009	South	Generating Station	sadsd	dsds	69857998	fgdhjg	ghjdfghg	45454564565	\N	\N	\N	venatesh	5825	dfsghdfg	MALLESHWARAM	SBOIUNG458	8706	SRRNS1GN                                                                                            	\N																				\N	\N	\N	\N	CPOPD16105	CPOPD1610578JKL		2020-09-29	2045-09-06	All details seems to be correct	Check all details	CPOPD16105
Parampujya Solar Energy Private Ltd. (Pavagada Solar Park) 	PARAMPUJYA	South	Generating Station	PARAMPUJYA	PARAMPUJYA	9845098450	PARAMPUJYA	PARAMPUJYA	9845609845	\N	\N	\N	PARAMPUJYA	1234	PARAMPUJYA	PARAMPUJYA	PARAMPUJYA	4881	SRRPP1GN                                                                                            	\N																				\N	\N	\N	\N	PARAMPUJYA	PARAMPUJYA12345		2020-09-29	2045-09-06	All details seems to be correct	Check all details	PARAMPUJYA
Fortum Finnsurya Energy Private Ltd. (Pavagada Solar Park) 	FINNSURYA	South	Generating Station	FINNSURYA	FINNSURYA	9845098450	FINNSURYA	FINNSURYA	9845098450	\N	\N	\N	FINNSURYA	1234	FINNSURYA	FINNSURYA	FINNSURYA	1753	SRRFP1GN                                                                                            	\N																				\N	\N	\N	\N	FINNSURYA1	FINNSURYA123456		2020-09-29	2045-09-06	All details seems to be correct	Check all details	FINNSURYA1
ACME REWARI Solar Power Pvt Ltd. (Pavagada Solar Park) 	ACMEREWARI	South	Generating Station	ACMEREWARI	ACMEREWARI	9845098450	ACMEREWARI	ACMEREWARI	9845098450	\N	\N	\N	ACMEREWARI	1234	ACMEREWARI	ACMEREWARI	ACMEREWARI	8296	SRRAR1GN                                                                                            	\N																				\N	\N	\N	\N	ACMEREWARI	ACMEREWARI12344		2020-09-29	2045-09-06	All details seems to be correct	Check all details	ACMEREWARI
FRV I SOLAR POWER PROJECT LTD	General Manager , 3rd floor, Asset 301-304, World mark 3,\nAerocity, New Delhi- 110037	South	Generating Station	sa	dsds	57888565656	sdhjff	fsdghfsgf	656985656	\N	\N	\N	Santhosh	1254	sasytaysg	Yeshwantpur	sbin6756	9027	SRRFR1GN                                                                                            	\N																				\N	\N	\N	\N	CPOP1345L7	CPOP1345L73456T		2020-09-29	2045-09-06	All details seems to be correct	Check all details	CPOP1345L7
SBH CLEANTECH PVT SOLAR LIMITED	Sr. manager, SBG CLEANTECH Projectco Five PVT, LTD. 1st\nFloor, Worldmark-2 Asset Area - 8, Aerocity,New Delhi110037, India\n	South	Generating Station	asad	sdsd	656856565	dsds	dsds	989895656	\N	\N	\N	Santhosh	4562	Satet Bank of india	Yeshwantpur	sbin456215	4378	SRRSC2GN                                                                                            	\N																				\N	\N	\N	\N	CPOPD1610L	CPOPD1610LGHTYE		2020-09-29	2045-09-06	All details seems to be correct	Check all details	CPOPD1610L
ACME Kurukshetra Solar Energy Pvt. Ltd. (Pavagada Solar Park)	ACMEKURU	South	Generating Station	ACMEKURU	ACMEKURU	9845098450	ACMEKURU	ACMEKURU	9845099840		\N	\N	ACMEKURU	1234	ACMEKURU	ACMEKURU	ACMEKURU	2388	SRRKP1GN                                                                                            	\N																				\N	\N	\N	\N	ACMEKURU12	ACMEKURU1212347		2020-09-29	2045-09-06	All details seems to be correct	Check all details	ACMEKURU12
ADYAH SOLAR ENERGY PVT LTD	Asst Manager Adyah Solar Energy Pvt Ltd.(Block 10),138, Ansal\nChambers -II, Bhikaji Cama Place , New Delhi-110066	South	Generating Station	manoj	executive enginerr	5588456454	Saruoio	fgdhjgfhj	5645475646	\N	\N	\N	Srikanth	45623	ICICI Bank	rajajinagar	SBIN43574656	1722	SRRAD1GN                                                                                            	\N																				\N	\N	\N	\N	CPOPD1610L	CPOPD1610L45878		2020-09-29	2045-09-06	All details seems to be correct	Check all details	CPOPD1610L
Adyah Solar Energy Pvt, Ltd. (Pavagada Solar Park) 	Asst Manager Adyah Solar Energy Pvt Ltd.(Block 10),138, Ansal\nChambers -II, Bhikaji Cama Place , New Delhi-110066.	South	Generating Station	DSDS	DSDS	485656656	SGHFGF	FSGHDFGH	6568568565	\N	\N	\N	SUMANTH	45269	AXIS BANK INDIA	STATE BANK LIMITED	AXIN45896	1436	SRRAD2GN                                                                                            	\N																				\N	\N	\N	\N	CPOPD1610L	CPOPD1610L56987		2020-09-29	2045-09-06	All details seems to be correct	Check all details	CPOPD1610L
ADYAH BLOCK 3 SOLAR ENERGY PVT LIMITED	Asst Manager Adyah Solar Energy Pvt Ltd.(Block 10),138, Ansal\nChambers -II, Bhikaji Cama Place , New Delhi-110066.	South	Generating Station	DSGHJF	FGSHDFGH	9656568656	DSHDGHG	GHSDFGFG	5656856865658	\N	\N	\N	RAGHU	45826	HDFC BANK OF INDIA	RAGANNAGUDA	AXOIN4586	5100	SRRAD3GN                                                                                            	\N																				\N	\N	\N	\N	CPOPD15896	CPOPD1589645875		2020-09-29	2045-09-06	All details seems to be correct	Check all details	CPOPD15896
Tata Power Renewable Energy limited (Pavagada Solar Park) 	TATA PAVAGADA	South	Generating Station	TATA PAVAGADA	TATA PAVAGADA	9845098450	TATA PAVAGADA	TATA PAVAGADA	9845098450	\N	\N	\N	TATA PAVAGADA	1234	TATA PAVAGADA	TATA PAVAGADA	TATA PAVAGADA	16	SRRTP1GN                                                                                            	\N																				\N	\N	\N	\N	CPOP1345L7	CPOP1345L73456T		2020-09-29	2045-09-06	All details seems to be correct	Check all details	CPOP1345L7
TELANGANA TRANSIMISSION CORPORATION LIMITED	The Chief Engineer (Commercial), Telangana Power\nCoordination Committee, 4th Floor, Vidyuth Soudha,\nKhairatabad, Hyderabad, PIN: 500082, Telangana.	South	Transmission Licensee	dasdsa	asa	564587456	dsds	dsd	8852242	\N	\N	\N	Sannthosh	1234	Statre bank of india	RAGANNAGUDA	SVIUBNN	2568	SRRTS1DS 2                                                                                          	\N																				\N	\N	\N	\N	CPOPD1610L	CPOPD1610LJHJHJ		2020-09-29	2045-09-06	All details seems to be correct	Check all details	CPOPD1610L
SBG CLEANTECH Projectco Five PVT, LTD.	SBG CLEANTECH	South	Generating Station	SBG CLEANTECH	SBG CLEANTECH	1234	SBG CLEANTECH	SBG CLEANTECH	1123	\N	\N	\N	SBG CLEANTECH	0	SBG CLEANTECH	SBG CLEANTECH	SBG CLEANTECH	5098	SBE                                                                                                 	\N																				\N	\N	\N	\N	SBGEANTECH	SBGEANTECH12345		2020-09-30	2045-09-06	All details seems to be correct	Check all details	SBGEANTECH
MEL	MEL	South	Generating Station	MEL	MELMEL	12313	MEL	MEL	13134	\N	\N	\N	MEL	1234	MEL	MEL	MEL	203	MEL                                                                                                 	\N																				\N	\N	\N	\N	CPOP1345L7	CPOP1345L73456T		2020-09-30	2045-09-06	All details seems to be correct	Check all details	CPOP1345L7
wr	wr	South	Generating Station	WR	WR	984589845	WR	WR	9845984589	\N	\N	\N	WR	1234	WR	WR	WR	5863	wr                                                                                                  	\N																				\N	\N	\N	\N	CPOP1345L7	CPOP1345L73456T		2020-09-30	2045-09-06	All details seems to be correct	Check all details	CPOP1345L7
ER	ER	South	Generating Station	ER	ER	1123	ER	ER	123345	\N	\N	\N	ER	1234	ER	ER	ER	1330	ER                                                                                                  	\N																				\N	\N	\N	\N	1234567891	123456789111234		2020-09-30	2045-09-06	All details seems to be correct	Check all details	1234567891
Adyah Solar Energy Pvt, Ltd. (Pavagada Solar Park)	ADYAHBLOCK1	South	Generating Station	ADYAH	ADYAH	9845098945	ADYAH	ADYAH	9841509455	\N	\N	\N	ADYAH	1234	ADYAH	ADYAH	ADYAH	9948	SRRAD5GN                                                                                            	\N																				\N	\N	\N	\N	ADYAH12345	ADYAH1112122222		2020-09-30	2045-09-06	All details seems to be correct	Check all details	ADYAH12345
Adyah Solar Energy Pvt, Ltd. (Pavagada Solar Park)	ADYAHB3	South	Generating Station	ADYAHB	ADYAHB	9874661223	ADYAHB	ADYAHB	1234567	\N	\N	\N	ADYAHB	1234	ADYAHB	ADYAHB	ADYAHB	6520	ADYAHB                                                                                              	\N																				\N	\N	\N	\N	ADYAHB1234	ADYAHB123412362		2020-09-30	2045-09-06	All details seems to be correct	Check all details	ADYAHB1234
Adyah Solar Energy Pvt, Ltd. (Pavagada Solar Park)	ADYAHB10	South	Generating Station	ADYAHB	ADYAHB	984509898	ADYAHB	ADYAHB	989080899	\N	\N	\N	ADYAHB	1234	ADYAHB	ADYAHB	ADYAHB10	6167	SRRAD4GN                                                                                            	\N																				\N	\N	\N	\N	ADYAHB1012	ADYAHB101212365		2020-09-30	2045-09-06	All details seems to be correct	Check all details	ADYAHB1012
BETAM  	BETAM50MW	South	Generating Station	BETAM	BETAM	1234	BETAM	BETAM	13454564889	\N	\N	\N	BETAM	1234	BETAM	BETAM	BETAM	3228	BETAM                                                                                               	\N																				\N	\N	\N	\N	BETAM12345	BETAM1234523652		2020-09-30	2045-09-06	All details seems to be correct	Check all details	BETAM12345
Ayana Anathapuram Solar Private Limited	3rd Floor Sheraton Grand Hotek Raj Kumar Road Malleshwaram Bengalur 560055	South	Generating Station	Nitin Upadhay	Project Manager	789798798789	Lakshmi Narayanan	Authorized Signatory	89787878787	\N	\N	\N	AYANA SOLAR	39560714554	State Bank of India	Residential Plaza	MICR560002059	2576	SRRAY1GN                                                                                            	39560714554	State Bank of India	Residential Plaza	MICR560002059	MICR560002059	MICR560002059	MICR560002059	MICR560002059	AYANA SOLAR	AYANA SOLAR	AYANA SOLAR	AYANA SOLAR	State Bank of India	State Bank of India	State Bank of India	State Bank of India	Residential Plaza	Residential Plaza	Residential Plaza	Residential Plaza	39560714554	39560714554	39560714554	39560714554	AARCA0616L	37AARCA0616L1ZF	AYANA SOLAR	2020-11-10	2045-09-06	All details seems to be correct	ALL DETAILA ARE IN ORDER ,GO AHEAD	CPOP1345L7
FRV II SOLAR INDIA POWER LIMITED	General Manager , 3rd floor, Asset 301-304, World mark 3,\nAerocity, New Delhi- 110037	South	Generating Station	SDS	DSDS	89565656	GSDHJGHJ	GFHJDG	65685656	\N	\N	\N	LIKITH	4562	DSFDSF	FDGHSFGHF	FDGHSFDSGFDH	652	SRRFR2GN                                                                                            	\N																				\N	\N	\N	\N	CPOPD1890L	CPOPD1890L78LOI		2020-09-29	2045-09-06	All details seems to be correct	Check all details	CPOPD1890L
Avaada Solar Energy Private Ltd. (Pavagada Solar Park) 	Sr.Manager, Avaada Solar Energy Private Ltd. 3rd Floor, PTI\nBuilding, 4 Parliament Street Delhi - 110001, India. 	South	Generating Station	SASA	SASA	6568656865	SASASA	GFHJSGHJG	32656856	\N	\N	\N	sANTHOSH	1452	sTATE bANK OF INDIA	sTATE SBI	SBAI687786	512	SRRAP1GN                                                                                            	\N																				\N	\N	\N	\N	CPOPD1610L	CPOPD1610LJGYHR		2020-09-29	2045-09-06	All details seems to be correct	Check all details	CPOPD1610L
TRISSUR PGCIL(SR)	SYNERGY HOMES BACKSIDE ZPHS RAGANNAGUDA	South	Generating Station	ROHIT DWIVEDI	PROJECT MANAGER	798789798987	ROHIT KHANDELAWAL	PROJECT EXECUTIVE	78687687678	\N	\N	\N	POWERGRID THRISSUR	234567890	State Bank of India	MALLESHWARAM	SBIN67676786	7789	SRRPG2BY                                                                                            	234567	State Bank of India	MALLESHWARAM	SBIN67676786	SBIN67676786	SBIN67676786	SBIN67676786	SBIN67676786	POWERGRID THRISSUR	POWERGRID THRISSUR	POWERGRID THRISSUR	POWERGRID THRISSUR	State Bank of India	State Bank of India	State Bank of India	State Bank of India	MALLESHWARAM	MALLESHWARAM	MALLESHWARAM	MALLESHWARAM	1234789	234567	234567	67890	CPOPD1897L	GFGSJHGFG678686	POWERGRID THRISSUR	2020-11-17	2045-09-06	All details seems to be correct	Check all details	STUVR45777
\.


--
-- Data for Name: Registration_employeeuser1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Registration_employeeuser1" (name, email, designation, registration_id_id, usertype, empno, contact_number) FROM stdin;
\.


--
-- Data for Name: Registration_formdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Registration_formdata" ("entityName", "regAddress", region, "userCategory", "contactName", designation, telephone, "contactName2", designation2, telephone2, "contactName3", designation3, telephone3, "accountName", "accountNumber", "bankName", "branchName", "ifscCode", "accountName2", "accountNumber2", "bankName2", "branchName2", "ifscCode2", "accountName3", "accountNumber3", "bankName3", "branchName3", "ifscCode3", id, register_id, "accountName4", "accountName5", "accountName6", "accountNumber4", "accountNumber5", "accountNumber6", "bankName4", "bankName5", "bankName6", "branchName4", "branchName5", "branchName6", "ifscCode4", "ifscCode5", "ifscCode6", remarks, "isFinanceVerified", gstinnumber, pannumber, tannumber, "isFinanceApproved") FROM stdin;
\.


--
-- Data for Name: Registration_generalentities1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Registration_generalentities1" (id, alias1, alias2, alias3, alias4, fullname, dateofregistration, shortname, usercategory, usertype, mobileno, registration_id_id, email) FROM stdin;
6	KERALA	KERALA	KERALA	\N	Kerala Electricity Board (KSEB)	2020-09-24	KSEB	Transmission Licensee	General Member	9845098450	95	test@test.com
7	Tamil Nadu	Tamil Nadu	Tamil Nadu	\N	Tamil Nadu Transmission Corporation Ltd,	2020-09-24	TN	Transmission Licensee	General Member	9845098450	96	test@gmail.com
11	NTPC,RSTPS	NTPC,RSTPS	NTPC,RSTPS	\N	NTPC Ramagundam Stage I & II	2020-09-24	NTPC,RSTPS	Generating Station	General Member	9845098450	106	test@test.com
21	NTPL	NTPL	NTPL	\N	NLC Tamilnadu Power Limited, Tuticorin	2020-09-24	NTPL	Generating Station	General Member	9845098450	116	TEST@GMAIL.COM
22	NTPC,Kudgi-Stage I	NTPC,Kudgi-Stage I	NTPC,Kudgi-Stage I	\N	NTPC Kudgi Super Thermal Power Plant	2020-09-24	NTPC,Kudgi-Stage I	Generating Station	General Member	9845098450	117	TEST@GMAIL.COM
23	NNTPP	NNTPP	NNTPP	\N	New Neyveli Thermal Power Project	2020-09-24	NNTPP	Generating Station	General Member	9845098450	118	test@test.com
24	SRLDC FIN	SRLDC FINANCE	FINANCE DEPT SRLDC POSOCO	FINANCE	SRLDC FINANCE DEPARTMENT	2020-09-24	FINANCE	Others	Finance	7779878878	119	test@test.com
4	Andhra Pradesh	AP	AP	\N	Transmission Corporation of Andhra Pradesh	2020-09-24	AP	Transmission Licensee	General Member	9845098450	93	test@test.com
5	Karnataka	PCKL	PCKL	\N	Karnataka Power Transmission Corp. Ltd	2020-09-24	KPTCL	Transmission Licensee	General Member	9845098450	94	test@gmail.com
8	Puducherry	Puducherry 	Puducherry 	\N	Puducherry Electricity Dept, Puducherry	2020-09-24	Puducherry	Transmission Licensee	General Member	984509840	97	test@gmail.com
9	PGCIL	PGCIL(SR) 	PGCIL(SR) 	\N	SRTS II POWEGRID HVDCPGCIL(SR) 	2020-09-24	PGCIL(SR) 	Transmission Licensee	General Member	9845098450	98	test@test.com
10	Goa(SR)	GOASR	GOASR	\N	Goa Electricity Board, GOA	2020-09-24	GOA	Transmission Licensee	General Member	9845098450	105	test@gmail.com
25	SEL	SEL	SEL	\N	SEIL/ TPCIL 	2020-09-29	SEL	Seller	General Member	9845098450	120	test@test.com
12	NTPC,RSTPS-III	NTPC,RSTPS-III 	NTPC,RSTPS-III 	\N	NTPC Ramagundam Stage III	2020-09-24	NTPC,RSTPS-III 	Generating Station	General Member	9845098450	107	test@test.com
13	NTPC,Talcher-II	Talcher Stage II	Talcher Stage II	\N	NTPC Talcher Stage II	2020-09-24	Talcher Stage II	Generating Station	General Member	9845098450	108	test@gmail.com
14	NTPC,SIMHADRI-II	NTPC,Sim'dri-II 	NTPC,Sim'dri-II 	\N	NTPC Simhadri Stage II	2020-09-24	NTPC,Sim'dri-II 	Generating Station	General Member	9845098450	109	test@gmail.com
15	NTPC,SIMHADRI-I	NTPC,Sim'dri-I 	NTPC,Sim'dri-I 	\N	NTPC Simhadri Stage I	2020-09-24	NTPC,Sim'dri-I 	Generating Station	General Member	9845098450	110	test@gmail.com
16	NTECL	NTECL	NTECL	\N	NTPC Tamilnadu Energy Company Ltd, Chennai	2020-09-24	NTECL 	Generating Station	General Member	9845098450	111	test@test.com
18	NLC, II Stage II	NLC TPS II Stage II	NLC TPS II Stage II	\N	NLC TPS II Stage II	2020-09-24	NLC TPS II Stage II	Generating Station	General Member	9845098450	113	TEST@GMAIL.COM
17	NLC, II Stage I	NLC, II Stage I	NLC, II Stage I	\N	NLC TPS II Stage I	2020-09-24	NLC, II Stage I	Generating Station	General Member	9845098450	112	TEST@GMAIL.COM
19	NLC, I Expn	NLC TPS I Expansion	NLC TPS I Expansion	\N	NLC TPS I Expansion	2020-09-24	NLC TPS I Expansion	Generating Station	General Member	9845098450	114	TEST@GMAIL.COM
20	NLC, II Expn	NLC TPS II Expansion	NLC TPS II Expansion	\N	NLC TPS II Expansion	2020-09-24	NLC TPS II Expansion	Generating Station	General Member	9845098450	115	TEST@GMAIL.COM
28	SEIL/ TPCIL	SEMBCORP	SEMBCOPR	\N	SEMBCORP ENERGY PVT LTD	2020-09-29	TPCIL	Generating Station	General Member	954545454545	123	test@test.com
29	LKPPL	LANCO KONDAPALLY	LKPPL2	\N	LANCO KONDAPALI STAGE 2	2020-09-29	LANCO	Generating Station	General Member	965656554	124	test@test.com
30	LKPPL III 	LANCO STAGE 3	LANCO STAGE 3	\N	LANCO KONDAPALLI ST3	2020-09-29	LANCO -3	Generating Station	General Member	95445455	125	test@test.com
31	Coastal(CE)	COASTAL	COASTAL ENERGY	\N	COASTAL ENERGY PVT LTD	2020-09-29	COASTAL	Generating Station	General Member	95656565656	126	test@test.com
32	IL&FS 	ILFS	ILFS	\N	IL&FS ENERGY PVT LTD	2020-09-29	IL&FS	Generating Station	General Member	956565656	127	TEST@TEST.COM
33	SEIL Project 2 	SEIL Project 2 	SEIL Project 2 	\N	SEMBCORP ENERGY PVT LTD 2	2020-09-29	SEIL P2	Generating Station	General Member	956565656565	128	TEST@TEST.COM
34	NNTPP	NNTPP	NNTPP	NNTPP	NEW NEYVELI THERMAL POWER PROJECT	2020-09-29	NNTPP	Generating Station	General Member	96565656555	129	TEST@TEST.COM
38	Azure,NPKUNTA	Azure,NPKUNTA	Azure,NPKUNTA	Azure,NPKUNTA	AZURE THIRTTY SIX PVT LTD	2020-09-29	AZURE	Generating Station	General Member	9565656566	133	TEST@TEST.COM
40	TATA,NPKUNTA	TATA,NPKUNTA	TATA,NPKUNTA	TATA,NPKUNTA	TATA SOLAR POWER PROJECT LTD	2020-09-29	TATA	Generating Station	General Member	9565656566	135	TEST@TEST.COM
41	NTPC,NPKUNTA	NTPC,NPKUNTA	NTPC,NPKUNTA	NTPC,NPKUNTA	NTPC ANANTHAPURAM SOLAR POWER PROJECT	2020-09-29	NTPC ANTP	Generating Station	General Member	955656565	136	TEST@TEST.COM
42	FRV II,NPKUNTA	FRV II,NPKUNTA	FRV II,NPKUNTA	FRV II,NPKUNTA	FRV SOLAR INDIA POWER LIMITED	2020-09-29	FRV-2	Generating Station	General Member	956565665656	137	TEST@TST.COM
44	Avaada, PAVAGADA	Avaada, PAVAGADA	Avaada, PAVAGADA	Avaada, PAVAGADA	1 Avaada Solar Energy Private Ltd. (Pavagada Solar Park) 	2020-09-29	AVAADA SOLAR	Generating Station	General Member	9565656565	140	test@test.com
35	ACME Hissar,NPKUNTA	ACME Hissar,NPKUNTA	ACME Hissar,NPKUNTA	ACME Hissar,NPKUNTA	ACME HISAR POWER PROJECT LTD	2020-09-29	ACME HISAR	Generating Station	General Member	95656565656	130	test@test.com
36	ACME Bhiwadi,NPKUNTA	ACME Bhiwadi,NPKUNTA	ACME Bhiwadi,NPKUNTA	ACME Bhiwadi,NPKUNTA	ACME BHIWADI SOLAR POWER PROJECT LTD	2020-09-29	ACME BHIWADI	Generating Station	General Member	9565656565	131	TEST@TEST.COM
37	ACME Karnal,NPKUNTA	ACME Karnal,NPKUNTA 	ACME Karnal,NPKUNTA 	ACME Karnal,NPKUNTA 	ACME KARNAL POWER PROJECT LTD	2020-09-29	ACME KARNAL	Generating Station	General Member	95656565666	132	TEST@TEST.COM
43	SB, NPKUNTA	SBG, NPKUNTA	SBG, NPKUNTA	SBG, NPKUNTA	SBH CLEANTECH PVT SOLAR LIMITED	2020-09-29	SBGCLEANTECH	Generating Station	General Member	9556565656	139	TEST@TEST.COM
39	FRV,NPKUNTA	FRV I SOLAR POWER PROJECT LTD	FRV,NPKUNTA	FRV,NPKUNTA	FRV SOLAR POWER PROJECT LTD	2020-09-29	FRV	Generating Station	General Member	9565656565	134	TEST@TEST.COM
48	TATA, PAVAGADA	TATA, PAVAGADA	TATA, PAVAGADA	TATA, PAVAGADA	Tata Power Renewable Energy limited (Pavagada Solar Park) 	2020-09-29	TATAT POWER 	Generating Station	General Member	565668656565	144	TEST@TEST.COM
49	ACME Kurukshetra, PAVAGADA	ACME Kurukshetra, PAVAGADA	ACME Kurukshetra, PAVAGADA	ACME Kurukshetra, PAVAGADA	ACME Kurukshetra Solar Energy Pvt. Ltd. (Pavagada Solar Park)	2020-09-29	ACME KURUKSHETRA	Generating Station	General Member	56865565656	145	TEST@TEST.COM
50	ACME Rewari, PAVAGADA	ACME Rewari, PAVAGADA	ACME Rewari, PAVAGADA	ACME Rewari, PAVAGADA	ACME REWARI Solar Power Pvt Ltd. (Pavagada Solar Park) 	2020-09-29	ACME REWARI	Generating Station	General Member	865656565656	146	TEST@TEST.COM
51	Fortum Finsurya, PAVAGADA	Fortum Finsurya, PAVAGADA	Fortum Finsurya, PAVAGADA	Fortum Finsurya, PAVAGADA	Fortum Finnsurya Energy Private Ltd. (Pavagada Solar Park) 	2020-09-29	FORTUM FINNSURYA	Generating Station	General Member	658565656565	147	TEST@TEST.COM
52	Parampujya, PAVAGADA	Parampujya, PAVAGADA	Parampujya, PAVAGADA	Parampujya, PAVAGADA	Parampujya Solar Energy Private Ltd. (Pavagada Solar Park) 	2020-09-29	PARAMPUJYA	Generating Station	General Member	56565656565	148	test@test.com
53	Renew-TN2, PAVAGADA	Renew-TN2, PAVAGADA	Renew-TN2, PAVAGADA	Renew-TN2, PAVAGADA	ReNew Wind Energy (TN2) Private Limited (Pavagada Solar Park	2020-09-29	RENEW WIND ENERGY	Generating Station	General Member	56568565656	149	TEST@TEST.YAHHO.COM
54	Yarrow, PAVAGADA 	Yarrow, PAVAGADA 	Yarrow, PAVAGADA 	Yarrow, PAVAGADA 	Yarrow Infra Structure Private Ltd. (Pavagada Solar Park) 	2020-09-29	YARROW	Generating Station	General Member	6565658656	150	TEST@TEST.COM
58	Fortum Solar, PAVAGADA	Fortum Solar, PAVAGADA	Fortum Solar, PAVAGADA	Fortum Solar, PAVAGADA	Fortum Solar India Private Limited. (Pavagada Solar Park)	2020-09-29	FORTUM SOLAR	Generating Station	General Member	65865686256	154	TEST@TEST.COM
59	KREDL, PAVAGADA	KREDL, PAVAGADA	KREDL, PAVAGADA	KREDL, PAVAGADA	KARNATAKA RENEWABLE ENERGY DEVELOPMENT LIMITED (Pavagada Solar Park) 	2020-09-29	KREDL	Generating Station	General Member	686586568656	155	test@test.com
60	Azure Earth, PAVAGADA	Azure Earth, PAVAGADA	Azure Earth, PAVAGADA	Azure Earth, PAVAGADA	Azure Power Earth Private Ltd. (Pavagada Solar Park) 	2020-09-29	AZURE EARTH	Generating Station	General Member	8656568656565	156	TEST@TEST.COM
61	Avaada Solarise, PAVAGADA	Avaada Solarise, PAVAGADA	Avaada Solarise, PAVAGADA	Avaada Solarise, PAVAGADA	Avaada Solarise Energy Pvt. Ltd. (Pavagada Solar Park)	2020-09-29	AVAADA SOLARISE	Generating Station	General Member	8656865586	157	TEST@TEST.COM
62	GIREL, Tuticorin (Wind) 	GIREL, Tuticorin (Wind) 	GIREL, Tuticorin (Wind) 	GIREL, Tuticorin (Wind) 	Green Infra Renewable Energy Limited	2020-09-29	GIREL	Generating Station	General Member	865685656	158	TEST@TEWST.COM
63	MYTRAH, Tuticorin (Wind)	MYTRAH, Tuticorin (Wind)	MYTRAH, Tuticorin (Wind)	MYTRAH, Tuticorin (Wind)	Mytrah Energy (India) Energy Pvt Ltd	2020-09-29	MYTRAH	Generating Station	General Member	8685656	159	TEST@TEST.COM
64	ORANGE, Tuticorin (Wind) 	ORANGE, Tuticorin (Wind) 	ORANGE, Tuticorin (Wind) 	ORANGE, Tuticorin (Wind) 	Orange Sironj wind power pvt Ltd	2020-09-29	ORANGE	Generating Station	General Member	8656865686	160	TEST@TST.COM
65	Betam, Tuticorin (Wind) 	Betam, Tuticorin (Wind) 	Betam, Tuticorin (Wind) 	Betam, Tuticorin (Wind) 	Betam Wind Energy Private Limited	2020-09-29	BETAM	Generating Station	General Member	68686565665	161	TEST@TEST.COM
66	Telangana 	Telangana 	Telangana 	Telangana 	TELANGANA TRANSIMISSION CORPORATION LIMITED	2020-09-29	TSTRANSCO	Transmission Licensee	General Member	564554545	162	test@test.com
69	SBE	SBE	SBE	\N	SBG CLEANTECH Projectco Five PVT, LTD.	2020-09-30	SBE	Generating Station	General Member	9845098450	166	TEST@GMAIL.COM
79	PUGALUR PGCIL(SR)	PGPUGALUR	PGPUGALUR	\N	PGPUGALUR	2020-09-30	PGPUGALUR	Generating Station	General Member	9845089888	177	PGPUGALUR
78	MEPL	MEL	MEL	\N	MEL	2020-09-30	MEL	Generating Station	General Member	9895809806	176	MEL988
67	Western Region	WR	WR	\N	wr	2020-09-30	WR	Generating Station	General Member	98445098450	164	TEST@GMAIL.COM
68	Eastern Region	ER	ER	\N	ER	2020-09-30	ER	Generating Station	General Member	9845098450	165	TEST@GMAIL.COM
70	NNTPP (Lignite)	NNTTP-PH2	NNTTP-PH2	\N	12 New Neyveli Thermal Power Project 2	2020-09-30	NNTPP	Generating Station	General Member	9845098450	167	TEST@GMAIL.COM
71	Adyah Block 1, PAVAGADA	ADYAHBLOCK-1	ADYAHBLOCK-1	\N	Adyah Solar Energy Pvt, Ltd. (Pavagada Solar Park)	2020-09-30	ADYAH bLOCK 1	Generating Station	General Member	9845098450	168	TEST@GMAIL.COM
72	Adyah Block 2, PAVAGADA	ADYAHB2	ADYAHB2	\N	Adyah Solar Energy Pvt, Ltd. (Pavagada Solar Park)	2020-09-30	ADYAHB2	Generating Station	General Member	9845098450	169	TEST@GMAIL.COM
73	Adyah Block 13, PAVAGADA	ADYAHB13	ADYAHB13	\N	ADYAHB13	2020-09-30	ADYAHB13	Generating Station	General Member	9845098450	170	TEST@GMAIL.COM
74	Adyah Block 10, PAVAGADA	ADYAHB10	ADYAHB10	\N	Adyah Solar Energy Pvt, Ltd. (Pavagada Solar Park)	2020-09-30	ADYAHB10	Generating Station	General Member	9845098450	172	TEST@GMAIL.COM
75	Adyah Block 6, PAVAGADA	ADYAHB6	ADYAHB6	\N	Adyah Solar Energy Pvt, Ltd. (Pavagada Solar Park)	2020-09-30	ADYAHB6	Generating Station	General Member	9875098450	173	ADYAHB6
76	Adyah Block 3, PAVAGADA	ADYAHB3	ADYAHB3	\N	Adyah Solar Energy Pvt, Ltd. (Pavagada Solar Park)	2020-09-30	ADYAHB3	Generating Station	General Member	9845098450	174	ADYAHB3
77	Betam, Tuticorin (Wind: 50 MW)	BETAM50MW	BETAM50MW	\N	BETAM  	2020-09-30	BETAM 50MW	Generating Station	General Member	9845098	175	BETAM50MW
80	Ayana, NPKUNTA	Ayana, NPKUNTA	Ayana, NPKUNTA	Ayana, NPKUNTA	Ayana Anathapuram Solar Private Limited	2020-11-10	AYANA	Generating Station	General Member	789787878	178	test@test.com
81	TRISSUR PGCIL(SR)	TRISSUR PGCIL(SR)	TRISSUR PGCIL(SR)	THRISSUR	TRISSUR PGCIL(SR)	2020-11-17	TRISSUR	Generating Station	General Member	787798779879	179	test@test.com
82	SPRNG, NPKUNTA	SPRNG, NPKUNTA	SPRNG, NPKUNTA	\N	SPRNG, NPKUNTA	2020-12-15	SPRNG	Generating Station	General Member	9845098450	192	test@test.com
\.


--
-- Data for Name: Registration_oldbankdetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Registration_oldbankdetails" (id, "accountName", "accountNumber", "bankName", "branchName", "ifscCode", "accountName2", "accountNumber2", "bankName2", "branchName2", "ifscCode2", "accountName3", "accountNumber3", "bankName3", "branchName3", "ifscCode3", "accountName4", "accountNumber4", "bankName4", "branchName4", "ifscCode4", "accountName5", "accountNumber5", "bankName5", "branchName5", "ifscCode5", "accountName6", "accountNumber6", "bankName6", "branchName6", "ifscCode6", validfrom, validtill, isadminverified, register_id_id) FROM stdin;
\.


--
-- Data for Name: Registration_oldbankdetails2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Registration_oldbankdetails2" (id, acctype, "accountName", "accountNumber", "bankName", "branchName", "ifscCode", isadminverified, validfrom, validtill, register_id_id, fullname) FROM stdin;
\.


--
-- Data for Name: Registration_olddetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Registration_olddetails" (id, "contactName", "contactName2", "contactName3", designation, designation2, designation3, register_id_id, telephone, telephone2, telephone3, isadminverified, fullname, "approvedDate") FROM stdin;
\.


--
-- Data for Name: Registration_rejected; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Registration_rejected" ("entityName", "regAddress", region, "userCategory", "contactName", designation, telephone, "contactName2", designation2, telephone2, "contactName3", designation3, telephone3, "accountName", "accountNumber", "bankName", "branchName", "ifscCode", id, remarks, register_id, "accountName2", "accountName3", "accountName4", "accountName5", "accountName6", "bankName2", "bankName3", "bankName4", "bankName5", "bankName6", "branchName2", "branchName3", "branchName4", "branchName5", "branchName6", "ifscCode2", "ifscCode3", "ifscCode4", "ifscCode5", "ifscCode6", "accountNumber2", "accountNumber3", "accountNumber4", "accountNumber5", "accountNumber6", adminremarks, gstinnumber, pannumber, tannumber) FROM stdin;
\.


--
-- Data for Name: Registration_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Registration_user" (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, registration_id) FROM stdin;
105	pbkdf2_sha256$180000$WZ6jHY7I33e1$zDyi3ktqC25gmfXdLJnTJSREQiyKscMbPASKm+5piWU=	\N	f	GOASR				f	t	2020-09-24 11:28:41.481943+05:30	SRRGO1DS
106	pbkdf2_sha256$180000$xjSF3qkfZ6aa$SIvkA0h0tHImYBAoVJxT57j1nfpiZEluxNxTxiu4sy8=	\N	f	RSTPS				f	t	2020-09-24 11:33:40.327014+05:30	SRRRM1GN
107	pbkdf2_sha256$180000$UzPWlmOwVMAI$fUdLQBEiSg+WcfP8955S/e2a6E9mS30rhdyx/g0TxKw=	\N	f	RSTPS-III				f	t	2020-09-24 11:43:29.546585+05:30	SRRRM3GN
108	pbkdf2_sha256$180000$OwbSzNOiqBz4$JWWlqqpt4UgYenYyv6sHeYAuyptFKaWlnX4R8C2aoR0=	\N	f	TALCHER				f	t	2020-09-24 11:45:32.689029+05:30	SRRTL2GN
109	pbkdf2_sha256$180000$P5HXOsVm34HV$Ht1XuQqXg6xMqv4rimggBHX5W1+AJ51KN2TukEIPgBE=	\N	f	SIMHADRI-2				f	t	2020-09-24 11:47:51.947974+05:30	SRRSM2GN
93	pbkdf2_sha256$180000$y3bs1dwDXQ6K$mkM5dKvFstmnmbo0/5bO95tmOMEXES6SuyjJpyf4kE0=	\N	f	AP				f	t	2020-09-24 11:10:00.96638+05:30	SRRAP1DS
110	pbkdf2_sha256$180000$SpaFpMEhwQCc$hWTdmjWjqXq06IsVt+iNVeyHLnJX8n0Bv2DNhxqJOj8=	\N	f	SIMHADRI-1				f	t	2020-09-24 11:49:26.546293+05:30	SRRSM1GN
111	pbkdf2_sha256$180000$YivqgxXUHoVI$fH0UZyz80Jfzk/WIYubdMtfV09U//CT6Y51/+3tIdxA=	\N	f	VALLUR				f	t	2020-09-24 11:52:14.785875+05:30	SRRVR1GN
112	pbkdf2_sha256$180000$WiIVgdPVkaIi$xWkEd3PGlB6c9tMwgY984QUfg2Y5Khi/BcGMlhcsc7g=	\N	f	NLC-1				f	t	2020-09-24 11:53:56.916606+05:30	SRRNL1GN
94	pbkdf2_sha256$180000$zn1PuWGQy8qT$T4Yt/mTaVMpDY+ThuNchJ8WFbTKcW0q7cmr4ujrKtmg=	\N	f	KPTCL				f	t	2020-09-24 11:14:18.054008+05:30	SRRKA1DS
113	pbkdf2_sha256$180000$XeBV9GT8yxEh$12XRZYDm3CnH2/P6HsBV0veHOVgiQtka/dEqXCIkIDk=	\N	f	NLC-2				f	t	2020-09-24 11:54:49.915239+05:30	SRRNL2GN
114	pbkdf2_sha256$180000$famlGJ22FRHI$i9PYuBVrDIrSljn+UXT7eCmpMQwo8qivi19VbVa3m14=	\N	f	NLCEXP-1				f	t	2020-09-24 11:55:55.816258+05:30	SRRNE1GN
115	pbkdf2_sha256$180000$T5u8mJ6ype5p$CIp/UdHkmjArjb3/PAEQcNh94HrXQjDKQpNpd6aEIcU=	\N	f	NLCEXP-2				f	t	2020-09-24 11:57:00.679937+05:30	SRRNE2GN
95	pbkdf2_sha256$180000$UPZ3qlfIPxRN$QTpALI4pMxPvURDAbYQgXv35yw0Y5cc8P8EUGdOcFMA=	\N	f	KSEB				f	t	2020-09-24 11:17:15.477584+05:30	SRRKL1DS
116	pbkdf2_sha256$180000$4J9mOE3ZP7xB$vAfYemRSVPP1g2ZVGL4c+0ZE/IV/3aG44NO/z2BaYVI=	\N	f	NTPL				f	t	2020-09-24 11:58:38.385279+05:30	SRRTU1GN
96	pbkdf2_sha256$180000$S0s7Tu1YRdaA$atfw/jRQ8JHOP5U36xSVU0nG5uUE6Q3ztbTKa+jQzLA=	\N	f	TAMILNADU				f	t	2020-09-24 11:19:57.35049+05:30	SRRTN1DS
1	pbkdf2_sha256$180000$E2cOWWp3Gg7j$vMW1BAlOcm0WN/2DTIJg8k42+JUxEMBKmHL717i7BKQ=	2020-06-01 15:00:02.916894+05:30	t	Admin			test@test.com	t	t	2020-06-01 12:43:57.112526+05:30	SRADMIN
117	pbkdf2_sha256$180000$zLXKfhcIdzUk$S4rGYX+KdDevqhUaHh4XAYNBvlCBoaV6Yz4D8XHQuEg=	\N	f	KUDGI-1				f	t	2020-09-24 12:00:13.146666+05:30	SRRKT1GN
97	pbkdf2_sha256$180000$5nrty2Mb6saD$gP8VHjthRur4KpYF7OZFMTc7x+6xek+HxtrQE5UudLw=	\N	f	PONDY				f	t	2020-09-24 11:22:22.295281+05:30	SRRPO1DS
118	pbkdf2_sha256$180000$T52fUhK4XR5l$TnhwuXFVZhGbB2dQNnRMI4mnKyOnSDVNt96DM2fNao4=	\N	f	NNTPP-1				f	t	2020-09-24 12:02:16.026988+05:30	SRRNN1GN
119	pbkdf2_sha256$180000$SgkERcT8u3Hh$zNFF4Nj8sTBjnn4f/DUPfkHcLuHssIO96hsloir/5Ng=	\N	f	FIN				f	t	2020-09-24 16:22:14.674887+05:30	SRFINANCE
98	pbkdf2_sha256$180000$FspORibFkaDq$srcgUFIR3i3s28v66X59/4iq6VpJzy4RQYWi7XkjjsY=	\N	f	PGCIL				f	t	2020-09-24 11:26:52.968327+05:30	SRRPG1BY
120	pbkdf2_sha256$180000$1Y80r0SWylvZ$6DKC7wjxlxnIYjbnjKSRU76HhDBjsZpfZ2jv8INdaTo=	\N	f	SEL				f	t	2020-09-29 11:33:57.585603+05:30	SRRSE1SL
124	pbkdf2_sha256$180000$iMGdyC3ACFjm$pXGxhld2Ro9fAJSS6EO3omxhYkeZIUNcOM60oNOzxfs=	\N	f	LANCO-2				f	t	2020-09-29 13:47:11.36734+05:30	SRRLK2SL
123	pbkdf2_sha256$180000$qIVJUSQWuci7$Eio8ucZbIJauZKkgka4tO58BnK4sCaN6ny0NH5S61NU=	\N	f	SEIL				f	t	2020-09-29 13:45:54.617546+05:30	SRRTP1SL
125	pbkdf2_sha256$180000$fEnImjCZ8PcL$cKsiWMMpYA8rYWt3Uf98ENTP7gV3qBGjMPN2W6G8FvU=	\N	f	LANCO-3				f	t	2020-09-29 13:48:42.724885+05:30	SRRLK3SL
126	pbkdf2_sha256$180000$WJG6bevsgsuF$2jqK3vvzwHHIkBnS1ACiyJj0mqfOioJ57XBY/boYyGY=	\N	f	COASTAL				f	t	2020-09-29 13:49:55.503777+05:30	SRRCG1SL
127	pbkdf2_sha256$180000$UuV1furDeCX3$6rNdDqr5AtGCsyXThsmG19rq5LlXVx2qs5amWdKheEQ=	\N	f	ILFS				f	t	2020-09-29 13:51:07.335754+05:30	SRRIL1SL
128	pbkdf2_sha256$180000$GTtRAKyBosQe$xn4E1LONjar0wiZHZalbkgjv1vYWsJbdqKG1SkZ8cy4=	\N	f	SEILP2				f	t	2020-09-29 13:52:11.921249+05:30	SRRNC1SL 
129	pbkdf2_sha256$180000$16jF8YwCQtVp$Lqt0MspR4NxgUEnqpJLP/X2ipKgIhu6MQU+EidjmK5c=	\N	f	NNTP				f	t	2020-09-29 13:53:49.488228+05:30	SRRNN1GN
130	pbkdf2_sha256$180000$9ZNb006kETtX$U0x6CVsUc9hpG8gTJG7cvvLVniJIjyeIR1J7GII3RDY=	\N	f	ACMEHISAR				f	t	2020-09-29 13:55:26.656146+05:30	SRRAH1GN
131	pbkdf2_sha256$180000$D5h2oX1lSbAl$KMzHuadh/JmQhBTrtVmKwjT3J6OT92ep/4dmmoaYckU=	\N	f	ACMEBHIWADI				f	t	2020-09-29 13:56:35.627947+05:30	SRRAB1GN
132	pbkdf2_sha256$180000$8H92exdpa3VD$lVKMt6cVH00ZENVBqsPU4/nHPzDcPK7n3wkEIbyikUE=	\N	f	ACMEKARNAL				f	t	2020-09-29 13:57:48.210357+05:30	SRRAK1GN 
133	pbkdf2_sha256$180000$l4xjeIDIuBQj$Oj6V4fDR8X6m0KZ0mjoIgdMt/bFMaZSlgMEsGejVa+E=	\N	f	AZURE36				f	t	2020-09-29 13:59:19.016129+05:30	SRRAZ1GN
134	pbkdf2_sha256$180000$WGtX7tdTPNcj$YT7TV4PrKXPw1hRmtssT/O3JDes5aUJZh6/nVVAq2L0=	\N	f	FRV1				f	t	2020-09-29 14:00:16.815635+05:30	SRRFR1GN 
135	pbkdf2_sha256$180000$2NPp9Pel1SBY$KEqTadEEsgS3xvd4W56S399Tvvru9mTGezhImmj8xz8=	\N	f	TATA				f	t	2020-09-29 14:01:20.645539+05:30	SRRTA1GN
136	pbkdf2_sha256$180000$vH5C6y8CuNbA$KETfdxfBM4OIivb6dBAeJWJgR7verK6/661MdjhOp/8=	\N	f	NTPCANTP				f	t	2020-09-29 14:02:35.993589+05:30	SRRNS1GN
137	pbkdf2_sha256$180000$BHJv2fpcPb5H$u4eEi4z7Wfev64S9/RXtsMh0axNQg1d//kQXZ3RU/cc=	\N	f	FRV2				f	t	2020-09-29 14:03:33.16048+05:30	SRRFR2GN
138	pbkdf2_sha256$180000$Wjk1HlAISgXs$1NxeRuUxEPl6rUU7eDc26VyFdbRtS3kCnxyIhgY3JjY=	\N	f	SBGCLEAN				f	t	2020-09-29 14:04:38.679941+05:30	SRRSC1GN
139	pbkdf2_sha256$180000$ZWJWJzC0ueRX$jEVHyL4SmvY+vArUFDQFXcs3+DjvcL2cX/O8CYotvL4=	\N	f	SBGCLEAN2				f	t	2020-09-29 14:07:03.473912+05:30	SRRSC2GN 
140	pbkdf2_sha256$180000$kn7hObsPMoGo$RhPBZA6+Py+3yvF53y7yyqCaJHuHvv6RnTQpgFYgGjU=	\N	f	AVAADA				f	t	2020-09-29 14:08:18.473676+05:30	SRRAP1GN
144	pbkdf2_sha256$180000$7VkYvOMrLDtT$gic1rgGrI6wn3EpFhiKMQwAJkAO4ZhFn0k6qW8BKe3o=	\N	f	TATA400				f	t	2020-09-29 14:13:53.279611+05:30	SRRTP1GN 
145	pbkdf2_sha256$180000$UZi7dlESJXyG$jbLb0/NmS4ForKALmcRp2FYI32BrF3tI8i1OHjcOtew=	\N	f	ACMEKURU				f	t	2020-09-29 14:14:52.240632+05:30	SRRKP1GN
146	pbkdf2_sha256$180000$0MuUVReFfN2z$uJVR//55CnHO7iubt7Xa/ItTy10rOXkijTuoSaaVfI8=	\N	f	ACMEREWARI				f	t	2020-09-29 14:15:59.12362+05:30	SRRAR1GN
147	pbkdf2_sha256$180000$YEp5WKq6WtUB$utebq65/eyZH9b83f7ASHFbYO2S7ReKrXk/Wg766K0k=	\N	f	FINNSURYA				f	t	2020-09-29 14:16:50.250543+05:30	SRRFP1GN 
149	pbkdf2_sha256$180000$lBMKUYQFURjc$UrVgkdy2WJ21QaKS2WXDWNahOJXroCaKcjps8aYxDT0=	\N	f	RENEW				f	t	2020-09-29 14:19:51.136843+05:30	SRRRN1GN
150	pbkdf2_sha256$180000$2l11HXBWkLST$LEySsd+f3Rag3OizhLpukHzhhkWIrOQXGxC2KEfG5qI=	\N	f	YARROW				f	t	2020-09-29 14:21:06.279217+05:30	SRRYP1GN
172	pbkdf2_sha256$180000$XgNWVGCS3y9k$dj497ybyIAopR8dl3/Vk4mgmzuRKudo42qdKwOOsNUg=	\N	f	ADYAHB10				f	t	2020-09-30 14:52:11.566858+05:30	SRRAD4GN
154	pbkdf2_sha256$180000$DdTjv1bpNgHH$Cf8YBA5CeyQZSRX8SJFQMD27h18Wm/zRZtm1Q0j/Vks=	\N	f	FORTUMSOLAR				f	t	2020-09-29 14:25:42.866845+05:30	SRRFS1GN
155	pbkdf2_sha256$180000$VaC8YMQBbogL$aLaMsr/3MoAzXlkY8gnwyTt8eAF01bqcdEiwVOXsqBs=	\N	f	KREDL				f	t	2020-09-29 14:27:10.294013+05:30	SRRKR1GN
156	pbkdf2_sha256$180000$RDoSKlsWMxm1$zPx125ssXs9xu2bcibN5P2dPE/NIFrNqP5MAmpHYYrM=	\N	f	AZUREEARTH				f	t	2020-09-29 14:28:31.874084+05:30	SRRAE1GN
157	pbkdf2_sha256$180000$XSfRtZ0KfUJk$cSGU1s7D1YOzE0PRpK0U4l1tOwAnG0IWF6YtJngbpuM=	\N	f	SOLARISE				f	t	2020-09-29 14:29:24.178598+05:30	SRRAS1GN 
158	pbkdf2_sha256$180000$pbP11Zeq3pl2$ROtEdYV+OqtzfKxSbQ+KdW5d88eDKFPDeu4bBjUtA3M=	\N	f	GIREL				f	t	2020-09-29 14:30:24.976708+05:30	SRRGW1GN
159	pbkdf2_sha256$180000$sNt9OTBjX1dM$i9TjjZK2omvFMawJShCJBBKgYPawW0/kvwXEz0oETcU=	\N	f	MYTRAH				f	t	2020-09-29 14:31:28.306775+05:30	SRRMW1GN
161	pbkdf2_sha256$180000$9EesIzHIpsDH$w+Qxj/EmMLFwQojGwxHCCbC414wmcZN2JBlWXFUlT6A=	\N	f	BETAM				f	t	2020-09-29 14:33:38.864577+05:30	SRRBT1GN
162	pbkdf2_sha256$180000$rFoVhPjtNjdo$+v1jqhmQKZRDnHYMpKWHpmoKhdmuPggqIHNMQO9Earc=	\N	f	TG				f	t	2020-09-29 16:45:38.032307+05:30	SRRTS1DS 2
164	pbkdf2_sha256$180000$wTE8xN8Q35B9$Qgvlm4c1iQjbAPOF3LHc4pnzIh63lAbV9RJZmsASprk=	\N	f	WR				f	t	2020-09-30 14:41:09.52603+05:30	wr
165	pbkdf2_sha256$180000$awwbaeSXwDcr$euDWWdjtsILy5jCdRiOHLioua/LOwinm3tOe0l9dzfg=	\N	f	ER				f	t	2020-09-30 14:41:45.368096+05:30	ER
166	pbkdf2_sha256$180000$j5e2Bk5Ucxa6$BD5Ywn4x51wUntFGICxMOsFkuFgfDwTjoMbhCE1RTNE=	\N	f	SBE				f	t	2020-09-30 14:43:18.552227+05:30	SBE
167	pbkdf2_sha256$180000$FSoUVD4kwUZe$C8wzLo+5IPQf060eILgZwl8apcz+rEMpEobm6udL6TA=	\N	f	NNTTP-PH2				f	t	2020-09-30 14:45:34.840835+05:30	nntpp
168	pbkdf2_sha256$180000$en0nTsfX7ut1$GfyVJ6S848elRAbaS38Nbu6I+ZgeWqzoSKRiMbNESkc=	\N	f	ADYAHBLOCK-1				f	t	2020-09-30 14:47:02.614216+05:30	SRRAD6GN
169	pbkdf2_sha256$180000$VDsyj7G1qO6q$o0++FDZRauJfqp26By97pM6WyQNUnLDAbwLpHNNqMdo=	\N	f	ADYAHB2				f	t	2020-09-30 14:48:25.194771+05:30	SRRAD5GN
170	pbkdf2_sha256$180000$Fs45NJuNYTeY$UBP3+vH7VePxPdccEXYSXWxJ2ny9nhmKQD5Q6Q4TA7M=	\N	f	ADYAHB13				f	t	2020-09-30 14:49:45.819445+05:30	ADYAHB13
173	pbkdf2_sha256$180000$IQzGopJBViAn$BaK69IvQjsuN+lmFTNcxVVcYHvxuWAB64YkpYkDfp/g=	\N	f	ADYAHB6				f	t	2020-09-30 14:53:50.123427+05:30	SRRAD3GN
174	pbkdf2_sha256$180000$9ehENSDp9Uk8$F0Je0XNoVSuehTqJuU/8WwesyRrn7v+iRM6tVZnRA+0=	\N	f	ADYAHB3				f	t	2020-09-30 14:54:39.909941+05:30	ADYAHB
175	pbkdf2_sha256$180000$VQmEnIBF0qdR$XGvsUw441oXEkioU7XQL/UVZTCpl/OamPEbFjaph+Hc=	\N	f	BETAM50MW				f	t	2020-09-30 14:55:45.416027+05:30	BETAM 
176	pbkdf2_sha256$180000$n5DyCYJT1JLu$t9bCiBXwFe0r8AgVK7BkHIoFXqh9NDWVoD1fh2abC58=	\N	f	MEL				f	t	2020-09-30 14:56:46.041234+05:30	MEL
177	pbkdf2_sha256$180000$TOtSDcuPkqih$A9xWf/WuON71j43cf4BBlwpB0UN1aUGkEaO+bFVRORU=	\N	f	PGPUGALUR				f	t	2020-09-30 15:03:56.128813+05:30	PGPUGALUR
178	pbkdf2_sha256$180000$CkCAxnhy2tKE$L4YChCjNnb1DPFXk9m8uIRWerCnIC01zzTk3fLaKoG8=	\N	f	AYANA				f	t	2020-11-10 11:39:36.177696+05:30	SRRAY1GN
179	pbkdf2_sha256$180000$0yqCSxs1isRu$0VTKOPRJTF5oDf75AZP/X5CtOyXGaJPJ+xeqMNKDJAc=	\N	f	TRISSUR				f	t	2020-11-17 14:25:56.934644+05:30	SRRPG2BY
189	pbkdf2_sha256$180000$CGXrAokZwma0$0V300x9WPE6CaBM5UVLO8oyCCMa8uy/Z8E+UWPllIKI=	\N	f	00400				f	t	2020-12-05 12:13:59.175956+05:30	SRADMIN
190	pbkdf2_sha256$180000$rA8EUrNKTfYO$7dErh9PDROzbm0rKtODlJpjTDtfH8hwqzVnAjcRXPIg=	\N	f	00401				f	t	2020-12-05 12:14:28.862986+05:30	SRADMIN
191	pbkdf2_sha256$180000$5PqffaiLUAgk$Vp5DaRGAD2EvIRHMXGA/molWADT/q18XN7LPdVofteA=	\N	f	00402				f	t	2020-12-05 12:14:58.334208+05:30	SRADMIN
192	pbkdf2_sha256$180000$bapisZWZUQo3$KJ63vmKgb3lh0Fy8SeiHl318/cqQG8Yqrzt5qHc9BWw=	\N	f	SPRNG				f	t	2020-12-15 10:45:21.955936+05:30	srsprng
160	pbkdf2_sha256$180000$Krg7s1Koy17Q$Yl1nfIjJ1rr6MEqGcuxUyEa1/xsUC5o1z0uGxH00XoY=	\N	f	ORANGE				f	t	2020-09-29 14:32:19.158446+05:30	SRROW1GN
148	pbkdf2_sha256$180000$pHISvunvqxaG$JhTs9Asv89ZdKVHZn//M0/eOyLg3VF87HZG1OcrD3pc=	\N	f	PARAMPUJYA				f	t	2020-09-29 14:18:20.412246+05:30	SRRPP1GN
\.


--
-- Data for Name: Registration_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Registration_user_groups" (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: Registration_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Registration_user_user_permissions" (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: SRPC_Files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SRPC_Files" (id, year, "weekNo", image_url) FROM stdin;
35	2020-21	6	/static/images/SRPC/2020-21/Week_No6/SRPC FileInvoice.pdf
38	2020-21	25	/static/images/SRPC/2020-21/Week_No25/SRPC Filedsm14-20sept20.pdf
39	2020-21	29	/static/images/SRPC/2020-21/Week_No29/SRPC Filedsm12-18oct20.pdf
40	2020-21	29	/static/images/SRPC/2020-21/Week_No29/SRPC Filedsm12-18oct20.pdf
41	2020-21	28	/static/images/SRPC/2020-21/Week_No28/SRPC Filedsm05-11oct20.pdf
42	2020-21	29	/static/images/SRPC/2020-21/Week_No29/SRPC Filedsm12-18oct20.pdf
43	2020-21	30	/static/images/SRPC/2020-21/Week_No30/SRPC Filedsm19-25oct20.pdf
44	2020-21	31	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf
45	2020-21	32	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf
47	2020-21	31	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf
48	2020-21	32	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf
49	2020-21	33	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf
50	2020-21	34	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf
51	2020-21	34	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf
52	2020-21	34	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf
53	2020-21	35	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf
54	2020-21	36	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf
55	2020-21	37	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf
56	2020-21	38	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf
\.


--
-- Data for Name: SRPC_REACT_Files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SRPC_REACT_Files" (id, year, "weekNo", image_url) FROM stdin;
\.


--
-- Data for Name: WeeklyUpload_approveauthority; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WeeklyUpload_approveauthority" (id, "Fin_year", "Week_no", created_by, review_auth1, review_auth2, status, remarks) FROM stdin;
20	2020-21	36	00400	00401	00402	3	dsd
21	2020-21	37	00400	00401	00402	0	not correct
22	2020-21	37	00400	00401	00402	3	correct
14	2020-21	31	00400	00401	00402	3	sdsd
15	2020-21	32	00400	00401	00402	3	gdjfhg
16	2020-21	33	00400	00401	00402	3	Check Everything 
18	2020-21	34	00400	00401	00402	3	everything is correct
19	2020-21	35	00400	00401	00402	3	approved
\.


--
-- Data for Name: WeeklyUpload_approveauthoritypreviousweeks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WeeklyUpload_approveauthoritypreviousweeks" (id, "Fin_year", "Week_no", created_by, review_auth1, review_auth2, remarks, status) FROM stdin;
2	2020-21	31	00401	00401	00402	everything is correct	3
4	2020-21	31	00400	00401	00402	finally approved	3
5	2020-21	32	00400	00401	00402	incorrectly disbursed	0
6	2020-21	32	00400	00401	00402	incorrect	0
7	2020-21	32	00400	00401	00402	good go ahead	2
8	2020-21	32	00401	00401	00402	incorrect outstanding	0
9	2020-21	32	00401	00401	00402	everything is ok	2
10	2020-21	32	00400	00401	00402	good	2
11	2020-21	33	00400	00401	00402	fine	2
\.


--
-- Data for Name: WeeklyUpload_chatallmessages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WeeklyUpload_chatallmessages" (id, user_id, message, "timestamp", receiver, sender) FROM stdin;
21	SRADMIN	hello	2020-08-27 17:58:39+05:30	santhosh	null
22	SRADMIN	this is santhosh	2020-08-27 18:03:27+05:30	santhosh	null
23	SRADMIN	new message from my side	2020-08-27 18:04:29+05:30	santhosh	null
24	SRADMIN	hello	2020-08-27 18:15:52+05:30	santhosh	null
25	SRADMIN	new entry	2020-08-27 18:25:27+05:30	santhosh	null
26	SRADMIN	one more time	2020-08-27 18:28:54+05:30	santhosh	null
27	SRAP	From Andhra Pradesh	2020-08-27 19:59:56+05:30	santhosh	null
28	Admin	From my side	2020-08-27 20:01:55+05:30	santhosh	null
29	Admin	this is another message	2020-08-27 20:18:48+05:30	santhosh	null
30	Admin	This is the last message for today	2020-08-27 23:51:25+05:30	santhosh	null
31	Admin	Welocme to chat board	2020-08-31 16:09:40+05:30	santhosh	null
32	Admin	hello	2020-08-31 16:26:01+05:30	santhosh	null
33	Admin	hello	2020-08-31 16:27:41+05:30	santhosh	null
34	Admin	THis is from santhosh side	2020-08-31 16:52:55+05:30	santhosh	null
35	ANDHRA PRADESH	First Message from AP	2020-08-31 17:12:49+05:30	santhosh	null
36	Admin	After adding sender and receiver 	2020-08-31 21:28:40+05:30	santhosh	santhosh
37	ANDHRA PRADESH	This is Ap TRANSCO	2020-08-31 21:30:03+05:30	santhosh	AP1
38	ANDHRA PRADESH	Regard Software ,it is workin fine	2020-08-31 21:30:14+05:30	santhosh	AP1
40	Admin	hello ad welcom	2020-09-15 17:23:33+05:30	AP1	santhosh
41	Admin	this is another time ,sending the message	2020-09-15 17:25:38+05:30	AP1	santhosh
42	ANDHRA PRADESH	from ap transco side	2020-09-15 17:51:47+05:30	santhosh	AP1
43	Admin	first message	2020-09-15 17:56:49+05:30	AP1	santhosh
44	Admin	second message	2020-09-15 17:56:53+05:30	AP1	santhosh
45	Admin	two more times	2020-09-15 18:00:57+05:30	AP1	santhosh
46	Admin	latest message	2020-09-15 18:01:09+05:30	AP1	santhosh
47	Admin	new message	2020-09-15 18:04:04+05:30	AP1	santhosh
48	Admin	gdhjgfdhj	2020-09-15 18:10:00+05:30	AP1	santhosh
49	Admin	checking message	2020-09-15 18:23:10+05:30	AP1	santhosh
50	ANDHRA PRADESH	from ap transco side 	2020-09-15 18:23:42+05:30	santhosh	AP1
51	Admin	hgsjhgshjgdhjsghdgshdjsgggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg	2020-09-15 18:44:57+05:30	AP1	santhosh
52	Admin	dfgdfd	2020-09-15 20:59:07+05:30	AP1	santhosh
\.


--
-- Data for Name: WeeklyUpload_configuremodel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WeeklyUpload_configuremodel" (id, "Fin_year", "Week_no", "Week_startdate", "Week_enddate", "Revision_no", "Letter_refno", "Letter_date", "Payment_date", "Disbursement_date", "Lc_date", "Interest_levydate", "Entity", "DevAdditional", "DevAdditionalSignChange", "DevPostfacto", "DevNormal", "DevFinal", "PayableorReceivable", registration_id, modified_remarks, image_url, "Status", is_entered_payment, "Outstandings", "Consider_Week_no") FROM stdin;
1786	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Eastern Region(*erpc)	0	0	0	0	32679484	Payable	ER	null	null	Notified	f	32679484	null
1785	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Western Region(*wrpc)	0	0	0	0	6838794	Receivable	wr	null	null	Complete	f	0	null
1798	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	NTPC,RSTPS-III	-388711	0	0	-1871404	2260115	Payable	SRRRM3GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1800	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	NTPC,Sim'dri-II	-9036	0	0	-1484462	1493498	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1799	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	NTPC,Talcher-II	-37200	0	0	-2553732	2590932	Payable	SRRTL2GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1802	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	NTECL	-513063	0	0	-6616988	7130051	Payable	SRRVR1GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1813	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	LKPPL	-1433	0	0	-241865	243298	Payable	SRRLK2SL	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1810	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	SEIL/ TPCIL	-26695	0	0	-2905655	2932350	Payable	SRRTP1SL	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1806	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	NLC, II Expn	-27799	0	0	-4099979	4127778	Payable	SRRNE2GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1808	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	NTPC,Kudgi-Stage I	-10469	0	0	-2427521	2437990	Payable	SRRKT1GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1809	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	NNTPP	-246158	0	0	-6767114	7013272	Payable	SRRNN1GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1794	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	PUGALUR PGCIL(SR)	-7229	0	0	-603286	610515	Payable	PGPUGALUR	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1795	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	TRISSUR PGCIL(SR)	0	0	0	-15114	15114	Payable	SRRPG2BY	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1787	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Andhra Pradesh	-2202225	-2676	-1188967	14105928	10712060	Receivable	SRRAP1DS	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1812	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	SEL	-1696	0	0	-217657	219353	Payable	SRRSE1SL	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1801	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	NTPC,Sim'dri-I	-3348	0	0	-631863	635211	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1788	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Karnataka	-1094027	-74760	-821835	32408164	30417542	Receivable	SRRKA1DS	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1789	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Kerala	-89	0	-591989	13266874	12674796	Receivable	SRRKL1DS	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1791	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Telangana	-1459823	-201814	-1264810	25571843	22645396	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1792	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Puducherry	0	-641	-331001	3293628	2961986	Receivable	SRRPO1DS	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1793	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	PGCIL(SR)	-2085	0	0	1641156	1639071	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1796	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Goa(SR)	-50353	0	-1204333	1850705	596019	Receivable	SRRGO1DS	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1797	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	NTPC,RSTPS	-66079	-6691	0	112819	40049	Receivable	SRRRM1GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1803	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	NLC, II Stage I	-789571	-3644	0	822062	28847	Receivable	SRRNL1GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1804	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	NLC, II Stage II	-9367	0	0	2291193	2281826	Receivable	SRRNL2GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1805	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	NLC, I Expn	0	0	0	610451	610451	Receivable	SRRNE1GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1807	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	NTPL	-1019	0	0	125571	124552	Receivable	SRRTU1GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1814	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	LKPPL III	0	0	0	0	0	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Notified	f	0	null
1815	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Coastal(CE)	-8831	0	0	-998036	1006867	Payable	SRRCG1SL	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Notified	f	1006867	null
1818	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Western Region	0	0	0	-6847885	6847885	Payable	wr	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Notified	f	6847885	null
2074	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Eastern Region(*erpc)	0	0	0	0	161526482	Payable	ER	null	null	Notified	f	161526482	null
1821	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	MEPL\n(Imported Coal)	0	0	0	0	0	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Notified	f	0	null
1816	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	IL&FS	0	0	0	17790	17790	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1830	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	SBG BLOCK 23,24,25 and 26, PAVAGADA	-297	0	0	-880638	880638	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1831	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	SBG, NPKUNTA	-309	0	0	-968501	968501	Payable	SRRSC2GN 	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1817	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	SEIL Project 2	0	0	0	515464	515464	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1825	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Azure,NPKUNTA	37	0	0	139122	139122	Receivable	SRRAZ1GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1839	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Fortum Finsurya, PAVAGADA	-120	0	0	-605869	605869	Payable	SRRFP1GN 	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1841	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Renew-TN2, PAVAGADA	-2	0	0	-28406	28406	Payable	SRRRN1GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1819	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Eastern Region	0	0	0	31585907	31585907	Receivable	ER	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1827	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	TATA,NPKUNTA	59	0	0	209451	209451	Receivable	SRRTA1GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1829	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	FRV II,NPKUNTA	7	0	0	8071	8071	Receivable	SRRFR2GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1833	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Adyah Block 1, PAVAGADA	66	0	0	186490	186490	Receivable	SRRAD6GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1834	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Adyah Block 2, PAVAGADA	37	0	0	103288	103288	Receivable	SRRAD5GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1835	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Adyah Block 13, PAVAGADA	119	0	0	335953	335953	Receivable	ADYAHB13	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1836	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	TATA, PAVAGADA	219	0	0	721747	721747	Receivable	SRRTP1GN 	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1837	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	ACME Kurukshetra, PAVAGADA	27	0	0	109824	109824	Receivable	SRRKP1GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1838	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	ACME Rewari, PAVAGADA	36	0	0	153483	153483	Receivable	SRRAR1GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1840	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Parampujya, PAVAGADA	276	0	0	1289662	1289662	Receivable	SRRPP1GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
2084	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Goa(SR)	-28608	0	-1355679	-1623383	3007670	Payable	SRRGO1DS	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Complete	f	0	null
1826	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	FRV,NPKUNTA	-359	0	0	-1639868	1639868	Payable	SRRFR1GN 	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1847	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	KREDL, PAVAGADA	-2	0	0	-8019	8019	Payable	SRRKR1GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Notified	f	8019	null
1850	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Ayana, NPKUNTA	0	0	0	0	0	Payable	SRRAY1GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Notified	f	0	null
1855	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Betam, Tuticorin (Wind: 50 MW)	0	0	0	0	0	Payable	BETAM 	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Notified	f	0	null
1846	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Fortum Solar, PAVAGADA	247	0	0	669250	669250	Receivable	SRRFS1GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1848	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Azure Earth, PAVAGADA	80	0	0	205452	205452	Receivable	SRRAE1GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1820	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	NNTPP\n(Lignite)	-4222830	0	0	-4222830	4222830	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1853	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	ORANGE, Tuticorin (Wind)	-947	0	0	-2513006	2513006	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1852	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	MYTRAH, Tuticorin (Wind)	-2305	0	0	-8025939	8025939	Payable	SRRMW1GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1854	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Betam, Tuticorin (Wind)	-921	0	0	-1971724	1971724	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1849	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Avaada Solarise, PAVAGADA	5	0	0	-40964	40964	Payable	SRRAS1GN 	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1845	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Adyah Block 3, PAVAGADA	-24	0	0	-79689	79689	Payable	ADYAHB	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1832	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Avaada, PAVAGADA	-98	0	0	-379232	379232	Payable	SRRAP1GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1851	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	GIREL, Tuticorin (Wind)	-1751	0	0	-6071356	6071356	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1828	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	NTPC,NPKUNTA	-305	0	0	-1857306	1857306	Payable	SRRNS1GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1790	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Tamil Nadu	-4741670	-130669	-4484030	-16168950	25525319	Payable	SRRTN1DS	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1842	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Yarrow, PAVAGADA	41	0	0	179458	179458	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1843	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Adyah Block 10, PAVAGADA	32	0	0	83715	83715	Receivable	SRRAD4GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1844	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	Adyah Block 6, PAVAGADA	143	0	0	407771	407771	Receivable	SRRAD3GN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	null
1857	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Eastern Region(*erpc)	0	0	0	0	326794848	Payable	ER	null	null	Notified	f	326794848	null
1861	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Tamil Nadu	-3660332	-104050	-30139676	4297747	29606311	Payable	SRRTN1DS	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1858	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Andhra Pradesh	-976873	-6996	-1723505	6684479	3977105	Receivable	SRRAP1DS	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1856	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Western Region(*wrpc)	0	0	0	0	294722555	Receivable	wr	null	null	Complete	f	0	null
1859	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Karnataka	-14825	-132653	-9419817	47175025	37607730	Receivable	SRRKA1DS	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1860	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Kerala	0	0	-5629489	7175874	1546385	Receivable	SRRKL1DS	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1862	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Telangana	-303599	-216677	-2098740	43059437	40440421	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1863	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Puducherry	-88882	0	-1736748	3144469	1318839	Receivable	SRRPO1DS	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
2076	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Karnataka	-589983	-112417	-2089402	47185286	44393484	Receivable	SRRKA1DS	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	44393484	null
2077	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Kerala	0	0	-1398725	9851611	8452886	Receivable	SRRKL1DS	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	8452886	null
1883	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	SEL	-1754	0	0	-246793	248547	Payable	SRRSE1SL	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Notified	f	248547	null
1882	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	MEPL	-2213	0	0	-381824	384037	Payable	MEL	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	35
1885	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	LKPPL III	0	0	0	0	0	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Notified	f	0	null
1886	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Coastal(CE)	-1517725	-19435	0	-4285199	5822359	Payable	SRRCG1SL	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Notified	f	5822359	null
1889	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Western Region	0	0	0	-294664323	294664323	Payable	wr	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Notified	f	294664323	null
1891	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	NNTPP\n(Lignite)	0	0	0	0	0	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Notified	f	0	null
1892	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	MEPL\n(Imported Coal)	0	0	0	0	0	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Notified	f	0	null
1881	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	SEIL/ TPCIL	-475777	-1328	0	-5946663	6423768	Payable	SRRTP1SL	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1868	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	NTPC,RSTPS	-20725	-16018	0	-5950838	5987581	Payable	SRRRM1GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1873	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	NTECL	-87419	0	0	-4521585	4609004	Payable	SRRVR1GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1877	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	NLC, II Expn	-7810	0	0	-2897888	2905698	Payable	SRRNE2GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1879	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	NTPC,Kudgi-Stage I	-27219	0	0	-2838648	2865867	Payable	SRRKT1GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1871	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	NTPC,Sim'dri-II	-165282	-1013	0	-2231633	2397928	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1869	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	NTPC,RSTPS-III	-13287	0	0	-2041557	2054844	Payable	SRRRM3GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1867	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Goa(SR)	0	0	-1363433	393170	970263	Payable	SRRGO1DS	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1887	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	IL&FS	-393	0	0	-664202	664595	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1878	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	NTPL	-9849	0	0	-375928	385777	Payable	SRRTU1GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1872	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	NTPC,Sim'dri-I	0	0	0	-182633	182633	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1866	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	TRISSUR PGCIL(SR)	-1454	0	0	-131362	132816	Payable	SRRPG2BY	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1864	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	PGCIL(SR)	0	0	0	1019693	1019693	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1888	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	SEIL Project 2	-2069282	-46569	0	-4677722	6793573	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1874	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	NLC, II Stage I	-423419	-3636	0	3270235	2843180	Receivable	SRRNL1GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1875	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	NLC, II Stage II	-19951	-7273	0	2746158	2718934	Receivable	SRRNL2GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1876	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	NLC, I Expn	-365150	0	0	694738	329588	Receivable	SRRNE1GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1880	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	NNTPP	-760668	0	0	3030913	2270245	Receivable	SRRNN1GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1884	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	LKPPL	-1433	0	0	-254205	255638	Payable	SRRLK2SL	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1919	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	KREDL, PAVAGADA	-86	0	0	-109660	109660	Payable	SRRKR1GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Notified	f	109660	null
1890	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Eastern Region	0	0	0	326796118	326796118	Receivable	ER	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1904	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Avaada, PAVAGADA	-157	0	0	-493344	493344	Payable	SRRAP1GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	35
1902	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	SBG, NPKUNTA	-300	0	0	-923330	923330	Payable	SRRSC2GN 	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1898	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	TATA,NPKUNTA	-42	0	0	-237031	237031	Payable	SRRTA1GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1901	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	SBG BLOCK 23,24,25 and 26, PAVAGADA	-90	0	0	-285608	285608	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1917	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Adyah Block 3, PAVAGADA	-79	0	0	-254959	254959	Payable	ADYAHB	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1910	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	ACME Rewari, PAVAGADA	-41	0	0	-226958	226958	Payable	SRRAR1GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1900	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	FRV II,NPKUNTA	-1	0	0	-65798	65798	Payable	SRRFR2GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1913	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Renew-TN2, PAVAGADA	-1	0	0	-32274	32274	Payable	SRRRN1GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1908	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	TATA, PAVAGADA	-544	0	0	-1990823	1990823	Payable	SRRTP1GN 	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1896	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Azure,NPKUNTA	64	0	0	232973	232973	Receivable	SRRAZ1GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1903	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Ayana, NPKUNTA	-236	0	0	-523092	523092	Payable	SRRAY1GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1897	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	FRV,NPKUNTA	-368	0	0	-1679111	1679111	Payable	SRRFR1GN 	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1905	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Adyah Block 1, PAVAGADA	14	0	0	22784	22784	Receivable	SRRAD6GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1906	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Adyah Block 2, PAVAGADA	9	0	0	9665	9665	Receivable	SRRAD5GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1907	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Adyah Block 13, PAVAGADA	91	0	0	250008	250008	Receivable	ADYAHB13	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1912	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Parampujya, PAVAGADA	211	0	0	964087	964087	Receivable	SRRPP1GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1914	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Yarrow, PAVAGADA	56	0	0	229792	229792	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1915	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Adyah Block 10, PAVAGADA	78	0	0	212900	212900	Receivable	SRRAD4GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1916	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Adyah Block 6, PAVAGADA	112	0	0	312447	312447	Receivable	SRRAD3GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1918	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Fortum Solar, PAVAGADA	249	0	0	672717	672717	Receivable	SRRFS1GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1920	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Azure Earth, PAVAGADA	54	0	0	132153	132153	Receivable	SRRAE1GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1911	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Fortum Finsurya, PAVAGADA	-105	0	0	-538264	538264	Payable	SRRFP1GN 	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
2079	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Telangana	-277974	-42152	-1546272	26192913	24326515	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	24326515	null
2080	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Puducherry	-146055	-6135	-562134	6212652	5498328	Receivable	SRRPO1DS	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	5498328	null
2081	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	PGCIL(SR)	-470	0	0	964757	964287	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	964287	null
1894	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	ACME\nBhiwadi,NPKUNTA	-55	0	0	-318925	318925	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	34
1921	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Avaada Solarise, PAVAGADA	-167	0	0	-511612	511612	Payable	SRRAS1GN 	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	35
1927	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Western Region(*wrpc)	0	0	0	0	252236977	Receivable	wr	DUP	null	Complete	f	0	null
1929	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Andhra Pradesh	-1004927	-13968	-513876	5157092	3624321	Receivable	SRRAP1DS	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1926	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Betam, Tuticorin (Wind)	-437	0	0	-1027783	1027783	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1922	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	Ayana, NPKUNTA	0	0	0	0	0	Payable	SRRAY1GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1865	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	PUGALUR PGCIL(SR)	-7757	0	0	-554663	562420	Payable	PGPUGALUR	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1923	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	GIREL, Tuticorin (Wind)	-855	0	0	-3091132	3091132	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1899	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	NTPC,NPKUNTA	-425	0	0	-2591663	2591663	Payable	SRRNS1GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1925	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	ORANGE, Tuticorin (Wind)	-510	0	0	-1426393	1426393	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1909	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	ACME Kurukshetra, PAVAGADA	-79	0	0	-421111	421111	Payable	SRRKP1GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1870	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	NTPC,Talcher-II	-1163535	0	0	-6145484	7309019	Payable	SRRTL2GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1924	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	MYTRAH, Tuticorin (Wind)	-1477	0	0	-5151217	5151217	Payable	SRRMW1GN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	null
1928	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Eastern Region(*erpc)	0	0	0	0	161526482	Payable	ER	null	null	Notified	f	161526482	null
1930	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Karnataka	-1060843	-159732	-572834	44565542	42772133	Receivable	SRRKA1DS	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1931	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Kerala	-3775	0	-1043059	7301921	6255087	Receivable	SRRKL1DS	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
2085	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	NTPC,RSTPS	-739051	-33839	0	1980784	1207894	Receivable	SRRRM1GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	1207894	null
2091	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	NLC, II Stage I	-25742	-22083	0	8339595	8291770	Receivable	SRRNL1GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	8291770	null
2087	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	NTPC,Talcher-II	-311913	-7480	0	-41221	360614	Payable	SRRTL2GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Complete	f	0	null
2089	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	NTPC,Sim'dri-I	-758	0	0	-275374	276132	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Complete	f	0	null
2088	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	NTPC,Sim'dri-II	-5176	0	0	-655436	660612	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Complete	f	0	null
2082	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	PUGALUR PGCIL(SR)	-1510	0	0	-331276	332786	Payable	PGPUGALUR	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Complete	f	0	null
2083	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	TRISSUR PGCIL(SR)	-905	0	0	-222121	223026	Payable	SRRPG2BY	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Complete	f	0	null
2086	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	NTPC,RSTPS-III	0	0	0	-907476	907476	Payable	SRRRM3GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Complete	f	0	null
2092	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	NLC, II Stage II	-255638	-22911	0	6018527	5739978	Receivable	SRRNL2GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	5739978	null
1954	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	SEL	-1528	0	0	-213609	215137	Payable	SRRSE1SL	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Notified	f	215137	null
1957	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Coastal(CE)	-33830	0	0	-1700149	1733979	Payable	SRRCG1SL	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Notified	f	1733979	null
1960	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Western Region	0	0	0	-251862757	251862757	Payable	wr	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Notified	f	251862757	null
2090	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	NTECL	-156744	0	0	-6857970	7014714	Payable	SRRVR1GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Complete	f	0	35
1955	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	LKPPL	0	0	0	-50935	50935	Payable	SRRLK2SL	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1952	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	SEIL/ TPCIL	-1788268	-4384	0	-5557887	7350539	Payable	SRRTP1SL	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1948	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	NLC, II Expn	-170293	-3481	0	-2475036	2648810	Payable	SRRNE2GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1958	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	IL&FS	-21598	0	0	-1160237	1181835	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1949	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	NTPL	-3526	0	0	-208610	212136	Payable	SRRTU1GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1950	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	NTPC,Kudgi-Stage I	-12011	0	0	-2606160	2618171	Payable	SRRKT1GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1956	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	LKPPL III	-1212	0	0	-170097	171309	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1951	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	NNTPP	-1298674	0	0	1216161	82513	Payable	SRRNN1GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1959	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	SEIL Project 2	-147894	0	0	-777830	925724	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1936	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	PUGALUR PGCIL(SR)	-2638	0	0	-302366	305004	Payable	PGPUGALUR	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1937	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	TRISSUR PGCIL(SR)	-1613	0	0	-147202	148815	Payable	SRRPG2BY	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1932	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Tamil Nadu	-2782155	-143802	-6106732	18648270	9615581	Receivable	SRRTN1DS	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1944	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	NTECL	-121216	0	0	-7577840	7699056	Payable	SRRVR1GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1933	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Telangana	-1139277	-206126	-518055	26681061	24817603	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1934	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Puducherry	-40571	-30046	-337201	7152327	6744509	Receivable	SRRPO1DS	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1935	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	PGCIL(SR)	-2049	0	0	826993	824944	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1939	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	NTPC,RSTPS	-773415	-97669	0	4953969	4082885	Receivable	SRRRM1GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1941	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	NTPC,Talcher-II	-32603	0	0	1986811	1954208	Receivable	SRRTL2GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1942	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	NTPC,Sim'dri-II	-1170	0	0	267343	266173	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1943	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	NTPC,Sim'dri-I	-1295	0	0	415702	414407	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1945	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	NLC, II Stage I	0	-32553	0	8891665	8859112	Receivable	SRRNL1GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1946	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	NLC, II Stage II	-117136	-31537	0	7514060	7365387	Receivable	SRRNL2GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1947	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	NLC, I Expn	-111	0	0	4661483	4661372	Receivable	SRRNE1GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1962	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	NNTPP\n(Lignite)	0	0	0	0	0	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Notified	f	0	null
2093	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	NLC, I Expn	0	0	0	2010262	2010262	Receivable	SRRNE1GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	2010262	null
1980	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	ACME Kurukshetra, PAVAGADA	-68	0	0	-366613	366613	Payable	SRRKP1GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Notified	f	366613	null
1968	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	FRV,NPKUNTA	-236	0	0	-1094137	1094137	Payable	SRRFR1GN 	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	35
1972	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	SBG BLOCK 23,24,25 and 26, PAVAGADA	-91	0	0	-383057	383057	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1973	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	SBG, NPKUNTA	-274	0	0	-939514	939514	Payable	SRRSC2GN 	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1976	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Adyah Block 1, PAVAGADA	-50	0	0	-172568	172568	Payable	SRRAD6GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1978	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Adyah Block 13, PAVAGADA	-28	0	0	-121290	121290	Payable	ADYAHB13	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1979	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	TATA, PAVAGADA	-35	0	0	-351553	351553	Payable	SRRTP1GN 	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1982	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Fortum Finsurya, PAVAGADA	-44	0	0	-337340	337340	Payable	SRRFP1GN 	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1983	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Parampujya, PAVAGADA	-69	0	0	-509248	509248	Payable	SRRPP1GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1984	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Renew-TN2, PAVAGADA	-40	0	0	-251197	251197	Payable	SRRRN1GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1986	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Adyah Block 10, PAVAGADA	-34	0	0	-140759	140759	Payable	SRRAD4GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1987	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Adyah Block 6, PAVAGADA	-15	0	0	-83566	83566	Payable	SRRAD3GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1988	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Adyah Block 3, PAVAGADA	-97	0	0	-313541	313541	Payable	ADYAHB	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1974	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Ayana, NPKUNTA	-65	0	0	-170171	170171	Payable	SRRAY1GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1975	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Avaada, PAVAGADA	2	0	0	-117917	117917	Payable	SRRAP1GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1970	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	NTPC,NPKUNTA	-856	0	0	-5263694	5263694	Payable	SRRNS1GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1963	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	MEPL\n(Imported Coal)	246	0	0	210	210	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1977	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Adyah Block 2, PAVAGADA	27	0	0	48622	48622	Receivable	SRRAD5GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1985	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Yarrow, PAVAGADA	58	0	0	176775	176775	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1990	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	KREDL, PAVAGADA	-71	0	0	-105181	105181	Payable	SRRKR1GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Notified	f	105181	null
1989	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Fortum Solar, PAVAGADA	-101	0	0	-404312	404312	Payable	SRRFS1GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1991	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Azure Earth, PAVAGADA	-80	0	0	-294769	294769	Payable	SRRAE1GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1992	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Avaada Solarise, PAVAGADA	141	0	0	304344	304344	Receivable	SRRAS1GN 	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1994	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	GIREL, Tuticorin (Wind)	1228	0	0	3981329	3981329	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1966	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	ACME\nKarnal,NPKUNTA	-5	0	0	-110002	110002	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	34
1965	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	ACME\nBhiwadi,NPKUNTA	-56	0	0	-347352	347352	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	34
1998	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Betam, Tuticorin	-2	0	0	-3919	3919	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	35
1961	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Eastern Region	0	0	0	260762233	260762233	Receivable	ER	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Partial	f	257638372	null
1996	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	ORANGE, Tuticorin (Wind)	755	0	0	1814126	1814126	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1993	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Ayana, NPKUNTA	0	0	0	0	0	Payable	SRRAY1GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Notified	f	0	null
1938	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Goa(SR)	-48132	0	-1224048	-2002302	3274482	Payable	SRRGO1DS	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1940	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	NTPC,RSTPS-III	0	0	0	-544618	544618	Payable	SRRRM3GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1969	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	TATA,NPKUNTA	-60	0	0	-353855	353855	Payable	SRRTA1GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1995	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	MYTRAH, Tuticorin (Wind)	-503	0	0	-1822589	1822589	Payable	SRRMW1GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
1997	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Betam, Tuticorin (Wind)	13	0	0	-64707	64707	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	null
2097	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	NNTPP	-52163	-1941	0	1578821	1524717	Receivable	SRRNN1GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	1524717	null
2101	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	LKPPL	0	0	0	0	0	Payable	SRRLK2SL	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	0	null
2103	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Coastal(CE)	-4824885	-30454	0	-8362227	13217566	Payable	SRRCG1SL	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	13217566	null
2104	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	IL&FS	0	0	0	10561	10561	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	10561	null
2106	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Western Region	0	0	0	-169248779	169248779	Payable	wr	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	169248779	null
2107	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Eastern Region	0	0	0	161494368	161494368	Receivable	ER	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	161494368	null
2108	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	NNTPP\n(Lignite)	0	0	0	0	0	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	0	null
2109	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	MEPL\n(Imported Coal)	0	0	0	0	0	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	0	null
2105	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	SEIL Project 2	-1802811	-551	0	-3723640	5527002	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Complete	f	0	null
2095	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	NTPL	-661	0	0	-70245	70906	Payable	SRRTU1GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Complete	f	0	null
2096	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	NTPC,Kudgi-Stage I	-4077	0	0	-2758195	2762272	Payable	SRRKT1GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Complete	f	0	null
2110	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	ACME\nHissar,NPKUNTA	151	0	0	582781	582781	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	582781	null
2111	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	ACME\nBhiwadi,NPKUNTA	106	0	0	400631	400631	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	400631	null
2112	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	ACME\nKarnal,NPKUNTA	93	0	0	350803	350803	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	350803	null
2113	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Azure,NPKUNTA	180	0	0	738493	738493	Receivable	SRRAZ1GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	738493	null
2115	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	TATA,NPKUNTA	216	0	0	921559	921559	Receivable	SRRTA1GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	921559	null
2117	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	FRV II,NPKUNTA	165	0	0	653069	653069	Receivable	SRRFR2GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	653069	null
2099	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	MEPL	-866	0	0	-403812	404678	Payable	MEL	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Complete	f	0	35
2114	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	FRV,NPKUNTA	-282	0	0	-1302876	1302876	Payable	SRRFR1GN 	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Complete	f	0	35
2100	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	SEL	-346	0	0	-234836	235182	Payable	SRRSE1SL	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Complete	f	0	36
2118	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	SBG BLOCK 23,24,25 and 26, PAVAGADA	608	0	0	1623112	1623112	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	1623112	null
2119	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	SBG, NPKUNTA	349	0	0	805039	805039	Receivable	SRRSC2GN 	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	805039	null
2121	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Avaada, PAVAGADA	434	0	0	1194975	1194975	Receivable	SRRAP1GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	1194975	null
2123	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Adyah Block 2, PAVAGADA	141	0	0	394686	394686	Receivable	SRRAD5GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	394686	null
2124	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Adyah Block 13, PAVAGADA	123	0	0	338037	338037	Receivable	ADYAHB13	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	338037	null
2125	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	TATA, PAVAGADA	1483	0	0	5186250	5186250	Receivable	SRRTP1GN 	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	5186250	null
2126	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	ACME Kurukshetra, PAVAGADA	42	0	0	179318	179318	Receivable	SRRKP1GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	179318	null
2127	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	ACME Rewari, PAVAGADA	87	0	0	392501	392501	Receivable	SRRAR1GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	392501	null
2128	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Fortum Finsurya, PAVAGADA	144	0	0	620451	620451	Receivable	SRRFP1GN 	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	620451	null
2129	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Parampujya, PAVAGADA	725	0	0	3384521	3384521	Receivable	SRRPP1GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	3384521	null
2130	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Renew-TN2, PAVAGADA	127	0	0	582374	582374	Receivable	SRRRN1GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	582374	null
2131	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Yarrow, PAVAGADA	204	0	0	935988	935988	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	935988	null
2132	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Adyah Block 10, PAVAGADA	129	0	0	357994	357994	Receivable	SRRAD4GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	357994	null
2133	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Adyah Block 6, PAVAGADA	152	0	0	421940	421940	Receivable	SRRAD3GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	421940	null
2134	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Adyah Block 3, PAVAGADA	52	0	0	130596	130596	Receivable	ADYAHB	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	130596	null
2135	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Fortum Solar, PAVAGADA	401	0	0	1099515	1099515	Receivable	SRRFS1GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	1099515	null
2136	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	KREDL, PAVAGADA	218	0	0	263907	263907	Receivable	SRRKR1GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	263907	null
2120	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Ayana, NPKUNTA	-434	0	0	-924930	924930	Payable	SRRAY1GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Complete	f	0	null
2122	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Adyah Block 1, PAVAGADA	4	0	0	-417	417	Payable	SRRAD6GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Complete	f	0	null
2137	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Azure Earth, PAVAGADA	176	0	0	493279	493279	Receivable	SRRAE1GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	493279	null
2138	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Avaada Solarise, PAVAGADA	538	0	0	1539260	1539260	Receivable	SRRAS1GN 	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	1539260	null
2143	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Betam, Tuticorin (Wind)	256	0	0	407660	407660	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Notified	f	407660	null
2116	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	NTPC,NPKUNTA	-87	0	0	-651961	651961	Payable	SRRNS1GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Complete	f	0	null
2098	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	SEIL/ TPCIL	-695666	-1856	0	-5986546	6684068	Payable	SRRTP1SL	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Complete	f	0	null
2140	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	GIREL, Tuticorin (Wind)	-424	0	0	-1916075	1916075	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Complete	f	0	null
2139	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	SPRNG, NPKUNTA	-1	0	0	-3395	3395	Payable	srsprng	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Complete	f	0	36
2141	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	MYTRAH, Tuticorin (Wind)	-1237	0	0	-4347528	4347528	Payable	SRRMW1GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Complete	f	0	null
2142	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	ORANGE, Tuticorin (Wind)	-35	0	0	-239141	239141	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Complete	f	0	null
2078	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Tamil Nadu	-1137329	-38887	-8179321	6229343	3126194	Payable	SRRTN1DS	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Complete	f	0	null
2094	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	NLC, II Expn	-641211	-6001	0	-1597462	2244674	Payable	SRRNE2GN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Complete	f	0	null
2073	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Western Region(*wrpc)	0	0	0	0	170609703	Receivable	wr	null	null	Complete	f	0	null
1964	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	ACME\nHissar,NPKUNTA	-14	0	0	-160872	160872	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	34
1822	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	ACME\nHissar,NPKUNTA	-5	0	0	-60753	60753	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	34
1823	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	ACME\nBhiwadi,NPKUNTA	-3	0	0	-52171	52171	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	34
2149	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Kerala	-1880	0	-1183160	513685	671355	Payable	SRRKL1DS	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
1967	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	Azure,NPKUNTA	-6	0	0	-95783	95783	Payable	SRRAZ1GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	34
1824	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	ACME\nKarnal,NPKUNTA	-28	0	0	-159096	159096	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	34
1953	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	MEPL	-1888	0	0	-389342	391230	Payable	MEL	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	35
1893	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	ACME\nHissar,NPKUNTA	9	0	0	-24518	24518	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	34
1981	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	ACME Rewari, PAVAGADA	-20	0	0	-131058	131058	Payable	SRRAR1GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	34
1895	2020-21	32	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-30	2020-12-07	2020-12-07	ACME\nKarnal,NPKUNTA	-16	0	0	-121125	121125	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No32/SRPC Filedsm02-08nov20.pdf	Complete	f	0	34
2075	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Andhra Pradesh	-228338	-3215	-1331230	16578292	15015509	Receivable	SRRAP1DS	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Complete	f	0	null
2147	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Andhra Pradesh	-476635	-23625	-903738	17967458	16563460	Receivable	SRRAP1DS	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2151	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Telangana	-945542	-69417	-1045175	18652517	16592383	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2145	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Western Region(*wrpc)	0	0	0	0	61079742	Payable	wr	null	null	Notified	f	61079742	35
2146	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Eastern Region(*erpc)	0	0	0	0	29193521	Receivable	ER	null	null	Notified	f	29193521	35
2150	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Tamil Nadu	-10932942	-224903	-8065665	-12249200	31472710	Payable	SRRTN1DS	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2148	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Karnataka	-4341312	-148973	-1101474	19923669	14331910	Receivable	SRRKA1DS	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2152	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Puducherry	-391285	-31968	-432822	6020209	5164134	Receivable	SRRPO1DS	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2171	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	MEPL	-3043	0	0	-398624	401667	Payable	MEL	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Notified	f	401667	35
2173	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	LKPPL	0	0	0	0	0	Payable	SRRLK2SL	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Notified	f	0	35
2175	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Coastal(CE)	-58789	0	0	-1309132	1367921	Payable	SRRCG1SL	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Notified	f	1367921	35
2179	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Eastern Region	0	0	0	-29195440	29195440	Payable	ER	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Notified	f	29195440	35
2180	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	NNTPP\n(Lignite)	0	0	0	0	0	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Notified	f	0	35
2158	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	NTPC,RSTPS-III	-15218	0	0	-1010652	1025870	Payable	SRRRM3GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2160	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	NTPC,Sim'dri-II	-14133	0	0	-750356	764489	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2162	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	NTECL	-417397	-10220	0	-10313305	10740922	Payable	SRRVR1GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2170	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	SEIL/ TPCIL	-66385	-2930	0	-5028669	5097984	Payable	SRRTP1SL	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2166	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	NLC, II Expn	-314839	-3038	0	-1474426	1792303	Payable	SRRNE2GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2174	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	LKPPL III	-2865	0	0	-271884	274749	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2167	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	NTPL	-356	0	0	-147484	147840	Payable	SRRTU1GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2168	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	NTPC,Kudgi-Stage I	-29643	0	0	-2796608	2826251	Payable	SRRKT1GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2177	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	SEIL Project 2	-143091	0	0	-2077232	2220323	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2154	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	PUGALUR PGCIL(SR)	-4915	0	0	-314392	319307	Payable	PGPUGALUR	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2155	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	TRISSUR PGCIL(SR)	-2746	0	0	-183647	186393	Payable	SRRPG2BY	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2153	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	PGCIL(SR)	-4537	0	0	1130771	1126234	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2157	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	NTPC,RSTPS	-174314	-47463	0	4857516	4635739	Receivable	SRRRM1GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2159	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	NTPC,Talcher-II	-15045	0	0	1891206	1876161	Receivable	SRRTL2GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2161	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	NTPC,Sim'dri-I	-30186	0	0	1261610	1231424	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2163	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	NLC, II Stage I	-266756	-13884	0	4671735	4391095	Receivable	SRRNL1GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2165	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	NLC, I Expn	-239	0	0	2775057	2774818	Receivable	SRRNE1GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2169	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	NNTPP	-143758	-2132	0	1362364	1216474	Receivable	SRRNN1GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2176	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	IL&FS	-372	0	0	82157	81785	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2178	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Western Region	0	0	0	62929954	62929954	Receivable	wr	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Partial	f	62929954	35
2172	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	SEL	-1255	0	0	-226859	228114	Payable	SRRSE1SL	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	36
2183	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	ACME\nBhiwadi,NPKUNTA	-250	0	0	-1205687	1205687	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2184	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	ACME\nKarnal,NPKUNTA	-235	0	0	-1133284	1133284	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2185	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Azure,NPKUNTA	-172	0	0	-827045	827045	Payable	SRRAZ1GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2186	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	FRV,NPKUNTA	-201	0	0	-949412	949412	Payable	SRRFR1GN 	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2187	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	TATA,NPKUNTA	-560	0	0	-2588625	2588625	Payable	SRRTA1GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2188	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	NTPC,NPKUNTA	-1134	0	0	-6829758	6829758	Payable	SRRNS1GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2189	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	FRV II,NPKUNTA	-104	0	0	-522234	522234	Payable	SRRFR2GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2190	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	SBG BLOCK 23,24,25 and 26, PAVAGADA	-238	0	0	-773166	773166	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2191	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	SBG, NPKUNTA	-165	0	0	-534437	534437	Payable	SRRSC2GN 	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2194	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Avaada, PAVAGADA	-337	0	0	-1071395	1071395	Payable	SRRAP1GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2195	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Adyah Block 1, PAVAGADA	-126	0	0	-388731	388731	Payable	SRRAD6GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2196	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Adyah Block 2, PAVAGADA	-77	0	0	-254088	254088	Payable	SRRAD5GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2197	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Adyah Block 13, PAVAGADA	-54	0	0	-189533	189533	Payable	ADYAHB13	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2198	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	TATA, PAVAGADA	-434	0	0	-1759654	1759654	Payable	SRRTP1GN 	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2199	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	ACME Kurukshetra, PAVAGADA	-109	0	0	-549576	549576	Payable	SRRKP1GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2200	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	ACME Rewari, PAVAGADA	-112	0	0	-563491	563491	Payable	SRRAR1GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2201	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Fortum Finsurya, PAVAGADA	-213	0	0	-1101742	1101742	Payable	SRRFP1GN 	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2202	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Parampujya, PAVAGADA	-27	0	0	-270565	270565	Payable	SRRPP1GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2203	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Renew-TN2, PAVAGADA	-197	0	0	-985810	985810	Payable	SRRRN1GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2204	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Yarrow, PAVAGADA	-81	0	0	-448755	448755	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2205	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Adyah Block 10, PAVAGADA	-79	0	0	-257371	257371	Payable	SRRAD4GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2206	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Adyah Block 6, PAVAGADA	-58	0	0	-202847	202847	Payable	SRRAD3GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2207	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Adyah Block 3, PAVAGADA	-95	0	0	-308234	308234	Payable	ADYAHB	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2192	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Ayana, NPKUNTA	-444	0	0	-954907	954907	Payable	SRRAY1GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2181	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	MEPL\n(Imported Coal)	3299	0	0	2722	2722	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2193	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	SPRNG, NPKUNTA	-58	0	0	-137700	137700	Payable	srsprng	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	36
2217	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Betam, Tuticorin	0	0	0	0	0	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Notified	f	0	35
1811	2020-21	31	2020-12-07	2020-12-07	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-07	2020-12-07	2020-11-23	2020-12-07	2020-12-07	MEPL	-4145	0	0	-385725	389870	Payable	MEL	null	/static/images/SRPC/2020-21/Week_No31/SRPC Filedsm26-01nov20.pdf	Complete	f	0	35
2212	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	SPRNG, NPKUNTA	0	0	0	-2024	2024	Payable	srsprng	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	36
2144	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	Betam, Tuticorin	0	0	0	-1174	1174	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Complete	f	0	35
2222	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Kerala	-1583	-58879	-1079572	1239113	99079	Receivable	SRRKL1DS	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2102	2020-21	34	2020-12-15	2020-12-15	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-15	2020-12-15	2020-12-14	2020-12-15	2020-12-15	LKPPL III	-661	0	0	-241363	242024	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No34/SRPC Filedsm16-22nov20.pdf	Complete	f	0	35
2214	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	MYTRAH, Tuticorin (Wind)	-1340	0	0	-4753869	4753869	Payable	SRRMW1GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2156	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Goa(SR)	-21406	0	-1319363	-99216	1439985	Payable	SRRGO1DS	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2164	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	NLC, II Stage II	-164339	-14529	0	4302192	4123324	Receivable	SRRNL2GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2182	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	ACME\nHissar,NPKUNTA	-276	0	0	-1311879	1311879	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2215	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	ORANGE, Tuticorin (Wind)	-292	0	0	-853955	853955	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2213	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	GIREL, Tuticorin (Wind)	-1073	0	0	-3814160	3814160	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2218	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Western Region(*wrpc)	0	0	0	0	61308228	Payable	wr	null	null	Notified	f	61308228	36
2216	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Betam, Tuticorin (Wind)	-224	0	0	-565252	565252	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2219	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Eastern Region(*erpc)	0	0	0	0	61558899	Receivable	ER	null	null	Notified	f	61558899	36
2208	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Fortum Solar, PAVAGADA	-562	0	0	-1709202	1709202	Payable	SRRFS1GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2210	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Azure Earth, PAVAGADA	-101	0	0	-346753	346753	Payable	SRRAE1GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
1971	2020-21	33	2020-12-09	2020-12-09	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-09	2020-12-09	2020-12-07	2020-12-09	2020-12-09	FRV II,NPKUNTA	-16	0	0	-169611	169611	Payable	SRRFR2GN	null	/static/images/SRPC/2020-21/Week_No33/SRPC Filedsm09-15nov20.pdf	Complete	f	0	35
2211	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	Avaada Solarise, PAVAGADA	-436	0	0	-1424424	1424424	Payable	SRRAS1GN 	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Complete	f	0	35
2220	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Andhra Pradesh	-1607054	-515536	-874413	2900391	96612	Payable	SRRAP1DS	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2223	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Tamil Nadu	-6294533	-15332279	-2529147	17097837	7058122	Payable	SRRTN1DS	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2209	2020-21	35	2020-12-23	2020-12-23	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-23	2020-12-23	2020-12-21	2020-12-23	2020-12-23	KREDL, PAVAGADA	-61	0	0	-87532	87532	Payable	SRRKR1GN	null	/static/images/SRPC/2020-21/Week_No35/SRPC Filedsm23-29nov20.pdf	Notified	f	87532	35
2224	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Telangana	-2860040	-1925869	-1034638	7011084	1190537	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2221	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Karnataka	-4448721	-3059691	-1318208	26371859	17545239	Receivable	SRRKA1DS	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2244	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	MEPL	-3597	0	0	-327291	330888	Payable	MEL	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Notified	f	330888	36
2246	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	LKPPL	0	0	0	0	0	Payable	SRRLK2SL	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Notified	f	0	36
2248	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Coastal(CE)	-39798	0	0	-1429636	1469434	Payable	SRRCG1SL	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Notified	f	1469434	36
2252	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Eastern Region	0	0	0	-61414522	61414522	Payable	ER	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Notified	f	61414522	36
2225	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Puducherry	-155996	-133559	-405327	3826627	3131745	Receivable	SRRPO1DS	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2227	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	PUGALUR PGCIL(SR)	-7894	0	0	-327642	335536	Payable	PGPUGALUR	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2240	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	NTPL	-3627	0	0	-194958	198585	Payable	SRRTU1GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2237	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	NLC, II Stage II	-1221294	-333675	0	-389784	1944753	Payable	SRRNL2GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2229	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Goa(SR)	-16308	0	-1327686	362292	981702	Payable	SRRGO1DS	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2242	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	NNTPP	-242410	-123167	0	-5250341	5615918	Payable	SRRNN1GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2239	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	NLC, II Expn	-13995	0	0	-2297041	2311036	Payable	SRRNE2GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2245	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	SEL	-3235	0	0	-292961	296196	Payable	SRRSE1SL	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2235	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	NTECL	-190537	-28116	0	-6199133	6417786	Payable	SRRVR1GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2250	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	SEIL Project 2	-38039	-11526	0	-422100	471665	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2243	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	SEIL/ TPCIL	-997755	-576246	0	-8496929	10070930	Payable	SRRTP1SL	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2231	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	NTPC,RSTPS-III	-9843	0	0	-1210289	1220132	Payable	SRRRM3GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2233	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	NTPC,Sim'dri-II	-31872	0	0	-1737272	1769144	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2241	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	NTPC,Kudgi-Stage I	-54437	0	0	-4081326	4135763	Payable	SRRKT1GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2226	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	PGCIL(SR)	-5077	0	0	1183940	1178863	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2230	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	NTPC,RSTPS	-12426	-399192	0	4827823	4416205	Receivable	SRRRM1GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2232	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	NTPC,Talcher-II	-9700	0	0	2773188	2763488	Receivable	SRRTL2GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2234	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	NTPC,Sim'dri-I	-28151	0	0	3367369	3339218	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2236	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	NLC, II Stage I	-950171	-335222	0	1682161	396768	Receivable	SRRNL1GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2238	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	NLC, I Expn	-2513	0	0	2439342	2436829	Receivable	SRRNE1GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2249	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	IL&FS	-11618	0	0	152220	140602	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2251	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Western Region	0	0	0	61133010	61133010	Receivable	wr	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Partial	f	61133010	36
2253	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	NNTPP\n(Lignite)	0	0	0	0	0	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Notified	f	0	36
2254	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	MEPL\n(Imported Coal)	0	0	0	0	0	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Notified	f	0	36
2260	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	TATA,NPKUNTA	-303	0	0	-1435810	1435810	Payable	SRRTA1GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2274	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Fortum Finsurya, PAVAGADA	-256	0	0	-1354865	1354865	Payable	SRRFP1GN 	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2277	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Yarrow, PAVAGADA	-127	0	0	-733914	733914	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2258	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Azure,NPKUNTA	-180	0	0	-843339	843339	Payable	SRRAZ1GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2266	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	SPRNG, NPKUNTA	-62	0	0	-152441	152441	Payable	srsprng	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2262	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	FRV II,NPKUNTA	-157	0	0	-770807	770807	Payable	SRRFR2GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2259	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	FRV,NPKUNTA	-330	0	0	-1578187	1578187	Payable	SRRFR1GN 	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2255	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	ACME\nHissar,NPKUNTA	-109	0	0	-566368	566368	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2265	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Ayana, NPKUNTA	-538	0	0	-1168948	1168948	Payable	SRRAY1GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2270	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Adyah Block 13, PAVAGADA	-29	0	0	-119029	119029	Payable	ADYAHB13	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2268	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Adyah Block 1, PAVAGADA	-10	0	0	-57146	57146	Payable	SRRAD6GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2278	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Adyah Block 10, PAVAGADA	-46	0	0	-165428	165428	Payable	SRRAD4GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2279	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Adyah Block 6, PAVAGADA	-8	0	0	-56961	56961	Payable	SRRAD3GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2273	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	ACME Rewari, PAVAGADA	-98	0	0	-507853	507853	Payable	SRRAR1GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2272	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	ACME Kurukshetra, PAVAGADA	-129	0	0	-665448	665448	Payable	SRRKP1GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2261	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	NTPC,NPKUNTA	-1426	0	0	-8623817	8623817	Payable	SRRNS1GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2256	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	ACME\nBhiwadi,NPKUNTA	93	0	0	308876	308876	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2257	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	ACME\nKarnal,NPKUNTA	40	0	0	77128	77128	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2269	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Adyah Block 2, PAVAGADA	16	0	0	14278	14278	Receivable	SRRAD5GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2271	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	TATA, PAVAGADA	314	0	0	912258	912258	Receivable	SRRTP1GN 	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2263	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	SBG BLOCK 23,24,25 and 26, PAVAGADA	-108	0	0	-433059	433059	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	37
2276	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Renew-TN2, PAVAGADA	-113	0	0	-585654	585654	Payable	SRRRN1GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	37
2264	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	SBG, NPKUNTA	-317	0	0	-1014476	1014476	Payable	SRRSC2GN 	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	37
2275	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Parampujya, PAVAGADA	-300	0	0	-1605332	1605332	Payable	SRRPP1GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	37
2285	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	SPRNG, NPKUNTA	0	0	0	0	0	Payable	srsprng	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Notified	f	0	36
2267	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Avaada, PAVAGADA	-343	0	0	-1167699	1167699	Payable	SRRAP1GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2290	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Western Region(*wrpc)	0	0	0	0	169056563	Payable	wr	null	null	Notified	f	169056563	37
2291	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Eastern Region(*erpc)	0	0	0	0	187555826	Receivable	ER	null	null	Notified	f	187555826	37
2228	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	TRISSUR PGCIL(SR)	-4740	0	0	-219147	223887	Payable	SRRPG2BY	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2247	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	LKPPL III	-1873	0	0	-252114	253987	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2283	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Azure Earth, PAVAGADA	-31	0	0	-140791	140791	Payable	SRRAE1GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2284	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Avaada Solarise, PAVAGADA	-151	0	0	-550804	550804	Payable	SRRAS1GN 	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2288	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	ORANGE, Tuticorin (Wind)	-587	0	0	-1903560	1903560	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2281	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Fortum Solar, PAVAGADA	-299	0	0	-959763	959763	Payable	SRRFS1GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2287	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	MYTRAH, Tuticorin (Wind)	-1814	0	0	-6509460	6509460	Payable	SRRMW1GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2280	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Adyah Block 3, PAVAGADA	-22	0	0	-94144	94144	Payable	ADYAHB	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2282	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	KREDL, PAVAGADA	176	0	0	203051	203051	Receivable	SRRKR1GN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	36
2295	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Tamil Nadu	-18204023	-6360570	-13852180	-13289790	51706563	Payable	SRRTN1DS	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2301	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Goa(SR)	-157782	0	-1459660	367582	1249860	Payable	SRRGO1DS	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2303	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	NTPC,RSTPS-III	-482243	-9414	0	-2429256	2920913	Payable	SRRRM3GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2304	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	NTPC,Talcher-II	-763110	0	0	-697070	1460180	Payable	SRRTL2GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2296	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Telangana	-9391390	-1697490	-1937923	2748777	10278026	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2300	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	TRISSUR PGCIL(SR)	-67966	0	0	-191264	259230	Payable	SRRPG2BY	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2289	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	Betam, Tuticorin (Wind)	-557	0	0	-1388403	1388403	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	37
2286	2020-21	36	2020-12-29	2020-12-29	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2020-12-29	2020-12-29	2020-12-28	2020-12-29	2020-12-29	GIREL, Tuticorin (Wind)	-1426	0	0	-5686044	5686044	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No36/SRPC Filedsm30-06dec20.pdf	Complete	f	0	37
2292	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Andhra Pradesh	-8070575	-740128	-922415	11028972	1295854	Receivable	SRRAP1DS	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2293	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Karnataka	-10143635	-1724498	-5234899	28900492	11797460	Receivable	SRRKA1DS	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2297	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Puducherry	-279736	-438472	-1032195	6841747	5091344	Receivable	SRRPO1DS	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2298	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	PGCIL(SR)	-5820	0	0	1100921	1095101	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2302	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	NTPC,RSTPS	-695322	-532550	0	4128606	2900734	Receivable	SRRRM1GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2317	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	SEL	-47295	0	0	-239836	287131	Payable	SRRSE1SL	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Notified	f	287131	37
2318	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	LKPPL	0	0	0	0	0	Payable	SRRLK2SL	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Notified	f	0	37
2319	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	LKPPL III	-39671	0	0	-224933	264604	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Notified	f	264604	37
2320	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Coastal(CE)	-384013	-866	0	-242164	627043	Payable	SRRCG1SL	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Notified	f	627043	37
2324	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Eastern Region	0	0	0	-152978086	152978086	Payable	ER	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Notified	f	152978086	37
2325	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	NNTPP\n(Lignite)	0	0	0	0	0	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Notified	f	0	37
2326	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	MEPL\n(Imported Coal)	0	0	0	0	0	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Notified	f	0	37
2331	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	FRV,NPKUNTA	-8	0	0	-84109	84109	Payable	SRRFR1GN 	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Notified	f	84109	37
2315	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	SEIL/ TPCIL	-1048601	-115047	0	-4593626	5757274	Payable	SRRTP1SL	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2311	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	NLC, II Expn	-1302586	-29634	0	-1161784	2494004	Payable	SRRNE2GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2321	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	IL&FS	-207105	0	0	-393128	600233	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2312	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	NTPL	-283992	0	0	209278	74714	Payable	SRRTU1GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2313	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	NTPC,Kudgi-Stage I	-1086252	-39594	0	-3851915	4977761	Payable	SRRKT1GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2314	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	NNTPP	-1920652	-129821	0	-3533020	5583493	Payable	SRRNN1GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2322	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	SEIL Project 2	-128440	-5246	0	83444	50242	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2307	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	NTECL	-1197653	-24085	0	-3805996	5027734	Payable	SRRVR1GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2306	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	NTPC,Sim'dri-I	-348112	0	0	4561320	4213208	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2308	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	NLC, II Stage I	-369333	-551484	0	4707938	3787121	Receivable	SRRNL1GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2309	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	NLC, II Stage II	-497348	-257391	0	3195188	2440449	Receivable	SRRNL2GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2310	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	NLC, I Expn	-215681	0	0	1414328	1198647	Receivable	SRRNE1GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2327	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	ACME\nHissar,NPKUNTA	235	0	0	977090	977090	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2328	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	ACME\nBhiwadi,NPKUNTA	563	0	0	2336053	2336053	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2330	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Azure,NPKUNTA	165	0	0	682426	682426	Receivable	SRRAZ1GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2332	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	TATA,NPKUNTA	276	0	0	1149692	1149692	Receivable	SRRTA1GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2323	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Western Region	0	0	0	131858932	131858932	Receivable	wr	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Partial	f	131858932	37
2316	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	MEPL	-76125	0	0	-408951	485076	Payable	MEL	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Partial	f	85076	37
2337	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Ayana, NPKUNTA	-356	0	0	-763739	763739	Payable	SRRAY1GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Notified	f	763739	37
2358	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	GIREL, Tuticorin (Wind)	-385	0	0	-1375688	1375688	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Notified	f	1375688	37
2359	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	MYTRAH, Tuticorin (Wind)	-1486	0	0	-5145603	5145603	Payable	SRRMW1GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2348	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Renew-TN2, PAVAGADA	2	0	0	-14534	14534	Payable	SRRRN1GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2334	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	FRV II,NPKUNTA	94	0	0	364950	364950	Receivable	SRRFR2GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2335	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	SBG BLOCK 23,24,25 and 26, PAVAGADA	580	0	0	1563307	1563307	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2336	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	SBG, NPKUNTA	489	0	0	1067914	1067914	Receivable	SRRSC2GN 	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2338	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	SPRNG, NPKUNTA	262	0	0	497663	497663	Receivable	srsprng	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2339	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Avaada, PAVAGADA	143	0	0	339567	339567	Receivable	SRRAP1GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2340	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Adyah Block 1, PAVAGADA	41	0	0	104788	104788	Receivable	SRRAD6GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2341	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Adyah Block 2, PAVAGADA	54	0	0	142310	142310	Receivable	SRRAD5GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2342	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Adyah Block 13, PAVAGADA	76	0	0	200186	200186	Receivable	ADYAHB13	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2343	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	TATA, PAVAGADA	967	0	0	3402072	3402072	Receivable	SRRTP1GN 	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2344	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	ACME Kurukshetra, PAVAGADA	8	0	0	13502	13502	Receivable	SRRKP1GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2345	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	ACME Rewari, PAVAGADA	47	0	0	199794	199794	Receivable	SRRAR1GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2350	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Adyah Block 10, PAVAGADA	26	0	0	58914	58914	Receivable	SRRAD4GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2351	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Adyah Block 6, PAVAGADA	89	0	0	243120	243120	Receivable	SRRAD3GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2352	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Adyah Block 3, PAVAGADA	72	0	0	196576	196576	Receivable	ADYAHB	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2353	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Fortum Solar, PAVAGADA	188	0	0	493643	493643	Receivable	SRRFS1GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2354	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	KREDL, PAVAGADA	142	0	0	174614	174614	Receivable	SRRKR1GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2355	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Azure Earth, PAVAGADA	180	0	0	504923	504923	Receivable	SRRAE1GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2356	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Avaada Solarise, PAVAGADA	385	0	0	1092594	1092594	Receivable	SRRAS1GN 	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2357	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	SPRNG, NPKUNTA	0	0	0	0	0	Receivable	srsprng	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2294	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Kerala	-5574726	-233354	-3548584	-8903813	18260477	Payable	SRRKL1DS	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2299	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	PUGALUR PGCIL(SR)	-104775	0	0	-330538	435313	Payable	PGPUGALUR	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2361	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Betam, Tuticorin (Wind)	-160	0	0	-356359	356359	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2360	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	ORANGE, Tuticorin (Wind)	-126	0	0	-346240	346240	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2333	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	NTPC,NPKUNTA	-100	0	0	-743633	743633	Payable	SRRNS1GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2305	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	NTPC,Sim'dri-II	-1172525	-15603	0	-2773213	3961341	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2329	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	ACME\nKarnal,NPKUNTA	481	0	0	1998237	1998237	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2346	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Fortum Finsurya, PAVAGADA	29	0	0	79634	79634	Receivable	SRRFP1GN 	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2347	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Parampujya, PAVAGADA	336	0	0	1482875	1482875	Receivable	SRRPP1GN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2349	2020-21	37	2021-01-05	2021-01-05	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-05	2021-01-05	2021-01-04	2021-01-05	2021-01-05	Yarrow, PAVAGADA	192	0	0	883671	883671	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No37/SRPC Filedsm07-13dec20.pdf	Complete	f	0	37
2362	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Western Region(*wrpc)	0	0	0	0	142055964	Payable	wr	null	null	Notified	f	142055964	38
2363	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Eastern Region(*erpc)	0	0	0	0	227474825	Receivable	ER	null	null	Notified	f	227474825	38
2364	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Andhra Pradesh	-1914399	-875659	-884334	1145663	2528729	Payable	SRRAP1DS	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	2528729	38
2365	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Karnataka	-2040419	-1801201	-3070987	28518986	21606379	Receivable	SRRKA1DS	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	21606379	38
2366	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Kerala	-84857	-59268	-2138458	-1669522	3952105	Payable	SRRKL1DS	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	3952105	38
2367	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Tamil Nadu	-2516558	-6697071	-8158639	32222862	14850594	Receivable	SRRTN1DS	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	14850594	38
2368	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Telangana	-3751221	-1395271	-1006349	2288754	3864087	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	3864087	38
2369	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Puducherry	-162969	-487203	-691399	4564328	3222757	Receivable	SRRPO1DS	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	3222757	38
2370	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	PGCIL(SR)	-8352	0	0	1194639	1186287	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	1186287	38
2371	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	PUGALUR PGCIL(SR)	-6904	0	0	-196042	202946	Payable	PGPUGALUR	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	202946	38
2372	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	TRISSUR PGCIL(SR)	-6576	0	0	-156907	163483	Payable	SRRPG2BY	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	163483	38
2373	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Goa(SR)	-45033	0	-1230940	-36341	1312314	Payable	SRRGO1DS	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	1312314	38
2374	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	NTPC,RSTPS	-132640	-587775	0	5024008	4303593	Receivable	SRRRM1GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	4303593	38
2375	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	NTPC,RSTPS-III	-71164	-37538	0	-2391327	2500029	Payable	SRRRM3GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	2500029	38
2376	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	NTPC,Talcher-II	-52558	-6401	0	53993	4966	Payable	SRRTL2GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	4966	38
2377	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	NTPC,Sim'dri-II	-469222	-4496	0	-1716555	2190273	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	2190273	38
2378	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	NTPC,Sim'dri-I	-48559	-83359	0	674889	542971	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	542971	38
2379	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	NTECL	-98340	-22668	0	-3601957	3722965	Payable	SRRVR1GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	3722965	38
2380	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	NLC, II Stage I	-37892	-481907	0	5192508	4672709	Receivable	SRRNL1GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	4672709	38
2381	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	NLC, II Stage II	-81424	-719339	0	5309820	4509057	Receivable	SRRNL2GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	4509057	38
2382	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	NLC, I Expn	-3237	-22108	0	4230333	4204988	Receivable	SRRNE1GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	4204988	38
2383	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	NLC, II Expn	-108955	-30648	0	-1232959	1372562	Payable	SRRNE2GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	1372562	38
2384	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	NTPL	-1255	0	0	292173	290918	Receivable	SRRTU1GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	290918	38
2385	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	NTPC,Kudgi-Stage I	-62904	-28744	0	-2822833	2914481	Payable	SRRKT1GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	2914481	38
2386	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	NNTPP	-502287	-64833	0	-215729	782849	Payable	SRRNN1GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	782849	38
2387	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	SEIL/ TPCIL	-73779	-146289	0	-3959209	4179277	Payable	SRRTP1SL	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	4179277	38
2388	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	MEPL	-12241	0	0	-489233	501474	Payable	MEL	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	501474	38
2389	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	SEL	-3641	0	0	-252634	256275	Payable	SRRSE1SL	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	256275	38
2390	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	LKPPL	0	0	0	0	0	Payable	SRRLK2SL	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	0	38
2391	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	LKPPL III	-3747	0	0	-228064	231811	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	231811	38
2392	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Coastal(CE)	0	0	0	-241076	241076	Payable	SRRCG1SL	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	241076	38
2393	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	IL&FS	-3370	0	0	-198232	201602	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	201602	38
2394	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	SEIL Project 2	-460407	0	0	-1289405	1749812	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	1749812	38
2395	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Western Region	0	0	0	142056504	142056504	Receivable	wr	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	142056504	38
2396	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Eastern Region	0	0	0	-227505145	227505145	Payable	ER	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	227505145	38
2397	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	NNTPP\n(Lignite)	0	0	0	0	0	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	0	38
2398	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	MEPL\n(Imported Coal)	157	0	0	106	106	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	106	38
2399	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	ACME\nHissar,NPKUNTA	-83	0	0	-472151	472151	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	472151	38
2400	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	ACME\nBhiwadi,NPKUNTA	406	0	0	1615884	1615884	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	1615884	38
2401	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	ACME\nKarnal,NPKUNTA	373	0	0	1454487	1454487	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	1454487	38
2402	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Azure,NPKUNTA	38	0	0	127580	127580	Receivable	SRRAZ1GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	127580	38
2403	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	FRV,NPKUNTA	-169	0	0	-834712	834712	Payable	SRRFR1GN 	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	834712	38
2404	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	TATA,NPKUNTA	53	0	0	158167	158167	Receivable	SRRTA1GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	158167	38
2405	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	NTPC,NPKUNTA	-384	0	0	-2400447	2400447	Payable	SRRNS1GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	2400447	38
2406	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	FRV II,NPKUNTA	10	0	0	-2094	2094	Payable	SRRFR2GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	2094	38
2407	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	SBG BLOCK 23,24,25 and 26, PAVAGADA	-30	0	0	-141194	141194	Payable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	141194	38
2408	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	SBG, NPKUNTA	92	0	0	168402	168402	Receivable	SRRSC2GN 	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	168402	38
2409	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Ayana, NPKUNTA	-435	0	0	-925968	925968	Payable	SRRAY1GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	925968	38
2410	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	SPRNG, NPKUNTA	149	0	0	279299	279299	Receivable	srsprng	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	279299	38
2411	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Avaada, PAVAGADA	-46	0	0	-206457	206457	Payable	SRRAP1GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	206457	38
2412	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Adyah Block 1, PAVAGADA	93	0	0	259748	259748	Receivable	SRRAD6GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	259748	38
2413	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Adyah Block 2, PAVAGADA	88	0	0	239890	239890	Receivable	SRRAD5GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	239890	38
2414	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Adyah Block 13, PAVAGADA	48	0	0	123981	123981	Receivable	ADYAHB13	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	123981	38
2415	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	TATA, PAVAGADA	-259	0	0	-1127999	1127999	Payable	SRRTP1GN 	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	1127999	38
2416	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	ACME Kurukshetra, PAVAGADA	-59	0	0	-309364	309364	Payable	SRRKP1GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	309364	38
2417	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	ACME Rewari, PAVAGADA	-28	0	0	-163446	163446	Payable	SRRAR1GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	163446	38
2418	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Fortum Finsurya, PAVAGADA	-129	0	0	-680991	680991	Payable	SRRFP1GN 	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	680991	38
2419	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Parampujya, PAVAGADA	208	0	0	886579	886579	Receivable	SRRPP1GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	886579	38
2420	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Renew-TN2, PAVAGADA	-77	0	0	-394148	394148	Payable	SRRRN1GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	394148	38
2421	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Yarrow, PAVAGADA	34	0	0	114962	114962	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	114962	38
2422	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Adyah Block 10, PAVAGADA	29	0	0	67484	67484	Receivable	SRRAD4GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	67484	38
2423	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Adyah Block 6, PAVAGADA	76	0	0	205408	205408	Receivable	SRRAD3GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	205408	38
2424	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Adyah Block 3, PAVAGADA	92	0	0	251103	251103	Receivable	ADYAHB	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	251103	38
2425	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Fortum Solar, PAVAGADA	130	0	0	329395	329395	Receivable	SRRFS1GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	329395	38
2426	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	KREDL, PAVAGADA	58	0	0	65536	65536	Receivable	SRRKR1GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	65536	38
2427	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Azure Earth, PAVAGADA	64	0	0	162854	162854	Receivable	SRRAE1GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	162854	38
2428	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Avaada Solarise, PAVAGADA	55	0	0	123581	123581	Receivable	SRRAS1GN 	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	123581	38
2429	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	GIREL, Tuticorin (Wind)	2047	0	0	6475481	6475481	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	6475481	38
2430	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	MYTRAH, Tuticorin (Wind)	535	0	0	1613305	1613305	Receivable	SRRMW1GN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	1613305	38
2431	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	ORANGE, Tuticorin (Wind)	2311	0	0	5651005	5651005	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	5651005	38
2432	2020-21	38	2021-01-11	2021-01-11	Revision 0	 SRPC/SE-1/4(Dev)/2020/ 	2021-01-11	2021-01-11	2021-01-11	2021-01-11	2021-01-11	Betam, Tuticorin (Wind)	1149	0	0	2212667	2212667	Receivable	SRADMIN	null	/static/images/SRPC/2020-21/Week_No38/SRPC Filedsm14-20dec20.pdf	Notified	f	2212667	38
\.


--
-- Data for Name: WeeklyUpload_dsmduepool; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WeeklyUpload_dsmduepool" (id, year, dueinpool, actual_weekno, considered_weekno, transdate, from_year, to_year) FROM stdin;
1	2020-21	98430322	35	35	2020-12-22 19:35:15.723336+05:30	2020	2021
2	2020-21	16426846	34	35	2020-12-22 12:35:15.723336+05:30	2020	2021
3	2020-21	0	33	34	2020-12-22 15:35:15.723336+05:30	2020	2021
1224	2020-21	-16563460	35	35	2020-12-23 15:00:00.287476+05:30	2020	2021
1225	2020-21	-14331910	35	35	2020-12-23 15:00:00.29346+05:30	2020	2021
1226	2020-21	-16592383	35	35	2020-12-23 15:00:00.297449+05:30	2020	2021
1227	2020-21	-5164134	35	35	2020-12-23 15:00:00.300441+05:30	2020	2021
1228	2020-21	-1126234	35	35	2020-12-23 15:00:00.30443+05:30	2020	2021
1229	2020-21	-4635739	35	35	2020-12-23 15:00:00.307422+05:30	2020	2021
1230	2020-21	-1876161	35	35	2020-12-23 15:00:00.311412+05:30	2020	2021
1231	2020-21	-1231424	35	35	2020-12-23 15:00:00.314404+05:30	2020	2021
1232	2020-21	-4391095	35	35	2020-12-23 15:00:00.317396+05:30	2020	2021
1233	2020-21	-4123324	35	35	2020-12-23 15:00:00.321384+05:30	2020	2021
1234	2020-21	-2774818	35	35	2020-12-23 15:00:00.326371+05:30	2020	2021
1235	2020-21	-1216474	35	35	2020-12-23 15:00:00.330362+05:30	2020	2021
1236	2020-21	-81785	35	35	2020-12-23 15:00:00.333354+05:30	2020	2021
1237	2020-21	0	35	35	2020-12-23 15:00:00.336345+05:30	2020	2021
1238	2020-21	-2722	35	35	2020-12-23 15:00:00.339337+05:30	2020	2021
1239	2020-21	7058122	36	36	2020-12-29 11:28:05.821701+05:30	2020	2021
1240	2020-21	96612	36	36	2020-12-29 11:28:05.832672+05:30	2020	2021
1241	2020-21	223887	36	36	2020-12-29 11:28:05.839653+05:30	2020	2021
1242	2020-21	335536	36	36	2020-12-29 11:28:05.846634+05:30	2020	2021
1243	2020-21	198585	36	36	2020-12-29 11:28:05.852618+05:30	2020	2021
1244	2020-21	1944753	36	36	2020-12-29 11:28:05.857605+05:30	2020	2021
1245	2020-21	981702	36	36	2020-12-29 11:28:05.864586+05:30	2020	2021
1246	2020-21	5615918	36	36	2020-12-29 11:28:05.87057+05:30	2020	2021
1247	2020-21	2311036	36	36	2020-12-29 11:28:05.876555+05:30	2020	2021
1248	2020-21	296196	36	36	2020-12-29 11:28:05.882539+05:30	2020	2021
1249	2020-21	6417786	36	36	2020-12-29 11:28:05.887525+05:30	2020	2021
1250	2020-21	471665	36	36	2020-12-29 11:28:05.893509+05:30	2020	2021
1251	2020-21	10070930	36	36	2020-12-29 11:28:05.899572+05:30	2020	2021
1252	2020-21	1220132	36	36	2020-12-29 11:28:05.905556+05:30	2020	2021
1253	2020-21	1769144	36	36	2020-12-29 11:28:05.91154+05:30	2020	2021
1254	2020-21	4135763	36	36	2020-12-29 11:28:05.917524+05:30	2020	2021
1255	2020-21	1435810	36	36	2020-12-29 11:28:05.922511+05:30	2020	2021
1256	2020-21	1354865	36	36	2020-12-29 11:28:05.929492+05:30	2020	2021
1257	2020-21	733914	36	36	2020-12-29 11:28:05.934479+05:30	2020	2021
1258	2020-21	843339	36	36	2020-12-29 11:28:05.940462+05:30	2020	2021
1259	2020-21	152441	36	36	2020-12-29 11:28:05.946446+05:30	2020	2021
1260	2020-21	770807	36	36	2020-12-29 11:28:05.952433+05:30	2020	2021
1261	2020-21	1578187	36	36	2020-12-29 11:28:05.957417+05:30	2020	2021
1262	2020-21	566368	36	36	2020-12-29 11:28:05.963402+05:30	2020	2021
1263	2020-21	1168948	36	36	2020-12-29 11:28:05.969385+05:30	2020	2021
1264	2020-21	119029	36	36	2020-12-29 11:28:05.975371+05:30	2020	2021
1265	2020-21	57146	36	36	2020-12-29 11:28:05.981353+05:30	2020	2021
1266	2020-21	165428	36	36	2020-12-29 11:28:05.987338+05:30	2020	2021
1267	2020-21	56961	36	36	2020-12-29 11:28:05.992324+05:30	2020	2021
1268	2020-21	507853	36	36	2020-12-29 11:28:05.999306+05:30	2020	2021
1269	2020-21	665448	36	36	2020-12-29 11:28:06.004291+05:30	2020	2021
1270	2020-21	8623817	36	36	2020-12-29 11:28:06.010276+05:30	2020	2021
1271	2020-21	253987	36	36	2020-12-29 11:28:06.01626+05:30	2020	2021
1272	2020-21	550804	36	36	2020-12-29 11:28:06.022246+05:30	2020	2021
1273	2020-21	1167699	36	36	2020-12-29 11:28:06.028228+05:30	2020	2021
1274	2020-21	140791	36	36	2020-12-29 11:28:06.036206+05:30	2020	2021
1275	2020-21	1903560	36	36	2020-12-29 11:28:06.042191+05:30	2020	2021
1276	2020-21	959763	36	36	2020-12-29 11:28:06.051167+05:30	2020	2021
1277	2020-21	6509460	36	36	2020-12-29 11:28:06.056153+05:30	2020	2021
1278	2020-21	94144	36	36	2020-12-29 11:28:06.064132+05:30	2020	2021
1279	2020-21	3395	34	36	2020-12-29 11:39:11.981791+05:30	2020	2021
1280	2020-21	2024	35	36	2020-12-29 11:39:56.046749+05:30	2020	2021
1281	2020-21	235182	34	36	2020-12-29 11:42:56.942115+05:30	2020	2021
1282	2020-21	228114	35	36	2020-12-29 11:43:54.550539+05:30	2020	2021
1283	2020-21	3080	MISC	36	2020-12-29 11:50:29.684525+05:30	2020	2021
1284	2020-21	561	MISC	36	2020-12-29 11:50:45.610029+05:30	2020	2021
1285	2020-21	523351	MISC	36	2020-12-29 12:04:44.244565+05:30	2020	2021
1286	2020-21	280073	MISC	36	2020-12-29 12:05:05.249895+05:30	2020	2021
1287	2020-21	595618	MISC	36	2020-12-29 12:05:35.026293+05:30	2020	2021
1288	2020-21	355	MISC	36	2020-12-29 12:06:04.802475+05:30	2020	2021
1289	2020-21	641	MISC	36	2020-12-29 12:06:52.282128+05:30	2020	2021
1290	2020-21	606087	MISC	36	2020-12-29 12:07:50.393129+05:30	2020	2021
1291	2020-21	556241	MISC	36	2020-12-29 12:08:11.001621+05:30	2020	2021
1292	2020-21	756819	MISC	36	2020-12-29 12:08:26.531173+05:30	2020	2021
1293	2020-21	511126	MISC	36	2020-12-29 12:08:44.282038+05:30	2020	2021
1294	2020-21	2840931	MISC	36	2020-12-29 12:09:09.13767+05:30	2020	2021
1295	2020-21	4401	MISC	36	2020-12-29 12:09:57.706192+05:30	2020	2021
1296	2020-21	6054	MISC	36	2020-12-29 12:10:27.282066+05:30	2020	2021
1297	2020-21	702777	MISC	36	2020-12-29 12:12:00.314915+05:30	2020	2021
1298	2020-21	137700	35	36	2020-12-29 12:15:37.958125+05:30	2020	2021
1299	2020-21	-40745505	35	35	2020-12-20 12:15:37.958125+05:30	2020	2021
1303	2020-21	-99079	36	36	2020-12-29 16:44:22.480204+05:30	2020	2021
1304	2020-21	-1190537	36	36	2020-12-29 16:44:22.485181+05:30	2020	2021
1305	2020-21	-17545239	36	36	2020-12-29 16:44:22.489191+05:30	2020	2021
1306	2020-21	-3131745	36	36	2020-12-29 16:44:22.493158+05:30	2020	2021
1307	2020-21	-1178863	36	36	2020-12-29 16:44:22.496152+05:30	2020	2021
1308	2020-21	-4416205	36	36	2020-12-29 16:44:22.50014+05:30	2020	2021
1309	2020-21	-2763488	36	36	2020-12-29 16:44:22.503133+05:30	2020	2021
1310	2020-21	-3339218	36	36	2020-12-29 16:44:22.507122+05:30	2020	2021
1311	2020-21	-396768	36	36	2020-12-29 16:44:22.510114+05:30	2020	2021
1312	2020-21	-2436829	36	36	2020-12-29 16:44:22.514103+05:30	2020	2021
1313	2020-21	-140602	36	36	2020-12-29 16:44:22.518092+05:30	2020	2021
1314	2020-21	0	36	36	2020-12-29 16:44:22.522145+05:30	2020	2021
1315	2020-21	-308876	36	36	2020-12-29 16:44:22.522145+05:30	2020	2021
1316	2020-21	-77128	36	36	2020-12-29 16:44:22.522145+05:30	2020	2021
1317	2020-21	-14278	36	36	2020-12-29 16:44:22.522145+05:30	2020	2021
1318	2020-21	-912258	36	36	2020-12-29 16:44:22.522145+05:30	2020	2021
1319	2020-21	-203051	36	36	2020-12-29 16:44:22.537767+05:30	2020	2021
1320	2020-21	-43368702	32	32	2020-12-29 17:08:11.857279+05:30	2020	2021
1321	2020-21	18260477	37	37	2021-01-05 10:25:51.120266+05:30	2020	2021
1322	2020-21	259230	37	37	2021-01-05 10:40:36.416039+05:30	2020	2021
1323	2020-21	435313	37	37	2021-01-05 10:40:36.423021+05:30	2020	2021
1324	2020-21	14534	37	37	2021-01-05 10:40:36.429005+05:30	2020	2021
1325	2020-21	356359	37	37	2021-01-05 10:40:36.434989+05:30	2020	2021
1326	2020-21	50242	37	37	2021-01-05 10:40:36.439975+05:30	2020	2021
1327	2020-21	346240	37	37	2021-01-05 10:40:36.44596+05:30	2020	2021
1328	2020-21	5145603	37	37	2021-01-05 10:40:36.451943+05:30	2020	2021
1329	2020-21	743633	37	37	2021-01-05 10:40:36.456932+05:30	2020	2021
1330	2020-21	5583493	37	37	2021-01-05 10:40:36.462914+05:30	2020	2021
1331	2020-21	4977761	37	37	2021-01-05 10:40:36.468898+05:30	2020	2021
1332	2020-21	74714	37	37	2021-01-05 10:40:36.473885+05:30	2020	2021
1333	2020-21	600233	37	37	2021-01-05 10:40:36.479869+05:30	2020	2021
1334	2020-21	2494004	37	37	2021-01-05 10:40:36.485853+05:30	2020	2021
1335	2020-21	10278026	37	37	2021-01-05 10:40:36.490839+05:30	2020	2021
1336	2020-21	5757274	37	37	2021-01-05 10:40:36.497821+05:30	2020	2021
1337	2020-21	1460180	37	37	2021-01-05 10:40:36.502808+05:30	2020	2021
1338	2020-21	3961341	37	37	2021-01-05 10:40:36.508792+05:30	2020	2021
1339	2020-21	2920913	37	37	2021-01-05 10:40:36.514775+05:30	2020	2021
1340	2020-21	1249860	37	37	2021-01-05 10:40:36.520759+05:30	2020	2021
1341	2020-21	51706563	37	37	2021-01-05 10:40:36.525746+05:30	2020	2021
1342	2020-21	433059	36	37	2021-01-05 10:44:14.788585+05:30	2020	2021
1343	2020-21	585654	36	37	2021-01-05 10:44:14.795569+05:30	2020	2021
1344	2020-21	1014476	36	37	2021-01-05 10:44:14.801551+05:30	2020	2021
1345	2020-21	1388403	36	37	2021-01-05 10:44:14.807535+05:30	2020	2021
1346	2020-21	1605332	36	37	2021-01-05 10:44:14.813519+05:30	2020	2021
1347	2020-21	5686044	36	37	2021-01-05 10:44:14.818506+05:30	2020	2021
1348	2020-21	212385	27	37	2021-01-05 10:45:26.079952+05:30	2020	2021
1349	2020-21	1530	MISC	37	2021-01-05 10:46:28.256045+05:30	2020	2021
1350	2020-21	322	MISC	37	2021-01-05 10:46:41.072502+05:30	2020	2021
1351	2020-21	485	MISC	37	2021-01-05 10:47:33.88618+05:30	2020	2021
1352	2020-21	3678	MISC	37	2021-01-05 10:47:52.734361+05:30	2020	2021
1353	2020-21	1979	MISC	37	2021-01-05 10:48:51.622216+05:30	2020	2021
1354	2020-21	5027734	37	37	2021-01-05 10:50:58.336651+05:30	2020	2021
1355	2020-21	-1295854	37	37	2021-01-05 11:04:49.978346+05:30	2020	2021
1356	2020-21	-11797460	37	37	2021-01-05 11:04:49.982335+05:30	2020	2021
1357	2020-21	-5091344	37	37	2021-01-05 11:04:49.985371+05:30	2020	2021
1358	2020-21	-1095101	37	37	2021-01-05 11:04:49.990357+05:30	2020	2021
1359	2020-21	-2900734	37	37	2021-01-05 11:04:49.993349+05:30	2020	2021
1360	2020-21	-4213208	37	37	2021-01-05 11:04:49.996341+05:30	2020	2021
1361	2020-21	-3787121	37	37	2021-01-05 11:04:49.999332+05:30	2020	2021
1362	2020-21	-2440449	37	37	2021-01-05 11:04:50.002324+05:30	2020	2021
1363	2020-21	-1198647	37	37	2021-01-05 11:04:50.006315+05:30	2020	2021
1364	2020-21	-977090	37	37	2021-01-05 11:04:50.010343+05:30	2020	2021
1365	2020-21	-2336053	37	37	2021-01-05 11:04:50.013331+05:30	2020	2021
1366	2020-21	-1998237	37	37	2021-01-05 11:04:50.016323+05:30	2020	2021
1367	2020-21	-682426	37	37	2021-01-05 11:04:50.019315+05:30	2020	2021
1368	2020-21	-1149692	37	37	2021-01-05 11:04:50.023305+05:30	2020	2021
1369	2020-21	-364950	37	37	2021-01-05 11:04:50.027293+05:30	2020	2021
1370	2020-21	-1563307	37	37	2021-01-05 11:04:50.029288+05:30	2020	2021
1371	2020-21	-1067914	37	37	2021-01-05 11:04:50.03228+05:30	2020	2021
1372	2020-21	-497663	37	37	2021-01-05 11:04:50.035273+05:30	2020	2021
1373	2020-21	-339567	37	37	2021-01-05 11:04:50.040259+05:30	2020	2021
1374	2020-21	-104788	37	37	2021-01-05 11:04:50.044248+05:30	2020	2021
1375	2020-21	-142310	37	37	2021-01-05 11:04:50.047259+05:30	2020	2021
1376	2020-21	-200186	37	37	2021-01-05 11:04:50.050232+05:30	2020	2021
1377	2020-21	-3402072	37	37	2021-01-05 11:04:50.054223+05:30	2020	2021
1378	2020-21	-13502	37	37	2021-01-05 11:04:50.059234+05:30	2020	2021
1379	2020-21	-199794	37	37	2021-01-05 11:04:50.0622+05:30	2020	2021
1380	2020-21	-79634	37	37	2021-01-05 11:04:50.06619+05:30	2020	2021
1381	2020-21	-1482875	37	37	2021-01-05 11:04:50.069181+05:30	2020	2021
1382	2020-21	-883671	37	37	2021-01-05 11:04:50.074171+05:30	2020	2021
1383	2020-21	-58914	37	37	2021-01-05 11:04:50.078158+05:30	2020	2021
1384	2020-21	-243120	37	37	2021-01-05 11:04:50.08117+05:30	2020	2021
1385	2020-21	-196576	37	37	2021-01-05 11:04:50.084165+05:30	2020	2021
1386	2020-21	-493643	37	37	2021-01-05 11:04:50.087157+05:30	2020	2021
1387	2020-21	-174614	37	37	2021-01-05 11:04:50.091148+05:30	2020	2021
1388	2020-21	-504923	37	37	2021-01-05 11:04:50.094139+05:30	2020	2021
1389	2020-21	-1092594	37	37	2021-01-05 11:04:50.09713+05:30	2020	2021
1390	2020-21	0	37	37	2021-01-05 11:04:50.100122+05:30	2020	2021
1391	2020-21	0	37	37	2021-01-05 11:04:50.103131+05:30	2020	2021
1392	2020-21	-75443180	32	32	2021-01-05 11:07:15.712415+05:30	2020	2021
1393	2020-21	-3123861	33	33	2021-01-05 11:08:22.636784+05:30	2020	2021
\.


--
-- Data for Name: WeeklyUpload_finalpaydisburse1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WeeklyUpload_finalpaydisburse1" (id, year, weekno, pay_constituent, devfinal, paymentdate, amountpaid, outstanding, registration_id_id) FROM stdin;
535	2020-21	31	ORANGE, Tuticorin (Wind)	2513006	2020-12-07	2513006	0	1853
536	2020-21	31	NTPC,Sim'dri-II	1493498	2020-12-07	1493498	0	1800
537	2020-21	31	NTPC,Sim'dri-I	635211	2020-12-07	635211	0	1801
538	2020-21	31	NTPC,NPKUNTA	1857306	2020-12-07	1857306	0	1828
539	2020-21	31	NTPC,Talcher-II	2590932	2020-12-07	2590932	0	1799
540	2020-21	31	NLC, II Expn	4127778	2020-12-07	4127778	0	1806
541	2020-21	31	TRISSUR PGCIL(SR)	15114	2020-12-07	15114	0	1795
542	2020-21	31	NTECL	7130051	2020-12-07	7130051	0	1802
543	2020-21	31	Adyah Block 3, PAVAGADA	79689	2020-12-07	79689	0	1845
544	2020-21	31	Betam, Tuticorin (Wind)	1971724	2020-12-07	1971724	0	1854
545	2020-21	31	MYTRAH, Tuticorin (Wind)	8025939	2020-12-07	8025939	0	1852
546	2020-21	31	SBG, NPKUNTA	968501	2020-12-07	968501	0	1831
547	2020-21	31	Renew-TN2, PAVAGADA	28406	2020-12-07	28406	0	1841
548	2020-21	31	NNTPP	7013272	2020-12-07	7013272	0	1809
550	2020-21	31	NTPC,Kudgi-Stage I	2437990	2020-12-07	2437990	0	1808
551	2020-21	31	PUGALUR PGCIL(SR)	610515	2020-12-07	610515	0	1794
552	2020-21	31	NNTPP\n(Lignite)	4222830	2020-12-07	4222830	0	1820
553	2020-21	31	Tamil Nadu	25525319	2020-12-07	25525319	0	1790
555	2020-21	31	LKPPL	243298	2020-12-07	243298	0	1813
556	2020-21	31	Avaada Solarise, PAVAGADA	40964	2020-12-07	40964	0	1849
557	2020-21	31	NTPC,RSTPS-III	2260115	2020-12-07	2260115	0	1798
558	2020-21	31	SEIL/ TPCIL	2932350	2020-12-07	2932350	0	1810
559	2020-21	31	SBG BLOCK 23,24,25 and 26, PAVAGADA	880638	2020-12-07	880638	0	1830
560	2020-21	31	Avaada, PAVAGADA	379232	2020-12-07	379232	0	1832
561	2020-21	31	Fortum Finsurya, PAVAGADA	605869	2020-12-07	605869	0	1839
562	2020-21	31	GIREL, Tuticorin (Wind)	6071356	2020-12-07	6071356	0	1851
563	2020-21	31	MEPL	389870	2020-12-07	0	389870	1811
564	2020-21	31	LKPPL III	0	2020-12-07	0	0	1814
565	2020-21	31	Coastal(CE)	1006867	2020-12-07	0	1006867	1815
566	2020-21	31	MEPL\n(Imported Coal)	0	2020-12-07	0	0	1821
569	2020-21	31	ACME\nKarnal,NPKUNTA	159096	2020-12-07	0	159096	1824
570	2020-21	31	KREDL, PAVAGADA	8019	2020-12-07	0	8019	1847
571	2020-21	31	Ayana, NPKUNTA	0	2020-12-07	0	0	1850
572	2020-21	31	Betam, Tuticorin (Wind: 50 MW)	0	2020-12-07	0	0	1855
574	2020-21	32	ACME Kurukshetra, PAVAGADA	421111	2020-12-07	421111	0	1909
575	2020-21	32	Goa(SR)	970263	2020-12-07	970263	0	1867
576	2020-21	32	NTPL	385777	2020-12-07	385777	0	1878
577	2020-21	32	TATA, PAVAGADA	1990823	2020-12-07	1990823	0	1908
578	2020-21	32	FRV II,NPKUNTA	65798	2020-12-07	65798	0	1900
579	2020-21	32	NLC, II Expn	2905698	2020-12-07	2905698	0	1877
580	2020-21	32	SBG BLOCK 23,24,25 and 26, PAVAGADA	285608	2020-12-07	285608	0	1901
581	2020-21	32	GIREL, Tuticorin (Wind)	3091132	2020-12-07	3091132	0	1923
582	2020-21	32	Ayana, NPKUNTA	523092	2020-12-07	523092	0	1903
583	2020-21	32	SBG, NPKUNTA	923330	2020-12-07	923330	0	1902
584	2020-21	32	NTPC,RSTPS-III	2054844	2020-12-07	2054844	0	1869
585	2020-21	32	Tamil Nadu	29606311	2020-12-07	29606311	0	1861
586	2020-21	32	NTPC,RSTPS	5987581	2020-12-07	5987581	0	1868
587	2020-21	32	NTECL	4609004	2020-12-07	4609004	0	1873
588	2020-21	32	NTPC,NPKUNTA	2591663	2020-12-07	2591663	0	1899
589	2020-21	32	SEIL Project 2	6793573	2020-12-07	6793573	0	1888
590	2020-21	32	ACME Rewari, PAVAGADA	226958	2020-12-07	226958	0	1910
591	2020-21	32	PUGALUR PGCIL(SR)	562420	2020-12-07	562420	0	1865
592	2020-21	32	Renew-TN2, PAVAGADA	32274	2020-12-07	32274	0	1913
593	2020-21	32	NTPC,Talcher-II	7309019	2020-12-07	7309019	0	1870
594	2020-21	32	IL&FS	664595	2020-12-07	664595	0	1887
595	2020-21	32	NTPC,Kudgi-Stage I	2865867	2020-12-07	2865867	0	1879
596	2020-21	32	SEIL/ TPCIL	6423768	2020-12-07	6423768	0	1881
597	2020-21	32	Adyah Block 3, PAVAGADA	254959	2020-12-07	254959	0	1917
598	2020-21	32	TATA,NPKUNTA	237031	2020-12-07	237031	0	1898
599	2020-21	32	TRISSUR PGCIL(SR)	132816	2020-12-07	132816	0	1866
600	2020-21	32	NTPC,Sim'dri-I	182633	2020-12-07	182633	0	1872
601	2020-21	32	MYTRAH, Tuticorin (Wind)	5151217	2020-12-07	5151217	0	1924
602	2020-21	32	ORANGE, Tuticorin (Wind)	1426393	2020-12-07	1426393	0	1925
603	2020-21	32	NTPC,Sim'dri-II	2397928	2020-12-07	2397928	0	1871
604	2020-21	32	Betam, Tuticorin (Wind)	1027783	2020-12-07	1027783	0	1926
605	2020-21	32	Ayana, NPKUNTA	0	2020-12-07	0	0	1922
606	2020-21	32	FRV,NPKUNTA	1679111	2020-12-07	1679111	0	1897
607	2020-21	32	MEPL	384037	2020-12-07	0	384037	1882
608	2020-21	32	SEL	248547	2020-12-07	0	248547	1883
609	2020-21	32	LKPPL	255638	2020-12-07	0	255638	1884
610	2020-21	32	LKPPL III	0	2020-12-07	0	0	1885
611	2020-21	32	Coastal(CE)	5822359	2020-12-07	0	5822359	1886
612	2020-21	32	NNTPP\n(Lignite)	0	2020-12-07	0	0	1891
613	2020-21	32	MEPL\n(Imported Coal)	0	2020-12-07	0	0	1892
614	2020-21	32	ACME\nHissar,NPKUNTA	24518	2020-12-07	0	24518	1893
617	2020-21	32	Avaada, PAVAGADA	493344	2020-12-07	0	493344	1904
618	2020-21	32	Fortum Finsurya, PAVAGADA	538264	2020-12-07	0	538264	1911
619	2020-21	32	KREDL, PAVAGADA	109660	2020-12-07	0	109660	1919
620	2020-21	32	Avaada Solarise, PAVAGADA	511612	2020-12-07	0	511612	1921
621	2020-21	32	Western Region(*wrpc)	294722555	2020-12-07	250000000	0	1856
622	2020-21	32	Western Region(*wrpc)	294722555	2020-12-07	44722555	250000000	1856
623	2020-21	31	Western Region(*wrpc)	6838794	2020-12-07	6838794	0	1785
624	2020-21	31	FRV,NPKUNTA	1639868	2020-12-07	1639868	0	1826
625	2020-21	31	SEL	219353	2020-12-07	219353	0	1812
626	2020-21	33	NTPC,NPKUNTA	5263694	2020-12-09	5263694	0	1970
627	2020-21	33	TATA,NPKUNTA	353855	2020-12-09	353855	0	1969
628	2020-21	33	NTECL	7699056	2020-12-09	7699056	0	1944
629	2020-21	33	Betam, Tuticorin (Wind)	64707	2020-12-09	64707	0	1997
630	2020-21	33	SBG BLOCK 23,24,25 and 26, PAVAGADA	383057	2020-12-09	383057	0	1972
631	2020-21	33	NNTPP	82513	2020-12-09	82513	0	1951
632	2020-21	33	Renew-TN2, PAVAGADA	251197	2020-12-09	251197	0	1984
633	2020-21	33	Adyah Block 13, PAVAGADA	121290	2020-12-09	121290	0	1978
634	2020-21	33	TATA, PAVAGADA	351553	2020-12-09	351553	0	1979
635	2020-21	33	Goa(SR)	3274482	2020-12-09	3274482	0	1938
636	2020-21	33	Adyah Block 1, PAVAGADA	172568	2020-12-09	172568	0	1976
637	2020-21	33	MYTRAH, Tuticorin (Wind)	1822589	2020-12-09	1822589	0	1995
638	2020-21	33	Adyah Block 6, PAVAGADA	83566	2020-12-09	83566	0	1987
639	2020-21	33	Ayana, NPKUNTA	170171	2020-12-09	170171	0	1974
640	2020-21	33	Adyah Block 10, PAVAGADA	140759	2020-12-09	140759	0	1986
641	2020-21	33	PUGALUR PGCIL(SR)	305004	2020-12-09	305004	0	1936
642	2020-21	33	LKPPL	50935	2020-12-09	50935	0	1955
643	2020-21	33	Parampujya, PAVAGADA	509248	2020-12-09	509248	0	1983
644	2020-21	33	NTPL	212136	2020-12-09	212136	0	1949
645	2020-21	33	Fortum Solar, PAVAGADA	404312	2020-12-09	404312	0	1989
646	2020-21	33	Adyah Block 3, PAVAGADA	313541	2020-12-09	313541	0	1988
647	2020-21	33	Azure Earth, PAVAGADA	294769	2020-12-09	294769	0	1991
648	2020-21	33	LKPPL III	171309	2020-12-09	171309	0	1956
649	2020-21	33	TRISSUR PGCIL(SR)	148815	2020-12-09	148815	0	1937
650	2020-21	33	NTPC,RSTPS-III	544618	2020-12-09	544618	0	1940
651	2020-21	33	SEIL/ TPCIL	7350539	2020-12-09	7350539	0	1952
652	2020-21	33	SEIL Project 2	925724	2020-12-09	925724	0	1959
653	2020-21	33	NTPC,Kudgi-Stage I	2618171	2020-12-09	2618171	0	1950
654	2020-21	33	NLC, II Expn	2648810	2020-12-09	2648810	0	1948
655	2020-21	33	IL&FS	1181835	2020-12-09	1181835	0	1958
656	2020-21	33	SBG, NPKUNTA	939514	2020-12-09	939514	0	1973
657	2020-21	33	Fortum Finsurya, PAVAGADA	337340	2020-12-09	337340	0	1982
658	2020-21	33	Avaada, PAVAGADA	117917	2020-12-09	117917	0	1975
659	2020-21	33	MEPL	391230	2020-12-09	0	391230	1953
660	2020-21	33	SEL	215137	2020-12-09	0	215137	1954
661	2020-21	33	Coastal(CE)	1733979	2020-12-09	0	1733979	1957
662	2020-21	33	NNTPP\n(Lignite)	0	2020-12-09	0	0	1962
667	2020-21	33	FRV,NPKUNTA	1094137	2020-12-09	0	1094137	1968
668	2020-21	33	FRV II,NPKUNTA	169611	2020-12-09	0	169611	1971
669	2020-21	33	ACME Kurukshetra, PAVAGADA	366613	2020-12-09	0	366613	1980
671	2020-21	33	KREDL, PAVAGADA	105181	2020-12-09	0	105181	1990
672	2020-21	33	Betam, Tuticorin	3919	2020-12-09	0	3919	1998
673	2020-21	33	Ayana, NPKUNTA	0	2020-12-09	0	0	1993
674	2020-21	33	Western Region(*wrpc)	252236977	2020-12-09	252236977	0	1927
675	2020-21	32	Fortum Finsurya, PAVAGADA	538264	2020-12-09	538264	0	1911
676	2020-21	32	LKPPL	255638	2020-12-09	255638	0	1884
741	2020-21	34	Tamil Nadu	3126194	2020-12-16	3126194	0	2078
742	2020-21	34	PUGALUR PGCIL(SR)	332786	2020-12-16	332786	0	2082
743	2020-21	34	TRISSUR PGCIL(SR)	223026	2020-12-16	223026	0	2083
744	2020-21	34	Goa(SR)	3007670	2020-12-16	3007670	0	2084
745	2020-21	34	NTPC,RSTPS-III	907476	2020-12-16	907476	0	2086
746	2020-21	34	NTPC,Talcher-II	360614	2020-12-16	360614	0	2087
747	2020-21	34	NTPC,Sim'dri-II	660612	2020-12-16	660612	0	2088
748	2020-21	34	NTPC,Sim'dri-I	276132	2020-12-16	276132	0	2089
749	2020-21	34	NLC, II Expn	2244674	2020-12-16	2244674	0	2094
750	2020-21	34	NTPL	70906	2020-12-16	70906	0	2095
751	2020-21	34	NTPC,Kudgi-Stage I	2762272	2020-12-16	2762272	0	2096
752	2020-21	34	SEIL/ TPCIL	6684068	2020-12-16	6684068	0	2098
753	2020-21	34	SEIL Project 2	5527002	2020-12-16	5527002	0	2105
754	2020-21	34	NTPC,NPKUNTA	651961	2020-12-16	651961	0	2116
755	2020-21	34	Ayana, NPKUNTA	924930	2020-12-16	924930	0	2120
756	2020-21	34	Adyah Block 1, PAVAGADA	417	2020-12-16	417	0	2122
757	2020-21	34	GIREL, Tuticorin (Wind)	1916075	2020-12-16	1916075	0	2140
758	2020-21	34	MYTRAH, Tuticorin (Wind)	4347528	2020-12-16	4347528	0	2141
759	2020-21	34	ORANGE, Tuticorin (Wind)	239141	2020-12-16	239141	0	2142
760	2020-21	34	NTECL	7014714	2020-12-16	0	7014714	2090
761	2020-21	34	MEPL	404678	2020-12-16	0	404678	2099
762	2020-21	34	SEL	235182	2020-12-16	0	235182	2100
763	2020-21	34	LKPPL	0	2020-12-16	0	0	2101
764	2020-21	34	LKPPL III	242024	2020-12-16	0	242024	2102
765	2020-21	34	Coastal(CE)	13217566	2020-12-16	0	13217566	2103
766	2020-21	34	NNTPP\n(Lignite)	0	2020-12-16	0	0	2108
767	2020-21	34	MEPL\n(Imported Coal)	0	2020-12-16	0	0	2109
768	2020-21	34	FRV,NPKUNTA	1302876	2020-12-16	0	1302876	2114
769	2020-21	34	SPRNG, NPKUNTA	3395	2020-12-16	0	3395	2139
770	2020-21	34	Betam, Tuticorin	1174	2020-12-16	0	1174	2144
771	2020-21	34	Western Region(*wrpc)	170609703	2020-12-16	170609703	0	2073
772	2020-21	31	ACME\nKarnal,NPKUNTA	159096	2020-12-16	159096	0	1824
773	2020-21	32	ACME\nHissar,NPKUNTA	24518	2020-12-16	24518	0	1893
774	2020-21	32	ACME\nBhiwadi,NPKUNTA	318925	2020-12-16	318925	0	1894
775	2020-21	32	ACME\nKarnal,NPKUNTA	121125	2020-12-16	121125	0	1895
776	2020-21	31	ACME\nBhiwadi,NPKUNTA	52171	2020-12-16	52171	0	1823
777	2020-21	31	ACME\nHissar,NPKUNTA	60753	2020-12-16	60753	0	1822
778	2020-21	33	ACME\nHissar,NPKUNTA	160872	2020-12-16	160872	0	1964
779	2020-21	33	Azure,NPKUNTA	95783	2020-12-16	95783	0	1967
780	2020-21	33	ACME\nKarnal,NPKUNTA	110002	2020-12-16	110002	0	1966
781	2020-21	33	ACME Rewari, PAVAGADA	131058	2020-12-16	131058	0	1981
782	2020-21	33	ACME\nBhiwadi,NPKUNTA	347352	2020-12-16	347352	0	1965
783	2020-21	35	Kerala	671355	2020-12-23	671355	0	2149
784	2020-21	35	Tamil Nadu	31472710	2020-12-23	31472710	0	2150
785	2020-21	35	PUGALUR PGCIL(SR)	319307	2020-12-23	319307	0	2154
786	2020-21	35	TRISSUR PGCIL(SR)	186393	2020-12-23	186393	0	2155
787	2020-21	35	Goa(SR)	1439985	2020-12-23	1439985	0	2156
788	2020-21	35	NTPC,RSTPS-III	1025870	2020-12-23	1025870	0	2158
789	2020-21	35	NTPC,Sim'dri-II	764489	2020-12-23	764489	0	2160
790	2020-21	35	NTECL	10740922	2020-12-23	10740922	0	2162
791	2020-21	35	NLC, II Expn	1792303	2020-12-23	1792303	0	2166
792	2020-21	35	NTPL	147840	2020-12-23	147840	0	2167
793	2020-21	35	NTPC,Kudgi-Stage I	2826251	2020-12-23	2826251	0	2168
794	2020-21	35	SEIL/ TPCIL	5097984	2020-12-23	5097984	0	2170
795	2020-21	35	LKPPL III	274749	2020-12-23	274749	0	2174
796	2020-21	35	SEIL Project 2	2220323	2020-12-23	2220323	0	2177
797	2020-21	35	ACME\nHissar,NPKUNTA	1311879	2020-12-23	1311879	0	2182
798	2020-21	35	ACME\nBhiwadi,NPKUNTA	1205687	2020-12-23	1205687	0	2183
799	2020-21	35	ACME\nKarnal,NPKUNTA	1133284	2020-12-23	1133284	0	2184
800	2020-21	35	Azure,NPKUNTA	827045	2020-12-23	827045	0	2185
801	2020-21	35	FRV,NPKUNTA	949412	2020-12-23	949412	0	2186
802	2020-21	35	TATA,NPKUNTA	2588625	2020-12-23	2588625	0	2187
803	2020-21	35	NTPC,NPKUNTA	6829758	2020-12-23	6829758	0	2188
804	2020-21	35	FRV II,NPKUNTA	522234	2020-12-23	522234	0	2189
805	2020-21	35	SBG BLOCK 23,24,25 and 26, PAVAGADA	773166	2020-12-23	773166	0	2190
806	2020-21	35	SBG, NPKUNTA	534437	2020-12-23	534437	0	2191
807	2020-21	35	Ayana, NPKUNTA	954907	2020-12-23	954907	0	2192
808	2020-21	35	Avaada, PAVAGADA	1071395	2020-12-23	1071395	0	2194
809	2020-21	35	Adyah Block 1, PAVAGADA	388731	2020-12-23	388731	0	2195
810	2020-21	35	Adyah Block 2, PAVAGADA	254088	2020-12-23	254088	0	2196
811	2020-21	35	Adyah Block 13, PAVAGADA	189533	2020-12-23	189533	0	2197
812	2020-21	35	TATA, PAVAGADA	1759654	2020-12-23	1759654	0	2198
813	2020-21	35	ACME Kurukshetra, PAVAGADA	549576	2020-12-23	549576	0	2199
814	2020-21	35	ACME Rewari, PAVAGADA	563491	2020-12-23	563491	0	2200
815	2020-21	35	Fortum Finsurya, PAVAGADA	1101742	2020-12-23	1101742	0	2201
816	2020-21	35	Parampujya, PAVAGADA	270565	2020-12-23	270565	0	2202
817	2020-21	35	Renew-TN2, PAVAGADA	985810	2020-12-23	985810	0	2203
818	2020-21	35	Yarrow, PAVAGADA	448755	2020-12-23	448755	0	2204
819	2020-21	35	Adyah Block 10, PAVAGADA	257371	2020-12-23	257371	0	2205
820	2020-21	35	Adyah Block 6, PAVAGADA	202847	2020-12-23	202847	0	2206
821	2020-21	35	Adyah Block 3, PAVAGADA	308234	2020-12-23	308234	0	2207
822	2020-21	35	Fortum Solar, PAVAGADA	1709202	2020-12-23	1709202	0	2208
823	2020-21	35	Azure Earth, PAVAGADA	346753	2020-12-23	346753	0	2210
824	2020-21	35	Avaada Solarise, PAVAGADA	1424424	2020-12-23	1424424	0	2211
825	2020-21	35	GIREL, Tuticorin (Wind)	3814160	2020-12-23	3814160	0	2213
826	2020-21	35	MYTRAH, Tuticorin (Wind)	4753869	2020-12-23	4753869	0	2214
827	2020-21	35	ORANGE, Tuticorin (Wind)	853955	2020-12-23	853955	0	2215
828	2020-21	35	Betam, Tuticorin (Wind)	565252	2020-12-23	565252	0	2216
829	2020-21	35	MEPL	401667	2020-12-23	0	401667	2171
830	2020-21	35	SEL	228114	2020-12-23	0	228114	2172
831	2020-21	35	LKPPL	0	2020-12-23	0	0	2173
832	2020-21	35	Coastal(CE)	1367921	2020-12-23	0	1367921	2175
833	2020-21	35	NNTPP\n(Lignite)	0	2020-12-23	0	0	2180
834	2020-21	35	SPRNG, NPKUNTA	137700	2020-12-23	0	137700	2193
835	2020-21	35	KREDL, PAVAGADA	87532	2020-12-23	0	87532	2209
836	2020-21	35	SPRNG, NPKUNTA	2024	2020-12-23	0	2024	2212
837	2020-21	35	Betam, Tuticorin	0	2020-12-23	0	0	2217
838	2020-21	35	Eastern Region(*erpc)	29193521	2020-12-23	0	29193521	2146
839	2020-21	31	MEPL	389870	2020-12-23	389870	0	1811
840	2020-21	32	MEPL	384037	2020-12-23	384037	0	1882
841	2020-21	32	Avaada, PAVAGADA	493344	2020-12-23	493344	0	1904
842	2020-21	32	Avaada Solarise, PAVAGADA	511612	2020-12-23	511612	0	1921
843	2020-21	33	Betam, Tuticorin	3919	2020-12-23	3919	0	1998
844	2020-21	33	MEPL	391230	2020-12-23	391230	0	1953
845	2020-21	33	FRV II,NPKUNTA	169611	2020-12-23	169611	0	1971
846	2020-21	34	Betam, Tuticorin	1174	2020-12-23	1174	0	2144
847	2020-21	34	LKPPL III	242024	2020-12-23	242024	0	2102
848	2020-21	33	FRV,NPKUNTA	1094137	2020-12-23	1094137	0	1968
849	2020-21	34	MEPL	404678	2020-12-23	404678	0	2099
850	2020-21	34	FRV,NPKUNTA	1302876	2020-12-23	1302876	0	2114
851	2020-21	34	NTECL	7014714	2020-12-23	7014714	0	2090
852	2020-21	36	Andhra Pradesh	96612	2020-12-29	96612	0	2220
853	2020-21	36	Tamil Nadu	7058122	2020-12-29	7058122	0	2223
854	2020-21	36	PUGALUR PGCIL(SR)	335536	2020-12-29	335536	0	2227
855	2020-21	36	TRISSUR PGCIL(SR)	223887	2020-12-29	223887	0	2228
856	2020-21	36	Goa(SR)	981702	2020-12-29	981702	0	2229
857	2020-21	36	NTPC,RSTPS-III	1220132	2020-12-29	1220132	0	2231
858	2020-21	36	NTPC,Sim'dri-II	1769144	2020-12-29	1769144	0	2233
859	2020-21	36	NTECL	6417786	2020-12-29	6417786	0	2235
860	2020-21	36	NLC, II Stage II	1944753	2020-12-29	1944753	0	2237
861	2020-21	36	NLC, II Expn	2311036	2020-12-29	2311036	0	2239
862	2020-21	36	NTPL	198585	2020-12-29	198585	0	2240
863	2020-21	36	NTPC,Kudgi-Stage I	4135763	2020-12-29	4135763	0	2241
864	2020-21	36	NNTPP	5615918	2020-12-29	5615918	0	2242
865	2020-21	36	SEIL/ TPCIL	10070930	2020-12-29	10070930	0	2243
866	2020-21	36	SEL	296196	2020-12-29	296196	0	2245
867	2020-21	36	LKPPL III	253987	2020-12-29	253987	0	2247
868	2020-21	36	SEIL Project 2	471665	2020-12-29	471665	0	2250
869	2020-21	36	ACME\nHissar,NPKUNTA	566368	2020-12-29	566368	0	2255
870	2020-21	36	Azure,NPKUNTA	843339	2020-12-29	843339	0	2258
871	2020-21	36	FRV,NPKUNTA	1578187	2020-12-29	1578187	0	2259
872	2020-21	36	TATA,NPKUNTA	1435810	2020-12-29	1435810	0	2260
873	2020-21	36	NTPC,NPKUNTA	8623817	2020-12-29	8623817	0	2261
874	2020-21	36	FRV II,NPKUNTA	770807	2020-12-29	770807	0	2262
875	2020-21	36	Ayana, NPKUNTA	1168948	2020-12-29	1168948	0	2265
876	2020-21	36	SPRNG, NPKUNTA	152441	2020-12-29	152441	0	2266
877	2020-21	36	Avaada, PAVAGADA	1167699	2020-12-29	1167699	0	2267
878	2020-21	36	Adyah Block 1, PAVAGADA	57146	2020-12-29	57146	0	2268
879	2020-21	36	Adyah Block 13, PAVAGADA	119029	2020-12-29	119029	0	2270
880	2020-21	36	ACME Kurukshetra, PAVAGADA	665448	2020-12-29	665448	0	2272
881	2020-21	36	ACME Rewari, PAVAGADA	507853	2020-12-29	507853	0	2273
882	2020-21	36	Fortum Finsurya, PAVAGADA	1354865	2020-12-29	1354865	0	2274
883	2020-21	36	Yarrow, PAVAGADA	733914	2020-12-29	733914	0	2277
884	2020-21	36	Adyah Block 10, PAVAGADA	165428	2020-12-29	165428	0	2278
885	2020-21	36	Adyah Block 6, PAVAGADA	56961	2020-12-29	56961	0	2279
886	2020-21	36	Adyah Block 3, PAVAGADA	94144	2020-12-29	94144	0	2280
887	2020-21	36	Fortum Solar, PAVAGADA	959763	2020-12-29	959763	0	2281
888	2020-21	36	Azure Earth, PAVAGADA	140791	2020-12-29	140791	0	2283
889	2020-21	36	Avaada Solarise, PAVAGADA	550804	2020-12-29	550804	0	2284
890	2020-21	36	MYTRAH, Tuticorin (Wind)	6509460	2020-12-29	6509460	0	2287
891	2020-21	36	ORANGE, Tuticorin (Wind)	1903560	2020-12-29	1903560	0	2288
892	2020-21	36	MEPL	330888	2020-12-29	0	330888	2244
893	2020-21	36	LKPPL	0	2020-12-29	0	0	2246
894	2020-21	36	Coastal(CE)	1469434	2020-12-29	0	1469434	2248
895	2020-21	36	NNTPP\n(Lignite)	0	2020-12-29	0	0	2253
896	2020-21	36	MEPL\n(Imported Coal)	0	2020-12-29	0	0	2254
897	2020-21	36	SBG BLOCK 23,24,25 and 26, PAVAGADA	433059	2020-12-29	0	433059	2263
898	2020-21	36	SBG, NPKUNTA	1014476	2020-12-29	0	1014476	2264
899	2020-21	36	Parampujya, PAVAGADA	1605332	2020-12-29	0	1605332	2275
900	2020-21	36	Renew-TN2, PAVAGADA	585654	2020-12-29	0	585654	2276
901	2020-21	36	SPRNG, NPKUNTA	0	2020-12-29	0	0	2285
902	2020-21	36	GIREL, Tuticorin (Wind)	5686044	2020-12-29	0	5686044	2286
903	2020-21	36	Betam, Tuticorin (Wind)	1388403	2020-12-29	0	1388403	2289
904	2020-21	36	Eastern Region(*erpc)	61558899	2020-12-29	0	61558899	2219
905	2020-21	34	SPRNG, NPKUNTA	3395	2020-12-29	3395	0	2139
906	2020-21	35	SPRNG, NPKUNTA	2024	2020-12-29	2024	0	2212
907	2020-21	34	SEL	235182	2020-12-29	235182	0	2100
908	2020-21	35	SEL	228114	2020-12-29	228114	0	2172
909	2020-21	35	SPRNG, NPKUNTA	137700	2020-12-29	137700	0	2193
910	2020-21	37	Kerala	18260477	2021-01-05	18260477	0	2294
911	2020-21	37	Tamil Nadu	51706563	2021-01-05	51706563	0	2295
912	2020-21	37	Telangana	10278026	2021-01-05	10278026	0	2296
913	2020-21	37	PUGALUR PGCIL(SR)	435313	2021-01-05	435313	0	2299
914	2020-21	37	TRISSUR PGCIL(SR)	259230	2021-01-05	259230	0	2300
915	2020-21	37	Goa(SR)	1249860	2021-01-05	1249860	0	2301
916	2020-21	37	NTPC,RSTPS-III	2920913	2021-01-05	2920913	0	2303
917	2020-21	37	NTPC,Talcher-II	1460180	2021-01-05	1460180	0	2304
918	2020-21	37	NTPC,Sim'dri-II	3961341	2021-01-05	3961341	0	2305
919	2020-21	37	NTECL	5027734	2021-01-05	5027734	0	2307
920	2020-21	37	NLC, II Expn	2494004	2021-01-05	2494004	0	2311
921	2020-21	37	NTPL	74714	2021-01-05	74714	0	2312
922	2020-21	37	NTPC,Kudgi-Stage I	4977761	2021-01-05	4977761	0	2313
923	2020-21	37	NNTPP	5583493	2021-01-05	5583493	0	2314
924	2020-21	37	SEIL/ TPCIL	5757274	2021-01-05	5757274	0	2315
925	2020-21	37	IL&FS	600233	2021-01-05	600233	0	2321
926	2020-21	37	SEIL Project 2	50242	2021-01-05	50242	0	2322
927	2020-21	37	NTPC,NPKUNTA	743633	2021-01-05	743633	0	2333
928	2020-21	37	Renew-TN2, PAVAGADA	14534	2021-01-05	14534	0	2348
929	2020-21	37	MYTRAH, Tuticorin (Wind)	5145603	2021-01-05	5145603	0	2359
930	2020-21	37	ORANGE, Tuticorin (Wind)	346240	2021-01-05	346240	0	2360
931	2020-21	37	Betam, Tuticorin (Wind)	356359	2021-01-05	356359	0	2361
932	2020-21	37	MEPL	485076	2021-01-05	0	485076	2316
933	2020-21	37	SEL	287131	2021-01-05	0	287131	2317
934	2020-21	37	LKPPL	0	2021-01-05	0	0	2318
935	2020-21	37	LKPPL III	264604	2021-01-05	0	264604	2319
936	2020-21	37	Coastal(CE)	627043	2021-01-05	0	627043	2320
937	2020-21	37	NNTPP\n(Lignite)	0	2021-01-05	0	0	2325
938	2020-21	37	MEPL\n(Imported Coal)	0	2021-01-05	0	0	2326
939	2020-21	37	FRV,NPKUNTA	84109	2021-01-05	0	84109	2331
940	2020-21	37	Ayana, NPKUNTA	763739	2021-01-05	0	763739	2337
941	2020-21	37	GIREL, Tuticorin (Wind)	1375688	2021-01-05	0	1375688	2358
942	2020-21	37	Eastern Region(*erpc)	187555826	2021-01-05	0	187555826	2291
943	2020-21	36	SBG BLOCK 23,24,25 and 26, PAVAGADA	433059	2021-01-05	433059	0	2263
944	2020-21	36	Renew-TN2, PAVAGADA	585654	2021-01-05	585654	0	2276
945	2020-21	36	SBG, NPKUNTA	1014476	2021-01-05	1014476	0	2264
946	2020-21	36	Betam, Tuticorin (Wind)	1388403	2021-01-05	1388403	0	2289
947	2020-21	36	Parampujya, PAVAGADA	1605332	2021-01-05	1605332	0	2275
948	2020-21	36	GIREL, Tuticorin (Wind)	5686044	2021-01-05	5686044	0	2286
\.


--
-- Data for Name: WeeklyUpload_finalreceivedisburse1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WeeklyUpload_finalreceivedisburse1" (id, disburseamount, disbursedate, duetopool, registration_id_id) FROM stdin;
274	10712060	2020-12-07	0	1787
275	30417542	2020-12-07	0	1788
276	12674796	2020-12-07	0	1789
277	22645396	2020-12-07	0	1791
278	2961986	2020-12-07	0	1792
279	1639071	2020-12-07	0	1793
280	596019	2020-12-07	0	1796
281	40049	2020-12-07	0	1797
282	28847	2020-12-07	0	1803
283	2281826	2020-12-07	0	1804
284	610451	2020-12-07	0	1805
285	124552	2020-12-07	0	1807
286	17790	2020-12-07	0	1816
287	515464	2020-12-07	0	1817
288	139122	2020-12-07	0	1825
289	209451	2020-12-07	0	1827
290	8071	2020-12-07	0	1829
291	186490	2020-12-07	0	1833
292	103288	2020-12-07	0	1834
293	335953	2020-12-07	0	1835
294	721747	2020-12-07	0	1836
295	109824	2020-12-07	0	1837
296	153483	2020-12-07	0	1838
297	1289662	2020-12-07	0	1840
298	179458	2020-12-07	0	1842
299	83715	2020-12-07	0	1843
300	407771	2020-12-07	0	1844
301	669250	2020-12-07	0	1846
302	205452	2020-12-07	0	1848
303	0	2020-12-07	31585907	1819
304	3977105	2020-12-07	0	1858
305	37607730	2020-12-07	0	1859
306	1546385	2020-12-07	0	1860
307	40440421	2020-12-07	0	1862
308	1318839	2020-12-07	0	1863
309	1019693	2020-12-07	0	1864
310	2843180	2020-12-07	0	1874
311	2718934	2020-12-07	0	1875
312	329588	2020-12-07	0	1876
313	2270245	2020-12-07	0	1880
314	232973	2020-12-07	0	1896
315	22784	2020-12-07	0	1905
316	9665	2020-12-07	0	1906
317	250008	2020-12-07	0	1907
318	964087	2020-12-07	0	1912
319	229792	2020-12-07	0	1914
320	212900	2020-12-07	0	1915
321	312447	2020-12-07	0	1916
322	672717	2020-12-07	0	1918
323	132153	2020-12-07	0	1920
324	0	2020-12-07	326796118	1890
326	29381279	2020-12-09	2204628	1819
327	3624321	2020-12-09	0	1929
328	42772133	2020-12-09	0	1930
329	6255087	2020-12-09	0	1931
330	9615581	2020-12-09	0	1932
331	24817603	2020-12-09	0	1933
332	6744509	2020-12-09	0	1934
333	824944	2020-12-09	0	1935
334	4082885	2020-12-09	0	1939
335	1954208	2020-12-09	0	1941
336	266173	2020-12-09	0	1942
337	414407	2020-12-09	0	1943
338	8859112	2020-12-09	0	1945
339	7365387	2020-12-09	0	1946
340	4661372	2020-12-09	0	1947
341	0	2020-12-09	260762233	1961
342	210	2020-12-09	0	1963
343	48622	2020-12-09	0	1977
344	176775	2020-12-09	0	1985
345	304344	2020-12-09	0	1992
346	3981329	2020-12-09	0	1994
347	1814126	2020-12-09	0	1996
348	2204628	2020-12-10	29381279	1819
389	15015509	2020-12-16	0	2075
390	207984236	2020-12-16	118811882	1890
391	16563460	2020-12-23	0	2147
392	14331910	2020-12-23	0	2148
393	16592383	2020-12-23	0	2151
394	5164134	2020-12-23	0	2152
395	1126234	2020-12-23	0	2153
396	4635739	2020-12-23	0	2157
397	1876161	2020-12-23	0	2159
398	1231424	2020-12-23	0	2161
399	4391095	2020-12-23	0	2163
400	4123324	2020-12-23	0	2164
401	2774818	2020-12-23	0	2165
402	1216474	2020-12-23	0	2169
403	81785	2020-12-23	0	2176
404	0	2020-12-23	62929954	2178
405	2722	2020-12-23	0	2181
407	99079	2020-12-29	0	2222
408	1190537	2020-12-29	0	2224
409	17545239	2020-12-29	0	2221
410	3131745	2020-12-29	0	2225
411	1178863	2020-12-29	0	2226
412	4416205	2020-12-29	0	2230
413	2763488	2020-12-29	0	2232
414	3339218	2020-12-29	0	2234
415	396768	2020-12-29	0	2236
416	2436829	2020-12-29	0	2238
417	140602	2020-12-29	0	2249
418	0	2020-12-29	61133010	2251
419	308876	2020-12-29	0	2256
420	77128	2020-12-29	0	2257
421	14278	2020-12-29	0	2269
422	912258	2020-12-29	0	2271
423	203051	2020-12-29	0	2282
424	43368702	2020-12-29	75443180	1890
425	1295854	2021-01-05	0	2292
426	11797460	2021-01-05	0	2293
427	5091344	2021-01-05	0	2297
428	1095101	2021-01-05	0	2298
429	2900734	2021-01-05	0	2302
430	4213208	2021-01-05	0	2306
431	3787121	2021-01-05	0	2308
432	2440449	2021-01-05	0	2309
433	1198647	2021-01-05	0	2310
434	977090	2021-01-05	0	2327
435	2336053	2021-01-05	0	2328
436	1998237	2021-01-05	0	2329
437	682426	2021-01-05	0	2330
438	1149692	2021-01-05	0	2332
439	364950	2021-01-05	0	2334
440	1563307	2021-01-05	0	2335
441	1067914	2021-01-05	0	2336
442	497663	2021-01-05	0	2338
443	339567	2021-01-05	0	2339
444	104788	2021-01-05	0	2340
445	142310	2021-01-05	0	2341
446	200186	2021-01-05	0	2342
447	3402072	2021-01-05	0	2343
448	13502	2021-01-05	0	2344
449	199794	2021-01-05	0	2345
450	79634	2021-01-05	0	2346
451	1482875	2021-01-05	0	2347
452	883671	2021-01-05	0	2349
453	58914	2021-01-05	0	2350
454	243120	2021-01-05	0	2351
455	196576	2021-01-05	0	2352
456	493643	2021-01-05	0	2353
457	174614	2021-01-05	0	2354
458	504923	2021-01-05	0	2355
459	1092594	2021-01-05	0	2356
460	0	2021-01-05	0	2357
461	0	2021-01-05	131858932	2323
462	75443180	2021-01-05	0	1890
463	3123861	2021-01-05	257638372	1961
\.


--
-- Data for Name: WeeklyUpload_miscpaymentstatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WeeklyUpload_miscpaymentstatus" (id, "Pay_type", "Pay_refno", "Pay_date", "Pay_amount", "Paid_by", "Paid_for", "Remarks", "Fin_year", "Week", registration_id, "Actual_Week", dsmduepoolmodel_id) FROM stdin;
18	NEFT	SBIN23RTGR	2020-11-24	835908	SRLDC	Parampujya Solar Energy Private Ltd. (Pavagada Solar Park) 	week 30 bill	2020-21	30	SRRPP1GN	null	null
19	NEFT	SBIN23RTGR	2020-11-30	10019907	SRLDC	ER	LATE PAY	2020-21	28	SRRKL1DS	null	null
20	NEFT	SBIN23RTGR	2020-12-04	220	SRLDC	Fortum Finnsurya Energy Private Ltd. (Pavagada Solar Park) 	LATE PAY	2020-21	MISC	SRRFP1GN	null	null
21	NEFT	SBIN23RTGR	2020-12-16	354	SRLDC	LANCO KONDAPALI STAGE 2	35th week	2020-21	MISC	SRRLK2SL	null	null
22	NEFT	SBIN23RTGR	2020-12-18	1302	SRLDC	Fortum Finnsurya Energy Private Ltd. (Pavagada Solar Park) 	35th week fortum	2020-21	MISC	SRRFP1GN	null	null
23	NEFT	SBIN23RTGR	2020-12-17	856	SRLDC	Avaada Solar Energy Private Ltd. (Pavagada Solar Park) 	35th week avaada	2020-21	MISC	SRRAP1GN	null	null
24	NEFT	SBIN23RTGR	2020-12-16	1339483	SRLDC	MEL	35th week avaada	2020-21	MISC	MEL	null	null
25	NEFT	SBIN23RTGR	2020-12-14	42	SRLDC	Avaada Solar Energy Private Ltd. (Pavagada Solar Park) 	35th week avaada	2020-21	MISC	SRRAP1GN	null	null
26	NEFT	SBIN23RTGR	2020-12-14	78	SRLDC	Avaada Solarise Energy Pvt. Ltd. (Pavagada Solar Park)	35th week avaada solarise	2020-21	MISC	SRRAS1GN	null	null
27	NEFT	SBIN23RTGR	2020-12-14	2681505	SRLDC	Fortum Solar India Private Limited. (Pavagada Solar Park)	fortum solar	2020-21	MISC	SRRFS1GN	null	null
28	NEFT	SBIN23RTGR	2020-12-22	3080	SRLDC	FRV I SOLAR POWER PROJECT LTD	36 week	2020-21	MISC	SRRFR1GN	36	null
29	NEFT	SBIN23RTGR	2020-12-22	561	SRLDC	FRV II SOLAR INDIA POWER LIMITED	36 week	2020-21	MISC	SRRFR2GN	36	null
30	NEFT	SBIN23RTGR	2020-12-22	523351	SRLDC	Adyah Solar Energy Pvt, Ltd. (Pavagada Solar Park)	gjhgh	2020-21	MISC	SRRAD2GN	36	null
31	NEFT	SBIN23RTGR	2020-12-22	280073	SRLDC	Adyah Solar Energy Pvt, Ltd. (Pavagada Solar Park)	gjhgh	2020-21	MISC	SRRAD2GN	36	null
32	NEFT	SBIN23RTGR	2020-12-22	595618	SRLDC	Adyah Solar Energy Pvt, Ltd. (Pavagada Solar Park)	gjhgh	2020-21	MISC	SRRAD2GN	36	null
33	NEFT	SBIN23RTGR	2020-12-22	355	SRLDC	ACME KARNAL POWER PROJECT LTD	36 week	2020-21	MISC	SRRAK1GN	36	null
34	NEFT	SBIN23RTGR	2020-12-22	641	SRLDC	ReNew Wind Energy (TN2) Private Limited (Pavagada Solar Park	36 week	2020-21	MISC	SRRRN1GN	36	null
35	NEFT	SBIN23RTGR	2020-12-23	606087	SRLDC	Adyah Solar Energy Pvt, Ltd. (Pavagada Solar Park) 	36 week	2020-21	MISC	SRRAD2GN	36	null
36	NEFT	SBIN23RTGR	2020-12-23	556241	SRLDC	Adyah Solar Energy Pvt, Ltd. (Pavagada Solar Park) 	36 week	2020-21	MISC	SRRAD2GN	36	null
37	NEFT	SBIN23RTGR	2020-12-23	756819	SRLDC	Adyah Solar Energy Pvt, Ltd. (Pavagada Solar Park) 	36 week	2020-21	MISC	SRRAD2GN	36	null
38	NEFT	SBIN23RTGR	2020-12-23	511126	SRLDC	Adyah Solar Energy Pvt, Ltd. (Pavagada Solar Park) 	36 week	2020-21	MISC	SRRAD2GN	36	null
39	NEFT	SBIN23RTGR	2020-12-23	2840931	SRLDC	ReNew Wind Energy (TN2) Private Limited (Pavagada Solar Park	36 week	2020-21	MISC	SRRRN1GN	36	null
40	NEFT	SBIN23RTGR	2020-12-23	4401	SRLDC	ACME REWARI Solar Power Pvt Ltd. (Pavagada Solar Park) 	36 week	2020-21	MISC	SRRAR1GN	36	null
41	NEFT	SBIN23RTGR	2020-12-23	6054	SRLDC	ACME Kurukshetra Solar Energy Pvt. Ltd. (Pavagada Solar Park)	36 week	2020-21	MISC	SRRKP1GN	36	null
42	NEFT	SBIN23RTGR	2020-12-23	702777	SRLDC	Azure Power Earth Private Ltd. (Pavagada Solar Park) 	hkjh	2020-21	MISC	SRRAE1GN	36	null
46	NEFT	SBIN23RTGR	2020-12-19	212385	SRLDC	SEL	37th week	2020-21	27	SRADMIN	37	1348
47	NEFT	SBIN23RTGR	2020-12-28	1530	SRLDC	Parampujya, PAVAGADA	37th week	2020-21	MISC	SRADMIN	37	1349
48	NEFT	SBIN23RTGR	2020-12-28	322	SRLDC	Renew-TN2, PAVAGADA	37th week	2020-21	MISC	SRADMIN	37	1350
49	NEFT	SBIN23RTGR	2020-12-28	485	SRLDC	SEIL Project 2 	37th week	2020-21	MISC	SRADMIN	37	1351
50	NEFT	SBIN23RTGR	2020-12-28	3678	SRLDC	Parampujya, PAVAGADA	37th week	2020-21	MISC	SRADMIN	37	1352
51	NEFT	SBIN23RTGR	2020-12-28	1979	SRLDC	Adyah Block 1, PAVAGADA	37th week	2020-21	MISC	SRADMIN	37	1353
\.


--
-- Data for Name: WeeklyUpload_moemployeeuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WeeklyUpload_moemployeeuser" (id, empno, name, email, designation, contact_number, image_url, registration_id) FROM stdin;
4	00401	SHAMREENA V	TEST2@TEST.COM	Sr.Dy General Manager	798787979	/static/images/MO/00401/SHAMREENA V/Screenshot (2).png	SRADMIN
5	00402	T SRINIVAS	test@test.com	General Manager	79877897979	/static/images/MO/00402/T SRINIVAS/Screenshot (4).png	SRADMIN
2	00400	K SURESH KUMAR	test@test.com	Chief Manager	797989778979	/static/images/MO/00400/K SURESH KUMAR/sign.png	SRADMIN
\.


--
-- Data for Name: WeeklyUpload_paymentstatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WeeklyUpload_paymentstatus" (id, "Pay_type", "Pay_refno", "Pay_date", "Pay_amount", "Dev_final", "Remarks", registration_id_id, "Status", reject_remarks, "Due_amount", "Paid_by", "Paid_for") FROM stdin;
622	NEFT	gjhggj	2020-11-20	635211	635211	\N	1801	Approved	Null	0	SRLDC	NTPC,Sim'dri-I
618	NEFT	hhfhfgh	2020-11-13	15114	15114	\N	1795	Approved	Null	0	SRLDC	TRISSUR PGCIL(SR)
617	NEFT	jgjhghj	2020-11-13	1971724	1971724	\N	1854	Approved	Null	0	SRLDC	Betam, Tuticorin (Wind)
616	NEFT	sdsds	2020-11-13	40964	40964	\N	1849	Approved	Null	0	SRLDC	Avaada Solarise, PAVAGADA
615	NEFT	sdsda	2020-11-20	79689	79689	\N	1845	Approved	Null	0	SRLDC	Adyah Block 3, PAVAGADA
614	NEFT	dsdasd	2020-11-13	610515	610515	\N	1794	Approved	Null	0	SRLDC	PUGALUR PGCIL(SR)
613	NEFT	sdsds	2020-11-20	28406	28406	\N	1841	Approved	Null	0	SRLDC	Renew-TN2, PAVAGADA
612	NEFT	dsadasd	2020-11-21	605869	605869	\N	1839	Approved	Null	0	SRLDC	Fortum Finsurya, PAVAGADA
611	NEFT	ssdssd	2020-11-13	379232	379232	\N	1832	Approved	Null	0	SRLDC	Avaada, PAVAGADA
610	NEFT	aasdasd	2020-11-18	4222830	4222830	\N	1820	Approved	Null	0	SRLDC	NNTPP\n(Lignite)
609	NEFT	dsdsa	2020-11-19	968501	968501	\N	1831	Approved	Null	0	SRLDC	SBG, NPKUNTA
608	NEFT	dsdasd	2020-11-19	880638	880638	\N	1830	Approved	Null	0	SRLDC	SBG BLOCK 23,24,25 and 26, PAVAGADA
607	NEFT	ddsdsd	2020-11-12	2513006	2513006	\N	1853	Approved	Null	0	SRLDC	ORANGE, Tuticorin (Wind)
606	NEFT	asdsd	2020-11-19	8025939	8025939	\N	1852	Approved	Null	0	SRLDC	MYTRAH, Tuticorin (Wind)
605	NEFT	sdsad	2020-11-20	6071356	6071356	\N	1851	Approved	Null	0	SRLDC	GIREL, Tuticorin (Wind)
604	NEFT	sasa	2020-11-20	1857306	1857306	\N	1828	Approved	Null	0	SRLDC	NTPC,NPKUNTA
603	NEFT	dsda	2020-11-18	7013272	7013272	\N	1809	Approved	Null	0	SRLDC	NNTPP
602	NEFT	dsdsd	2020-11-20	2437990	2437990	\N	1808	Approved	Null	0	SRLDC	NTPC,Kudgi-Stage I
601	NEFT	xzxzx	2020-11-16	4127778	4127778	\N	1806	Approved	Null	0	SRLDC	NLC, II Expn
600	NEFT	xzxzx	2020-11-20	2932350	2932350	\N	1810	Approved	Null	0	SRLDC	SEIL/ TPCIL
599	NEFT	zxzxz	2020-11-19	243298	243298	\N	1813	Approved	Null	0	SRLDC	LKPPL
598	NEFT	sdcxcc	2020-11-20	7130051	7130051	\N	1802	Approved	Null	0	SRLDC	NTECL
597	NEFT	dsdsa	2020-11-20	2590932	2590932	\N	1799	Approved	Null	0	SRLDC	NTPC,Talcher-II
596	NEFT	sdsd	2020-11-20	1493498	1493498	\N	1800	Approved	Null	0	SRLDC	NTPC,Sim'dri-II
595	NEFT	jhdgfhjg	2020-11-20	2260115	2260115	\N	1798	Approved	Null	0	SRLDC	NTPC,RSTPS-III
594	NEFT	gfhjdg	2020-11-20	25525319	25525319	\N	1790	Approved	Null	0	SRLDC	Tamil Nadu
724	NEFT	ghjghj	2020-12-11	907476	907476	\N	2086	Approved	Null	0	SRLDC	NTPC,RSTPS-III
726	NEFT	hjgjh	2020-12-11	360614	360614	\N	2087	Approved	Null	0	SRLDC	NTPC,Talcher-II
625	NEFT	1234	1970-01-01	6793573	6793573	\N	1888	Approved	Null	0	SRLDC	SEIL Project 2
626	NEFT	1234	1970-01-01	6423768	6423768	\N	1881	Approved	Null	0	SRLDC	SEIL/ TPCIL
627	NEFT	1565	1970-01-01	5987581	5987581	\N	1868	Approved	Null	0	SRLDC	NTPC,RSTPS
629	NEFT	1568	2020-11-27	4609004	4609004	\N	1873	Approved	Null	0	SRLDC	NTECL
631	NEFT	9685	2020-11-23	2905698	2905698	\N	1877	Approved	Null	0	SRLDC	NLC, II Expn
632	NEFT	685	2020-11-27	2865867	2865867	\N	1879	Approved	Null	0	SRLDC	NTPC,Kudgi-Stage I
634	NEFT	9685	2020-11-27	2397928	2397928	\N	1871	Approved	Null	0	SRLDC	NTPC,Sim'dri-II
635	NEFT	6958	2020-11-27	2054844	2054844	\N	1869	Approved	Null	0	SRLDC	NTPC,RSTPS-III
638	NEFT	6958	2020-11-24	970263	970263	\N	1867	Approved	Null	0	SRLDC	Goa(SR)
640	NEFT	6254545	2020-11-27	664595	664595	\N	1887	Approved	Null	0	SRLDC	IL&FS
644	NEFT	62585	2020-11-23	385777	385777	\N	1878	Approved	Null	0	SRLDC	NTPL
649	NEFT	93588	2020-11-27	182633	182633	\N	1872	Approved	Null	0	SRLDC	NTPC,Sim'dri-I
650	NEFT	36258	2020-11-19	132816	132816	\N	1866	Approved	Null	0	SRLDC	TRISSUR PGCIL(SR)
636	NEFT	365	2020-11-26	1679111	1679111	\N	1897	Approved	Null	0	SRLDC	FRV,NPKUNTA
639	NEFT	36598	2020-11-27	923330	923330	\N	1902	Approved	Null	0	SRLDC	SBG, NPKUNTA
642	NEFT	63258	2020-11-27	0	0	\N	1922	Approved	Null	0	SRLDC	Ayana, NPKUNTA
641	NEFT	56656898	2020-11-19	562420	562420	\N	1865	Approved	Null	0	SRLDC	PUGALUR PGCIL(SR)
630	NEFT	9856	2020-11-24	3091132	3091132	\N	1923	Approved	Null	0	SRLDC	GIREL, Tuticorin (Wind)
633	NEFT	625	2020-11-27	2591663	2591663	\N	1899	Approved	Null	0	SRLDC	NTPC,NPKUNTA
637	NEFT	6958	2020-11-24	1426393	1426393	\N	1925	Approved	Null	0	SRLDC	ORANGE, Tuticorin (Wind)
647	NEFT	33663	2020-11-20	237031	237031	\N	1898	Approved	Null	0	SRLDC	TATA,NPKUNTA
643	NEFT	66335	2020-11-27	421111	421111	\N	1909	Approved	Null	0	SRLDC	ACME Kurukshetra, PAVAGADA
645	NEFT	96696	2020-11-27	285608	285608	\N	1901	Approved	Null	0	SRLDC	SBG BLOCK 23,24,25 and 26, PAVAGADA
646	NEFT	3625	2020-11-26	254959	254959	\N	1917	Approved	Null	0	SRLDC	Adyah Block 3, PAVAGADA
648	NEFT	3636	2020-11-27	226958	226958	\N	1910	Approved	Null	0	SRLDC	ACME Rewari, PAVAGADA
624	NEFT	1235	1970-01-01	7309019	7309019	\N	1870	Approved	Null	0	SRLDC	NTPC,Talcher-II
628	NEFT	125	2020-11-26	5151217	5151217	\N	1924	Approved	Null	0	SRLDC	MYTRAH, Tuticorin (Wind)
728	NEFT	gjhgg	2020-12-07	2244674	2244674	\N	2094	Approved	Null	0	SRLDC	NLC, II Expn
730	NEFT	ghjg	2020-12-11	2762272	2762272	\N	2096	Approved	Null	0	SRLDC	NTPC,Kudgi-Stage I
732	NEFT	ggghgjh	2020-12-11	651961	651961	\N	2116	Approved	Null	0	SRLDC	NTPC,NPKUNTA
653	NEFT	362978	2020-11-27	1027783	1027783	\N	1926	Approved	Null	0	SRLDC	Betam, Tuticorin (Wind)
651	NEFT	95895	2020-11-26	65798	65798	\N	1900	Approved	Null	0	SRLDC	FRV II,NPKUNTA
652	NEFT	696939	2020-11-26	32274	32274	\N	1913	Approved	Null	0	SRLDC	Renew-TN2, PAVAGADA
654	NEFT	3659	2020-11-20	1990823	1990823	\N	1908	Approved	Null	0	SRLDC	TATA, PAVAGADA
657	NEFT	6299	2020-11-27	523092	523092	\N	1903	Approved	Null	0	SRLDC	Ayana, NPKUNTA
656	NEFT	2365	2020-11-25	250000000	294722555	\N	1856	Approved	Null	0	SRLDC	Western Region(*wrpc)
655	NEFT		2020-11-25	44722555	294722555	\N	1856	Approved	Null	250000000	SRLDC	Western Region(*wrpc)
658	NEFT	dsdsa	2020-11-27	29606311	29606311	\N	1861	Approved	Null	0	SRLDC	Tamil Nadu
659	NEFT	sjhsgjh	2020-11-25	219353	219353	\N	1812	Approved	Null	0	SRLDC	SEL
660	NEFT	gfdgfj	2020-11-26	1639868	1639868	\N	1826	Approved	Null	0	SRLDC	FRV,NPKUNTA
661	NEFT	gshj	2020-11-24	6838794	6838794	\N	1785	Approved	Null	0	SRLDC	Western Region(*wrpc)
662	NEFT	62625	1970-01-01	3274482	3274482	\N	1938	Rejected	DATE	0	SRLDC	Goa(SR)
722	NEFT	ggjgg	2020-12-11	3126194	3126194	\N	2078	Approved	Null	0	SRLDC	Tamil Nadu
723	NEFT	ghfghfgh	2020-12-09	3007670	3007670	\N	2084	Approved	Null	0	SRLDC	Goa(SR)
725	NEFT	gjhggj	2020-12-11	660612	660612	\N	2088	Approved	Null	0	SRLDC	NTPC,Sim'dri-II
727	NEFT	hjghjgjg	2020-12-11	6684068	6684068	\N	2098	Approved	Null	0	SRLDC	SEIL/ TPCIL
729	NEFT	gjhghjj	2020-12-08	70906	70906	\N	2095	Approved	Null	0	SRLDC	NTPL
731	NEFT	jhgjgjgj	2020-12-11	276132	276132	\N	2089	Approved	Null	0	SRLDC	NTPC,Sim'dri-I
733	NEFT	767678gh	2020-12-11	1916075	1916075	\N	2140	Approved	Null	0	SRLDC	GIREL, Tuticorin (Wind)
734	NEFT	gjhghgjg	2020-12-10	4347528	4347528	\N	2141	Approved	Null	0	SRLDC	MYTRAH, Tuticorin (Wind)
735	NEFT	6876876	2020-12-04	239141	239141	\N	2142	Approved	Null	0	SRLDC	ORANGE, Tuticorin (Wind)
736	NEFT	hjhjjk	2020-12-11	5527002	5527002	\N	2105	Approved	Null	0	SRLDC	SEIL Project 2
737	NEFT	hkjhjh	2020-12-10	417	417	\N	2122	Approved	Null	0	SRLDC	Adyah Block 1, PAVAGADA
738	NEFT	kjhhjk787	2020-12-04	332786	332786	\N	2082	Approved	Null	0	SRLDC	PUGALUR PGCIL(SR)
739	NEFT	hkjkhjkk	2020-12-04	223026	223026	\N	2083	Approved	Null	0	SRLDC	TRISSUR PGCIL(SR)
740	NEFT	ghjgj7676	2020-12-11	924930	924930	\N	2120	Approved	Null	0	SRLDC	Ayana, NPKUNTA
741	NEFT	hjkhh	2020-12-08	170609703	170609703	\N	2073	Approved	Null	0	SRLDC	Western Region(*wrpc)
668	NEFT	365866	2020-11-30	2648810	2648810	\N	1948	Approved	Null	0	SRLDC	NLC, II Expn
687	NEFT	9685	2020-11-26	305004	305004	\N	1936	Approved	Null	0	SRLDC	PUGALUR PGCIL(SR)
693	NEFT	3659	2020-11-26	148815	148815	\N	1937	Approved	Null	0	SRLDC	TRISSUR PGCIL(SR)
755	NEFT	678678	2020-11-12	159096	159096	\N	1824	Approved	Null	0	SRLDC	ACME\nKarnal,NPKUNTA
683	NEFT	96898	2020-11-26	351553	351553	\N	1979	Approved	Null	0	SRLDC	TATA, PAVAGADA
685	NEFT	9865	2020-11-27	509248	509248	\N	1983	Approved	Null	0	SRLDC	Parampujya, PAVAGADA
756	NEFT	hjkhjk	2020-11-12	24518	24518	\N	1893	Approved	Null	0	SRLDC	ACME\nHissar,NPKUNTA
757	NEFT	gjhgh	2020-11-27	318925	318925	\N	1894	Approved	Null	0	SRLDC	ACME\nBhiwadi,NPKUNTA
758	NEFT	jkhkhjk	2020-11-12	121125	121125	\N	1895	Approved	Null	0	SRLDC	ACME\nKarnal,NPKUNTA
663	NEFT	62625	2020-11-30	3274482	3274482	\N	1938	Approved	Null	0	SRLDC	Goa(SR)
674	NEFT	3666	2020-11-26	353855	353855	\N	1969	Approved	Null	0	SRLDC	TATA,NPKUNTA
753	NEFT	23434	2020-12-12	52171	52171	\N	1823	Approved	Null	0	SRLDC	ACME\nBhiwadi,NPKUNTA
754	NEFT	hgfgfhhg	2020-11-12	60753	60753	\N	1822	Approved	Null	0	SRLDC	ACME\nHissar,NPKUNTA
751	NEFT	sdfdf	2020-11-12	160872	160872	\N	1964	Approved	Null	0	SRLDC	ACME\nHissar,NPKUNTA
759	NEFT	fdfd	2020-12-10	95783	95783	\N	1967	Approved	Null	0	SRLDC	Azure,NPKUNTA
760	NEFT	ghjghjh	2020-11-12	110002	110002	\N	1966	Approved	Null	0	SRLDC	ACME\nKarnal,NPKUNTA
761	NEFT	gjhghj	2020-12-07	131058	131058	\N	1981	Approved	Null	0	SRLDC	ACME Rewari, PAVAGADA
762	NEFT	gjhgjh	2020-11-27	347352	347352	\N	1965	Approved	Null	0	SRLDC	ACME\nBhiwadi,NPKUNTA
765	NEFT	dsd	2020-12-18	31472710	31472710	\N	2150	Approved	Null	0	SRLDC	Tamil Nadu
767	NEFT	sdsd	2020-12-18	1025870	1025870	\N	2158	Approved	Null	0	SRLDC	NTPC,RSTPS-III
768	NEFT	sdsd	2020-12-18	764489	764489	\N	2160	Approved	Null	0	SRLDC	NTPC,Sim'dri-II
769	NEFT	2121	2020-12-18	10740922	10740922	\N	2162	Approved	Null	0	SRLDC	NTECL
770	NEFT	ddss	2020-12-18	5097984	5097984	\N	2170	Approved	Null	0	SRLDC	SEIL/ TPCIL
771	NEFT	sasas	2020-12-14	1792303	1792303	\N	2166	Approved	Null	0	SRLDC	NLC, II Expn
772	NEFT	21212	2020-12-17	274749	274749	\N	2174	Approved	Null	0	SRLDC	LKPPL III
773	NEFT	323dds	2020-12-10	147840	147840	\N	2167	Approved	Null	0	SRLDC	NTPL
774	NEFT	fdhgfhj	2020-12-18	2826251	2826251	\N	2168	Approved	Null	0	SRLDC	NTPC,Kudgi-Stage I
776	NEFT	dsds	2020-12-17	1205687	1205687	\N	2183	Approved	Null	0	SRLDC	ACME\nBhiwadi,NPKUNTA
766	NEFT	dsds	2020-12-15	1439985	1439985	\N	2156	Approved	Null	0	SRLDC	Goa(SR)
775	NEFT	dsdsd	2020-12-18	1311879	1311879	\N	2182	Approved	Null	0	SRLDC	ACME\nHissar,NPKUNTA
764	NEFT	dss	2020-12-18	671355	671355	\N	2149	Approved	Null	0	SRLDC	Kerala
786	NEFT	sasas	2020-12-18	2220323	2220323	\N	2177	Approved	Null	0	SRLDC	SEIL Project 2
801	NEFT	ddsd	2020-12-10	319307	319307	\N	2154	Approved	Null	0	SRLDC	PUGALUR PGCIL(SR)
808	NEFT	dsdsd	2020-12-10	186393	186393	\N	2155	Approved	Null	0	SRLDC	TRISSUR PGCIL(SR)
777	NEFT	sdsad	2020-12-12	1133284	1133284	\N	2184	Approved	Null	0	SRLDC	ACME\nKarnal,NPKUNTA
778	NEFT	dsdsd	2020-12-11	827045	827045	\N	2185	Approved	Null	0	SRLDC	Azure,NPKUNTA
779	NEFT	fffdfd	2020-12-15	949412	949412	\N	2186	Approved	Null	0	SRLDC	FRV,NPKUNTA
780	NEFT	dsdsd	2020-12-11	2588625	2588625	\N	2187	Approved	Null	0	SRLDC	TATA,NPKUNTA
781	NEFT	sdsd	2020-12-18	6829758	6829758	\N	2188	Approved	Null	0	SRLDC	NTPC,NPKUNTA
784	NEFT	dsdsd	2020-12-15	522234	522234	\N	2189	Approved	Null	0	SRLDC	FRV II,NPKUNTA
788	NEFT	ddsd	2020-12-16	773166	773166	\N	2190	Approved	Null	0	SRLDC	SBG BLOCK 23,24,25 and 26, PAVAGADA
789	NEFT	dsdsd	2020-12-16	534437	534437	\N	2191	Approved	Null	0	SRLDC	SBG, NPKUNTA
790	NEFT	dsdsda	2020-12-17	1071395	1071395	\N	2194	Approved	Null	0	SRLDC	Avaada, PAVAGADA
791	NEFT	sasas	2020-12-18	388731	388731	\N	2195	Approved	Null	0	SRLDC	Adyah Block 1, PAVAGADA
792	NEFT	sasa	2020-12-18	254088	254088	\N	2196	Approved	Null	0	SRLDC	Adyah Block 2, PAVAGADA
793	NEFT	ssas	2020-12-18	189533	189533	\N	2197	Approved	Null	0	SRLDC	Adyah Block 13, PAVAGADA
794	NEFT	sdsd	2020-12-11	1759654	1759654	\N	2198	Approved	Null	0	SRLDC	TATA, PAVAGADA
795	NEFT	dsda	2020-12-18	549576	549576	\N	2199	Approved	Null	0	SRLDC	ACME Kurukshetra, PAVAGADA
796	NEFT	ssdsd	2020-12-18	563491	563491	\N	2200	Approved	Null	0	SRLDC	ACME Rewari, PAVAGADA
797	NEFT	sdsddds	2020-12-18	1101742	1101742	\N	2201	Approved	Null	0	SRLDC	Fortum Finsurya, PAVAGADA
798	NEFT	fdfdf	2020-12-17	270565	270565	\N	2202	Approved	Null	0	SRLDC	Parampujya, PAVAGADA
799	NEFT	dsdsd	2020-12-18	985810	985810	\N	2203	Approved	Null	0	SRLDC	Renew-TN2, PAVAGADA
800	NEFT	sdsds	2020-12-11	448755	448755	\N	2204	Approved	Null	0	SRLDC	Yarrow, PAVAGADA
802	NEFT	sdsd	2020-12-18	257371	257371	\N	2205	Approved	Null	0	SRLDC	Adyah Block 10, PAVAGADA
803	NEFT	sasasa	2020-12-15	202847	202847	\N	2206	Approved	Null	0	SRLDC	Adyah Block 6, PAVAGADA
804	NEFT	saasas	2020-12-18	308234	308234	\N	2207	Approved	Null	0	SRLDC	Adyah Block 3, PAVAGADA
809	NEFT	dsdsd	2020-12-18	954907	954907	\N	2192	Approved	Null	0	SRLDC	Ayana, NPKUNTA
782	NEFT	dsds	2020-12-18	3814160	3814160	\N	2213	Approved	Null	0	SRLDC	GIREL, Tuticorin (Wind)
783	NEFT	sdsad	2020-12-19	4753869	4753869	\N	2214	Approved	Null	0	SRLDC	MYTRAH, Tuticorin (Wind)
785	NEFT	asas	2020-12-14	853955	853955	\N	2215	Approved	Null	0	SRLDC	ORANGE, Tuticorin (Wind)
787	NEFT	sdsdsd	2020-12-16	565252	565252	\N	2216	Approved	Null	0	SRLDC	Betam, Tuticorin (Wind)
805	NEFT	fdf	2020-12-16	1709202	1709202	\N	2208	Approved	Null	0	SRLDC	Fortum Solar, PAVAGADA
806	NEFT	fdfdf	2020-12-15	346753	346753	\N	2210	Approved	Null	0	SRLDC	Azure Earth, PAVAGADA
807	NEFT	ccxzcxz	2020-12-17	1424424	1424424	\N	2211	Approved	Null	0	SRLDC	Avaada Solarise, PAVAGADA
810	NEFT	sdd	2020-12-17	389870	389870	\N	1811	Approved	Null	0	SRLDC	MEPL
811	NEFT	fhhfhg	2020-12-17	384037	384037	\N	1882	Approved	Null	0	SRLDC	MEPL
812	NEFT	fhgfh	2020-12-17	493344	493344	\N	1904	Approved	Null	0	SRLDC	Avaada, PAVAGADA
813	NEFT	fghfhfh	2020-12-17	511612	511612	\N	1921	Approved	Null	0	SRLDC	Avaada Solarise, PAVAGADA
814	NEFT	ghjj	2020-12-16	3919	3919	\N	1998	Approved	Null	0	SRLDC	Betam, Tuticorin
819	NEFT	dsds	2020-12-17	391230	391230	\N	1953	Approved	Null	0	SRLDC	MEPL
820	NEFT	fdff	2020-12-15	169611	169611	\N	1971	Approved	Null	0	SRLDC	FRV II,NPKUNTA
821	NEFT	dsdsd	2020-12-16	1174	1174	\N	2144	Approved	Null	0	SRLDC	Betam, Tuticorin
822	NEFT	dghjgj	2020-12-17	242024	242024	\N	2102	Approved	Null	0	SRLDC	LKPPL III
817	NEFT	sdsd	2020-12-15	1094137	1094137	\N	1968	Approved	Null	0	SRLDC	FRV,NPKUNTA
823	NEFT	dsds	2020-12-17	404678	404678	\N	2099	Approved	Null	0	SRLDC	MEPL
824	NEFT	dsdsd	2020-12-15	1302876	1302876	\N	2114	Approved	Null	0	SRLDC	FRV,NPKUNTA
825	NEFT	dsdsd	2020-12-17	7014714	7014714	\N	2090	Approved	Null	0	SRLDC	NTECL
828	NEFT	qq11212	2020-12-18	335536	335536	\N	2227	Approved	Null	0	SRLDC	PUGALUR PGCIL(SR)
832	NEFT	985698	2020-12-18	198585	198585	\N	2240	Approved	Null	0	SRLDC	NTPL
837	NEFT	1213	2020-12-21	1944753	1944753	\N	2237	Approved	Null	0	SRLDC	NLC, II Stage II
831	NEFT	1231	2020-12-18	1435810	1435810	\N	2260	Approved	Null	0	SRLDC	TATA,NPKUNTA
834	NEFT	98559	2020-12-19	1354865	1354865	\N	2274	Approved	Null	0	SRLDC	Fortum Finsurya, PAVAGADA
836	NEFT	6988	2020-12-21	733914	733914	\N	2277	Approved	Null	0	SRLDC	Yarrow, PAVAGADA
826	NEFT	12345	2020-12-18	253987	253987	\N	2247	Approved	Null	0	SRLDC	LKPPL III
830	NEFT	9668	2020-12-18	1167699	1167699	\N	2267	Approved	Null	0	SRLDC	Avaada, PAVAGADA
833	NEFT	2333	2020-12-19	140791	140791	\N	2283	Approved	Null	0	SRLDC	Azure Earth, PAVAGADA
835	NEFT	142124	2020-12-21	1903560	1903560	\N	2288	Approved	Null	0	SRLDC	ORANGE, Tuticorin (Wind)
851	NEFT	21424	2020-12-29	6417786	6417786	\N	2235	Rejected	date	0	SRLDC	NTECL
852	NEFT	423	2020-12-24	7058122	7058122	\N	2223	Approved	Null	0	SRLDC	Tamil Nadu
858	NEFT	42344	2020-12-24	96612	96612	\N	2220	Approved	Null	0	SRLDC	Andhra Pradesh
827	NEFT	2131w	2020-12-18	223887	223887	\N	2228	Approved	Null	0	SRLDC	TRISSUR PGCIL(SR)
840	NEFT	98668	2020-12-22	981702	981702	\N	2229	Approved	Null	0	SRLDC	Goa(SR)
843	NEFT	4234	2020-12-23	5615918	5615918	\N	2242	Approved	Null	0	SRLDC	NNTPP
848	NEFT	412423	2020-12-23	2311036	2311036	\N	2239	Approved	Null	0	SRLDC	NLC, II Expn
850	NEFT	214	2020-12-24	296196	296196	\N	2245	Approved	Null	0	SRLDC	SEL
866	NEFT	3331	2020-12-24	6417786	6417786	\N	2235	Approved	Null	0	SRLDC	NTECL
853	NEFT	2342344	2020-12-24	471665	471665	\N	2250	Approved	Null	0	SRLDC	SEIL Project 2
861	NEFT	1234414	2020-12-24	10070930	10070930	\N	2243	Approved	Null	0	SRLDC	SEIL/ TPCIL
863	NEFT	12412	2020-12-24	1220132	1220132	\N	2231	Approved	Null	0	SRLDC	NTPC,RSTPS-III
864	NEFT	124124	2020-12-24	1769144	1769144	\N	2233	Approved	Null	0	SRLDC	NTPC,Sim'dri-II
865	NEFT	1244124	2020-12-24	4135763	4135763	\N	2241	Approved	Null	0	SRLDC	NTPC,Kudgi-Stage I
839	NEFT	9966	2020-12-21	843339	843339	\N	2258	Approved	Null	0	SRLDC	Azure,NPKUNTA
841	NEFT	9969	2020-12-22	152441	152441	\N	2266	Approved	Null	0	SRLDC	SPRNG, NPKUNTA
844	NEFT	23421	2020-12-23	770807	770807	\N	2262	Approved	Null	0	SRLDC	FRV II,NPKUNTA
845	NEFT	2345235	2020-12-23	1578187	1578187	\N	2259	Approved	Null	0	SRLDC	FRV,NPKUNTA
847	NEFT	234234	2020-12-23	566368	566368	\N	2255	Approved	Null	0	SRLDC	ACME\nHissar,NPKUNTA
849	NEFT	423424	2020-12-24	1168948	1168948	\N	2265	Approved	Null	0	SRLDC	Ayana, NPKUNTA
854	NEFT	24144	2020-12-24	119029	119029	\N	2270	Approved	Null	0	SRLDC	Adyah Block 13, PAVAGADA
855	NEFT	1244	2020-12-24	57146	57146	\N	2268	Approved	Null	0	SRLDC	Adyah Block 1, PAVAGADA
856	NEFT	341234	2020-12-24	165428	165428	\N	2278	Approved	Null	0	SRLDC	Adyah Block 10, PAVAGADA
857	NEFT	4234234	2020-12-24	56961	56961	\N	2279	Approved	Null	0	SRLDC	Adyah Block 6, PAVAGADA
859	NEFT	12414	2020-12-24	507853	507853	\N	2273	Approved	Null	0	SRLDC	ACME Rewari, PAVAGADA
860	NEFT	142424	2020-12-24	665448	665448	\N	2272	Approved	Null	0	SRLDC	ACME Kurukshetra, PAVAGADA
862	NEFT	124124124	2020-12-24	8623817	8623817	\N	2261	Approved	Null	0	SRLDC	NTPC,NPKUNTA
829	NEFT	22332	2020-12-18	550804	550804	\N	2284	Approved	Null	0	SRLDC	Avaada Solarise, PAVAGADA
838	NEFT	98568	2020-12-21	959763	959763	\N	2281	Approved	Null	0	SRLDC	Fortum Solar, PAVAGADA
842	NEFT	34234	2020-12-22	6509460	6509460	\N	2287	Approved	Null	0	SRLDC	MYTRAH, Tuticorin (Wind)
846	NEFT	134124	2020-12-23	94144	94144	\N	2280	Approved	Null	0	SRLDC	Adyah Block 3, PAVAGADA
867	NEFT	ghfgh	2020-12-22	3395	3395	\N	2139	Approved	Null	0	SRLDC	SPRNG, NPKUNTA
868	NEFT	ffghgh	2020-12-22	2024	2024	\N	2212	Approved	Null	0	SRLDC	SPRNG, NPKUNTA
869	NEFT	fhgfgh	2020-12-24	235182	235182	\N	2100	Approved	Null	0	SRLDC	SEL
870	NEFT	ghjg	2020-12-24	228114	228114	\N	2172	Approved	Null	0	SRLDC	SEL
871	NEFT	gjh	2020-12-22	137700	137700	\N	2193	Approved	Null	0	SRLDC	SPRNG, NPKUNTA
872	NEFT	dsfdf	2021-01-05	18260477	18260477	\N	2294	Approved	Null	0	SRLDC	Kerala
886	NEFT	dgshjdj	2020-12-31	5145603	5145603	\N	2359	Approved	Null	0	SRLDC	MYTRAH, Tuticorin (Wind)
885	NEFT	gdhjgjd	2021-01-01	743633	743633	\N	2333	Approved	Null	0	SRLDC	NTPC,NPKUNTA
884	NEFT	dgjshd	2020-12-30	5583493	5583493	\N	2314	Approved	Null	0	SRLDC	NNTPP
883	NEFT	dsfdghfh	2021-01-01	4977761	4977761	\N	2313	Approved	Null	0	SRLDC	NTPC,Kudgi-Stage I
882	NEFT	sdsd	2020-12-29	74714	74714	\N	2312	Approved	Null	0	SRLDC	NTPL
881	NEFT	gdhjs	2020-12-29	600233	600233	\N	2321	Approved	Null	0	SRLDC	IL&FS
880	NEFT	dghjsdjg	2020-12-30	2494004	2494004	\N	2311	Approved	Null	0	SRLDC	NLC, II Expn
879	NEFT	dhgfsdgh	2020-12-31	10278026	10278026	\N	2296	Approved	Null	0	SRLDC	Telangana
878	NEFT	dds	2020-12-31	5757274	5757274	\N	2315	Approved	Null	0	SRLDC	SEIL/ TPCIL
877	NEFT	fghjf	2021-01-01	1460180	1460180	\N	2304	Approved	Null	0	SRLDC	NTPC,Talcher-II
876	NEFT	ghfgh	2021-01-01	3961341	3961341	\N	2305	Approved	Null	0	SRLDC	NTPC,Sim'dri-II
875	NEFT	fdf	2021-01-01	2920913	2920913	\N	2303	Approved	Null	0	SRLDC	NTPC,RSTPS-III
874	NEFT	fdfdf	2020-12-30	1249860	1249860	\N	2301	Approved	Null	0	SRLDC	Goa(SR)
873	NEFT	fdfd	2020-12-31	51706563	51706563	\N	2295	Approved	Null	0	SRLDC	Tamil Nadu
892	NEFT	djfgjhgfjh	2020-12-24	259230	259230	\N	2300	Approved	Null	0	SRLDC	TRISSUR PGCIL(SR)
891	NEFT	fff	2020-12-24	435313	435313	\N	2299	Approved	Null	0	SRLDC	PUGALUR PGCIL(SR)
890	NEFT	dsdds	2020-12-30	14534	14534	\N	2348	Approved	Null	0	SRLDC	Renew-TN2, PAVAGADA
889	NEFT	fdff	2020-12-28	356359	356359	\N	2361	Approved	Null	0	SRLDC	Betam, Tuticorin (Wind)
888	NEFT	dsgdhj	2020-12-28	50242	50242	\N	2322	Approved	Null	0	SRLDC	SEIL Project 2
887	NEFT	dsfhdfghs	2020-12-30	346240	346240	\N	2360	Approved	Null	0	SRLDC	ORANGE, Tuticorin (Wind)
893	NEFT	fdfd	2020-12-29	433059	433059	\N	2263	Approved	Null	0	SRLDC	SBG BLOCK 23,24,25 and 26, PAVAGADA
894	NEFT	fdfdf	2020-12-29	585654	585654	\N	2276	Approved	Null	0	SRLDC	Renew-TN2, PAVAGADA
895	NEFT	fdfd	2020-12-29	1014476	1014476	\N	2264	Approved	Null	0	SRLDC	SBG, NPKUNTA
896	NEFT	fffdf	2020-12-28	1388403	1388403	\N	2289	Approved	Null	0	SRLDC	Betam, Tuticorin (Wind)
897	NEFT	dfdf	2020-12-29	1605332	1605332	\N	2275	Approved	Null	0	SRLDC	Parampujya, PAVAGADA
898	NEFT	eer	2020-12-29	5686044	5686044	\N	2286	Approved	Null	0	SRLDC	GIREL, Tuticorin (Wind)
899	NEFT	ggj	2021-01-01	5027734	5027734	\N	2307	Approved	Null	0	SRLDC	NTECL
900	NEFT	fdfdf	2021-01-06	87532	87532	jk	2209	Rejected	rejected	87532	SRLDC	KREDL, PAVAGADA
901	NEFT	dgfdg	2021-01-06	400000	485076	fgh	2316	Created	Null	85076	SRLDC	MEPL
\.


--
-- Data for Name: WeeklyUpload_surchargemodel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WeeklyUpload_surchargemodel" (id, year, month, srpc_duedate, devfinal, paid_date, paid_amount, calinterest, reference_id_id, "Status", actual_paid_date, "isConsideredInBilling") FROM stdin;
\.


--
-- Data for Name: WeeklyUpload_tempdisbursedata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WeeklyUpload_tempdisbursedata" (id, disburseamount, duetopool, registration_id_id) FROM stdin;
502	15015509	0	2075
503	44393484	0	2076
504	8452886	0	2077
505	24326515	0	2079
506	5498328	0	2080
507	964287	0	2081
508	1207894	0	2085
509	8291770	0	2091
510	5739978	0	2092
511	2010262	0	2093
512	1524717	0	2097
513	10561	0	2104
514	582781	0	2110
515	400631	0	2111
516	350803	0	2112
517	738493	0	2113
518	921559	0	2115
519	653069	0	2117
520	1623112	0	2118
521	805039	0	2119
522	1194975	0	2121
523	394686	0	2123
524	338037	0	2124
525	5186250	0	2125
526	179318	0	2126
527	392501	0	2127
528	620451	0	2128
529	3384521	0	2129
530	582374	0	2130
531	935988	0	2131
532	357994	0	2132
533	421940	0	2133
534	130596	0	2134
535	1099515	0	2135
536	263907	0	2136
537	493279	0	2137
538	1539260	0	2138
539	407660	0	2143
540	0	161494368	2107
541	16563460	0	2147
542	14331910	0	2148
543	16592383	0	2151
544	5164134	0	2152
545	1126234	0	2153
546	4635739	0	2157
547	1876161	0	2159
548	1231424	0	2161
549	4391095	0	2163
550	4123324	0	2164
551	2774818	0	2165
552	1216474	0	2169
553	81785	0	2176
554	2722	0	2181
555	0	62929954	2178
556	17545239	0	2221
557	99079	0	2222
558	1190537	0	2224
559	3131745	0	2225
560	1178863	0	2226
561	4416205	0	2230
562	2763488	0	2232
563	3339218	0	2234
564	396768	0	2236
565	2436829	0	2238
566	140602	0	2249
567	308876	0	2256
568	77128	0	2257
569	14278	0	2269
570	912258	0	2271
571	203051	0	2282
572	0	61133010	2251
610	1295854	0	2292
611	11797460	0	2293
612	5091344	0	2297
613	1095101	0	2298
614	2900734	0	2302
615	4213208	0	2306
616	3787121	0	2308
617	2440449	0	2309
618	1198647	0	2310
619	977090	0	2327
620	2336053	0	2328
621	1998237	0	2329
622	682426	0	2330
623	1149692	0	2332
624	364950	0	2334
625	1563307	0	2335
626	1067914	0	2336
627	497663	0	2338
628	339567	0	2339
629	104788	0	2340
630	142310	0	2341
631	200186	0	2342
632	3402072	0	2343
633	13502	0	2344
634	199794	0	2345
635	79634	0	2346
636	1482875	0	2347
637	883671	0	2349
638	58914	0	2350
639	243120	0	2351
640	196576	0	2352
641	493643	0	2353
642	174614	0	2354
643	504923	0	2355
644	1092594	0	2356
645	0	0	2357
646	0	131858932	2323
\.


--
-- Data for Name: WeeklyUpload_tempdisbursedatapreviousweeks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WeeklyUpload_tempdisbursedatapreviousweeks" (id, disburseamount, duetopool, registration_id_id) FROM stdin;
\.


--
-- Data for Name: WeeklyUpload_uniquestate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WeeklyUpload_uniquestate" (id, entity, registration_id) FROM stdin;
1	Andhra Pradesh	SRAP
2	Karnataka	SRKAR
3	Kerala	SRKL
4	Tamil Nadu	SRTN
5	Telangana	SRTG
6	Puducherry	SRPONDY
7	PGCIL(SR)	SRPG
8	Goa(SR)	SRGOA
\.


--
-- Data for Name: YearCalendar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."YearCalendar" (id, year, weekno, "Week_startdate", "Week_enddate", srpc_date, due_date, disbursement_date) FROM stdin;
1	2020-21	1	2020-03-30	2020-04-05	2020-04-14	2020-04-24	2020-04-27
2	2020-21	2	2020-04-06	2020-04-12	2020-04-21	2020-05-01	2020-05-04
3	2020-21	3	2020-04-13	2020-04-19	2020-04-28	2020-05-08	2020-05-11
4	2020-21	4	2020-04-20	2020-04-26	2020-05-05	2020-05-15	2020-05-18
5	2020-21	5	2020-04-27	2020-05-03	2020-05-12	2020-05-22	2020-05-25
6	2020-21	6	2020-05-04	2020-05-10	2020-05-19	2020-05-29	2020-06-01
7	2020-21	7	2020-05-11	2020-05-17	2020-05-26	2020-06-05	2020-06-08
8	2020-21	8	2020-05-18	2020-05-24	2020-06-02	2020-06-12	2020-06-15
9	2020-21	9	2020-05-25	2020-05-31	2020-06-09	2020-06-19	2020-06-22
10	2020-21	10	2020-06-01	2020-06-07	2020-06-16	2020-06-26	2020-06-29
11	2020-21	11	2020-06-08	2020-06-14	2020-06-23	2020-07-03	2020-07-06
12	2020-21	12	2020-06-15	2020-06-21	2020-06-30	2020-07-10	2020-07-13
13	2020-21	13	2020-06-22	2020-06-28	2020-07-07	2020-07-17	2020-07-20
14	2020-21	14	2020-06-29	2020-07-05	2020-07-14	2020-07-24	2020-07-27
15	2020-21	15	2020-07-06	2020-07-12	2020-07-21	2020-07-31	2020-08-03
16	2020-21	16	2020-07-13	2020-07-19	2020-07-28	2020-08-07	2020-08-10
17	2020-21	17	2020-07-20	2020-07-26	2020-08-04	2020-08-14	2020-08-17
18	2020-21	18	2020-07-27	2020-08-02	2020-08-11	2020-08-21	2020-08-24
19	2020-21	19	2020-08-03	2020-08-09	2020-08-18	2020-08-28	2020-08-31
20	2020-21	20	2020-08-10	2020-08-16	2020-08-25	2020-09-04	2020-09-07
21	2020-21	21	2020-08-17	2020-08-23	2020-09-01	2020-09-11	2020-09-14
22	2020-21	22	2020-08-24	2020-08-30	2020-09-08	2020-09-18	2020-09-21
23	2020-21	23	2020-08-31	2020-09-06	2020-09-15	2020-09-25	2020-09-28
24	2020-21	24	2020-09-07	2020-09-13	2020-09-22	2020-10-02	2020-10-05
25	2020-21	25	2020-09-14	2020-09-20	2020-09-29	2020-10-09	2020-10-12
26	2020-21	26	2020-09-21	2020-09-27	2020-10-06	2020-10-16	2020-10-19
27	2020-21	27	2020-09-28	2020-10-04	2020-10-13	2020-10-23	2020-10-26
28	2020-21	28	2020-10-05	2020-10-11	2020-10-20	2020-10-30	2020-11-02
29	2020-21	29	2020-10-12	2020-10-18	2020-10-27	2020-11-06	2020-11-09
30	2020-21	30	2020-10-19	2020-10-25	2020-11-03	2020-11-13	2020-11-16
31	2020-21	31	2020-10-26	2020-11-01	2020-11-10	2020-11-20	2020-11-23
32	2020-21	32	2020-11-02	2020-11-08	2020-11-17	2020-11-27	2020-11-30
33	2020-21	33	2020-11-09	2020-11-15	2020-11-24	2020-12-04	2020-12-07
34	2020-21	34	2020-11-16	2020-11-22	2020-12-01	2020-12-11	2020-12-14
35	2020-21	35	2020-11-23	2020-11-29	2020-12-08	2020-12-18	2020-12-21
36	2020-21	36	2020-11-30	2020-12-06	2020-12-15	2020-12-25	2020-12-28
37	2020-21	37	2020-12-07	2020-12-13	2020-12-22	2021-01-01	2021-01-04
38	2020-21	38	2020-12-14	2020-12-20	2020-12-29	2021-01-08	2021-01-11
39	2020-21	39	2020-12-21	2020-12-27	2021-01-05	2021-01-15	2021-01-18
40	2020-21	40	2020-12-28	2021-01-03	2021-01-12	2021-01-22	2021-01-25
41	2020-21	41	2021-01-04	2021-01-10	2021-01-19	2021-01-29	2021-02-01
42	2020-21	42	2021-01-11	2021-01-17	2021-01-26	2021-02-05	2021-02-08
43	2020-21	43	2021-01-18	2021-01-24	2021-02-02	2021-02-12	2021-02-15
44	2020-21	44	2021-01-25	2021-01-31	2021-02-09	2021-02-19	2021-02-22
45	2020-21	45	2021-02-01	2021-02-07	2021-02-16	2021-02-26	2021-03-01
46	2020-21	46	2021-02-08	2021-02-14	2021-02-23	2021-03-05	2021-03-08
47	2020-21	47	2021-02-15	2021-02-21	2021-03-02	2021-03-12	2021-03-15
48	2020-21	48	2021-02-22	2021-02-28	2021-03-09	2021-03-19	2021-03-22
49	2020-21	49	2021-03-01	2021-03-07	2021-03-16	2021-03-26	2021-03-29
50	2020-21	50	2021-03-08	2021-03-14	2021-03-23	2021-04-02	2021-04-05
51	2020-21	51	2021-03-15	2021-03-21	2021-03-30	2021-04-09	2021-04-12
52	2020-21	52	2021-03-22	2021-03-28	2021-04-06	2021-04-16	2021-04-19
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add approved	6	add_approved
22	Can change approved	6	change_approved
23	Can delete approved	6	delete_approved
24	Can view approved	6	view_approved
25	Can add form data	7	add_formdata
26	Can change form data	7	change_formdata
27	Can delete form data	7	delete_formdata
28	Can view form data	7	view_formdata
29	Can add rejected	8	add_rejected
30	Can change rejected	8	change_rejected
31	Can delete rejected	8	delete_rejected
32	Can view rejected	8	view_rejected
33	Can add user	9	add_user
34	Can change user	9	change_user
35	Can delete user	9	delete_user
36	Can view user	9	view_user
37	Can add configure model	10	add_configuremodel
38	Can change configure model	10	change_configuremodel
39	Can delete configure model	10	delete_configuremodel
40	Can view configure model	10	view_configuremodel
41	Can add Token	11	add_token
42	Can change Token	11	change_token
43	Can delete Token	11	delete_token
44	Can view Token	11	view_token
45	Can add state id	12	add_stateid
46	Can change state id	12	change_stateid
47	Can delete state id	12	delete_stateid
48	Can view state id	12	view_stateid
49	Can add unique state	13	add_uniquestate
50	Can change unique state	13	change_uniquestate
51	Can delete unique state	13	delete_uniquestate
52	Can view unique state	13	view_uniquestate
53	Can add payment details	14	add_paymentdetails
54	Can change payment details	14	change_paymentdetails
55	Can delete payment details	14	delete_paymentdetails
56	Can view payment details	14	view_paymentdetails
57	Can add payment status	15	add_paymentstatus
58	Can change payment status	15	change_paymentstatus
59	Can delete payment status	15	delete_paymentstatus
60	Can view payment status	15	view_paymentstatus
61	Can add applicant images	16	add_applicantimages
62	Can change applicant images	16	change_applicantimages
63	Can delete applicant images	16	delete_applicantimages
64	Can view applicant images	16	view_applicantimages
65	Can add bank details	17	add_bankdetails
66	Can change bank details	17	change_bankdetails
67	Can delete bank details	17	delete_bankdetails
68	Can view bank details	17	view_bankdetails
69	Can add approved1	18	add_approved1
70	Can change approved1	18	change_approved1
71	Can delete approved1	18	delete_approved1
72	Can view approved1	18	view_approved1
73	Can add old contact details	19	add_oldcontactdetails
74	Can change old contact details	19	change_oldcontactdetails
75	Can delete old contact details	19	delete_oldcontactdetails
76	Can view old contact details	19	view_oldcontactdetails
77	Can add old contact	20	add_oldcontact
78	Can change old contact	20	change_oldcontact
79	Can delete old contact	20	delete_oldcontact
80	Can view old contact	20	view_oldcontact
81	Can add old details	21	add_olddetails
82	Can change old details	21	change_olddetails
83	Can delete old details	21	delete_olddetails
84	Can view old details	21	view_olddetails
85	Can add old bank details	22	add_oldbankdetails
86	Can change old bank details	22	change_oldbankdetails
87	Can delete old bank details	22	delete_oldbankdetails
88	Can view old bank details	22	view_oldbankdetails
89	Can add old bank details2	23	add_oldbankdetails2
90	Can change old bank details2	23	change_oldbankdetails2
91	Can delete old bank details2	23	delete_oldbankdetails2
92	Can view old bank details2	23	view_oldbankdetails2
93	Can add bank edited images	24	add_bankeditedimages
94	Can change bank edited images	24	change_bankeditedimages
95	Can delete bank edited images	24	delete_bankeditedimages
96	Can view bank edited images	24	view_bankeditedimages
97	Can add bills ledger	25	add_billsledger
98	Can change bills ledger	25	change_billsledger
99	Can delete bills ledger	25	delete_billsledger
100	Can view bills ledger	25	view_billsledger
101	Can add srpc files	26	add_srpcfiles
102	Can change srpc files	26	change_srpcfiles
103	Can delete srpc files	26	delete_srpcfiles
104	Can view srpc files	26	view_srpcfiles
105	Can add chat messages	27	add_chatmessages
106	Can change chat messages	27	change_chatmessages
107	Can delete chat messages	27	delete_chatmessages
108	Can view chat messages	27	view_chatmessages
109	Can add chat all messages	28	add_chatallmessages
110	Can change chat all messages	28	change_chatallmessages
111	Can delete chat all messages	28	delete_chatallmessages
112	Can view chat all messages	28	view_chatallmessages
113	Can add final pay disburse	29	add_finalpaydisburse
114	Can change final pay disburse	29	change_finalpaydisburse
115	Can delete final pay disburse	29	delete_finalpaydisburse
116	Can view final pay disburse	29	view_finalpaydisburse
117	Can add final receive disburse	30	add_finalreceivedisburse
118	Can change final receive disburse	30	change_finalreceivedisburse
119	Can delete final receive disburse	30	delete_finalreceivedisburse
120	Can view final receive disburse	30	view_finalreceivedisburse
121	Can add dsm due pool	31	add_dsmduepool
122	Can change dsm due pool	31	change_dsmduepool
123	Can delete dsm due pool	31	delete_dsmduepool
124	Can view dsm due pool	31	view_dsmduepool
125	Can add general entities	32	add_generalentities
126	Can change general entities	32	change_generalentities
127	Can delete general entities	32	delete_generalentities
128	Can view general entities	32	view_generalentities
129	Can add employee user	33	add_employeeuser
130	Can change employee user	33	change_employeeuser
131	Can delete employee user	33	delete_employeeuser
132	Can view employee user	33	view_employeeuser
133	Can add employee user1	34	add_employeeuser1
134	Can change employee user1	34	change_employeeuser1
135	Can delete employee user1	34	delete_employeeuser1
136	Can view employee user1	34	view_employeeuser1
137	Can add general entities1	35	add_generalentities1
138	Can change general entities1	35	change_generalentities1
139	Can delete general entities1	35	delete_generalentities1
140	Can view general entities1	35	view_generalentities1
141	Can add final pay disburse1	36	add_finalpaydisburse1
142	Can change final pay disburse1	36	change_finalpaydisburse1
143	Can delete final pay disburse1	36	delete_finalpaydisburse1
144	Can view final pay disburse1	36	view_finalpaydisburse1
145	Can add final receive disburse1	37	add_finalreceivedisburse1
146	Can change final receive disburse1	37	change_finalreceivedisburse1
147	Can delete final receive disburse1	37	delete_finalreceivedisburse1
148	Can view final receive disburse1	37	view_finalreceivedisburse1
149	Can add year calendar	38	add_yearcalendar
150	Can change year calendar	38	change_yearcalendar
151	Can delete year calendar	38	delete_yearcalendar
152	Can view year calendar	38	view_yearcalendar
153	Can add surcharge model	39	add_surchargemodel
154	Can change surcharge model	39	change_surchargemodel
155	Can delete surcharge model	39	delete_surchargemodel
156	Can view surcharge model	39	view_surchargemodel
157	Can add disbursed date	40	add_disburseddate
158	Can change disbursed date	40	change_disburseddate
159	Can delete disbursed date	40	delete_disburseddate
160	Can view disbursed date	40	view_disburseddate
161	Can add misc payment status	41	add_miscpaymentstatus
162	Can change misc payment status	41	change_miscpaymentstatus
163	Can delete misc payment status	41	delete_miscpaymentstatus
164	Can view misc payment status	41	view_miscpaymentstatus
165	Can add employee signs	42	add_employeesigns
166	Can change employee signs	42	change_employeesigns
167	Can delete employee signs	42	delete_employeesigns
168	Can view employee signs	42	view_employeesigns
169	Can add mo employee user	43	add_moemployeeuser
170	Can change mo employee user	43	change_moemployeeuser
171	Can delete mo employee user	43	delete_moemployeeuser
172	Can view mo employee user	43	view_moemployeeuser
173	Can add approve authority	44	add_approveauthority
174	Can change approve authority	44	change_approveauthority
175	Can delete approve authority	44	delete_approveauthority
176	Can view approve authority	44	view_approveauthority
177	Can add temp disburse data	45	add_tempdisbursedata
178	Can change temp disburse data	45	change_tempdisbursedata
179	Can delete temp disburse data	45	delete_tempdisbursedata
180	Can view temp disburse data	45	view_tempdisbursedata
181	Can add approve authority previous weeks	46	add_approveauthoritypreviousweeks
182	Can change approve authority previous weeks	46	change_approveauthoritypreviousweeks
183	Can delete approve authority previous weeks	46	delete_approveauthoritypreviousweeks
184	Can view approve authority previous weeks	46	view_approveauthoritypreviousweeks
185	Can add temp disburse data previous weeks	47	add_tempdisbursedatapreviousweeks
186	Can change temp disburse data previous weeks	47	change_tempdisbursedatapreviousweeks
187	Can delete temp disburse data previous weeks	47	delete_tempdisbursedatapreviousweeks
188	Can view temp disburse data previous weeks	47	view_tempdisbursedatapreviousweeks
189	Can add test model	48	add_testmodel
190	Can change test model	48	change_testmodel
191	Can delete test model	48	delete_testmodel
192	Can view test model	48	view_testmodel
193	Can add srpcreact files	49	add_srpcreactfiles
194	Can change srpcreact files	49	change_srpcreactfiles
195	Can delete srpcreact files	49	delete_srpcreactfiles
196	Can view srpcreact files	49	view_srpcreactfiles
197	Can add react base data	50	add_reactbasedata
198	Can change react base data	50	change_reactbasedata
199	Can delete react base data	50	delete_reactbasedata
200	Can view react base data	50	view_reactbasedata
201	Can add re payment status	51	add_repaymentstatus
202	Can change re payment status	51	change_repaymentstatus
203	Can delete re payment status	51	delete_repaymentstatus
204	Can view re payment status	51	view_repaymentstatus
205	Can add react due pool	52	add_reactduepool
206	Can change react due pool	52	change_reactduepool
207	Can delete react due pool	52	delete_reactduepool
208	Can view react due pool	52	view_reactduepool
209	Can add react disbursed date	53	add_reactdisburseddate
210	Can change react disbursed date	53	change_reactdisburseddate
211	Can delete react disbursed date	53	delete_reactdisburseddate
212	Can view react disbursed date	53	view_reactdisburseddate
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
157fcb5eb03e99c3cddf00fd4fae3830ef8514f2	2020-09-24 11:06:34.731602+05:30	1
4fac2988ad475578908450d25995661a0d7dc674	2020-09-24 12:08:08.292617+05:30	93
ba1500a07c7568dda55fb2bab02a7c84eae0368a	2020-09-24 12:18:11.845601+05:30	96
10712a5d7ce12b67a6d8eca8905fbdd7da22b849	2020-09-24 12:18:51.545251+05:30	94
07300d8fd536fa5da5e7059f2926a9cc60a86838	2020-09-24 12:38:46.218157+05:30	95
40b5d6e716fc914df78e402f453a0c5d5ff91e5b	2020-09-24 12:47:45.174022+05:30	97
efb5137b602ab273afc2ddacc5be9cb302b9f941	2020-09-24 12:51:08.417533+05:30	98
d9849de81d1befceebc4c4fe880ad9dd949650f7	2020-09-24 12:53:58.673074+05:30	105
006bf44c0fe386261368f064ca2db0594074ea67	2020-09-24 13:46:52.61206+05:30	106
7c590cbaf5210607c184d560ffe5bbf265204366	2020-09-24 13:50:58.89421+05:30	107
b1f275b6dc4e0a9f23f65462e5e385e78a29717f	2020-09-24 13:53:00.905069+05:30	108
1eea15b7f1c76d65df0e6377fa01ca394cba9c80	2020-09-24 13:56:15.754483+05:30	109
4864e7a3e1ff450487bc5abdab1f66bcc15f77b7	2020-09-24 13:58:52.507677+05:30	110
fe4ee2aa017738016a75f1572d9dac05168c06ae	2020-09-24 14:04:06.011294+05:30	111
d514181a8182cb7b904fb41ee6750521d5640dfd	2020-09-24 14:08:39.908855+05:30	112
b7dfde20690869b13b6b2318de1fb0ab7a6266df	2020-09-24 14:10:01.341557+05:30	113
f3eec0e27341b8acbb831e27a990de4779e4fdcc	2020-09-24 14:12:08.328762+05:30	114
0ff6062eb51e650fac90ea38605d085cf274734f	2020-09-24 14:14:40.880348+05:30	115
e416c7ae3b3d24dbe2e1668991cd68d0585cefd1	2020-09-24 14:16:16.601307+05:30	116
00b0ea4a922a66982aad7ccbbe2832487f4c9fab	2020-09-24 14:18:08.882559+05:30	117
9f8dc6b50488ba26a4856375af7f1012b8e46ff8	2020-09-24 14:20:02.10187+05:30	118
234011d165ff35e32b7bf0881c90982cd87a0ffd	2020-09-24 16:22:31.594924+05:30	119
b1333aaaa78babff21eb9bcdb949b8ff5f152124	2020-09-29 12:21:36.535513+05:30	120
ade7367eed7c81ab5135bd756510b921d99d45eb	2020-09-29 14:35:53.485296+05:30	123
a0699833a3d3fbf6796352483deca232f78495ff	2020-09-29 14:41:02.789085+05:30	124
9f732f432a30e1de14c89a0b9126ab74cafe2a75	2020-09-29 14:43:25.435251+05:30	125
520d2dd64a3238e8e99886d2a437c4674007b71d	2020-09-29 14:46:45.790391+05:30	161
e03550993e9b9bd32faac48690d69745390c25d2	2020-09-29 14:51:40.207234+05:30	160
19d6404fc6348be43364cdf07f64258b2b62f3cd	2020-09-29 14:52:14.559957+05:30	126
9cb9fc36ca76693237e76d24181c846963dd6f77	2020-09-29 14:53:34.39427+05:30	127
96f76d22b5a93efad74b418b9efc4b2308189a6d	2020-09-29 14:55:28.063617+05:30	159
52fc212942a87b497a10c6e2e52d775d2189af12	2020-09-29 14:56:27.547672+05:30	158
57fd47db66b9ba0c88fe01a20f8ff393a127ec37	2020-09-29 14:56:42.320533+05:30	128
a0de091be4a23ceebc0b51594c798832c8ea1442	2020-09-29 14:58:07.850547+05:30	129
a7aa5187a967f9c035edad9dd38643a799222bef	2020-09-29 15:03:07.870976+05:30	130
e5113e423662618ba498b68cdbc94bcbd533a8d1	2020-09-29 15:04:38.698207+05:30	131
ebbc957f8f441db437327696f82c945fed9c68e2	2020-09-29 15:05:30.821748+05:30	157
efc4d44a4a9416d73d5bcfb63de9a460f7d0da95	2020-09-29 15:06:23.136167+05:30	132
041dc4922c79bfe3ac4d9f99ff4cd55585fa6591	2020-09-29 15:07:38.134443+05:30	156
306335451e70c616efbbd4a909de33a1a5168982	2020-09-29 15:07:46.20941+05:30	133
41bb7046aa4cef990b6440677fcf6466cc3aa984	2020-09-29 15:09:04.580756+05:30	134
ba05d14139900f10413c40854cebfa250384ee49	2020-09-29 15:09:27.89347+05:30	155
b7b63e7344c0efdc957a7216f4e96cc8aae954e2	2020-09-29 15:16:48.064164+05:30	154
965fd9ace303a25eb5805bc54e23bd85da10c37e	2020-09-29 15:22:10.180305+05:30	150
9819296fcc52ad3a0e49dbf7a5b2efb5dd3b5d1b	2020-09-29 15:22:44.950227+05:30	135
1c7f131ea4bc2c92dfab9018273e8b4e14213fdb	2020-09-29 15:24:03.056516+05:30	149
777098080d794724b4bbd1f7b98b847abbc29891	2020-09-29 15:24:25.066488+05:30	136
8491604a2a832341ebeb608f3424173b5e24978b	2020-09-29 15:25:35.186949+05:30	148
31da8aa3e9935ce8b7e7950318feb7b275fc71d2	2020-09-29 15:26:24.965082+05:30	137
13abe0281fe265cbe448c69fa01c5652b770405d	2020-09-29 15:26:44.045015+05:30	147
03deefda546d4354076e3dabdde0014736c3d911	2020-09-29 15:29:10.3126+05:30	146
106529ad4d39411ff26a5e297e4b9ebd46021a6e	2020-09-29 15:29:27.67398+05:30	138
cb8ce54921c5cc808c6de0d5d8c306b96b484b08	2020-09-29 15:30:02.855663+05:30	139
b871e4d2276629d605f9d7ddbd11320bb4fd8ff1	2020-09-29 15:30:13.373203+05:30	145
55c27591693f66b59abc5f05b99ebbdd2dd00ede	2020-09-29 15:31:37.141003+05:30	140
9ca3c86a28cdb839f1b661643936a25e78d34d77	2020-09-29 15:34:16.819871+05:30	144
8365992f1fcc82e430ed2c1966165a1bd19f4850	2020-09-29 16:45:49.181299+05:30	162
b1198b15568bbbd055a88b6913481646dfbebcbe	2020-09-30 16:13:54.356195+05:30	176
e9044a6289173b164012460e8ca40bb9b332fc67	2020-09-30 16:17:51.890772+05:30	164
ef611f3ca8726b0670fab100b7315c301805ada1	2020-09-30 16:18:56.16049+05:30	165
bf5e64a0acd996ec13742db9f6769c7a287203a4	2020-09-30 16:20:08.121542+05:30	166
ee4b436e67b1f7c1593e6db75a228d419028fbcc	2020-09-30 16:22:29.534668+05:30	168
ff08d0e213d724e030c71088af56af12e43bd933	2020-09-30 16:22:55.074064+05:30	169
99bae1a860612d8f7645850a136f5ab1218238a5	2020-09-30 16:24:37.06508+05:30	174
cb69e67cf8fccc4dabd3b789e7b251e75f9a9811	2020-09-30 16:25:38.981216+05:30	172
753f1b638acd3355995db536e65268fe19c6da63	2020-09-30 16:28:29.068725+05:30	173
b77029ddedb6e47d7717c8a805df353e13dc58db	2020-09-30 16:29:09.255589+05:30	175
a70cc48ea57f41d51fe76c38e2c9757558138931	2020-11-10 11:39:50.127025+05:30	178
cfadfb5b224086aa3e687c7b8a1860d37f1b42eb	2020-11-17 14:26:11.685239+05:30	179
0b924f39675d1798e6f8a5d4c44f87868ee25275	2020-12-05 12:15:11.202872+05:30	191
53d4ea42b674cdfe5dede4703c3d0e7e67327462	2020-12-05 12:15:23.31433+05:30	189
3ec0dd034b1b4f450e911d5682dd4747577a4f70	2020-12-05 12:15:30.126676+05:30	190
\.


--
-- Data for Name: bank_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bank_images (id, "entityName", image_url) FROM stdin;
1	MTL	127.0.0.1:8000/static/images/MTL/undefinedinvoice227177.pdf
2	MTL	127.0.0.1:8000/static/images/MTL/DSMinvoice278910.pdf
3	MTL	127.0.0.1:8000/static/images/MTL/DSMAmazon.in - Order 406-9709807-051870302773.pdf
4	SRMTL	127.0.0.1:8000/static/images/SRMTL/undefinedJune Attendance19823.pdf
5	SRRSTCL	127.0.0.1:8000/static/images/SRRSTCL/DSMOrange Sironj99804.pdf
6	SRSBG12	127.0.0.1:8000/static/images/SRSBG12/DSMsample-cheque229014.jpg
\.


--
-- Data for Name: bankdetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bankdetails (id, accountname, bankname, accountnumber, branchname, ifsccode, validfrom, validtill) FROM stdin;
1	SRLDC MO	AXIS 	123456	MALLESHWARAM	AXIN123BN	2016-07-22	2020-05-03
2	MO POOL ACCOUNT 1	INDIAN BANK	123456	RACE COURSE ROAD	INDB234RF	2020-07-06	2020-10-28
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-06-01 14:59:45.96836+05:30	2	AP	1	[{"added": {}}]	9	1
2	2020-06-01 16:19:59.170286+05:30	2	AP	3		9	1
3	2020-06-01 16:20:51.800431+05:30	3	AP	1	[{"added": {}}]	9	1
4	2020-06-01 16:21:23.184933+05:30	4	TG	1	[{"added": {}}]	9	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	Registration	approved
7	Registration	formdata
8	Registration	rejected
9	Registration	user
10	WeeklyUpload	configuremodel
11	authtoken	token
12	WeeklyUpload	stateid
13	WeeklyUpload	uniquestate
14	WeeklyUpload	paymentdetails
15	WeeklyUpload	paymentstatus
16	Registration	applicantimages
17	Registration	bankdetails
18	Registration	approved1
19	Registration	oldcontactdetails
20	Registration	oldcontact
21	Registration	olddetails
22	Registration	oldbankdetails
23	Registration	oldbankdetails2
24	Registration	bankeditedimages
25	WeeklyUpload	billsledger
26	WeeklyUpload	srpcfiles
27	WeeklyUpload	chatmessages
28	WeeklyUpload	chatallmessages
29	WeeklyUpload	finalpaydisburse
30	WeeklyUpload	finalreceivedisburse
31	WeeklyUpload	dsmduepool
32	Registration	generalentities
33	Registration	employeeuser
34	Registration	employeeuser1
35	Registration	generalentities1
36	WeeklyUpload	finalpaydisburse1
37	WeeklyUpload	finalreceivedisburse1
38	WeeklyUpload	yearcalendar
39	WeeklyUpload	surchargemodel
40	WeeklyUpload	disburseddate
41	WeeklyUpload	miscpaymentstatus
42	Registration	employeesigns
43	WeeklyUpload	moemployeeuser
44	WeeklyUpload	approveauthority
45	WeeklyUpload	tempdisbursedata
46	WeeklyUpload	approveauthoritypreviousweeks
47	WeeklyUpload	tempdisbursedatapreviousweeks
48	WeeklyUpload	testmodel
49	REACT	srpcreactfiles
50	REACT	reactbasedata
51	REACT	repaymentstatus
52	REACT	reactduepool
53	REACT	reactdisburseddate
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-06-01 12:43:22.689064+05:30
2	contenttypes	0002_remove_content_type_name	2020-06-01 12:43:22.719985+05:30
3	auth	0001_initial	2020-06-01 12:43:22.791795+05:30
4	auth	0002_alter_permission_name_max_length	2020-06-01 12:43:22.875564+05:30
5	auth	0003_alter_user_email_max_length	2020-06-01 12:43:22.890526+05:30
6	auth	0004_alter_user_username_opts	2020-06-01 12:43:22.907481+05:30
7	auth	0005_alter_user_last_login_null	2020-06-01 12:43:22.922441+05:30
8	auth	0006_require_contenttypes_0002	2020-06-01 12:43:22.927426+05:30
9	auth	0007_alter_validators_add_error_messages	2020-06-01 12:43:22.943385+05:30
10	auth	0008_alter_user_username_max_length	2020-06-01 12:43:22.958344+05:30
11	auth	0009_alter_user_last_name_max_length	2020-06-01 12:43:22.975299+05:30
12	auth	0010_alter_group_name_max_length	2020-06-01 12:43:22.99426+05:30
13	auth	0011_update_proxy_permissions	2020-06-01 12:43:23.011208+05:30
14	Registration	0001_initial	2020-06-01 12:43:23.15194+05:30
15	WeeklyUpload	0001_initial	2020-06-01 12:43:23.274614+05:30
16	admin	0001_initial	2020-06-01 12:43:23.318497+05:30
17	admin	0002_logentry_remove_auto_add	2020-06-01 12:43:23.367367+05:30
18	admin	0003_logentry_add_action_flag_choices	2020-06-01 12:43:23.38933+05:30
19	authtoken	0001_initial	2020-06-01 12:43:23.427203+05:30
20	authtoken	0002_auto_20160226_1747	2020-06-01 12:43:23.55387+05:30
21	sessions	0001_initial	2020-06-01 12:43:23.584783+05:30
22	Registration	0002_auto_20200601_1618	2020-06-01 16:19:12.335114+05:30
23	WeeklyUpload	0002_delete_configuremodel	2020-06-02 08:33:43.00349+05:30
24	WeeklyUpload	0003_configuremodel	2020-06-02 08:34:35.319265+05:30
25	WeeklyUpload	0004_auto_20200602_0909	2020-06-02 09:09:52.675445+05:30
26	WeeklyUpload	0005_auto_20200602_0912	2020-06-02 09:12:40.696785+05:30
27	WeeklyUpload	0006_auto_20200603_1210	2020-06-03 12:11:10.812475+05:30
28	WeeklyUpload	0007_auto_20200603_1220	2020-06-03 12:20:47.663203+05:30
29	WeeklyUpload	0002_delete_stateid	2020-06-03 12:30:54.236863+05:30
30	WeeklyUpload	0003_uniquestate	2020-06-03 12:30:54.25681+05:30
31	WeeklyUpload	0004_configuremodel_registration_id	2020-06-03 12:34:47.838303+05:30
32	Registration	0002_auto_20200603_1311	2020-06-03 13:11:13.202114+05:30
33	WeeklyUpload	0005_paymentdetails	2020-06-12 12:24:43.90903+05:30
34	WeeklyUpload	0006_paymentstatus	2020-06-15 11:58:21.452714+05:30
35	WeeklyUpload	0007_delete_paymentdetails	2020-06-15 12:43:59.614882+05:30
36	WeeklyUpload	0008_configuremodel_status	2020-06-15 15:13:04.084803+05:30
37	WeeklyUpload	0009_remove_paymentstatus_status	2020-06-16 12:12:08.123126+05:30
38	WeeklyUpload	0010_paymentstatus_status	2020-06-16 17:32:31.166339+05:30
39	WeeklyUpload	0011_paymentstatus_entity	2020-06-17 16:50:00.277696+05:30
40	WeeklyUpload	0012_auto_20200617_1657	2020-06-17 16:57:55.315803+05:30
41	Registration	0002_applicantimages	2020-06-24 12:26:54.058158+05:30
42	Registration	0003_auto_20200625_1517	2020-06-25 15:17:23.386631+05:30
43	Registration	0004_auto_20200625_1528	2020-06-25 15:28:42.46315+05:30
44	Registration	0005_auto_20200625_1537	2020-06-25 15:37:15.268456+05:30
45	Registration	0006_rejected_remarks	2020-06-29 10:41:05.799925+05:30
46	Registration	0002_auto_20200629_1451	2020-06-29 14:51:31.701251+05:30
47	Registration	0003_remove_approved_shortname	2020-06-29 14:57:10.754896+05:30
48	Registration	0004_auto_20200629_1947	2020-06-29 19:47:34.902797+05:30
49	Registration	0002_auto_20200630_1536	2020-06-30 15:36:34.993322+05:30
50	Registration	0003_auto_20200630_1539	2020-06-30 15:39:24.341183+05:30
51	Registration	0004_bankdetails	2020-07-02 12:03:25.101893+05:30
52	Registration	0005_auto_20200711_2004	2020-07-11 20:04:49.381109+05:30
53	Registration	0006_auto_20200711_2006	2020-07-11 20:06:53.253798+05:30
54	Registration	0007_user_usercategory	2020-07-13 15:07:31.751454+05:30
55	Registration	0008_auto_20200713_1634	2020-07-13 16:35:00.967519+05:30
56	Registration	0009_user_usertype	2020-07-13 20:15:58.523174+05:30
57	Registration	0010_formdata_remarks	2020-07-14 09:20:31.043661+05:30
58	Registration	0011_auto_20200714_0926	2020-07-14 09:26:34.750674+05:30
59	Registration	0012_formdata_isfinanceverified	2020-07-14 09:59:12.309121+05:30
60	Registration	0002_auto_20200714_1329	2020-07-14 13:29:32.3872+05:30
61	Registration	0002_olddetails	2020-07-14 20:18:31.696806+05:30
62	Registration	0003_auto_20200714_2021	2020-07-14 20:21:54.152205+05:30
63	Registration	0004_auto_20200714_2212	2020-07-14 22:14:22.622744+05:30
64	Registration	0005_olddetails_fullname	2020-07-14 23:38:18.394072+05:30
65	Registration	0006_auto_20200714_2345	2020-07-14 23:45:15.734807+05:30
66	Registration	0007_oldbankdetails	2020-07-15 12:09:51.485821+05:30
67	Registration	0008_auto_20200715_1658	2020-07-15 16:58:36.395262+05:30
68	Registration	0009_auto_20200716_0955	2020-07-16 09:55:43.276587+05:30
69	Registration	0010_formdata_isfinanceapproved	2020-07-16 11:00:09.763658+05:30
70	Registration	0011_auto_20200716_1207	2020-07-16 12:07:10.176653+05:30
71	Registration	0012_auto_20200716_1217	2020-07-16 12:17:15.603467+05:30
72	Registration	0013_auto_20200716_1227	2020-07-16 12:27:50.569921+05:30
73	Registration	0014_oldbankdetails2	2020-07-24 12:37:40.714215+05:30
74	Registration	0015_oldbankdetails2_fullname	2020-07-24 15:22:27.317936+05:30
75	Registration	0016_bankeditedimages	2020-07-24 17:02:31.588614+05:30
76	Registration	0017_approved_approved_date	2020-07-27 11:06:54.808869+05:30
77	Registration	0018_remove_approved_approved_date	2020-07-27 11:08:19.935806+05:30
78	Registration	0019_olddetails_approveddate	2020-07-27 11:26:33.58046+05:30
79	WeeklyUpload	0002_auto_20200727_1847	2020-07-27 18:49:32.873899+05:30
80	WeeklyUpload	0003_configuremodel_modified_remarks	2020-07-29 15:35:29.388365+05:30
81	WeeklyUpload	0004_billsledger	2020-08-01 17:00:18.07268+05:30
82	WeeklyUpload	0005_auto_20200801_1753	2020-08-01 17:53:32.800007+05:30
83	WeeklyUpload	0006_auto_20200803_0848	2020-08-03 08:48:42.997897+05:30
84	WeeklyUpload	0007_auto_20200803_1119	2020-08-03 11:19:31.602413+05:30
85	WeeklyUpload	0008_billsledger_initial_status	2020-08-03 11:56:48.056586+05:30
86	WeeklyUpload	0009_paymentstatus_srldc_payamount	2020-08-04 11:00:38.824402+05:30
87	WeeklyUpload	0010_auto_20200804_1307	2020-08-04 13:07:47.047833+05:30
88	WeeklyUpload	0011_auto_20200806_1128	2020-08-06 11:28:30.343958+05:30
89	WeeklyUpload	0012_srpcfiles	2020-08-06 15:28:50.025902+05:30
90	WeeklyUpload	0013_delete_billsledger	2020-08-07 10:33:24.752283+05:30
91	WeeklyUpload	0014_configuremodel_image_url	2020-08-07 10:39:39.200172+05:30
92	WeeklyUpload	0015_remove_configuremodel_status	2020-08-07 12:26:14.059853+05:30
93	WeeklyUpload	0016_auto_20200807_1527	2020-08-07 15:28:28.082014+05:30
94	WeeklyUpload	0017_remove_paymentstatus_entity	2020-08-07 15:31:32.352638+05:30
95	WeeklyUpload	0018_auto_20200811_1033	2020-08-11 10:33:31.803923+05:30
96	WeeklyUpload	0019_configuremodel_outstandings	2020-08-13 12:13:06.818758+05:30
97	WeeklyUpload	0020_chatmessages	2020-08-26 19:59:38.515744+05:30
98	WeeklyUpload	0021_auto_20200827_0954	2020-08-27 09:54:59.283087+05:30
99	WeeklyUpload	0022_auto_20200827_0957	2020-08-27 09:57:25.620144+05:30
100	WeeklyUpload	0023_auto_20200827_1006	2020-08-27 10:06:09.427689+05:30
101	WeeklyUpload	0024_auto_20200827_1014	2020-08-27 10:14:26.820154+05:30
102	WeeklyUpload	0025_auto_20200827_1017	2020-08-27 10:17:03.810477+05:30
103	WeeklyUpload	0026_auto_20200831_1054	2020-08-31 10:54:52.504255+05:30
104	WeeklyUpload	0027_auto_20200831_1146	2020-08-31 11:46:51.209356+05:30
105	WeeklyUpload	0028_auto_20200831_1148	2020-08-31 11:48:50.633975+05:30
106	WeeklyUpload	0029_auto_20200831_1555	2020-08-31 15:56:06.43498+05:30
107	WeeklyUpload	0030_auto_20200831_1557	2020-08-31 15:57:11.171007+05:30
108	WeeklyUpload	0031_auto_20200902_1038	2020-09-02 10:38:35.669814+05:30
109	WeeklyUpload	0032_auto_20200903_1453	2020-09-03 14:53:37.468901+05:30
110	WeeklyUpload	0002_auto_20200909_1111	2020-09-09 11:11:39.35272+05:30
111	WeeklyUpload	0003_auto_20200915_1153	2020-09-15 11:53:13.205086+05:30
112	WeeklyUpload	0004_auto_20200923_1131	2020-09-23 11:32:18.22131+05:30
113	WeeklyUpload	0002_auto_20200923_1144	2020-09-23 11:44:38.473968+05:30
114	Registration	0002_delete_generalentities	2020-09-23 11:48:09.419085+05:30
115	Registration	0003_generalentities	2020-09-23 11:48:35.23448+05:30
116	Registration	0004_delete_employeeuser	2020-09-23 11:50:00.636283+05:30
117	Registration	0005_employeeuser	2020-09-23 11:50:23.936224+05:30
118	Registration	0006_delete_employeeuser	2020-09-23 14:11:03.624665+05:30
119	Registration	0007_employeeuser1	2020-09-23 14:11:30.564178+05:30
120	Registration	0008_delete_generalentities	2020-09-23 15:25:38.487859+05:30
121	WeeklyUpload	0003_auto_20200923_1525	2020-09-23 15:25:38.508801+05:30
122	Registration	0009_generalentities1	2020-09-23 15:26:32.320197+05:30
123	Registration	0010_generalentities1_email	2020-09-23 15:36:27.774303+05:30
124	Registration	0011_auto_20200923_1539	2020-09-23 15:39:58.217084+05:30
125	Registration	0012_employeeuser1_usertype	2020-09-23 16:15:58.502579+05:30
126	WeeklyUpload	0004_auto_20200928_1111	2020-09-28 11:11:30.898358+05:30
127	WeeklyUpload	0005_auto_20201009_1302	2020-10-09 13:02:20.80783+05:30
128	WeeklyUpload	0006_auto_20201012_1619	2020-10-12 16:21:36.214775+05:30
129	WeeklyUpload	0007_auto_20201012_1621	2020-10-12 16:21:36.231771+05:30
130	WeeklyUpload	0008_auto_20201013_1713	2020-10-13 17:13:45.873436+05:30
131	WeeklyUpload	0009_auto_20201015_1643	2020-10-15 16:44:04.846542+05:30
132	WeeklyUpload	0010_auto_20201019_1157	2020-10-19 11:57:12.058392+05:30
133	WeeklyUpload	0011_auto_20201019_1247	2020-10-19 12:47:51.496042+05:30
134	WeeklyUpload	0012_auto_20201019_1251	2020-10-19 12:51:15.491432+05:30
135	WeeklyUpload	0002_auto_20201019_1714	2020-10-19 17:14:32.311959+05:30
136	WeeklyUpload	0003_auto_20201020_1315	2020-10-20 13:15:54.760474+05:30
137	WeeklyUpload	0004_auto_20201020_1316	2020-10-20 13:16:06.648613+05:30
138	WeeklyUpload	0002_auto_20201102_1227	2020-11-02 12:27:14.99097+05:30
139	WeeklyUpload	0003_auto_20201102_1227	2020-11-02 12:27:57.958065+05:30
140	WeeklyUpload	0004_auto_20201102_1228	2020-11-02 12:28:16.782819+05:30
141	WeeklyUpload	0005_auto_20201102_1228	2020-11-02 12:29:14.183671+05:30
142	WeeklyUpload	0002_auto_20201102_1235	2020-11-02 12:35:46.817162+05:30
143	WeeklyUpload	0003_auto_20201102_1239	2020-11-02 12:39:07.280441+05:30
144	WeeklyUpload	0004_auto_20201102_1242	2020-11-02 12:42:14.733609+05:30
145	WeeklyUpload	0005_auto_20201103_1616	2020-11-03 16:16:17.497949+05:30
146	WeeklyUpload	0006_auto_20201103_1622	2020-11-03 16:22:05.590975+05:30
147	WeeklyUpload	0007_auto_20201109_1734	2020-11-09 17:34:27.557382+05:30
148	WeeklyUpload	0008_auto_20201111_1046	2020-11-11 10:46:46.997222+05:30
149	WeeklyUpload	0009_auto_20201111_1119	2020-11-11 11:22:33.896955+05:30
150	WeeklyUpload	0010_auto_20201125_1632	2020-11-25 16:32:30.628911+05:30
151	WeeklyUpload	0011_auto_20201125_1705	2020-11-25 17:05:50.435039+05:30
152	WeeklyUpload	0012_auto_20201202_1151	2020-12-02 11:51:58.757013+05:30
153	WeeklyUpload	0013_auto_20201204_1312	2020-12-04 13:12:31.503448+05:30
154	WeeklyUpload	0014_auto_20201204_1315	2020-12-04 13:15:31.545611+05:30
155	WeeklyUpload	0015_auto_20201204_1325	2020-12-04 13:25:27.299706+05:30
156	WeeklyUpload	0016_auto_20201204_1839	2020-12-04 18:40:02.11507+05:30
157	WeeklyUpload	0017_auto_20201205_1840	2020-12-05 18:40:46.746255+05:30
158	WeeklyUpload	0018_auto_20201205_1856	2020-12-05 18:56:29.820384+05:30
159	WeeklyUpload	0019_auto_20201205_1856	2020-12-05 18:56:44.353023+05:30
160	WeeklyUpload	0020_auto_20201205_1857	2020-12-05 18:57:31.969446+05:30
161	WeeklyUpload	0021_auto_20201206_1928	2020-12-06 19:29:44.053958+05:30
162	WeeklyUpload	0022_auto_20201206_1929	2020-12-06 19:29:44.068918+05:30
163	WeeklyUpload	0023_auto_20201206_1929	2020-12-06 19:29:44.074902+05:30
164	WeeklyUpload	0024_auto_20201207_1714	2020-12-07 17:14:20.761012+05:30
165	WeeklyUpload	0025_auto_20201208_1512	2020-12-08 15:12:37.773463+05:30
166	WeeklyUpload	0002_auto_20201215_1506	2020-12-15 15:06:54.219831+05:30
167	WeeklyUpload	0003_auto_20201215_1507	2020-12-15 15:07:09.324248+05:30
168	WeeklyUpload	0004_auto_20201216_1014	2020-12-16 10:16:36.988168+05:30
169	WeeklyUpload	0005_auto_20201216_1016	2020-12-16 10:16:36.998144+05:30
170	REACT	0001_initial	2020-12-21 14:39:56.16423+05:30
171	REACT	0002_reactbasedata	2020-12-21 15:22:20.290733+05:30
172	REACT	0003_reactbasedata_prorata	2020-12-21 15:30:57.893712+05:30
173	REACT	0004_auto_20201221_1533	2020-12-21 15:33:05.539273+05:30
174	WeeklyUpload	0006_auto_20201223_1420	2020-12-23 14:20:28.004409+05:30
175	WeeklyUpload	0007_auto_20201223_1421	2020-12-23 14:22:23.665687+05:30
176	WeeklyUpload	0008_auto_20201223_1422	2020-12-23 14:22:23.677654+05:30
177	WeeklyUpload	0009_auto_20201229_1301	2020-12-29 13:01:48.745901+05:30
178	WeeklyUpload	0010_auto_20201229_1507	2020-12-29 15:07:31.427384+05:30
179	REACT	0005_repaymentstatus	2020-12-31 16:15:12.125074+05:30
180	REACT	0006_auto_20201231_1705	2020-12-31 17:05:05.058778+05:30
181	REACT	0007_reactduepool	2021-01-06 11:00:52.174611+05:30
182	REACT	0008_reactdisburseddate	2021-01-06 13:22:52.601129+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
ewnd33io34ahnyqv16lm1sig297tc7jo	ZjM3Y2NhMWM4MGM5Mjc0ZjVjYTdjZTQxZTU1ODg4NjU2MGI4ZTM1Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNmZmM2UyY2YzMjFlYmIxMWU2NjU0MGNlYzVjZmZkMmY1YmFlYjIxIn0=	2020-06-15 15:00:02.917892+05:30
\.


--
-- Data for Name: employee_signs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_signs (empno, image_url) FROM stdin;
\.


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.images (id, "entityName", image_url) FROM stdin;
127	FORTUM_SOLAR	127.0.0.1:8000/static/images/FORTUM_SOLAR/dsminvoice223772.pdf
128	FORTUM_SOLAR	127.0.0.1:8000/static/images/FORTUM_SOLAR/rrasCoastal98918.pdf
129	FORTUM_SOLAR	127.0.0.1:8000/static/images/FORTUM_SOLAR/PANAmazon.in - Order 406-9709807-051870343509.pdf
130	FORTUM_SOLAR	127.0.0.1:8000/static/images/FORTUM_SOLAR/TANAmazon.in - Order 406-9709807-051870324212.pdf
131	FORTUM_SOLAR	127.0.0.1:8000/static/images/FORTUM_SOLAR/GSTINsample-cheque286388.jpg
137	PUDUCHERRY	127.0.0.1:8000/static/RegistrationForms/PUDUCHERRY/PUDUCHERRY46650.jpg
138	PONDY	127.0.0.1:8000/static/images/PONDY/dsmCoastal35207.pdf
139	PONDY	127.0.0.1:8000/static/images/PONDY/reactivesample-cheque58485.jpg
140	PONDY	127.0.0.1:8000/static/images/PONDY/PANsample-cheque363346.jpg
141	PONDY	127.0.0.1:8000/static/images/PONDY/TANsample-cheque333662.jpg
142	PONDY	127.0.0.1:8000/static/images/PONDY/GSTINsample-cheque90773.jpg
143	MTL	127.0.0.1:8000/static/RegistrationForms/MTL/MTL61087.pdf
144	MTL	127.0.0.1:8000/static/images/MTL/dsmInvoice19064.pdf
145	MTL	127.0.0.1:8000/static/images/MTL/rrassample-cheque78274.jpg
146	MTL	127.0.0.1:8000/static/images/MTL/PANAmazon.in - Order 406-9709807-051870377893.pdf
147	MTL	127.0.0.1:8000/static/images/MTL/TANInvoice92151.pdf
148	MTL	127.0.0.1:8000/static/images/MTL/GSTINsample-cheque04147.jpg
149	RSTCL	127.0.0.1:8000/static/RegistrationForms/RSTCL/RSTCL05657.pdf
150	SRRSTCL	127.0.0.1:8000/static/RegistrationForms/SRRSTCL/SRRSTCL52329.pdf
151	RSTCL	127.0.0.1:8000/static/images/RSTCL/dsmOrange Sironj26709.pdf
152	RSTCL	127.0.0.1:8000/static/images/RSTCL/agcMTL 95841.pdf
153	RSTCL	127.0.0.1:8000/static/images/RSTCL/PANInvoice84822.pdf
154	RSTCL	127.0.0.1:8000/static/images/RSTCL/TANCoastal09640.pdf
155	RSTCL	127.0.0.1:8000/static/images/RSTCL/GSTINJune Attendance46259.pdf
156	SRPON123	127.0.0.1:8000/static/RegistrationForms/SRPON123/SRPON12321018.pdf
157	PONDA	127.0.0.1:8000/static/images/PONDA/dsmCoastal_202006091752450058550.pdf
158	PONDA	127.0.0.1:8000/static/images/PONDA/agcInvoice53470.pdf
159	PONDA	127.0.0.1:8000/static/images/PONDA/PANJune Attendance50814.pdf
160	PONDA	127.0.0.1:8000/static/images/PONDA/TANsample-cheque64890.jpg
161	PONDA	127.0.0.1:8000/static/images/PONDA/GSTINOrange Sironj31053.pdf
162	SRSBG12	127.0.0.1:8000/static/RegistrationForms/SRSBG12/SRSBG1200889.pdf
163	SBGCLEANTECH	127.0.0.1:8000/static/images/SBGCLEANTECH/dsminvoice253790.pdf
164	SBGCLEANTECH	127.0.0.1:8000/static/images/SBGCLEANTECH/agcOrange Sironj42593.pdf
165	SBGCLEANTECH	127.0.0.1:8000/static/images/SBGCLEANTECH/PANJune Attendance05031.pdf
166	SBGCLEANTECH	127.0.0.1:8000/static/images/SBGCLEANTECH/TANsample-cheque66908.jpg
167	SBGCLEANTECH	127.0.0.1:8000/static/images/SBGCLEANTECH/GSTINCoastal20129.pdf
175	santhosh	127.0.0.1:8000/static/images/santhosh/rrasCreditNote_SBG CLEANTECH PROJECTCO FIVE PVT LTD29754.pdf
176	santhosh	127.0.0.1:8000/static/images/santhosh/rrasCreditNote_SBG CLEANTECH PROJECTCO FIVE PVT LTD96342.pdf
177	santhosh	127.0.0.1:8000/static/images/santhosh/rras45 CCM SRLDC Agenda 17.08.202067864.pdf
178	santhosh	127.0.0.1:8000/static/images/santhosh/rras45 CCM SRLDC Agenda 17.08.202034373.pdf
189	santhosh	127.0.0.1:8000/static/images/santhosh/dsmCreditNote_SBG CLEANTECH PROJECTCO FIVE PVT LTD04860.pdf
190	santhosh	127.0.0.1:8000/static/images/santhosh/reactiveJune Attendance99898.pdf
191	santhosh	127.0.0.1:8000/static/images/santhosh/PANJune Attendance53018.pdf
192	santhosh	127.0.0.1:8000/static/images/santhosh/TANinvoice290216.pdf
193	santhosh	127.0.0.1:8000/static/images/santhosh/GSTINsample-cheque29451.jpg
194	santhosh	127.0.0.1:8000/static/images/santhosh/PANCreditNote_SBG CLEANTECH PROJECTCO FIVE PVT LTD80216.pdf
195	santhosh	127.0.0.1:8000/static/images/santhosh/TANInvoice63036.pdf
196	santhosh	127.0.0.1:8000/static/images/santhosh/GSTINCoastal86043.pdf
197	santhosh	127.0.0.1:8000/static/images/santhosh/dsmOrange Sironj87142.pdf
198	SRAP	127.0.0.1:8000/static/RegistrationForms/SRAP/SRAP86876.pdf
199	SRAP	127.0.0.1:8000/static/RegistrationForms/SRAP/SRAP70290.pdf
200	SRKL	127.0.0.1:8000/static/RegistrationForms/SRKL/SRKL31438.pdf
201	KS	127.0.0.1:8000/static/images/KS/dsmCreditNote_SBG CLEANTECH PROJECTCO FIVE PVT LTD89049.pdf
202	KS	127.0.0.1:8000/static/images/KS/rrasCoastal_202006091752450029265.pdf
203	KS	127.0.0.1:8000/static/images/KS/PANCreditNote_SBG CLEANTECH PROJECTCO FIVE PVT LTD76653.pdf
204	KS	127.0.0.1:8000/static/images/KS/TANCoastal_202006091752450029713.pdf
205	KS	127.0.0.1:8000/static/images/KS/GSTINCreditNote_SBG CLEANTECH PROJECTCO FIVE PVT LTD02542.pdf
206	SRGJHG	127.0.0.1:8000/static/RegistrationForms/SRGJHG/SRGJHG13031.pdf
207	SRAP	127.0.0.1:8000/static/RegistrationForms/SRAP/SRAP52882.pdf
208	SRTNEB	127.0.0.1:8000/static/RegistrationForms/SRTNEB/SRTNEB60560.pdf
209	KAR	127.0.0.1:8000/static/images/KAR/dsmdsm17-23aug2003741.pdf
210	KAR	127.0.0.1:8000/static/images/KAR/PANerpc wk.21 acct.98049.pdf
211	KAR	127.0.0.1:8000/static/images/KAR/TANreac17-23aug2010596.pdf
212	KAR	127.0.0.1:8000/static/images/KAR/GSTINrras17-23aug2057370.pdf
213	KAR	127.0.0.1:8000/static/images/KAR/TANreac17-23aug2082922.pdf
218	Admin	127.0.0.1:8000/static/images/Admin/GSTIN34444.png
220	Admin	/Admin/GSTIN44095.png
221	Admin	/Admin/GSTINNew RampUP21260.png
222	Admin	/Admin/GSTINNew RampUP02925.png
223	Admin	/Admin/GSTINNew RampUP57723.png
224	Admin	/Admin/GSTINNew RampUP98228.png
225	Admin	/Admin/GSTINNew RampUP41202.png
226	Admin	/static/images/Admin/GSTINAdjusted Legend62138.png
227	Admin	Registration/static/images/Admin/GSTINAdjusted Legend07382.png
228	Admin	Registration/static/images/Admin/GSTINRamp Old22316.png
229	Admin	/static/images/Admin/GSTINAdjusted Legend12278.png
230	Admin	/static/images/Admin/GSTINAdjusted Legend00343.png
231	Admin	/static/images/Admin/GSTINNew RampUP56268.png
232	Admin	/static/images/Admin/GSTINAdjusted Legend56041.png
246	Admin	/static/images/Admin/PANNumberAdjusted Legend25832.png
247	Admin	/static/images/Admin/TANNumberAdjusted Legend07480.png
248	Admin	/static/images/Admin/GSTINRamp Down70674.png
249	Admin	/static/images/Admin/PANNumberAdjusted Legend41441.png
263	SEL	/static/images/SEL/DSMBankProofinvoice223258.pdf
264	SEL	/static/images/SEL/PANNumberPONDY11966.pdf
265	SEL	/static/images/SEL/TANNumberMEL94186.pdf
266	SEL	/static/images/SEL/GSTINPONDY95170.pdf
267	SEIL	/static/images/SEIL/DSMBankProofMYTRAH 300666043.PNG
268	SEIL	/static/images/SEIL/PANNumberMYTRAH 310336669.PNG
269	SEIL	/static/images/SEIL/TANNumberMYTRAH 310308729.PNG
270	LANCO-2	/static/images/LANCO-2/DSMBankProofMYTRAH 300685558.PNG
271	LANCO-3	/static/images/LANCO-3/DSMBankProofMYTRAH22969.PNG
272	SEILP2	/static/images/SEILP2/DSMBankProofMYTRAH 310300045.PNG
273	ACMEHISAR	/static/images/ACMEHISAR/DSMBankProofMYTRAH 310357782.PNG
274	ACMEBHIWADI	/static/images/ACMEBHIWADI/DSMBankProofMYTRAH 311222265.PNG
275	ACMEBHIWADI	/static/images/ACMEBHIWADI/PANNumberMYTRAH 310341973.PNG
276	AZURE36	/static/images/AZURE36/DSMBankProofMYTRAH 311265703.PNG
277	TATA	/static/images/TATA/DSMBankProofMYTRAH 310361414.PNG
278	NTPCANTP	/static/images/NTPCANTP/DSMBankProofMYTRAH 311237110.PNG
279	NTPCANTP	/static/images/NTPCANTP/GSTINMYTRAH 300674593.PNG
280	SBGCLEAN2	/static/images/SBGCLEAN2/DSMBankProofMYTRAH 300680456.PNG
281	ADYAHB1	/static/images/ADYAHB1/DSMBankProofMYTRAH 300605449.PNG
282	ADYAHB1	/static/images/ADYAHB1/DSMBankProofMYTRAH 300646022.PNG
283	ADYAHB3	/static/images/ADYAHB3/DSMBankProofMYTRAH 310310661.PNG
284	AYANA	/static/images/AYANA/DSMBankProofuttam25596.PNG
285	TRISSUR	/static/images/TRISSUR/DSMBankProofsample-cheque231593.jpg
\.


--
-- Name: DisbursedDate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DisbursedDate_id_seq"', 18, true);


--
-- Name: REACT_reactbasedata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."REACT_reactbasedata_id_seq"', 13, true);


--
-- Name: REACT_reactdisburseddate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."REACT_reactdisburseddate_id_seq"', 1, false);


--
-- Name: REACT_reactduepool_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."REACT_reactduepool_id_seq"', 2, true);


--
-- Name: REACT_repaymentstatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."REACT_repaymentstatus_id_seq"', 11, true);


--
-- Name: Registration_generalentities1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Registration_generalentities1_id_seq"', 82, true);


--
-- Name: Registration_oldbankdetails2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Registration_oldbankdetails2_id_seq"', 9, true);


--
-- Name: Registration_oldbankdetails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Registration_oldbankdetails_id_seq"', 1, false);


--
-- Name: Registration_olddetails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Registration_olddetails_id_seq"', 25, true);


--
-- Name: Registration_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Registration_user_groups_id_seq"', 1, false);


--
-- Name: Registration_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Registration_user_id_seq"', 192, true);


--
-- Name: Registration_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Registration_user_user_permissions_id_seq"', 1, false);


--
-- Name: SRPC_Files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SRPC_Files_id_seq"', 56, true);


--
-- Name: SRPC_REACT_Files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SRPC_REACT_Files_id_seq"', 7, true);


--
-- Name: WeeklyUpload_approveauthority_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."WeeklyUpload_approveauthority_id_seq"', 22, true);


--
-- Name: WeeklyUpload_approveauthoritypreviousweeks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."WeeklyUpload_approveauthoritypreviousweeks_id_seq"', 11, true);


--
-- Name: WeeklyUpload_chatallmessages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."WeeklyUpload_chatallmessages_id_seq"', 52, true);


--
-- Name: WeeklyUpload_configuremodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."WeeklyUpload_configuremodel_id_seq"', 2432, true);


--
-- Name: WeeklyUpload_dsmduepool_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."WeeklyUpload_dsmduepool_id_seq"', 1393, true);


--
-- Name: WeeklyUpload_finalpaydisburse1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."WeeklyUpload_finalpaydisburse1_id_seq"', 948, true);


--
-- Name: WeeklyUpload_finalreceivedisburse1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."WeeklyUpload_finalreceivedisburse1_id_seq"', 463, true);


--
-- Name: WeeklyUpload_miscpaymentstatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."WeeklyUpload_miscpaymentstatus_id_seq"', 51, true);


--
-- Name: WeeklyUpload_moemployeeuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."WeeklyUpload_moemployeeuser_id_seq"', 5, true);


--
-- Name: WeeklyUpload_paymentstatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."WeeklyUpload_paymentstatus_id_seq"', 901, true);


--
-- Name: WeeklyUpload_surchargemodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."WeeklyUpload_surchargemodel_id_seq"', 31, true);


--
-- Name: WeeklyUpload_tempdisbursedata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."WeeklyUpload_tempdisbursedata_id_seq"', 646, true);


--
-- Name: WeeklyUpload_tempdisbursedatapreviousweeks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."WeeklyUpload_tempdisbursedatapreviousweeks_id_seq"', 11, true);


--
-- Name: WeeklyUpload_uniquestate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."WeeklyUpload_uniquestate_id_seq"', 8, true);


--
-- Name: YearCalendar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."YearCalendar_id_seq"', 104, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 212, true);


--
-- Name: bank_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bank_images_id_seq', 6, true);


--
-- Name: bankdetails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bankdetails_id_seq', 2, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 4, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 53, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 182, true);


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.images_id_seq', 285, true);


--
-- Name: DisbursedDate DisbursedDate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DisbursedDate"
    ADD CONSTRAINT "DisbursedDate_pkey" PRIMARY KEY (id);


--
-- Name: REACT_reactbasedata REACT_reactbasedata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."REACT_reactbasedata"
    ADD CONSTRAINT "REACT_reactbasedata_pkey" PRIMARY KEY (id);


--
-- Name: REACT_reactdisburseddate REACT_reactdisburseddate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."REACT_reactdisburseddate"
    ADD CONSTRAINT "REACT_reactdisburseddate_pkey" PRIMARY KEY (id);


--
-- Name: REACT_reactduepool REACT_reactduepool_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."REACT_reactduepool"
    ADD CONSTRAINT "REACT_reactduepool_pkey" PRIMARY KEY (id);


--
-- Name: REACT_repaymentstatus REACT_repaymentstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."REACT_repaymentstatus"
    ADD CONSTRAINT "REACT_repaymentstatus_pkey" PRIMARY KEY (id);


--
-- Name: Registration_approved Registration_approved_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_approved"
    ADD CONSTRAINT "Registration_approved_pkey" PRIMARY KEY (id);


--
-- Name: Registration_employeeuser1 Registration_employeeuser1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_employeeuser1"
    ADD CONSTRAINT "Registration_employeeuser1_pkey" PRIMARY KEY (empno);


--
-- Name: Registration_formdata Registration_formdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_formdata"
    ADD CONSTRAINT "Registration_formdata_pkey" PRIMARY KEY (id);


--
-- Name: Registration_generalentities1 Registration_generalentities1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_generalentities1"
    ADD CONSTRAINT "Registration_generalentities1_pkey" PRIMARY KEY (id);


--
-- Name: Registration_oldbankdetails2 Registration_oldbankdetails2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_oldbankdetails2"
    ADD CONSTRAINT "Registration_oldbankdetails2_pkey" PRIMARY KEY (id);


--
-- Name: Registration_oldbankdetails Registration_oldbankdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_oldbankdetails"
    ADD CONSTRAINT "Registration_oldbankdetails_pkey" PRIMARY KEY (id);


--
-- Name: Registration_olddetails Registration_olddetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_olddetails"
    ADD CONSTRAINT "Registration_olddetails_pkey" PRIMARY KEY (id);


--
-- Name: Registration_rejected Registration_rejected_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_rejected"
    ADD CONSTRAINT "Registration_rejected_pkey" PRIMARY KEY (id);


--
-- Name: Registration_user_groups Registration_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_user_groups"
    ADD CONSTRAINT "Registration_user_groups_pkey" PRIMARY KEY (id);


--
-- Name: Registration_user_groups Registration_user_groups_user_id_group_id_5efac235_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_user_groups"
    ADD CONSTRAINT "Registration_user_groups_user_id_group_id_5efac235_uniq" UNIQUE (user_id, group_id);


--
-- Name: Registration_user Registration_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_user"
    ADD CONSTRAINT "Registration_user_pkey" PRIMARY KEY (id);


--
-- Name: Registration_user_user_permissions Registration_user_user_p_user_id_permission_id_5c3a1a0d_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_user_user_permissions"
    ADD CONSTRAINT "Registration_user_user_p_user_id_permission_id_5c3a1a0d_uniq" UNIQUE (user_id, permission_id);


--
-- Name: Registration_user_user_permissions Registration_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_user_user_permissions"
    ADD CONSTRAINT "Registration_user_user_permissions_pkey" PRIMARY KEY (id);


--
-- Name: Registration_user Registration_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_user"
    ADD CONSTRAINT "Registration_user_username_key" UNIQUE (username);


--
-- Name: SRPC_Files SRPC_Files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SRPC_Files"
    ADD CONSTRAINT "SRPC_Files_pkey" PRIMARY KEY (id);


--
-- Name: SRPC_REACT_Files SRPC_REACT_Files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SRPC_REACT_Files"
    ADD CONSTRAINT "SRPC_REACT_Files_pkey" PRIMARY KEY (id);


--
-- Name: WeeklyUpload_approveauthority WeeklyUpload_approveauthority_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_approveauthority"
    ADD CONSTRAINT "WeeklyUpload_approveauthority_pkey" PRIMARY KEY (id);


--
-- Name: WeeklyUpload_approveauthoritypreviousweeks WeeklyUpload_approveauthoritypreviousweeks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_approveauthoritypreviousweeks"
    ADD CONSTRAINT "WeeklyUpload_approveauthoritypreviousweeks_pkey" PRIMARY KEY (id);


--
-- Name: WeeklyUpload_chatallmessages WeeklyUpload_chatallmessages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_chatallmessages"
    ADD CONSTRAINT "WeeklyUpload_chatallmessages_pkey" PRIMARY KEY (id);


--
-- Name: WeeklyUpload_configuremodel WeeklyUpload_configuremodel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_configuremodel"
    ADD CONSTRAINT "WeeklyUpload_configuremodel_pkey" PRIMARY KEY (id);


--
-- Name: WeeklyUpload_dsmduepool WeeklyUpload_dsmduepool_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_dsmduepool"
    ADD CONSTRAINT "WeeklyUpload_dsmduepool_pkey" PRIMARY KEY (id);


--
-- Name: WeeklyUpload_finalpaydisburse1 WeeklyUpload_finalpaydisburse1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_finalpaydisburse1"
    ADD CONSTRAINT "WeeklyUpload_finalpaydisburse1_pkey" PRIMARY KEY (id);


--
-- Name: WeeklyUpload_finalreceivedisburse1 WeeklyUpload_finalreceivedisburse1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_finalreceivedisburse1"
    ADD CONSTRAINT "WeeklyUpload_finalreceivedisburse1_pkey" PRIMARY KEY (id);


--
-- Name: WeeklyUpload_miscpaymentstatus WeeklyUpload_miscpaymentstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_miscpaymentstatus"
    ADD CONSTRAINT "WeeklyUpload_miscpaymentstatus_pkey" PRIMARY KEY (id);


--
-- Name: WeeklyUpload_moemployeeuser WeeklyUpload_moemployeeuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_moemployeeuser"
    ADD CONSTRAINT "WeeklyUpload_moemployeeuser_pkey" PRIMARY KEY (id);


--
-- Name: WeeklyUpload_paymentstatus WeeklyUpload_paymentstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_paymentstatus"
    ADD CONSTRAINT "WeeklyUpload_paymentstatus_pkey" PRIMARY KEY (id);


--
-- Name: WeeklyUpload_surchargemodel WeeklyUpload_surchargemodel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_surchargemodel"
    ADD CONSTRAINT "WeeklyUpload_surchargemodel_pkey" PRIMARY KEY (id);


--
-- Name: WeeklyUpload_tempdisbursedata WeeklyUpload_tempdisbursedata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_tempdisbursedata"
    ADD CONSTRAINT "WeeklyUpload_tempdisbursedata_pkey" PRIMARY KEY (id);


--
-- Name: WeeklyUpload_tempdisbursedatapreviousweeks WeeklyUpload_tempdisbursedatapreviousweeks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_tempdisbursedatapreviousweeks"
    ADD CONSTRAINT "WeeklyUpload_tempdisbursedatapreviousweeks_pkey" PRIMARY KEY (id);


--
-- Name: WeeklyUpload_uniquestate WeeklyUpload_uniquestate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_uniquestate"
    ADD CONSTRAINT "WeeklyUpload_uniquestate_pkey" PRIMARY KEY (id);


--
-- Name: YearCalendar YearCalendar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."YearCalendar"
    ADD CONSTRAINT "YearCalendar_pkey" PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: bank_images bank_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_images
    ADD CONSTRAINT bank_images_pkey PRIMARY KEY (id);


--
-- Name: bankdetails bankdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bankdetails
    ADD CONSTRAINT bankdetails_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: REACT_repaymentstatus_registration_id_id_1d0b2a32; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "REACT_repaymentstatus_registration_id_id_1d0b2a32" ON public."REACT_repaymentstatus" USING btree (registration_id_id);


--
-- Name: Registration_approved_id_a0bead9c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Registration_approved_id_a0bead9c_like" ON public."Registration_approved" USING btree (id varchar_pattern_ops);


--
-- Name: Registration_employeeuser1_registration_id_id_2f2b3074; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Registration_employeeuser1_registration_id_id_2f2b3074" ON public."Registration_employeeuser1" USING btree (registration_id_id);


--
-- Name: Registration_formdata_id_d267b91c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Registration_formdata_id_d267b91c_like" ON public."Registration_formdata" USING btree (id varchar_pattern_ops);


--
-- Name: Registration_generalentities1_registration_id_id_91a9a7d5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Registration_generalentities1_registration_id_id_91a9a7d5" ON public."Registration_generalentities1" USING btree (registration_id_id);


--
-- Name: Registration_oldbankdetails2_register_id_id_2a2de119; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Registration_oldbankdetails2_register_id_id_2a2de119" ON public."Registration_oldbankdetails2" USING btree (register_id_id);


--
-- Name: Registration_oldbankdetails2_register_id_id_2a2de119_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Registration_oldbankdetails2_register_id_id_2a2de119_like" ON public."Registration_oldbankdetails2" USING btree (register_id_id varchar_pattern_ops);


--
-- Name: Registration_oldbankdetails_register_id_id_94deba63; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Registration_oldbankdetails_register_id_id_94deba63" ON public."Registration_oldbankdetails" USING btree (register_id_id);


--
-- Name: Registration_oldbankdetails_register_id_id_94deba63_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Registration_oldbankdetails_register_id_id_94deba63_like" ON public."Registration_oldbankdetails" USING btree (register_id_id varchar_pattern_ops);


--
-- Name: Registration_olddetails_register_id_id_a21f9099; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Registration_olddetails_register_id_id_a21f9099" ON public."Registration_olddetails" USING btree (register_id_id);


--
-- Name: Registration_olddetails_register_id_id_a21f9099_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Registration_olddetails_register_id_id_a21f9099_like" ON public."Registration_olddetails" USING btree (register_id_id varchar_pattern_ops);


--
-- Name: Registration_rejected_id_f8cf5d78_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Registration_rejected_id_f8cf5d78_like" ON public."Registration_rejected" USING btree (id varchar_pattern_ops);


--
-- Name: Registration_user_groups_group_id_be2cd860; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Registration_user_groups_group_id_be2cd860" ON public."Registration_user_groups" USING btree (group_id);


--
-- Name: Registration_user_groups_user_id_fb2b51c8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Registration_user_groups_user_id_fb2b51c8" ON public."Registration_user_groups" USING btree (user_id);


--
-- Name: Registration_user_user_permissions_permission_id_0eabacd1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Registration_user_user_permissions_permission_id_0eabacd1" ON public."Registration_user_user_permissions" USING btree (permission_id);


--
-- Name: Registration_user_user_permissions_user_id_29ab7dea; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Registration_user_user_permissions_user_id_29ab7dea" ON public."Registration_user_user_permissions" USING btree (user_id);


--
-- Name: Registration_user_username_a56914e9_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Registration_user_username_a56914e9_like" ON public."Registration_user" USING btree (username varchar_pattern_ops);


--
-- Name: WeeklyUpload_finalpaydisburse1_registration_id_id_badc6c94; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WeeklyUpload_finalpaydisburse1_registration_id_id_badc6c94" ON public."WeeklyUpload_finalpaydisburse1" USING btree (registration_id_id);


--
-- Name: WeeklyUpload_finalreceivedisburse1_registration_id_id_7754ed2a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WeeklyUpload_finalreceivedisburse1_registration_id_id_7754ed2a" ON public."WeeklyUpload_finalreceivedisburse1" USING btree (registration_id_id);


--
-- Name: WeeklyUpload_paymentstatus_registration_id_id_394f03e8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WeeklyUpload_paymentstatus_registration_id_id_394f03e8" ON public."WeeklyUpload_paymentstatus" USING btree (registration_id_id);


--
-- Name: WeeklyUpload_surchargemodel_reference_id_id_93308a1a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WeeklyUpload_surchargemodel_reference_id_id_93308a1a" ON public."WeeklyUpload_surchargemodel" USING btree (reference_id_id);


--
-- Name: WeeklyUpload_tempdisbursed_registration_id_id_60747479; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WeeklyUpload_tempdisbursed_registration_id_id_60747479" ON public."WeeklyUpload_tempdisbursedatapreviousweeks" USING btree (registration_id_id);


--
-- Name: WeeklyUpload_tempdisbursedata_registration_id_id_3e99ca71; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WeeklyUpload_tempdisbursedata_registration_id_id_3e99ca71" ON public."WeeklyUpload_tempdisbursedata" USING btree (registration_id_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: REACT_repaymentstatus REACT_repaymentstatu_registration_id_id_1d0b2a32_fk_REACT_rea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."REACT_repaymentstatus"
    ADD CONSTRAINT "REACT_repaymentstatu_registration_id_id_1d0b2a32_fk_REACT_rea" FOREIGN KEY (registration_id_id) REFERENCES public."REACT_reactbasedata"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Registration_employeeuser1 Registration_employe_registration_id_id_2f2b3074_fk_Registrat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_employeeuser1"
    ADD CONSTRAINT "Registration_employe_registration_id_id_2f2b3074_fk_Registrat" FOREIGN KEY (registration_id_id) REFERENCES public."Registration_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Registration_generalentities1 Registration_general_registration_id_id_91a9a7d5_fk_Registrat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_generalentities1"
    ADD CONSTRAINT "Registration_general_registration_id_id_91a9a7d5_fk_Registrat" FOREIGN KEY (registration_id_id) REFERENCES public."Registration_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Registration_oldbankdetails2 Registration_oldbank_register_id_id_2a2de119_fk_Registrat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_oldbankdetails2"
    ADD CONSTRAINT "Registration_oldbank_register_id_id_2a2de119_fk_Registrat" FOREIGN KEY (register_id_id) REFERENCES public."Registration_approved"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Registration_oldbankdetails Registration_oldbank_register_id_id_94deba63_fk_Registrat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_oldbankdetails"
    ADD CONSTRAINT "Registration_oldbank_register_id_id_94deba63_fk_Registrat" FOREIGN KEY (register_id_id) REFERENCES public."Registration_approved"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Registration_olddetails Registration_olddeta_register_id_id_a21f9099_fk_Registrat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_olddetails"
    ADD CONSTRAINT "Registration_olddeta_register_id_id_a21f9099_fk_Registrat" FOREIGN KEY (register_id_id) REFERENCES public."Registration_approved"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Registration_user_groups Registration_user_gr_user_id_fb2b51c8_fk_Registrat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_user_groups"
    ADD CONSTRAINT "Registration_user_gr_user_id_fb2b51c8_fk_Registrat" FOREIGN KEY (user_id) REFERENCES public."Registration_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Registration_user_groups Registration_user_groups_group_id_be2cd860_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_user_groups"
    ADD CONSTRAINT "Registration_user_groups_group_id_be2cd860_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Registration_user_user_permissions Registration_user_us_permission_id_0eabacd1_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_user_user_permissions"
    ADD CONSTRAINT "Registration_user_us_permission_id_0eabacd1_fk_auth_perm" FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Registration_user_user_permissions Registration_user_us_user_id_29ab7dea_fk_Registrat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Registration_user_user_permissions"
    ADD CONSTRAINT "Registration_user_us_user_id_29ab7dea_fk_Registrat" FOREIGN KEY (user_id) REFERENCES public."Registration_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: WeeklyUpload_finalpaydisburse1 WeeklyUpload_finalpa_registration_id_id_badc6c94_fk_WeeklyUpl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_finalpaydisburse1"
    ADD CONSTRAINT "WeeklyUpload_finalpa_registration_id_id_badc6c94_fk_WeeklyUpl" FOREIGN KEY (registration_id_id) REFERENCES public."WeeklyUpload_configuremodel"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: WeeklyUpload_finalreceivedisburse1 WeeklyUpload_finalre_registration_id_id_7754ed2a_fk_WeeklyUpl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_finalreceivedisburse1"
    ADD CONSTRAINT "WeeklyUpload_finalre_registration_id_id_7754ed2a_fk_WeeklyUpl" FOREIGN KEY (registration_id_id) REFERENCES public."WeeklyUpload_configuremodel"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: WeeklyUpload_paymentstatus WeeklyUpload_payment_registration_id_id_394f03e8_fk_WeeklyUpl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_paymentstatus"
    ADD CONSTRAINT "WeeklyUpload_payment_registration_id_id_394f03e8_fk_WeeklyUpl" FOREIGN KEY (registration_id_id) REFERENCES public."WeeklyUpload_configuremodel"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: WeeklyUpload_surchargemodel WeeklyUpload_surchar_reference_id_id_93308a1a_fk_WeeklyUpl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_surchargemodel"
    ADD CONSTRAINT "WeeklyUpload_surchar_reference_id_id_93308a1a_fk_WeeklyUpl" FOREIGN KEY (reference_id_id) REFERENCES public."WeeklyUpload_configuremodel"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: WeeklyUpload_tempdisbursedata WeeklyUpload_tempdis_registration_id_id_3e99ca71_fk_WeeklyUpl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_tempdisbursedata"
    ADD CONSTRAINT "WeeklyUpload_tempdis_registration_id_id_3e99ca71_fk_WeeklyUpl" FOREIGN KEY (registration_id_id) REFERENCES public."WeeklyUpload_configuremodel"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: WeeklyUpload_tempdisbursedatapreviousweeks WeeklyUpload_tempdis_registration_id_id_60747479_fk_WeeklyUpl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WeeklyUpload_tempdisbursedatapreviousweeks"
    ADD CONSTRAINT "WeeklyUpload_tempdis_registration_id_id_60747479_fk_WeeklyUpl" FOREIGN KEY (registration_id_id) REFERENCES public."WeeklyUpload_configuremodel"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_Registration_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT "authtoken_token_user_id_35299eff_fk_Registration_user_id" FOREIGN KEY (user_id) REFERENCES public."Registration_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_Registration_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT "django_admin_log_user_id_c564eba6_fk_Registration_user_id" FOREIGN KEY (user_id) REFERENCES public."Registration_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: employee_signs fk_employeeuser1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_signs
    ADD CONSTRAINT fk_employeeuser1 FOREIGN KEY (empno) REFERENCES public."Registration_employeeuser1"(empno) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

