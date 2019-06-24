/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.27 : Database - base
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`base` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `base`;

/*Table structure for table `lodger` */

DROP TABLE IF EXISTS `lodger`;

CREATE TABLE `lodger` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `lodgingInfoId` int(32) DEFAULT NULL,
  `certificate` varchar(1) DEFAULT NULL,
  `certificateNo` varchar(32) DEFAULT NULL,
  `lodgerName` varchar(32) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `isRegister` varchar(1) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `createDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `lodger` */

insert  into `lodger`(`id`,`lodgingInfoId`,`certificate`,`certificateNo`,`lodgerName`,`sex`,`isRegister`,`phone`,`note`,`createDate`) values (1,1,'1','111','老李','男','1','138',NULL,'2019-04-14 23:05:30');
insert  into `lodger`(`id`,`lodgingInfoId`,`certificate`,`certificateNo`,`lodgerName`,`sex`,`isRegister`,`phone`,`note`,`createDate`) values (2,1,'1','222','老A','女','0','',NULL,'2019-04-14 23:05:30');
insert  into `lodger`(`id`,`lodgingInfoId`,`certificate`,`certificateNo`,`lodgerName`,`sex`,`isRegister`,`phone`,`note`,`createDate`) values (3,2,'1','666','姓名','男','1','555',NULL,'2019-04-21 20:56:10');

/*Table structure for table `lodginginfo` */

DROP TABLE IF EXISTS `lodginginfo`;

CREATE TABLE `lodginginfo` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `entryDate` timestamp NULL DEFAULT NULL,
  `leaveDate` timestamp NULL DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `roomId` varchar(32) DEFAULT NULL,
  `deposit` int(11) DEFAULT NULL,
  `reservationId` varchar(32) DEFAULT NULL,
  `operatorId` int(32) DEFAULT NULL,
  `createDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `lodginginfo` */

insert  into `lodginginfo`(`id`,`entryDate`,`leaveDate`,`days`,`roomId`,`deposit`,`reservationId`,`operatorId`,`createDate`) values (1,'2019-04-02 00:00:00','2019-04-09 00:00:00',8,'302',500,NULL,5,'2019-04-14 23:05:30');
insert  into `lodginginfo`(`id`,`entryDate`,`leaveDate`,`days`,`roomId`,`deposit`,`reservationId`,`operatorId`,`createDate`) values (2,'2019-04-01 00:00:00','2019-04-04 00:00:00',4,'304',300,NULL,5,'2019-04-21 20:56:10');

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` int(32) NOT NULL DEFAULT '0',
  `menuName` varchar(32) DEFAULT NULL,
  `locked` int(1) DEFAULT NULL,
  `descript` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

insert  into `menu`(`id`,`menuName`,`locked`,`descript`) values (1,'用户管理',1,'管理员使用');
insert  into `menu`(`id`,`menuName`,`locked`,`descript`) values (2,'角色管理',1,'管理员使用');
insert  into `menu`(`id`,`menuName`,`locked`,`descript`) values (3,'权限管理',1,'管理员使用');
insert  into `menu`(`id`,`menuName`,`locked`,`descript`) values (4,'房间管理',0,'酒店经理使用');
insert  into `menu`(`id`,`menuName`,`locked`,`descript`) values (5,'房间类型管理',0,'酒店经理使用');
insert  into `menu`(`id`,`menuName`,`locked`,`descript`) values (6,'入住管理',0,'工作人员使用');
insert  into `menu`(`id`,`menuName`,`locked`,`descript`) values (7,'结帐管理',0,'工作人员使用');
insert  into `menu`(`id`,`menuName`,`locked`,`descript`) values (8,'房态信息查询',0,'工作人员使用');
insert  into `menu`(`id`,`menuName`,`locked`,`descript`) values (9,'营业数据报表',0,'工作人员使用');
insert  into `menu`(`id`,`menuName`,`locked`,`descript`) values (10,'会员信息管理',0,'工作人员使用');
insert  into `menu`(`id`,`menuName`,`locked`,`descript`) values (11,'客人信息查询',0,'工作人员使用');

/*Table structure for table `menuitem` */

DROP TABLE IF EXISTS `menuitem`;

CREATE TABLE `menuitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemName` varchar(64) DEFAULT NULL,
  `menuId` int(11) DEFAULT NULL,
  `urlLink` varchar(64) DEFAULT NULL,
  `visible` int(1) DEFAULT NULL,
  `descript` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_p5xv3w5bwa2utsggbf02cy8a3` (`menuId`),
  CONSTRAINT `FK_p5xv3w5bwa2utsggbf02cy8a3` FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

/*Data for the table `menuitem` */

insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (1,'用户列表',1,'/Admin/viewUserList',1,'用户管理(1)');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (2,'新增用户',1,'/Admin/viewAddUser',1,'用户管理');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (3,'编辑用户',1,'/Admin/viewEditUser',0,'用户管理');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (4,'删除用户',1,'/Admin/delUser',0,'用户管理');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (5,'保存用户',1,'/Admin/saveUser',0,'用户管理');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (6,'角色列表',2,'/Admin/viewRoleList',1,'角色管理(2)');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (7,'新增角色',2,'/Admin/viewAddRole',1,'角色管理');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (8,'编辑角色',2,'/Admin/viewEditRole',0,'角色管理');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (9,'删除角色',2,'/Admin/delRole',0,'角色管理');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (10,'保存角色',2,'/Admin/saveRole',0,'角色管理');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (11,'用户列表',3,'/Admin/rolePermission',1,'权限管理');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (12,'菜单树',3,'/Admin/rolePermission',0,'权限管理');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (13,'添加功能到用户',3,'/Admin/rolePermission',0,'权限管理');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (14,'删除功能从用户',3,'/Admin/rolePermission',0,'权限管理');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (15,'待定功能',3,'/Admin/rolePermission',0,'权限管理');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (21,'房间列表',4,'/Room/viewRoomList',1,'房间管理(4)');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (22,'新增房间',4,'/Room/viewAddRoom',1,'房间管理');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (23,'编辑房间',4,'/Room/viewEditRoom',0,'房间管理');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (24,'删除房间',4,'/Room/delRoom',0,'房间管理');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (25,'保存房间',4,'/Room/saveRoom',0,'房间管理');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (26,'房间类型列表',5,'/RoomType/viewTypeList',1,'房间类型管理(5)');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (27,'新增房间类型',5,'/RoomType/viewAddType',1,NULL);
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (28,'编辑房间类型',5,'/RoomType/viewEditType',0,NULL);
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (29,'删除房间类型',5,'/RoomType/delType',0,NULL);
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (30,'保存房间类型',5,'/RoomType/saveType',0,NULL);
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (31,'登记入住',6,'/LodgingInfo/viewRegisterEntry',1,'入住管理(6) (视图)');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (32,'房间列表 json',6,'/LodgingInfo/viewRoomJson',0,NULL);
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (33,'登记入住(保存)',6,'/LodgingInfo/saveRegisterEntry',0,'');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (34,'预订入住',6,'/LodgingInfo/viewOrderEntry',1,NULL);
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (35,'已结帐宾客',7,'/未分配',1,'结帐管理(7)');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (36,'未结帐宾客',7,'/未分配',1,'结帐管理(7)');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (37,'快速结帐',7,'/未分配',1,'结帐管理(7)');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (38,'宾客结帐',7,'/未分配',0,'结帐管理(7)');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (39,'实时房态',8,'/LodgingInfo/viewStateList',1,'房态信息查询(8)');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (40,'房态设置',8,'/LodgingInfo/viewStateChange',1,'房态信息查询(8)');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (41,'维修记录',8,'/未分配',1,'房态信息查询(8)');
insert  into `menuitem`(`id`,`itemName`,`menuId`,`urlLink`,`visible`,`descript`) values (42,'房扫查询',8,'/未分配',1,'房态信息查询(8)');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `roleName` varchar(32) DEFAULT NULL,
  `descript` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`roleName`,`descript`) values ('*','系统管理员',NULL);
insert  into `role`(`id`,`roleName`,`descript`) values ('0','酒店经理',NULL);
insert  into `role`(`id`,`roleName`,`descript`) values ('1','酒店前台',NULL);

/*Table structure for table `roleitem` */

DROP TABLE IF EXISTS `roleitem`;

CREATE TABLE `roleitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` varchar(32) DEFAULT NULL,
  `itemId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

/*Data for the table `roleitem` */

insert  into `roleitem`(`id`,`roleId`,`itemId`) values (10,'*',1);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (11,'*',2);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (12,'*',3);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (13,'*',4);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (14,'*',5);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (15,'*',6);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (16,'*',7);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (17,'*',8);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (18,'*',9);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (19,'*',10);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (72,'*',11);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (73,'0',21);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (74,'0',22);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (75,'0',23);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (76,'0',24);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (77,'0',25);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (78,'0',26);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (79,'0',27);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (80,'0',28);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (81,'0',29);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (82,'0',30);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (83,'1',31);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (84,'1',32);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (85,'1',33);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (86,'1',34);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (87,'1',35);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (88,'1',36);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (89,'1',37);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (90,'1',38);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (91,'1',39);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (92,'1',40);
insert  into `roleitem`(`id`,`roleId`,`itemId`) values (93,'1',41);

/*Table structure for table `room` */

DROP TABLE IF EXISTS `room`;

CREATE TABLE `room` (
  `id` varchar(32) DEFAULT NULL,
  `typeId` int(32) DEFAULT NULL,
  `floor` int(11) DEFAULT NULL,
  `status` varchar(1) DEFAULT '1',
  `updateDate` timestamp NULL DEFAULT NULL,
  `createDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `room` */

insert  into `room`(`id`,`typeId`,`floor`,`status`,`updateDate`,`createDate`) values ('301',1,3,'1','2018-04-12 17:04:39','2018-04-12 17:04:39');
insert  into `room`(`id`,`typeId`,`floor`,`status`,`updateDate`,`createDate`) values ('302',2,3,'2','2018-04-12 17:04:39','2018-04-12 17:04:39');
insert  into `room`(`id`,`typeId`,`floor`,`status`,`updateDate`,`createDate`) values ('303',3,3,'4','2018-04-12 17:04:39','2018-04-12 17:04:39');
insert  into `room`(`id`,`typeId`,`floor`,`status`,`updateDate`,`createDate`) values ('401',1,4,'3','2018-04-12 17:26:49','2018-04-12 17:26:51');
insert  into `room`(`id`,`typeId`,`floor`,`status`,`updateDate`,`createDate`) values ('402',1,4,'2','2018-04-12 17:26:49','2018-04-12 17:26:49');
insert  into `room`(`id`,`typeId`,`floor`,`status`,`updateDate`,`createDate`) values ('403',2,4,'3','2018-04-12 17:26:49','2018-04-12 17:26:49');
insert  into `room`(`id`,`typeId`,`floor`,`status`,`updateDate`,`createDate`) values ('404',3,4,'4','2018-04-12 17:26:49','2018-04-12 17:26:49');
insert  into `room`(`id`,`typeId`,`floor`,`status`,`updateDate`,`createDate`) values ('501',3,5,'1','2018-04-12 17:26:49','2018-04-12 17:26:49');
insert  into `room`(`id`,`typeId`,`floor`,`status`,`updateDate`,`createDate`) values ('502',2,5,'4','2018-04-12 17:26:49','2018-04-12 17:26:49');
insert  into `room`(`id`,`typeId`,`floor`,`status`,`updateDate`,`createDate`) values ('503',1,5,'1','2018-04-12 17:26:49','2018-04-12 17:26:49');
insert  into `room`(`id`,`typeId`,`floor`,`status`,`updateDate`,`createDate`) values ('601',2,6,'4','2018-04-12 17:26:49','2018-04-12 17:26:49');
insert  into `room`(`id`,`typeId`,`floor`,`status`,`updateDate`,`createDate`) values ('602',1,6,'4','2018-04-12 17:26:49','2018-04-12 17:26:49');
insert  into `room`(`id`,`typeId`,`floor`,`status`,`updateDate`,`createDate`) values ('603',4,6,'2','2019-04-14 20:07:31','2019-04-14 20:07:31');
insert  into `room`(`id`,`typeId`,`floor`,`status`,`updateDate`,`createDate`) values ('604',4,6,'1','2019-04-21 20:48:59','2019-04-21 20:48:59');

/*Table structure for table `roomtype` */

DROP TABLE IF EXISTS `roomtype`;

CREATE TABLE `roomtype` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(32) DEFAULT NULL,
  `dayPrice` float DEFAULT NULL,
  `hourPrice` float DEFAULT NULL,
  `updateDate` timestamp NULL DEFAULT NULL,
  `createDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `roomtype` */

insert  into `roomtype`(`id`,`typeName`,`dayPrice`,`hourPrice`,`updateDate`,`createDate`) values (1,'标准单人房',75,55,'2019-04-14 21:31:14','2019-04-14 21:31:19');
insert  into `roomtype`(`id`,`typeName`,`dayPrice`,`hourPrice`,`updateDate`,`createDate`) values (2,'标准双人房',100,50,'2019-04-10 21:30:45','2019-04-10 21:30:50');
insert  into `roomtype`(`id`,`typeName`,`dayPrice`,`hourPrice`,`updateDate`,`createDate`) values (3,'豪华单人房',130,95,'2019-04-14 21:31:44','2019-04-14 21:31:47');
insert  into `roomtype`(`id`,`typeName`,`dayPrice`,`hourPrice`,`updateDate`,`createDate`) values (4,'豪华双人房',200,100,'2019-04-14 21:32:00','2019-04-14 21:32:02');
insert  into `roomtype`(`id`,`typeName`,`dayPrice`,`hourPrice`,`updateDate`,`createDate`) values (7,'三人房',300,150,'2019-04-14 21:52:26','2019-04-14 21:52:26');
insert  into `roomtype`(`id`,`typeName`,`dayPrice`,`hourPrice`,`updateDate`,`createDate`) values (8,'高级三人房',450,200,'2019-04-14 21:52:46','2019-04-14 21:52:46');

/*Table structure for table `statust` */

DROP TABLE IF EXISTS `statust`;

CREATE TABLE `statust` (
  `stauts` varchar(1) DEFAULT NULL,
  `roomStatus` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `statust` */

insert  into `statust`(`stauts`,`roomStatus`) values ('1','空闲中');
insert  into `statust`(`stauts`,`roomStatus`) values ('2','打扫中');
insert  into `statust`(`stauts`,`roomStatus`) values ('3','维修中');
insert  into `statust`(`stauts`,`roomStatus`) values ('4','居住中');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `pass` varchar(32) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `roleId` varchar(32) DEFAULT NULL,
  `createDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_8111hsla4s12bcrtnju1bc9d2` (`roleId`),
  CONSTRAINT `FK_8111hsla4s12bcrtnju1bc9d2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`account`,`name`,`pass`,`sex`,`roleId`,`createDate`) values (1,'andy','安迪','123','男','*','2018-08-10 23:23:55');
insert  into `user`(`id`,`account`,`name`,`pass`,`sex`,`roleId`,`createDate`) values (2,'candy','肯迪','234','男','0','2018-08-08 23:24:20');
insert  into `user`(`id`,`account`,`name`,`pass`,`sex`,`roleId`,`createDate`) values (3,'luby','路比','234','男','0','2018-08-08 23:24:20');
insert  into `user`(`id`,`account`,`name`,`pass`,`sex`,`roleId`,`createDate`) values (4,'dannie','丹妮','456','女','1','2018-08-08 23:24:20');
insert  into `user`(`id`,`account`,`name`,`pass`,`sex`,`roleId`,`createDate`) values (5,'lili','莉莉','456','女','1','2018-08-08 23:24:20');
insert  into `user`(`id`,`account`,`name`,`pass`,`sex`,`roleId`,`createDate`) values (6,'jerry','祖尼','456','女','1','2018-08-08 23:24:20');
insert  into `user`(`id`,`account`,`name`,`pass`,`sex`,`roleId`,`createDate`) values (7,'grace','古蕾丝','456','女','1','2018-08-08 23:24:20');
insert  into `user`(`id`,`account`,`name`,`pass`,`sex`,`roleId`,`createDate`) values (21,'aaa','444','555',NULL,'*','2019-04-14 18:27:01');

/*Table structure for table `view_menu` */

DROP TABLE IF EXISTS `view_menu`;

/*!50001 DROP VIEW IF EXISTS `view_menu` */;
/*!50001 DROP TABLE IF EXISTS `view_menu` */;

/*!50001 CREATE TABLE  `view_menu`(
 `roleId` varchar(32) ,
 `menuId` int(32) ,
 `menuName` varchar(32) ,
 `menuItemId` int(11) ,
 `itemName` varchar(64) ,
 `urlLink` varchar(64) ,
 `visible` int(1) 
)*/;

/*View structure for view view_menu */

/*!50001 DROP TABLE IF EXISTS `view_menu` */;
/*!50001 DROP VIEW IF EXISTS `view_menu` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_menu` AS select `ri`.`roleId` AS `roleId`,`mu`.`id` AS `menuId`,`mu`.`menuName` AS `menuName`,`mi`.`id` AS `menuItemId`,`mi`.`itemName` AS `itemName`,`mi`.`urlLink` AS `urlLink`,`mi`.`visible` AS `visible` from ((`roleitem` `ri` left join `menuitem` `mi` on((`ri`.`itemId` = `mi`.`id`))) left join `menu` `mu` on((`mu`.`id` = `mi`.`menuId`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
