DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_vrf_org_insert`(
        IN  orgname		               	VARCHAR(120), 
        IN  contactip                  	VARCHAR(45), 
        IN  isocountrycode             	VARCHAR(3), 
        IN  contactname                	VARCHAR(60),
        IN  contactphoneoffice         	VARCHAR(20), 
        IN  contactphonemobile         	VARCHAR(20),
        IN	contactemail				VARCHAR(100),
        IN 	contactdesignation			VARCHAR(45),
        IN 	tzoffset					INT(6),
        OUT organizationid				VARCHAR(15),
        OUT regerror					VARCHAR(30)
     )
BEGIN
		DECLARE oid VARCHAR(15);
        DECLARE idtemp INT(8);
        DECLARE tname CHAR(9);
        DECLARE modval INT(1);
        DECLARE sqltext VARCHAR(300);
        DECLARE rowcount INT;

        
		SELECT `AUTO_INCREMENT` INTO @idtemp FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_SCHEMA = 'verifyed_01_001' AND TABLE_NAME = 'vrf_org_seq';
        COMMIT;
        
        SELECT @idtemp MOD 10 INTO @modval;
        COMMIT;
        
        SELECT CONCAT('vrf_org_', @modval) INTO @tname;
        COMMIT;
        
        SELECT CONCAT('01-001-', LPAD(CAST(@idtemp AS CHAR),8,'0')) INTO @oid;
        COMMIT;
                
		SELECT orgid INTO @oid FROM vrf_org_seq where name=orgname;
		SELECT FOUND_ROWS() INTO @rowcount;
        /** This should only return 1 row **/
        IF (@rowcount > 0) THEN
		BEGIN
            set regerror := 'Duplicate Name';
			set organizationid := @oid;
        END;
        ELSE
        BEGIN
			SET @sqltext := concat(
							 'INSERT INTO ', @tname, ' (
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
							) VALUES (',
							   '\'', @oid, '\'',',',
							   '\'', orgname, '\'',',',
							   '\'', contactip, '\'',',', 
							   '\'',isocountrycode, '\'',',', 
							   '\'',contactname, '\'',',',
							   '\'', contactphoneoffice, '\'',',',
							   '\'', contactphonemobile, '\'',',',
							   '\'', contactemail, '\'',',',
							   '\'',contactdesignation, '\'',',',
							   tzoffset,',',
							   '\'', UTC_TIMESTAMP(), '\'',',',
							   '\'', UTC_TIMESTAMP(), '\'',
							 ')');


			PREPARE stmt FROM @sqltext;
			EXECUTE stmt;
			DEALLOCATE PREPARE stmt;
			
			insert into vrf_org_seq set id = @id, name=orgname, orgid=@oid;
		
		set organizationid := @oid;
		COMMIT;
		END;
        END IF;
END$$
DELIMITER ;
