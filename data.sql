-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table enterkomputer.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table enterkomputer.cache: ~0 rows (approximately)

-- Dumping structure for table enterkomputer.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table enterkomputer.cache_locks: ~0 rows (approximately)

-- Dumping structure for table enterkomputer.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table enterkomputer.categories: ~3 rows (approximately)
INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Makanan', NULL, NULL),
	(2, 'Minuman', NULL, NULL),
	(3, 'Promo', NULL, NULL);

-- Dumping structure for table enterkomputer.counters
CREATE TABLE IF NOT EXISTS `counters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table enterkomputer.counters: ~3 rows (approximately)
INSERT INTO `counters` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Meja No 1', '2024-08-05 05:35:08', '2024-08-05 05:35:08'),
	(2, 'Meja No 2', '2024-08-05 05:35:08', '2024-08-05 05:35:08'),
	(3, 'Meja No 3', '2024-08-05 05:35:08', '2024-08-05 05:35:08');

-- Dumping structure for table enterkomputer.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table enterkomputer.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table enterkomputer.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table enterkomputer.jobs: ~0 rows (approximately)

-- Dumping structure for table enterkomputer.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table enterkomputer.job_batches: ~0 rows (approximately)

-- Dumping structure for table enterkomputer.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table enterkomputer.migrations: ~12 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(181, '0001_01_01_000000_create_users_table', 1),
	(182, '0001_01_01_000001_create_cache_table', 1),
	(183, '0001_01_01_000002_create_jobs_table', 1),
	(184, '2024_08_04_021510_create_personal_access_tokens_table', 1),
	(185, '2024_08_04_024223_create_products_table', 1),
	(186, '2024_08_04_024409_create_categories_table', 1),
	(187, '2024_08_04_030954_create_promos_table', 1),
	(188, '2024_08_04_031003_create_promo_items_table', 1),
	(189, '2024_08_04_032737_create_counters_table', 1),
	(190, '2024_08_04_032903_create_printers_table', 1),
	(191, '2024_08_04_033529_create_orders_table', 1),
	(192, '2024_08_04_033934_create_order_items_table', 1);

-- Dumping structure for table enterkomputer.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `counter_id` bigint unsigned NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table enterkomputer.orders: ~0 rows (approximately)

-- Dumping structure for table enterkomputer.order_items
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `qty` int NOT NULL,
  `total_price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table enterkomputer.order_items: ~0 rows (approximately)

-- Dumping structure for table enterkomputer.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table enterkomputer.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table enterkomputer.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table enterkomputer.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table enterkomputer.printers
CREATE TABLE IF NOT EXISTS `printers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table enterkomputer.printers: ~3 rows (approximately)
INSERT INTO `printers` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Printer Kasir', '2024-08-05 05:35:08', '2024-08-05 05:35:08'),
	(2, 'Printer Dapur', '2024-08-05 05:35:08', '2024-08-05 05:35:08'),
	(3, 'Printer Bar', '2024-08-05 05:35:08', '2024-08-05 05:35:08');

-- Dumping structure for table enterkomputer.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `category_id` bigint unsigned NOT NULL,
  `promo_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table enterkomputer.products: ~15 rows (approximately)
INSERT INTO `products` (`id`, `parent_id`, `category_id`, `promo_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
	(1, NULL, 2, NULL, 'Jeruk', NULL, '2024-08-05 05:35:08', '2024-08-05 05:35:08'),
	(2, 1, 2, NULL, 'Jeruk Dingin', 12000, '2024-08-05 05:35:08', '2024-08-05 05:35:08'),
	(3, 1, 2, NULL, 'Jeruk Panas', 10000, '2024-08-05 05:35:08', '2024-08-05 05:35:08'),
	(4, NULL, 2, NULL, 'Teh', NULL, '2024-08-05 05:35:08', '2024-08-05 05:35:08'),
	(5, 4, 2, NULL, 'Teh Manis', 8000, '2024-08-05 05:35:08', '2024-08-05 05:35:08'),
	(6, 4, 2, NULL, 'Teh Tawar', 5000, '2024-08-05 05:35:08', '2024-08-05 05:35:08'),
	(7, NULL, 2, NULL, 'Kopi', NULL, '2024-08-05 05:35:08', '2024-08-05 05:35:08'),
	(8, 7, 2, NULL, 'Kopi Dingin', 8000, '2024-08-05 05:35:08', '2024-08-05 05:35:08'),
	(9, 7, 2, NULL, 'Kopi Panas', 6000, '2024-08-05 05:35:08', '2024-08-05 05:35:08'),
	(10, NULL, 2, NULL, 'Extra Es Batu', 2000, '2024-08-05 05:35:08', '2024-08-05 05:35:08'),
	(11, NULL, 1, NULL, 'Mie', NULL, '2024-08-05 05:35:08', '2024-08-05 05:35:08'),
	(12, 11, 1, NULL, 'Mie Goreng', 15000, '2024-08-05 05:35:08', '2024-08-05 05:35:08'),
	(13, 11, 1, NULL, 'Mie Kuah', 15000, '2024-08-05 05:35:08', '2024-08-05 05:35:08'),
	(14, NULL, 1, NULL, 'Nasi Goreng', 15000, '2024-08-05 05:35:08', '2024-08-05 05:35:08'),
	(15, NULL, 3, 1, 'Nasi Goreng + Jeruk Dingin', 23000, '2024-08-05 05:35:08', '2024-08-05 05:35:08');

-- Dumping structure for table enterkomputer.promos
CREATE TABLE IF NOT EXISTS `promos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table enterkomputer.promos: ~1 rows (approximately)
INSERT INTO `promos` (`id`, `name`, `price`, `created_at`, `updated_at`) VALUES
	(1, 'Nasi Goreng + Jeruk Dingin', 23000, '2024-08-05 05:35:08', '2024-08-05 05:35:08');

-- Dumping structure for table enterkomputer.promo_items
CREATE TABLE IF NOT EXISTS `promo_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `promo_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table enterkomputer.promo_items: ~2 rows (approximately)
INSERT INTO `promo_items` (`id`, `promo_id`, `product_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 14, '2024-08-05 05:35:08', '2024-08-05 05:35:08'),
	(2, 1, 2, '2024-08-05 05:35:08', '2024-08-05 05:35:08');

-- Dumping structure for table enterkomputer.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table enterkomputer.sessions: ~0 rows (approximately)

-- Dumping structure for table enterkomputer.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table enterkomputer.users: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
