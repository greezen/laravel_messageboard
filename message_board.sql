-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-07-04 10:19:18
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
  `content` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_created` int(10) UNSIGNED NOT NULL,
  `time_updated` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(6, '2018_07_02_030130_create_messages_table', 1);

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
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_created` int(10) UNSIGNED NOT NULL,
  `time_updated` int(10) UNSIGNED NOT NULL,
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `time_created`, `time_updated`, `status`, `role`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test@163.com', '$2y$10$a4lQkRssxS9wBMdlFM.i1.KZXHVHg8uLA9agtoQ5C4fHU2H.EcwsW', 'Q08DKmaITTRMwUeCP49KHn1Dcie9jG0aJJBEh1YFPPgR3P4j9GjuYL7QzGuf', 1530511748, 1530511748, 'N', 'member', '2018-07-01 22:09:08', '2018-07-02 22:34:44'),
(2, 'admin', 'admin@163.com', '$2y$10$rp00qfWQf5TIAhY0I4wFfO0Y716zx6t0v/EU60kaVYvYmBvEH5WXm', 'oiWQGzsZWRcmWDO9R1BydNwEQaVfOLTwIGrTrCIkqRpe6j7N78KCAlm8NPGM', 1530511798, 1530511798, 'Y', 'admin', '2018-07-01 22:09:58', '2018-07-02 23:00:06'),
(3, 'sam', 'sam@qq.com', '$2y$10$vQ2KVvRPJrVqeSKnKKxg8u9STr8j0Nzbv2cA4.eR/bKHBUPuMNJN2', 'J82ExeIzjcwrR3GfiH53xljzsVIyPMdPf5Pkp5vj5521qwJxUZN14AQIvM0S', 1530600951, 1530600951, 'Y', 'member', '2018-07-02 22:55:51', '2018-07-02 23:00:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

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
  ADD UNIQUE KEY `users_email_unique` (`email`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
