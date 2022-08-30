-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 30 2022 г., 11:00
-- Версия сервера: 5.6.43
-- Версия PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `exam3`
--

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(249) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `status_active` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `resettable` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `roles_mask` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `registered` int(10) UNSIGNED NOT NULL,
  `last_login` int(10) UNSIGNED DEFAULT NULL,
  `force_logout` mediumint(7) UNSIGNED NOT NULL DEFAULT '0',
  `data_filter_tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vk_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telegram_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instagram_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `username`, `status`, `status_active`, `verified`, `resettable`, `roles_mask`, `registered`, `last_login`, `force_logout`, `data_filter_tag`, `avatar`, `company`, `job_title`, `phone`, `address`, `vk_link`, `telegram_link`, `instagram_link`) VALUES
(1, 'you@site.ru', '$2y$10$5sQNa5S1BBiA6uYiI4QVIuHaIvivocEqfFsSPY5fHhK.AvgM9UpK6', 'simba', 0, '', 1, 1, 1, 1659733740, 1661836413, 0, '', '', '', '', '', '', '', '', ''),
(10, 'you222@site.ru', '$2y$10$PrjM73kZElI/8ZqVlxcrtuwiB6KO7XJJq2TpxK2O9yQZy3iA8EKV6', '321', 0, '', 1, 1, 0, 1660976500, 1660976531, 0, '', '', '', '', '', '', '', '', ''),
(9, 'you111@site.ru', '$2y$10$znReUaaCLRoCOVwz7nLOxe.i9QJwQJX2LQ6/BSalVq3WmJWwg6vgq', '123', 0, '', 1, 1, 0, 1660976005, 1661233998, 0, '', '', '', '', '', '', '', '', ''),
(11, 'oliver.kopyov@smartadminwebapp.com', '', 'Oliver Kopyov', 0, 'success', 1, 1, 0, 0, NULL, 0, 'oliver kopyov', 'img/demo/avatars/avatar-b.png', 'Gotbootstrap Inc.', 'IT Director', '+1 317-456-2564', '15 Charist St, Detroit, MI, 48212, USA', '', '', ''),
(13, 'Alita@smartadminwebapp.com', '', 'Alita Gray 23', 0, 'warning', 0, 1, 0, 0, NULL, 0, 'alita gray', 'img/demo/avatars/avatar-c.png', 'Gotbootstrap Inc.', 'Project Manager', '+1 313-461-1347', '134 Hamtrammac, Detroit, MI, 48314, USA', '', '', ''),
(16, 'john.cook@smartadminwebapp.com', '', 'Dr. John Cook PhD', 0, 'danger', 0, 1, 0, 0, NULL, 0, 'dr john cook', 'img/demo/avatars/avatar-e.png', 'Gotbootstrap Inc.', 'Human Resources', '+1 313-779-1347', '55 Smyth Rd, Detroit, MI, 48341, USA', '', '', ''),
(23, 'valera@site.ru', '$2y$10$RzMqmn2h1mMZhmaoHXqy6enIngbUIVCmMoc3L.GPTW9KEkBGX4DQi', 'Валера', 0, 'success', 0, 1, 0, 0, NULL, 0, '', 'img/demo/avatars/630d92b48a057.jpg', 'тут', '', '12345', '', '', '', ''),
(22, 'petya123@site.ru', '$2y$10$vTWAJZMmSggcMpV1f2QWyO1xbM3ZA8GVdR7CX.agyBkGCM8pBjF9m', 'Петя Олексеевич 14', 0, 'warning', 1, 1, 0, 0, 1661845175, 0, '', 'img/demo/avatars/630d93234b9ee.jpg', 'Житомир 11', '', '102', 'Житомир 101', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `users_confirmations`
--

CREATE TABLE `users_confirmations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(249) COLLATE utf8mb4_unicode_ci NOT NULL,
  `selector` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `expires` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users_confirmations`
--

INSERT INTO `users_confirmations` (`id`, `user_id`, `email`, `selector`, `token`, `expires`) VALUES
(1, 1, 'you@site.ru', 'JnF6jrcYeY7c6_TN', '$2y$10$dW0lOdfyKe.NAxIrnU7kUu0MzKxGt55bSVKc0A018bz6cqChaK7r2', 1659820140),
(2, 2, 'you1212@site.ru', 'uYoWa3gByQwwxAHI', '$2y$10$uDfPSVwvPd.7z9JEIJDmB.7uz98qM.6dPLUhMML9.HqJ0iFM304Oe', 1659820239),
(3, 3, 'you555@site.ru', '7mOJzXS2wZpkqPBL', '$2y$10$FrEfxwzYsXWYmGZSbYAL4ehH6YpKwrdDWsrGwafGfvnJRAON2.P5q', 1660807745),
(4, 4, 'you777@site.ru', '3t1yNjGN89OCnaVZ', '$2y$10$pZmUrFCy0qqlMU6bv.hnE.BOmiV4CT2nAYTwuXIkrCLU16kyNajLi', 1660807950),
(5, 5, 'you888@site.ru', 'wwzJfaqnwDP0Oe0N', '$2y$10$XermodF3oXl49n6E4/f7hO/d/4GuEtM8JRC5ry0VVCRNz7.HOXFfq', 1660808145),
(6, 6, 'you11@site.ru', 'xb-p0DU5a_M-llYv', '$2y$10$CiAZG0agMaUL.dnVmpRDJ.UKXzNUdzZG8QRT1LUAPfDRSAvP1r3lS', 1660808306),
(7, 7, 'you333@site.ru', 'CyfS-9_SMiQIohtQ', '$2y$10$jH1TiE8Hh.SJxBwfYHZBguQHyg76d44uNLApoM2MwbyV/uC5Ozc7e', 1660808342),
(8, 8, 'you8888@site.ru', 'JHLRtE3lGVtIb40L', '$2y$10$SQRnBdsNjFgI/p8QjHsi1Om8MLVs2NdsnqNkyVn00HeW4a4Mm1fQy', 1660923891),
(9, 9, 'you111@site.ru', 'C8w7K7KjxX2X9zXI', '$2y$10$OEu3JgkCwsK4.91y9aIOHu6WI45/V8Tj4UK3HzrBuvlJ3YZpl5jPm', 1661062405),
(10, 10, 'you222@site.ru', 'J2IlGNiUssxXK1zM', '$2y$10$ZnBG0SamfWQ6cA5mgFeKqehkwBVA4NZRNv9VvL1Q6KR2hTrpuDgmG', 1661062900);

-- --------------------------------------------------------

--
-- Структура таблицы `users_in`
--

CREATE TABLE `users_in` (
  `id` int(11) NOT NULL,
  `data_filter_tag` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `job_title` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `vk_link` varchar(255) NOT NULL,
  `telegram_link` varchar(255) NOT NULL,
  `instagram_link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users_in`
--

INSERT INTO `users_in` (`id`, `data_filter_tag`, `status`, `avatar`, `name`, `company`, `job_title`, `phone`, `email`, `address`, `vk_link`, `telegram_link`, `instagram_link`) VALUES
(1, 'oliver kopyov', 'success', 'img/demo/avatars/avatar-b.png', 'Oliver Kopyov', 'Gotbootstrap Inc.', 'IT Director', '+1 317-456-2564', 'oliver.kopyov@smartadminwebapp.com', '15 Charist St, Detroit, MI, 48212, USA', '', '', ''),
(3, 'alita gray', 'warning', 'img/demo/avatars/avatar-c.png', 'Alita Gray', 'Gotbootstrap Inc.', 'Project Manager', '+1 313-461-1347', 'Alita@smartadminwebapp.com', '134 Hamtrammac, Detroit, MI, 48314, USA', '', '', ''),
(5, 'dr john cook', 'danger', 'img/demo/avatars/avatar-e.png', 'Dr. John Cook PhD', 'Gotbootstrap Inc.', 'Human Resources', '+1 313-779-1347', 'john.cook@smartadminwebapp.com', '55 Smyth Rd, Detroit, MI, 48341, USA', '', '', ''),
(6, 'jim ketty', 'success', 'img/demo/avatars/avatar-k.png', 'Jim Ketty', 'Gotbootstrap Inc.', 'Staff Orgnizer', '+1 313-779-3314', 'jim.ketty@smartadminwebapp.com', '134 Tasy Rd, Detroit, MI, 48212, USA', '', '', ''),
(9, 'aaron tellus', 'success', 'img/demo/avatars/avatar-g.png', 'Dr. John Oliver', 'Gotbootstrap Inc.', 'Oncologist', '+1 313-779-8134', 'john.oliver@smartadminwebapp.com', '134 Gallery St, Detroit, MI, 46214, USA', '', '', ''),
(10, 'sarah mcbrook', 'success', 'img/demo/avatars/avatar-h.png', 'Sarah McBrook', 'Gotbootstrap Inc.', 'Xray Division', '+1 313-779-7613', 'sarah.mcbrook@smartadminwebapp.com', '13 Jamie Rd, Detroit, MI, 48313, USA', '', '', ''),
(11, 'jimmy fellan', 'success', 'img/demo/avatars/avatar-i.png', 'Jimmy Fellan', 'Gotbootstrap Inc.', 'Accounting', '+1 313-779-4314', 'jimmy.fallan@smartadminwebapp.com', '55 Smyth Rd, Detroit, MI, 48341, USA', '', '', ''),
(12, 'arica grace', 'success', 'img/demo/avatars/avatar-j.png', 'Arica Grace', 'Gotbootstrap Inc.', 'Accounting', '1 313-779-3347', 'arica.grace@smartadminwebapp.com', '798 Smyth Rd, Detroit, MI, 48341, USA', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `users_remembered`
--

CREATE TABLE `users_remembered` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` int(10) UNSIGNED NOT NULL,
  `selector` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `expires` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users_resets`
--

CREATE TABLE `users_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` int(10) UNSIGNED NOT NULL,
  `selector` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `expires` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users_throttling`
--

CREATE TABLE `users_throttling` (
  `bucket` varchar(44) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `tokens` float UNSIGNED NOT NULL,
  `replenished_at` int(10) UNSIGNED NOT NULL,
  `expires_at` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users_throttling`
--

INSERT INTO `users_throttling` (`bucket`, `tokens`, `replenished_at`, `expires_at`) VALUES
('QduM75nGblH2CDKFyk0QeukPOwuEVDAUFE54ITnHM38', 56.125, 1661845175, 1662385175),
('PZ3qJtO_NLbJfRIP-8b4ME4WA3xxc6n9nbCORSffyQ0', 2.90637, 1660976500, 1661408500),
('OMhkmdh1HUEdNPRi-Pe4279tbL5SQ-WMYf551VVvH8U', 19, 1661845170, 1661881170),
('Opz4bKLr9sPYeFhqZRcuFye8lGrKGZKxVdD5Z1yWCec', 499, 1660728937, 1660901737),
('s0WRvxEBc15Bz-hseMZtfYiTxkXIMvEWwGSdMkOCMgY', 499, 1660975908, 1661148708),
('7bqBfg88Mv8P5KIA6Ko3ce1RHVeEPfr6E8pOw6L3SxM', 499, 1660975965, 1661148765),
('uC0QAYd21lXJAjPxuLwY9nFtVIOvwmDYZq9Am-wAWGw', 496.186, 1661582893, 1661755693),
('dS47wWM2m6HwCciIV9RH_5rEfZzGg616RQZm5Se1PF4', 499, 1661840447, 1662013247),
('EaDtxiUiTetxv3qZqMGLoUnhwNGLg9TGLEI5ceFy2vo', 499, 1661845170, 1662017970);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Индексы таблицы `users_confirmations`
--
ALTER TABLE `users_confirmations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `selector` (`selector`),
  ADD KEY `email_expires` (`email`,`expires`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `users_in`
--
ALTER TABLE `users_in`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users_remembered`
--
ALTER TABLE `users_remembered`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `selector` (`selector`),
  ADD KEY `user` (`user`);

--
-- Индексы таблицы `users_resets`
--
ALTER TABLE `users_resets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `selector` (`selector`),
  ADD KEY `user_expires` (`user`,`expires`);

--
-- Индексы таблицы `users_throttling`
--
ALTER TABLE `users_throttling`
  ADD PRIMARY KEY (`bucket`),
  ADD KEY `expires_at` (`expires_at`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `users_confirmations`
--
ALTER TABLE `users_confirmations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `users_in`
--
ALTER TABLE `users_in`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `users_remembered`
--
ALTER TABLE `users_remembered`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users_resets`
--
ALTER TABLE `users_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
