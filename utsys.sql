/*
Navicat MySQL Data Transfer

Source Server         : REMOTEUTSYS
Source Server Version : 50543
Source Host           : sql5.freesqldatabase.com:3306
Source Database       : sql587225

Target Server Type    : MYSQL
Target Server Version : 50543
File Encoding         : 65001

Date: 2015-08-17 15:51:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for alumno
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
-- Records of alumno
-- ----------------------------

-- ----------------------------
-- Table structure for asistencia_alumno
-- ----------------------------
DROP TABLE IF EXISTS `asistencia_alumno`;
CREATE TABLE `asistencia_alumno` (
  `idalumno` int(9) NOT NULL,
  `idhorario` int(11) NOT NULL,
  `idparcial` int(11) NOT NULL,
  `asistencia` tinyint(4) NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  PRIMARY KEY (`idalumno`,`idhorario`,`idparcial`),
  KEY `fk_horario_has_alumno_horario1_idx` (`idhorario`),
  KEY `fk_asistencia_parcial1_idx` (`idparcial`),
  KEY `fk_asistencia_alumno_alumno1_idx` (`idalumno`),
  CONSTRAINT `fk_asistencia_alumno_alumno1` FOREIGN KEY (`idalumno`) REFERENCES `alumno` (`idperfil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_asistencia_parcial1` FOREIGN KEY (`idparcial`) REFERENCES `parcial` (`idparcial`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_horario_has_alumno_horario1` FOREIGN KEY (`idhorario`) REFERENCES `horario` (`idhorario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
-- Records of asistencia_alumno
-- ----------------------------

-- ----------------------------
-- Table structure for autor
-- ----------------------------
DROP TABLE IF EXISTS `autor`;
CREATE TABLE `autor` (
  `idautor` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idautor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
-- Records of autor
-- ----------------------------

-- ----------------------------
-- Table structure for calificacion
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
-- Records of calificacion
-- ----------------------------

-- ----------------------------
-- Table structure for carrera
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
-- Records of carrera
-- ----------------------------
INSERT INTO `carrera` VALUES ('1', 'Sistemas', 'TSU', 'Matutino', '3');
INSERT INTO `carrera` VALUES ('2', 'Redes', 'TSU', 'Matutino', '3');

-- ----------------------------
-- Table structure for colaborador
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
-- Records of colaborador
-- ----------------------------

-- ----------------------------
-- Table structure for cuenta
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
-- Records of cuenta
-- ----------------------------
INSERT INTO `cuenta` VALUES ('admin', '21232f297a57a5a743894a0e4a801fc3', '2');

-- ----------------------------
-- Table structure for departamento
-- ----------------------------
DROP TABLE IF EXISTS `departamento`;
CREATE TABLE `departamento` (
  `iddepartamento` int(9) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `edificio_asignado` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`iddepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
-- Records of departamento
-- ----------------------------

-- ----------------------------
-- Table structure for dia
-- ----------------------------
DROP TABLE IF EXISTS `dia`;
CREATE TABLE `dia` (
  `iddia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`iddia`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
-- Records of dia
-- ----------------------------
INSERT INTO `dia` VALUES ('1', 'Lunes');
INSERT INTO `dia` VALUES ('2', 'Martes');
INSERT INTO `dia` VALUES ('3', 'Miercoles');
INSERT INTO `dia` VALUES ('4', 'Jueves');
INSERT INTO `dia` VALUES ('5', 'Viernes');
INSERT INTO `dia` VALUES ('6', 'Sabado');
INSERT INTO `dia` VALUES ('7', 'Domingo');

-- ----------------------------
-- Table structure for division
-- ----------------------------
DROP TABLE IF EXISTS `division`;
CREATE TABLE `division` (
  `iddivision` int(9) NOT NULL AUTO_INCREMENT,
  `nombre_division` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `edificio_asignado` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `jefe_division` int(9) NOT NULL,
  PRIMARY KEY (`iddivision`),
  KEY `fk_division_profesor1_idx` (`jefe_division`),
  CONSTRAINT `fk_division_profesor1` FOREIGN KEY (`jefe_division`) REFERENCES `perfil` (`idperfil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
-- Records of division
-- ----------------------------
INSERT INTO `division` VALUES ('3', 'Tecnologias', 'h127', '2');

-- ----------------------------
-- Table structure for editorial
-- ----------------------------
DROP TABLE IF EXISTS `editorial`;
CREATE TABLE `editorial` (
  `ideditorial` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`ideditorial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
-- Records of editorial
-- ----------------------------

-- ----------------------------
-- Table structure for grupo
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
-- Records of grupo
-- ----------------------------
INSERT INTO `grupo` VALUES ('1', 'SI12', 'h127', '3');
INSERT INTO `grupo` VALUES ('2', 'SI11', 'h128', '3');

-- ----------------------------
-- Table structure for horario
-- ----------------------------
DROP TABLE IF EXISTS `horario`;
CREATE TABLE `horario` (
  `idhorario` int(11) NOT NULL AUTO_INCREMENT,
  `iddia` int(11) NOT NULL,
  `idmateria` int(11) NOT NULL,
  `idmodulo` int(11) NOT NULL,
  `idprofesor` int(9) NOT NULL,
  `idgrupo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idhorario`),
  KEY `fk_dia_has_materia_materia1_idx` (`idmateria`),
  KEY `fk_dia_has_materia_dia1_idx` (`iddia`),
  KEY `fk_dia_has_materia_modulo1_idx` (`idmodulo`),
  KEY `fk_horario_profesor1_idx` (`idprofesor`),
  KEY `fk_grupo` (`idgrupo`),
  CONSTRAINT `fk_grupo` FOREIGN KEY (`idgrupo`) REFERENCES `grupo` (`idgrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dia_has_materia_dia1` FOREIGN KEY (`iddia`) REFERENCES `dia` (`iddia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dia_has_materia_materia1` FOREIGN KEY (`idmateria`) REFERENCES `materia` (`idmateria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dia_has_materia_modulo1` FOREIGN KEY (`idmodulo`) REFERENCES `modulo` (`idmodulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_horario_profesor1` FOREIGN KEY (`idprofesor`) REFERENCES `profesor` (`idperfil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
-- Records of horario
-- ----------------------------
INSERT INTO `horario` VALUES ('1', '1', '1', '2', '3', '1');
INSERT INTO `horario` VALUES ('2', '3', '1', '7', '3', '1');
INSERT INTO `horario` VALUES ('3', '1', '1', '9', '3', '1');
INSERT INTO `horario` VALUES ('4', '6', '1', '9', '3', '1');
INSERT INTO `horario` VALUES ('5', '1', '2', '11', '4', '1');
INSERT INTO `horario` VALUES ('6', '2', '4', '3', '5', '1');
INSERT INTO `horario` VALUES ('7', '5', '4', '3', '5', '1');
INSERT INTO `horario` VALUES ('11', '1', '4', '3', '5', '2');

-- ----------------------------
-- Table structure for libro
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
-- Records of libro
-- ----------------------------

-- ----------------------------
-- Table structure for materia
-- ----------------------------
DROP TABLE IF EXISTS `materia`;
CREATE TABLE `materia` (
  `idmateria` int(11) NOT NULL AUTO_INCREMENT,
  `id_carrera` int(9) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idmateria`),
  KEY `fk_materia_carrera1_idx` (`id_carrera`),
  CONSTRAINT `fk_materia_carrera1` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`idcarrera`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
-- Records of materia
-- ----------------------------
INSERT INTO `materia` VALUES ('1', '1', 'Programacion Orientada a Objetos');
INSERT INTO `materia` VALUES ('2', '1', 'Estrucutra de Datos');
INSERT INTO `materia` VALUES ('3', '2', 'Cableado Estructurado');
INSERT INTO `materia` VALUES ('4', '2', 'Bases de Redes');

-- ----------------------------
-- Table structure for modulo
-- ----------------------------
DROP TABLE IF EXISTS `modulo`;
CREATE TABLE `modulo` (
  `idmodulo` int(11) NOT NULL AUTO_INCREMENT,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  PRIMARY KEY (`idmodulo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
-- Records of modulo
-- ----------------------------
INSERT INTO `modulo` VALUES ('2', '01:00:00', '13:10:00');
INSERT INTO `modulo` VALUES ('3', '07:00:00', '07:50:00');
INSERT INTO `modulo` VALUES ('4', '01:00:00', '01:50:00');
INSERT INTO `modulo` VALUES ('5', '01:00:00', '01:00:00');
INSERT INTO `modulo` VALUES ('6', '21:50:00', '22:50:00');
INSERT INTO `modulo` VALUES ('7', '20:50:00', '21:40:00');
INSERT INTO `modulo` VALUES ('8', '01:00:00', '13:00:00');
INSERT INTO `modulo` VALUES ('9', '02:30:00', '03:00:00');
INSERT INTO `modulo` VALUES ('10', '17:10:00', '18:00:00');
INSERT INTO `modulo` VALUES ('11', '16:40:00', '17:30:00');

-- ----------------------------
-- Table structure for parcial
-- ----------------------------
DROP TABLE IF EXISTS `parcial`;
CREATE TABLE `parcial` (
  `idparcial` int(11) NOT NULL AUTO_INCREMENT,
  `materia_idmateria` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  PRIMARY KEY (`idparcial`),
  KEY `fk_parcial_materia1_idx` (`materia_idmateria`),
  CONSTRAINT `fk_parcial_materia1` FOREIGN KEY (`materia_idmateria`) REFERENCES `materia` (`idmateria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
-- Records of parcial
-- ----------------------------

-- ----------------------------
-- Table structure for perfil
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
-- Records of perfil
-- ----------------------------
INSERT INTO `perfil` VALUES ('1', 'Invitado', 'Invitado', '2015-08-17', 'invitado@correo.com', 'invitado casa', '9982049830', '2015-08-17', '1');
INSERT INTO `perfil` VALUES ('2', 'administrador', 'administrador', '2015-08-17', 'administrador@correo.com', 'administrador casa', '9982049830', '2015-08-17', '3');
INSERT INTO `perfil` VALUES ('3', 'maestro1', 'maestro1', '2015-08-17', 'maestro1@correo.com', 'maestro casa', '9982049830', '2015-08-17', '4');
INSERT INTO `perfil` VALUES ('4', 'maestro2', 'maestro2', '2015-08-17', 'maestro2@correo.com', 'maestro casa', '9982049830', '2015-08-17', '4');
INSERT INTO `perfil` VALUES ('5', 'maestro3', 'maestro3', '2015-08-17', 'maestro2@correo.com', 'maestro casa', '9982049830', '2015-08-17', '4');
INSERT INTO `perfil` VALUES ('6', 'maestro4', 'maestro4', '2015-08-17', 'maestro2@correo.com', 'maestro casa', '9982049830', '2015-08-17', '4');

-- ----------------------------
-- Table structure for prestamo
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
-- Records of prestamo
-- ----------------------------

-- ----------------------------
-- Table structure for profesor
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
-- Records of profesor
-- ----------------------------
INSERT INTO `profesor` VALUES ('3', '3');
INSERT INTO `profesor` VALUES ('4', '3');
INSERT INTO `profesor` VALUES ('5', '3');
INSERT INTO `profesor` VALUES ('6', '3');

-- ----------------------------
-- Table structure for puesto
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
-- Records of puesto
-- ----------------------------

-- ----------------------------
-- Table structure for system_module
-- ----------------------------
DROP TABLE IF EXISTS `system_module`;
CREATE TABLE `system_module` (
  `name` varchar(50) NOT NULL,
  `guest_access` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of system_module
-- ----------------------------
INSERT INTO `system_module` VALUES ('assistance', '0');
INSERT INTO `system_module` VALUES ('dashboard', '0');
INSERT INTO `system_module` VALUES ('grades', '0');
INSERT INTO `system_module` VALUES ('login', '1');
INSERT INTO `system_module` VALUES ('schedule', '0');
INSERT INTO `system_module` VALUES ('web_site', '1');

-- ----------------------------
-- Table structure for tipo_perfil
-- ----------------------------
DROP TABLE IF EXISTS `tipo_perfil`;
CREATE TABLE `tipo_perfil` (
  `idtipo_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idtipo_perfil`),
  UNIQUE KEY `idtipo_perfil_UNIQUE` (`idtipo_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
-- Records of tipo_perfil
-- ----------------------------
INSERT INTO `tipo_perfil` VALUES ('1', 'Invitado');
INSERT INTO `tipo_perfil` VALUES ('2', 'Cliente');
INSERT INTO `tipo_perfil` VALUES ('3', 'Administrador');
INSERT INTO `tipo_perfil` VALUES ('4', 'Maestro');
INSERT INTO `tipo_perfil` VALUES ('5', 'Encargado Division');
INSERT INTO `tipo_perfil` VALUES ('6', 'Alumno');
