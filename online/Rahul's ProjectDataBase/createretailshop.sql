create user retailshopdb identified by retailshopdb;
grant resource, connect, dba to retailshopdb;
connect retailshopdb/retailshopdb;


create table log_in
(
user_name varchar2(40) constraint user_nm_pk primary key,
password varchar2(15) constraint pwd_chk check(password >= 6) not null,
user_type varchar2(10) default 'CUSTOMER' not null,
hint_question varchar2(50) not null
);

create table employee_info
(
emp_id varchar2(6) constraint emp_pk primary key,
emp_name varchar2(40) not null,
emp_mobile_no varchar2(11) constraint emp_mbl_chk check(emp_mobile_no > 0) not null,
emp_address varchar2(100) not null,
emp_date_of_join date not null,
emp_salary number(6) constraint emp_sal_chk check(emp_salary > 0) not null,
emp_sex char constraint emp_sex_chk check(emp_sex in('M','F')) not null
);

create table customer_info
(
cust_id varchar2(6) constraint cust_pk primary key,
cust_name varchar2(40) not null,
cust_address varchar2(100) not null,
cust_mobile_no number(10)  constraint cust_mbl_chk check(cust_mobile_no > 0) not null,
cust_email_id varchar2(40) not null,
cust_type char(9) default 'ARBITRARY' constraint cust_type_chk check(cust_type in('PERMANENT','ARBITRARY','CUSTOMER')) not null
);

create table product_info
(
product_id varchar2(12) constraint product_id_pk primary key,
product_mrp number(8,2) constraint product_mrp_chk check(product_mrp > 0) not null,
product_category varchar2(7) constraint product_cat_chk check(product_category in('KIRANA','GENERAL')) not null,
product_pkd_on date not null,
product_best_before date not null,
product_name varchar2(35) not null,
product_company varchar2(35) unique not null,
product_landing_rate number(8,2) constraint product_land_rate_chk check(product_landing_rate >0) not null
);

create table distributor_info
(
distributor_firm_id varchar2(10) constraint distributor_id_pk primary key,
distributor_name varchar2(40) not null,
distributor_contact_no varchar2(12) not null,
distributor_address varchar2(100) not null,
distributor_email_id varchar2(40) not null
);

create table tax
(
tax_id varchar2(6) constraint tax_id_pk primary key,
tax_type varchar2(10) not null,
tax_amount number(9,2) constraint tax_amount_chk check(tax_amount > 0) not null
);

create table variable_cost
(
month_name varchar2(9) not null,
year number(4) not null,
electricity_bill number(8,2) not null,
telephone_bill number(7,2) not null,
shop_rent number(8,2),
constraint month_year_pk primary key(month_name,year),
constraint year_chk check(year >= 2011),
constraint electric_bill_chk check(electricity_bill > 0),
constraint telephone_bill_chk check(telephone_bill > 0),
constraint shop_rent_chk check(shop_rent >= 0)
);

create table offers
(
offer_id varchar2(5) constraint offer_id_pk primary key,
offer_name varchar2(100) not null,
cust_type char(10) default 'ARBITRARY' constraint cust_type_chek check(cust_type in('PERMANENT','ARBITRARY','CUSTOMER')) not null,
offer_launched_at date not null,
offer_ends_at date not null,
product_id varchar2(12) constraint product_id_offers_fk references product_info on delete cascade,
discount_per number(4,2) constraint discount_prtg_chk check(discount_per >= 0)
);

create table invoice
(
invoice_no varchar2(7) constraint invoice_no_pk primary key,
invoice_date date not null,
cust_id varchar2(10) constraint cust_id_invoice_fk references customer_info on delete cascade not null,
vat number(4,2) constraint vat_chk check(vat > 0),
discount_per number(4,2) constraint discount_per_chk check(discount_per >= 0),
discount_amount number(7,2) constraint discount_amt_chk check(discount_amount >= 0),
payment_amount number(9,2) constraint payment_amt_chk check(payment_amount > 0) not null
);

create table product_customer_taken
(
cust_id varchar2(10) constraint cust_id_prod_cust_taken_fk references customer_info on delete cascade not null,
product_id varchar2(12) constraint product_id_prod_cust_taken_fk references product_info on delete cascade not null,
quantity_taken number(3) constraint qty_taken_chk check(quantity_taken > 0) not null
);

create table stock
(
product_id varchar2(12) constraint product_id_stock_fk references product_info on delete cascade not null,
qty_in_hand number(4) constraint qty_in_hand_chk check(qty_in_hand >= 0) not null,
product_category varchar2(7) constraint product_cat_chek check(product_category in('KIRANA','GENERAL')) not null
);

create table company_distributor
(
product_company varchar2(35) constraint prod_comp_distrbtr_fk references product_info(product_company) on delete cascade not null,
distributor_firm_id varchar2(10) constraint distrbtr_id_comp_distrbtr_fk references distributor_info(distributor_firm_id) on delete cascade not null
);

create table customer_complain
(
cust_id varchar2(10) constraint cust_id_custmr_compln_fk references customer_info on delete cascade not null,
complain_date date not null,
complain_id varchar2(6) constraint complain_id_pk primary key,
complain_type varchar2(80) not null,
complain_status varchar2(11) constraint cmpln_status_chk check(complain_status in('RESOLVED','UNRESOLVED')) not null,
product_category varchar2(7) constraint product_ctgry_chk check(product_category in('KIRANA','GENERAL')) not null,
product_id varchar2(12) constraint product_id_cust_complain_fk references product_info on delete cascade not null
);


commit;
exit    