-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.24-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla gestor.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla gestor.migrations: ~4 rows (aproximadamente)
INSERT IGNORE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(3, '2022_03_31_084318_create_pictures_table', 1),
	(4, '2014_10_12_100000_create_password_resets_table', 2);

-- Volcando estructura para tabla gestor.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla gestor.password_resets: ~5 rows (aproximadamente)
INSERT IGNORE INTO `password_resets` (`email`, `token`, `created_at`) VALUES
	('elkhouryghassan712@gmail.com', 'Wns1I20aO7Nr93VNZXbdtJBKf0Ik4O1cX8KDFVWViZBE2o68EOjDCinB0eG4HIaa', '2022-09-21 13:50:36'),
	('elkhouryghassan712@gmail.com', 'eIk3nNkmrlpF42g02F80I43B7COFmPsPFFuDEqUF8rcGXc2SHOvuG10bAG7HczkN', '2022-09-21 13:51:54'),
	('elkhouryghassan712@gmail.com', 'mv0JUJjrA7Y8LVF4kHe5qjGkF98CvY721rhNBSgFm5VPmToF2B8HXUeD40bi1OuQ', '2022-09-21 13:52:15'),
	('elkhouryghassan712@gmail.com', '4uWrX07pWp5Vt1yYhufDXD7Wc3Msapdp1mmeEOTrMH3xCvCAfLcKzYqFGU64XToa', '2022-09-23 05:12:52'),
	('elkhouryghassan712@gmail.com', 'b1QVeefI88QHLbXmoWcLLIvxQFGXlObQWNj8QMeLuchwcsc7f1cViEQeeIp6Wdxq', '2022-09-23 08:43:45');

-- Volcando estructura para tabla gestor.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla gestor.personal_access_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla gestor.pictures
CREATE TABLE IF NOT EXISTS `pictures` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `picture_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` tinyint(4) NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pictures_user_id_foreign` (`user_id`),
  CONSTRAINT `pictures_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla gestor.pictures: ~6 rows (aproximadamente)
INSERT IGNORE INTO `pictures` (`id`, `picture_name`, `picture_url`, `rating`, `user_id`, `created_at`, `updated_at`, `date`) VALUES
	(19, 'asfdasdf', 'YehdH0lJy5DBWmX3ocNv4o5pQyXSHzsUptCxv5gL.jpg', 5, 1, '2022-09-21 11:52:09', '2022-09-21 11:52:09', '2022-09-24'),
	(20, 'adfadfagda', 'pQeAfPsWjcBAAVsirM3irD81aM5aU0nU3Ayjz4fF.jpg', 5, 1, '2022-09-21 11:53:18', '2022-09-21 11:53:18', '2022-09-09'),
	(21, 'esta si', 'uLPwZy10MWiHbHt8toH5h6HW6mA0HQAbwmsuCvOY.jpg', 5, 1, '2022-09-21 11:54:05', '2022-09-21 11:54:05', '2022-09-08'),
	(22, '134141234', 'HH3WRh7p6IiXcPFHcPVDviB1oK0aruDEp85O0Ekd.jpg', 5, 1, '2022-09-21 11:54:29', '2022-09-21 11:54:29', '2022-09-02'),
	(23, 'Ghassan', 'CRa4uyMEjHblyc6jk1tnqrAjmdLcssdIV83tiqW4.jpg', 5, 1, '2022-09-21 11:55:21', '2022-09-21 11:55:21', '2022-09-02'),
	(24, 'Imagen Actual', '5MDC0pWcEUED9L0tvJBG3Oj3PzrSOZeWyUSWUish.jpg', 5, 1, '2022-09-21 12:00:22', '2022-09-21 12:00:22', '2022-09-30'),
	(25, 'Imagen Nueva', 'O0jrdt3bZoShTw6MCctwBTFqJNBAB8WZiNdpbeZ5.jpg', 5, 1, '2022-09-21 12:02:05', '2022-09-21 12:02:05', '2022-09-01');

-- Volcando estructura para tabla gestor.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_unique` (`name`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla gestor.users: ~0 rows (aproximadamente)
INSERT IGNORE INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Antonio14', 'elkhouryghassan712@gmail.com', NULL, '$2y$10$6Td3NfV77LZfaWQ7uHskpesVSNha5tPPNpp1osBtcJVkW7oa96lmW', NULL, '2022-09-21 09:15:33', '2022-09-21 09:15:33');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
