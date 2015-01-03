CREATE TABLE `vrf_admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(60) NOT NULL,
  `shortname` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `designation` varchar(20) NOT NULL,
  `reportsto` int(10) DEFAULT NULL,
  `createdby` int(10) NOT NULL,
  `level` int(3) NOT NULL DEFAULT '0',
  `status` int(2) DEFAULT '0',
  `tzoffset` int(6) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `IDX_shortname` (`shortname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
