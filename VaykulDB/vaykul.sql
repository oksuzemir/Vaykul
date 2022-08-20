-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 20 Ağu 2022, 21:50:34
-- Sunucu sürümü: 5.7.36
-- PHP Sürümü: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `vaykul`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vyk_commentmeta`
--

DROP TABLE IF EXISTS `vyk_commentmeta`;
CREATE TABLE IF NOT EXISTS `vyk_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vyk_comments`
--

DROP TABLE IF EXISTS `vyk_comments`;
CREATE TABLE IF NOT EXISTS `vyk_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Tablo döküm verisi `vyk_comments`
--

INSERT INTO `vyk_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Bir WordPress yorumcusu', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2022-04-18 12:15:31', '2022-04-18 09:15:31', 'Merhaba, bu bir yorumdur.\nYorum moderasyonuna başlamak, düzenlemek ve silmek için lütfen yönetim panelindeki yorumlar bölümünü ziyaret edin.\nYorumcuların avatarları <a href=\"https://gravatar.com\">Gravatar</a> üzerinden gelmektedir.', 0, '1', '', 'comment', 0, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vyk_links`
--

DROP TABLE IF EXISTS `vyk_links`;
CREATE TABLE IF NOT EXISTS `vyk_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vyk_options`
--

DROP TABLE IF EXISTS `vyk_options`;
CREATE TABLE IF NOT EXISTS `vyk_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=MyISAM AUTO_INCREMENT=1559 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Tablo döküm verisi `vyk_options`
--

INSERT INTO `vyk_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/Vaykul', 'yes'),
(2, 'home', 'http://localhost/Vaykul', 'yes'),
(3, 'blogname', 'Vaykul', 'yes'),
(4, 'blogdescription', 'Vaykul', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'info@vaykul.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '150', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '150', 'yes'),
(23, 'date_format', 'j F Y', 'yes'),
(24, 'time_format', 'H:i', 'yes'),
(25, 'links_updated_date_format', 'j F Y H:i', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:5:{i:0;s:21:\"polylang/polylang.php\";i:1;s:36:\"contact-form-7/wp-contact-form-7.php\";i:2;s:35:\"modula-best-grid-gallery/Modula.php\";i:3;s:21:\"webp-markon/index.php\";i:4;s:24:\"wordpress-seo/wp-seo.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '3', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:2:{i:0;s:55:\"C:\\wamp64\\www\\vaykul/wp-content/themes/vaykul/style.css\";i:1;s:0:\"\";}', 'no'),
(40, 'template', 'vaykul', 'yes'),
(41, 'stylesheet', 'vaykul', 'yes'),
(42, 'comment_registration', '0', 'yes'),
(43, 'html_type', 'text/html', 'yes'),
(44, 'use_trackback', '0', 'yes'),
(45, 'default_role', 'subscriber', 'yes'),
(46, 'db_version', '53496', 'yes'),
(47, 'uploads_use_yearmonth_folders', '1', 'yes'),
(48, 'upload_path', '', 'yes'),
(49, 'blog_public', '1', 'yes'),
(50, 'default_link_category', '2', 'yes'),
(51, 'show_on_front', 'page', 'yes'),
(52, 'tag_base', '', 'yes'),
(53, 'show_avatars', '1', 'yes'),
(54, 'avatar_rating', 'G', 'yes'),
(55, 'upload_url_path', '', 'yes'),
(56, 'thumbnail_size_w', '150', 'yes'),
(57, 'thumbnail_size_h', '150', 'yes'),
(58, 'thumbnail_crop', '1', 'yes'),
(59, 'medium_size_w', '300', 'yes'),
(60, 'medium_size_h', '300', 'yes'),
(61, 'avatar_default', 'mystery', 'yes'),
(62, 'large_size_w', '1024', 'yes'),
(63, 'large_size_h', '1024', 'yes'),
(64, 'image_default_link_type', 'none', 'yes'),
(65, 'image_default_size', '', 'yes'),
(66, 'image_default_align', '', 'yes'),
(67, 'close_comments_for_old_posts', '0', 'yes'),
(68, 'close_comments_days_old', '14', 'yes'),
(69, 'thread_comments', '1', 'yes'),
(70, 'thread_comments_depth', '5', 'yes'),
(71, 'page_comments', '0', 'yes'),
(72, 'comments_per_page', '50', 'yes'),
(73, 'default_comments_page', 'newest', 'yes'),
(74, 'comment_order', 'asc', 'yes'),
(75, 'sticky_posts', 'a:0:{}', 'yes'),
(76, 'widget_categories', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(77, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(78, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'uninstall_plugins', 'a:1:{s:24:\"wordpress-seo/wp-seo.php\";s:14:\"__return_false\";}', 'no'),
(80, 'timezone_string', '', 'yes'),
(81, 'page_for_posts', '66', 'yes'),
(82, 'page_on_front', '13', 'yes'),
(83, 'default_post_format', '0', 'yes'),
(84, 'link_manager_enabled', '0', 'yes'),
(85, 'finished_splitting_shared_terms', '1', 'yes'),
(86, 'site_icon', '0', 'yes'),
(87, 'medium_large_size_w', '768', 'yes'),
(88, 'medium_large_size_h', '0', 'yes'),
(89, 'wp_page_for_privacy_policy', '3', 'yes'),
(90, 'show_comments_cookies_opt_in', '1', 'yes'),
(91, 'admin_email_lifespan', '1665825330', 'yes'),
(92, 'disallowed_keys', '', 'no'),
(93, 'comment_previously_approved', '1', 'yes'),
(94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(95, 'auto_update_core_dev', 'enabled', 'yes'),
(96, 'auto_update_core_minor', 'enabled', 'yes'),
(97, 'auto_update_core_major', 'enabled', 'yes'),
(98, 'wp_force_deactivated_plugins', 'a:0:{}', 'yes'),
(99, 'initial_db_version', '51917', 'yes'),
(100, 'vyk_user_roles', 'a:7:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:62:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:20:\"wpseo_manage_options\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:36:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:15:\"wpseo_bulk_edit\";b:1;s:28:\"wpseo_edit_advanced_metadata\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:13:\"wpseo_manager\";a:2:{s:4:\"name\";s:11:\"SEO Manager\";s:12:\"capabilities\";a:38:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:15:\"wpseo_bulk_edit\";b:1;s:28:\"wpseo_edit_advanced_metadata\";b:1;s:20:\"wpseo_manage_options\";b:1;s:23:\"view_site_health_checks\";b:1;}}s:12:\"wpseo_editor\";a:2:{s:4:\"name\";s:10:\"SEO Editor\";s:12:\"capabilities\";a:36:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:15:\"wpseo_bulk_edit\";b:1;s:28:\"wpseo_edit_advanced_metadata\";b:1;}}}', 'yes'),
(101, 'fresh_site', '0', 'yes'),
(102, 'WPLANG', 'tr_TR', 'yes'),
(103, 'widget_block', 'a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:154:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Son Yazılar</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:224:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Son Yorumlar</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:147:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Arşivler</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:151:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Kategoriler</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'sidebars_widgets', 'a:4:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:13:\"widget-area-1\";a:0:{}s:13:\"widget-area-2\";a:0:{}s:13:\"array_version\";i:3;}', 'yes'),
(105, 'cron', 'a:11:{i:1658762132;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1658783732;a:4:{s:18:\"wp_https_detection\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1658801066;a:1:{s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1658826931;a:2:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1658826948;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1658826949;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1658832857;a:1:{s:13:\"wpseo-reindex\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1658832858;a:1:{s:31:\"wpseo_permalink_structure_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1658919258;a:1:{s:16:\"wpseo_ryte_fetch\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1660933585;a:1:{s:20:\"put_do_weekly_action\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:7:\"monthly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:2635200;}}}s:7:\"version\";i:2;}', 'yes'),
(106, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(115, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(116, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(117, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(119, 'recovery_keys', 'a:0:{}', 'yes'),
(1076, 'wpseo', 'a:56:{s:8:\"tracking\";b:0;s:22:\"license_server_version\";b:0;s:15:\"ms_defaults_set\";b:0;s:40:\"ignore_search_engines_discouraged_notice\";b:0;s:19:\"indexing_first_time\";b:1;s:16:\"indexing_started\";b:0;s:15:\"indexing_reason\";s:21:\"category_base_changed\";s:29:\"indexables_indexing_completed\";b:1;s:7:\"version\";s:4:\"18.6\";s:16:\"previous_version\";s:0:\"\";s:20:\"disableadvanced_meta\";b:1;s:30:\"enable_headless_rest_endpoints\";b:1;s:17:\"ryte_indexability\";b:1;s:11:\"baiduverify\";s:0:\"\";s:12:\"googleverify\";s:0:\"\";s:8:\"msverify\";s:0:\"\";s:12:\"yandexverify\";s:0:\"\";s:9:\"site_type\";s:0:\"\";s:20:\"has_multiple_authors\";s:0:\"\";s:16:\"environment_type\";s:0:\"\";s:23:\"content_analysis_active\";b:1;s:23:\"keyword_analysis_active\";b:1;s:21:\"enable_admin_bar_menu\";b:1;s:26:\"enable_cornerstone_content\";b:1;s:18:\"enable_xml_sitemap\";b:1;s:24:\"enable_text_link_counter\";b:1;s:22:\"show_onboarding_notice\";b:1;s:18:\"first_activated_on\";i:1650452058;s:13:\"myyoast-oauth\";b:0;s:26:\"semrush_integration_active\";b:1;s:14:\"semrush_tokens\";a:0:{}s:20:\"semrush_country_code\";s:2:\"us\";s:19:\"permalink_structure\";s:12:\"/%postname%/\";s:8:\"home_url\";s:23:\"http://localhost/Vaykul\";s:18:\"dynamic_permalinks\";b:0;s:17:\"category_base_url\";s:0:\"\";s:12:\"tag_base_url\";s:0:\"\";s:21:\"custom_taxonomy_slugs\";a:4:{s:8:\"language\";s:8:\"language\";s:17:\"post_translations\";s:17:\"post_translations\";s:13:\"term_language\";s:13:\"term_language\";s:17:\"term_translations\";s:17:\"term_translations\";}s:29:\"enable_enhanced_slack_sharing\";b:1;s:25:\"zapier_integration_active\";b:0;s:19:\"zapier_subscription\";a:0:{}s:14:\"zapier_api_key\";s:0:\"\";s:23:\"enable_metabox_insights\";b:1;s:23:\"enable_link_suggestions\";b:1;s:26:\"algolia_integration_active\";b:0;s:14:\"import_cursors\";a:0:{}s:13:\"workouts_data\";a:1:{s:13:\"configuration\";a:1:{s:13:\"finishedSteps\";a:0:{}}}s:36:\"dismiss_configuration_workout_notice\";b:0;s:19:\"importing_completed\";a:0:{}s:26:\"wincher_integration_active\";b:1;s:14:\"wincher_tokens\";a:0:{}s:36:\"wincher_automatically_add_keyphrases\";b:0;s:18:\"wincher_website_id\";s:0:\"\";s:18:\"first_time_install\";b:1;s:34:\"should_redirect_after_install_free\";b:1;s:34:\"activation_redirect_timestamp_free\";b:0;}', 'yes'),
(1147, 'wpseo_taxonomy_meta', 'a:1:{s:8:\"category\";a:2:{i:1;a:3:{s:13:\"wpseo_focuskw\";s:4:\"Blog\";s:13:\"wpseo_linkdex\";s:2:\"36\";s:19:\"wpseo_content_score\";s:1:\"0\";}i:17;a:3:{s:13:\"wpseo_focuskw\";s:13:\"Uncategorized\";s:13:\"wpseo_linkdex\";s:2:\"32\";s:19:\"wpseo_content_score\";s:1:\"0\";}}}', 'yes'),
(1223, 'widget_recent-posts', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(1077, 'wpseo_titles', 'a:126:{s:17:\"forcerewritetitle\";b:0;s:9:\"separator\";s:7:\"sc-dash\";s:16:\"title-home-wpseo\";s:42:\"%%sitename%% %%page%% %%sep%% %%sitedesc%%\";s:18:\"title-author-wpseo\";s:49:\"%%name%%, %%sitename%% sitesinin yazarı %%page%%\";s:19:\"title-archive-wpseo\";s:38:\"%%date%% %%page%% %%sep%% %%sitename%%\";s:18:\"title-search-wpseo\";s:69:\"%%searchphrase%% için arama yaptınız %%page%% %%sep%% %%sitename%%\";s:15:\"title-404-wpseo\";s:38:\"Sayfa bulunamadı %%sep%% %%sitename%%\";s:25:\"social-title-author-wpseo\";s:8:\"%%name%%\";s:26:\"social-title-archive-wpseo\";s:8:\"%%date%%\";s:31:\"social-description-author-wpseo\";s:0:\"\";s:32:\"social-description-archive-wpseo\";s:0:\"\";s:29:\"social-image-url-author-wpseo\";s:0:\"\";s:30:\"social-image-url-archive-wpseo\";s:0:\"\";s:28:\"social-image-id-author-wpseo\";i:0;s:29:\"social-image-id-archive-wpseo\";i:0;s:19:\"metadesc-home-wpseo\";s:0:\"\";s:21:\"metadesc-author-wpseo\";s:0:\"\";s:22:\"metadesc-archive-wpseo\";s:0:\"\";s:9:\"rssbefore\";s:0:\"\";s:8:\"rssafter\";s:71:\"%%POSTLINK%% yazısı ilk önce %%BLOGLINK%% üzerinde ortaya çıktı.\";s:20:\"noindex-author-wpseo\";b:0;s:28:\"noindex-author-noposts-wpseo\";b:1;s:21:\"noindex-archive-wpseo\";b:1;s:14:\"disable-author\";b:0;s:12:\"disable-date\";b:0;s:19:\"disable-post_format\";b:0;s:18:\"disable-attachment\";b:1;s:20:\"breadcrumbs-404crumb\";s:27:\"Hata 404: Sayfa bulunamadı\";s:29:\"breadcrumbs-display-blog-page\";b:0;s:20:\"breadcrumbs-boldlast\";b:0;s:25:\"breadcrumbs-archiveprefix\";s:6:\"Arşiv\";s:18:\"breadcrumbs-enable\";b:1;s:16:\"breadcrumbs-home\";s:8:\"Anasayfa\";s:18:\"breadcrumbs-prefix\";s:0:\"\";s:24:\"breadcrumbs-searchprefix\";s:16:\"Şunu aradınız\";s:15:\"breadcrumbs-sep\";s:2:\"»\";s:12:\"website_name\";s:0:\"\";s:11:\"person_name\";s:0:\"\";s:11:\"person_logo\";s:0:\"\";s:22:\"alternate_website_name\";s:0:\"\";s:12:\"company_logo\";s:0:\"\";s:12:\"company_name\";s:0:\"\";s:17:\"company_or_person\";s:7:\"company\";s:25:\"company_or_person_user_id\";b:0;s:17:\"stripcategorybase\";b:1;s:26:\"open_graph_frontpage_title\";s:12:\"%%sitename%%\";s:25:\"open_graph_frontpage_desc\";s:0:\"\";s:26:\"open_graph_frontpage_image\";s:0:\"\";s:10:\"title-post\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-post\";s:0:\"\";s:12:\"noindex-post\";b:0;s:23:\"display-metabox-pt-post\";b:1;s:23:\"post_types-post-maintax\";i:0;s:21:\"schema-page-type-post\";s:7:\"WebPage\";s:24:\"schema-article-type-post\";s:7:\"Article\";s:17:\"social-title-post\";s:9:\"%%title%%\";s:23:\"social-description-post\";s:0:\"\";s:21:\"social-image-url-post\";s:0:\"\";s:20:\"social-image-id-post\";i:0;s:10:\"title-page\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-page\";s:0:\"\";s:12:\"noindex-page\";b:0;s:23:\"display-metabox-pt-page\";b:1;s:23:\"post_types-page-maintax\";i:0;s:21:\"schema-page-type-page\";s:7:\"WebPage\";s:24:\"schema-article-type-page\";s:4:\"None\";s:17:\"social-title-page\";s:9:\"%%title%%\";s:23:\"social-description-page\";s:0:\"\";s:21:\"social-image-url-page\";s:0:\"\";s:20:\"social-image-id-page\";i:0;s:16:\"title-attachment\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:19:\"metadesc-attachment\";s:0:\"\";s:18:\"noindex-attachment\";b:0;s:29:\"display-metabox-pt-attachment\";b:1;s:29:\"post_types-attachment-maintax\";s:1:\"0\";s:27:\"schema-page-type-attachment\";s:7:\"WebPage\";s:30:\"schema-article-type-attachment\";s:4:\"None\";s:18:\"title-tax-category\";s:55:\"%%term_title%% arşivleri %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-tax-category\";s:0:\"\";s:28:\"display-metabox-tax-category\";b:1;s:20:\"noindex-tax-category\";b:0;s:25:\"social-title-tax-category\";s:25:\"%%term_title%% arşivleri\";s:31:\"social-description-tax-category\";s:0:\"\";s:29:\"social-image-url-tax-category\";s:0:\"\";s:28:\"social-image-id-tax-category\";i:0;s:18:\"title-tax-post_tag\";s:55:\"%%term_title%% arşivleri %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-tax-post_tag\";s:0:\"\";s:28:\"display-metabox-tax-post_tag\";b:1;s:20:\"noindex-tax-post_tag\";b:0;s:25:\"social-title-tax-post_tag\";s:25:\"%%term_title%% arşivleri\";s:31:\"social-description-tax-post_tag\";s:0:\"\";s:29:\"social-image-url-tax-post_tag\";s:0:\"\";s:28:\"social-image-id-tax-post_tag\";i:0;s:21:\"title-tax-post_format\";s:55:\"%%term_title%% arşivleri %%page%% %%sep%% %%sitename%%\";s:24:\"metadesc-tax-post_format\";s:0:\"\";s:31:\"display-metabox-tax-post_format\";b:0;s:23:\"noindex-tax-post_format\";b:1;s:28:\"social-title-tax-post_format\";s:25:\"%%term_title%% arşivleri\";s:34:\"social-description-tax-post_format\";s:0:\"\";s:32:\"social-image-url-tax-post_format\";s:0:\"\";s:31:\"social-image-id-tax-post_format\";i:0;s:17:\"title-html5-blank\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:20:\"metadesc-html5-blank\";s:0:\"\";s:19:\"noindex-html5-blank\";b:0;s:30:\"display-metabox-pt-html5-blank\";b:1;s:30:\"post_types-html5-blank-maintax\";i:0;s:28:\"schema-page-type-html5-blank\";s:7:\"WebPage\";s:31:\"schema-article-type-html5-blank\";s:4:\"None\";s:24:\"social-title-html5-blank\";s:9:\"%%title%%\";s:30:\"social-description-html5-blank\";s:0:\"\";s:28:\"social-image-url-html5-blank\";s:0:\"\";s:27:\"social-image-id-html5-blank\";i:0;s:27:\"title-ptarchive-html5-blank\";s:51:\"%%pt_plural%% arşivi %%page%% %%sep%% %%sitename%%\";s:30:\"metadesc-ptarchive-html5-blank\";s:0:\"\";s:29:\"bctitle-ptarchive-html5-blank\";s:0:\"\";s:29:\"noindex-ptarchive-html5-blank\";b:0;s:34:\"social-title-ptarchive-html5-blank\";s:21:\"%%pt_plural%% arşivi\";s:40:\"social-description-ptarchive-html5-blank\";s:0:\"\";s:38:\"social-image-url-ptarchive-html5-blank\";s:0:\"\";s:37:\"social-image-id-ptarchive-html5-blank\";i:0;s:14:\"person_logo_id\";i:0;s:15:\"company_logo_id\";i:0;s:29:\"open_graph_frontpage_image_id\";i:0;s:26:\"taxonomy-category-ptparent\";s:1:\"0\";s:26:\"taxonomy-post_tag-ptparent\";s:1:\"0\";s:29:\"taxonomy-post_format-ptparent\";s:1:\"0\";}', 'yes'),
(1078, 'wpseo_social', 'a:18:{s:13:\"facebook_site\";s:0:\"\";s:13:\"instagram_url\";s:0:\"\";s:12:\"linkedin_url\";s:0:\"\";s:11:\"myspace_url\";s:0:\"\";s:16:\"og_default_image\";s:0:\"\";s:19:\"og_default_image_id\";s:0:\"\";s:18:\"og_frontpage_title\";s:0:\"\";s:17:\"og_frontpage_desc\";s:0:\"\";s:18:\"og_frontpage_image\";s:0:\"\";s:21:\"og_frontpage_image_id\";s:0:\"\";s:9:\"opengraph\";b:1;s:13:\"pinterest_url\";s:0:\"\";s:15:\"pinterestverify\";s:0:\"\";s:7:\"twitter\";b:1;s:12:\"twitter_site\";s:0:\"\";s:17:\"twitter_card_type\";s:19:\"summary_large_image\";s:11:\"youtube_url\";s:0:\"\";s:13:\"wikipedia_url\";s:0:\"\";}', 'yes'),
(122, 'theme_mods_twentytwentytwo', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1650273829;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}', 'yes'),
(125, 'https_detection_errors', 'a:1:{s:20:\"https_request_failed\";a:1:{i:0;s:32:\"HTTPS isteği başarısız oldu.\";}}', 'yes'),
(1556, '_site_transient_timeout_php_check_1d343e7f9aee33bb3a30d3fe7077ec03', '1659365663', 'no'),
(1557, '_site_transient_php_check_1d343e7f9aee33bb3a30d3fe7077ec03', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no'),
(1558, '_transient_pll_languages_list', 'a:1:{i:0;a:24:{s:7:\"term_id\";i:2;s:4:\"name\";s:8:\"Türkçe\";s:4:\"slug\";s:2:\"tr\";s:10:\"term_group\";i:0;s:16:\"term_taxonomy_id\";i:2;s:5:\"count\";i:11;s:10:\"tl_term_id\";i:3;s:19:\"tl_term_taxonomy_id\";i:3;s:8:\"tl_count\";i:5;s:6:\"locale\";s:5:\"tr_TR\";s:6:\"is_rtl\";i:0;s:3:\"w3c\";s:5:\"tr-TR\";s:8:\"facebook\";s:5:\"tr_TR\";s:8:\"home_url\";s:24:\"http://localhost/Vaykul/\";s:10:\"search_url\";s:24:\"http://localhost/Vaykul/\";s:4:\"host\";N;s:5:\"mo_id\";s:1:\"6\";s:13:\"page_on_front\";i:13;s:14:\"page_for_posts\";i:66;s:9:\"flag_code\";s:2:\"tr\";s:8:\"flag_url\";s:64:\"http://localhost/Vaykul/wp-content/plugins/polylang/flags/tr.png\";s:4:\"flag\";s:425:\"<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAALCAMAAABBPP0LAAAARVBMVEX+AAD3AADwAAD+fHz9cHH7ZGT9WVn6UFDpAAD9oKD5Q0P5OTn2MzP1Kir7ubr65ub1Gxv69PTzDw/kAAD319ffAAD4iooXHQ3FAAAAYklEQVR4AT3HhW0EQRQD0Oc/KG3/dQYEYTg2O+4IQbTHydWt0fw2Sfz8Fuw51+U3On7a6/pc/as1UZLDyuq13lWOwpdPn3+v7XJiDD3DR1N87Qr5WXX9zyQ9opEIOwkmDgr/ZXASmpFRqe0AAAAASUVORK5CYII=\" alt=\"Türkçe\" width=\"16\" height=\"11\" style=\"width: 16px; height: 11px;\" />\";s:15:\"custom_flag_url\";N;s:11:\"custom_flag\";N;}}', 'yes'),
(157, 'finished_updating_comment_type', '1', 'yes'),
(1548, '_site_transient_timeout_theme_roots', '1658762603', 'no'),
(1549, '_site_transient_theme_roots', 'a:2:{s:15:\"twentytwentytwo\";s:7:\"/themes\";s:6:\"vaykul\";s:7:\"/themes\";}', 'no'),
(1075, 'yoast_migrations_free', 'a:1:{s:7:\"version\";s:4:\"18.6\";}', 'yes'),
(472, '_transient_health-check-site-status-result', '{\"good\":15,\"recommended\":4,\"critical\":1}', 'yes'),
(168, 'wpcf7', 'a:2:{s:7:\"version\";s:5:\"5.5.6\";s:13:\"bulk_validate\";a:4:{s:9:\"timestamp\";i:1650273874;s:7:\"version\";s:5:\"5.5.6\";s:11:\"count_valid\";i:1;s:13:\"count_invalid\";i:0;}}', 'yes'),
(717, 'wp_calendar_block_has_published_posts', '1', 'yes'),
(791, 'modula_version', 'a:2:{s:13:\"upgraded_from\";s:5:\"2.6.5\";s:15:\"current_version\";s:5:\"2.6.5\";}', 'yes'),
(792, 'widget_modula_gallery_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(793, 'modula-rate-time', '1808700984', 'yes'),
(797, 'modula_wisdom_notification_times', 'a:1:{s:24:\"modula-best-grid-gallery\";i:1650392787;}', 'yes'),
(798, 'modula_wisdom_block_notice', 'a:1:{s:24:\"modula-best-grid-gallery\";s:24:\"modula-best-grid-gallery\";}', 'yes'),
(1553, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/tr_TR/wordpress-6.0.1.zip\";s:6:\"locale\";s:5:\"tr_TR\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/tr_TR/wordpress-6.0.1.zip\";s:10:\"no_content\";s:0:\"\";s:11:\"new_bundled\";s:0:\"\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.0.1\";s:7:\"version\";s:5:\"6.0.1\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.9\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1658760860;s:15:\"version_checked\";s:5:\"6.0.1\";s:12:\"translations\";a:0:{}}', 'no'),
(1555, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1658760861;s:8:\"response\";a:5:{s:36:\"contact-form-7/wp-contact-form-7.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:28:\"w.org/plugins/contact-form-7\";s:4:\"slug\";s:14:\"contact-form-7\";s:6:\"plugin\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:11:\"new_version\";s:5:\"5.6.1\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/contact-form-7/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/contact-form-7.5.6.1.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:67:\"https://ps.w.org/contact-form-7/assets/icon-256x256.png?rev=2279696\";s:2:\"1x\";s:59:\"https://ps.w.org/contact-form-7/assets/icon.svg?rev=2339255\";s:3:\"svg\";s:59:\"https://ps.w.org/contact-form-7/assets/icon.svg?rev=2339255\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/contact-form-7/assets/banner-1544x500.png?rev=860901\";s:2:\"1x\";s:68:\"https://ps.w.org/contact-form-7/assets/banner-772x250.png?rev=880427\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.9\";s:6:\"tested\";s:5:\"6.0.1\";s:12:\"requires_php\";b:0;}s:35:\"modula-best-grid-gallery/Modula.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:38:\"w.org/plugins/modula-best-grid-gallery\";s:4:\"slug\";s:24:\"modula-best-grid-gallery\";s:6:\"plugin\";s:35:\"modula-best-grid-gallery/Modula.php\";s:11:\"new_version\";s:5:\"2.6.7\";s:3:\"url\";s:55:\"https://wordpress.org/plugins/modula-best-grid-gallery/\";s:7:\"package\";s:73:\"https://downloads.wordpress.org/plugin/modula-best-grid-gallery.2.6.7.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:77:\"https://ps.w.org/modula-best-grid-gallery/assets/icon-256x256.jpg?rev=2019530\";s:2:\"1x\";s:77:\"https://ps.w.org/modula-best-grid-gallery/assets/icon-256x256.jpg?rev=2019530\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:79:\"https://ps.w.org/modula-best-grid-gallery/assets/banner-772x250.jpg?rev=2019530\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.2\";s:6:\"tested\";s:5:\"6.0.1\";s:12:\"requires_php\";s:3:\"5.6\";}s:21:\"polylang/polylang.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:22:\"w.org/plugins/polylang\";s:4:\"slug\";s:8:\"polylang\";s:6:\"plugin\";s:21:\"polylang/polylang.php\";s:11:\"new_version\";s:5:\"3.2.5\";s:3:\"url\";s:39:\"https://wordpress.org/plugins/polylang/\";s:7:\"package\";s:57:\"https://downloads.wordpress.org/plugin/polylang.3.2.5.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:61:\"https://ps.w.org/polylang/assets/icon-256x256.png?rev=1331499\";s:2:\"1x\";s:61:\"https://ps.w.org/polylang/assets/icon-128x128.png?rev=1331499\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/polylang/assets/banner-1544x500.png?rev=1405299\";s:2:\"1x\";s:63:\"https://ps.w.org/polylang/assets/banner-772x250.png?rev=1405299\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.6\";s:6:\"tested\";s:5:\"6.0.1\";s:12:\"requires_php\";s:3:\"5.6\";}s:29:\"wp-mail-smtp/wp_mail_smtp.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:26:\"w.org/plugins/wp-mail-smtp\";s:4:\"slug\";s:12:\"wp-mail-smtp\";s:6:\"plugin\";s:29:\"wp-mail-smtp/wp_mail_smtp.php\";s:11:\"new_version\";s:5:\"3.5.1\";s:3:\"url\";s:43:\"https://wordpress.org/plugins/wp-mail-smtp/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/wp-mail-smtp.3.5.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:65:\"https://ps.w.org/wp-mail-smtp/assets/icon-256x256.png?rev=1755440\";s:2:\"1x\";s:65:\"https://ps.w.org/wp-mail-smtp/assets/icon-128x128.png?rev=1755440\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:68:\"https://ps.w.org/wp-mail-smtp/assets/banner-1544x500.png?rev=2468655\";s:2:\"1x\";s:67:\"https://ps.w.org/wp-mail-smtp/assets/banner-772x250.png?rev=2468655\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.2\";s:6:\"tested\";s:5:\"6.0.1\";s:12:\"requires_php\";s:6:\"5.6.20\";}s:24:\"wordpress-seo/wp-seo.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:27:\"w.org/plugins/wordpress-seo\";s:4:\"slug\";s:13:\"wordpress-seo\";s:6:\"plugin\";s:24:\"wordpress-seo/wp-seo.php\";s:11:\"new_version\";s:4:\"19.3\";s:3:\"url\";s:44:\"https://wordpress.org/plugins/wordpress-seo/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/wordpress-seo.19.3.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:66:\"https://ps.w.org/wordpress-seo/assets/icon-256x256.png?rev=2643727\";s:2:\"1x\";s:58:\"https://ps.w.org/wordpress-seo/assets/icon.svg?rev=2363699\";s:3:\"svg\";s:58:\"https://ps.w.org/wordpress-seo/assets/icon.svg?rev=2363699\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/wordpress-seo/assets/banner-1544x500.png?rev=2643727\";s:2:\"1x\";s:68:\"https://ps.w.org/wordpress-seo/assets/banner-772x250.png?rev=2643727\";}s:11:\"banners_rtl\";a:2:{s:2:\"2x\";s:73:\"https://ps.w.org/wordpress-seo/assets/banner-1544x500-rtl.png?rev=2643727\";s:2:\"1x\";s:72:\"https://ps.w.org/wordpress-seo/assets/banner-772x250-rtl.png?rev=2643727\";}s:8:\"requires\";s:3:\"5.8\";s:6:\"tested\";s:5:\"6.0.1\";s:12:\"requires_php\";s:6:\"5.6.20\";}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:0:{}s:7:\"checked\";a:6:{s:36:\"contact-form-7/wp-contact-form-7.php\";s:5:\"5.5.6\";s:21:\"webp-markon/index.php\";s:3:\"1.0\";s:35:\"modula-best-grid-gallery/Modula.php\";s:5:\"2.6.5\";s:21:\"polylang/polylang.php\";s:5:\"3.2.1\";s:29:\"wp-mail-smtp/wp_mail_smtp.php\";s:5:\"3.3.0\";s:24:\"wordpress-seo/wp-seo.php\";s:4:\"18.6\";}}', 'no'),
(158, 'current_theme', 'Vaykul', 'yes'),
(159, 'theme_mods_vaykul', 'a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:3:{s:11:\"header-menu\";i:5;s:12:\"sidebar-menu\";i:0;s:10:\"extra-menu\";i:0;}s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(160, 'theme_switched', '', 'yes'),
(381, 'z_taxonomy_image11', 'http://localhost/Vaykul/wp-content/uploads/2022/04/villalar-1.png', 'no'),
(179, 'widget_polylang', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(230, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(1270, 'category_children', 'a:1:{i:7;a:3:{i:0;i:9;i:1;i:11;i:2;i:13;}}', 'yes'),
(161, 'recently_activated', 'a:1:{s:39:\"categories-images/categories-images.php\";i:1650289900;}', 'yes'),
(404, 'zci_options', 'a:1:{s:19:\"excluded_taxonomies\";a:1:{s:8:\"category\";s:8:\"category\";}}', 'yes'),
(187, 'pll_dismissed_notices', 'a:1:{i:0;s:6:\"wizard\";}', 'yes'),
(177, 'polylang', 'a:15:{s:7:\"browser\";i:0;s:7:\"rewrite\";i:1;s:12:\"hide_default\";i:1;s:10:\"force_lang\";i:1;s:13:\"redirect_lang\";i:0;s:13:\"media_support\";i:0;s:9:\"uninstall\";i:0;s:4:\"sync\";a:0:{}s:10:\"post_types\";a:0:{}s:10:\"taxonomies\";a:0:{}s:7:\"domains\";a:0:{}s:7:\"version\";s:5:\"3.2.1\";s:16:\"first_activation\";i:1650274069;s:12:\"default_lang\";s:2:\"tr\";s:9:\"nav_menus\";a:1:{s:6:\"vaykul\";a:3:{s:11:\"header-menu\";a:1:{s:2:\"tr\";i:5;}s:12:\"sidebar-menu\";a:1:{s:2:\"tr\";i:0;}s:10:\"extra-menu\";a:1:{s:2:\"tr\";i:0;}}}}', 'yes'),
(178, 'polylang_wpml_strings', 'a:0:{}', 'yes'),
(1554, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1658760861;s:7:\"checked\";a:2:{s:15:\"twentytwentytwo\";s:3:\"1.1\";s:6:\"vaykul\";s:5:\"1.0.1\";}s:8:\"response\";a:1:{s:15:\"twentytwentytwo\";a:6:{s:5:\"theme\";s:15:\"twentytwentytwo\";s:11:\"new_version\";s:3:\"1.2\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentytwentytwo/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentytwentytwo.1.2.zip\";s:8:\"requires\";s:3:\"5.9\";s:12:\"requires_php\";s:3:\"5.6\";}}s:9:\"no_update\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(1551, 'user_count', '1', 'no'),
(1552, 'db_upgraded', '1', 'yes'),
(210, 'new_admin_email', 'info@vaykul.com', 'yes'),
(1224, 'widget_recent-comments', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(1513, 'auto_core_update_notified', 'a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:15:\"info@vaykul.com\";s:7:\"version\";s:5:\"6.0.1\";s:9:\"timestamp\";i:1658760861;}', 'no'),
(1421, 'rewrite_rules', 'a:125:{s:19:\"sitemap_index\\.xml$\";s:19:\"index.php?sitemap=1\";s:31:\"([^/]+?)-sitemap([0-9]+)?\\.xml$\";s:51:\"index.php?sitemap=$matches[1]&sitemap_n=$matches[2]\";s:24:\"([a-z]+)?-?sitemap\\.xsl$\";s:39:\"index.php?yoast-sitemap-xsl=$matches[1]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:51:\"^()/wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:92:\"index.php?lang=$matches[1]&sitemap=$matches[2]&sitemap-subtype=$matches[3]&paged=$matches[4]\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:37:\"^()/wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:64:\"index.php?lang=$matches[1]&sitemap=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:14:\"html5-blank/?$\";s:31:\"index.php?post_type=html5-blank\";s:44:\"html5-blank/feed/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?post_type=html5-blank&feed=$matches[1]\";s:39:\"html5-blank/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?post_type=html5-blank&feed=$matches[1]\";s:31:\"html5-blank/page/([0-9]{1,})/?$\";s:49:\"index.php?post_type=html5-blank&paged=$matches[1]\";s:53:\"(blog-yazilari)/(?:feed/)?(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:36:\"(blog-yazilari)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:18:\"(blog-yazilari)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:56:\"(projeler/deneme2)/(?:feed/)?(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:39:\"(projeler/deneme2)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:21:\"(projeler/deneme2)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:56:\"(projeler/deneme3)/(?:feed/)?(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:39:\"(projeler/deneme3)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:21:\"(projeler/deneme3)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:48:\"(projeler)/(?:feed/)?(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:31:\"(projeler)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:13:\"(projeler)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:57:\"(projeler/villalar)/(?:feed/)?(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:40:\"(projeler/villalar)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:22:\"(projeler/villalar)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:14:\"category/(.+)$\";s:45:\"index.php?wpseo_category_redirect=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:58:\"index.php?lang=tr&post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:58:\"index.php?lang=tr&post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:52:\"index.php?lang=tr&post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:59:\"index.php?lang=tr&post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:41:\"index.php?lang=tr&post_format=$matches[1]\";s:37:\"html5-blank/.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:47:\"html5-blank/.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:67:\"html5-blank/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"html5-blank/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"html5-blank/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:43:\"html5-blank/.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:26:\"html5-blank/(.+?)/embed/?$\";s:44:\"index.php?html5-blank=$matches[1]&embed=true\";s:30:\"html5-blank/(.+?)/trackback/?$\";s:38:\"index.php?html5-blank=$matches[1]&tb=1\";s:50:\"html5-blank/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?html5-blank=$matches[1]&feed=$matches[2]\";s:45:\"html5-blank/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?html5-blank=$matches[1]&feed=$matches[2]\";s:38:\"html5-blank/(.+?)/page/?([0-9]{1,})/?$\";s:51:\"index.php?html5-blank=$matches[1]&paged=$matches[2]\";s:45:\"html5-blank/(.+?)/comment-page-([0-9]{1,})/?$\";s:51:\"index.php?html5-blank=$matches[1]&cpage=$matches[2]\";s:34:\"html5-blank/(.+?)(?:/([0-9]+))?/?$\";s:50:\"index.php?html5-blank=$matches[1]&page=$matches[2]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:35:\"index.php?lang=tr&&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:35:\"index.php?lang=tr&&feed=$matches[1]\";s:8:\"embed/?$\";s:29:\"index.php?lang=tr&&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:36:\"index.php?lang=tr&&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:47:\"index.php?lang=tr&&page_id=13&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?lang=tr&&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?lang=tr&&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:29:\"index.php?lang=tr&&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?lang=tr&s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?lang=tr&s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:42:\"index.php?lang=tr&s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:49:\"index.php?lang=tr&s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:31:\"index.php?lang=tr&s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:58:\"index.php?lang=tr&author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:58:\"index.php?lang=tr&author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:52:\"index.php?lang=tr&author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:59:\"index.php?lang=tr&author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:41:\"index.php?lang=tr&author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:88:\"index.php?lang=tr&year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:88:\"index.php?lang=tr&year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:82:\"index.php?lang=tr&year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:89:\"index.php?lang=tr&year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:71:\"index.php?lang=tr&year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:72:\"index.php?lang=tr&year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:72:\"index.php?lang=tr&year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:66:\"index.php?lang=tr&year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:73:\"index.php?lang=tr&year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:55:\"index.php?lang=tr&year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:51:\"index.php?lang=tr&year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:51:\"index.php?lang=tr&year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:45:\"index.php?lang=tr&year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:52:\"index.php?lang=tr&year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:34:\"index.php?lang=tr&year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}', 'yes');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vyk_postmeta`
--

DROP TABLE IF EXISTS `vyk_postmeta`;
CREATE TABLE IF NOT EXISTS `vyk_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=344 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Tablo döküm verisi `vyk_postmeta`
--

INSERT INTO `vyk_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(3, 5, '_form', '<label> Ad - Soyad\n    [text* your-name placeholder \"Tam İsminiz\"] </label>\n\n<label> E-posta Adresi\n    [email* your-email placeholder \"E-posta\"] </label>\n\n<label> Mesaj\n    [textarea* your-message placeholder \"Mesajınız\"] </label>\n\n[submit \"Gönder\"]'),
(4, 5, '_mail', 'a:9:{s:6:\"active\";b:1;s:7:\"subject\";s:30:\"[_site_title] \"[your-subject]\"\";s:6:\"sender\";s:31:\"[_site_title] <info@vaykul.com>\";s:9:\"recipient\";s:19:\"[_site_admin_email]\";s:4:\"body\";s:178:\"Kimden: [your-name] <[your-email]>\nKonu: [your-subject]\n\nİleti gövdesi:\n[your-message]\n\n-- \nBu e-posta, [_site_title] ([_site_url]) adresindeki iletişim formundan gönderildi.\";s:18:\"additional_headers\";s:22:\"Reply-To: [your-email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:0;s:13:\"exclude_blank\";b:0;}'),
(5, 5, '_mail_2', 'a:9:{s:6:\"active\";b:0;s:7:\"subject\";s:30:\"[_site_title] \"[your-subject]\"\";s:6:\"sender\";s:31:\"[_site_title] <info@vaykul.com>\";s:9:\"recipient\";s:12:\"[your-email]\";s:4:\"body\";s:121:\"İleti gövdesi:\n[your-message]\n\n-- \nBu e-posta, [_site_title] ([_site_url]) adresindeki iletişim formundan gönderildi.\";s:18:\"additional_headers\";s:29:\"Reply-To: [_site_admin_email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:0;s:13:\"exclude_blank\";b:0;}'),
(6, 5, '_messages', 'a:22:{s:12:\"mail_sent_ok\";s:45:\"Mesajınız için teşekkürler. Gönderildi.\";s:12:\"mail_sent_ng\";s:79:\"Mesajınız gönderilirken bir hata oluştu. Lütfen daha sonra tekrar deneyin.\";s:16:\"validation_error\";s:80:\"Bir veya daha fazla alanda hata bulundu. Lütfen kontrol edin ve tekrar deneyin.\";s:4:\"spam\";s:79:\"Mesajınız gönderilirken bir hata oluştu. Lütfen daha sonra tekrar deneyin.\";s:12:\"accept_terms\";s:87:\"Mesajınızı göndermeden önce şartları ve koşulları kabul etmeniz gerekmektedir.\";s:16:\"invalid_required\";s:19:\"Bu alan zorunludur.\";s:16:\"invalid_too_long\";s:18:\"Bu alan çok uzun.\";s:17:\"invalid_too_short\";s:19:\"Bu alan çok kısa.\";s:13:\"upload_failed\";s:47:\"Dosya yüklenirken bilinmeyen bir hata oluştu.\";s:24:\"upload_file_type_invalid\";s:53:\"Bu dosya türünü yükleme iznine sahip değilsiniz.\";s:21:\"upload_file_too_large\";s:19:\"Dosya çok büyük.\";s:23:\"upload_failed_php_error\";s:38:\"Dosya yüklenirken hata meydana geldi.\";s:12:\"invalid_date\";s:24:\"Yanlış tarih formatı.\";s:14:\"date_too_early\";s:36:\"Bu tarih izin verilenden daha önce.\";s:13:\"date_too_late\";s:36:\"Bu tarih izin verilenden daha sonra.\";s:14:\"invalid_number\";s:25:\"Geçersiz numara biçimi.\";s:16:\"number_too_small\";s:41:\"Bu sayı minimum değerden daha küçük.\";s:16:\"number_too_large\";s:41:\"Bu sayı maksimum değerden daha büyük.\";s:23:\"quiz_answer_not_correct\";s:35:\"Soruya verilen cevap doğru değil.\";s:13:\"invalid_email\";s:33:\"Girilen e-posta adresi geçersiz.\";s:11:\"invalid_url\";s:16:\"Geçersiz adres.\";s:11:\"invalid_tel\";s:28:\"Geçersiz telefon numarası.\";}'),
(7, 5, '_additional_settings', ''),
(8, 5, '_locale', 'tr_TR'),
(9, 6, '_pll_strings_translations', 'a:2:{i:0;a:2:{i:0;s:6:\"Vaykul\";i:1;s:6:\"Vaykul\";}i:1;a:2:{i:0;s:2:\"»\";i:1;s:2:\"»\";}}'),
(16, 9, '_edit_lock', '1650386231:1'),
(17, 9, '_edit_last', '1'),
(18, 13, '_edit_lock', '1650462380:1'),
(19, 13, '_edit_last', '1'),
(20, 13, '_wp_page_template', 'anasayfa.php'),
(21, 15, '_edit_lock', '1650399254:1'),
(22, 15, '_edit_last', '1'),
(23, 17, '_edit_lock', '1650411302:1'),
(24, 17, '_edit_last', '1'),
(25, 19, '_menu_item_type', 'post_type'),
(26, 19, '_menu_item_menu_item_parent', '0'),
(27, 19, '_menu_item_object_id', '13'),
(28, 19, '_menu_item_object', 'page'),
(29, 19, '_menu_item_target', ''),
(30, 19, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(31, 19, '_menu_item_xfn', ''),
(32, 19, '_menu_item_url', ''),
(34, 20, '_menu_item_type', 'post_type'),
(35, 20, '_menu_item_menu_item_parent', '0'),
(36, 20, '_menu_item_object_id', '9'),
(37, 20, '_menu_item_object', 'page'),
(38, 20, '_menu_item_target', ''),
(39, 20, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(40, 20, '_menu_item_xfn', ''),
(41, 20, '_menu_item_url', ''),
(43, 21, '_menu_item_type', 'post_type'),
(44, 21, '_menu_item_menu_item_parent', '0'),
(45, 21, '_menu_item_object_id', '15'),
(46, 21, '_menu_item_object', 'page'),
(47, 21, '_menu_item_target', ''),
(48, 21, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(49, 21, '_menu_item_xfn', ''),
(50, 21, '_menu_item_url', ''),
(52, 22, '_menu_item_type', 'post_type'),
(53, 22, '_menu_item_menu_item_parent', '0'),
(54, 22, '_menu_item_object_id', '17'),
(55, 22, '_menu_item_object', 'page'),
(56, 22, '_menu_item_target', ''),
(57, 22, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(58, 22, '_menu_item_xfn', ''),
(59, 22, '_menu_item_url', ''),
(84, 1, '_edit_lock', '1650462427:1'),
(266, 96, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(265, 96, '_menu_item_target', ''),
(264, 96, '_menu_item_object', 'page'),
(263, 96, '_menu_item_object_id', '66'),
(262, 96, '_menu_item_menu_item_parent', '0'),
(261, 96, '_menu_item_type', 'post_type'),
(70, 24, '_menu_item_type', 'taxonomy'),
(71, 24, '_menu_item_menu_item_parent', '0'),
(72, 24, '_menu_item_object_id', '7'),
(73, 24, '_menu_item_object', 'category'),
(74, 24, '_menu_item_target', ''),
(75, 24, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(76, 24, '_menu_item_xfn', ''),
(77, 24, '_menu_item_url', ''),
(87, 1, '_edit_last', '1'),
(139, 1, 'second_featured_image', ''),
(101, 13, 'second_featured_image', '52'),
(102, 13, 'third_featured_image', ''),
(115, 43, '_wp_attached_file', '2022/04/banner-desk.jpg'),
(116, 43, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:1095;s:4:\"file\";s:23:\"2022/04/banner-desk.jpg\";s:5:\"sizes\";a:7:{s:6:\"medium\";a:4:{s:4:\"file\";s:23:\"banner-desk-250x143.jpg\";s:5:\"width\";i:250;s:6:\"height\";i:143;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:23:\"banner-desk-700x399.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:399;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"banner-desk-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:23:\"banner-desk-768x438.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:438;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:24:\"banner-desk-1536x876.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:876;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"small\";a:4:{s:4:\"file\";s:22:\"banner-desk-120x68.jpg\";s:5:\"width\";i:120;s:6:\"height\";i:68;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"custom-size\";a:4:{s:4:\"file\";s:23:\"banner-desk-700x200.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:14:\"resized_images\";a:1:{i:0;s:7:\"526x300\";}}}'),
(117, 13, '_thumbnail_id', '43'),
(146, 57, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1600;s:6:\"height\";i:900;s:4:\"file\";s:23:\"2022/04/hakkimizda.jpeg\";s:5:\"sizes\";a:7:{s:6:\"medium\";a:4:{s:4:\"file\";s:23:\"hakkimizda-250x141.jpeg\";s:5:\"width\";i:250;s:6:\"height\";i:141;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:23:\"hakkimizda-700x394.jpeg\";s:5:\"width\";i:700;s:6:\"height\";i:394;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"hakkimizda-150x150.jpeg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:23:\"hakkimizda-768x432.jpeg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:24:\"hakkimizda-1536x864.jpeg\";s:5:\"width\";i:1536;s:6:\"height\";i:864;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"small\";a:4:{s:4:\"file\";s:22:\"hakkimizda-120x68.jpeg\";s:5:\"width\";i:120;s:6:\"height\";i:68;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"custom-size\";a:4:{s:4:\"file\";s:23:\"hakkimizda-700x200.jpeg\";s:5:\"width\";i:700;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:14:\"resized_images\";a:1:{i:0;s:7:\"533x300\";}}}'),
(145, 57, '_wp_attached_file', '2022/04/hakkimizda.jpeg'),
(144, 9, 'third_featured_image', ''),
(134, 52, '_wp_attached_file', '2022/04/banner-mob.jpg'),
(135, 52, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:573;s:6:\"height\";i:1088;s:4:\"file\";s:22:\"2022/04/banner-mob.jpg\";s:5:\"sizes\";a:4:{s:6:\"medium\";a:4:{s:4:\"file\";s:22:\"banner-mob-250x475.jpg\";s:5:\"width\";i:250;s:6:\"height\";i:475;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"banner-mob-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"small\";a:4:{s:4:\"file\";s:22:\"banner-mob-120x228.jpg\";s:5:\"width\";i:120;s:6:\"height\";i:228;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"custom-size\";a:4:{s:4:\"file\";s:22:\"banner-mob-573x200.jpg\";s:5:\"width\";i:573;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:14:\"resized_images\";a:2:{i:0;s:7:\"158x300\";i:1;s:7:\"157x300\";}}}'),
(136, 1, '_thumbnail_id', '43'),
(140, 1, 'third_featured_image', ''),
(143, 9, 'second_featured_image', ''),
(188, 72, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:1080;s:4:\"file\";s:21:\"2022/04/world-map.jpg\";s:5:\"sizes\";a:7:{s:6:\"medium\";a:4:{s:4:\"file\";s:21:\"world-map-250x141.jpg\";s:5:\"width\";i:250;s:6:\"height\";i:141;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:21:\"world-map-700x394.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:394;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"world-map-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:21:\"world-map-768x432.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:22:\"world-map-1536x864.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:864;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"small\";a:4:{s:4:\"file\";s:20:\"world-map-120x68.jpg\";s:5:\"width\";i:120;s:6:\"height\";i:68;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"custom-size\";a:4:{s:4:\"file\";s:21:\"world-map-700x200.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(168, 66, '_edit_lock', '1650455739:1'),
(169, 66, '_edit_last', '1'),
(170, 66, 'second_featured_image', ''),
(171, 66, 'third_featured_image', ''),
(172, 68, 'modula-images', 'a:3:{i:0;a:10:{s:2:\"id\";s:2:\"57\";s:3:\"alt\";s:0:\"\";s:5:\"title\";s:10:\"hakkimizda\";s:11:\"description\";s:0:\"\";s:6:\"halign\";s:6:\"center\";s:6:\"valign\";s:6:\"middle\";s:4:\"link\";s:0:\"\";s:6:\"target\";i:0;s:5:\"width\";i:2;s:6:\"height\";i:2;}i:1;a:10:{s:2:\"id\";s:2:\"43\";s:3:\"alt\";s:0:\"\";s:5:\"title\";s:11:\"banner-desk\";s:11:\"description\";s:0:\"\";s:6:\"halign\";s:6:\"center\";s:6:\"valign\";s:6:\"middle\";s:4:\"link\";s:0:\"\";s:6:\"target\";i:0;s:5:\"width\";i:2;s:6:\"height\";i:2;}i:2;a:10:{s:2:\"id\";s:2:\"72\";s:3:\"alt\";s:0:\"\";s:5:\"title\";s:9:\"world-map\";s:11:\"description\";s:0:\"\";s:6:\"halign\";s:6:\"center\";s:6:\"valign\";s:6:\"middle\";s:4:\"link\";s:0:\"\";s:6:\"target\";i:0;s:5:\"width\";i:2;s:6:\"height\";i:2;}}'),
(173, 68, '_edit_last', '1'),
(174, 68, 'modula-settings', 'a:55:{s:4:\"type\";s:4:\"grid\";s:9:\"grid_type\";s:1:\"1\";s:15:\"grid_row_height\";s:3:\"250\";s:21:\"grid_justify_last_row\";s:7:\"justify\";s:15:\"grid_image_size\";s:4:\"full\";s:21:\"grid_image_dimensions\";a:2:{s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"300\";}s:8:\"img_size\";s:3:\"200\";s:8:\"img_crop\";s:1:\"1\";s:15:\"grid_image_crop\";s:1:\"0\";s:6:\"gutter\";s:2:\"30\";s:13:\"tablet_gutter\";s:2:\"30\";s:13:\"mobile_gutter\";s:2:\"30\";s:5:\"width\";s:4:\"100%\";s:6:\"height\";a:3:{i:0;i:800;i:1;i:800;i:2;i:800;}s:12:\"randomFactor\";i:50;s:7:\"shuffle\";s:1:\"0\";s:10:\"powered_by\";s:1:\"0\";s:8:\"lightbox\";s:8:\"fancybox\";s:15:\"show_navigation\";s:1:\"1\";s:10:\"hide_title\";s:1:\"1\";s:10:\"titleColor\";s:0:\"\";s:13:\"titleFontSize\";i:0;s:19:\"mobileTitleFontSize\";s:2:\"12\";s:16:\"hide_description\";s:1:\"0\";s:12:\"captionColor\";s:7:\"#ffffff\";s:15:\"captionFontSize\";i:14;s:21:\"mobileCaptionFontSize\";s:2:\"10\";s:12:\"enableSocial\";s:1:\"0\";s:13:\"enableTwitter\";s:1:\"0\";s:14:\"enableFacebook\";s:1:\"0\";s:14:\"enableWhatsapp\";s:1:\"0\";s:14:\"enableLinkedin\";s:1:\"0\";s:15:\"enablePinterest\";s:1:\"0\";s:11:\"enableEmail\";s:1:\"0\";s:12:\"emailSubject\";s:31:\"Check out this awesome image !!\";s:12:\"emailMessage\";s:101:\"Here is the link to the image : %%image_link%% and this is the link to the gallery : %%gallery_link%%\";s:15:\"socialIconColor\";s:7:\"#ffffff\";s:14:\"socialIconSize\";i:16;s:17:\"socialIconPadding\";i:10;s:11:\"loadedScale\";i:100;s:6:\"inView\";i:1;s:6:\"effect\";s:7:\"pufrobo\";s:6:\"cursor\";s:7:\"pointer\";s:10:\"borderSize\";i:0;s:12:\"borderRadius\";i:0;s:11:\"borderColor\";s:7:\"#ffffff\";s:10:\"shadowSize\";i:0;s:11:\"shadowColor\";s:7:\"#ffffff\";s:9:\"lazy_load\";s:1:\"1\";s:17:\"enable_responsive\";s:1:\"0\";s:14:\"tablet_columns\";s:1:\"2\";s:14:\"mobile_columns\";s:1:\"1\";s:5:\"style\";s:0:\"\";s:16:\"last_visited_tab\";s:14:\"modula-general\";s:10:\"helpergrid\";i:0;}'),
(175, 68, '_edit_lock', '1650462507:1'),
(187, 72, '_wp_attached_file', '2022/04/world-map.jpg'),
(194, 75, '_edit_last', '1'),
(237, 92, '_edit_last', '1'),
(191, 75, '_edit_lock', '1650462959:1'),
(197, 75, 'second_featured_image', ''),
(198, 75, 'third_featured_image', ''),
(201, 75, '_thumbnail_id', '72'),
(204, 79, '_wp_attached_file', '2022/04/referans1.jpg'),
(205, 79, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:2560;s:4:\"file\";s:21:\"2022/04/referans1.jpg\";s:5:\"sizes\";a:8:{s:6:\"medium\";a:4:{s:4:\"file\";s:21:\"referans1-250x333.jpg\";s:5:\"width\";i:250;s:6:\"height\";i:333;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:21:\"referans1-700x933.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:933;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"referans1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:22:\"referans1-768x1024.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:23:\"referans1-1152x1536.jpg\";s:5:\"width\";i:1152;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"2048x2048\";a:4:{s:4:\"file\";s:23:\"referans1-1536x2048.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:2048;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"small\";a:4:{s:4:\"file\";s:21:\"referans1-120x160.jpg\";s:5:\"width\";i:120;s:6:\"height\";i:160;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"custom-size\";a:4:{s:4:\"file\";s:21:\"referans1-700x200.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:14:\"resized_images\";a:1:{i:0;s:7:\"225x300\";}}}'),
(206, 80, '_wp_attached_file', '2022/04/referans2.jpg'),
(207, 80, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:2400;s:4:\"file\";s:21:\"2022/04/referans2.jpg\";s:5:\"sizes\";a:8:{s:6:\"medium\";a:4:{s:4:\"file\";s:21:\"referans2-250x313.jpg\";s:5:\"width\";i:250;s:6:\"height\";i:313;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:21:\"referans2-700x875.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:875;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"referans2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:21:\"referans2-768x960.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:960;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:23:\"referans2-1229x1536.jpg\";s:5:\"width\";i:1229;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"2048x2048\";a:4:{s:4:\"file\";s:23:\"referans2-1638x2048.jpg\";s:5:\"width\";i:1638;s:6:\"height\";i:2048;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"small\";a:4:{s:4:\"file\";s:21:\"referans2-120x150.jpg\";s:5:\"width\";i:120;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"custom-size\";a:4:{s:4:\"file\";s:21:\"referans2-700x200.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:14:\"resized_images\";a:1:{i:0;s:7:\"240x300\";}}}'),
(208, 81, '_wp_attached_file', '2022/04/referans3-scaled.jpg'),
(209, 81, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1818;s:6:\"height\";i:2560;s:4:\"file\";s:28:\"2022/04/referans3-scaled.jpg\";s:5:\"sizes\";a:8:{s:6:\"medium\";a:4:{s:4:\"file\";s:21:\"referans3-250x352.jpg\";s:5:\"width\";i:250;s:6:\"height\";i:352;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:21:\"referans3-700x986.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:986;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"referans3-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:22:\"referans3-768x1082.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:1082;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:23:\"referans3-1091x1536.jpg\";s:5:\"width\";i:1091;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"2048x2048\";a:4:{s:4:\"file\";s:23:\"referans3-1454x2048.jpg\";s:5:\"width\";i:1454;s:6:\"height\";i:2048;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"small\";a:4:{s:4:\"file\";s:21:\"referans3-120x169.jpg\";s:5:\"width\";i:120;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"custom-size\";a:4:{s:4:\"file\";s:21:\"referans3-700x200.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:14:\"resized_images\";a:1:{i:0;s:7:\"213x300\";}}s:14:\"original_image\";s:13:\"referans3.jpg\";}'),
(210, 82, '_wp_attached_file', '2022/04/referans4-scaled.jpg'),
(211, 82, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1707;s:6:\"height\";i:2560;s:4:\"file\";s:28:\"2022/04/referans4-scaled.jpg\";s:5:\"sizes\";a:8:{s:6:\"medium\";a:4:{s:4:\"file\";s:21:\"referans4-250x375.jpg\";s:5:\"width\";i:250;s:6:\"height\";i:375;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:22:\"referans4-700x1050.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:1050;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"referans4-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:22:\"referans4-768x1152.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:1152;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:23:\"referans4-1024x1536.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"2048x2048\";a:4:{s:4:\"file\";s:23:\"referans4-1365x2048.jpg\";s:5:\"width\";i:1365;s:6:\"height\";i:2048;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"small\";a:4:{s:4:\"file\";s:21:\"referans4-120x180.jpg\";s:5:\"width\";i:120;s:6:\"height\";i:180;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"custom-size\";a:4:{s:4:\"file\";s:21:\"referans4-700x200.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:14:\"resized_images\";a:1:{i:0;s:7:\"200x300\";}}s:14:\"original_image\";s:13:\"referans4.jpg\";}'),
(212, 83, '_wp_attached_file', '2022/04/referans5-scaled.jpg'),
(213, 83, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1700;s:6:\"height\";i:2560;s:4:\"file\";s:28:\"2022/04/referans5-scaled.jpg\";s:5:\"sizes\";a:8:{s:6:\"medium\";a:4:{s:4:\"file\";s:21:\"referans5-250x376.jpg\";s:5:\"width\";i:250;s:6:\"height\";i:376;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:22:\"referans5-700x1054.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:1054;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"referans5-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:22:\"referans5-768x1156.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:1156;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:23:\"referans5-1020x1536.jpg\";s:5:\"width\";i:1020;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"2048x2048\";a:4:{s:4:\"file\";s:23:\"referans5-1360x2048.jpg\";s:5:\"width\";i:1360;s:6:\"height\";i:2048;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"small\";a:4:{s:4:\"file\";s:21:\"referans5-120x181.jpg\";s:5:\"width\";i:120;s:6:\"height\";i:181;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"custom-size\";a:4:{s:4:\"file\";s:21:\"referans5-700x200.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:14:\"resized_images\";a:1:{i:0;s:7:\"199x300\";}}s:14:\"original_image\";s:13:\"referans5.jpg\";}'),
(214, 84, '_wp_attached_file', '2022/04/referans6.jpg'),
(215, 84, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:1235;s:4:\"file\";s:21:\"2022/04/referans6.jpg\";s:5:\"sizes\";a:7:{s:6:\"medium\";a:4:{s:4:\"file\";s:21:\"referans6-250x161.jpg\";s:5:\"width\";i:250;s:6:\"height\";i:161;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:21:\"referans6-700x450.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:450;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"referans6-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:21:\"referans6-768x494.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:494;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:22:\"referans6-1536x988.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:988;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"small\";a:4:{s:4:\"file\";s:20:\"referans6-120x77.jpg\";s:5:\"width\";i:120;s:6:\"height\";i:77;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"custom-size\";a:4:{s:4:\"file\";s:21:\"referans6-700x200.jpg\";s:5:\"width\";i:700;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(216, 78, 'modula-images', 'a:6:{i:0;a:10:{s:2:\"id\";s:2:\"79\";s:3:\"alt\";s:0:\"\";s:5:\"title\";s:9:\"referans1\";s:11:\"description\";s:0:\"\";s:6:\"halign\";s:6:\"center\";s:6:\"valign\";s:6:\"middle\";s:4:\"link\";s:0:\"\";s:6:\"target\";i:0;s:5:\"width\";i:4;s:6:\"height\";i:4;}i:1;a:10:{s:2:\"id\";s:2:\"80\";s:3:\"alt\";s:0:\"\";s:5:\"title\";s:9:\"referans2\";s:11:\"description\";s:0:\"\";s:6:\"halign\";s:6:\"center\";s:6:\"valign\";s:6:\"middle\";s:4:\"link\";s:0:\"\";s:6:\"target\";i:0;s:5:\"width\";i:4;s:6:\"height\";i:2;}i:2;a:10:{s:2:\"id\";s:2:\"81\";s:3:\"alt\";s:0:\"\";s:5:\"title\";s:9:\"referans3\";s:11:\"description\";s:0:\"\";s:6:\"halign\";s:6:\"center\";s:6:\"valign\";s:6:\"middle\";s:4:\"link\";s:0:\"\";s:6:\"target\";i:0;s:5:\"width\";i:4;s:6:\"height\";i:2;}i:3;a:10:{s:2:\"id\";s:2:\"82\";s:3:\"alt\";s:0:\"\";s:5:\"title\";s:9:\"referans4\";s:11:\"description\";s:0:\"\";s:6:\"halign\";s:6:\"center\";s:6:\"valign\";s:6:\"middle\";s:4:\"link\";s:0:\"\";s:6:\"target\";i:0;s:5:\"width\";i:2;s:6:\"height\";i:2;}i:4;a:10:{s:2:\"id\";s:2:\"83\";s:3:\"alt\";s:0:\"\";s:5:\"title\";s:9:\"referans5\";s:11:\"description\";s:0:\"\";s:6:\"halign\";s:6:\"center\";s:6:\"valign\";s:6:\"middle\";s:4:\"link\";s:0:\"\";s:6:\"target\";i:0;s:5:\"width\";i:2;s:6:\"height\";i:2;}i:5;a:10:{s:2:\"id\";s:2:\"84\";s:3:\"alt\";s:0:\"\";s:5:\"title\";s:9:\"referans6\";s:11:\"description\";s:0:\"\";s:6:\"halign\";s:6:\"center\";s:6:\"valign\";s:6:\"middle\";s:4:\"link\";s:0:\"\";s:6:\"target\";i:0;s:5:\"width\";i:4;s:6:\"height\";i:2;}}'),
(217, 78, '_edit_last', '1'),
(218, 78, '_edit_lock', '1650462483:1'),
(219, 78, 'modula-settings', 'a:55:{s:4:\"type\";s:11:\"custom-grid\";s:9:\"grid_type\";s:9:\"automatic\";s:15:\"grid_row_height\";s:3:\"250\";s:21:\"grid_justify_last_row\";s:7:\"justify\";s:15:\"grid_image_size\";s:4:\"full\";s:21:\"grid_image_dimensions\";a:2:{s:5:\"width\";s:0:\"\";s:6:\"height\";s:0:\"\";}s:8:\"img_size\";s:3:\"200\";s:8:\"img_crop\";s:1:\"1\";s:15:\"grid_image_crop\";s:1:\"0\";s:6:\"gutter\";s:2:\"10\";s:13:\"tablet_gutter\";s:2:\"10\";s:13:\"mobile_gutter\";s:2:\"10\";s:5:\"width\";s:4:\"100%\";s:6:\"height\";a:3:{i:0;i:800;i:1;i:800;i:2;i:800;}s:12:\"randomFactor\";i:50;s:7:\"shuffle\";s:1:\"0\";s:10:\"powered_by\";s:1:\"0\";s:8:\"lightbox\";s:7:\"no-link\";s:15:\"show_navigation\";s:1:\"1\";s:10:\"hide_title\";s:1:\"1\";s:10:\"titleColor\";s:0:\"\";s:13:\"titleFontSize\";i:0;s:19:\"mobileTitleFontSize\";s:2:\"12\";s:16:\"hide_description\";s:1:\"0\";s:12:\"captionColor\";s:7:\"#000000\";s:15:\"captionFontSize\";i:16;s:21:\"mobileCaptionFontSize\";s:2:\"12\";s:12:\"enableSocial\";s:1:\"0\";s:13:\"enableTwitter\";s:1:\"0\";s:14:\"enableFacebook\";s:1:\"0\";s:14:\"enableWhatsapp\";s:1:\"0\";s:14:\"enableLinkedin\";s:1:\"0\";s:15:\"enablePinterest\";s:1:\"0\";s:11:\"enableEmail\";s:1:\"0\";s:12:\"emailSubject\";s:31:\"Check out this awesome image !!\";s:12:\"emailMessage\";s:101:\"Here is the link to the image : %%image_link%% and this is the link to the gallery : %%gallery_link%%\";s:15:\"socialIconColor\";s:7:\"#ffffff\";s:14:\"socialIconSize\";i:16;s:17:\"socialIconPadding\";i:10;s:11:\"loadedScale\";i:100;s:6:\"inView\";s:1:\"0\";s:6:\"effect\";s:7:\"pufrobo\";s:6:\"cursor\";s:7:\"pointer\";s:10:\"borderSize\";i:0;s:12:\"borderRadius\";i:0;s:11:\"borderColor\";s:7:\"#000000\";s:10:\"shadowSize\";i:0;s:11:\"shadowColor\";s:7:\"#000000\";s:9:\"lazy_load\";s:1:\"1\";s:17:\"enable_responsive\";s:1:\"0\";s:14:\"tablet_columns\";s:1:\"2\";s:14:\"mobile_columns\";s:1:\"1\";s:5:\"style\";s:0:\"\";s:16:\"last_visited_tab\";s:12:\"modula-style\";s:10:\"helpergrid\";i:0;}'),
(220, 15, 'second_featured_image', ''),
(221, 15, 'third_featured_image', ''),
(222, 17, 'second_featured_image', ''),
(223, 17, 'third_featured_image', ''),
(234, 92, '_edit_lock', '1650455939:1'),
(240, 92, 'second_featured_image', ''),
(244, 13, '_yoast_wpseo_content_score', '60'),
(241, 92, 'third_featured_image', ''),
(242, 92, '_yoast_wpseo_primary_category', '1'),
(243, 92, '_yoast_wpseo_estimated-reading-time-minutes', '1'),
(245, 13, '_yoast_wpseo_estimated-reading-time-minutes', '0'),
(246, 66, '_yoast_wpseo_estimated-reading-time-minutes', ''),
(289, 75, '_yoast_wpseo_content_score', '60'),
(274, 92, '_yoast_wpseo_content_score', '90'),
(288, 75, '_yoast_wpseo_primary_category', '11'),
(260, 22, '_wp_old_date', '2022-04-18'),
(256, 19, '_wp_old_date', '2022-04-18'),
(257, 20, '_wp_old_date', '2022-04-18'),
(258, 24, '_wp_old_date', '2022-04-18'),
(259, 21, '_wp_old_date', '2022-04-18'),
(267, 96, '_menu_item_xfn', ''),
(268, 96, '_menu_item_url', ''),
(290, 75, '_yoast_wpseo_estimated-reading-time-minutes', '1'),
(311, 101, '_edit_lock', '1650456034:1'),
(337, 105, '_pingme', '1'),
(314, 101, '_edit_last', '1'),
(325, 103, '_edit_last', '1'),
(317, 101, 'second_featured_image', ''),
(318, 101, 'third_featured_image', ''),
(319, 101, '_yoast_wpseo_primary_category', '1'),
(320, 101, '_yoast_wpseo_content_score', '30'),
(321, 101, '_yoast_wpseo_estimated-reading-time-minutes', '2'),
(322, 103, '_edit_lock', '1650456204:1'),
(333, 105, '_edit_lock', '1650456224:1'),
(328, 103, 'second_featured_image', ''),
(329, 103, 'third_featured_image', ''),
(330, 103, '_yoast_wpseo_primary_category', '1'),
(331, 103, '_yoast_wpseo_content_score', '30'),
(332, 103, '_yoast_wpseo_estimated-reading-time-minutes', '2'),
(336, 105, '_edit_last', '1'),
(338, 105, '_encloseme', '1'),
(339, 105, 'second_featured_image', ''),
(340, 105, 'third_featured_image', ''),
(341, 105, '_yoast_wpseo_primary_category', '1'),
(342, 105, '_yoast_wpseo_content_score', '30'),
(343, 105, '_yoast_wpseo_estimated-reading-time-minutes', '2');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vyk_posts`
--

DROP TABLE IF EXISTS `vyk_posts`;
CREATE TABLE IF NOT EXISTS `vyk_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Tablo döküm verisi `vyk_posts`
--

INSERT INTO `vyk_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2022-04-18 12:15:31', '2022-04-18 09:15:31', '<!-- wp:columns -->\n<div class=\"wp-block-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:modula/gallery {\"id\":68,\"images\":[{\"id\":\"57\",\"alt\":\"\",\"title\":\"hakkimizda\",\"description\":\"\",\"halign\":\"center\",\"valign\":\"middle\",\"link\":\"\",\"target\":0,\"width\":700,\"height\":394,\"src\":\"http://localhost/Vaykul/wp-content/uploads/2022/04/hakkimizda-700x394.jpeg\",\"data-width\":2,\"data-height\":2},{\"id\":\"43\",\"alt\":\"\",\"title\":\"banner-desk\",\"description\":\"\",\"halign\":\"center\",\"valign\":\"middle\",\"link\":\"\",\"target\":0,\"width\":700,\"height\":399,\"src\":\"http://localhost/Vaykul/wp-content/uploads/2022/04/banner-desk-700x399.jpg\",\"data-width\":2,\"data-height\":2},{\"id\":\"72\",\"alt\":\"\",\"title\":\"world-map\",\"description\":\"\",\"halign\":\"center\",\"valign\":\"middle\",\"link\":\"\",\"target\":0,\"width\":700,\"height\":394,\"src\":\"http://localhost/Vaykul/wp-content/uploads/2022/04/world-map-700x394.jpg\",\"data-width\":2,\"data-height\":2}],\"galleryId\":185,\"galleryType\":\"gallery\",\"currentGallery\":{\"id\":68,\"date\":\"2022-04-19T21:27:44\",\"date_gmt\":\"2022-04-19T18:27:44\",\"guid\":{\"rendered\":\"http://localhost/Vaykul/?post_type=modula-gallery\\u0026#038;p=68\"},\"modified\":\"2022-04-19T22:04:45\",\"modified_gmt\":\"2022-04-19T19:04:45\",\"slug\":\"68\",\"status\":\"publish\",\"type\":\"modula-gallery\",\"link\":\"http://localhost/Vaykul/?modula-gallery=68\",\"title\":{\"rendered\":\"Örnek Galeri\"},\"template\":\"\",\"modulaSettings\":{\"type\":\"grid\",\"grid_type\":\"1\",\"grid_row_height\":\"250\",\"grid_justify_last_row\":\"justify\",\"grid_image_size\":\"full\",\"grid_image_dimensions\":{\"width\":\"600\",\"height\":\"300\"},\"img_size\":\"200\",\"img_crop\":\"1\",\"grid_image_crop\":\"0\",\"gutter\":\"30\",\"tablet_gutter\":\"30\",\"mobile_gutter\":\"30\",\"width\":\"100%\",\"height\":[800,800,800],\"randomFactor\":50,\"shuffle\":\"0\",\"powered_by\":\"0\",\"lightbox\":\"fancybox\",\"show_navigation\":\"1\",\"hide_title\":\"1\",\"titleColor\":\"\",\"titleFontSize\":0,\"mobileTitleFontSize\":\"12\",\"hide_description\":\"0\",\"captionColor\":\"#ffffff\",\"captionFontSize\":14,\"mobileCaptionFontSize\":\"10\",\"enableSocial\":\"0\",\"enableTwitter\":\"0\",\"enableFacebook\":\"0\",\"enableWhatsapp\":\"0\",\"enableLinkedin\":\"0\",\"enablePinterest\":\"0\",\"enableEmail\":\"0\",\"emailSubject\":\"Check out this awesome image !!\",\"emailMessage\":\"Here is the link to the image : %%image_link%% and this is the link to the gallery : %%gallery_link%%\",\"socialIconColor\":\"#ffffff\",\"socialIconSize\":16,\"socialIconPadding\":10,\"loadedScale\":100,\"inView\":1,\"effect\":\"pufrobo\",\"cursor\":\"pointer\",\"borderSize\":0,\"borderRadius\":0,\"borderColor\":\"#ffffff\",\"shadowSize\":0,\"shadowColor\":\"#ffffff\",\"lazy_load\":\"1\",\"enable_responsive\":\"0\",\"tablet_columns\":\"2\",\"mobile_columns\":\"1\",\"style\":\"\",\"last_visited_tab\":\"modula-general\",\"helpergrid\":0},\"_links\":{\"self\":[{\"href\":\"http://localhost/Vaykul/wp-json/wp/v2/modula-gallery/68\"}],\"collection\":[{\"href\":\"http://localhost/Vaykul/wp-json/wp/v2/modula-gallery\"}],\"about\":[{\"href\":\"http://localhost/Vaykul/wp-json/wp/v2/types/modula-gallery\"}],\"wp:attachment\":[{\"href\":\"http://localhost/Vaykul/wp-json/wp/v2/media?parent=68\"}],\"curies\":[{\"name\":\"wp\",\"href\":\"https://api.w.org/{rel}\",\"templated\":true}]}},\"currentSelectize\":[{\"value\":68,\"label\":\"Örnek Galeri\"}]} /--></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>dolorum voluptates itaque labore veritatis cupiditate accusamus commodi aliquam. Enim debitis saepe modi porro, praesentium repudiandae id hic est similique quas dicta earum, eius deserunt perferendis beatae tempora iste nobis doloribus magnam? Porro quidem excepturi, dolorem laboriosam laudantium magni soluta commodi quam consequuntur aperiam architecto a repellendus harum officiis distinctio, voluptate quae totam provident rem neque hic assumenda blanditiis nostrum fugiat! Et earum officiis ipsa reprehenderit ad ab amet aspernatur, blanditiis magnam iure, itaque, debitis dolor accusantium quam vitae numquam porro ipsum praesentium modi ullam similique. Suscipit, fuga aliquam!</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->', 'Merhaba dünya!', '', 'publish', 'open', 'open', '', 'merhaba-dunya', '', '', '2022-04-19 22:22:20', '2022-04-19 19:22:20', '', 0, 'http://localhost/Vaykul/?p=1', 0, 'post', '', 1),
(5, 1, '2022-04-18 12:24:34', '2022-04-18 09:24:34', '<label> Ad - Soyad\r\n    [text* your-name placeholder \"Tam İsminiz\"] </label>\r\n\r\n<label> E-posta Adresi\r\n    [email* your-email placeholder \"E-posta\"] </label>\r\n\r\n<label> Mesaj\r\n    [textarea* your-message placeholder \"Mesajınız\"] </label>\r\n\r\n[submit \"Gönder\"]\n1\n[_site_title] \"[your-subject]\"\n[_site_title] <info@vaykul.com>\n[_site_admin_email]\nKimden: [your-name] <[your-email]>\r\nKonu: [your-subject]\r\n\r\nİleti gövdesi:\r\n[your-message]\r\n\r\n-- \r\nBu e-posta, [_site_title] ([_site_url]) adresindeki iletişim formundan gönderildi.\nReply-To: [your-email]\n\n\n\n\n[_site_title] \"[your-subject]\"\n[_site_title] <info@vaykul.com>\n[your-email]\nİleti gövdesi:\r\n[your-message]\r\n\r\n-- \r\nBu e-posta, [_site_title] ([_site_url]) adresindeki iletişim formundan gönderildi.\nReply-To: [_site_admin_email]\n\n\n\nMesajınız için teşekkürler. Gönderildi.\nMesajınız gönderilirken bir hata oluştu. Lütfen daha sonra tekrar deneyin.\nBir veya daha fazla alanda hata bulundu. Lütfen kontrol edin ve tekrar deneyin.\nMesajınız gönderilirken bir hata oluştu. Lütfen daha sonra tekrar deneyin.\nMesajınızı göndermeden önce şartları ve koşulları kabul etmeniz gerekmektedir.\nBu alan zorunludur.\nBu alan çok uzun.\nBu alan çok kısa.\nDosya yüklenirken bilinmeyen bir hata oluştu.\nBu dosya türünü yükleme iznine sahip değilsiniz.\nDosya çok büyük.\nDosya yüklenirken hata meydana geldi.\nYanlış tarih formatı.\nBu tarih izin verilenden daha önce.\nBu tarih izin verilenden daha sonra.\nGeçersiz numara biçimi.\nBu sayı minimum değerden daha küçük.\nBu sayı maksimum değerden daha büyük.\nSoruya verilen cevap doğru değil.\nGirilen e-posta adresi geçersiz.\nGeçersiz adres.\nGeçersiz telefon numarası.', 'İletişim Sayfası Form', '', 'publish', 'closed', 'closed', '', 'iletisim-formu-1', '', '', '2022-04-20 02:32:58', '2022-04-19 23:32:58', '', 0, 'http://localhost/Vaykul/?post_type=wpcf7_contact_form&#038;p=5', 0, 'wpcf7_contact_form', '', 0),
(6, 1, '2022-04-18 12:28:26', '2022-04-18 09:28:26', '', 'polylang_mo_2', '', 'private', 'closed', 'closed', '', 'polylang_mo_2', '', '', '2022-04-18 12:28:26', '2022-04-18 09:28:26', '', 0, 'http://localhost/Vaykul/?post_type=polylang_mo&p=6', 0, 'polylang_mo', '', 0),
(9, 1, '2022-04-18 12:45:19', '2022-04-18 09:45:19', '<!-- wp:columns -->\n<div class=\"wp-block-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:image {\"id\":57,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost/Vaykul/wp-content/uploads/2022/04/hakkimizda.jpeg\" alt=\"\" class=\"wp-image-57\"/></figure>\n<!-- /wp:image --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Vero vel ullam possimus totam ad culpa, qui impedit quidem perferendis hic tempora nostrum doloremque minus praesentium animi fugiat id harum iste. Temporibus consequatur velit quasi modi culpa quo voluptas consequuntur enim quas quidem, rem provident minima fuga eligendi ex quos recusandae libero nostrum quam iusto. Alias rem iste aperiam doloribus cupiditate animi quod itaque libero tempora odio incidunt sed reprehenderit, temporibus possimus voluptates blanditiis quibusdam quaerat non et dolorum in ipsum optio. Voluptatum porro quisquam incidunt laborum impedit voluptatibus voluptates et aperiam. Alias nesciunt delectus illum in molestias sint magni nulla facere debitis dolorem, similique mollitia unde quis ut non culpa eligendi</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Hakkımızda', '', 'publish', 'closed', 'closed', '', 'hakkimizda', '', '', '2022-04-19 19:37:10', '2022-04-19 16:37:10', '', 0, 'http://localhost/Vaykul/?page_id=9', 0, 'page', '', 0),
(10, 1, '2022-04-18 12:45:09', '2022-04-18 09:45:09', '{\"version\": 2, \"isGlobalStylesUserThemeJSON\": true }', 'Custom Styles', '', 'publish', 'closed', 'closed', '', 'wp-global-styles-vaykul', '', '', '2022-04-18 12:45:09', '2022-04-18 09:45:09', '', 0, 'http://localhost/Vaykul/2022/04/18/wp-global-styles-vaykul/', 0, 'wp_global_styles', '', 0),
(11, 1, '2022-04-18 12:45:19', '2022-04-18 09:45:19', '', 'Hakkımızda', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2022-04-18 12:45:19', '2022-04-18 09:45:19', '', 9, 'http://localhost/Vaykul/?p=11', 0, 'revision', '', 0),
(54, 1, '2022-04-19 19:29:10', '2022-04-19 16:29:10', '<!-- wp:columns -->\n<div class=\"wp-block-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:image {\"id\":43,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/Vaykul/wp-content/uploads/2022/04/banner-desk-700x399.jpg\" alt=\"\" class=\"wp-image-43\"/></figure>\n<!-- /wp:image --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Vero vel ullam possimus totam ad culpa, qui impedit quidem perferendis hic tempora nostrum doloremque minus praesentium animi fugiat id harum iste. Temporibus consequatur velit quasi modi culpa quo voluptas consequuntur enim quas quidem, rem provident minima fuga eligendi ex quos recusandae libero nostrum quam iusto. Alias rem iste aperiam doloribus cupiditate animi quod itaque libero tempora odio incidunt sed reprehenderit, temporibus possimus voluptates blanditiis quibusdam quaerat non et dolorum in ipsum optio. Voluptatum porro quisquam incidunt laborum impedit voluptatibus voluptates et aperiam. Alias nesciunt delectus illum in molestias sint magni nulla facere debitis dolorem, similique mollitia unde quis ut non culpa eligendi</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Hakkımızda', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2022-04-19 19:29:10', '2022-04-19 16:29:10', '', 9, 'http://localhost/Vaykul/?p=54', 0, 'revision', '', 0),
(12, 1, '2022-04-18 12:45:56', '2022-04-18 09:45:56', '<!-- wp:paragraph -->\n<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Vero vel ullam possimus totam ad culpa, qui impedit quidem perferendis hic tempora nostrum doloremque minus praesentium animi fugiat id harum iste. Temporibus consequatur velit quasi modi culpa quo voluptas consequuntur enim quas quidem, rem provident minima fuga eligendi ex quos recusandae libero nostrum quam iusto. Alias rem iste aperiam doloribus cupiditate animi quod itaque libero tempora odio incidunt sed reprehenderit, temporibus possimus voluptates blanditiis quibusdam quaerat non et dolorum in ipsum optio. Voluptatum porro quisquam incidunt laborum impedit voluptatibus voluptates et aperiam. Alias nesciunt delectus illum in molestias sint magni nulla facere debitis dolorem, similique mollitia unde quis ut non culpa eligendi</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p> dolorum voluptates itaque labore veritatis cupiditate accusamus commodi aliquam. Enim debitis saepe modi porro, praesentium repudiandae id hic est similique quas dicta earum, eius deserunt perferendis beatae tempora iste nobis doloribus magnam? Porro quidem excepturi, dolorem laboriosam laudantium magni soluta commodi quam consequuntur aperiam architecto a repellendus harum officiis distinctio, voluptate quae totam provident rem neque hic assumenda blanditiis nostrum fugiat! Et earum officiis ipsa reprehenderit ad ab amet aspernatur, blanditiis magnam iure, itaque, debitis dolor accusantium quam vitae numquam porro ipsum praesentium modi ullam similique. Suscipit, fuga aliquam!</p>\n<!-- /wp:paragraph -->', 'Hakkımızda', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2022-04-18 12:45:56', '2022-04-18 09:45:56', '', 9, 'http://localhost/Vaykul/?p=12', 0, 'revision', '', 0),
(13, 1, '2022-04-18 12:46:54', '2022-04-18 09:46:54', '', 'Anasayfa', '', 'publish', 'closed', 'closed', '', 'anasayfa', '', '', '2022-04-20 14:00:42', '2022-04-20 11:00:42', '', 0, 'http://localhost/Vaykul/?page_id=13', 0, 'page', '', 0),
(14, 1, '2022-04-18 12:46:54', '2022-04-18 09:46:54', '', 'Anasayfa', '', 'inherit', 'closed', 'closed', '', '13-revision-v1', '', '', '2022-04-18 12:46:54', '2022-04-18 09:46:54', '', 13, 'http://localhost/Vaykul/?p=14', 0, 'revision', '', 0),
(15, 1, '2022-04-18 12:51:23', '2022-04-18 09:51:23', '<!-- wp:modula/gallery {\"id\":78,\"images\":[{\"id\":\"79\",\"alt\":\"\",\"title\":\"referans1\",\"description\":\"\",\"halign\":\"center\",\"valign\":\"middle\",\"link\":\"\",\"target\":0,\"width\":700,\"height\":933,\"src\":\"http://localhost/Vaykul/wp-content/uploads/2022/04/referans1-700x933.jpg\",\"data-width\":5,\"data-height\":5},{\"id\":\"80\",\"alt\":\"\",\"title\":\"referans2\",\"description\":\"\",\"halign\":\"center\",\"valign\":\"middle\",\"link\":\"\",\"target\":0,\"width\":700,\"height\":875,\"src\":\"http://localhost/Vaykul/wp-content/uploads/2022/04/referans2-700x875.jpg\",\"data-width\":4,\"data-height\":2},{\"id\":\"81\",\"alt\":\"\",\"title\":\"referans3\",\"description\":\"\",\"halign\":\"center\",\"valign\":\"middle\",\"link\":\"\",\"target\":0,\"width\":700,\"height\":986,\"src\":\"http://localhost/Vaykul/wp-content/uploads/2022/04/referans3-700x986.jpg\",\"data-width\":3,\"data-height\":3},{\"id\":\"82\",\"alt\":\"\",\"title\":\"referans4\",\"description\":\"\",\"halign\":\"center\",\"valign\":\"middle\",\"link\":\"\",\"target\":0,\"width\":683,\"height\":1024,\"src\":\"http://localhost/Vaykul/wp-content/uploads/2022/04/referans4-700x1050.jpg\",\"data-width\":2,\"data-height\":3},{\"id\":\"83\",\"alt\":\"\",\"title\":\"referans5\",\"description\":\"\",\"halign\":\"center\",\"valign\":\"middle\",\"link\":\"\",\"target\":0,\"width\":680,\"height\":1024,\"src\":\"http://localhost/Vaykul/wp-content/uploads/2022/04/referans5-700x1054.jpg\",\"data-width\":2,\"data-height\":3},{\"id\":\"84\",\"alt\":\"\",\"title\":\"referans6\",\"description\":\"\",\"halign\":\"center\",\"valign\":\"middle\",\"link\":\"\",\"target\":0,\"width\":700,\"height\":450,\"src\":\"http://localhost/Vaykul/wp-content/uploads/2022/04/referans6-700x450.jpg\",\"data-width\":3,\"data-height\":2}],\"galleryId\":174,\"galleryType\":\"gallery\",\"currentGallery\":{\"id\":78,\"date\":\"2022-04-19T23:13:48\",\"date_gmt\":\"2022-04-19T20:13:48\",\"guid\":{\"rendered\":\"http://localhost/Vaykul/?post_type=modula-gallery\\u0026#038;p=78\"},\"modified\":\"2022-04-19T23:13:48\",\"modified_gmt\":\"2022-04-19T20:13:48\",\"slug\":\"referanslar\",\"status\":\"publish\",\"type\":\"modula-gallery\",\"link\":\"http://localhost/Vaykul/?modula-gallery=referanslar\",\"title\":{\"rendered\":\"Referanslar\"},\"template\":\"\",\"modulaSettings\":{\"type\":\"custom-grid\",\"grid_type\":\"automatic\",\"grid_row_height\":\"250\",\"grid_justify_last_row\":\"justify\",\"grid_image_size\":\"medium\",\"grid_image_dimensions\":{\"width\":\"\",\"height\":\"\"},\"img_size\":\"200\",\"img_crop\":\"1\",\"grid_image_crop\":\"0\",\"gutter\":\"10\",\"tablet_gutter\":\"10\",\"mobile_gutter\":\"10\",\"width\":\"100%\",\"height\":[800,800,800],\"randomFactor\":50,\"shuffle\":\"0\",\"powered_by\":\"0\",\"lightbox\":\"fancybox\",\"show_navigation\":\"1\",\"hide_title\":\"1\",\"titleColor\":\"\",\"titleFontSize\":0,\"mobileTitleFontSize\":\"12\",\"hide_description\":\"0\",\"captionColor\":\"#ffffff\",\"captionFontSize\":14,\"mobileCaptionFontSize\":\"10\",\"enableSocial\":\"0\",\"enableTwitter\":\"0\",\"enableFacebook\":\"0\",\"enableWhatsapp\":\"0\",\"enableLinkedin\":\"0\",\"enablePinterest\":\"0\",\"enableEmail\":\"0\",\"emailSubject\":\"Check out this awesome image !!\",\"emailMessage\":\"Here is the link to the image : %%image_link%% and this is the link to the gallery : %%gallery_link%%\",\"socialIconColor\":\"#ffffff\",\"socialIconSize\":16,\"socialIconPadding\":10,\"loadedScale\":100,\"inView\":\"0\",\"effect\":\"pufrobo\",\"cursor\":\"zoom-in\",\"borderSize\":0,\"borderRadius\":0,\"borderColor\":\"#ffffff\",\"shadowSize\":0,\"shadowColor\":\"#ffffff\",\"lazy_load\":\"1\",\"enable_responsive\":\"0\",\"tablet_columns\":\"2\",\"mobile_columns\":\"1\",\"style\":\"\",\"last_visited_tab\":\"modula-general\",\"helpergrid\":0},\"_links\":{\"self\":[{\"href\":\"http://localhost/Vaykul/wp-json/wp/v2/modula-gallery/78\"}],\"collection\":[{\"href\":\"http://localhost/Vaykul/wp-json/wp/v2/modula-gallery\"}],\"about\":[{\"href\":\"http://localhost/Vaykul/wp-json/wp/v2/types/modula-gallery\"}],\"wp:attachment\":[{\"href\":\"http://localhost/Vaykul/wp-json/wp/v2/media?parent=78\"}],\"curies\":[{\"name\":\"wp\",\"href\":\"https://api.w.org/{rel}\",\"templated\":true}]}},\"currentSelectize\":[{\"value\":78,\"label\":\"Referanslar\"}]} /-->', 'Referanslar', '', 'publish', 'closed', 'closed', '', 'referanslar', '', '', '2022-04-19 23:14:14', '2022-04-19 20:14:14', '', 0, 'http://localhost/Vaykul/?page_id=15', 0, 'page', '', 0),
(16, 1, '2022-04-18 12:51:23', '2022-04-18 09:51:23', '', 'Referanslar', '', 'inherit', 'closed', 'closed', '', '15-revision-v1', '', '', '2022-04-18 12:51:23', '2022-04-18 09:51:23', '', 15, 'http://localhost/Vaykul/?p=16', 0, 'revision', '', 0),
(17, 1, '2022-04-18 12:51:35', '2022-04-18 09:51:35', '<!-- wp:columns -->\n<div class=\"wp-block-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:columns -->\n<div class=\"wp-block-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:html -->\n<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3019.033818502445!2d29.41148396566168!3d40.827220838495!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14cadf59dc2cd5b9%3A0x5ac8058d0112681f!2zVmF5a3VsIMSww6cgTWVrYW4gVGFzYXLEsW0!5e0!3m2!1str!2str!4v1650410568680!5m2!1str!2str\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\" width=\"100%\" height=\"600\"></iframe>\n<!-- /wp:html --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:contact-form-7/contact-form-selector {\"className\":\"iletisim-form\"} -->\n<div class=\"wp-block-contact-form-7-contact-form-selector iletisim-form\">[contact-form-7 id=\"5\" title=\"İletişim Sayfası Form\"]</div>\n<!-- /wp:contact-form-7/contact-form-selector --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->', 'İletişim', '', 'publish', 'closed', 'closed', '', 'iletisim', '', '', '2022-04-20 02:34:17', '2022-04-19 23:34:17', '', 0, 'http://localhost/Vaykul/?page_id=17', 0, 'page', '', 0),
(18, 1, '2022-04-18 12:51:35', '2022-04-18 09:51:35', '', 'İletişim', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2022-04-18 12:51:35', '2022-04-18 09:51:35', '', 17, 'http://localhost/Vaykul/?p=18', 0, 'revision', '', 0),
(19, 1, '2022-04-20 14:03:43', '2022-04-18 09:53:50', ' ', '', '', 'publish', 'closed', 'closed', '', '19', '', '', '2022-04-20 14:03:43', '2022-04-20 11:03:43', '', 0, 'http://localhost/Vaykul/?p=19', 1, 'nav_menu_item', '', 0),
(20, 1, '2022-04-20 14:03:43', '2022-04-18 09:53:50', ' ', '', '', 'publish', 'closed', 'closed', '', '20', '', '', '2022-04-20 14:03:43', '2022-04-20 11:03:43', '', 0, 'http://localhost/Vaykul/?p=20', 2, 'nav_menu_item', '', 0),
(21, 1, '2022-04-20 14:03:43', '2022-04-18 09:53:50', ' ', '', '', 'publish', 'closed', 'closed', '', '21', '', '', '2022-04-20 14:03:43', '2022-04-20 11:03:43', '', 0, 'http://localhost/Vaykul/?p=21', 4, 'nav_menu_item', '', 0),
(22, 1, '2022-04-20 14:03:43', '2022-04-18 09:53:50', ' ', '', '', 'publish', 'closed', 'closed', '', '22', '', '', '2022-04-20 14:03:43', '2022-04-20 11:03:43', '', 0, 'http://localhost/Vaykul/?p=22', 6, 'nav_menu_item', '', 0),
(24, 1, '2022-04-20 14:03:43', '2022-04-18 09:53:50', ' ', '', '', 'publish', 'closed', 'closed', '', '24', '', '', '2022-04-20 14:03:43', '2022-04-20 11:03:43', '', 0, 'http://localhost/Vaykul/?p=24', 3, 'nav_menu_item', '', 0),
(96, 1, '2022-04-20 14:03:43', '2022-04-20 11:03:43', ' ', '', '', 'publish', 'closed', 'closed', '', '96', '', '', '2022-04-20 14:03:43', '2022-04-20 11:03:43', '', 0, 'http://localhost/Vaykul/?p=96', 5, 'nav_menu_item', '', 0),
(36, 1, '2022-04-18 14:25:14', '2022-04-18 11:25:14', '<!-- wp:paragraph -->\n<p>WordPress’e hoş geldiniz. Bu sizin ilk yazınız. Bu yazıyı düzenleyin ya da silin. Sonra yazmaya başlayın!</p>\n<!-- /wp:paragraph -->', 'Merhaba dünya!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2022-04-18 14:25:14', '2022-04-18 11:25:14', '', 1, 'http://localhost/Vaykul/?p=36', 0, 'revision', '', 0),
(26, 1, '2022-04-18 13:33:57', '2022-04-18 10:33:57', '<!-- wp:image {\"id\":25,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/Vaykul/wp-content/uploads/2022/04/villalar-700x394.png\" alt=\"\" class=\"wp-image-25\"/></figure>\n<!-- /wp:image -->', 'Anasayfa', '', 'inherit', 'closed', 'closed', '', '13-revision-v1', '', '', '2022-04-18 13:33:57', '2022-04-18 10:33:57', '', 13, 'http://localhost/Vaykul/?p=26', 0, 'revision', '', 0),
(29, 1, '2022-04-18 13:35:05', '2022-04-18 10:35:05', '<!-- wp:image {\"id\":25,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/Vaykul/wp-content/uploads/2022/04/villalar-700x394.png\" alt=\"\" class=\"wp-image-25\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Anasayfa', '', 'inherit', 'closed', 'closed', '', '13-revision-v1', '', '', '2022-04-18 13:35:05', '2022-04-18 10:35:05', '', 13, 'http://localhost/Vaykul/?p=29', 0, 'revision', '', 0),
(35, 1, '2022-04-18 13:40:04', '2022-04-18 10:40:04', '', 'Anasayfa', '', 'inherit', 'closed', 'closed', '', '13-revision-v1', '', '', '2022-04-18 13:40:04', '2022-04-18 10:40:04', '', 13, 'http://localhost/Vaykul/?p=35', 0, 'revision', '', 0),
(28, 1, '2022-04-18 13:34:14', '2022-04-18 10:34:14', '<!-- wp:image {\"id\":25,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/Vaykul/wp-content/uploads/2022/04/villalar-700x394.png\" alt=\"\" class=\"wp-image-25\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>zink</p>\n<!-- /wp:paragraph -->', 'Anasayfa', '', 'inherit', 'closed', 'closed', '', '13-revision-v1', '', '', '2022-04-18 13:34:14', '2022-04-18 10:34:14', '', 13, 'http://localhost/Vaykul/?p=28', 0, 'revision', '', 0),
(33, 1, '2022-04-18 13:36:54', '2022-04-18 10:36:54', '<!-- wp:image {\"id\":31,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/Vaykul/wp-content/uploads/2022/04/villalar-1-700x394.png\" alt=\"\" class=\"wp-image-31\"/></figure>\n<!-- /wp:image -->', 'Anasayfa', '', 'inherit', 'closed', 'closed', '', '13-revision-v1', '', '', '2022-04-18 13:36:54', '2022-04-18 10:36:54', '', 13, 'http://localhost/Vaykul/?p=33', 0, 'revision', '', 0),
(30, 1, '2022-04-18 13:35:27', '2022-04-18 10:35:27', '<!-- wp:image {\"id\":25,\"width\":1100,\"height\":619,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large is-resized\"><img src=\"http://localhost/Vaykul/wp-content/uploads/2022/04/villalar-700x394.png\" alt=\"\" class=\"wp-image-25\" width=\"1100\" height=\"619\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Anasayfa', '', 'inherit', 'closed', 'closed', '', '13-revision-v1', '', '', '2022-04-18 13:35:27', '2022-04-18 10:35:27', '', 13, 'http://localhost/Vaykul/?p=30', 0, 'revision', '', 0),
(52, 1, '2022-04-19 19:04:05', '2022-04-19 16:04:05', '', 'banner-mob', '', 'inherit', 'open', 'closed', '', 'banner-mob', '', '', '2022-04-19 19:04:05', '2022-04-19 16:04:05', '', 13, 'http://localhost/Vaykul/wp-content/uploads/2022/04/banner-mob.jpg', 0, 'attachment', 'image/jpeg', 0),
(43, 1, '2022-04-19 18:32:24', '2022-04-19 15:32:24', '', 'banner-desk', '', 'inherit', 'open', 'closed', '', 'banner-desk', '', '', '2022-04-19 18:32:24', '2022-04-19 15:32:24', '', 13, 'http://localhost/Vaykul/wp-content/uploads/2022/04/banner-desk.jpg', 0, 'attachment', 'image/jpeg', 0),
(56, 1, '2022-04-19 19:31:20', '2022-04-19 16:31:20', '<!-- wp:columns -->\n<div class=\"wp-block-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:image {\"id\":43,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/Vaykul/wp-content/uploads/2022/04/banner-desk-700x399.jpg\" alt=\"\" class=\"wp-image-43\"/></figure>\n<!-- /wp:image --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Vero vel ullam possimus totam ad culpa, qui impedit quidem perferendis hic tempora nostrum doloremque minus praesentium animi fugiat id harum iste. Temporibus consequatur velit quasi modi culpa quo voluptas consequuntur enim quas quidem, rem provident minima fuga eligendi ex quos recusandae libero nostrum quam iusto. Alias rem iste aperiam doloribus cupiditate animi quod itaque libero tempora odio incidunt sed reprehenderit, temporibus possimus voluptates blanditiis quibusdam quaerat non et dolorum in ipsum optio. Voluptatum porro quisquam incidunt laborum impedit voluptatibus voluptates et aperiam. Alias nesciunt delectus illum in molestias sint magni nulla facere debitis dolorem, similique mollitia unde quis ut non culpa eligendi</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Hakkımızda', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2022-04-19 19:31:20', '2022-04-19 16:31:20', '', 9, 'http://localhost/Vaykul/?p=56', 0, 'revision', '', 0),
(55, 1, '2022-04-19 19:30:54', '2022-04-19 16:30:54', '<!-- wp:columns -->\n<div class=\"wp-block-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:image {\"align\":\"center\",\"id\":43,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<div class=\"wp-block-image\"><figure class=\"aligncenter size-large\"><img src=\"http://localhost/Vaykul/wp-content/uploads/2022/04/banner-desk-700x399.jpg\" alt=\"\" class=\"wp-image-43\"/></figure></div>\n<!-- /wp:image --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Vero vel ullam possimus totam ad culpa, qui impedit quidem perferendis hic tempora nostrum doloremque minus praesentium animi fugiat id harum iste. Temporibus consequatur velit quasi modi culpa quo voluptas consequuntur enim quas quidem, rem provident minima fuga eligendi ex quos recusandae libero nostrum quam iusto. Alias rem iste aperiam doloribus cupiditate animi quod itaque libero tempora odio incidunt sed reprehenderit, temporibus possimus voluptates blanditiis quibusdam quaerat non et dolorum in ipsum optio. Voluptatum porro quisquam incidunt laborum impedit voluptatibus voluptates et aperiam. Alias nesciunt delectus illum in molestias sint magni nulla facere debitis dolorem, similique mollitia unde quis ut non culpa eligendi</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Hakkımızda', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2022-04-19 19:30:54', '2022-04-19 16:30:54', '', 9, 'http://localhost/Vaykul/?p=55', 0, 'revision', '', 0),
(57, 1, '2022-04-19 19:32:34', '2022-04-19 16:32:34', '', 'hakkimizda', '', 'inherit', 'open', 'closed', '', 'hakkimizda-2', '', '', '2022-04-19 19:32:34', '2022-04-19 16:32:34', '', 9, 'http://localhost/Vaykul/wp-content/uploads/2022/04/hakkimizda.jpeg', 0, 'attachment', 'image/jpeg', 0),
(58, 1, '2022-04-19 19:32:36', '2022-04-19 16:32:36', '<!-- wp:columns -->\n<div class=\"wp-block-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:image {\"id\":57,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/Vaykul/wp-content/uploads/2022/04/hakkimizda-700x394.jpeg\" alt=\"\" class=\"wp-image-57\"/></figure>\n<!-- /wp:image --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Vero vel ullam possimus totam ad culpa, qui impedit quidem perferendis hic tempora nostrum doloremque minus praesentium animi fugiat id harum iste. Temporibus consequatur velit quasi modi culpa quo voluptas consequuntur enim quas quidem, rem provident minima fuga eligendi ex quos recusandae libero nostrum quam iusto. Alias rem iste aperiam doloribus cupiditate animi quod itaque libero tempora odio incidunt sed reprehenderit, temporibus possimus voluptates blanditiis quibusdam quaerat non et dolorum in ipsum optio. Voluptatum porro quisquam incidunt laborum impedit voluptatibus voluptates et aperiam. Alias nesciunt delectus illum in molestias sint magni nulla facere debitis dolorem, similique mollitia unde quis ut non culpa eligendi</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Hakkımızda', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2022-04-19 19:32:36', '2022-04-19 16:32:36', '', 9, 'http://localhost/Vaykul/?p=58', 0, 'revision', '', 0),
(66, 1, '2022-04-19 19:51:34', '2022-04-19 16:51:34', '', 'Blog', '', 'publish', 'closed', 'closed', '', 'blog', '', '', '2022-04-20 14:01:35', '2022-04-20 11:01:35', '', 0, 'http://localhost/Vaykul/?page_id=66', 0, 'page', '', 0),
(67, 1, '2022-04-19 19:51:34', '2022-04-19 16:51:34', '', 'deneme', '', 'inherit', 'closed', 'closed', '', '66-revision-v1', '', '', '2022-04-19 19:51:34', '2022-04-19 16:51:34', '', 66, 'http://localhost/Vaykul/?p=67', 0, 'revision', '', 0),
(68, 1, '2022-04-19 21:27:44', '2022-04-19 18:27:44', '', 'Örnek Galeri', '', 'publish', 'closed', 'closed', '', '68', '', '', '2022-04-19 22:04:45', '2022-04-19 19:04:45', '', 0, 'http://localhost/Vaykul/?post_type=modula-gallery&#038;p=68', 0, 'modula-gallery', '', 0),
(69, 1, '2022-04-19 21:32:43', '2022-04-19 18:32:43', '', 'Galeri', '', 'inherit', 'closed', 'closed', '', '68-autosave-v1', '', '', '2022-04-19 21:32:43', '2022-04-19 18:32:43', '', 68, 'http://localhost/Vaykul/?p=69', 0, 'revision', '', 0),
(60, 1, '2022-04-19 19:36:52', '2022-04-19 16:36:52', '<!-- wp:columns -->\n<div class=\"wp-block-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:image {\"id\":57,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost/Vaykul/wp-content/uploads/2022/04/hakkimizda.jpeg\" alt=\"\" class=\"wp-image-57\"/></figure>\n<!-- /wp:image --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Vero vel ullam possimus totam ad culpa, qui impedit quidem perferendis hic tempora nostrum doloremque minus praesentium animi fugiat id harum iste. Temporibus consequatur velit quasi modi culpa quo voluptas consequuntur enim quas quidem, rem provident minima fuga eligendi ex quos recusandae libero nostrum quam iusto. Alias rem iste aperiam doloribus cupiditate animi quod itaque libero tempora odio incidunt sed reprehenderit, temporibus possimus voluptates blanditiis quibusdam quaerat non et dolorum in ipsum optio. Voluptatum porro quisquam incidunt laborum impedit voluptatibus voluptates et aperiam. Alias nesciunt delectus illum in molestias sint magni nulla facere debitis dolorem, similique mollitia unde quis ut non culpa eligendi</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Hakkımızda', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2022-04-19 19:36:52', '2022-04-19 16:36:52', '', 9, 'http://localhost/Vaykul/?p=60', 0, 'revision', '', 0),
(71, 1, '2022-04-19 21:42:55', '2022-04-19 18:42:55', '<!-- wp:columns -->\n<div class=\"wp-block-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:modula/gallery {\"id\":68,\"images\":[{\"id\":\"57\",\"alt\":\"\",\"title\":\"hakkimizda\",\"description\":\"\",\"halign\":\"center\",\"valign\":\"middle\",\"link\":\"\",\"target\":0,\"width\":700,\"height\":394,\"src\":\"http://localhost/Vaykul/wp-content/uploads/2022/04/hakkimizda-700x394.jpeg\",\"data-width\":2,\"data-height\":2},{\"id\":\"52\",\"alt\":\"\",\"title\":\"banner-mob\",\"description\":\"\",\"halign\":\"center\",\"valign\":\"middle\",\"link\":\"\",\"target\":0,\"width\":539,\"height\":1024,\"src\":\"http://localhost/Vaykul/wp-content/uploads/2022/04/banner-mob.jpg\",\"data-width\":2,\"data-height\":2},{\"id\":\"43\",\"alt\":\"\",\"title\":\"banner-desk\",\"description\":\"\",\"halign\":\"center\",\"valign\":\"middle\",\"link\":\"\",\"target\":0,\"width\":700,\"height\":399,\"src\":\"http://localhost/Vaykul/wp-content/uploads/2022/04/banner-desk-700x399.jpg\",\"data-width\":2,\"data-height\":2}],\"galleryId\":498,\"galleryType\":\"gallery\",\"currentGallery\":{\"id\":68,\"date\":\"2022-04-19T21:27:44\",\"date_gmt\":\"2022-04-19T18:27:44\",\"guid\":{\"rendered\":\"http://localhost/Vaykul/?post_type=modula-gallery\\u0026#038;p=68\"},\"modified\":\"2022-04-19T21:37:31\",\"modified_gmt\":\"2022-04-19T18:37:31\",\"slug\":\"68\",\"status\":\"publish\",\"type\":\"modula-gallery\",\"link\":\"http://localhost/Vaykul/?modula-gallery=68\",\"title\":{\"rendered\":\"Galeri\"},\"template\":\"\",\"modulaSettings\":{\"type\":\"grid\",\"width\":\"100%\",\"height\":[800,800,800],\"randomFactor\":50,\"lightbox\":\"fancybox\",\"show_navigation\":\"1\",\"shuffle\":\"0\",\"titleColor\":\"\",\"captionColor\":\"#ffffff\",\"hide_title\":\"1\",\"hide_description\":\"0\",\"captionFontSize\":14,\"titleFontSize\":0,\"mobileCaptionFontSize\":\"10\",\"mobileTitleFontSize\":\"12\",\"enableSocial\":\"0\",\"enableFacebook\":\"0\",\"enableLinkedin\":\"0\",\"enablePinterest\":\"0\",\"enableTwitter\":\"0\",\"enableWhatsapp\":\"0\",\"enableEmail\":\"0\",\"emailSubject\":\"Check out this awesome image !!\",\"emailMessage\":\"Here is the link to the image : %%image_link%% and this is the link to the gallery : %%gallery_link%%\",\"filterClick\":0,\"socialIconColor\":\"#ffffff\",\"socialIconSize\":16,\"socialIconPadding\":10,\"loadedScale\":100,\"inView\":1,\"cursor\":\"pointer\",\"effect\":\"pufrobo\",\"borderColor\":\"#ffffff\",\"borderRadius\":0,\"borderSize\":0,\"shadowColor\":\"#ffffff\",\"shadowSize\":0,\"script\":\"\",\"style\":\"\",\"columns\":6,\"gutter\":\"10\",\"mobile_gutter\":\"10\",\"tablet_gutter\":\"10\",\"helpergrid\":0,\"lazy_load\":\"1\",\"grid_type\":\"1\",\"grid_image_size\":\"custom\",\"grid_image_crop\":\"0\",\"grid_image_dimensions\":{\"width\":\"600\",\"height\":\"300\"},\"img_size\":\"200\",\"grid_row_height\":\"250\",\"grid_justify_last_row\":\"justify\",\"enable_responsive\":\"0\",\"powered_by\":\"0\",\"last_visited_tab\":\"modula-customizations\",\"img_crop\":\"1\",\"tablet_columns\":\"2\",\"mobile_columns\":\"1\"},\"_links\":{\"self\":[{\"href\":\"http://localhost/Vaykul/wp-json/wp/v2/modula-gallery/68\"}],\"collection\":[{\"href\":\"http://localhost/Vaykul/wp-json/wp/v2/modula-gallery\"}],\"about\":[{\"href\":\"http://localhost/Vaykul/wp-json/wp/v2/types/modula-gallery\"}],\"wp:attachment\":[{\"href\":\"http://localhost/Vaykul/wp-json/wp/v2/media?parent=68\"}],\"curies\":[{\"name\":\"wp\",\"href\":\"https://api.w.org/{rel}\",\"templated\":true}]}},\"currentSelectize\":[{\"value\":68,\"label\":\"Galeri\"}]} /--></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>dolorum voluptates itaque labore veritatis cupiditate accusamus commodi aliquam. Enim debitis saepe modi porro, praesentium repudiandae id hic est similique quas dicta earum, eius deserunt perferendis beatae tempora iste nobis doloribus magnam? Porro quidem excepturi, dolorem laboriosam laudantium magni soluta commodi quam consequuntur aperiam architecto a repellendus harum officiis distinctio, voluptate quae totam provident rem neque hic assumenda blanditiis nostrum fugiat! Et earum officiis ipsa reprehenderit ad ab amet aspernatur, blanditiis magnam iure, itaque, debitis dolor accusantium quam vitae numquam porro ipsum praesentium modi ullam similique. Suscipit, fuga aliquam!</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->', 'Merhaba dünya!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2022-04-19 21:42:55', '2022-04-19 18:42:55', '', 1, 'http://localhost/Vaykul/?p=71', 0, 'revision', '', 0),
(72, 1, '2022-04-19 22:04:41', '2022-04-19 19:04:41', '', 'world-map', '', 'inherit', 'open', 'closed', '', 'world-map', '', '', '2022-04-19 22:04:41', '2022-04-19 19:04:41', '', 68, 'http://localhost/Vaykul/wp-content/uploads/2022/04/world-map.jpg', 0, 'attachment', 'image/jpeg', 0),
(74, 1, '2022-04-19 22:22:19', '2022-04-19 19:22:19', '<!-- wp:columns -->\n<div class=\"wp-block-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:modula/gallery {\"id\":68,\"images\":[{\"id\":\"57\",\"alt\":\"\",\"title\":\"hakkimizda\",\"description\":\"\",\"halign\":\"center\",\"valign\":\"middle\",\"link\":\"\",\"target\":0,\"width\":700,\"height\":394,\"src\":\"http://localhost/Vaykul/wp-content/uploads/2022/04/hakkimizda-700x394.jpeg\",\"data-width\":2,\"data-height\":2},{\"id\":\"43\",\"alt\":\"\",\"title\":\"banner-desk\",\"description\":\"\",\"halign\":\"center\",\"valign\":\"middle\",\"link\":\"\",\"target\":0,\"width\":700,\"height\":399,\"src\":\"http://localhost/Vaykul/wp-content/uploads/2022/04/banner-desk-700x399.jpg\",\"data-width\":2,\"data-height\":2},{\"id\":\"72\",\"alt\":\"\",\"title\":\"world-map\",\"description\":\"\",\"halign\":\"center\",\"valign\":\"middle\",\"link\":\"\",\"target\":0,\"width\":700,\"height\":394,\"src\":\"http://localhost/Vaykul/wp-content/uploads/2022/04/world-map-700x394.jpg\",\"data-width\":2,\"data-height\":2}],\"galleryId\":185,\"galleryType\":\"gallery\",\"currentGallery\":{\"id\":68,\"date\":\"2022-04-19T21:27:44\",\"date_gmt\":\"2022-04-19T18:27:44\",\"guid\":{\"rendered\":\"http://localhost/Vaykul/?post_type=modula-gallery\\u0026#038;p=68\"},\"modified\":\"2022-04-19T22:04:45\",\"modified_gmt\":\"2022-04-19T19:04:45\",\"slug\":\"68\",\"status\":\"publish\",\"type\":\"modula-gallery\",\"link\":\"http://localhost/Vaykul/?modula-gallery=68\",\"title\":{\"rendered\":\"Örnek Galeri\"},\"template\":\"\",\"modulaSettings\":{\"type\":\"grid\",\"grid_type\":\"1\",\"grid_row_height\":\"250\",\"grid_justify_last_row\":\"justify\",\"grid_image_size\":\"full\",\"grid_image_dimensions\":{\"width\":\"600\",\"height\":\"300\"},\"img_size\":\"200\",\"img_crop\":\"1\",\"grid_image_crop\":\"0\",\"gutter\":\"30\",\"tablet_gutter\":\"30\",\"mobile_gutter\":\"30\",\"width\":\"100%\",\"height\":[800,800,800],\"randomFactor\":50,\"shuffle\":\"0\",\"powered_by\":\"0\",\"lightbox\":\"fancybox\",\"show_navigation\":\"1\",\"hide_title\":\"1\",\"titleColor\":\"\",\"titleFontSize\":0,\"mobileTitleFontSize\":\"12\",\"hide_description\":\"0\",\"captionColor\":\"#ffffff\",\"captionFontSize\":14,\"mobileCaptionFontSize\":\"10\",\"enableSocial\":\"0\",\"enableTwitter\":\"0\",\"enableFacebook\":\"0\",\"enableWhatsapp\":\"0\",\"enableLinkedin\":\"0\",\"enablePinterest\":\"0\",\"enableEmail\":\"0\",\"emailSubject\":\"Check out this awesome image !!\",\"emailMessage\":\"Here is the link to the image : %%image_link%% and this is the link to the gallery : %%gallery_link%%\",\"socialIconColor\":\"#ffffff\",\"socialIconSize\":16,\"socialIconPadding\":10,\"loadedScale\":100,\"inView\":1,\"effect\":\"pufrobo\",\"cursor\":\"pointer\",\"borderSize\":0,\"borderRadius\":0,\"borderColor\":\"#ffffff\",\"shadowSize\":0,\"shadowColor\":\"#ffffff\",\"lazy_load\":\"1\",\"enable_responsive\":\"0\",\"tablet_columns\":\"2\",\"mobile_columns\":\"1\",\"style\":\"\",\"last_visited_tab\":\"modula-general\",\"helpergrid\":0},\"_links\":{\"self\":[{\"href\":\"http://localhost/Vaykul/wp-json/wp/v2/modula-gallery/68\"}],\"collection\":[{\"href\":\"http://localhost/Vaykul/wp-json/wp/v2/modula-gallery\"}],\"about\":[{\"href\":\"http://localhost/Vaykul/wp-json/wp/v2/types/modula-gallery\"}],\"wp:attachment\":[{\"href\":\"http://localhost/Vaykul/wp-json/wp/v2/media?parent=68\"}],\"curies\":[{\"name\":\"wp\",\"href\":\"https://api.w.org/{rel}\",\"templated\":true}]}},\"currentSelectize\":[{\"value\":68,\"label\":\"Örnek Galeri\"}]} /--></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p>dolorum voluptates itaque labore veritatis cupiditate accusamus commodi aliquam. Enim debitis saepe modi porro, praesentium repudiandae id hic est similique quas dicta earum, eius deserunt perferendis beatae tempora iste nobis doloribus magnam? Porro quidem excepturi, dolorem laboriosam laudantium magni soluta commodi quam consequuntur aperiam architecto a repellendus harum officiis distinctio, voluptate quae totam provident rem neque hic assumenda blanditiis nostrum fugiat! Et earum officiis ipsa reprehenderit ad ab amet aspernatur, blanditiis magnam iure, itaque, debitis dolor accusantium quam vitae numquam porro ipsum praesentium modi ullam similique. Suscipit, fuga aliquam!</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->', 'Merhaba dünya!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2022-04-19 22:22:19', '2022-04-19 19:22:19', '', 1, 'http://localhost/Vaykul/?p=74', 0, 'revision', '', 0),
(75, 1, '2022-04-19 22:26:04', '2022-04-19 19:26:04', '<!-- wp:paragraph -->\n<p>dolorum voluptates itaque labore veritatis cupiditate accusamus commodi aliquam. Enim debitis saepe modi porro, praesentium repudiandae id hic est similique quas dicta earum, eius deserunt perferendis beatae tempora iste nobis doloribus magnam? Porro quidem excepturi, dolorem laboriosam laudantium magni soluta commodi quam consequuntur aperiam architecto a repellendus harum officiis distinctio, voluptate quae totam provident rem neque hic assumenda blanditiis nostrum fugiat! Et earum officiis ipsa reprehenderit ad ab amet aspernatur, blanditiis magnam iure, itaque, debitis dolor accusantium quam vitae numquam porro ipsum praesentium modi ullam similique. Suscipit, fuga aliquam!</p>\n<!-- /wp:paragraph -->', 'Örnek Yazı', '', 'publish', 'open', 'open', '', 'ornek-yazi', '', '', '2022-04-20 14:26:20', '2022-04-20 11:26:20', '', 0, 'http://localhost/Vaykul/?p=75', 0, 'post', '', 0),
(76, 1, '2022-04-19 22:26:04', '2022-04-19 19:26:04', '<!-- wp:paragraph -->\n<p>dolorum voluptates itaque labore veritatis cupiditate accusamus commodi aliquam. Enim debitis saepe modi porro, praesentium repudiandae id hic est similique quas dicta earum, eius deserunt perferendis beatae tempora iste nobis doloribus magnam? Porro quidem excepturi, dolorem laboriosam laudantium magni soluta commodi quam consequuntur aperiam architecto a repellendus harum officiis distinctio, voluptate quae totam provident rem neque hic assumenda blanditiis nostrum fugiat! Et earum officiis ipsa reprehenderit ad ab amet aspernatur, blanditiis magnam iure, itaque, debitis dolor accusantium quam vitae numquam porro ipsum praesentium modi ullam similique. Suscipit, fuga aliquam!</p>\n<!-- /wp:paragraph -->', 'Örnek Yazı', '', 'inherit', 'closed', 'closed', '', '75-revision-v1', '', '', '2022-04-19 22:26:04', '2022-04-19 19:26:04', '', 75, 'http://localhost/Vaykul/?p=76', 0, 'revision', '', 0),
(78, 1, '2022-04-19 23:13:48', '2022-04-19 20:13:48', '', 'Referanslar', '', 'publish', 'closed', 'closed', '', 'referanslar', '', '', '2022-04-19 23:20:43', '2022-04-19 20:20:43', '', 0, 'http://localhost/Vaykul/?post_type=modula-gallery&#038;p=78', 0, 'modula-gallery', '', 0),
(79, 1, '2022-04-19 23:11:42', '2022-04-19 20:11:42', '', 'referans1', '', 'inherit', 'open', 'closed', '', 'referans1', '', '', '2022-04-19 23:11:42', '2022-04-19 20:11:42', '', 78, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans1.jpg', 0, 'attachment', 'image/jpeg', 0),
(80, 1, '2022-04-19 23:11:45', '2022-04-19 20:11:45', '', 'referans2', '', 'inherit', 'open', 'closed', '', 'referans2', '', '', '2022-04-19 23:11:45', '2022-04-19 20:11:45', '', 78, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans2.jpg', 0, 'attachment', 'image/jpeg', 0),
(81, 1, '2022-04-19 23:11:47', '2022-04-19 20:11:47', '', 'referans3', '', 'inherit', 'open', 'closed', '', 'referans3', '', '', '2022-04-19 23:11:47', '2022-04-19 20:11:47', '', 78, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans3.jpg', 0, 'attachment', 'image/jpeg', 0),
(82, 1, '2022-04-19 23:11:51', '2022-04-19 20:11:51', '', 'referans4', '', 'inherit', 'open', 'closed', '', 'referans4', '', '', '2022-04-19 23:11:51', '2022-04-19 20:11:51', '', 78, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans4.jpg', 0, 'attachment', 'image/jpeg', 0),
(83, 1, '2022-04-19 23:11:54', '2022-04-19 20:11:54', '', 'referans5', '', 'inherit', 'open', 'closed', '', 'referans5', '', '', '2022-04-19 23:11:54', '2022-04-19 20:11:54', '', 78, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans5.jpg', 0, 'attachment', 'image/jpeg', 0),
(84, 1, '2022-04-19 23:11:58', '2022-04-19 20:11:58', '', 'referans6', '', 'inherit', 'open', 'closed', '', 'referans6', '', '', '2022-04-19 23:11:58', '2022-04-19 20:11:58', '', 78, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans6.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `vyk_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(85, 1, '2022-04-19 23:14:12', '2022-04-19 20:14:12', '<!-- wp:modula/gallery {\"id\":78,\"images\":[{\"id\":\"79\",\"alt\":\"\",\"title\":\"referans1\",\"description\":\"\",\"halign\":\"center\",\"valign\":\"middle\",\"link\":\"\",\"target\":0,\"width\":700,\"height\":933,\"src\":\"http://localhost/Vaykul/wp-content/uploads/2022/04/referans1-700x933.jpg\",\"data-width\":5,\"data-height\":5},{\"id\":\"80\",\"alt\":\"\",\"title\":\"referans2\",\"description\":\"\",\"halign\":\"center\",\"valign\":\"middle\",\"link\":\"\",\"target\":0,\"width\":700,\"height\":875,\"src\":\"http://localhost/Vaykul/wp-content/uploads/2022/04/referans2-700x875.jpg\",\"data-width\":4,\"data-height\":2},{\"id\":\"81\",\"alt\":\"\",\"title\":\"referans3\",\"description\":\"\",\"halign\":\"center\",\"valign\":\"middle\",\"link\":\"\",\"target\":0,\"width\":700,\"height\":986,\"src\":\"http://localhost/Vaykul/wp-content/uploads/2022/04/referans3-700x986.jpg\",\"data-width\":3,\"data-height\":3},{\"id\":\"82\",\"alt\":\"\",\"title\":\"referans4\",\"description\":\"\",\"halign\":\"center\",\"valign\":\"middle\",\"link\":\"\",\"target\":0,\"width\":683,\"height\":1024,\"src\":\"http://localhost/Vaykul/wp-content/uploads/2022/04/referans4-700x1050.jpg\",\"data-width\":2,\"data-height\":3},{\"id\":\"83\",\"alt\":\"\",\"title\":\"referans5\",\"description\":\"\",\"halign\":\"center\",\"valign\":\"middle\",\"link\":\"\",\"target\":0,\"width\":680,\"height\":1024,\"src\":\"http://localhost/Vaykul/wp-content/uploads/2022/04/referans5-700x1054.jpg\",\"data-width\":2,\"data-height\":3},{\"id\":\"84\",\"alt\":\"\",\"title\":\"referans6\",\"description\":\"\",\"halign\":\"center\",\"valign\":\"middle\",\"link\":\"\",\"target\":0,\"width\":700,\"height\":450,\"src\":\"http://localhost/Vaykul/wp-content/uploads/2022/04/referans6-700x450.jpg\",\"data-width\":3,\"data-height\":2}],\"galleryId\":174,\"galleryType\":\"gallery\",\"currentGallery\":{\"id\":78,\"date\":\"2022-04-19T23:13:48\",\"date_gmt\":\"2022-04-19T20:13:48\",\"guid\":{\"rendered\":\"http://localhost/Vaykul/?post_type=modula-gallery\\u0026#038;p=78\"},\"modified\":\"2022-04-19T23:13:48\",\"modified_gmt\":\"2022-04-19T20:13:48\",\"slug\":\"referanslar\",\"status\":\"publish\",\"type\":\"modula-gallery\",\"link\":\"http://localhost/Vaykul/?modula-gallery=referanslar\",\"title\":{\"rendered\":\"Referanslar\"},\"template\":\"\",\"modulaSettings\":{\"type\":\"custom-grid\",\"grid_type\":\"automatic\",\"grid_row_height\":\"250\",\"grid_justify_last_row\":\"justify\",\"grid_image_size\":\"medium\",\"grid_image_dimensions\":{\"width\":\"\",\"height\":\"\"},\"img_size\":\"200\",\"img_crop\":\"1\",\"grid_image_crop\":\"0\",\"gutter\":\"10\",\"tablet_gutter\":\"10\",\"mobile_gutter\":\"10\",\"width\":\"100%\",\"height\":[800,800,800],\"randomFactor\":50,\"shuffle\":\"0\",\"powered_by\":\"0\",\"lightbox\":\"fancybox\",\"show_navigation\":\"1\",\"hide_title\":\"1\",\"titleColor\":\"\",\"titleFontSize\":0,\"mobileTitleFontSize\":\"12\",\"hide_description\":\"0\",\"captionColor\":\"#ffffff\",\"captionFontSize\":14,\"mobileCaptionFontSize\":\"10\",\"enableSocial\":\"0\",\"enableTwitter\":\"0\",\"enableFacebook\":\"0\",\"enableWhatsapp\":\"0\",\"enableLinkedin\":\"0\",\"enablePinterest\":\"0\",\"enableEmail\":\"0\",\"emailSubject\":\"Check out this awesome image !!\",\"emailMessage\":\"Here is the link to the image : %%image_link%% and this is the link to the gallery : %%gallery_link%%\",\"socialIconColor\":\"#ffffff\",\"socialIconSize\":16,\"socialIconPadding\":10,\"loadedScale\":100,\"inView\":\"0\",\"effect\":\"pufrobo\",\"cursor\":\"zoom-in\",\"borderSize\":0,\"borderRadius\":0,\"borderColor\":\"#ffffff\",\"shadowSize\":0,\"shadowColor\":\"#ffffff\",\"lazy_load\":\"1\",\"enable_responsive\":\"0\",\"tablet_columns\":\"2\",\"mobile_columns\":\"1\",\"style\":\"\",\"last_visited_tab\":\"modula-general\",\"helpergrid\":0},\"_links\":{\"self\":[{\"href\":\"http://localhost/Vaykul/wp-json/wp/v2/modula-gallery/78\"}],\"collection\":[{\"href\":\"http://localhost/Vaykul/wp-json/wp/v2/modula-gallery\"}],\"about\":[{\"href\":\"http://localhost/Vaykul/wp-json/wp/v2/types/modula-gallery\"}],\"wp:attachment\":[{\"href\":\"http://localhost/Vaykul/wp-json/wp/v2/media?parent=78\"}],\"curies\":[{\"name\":\"wp\",\"href\":\"https://api.w.org/{rel}\",\"templated\":true}]}},\"currentSelectize\":[{\"value\":78,\"label\":\"Referanslar\"}]} /-->', 'Referanslar', '', 'inherit', 'closed', 'closed', '', '15-revision-v1', '', '', '2022-04-19 23:14:12', '2022-04-19 20:14:12', '', 15, 'http://localhost/Vaykul/?p=85', 0, 'revision', '', 0),
(86, 1, '2022-04-19 23:23:05', '2022-04-19 20:23:05', '<!-- wp:columns -->\n<div class=\"wp-block-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:contact-form-7/contact-form-selector -->\n<div class=\"wp-block-contact-form-7-contact-form-selector\">[contact-form-7 id=\"5\" title=\"İletişim Sayfası Form\"]</div>\n<!-- /wp:contact-form-7/contact-form-selector --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:code -->\n<pre class=\"wp-block-code\"><code></code></pre>\n<!-- /wp:code --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->', 'İletişim', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2022-04-19 23:23:05', '2022-04-19 20:23:05', '', 17, 'http://localhost/Vaykul/?p=86', 0, 'revision', '', 0),
(89, 1, '2022-04-20 02:23:48', '2022-04-19 23:23:48', '<!-- wp:columns -->\n<div class=\"wp-block-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:columns -->\n<div class=\"wp-block-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:html -->\n<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3019.033818502445!2d29.41148396566168!3d40.827220838495!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14cadf59dc2cd5b9%3A0x5ac8058d0112681f!2zVmF5a3VsIMSww6cgTWVrYW4gVGFzYXLEsW0!5e0!3m2!1str!2str!4v1650410568680!5m2!1str!2str\" width=\"100%\" height=\"600\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>\n<!-- /wp:html --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->', 'İletişim', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2022-04-20 02:23:48', '2022-04-19 23:23:48', '', 17, 'http://localhost/Vaykul/?p=89', 0, 'revision', '', 0),
(88, 1, '2022-04-20 02:23:28', '2022-04-19 23:23:28', '<!-- wp:columns -->\n<div class=\"wp-block-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:columns -->\n<div class=\"wp-block-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:html -->\n<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3019.033818502445!2d29.41148396566168!3d40.827220838495!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14cadf59dc2cd5b9%3A0x5ac8058d0112681f!2zVmF5a3VsIMSww6cgTWVrYW4gVGFzYXLEsW0!5e0!3m2!1str!2str!4v1650410568680!5m2!1str!2str\" width=\"100%\" height=\"100%\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>\n<!-- /wp:html --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->', 'İletişim', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2022-04-20 02:23:28', '2022-04-19 23:23:28', '', 17, 'http://localhost/Vaykul/?p=88', 0, 'revision', '', 0),
(90, 1, '2022-04-20 02:24:54', '2022-04-19 23:24:54', '<!-- wp:columns -->\n<div class=\"wp-block-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:columns -->\n<div class=\"wp-block-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:html -->\n<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3019.033818502445!2d29.41148396566168!3d40.827220838495!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14cadf59dc2cd5b9%3A0x5ac8058d0112681f!2zVmF5a3VsIMSww6cgTWVrYW4gVGFzYXLEsW0!5e0!3m2!1str!2str!4v1650410568680!5m2!1str!2str\" width=\"100%\" height=\"600\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>\n<!-- /wp:html --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:contact-form-7/contact-form-selector -->\n<div class=\"wp-block-contact-form-7-contact-form-selector\">[contact-form-7 id=\"5\" title=\"İletişim Sayfası Form\"]</div>\n<!-- /wp:contact-form-7/contact-form-selector --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->', 'İletişim', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2022-04-20 02:24:54', '2022-04-19 23:24:54', '', 17, 'http://localhost/Vaykul/?p=90', 0, 'revision', '', 0),
(91, 1, '2022-04-20 02:34:17', '2022-04-19 23:34:17', '<!-- wp:columns -->\n<div class=\"wp-block-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:columns -->\n<div class=\"wp-block-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:html -->\n<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3019.033818502445!2d29.41148396566168!3d40.827220838495!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14cadf59dc2cd5b9%3A0x5ac8058d0112681f!2zVmF5a3VsIMSww6cgTWVrYW4gVGFzYXLEsW0!5e0!3m2!1str!2str!4v1650410568680!5m2!1str!2str\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\" width=\"100%\" height=\"600\"></iframe>\n<!-- /wp:html --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:contact-form-7/contact-form-selector {\"className\":\"iletisim-form\"} -->\n<div class=\"wp-block-contact-form-7-contact-form-selector iletisim-form\">[contact-form-7 id=\"5\" title=\"İletişim Sayfası Form\"]</div>\n<!-- /wp:contact-form-7/contact-form-selector --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->', 'İletişim', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2022-04-20 02:34:17', '2022-04-19 23:34:17', '', 17, 'http://localhost/Vaykul/?p=91', 0, 'revision', '', 0),
(92, 1, '2022-04-20 13:54:57', '2022-04-20 10:54:57', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Corporis non, repudiandae quibusdam, aliquid voluptatum totam dignissimos cupiditate nostrum voluptatem laudantium consequuntur molestiae illo, nisi veritatis excepturi. Tempore labore aperiam quos aliquid asperiores porro deleniti perferendis eos sequi cupiditate. Corporis laborum atque magnam doloremque enim! Odio possimus tempora alias distinctio dicta sequi quod quia libero minus sit! Aperiam, repellendus iure esse aliquid praesentium impedit porro officiis ratione vitae. Optio, quasi reiciendis excepturi distinctio totam mollitia ullam a ducimus beatae sit laboriosam aspernatur veniam sunt fugit dolorem necessitatibus! Id amet et repellendus expedita est, accusamus vel, obcaecati neque magni quod minima veniam?</p>\n<!-- /wp:paragraph -->', 'Test Blog Yazısı', '', 'publish', 'open', 'open', '', 'test-blog-yazisi', '', '', '2022-04-20 14:33:56', '2022-04-20 11:33:56', '', 0, 'http://localhost/Vaykul/?p=92', 0, 'post', '', 0),
(93, 1, '2022-04-20 13:54:57', '2022-04-20 10:54:57', '', 'Test Blog Yazısı', '', 'inherit', 'closed', 'closed', '', '92-revision-v1', '', '', '2022-04-20 13:54:57', '2022-04-20 10:54:57', '', 92, 'http://localhost/Vaykul/?p=93', 0, 'revision', '', 0),
(94, 1, '2022-04-20 14:01:35', '2022-04-20 11:01:35', '', 'Blog', '', 'inherit', 'closed', 'closed', '', '66-revision-v1', '', '', '2022-04-20 14:01:35', '2022-04-20 11:01:35', '', 66, 'http://localhost/Vaykul/?p=94', 0, 'revision', '', 0),
(97, 1, '2022-04-20 14:12:56', '2022-04-20 11:12:56', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Corporis non, repudiandae quibusdam, aliquid voluptatum totam dignissimos cupiditate nostrum voluptatem laudantium consequuntur molestiae illo, nisi veritatis excepturi. Tempore labore aperiam quos aliquid asperiores porro deleniti perferendis eos sequi cupiditate. Corporis laborum atque magnam doloremque enim! Odio possimus tempora alias distinctio dicta sequi quod quia libero minus sit! Aperiam, repellendus iure esse aliquid praesentium impedit porro officiis ratione vitae. Optio, quasi reiciendis excepturi distinctio totam mollitia ullam a ducimus beatae sit laboriosam aspernatur veniam sunt fugit dolorem necessitatibus! Id amet et repellendus expedita est, accusamus vel, obcaecati neque magni quod minima veniam?</p>\n<!-- /wp:paragraph -->', 'Test Blog Yazısı', '', 'inherit', 'closed', 'closed', '', '92-revision-v1', '', '', '2022-04-20 14:12:56', '2022-04-20 11:12:56', '', 92, 'http://localhost/Vaykul/?p=97', 0, 'revision', '', 0),
(101, 1, '2022-04-20 15:02:28', '2022-04-20 12:02:28', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aperiam explicabo eum, ea commodi earum assumenda eveniet tempora, dicta reiciendis eaque minus eos animi qui consequuntur et dolor libero, sint quia inventore rem veritatis nemo porro? Repellat adipisci commodi nesciunt perferendis accusamus alias qui voluptates modi quas dolorum velit obcaecati aspernatur, voluptatem voluptas aperiam a at, iure voluptatum. Qui, illo eos! Facilis animi, minima odit nulla tempore at veniam praesentium perspiciatis velit itaque? Totam, accusantium omnis. Consequuntur rerum aperiam similique molestias illo recusandae consequatur sapiente tempore a blanditiis, doloremque ratione iure minima nulla officia? Id est tempora voluptas a voluptate dolorem quidem architecto nisi natus beatae vitae ipsa provident accusantium reprehenderit, fuga recusandae odit numquam aspernatur. Veritatis ea similique a incidunt dicta temporibus eaque accusamus, sequi voluptatem, repudiandae et delectus totam unde facere? Ipsam labore et aut, ducimus ut praesentium consequuntur porro illo, quisquam eveniet nostrum id beatae nemo sequi numquam. Vitae rerum numquam excepturi consectetur magni dignissimos. Iste asperiores provident totam, nesciunt repellat mollitia! Exercitationem itaque architecto repellat. Deserunt est consectetur vitae sunt earum, minima veritatis eum atque dolorem pariatur aliquam saepe aliquid in officiis enim aut doloribus quo nostrum architecto, aspernatur dolor officia ex facere. Harum, delectus quos. Illum?</p>\n<!-- /wp:paragraph -->', 'Test Blog Yazısı 2', '', 'publish', 'open', 'open', '', 'test-blog-yazisi-2', '', '', '2022-04-20 15:02:29', '2022-04-20 12:02:29', '', 0, 'http://localhost/Vaykul/?p=101', 0, 'post', '', 0),
(102, 1, '2022-04-20 15:02:28', '2022-04-20 12:02:28', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aperiam explicabo eum, ea commodi earum assumenda eveniet tempora, dicta reiciendis eaque minus eos animi qui consequuntur et dolor libero, sint quia inventore rem veritatis nemo porro? Repellat adipisci commodi nesciunt perferendis accusamus alias qui voluptates modi quas dolorum velit obcaecati aspernatur, voluptatem voluptas aperiam a at, iure voluptatum. Qui, illo eos! Facilis animi, minima odit nulla tempore at veniam praesentium perspiciatis velit itaque? Totam, accusantium omnis. Consequuntur rerum aperiam similique molestias illo recusandae consequatur sapiente tempore a blanditiis, doloremque ratione iure minima nulla officia? Id est tempora voluptas a voluptate dolorem quidem architecto nisi natus beatae vitae ipsa provident accusantium reprehenderit, fuga recusandae odit numquam aspernatur. Veritatis ea similique a incidunt dicta temporibus eaque accusamus, sequi voluptatem, repudiandae et delectus totam unde facere? Ipsam labore et aut, ducimus ut praesentium consequuntur porro illo, quisquam eveniet nostrum id beatae nemo sequi numquam. Vitae rerum numquam excepturi consectetur magni dignissimos. Iste asperiores provident totam, nesciunt repellat mollitia! Exercitationem itaque architecto repellat. Deserunt est consectetur vitae sunt earum, minima veritatis eum atque dolorem pariatur aliquam saepe aliquid in officiis enim aut doloribus quo nostrum architecto, aspernatur dolor officia ex facere. Harum, delectus quos. Illum?</p>\n<!-- /wp:paragraph -->', 'Test Blog Yazısı 2', '', 'inherit', 'closed', 'closed', '', '101-revision-v1', '', '', '2022-04-20 15:02:28', '2022-04-20 12:02:28', '', 101, 'http://localhost/Vaykul/?p=102', 0, 'revision', '', 0),
(103, 1, '2022-04-20 15:03:22', '2022-04-20 12:03:22', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aperiam explicabo eum, ea commodi earum assumenda eveniet tempora, dicta reiciendis eaque minus eos animi qui consequuntur et dolor libero, sint quia inventore rem veritatis nemo porro? Repellat adipisci commodi nesciunt perferendis accusamus alias qui voluptates modi quas dolorum velit obcaecati aspernatur, voluptatem voluptas aperiam a at, iure voluptatum. Qui, illo eos! Facilis animi, minima odit nulla tempore at veniam praesentium perspiciatis velit itaque? Totam, accusantium omnis. Consequuntur rerum aperiam similique molestias illo recusandae consequatur sapiente tempore a blanditiis, doloremque ratione iure minima nulla officia? Id est tempora voluptas a voluptate dolorem quidem architecto nisi natus beatae vitae ipsa provident accusantium reprehenderit, fuga recusandae odit numquam aspernatur. Veritatis ea similique a incidunt dicta temporibus eaque accusamus, sequi voluptatem, repudiandae et delectus totam unde facere? Ipsam labore et aut, ducimus ut praesentium consequuntur porro illo, quisquam eveniet nostrum id beatae nemo sequi numquam. Vitae rerum numquam excepturi consectetur magni dignissimos. Iste asperiores provident totam, nesciunt repellat mollitia! Exercitationem itaque architecto repellat. Deserunt est consectetur vitae sunt earum, minima veritatis eum atque dolorem pariatur aliquam saepe aliquid in officiis enim aut doloribus quo nostrum architecto, aspernatur dolor officia ex facere. Harum, delectus quos. Illum?</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Test Blog Yazısı 3', '', 'publish', 'open', 'open', '', 'test-blog-yazisi-3', '', '', '2022-04-20 15:03:23', '2022-04-20 12:03:23', '', 0, 'http://localhost/Vaykul/?p=103', 0, 'post', '', 0),
(104, 1, '2022-04-20 15:03:22', '2022-04-20 12:03:22', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aperiam explicabo eum, ea commodi earum assumenda eveniet tempora, dicta reiciendis eaque minus eos animi qui consequuntur et dolor libero, sint quia inventore rem veritatis nemo porro? Repellat adipisci commodi nesciunt perferendis accusamus alias qui voluptates modi quas dolorum velit obcaecati aspernatur, voluptatem voluptas aperiam a at, iure voluptatum. Qui, illo eos! Facilis animi, minima odit nulla tempore at veniam praesentium perspiciatis velit itaque? Totam, accusantium omnis. Consequuntur rerum aperiam similique molestias illo recusandae consequatur sapiente tempore a blanditiis, doloremque ratione iure minima nulla officia? Id est tempora voluptas a voluptate dolorem quidem architecto nisi natus beatae vitae ipsa provident accusantium reprehenderit, fuga recusandae odit numquam aspernatur. Veritatis ea similique a incidunt dicta temporibus eaque accusamus, sequi voluptatem, repudiandae et delectus totam unde facere? Ipsam labore et aut, ducimus ut praesentium consequuntur porro illo, quisquam eveniet nostrum id beatae nemo sequi numquam. Vitae rerum numquam excepturi consectetur magni dignissimos. Iste asperiores provident totam, nesciunt repellat mollitia! Exercitationem itaque architecto repellat. Deserunt est consectetur vitae sunt earum, minima veritatis eum atque dolorem pariatur aliquam saepe aliquid in officiis enim aut doloribus quo nostrum architecto, aspernatur dolor officia ex facere. Harum, delectus quos. Illum?</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Test Blog Yazısı 3', '', 'inherit', 'closed', 'closed', '', '103-revision-v1', '', '', '2022-04-20 15:03:22', '2022-04-20 12:03:22', '', 103, 'http://localhost/Vaykul/?p=104', 0, 'revision', '', 0),
(105, 1, '2022-04-20 15:03:42', '2022-04-20 12:03:42', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aperiam explicabo eum, ea commodi earum assumenda eveniet tempora, dicta reiciendis eaque minus eos animi qui consequuntur et dolor libero, sint quia inventore rem veritatis nemo porro? Repellat adipisci commodi nesciunt perferendis accusamus alias qui voluptates modi quas dolorum velit obcaecati aspernatur, voluptatem voluptas aperiam a at, iure voluptatum. Qui, illo eos! Facilis animi, minima odit nulla tempore at veniam praesentium perspiciatis velit itaque? Totam, accusantium omnis. Consequuntur rerum aperiam similique molestias illo recusandae consequatur sapiente tempore a blanditiis, doloremque ratione iure minima nulla officia? Id est tempora voluptas a voluptate dolorem quidem architecto nisi natus beatae vitae ipsa provident accusantium reprehenderit, fuga recusandae odit numquam aspernatur. Veritatis ea similique a incidunt dicta temporibus eaque accusamus, sequi voluptatem, repudiandae et delectus totam unde facere? Ipsam labore et aut, ducimus ut praesentium consequuntur porro illo, quisquam eveniet nostrum id beatae nemo sequi numquam. Vitae rerum numquam excepturi consectetur magni dignissimos. Iste asperiores provident totam, nesciunt repellat mollitia! Exercitationem itaque architecto repellat. Deserunt est consectetur vitae sunt earum, minima veritatis eum atque dolorem pariatur aliquam saepe aliquid in officiis enim aut doloribus quo nostrum architecto, aspernatur dolor officia ex facere. Harum, delectus quos. Illum?</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Test Blog Yazısı 4', '', 'publish', 'open', 'open', '', 'test-blog-yazisi-4', '', '', '2022-04-20 15:03:43', '2022-04-20 12:03:43', '', 0, 'http://localhost/Vaykul/?p=105', 0, 'post', '', 0),
(106, 1, '2022-04-20 15:03:42', '2022-04-20 12:03:42', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aperiam explicabo eum, ea commodi earum assumenda eveniet tempora, dicta reiciendis eaque minus eos animi qui consequuntur et dolor libero, sint quia inventore rem veritatis nemo porro? Repellat adipisci commodi nesciunt perferendis accusamus alias qui voluptates modi quas dolorum velit obcaecati aspernatur, voluptatem voluptas aperiam a at, iure voluptatum. Qui, illo eos! Facilis animi, minima odit nulla tempore at veniam praesentium perspiciatis velit itaque? Totam, accusantium omnis. Consequuntur rerum aperiam similique molestias illo recusandae consequatur sapiente tempore a blanditiis, doloremque ratione iure minima nulla officia? Id est tempora voluptas a voluptate dolorem quidem architecto nisi natus beatae vitae ipsa provident accusantium reprehenderit, fuga recusandae odit numquam aspernatur. Veritatis ea similique a incidunt dicta temporibus eaque accusamus, sequi voluptatem, repudiandae et delectus totam unde facere? Ipsam labore et aut, ducimus ut praesentium consequuntur porro illo, quisquam eveniet nostrum id beatae nemo sequi numquam. Vitae rerum numquam excepturi consectetur magni dignissimos. Iste asperiores provident totam, nesciunt repellat mollitia! Exercitationem itaque architecto repellat. Deserunt est consectetur vitae sunt earum, minima veritatis eum atque dolorem pariatur aliquam saepe aliquid in officiis enim aut doloribus quo nostrum architecto, aspernatur dolor officia ex facere. Harum, delectus quos. Illum?</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Test Blog Yazısı 4', '', 'inherit', 'closed', 'closed', '', '105-revision-v1', '', '', '2022-04-20 15:03:42', '2022-04-20 12:03:42', '', 105, 'http://localhost/Vaykul/?p=106', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vyk_termmeta`
--

DROP TABLE IF EXISTS `vyk_termmeta`;
CREATE TABLE IF NOT EXISTS `vyk_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vyk_terms`
--

DROP TABLE IF EXISTS `vyk_terms`;
CREATE TABLE IF NOT EXISTS `vyk_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Tablo döküm verisi `vyk_terms`
--

INSERT INTO `vyk_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Blog', 'blog-yazilari', 0),
(2, 'Türkçe', 'tr', 0),
(3, 'Türkçe', 'pll_tr', 0),
(5, 'Menu-tr', 'menu-tr', 0),
(6, 'vaykul', 'vaykul', 0),
(7, 'Projeler', 'projeler', 0),
(8, 'pll_625d34dc77948', 'pll_625d34dc77948', 0),
(9, 'Villalar', 'villalar', 0),
(10, 'pll_625d4dfc700da', 'pll_625d4dfc700da', 0),
(11, 'deneme2', 'deneme2', 0),
(12, 'pll_625d6639527db', 'pll_625d6639527db', 0),
(13, 'deneme3', 'deneme3', 0),
(14, 'pll_625d663daecc6', 'pll_625d663daecc6', 0),
(18, 'pll_625ff5388ad7a', 'pll_625ff5388ad7a', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vyk_term_relationships`
--

DROP TABLE IF EXISTS `vyk_term_relationships`;
CREATE TABLE IF NOT EXISTS `vyk_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Tablo döküm verisi `vyk_term_relationships`
--

INSERT INTO `vyk_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 2, 0),
(1, 3, 0),
(1, 4, 0),
(9, 2, 0),
(10, 6, 0),
(13, 2, 0),
(15, 2, 0),
(17, 2, 0),
(7, 3, 0),
(7, 8, 0),
(19, 5, 0),
(20, 5, 0),
(24, 5, 0),
(21, 5, 0),
(96, 5, 0),
(22, 5, 0),
(9, 3, 0),
(9, 10, 0),
(11, 3, 0),
(11, 12, 0),
(13, 3, 0),
(13, 14, 0),
(75, 2, 0),
(66, 2, 0),
(1, 13, 0),
(75, 11, 0),
(92, 2, 0),
(92, 1, 0),
(103, 2, 0),
(103, 1, 0),
(105, 2, 0),
(101, 2, 0),
(101, 1, 0),
(92, 22, 0),
(105, 1, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vyk_term_taxonomy`
--

DROP TABLE IF EXISTS `vyk_term_taxonomy`;
CREATE TABLE IF NOT EXISTS `vyk_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Tablo döküm verisi `vyk_term_taxonomy`
--

INSERT INTO `vyk_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 4),
(2, 2, 'language', 'a:3:{s:6:\"locale\";s:5:\"tr_TR\";s:3:\"rtl\";i:0;s:9:\"flag_code\";s:2:\"tr\";}', 0, 11),
(3, 3, 'term_language', '', 0, 5),
(5, 5, 'nav_menu', '', 0, 6),
(6, 6, 'wp_theme', '', 0, 1),
(7, 7, 'category', '', 0, 0),
(8, 8, 'term_translations', 'a:1:{s:2:\"tr\";i:7;}', 0, 1),
(9, 9, 'category', '', 7, 0),
(10, 10, 'term_translations', 'a:1:{s:2:\"tr\";i:9;}', 0, 1),
(11, 11, 'category', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Pariatur cupiditate suscipit fuga inventore\r\n              voluptatibus velit, quisquam cumque incidunt laboriosam nam autem maxime enim sequi odit qui doloribus\r\n              similique, quidem necessitatibus!', 7, 1),
(12, 12, 'term_translations', 'a:1:{s:2:\"tr\";i:11;}', 0, 1),
(13, 13, 'category', '', 7, 1),
(14, 14, 'term_translations', 'a:1:{s:2:\"tr\";i:13;}', 0, 1),
(18, 18, 'term_translations', 'a:1:{s:2:\"tr\";i:17;}', 0, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vyk_usermeta`
--

DROP TABLE IF EXISTS `vyk_usermeta`;
CREATE TABLE IF NOT EXISTS `vyk_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Tablo döküm verisi `vyk_usermeta`
--

INSERT INTO `vyk_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'vaykul'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'vyk_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'vyk_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'theme_editor_notice'),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:1:{s:64:\"76e60137b4f6d86d0c75de5e3a2c11e925ef18bf45581b418ad981ce4f5cb69b\";a:4:{s:10:\"expiration\";i:1654178666;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:80:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0\";s:5:\"login\";i:1654005866;}}'),
(17, 1, 'vyk_dashboard_quick_press_last_post_id', '108'),
(18, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}'),
(19, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(20, 1, 'metaboxhidden_nav-menus', 'a:3:{i:0;s:19:\"pll_lang_switch_box\";i:1;s:25:\"add-post-type-html5-blank\";i:2;s:12:\"add-post_tag\";}'),
(21, 1, 'nav_menu_recently_edited', '5'),
(22, 1, 'vyk_user-settings', 'libraryContent=browse'),
(23, 1, 'vyk_user-settings-time', '1650278211'),
(24, 1, 'vyk_yoast_notifications', 'a:3:{i:0;a:2:{s:7:\"message\";s:403:\"<p>WordPress için otomatik güncellemeleri etkinleştirdiğinizi görüyoruz. Bunu Yoast SEO için de yapmanızı öneririz. Bu şekilde, WordPress ve Yoast SEO, birlikte sorunsuz bir şekilde çalışmaya devam edeceğini garanti edebiliriz. <a href=\"http://localhost/Vaykul/wp-admin/plugins.php\">Yoast SEO için otomatik güncellemeleri etkinleştirmek üzere eklentiletiler sayfanıza gidin.</a></p>\";s:7:\"options\";a:10:{s:4:\"type\";s:7:\"warning\";s:2:\"id\";s:17:\"wpseo-auto-update\";s:4:\"user\";O:7:\"WP_User\":8:{s:4:\"data\";O:8:\"stdClass\":10:{s:2:\"ID\";s:1:\"1\";s:10:\"user_login\";s:6:\"vaykul\";s:9:\"user_pass\";s:34:\"$P$BXvfHoE46umC3U0lKNU5zFIkdRLWgn.\";s:13:\"user_nicename\";s:6:\"vaykul\";s:10:\"user_email\";s:15:\"info@vaykul.com\";s:8:\"user_url\";s:23:\"http://localhost/Vaykul\";s:15:\"user_registered\";s:19:\"2022-04-18 09:15:31\";s:19:\"user_activation_key\";s:0:\"\";s:11:\"user_status\";s:1:\"0\";s:12:\"display_name\";s:6:\"vaykul\";}s:2:\"ID\";i:1;s:4:\"caps\";a:1:{s:13:\"administrator\";b:1;}s:7:\"cap_key\";s:16:\"vyk_capabilities\";s:5:\"roles\";a:1:{i:0;s:13:\"administrator\";}s:7:\"allcaps\";a:63:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:20:\"wpseo_manage_options\";b:1;s:13:\"administrator\";b:1;}s:6:\"filter\";N;s:16:\"\0WP_User\0site_id\";i:1;}s:5:\"nonce\";N;s:8:\"priority\";d:0.8;s:9:\"data_json\";a:0:{}s:13:\"dismissal_key\";N;s:12:\"capabilities\";s:20:\"wpseo_manage_options\";s:16:\"capability_check\";s:3:\"all\";s:14:\"yoast_branding\";b:0;}}i:1;a:2:{s:7:\"message\";s:629:\"<p>As you can see, there is a translation of this plugin in Turkish. This translation is currently 85% complete. We need your help to make it complete and to fix any errors. Please register at <a href=\"https://translate.wordpress.org/projects/wp-plugins/wordpress-seo/\">Translating WordPress</a> to help complete the translation to Turkish!</p><p><a href=\"https://translate.wordpress.org/projects/wp-plugins/wordpress-seo/\">Register now &raquo;</a></p><a class=\"button\" href=\"/Vaykul/wp-admin/admin.php?page=wpseo_titles&#038;settings-updated=true&#038;remove_i18n_promo=1\">Please don&#039;t show me this notification anymore</a>\";s:7:\"options\";a:10:{s:4:\"type\";s:7:\"warning\";s:2:\"id\";s:31:\"i18nModuleTranslationAssistance\";s:4:\"user\";O:7:\"WP_User\":8:{s:4:\"data\";O:8:\"stdClass\":10:{s:2:\"ID\";s:1:\"1\";s:10:\"user_login\";s:6:\"vaykul\";s:9:\"user_pass\";s:34:\"$P$BXvfHoE46umC3U0lKNU5zFIkdRLWgn.\";s:13:\"user_nicename\";s:6:\"vaykul\";s:10:\"user_email\";s:15:\"info@vaykul.com\";s:8:\"user_url\";s:23:\"http://localhost/Vaykul\";s:15:\"user_registered\";s:19:\"2022-04-18 09:15:31\";s:19:\"user_activation_key\";s:0:\"\";s:11:\"user_status\";s:1:\"0\";s:12:\"display_name\";s:6:\"vaykul\";}s:2:\"ID\";i:1;s:4:\"caps\";a:1:{s:13:\"administrator\";b:1;}s:7:\"cap_key\";s:16:\"vyk_capabilities\";s:5:\"roles\";a:1:{i:0;s:13:\"administrator\";}s:7:\"allcaps\";a:63:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:20:\"wpseo_manage_options\";b:1;s:13:\"administrator\";b:1;}s:6:\"filter\";N;s:16:\"\0WP_User\0site_id\";i:1;}s:5:\"nonce\";N;s:8:\"priority\";d:0.5;s:9:\"data_json\";a:0:{}s:13:\"dismissal_key\";N;s:12:\"capabilities\";a:1:{i:0;s:20:\"wpseo_manage_options\";}s:16:\"capability_check\";s:3:\"all\";s:14:\"yoast_branding\";b:0;}}i:2;a:2:{s:7:\"message\";s:322:\"<p>Kategori temeli ayarınızdaki bir değişiklik nedeniyle, bazı SEO verilerinizin yeniden işlenmesi gerekir.</p><p>Bunun bir dakikadan az süreceğini tahmin ediyoruz.</p><a class=\"button\" href=\"http://localhost/Vaykul/wp-admin/admin.php?page=wpseo_tools&start-indexation=true\">SEO veri optimizasyonunu başlatın</a>\";s:7:\"options\";a:10:{s:4:\"type\";s:7:\"warning\";s:2:\"id\";s:13:\"wpseo-reindex\";s:4:\"user\";r:103;s:5:\"nonce\";N;s:8:\"priority\";d:0.8;s:9:\"data_json\";a:0:{}s:13:\"dismissal_key\";N;s:12:\"capabilities\";s:20:\"wpseo_manage_options\";s:16:\"capability_check\";s:3:\"all\";s:14:\"yoast_branding\";b:0;}}}');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vyk_users`
--

DROP TABLE IF EXISTS `vyk_users`;
CREATE TABLE IF NOT EXISTS `vyk_users` (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Tablo döküm verisi `vyk_users`
--

INSERT INTO `vyk_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'vaykul', '$P$BXvfHoE46umC3U0lKNU5zFIkdRLWgn.', 'vaykul', 'info@vaykul.com', 'http://localhost/Vaykul', '2022-04-18 09:15:31', '', 0, 'vaykul');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vyk_yoast_indexable`
--

DROP TABLE IF EXISTS `vyk_yoast_indexable`;
CREATE TABLE IF NOT EXISTS `vyk_yoast_indexable` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `permalink` longtext COLLATE utf8mb4_unicode_520_ci,
  `permalink_hash` varchar(40) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `object_id` bigint(20) DEFAULT NULL,
  `object_type` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `object_sub_type` varchar(32) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `post_parent` bigint(20) DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_520_ci,
  `description` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `breadcrumb_title` text COLLATE utf8mb4_unicode_520_ci,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `is_protected` tinyint(1) DEFAULT '0',
  `has_public_posts` tinyint(1) DEFAULT NULL,
  `number_of_pages` int(11) UNSIGNED DEFAULT NULL,
  `canonical` longtext COLLATE utf8mb4_unicode_520_ci,
  `primary_focus_keyword` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `primary_focus_keyword_score` int(3) DEFAULT NULL,
  `readability_score` int(3) DEFAULT NULL,
  `is_cornerstone` tinyint(1) DEFAULT '0',
  `is_robots_noindex` tinyint(1) DEFAULT '0',
  `is_robots_nofollow` tinyint(1) DEFAULT '0',
  `is_robots_noarchive` tinyint(1) DEFAULT '0',
  `is_robots_noimageindex` tinyint(1) DEFAULT '0',
  `is_robots_nosnippet` tinyint(1) DEFAULT '0',
  `twitter_title` text COLLATE utf8mb4_unicode_520_ci,
  `twitter_image` longtext COLLATE utf8mb4_unicode_520_ci,
  `twitter_description` longtext COLLATE utf8mb4_unicode_520_ci,
  `twitter_image_id` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `twitter_image_source` text COLLATE utf8mb4_unicode_520_ci,
  `open_graph_title` text COLLATE utf8mb4_unicode_520_ci,
  `open_graph_description` longtext COLLATE utf8mb4_unicode_520_ci,
  `open_graph_image` longtext COLLATE utf8mb4_unicode_520_ci,
  `open_graph_image_id` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `open_graph_image_source` text COLLATE utf8mb4_unicode_520_ci,
  `open_graph_image_meta` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `link_count` int(11) DEFAULT NULL,
  `incoming_link_count` int(11) DEFAULT NULL,
  `prominent_words_version` int(11) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `blog_id` bigint(20) NOT NULL DEFAULT '1',
  `language` varchar(32) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `region` varchar(32) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `schema_page_type` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `schema_article_type` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `has_ancestors` tinyint(1) DEFAULT '0',
  `estimated_reading_time_minutes` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT '1',
  `object_last_modified` datetime DEFAULT NULL,
  `object_published_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object_type_and_sub_type` (`object_type`,`object_sub_type`),
  KEY `object_id_and_type` (`object_id`,`object_type`),
  KEY `permalink_hash_and_object_type` (`permalink_hash`,`object_type`),
  KEY `subpages` (`post_parent`,`object_type`,`post_status`,`object_id`),
  KEY `prominent_words` (`prominent_words_version`,`object_type`,`object_sub_type`,`post_status`),
  KEY `published_sitemap_index` (`object_published_at`,`is_robots_noindex`,`object_type`,`object_sub_type`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Tablo döküm verisi `vyk_yoast_indexable`
--

INSERT INTO `vyk_yoast_indexable` (`id`, `permalink`, `permalink_hash`, `object_id`, `object_type`, `object_sub_type`, `author_id`, `post_parent`, `title`, `description`, `breadcrumb_title`, `post_status`, `is_public`, `is_protected`, `has_public_posts`, `number_of_pages`, `canonical`, `primary_focus_keyword`, `primary_focus_keyword_score`, `readability_score`, `is_cornerstone`, `is_robots_noindex`, `is_robots_nofollow`, `is_robots_noarchive`, `is_robots_noimageindex`, `is_robots_nosnippet`, `twitter_title`, `twitter_image`, `twitter_description`, `twitter_image_id`, `twitter_image_source`, `open_graph_title`, `open_graph_description`, `open_graph_image`, `open_graph_image_id`, `open_graph_image_source`, `open_graph_image_meta`, `link_count`, `incoming_link_count`, `prominent_words_version`, `created_at`, `updated_at`, `blog_id`, `language`, `region`, `schema_page_type`, `schema_article_type`, `has_ancestors`, `estimated_reading_time_minutes`, `version`, `object_last_modified`, `object_published_at`) VALUES
(1, 'http://localhost/Vaykul/author/vaykul/', '38:073c417dd3f0b53f0c0a7c013002ffd6', 1, 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'https://1.gravatar.com/avatar/1600978d72b1836ceece6e43ba70f299?s=500&d=mm&r=g', NULL, NULL, 'gravatar-image', NULL, NULL, 'https://1.gravatar.com/avatar/1600978d72b1836ceece6e43ba70f299?s=500&d=mm&r=g', NULL, 'gravatar-image', NULL, NULL, NULL, NULL, '2022-04-20 10:54:27', '2022-05-31 11:04:09', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-20 12:03:43', '2022-04-18 09:15:31'),
(2, 'http://localhost/Vaykul/', '24:be1ed806d386945fdd9067d82335aff2', NULL, 'home-page', NULL, NULL, NULL, '%%sitename%% %%page%% %%sep%% %%sitedesc%%', 'Vaykul', 'Anasayfa', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, '%%sitename%%', '', '', '0', NULL, NULL, NULL, NULL, NULL, '2022-04-20 10:54:27', '2022-05-31 11:04:09', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-20 12:03:43', '2022-04-18 09:15:31'),
(3, 'http://localhost/Vaykul/', '24:be1ed806d386945fdd9067d82335aff2', 13, 'post', 'page', 1, 0, NULL, NULL, 'Anasayfa', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 60, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/banner-desk.jpg', NULL, '43', 'featured-image', NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/banner-desk.jpg', '43', 'featured-image', '{\n    \"width\": 1920,\n    \"height\": 1095,\n    \"url\": \"http://localhost/Vaykul/wp-content/uploads/2022/04/banner-desk.jpg\",\n    \"path\": \"C:\\\\wamp64\\\\www\\\\vaykul/wp-content/uploads/2022/04/banner-desk.jpg\",\n    \"size\": \"full\",\n    \"id\": 43,\n    \"alt\": \"\",\n    \"pixels\": 2102400,\n    \"type\": \"image/jpeg\"\n}', 0, NULL, NULL, '2022-04-20 10:54:27', '2022-04-20 08:00:43', 1, NULL, NULL, NULL, NULL, 0, 0, 2, '2022-04-20 11:00:42', '2022-04-18 09:46:54'),
(4, 'http://localhost/Vaykul/ornek-yazi/', '35:4c23b7722c9d3a45b77cf93debe80e22', 75, 'post', 'post', 1, 0, NULL, NULL, 'Örnek Yazı', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 60, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/world-map.jpg', NULL, '72', 'featured-image', NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/world-map.jpg', '72', 'featured-image', '{\n    \"width\": 1920,\n    \"height\": 1080,\n    \"url\": \"http://localhost/Vaykul/wp-content/uploads/2022/04/world-map.jpg\",\n    \"path\": \"C:\\\\wamp64\\\\www\\\\vaykul/wp-content/uploads/2022/04/world-map.jpg\",\n    \"size\": \"full\",\n    \"id\": 72,\n    \"alt\": \"\",\n    \"pixels\": 2073600,\n    \"type\": \"image/jpeg\"\n}', 0, NULL, NULL, '2022-04-20 10:54:36', '2022-04-20 08:26:20', 1, NULL, NULL, NULL, NULL, 0, 1, 2, '2022-04-20 11:26:20', '2022-04-19 19:26:04'),
(5, 'http://localhost/Vaykul/merhaba-dunya/', '38:cedb2ed40cc5888d6bf5228b5846bc5a', 1, 'post', 'post', 1, 0, NULL, NULL, 'Merhaba dünya!', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/banner-desk.jpg', NULL, '43', 'featured-image', NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/banner-desk.jpg', '43', 'featured-image', '{\n    \"width\": 1920,\n    \"height\": 1095,\n    \"url\": \"http://localhost/Vaykul/wp-content/uploads/2022/04/banner-desk.jpg\",\n    \"path\": \"C:\\\\wamp64\\\\www\\\\vaykul/wp-content/uploads/2022/04/banner-desk.jpg\",\n    \"size\": \"full\",\n    \"id\": 43,\n    \"alt\": \"\",\n    \"pixels\": 2102400,\n    \"type\": \"image/jpeg\"\n}', 4, NULL, NULL, '2022-04-20 10:54:36', '2022-04-20 08:38:25', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-19 19:22:20', '2022-04-18 09:15:31'),
(6, 'http://localhost/Vaykul/blog-yazilari/', '38:3e78a611d6cc55e25dc6fcc40b764ac8', 1, 'term', 'category', NULL, NULL, NULL, NULL, 'Blog', NULL, NULL, 0, NULL, NULL, NULL, 'Blog', 36, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-04-20 10:54:39', '2022-04-20 09:03:43', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-20 14:04:53', '2022-04-20 10:54:57'),
(7, NULL, NULL, NULL, 'system-page', '404', NULL, NULL, 'Sayfa bulunamadı %%sep%% %%sitename%%', NULL, 'Hata 404: Sayfa bulunamadı', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-20 10:54:39', '2022-04-20 07:54:39', 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL),
(8, 'http://localhost/Vaykul/test-blog-yazisi/', '41:180bf364e6829850326683fe0bd363d3', 92, 'post', 'post', 1, 0, NULL, NULL, 'Test Blog Yazısı', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 90, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-04-20 10:54:57', '2022-04-20 08:33:56', 1, NULL, NULL, NULL, NULL, 0, 1, 2, '2022-04-20 11:33:56', '2022-04-20 10:54:57'),
(9, 'http://localhost/Vaykul/blog/', '29:dd4a1d2237137d7f8dc1622564fd4be8', 66, 'post', 'page', 1, 0, NULL, NULL, 'Blog', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-04-20 10:58:16', '2022-04-20 08:01:35', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-20 11:01:35', '2022-04-19 16:51:34'),
(10, 'http://localhost/Vaykul/hakkimizda/', '35:222323b1213ed345d563d8f4a5892d26', 9, 'post', 'page', 1, 0, NULL, NULL, 'Hakkımızda', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/hakkimizda.jpeg', NULL, NULL, 'first-content-image', NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/hakkimizda.jpeg', NULL, 'first-content-image', NULL, 0, NULL, NULL, '2022-04-20 10:58:16', '2022-04-20 08:38:25', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-19 16:37:10', '2022-04-18 09:45:19'),
(11, 'http://localhost/Vaykul/iletisim/', '33:d7181538af5412bb766f4902d343c198', 17, 'post', 'page', 1, 0, NULL, NULL, 'İletişim', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-04-20 10:58:16', '2022-04-20 08:38:25', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-19 23:34:17', '2022-04-18 09:51:35'),
(12, 'http://localhost/Vaykul/referanslar/', '36:04e71fd728e866f0d91a45db2fd9310c', 15, 'post', 'page', 1, 0, NULL, NULL, 'Referanslar', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2022-04-20 10:58:16', '2022-04-20 08:38:25', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-19 20:14:14', '2022-04-18 09:51:23'),
(13, 'http://localhost/Vaykul/wp-content/uploads/2022/04/banner-desk.jpg', '66:afeea65ec55b79b547242abfee28e2ef', 43, 'post', 'attachment', 1, 13, NULL, NULL, 'banner-desk', 'inherit', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/banner-desk.jpg', NULL, '43', 'attachment-image', NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/banner-desk.jpg', '43', 'attachment-image', '{\n    \"width\": 1920,\n    \"height\": 1095,\n    \"url\": \"http://localhost/Vaykul/wp-content/uploads/2022/04/banner-desk.jpg\",\n    \"path\": \"C:\\\\wamp64\\\\www\\\\vaykul/wp-content/uploads/2022/04/banner-desk.jpg\",\n    \"size\": \"full\",\n    \"id\": 43,\n    \"alt\": \"\",\n    \"pixels\": 2102400,\n    \"type\": \"image/jpeg\"\n}', NULL, 2, NULL, '2022-04-20 11:00:39', '2022-04-20 11:38:25', 1, NULL, NULL, NULL, NULL, 1, NULL, 2, '2022-04-19 15:32:24', '2022-04-19 15:32:24'),
(21, 'http://localhost/Vaykul/?modula-gallery=referanslar', '51:3ba01ddea401b25f0d9e3d712915c23a', 78, 'post', 'modula-gallery', 1, 0, NULL, NULL, 'Referanslar', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-20 11:23:16', '2022-04-20 08:23:16', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-19 20:20:43', '2022-04-19 20:13:48'),
(15, 'http://localhost/Vaykul/19/', '27:6507f680ffe53743e8a5fc226a6e62c0', 19, 'post', 'nav_menu_item', 1, 0, NULL, NULL, '', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-04-20 11:03:00', '2022-04-20 08:03:43', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-20 11:03:43', '2022-04-18 09:53:50'),
(16, 'http://localhost/Vaykul/20/', '27:4470532e9bd698a3eb3433572faf236d', 20, 'post', 'nav_menu_item', 1, 0, NULL, NULL, '', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-04-20 11:03:00', '2022-04-20 08:03:43', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-20 11:03:43', '2022-04-18 09:53:50'),
(17, 'http://localhost/Vaykul/24/', '27:08b865f6b9698683e46afda745bbb02a', 24, 'post', 'nav_menu_item', 1, 0, NULL, NULL, '', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-04-20 11:03:00', '2022-04-20 08:03:43', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-20 11:03:43', '2022-04-18 09:53:50'),
(18, 'http://localhost/Vaykul/21/', '27:abc3c1639a9832168a5b12c1c8bd1a8a', 21, 'post', 'nav_menu_item', 1, 0, NULL, NULL, '', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-04-20 11:03:00', '2022-04-20 08:03:43', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-20 11:03:43', '2022-04-18 09:53:50'),
(19, 'http://localhost/Vaykul/22/', '27:da2b74ffeb550a8912a81c198ff1ff0c', 22, 'post', 'nav_menu_item', 1, 0, NULL, NULL, '', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-04-20 11:03:00', '2022-04-20 08:03:43', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-20 11:03:43', '2022-04-18 09:53:50'),
(20, 'http://localhost/Vaykul/96/', '27:919e2adc7da20a7502e16c48e3dd4971', 96, 'post', 'nav_menu_item', 1, 0, NULL, NULL, '', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-04-20 11:03:37', '2022-04-20 08:03:43', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-20 11:03:43', '2022-04-20 11:03:43'),
(22, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans3-scaled.jpg', '71:acc01645f94c84d219447cfbbbd49bc5', 81, 'post', 'attachment', 1, 78, NULL, NULL, 'referans3', 'inherit', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans3-scaled.jpg', NULL, '81', 'attachment-image', NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans3-scaled.jpg', '81', 'attachment-image', '{\n    \"width\": 1818,\n    \"height\": 2560,\n    \"url\": \"http://localhost/Vaykul/wp-content/uploads/2022/04/referans3-scaled.jpg\",\n    \"path\": \"C:\\\\wamp64\\\\www\\\\vaykul/wp-content/uploads/2022/04/referans3-scaled.jpg\",\n    \"size\": \"full\",\n    \"id\": 81,\n    \"alt\": \"\",\n    \"pixels\": 4654080,\n    \"type\": \"image/jpeg\"\n}', NULL, 1, NULL, '2022-04-20 11:23:16', '2022-04-20 11:38:25', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-19 20:11:47', '2022-04-19 20:11:47'),
(23, 'http://localhost/Vaykul/?modula-gallery=referanslar', '51:3ba01ddea401b25f0d9e3d712915c23a', 78, 'post', 'modula-gallery', 1, 0, NULL, NULL, 'Referanslar', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-20 11:23:16', '2022-04-20 08:23:16', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-19 20:20:43', '2022-04-19 20:13:48'),
(24, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans3-scaled.jpg', '71:acc01645f94c84d219447cfbbbd49bc5', 81, 'post', 'attachment', 1, 78, NULL, NULL, 'referans3', 'inherit', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans3-scaled.jpg', NULL, '81', 'attachment-image', NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans3-scaled.jpg', '81', 'attachment-image', '{\n    \"width\": 1818,\n    \"height\": 2560,\n    \"url\": \"http://localhost/Vaykul/wp-content/uploads/2022/04/referans3-scaled.jpg\",\n    \"path\": \"C:\\\\wamp64\\\\www\\\\vaykul/wp-content/uploads/2022/04/referans3-scaled.jpg\",\n    \"size\": \"full\",\n    \"id\": 81,\n    \"alt\": \"\",\n    \"pixels\": 4654080,\n    \"type\": \"image/jpeg\"\n}', NULL, NULL, NULL, '2022-04-20 11:23:16', '2022-04-20 08:23:16', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-19 20:11:47', '2022-04-19 20:11:47'),
(28, 'http://localhost/Vaykul/wp-content/uploads/2022/04/banner-mob.jpg', '65:d7e24476ab99f315be1269929ef474a8', 52, 'post', 'attachment', 1, 13, NULL, NULL, 'banner-mob', 'inherit', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/banner-mob.jpg', NULL, '52', 'attachment-image', NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/banner-mob.jpg', '52', 'attachment-image', '{\n    \"width\": 573,\n    \"height\": 1088,\n    \"url\": \"http://localhost/Vaykul/wp-content/uploads/2022/04/banner-mob.jpg\",\n    \"path\": \"C:\\\\wamp64\\\\www\\\\vaykul/wp-content/uploads/2022/04/banner-mob.jpg\",\n    \"size\": \"full\",\n    \"id\": 52,\n    \"alt\": \"\",\n    \"pixels\": 623424,\n    \"type\": \"image/jpeg\"\n}', NULL, NULL, NULL, '2022-04-20 11:38:25', '2022-04-20 08:38:25', 1, NULL, NULL, NULL, NULL, 1, NULL, 2, '2022-04-19 16:04:05', '2022-04-19 16:04:05'),
(25, 'http://localhost/Vaykul/?modula-gallery=68', '42:c32713f35d122602c5492ef1c09cc845', 68, 'post', 'modula-gallery', 1, 0, NULL, NULL, 'Örnek Galeri', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-20 11:25:38', '2022-04-20 08:25:38', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-19 19:04:45', '2022-04-19 18:27:44'),
(26, 'http://localhost/Vaykul/wp-content/uploads/2022/04/world-map.jpg', '64:c5273d62ec1c391a5f14a48741bd0d05', 72, 'post', 'attachment', 1, 68, NULL, NULL, 'world-map', 'inherit', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/world-map.jpg', NULL, '72', 'attachment-image', NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/world-map.jpg', '72', 'attachment-image', '{\n    \"width\": 1920,\n    \"height\": 1080,\n    \"url\": \"http://localhost/Vaykul/wp-content/uploads/2022/04/world-map.jpg\",\n    \"path\": \"C:\\\\wamp64\\\\www\\\\vaykul/wp-content/uploads/2022/04/world-map.jpg\",\n    \"size\": \"full\",\n    \"id\": 72,\n    \"alt\": \"\",\n    \"pixels\": 2073600,\n    \"type\": \"image/jpeg\"\n}', NULL, 2, NULL, '2022-04-20 11:25:38', '2022-04-20 11:38:25', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-19 19:04:41', '2022-04-19 19:04:41'),
(27, 'http://localhost/Vaykul/projeler/', '33:a14f35e6769b025f23465ae119970702', 7, 'term', 'category', NULL, NULL, NULL, NULL, 'Projeler', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-04-20 11:25:43', '2022-04-20 08:38:25', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-20 11:26:19', NULL),
(29, 'http://localhost/Vaykul/wp-content/uploads/2022/04/hakkimizda.jpeg', '66:feafde7fd346be0f24e1a2cf94313f70', 57, 'post', 'attachment', 1, 9, NULL, NULL, 'hakkimizda', 'inherit', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/hakkimizda.jpeg', NULL, '57', 'attachment-image', NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/hakkimizda.jpeg', '57', 'attachment-image', '{\n    \"width\": 1600,\n    \"height\": 900,\n    \"url\": \"http://localhost/Vaykul/wp-content/uploads/2022/04/hakkimizda.jpeg\",\n    \"path\": \"C:\\\\wamp64\\\\www\\\\vaykul/wp-content/uploads/2022/04/hakkimizda.jpeg\",\n    \"size\": \"full\",\n    \"id\": 57,\n    \"alt\": \"\",\n    \"pixels\": 1440000,\n    \"type\": \"image/jpeg\"\n}', NULL, 3, NULL, '2022-04-20 11:38:25', '2022-04-20 11:38:25', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-19 16:32:34', '2022-04-19 16:32:34'),
(30, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans1.jpg', '64:486bac0a3bf2872dafbefdccb360cc22', 79, 'post', 'attachment', 1, 78, NULL, NULL, 'referans1', 'inherit', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans1.jpg', NULL, '79', 'attachment-image', NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans1.jpg', '79', 'attachment-image', '{\n    \"width\": 1920,\n    \"height\": 2560,\n    \"url\": \"http://localhost/Vaykul/wp-content/uploads/2022/04/referans1.jpg\",\n    \"path\": \"C:\\\\wamp64\\\\www\\\\vaykul/wp-content/uploads/2022/04/referans1.jpg\",\n    \"size\": \"full\",\n    \"id\": 79,\n    \"alt\": \"\",\n    \"pixels\": 4915200,\n    \"type\": \"image/jpeg\"\n}', NULL, 1, NULL, '2022-04-20 11:38:25', '2022-04-20 11:38:25', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-19 20:11:42', '2022-04-19 20:11:42'),
(31, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans2.jpg', '64:9fb63c66b2b0a9f84c08e00219028003', 80, 'post', 'attachment', 1, 78, NULL, NULL, 'referans2', 'inherit', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans2.jpg', NULL, '80', 'attachment-image', NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans2.jpg', '80', 'attachment-image', '{\n    \"width\": 1920,\n    \"height\": 2400,\n    \"url\": \"http://localhost/Vaykul/wp-content/uploads/2022/04/referans2.jpg\",\n    \"path\": \"C:\\\\wamp64\\\\www\\\\vaykul/wp-content/uploads/2022/04/referans2.jpg\",\n    \"size\": \"full\",\n    \"id\": 80,\n    \"alt\": \"\",\n    \"pixels\": 4608000,\n    \"type\": \"image/jpeg\"\n}', NULL, 1, NULL, '2022-04-20 11:38:25', '2022-04-20 11:38:25', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-19 20:11:45', '2022-04-19 20:11:45'),
(32, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans4-scaled.jpg', '71:a04f61fb27942a8dc29659db29e654ac', 82, 'post', 'attachment', 1, 78, NULL, NULL, 'referans4', 'inherit', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans4-scaled.jpg', NULL, '82', 'attachment-image', NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans4-scaled.jpg', '82', 'attachment-image', '{\n    \"width\": 1707,\n    \"height\": 2560,\n    \"url\": \"http://localhost/Vaykul/wp-content/uploads/2022/04/referans4-scaled.jpg\",\n    \"path\": \"C:\\\\wamp64\\\\www\\\\vaykul/wp-content/uploads/2022/04/referans4-scaled.jpg\",\n    \"size\": \"full\",\n    \"id\": 82,\n    \"alt\": \"\",\n    \"pixels\": 4369920,\n    \"type\": \"image/jpeg\"\n}', NULL, 1, NULL, '2022-04-20 11:38:25', '2022-04-20 11:38:25', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-19 20:11:51', '2022-04-19 20:11:51'),
(33, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans5-scaled.jpg', '71:a9db26bd3636f5c469e27f67d44ab508', 83, 'post', 'attachment', 1, 78, NULL, NULL, 'referans5', 'inherit', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans5-scaled.jpg', NULL, '83', 'attachment-image', NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans5-scaled.jpg', '83', 'attachment-image', '{\n    \"width\": 1700,\n    \"height\": 2560,\n    \"url\": \"http://localhost/Vaykul/wp-content/uploads/2022/04/referans5-scaled.jpg\",\n    \"path\": \"C:\\\\wamp64\\\\www\\\\vaykul/wp-content/uploads/2022/04/referans5-scaled.jpg\",\n    \"size\": \"full\",\n    \"id\": 83,\n    \"alt\": \"\",\n    \"pixels\": 4352000,\n    \"type\": \"image/jpeg\"\n}', NULL, 1, NULL, '2022-04-20 11:38:25', '2022-04-20 11:38:25', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-19 20:11:54', '2022-04-19 20:11:54'),
(34, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans6.jpg', '64:6a006585ccc117783030955e6424f5e6', 84, 'post', 'attachment', 1, 78, NULL, NULL, 'referans6', 'inherit', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans6.jpg', NULL, '84', 'attachment-image', NULL, NULL, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans6.jpg', '84', 'attachment-image', '{\n    \"width\": 1920,\n    \"height\": 1235,\n    \"url\": \"http://localhost/Vaykul/wp-content/uploads/2022/04/referans6.jpg\",\n    \"path\": \"C:\\\\wamp64\\\\www\\\\vaykul/wp-content/uploads/2022/04/referans6.jpg\",\n    \"size\": \"full\",\n    \"id\": 84,\n    \"alt\": \"\",\n    \"pixels\": 2371200,\n    \"type\": \"image/jpeg\"\n}', NULL, 1, NULL, '2022-04-20 11:38:25', '2022-04-20 11:38:25', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-19 20:11:58', '2022-04-19 20:11:58'),
(39, 'http://localhost/Vaykul/projeler/villalar/', '42:759e0c33f9e6c3e5f690751f8fdb42f9', 9, 'term', 'category', NULL, NULL, NULL, NULL, 'Villalar', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-04-20 11:38:25', '2022-04-20 08:38:25', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, NULL, NULL),
(40, 'http://localhost/Vaykul/projeler/deneme2/', '41:a1ee80a37139fa14d3c8d7ce95a4bc76', 11, 'term', 'category', NULL, NULL, NULL, NULL, 'deneme2', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-04-20 11:38:25', '2022-04-20 08:38:25', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-20 11:26:20', '2022-04-19 19:26:04'),
(41, 'http://localhost/Vaykul/projeler/deneme3/', '41:e5fa1aebb739dae36b3e7bce81320cf5', 13, 'term', 'category', NULL, NULL, NULL, NULL, 'deneme3', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-04-20 11:38:25', '2022-04-20 08:38:25', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, '2022-04-19 19:22:20', '2022-04-18 09:15:31'),
(42, NULL, NULL, NULL, 'system-page', 'search-result', NULL, NULL, '%%searchphrase%% için arama yaptınız %%page%% %%sep%% %%sitename%%', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-20 11:38:25', '2022-04-20 08:38:25', 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL),
(43, NULL, NULL, NULL, 'date-archive', NULL, NULL, NULL, '%%date%% %%page%% %%sep%% %%sitename%%', '', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-20 11:38:25', '2022-04-20 08:38:25', 1, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL),
(44, 'http://localhost/Vaykul/html5-blank/', '36:6e481f98e292d1fdac0ce184b4dd74ea', NULL, 'post-type-archive', 'html5-blank', NULL, NULL, '%%pt_plural%% arşivi %%page%% %%sep%% %%sitename%%', '', 'HTML5 Blank Custom Post', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-20 11:38:25', '2022-04-20 08:38:25', 1, NULL, NULL, NULL, NULL, 0, NULL, 2, NULL, NULL),
(52, 'http://localhost/Vaykul/test-blog-yazisi-4/', '43:d6a938756da9cb99a013dd1971aa6a45', 105, 'post', 'post', 1, 0, NULL, NULL, 'Test Blog Yazısı 4', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-04-20 12:03:42', '2022-04-20 09:03:43', 1, NULL, NULL, NULL, NULL, 0, 2, 2, '2022-04-20 12:03:43', '2022-04-20 12:03:42'),
(50, 'http://localhost/Vaykul/test-blog-yazisi-2/', '43:3e8372be723e4c7c9a3b6e48ab830a43', 101, 'post', 'post', 1, 0, NULL, NULL, 'Test Blog Yazısı 2', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-04-20 12:02:28', '2022-04-20 09:02:30', 1, NULL, NULL, NULL, NULL, 0, 2, 2, '2022-04-20 12:02:29', '2022-04-20 12:02:28'),
(51, 'http://localhost/Vaykul/test-blog-yazisi-3/', '43:44f8fa7b0c28f29282e25f9a8b856a50', 103, 'post', 'post', 1, 0, NULL, NULL, 'Test Blog Yazısı 3', 'publish', NULL, 0, NULL, NULL, NULL, NULL, NULL, 30, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-04-20 12:03:22', '2022-04-20 09:03:23', 1, NULL, NULL, NULL, NULL, 0, 2, 2, '2022-04-20 12:03:23', '2022-04-20 12:03:22');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vyk_yoast_indexable_hierarchy`
--

DROP TABLE IF EXISTS `vyk_yoast_indexable_hierarchy`;
CREATE TABLE IF NOT EXISTS `vyk_yoast_indexable_hierarchy` (
  `indexable_id` int(11) UNSIGNED NOT NULL,
  `ancestor_id` int(11) UNSIGNED NOT NULL,
  `depth` int(11) UNSIGNED DEFAULT NULL,
  `blog_id` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`indexable_id`,`ancestor_id`),
  KEY `indexable_id` (`indexable_id`),
  KEY `ancestor_id` (`ancestor_id`),
  KEY `depth` (`depth`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Tablo döküm verisi `vyk_yoast_indexable_hierarchy`
--

INSERT INTO `vyk_yoast_indexable_hierarchy` (`indexable_id`, `ancestor_id`, `depth`, `blog_id`) VALUES
(1, 0, 0, 1),
(6, 0, 0, 1),
(2, 0, 0, 1),
(8, 0, 0, 1),
(9, 0, 0, 1),
(3, 0, 0, 1),
(13, 3, 1, 1),
(22, 21, 1, 1),
(12, 0, 0, 1),
(15, 0, 0, 1),
(16, 0, 0, 1),
(17, 0, 0, 1),
(18, 0, 0, 1),
(20, 0, 0, 1),
(19, 0, 0, 1),
(24, 21, 1, 1),
(4, 0, 0, 1),
(26, 25, 1, 1),
(27, 0, 0, 1),
(45, 0, 0, 1),
(47, 0, 0, 1),
(50, 0, 0, 1),
(51, 0, 0, 1),
(52, 0, 0, 1),
(5, 0, 0, 1),
(10, 0, 0, 1),
(11, 0, 0, 1),
(42, 0, 0, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vyk_yoast_migrations`
--

DROP TABLE IF EXISTS `vyk_yoast_migrations`;
CREATE TABLE IF NOT EXISTS `vyk_yoast_migrations` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `version` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vyk_yoast_migrations_version` (`version`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Tablo döküm verisi `vyk_yoast_migrations`
--

INSERT INTO `vyk_yoast_migrations` (`id`, `version`) VALUES
(1, '20171228151840'),
(2, '20171228151841'),
(3, '20190529075038'),
(4, '20191011111109'),
(5, '20200408101900'),
(6, '20200420073606'),
(7, '20200428123747'),
(8, '20200428194858'),
(9, '20200429105310'),
(10, '20200430075614'),
(11, '20200430150130'),
(12, '20200507054848'),
(13, '20200513133401'),
(14, '20200609154515'),
(15, '20200616130143'),
(16, '20200617122511'),
(17, '20200702141921'),
(18, '20200728095334'),
(19, '20201202144329'),
(20, '20201216124002'),
(21, '20201216141134'),
(22, '20210817092415'),
(23, '20211020091404');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vyk_yoast_primary_term`
--

DROP TABLE IF EXISTS `vyk_yoast_primary_term`;
CREATE TABLE IF NOT EXISTS `vyk_yoast_primary_term` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) DEFAULT NULL,
  `term_id` bigint(20) DEFAULT NULL,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `blog_id` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `post_taxonomy` (`post_id`,`taxonomy`),
  KEY `post_term` (`post_id`,`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Tablo döküm verisi `vyk_yoast_primary_term`
--

INSERT INTO `vyk_yoast_primary_term` (`id`, `post_id`, `term_id`, `taxonomy`, `created_at`, `updated_at`, `blog_id`) VALUES
(1, 92, 1, 'category', '2022-04-20 10:54:59', '2022-04-20 08:33:56', 1),
(2, 75, 11, 'category', '2022-04-20 11:26:07', '2022-04-20 08:26:20', 1),
(4, 101, 1, 'category', '2022-04-20 12:02:30', '2022-04-20 09:02:30', 1),
(5, 103, 1, 'category', '2022-04-20 12:03:23', '2022-04-20 09:03:23', 1),
(6, 105, 1, 'category', '2022-04-20 12:03:43', '2022-04-20 09:03:43', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vyk_yoast_seo_links`
--

DROP TABLE IF EXISTS `vyk_yoast_seo_links`;
CREATE TABLE IF NOT EXISTS `vyk_yoast_seo_links` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `target_post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(8) DEFAULT NULL,
  `indexable_id` int(11) UNSIGNED DEFAULT NULL,
  `target_indexable_id` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `width` int(11) UNSIGNED DEFAULT NULL,
  `size` int(11) UNSIGNED DEFAULT NULL,
  `language` varchar(32) DEFAULT NULL,
  `region` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `link_direction` (`post_id`,`type`),
  KEY `indexable_link_direction` (`indexable_id`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `vyk_yoast_seo_links`
--

INSERT INTO `vyk_yoast_seo_links` (`id`, `url`, `post_id`, `target_post_id`, `type`, `indexable_id`, `target_indexable_id`, `height`, `width`, `size`, `language`, `region`) VALUES
(1, 'http://localhost/Vaykul/wp-content/uploads/2022/04/hakkimizda.jpeg', 9, 57, 'image-in', 10, 29, 900, 1600, 426058, NULL, NULL),
(2, 'http://localhost/Vaykul/wp-admin/post.php?post=78&#038;action=edit#!modula-style', 15, NULL, 'internal', 12, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans1.jpg', 15, 79, 'image-in', 12, 30, 2560, 1920, 747035, NULL, NULL),
(4, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans2.jpg', 15, 80, 'image-in', 12, 31, 2400, 1920, 641119, NULL, NULL),
(5, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans3-scaled.jpg', 15, 81, 'image-in', 12, 22, 2560, 1818, 134462, NULL, NULL),
(6, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans4-scaled.jpg', 15, 82, 'image-in', 12, 32, 2560, 1707, 282570, NULL, NULL),
(7, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans5-scaled.jpg', 15, 83, 'image-in', 12, 33, 2560, 1700, 311775, NULL, NULL),
(8, 'http://localhost/Vaykul/wp-content/uploads/2022/04/referans6.jpg', 15, 84, 'image-in', 12, 34, 1235, 1920, 220196, NULL, NULL),
(9, 'http://localhost/Vaykul/wp-content/uploads/2022/04/hakkimizda.jpeg', 1, 57, 'internal', 5, 29, NULL, NULL, NULL, NULL, NULL),
(10, 'http://localhost/Vaykul/wp-content/uploads/2022/04/banner-desk.jpg', 1, 43, 'internal', 5, 13, NULL, NULL, NULL, NULL, NULL),
(11, 'http://localhost/Vaykul/wp-content/uploads/2022/04/world-map.jpg', 1, 72, 'internal', 5, 26, NULL, NULL, NULL, NULL, NULL),
(12, 'http://localhost/Vaykul/wp-admin/post.php?post=68&#038;action=edit#!modula-general', 1, NULL, 'internal', 5, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'http://localhost/Vaykul/wp-content/uploads/2022/04/hakkimizda.jpeg', 1, 57, 'image-in', 5, 29, 900, 1600, 426058, NULL, NULL),
(14, 'http://localhost/Vaykul/wp-content/uploads/2022/04/banner-desk.jpg', 1, 43, 'image-in', 5, 13, 1095, 1920, 359139, NULL, NULL),
(15, 'http://localhost/Vaykul/wp-content/uploads/2022/04/world-map.jpg', 1, 72, 'image-in', 5, 26, 1080, 1920, 129926, NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
