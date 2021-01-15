clear screen;

	
DROP TABLE USERS CASCADE CONSTRAINTS;
DROP TABLE USES CASCADE CONSTRAINTS;
DROP TABLE PARKINGSLOAT CASCADE CONSTRAINTS;
DROP TABLE OWNER CASCADE CONSTRAINTS;
DROP TABLE LOCATION CASCADE CONSTRAINTS;


CREATE TABLE USERS (
	id number, 
	uname varchar2(30), 
	email varchar2(100),  
	password char(30),
	primary key(id) ,
	constraint uc_user unique(uname,email));
	
CREATE TABLE LOCATION(
	lid number, 
	area varchar2(30), 
    PRIMARY KEY(lid));	

CREATE TABLE OWNER (
	oid number, 
	lid number, 
	oname varchar2(30), 
	phoneno varchar2(11),
    PRIMARY KEY(oid),
	FOREIGN KEY(lid) REFERENCES LOCATION(lid),
	unique(phoneno));

CREATE TABLE PARKINGSLOAT(
	psid number, 
	price number, 
	booked number, 
	lid number,
	oid number,
	FOREIGN KEY(lid) REFERENCES LOCATION(lid),
	FOREIGN KEY(oid) REFERENCES OWNER(oid),
    PRIMARY KEY(psid));
	
CREATE TABLE USES(
	id number,
	PSid number,
	oid number,
	FOREIGN KEY(id) REFERENCES USERS(id),
	FOREIGN KEY(psid) REFERENCES PARKINGSLOAT(psid),
	FOREIGN KEY(oid) REFERENCES OWNER(oid));
--(uname,email,password) 
insert into USERS values(1001,'zahid','fesabelilla@gmail.com','zahid'); 
insert into USERS values(1002,'hasan','hasan@gmail.com','hasan'); 
insert into USERS values(1003,'karim','karim@gmail.com','karim'); 
insert into USERS values(1004,'abdullah','abdullah@gmail.com','abdullah'); 
insert into USERS values(1005,'kamal','kamal@gmail.com','kamal');

 
insert into LOCATION values(2001,'Modhubagh'); 
insert into LOCATION values(2002,'Moghbazar'); 
insert into LOCATION values(2003,'Mirbagh'); 
insert into LOCATION values(2004,'Uttara'); 
insert into LOCATION values(2005,'Kamalapur');


insert into OWNER values(3001,2001,'Salim','01731927434'); 
insert into OWNER values(3002,2002,'Salam','01731927435'); 
insert into OWNER values(3003,2003,'Kalam','01731927436'); 
insert into OWNER values(3004,2004,'Kalim','01731927437'); 
insert into OWNER values(3005,2005,'Halim','01731927438'); 


insert into PARKINGSLOAT values(4001,10,0,2001,3001); 
insert into PARKINGSLOAT values(4002,20,0,2001,3002); 
insert into PARKINGSLOAT values(4003,25,0,2001,3001); 
insert into PARKINGSLOAT values(4004,12,0,2001,3001); 
insert into PARKINGSLOAT values(4005,10,0,2002,3002); 
insert into PARKINGSLOAT values(4006,10,0,2003,3003); 
insert into PARKINGSLOAT values(4007,10,0,2004,3004); 
insert into PARKINGSLOAT values(4008,10,0,2005,3005); 	
	
	
commit;