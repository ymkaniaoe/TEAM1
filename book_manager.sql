--创建图书管理数据库
CREATE DATABASE 'book_manager'

--管理员账号数据表
CREATE TABLE 'admin' (
  'admin_id' int(10) NOT NULL PRIMARY KEY,
  'admin_name' varchar(15) NOT NULL,
  'password' varchar(15) NOT NULL
)

--读者账号数据表
CREATE TABLE 'reader' (
  'user_id' int(10) NOT NULL PRIMARY KEY,
  'user_name' varchar(15) NOT NULL,
  'password' varchar(15) NOT NULL,
  'register_day' date NOT NULL,                                      /*注册日期*/
  'user_state' TINTINT(1) DEFAULT '1' NOT NULL                       /*是否被禁用(默认为可用)*/
)

--图书信息数据表
CREATE TABLE 'book_info'(
  'book_id' int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  'name' varchar(50) NOT NULL,
  'author' varchar(30) NOT NULL,
  'ISBN' varchar(20) NOT NULL,
  'press' varchar(50) NOT NULL,                                      /*出版社*/
  'number' int(10) NOT NULL,                                         /*通过数量判断是否可借*/
  'introduction' text
)

--借还书申请数据表
CREATE TABLE 'apply'( 
  'id' int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,                 /*操作流水号*/
  'user_id' int(10) NOT NULL,
  'book_name' varchar(50) NOT NULL,
  'author' varchar(30) NOT NULL,
  'ISBN' varchar(20) NOT NULL,
  'apply_number' int(10) NOT NULL,                                   /*借阅(或归还)本数*/
  'apply_time' date NOT NULL,
  'approval_state' TINTINT(1) DEFAULT '0' NOT NULL,                  /*审批状态(默认为待审批)*/
  'approval_result' TINTINT(1) DEFAULT '0' NOT NULL                  /*审批结果(默认为未通过)*/
)

--丢毁反馈数据表
CREATE TABLE 'lost_feedback'(
  'id' int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  'user_id' int(10) NOT NULL,
  'book_name' varchar(50) NOT NULL,
  'author' varchar(30) NOT NULL,
  'ISBN' varchar(20) NOT NULL,
  'lost_number' int(10) NOT NULL,                                   /*丢损本数*/
  'feedback_time' date NOT NULL,                                    /*反馈时间*/
  'reason'text                                                      /*丢损原因说明*/
)

--借还书记录数据表
CREATE TABLE 'record'(
  'id' int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,                  /*操作流水号*/
  'book_name' varchar(50) NOT NULL,
  'author' varchar(30) NOT NULL,
  'ISBN' varchar(20) NOT NULL,
  'borrow_time' date NOT NULL,
  'remand_time' date NOT NULL
)