-- Table structure for table `itn_channel_users`
--
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


--
-- Table structure for table `itn_default_threshold`
--

CREATE TABLE `itn_default_threshold` (
  `set_default_id` varchar(20) NOT NULL DEFAULT '',
  `thres_profile_id` varchar(20) DEFAULT NULL,
  `threshold_name` varchar(20) DEFAULT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  `category_code` varchar(20) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`set_default_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `itn_mnytfr_srvchrg`
--


CREATE TABLE `itn_mnytfr_srvchrg` (
  `srvc_chrg_id` varchar(20) NOT NULL,
  `srvc_chrg_ver` int(2) DEFAULT NULL,
  `min_tfr_amt` bigint(19) DEFAULT NULL,
  `max_tfr_amt` bigint(19) DEFAULT NULL,
  `mode` varchar(5) DEFAULT NULL,
  `srvc_chrg_dtls_id` varchar(20) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`srvc_chrg_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


--
-- Table structure for table `itn_mnytfr_srvchrg_dtls`
--


CREATE TABLE `itn_mnytfr_srvchrg_dtls` (
  `srvc_chrg_dtls_id` varchar(20) NOT NULL DEFAULT '',
  `from_amt` bigint(19) NOT NULL DEFAULT '0',
  `to_amt` bigint(19) NOT NULL DEFAULT '0',
  `type` varchar(15) DEFAULT NULL,
  `usr_ctgry_1` varchar(20) DEFAULT NULL,
  `srvc_amt_1` bigint(19) DEFAULT NULL,
  `usr_ctgry_2` varchar(20) DEFAULT NULL,
  `srvc_amt_2` bigint(19) DEFAULT NULL,
  `usr_ctgry_3` varchar(20) DEFAULT NULL,
  `srvc_amt_3` bigint(19) DEFAULT NULL,
  `usr_ctgry_4` varchar(20) DEFAULT NULL,
  `srvc_amt_4` bigint(19) DEFAULT NULL,
  `usr_ctgry_5` varchar(20) DEFAULT NULL,
  `srvc_amt_5` bigint(19) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`srvc_chrg_dtls_id`,`from_amt`,`to_amt`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `itn_product_profile`
--

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

-- Table structure for table `itn_product_commissions`
--

CREATE TABLE `itn_product_commissions` (
  `product_id` varchar(20) NOT NULL DEFAULT '',
  `product_type` varchar(20) NOT NULL DEFAULT '',
  `service_provider` varchar(75) NOT NULL DEFAULT '',
  `recharge_type` varchar(50) NOT NULL DEFAULT '',
  `user_type` varchar(10) NOT NULL DEFAULT '',
  `user_category` varchar(5) NOT NULL DEFAULT '',
  `commissionType` varchar(20) DEFAULT NULL,
  `commissionDirection` varchar(20) NOT NULL,
  `commission` bigint(19) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`product_type`,`service_provider`,`recharge_type`,`user_type`,`user_category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Table structure for table `itn_service_charge`
--
CREATE TABLE `itn_service_charge` (
  `srvc_chrg_id` varchar(20) NOT NULL,
  `service_type` varchar(100) DEFAULT NULL,
  `srvc_chrg_type` varchar(10) DEFAULT NULL,
  `service_charge` varchar(10) DEFAULT NULL,
  `payer` varchar(10) DEFAULT NULL,
  `productId` varchar(20) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `service_provider` varchar(75) DEFAULT NULL,
  `recharge_type` varchar(50) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`srvc_chrg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


---- Table structure for table `itn_service_charge_details`
--

CREATE TABLE `itn_service_charge_details` (
  `detail_id` varchar(20) NOT NULL DEFAULT '',
  `version` int(2) DEFAULT NULL,
  `service_type` varchar(100) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `service_provider` varchar(75) DEFAULT NULL,
  `recharge_type` varchar(50) DEFAULT NULL,
  `user_category` varchar(50) NOT NULL DEFAULT '',
  `srvc_chrg_type` varchar(10) DEFAULT NULL,
  `service_charge` bigint(19) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`detail_id`,`user_category`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `itn_service_charge_profile`
--

CREATE TABLE `itn_service_charge_profile` (
  `profile_id` varchar(20) NOT NULL DEFAULT '',
  `version` int(2) NOT NULL DEFAULT '0',
  `detail_id` varchar(20) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`profile_id`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Table structure for table `itn_transaction_header`
--

CREATE TABLE `itn_transaction_header` (
  `transfer_id` varchar(20) NOT NULL DEFAULT '',
  `transfer_on` datetime DEFAULT NULL,
  `payer_user_id` varchar(20) DEFAULT NULL,
  `payer_account_id` varchar(20) DEFAULT NULL,
  `payee_user_id` varchar(20) DEFAULT NULL,
  `payee_account_id` varchar(20) DEFAULT NULL,
  `requested_value` bigint(10) DEFAULT NULL,
  `error_code` varchar(20) DEFAULT NULL,
  `transfer_status` varchar(20) DEFAULT NULL,
  `service_type` varchar(20) DEFAULT NULL,
  `product_id` varchar(30) DEFAULT NULL,
  `service_provider` varchar(75) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `recharge_type` varchar(20) DEFAULT NULL,
  `reconciliation_done` varchar(20) DEFAULT NULL,
  `reconciliation_date` varchar(20) DEFAULT NULL,
  `reconciliation_by` varchar(20) DEFAULT NULL,
  `details_1` varchar(150) DEFAULT NULL,
  `details_2` varchar(150) DEFAULT NULL,
  `details_3` varchar(150) DEFAULT NULL,
  `details_4` varchar(150) DEFAULT NULL,
  `details_5` varchar(150) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_on` varchar(20) DEFAULT NULL,
  `modified_by` varchar(20) DEFAULT NULL,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remarks` text,
  `total_commission` bigint(10) DEFAULT NULL,
  `admn_srvc_chrg` bigint(19) DEFAULT NULL,
  `dist_srvc_chrg` bigint(19) DEFAULT NULL,
  `rtlr_srvc_chrg` bigint(19) DEFAULT NULL,
  `total_service_charge` bigint(19) DEFAULT NULL,
  `operator_txn_id` varchar(30) DEFAULT NULL,
  `aggregator_txn_id` varchar(30) DEFAULT NULL,
  `details_6` varchar(100) DEFAULT NULL,
  `details_7` varchar(100) DEFAULT NULL,
  `details_8` varchar(100) DEFAULT NULL,
  `details_9` varchar(100) DEFAULT NULL,
  `details_10` varchar(100) DEFAULT NULL,
  `tax_details_1` bigint(19) DEFAULT NULL,
  `tax_details_2` bigint(19) DEFAULT NULL,
  `tax_details_3` bigint(19) DEFAULT NULL,
  `tax_details_4` bigint(19) DEFAULT NULL,
  `tax_details_5` bigint(19) DEFAULT NULL,
  `tax_details_6` bigint(19) DEFAULT NULL,
  `tax_details_7` bigint(19) DEFAULT NULL,
  `tax_details_8` bigint(19) DEFAULT NULL,
  `aggregator_status` varchar(2) DEFAULT NULL,
  `dmt_api` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`transfer_id`),
  KEY `index_details_n` (`details_1`,`details_2`,`details_3`,`details_4`,`details_5`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Table structure for table `itn_transaction_items`
--

CREATE TABLE `itn_transaction_items` (
  `transfer_id` varchar(20) NOT NULL DEFAULT '',
  `transfer_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `transfer_status` varchar(20) DEFAULT NULL,
  `party_id` varchar(20) NOT NULL DEFAULT '',
  `second_party` varchar(20) NOT NULL DEFAULT '',
  `user_type` varchar(20) DEFAULT NULL,
  `user_category` varchar(50) DEFAULT NULL,
  `transaction_type` varchar(50) NOT NULL DEFAULT '',
  `approved_value` bigint(10) DEFAULT NULL,
  `service_type` varchar(50) DEFAULT NULL,
  `product_id` varchar(30) DEFAULT NULL,
  `service_provider` varchar(75) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `recharge_type` varchar(20) DEFAULT NULL,
  `previous_balance` bigint(19) DEFAULT NULL,
  `post_balance` bigint(19) DEFAULT NULL,
  PRIMARY KEY (`transfer_id`,`party_id`,`second_party`,`transaction_type`),
  KEY `idx_txnitm_srvctyp` (`service_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Table structure for table `itn_thresholds_profiles`
--

CREATE TABLE `itn_thresholds_profiles` (
  `thres_profile_id` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(20) DEFAULT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`thres_profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `itn_thresholds_profile_dtls`
--


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


--
-- Table structure for table `itn_wallet`
--


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

--
-- Table structure for table `sys_service_types`
--


CREATE TABLE `sys_service_types` (
  `service_type` varchar(20) NOT NULL,
  `service_name` varchar(100) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  `is_financial` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`service_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


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

