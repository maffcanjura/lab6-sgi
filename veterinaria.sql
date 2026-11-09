-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-10-2026 a las 17:51:37
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
-- Base de datos: `veterinaria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `Id_Cita` int(10) NOT NULL,
  `Fecha_Hora` datetime NOT NULL,
  `Motivo` varchar(100) NOT NULL,
  `Diagnostico` varchar(150) NOT NULL,
  `Costo` decimal(10,2) NOT NULL,
  `Id_Mascota` int(10) NOT NULL,
  `Id_Veterinario` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`Id_Cita`, `Fecha_Hora`, `Motivo`, `Diagnostico`, `Costo`, `Id_Mascota`, `Id_Veterinario`) VALUES
(1, '2026-08-03 08:30:00', 'Vacunación anual', 'Paciente sano, se aplica vacuna', 25.00, 1, 1),
(2, '2026-08-10 14:00:00', 'Picazón en la piel', 'Dermatitis alérgica', 35.50, 2, 3),
(3, '2026-08-17 15:30:00', 'Esterilización', 'Cirugía sin complicaciones', 120.00, 3, 2),
(4, '2026-08-24 16:00:00', 'Ojo irritado', 'Conjuntivitis leve', 30.00, 4, 7),
(5, '2026-09-01 13:15:00', 'Mal aliento', 'Acumulación de sarro', 45.00, 5, 4),
(6, '2026-09-08 09:00:00', 'Control de peso', 'Sobrepeso moderado', 20.00, 6, 9),
(7, '2026-09-15 10:45:00', 'Vómitos frecuentes', 'Gastritis', 40.00, 7, 10),
(8, '2026-09-22 11:30:00', 'Pérdida de plumas', 'Deficiencia de vitaminas', 28.75, 8, 5),
(9, '2026-09-29 20:00:00', 'Cojera en pata trasera', 'Esguince de rodilla', 60.00, 9, 8),
(10, '2026-10-06 21:15:00', 'Respiración agitada', 'Soplo cardíaco leve', 55.00, 10, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dueno`
--

CREATE TABLE `dueno` (
  `Id_Dueno` int(10) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Direccion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dueno`
--

INSERT INTO `dueno` (`Id_Dueno`, `Nombre`, `Apellido`, `Telefono`, `Direccion`) VALUES
(1, 'María José', 'Aguilar', '7011-2233', 'Colonia Escalón, San Salvador'),
(2, 'Roberto', 'Campos', '7122-3344', 'Residencial Santa Elena, Antiguo Cuscatlán'),
(3, 'Andrea', 'Quintanilla', '7233-4455', 'Colonia Miramonte, San Salvador'),
(4, 'Fernando', 'Escobar', '7344-5566', 'Barrio El Centro, Santa Tecla'),
(5, 'Valeria', 'Monterrosa', '7455-6677', 'Colonia San Benito, San Salvador'),
(6, 'Óscar', 'Henríquez', '7566-7788', 'Urbanización Cumbres de Cuscatlán'),
(7, 'Camila', 'Rodríguez', '7677-8899', 'Colonia Layco, San Salvador'),
(8, 'Javier', 'Sandoval', '7788-9900', 'Residencial Los Sueños, Santa Tecla'),
(9, 'Natalia', 'Figueroa', '7899-0011', 'Colonia Flor Blanca, San Salvador'),
(10, 'Mauricio', 'Cáceres', '7900-1122', 'Colonia Médica, San Salvador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota`
--

CREATE TABLE `mascota` (
  `Id_Mascota` int(10) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `Especie` varchar(30) NOT NULL,
  `Raza` varchar(50) NOT NULL,
  `Sexo` char(1) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Id_Dueno` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mascota`
--

INSERT INTO `mascota` (`Id_Mascota`, `Nombre`, `Especie`, `Raza`, `Sexo`, `Fecha_Nacimiento`, `Id_Dueno`) VALUES
(1, 'Max', 'Perro', 'Labrador', 'M', '2021-03-14', 1),
(2, 'Luna', 'Gato', 'Siamés', 'H', '2022-07-02', 2),
(3, 'Rocky', 'Perro', 'Bulldog inglés', 'M', '2020-11-25', 3),
(4, 'Mía', 'Gato', 'Persa', 'H', '2023-01-09', 4),
(5, 'Toby', 'Perro', 'Beagle', 'M', '2019-06-30', 5),
(6, 'Nala', 'Perro', 'Golden retriever', 'H', '2022-02-18', 6),
(7, 'Simba', 'Gato', 'Criollo', 'M', '2021-09-05', 7),
(8, 'Coco', 'Ave', 'Periquito australiano', 'M', '2023-05-21', 8),
(9, 'Bruno', 'Perro', 'Pastor alemán', 'M', '2020-04-12', 9),
(10, 'Pelusa', 'Conejo', 'Cabeza de león', 'H', '2024-01-27', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamento`
--

CREATE TABLE `medicamento` (
  `Id_Medicamento` int(10) NOT NULL,
  `Nombre_Comercial` varchar(60) NOT NULL,
  `Presentacion` varchar(40) NOT NULL,
  `Precio_Unitario` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicamento`
--

INSERT INTO `medicamento` (`Id_Medicamento`, `Nombre_Comercial`, `Presentacion`, `Precio_Unitario`) VALUES
(1, 'Apoquel 16 mg', 'Tabletas', 2.50),
(2, 'Rimadyl 75 mg', 'Tabletas', 1.80),
(3, 'Tobrex', 'Gotas oftálmicas', 9.75),
(4, 'Omeprazol 20 mg', 'Cápsulas', 0.60),
(5, 'Amoxicilina 250 mg', 'Suspensión oral', 7.25),
(6, 'Meloxicam 1.5 mg/ml', 'Suspensión oral', 11.40),
(7, 'Vitamina AD3E', 'Gotas orales', 6.90),
(8, 'Clorhexidina 0.12 %', 'Enjuague bucal', 5.30),
(9, 'Enalapril 5 mg', 'Tabletas', 0.95),
(10, 'Royal Canin Satiety', 'Alimento seco 1.5 kg', 24.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE `receta` (
  `Id_Receta` int(10) NOT NULL,
  `Id_Cita` int(10) NOT NULL,
  `Id_Medicamento` int(10) NOT NULL,
  `Dosis` varchar(60) NOT NULL,
  `Cantidad` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `receta`
--

INSERT INTO `receta` (`Id_Receta`, `Id_Cita`, `Id_Medicamento`, `Dosis`, `Cantidad`) VALUES
(1, 2, 1, '1 tableta cada 12 horas', 14),
(2, 3, 2, '1 tableta cada 24 horas', 5),
(3, 3, 5, '5 ml cada 12 horas', 1),
(4, 4, 3, '2 gotas cada 8 horas', 1),
(5, 5, 8, 'Aplicar una vez al día', 1),
(6, 6, 10, '120 g diarios', 2),
(7, 7, 4, '1 cápsula en ayunas', 7),
(8, 8, 7, '3 gotas en el agua', 1),
(9, 9, 6, '0.5 ml cada 24 horas', 1),
(10, 10, 9, '1 tableta cada 12 horas', 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `veterinario`
--

CREATE TABLE `veterinario` (
  `Id_Veterinario` int(10) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Especialidad` varchar(60) NOT NULL,
  `Turno` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `veterinario`
--

INSERT INTO `veterinario` (`Id_Veterinario`, `Nombre`, `Apellido`, `Especialidad`, `Turno`) VALUES
(1, 'Patricia', 'Morales', 'Medicina general', 'Mañana'),
(2, 'Héctor', 'Rivas', 'Cirugía', 'Tarde'),
(3, 'Lorena', 'Ventura', 'Dermatología', 'Mañana'),
(4, 'Ernesto', 'Mejía', 'Odontología', 'Tarde'),
(5, 'Karla', 'Peñate', 'Animales exóticos', 'Mañana'),
(6, 'Rodrigo', 'Barahona', 'Cardiología', 'Noche'),
(7, 'Silvia', 'Ochoa', 'Oftalmología', 'Tarde'),
(8, 'Manuel', 'Tobar', 'Traumatología', 'Noche'),
(9, 'Rebeca', 'Lara', 'Nutrición', 'Mañana'),
(10, 'Alejandro', 'Funes', 'Medicina interna', 'Tarde');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`Id_Cita`),
  ADD KEY `cita_mascota_fk` (`Id_Mascota`),
  ADD KEY `cita_veterinario_fk` (`Id_Veterinario`);

--
-- Indices de la tabla `dueno`
--
ALTER TABLE `dueno`
  ADD PRIMARY KEY (`Id_Dueno`);

--
-- Indices de la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD PRIMARY KEY (`Id_Mascota`),
  ADD KEY `mascota_dueno_fk` (`Id_Dueno`);

--
-- Indices de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  ADD PRIMARY KEY (`Id_Medicamento`);

--
-- Indices de la tabla `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`Id_Receta`),
  ADD KEY `receta_cita_fk` (`Id_Cita`),
  ADD KEY `receta_medicamento_fk` (`Id_Medicamento`);

--
-- Indices de la tabla `veterinario`
--
ALTER TABLE `veterinario`
  ADD PRIMARY KEY (`Id_Veterinario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `Id_Cita` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `dueno`
--
ALTER TABLE `dueno`
  MODIFY `Id_Dueno` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `mascota`
--
ALTER TABLE `mascota`
  MODIFY `Id_Mascota` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  MODIFY `Id_Medicamento` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `receta`
--
ALTER TABLE `receta`
  MODIFY `Id_Receta` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `veterinario`
--
ALTER TABLE `veterinario`
  MODIFY `Id_Veterinario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_mascota_fk` FOREIGN KEY (`Id_Mascota`) REFERENCES `mascota` (`Id_Mascota`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cita_veterinario_fk` FOREIGN KEY (`Id_Veterinario`) REFERENCES `veterinario` (`Id_Veterinario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD CONSTRAINT `mascota_dueno_fk` FOREIGN KEY (`Id_Dueno`) REFERENCES `dueno` (`Id_Dueno`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `receta`
--
ALTER TABLE `receta`
  ADD CONSTRAINT `receta_cita_fk` FOREIGN KEY (`Id_Cita`) REFERENCES `cita` (`Id_Cita`) ON UPDATE CASCADE,
  ADD CONSTRAINT `receta_medicamento_fk` FOREIGN KEY (`Id_Medicamento`) REFERENCES `medicamento` (`Id_Medicamento`) ON UPDATE CASCADE;
-- --------------------------------------------------------
-- Tablas de la Practica de Laboratorio #6
-- --------------------------------------------------------

CREATE TABLE USUARIO (
  Id_Usuario INT(10) NOT NULL AUTO_INCREMENT,
  Usuario VARCHAR(50) NOT NULL,
  Contrasena VARCHAR(50) NOT NULL,
  PRIMARY KEY (Id_Usuario)
);

INSERT INTO USUARIO (Usuario, Contrasena)
VALUES ('veterinaria', 'mascotas2026');

CREATE TABLE VENTAS (
  Id_Venta INT NOT NULL AUTO_INCREMENT,
  Producto VARCHAR(50) NOT NULL,
  Cantidad INT NOT NULL,
  PRIMARY KEY (Id_Venta)
);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
