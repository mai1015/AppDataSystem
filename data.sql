CREATE TABLE `users`(
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `app`.`apps` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `nameid` varchar(50) NOT NULL comment "应用指定id 字母",
    `name` varchar(50) NOT NULL comment "应用名字",
    `discription` varchar(255) comment "应用描述",
    `url` varchar(255) comment "应用地址",
    `state` int(1) comment "应用状态：0为正常 1为异常",
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `app_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `app`.`app_info` (
    `app_id` int(10) unsigned NOT NULL COMMENT "应用id",
    `data` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "应用数据",
    `setting` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "应用设置",
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`app_id`),
    KEY `info_app_id_foreign` (`app_id`),
    CONSTRAINT `info_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `app`.`app_data` (
    `app_id` int(10) unsigned NOT NULL COMMENT '应用id',
    `key` varchar(50) NOT NULL comment '数据key',
    `value` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据值',
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`app_id`),
    KEY `data_app_id_foreign` (`app_id`),
    CONSTRAINT `data_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `app`.`app_userdata` (
    `app_id` int(10) unsigned NOT NULL COMMENT '应用id',
    `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
    `key` varchar(50) NOT NULL comment '数据key',
    `value` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据值',
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`app_id`),
    KEY `userdata_app_id_foreign` (`app_id`),
    CONSTRAINT `userdata_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `userdata_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `apps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;