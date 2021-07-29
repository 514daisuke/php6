-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost
-- 生成日時: 2021 年 7 月 29 日 15:00
-- サーバのバージョン： 10.4.19-MariaDB
-- PHP のバージョン: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `gsacf_d08_05_prod`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `caregiver_info`
--

CREATE TABLE `caregiver_info` (
  `carer_id` int(10) NOT NULL COMMENT '介護者ID',
  `carer_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '介護者_氏名',
  `carer_rubi_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '介護者_氏名_カナ',
  `create_at` datetime NOT NULL COMMENT '介護者_登録日',
  `update_at` datetime NOT NULL COMMENT '介護者_更新日'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `caregiver_info`
--

INSERT INTO `caregiver_info` (`carer_id`, `carer_name`, `carer_rubi_name`, `create_at`, `update_at`) VALUES
(1, '小石大介', 'コイシダイスケ', '2021-07-13 00:45:34', '2021-07-13 00:45:34'),
(2, '小石一郎', 'コイシイチロウ', '2021-07-13 00:46:54', '2021-07-13 00:46:54'),
(3, '小石次郎', 'コイシジロウ', '2021-07-13 00:46:54', '2021-07-13 00:46:54'),
(4, '小石三郎', 'コイシサブロウ', '2021-07-13 00:46:54', '2021-07-13 00:46:54'),
(5, '小石四郎', 'コイシシロウ', '2021-07-13 00:46:54', '2021-07-13 00:46:54'),
(6, '小石五郎', 'コイシゴロウ', '2021-07-13 00:46:54', '2021-07-13 00:46:54'),
(7, '小石六郎', 'コイシロクロウ', '2021-07-13 00:46:54', '2021-07-13 00:46:54');

-- --------------------------------------------------------

--
-- テーブルの構造 `check_table`
--

CREATE TABLE `check_table` (
  `id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `send_note`
--

CREATE TABLE `send_note` (
  `id` int(10) NOT NULL COMMENT '利用者ID',
  `hand_over_id` int(10) NOT NULL COMMENT '申し送りID',
  `carer_id` int(10) NOT NULL COMMENT '介護者ID',
  `hand_over_kind` int(1) NOT NULL COMMENT '申し送り種別(0=Null,1=事業所,2=入院,3=退院,4=通院,5=薬 )',
  `hand_over_text` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '申し送り記録',
  `create_at` datetime NOT NULL COMMENT '申し送り登録日',
  `update_at` datetime NOT NULL COMMENT '申し送り更新日'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `send_note`
--

INSERT INTO `send_note` (`id`, `hand_over_id`, `carer_id`, `hand_over_kind`, `hand_over_text`, `create_at`, `update_at`) VALUES
(1, 1, 1, 1, '1', '2021-07-13 00:59:39', '2021-07-13 00:59:39'),
(2, 2, 2, 2, '2', '2021-07-13 00:59:39', '2021-07-13 00:59:39'),
(3, 3, 3, 3, '3', '2021-07-13 00:59:39', '2021-07-13 00:59:39'),
(4, 4, 4, 4, '4', '2021-07-13 00:59:39', '2021-07-13 00:59:39');

-- --------------------------------------------------------

--
-- テーブルの構造 `todo_table`
--

CREATE TABLE `todo_table` (
  `id` int(11) NOT NULL,
  `image` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `todo_table`
--

INSERT INTO `todo_table` (`id`, `image`, `created_at`, `updated_at`) VALUES
(1, 'upload/202107291249519c4823b9937a0cc28c9131281730ad47.png', '2021-07-29 19:49:51', '2021-07-29 19:49:51'),
(2, 'upload/20210729125003337f62f32ecd2f2cd30fd3250292c21c.png', '2021-07-29 19:50:03', '2021-07-29 19:50:03');

-- --------------------------------------------------------

--
-- テーブルの構造 `user_config`
--

CREATE TABLE `user_config` (
  `id` int(12) NOT NULL,
  `username` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` int(1) NOT NULL,
  `is_deleted` int(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `user_config`
--

INSERT INTO `user_config` (`id`, `username`, `password`, `is_admin`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, '小石大介', 'password', 1, 0, '2021-06-28 22:22:39', '2021-06-28 22:22:39'),
(2, '小石一郎', 'password', 1, 0, '2021-06-28 22:23:26', '2021-06-28 22:23:26'),
(3, '小石次郎', 'password', 1, 0, '2021-06-28 22:23:26', '2021-06-28 22:23:26'),
(4, '小石三郎', 'password', 1, 0, '2021-06-28 22:23:26', '2021-06-28 22:23:26'),
(5, '小石四郎', 'password', 1, 0, '2021-06-28 22:23:26', '2021-06-28 22:23:26'),
(6, '小石五郎', 'password', 1, 0, '2021-06-28 22:23:26', '2021-06-28 22:23:26'),
(7, 'koishi', 'password', 0, 0, '2021-07-15 09:14:55', '2021-07-15 09:14:55');

-- --------------------------------------------------------

--
-- テーブルの構造 `user_hospital`
--

CREATE TABLE `user_hospital` (
  `id` int(12) NOT NULL,
  `hospitalname` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `user_hospital`
--

INSERT INTO `user_hospital` (`id`, `hospitalname`, `created_at`, `updated_at`) VALUES
(1, 'A病院', '2021-07-13 01:11:50', '2021-07-13 01:11:50'),
(2, 'B病院', '2021-07-13 01:11:50', '2021-07-13 01:11:50'),
(3, 'C病院', '2021-07-13 01:11:50', '2021-07-13 01:11:50'),
(4, 'D病院', '2021-07-13 01:11:50', '2021-07-13 01:11:50'),
(5, 'E病院', '2021-07-13 01:11:50', '2021-07-13 01:11:50'),
(6, 'F病院', '2021-07-13 01:11:50', '2021-07-13 01:11:50');

-- --------------------------------------------------------

--
-- テーブルの構造 `user_info`
--

CREATE TABLE `user_info` (
  `id` int(12) NOT NULL COMMENT '利用者ID',
  `no` int(12) DEFAULT NULL COMMENT '申し送りno.',
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '利用者名前',
  `first_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '利用者氏名_性',
  `last_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '利用者氏名_名',
  `rubi_first_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '利用者氏名_性_カナ',
  `rubi_last_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '利用者氏名_名_カナ',
  `brithday` date NOT NULL COMMENT '利用者生年月日',
  `age` int(3) NOT NULL COMMENT '利用者年齢',
  `sex` int(1) NOT NULL COMMENT '利用者性別',
  `memo` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '申し送り（別テーブル移管予定）\r\n',
  `created_at` date NOT NULL COMMENT '利用者登録日',
  `updated_at` date NOT NULL COMMENT '利用者更新日'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `user_medicine`
--

CREATE TABLE `user_medicine` (
  `id` int(12) NOT NULL,
  `medicine_name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `user_medicine`
--

INSERT INTO `user_medicine` (`id`, `medicine_name`, `created_at`, `updated_at`) VALUES
(1, 'A薬', '2021-07-13 01:08:50', '2021-07-13 01:08:50'),
(2, 'B薬', '2021-07-13 01:08:50', '2021-07-13 01:08:50'),
(3, 'C薬', '2021-07-13 01:08:50', '2021-07-13 01:08:50'),
(4, 'D薬', '2021-07-13 01:08:50', '2021-07-13 01:08:50'),
(5, 'E薬', '2021-07-13 01:08:50', '2021-07-13 01:08:50'),
(6, 'F薬', '2021-07-13 01:08:50', '2021-07-13 01:08:50');

-- --------------------------------------------------------

--
-- テーブルの構造 `user_memo`
--

CREATE TABLE `user_memo` (
  `id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `memo` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `user_memo`
--

INSERT INTO `user_memo` (`id`, `user_id`, `memo`, `created_at`, `updated_at`) VALUES
(1, 1, '元気です', '2021-07-13 01:35:06', '2021-07-13 01:35:06'),
(2, 2, '体調不良です', '2021-07-13 01:35:06', '2021-07-13 01:35:06'),
(3, 3, '風邪です', '2021-07-13 01:35:07', '2021-07-13 01:35:07'),
(4, 4, '入院中です', '2021-07-13 01:35:07', '2021-07-13 01:35:07'),
(5, 5, '通院予定です', '2021-07-13 01:35:07', '2021-07-13 01:35:07'),
(6, 6, '薬を飲みます', '2021-07-13 01:35:07', '2021-07-13 01:35:07');

-- --------------------------------------------------------

--
-- テーブルの構造 `user_tabel`
--

CREATE TABLE `user_tabel` (
  `id` int(12) NOT NULL,
  `no` int(12) NOT NULL,
  `date` date NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `recoder` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `memo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `user_tabel`
--

INSERT INTO `user_tabel` (`id`, `no`, `date`, `name`, `birthday`, `recoder`, `memo`, `created_at`, `updated_at`) VALUES
(2, 2, '2021-07-15', '小石次郎', '1990-05-21', '小石次郎ボウ', '今日は体調不良', '2021-07-15 09:43:45', '2021-07-15 09:57:14'),
(3, 4, '2021-06-26', '小石三郎', '1960-01-13', '小石大介', '今日は元気', '2021-07-15 09:49:13', '2021-07-15 09:49:13'),
(5, 6, '2021-06-26', '小石', '1990-05-21', '小石次郎', 'うああああああ', '2021-07-15 20:26:58', '2021-07-15 20:26:58');

-- --------------------------------------------------------

--
-- テーブルの構造 `user_table`
--

CREATE TABLE `user_table` (
  `no` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `brithday` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `caregiver_info`
--
ALTER TABLE `caregiver_info`
  ADD PRIMARY KEY (`carer_id`);

--
-- テーブルのインデックス `check_table`
--
ALTER TABLE `check_table`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `send_note`
--
ALTER TABLE `send_note`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `todo_table`
--
ALTER TABLE `todo_table`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `user_config`
--
ALTER TABLE `user_config`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `user_hospital`
--
ALTER TABLE `user_hospital`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `user_info`
--
ALTER TABLE `user_info`
  ADD UNIQUE KEY `hospital_id` (`id`) USING BTREE;

--
-- テーブルのインデックス `user_medicine`
--
ALTER TABLE `user_medicine`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `user_memo`
--
ALTER TABLE `user_memo`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `user_tabel`
--
ALTER TABLE `user_tabel`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `caregiver_info`
--
ALTER TABLE `caregiver_info`
  MODIFY `carer_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '介護者ID', AUTO_INCREMENT=8;

--
-- テーブルの AUTO_INCREMENT `check_table`
--
ALTER TABLE `check_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- テーブルの AUTO_INCREMENT `send_note`
--
ALTER TABLE `send_note`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '利用者ID', AUTO_INCREMENT=8;

--
-- テーブルの AUTO_INCREMENT `todo_table`
--
ALTER TABLE `todo_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルの AUTO_INCREMENT `user_config`
--
ALTER TABLE `user_config`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- テーブルの AUTO_INCREMENT `user_hospital`
--
ALTER TABLE `user_hospital`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- テーブルの AUTO_INCREMENT `user_info`
--
ALTER TABLE `user_info`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '利用者ID', AUTO_INCREMENT=11;

--
-- テーブルの AUTO_INCREMENT `user_medicine`
--
ALTER TABLE `user_medicine`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- テーブルの AUTO_INCREMENT `user_memo`
--
ALTER TABLE `user_memo`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- テーブルの AUTO_INCREMENT `user_tabel`
--
ALTER TABLE `user_tabel`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
