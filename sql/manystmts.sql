select * from plnvk_tenant_master;
update plnvk_tenant_master set createdby=1, updatedby=1 where tenantid=2;
delete from plnvk_tenant_master where tenantid=3;
select * from user_login_attempts;
update user_login_attempts set attempts=0 where id=3;
alter table plnvk_tenant_master AUTO_INCREMENT=3;

delete from user_login_attempts where id=2;

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

select * from iso_cntryphcodes where isoname='guinea';

update iso_cntryphcodes set isocode3='GIN', dialcode='224' where isoname='guinea';

