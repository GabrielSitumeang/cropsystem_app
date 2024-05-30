-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2024 at 07:37 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pa3`
--

-- --------------------------------------------------------

--
-- Table structure for table `ajukan_informasis`
--

CREATE TABLE `ajukan_informasis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `namatanaman` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` longtext NOT NULL,
  `gambar_tanaman` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) NOT NULL,
  `informasi` enum('Rotasi Tanaman','Pemantauan','Persiapan Lahan','Penanaman','Pemupukan','Irigasi','Panen dan Pasca Panen','Hama dan Penyakit') NOT NULL,
  `status` enum('request','approve') NOT NULL DEFAULT 'request',
  `tahapan` varchar(255) NOT NULL,
  `gejala` text NOT NULL,
  `rekomendasi` text NOT NULL,
  `penyebab` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `catatans`
--

CREATE TABLE `catatans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `tanggal` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `post_id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hamas`
--

CREATE TABLE `hamas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `namatanaman` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `gejala` longtext NOT NULL,
  `info_lebih_lanjut` varchar(255) NOT NULL,
  `rekomendasi` longtext NOT NULL,
  `pengendalian_hayati` longtext NOT NULL,
  `pengendalian_kimiawi` longtext NOT NULL,
  `obati_penyebab` longtext NOT NULL,
  `tindakan_pencegahan` longtext NOT NULL,
  `cegah_penyebab` longtext NOT NULL,
  `gambar_tanaman` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) NOT NULL,
  `tahapanPupuk` enum('Tahap Pembibitan','Tahap Vegetatif','Tahap Berbunga','Tahap Berbuah','Tahap Panen') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `irigasis`
--

CREATE TABLE `irigasis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `namatanaman` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` longtext NOT NULL,
  `gambar_tanaman` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `post_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_03_08_180919_create_tanamen_table', 1),
(6, '2024_03_14_040124_create_pupuks_table', 1),
(7, '2024_03_14_042559_create_hamas_table', 1),
(8, '2024_04_03_120832_create_rotasi_tanamen_table', 1),
(9, '2024_04_11_110908_create_pemantauans_table', 1),
(10, '2024_04_11_113035_create_persiapan_lahans_table', 1),
(11, '2024_04_11_125309_create_penanamen_table', 1),
(12, '2024_04_11_131744_create_irigasis_table', 1),
(13, '2024_04_13_143855_create_panens_table', 1),
(14, '2024_04_13_143912_create_pasca_panens_table', 1),
(15, '2024_04_17_124202_create_ajukan_informasis_table', 1),
(16, '2024_05_24_041621_users', 1),
(17, '2024_05_27_143228_create_posts_table', 2),
(18, '2024_05_27_143253_create_comments_table', 2),
(19, '2024_05_27_143315_create_likes_table', 2),
(20, '2024_05_28_173457_create_catatans_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `panens`
--

CREATE TABLE `panens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `namatanaman` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` longtext NOT NULL,
  `gambar_tanaman` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `panens`
--

INSERT INTO `panens` (`id`, `namatanaman`, `judul`, `isi`, `gambar_tanaman`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'Jagung', 'Panen Jagung', 'Isi', '20240524073117.jpg', 'Minggu 15', '2024-05-24 00:31:17', '2024-05-24 00:31:17');

-- --------------------------------------------------------

--
-- Table structure for table `pasca_panens`
--

CREATE TABLE `pasca_panens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `namatanaman` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` longtext NOT NULL,
  `gambar_tanaman` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pasca_panens`
--

INSERT INTO `pasca_panens` (`id`, `namatanaman`, `judul`, `isi`, `gambar_tanaman`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'Jagung', 'Pasca Panen Jagung', 'Isi', '20240524073709.jpg', 'Minggu 13', '2024-05-24 00:37:09', '2024-05-24 00:37:09');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pemantauans`
--

CREATE TABLE `pemantauans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `namatanaman` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` longtext NOT NULL,
  `gambar_tanaman` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penanamen`
--

CREATE TABLE `penanamen` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `namatanaman` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` longtext NOT NULL,
  `gambar_tanaman` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `persiapan_lahans`
--

CREATE TABLE `persiapan_lahans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `namatanaman` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` longtext NOT NULL,
  `gambar_tanaman` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pupuks`
--

CREATE TABLE `pupuks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `namatanaman` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` longtext NOT NULL,
  `gambar_tanaman` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) NOT NULL,
  `tahapanPupuk` enum('Tahap Pembibitan','Tahap Vegetatif','Tahap Berbunga','Tahap Berbuah','Tahap Panen') NOT NULL,
  `jenisPemupukan` enum('Pemupukan Organik','Pemupukan Kimiawi') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rotasi_tanamen`
--

CREATE TABLE `rotasi_tanamen` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `namatanaman` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` longtext NOT NULL,
  `gambar_tanaman` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) NOT NULL,
  `jenisInformasi` enum('Sebelum','Sesudah') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tanaman`
--

CREATE TABLE `tanaman` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_tanaman` varchar(255) NOT NULL,
  `gambar_tanaman` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tanaman`
--

INSERT INTO `tanaman` (`id`, `nama_tanaman`, `gambar_tanaman`, `created_at`, `updated_at`) VALUES
(1, 'Jagung', '20240524072714.jpg', '2024-05-24 00:27:15', '2024-05-24 00:27:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ajukan_informasis`
--
ALTER TABLE `ajukan_informasis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catatans`
--
ALTER TABLE `catatans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `hamas`
--
ALTER TABLE `hamas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `irigasis`
--
ALTER TABLE `irigasis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `panens`
--
ALTER TABLE `panens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasca_panens`
--
ALTER TABLE `pasca_panens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pemantauans`
--
ALTER TABLE `pemantauans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penanamen`
--
ALTER TABLE `penanamen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `persiapan_lahans`
--
ALTER TABLE `persiapan_lahans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pupuks`
--
ALTER TABLE `pupuks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rotasi_tanamen`
--
ALTER TABLE `rotasi_tanamen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tanaman`
--
ALTER TABLE `tanaman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ajukan_informasis`
--
ALTER TABLE `ajukan_informasis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catatans`
--
ALTER TABLE `catatans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hamas`
--
ALTER TABLE `hamas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `irigasis`
--
ALTER TABLE `irigasis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `panens`
--
ALTER TABLE `panens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pasca_panens`
--
ALTER TABLE `pasca_panens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pemantauans`
--
ALTER TABLE `pemantauans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penanamen`
--
ALTER TABLE `penanamen`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `persiapan_lahans`
--
ALTER TABLE `persiapan_lahans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pupuks`
--
ALTER TABLE `pupuks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rotasi_tanamen`
--
ALTER TABLE `rotasi_tanamen`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tanaman`
--
ALTER TABLE `tanaman`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
