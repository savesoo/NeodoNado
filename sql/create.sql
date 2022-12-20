CREATE TABLE `user` (
  `userIdx` bigint NOT NULL AUTO_INCREMENT,
  `uuid` varchar(225) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '',
  `userId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `userPw` char(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `nickname` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `phone` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `nation` int DEFAULT NULL,
  `address1` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '',
  `address2` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '',
  `postNum` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '',
  `location` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `bYear` int DEFAULT NULL,
  `bMonth` int DEFAULT NULL,
  `bDay` int DEFAULT NULL,
  `joinDate` bigint NOT NULL,
  `deleted` tinyint NOT NULL DEFAULT '0',
  `password` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`userIdx`),
  UNIQUE KEY `userIdx_UNIQUE` (`userIdx`),
  UNIQUE KEY `userId_UNIQUE` (`userId`),
  KEY `uuid_IDX` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;



CREATE TABLE `board` (
  `boardIdx` bigint NOT NULL AUTO_INCREMENT,
  `boardCategory` int DEFAULT NULL,
  `title` varchar(200) COLLATE utf8mb3_bin NOT NULL,
  `content` text COLLATE utf8mb3_bin NOT NULL,
  `category` int NOT NULL,
  `thumbnail` varchar(200) COLLATE utf8mb3_bin DEFAULT NULL,
  `imgURL` varchar(1000) COLLATE utf8mb3_bin DEFAULT NULL,
  `onSale` int NOT NULL DEFAULT '1',
  `price` int NOT NULL,
  `userIdx` bigint NOT NULL,
  `writeDate` bigint NOT NULL,
  `img` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`boardIdx`),
  KEY `search_title` (`title`),
  KEY `user_idx` (`userIdx`),
  CONSTRAINT `user` FOREIGN KEY (`userIdx`) REFERENCES `user` (`userIdx`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

CREATE TABLE `boardcomment` (
  `commentIdx` bigint NOT NULL AUTO_INCREMENT,
  `boardIdx` bigint NOT NULL,
  `userIdx` bigint NOT NULL,
  `nickname` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  `content` varchar(100) COLLATE utf8mb3_bin NOT NULL,
  `writeDate` bigint NOT NULL,
  PRIMARY KEY (`commentIdx`),
  KEY `boardIdx` (`boardIdx`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

