/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50624
 Source Host           : localhost
 Source Database       : utsys

 Target Server Type    : MySQL
 Target Server Version : 50624
 File Encoding         : utf-8

 Date: 08/17/2015 08:46:34 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `alumno`
-- ----------------------------
DROP TABLE IF EXISTS `alumno`;
CREATE TABLE `alumno` (
  `idperfil` int(9) NOT NULL,
  `cuatrimestre` tinyint(3) NOT NULL,
  `id_grupo` int(11) NOT NULL,
  PRIMARY KEY (`idperfil`),
  UNIQUE KEY `idprofile_UNIQUE` (`idperfil`),
  KEY `fk_alumno_perfiles1_idx` (`idperfil`),
  KEY `fk_alumno_grupo1_idx` (`id_grupo`),
  CONSTRAINT `fk_alumno_grupo1` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`idgrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumno_perfiles1` FOREIGN KEY (`idperfil`) REFERENCES `perfil` (`idperfil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
--  Table structure for `asistencia_alumno`
-- ----------------------------
DROP TABLE IF EXISTS `asistencia_alumno`;
CREATE TABLE `asistencia_alumno` (
  `idalumno` int(9) NOT NULL,
  `idhorario` int(11) NOT NULL,
  `idparcial` int(11) NOT NULL,
  `asistencia` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idalumno`,`idhorario`,`idparcial`),
  KEY `fk_horario_has_alumno_horario1_idx` (`idhorario`),
  KEY `fk_asistencia_parcial1_idx` (`idparcial`),
  KEY `fk_asistencia_alumno_alumno1_idx` (`idalumno`),
  CONSTRAINT `fk_asistencia_alumno_alumno1` FOREIGN KEY (`idalumno`) REFERENCES `alumno` (`idperfil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_asistencia_parcial1` FOREIGN KEY (`idparcial`) REFERENCES `parcial` (`idparcial`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_horario_has_alumno_horario1` FOREIGN KEY (`idhorario`) REFERENCES `horario` (`idhorario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
--  Table structure for `autor`
-- ----------------------------
DROP TABLE IF EXISTS `autor`;
CREATE TABLE `autor` (
  `idautor` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idautor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
--  Table structure for `calificacion`
-- ----------------------------
DROP TABLE IF EXISTS `calificacion`;
CREATE TABLE `calificacion` (
  `idparcial` int(11) NOT NULL,
  `idalumno` int(9) NOT NULL,
  `calificacion` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idparcial`,`idalumno`),
  KEY `fk_alumno_has_parcial_parcial1_idx` (`idparcial`),
  KEY `fk_calificacion_alumno1_idx` (`idalumno`),
  CONSTRAINT `fk_alumno_has_parcial_parcial1` FOREIGN KEY (`idparcial`) REFERENCES `parcial` (`idparcial`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_calificacion_alumno1` FOREIGN KEY (`idalumno`) REFERENCES `alumno` (`idperfil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
--  Table structure for `carrera`
-- ----------------------------
DROP TABLE IF EXISTS `carrera`;
CREATE TABLE `carrera` (
  `idcarrera` int(9) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `modalidad` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `turno` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `division` int(9) NOT NULL,
  PRIMARY KEY (`idcarrera`),
  KEY `fk_carrera_divisiones_idx` (`division`),
  CONSTRAINT `fk_carrera_divisiones` FOREIGN KEY (`division`) REFERENCES `division` (`iddivision`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
--  Table structure for `colaborador`
-- ----------------------------
DROP TABLE IF EXISTS `colaborador`;
CREATE TABLE `colaborador` (
  `idperfil` int(9) NOT NULL,
  `idpuesto` int(9) NOT NULL,
  PRIMARY KEY (`idperfil`),
  KEY `fk_colaboradores_perfiles1_idx` (`idperfil`),
  KEY `fk_colaboradores_puestos1_idx` (`idpuesto`),
  CONSTRAINT `fk_colaboradores_perfiles1` FOREIGN KEY (`idperfil`) REFERENCES `perfil` (`idperfil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_colaboradores_puestos1` FOREIGN KEY (`idpuesto`) REFERENCES `puesto` (`idpuesto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
--  Table structure for `cuenta`
-- ----------------------------
DROP TABLE IF EXISTS `cuenta`;
CREATE TABLE `cuenta` (
  `usuario` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `contrasena` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `idperfil` int(9) NOT NULL,
  PRIMARY KEY (`usuario`),
  KEY `fk_cuentas_perfiles1_idx` (`idperfil`),
  CONSTRAINT `fk_cuentas_perfiles1` FOREIGN KEY (`idperfil`) REFERENCES `perfil` (`idperfil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
--  Records of `cuenta`
-- ----------------------------
BEGIN;
INSERT INTO `cuenta` VALUES ('admin', '21232f297a57a5a743894a0e4a801fc3', '2');
COMMIT;

-- ----------------------------
--  Table structure for `departamento`
-- ----------------------------
DROP TABLE IF EXISTS `departamento`;
CREATE TABLE `departamento` (
  `iddepartamento` int(9) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `edificio_asignado` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`iddepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
--  Table structure for `dia`
-- ----------------------------
DROP TABLE IF EXISTS `dia`;
CREATE TABLE `dia` (
  `iddia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`iddia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
--  Table structure for `division`
-- ----------------------------
DROP TABLE IF EXISTS `division`;
CREATE TABLE `division` (
  `iddivision` int(9) NOT NULL AUTO_INCREMENT,
  `nombre_division` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `edificio_asignado` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `jefe_division` int(9) NOT NULL,
  PRIMARY KEY (`iddivision`),
  KEY `fk_division_profesor1_idx` (`jefe_division`),
  CONSTRAINT `fk_division_profesor1` FOREIGN KEY (`jefe_division`) REFERENCES `profesor` (`idperfil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
--  Table structure for `editorial`
-- ----------------------------
DROP TABLE IF EXISTS `editorial`;
CREATE TABLE `editorial` (
  `ideditorial` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`ideditorial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
--  Table structure for `grupo`
-- ----------------------------
DROP TABLE IF EXISTS `grupo`;
CREATE TABLE `grupo` (
  `idgrupo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `salon_asignado` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `division` int(9) NOT NULL,
  PRIMARY KEY (`idgrupo`),
  KEY `fk_grupo_divisiones1_idx` (`division`),
  CONSTRAINT `fk_grupo_divisiones1` FOREIGN KEY (`division`) REFERENCES `division` (`iddivision`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
--  Table structure for `horario`
-- ----------------------------
DROP TABLE IF EXISTS `horario`;
CREATE TABLE `horario` (
  `idhorario` int(11) NOT NULL AUTO_INCREMENT,
  `iddia` int(11) NOT NULL,
  `idmateria` int(11) NOT NULL,
  `idmodulo` int(11) NOT NULL,
  `id_profesor` int(9) NOT NULL,
  PRIMARY KEY (`idhorario`),
  KEY `fk_dia_has_materia_materia1_idx` (`idmateria`),
  KEY `fk_dia_has_materia_dia1_idx` (`iddia`),
  KEY `fk_dia_has_materia_modulo1_idx` (`idmodulo`),
  KEY `fk_horario_profesor1_idx` (`id_profesor`),
  CONSTRAINT `fk_dia_has_materia_dia1` FOREIGN KEY (`iddia`) REFERENCES `dia` (`iddia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dia_has_materia_materia1` FOREIGN KEY (`idmateria`) REFERENCES `materia` (`idmateria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dia_has_materia_modulo1` FOREIGN KEY (`idmodulo`) REFERENCES `modulo` (`idmodulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_horario_profesor1` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`idperfil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
--  Table structure for `libro`
-- ----------------------------
DROP TABLE IF EXISTS `libro`;
CREATE TABLE `libro` (
  `idlibro` bigint(20) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `subtitulo` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `edicion` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `paginas` int(11) NOT NULL,
  `isbn` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `ejemplar` varchar(4) COLLATE utf8_spanish2_ci NOT NULL,
  `ideditorial` bigint(20) NOT NULL,
  `idautor` bigint(20) NOT NULL,
  PRIMARY KEY (`idlibro`),
  KEY `id_editorial` (`ideditorial`),
  KEY `id_autor` (`idautor`),
  CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`idautor`) REFERENCES `autor` (`idautor`),
  CONSTRAINT `libro_ibfk_2` FOREIGN KEY (`ideditorial`) REFERENCES `editorial` (`ideditorial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
--  Table structure for `materia`
-- ----------------------------
DROP TABLE IF EXISTS `materia`;
CREATE TABLE `materia` (
  `idmateria` int(11) NOT NULL AUTO_INCREMENT,
  `id_carrera` int(9) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idmateria`),
  KEY `fk_materia_carrera1_idx` (`id_carrera`),
  CONSTRAINT `fk_materia_carrera1` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`idcarrera`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
--  Table structure for `modulo`
-- ----------------------------
DROP TABLE IF EXISTS `modulo`;
CREATE TABLE `modulo` (
  `idmodulo` int(11) NOT NULL AUTO_INCREMENT,
  `hora_inicio` date DEFAULT NULL,
  `hora_fin` date DEFAULT NULL,
  PRIMARY KEY (`idmodulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
--  Table structure for `parcial`
-- ----------------------------
DROP TABLE IF EXISTS `parcial`;
CREATE TABLE `parcial` (
  `idparcial` int(11) NOT NULL AUTO_INCREMENT,
  `materia_idmateria` int(11) NOT NULL,
  PRIMARY KEY (`idparcial`),
  KEY `fk_parcial_materia1_idx` (`materia_idmateria`),
  CONSTRAINT `fk_parcial_materia1` FOREIGN KEY (`materia_idmateria`) REFERENCES `materia` (`idmateria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
--  Table structure for `perfil`
-- ----------------------------
DROP TABLE IF EXISTS `perfil`;
CREATE TABLE `perfil` (
  `idperfil` int(9) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `fech_nac` date NOT NULL,
  `correo` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `domicilio` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` double(15,0) NOT NULL,
  `fech_ingreso` date NOT NULL,
  `tipo` int(11) NOT NULL,
  PRIMARY KEY (`idperfil`),
  KEY `fk_perfil_tipo_perfil1_idx` (`tipo`),
  CONSTRAINT `fk_perfil_tipo_perfil1` FOREIGN KEY (`tipo`) REFERENCES `tipo_perfil` (`idtipo_perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
--  Records of `perfil`
-- ----------------------------
BEGIN;
INSERT INTO `perfil` VALUES ('1', 'Invitado', 'Invitado', '2015-08-17', 'invitado@correo.com', 'invitado casa', '9982049830', '2015-08-17', '1'), ('2', 'administrador', 'administrador', '2015-08-17', 'administrador@correo.com', 'administrador casa', '9982049830', '2015-08-17', '3');
COMMIT;

-- ----------------------------
--  Table structure for `prestamo`
-- ----------------------------
DROP TABLE IF EXISTS `prestamo`;
CREATE TABLE `prestamo` (
  `idprestamo` bigint(20) NOT NULL,
  `idperfil` int(9) NOT NULL,
  `fecha_prestamo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_devolucion` date NOT NULL,
  `dias` int(11) NOT NULL,
  `idlibro` bigint(20) NOT NULL,
  PRIMARY KEY (`idprestamo`),
  KEY `fk_prestamo_perfiles1_idx` (`idperfil`),
  KEY `fk_prestamo_libro1_idx` (`idlibro`),
  CONSTRAINT `fk_prestamo_libro1` FOREIGN KEY (`idlibro`) REFERENCES `libro` (`idlibro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_prestamo_perfiles1` FOREIGN KEY (`idperfil`) REFERENCES `perfil` (`idperfil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
--  Table structure for `profesor`
-- ----------------------------
DROP TABLE IF EXISTS `profesor`;
CREATE TABLE `profesor` (
  `idperfil` int(9) NOT NULL,
  `id_division` int(9) NOT NULL,
  PRIMARY KEY (`idperfil`),
  UNIQUE KEY `idperfil_UNIQUE` (`idperfil`),
  KEY `fk_profesor_divisiones1_idx` (`id_division`),
  KEY `fk_profesor_perfil1_idx` (`idperfil`),
  CONSTRAINT `fk_profesor_divisiones1` FOREIGN KEY (`id_division`) REFERENCES `division` (`iddivision`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_profesor_perfil1` FOREIGN KEY (`idperfil`) REFERENCES `perfil` (`idperfil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
--  Table structure for `puesto`
-- ----------------------------
DROP TABLE IF EXISTS `puesto`;
CREATE TABLE `puesto` (
  `idpuesto` int(9) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `sueldo_base` double NOT NULL,
  `iddepartamento` int(9) NOT NULL,
  PRIMARY KEY (`idpuesto`),
  KEY `fk_puestos_departamentos1_idx` (`iddepartamento`),
  CONSTRAINT `fk_puestos_departamentos1` FOREIGN KEY (`iddepartamento`) REFERENCES `departamento` (`iddepartamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
--  Table structure for `system_module`
-- ----------------------------
DROP TABLE IF EXISTS `system_module`;
CREATE TABLE `system_module` (
  `name` varchar(50) NOT NULL,
  `guest_access` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `system_module`
-- ----------------------------
BEGIN;
INSERT INTO `system_module` VALUES ('assistance', '0'), ('dashboard', '0'), ('grades', '0'), ('login', '1'), ('schedule', '0'), ('web_site', '1');
COMMIT;

-- ----------------------------
--  Table structure for `tipo_perfil`
-- ----------------------------
DROP TABLE IF EXISTS `tipo_perfil`;
CREATE TABLE `tipo_perfil` (
  `idtipo_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idtipo_perfil`),
  UNIQUE KEY `idtipo_perfil_UNIQUE` (`idtipo_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
--  Records of `tipo_perfil`
-- ----------------------------
BEGIN;
INSERT INTO `tipo_perfil` VALUES ('1', 'Invitado'), ('2', 'Cliente'), ('3', 'Administrador'), ('4', 'Maestro'), ('5', 'Encargado Division'), ('6', 'Alumno');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
