DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_vrf_org_insert`(
        IN  name		               	VARCHAR(120), 
        IN  contactip                  	VARCHAR(45), 
        IN  isocountrycode             	VARCHAR(3), 
        IN  contactname                	VARCHAR(60),
        IN  contactphoneoffice         	VARCHAR(20), 
        IN  contactphonemobile         	VARCHAR(20),
        IN	contactemail				VARCHAR(100),
        IN 	contactdesignation			VARCHAR(45),
        IN 	tzoffset					INT(6)
     )
BEGIN
		DECLARE orgid VARCHAR(15);
        DECLARE id INT(11);
        
		SELECT `AUTO_INCREMENT` as id FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_SCHEMA = 'verifyed_01_001' AND TABLE_NAME = 'vrf_org';
        
		set orgid = CONCAT('01-', '001-', LPAD(id,8,'0'));
        
        INSERT INTO vrf_org
         (
           orgid, 
           name, 
           contactip, 
           isocountrycode, 
           contactname, 
           contactphoneoffice,
           contactphonemobile,
           contactemail,
           contactdesignation,
           tzoffset,
           datecreated,
           dateupdated
         )
    VALUES 
         ( 
           orgid, 
           name, 
           contactip, 
           isocountrycode, 
           contactname, 
           contactphoneoffice,
           contactphonemobile,
           contactemail,
           contactdesignation,
           tzoffset,
           UTC_TIMESTAMP(),
           UTC_TIMESTAMP()
         );

   
END$$
DELIMITER ;
