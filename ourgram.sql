-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2023 at 11:28 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ourgram`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `comment` varchar(100) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment`, `create_at`, `post_id`, `user_id`) VALUES
(1, 'It so nice!', '2023-02-05 10:03:48', 3, 4),
(2, 'That true!', '2023-02-05 10:04:01', 11, 4),
(3, 'So sweet!', '2023-02-05 10:04:25', 5, 4),
(4, 'yep', '2023-02-05 10:04:49', 10, 4),
(5, 'it\'s cool!', '2023-02-05 10:07:47', 11, 14),
(6, 'awesome:3', '2023-02-05 10:08:17', 4, 14),
(7, 'this view so good.', '2023-02-05 10:08:39', 5, 14),
(8, 'Cute://', '2023-02-05 10:15:20', 7, 9);

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `follow_id` int(11) NOT NULL,
  `following_user_id` int(11) NOT NULL COMMENT 'กำลังติดตามใคร',
  `followed_user_id` int(11) NOT NULL COMMENT 'ถูกติดตามโดยใคร'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`follow_id`, `following_user_id`, `followed_user_id`) VALUES
(1, 5, 4),
(2, 7, 4),
(3, 10, 4),
(4, 7, 14),
(5, 5, 14),
(6, 11, 14),
(7, 12, 9),
(8, 6, 9);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `like_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`like_id`, `user_id`, `post_id`) VALUES
(1, 4, 11),
(2, 4, 10),
(3, 4, 5),
(4, 4, 4),
(5, 4, 3),
(6, 14, 2),
(7, 14, 1),
(8, 14, 11),
(9, 14, 10),
(10, 14, 5),
(11, 14, 4),
(12, 9, 9),
(13, 9, 8),
(14, 9, 7),
(15, 9, 6),
(16, 6, 6),
(17, 6, 7);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `read_notification` enum('yes','no') NOT NULL,
  `message_notification` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `read_notification`, `message_notification`, `user_id`) VALUES
(1, 'no', 'pawitaircraft following you', 5),
(2, 'no', 'pawitaircraft following you', 7),
(3, 'no', 'pawitaircraft following you', 10),
(4, 'no', 'asspawit following you', 7),
(5, 'no', 'asspawit following you', 5),
(6, 'no', 'asspawit following you', 11),
(7, 'no', 'kidneyspawit following you', 12),
(8, 'no', 'kidneyspawit following you', 6);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `caption` varchar(100) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `caption`, `create_at`, `user_id`) VALUES
(1, 'This awesome!', '2023-02-02 03:42:59', 14),
(2, 'I\'m Good!', '2023-02-02 03:50:13', 14),
(3, 'Look at views.?', '2023-02-02 11:17:09', 4),
(4, 'My First post lul :3', '2023-02-02 11:20:53', 5),
(5, 'Time to vacation.', '2023-02-02 11:22:07', 5),
(6, 'Dream Hope And Past.', '2023-02-02 11:24:03', 6),
(7, 'grow up>//<', '2023-02-02 11:28:42', 6),
(8, 'did you saw that?', '2023-02-02 11:29:42', 9),
(9, 'Some day i\'m just tired', '2023-02-02 11:31:47', 9),
(10, 'Life is too short to waste it.', '2023-02-02 11:33:40', 7),
(11, ' Some beautiful paths can’t be discovered without getting lost.', '2023-02-02 11:35:53', 7);

-- --------------------------------------------------------

--
-- Table structure for table `posts_media`
--

CREATE TABLE `posts_media` (
  `post_media_id` int(11) NOT NULL,
  `media_files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`media_files`)),
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts_media`
--

INSERT INTO `posts_media` (`post_media_id`, `media_files`, `post_id`) VALUES
(1, '[\"2023-02-02_1675309373943.png\"]', 1),
(2, '[\"2023-02-02_1675309807556.png\",\"2023-02-02_1675309812479.png\"]', 2),
(3, '[\"2023-02-02_1675336613233.png\"]', 3),
(4, '[\"2023-02-02_1675336851999.png\"]', 4),
(5, '[\"2023-02-02_1675336919631.png\"]', 5),
(6, '[\"2023-02-02_1675337041659.png\"]', 6),
(7, '[\"2023-02-02_1675337311392.png\"]', 7),
(8, '[\"2023-02-02_1675337366422.png\"]', 8),
(9, '[\"2023-02-02_1675337444050.png\"]', 9),
(10, '[\"2023-02-02_1675337618671.png\"]', 10),
(11, '[\"2023-02-02_1675337748410.png\"]', 11);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `profile_name` varchar(100) NOT NULL,
  `profile_pic` varchar(100) DEFAULT NULL,
  `bio` varchar(200) DEFAULT NULL,
  `role` varchar(100) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `profile_name`, `profile_pic`, `bio`, `role`, `create_at`) VALUES
(4, 'pawitaircraft', 'pawitaircraft@example.com', '$2y$10$H6rgaVM.l0f/SDqbYSAXwOpFb.GlbbvaZ1CoktbnnYZ8teOZPxoEu', 'pawitaircraft', '4.jpg', 'hello', 'user', '2023-02-02 03:20:48'),
(5, 'pawitsole', 'pawitsole@example.com', '$2y$10$lgSC.hXC61mtzhnwLCoMSOHHIZ66QvyFVVUoAGaw2SwDvh1UIx/Oa', 'pawitsole', '5.jpg', NULL, 'user', '2023-02-02 03:21:14'),
(6, 'canpawit', 'canpawit@example.com', '$2y$10$Hfx8sXBr0MOlwbAEG3q.0ukMEq1DAlwV4hgI9WrxlpI.7v/FIoxCG', 'canpawit', '6.jpg', NULL, 'user', '2023-02-02 03:21:42'),
(7, 'pawitflee', 'pawitflee@example.com', '$2y$10$PRkKQujKT/MetiIUfAF7RusipjPzePoJFT9HcwY/.vNfJAR0Ij8R.', 'pawitflee', '7.jpg', NULL, 'user', '2023-02-02 03:22:07'),
(8, 'pawitpacified', 'pawitpacified@example.com', '$2y$10$nw68LuMpxGY1gN1K.U3g3e71KY2iA8O4SVJeY.qn02kRbzMYNfTLy', 'pawitpacified', '8.jpg', NULL, 'user', '2023-02-02 03:22:34'),
(9, 'kidneyspawit', 'kidneyspawit@example.com', '$2y$10$aEbCx.lLA5LMOBea0OXRx.MSxx.axqp.2PHQtHMD5B9tSeylCzQrC', 'kidneyspawit', '9.jpg', NULL, 'user', '2023-02-02 03:23:10'),
(10, 'pawitplease', 'pawitplease@example.com', '$2y$10$merev8DNb4UL21Nh/F4CxeVSzB9UBOcwk.j3XoM57dZiR.bkNQJti', 'pawitplease', '10.jpg', NULL, 'user', '2023-02-02 03:23:43'),
(11, 'pawittrainer', 'pawittrainer@example.com', '$2y$10$qYaZI5eOTcq5lUaR.h19pecrKAm9r7aWm/DWbCuFZ8qnKkRLQ4Up.', 'pawittrainer', '11.jpg', NULL, 'user', '2023-02-02 03:24:00'),
(12, 'pawitcavities', 'pawitcavities@example.com', '$2y$10$E0AVc7DJQG64BlWNB2dQOeAznlrCLIBYpnH.AUuTPr0paK4xpLhVS', 'pawitcavities', '12.jpg', NULL, 'user', '2023-02-02 03:24:20'),
(13, 'pawitworshipper', 'pawitworshipper@example.com', '$2y$10$NdVVgKzQf5HOaC4qYrYUF.gp7c9xyxBHJPsp8oiDaOsWegXimyg8G', 'pawitworshipper', '13.jpg', NULL, 'user', '2023-02-02 03:24:42'),
(14, 'asspawit', 'asspawit@example.com', '$2y$10$m.thR49eMEy5KMKVbPQeoOPwhzszK3Zj51B8Ln6sioAjBGCvuOh5q', 'asspawit', '14.jpg', 'Feeling Good!', 'user', '2023-02-02 03:31:37'),
(15, 'pawitflee', 'pawitflee@example.com', '$2y$10$PRkKQujKT/MetiIUfAF7RusipjPzePoJFT9HcwY/.vNfJAR0Ij8R.', 'pawitflee', '15.jpg', NULL, 'user', '2023-02-02 03:22:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`follow_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`like_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts_media`
--
ALTER TABLE `posts_media`
  ADD PRIMARY KEY (`post_media_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `follow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `posts_media`
--
ALTER TABLE `posts_media`
  MODIFY `post_media_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `posts_media`
--
ALTER TABLE `posts_media`
  ADD CONSTRAINT `posts_media_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
