--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: lgbrand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lgbrand (
    brand_id numeric(4,0) NOT NULL,
    brand_name character varying(100) NOT NULL,
    brand_type character varying(20)
);


ALTER TABLE public.lgbrand OWNER TO postgres;

--
-- Name: lgcustomer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lgcustomer (
    cust_code numeric(38,0) NOT NULL,
    cust_fname character varying(20),
    cust_lname character varying(20),
    cust_street character varying(70),
    cust_city character varying(50),
    cust_state character(2),
    cust_zip character(5),
    cust_balance numeric(8,2)
);


ALTER TABLE public.lgcustomer OWNER TO postgres;

--
-- Name: lgdepartment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lgdepartment (
    dept_num numeric(5,0) NOT NULL,
    dept_name character varying(50) NOT NULL,
    dept_mail_box character varying(3),
    dept_phone character varying(9),
    emp_num numeric(6,0)
);


ALTER TABLE public.lgdepartment OWNER TO postgres;

--
-- Name: lgemployee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lgemployee (
    emp_num numeric(6,0) NOT NULL,
    emp_fname character varying(20) NOT NULL,
    emp_lname character varying(25) NOT NULL,
    emp_email character varying(25),
    emp_phone character varying(20),
    emp_hiredate date,
    emp_title character varying(45),
    emp_comm numeric(2,2),
    dept_num numeric(5,0)
);


ALTER TABLE public.lgemployee OWNER TO postgres;

--
-- Name: lginvoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lginvoice (
    inv_num numeric(38,0) NOT NULL,
    inv_date date,
    cust_code numeric(38,0),
    inv_total numeric(11,2),
    employee_id numeric(6,0)
);


ALTER TABLE public.lginvoice OWNER TO postgres;

--
-- Name: lgline; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lgline (
    inv_num numeric(38,0) NOT NULL,
    line_num numeric NOT NULL,
    prod_sku character varying(15),
    line_qty numeric,
    line_price numeric(8,2)
);


ALTER TABLE public.lgline OWNER TO postgres;

--
-- Name: lgproduct; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lgproduct (
    prod_sku character varying(15) NOT NULL,
    prod_descript character varying(255) NOT NULL,
    prod_type character varying(255),
    prod_base character varying(255),
    prod_category character varying(255),
    prod_price numeric(10,2),
    prod_qoh numeric(10,0),
    prod_min numeric(10,0),
    brand_id numeric(4,0)
);


ALTER TABLE public.lgproduct OWNER TO postgres;

--
-- Name: lgsalary_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lgsalary_history (
    emp_num numeric(6,0) NOT NULL,
    sal_from date NOT NULL,
    sal_end date,
    sal_amount numeric(10,2)
);


ALTER TABLE public.lgsalary_history OWNER TO postgres;

--
-- Name: lgsupplies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lgsupplies (
    prod_sku character varying(15) NOT NULL,
    vend_id numeric(6,0) NOT NULL
);


ALTER TABLE public.lgsupplies OWNER TO postgres;

--
-- Name: lgvendor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lgvendor (
    vend_id numeric(6,0) NOT NULL,
    vend_name character varying(255) NOT NULL,
    vend_street character varying(50),
    vend_city character varying(50),
    vend_state character varying(2),
    vend_zip character varying(5)
);


ALTER TABLE public.lgvendor OWNER TO postgres;

--
-- Name: lgbrand lgbrand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lgbrand
    ADD CONSTRAINT lgbrand_pkey PRIMARY KEY (brand_id);


--
-- Name: lgcustomer lgcustomer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lgcustomer
    ADD CONSTRAINT lgcustomer_pkey PRIMARY KEY (cust_code);


--
-- Name: lgdepartment lgdepartment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lgdepartment
    ADD CONSTRAINT lgdepartment_pkey PRIMARY KEY (dept_num);


--
-- Name: lgemployee lgemployee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lgemployee
    ADD CONSTRAINT lgemployee_pkey PRIMARY KEY (emp_num);


--
-- Name: lginvoice lginvoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lginvoice
    ADD CONSTRAINT lginvoice_pkey PRIMARY KEY (inv_num);


--
-- Name: lgline lgline_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lgline
    ADD CONSTRAINT lgline_pkey PRIMARY KEY (inv_num, line_num);


--
-- Name: lgproduct lgproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lgproduct
    ADD CONSTRAINT lgproduct_pkey PRIMARY KEY (prod_sku);


--
-- Name: lgsalary_history lgsalary_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lgsalary_history
    ADD CONSTRAINT lgsalary_history_pkey PRIMARY KEY (emp_num, sal_from);


--
-- Name: lgsupplies lgsupplies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lgsupplies
    ADD CONSTRAINT lgsupplies_pkey PRIMARY KEY (prod_sku, vend_id);


--
-- Name: lgvendor lgvendor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lgvendor
    ADD CONSTRAINT lgvendor_pkey PRIMARY KEY (vend_id);


--
-- Name: lgemployee lgemployee_dept_num_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lgemployee
    ADD CONSTRAINT lgemployee_dept_num_fkey FOREIGN KEY (dept_num) REFERENCES public.lgdepartment(dept_num);


--
-- Name: lginvoice lginvoice_cust_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lginvoice
    ADD CONSTRAINT lginvoice_cust_code_fkey FOREIGN KEY (cust_code) REFERENCES public.lgcustomer(cust_code);


--
-- Name: lginvoice lginvoice_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lginvoice
    ADD CONSTRAINT lginvoice_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.lgemployee(emp_num);


--
-- Name: lgline lgline_inv_num_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lgline
    ADD CONSTRAINT lgline_inv_num_fkey FOREIGN KEY (inv_num) REFERENCES public.lginvoice(inv_num);


--
-- Name: lgline lgline_prod_sku_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lgline
    ADD CONSTRAINT lgline_prod_sku_fkey FOREIGN KEY (prod_sku) REFERENCES public.lgproduct(prod_sku);


--
-- Name: lgproduct lgproduct_brand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lgproduct
    ADD CONSTRAINT lgproduct_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.lgbrand(brand_id);


--
-- Name: lgsalary_history lgsalary_history_emp_num_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lgsalary_history
    ADD CONSTRAINT lgsalary_history_emp_num_fkey FOREIGN KEY (emp_num) REFERENCES public.lgemployee(emp_num);


--
-- Name: lgsupplies lgsupplies_prod_sku_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lgsupplies
    ADD CONSTRAINT lgsupplies_prod_sku_fkey FOREIGN KEY (prod_sku) REFERENCES public.lgproduct(prod_sku);


--
-- Name: lgsupplies lgsupplies_vend_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lgsupplies
    ADD CONSTRAINT lgsupplies_vend_id_fkey FOREIGN KEY (vend_id) REFERENCES public.lgvendor(vend_id);


--
-- PostgreSQL database dump complete
--

