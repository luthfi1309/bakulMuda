-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for bakulmuda
CREATE DATABASE IF NOT EXISTS `bakulmuda` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bakulmuda`;

-- Dumping structure for table bakulmuda.tb_barang
CREATE TABLE IF NOT EXISTS `tb_barang` (
  `id_brg` int(11) NOT NULL AUTO_INCREMENT,
  `nama_brg` varchar(120) NOT NULL,
  `keterangan` varchar(225) NOT NULL,
  `kategori` varchar(60) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(4) NOT NULL,
  `gambar` text NOT NULL,
  PRIMARY KEY (`id_brg`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bakulmuda.tb_barang: ~4 rows (approximately)
DELETE FROM `tb_barang`;
/*!40000 ALTER TABLE `tb_barang` DISABLE KEYS */;
INSERT INTO `tb_barang` (`id_brg`, `nama_brg`, `keterangan`, `kategori`, `harga`, `stok`, `gambar`) VALUES
	(2, 'Smartphone', 'POCO X3 GT (8/128GB)', 'Elektronik', 4400000, 4, 'hp.jpeg'),
	(3, 'Jersey', 'Jersey Futsal Polos', 'Pakaian Pria', 75000, 50, 'jersey.jpeg'),
	(4, 'Gamis', 'Gamis Syar\'i Polos Mira + Kerudung', 'Pakaian Wanita', 200000, 3, 'gamis.jpeg'),
	(5, 'Jajanan', 'Sempol Ayam Maknyus', 'Makanan', 10000, 30, 'sempol.jpg'),
	(7, 'Celana', 'Quiksilver', 'Pakaian Pria', 25000, 9, 'pexels-paul-ijsendoorn-33041.jpg');
/*!40000 ALTER TABLE `tb_barang` ENABLE KEYS */;

-- Dumping structure for table bakulmuda.tb_invoice
CREATE TABLE IF NOT EXISTS `tb_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(56) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `tgl_pesan` datetime NOT NULL,
  `batas_bayar` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bakulmuda.tb_invoice: ~0 rows (approximately)
DELETE FROM `tb_invoice`;
/*!40000 ALTER TABLE `tb_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_invoice` ENABLE KEYS */;

-- Dumping structure for table bakulmuda.tb_pesanan
CREATE TABLE IF NOT EXISTS `tb_pesanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_invoice` int(11) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(50) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `harga` int(10) NOT NULL,
  `pilihan` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bakulmuda.tb_pesanan: ~0 rows (approximately)
DELETE FROM `tb_pesanan`;
/*!40000 ALTER TABLE `tb_pesanan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pesanan` ENABLE KEYS */;

-- Dumping structure for table bakulmuda.tb_user
CREATE TABLE IF NOT EXISTS `tb_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` tinyint(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bakulmuda.tb_user: ~3 rows (approximately)
DELETE FROM `tb_user`;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `role_id`, `created_at`) VALUES
	(10, 'luthfi', 'luthfi', '11a194637e52f583e6a34880ea31d5d48378d3942437d718d6362ba461906afb80866b6e169a107f633d10dd7517b0f83513d3501414cc67410a7d5499f3d895', 1, '2021-11-01 01:30:54'),
	(11, 'dimas', 'dimas', '15054e0d1c027f193af9d8d0144b14bbbef368b35dbf151bff3744d5a8318b07495395cc05c045f0634130d867405cb1e25620d00e8d7e01f102d614ffc64a87', 2, '2021-11-01 01:32:08');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;

-- Dumping structure for trigger bakulmuda.pesanan_penjualan
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `pesanan_penjualan` AFTER INSERT ON `tb_pesanan` FOR EACH ROW BEGIN 
	UPDATE tb_barang SET stok = stok-NEW.jumlah
    WHERE id_brg = NEW.id_brg;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
