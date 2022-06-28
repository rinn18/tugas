-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2022 at 10:46 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web2`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `id_dosen` int(4) NOT NULL,
  `nama` varchar(22) NOT NULL,
  `telepon` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`id_dosen`, `nama`, `telepon`) VALUES
(1, 'Aamon paxley, S.Pd', '085678903478'),
(2, 'gusion paxley, S.Pd', '082167098444'),
(3, 'guinevere baroque, S.Kom', '089890098765');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int(3) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `nama`) VALUES
(1, 'Sastra Inggris'),
(2, 'Sastra Arab'),
(3, 'Teknik Informatika'),
(4, 'Teknik Kimia');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` char(12) NOT NULL,
  `nama` varchar(22) NOT NULL,
  `id_jurusan` int(3) NOT NULL,
  `alamat` varchar(22) NOT NULL,
  `telepon` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `id_jurusan`, `alamat`, `telepon`) VALUES
('201943501731', 'Arinda', 3, 'Bogor', '083818523712'),
('201921310987', 'nana', 1, 'Jakarta', '081214768788'),
('201943500781', 'miya', 1, 'london', '089123443233'),
('201990900023', 'balmond', 4, 'aceh', '082134356908');

-- --------------------------------------------------------

--
-- Table structure for table `matkul`
--

CREATE TABLE `matkul` (
  `id_matkul` int(4) NOT NULL,
  `id_dosen` int(4) NOT NULL,
  `nama` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `matkul`
--

INSERT INTO `matkul` (`id_matkul`, `id_dosen`, `nama`) VALUES
(1, 3, 'pemrograman'),
(2, 2, 'bahasa arab'),
(3, 1, 'kimia');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(4) NOT NULL,
  `nim` char(12) NOT NULL,
  `id_dosen` int(4) NOT NULL,
  `id_matkul` int(4) NOT NULL,
  `nilai` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `nim`, `id_dosen`, `id_matkul`, `nilai`) VALUES
(1, '20194351731', 3, 1, 98),
(5, '20194351731', 1, 3, 90);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_detail_nilai`
-- (See below for the actual view)
--
CREATE TABLE `v_detail_nilai` (
`nim` char(12)
,`nama_mhs` varchar(22)
,`nama_jurusan` varchar(50)
,`nama_dosen` varchar(22)
,`id_matkul` int(4)
,`nama_matkul` varchar(22)
,`nilai` int(3)
);

-- --------------------------------------------------------

--
-- Structure for view `v_detail_nilai`
--
DROP TABLE IF EXISTS `v_detail_nilai`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_detail_nilai`  AS  select `nilai`.`nim` AS `nim`,`mahasiswa`.`nama` AS `nama_mhs`,`jurusan`.`nama` AS `nama_jurusan`,`dosen`.`nama` AS `nama_dosen`,`nilai`.`id_matkul` AS `id_matkul`,`matkul`.`nama` AS `nama_matkul`,`nilai`.`nilai` AS `nilai` from ((((`nilai` join `mahasiswa` on(`nilai`.`nim` = `mahasiswa`.`nim`)) join `jurusan` on(`mahasiswa`.`id_jurusan` = `jurusan`.`id_jurusan`)) join `dosen` on(`nilai`.`id_dosen` = `dosen`.`id_dosen`)) join `matkul` on(`nilai`.`id_matkul` = `matkul`.`id_matkul`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id_dosen`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`),
  ADD KEY `id_jurusan` (`id_jurusan`),
  ADD KEY `id_jurusan_2` (`id_jurusan`);

--
-- Indexes for table `matkul`
--
ALTER TABLE `matkul`
  ADD PRIMARY KEY (`id_matkul`),
  ADD KEY `id_dosen` (`id_dosen`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `nim` (`nim`),
  ADD KEY `id_dosen` (`id_dosen`),
  ADD KEY `id_matkul` (`id_matkul`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id_dosen` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jurusan` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `matkul`
--
ALTER TABLE `matkul`
  MODIFY `id_matkul` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`);

--
-- Constraints for table `matkul`
--
ALTER TABLE `matkul`
  ADD CONSTRAINT `matkul_ibfk_1` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id_dosen`);

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id_dosen`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_3` FOREIGN KEY (`id_matkul`) REFERENCES `matkul` (`id_matkul`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;