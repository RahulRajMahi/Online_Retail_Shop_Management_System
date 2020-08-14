connect retailshopdb/retailshopdb;
drop table customer_complain;
drop table company_distributor;
drop table stock;
drop table product_customer_taken;
drop table invoice;
drop table offers;
drop table log_in;
drop table employee_info;
drop table customer_info;
drop table product_info;
drop table distributor_info;
drop table tax;
drop table variable_cost;
conn system/manager;
drop user retailshopdb;
commit;
exit