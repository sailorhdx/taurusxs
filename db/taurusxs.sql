/*
SQLyog Ultimate v12.3.2 (64 bit)
MySQL - 5.7.18 : Database - taurusxs
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`taurusxs` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `taurusxs`;

/*Table structure for table `act_evt_log` */

DROP TABLE IF EXISTS `act_evt_log`;

CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_evt_log` */

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
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

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values 
('9b57e62680104893a11c92f8b7850de1',1,'test_audit.bpmn20.xml','e3b870db640b4708a51f799da21ecf16','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\r\n  <process id=\"test_audit\" name=\"流程审批测试流程\" isExecutable=\"true\">\r\n    <startEvent id=\"start\" name=\"启动审批\" activiti:initiator=\"apply\" activiti:formKey=\"/oa/testAudit/form\"/>\r\n    <endEvent id=\"end\" name=\"结束审批\"/>\r\n    <userTask id=\"modify\" name=\"员工薪酬档级修改\" activiti:assignee=\"${apply}\"/>\r\n    <userTask id=\"audit\" name=\"薪酬主管初审\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"/>\r\n    <userTask id=\"audit2\" name=\"集团人力资源部部长审核\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"/>\r\n    <sequenceFlow id=\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\" sourceRef=\"audit2\" targetRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"/>\r\n    <userTask id=\"audit3\" name=\"集团人力资源部分管领导审核\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"/>\r\n    <sequenceFlow id=\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\" sourceRef=\"audit3\" targetRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"/>\r\n    <userTask id=\"audit4\" name=\"集团总经理审批\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"/>\r\n    <userTask id=\"apply_end\" name=\"薪酬档级兑现\" activiti:assignee=\"thinkgem\"/>\r\n    <sequenceFlow id=\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\" sourceRef=\"audit4\" targetRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"/>\r\n    <sequenceFlow id=\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\" sourceRef=\"audit\" targetRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"/>\r\n    <sequenceFlow id=\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\" sourceRef=\"start\" targetRef=\"audit\"/>\r\n    <sequenceFlow id=\"sid-7D723190-1432-411D-A4A4-774225E54CD9\" name=\"是\" sourceRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" targetRef=\"apply_end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-D44CAD43-0271-4920-A524-9B8533E52550\" name=\"是\" sourceRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" targetRef=\"audit4\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\" name=\"否\" sourceRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <exclusiveGateway id=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"/>\r\n    <sequenceFlow id=\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\" sourceRef=\"modify\" targetRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"/>\r\n    <sequenceFlow id=\"sid-72258A41-203E-428C-B71D-CA3506252D73\" name=\"是\" sourceRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" targetRef=\"audit2\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\" name=\"重新申请\" sourceRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" targetRef=\"audit\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\" name=\"是\" sourceRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" targetRef=\"audit3\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\" name=\"否\" sourceRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\" name=\"否\" sourceRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-35CC8C6C-1067-4398-991C-CCF955115965\" name=\"否\" sourceRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\" sourceRef=\"apply_end\" targetRef=\"end\"/>\r\n    <sequenceFlow id=\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\" name=\"销毁\" sourceRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" targetRef=\"end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_test_audit\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"test_audit\" id=\"BPMNPlane_test_audit\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\r\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"30.0\" y=\"245.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\r\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"975.0\" y=\"356.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"modify\" id=\"BPMNShape_modify\">\r\n        <omgdc:Bounds height=\"58.0\" width=\"102.0\" x=\"209.0\" y=\"135.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit\" id=\"BPMNShape_audit\">\r\n        <omgdc:Bounds height=\"57.0\" width=\"96.0\" x=\"105.0\" y=\"231.5\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" id=\"BPMNShape_sid-C28BB5F6-013D-4570-B432-61B380C1F46F\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"240.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit2\" id=\"BPMNShape_audit2\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"210.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" id=\"BPMNShape_sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"345.0\" y=\"350.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit3\" id=\"BPMNShape_audit3\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"420.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" id=\"BPMNShape_sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"555.0\" y=\"350.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit4\" id=\"BPMNShape_audit4\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"630.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" id=\"BPMNShape_sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"765.0\" y=\"350.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"apply_end\" id=\"BPMNShape_apply_end\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"840.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" id=\"BPMNShape_sid-5FED02D6-C388-48C6-870E-097DB2131EA0\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"45.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\" id=\"BPMNEdge_sid-3DBCD661-5720-4480-8156-748BE0275FEF\">\r\n        <omgdi:waypoint x=\"520.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"555.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\" id=\"BPMNEdge_sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\">\r\n        <omgdi:waypoint x=\"280.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"989.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"989.0\" y=\"356.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\" id=\"BPMNEdge_sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\">\r\n        <omgdi:waypoint x=\"240.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"153.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"153.0\" y=\"231.5\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\" id=\"BPMNEdge_sid-A7589084-4623-4FEA-A774-00A70DDC1D20\">\r\n        <omgdi:waypoint x=\"385.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"420.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-35CC8C6C-1067-4398-991C-CCF955115965\" id=\"BPMNEdge_sid-35CC8C6C-1067-4398-991C-CCF955115965\">\r\n        <omgdi:waypoint x=\"785.0\" y=\"350.0\"/>\r\n        <omgdi:waypoint x=\"785.0\" y=\"164.0\"/>\r\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\" id=\"BPMNEdge_sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\">\r\n        <omgdi:waypoint x=\"310.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"345.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7D723190-1432-411D-A4A4-774225E54CD9\" id=\"BPMNEdge_sid-7D723190-1432-411D-A4A4-774225E54CD9\">\r\n        <omgdi:waypoint x=\"805.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"840.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\" id=\"BPMNEdge_sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\">\r\n        <omgdi:waypoint x=\"201.0\" y=\"260.0\"/>\r\n        <omgdi:waypoint x=\"240.0\" y=\"260.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D44CAD43-0271-4920-A524-9B8533E52550\" id=\"BPMNEdge_sid-D44CAD43-0271-4920-A524-9B8533E52550\">\r\n        <omgdi:waypoint x=\"595.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"630.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\" id=\"BPMNEdge_sid-FA618636-3708-4D0C-8514-29A4BB8BC926\">\r\n        <omgdi:waypoint x=\"365.0\" y=\"350.0\"/>\r\n        <omgdi:waypoint x=\"365.0\" y=\"164.0\"/>\r\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\" id=\"BPMNEdge_sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\">\r\n        <omgdi:waypoint x=\"730.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"765.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\" id=\"BPMNEdge_sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\">\r\n        <omgdi:waypoint x=\"60.0\" y=\"260.0\"/>\r\n        <omgdi:waypoint x=\"105.0\" y=\"260.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\" id=\"BPMNEdge_sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\">\r\n        <omgdi:waypoint x=\"260.0\" y=\"240.0\"/>\r\n        <omgdi:waypoint x=\"260.0\" y=\"193.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\" id=\"BPMNEdge_sid-163DBC60-DBC9-438B-971A-67738FB7715A\">\r\n        <omgdi:waypoint x=\"260.0\" y=\"135.0\"/>\r\n        <omgdi:waypoint x=\"260.0\" y=\"85.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\" id=\"BPMNEdge_sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\">\r\n        <omgdi:waypoint x=\"940.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"975.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\" id=\"BPMNEdge_sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\">\r\n        <omgdi:waypoint x=\"575.0\" y=\"350.0\"/>\r\n        <omgdi:waypoint x=\"575.0\" y=\"164.0\"/>\r\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-72258A41-203E-428C-B71D-CA3506252D73\" id=\"BPMNEdge_sid-72258A41-203E-428C-B71D-CA3506252D73\">\r\n        <omgdi:waypoint x=\"260.0\" y=\"280.0\"/>\r\n        <omgdi:waypoint x=\"260.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>',0),
('d4d8c98c0e3b44caaad71bf41f44a11c',1,'test_audit.png','e3b870db640b4708a51f799da21ecf16','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0|\0\0\0=ӳ�\0\0S�IDATx���|T����S����h�˲�l�e�ծZ1��4�X��K]��RVV�\"�Z/�\"\Z1�c\nĀ����D.I�c�1f��E��c��>�9�03�I2I��L^�����\\�\\2��>s>sΜ1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��/\0\0\0\0\0�+�,e�\0\0\0\0\0� ެ/�J����%\0\0\0\0�s�m�ɖ-ܟ�t\0\0\0\0�y�vk�\0\0\0\0�V$��T���n\0\0\0\0\0�l�[k���\r\0\0\0\0@��m�vz\0\0\0\0\0�m�=�����\0\0\0\0���κ=\0\0\0\0\0Q�����~\0\0\0\0\0��f��vgK7\0\0\0\0���=���̺����q 5\0\0\0\0@�o��x4���R�߶6݁nG�\r\0\0\0\0��Ͷ��j�UM�g�m�D���N7\0\0\0\0����k�[j��M��gz��\r\0\0\0\0�6�vBM�����Ͷo����\0\0\0\0���֦���;�f���?3��\r\0\0\0\0��f���n���G;�m��\0\0\0\0t�f������vG�\0\0\0\0\0a��[��5�i�}�n��\r\0\0\0\0],ά���6k�լ)�M����^v#�ݲ]e]�I���(��(*ʪάj�r�z�poh�E;�p��\Z���Ud��ƙu�Y}xyڤ������-�m���@��\r\0\0�h$}� ý���2[�:h�76���A��l5ڋͺ���C���3N�w���t�n\0\0\0t\'�J�ցg�r�+��o��o��d���`�(��/G)���(�\0\0\0�d�w�������\n�lg|��D6ݭ5����vk������\0\0@����w��yj�y>�jmskͶ�Φ�ޭ}�\0\0\0\04�zK�#�9@�|g���O�@[���l�tۏG�\r\0\0\0�����\'RCH���yB&�h�{��F�����8|g\0\0\0hN��$^��l��h�o�=���<���6Z�?�\0\0\0&G/���+�8����l#�|w/�fy��O}�ޮ���\r\0\0\0t[YgƉ��Ysx¦��(��\0\0\0hN��gxp\"�!�9�Vt4ݝݼ\0\0\0�L֛syp\"�48:y8��n��F\0\0\0G�V^�ˀI��>�a�t����\0\0\0��>���\'��%+���n�\0\0\0\0�`��&z���D���\0\0\0�C`����f:���?��\0\0\0��\0C�m�f7r\0\0\0�~0tr�M�\r\0\0\0���Nn��h�\0\0\0�!0�й�Y��\0\0\0��\0C\'ʲ�U/^\n\0\0\0�~0t�8�\\[�\0\0\0�!0�Щ2��$���\0\0\0�7�8�u�.�\0\0\0�����i���|�\0\0\0���o�]�xy\0\0\0\0�!0��>��m�\"^\0\0\0�~0����|�\0\0\0���J���\0\0\0�!0���\0\0\0X��+\0\0\0�ul�Ƽ\0\0\0�:6``^\0\0\0�c��\0\0\0�:6�\0c^\0\0\0`00�\0\0\0\0ֱ�\0�\n\0\0\0``�1�\0\0\0\0��\r�W\0\0\0\0��`��y\0\0\0��\r0��W\0\0\0\0X��+\0\0\0�ul0���\0\0\0X�`�+\0\0\0\0�c��\0\0\0�:6``^\0\0\0�c0�\0\0\0\0ֱ�\0�\n\0\0\0`00�\0\0\0\0ֱ�\n\0\0\0\0��`��y\0\0\0��\r�W\0\0\0\0��\0�y\0\0\0��\r0��W�\0\0\0\0��`��y\0\0\0��\r�W\0\0\0\0��\0�y\0\0\0�ul0���\0\0\0X��+\0\0\0�ul�Ƽ\0\0\0�:6``^\0\0\0�c��\0\0\0�:6�\0c^\0\0\0`00�\0\0\0\0ֱ�\0�\n\0\0\0``�1�\0\0\0\0��\r�W\0\0\0\0��`��y\0\0\0��\r0��W\0\0\0\0X�,���R�SRRfN�8qolllC�޽��:P�P={�������l���Ϳ#�\0\0\0��\0��-[v�ȑ#�cbbԜ9�U~~�jh������:���,**T��ϩ�6������_L�\0\0\0@?X�JM}e}�~�TR���j4��&*���H����SO=�&�\0\0\0�!0���پ��TQ�v�	��\nq�����}��Üc�\0\0\0��\0�˖-�G�lm3�?�W-]��\Z3&A�\Zu����k�\r�#U�f�Q����SN��`�r\0\0\0����R�G���>)�y��7^�b�R5��ԭ���5v̍*>�Z5t�j�n���:��ޫW�<b\0\0\0�!0�\"\\J�11?R.W���5zU¨x�h�p�H�~�����aW�Mwl��Ω��>�Ss��=\0\0\0���&N��wΜ\'�F��f5bx�za�|��V�Jy1Ioپj�P}��v���{;�c5mڽ;�Y�H�\0\0\0@?X��Ґ��c6z\r���\'���Tm��������T�>s����C�?S\'�o�����ջ��0g�N�\0\0\0�!0�\"X�޽UC��f�W߬���*.ڢvoU�w���;vlW�=����P/��q=\0\0\0�����R_6+���j֬�j�o&���BU��]�v�P���o5�����_���Tǋ\0\0\0��\0����Ϋ\Z?W�ֽ�bc��?�TN�ϫJK�Ր�/U��NU\r\r�5�=��b�\0\0\0�!0������S�}wL��!]\r\Z�j���{e�U��*��?���W��W^2��4�{��W^���W�o����>��6\0\0\0��\r�1��n٤k[�켼��͌t�h�X�D��x�Jz�Y�̼�����P]{����5^�Au�X�\0\0�~��h����c�~��D.����ź�����-P�\'�S�;�I���Q3g�V=�ģf���~7�~���:^,�\0\0\0@?XT4�_8%\r����ݬ�H{U7��|?;��;�	�ܳsu�-M���	js��V��Չł\r\0\0\0�C`�EE�}ԩ�{��G��~y�8�Pˮ��*.n�����zkwi�^�Au�X�\0\0�~��h�?�*�7S_~��J|�i�0�:5b��j��+TܕC�P�Ѿ������Qǎ�EO�{{��ł\r\0\0\0�C`�EE�}�\n�b�\0\0\0�!0������\n�b�\0\0\0�!0����>L�Y�`\0\0\0�`Q�p��\n�b�\0\0\0�!0����>D�Y�`\0\0\0�`Q�p�¬X�\0\0�~��h�PaVmwO��@<\0\0@?XX7��¬Zw�hm]��\0\0\0�C`��w�]�亅g����u��W�/+)��6���_ff�s:\'�u}��z[�۔�������z��K�Ϛ5��c͟?K�>th��uUU[��G��7{����f�UV��kj\n��\r��3�8������Zi�i�\0\0@?X�7ܟ���\r��eYY+�.���5y�̆�H�����;��r��sr��ٳ�JN��\\�n�ݧ���l6�o�3�<CO[]�U?��`n���\Z?�j[�i���v��+�z>ϕ+_pN�߿C����Wk�iyL��gϞ��}_��r~ʔ�tþ/����^�/��\'z�ѣ���Ͼ��G������s�E͘1�l��շ�����[�g���u\\(\0\0\0�~��m���-��LL|L��oٲ.�m�.���*6�����_��Ç�����yy�����*}^[ΟrJo�|�o6�w���J}��cX[��ԡC��˗,���KF��`���euu��oA�\Z�yH.�55�����[����Y�Xmذ��y��eg�R��Unn�~�r^�������?��w�9?PÆ]����|��/�zm�[�i�\0\0@?X�4�iVee�Ԟ=٪��c���ݡD���x������?�k��S99����9��N5��\nu��\'�;��lb�6��O����R����@����<O-\\���\\�w7�x�F���.W�*/߬/KM}N?VEş�u��җ��-R�_��y������ ���^�*����T�|�(�q�瓛�z��]����2����c�}yN׆F��(��(wՙ�Ǭl��1+ެ^���C`��Iý�Y-Y2O]tѿ�-[֨ի����n��=�A}^nSX����I��K^/e�-��-���=���c�^�����&%=��g���P��O�˦N�`}W�^���=}cc��&\\]]������Wx�\\�m�:=}v����f���z+��m��=[o��ˏ-Sk֤����U|�}�O~2H�}��oy.��\\nߗL\'���P�\\2�l�W{=�\\���X����5�sw��5Ƭ���5�YIf�c��#i��#��#�~��j�?iVr�]w�R�NK[��B{^������.�0�j��_W_���]���~d���.+�v�����Ի\\��_�<�4��ٖ�U��U�^������+ӧ�η�Lo�\Z�~�?�8zt��}���|mm����iW�Nҧ��\\&���7^�O.[��I�h74|��O����X윗\r��j�����f��g>�\Z��7��AVt�a��;G�f}a�L^��#�~��n���Y��۝�ӧ��u]f��~o\'u���}q���v#+�rWW��v�\\���_�/^,����(V��̦�bUS�nV*��ý�ld?V))������oذT7��&ݦ�n�����J�y��\nש�.�P7��&<�j�6{}Ǝ�^�zk��,o���#�Tv�\n�h�zM�n��_���G�YY�~_�\0��w�w��-\r��a�Y��ڝ�rý�,9x?��\0�̆��Y�\'��P���[JK7��5fC[m6����Ʈ�\r���kk����Z?����l����j����v7�ǟKr򓺡ݷo�n�������y�.�if��l�?���>��8v��y^r��>`Z��Hg[������Oy\\�~�w�B�V�_�`�3�\\��nu�e��fϞ�/������^���[�o��p&ߟ˲Vr\0�O+G��Ix?��\0�Ć�c�u�H���]�������\r\r��ÇK�M7��2e��<���ڞ{n}Z*--�:�z}CWz��,��ZC%�#��������Æ��l�SUFF�JM}F?�}�܇�w�^�u���?��µ�	��4�V]r?�&8�l��M����}�������[�x���{��kc��=c6�����{�u�P��7o����{���Vjժ��QCS^�1}�?�Vrd���k�eK�#�\0�G\0�`�pW{UN�\nݼ����t�lv��fڴ�������M�\Z?������>��j8_�w�|�|II�>�r}h�;K�oj�r�)(x��6<����<����u���}��|w��&O�����;��c�?0��������m�����ת[o����ۗWTd����B7���z�����1&��}jp�\Z��9����C`�E\\��QDUSӇ�2M��K{���q\'�IbqtH29x?��\0�����\n���q\'G��#��T����S��!f��N�;��\"萭����,�\Z�J*�*J���{W>\0�7���C`�ET��f��n���i#\0�Q./��@?X�4�T�U��;9:�)@�sT��\0�~��1\r��T�U��;�-�:)\09�@?t����\n���q� G\09�Н\Z���0+\Zn\0� G\0y,*\Z�2*̊�\09�@^�\0���{/fE�\r�� /`�EEý�\n���@�\0r�0�����M�Y�p G\09�`��O�����l�vQaR_}U�Ϝ5.��� /`�E���|(?���RaR��?��9kv�\'\0� G\0y,�]u�e��̙J�F5v�Ui�I$O\0�@�\0�X0����˵�f7<�=zT��&�< G\09�`���&%=H�5f�UK�Y�K�\0�#����0��3O�/*ZA�ۅ���t�9/�u1y@�\0r�0��G�9��w��k�{��Qc·1�	\09�@^�\0�¦����l޼�>�;ݡ�ζ���n�l���@�\0�t�6�g���~����L�e��M/lh(�1������䧿�h����;��\'\0� G\0y�{�Ԭ9fm5��z��)����m��8��� /`�!�eY�/y�\0r�0��9d+�˚W	��	 G\0�@^�\0C��4�﮽���<�\09�`�!���v��e!O\09@�\0�:&�h~P2���w��@�\0�#����v�uۮq�<�	 G\0�@^�\0C�d�z����<�\09�`^K[��.7y�\0r�0��NY�4���<�\09�``^1�\0�#��00��<�@�\0�0��W`�\09�``^1�\0�#��00��<�@�\0�0��W`�\09�``^1�\0�#��00��<�@�\0�0��W`� G\0�``^1�\0�#��00��<�@�\0�0��W`� G\0�``^1�\0�#��00��<�@�\0�0��W`� G\0�``^1�\0r��00��<�@�\0�0��W`� G\0�N�,k@�T;y�X�y�#����\\�4�cx�X�y�#��^v�v�Y�x�X�y�#��ސ\Z�q�<,�<�@�\0�����r�w�ٺ��\0�#�� /@��.7��fa\0�@�\0r��d\Zl�fa\0�@�\0r����y4�	�,�<�@�\0�t���l�fa\0�@�\0r��\ra��0\0� G\09�\"g�)�;%%e�ĉ����6���;��pQ-TϞ=�;���?>|�F��HF�@�\0�#��tc˖-�g�ȑ�111jΜ�*??O54|e���QA��nEE�*1�95p�������5_�Y�y�#\0� /�Lj�+���맒�^P.W��46Q�X�ɋT�>}�:��Soba\0�@�\0�#��t�f��.PEE����[�Uyy��۷�?�����,�G\09@�\0�ҽ,[��ٲ]T��l\n]^�t�Kj̘5j�����Q7ďTɋ��MG������SN9����^�y�#\0� /�h�(�{��kꓒ�7O~�U+�/U�>J�z�X]c�ܨ��UC�^�������8��^�z�0\0� G\0�@^�TJ�11?R.W��6zU¨x�h�p�H�~�����aW�Mwl�������Ԝq,�<�\0r��(4qℽs�<i6�_7����櫬�2TʋIz��U#���������Qm�i���i΂D`�\09�K��Ґ��c6�\r���\'���Tm��������T�>s����C�?S\'�o�����ջ��0g�N`�\09�K�ݻ�jh��l\0��c�R�E[Ԏ�j��]rzǎ����{��%��9\\�d�%X�R� G\0�@^��R��f�r�]͚5SM��$URR���ۣk׮j�}��f<x������ޖj{u��ě%GeO���!v,�r�䥛4�u^����Z��5�SU�Q�zp�}^UZZ��\\~�z}u�jh����W7H�O�-[�?��f�\r�#\0� /ݤ���S�}wL��!]\r\Z�j���{e�U��*��?���W��W^2��4�{��W^���W�o����>��W�ķ�n�r���\0r��hk��9�u�&�[��d��mVof��F{��%��ŋT�Ϫg�=��������kF��o�����Ih�����;�,�r�Q��f�g�Z��ͪ��p�Y���i�Lk�(n����c�~��D.����ź�����-P�\'�S�;�I���Q3g�V=�ģf���~7�~����^Q����f�-�,�r�Q��qf�ZM�+f�f� �N����1V#�dM�oք�l��pJ\Zn�	��o�Y����n���~v�5w��g��[��1��朷�����o(�Fp[�����\0� G\0�4/�Dg�Un5ӽ���4��[ͺ �\Z�N�ݻM=�������Zv%�WqqCԯ\'��[�KK�����eo(��b-����f�\r�#\0��ܼ�7���E�W��>�~�ek���}�U�o�����S����*a�uj��+�СW��+���f�}�����ߣ�������T�+��P:�{8�����\0rDh^d%^���I�w�u����>BuQE�JkH����� /!2�j�c:�~c����-�f���Eo(�}�q�t���#\0����HS,�ǝ���Ժ�A��p���\"�\r���g�3�N�o0|oǁ�X��@�\0D@^�H�3O�c�w��Fv��7��*��P|�DK������t�M7+8\09��0΋�����wk�������!��*B�P���}���� �n�fۮ���nVp\0r�#\0a�����K�[���� �E�o(��`�sKM���S�L�w�Y��@�\0�Y^���\n�cV�`��~�0�m\r������ֱ��N����t����m�ٽ���@�E�W�8ď�h�����+���k���k�J�#3s�s:\'\'M�����6���={6����^��yޮ}�v��O>�M�c����]�f���gg�Vg�yF��甔y��څ��hO��Z�l�����l�f G\09��yYk�m!~Li�°�+��U�l�j���={���9f3\\��?1�q�4��8���Z��ަ��V:�e��U�1�0�}Z.��-�eZ�\'םrJ���С=z��Y�g������^4���U]����;V��~+*�TMM����[�&O��3}qq����p��lҤ_��8qq?է�6lX��;�ܠ_�.n�[��v[��@Mw�v6�6���\n@�\0r �\"�w_�ǌ1��0n�=�j��n�?mw��g̘�ޫ�8�K���������#}^\Zr�i��Z�Ǝ�AM��f����z��z���?��WJ���_��ǲo3q�mzZ�����ii�׫k����{�y��x���ȑ�԰aC�����~ކ�Z����X�^�f�s��]nk����{���m�^�0�i�[j��:�lw����� /��ά�C���x\r�p{nՌs7������5����Ym6�s�i��j6��F�;Ʃ�ҍ��i�3���2m]]�JOOQ��.|Z_.��_����]x�Ul���<���שI�n7�j��yz�4��er�ii��m���e�����,�l��O���^�<gy�r���Z����z�.�n���隚m��o��f\r�����eMwG�mߦ��t���#���TEb)��v�ܶ�*_��7�!���k��C_/�=�MJzB�]W��JN��/�:����Y����=���u����_����4�YY��������?{��\'��[�o�}�ڲe���~W��С]�s��X��?��-R��[[���ٯ��h�k���L�n�[����;\"ɺ�>,cY��@�\0�Zl��@�4�[,�#���߾����R]~�Ŏv���;�I�.+��4�g�u�:��&Xn#�_r�`UP�G��~Z���[�W�zA_�o�v��8۶�S�\'�W������R�8˗\'�i]���=7������2���**r�����2���D�Ǐ�&#�e��#F\\������lݾ��QA���}���h��iiw[~�;�p���#��¼��֛)�x��I�U\\�i6�K�}�^���@UW8����]�L/�/���+ԁ;Tzz�n�kj��;��popn����s��ctC������&M��l�����e�3N�f߾m���}T�U*//�j��9�m���Wzݷ�?��o��ii����u��;�ذ��:��|��=M7��f G\09��y�(�Ǜ�\"�����l��/読-T˗?�c����f;_�{���zws��3��ON~J9��lj��\r�\"}Ycc�utr���o�}��\rw��K����яa��q^�lZ��kj\n��å��몪�q�������6���Ч��=K͘1�]�c7ܭ�\r�&��[��������ts�rVp\0r�#\0a�~��孖>\rwM�e��jZMj�JIq����ڹ��p�~�0��e*#�%������ܾN�C�fe����7���.�G֮໛=/�ǵ/�w����[[��X�ߦ��\\.����m�����=���������t����;ۭ�Nw C~����@X�e�Y��Pt����3H������J��Pa6�Ku�t�p�����ڙ���.�:_R�>�r��,�����75}�LSP�f6�������}P%&>b6�睊S�SM�6Q��*,\\�N;�u��^��f8��ߪk��T�����QW��u�����~.�a����[��j�<�����D�XimskͶ�Φ�ޭ}�SVp\0r�#\0ᑗ\\#t[ä!�\Z�3H��WSSUD��z�|C	�����v�M��x4۬�\0� G\0�(/��^n�f+��;!r.�}C�-ݾ�w�i�;����>��w�Y��@�\0�i^���j���V#���wr�]EuQE���O�y6�mi��Vn�O���#��ĘuЬ�t��Z�?(�g�RR]T���{�4������v��o���#��%D���Ŝ�f^�wB�� �*�.�(xC�������:X��@�\0�q^&Y�qgm�Ժ�G�a)��E%o(��twv�Vp\0r�#����l�-g��|�Z��}�j�b)UAuQE�JGwg7r�\09@���K������v���ַ\"�}��A�4��z�ꢊ�7��U�����\0rDQ^n�\Zo�-|���	��:ݺ�t�9� Ѭj�ўdD���[h�˩.�(|C	v�pv#g�\r�#\0��Ҽ0���Z�w�����fe�]�c�y)��E�o(mm���Ug}��\09@�\0��\rw�E�I������f�6@�\0�#��Dyý�ꢊ����n�,�r�䥻4�{�.�n��f�6@�\0�#��t\'�|�w\r\r�f�\nq}�U�>s���0���$�m�\09@�\0��m��C��K�p�Z�����Y����ka�O���\0r���᪫.[7g�T�,�B\\c�^�f�v���G\09@�\0�m�A��|�r�	m}ңG�\nsı0\0� G\0�@^�T��?,MJz�&8�5f�UK͗>���G\09@�\0���y�i�EE+h�CP��Kכ��A�.fa\0�@�\0�#��D��s�9��4�\'���ѣG��=���y�#\0� /ݷ�>���7���Nw�g�ڍ���}��� G\0�@^��A={~/���O=<e�-�7mz�`CC!\rs;ꫯ��[�����h����;��0\0� G\0�@^��K͚c�V�\Z�IW.��;���_q)�#� G\0y�y�� /\0X�y�#��\00�\0r��\0�\0r�#��\0`a\0�@�\0r�\0,�<�\0r�\0,�G\0�@�\0����G\09�@^\0�0\0� G\0�@^\0�0` G\09�\0`� G\0y��\0�#� G\0y�y�� /\0X�y�#��\00�\0r�#\0�\0�\0r�#��\0`a\0�@�\0r�\0,�<�@�\0�\0,�G\0�@�\0����G\09�@^\0�0\0� G\09@^\0�0`�\09�\0`� G\0y��\0�#��\0y�y�#\0� /\0X0�x	\0r�#��\0`a\0�@�\0r�\0`a�<�\0r�\0,�G\0�@�\0����G\09�@^\0�0\0� G\0�@^\0�[���j\'/l� G\0y�!f�Zi���2���\0r�\0��n��.2�/l� G\0y�!-4��xyX`�\09�����]n��6[�Y`�\09����]n��� G\0�@^\0t�L���,�r��@���h�x9X`�\09���c����,�r��@\'\Z�6@�\0�#��\0�*�z���̜8q����؆޽{��-*��ٳ�w��gÇ�h���Q��#rD��9\"/@7�lٲ{F�Y��̙����TC�W��;��%�cQQ�JL|N\r8����{͗�bVp�E��9\"G��#�D���W����O%%��\\�Fsa�D��JN^�����թ��z+8�\"G��#rD��y�x�|������B�[*DU^^������{�~�\"G9\"G��#rD��Э,[�����h���py�ҥ/�1cԨQ׫믿F�?R%/Jj6��*/߫N9�/��ߝO�#rD��9\"G��#�tr ��#��OJz�<��W�X�T���(u�-cu�s����V\rz�Z���P�T���?�իW+8�\"G��#rD��y�DJ�11?R.W���h���Q�z�|�\r#���ϮSÇ]i.�c�MOu��>��O�Y�\n9��9\"G��#rD^�(0qℽs�<i.�nV#�ǩ�WYoe����\'�W��/��.ח~oG���M�w�9KY�!G9\"G��#rD��bc�4�����fu�����~��nyGe�i�Z�j�Z��F}\\������շ�~��vT���ws��d\'+8�\"G��#rD��y�@�޽UC��悡�Y=6�!U\\�E�(ުv�*�%�w�خ{�!����_2�Y�b�Q��#rD��9\"/@���(�e�r���f͚���f�*))T���ѵk�5��V3�O}���~oK���|���9\"G��#rD��y�Y�]�U����u�^S��?U�U����U���j�嗪�W����Ϛݞj��C�(rD��9\"G�� ���p��6��aCcUMu�z�l��ݼQe��G���J���K�B;M�t啗�����o�����\n9��9\"G��#rD^��Z0sj�M�7ea���Y�����+�/Q//^��^xV=3�i}���/-T�^3Bm|{��}P�/Vp�E��9\"G��#�DՂ��N=6�w����\0^��Xג��U����y��>����#j�ߪ\'�x�\\(g��ͼ��>��+8�\"G��#rD��y�j���S�`��������i���,���?G͝�z�ٹz�,�1��朷��T\'+8�\"G��#rD��y�j�|ԩ�{��G��~y�8���]��U\\���	�������z���b�Q��#rD��9�\"Y�sn�v\Z\0�]0�U�o�����S����*a�uj��+�СW��+����������G;�=����+8�\"G��#rD��Qb�;���{���&�\n9��9��9\"G�e��l�Ջ�	z��&�\n9��9��9\"G�\ri��G��k�|�\n��╀�K G9\"G��#rD���r�w�ٺ\r�o��7*L*JWp���¬$��rD�#rD��9\"G�(l��.7��ڿ`>D�IE�\nN��J�lQ�,\nڌ_rD��9\"G䈊�e\Zl�:k�|�\n�����\0[�p���#rD��9��)Gq\rw�~Ղ�\0&E+8	�����\'�#��#rD��9\"Ga��.7[���-��J�IE�\nN[W^�i���#rD��9�\"=G̺Ϭ�fU�Uo�\rf}b�w3�iM���Z*L*\nVp��R���\"G�\"G����%?��k5֪��o�Z)�M�O�0�_�i��]]���0~�9\"G��#*�rcVvM���j��T@���T�T��ttw�Hߝ��K��9\"G�Q�����H��ͳ�j�\'�u�Y}�i��5Ⱥ��n�%\\>�bk7x��*L*BWpZ; M���#rD�(rD�(r���w��t��������}�{2��w���\n�����>�k�nY`��#rD��9\"GT$�h�O�\\i��f��ܮܧ�fK7�|��I�K�߶m�����>}�����奩#��ɓ�CM�t�Wmܸ\\ee-S-=�\\7mڝm~^�W\'���;7��55������@׆\r����s�߷o���%%TYY�>-?jVr�͞����9���*�~}#h��`�{f�i�\r���\"��5����:�E���9�1�w#��_���}��湆���h�\0�����JK��A���Qze_N�{���3�<C-\\��3����<o߿�?�k��ӧ�TK�-��t�\rm~n���P]}ul��Hc �TW�����n6,����^��~o�\'ޢ�l���F�?����;~�rs_�Ӗ����/X�^.��X�.��B}�}����/���s���O�e�d�������v���C��9\na��_�QQ�#�Ƹ��mϦ�ܧ�p|�\\�j;V�t��;����̗��={���w7\n?�,=}��R��\\i�b6\n��[���\"��MM��>�:�����#��G��V����KJ2u3Q\\��.�����{��W����׿�L�r}���e2�<�Çw���g�i�����5k�UL�\0�6r�����m��ߦ�������:���#p�ư�x�NԖ�ϕ�&z\\Iߡ#G��(GTh��#*�r4�����ŝ|�޻��k9p|��q�UW��\Z0����Z�N9��z��{Un�:L�&ݪO�{n����{���^�F��JM�2�\\YN�ӟv�)fðPUW��=vS�{7Si6ZzN���ر�9�e��i�y�fz�i�zk�}�>���R���#GJ�i+*6��jk���������h��F�����w�u����ѧ+��}�ܻ��sh���@+�VVZZ��7}���#�;t����\n]�#rDE]�<�n\'���x�`+7�o�\\�b�Օ�7�������o�Sa�\ZU^�Q�w�����-s��yy�Y������@��g�[֖�ș����\'%ӧ���9�a��*&�_��)j�������K�ٳp�+.^�o/[�<��w��l64���V�Y����=--ɹy}bc�]M�6�l2���4����Yg�i6;�m�ױ��#D�X�Ib���JN[Wn|Wr�bw���V����\n]�#rDEU�Ƿ>���\'����\'�bh�\0�`��M����:��tðj�szW҇�������_{Zw�p�>�o_��$��46V�@�-��}���V�nj����e�e�&�2ْ8b��^�ee-ѻ�N��_jҤ[t���fd���y:T�ܷ���@n#M���I�\\���������7����ȑ��X�[�_B�`�G�qm�M[W2Z[�	v����?�-m}��9\"G!�u��#*�rt��tY\'����x���Z�^0W�XlS��+Ե�ƪo�Z��;��y�TS����LΗ��ӷ����lke�Roɒ����W�[�������rz��GZ|~2���3�]v��	^�mܸT�Ծ�ꫯpNoذؙn��=�\\����[U����V9�;1�!����ܦ�~���~}������T�q23SZ�_B�`�+��OF�ݍ.�JN�v���n��JN[_+rD��Qr�9��m{�Ɇ���t2��C�ɓow> :�A�R�������nѷ�|<ɩ��(/[_�r}����8U]�Yh���!��y^2PS���\'[}m~�7�i���ٳ>�טEw��2�孜��Y�O��tɃ�3�}̾���Y��	���� e�9����%���y����S����O=�S��-[^WӦ�Z��=�Z�q��ȳ	�t����6�@�4��XMM�+�yY�-t7�t���m~i\n.����;z��\\`�h�^z�����\\�{l�l��_9竪6y4�Gv;���w?�V=�u��X��\'���z�\n�+�n?l�e�B6C_�����~>���������On�r������lY�/��yy���Zwт���\\�ii%��+7}>\'��\"G�� GR2f}��̦y�u���ԧ�G�̙��^\"�o/{V�?�\n�!{�c����̀�=��T}��d�:v�Թ����)V��/�LH�/������)S~�d�^V�ʿ�_�&ݬ��^\'qq���R6�d}����\\9�9�f���nK����Q����������s>�O��g�1�>�Ƈ�����>��=�\'L�����Z��7�ͯ�1j�7���5�y^�Ϟ�[��Aɋ��}ʰ���!]����Ӳ�\r��\'��W�o���W�^6���m{_�0�Q������3��>��􂹲MU]������m����B텤�45U8ӺWr��m��o���)��6��~��q7lH���|�����\\.�ᬳ�?���#E����^e�����y.���\nG�nt����}�����칤�=�Zu��N������i�^�&%=��oh�km���&S`�i�c�<c6U����]�`��d4�>����ӑ�ߕ��0z��9\"G!ȑ=�d{�oY	��2`��d�YƗ�)�1�z�sz\\�tr�B�{����͛�5�dѾ���>?�O�s���c��r�iY�_y��X[��%k�m%s���s���P��~�^�ع��8����jtr����ܨ���,��Q���6�g��/�̖�26导\'�u����G9/����cGz5�vfKJ�����%K�V^�#=N,x�:F�.�$W9�CƬ���>���j٢�!�m��]�[�r������:�r{����sb��ط���&c�+��}O�����X\r�Z�^0�b������S�;�m����22�9/+\n�\n�}^V��O�S7�%��W�e�Ç�镆�´��A�s�|���z��SO��l��ҵ�\'�����oP۶��[�,x��={�t�X<�����Rsee�����w���^��ۗK54�\rD�>���L�5�wO��\Z�Ն�f�+��㫇�-	U���n�9\"G����H�р�d�Կd��=F���4Ş�q��\Z5j����q��z��>�܏d���7������9\r��!?T_����O�_y�C��6��<\Zˬ�g<�p\'�-𞙐9R�˽5o�>-9����e\Z��|�f/+���ݤ����~�R���\0��yE���^��c�J�=w�1F�?45��l�ȴ�Qϲ����-�k�f���62��v�����RS��Ǫ����Iv��&�����ͼ}{�~�GN{��~��R��lL���7�/~�y���<�}������~< �����]��Z�.�$t�����5]kG������.j8oQ�}��9\"G\'8Guu;�ߍ��Z\Z�}�r���͕����x��x��>������\n��ݫ|777�j�+Z��\n�t�sؿ�k��G�i��2�-v+�cef��:/_>�l8�\Z��V����Ho�4��k<K�a?W�9������o�K�c?vi�\Z���.L�x?jӼ���h��g\\�������II��d,\'\'?f}�i��]�)z7u{z{��l��dڳ���j=��s�p����L�m�C�a�.�z�����󹺛��˔������z�^��������3�y�~?�c7Х\r��T�T-�}߬}W&�����t�w��V�_rD�B���֑̅�_R�V=c���P?|�>�>��Kδg�y��$_�O�۷�i��i\Z�(����}��\n���c��뮛��>��^�=Zh�6[l����-��}ڕ���\\y�o6>��w7�������m�^k6��?u���ɷ����_�LW\\��&L�4#��o����9\"G���T]~��9cMƿ�.+{�K���9眭����3NdO-s�ɳ��S�G_��i�ݲ7;e����֖�uVS��߱g�[;c�yi���fO�z�|���Ը�Pˇ\0˗��_SZ��I�q[z<C�R��ܯ��ƕ\r�G|��چ�<�����s��nG�ӯY��9�ظ�:�ҫ��.%�V��*����Y�%�K�Ef��bӑO��Ԋ�����ӕG�m���1���XgBN=�=�t����bN<���<����2�JԆ\r������UFF�3���^�n�q�����g�Ӿ�\r�ܑ��̑�ai��)��Νfm��_M�r��,����oc7ܕ�oY�-3���><ǝ���־�W�����ͼ�3����[��������\'�+��j֬�8�%+�G�l5����Ƨܷ�?r��=v�H_�;��(�h����*��=�˵�Yn�����s���~䯊�_w>�1,�rWWo���kL��d����\'cW� M����{k8���\'�\r�X�������I�n�e���\r\r�����\nW�ol۶�j��[�|���`���[�7��r���9c_��w����s��F�Ο?�����hy?�(�@�6�JJ��&y�Z�`��}���J���|s%~����d-����\\����>�r��Hț����f.�S��v��t3.���i)Y`�w9��oY�+��M�лC��9-ׅ��	т��-�$���5m�wQbt�����_U�e5�/;㡴4��t��;��˸����*-�Y�\"#Y���[�\n��$&>�?���O�e2�)��s�-���o���?ֹ#Gљ����z�o��7�֑�G:��-i�%��o�\r�6�Q��u��I����]��q��Y�?�A���t7\r�f�����~L{zόUTd���1(�m��G�l��#�s�ǲ�*���H��;�%��t�\'ߢO���G͘q���r�\\��O��k�]e߱v�\"G�����?��1C�L�z���[>ܲǅ��w��ȑ-zN��2;[r{C�u��lj78�p�W?��س�Θ</{QƱ�������G���l�߳��Iɠ����ڙ�S�F����\rtm�]�:|�@��76��rҟc}j��^��+���~G��k�LŃ~����~�s�}D��Ӻ��:E�nh(QYY��6s��g���������Դ\'$����h���Vn�v��ػ��������9/[�������m��/ԧ��.,\\e�Hqn�^��u���^+��I�;�\'�՗ٗK�`�FV�d�Ai:�oyx�Z�ʲ�l��#Gѝ#�x�1{��>\"��sܸ�p_�?t��y�}�~��G�nu��é�o�Y�qe?����uw[�$yq7ǧu7�e�����޲eE��]��ƶ�����Ƿjɸ��s�2��6���w�#ޏ�w{l�x��C��ǹ^Ɨ���j�2�SS����fF������(�_w��s]��3���L��eek�_�Hu��l�1���~�;�ƨ�.�u����{��r�����\Z�L\'��л��\Z��G�rY��e�?���m��{���{CZ�¬�2��t��d[[����f��y�b�wC�s!�N7�vs�r�}���mݠ���c��:/�!o�����6a>^mYh��M�+9�㍋��;i7��|Ĉ˼.��v��̕�_蕓ŋ�[�g̘�\\f�-=��GY�\ZsE�sf������Y�b=��i��9�![4|W��i��-��p�9����n�ͳ�C(�e2�/��_���>a�_��ek���t6<Kn�a���Ǖ��i�~�)w~���d���q���_�+u�՗7{_��H 9�i$��(��\r�D��.	8���S�Fr�����9?~ݨQ��c�%_������,���^���W�ƅ�{������i�k��~c�_��,�͂3���^q�kN�|�+�\'r?��ؙV��r�i�=s\"������+Dꩧ�q޿쪨x�y��p�C��(x?���\'�1��x���Y��`����ۮ�DL�6^/e��oߟTj�z!w�H���k��^��z��z\ZC�f��^IZ��q��8]_����Z��y��hl,�>�}A�����a?��\\�����Ȋ�l-,.^e��,��c?�3�e�ww�;�����J�� �`DM�rs_6W���۪Usu�;cƯ͕e��`i�l�d��l�iu7���2�%��e�r��a��?�*/_�l�WU�w�}YI�����D��ڽ`OX�u�55�\n�2��+��/9��G�������,G�<Ʒl��샧]lߊ.5�6p̻CV.�Ns��s���us!Wj�~���L�[����u;�\'�����FkW����nd��E���n֧�I���^Ӯ^=�����1xQ߿}{����14��9�W��-�++mY�1Z�](j�KsTW�M�{���\rI���QU�i6�;������y����FX�5]m�&�_���7������z��x����<>�L�E�n˖ea�;r��rD�~D��9j�|����輟��+7��n�2\0��]!��z�o#�x�p�)x�j&޴v�K��o\"�����x�9=u�m�������\"}Z�}D���._���}o޼�����\"��<������rrC��D�\n��J�����F�?��{����jD����m�}��n��@�p��؋ԤIc�8�1{����&��o[߁]�wCN�J��/��_������s�2���#t�~��6w�Q��#��c��\n�l�;�tK����`-�`.\rY56y4��ֵuցd^q�𼼗�nw��.UG��<s�)\'�\rɖf�a�#�ƚ+��-m��i�]\'8����I�\\;�Ͼ�455��ϖ�����!Z��\'�Vp���tƖ��8�kX��ȑw�,��mۖY�������4�,��^-jv��V�V+W>�����\n\n��\r��A�LUWg6�y��o��=�K��Q����9b�����vy��-[�ۻ{���s�6��]�`nhp�\\��j���\n�{�[�nrr^�������q�f$#�9\'�l\n����ima8a�ϝ�\'GT���x�:���`%��W�\"*Gv6��穦�}��`ذoq�H��{YVVR�i���z^��h;;�;C�Ν��1,��uC�&���4��2w�������#r�&�|�n9-R�����t��܇�#�V@�4ܲUK�{n���m����M�����������o\Zy�����Eo}��\"�-���co	��nw���^�娴�5��j{���Y��r>�ji�ػ��w�^h횝�wz��JK��#��$2��6)�A�\0kl�8��ܑ��#��#rD��QP�[c]�4�YVC.[����e��A�m�0ܻ�{ޮκ\r��`��vt\Z�A���E �H69\n��N�#G�\"G�\"Gmcx��=���;�\0f�!�nx���9\"G��#rD��h��mV��\n�ўdp4r�3�]�b�wA\ZG�(rD��9\"G�u�f=`�Z�>1����阮{w�{�8\0�,��P�������E��\r9\"G��#rD��h�\0�,�#h�B��G��9\"G��#��\0f�a���+7��#rD��9�h��`f�ܥ+9IQ�rC��9\"G��#��\0f�]&����E��9\"G��#\04���ՇQ��#rD��9@�M�`9\"G G��\"G\0X0�`9��9���9���b�L�(rrD�@��\0�f�#rrD�@�(r�3f�#rD��E��E�\0�`�X0�#���#�#r�3ł���#�#�`�̂��Q�Q�\0f�39������.\'�|�w\r\r�,à��j�>s����\"G�\"G G�@<�Ǉ��`�Z�����Y��QI�(rD�(rrD�\0D����lݜ9SY0�A�{U�9K��\"G�\"G G�@0����˵��c��\'=z��0gI��Q�1���9%���aiR҃,��ƌ�j�9+r��\"G��#�#r �:���ꋊV�����_�ޜͺ��H�(rD��99\"G\0�O�9��wΡ_(��ѣ�|��0�E�@���9��N���y����������X�d�L�(rrD�@����aPϞ��9��SO�r��M�^<��9v��1�OD�Q+�i�w{�݈Q����#\0�̥f�1k�Y\rf)���2ܿ�(?�Q+�E�@���9\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0����9���6BX\0\0\0\0IEND�B`�',0);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values 
('next.dbid','1',1),
('schema.history','create(5.21.0.0)',1),
('schema.version','5.21.0.0',1);

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
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

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
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

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
  `TIME_` datetime(3) NOT NULL,
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
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
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

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

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
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

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
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
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
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

/*Table structure for table `act_procdef_info` */

DROP TABLE IF EXISTS `act_procdef_info`;

CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_procdef_info` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values 
('e3b870db640b4708a51f799da21ecf16','SpringAutoDeployment',NULL,'','2017-05-23 14:10:27.337');

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
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
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`) values 
('test_audit:1:f69d64301d3c441cbc45df7f51cc13bb',1,'http://www.activiti.org/test','流程审批测试流程','test_audit',1,'e3b870db640b4708a51f799da21ecf16','test_audit.bpmn20.xml','test_audit.png',NULL,1,1,1,'');

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
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
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
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
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
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
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
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
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

/*Table structure for table `cms_article` */

DROP TABLE IF EXISTS `cms_article`;

CREATE TABLE `cms_article` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `category_id` varchar(64) NOT NULL COMMENT '栏目编号',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `link` varchar(255) DEFAULT NULL COMMENT '文章链接',
  `color` varchar(50) DEFAULT NULL COMMENT '标题颜色',
  `image` varchar(255) DEFAULT NULL COMMENT '文章图片',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述、摘要',
  `weight` int(11) DEFAULT '0' COMMENT '权重，越大越靠前',
  `weight_date` datetime DEFAULT NULL COMMENT '权重期限',
  `hits` int(11) DEFAULT '0' COMMENT '点击数',
  `posid` varchar(10) DEFAULT NULL COMMENT '推荐位，多选',
  `custom_content_view` varchar(255) DEFAULT NULL COMMENT '自定义内容视图',
  `view_config` text COMMENT '视图配置',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_article_create_by` (`create_by`),
  KEY `cms_article_title` (`title`),
  KEY `cms_article_keywords` (`keywords`),
  KEY `cms_article_del_flag` (`del_flag`),
  KEY `cms_article_weight` (`weight`),
  KEY `cms_article_update_date` (`update_date`),
  KEY `cms_article_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章表';

/*Data for the table `cms_article` */

insert  into `cms_article`(`id`,`category_id`,`title`,`link`,`color`,`image`,`keywords`,`description`,`weight`,`weight_date`,`hits`,`posid`,`custom_content_view`,`view_config`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('1','3','文章标题标题标题标题-3-1',NULL,'green',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('10','4','文章标题标题标题标题-4-10',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('11','5','文章标题标题标题标题-5-11',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('12','5','文章标题标题标题标题-5-12',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('13','5','文章标题标题标题标题-5-13',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('14','7','文章标题标题标题标题-7-14',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('15','7','文章标题标题标题标题-7-15',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('16','7','文章标题标题标题标题-7-16',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('17','7','文章标题标题标题标题-7-17',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('18','8','文章标题标题标题标题-8-18',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('19','8','文章标题标题标题标题-8-19',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('2','3','文章标题标题标题标题-3-2',NULL,'red',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('20','8','文章标题标题标题标题-8-20',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('21','8','文章标题标题标题标题-8-21',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('22','9','文章标题标题标题标题-9-22',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('23','9','文章标题标题标题标题-9-23',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('24','9','文章标题标题标题标题-9-24',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('25','9','文章标题标题标题标题-9-25',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('26','9','文章标题标题标题标题-9-26',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('27','11','文章标题标题标题标题-11-27',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('28','11','文章标题标题标题标题-11-28',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('29','11','文章标题标题标题标题-11-29',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('3','3','文章标题标题标题标题-3-3',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('30','11','文章标题标题标题标题-11-30',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('31','11','文章标题标题标题标题-11-31',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('32','12','文章标题标题标题标题-12-32',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('33','12','文章标题标题标题标题-12-33',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('34','12','文章标题标题标题标题-12-34',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('35','12','文章标题标题标题标题-12-35',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('36','12','文章标题标题标题标题-12-36',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('37','13','文章标题标题标题标题-13-37',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('38','13','文章标题标题标题标题-13-38',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('39','13','文章标题标题标题标题-13-39',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('4','3','文章标题标题标题标题-3-4',NULL,'green',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('40','13','文章标题标题标题标题-13-40',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('41','14','文章标题标题标题标题-14-41',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('42','14','文章标题标题标题标题-14-42',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('43','14','文章标题标题标题标题-14-43',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('44','14','文章标题标题标题标题-14-44',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('45','14','文章标题标题标题标题-14-45',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('46','15','文章标题标题标题标题-15-46',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('47','15','文章标题标题标题标题-15-47',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('48','15','文章标题标题标题标题-15-48',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('49','16','文章标题标题标题标题-16-49',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('5','3','文章标题标题标题标题-3-5',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('50','17','文章标题标题标题标题-17-50',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('51','17','文章标题标题标题标题-17-51',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('52','26','文章标题标题标题标题-26-52',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('53','26','文章标题标题标题标题-26-53',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('6','3','文章标题标题标题标题-3-6',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('7','4','文章标题标题标题标题-4-7',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('8','4','文章标题标题标题标题-4-8',NULL,'blue',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0'),
('9','4','文章标题标题标题标题-4-9',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 16:00:00','1','2013-05-27 16:00:00',NULL,'0');

/*Table structure for table `cms_article_data` */

DROP TABLE IF EXISTS `cms_article_data`;

CREATE TABLE `cms_article_data` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `content` text COMMENT '文章内容',
  `copyfrom` varchar(255) DEFAULT NULL COMMENT '文章来源',
  `relation` varchar(255) DEFAULT NULL COMMENT '相关文章',
  `allow_comment` char(1) DEFAULT NULL COMMENT '是否允许评论',
  `attachments` text COMMENT '附件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章详表';

/*Data for the table `cms_article_data` */

insert  into `cms_article_data`(`id`,`content`,`copyfrom`,`relation`,`allow_comment`,`attachments`) values 
('1','文章内容内容内容内容','来源','1,2,3','1',NULL),
('10','文章内容内容内容内容','来源','1,2,3','1',NULL),
('11','文章内容内容内容内容','来源','1,2,3','1',NULL),
('12','文章内容内容内容内容','来源','1,2,3','1',NULL),
('13','文章内容内容内容内容','来源','1,2,3','1',NULL),
('14','文章内容内容内容内容','来源','1,2,3','1',NULL),
('15','文章内容内容内容内容','来源','1,2,3','1',NULL),
('16','文章内容内容内容内容','来源','1,2,3','1',NULL),
('17','文章内容内容内容内容','来源','1,2,3','1',NULL),
('18','文章内容内容内容内容','来源','1,2,3','1',NULL),
('19','文章内容内容内容内容','来源','1,2,3','1',NULL),
('2','文章内容内容内容内容','来源','1,2,3','1',NULL),
('20','文章内容内容内容内容','来源','1,2,3','1',NULL),
('21','文章内容内容内容内容','来源','1,2,3','1',NULL),
('22','文章内容内容内容内容','来源','1,2,3','1',NULL),
('23','文章内容内容内容内容','来源','1,2,3','1',NULL),
('24','文章内容内容内容内容','来源','1,2,3','1',NULL),
('25','文章内容内容内容内容','来源','1,2,3','1',NULL),
('26','文章内容内容内容内容','来源','1,2,3','1',NULL),
('27','文章内容内容内容内容','来源','1,2,3','1',NULL),
('28','文章内容内容内容内容','来源','1,2,3','1',NULL),
('29','文章内容内容内容内容','来源','1,2,3','1',NULL),
('3','文章内容内容内容内容','来源','1,2,3','1',NULL),
('30','文章内容内容内容内容','来源','1,2,3','1',NULL),
('31','文章内容内容内容内容','来源','1,2,3','1',NULL),
('32','文章内容内容内容内容','来源','1,2,3','1',NULL),
('33','文章内容内容内容内容','来源','1,2,3','1',NULL),
('34','文章内容内容内容内容','来源','1,2,3','1',NULL),
('35','文章内容内容内容内容','来源','1,2,3','1',NULL),
('36','文章内容内容内容内容','来源','1,2,3','1',NULL),
('37','文章内容内容内容内容','来源','1,2,3','1',NULL),
('38','文章内容内容内容内容','来源','1,2,3','1',NULL),
('39','文章内容内容内容内容','来源','1,2,3','1',NULL),
('4','文章内容内容内容内容','来源','1,2,3','1',NULL),
('40','文章内容内容内容内容','来源','1,2,3','1',NULL),
('41','文章内容内容内容内容','来源','1,2,3','1',NULL),
('42','文章内容内容内容内容','来源','1,2,3','1',NULL),
('43','文章内容内容内容内容','来源','1,2,3','1',NULL),
('44','文章内容内容内容内容','来源','1,2,3','1',NULL),
('45','文章内容内容内容内容','来源','1,2,3','1',NULL),
('46','文章内容内容内容内容','来源','1,2,3','1',NULL),
('47','文章内容内容内容内容','来源','1,2,3','1',NULL),
('48','文章内容内容内容内容','来源','1,2,3','1',NULL),
('49','文章内容内容内容内容','来源','1,2,3','1',NULL),
('5','文章内容内容内容内容','来源','1,2,3','1',NULL),
('50','文章内容内容内容内容','来源','1,2,3','1',NULL),
('51','文章内容内容内容内容','来源','1,2,3','1',NULL),
('52','文章内容内容内容内容','来源','1,2,3','1',NULL),
('53','文章内容内容内容内容','来源','1,2,3','1',NULL),
('6','文章内容内容内容内容','来源','1,2,3','1',NULL),
('7','文章内容内容内容内容','来源','1,2,3','1',NULL),
('8','文章内容内容内容内容','来源','1,2,3','1',NULL),
('9','文章内容内容内容内容','来源','1,2,3','1',NULL);

/*Table structure for table `cms_category` */

DROP TABLE IF EXISTS `cms_category`;

CREATE TABLE `cms_category` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `site_id` varchar(64) DEFAULT '1' COMMENT '站点编号',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属机构',
  `module` varchar(20) DEFAULT NULL COMMENT '栏目模块',
  `name` varchar(100) NOT NULL COMMENT '栏目名称',
  `image` varchar(255) DEFAULT NULL COMMENT '栏目图片',
  `fonticon` varchar(255) DEFAULT NULL COMMENT '字体图标',
  `href` varchar(255) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `sort` int(11) DEFAULT '30' COMMENT '排序（升序）',
  `in_menu` char(1) DEFAULT '1' COMMENT '是否在导航中显示',
  `in_list` char(1) DEFAULT '1' COMMENT '是否在分类页中显示列表',
  `show_modes` char(1) DEFAULT '0' COMMENT '展现方式',
  `allow_comment` char(1) DEFAULT NULL COMMENT '是否允许评论',
  `is_audit` char(1) DEFAULT NULL COMMENT '是否需要审核',
  `custom_list_view` varchar(255) DEFAULT NULL COMMENT '自定义列表视图',
  `custom_content_view` varchar(255) DEFAULT NULL COMMENT '自定义内容视图',
  `view_config` text COMMENT '视图配置',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_category_parent_id` (`parent_id`),
  KEY `cms_category_module` (`module`),
  KEY `cms_category_name` (`name`),
  KEY `cms_category_sort` (`sort`),
  KEY `cms_category_del_flag` (`del_flag`),
  KEY `cms_category_office_id` (`office_id`),
  KEY `cms_category_site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栏目表';

/*Data for the table `cms_category` */

insert  into `cms_category`(`id`,`parent_id`,`parent_ids`,`site_id`,`office_id`,`module`,`name`,`image`,`href`,`target`,`description`,`keywords`,`sort`,`in_menu`,`in_list`,`show_modes`,`allow_comment`,`is_audit`,`custom_list_view`,`custom_content_view`,`view_config`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('1','0','0,','0','1',NULL,'顶级栏目',NULL,NULL,NULL,NULL,NULL,0,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('10','1','0,1,','1','4','article','软件介绍',NULL,NULL,NULL,NULL,NULL,20,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('11','10','0,1,10,','1','4','article','网络工具',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('12','10','0,1,10,','1','4','article','浏览工具',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('13','10','0,1,10,','1','4','article','浏览辅助',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('14','10','0,1,10,','1','4','article','网络优化',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('15','10','0,1,10,','1','4','article','邮件处理',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('16','10','0,1,10,','1','4','article','下载工具',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('17','10','0,1,10,','1','4','article','搜索工具',NULL,NULL,NULL,NULL,NULL,50,'1','1','2','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('18','1','0,1,','1','5','link','友情链接',NULL,NULL,NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('19','18','0,1,18,','1','5','link','常用网站',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('2','1','0,1,','1','3','article','组织机构',NULL,NULL,NULL,NULL,NULL,10,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('20','18','0,1,18,','1','5','link','门户网站',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('21','18','0,1,18,','1','5','link','购物网站',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('22','18','0,1,18,','1','5','link','交友社区',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('23','18','0,1,18,','1','5','link','音乐视频',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('24','1','0,1,','1','6',NULL,'百度一下',NULL,'http://www.baidu.com','_blank',NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('25','1','0,1,','1','6',NULL,'全文检索',NULL,'/search',NULL,NULL,NULL,90,'0','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('26','1','0,1,','2','6','article','测试栏目',NULL,NULL,NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('27','1','0,1,','1','6',NULL,'公共留言',NULL,'/guestbook',NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('3','2','0,1,2,','1','3','article','网站简介',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('4','2','0,1,2,','1','3','article','内部机构',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('5','2','0,1,2,','1','3','article','地方机构',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('6','1','0,1,','1','3','article','质量检验',NULL,NULL,NULL,NULL,NULL,20,'1','1','1','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('7','6','0,1,6,','1','3','article','产品质量',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('8','6','0,1,6,','1','3','article','技术质量',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('9','6','0,1,6,','1','3','article','工程质量',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `cms_comment` */

DROP TABLE IF EXISTS `cms_comment`;

CREATE TABLE `cms_comment` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `category_id` varchar(64) NOT NULL COMMENT '栏目编号',
  `content_id` varchar(64) NOT NULL COMMENT '栏目内容的编号',
  `title` varchar(255) DEFAULT NULL COMMENT '栏目内容的标题',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `name` varchar(100) DEFAULT NULL COMMENT '评论姓名',
  `ip` varchar(100) DEFAULT NULL COMMENT '评论IP',
  `create_date` datetime NOT NULL COMMENT '评论时间',
  `audit_user_id` varchar(64) DEFAULT NULL COMMENT '审核人',
  `audit_date` datetime DEFAULT NULL COMMENT '审核时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_comment_category_id` (`category_id`),
  KEY `cms_comment_content_id` (`content_id`),
  KEY `cms_comment_status` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

/*Data for the table `cms_comment` */

/*Table structure for table `cms_guestbook` */

DROP TABLE IF EXISTS `cms_guestbook`;

CREATE TABLE `cms_guestbook` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) NOT NULL COMMENT '留言分类',
  `content` varchar(255) NOT NULL COMMENT '留言内容',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `phone` varchar(100) NOT NULL COMMENT '电话',
  `workunit` varchar(100) NOT NULL COMMENT '单位',
  `ip` varchar(100) NOT NULL COMMENT 'IP',
  `create_date` datetime NOT NULL COMMENT '留言时间',
  `re_user_id` varchar(64) DEFAULT NULL COMMENT '回复人',
  `re_date` datetime DEFAULT NULL COMMENT '回复时间',
  `re_content` varchar(100) DEFAULT NULL COMMENT '回复内容',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_guestbook_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留言板';

/*Data for the table `cms_guestbook` */

/*Table structure for table `cms_link` */

DROP TABLE IF EXISTS `cms_link`;

CREATE TABLE `cms_link` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `category_id` varchar(64) NOT NULL COMMENT '栏目编号',
  `title` varchar(255) NOT NULL COMMENT '链接名称',
  `color` varchar(50) DEFAULT NULL COMMENT '标题颜色',
  `image` varchar(255) DEFAULT NULL COMMENT '链接图片',
  `href` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `weight` int(11) DEFAULT '0' COMMENT '权重，越大越靠前',
  `weight_date` datetime DEFAULT NULL COMMENT '权重期限',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_link_category_id` (`category_id`),
  KEY `cms_link_title` (`title`),
  KEY `cms_link_del_flag` (`del_flag`),
  KEY `cms_link_weight` (`weight`),
  KEY `cms_link_create_by` (`create_by`),
  KEY `cms_link_update_date` (`update_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='友情链接';

/*Data for the table `cms_link` */

insert  into `cms_link`(`id`,`category_id`,`title`,`color`,`image`,`href`,`weight`,`weight_date`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('1','19','JeeSite',NULL,NULL,'http://thinkgem.github.com/jeesite',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('10','22','58同城',NULL,NULL,'http://www.58.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('11','23','视频大全',NULL,NULL,'http://v.360.cn/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('12','23','凤凰网',NULL,NULL,'http://www.ifeng.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('2','19','ThinkGem',NULL,NULL,'http://thinkgem.iteye.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('3','19','百度一下',NULL,NULL,'http://www.baidu.com',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('4','19','谷歌搜索',NULL,NULL,'http://www.google.com',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('5','20','新浪网',NULL,NULL,'http://www.sina.com.cn',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('6','20','腾讯网',NULL,NULL,'http://www.qq.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('7','21','淘宝网',NULL,NULL,'http://www.taobao.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('8','21','新华网',NULL,NULL,'http://www.xinhuanet.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('9','22','赶集网',NULL,NULL,'http://www.ganji.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `cms_site` */

DROP TABLE IF EXISTS `cms_site`;

CREATE TABLE `cms_site` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(100) NOT NULL COMMENT '站点名称',
  `title` varchar(100) NOT NULL COMMENT '站点标题',
  `logo` varchar(255) DEFAULT NULL COMMENT '站点Logo',
  `domain` varchar(255) DEFAULT NULL COMMENT '站点域名',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `theme` varchar(255) DEFAULT 'default' COMMENT '主题',
  `copyright` text COMMENT '版权信息',
  `custom_index_view` varchar(255) DEFAULT NULL COMMENT '自定义站点首页视图',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_site_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站点表';

/*Data for the table `cms_site` */

insert  into `cms_site`(`id`,`name`,`title`,`logo`,`domain`,`description`,`keywords`,`theme`,`copyright`,`custom_index_view`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('1','默认站点','TaurusXS门户',NULL,NULL,'TaurusXS 门户','TaurusXS 门户','basic','Copyright &copy; 2016-2017 <a href=\"https://github.com/sailorhdx/taurusxs\" target=\"_blank\">TaurusXS</a> - Powered By TaurusX',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('2','子站点测试','TaurusXS子站',NULL,NULL,'TaurusXS 子站','TaurusXS 子站','basic','Copyright &copy; 2016-2017 <a href=\"https://github.com/sailorhdx/taurusxs\" target=\"_blank\">TaurusXS</a> - Powered By TaurusX',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `cms_site_user` */

DROP TABLE IF EXISTS `cms_site_user`;

CREATE TABLE `cms_site_user` (
  `site_id` varchar(64) NOT NULL COMMENT '站点编号',
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `is_default` char(1) DEFAULT '0' COMMENT '是否是默认站点',
  PRIMARY KEY (`site_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站点-用户';

/*Data for the table `cms_site_user` */

/*Table structure for table `gen_scheme` */

DROP TABLE IF EXISTS `gen_scheme`;

CREATE TABLE `gen_scheme` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) DEFAULT NULL COMMENT '分类',
  `package_name` varchar(500) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(500) DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(100) DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(100) DEFAULT NULL COMMENT '生成功能作者',
  `gen_table_id` varchar(200) DEFAULT NULL COMMENT '生成表编号',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_scheme_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生成方案';

/*Data for the table `gen_scheme` */

insert  into `gen_scheme`(`id`,`name`,`category`,`package_name`,`module_name`,`sub_module_name`,`function_name`,`function_name_simple`,`function_author`,`gen_table_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('35a13dc260284a728a270db3f382664b','树结构','treeTable','com.taurusx.xsite.modules','test',NULL,'树结构生成','树结构','TaurusX','f6e4dafaa72f4c509636484715f33a96','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('9c9de9db6da743bb899036c6546061ac','单表','curd','com.taurusx.xsite.modules','test',NULL,'单表生成','单表','TaurusX','aef6f1fc948f4c9ab1c1b780bc471cc2','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('e6d905fd236b46d1af581dd32bdfb3b0','主子表','curd_many','com.taurusx.xsite.modules','test',NULL,'主子表生成','主子表','TaurusX','43d6d5acffa14c258340ce6765e46c6f','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0');

/*Table structure for table `gen_table` */

DROP TABLE IF EXISTS `gen_table`;

CREATE TABLE `gen_table` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) DEFAULT NULL COMMENT '描述',
  `class_name` varchar(100) DEFAULT NULL COMMENT '实体类名称',
  `parent_table` varchar(200) DEFAULT NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) DEFAULT NULL COMMENT '关联父表外键',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_name` (`name`),
  KEY `gen_table_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务表';

/*Data for the table `gen_table` */

insert  into `gen_table`(`id`,`name`,`comments`,`class_name`,`parent_table`,`parent_table_fk`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('43d6d5acffa14c258340ce6765e46c6f','test_data_main','业务数据表','TestDataMain',NULL,NULL,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('6e05c389f3c6415ea34e55e9dfb28934','test_data_child','业务数据子表','TestDataChild','test_data_main','test_data_main_id','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('aef6f1fc948f4c9ab1c1b780bc471cc2','test_data','业务数据表','TestData',NULL,NULL,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('f6e4dafaa72f4c509636484715f33a96','test_tree','树结构表','TestTree',NULL,NULL,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0');

/*Table structure for table `gen_table_column` */

DROP TABLE IF EXISTS `gen_table_column`;

CREATE TABLE `gen_table_column` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) DEFAULT NULL COMMENT '描述',
  `jdbc_type` varchar(100) DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键',
  `is_null` char(1) DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_column_table_id` (`gen_table_id`),
  KEY `gen_table_column_name` (`name`),
  KEY `gen_table_column_sort` (`sort`),
  KEY `gen_table_column_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务表字段';

/*Data for the table `gen_table_column` */

insert  into `gen_table_column`(`id`,`gen_table_id`,`name`,`comments`,`jdbc_type`,`java_type`,`java_field`,`is_pk`,`is_null`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`show_type`,`dict_type`,`settings`,`sort`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('0902a0cb3e8f434280c20e9d771d0658','aef6f1fc948f4c9ab1c1b780bc471cc2','sex','性别','char(1)','String','sex','0','1','1','1','1','1','=','radiobox','sex',NULL,6,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('103fc05c88ff40639875c2111881996a','aef6f1fc948f4c9ab1c1b780bc471cc2','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,9,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('12fa38dd986e41908f7fefa5839d1220','6e05c389f3c6415ea34e55e9dfb28934','create_by','创建者','varchar2(64)','com.taurusx.xsite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,4,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('195ee9241f954d008fe01625f4adbfef','f6e4dafaa72f4c509636484715f33a96','create_by','创建者','varchar2(64)','com.taurusx.xsite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,6,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('19c6478b8ff54c60910c2e4fc3d27503','43d6d5acffa14c258340ce6765e46c6f','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,1,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('1ac6562f753d4e599693840651ab2bf7','43d6d5acffa14c258340ce6765e46c6f','in_date','加入日期','date(7)','java.util.Date','inDate','0','1','1','1','0','0','=','dateselect',NULL,NULL,7,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('1b8eb55f65284fa6b0a5879b6d8ad3ec','aef6f1fc948f4c9ab1c1b780bc471cc2','in_date','加入日期','date(7)','java.util.Date','inDate','0','1','1','1','0','1','between','dateselect',NULL,NULL,7,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('1d5ca4d114be41e99f8dc42a682ba609','aef6f1fc948f4c9ab1c1b780bc471cc2','user_id','归属用户','varchar2(64)','com.taurusx.xsite.modules.sys.entity.User','user.id|name','0','1','1','1','1','1','=','userselect',NULL,NULL,2,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('21756504ffdc487eb167a823f89c0c06','43d6d5acffa14c258340ce6765e46c6f','update_by','更新者','varchar2(64)','com.taurusx.xsite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,10,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('24bbdc0a555e4412a106ab1c5f03008e','f6e4dafaa72f4c509636484715f33a96','parent_ids','所有父级编号','varchar2(2000)','String','parentIds','0','0','1','1','0','0','like','input',NULL,NULL,3,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('33152ce420904594b3eac796a27f0560','6e05c389f3c6415ea34e55e9dfb28934','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,1,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('35af241859624a01917ab64c3f4f0813','aef6f1fc948f4c9ab1c1b780bc471cc2','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,13,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('398b4a03f06940bfb979ca574e1911e3','aef6f1fc948f4c9ab1c1b780bc471cc2','create_by','创建者','varchar2(64)','com.taurusx.xsite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,8,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('3a7cf23ae48a4c849ceb03feffc7a524','43d6d5acffa14c258340ce6765e46c6f','area_id','归属区域','nvarchar2(64)','com.taurusx.xsite.modules.sys.entity.Area','area.id|name','0','1','1','1','0','0','=','areaselect',NULL,NULL,4,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('3d9c32865bb44e85af73381df0ffbf3d','43d6d5acffa14c258340ce6765e46c6f','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,11,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('416c76d2019b4f76a96d8dc3a8faf84c','f6e4dafaa72f4c509636484715f33a96','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,9,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('46e6d8283270493687085d29efdecb05','f6e4dafaa72f4c509636484715f33a96','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,11,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('4a0a1fff86ca46519477d66b82e01991','aef6f1fc948f4c9ab1c1b780bc471cc2','name','名称','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input',NULL,NULL,5,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('4c8ef12cb6924b9ba44048ba9913150b','43d6d5acffa14c258340ce6765e46c6f','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,9,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('53d65a3d306d4fac9e561db9d3c66912','6e05c389f3c6415ea34e55e9dfb28934','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,9,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('56fa71c0bd7e4132931874e548dc9ba5','6e05c389f3c6415ea34e55e9dfb28934','update_by','更新者','varchar2(64)','com.taurusx.xsite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,6,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('5a4a1933c9c844fdba99de043dc8205e','aef6f1fc948f4c9ab1c1b780bc471cc2','update_by','更新者','varchar2(64)','com.taurusx.xsite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,10,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('5e5c69bd3eaa4dcc9743f361f3771c08','aef6f1fc948f4c9ab1c1b780bc471cc2','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,1,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('633f5a49ec974c099158e7b3e6bfa930','f6e4dafaa72f4c509636484715f33a96','name','名称','nvarchar2(100)','String','name','0','0','1','1','1','1','like','input',NULL,NULL,4,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('652491500f2641ffa7caf95a93e64d34','6e05c389f3c6415ea34e55e9dfb28934','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,7,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('6763ff6dc7cd4c668e76cf9b697d3ff6','f6e4dafaa72f4c509636484715f33a96','sort','排序','number(10)','Integer','sort','0','0','1','1','1','0','=','input',NULL,NULL,5,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('67d0331f809a48ee825602659f0778e8','43d6d5acffa14c258340ce6765e46c6f','name','名称','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input',NULL,NULL,5,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('68345713bef3445c906f70e68f55de38','6e05c389f3c6415ea34e55e9dfb28934','test_data_main_id','业务主表','varchar2(64)','String','testDataMain.id','0','1','1','1','0','0','=','input',NULL,NULL,2,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('71ea4bc10d274911b405f3165fc1bb1a','aef6f1fc948f4c9ab1c1b780bc471cc2','area_id','归属区域','nvarchar2(64)','com.taurusx.xsite.modules.sys.entity.Area','area.id|name','0','1','1','1','1','1','=','areaselect',NULL,NULL,4,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('7f871058d94c4d9a89084be7c9ce806d','6e05c389f3c6415ea34e55e9dfb28934','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','input',NULL,NULL,8,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('8b48774cfe184913b8b5eb17639cf12d','43d6d5acffa14c258340ce6765e46c6f','create_by','创建者','varchar2(64)','com.taurusx.xsite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,8,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('8b7cf0525519474ebe1de9e587eb7067','6e05c389f3c6415ea34e55e9dfb28934','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,5,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('8b9de88df53e485d8ef461c4b1824bc1','43d6d5acffa14c258340ce6765e46c6f','user_id','归属用户','varchar2(64)','com.taurusx.xsite.modules.sys.entity.User','user.id|name','0','1','1','1','1','1','=','userselect',NULL,NULL,2,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('8da38dbe5fe54e9bb1f9682c27fbf403','aef6f1fc948f4c9ab1c1b780bc471cc2','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea',NULL,NULL,12,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('92481c16a0b94b0e8bba16c3c54eb1e4','f6e4dafaa72f4c509636484715f33a96','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,7,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('9a012c1d2f934dbf996679adb7cc827a','f6e4dafaa72f4c509636484715f33a96','parent_id','父级编号','varchar2(64)','This','parent.id|name','0','0','1','1','0','0','=','treeselect',NULL,NULL,2,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('ad3bf0d4b44b4528a5211a66af88f322','aef6f1fc948f4c9ab1c1b780bc471cc2','office_id','归属部门','varchar2(64)','com.taurusx.xsite.modules.sys.entity.Office','office.id|name','0','1','1','1','1','1','=','officeselect',NULL,NULL,3,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('bb1256a8d1b741f6936d8fed06f45eed','f6e4dafaa72f4c509636484715f33a96','update_by','更新者','varchar2(64)','com.taurusx.xsite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,8,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('ca68a2d403f0449cbaa1d54198c6f350','43d6d5acffa14c258340ce6765e46c6f','office_id','归属部门','varchar2(64)','com.taurusx.xsite.modules.sys.entity.Office','office.id|name','0','1','1','1','0','0','=','officeselect',NULL,NULL,3,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('cb9c0ec3da26432d9cbac05ede0fd1d0','43d6d5acffa14c258340ce6765e46c6f','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea',NULL,NULL,12,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('cfcfa06ea61749c9b4c4dbc507e0e580','f6e4dafaa72f4c509636484715f33a96','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,1,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('d5c2d932ae904aa8a9f9ef34cd36fb0b','43d6d5acffa14c258340ce6765e46c6f','sex','性别','char(1)','String','sex','0','1','1','1','0','1','=','select','sex',NULL,6,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('e64050a2ebf041faa16f12dda5dcf784','6e05c389f3c6415ea34e55e9dfb28934','name','名称','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input',NULL,NULL,3,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('e8d11127952d4aa288bb3901fc83127f','43d6d5acffa14c258340ce6765e46c6f','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,13,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('eb2e5afd13f147a990d30e68e7f64e12','aef6f1fc948f4c9ab1c1b780bc471cc2','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,11,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),
('f5ed8c82bad0413fbfcccefa95931358','f6e4dafaa72f4c509636484715f33a96','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea',NULL,NULL,10,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0');

/*Table structure for table `gen_template` */

DROP TABLE IF EXISTS `gen_template`;

CREATE TABLE `gen_template` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) DEFAULT NULL COMMENT '分类',
  `file_path` varchar(500) DEFAULT NULL COMMENT '生成文件路径',
  `file_name` varchar(200) DEFAULT NULL COMMENT '生成文件名',
  `content` text COMMENT '内容',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_template_del_falg` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码模板表';

/*Data for the table `gen_template` */

/*Table structure for table `oa_leave` */

DROP TABLE IF EXISTS `oa_leave`;

CREATE TABLE `oa_leave` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `process_instance_id` varchar(64) DEFAULT NULL COMMENT '流程实例编号',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `leave_type` varchar(20) DEFAULT NULL COMMENT '请假类型',
  `reason` varchar(255) DEFAULT NULL COMMENT '请假理由',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `reality_start_time` datetime DEFAULT NULL COMMENT '实际开始时间',
  `reality_end_time` datetime DEFAULT NULL COMMENT '实际结束时间',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `oa_leave_create_by` (`create_by`),
  KEY `oa_leave_process_instance_id` (`process_instance_id`),
  KEY `oa_leave_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='请假流程表';

/*Data for the table `oa_leave` */

/*Table structure for table `oa_notify` */

DROP TABLE IF EXISTS `oa_notify`;

CREATE TABLE `oa_notify` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT NULL COMMENT '类型',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `content` varchar(2000) DEFAULT NULL COMMENT '内容',
  `files` varchar(2000) DEFAULT NULL COMMENT '附件',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `oa_notify_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知通告';

/*Data for the table `oa_notify` */

/*Table structure for table `oa_notify_record` */

DROP TABLE IF EXISTS `oa_notify_record`;

CREATE TABLE `oa_notify_record` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `oa_notify_id` varchar(64) DEFAULT NULL COMMENT '通知通告ID',
  `user_id` varchar(64) DEFAULT NULL COMMENT '接受人',
  `read_flag` char(1) DEFAULT '0' COMMENT '阅读标记',
  `read_date` date DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`),
  KEY `oa_notify_record_notify_id` (`oa_notify_id`),
  KEY `oa_notify_record_user_id` (`user_id`),
  KEY `oa_notify_record_read_flag` (`read_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知通告发送记录';

/*Data for the table `oa_notify_record` */

/*Table structure for table `oa_test_audit` */

DROP TABLE IF EXISTS `oa_test_audit`;

CREATE TABLE `oa_test_audit` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `PROC_INS_ID` varchar(64) DEFAULT NULL COMMENT '流程实例ID',
  `USER_ID` varchar(64) DEFAULT NULL COMMENT '变动用户',
  `OFFICE_ID` varchar(64) DEFAULT NULL COMMENT '归属部门',
  `POST` varchar(255) DEFAULT NULL COMMENT '岗位',
  `AGE` char(1) DEFAULT NULL COMMENT '性别',
  `EDU` varchar(255) DEFAULT NULL COMMENT '学历',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '调整原因',
  `OLDA` varchar(255) DEFAULT NULL COMMENT '现行标准 薪酬档级',
  `OLDB` varchar(255) DEFAULT NULL COMMENT '现行标准 月工资额',
  `OLDC` varchar(255) DEFAULT NULL COMMENT '现行标准 年薪总额',
  `NEWA` varchar(255) DEFAULT NULL COMMENT '调整后标准 薪酬档级',
  `NEWB` varchar(255) DEFAULT NULL COMMENT '调整后标准 月工资额',
  `NEWC` varchar(255) DEFAULT NULL COMMENT '调整后标准 年薪总额',
  `ADD_NUM` varchar(255) DEFAULT NULL COMMENT '月增资',
  `EXE_DATE` varchar(255) DEFAULT NULL COMMENT '执行时间',
  `HR_TEXT` varchar(255) DEFAULT NULL COMMENT '人力资源部门意见',
  `LEAD_TEXT` varchar(255) DEFAULT NULL COMMENT '分管领导意见',
  `MAIN_LEAD_TEXT` varchar(255) DEFAULT NULL COMMENT '集团主要领导意见',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `OA_TEST_AUDIT_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审批流程测试表';

/*Data for the table `oa_test_audit` */

/*Table structure for table `sys_area` */

DROP TABLE IF EXISTS `sys_area`;

CREATE TABLE `sys_area` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';

/*Data for the table `sys_area` */

insert  into `sys_area`(`id`,`parent_id`,`parent_ids`,`name`,`sort`,`code`,`type`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('03f3897f788d427cb9fbca0d39f4ef46','fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','门头沟区',110,'110109','4','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('055b361f43c8462d8031b2ce06cbb1e4','6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','丹东市',60,'210600','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('056c77a36c45456a8f97981c40614827','0','0,','天津市',20,'120000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('0bc520e89efa4b5080757ea07e07da94','0','0,','广东省',190,'440000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('0c693eed543a477da4e91cac504fda34','6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','鞍山市',30,'210300','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('0ccaf98253b74175a3329b4b5bc74fd6','ea6012c760cd4d52bab85f9e9a87053f','0,ea6012c760cd4d52bab85f9e9a87053f,','佳木斯市',80,'230800','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('0f055fd1dec44c74b96d47d6a30264d8','0','0,','上海市',90,'310000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('1b16d8fe258b4fd09c4635fcec6618d8','6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','本溪市',50,'210500','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('1c6beeabceff408a83cbb479e5b0529d','ea6012c760cd4d52bab85f9e9a87053f','0,ea6012c760cd4d52bab85f9e9a87053f,','绥化市',120,'231200','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('1d1d95d470d748819712df3598ab6b5c','0','0,','广西壮族自治区',200,'450000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('1dab7807648847c69e62fc731c639ad9','aa295df36bd54262b8cbe1215b73effd','0,aa295df36bd54262b8cbe1215b73effd,','白山市',60,'220600','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('2328fad6a62c4a69ae6b0179c20204a4','aa295df36bd54262b8cbe1215b73effd','0,aa295df36bd54262b8cbe1215b73effd,','白城市',80,'220800','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('2540b494611a442cb04628ffbed7a720','fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','海淀区',100,'110108','4','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('25ec4ce547054921ad8a2c4bafe2a7d3','0','0,','新疆维吾尔自治区',310,'650000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('2784c6c69a724d80a9f0f726452e70ee','0','0,','重庆市',220,'500000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('28649e5559374da9a8e7b374d49a4ebe','c4852ba1d5ce42aab5654aae195b6e4a','0,6613a5ca7b7b4354959a4d98a85662ad,c4852ba1d5ce42aab5654aae195b6e4a,','中山区',30,'210202','4','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('2870ca0cabfb4730b5264210b19d862c','ea6012c760cd4d52bab85f9e9a87053f','0,ea6012c760cd4d52bab85f9e9a87053f,','牡丹江市',100,'231000','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('291bfc1ee5274769a7bbe65b1a50d00a','ea6012c760cd4d52bab85f9e9a87053f','0,ea6012c760cd4d52bab85f9e9a87053f,','鹤岗市',40,'230400','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('2a67d486a86c424cb15172a78a4d24ec','0','0,','甘肃省',280,'620000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('2e091e415f8e4b97a2f7069a7422a1f7','8046fa8eb55a472383d090450a04bda0','0,8046fa8eb55a472383d090450a04bda0,','县',30,'110200','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('36ace62faa2a498abd448253f2133843','aa295df36bd54262b8cbe1215b73effd','0,aa295df36bd54262b8cbe1215b73effd,','长春市',10,'220100','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('3bc71c3989054035ad9bd6f98a37db7e','0','0,','山东省',150,'370000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('3bdd8f6e0ee94220b33de5a45ad36f5a','6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','沈阳市',10,'210100','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('3e138a3169254e80a19922135153ea85','6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','辽阳市',100,'211000','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('416fc049a9ec42c38ed441ce59fa03d2','c4852ba1d5ce42aab5654aae195b6e4a','0,6613a5ca7b7b4354959a4d98a85662ad,c4852ba1d5ce42aab5654aae195b6e4a,','金州区',30,'210213','1','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('42ed4ca213f04d42901a27bc7941c0e7','6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','锦州市',70,'210700','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('475a009485f443c3835e5d9a510c1a58','0','0,','浙江省',110,'330000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('4946f589bcb543d58c314fadd9ff3f8a','0','0,','台湾省',320,'710000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('4a0d6382075d4f699d364bfa196f8b5a','c4852ba1d5ce42aab5654aae195b6e4a','0,6613a5ca7b7b4354959a4d98a85662ad,c4852ba1d5ce42aab5654aae195b6e4a,','瓦房店市',30,'210281','4','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('4cc7e343a4054e9ba00f58a1a48daee5','0','0,','青海省',290,'630000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('56b26955df0e4b1fa47b599b8c305702','fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','宣武区',60,'110104','4','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('570461755d3f410a8d279aceb6adb7f9','0','0,','河南省',160,'410000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('58b663db40fb4c598f727f8ef615eb48','2e091e415f8e4b97a2f7069a7422a1f7','0,8046fa8eb55a472383d090450a04bda0,2e091e415f8e4b97a2f7069a7422a1f7,','延庆县',50,'110229','4','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('59c87c0ee86f4d0595028fd9c9a02ded','ea6012c760cd4d52bab85f9e9a87053f','0,ea6012c760cd4d52bab85f9e9a87053f,','大庆市',60,'230600','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('5ae738aa1ef048eca1bbe3946a81f358','6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','盘锦市',110,'211100','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('5ae918cdf987434fb0b5e043c515c9ad','6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','朝阳市',130,'211300','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('5d104b62066343389f4dd58354d67853','fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','房山区',120,'110111','4','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('5dc90917b32b485cb929c5f3fac18ae2','aa295df36bd54262b8cbe1215b73effd','0,aa295df36bd54262b8cbe1215b73effd,','延边朝鲜族自治州',90,'222400','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('63f9a376edf44073a185f204c52d746f','fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','怀柔区',170,'110116','4','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('64e88d11e9124efeab9cb6aad2d990c4','0','0,','宁夏回族自治区',300,'640000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('65c12352ec49413a9b14512f446f6129','0','0,','贵州省',240,'520000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('65c7e2639d3c4c2784a64261c7ab2260','ea6012c760cd4d52bab85f9e9a87053f','0,ea6012c760cd4d52bab85f9e9a87053f,','七台河市',90,'230900','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('6613a5ca7b7b4354959a4d98a85662ad','0','0,','辽宁省',60,'210000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('672b6f1f6552461db89315c64228715a','ea6012c760cd4d52bab85f9e9a87053f','0,ea6012c760cd4d52bab85f9e9a87053f,','齐齐哈尔市',20,'230200','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('6d1dafecada24be1ad3aa0a471ddc4dd','6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','营口市',80,'210800','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('756c9927ae1a48db92bc69d9cdb18982','fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','丰台区',80,'110106','4','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('75d8123f757849e4b8ca66835e207b47','aa295df36bd54262b8cbe1215b73effd','0,aa295df36bd54262b8cbe1215b73effd,','吉林市',20,'220200','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('7be9efb51c52478dbc893707fbeff470','c4852ba1d5ce42aab5654aae195b6e4a','0,6613a5ca7b7b4354959a4d98a85662ad,c4852ba1d5ce42aab5654aae195b6e4a,','西岗区',30,'210203','4','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('7c85090834a94015874343d8ec79654d','0','0,','陕西省',270,'610000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('7d42dc81d80f4a58bfd26b95dae12550','6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','葫芦岛市',140,'211400','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('8046fa8eb55a472383d090450a04bda0','0','0,','北京市',10,'110000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('8327007c554a4f7bb20c097199653958','0','0,','四川省',230,'510000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('8a314467ac5e4b808d42c206fa234ee0','ea6012c760cd4d52bab85f9e9a87053f','0,ea6012c760cd4d52bab85f9e9a87053f,','哈尔滨市',10,'230100','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('8ba6169d5f4644098a971d8ae8abe20d','fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','昌平区',150,'110114','4','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('8f0adb8c6d5046368eda8810886aa40b','fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','崇文区',50,'110103','4','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('8f768a21a7c64dce9fb8d717cf3d87a8','0','0,','澳门特别行政区',340,'730000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('99f67f2ce69d47d0ace28de1b7c38195','0','0,','西藏自治区',260,'540000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('99fe7749009a46ee9189c644016ae3f6','0','0,','香港特别行政区',330,'720000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('9bb452a3c73e4bf0a336c8e094ba61e8','c4852ba1d5ce42aab5654aae195b6e4a','0,6613a5ca7b7b4354959a4d98a85662ad,c4852ba1d5ce42aab5654aae195b6e4a,','旅顺口区',30,'210212','4','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('9e113740a556406ebb9f2f7544a41bc7','0','0,','内蒙古自治区',50,'150000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('a077a509f53a4dd2aa015e8dde2c0f36','0','0,','河北省',30,'130000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('a4e7730b369740cc85ae97290995f742','fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','大兴区',160,'110115','4','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('a78dbcb3945d47848e2bdadb0161ef8f','aa295df36bd54262b8cbe1215b73effd','0,aa295df36bd54262b8cbe1215b73effd,','四平市',30,'220300','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('a7b1db5849284be0bd1be9c908b16c5a','0','0,','湖北省',170,'420000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('aa295df36bd54262b8cbe1215b73effd','0','0,','吉林省',70,'220000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('aadfdac47e8e4ff1886c7285fdbc9984','0','0,','海南省',210,'460000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('ab64d8e6de524295ac21f32050426999','0','0,','云南省',250,'530000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('ac3b68500c3840fbbbcdd01138ae1fe7','0','0,','山西省',40,'140000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('b008019b0e7a48b4a7edd78c9f50100d','aa295df36bd54262b8cbe1215b73effd','0,aa295df36bd54262b8cbe1215b73effd,','辽源市',40,'220400','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('b925f547db6b42e7a8a664466d816637','6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','抚顺市',40,'210400','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('ba14de1c56b249af846cf3c70b89d051','aa295df36bd54262b8cbe1215b73effd','0,aa295df36bd54262b8cbe1215b73effd,','通化市',50,'220500','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('ba3edf28d1ef4a2b963ef1243c50fb05','aa295df36bd54262b8cbe1215b73effd','0,aa295df36bd54262b8cbe1215b73effd,','松原市',70,'220700','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('bd59f27301e9460bb964415e06fb9998','c4852ba1d5ce42aab5654aae195b6e4a','0,6613a5ca7b7b4354959a4d98a85662ad,c4852ba1d5ce42aab5654aae195b6e4a,','甘井子区',30,'210211','4','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('be64f87a769140b7b836d76bebbe91a9','0','0,','湖南省',180,'430000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('c4852ba1d5ce42aab5654aae195b6e4a','6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','大连市',20,'210200','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('c6e779a1fc4548858afe7a1523b8d773','ea6012c760cd4d52bab85f9e9a87053f','0,ea6012c760cd4d52bab85f9e9a87053f,','双鸭山市',50,'230500','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('c72e4605133b481aaff535032902b9d7','fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','平谷区',180,'110117','4','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('ce5371317d38416ead7f59cb7647049e','6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','阜新市',90,'210900','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('d0e5ed04eed6469a877ae4a59eab9ca7','0','0,','安徽省',120,'34000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('d48edbd08e274b69966cb3755fc575ab','ea6012c760cd4d52bab85f9e9a87053f','0,ea6012c760cd4d52bab85f9e9a87053f,','黑河市',110,'231100','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('d7437d7fe0df4ef18312aff4ef7a39d3','c4852ba1d5ce42aab5654aae195b6e4a','0,6613a5ca7b7b4354959a4d98a85662ad,c4852ba1d5ce42aab5654aae195b6e4a,','长海县',30,'210224','4','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('dc66879ff9264daa91d8b1e084f3adc3','0','0,','江苏省',100,'320000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('dd6125419d894c1f8fd19047d292ad55','fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','顺义区',140,'110113','4','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('de579e01164c4d368c11f10f2633b2f5','c4852ba1d5ce42aab5654aae195b6e4a','0,6613a5ca7b7b4354959a4d98a85662ad,c4852ba1d5ce42aab5654aae195b6e4a,','庄河市',30,'210283','4','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('de58e7b967954db0b73fb9c99c1f1726','c4852ba1d5ce42aab5654aae195b6e4a','0,6613a5ca7b7b4354959a4d98a85662ad,c4852ba1d5ce42aab5654aae195b6e4a,','普兰店市',30,'210282','4','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('de8eba22468e4999812f72a464a887bc','0','0,','江西省',140,'36000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('df2e038a8bf1420abef1e019d10057d0','fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','石景山区',90,'110107','4','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('e30f2546bffc479b9b23b9dccc62dd7d','fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','通州区',130,'110112','4','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('e579ce16ba2f4844803bea2334d5a020','fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','东城区',30,'110101','4','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('e5efd6ecc7344e3ca77b9bbe743a42e9','ea6012c760cd4d52bab85f9e9a87053f','0,ea6012c760cd4d52bab85f9e9a87053f,','鸡西市',30,'230300','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('e60448111456470091a3236b717ccd11','fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','西城区',40,'110102','4','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('ea6012c760cd4d52bab85f9e9a87053f','0','0,','黑龙江省',80,'230000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('eebf2964a4bb47f49cfceaf523e2955f','ea6012c760cd4d52bab85f9e9a87053f','0,ea6012c760cd4d52bab85f9e9a87053f,','伊春市',70,'230700','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('f04844e673b34402ad21fb14e9b9cd5c','2e091e415f8e4b97a2f7069a7422a1f7','0,8046fa8eb55a472383d090450a04bda0,2e091e415f8e4b97a2f7069a7422a1f7,','密云县',40,'110228','4','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('f68c5d28aa394e26bfd1a3448d358a38','ea6012c760cd4d52bab85f9e9a87053f','0,ea6012c760cd4d52bab85f9e9a87053f,','大兴安岭地区',130,'232700','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('f6989448a6714df69bcaff6ce6f4a72c','6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','铁岭市',120,'211200','3','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('fa4ed0b736724f388dbcf177a81e9312','fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','朝阳区',70,'110105','4','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('fa7ca81206904d6a96ed9de3f0ae5fe5','8046fa8eb55a472383d090450a04bda0','0,8046fa8eb55a472383d090450a04bda0,','市辖区',20,'110100','3','1','2017-04-26 08:00:00','1','2017-04-26 23:08:49',NULL,'0'),
('fadcce7c22d24fd7aa1bc27b926e23bd','0','0,','福建省',130,'350000','2','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0'),
('fff33f88f69f490e9aa31680d42e3026','c4852ba1d5ce42aab5654aae195b6e4a','0,6613a5ca7b7b4354959a4d98a85662ad,c4852ba1d5ce42aab5654aae195b6e4a,','沙河口区',30,'210204','4','1','2017-04-26 08:00:00','1','2017-04-26 08:00:00',NULL,'0');

/*Table structure for table `sys_cert` */

DROP TABLE IF EXISTS `sys_cert`;

CREATE TABLE `sys_cert` (
  `id` varchar(64) NOT NULL COMMENT '编号，自动生成',
  `owner_id` varchar(64) DEFAULT NULL COMMENT '所有者ID',
  `type` varchar(64) DEFAULT NULL COMMENT '证件类型',
  `no` varchar(64) DEFAULT NULL COMMENT '证号',
  `issued_date` datetime DEFAULT NULL COMMENT '核发日期',
  `issued_by` varchar(64) DEFAULT NULL COMMENT '核发机关',
  `valid_date` datetime DEFAULT NULL COMMENT '有效期',
  `ext_col1` varchar(128) DEFAULT NULL COMMENT '扩展信息1',
  `ext_col2` varchar(128) DEFAULT NULL COMMENT '扩展信息2',
  `ext_col3` varchar(128) DEFAULT NULL COMMENT '扩展信息3',
  `ext_col4` varchar(128) DEFAULT NULL COMMENT '扩展信息4',
  `ext_col5` varchar(128) DEFAULT NULL COMMENT '扩展信息5',
  `ext_col6` varchar(128) DEFAULT NULL COMMENT '扩展信息6',
  `ext_col7` varchar(128) DEFAULT NULL COMMENT '扩展信息7',
  `ext_col8` varchar(128) DEFAULT NULL COMMENT '扩展信息8',
  `ext_col9` varchar(128) DEFAULT NULL COMMENT '扩展信息9',
  `ext_col10` varchar(128) DEFAULT NULL COMMENT '扩展信息10',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(512) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='证件信息表';

/*Data for the table `sys_cert` */

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) DEFAULT '0' COMMENT '父级编号',
  `parent_ids` varchar(2000) DEFAULT '0,' COMMENT '所有父级编号',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`id`,`value`,`label`,`type`,`description`,`sort`,`parent_id`,`parent_ids`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('00eb6a43f16a49158a6ba6d5ba81dee9','9000','出租运输','JTT-415-524-YSLJYFW','运输类经营范围',90,'0','0,','1','2017-04-20 18:10:52','1','2017-04-20 18:10:52',NULL,'0'),
('0274e309b70740d69ff07b033a8a1fd4','23','大型物件运输','JTT-415-521-YSLHYLB','运输类行业类别',30,'b791bfcc620b4d76b89e9521003efeea','0,b791bfcc620b4d76b89e9521003efeea,','1','2017-04-20 17:51:48','1','2017-04-20 17:51:48',NULL,'0'),
('02d21e73ad644b10b381641a7e81e0f4','60','拖拉机','JTT-415-549-CLLCLLX','车辆类车辆类型',60,'0','0,','1','2017-04-20 18:23:48','1','2017-04-20 18:23:48',NULL,'0'),
('03f3897f788d427cb9fbca0d39f4ef46','110109','门头沟区','GBT-2260','中国行政区划代码',110,'fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','1','2017-04-19 21:52:18','1','2017-04-19 21:52:18',NULL,'0'),
('055b361f43c8462d8031b2ce06cbb1e4','210600','丹东市','GBT-2260','中国行政区划代码',60,'6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','1','2017-04-19 21:59:18','1','2017-04-19 21:59:18',NULL,'0'),
('056c77a36c45456a8f97981c40614827','120000','天津市','GBT-2260','中国行政区划代码',20,'0','0,','1','2017-04-18 19:57:32','1','2017-04-18 19:57:32',NULL,'0'),
('05c3777547924d558a729eeb88546ff7','10000','汽车租赁','JTT-415-524-YSLJYFW','运输类经营范围',100,'0','0,','1','2017-04-20 18:11:11','1','2017-04-20 18:11:11',NULL,'0'),
('063687dfbe484866b2284a9bbc9672c6','20','普通货车','JTT-415-549-CLLCLLX','车辆类车辆类型',20,'0','0,','1','2017-04-20 18:23:10','1','2017-04-20 18:23:10',NULL,'0'),
('06646ab131ad49c09b9f5168f1cd4413','2','柴油','JTT-415-545-CLLRLLX','车辆类燃料类型',20,'0','0,','1','2017-04-20 18:17:02','1','2017-04-20 18:17:02',NULL,'0'),
('0664ca0a41dd483697b310324e213d30','2','二级','JTT-415-542-CLLCLJSDJ','车辆类车辆技术等级',30,'0','0,','1','2017-04-20 18:13:20','1','2017-04-20 18:13:20',NULL,'0'),
('072f6a10c01140c1ba06ec6d63f9406a','闽','福建省','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',130,'0','0,','1','2017-04-19 22:53:47','1','2017-04-19 22:53:47',NULL,'0'),
('09c4b10ce64b40c28d2d03dd0ca72368','30','土族','GBT-3304','中国各民族名称代码',300,'0','0,','1','2017-04-19 22:34:20','1','2017-04-19 22:34:20',NULL,'0'),
('0b9a7120ea734d5c958ef6de5cac6841','10','朝鲜族','GBT-3304','中国各民族名称代码',100,'0','0,','1','2017-04-19 22:29:15','1','2017-04-19 22:29:15',NULL,'0'),
('0bc520e89efa4b5080757ea07e07da94','440000','广东省','GBT-2260','中国行政区划代码',190,'0','0,','1','2017-04-18 20:02:06','1','2017-04-18 20:02:06',NULL,'0'),
('0c693eed543a477da4e91cac504fda34','210300','鞍山市','GBT-2260','中国行政区划代码',30,'6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','1','2017-04-19 21:57:36','1','2017-04-19 21:57:36',NULL,'0'),
('0ccaf98253b74175a3329b4b5bc74fd6','230800','佳木斯市','GBT-2260','中国行政区划代码',80,'ea6012c760cd4d52bab85f9e9a87053f','0,ea6012c760cd4d52bab85f9e9a87053f,','1','2017-04-19 22:21:10','1','2017-04-19 22:21:10',NULL,'0'),
('0dffb628804640d68848e22c4428cff8','23','小型普通货车','JTT-415-549-CLLCLLX','车辆类车辆类型',30,'063687dfbe484866b2284a9bbc9672c6','0,063687dfbe484866b2284a9bbc9672c6,','1','2017-04-20 18:27:23','1','2017-04-20 18:27:23',NULL,'0'),
('0efb5ded78404fc49fdcc26909293be7','4','白色','JTT-415-5412-CLLCPYS','车辆类车牌颜色',40,'0','0,','1','2017-04-20 18:36:36','1','2017-04-20 18:36:36',NULL,'0'),
('0effd05c05ff4fe996eb092739a6d96d','31','迁出（过户）','JTT-415-546-CLLCLYYZT','车辆类车辆营运状态',40,'0','0,','1','2017-04-20 18:19:12','1','2017-04-20 18:19:12',NULL,'0'),
('0f055fd1dec44c74b96d47d6a30264d8','310000','上海市','GBT-2260','中国行政区划代码',90,'0','0,','1','2017-04-18 19:59:37','1','2017-04-18 19:59:37',NULL,'0'),
('0f894a8b2c2d453693ef4be6375d4873','晋','山西省','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',40,'0','0,','1','2017-04-19 22:52:11','1','2017-04-19 22:52:11',NULL,'0'),
('0fb1a9c5cb1940d6a676f46c19bdafd0','71','国际道路旅客运输','JTT-415-521-YSLHYLB','运输类行业类别',10,'cfb4f931d1e644fe95282528664ff3a2','0,cfb4f931d1e644fe95282528664ff3a2,','1','2017-04-20 17:58:04','1','2017-04-20 17:58:04',NULL,'0'),
('0fb1ec5c56ec4bf9937eb8b70750a5d4','45','鄂温克族','GBT-3304','中国各民族名称代码',450,'0','0,','1','2017-04-19 22:37:53','1','2017-04-19 22:37:53',NULL,'0'),
('0fe8de7f3d784dc3b5c058b7dab7244c','13','定线旅游','JTT-415-521-YSLHYLB','运输类行业类别',30,'7292b2d4951248bdb9aa9a9963c09d02','0,7292b2d4951248bdb9aa9a9963c09d02,','1','2017-04-20 17:50:23','1','2017-04-20 17:50:23',NULL,'0'),
('1','0','正常','del_flag','删除标记',10,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('10','yellow','黄色','color','颜色值',40,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('100','java.util.Date','Date','gen_java_type','Java类型\0\0',50,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('101','com.thinkgem.jeesite.modules.sys.entity.User','User','gen_java_type','Java类型\0\0',60,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('102','com.thinkgem.jeesite.modules.sys.entity.Office','Office','gen_java_type','Java类型\0\0',70,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('10231fbe2d334915b9eb2feb9743fee9','41','汽车维修','JTT-415-521-YSLHYLB','运输类行业类别',10,'bb7cdab9ac724a2f842dddef80acec94','0,bb7cdab9ac724a2f842dddef80acec94,','1','2017-04-20 17:52:46','1','2017-04-20 17:52:46',NULL,'0'),
('103','com.thinkgem.jeesite.modules.sys.entity.Area','Area','gen_java_type','Java类型\0\0',80,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('104','Custom','Custom','gen_java_type','Java类型\0\0',90,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('105','1','会议通告\0\0\0\0','oa_notify_type','通知通告类型',10,'0','0,','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),
('106','2','奖惩通告\0\0\0\0','oa_notify_type','通知通告类型',20,'0','0,','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),
('107','3','活动通告\0\0\0\0','oa_notify_type','通知通告类型',30,'0','0,','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),
('108','0','草稿','oa_notify_status','通知通告状态',10,'0','0,','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),
('109','1','发布','oa_notify_status','通知通告状态',20,'0','0,','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),
('11','orange','橙色','color','颜色值',50,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('110','0','未读','oa_notify_read','通知通告状态',10,'0','0,','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),
('111','1','已读','oa_notify_read','通知通告状态',20,'0','0,','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),
('111bb4f57ad34b99a5acef980628c1de','22','中型普通货车','JTT-415-549-CLLCLLX','车辆类车辆类型',20,'063687dfbe484866b2284a9bbc9672c6','0,063687dfbe484866b2284a9bbc9672c6,','1','2017-04-20 18:27:14','1','2017-04-20 18:27:14',NULL,'0'),
('112','security-role','管理员','role_type','角色类型',10,'0','0,','1','2017-04-07 08:00:00','1','2017-04-07 08:00:00',NULL,'0'),
('113','assignment','可进行任务分配','role_type','角色类型',20,'0','0,','1','2017-04-07 08:00:00','1','2017-04-07 08:00:00',NULL,'0'),
('114','user','普通用户','role_type','角色类型',30,'0','0,','1','2017-04-07 08:00:00','1','2017-04-07 08:00:00',NULL,'0'),
('115','content','content','sys_href_target','菜单打开方式',10,'0','0,','1','2017-04-07 08:00:00','1','2017-04-07 08:00:00',NULL,'0'),
('116','iframe','iframe','sys_href_target','菜单打开方式',20,'0','0,','1','2017-04-07 08:00:00','1','2017-04-07 08:00:00',NULL,'0'),
('117','_blank','_blank','sys_href_target','菜单打开方式',30,'0','0,','1','2017-04-07 08:00:00','1','2017-04-07 08:00:00',NULL,'0'),
('118','default','default','themecolor','主题颜色',10,'0','0,','1','2017-04-07 08:00:00','1','2017-04-07 08:00:00',NULL,'0'),
('119','darkblue','darkblue','themecolor','主题颜色',20,'0','0,','1','2017-04-07 08:00:00','1','2017-04-07 08:00:00',NULL,'0'),
('12','default','默认主题','theme','主题方案',10,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('120','blue','blue','themecolor','主题颜色',30,'0','0,','1','2017-04-07 08:00:00','1','2017-04-07 08:00:00',NULL,'0'),
('121','grey','grey','themecolor','主题颜色',40,'0','0,','1','2017-04-07 08:00:00','1','2017-04-07 08:00:00',NULL,'0'),
('122','light','light','themecolor','主题颜色',50,'0','0,','1','2017-04-07 08:00:00','1','2017-04-07 08:00:00',NULL,'0'),
('123','light2','light2','themecolor','主题颜色',60,'0','0,','1','2017-04-07 08:00:00','1','2017-04-07 08:00:00',NULL,'0'),
('1299f93c2233401489440faf9057756e','61','轮式拖拉机','JTT-415-549-CLLCLLX','车辆类车辆类型',10,'02d21e73ad644b10b381641a7e81e0f4','0,02d21e73ad644b10b381641a7e81e0f4,','1','2017-04-20 18:29:43','1','2017-04-20 18:29:43',NULL,'0'),
('13','cerulean','天蓝主题','theme','主题方案',20,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('137d92b60d2843d2a1b1376ebe426735','30','专用运输车','JTT-415-549-CLLCLLX','车辆类车辆类型',30,'0','0,','1','2017-04-20 18:23:20','1','2017-04-20 18:23:20',NULL,'0'),
('13bced384b2f4f539bbad1095694dd7a','100','汽车租赁','JTT-415-521-YSLHYLB','运输类行业类别',100,'0','0,','1','2017-04-20 17:48:49','1','2017-04-20 17:48:49',NULL,'0'),
('13be39a934004d089b2e68968c398899','13','小型客车','JTT-415-549-CLLCLLX','车辆类车辆类型',30,'5a33da74669d4d0d9eca8f3ebba21cbe','0,5a33da74669d4d0d9eca8f3ebba21cbe,','1','2017-04-20 18:25:36','1','2017-04-20 18:25:36',NULL,'0'),
('14','readable','橙色主题','theme','主题方案',30,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('15','united','红色主题','theme','主题方案',40,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('15a3b26b5781419d89f6f47f14aa1894','33','报废','JTT-415-546-CLLCLYYZT','车辆类车辆营运状态',60,'0','0,','1','2017-04-20 18:19:35','1','2017-04-20 18:19:35',NULL,'0'),
('15fa3dc4e6484659b1ec66212ba29c31','C4','三轮汽车','JTT-415-5410-CLLCXDM','车辆类车型代码',90,'0','0,','1','2017-04-20 18:33:04','1','2017-04-20 18:33:04',NULL,'0'),
('16','flat','Flat主题','theme','主题方案',60,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('1649f06bf114407e8a2b830512c485db','52','道路运输驾驶员从业资格培训','JTT-415-521-YSLHYLB','运输类行业类别',20,'b46322541f6d4a709be0fd40f1b5d216','0,b46322541f6d4a709be0fd40f1b5d216,','1','2017-04-20 17:55:53','1','2017-04-20 17:55:53',NULL,'0'),
('17','1','国家','sys_area_type','区域类型',10,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('17461462f99244b39662bf79319f7cdb','37','挂车','JTT-415-549-CLLCLLX','车辆类车辆类型',70,'137d92b60d2843d2a1b1376ebe426735','0,137d92b60d2843d2a1b1376ebe426735,','1','2017-04-20 18:28:56','1','2017-04-20 18:28:56',NULL,'0'),
('17cd68d2cc8f45df9f42cd13c28afe49','新','新疆维吾尔自治区','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',310,'0','0,','1','2017-04-19 22:57:31','1','2017-04-19 22:57:31',NULL,'0'),
('18','2','省份、直辖市','sys_area_type','区域类型',20,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('18b9f74dfd964be0a296ae5e155283b7','25','水族','GBT-3304','中国各民族名称代码',250,'0','0,','1','2017-04-19 22:32:49','1','2017-04-19 22:32:49',NULL,'0'),
('18f85970993b46789c2508f8a19645f9','17','哈萨克族','GBT-3304','中国各民族名称代码',170,'0','0,','1','2017-04-19 22:30:25','1','2017-04-19 22:30:25',NULL,'0'),
('19','3','地市','sys_area_type','区域类型',30,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('19dc3522ea27418d9db662ef7d8f4e9a','澳','澳门特别行政区','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',340,'0','0,','1','2017-04-19 22:58:11','1','2017-04-19 22:58:11',NULL,'0'),
('1b16d8fe258b4fd09c4635fcec6618d8','210500','本溪市','GBT-2260','中国行政区划代码',50,'6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','1','2017-04-19 21:58:26','1','2017-04-19 21:58:26',NULL,'0'),
('1b5df722f1654bad9dc34559bf3096e4','90','其他','JTT-415-546-CLLCLYYZT','车辆类车辆营运状态',90,'0','0,','1','2017-04-20 18:20:18','1','2017-04-20 18:20:18',NULL,'0'),
('1bd654bc7fb74a279a7f69440573e901','30','道路危险品运输','JTT-415-521-YSLHYLB','运输类行业类别',30,'0','0,','1','2017-04-20 17:46:21','1','2017-04-20 17:46:21',NULL,'0'),
('1c6beeabceff408a83cbb479e5b0529d','231200','绥化市','GBT-2260','中国行政区划代码',120,'ea6012c760cd4d52bab85f9e9a87053f','0,ea6012c760cd4d52bab85f9e9a87053f,','1','2017-04-19 22:22:12','1','2017-04-19 22:22:12',NULL,'0'),
('1d19926cbc1348ec8ec1246f3061f21e','京','北京市','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',10,'0','0,','1','2017-04-19 22:51:24','1','2017-04-19 22:51:24',NULL,'0'),
('1d1d95d470d748819712df3598ab6b5c','450000','广西壮族自治区','GBT-2260','中国行政区划代码',200,'0','0,','1','2017-04-18 20:02:19','1','2017-04-18 20:02:19',NULL,'0'),
('1d7df5f8e1e04de1a9a881f9aa1a05a5','青','青海省','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',290,'0','0,','1','2017-04-19 22:57:08','1','2017-04-19 22:57:08',NULL,'0'),
('1d9f4e8e1f0f4ff3808f0be6863c0215','6000','站场服务','JTT-415-524-YSLJYFW','运输类经营范围',60,'0','0,','1','2017-04-20 18:07:51','1','2017-04-20 18:07:51',NULL,'0'),
('1da2c4ffe8434211a9468a03d11a3ba0','川','四川省','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',230,'0','0,','1','2017-04-19 22:56:04','1','2017-04-19 22:56:04',NULL,'0'),
('1dab7807648847c69e62fc731c639ad9','220600','白山市','GBT-2260','中国行政区划代码',60,'aa295df36bd54262b8cbe1215b73effd','0,aa295df36bd54262b8cbe1215b73effd,','1','2017-04-19 22:03:24','1','2017-04-19 22:03:24',NULL,'0'),
('1e1b2e32ccc54e97b2c192e5214c1916','F','轻便摩托车','JTT-415-5410-CLLCXDM','车辆类车型代码',120,'0','0,','1','2017-04-20 18:33:41','1','2017-04-20 18:33:41',NULL,'0'),
('1e7e03d822d6467b98ab27aae28550fe','鲁','山东省','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',150,'0','0,','1','2017-04-19 22:54:11','1','2017-04-19 22:54:11',NULL,'0'),
('2','1','删除','del_flag','删除标记',20,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('20','4','区县','sys_area_type','区域类型',40,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('21','1','公司','sys_office_type','机构类型',60,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('216e09cc6ed844a7bee91c9dac4ef766','2','黄色','JTT-415-5412-CLLCPYS','车辆类车牌颜色',20,'0','0,','1','2017-04-20 18:36:21','1','2017-04-20 18:36:21',NULL,'0'),
('22','2','部门','sys_office_type','机构类型',70,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('22c7ec93deac4ad2b584857783acb196','冀','河北省','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',30,'0','0,','1','2017-04-19 22:51:52','1','2017-04-19 22:51:52',NULL,'0'),
('23','3','小组','sys_office_type','机构类型',80,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('2328fad6a62c4a69ae6b0179c20204a4','220800','白城市','GBT-2260','中国行政区划代码',80,'aa295df36bd54262b8cbe1215b73effd','0,aa295df36bd54262b8cbe1215b73effd,','1','2017-04-19 22:10:09','1','2017-04-19 22:10:09',NULL,'0'),
('232f25a629c246f6baf923c38c4f0e0a','43','乌孜别克族','GBT-3304','中国各民族名称代码',430,'0','0,','1','2017-04-19 22:37:35','1','2017-04-19 22:37:35',NULL,'0'),
('24','4','其它','sys_office_type','机构类型',90,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('25','1','综合部','sys_office_common','快捷通用部门',30,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('253612f52d70450495916bb080f59cfd','1','蓝色','JTT-415-5412-CLLCPYS','车辆类车牌颜色',10,'0','0,','1','2017-04-20 18:36:15','1','2017-04-20 18:36:15',NULL,'0'),
('2540b494611a442cb04628ffbed7a720','110108','海淀区','GBT-2260','中国行政区划代码',100,'fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','1','2017-04-19 21:52:04','1','2017-04-19 21:52:04',NULL,'0'),
('25ec4ce547054921ad8a2c4bafe2a7d3','650000','新疆维吾尔自治区','GBT-2260','中国行政区划代码',310,'0','0,','1','2017-04-18 20:05:39','1','2017-04-18 20:05:39',NULL,'0'),
('26','2','开发部','sys_office_common','快捷通用部门',40,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('27','3','人力部','sys_office_common','快捷通用部门',50,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('2784c6c69a724d80a9f0f726452e70ee','500000','重庆市','GBT-2260','中国行政区划代码',220,'0','0,','1','2017-04-18 20:02:51','1','2017-04-18 20:02:51',NULL,'0'),
('28','1','一级','sys_office_grade','机构等级',10,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('2870ca0cabfb4730b5264210b19d862c','231000','牡丹江市','GBT-2260','中国行政区划代码',100,'ea6012c760cd4d52bab85f9e9a87053f','0,ea6012c760cd4d52bab85f9e9a87053f,','1','2017-04-19 22:21:45','1','2017-04-19 22:21:45',NULL,'0'),
('29','2','二级','sys_office_grade','机构等级',20,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('291b26f9a8a74e5ca7c03ff1dbdaaf8f','3','回族','GBT-3304','中国各民族名称代码',30,'0','0,','1','2017-04-19 22:27:54','1','2017-04-19 22:27:54',NULL,'0'),
('291bfc1ee5274769a7bbe65b1a50d00a','230400','鹤岗市','GBT-2260','中国行政区划代码',40,'ea6012c760cd4d52bab85f9e9a87053f','0,ea6012c760cd4d52bab85f9e9a87053f,','1','2017-04-19 22:20:10','1','2017-04-19 22:20:10',NULL,'0'),
('29cdb026c5cf4faa932228fd9584dcbc','6','苗族','GBT-3304','中国各民族名称代码',60,'0','0,','1','2017-04-19 22:28:35','1','2017-04-19 22:28:35',NULL,'0'),
('2a678717c7cb4da4b8603409e0c7f42f','苏','江苏省','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',100,'0','0,','1','2017-04-19 22:53:16','1','2017-04-19 22:53:16',NULL,'0'),
('2a67d486a86c424cb15172a78a4d24ec','620000','甘肃省','GBT-2260','中国行政区划代码',280,'0','0,','1','2017-04-18 20:04:48','1','2017-04-18 20:04:48',NULL,'0'),
('2bad1fdd89ec4dcaa26c94dc8b350e57','9','其他','JTT-415-5413-CLLDLYSZJZ','车辆类道路运输证介质',40,'0','0,','1','2017-04-20 18:37:49','1','2017-04-20 18:37:49',NULL,'0'),
('2ddf17e160ca4363bd7fb1d7d94e2e34','50','塔塔尔族','GBT-3304','中国各民族名称代码',500,'0','0,','1','2017-04-19 22:38:39','1','2017-04-19 22:38:39',NULL,'0'),
('2e091e415f8e4b97a2f7069a7422a1f7','110200','县','GBT-2260','中国行政区划代码',30,'8046fa8eb55a472383d090450a04bda0','0,8046fa8eb55a472383d090450a04bda0,','1','2017-04-19 21:49:03','1','2017-04-19 21:49:03',NULL,'0'),
('3','1','显示','show_hide','显示/隐藏',10,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('30','3','三级','sys_office_grade','机构等级',30,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('304af749111e478ab3dd5e81fb0f0302','72','国际道路货物运输','JTT-415-521-YSLHYLB','运输类行业类别',20,'cfb4f931d1e644fe95282528664ff3a2','0,cfb4f931d1e644fe95282528664ff3a2,','1','2017-04-20 17:58:13','1','2017-04-20 17:58:13',NULL,'0'),
('30da3ac1eb9a4d638e2809160e0944ef','5','整车维护','JTT-415-5411-CLLXLJB','车辆类修理级别',50,'0','0,','1','2017-04-20 18:35:37','1','2017-04-20 18:35:37',NULL,'0'),
('31','4','四级','sys_office_grade','机构等级',40,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('31144ea5efb945239965b5db22ec3289','33','保温冷藏车','JTT-415-549-CLLCLLX','车辆类车辆类型',30,'137d92b60d2843d2a1b1376ebe426735','0,137d92b60d2843d2a1b1376ebe426735,','1','2017-04-20 18:28:03','1','2017-04-20 18:28:03',NULL,'0'),
('319da3f5b2e24c5ebc93eb33c45081f4','36','牵引车','JTT-415-549-CLLCLLX','车辆类车辆类型',60,'137d92b60d2843d2a1b1376ebe426735','0,137d92b60d2843d2a1b1376ebe426735,','1','2017-04-20 18:28:45','1','2017-04-20 18:28:45',NULL,'0'),
('32','1','所有数据','sys_data_scope','数据范围',10,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('327914a52a1a41e7aeb36a9cbefba9f4','2','蒙古族','GBT-3304','中国各民族名称代码',20,'0','0,','1','2017-04-19 22:27:46','1','2017-04-19 22:27:46',NULL,'0'),
('32d87da63c494c3f8b7002b61831f4b7','鄂','湖北省','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',170,'0','0,','1','2017-04-19 22:54:43','1','2017-04-19 22:54:43',NULL,'0'),
('33','2','所在公司及以下数据','sys_data_scope','数据范围',20,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('33539c73df2540e889eb7faf23f09809','15','大型卧铺客车','JTT-415-549-CLLCLLX','车辆类车辆类型',50,'5a33da74669d4d0d9eca8f3ebba21cbe','0,5a33da74669d4d0d9eca8f3ebba21cbe,','1','2017-04-20 18:25:58','1','2017-04-20 18:25:58',NULL,'0'),
('34','3','所在公司数据','sys_data_scope','数据范围',30,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('35','4','所在部门及以下数据','sys_data_scope','数据范围',40,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('36','5','所在部门数据','sys_data_scope','数据范围',50,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('36ace62faa2a498abd448253f2133843','220100','长春市','GBT-2260','中国行政区划代码',10,'aa295df36bd54262b8cbe1215b73effd','0,aa295df36bd54262b8cbe1215b73effd,','1','2017-04-19 22:01:57','1','2017-04-19 22:01:57',NULL,'0'),
('36f2be8baaf34bb1a5df49151cbb363c','1','已维护','JTT-415-543-CLLEJWHZT','车辆类二级维护状态',20,'0','0,','1','2017-04-20 18:14:21','1','2017-04-20 18:14:21',NULL,'0'),
('37','8','仅本人数据','sys_data_scope','数据范围',90,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('38','9','按明细设置','sys_data_scope','数据范围',100,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('39','1','系统管理','sys_user_type','用户类型',10,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('390349585f724c45b52901848f5474ea','12','侗族','GBT-3304','中国各民族名称代码',120,'0','0,','1','2017-04-19 22:29:44','1','2017-04-19 22:29:44',NULL,'0'),
('3926994bde19419b9addebe3a1abb00b','2','省','GBT-12404','单位隶属关系代码',20,'0','0,','1','2017-04-19 22:41:31','1','2017-04-19 22:41:31',NULL,'0'),
('39bb6d95d6c64567ac053349c3a5bebd','32','仫佬族','GBT-3304','中国各民族名称代码',320,'0','0,','1','2017-04-19 22:35:07','1','2017-04-19 22:35:07',NULL,'0'),
('3bc71c3989054035ad9bd6f98a37db7e','370000','山东省','GBT-2260','中国行政区划代码',150,'0','0,','1','2017-04-18 20:01:10','1','2017-04-18 20:01:10',NULL,'0'),
('3bdd8f6e0ee94220b33de5a45ad36f5a','210100','沈阳市','GBT-2260','中国行政区划代码',10,'6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','1','2017-04-19 21:56:33','1','2017-04-19 21:56:46',NULL,'0'),
('3d094887e3e24fbbbeecc58483ee16c4','台','台湾省','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',320,'0','0,','1','2017-04-19 22:57:43','1','2017-04-19 22:57:43',NULL,'0'),
('3d169d1ee5964410bfc1679aff72e7f3','C1','小型汽车','JTT-415-5410-CLLCXDM','车辆类车型代码',60,'0','0,','1','2017-04-20 18:32:28','1','2017-04-20 18:32:28',NULL,'0'),
('3e138a3169254e80a19922135153ea85','211000','辽阳市','GBT-2260','中国行政区划代码',100,'6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','1','2017-04-19 22:00:16','1','2017-04-19 22:00:16',NULL,'0'),
('3fc0fe60fadb4df4a0ca7aee8cc5925d','32','非营运性危险货物运输','JTT-415-521-YSLHYLB','运输类行业类别',20,'1bd654bc7fb74a279a7f69440573e901','0,1bd654bc7fb74a279a7f69440573e901,','1','2017-04-20 17:52:25','1','2017-04-20 17:52:25',NULL,'0'),
('4','0','隐藏','show_hide','显示/隐藏',20,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('40','2','部门经理','sys_user_type','用户类型',20,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('40bb732591434916b65a90b3bec119ee','A2','牵引车','JTT-415-5410-CLLCXDM','车辆类车型代码',20,'0','0,','1','2017-04-20 18:31:44','1','2017-04-20 18:31:44',NULL,'0'),
('41','3','普通用户','sys_user_type','用户类型',30,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('42','basic','基础主题','cms_theme','站点主题',10,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('42ed4ca213f04d42901a27bc7941c0e7','210700','锦州市','GBT-2260','中国行政区划代码',70,'6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','1','2017-04-19 21:59:33','1','2017-04-19 21:59:33',NULL,'0'),
('43','blue','蓝色主题','cms_theme','站点主题',20,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
('4351c1719756467481a83393f6806e8c','7000','国际道路运输','JTT-415-524-YSLJYFW','运输类经营范围',70,'0','0,','1','2017-04-20 18:10:27','1','2017-04-20 18:10:27',NULL,'0'),
('43b7bc70700b46648dc84ef840e6b056','P','有轨电车','JTT-415-5410-CLLCXDM','车辆类车型代码',150,'0','0,','1','2017-04-20 18:34:30','1','2017-04-20 18:34:30',NULL,'0'),
('44','red','红色主题','cms_theme','站点主题',30,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
('442f830b46d64cfda03d023cd2b25adf','C3','低速载货汽车','JTT-415-5410-CLLCXDM','车辆类车型代码',80,'0','0,','1','2017-04-20 18:32:51','1','2017-04-20 18:32:51',NULL,'0'),
('45','article','文章模型','cms_module','栏目模型',10,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('4596716a35ed4b06b7f0fd5c0af42d6a','19','黎族','GBT-3304','中国各民族名称代码',190,'0','0,','1','2017-04-19 22:30:42','1','2017-04-19 22:30:42',NULL,'0'),
('46','picture','图片模型','cms_module','栏目模型',20,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
('461f2b38209d4de2b472965b5dd7cbe9','渝','重庆市','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',220,'0','0,','1','2017-04-19 22:55:49','1','2017-04-19 22:55:49',NULL,'0'),
('465b80b133e3469b9a4403dd844e96c5','10','营运','JTT-415-546-CLLCLYYZT','车辆类车辆营运状态',10,'0','0,','1','2017-04-20 18:18:41','1','2017-04-20 18:18:41',NULL,'0'),
('47','download','下载模型','cms_module','栏目模型',30,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
('475a009485f443c3835e5d9a510c1a58','330000','浙江省','GBT-2260','中国行政区划代码',110,'0','0,','1','2017-04-18 20:00:00','1','2017-04-18 20:00:00',NULL,'0'),
('48','link','链接模型','cms_module','栏目模型',40,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('484a8e4980c94ada8bc24d296de29a10','21','佤族','GBT-3304','中国各民族名称代码',210,'0','0,','1','2017-04-19 22:32:09','1','2017-04-19 22:32:09',NULL,'0'),
('48e3b9a10a944ffa9624829dddfb3de9','4','市、地区','GBT-12404','单位隶属关系代码',30,'0','0,','1','2017-04-19 22:41:44','1','2017-04-19 22:42:40',NULL,'0'),
('49','special','专题模型','cms_module','栏目模型',50,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
('4910573622624d2b9c1a5fd1aaaae31e','13','瑶族','GBT-3304','中国各民族名称代码',130,'0','0,','1','2017-04-19 22:29:51','1','2017-04-19 22:29:51',NULL,'0'),
('4946f589bcb543d58c314fadd9ff3f8a','710000','台湾省','GBT-2260','中国行政区划代码',320,'0','0,','1','2017-04-18 20:06:04','1','2017-04-18 20:06:04',NULL,'0'),
('4a582c1e23ef4222bf9d4dac3d16c3db','辽','辽宁省','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',60,'0','0,','1','2017-04-19 22:52:30','1','2017-04-19 22:52:30',NULL,'0'),
('4aab72c12bd44e70bb959631e3b08619','1','违章已处理','JTT-415-523-YSLJCCLZT','运输类稽查处理状态',20,'0','0,','1','2017-04-20 18:03:15','1','2017-04-20 18:03:15',NULL,'0'),
('4cc7e343a4054e9ba00f58a1a48daee5','630000','青海省','GBT-2260','中国行政区划代码',290,'0','0,','1','2017-04-18 20:05:04','1','2017-04-18 20:05:04',NULL,'0'),
('5','1','是','yes_no','是/否',10,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('50','0','默认展现方式','cms_show_modes','展现方式',10,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('51','1','首栏目内容列表','cms_show_modes','展现方式',20,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('52','2','栏目第一条内容','cms_show_modes','展现方式',30,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('52147090a500482f8fe7d8dd92b3b25f','9','布依族','GBT-3304','中国各民族名称代码',90,'0','0,','1','2017-04-19 22:28:58','1','2017-04-19 22:28:58',NULL,'0'),
('527549b5902b4ca0a691cb7640a2239f','27','纳西族','GBT-3304','中国各民族名称代码',270,'0','0,','1','2017-04-19 22:33:10','1','2017-04-19 22:33:10',NULL,'0'),
('53','0','发布','cms_del_flag','内容状态',10,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('533d54d2996e4445b45629bf93e4806d','8','壮族','GBT-3304','中国各民族名称代码',80,'0','0,','1','2017-04-19 22:28:50','1','2017-04-19 22:28:50',NULL,'0'),
('535f0516730d472ea6466b1f3d1250c0','51','独龙族','GBT-3304','中国各民族名称代码',510,'0','0,','1','2017-04-19 22:38:52','1','2017-04-19 22:38:52',NULL,'0'),
('53a75c1b840648a3a5fe86fd200ad836','54','门巴族','GBT-3304','中国各民族名称代码',540,'0','0,','1','2017-04-19 22:39:18','1','2017-04-19 22:39:18',NULL,'0'),
('53c095f6dfb843f19bc5721e8b0a9acb','5','高三级','JTT-415-548-CLLKCDJ','车辆类客车等级',50,'0','0,','1','2017-04-20 18:22:29','1','2017-04-20 18:22:29',NULL,'0'),
('54','1','删除','cms_del_flag','内容状态',20,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('54ed687589454b8b970984e17022bdf2','C2','小型自动挡汽车','JTT-415-5410-CLLCXDM','车辆类车型代码',70,'0','0,','1','2017-04-20 18:32:38','1','2017-04-20 18:32:38',NULL,'0'),
('55','2','审核','cms_del_flag','内容状态',15,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('5552b8f0507f4e94829cb92cc71f8bed','8000','公交运输','JTT-415-524-YSLJYFW','运输类经营范围',80,'0','0,','1','2017-04-20 18:10:42','1','2017-04-20 18:10:42',NULL,'0'),
('56','1','首页焦点图','cms_posid','推荐位',10,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('56b26955df0e4b1fa47b599b8c305702','110104','宣武区','GBT-2260','中国行政区划代码',60,'fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','1','2017-04-19 21:50:53','1','2017-04-19 21:50:53',NULL,'0'),
('57','2','栏目页文章推荐','cms_posid','推荐位',20,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('570461755d3f410a8d279aceb6adb7f9','410000','河南省','GBT-2260','中国行政区划代码',160,'0','0,','1','2017-04-18 20:01:23','1','2017-04-18 20:01:23',NULL,'0'),
('570d269b49194bdbab0e8489999ff007','12','包车客运','JTT-415-521-YSLHYLB','运输类行业类别',20,'7292b2d4951248bdb9aa9a9963c09d02','0,7292b2d4951248bdb9aa9a9963c09d02,','1','2017-04-20 17:50:08','1','2017-04-20 17:50:08',NULL,'0'),
('5792528d04ac485b8cce019954d42922','B2','大型货车','JTT-415-5410-CLLCXDM','车辆类车型代码',50,'0','0,','1','2017-04-20 18:32:14','1','2017-04-20 18:32:14',NULL,'0'),
('58','1','咨询','cms_guestbook','留言板分类',10,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('58b663db40fb4c598f727f8ef615eb48','110229','延庆县','GBT-2260','中国行政区划代码',50,'2e091e415f8e4b97a2f7069a7422a1f7','0,8046fa8eb55a472383d090450a04bda0,2e091e415f8e4b97a2f7069a7422a1f7,','1','2017-04-19 21:54:57','1','2017-04-19 21:54:57',NULL,'0'),
('59','2','建议','cms_guestbook','留言板分类',20,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('59c87c0ee86f4d0595028fd9c9a02ded','230600','大庆市','GBT-2260','中国行政区划代码',60,'ea6012c760cd4d52bab85f9e9a87053f','0,ea6012c760cd4d52bab85f9e9a87053f,','1','2017-04-19 22:20:35','1','2017-04-19 22:20:35',NULL,'0'),
('5a33da74669d4d0d9eca8f3ebba21cbe','10','客车','JTT-415-549-CLLCLLX','车辆类车辆类型',10,'0','0,','1','2017-04-20 18:23:01','1','2017-04-20 18:23:01',NULL,'0'),
('5a8e07db413b48a9b23479e2102ed482','A1','大型客车','JTT-415-5410-CLLCXDM','车辆类车型代码',10,'0','0,','1','2017-04-20 18:31:34','1','2017-04-20 18:31:34',NULL,'0'),
('5ae738aa1ef048eca1bbe3946a81f358','211100','盘锦市','GBT-2260','中国行政区划代码',110,'6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','1','2017-04-19 22:00:32','1','2017-04-19 22:00:32',NULL,'0'),
('5ae918cdf987434fb0b5e043c515c9ad','211300','朝阳市','GBT-2260','中国行政区划代码',130,'6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','1','2017-04-19 22:01:03','1','2017-04-19 22:01:03',NULL,'0'),
('5b3025269a31468cbed4bc2992711cd5','16','中型卧铺客车','JTT-415-549-CLLCLLX','车辆类车辆类型',60,'5a33da74669d4d0d9eca8f3ebba21cbe','0,5a33da74669d4d0d9eca8f3ebba21cbe,','1','2017-04-20 18:26:14','1','2017-04-20 18:26:14',NULL,'0'),
('5bc691930de041e389b596bab058193a','3','三级','JTT-415-542-CLLCLJSDJ','车辆类车辆技术等级',40,'0','0,','1','2017-04-20 18:13:27','1','2017-04-20 18:13:27',NULL,'0'),
('5bf46749ad4d47fa81852c84b5e8e4b1','38','平板车','JTT-415-549-CLLCLLX','车辆类车辆类型',80,'137d92b60d2843d2a1b1376ebe426735','0,137d92b60d2843d2a1b1376ebe426735,','1','2017-04-20 18:29:06','1','2017-04-20 18:29:06',NULL,'0'),
('5d104b62066343389f4dd58354d67853','110111','房山区','GBT-2260','中国行政区划代码',120,'fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','1','2017-04-19 21:52:55','1','2017-04-19 21:52:55',NULL,'0'),
('5d1b4f19b63b41c9ab4848697266c406','E','普通两轮摩托车','JTT-415-5410-CLLCXDM','车辆类车型代码',110,'0','0,','1','2017-04-20 18:33:30','1','2017-04-20 18:33:30',NULL,'0'),
('5dc90917b32b485cb929c5f3fac18ae2','222400','延边朝鲜族自治州','GBT-2260','中国行政区划代码',90,'aa295df36bd54262b8cbe1215b73effd','0,aa295df36bd54262b8cbe1215b73effd,','1','2017-04-19 22:10:27','1','2017-04-19 22:10:27',NULL,'0'),
('5e7b754a8d854b6ca41c70f2c8f73ca3','14','非定线旅游','JTT-415-521-YSLHYLB','运输类行业类别',40,'7292b2d4951248bdb9aa9a9963c09d02','0,7292b2d4951248bdb9aa9a9963c09d02,','1','2017-04-20 17:50:31','1','2017-04-20 17:50:31',NULL,'0'),
('5fbdc7fe25eb4c4e9ee80897b03eeaa0','80','公交运输','JTT-415-521-YSLHYLB','运输类行业类别',80,'0','0,','1','2017-04-20 17:48:24','1','2017-04-20 17:48:24',NULL,'0'),
('6','0','否','yes_no','是/否',20,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('60','3','投诉','cms_guestbook','留言板分类',30,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('61','4','其它','cms_guestbook','留言板分类',40,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('61c9a6d04039403c90ed3043046a906c','4','高二级','JTT-415-548-CLLKCDJ','车辆类客车等级',40,'0','0,','1','2017-04-20 18:22:23','1','2017-04-20 18:22:23',NULL,'0'),
('62','1','公休','oa_leave_type','请假类型',10,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('620f4b9b4483434296c14db0d0372ebd','1','一级','JTT-415-542-CLLCLJSDJ','车辆类车辆技术等级',20,'0','0,','1','2017-04-20 18:13:13','1','2017-04-20 18:13:13',NULL,'0'),
('63','2','病假','oa_leave_type','请假类型',20,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('63f9a376edf44073a185f204c52d746f','110116','怀柔区','GBT-2260','中国行政区划代码',170,'fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','1','2017-04-19 21:54:03','1','2017-04-19 21:54:03',NULL,'0'),
('64','3','事假','oa_leave_type','请假类型',30,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('64b2561e23e240fd94506be5be631ac9','35','罐车','JTT-415-549-CLLCLLX','车辆类车辆类型',50,'137d92b60d2843d2a1b1376ebe426735','0,137d92b60d2843d2a1b1376ebe426735,','1','2017-04-20 18:28:37','1','2017-04-20 18:28:37',NULL,'0'),
('64e88d11e9124efeab9cb6aad2d990c4','640000','宁夏回族自治区','GBT-2260','中国行政区划代码',300,'0','0,','1','2017-04-18 20:05:18','1','2017-04-18 20:05:18',NULL,'0'),
('65','4','调休','oa_leave_type','请假类型',40,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('6534acfb2a4b4effb3eaf40e6d15d60d','47','保安族','GBT-3304','中国各民族名称代码',470,'0','0,','1','2017-04-19 22:38:16','1','2017-04-19 22:38:16',NULL,'0'),
('6573e714f96845bda9181807d1b989d0','3','高一级','JTT-415-548-CLLKCDJ','车辆类客车等级',30,'0','0,','1','2017-04-20 18:22:12','1','2017-04-20 18:22:12',NULL,'0'),
('65c12352ec49413a9b14512f446f6129','520000','贵州省','GBT-2260','中国行政区划代码',240,'0','0,','1','2017-04-18 20:03:41','1','2017-04-18 20:03:41',NULL,'0'),
('65c7e2639d3c4c2784a64261c7ab2260','230900','七台河市','GBT-2260','中国行政区划代码',90,'ea6012c760cd4d52bab85f9e9a87053f','0,ea6012c760cd4d52bab85f9e9a87053f,','1','2017-04-19 22:21:25','1','2017-04-19 22:21:25',NULL,'0'),
('66','5','婚假','oa_leave_type','请假类型',60,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('6613a5ca7b7b4354959a4d98a85662ad','210000','辽宁省','GBT-2260','中国行政区划代码',60,'0','0,','1','2017-04-18 19:58:44','1','2017-04-18 19:58:44',NULL,'0'),
('661bf279c6fc45cdbb86c06ff0bba5c3','1','普通级','JTT-415-548-CLLKCDJ','车辆类客车等级',10,'0','0,','1','2017-04-20 18:21:49','1','2017-04-20 18:21:49',NULL,'0'),
('67','1','接入日志','sys_log_type','日志类型',30,'0','0,','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),
('672b6f1f6552461db89315c64228715a','230200','齐齐哈尔市','GBT-2260','中国行政区划代码',20,'ea6012c760cd4d52bab85f9e9a87053f','0,ea6012c760cd4d52bab85f9e9a87053f,','1','2017-04-19 22:11:37','1','2017-04-19 22:19:47',NULL,'0'),
('68','2','异常日志','sys_log_type','日志类型',40,'0','0,','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),
('680212a8444b43eb953dbd9914bf171b','1','汉族','GBT-3304','中国各民族名称代码',10,'0','0,','1','2017-04-19 22:27:34','1','2017-04-19 22:27:34',NULL,'0'),
('68b61277a30e4016a58385416ec45b0d','港','香港特别行政区','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',330,'0','0,','1','2017-04-19 22:57:54','1','2017-04-19 22:57:54',NULL,'0'),
('69','leave','请假流程','act_type','流程类型',10,'0','0,','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),
('69d372292754489983cf9dff4b081785','16','哈尼族','GBT-3304','中国各民族名称代码',160,'0','0,','1','2017-04-19 22:30:17','1','2017-04-19 22:30:17',NULL,'0'),
('69e6bc9604134ebbbfe7ec2eee3d66a2','22','挂失','JTT-415-546-CLLCLYYZT','车辆类车辆营运状态',30,'0','0,','1','2017-04-20 18:18:56','1','2017-04-20 18:18:56',NULL,'0'),
('6c98b7177c74449ebcd4d1cc2e1fc8e9','3','非接触时IC卡','JTT-415-5413-CLLDLYSZJZ','车辆类道路运输证介质',30,'0','0,','1','2017-04-20 18:37:43','1','2017-04-20 18:37:43',NULL,'0'),
('6d1dafecada24be1ad3aa0a471ddc4dd','210800','营口市','GBT-2260','中国行政区划代码',80,'6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','1','2017-04-19 21:59:47','1','2017-04-19 21:59:47',NULL,'0'),
('6dfe0b9fc2af4ace95306250770d6147','粤','广东省','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',190,'0','0,','1','2017-04-19 22:55:13','1','2017-04-19 22:55:13',NULL,'0'),
('6e8c6bf08aae412588f191aafe01dbc5','50','农用车','JTT-415-549-CLLCLLX','车辆类车辆类型',50,'0','0,','1','2017-04-20 18:23:39','1','2017-04-20 18:23:39',NULL,'0'),
('6fe2fb391fdc4212b95e960298bb4604','桂','广西省','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',200,'0','0,','1','2017-04-19 22:55:23','1','2017-04-19 22:55:23',NULL,'0'),
('7','red','红色','color','颜色值',10,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('70','test_audit','审批测试流程','act_type','流程类型',20,'0','0,','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),
('70311593a6f44ff5a1d08b8eebc78cd0','91','客运出租运输','JTT-415-521-YSLHYLB','运输类行业类别',10,'8393b4a277064ba2b717754039ae003b','0,8393b4a277064ba2b717754039ae003b,','1','2017-04-20 17:58:56','1','2017-04-20 17:58:56',NULL,'0'),
('70816e1225f3454088323cb750b45ee4','1','年审合格','JTT-415-544-CLLNDSYZT','车辆类年度审验状态',20,'0','0,','1','2017-04-20 18:16:09','1','2017-04-20 18:16:09',NULL,'0'),
('71','1','分类1','act_category','流程分类',10,'0','0,','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),
('71dabc98745c418281986a93f0a6d1c3','31','集装箱车','JTT-415-549-CLLCLLX','车辆类车辆类型',10,'137d92b60d2843d2a1b1376ebe426735','0,137d92b60d2843d2a1b1376ebe426735,','1','2017-04-20 18:27:40','1','2017-04-20 18:27:40',NULL,'0'),
('72','2','分类2','act_category','流程分类',20,'0','0,','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),
('7292b2d4951248bdb9aa9a9963c09d02','10','道路旅客运输','JTT-415-521-YSLHYLB','运输类行业类别',10,'0','0,','1','2017-04-20 17:45:49','1','2017-04-20 17:45:49',NULL,'0'),
('72b30d027d124d5eb949cf4ed0fa7ae7','40','普米族','GBT-3304','中国各民族名称代码',400,'0','0,','1','2017-04-19 22:37:00','1','2017-04-19 22:37:00',NULL,'0'),
('73','crud','增删改查','gen_category','代码生成分类',10,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('74','crud_many','增删改查（包含从表）','gen_category','代码生成分类',20,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('75','tree','树结构','gen_category','代码生成分类',30,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('756c9927ae1a48db92bc69d9cdb18982','110106','丰台区','GBT-2260','中国行政区划代码',80,'fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','1','2017-04-19 21:51:25','1','2017-04-19 21:51:25',NULL,'0'),
('75d8123f757849e4b8ca66835e207b47','220200','吉林市','GBT-2260','中国行政区划代码',20,'aa295df36bd54262b8cbe1215b73effd','0,aa295df36bd54262b8cbe1215b73effd,','1','2017-04-19 22:02:10','1','2017-04-19 22:02:10',NULL,'0'),
('76','=','=','gen_query_type','查询方式',10,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('76b01c3fc6b44ee1b3bb4c4014614263','1','整车修理','JTT-415-5411-CLLXLJB','车辆类修理级别',10,'0','0,','1','2017-04-20 18:35:06','1','2017-04-20 18:35:06',NULL,'0'),
('77','!=','!=','gen_query_type','查询方式',20,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('772b00244749426a92f5cc565f30b65f','9','其它','GBT-12404','单位隶属关系代码',60,'0','0,','1','2017-04-19 22:42:20','1','2017-04-19 22:42:20',NULL,'0'),
('775b09314da04e7bbc8e7aa081a3153e','琼','海南省','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',210,'0','0,','1','2017-04-19 22:55:34','1','2017-04-19 22:55:34',NULL,'0'),
('78','&gt;','&gt;','gen_query_type','查询方式',30,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('7835769fc8bf4fccae00dcf4c8127f26','D','普通三轮摩托车','JTT-415-5410-CLLCXDM','车辆类车型代码',100,'0','0,','1','2017-04-20 18:33:16','1','2017-04-20 18:33:16',NULL,'0'),
('79','&lt;','&lt;','gen_query_type','查询方式',40,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('7afa1d9c77824062b25e393fe7e5d4c8','31','营运性危险货物运输','JTT-415-521-YSLHYLB','运输类行业类别',10,'1bd654bc7fb74a279a7f69440573e901','0,1bd654bc7fb74a279a7f69440573e901,','1','2017-04-20 17:52:13','1','2017-04-20 17:52:13',NULL,'0'),
('7c37c9ee45184d138581b2116b138cea','48','裕固族','GBT-3304','中国各民族名称代码',480,'0','0,','1','2017-04-19 22:38:23','1','2017-04-19 22:38:23',NULL,'0'),
('7c85090834a94015874343d8ec79654d','610000','陕西省','GBT-2260','中国行政区划代码',270,'0','0,','1','2017-04-18 20:04:25','1','2017-04-18 20:04:34',NULL,'0'),
('7ce62cb8ea694e7aa60a2082809938b1','44','俄罗斯族','GBT-3304','中国各民族名称代码',440,'0','0,','1','2017-04-19 22:37:42','1','2017-04-19 22:37:42',NULL,'0'),
('7d18ddaca28c4efcab1b8ef1574819e9','39','其他专用车','JTT-415-549-CLLCLLX','车辆类车辆类型',90,'137d92b60d2843d2a1b1376ebe426735','0,137d92b60d2843d2a1b1376ebe426735,','1','2017-04-20 18:29:17','1','2017-04-20 18:29:17',NULL,'0'),
('7d42dc81d80f4a58bfd26b95dae12550','211400','葫芦岛市','GBT-2260','中国行政区划代码',140,'6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','1','2017-04-19 22:01:19','1','2017-04-19 22:01:19',NULL,'0'),
('7e2785f840654a79944cf2c097512508','31','达斡尔族','GBT-3304','中国各民族名称代码',310,'0','0,','1','2017-04-19 22:34:28','1','2017-04-19 22:34:28',NULL,'0'),
('7e2c64c950f64f349b867e737a8850e9','34','商品车运输专用车','JTT-415-549-CLLCLLX','车辆类车辆类型',40,'137d92b60d2843d2a1b1376ebe426735','0,137d92b60d2843d2a1b1376ebe426735,','1','2017-04-20 18:28:16','1','2017-04-20 18:28:26',NULL,'0'),
('7e4ef9ff93b04e629bf5a1e9d092cf0a','2','总成修理','JTT-415-5411-CLLXLJB','车辆类修理级别',20,'0','0,','1','2017-04-20 18:35:15','1','2017-04-20 18:35:15',NULL,'0'),
('7e61c99465ef4b24be2f7c8b55e85b90','蒙','内蒙古自治区','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',50,'0','0,','1','2017-04-19 22:52:24','1','2017-04-19 22:52:24',NULL,'0'),
('7e7ba3a2d93448a79fb2242d791f7a0a','81','公交运输','JTT-415-521-YSLHYLB','运输类行业类别',10,'5fbdc7fe25eb4c4e9ee80897b03eeaa0','0,5fbdc7fe25eb4c4e9ee80897b03eeaa0,','1','2017-04-20 17:58:40','1','2017-04-20 17:58:40',NULL,'0'),
('7f4485b802044f3ba9e19d071bf86d48','吉','吉林省','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',70,'0','0,','1','2017-04-19 22:52:50','1','2017-04-19 22:52:50',NULL,'0'),
('7f5d1aa4ad01496390f89ffbbcd8b92a','97','其他','GBT-3304','中国各民族名称代码',570,'0','0,','1','2017-04-19 22:39:52','1','2017-04-19 22:39:52',NULL,'0'),
('7fe9b9fb686243138ef8827bc4b025c1','56','基诺族','GBT-3304','中国各民族名称代码',560,'0','0,','1','2017-04-19 22:39:36','1','2017-04-19 22:39:36',NULL,'0'),
('8','green','绿色','color','颜色值',20,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('80','between','Between','gen_query_type','查询方式',50,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('8046fa8eb55a472383d090450a04bda0','110000','北京市','GBT-2260','中国行政区划代码',10,'0','0,','1','2017-04-18 19:57:18','1','2017-04-18 19:57:18',NULL,'0'),
('805851d77ffa4d0f85b06e6b08cc62c1','102','货运汽车租赁','JTT-415-521-YSLHYLB','运输类行业类别',20,'13bced384b2f4f539bbad1095694dd7a','0,13bced384b2f4f539bbad1095694dd7a,','1','2017-04-20 17:59:39','1','2017-04-20 17:59:39',NULL,'0'),
('81','like','Like','gen_query_type','查询方式',60,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('814630faba1a4c02b6298b0d87cc0bca','34','布朗族','GBT-3304','中国各民族名称代码',340,'0','0,','1','2017-04-19 22:35:47','1','2017-04-19 22:35:47',NULL,'0'),
('81c5f819dc3e4687aac72a1d3ad30604','22','畲族','GBT-3304','中国各民族名称代码',220,'0','0,','1','2017-04-19 22:32:19','1','2017-04-19 22:32:19',NULL,'0'),
('82','left_like','Left Like','gen_query_type','查询方式',70,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('83','right_like','Right Like','gen_query_type','查询方式',80,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('8327007c554a4f7bb20c097199653958','510000','四川省','GBT-2260','中国行政区划代码',230,'0','0,','1','2017-04-18 20:03:10','1','2017-04-18 20:03:10',NULL,'0'),
('8393b4a277064ba2b717754039ae003b','90','出租运输','JTT-415-521-YSLHYLB','运输类行业类别',90,'0','0,','1','2017-04-20 17:48:35','1','2017-04-20 17:48:35',NULL,'0'),
('83c388eb104e4e6f8f000f2e49f6a928','62','手扶拖拉机','JTT-415-549-CLLCLLX','车辆类车辆类型',20,'02d21e73ad644b10b381641a7e81e0f4','0,02d21e73ad644b10b381641a7e81e0f4,','1','2017-04-20 18:29:56','1','2017-04-20 18:29:56',NULL,'0'),
('84','input','文本框','gen_show_type','字段生成方案',10,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('85','textarea','文本域','gen_show_type','字段生成方案',20,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('86','select','下拉框','gen_show_type','字段生成方案',30,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('860189bfc2c64c0cbf2c20cdc48d38c2','2','中级','JTT-415-548-CLLKCDJ','车辆类客车等级',20,'0','0,','1','2017-04-20 18:21:59','1','2017-04-20 18:22:06',NULL,'0'),
('861a14798f6640859689cd40ddcdd267','12','中型客车','JTT-415-549-CLLCLLX','车辆类车辆类型',20,'5a33da74669d4d0d9eca8f3ebba21cbe','0,5a33da74669d4d0d9eca8f3ebba21cbe,','1','2017-04-20 18:25:16','1','2017-04-20 18:25:16',NULL,'0'),
('86a88c65f37546cf965a636d1a427258','N','无轨电车','JTT-415-5410-CLLCXDM','车辆类车型代码',140,'0','0,','1','2017-04-20 18:34:20','1','2017-04-20 18:34:20',NULL,'0'),
('86c3894893394bbfa15ed86e79a241f3','51','普通机动车驾驶员培训','JTT-415-521-YSLHYLB','运输类行业类别',10,'b46322541f6d4a709be0fd40f1b5d216','0,b46322541f6d4a709be0fd40f1b5d216,','1','2017-04-20 17:54:47','1','2017-04-20 17:54:47',NULL,'0'),
('87','checkbox','复选框','gen_show_type','字段生成方案',40,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('870dd7c858b44dba8c6b86df5bc03b08','2','已投保（未达到标准）','JTT-415-547-CLLTBZT','车辆类投保状态',30,'0','0,','1','2017-04-20 18:21:17','1','2017-04-20 18:21:17',NULL,'0'),
('88','radiobox','单选框','gen_show_type','字段生成方案',50,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('8809e33312b7475db7326c477cd54791','92','货运出租运输','JTT-415-521-YSLHYLB','运输类行业类别',20,'8393b4a277064ba2b717754039ae003b','0,8393b4a277064ba2b717754039ae003b,','1','2017-04-20 17:59:04','1','2017-04-20 17:59:04',NULL,'0'),
('89','dateselect','日期选择','gen_show_type','字段生成方案',60,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('89209523e77542d98e3ed3936df5dc24','55','珞巴族','GBT-3304','中国各民族名称代码',550,'0','0,','1','2017-04-19 22:39:29','1','2017-04-19 22:39:29',NULL,'0'),
('894ad255c2c142fdae9fe63eaad9f02e','35','撒拉族','GBT-3304','中国各民族名称代码',350,'0','0,','1','2017-04-19 22:35:59','1','2017-04-19 22:35:59',NULL,'0'),
('89ec697cdf6346e799df74dd1e14a847','23','高山族','GBT-3304','中国各民族名称代码',230,'0','0,','1','2017-04-19 22:32:29','1','2017-04-19 22:32:29',NULL,'0'),
('8a314467ac5e4b808d42c206fa234ee0','230100','哈尔滨市','GBT-2260','中国行政区划代码',10,'ea6012c760cd4d52bab85f9e9a87053f','0,ea6012c760cd4d52bab85f9e9a87053f,','1','2017-04-19 22:11:24','1','2017-04-19 22:19:35',NULL,'0'),
('8ace0a096fd74373971606fbfca78a29','39','阿昌族','GBT-3304','中国各民族名称代码',390,'0','0,','1','2017-04-19 22:36:51','1','2017-04-19 22:36:51',NULL,'0'),
('8ae196259ada40218d8fd09274b3b06e','10','政府机关','JTT-415-515-DWSZ','单位性质代码',10,'0','0,','1','2017-04-19 22:48:28','1','2017-04-19 22:48:28',NULL,'0'),
('8afd9eda5b614c978101bade11680865','赣','江西省','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',140,'0','0,','1','2017-04-19 22:53:58','1','2017-04-19 22:53:58',NULL,'0'),
('8b566e541eed4a3a910dd5c1aa05dcc9','5','电动','JTT-415-545-CLLRLLX','车辆类燃料类型',50,'0','0,','1','2017-04-20 18:17:51','1','2017-04-20 18:17:51',NULL,'0'),
('8ba6169d5f4644098a971d8ae8abe20d','110114','昌平区','GBT-2260','中国行政区划代码',150,'fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','1','2017-04-19 21:53:38','1','2017-04-19 21:53:38',NULL,'0'),
('8de8797dd7bb4cd5adb98bec34dc4e94','陕','陕西省','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',270,'0','0,','1','2017-04-19 22:56:47','1','2017-04-19 22:56:47',NULL,'0'),
('8f0adb8c6d5046368eda8810886aa40b','110103','崇文区','GBT-2260','中国行政区划代码',50,'fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','1','2017-04-19 21:50:16','1','2017-04-19 21:50:16',NULL,'0'),
('8f6f0effb26743aaa4cf036516eaa30e','0','未违章','JTT-415-523-YSLJCCLZT','运输类稽查处理状态',10,'0','0,','1','2017-04-20 18:02:33','1','2017-04-20 18:02:33',NULL,'0'),
('8f768a21a7c64dce9fb8d717cf3d87a8','730000','澳门特别行政区','GBT-2260','中国行政区划代码',340,'0','0,','1','2017-04-18 20:06:40','1','2017-04-18 20:06:40',NULL,'0'),
('9','blue','蓝色','color','颜色值',30,'0','0,','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('90','userselect','人员选择\0','gen_show_type','字段生成方案',70,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('91','officeselect','部门选择','gen_show_type','字段生成方案',80,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('911be936f9a44d27ba64b3cccbb1e4d0','15','土家族','GBT-3304','中国各民族名称代码',150,'0','0,','1','2017-04-19 22:30:07','1','2017-04-19 22:30:07',NULL,'0'),
('92','areaselect','区域选择','gen_show_type','字段生成方案',90,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('93','String','String','gen_java_type','Java类型',10,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('931c0acf96b540fc855487b031e16bba','1','已投保','JTT-415-547-CLLTBZT','车辆类投保状态',20,'0','0,','1','2017-04-20 18:20:59','1','2017-04-20 18:20:59',NULL,'0'),
('938ff25253f64edf981e43b4b85e5ec8','101','客运汽车租赁','JTT-415-521-YSLHYLB','运输类行业类别',10,'13bced384b2f4f539bbad1095694dd7a','0,13bced384b2f4f539bbad1095694dd7a,','1','2017-04-20 17:59:28','1','2017-04-20 17:59:28',NULL,'0'),
('9397dcd5d1a64569b97c662d90f31132','2000','道路普通货物运输','JTT-415-524-YSLJYFW','运输类经营范围',20,'0','0,','1','2017-04-20 18:04:21','1','2017-04-20 18:05:17',NULL,'0'),
('93b811d08b144a90ad12278d1efed95b','33','羌族','GBT-3304','中国各民族名称代码',330,'0','0,','1','2017-04-19 22:35:38','1','2017-04-19 22:35:38',NULL,'0'),
('94','Long','Long','gen_java_type','Java类型',20,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('9440aae48be94d81803e6758708d7f82','1','中央','GBT-12404','单位隶属关系代码',10,'0','0,','1','2017-04-19 22:41:20','1','2017-04-19 22:41:20',NULL,'0'),
('949bef2720a843edaa67644453ac9440','1','汽油','JTT-415-545-CLLRLLX','车辆类燃料类型',10,'0','0,','1','2017-04-20 18:16:49','1','2017-04-20 18:16:49',NULL,'0'),
('95','dao','仅持久层','gen_category','代码生成分类\0\0\0\0\0\0',40,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('95e4711b8ac94bf0bdbe08b76c5adfbf','云','云南省','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',250,'0','0,','1','2017-04-19 22:56:22','1','2017-04-19 22:56:22',NULL,'0'),
('96','1','男','sex','性别',10,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0'),
('97','2','女','sex','性别',20,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0'),
('98','Integer','Integer','gen_java_type','Java类型\0\0',30,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('99','Double','Double','gen_java_type','Java类型\0\0',40,'0','0,','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
('99235da1fbad451eaca6cb65675156ea','64','特种拖拉机','JTT-415-549-CLLCLLX','车辆类车辆类型',40,'02d21e73ad644b10b381641a7e81e0f4','0,02d21e73ad644b10b381641a7e81e0f4,','1','2017-04-20 18:30:21','1','2017-04-20 18:30:21',NULL,'0'),
('99f67f2ce69d47d0ace28de1b7c38195','540000','西藏自治区','GBT-2260','中国行政区划代码',260,'0','0,','1','2017-04-18 20:04:12','1','2017-04-18 20:04:12',NULL,'0'),
('99fcbbc6f07d4556968d5ec50a7841b2','9','未达标','JTT-415-542-CLLCLJSDJ','车辆类车辆技术等级',50,'0','0,','1','2017-04-20 18:13:35','1','2017-04-20 18:13:35',NULL,'0'),
('99fe7749009a46ee9189c644016ae3f6','720000','香港特别行政区','GBT-2260','中国行政区划代码',330,'0','0,','1','2017-04-18 20:06:17','1','2017-04-18 20:06:17',NULL,'0'),
('9a72e9d7ce5945d7b64e99e18dc693f4','30','事业单位','JTT-415-515-DWSZ','单位性质代码',30,'0','0,','1','2017-04-19 22:48:45','1','2017-04-19 22:48:45',NULL,'0'),
('9beecabb8a07470ca23e90a46979cc59','40','危险品运输车','JTT-415-549-CLLCLLX','车辆类车辆类型',40,'0','0,','1','2017-04-20 18:23:31','1','2017-04-20 18:23:31',NULL,'0'),
('9cc5e85355584911b42fff1d0884d156','5000','机动车驾驶员培训','JTT-415-524-YSLJYFW','运输类经营范围',50,'0','0,','1','2017-04-20 18:05:49','1','2017-04-20 18:05:49',NULL,'0'),
('9ddbf837107a4b8e87f8be780f179b6e','5','县','GBT-12404','单位隶属关系代码',40,'0','0,','1','2017-04-19 22:41:53','1','2017-04-19 22:41:53',NULL,'0'),
('9e113740a556406ebb9f2f7544a41bc7','150000','内蒙古自治区','GBT-2260','中国行政区划代码',50,'0','0,','1','2017-04-18 19:58:33','1','2017-04-18 19:58:33',NULL,'0'),
('9e217f43a45744bab1b775b082acc8ac','2','年审不合格','JTT-415-544-CLLNDSYZT','车辆类年度审验状态',30,'0','0,','1','2017-04-20 18:16:17','1','2017-04-20 18:16:17',NULL,'0'),
('9f38d23da8fe41f98a211443ba2f9ec3','61','道路旅客运输站','JTT-415-521-YSLHYLB','运输类行业类别',10,'a3a73f19e8c34041b88d143e68f3c40e','0,a3a73f19e8c34041b88d143e68f3c40e,','1','2017-04-20 17:56:36','1','2017-04-20 17:56:36',NULL,'0'),
('9fc70a021c3f4b729b86e4a1e2f3f088','皖','安徽省','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',120,'0','0,','1','2017-04-19 22:53:38','1','2017-04-19 22:53:38',NULL,'0'),
('a00299d29ec3410e811b594fee954cd1','津','天津市','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',20,'0','0,','1','2017-04-19 22:51:38','1','2017-04-19 22:51:38',NULL,'0'),
('a068f17a721349b2a2ec56412880d80c','甘','甘肃省','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',280,'0','0,','1','2017-04-19 22:56:58','1','2017-04-19 22:56:58',NULL,'0'),
('a077a509f53a4dd2aa015e8dde2c0f36','130000','河北省','GBT-2260','中国行政区划代码',30,'0','0,','1','2017-04-18 19:57:52','1','2017-04-18 19:57:52',NULL,'0'),
('a0a275db5caf404da92a2ca5df7abf33','6','街道、镇、乡','GBT-12404','单位隶属关系代码',50,'0','0,','1','2017-04-19 22:42:11','1','2017-04-19 22:42:11',NULL,'0'),
('a0f0ad6881f54670ae8cd75356a7533a','2','违章未处理','JTT-415-523-YSLJCCLZT','运输类稽查处理状态',30,'0','0,','1','2017-04-20 18:03:22','1','2017-04-20 18:03:22',NULL,'0'),
('a3a73f19e8c34041b88d143e68f3c40e','60','站场服务','JTT-415-521-YSLHYLB','运输类行业类别',60,'0','0,','1','2017-04-20 17:47:49','1','2017-04-20 17:47:49',NULL,'0'),
('a3f2f1845d454c1699f1e6bd0f917f5e','藏','西藏自治区','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',260,'0','0,','1','2017-04-19 22:56:36','1','2017-04-19 22:56:36',NULL,'0'),
('a47db7e0bc0548799d5e41a02ec3047c','2','电子标签','JTT-415-5413-CLLDLYSZJZ','车辆类道路运输证介质',20,'0','0,','1','2017-04-20 18:37:34','1','2017-04-20 18:37:34',NULL,'0'),
('a4e7730b369740cc85ae97290995f742','110115','大兴区','GBT-2260','中国行政区划代码',160,'fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','1','2017-04-19 21:53:49','1','2017-04-19 21:53:49',NULL,'0'),
('a5ae797208f34fb0aa928482a70b3092','3000','道路危险货物运输','JTT-415-524-YSLJYFW','运输类经营范围',30,'0','0,','1','2017-04-20 18:05:09','1','2017-04-20 18:05:09',NULL,'0'),
('a6a3167ca591489a94b688d59a2a3851','5','维吾尔族','GBT-3304','中国各民族名称代码',50,'0','0,','1','2017-04-19 22:28:10','1','2017-04-19 22:28:10',NULL,'0'),
('a7037a547426465f9ae4140ea74ec8ea','43','摩托车维修','JTT-415-521-YSLHYLB','运输类行业类别',30,'bb7cdab9ac724a2f842dddef80acec94','0,bb7cdab9ac724a2f842dddef80acec94,','1','2017-04-20 17:53:12','1','2017-04-20 17:53:12',NULL,'0'),
('a78dbcb3945d47848e2bdadb0161ef8f','220300','四平市','GBT-2260','中国行政区划代码',30,'aa295df36bd54262b8cbe1215b73effd','0,aa295df36bd54262b8cbe1215b73effd,','1','2017-04-19 22:02:32','1','2017-04-19 22:02:32',NULL,'0'),
('a7b1db5849284be0bd1be9c908b16c5a','420000','湖北省','GBT-2260','中国行政区划代码',170,'0','0,','1','2017-04-18 20:01:36','1','2017-04-18 20:01:36',NULL,'0'),
('a89280618ef34a238aa4fbc2fa8e4a31','18','傣族','GBT-3304','中国各民族名称代码',180,'0','0,','1','2017-04-19 22:30:35','1','2017-04-19 22:30:35',NULL,'0'),
('a90abe3612af4182975171c8b4e1312a','29','柯尔克孜族','GBT-3304','中国各民族名称代码',290,'0','0,','1','2017-04-19 22:33:59','1','2017-04-19 22:33:59',NULL,'0'),
('aa22b71dfa7140f8b78b67cf96b048a5','B1','中型客车','JTT-415-5410-CLLCXDM','车辆类车型代码',40,'0','0,','1','2017-04-20 18:32:01','1','2017-04-20 18:32:01',NULL,'0'),
('aa295df36bd54262b8cbe1215b73effd','220000','吉林省','GBT-2260','中国行政区划代码',70,'0','0,','1','2017-04-18 19:59:02','1','2017-04-18 19:59:02',NULL,'0'),
('aadfdac47e8e4ff1886c7285fdbc9984','460000','海南省','GBT-2260','中国行政区划代码',210,'0','0,','1','2017-04-18 20:02:33','1','2017-04-18 20:02:33',NULL,'0'),
('ab5d1201a97e4308b22a7ecb97311454','M','轮式自行机械车','JTT-415-5410-CLLCXDM','车辆类车型代码',130,'0','0,','1','2017-04-20 18:34:04','1','2017-04-20 18:34:04',NULL,'0'),
('ab64d8e6de524295ac21f32050426999','530000','云南省','GBT-2260','中国行政区划代码',250,'0','0,','1','2017-04-18 20:03:52','1','2017-04-18 20:03:52',NULL,'0'),
('ac3b68500c3840fbbbcdd01138ae1fe7','140000','山西省','GBT-2260','中国行政区划代码',40,'0','0,','1','2017-04-18 19:58:16','1','2017-04-18 19:58:16',NULL,'0'),
('aebe10e83c934be1bd1060c495ac2828','20','傈僳族','GBT-3304','中国各民族名称代码',200,'0','0,','1','2017-04-19 22:31:56','1','2017-04-19 22:31:56',NULL,'0'),
('afea4268d0744164b92fa92a4361f716','7','彝族','GBT-3304','中国各民族名称代码',70,'0','0,','1','2017-04-19 22:28:44','1','2017-04-19 22:28:44',NULL,'0'),
('b008019b0e7a48b4a7edd78c9f50100d','220400','辽源市','GBT-2260','中国行政区划代码',40,'aa295df36bd54262b8cbe1215b73effd','0,aa295df36bd54262b8cbe1215b73effd,','1','2017-04-19 22:02:47','1','2017-04-19 22:02:47',NULL,'0'),
('b0b30faba585484093fad155d4fdefab','52','鄂伦春族','GBT-3304','中国各民族名称代码',520,'0','0,','1','2017-04-19 22:38:59','1','2017-04-19 22:38:59',NULL,'0'),
('b39121a62228427b8d822af11553220a','28','景颇族','GBT-3304','中国各民族名称代码',280,'0','0,','1','2017-04-19 22:33:49','1','2017-04-19 22:33:49',NULL,'0'),
('b46322541f6d4a709be0fd40f1b5d216','50','机动车驾驶员培训','JTT-415-521-YSLHYLB','运输类行业类别',50,'0','0,','1','2017-04-20 17:47:11','1','2017-04-20 17:47:11',NULL,'0'),
('b4a966df00d34a04b52a59903aaa4d01','豫','河南省','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',160,'0','0,','1','2017-04-19 22:54:26','1','2017-04-19 22:54:34',NULL,'0'),
('b4e1934490604635a54fb12ae1db8d4d','90','其他车辆','JTT-415-549-CLLCLLX','车辆类车辆类型',70,'0','0,','1','2017-04-20 18:23:59','1','2017-04-20 18:23:59',NULL,'0'),
('b5ff38ddc36047fb9def6bd236e7c866','98','外国血统中国籍人士','GBT-3304','中国各民族名称代码',580,'0','0,','1','2017-04-19 22:40:19','1','2017-04-19 22:40:19',NULL,'0'),
('b65ece1f898a4c82b632c299f22921f4','4','专项修理','JTT-415-5411-CLLXLJB','车辆类修理级别',40,'0','0,','1','2017-04-20 18:35:29','1','2017-04-20 18:35:29',NULL,'0'),
('b791bfcc620b4d76b89e9521003efeea','20','道路货物运输','JTT-415-521-YSLHYLB','运输类行业类别',20,'0','0,','1','2017-04-20 17:46:08','1','2017-04-20 17:46:08',NULL,'0'),
('b84f74d75c724308930327e047a77e03','0','未维护','JTT-415-543-CLLEJWHZT','车辆类二级维护状态',10,'0','0,','1','2017-04-20 18:14:16','1','2017-04-20 18:14:16',NULL,'0'),
('b8875038e7bd4be3804b6335cd2cbd6e','宁','宁夏回族自治区','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',300,'0','0,','1','2017-04-19 22:57:22','1','2017-04-19 22:57:22',NULL,'0'),
('b88a7bb80fd040e286f85b10b9e690ac','11','大型客车','JTT-415-549-CLLCLLX','车辆类车辆类型',10,'5a33da74669d4d0d9eca8f3ebba21cbe','0,5a33da74669d4d0d9eca8f3ebba21cbe,','1','2017-04-20 18:24:53','1','2017-04-20 18:24:53',NULL,'0'),
('b925f547db6b42e7a8a664466d816637','210400','抚顺市','GBT-2260','中国行政区划代码',40,'6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','1','2017-04-19 21:57:50','1','2017-04-19 21:57:50',NULL,'0'),
('b9aa8826c28448c7bae3c14cec380b76','9','其他','JTT-415-5412-CLLCPYS','车辆类车牌颜色',50,'0','0,','1','2017-04-20 18:36:55','1','2017-04-20 18:36:55',NULL,'0'),
('ba14de1c56b249af846cf3c70b89d051','220500','通化市','GBT-2260','中国行政区划代码',50,'aa295df36bd54262b8cbe1215b73effd','0,aa295df36bd54262b8cbe1215b73effd,','1','2017-04-19 22:03:08','1','2017-04-19 22:03:08',NULL,'0'),
('ba3edf28d1ef4a2b963ef1243c50fb05','220700','松原市','GBT-2260','中国行政区划代码',70,'aa295df36bd54262b8cbe1215b73effd','0,aa295df36bd54262b8cbe1215b73effd,','1','2017-04-19 22:03:37','1','2017-04-19 22:03:37',NULL,'0'),
('bb1fd4ba9c224dcdad94fa943db33b16','53','赫哲族','GBT-3304','中国各民族名称代码',530,'0','0,','1','2017-04-19 22:39:11','1','2017-04-19 22:39:11',NULL,'0'),
('bb7cdab9ac724a2f842dddef80acec94','40','机动车维修','JTT-415-521-YSLHYLB','运输类行业类别',40,'0','0,','1','2017-04-20 17:46:38','1','2017-04-20 17:46:38',NULL,'0'),
('bbe43c8924cb4451b6d26d83071bf000','4','藏族','GBT-3304','中国各民族名称代码',40,'0','0,','1','2017-04-19 22:28:03','1','2017-04-19 22:28:03',NULL,'0'),
('bc42c5533bf042a396b5cb2c4facafa8','A3','城市公交车','JTT-415-5410-CLLCXDM','车辆类车型代码',30,'0','0,','1','2017-04-20 18:31:53','1','2017-04-20 18:31:53',NULL,'0'),
('be64f87a769140b7b836d76bebbe91a9','430000','湖南省','GBT-2260','中国行政区划代码',180,'0','0,','1','2017-04-18 20:01:51','1','2017-04-18 20:01:51',NULL,'0'),
('bec1b4318d4940a5abb7a4437add1f81','14','白族','GBT-3304','中国各民族名称代码',140,'0','0,','1','2017-04-19 22:30:01','1','2017-04-19 22:30:01',NULL,'0'),
('bf21382c151548b3ac071cfaccba0f15','3','天然气','JTT-415-545-CLLRLLX','车辆类燃料类型',30,'0','0,','1','2017-04-20 18:17:09','1','2017-04-20 18:17:09',NULL,'0'),
('bf9ca9137b354b96811cb687845c1966','湘','湖南省','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',180,'0','0,','1','2017-04-19 22:54:57','1','2017-04-19 22:54:57',NULL,'0'),
('bfe00d9e0e3b4dd49e8ef29b10bb2b02','41','塔吉克族','GBT-3304','中国各民族名称代码',410,'0','0,','1','2017-04-19 22:37:10','1','2017-04-19 22:37:10',NULL,'0'),
('c2623721245741fcb97c68ef731b85ca','14','轿车','JTT-415-549-CLLCLLX','车辆类车辆类型',40,'5a33da74669d4d0d9eca8f3ebba21cbe','0,5a33da74669d4d0d9eca8f3ebba21cbe,','1','2017-04-20 18:25:47','1','2017-04-20 18:25:47',NULL,'0'),
('c26a75f9718643a6b5dec283b82e78dc','0','未投保','JTT-415-547-CLLTBZT','车辆类投保状态',10,'0','0,','1','2017-04-20 18:20:52','1','2017-04-20 18:20:52',NULL,'0'),
('c2a410c520eb4ae89138d1e3986423dd','4','液化气','JTT-415-545-CLLRLLX','车辆类燃料类型',40,'0','0,','1','2017-04-20 18:17:19','1','2017-04-20 18:17:19',NULL,'0'),
('c34af4651216401399b61f665a0acd1b','42','怒族','GBT-3304','中国各民族名称代码',420,'0','0,','1','2017-04-19 22:37:22','1','2017-04-19 22:37:22',NULL,'0'),
('c3b41f59241e49d8b5841c49c909fd74','49','京族','GBT-3304','中国各民族名称代码',490,'0','0,','1','2017-04-19 22:38:33','1','2017-04-19 22:38:33',NULL,'0'),
('c4852ba1d5ce42aab5654aae195b6e4a','210200','大连市','GBT-2260','中国行政区划代码',20,'6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','1','2017-04-19 21:57:09','1','2017-04-19 21:57:09',NULL,'0'),
('c6e779a1fc4548858afe7a1523b8d773','230500','双鸭山市','GBT-2260','中国行政区划代码',50,'ea6012c760cd4d52bab85f9e9a87053f','0,ea6012c760cd4d52bab85f9e9a87053f,','1','2017-04-19 22:20:22','1','2017-04-19 22:20:22',NULL,'0'),
('c72e4605133b481aaff535032902b9d7','110117','平谷区','GBT-2260','中国行政区划代码',180,'fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','1','2017-04-19 21:54:15','1','2017-04-19 21:54:15',NULL,'0'),
('c7337f7d74c64e0182dab4a1a9d9caab','3','黑色','JTT-415-5412-CLLCPYS','车辆类车牌颜色',30,'0','0,','1','2017-04-20 18:36:28','1','2017-04-20 18:36:28',NULL,'0'),
('c8041fde2cb2406abe774e4d229e3cbc','44','其他机动车维修','JTT-415-521-YSLHYLB','运输类行业类别',40,'bb7cdab9ac724a2f842dddef80acec94','0,bb7cdab9ac724a2f842dddef80acec94,','1','2017-04-20 17:53:50','1','2017-04-20 17:53:50',NULL,'0'),
('ca9b3f6a4a9a4ed8b95049eb48b08547','24','拉祜族','GBT-3304','中国各民族名称代码',240,'0','0,','1','2017-04-19 22:32:40','1','2017-04-19 22:32:40',NULL,'0'),
('cd6ff8f9863a486b8a67c4cbeec6f943','3','小修','JTT-415-5411-CLLXLJB','车辆类修理级别',30,'0','0,','1','2017-04-20 18:35:21','1','2017-04-20 18:35:21',NULL,'0'),
('cde3f1ec72de47c69cd73f71c44e7e7b','36','毛南族','GBT-3304','中国各民族名称代码',360,'0','0,','1','2017-04-19 22:36:08','1','2017-04-19 22:36:08',NULL,'0'),
('ce5371317d38416ead7f59cb7647049e','210900','阜新市','GBT-2260','中国行政区划代码',90,'6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','1','2017-04-19 22:00:05','1','2017-04-19 22:00:05',NULL,'0'),
('cf04e43d1f464d6daf014b96e1a7480c','沪','上海市','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',90,'0','0,','1','2017-04-19 22:53:08','1','2017-04-19 22:53:08',NULL,'0'),
('cfb4f931d1e644fe95282528664ff3a2','70','国际道路运输','JTT-415-521-YSLHYLB','运输类行业类别',70,'0','0,','1','2017-04-20 17:48:16','1','2017-04-20 17:48:16',NULL,'0'),
('d03e44d033c04d03b1c1df4410b4f605','38','锡伯族','GBT-3304','中国各民族名称代码',380,'0','0,','1','2017-04-19 22:36:38','1','2017-04-19 22:36:38',NULL,'0'),
('d093f4f645b74733b101bc96dacc90dd','1000','道路旅客运输','JTT-415-524-YSLJYFW','运输类经营范围',10,'0','0,','1','2017-04-20 18:04:06','1','2017-04-20 18:04:06',NULL,'0'),
('d09a9e480135414ca4601f59365b53e2','80','注销','JTT-415-546-CLLCLYYZT','车辆类车辆营运状态',80,'0','0,','1','2017-04-20 18:20:09','1','2017-04-20 18:20:09',NULL,'0'),
('d0e5ed04eed6469a877ae4a59eab9ca7','34000','安徽省','GBT-2260','中国行政区划代码',120,'0','0,','1','2017-04-18 20:00:13','1','2017-04-18 20:00:13',NULL,'0'),
('d1292e62d4174e5bbc0e8c873829289a','贵','贵州省','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',240,'0','0,','1','2017-04-19 22:56:13','1','2017-04-19 22:56:13',NULL,'0'),
('d2d49a584e914024a11bbe7a9a9e1b43','黑','黑龙江省','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',80,'0','0,','1','2017-04-19 22:52:57','1','2017-04-19 22:52:57',NULL,'0'),
('d48edbd08e274b69966cb3755fc575ab','231100','黑河市','GBT-2260','中国行政区划代码',110,'ea6012c760cd4d52bab85f9e9a87053f','0,ea6012c760cd4d52bab85f9e9a87053f,','1','2017-04-19 22:22:00','1','2017-04-19 22:22:00',NULL,'0'),
('d4f79a858ea34d119032f49a1ce19726','62','道路货运站（场）','JTT-415-521-YSLHYLB','运输类行业类别',20,'a3a73f19e8c34041b88d143e68f3c40e','0,a3a73f19e8c34041b88d143e68f3c40e,','1','2017-04-20 17:56:51','1','2017-04-20 17:56:51',NULL,'0'),
('d8feb59c976e46728339c02833acff22','40','社会团体','JTT-415-515-DWSZ','单位性质代码',40,'0','0,','1','2017-04-19 22:48:57','1','2017-04-19 22:48:57',NULL,'0'),
('d914105205244b92a3c737e91f0a1779','0','未年审','JTT-415-544-CLLNDSYZT','车辆类年度审验状态',10,'0','0,','1','2017-04-20 18:15:54','1','2017-04-20 18:15:54',NULL,'0'),
('da36303a08e24a60975bf0ebd7338786','4000','机动车维修','JTT-415-524-YSLJYFW','运输类经营范围',40,'0','0,','1','2017-04-20 18:05:29','1','2017-04-20 18:05:29',NULL,'0'),
('dc66879ff9264daa91d8b1e084f3adc3','320000','江苏省','GBT-2260','中国行政区划代码',100,'0','0,','1','2017-04-18 19:59:50','1','2017-04-18 19:59:50',NULL,'0'),
('dd2900084dab471680e9b6abefdd1dd7','34','歇业','JTT-415-546-CLLCLYYZT','车辆类车辆营运状态',70,'0','0,','1','2017-04-20 18:19:42','1','2017-04-20 18:19:42',NULL,'0'),
('dd6125419d894c1f8fd19047d292ad55','110113','顺义区','GBT-2260','中国行政区划代码',140,'fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','1','2017-04-19 21:53:23','1','2017-04-19 21:53:23',NULL,'0'),
('de1543d35659497e931508975154fd44','0','未评定','JTT-415-542-CLLCLJSDJ','车辆类车辆技术等级',10,'0','0,','1','2017-04-20 18:12:59','1','2017-04-20 18:12:59',NULL,'0'),
('de8eba22468e4999812f72a464a887bc','36000','江西省','GBT-2260','中国行政区划代码',140,'0','0,','1','2017-04-18 20:00:53','1','2017-04-18 20:00:53',NULL,'0'),
('deef40134f13434b92cf18639fe9c196','32','迁出（转籍）','JTT-415-546-CLLCLYYZT','车辆类车辆营运状态',50,'0','0,','1','2017-04-20 18:19:23','1','2017-04-20 18:19:23',NULL,'0'),
('df2e038a8bf1420abef1e019d10057d0','110107','石景山区','GBT-2260','中国行政区划代码',90,'fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','1','2017-04-19 21:51:48','1','2017-04-19 21:51:48',NULL,'0'),
('e05e4102867e4ccab9864416c9f8b1af','21','道路普通货物运输','JTT-415-521-YSLHYLB','运输类行业类别',10,'b791bfcc620b4d76b89e9521003efeea','0,b791bfcc620b4d76b89e9521003efeea,','1','2017-04-20 17:50:50','1','2017-04-20 17:51:21',NULL,'0'),
('e30f2546bffc479b9b23b9dccc62dd7d','110112','通州区','GBT-2260','中国行政区划代码',130,'fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','1','2017-04-19 21:53:08','1','2017-04-19 21:53:08',NULL,'0'),
('e326927db4304dccae667c59259af0e4','26','东乡族','GBT-3304','中国各民族名称代码',260,'0','0,','1','2017-04-19 22:32:59','1','2017-04-19 22:32:59',NULL,'0'),
('e349369c22cb4b499a29e1fb85fdaa0d','11','满族','GBT-3304','中国各民族名称代码',110,'0','0,','1','2017-04-19 22:29:27','1','2017-04-19 22:29:27',NULL,'0'),
('e353aaace72e4bae83d49af2022998aa','浙','浙江省','JTT-415-5222-DLYSJYXKZZB','道路运输经营许可证字别',110,'0','0,','1','2017-04-19 22:53:26','1','2017-04-19 22:53:26',NULL,'0'),
('e388c8a83ff24d7c8cb2ab4722538067','21','大型普通货车','JTT-415-549-CLLCLLX','车辆类车辆类型',10,'063687dfbe484866b2284a9bbc9672c6','0,063687dfbe484866b2284a9bbc9672c6,','1','2017-04-20 18:26:57','1','2017-04-20 18:26:57',NULL,'0'),
('e49c0d1208a645eeb33a96bf9b81bd07','63','履带拖拉机','JTT-415-549-CLLCLLX','车辆类车辆类型',30,'02d21e73ad644b10b381641a7e81e0f4','0,02d21e73ad644b10b381641a7e81e0f4,','1','2017-04-20 18:30:09','1','2017-04-20 18:30:09',NULL,'0'),
('e579ce16ba2f4844803bea2334d5a020','110101','东城区','GBT-2260','中国行政区划代码',30,'fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','1','2017-04-19 21:49:26','1','2017-04-19 21:49:26',NULL,'0'),
('e5efd6ecc7344e3ca77b9bbe743a42e9','230300','鸡西市','GBT-2260','中国行政区划代码',30,'ea6012c760cd4d52bab85f9e9a87053f','0,ea6012c760cd4d52bab85f9e9a87053f,','1','2017-04-19 22:11:54','1','2017-04-19 22:19:56',NULL,'0'),
('e60448111456470091a3236b717ccd11','110102','西城区','GBT-2260','中国行政区划代码',40,'fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','1','2017-04-19 21:49:44','1','2017-04-19 21:49:44',NULL,'0'),
('e887e39e0dc848e3890199b2645ce180','32','大件运输车','JTT-415-549-CLLCLLX','车辆类车辆类型',20,'137d92b60d2843d2a1b1376ebe426735','0,137d92b60d2843d2a1b1376ebe426735,','1','2017-04-20 18:27:52','1','2017-04-20 18:27:52',NULL,'0'),
('e8f2f72aaaa84c4d8a62dddd9479a280','21','停运','JTT-415-546-CLLCLYYZT','车辆类车辆营运状态',20,'0','0,','1','2017-04-20 18:18:49','1','2017-04-20 18:18:49',NULL,'0'),
('e8fd27bffe194095be76f5951e002053','11','班车客运','JTT-415-521-YSLHYLB','运输类行业类别',10,'7292b2d4951248bdb9aa9a9963c09d02','0,7292b2d4951248bdb9aa9a9963c09d02,','1','2017-04-20 17:49:09','1','2017-04-20 17:49:20',NULL,'0'),
('ea6012c760cd4d52bab85f9e9a87053f','230000','黑龙江省','GBT-2260','中国行政区划代码',80,'0','0,','1','2017-04-18 19:59:18','1','2017-04-18 19:59:18',NULL,'0'),
('eb9e79c5d7aa4adc8f623b07424557ec','42','危险货物运输车辆维修','JTT-415-521-YSLHYLB','运输类行业类别',20,'bb7cdab9ac724a2f842dddef80acec94','0,bb7cdab9ac724a2f842dddef80acec94,','1','2017-04-20 17:53:00','1','2017-04-20 17:53:00',NULL,'0'),
('ebd75e92e07844058e66ede85196bc30','22','货物专用运输','JTT-415-521-YSLHYLB','运输类行业类别',20,'b791bfcc620b4d76b89e9521003efeea','0,b791bfcc620b4d76b89e9521003efeea,','1','2017-04-20 17:51:34','1','2017-04-20 17:51:34',NULL,'0'),
('eebf2964a4bb47f49cfceaf523e2955f','230700','伊春市','GBT-2260','中国行政区划代码',70,'ea6012c760cd4d52bab85f9e9a87053f','0,ea6012c760cd4d52bab85f9e9a87053f,','1','2017-04-19 22:20:53','1','2017-04-19 22:20:53',NULL,'0'),
('f04844e673b34402ad21fb14e9b9cd5c','110228','密云县','GBT-2260','中国行政区划代码',40,'2e091e415f8e4b97a2f7069a7422a1f7','0,8046fa8eb55a472383d090450a04bda0,2e091e415f8e4b97a2f7069a7422a1f7,','1','2017-04-19 21:54:45','1','2017-04-19 21:54:45',NULL,'0'),
('f340834513824076bc2196b7155a36e6','53','机动车驾驶员培训教练场','JTT-415-521-YSLHYLB','运输类行业类别',30,'b46322541f6d4a709be0fd40f1b5d216','0,b46322541f6d4a709be0fd40f1b5d216,','1','2017-04-20 17:56:13','1','2017-04-20 17:56:13',NULL,'0'),
('f3552e6456904d329917e97b8168daa0','37','仡佬族','GBT-3304','中国各民族名称代码',370,'0','0,','1','2017-04-19 22:36:27','1','2017-04-19 22:36:27',NULL,'0'),
('f445caeb5b6a47f0834d54be69b7c6c4','46','德昂族','GBT-3304','中国各民族名称代码',460,'0','0,','1','2017-04-19 22:38:04','1','2017-04-19 22:38:04',NULL,'0'),
('f68c5d28aa394e26bfd1a3448d358a38','232700','大兴安岭地区','GBT-2260','中国行政区划代码',130,'ea6012c760cd4d52bab85f9e9a87053f','0,ea6012c760cd4d52bab85f9e9a87053f,','1','2017-04-19 22:22:32','1','2017-04-19 22:22:32',NULL,'0'),
('f6989448a6714df69bcaff6ce6f4a72c','211200','铁岭市','GBT-2260','中国行政区划代码',120,'6613a5ca7b7b4354959a4d98a85662ad','0,6613a5ca7b7b4354959a4d98a85662ad,','1','2017-04-19 22:00:46','1','2017-04-19 22:00:46',NULL,'0'),
('fa4ed0b736724f388dbcf177a81e9312','110105','朝阳区','GBT-2260','中国行政区划代码',70,'fa7ca81206904d6a96ed9de3f0ae5fe5','0,8046fa8eb55a472383d090450a04bda0,fa7ca81206904d6a96ed9de3f0ae5fe5,','1','2017-04-19 21:51:06','1','2017-04-19 21:51:06',NULL,'0'),
('fa7aff2f434d47a1a1ecee0eeb9e2ab6','1','纸质','JTT-415-5413-CLLDLYSZJZ','车辆类道路运输证介质',10,'0','0,','1','2017-04-20 18:37:26','1','2017-04-20 18:37:26',NULL,'0'),
('fa7ca81206904d6a96ed9de3f0ae5fe5','110100','市辖区','GBT-2260','中国行政区划代码',20,'8046fa8eb55a472383d090450a04bda0','0,8046fa8eb55a472383d090450a04bda0,','1','2017-04-19 21:41:09','1','2017-04-19 21:41:09',NULL,'0'),
('fadcce7c22d24fd7aa1bc27b926e23bd','350000','福建省','GBT-2260','中国行政区划代码',130,'0','0,','1','2017-04-18 20:00:27','1','2017-04-18 20:00:27',NULL,'0'),
('fb3876d923f44112b057842ac0df68de','9','其他','JTT-415-545-CLLRLLX','车辆类燃料类型',60,'0','0,','1','2017-04-20 18:18:01','1','2017-04-20 18:18:01',NULL,'0'),
('fc53400f207b49ed82b52c57b0a90fe3','20','企业','JTT-415-515-DWSZ','单位性质代码',20,'0','0,','1','2017-04-19 22:48:36','1','2017-04-19 22:48:36',NULL,'0');

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';

/*Data for the table `sys_log` */

/*Table structure for table `sys_mdict` */

DROP TABLE IF EXISTS `sys_mdict`;

CREATE TABLE `sys_mdict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='多级字典表';

/*Data for the table `sys_mdict` */

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_show` char(1) NOT NULL COMMENT '是否在菜单中显示',
  `is_usercenter` char(1) NOT NULL COMMENT '是否在个人中心下拉菜单显示',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`parent_id`,`parent_ids`,`name`,`sort`,`href`,`target`,`icon`,`is_show`,`is_usercenter`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('0b2ebd4d639e4c2b83c2dd0764522f24','ba8092291b40482db8fe7fc006ea3d76','0,1,74,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,','编辑',60,'','','','0','0','test:testData:edit','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),
('0ca004d6b1bf4bcab9670a5060d82a55','3c92c17886944d0687e73e286cada573','0,1,74,3c92c17886944d0687e73e286cada573,','树结构',90,'/test/testTree','','','1','0','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),
('1','0','0,','功能菜单',0,NULL,NULL,NULL,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('10','3','0,1,2,3,','字典管理',60,'/sys/dict/',NULL,'th-list','1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('11','10','0,1,2,3,10,','查看',30,NULL,NULL,NULL,'0','0','sys:dict:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('12','10','0,1,2,3,10,','修改',40,NULL,NULL,NULL,'0','0','sys:dict:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('13','2','0,1,2,','机构用户',20,NULL,NULL,'users','1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('14','13','0,1,2,13,','区域管理',50,'/sys/area/',NULL,'th','1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('15','14','0,1,2,13,14,','查看',30,NULL,NULL,NULL,'0','0','sys:area:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('16','14','0,1,2,13,14,','修改',40,NULL,NULL,NULL,'0','0','sys:area:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('17','13','0,1,2,13,','机构管理',40,'/sys/office/list',NULL,'th-large','1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('18','17','0,1,2,13,17,','查看',30,NULL,NULL,NULL,'0','0','sys:office:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('19','17','0,1,2,13,17,','修改',40,NULL,NULL,NULL,'0','0','sys:office:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('2','1','0,1,','系统设置',900,NULL,NULL,NULL,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('20','13','0,1,2,13,','用户管理',30,'/sys/user/',NULL,'user','1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('21','20','0,1,2,13,20,','查看',30,NULL,NULL,NULL,'0','0','sys:user:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('22','20','0,1,2,13,20,','修改',40,NULL,NULL,NULL,'0','0','sys:user:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('23','2','0,1,2,','日志查询',30,NULL,NULL,'paw','1','0',NULL,'1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),
('24','23','0,1,2,23,','日志查询',30,'/sys/log',NULL,'pencil','1','0','sys:log:view','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),
('25','23','0,1,2,23,','连接池监视',40,'direct://druid',NULL,'unlink','1','0',NULL,'1','2013-10-18 08:00:00','1','2013-10-18 08:00:00',NULL,'0'),
('26','2','0,1,2,','关于帮助',990,NULL,NULL,'comment','1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('27','26','0,1,2,26,','官方首页',30,'https://github.com/sailorhdx/taurusxs','_blank','home','1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('28','1','0,1,','我的面板',100,NULL,NULL,NULL,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('29','28','0,1,28,','个人信息',30,NULL,NULL,'user','1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('3','2','0,1,2,','系统设置',10,NULL,NULL,'cogs','1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('30','29','0,1,28,29,','个人信息',30,'/sys/user/info',NULL,'user','1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('31','29','0,1,28,29,','修改密码',40,'/sys/user/modifyPwd',NULL,'lock','1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('32','28','0,1,28,','文件管理',90,NULL,NULL,'folder','1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('33','32','0,1,28,32,','文件管理',90,'direct://static/metronic/assets/global/plugins/ckfinder/ckfinder.html',NULL,'folder-open','1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('34','1','0,1,','内容管理',300,NULL,NULL,NULL,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('35','34','0,1,34,','栏目设置',990,NULL,NULL,'cubes','1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('36','35','0,1,34,35','栏目管理',30,'/cms/category/',NULL,'align-justify','1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('37','36','0,1,34,35,36,','查看',30,NULL,NULL,NULL,'0','0','cms:category:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('38','36','0,1,34,35,36,','修改',40,NULL,NULL,NULL,'0','0','cms:category:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('39','35','0,1,34,35','站点设置',40,'/cms/site/',NULL,'certificate','1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('3c92c17886944d0687e73e286cada573','74','0,1,74,','生成示例',120,'','','','1','0','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),
('4','3','0,1,2,3,','菜单管理',30,'/sys/menu/',NULL,'list-alt','1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('40','39','0,1,34,35,39,','查看',30,NULL,NULL,NULL,'0','0','cms:site:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('41','39','0,1,34,35,39,','修改',40,NULL,NULL,NULL,'0','0','cms:site:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('42','35','0,1,34,35','切换站点',50,'/cms/site/select',NULL,'retweet','1','0','cms:site:select','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('43','34','0,1,34,','内容管理',500,NULL,NULL,'book','1','0','cms:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('44','43','0,1,34,43,','内容发布',30,'/cms/',NULL,'briefcase','1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('45','44','0,1,34,43,44,','文章模型',40,'/cms/article/',NULL,'file','1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('46','45','0,1,34,43,44,45,','查看',30,NULL,NULL,NULL,'0','0','cms:article:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('47','45','0,1,34,43,44,45,','修改',40,NULL,NULL,NULL,'0','0','cms:article:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('48','45','0,1,34,43,44,45,','审核',50,NULL,NULL,NULL,'0','0','cms:article:audit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('4855cf3b25c244fb8500a380db189d97','b1f6d1b86ba24365bae7fd86c5082317','0,1,74,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,','查看',30,'','','','0','0','test:testDataMain:view','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),
('49','44','0,1,34,43,44,','链接模型',60,'/cms/link/',NULL,'random','1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('5','4','0,1,2,3,4,','查看',30,NULL,NULL,NULL,'0','0','sys:menu:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('50','49','0,1,34,43,44,49,','查看',30,NULL,NULL,NULL,'0','0','cms:link:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('51','49','0,1,34,43,44,49,','修改',40,NULL,NULL,NULL,'0','0','cms:link:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('52','49','0,1,34,43,44,49,','审核',50,NULL,NULL,NULL,'0','0','cms:link:audit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('53','43','0,1,34,43,','评论管理',40,'/cms/comment/?status=2',NULL,'comment','1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('54','53','0,1,34,43,53,','查看',30,NULL,NULL,NULL,'0','0','cms:comment:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('55','53','0,1,34,43,53,','审核',40,NULL,NULL,NULL,'0','0','cms:comment:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('56','43','0,1,34,43,','公共留言',80,'/cms/guestbook/?status=2',NULL,'glass','1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('57','56','0,1,34,43,56,','查看',30,NULL,NULL,NULL,'0','0','cms:guestbook:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('58','56','0,1,34,43,56,','审核',40,NULL,NULL,NULL,'0','0','cms:guestbook:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('59','34','0,1,34,','统计分析',600,NULL,NULL,'area-chart','1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('6','4','0,1,2,3,4,','修改',40,NULL,NULL,NULL,'0','0','sys:menu:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('60','59','0,1,34,59,','信息量统计',30,'/cms/stats/article',NULL,'bar-chart','1','0','cms:stats:article','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('61','1','0,1,','在线办公',200,NULL,NULL,NULL,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('62','61','0,1,61,','通知通告',20,'','','bell','1','0','','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),
('63','62','0,1,61,62,','我的通告',30,'/oa/oaNotify/self','','bullhorn','1','0','','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),
('64','62','0,1,61,62,','通告管理',50,'/oa/oaNotify','','comments','1','0','oa:oaNotify:view,oa:oaNotify:edit','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),
('65','61','0,1,61,','个人办公',30,NULL,NULL,'laptop','1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('66','65','0,1,61,65,','我的任务',50,'/act/task/todo/',NULL,'tasks','1','0',NULL,'1','2013-09-24 08:00:00','1','2013-09-24 08:00:00',NULL,'0'),
('67','65','0,1,61,65,','审批测试',100,'/oa/testAudit',NULL,'edit','1','0','oa:testAudit:view,oa:testAudit:edit','1','2013-09-24 08:00:00','1','2013-09-24 08:00:00',NULL,'0'),
('68','65','0,1,61,65,','请假办理',300,'/oa/leave',NULL,'leaf','0','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('69','68','0,1,61,65,68,','查看',30,NULL,NULL,NULL,'0','0','oa:leave:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('7','3','0,1,2,3,','角色管理',50,'/sys/role/',NULL,'lock','1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('70','68','0,1,61,65,68,','修改',40,NULL,NULL,NULL,'0','0','oa:leave:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('71','61','0,1,61,','流程管理',300,NULL,NULL,'chain','1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('72','71','0,1,61,71,','流程管理',50,'/act/process',NULL,'road','1','0','act:process:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('73','71','0,1,61,71,','模型管理',100,'/act/model',NULL,'road','1','0','act:model:edit','1','2013-09-20 08:00:00','1','2013-09-20 08:00:00',NULL,'0'),
('74','1','0,1,','代码生成',1000,NULL,NULL,NULL,'1','0',NULL,'1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),
('75','74','0,1,74,','代码生成',50,NULL,NULL,'code','1','0',NULL,'1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),
('76','75','0,1,74,75,','业务表配置',20,'/gen/genTable',NULL,'table','1','0','gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),
('77','75','0,1,74,75,','生成方案配置',30,'/gen/genScheme',NULL,'th-list','1','0','gen:genScheme:view,gen:genScheme:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),
('8','7','0,1,2,3,7,','查看',30,NULL,NULL,NULL,'0','0','sys:role:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('9','7','0,1,2,3,7,','修改',40,NULL,NULL,NULL,'0','0','sys:role:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('afab2db430e2457f9cf3a11feaa8b869','0ca004d6b1bf4bcab9670a5060d82a55','0,1,74,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,','编辑',60,'','','','0','0','test:testTree:edit','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),
('b1f6d1b86ba24365bae7fd86c5082317','3c92c17886944d0687e73e286cada573','0,1,74,3c92c17886944d0687e73e286cada573,','主子表',60,'/test/testDataMain','','','1','0','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),
('ba8092291b40482db8fe7fc006ea3d76','3c92c17886944d0687e73e286cada573','0,1,74,3c92c17886944d0687e73e286cada573,','单表',30,'/test/testData','','','1','0','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),
('c2e4d9082a0b4386884a0b203afe2c5c','0ca004d6b1bf4bcab9670a5060d82a55','0,1,74,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,','查看',30,'','','','0','0','test:testTree:view','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),
('d15ec45a4c5449c3bbd7a61d5f9dd1d2','b1f6d1b86ba24365bae7fd86c5082317','0,1,74,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,','编辑',60,'','','','0','0','test:testDataMain:edit','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),
('df7ce823c5b24ff9bada43d992f373e2','ba8092291b40482db8fe7fc006ea3d76','0,1,74,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,','查看',30,'','','','0','0','test:testData:view','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0');

/*Table structure for table `sys_menu_favorite` */

DROP TABLE IF EXISTS `sys_menu_favorite`;

CREATE TABLE `sys_menu_favorite` (
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `menu_id` varchar(64) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`user_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户收藏菜单';

/*Data for the table `sys_menu_favorite` */

/*Table structure for table `sys_office` */

DROP TABLE IF EXISTS `sys_office`;

CREATE TABLE `sys_office` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '机构名称',
  `abbreviation` varchar(100) DEFAULT NULL COMMENT '机构简称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) NOT NULL COMMENT '归属区域',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) NOT NULL COMMENT '机构类型',
  `grade` char(1) NOT NULL COMMENT '机构等级',
  `USEABLE` varchar(64) DEFAULT NULL COMMENT '是否启用',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) DEFAULT NULL COMMENT '传真',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `master` varchar(100) DEFAULT NULL COMMENT '负责人',
  `master_phone` varchar(200) DEFAULT NULL COMMENT '负责人电话',
  `contact` varchar(100) DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(200) DEFAULT NULL COMMENT '联系人电话',
  `PRIMARY_PERSON` varchar(64) DEFAULT NULL COMMENT '主负责人',
  `DEPUTY_PERSON` varchar(64) DEFAULT NULL COMMENT '副负责人',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构表';

/*Data for the table `sys_office` */

insert  into `sys_office`(`id`,`parent_id`,`parent_ids`,`name`,`abbreviation`,`sort`,`area_id`,`code`,`type`,`grade`,`USEABLE`,`remarks`,`address`,`zip_code`,`phone`,`fax`,`email`,`master`,`master_phone`,`contact`,`contact_phone`,`PRIMARY_PERSON`,`DEPUTY_PERSON`,`create_by`,`create_date`,`update_by`,`update_date`,`del_flag`) values 
('1','0','0,','省总公司',NULL,10,'6613a5ca7b7b4354959a4d98a85662ad','100000','1','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-04-26 08:00:00','1','2017-04-26 08:00:00','0'),
('10','7','0,1,7,','市场部',NULL,30,'c4852ba1d5ce42aab5654aae195b6e4a','200003','2','2','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-04-26 08:00:00','1','2017-04-26 08:00:00','0'),
('11','7','0,1,7,','技术部',NULL,40,'c4852ba1d5ce42aab5654aae195b6e4a','200004','2','2','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-04-26 08:00:00','1','2017-04-26 08:00:00','0'),
('12','7','0,1,7,','中山区分公司',NULL,0,'28649e5559374da9a8e7b374d49a4ebe','201000','1','3','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-04-26 08:00:00','1','2017-04-26 08:00:00','0'),
('13','12','0,1,7,12,','公司领导',NULL,10,'28649e5559374da9a8e7b374d49a4ebe','201001','2','3','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-04-26 08:00:00','1','2017-04-26 08:00:00','0'),
('14','12','0,1,7,12,','综合部',NULL,20,'28649e5559374da9a8e7b374d49a4ebe','201002','2','3','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-04-26 08:00:00','1','2017-04-26 08:00:00','0'),
('15','12','0,1,7,12,','市场部',NULL,30,'28649e5559374da9a8e7b374d49a4ebe','201003','2','3','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-04-26 08:00:00','1','2017-04-26 08:00:00','0'),
('16','12','0,1,7,12,','技术部',NULL,40,'28649e5559374da9a8e7b374d49a4ebe','201004','2','3','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-04-26 08:00:00','1','2017-04-26 08:00:00','0'),
('17','7','0,1,7,','西岗区分公司',NULL,40,'7be9efb51c52478dbc893707fbeff470','201010','1','3','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-04-26 08:00:00','1','2017-04-26 08:00:00','0'),
('18','17','0,1,7,17,','公司领导',NULL,10,'7be9efb51c52478dbc893707fbeff470','201011','2','3','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-04-26 08:00:00','1','2017-04-26 08:00:00','0'),
('19','17','0,1,7,17,','综合部',NULL,20,'7be9efb51c52478dbc893707fbeff470','201012','2','3','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-04-26 08:00:00','1','2017-04-26 08:00:00','0'),
('2','1','0,1,','公司领导',NULL,10,'6613a5ca7b7b4354959a4d98a85662ad','100001','2','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-04-26 08:00:00','1','2017-04-26 08:00:00','0'),
('20','17','0,1,7,17,','市场部',NULL,30,'7be9efb51c52478dbc893707fbeff470','201013','2','3','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-04-26 08:00:00','1','2017-04-26 08:00:00','0'),
('21','17','0,1,7,17,','技术部',NULL,40,'7be9efb51c52478dbc893707fbeff470','201014','2','3','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-04-26 08:00:00','1','2017-04-26 08:00:00','0'),
('22','7','0,1,7,','沙河口区分公司',NULL,50,'fff33f88f69f490e9aa31680d42e3026','201010','1','3','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-04-26 08:00:00','1','2017-04-26 08:00:00','0'),
('23','22','0,1,7,22,','公司领导',NULL,10,'fff33f88f69f490e9aa31680d42e3026','201011','2','3','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-04-26 08:00:00','1','2017-04-26 08:00:00','0'),
('24','22','0,1,7,22,','综合部',NULL,20,'fff33f88f69f490e9aa31680d42e3026','201012','2','3','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-04-26 08:00:00','1','2017-04-26 08:00:00','0'),
('25','22','0,1,7,22,','市场部',NULL,30,'fff33f88f69f490e9aa31680d42e3026','201013','2','3','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-04-26 08:00:00','1','2017-04-26 08:00:00','0'),
('26','22','0,1,7,22,','技术部',NULL,40,'fff33f88f69f490e9aa31680d42e3026','201014','2','3','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-04-26 08:00:00','1','2017-04-26 08:00:00','0'),
('3','1','0,1,','综合部',NULL,20,'6613a5ca7b7b4354959a4d98a85662ad','100002','2','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-04-26 08:00:00','1','2017-04-26 08:00:00','0'),
('4','1','0,1,','市场部',NULL,30,'6613a5ca7b7b4354959a4d98a85662ad','100003','2','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-04-26 08:00:00','1','2017-04-26 08:00:00','0'),
('5','1','0,1,','技术部',NULL,40,'6613a5ca7b7b4354959a4d98a85662ad','100004','2','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-04-26 08:00:00','1','2017-04-26 08:00:00','0'),
('6','1','0,1,','研发部',NULL,50,'6613a5ca7b7b4354959a4d98a85662ad','100005','2','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-04-26 08:00:00','1','2017-04-26 08:00:00','0'),
('7','1','0,1,','大连市分公司',NULL,20,'c4852ba1d5ce42aab5654aae195b6e4a','200000','1','2','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-04-26 08:00:00','1','2017-04-26 08:00:00','0'),
('8','7','0,1,7,','公司领导',NULL,10,'c4852ba1d5ce42aab5654aae195b6e4a','200001','2','2','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-04-26 08:00:00','1','2017-04-26 08:00:00','0'),
('9','7','0,1,7,','综合部',NULL,20,'c4852ba1d5ce42aab5654aae195b6e4a','200002','2','2','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-04-26 08:00:00','1','2017-04-26 08:00:00','0');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `enname` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) DEFAULT NULL COMMENT '角色类型',
  `data_scope` char(1) DEFAULT NULL COMMENT '数据范围',
  `is_sys` varchar(64) DEFAULT NULL COMMENT '是否系统数据',
  `useable` varchar(64) DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`office_id`,`name`,`enname`,`role_type`,`data_scope`,`is_sys`,`useable`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('1','1','系统管理员','dept','assignment','1',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('2','1','公司管理员','hr','assignment','2',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('3','1','本公司管理员','a','assignment','3',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('4','1','部门管理员','b','assignment','4',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('5','1','本部门管理员','c','assignment','5',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('6','1','普通用户','d','assignment','8',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('7','7','济南市管理员','e','assignment','9',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values 
('1','1'),
('1','10'),
('1','11'),
('1','12'),
('1','13'),
('1','14'),
('1','15'),
('1','16'),
('1','17'),
('1','18'),
('1','19'),
('1','2'),
('1','20'),
('1','21'),
('1','22'),
('1','23'),
('1','24'),
('1','25'),
('1','26'),
('1','27'),
('1','28'),
('1','29'),
('1','3'),
('1','30'),
('1','31'),
('1','32'),
('1','33'),
('1','34'),
('1','35'),
('1','36'),
('1','37'),
('1','38'),
('1','39'),
('1','4'),
('1','40'),
('1','41'),
('1','42'),
('1','43'),
('1','44'),
('1','45'),
('1','46'),
('1','47'),
('1','48'),
('1','49'),
('1','5'),
('1','50'),
('1','51'),
('1','52'),
('1','53'),
('1','54'),
('1','55'),
('1','56'),
('1','57'),
('1','58'),
('1','59'),
('1','6'),
('1','60'),
('1','61'),
('1','62'),
('1','63'),
('1','64'),
('1','65'),
('1','66'),
('1','67'),
('1','68'),
('1','69'),
('1','7'),
('1','70'),
('1','71'),
('1','72'),
('1','73'),
('1','74'),
('1','75'),
('1','76'),
('1','77'),
('1','78'),
('1','79'),
('1','8'),
('1','80'),
('1','81'),
('1','82'),
('1','83'),
('1','84'),
('1','85'),
('1','86'),
('1','87'),
('1','88'),
('1','89'),
('1','9'),
('1','90'),
('2','1'),
('2','10'),
('2','11'),
('2','12'),
('2','13'),
('2','14'),
('2','15'),
('2','16'),
('2','17'),
('2','18'),
('2','19'),
('2','2'),
('2','20'),
('2','21'),
('2','22'),
('2','23'),
('2','24'),
('2','25'),
('2','26'),
('2','27'),
('2','28'),
('2','29'),
('2','3'),
('2','30'),
('2','31'),
('2','32'),
('2','33'),
('2','34'),
('2','35'),
('2','36'),
('2','37'),
('2','38'),
('2','39'),
('2','4'),
('2','40'),
('2','41'),
('2','42'),
('2','43'),
('2','44'),
('2','45'),
('2','46'),
('2','47'),
('2','48'),
('2','49'),
('2','5'),
('2','50'),
('2','51'),
('2','52'),
('2','53'),
('2','54'),
('2','55'),
('2','56'),
('2','57'),
('2','58'),
('2','59'),
('2','6'),
('2','60'),
('2','61'),
('2','62'),
('2','63'),
('2','64'),
('2','65'),
('2','66'),
('2','67'),
('2','68'),
('2','69'),
('2','7'),
('2','70'),
('2','71'),
('2','72'),
('2','73'),
('2','74'),
('2','75'),
('2','76'),
('2','77'),
('2','78'),
('2','79'),
('2','8'),
('2','80'),
('2','81'),
('2','82'),
('2','83'),
('2','84'),
('2','85'),
('2','86'),
('2','87'),
('2','88'),
('2','89'),
('2','9'),
('2','90'),
('3','1'),
('3','10'),
('3','11'),
('3','12'),
('3','13'),
('3','14'),
('3','15'),
('3','16'),
('3','17'),
('3','18'),
('3','19'),
('3','2'),
('3','20'),
('3','21'),
('3','22'),
('3','23'),
('3','24'),
('3','25'),
('3','26'),
('3','27'),
('3','28'),
('3','29'),
('3','3'),
('3','30'),
('3','31'),
('3','32'),
('3','33'),
('3','34'),
('3','35'),
('3','36'),
('3','37'),
('3','38'),
('3','39'),
('3','4'),
('3','40'),
('3','41'),
('3','42'),
('3','43'),
('3','44'),
('3','45'),
('3','46'),
('3','47'),
('3','48'),
('3','49'),
('3','5'),
('3','50'),
('3','51'),
('3','52'),
('3','53'),
('3','54'),
('3','55'),
('3','56'),
('3','57'),
('3','58'),
('3','59'),
('3','6'),
('3','60'),
('3','61'),
('3','62'),
('3','63'),
('3','64'),
('3','65'),
('3','66'),
('3','67'),
('3','68'),
('3','69'),
('3','7'),
('3','70'),
('3','71'),
('3','72'),
('3','73'),
('3','74'),
('3','75'),
('3','76'),
('3','77'),
('3','78'),
('3','79'),
('3','8'),
('3','80'),
('3','81'),
('3','82'),
('3','83'),
('3','84'),
('3','85'),
('3','86'),
('3','87'),
('3','88'),
('3','89'),
('3','9'),
('3','90');

/*Table structure for table `sys_role_office` */

DROP TABLE IF EXISTS `sys_role_office`;

CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-机构';

/*Data for the table `sys_role_office` */

insert  into `sys_role_office`(`role_id`,`office_id`) values 
('7','10'),
('7','11'),
('7','12'),
('7','13'),
('7','14'),
('7','15'),
('7','16'),
('7','17'),
('7','18'),
('7','19'),
('7','20'),
('7','21'),
('7','22'),
('7','23'),
('7','24'),
('7','25'),
('7','26'),
('7','7'),
('7','8'),
('7','9');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `company_id` varchar(64) NOT NULL COMMENT '归属公司',
  `office_id` varchar(64) NOT NULL COMMENT '归属部门',
  `login_name` varchar(100) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `no` varchar(100) DEFAULT NULL COMMENT '工号',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `user_type` char(1) DEFAULT NULL COMMENT '用户类型',
  `photo` varchar(1000) DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`company_id`,`office_id`,`login_name`,`password`,`no`,`name`,`email`,`phone`,`mobile`,`user_type`,`photo`,`login_ip`,`login_date`,`login_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
('1','1','2','admin','0742c4396c6c660746cbe0932ebc67784ef364317f06eca9024fa709','0001','系统管理员','taurusx@163.com','8675','8675',NULL,NULL,'0:0:0:0:0:0:0:1','2017-05-23 14:13:20','1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00','最高管理员','0'),
('10','7','11','jn_jsb','0742c4396c6c660746cbe0932ebc67784ef364317f06eca9024fa709','0010','济南技术部',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('11','12','13','lc_admin','0742c4396c6c660746cbe0932ebc67784ef364317f06eca9024fa709','0011','济南历城领导',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('12','12','18','lx_admin','0742c4396c6c660746cbe0932ebc67784ef364317f06eca9024fa709','0012','济南历下领导',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('13','22','23','gx_admin','0742c4396c6c660746cbe0932ebc67784ef364317f06eca9024fa709','0013','济南高新领导',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('2','1','2','sd_admin','0742c4396c6c660746cbe0932ebc67784ef364317f06eca9024fa709','0002','管理员',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('3','1','3','sd_zhb','0742c4396c6c660746cbe0932ebc67784ef364317f06eca9024fa709','0003','综合部',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('4','1','4','sd_scb','0742c4396c6c660746cbe0932ebc67784ef364317f06eca9024fa709','0004','市场部',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('5','1','5','sd_jsb','0742c4396c6c660746cbe0932ebc67784ef364317f06eca9024fa709','0005','技术部',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('6','1','6','sd_yfb','0742c4396c6c660746cbe0932ebc67784ef364317f06eca9024fa709','0006','研发部',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('7','7','8','jn_admin','0742c4396c6c660746cbe0932ebc67784ef364317f06eca9024fa709','0007','济南领导',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('8','7','9','jn_zhb','0742c4396c6c660746cbe0932ebc67784ef364317f06eca9024fa709','0008','济南综合部',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
('9','7','10','jn_scb','0742c4396c6c660746cbe0932ebc67784ef364317f06eca9024fa709','0009','济南市场部',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values 
('1','1'),
('1','2'),
('10','2'),
('11','3'),
('12','4'),
('13','5'),
('14','6'),
('2','1'),
('3','2'),
('4','3'),
('5','4'),
('6','5'),
('7','2'),
('7','7'),
('8','2'),
('9','1');

/*Table structure for table `test_data` */

DROP TABLE IF EXISTS `test_data`;

CREATE TABLE `test_data` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `user_id` varchar(64) DEFAULT NULL COMMENT '归属用户',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属部门',
  `area_id` varchar(64) DEFAULT NULL COMMENT '归属区域',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `in_date` date DEFAULT NULL COMMENT '加入日期',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务数据表';

/*Data for the table `test_data` */

/*Table structure for table `test_data_child` */

DROP TABLE IF EXISTS `test_data_child`;

CREATE TABLE `test_data_child` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `test_data_main_id` varchar(64) DEFAULT NULL COMMENT '业务主表ID',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_child_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务数据子表';

/*Data for the table `test_data_child` */

/*Table structure for table `test_data_main` */

DROP TABLE IF EXISTS `test_data_main`;

CREATE TABLE `test_data_main` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `user_id` varchar(64) DEFAULT NULL COMMENT '归属用户',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属部门',
  `area_id` varchar(64) DEFAULT NULL COMMENT '归属区域',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `in_date` date DEFAULT NULL COMMENT '加入日期',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_main_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务数据表';

/*Data for the table `test_data_main` */

/*Table structure for table `test_tree` */

DROP TABLE IF EXISTS `test_tree`;

CREATE TABLE `test_tree` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_tree_del_flag` (`del_flag`),
  KEY `test_data_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='树结构表';

/*Data for the table `test_tree` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
