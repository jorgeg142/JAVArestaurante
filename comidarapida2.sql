-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-07-2024 a las 16:42:23
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `comidarapida2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacenes`
--

CREATE TABLE `almacenes` (
  `idalmacen` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `almacenes`
--

INSERT INTO `almacenes` (`idalmacen`, `nombre`, `descripcion`, `direccion`) VALUES
(8, 'casa', 'as', 'sa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cocineros`
--

CREATE TABLE `cocineros` (
  `anio_serv` int(11) NOT NULL,
  `trabajadores_ci` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cocineros`
--

INSERT INTO `cocineros` (`anio_serv`, `trabajadores_ci`) VALUES
(15, 5654644);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estanteria`
--

CREATE TABLE `estanteria` (
  `letra` char(2) NOT NULL,
  `tamaño` int(11) NOT NULL,
  `idalmacen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estanteria`
--

INSERT INTO `estanteria` (`letra`, `tamaño`, `idalmacen`) VALUES
('A', 100, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estanteria_ingredientes`
--

CREATE TABLE `estanteria_ingredientes` (
  `idalmacen` int(11) NOT NULL,
  `idingredientes` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estanteria_ingredientes`
--

INSERT INTO `estanteria_ingredientes` (`idalmacen`, `idingredientes`, `cantidad`) VALUES
(8, 11, 1),
(8, 12, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE `ingredientes` (
  `idingredientes` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `idplatos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`idingredientes`, `nombre`, `idplatos`) VALUES
(10, 'papaa', 3),
(11, 'papa', 3),
(12, 'a', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pinches`
--

CREATE TABLE `pinches` (
  `f_nac` date NOT NULL,
  `pinches_trabajadores_ci` int(11) NOT NULL,
  `cocineros_ci` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pinches`
--

INSERT INTO `pinches` (`f_nac`, `pinches_trabajadores_ci`, `cocineros_ci`) VALUES
('2002-11-06', 5745523, 5654644);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platos`
--

CREATE TABLE `platos` (
  `idplatos` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `trabajadores_ci` int(11) NOT NULL,
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `platos`
--

INSERT INTO `platos` (`idplatos`, `nombre`, `tipo`, `trabajadores_ci`, `precio`) VALUES
(3, 'milanesa de pollo con pure de papa', 'fritura con papa', 5654644, 20000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajadores`
--

CREATE TABLE `trabajadores` (
  `ci` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `tel_fijo` int(10) NOT NULL,
  `tel_movil` int(10) NOT NULL,
  `nss` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `trabajadores`
--

INSERT INTO `trabajadores` (`ci`, `nombre`, `apellidos`, `tel_fijo`, `tel_movil`, `nss`) VALUES
(23423, 'juan', 'Carballo', 345345, 345345, 345345),
(5654644, 'Angell', 'Olmedo', 346575, 97123, 43546),
(5745523, 'Eduardo', 'Franco', 234324, 233423, 2343);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacenes`
--
ALTER TABLE `almacenes`
  ADD PRIMARY KEY (`idalmacen`);

--
-- Indices de la tabla `cocineros`
--
ALTER TABLE `cocineros`
  ADD PRIMARY KEY (`trabajadores_ci`);

--
-- Indices de la tabla `estanteria`
--
ALTER TABLE `estanteria`
  ADD PRIMARY KEY (`idalmacen`);

--
-- Indices de la tabla `estanteria_ingredientes`
--
ALTER TABLE `estanteria_ingredientes`
  ADD PRIMARY KEY (`idalmacen`,`idingredientes`),
  ADD KEY `idingredientes` (`idingredientes`);

--
-- Indices de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD PRIMARY KEY (`idingredientes`,`idplatos`),
  ADD KEY `idplatos` (`idplatos`);

--
-- Indices de la tabla `pinches`
--
ALTER TABLE `pinches`
  ADD PRIMARY KEY (`pinches_trabajadores_ci`),
  ADD KEY `trabajadores_ci` (`cocineros_ci`);

--
-- Indices de la tabla `platos`
--
ALTER TABLE `platos`
  ADD PRIMARY KEY (`idplatos`),
  ADD KEY `trabajadores_ci` (`trabajadores_ci`);

--
-- Indices de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD PRIMARY KEY (`ci`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacenes`
--
ALTER TABLE `almacenes`
  MODIFY `idalmacen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `estanteria_ingredientes`
--
ALTER TABLE `estanteria_ingredientes`
  MODIFY `idingredientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  MODIFY `idingredientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `platos`
--
ALTER TABLE `platos`
  MODIFY `idplatos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cocineros`
--
ALTER TABLE `cocineros`
  ADD CONSTRAINT `cocineros_ibfk_1` FOREIGN KEY (`trabajadores_ci`) REFERENCES `trabajadores` (`ci`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estanteria`
--
ALTER TABLE `estanteria`
  ADD CONSTRAINT `estanteria_ibfk_1` FOREIGN KEY (`idalmacen`) REFERENCES `almacenes` (`idalmacen`);

--
-- Filtros para la tabla `estanteria_ingredientes`
--
ALTER TABLE `estanteria_ingredientes`
  ADD CONSTRAINT `estanteria_ingredientes_ibfk_1` FOREIGN KEY (`idingredientes`) REFERENCES `ingredientes` (`idingredientes`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estanteria_ingredientes_ibfk_2` FOREIGN KEY (`idalmacen`) REFERENCES `estanteria` (`idalmacen`);

--
-- Filtros para la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD CONSTRAINT `ingredientes_ibfk_1` FOREIGN KEY (`idplatos`) REFERENCES `platos` (`idplatos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pinches`
--
ALTER TABLE `pinches`
  ADD CONSTRAINT `pinches_ibfk_1` FOREIGN KEY (`pinches_trabajadores_ci`) REFERENCES `trabajadores` (`ci`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pinches_ibfk_2` FOREIGN KEY (`cocineros_ci`) REFERENCES `cocineros` (`trabajadores_ci`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `platos`
--
ALTER TABLE `platos`
  ADD CONSTRAINT `platos_ibfk_1` FOREIGN KEY (`trabajadores_ci`) REFERENCES `cocineros` (`trabajadores_ci`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
