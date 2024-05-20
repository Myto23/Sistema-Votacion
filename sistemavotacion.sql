-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-05-2024 a las 03:37:39
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistemavotacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidatos`
--

CREATE TABLE `candidatos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `candidatos`
--

INSERT INTO `candidatos` (`id`, `nombre`) VALUES
(1, 'Candidato1'),
(2, 'Candidato2'),
(3, 'Candidato3'),
(4, 'Candidato4'),
(5, 'Candidato5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunas`
--

CREATE TABLE `comunas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `region_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comunas`
--

INSERT INTO `comunas` (`id`, `nombre`, `region_id`) VALUES
(1, 'Arica', 1),
(2, 'Camarones', 1),
(3, 'Putre', 1),
(4, 'General Lagos', 1),
(5, 'Iquique', 2),
(6, 'Alto Hospicio', 2),
(7, 'Pozo Almonte', 2),
(8, 'Camiña', 2),
(9, 'Colchane', 2),
(10, 'Huara', 2),
(11, 'Pica', 2),
(12, 'Antofagasta', 3),
(13, 'Mejillones', 3),
(14, 'Sierra Gorda', 3),
(15, 'Taltal', 3),
(16, 'Calama', 3),
(17, 'Ollagüe', 3),
(18, 'San Pedro de Atacama', 3),
(19, 'Tocopilla', 3),
(20, 'María Elena', 3),
(21, 'Copiapó', 4),
(22, 'Caldera', 4),
(23, 'Tierra Amarilla', 4),
(24, 'Chañaral', 4),
(25, 'Diego de Almagro', 4),
(26, 'Vallenar', 4),
(27, 'Alto del Carmen', 4),
(28, 'Freirina', 4),
(29, 'Huasco', 4),
(30, 'La Serena', 5),
(31, 'Coquimbo', 5),
(32, 'Andacollo', 5),
(33, 'La Higuera', 5),
(34, 'Paihuano', 5),
(35, 'Vicuña', 5),
(36, 'Illapel', 5),
(37, 'Canela', 5),
(38, 'Los Vilos', 5),
(39, 'Salamanca', 5),
(40, 'Ovalle', 5),
(41, 'Combarbalá', 5),
(42, 'Monte Patria', 5),
(43, 'Punitaqui', 5),
(44, 'Río Hurtado', 5),
(45, 'Valparaíso', 6),
(46, 'Casablanca', 6),
(47, 'Concón', 6),
(48, 'Juan Fernández', 6),
(49, 'Puchuncaví', 6),
(50, 'Quintero', 6),
(51, 'Viña del Mar', 6),
(52, 'Isla de Pascua', 6),
(53, 'Los Andes', 6),
(54, 'Calle Larga', 6),
(55, 'Rinconada', 6),
(56, 'San Esteban', 6),
(57, 'La Ligua', 6),
(58, 'Cabildo', 6),
(59, 'Papudo', 6),
(60, 'Petorca', 6),
(61, 'Zapallar', 6),
(62, 'Quillota', 6),
(63, 'La Calera', 6),
(64, 'Hijuelas', 6),
(65, 'La Cruz', 6),
(66, 'Nogales', 6),
(67, 'San Antonio', 6),
(68, 'Algarrobo', 6),
(69, 'Cartagena', 6),
(70, 'El Quisco', 6),
(71, 'El Tabo', 6),
(72, 'Santo Domingo', 6),
(73, 'San Felipe', 6),
(74, 'Catemu', 6),
(75, 'Llaillay', 6),
(76, 'Panquehue', 6),
(77, 'Putaendo', 6),
(78, 'Santa María', 6),
(79, 'Quilpué', 6),
(80, 'Limache', 6),
(81, 'Olmué', 6),
(82, 'Villa Alemana', 6),
(83, 'Santiago', 7),
(84, 'Cerrillos', 7),
(85, 'Cerro Navia', 7),
(86, 'Conchalí', 7),
(87, 'El Bosque', 7),
(88, 'Estación Central', 7),
(89, 'Huechuraba', 7),
(90, 'Independencia', 7),
(91, 'La Cisterna', 7),
(92, 'La Florida', 7),
(93, 'La Granja', 7),
(94, 'La Pintana', 7),
(95, 'La Reina', 7),
(96, 'Las Condes', 7),
(97, 'Lo Barnechea', 7),
(98, 'Lo Espejo', 7),
(99, 'Lo Prado', 7),
(100, 'Macul', 7),
(101, 'Maipú', 7),
(102, 'Ñuñoa', 7),
(103, 'Pedro Aguirre Cerda', 7),
(104, 'Peñalolén', 7),
(105, 'Providencia', 7),
(106, 'Pudahuel', 7),
(107, 'Quilicura', 7),
(108, 'Quinta Normal', 7),
(109, 'Recoleta', 7),
(110, 'Renca', 7),
(111, 'San Joaquín', 7),
(112, 'San Miguel', 7),
(113, 'San Ramón', 7),
(114, 'Vitacura', 7),
(115, 'Puente Alto', 7),
(116, 'Pirque', 7),
(117, 'San José de Maipo', 7),
(118, 'Colina', 7),
(119, 'Lampa', 7),
(120, 'Tiltil', 7),
(121, 'San Bernardo', 7),
(122, 'Buin', 7),
(123, 'Calera de Tango', 7),
(124, 'Paine', 7),
(125, 'Melipilla', 7),
(126, 'Alhué', 7),
(127, 'Curacaví', 7),
(128, 'María Pinto', 7),
(129, 'San Pedro', 7),
(130, 'Talagante', 7),
(131, 'El Monte', 7),
(132, 'Isla de Maipo', 7),
(133, 'Padre Hurtado', 7),
(134, 'Peñaflor', 7),
(135, 'Rancagua', 8),
(136, 'Codegua', 8),
(137, 'Coinco', 8),
(138, 'Coltauco', 8),
(139, 'Doñihue', 8),
(140, 'Graneros', 8),
(141, 'Las Cabras', 8),
(142, 'Machalí', 8),
(143, 'Malloa', 8),
(144, 'Mostazal', 8),
(145, 'Olivar', 8),
(146, 'Peumo', 8),
(147, 'Pichidegua', 8),
(148, 'Quinta de Tilcoco', 8),
(149, 'Rengo', 8),
(150, 'Requínoa', 8),
(151, 'San Vicente', 8),
(152, 'Pichilemu', 8),
(153, 'La Estrella', 8),
(154, 'Litueche', 8),
(155, 'Marchihue', 8),
(156, 'Navidad', 8),
(157, 'Paredones', 8),
(158, 'San Fernando', 8),
(159, 'Chépica', 8),
(160, 'Chimbarongo', 8),
(161, 'Lolol', 8),
(162, 'Nancagua', 8),
(163, 'Palmilla', 8),
(164, 'Peralillo', 8),
(165, 'Placilla', 8),
(166, 'Pumanque', 8),
(167, 'Santa Cruz', 8),
(168, 'Talca', 9),
(169, 'Constitución', 9),
(170, 'Curepto', 9),
(171, 'Empedrado', 9),
(172, 'Maule', 9),
(173, 'Pelarco', 9),
(174, 'Pencahue', 9),
(175, 'Río Claro', 9),
(176, 'San Clemente', 9),
(177, 'San Rafael', 9),
(178, 'Cauquenes', 9),
(179, 'Chanco', 9),
(180, 'Pelluhue', 9),
(181, 'Curicó', 9),
(182, 'Hualañé', 9),
(183, 'Licantén', 9),
(184, 'Molina', 9),
(185, 'Rauco', 9),
(186, 'Romeral', 9),
(187, 'Sagrada Familia', 9),
(188, 'Teno', 9),
(189, 'Vichuquén', 9),
(190, 'Linares', 9),
(191, 'Colbún', 9),
(192, 'Longaví', 9),
(193, 'Parral', 9),
(194, 'Retiro', 9),
(195, 'San Javier', 9),
(196, 'Villa Alegre', 9),
(197, 'Yerbas Buenas', 9),
(198, 'Chillán', 10),
(199, 'Bulnes', 10),
(200, 'Cobquecura', 10),
(201, 'Coelemu', 10),
(202, 'Coihueco', 10),
(203, 'El Carmen', 10),
(204, 'Ninhue', 10),
(205, 'Ñiquén', 10),
(206, 'Pemuco', 10),
(207, 'Pinto', 10),
(208, 'Portezuelo', 10),
(209, 'Quillón', 10),
(210, 'Quirihue', 10),
(211, 'Ránquil', 10),
(212, 'San Carlos', 10),
(213, 'San Fabián', 10),
(214, 'San Ignacio', 10),
(215, 'San Nicolás', 10),
(216, 'Treguaco', 10),
(217, 'Yungay', 10),
(218, 'Concepción', 11),
(219, 'Coronel', 11),
(220, 'Chiguayante', 11),
(221, 'Florida', 11),
(222, 'Hualqui', 11),
(223, 'Lota', 11),
(224, 'Penco', 11),
(225, 'San Pedro de la Paz', 11),
(226, 'Santa Juana', 11),
(227, 'Talcahuano', 11),
(228, 'Tomé', 11),
(229, 'Hualpén', 11),
(230, 'Lebu', 11),
(231, 'Arauco', 11),
(232, 'Cañete', 11),
(233, 'Contulmo', 11),
(234, 'Curanilahue', 11),
(235, 'Los Álamos', 11),
(236, 'Tirúa', 11),
(237, 'Los Ángeles', 11),
(238, 'Antuco', 11),
(239, 'Cabrero', 11),
(240, 'Laja', 11),
(241, 'Mulchén', 11),
(242, 'Nacimiento', 11),
(243, 'Negrete', 11),
(244, 'Quilaco', 11),
(245, 'Quilleco', 11),
(246, 'San Rosendo', 11),
(247, 'Santa Bárbara', 11),
(248, 'Tucapel', 11),
(249, 'Yumbel', 11),
(250, 'Alto Biobío', 11),
(251, 'Temuco', 12),
(252, 'Carahue', 12),
(253, 'Cunco', 12),
(254, 'Curarrehue', 12),
(255, 'Freire', 12),
(256, 'Galvarino', 12),
(257, 'Gorbea', 12),
(258, 'Lautaro', 12),
(259, 'Loncoche', 12),
(260, 'Melipeuco', 12),
(261, 'Nueva Imperial', 12),
(262, 'Padre Las Casas', 12),
(263, 'Perquenco', 12),
(264, 'Pitrufquén', 12),
(265, 'Pucón', 12),
(266, 'Saavedra', 12),
(267, 'Teodoro Schmidt', 12),
(268, 'Toltén', 12),
(269, 'Vilcún', 12),
(270, 'Villarrica', 12),
(271, 'Cholchol', 12),
(272, 'Angol', 12),
(273, 'Collipulli', 12),
(274, 'Curacautín', 12),
(275, 'Ercilla', 12),
(276, 'Lonquimay', 12),
(277, 'Los Sauces', 12),
(278, 'Lumaco', 12),
(279, 'Purén', 12),
(280, 'Renaico', 12),
(281, 'Traiguén', 12),
(282, 'Victoria', 12),
(283, 'Valdivia', 13),
(284, 'Corral', 13),
(285, 'Lanco', 13),
(286, 'Los Lagos', 13),
(287, 'Máfil', 13),
(288, 'Mariquina', 13),
(289, 'Paillaco', 13),
(290, 'Panguipulli', 13),
(291, 'La Unión', 13),
(292, 'Futrono', 13),
(293, 'Lago Ranco', 13),
(294, 'Río Bueno', 13),
(295, 'Puerto Montt', 14),
(296, 'Calbuco', 14),
(297, 'Cochamó', 14),
(298, 'Fresia', 14),
(299, 'Frutillar', 14),
(300, 'Los Muermos', 14),
(301, 'Llanquihue', 14),
(302, 'Maullín', 14),
(303, 'Puerto Varas', 14),
(304, 'Castro', 14),
(305, 'Ancud', 14),
(306, 'Chonchi', 14),
(307, 'Curaco de Vélez', 14),
(308, 'Dalcahue', 14),
(309, 'Puqueldón', 14),
(310, 'Queilén', 14),
(311, 'Quellón', 14),
(312, 'Quemchi', 14),
(313, 'Quinchao', 14),
(314, 'Osorno', 14),
(315, 'Puerto Octay', 14),
(316, 'Purranque', 14),
(317, 'Puyehue', 14),
(318, 'Río Negro', 14),
(319, 'San Juan de la Costa', 14),
(320, 'San Pablo', 14),
(321, 'Chaitén', 14),
(322, 'Futaleufú', 14),
(323, 'Hualaihué', 14),
(324, 'Palena', 14),
(325, 'Coihaique', 15),
(326, 'Lago Verde', 15),
(327, 'Aysén', 15),
(328, 'Cisnes', 15),
(329, 'Guaitecas', 15),
(330, 'Cochrane', 15),
(331, 'O’Higgins', 15),
(332, 'Tortel', 15),
(333, 'Chile Chico', 15),
(334, 'Río Ibáñez', 15),
(335, 'Punta Arenas', 16),
(336, 'Laguna Blanca', 16),
(337, 'Río Verde', 16),
(338, 'San Gregorio', 16),
(339, 'Cabo de Hornos (Ex-Navarino)', 16),
(340, 'Antártica', 16),
(341, 'Porvenir', 16),
(342, 'Primavera', 16),
(343, 'Timaukel', 16),
(344, 'Natales', 16),
(345, 'Torres del Paine', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regiones`
--

CREATE TABLE `regiones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `regiones`
--

INSERT INTO `regiones` (`id`, `nombre`) VALUES
(1, 'Arica y Parinacota'),
(2, 'Tarapacá'),
(3, 'Antofagasta'),
(4, 'Atacama'),
(5, 'Coquimbo'),
(6, 'Valparaíso'),
(7, 'Metropolitana de Santiago'),
(8, 'Libertador General Bernardo O’Higgins'),
(9, 'Maule'),
(10, 'Ñuble'),
(11, 'Biobío'),
(12, 'La Araucanía'),
(13, 'Los Ríos'),
(14, 'Los Lagos'),
(15, 'Aysén del General Carlos Ibáñez del Campo'),
(16, 'Magallanes y de la Antártica Chilena');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votos`
--

CREATE TABLE `votos` (
  `id` int(11) NOT NULL,
  `full_name` varchar(200) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `rut` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `candidate` varchar(100) DEFAULT NULL,
  `comuna` varchar(100) DEFAULT NULL,
  `heard_about_us` varchar(255) DEFAULT NULL,
  `voted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `votos`
--

INSERT INTO `votos` (`id`, `full_name`, `alias`, `rut`, `email`, `region`, `candidate`, `comuna`, `heard_about_us`, `voted`) VALUES
(89, 'Jeremías Campos', 'jere21', '211304561', 'jeremiascamposmonardes@gmail.com', 'Libertador General Bernardo O’Higgins', 'Candidato2', 'Pichidegua', 'Web, Tv', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `candidatos`
--
ALTER TABLE `candidatos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comunas`
--
ALTER TABLE `comunas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region_id` (`region_id`);

--
-- Indices de la tabla `regiones`
--
ALTER TABLE `regiones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `votos`
--
ALTER TABLE `votos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rut` (`rut`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `candidatos`
--
ALTER TABLE `candidatos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `comunas`
--
ALTER TABLE `comunas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=346;

--
-- AUTO_INCREMENT de la tabla `regiones`
--
ALTER TABLE `regiones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `votos`
--
ALTER TABLE `votos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comunas`
--
ALTER TABLE `comunas`
  ADD CONSTRAINT `comunas_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regiones` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
