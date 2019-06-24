/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.27 : Database - activitileavedb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`activitileavedb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `activitileavedb`;

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('2',1,'LeaveBillProcessTest.bpmn','1','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"LeaveBillProcessTest\" name=\"My process\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\"></startEvent>\n    <userTask id=\"usertask1\" name=\"Êèê‰∫§Áî≥ËØ∑\" activiti:assignee=\"${userId}\"></userTask>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"></sequenceFlow>\n    <userTask id=\"usertask2\" name=\"‰∏ªÁÆ°ÂÆ°Êâπ\">\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"com.shop.utils.CustomerLisnter\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"usertask2\"></sequenceFlow>\n    <userTask id=\"usertask3\" name=\"ÊÄªÁªèÁêÜÂÆ°Êâπ\">\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"com.shop.utils.CustomerLisnter\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow3\" sourceRef=\"usertask2\" targetRef=\"usertask3\"></sequenceFlow>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <sequenceFlow id=\"flow4\" sourceRef=\"usertask3\" targetRef=\"endevent1\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_LeaveBillProcessTest\">\n    <bpmndi:BPMNPlane bpmnElement=\"LeaveBillProcessTest\" id=\"BPMNPlane_LeaveBillProcessTest\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"250.0\" y=\"300.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"BPMNShape_usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"330.0\" y=\"290.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"BPMNShape_usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"480.0\" y=\"290.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"BPMNShape_usertask3\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"630.0\" y=\"290.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"780.0\" y=\"300.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"285.0\" y=\"317.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"330.0\" y=\"317.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"435.0\" y=\"317.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"480.0\" y=\"317.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"585.0\" y=\"317.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"630.0\" y=\"317.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"735.0\" y=\"317.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"780.0\" y=\"317.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('3',1,'LeaveBillProcessTest.png','1','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0E\0\0§\0\0\0qbÏ\0\0ÓIDATxúÌ›lúı}pãÆìëÜ¥nçˆO\\Ì,u÷Z)˘kq\'çx“F,≠o§ñPi§jMSkm\nL+Y4≠,öZîn%≥6—y™Ç,XVÀ∂@3~Û#≠§ÑhJ5#Å#qígﬂ¯‹„Ÿó;ﬂ„ªÁ„{ΩÙQdﬂ=˜‰ûÁ„Á˘ºÔŒwÓ…\0\0à¨ß”w\0\0Äñ»s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s\0\0±…s–EJ•“‰‰‰ËËË––PO∑J€ûˆ¿»»»ƒƒƒÏÏlß€“,”¡Ë‚v∞∞‰9Ë˚ˆÌKÁ–4HÓπÁûáˆÔÒË—sss›Yi€”ÿªwÔ÷≠[”>I•”ÕiàÍ‡ö©†,2y÷æÙwlllÛÊÕ«_9~nÓú™ÆìoúL%Ìú\'Nt∫QÀ“A\\√¢É≈\'œ¡\Zó…‡‡‡›{æqnÓ¨ZÆÓªˇæ\r6;v¨”ÌZÇÍ`7Të;Ç<k‹ÿÿÿ¸ yO’Øáˆ?∏i”ow∫]K–AÏí*lCêÁ`-€∑oﬂÊÕ◊Õù/©FÍã_˙≥;æ‹È¶}ÄÍ`WU;Ö<kV©TÍÔÔÂ’csÁﬂUç‘È3?Ωˆ⁄ﬂúôôÈtÎË†v[≠ÉÅ»s∞fMLLåççÕùßRü\Z˛˝?M†˙V]U;v¸’¯¯xß[∑@u∞´PDûÉ5kdddÔΩˇˆ˛ πnÛè≥ÏÂŸsŸ˜ŒfOüÕû8}~◊ΩÁ’∑;ó˝o){¨î|\'{ΩÏÔ>{Û∂œu¸¥ﬁëzÚ°¡¡¡N∑nÅÍ`V°:à<k÷¿¿¿ë#OÕù?SÆÙàˇtñùπòΩu>{Û\\ˆNñ˝Èüﬂ÷s≈/lºn‰’πÏ¯ŸÏ¯{Ÿ±Rˆ‚˘Ï[ﬂ}z˛ÈÅ3]XßœúÍÌÌÌtÎË†va™ÉÅ»s•RijjÍˆ€oO¨á~fxx8]299ÎsÃ˚˙˙ﬁ8ıÍ‹˘”ÂJ„·ùŸŸóÆ:Ò“øﬂ~‡?~ı◊~˝/Ó¯ ˘,{˚|ˆ÷\\ˆÊ\\ñ∂¡«üôü%ßª≥“∂w∂q:®É›Y≈È`#ÍLçâââ∂}®^§]´*êÈLè”1ôé√Ω{Ô}hˇ√Â∫Ô˛∂oømtt4ùù7n‹Â£ÃÁÁ¡€ïJﬂû9üùz7;waaÅOˇÓ´_ˇÚﬂ~ı¯kóŒ8s≥sÛ3Ê—\'ü^t€Æ™‚Ã‘¡Ó¨‚t∞æ45“º∏ÏØBÓﬁΩ;≈æUΩ31v¨™ÈÈÈÚ_LπÌ‹‹˘˙uëG∑n˝L:>8–È;~ÛÛ‡ˇ*uiñ\\»Næì˝‰t6óeÁŒû∏ÊöûûıÙÙ~˙è∂Vﬂâ√O-∫mWUqfâÍ`wVq:∏út˛OèÌ|kKY ´wóäæÀ`µÌ‹π3Ö≥áˆ?|Ÿ$W]O<yx”¶M€∂m[Ìá\\≠òüoU™¸Zœ©w≥◊ﬁŒ^/{‚»?˙—è~ËÁ~˛ ´?2˙«ò%è?yx—mª™ä3KtPª≥ä”¡ZÈú?66V˚‹ø¯•ÍWuRmﬂ~€ÊÕõ-922≤Jø∑S‹]´-ñ£££„„„M%πÍ˙⁄]w\r\r\rˆoŒœÉŸJ•oﬂΩòΩY∫Ù‹¿…˜≤˝èœ¸∆µü¯»/ˇ ’}ø¯ı˛÷{Yv˙lˆŒŸK7<xËÒE∑Ì™*Œ,—AÏŒ*NIg˚EOÀ›rÀ^<z¥Œò8˘∆©4)÷≠[W˝D›ÙÙtÓ˜≠†ªV[\nsÈ∞úúú\\qò´º¸ö÷SÃø9òNÁœˇ¥RÂSd\Z\'oÕe?=óΩˆˆ‹£œªˆ∑>˘©ﬂ˝Ω◊œf?)eØó≤Sg≥4M>ˆ¯¢€vUgñË†vgßÉ’“y>E±J,Æü‰•∫Ì€o´‹∂∑∑˜–°C˘ﬁΩ\"Ó2hÉ———÷√\\Âµ◊È\n¯¬Î¢y0Ù©Mœ|ˇÖ\'ûù94=Û»·ôGûz˛—gé˛Ácﬂ˚Ó≥/˝˜·ÁˇÁyÍáû~˛Ÿ~t◊?Ïπ·∆:~N7KtPª≥ä”¡äÚS\0ï@v«é+˜‹ÛÕî‰*œ“Â˚⁄N·v¥¡Œù;[yôµ∂ˆÓΩwdd§”õµÿ¸,y≥∫>ˇ˘œ’¸íÓ˛”ü^t√Æ™‚Ã‘¡Ó¨‚t∞btt¥“ùt¬oÂÒ___y=CCC9ﬁ√¬Ì2Xm”””ÉÉÉ9Üπr›|ÛÁvÔﬁ›Èç˚Ä˘YrJ5[≈ô%:®É›Y≈È`Ÿ‘‘T%Ã≠ÏôπÍ∫Ô˛*k€µkW^w≤Xª⁄ ÖπÙ)˜<w¸ïW◊ØÔ/‘´Æóf…Ö7T≥UúY¢É:ÿùUúñ•©Qé_√√√πÃã Ô“≠[∑.Ø©Q¨]´≠¸Òèπáπr›rÀr|∞’∫˘YrR5[≈ô%:®É›Y≈È`299YŒ^ΩΩΩÈq{.√‚Ì”g*ÔxΩı÷[sπü⁄e–CCCÕ~‘\\SO—•C¥”õ¯æ˘YÚ∫j∂ä3KtPª≥ä”¡l~jîÉWzƒû„º∏{œûÚj˚˙˙rπü⁄e∞⁄fgg”ë≥JaÆ\\6l»˝]Ë+6?K~¢ö≠‚Ã‘¡Ó¨‚t0Mç Ô∫Âı‰\\•÷ØÔ/Ø9óø6Tî]m011166∂™yÓé;∆««€πQìììÀ}˙›¸,9—b≠x%+∏·eo≤‰πlÊ¢Æ•6ª£j[Ò\r;’ƒ†\\n·f/œΩ⁄ﬂŸ‚t0Mç {Qsü7ﬂºfÁ\\¶Ü<GŸ∂m€Ó›ªW5œ=¥ˇ·|ﬂÇ^ﬂÛœ?_>\\u’U{˜Ó]tmÓyÆßF.c†©Â+À‘ﬁôº∆[;gI:ÿ‘^ró6æìõÌ‡äT÷jõ\n”+>6WpÏ¥π≥≈È`ö\ZÂk[[ÎíÛ¢ºÚç7∂æ!Ú]dxx¯æ˚X’<˜‚—£Î◊˜∑mãJ•“W\\Q>#|¯√˛¯«?^˝(s˛L˙„´z%ãVX˚m#ö∫I˝˚≥‹%≠oÚöÈ`≥Ì®˝∫ˆãV:æ‹\nÛmbË6∏[Í˜•Nß\Zin«;[ú¶©Qæj5fGöÂï˜˜Á05‰9∫»*}RIuΩ}˙Looo;7™˙œ&W^yÂM7›T~|˙ˆ¬Ö◊V\\ãŒ›µó¥∏˛Ú\nˇ∂˛›ÀÂ˛T÷º6:xŸﬁ‚Úç¨≠zô⁄ß⁄≈rŸ‰†\\ÚGzπÏÂˆXùˇ±ˆ&+XI{:[úV>©dïfGÂ?m}+‰9∫H:hsˇÖ÷%èœ ˚°:Ó¬ÖW[¨Íï,Z·rÎØΩº¡%\\É+oeì◊RﬂW≠ﬂ•FÓpeôûö≠º∂∑\'fó[∏ˆÚÂ÷ﬂSw7ˆTÌ˘fÔg#“ì_g{\n”¡J‘k¸Oµ6Uïı∑>‡‰9∫»¿¿¿sGé¥!œµs£Ææ˙Í ©gd^:ŒÃÃdœ\rº“bUØ§ˆdW˘À^æË¬À~[˘OÎúsŸ‰µ‘¡F∫”»µıõ“x;*÷64«Õåÿ¡¶éù⁄´ñ˚z…=ø‹Èlq:ò¶F˘ÚUöï?Á⁄˙V»stëU˝πrµ˘˜Á*Ô•O\'ùœ~ˆ≥Èﬂ……… µÛß—„-Vy%\rÆ™˛bµ◊603ö˚/r©vŒí6t∞ŸΩ◊x/jWXˇ€EV_õÔñÌ`É;y…Àó<∏ñÏÈí-®Ûˆw∂8¨<M∏\Z≥„‰ß +œÂ#Ë‰9∫»ÿÿÿ›{ˆ¨jû;¯»£6lh€Ω¸ÚÀÈ·›pˇ¯¯x:1U_;&˝Qãı≥£Â«¸7πÏ%K^^ˇ€E6xgV∂…kØÉçÔÆ{⁄J+?Qó]Wu∞©N≠`Ô5uÏt∂≥≈È`ö\ZÂÌ˙⁄]wÂ>/û;r§ºÚ¡¡¡÷7Dû£ãÏ⁄µ+ﬂ¯Æ≠î∑n˝L;7jjjjbbb…OjqF68KÍOé˙Ølf,wmƒ<∑™\\A„.,ü*öZx…[-∫∞ı©ﬂÖ\\r∑/ŸàF∫_ˇÿÏ`gã”¡ù;wñ7-ùÿsüwÏÿQ^˘ËËhÎ[!œ—E“·öÅ≠jû€ºyÛæ}˚:Ω°Êœ§/∑X’+©|›»öÀÀ‘_r—µıø≠ΩKÕòV∑∑ºÊN∑nA^[TóÆ`ôº:∏≤ˇ¥:∏\Z7¨Ω™ÒÖ€‹Ÿ‚tpff¶|nÈÎÎ{˚Ùô|Á≈¶Mõ +Oi≤ıªZî]Ì±™oâHG{:ÊÀÔr/ÇKg“ã«Z¨ÍïTæ~??5|€Â®oπu.ym.€[^Oß[∑ Ø-jj≠†\r~[˚Sî{Ô¢wpπ}“¯zÍ,Yib#ÕÌlgã”¡§øøøºãˆÓΩ7«yQ˘πd—ãº+S†]m∞™/π~ÂŒ;” ;ΩâÔõ?ìæ‘bUØ§Úu#k./S…E◊÷ˇ∂raeÕKÕ§V∑∑ºÊN∑nA^[Tó6∏Lùv‘çÄÀÆß˙\'§©≠5Ÿ¡⁄„•©√°Ÿ≈.ª∑;€Ÿ‚t0/oÚµ◊^õ„St◊oŸR^Ì»»H.˜≥@ª⁄†T*•[´Ò)tÈ8_øæˇƒâùﬁƒ˜Õü@ÿbUVR˛¢˙ﬂ:7©^`—∑ç¸_çﬂüfoﬁ‡›ËtÎ‰µEÕÓ·ÂG¯eVXˇ€⁄÷v3Ø⁄N∑nA„õ≥‹ëµ‰ûiº#+˛yËlgã”¡l˛\r∞ïOâÀÎØ~|‰—Jßßßsπü⁄e–ììì7‹x„ör.[ò%GW\\U3„hı™jf¸À◊_[ùˇ±©ª◊‘ õZsß[∑ Ø÷◊`\Zπ3óÌoıˇ∏h·õÆÉuéØw{#ùΩÏOEq:[úñÌ⁄µ´º	ΩΩΩ≠p…ãGèV‚∂m€Ú∫ì≈⁄e–◊oŸíÔoB<w‰H˘©¯NoŸÃü@_TÕVqfâÍ`wVq:X±q„∆rKQ¨ïøë∆D\ZïUÂ¯íN·v¥¡ÏÏÏÜ\rÚzcƒ…7N•„3·ùﬁ¨≈Êg…™Ÿ*Œ,—AÏŒ*N+é;÷◊◊W…a+˚sÆ«_yµÊz{{8ê„=,‹.ÉˆòôôIëÆı?…ó¬‹ı[∂‹wˇùﬁ†%ò%—gâÍ`wVq:X-≈Ø k«)ç5˚	√y¥Ú2k≤k◊Æ|Ô^w¥«ÙÙtz®îé±V^fM°∞òa.õü%/>Øö≠‚Ã‘¡Ó¨‚tpë©©© ≥t=ÛÔxMÁˇFûñª·∆´U1˜0ó…stπŸŸŸMõ6mﬂ~€…7N5˚;_πÛŒÚã∂ùﬁàeÕœí®f´8≥Du∞;´8¨533300PŒR™KC§ˆxRå˚⁄]wmﬁºπz·Û}ôµ¢∏ª⁄£T*•CÒökR>k≥ÖÓﬁ≥\'-À-_H)∞”wøû˘Y2£ö≠‚Ã‘¡Ó¨‚tpI≥≥≥∑ﬂ~{oooœR“„¸ÂÆ\Z]Ωœ¥*Ù.É∂I«ÿ≠∑ﬁö9]øeKäkµøÎö.πÁûoﬁp„çiô≠[?≥‰_˙+ö˘YÚ}’lgñË†vgßÉu§©166∂dn´544tË–°UΩ?v¥M©TöööJáhÂ-H’œ®ß0799ôÀfièÙÒ›wü∫xÒ{™©*Œ,—AÏŒ*N/+Mç4“‘\\45˙˚˚GFFvÔﬁ›ûœô≥ÀÄf•≥…K/}Á‚≈#™©*Œ,—AÏŒ*N±À`Õ\Z˛˜}ª/fœ©∆Î˚3ﬂËtÎË†va™ÉÅ»s∞fÌ‹πs|¸¶éüùc’?M‹166÷È÷-–AÏ¬*TëÁ`Õ:vÏÿ¿¿«ﬁ-=q1{V5X##ø355’È÷-–AÏ¬*TëÁ`-ª˝ím≥gT#ıØì3::‹È¶}ÄÍ`WU;Ö<kY©T\Z\Z˙‰°CˇíeO´˙u‚ƒ˛ÅÅèÕŒÏt”>@u∞{™òåBûÉ5nfffpöôô©,õVÀU\Z$iË8çN∑k	:®É›PEÓ`Ú¨}áJ„dÁŒ?…≤ßTmMM›90–‡¿?v∫QÀ“A\\€U¸ü<]°T*çèè\r\r}bb‚/Oúx0À´ŸŸˇöú¸Î——Õ##CÈÎN∑Ë2tP◊^≈Í`¡…s–E806ˆÎ÷˝RÉ£fmÎÎªjtÙ∫4N:›ñ&Ë`5å.bKû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àMû\0àÌˇﬂËE?Ü\0\0\0\0IENDÆB`Ç',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('602',1,'baoxiaoprocess.bpmn','601','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"baoxiao\" name=\"baoxiaoProcess\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\"></startEvent>\n    <userTask id=\"usertask1\" name=\"ÂëòÂ∑•Áî≥ËØ∑Êä•ÈîÄ\" activiti:assignee=\"${inputUser}\"></userTask>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"></sequenceFlow>\n    <userTask id=\"usertask2\" name=\"ÈÉ®Èó®ÁªèÁêÜÂÆ°Êâπ\">\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"com.web.oa.utils.ManagerTaskHandler\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"usertask2\"></sequenceFlow>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <sequenceFlow id=\"flow3\" name=\"‰∏çÂêåÊÑè\" sourceRef=\"usertask2\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${message==\'‰∏çÂêåÊÑè\'}]]></conditionExpression>\n    </sequenceFlow>\n    <userTask id=\"usertask3\" name=\"Ë¥¢Âä°ÂÆ°Ê†∏\" activiti:assignee=\"li\"></userTask>\n    <sequenceFlow id=\"flow4\" name=\"ÈáëÈ¢ùÂ∞è‰∫éÁ≠â‰∫é5000\" sourceRef=\"usertask2\" targetRef=\"usertask3\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${message==\'ÈáëÈ¢ùÂ∞è‰∫éÁ≠â‰∫é5000\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow5\" sourceRef=\"usertask3\" targetRef=\"endevent1\"></sequenceFlow>\n    <userTask id=\"usertask4\" name=\"ÊÄªÁªèÁêÜÂÆ°Êâπ\">\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"com.web.oa.utils.ManagerTaskHandler\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow6\" name=\"ÈáëÈ¢ùÂ§ß‰∫é5000\" sourceRef=\"usertask2\" targetRef=\"usertask4\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${message==\'ÈáëÈ¢ùÂ§ß‰∫é5000\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow7\" name=\"‰∏çÂêåÊÑè\" sourceRef=\"usertask4\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${message==\'‰∏çÂêåÊÑè\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow8\" name=\"ÂêåÊÑè\" sourceRef=\"usertask4\" targetRef=\"usertask3\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${message==\'ÂêåÊÑè\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow9\" name=\"È©≥Âõû\" sourceRef=\"usertask2\" targetRef=\"usertask1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${message==\'È©≥Âõû\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow10\" name=\"È©≥Âõû\" sourceRef=\"usertask4\" targetRef=\"usertask1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${message==\'È©≥Âõû\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_baoxiao\">\n    <bpmndi:BPMNPlane bpmnElement=\"baoxiao\" id=\"BPMNPlane_baoxiao\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"360.0\" y=\"50.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"BPMNShape_usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"325.0\" y=\"150.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"BPMNShape_usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"325.0\" y=\"260.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"360.0\" y=\"380.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"BPMNShape_usertask3\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"160.0\" y=\"370.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask4\" id=\"BPMNShape_usertask4\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"510.0\" y=\"370.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"377.0\" y=\"85.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"377.0\" y=\"150.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"377.0\" y=\"205.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"377.0\" y=\"260.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"377.0\" y=\"315.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"377.0\" y=\"380.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"36.0\" x=\"377.0\" y=\"328.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"377.0\" y=\"315.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"212.0\" y=\"370.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"96.0\" x=\"252.0\" y=\"329.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"265.0\" y=\"397.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"360.0\" y=\"397.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"377.0\" y=\"315.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"562.0\" y=\"370.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"72.0\" x=\"429.0\" y=\"329.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"510.0\" y=\"397.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"395.0\" y=\"397.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"36.0\" x=\"421.0\" y=\"380.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"562.0\" y=\"425.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"562.0\" y=\"473.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"378.0\" y=\"473.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"212.0\" y=\"473.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"212.0\" y=\"425.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"377.0\" y=\"459.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow9\" id=\"BPMNEdge_flow9\">\n        <omgdi:waypoint x=\"325.0\" y=\"287.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"268.0\" y=\"284.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"268.0\" y=\"177.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"325.0\" y=\"177.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"278.0\" y=\"221.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow10\" id=\"BPMNEdge_flow10\">\n        <omgdi:waypoint x=\"562.0\" y=\"370.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"562.0\" y=\"177.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"430.0\" y=\"177.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"530.0\" y=\"246.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('603',1,'baoxiaoprocess.png','601','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0ﬂ\0\0\0ä»3s\0\09VIDATxúÌ›åı}¯ˇ¡xM±X⁄±7Èß_VI∞W%äO˘#^≈ﬁJmX©o—WŒJ(`DK¸©Pr¥Ç´\Z‹SïGõ\"ß%Ù‘äv´Ë`•\0Ÿõnâ!W€ÿg√bÏ∞ƒò,√∫>€„˚·õœ{w`<ûùù∑≥˚ûùy>Ù÷iovfˆ=Û~Õk^;≥{7†\0\0@Udw\0\0\0 ®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0\0\0\Z®ä\0tÖ¢(≈bqdd$õÕ¶?í…dƒîB°PØ◊ew\0Ã®ä\0¯LC¢˙â≈b¢5–ƒƒ;v>ßµßû~ÊÅÃÂrÒx|hhh||\\vg‡\"™\"\0æôööJß”¢’œÏ‹º}€ı¬ãõ75ïJïÀeŸÄ™\"\0˛%Œéùœ9÷C∆∂˜•}Î÷≠€≤eã¢(≤∑\0@‘QËî(hrπ‹∞ßz»ÿ˛·ëG“Èt≠VìΩ)\0\"ç™@GDI444T(]È7‘ƒz™’™Ï\r]TE\0:íÀÂ:/âÙªi¢0‚V\Z\0Y®ä\0,ﬁËËh\'7ŒZ€ƒƒŸlVˆfà(™\"\0ã455ïJ•|,â¥vÁùwmﬂæ]ˆ∆à\"™\"\0ã$J¢Ω/ÌÛΩ*:ˆ÷ÒU´‹G–{TE\0£X,f≥YﬂK\"≠›{Ô◊«∆∆do\"Ä»°*∞Èt⁄Îü&ÚtπhppPˆ&à™\"\0û’Îıx<ﬁ•íHkk◊ÆùúúîΩ°\0¢Ö™Äg„„„˘|æ´U—C€∂\rÀﬁP\0—BU¿≥-[∂lﬂæΩ´U—éùœ•”iŸ\n Z®ä\0xñ…d‹¸ˇ◊N⁄ë£GW≠J»ﬁP\0—BU¿≥.}\'ﬂÿNOüâ≈b≤7@¥Plppÿ[«ªZâ60@Ç–S$\0û%ì…_:DU dH:\0<ÎÍ+‚sE\0d°*‡Y>üˇ·cèuµ*⁄ı¬ãk◊ÆïΩ°\0¢Ö™Ägccc˜ﬁ˚ıÆVE¢Í⁄º˘´≤7@¥P¨Z≠&âÆVE7n,ïJ≤7@¥PXåÆ~‡˙ÙÙôx<Æ(äÏ≠-TE\0£´7—æÛ›ÔäïÀﬁD\0ëCU`1EI$›¯´Eßßœ¨Zï®’j≤7@‰PX§B°p€¶M\\(\ZTE\0Ô+∑‹21ÒÑè%—/Z≥fÕÈÈ3≤∑@QXºzΩævÌZø>v}‚Ωì¢$:rÙ®ÏÕQTE\0:R©TDa$JôŒK¢Ø‹rÀSO?#{É\0DUÄNMMM≠Y≥f◊/vr„LîVîD\0‰¢*‡ÉzΩæn›∫xƒ{\'=’Cßßœ|Áªﬂ’n√…ﬁ\0QGU¿ä¢à™ËÜí¢ µéõíËáè=&Êø˜ﬁØãZJv˜Ä™ÄØjµ⁄÷≠[„Ò¯WnπE={_⁄g™Ñƒî«ˇ∑€6mÛlﬁ¸’jµ*ªÀ\0!™\"\0˛S•X,ÊÛ˘5k÷\\JL%Q°P®◊Î≤ª	\0ó†*–¢Bí›\0p@U†»6\0Çé<†®ä\0y\n@/P>ÚÄ^†*|‰)\0Ω@U ¯»S\0zÅ™@ëß\0ÙUÄ‡#OË™\"\0¡Gû–TE\0Çè<†®ä\0y\n@/P>ÚÄ^†*|‰)\0Ω@U ¯»S\0zÅ™@ëß\0ÙUÄ‡#OË™\"\0¡Gû–TE\0Çè<†®ä\0y\n@/P>ÚÄ^†*|‰)\0Ω@U ¯»S\0zÅ™@ëß\0ÙUÄ‡#OË™\"\0¡Gû–TE\0Çè<†®ä\0y\n@/P>ÚÄ^†*|‰)\0Ω@U ¯»S\0zÅ™@ëß\0ÙUÄ‡#OË™\"\0¡Gû–TE\0Çè<†®ä\0y\n@/P>ÚÄ^†*|‰)\0Ω@U ¯»S\0zÅ™@ëß\0ÙUÄ‡#OË™\"\0¡Gû–TE\0Çè<†®ä\0y\n@/P>ÚÄ^†*|‰)\0Ω@U ¯»S\0zÅ™@ëß\0ÙUÄ‡#OË™\"\0¡Gû–TE\0Çè<†®ä\0y\n@/P>ÚÄ^†*|‰)\0Ω@U ¯»S\0zÅ™@ëß\0ÙUÄ‡#OËñB° ä°X,ñJ•ƒÉ¡¡AÒÛ +Ø¨T*≤ª\0®ä\0tÀìO>9–b˝˙ı≈bQv◊\0¿UÄnQeÈ“•∆íhıÍ’ÉÉÉız]v◊\0¿UÄ.∫ˇ˛˚/ø¸rΩ*∫˚Óªáááew\n\0¨QËÆ+Vh%—¶MõâÑ¢(≤{\0÷®ä\0t◊Ûœ?ød…Qe2>Q »®ä\0t›Õ7ﬂ¨UE≤;\0v®ä\0t]≠VU_»pTE\0zÅø‚ ¯»S@ò)äR(rπ\\:ùN$≠=(\"ƒ∂ã=êÕf«««˘ª\0\0⁄°*B´T*âj@îDè?˛¯éù;è=:;7Õ&∂]ÏÅâââÕõ7ã}\"j#ŸÉ à®äÄ™◊Î˘|~„∆ç«ﬁ:6;7K3∂Ôùµëÿ9µZMˆ@™\" lDIîJ•~¯ÿ£≥s3¥vÌ©ßüZªvmµZï=\\\0Ñ™õ|>ﬂ,âŒ”Ï€éùœÆ[˜EŸ√ @®äÄP)ïJ7nòõWhn⁄7æyﬂ∂mﬂí=h\0ÇÇ™EQâƒ[«´sÛÁhn⁄Ùô÷¨YÕR†°*¬c||<üœœÕü’€˙Ã∫¸Ó∫q©Hµm€˛öX@CUÑG6õùx‚?.ñD6˛ZUﬂº†æ>ßæ2£òQ˜Nœè=Ò‹Oèü⁄=´˛è¢ÓV‘]g’gœ´∑Î‡ù[Óí^†Hi/ÌõL•R≤á@ P·ëL&⁄?7Fk”™zfA=5Øæ?´ûU’?ˇã.ªjhCˆ¯úzlF=v^≠*ÍëyıG??–º\\t&Çm˙Ã…X,&{Ë\0UÒx¸Ωì«ÁÊßµ&\nù≥‘ôçßÊ\Z?¸Ã˛ŒÔ~ˆ/˙Œº™ûûWOÕ©Ôœ©uU}vœÀÕ™h:ömÄˇF†â\\\0ÑG≥≤9≠7ÒÎôyı‰9uˆ¬á3‘ÎıÔ}ˇﬂ˙ˆ˜èΩ›¯ÜsÍl≥ZzÒ•¶e#’®ä\0h»@x4+õˇ’[£*∫†û8´æ3≠Œ©ÍÏÃLÚÜ>60ªıO6‹ªoøiŸH5™\"\0\ZrÕ Êîﬁ¥;h\'œ©oüVﬂ=ØÓ=ÙÀ+V|ÏÚ+ñ]˝Ò‹ÌóTE{^⁄gZ6Rç™ÄÜ\\\0ÑG≥≤©ÎM¸znA}_i\\+:q^›πßr„öõ>˛€◊^øÊˇÚ£Û™:=£ûùi,∏krèiŸH5™\"\0\Zr‚Ï>?ˇÅﬁ¥ìΩ(åNÕ©Ã™oüû{Ò`uÕÔn˝óˇ‡›ıE}WQOŒ®¢.⁄µ{èiŸH5™\"\0\Zr¶ &Ω~›ÀØææ˜`er™Ú¬æ ˚ø¯Ú—ˇ⁄˝ œæÒ¸æ√?€˜⁄˚_õ<p¯‡Îøz‰ªm”m“´™\"\0rëÄhVEÔ€=˜‹ÂÊ[ˇÒ≠∑öåT£*†!\0·—¨äN“º6™\"\0\Zrç™Ë¬{4Øç™ÄÜ\\\0ÑG≥*:AÛ⁄®ä\0h»@x4´¢wi^U\0\rπ\0èfUÙÕk£*†!\0}¶P(T´UÀßöUQçÊµµ´älv5ÄP¢*˙…·√áµÔ“/_æ|bb¬Ù,Uë/UQΩ^ø˝ˆ€µ˝|›u◊Q—AUÙEQ.ªÏ2ÌÑΩd…íœ|Ê3∆sv≥*˙µ◊f˘å±„\n›Ll˜*éØÓ~UÓ;¨Ô√Ì€∑«b1m\'àÉÉÉµZM¬HêÅ™Ë3‚<m,_ñ-[v«wàjImVE.ºÌµµ.eöbÛÁ]Æ–8›qU˙„vÛËèçSÏ_⁄qàΩW©T>ı©O_nhh(ëH»p\0ΩCU,û®E ÂÚ»»H˙#‚$jSCÙ¿Ö«Ω6OÎi˜‘\"∫d≥*À¥_m&.nÛµ≈ÿ˘8\n0«Ö~åà„•T*’ÎuŸá/`Å™XQe≥ŸX,¶e˘ÚGzî´ØæZ?ŸdõD*ïä˙·µ¢∑∫⁄⁄ΩÑqzª«∆â&≠”[óµŸ∫7|†y≠Hå›óæÙ•O|‚zñ/_ûJ•∫=†Q ˆ≠~åà„%ì…ƒ„q∑≈bQv◊ÄKPﬁ‘j5Ì-ØîÑ.ﬁak\'Ïd2˘µØ}M¸,\n˙≥Õ‚‡òßfÛ˛æ›¸é”-∑Æ”qUñÀ\ZªÁæ€é;Aﬂá•Ri’™U◊_Ω∂∂•Kójw\'·;Ì≠Ö®;µö™\"¿q Öà»Ê≤:Êõo∆b1ÒV;ëHõnC4kÇ_yjÌYƒÙˆ’’%À∫úÕMZgXƒ–ñ2ÓFQçåå¨\\πRú∞≈œ©©©ﬁr¥à›+ˆ≥±∏$¢*‹*ãÈtZ˙Á!D7∆««-o’uXµ{ÏµZr|lZIÎØÌÍß÷ıÿTWãÆä4bã˝Ã-ûeh.ó{[vG\0™\"¿qéÔh•óDˆö5¡õûöqëvè€ÕÔu=˙c´RÊíÈ∆˘[’ÁiÌÃ\"ˆÄ∂îÏ°ã:Qâ∑ììì≤;Ç®#\0Æ\r\r?e7jÇÖ™ßf\\§›„vÛõ¶∑”∫¨i%Ì~’∂Œ`ÛrûvÇÏ°C„çG2ô‰S\\êã\\\08+ãŸlVv/ú5kÇ7◊¥e?*,f≥üÓ¯ÿ™î±XUÎ˚È6›s‹vŸCáÜ≠[∑éçç…Ó\"ç\\\08Àd2•RIv/ú5kÇ_zm’%vSåOπY°˝µæúÂØ∆ôçÛ¥[èÀÓYvLˆ–°°R©$ìIŸΩ@§ë\0µZmppPv/\\i÷G›∑è ã∂œÍÛÿﬁ ≥^–f∫q”Jåø∂>e≥«Õ±ﬂ≤áÍã[’1r‡†_nü©VEGh^UQpp\rrë\0}î¶õU—Î4Øç™(8˙ËMBâ\\\08Hß”ˇl£\'TETE˝éèA.r‡†è>Ë ŒÓái^UQpT´’D\"!ªà.r‡@‰Ë¸œW_4´¢◊h^UQ†0êà‡ƒ„ÒÄˇIk]≥*™–º6N√Å¬p@\"Çp–G9∫YΩJÛ⁄˙hà£Ä·ÄD‡†èrt,;wnˇ¬¬+4O≠èÜ8\nHD˙(G\'â7ﬁ¯È¬¬!öß÷GC$\"¯\0}î£3ôÃOJ€‘_–‹∑W+?Ê´‡Å“GG¬á‡ÙQéæCzù—_Ìü« ÁÛ≤áı—á!¯\0}î£´’j2˘…s ﬁı ÕeÀfo.ã≤áı—á!¯\0˝ï£G\Z∂,®/”‹¥/¸m.óë=h∏DqÇp–_9ZQît˙sììˇ™™hˆ≠V€ôL~≤^ﬂ%{–pâ˛:‚2‡†Ôrt•RI•n®Tä™:Ek◊DI$ «r˘QŸ√≥æ;‚&‡†sÙ‰‰§(åFGˇLU˜”Z[±¯›d2Q.ˇìÏÅÇÖ~<‚\Z‡†Os¥¢(√√˘t˙¶ÒÒø™’ûU’}¥z˝øÖø…Â6f≥iÒXˆ¡ZüqÇp–◊9∫\\.ÁÛ48¯[à«óÁrDa${X`g†üè8Ù;Çp@éˆ.qƒA\"Çp@éˆª.*êà‡ê£}¡nÑKÑ\n$\"¯\0‰h_∞·°â>¿9⁄ÏF∏D®@\"Çp@éˆª.*êà‡ê£}¡nÑKÑ\n$\"¯\0‰h_∞·°â>¿9⁄ÏF∏D®@\"Çp@éˆª.*êà‡ê£}¡nÑKÑ\n$\"¯\0‰h_∞·°â>¿9⁄ÏF∏D®@\"Çp@éˆª.*êà‡ê£}¡nÑKÑ\n$\"¯\0‰h_∞·°â>¿Åßmúô‰nƒﬁÄKÑ\n$\"¯\069z¿¿4øiäçÆv>8¢≥•Ë°â>¿Åõmö«˛WØ+áËl):D®@\"Çp`ü£-ØYNYƒ √$:[ä*êà‡x™ä,ã!„”ç≥Ëú\0¢≥•Ë°â>¿Å◊kE6k∞yz—ŸRtàPÅD‡¿±‚1^˛qºV‘ÓAËEgK—!B|Äó9⁄eUƒ4¿°â>¿Åcé∂¸hü∂6âŒñ¢CÑ\n$\"¯\0ˆ5ç˝Á¨›¨°„ˆáËl):D®@\"Çp‡Èö⁄ÊZëçnÙ9Ä¢≥•Ë°â>¿Åõ;hz%dˇπ¢E¨<4¢≥•Ë°â>¿9⁄ÏF∏D®@\"Çp@éˆª.*êà‡ê£}¡nÑKÑ\n$\"¯\0‰h_∞·°â>¿9⁄ÏF∏D®@\"Çp@éˆª.*êà‡ê£}¡nÑKÑ\n$\"¯\0‰h_∞·°â>¿9⁄ÏF∏D®@\"Çp@éˆª.*êà‡ê£}¡nÑKÑ\n$\"¯\0‰h_∞·°â>¿9⁄ÏF∏D®@\"Çp@éˆª1ƒåÉ€˘@*êà‡ê£}¡nç„Dµ•<≤aø˛Óu∞G»—æ`7ÜèiLÌu˘î„≥@W|Är¥/ÿçabye»räÕ‚ã{Ë*Çp@éˆª1LL5êe1d|`∫qFUÑ¿\"¯\0‰ËE+\nbÔ≈b±T*%äüW^ye•Rë›5t§ı PªyÏÿ/Ù¡8 G/⁄ìO>Ÿ˙1€ıÎ◊ãEŸ]CGLóØµ{–nÂæwpâ‡ê£MQî•Kó\Zœ†´WØ¨◊Î≤ª∏¨ä∏ÉÜ~A»—ù∏ˇ˛˚/ø¸r˝§x˜›wÀÓ|`˘—\">mç~G»—Z±bÖVm⁄¥)ëH(ä\"ªGËHª´>¶#Ö™˝à‡ê£;Ù¸Ûœ/Y≤DÏ∆L&√\'äB∆˛Zë\r7Îzè‡ê£;wÛÕ7kUëÏé¿7∆èZ€Æ»rY˚5˚‘G¿3Çp@éÓ\\≠Vªë/‰√\ré8HD»—æ`7¬%B|ÄÉæŒ—ä¢\nÖ\\.óNßâÑ˝G=BLlªÿŸlv||úøp˝|ƒ°ﬂ|ÄÉ˛Õ—•RIT¢$z¸Ò«wÏ‹y‰Ë—Ÿππh6±ÌbLLLlﬁºYÏQ…¥’øGBÄ‡ÙcéÆ◊Î˘|~„∆ç«ﬁ:6;7K3∂Ôùµëÿ9µZMˆ@¡B?q\rÇp–w9ZîD©TÍáè=:;7Ck◊ûz˙©µk◊V´UŸ√≥æ;‚&‡†Ôrt>üoñDÁiˆm«Œg◊≠˚¢Ï·ÇYﬂqÇp–_9∫T*m‹∏an^°πiﬂ¯Ê}€∂}Kˆ†·˝uƒ!d>¿AÂhEQâƒ[«´sÛÁhn⁄Ùô÷¨YÕR\nî>:‚>‡†èrÙ¯¯x>üüõ?´∑ıô?t˘›u„Rëj€∂˝5ˇ∞6P˙ËàC¯|ÄÉ> —Ÿlv‚âˇ∏Xmÿ¯kU}ÛÇ˙˙ú˙ åz`F›;=?ˆƒs?=~j˜¨˙?ä∫[QwùUü=Ø˛›ÆÉwnπKzÅ\"•Ω¥o2ïJ…:\\‘GG¬á‡ƒb±~˘7Ô…dÚ–°˝sÛg¥&Œ.”™zfA=5Øæ?´ûU’?ˇã.ªjhCˆ¯úzlF=v^≠*ÍëyıG??–º\\t&Çm˙ÃI1ƒ≤áQA\"ÇpêH$˙Â˚€Òx¸Ωì«ÁÊßµ&Œ.g/®3\ZOÕ/4~˛¯ôˇ¸ùﬂ˝Ï_>ÙùyU==ØûöSﬂüSÎ™˙ÏûóõU—t4ß·@a8 ¡8H•RSSS≤{·J≥≤9≠7ÒÎôyı‰9uˆ¬á3‘ÎıÔ}ˇﬂ˙ˆ˜èΩ›¯ÜsÍl≥ZzÒ•¶e#’8\r\n√â>¿A:ù.óÀ≤{·J≥≤˘_Ω5™¢Íâ≥Í;”Íú™ŒŒÃ$o∏a`‡c±[ˇd≥q¡Ω˚ˆõñçT„4($\"¯\0˘|æ_˛mV≥≤9•7Ì⁄…sÍ€ß’wœ´{˝r≈äª¸äeW<w˚%U—ûóˆôñçT„4($\"¯\0⁄◊›e˜¬ïfeS◊õ¯ı‹Ç˙æ“∏Vt‚º∫sOÂ∆57}¸∑ØΩ:~Õ˛ÂGÁUuzF=;”Xp◊‰”≤ëjúÜÖ·ÄD‡`jj™_æπ-N\'ÛÛËM;ªà¬Ë‘ú˙¡¨˙ˆÈπV◊¸˛Á÷˘ﬁùQﬂQ‘wı‰å*Í¢]ª˜òñçT„4($\"¯\0gÉÉÉ}Òˇ’MïMz˝∫ó_}}Ô¡ ‰TÂÖ}ïˆ~ÒÂ£ˇµ˚ïü|„˘}á∂Ôµˆø6y‡¡◊ı»?>v€¶€§W\'TEP©ä ¡8€∫u´Ï^8kVEÔ€=˜‹ÂÊ[ˇÒ≠∑öåT„4($\"¯\0gä¢ƒ„Ò‡ˇ-«fUtíÊµq\ZÜ|Ä+}ÒôÎFUt·=ö◊∆i8PHDnˇ+˙Õ™ËÕk„4($\"¯\0∑Íız:ùra‘¨äﬁ•ymúÜÖ·ÄD‡Å¢(˘|~Î÷≠¢Bí›Õ™Ëö◊∆i8PHDûççç%âëëë†}]øY’h^ß·@a8 ¡,FΩ^U—‡‡`*ï\Z-óÀ’jUvß®ä®ä¬Ä·ÄD–ë©©©···t:ùH$D6?”Ÿlv‰RÂK˘{\'ÆY˝zÕ~A˝YÀøu‰r%¶⁄¨«qÖ∆˛x}Èv+Ùq–!Ü|Äü™’™±Ë)ã¶™(}©x<n¨:,™ƒ\Z.\\x€S3ï&¶)∆Ÿ⁄-ﬁ˙∏uù∆â¶9ç,´%ÀUµ{∞∏∆i8PHD·—,éwÿÙï∏Yõ˝Ã¶â≠3õÿø¢„‚.˚lπfŸCáãHD·—¨	ﬁÚ‘åãhèı)≠⁄-n9gÎR∆Ÿ¨ÆŸıÕ8QüﬂSWÌwÇÏ°√E$\"¯Äh÷«º6m)}Y”Ø¶«Ìñ˝®R±^ßi=ˆ⁄ﬂ>≥XèÒŸ≈mæ∂†Ï°√E$\"¯Ähñørﬂ⁄◊ø2Æ fµñ≥µõÿ∫rõnõVÓi€M[!{Ëp√â> <:©ÏkéNfnWƒ¥ñb6Öö©*jW]QÖ\0√â> <ö≈¡õûZKÂÒ¶æí÷ñãõVbπŒvÎ±üb˘ÿ∏N7=tπd.b8 ¡ÑG£8X®zj∆E¥«˙î÷ˆã;>e\\°≈•†ˆOg⁄Có;Aˆ–·\"Ü|@x4ãÉ7<5„\"⁄cCb1è˝‚ˆKôfh7è˚«∆;v’~\'»:\\ƒp@\"ÇèfMKO≠ÂzÃ/[Wb≥Z}«•‹Ã„ÚY}zkü±¥•d.b8 ¡ÑG≥&8Í©—∑ÆƒrµÜB z˙•≈ñ√Ì^¢›ÎZvæ›z‹ÏŸCáãHD·—¨	é–º6N√Å¬p@\"ÇèfUÙ:Õk„4($\"¯Ä†*¢*\nÜ|@xà”…¬¬aö◊∆i8PHD·—¨ä^£ymúÜÖ·ÄDÕ™®BÛ⁄8\r\n√â> <öU—´4Øç”p†0êà‡¬#ãù;∑a·öß∆i8PHD·ëH$ﬁx„ßáhû\Zß·@a8 ¡ÑG&ì˘Ii˚Ç˙ö˚ˆjÂ«…dRˆ–·\"™\"HD·1:::<|áÙ:£ø⁄?è?îœÁe.¢*ÇD’j5ô¸‰9eÔÇzêÊ≤e≥7ãEŸCáã®ä ¡Ñ H√ñıeöõˆÔÖøÕÂ2≤\ró†*ÇD*ä¢§”üõú¸WU=@≥oµ⁄ŒdÚìı˙.ŸÉÜKPA\"ÇõJ•íJ›P©Uuä÷ÆâíHîèÂÚ£≤áfTEêà‡BhrrRF££¶™˚i≠≠X¸n2ô(óˇIˆ@¡U$\"¯ÄpRex8üNﬂ4>˛Wµ⁄≥™∫èVØˇw°7π‹∆l6-À\"X£*ÇDfÂr9üˇ£¡¡ﬂ\Z¿¿@<æ<ó€ \n#Ÿ√;TEêá‡¢¢R©H|ı@˝M —æçXTEêà‡\"att4ïJIÏ@†Nu’j5õÕf2πï\",*T5r‚ƒ?444<<¨(äƒnTW*ïD•(}œ¿$Ä°ÇË ¯Ä0”.MNN ÓH@Ou¢ª(ëHpC-8Ç*àÇßÄ\\\"“˘TW´’∏°AÑ¡ÑPp.ÈÇ™„ÜZ@?Tb*AªD§ÎãS7‘Ç†/BaE·¿KD∫>:’i7‘“È47‘§Ë£PA¯|@ˆëÆÔNuÂr9ôLä]ZØ◊e˜%Z˙.T&–˜Ç|âH◊ßß:±oEmT(dw$B˙4T–«ÇâH◊øß∫Z≠ñÀÂ∏°÷3˝*ÇËW}qâH◊Ôß:n®ıLøá\n˙\Z¡Ùü>∫D§«©éj=éPAü\"¯Ä>”_óàt°9’qC≠€B*ËG–7ƒ˘8ì…Ù◊%\"]»Nu⁄\rµ≠[∑rCÕw!ÙÇÚŸ\'A˝ŸÅKπ_œ@{Ìñm∑~«ıtœ¯¯∏8\róJ•ºV7ti/…=ÉéççâAC”Ωó¬——cTEêà‡ÉdZlÕÉÌr¥M∆tìL›úZ_}qØÂÌQ>üÔÎÀ6g_”¯v2OÔ∑Kåéö°°°©©)ﬂW>å££«“\rD¡ôúÆ÷ò“Ω}∫\\tﬁo˜*ã8«¸‰N˝<uÁO.ùÙ—ÔÓ¶|§ﬂ/È,OÌnfk˜îMÙﬁ‰‰d*ïÚ˜ÜZ@éµQΩ∏n\0=@A\Z«”§È≠∞„Uøﬁ\rw0œëáøÖáèßà3CsäxÊ√≥Éõ)\r·∏D§ÛTY^i˜îc`Ùåè7‘Çtt¯’nPA\"Çÿ§Ú÷™’[aÀ«≠,_⁄¶KÓœ≤÷”[O\0O(=r3%Dóàt≠\'u7≥µ{ ±hê•Ûj~6!Ì≠rÚ/™›Ôsæ\"¯ ü˝â–2˚€WE¶âæú\\≠ßÒˆ¯_–~◊ﬂ0Ó94:M˘ˇˇ-Tóàt¶—iG„lñª∑u\réC)ãè7‘:<:Ï◊”≥®ˆt±(PCâ®!¯ _ª$hìÒl+!7Î4Mt>7∏Î≥z‰àˆÆXºAv{∂0L˘øÈÅ¯\'BuâHg9öjÀû¥<Ø[VEÌ÷cccâDb˚ˆÌù¨§ì£√4≥„.ÍRTS°è|ê√±i=/z™äZµôÿÆáã~V’o∏æ◊Û∆ßàæ¯˘kØ›™KD:OÂ¨õ™»MÒ*]Ω^ﬂ≤eÀ––êßø∫È◊—aú¡r∫Âl6ºF5w––w>»gÛnÿx2p|OºË™»Ê$‘Ótk›g√õ‚ﬂUª˚\\jz‡ˇ¨¯T≤Ùÿ]^?ó⁄GL{≤›`È#€:\"`DI$\n#Q-‚Ü⁄¢èÀ5ÿÔ.£öO[£|ê¶ıçØ˝ô“rÀ˘›º®„Sã9æ√|Ò›±Ì7ñ?¸¢Ÿóˇ?Û<°„r˜∫ ”πø]¸ÕˆÌ€›ﬂPÛÒËË¥*Ú’mß∏qD∏|ê…Ê\rÆ⁄ÚnÿfN„≥n^—Õ≥ã;xæ/öŸË^Ud31h<›PÛÂË∞\\–˛•H7M$p¢œf|`S≤ò¥Q˜›Îp=6Bˆ∑à‹Ë§*2ÓsSò¬¶/N®ˆ7‘¸::cÿÚE˝ÿæN§à&ÇËµB°ùKD:Nu&ûn®E\n°â>†wÍız>üœÂr—πD§„T◊Jª°ñJ•<}C-ÙHD=R*ï∫˝ˇ’ÉåS];SSSCCC¢\\Æ’j≤˚Ñ\n$\"¯ÄÆ”.e2ô(üˆ8’Ÿ”>z?66&ª#Ú*êà‡∫+‚óàtúÍâÍyÎ÷≠‹P#T ¡tóàå8’πƒ\r5B|@Wpâ»ÑSù\'Qæ°F®@\"Çóà,q™ÛJø°V.óe˜•ßHD~‚Q;úÍgjj*ùNÁrπËŸÑ\n$\"¯\0pâ»ß∫Nh˘sttTvGzÅPÅD‡.9‚T◊!Qvã0˝\r5B|@G∏D‰ß:_T*ï–ﬂP#T ¡,óà‹„TÁ£pﬂP#T ¡,óàº‚TÁØﬂP#T ¡x699…%\"Ø8’uC(o®*êà‡<PEºA\Z\Z\n”I®78’uO°PH$£££\">e˜≈Ñ\n$\"¯\0∑&\'\'S©TX?Ã—múÍ∫J´◊E|ñJ%Ÿ}È°â>¿ô~â®R©»ÓKø‚T◊\">3ôL6õÌÎkôÑ\n$\"¯\0\\\"Úß∫û)ã}}CçPÅD–pﬂ}˜µ~zöKD>‚T◊K}}CçPÅD†ﬁsœ=\"/]∫‘¯ﬁöKD˛‚T◊{Ìn®˝˝ﬂˇΩx ´WéHD!ÍvÔﬁ=–t„ç7ãEïKD›¡©NÌÜ⁄»»àVÙ◊Îu1◊\\sçrŸ]≥F®@\"ÇQ∑rÂJ≠*˙çﬂ¯çœ~ˆ≥;vÏ‡Q7p™ìH‘C¢*J&ì•RÈ{ﬂ˚ûÒx\\TH≤ªfÅPÅD\"Ì·á∏‘≤eÀˆÏŸ#ª_!ƒ©N∫jµ˙˘œ˛≤À.”ﬂlÿ∞Avß,*êà‡Ctâ7 ±XÃT}·_»Âr≤ªBúÍ§ªÔæ˚L—~›u◊}˚€ﬂñ›/3B|àÆl6ªlŸ≤’´WˇﬁÔ˝ﬁ5◊\\ìL&âÑ®ì¯W›¿©N∫··a1\nÉÉÉ7‹p√™U´Æ∏‚\nˆ◊_˝‰‰§ÏÆ]ÇPÅD¢khhH‰ﬂ´Æ∫Í¶õn\Z)óÀ’jUvßBãS]@à °.˛÷[o˝Õﬂ¸M1.ü˛ÙßewÍÑ\n$\"¯Q|—¨«8’S©TJ&ì¢Hí›ëãHDEé®\nÖB.óKß”âDb ™ƒ∂ã=êÕf«««É˘Múê‡Tld\rô!‚»S—\"ﬁäc^$æ«|«ŒùGéùùõãf€.ˆ¿ƒƒƒÊÕõ≈>·≥D› Œ≤‚4ã≈R©‘@Û-‚ÁïW^…ıπ†!3ê†°*ä\nÒ¶\'üœo‹∏Òÿ[«fÁfi∆v‚Ω\"äù”◊ˇS3Äû|Ú…÷˜‚Î◊Ø◊˛Z&ÇÄÃ@fÄUQ$àƒ\'ﬁ¨ˇ±GgÁfhÌ⁄SO?µvÌZ>pÌ#EQñ.]j,âVØ^=88»çâÄ 3ê`BU	‚Ω`3ÒùßŸ∑;ü]∑Óã≤á+TÓøˇ˛À/ø\\ØäÓæ˚Ó¿˛£â\"3ê`BU~•Ri„∆\rsÛ\nÕM˚∆7Ô€∂Ì[≤-TV¨X°ïDõ6mJ$∆¡â»d¥¢*\n9qÁ°∑éWÁÊœ—‹¥È3¨Y≥öè˚Ë˘Áü_≤dâ®ä2ôü(\n2ôñ®äBn||<üœœÕü’€˙Ã∫¸Ü™q©Hµm€˛öª<˛∫˘Êõµ™HvG!2ôñ®äB.õÕN<ÒﬂÜçøV’7/®Øœ©ØÃ®f‘Ω”ÛcO<˜”„ßvœ™ˇ£®ªu◊YıŸÛÍﬂÌ:xÁñª§ß!)Ì•}ì©TJˆ–ÖJ≠VgSﬁgôÅÃ\0KTE!óL&⁄?7Fk‚Ã4≠™g‘SÛÍ˚≥ÍYU˝Ûøxp‡≤´Ü6dèœ©«f‘cÁ’™¢ôWÙÛÕ7Ög\"ÿ¶œúå≈b≤á.l¯+éABf 3¿y*‰‚Ò¯{\'èœÕOkM§≥≥‘ôçßÊ\Z?¸Ã˛ŒÔ~ˆ/˙Œº™ûûWOÕ©Ôœ©uU}vœÀÕ‹7Õ∆)ºsä¢ã≈ëëël6õ˛H&ìS∆««˘0rë»∞ƒ\0á\\3ù÷õ¯ıÃºzÚú:{·√Íı˙˜æˇÉo}˚˚«ﬁnú•Ê‘ŸfN|Ò•¶e#’»}ù≈ê®Ñ?ûíJ•∂oﬂﬁÔ_IÎ”P!3ê`âπf˛˙_Ω5rﬂıƒYıùiuNUggfí7‹00±ÅÅÿ≠≤Ÿ∏‡ﬁ}˚MÀF™ë˚ß\\.\r\rπ¸–Æ&ëHÙÊãié=q3õ„<=ÿ_ê»∞¬\0á\\3ù“€@Û:πxG¯ˆiı›ÛÍﬁCø\\±b≈«.øbŸ’œ›~IÓ€Û“>”≤ëj‰>ØE…ÁÛ¶!ïJ}„ﬂúòxb«ŒÁÙˆ¿n‹∏—4g6õÌ˝º∂eõ°7=e¸µÔÜÃ@fÄ%8‰ö˘´Æ7ÒÎπı}•ÒéƒyuÁû çkn˙¯o_{u¸ö¸ÀèŒ´ÍÙåzv¶±‡Æ…=¶e#’»}û‘j5”%¢{Ô˝zÛ?åŒ∑k\'ﬁ;˘è<¢˝øXM\"ëòööÍe∑m™\"Àã@ÌûÍ«ÀEd2,1¿!\'é·˘˘Ù¶“\"˝ùöS?òÔÁ^<X]Û˚ü[ˇÂ?xwF}GQﬂU‘ì3™»~ªvÔ1-©FÓsØZ≠äÇFØ	2ôå}=d™çx‡A}ŸX,699Ÿõn∑bó◊äZgÎØò!3ê`â9S˛JØ_˜Ú´ØÔ=Xôú™º∞ØÚ¬˛√/æ|ÙøvøÚÛÉo<øÔœˆΩˆ¬˛◊&>¯˙Ø˘««n€tõÙDÓ8EQåWâ⁄∂Õe=dlè?˛o¢“Øı‡Îi¶À?¶ßT€kE∆5Ù„U\"\rôÅÃ\0Kp»5sﬂ˚∆vœ=w9ﬁ˛¯÷[MF™ë˚\\ ÂrzÃLL<±àíHk{_⁄è«µı§”ÈÆˆŸT‚X}Z»qb(Æë»0cÄCÆô˚N“º6rü≈bQ?Y.Ó*ë±=ıÙ3˙⁄∆∆∆∫‘gÀb®ı±õ™®Uó˙‹\rd2,1¿!◊»}ﬁ£ym‰>7R©îV\rd2ôK\"≠Èü1\ZÙ˝Ôô\nÀ∫GU›ﬁAk∑û~Af 3¿rÕ‹wÇÊµë˚\n≠\\à≈b«ﬁ:ÓKUtz˙å˛≠¥≠[∑vµˇÌÜÿfË[+\'ÀÈ}ÅÃ@fÄ%8‰öπÔ]ö◊FÓsîNßµÚÂﬁ{øÓKI§µ>ˆò∂⁄x<ﬁ’˛˚XŸL,2ôñ‡êkÊæwh^πœ^Ω^◊o-˘u°Ho´V%¥5óÀÂÓmÇß™®›}4ówŸàÃ@fÄ%8‰öπØFÛ⁄»}jÛYµZµ|j||\\´“È¥ø%ëhwﬁ˘·ó°ÜááΩv.ë»∞ƒ\0áπè‹∑8á÷JìÂÀóOLLòû›≤eãˆlÁ_=km;v>ß≠|hh»¯¢ız˝ˆ€o◊û∫Ó∫Î(å:Af 3¿rÕ‹˜Îûµ÷ósﬂõ9çOıfã»}ä¢\\vŸeZ	≤d…íœ|Ê3∆*$ì…hO=ıÙ3æWEGé’VûH$ÙW‹æ}ª˛ó≈É¡¡¡¸±«ÛÎ8rs»{J≠‹Á\n}zÎ2\\bÄCN√.ºÌo3Â,”S6söÊ∑|∂›ú6Ø“çFÓåˇ§LX∂lŸw‹°}a^ˇN˛ﬁóˆ˘^â¶ø®x≠J•Ú©O} ÿì°°!c¡ÑEÒ ≤9TM-p„Ø∆â∆.sÖÕ2\\bÄCÆôé˚€åÎ4≠øı)ó3ªyï6Ÿ–Á≠”_QˇéZÈì˚yÊ©ÈÎg∫«ó√ƒqÂñ/4–&¥{`ﬂ[«≈◊‡iìe\'utrÕ\\ñøM[ßÈÁ•	—<øÂtÀ’∂[V∂[d˘∫≤áNæ´ØæZﬂ˘Ÿ&Q£T*ÒT2ô‘¶ˇ‚–°nTE˙Õ2µ˘ﬂgøÙ•/}‚ü–;≥|˘ÚT*%{˜Ù7_é£v+i=ZçsZ¶à÷„›&oÿÁ\n«ê`Éπf.8Êo”÷i¸iz ¯´qäÈW}JõTh±Z”⁄|ﬂ4„ eùd˙wÔEÙµØ}M¸,\n˙≥˙%ú;üÛΩ$:ÒﬁImÂ∆?YT*ïV≠Zu˝ı◊kO-]∫‘˜?~)æ>ÌVb<`[ìÄMﬁ∞‡ò+,gˆ7WêBèπf:¯ïøM[ßÒß>]ˇ’Ùÿ¥∏ÂS6èı◊∫4Ÿ˘º]¶N :…ﬁ|ÛÕX,ñ…dâƒ∞(íåœÊÛym˛·ëG|Øä~qËê∂r”!Qçåå¨\\πRL?ß¶¶zªKB≈ó#®›JZyõc‹xD∑ŒÈ5WXÆúÃ\0˜‡êìUπIùZ\nÀ¢«rä„ö…}ù+ã„„„ñ_Ä’eÛÊØ˙^=¥mõ∂Ú\\.◊˙“¢?¢W¢o]ﬂ˛PÛ´*rs¸∂;Z€1ñ´rü+∫ö\"»°«\0á\\3)ºÈo”÷i¸Ÿ˙´ˆ∏M\n3Ø Ê±Âj[ÁÔ∆6 ∫@´T*⁄h∆„Ò””g¸≠ä÷≠[ß≠\\T?≤74¥∫z¯X&Å÷ú`yÏªô“.!¥&ﬂ7ìÃzp»5í¬B’ﬂ¶≠≥ıßÒÅifõ_€OVØhÛBæo£Ï°∫D\"°ç»ƒƒ>ñD˙+L∑Ì‡#ﬂè „\nÌWnì%lRÅõ\\—ö∫±ô≤á›≈\0á\\3)º—ç¶ØŸ¯≠/göbÛ´ÕzZÌﬁvÈ/!{ËÇnxxXà5k÷¯xπË+∑‹¢≠6õÕ ﬁƒ0ÛÂ“V‚ò\nL¨eñ∞?‰]Ê\nSOå´ı+cêBèπf.¯•ÔM[mÎ MSgXƒS˙„.möærŸCtız]ˇ´B~˝ﬂè]/º®_\0‡√‘]ÂÀ·côå?™K≤ÑßDaÛ¨19ò˙ÊW∫ 3ÑrÕ\\p‘ﬂf\\ßÈqªßZüµ_≠ÂS≠kË∆÷Èkñ=t}`llLîX,÷˘WÙè=™óY[∂lëΩq!◊˘±”zÏÎ⁄Õﬂ qÀµµõ®O∑Ïôn0¿!◊ÃGh^πœ•°°!Ìî#\nöN˛ŒıÈÈ3k÷¨—W≈ˇ8Î62ôñ‡êkÊæ◊i^πœ•jµ\Zè«ıjfqˇÌÿ[«ıí(ãïÀeŸõ~d2,1¿!GÓ#˜uõ(bÙõ¢¶Ò˙wwΩ¢Òﬂ–éçç…ﬁ†H 3ê`â9q/,¶ym‰>Oä≈¢~≈h†˘≠¥ßû~∆Õ%¢€6m2~ÇÑí®g»dXbÄCÆô˚^£ym‰>Ø*ïä˛/cı⁄ËÅl˝˜±¢˙áGŸ∏q£qfQTq„¨ó»dXbÄCÆô˚*4Øç‹∑ız}ddDˇw˜&k◊Æm˜T.ó„„’=Ff 3¿rÕ‹˜*Õk#˜-ö®oÙˇÎ(ùNONN Órë»∞ƒ\0áúxw~Ó‹˛ÖÖWhû\ZπØCä¢\nQ•R)S%îH$≤ŸÏˆÌ€π>$ôÅÃ\0Kp»â3–o¸ta·ÕS#˜!‹»dXbÄC.ì…¸§¥}A˝Õ}{µÚ„d2){ËÄ.\"3ê`â™(‰FGGááÔêûM˙´˝Û¯C˘|^ˆ–]Df 3¿UQ»U´’dÚìÁîΩÍAöÀñÕﬁ\\,e–Ed2,QÖﬂH√ñıeöõˆÔÖøÕÂ2≤\rË:2ô≠®ä¬OQît˙sììˇ™™hˆ≠V€)ﬁ@◊Îªd\Z–ud2ZQEB•RI•n®Tä™:Ek◊D‚\'âr˘QŸ√ÙôÅÃ\0™¢®òúúÈotÙœTu?≠µãﬂM&ÂÚ?…(†ß»dQEà¢(√√˘t˙¶ÒÒø™’ûU’}¥z˝øÖø…Â6f≥iÒXˆê»–QENπ\\ŒÁˇhp∑\\˛OÜpã«óÁrD˙ì=,Ädd#2CdQA\Z˛ÚÄVdHDU9vÔﬁ-ﬁê’ÎuŸ,¸W\r»CAéï+Wä‹˜ß˙ß≤; X®ä ¡	~¯aÌÊ˝u◊]755%ª;\0Ñ™|ËµzΩã≈¥™Ëä+Æ∏È¶õd˜@ÄPA\"ÇΩñÕfçﬂıXπrÂ¯¯∏ÏN\n™\"HD°ßÍızÎó`Øø˛zEQdw\r@ PA\"Ç=ıË£èjï–ç7ﬁ®WEü˛ÙßÀÂ≤ÏÆ™\"HD°ß~ˆ≥ü]u’UâD\"èã‹7ÿtÌµ◊R–PA\"ÇΩ655U≠V’èrüxÃ◊–\0Ë®ä ¡i»}\0Zë ¡i»}\0Zë ¡i»}\0Zë ¡i»}\0Zë ¡i»}\0Zë ¡i»}\0Zë ¡i»}\0Zë ¡i»}\0Zë ¡i»}\0Zë ¡i»}\0Zë ¡i»}\0Zë ¡i»}\0Zë ¡i»}\0Zë ¡i»}\0Zë ¡i»}\0Zë ¡i»}\0Zë ¡i»}\0Zë ¡i»}\0Zë ¡i»}\0Zë ¡i»}\0Zë ¡i»}\0Zë ¡i»}\0Zë ¡i»}\0Zë ¡ib±ò¢(≤{ X®ä ¡iâDµZï›\0¡BUâ>HìJ•¶¶¶d˜@Ä‘jµ¡¡AŸΩ@tQAöt:].óe˜¡≈5É™V´âDBv/]$HìœÁ«««e˜Ω3`ÀqπùGoîJ•L&#ªà.\r§%ë(åd˜ΩcSŸòû2˛J=)#M≤{ÅË\"›@öJ•íL&e˜Ω£’7ñÅ⁄=≈Â¢®…d2•RIv/]d»ƒÆ#≈Âµ¢÷Ÿ®á\"¢V´%	˛`$\"◊@¶±±±≠[∑ ÓzƒÒZë>Wâ¢âÑ\0È»5êIº)o\r≈DŸA/¥@ñπVMdπíïÀÂt:-ªË˜U◊ä\"à/•\"»5êoddÑÀÊQ‡Úöi~D¡ÿÿÿñ-[d˜†*B0g2ôzΩ.ª#Ë\"7ü∂6I≠2ä¢‰ÛyJ\"âAQ*ïâƒ»»,´ETE6—Ôƒª†±±1q‘s„¡AñAÄà,)™\"ë%3ôåx¿ˇ	ôv∑…‹|≠›‚Ë;‚∏Õf≥‚Hﬂ∫u+ÔÇ(dé¢(•RITEÈt⁄ÚÉ∑\0˙ó8Æáááã≈\"wÃ@TE\0\0\0\rTE\0\0\0\rTE\0\0\0\rTE\0\0\0\rTE\0\0\0\rˇxAËS\'√ç\0\0\0\0IENDÆB`Ç',0);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('next.dbid','1001',11);
insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('schema.history','create(5.13)',1);
insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('schema.version','5.13',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('302','LeaveBillProcessTest:1:4','301','301','startevent1',NULL,NULL,'Start','startEvent',NULL,'2019-05-14 14:27:02','2019-05-14 14:27:02',9);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('305','LeaveBillProcessTest:1:4','301','301','usertask1','306',NULL,'Êèê‰∫§Áî≥ËØ∑','userTask','zhang','2019-05-14 14:27:02','2019-05-14 14:27:23',21217);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('309','LeaveBillProcessTest:1:4','301','301','usertask2','310',NULL,'‰∏ªÁÆ°ÂÆ°Êâπ','userTask','mike','2019-05-14 14:27:23','2019-05-14 14:29:52',149265);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('313','LeaveBillProcessTest:1:4','301','301','usertask3','314',NULL,'ÊÄªÁªèÁêÜÂÆ°Êâπ','userTask','danny','2019-05-14 14:29:52','2019-05-14 14:30:45',53915);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('317','LeaveBillProcessTest:1:4','301','301','endevent1',NULL,NULL,'End','endEvent',NULL,'2019-05-14 14:30:45','2019-05-14 14:30:45',0);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('402','LeaveBillProcessTest:1:4','401','401','startevent1',NULL,NULL,'Start','startEvent',NULL,'2019-05-14 15:13:54','2019-05-14 15:13:54',10);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('405','LeaveBillProcessTest:1:4','401','401','usertask1','406',NULL,'Êèê‰∫§Áî≥ËØ∑','userTask','zhang','2019-05-14 15:13:54','2019-05-14 15:14:20',26619);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('409','LeaveBillProcessTest:1:4','401','401','usertask2','410',NULL,'‰∏ªÁÆ°ÂÆ°Êâπ','userTask','mike','2019-05-14 15:14:20','2019-05-14 15:15:13',53136);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('413','LeaveBillProcessTest:1:4','401','401','usertask3','414',NULL,'ÊÄªÁªèÁêÜÂÆ°Êâπ','userTask','danny','2019-05-14 15:15:13','2019-05-14 15:18:51',218435);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('417','LeaveBillProcessTest:1:4','401','401','endevent1',NULL,NULL,'End','endEvent',NULL,'2019-05-14 15:18:51','2019-05-14 15:18:51',1);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('606','baoxiao:1:604','605','605','startevent1',NULL,NULL,'Start','startEvent',NULL,'2019-05-22 15:11:32','2019-05-22 15:11:32',11);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('609','baoxiao:1:604','605','605','usertask1','610',NULL,'ÂëòÂ∑•Áî≥ËØ∑Êä•ÈîÄ','userTask','zhang','2019-05-22 15:11:32','2019-05-22 15:15:49',257272);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('702','baoxiao:1:604','605','605','usertask2','703',NULL,'ÈÉ®Èó®ÁªèÁêÜÂÆ°Êâπ','userTask','mike','2019-05-22 15:15:49','2019-05-22 15:16:41',52075);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('707','baoxiao:1:604','605','605','usertask4','708',NULL,'ÊÄªÁªèÁêÜÂÆ°Êâπ','userTask','danny','2019-05-22 15:16:41','2019-05-22 15:17:51',70182);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('711','baoxiao:1:604','605','605','usertask3','712',NULL,'Ë¥¢Âä°ÂÆ°Ê†∏','userTask','li','2019-05-22 15:17:51','2019-05-22 15:18:55',64204);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('715','baoxiao:1:604','605','605','endevent1',NULL,NULL,'End','endEvent',NULL,'2019-05-22 15:18:55','2019-05-22 15:18:55',0);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('802','baoxiao:1:604','801','801','startevent1',NULL,NULL,'Start','startEvent',NULL,'2019-05-22 16:31:42','2019-05-22 16:31:42',9);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('805','baoxiao:1:604','801','801','usertask1','806',NULL,'ÂëòÂ∑•Áî≥ËØ∑Êä•ÈîÄ','userTask','zhang','2019-05-22 16:31:42','2019-05-22 16:32:00',18030);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('809','baoxiao:1:604','801','801','usertask2','810',NULL,'ÈÉ®Èó®ÁªèÁêÜÂÆ°Êâπ','userTask','mike','2019-05-22 16:32:00','2019-05-22 16:34:10',130480);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('814','baoxiao:1:604','801','801','usertask4','815',NULL,'ÊÄªÁªèÁêÜÂÆ°Êâπ','userTask','danny','2019-05-22 16:34:10','2019-05-22 16:35:25',75188);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('818','baoxiao:1:604','801','801','usertask3','819',NULL,'Ë¥¢Âä°ÂÆ°Ê†∏','userTask','li','2019-05-22 16:35:25','2019-05-22 16:36:36',71132);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('822','baoxiao:1:604','801','801','endevent1',NULL,NULL,'End','endEvent',NULL,'2019-05-22 16:36:36','2019-05-22 16:36:36',0);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('902','baoxiao:1:604','901','901','startevent1',NULL,NULL,'Start','startEvent',NULL,'2019-05-23 15:48:33','2019-05-23 15:48:33',11);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('905','baoxiao:1:604','901','901','usertask1','906',NULL,'ÂëòÂ∑•Áî≥ËØ∑Êä•ÈîÄ','userTask','zhang','2019-05-23 15:48:33','2019-05-23 15:48:40',7593);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('909','baoxiao:1:604','901','901','usertask2','910',NULL,'ÈÉ®Èó®ÁªèÁêÜÂÆ°Êâπ','userTask','mike','2019-05-23 15:48:40','2019-05-23 15:49:13',33951);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('914','baoxiao:1:604','901','901','usertask4','915',NULL,'ÊÄªÁªèÁêÜÂÆ°Êâπ','userTask','danny','2019-05-23 15:49:13','2019-05-23 15:49:50',37867);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('918','baoxiao:1:604','901','901','usertask3','919',NULL,'Ë¥¢Âä°ÂÆ°Ê†∏','userTask','li','2019-05-23 15:49:50','2019-05-23 15:50:32',42484);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('922','baoxiao:1:604','901','901','endevent1',NULL,NULL,'End','endEvent',NULL,'2019-05-23 15:50:32','2019-05-23 15:50:32',0);

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('308','comment','2019-05-14 14:27:23','zhang','306','301','AddComment','ÂèØ‰ª•Ôºåqb','ø…“‘£¨qb');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('312','comment','2019-05-14 14:29:52','mike','310','301','AddComment','Â•ΩÁöÑÔºåÂéª','∫√µƒ£¨»•');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('316','comment','2019-05-14 14:30:45','danny','314','301','AddComment','ÊÄªÁªèÁêÜËØ¥‰∫ÜÂèØ‰ª•','◊‹æ≠¿ÌÀµ¡Àø…“‘');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('408','comment','2019-05-14 15:14:20','zhang','406','401','AddComment','ÂõΩÂ∫ÜÂÅáÊúü','π˙«ÏºŸ∆⁄');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('412','comment','2019-05-14 15:15:13','mike','410','401','AddComment','Êîæ‰∫ÜÊîæ‰∫Ü','∑≈¡À∑≈¡À');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('416','comment','2019-05-14 15:18:51','danny','414','401','AddComment','ÂáÜ‰∫Ü','◊º¡À');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('701','comment','2019-05-22 15:15:49','zhang','610','605','AddComment','zhang ÂäûÁêÜÊä•ÈîÄ','zhang ∞Ï¿Ì±®œ˙');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('705','comment','2019-05-22 15:16:41','mike','703','605','AddComment','mike ÂäûÁêÜÈÄöËøá','mike ∞Ï¿ÌÕ®π˝');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('710','comment','2019-05-22 15:17:51','danny','708','605','AddComment','danny','danny');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('714','comment','2019-05-22 15:18:55','li','712','605','AddComment','li ÂäûÁêÜÊä•ÈîÄÂÆåÊàê','li ∞Ï¿Ì±®œ˙ÕÍ≥…');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('808','comment','2019-05-22 16:32:00','zhang','806','801','AddComment','zhang Êèê‰∫§Êä•ÈîÄ','zhang Ã·Ωª±®œ˙');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('812','comment','2019-05-22 16:34:10','mike','810','801','AddComment','mike Áªô‰∫àÊä•ÈîÄ','mike ∏¯”Ë±®œ˙');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('817','comment','2019-05-22 16:35:25','danny','815','801','AddComment','danny ‰πüËßâÂæóÂèØ‰ª•','danny “≤æıµ√ø…“‘');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('821','comment','2019-05-22 16:36:36','li','819','801','AddComment','li Â∑≤ÁªèÁªô zhang Êä•ÈîÄ','li “—æ≠∏¯ zhang ±®œ˙');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('908','comment','2019-05-23 15:48:40','zhang','906','901','AddComment','zhang','zhang');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('912','comment','2019-05-23 15:49:13','mike','910','901','AddComment','mike','mike');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('917','comment','2019-05-23 15:49:50','danny','915','901','AddComment','anndy','anndy');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('921','comment','2019-05-23 15:50:32','li','919','901','AddComment','li','li');

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_identitylink` */

insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('307',NULL,'participant','zhang',NULL,'301');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('311',NULL,'participant','mike',NULL,'301');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('315',NULL,'participant','danny',NULL,'301');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('407',NULL,'participant','zhang',NULL,'401');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('411',NULL,'participant','mike',NULL,'401');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('415',NULL,'participant','danny',NULL,'401');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('611',NULL,'participant','zhang',NULL,'605');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('704',NULL,'participant','mike',NULL,'605');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('709',NULL,'participant','danny',NULL,'605');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('713',NULL,'participant','li',NULL,'605');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('807',NULL,'participant','zhang',NULL,'801');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('811',NULL,'participant','mike',NULL,'801');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('816',NULL,'participant','danny',NULL,'801');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('820',NULL,'participant','li',NULL,'801');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('907',NULL,'participant','zhang',NULL,'901');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('911',NULL,'participant','mike',NULL,'901');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('916',NULL,'participant','danny',NULL,'901');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('920',NULL,'participant','li',NULL,'901');

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  UNIQUE KEY `ACT_UNIQ_HI_BUS_KEY` (`PROC_DEF_ID_`,`BUSINESS_KEY_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`) values ('301','301','LeaveBillProcessTest.30','LeaveBillProcessTest:1:4','2019-05-14 14:27:02','2019-05-14 14:30:45',223918,NULL,'startevent1','endevent1',NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`) values ('401','401','LeaveBillProcessTest.31','LeaveBillProcessTest:1:4','2019-05-14 15:13:54','2019-05-14 15:18:51',297437,NULL,'startevent1','endevent1',NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`) values ('605','605','baoxiao.10','baoxiao:1:604','2019-05-22 15:11:32','2019-05-22 15:18:55',443205,NULL,'startevent1','endevent1',NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`) values ('801','801','baoxiao.11','baoxiao:1:604','2019-05-22 16:31:42','2019-05-22 16:36:36',294133,NULL,'startevent1','endevent1',NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`) values ('901','901','baoxiao.12','baoxiao:1:604','2019-05-23 15:48:33','2019-05-23 15:50:32',119486,NULL,'startevent1','endevent1',NULL,NULL);

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('306','LeaveBillProcessTest:1:4','usertask1','301','301','Êèê‰∫§Áî≥ËØ∑',NULL,NULL,NULL,'zhang','2019-05-14 14:27:02',NULL,'2019-05-14 14:27:23',21204,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('310','LeaveBillProcessTest:1:4','usertask2','301','301','‰∏ªÁÆ°ÂÆ°Êâπ',NULL,NULL,NULL,'mike','2019-05-14 14:27:23',NULL,'2019-05-14 14:29:52',149262,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('314','LeaveBillProcessTest:1:4','usertask3','301','301','ÊÄªÁªèÁêÜÂÆ°Êâπ',NULL,NULL,NULL,'danny','2019-05-14 14:29:52',NULL,'2019-05-14 14:30:45',53911,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('406','LeaveBillProcessTest:1:4','usertask1','401','401','Êèê‰∫§Áî≥ËØ∑',NULL,NULL,NULL,'zhang','2019-05-14 15:13:54',NULL,'2019-05-14 15:14:20',26612,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('410','LeaveBillProcessTest:1:4','usertask2','401','401','‰∏ªÁÆ°ÂÆ°Êâπ',NULL,NULL,NULL,'mike','2019-05-14 15:14:20',NULL,'2019-05-14 15:15:13',53132,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('414','LeaveBillProcessTest:1:4','usertask3','401','401','ÊÄªÁªèÁêÜÂÆ°Êâπ',NULL,NULL,NULL,'danny','2019-05-14 15:15:13',NULL,'2019-05-14 15:18:51',218432,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('610','baoxiao:1:604','usertask1','605','605','ÂëòÂ∑•Áî≥ËØ∑Êä•ÈîÄ',NULL,NULL,NULL,'zhang','2019-05-22 15:11:32',NULL,'2019-05-22 15:15:49',257243,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('703','baoxiao:1:604','usertask2','605','605','ÈÉ®Èó®ÁªèÁêÜÂÆ°Êâπ',NULL,NULL,NULL,'mike','2019-05-22 15:15:49',NULL,'2019-05-22 15:16:41',52068,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('708','baoxiao:1:604','usertask4','605','605','ÊÄªÁªèÁêÜÂÆ°Êâπ',NULL,NULL,NULL,'danny','2019-05-22 15:16:41',NULL,'2019-05-22 15:17:51',70180,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('712','baoxiao:1:604','usertask3','605','605','Ë¥¢Âä°ÂÆ°Ê†∏',NULL,NULL,NULL,'li','2019-05-22 15:17:51',NULL,'2019-05-22 15:18:55',64202,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('806','baoxiao:1:604','usertask1','801','801','ÂëòÂ∑•Áî≥ËØ∑Êä•ÈîÄ',NULL,NULL,NULL,'zhang','2019-05-22 16:31:42',NULL,'2019-05-22 16:32:00',18018,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('810','baoxiao:1:604','usertask2','801','801','ÈÉ®Èó®ÁªèÁêÜÂÆ°Êâπ',NULL,NULL,NULL,'mike','2019-05-22 16:32:00',NULL,'2019-05-22 16:34:10',130476,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('815','baoxiao:1:604','usertask4','801','801','ÊÄªÁªèÁêÜÂÆ°Êâπ',NULL,NULL,NULL,'danny','2019-05-22 16:34:10',NULL,'2019-05-22 16:35:25',75185,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('819','baoxiao:1:604','usertask3','801','801','Ë¥¢Âä°ÂÆ°Ê†∏',NULL,NULL,NULL,'li','2019-05-22 16:35:25',NULL,'2019-05-22 16:36:36',71128,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('906','baoxiao:1:604','usertask1','901','901','ÂëòÂ∑•Áî≥ËØ∑Êä•ÈîÄ',NULL,NULL,NULL,'zhang','2019-05-23 15:48:33',NULL,'2019-05-23 15:48:40',7581,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('910','baoxiao:1:604','usertask2','901','901','ÈÉ®Èó®ÁªèÁêÜÂÆ°Êâπ',NULL,NULL,NULL,'mike','2019-05-23 15:48:40',NULL,'2019-05-23 15:49:13',33946,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('915','baoxiao:1:604','usertask4','901','901','ÊÄªÁªèÁêÜÂÆ°Êâπ',NULL,NULL,NULL,'danny','2019-05-23 15:49:13',NULL,'2019-05-23 15:49:50',37864,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('919','baoxiao:1:604','usertask3','901','901','Ë¥¢Âä°ÂÆ°Ê†∏',NULL,NULL,NULL,'li','2019-05-23 15:49:50',NULL,'2019-05-23 15:50:32',42480,'completed',50,NULL,NULL);

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('303','301','301',NULL,'objId','string',0,NULL,NULL,NULL,'LeaveBillProcessTest.30',NULL);
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('304','301','301',NULL,'userId','string',0,NULL,NULL,NULL,'zhang',NULL);
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('403','401','401',NULL,'objId','string',0,NULL,NULL,NULL,'LeaveBillProcessTest.31',NULL);
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('404','401','401',NULL,'userId','string',0,NULL,NULL,NULL,'zhang',NULL);
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('607','605','605',NULL,'objId','string',0,NULL,NULL,NULL,'baoxiao.10',NULL);
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('608','605','605',NULL,'inputUser','string',0,NULL,NULL,NULL,'zhang',NULL);
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('706','605','605',NULL,'message','string',1,NULL,NULL,NULL,'ÂêåÊÑè',NULL);
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('803','801','801',NULL,'objId','string',0,NULL,NULL,NULL,'baoxiao.11',NULL);
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('804','801','801',NULL,'inputUser','string',0,NULL,NULL,NULL,'zhang',NULL);
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('813','801','801',NULL,'message','string',1,NULL,NULL,NULL,'ÂêåÊÑè',NULL);
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('903','901','901',NULL,'objId','string',0,NULL,NULL,NULL,'baoxiao.12',NULL);
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('904','901','901',NULL,'inputUser','string',0,NULL,NULL,NULL,'zhang',NULL);
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('913','901','901',NULL,'message','string',1,NULL,NULL,NULL,'ÂêåÊÑè',NULL);

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOY_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`DEPLOY_TIME_`) values ('1','ÂèëÂ∏ÉÊµÅÁ®ãÂÆö‰πâ',NULL,'2019-05-14 10:33:10');
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`DEPLOY_TIME_`) values ('601','Êä•ÈîÄÊµÅÁ®ãÂÆö‰πâ',NULL,'2019-05-22 15:10:32');

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`SUSPENSION_STATE_`) values ('LeaveBillProcessTest:1:4',1,'http://www.activiti.org/test','My process','LeaveBillProcessTest',1,'1','LeaveBillProcessTest.bpmn','LeaveBillProcessTest.png',NULL,0,1);
insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`SUSPENSION_STATE_`) values ('baoxiao:1:604',1,'http://www.activiti.org/test','baoxiaoProcess','baoxiao',1,'601','baoxiaoprocess.bpmn','baoxiaoprocess.png',NULL,0,1);

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_RU_BUS_KEY` (`PROC_DEF_ID_`,`BUSINESS_KEY_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DUE_DATE_` datetime DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

/*Table structure for table `baoxiaobill` */

DROP TABLE IF EXISTS `baoxiaobill`;

CREATE TABLE `baoxiaobill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` decimal(8,2) NOT NULL,
  `title` varchar(200) NOT NULL,
  `remark` varchar(500) NOT NULL,
  `creatdate` datetime NOT NULL,
  `state` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `baoxiaobill` */

insert  into `baoxiaobill`(`id`,`money`,`title`,`remark`,`creatdate`,`state`,`user_id`) values (1,'3000.00','test01','Âá∫Â∑ÆÂπøÂ∑ûÂºÄ‰ºö','2019-03-11 21:32:46',2,5);
insert  into `baoxiaobill`(`id`,`money`,`title`,`remark`,`creatdate`,`state`,`user_id`) values (2,'4000.00','test02','Âá∫Â∑ÆÂåó‰∫¨ÂºÄ‰ºö','2019-03-11 23:26:10',2,5);
insert  into `baoxiaobill`(`id`,`money`,`title`,`remark`,`creatdate`,`state`,`user_id`) values (3,'6000.00','test03','ÈÄÅÁ§º‰∏äÁ∫ßÈ¢ÜÂØº','2019-03-11 23:49:05',2,5);
insert  into `baoxiaobill`(`id`,`money`,`title`,`remark`,`creatdate`,`state`,`user_id`) values (4,'7000.00','test04','ËØ∑ÂÆ¢Êà∑ÂêÉÈ•≠','2019-03-12 00:26:49',2,5);
insert  into `baoxiaobill`(`id`,`money`,`title`,`remark`,`creatdate`,`state`,`user_id`) values (5,'6000.00','test05','ÈÄÅÁ§º','2019-03-12 09:21:12',2,5);
insert  into `baoxiaobill`(`id`,`money`,`title`,`remark`,`creatdate`,`state`,`user_id`) values (6,'7000.00','test06','Âá∫Â∑ÆÂåó‰∫¨','2019-03-12 20:09:00',2,5);
insert  into `baoxiaobill`(`id`,`money`,`title`,`remark`,`creatdate`,`state`,`user_id`) values (7,'8888.00','test07','ÂéªÂá∫Â∑ÆÂπøÂ∑û','2019-03-14 11:08:26',1,5);
insert  into `baoxiaobill`(`id`,`money`,`title`,`remark`,`creatdate`,`state`,`user_id`) values (8,'3000.00','test07','Âá∫Â∑Æ','2019-03-18 13:55:33',2,5);
insert  into `baoxiaobill`(`id`,`money`,`title`,`remark`,`creatdate`,`state`,`user_id`) values (9,'8000.00','test08','ÂéªÂπøÂ∑ûÂºÄ‰ºö','2019-03-18 14:08:36',1,5);
insert  into `baoxiaobill`(`id`,`money`,`title`,`remark`,`creatdate`,`state`,`user_id`) values (11,'11111.00','111','zhang ÊÉ≥Êä•ÈîÄ','2019-05-22 16:31:41',2,5);
insert  into `baoxiaobill`(`id`,`money`,`title`,`remark`,`creatdate`,`state`,`user_id`) values (12,'11111.00','111','zhang','2019-05-23 15:48:32',2,5);

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` int(2) DEFAULT NULL,
  `manager_id` bigint(20) DEFAULT NULL,
  `salt` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`),
  KEY `FK4722E6AEC8CB2A1E` (`manager_id`),
  CONSTRAINT `FK4722E6AEC8CB2A1E` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`id`,`name`,`password`,`email`,`role`,`manager_id`,`salt`) values (1,'danny','8914684fb7da95dc7b8f6afa3f88fe67','wangzhongjun@163.com',4,1,'eteokues');
insert  into `employee`(`id`,`name`,`password`,`email`,`role`,`manager_id`,`salt`) values (2,'jack','8914684fb7da95dc7b8f6afa3f88fe67','fengxiaogangManager@163.com',2,1,'eteokues');
insert  into `employee`(`id`,`name`,`password`,`email`,`role`,`manager_id`,`salt`) values (3,'mike','8914684fb7da95dc7b8f6afa3f88fe67','fanbingbingManager@163.com',2,1,'eteokues');
insert  into `employee`(`id`,`name`,`password`,`email`,`role`,`manager_id`,`salt`) values (4,'chen','8914684fb7da95dc7b8f6afa3f88fe67','fengxiaogang@163.com',1,2,'eteokues');
insert  into `employee`(`id`,`name`,`password`,`email`,`role`,`manager_id`,`salt`) values (5,'zhang','8914684fb7da95dc7b8f6afa3f88fe67','fanbingbing@163.com',1,3,'eteokues');
insert  into `employee`(`id`,`name`,`password`,`email`,`role`,`manager_id`,`salt`) values (6,'li','8914684fb7da95dc7b8f6afa3f88fe67','li@qq.com',1,1,'eteokues');
insert  into `employee`(`id`,`name`,`password`,`email`,`role`,`manager_id`,`salt`) values (8,'wang','111111','wangwangwang@qq.com',1,2,NULL);
insert  into `employee`(`id`,`name`,`password`,`email`,`role`,`manager_id`,`salt`) values (9,'','','',1,NULL,NULL);

/*Table structure for table `leavebill` */

DROP TABLE IF EXISTS `leavebill`;

CREATE TABLE `leavebill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `days` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `leaveDate` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK62FCB35E2B4D7140` (`user_id`),
  CONSTRAINT `FK62FCB35E2B4D7140` FOREIGN KEY (`user_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `leavebill` */

insert  into `leavebill`(`id`,`days`,`content`,`remark`,`leaveDate`,`state`,`user_id`) values (10,5,'ÊóÖÊ∏∏','‰ºëÂπ¥ÂÅá','2018-03-21 08:26:55',1,5);
insert  into `leavebill`(`id`,`days`,`content`,`remark`,`leaveDate`,`state`,`user_id`) values (14,7,'ÁóÖÂÅá','Ë∞É‰ºë','2018-05-17 08:46:25',1,5);
insert  into `leavebill`(`id`,`days`,`content`,`remark`,`leaveDate`,`state`,`user_id`) values (15,1,'‰∫ãÂÅá','Â§ñÂá∫Âäû‰∫ã','2018-06-27 08:39:58',2,5);
insert  into `leavebill`(`id`,`days`,`content`,`remark`,`leaveDate`,`state`,`user_id`) values (16,15,'ÊóÖÊ∏∏','‰ºëÂπ¥ÂÅá','2018-06-27 09:02:17',1,5);
insert  into `leavebill`(`id`,`days`,`content`,`remark`,`leaveDate`,`state`,`user_id`) values (17,15,'Âπ¥ÂÅá','ÂéªÊóÖÊ∏∏','2018-11-08 14:30:46',1,5);
insert  into `leavebill`(`id`,`days`,`content`,`remark`,`leaveDate`,`state`,`user_id`) values (18,20,'Âπ¥ÂÅá','ÂõûÂÆ∂ÁªìÂ©ö','2018-11-12 14:57:25',2,5);
insert  into `leavebill`(`id`,`days`,`content`,`remark`,`leaveDate`,`state`,`user_id`) values (19,10,'ËØ∑ÂÅáÊµãËØï01','ÂéªÊóÖÊ∏∏','2019-03-14 09:51:12',0,5);
insert  into `leavebill`(`id`,`days`,`content`,`remark`,`leaveDate`,`state`,`user_id`) values (20,8,'ËØ∑ÂÅáÊµãËØï02','ÂõûÂÆ∂ËøáÂπ¥','2019-03-14 15:22:45',2,5);
insert  into `leavebill`(`id`,`days`,`content`,`remark`,`leaveDate`,`state`,`user_id`) values (21,8,'ËØ∑ÂÅáÊµãËØï02','ÂõûÂÆ∂ËøáÂπ¥','2019-03-14 15:25:28',0,5);

/*Table structure for table `sys_permission` */

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '‰∏ªÈîÆ',
  `name` varchar(128) NOT NULL COMMENT 'ËµÑÊ∫êÂêçÁß∞',
  `type` varchar(32) NOT NULL COMMENT 'ËµÑÊ∫êÁ±ªÂûãÔºömenu,button,',
  `url` varchar(128) DEFAULT NULL COMMENT 'ËÆøÈóÆurlÂú∞ÂùÄ',
  `percode` varchar(128) DEFAULT NULL COMMENT 'ÊùÉÈôê‰ª£Á†ÅÂ≠óÁ¨¶‰∏≤',
  `parentid` bigint(20) DEFAULT NULL COMMENT 'Áà∂ÁªìÁÇπid',
  `parentids` varchar(128) DEFAULT NULL COMMENT 'Áà∂ÁªìÁÇπidÂàóË°®‰∏≤',
  `sortstring` varchar(128) DEFAULT NULL COMMENT 'ÊéíÂ∫èÂè∑',
  `available` char(1) DEFAULT NULL COMMENT 'ÊòØÂê¶ÂèØÁî®,1ÔºöÂèØÁî®Ôºå0‰∏çÂèØÁî®',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `sys_permission` */

insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (1,'ÊùÉÈôê','','',NULL,0,'0/','0','1');
insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (11,'Êä•ÈîÄÁÆ°ÁêÜ','menu','','baoxiao:manager',1,'0/1/','1.','1');
insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (12,'Êä•ÈîÄÁî≥ËØ∑','menu|permission','apply_baoxiao.jsp','baoxiao:apply',11,'0/1/11/','','1');
insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (13,'ÊàëÁöÑÊä•ÈîÄÂçï','menu|permission','myBaoxiaoBill','baoxiao:billquery',11,'0/1/11/','','1');
insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (14,'ÊàëÁöÑÂæÖÂäû‰∫ãÂä°','menu|permission','myTaskList','baoxiao:tasklist',11,'0/1/11/','','1');
insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (15,'ÊµÅÁ®ãÁÆ°ÁêÜ','menu','','baoxiao:process',1,'0/1/15/',NULL,'1');
insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (21,'ÂèëÂ∏ÉÊµÅÁ®ã','menu|permission','add_process.jsp','baoxiao:publish',15,'0/1/','2.','1');
insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (22,'Êü•ÁúãÊµÅÁ®ã','menu|permission','processDefinitionList','baoxiao:processlist',15,'0/1/21/','','1');
insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (23,'Á≥ªÁªüÁÆ°ÁêÜ','menu','','user:manager',1,'0/1/21/','','1');
insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (24,'Áî®Êà∑ÁÆ°ÁêÜ','menu|permission','findUserList','user:query',23,'0/1/21/','','1');
insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (25,'ËßíËâ≤Ê∑ªÂä†','menu|permission','toAddRole','user:create',23,'0/1/21/','','1');
insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (26,'Âà†Èô§ÊµÅÁ®ãÂÆö‰πâ','permission','delDeployment','baoxiao:remove',15,NULL,NULL,'1');
insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (27,'Êü•ÁúãÊµÅÁ®ãÂÆö‰πâÂõæ','permission','viewImage','baoxiao:viewimage',15,NULL,NULL,'1');
insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (28,'ËßíËâ≤ÂàóË°®','menu|permission','findRoles','baoxiao:rolelist',23,NULL,NULL,'1');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` varchar(36) NOT NULL,
  `name` varchar(128) NOT NULL,
  `available` char(1) DEFAULT NULL COMMENT 'ÊòØÂê¶ÂèØÁî®,1ÔºöÂèØÁî®Ôºå0‰∏çÂèØÁî®',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`available`) values ('0aeddab9-c1bb-4871-8f1c-68bc5f675fb0','ÁΩëÁÆ°','1');
insert  into `sys_role`(`id`,`name`,`available`) values ('1','ÊôÆÈÄöÁî®Êà∑','1');
insert  into `sys_role`(`id`,`name`,`available`) values ('2','ÈÉ®Èó®ÁªèÁêÜ','1');
insert  into `sys_role`(`id`,`name`,`available`) values ('3','ÊÄªÁªèÁêÜ','1');
insert  into `sys_role`(`id`,`name`,`available`) values ('4','Ë¥¢Âä°','1');
insert  into `sys_role`(`id`,`name`,`available`) values ('bca6d030-907d-481b-8248-9e36eceb8176','ËßíËâ≤','1');
insert  into `sys_role`(`id`,`name`,`available`) values ('f7a38138-8210-4780-beef-aef49d40ab36','‰ºöËÆ°ÈÉ®‰∏ªÁÆ°','1');

/*Table structure for table `sys_role_permission` */

DROP TABLE IF EXISTS `sys_role_permission`;

CREATE TABLE `sys_role_permission` (
  `id` varchar(36) NOT NULL,
  `sys_role_id` varchar(36) NOT NULL COMMENT 'ËßíËâ≤id',
  `sys_permission_id` varchar(36) NOT NULL COMMENT 'ÊùÉÈôêid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_permission` */

insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('003f56da-70ea-4c46-8f93-fe7fa01fd474','f7a38138-8210-4780-beef-aef49d40ab36','14');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('02876167-3e21-4fee-af25-acf07659238c','3','14');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('067b999b-b6e6-4926-abd6-7e2fcb3824cd','f7a38138-8210-4780-beef-aef49d40ab36','23');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('08364fab-0381-4869-b24e-99fdcedd7d1c','2','24');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('0e273a64-05df-4071-9eae-f5550563f1cb','3','22');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('147468fd-4017-43cd-8c8b-060b05c7ee69','3','15');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('19b74c74-0404-4d1a-bcc2-ca0a3a3c8a56','bca6d030-907d-481b-8248-9e36eceb8176','13');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('1cac62ba-f78a-4db3-82cc-5d3b5a6fc8c9','1','13');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('1fca80f1-130d-4301-8673-5a39cf963b14','2','15');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('2027c782-bb28-401b-8169-2671b6b21460','2','23');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('21e02017-02bb-4187-bf44-f61f1b47c3f1','2','22');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('2a92fefe-9811-46cb-89b8-3cc25592abb2','2','14');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('2e9311e5-7fb8-4688-a286-e31fb46736ec','3','25');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('33e21e30-1f6b-44be-af39-19b378355047','f7a38138-8210-4780-beef-aef49d40ab36','11');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('36e047a4-4bcf-45a6-a3bf-4f3c7f60339a','4','11');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('38bc5d80-fce8-457b-9dad-0be567a76e7b','f7a38138-8210-4780-beef-aef49d40ab36','15');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('3f69be78-eb82-4b43-a5f7-0c0a8cee8fcb','3','24');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('504e2882-4cbc-4c43-9237-4eaabe4c1f09','0aeddab9-c1bb-4871-8f1c-68bc5f675fb0','15');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('5902bdb3-1f23-48fa-b2d1-442382463cac','1','12');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('592e6015-09ed-45af-82a0-bee777183644','2','11');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('5d91055d-0318-44a4-818f-e5e3377cc25b','2','25');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('6890155f-8e0a-410e-bee4-97d8a8f60d25','3','11');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('6db65ab1-7c4b-42ce-b30e-7236ac11e642','0aeddab9-c1bb-4871-8f1c-68bc5f675fb0','13');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('6e99d2e4-e90d-408f-a8e1-f34d877754c9','0aeddab9-c1bb-4871-8f1c-68bc5f675fb0','12');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('7c248959-a525-45ae-9cdd-14e3bf391328','bca6d030-907d-481b-8248-9e36eceb8176','11');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('7cc90728-96ae-4d04-aebe-f3457d809f51','f7a38138-8210-4780-beef-aef49d40ab36','12');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('7d0d1d1d-c60f-4c2e-adb3-e9832ed93bfc','2','21');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('a18f18d5-ca43-4021-a3f3-0340c611a5dd','3','28');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('a1f20773-9ac8-4872-85ee-86c5b140d681','4','14');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('a2c242b3-60bf-47bd-bf70-16f9482db45a','bca6d030-907d-481b-8248-9e36eceb8176','23');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('a424ff57-3467-48b6-8324-cec5f5630da8','0aeddab9-c1bb-4871-8f1c-68bc5f675fb0','11');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('aab8270d-052f-416d-b35c-d40246149a73','0aeddab9-c1bb-4871-8f1c-68bc5f675fb0','21');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('b013f33d-7010-4d4b-9811-a61b362df65a','3','21');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('b6c121c1-db94-4af3-b0a1-4e93fbf776b7','f7a38138-8210-4780-beef-aef49d40ab36','13');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('c6fcdfb9-0bfb-40a1-8665-12244101b1ea','1','14');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('d003d11d-ff85-4042-8831-1e22b4febd88','3','23');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('da1ac9cc-678b-4e08-8339-ba0bf91de375','bca6d030-907d-481b-8248-9e36eceb8176','15');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('e105ddae-dd98-4a7f-9a61-d5ede867fc11','0aeddab9-c1bb-4871-8f1c-68bc5f675fb0','14');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('e1f8de7f-36dd-4dc5-859c-218752053848','bca6d030-907d-481b-8248-9e36eceb8176','14');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('e7fce79d-8164-4538-9671-2c8bfa777e99','1','11');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('ed576b16-c6b9-4059-b7b1-890722c321a5','bca6d030-907d-481b-8248-9e36eceb8176','12');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('f957edca-0575-4694-ad94-46fc4d76b5c5','f7a38138-8210-4780-beef-aef49d40ab36','24');
insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('fb599643-f9e1-4769-a5d3-21aed672f605','f7a38138-8210-4780-beef-aef49d40ab36','22');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` varchar(36) NOT NULL,
  `sys_user_id` varchar(36) NOT NULL,
  `sys_role_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`id`,`sys_user_id`,`sys_role_id`) values ('1','danny','3');
insert  into `sys_user_role`(`id`,`sys_user_id`,`sys_role_id`) values ('2','jack','2');
insert  into `sys_user_role`(`id`,`sys_user_id`,`sys_role_id`) values ('3','mike','2');
insert  into `sys_user_role`(`id`,`sys_user_id`,`sys_role_id`) values ('4','chen','1');
insert  into `sys_user_role`(`id`,`sys_user_id`,`sys_role_id`) values ('5','zhang','1');
insert  into `sys_user_role`(`id`,`sys_user_id`,`sys_role_id`) values ('6','li','4');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
