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

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('2',1,'LeaveBillProcessTest.bpmn','1','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"LeaveBillProcessTest\" name=\"My process\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\"></startEvent>\n    <userTask id=\"usertask1\" name=\"提交申请\" activiti:assignee=\"${userId}\"></userTask>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"></sequenceFlow>\n    <userTask id=\"usertask2\" name=\"主管审批\">\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"com.shop.utils.CustomerLisnter\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"usertask2\"></sequenceFlow>\n    <userTask id=\"usertask3\" name=\"总经理审批\">\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"com.shop.utils.CustomerLisnter\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow3\" sourceRef=\"usertask2\" targetRef=\"usertask3\"></sequenceFlow>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <sequenceFlow id=\"flow4\" sourceRef=\"usertask3\" targetRef=\"endevent1\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_LeaveBillProcessTest\">\n    <bpmndi:BPMNPlane bpmnElement=\"LeaveBillProcessTest\" id=\"BPMNPlane_LeaveBillProcessTest\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"250.0\" y=\"300.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"BPMNShape_usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"330.0\" y=\"290.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"BPMNShape_usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"480.0\" y=\"290.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"BPMNShape_usertask3\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"630.0\" y=\"290.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"780.0\" y=\"300.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"285.0\" y=\"317.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"330.0\" y=\"317.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"435.0\" y=\"317.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"480.0\" y=\"317.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"585.0\" y=\"317.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"630.0\" y=\"317.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"735.0\" y=\"317.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"780.0\" y=\"317.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('3',1,'LeaveBillProcessTest.png','1','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0E\0\0�\0\0\0qb�\0\0�IDATx���l��}p������n��O\\�,u�Z)�kq\'�x�F,�o��Pi�jMSkm\nL+Y4�,�Z�n%�6�y��,XV˶@3~�#���hJ5#�#q�g�����ٗ;����{��Qd�=���������w��\0\0����w\0\0���s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s\0\0��s�EJ����������PO�J۞����������l���,����v���9����K��4H�瞇�����sss�Yi��ػw�֭[�>I���i������,2y־��wlll����_9~n��o�L%�\'Nt�Q��A\\����\'��\Z������{�qn�Z����\r6;v���Z��`7T�;�<k����� yOկ��?�i�ow�]K�A�*lC��`-۷o����͝/�F�_��;���}��`WU;�<kV�T�����cs��U���3?���ߜ���t��v[����s�fMLL���͝�R�\Z��?M��V]U;v����x�[�@u��PD��5kddd���� �n����s���fO�͞8}~׽�շ;��o){��|\'{���>{��u��ޑz�����N�n��`V�:�<k�����#O͝?S���t�����u>{�\\�N�����s�/l�n�չ�����{ٱR����[�}z��3]X�Ϝ����t��va����s��Rijj���oO��~fxx8]299�s�����8������J������:�ҿ�~�?~��~�/����,{�|��\\��\\����ǟ��%���Ҷw�q:���Y��`#�L�����}�^�]�*��L��1��ý{�}h������o�mtt4��7n������ەJߞ9��z7;waa�O��_���~��k��8s�s�3��\'�^tۮ�������t��45Ҽ��B�޽;žU�31v������_L������u�G�n�L:>8��;~����*ui�\\�N����t6�e�Ξ�暞����~���V����O-�mWUqf��`wVq:��t�O��|kKY��w����`��ܹ3����?|�$W]O<yxӦM۶m[�\\���oU��Zϩw����^/{��?�я~��~�ʫ?2���%�?yx�m���3KtP�����Z�?66V������WuRm�~��͛-922�J��S�]�-�������M%����]w\r\r\r�o�σ�J�o߽��Y�����������Ƶ���/���}�����{Yv�l���K7<x��E��*�,�A��*NIg�EO��r�^<z�Θ8�Ʃ4)֭[W�D���t�����V[\ns鰜��\\q������S̿9�N����R�Sd\Z\'o�e?=����ܣ����>�������f?)e���Sg�4M>����vUg��vg����y>E�J,�������o�ܶ���СC�޽\"�2h������\\���\n���y0��M�|��\'��94=���G�z��g���c���/�������y���~��~t�?���:~N7KtP�������S\0�@vǎ+���͔�*�����N�v��Ν;[y�����wdd�ӛ���,y��>���������ӟ^tî�������t�btt�ҝt�o��___y=CCC9����2Xm��Ӄ��9��r�|��v�������YrJ5[ř%:���Y��`���T%̭왹���*k۵kW^w�X�� ���)�<w��Wׯ�/ԫ��fɅ7T�U�Y��:؝U����Q�_��ù̋��ҭ[�.��Q�]���񏹇�r�r�r|�պ�YrR5[ř%:���Y��`299Y�^����q{.����g*�x���[s���e�CCC�~�\\SOѥC�ӛ���Y�j��3KtP�����l~j��WzĞ㼸{Ϟ�j���r���e��fggӑ�Ja�\\6l��]�+6?K~���������t0M������\\�֯�/�9��6T�]m011166��y�;���۹Q����}���,9�b�x%+��eo���l���6��j[�\r;�Ġ\\n�f/Ͻ����t0M��{Qs�7߼�f�\\��<Gٶm��ݻW5�=���|߂^���?_>\\u�U{��]tm�y��F.c���+��ޙ��[;gI:��^r�6������T�j�\n�+>6Wp촹���`�\Z�k[[���7��!�]dxx���X�<��ѣ����m�J��W\\Q>#|�����?^�(s�L���z%�VX�m#��I����%�o��`������V:��\n�mb�6�[���N�\Zin�;[���Q�j5fG�����05�9��*}RIu�}�Looo;7���&W^y�M7�T~|���V\\��ݵ�����\n�������Tּ6:x���򍬭z�����r��\\�Gz����X����&+XI{:[�V>�d�fG�?m}+�9�H:hs���%�����:�W[��,Z�r믽��%\\�+oe��R�W�ߥF�pe�������\'f�[������Sw7�T��f�g#ғ_g{\n��J�k�O�6U���>��9�����sG��!ϵs�����ʩgd^:���d�\r��bU���dW��^����~[�O�s����F��ȵ���x;*�64�͌�����ګ��z�=���lq:��F��U��?���V�st�U��r����*�O\'��~�������ʵ���-Vy%\r���b��603��/r�vΒ6t�ٽ�x/jWX��EV_���`�;y�˗<����-���w�8�<M�\Z�����+��#��9������{��j�;�ȣ6lh����������p���x:1U_;&�Q�������7��%K^^��E6xgV��k����{�J+?Q�]Wu��N�`�5u�t����`�\Z����]w�>/�;r�������7D����ڵ+������n�L;7jjjjbbb�OjqF68K�O���lf,wm�<��\\A�.,�*�Zx�[-����߅\\r�/وF�_���`g����;w�7-��s�w��Q^���h�[!��E����j�ۼy�}�:���Ϥ/�X�+�|�Ț���_rѵ����K͘V����N�nA^[T��`��:����:�\Z7��������tpff�|n���{���|�ŦM��+Oi���Z�]�o�HG{:���r/�Kgҋ�Z��T�~??5|���o�u.ym.�[^O�[� �-jj��\r~[�S�{�wp�}��z�,Yib#��lg�����������7�yQ��dы�+S�]m��/�~��;��;���?���bU���u#k./S�E����rae�KͤV����N�nA^[T�6�L�vԍ�ˮ��\'���5���㥩á��.��;���t0/o��^��St�o�R^���H.��@�ڠT*�[��)t�8_���ĉ����͟@�bUVR����:7�^`ѷ��_�ߟfo����t��E����G�eVX����v3��N�nA㛳ܑ��i�#+�y�lg���l�\r��O���~|��J���s���e����7�x�r.[�%GW\\U3�h��jf���_[�������ʛZs�[� ���`\Z�3��o���h����u��w{#���OEq:[���ڵ��	����pɋG�V�m����e��oْ�oB<w�H���No�̟@_T�Vqf��`wVq:X�q��rKQ�����D\Z�U���N�v�����\r�zc��7N��3�ެ��g���*�,�A��*N+�;���W�a+�s��_y��z{{8��=,�.�����I���?ɗ���[��w��ޠ%�%�g��`wVq:X-ů�k�)�5�	�y��2k�k׮|�^w����tz����V^fM���a.��%/>���������tp����ʳt=��xM��F������U1�0��st����M�6m�~��7N5�;_���򋶝ވe�ϒ�f�8�Du�;�8�533300P�R�KC��xR���]wm޼�z��}�����ڣT*�C�kR>k��޳\'-�-_H)��w���Y2���������tpI�����~{ooo�R����\Z]�ϴ*�.��I�ح�ޚ9]�eK�k���.��o�p�i��[?��_�+��Y�}�lg��vg��u��166�dn�544t�СU�?v�M�T���J�h�-H�Ϩ�0799��fi����w��x�{��*�,�A��*N/+M�4��\\45���GFFv��ݞϙ�ˀf���K/}���#��*�,�A��*N��`�\Z��}�/fϩ���3��t��va����s�f�ܹs|�����c�?M�166���-�A��*T��`�:v������-=q1{V5X##�355���-�A��*T��`-���m�gT#���3::��}��`WU;�<kY�T\Z\Z��C��eO��u���������t�>@u�{���B��5nfffp𚙙�,�V�U\Z$i�8��N�k	:���PE�`��}�J�d��?ɲ�TmMM�90���?v�Q��A\\�U��<]�T*���\r\r}bb�/O�x0������������##C��N��2tP�^��`��s�E806����R��fm��jt��4N:ݖ&�`5�.bK�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�M�\0�����E?�\0\0\0\0IEND�B`�',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('602',1,'baoxiaoprocess.bpmn','601','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"baoxiao\" name=\"baoxiaoProcess\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\"></startEvent>\n    <userTask id=\"usertask1\" name=\"员工申请报销\" activiti:assignee=\"${inputUser}\"></userTask>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"></sequenceFlow>\n    <userTask id=\"usertask2\" name=\"部门经理审批\">\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"com.web.oa.utils.ManagerTaskHandler\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"usertask2\"></sequenceFlow>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <sequenceFlow id=\"flow3\" name=\"不同意\" sourceRef=\"usertask2\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${message==\'不同意\'}]]></conditionExpression>\n    </sequenceFlow>\n    <userTask id=\"usertask3\" name=\"财务审核\" activiti:assignee=\"li\"></userTask>\n    <sequenceFlow id=\"flow4\" name=\"金额小于等于5000\" sourceRef=\"usertask2\" targetRef=\"usertask3\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${message==\'金额小于等于5000\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow5\" sourceRef=\"usertask3\" targetRef=\"endevent1\"></sequenceFlow>\n    <userTask id=\"usertask4\" name=\"总经理审批\">\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"com.web.oa.utils.ManagerTaskHandler\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow6\" name=\"金额大于5000\" sourceRef=\"usertask2\" targetRef=\"usertask4\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${message==\'金额大于5000\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow7\" name=\"不同意\" sourceRef=\"usertask4\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${message==\'不同意\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow8\" name=\"同意\" sourceRef=\"usertask4\" targetRef=\"usertask3\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${message==\'同意\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow9\" name=\"驳回\" sourceRef=\"usertask2\" targetRef=\"usertask1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${message==\'驳回\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow10\" name=\"驳回\" sourceRef=\"usertask4\" targetRef=\"usertask1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${message==\'驳回\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_baoxiao\">\n    <bpmndi:BPMNPlane bpmnElement=\"baoxiao\" id=\"BPMNPlane_baoxiao\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"360.0\" y=\"50.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"BPMNShape_usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"325.0\" y=\"150.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"BPMNShape_usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"325.0\" y=\"260.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"360.0\" y=\"380.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"BPMNShape_usertask3\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"160.0\" y=\"370.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask4\" id=\"BPMNShape_usertask4\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"510.0\" y=\"370.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"377.0\" y=\"85.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"377.0\" y=\"150.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"377.0\" y=\"205.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"377.0\" y=\"260.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"377.0\" y=\"315.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"377.0\" y=\"380.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"36.0\" x=\"377.0\" y=\"328.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"377.0\" y=\"315.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"212.0\" y=\"370.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"96.0\" x=\"252.0\" y=\"329.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"265.0\" y=\"397.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"360.0\" y=\"397.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"377.0\" y=\"315.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"562.0\" y=\"370.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"72.0\" x=\"429.0\" y=\"329.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"510.0\" y=\"397.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"395.0\" y=\"397.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"36.0\" x=\"421.0\" y=\"380.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"562.0\" y=\"425.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"562.0\" y=\"473.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"378.0\" y=\"473.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"212.0\" y=\"473.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"212.0\" y=\"425.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"377.0\" y=\"459.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow9\" id=\"BPMNEdge_flow9\">\n        <omgdi:waypoint x=\"325.0\" y=\"287.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"268.0\" y=\"284.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"268.0\" y=\"177.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"325.0\" y=\"177.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"278.0\" y=\"221.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow10\" id=\"BPMNEdge_flow10\">\n        <omgdi:waypoint x=\"562.0\" y=\"370.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"562.0\" y=\"177.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"430.0\" y=\"177.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"530.0\" y=\"246.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('603',1,'baoxiaoprocess.png','601','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0�\0\0\0��3s\0\09VIDATx�����}���xM�X��7�_VI�W%�O�#^��JmX�o�W�J(`DK��Pr���\Z�S�G�\"�%�Ԋv��`�\0��n�!W��g�b�Ę,ú>�����{w`<��������y>��iovf�=�~�k^;�{7�\0\0@Udw\0\0\0 ��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0\0\0\Z��\0t��(�bqdd$�ͦ?��dĔB�P��ew\0̨�\0�LC����b�5���;v>����~���r�x|hhh||\\vg�\"�\"\0����J�Ӣ���ܼ}���75�J��e���\"\0�%Ύ��9�Cƶ��}�֭۲e��(��\0@�Q�(hr����z����G��t�V��)\0\"��@GDI444T(]�7��z�ժ�\r]TE\0:���:/���i�0�V\Z\0Y��\0,���h\'7�Z����lV�f�(�\"\0�455�J�|,��v�wm߾]���\"�\"\0�$J��/��*:���U��G�{TE\0�X,f�Y�K\"��{�����do\"�ȡ*��t��&�t�hppP�&��\"\0����x<ޥ�Hkk׮������\0����g����|��U�C۶\r��P\0�BU��-[�l߾��Uю�ϥ�i�\n Z��\0x��d����Nڑ�GW�J��P\0�BU��.}\'��NO���b�7@�P�lpp��[ǻZ�60@��S$\0�%��_:DU dH:\0<��+�sE\0d�*�Y>���c�u�*��k׮���\0����gccc�����VE��ڼ���7@�P�Z�&��VE7n,�J�7@�PX��~�����x<�(��-TE\0��7Ѿ����D\0�CU`1EI$���E��ϬZ���j�7@�PX�B�pۦM\\(\ZTE\0�+��21�%�/Z�f���3��@QX�z��v�Z�>v}⽓�$:r����QTE\0:R�TDa$J��K���r�SO?#{�\0DU�NMMM�Y�f�/vr�L�V�D\0�*��z��nݺx��{\'=�C���|���n���\0QGU�������������臏=&��ޯ�ZJv�����j��֭[���Wn�E={_�g��Ĕ����6m�l���j�*��\0�!�\"\0�S�X,���5k�\\JL%Q�P��벻	\0��*��B��\0p@U��6\0��<���\0y\n@/P>��^�*|�)\0�@U ��S\0z��@�\0�U��#O��\"\0�G��TE\0��<���\0y\n@/P>��^�*|�)\0�@U ��S\0z��@�\0�U��#O��\"\0�G��TE\0��<���\0y\n@/P>��^�*|�)\0�@U ��S\0z��@�\0�U��#O��\"\0�G��TE\0��<���\0y\n@/P>��^�*|�)\0�@U ��S\0z��@�\0�U��#O��\"\0�G��TE\0��<���\0y\n@/P>��^�*|�)\0�@U ��S\0z��@�\0�U��#O��\"\0�G��TE\0��<���\0y\n@/P>��^�*|�)\0�@U ��S\0z��@�\0�U��#O��\"\0�G��TE\0��<���\0y\n@/P>��^�*|�)\0�@U ��S\0z��@�\0�U��#O�B� ��X,�J�ă��A���+��T*��\0��\0t˓O>9�b����bQv�\0�U�nQe�ҥƒh��Ճ���z]v�\0�U�.����/��r�*����ew\n\0�Q�+Vh%ѦM����(�{\0֨�\0t���?�d�Qe2>Q Ȩ�\0t��7߬UE�;\0v��\0t]�VU_�pTE\0z��� ��S@�)�R(r�\\:�N$�=(\"Ķ�=��f�����\0\0ڡ*B�T*�j@�D�?����;�=:;7�&�]쁉��͛7�}\"j#ك ��������|~�ƍ��:6;7K3�����9�ZM�@�\" lDI�J�~�أ�s3�v��Z�vm�Z�=\\\0���|>�,����ێ�Ϯ[�E�� @���P)�J7n��Whn�7�y߶mߒ=h\0���EQ��[ǫs��hn���֬Y�R��*�c||<���͟�������q�H�m���X@CU�G6��x�?.�D6�ZU߼��>��2��Q�NϏ=��O���=�����V�]g�gϫ����[�^�Hi/�L�R��@ P�L&�?7FkӪzfA=5��?��U�?��.�jhC���zlF=v^�*�y�G??м\\t&�m���X,&{�\0U�x�����槵&\n��ԙ���\Z?�����~�/�μ���WOͩ�ϩuU}v��ͪh:�m��F��\\\0�G��9�7��y��9u�3����}����������s�l�Zz��e#ը�\0h�@x4+���[�*���8��3�Ω���L�>60��O6ܻo�i�H5�\"\0\Zr���޴;h\'ϩo�V�=��=��+V|��+�]����TE{^�gZ6R����\\\0�G����M�znA}_i\\+:q^ݹ�r㚛>���^�����:=���i,�kr�i�H5�\"\0\Zr��>?��޴��(�Nͩ̪o��{�`u��n������E}WQOΨ�.ڵ{�i�H5�\"\0\Zr��&�~�˯���`er��¾����������������?����_�<p���z��m�mҫ�\"\0r���hVE��=����[�񭷚�T�*�!\0�Ѭ�NҼ6�\"\0\Zr����{4�����\\\0�G�*:A�ڨ�\0h�@x4��wi^U\0\r�\0�fU��k�*�!\0}�P(T�U˧�UQ�浵��lv5�P�*���Ç���/_�|bb��,U�/UQ�^���۵�|�u�Q�AU�EQ.��2턽dɒ�|�3�sv�*���f����\n�Ll�*���~U�;����۷�b1m\'�����ZM�H����3�<m,_�-[v�w�jImVE.��.e�b��]��8�qU��v�菍S�_�q��W�T>��O_nhh(�H�p\0�CU,��E�����H�#�$jSC���ǽ6O�i��\"�d�*��_m&.n����8\n0ǅ~���T*��uه/`��XQe��X,�e��Gz�����Z?�d�D*���ᵢ���ڽ�qz��Ɖ&��[��ٺ7|�y�H�ݗ���O|�z�/_�J��=�Q ��~���%����q��bQv׀KP��j5�-���.�ak\'�d2���}M�,\n�������f�������-���qU��\Z��ێ;A߇�RiժU�_����K�jw\'�;��;���\"�q�����:��o�b1�V;�H�nC4k�_yj�Y�����%˺��MZgX�Ж2�FQ����\\�R���ϩ���r���+����$�*�*��tZ��!D7���-o�uX�{�Zr|lZI������TW���4b���-�eh.�{[vG\0�\"�q��h��D��5����q�v����u=�c�R����[��i��\"����졋:Q������;��#\0�\r\r?e7j����f\\���v󛦷Ӻ�i%�~���`�r�v��C�G2��S\\��\\\08+��lVv/�5k�7״e?*,f����ت��XU���6�s�v�C���[������\"�\\\08�d2�RIv/�5k�_zm�%vS�O�Y������ƙ��[���YvL�С�R�$�Iٽ@��\0�ZmppPv/\\i�Gݷ�ʋ������ �^�f�q�J���>e��ͱ����[�1r�_n��VEGh^UQpp\rr�\0}���U��4���(8��MB�\\\08H���l�\'TETE���A.rࠏ>� ���i^UQpT��D\"!��.r�@����W_4���h^UQ�0�������Ik]�*�м6NÁ�p@\"�p�G9�Y�J���h����Dࠏrt,;wn���+4O���8\nHD��(G\'�7�����!���GC$\"�\0}��3��OJ��_�ܷW+?����GG��Q��Cz��_���������!�\0}����j2��s��� �e�fo.�������!�\0���G\Z�,�/�ܴ/�m.��=h�Dq�p�_9ZQ�t�s�����h��VۙL~�^�%{�p��:�2��rt�RI�n�T��:Ek�DI$��r�Q����;�&�s���(�FG�LU��Z[���d2Q.��쁂�~<�\Z�Os��(���t����՞U�}�z������6f�i�X��Z�q�p��9�\\.��48�[�Ǘ�rDa${X`g���8�;�p@��.q�A\"�p@���.*�����}�n�K�\n$\"�\0�h_����>�9��F�D�@\"�p@���.*�����}�n�K�\n$\"�\0�h_����>�9��F�D�@\"�p@���.*�����}�n�K�\n$\"�\0�h_����>�9��F�D�@\"�p@���.*�����}�n�K�\n$\"�\0�h_����>���m���n�ހK�\n$\"�\069z��4�i���v>8������>���m���W�+��l):D�@\"�p`��-�YNY���$:[�*���x��,�!�Ӎ��\0������>���kE6k�yz��Rt�P�D����1^�q�V��A�EgK�!B|��9�eU�4���>��c���h��6�Ζ�C�\n$\"�\0�5���ݬ�����l):D�@\"�p�����Z��n�9�������>���;hz%d���E�<4������>�9��F�D�@\"�p@���.*�����}�n�K�\n$\"�\0�h_����>�9��F�D�@\"�p@���.*�����}�n�K�\n$\"�\0�h_����>�9��F�D�@\"�p@���.*�����}�n�K�\n$\"�\0�h_����>�9��F�D�@\"�p@���1Č���@*�����}�n��D��<�a���u�G��Ѿ`7��iL�u���@W|�r�/؍abye�r���{�*�p@���1LL5�e1d|`�qFU��\"�\0��E+\nb��b�T*%��W^ye�R��5t���P�y��/��8 G/ړO>��1�����E�]CGL���{�n�wp����MQ��K�\ZϠ�W���벻������~A��ѝ����/��r��x��w��|`��\">m�~G���Z�b�Vmڴ)�H(�\"�G�H��>�#�������;����/Y�D��L&�\'�B��Z�\r7�z����;w��7kU���7ƏZ���rY�5��G�3�p@��\\�V��/��\r�8HD��Ѿ`7�%B|����ъ�\n�\\.�N����G=BLl���lv||��p�|ġ�|����ѥRIT�$z���w��y���ٹ�h6��bLLLl޼Y�Q��տGB���c�����|~�ƍ��:6;7K3�����9�ZM�@�B?q\r�p�w9Z�D�Tꇏ=:;7Ckמz���k�V�U����;�&��rt>�o�D�i�m��g׭����Y�q�p�_9�T*mܸan^��i���}۶}K����u�!d>�A�hEQ��[ǫs��hn���֬Y�R\n�>:�>ࠏr���x>���?����?t��u�R�j۶�5��6P��C�|��>���lv���Xm��kU}�����ʌz`F�;=?��s?=~j���?��[Qw�U�=��ݮ�wn�Kz�\"���o2�J�:\\�GG��b�~�7��d�С�s�g�&�.ӪzfA=5��?��U�?��.�jhC���zlF=v^�*�y�G??м\\t&�m��I1Ĳ�QA\"�p�H$�����x�����槵&�.g/�3\ZO�/4~���������_>��yU==���SߟS��잗�U�t4��@a8 �8H�RSSS�{�J��9�7��y��9u�3����}����������s�l�Zz��e#�8\r\n��>�A:�.�˲{�J���_�5��ꉳ�;�Ꜫ���$o�a`�c�[�d�q�������T�4($\"�\0�|�_�mV��9�7���s�ۧ�wϫ{�rŊ���eW<w�%Uў�����T�4($\"�\0���e�feSכ��܂��ҸVt⼺sO��57}����:~���G�UuzF=;�Xp��Ӳ�j����D�`jj�_��-N\'���M;����Ԝ������V������ޝQ�Q�w��*�]�����T�4($\"�\0g���}���M�Mz���_}}����T�}��~�������|��}�����6y������?>vۦۤW\'TEP�� �8ۺu��^8kVE��=����[�񭷚�T�4($\"�\0g�������-�fUt��q\Z�|�+}��FUt�=���i8PHD�n�+�ͪ��k�4($\"�\0���z:�raԬ�ޥym����D���(�|~�֭�B��ͪ����i8PHD�����%�����}]�Y�h^��@a8 �,F�^U���`*�\Z-���jUv������DБ������t:�H$D6?��lv�R�K�{\'�Y�z�~A�Y˿u�r%�ڬ�q���x}�v+�q�!�|���ժ��)���(}�x<n�:,��\Z.\\x�S3�&�)���-���u�Ɖ�9�,�%�U�{���i8PHD���,�w����Y��̦��3�ؿ���.�l�f�C��HD��Ѭ	��Ԍ�h��)��-n9g�R�٬����8Q��SW�w���E$\"���h�Ǽ6m)}Yӯ�����R�^�i=���>�X����m�����E$\"���h��r����2��f�����غr�n�V�i�M[!{�p��> <:��k�NfnWĴ�b6���*jW]Q�\0��> <�����ZK�񦾒����Vb��v뱟b�ظN7=t�d.b8 ��G�8X�zj�E�������;>e\\�ť��Og��C�;A���\"�|@x4��7<5�\"�cCb1����K�fh7����;v�~\'�:\\�p@\"��fM�KO��z�/[Wb�Z}ǥ����Y}zk����d.b8 ��G�&8�����r��B�z��Ŗ��^���Zv��z���C��HD��Ѭ	�м6NÁ�p@\"��fU�:�k�4($\"���*�*\n�|@x�����a���i8PHD��Ѭ�^�ym����Dͪ�B��8\r\n��> <�Uѫ4���p�0����#��;�a����i8PHD��H$�x��h�\Z��@a8 ��G&��Ii������j���dR���\"�\"HD��1:::<|��:���?�?���e.�*�D�j5���9e�z��e�7�E�C���� ���HÖ�e�����2�\r��*�D*���ӟ���WU=@�o���d���.ك�KPA\"��J��J�P�Uu�֮��H���򣲇fTE���BhrrRF�����i��X�n2�(��I�@�U$\"��pRex8�N�4>�W�ڳ���V��w��7���l6-�\"X�*�Df�r9������\Z��@<�<�� \n#��;TE�����R�H|�@�M ���XTE���\"att4�JI�@�Nu�j5��f2��\",*T5r��?444<<�(��n�TW*�D�(}��$���� ��0�.MNN��H@Ou��(�HpC-8�*����\\\"��TW�ո�A���Pp.���Z@?Tb*A�D��S7Ԃ�/BaE���KD�>:�i7���47Ԥ�PA�|@����Nu�r9�L�]Z��e�%Z�.T&���|�Hק�:�oEmT(dw$B�4T�ǂ�H׿��Z���帡�3�*��W}q�H��:n��L��\n�\Z���>�D�ǩ�j=�PA�\"��>�_��t�9�qC��B*�G�7��8����%\"]�Nu�\r��[�rC�w!����\'A�فK�_�@{�m�~��t����8\r�J��V7ti/�=�����ACӽ����cTE����dZl̓�r�M�t�LݜZ_}q���Q>����6g_��v2O�K��������)�W>�����\rD����֘ҽ}�\\t�o�*�8���N�<u�O.�����|��/�,O�nfk��M�����d*����Z@��Q��n\0=@�A\Z�Ӥ魰�U��\rw0ϑ��������3Cs�x�ó��)\r�D��TY^i��c`�7Ԃtt��nPA\"�ؤ����[a�ǭ,_ڦK�ϲ��[O\0O(=r3%D��t�\'u7��{ʱh���j~6!�r�/���s�\"� ����2��WE����\\�����_�~��0�94:M���-T��t��iG�l���u\r�C)��7�:<:��ӳ��t�(PC��!� _�$h��l+!7�4Mt>7��z���X�Av{�0L����\'Bu�Hg9�j˞�<�[VE��ccc�Db��희����4��.�RTS��|�ñi=/z��Z��خ��~V�o�����Ƨ����k���KD:O嬛��M�*]�^߲e��А������a��r��l6�F5w��w>�g�n�x2p|O����$��tk�gÛ��U��\\jz����T���]^?��GL{��`�#�:\"`DI$\n#Q-�ڢ��5��.��O[�|��������r��ݼ��S�9��|�ݱ�7�?��ٗ�?�<��r�� ӹ�]�������P����*��m���qD�|���\r���n�fN�n^�ͳ�;x�/���^Ud31h<�P���\\���H7M$p��f|`S���Q���p=6B�����*2�sS�¦/N��7��::c��E�ؾN��&��B��KD:Nu&�n�E\n��>�w��z>���rѹD��T�J���J�<}C-�HD�=R*����Ճ�S];SSSCCC�\\��j���\n$\"����.e2�(��8���>z?66&�#�*����+◈t����y�֭�P#T �t���8չ�\r5B|@Wp�ȄS�\'Q��F�@\"����,q��J��V.�e���HD�~�Q;��gjj*�N�r��ل\n$\"�\0p����Nh�sttTvGz�P�D�.9�T�!Qv�0�\r5B|@G�D��:_T*���P#T �,����T�p�P#T �,����T��P#T �x699�%\"�8�uC(o�*���<PE�A\Z\Z\n�I�78�uO�PH$���\">e���\n$\"�\0�&\'\'S�TX?��m��J��E|�J%�}���>��~��R���K��T�\">3�L6���k��\n$\"�\0\\\"����)�}}C�P�D�p�}��~z�KD>�T�K}}C�P�D��s�=\"/]���ޚKD��T�{�n������x �W�HD�!�v��=�t�7�E�KD���N���ȈV���u1�\\s�r�]�F�@\"�Q�r�J�*������~��;v��Q7p��H�C�*J&��R�{�����x\\TH��f�P�D\"���Բe����#�_!ĩN�j�������.��lذAv�,*���Ct�7ʱX�T}�_��r��B�ꤻ��L�~�u�}��ߖ�/3B|��l6�lٲիW�����5�\\�L&�����W���N���a1\n���7�pêU����\n��_����]�P�D�khhH�߫��ꦛn\Z)���jUv�B�S]@� �.��[o����M1.����ew��\n$\"�Q|Ѭ�8�S�TJ&��H�ݑ�HD�E��\n�B.�K�ӉDb �Ķ�=��f��ǃ�M���Tld\r�!��S�\"��c^$��|�ΝG�����f�.������͛�>�D� β�4��R��@�-��W^����!3���*�\n�\'��oܸ��[�f�fi�v�\"�����S3��|������ׯ��Z&���@f�UQ$��\'ެ��Gg�fh��SO?�v�Z>p�#EQ�.]j,�V�^=88ȍ�� 3�`BU	�`3�ٷ;�]��+T����/�\\���������\"3�`BU~�Ri��\rs�\n�M��7�۶�[�-TV�X��D�6mJ$����d��*\n9q硷�W����ܴ�3�Y�������_�d���2��(\n2����Bn||<���͟��������q�H�m����<���曵�HvG�!2����B.��N<�߆��V�7/��ϩ�̨fԽ��cO<���vϪ����u�Y������:x疻��!)�}��TJ�ЅJ�VgS�g���\0KTE!�L&�?7Fk��4��g�S�����YU��xpಫ�6d�ϩ�f�c�ժ��W���7�g\"ئϜ��b��.l�+�ABf 3�y*����{\'���OkM���ԙ���\Z?�����~�/�μ���WOͩ�ϩuU}v����7��)�s���ő��l6��H&�S����0r����\0�\\3�֛��̼z�:{���������o}����n�����fN|��e#��}�Ő��?��J��o���_I��P!3�`��f��_�5r���Y��iuNUggf�7�00𱁁ح�ٸ��}�M�F����\\.\r\r��Ю&�H��i�=q3��<=�_����\0�\\3���@�:�xG��i�����C�\\�b��.�b����~I����>Ӳ�j�>�E���!�J}�ߜ�xb������nܸ�4g6�����e��7=e�����@f�%8����7���}����yu�ʍkn��o_{u���ˏΫ��zv����=�e#��}��j5�%�{��z�?�ηk\'�;��<���XM\"�����e�m�\"ˋ@����Ed2,1�!\'�������\"���S?���^<X]���[��?xwF}GQ�Uԓ3��~�v�1-�F�s�Z���F�	2��}=d��x�A}�X,699ٛn�b�׊Zg믘!3�`�9S�J�_���=X����������/�|��v���o<����������&>������n�t��D�8EQ�W�ڶ�e=dl�?�o�ү���i��?��T�kE�5��U\"\r���\0Kp�5s���v�=w9����[MF���\\��rz�LL<���Hk{_��ǵ������T�X}Z�qb(���0c�C���NҼ6r��bQ?Y.�*��=��3����ƺ�g�b������U���\rd2,1�!��}ޣym�>7R��V\rd2�K\"��1\Z����\n˺GU��Ak��~Af 3�r��w�浑�\n�\\��b��:�KUtz������[�v����f�[+\'��}��@f�%8䚹�]��F�s�N�����{��KI��>����x<����X�L,2����k�wh^��^�^�o-�u�Ho�V%�5����m�����}4�w���@f�%8䚹�F���}j�Y�Z�|j||\\��鴿%�hw��ᗡ����v.����\0���ܷ8��J��˗OLL��ݲe��l�_=km;v>��|hh����z���oמ���(�:Af 3�r���략֗s��9�O�f��}��\\v�eZ	�dɒ�|�3�*$��hO=��3�WEG��V�H$�Wܾ}���Ń��������8rs�{J���\n}z�2\\b�CN�.��o3�,�S6s��|�ݜ6�ҍF����LX�l�wܡ}a^�N�ޗ��^����x�J��O}�ؓ��!c��E�� �9TM-p�Ɖ�.s��2\\b�C����ی�4���)�3�y�6����_Q��Z���y���g�Ǘ��q�/4�&�{`�[����i�e\'utr�\\�M[���	�<��t�ն[V�[d����N����Z���&Q�T*�T2�Ԧ��СnTE��2���g���/}���;�|��T*%{��7_��v+i=Z�sZ�����&o��\n��`��f.8�o��i�iz���q��W}J�Th�Z��|�4��e�d�w�E���}M�,\n���%�;��$:��Im��?YT*�V�Zu���kO-]���?~)�>�Vb<`[��Mް��+,g�7W�B��f:���M[��>]���ش��S6��׺4���]�N�:��|��X,��d����(�����ym��G|��~q萶r�!Q����\\�RL?���z�KBŗ#��JZy�c�xD���5WX���\0����U�I�Z\nˢ�r���}�+����_��e���^=�m���\\.��Ң?�W�o]��P�*rs��;Z�1��r�+��\"���\0�\\3)��o��i������M\n3����j[���6��@�T*�h�����g���֭[��\\T?�74��z�X&�֜`y컙�.!�&�7��zp�5��B�ߦ�����if�_�OV�h�B�o���D\"�����>�D�+L���#ߏ �\n�Wn�%lR��\\њ�������\0�\\3)�э�����/g�b��zZ��v�/!{�nxxX�5k��x��+�ܢ�6�����0���V�\nL�e��?�]�\nSO���+c�B��f.���M[m��MSgX�S��.m��r�Ct�z]��B~�ߏ]/��_\0���]���c��?�K���Da�19���W� 3�r�\\p��f\\��q��Z��_��S�k����k�=t}`llL�X,��W�=��Y[�l��q!����z������q˵���O���n0�!��Gh^�ϥ��!�#\n�N�����3k֬�W��8�62����k��i^�ϥj�\Z���jfq���[���(���eٛ~d2,1�!G�#�u�(b������ww����Ў���ޠH 3�`�9q/,�ym�>O�Ţ~�h������~��%��6m2~����g�dXb�C���^�ym�>�*���/c���l������Gٸq�qfQTq㬗�dXb�C���*4��ܷ�z}ddD�w�&k׮m�T.����=Ff 3�r���*�k#�-��o���(�NONN��r����\0��xw~�����Wh�\Z��C��\nQ�R)S%�H$�����۹>$���\0Kpȉ3�o�ta��S#�!��dXb�C.�����}A��}{���d2){�.\"3�`��(�FGG��M�����C�|^��]Df 3�UQ�U��d�甽�A�˖��\\,e�Ed2,Q��HÖ�e�����2�\r�:2�����OQ�t�s�����h��V�)�@��d\Z�ud2ZQEB�RI�n�T��:Ek�D�\'�r�Q������\0�������ot��Tu?����M&��?�(���dQE��(���t����՞U�}�z������6f�i�X����QEN�\\���hp�\\�O�p�Ǘ�rD��=,�dd#2CdQA\Z���VdHDU9v��-ސ��u�,�W\r�C�A��+W�������; X�� �	~�a���u�]755%�;\0��|�z��Ŵ��+��馛d�@�PA\"����f���X�r�����N\n�\"HD���z�`���zEQdw\r@ PA\"�=�裏j�Ѝ7ިWE��������\"HD�~���]u�U�D\"���7�t��R�PA\"��655U�VՏr�x���\0訊 �i�}\0Z� �i�}\0Z� �i�}\0Z� �i�}\0Z� �i�}\0Z� �i�}\0Z� �i�}\0Z� �i�}\0Z� �i�}\0Z� �i�}\0Z� �i�}\0Z� �i�}\0Z� �i�}\0Z� �i�}\0Z� �i�}\0Z� �i�}\0Z� �i�}\0Z� �i�}\0Z� �i�}\0Z� �i�}\0Z� �i�}\0Z� �i�}\0Z� �i�}\0Z� �ib���(�{ X�� �i�D�Z��\0�BU�>H�J����d�@��j���Aٽ@tQA�t:].�e���5��V��DBv/]$H������e��3`�q��Go�J�L&#��.\r�%�(�d��cS٘�2�J=)#M�{��\"�@�J��L&e����7���=�墨�d2�RIv/]d���#�嵢�٨�\"�V�%	�`$\"�@�����[���z��Z�>W����\0��5�I�)o\r�D�A/�@��VMd�����t:-���U׊\"�/�\"�5�odd���Q���i~D���ؖ-[d��*B0g2�z�.�#�\"7��6I�2����yJ\"�AQ*�����,�ETE6��Ļ���1q�s��A�A��,)�\"�%3��x��	�v���|����;��f��Hߺu+�(d��(�RITE�t��\0��8������\"w�@TE\0\0\0\rTE\0\0\0\rTE\0\0\0\rTE\0\0\0\rTE\0\0\0\r�xA�S\'Í\0\0\0\0IEND�B`�',0);

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
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('305','LeaveBillProcessTest:1:4','301','301','usertask1','306',NULL,'提交申请','userTask','zhang','2019-05-14 14:27:02','2019-05-14 14:27:23',21217);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('309','LeaveBillProcessTest:1:4','301','301','usertask2','310',NULL,'主管审批','userTask','mike','2019-05-14 14:27:23','2019-05-14 14:29:52',149265);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('313','LeaveBillProcessTest:1:4','301','301','usertask3','314',NULL,'总经理审批','userTask','danny','2019-05-14 14:29:52','2019-05-14 14:30:45',53915);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('317','LeaveBillProcessTest:1:4','301','301','endevent1',NULL,NULL,'End','endEvent',NULL,'2019-05-14 14:30:45','2019-05-14 14:30:45',0);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('402','LeaveBillProcessTest:1:4','401','401','startevent1',NULL,NULL,'Start','startEvent',NULL,'2019-05-14 15:13:54','2019-05-14 15:13:54',10);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('405','LeaveBillProcessTest:1:4','401','401','usertask1','406',NULL,'提交申请','userTask','zhang','2019-05-14 15:13:54','2019-05-14 15:14:20',26619);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('409','LeaveBillProcessTest:1:4','401','401','usertask2','410',NULL,'主管审批','userTask','mike','2019-05-14 15:14:20','2019-05-14 15:15:13',53136);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('413','LeaveBillProcessTest:1:4','401','401','usertask3','414',NULL,'总经理审批','userTask','danny','2019-05-14 15:15:13','2019-05-14 15:18:51',218435);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('417','LeaveBillProcessTest:1:4','401','401','endevent1',NULL,NULL,'End','endEvent',NULL,'2019-05-14 15:18:51','2019-05-14 15:18:51',1);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('606','baoxiao:1:604','605','605','startevent1',NULL,NULL,'Start','startEvent',NULL,'2019-05-22 15:11:32','2019-05-22 15:11:32',11);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('609','baoxiao:1:604','605','605','usertask1','610',NULL,'员工申请报销','userTask','zhang','2019-05-22 15:11:32','2019-05-22 15:15:49',257272);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('702','baoxiao:1:604','605','605','usertask2','703',NULL,'部门经理审批','userTask','mike','2019-05-22 15:15:49','2019-05-22 15:16:41',52075);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('707','baoxiao:1:604','605','605','usertask4','708',NULL,'总经理审批','userTask','danny','2019-05-22 15:16:41','2019-05-22 15:17:51',70182);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('711','baoxiao:1:604','605','605','usertask3','712',NULL,'财务审核','userTask','li','2019-05-22 15:17:51','2019-05-22 15:18:55',64204);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('715','baoxiao:1:604','605','605','endevent1',NULL,NULL,'End','endEvent',NULL,'2019-05-22 15:18:55','2019-05-22 15:18:55',0);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('802','baoxiao:1:604','801','801','startevent1',NULL,NULL,'Start','startEvent',NULL,'2019-05-22 16:31:42','2019-05-22 16:31:42',9);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('805','baoxiao:1:604','801','801','usertask1','806',NULL,'员工申请报销','userTask','zhang','2019-05-22 16:31:42','2019-05-22 16:32:00',18030);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('809','baoxiao:1:604','801','801','usertask2','810',NULL,'部门经理审批','userTask','mike','2019-05-22 16:32:00','2019-05-22 16:34:10',130480);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('814','baoxiao:1:604','801','801','usertask4','815',NULL,'总经理审批','userTask','danny','2019-05-22 16:34:10','2019-05-22 16:35:25',75188);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('818','baoxiao:1:604','801','801','usertask3','819',NULL,'财务审核','userTask','li','2019-05-22 16:35:25','2019-05-22 16:36:36',71132);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('822','baoxiao:1:604','801','801','endevent1',NULL,NULL,'End','endEvent',NULL,'2019-05-22 16:36:36','2019-05-22 16:36:36',0);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('902','baoxiao:1:604','901','901','startevent1',NULL,NULL,'Start','startEvent',NULL,'2019-05-23 15:48:33','2019-05-23 15:48:33',11);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('905','baoxiao:1:604','901','901','usertask1','906',NULL,'员工申请报销','userTask','zhang','2019-05-23 15:48:33','2019-05-23 15:48:40',7593);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('909','baoxiao:1:604','901','901','usertask2','910',NULL,'部门经理审批','userTask','mike','2019-05-23 15:48:40','2019-05-23 15:49:13',33951);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('914','baoxiao:1:604','901','901','usertask4','915',NULL,'总经理审批','userTask','danny','2019-05-23 15:49:13','2019-05-23 15:49:50',37867);
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('918','baoxiao:1:604','901','901','usertask3','919',NULL,'财务审核','userTask','li','2019-05-23 15:49:50','2019-05-23 15:50:32',42484);
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

insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('308','comment','2019-05-14 14:27:23','zhang','306','301','AddComment','可以，qb','���ԣ�qb');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('312','comment','2019-05-14 14:29:52','mike','310','301','AddComment','好的，去','�õģ�ȥ');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('316','comment','2019-05-14 14:30:45','danny','314','301','AddComment','总经理说了可以','�ܾ���˵�˿���');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('408','comment','2019-05-14 15:14:20','zhang','406','401','AddComment','国庆假期','�������');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('412','comment','2019-05-14 15:15:13','mike','410','401','AddComment','放了放了','���˷���');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('416','comment','2019-05-14 15:18:51','danny','414','401','AddComment','准了','׼��');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('701','comment','2019-05-22 15:15:49','zhang','610','605','AddComment','zhang 办理报销','zhang ������');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('705','comment','2019-05-22 15:16:41','mike','703','605','AddComment','mike 办理通过','mike ����ͨ��');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('710','comment','2019-05-22 15:17:51','danny','708','605','AddComment','danny','danny');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('714','comment','2019-05-22 15:18:55','li','712','605','AddComment','li 办理报销完成','li ���������');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('808','comment','2019-05-22 16:32:00','zhang','806','801','AddComment','zhang 提交报销','zhang �ύ����');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('812','comment','2019-05-22 16:34:10','mike','810','801','AddComment','mike 给予报销','mike ���豨��');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('817','comment','2019-05-22 16:35:25','danny','815','801','AddComment','danny 也觉得可以','danny Ҳ���ÿ���');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('821','comment','2019-05-22 16:36:36','li','819','801','AddComment','li 已经给 zhang 报销','li �Ѿ��� zhang ����');
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

insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('306','LeaveBillProcessTest:1:4','usertask1','301','301','提交申请',NULL,NULL,NULL,'zhang','2019-05-14 14:27:02',NULL,'2019-05-14 14:27:23',21204,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('310','LeaveBillProcessTest:1:4','usertask2','301','301','主管审批',NULL,NULL,NULL,'mike','2019-05-14 14:27:23',NULL,'2019-05-14 14:29:52',149262,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('314','LeaveBillProcessTest:1:4','usertask3','301','301','总经理审批',NULL,NULL,NULL,'danny','2019-05-14 14:29:52',NULL,'2019-05-14 14:30:45',53911,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('406','LeaveBillProcessTest:1:4','usertask1','401','401','提交申请',NULL,NULL,NULL,'zhang','2019-05-14 15:13:54',NULL,'2019-05-14 15:14:20',26612,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('410','LeaveBillProcessTest:1:4','usertask2','401','401','主管审批',NULL,NULL,NULL,'mike','2019-05-14 15:14:20',NULL,'2019-05-14 15:15:13',53132,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('414','LeaveBillProcessTest:1:4','usertask3','401','401','总经理审批',NULL,NULL,NULL,'danny','2019-05-14 15:15:13',NULL,'2019-05-14 15:18:51',218432,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('610','baoxiao:1:604','usertask1','605','605','员工申请报销',NULL,NULL,NULL,'zhang','2019-05-22 15:11:32',NULL,'2019-05-22 15:15:49',257243,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('703','baoxiao:1:604','usertask2','605','605','部门经理审批',NULL,NULL,NULL,'mike','2019-05-22 15:15:49',NULL,'2019-05-22 15:16:41',52068,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('708','baoxiao:1:604','usertask4','605','605','总经理审批',NULL,NULL,NULL,'danny','2019-05-22 15:16:41',NULL,'2019-05-22 15:17:51',70180,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('712','baoxiao:1:604','usertask3','605','605','财务审核',NULL,NULL,NULL,'li','2019-05-22 15:17:51',NULL,'2019-05-22 15:18:55',64202,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('806','baoxiao:1:604','usertask1','801','801','员工申请报销',NULL,NULL,NULL,'zhang','2019-05-22 16:31:42',NULL,'2019-05-22 16:32:00',18018,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('810','baoxiao:1:604','usertask2','801','801','部门经理审批',NULL,NULL,NULL,'mike','2019-05-22 16:32:00',NULL,'2019-05-22 16:34:10',130476,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('815','baoxiao:1:604','usertask4','801','801','总经理审批',NULL,NULL,NULL,'danny','2019-05-22 16:34:10',NULL,'2019-05-22 16:35:25',75185,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('819','baoxiao:1:604','usertask3','801','801','财务审核',NULL,NULL,NULL,'li','2019-05-22 16:35:25',NULL,'2019-05-22 16:36:36',71128,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('906','baoxiao:1:604','usertask1','901','901','员工申请报销',NULL,NULL,NULL,'zhang','2019-05-23 15:48:33',NULL,'2019-05-23 15:48:40',7581,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('910','baoxiao:1:604','usertask2','901','901','部门经理审批',NULL,NULL,NULL,'mike','2019-05-23 15:48:40',NULL,'2019-05-23 15:49:13',33946,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('915','baoxiao:1:604','usertask4','901','901','总经理审批',NULL,NULL,NULL,'danny','2019-05-23 15:49:13',NULL,'2019-05-23 15:49:50',37864,'completed',50,NULL,NULL);
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('919','baoxiao:1:604','usertask3','901','901','财务审核',NULL,NULL,NULL,'li','2019-05-23 15:49:50',NULL,'2019-05-23 15:50:32',42480,'completed',50,NULL,NULL);

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
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('706','605','605',NULL,'message','string',1,NULL,NULL,NULL,'同意',NULL);
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('803','801','801',NULL,'objId','string',0,NULL,NULL,NULL,'baoxiao.11',NULL);
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('804','801','801',NULL,'inputUser','string',0,NULL,NULL,NULL,'zhang',NULL);
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('813','801','801',NULL,'message','string',1,NULL,NULL,NULL,'同意',NULL);
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('903','901','901',NULL,'objId','string',0,NULL,NULL,NULL,'baoxiao.12',NULL);
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('904','901','901',NULL,'inputUser','string',0,NULL,NULL,NULL,'zhang',NULL);
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('913','901','901',NULL,'message','string',1,NULL,NULL,NULL,'同意',NULL);

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

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`DEPLOY_TIME_`) values ('1','发布流程定义',NULL,'2019-05-14 10:33:10');
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`DEPLOY_TIME_`) values ('601','报销流程定义',NULL,'2019-05-22 15:10:32');

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

insert  into `baoxiaobill`(`id`,`money`,`title`,`remark`,`creatdate`,`state`,`user_id`) values (1,'3000.00','test01','出差广州开会','2019-03-11 21:32:46',2,5);
insert  into `baoxiaobill`(`id`,`money`,`title`,`remark`,`creatdate`,`state`,`user_id`) values (2,'4000.00','test02','出差北京开会','2019-03-11 23:26:10',2,5);
insert  into `baoxiaobill`(`id`,`money`,`title`,`remark`,`creatdate`,`state`,`user_id`) values (3,'6000.00','test03','送礼上级领导','2019-03-11 23:49:05',2,5);
insert  into `baoxiaobill`(`id`,`money`,`title`,`remark`,`creatdate`,`state`,`user_id`) values (4,'7000.00','test04','请客户吃饭','2019-03-12 00:26:49',2,5);
insert  into `baoxiaobill`(`id`,`money`,`title`,`remark`,`creatdate`,`state`,`user_id`) values (5,'6000.00','test05','送礼','2019-03-12 09:21:12',2,5);
insert  into `baoxiaobill`(`id`,`money`,`title`,`remark`,`creatdate`,`state`,`user_id`) values (6,'7000.00','test06','出差北京','2019-03-12 20:09:00',2,5);
insert  into `baoxiaobill`(`id`,`money`,`title`,`remark`,`creatdate`,`state`,`user_id`) values (7,'8888.00','test07','去出差广州','2019-03-14 11:08:26',1,5);
insert  into `baoxiaobill`(`id`,`money`,`title`,`remark`,`creatdate`,`state`,`user_id`) values (8,'3000.00','test07','出差','2019-03-18 13:55:33',2,5);
insert  into `baoxiaobill`(`id`,`money`,`title`,`remark`,`creatdate`,`state`,`user_id`) values (9,'8000.00','test08','去广州开会','2019-03-18 14:08:36',1,5);
insert  into `baoxiaobill`(`id`,`money`,`title`,`remark`,`creatdate`,`state`,`user_id`) values (11,'11111.00','111','zhang 想报销','2019-05-22 16:31:41',2,5);
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

insert  into `leavebill`(`id`,`days`,`content`,`remark`,`leaveDate`,`state`,`user_id`) values (10,5,'旅游','休年假','2018-03-21 08:26:55',1,5);
insert  into `leavebill`(`id`,`days`,`content`,`remark`,`leaveDate`,`state`,`user_id`) values (14,7,'病假','调休','2018-05-17 08:46:25',1,5);
insert  into `leavebill`(`id`,`days`,`content`,`remark`,`leaveDate`,`state`,`user_id`) values (15,1,'事假','外出办事','2018-06-27 08:39:58',2,5);
insert  into `leavebill`(`id`,`days`,`content`,`remark`,`leaveDate`,`state`,`user_id`) values (16,15,'旅游','休年假','2018-06-27 09:02:17',1,5);
insert  into `leavebill`(`id`,`days`,`content`,`remark`,`leaveDate`,`state`,`user_id`) values (17,15,'年假','去旅游','2018-11-08 14:30:46',1,5);
insert  into `leavebill`(`id`,`days`,`content`,`remark`,`leaveDate`,`state`,`user_id`) values (18,20,'年假','回家结婚','2018-11-12 14:57:25',2,5);
insert  into `leavebill`(`id`,`days`,`content`,`remark`,`leaveDate`,`state`,`user_id`) values (19,10,'请假测试01','去旅游','2019-03-14 09:51:12',0,5);
insert  into `leavebill`(`id`,`days`,`content`,`remark`,`leaveDate`,`state`,`user_id`) values (20,8,'请假测试02','回家过年','2019-03-14 15:22:45',2,5);
insert  into `leavebill`(`id`,`days`,`content`,`remark`,`leaveDate`,`state`,`user_id`) values (21,8,'请假测试02','回家过年','2019-03-14 15:25:28',0,5);

/*Table structure for table `sys_permission` */

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '资源名称',
  `type` varchar(32) NOT NULL COMMENT '资源类型：menu,button,',
  `url` varchar(128) DEFAULT NULL COMMENT '访问url地址',
  `percode` varchar(128) DEFAULT NULL COMMENT '权限代码字符串',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父结点id',
  `parentids` varchar(128) DEFAULT NULL COMMENT '父结点id列表串',
  `sortstring` varchar(128) DEFAULT NULL COMMENT '排序号',
  `available` char(1) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `sys_permission` */

insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (1,'权限','','',NULL,0,'0/','0','1');
insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (11,'报销管理','menu','','baoxiao:manager',1,'0/1/','1.','1');
insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (12,'报销申请','menu|permission','apply_baoxiao.jsp','baoxiao:apply',11,'0/1/11/','','1');
insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (13,'我的报销单','menu|permission','myBaoxiaoBill','baoxiao:billquery',11,'0/1/11/','','1');
insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (14,'我的待办事务','menu|permission','myTaskList','baoxiao:tasklist',11,'0/1/11/','','1');
insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (15,'流程管理','menu','','baoxiao:process',1,'0/1/15/',NULL,'1');
insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (21,'发布流程','menu|permission','add_process.jsp','baoxiao:publish',15,'0/1/','2.','1');
insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (22,'查看流程','menu|permission','processDefinitionList','baoxiao:processlist',15,'0/1/21/','','1');
insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (23,'系统管理','menu','','user:manager',1,'0/1/21/','','1');
insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (24,'用户管理','menu|permission','findUserList','user:query',23,'0/1/21/','','1');
insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (25,'角色添加','menu|permission','toAddRole','user:create',23,'0/1/21/','','1');
insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (26,'删除流程定义','permission','delDeployment','baoxiao:remove',15,NULL,NULL,'1');
insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (27,'查看流程定义图','permission','viewImage','baoxiao:viewimage',15,NULL,NULL,'1');
insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (28,'角色列表','menu|permission','findRoles','baoxiao:rolelist',23,NULL,NULL,'1');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` varchar(36) NOT NULL,
  `name` varchar(128) NOT NULL,
  `available` char(1) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`available`) values ('0aeddab9-c1bb-4871-8f1c-68bc5f675fb0','网管','1');
insert  into `sys_role`(`id`,`name`,`available`) values ('1','普通用户','1');
insert  into `sys_role`(`id`,`name`,`available`) values ('2','部门经理','1');
insert  into `sys_role`(`id`,`name`,`available`) values ('3','总经理','1');
insert  into `sys_role`(`id`,`name`,`available`) values ('4','财务','1');
insert  into `sys_role`(`id`,`name`,`available`) values ('bca6d030-907d-481b-8248-9e36eceb8176','角色','1');
insert  into `sys_role`(`id`,`name`,`available`) values ('f7a38138-8210-4780-beef-aef49d40ab36','会计部主管','1');

/*Table structure for table `sys_role_permission` */

DROP TABLE IF EXISTS `sys_role_permission`;

CREATE TABLE `sys_role_permission` (
  `id` varchar(36) NOT NULL,
  `sys_role_id` varchar(36) NOT NULL COMMENT '角色id',
  `sys_permission_id` varchar(36) NOT NULL COMMENT '权限id',
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
