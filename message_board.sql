-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-07-05 12:55:53
-- 服务器版本： 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `message_board`
--

-- --------------------------------------------------------

--
-- 表的结构 `message`
--

CREATE TABLE `message` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '留言内容',
  `time_created` int(10) UNSIGNED NOT NULL COMMENT '创建时间',
  `time_updated` int(10) UNSIGNED NOT NULL COMMENT '更新时间',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='留言';

--
-- 转存表中的数据 `message`
--

INSERT INTO `message` (`id`, `content`, `time_created`, `time_updated`, `user_id`) VALUES
(3, 'asdfwer', 1530518250, 1530518250, 1),
(5, 'er;llkerjkl24w5e454w4rqwerqwerqer', 1530518865, 1530518865, 1),
(6, '我是留言，留言是我，我要留言', 1530523530, 1530523530, 1),
(7, '央视网消息：7月2日，习近平总书记在中南海同团中央新一届领导班子成员集体谈话并发表重要讲话。当晚的《新闻联播》头条用将近9分钟的时长进行了播报。\r\n\r\n　　习近平在讲话中强调，青年工作抓住的是当下，传承的是根脉，面向的是未来，攸关党和国家前途命运。青年一代有理想、有本领、有担当，国家就有前途、民族就有希望。代表广大青年、赢得广大青年、依靠广大青年是我们党不断从胜利走向胜利的重要保证。', 1530583015, 1530583015, 1),
(8, '柯南一行人解開手機密碼得知罪犯的逃离的目的地后，在阿笠博士的帶領下驅車追捕。罪犯一開始的速度是每小时120公里，走了正好一半的路程', 1530589635, 1530589635, 2),
(9, '“建议将个人所得税起征点提高。”7月2日上午，在上海工作月薪1万左右的小王写好上述建议后，提交到中国人大网的个人所得税法修正案草案（下称“个税草案”）征求意见专栏。个税草案征求4天后，社会各界提出的意见数已经突破3万条', 1530598408, 1530598408, 1),
(10, 'sasss', 1530600998, 1530600998, 3),
(11, '<script>alert(\'hello\')</script>', 1530601041, 1530601041, 3),
(12, 'admin', 1530601169, 1530601169, 2),
(13, 'ads\r\n\r\n\r\nsd\r\nasd\r\n\r\n#', 1530601216, 1530601216, 2);

-- --------------------------------------------------------

--
-- 表的结构 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '2014_10_12_000000_create_users_table', 1),
(5, '2014_10_12_100000_create_password_resets_table', 1),
(6, '2018_07_02_030130_create_messages_table', 1),
(9, '2018_07_04_021058_alter_message_table', 2),
(10, '2018_07_04_023615_alter_users_table', 2),
(11, '2016_06_01_000001_create_oauth_auth_codes_table', 3),
(12, '2016_06_01_000002_create_oauth_access_tokens_table', 3),
(13, '2016_06_01_000003_create_oauth_refresh_tokens_table', 3),
(14, '2016_06_01_000004_create_oauth_clients_table', 3),
(15, '2016_06_01_000005_create_oauth_personal_access_clients_table', 3);

-- --------------------------------------------------------

--
-- 表的结构 `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0b0cbc68b3f81f05c084c5491caf08c653f9a64cbccecbe188dd09a03a049ed25e52021c2f2a9ba2', 1, 1, 'Pi App', '[]', 0, '2018-07-04 01:05:45', '2018-07-04 01:05:45', '2019-07-04 09:05:45'),
('0bf5431a8c5ad6997f47bc6d2641656ed6b180d01d8e1ba2b75ba170000a7f970099974ccece5fe4', 1, 7, 'MyApp', '[]', 0, '2018-07-04 20:35:29', '2018-07-04 20:35:29', '2019-07-05 04:35:29'),
('0d44a9b46f1fd125a75167d2367aa77dfae9c2d4fc357fe19bba81b99c7bf4799a68ae9c5f753ba0', 1, 1, 'Pi App', '[]', 0, '2018-07-04 01:06:08', '2018-07-04 01:06:08', '2019-07-04 09:06:08'),
('10715d0117ff81b0d25c6e156e63641461193b0dbcdbe3f1e3a02703b955b1fad8d663090f3c3580', 1, 7, 'MyApp', '[]', 0, '2018-07-04 20:33:22', '2018-07-04 20:33:22', '2019-07-05 04:33:22'),
('10d84383e2113f895ebe3995d0f54a9abd5daba7c45062973b217d668f36b6b9576b14720527d959', 1, 1, 'Pi App', '[]', 0, '2018-07-04 01:07:22', '2018-07-04 01:07:22', '2019-07-04 09:07:22'),
('11b9360436fce51496c2b88ccc8911f413bae48f6234fb5470c75769c691b96881cd70c01877a7d5', 1, 3, 'Pi App', '[]', 0, '2018-07-04 16:57:40', '2018-07-04 16:57:40', '2019-07-05 00:57:40'),
('12e75fd873e2996115099bf1466dcff53cdca76e6419c935d828dcfb5d3f8a0be7fc2e9362c86264', 2, 3, 'Pi App', '[]', 0, '2018-07-04 17:26:06', '2018-07-04 17:26:06', '2019-07-05 01:26:06'),
('2788050254bdc395d58364b9f46c13249ee22cf7e8b836f80c1e7bef68fb6091f2673a7e64396ad1', 2, 3, 'Pi App', '[]', 0, '2018-07-04 17:06:37', '2018-07-04 17:06:37', '2019-07-05 01:06:37'),
('2cf2d394d1c009616f7a4debda32516eb2523a7400d8b623ede9665d4d82105e2475db94a428b934', 1, 3, 'Pi App', '[]', 0, '2018-07-04 02:38:35', '2018-07-04 02:38:35', '2019-07-04 10:38:35'),
('36615be1c0baf6064cd054840a69fefcc948fa3e312df72ba28a759477d36fa9442b9a0c028e9da8', 1, 1, 'Pi App', '[]', 0, '2018-07-04 01:05:48', '2018-07-04 01:05:48', '2019-07-04 09:05:48'),
('3d16a7730872229afac7f9e8b42a66c32e8daa9f91b0415738834bbf14e662f6a89233757363c7c5', 1, 1, 'Pi App', '[]', 0, '2018-07-04 01:05:49', '2018-07-04 01:05:49', '2019-07-04 09:05:49'),
('4bcb499590f86bea19da23477a4ca960cad1fbe5f0c45fb2c8479fc3476ea38f43014e0128edf9cc', 1, 1, 'Pi App', '[]', 0, '2018-07-04 01:05:35', '2018-07-04 01:05:35', '2019-07-04 09:05:35'),
('52c7bade2bc1a2f3f55979e5e025964d1e51ed1426cc45731cca26db7e5616d149834f81255f2b6d', 2, 3, 'Pi App', '[]', 0, '2018-07-04 17:01:15', '2018-07-04 17:01:15', '2019-07-05 01:01:15'),
('59d0766ea7bb233f338fa0b32c7bc32275bae2200c956c472d15f8e4baa89fa020f4f284204ca1d0', 1, 9, NULL, '[]', 0, '2018-07-04 20:01:24', '2018-07-04 20:01:24', '2019-07-05 04:01:24'),
('5c7a3c171725e714a5dae8636b4fe41fe426c0edf9dcd689487a338df6de2d2733fa567fc2b9ecb1', 1, 9, NULL, '[]', 0, '2018-07-04 19:20:38', '2018-07-04 19:20:38', '2019-07-05 03:20:38'),
('60250e390729331824d699962c33fcb94c76b7e34d6b1d6b902df161da3f9817a22f34aa34774bec', 1, 9, NULL, '[]', 0, '2018-07-04 19:34:26', '2018-07-04 19:34:26', '2019-07-05 03:34:26'),
('7a9d27b3bebc675f0e689462e1d369451f23d13ea9e408ab61ca872f1d611f903edc7a36743f1d2b', 1, 1, 'Pi App', '[]', 0, '2018-07-04 01:05:46', '2018-07-04 01:05:46', '2019-07-04 09:05:46'),
('89e3bce65d09761fae5b8779af0f6c39b67b62f46578543ad4d23a65e2eec61fac7089ce552935f4', 1, 7, 'MyApp', '[]', 0, '2018-07-04 20:34:02', '2018-07-04 20:34:02', '2019-07-05 04:34:02'),
('8bc3d3f7e1f942d43f3c06f7f32d85ed7a4abcca7d188130fc956eb2ae71d107582b96759cc9a9a0', 1, 3, 'Pi App', '[]', 0, '2018-07-04 17:00:56', '2018-07-04 17:00:56', '2019-07-05 01:00:56'),
('bc79810d184b32a5e3b5ff3b619d03f4392b3b6ad5004aed10e49bc08e47a228b2e763a89b31e54c', 1, 1, 'Pi App', '[]', 0, '2018-07-04 01:05:47', '2018-07-04 01:05:47', '2019-07-04 09:05:47'),
('c1f3ca2c580fca5b4de22e2d7c199934aa92a75024355a3a082a89fd998fe9138529fd7671341bc6', 1, 3, 'Pi App', '[]', 0, '2018-07-04 02:36:42', '2018-07-04 02:36:42', '2019-07-04 10:36:42'),
('c9e56c4d95e547207cc00ab931bb52223f39da526de6a873044642e63ca390ed29916da898cce5dd', 2, 3, 'Pi App', '[]', 0, '2018-07-04 17:45:04', '2018-07-04 17:45:04', '2019-07-05 01:45:04'),
('dfec40b21f6eb976038734deed4da4933e5f5a85b3558be815c9ec278f9212f5fc08667d0d45209f', 1, 9, NULL, '[]', 0, '2018-07-04 18:52:33', '2018-07-04 18:52:33', '2019-07-05 02:52:33'),
('e5a766e0a09cb3494f6a778d8204de215bcd6d08d262298f9369af02a1ae4cef67f7bc44bb201889', 1, 1, 'Pi App', '[]', 0, '2018-07-04 01:05:47', '2018-07-04 01:05:47', '2019-07-04 09:05:47'),
('eb46460dcffe2a46b9e76236bdbadc215c46161fa75ac772726d4e7ed248d4040abaed47fe097d4c', 1, 3, 'Pi App', '[]', 0, '2018-07-04 02:38:34', '2018-07-04 02:38:34', '2019-07-04 10:38:34'),
('f34c258e6307ecb454e5300855eaf5fb6b2829f0457360ecff07e7760ce4ceee06a07a4533927e8b', 1, 9, NULL, '[]', 0, '2018-07-04 19:43:45', '2018-07-04 19:43:45', '2019-07-05 03:43:45');

-- --------------------------------------------------------

--
-- 表的结构 `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `oauth_auth_codes`
--

INSERT INTO `oauth_auth_codes` (`id`, `user_id`, `client_id`, `scopes`, `revoked`, `expires_at`) VALUES
('044af54f3bda53392cc2f5c74011579bfb90916c83f575bd3c600691403f586619f3601d2e9ee135', 1, 9, '[]', 1, '2018-07-05 03:30:37'),
('1b1e47b44e88b2e525187f843f4a4742fb7a876ea7145938e250c44498fbe79316587fa1676aafe3', 1, 9, '[]', 1, '2018-07-05 03:44:24'),
('28c95ef2f780f16506eba9bfe272865f1a43b6f7701872102879698c6b2c73caa8aaa4a0f5a7be06', 1, 9, '[]', 1, '2018-07-05 04:11:23'),
('593b003cb1b874e8b80936cbd8589bc866647979f9a1a902c93db801a4fef5ad86265ba424f8e248', 1, 9, '[]', 1, '2018-07-05 03:53:43'),
('a0fc77468b11d9d2784a0ede615e40e32f19782532e5b3161c70418fe023bc006c13789b3aacca89', 1, 9, '[]', 0, '2018-07-05 02:49:21'),
('f84e4123cdcf12e7ff78a33526c7d90a4277ad4d4e50e61ae91f6fb37187beed04eb3479b0a22644', 1, 9, '[]', 1, '2018-07-05 03:00:45');

-- --------------------------------------------------------

--
-- 表的结构 `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, '留言板 Personal Access Client', 'r8hdljjckbutkxeRPnOtjrOyXwkeJGXwYhFR9qPl', 'http://localhost', 1, 0, 0, '2018-07-04 00:40:08', '2018-07-04 00:40:08'),
(2, NULL, '留言板 Password Grant Client', '27mNDGLP5cDwGEDoVlVmyuQD3SyOyfEMI9I7qRJE', 'http://localhost', 0, 1, 0, '2018-07-04 00:40:08', '2018-07-04 00:40:08'),
(3, NULL, '留言板 Personal Access Client', 'Bdy8X8QIWs6ashbSuHgCJQXVoKm9laxTw7A7roR3', 'http://localhost', 1, 0, 0, '2018-07-04 02:32:43', '2018-07-04 02:32:43'),
(4, NULL, '留言板 Password Grant Client', '7ZCzn8k9XSpNigLtPQgyJ95MRzrWqTSub2P9OD6t', 'http://localhost', 0, 1, 0, '2018-07-04 02:32:43', '2018-07-04 02:32:43'),
(5, NULL, '留言板 Personal Access Client', 'wcA1v6aTOeabC0vBIwTlokyYQ1GBqTeFo8Ym4GAO', 'http://localhost', 1, 0, 0, '2018-07-04 18:09:47', '2018-07-04 18:09:47'),
(6, NULL, '留言板 Password Grant Client', 'ozud7m76CX4b4PxCMj8wz80xSp9rQE1KSYW61rmO', 'http://localhost', 0, 1, 0, '2018-07-04 18:09:47', '2018-07-04 18:09:47'),
(7, NULL, '留言板 Personal Access Client', 'OnZcrYOmRn2QtlCIhBFUGGd1SmK3DbzLJO8x696m', 'http://localhost', 1, 0, 0, '2018-07-04 18:10:07', '2018-07-04 18:10:07'),
(8, NULL, '留言板 Password Grant Client', 'Jj7gb97z5cT6JBLD7FaQXLOhBmMxTfjuz7w5wkFp', 'http://localhost', 0, 1, 0, '2018-07-04 18:10:08', '2018-07-04 18:10:08'),
(9, 9, 'Laravel test access client', 'xDzHRBRNjd36b8yPGiMGDGjsN6cYOGh8ANhOfbQ5', 'http://mb.com/auth/callback', 0, 0, 0, '2018-07-04 18:17:18', '2018-07-04 18:17:18');

-- --------------------------------------------------------

--
-- 表的结构 `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-07-04 00:40:08', '2018-07-04 00:40:08'),
(2, 3, '2018-07-04 02:32:43', '2018-07-04 02:32:43'),
(3, 5, '2018-07-04 18:09:47', '2018-07-04 18:09:47'),
(4, 7, '2018-07-04 18:10:07', '2018-07-04 18:10:07');

-- --------------------------------------------------------

--
-- 表的结构 `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('1b91bc03c5473f527d7f235b3d4e484db868c4cdb131f3971c271253541451f09d7c2aceef274c87', '5c7a3c171725e714a5dae8636b4fe41fe426c0edf9dcd689487a338df6de2d2733fa567fc2b9ecb1', 0, '2019-07-05 03:20:39'),
('4e1e98c9c71c6f9f8c14829e30ce751e81b95510cedee9a34f0a0c1cf0d8bf2f4e367844d40a462b', 'dfec40b21f6eb976038734deed4da4933e5f5a85b3558be815c9ec278f9212f5fc08667d0d45209f', 0, '2019-07-05 02:52:33'),
('587b6f595e2d8f0aeee9f1c4df52bb9cd7324a94d6858adf707a1d309b8bc4bb9ded7fbda2b800cd', '60250e390729331824d699962c33fcb94c76b7e34d6b1d6b902df161da3f9817a22f34aa34774bec', 0, '2019-07-05 03:34:26'),
('ad577560dee73cff4c55e6181c977e33d1abfe8af0156ac5b5546e39fde4b4996574486be26b883e', 'f34c258e6307ecb454e5300855eaf5fb6b2829f0457360ecff07e7760ce4ceee06a07a4533927e8b', 0, '2019-07-05 03:43:45'),
('f2e7645e70430cd85bf3fa97abc65ba03904045ca683b5bc29fe06d5d16e38fb89d88dd6ea91267f', '59d0766ea7bb233f338fa0b32c7bc32275bae2200c956c472d15f8e4baa89fa020f4f284204ca1d0', 0, '2019-07-05 04:01:24');

-- --------------------------------------------------------

--
-- 表的结构 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_created` int(10) UNSIGNED NOT NULL COMMENT '创建时间',
  `time_updated` int(10) UNSIGNED NOT NULL COMMENT '更新时间',
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci DEFAULT 'Y' COMMENT '状态',
  `role` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户';

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `time_created`, `time_updated`, `status`, `role`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test@163.com', '$2y$10$a4lQkRssxS9wBMdlFM.i1.KZXHVHg8uLA9agtoQ5C4fHU2H.EcwsW', 'lbygR70O4chz2trjr3QUrFuASS8Gi17n7S8UF8Xr5efghA5cVgL4lcczetVD', 1530511748, 1530511748, 'N', 'member', '2018-07-01 22:09:08', '2018-07-04 00:14:59'),
(2, 'admin', 'admin@163.com', '$2y$10$rp00qfWQf5TIAhY0I4wFfO0Y716zx6t0v/EU60kaVYvYmBvEH5WXm', 'dYcNV944ddphfgDDBB0l9NyDmga3jYeXmFGvYrtMaWBobhe1vvJWouhugGZe', 1530511798, 1530511798, 'Y', 'admin', '2018-07-01 22:09:58', '2018-07-02 23:00:06'),
(3, 'sam', 'sam@qq.com', '$2y$10$vQ2KVvRPJrVqeSKnKKxg8u9STr8j0Nzbv2cA4.eR/bKHBUPuMNJN2', 'J82ExeIzjcwrR3GfiH53xljzsVIyPMdPf5Pkp5vj5521qwJxUZN14AQIvM0S', 1530600951, 1530600951, 'Y', 'member', '2018-07-02 22:55:51', '2018-07-02 23:00:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_time_created_index` (`time_created`),
  ADD KEY `uid` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_name_index` (`name`),
  ADD KEY `users_time_created_index` (`time_created`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `message`
--
ALTER TABLE `message`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用表AUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用表AUTO_INCREMENT `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用表AUTO_INCREMENT `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
