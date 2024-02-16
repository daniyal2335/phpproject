-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2024 at 05:32 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `daniyal`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `salaryInc` (`e_id` INT, `e_salary` INT)   BEGIN
UPDATE faculty SET salary = salary + e_salary WHERE id = e_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `salInc` (`e_id` INT, `e_inc` INT)   BEGIN
UPDATE faculty SET salary =  salary + e_inc WHERE id = e_id ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `salinc2` (`e_id_start` INT, `e_id_end` INT, `e_inc` INT)   BEGIN
UPDATE faculty set salary=salary+e_inc where id between e_id_start AND e_id_end;
END
-- call salinc2(2,4,5000)
-- BEGIN
-- IF e_inc>0 THEN
/*ELSE
SELECT "you can't enter negative value";

End if;
END*/$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `salinc3` (`e_id_start` INT, `e_id_end` INT, `e_inc` INT)   BEGIN
IF e_inc>0 THEN
BEGIN
UPDATE faculty set salary=salary+e_inc where id between e_id_start AND e_id_end;
END;
ELSE
SELECT "you can't enter negative value";
End if;
END

 -- call salinc2(2,4,-5000)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
(1, 'apple'),
(2, 'samsung'),
(3, 'sogo');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `des` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `des`) VALUES
(1, 'mobiles', 'abc'),
(2, 'laptops', 'hello'),
(3, 'watches', 'hello abc');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `des` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `des`, `image`) VALUES
(7, 'mobile', 'abc', 'images.jpg'),
(8, 'bags', 'abc', 'b.jpg'),
(9, 'watches', 'abc', 'download (1).jpg');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `department` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id`, `name`, `salary`, `department`) VALUES
(1, 'Sir Mujahid', 100000, 'Mathematics'),
(2, 'Sir Alvi', 100000, 'Chemistry'),
(3, 'Sir Shabbir', 120000, 'Mathematics'),
(4, 'Sir hamza', 80000, 'Chemistry'),
(5, 'sohial', 55000, 'admin');

-- --------------------------------------------------------

--
-- Stand-in structure for view `myallproductsdata`
-- (See below for the actual view)
--
CREATE TABLE `myallproductsdata` (
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `mydata`
-- (See below for the actual view)
--
CREATE TABLE `mydata` (
);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `des` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `prize` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `c_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `des`, `image`, `prize`, `quantity`, `c_id`) VALUES
(1, 'royal', 'abc', 'download.jpeg', 4500, 1, 4),
(2, 'readme', 'abc', 'SV-8164_Cam002M1.webp', 5000, 1, 4),
(4, 'royal', 'abc', 'cover pages.png', 500, 1, 3),
(6, 'samsung', 'abc', 's.jpg', 70000, 1, 7),
(7, 'infinix', 'abc', 'i.jpg', 35000, 1, 7),
(8, 'buy imported', 'abc', 'b.jpeg', 4500, 1, 8),
(9, 'fashion bags', 'abc', 'b2.webp', 5000, 1, 8),
(10, 'royal', 'abc', 'r.png', 6000, 1, 9),
(11, 'canon', 'abc', 'c.jpg', 3000, 1, 9);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `age` int(11) DEFAULT NULL CHECK (`age` > 18),
  `city` varchar(200) DEFAULT 'karachi',
  `f_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `email`, `gender`, `age`, `city`, `f_id`) VALUES
(1, 'ali', 'ali@gmail.com', 'male', 22, 'quetta', 2),
(2, 'aqsa', 'ali1@gmail.com', 'female', 22, 'lahore', 2),
(4, 'hamza khan', 'hamza@gmail.com', 'male', 22, 'quetta', 4),
(5, 'alisha', 'alisha@gmail.com', 'female', 24, 'islamabad', 2),
(6, 'meerab khan', 'meerab@gmail.com', 'female', 25, 'quetta', NULL),
(7, 'meerab', 'meerab12@gmail.com', 'female', 23, 'karachi', NULL),
(8, 'ali', 'ali12@gmail.com', 'male', 25, 'karachi', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` int(200) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 3,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role_id`, `status`) VALUES
(1, 'admin', 'admin@gmail.com', 123, 1, 0),
(3, 'hospital', 'hospital@gmail.com', 123, 3, 2),
(4, 'doctor', 'doctor@gmail.com', 123, 2, 1),
(5, 'hospital', 'hospital@gmail.com', 123, 3, 1),
(6, 'admin@gmail.com', '', 123, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role_id`) VALUES
(2, 'daniyalkhanh', 'daniyal123@gmail.com', '12daniyal', 2),
(4, 'hamza', 'hamza@gmail.com', '3455', 2),
(6, 'admin', 'admin@gmail.com', '123', 1);

-- --------------------------------------------------------

--
-- Structure for view `myallproductsdata`
--
DROP TABLE IF EXISTS `myallproductsdata`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `myallproductsdata`  AS SELECT `products`.`name` AS `name`, `products`.`price` AS `price`, `products`.`des` AS `des`, `categories`.`name` AS `category name`, `brands`.`name` AS `brand name` FROM ((`products` join `categories` on(`products`.`c_id` = `categories`.`id`)) join `brands` on(`products`.`b_id` = `brands`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `mydata`
--
DROP TABLE IF EXISTS `mydata`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mydata`  AS SELECT `products`.`name` AS `Product Name`, `products`.`price` AS `price`, `categories`.`name` AS `Category Name`, `brands`.`name` AS `Brand Name` FROM ((`products` join `categories` on(`products`.`c_id` = `categories`.`id`)) join `brands` on(`products`.`b_id` = `brands`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `f_id` (`f_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `faculty` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
