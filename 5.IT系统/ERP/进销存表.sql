/*
	Invoicing Management System ims
客户表
  客户编号
  客户全称
  客户邮编
  客户公司地址
  客户公司电话
  联系人
  联系电话
  开户银行
  银行帐号
  联系人信箱
  客户传真
  状态
  */
create table ims_customer
(
  id          int not null auto_increment,
  cusname     varchar(50),
  zip         char(15),
  address     varchar(80),
  phone       varchar(20),
  lxr         varchar(20),
  lxrphone    varchar(20),
  bank        varchar(50),
  account     varchar(50),
  email       varchar(50),
  fax         varchar(20),
  available   int,
  primary key (id)
);


/*
管理员表
  用户名， 密码，用户全称，权限
  */
create table ims_oper
(
  id          int not null auto_increment,
  username    varchar(20),
  password    varchar(20),
  name        varchar(20),
  power       char(10),
  primary key (id)
);



/*
商品表
  商品编号，商品名称，产地，规格，包装，生产批号，
  批准文号，描述，价格，供应商编号，状态
  */
create table ims_goods
(
  id              int not null auto_increment,
  goodname        varchar(50),
  place           varchar(80),
  size            varchar(50),
  package         varchar(50),
  pcode           varchar(20),
  pmcode          varchar(20),
  description     varchar(50),
  price           float(10,2),
  pid             int,
  available       int,
  primary key (id)
);



/*
进货表
  编号，供应商编号，支付类型，进货时间，操作员，数量，注释，商品编号
  */
create table ims_inport
(
   id          int not null auto_increment,
   pid         int,
   paytype     varchar(50),
   inporttime  date,
   oper        varchar(50),
   num         int,
   comment     varchar(100),
   gid         int,
   primary key (id)
);




/*
退货表
	编号，供应商编号，支付类型，退货时间，操作员，数量，注释，商品编号
	*/
create table ims_outport
(
   id          int not null auto_increment,
   pid         int,
   paytype     varchar(50),
   outputtime  date,
   oper        varchar(50),
   num         int,
   comment     varchar(100),
   gid         int,   
   primary key (id)
);



/*
供应商表
  供应商编号，供应商全称，供应商邮编，公司地址，公司电话，联系人，
  联系人电话,开户银行，银行帐号，联系人邮箱，公司传真，状态
  */
create table ims_provider
(
   id          int not null auto_increment,
   pname       varchar(50),
   zip         char(15),
   address     varchar(80),
   phone       varchar(20),
   lxr         varchar(20),
   lxrphone    varchar(20),
   bank        varchar(50),
   account     varchar(50),
   email       varchar(50),
   fax         varchar(20),
   available   int,
   primary key (id)
);



/*
销售表
	编号，客户编号，支付类型，销售时间，操作员，数量，注释，商品编号
	*/
create table ims_sales
(
   id          int not null auto_increment,
   cid         int,
   paytype     varchar(50),
   saletime    date,
   oper        varchar(50),
   num         int,
   comment     varchar(100),
   gid         int,
   primary key (id)
);



/*
销售退货表
	编号，客户编号，支付类型，退货时间，操作员，数量，注释，商品编号
	*/

create table ims_salesback
(
   id              int not null auto_increment,
   cid             int,
   paytype         varchar(50),
   salebacktime    date,
   oper            varchar(50),
   num             int,
   comment         varchar(100),
   gid             int,
   primary key (id)
);



/*
库存表
	编号，商品编号，数量；
 */

create table ims_storage
(
   id              int not null auto_increment,
   gid             int,
   num             int,
   primary key (id)
);
