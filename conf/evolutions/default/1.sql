# Data SCHEMA

# --- !Ups
DROP TABLE IF EXISTS `data`;

CREATE TABLE `data` (
  `ORG_ID` char(18) DEFAULT NULL,
  `TABLE_ID` char(18) DEFAULT NULL,
  `OBJECT_ID` char(18) NOT NULL,
  `COL_1` varchar(200) DEFAULT NULL,
  `COL_2` varchar(200) DEFAULT NULL,
  `COL_3` varchar(200) DEFAULT NULL,
  `COL_4` varchar(200) DEFAULT NULL,
  `COL_5` varchar(200) DEFAULT NULL,
  `COL_6` varchar(200) DEFAULT NULL,
  `COL_7` varchar(200) DEFAULT NULL,
  `COL_8` varchar(200) DEFAULT NULL,
  `COL_9` varchar(200) DEFAULT NULL,
  `COL_10` varchar(200) DEFAULT NULL,
  `COL_11` varchar(200) DEFAULT NULL,
  `COL_12` varchar(200) DEFAULT NULL,
  `COL_13` varchar(200) DEFAULT NULL,
  `COL_14` varchar(200) DEFAULT NULL,
  `COL_15` varchar(200) DEFAULT NULL,
  `COL_16` varchar(200) DEFAULT NULL,
  `COL_17` varchar(200) DEFAULT NULL,
  `COL_18` varchar(200) DEFAULT NULL,
  `COL_19` varchar(200) DEFAULT NULL,
  `COL_20` varchar(200) DEFAULT NULL,
  `COL_21` varchar(200) DEFAULT NULL,
  `COL_22` varchar(200) DEFAULT NULL,
  `COL_23` varchar(200) DEFAULT NULL,
  `COL_24` varchar(200) DEFAULT NULL,
  `COL_25` varchar(200) DEFAULT NULL,
  `COL_26` varchar(200) DEFAULT NULL,
  `COL_27` varchar(200) DEFAULT NULL,
  `COL_28` varchar(200) DEFAULT NULL,
  `COL_29` varchar(200) DEFAULT NULL,
  `COL_30` varchar(200) DEFAULT NULL,
  `COL_31` varchar(200) DEFAULT NULL,
  `COL_32` varchar(200) DEFAULT NULL,
  `COL_33` varchar(200) DEFAULT NULL,
  `COL_34` varchar(200) DEFAULT NULL,
  `COL_35` varchar(200) DEFAULT NULL,
  `COL_36` varchar(200) DEFAULT NULL,
  `COL_37` varchar(200) DEFAULT NULL,
  `COL_38` varchar(200) DEFAULT NULL,
  `COL_39` varchar(200) DEFAULT NULL,
  `COL_40` varchar(200) DEFAULT NULL,
  `COL_41` varchar(200) DEFAULT NULL,
  `COL_42` varchar(200) DEFAULT NULL,
  `COL_43` varchar(200) DEFAULT NULL,
  `COL_44` varchar(200) DEFAULT NULL,
  `COL_45` varchar(200) DEFAULT NULL,
  `COL_46` varchar(200) DEFAULT NULL,
  `COL_47` varchar(200) DEFAULT NULL,
  `COL_48` varchar(200) DEFAULT NULL,
  `COL_49` varchar(200) DEFAULT NULL,
  `COL_50` varchar(200) DEFAULT NULL,
  `COL_51` varchar(200) DEFAULT NULL,
  `COL_52` varchar(200) DEFAULT NULL,
  `COL_53` varchar(200) DEFAULT NULL,
  `COL_54` varchar(200) DEFAULT NULL,
  `COL_55` varchar(200) DEFAULT NULL,
  `COL_56` varchar(200) DEFAULT NULL,
  `COL_57` varchar(200) DEFAULT NULL,
  `COL_58` varchar(200) DEFAULT NULL,
  `COL_59` varchar(200) DEFAULT NULL,
  `COL_60` varchar(200) DEFAULT NULL,
  `COL_61` varchar(200) DEFAULT NULL,
  `COL_62` varchar(200) DEFAULT NULL,
  `COL_63` varchar(200) DEFAULT NULL,
  `COL_64` varchar(200) DEFAULT NULL,
  `COL_65` varchar(200) DEFAULT NULL,
  `COL_66` varchar(200) DEFAULT NULL,
  `COL_67` varchar(200) DEFAULT NULL,
  `COL_68` varchar(200) DEFAULT NULL,
  `COL_69` varchar(200) DEFAULT NULL,
  `COL_70` varchar(200) DEFAULT NULL,
  `COL_71` varchar(200) DEFAULT NULL,
  `COL_72` varchar(200) DEFAULT NULL,
  `COL_73` varchar(200) DEFAULT NULL,
  `COL_74` varchar(200) DEFAULT NULL,
  `COL_75` varchar(200) DEFAULT NULL,
  `COL_76` varchar(200) DEFAULT NULL,
  `COL_77` varchar(200) DEFAULT NULL,
  `COL_78` varchar(200) DEFAULT NULL,
  `COL_79` varchar(200) DEFAULT NULL,
  `COL_80` varchar(200) DEFAULT NULL,
  `COL_81` varchar(200) DEFAULT NULL,
  `COL_82` varchar(200) DEFAULT NULL,
  `COL_83` varchar(200) DEFAULT NULL,
  `COL_84` varchar(200) DEFAULT NULL,
  `COL_85` varchar(200) DEFAULT NULL,
  `COL_86` varchar(200) DEFAULT NULL,
  `COL_87` varchar(200) DEFAULT NULL,
  `COL_88` varchar(200) DEFAULT NULL,
  `COL_89` varchar(200) DEFAULT NULL,
  `COL_90` varchar(200) DEFAULT NULL,
  `COL_91` varchar(200) DEFAULT NULL,
  `COL_92` varchar(200) DEFAULT NULL,
  `COL_93` varchar(200) DEFAULT NULL,
  `COL_94` varchar(200) DEFAULT NULL,
  `COL_95` varchar(200) DEFAULT NULL,
  `COL_96` varchar(200) DEFAULT NULL,
  `COL_97` varchar(200) DEFAULT NULL,
  `COL_98` varchar(200) DEFAULT NULL,
  `COL_99` varchar(200) DEFAULT NULL,
  `COL_100` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ORG_ID`, `TABLE_ID`, `OBJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

# --- !Downs

DROP TABLE data;