-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.26-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table cms_db.client_list
CREATE TABLE IF NOT EXISTS `client_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `client_code` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `fullname` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = Active, 2= Inactive',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cms_db.client_list: ~2 rows (approximately)
/*!40000 ALTER TABLE `client_list` DISABLE KEYS */;
REPLACE INTO `client_list` (`id`, `client_code`, `password`, `fullname`, `status`, `date_created`, `date_updated`) VALUES
	(1, '20210001', 'a88df23ac492e6e2782df6586a0c645f', 'Williams, Mike D', 1, '2021-11-05 13:12:15', '2021-11-05 14:58:01'),
	(4, '20210002', '100af4e620024b40bbfc49214ea66509', 'Lou, Samantha Jane C', 1, '2021-11-05 14:59:58', '2021-11-05 15:19:32');
/*!40000 ALTER TABLE `client_list` ENABLE KEYS */;

-- Dumping structure for table cms_db.client_meta
CREATE TABLE IF NOT EXISTS `client_meta` (
  `client_id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  KEY `client_id` (`client_id`),
  CONSTRAINT `client_meta_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cms_db.client_meta: ~20 rows (approximately)
/*!40000 ALTER TABLE `client_meta` DISABLE KEYS */;
REPLACE INTO `client_meta` (`client_id`, `meta_field`, `meta_value`) VALUES
	(1, 'lastname', 'Williams'),
	(1, 'firstname', 'Mike'),
	(1, 'middlename', 'D'),
	(1, 'gender', 'Male'),
	(1, 'dob', '1997-06-23'),
	(1, 'contact', '09223554991'),
	(1, 'address', 'My Address, Here City, There Province, 2306'),
	(1, 'email', 'mwilliams@sample.com'),
	(1, 'cpassword', 'mwilliams'),
	(1, 'cur_password', '20210001'),
	(4, 'lastname', 'Lou'),
	(4, 'firstname', 'Samantha Jane'),
	(4, 'middlename', 'C'),
	(4, 'gender', 'Female'),
	(4, 'dob', '1997-10-14'),
	(4, 'contact', '097876546522'),
	(4, 'address', 'Sample Address Only, Anywhere, 2306'),
	(4, 'email', 'sjlou@sample.com'),
	(4, 'cpassword', ''),
	(4, 'cur_password', '20210002');
/*!40000 ALTER TABLE `client_meta` ENABLE KEYS */;

-- Dumping structure for table cms_db.invoice_list
CREATE TABLE IF NOT EXISTS `invoice_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `invoice_code` varchar(50) NOT NULL,
  `client_id` int(30) NOT NULL,
  `total_amount` float NOT NULL DEFAULT '0',
  `discount_perc` float NOT NULL DEFAULT '0',
  `discount` float NOT NULL DEFAULT '0',
  `tax_perc` float NOT NULL DEFAULT '0',
  `tax` float NOT NULL DEFAULT '0',
  `remarks` text,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=pending, 1=Paid',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cms_db.invoice_list: ~2 rows (approximately)
/*!40000 ALTER TABLE `invoice_list` DISABLE KEYS */;
REPLACE INTO `invoice_list` (`id`, `invoice_code`, `client_id`, `total_amount`, `discount_perc`, `discount`, `tax_perc`, `tax`, `remarks`, `status`, `date_created`, `date_updated`) VALUES
	(1, '202100001', 1, 592.9, 2, 12.1, 12, 72.6, 'Sample Only', 1, '2021-11-05 13:12:43', '2021-11-05 13:45:49'),
	(3, '202100002', 4, 717.24, 5, 37.7495, 12, 90.5988, 'Sample Invoice 2', 1, '2021-11-05 15:10:47', '2021-11-05 15:19:56');
/*!40000 ALTER TABLE `invoice_list` ENABLE KEYS */;

-- Dumping structure for table cms_db.invoice_services
CREATE TABLE IF NOT EXISTS `invoice_services` (
  `invoice_id` int(30) NOT NULL,
  `service_id` int(30) NOT NULL,
  `price` float NOT NULL DEFAULT '0',
  KEY `invoice_id` (`invoice_id`),
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cms_db.invoice_services: ~7 rows (approximately)
/*!40000 ALTER TABLE `invoice_services` DISABLE KEYS */;
REPLACE INTO `invoice_services` (`invoice_id`, `service_id`, `price`) VALUES
	(1, 1, 250),
	(1, 3, 355),
	(2, 3, 355),
	(2, 1, 250),
	(2, 2, 399.99),
	(3, 2, 399.99),
	(3, 3, 355);
/*!40000 ALTER TABLE `invoice_services` ENABLE KEYS */;

-- Dumping structure for table cms_db.services_list
CREATE TABLE IF NOT EXISTS `services_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cms_db.services_list: ~3 rows (approximately)
/*!40000 ALTER TABLE `services_list` DISABLE KEYS */;
REPLACE INTO `services_list` (`id`, `name`, `description`, `price`, `status`, `date_created`, `date_updated`) VALUES
	(1, 'Device Cleaning', 'Device Cleaning', 250, 1, '2021-11-05 09:48:30', '2021-11-05 09:48:30'),
	(2, 'Software Trouble Shooting', 'Software Trouble Shooting', 399.99, 1, '2021-11-05 09:50:34', '2021-11-05 09:50:34'),
	(3, 'Parts Replacements', 'Parts Replacements', 355, 1, '2021-11-05 09:51:53', '2021-11-05 09:51:53');
/*!40000 ALTER TABLE `services_list` ENABLE KEYS */;

-- Dumping structure for table cms_db.system_info
CREATE TABLE IF NOT EXISTS `system_info` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cms_db.system_info: ~6 rows (approximately)
/*!40000 ALTER TABLE `system_info` DISABLE KEYS */;
REPLACE INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
	(1, 'name', 'Client Management System in PHP'),
	(6, 'short_name', 'CMS-PHP'),
	(11, 'logo', 'uploads/logo-1648796846.png'),
	(13, 'user_avatar', 'uploads/user_avatar.jpg'),
	(14, 'cover', 'uploads/cover-1636097638.png'),
	(15, 'content', 'Array');
/*!40000 ALTER TABLE `system_info` ENABLE KEYS */;

-- Dumping structure for table cms_db.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(250) NOT NULL,
  `middlename` text,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cms_db.users: ~3 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
	(1, 'tedted admin', NULL, 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1635556826', NULL, 1, '2021-01-20 14:02:37', '2022-04-01 15:08:31'),
	(11, 'Claire', NULL, 'Blake', 'cblake', 'cd74fae0a3adf459f73bbf187607ccea', 'uploads/avatar-11.png?v=1635920566', NULL, 1, '2021-11-03 14:22:46', '2021-11-03 14:22:46'),
	(14, 'John', NULL, 'Smith', 'jsmith', '39ce7e2a8573b41ce73b5ba41617f8f7', 'uploads/avatar-14.png?v=1636074078', NULL, 2, '2021-11-05 09:01:18', '2021-11-05 09:01:18');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table cms_db.user_meta
CREATE TABLE IF NOT EXISTS `user_meta` (
  `user_id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cms_db.user_meta: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
