-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2020 at 02:54 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gemili`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `user` varchar(12) NOT NULL,
  `email` varchar(30) NOT NULL,
  `message` text NOT NULL,
  `timestamp` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`user`, `email`, `message`, `timestamp`) VALUES
('test', 'test@test.com', 'sawqwqwqw', 'Sun Feb 02 2020'),
('asasas', 'asas@asas.com', 'asasasasa', 'Sun Feb 02 2020'),
('asasas', 'asas@asasasa.com', 'asasas1111', 'Sun Feb 02 2020');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `item_no` int(11) NOT NULL,
  `category` varchar(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `image` text NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`item_no`, `category`, `type`, `name`, `description`, `price`, `image`, `stock`) VALUES
(1, 'furniture', 'none', 'JERA', '{\"textone\": \"Rectangular, wooden desk with mobile drawers and handrail with white gray color. Included products: Black chairs with aluminium bases.\",\"length\": \"120 cm\",\"width\": \"80 cm\",\"height\": \"74 cm\",\"texttwo\": \"Excellent set for manager\'s room, perfectly designed to fit in with any color palette and room design\",\"origin\":\"Italy\"}', 100, 'IMG/Furniture/Furniture1.jpg', 50),
(2, 'furniture', 'none', 'JULIO', '{\"textone\": \"Modern, wooden desk with aluminium frame and small mobile drawers in platinum color. Included products: Black executive chair.\",\"length\": \"130 cm\",\"width\": \"75 cm\",\"height\": \"72 cm\",\"texttwo\": \"Perfect set for large open rooms, the sharp edges and skewed frame project elegance and timelessness\",\"origin\":\"Italy\"}', 120, 'IMG/Furniture/Furniture2.jpg', 50),
(3, 'furniture', 'none', 'DELTA EVO', '{\"textone\": \"Big glass desk with aluminium frame and small mobile drawers in black and grey color. Included products: Black executive chair and a small black waiting chair.\",\"length\": \"130 cm\",\"width\": \"75 cm\",\"height\": \"72 cm\",\"texttwo\": \"Perfect modern office sets for light and open spaces\",\"origin\":\"Italy\"}', 500, 'IMG/Furniture/Furniture4.jpg', 50),
(13, 'furniture', 'none', 'ENOSI EVO', '{\"textone\": \"Modern thick wooden desk with handrail and auxiliary module mixed with two colors Beech bright oaks and Black. Included products: Black executive chair.\",\"length\": \"120 cm\",\"width\": \"74 cm\",\"height\": \"80 cm\",\"texttwo\": \"Modern minimalism at its best. The open feel of the table combines well with any space, large or small\",\"origin\":\"Italy\"}', 1750, 'IMG/Furniture/Showcase6.jpg', 50),
(14, 'furniture', 'none', 'EOS', '{\"textone\": \"Two desks combined together in a T shape with handrail and auxiliary module mixed with two colors, Tiepolo Nut and Logan oak. Included products: Black executive chair and two small waiting chairs.\",\"length\": \"144 cm\",\"width\": \"87 cm\",\"height\": \"85 cm\",\"texttwo\": \"Mix of old classic and new sophisticated design mellowed with sharp and rustic edges\",\"origin\":\"Italy\"}', 1100, 'IMG/Furniture/Showcase5.jpg', 50),
(15, 'furniture', 'none', 'SEVENTIES', '{\"textone\": \"Modern thick wooden desk with handrail and auxiliary module mixed with two colors Beech bright oaks and Black. Included products: Black executive chair.\",\"length\": \"144 cm\",\"width\": \"87 cm\",\"height\": \"85 cm\",\"texttwo\": \"Office set designed for small and medium rooms. Comes in black, gray and brown versions\",\"origin\":\"Italy\"}', 1600, 'IMG/Furniture/Showcase4.jpg', 50),
(16, 'furniture', 'none', 'OXI', '{\"textone\": \"Executive wooden desk with nice dark brown finish auxiliary module and handrail in lighter color. Included products: Tall Gray Executive chair and 2 small black waiting chairs\r\n. Included products: Black executive chair.\",\"length\": \"120 cm\",\"width\": \"74 cm\",\"height\": \"80 cm\",\"texttwo\": \"Sophisticated elegance that can be combined with lighter and darker furniture\",\"origin\":\"Italy\"}', 1800, 'IMG/Furniture/Showcase3.jpg', 50),
(17, 'furniture', 'none', 'LOGIC', '{\"textone\": \"Executive wooden desk with nice Aragon oak finish auxiliary module and handrail in black color. Included products: Tall White, Gray Executive chair and a small white grey waiting chair.\",\"length\": \"120 cm\",\"width\": \"74 cm\",\"height\": \"80 cm\",\"texttwo\": \"Sophisticated elegance that can be combined with lighter and darker furniture\",\"origin\":\"Italy\"}', 1450, 'IMG/Furniture/Showcase2.jpg', 50),
(18, 'furniture', 'none', 'OYO', '{\"textone\": \"Executive wooden desk with nice darker Aragon oak finish auxiliary module and handrail in black color Included products: Tall Black Executive chair and a small black waiting chair.\",\"length\": \"120 cm\",\"width\": \"74 cm\",\"height\": \"80 cm\",\"texttwo\": \"Sophisticated elegance that can be combined with lighter and darker furniture\",\"origin\":\"Italy\"}', 1200, 'IMG/Furniture/Showcase1.jpg', 50),
(19, 'chairs', 'executive', 'Marianna', '{\"text\": \"Working Armchair with hard castors 50 mm, metal chrome base, with plastic brushed arms and multi block mechanism. Trendy yet classy. \",\"mechanism\": \"Multi block\",\"base\": \"Polished Aluminum\",\"finish\": \"IMIT. LEATHER / ECO\",\"height\": \"1200-1325 mm\",\"seatwidth\": \"530/450 mm\",\"color\": \"White gray and Black\",\"origin\": \"Italy\"}', 100, 'IMG/executive/1marianna.jpg\r\n', 50),
(20, 'chairs', 'executive', 'Marianna', '{\"text\": \"Working Armchair with hard castors 50 mm, metal chrome base, with plastic brushed arms and multi block mechanism. Trendy yet classy. \",\"mechanism\": \"Multi block\",\"base\": \"Polished Aluminum\",\"finish\": \"IMIT. LEATHER / ECO\",\"height\": \"1200-1325 mm\",\"seatwidth\": \"530/450 mm\",\"color\": \"White gray and Black\",\"origin\": \"Italy\"}', 100, 'IMG/executive/1marianna.jpg\r\n', 50),
(21, 'chairs', 'executive', 'Prizma', '{\"text\": \"Working Armchair with soft castors 65 mm with arms and multi block mechanism. Comfort, one of its many key features. \",\"mechanism\": \"Multi block \",\"base\": \"Poly amide\",\"finish\": \"Leather\",\"height\": \"1180-1255 mm\",\"seatwidth\": \"400/445 mm\",\"color\": \"Black Leather and Dark Blue\",\"origin\": \"Italy\"}', 150, 'IMG/executive/2prizma.jpg\r\n', 50),
(22, 'chairs', 'executive', 'Premier', '{\"text\": \"Working Armchair with hard castors 50 mm, Aluminum base, with wooden arms and relax mechanism. Old school never goes out of fashion.\",\"mechanism\": \"TILT\",\"base\": \"Polished Aluminum\",\"finish\": \"IMIT. LEATHER ECO\",\"height\": \"1140-1225 mm\",\"seatwidth\": \"530/450 mm\",\"color\": \"Black and White Gray\",\"origin\": \"Italy\"}', 200, 'IMG/executive/3premier.jpg\r\n', 50),
(23, 'chairs', 'executive', 'Zelda', '{\"text\": \"Working Armchair with hard castors 50 mm, aluminum base, with arms and multi block mechanism. Modern and Compact.\",\"mechanism\": \"ERGON\",\"base\": \"Polished Aluminum\",\"finish\": \"Leather\",\"height\": \"960-1055 mm\",\"seatwidth\": \"440/465 mm\",\"color\": \"White and Light Grey\",\"origin\": \"Italy\"}', 250, 'IMG/executive/4zelda.jpg\r\n', 50),
(24, 'chairs', 'executive', 'Gala', '{\"text\": \"Working Armchair with soft castors 65 mm, aluminum base, aluminum arms and Syncro mechanism. Elegance, one of its many key features.\",\"mechanism\": \"Syncro\",\"base\": \"Polished Aluminum\",\"finish\": \"Leather / ECO\",\"height\": \"850-975 mm\",\"seatwidth\": \"450/430 mm\",\"color\": \"Red and White\",\"origin\": \"Italy\"}', 300, 'IMG/executive/5gala.jpg\r\n', 50),
(25, 'chairs', 'executive', 'Ray', '{\"text\": \"Working Armchair with hard castors 50 mm, aluminum base, aluminum arms and ERGON mechanism. Modern and Lite.\",\"mechanism\": \"ERGON\",\"base\": \"Polished Aluminum\",\"finish\": \"Leather / ECO\",\"height\": \"960-1085 mm\",\"seatwidth\": \"440/465 mm\",\"color\": \"White and Light Grey\",\"origin\": \"Italy\"}', 350, 'IMG/executive/6ray.jpg\r\n', 50),
(26, 'chairs', 'executive', 'Kroma', '{\"text\": \"Working Armchair with soft castors 65 mm, aluminum base, arms and multi block mechanism. Modern chair for the modern age.\",\"mechanism\": \"Multi block\",\"base\": \"Polished Aluminum\",\"finish\": \"Fabric\",\"height\": \"1260-1385 mm\",\"seatwidth\": \"440/465 mm\",\"color\": \"Blue, Black, Grey and White\",\"origin\": \"Italy\"}', 400, 'IMG/executive/7kroma.jpg\r\n', 50),
(27, 'chairs', 'executive', 'Moteo', '{\"text\": \"Working Armchair with soft castors, Aluminum base, with Aluminum arms and ERGON mechanism.\",\"mechanism\": \"ERGON\",\"base\": \"Polished Aluminum\",\"finish\": \"Leather\",\"height\": \"1200-1325 mm\",\"seatwidth\": \"400/445 mm\",\"color\": \"Brown, Red, Black and White\",\"origin\": \"Italy\"}', 450, 'IMG/executive/8moteo.jpg\r\n', 50),
(28, 'chairs', 'executive', 'Towar', '{\"text\": \"Working Armchair with soft castors 65 mm with arms and multi block mechanism. Innovative First class for the modern age.\",\"mechanism\": \"Multi block\",\"base\": \"poly amide\",\"finish\": \"IMIT. LEATHER / ECO\",\"height\": \"1180-1255 mm\",\"seatwidth\": \"400/445 mm\",\"color\": \"Custom\",\"origin\": \"Italy\"}', 500, 'IMG/executive/9towar.jpg\r\n', 50),
(29, 'chairs', 'operative', 'JERA', '{\"text\": \"Working Armchair with hard castors 50 mm, polished aluminum base, with aluminum arms and siphon mechanism with 2 handles.\",\"mechanism\": \"Siphon\",\"base\": \"Polished Aluminum\",\"finish\": \"Fabric\",\"height\": \"970-1025 mm\",\"seatwidth\": \"470/430 mm\",\"color\": \"Light Green, Red and Blue\",\"origin\": \"Italy\"}', 100, 'IMG/operative/1JERA.jpg\r\n', 50),
(30, 'chairs', 'operative', 'JULIO', '{\"text\": \"Working Armchair with soft castors 60 mm, polished aluminum base, with plastic arms and siphon mechanism with 2 handles.\",\"mechanism\": \"Siphon\",\"base\": \"Polished Aluminum\",\"finish\": \"Fabric\",\"height\": \"970-1025 mm\",\"seatwidth\": \"470/430 mm\",\"color\": \"White Grey and Black\",\"origin\": \"Italy\"}', 150, 'IMG/operative/2JULIO.jpg\r\n', 50),
(31, 'chairs', 'operative', 'DELTA', '{\"text\": \"Working Armchair with soft castors 65 mm with arms and Multi block mechanism. Comfort, one of its many key features.\",\"mechanism\": \"Multi block\",\"base\": \"Polished Aluminum\",\"finish\": \"Fabric\",\"height\": \"1180-1255 mm\",\"seatwidth\": \"400/445 mm\",\"color\": \"Black, Grey and Dark Blue\",\"origin\": \"Italy\"}', 200, 'IMG/operative/3DELTA.jpg\r\n', 50),
(32, 'chairs', 'operative', 'LEO', '{\"text\": \"Working Armchair with hard castors 50 mm, nylon black base, fixed mechanism. Simple and Lite.\",\"mechanism\": \"Fixed\",\"base\": \"Nylon\",\"finish\": \"Fabric\",\"height\": \"960-1085 mm\",\"seatwidth\": \"440/465 mm\",\"color\": \"Green, Blue,Red, and Brown\",\"origin\": \"Italy\"}', 250, 'IMG/operative/4LEO.jpg\r\n', 50),
(33, 'chairs', 'operative', 'BAR', '{\"text\": \"Working chair with hard castors 50 mm, polished aluminum base and fixed mechanism.\",\"mechanism\": \"Fixed\",\"base\": \"Polished Aluminum\",\"finish\": \"Soft Plastic\",\"height\": \"960-1085 mm\",\"seatwidth\": \"440/465 mm\",\"color\": \"Black\",\"origin\": \"Italy\"}', 300, 'IMG/operative/5BAR.jpg\r\n', 50),
(34, 'chairs', 'operative', 'FORMEN', '{\"text\": \"Working chair with soft castors 65 mm, plastic base and fixed mechanism. Basic for everyday use.\",\"mechanism\": \"Fixed\",\"base\": \"Plastic\",\"finish\": \"Fabric\",\"height\": \"960-1045 mm\",\"seatwidth\": \"430/455 mm\",\"color\": \"Blue, Black, Grey and White\",\"origin\": \"Italy\"}', 350, 'IMG/operative/6FORMEN.jpg\r\n', 50),
(35, 'chairs', 'operative', 'LEAD', '{\"text\": \"Working Armchair with soft castors, Aluminum base, with Aluminum/Plastic arms and ERGON mechanism.\",\"mechanism\": \"ERGON\",\"base\": \"Polished Aluminum\",\"finish\": \"Fabric\",\"height\": \"1200-1325 mm\",\"seatwidth\": \"400/445 mm\",\"color\": \"Brown, Red, Black and White\",\"origin\": \"Italy\"}', 400, 'IMG/operative/7LEAD.jpg\r\n', 50),
(36, 'chairs', 'operative', 'SX', '{\"text\": \"Working chair with hard castors, Aluminum base and fixed mechanism.\",\"mechanism\": \"Fixed\",\"base\": \"Polished Aluminum\",\"finish\": \"Soft Plastic\",\"height\": \"1100-1225 mm\",\"seatwidth\": \"430/465 mm\",\"color\": \"Black\",\"origin\": \"Italy\"}', 450, 'IMG/operative/8SX.jpg\r\n', 50),
(37, 'chairs', 'operative', 'KIND', '{\"text\": \"Working Armchair with soft castors 60 mm, Aluminum base, with Aluminum/Plastic arms and ERGON mechanism with 2 handles.\",\"mechanism\": \"ERGON\",\"base\": \"Polished Aluminum\",\"finish\": \"Fabric / Leather\",\"height\": \"1175-1225 mm\",\"seatwidth\": \"445/465 mm\",\"color\": \"Brown, Red, Black and White\",\"origin\": \"Italy\"}', 500, 'IMG/operative/9KIND.jpg\r\n', 50),
(38, 'chairs', 'waiting', 'SONYA', '{\"text\": \"\",\"mechanism\": \"\",\"base\": \"\",\"finish\": \"\",\"height\": \"\",\"seatwidth\": \"\",\"color\": \"\",\"origin\": \"\"}', 100, 'IMG/waiting/1.jpg\r\n', 50),
(39, 'chairs', 'waiting', 'TINA', '{\"text\": \"\",\"mechanism\": \"\",\"base\": \"\",\"finish\": \"\",\"height\": \"\",\"seatwidth\": \"\",\"color\": \"\",\"origin\": \"\"}', 150, 'IMG/waiting/2.jpg\r\n', 50),
(40, 'chairs', 'waiting', 'JENNA', '{\"text\": \"\",\"mechanism\": \"\",\"base\": \"\",\"finish\": \"\",\"height\": \"\",\"seatwidth\": \"\",\"color\": \"\",\"origin\": \"\"}', 200, 'IMG/waiting/3.jpg\r\n', 50),
(41, 'chairs', 'waiting', 'HANNA', '{\"text\": \"\",\"mechanism\": \"\",\"base\": \"\",\"finish\": \"\",\"height\": \"\",\"seatwidth\": \"\",\"color\": \"\",\"origin\": \"\"}', 100, 'IMG/waiting/4.jpg\r\n', 50),
(42, 'chairs', 'waiting', 'MOIRA', '{\"text\": \"\",\"mechanism\": \"\",\"base\": \"\",\"finish\": \"\",\"height\": \"\",\"seatwidth\": \"\",\"color\": \"\",\"origin\": \"\"}', 100, 'IMG/waiting/5.jpg\r\n', 50),
(43, 'chairs', 'waiting', 'LYLA', '{\"text\": \"\",\"mechanism\": \"\",\"base\": \"\",\"finish\": \"\",\"height\": \"\",\"seatwidth\": \"\",\"color\": \"\",\"origin\": \"\"}', 100, 'IMG/waiting/6.jpg\r\n', 50),
(44, 'chairs', 'waiting', 'LENA', '{\"text\": \"\",\"mechanism\": \"\",\"base\": \"\",\"finish\": \"\",\"height\": \"\",\"seatwidth\": \"\",\"color\": \"\",\"origin\": \"\"}', 100, 'IMG/waiting/7.jpg\r\n', 50),
(45, 'chairs', 'waiting', 'EMMA', '{\"text\": \"\",\"mechanism\": \"\",\"base\": \"\",\"finish\": \"\",\"height\": \"\",\"seatwidth\": \"\",\"color\": \"\",\"origin\": \"\"}', 100, 'IMG/waiting/8.jpg\r\n', 50),
(46, 'chairs', 'waiting', 'ZINA', '{\"text\": \"\",\"mechanism\": \"\",\"base\": \"\",\"finish\": \"\",\"height\": \"\",\"seatwidth\": \"\",\"color\": \"\",\"origin\": \"\"}', 100, 'IMG/waiting/9.jpg\r\n', 50);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `account_no` int(8) NOT NULL,
  `name` varchar(12) NOT NULL,
  `lastname` varchar(12) NOT NULL,
  `username` varchar(12) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(16) NOT NULL,
  `address` tinytext NOT NULL,
  `image` varchar(30) NOT NULL,
  `history` text NOT NULL,
  `token` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`account_no`, `name`, `lastname`, `username`, `email`, `password`, `address`, `image`, `history`, `token`) VALUES
(5, 'test', 'test', 'test', 'test@test.com', '1111', 'test', 'uploads/test.png', '[{\"item_no\":\"4\",\"category\":\"chairs\",\"name\":\"item4\",\"description\":\"desc for item 4\",\"price\":\"10\",\"image\":\"IMG/Chairs/Chair12.jpg\",\"stock\":\"50\",\"quantity\":\"2\"}]', '1e3df29f7d2903111e3f'),
(6, 'ashgasdas', 'asdasd', 'asdasd', 'sasa@asas.com', '2222', 'asasas', 'uploads/asdasd.png', '{}', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`item_no`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`account_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `item_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `account_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
