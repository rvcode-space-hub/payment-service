-- MySQL dump 10.13  Distrib 5.7.21, for Win32 (AMD64)
--
-- Host: localhost    Database: itncash_v5
-- ------------------------------------------------------
-- Server version	5.7.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sys_service_types`
--

DROP TABLE IF EXISTS `sys_service_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_service_types` (
  `service_type` varchar(20) NOT NULL,
  `service_name` varchar(100) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  `is_financial` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`service_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_service_types`
--

LOCK TABLES `sys_service_types` WRITE;
/*!40000 ALTER TABLE `sys_service_types` DISABLE KEYS */;
INSERT INTO `sys_service_types` VALUES ('ASSOCREGSTFEE','Associate Registration Fee','Y','Y'),('CHBLENQ','Balance Enquiry','Y','N'),('CHCNGPASSWD','Change Password','Y','N'),('CHCNGPIN','Change PIN','Y','N'),('CHFTFRCONF','Channel Fund Transfer Confirm','Y','Y'),('CHFTFRREQ','Channel Request Funds','Y','N'),('CHGENREIMB','Reimbursement','Y','N'),('CHLOGIN','Login','Y','N'),('CHLSTNSBTXNS','Channel Get Subs Last N Txns','Y','N'),('CHLSTNTXNS','Channel Last N Txns','Y','N'),('CHMERPYCONF','Merchant Payment Confirm','Y','Y'),('CHMERPYINIT','Merchant Payment Initiate','Y','Y'),('CHPOSTPAID','Postpaid payments','Y','Y'),('CHREGDBANKS','Channel Get Parent Bank','Y','N'),('CHRTLRPRFL','Channel View Profile','Y','N'),('CHSNDMNYP2R','Direct Fund Transfer','Y','Y'),('CHSNDMNYR2R','Send Money to Retailer','Y','Y'),('CHTOPUP','Prepaid Recharge','Y','Y'),('CHVWTXS','Channel View Taxes','Y','N'),('DMTCASHBACK','Domestic Money Transfer Cashback','Y','N'),('DMTRTVERFEE','DMT Account Verification','Y','Y'),('DMTTXNREQ','Domestic Money Transfer','N','N'),('FEEDBACK','Feedback Request','Y','N'),('HELPDESK','Helpdesk Request','Y','N'),('RETREGSTFEE','Retailer Registration Fee','Y','Y'),('SMSBANKDTLS','SMS Parent Bank Details','Y','N'),('STKCREATE','Stock Creation','Y','Y'),('STKDELETE','Stock Deletion','Y','Y'),('TXNENQ','Transaction Enquiry','Y','N'),('TXNREVERSAL','Transaction Reversal','Y','Y'),('UTILBILLPAY','Bill Payment','Y','Y'),('VWBANKDTLS','View Parent Bank Details','Y','N');
/*!40000 ALTER TABLE `sys_service_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itn_product_profile`
--

DROP TABLE IF EXISTS `itn_product_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itn_product_profile` (
  `productId` varchar(20) NOT NULL DEFAULT '',
  `product_type` varchar(20) NOT NULL DEFAULT '',
  `service_provider` varchar(75) NOT NULL DEFAULT '',
  `recharge_type` varchar(50) NOT NULL DEFAULT '',
  `product_code` varchar(50) NOT NULL DEFAULT '',
  `api` varchar(20) NOT NULL DEFAULT '',
  `marginType` varchar(20) DEFAULT NULL,
  `margin` bigint(19) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `modifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_type`,`service_provider`,`recharge_type`,`product_code`,`api`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itn_product_profile`
--

LOCK TABLES `itn_product_profile` WRITE;
/*!40000 ALTER TABLE `itn_product_profile` DISABLE KEYS */;
INSERT INTO `itn_product_profile` VALUES 
('PR9091151130142912','MOBILE','AIRTEL','PREPAID','','SMSDAAK','Percentage',4000000,'Y','2017-11-19 04:16:20'),
('PR4486151130142641','MOBILE','VI','PREPAID','','SMSDAAK','Percentage',400000,'Y','2017-04-25 07:55:40');
/*!40000 ALTER TABLE `itn_product_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itn_channel_users`
--

DROP TABLE IF EXISTS `itn_channel_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itn_channel_users` (
  `user_id` varchar(20) NOT NULL DEFAULT '',
  `user_name` varchar(50) DEFAULT NULL,
  `password` varchar(300) DEFAULT NULL,
  `txn_pin` varchar(200) DEFAULT NULL,
  `invalid_pin_count` tinyint(1) DEFAULT NULL,
  `invalid_password_count` tinyint(1) DEFAULT NULL,
  `category_code` varchar(10) DEFAULT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `msisdn` varchar(10) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `firm_name` varchar(50) DEFAULT NULL,
  `alter_msisdn` varchar(50) DEFAULT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `district` varchar(20) DEFAULT NULL,
  `address` text,
  `pan` varchar(50) DEFAULT NULL,
  `pincode` varchar(20) DEFAULT NULL,
  `parent_id` varchar(50) DEFAULT NULL,
  `owner_id` varchar(20) DEFAULT NULL,
  `thres_profile_id` varchar(20) DEFAULT NULL,
  `join_date` datetime DEFAULT NULL,
  `deleted_on` datetime DEFAULT NULL,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `suspension_reason` varchar(50) DEFAULT NULL,
  `last_login_on` timestamp NULL DEFAULT NULL,
  `first_login` varchar(2) DEFAULT NULL,
  `suspend_reason` text,
  `manager` varchar(20) DEFAULT NULL,
  `otp_status` varchar(2) DEFAULT NULL,
  `dmt_type` varchar(20) DEFAULT NULL,
  `pan_file_path` varchar(500) DEFAULT NULL,
  `aadhar_file_path` varchar(500) DEFAULT NULL,
  `gst_number` varchar(50) DEFAULT NULL,
  `aadhaar` varchar(50) DEFAULT NULL,
  `incometax_proof_name` varchar(15) DEFAULT NULL,
  `incometax_proof_id` varchar(30) DEFAULT NULL,
  `incometax_proof_file` varchar(150) DEFAULT NULL,
  `servicetax_proof_name` varchar(15) DEFAULT NULL,
  `servicetax_proof_id` varchar(30) DEFAULT NULL,
  `servicetax_proof_file` varchar(150) DEFAULT NULL,
  `id_proof_name` varchar(15) DEFAULT NULL,
  `id_proof_id` varchar(30) DEFAULT NULL,
  `id_proof_file` varchar(150) DEFAULT NULL,
  `address_proof_name` varchar(15) DEFAULT NULL,
  `address_proof_id` varchar(30) DEFAULT NULL,
  `address_proof_file` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itn_channel_users`
--

LOCK TABLES `itn_channel_users` WRITE;
/*!40000 ALTER TABLE `itn_channel_users` DISABLE KEYS */;
INSERT INTO `itn_channel_users` VALUES 
('UT001','opadmin','UEA1NU0zQDgxNzMjRjFuQG5jM0BkbTFu','MjQ2OA==',NULL,NULL,'ADMN','CHANNEL','ITN','Cash',NULL,'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'110052',NULL,NULL,NULL,NULL,NULL,'2018-02-09 05:57:17',NULL,'2015-10-13 03:01:25',NULL,NULL,NULL,'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('UT1005180216124944','1234567890','NzM4NjUxNDI=','MTI2NA==',0,0,'RTLR','CHANNEL','Yatin','Gaba','1234567890','Y','Vandana Communication','','','Rohini','Delhi',NULL,'YP-3c',NULL,'110034','UT3635180119131253','UT3635180119131253','TP3889151009162644','2018-02-16 12:49:44',NULL,'2018-02-16 07:19:44',NULL,'2018-02-16 07:20:21',NULL,NULL,NULL,'N',NULL,NULL,NULL,NULL,NULL,'PAN','BNMPG0426L','','GST','00','',NULL,NULL,NULL,'Aadhaar','362118327512',''),
('UT1005180219102010','9876543210','YXlhYW5AMTIz','NDMyMQ==',0,0,'RTLR','CHANNEL','SAJID','HUSSAIN','9876543210','Y','SAJID WATCH & COMMUNICATION','9876543210','sajiddkhan246@gmail.com','New Delhi','Delhi',NULL,'A 81 Prem Vihar Gali no 16 Nangli Dairy Najafgarh',NULL,'110043','UT6417180213160905','UT6417180213160905','TP3889151009162644','2018-02-19 10:20:10',NULL,'2018-02-19 04:56:26',NULL,'2018-02-28 14:02:51',NULL,NULL,NULL,'N',NULL,NULL,NULL,NULL,NULL,'PAN','ADZPH8680B','','GST','00','',NULL,NULL,NULL,'Aadhaar','986037457360','');
/*!40000 ALTER TABLE `itn_channel_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itn_default_threshold`
--

DROP TABLE IF EXISTS `itn_default_threshold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itn_default_threshold` (
  `set_default_id` varchar(20) NOT NULL DEFAULT '',
  `thres_profile_id` varchar(20) DEFAULT NULL,
  `threshold_name` varchar(20) DEFAULT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  `category_code` varchar(20) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`set_default_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itn_default_threshold`
--

LOCK TABLES `itn_default_threshold` WRITE;
/*!40000 ALTER TABLE `itn_default_threshold` DISABLE KEYS */;
INSERT INTO `itn_default_threshold` VALUES ('SD1655151016115957','TP4502151016115646','SilverAssociate','CHANNEL','ASSOC','Y'),('SD27151010150554','TP3889151009162644','Gold','CHANNEL','RTLR','Y');
/*!40000 ALTER TABLE `itn_default_threshold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itn_network`
--

DROP TABLE IF EXISTS `itn_network`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itn_network` (
  `network_code` varchar(20) NOT NULL,
  `status` varchar(2) DEFAULT NULL,
  `remarks` text,
  `requested_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`network_code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itn_network`
--

LOCK TABLES `itn_network` WRITE;
/*!40000 ALTER TABLE `itn_network` DISABLE KEYS */;
INSERT INTO `itn_network` VALUES ('ITNCash01','Y','','2018-02-25 06:54:54'),('EZYPAY','Y','','2018-02-26 05:58:25'),('SMSDAAK','Y','','2018-02-26 05:58:37'),('EKO','Y','','2018-02-26 06:28:24'),('EZYMONEY','S','on','2018-02-26 06:03:19');
/*!40000 ALTER TABLE `itn_network` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itn_thresholds_profiles`
--

DROP TABLE IF EXISTS `itn_thresholds_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itn_thresholds_profiles` (
  `thres_profile_id` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(20) DEFAULT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`thres_profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itn_thresholds_profiles`
--

LOCK TABLES `itn_thresholds_profiles` WRITE;
/*!40000 ALTER TABLE `itn_thresholds_profiles` DISABLE KEYS */;
INSERT INTO `itn_thresholds_profiles` VALUES ('TP5530151129103433','Gold','SUBSCRIBER','Y'),('TP8532151129102455','Gold','CHANNEL','Y');
/*!40000 ALTER TABLE `itn_thresholds_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itn_thresholds_profile_dtls`
--

DROP TABLE IF EXISTS `itn_thresholds_profile_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itn_thresholds_profile_dtls` (
  `thres_profile_dtls_id` varchar(20) NOT NULL DEFAULT '',
  `thres_profile_id` varchar(20) DEFAULT NULL,
  `group_id` varchar(20) DEFAULT NULL,
  `payer_count` bigint(10) DEFAULT NULL,
  `payer_amt` bigint(19) DEFAULT NULL,
  `payee_count` bigint(10) DEFAULT NULL,
  `payee_amt` bigint(19) DEFAULT NULL,
  PRIMARY KEY (`thres_profile_dtls_id`),
  UNIQUE KEY `thres_profile_group_id` (`thres_profile_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itn_thresholds_profile_dtls`
--

LOCK TABLES `itn_thresholds_profile_dtls` WRITE;
/*!40000 ALTER TABLE `itn_thresholds_profile_dtls` DISABLE KEYS */;
INSERT INTO `itn_thresholds_profile_dtls` VALUES ('TD1382151129102455','TP8532151129102455','3',500000,500000000000,500000,500000000000),('TD1428151129103433','TP5530151129103433','2',500000,500000000000,500000,500000000000),('TD1613151129103433','TP5530151129103433','1',500000,500000000000,500000,500000000000),('TD6278151129103433','TP5530151129103433','3',500000,500000000000,500000,500000000000),('TD7289151129102455','TP8532151129102455','2',500000,500000000000,500000,500000000000),('TD999151129102455','TP8532151129102455','1',500000,500000000000,500000,500000000000);
/*!40000 ALTER TABLE `itn_thresholds_profile_dtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itn_wallet`
--

DROP TABLE IF EXISTS `itn_wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itn_wallet` (
  `wallet_id` varchar(20) NOT NULL DEFAULT '',
  `user_id` varchar(20) DEFAULT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  `msisdn` varchar(15) DEFAULT NULL,
  `wallet_type` varchar(20) DEFAULT NULL,
  `prev_balance` bigint(19) DEFAULT NULL,
  `balance` bigint(19) DEFAULT NULL,
  `net_credit` bigint(19) DEFAULT NULL,
  `net_debit` bigint(19) DEFAULT NULL,
  `last_transation_type` varchar(50) DEFAULT NULL,
  `last_transation_id` varchar(20) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  `wallet_limit` bigint(19) DEFAULT NULL,
  `last_transation_on` datetime DEFAULT NULL,
  `operator_Code` varchar(100) DEFAULT NULL,
  `first_transation_on` datetime DEFAULT NULL,
  PRIMARY KEY (`wallet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itn_wallet`
--

LOCK TABLES `itn_wallet` WRITE;
/*!40000 ALTER TABLE `itn_wallet` DISABLE KEYS */;
INSERT INTO `itn_wallet` VALUES 
('10001','10001','MERCHANT',NULL,'TXN',7412240749400,7412339349400,7488517281000,76177931600,'CHTOPUP','PR1609012101B03222','Y',NULL,'2016-09-01 09:01:25','MOBILE_AIRTEL_TOPUP',NULL),
('WT999180210185833','UT3669180210185831','CHANNEL','9717662022','TXN',284010000,114010000,11000000000,10885990000,'CHPOSTPAID','PP1803041949A00058','Y',0,'2018-03-04 07:49:50',NULL,NULL);
/*!40000 ALTER TABLE `itn_wallet` ENABLE KEYS */;

DROP TABLE IF EXISTS `sys_product_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_product_profiles` (
  `product_id` varchar(20) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `service_provider` varchar(75) DEFAULT NULL,
  `recharge_type` varchar(20) DEFAULT NULL,
  `product_code` varchar(20) DEFAULT NULL,
  `api` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `image_url` text,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_product_profiles`
--

LOCK TABLES `sys_product_profiles` WRITE;
/*!40000 ALTER TABLE `sys_product_profiles` DISABLE KEYS */;
INSERT INTO `sys_product_profiles` VALUES ('10001','MOBILE','AIRTEL','TOPUP','1','EZYPAY','Y','2015-07-13 04:56:49','../logos/airtel.png'),('10002','MOBILE','AIRCEL','TOPUP','2','EZYPAY','Y','2015-07-13 04:56:49','../logos/aircel.png'),('10003','MOBILE','BSNL','TOPUP','BGP','SMSDAAK','Y','2015-07-13 04:56:49','../logos/bsnl.png'),('10004','MOBILE','BSNL','VALIDITY','3','EZYPAY','Y','2015-07-13 04:56:49','../logos/bsnl.png'),('10005','MOBILE','LOOP MOBILE','TOPUP','23','EZYPAY','Y','2015-07-13 04:56:49','../logos/loop.png'),('10006','MOBILE','DOCOMO','TOPUP','15','EZYPAY','Y','2015-07-13 04:56:49','../logos/docomo.png'),('10007','MOBILE','DOCOMO','SPECIAL','16','EZYPAY','Y','2015-07-13 04:56:49','../logos/docomo.png'),('10008','MOBILE','IDEA','TOPUP','IDP','SMSDAAK','Y','2015-07-13 04:56:49','../logos/idea.png'),('10009','MOBILE','MTS','TOPUP','14','EZYPAY','Y','2015-07-13 04:56:49','../logos/mts.png'),('10010','MOBILE','MTNL DEL','TOPUP','MMP','SMSDAAK','Y','2015-07-13 04:56:49','../logos/mtnl_del.png'),('10011','MOBILE','MTNL DEL','SPECIAL','MSP','SMSDAAK','Y','2015-07-13 04:56:49','../logos/mtnl_del.png'),('10012','MOBILE','MTNL MUM','TOPUP','MMP','SMSDAAK','Y','2015-07-13 04:56:49','../logos/mtnl_mum.png'),('10013','MOBILE','MTNL MUM','SPECIAL','MSP','SMSDAAK','Y','2015-07-13 04:56:49','../logos/mtnl_mum.png'),('10014','MOBILE','TATA INDICOM','TOPUP','17','EZYPAY','Y','2015-07-13 04:56:49','../logos/tata-indicom.png'),('10015','MOBILE','T24','TOPUP','42','EZYPAY','Y','2015-07-13 04:56:49','../logos/t24.png'),('10016','MOBILE','T24','SPECIAL','43','EZYPAY','Y','2015-07-13 04:56:49','../logos/t24.png'),('10017','MOBILE','REL GSM','TOPUP','18','EZYPAY','Y','2015-07-13 04:56:49','../logos/reliance_gsm.png'),('10018','MOBILE','REL CDMA','TOPUP','19','EZYPAY','Y','2015-07-13 04:56:49','../logos/reliance_cdma.png'),('10019','MOBILE','UNINOR','TOPUP','6','EZYPAY','Y','2015-07-13 04:56:49','../logos/uninor.png'),('10020','MOBILE','UNINOR','SPECIAL','5','EZYPAY','Y','2015-07-13 04:56:49','../logos/uninor.png'),('10021','MOBILE','VODAFONE','TOPUP','VFP','SMSDAAK','Y','2015-07-13 04:56:49','../logos/vodafone.png'),('10022','MOBILE','VIDEOCON','TOPUP','21','EZYPAY','Y','2015-07-13 04:56:49','../logos/videocon.png'),('10023','MOBILE','VIDEOCON','SPECIAL','22','EZYPAY','Y','2015-07-13 04:56:49','../logos/videocon.png'),('10024','DTH','BIG TV','TOPUP','20','EZYPAY','Y','2015-07-13 04:56:49','../logos/bigtv.png'),('10025','DTH','DISH TV','TOPUP','7','EZYPAY','Y','2015-07-13 04:56:49','../logos/distv.png'),('10026','DTH','SUN DIRECT','TOPUP','STV','SMSDAAK','Y','2015-07-13 04:56:49','../logos/sun_direct.png'),('10027','DTH','TATA SKY','TOPUP','TTV','SMSDAAK','Y','2015-07-13 04:56:49','../logos/tata_sky.png'),('10028','DTH','VIDEOCON','TOPUP','13','EZYPAY','Y','2015-07-13 04:56:49','../logos/videocon.png'),('10029','DTH','AIRTEL','TOPUP','10','EZYPAY','Y','2015-07-13 04:56:49','../logos/airtel.png'),('10030','MOBILE','AIRTEL','POSTPAID','32','EZYPAY','Y','2015-07-13 04:56:49','../logos/airtel.png'),('10031','LANDLINE','AIRTEL','POSTPAID','ATL','SMSDAAK','Y','2015-07-13 04:56:49','../logos/airtel.png'),('10032','MOBILE','BSNL','POSTPAID','BGC','SMSDAAK','Y','2015-07-13 04:56:49','../logos/bsnl.png'),('10033','MOBILE','DOCOMO','POSTPAID','52','EZYPAY','Y','2015-07-13 04:56:49','../logos/docomo.png'),('10034','MOBILE','IDEA','POSTPAID','IDC','SMSDAAK','Y','2015-07-13 04:56:49','../logos/idea.png'),('10035','LANDLINE','MTNL DEL','POSTPAID','MDL','SMSDAAK','Y','2015-07-13 04:56:49','../logos/mtnl_del.png'),('10036','MOBILE','RELIANCE','POSTPAID','47','EZYPAY','N','2015-07-13 04:56:49','../logos/reliance_gsm.png'),('10037','LANDLINE','RELIANCE','POSTPAID','49','EZYPAY','Y','2015-07-13 04:56:49','../logos/reliance_gsm.png'),('10038','MOBILE','LOOP MOBILE','POSTPAID','50','EZYPAY','Y','2015-07-13 04:56:49','../logos/loop.png'),('10039','MOBILE','TATA INDICOM','POSTPAID','53','EZYPAY','Y','2015-07-13 04:56:49','../logos/tata-indicom.png'),('10040','MOBILE','VODAFONE','POSTPAID','VFC','SMSDAAK','Y','2015-07-13 04:56:49','../logos/vodafone.png'),('10041','LANDLINE','BSNL','POSTPAID','56','EZYPAY','Y','2015-07-13 04:56:49','../logos/bsnl.png'),('10042','DATA CARD','AIRTEL','TOPUP','1','EZYPAY','Y','2015-08-19 00:00:00','../logos/airtel.png'),('10043','DATA CARD','BSNL','TOPUP','3','EZYPAY','Y','2015-08-19 00:00:00','../logos/bsnl.png'),('10044','DATA CARD','MTNL DEL','TOPUP','40','EZYPAY','Y','2015-08-19 00:00:00','../logos/mtnl_del.png'),('10045','DATA CARD','MTNL MUM','TOPUP','44','EZYPAY','Y','2015-08-19 00:00:00','../logos/mtnl_mum.png'),('10046','DATA CARD','RELIANCE NET CONNECT PLUS','TOPUP','19','EZYPAY','Y','2015-08-19 00:00:00','../logos/reliance_netconnect.png'),('10048','DATA CARD','TATA PHOTON WHIZ','TOPUP','17','EZYPAY','Y','2015-08-19 00:00:00','../logos/tata-photo-wiz.png'),('10049','DATA CARD','VODAFONE','TOPUP','12','EZYPAY','Y','2015-08-19 00:00:00','../logos/vodafone.png'),('10050','GAS','MAHANAGAR GAS','POSTPAID','MMG','SMSDAAK','Y','2015-08-28 00:00:00','../logos/mahanagar_gas.png'),('10051','GAS','INDRAPRASTHA GAS','POSTPAID','IPG','SMSDAAK','Y','2015-08-28 00:00:00','../logos/igl.png'),('10052','ELECTRICITY','RELIANCE ENERGY MUMBAI','POSTPAID','REE','SMSDAAK','Y','2015-08-28 00:00:00','../logos/reliance_energy_mum.png'),('10053','ELECTRICITY','BSES RAJDHANI DELHI','POSTPAID','BRE','SMSDAAK','Y','2015-08-28 00:00:00','../logos/bses_rajdhani.png'),('10054','ELECTRICITY','BSES YAMUNA DELHI','POSTPAID','BYE','SMSDAAK','Y','2015-08-28 00:00:00','../logos/bses_yamuna.png'),('10055','ELECTRICITY','TATA POWER DELHI','POSTPAID','NDE','SMSDAAK','Y','2015-08-28 00:00:00','../logos/tata_power.png'),('10056','ISPPOSTPAID','TIKONA','POSTPAID','TDB','SMSDAAK','Y','2015-08-28 00:00:00','../logos/tikona.png'),('10057','MOBILE','MTS','POSTPAID','57','EZYPAY','Y','2015-07-13 04:56:49','../logos/mts.png'),('10059','DATA CARD','IDEA','TOPUP','34','EZYPAY','Y','2015-12-02 00:00:00','../logos/idea.png'),('10060','DATA CARD','MTS','TOPUP','14','EZYPAY','Y','2015-12-02 00:00:00','../logos/mts.png'),('10061','DATA CARD','AIRTEL','POSTPAID','32','EZYPAY','Y','2015-12-02 00:00:00','../logos/airtel.png'),('10062','DATA CARD','BSNL','POSTPAID','31','EZYPAY','Y','2015-12-02 00:00:00','../logos/bsnl.png'),('10063','DATA CARD','RELIANCE','POSTPAID','47','EZYPAY','Y','2015-12-02 00:00:00','../logos/reliance_gsm.png'),('10064','DATA CARD','TATA INDICOM','POSTPAID','53','EZYPAY','Y','2015-12-02 00:00:00','../logos/tata-indicom.png'),('10065','DATA CARD','VODAFONE','POSTPAID','35','EZYPAY','Y','2015-12-02 00:00:00','../logos/vodafone.png'),('10066','DATA CARD','IDEA','POSTPAID','33','EZYPAY','Y','2015-12-02 00:00:00','../logos/idea.png'),('10067','DATA CARD','MTS','POSTPAID','57','EZYPAY','Y','2015-12-02 00:00:00','../logos/mts.png'),('10068','DATA CARD','DOCOMO','POSTPAID','52','EZYPAY','Y','2015-12-02 04:56:49','../logos/docomo.png'),('10069','DATA CARD','AIRCEL','TOPUP','2','EZYPAY','Y','2015-12-02 04:56:49','../logos/aircel.png'),('10070','DATA CARD','LOOP MOBILE','POSTPAID','54','EZYPAY','Y','2015-12-02 04:56:49','../logos/loob.png'),('10072','MOBILE','AIRCEL','POSTPAID','ACC','SMSDAAK','Y','2016-01-06 16:03:52','../logos/aircel.png'),('10073','MOBILE','BPL','TOPUP','23','EZYPAY','N','2016-01-21 00:00:00','../logos/bpl.png'),('10075','DATA CARD','TATA PHOTON PLUS','TOPUP','17','EZYPAY','Y','2016-01-22 00:00:00','../logos/tata_photon_plus.png'),('10090','MOBILE','REL GSM','POSTPAID','47','EZYPAY','Y','2016-01-06 16:03:52','../logos/reliance_gsm.png'),('10091','MOBILE','REL CDMA','POSTPAID','47','EZYPAY','Y','2016-01-06 16:03:52','../logos/reliance_cdma.png'),('10093','LANDLINE','TATA INDICOM','POSTPAID','60','EZYPAY','Y','2016-02-11 10:09:16','../logos/tata-indicom.png'),('10094','ELECTRICITY','DHBVN - HARYANA','POSTPAID','DHE','SMSDAAK','Y','2016-03-18 20:46:43','../logos/dhbvn-haryana.png'),('10095','ELECTRICITY','NOIDA POWER','POSTPAID','NUE','SMSDAAK','Y','2016-03-18 20:46:43','../logos/noida-power.png'),('10096','MOBILE','AIRCEL','TOPUP','ACP','SMSDAAK','Y','2015-07-13 04:56:49','../logos/aircel.png'),('10097','MOBILE','AIRTEL','TOPUP','ATP','SMSDAAK','Y','2015-07-13 04:56:49','../logos/airtel.png'),('10098','MOBILE','MTS','TOPUP','MTP','SMSDAAK','Y','2015-07-13 04:56:49','../logos/mts.png'),('10099','MOBILE','REL GSM','TOPUP','RGP','SMSDAAK','Y','2015-07-13 04:56:49','../logos/reliance_gsm.png'),('10101','MOBILE','T24','TOPUP','TMP','SMSDAAK','Y','2015-07-13 04:56:49','../logos/t24.png'),('10102','MOBILE','DOCOMO','TOPUP','TCP','SMSDAAK','Y','2015-07-13 04:56:49','../logos/docomo.png'),('10103','MOBILE','UNINOR','TOPUP','UGP','SMSDAAK','Y','2015-07-13 04:56:49','../logos/uninor.png'),('10104','MOBILE','VIDEOCON','TOPUP','VGP','SMSDAAK','Y','2015-07-13 04:56:49','../logos/videocon.png'),('10105','MOBILE','AIRTEL','POSTPAID','ATC','SMSDAAK','Y','2015-07-13 04:56:49','../logos/airtel.png'),('10106','MOBILE','MTS','POSTPAID','MTC','SMSDAAK','Y','2015-07-13 04:56:49','../logos/mts.png'),('10107','MOBILE','REL GSM','POSTPAID','RGC','SMSDAAK','Y','2015-07-13 04:56:49','../logos/reliance_gsm.png'),('10108','MOBILE','DOCOMO','POSTPAID','TDC','SMSDAAK','Y','2015-07-13 04:56:49','../logos/docomo.png'),('10109','MOBILE','TIKONA','POSTPAID','TDB','SMSDAAK','Y','2015-07-13 04:56:49','../logos/tikona.png'),('10110','DTH','AIRTEL','TOPUP','ATV','SMSDAAK','Y','2015-07-13 04:56:49','../logos/airtel.png'),('10111','DTH','DISH TV','TOPUP','DTV','SMSDAAK','Y','2015-07-13 04:56:49','../logos/distv.png'),('10112','DTH','RELIANCE TV','TOPUP','RTV','SMSDAAK','Y','2015-07-13 04:56:49','../logos/reliance_gsm.png'),('10113','DTH','TATA SKY ONLINE','TOPUP','OTV','SMSDAAK','Y','2015-07-13 04:56:49','../logos/tata_sky.png'),('10114','DTH','VIDEOCON','TOPUP','VTV','SMSDAAK','Y','2015-07-13 04:56:49','../logos/videocon.png'),('10115','LANDLINE','BSNL','POSTPAID','BGL','SMSDAAK','Y','2015-07-13 04:56:49','../logos/bsnl.png'),('10116','LANDLINE','RELIANCE','POSTPAID','RGL','SMSDAAK','Y','2015-07-13 04:56:49','../logos/reliance_gsm.png'),('10117','LANDLINE','TATA INDICOM','POSTPAID','TCL','SMSDAAK','Y','2015-07-13 04:56:49','../logos/tata-indicom.png'),('10118','LANDLINE','AIRTEL','POSTPAID','48','EZYPAY','Y','2015-07-13 04:56:49','../logos/airtel.png'),('10119','LANDLINE','MTNL DEL','POSTPAID','51','EZYPAY','Y','2015-07-13 04:56:49','../logos/mtnl_del.png'),('10120','MOBILE','BSNL','POSTPAID','31','EZYPAY','Y','2015-07-13 04:56:49','../logos/bsnl.png'),('10121','MOBILE','IDEA','POSTPAID','33','EZYPAY','Y','2015-07-13 04:56:49','../logos/idea.png'),('10122','MOBILE','REL CDMA','POSTPAID','RGC','SMSDAAK','Y','2016-09-24 11:28:12','../logos/reliance_cdma.png'),('10123','MOBILE','REL CDMA','TOPUP','RGP','SMSDAAK','Y','2016-09-24 11:28:12','../logos/reliance_cdma.png'),('10124','MOBILE','TATA INDICOM','TOPUP','TMP','SMSDAAK','Y','2016-09-24 11:59:03','../logos/tata-indicom.png'),('10125','DTH','TATA SKY','TOPUP','9','EZYPAY','Y','2016-09-27 14:39:51','../logos/tata_sky.png'),('10126','MOBILE','VODAFONE','TOPUP','12','EZYPAY','Y','2016-09-27 14:39:51','../logos/vodafone.png'),('10127','MOBILE','VODAFONE','POSTPAID','76','EZYPAY','Y','2016-09-27 14:39:51','../logos/vodafone.png'),('10128','MOBILE','IDEA','TOPUP','34','EZYPAY','Y','2016-09-27 14:39:51','../logos/idea.png'),('10129','MOBILE','BSNL','TOPUP','4','EZYPAY','Y','2016-10-04 15:29:59','../logos/bsnl.png'),('10130','DTH','SUN DIRECT','TOPUP','8','EZYPAY','Y','2016-10-04 15:32:01','../logos/sun_direct.png'),('10131','MOBILE','JIO','TOPUP','79','EZYPAY','Y','2017-03-14 14:07:45','../logos/jiotelecom.png'),('10132','ELECTRICITY','TSECL - TRIPURA','POSTPAID','TTE','SMSDAAK','Y','2017-11-19 17:55:34','../logos/tsecl-tripura.png'),('10133','ELECTRICITY','Torrent Power','POSTPAID','TPE','SMSDAAK','Y','2017-11-19 17:55:34','../logos/torrent-power.png'),('10134','ELECTRICITY','Paschim Kshetra Vitaran - MADHYA PRADESH','POSTPAID','MPE','SMSDAAK','Y','2017-11-19 17:55:34','../logos/pashchim-shetra-vitran.png'),('10135','ELECTRICITY','MSEDC - MAHARASHTRA','POSTPAID','MDE','SMSDAAK','Y','2017-11-19 17:55:34','../logos/msedc-maharashtra.png'),('10136','ELECTRICITY','Madhya Kshetra Vitaran - MADHYA PRADESH','POSTPAID','MME','SMSDAAK','Y','2017-11-19 17:55:34','../logos/madhya-shetra-vitran.png'),('10137','ELECTRICITY','Jodhpur Vidyut Vitran Nigam - RAJASTHAN','POSTPAID','DRE','SMSDAAK','Y','2017-11-19 17:55:34','../logos/jodhpur-vidyut-vitran.png'),('10138','ELECTRICITY','Jamshedpur Utilities and Services (JUSCO)','POSTPAID','JUE','SMSDAAK','Y','2017-11-19 17:55:34','../logos/jamshedpur-utilities.png'),('10139','ELECTRICITY','Jaipur Vidyut Vitran Nigam - RAJASTHAN','POSTPAID','JRE','SMSDAAK','Y','2017-11-19 17:55:34','../logos/jaipur-vidyut-vitran.png'),('10140','ELECTRICITY','India Power','POSTPAID','IPE','SMSDAAK','Y','2017-11-19 17:55:34','../logos/india-power.png'),('10141','ELECTRICITY','CSPDCL - CHHATTISGARH','POSTPAID','CCE','SMSDAAK','Y','2017-11-19 17:55:34','../logos/cspdcl-chattisgarh.png'),('10142','ELECTRICITY','CESC - WEST BENGAL','POSTPAID','CWE','SMSDAAK','Y','2017-11-19 17:55:34','../logos/cesc-westbengal.png'),('10143','ELECTRICITY','BEST Undertaking - MUMBAI','POSTPAID','BME','SMSDAAK','Y','2017-11-19 17:55:35','../logos/best-mumbai.png'),('10144','ELECTRICITY','BESCOM - BENGALURU','POSTPAID','BBE','SMSDAAK','Y','2017-11-19 17:55:35','../logos/bescom-bangalore.png'),('10145','ELECTRICITY','APDCL - ASSAM','POSTPAID','AAE','SMSDAAK','Y','2017-11-19 17:55:35','../logos/apdcl-assam.png'),('10146','ELECTRICITY','Ajmer Vidyut Vitran Nigam - RAJASTHAN','POSTPAID','ARE','SMSDAAK','Y','2017-11-19 17:55:35','../logos/ajmer-vidyut-vitran.png'),('EKODMT','DMT','EKO','TRANSFER','EKODMT','EKO','Y','2016-03-18 20:46:43','');
/*!40000 ALTER TABLE `sys_product_profiles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-29 11:45:49
