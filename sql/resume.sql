SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_education
-- ----------------------------
DROP TABLE IF EXISTS `t_education`;
CREATE TABLE `t_education` (
  `education_experience_id` int NOT NULL COMMENT '教育经历id',
  `user_id` int NOT NULL COMMENT '用户id',
  `school_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学校名称',
  `education_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学历名称',
  `start_date` date DEFAULT NULL COMMENT '开始时间',
  `end_date` date DEFAULT NULL COMMENT '结束时间',
  `school_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学校类型',
  `experience` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学校经历',
  `del_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除(0:否[默认] 1:删除）',
  `create_by` bigint NOT NULL COMMENT '创建者',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`education_experience_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for t_job_intention
-- ----------------------------
DROP TABLE IF EXISTS `t_job_intention`;
CREATE TABLE `t_job_intention` (
  `job_intention_id` int NOT NULL COMMENT '求职意向id',
  `user_id` int NOT NULL,
  `types` tinyint DEFAULT NULL COMMENT '求职类型',
  `position` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '职位',
  `industry` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '行业',
  `min_salary` int DEFAULT NULL COMMENT '最低薪资',
  `max_salary` int DEFAULT NULL COMMENT '最高薪资',
  `work_place` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工作地点',
  `del_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除(0:否[默认] 1:删除）',
  `create_by` bigint NOT NULL COMMENT '创建者',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`job_intention_id`,`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for t_project_experience
-- ----------------------------
DROP TABLE IF EXISTS `t_project_experience`;
CREATE TABLE `t_project_experience` (
  `project_experience_id` int NOT NULL COMMENT '项目经历id',
  `user_id` int NOT NULL,
  `project_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '项目名称',
  `project_role` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '项目角色',
  `project_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '项目url',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '描述',
  `achievement` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '业绩',
  `del_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除(0:否[默认] 1:删除）',
  `create_by` bigint NOT NULL COMMENT '创建者',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`project_experience_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `use_id` int NOT NULL COMMENT '用户id',
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `birthday` date NOT NULL COMMENT '生日',
  `mobie` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '移动电话',
  `wechat` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '微信',
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `education` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学历',
  `live_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '居住地址',
  `native_place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '籍贯',
  `introduction` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '自我介绍',
  `del_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除(0:否[默认] 1:删除）',
  `create_by` bigint NOT NULL COMMENT '创建者',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`use_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for t_work_experience
-- ----------------------------
DROP TABLE IF EXISTS `t_work_experience`;
CREATE TABLE `t_work_experience` (
  `work_experience_id` int NOT NULL COMMENT '工作经历id',
  `user_id` int NOT NULL COMMENT '用户id',
  `company_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '公司名称',
  `industry` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属行业',
  `department` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属部门',
  `position` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '职位名称',
  `start_work_time` date DEFAULT NULL COMMENT '开始工作时间',
  `end_work_time` date DEFAULT NULL COMMENT '结束工作时间',
  `work_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '工作内容',
  `work_achievement` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '工作业绩',
  `having_skills` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '拥有技能',
  `del_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除(0:否[默认] 1:删除）',
  `create_by` bigint NOT NULL COMMENT '创建者',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`work_experience_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

SET FOREIGN_KEY_CHECKS = 1;
