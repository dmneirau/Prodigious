-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-08-2016 a las 05:30:17
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `web_festival`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `city`
--

CREATE TABLE `city` (
  `id_city` int(11) NOT NULL COMMENT 'City identifier',
  `name` varchar(60) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'City name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='City information';

--
-- Volcado de datos para la tabla `city`
--

INSERT INTO `city` (`id_city`, `name`) VALUES
(1, 'Bogotá'),
(2, 'Cali'),
(3, 'Medellín'),
(4, 'Ibagué'),
(5, 'Cartagena'),
(6, 'Barranquilla');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `groups`
--
CREATE TABLE `groups` (
`id` int(11)
,`name` varchar(60)
,`image` varchar(255)
,`description` text
,`genre` varchar(60)
,`city` varchar(60)
,`first_name` varchar(30)
,`last_name` varchar(30)
,`instrument` varchar(60)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instruments`
--

CREATE TABLE `instruments` (
  `id_instrument` int(11) NOT NULL COMMENT 'Instrument identifier',
  `name` varchar(60) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Instrument name',
  `id_type` int(11) NOT NULL COMMENT 'Instrument type identifier rel with instrument_type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Instrument information';

--
-- Volcado de datos para la tabla `instruments`
--

INSERT INTO `instruments` (`id_instrument`, `name`, `id_type`) VALUES
(1, 'Guitarra', 1),
(2, 'Piano', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instrument_types`
--

CREATE TABLE `instrument_types` (
  `id_instrument_type` int(11) NOT NULL COMMENT 'Instrument type identifier',
  `name` varchar(30) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Instrument type description'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Instrument type clasification';

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `members`
--
CREATE TABLE `members` (
`first_name` varchar(30)
,`last_name` varchar(30)
,`id` int(11)
,`instrument` varchar(60)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `musical_festivals`
--

CREATE TABLE `musical_festivals` (
  `id_musical_festival` int(11) NOT NULL COMMENT 'Musical festival identifier',
  `name` varchar(30) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Musical festival name',
  `description` text COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Musical festival description',
  `bdate` date NOT NULL COMMENT 'Musical festival beginning date',
  `edate` date NOT NULL COMMENT 'Musical festival end date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Musical festival information';

--
-- Volcado de datos para la tabla `musical_festivals`
--

INSERT INTO `musical_festivals` (`id_musical_festival`, `name`, `description`, `bdate`, `edate`) VALUES
(1, 'Wind musical festival', 'The greatest festival in the month of wind with all the music for your senses.', '2016-08-25', '2016-08-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `musical_genres`
--

CREATE TABLE `musical_genres` (
  `id_musical_genre` int(11) NOT NULL COMMENT 'Musical genre identifier',
  `name` varchar(60) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Musical genre name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Musical genre information';

--
-- Volcado de datos para la tabla `musical_genres`
--

INSERT INTO `musical_genres` (`id_musical_genre`, `name`) VALUES
(1, 'Salsa'),
(2, 'Metal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `musical_groups`
--

CREATE TABLE `musical_groups` (
  `id_musical_group` int(11) NOT NULL COMMENT 'Musical group identifier',
  `name` varchar(60) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Musical group name',
  `image` varchar(255) COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'group_images\\img_defecto.png' COMMENT 'Musical group image path and file',
  `description` text COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Group description',
  `id_genre` int(11) NOT NULL COMMENT 'Musical group genre identifier',
  `id_city` int(11) NOT NULL COMMENT 'Musical group city identifier'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Musical group information';

--
-- Volcado de datos para la tabla `musical_groups`
--

INSERT INTO `musical_groups` (`id_musical_group`, `name`, `image`, `description`, `id_genre`, `id_city`) VALUES
(1, 'Salsa for kids', 'group_images\\salsa.jpg', 'This group sings salsa songs in new versions for kids', 1, 3),
(2, 'Metal group', 'group_images\\img_defecto.png', 'Metal group integrated by 5 brothers', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `performer`
--

CREATE TABLE `performer` (
  `id_performer` int(11) NOT NULL COMMENT 'Performer identifier',
  `first_name` varchar(30) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Performer first name',
  `last_name` varchar(30) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Performer last name',
  `gender` varchar(1) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Performer gender f-female or m-male',
  `age` int(11) NOT NULL,
  `id_musical_group` int(11) NOT NULL COMMENT 'Performer musical group identifier',
  `id_instrument` int(11) NOT NULL COMMENT 'Perfoemer instrument identifier'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Performer personal information';

--
-- Volcado de datos para la tabla `performer`
--

INSERT INTO `performer` (`id_performer`, `first_name`, `last_name`, `gender`, `age`, `id_musical_group`, `id_instrument`) VALUES
(1, 'Lucia', 'Dominguez', 'F', 25, 1, 1),
(2, 'Mauricio', 'Fernandez', 'M', 31, 1, 2);

-- --------------------------------------------------------

--
-- Estructura para la vista `groups`
--
DROP TABLE IF EXISTS `groups`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `groups`  AS  (select `a`.`id_musical_group` AS `id`,`a`.`name` AS `name`,`a`.`image` AS `image`,`a`.`description` AS `description`,`b`.`name` AS `genre`,`c`.`name` AS `city`,`d`.`first_name` AS `first_name`,`d`.`last_name` AS `last_name`,`d`.`instrument` AS `instrument` from (((`musical_groups` `a` join `musical_genres` `b`) join `city` `c`) left join `members` `d` on((`a`.`id_musical_group` = `d`.`id`))) where ((`a`.`id_genre` = `b`.`id_musical_genre`) and (`a`.`id_city` = `c`.`id_city`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `members`
--
DROP TABLE IF EXISTS `members`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `members`  AS  (select `a`.`first_name` AS `first_name`,`a`.`last_name` AS `last_name`,`a`.`id_musical_group` AS `id`,`b`.`name` AS `instrument` from (`performer` `a` join `instruments` `b`) where (`a`.`id_instrument` = `b`.`id_instrument`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id_city`);

--
-- Indices de la tabla `instruments`
--
ALTER TABLE `instruments`
  ADD PRIMARY KEY (`id_instrument`);

--
-- Indices de la tabla `instrument_types`
--
ALTER TABLE `instrument_types`
  ADD PRIMARY KEY (`id_instrument_type`);

--
-- Indices de la tabla `musical_festivals`
--
ALTER TABLE `musical_festivals`
  ADD PRIMARY KEY (`id_musical_festival`);

--
-- Indices de la tabla `musical_genres`
--
ALTER TABLE `musical_genres`
  ADD PRIMARY KEY (`id_musical_genre`);

--
-- Indices de la tabla `musical_groups`
--
ALTER TABLE `musical_groups`
  ADD PRIMARY KEY (`id_musical_group`);

--
-- Indices de la tabla `performer`
--
ALTER TABLE `performer`
  ADD PRIMARY KEY (`id_performer`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `city`
--
ALTER TABLE `city`
  MODIFY `id_city` int(11) NOT NULL AUTO_INCREMENT COMMENT 'City identifier', AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `instruments`
--
ALTER TABLE `instruments`
  MODIFY `id_instrument` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Instrument identifier', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `instrument_types`
--
ALTER TABLE `instrument_types`
  MODIFY `id_instrument_type` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Instrument type identifier';
--
-- AUTO_INCREMENT de la tabla `musical_festivals`
--
ALTER TABLE `musical_festivals`
  MODIFY `id_musical_festival` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Musical festival identifier', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `musical_genres`
--
ALTER TABLE `musical_genres`
  MODIFY `id_musical_genre` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Musical genre identifier', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `musical_groups`
--
ALTER TABLE `musical_groups`
  MODIFY `id_musical_group` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Musical group identifier', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `performer`
--
ALTER TABLE `performer`
  MODIFY `id_performer` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Performer identifier', AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
