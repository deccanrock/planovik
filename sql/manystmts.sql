select * from plnvk_account_master;
select * from plnvk_tenant_master;

SELECT @@global.time_zone, @@session.time_zone;

SET GLOBAL time_zone = '+00:00';

INSERT INTO `plnvk_tenant_master` VALUES (1,1,'Planovik WWW','www','z1_planovik_main','127.0.0.1',1,0,0,2,0,0,0,'MZygpewJsCpRrfOr1SFG',12345,NULL,'2015-07-26 13:37:11','2015-07-26 13:37:11',1,1);

Select jndiname from plnvk_db_map where zoneid=1 and tenanttype=2 
and isavailfornewcon = 'N' order by dateupdated LIMIT 1;

SELECT jndiname IS NULL, jndiname = '' from plnvk_

Select jndiname from plnvk_db_map where zoneid=1 and tenanttype=2 and isavailfornewcon = 'Y'; 

select * from plnvk_db_map;

update plnvk_tenant_master set tenanttype=0 where tenantid=2;

update plnvk_db_map set tenanttype=2 where dbid=4;

update plnvk_account_master set contactpswd='$2a$10$4zv/luCTXrTi/5LCeB3MHOfZr2JVgKcW/v4y6X54dhurYwRpyHh3K' where id=1;

insert into plnvk_tenant_master (accountid, tenantdesc, tenantname, jndiname, regip, zoneid, tenanttype, status) 
values (1, 'Planovik Corp', 'corp', 'z1_planovik_main', '127.0.0.1', 1, 1, 2);

delete from plnvk_account_master where id=2;
alter table plnvk_tenant_master AUTO_INCREMENT=2;

delete from plnvk_tenant_master where tenantid=2;

insert into plnvk_account_master (orgname, accountname, accountemail, contactpswd, contactdesignation, contactphonemobile, accountstatus, addrstreet1, addrstreet2, addrcitytown, addrstateprovrgn, addrpostalcode, addrcountrycode, addrhomeurl, createdby, updatedby)
values('Planovik', 'Srinivas Paruchuri', 'sriniv@yahoo.com', '$2a$08$w0QcUUuPjkGcfdMMXBXO8ODz/pv4n7..HHtwlNHubuJaPGdA3F.iu', 'Founder', '+91-9866277000', 2, 'Plot No 32 Rao and Raju Colony',
'Road No 2 Banjara Hills', 'Hyderabad', 'Telangana', '500034', 'IN', 'www.planovik.com', 1, 1);

insert into plnvk_account_master (orgname, accountname, accountemail, contactpswd, contactdesignation, contactphonemobile, accountstatus, addrstreet1, addrstreet2, addrcitytown, addrstateprovrgn, addrpostalcode, addrcountrycode, addrhomeurl, createdby, updatedby)
values('Planovik Corp', 'Srinivas Paruchuri', 'deccanrock@ygmail.com', '$2a$08$w0QcUUuPjkGcfdMMXBXO8ODz/pv4n7..HHtwlNHubuJaPGdA3F.iu', 'Founder/CTO', '+91-9866277000', 2, 'Plot No 32 Rao and Raju Colony',
'Road No 2 Banjara Hills', 'Hyderabad', 'Telangana', '500034', 'IN', 'www.planovik.com', 1, 1);



select * from plnvk_tenant_master;
update plnvk_account_master set orgname='Deccan Rock Pvt Ltd' where id=1;

update plnvk_tenant_master set contactname='Rakhee Kumar Paruchuri' where tenantid=3;

delete from plnvk_tenant_master where tenantid=1;
select * from user_login_attempts;
update user_login_attempts set attempts=0 where id=4;
alter table plnvk_tenant_master AUTO_INCREMENT=1;

delete from user_login_attempts where id=2;

select * from plnvk_countryzone_map;
delete from plnvk_countryzone_map where zoneid=6;
update plnvk_countryzone_map set countrycode="IN" where zoneid=1;

select * from user_roles_map;
select * from users;

select * from plnvk_db_map;
delete from plnvk_db_map where dbid=1;
alter table plnvk_db_map AUTO_INCREMENT=1;

update plnvk_db_map set jndiname='z1_planovik_main' where dbid=1;

insert into plnvk_db_map (zoneid, jndiname, url, active, tenanttype, isavailfornewcon, datecreated, dateupdated, createdby, updatedby)
values(1, 'z1_planovik_pro_2', 'jdbc:mysql://192.168.1.108:3307/z1_planovik_pro_2', 'Y', 0, 'Y', UTC_TIMESTAMP(), UTC_TIMESTAMP(), 1, 1);

update plnvk_db_map set url = 'jdbc:mysql://192.168.1.108:3306/z1_planovik_main' where dbid=1;

delete from plnvk_db_map where dbid=2;

select * from itin_currconv;

select * from isocurrencies;

alter table plnvk_db_map AUTO_INCREMENT=1;

select * from plnvk_zone_map;
insert into plnvk_zone_map (name, hostingtype, hostingprovider, datecreated, dateupdated, createdby, updatedby) 
values ('Africa', 'Cloud', 'AWS', UTC_TIMESTAMP(), UTC_TIMESTAMP(), 1,1);

update plnvk_zone_map set name='EME' where zoneid=3;

select * from users;
update users set accountNonlocked=1 where id=2;
select * from user_login_attempts;
select * from user_roles;
select * from user_roles_map;

delete from user_roles_map where id=6;

insert into user_roles_map (id,username,role,datecreated,dateupdated) values (1, 'superadmin', 'ROLE_SUPERADMIN', UTC_TIMESTAMP(), UTC_TIMESTAMP());

delete from users where id=3;
update users set id=1 where id=7;

select * from itin_master;
select * from itin_activity_master;
delete from itin_activity_master where itinnum=1;
delete from itin_master where id=1;
select * from itin_activity_travel;
delete from itin_activity_travel where activityid=1;

alter table itin_master AUTO_INCREMENT=1;
alter table itin_activity_travel AUTO_INCREMENT=1;
alter table user_login_attempts AUTO_INCREMENT=1;
alter table users AUTO_INCREMENT=2;
alter table user_roles_map AUTO_INCREMENT=2;

select * from service_transport;
alter table service_transport AUTO_INCREMENT=1;
select * from service_airlines;
alter table service_airlines AUTO_INCREMENT=1;
select * from service_hotels;
alter table service_hotels AUTO_INCREMENT=1;
select * from service_other;
alter table service_other AUTO_INCREMENT=1;
delete from service_other where id=1;

insert into users (email, fullname, username, password, phone, designation, reportsto, createdby, level, enabled, accountNonExpired,
accountNonLocked, credentialsNonExpired, tzoffset, date_created, date_updated) 
values ('superadmin@planovik.com', 'Planovik Super admin', 'superadmin', '$2a$06$YCf.UwEWpKM3NKrPidB0qeCxm4VqwczFj.BYB2/rYteGBBa.824Z6',
		'+91-9866277000', 'Founder', 1, 1, 3, 1, 1, 1, 1, -330, UTC_TIMESTAMP(), UTC_TIMESTAMP());
        
update users set password='$2a$10$a09tsMcH/XeJ06DTHgncqOy3IwTeC3peFd3i.O1OtFc/4/Hy/9g4i' where id=1;

delete from users where id=6;
delete from user_roles_map where id=6;
delete from user_login_attempts where id=6;

select * from iso_cntryphcodes;
delete from iso_countryandphonecodes where name = 'Afghanistan,AFG,93';

update users set accountNonLocked=1 where id=6;

LOAD DATA LOCAL INFILE 'C:\\temp\\country_name_code_phonecode.csv' INTO TABLE iso_cntryphcodes FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n' (isoname, isocode2, isocode3, dialcode);

select * from iso_cntryphcodes where isocode2='IN';

update iso_cntryphcodes set isocode3='GIN', dialcode='224' where isoname='guinea';

mysqldump -u root -p -v planovik_main > planovik_main.sql
mysqladmin -u username -p create newdatabase
mysql -u username -p newdatabase < olddbdump.sql

LOAD DATA INFILE 'c:/workspace/planovik/sql/india_postal_codes.csv' 
INTO TABLE india_postalcodes 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select count(*) from in_postalcodes;

select * from in_postalcodes where pincode='522502';
select * from in_postalcodes where officename='Airoli';
delete from in_postalcodes where officename='Nowgam B.O';

UPDATE in_postalcodes SET officename=REPLACE(officename,'B.O','');
SET SQL_SAFE_UPDATES=0;

Call sp_gettenantfordomain('3', 0);

select count(*) from plnvk_tenant_master where tenantid=3 and pin=20096;


CREATE TABLE `itin_activity_codes` (
  `code` varchar(20) NOT NULL,
  `description` varchar(40) NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `itin_activity_codes` VALUES ('T_BOOK_ONEWAY','Booking One Way','2015-04-27 01:48:51','2015-04-27 01:48:51'),('T_BOOK_RETURN','Booking Return','2015-04-27 01:49:32','2015-04-27 01:49:32'),('T_PIKUPDRP','Pickup and Drop','2015-03-11 02:26:39','2015-03-11 02:26:39');