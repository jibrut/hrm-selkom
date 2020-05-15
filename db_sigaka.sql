-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2019 at 01:20 AM
-- Server version: 10.1.38-MariaDB
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
-- Database: `db_sigaka`
--

-- --------------------------------------------------------

--
-- Table structure for table `sigaka_absen`
--

CREATE TABLE `sigaka_absen` (
  `absen_id` varchar(20) NOT NULL,
  `absen_karyawan_id` varchar(20) NOT NULL,
  `absen_hari` varchar(10) NOT NULL,
  `absen_status` enum('lembur','normal') NOT NULL DEFAULT 'normal',
  `absen_date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sigaka_absen`
--

INSERT INTO `sigaka_absen` (`absen_id`, `absen_karyawan_id`, `absen_hari`, `absen_status`, `absen_date_created`) VALUES
('ABS-45434', 'PEG-76226', 'Sabtu', 'normal', '2019-08-03 22:17:14'),
('ABS-74757', 'PEG-74722', 'Senin', 'lembur', '2019-07-15 14:12:37'),
('ABS-76293', 'PEG-76226', 'Senin', 'lembur', '2019-07-15 14:38:13');

-- --------------------------------------------------------

--
-- Table structure for table `sigaka_gaji`
--

CREATE TABLE `sigaka_gaji` (
  `gaji_id` varchar(20) NOT NULL,
  `gaji_karyawan_id` varchar(20) NOT NULL,
  `gaji_lembur` int(20) DEFAULT '0',
  `gaji_total` int(20) NOT NULL,
  `gaji_bayar_pinjaman` int(20) NOT NULL,
  `gaji_tanggal` date DEFAULT NULL,
  `gaji_bulan_ke` int(11) DEFAULT NULL,
  `gaji_status` enum('sudah','belum') NOT NULL DEFAULT 'belum',
  `gaji_date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sigaka_gaji`
--

INSERT INTO `sigaka_gaji` (`gaji_id`, `gaji_karyawan_id`, `gaji_lembur`, `gaji_total`, `gaji_bayar_pinjaman`, `gaji_tanggal`, `gaji_bulan_ke`, `gaji_status`, `gaji_date_created`) VALUES
('GJI-74757', 'PEG-74722', 35000, 35000, 0, '2019-07-15', 1, 'sudah', '2019-07-15 14:12:37'),
('GJI-76293', 'PEG-76226', 35000, 70000, 30000, '2019-08-03', 1, 'sudah', '2019-07-15 14:38:13');

-- --------------------------------------------------------

--
-- Table structure for table `sigaka_jabatan`
--

CREATE TABLE `sigaka_jabatan` (
  `jabatan_id` varchar(20) NOT NULL,
  `jabatan_nama` varchar(255) DEFAULT NULL,
  `jabatan_gaji` int(20) DEFAULT NULL,
  `jabatan_date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sigaka_jabatan`
--

INSERT INTO `sigaka_jabatan` (`jabatan_id`, `jabatan_nama`, `jabatan_gaji`, `jabatan_date_created`) VALUES
('JAB-74569', 'Frontliner', 35000, '2019-07-15 14:09:29'),
('JAB-76143', 'frontliner', 35000, '2019-07-15 14:35:43');

-- --------------------------------------------------------

--
-- Table structure for table `sigaka_karyawan`
--

CREATE TABLE `sigaka_karyawan` (
  `karyawan_id` varchar(20) NOT NULL,
  `karyawan_jabatan_id` varchar(20) DEFAULT NULL,
  `karyawan_nama` varchar(255) DEFAULT NULL,
  `karyawan_tempat_lahir` varchar(255) DEFAULT NULL,
  `karyawan_tanggal_lahir` date DEFAULT NULL,
  `karyawan_alamat` text,
  `karyawan_tanggal_gabung` date DEFAULT NULL,
  `karyawan_nomor_hp` varchar(20) DEFAULT NULL,
  `karyawan_no_rekening` varchar(30) DEFAULT NULL,
  `karyawan_date_created` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sigaka_karyawan`
--

INSERT INTO `sigaka_karyawan` (`karyawan_id`, `karyawan_jabatan_id`, `karyawan_nama`, `karyawan_tempat_lahir`, `karyawan_tanggal_lahir`, `karyawan_alamat`, `karyawan_tanggal_gabung`, `karyawan_nomor_hp`, `karyawan_no_rekening`, `karyawan_date_created`) VALUES
('PEG-74722', 'JAB-74569', 'Cucu', 'Pekanbaru', '1997-09-04', 'Disana', '2014-06-14', '081234567890', '', '2019-07-15 14:12:02'),
('PEG-76226', 'JAB-76143', 'widi', 'pku', '2000-07-09', 'pku', '2019-08-03', '081233444433', '', '2019-07-15 14:37:06');

-- --------------------------------------------------------

--
-- Table structure for table `sigaka_pengguna`
--

CREATE TABLE `sigaka_pengguna` (
  `pengguna_id` int(20) NOT NULL,
  `pengguna_username` varchar(255) DEFAULT NULL,
  `pengguna_password` varchar(255) DEFAULT NULL,
  `pengguna_nama` varchar(255) DEFAULT NULL,
  `pengguna_foto` text,
  `pengguna_hak_akses` enum('manajer','owner') DEFAULT NULL,
  `pengguna_date_created` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sigaka_pengguna`
--

INSERT INTO `sigaka_pengguna` (`pengguna_id`, `pengguna_username`, `pengguna_password`, `pengguna_nama`, `pengguna_foto`, `pengguna_hak_akses`, `pengguna_date_created`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Abdul Mustaqim', NULL, 'manajer', '2019-06-28 21:06:43'),
(2, 'owner', '5be057accb25758101fa5eadbbd79503', 'Saptoni Khusni', NULL, 'owner', '2019-07-15 12:27:55');

-- --------------------------------------------------------

--
-- Table structure for table `sigaka_pinjam`
--

CREATE TABLE `sigaka_pinjam` (
  `pinjam_id` varchar(20) NOT NULL,
  `pinjam_karyawan_id` varchar(20) NOT NULL,
  `pinjam_jumlah` int(20) NOT NULL,
  `pinjam_bayar` int(20) NOT NULL DEFAULT '0',
  `pinjam_date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sigaka_pinjam`
--

INSERT INTO `sigaka_pinjam` (`pinjam_id`, `pinjam_karyawan_id`, `pinjam_jumlah`, `pinjam_bayar`, `pinjam_date_created`) VALUES
('PJM-44503', 'PEG-76226', 30000, 30000, '2019-08-03 22:01:43'),
('PJM-74863', 'PEG-74722', 50000, 50000, '2019-07-15 14:14:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sigaka_absen`
--
ALTER TABLE `sigaka_absen`
  ADD PRIMARY KEY (`absen_id`);

--
-- Indexes for table `sigaka_gaji`
--
ALTER TABLE `sigaka_gaji`
  ADD PRIMARY KEY (`gaji_id`);

--
-- Indexes for table `sigaka_jabatan`
--
ALTER TABLE `sigaka_jabatan`
  ADD PRIMARY KEY (`jabatan_id`);

--
-- Indexes for table `sigaka_karyawan`
--
ALTER TABLE `sigaka_karyawan`
  ADD PRIMARY KEY (`karyawan_id`);

--
-- Indexes for table `sigaka_pengguna`
--
ALTER TABLE `sigaka_pengguna`
  ADD PRIMARY KEY (`pengguna_id`);

--
-- Indexes for table `sigaka_pinjam`
--
ALTER TABLE `sigaka_pinjam`
  ADD PRIMARY KEY (`pinjam_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sigaka_pengguna`
--
ALTER TABLE `sigaka_pengguna`
  MODIFY `pengguna_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
