/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jobsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int NOT NULL,
  `title` varchar(256) NOT NULL,
  `salary` int NOT NULL,
  `location` varchar(256) NOT NULL,
  `type` varchar(256) NOT NULL,
  `date` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `title`, `salary`, `location`, `type`, `date`) VALUES
(1, 'Graphic Designer', 2000, 'Houston', 'Freelance', '2021-09-15'),
(2, 'Project Manager', 4000, 'Dallas', 'Contract', '2021-09-10'),
(3, 'Product Designer', 3000, 'Austin', 'Full Time', '2021-09-03'),
(4, 'Marketing Manager', 4500, 'Amarillo', 'Full Time', '2021-09-12'),
(5, 'Content Engineer', 3000, 'San Antonio', 'Remote', '2021-08-07'),
(6, 'People Operations Manager', 2900, 'El Paso', 'Full Time', '2021-09-08'),
(7, 'Sales Executive', 2000, 'Arlington', 'Full Time', '2021-08-13'),
(8, 'Community Manager', 2700, 'Texas City', 'Remote', '2021-08-27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`) VALUES
('flagholder', 'HTB{f4k3_fl4g_f0r_t3st1ng}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
