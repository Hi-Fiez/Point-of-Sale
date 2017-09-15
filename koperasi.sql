-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 27 Nov 2016 pada 16.04
-- Versi Server: 10.1.13-MariaDB
-- PHP Version: 5.5.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `koperasi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `akses_tutup`
--

CREATE TABLE `akses_tutup` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `id_for` int(11) NOT NULL,
  `jenis` enum('tutup','block','aktif','blokir','edit') COLLATE utf8_unicode_ci NOT NULL,
  `tutup` enum('anggota','simpanan','pinjaman','waserda') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tipecs` enum('umum','biasa','luar biasa') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id` int(10) UNSIGNED NOT NULL,
  `pin` bigint(20) NOT NULL,
  `kode` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nomor_rekening` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nama` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alamat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kota` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provinsi` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kode_pos` int(11) DEFAULT NULL,
  `telepon` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_card` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nomor_ktp` bigint(20) DEFAULT NULL,
  `tempat_lahir` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('L','P') COLLATE utf8_unicode_ci NOT NULL,
  `tanggal_registrasi` date DEFAULT NULL,
  `keterangan` text COLLATE utf8_unicode_ci NOT NULL,
  `jabatan` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `departemen` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `npk` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pekerjaan` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nama_saudara` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alamat_saudara` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telepon_saudara` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hubungan` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `foto` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tanda_tangan` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kode_rekening` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `saldo` double(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_anggota` enum('Hold','Tutup') COLLATE utf8_unicode_ci DEFAULT NULL,
  `tanggal_status` date DEFAULT NULL,
  `limit_transaksi` decimal(20,2) NOT NULL,
  `status` enum('AKTIF','NONAKTIF','BLOCK') COLLATE utf8_unicode_ci NOT NULL,
  `jenis_nasabah` enum('BIASA','LUAR BIASA','UMUM') COLLATE utf8_unicode_ci NOT NULL,
  `id_bank` int(10) UNSIGNED DEFAULT NULL,
  `nama_akun` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nomor_akun` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cabang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id`, `pin`, `kode`, `nomor_rekening`, `nama`, `alamat`, `kota`, `provinsi`, `kode_pos`, `telepon`, `account_card`, `nomor_ktp`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `tanggal_registrasi`, `keterangan`, `jabatan`, `departemen`, `npk`, `pekerjaan`, `nama_saudara`, `alamat_saudara`, `telepon_saudara`, `hubungan`, `foto`, `tanda_tangan`, `email`, `kode_rekening`, `saldo`, `created_at`, `updated_at`, `status_anggota`, `tanggal_status`, `limit_transaksi`, `status`, `jenis_nasabah`, `id_bank`, `nama_akun`, `nomor_akun`, `cabang`) VALUES
(1, 185985, '00011/KKBP', '123456778990', 'Codi', 'Depok', 'Depok', 'DKI Jakarta', 0, '0884476333', '12345678909', 128474443, '', '1970-01-01', 'L', '2014-12-03', '', '', '', '1234567', NULL, '', '', '', '', '', NULL, '', '1', 0.00, '2016-10-27 12:39:01', '2016-10-27 12:43:17', NULL, NULL, '5000000.00', 'AKTIF', 'BIASA', NULL, '', '', ''),
(2, 185985, '00022/KKBP', '1234567890', 'Doni', 'Bogor', 'Bogor', 'DKI Jakarta', 0, '0826376344', '1657201004', 112738744, '', '1970-01-01', 'L', '2013-07-17', '', '', '', '12345678', NULL, '', '', '', '', '', NULL, '', '1', 0.00, '2016-10-27 12:39:01', '2016-10-27 12:43:49', NULL, NULL, '5000000.00', 'AKTIF', 'BIASA', NULL, '', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `approvel`
--

CREATE TABLE `approvel` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_for` int(11) NOT NULL,
  `for` enum('simpanan','pinjaman','waserda') COLLATE utf8_unicode_ci NOT NULL,
  `lev1` tinyint(4) NOT NULL,
  `lev2` tinyint(4) NOT NULL,
  `lev3` tinyint(4) NOT NULL,
  `release` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `approvel_role`
--

CREATE TABLE `approvel_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `id_for` int(11) NOT NULL,
  `level` tinyint(4) NOT NULL,
  `for` enum('simpanan','pinjaman','waserda') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `attach_doc`
--

CREATE TABLE `attach_doc` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_anggota` int(11) DEFAULT NULL,
  `id_pengaturan` int(11) DEFAULT NULL,
  `doc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mime` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `attach_doc`
--

INSERT INTO `attach_doc` (`id`, `id_anggota`, `id_pengaturan`, `doc`, `mime`, `created_at`, `updated_at`, `keterangan`) VALUES
(2, 1, NULL, 'PO1.png', 'image/png', '2016-11-13 19:44:02', '2016-11-13 19:44:02', 'IBIB'),
(5, 1, NULL, '012 Formulir Isian 2016_Calas.pdf', 'application/pdf', '2016-11-23 23:17:00', '2016-11-23 23:17:00', 'ufu'),
(6, 1, NULL, '3A-8355-OK-banget.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '2016-11-24 00:33:32', '2016-11-24 00:33:32', 'gugogiogo');

-- --------------------------------------------------------

--
-- Struktur dari tabel `autodebet_pinjaman_detail`
--

CREATE TABLE `autodebet_pinjaman_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_auto_header` int(10) UNSIGNED NOT NULL,
  `id_pinjaman` int(10) UNSIGNED NOT NULL,
  `id_bayar` int(10) UNSIGNED NOT NULL,
  `debet` decimal(20,2) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `autodebet_pinjaman_header`
--

CREATE TABLE `autodebet_pinjaman_header` (
  `id` int(10) UNSIGNED NOT NULL,
  `tanggal_proses` date NOT NULL,
  `bulan` tinyint(4) NOT NULL,
  `tahun` int(11) NOT NULL,
  `keterangan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shunya` int(11) NOT NULL,
  `tanggal_awal` date DEFAULT NULL,
  `tanggal_akhir` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `autodebet_waserda_detail`
--

CREATE TABLE `autodebet_waserda_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_auto_header` int(10) UNSIGNED NOT NULL,
  `debet` decimal(20,2) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_transaksi_detail` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `autodebet_waserda_header`
--

CREATE TABLE `autodebet_waserda_header` (
  `id` int(10) UNSIGNED NOT NULL,
  `tanggal_proses` date NOT NULL,
  `tanggal_awal` date NOT NULL,
  `tanggal_akhir` date NOT NULL,
  `keterangan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shunya` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank`
--

CREATE TABLE `bank` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nama_bank` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mata_uang` int(10) UNSIGNED DEFAULT NULL,
  `keterangan` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cabang`
--

CREATE TABLE `cabang` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nama` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alamat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kota` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provinsi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kode_pos` int(11) DEFAULT NULL,
  `telepon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pesawat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nomor_rekening` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `akun_kas` int(10) UNSIGNED DEFAULT NULL,
  `akun_persediaan_wsd` int(10) UNSIGNED DEFAULT NULL,
  `akun_piutang_wsd` int(10) UNSIGNED DEFAULT NULL,
  `akun_penjualan_wsd` int(10) UNSIGNED DEFAULT NULL,
  `akun_pendapatan_wsd` int(10) UNSIGNED DEFAULT NULL,
  `akun_penampungan_retur` int(10) UNSIGNED DEFAULT NULL,
  `akun_biaya_selisih_opname` int(10) UNSIGNED DEFAULT NULL,
  `akun_cabang` int(10) UNSIGNED DEFAULT NULL,
  `id_shu` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `cabang`
--

INSERT INTO `cabang` (`id`, `kode`, `nama`, `alamat`, `kota`, `provinsi`, `kode_pos`, `telepon`, `pesawat`, `fax`, `created_at`, `updated_at`, `nomor_rekening`, `akun_kas`, `akun_persediaan_wsd`, `akun_piutang_wsd`, `akun_penjualan_wsd`, `akun_pendapatan_wsd`, `akun_penampungan_retur`, `akun_biaya_selisih_opname`, `akun_cabang`, `id_shu`) VALUES
(1, '1T', 'Permata Jakarta', 'JL.Test', 'Jakarta Timur', 'DKI Jakarta', 13520, '087884938814', 'Test', '021120021', NULL, '2016-10-27 01:48:45', '12345678', 15, 16, 14, 16, 14, 17, 18, 18, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_retur`
--

CREATE TABLE `detail_retur` (
  `id` int(10) UNSIGNED NOT NULL,
  `produk` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `barcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `no_ref` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type_pembayaran` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `harga` decimal(20,2) NOT NULL,
  `sub_total` decimal(20,2) NOT NULL,
  `cabang` int(10) UNSIGNED DEFAULT NULL,
  `kasir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `header_retur`
--

CREATE TABLE `header_retur` (
  `id` int(10) UNSIGNED NOT NULL,
  `noref` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` double(8,2) NOT NULL,
  `no_kartu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type_pembayaran` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kasir` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kategori` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hpp`
--

CREATE TABLE `hpp` (
  `id` int(10) UNSIGNED NOT NULL,
  `produk` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `persedian_awal` decimal(20,2) NOT NULL,
  `qty_persediaan` int(11) NOT NULL,
  `pembelian` decimal(20,2) NOT NULL,
  `qty_pembelian` int(11) NOT NULL,
  `hpp_unit` decimal(20,2) NOT NULL,
  `hpp_asli` decimal(20,2) NOT NULL,
  `tanggal` date NOT NULL,
  `id_produk` int(10) UNSIGNED DEFAULT NULL,
  `cabang` int(10) UNSIGNED DEFAULT NULL,
  `penjualan` decimal(20,2) NOT NULL,
  `qty_penjualan` int(11) NOT NULL,
  `stok_akhir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `icon`
--

CREATE TABLE `icon` (
  `id` int(10) UNSIGNED NOT NULL,
  `icon_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `icon`
--

INSERT INTO `icon` (`id`, `icon_name`, `type`, `created_at`, `updated_at`) VALUES
(1, 'ti-arrow-up', 1, '2016-10-25 03:15:14', '2016-10-25 03:15:14'),
(2, 'ti-arrow-right', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(3, 'ti-arrow-left', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(4, 'ti-arrow-down', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(5, 'ti-arrow-top-right', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(6, 'ti-arrow-top-left', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(7, 'ti-fullscreen', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(8, 'ti-arrows-vertical', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(9, 'ti-arrows-horizontal', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(10, 'ti-arrows-corner', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(11, 'ti-shift-right', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(12, 'ti-shift-left', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(13, 'ti-exchange-vertical', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(14, 'ti-arrow-circle-up', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(15, 'ti-arrow-circle-right', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(16, 'ti-arrow-circle-left', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(17, 'ti-arrow-circle-down', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(18, 'ti-angle-up', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(19, 'ti-angle-right', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(20, 'ti-angle-left', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(21, 'ti-angle-down', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(22, 'ti-angle-double-up', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(23, 'ti-angle-double-right', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(24, 'ti-angle-double-left', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(25, 'ti-angle-double-down', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(26, 'ti-split-v', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(27, 'ti-split-v-alt', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(28, 'ti-split-h', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(29, 'ti-direction', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(30, 'ti-direction-alt', 1, '2016-10-25 03:15:15', '2016-10-25 03:15:15'),
(31, 'ti-back-right', 1, '2016-10-25 03:15:16', '2016-10-25 03:15:16'),
(32, 'ti-back-left', 1, '2016-10-25 03:15:16', '2016-10-25 03:15:16'),
(33, 'ti-hand-point-up', 1, '2016-10-25 03:15:16', '2016-10-25 03:15:16'),
(34, 'ti-hand-point-right', 1, '2016-10-25 03:15:16', '2016-10-25 03:15:16'),
(35, 'ti-hand-point-left', 1, '2016-10-25 03:15:16', '2016-10-25 03:15:16'),
(36, 'ti-hand-point-down', 1, '2016-10-25 03:15:16', '2016-10-25 03:15:16'),
(37, 'ti-wand', 2, '2016-10-25 03:15:16', '2016-10-25 03:15:16'),
(38, 'ti-email', 2, '2016-10-25 03:15:16', '2016-10-25 03:15:16'),
(39, 'ti-user', 2, '2016-10-25 03:15:16', '2016-10-25 03:15:16'),
(40, 'ti-unlock', 2, '2016-10-25 03:15:16', '2016-10-25 03:15:16'),
(41, 'ti-lock', 2, '2016-10-25 03:15:16', '2016-10-25 03:15:16'),
(42, 'ti-key', 2, '2016-10-25 03:15:16', '2016-10-25 03:15:16'),
(43, 'ti-trash', 2, '2016-10-25 03:15:16', '2016-10-25 03:15:16'),
(44, 'ti-target', 2, '2016-10-25 03:15:16', '2016-10-25 03:15:16'),
(45, 'ti-tag', 2, '2016-10-25 03:15:16', '2016-10-25 03:15:16'),
(46, 'ti-desktop', 2, '2016-10-25 03:15:16', '2016-10-25 03:15:16'),
(47, 'ti-tablet', 2, '2016-10-25 03:15:16', '2016-10-25 03:15:16'),
(48, 'ti-mobile', 2, '2016-10-25 03:15:16', '2016-10-25 03:15:16'),
(49, 'ti-star', 2, '2016-10-25 03:15:16', '2016-10-25 03:15:16'),
(50, 'ti-spray', 2, '2016-10-25 03:15:17', '2016-10-25 03:15:17'),
(51, 'ti-signal', 2, '2016-10-25 03:15:17', '2016-10-25 03:15:17'),
(52, 'ti-shopping-cart', 2, '2016-10-25 03:15:17', '2016-10-25 03:15:17'),
(53, 'ti-shopping-cart-full', 2, '2016-10-25 03:15:17', '2016-10-25 03:15:17'),
(54, 'ti-settings', 2, '2016-10-25 03:15:17', '2016-10-25 03:15:17'),
(55, 'ti-search', 2, '2016-10-25 03:15:17', '2016-10-25 03:15:17'),
(56, 'ti-zoom-in', 2, '2016-10-25 03:15:17', '2016-10-25 03:15:17'),
(57, 'ti-zoom-out', 2, '2016-10-25 03:15:17', '2016-10-25 03:15:17'),
(58, 'ti-cut', 2, '2016-10-25 03:15:17', '2016-10-25 03:15:17'),
(59, 'ti-slice', 2, '2016-10-25 03:15:17', '2016-10-25 03:15:17'),
(60, 'ti-marker', 2, '2016-10-25 03:15:17', '2016-10-25 03:15:17'),
(61, 'ti-marker-alt', 2, '2016-10-25 03:15:17', '2016-10-25 03:15:17'),
(62, 'ti-pencil', 2, '2016-10-25 03:15:17', '2016-10-25 03:15:17'),
(63, 'ti-pencil-alt', 2, '2016-10-25 03:15:17', '2016-10-25 03:15:17'),
(64, 'ti-pencil-alt2', 2, '2016-10-25 03:15:17', '2016-10-25 03:15:17'),
(65, 'ti-ruler-pencil', 2, '2016-10-25 03:15:17', '2016-10-25 03:15:17'),
(66, 'ti-ruler', 2, '2016-10-25 03:15:17', '2016-10-25 03:15:17'),
(67, 'ti-ruler-alt', 2, '2016-10-25 03:15:17', '2016-10-25 03:15:17'),
(68, 'ti-bookmark', 2, '2016-10-25 03:15:17', '2016-10-25 03:15:17'),
(69, 'ti-bookmark-alt', 2, '2016-10-25 03:15:17', '2016-10-25 03:15:17'),
(70, 'ti-paint-bucket', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(71, 'ti-na', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(72, 'ti-plus', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(73, 'ti-minus', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(74, 'ti-close', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(75, 'ti-medall', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(76, 'ti-medall-alt', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(77, 'ti-layers', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(78, 'ti-layers-alt', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(79, 'ti-image', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(80, 'ti-gallery', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(81, 'ti-heart', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(82, 'ti-heart-broken', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(83, 'ti-hand-stop', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(84, 'ti-hand-open', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(85, 'ti-hand-drag', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(86, 'ti-flag', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(87, 'ti-flag-alt', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(88, 'ti-flag-alt-2', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(89, 'ti-eye', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(90, 'ti-cup', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(91, 'ti-crown', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(92, 'ti-thought', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(93, 'ti-comments', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(94, 'ti-comment', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(95, 'ti-comment-alt', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(96, 'ti-clip', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(97, 'ti-check', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(98, 'ti-check-box', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(99, 'ti-camera', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(100, 'ti-brush', 2, '2016-10-25 03:15:18', '2016-10-25 03:15:18'),
(101, 'ti-brush-alt', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(102, 'ti-paint-roller', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(103, 'ti-palette', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(104, 'ti-briefcase', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(105, 'ti-bag', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(106, 'ti-bolt', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(107, 'ti-bolt-alt', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(108, 'ti-blackboard', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(109, 'ti-zip', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(110, 'ti-world', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(111, 'ti-wheelchair', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(112, 'ti-car', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(113, 'ti-truck', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(114, 'ti-timer', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(115, 'ti-ticket', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(116, 'ti-thumb-up', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(117, 'ti-thumb-down', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(118, 'ti-shine', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(119, 'ti-shield', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(120, 'ti-pulse', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(121, 'ti-printer', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(122, 'ti-power-off', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(123, 'ti-plug', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(124, 'ti-pie-chart', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(125, 'ti-panel', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(126, 'ti-package', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(127, 'ti-music', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(128, 'ti-music-alt', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(129, 'ti-mouse', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(130, 'ti-mouse-alt', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(131, 'ti-microphone', 2, '2016-10-25 03:15:19', '2016-10-25 03:15:19'),
(132, 'ti-menu', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(133, 'ti-menu-alt', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(134, 'ti-map', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(135, 'ti-map-alt', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(136, 'ti-light-bulb', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(137, 'ti-infinite', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(138, 'ti-id-badge', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(139, 'ti-hummer', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(140, 'ti-home', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(141, 'ti-help', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(142, 'ti-help-alt', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(143, 'ti-info', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(144, 'ti-info-alt', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(145, 'ti-alert', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(146, 'ti-headphone', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(147, 'ti-harddrives', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(148, 'ti-harddrive', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(149, 'ti-server', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(150, 'ti-gift', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(151, 'ti-game', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(152, 'ti-filter', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(153, 'ti-envelope', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(154, 'ti-dashboard', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(155, 'ti-cloud', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(156, 'ti-cloud-up', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(157, 'ti-cloud-down', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(158, 'ti-clipboard', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(159, 'ti-notepad', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(160, 'ti-book', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(161, 'ti-calendar', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(162, 'ti-bell', 2, '2016-10-25 03:15:20', '2016-10-25 03:15:20'),
(163, 'ti-basketball', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(164, 'ti-bar-chart', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(165, 'ti-bar-chart-alt', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(166, 'ti-stats-up', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(167, 'ti-stats-down', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(168, 'ti-archive', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(169, 'ti-anchor', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(170, 'ti-alarm-clock', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(171, 'ti-agenda', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(172, 'ti-write', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(173, 'ti-window', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(174, 'ti-wallet', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(175, 'ti-money', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(176, 'ti-video-clapper', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(177, 'ti-video-camera', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(178, 'ti-vector', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(179, 'ti-support', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(180, 'ti-stamp', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(181, 'ti-ruler-alt-2', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(182, 'ti-receipt', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(183, 'ti-pin', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(184, 'ti-location-pin', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(185, 'ti-location-arror', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(186, 'ti-pin2', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(187, 'ti-pin-alt', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(188, 'ti-microphone-alt', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(189, 'ti-magnet', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(190, 'ti-link-pen', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(191, 'ti-headphone-alt', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(192, 'ti-face-smile', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(193, 'ti-face-sad', 2, '2016-10-25 03:15:21', '2016-10-25 03:15:21'),
(194, 'ti-credit-card', 2, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(195, 'ti-comments-smiley', 2, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(196, 'ti-time', 2, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(197, 'ti-share', 2, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(198, 'ti-share-alt', 2, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(199, 'ti-rocket', 2, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(200, 'ti-new-window', 2, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(201, 'ti-link', 2, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(202, 'ti-unlink', 2, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(203, 'ti-files', 2, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(204, 'ti-file', 2, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(205, 'ti-folder', 2, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(206, 'ti-save', 2, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(207, 'ti-save-alt', 2, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(208, 'ti-eraser', 2, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(209, 'ti-reload', 2, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(210, 'ti-import', 2, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(211, 'ti-export', 2, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(212, 'ti-download', 2, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(213, 'ti-upload', 2, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(214, 'ti-more', 2, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(215, 'ti-more-alt', 2, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(216, 'ti-shift-right-alt', 2, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(217, 'ti-shift-left-alt', 2, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(218, 'ti-move', 2, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(219, 'ti-announcement', 2, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(220, 'ti-control-stop', 3, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(221, 'ti-control-pause', 3, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(222, 'ti-control-play', 3, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(223, 'ti-control-skip-forward', 3, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(224, 'ti-control-skip-backward', 3, '2016-10-25 03:15:22', '2016-10-25 03:15:22'),
(225, 'ti-control-shuffle', 3, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(226, 'ti-control-forward', 3, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(227, 'ti-control-backward', 3, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(228, 'ti-control-record', 3, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(229, 'ti-control-eject', 3, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(230, 'ti-loop', 3, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(231, 'ti-volume', 3, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(232, 'ti-paragraph', 4, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(233, 'ti-uppercase', 4, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(234, 'ti-underline', 4, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(235, 'ti-text', 4, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(236, 'ti-smallcap', 4, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(237, 'ti-italic', 4, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(238, 'ti-align-right', 4, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(239, 'ti-align-left', 4, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(240, 'ti-align-justify', 4, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(241, 'ti-align-center', 4, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(242, 'ti-list', 4, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(243, 'ti-list-ol', 4, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(244, 'ti-quote-right', 4, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(245, 'ti-quote-left', 4, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(246, 'ti-widgetized', 5, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(247, 'ti-widget', 5, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(248, 'ti-widget-alt', 5, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(249, 'ti-view-list', 5, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(250, 'ti-view-list-alt', 5, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(251, 'ti-view-grid', 5, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(252, 'ti-layout', 5, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(253, 'ti-layout-sidebar-2', 5, '2016-10-25 03:15:23', '2016-10-25 03:15:23'),
(254, 'ti-layout-grid4-alt', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(255, 'ti-layout-grid3-alt', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(256, 'ti-layout-grid2-alt', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(257, 'ti-layout-column4-alt', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(258, 'ti-layout-column3-alt', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(259, 'ti-layout-column2-alt', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(260, 'ti-layout-width-full', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(261, 'ti-layout-width-default', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(262, 'ti-layout-width-default-alt', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(263, 'ti-layout-tab', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(264, 'ti-layout-tab-window', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(265, 'ti-layout-tab-v', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(266, 'ti-layout-tab-min', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(267, 'ti-layout-slider', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(268, 'ti-layout-slider-alt', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(269, 'ti-layout-sidebar-right', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(270, 'ti-layout-sidebar-none', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(271, 'ti-layout-sidebar-left', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(272, 'ti-layout-placeholder', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(273, 'ti-layout-menu', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(274, 'ti-layout-menu-v', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(275, 'ti-layout-menu-separated', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(276, 'ti-layout-menu-full', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(277, 'ti-layout-media-overlay', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(278, 'ti-layout-media-overlay-alt', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(279, 'ti-layout-media-overlay-alt-2', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(280, 'ti-layout-list-thumb', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(281, 'ti-layout-list-thumb-alt', 5, '2016-10-25 03:15:24', '2016-10-25 03:15:24'),
(282, 'ti-layout-list-post', 5, '2016-10-25 03:15:25', '2016-10-25 03:15:25'),
(283, 'ti-layout-list-large-image', 5, '2016-10-25 03:15:25', '2016-10-25 03:15:25'),
(284, 'ti-layout-line-solid', 5, '2016-10-25 03:15:25', '2016-10-25 03:15:25'),
(285, 'ti-layout-grid4', 5, '2016-10-25 03:15:25', '2016-10-25 03:15:25'),
(286, 'ti-layout-grid3', 5, '2016-10-25 03:15:25', '2016-10-25 03:15:25'),
(287, 'ti-layout-grid2', 5, '2016-10-25 03:15:25', '2016-10-25 03:15:25'),
(288, 'ti-layout-grid2-thumb', 5, '2016-10-25 03:15:25', '2016-10-25 03:15:25'),
(289, 'ti-layout-cta-right', 5, '2016-10-25 03:15:25', '2016-10-25 03:15:25'),
(290, 'ti-layout-cta-left', 5, '2016-10-25 03:15:25', '2016-10-25 03:15:25'),
(291, 'ti-layout-cta-center', 5, '2016-10-25 03:15:25', '2016-10-25 03:15:25'),
(292, 'ti-layout-cta-btn-right', 5, '2016-10-25 03:15:25', '2016-10-25 03:15:25'),
(293, 'ti-layout-cta-btn-left', 5, '2016-10-25 03:15:25', '2016-10-25 03:15:25'),
(294, 'ti-layout-column4', 5, '2016-10-25 03:15:25', '2016-10-25 03:15:25'),
(295, 'ti-layout-column3', 5, '2016-10-25 03:15:25', '2016-10-25 03:15:25'),
(296, 'ti-layout-column2', 5, '2016-10-25 03:15:25', '2016-10-25 03:15:25'),
(297, 'ti-line-double', 5, '2016-10-25 03:15:25', '2016-10-25 03:15:25'),
(298, 'ti-line-dotted', 5, '2016-10-25 03:15:25', '2016-10-25 03:15:25'),
(299, 'ti-line-dashed', 5, '2016-10-25 03:15:25', '2016-10-25 03:15:25'),
(300, 'ti-flickr', 6, '2016-10-25 03:15:25', '2016-10-25 03:15:25'),
(301, 'ti-flickr-alt', 6, '2016-10-25 03:15:25', '2016-10-25 03:15:25'),
(302, 'ti-instagram', 6, '2016-10-25 03:15:25', '2016-10-25 03:15:25'),
(303, 'ti-google', 6, '2016-10-25 03:15:25', '2016-10-25 03:15:25'),
(304, 'ti-github', 6, '2016-10-25 03:15:25', '2016-10-25 03:15:25'),
(305, 'ti-facebook', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(306, 'ti-dropbox', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(307, 'ti-dropbox-alt', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(308, 'ti-dribbble', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(309, 'ti-apple', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(310, 'ti-android', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(311, 'ti-yahoo', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(312, 'ti-trello', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(313, 'ti-stack-overflow', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(314, 'ti-soundcloud', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(315, 'ti-sharethis', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(316, 'ti-sharethis-alt', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(317, 'ti-reddit', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(318, 'ti-microsoft', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(319, 'ti-microsoft-alt', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(320, 'ti-linux', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(321, 'ti-jsfiddle', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(322, 'ti-joomla', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(323, 'ti-html5', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(324, 'ti-css3', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(325, 'ti-drupal', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(326, 'ti-wordpress', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(327, 'ti-tumblr', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(328, 'ti-tumblr-alt', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(329, 'ti-skype', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(330, 'ti-youtube', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(331, 'ti-vimeo', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(332, 'ti-vimeo-alt', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(333, 'ti-twitter', 6, '2016-10-25 03:15:26', '2016-10-25 03:15:26'),
(334, 'ti-twitter-alt', 6, '2016-10-25 03:15:27', '2016-10-25 03:15:27'),
(335, 'ti-linkedin', 6, '2016-10-25 03:15:27', '2016-10-25 03:15:27'),
(336, 'ti-pinterest', 6, '2016-10-25 03:15:27', '2016-10-25 03:15:27'),
(337, 'ti-pinterest-alt', 6, '2016-10-25 03:15:27', '2016-10-25 03:15:27'),
(338, 'ti-themify-logo', 6, '2016-10-25 03:15:27', '2016-10-25 03:15:27'),
(339, 'ti-themify-favicon', 6, '2016-10-25 03:15:27', '2016-10-25 03:15:27'),
(340, 'ti-themify-favicon-alt', 6, '2016-10-25 03:15:27', '2016-10-25 03:15:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `iklan`
--

CREATE TABLE `iklan` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `iklan`
--

INSERT INTO `iklan` (`id`, `title`, `created_at`, `updated_at`, `status`) VALUES
(1, 'testbanner.png', '2016-10-25 03:15:14', '2016-10-25 03:25:44', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jaminan_bangunan`
--

CREATE TABLE `jaminan_bangunan` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_jaminan` int(10) UNSIGNED NOT NULL,
  `nomor_sertifikat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kelurahan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kecamatan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kota` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provinsi` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nib` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `peruntukan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ser_hak` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `luas_tanah` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jaminan_elektronik`
--

CREATE TABLE `jaminan_elektronik` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_jaminan` int(10) UNSIGNED NOT NULL,
  `nomor_serial` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipe` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `merek` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jaminan_emas`
--

CREATE TABLE `jaminan_emas` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_jaminan` int(10) UNSIGNED NOT NULL,
  `nomor_sertifikat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `berat` int(11) NOT NULL,
  `karat` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jaminan_kendaraan`
--

CREATE TABLE `jaminan_kendaraan` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_jaminan` int(10) UNSIGNED NOT NULL,
  `nomor_plat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nomor_bpkb` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `merek` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `jenis` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tahun` int(11) NOT NULL,
  `warna` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nomor_rangka` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bahan_bakar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipe` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `jumlah_roda` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nomor_mesin` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jaminan_pinjaman`
--

CREATE TABLE `jaminan_pinjaman` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_pinjaman` int(10) UNSIGNED DEFAULT NULL,
  `jenis_jaminan` int(10) UNSIGNED NOT NULL,
  `ikatan_hukum` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nama_pemilik` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `alamat_pemilik` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nilai` decimal(20,2) NOT NULL,
  `nomor_arsip` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `keterangan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `foto2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jaminan_simpanan`
--

CREATE TABLE `jaminan_simpanan` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_jaminan` int(10) UNSIGNED NOT NULL,
  `nomor_simpanan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bank` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `jumlah` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jaminan_tanpa`
--

CREATE TABLE `jaminan_tanpa` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_jaminan` int(10) UNSIGNED NOT NULL,
  `nomor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenistransaksi`
--

CREATE TABLE `jenistransaksi` (
  `id` int(10) UNSIGNED NOT NULL,
  `jenis` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `aktif` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `jenistransaksi`
--

INSERT INTO `jenistransaksi` (`id`, `jenis`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 'cash', 1, '2016-10-25 03:15:14', '2016-10-27 00:58:44'),
(2, 'tunda', 1, '2016-10-25 03:15:14', '2016-10-27 00:58:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_jaminan`
--

CREATE TABLE `jenis_jaminan` (
  `id` int(10) UNSIGNED NOT NULL,
  `jenis` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tabel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `jenis_jaminan`
--

INSERT INTO `jenis_jaminan` (`id`, `jenis`, `tabel`, `created_at`, `updated_at`) VALUES
(1, 'Simpanan', 'jaminan_simpanan', '2016-10-25 03:15:13', '2016-10-25 03:15:13'),
(2, 'Emas', 'jaminan_emas', '2016-10-25 03:15:13', '2016-10-25 03:15:13'),
(3, 'Kendaraan Bermotor', 'jaminan_kendaraan', '2016-10-25 03:15:13', '2016-10-25 03:15:13'),
(4, 'Elektronik', 'jaminan_elektronik', '2016-10-25 03:15:14', '2016-10-25 03:15:14'),
(5, 'Tanah dan Bangunan', 'jaminan_bangunan', '2016-10-25 03:15:14', '2016-10-25 03:15:14'),
(6, 'Tanpa Agunan', 'jaminan_tanpa', '2016-10-25 03:15:14', '2016-10-25 03:15:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurnal_detail`
--

CREATE TABLE `jurnal_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_header` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_akun` int(11) NOT NULL,
  `debet` decimal(10,0) NOT NULL,
  `kredit` decimal(10,0) NOT NULL,
  `nominal` decimal(10,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `posting` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `jurnal_detail`
--

INSERT INTO `jurnal_detail` (`id`, `id_header`, `id_transaksi`, `id_akun`, `debet`, `kredit`, `nominal`, `created_at`, `updated_at`, `posting`) VALUES
(1, 4, 0, 15, '26000', '0', '26000', '2016-10-27 08:49:09', '2016-10-27 08:49:09', '0'),
(2, 4, 0, 16, '0', '26000', '26000', '2016-10-27 08:49:09', '2016-10-27 08:49:09', '0'),
(3, 5, 0, 15, '20000', '0', '20000', '2016-10-27 09:47:50', '2016-10-27 09:47:50', '0'),
(4, 5, 0, 16, '0', '20000', '20000', '2016-10-27 09:47:50', '2016-10-27 09:47:50', '0'),
(5, 6, 0, 15, '8000', '0', '8000', '2016-10-27 10:34:02', '2016-10-27 10:34:02', '0'),
(6, 6, 0, 16, '0', '8000', '8000', '2016-10-27 10:34:02', '2016-10-27 10:34:02', '0'),
(7, 7, 0, 15, '10000', '0', '10000', '2016-10-27 10:45:07', '2016-10-27 10:45:07', '0'),
(8, 7, 0, 16, '0', '10000', '10000', '2016-10-27 10:45:07', '2016-10-27 10:45:07', '0'),
(9, 8, 0, 1, '700000', '0', '700000', '2016-10-27 20:06:20', '2016-10-27 20:06:20', '0'),
(10, 8, 0, 1, '0', '700000', '700000', '2016-10-27 20:06:20', '2016-10-27 20:06:20', '0'),
(11, 9, 0, 1, '900000', '0', '900000', '2016-10-27 20:06:43', '2016-10-27 20:06:43', '0'),
(12, 9, 0, 1, '0', '900000', '900000', '2016-10-27 20:06:43', '2016-10-27 20:06:43', '0'),
(13, 10, 0, 14, '28000', '0', '28000', '2016-10-27 20:14:01', '2016-10-27 20:14:01', '0'),
(14, 10, 0, 16, '0', '28000', '28000', '2016-10-27 20:14:02', '2016-10-27 20:14:02', '0'),
(15, 11, 0, 14, '8000', '0', '8000', '2016-10-27 21:29:17', '2016-10-27 21:29:17', '0'),
(16, 11, 0, 16, '0', '8000', '8000', '2016-10-27 21:29:17', '2016-10-27 21:29:17', '0'),
(17, 12, 0, 14, '18000', '0', '18000', '2016-10-27 21:35:24', '2016-10-27 21:35:24', '0'),
(18, 12, 0, 16, '0', '18000', '18000', '2016-10-27 21:35:24', '2016-10-27 21:35:24', '0'),
(19, 13, 0, 14, '64000', '0', '64000', '2016-10-27 21:37:05', '2016-10-27 21:37:05', '0'),
(20, 13, 0, 16, '0', '64000', '64000', '2016-10-27 21:37:05', '2016-10-27 21:37:05', '0'),
(21, 14, 0, 14, '8000', '0', '8000', '2016-10-27 21:45:26', '2016-10-27 21:45:26', '0'),
(22, 14, 0, 16, '0', '8000', '8000', '2016-10-27 21:45:26', '2016-10-27 21:45:26', '0'),
(23, 15, 0, 14, '16000', '0', '16000', '2016-10-27 21:46:58', '2016-10-27 21:46:58', '0'),
(24, 15, 0, 16, '0', '16000', '16000', '2016-10-27 21:46:58', '2016-10-27 21:46:58', '0'),
(25, 16, 0, 14, '8000', '0', '8000', '2016-10-27 21:50:30', '2016-10-27 21:50:30', '0'),
(26, 16, 0, 16, '0', '8000', '8000', '2016-10-27 21:50:30', '2016-10-27 21:50:30', '0'),
(27, 17, 0, 15, '32000', '0', '32000', '2016-10-27 21:55:07', '2016-10-27 21:55:07', '0'),
(28, 17, 0, 16, '0', '32000', '32000', '2016-10-27 21:55:07', '2016-10-27 21:55:07', '0'),
(29, 18, 0, 17, '25000', '0', '25000', '2016-10-28 07:20:28', '2016-10-28 07:20:28', '0'),
(30, 18, 0, 16, '0', '25000', '25000', '2016-10-28 07:20:28', '2016-10-28 07:20:28', '0'),
(31, 19, 0, 16, '90000', '0', '90000', '2016-10-28 07:28:55', '2016-10-28 07:28:55', '0'),
(32, 19, 0, 15, '0', '90000', '90000', '2016-10-28 07:28:55', '2016-10-28 07:28:55', '0'),
(33, 20, 0, 16, '90000', '0', '90000', '2016-10-28 07:28:55', '2016-10-28 07:28:55', '0'),
(34, 20, 0, 15, '0', '90000', '90000', '2016-10-28 07:28:55', '2016-10-28 07:28:55', '0'),
(35, 21, 0, 15, '18000', '0', '18000', '2016-10-28 08:47:33', '2016-10-28 08:47:33', '0'),
(36, 21, 0, 16, '0', '18000', '18000', '2016-10-28 08:47:33', '2016-10-28 08:47:33', '0'),
(37, 22, 0, 16, '18000', '0', '18000', '2016-10-30 13:39:37', '2016-10-30 13:39:37', '0'),
(38, 22, 0, 15, '0', '18000', '18000', '2016-10-30 13:39:37', '2016-10-30 13:39:37', '0'),
(39, 23, 0, 16, '16000', '0', '16000', '2016-10-30 13:45:28', '2016-10-30 13:45:28', '0'),
(40, 23, 0, 15, '0', '16000', '16000', '2016-10-30 13:45:28', '2016-10-30 13:45:28', '0'),
(41, 24, 0, 16, '820000', '0', '820000', '2016-10-31 06:01:52', '2016-10-31 06:01:52', '0'),
(42, 24, 0, 15, '0', '820000', '820000', '2016-10-31 06:01:52', '2016-10-31 06:01:52', '0'),
(43, 25, 0, 16, '820000', '0', '820000', '2016-10-31 06:01:52', '2016-10-31 06:01:52', '0'),
(44, 25, 0, 15, '0', '820000', '820000', '2016-10-31 06:01:52', '2016-10-31 06:01:52', '0'),
(45, 26, 0, 16, '820000', '0', '820000', '2016-10-31 06:01:52', '2016-10-31 06:01:52', '0'),
(46, 26, 0, 15, '0', '820000', '820000', '2016-10-31 06:01:52', '2016-10-31 06:01:52', '0'),
(47, 27, 0, 16, '90000', '0', '90000', '2016-10-31 06:05:54', '2016-10-31 06:05:54', '0'),
(48, 27, 0, 15, '0', '90000', '90000', '2016-10-31 06:05:54', '2016-10-31 06:05:54', '0'),
(49, 28, 0, 16, '90000', '0', '90000', '2016-10-31 06:05:54', '2016-10-31 06:05:54', '0'),
(50, 28, 0, 15, '0', '90000', '90000', '2016-10-31 06:05:54', '2016-10-31 06:05:54', '0'),
(51, 29, 0, 16, '820000', '0', '820000', '2016-10-31 06:05:59', '2016-10-31 06:05:59', '0'),
(52, 29, 0, 15, '0', '820000', '820000', '2016-10-31 06:05:59', '2016-10-31 06:05:59', '0'),
(53, 30, 0, 16, '820000', '0', '820000', '2016-10-31 06:06:00', '2016-10-31 06:06:00', '0'),
(54, 30, 0, 15, '0', '820000', '820000', '2016-10-31 06:06:00', '2016-10-31 06:06:00', '0'),
(55, 31, 0, 16, '820000', '0', '820000', '2016-10-31 06:06:00', '2016-10-31 06:06:00', '0'),
(56, 31, 0, 15, '0', '820000', '820000', '2016-10-31 06:06:00', '2016-10-31 06:06:00', '0'),
(57, 32, 0, 18, '816000', '0', '816000', '2016-10-31 06:07:33', '2016-10-31 06:07:33', '0'),
(58, 32, 0, 16, '0', '816000', '816000', '2016-10-31 06:07:33', '2016-10-31 06:07:33', '0'),
(59, 32, 0, 18, '816000', '0', '816000', '2016-10-31 06:07:33', '2016-10-31 06:07:33', '0'),
(60, 32, 0, 16, '0', '816000', '816000', '2016-10-31 06:07:33', '2016-10-31 06:07:33', '0'),
(61, 33, 0, 16, '1200000', '0', '1200000', '2016-10-31 08:01:39', '2016-10-31 08:01:39', '0'),
(62, 33, 0, 15, '0', '1200000', '1200000', '2016-10-31 08:01:39', '2016-10-31 08:01:39', '0'),
(63, 34, 0, 16, '1200000', '0', '1200000', '2016-10-31 08:01:39', '2016-10-31 08:01:39', '0'),
(64, 34, 0, 15, '0', '1200000', '1200000', '2016-10-31 08:01:39', '2016-10-31 08:01:39', '0'),
(65, 35, 0, 16, '1200000', '0', '1200000', '2016-10-31 08:01:40', '2016-10-31 08:01:40', '0'),
(66, 35, 0, 15, '0', '1200000', '1200000', '2016-10-31 08:01:41', '2016-10-31 08:01:41', '0'),
(67, 36, 0, 16, '900000', '0', '900000', '2016-11-03 09:47:42', '2016-11-03 09:47:42', '0'),
(68, 36, 0, 15, '0', '900000', '900000', '2016-11-03 09:47:42', '2016-11-03 09:47:42', '0'),
(69, 37, 0, 16, '900000', '0', '900000', '2016-11-03 09:47:42', '2016-11-03 09:47:42', '0'),
(70, 37, 0, 15, '0', '900000', '900000', '2016-11-03 09:47:42', '2016-11-03 09:47:42', '0'),
(71, 38, 0, 16, '900000', '0', '900000', '2016-11-03 10:06:13', '2016-11-03 10:06:13', '0'),
(72, 38, 0, 15, '0', '900000', '900000', '2016-11-03 10:06:13', '2016-11-03 10:06:13', '0'),
(73, 39, 0, 16, '900000', '0', '900000', '2016-11-03 10:06:14', '2016-11-03 10:06:14', '0'),
(74, 39, 0, 15, '0', '900000', '900000', '2016-11-03 10:06:14', '2016-11-03 10:06:14', '0'),
(75, 40, 0, 16, '900000', '0', '900000', '2016-11-03 10:06:15', '2016-11-03 10:06:15', '0'),
(76, 40, 0, 15, '0', '900000', '900000', '2016-11-03 10:06:16', '2016-11-03 10:06:16', '0'),
(77, 41, 0, 16, '900000', '0', '900000', '2016-11-03 10:06:16', '2016-11-03 10:06:16', '0'),
(78, 41, 0, 15, '0', '900000', '900000', '2016-11-03 10:06:16', '2016-11-03 10:06:16', '0'),
(79, 42, 0, 16, '90000', '0', '90000', '2016-11-04 02:09:27', '2016-11-04 02:09:27', '0'),
(80, 42, 0, 15, '0', '90000', '90000', '2016-11-04 02:09:27', '2016-11-04 02:09:27', '0'),
(81, 43, 0, 16, '90000', '0', '90000', '2016-11-04 02:09:28', '2016-11-04 02:09:28', '0'),
(82, 43, 0, 15, '0', '90000', '90000', '2016-11-04 02:09:28', '2016-11-04 02:09:28', '0'),
(83, 44, 0, 15, '16000', '0', '16000', '2016-11-07 07:04:47', '2016-11-07 07:04:47', '0'),
(84, 44, 0, 16, '0', '16000', '16000', '2016-11-07 07:04:47', '2016-11-07 07:04:47', '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurnal_header`
--

CREATE TABLE `jurnal_header` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode_jurnal` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `keterangan` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('AKTIF','VOID') COLLATE utf8_unicode_ci NOT NULL,
  `tipe` enum('MANUAL','TABUNGAN','KREDIT','KAS') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `posting` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `jurnal_header`
--

INSERT INTO `jurnal_header` (`id`, `kode_jurnal`, `tanggal`, `keterangan`, `status`, `tipe`, `created_at`, `updated_at`, `posting`) VALUES
(1, 'PMBSJRO-00001', '2016-10-26 08:34:22', 'Pembelian Produk', 'AKTIF', '', '2016-10-26 08:34:22', '2016-10-26 08:34:22', '0'),
(2, 'TRPOS-00001', '2016-10-27 07:59:16', 'Transaksi POS', 'AKTIF', '', '2016-10-27 07:59:16', '2016-10-27 07:59:16', '0'),
(3, 'TRPOS-00001', '2016-10-27 07:59:34', 'Transaksi POS', 'AKTIF', '', '2016-10-27 07:59:34', '2016-10-27 07:59:34', '0'),
(4, 'TRPOS-00001', '2016-10-27 08:49:09', 'Transaksi POS', 'AKTIF', '', '2016-10-27 08:49:09', '2016-10-27 08:49:09', '0'),
(5, 'TRPOS-00002', '2016-10-27 09:47:49', 'Transaksi POS', 'AKTIF', '', '2016-10-27 09:47:49', '2016-10-27 09:47:49', '0'),
(6, 'TRPOS-00003', '2016-10-27 10:34:02', 'Transaksi POS', 'AKTIF', '', '2016-10-27 10:34:02', '2016-10-27 10:34:02', '0'),
(7, 'TRPOS-00004', '2016-10-27 10:45:07', 'Transaksi POS', 'AKTIF', '', '2016-10-27 10:45:07', '2016-10-27 10:45:07', '0'),
(8, 'SIMPJRO-00002', '2016-10-27 20:06:20', 'SETOR', 'AKTIF', 'TABUNGAN', '2016-10-27 20:06:20', '2016-10-27 20:06:20', '0'),
(9, 'SIMPJRO-00003', '2016-10-27 20:06:42', 'SETOR', 'AKTIF', 'TABUNGAN', '2016-10-27 20:06:42', '2016-10-27 20:06:42', '0'),
(10, 'TRPOS-00005', '2016-10-27 20:14:01', 'Transaksi POS', 'AKTIF', '', '2016-10-27 20:14:01', '2016-10-27 20:14:01', '0'),
(11, 'TRPOS-00006', '2016-10-27 21:29:16', 'Transaksi POS', 'AKTIF', '', '2016-10-27 21:29:16', '2016-10-27 21:29:16', '0'),
(12, 'TRPOS-00007', '2016-10-27 21:35:24', 'Transaksi POS', 'AKTIF', '', '2016-10-27 21:35:24', '2016-10-27 21:35:24', '0'),
(13, 'TRPOS-00008', '2016-10-27 21:37:05', 'Transaksi POS', 'AKTIF', '', '2016-10-27 21:37:05', '2016-10-27 21:37:05', '0'),
(14, 'TRPOS-00009', '2016-10-27 21:45:26', 'Transaksi POS', 'AKTIF', '', '2016-10-27 21:45:26', '2016-10-27 21:45:26', '0'),
(15, 'TRPOS-00010', '2016-10-27 21:46:58', 'Transaksi POS', 'AKTIF', '', '2016-10-27 21:46:58', '2016-10-27 21:46:58', '0'),
(16, 'TRPOS-00011', '2016-10-27 21:50:30', 'Transaksi POS', 'AKTIF', '', '2016-10-27 21:50:30', '2016-10-27 21:50:30', '0'),
(17, 'TRPOS-00012', '2016-10-27 21:55:07', 'Transaksi POS', 'AKTIF', '', '2016-10-27 21:55:07', '2016-10-27 21:55:07', '0'),
(18, 'RTRSJRO-00004', '2016-10-28 07:20:28', 'Retur Produk', 'AKTIF', '', '2016-10-28 07:20:28', '2016-10-28 07:20:28', '0'),
(19, 'PMBSJRO-00006', '2016-10-28 07:28:55', 'Pembelian Produk', 'AKTIF', '', '2016-10-28 07:28:55', '2016-10-28 07:28:55', '0'),
(20, 'PMBSJRO-00007', '2016-10-28 07:28:55', 'Pembelian Produk', 'AKTIF', '', '2016-10-28 07:28:55', '2016-10-28 07:28:55', '0'),
(21, 'TRPOS-00013', '2016-10-28 08:47:33', 'Transaksi POS', 'AKTIF', '', '2016-10-28 08:47:33', '2016-10-28 08:47:33', '0'),
(22, 'TRPOS-00014', '2016-10-30 13:39:37', 'Retur POS', 'AKTIF', '', '2016-10-30 13:39:37', '2016-10-30 13:39:37', '0'),
(23, 'TRPOS-00015', '2016-10-30 13:45:28', 'Retur POS', 'AKTIF', '', '2016-10-30 13:45:28', '2016-10-30 13:45:28', '0'),
(24, 'PMBSJRO-00009', '2016-10-31 06:01:52', 'Pembelian Produk', 'AKTIF', '', '2016-10-31 06:01:52', '2016-10-31 06:01:52', '0'),
(25, 'PMBSJRO-00010', '2016-10-31 06:01:52', 'Pembelian Produk', 'AKTIF', '', '2016-10-31 06:01:52', '2016-10-31 06:01:52', '0'),
(26, 'PMBSJRO-00011', '2016-10-31 06:01:52', 'Pembelian Produk', 'AKTIF', '', '2016-10-31 06:01:52', '2016-10-31 06:01:52', '0'),
(27, 'PMBSJRO-00013', '2016-10-31 06:05:54', 'Pembelian Produk', 'AKTIF', '', '2016-10-31 06:05:54', '2016-10-31 06:05:54', '0'),
(28, 'PMBSJRO-00014', '2016-10-31 06:05:54', 'Pembelian Produk', 'AKTIF', '', '2016-10-31 06:05:54', '2016-10-31 06:05:54', '0'),
(29, 'PMBSJRO-00016', '2016-10-31 06:05:59', 'Pembelian Produk', 'AKTIF', '', '2016-10-31 06:05:59', '2016-10-31 06:05:59', '0'),
(30, 'PMBSJRO-00017', '2016-10-31 06:06:00', 'Pembelian Produk', 'AKTIF', '', '2016-10-31 06:06:00', '2016-10-31 06:06:00', '0'),
(31, 'PMBSJRO-00018', '2016-10-31 06:06:00', 'Pembelian Produk', 'AKTIF', '', '2016-10-31 06:06:00', '2016-10-31 06:06:00', '0'),
(32, 'OPNJRO-00020', '2016-10-31 06:07:32', 'Pengiriman Produk', 'AKTIF', '', '2016-10-31 06:07:32', '2016-10-31 06:07:32', '0'),
(33, 'PMBSJRO-00022', '2016-10-31 08:01:39', 'Pembelian Produk', 'AKTIF', '', '2016-10-31 08:01:39', '2016-10-31 08:01:39', '0'),
(34, 'PMBSJRO-00023', '2016-10-31 08:01:39', 'Pembelian Produk', 'AKTIF', '', '2016-10-31 08:01:39', '2016-10-31 08:01:39', '0'),
(35, 'PMBSJRO-00024', '2016-10-31 08:01:40', 'Pembelian Produk', 'AKTIF', '', '2016-10-31 08:01:40', '2016-10-31 08:01:40', '0'),
(36, 'PMBSJRO-00026', '2016-11-03 09:47:42', 'Pembelian Produk', 'AKTIF', '', '2016-11-03 09:47:42', '2016-11-03 09:47:42', '0'),
(37, 'PMBSJRO-00027', '2016-11-03 09:47:42', 'Pembelian Produk', 'AKTIF', '', '2016-11-03 09:47:42', '2016-11-03 09:47:42', '0'),
(38, 'PMBSJRO-00029', '2016-11-03 10:06:13', 'Pembelian Produk', 'AKTIF', '', '2016-11-03 10:06:13', '2016-11-03 10:06:13', '0'),
(39, 'PMBSJRO-00030', '2016-11-03 10:06:14', 'Pembelian Produk', 'AKTIF', '', '2016-11-03 10:06:14', '2016-11-03 10:06:14', '0'),
(40, 'PMBSJRO-00032', '2016-11-03 10:06:15', 'Pembelian Produk', 'AKTIF', '', '2016-11-03 10:06:15', '2016-11-03 10:06:15', '0'),
(41, 'PMBSJRO-00033', '2016-11-03 10:06:16', 'Pembelian Produk', 'AKTIF', '', '2016-11-03 10:06:16', '2016-11-03 10:06:16', '0'),
(42, 'PMBSJRO-00035', '2016-11-04 02:09:27', 'Pembelian Produk', 'AKTIF', '', '2016-11-04 02:09:27', '2016-11-04 02:09:27', '0'),
(43, 'PMBSJRO-00036', '2016-11-04 02:09:28', 'Pembelian Produk', 'AKTIF', '', '2016-11-04 02:09:28', '2016-11-04 02:09:28', '0'),
(44, 'TRPOS-00016', '2016-11-07 07:04:47', 'Transaksi POS', 'AKTIF', '', '2016-11-07 07:04:47', '2016-11-07 07:04:47', '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kas`
--

CREATE TABLE `kas` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_akun` int(11) NOT NULL,
  `keterangan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `tipe` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `jumlah` decimal(20,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `nama` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `kode`, `nama`, `created_at`, `updated_at`) VALUES
(1, '1M', 'Makanan', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_shu_detail`
--

CREATE TABLE `kategori_shu_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_header` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `masuk_shu` tinyint(4) NOT NULL,
  `percent` decimal(5,2) NOT NULL,
  `fieldnya` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `kategori_shu_detail`
--

INSERT INTO `kategori_shu_detail` (`id`, `id_header`, `nama`, `masuk_shu`, `percent`, `fieldnya`, `created_at`, `updated_at`) VALUES
(1, 3, 'SHU UNTUK WASERDA', 5, '2.00', 'wed', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_shu_header`
--

CREATE TABLE `kategori_shu_header` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `kategori_shu_header`
--

INSERT INTO `kategori_shu_header` (`id`, `kode`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'SM', 'Simpanan', '2016-10-25 03:15:32', '2016-10-25 03:15:32'),
(2, 'PJ', 'Pinjaman', '2016-10-25 03:15:33', '2016-10-25 03:15:33'),
(3, 'WD', 'Waserda', '2016-10-25 03:15:33', '2016-10-25 03:15:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kode_rekening_cab`
--

CREATE TABLE `kode_rekening_cab` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `kode_rekening_cab`
--

INSERT INTO `kode_rekening_cab` (`id`, `kode`, `nama`, `created_at`, `updated_at`) VALUES
(1, '007', '007', '2016-10-27 12:39:01', '2016-10-27 12:39:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kolektibilitas`
--

CREATE TABLE `kolektibilitas` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `keterangan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `batas_hari` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `kolektibilitas`
--

INSERT INTO `kolektibilitas` (`id`, `kode`, `keterangan`, `batas_hari`, `created_at`, `updated_at`) VALUES
(1, 'LANCAR', 'Lancar', 0, '2016-10-25 03:15:07', '2016-10-25 03:15:07'),
(2, 'DPK', 'Dalam Perhatian Khusus', 40, '2016-10-25 03:15:07', '2016-10-25 03:15:07'),
(3, 'KL', 'Kurang Lancar', 90, '2016-10-25 03:15:07', '2016-10-25 03:15:07'),
(4, 'DR', 'Diragukan', 120, '2016-10-25 03:15:07', '2016-10-25 03:15:07'),
(5, 'MCT', 'Macet', 180, '2016-10-25 03:15:08', '2016-10-25 03:15:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan_kasir`
--

CREATE TABLE `laporan_kasir` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `jumlah` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `masterunit`
--

CREATE TABLE `masterunit` (
  `id` int(10) UNSIGNED NOT NULL,
  `unit` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mastok`
--

CREATE TABLE `mastok` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tanggal_expired` date NOT NULL,
  `produk` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `harga_beli` decimal(20,2) NOT NULL,
  `stok_awal` int(11) NOT NULL,
  `id_produk` int(10) UNSIGNED DEFAULT NULL,
  `cabang` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `mastok`
--

INSERT INTO `mastok` (`id`, `created_at`, `updated_at`, `tanggal_expired`, `produk`, `harga_beli`, `stok_awal`, `id_produk`, `cabang`) VALUES
(14, '2016-11-03 03:10:03', '2016-11-03 03:10:03', '2017-11-04', 'Potatos', '5000.00', 100, 1, '1'),
(15, '2016-11-03 03:10:03', '2016-11-07 00:04:47', '2018-11-24', 'Oreo', '4000.00', 108, 2, '1'),
(16, '2016-11-03 19:09:55', '2016-11-03 19:09:55', '2018-01-06', 'Potatos', '5000.00', 10, 1, '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `matauang`
--

CREATE TABLE `matauang` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nama` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `def` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `matauang`
--

INSERT INTO `matauang` (`id`, `kode`, `nama`, `created_at`, `updated_at`, `def`) VALUES
(1, '1Rp', 'RP', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2015_12_10_190357_table_anggota', 1),
('2015_12_10_190405_table_cabang', 1),
('2015_12_10_205430_table_jurnal_detail', 1),
('2015_12_10_205549_table_jurnal_header', 1),
('2015_12_10_205610_table_kategori', 1),
('2015_12_10_205618_table_kolektibilitas', 1),
('2015_12_11_020740_table_masterunit', 1),
('2015_12_11_020749_table_matauang', 1),
('2015_12_11_020816_table_nomor', 1),
('2015_12_11_041010_table_sistem_bunga', 1),
('2015_12_11_041011_table_perkiraan', 1),
('2015_12_11_041056_table_pengaturan_akun', 1),
('2015_12_11_041105_table_pengaturan_shu', 1),
('2015_12_11_041120_table_pengaturan_simpanan', 1),
('2015_12_11_063804_table_produkin', 1),
('2015_12_11_063809_table_produkout', 1),
('2015_12_11_063818_table_profil', 1),
('2015_12_11_072923_table_simpanan', 1),
('2015_12_11_072939_table_simpanan_transaksi', 1),
('2015_12_11_073028_table_unit', 1),
('2015_12_11_073050_table_bank', 1),
('2015_12_11_073051_table_produk', 1),
('2015_12_11_073052_table_vendor', 1),
('2015_12_24_015642_table_pengaturan_pinjaman', 1),
('2015_12_24_015653_table_pinjaman', 1),
('2015_12_25_000000_create_users_table', 1),
('2015_12_25_100000_create_password_resets_table', 1),
('2016_01_04_073043_Module_Table', 1),
('2016_01_05_072658_role_table', 1),
('2016_01_07_011208_role_acl_table', 1),
('2016_01_07_060538_table_simpanan_kolektif', 1),
('2016_01_08_011209_table_realisasi_pinjaman', 1),
('2016_01_08_011234_table_pembayaran_pinjaman', 1),
('2016_01_08_054441_table_jenis_jaminan', 1),
('2016_01_08_065755_table_jaminan_pinjaman', 1),
('2016_01_11_013510_create_table_transaksi_sementara', 1),
('2016_01_11_062427_create_table_transaksi_detail', 1),
('2016_01_12_044635_create_table_transaksi_header', 1),
('2016_01_12_045242_create_table_laporan_kasir', 1),
('2016_02_06_134014_create_table_kas', 1),
('2016_03_23_044043_table_simpanan_akumulasi', 1),
('2016_04_06_054633_table_jaminan_simpanan', 1),
('2016_04_06_054637_table_jaminan_emas', 1),
('2016_04_06_054647_table_jaminan_elektronik', 1),
('2016_04_06_054718_table_jaminan_kendaraan', 1),
('2016_04_06_054729_table_jaminan_bangunan', 1),
('2016_04_06_054735_table_jaminan_tanpa', 1),
('2016_04_12_133106_add_saldo_akhir_in_simpanan_transaksi', 1),
('2016_04_13_074501_tambah_posting_dijurnal_header_detail', 1),
('2016_04_14_091325_add_table_proses_simpanan_header', 1),
('2016_04_14_091336_add_table_proses_simpanan_detail', 1),
('2016_04_16_095731_add_column_on_proses_simpanan', 1),
('2016_04_19_161214_pengaturan_akuns', 1),
('2016_04_19_161850_pengaturan_akun_relasi', 1),
('2016_04_20_041149_add_column_autodebet_on_simpanan', 1),
('2016_04_20_061752_create_iklan', 1),
('2016_04_20_064151_add_colun_tipe_on_pembayaran', 1),
('2016_04_29_034515_add_column_on_cabang', 1),
('2016_04_29_085129_add_foreignkey_on_user_to_role', 1),
('2016_04_29_085237_add_foreignkey_on_roleacl_to_modulerole', 1),
('2016_04_29_091142_add_foreignkey_on_anggota_to_cabang', 1),
('2016_04_29_092603_add_foreignkey_on_anggota_to_cabang2', 1),
('2016_04_30_085050_add_column_on_anggota', 1),
('2016_05_03_031756_drop_column_on_nomor', 1),
('2016_05_03_042048_add_column_on_nomr', 1),
('2016_05_04_063312_change_anggota', 1),
('2016_05_10_035406_ubah_column_pengaturan_pinjaman', 1),
('2016_05_10_164520_create_jenistransaksi_table', 1),
('2016_05_11_041841_create_retur_table', 1),
('2016_05_11_042723_add_relasi_barang_kevendor', 1),
('2016_05_11_045852_add_no_faktur_on_barang', 1),
('2016_05_11_051422_add_coloumn_foto_on_produk', 1),
('2016_05_14_093020_add_column_on_role', 1),
('2016_05_15_172745_add_icon', 1),
('2016_05_16_072645_create_stok_minimum', 1),
('2016_05_16_081447_create_stok_minimum2', 1),
('2016_05_16_083117_create_produk2', 1),
('2016_05_16_190822_kasid', 1),
('2016_05_19_042347_change_prosuk_disc', 1),
('2016_05_24_012817_add_rek_customer', 1),
('2016_05_24_190216_column_denda_pinjaman', 1),
('2016_05_26_115146_PembelianSupller', 1),
('2016_05_26_123617_PembelianSupplierDetail', 1),
('2016_05_27_065443_create_iklan2', 1),
('2016_05_28_122610_table_autodebet_pinjaman_header', 1),
('2016_05_28_172533_add_column_on_pembayaran', 1),
('2016_05_28_172630_table_autodebet_pinjaman_detail', 1),
('2016_05_28_185023_update_column_pembayaran', 1),
('2016_06_01_184131_add_column_cabang_on_produk3', 1),
('2016_06_01_184218_add_column_cabang_on_produk2', 1),
('2016_06_06_050126_create_transaksi_header2_table', 1),
('2016_06_06_050144_create_transaksi_detail2_table', 1),
('2016_06_06_053455_create_cabang2_table', 1),
('2016_06_07_170044_create_sementara_retur_table', 1),
('2016_06_07_170140_create_header_retur_table', 1),
('2016_06_09_084103_create_detail_retur_table', 1),
('2016_06_11_205223_add_revcolumn_on_anggota', 1),
('2016_06_12_034248_add_column_rekening_on_koperasi', 1),
('2016_06_13_200142_add_column_default_on_matauang', 1),
('2016_06_13_211145_add_norek_on_cabang', 1),
('2016_06_14_204639_add_column_ket_on_kolektif', 1),
('2016_06_14_235926_add_gambar_on_pinjaman', 1),
('2016_06_15_000712_table_attach_doc', 1),
('2016_06_18_212216_fix_typo', 1),
('2016_06_21_221712_fix_typo_on_pembelian', 1),
('2016_06_22_092932_add_col_nofaktur_on_penerimaan', 1),
('2016_06_22_100544_add_col_proc_on_produk', 1),
('2016_06_22_124218_add_tdetail2_table', 1),
('2016_06_22_124520_add_tsementara2_table', 1),
('2016_06_22_171412_add_invoice', 1),
('2016_06_30_151236_update_norek', 1),
('2016_07_09_162247_add_tgl_bayar_onpinjaman', 1),
('2016_07_09_235435_change_hari_kolek', 1),
('2016_07_14_185429_change_no_rekening', 1),
('2016_07_16_190122_add_persen_hari_on_pinjaman', 1),
('2016_07_27_054110_add_lim_trans_cs', 1),
('2016_07_27_054739_add_parent_on_pinjaman', 1),
('2016_07_27_062218_add_kode_cabang_rekening', 1),
('2016_07_27_091531_cabang_transaksi_sementara', 1),
('2016_07_29_103755_add_id_terima', 1),
('2016_07_30_081026_tipe_header', 1),
('2016_08_02_055949_add_table_approve', 1),
('2016_08_04_025323_add_kode_on_profil', 1),
('2016_08_04_025520_table_kode_rek_cabang', 1),
('2016_08_04_025551_table_kategori_shu_header', 1),
('2016_08_04_025557_table_kategori_shu_detail', 1),
('2016_08_04_034116_add_stok_min', 1),
('2016_08_04_081247_create_mastok_table', 1),
('2016_08_04_081938_add_table_mastok', 1),
('2016_08_04_082409_add_table_mastok2', 1),
('2016_08_04_101039_add_status_anggota', 1),
('2016_08_05_065010_add_maping_produk', 1),
('2016_08_05_144729_table_role_approve', 1),
('2016_08_06_072351_drop_column_on_produk', 1),
('2016_08_07_092347_produk_expired', 1),
('2016_08_08_033917_add_shu_on_simpanan_pinjaman_produk', 1),
('2016_08_08_035208_foreign_key_shu', 1),
('2016_08_09_053610_add_keterangan_on_retur', 1),
('2016_08_10_122250_change_jenis_anggota', 1),
('2016_08_10_122302_add_tipe_pinjaman', 1),
('2016_08_15_051045_added_opname_stok', 1),
('2016_08_17_130616_editstok_table', 1),
('2016_08_17_174404_editstok2_table', 1),
('2016_08_18_140234_add_editsupplier_table', 1),
('2016_08_20_050615_bea_admin', 1),
('2016_08_27_061709_add_jenis_retur', 1),
('2016_08_27_063427_create_promo_header_table', 1),
('2016_08_27_063515_create_promo_detail_table', 1),
('2016_09_02_092237_add_akun_admin_pinjaman', 1),
('2016_09_02_092335_add_table_aset', 1),
('2016_09_02_092352_add_akun_on_cabang', 1),
('2016_09_02_095843_detail_penyusutan_aset', 1),
('2016_09_03_142311_add_bea_admin_on_realisasi', 1),
('2016_09_06_083243_add_tipe_autodebet', 1),
('2016_09_09_121508_out_saldo', 1),
('2016_09_09_125141_create_hpp_table', 1),
('2016_09_12_123638_tgl_penyusutan', 1),
('2016_09_14_080537_pelengkap_akun', 1),
('2016_09_17_042457_autodebet_shu', 1),
('2016_09_21_080516_add_receive_pengiriman', 1),
('2016_09_23_071747_create_add_hpp', 1),
('2016_09_23_074459_status_ttp_pinjaman', 1),
('2016_09_24_080723_add_periode_autodebet', 1),
('2016_09_26_114907_akses_penutupan', 1),
('2016_09_26_115942_autodebet_waserda', 1),
('2016_09_26_115950_autodebet_waserda_detail', 1),
('2016_09_27_062622_add_tgl_pengiriman_pembelian', 1),
('2016_09_28_100940_add_tipe_aksesttp', 1),
('2016_09_28_111117_akses_postingjurnal', 1),
('2016_09_28_112622_add_autocreate_simpanan', 1),
('2016_09_29_084949_akses_edit_pembeliansupp', 1),
('2016_09_29_105418_add_konsinyasi_barang', 1),
('2016_10_03_063215_konsinyasi', 1),
('2016_10_03_080816_add_approved_pembelian', 1),
('2016_10_04_052100_add_expired_mastok', 1),
('2016_10_04_083802_add_expired', 1),
('2016_10_04_124106_simpin_bunga', 1),
('2016_10_06_104942_add_on_pos', 1),
('2016_10_10_034404_change_type_data_on_pos', 1),
('2016_10_10_035413_change_type_data_pos', 1),
('2016_10_10_115157_shu_cabang_waserda', 1),
('2016_10_10_115333_update_customer_bank', 1),
('2016_10_12_121229_fix_jurnal_pinjaman', 1),
('2016_10_13_035032_add_cabang_on_mstok', 1),
('2016_10_14_132410_table_module_waserda', 1),
('2016_10_14_132434_table_role_acl_waserda', 1),
('2016_10_19_064442_change_produk_out', 1),
('2016_10_19_092853_add_expired_produkout', 1),
('2016_10_19_094102_add_hargabeli_on_produkout', 1),
('2016_10_20_082837_status_tranaksi_detail', 1),
('2016_10_20_083800_pembagian_shu', 1),
('2016_10_20_103457_status_approve_pinjaman', 1),
('2016_10_20_120501_status_approve_simpanan', 1),
('2016_10_23_193123_status_transaksi_detail', 1),
('2016_10_23_193210_status_wajib_simpanan', 1),
('2016_10_23_195440_change_autodebet_waserda', 1),
('2016_10_24_083309_add_bulan_autodebet_waserda', 1),
('2016_10_26_100434_add_diskon_on_pos', 2),
('2016_10_26_191114_add_diskon_on_pos_transaksi_sementara', 3),
('2016_10_26_094734_change_jumlah_kas', 4),
('2016_10_27_211904_add_diskon_on_transaksi_header', 5),
('2016_11_02_093512_change_table_produkin', 6),
('2016_11_03_145842_add_cabang_on_produkin', 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `modules`
--

CREATE TABLE `modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_parent` int(11) DEFAULT NULL,
  `module_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `menu_mask` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `menu_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `menu_icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `menu_order` int(11) NOT NULL,
  `divider` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `modules`
--

INSERT INTO `modules` (`id`, `menu_parent`, `module_name`, `menu_mask`, `menu_path`, `menu_icon`, `menu_order`, `divider`, `created_at`, `updated_at`) VALUES
(1, 0, 'Master', 'Master', '', 'ti-harddrives', 1, 0, '2016-10-25 03:15:08', '2016-10-25 03:15:08'),
(2, 0, 'Simpanan', 'Simpanan', '', 'ti-book', 2, 0, '2016-10-25 03:15:08', '2016-10-25 03:15:08'),
(3, 0, 'Pinjaman', 'Pinjaman', '', 'ti-hand-drag', 3, 0, '2016-10-25 03:15:08', '2016-10-25 03:15:08'),
(4, 0, 'Akuntansi', 'Akuntansi', '', 'ti-briefcase', 4, 0, '2016-10-25 03:15:09', '2016-10-25 03:15:09'),
(5, 0, 'Laporan', 'Laporan', '', 'ti-receipt', 5, 0, '2016-10-25 03:15:09', '2016-10-25 03:15:09'),
(6, 0, 'Pengaturan', 'Pengaturan', '', 'ti-settings', 6, 0, '2016-10-25 03:15:09', '2016-10-25 03:15:09'),
(7, 0, 'Approve', 'Approve', '', 'ti-comments-smiley', 7, 0, '2016-10-25 03:15:09', '2016-10-25 03:15:09'),
(8, 1, 'Daftar Customer', 'Daftar Customer', 'master/customer', 'ti-user', 1, 0, '2016-10-25 03:15:09', '2016-10-25 03:15:09'),
(9, 1, 'Daftar Unit', 'Daftar Unit', 'master/unit', 'ti-filter', 2, 0, '2016-10-25 03:15:09', '2016-10-25 03:15:09'),
(10, 1, 'Daftar Kolektibilitas', 'Daftar Kolektibilitas', 'master/kolektibilitas', 'ti-notepad', 3, 0, '2016-10-25 03:15:09', '2016-10-25 03:15:09'),
(11, 1, 'Daftar Mata Uang', 'Daftar Mata Uang', 'master/matauang', 'ti-money', 4, 0, '2016-10-25 03:15:09', '2016-10-25 03:15:09'),
(12, 1, 'Daftar Bank', 'Daftar Bank', 'master/bank', 'ti-stamp', 5, 0, '2016-10-25 03:15:09', '2016-10-25 03:15:09'),
(13, 1, 'Daftar Barang', 'Daftar Barang', 'master/barang', 'ti-package', 6, 0, '2016-10-25 03:15:09', '2016-10-25 03:15:09'),
(14, 1, 'Daftar Vendor', 'Daftar Vendor', 'master/vendor', 'ti-truck', 7, 0, '2016-10-25 03:15:09', '2016-10-25 03:15:09'),
(15, 1, 'Daftar Kategori', 'Daftar Kategori', 'master/kategori', 'ti-layers', 8, 0, '2016-10-25 03:15:09', '2016-10-25 03:15:09'),
(16, 1, 'Daftar Cabang', 'Daftar Cabang', 'master/cabang', 'ti-map-alt', 9, 1, '2016-10-25 03:15:09', '2016-10-25 03:15:09'),
(17, 2, 'Pengaturan Simpanan', 'Pengaturan Simpanan', 'simpanan/pengaturan', 'ti-panel', 1, 0, '2016-10-25 03:15:09', '2016-10-25 03:15:09'),
(18, 2, 'Daftar Simpanan', 'Daftar Simpanan', 'simpanan', 'ti-book', 2, 0, '2016-10-25 03:15:10', '2016-10-25 03:15:10'),
(19, 2, 'Daftar Transaksi', 'Daftar Transaksi', 'simpanan/transaksi', 'ti-exchange-vertical', 3, 0, '2016-10-25 03:15:10', '2016-10-25 03:15:10'),
(20, 2, 'Setor / Tarik', 'Setor / Tarik', 'simpanan/transaksi/create', 'ti-write', 4, 0, '2016-10-25 03:15:10', '2016-10-25 03:15:10'),
(21, 2, 'Setoran Kolektif', 'Setoran Kolektif', 'simpanan/kolektif', 'ti-hand-drag', 5, 0, '2016-10-25 03:15:10', '2016-10-25 03:15:10'),
(22, 2, 'Mutasi Simpanan', 'Mutasi Simpanan', 'simpanan/mutasi', 'ti-menu-alt', 6, 0, '2016-10-25 03:15:10', '2016-10-25 03:15:10'),
(23, 2, 'Proses Simpanan', 'Proses Simpanan', 'simpanan/proses', 'ti-envelope', 7, 0, '2016-10-25 03:15:10', '2016-10-25 03:15:10'),
(24, 3, 'Pengaturan Pinjaman', 'Pengaturan Pinjaman', 'pinjaman/pengaturan', 'ti-panel', 1, 0, '2016-10-25 03:15:10', '2016-10-25 03:15:10'),
(25, 3, 'Daftar Pinjaman', 'Daftar Pinjaman', 'pinjaman', 'ti-book', 2, 0, '2016-10-25 03:15:10', '2016-10-25 03:15:10'),
(26, 3, 'Realisasi Pinjaman', 'Realisasi Pinjaman', 'pinjaman/realisasi', 'ti-import', 3, 0, '2016-10-25 03:15:10', '2016-10-25 03:15:10'),
(27, 3, 'Daftar Pembayaran', 'Daftar Pembayaran', 'pinjaman/pembayaran', 'ti-agenda', 4, 0, '2016-10-25 03:15:10', '2016-10-25 03:15:10'),
(28, 3, 'Bayar Pinjaman', 'Bayar Pinjaman', 'pinjaman/pembayaran/create', 'ti-export', 5, 0, '2016-10-25 03:15:10', '2016-10-25 03:15:10'),
(29, 3, 'Mutasi Pinjaman', 'Mutasi Pinjaman', 'pinjaman/mutasi', 'ti-menu-alt', 6, 0, '2016-10-25 03:15:10', '2016-10-25 03:15:10'),
(30, 3, 'Reschedule Pinjaman', 'Reschedule Pinjaman', 'pinjaman/reschedule', 'ti-spray', 7, 0, '2016-10-25 03:15:10', '2016-10-25 03:15:10'),
(31, 4, 'Akun Perkiraan', 'Akun Perkiraan', 'akuntansi/perkiraan', 'ti-book', 1, 1, '2016-10-25 03:15:10', '2016-10-25 03:15:10'),
(32, 4, 'Daftar Jurnal', 'Daftar Jurnal', 'akuntansi/jurnal/semua', 'ti-agenda', 2, 0, '2016-10-25 03:15:10', '2016-10-25 03:15:10'),
(33, 4, 'Buku Besar', 'Buku Besar', 'akuntansi/bukubesar', 'ti-package', 3, 1, '2016-10-25 03:15:10', '2016-10-25 03:15:10'),
(34, 4, 'Daftar Kas', 'Daftar Kas', 'akuntansi/daftarkas', 'ti-wallet', 4, 0, '2016-10-25 03:15:10', '2016-10-25 03:15:10'),
(35, 4, 'Kas Masuk', 'Kas Masuk', 'akuntansi/kasmasuk', 'ti-import', 5, 0, '2016-10-25 03:15:11', '2016-10-25 03:15:11'),
(36, 4, 'Kas Keluar', 'Kas Keluar', 'akuntansi/kaskeluar', 'ti-export', 6, 0, '2016-10-25 03:15:11', '2016-10-25 03:15:11'),
(37, 4, 'Kas Transfer', 'Kas Transfer', 'akuntansi/kastransfer', 'ti-exchange-vertical', 7, 1, '2016-10-25 03:15:11', '2016-10-25 03:15:11'),
(38, 4, 'Saldo Awal Akuntansi', 'Saldo Awal Akuntansi', 'akuntansi/saldoawal', 'ti-server', 8, 0, '2016-10-25 03:15:11', '2016-10-25 03:15:11'),
(39, 4, 'Pengaturan Akun', 'Pengaturan Akun', 'akuntansi/pengaturanakun', 'ti-settings', 9, 0, '2016-10-25 03:15:11', '2016-10-25 03:15:11'),
(40, 4, 'Hitung SHU', 'Hitung SHU', 'akuntansi/hitungshu', 'ti-gift', 10, 1, '2016-10-25 03:15:11', '2016-10-25 03:15:11'),
(41, 4, 'Penyusutan Aset', 'Penyusutan Aset', 'akuntansi/penyusutan', 'ti-receipt', 11, 0, '2016-10-25 03:15:11', '2016-10-25 03:15:11'),
(42, 4, 'Proyeksi Simpanan', 'Proyeksi Simpanan', 'akuntansi/proyeksi/simpanan', 'ti-layout-media-overlay', 12, 0, '2016-10-25 03:15:11', '2016-10-25 03:15:11'),
(43, 4, 'Proyeksi Bunga Simpanan', 'Proyeksi Bunga Simpanan', 'akuntansi/proyeksi/simpanan/bunga', 'ti-layout-media-overlay-alt', 13, 0, '2016-10-25 03:15:11', '2016-10-25 03:15:11'),
(44, 4, 'Proyeksi Pendapatan Pinjaman', 'Proyeksi Pendapatan Pinjaman', 'akuntansi/proyeksi/pinjaman', 'ti-layout-media-overlay-alt-2', 14, 1, '2016-10-25 03:15:11', '2016-10-25 03:15:11'),
(45, 5, 'Data Customer', 'Data Customer', 'laporan/customer/data', 'ti-user', 1, 1, '2016-10-25 03:15:11', '2016-10-25 03:15:11'),
(46, 5, 'Daftar Simpanan', 'Daftar Simpanan', 'laporan/simpanan/data', 'ti-book', 2, 0, '2016-10-25 03:15:11', '2016-10-25 03:15:11'),
(47, 5, 'Transaksi Simpanan', 'Transaksi Simpanan', 'laporan/simpanan/transaksi', 'ti-exchange-vertical', 3, 0, '2016-10-25 03:15:11', '2016-10-25 03:15:11'),
(48, 5, 'Saldo Simpanan', 'Saldo Simpanan', 'laporan/simpanan/saldo', 'ti-money', 4, 0, '2016-10-25 03:15:11', '2016-10-25 03:15:11'),
(49, 5, 'Saldo Simpanan Kolom Jenis', 'Saldo Simpanan Kolom Jenis', 'laporan/simpanan/saldo/jenis', 'ti-receipt', 5, 1, '2016-10-25 03:15:11', '2016-10-25 03:15:11'),
(50, 5, 'Daftar Pinjaman', 'Daftar Pinjaman', 'laporan/pinjaman/data', 'ti-book', 6, 0, '2016-10-25 03:15:11', '2016-10-25 03:15:11'),
(51, 5, 'Realisasi Pinjaman', 'Realisasi Pinjaman', 'laporan/pinjaman/realisasi', 'ti-import', 7, 0, '2016-10-25 03:15:11', '2016-10-25 03:15:11'),
(52, 5, 'Saldo Pinjaman', 'Saldo Pinjaman', 'laporan/pinjaman/saldo', 'ti-money', 8, 0, '2016-10-25 03:15:11', '2016-10-25 03:15:11'),
(53, 5, 'Transaksi Pinjaman', 'Trasaksi Pinjaman', 'laporan/pinjaman/transaksi', 'ti-agenda', 9, 0, '2016-10-25 03:15:12', '2016-10-25 03:15:12'),
(54, 5, 'Kolektibilitas Pinjaman', 'Kolektibilitas Pinjaman', 'laporan/pinjaman/kolektibilitas', 'ti-map', 10, 1, '2016-10-25 03:15:12', '2016-10-25 03:15:12'),
(55, 5, 'Daftar Akun Perkiraan', 'Daftar Akun Perkiraan', 'laporan/perkiraan', 'ti-book', 11, 0, '2016-10-25 03:15:12', '2016-10-25 03:15:12'),
(56, 5, 'Transaksi Kas', 'Transaksi Kas', 'laporan/kas', 'ti-arrow-left', 12, 0, '2016-10-25 03:15:12', '2016-10-25 03:15:12'),
(57, 5, 'Daftar Jurnal', 'Daftar Jurnal', 'laporan/jurnal', 'ti-agenda', 13, 1, '2016-10-25 03:15:12', '2016-10-25 03:15:12'),
(58, 5, 'Neraca Saldo', 'Neraca Saldo', 'laporan/neracasaldo', 'ti-lock', 14, 0, '2016-10-25 03:15:12', '2016-10-25 03:15:12'),
(59, 5, 'Neraca Lajur', 'Neraca Lajur', 'laporan/neracalajur', 'ti-bar-chart-alt', 15, 0, '2016-10-25 03:15:12', '2016-10-25 03:15:12'),
(60, 5, 'Neraca', 'Neraca', 'laporan/neraca', 'ti-pulse', 16, 0, '2016-10-25 03:15:12', '2016-10-25 03:15:12'),
(61, 5, 'Laba Rugi', 'Laba Rugi', 'laporan/labarugi', 'ti-stats-up', 17, 1, '2016-10-25 03:15:12', '2016-10-25 03:15:12'),
(62, 6, 'Daftar User', 'Daftar User', 'pengaturan/user', 'ti-user', 1, 0, '2016-10-25 03:15:12', '2016-10-25 03:15:12'),
(63, 6, 'Hak Akses', 'Hak Akses', 'pengaturan/role', 'ti-lock', 2, 0, '2016-10-25 03:15:12', '2016-10-25 03:15:12'),
(64, 6, 'Module', 'Module', 'pengaturan/module', 'ti-menu', 3, 0, '2016-10-25 03:15:12', '2016-10-25 03:15:12'),
(65, 6, 'Profil Koperasi', 'Profil Koperasi', 'pengaturan/profil', 'ti-user', 4, 0, '2016-10-25 03:15:12', '2016-10-25 03:15:12'),
(66, 6, 'Format Nomor', 'Format Nomor', 'pengaturan/nomor', 'ti-key', 5, 1, '2016-10-25 03:15:12', '2016-10-25 03:15:12'),
(67, 4, 'Autodebet Simpanan', 'Autodebet Simpanan', 'akuntansi/autodebet/simpanan', 'ti-envelope', 15, 0, '2016-10-25 03:15:12', '2016-10-25 03:15:12'),
(68, 4, 'Autodebet Pinjaman', 'Autodebet Pinjaman', 'akuntansi/autodebet/pinjaman', 'ti-envelope', 16, 0, '2016-10-25 03:15:13', '2016-10-25 03:15:13'),
(69, 4, 'Autodebet Waserda', 'Autodebet Waserda', 'akuntansi/autodebet/waserda', 'ti-envelope', 17, 0, '2016-10-25 03:15:13', '2016-10-25 03:15:13'),
(70, 7, 'Approve List Simpanan', 'Approve List Simpanan', 'pengaturan/approve/simpanan', 'ti-comments-smiley', 1, 0, '2016-10-25 03:15:13', '2016-10-25 03:15:13'),
(71, 7, 'Approve List Pinjaman', 'Approve List Pinjaman', 'pengaturan/approve/pinjaman', 'ti-comments-smiley', 2, 0, '2016-10-25 03:15:13', '2016-10-25 03:15:13'),
(72, 7, 'Approve List Waserda', 'Approve List Waserda', 'pengaturan/approve/waserda', 'ti-comments-smiley', 3, 0, '2016-10-25 03:15:13', '2016-10-25 03:15:13'),
(73, 5, 'Stok Barang', 'Stok Barang', 'laporan/waserda/stok', 'ti-pin2', 18, 0, '2016-10-25 03:15:13', '2016-10-25 03:15:13'),
(74, 5, 'Penjualan', 'Penjualan', 'laporan/waserda/penjualan', 'ti-stats-up', 19, 0, '2016-10-25 03:15:13', '2016-10-25 03:15:13'),
(75, 5, 'Penjualan Anggota', 'Penjualan Anggota', 'laporan/waserda/penjualan/anggota', 'ti-stats-up', 20, 0, '2016-10-25 03:15:13', '2016-10-25 03:15:13'),
(76, 5, 'Penjualan Hpp', 'Penjualan Hpp', 'laporan/waserda/penjualan/hpp', 'ti-stats-down', 21, 0, '2016-10-25 03:15:13', '2016-10-25 03:15:13'),
(77, 1, 'Daftar Cabang Rekening', 'Daftar Cabang Rekening', 'master/cabangrekening', 'ti-shield', 10, 0, '2016-10-25 03:15:13', '2016-10-25 03:15:13'),
(78, 1, 'Daftar Kelompok SHU', 'Daftar Kelompok SHU', 'master/katshuheader', 'ti-direction', 11, 0, '2016-10-25 03:15:13', '2016-10-25 03:15:13'),
(79, 1, 'Daftar SHU', 'Daftar SHU', 'master/katshudetail', 'ti-direction-alt', 12, 0, '2016-10-25 03:15:13', '2016-10-25 03:15:13'),
(80, 1, 'sfsa', 'sdf', 'master/barang', 'ti-arrow-left', 4, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `modules_waserda`
--

CREATE TABLE `modules_waserda` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode` bigint(20) NOT NULL,
  `nama` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `modules_waserda`
--

INSERT INTO `modules_waserda` (`id`, `kode`, `nama`, `path`, `created_at`, `updated_at`) VALUES
(1, 9999999991, 'Informasi Instansi', 'pos/master', '2016-10-25 03:15:34', '2016-10-25 03:15:34'),
(2, 9999999992, 'Iklan', 'pos/master/iklan', '2016-10-25 03:15:34', '2016-10-25 03:15:34'),
(3, 9999999993, 'Jenis Transaksi', 'pos/master/jenis', '2016-10-25 03:15:34', '2016-10-25 03:15:34'),
(4, 9999999994, 'Cek Saldo', 'pos/ceksaldo', '2016-10-25 03:15:34', '2016-10-25 03:15:34'),
(5, 9999999995, 'Pembayaran', 'pos/payment', '2016-10-25 03:15:34', '2016-10-25 03:15:34'),
(6, 9999999996, 'Tahan Transaksi', 'pos/tahan', '2016-10-25 03:15:34', '2016-10-25 03:15:34'),
(7, 9999999997, 'Retur', 'pos/retur', '2016-10-25 03:15:34', '2016-10-25 03:15:34'),
(8, 9999999998, 'List Barang Belanjaan', 'pos/penjualan', '2016-10-25 03:15:34', '2016-10-25 03:15:34'),
(9, 9999999971, 'Proses Hitung HPP', 'pos/hpp/akumulasi', '2016-10-25 03:15:34', '2016-10-25 03:15:34'),
(10, 9999999972, 'Laporan Stok Barang', 'pos/laporan/stok/barang', '2016-10-25 03:15:34', '2016-10-25 03:15:34'),
(11, 9999999973, 'Laporan HPP', 'pos/laporan/hpp', '2016-10-25 03:15:34', '2016-10-25 03:15:34'),
(12, 9999999974, 'Laporan Penjualan', 'pos/laporan/transaksi/penjualan', '2016-10-25 03:15:34', '2016-10-25 03:15:34'),
(13, 9999999975, 'Laporan Penjualan Anggota', 'pos/laporan/transaksi/anggota', '2016-10-25 03:15:34', '2016-10-25 03:15:34'),
(14, 9999999976, 'Retur Penjualan', 'pos/laporan/transaksi/retur', '2016-10-25 03:15:34', '2016-10-25 03:15:34'),
(15, 9999999977, 'Rekap Penjualan', 'pos/laporan/rekap', '2016-10-25 03:15:34', '2016-10-25 03:15:34'),
(16, 9999999977, 'Fast Moving & Slow Moving', 'pos/laporan/transaksi/fastmoving/slowmoving', '2016-10-25 03:15:34', '2016-10-25 03:15:34'),
(17, 9999999981, 'Pembelian Supplier', 'inventory/supplier/pembelian', '2016-10-25 03:15:34', '2016-10-25 03:15:34'),
(18, 9999999982, 'Penerimaan Supplier', 'inventory/supplier/penerimaan', '2016-10-25 03:15:34', '2016-10-25 03:15:34'),
(19, 9999999983, 'Retur Supplier', 'inventory/supplier/retur', '2016-10-25 03:15:35', '2016-10-25 03:15:35'),
(20, 9999999984, 'Pengiriman Cabang', 'inventory/cabang/pengiriman', '2016-10-25 03:15:35', '2016-10-25 03:15:35'),
(21, 9999999985, 'Penerimaan Cabang', 'inventory/cabang/penerimaan', '2016-10-25 03:15:35', '2016-10-25 03:15:35'),
(22, 9999999986, 'Stock Opname', 'inventory/cabang/opname', '2016-10-25 03:15:35', '2016-10-25 03:15:35'),
(23, 9999999987, 'Laporan Barang Masuk', 'lapbarangmasuk', '2016-10-25 03:15:35', '2016-10-25 03:15:35'),
(24, 9999999988, 'Laporan Barang Keluar', 'lapbarangkeluar', '2016-10-25 03:15:35', '2016-10-25 03:15:35'),
(25, 9999999989, 'Stock Minimum', 'stokminimum', '2016-10-25 03:15:35', '2016-10-25 03:15:35'),
(26, 9999999990, 'Barang Expired', 'inventory/expired', '2016-10-25 03:15:35', '2016-10-25 03:15:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nomor`
--

CREATE TABLE `nomor` (
  `id` int(10) UNSIGNED NOT NULL,
  `modul` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `kode_awal` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `pemisah` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `kode_awal2` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `pemisah2` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `kode_awal3` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `pemisah3` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `kode_awal4` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `kode` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `nomor_now` int(11) NOT NULL,
  `jumlah_digit` int(11) NOT NULL,
  `nomor_akhir` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `nomor`
--

INSERT INTO `nomor` (`id`, `modul`, `kode_awal`, `pemisah`, `kode_awal2`, `pemisah2`, `kode_awal3`, `pemisah3`, `kode_awal4`, `kode`, `nomor_now`, `jumlah_digit`, `nomor_akhir`, `created_at`, `updated_at`) VALUES
(1, 'Master Customer', 'kode', '-', 'digit', '', '', '', '', 'CSC', 0, 5, 0, '2016-10-25 03:15:33', '2016-10-25 03:15:33'),
(2, 'Master Vendor', 'kode', '-', 'digit', '', '', '', '', 'VND', 0, 5, 0, '2016-10-25 03:15:33', '2016-10-25 03:15:33'),
(3, 'Simpanan', 'kode', '-', 'digit', '', '', '', '', 'TRSIMP', 2, 5, 0, '2016-10-25 03:15:33', '2016-10-27 20:06:42'),
(4, 'Pinjaman', 'kode', '-', 'digit', '', '', '', '', 'TRPINJ', 0, 5, 0, '2016-10-25 03:15:33', '2016-10-25 03:15:33'),
(5, 'Jurnal Manual', 'kode', '-', 'digit', '', '', '', '', 'JRM', 0, 5, 0, '2016-10-25 03:15:33', '2016-10-25 03:15:33'),
(6, 'Jurnal Otomatis', 'kode', '-', 'digit', '', '', '', '', 'JRO', 37, 5, 0, '2016-10-25 03:15:33', '2016-11-04 02:09:28'),
(7, 'Kas Masuk', 'kode', '-', 'digit', '', '', '', '', 'KSM', 0, 5, 0, '2016-10-25 03:15:33', '2016-10-25 03:15:33'),
(8, 'Kas Keluar', 'kode', '-', 'digit', '', '', '', '', 'KSK', 0, 5, 0, '2016-10-25 03:15:33', '2016-10-25 03:15:33'),
(9, 'Kas Transfer', 'kode', '-', 'digit', '', '', '', '', 'KST', 0, 5, 0, '2016-10-25 03:15:33', '2016-10-25 03:15:33'),
(10, 'Kas Transfer', 'kode', '-', 'digit', '', '', '', '', 'KST', 0, 5, 0, '2016-10-25 03:15:33', '2016-10-25 03:15:33'),
(11, 'Saldo Awal Akuntansi', 'kode', '-', 'digit', '', '', '', '', 'SAAK', 0, 5, 0, '2016-10-25 03:15:33', '2016-10-25 03:15:33'),
(12, 'Penyusutan Aset', 'kode', '-', 'digit', '', '', '', '', 'PA', 0, 5, 0, '2016-10-25 03:15:33', '2016-10-25 03:15:33'),
(13, 'POS', 'kode', '-', 'digit', '', '', '', '', 'POS', 15, 5, 0, '2016-10-25 03:15:33', '2016-11-07 07:04:47'),
(14, 'Jurnal Transaksi POS', 'kode', '-', 'digit', '', '', '', '', 'TRPOS', 16, 5, 0, '2016-10-25 03:15:33', '2016-11-07 07:04:47'),
(15, 'Pembelian Barang Vendor', 'kode', '-', 'digit', '', '', '', '', 'PMBS', 9, 5, 0, '2016-10-25 03:15:33', '2016-11-03 19:08:58'),
(16, 'Penerimaan Barang Vendor', 'kode', '-', 'digit', '', '', '', '', 'PNMS', 7, 5, 0, '2016-10-25 03:15:33', '2016-11-04 02:09:28'),
(17, 'Retur Barang Vendor', 'kode', '-', 'digit', '', '', '', '', 'RTRS', 1, 5, 0, '2016-10-25 03:15:33', '2016-10-28 00:19:59'),
(18, 'Pengiriman Barang Cabang', 'kode', '-', 'digit', '', '', '', '', 'PNGC', 0, 5, 0, '2016-10-25 03:15:33', '2016-10-25 03:15:33'),
(19, 'Penerimaan Barang Cabang', 'kode', '-', 'digit', '', '', '', '', 'PNMC', 0, 5, 0, '2016-10-25 03:15:34', '2016-10-25 03:15:34'),
(20, 'Stock Opname', 'kode', '-', 'digit', '', '', '', '', 'SOP', 1, 5, 0, '2016-10-25 03:15:34', '2016-10-28 01:08:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembagian_shu`
--

CREATE TABLE `pembagian_shu` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pengaturan` int(10) UNSIGNED DEFAULT NULL,
  `id_anggota` int(10) UNSIGNED DEFAULT NULL,
  `senioritas` int(11) NOT NULL,
  `total_simpanan` decimal(20,2) NOT NULL,
  `total_bunga` decimal(20,2) NOT NULL,
  `total_waserda` decimal(20,2) NOT NULL,
  `keanggotaan` decimal(20,2) NOT NULL,
  `kon_senioritas` decimal(20,2) NOT NULL,
  `kon_simpanan` decimal(20,2) NOT NULL,
  `kon_bunga` decimal(20,2) NOT NULL,
  `kon_waserda` decimal(20,2) NOT NULL,
  `total` decimal(20,2) NOT NULL,
  `terima` decimal(20,2) NOT NULL,
  `mwajib` decimal(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran_pinjaman`
--

CREATE TABLE `pembayaran_pinjaman` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_pinjaman` int(10) UNSIGNED NOT NULL,
  `nomor_transaksi` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bulan_ke` int(11) NOT NULL,
  `tipe` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `tanggal_bayar` date NOT NULL,
  `saldo` decimal(20,2) NOT NULL,
  `pokok` decimal(20,2) NOT NULL,
  `bunga` decimal(20,2) NOT NULL,
  `denda` decimal(20,2) NOT NULL,
  `lain` decimal(20,2) NOT NULL,
  `total` decimal(20,2) NOT NULL,
  `start` tinyint(4) NOT NULL,
  `autodebet` tinyint(4) NOT NULL,
  `keterangan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cara_bayar` enum('TUNAI','SIMPANAN','AUTODEBET') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembeliansupplierdetail`
--

CREATE TABLE `pembeliansupplierdetail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_header` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `sub_total` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stok_sistem` int(11) NOT NULL,
  `stok_fisik` int(11) NOT NULL,
  `tanggal` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tanggal_expired` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `pembeliansupplierdetail`
--

INSERT INTO `pembeliansupplierdetail` (`id`, `id_header`, `id_barang`, `qty`, `sub_total`, `created_at`, `updated_at`, `keterangan`, `stok_sistem`, `stok_fisik`, `tanggal`, `tanggal_expired`) VALUES
(9, 8, 1, 100, 500000.00, '2016-10-31 01:01:14', '2016-10-31 01:02:26', NULL, 0, 0, '2016-10-31', '2017-02-25'),
(10, 8, 2, 100, 400000.00, '2016-10-31 01:01:14', '2016-10-31 01:02:26', NULL, 0, 0, '2016-10-31', '2018-07-12'),
(11, 8, 3, 100, 300000.00, '2016-10-31 01:01:14', '2016-10-31 01:02:26', NULL, 0, 0, '2016-10-31', '2017-11-23'),
(12, 10, 1, 100, 500000.00, '2016-11-03 02:40:36', '2016-11-03 02:40:36', NULL, 0, 0, '2016-11-03', '0000-00-00'),
(13, 10, 2, 100, 400000.00, '2016-11-03 02:40:36', '2016-11-03 02:40:36', NULL, 0, 0, '2016-11-03', '0000-00-00'),
(14, 12, 1, 100, 500000.00, '2016-11-03 02:46:49', '2016-11-03 02:48:51', NULL, 0, 0, '2016-11-03', '2017-06-24'),
(15, 12, 2, 100, 400000.00, '2016-11-03 02:46:49', '2016-11-03 02:48:51', NULL, 0, 0, '2016-11-03', '2019-12-21'),
(16, 14, 1, 100, 500000.00, '2016-11-03 03:05:56', '2016-11-03 03:06:59', NULL, 0, 0, '2016-11-03', '2017-11-04'),
(17, 14, 2, 100, 400000.00, '2016-11-03 03:05:56', '2016-11-03 03:10:03', NULL, 0, 0, '2016-11-03', '2018-11-24'),
(18, 17, 1, 10, 50000.00, '2016-11-03 19:08:58', '2016-11-03 19:09:55', NULL, 0, 0, '2016-11-04', '2018-01-06'),
(19, 17, 2, 10, 40000.00, '2016-11-03 19:08:58', '2016-11-03 19:09:55', NULL, 0, 0, '2016-11-04', '2018-11-24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembeliansupplierheader`
--

CREATE TABLE `pembeliansupplierheader` (
  `id` int(10) UNSIGNED NOT NULL,
  `nopembelian` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_cabang` int(11) DEFAULT NULL,
  `id_vendor` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nofaktur` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start` tinyint(4) NOT NULL,
  `invoice` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_terima` int(11) NOT NULL,
  `tipe` enum('retur','pembelian','penerimaan','cbkirim','cbterima','opname') COLLATE utf8_unicode_ci NOT NULL,
  `jenis_retur` enum('barang','uang') COLLATE utf8_unicode_ci NOT NULL,
  `receive` int(11) NOT NULL,
  `tanggal_kirim` date NOT NULL,
  `approved` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `pembeliansupplierheader`
--

INSERT INTO `pembeliansupplierheader` (`id`, `nopembelian`, `id_cabang`, `id_vendor`, `status`, `tanggal`, `created_at`, `updated_at`, `nofaktur`, `start`, `invoice`, `id_terima`, `tipe`, `jenis_retur`, `receive`, `tanggal_kirim`, `approved`) VALUES
(8, 'PMBS-00005', 1, 1, '', '2016-10-31', '2016-10-31 01:01:14', '2016-10-31 01:01:38', NULL, 1, NULL, 0, 'pembelian', 'barang', 0, '2016-12-24', 1),
(9, 'PNMS-00003', 1, 1, 'Tunai', '2016-10-31', '2016-10-31 01:01:38', '2016-10-31 01:01:38', NULL, 0, NULL, 8, 'penerimaan', 'barang', 0, '0000-00-00', 0),
(10, 'PMBS-00006', 1, 1, '', '2016-11-03', '2016-11-03 02:40:35', '2016-11-03 02:43:51', NULL, 1, NULL, 0, 'pembelian', 'barang', 0, '2016-11-26', 1),
(12, 'PMBS-00007', 1, 1, '', '2016-11-03', '2016-11-03 02:46:48', '2016-11-03 02:47:41', NULL, 1, NULL, 0, 'pembelian', 'barang', 0, '2016-11-26', 1),
(13, 'PNMS-00004', 1, 1, 'Tunai', '2016-11-03', '2016-11-03 02:47:41', '2016-11-03 02:47:41', NULL, 0, NULL, 12, 'penerimaan', 'barang', 0, '0000-00-00', 0),
(14, 'PMBS-00008', 1, 1, '', '2016-11-03', '2016-11-03 03:05:56', '2016-11-03 03:06:13', NULL, 1, NULL, 0, 'pembelian', 'barang', 0, '2016-11-03', 1),
(15, 'PNMS-00005', 1, 1, 'Tunai', '2016-11-03', '2016-11-03 03:06:13', '2016-11-03 03:06:13', NULL, 0, NULL, 14, 'penerimaan', 'barang', 0, '0000-00-00', 0),
(16, 'PNMS-00005', 1, 1, 'Tunai', '2016-11-03', '2016-11-03 03:06:15', '2016-11-03 03:06:15', NULL, 0, NULL, 14, 'penerimaan', 'barang', 0, '0000-00-00', 0),
(17, 'PMBS-00009', 1, 1, '', '2016-11-04', '2016-11-03 19:08:58', '2016-11-03 19:09:27', NULL, 1, NULL, 0, 'pembelian', 'barang', 0, '2016-11-26', 1),
(18, 'PNMS-00007', 1, 1, 'Tunai', '2016-11-04', '2016-11-03 19:09:27', '2016-11-03 19:09:27', NULL, 0, NULL, 17, 'penerimaan', 'barang', 0, '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaturan_akun`
--

CREATE TABLE `pengaturan_akun` (
  `id` int(10) UNSIGNED NOT NULL,
  `laba_tahun_berjalan` int(11) NOT NULL,
  `laba_tahun_sebelumnya` int(11) NOT NULL,
  `dana_cadangan` int(11) NOT NULL,
  `jasa_usaha` int(11) NOT NULL,
  `jasa_modal` int(11) NOT NULL,
  `dana_pengurus` int(11) NOT NULL,
  `dana_karyawan` int(11) NOT NULL,
  `dana_pendidikan` int(11) NOT NULL,
  `dana_sosial` int(11) NOT NULL,
  `dana_pembangunan` int(11) NOT NULL,
  `dana_lain2` int(11) NOT NULL,
  `tipe_akun` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaturan_akuns`
--

CREATE TABLE `pengaturan_akuns` (
  `id` int(10) UNSIGNED NOT NULL,
  `caption` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `pengaturan_akuns`
--

INSERT INTO `pengaturan_akuns` (`id`, `caption`, `status`, `created_at`, `updated_at`) VALUES
(1, 'SHU', 'header', '2016-10-25 03:15:30', '2016-10-25 03:15:30'),
(2, 'SHU Anggota', 'detail', '2016-10-25 03:15:30', '2016-10-25 03:15:30'),
(3, 'Dana Cadangan', 'detail', '2016-10-25 03:15:30', '2016-10-25 03:15:30'),
(4, 'Penjualan', 'header', '2016-10-25 03:15:30', '2016-10-25 03:15:30'),
(5, 'Pemasukan', 'detail', '2016-10-25 03:15:30', '2016-10-25 03:15:30'),
(6, 'Pembangunan', 'detail', '2016-10-25 03:15:31', '2016-10-25 03:15:31'),
(7, 'Dan Lain Lain', 'detail', '2016-10-25 03:15:31', '2016-10-25 03:15:31'),
(8, 'Pengeluaran', 'detail', '2016-10-25 03:15:31', '2016-10-25 03:15:31'),
(9, 'Dana Pengurus', 'detail', '2016-10-25 03:15:31', '2016-10-25 03:15:31'),
(10, 'Dana Karyawan', 'detail', '2016-10-25 03:15:31', '2016-10-25 03:15:31'),
(11, 'Dana Pendidikan', 'detail', '2016-10-25 03:15:31', '2016-10-25 03:15:31'),
(12, 'Dana Sosial', 'detail', '2016-10-25 03:15:31', '2016-10-25 03:15:31'),
(13, 'Jasa Usaha', 'detail', '2016-10-25 03:15:31', '2016-10-25 03:15:31'),
(14, 'Jasa Modal', 'detail', '2016-10-25 03:15:31', '2016-10-25 03:15:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaturan_akun_relasi`
--

CREATE TABLE `pengaturan_akun_relasi` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_header` int(11) NOT NULL,
  `id_detail` int(11) NOT NULL,
  `id_akun` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `pengaturan_akun_relasi`
--

INSERT INTO `pengaturan_akun_relasi` (`id`, `id_header`, `id_detail`, `id_akun`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 12, '2016-10-25 03:15:31', '2016-10-26 01:08:21'),
(2, 1, 3, 15, '2016-10-25 03:15:31', '2016-10-26 01:08:21'),
(3, 4, 5, 12, '2016-10-25 03:15:31', '2016-10-25 03:15:31'),
(4, 1, 6, 15, '2016-10-25 03:15:31', '2016-10-26 01:08:21'),
(5, 1, 7, 16, '2016-10-25 03:15:31', '2016-10-26 01:08:21'),
(6, 4, 8, 17, '2016-10-25 03:15:31', '2016-10-25 03:15:31'),
(7, 1, 9, 16, '2016-10-25 03:15:31', '2016-10-26 01:08:21'),
(8, 1, 10, 15, '2016-10-25 03:15:31', '2016-10-26 01:08:21'),
(9, 1, 11, 15, '2016-10-25 03:15:31', '2016-10-26 01:08:21'),
(10, 1, 12, 16, '2016-10-25 03:15:31', '2016-10-26 01:08:22'),
(11, 1, 13, 16, '2016-10-25 03:15:31', '2016-10-26 01:08:22'),
(12, 1, 14, 15, '2016-10-25 03:15:31', '2016-10-26 01:08:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaturan_pinjaman`
--

CREATE TABLE `pengaturan_pinjaman` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nama_pinjaman` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `suku_bunga` decimal(5,2) NOT NULL,
  `sistem_bunga` int(10) UNSIGNED NOT NULL,
  `maksimum_waktu` bigint(20) NOT NULL,
  `tipe_maksimum_waktu` enum('hari','bulan') COLLATE utf8_unicode_ci NOT NULL,
  `jumlah_denda_perhari` decimal(20,2) NOT NULL,
  `persen_denda_perhari` decimal(5,2) NOT NULL,
  `toleransi_denda` tinyint(4) NOT NULL,
  `akun_kas_bank` int(10) UNSIGNED NOT NULL,
  `akun_realisasi` int(10) UNSIGNED NOT NULL,
  `akun_angsuran` int(10) UNSIGNED NOT NULL,
  `akun_bunga` int(10) UNSIGNED NOT NULL,
  `akun_administrasi` int(10) UNSIGNED NOT NULL,
  `akun_denda` int(10) UNSIGNED NOT NULL,
  `biaya_provinsi` int(10) UNSIGNED NOT NULL,
  `akun_lain_lain` int(10) UNSIGNED NOT NULL,
  `akun_hapus_pinjaman` int(10) UNSIGNED NOT NULL,
  `kode_awal_rekening` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `jumlah_digit_rekening` tinyint(4) NOT NULL,
  `nomor_akhir_rekening` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tipe_denda_perhari` enum('denda_nominal','saldo_X_perser%_X_hari','angsuran_X_persen%_X_hari','') COLLATE utf8_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gambar2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_shu` int(10) UNSIGNED DEFAULT NULL,
  `tipe_pinjaman` enum('uang','barang') COLLATE utf8_unicode_ci NOT NULL,
  `biaya_admin_bank` decimal(20,2) NOT NULL,
  `biaya_admin_fee` decimal(5,2) NOT NULL,
  `biaya_admin_tambahan` decimal(5,2) NOT NULL,
  `akun_administrasi_bank` int(10) UNSIGNED DEFAULT NULL,
  `akun_administrasi_tambahan` int(10) UNSIGNED DEFAULT NULL,
  `akun_piutang_tak_tertagih` int(10) UNSIGNED DEFAULT NULL,
  `akun_piutang_pinjaman` int(10) UNSIGNED DEFAULT NULL,
  `akun_tampungan_pinjaman` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaturan_shu`
--

CREATE TABLE `pengaturan_shu` (
  `id` int(10) UNSIGNED NOT NULL,
  `dana_cadangan` int(11) NOT NULL,
  `shu_anggota` int(11) NOT NULL,
  `dana_pengurus` int(11) NOT NULL,
  `dana_karyawan` int(11) NOT NULL,
  `dana_pendidikan` int(11) NOT NULL,
  `dana_sosial` int(11) NOT NULL,
  `dana_pembangunan` int(11) NOT NULL,
  `dana_lain2` int(11) NOT NULL,
  `jasa_usaha` int(11) NOT NULL,
  `jasa_modal` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `jumlah_shulabarugi` decimal(10,2) NOT NULL,
  `tanggal_pembagian` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaturan_simpanan`
--

CREATE TABLE `pengaturan_simpanan` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `jenis_simpanan` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `suku_bunga` decimal(5,2) NOT NULL,
  `sistem_bunga` int(10) UNSIGNED NOT NULL,
  `saldo_minimum_bunga` decimal(20,2) NOT NULL,
  `saldo_minimum` decimal(20,2) NOT NULL,
  `setoran_minimum` decimal(20,2) NOT NULL,
  `saldo_minimum_pajak` decimal(20,2) NOT NULL,
  `saldo_minimum_shu` decimal(20,2) NOT NULL,
  `menerima_shu` tinyint(4) NOT NULL,
  `administrasi` decimal(20,2) NOT NULL,
  `autodebet` decimal(20,2) NOT NULL,
  `persen_pajak` decimal(5,2) NOT NULL,
  `akun_kas_bank` int(10) UNSIGNED NOT NULL,
  `akun_setoran` int(10) UNSIGNED NOT NULL,
  `akun_penarikan` int(10) UNSIGNED NOT NULL,
  `akun_bunga` int(10) UNSIGNED NOT NULL,
  `akun_administrasi` int(10) UNSIGNED NOT NULL,
  `akun_pajak` int(10) UNSIGNED NOT NULL,
  `kode_awal_rekening` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `jumlah_digit_rekening` tinyint(4) NOT NULL,
  `nomor_akhir_rekening` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_shu` int(10) UNSIGNED DEFAULT NULL,
  `autocreate` int(11) NOT NULL,
  `wajibpokok` tinyint(4) NOT NULL,
  `pokokstat` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `pengaturan_simpanan`
--

INSERT INTO `pengaturan_simpanan` (`id`, `kode`, `jenis_simpanan`, `suku_bunga`, `sistem_bunga`, `saldo_minimum_bunga`, `saldo_minimum`, `setoran_minimum`, `saldo_minimum_pajak`, `saldo_minimum_shu`, `menerima_shu`, `administrasi`, `autodebet`, `persen_pajak`, `akun_kas_bank`, `akun_setoran`, `akun_penarikan`, `akun_bunga`, `akun_administrasi`, `akun_pajak`, `kode_awal_rekening`, `jumlah_digit_rekening`, `nomor_akhir_rekening`, `created_at`, `updated_at`, `id_shu`, `autocreate`, `wajibpokok`, `pokokstat`) VALUES
(1, 'SP', 'Simpanan Pokok', '6.00', 1, '0.00', '0.00', '100000.00', '0.00', '0.00', 0, '0.00', '0.00', '0.00', 1, 1, 1, 1, 1, 1, 'SP', 4, '0', '2016-10-25 03:15:32', '2016-10-25 03:15:32', NULL, 0, 0, 0),
(2, 'SW', 'Simpanan Wajib', '6.00', 1, '0.00', '0.00', '50000.00', '0.00', '0.00', 0, '0.00', '0.00', '0.00', 1, 1, 1, 1, 1, 1, 'SW', 4, '0', '2016-10-25 03:15:32', '2016-10-25 03:15:32', NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyusutan_aset`
--

CREATE TABLE `penyusutan_aset` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode_aset` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nama_aset` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nominal_harga` decimal(20,2) NOT NULL,
  `penyusutan` decimal(20,2) NOT NULL,
  `bulan` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `akun_kas` int(10) UNSIGNED NOT NULL,
  `akun_aset` int(10) UNSIGNED NOT NULL,
  `akun_biaya_penyusutan` int(10) UNSIGNED NOT NULL,
  `akun_akumulasi_penyusutan` int(10) UNSIGNED NOT NULL,
  `akun_keuntungan_aset` int(10) UNSIGNED NOT NULL,
  `akun_kerugian_aset` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyusutan_detail`
--

CREATE TABLE `penyusutan_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_penyusutan` int(10) UNSIGNED NOT NULL,
  `bulan_ke` int(11) NOT NULL,
  `penyusutan` decimal(20,2) NOT NULL,
  `sisa` decimal(20,2) NOT NULL,
  `stat` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `perkiraan`
--

CREATE TABLE `perkiraan` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipe_akun` enum('header','detail') COLLATE utf8_unicode_ci NOT NULL,
  `kelompok` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `kode_akun` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nama_akun` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `kas` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `perkiraan`
--

INSERT INTO `perkiraan` (`id`, `tipe_akun`, `kelompok`, `parent`, `kode_akun`, `nama_akun`, `kas`, `created_at`, `updated_at`) VALUES
(1, 'header', 1, 0, '1-0000', 'ACTIVA', 0, '2016-10-25 03:15:29', '2016-10-25 03:15:29'),
(2, 'header', 2, 0, '2-0000', 'PASIVA', 0, '2016-10-25 03:15:29', '2016-10-25 03:15:29'),
(3, 'header', 3, 0, '3-0000', 'CADANGAN, MODAL & RUGI LABA', 0, '2016-10-25 03:15:29', '2016-10-25 03:15:29'),
(4, 'header', 4, 0, '4-0000', 'PENDAPATAN', 0, '2016-10-25 03:15:29', '2016-10-25 03:15:29'),
(5, 'header', 5, 0, '5-0000', 'HARGA POKOK PENJUALAN', 0, '2016-10-25 03:15:30', '2016-10-25 03:15:30'),
(6, 'header', 6, 0, '6-0000', 'BIAYA UMUM & ADMNISTRASI', 0, '2016-10-25 03:15:30', '2016-10-25 03:15:30'),
(7, 'header', 7, 0, '7-0000', 'PENDAPATAN NON OPERASIONAL', 0, '2016-10-25 03:15:30', '2016-10-25 03:15:30'),
(8, 'header', 8, 0, '8-0000', 'BIAYA NON OPERASIONAL', 0, '2016-10-25 03:15:30', '2016-10-25 03:15:30'),
(9, 'header', 1, 1, '1-1000', 'ACTIVA LANCAR', 0, '2016-10-25 03:15:30', '2016-10-25 03:15:30'),
(10, 'header', 2, 2, '2-1000', 'PASIVA LANCAR', 0, '2016-10-25 03:15:30', '2016-10-25 03:15:30'),
(11, 'header', 1, 9, '1-1100', 'KAS', 0, '2016-10-25 03:15:30', '2016-10-25 03:15:30'),
(12, 'detail', 1, 25, '1-1100-0001', 'KAS', 1, '2016-10-25 03:15:30', '2016-10-25 03:15:30'),
(13, 'header', 2, 10, '2-1100', 'HUTANG USAHA', 0, '2016-10-25 03:15:30', '2016-10-25 03:15:30'),
(14, 'detail', 2, 13, '2-1100-0001', 'HUTANG KEPADA SUPLIER', 0, '2016-10-25 03:15:30', '2016-10-25 03:15:30'),
(15, 'detail', 1, 25, '1-1100-0002', 'KAS BERJALAN', 1, '2016-10-25 03:15:30', '2016-10-25 03:15:30'),
(16, 'detail', 1, 25, '1-1100-0003', 'KAS TETAP', 1, '2016-10-25 03:15:30', '2016-10-25 03:15:30'),
(17, 'detail', 2, 13, '2-1100-0002', 'HUTANG KEPADA ANGGOTA', 0, '2016-10-25 03:15:30', '2016-10-25 03:15:30'),
(18, 'detail', 2, 13, '2-1100-0003', 'HUTANG SIMPAN PINJAM', 0, '2016-10-25 03:15:30', '2016-10-25 03:15:30'),
(19, 'header', 5, 5, '0001', 'pos', 0, '2016-10-26 02:00:29', '2016-10-26 02:00:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pinjaman`
--

CREATE TABLE `pinjaman` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_pinjaman` int(10) UNSIGNED NOT NULL,
  `nomor_pinjaman` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `anggota` int(10) UNSIGNED NOT NULL,
  `tanggal_pengajuan` date NOT NULL,
  `jumlah_pengajuan` decimal(20,2) NOT NULL,
  `jangka_waktu` tinyint(4) NOT NULL,
  `jatuh_tempo` date NOT NULL,
  `jumlah_angsuran_pokok` decimal(20,2) NOT NULL,
  `perhitungan_bunga` enum('bulanan','harian') COLLATE utf8_unicode_ci NOT NULL,
  `digunakan_untuk` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sumber_dana` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kolektibilitas` int(10) UNSIGNED NOT NULL,
  `keterangan` text COLLATE utf8_unicode_ci,
  `status_realisasi` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `status_lunas` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `status_pasangan` enum('Suami','Istri') COLLATE utf8_unicode_ci NOT NULL,
  `nama_pasangan` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pekerjaan_pasangan` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `alamat_pasangan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nomor_telepon_pasangan` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nama_penjamin` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pekerjaan_penjamin` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `alamat_penjamin` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nomor_telepon_penjamin` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nomor_ktp_penjamin` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `re` tinyint(4) NOT NULL,
  `parent` int(11) NOT NULL,
  `status_tutup` int(11) NOT NULL,
  `suku_bunga` decimal(5,2) NOT NULL,
  `sistem_bunga` int(10) UNSIGNED DEFAULT NULL,
  `approved` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `classification` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `unit` int(10) UNSIGNED DEFAULT NULL,
  `curr` int(10) UNSIGNED DEFAULT NULL,
  `harga_jual` decimal(20,2) NOT NULL,
  `harga_beli` decimal(20,2) NOT NULL,
  `disc` decimal(5,2) DEFAULT NULL,
  `disc_nominal` decimal(20,2) NOT NULL,
  `disc_tipe` enum('nominal','percent') COLLATE utf8_unicode_ci NOT NULL,
  `tanggal_awal_diskon` date NOT NULL,
  `tanggal_akhir_diskon` date NOT NULL,
  `stok` int(11) NOT NULL,
  `stok_minimum` int(11) NOT NULL,
  `barcode` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `remark` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `print_label` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ganti_harga` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `kategori` int(10) UNSIGNED DEFAULT NULL,
  `ket` text COLLATE utf8_unicode_ci NOT NULL,
  `untung` decimal(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `foto` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expired` date NOT NULL,
  `status` enum('AKTIF','NONAKTIF') COLLATE utf8_unicode_ci NOT NULL,
  `konsinyasi` int(11) NOT NULL,
  `id_shu` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `nama`, `classification`, `unit`, `curr`, `harga_jual`, `harga_beli`, `disc`, `disc_nominal`, `disc_tipe`, `tanggal_awal_diskon`, `tanggal_akhir_diskon`, `stok`, `stok_minimum`, `barcode`, `remark`, `print_label`, `ganti_harga`, `kategori`, `ket`, `untung`, `created_at`, `updated_at`, `foto`, `expired`, `status`, `konsinyasi`, `id_shu`) VALUES
(1, 'Potatos', 'Indofood', 1, 1, '10000.00', '5000.00', '0.00', '0.00', 'nominal', '2016-10-01', '2016-10-31', 0, 2, '212121', '', '', '', 1, '', '0.00', '2016-10-26 01:19:41', '2016-11-03 19:09:27', 'avatar.jpg', '0000-00-00', 'AKTIF', 0, 1),
(2, 'Oreo', 'Indofood', 1, 1, '8000.00', '4000.00', '25.00', '0.00', 'percent', '2016-10-01', '2016-10-31', 0, 3, '232323', '', '', '', 1, '', '0.00', '2016-10-26 01:25:46', '2016-11-04 02:09:28', 'avatar.jpg', '0000-00-00', 'AKTIF', 0, 1),
(3, 'Cik', 'Indofoof', 1, 1, '5000.00', '3000.00', '0.00', '0.00', 'nominal', '2016-10-01', '2016-10-31', 0, 3, '343434', '', '', '', 1, '', '0.00', '2016-10-30 22:58:42', '2016-11-22 06:22:05', 'avatar.jpg', '0000-00-00', 'AKTIF', 0, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produkin`
--

CREATE TABLE `produkin` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `barcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `merk` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` decimal(20,2) NOT NULL,
  `tanggal` date NOT NULL,
  `expired` date NOT NULL,
  `sub_harga` decimal(20,2) NOT NULL,
  `cabang` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `produkin`
--

INSERT INTO `produkin` (`id`, `created_at`, `updated_at`, `barcode`, `nama`, `merk`, `qty`, `harga`, `tanggal`, `expired`, `sub_harga`, `cabang`) VALUES
(3, '2016-11-03 03:10:03', '2016-11-03 03:10:03', '212121', 'Potatos', 'Indofood', 100, '5000.00', '2016-11-03', '0000-00-00', '500000.00', NULL),
(4, '2016-11-03 03:10:03', '2016-11-03 03:10:03', '232323', 'Oreo', 'Indofood', 100, '4000.00', '2016-11-03', '0000-00-00', '400000.00', NULL),
(5, '2016-11-03 19:09:55', '2016-11-03 19:09:55', '212121', 'Potatos', 'Indofood', 10, '5000.00', '2016-11-04', '2018-01-06', '50000.00', 1),
(6, '2016-11-03 19:09:55', '2016-11-03 19:09:55', '232323', 'Oreo', 'Indofood', 10, '4000.00', '2016-11-04', '2018-11-24', '40000.00', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produkout`
--

CREATE TABLE `produkout` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `barcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `id_cabang` int(10) UNSIGNED DEFAULT NULL,
  `jenis_pembayaran` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `sub_total` decimal(20,2) NOT NULL,
  `expired` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `harga_beli` decimal(20,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `produkout`
--

INSERT INTO `produkout` (`id`, `created_at`, `updated_at`, `barcode`, `nama`, `tanggal`, `id_cabang`, `jenis_pembayaran`, `qty`, `sub_total`, `expired`, `harga_beli`) VALUES
(1, '2016-11-07 00:04:47', '2016-11-07 00:04:47', '232323', 'Oreo', '2016-11-07', 1, 'cash', 2, '16000.00', '2018-11-24', '8000.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk_mapping`
--

CREATE TABLE `produk_mapping` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_produk` int(10) UNSIGNED NOT NULL,
  `id_cabang` int(10) UNSIGNED NOT NULL,
  `stok` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `produk_mapping`
--

INSERT INTO `produk_mapping` (`id`, `id_produk`, `id_cabang`, `stok`, `created_at`, `updated_at`) VALUES
(10, 1, 1, 210, '2016-11-03 03:06:13', '2016-11-03 19:09:27'),
(11, 2, 1, 208, '2016-11-03 10:06:13', '2016-11-07 00:04:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil`
--

CREATE TABLE `profil` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_koperasi` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `alamat_koperasi` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8_unicode_ci NOT NULL,
  `telepon` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `foto` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `kode_pos` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nomor_rekening` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kode` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `profil`
--

INSERT INTO `profil` (`id`, `nama_koperasi`, `alamat_koperasi`, `keterangan`, `telepon`, `foto`, `kode_pos`, `created_at`, `updated_at`, `nomor_rekening`, `kode`) VALUES
(1, 'AXP POS', 'sjdbasjdabsd', '', '0856931641451', '2y10TiJRhON8z1rv7n7laYllme1lZr8lydrw3nOnzxTseZ2Tt23nYPq.png', '21', '2016-10-25 03:15:13', '2016-10-29 07:52:13', '1113131', '11213');

-- --------------------------------------------------------

--
-- Struktur dari tabel `promo_detail`
--

CREATE TABLE `promo_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_header` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `produk` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `qty` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `promo_header`
--

CREATE TABLE `promo_header` (
  `id` int(10) UNSIGNED NOT NULL,
  `keterangan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `akhir_promo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nominal` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `diskon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_cabang` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `proses_simpanan_detail`
--

CREATE TABLE `proses_simpanan_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_proses_header` int(10) UNSIGNED NOT NULL,
  `id_simpanan` int(10) UNSIGNED NOT NULL,
  `bunga` decimal(20,2) NOT NULL,
  `pajak` decimal(20,2) NOT NULL,
  `diterima` decimal(20,2) NOT NULL,
  `kena_pajak` tinyint(4) NOT NULL,
  `autodebet` tinyint(4) NOT NULL,
  `debet` decimal(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `proses_simpanan_header`
--

CREATE TABLE `proses_simpanan_header` (
  `id` int(10) UNSIGNED NOT NULL,
  `tanggal_proses` date NOT NULL,
  `bulan` tinyint(4) NOT NULL,
  `tahun` int(11) NOT NULL,
  `keterangan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `autodebet` tinyint(4) NOT NULL,
  `shunya` int(11) NOT NULL,
  `tanggal_awal` date DEFAULT NULL,
  `tanggal_akhir` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `realisasi_pinjaman`
--

CREATE TABLE `realisasi_pinjaman` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_pinjaman` int(10) UNSIGNED NOT NULL,
  `tanggal_realisasi` date NOT NULL,
  `suku_bunga` int(11) NOT NULL,
  `jangka_waktu` int(11) NOT NULL,
  `biaya_administrasi` decimal(20,2) NOT NULL,
  `biaya_provinsi` decimal(20,2) NOT NULL,
  `biaya_lain` decimal(20,2) NOT NULL,
  `realisasi` decimal(20,2) NOT NULL,
  `uang_diterima` decimal(20,2) NOT NULL,
  `angsuran` decimal(20,2) NOT NULL,
  `keterangan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `biaya_administrasi_bank` decimal(20,2) NOT NULL,
  `biaya_administrasi_tambahan` decimal(20,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `retur`
--

CREATE TABLE `retur` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_barang` int(10) UNSIGNED NOT NULL,
  `tanggal_retur` date NOT NULL,
  `no_retur` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `jml` int(11) NOT NULL,
  `keterangan` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `akses` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `desc`, `akses`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'Admin', 'koperasi', '2016-10-25 03:15:13', '2016-10-25 03:15:13'),
(2, 'SuperVisor', 'Supervisor', 'pos', '2016-10-25 03:15:13', '2016-10-25 03:15:13'),
(3, 'Operator', 'Operator', 'koperasi', '2016-10-25 03:15:13', '2016-10-25 03:15:13'),
(4, 'Kasir', 'Kasir', 'kasir', '2016-10-25 03:15:13', '2016-10-25 03:15:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_acl`
--

CREATE TABLE `role_acl` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `module_id` int(10) UNSIGNED DEFAULT NULL,
  `create_acl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `read_acl` int(11) DEFAULT NULL,
  `update_acl` int(11) DEFAULT NULL,
  `delete_acl` int(11) DEFAULT NULL,
  `module_parent` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `role_acl`
--

INSERT INTO `role_acl` (`id`, `role_id`, `module_id`, `create_acl`, `read_acl`, `update_acl`, `delete_acl`, `module_parent`, `created_at`, `updated_at`) VALUES
(1, 1, 8, '8', 8, 8, 8, 1, '2016-10-25 03:15:27', '2016-10-25 03:15:27'),
(2, 1, 9, '9', 9, 9, 9, 1, '2016-10-25 03:15:27', '2016-10-25 03:15:27'),
(3, 1, 10, '10', 10, 10, 10, 1, '2016-10-25 03:15:27', '2016-10-25 03:15:27'),
(4, 1, 11, '11', 11, 11, 11, 1, '2016-10-25 03:15:27', '2016-10-25 03:15:27'),
(5, 1, 12, '12', 12, 12, 12, 1, '2016-10-25 03:15:27', '2016-10-25 03:15:27'),
(6, 1, 13, '13', 13, 13, 13, 1, '2016-10-25 03:15:27', '2016-10-25 03:15:27'),
(7, 1, 14, '14', 14, 14, 14, 1, '2016-10-25 03:15:27', '2016-10-25 03:15:27'),
(8, 1, 15, '15', 15, 15, 15, 1, '2016-10-25 03:15:27', '2016-10-25 03:15:27'),
(9, 1, 16, '16', 16, 16, 16, 1, '2016-10-25 03:15:27', '2016-10-25 03:15:27'),
(10, 1, 71, '71', 71, 71, 71, 1, '2016-10-25 03:15:27', '2016-10-25 03:15:27'),
(11, 1, 72, '72', 72, 72, 72, 1, '2016-10-25 03:15:27', '2016-10-25 03:15:27'),
(12, 1, 73, '73', 73, 73, 73, 1, '2016-10-25 03:15:27', '2016-10-25 03:15:27'),
(13, 1, 17, '17', 17, 17, 17, 2, '2016-10-25 03:15:27', '2016-10-25 03:15:27'),
(14, 1, 18, '18', 18, 18, 18, 2, '2016-10-25 03:15:27', '2016-10-25 03:15:27'),
(15, 1, 19, '19', 19, 19, 19, 2, '2016-10-25 03:15:27', '2016-10-25 03:15:27'),
(16, 1, 20, '20', 20, 20, 20, 2, '2016-10-25 03:15:27', '2016-10-25 03:15:27'),
(17, 1, 21, '21', 21, 21, 21, 2, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(18, 1, 22, '22', 22, 22, 22, 2, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(19, 1, 23, '23', 23, 23, 23, 2, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(20, 1, 24, '24', 24, 24, 24, 3, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(21, 1, 25, '25', 25, 25, 25, 3, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(22, 1, 26, '26', 26, 26, 26, 3, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(23, 1, 27, '27', 27, 27, 27, 3, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(24, 1, 28, '28', 28, 28, 28, 3, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(25, 1, 29, '29', 29, 29, 29, 3, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(26, 1, 30, '30', 30, 30, 30, 3, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(27, 1, 31, '31', 31, 31, 31, 4, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(28, 1, 32, '32', 32, 32, 32, 4, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(29, 1, 33, '33', 33, 33, 33, 4, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(30, 1, 34, '34', 34, 34, 33, 4, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(31, 1, 35, '35', 35, 35, 33, 4, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(32, 1, 36, '36', 36, 36, 33, 4, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(33, 1, 37, '37', 37, 37, 33, 4, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(34, 1, 38, '38', 38, 38, 38, 4, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(35, 1, 39, '39', 39, 39, 39, 4, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(36, 1, 40, '40', 40, 40, 40, 4, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(37, 1, 41, '41', 41, 41, 41, 4, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(38, 1, 42, '42', 42, 42, 42, 4, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(39, 1, 43, '43', 43, 43, 43, 4, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(40, 1, 44, '44', 44, 44, 44, 4, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(41, 1, 67, '67', 67, 67, 67, 4, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(42, 1, 68, '68', 68, 68, 68, 4, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(43, 1, 45, '45', 45, 45, 45, 5, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(44, 1, 46, '46', 46, 46, 46, 5, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(45, 1, 47, '47', 47, 47, 47, 5, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(46, 1, 48, '48', 48, 48, 48, 5, '2016-10-25 03:15:28', '2016-10-25 03:15:28'),
(47, 1, 49, '49', 49, 49, 49, 5, '2016-10-25 03:15:29', '2016-10-25 03:15:29'),
(48, 1, 50, '50', 50, 50, 50, 5, '2016-10-25 03:15:29', '2016-10-25 03:15:29'),
(49, 1, 51, '51', 51, 51, 51, 5, '2016-10-25 03:15:29', '2016-10-25 03:15:29'),
(50, 1, 52, '52', 52, 52, 52, 5, '2016-10-25 03:15:29', '2016-10-25 03:15:29'),
(51, 1, 53, '53', 53, 53, 53, 5, '2016-10-25 03:15:29', '2016-10-25 03:15:29'),
(52, 1, 54, '54', 54, 54, 54, 5, '2016-10-25 03:15:29', '2016-10-25 03:15:29'),
(53, 1, 55, '55', 55, 55, 55, 5, '2016-10-25 03:15:29', '2016-10-25 03:15:29'),
(54, 1, 56, '56', 56, 56, 56, 5, '2016-10-25 03:15:29', '2016-10-25 03:15:29'),
(55, 1, 57, '57', 57, 57, 57, 5, '2016-10-25 03:15:29', '2016-10-25 03:15:29'),
(56, 1, 58, '58', 57, 58, 58, 5, '2016-10-25 03:15:29', '2016-10-25 03:15:29'),
(57, 1, 59, '59', 59, 59, 59, 5, '2016-10-25 03:15:29', '2016-10-25 03:15:29'),
(58, 1, 60, '60', 60, 60, 60, 5, '2016-10-25 03:15:29', '2016-10-25 03:15:29'),
(59, 1, 61, '61', 61, 61, 61, 5, '2016-10-25 03:15:29', '2016-10-25 03:15:29'),
(60, 1, 62, '62', 62, 62, 62, 6, '2016-10-25 03:15:29', '2016-10-25 03:15:29'),
(61, 1, 63, '63', 63, 63, 63, 6, '2016-10-25 03:15:29', '2016-10-25 03:15:29'),
(62, 1, 64, '64', 64, 64, 64, 6, '2016-10-25 03:15:29', '2016-10-25 03:15:29'),
(63, 1, 65, '65', 65, 65, 65, 6, '2016-10-25 03:15:29', '2016-10-25 03:15:29'),
(64, 1, 66, '66', 66, 66, 66, 6, '2016-10-25 03:15:29', '2016-10-25 03:15:29'),
(65, 1, 69, '69', 69, 69, 69, 7, '2016-10-25 03:15:29', '2016-10-25 03:15:29'),
(66, 1, 70, '70', 70, 70, 70, 7, '2016-10-25 03:15:29', '2016-10-25 03:15:29'),
(67, 2, 8, NULL, NULL, NULL, NULL, 1, '2016-10-25 03:24:12', '2016-10-25 03:24:12'),
(68, 2, 9, NULL, NULL, NULL, NULL, 1, '2016-10-25 03:24:12', '2016-10-25 03:24:12'),
(69, 2, 10, NULL, NULL, NULL, NULL, 1, '2016-10-25 03:24:12', '2016-10-25 03:24:12'),
(70, 2, 11, NULL, NULL, NULL, NULL, 1, '2016-10-25 03:24:13', '2016-10-25 03:24:13'),
(71, 2, 12, NULL, NULL, NULL, NULL, 1, '2016-10-25 03:24:13', '2016-10-25 03:24:13'),
(72, 2, 13, NULL, NULL, NULL, NULL, 1, '2016-10-25 03:24:13', '2016-10-25 03:24:13'),
(73, 2, 14, NULL, NULL, NULL, NULL, 1, '2016-10-25 03:24:13', '2016-10-25 03:24:13'),
(74, 2, 15, NULL, NULL, NULL, NULL, 1, '2016-10-25 03:24:13', '2016-10-25 03:24:13'),
(75, 2, 16, NULL, NULL, NULL, NULL, 1, '2016-10-25 03:24:13', '2016-10-25 03:24:13'),
(76, 2, 17, NULL, NULL, NULL, NULL, 2, '2016-10-25 03:24:13', '2016-10-25 03:24:13'),
(77, 2, 18, NULL, NULL, NULL, NULL, 2, '2016-10-25 03:24:13', '2016-10-25 03:24:13'),
(78, 2, 19, NULL, NULL, NULL, NULL, 2, '2016-10-25 03:24:13', '2016-10-25 03:24:13'),
(79, 2, 20, NULL, NULL, NULL, NULL, 2, '2016-10-25 03:24:13', '2016-10-25 03:24:13'),
(80, 2, 21, NULL, NULL, NULL, NULL, 2, '2016-10-25 03:24:13', '2016-10-25 03:24:13'),
(81, 2, 22, NULL, NULL, NULL, NULL, 2, '2016-10-25 03:24:13', '2016-10-25 03:24:13'),
(82, 2, 23, NULL, NULL, NULL, NULL, 2, '2016-10-25 03:24:13', '2016-10-25 03:24:13'),
(83, 2, 24, NULL, NULL, NULL, NULL, 3, '2016-10-25 03:24:13', '2016-10-25 03:24:13'),
(84, 2, 25, NULL, NULL, NULL, NULL, 3, '2016-10-25 03:24:14', '2016-10-25 03:24:14'),
(85, 2, 26, NULL, NULL, NULL, NULL, 3, '2016-10-25 03:24:14', '2016-10-25 03:24:14'),
(86, 2, 27, NULL, NULL, NULL, NULL, 3, '2016-10-25 03:24:14', '2016-10-25 03:24:14'),
(87, 2, 28, NULL, NULL, NULL, NULL, 3, '2016-10-25 03:24:14', '2016-10-25 03:24:14'),
(88, 2, 29, NULL, NULL, NULL, NULL, 3, '2016-10-25 03:24:14', '2016-10-25 03:24:14'),
(89, 2, 30, NULL, NULL, NULL, NULL, 3, '2016-10-25 03:24:14', '2016-10-25 03:24:14'),
(90, 2, 31, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:14', '2016-10-25 03:24:14'),
(91, 2, 32, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:14', '2016-10-25 03:24:14'),
(92, 2, 33, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:14', '2016-10-25 03:24:14'),
(93, 2, 34, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:14', '2016-10-25 03:24:14'),
(94, 2, 35, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:14', '2016-10-25 03:24:14'),
(95, 2, 36, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:14', '2016-10-25 03:24:14'),
(96, 2, 37, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:14', '2016-10-25 03:24:14'),
(97, 2, 38, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:14', '2016-10-25 03:24:14'),
(98, 2, 39, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:14', '2016-10-25 03:24:14'),
(99, 2, 40, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:14', '2016-10-25 03:24:14'),
(100, 2, 41, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:15', '2016-10-25 03:24:15'),
(101, 2, 42, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:15', '2016-10-25 03:24:15'),
(102, 2, 43, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:15', '2016-10-25 03:24:15'),
(103, 2, 44, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:15', '2016-10-25 03:24:15'),
(104, 2, 45, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:15', '2016-10-25 03:24:15'),
(105, 2, 46, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:15', '2016-10-25 03:24:15'),
(106, 2, 47, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:15', '2016-10-25 03:24:15'),
(107, 2, 48, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:15', '2016-10-25 03:24:15'),
(108, 2, 49, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:15', '2016-10-25 03:24:15'),
(109, 2, 50, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:15', '2016-10-25 03:24:15'),
(110, 2, 51, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:15', '2016-10-25 03:24:15'),
(111, 2, 52, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:15', '2016-10-25 03:24:15'),
(112, 2, 53, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:15', '2016-10-25 03:24:15'),
(113, 2, 54, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:15', '2016-10-25 03:24:15'),
(114, 2, 55, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:15', '2016-10-25 03:24:15'),
(115, 2, 56, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:15', '2016-10-25 03:24:15'),
(116, 2, 57, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:15', '2016-10-25 03:24:15'),
(117, 2, 58, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:15', '2016-10-25 03:24:15'),
(118, 2, 59, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:15', '2016-10-25 03:24:15'),
(119, 2, 60, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:15', '2016-10-25 03:24:15'),
(120, 2, 61, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:16', '2016-10-25 03:24:16'),
(121, 2, 62, NULL, NULL, NULL, NULL, 6, '2016-10-25 03:24:16', '2016-10-25 03:24:16'),
(122, 2, 63, NULL, NULL, NULL, NULL, 6, '2016-10-25 03:24:16', '2016-10-25 03:24:16'),
(123, 2, 64, NULL, NULL, NULL, NULL, 6, '2016-10-25 03:24:16', '2016-10-25 03:24:16'),
(124, 2, 65, NULL, NULL, NULL, NULL, 6, '2016-10-25 03:24:16', '2016-10-25 03:24:16'),
(125, 2, 66, NULL, NULL, NULL, NULL, 6, '2016-10-25 03:24:16', '2016-10-25 03:24:16'),
(126, 2, 67, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:16', '2016-10-25 03:24:16'),
(127, 2, 68, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:16', '2016-10-25 03:24:16'),
(128, 2, 69, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:16', '2016-10-25 03:24:16'),
(129, 2, 70, NULL, NULL, NULL, NULL, 7, '2016-10-25 03:24:16', '2016-10-25 03:24:16'),
(130, 2, 71, NULL, NULL, NULL, NULL, 7, '2016-10-25 03:24:16', '2016-10-25 03:24:16'),
(131, 2, 72, NULL, NULL, NULL, NULL, 7, '2016-10-25 03:24:16', '2016-10-25 03:24:16'),
(132, 2, 73, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:16', '2016-10-25 03:24:16'),
(133, 2, 74, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:16', '2016-10-25 03:24:16'),
(134, 2, 75, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:16', '2016-10-25 03:24:16'),
(135, 2, 76, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:16', '2016-10-25 03:24:16'),
(136, 2, 77, NULL, NULL, NULL, NULL, 1, '2016-10-25 03:24:16', '2016-10-25 03:24:16'),
(137, 2, 78, NULL, NULL, NULL, NULL, 1, '2016-10-25 03:24:16', '2016-10-25 03:24:16'),
(138, 2, 79, NULL, NULL, NULL, NULL, 1, '2016-10-25 03:24:16', '2016-10-25 03:24:16'),
(139, 4, 8, NULL, NULL, NULL, NULL, 1, '2016-10-25 03:24:38', '2016-10-25 03:24:38'),
(140, 4, 9, NULL, NULL, NULL, NULL, 1, '2016-10-25 03:24:38', '2016-10-25 03:24:38'),
(141, 4, 10, NULL, NULL, NULL, NULL, 1, '2016-10-25 03:24:38', '2016-10-25 03:24:38'),
(142, 4, 11, NULL, NULL, NULL, NULL, 1, '2016-10-25 03:24:38', '2016-10-25 03:24:38'),
(143, 4, 12, NULL, NULL, NULL, NULL, 1, '2016-10-25 03:24:38', '2016-10-25 03:24:38'),
(144, 4, 13, NULL, NULL, NULL, NULL, 1, '2016-10-25 03:24:38', '2016-10-25 03:24:38'),
(145, 4, 14, NULL, NULL, NULL, NULL, 1, '2016-10-25 03:24:38', '2016-10-25 03:24:38'),
(146, 4, 15, NULL, NULL, NULL, NULL, 1, '2016-10-25 03:24:38', '2016-10-25 03:24:38'),
(147, 4, 16, NULL, NULL, NULL, NULL, 1, '2016-10-25 03:24:38', '2016-10-25 03:24:38'),
(148, 4, 17, NULL, NULL, NULL, NULL, 2, '2016-10-25 03:24:38', '2016-10-25 03:24:38'),
(149, 4, 18, NULL, NULL, NULL, NULL, 2, '2016-10-25 03:24:38', '2016-10-25 03:24:38'),
(150, 4, 19, NULL, NULL, NULL, NULL, 2, '2016-10-25 03:24:38', '2016-10-25 03:24:38'),
(151, 4, 20, NULL, NULL, NULL, NULL, 2, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(152, 4, 21, NULL, NULL, NULL, NULL, 2, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(153, 4, 22, NULL, NULL, NULL, NULL, 2, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(154, 4, 23, NULL, NULL, NULL, NULL, 2, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(155, 4, 24, NULL, NULL, NULL, NULL, 3, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(156, 4, 25, NULL, NULL, NULL, NULL, 3, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(157, 4, 26, NULL, NULL, NULL, NULL, 3, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(158, 4, 27, NULL, NULL, NULL, NULL, 3, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(159, 4, 28, NULL, NULL, NULL, NULL, 3, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(160, 4, 29, NULL, NULL, NULL, NULL, 3, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(161, 4, 30, NULL, NULL, NULL, NULL, 3, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(162, 4, 31, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(163, 4, 32, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(164, 4, 33, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(165, 4, 34, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(166, 4, 35, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(167, 4, 36, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(168, 4, 37, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(169, 4, 38, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(170, 4, 39, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(171, 4, 40, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(172, 4, 41, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(173, 4, 42, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(174, 4, 43, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(175, 4, 44, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(176, 4, 45, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(177, 4, 46, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(178, 4, 47, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(179, 4, 48, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:39', '2016-10-25 03:24:39'),
(180, 4, 49, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:40', '2016-10-25 03:24:40'),
(181, 4, 50, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:40', '2016-10-25 03:24:40'),
(182, 4, 51, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:40', '2016-10-25 03:24:40'),
(183, 4, 52, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:40', '2016-10-25 03:24:40'),
(184, 4, 53, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:40', '2016-10-25 03:24:40'),
(185, 4, 54, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:40', '2016-10-25 03:24:40'),
(186, 4, 55, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:40', '2016-10-25 03:24:40'),
(187, 4, 56, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:40', '2016-10-25 03:24:40'),
(188, 4, 57, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:40', '2016-10-25 03:24:40'),
(189, 4, 58, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:40', '2016-10-25 03:24:40'),
(190, 4, 59, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:40', '2016-10-25 03:24:40'),
(191, 4, 60, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:40', '2016-10-25 03:24:40'),
(192, 4, 61, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:40', '2016-10-25 03:24:40'),
(193, 4, 62, NULL, NULL, NULL, NULL, 6, '2016-10-25 03:24:40', '2016-10-25 03:24:40'),
(194, 4, 63, NULL, NULL, NULL, NULL, 6, '2016-10-25 03:24:40', '2016-10-25 03:24:40'),
(195, 4, 64, NULL, NULL, NULL, NULL, 6, '2016-10-25 03:24:40', '2016-10-25 03:24:40'),
(196, 4, 65, NULL, NULL, NULL, NULL, 6, '2016-10-25 03:24:40', '2016-10-25 03:24:40'),
(197, 4, 66, NULL, NULL, NULL, NULL, 6, '2016-10-25 03:24:40', '2016-10-25 03:24:40'),
(198, 4, 67, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:40', '2016-10-25 03:24:40'),
(199, 4, 68, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:41', '2016-10-25 03:24:41'),
(200, 4, 69, NULL, NULL, NULL, NULL, 4, '2016-10-25 03:24:41', '2016-10-25 03:24:41'),
(201, 4, 70, NULL, NULL, NULL, NULL, 7, '2016-10-25 03:24:41', '2016-10-25 03:24:41'),
(202, 4, 71, NULL, NULL, NULL, NULL, 7, '2016-10-25 03:24:41', '2016-10-25 03:24:41'),
(203, 4, 72, NULL, NULL, NULL, NULL, 7, '2016-10-25 03:24:41', '2016-10-25 03:24:41'),
(204, 4, 73, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:41', '2016-10-25 03:24:41'),
(205, 4, 74, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:41', '2016-10-25 03:24:41'),
(206, 4, 75, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:41', '2016-10-25 03:24:41'),
(207, 4, 76, NULL, NULL, NULL, NULL, 5, '2016-10-25 03:24:41', '2016-10-25 03:24:41'),
(208, 4, 77, NULL, NULL, NULL, NULL, 1, '2016-10-25 03:24:41', '2016-10-25 03:24:41'),
(209, 4, 78, NULL, NULL, NULL, NULL, 1, '2016-10-25 03:24:41', '2016-10-25 03:24:41'),
(210, 4, 79, NULL, NULL, NULL, NULL, 1, '2016-10-25 03:24:41', '2016-10-25 03:24:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_acl_waserda`
--

CREATE TABLE `role_acl_waserda` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `mod_kd` bigint(20) UNSIGNED DEFAULT NULL,
  `create_acl` bigint(20) DEFAULT NULL,
  `read_acl` bigint(20) DEFAULT NULL,
  `update_acl` bigint(20) DEFAULT NULL,
  `delete_acl` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `role_acl_waserda`
--

INSERT INTO `role_acl_waserda` (`id`, `role_id`, `mod_kd`, `create_acl`, `read_acl`, `update_acl`, `delete_acl`, `created_at`, `updated_at`) VALUES
(1, 2, 9999999991, NULL, 9999999991, NULL, NULL, '2016-10-25 03:24:16', '2016-10-25 03:24:16'),
(2, 2, 9999999992, NULL, 9999999992, 9999999992, NULL, '2016-10-25 03:24:17', '2016-10-25 03:24:17'),
(3, 2, 9999999993, NULL, 9999999993, 9999999993, NULL, '2016-10-25 03:24:17', '2016-10-25 03:24:17'),
(4, 2, 9999999994, NULL, 9999999994, NULL, NULL, '2016-10-25 03:24:17', '2016-10-25 03:24:17'),
(5, 2, 9999999995, 9999999995, NULL, NULL, NULL, '2016-10-25 03:24:17', '2016-10-25 03:24:17'),
(6, 2, 9999999996, 9999999996, 9999999996, 9999999996, NULL, '2016-10-25 03:24:17', '2016-10-25 03:24:17'),
(7, 2, 9999999997, 9999999997, 9999999997, NULL, NULL, '2016-10-25 03:24:17', '2016-10-25 03:24:17'),
(8, 2, 9999999998, 9999999998, 9999999998, 9999999998, 9999999998, '2016-10-25 03:24:17', '2016-10-25 03:24:17'),
(9, 2, 9999999971, 9999999971, NULL, NULL, NULL, '2016-10-25 03:24:17', '2016-10-25 03:24:17'),
(10, 2, 9999999972, NULL, 9999999972, NULL, NULL, '2016-10-25 03:24:17', '2016-10-25 03:24:17'),
(11, 2, 9999999973, NULL, 9999999973, NULL, NULL, '2016-10-25 03:24:17', '2016-10-25 03:24:17'),
(12, 2, 9999999974, NULL, 9999999974, NULL, NULL, '2016-10-25 03:24:17', '2016-10-25 03:24:17'),
(13, 2, 9999999975, NULL, 9999999975, NULL, NULL, '2016-10-25 03:24:17', '2016-10-25 03:24:17'),
(14, 2, 9999999976, NULL, 9999999976, NULL, NULL, '2016-10-25 03:24:17', '2016-10-25 03:24:17'),
(15, 2, 9999999977, NULL, 9999999977, NULL, NULL, '2016-10-25 03:24:17', '2016-10-25 03:24:17'),
(16, 2, 9999999981, 9999999981, 9999999981, 9999999981, 9999999981, '2016-10-25 03:24:17', '2016-10-25 03:24:17'),
(17, 2, 9999999982, 9999999982, 9999999982, 9999999982, 9999999982, '2016-10-25 03:24:17', '2016-10-25 03:24:17'),
(18, 2, 9999999983, 9999999983, 9999999983, 9999999983, 9999999983, '2016-10-25 03:24:17', '2016-10-25 03:24:17'),
(19, 2, 9999999984, 9999999984, 9999999984, 9999999984, 9999999984, '2016-10-25 03:24:17', '2016-10-25 03:24:17'),
(20, 2, 9999999985, 9999999985, 9999999985, 9999999985, 9999999985, '2016-10-25 03:24:17', '2016-10-25 03:24:17'),
(21, 2, 9999999986, 9999999986, 9999999986, 9999999986, 9999999986, '2016-10-25 03:24:17', '2016-10-25 03:24:17'),
(22, 2, 9999999987, NULL, 9999999987, NULL, NULL, '2016-10-25 03:24:17', '2016-10-25 03:24:17'),
(23, 2, 9999999988, NULL, 9999999988, NULL, NULL, '2016-10-25 03:24:17', '2016-10-25 03:24:17'),
(24, 2, 9999999989, NULL, 9999999989, NULL, NULL, '2016-10-25 03:24:17', '2016-10-25 03:24:17'),
(25, 2, 9999999990, NULL, 9999999990, NULL, NULL, '2016-10-25 03:24:17', '2016-10-25 03:24:17'),
(26, 4, 9999999991, NULL, NULL, NULL, NULL, '2016-10-25 03:24:41', '2016-10-25 03:24:41'),
(27, 4, 9999999992, NULL, NULL, NULL, NULL, '2016-10-25 03:24:41', '2016-10-25 03:24:41'),
(28, 4, 9999999993, NULL, NULL, NULL, NULL, '2016-10-25 03:24:41', '2016-10-25 03:24:41'),
(29, 4, 9999999994, NULL, 9999999994, NULL, NULL, '2016-10-25 03:24:41', '2016-10-25 03:24:41'),
(30, 4, 9999999995, 9999999995, NULL, NULL, NULL, '2016-10-25 03:24:41', '2016-10-25 03:24:41'),
(31, 4, 9999999996, 9999999996, 9999999996, 9999999996, NULL, '2016-10-25 03:24:41', '2016-10-25 03:24:41'),
(32, 4, 9999999997, 9999999997, 9999999997, NULL, NULL, '2016-10-25 03:24:41', '2016-10-25 03:24:41'),
(33, 4, 9999999998, 9999999998, 9999999998, 9999999998, 9999999998, '2016-10-25 03:24:41', '2016-10-25 03:24:41'),
(34, 4, 9999999971, NULL, NULL, NULL, NULL, '2016-10-25 03:24:41', '2016-10-25 03:24:41'),
(35, 4, 9999999972, NULL, NULL, NULL, NULL, '2016-10-25 03:24:41', '2016-10-25 03:24:41'),
(36, 4, 9999999973, NULL, NULL, NULL, NULL, '2016-10-25 03:24:42', '2016-10-25 03:24:42'),
(37, 4, 9999999974, NULL, NULL, NULL, NULL, '2016-10-25 03:24:42', '2016-10-25 03:24:42'),
(38, 4, 9999999975, NULL, NULL, NULL, NULL, '2016-10-25 03:24:42', '2016-10-25 03:24:42'),
(39, 4, 9999999976, NULL, NULL, NULL, NULL, '2016-10-25 03:24:42', '2016-10-25 03:24:42'),
(40, 4, 9999999977, NULL, NULL, NULL, NULL, '2016-10-25 03:24:42', '2016-10-25 03:24:42'),
(41, 4, 9999999981, NULL, NULL, NULL, NULL, '2016-10-25 03:24:42', '2016-10-25 03:24:42'),
(42, 4, 9999999982, NULL, NULL, NULL, NULL, '2016-10-25 03:24:42', '2016-10-25 03:24:42'),
(43, 4, 9999999983, NULL, NULL, NULL, NULL, '2016-10-25 03:24:42', '2016-10-25 03:24:42'),
(44, 4, 9999999984, NULL, NULL, NULL, NULL, '2016-10-25 03:24:42', '2016-10-25 03:24:42'),
(45, 4, 9999999985, NULL, NULL, NULL, NULL, '2016-10-25 03:24:42', '2016-10-25 03:24:42'),
(46, 4, 9999999986, NULL, NULL, NULL, NULL, '2016-10-25 03:24:42', '2016-10-25 03:24:42'),
(47, 4, 9999999987, NULL, NULL, NULL, NULL, '2016-10-25 03:24:42', '2016-10-25 03:24:42'),
(48, 4, 9999999988, NULL, NULL, NULL, NULL, '2016-10-25 03:24:42', '2016-10-25 03:24:42'),
(49, 4, 9999999989, NULL, NULL, NULL, NULL, '2016-10-25 03:24:42', '2016-10-25 03:24:42'),
(50, 4, 9999999990, NULL, NULL, NULL, NULL, '2016-10-25 03:24:42', '2016-10-25 03:24:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sementara_retur`
--

CREATE TABLE `sementara_retur` (
  `id` int(10) UNSIGNED NOT NULL,
  `produk` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `qty` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `harga` double(8,2) NOT NULL,
  `sub_total` double(8,2) NOT NULL,
  `barcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `no_ref` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `simpanan`
--

CREATE TABLE `simpanan` (
  `id` int(10) UNSIGNED NOT NULL,
  `jenis_simpanan` int(10) UNSIGNED NOT NULL,
  `nomor_simpanan` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `anggota` int(10) UNSIGNED NOT NULL,
  `tanggal_pembuatan` date NOT NULL,
  `setoran_bulanan` decimal(20,2) NOT NULL,
  `jangka_waktu` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `tanggal_status` date NOT NULL,
  `saldo_blokir` decimal(20,2) NOT NULL,
  `keterangan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `suku_bunga` decimal(5,2) NOT NULL,
  `sistem_bunga` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `simpanan`
--

INSERT INTO `simpanan` (`id`, `jenis_simpanan`, `nomor_simpanan`, `anggota`, `tanggal_pembuatan`, `setoran_bulanan`, `jangka_waktu`, `status`, `tanggal_status`, `saldo_blokir`, `keterangan`, `created_at`, `updated_at`, `suku_bunga`, `sistem_bunga`) VALUES
(1, 2, 'SW.0001', 1, '2016-10-28', '500000.00', 12, 0, '2016-10-28', '50000.00', '', '2016-10-27 12:40:51', '2016-10-27 12:40:51', '6.00', 1),
(2, 1, 'SP.0001', 2, '2016-10-28', '600000.00', 12, 0, '2016-10-28', '50000.00', '', '2016-10-27 12:42:10', '2016-10-27 12:42:10', '6.00', 1),
(3, 2, 'SW.0002', 2, '2016-11-09', '5555666.66', 7, 0, '2016-11-09', '0.01', '', '2016-11-09 02:30:52', '2016-11-09 02:30:52', '6.00', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `simpanan_akumulasi`
--

CREATE TABLE `simpanan_akumulasi` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_simpanan` int(10) UNSIGNED NOT NULL,
  `saldo` decimal(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `outs` decimal(20,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `simpanan_akumulasi`
--

INSERT INTO `simpanan_akumulasi` (`id`, `id_simpanan`, `saldo`, `created_at`, `updated_at`, `outs`) VALUES
(1, 1, '700000.00', '2016-10-27 12:40:51', '2016-10-27 20:06:20', '0.00'),
(2, 2, '900000.00', '2016-10-27 12:42:10', '2016-10-27 20:06:42', '0.00'),
(3, 3, '0.00', '2016-11-09 02:30:52', '2016-11-09 02:30:52', '0.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `simpanan_kolektif`
--

CREATE TABLE `simpanan_kolektif` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipe` enum('TARIK','SETOR') COLLATE utf8_unicode_ci NOT NULL,
  `id_simpanan` int(10) UNSIGNED NOT NULL,
  `nominal` decimal(20,2) NOT NULL,
  `tanggal` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `simpanan_transaksi`
--

CREATE TABLE `simpanan_transaksi` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `tipe` enum('TARIK','SETOR','TRANSFER') COLLATE utf8_unicode_ci NOT NULL,
  `id_simpanan` int(10) UNSIGNED NOT NULL,
  `id_dari` int(11) DEFAULT NULL,
  `id_tujuan` int(11) DEFAULT NULL,
  `saldo_awal` decimal(20,2) NOT NULL,
  `kredit` decimal(20,2) NOT NULL,
  `debet` decimal(20,2) NOT NULL,
  `nominal` decimal(20,2) NOT NULL,
  `saldo_akhir` decimal(20,2) NOT NULL,
  `tanggal` date NOT NULL,
  `status` enum('AKTIF','VOID') COLLATE utf8_unicode_ci NOT NULL,
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keterangan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `simpanan_transaksi`
--

INSERT INTO `simpanan_transaksi` (`id`, `kode`, `tipe`, `id_simpanan`, `id_dari`, `id_tujuan`, `saldo_awal`, `kredit`, `debet`, `nominal`, `saldo_akhir`, `tanggal`, `status`, `info`, `keterangan`, `created_at`, `updated_at`, `approved`) VALUES
(1, 'TRSIMP-00001', 'SETOR', 1, 1, NULL, '0.00', '700000.00', '0.00', '700000.00', '700000.00', '2016-10-28', 'AKTIF', 'SETOR : Codi', '', '2016-10-27 20:06:20', '2016-10-27 20:06:20', 1),
(2, 'TRSIMP-00002', 'SETOR', 2, 2, NULL, '0.00', '900000.00', '0.00', '900000.00', '900000.00', '2016-10-28', 'AKTIF', 'SETOR : Doni', '', '2016-10-27 20:06:42', '2016-10-27 20:06:42', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sistem_bunga`
--

CREATE TABLE `sistem_bunga` (
  `id` int(10) UNSIGNED NOT NULL,
  `sistem` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `untuk` enum('simpanan','pinjaman') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `sistem_bunga`
--

INSERT INTO `sistem_bunga` (`id`, `sistem`, `untuk`, `created_at`, `updated_at`) VALUES
(1, 'Saldo Terendah', 'simpanan', '2016-10-25 03:15:08', '2016-10-25 03:15:08'),
(2, 'Saldo Rata-rata', 'simpanan', '2016-10-25 03:15:08', '2016-10-25 03:15:08'),
(3, 'Saldo Harian', 'simpanan', '2016-10-25 03:15:08', '2016-10-25 03:15:08'),
(4, 'Bunga Tetap', 'pinjaman', '2016-10-25 03:15:08', '2016-10-25 03:15:08'),
(5, 'Bunga Efektif / Sliding Data', 'pinjaman', '2016-10-25 03:15:08', '2016-10-25 03:15:08'),
(6, 'Bunga Menurun / Anuitas', 'pinjaman', '2016-10-25 03:15:08', '2016-10-25 03:15:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `stok_minimum`
--

CREATE TABLE `stok_minimum` (
  `id` int(10) UNSIGNED NOT NULL,
  `stok` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `stok_minimum`
--

INSERT INTO `stok_minimum` (`id`, `stok`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_detail`
--

CREATE TABLE `transaksi_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `produk` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `barcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `no_ref` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `harga_beli` decimal(10,2) NOT NULL,
  `untung` decimal(10,2) NOT NULL,
  `konsinyasi` int(11) NOT NULL,
  `harga` decimal(20,2) NOT NULL,
  `sub_total` decimal(20,2) NOT NULL,
  `cabang` int(10) UNSIGNED DEFAULT NULL,
  `kasir` int(11) NOT NULL,
  `stat` int(11) DEFAULT NULL,
  `bayarstat` tinyint(4) NOT NULL,
  `diskon` decimal(20,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `transaksi_detail`
--

INSERT INTO `transaksi_detail` (`id`, `produk`, `qty`, `barcode`, `no_ref`, `tanggal`, `created_at`, `updated_at`, `harga_beli`, `untung`, `konsinyasi`, `harga`, `sub_total`, `cabang`, `kasir`, `stat`, `bayarstat`, `diskon`) VALUES
(1, 'Oreo', 2, '232323', 'POS-00015', '2016-11-07', '2016-11-07 00:04:46', '2016-11-07 00:04:46', '8000.00', '4000.00', 0, '8000.00', '16000.00', 1, 2, NULL, 1, '4000.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_header`
--

CREATE TABLE `transaksi_header` (
  `id` int(10) UNSIGNED NOT NULL,
  `noref` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `no_kartu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type_pembayaran` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kategori` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `jumlah` decimal(20,2) NOT NULL,
  `cabang` int(10) UNSIGNED DEFAULT NULL,
  `kasir` int(11) NOT NULL,
  `diskon` decimal(20,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `transaksi_header`
--

INSERT INTO `transaksi_header` (`id`, `noref`, `tanggal`, `no_kartu`, `type_pembayaran`, `status`, `kategori`, `created_at`, `updated_at`, `jumlah`, `cabang`, `kasir`, `diskon`) VALUES
(1, 'POS-00015', '2016-11-07', '0', 'cash', 'Cash', 'cash', '2016-11-07 07:04:47', '2016-11-07 07:04:47', '12000.00', 1, 2, '4000.00'),
(2, '123', '2016-11-16', '456', 'cash', 'diterima', 'yes', '2016-11-15 17:00:00', '2016-11-15 17:00:00', '10000000.00', 1, 10, '100000.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_sementara`
--

CREATE TABLE `transaksi_sementara` (
  `id` int(10) UNSIGNED NOT NULL,
  `produk` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `barcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `no_ref` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `harga_beli` decimal(10,2) NOT NULL,
  `untung` decimal(10,2) NOT NULL,
  `konsinyasi` int(11) NOT NULL,
  `harga` decimal(20,2) NOT NULL,
  `sub_total` decimal(20,2) NOT NULL,
  `cabang` int(10) UNSIGNED DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `diskon` decimal(20,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `unit`
--

CREATE TABLE `unit` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `kode` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `unit`
--

INSERT INTO `unit` (`id`, `nama`, `kode`, `created_at`, `updated_at`) VALUES
(1, 'Pcs', '1P', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `id_anggota` int(10) UNSIGNED DEFAULT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cabang` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `posting` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `status`, `id_anggota`, `role_id`, `photo`, `remember_token`, `created_at`, `updated_at`, `cabang`, `posting`) VALUES
(1, 'admin', 'admin@localhost.com', 'admin', '$2y$10$SQgtlfE54ZCvj9g44k.mg.FwCt2gnbQCBHV0q7gf3MAavwXLpvrPa', 1, 1, 1, 'admin.png', 'muKTVIjpi6NxY9sO4qalvNFQsSaJe790vv4cptfJk8Gpxo3FiRVZJhrQc6Mi', '2016-10-25 03:15:14', '2016-11-15 03:03:10', '', 0),
(2, NULL, NULL, 'pos', '$2y$10$W0tlzWn2snv4JevOP0wNv.GJ3vnYdAVtcP6BKRzYOwQFrFKAB66hi', 1, NULL, 2, 'ava', 'asBDjPyASJySc1AXBB0e8TtMM50AECFUMazGiWkOQdIIBSJma1O2kKONOusz', NULL, '2016-11-08 23:44:27', '1', 0),
(3, NULL, NULL, 'fss', '$2y$10$qvPeub4LGawW.LPK81moQu4AqR8gTESnj78SeP5fWAn3VctFQam4C', 1, NULL, 1, 'ava', NULL, NULL, NULL, '0', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `vendor`
--

CREATE TABLE `vendor` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nama_vendor` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nama_kontak` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alamat_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alamat_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mata_uang` int(10) UNSIGNED DEFAULT NULL,
  `bank` int(10) UNSIGNED DEFAULT NULL,
  `nomor_akun` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nama_akun` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keterangan` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `vendor`
--

INSERT INTO `vendor` (`id`, `kode`, `nama_vendor`, `nama_kontak`, `alamat_1`, `alamat_2`, `phone`, `fax`, `mata_uang`, `bank`, `nomor_akun`, `nama_akun`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, '1T', 'Test', 'Tester', 'Jl. Tester', 'Jl. Tester 2', '087884938814', '+217884938814', NULL, NULL, '1234567891011', 'Testerer', 'Tukang Test', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akses_tutup`
--
ALTER TABLE `akses_tutup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `akses_tutup_id_user_foreign` (`id_user`);

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anggota_id_bank_foreign` (`id_bank`);

--
-- Indexes for table `approvel`
--
ALTER TABLE `approvel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `approvel_role`
--
ALTER TABLE `approvel_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `approvel_role_id_user_foreign` (`id_user`);

--
-- Indexes for table `attach_doc`
--
ALTER TABLE `attach_doc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `autodebet_pinjaman_detail`
--
ALTER TABLE `autodebet_pinjaman_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `autodebet_pinjaman_detail_id_auto_header_foreign` (`id_auto_header`),
  ADD KEY `autodebet_pinjaman_detail_id_pinjaman_foreign` (`id_pinjaman`),
  ADD KEY `autodebet_pinjaman_detail_id_bayar_foreign` (`id_bayar`);

--
-- Indexes for table `autodebet_pinjaman_header`
--
ALTER TABLE `autodebet_pinjaman_header`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `autodebet_waserda_detail`
--
ALTER TABLE `autodebet_waserda_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `autodebet_waserda_detail_id_auto_header_foreign` (`id_auto_header`),
  ADD KEY `autodebet_waserda_detail_id_transaksi_detail_foreign` (`id_transaksi_detail`);

--
-- Indexes for table `autodebet_waserda_header`
--
ALTER TABLE `autodebet_waserda_header`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_mata_uang_foreign` (`mata_uang`);

--
-- Indexes for table `cabang`
--
ALTER TABLE `cabang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cabang_akun_kas_foreign` (`akun_kas`),
  ADD KEY `cabang_akun_persediaan_wsd_foreign` (`akun_persediaan_wsd`),
  ADD KEY `cabang_akun_piutang_wsd_foreign` (`akun_piutang_wsd`),
  ADD KEY `cabang_akun_penjualan_wsd_foreign` (`akun_penjualan_wsd`),
  ADD KEY `cabang_akun_pendapatan_wsd_foreign` (`akun_pendapatan_wsd`),
  ADD KEY `cabang_akun_penampungan_retur_foreign` (`akun_penampungan_retur`),
  ADD KEY `cabang_akun_biaya_selisih_opname_foreign` (`akun_biaya_selisih_opname`),
  ADD KEY `cabang_id_shu_foreign` (`id_shu`);

--
-- Indexes for table `detail_retur`
--
ALTER TABLE `detail_retur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_retur_cabang_foreign` (`cabang`);

--
-- Indexes for table `header_retur`
--
ALTER TABLE `header_retur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hpp`
--
ALTER TABLE `hpp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hpp_id_produk_foreign` (`id_produk`),
  ADD KEY `hpp_cabang_foreign` (`cabang`);

--
-- Indexes for table `icon`
--
ALTER TABLE `icon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iklan`
--
ALTER TABLE `iklan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jaminan_bangunan`
--
ALTER TABLE `jaminan_bangunan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jaminan_bangunan_id_jaminan_foreign` (`id_jaminan`);

--
-- Indexes for table `jaminan_elektronik`
--
ALTER TABLE `jaminan_elektronik`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jaminan_elektronik_id_jaminan_foreign` (`id_jaminan`);

--
-- Indexes for table `jaminan_emas`
--
ALTER TABLE `jaminan_emas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jaminan_emas_id_jaminan_foreign` (`id_jaminan`);

--
-- Indexes for table `jaminan_kendaraan`
--
ALTER TABLE `jaminan_kendaraan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jaminan_kendaraan_id_jaminan_foreign` (`id_jaminan`);

--
-- Indexes for table `jaminan_pinjaman`
--
ALTER TABLE `jaminan_pinjaman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jaminan_pinjaman_jenis_jaminan_foreign` (`jenis_jaminan`),
  ADD KEY `jaminan_pinjaman_id_pinjaman_foreign` (`id_pinjaman`);

--
-- Indexes for table `jaminan_simpanan`
--
ALTER TABLE `jaminan_simpanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jaminan_simpanan_id_jaminan_foreign` (`id_jaminan`);

--
-- Indexes for table `jaminan_tanpa`
--
ALTER TABLE `jaminan_tanpa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jaminan_tanpa_id_jaminan_foreign` (`id_jaminan`);

--
-- Indexes for table `jenistransaksi`
--
ALTER TABLE `jenistransaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis_jaminan`
--
ALTER TABLE `jenis_jaminan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jurnal_detail`
--
ALTER TABLE `jurnal_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jurnal_header`
--
ALTER TABLE `jurnal_header`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kas`
--
ALTER TABLE `kas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_shu_detail`
--
ALTER TABLE `kategori_shu_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori_shu_detail_id_header_foreign` (`id_header`);

--
-- Indexes for table `kategori_shu_header`
--
ALTER TABLE `kategori_shu_header`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kode_rekening_cab`
--
ALTER TABLE `kode_rekening_cab`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kolektibilitas`
--
ALTER TABLE `kolektibilitas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laporan_kasir`
--
ALTER TABLE `laporan_kasir`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `masterunit`
--
ALTER TABLE `masterunit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mastok`
--
ALTER TABLE `mastok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mastok_id_produk_foreign` (`id_produk`);

--
-- Indexes for table `matauang`
--
ALTER TABLE `matauang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules_waserda`
--
ALTER TABLE `modules_waserda`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nomor`
--
ALTER TABLE `nomor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `pembagian_shu`
--
ALTER TABLE `pembagian_shu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pembagian_shu_id_pengaturan_foreign` (`id_pengaturan`),
  ADD KEY `pembagian_shu_id_anggota_foreign` (`id_anggota`);

--
-- Indexes for table `pembayaran_pinjaman`
--
ALTER TABLE `pembayaran_pinjaman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pembayaran_pinjaman_id_pinjaman_foreign` (`id_pinjaman`);

--
-- Indexes for table `pembeliansupplierdetail`
--
ALTER TABLE `pembeliansupplierdetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembeliansupplierheader`
--
ALTER TABLE `pembeliansupplierheader`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengaturan_akun`
--
ALTER TABLE `pengaturan_akun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengaturan_akuns`
--
ALTER TABLE `pengaturan_akuns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengaturan_akun_relasi`
--
ALTER TABLE `pengaturan_akun_relasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengaturan_pinjaman`
--
ALTER TABLE `pengaturan_pinjaman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengaturan_pinjaman_sistem_bunga_foreign` (`sistem_bunga`),
  ADD KEY `pengaturan_pinjaman_akun_kas_bank_foreign` (`akun_kas_bank`),
  ADD KEY `pengaturan_pinjaman_akun_realisasi_foreign` (`akun_realisasi`),
  ADD KEY `pengaturan_pinjaman_akun_angsuran_foreign` (`akun_angsuran`),
  ADD KEY `pengaturan_pinjaman_akun_bunga_foreign` (`akun_bunga`),
  ADD KEY `pengaturan_pinjaman_akun_administrasi_foreign` (`akun_administrasi`),
  ADD KEY `pengaturan_pinjaman_akun_denda_foreign` (`akun_denda`),
  ADD KEY `pengaturan_pinjaman_biaya_provinsi_foreign` (`biaya_provinsi`),
  ADD KEY `pengaturan_pinjaman_akun_lain_lain_foreign` (`akun_lain_lain`),
  ADD KEY `pengaturan_pinjaman_akun_hapus_pinjaman_foreign` (`akun_hapus_pinjaman`),
  ADD KEY `pengaturan_pinjaman_id_shu_foreign` (`id_shu`),
  ADD KEY `pengaturan_pinjaman_akun_administrasi_bank_foreign` (`akun_administrasi_bank`),
  ADD KEY `pengaturan_pinjaman_akun_administrasi_tambahan_foreign` (`akun_administrasi_tambahan`);

--
-- Indexes for table `pengaturan_shu`
--
ALTER TABLE `pengaturan_shu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengaturan_simpanan`
--
ALTER TABLE `pengaturan_simpanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengaturan_simpanan_sistem_bunga_foreign` (`sistem_bunga`),
  ADD KEY `pengaturan_simpanan_akun_kas_bank_foreign` (`akun_kas_bank`),
  ADD KEY `pengaturan_simpanan_akun_setoran_foreign` (`akun_setoran`),
  ADD KEY `pengaturan_simpanan_akun_penarikan_foreign` (`akun_penarikan`),
  ADD KEY `pengaturan_simpanan_akun_bunga_foreign` (`akun_bunga`),
  ADD KEY `pengaturan_simpanan_akun_administrasi_foreign` (`akun_administrasi`),
  ADD KEY `pengaturan_simpanan_akun_pajak_foreign` (`akun_pajak`),
  ADD KEY `pengaturan_simpanan_id_shu_foreign` (`id_shu`);

--
-- Indexes for table `penyusutan_aset`
--
ALTER TABLE `penyusutan_aset`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penyusutan_aset_akun_kas_foreign` (`akun_kas`),
  ADD KEY `penyusutan_aset_akun_aset_foreign` (`akun_aset`),
  ADD KEY `penyusutan_aset_akun_biaya_penyusutan_foreign` (`akun_biaya_penyusutan`),
  ADD KEY `penyusutan_aset_akun_akumulasi_penyusutan_foreign` (`akun_akumulasi_penyusutan`),
  ADD KEY `penyusutan_aset_akun_keuntungan_aset_foreign` (`akun_keuntungan_aset`),
  ADD KEY `penyusutan_aset_akun_kerugian_aset_foreign` (`akun_kerugian_aset`);

--
-- Indexes for table `penyusutan_detail`
--
ALTER TABLE `penyusutan_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penyusutan_detail_id_penyusutan_foreign` (`id_penyusutan`);

--
-- Indexes for table `perkiraan`
--
ALTER TABLE `perkiraan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pinjaman_nama_pinjaman_foreign` (`nama_pinjaman`),
  ADD KEY `pinjaman_anggota_foreign` (`anggota`),
  ADD KEY `pinjaman_kolektibilitas_foreign` (`kolektibilitas`),
  ADD KEY `pinjaman_sistem_bunga_foreign` (`sistem_bunga`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produk_unit_foreign` (`unit`),
  ADD KEY `produk_curr_foreign` (`curr`),
  ADD KEY `produk_kategori_foreign` (`kategori`),
  ADD KEY `produk_id_shu_foreign` (`id_shu`);

--
-- Indexes for table `produkin`
--
ALTER TABLE `produkin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produkin_cabang_foreign` (`cabang`);

--
-- Indexes for table `produkout`
--
ALTER TABLE `produkout`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produkout_id_cabang_foreign` (`id_cabang`);

--
-- Indexes for table `produk_mapping`
--
ALTER TABLE `produk_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produk_mapping_id_produk_foreign` (`id_produk`),
  ADD KEY `produk_mapping_id_cabang_foreign` (`id_cabang`);

--
-- Indexes for table `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promo_detail`
--
ALTER TABLE `promo_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promo_header`
--
ALTER TABLE `promo_header`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proses_simpanan_detail`
--
ALTER TABLE `proses_simpanan_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proses_simpanan_detail_id_proses_header_foreign` (`id_proses_header`),
  ADD KEY `proses_simpanan_detail_id_simpanan_foreign` (`id_simpanan`);

--
-- Indexes for table `proses_simpanan_header`
--
ALTER TABLE `proses_simpanan_header`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `realisasi_pinjaman`
--
ALTER TABLE `realisasi_pinjaman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `realisasi_pinjaman_id_pinjaman_foreign` (`id_pinjaman`);

--
-- Indexes for table `retur`
--
ALTER TABLE `retur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `retur_id_barang_foreign` (`id_barang`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_acl`
--
ALTER TABLE `role_acl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_acl_role_id_foreign` (`role_id`),
  ADD KEY `role_acl_module_id_foreign` (`module_id`);

--
-- Indexes for table `role_acl_waserda`
--
ALTER TABLE `role_acl_waserda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_acl_waserda_role_id_foreign` (`role_id`);

--
-- Indexes for table `sementara_retur`
--
ALTER TABLE `sementara_retur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `simpanan`
--
ALTER TABLE `simpanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `simpanan_jenis_simpanan_foreign` (`jenis_simpanan`),
  ADD KEY `simpanan_anggota_foreign` (`anggota`),
  ADD KEY `simpanan_sistem_bunga_foreign` (`sistem_bunga`);

--
-- Indexes for table `simpanan_akumulasi`
--
ALTER TABLE `simpanan_akumulasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `simpanan_akumulasi_id_simpanan_foreign` (`id_simpanan`);

--
-- Indexes for table `simpanan_kolektif`
--
ALTER TABLE `simpanan_kolektif`
  ADD PRIMARY KEY (`id`),
  ADD KEY `simpanan_kolektif_id_simpanan_foreign` (`id_simpanan`);

--
-- Indexes for table `simpanan_transaksi`
--
ALTER TABLE `simpanan_transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `simpanan_transaksi_id_simpanan_foreign` (`id_simpanan`);

--
-- Indexes for table `sistem_bunga`
--
ALTER TABLE `sistem_bunga`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stok_minimum`
--
ALTER TABLE `stok_minimum`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaksi_detail_cabang_foreign` (`cabang`);

--
-- Indexes for table `transaksi_header`
--
ALTER TABLE `transaksi_header`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaksi_header_cabang_foreign` (`cabang`);

--
-- Indexes for table `transaksi_sementara`
--
ALTER TABLE `transaksi_sementara`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaksi_sementara_cabang_foreign` (`cabang`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_mata_uang_foreign` (`mata_uang`),
  ADD KEY `vendor_bank_foreign` (`bank`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akses_tutup`
--
ALTER TABLE `akses_tutup`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `approvel`
--
ALTER TABLE `approvel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `approvel_role`
--
ALTER TABLE `approvel_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `attach_doc`
--
ALTER TABLE `attach_doc`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `autodebet_pinjaman_detail`
--
ALTER TABLE `autodebet_pinjaman_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `autodebet_pinjaman_header`
--
ALTER TABLE `autodebet_pinjaman_header`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `autodebet_waserda_detail`
--
ALTER TABLE `autodebet_waserda_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `autodebet_waserda_header`
--
ALTER TABLE `autodebet_waserda_header`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cabang`
--
ALTER TABLE `cabang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `detail_retur`
--
ALTER TABLE `detail_retur`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `header_retur`
--
ALTER TABLE `header_retur`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hpp`
--
ALTER TABLE `hpp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `icon`
--
ALTER TABLE `icon`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=341;
--
-- AUTO_INCREMENT for table `iklan`
--
ALTER TABLE `iklan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jaminan_bangunan`
--
ALTER TABLE `jaminan_bangunan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jaminan_elektronik`
--
ALTER TABLE `jaminan_elektronik`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jaminan_emas`
--
ALTER TABLE `jaminan_emas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jaminan_kendaraan`
--
ALTER TABLE `jaminan_kendaraan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jaminan_pinjaman`
--
ALTER TABLE `jaminan_pinjaman`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jaminan_simpanan`
--
ALTER TABLE `jaminan_simpanan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jaminan_tanpa`
--
ALTER TABLE `jaminan_tanpa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jenistransaksi`
--
ALTER TABLE `jenistransaksi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jenis_jaminan`
--
ALTER TABLE `jenis_jaminan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `jurnal_detail`
--
ALTER TABLE `jurnal_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT for table `jurnal_header`
--
ALTER TABLE `jurnal_header`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `kas`
--
ALTER TABLE `kas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `kategori_shu_detail`
--
ALTER TABLE `kategori_shu_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `kategori_shu_header`
--
ALTER TABLE `kategori_shu_header`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `kode_rekening_cab`
--
ALTER TABLE `kode_rekening_cab`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `kolektibilitas`
--
ALTER TABLE `kolektibilitas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `laporan_kasir`
--
ALTER TABLE `laporan_kasir`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `masterunit`
--
ALTER TABLE `masterunit`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mastok`
--
ALTER TABLE `mastok`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `matauang`
--
ALTER TABLE `matauang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `modules_waserda`
--
ALTER TABLE `modules_waserda`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `nomor`
--
ALTER TABLE `nomor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `pembagian_shu`
--
ALTER TABLE `pembagian_shu`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pembayaran_pinjaman`
--
ALTER TABLE `pembayaran_pinjaman`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pembeliansupplierdetail`
--
ALTER TABLE `pembeliansupplierdetail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `pembeliansupplierheader`
--
ALTER TABLE `pembeliansupplierheader`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `pengaturan_akun`
--
ALTER TABLE `pengaturan_akun`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pengaturan_akuns`
--
ALTER TABLE `pengaturan_akuns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `pengaturan_akun_relasi`
--
ALTER TABLE `pengaturan_akun_relasi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `pengaturan_pinjaman`
--
ALTER TABLE `pengaturan_pinjaman`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pengaturan_shu`
--
ALTER TABLE `pengaturan_shu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pengaturan_simpanan`
--
ALTER TABLE `pengaturan_simpanan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `penyusutan_aset`
--
ALTER TABLE `penyusutan_aset`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `penyusutan_detail`
--
ALTER TABLE `penyusutan_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `perkiraan`
--
ALTER TABLE `perkiraan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `pinjaman`
--
ALTER TABLE `pinjaman`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `produkin`
--
ALTER TABLE `produkin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `produkout`
--
ALTER TABLE `produkout`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `produk_mapping`
--
ALTER TABLE `produk_mapping`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `profil`
--
ALTER TABLE `profil`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `promo_detail`
--
ALTER TABLE `promo_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `promo_header`
--
ALTER TABLE `promo_header`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `proses_simpanan_detail`
--
ALTER TABLE `proses_simpanan_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `proses_simpanan_header`
--
ALTER TABLE `proses_simpanan_header`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `realisasi_pinjaman`
--
ALTER TABLE `realisasi_pinjaman`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `retur`
--
ALTER TABLE `retur`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `role_acl`
--
ALTER TABLE `role_acl`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;
--
-- AUTO_INCREMENT for table `role_acl_waserda`
--
ALTER TABLE `role_acl_waserda`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `sementara_retur`
--
ALTER TABLE `sementara_retur`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `simpanan`
--
ALTER TABLE `simpanan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `simpanan_akumulasi`
--
ALTER TABLE `simpanan_akumulasi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `simpanan_kolektif`
--
ALTER TABLE `simpanan_kolektif`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `simpanan_transaksi`
--
ALTER TABLE `simpanan_transaksi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sistem_bunga`
--
ALTER TABLE `sistem_bunga`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `stok_minimum`
--
ALTER TABLE `stok_minimum`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `transaksi_header`
--
ALTER TABLE `transaksi_header`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `transaksi_sementara`
--
ALTER TABLE `transaksi_sementara`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `akses_tutup`
--
ALTER TABLE `akses_tutup`
  ADD CONSTRAINT `akses_tutup_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD CONSTRAINT `anggota_id_bank_foreign` FOREIGN KEY (`id_bank`) REFERENCES `bank` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `approvel_role`
--
ALTER TABLE `approvel_role`
  ADD CONSTRAINT `approvel_role_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `autodebet_pinjaman_detail`
--
ALTER TABLE `autodebet_pinjaman_detail`
  ADD CONSTRAINT `autodebet_pinjaman_detail_id_auto_header_foreign` FOREIGN KEY (`id_auto_header`) REFERENCES `autodebet_pinjaman_header` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `autodebet_pinjaman_detail_id_bayar_foreign` FOREIGN KEY (`id_bayar`) REFERENCES `pembayaran_pinjaman` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `autodebet_pinjaman_detail_id_pinjaman_foreign` FOREIGN KEY (`id_pinjaman`) REFERENCES `pinjaman` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `autodebet_waserda_detail`
--
ALTER TABLE `autodebet_waserda_detail`
  ADD CONSTRAINT `autodebet_waserda_detail_id_auto_header_foreign` FOREIGN KEY (`id_auto_header`) REFERENCES `autodebet_waserda_header` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `autodebet_waserda_detail_id_transaksi_detail_foreign` FOREIGN KEY (`id_transaksi_detail`) REFERENCES `transaksi_detail` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `bank`
--
ALTER TABLE `bank`
  ADD CONSTRAINT `bank_mata_uang_foreign` FOREIGN KEY (`mata_uang`) REFERENCES `matauang` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `cabang`
--
ALTER TABLE `cabang`
  ADD CONSTRAINT `cabang_akun_biaya_selisih_opname_foreign` FOREIGN KEY (`akun_biaya_selisih_opname`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cabang_akun_kas_foreign` FOREIGN KEY (`akun_kas`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cabang_akun_penampungan_retur_foreign` FOREIGN KEY (`akun_penampungan_retur`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cabang_akun_pendapatan_wsd_foreign` FOREIGN KEY (`akun_pendapatan_wsd`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cabang_akun_penjualan_wsd_foreign` FOREIGN KEY (`akun_penjualan_wsd`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cabang_akun_persediaan_wsd_foreign` FOREIGN KEY (`akun_persediaan_wsd`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cabang_akun_piutang_wsd_foreign` FOREIGN KEY (`akun_piutang_wsd`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cabang_id_shu_foreign` FOREIGN KEY (`id_shu`) REFERENCES `kategori_shu_detail` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_retur`
--
ALTER TABLE `detail_retur`
  ADD CONSTRAINT `detail_retur_cabang_foreign` FOREIGN KEY (`cabang`) REFERENCES `cabang` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `hpp`
--
ALTER TABLE `hpp`
  ADD CONSTRAINT `hpp_cabang_foreign` FOREIGN KEY (`cabang`) REFERENCES `cabang` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hpp_id_produk_foreign` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jaminan_bangunan`
--
ALTER TABLE `jaminan_bangunan`
  ADD CONSTRAINT `jaminan_bangunan_id_jaminan_foreign` FOREIGN KEY (`id_jaminan`) REFERENCES `jaminan_pinjaman` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jaminan_elektronik`
--
ALTER TABLE `jaminan_elektronik`
  ADD CONSTRAINT `jaminan_elektronik_id_jaminan_foreign` FOREIGN KEY (`id_jaminan`) REFERENCES `jaminan_pinjaman` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jaminan_emas`
--
ALTER TABLE `jaminan_emas`
  ADD CONSTRAINT `jaminan_emas_id_jaminan_foreign` FOREIGN KEY (`id_jaminan`) REFERENCES `jaminan_pinjaman` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jaminan_kendaraan`
--
ALTER TABLE `jaminan_kendaraan`
  ADD CONSTRAINT `jaminan_kendaraan_id_jaminan_foreign` FOREIGN KEY (`id_jaminan`) REFERENCES `jaminan_pinjaman` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jaminan_pinjaman`
--
ALTER TABLE `jaminan_pinjaman`
  ADD CONSTRAINT `jaminan_pinjaman_id_pinjaman_foreign` FOREIGN KEY (`id_pinjaman`) REFERENCES `pinjaman` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jaminan_pinjaman_jenis_jaminan_foreign` FOREIGN KEY (`jenis_jaminan`) REFERENCES `jenis_jaminan` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jaminan_simpanan`
--
ALTER TABLE `jaminan_simpanan`
  ADD CONSTRAINT `jaminan_simpanan_id_jaminan_foreign` FOREIGN KEY (`id_jaminan`) REFERENCES `jaminan_pinjaman` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jaminan_tanpa`
--
ALTER TABLE `jaminan_tanpa`
  ADD CONSTRAINT `jaminan_tanpa_id_jaminan_foreign` FOREIGN KEY (`id_jaminan`) REFERENCES `jaminan_pinjaman` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kategori_shu_detail`
--
ALTER TABLE `kategori_shu_detail`
  ADD CONSTRAINT `kategori_shu_detail_id_header_foreign` FOREIGN KEY (`id_header`) REFERENCES `kategori_shu_header` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `mastok`
--
ALTER TABLE `mastok`
  ADD CONSTRAINT `mastok_id_produk_foreign` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pembagian_shu`
--
ALTER TABLE `pembagian_shu`
  ADD CONSTRAINT `pembagian_shu_id_anggota_foreign` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pembagian_shu_id_pengaturan_foreign` FOREIGN KEY (`id_pengaturan`) REFERENCES `pengaturan_shu` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pembayaran_pinjaman`
--
ALTER TABLE `pembayaran_pinjaman`
  ADD CONSTRAINT `pembayaran_pinjaman_id_pinjaman_foreign` FOREIGN KEY (`id_pinjaman`) REFERENCES `pinjaman` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pengaturan_pinjaman`
--
ALTER TABLE `pengaturan_pinjaman`
  ADD CONSTRAINT `pengaturan_pinjaman_akun_administrasi_bank_foreign` FOREIGN KEY (`akun_administrasi_bank`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengaturan_pinjaman_akun_administrasi_foreign` FOREIGN KEY (`akun_administrasi`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengaturan_pinjaman_akun_administrasi_tambahan_foreign` FOREIGN KEY (`akun_administrasi_tambahan`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengaturan_pinjaman_akun_angsuran_foreign` FOREIGN KEY (`akun_angsuran`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengaturan_pinjaman_akun_bunga_foreign` FOREIGN KEY (`akun_bunga`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengaturan_pinjaman_akun_denda_foreign` FOREIGN KEY (`akun_denda`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengaturan_pinjaman_akun_hapus_pinjaman_foreign` FOREIGN KEY (`akun_hapus_pinjaman`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengaturan_pinjaman_akun_kas_bank_foreign` FOREIGN KEY (`akun_kas_bank`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengaturan_pinjaman_akun_lain_lain_foreign` FOREIGN KEY (`akun_lain_lain`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengaturan_pinjaman_akun_realisasi_foreign` FOREIGN KEY (`akun_realisasi`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengaturan_pinjaman_biaya_provinsi_foreign` FOREIGN KEY (`biaya_provinsi`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengaturan_pinjaman_id_shu_foreign` FOREIGN KEY (`id_shu`) REFERENCES `kategori_shu_detail` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengaturan_pinjaman_sistem_bunga_foreign` FOREIGN KEY (`sistem_bunga`) REFERENCES `sistem_bunga` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pengaturan_simpanan`
--
ALTER TABLE `pengaturan_simpanan`
  ADD CONSTRAINT `pengaturan_simpanan_akun_administrasi_foreign` FOREIGN KEY (`akun_administrasi`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengaturan_simpanan_akun_bunga_foreign` FOREIGN KEY (`akun_bunga`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengaturan_simpanan_akun_kas_bank_foreign` FOREIGN KEY (`akun_kas_bank`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengaturan_simpanan_akun_pajak_foreign` FOREIGN KEY (`akun_pajak`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengaturan_simpanan_akun_penarikan_foreign` FOREIGN KEY (`akun_penarikan`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengaturan_simpanan_akun_setoran_foreign` FOREIGN KEY (`akun_setoran`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengaturan_simpanan_id_shu_foreign` FOREIGN KEY (`id_shu`) REFERENCES `kategori_shu_detail` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengaturan_simpanan_sistem_bunga_foreign` FOREIGN KEY (`sistem_bunga`) REFERENCES `sistem_bunga` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `penyusutan_aset`
--
ALTER TABLE `penyusutan_aset`
  ADD CONSTRAINT `penyusutan_aset_akun_akumulasi_penyusutan_foreign` FOREIGN KEY (`akun_akumulasi_penyusutan`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `penyusutan_aset_akun_aset_foreign` FOREIGN KEY (`akun_aset`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `penyusutan_aset_akun_biaya_penyusutan_foreign` FOREIGN KEY (`akun_biaya_penyusutan`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `penyusutan_aset_akun_kas_foreign` FOREIGN KEY (`akun_kas`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `penyusutan_aset_akun_kerugian_aset_foreign` FOREIGN KEY (`akun_kerugian_aset`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `penyusutan_aset_akun_keuntungan_aset_foreign` FOREIGN KEY (`akun_keuntungan_aset`) REFERENCES `perkiraan` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `penyusutan_detail`
--
ALTER TABLE `penyusutan_detail`
  ADD CONSTRAINT `penyusutan_detail_id_penyusutan_foreign` FOREIGN KEY (`id_penyusutan`) REFERENCES `penyusutan_aset` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD CONSTRAINT `pinjaman_anggota_foreign` FOREIGN KEY (`anggota`) REFERENCES `anggota` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pinjaman_kolektibilitas_foreign` FOREIGN KEY (`kolektibilitas`) REFERENCES `kolektibilitas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pinjaman_nama_pinjaman_foreign` FOREIGN KEY (`nama_pinjaman`) REFERENCES `pengaturan_pinjaman` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pinjaman_sistem_bunga_foreign` FOREIGN KEY (`sistem_bunga`) REFERENCES `sistem_bunga` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_curr_foreign` FOREIGN KEY (`curr`) REFERENCES `matauang` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `produk_id_shu_foreign` FOREIGN KEY (`id_shu`) REFERENCES `kategori_shu_detail` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `produk_kategori_foreign` FOREIGN KEY (`kategori`) REFERENCES `kategori` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `produk_unit_foreign` FOREIGN KEY (`unit`) REFERENCES `unit` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `produkin`
--
ALTER TABLE `produkin`
  ADD CONSTRAINT `produkin_cabang_foreign` FOREIGN KEY (`cabang`) REFERENCES `cabang` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `produkout`
--
ALTER TABLE `produkout`
  ADD CONSTRAINT `produkout_id_cabang_foreign` FOREIGN KEY (`id_cabang`) REFERENCES `cabang` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `produk_mapping`
--
ALTER TABLE `produk_mapping`
  ADD CONSTRAINT `produk_mapping_id_cabang_foreign` FOREIGN KEY (`id_cabang`) REFERENCES `cabang` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `produk_mapping_id_produk_foreign` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `proses_simpanan_detail`
--
ALTER TABLE `proses_simpanan_detail`
  ADD CONSTRAINT `proses_simpanan_detail_id_proses_header_foreign` FOREIGN KEY (`id_proses_header`) REFERENCES `proses_simpanan_header` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `proses_simpanan_detail_id_simpanan_foreign` FOREIGN KEY (`id_simpanan`) REFERENCES `simpanan` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `realisasi_pinjaman`
--
ALTER TABLE `realisasi_pinjaman`
  ADD CONSTRAINT `realisasi_pinjaman_id_pinjaman_foreign` FOREIGN KEY (`id_pinjaman`) REFERENCES `pinjaman` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `retur`
--
ALTER TABLE `retur`
  ADD CONSTRAINT `retur_id_barang_foreign` FOREIGN KEY (`id_barang`) REFERENCES `produk` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_acl`
--
ALTER TABLE `role_acl`
  ADD CONSTRAINT `role_acl_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_acl_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_acl_waserda`
--
ALTER TABLE `role_acl_waserda`
  ADD CONSTRAINT `role_acl_waserda_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `simpanan`
--
ALTER TABLE `simpanan`
  ADD CONSTRAINT `simpanan_anggota_foreign` FOREIGN KEY (`anggota`) REFERENCES `anggota` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `simpanan_jenis_simpanan_foreign` FOREIGN KEY (`jenis_simpanan`) REFERENCES `pengaturan_simpanan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `simpanan_sistem_bunga_foreign` FOREIGN KEY (`sistem_bunga`) REFERENCES `sistem_bunga` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `simpanan_akumulasi`
--
ALTER TABLE `simpanan_akumulasi`
  ADD CONSTRAINT `simpanan_akumulasi_id_simpanan_foreign` FOREIGN KEY (`id_simpanan`) REFERENCES `simpanan` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `simpanan_kolektif`
--
ALTER TABLE `simpanan_kolektif`
  ADD CONSTRAINT `simpanan_kolektif_id_simpanan_foreign` FOREIGN KEY (`id_simpanan`) REFERENCES `simpanan` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `simpanan_transaksi`
--
ALTER TABLE `simpanan_transaksi`
  ADD CONSTRAINT `simpanan_transaksi_id_simpanan_foreign` FOREIGN KEY (`id_simpanan`) REFERENCES `simpanan` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD CONSTRAINT `transaksi_detail_cabang_foreign` FOREIGN KEY (`cabang`) REFERENCES `cabang` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi_header`
--
ALTER TABLE `transaksi_header`
  ADD CONSTRAINT `transaksi_header_cabang_foreign` FOREIGN KEY (`cabang`) REFERENCES `cabang` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi_sementara`
--
ALTER TABLE `transaksi_sementara`
  ADD CONSTRAINT `transaksi_sementara_cabang_foreign` FOREIGN KEY (`cabang`) REFERENCES `cabang` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `vendor`
--
ALTER TABLE `vendor`
  ADD CONSTRAINT `vendor_bank_foreign` FOREIGN KEY (`bank`) REFERENCES `bank` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendor_mata_uang_foreign` FOREIGN KEY (`mata_uang`) REFERENCES `matauang` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;