-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 29, 2023 at 03:16 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_imas`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` int NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `aktif` varchar(5) NOT NULL,
  `foto` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `nama_lengkap`, `username`, `password`, `aktif`, `foto`) VALUES
(1, 'Kelompok 1', 'admin@gmail.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Y', 'admin.png');

-- --------------------------------------------------------

--
-- Table structure for table `tb_guru`
--

CREATE TABLE `tb_guru` (
  `id_guru` int NOT NULL,
  `nip` varchar(15) NOT NULL,
  `nama_guru` varchar(120) NOT NULL,
  `email` varchar(65) NOT NULL,
  `password` varchar(100) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_guru`
--

INSERT INTO `tb_guru` (`id_guru`, `nip`, `nama_guru`, `email`, `password`, `foto`, `status`) VALUES
(11, '001', 'Sani Mariyati', 'maryati@gmail.com', 'e193a01ecf8d30ad0affefd332ce934e32ffce72', 'Pengajar Perempuan.png', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tb_master_mapel`
--

CREATE TABLE `tb_master_mapel` (
  `id_mapel` int NOT NULL,
  `kode_mapel` varchar(40) NOT NULL,
  `mapel` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_master_mapel`
--

INSERT INTO `tb_master_mapel` (`id_mapel`, `kode_mapel`, `mapel`) VALUES
(1, 'MP-1561560093', 'Bahasa Indonesia'),
(2, 'MP-1561560129', 'Matematika'),
(3, 'MP-1561871991', 'Biologi'),
(4, 'MP-1561872004', 'Sejarah'),
(5, 'MP-1561872013', 'Teknologi Informasi'),
(6, 'MP-1561872026', 'Seni Budaya'),
(7, 'MP-1561872043', 'Bahasa Inggris'),
(8, 'MP-1615002340', 'Ilmu Pengetahuan Alam');

-- --------------------------------------------------------

--
-- Table structure for table `tb_mengajar`
--

CREATE TABLE `tb_mengajar` (
  `id_mengajar` int NOT NULL,
  `kode_pelajaran` varchar(30) NOT NULL,
  `hari` varchar(40) NOT NULL,
  `jam_mengajar` varchar(60) NOT NULL,
  `jamke` varchar(11) NOT NULL,
  `id_guru` int NOT NULL,
  `id_mapel` int NOT NULL,
  `id_mkelas` int NOT NULL,
  `id_semester` int NOT NULL,
  `id_thajaran` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_mengajar`
--

INSERT INTO `tb_mengajar` (`id_mengajar`, `kode_pelajaran`, `hari`, `jam_mengajar`, `jamke`, `id_guru`, `id_mapel`, `id_mkelas`, `id_semester`, `id_thajaran`) VALUES
(1, 'MPL-1614670924', 'Senin', '09.00-10.00', '1-2', 1, 1, 1, 1, 2),
(2, 'MPL-1614674537', 'Senin', '09.00-10.00', '1-2', 5, 1, 1, 1, 2),
(4, 'MPL-1615004563', 'Senin', '08.00-09.00', '1', 6, 2, 3, 2, 2),
(5, 'MPL-1616288498', 'Rabu', '09.00-10.00', '2', 8, 7, 1, 2, 2),
(6, 'MPL-1582242668', 'Senin', '08.00-09.00', '1', 5, 1, 1, 4, 8),
(8, 'MPL-1690576571', 'Selasa', '07.00-09.00', '1-2', 10, 2, 16, 4, 8),
(9, 'MPL-1690642174', 'Senin', '08.00-09.30', '1-2', 11, 2, 16, 4, 8),
(10, 'MPL-1690642575', 'Senin', '08.00-09.30', '1-2', 11, 2, 16, 4, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tb_mkelas`
--

CREATE TABLE `tb_mkelas` (
  `id_mkelas` int NOT NULL,
  `kd_kelas` varchar(40) NOT NULL,
  `nama_kelas` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_mkelas`
--

INSERT INTO `tb_mkelas` (`id_mkelas`, `kd_kelas`, `nama_kelas`) VALUES
(5, 'KL-1616673105', 'I Ibtidaiyah'),
(6, 'KL-1616673114', 'II Ibtidaiyah'),
(7, 'KL-1616673120', 'III Ibtidaiyah'),
(8, 'KL-1688835906', 'IV Ibtidaiyah'),
(9, 'KL-1688835921', 'V Ibtidaiyah'),
(10, 'KL-1688835932', 'VI Ibtidaiyah'),
(11, 'KL-1688835940', 'VII Tsanawiyah'),
(12, 'KL-1688835954', 'VIII Tsanawiyah'),
(13, 'KL-1688835968', 'IX  Tsanawiyah'),
(14, 'KL-1688835987', 'X Aliyah'),
(15, 'KL-1688836301', 'XI Aliyah'),
(16, 'KL-1688836318', 'XII Aliyah');

-- --------------------------------------------------------

--
-- Table structure for table `tb_semester`
--

CREATE TABLE `tb_semester` (
  `id_semester` int NOT NULL,
  `semester` varchar(45) NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_semester`
--

INSERT INTO `tb_semester` (`id_semester`, `semester`, `status`) VALUES
(4, 'Ganjil', 1),
(5, 'Genap', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `id_siswa` int NOT NULL,
  `nis` varchar(60) NOT NULL,
  `nama_siswa` varchar(120) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jk` varchar(30) NOT NULL,
  `alamat` text NOT NULL,
  `password` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` varchar(15) NOT NULL,
  `th_angkatan` year NOT NULL,
  `id_mkelas` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_siswa`
--

INSERT INTO `tb_siswa` (`id_siswa`, `nis`, `nama_siswa`, `tempat_lahir`, `tgl_lahir`, `jk`, `alamat`, `password`, `foto`, `status`, `th_angkatan`, `id_mkelas`) VALUES
(8, '001', 'Maia Santika', 'Blitar', '2004-02-12', 'P', 'Jatilengger, Ponggok, Blitar', 'e193a01ecf8d30ad0affefd332ce934e32ffce72', 'Santri Perempuan.png', '1', 2023, 16),
(9, '002', 'Ricko Syahputra', 'Tulungagung', '2004-12-03', 'L', 'Blitar', '6fc978af728d43c59faa400d5f6e0471ac850d4c', 'Santri Laki.jpg.png', '1', 2023, 16);

-- --------------------------------------------------------

--
-- Table structure for table `tb_thajaran`
--

CREATE TABLE `tb_thajaran` (
  `id_thajaran` int NOT NULL,
  `tahun_ajaran` varchar(30) NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_thajaran`
--

INSERT INTO `tb_thajaran` (`id_thajaran`, `tahun_ajaran`, `status`) VALUES
(9, '2022/2023', 1);

-- --------------------------------------------------------

--
-- Table structure for table `_logabsensi`
--

CREATE TABLE `_logabsensi` (
  `id_presensi` int NOT NULL,
  `id_mengajar` int NOT NULL,
  `id_siswa` int NOT NULL,
  `tgl_absen` date NOT NULL,
  `ket` enum('H','I','S','T','A','C') NOT NULL,
  `pertemuan_ke` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tb_guru`
--
ALTER TABLE `tb_guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indexes for table `tb_master_mapel`
--
ALTER TABLE `tb_master_mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indexes for table `tb_mengajar`
--
ALTER TABLE `tb_mengajar`
  ADD PRIMARY KEY (`id_mengajar`),
  ADD KEY `id_mapel` (`id_mapel`),
  ADD KEY `id_guru` (`id_guru`);

--
-- Indexes for table `tb_mkelas`
--
ALTER TABLE `tb_mkelas`
  ADD PRIMARY KEY (`id_mkelas`);

--
-- Indexes for table `tb_semester`
--
ALTER TABLE `tb_semester`
  ADD PRIMARY KEY (`id_semester`);

--
-- Indexes for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indexes for table `tb_thajaran`
--
ALTER TABLE `tb_thajaran`
  ADD PRIMARY KEY (`id_thajaran`);

--
-- Indexes for table `_logabsensi`
--
ALTER TABLE `_logabsensi`
  ADD PRIMARY KEY (`id_presensi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id_admin` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_guru`
--
ALTER TABLE `tb_guru`
  MODIFY `id_guru` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_master_mapel`
--
ALTER TABLE `tb_master_mapel`
  MODIFY `id_mapel` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_mengajar`
--
ALTER TABLE `tb_mengajar`
  MODIFY `id_mengajar` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_mkelas`
--
ALTER TABLE `tb_mkelas`
  MODIFY `id_mkelas` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tb_semester`
--
ALTER TABLE `tb_semester`
  MODIFY `id_semester` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  MODIFY `id_siswa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_thajaran`
--
ALTER TABLE `tb_thajaran`
  MODIFY `id_thajaran` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `_logabsensi`
--
ALTER TABLE `_logabsensi`
  MODIFY `id_presensi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
