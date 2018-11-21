drop table if exists Customer;
create table Customer(
  cu_id nvarchar(10) primary key not null,
  cu_name nvarchar(10),
  cu_sex int default 1,
  u_id nvarchar(10) ,#外键
  cu_password nvarchar(10),
  cu_phone nvarchar(20),
  cu_birth datetime,
  cu_address nvarchar(50),
  cu_remarks nvarchar(50),
  foreign key(u_id) references Usertb (u_id)#外键
);
insert into Customer values
('1001','李四',1,'u1','756472','12345678911',now(),'广东珠海市','快递一件衣服');
select * from Customer;

#用户组
drop table if exists Usertb;
create table Usertb(
  u_id nvarchar(10) primary key  not null,
  u_name nvarchar(10) not null ,
  u_remarks nvarchar(50)
 );
insert into Usertb values ('u1','张三','今天天气不错有太阳');
select *  from Usertb;

#订单
drop table if exists Orders;
create table Orders(
  o_id nvarchar(10) primary key not null ,
  o_type int,
  o_handoverNo nvarchar(10), #交接单编号
  o_goodsName nvarchar(20),
  o_goodWeight int ,
  o_mailer nvarchar(20), #邮寄人
  o_maileraddress nvarchar(50), #邮寄地址
  o_shassress nvarchar(50), #收货地址
  o_ordersta int ,#订单状态
  o_maiphone nvarchar(20),#邮寄电话
  o_consignee nvarchar(20), #收货人
  o_consigneephon nvarchar(20), #收货人电话
  o_startingCity nvarchar(10),#起始城市
  r_midpoint nvarchar(10),#中点城市
  r_endCityId nvarchar(10) ,#终点城市
  o_shippingPrice decimal(18,0),#运送价格
  o_distributionPr decimal(18,0) ,#配送价格
  o_transporPr decimal(18,0), #运输价格
  o_totalPrnvar nvarchar(10), #总价
  o_vehicle nvarchar(10), #车辆
  o_remarks nvarchar(10) #备注
);
insert into Orders values
('A123478',2,'B32934','冰箱',65,'赵柳','广东省珠海市斗门南方it','中三小榄站',2,'15834927459','赵高','13434927468','珠海','南朗','中山',345.23,15.00,50.34,'400.57','兰博基尼','希望安全送达！');
select * from Orders;

#路线
drop table if exists Route;
create table Route(
  r_id nvarchar(10) primary key not null,
  r_name nvarchar(10) ,
  p_id nvarchar(10),
  o_startingCity nvarchar(10),
  p_midpoint nvarchar(10),
  r_midpoint nvarchar(10) ,
  p_endCity nvarchar(10),
  r_endCityId nvarchar(10),
  r_transporPr decimal(18,0),
  r_remarks nvarchar(50)
);
insert into Route values
('G123','中三大道','GD','ZH','ZH','NL','GD','ZS',400.59,'安全第一！');
select  * from Route;

#车辆
drop table if exists Vehicle;
create table Vehicle(
  v_id nvarchar(10) primary key not null ,
  v_carModel nvarchar(10),
  v_placeof nvarchar(20),#生产地
  v_routEnumb nvarchar(10), #路线编号
  v_dateOfProd datetime, #生产日期
  v_dateOfPurch datetime, #购买日期
  v_remarks nvarchar(50)
);
insert into Vehicle values
('粤K123','HB23','珠海','中山大道',now(),now(),'质量与速度赛跑！');
select * from Vehicle;

#城市
drop table if exists City;
create table City(
  c_id nvarchar(10) primary key not null ,
  c_name nvarchar(10),
  ca_id nvarchar(10),
  foreign key(ca_id) references CityArea (ca_id)
);
insert into City values
('ZH','珠海','XZQ');
select * from City;

#城市地区
drop table if exists CityArea;
create table CityArea(
  ca_id nvarchar(10) primary key not null ,
  ca_name nvarchar(50) ,#区域名称
  c_id nvarchar(50)
);
insert into CityArea values
('XZQ','香洲区','ZH');
select * from CityArea;

#管理员
drop table if exists admin;
create table admin(
  a_id nvarchar(10) primary key not null ,
  a_name nvarchar(10) ,
  a_sex int default 1,
  u_id nvarchar(10) ,#外键
  a_state int ,
  a_aTcity nvarchar(10),
  a_addres nvarchar(10),
  a_pass nvarchar(10),
  a_phoneNumb nvarchar(20),
  a_remarks nvarchar(50),
  foreign key (u_id) references Usertb(u_id)
);
insert into admin values
('D1','admin',1,'u1',1,'珠海','白蕉斗门','123456','18388935978','管理好业务流程！');
select * from admin;

#交接单
drop table if exists deliveryOrder;
create table deliveryOrder(
  d_startingCity nvarchar(10) primary key not null ,#起始城市
  d_endCity nvarchar(10) ,#终点城市
  d_hasArrived nvarchar(10),#已到城市
  d_state int default 1,
  d_riseTime datetime,#生成时间
  d_remark nvarchar(50)
);
insert  into deliveryOrder values
('珠海市','中山市','南朗',2,'1899-7-1','保证货物安全送到！');
select * from deliveryOrder;

#配送
drop table if exists distribution;
create table distribution(
  d_id int primary key not null,
  d_name nvarchar(10),
  c_id nvarchar(10),
  a_id nvarchar(10),
  d_phone nvarchar(20),
  d_addres nvarchar(50),
  foreign key (c_id) references City(c_id),
  foreign key (a_id) references admin(a_id)
);
insert into distribution values
(1011,'天天快递','ZH','D1','13457923838','珠海');
select * from distribution;

#省
drop table if exists Province;
create table Province(
  p_id nvarchar(10) primary key not null ,
  p_name nvarchar(10)
);
insert into Province values ('GD','广东省');

#配送范围
drop table if exists distrRange;
create table distrRange(
  di_id int primary key not null ,
  di_name nvarchar(10),
  di_price decimal(18,0),
  c_id nvarchar(10),
  di_remarks nvarchar(50),
  foreign key (c_id) references City(c_id)
);
insert into distrRange values
(1001,'中三',500.44,'ZH','距离不是问题！');

