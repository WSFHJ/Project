/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.27 : Database - shopping
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shopping` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `shopping`;

/*Table structure for table `buy` */

DROP TABLE IF EXISTS `buy`;

CREATE TABLE `buy` (
  `number` varchar(50) DEFAULT NULL,
  `CName` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `fullNumber` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `buy` */

/*Table structure for table `controller` */

DROP TABLE IF EXISTS `controller`;

CREATE TABLE `controller` (
  `user` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `power` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `controller` */

insert  into `controller`(`user`,`password`,`power`) values ('1234','1234','root');
insert  into `controller`(`user`,`password`,`power`) values ('333','333','root');
insert  into `controller`(`user`,`password`,`power`) values ('222','222','root');
insert  into `controller`(`user`,`password`,`power`) values ('root','root','root');
insert  into `controller`(`user`,`password`,`power`) values ('1111','3333','root');

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `number` varchar(50) NOT NULL,
  `CName` varchar(50) DEFAULT NULL,
  `supplier` varchar(50) DEFAULT NULL,
  `PArea` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `shelfFife` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `pack` varchar(50) DEFAULT NULL,
  `fullNumber` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`number`,`CName`,`supplier`,`PArea`,`unit`,`shelfFife`,`price`,`pack`,`fullNumber`) values ('1','可乐','可乐加工厂','可乐地区','一瓶装','550ml',6.5,'红',20);
insert  into `goods`(`number`,`CName`,`supplier`,`PArea`,`unit`,`shelfFife`,`price`,`pack`,`fullNumber`) values ('2','雪碧','雪碧加工厂','雪碧地区','一箱装','24瓶',50,'绿',0);
insert  into `goods`(`number`,`CName`,`supplier`,`PArea`,`unit`,`shelfFife`,`price`,`pack`,`fullNumber`) values ('3','橙汁','橙汁加工厂','橙汁地区','两瓶装','600ml',13.7,'青',25);
insert  into `goods`(`number`,`CName`,`supplier`,`PArea`,`unit`,`shelfFife`,`price`,`pack`,`fullNumber`) values ('4','薯片','薯片加工厂','薯片地区','两包装','208g',10.8,'黄',55);
insert  into `goods`(`number`,`CName`,`supplier`,`PArea`,`unit`,`shelfFife`,`price`,`pack`,`fullNumber`) values ('5','美年达','美年达工厂','美年达地区','1罐','550ml',6,'橙色',77);

/*Table structure for table `person` */

DROP TABLE IF EXISTS `person`;

CREATE TABLE `person` (
  `user` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `power` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `person` */

insert  into `person`(`user`,`password`,`power`) values ('1234','1234','root');
insert  into `person`(`user`,`password`,`power`) values ('1234','1234','user');
insert  into `person`(`user`,`password`,`power`) values ('333','333','user');
insert  into `person`(`user`,`password`,`power`) values ('333','333','root');
insert  into `person`(`user`,`password`,`power`) values ('222','222','user');
insert  into `person`(`user`,`password`,`power`) values ('222','222','root');
insert  into `person`(`user`,`password`,`power`) values ('root','root','user');
insert  into `person`(`user`,`password`,`power`) values ('root','root','root');
insert  into `person`(`user`,`password`,`power`) values ('1111','3333','root');
insert  into `person`(`user`,`password`,`power`) values ('123','456','user');

/*Table structure for table `salesman` */

DROP TABLE IF EXISTS `salesman`;

CREATE TABLE `salesman` (
  `user` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `power` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `salesman` */

insert  into `salesman`(`user`,`password`,`power`) values ('1234','1234','user');
insert  into `salesman`(`user`,`password`,`power`) values ('333','333','user');
insert  into `salesman`(`user`,`password`,`power`) values ('222','222','user');
insert  into `salesman`(`user`,`password`,`power`) values ('root','root','user');
insert  into `salesman`(`user`,`password`,`power`) values ('123','456','user');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
