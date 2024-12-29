-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-12-2024 a las 04:19:35
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"sistema_ventas\",\"table\":\"ventas\"},{\"db\":\"sistema_ventas\",\"table\":\"facturas\"},{\"db\":\"sistema_ventas\",\"table\":\"impresion_factura\"},{\"db\":\"sistema_ventas\",\"table\":\"detalle_factura\"},{\"db\":\"sistema_ventas\",\"table\":\"clientes\"},{\"db\":\"sistema_ventas\",\"table\":\"usuarios\"},{\"db\":\"sistema_ventas\",\"table\":\"producto\"},{\"db\":\"sistema_ventas\",\"table\":\"productos\"},{\"db\":\"sistema_ventas\",\"table\":\"proveedores\"},{\"db\":\"INFORMATION_SCHEMA\",\"table\":\"KEY_COLUMN_USAGE\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Volcado de datos para la tabla `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'sistema_ventas', 'clientes', '[]', '2024-12-28 06:42:51'),
('root', 'sistema_ventas', 'ventas', '[]', '2024-11-04 23:34:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-12-29 03:18:46', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"es\",\"NavigationWidth\":0}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `sistema_ventas`
--
CREATE DATABASE IF NOT EXISTS `sistema_ventas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sistema_ventas`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `whatsapp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `email`, `whatsapp`) VALUES
(1, 'andrea salinas', 'andreasalinas72@gmail.com', '3162682465'),
(2, 'geraldine ortiz', 'g.mattpublicidad@gmail.com', '3203668142'),
(3, 'cristian narvaez', 'narvaezcristian882@gmail.com', '573170621780'),
(4, 'andrea salinas', 'lilianasalina1993@gmail.com', '3162682465'),
(5, 'andrea salinas', 'karilq@mail.com', '3162682465');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impresion_factura`
--

CREATE TABLE `impresion_factura` (
  `id` int(11) NOT NULL,
  `detalle_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` float NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `stock`) VALUES
(6, 'camisa blanca sublimación ', '', 23000, 27),
(7, 'camisa algodón color', '', 32000, 0),
(8, 'camisa algodón screen', '', 32000, 3),
(10, 'camisa algodón vinilo textil ( 1 color)', '', 32000, 6),
(11, 'camibuso tipo polo', '', 38000, 9),
(12, 'mugs blanco sencillo', '', 16000, 6),
(13, 'mugs neón', '', 18000, 5),
(14, 'mugs metalizado', '', 20000, 2),
(15, 'mugs magico', '', 23000, 5),
(16, 'mugs tapa silicona', '', 22000, 5),
(17, 'mugs blanco sencillo decorado', '', 28000, 2),
(20, 'mugs magico', '', 23000, 5),
(21, 'jarra cervecera', '', 25000, 6),
(22, 'Mameluco blanco sublimación ', '', 25000, 6),
(23, 'Mameluco color con gorro', '', 28000, 6),
(24, 'cojines tamaño ( 30x30)', '', 25000, 5),
(25, 'Gorras en malla sublimación ', '', 16000, 15),
(26, 'Gorras colores', '', 18000, 10),
(27, 'Retablos en madera tamaño (20x25) estampado adicional vale $4.000', '', 28000, 6),
(28, 'Llaveros ', '', 6000, 6),
(29, 'Rompecabezas ', '', 30000, 6),
(30, 'Reloj personalizado', '', 33000, 6),
(31, 'Reloj personalizado', '', 33000, 6),
(32, 'Reloj personalizado naranja', '', 33000, 6),
(33, 'manilla', '', 32000, 20),
(34, 'zapato', '', 32000, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `contacto` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `nombre`, `contacto`, `correo`) VALUES
(1, 'Proveedor A', '123-456-7890', 'contacto@proveedora.com'),
(2, 'Proveedor B', '987-654-3210', 'contacto@proveedorb.com'),
(3, 'camila', '26764398', 'cam1@gmail.com'),
(4, 'ghiu', '874730948435', 'lgkf@gmail.com'),
(5, 'ghiu', '874730948435', 'lgkf@gmail.com'),
(6, 'camil', '26764398', 'cam1@gmail.com'),
(7, 'correts s.a', '3162682465', 'lilianasalina1993@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`) VALUES
(1, 'admin', 'scrypt:32768:8:1$2PYLXl8ppa2XTkn4$8dd14bda1b33369e345d4dda8b585fd6ac9487a7f216b4e10c925d24c264f370f9e4913d1053e46a3822dd766ae0980993105a67061240ab4073d7a0cd806615'),
(2, 'liliana ', 'scrypt:32768:8:1$7ojLwGe0twzIRn1Q$0fdb8483647cb7c3e04764d0523b0a40447fa652f54970722dc4b308ee56a9ad21829204a2aad89569f5b13117cd0f62e08433a7315c6179bfae201f9c150d7f'),
(3, 'liianasalinas', 'scrypt:32768:8:1$e5ZwVMBBZVSJFMsh$2af47c957899080569c19fd0838ce7070fb39e635059628d02ea7d1b3ae79f4845daf456bb4656716d4f817dd35e14ff97e21d944a33d2b5417a0a186d759fe0'),
(4, 'maria', 'scrypt:32768:8:1$0vVe0owDQOKrKrHJ$1e2a3315f6b26f14fc6b2631872e26e0a7181ca5d4e9eac59b4744a450fae821914ded31c616dbe4c22bf2047e48b180231340c0d3cd0c393dbf3d4fdf8bb030'),
(5, 'cami', 'scrypt:32768:8:1$YKWPQKQV2xxcxEgh$fd552fc83afbafead4b1e54d057d5ee86ec71ec0be6eb1aaf9c52ff8155a131412ca14c4e3f29ebef4b844d8bcee0be600da4256f7863d77168cfad92cc0b4cf'),
(6, 'danna', 'scrypt:32768:8:1$n51iXvLeIROrnmFu$2ad794491f824c72522c0bf10de51d1a678e55bac96a23df466fc7b01ca639a348de88067b9cc700002d571841e3bd69311b3271aad2e41bf2c2ec6246002d2b'),
(7, 'salome', 'scrypt:32768:8:1$OQZzfCc1HK55W0Rz$397431a05f5278b40b043c48968189ec92350f82cd260820d8cde8c1dc4946b79cb25db9a395187cbc157864cacc2394bc4a908d3c5b52edc883333746cfa7cc');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `id_producto`, `nombre`, `cantidad`, `precio`, `total`, `fecha`, `hora`) VALUES
(96, 7, 'camisa algodón color', 3, 32000.00, 96000.00, '2024-11-08', '20:51:17'),
(97, 12, 'mugs blanco sencillo', 3, 16000.00, 48000.00, '2024-11-08', '20:55:13'),
(98, 15, 'mugs magico', 1, 23000.00, 23000.00, '2024-11-08', '20:55:13'),
(99, 12, 'mugs blanco sencillo', 3, 16000.00, 48000.00, '2024-11-08', '21:00:23'),
(100, 15, 'mugs magico', 1, 23000.00, 23000.00, '2024-11-08', '21:00:23'),
(101, 8, 'camisa algodón screen', 1, 32000.00, 32000.00, '2024-11-08', '22:33:29'),
(102, 10, 'camisa algodón vinilo textil ( 1 color)', 3, 32000.00, 96000.00, '2024-11-08', '22:39:37'),
(103, 11, 'camibuso tipo polo', 3, 38000.00, 114000.00, '2024-11-10', '00:00:47'),
(104, 20, 'mugs magico', 1, 23000.00, 23000.00, '2024-11-10', '00:00:47'),
(105, 11, 'camibuso tipo polo', 3, 38000.00, 114000.00, '2024-11-10', '00:01:43'),
(106, 10, 'camisa algodón vinilo textil ( 1 color)', 3, 32000.00, 96000.00, '2024-11-10', '00:22:17'),
(107, 10, 'camisa algodón vinilo textil ( 1 color)', 3, 32000.00, 96000.00, '2024-11-10', '00:39:45'),
(108, 13, 'mugs neón', 20, 18000.00, 360000.00, '2024-11-10', '00:39:45'),
(109, 8, 'camisa algodón screen', 3, 32000.00, 96000.00, '2024-11-10', '00:39:45'),
(110, 7, 'camisa algodón color', 3, 32000.00, 96000.00, '2024-11-10', '00:39:45'),
(111, 14, 'mugs metalizado', 3, 20000.00, 60000.00, '2024-11-10', '00:39:45'),
(112, 8, 'camisa algodón screen', 3, 32000.00, 96000.00, '2024-11-10', '00:43:32'),
(113, 7, 'camisa algodón color', 1, 32000.00, 32000.00, '2024-11-11', '18:52:01'),
(114, 12, 'mugs blanco sencillo', 3, 16000.00, 48000.00, '2024-11-11', '18:52:01'),
(115, 8, 'camisa algodón screen', 1, 32000.00, 32000.00, '2024-11-24', '16:47:05'),
(116, 14, 'mugs metalizado', 3, 20000.00, 60000.00, '2024-12-04', '20:41:14'),
(117, 7, 'camisa algodón color', 3, 32000.00, 96000.00, '2024-12-04', '20:42:10'),
(118, 7, 'camisa algodón color', 3, 32000.00, 96000.00, '2024-12-04', '20:42:10'),
(119, 8, 'camisa algodón screen', 3, 32000.00, 96000.00, '2024-12-08', '19:51:45'),
(120, 12, 'mugs blanco sencillo', 3, 16000.00, 48000.00, '2024-12-08', '19:51:46'),
(121, 7, 'camisa algodón color', 3, 32000.00, 96000.00, '2024-12-08', '19:54:29'),
(122, 8, 'camisa algodón screen', 3, 32000.00, 96000.00, '2024-12-08', '19:59:32'),
(123, 8, 'camisa algodón screen', 3, 32000.00, 96000.00, '2024-12-08', '20:00:35'),
(124, 7, 'camisa algodón color', 3, 32000.00, 96000.00, '2024-12-08', '20:40:58'),
(125, 7, 'camisa algodón color', 3, 32000.00, 96000.00, '2024-12-08', '22:17:00'),
(126, 10, 'camisa algodón vinilo textil ( 1 color)', 3, 32000.00, 96000.00, '2024-12-08', '22:23:22'),
(127, 6, 'camisa blanca sublimación ', 3, 23000.00, 69000.00, '2024-12-08', '22:42:09'),
(128, 11, 'camibuso tipo polo', 3, 38000.00, 114000.00, '2024-12-08', '22:42:10'),
(129, 12, 'mugs blanco sencillo', 3, 16000.00, 48000.00, '2024-12-09', '18:17:01'),
(130, 7, 'camisa algodón color', 6, 32000.00, 192000.00, '2024-12-09', '18:17:01'),
(131, 7, 'camisa algodón color', 1, 32000.00, 32000.00, '2024-12-09', '18:20:32'),
(132, 7, 'camisa algodón color', 1, 32000.00, 32000.00, '2024-12-11', '23:32:18'),
(133, 12, 'mugs blanco sencillo', 1, 16000.00, 16000.00, '2024-12-11', '23:37:54'),
(134, 12, 'mugs blanco sencillo', 1, 16000.00, 16000.00, '2024-12-11', '23:37:54'),
(135, 12, 'mugs blanco sencillo', 1, 16000.00, 16000.00, '2024-12-11', '23:37:54'),
(136, 17, 'mugs blanco sencillo decorado', 3, 28000.00, 84000.00, '2024-12-12', '00:06:52'),
(137, 8, 'camisa algodón screen', 3, 32000.00, 96000.00, '2024-12-27', '21:36:23'),
(138, 11, 'camibuso tipo polo', 3, 38000.00, 114000.00, '2024-12-27', '21:58:25'),
(139, 10, 'camisa algodón vinilo textil ( 1 color)', 1, 32000.00, 32000.00, '2024-12-28', '02:16:13');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`email`);

--
-- Indices de la tabla `impresion_factura`
--
ALTER TABLE `impresion_factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalle_id` (`detalle_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `impresion_factura`
--
ALTER TABLE `impresion_factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `impresion_factura`
--
ALTER TABLE `impresion_factura`
  ADD CONSTRAINT `impresion_factura_ibfk_1` FOREIGN KEY (`detalle_id`) REFERENCES `detalle_factura` (`id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
