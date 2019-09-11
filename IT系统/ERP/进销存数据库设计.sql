/*

 */
 
CREATE TABLE user(
  user_id varchar(6),
  user_pwd varchar(8) null,
  again_pwd varchar(8) null,
  bel_group varchar(3) null,
  div_type varchar(1) null,
  user_auth varchar(1) null,
  auth_type varchar(1) null,
  user_status varchar(1) null,
  create_user varchar(6) null,
  create_date varchar(7) null,
  create_time varchar(6) null,
  appr_user varchar(6) null,
  appr_date varchar(7) null,
  appr_time varchar(6) null,
  pwd_date varchar(7) null,
  err_count float null,
  use_ejcic varchar(1) null
)


CREATE TABLE supplier  /*供应商表*/
(
  supplier_id     int     identity(1,1)     not null, /* 供应商编号 ,主键 */
  name            varchar(250)              not null, /* 供应商名称 */
  address         varchar(250)              not null, /* 地址 */
  phone           varchar(25)               null,     /* 电话 */
  fax             varchar(25)               null,     /* 传真 */
  postalcode      varchar(10)               null,     /* 邮编 */
  constactperson  varchar(20)               null      /* 联系人 */
 )

CREATE TABLE customer   /* 客户表*/
(
  customer_id     int    identity(1,1)      not null, /* 客户编号,主键*/
  name            varchar(250)              not null, /* 客户名称 */
  address         varchar(250)              not null, /* 地址 */
  phone           varchar(25)               null,     /* 电话 */
  fax             varchar(25)               null,     /* 传真 */
  postalcode      varchar(10)               null,     /* 邮编 */
  constactperson  varchar(20)               null      /* 联系人 */
 )

CREATE TABLE dept      /* 部门表 */
(
  dept_id        int   identity(1,1)        not null, /* 部门编号,主键 */
  name           varchar(30)                not null, /* 名称 */
  remark           varchar(250)               not null/* 描述,备注 */
)

CREATE TABLE dept_supplier /* 部门--供应商表*/
(
  dept_id       int                         not null,  /* 部门编号,主键 ,  外键( 参照 dept 表  )*/
  supplier_id   int                         not null   /* 供应商编号 ,主键,外键( 参照 supplier 表) */
)

CREATE TABLE dept_customer /* 部门--客户表*/
(
  dept_id       int                         not null, /* 部门编号,主键 ,  外键( 参照 dept 表  )*/
  customer_id   int                         not null  /* 客户编号,主键,  外键( 参照 supplier 表) */
)

CREATE TABLE storehouse   /* 仓库表 */
(
  storehouse_id   int identity(1,1)         not null,  /* 仓库编号,主键 */
  address         varchar(250)              not null,  /* 地址 */
  phone           varchar(25)               null,      /* 电话 */
  employee_id     int                       not null,  /* 仓库保管 ,外键 ( 参照 employee 表 ) */
  createdate      datetime                  null       /* 仓库成立时间 */
)

CREATE TABLE productclass  /* 商品总分类表 */
(
  productclass_id  int identity(1,1)        not null,  /* 商品总分类编号, 主键 */
  name             varchar(30)              not null,  /* 商品分类名称 */
  employee_id      int                      not null,  /* 建分类人 ,外键 ( 参照 employee 表 )*/
  createdate       datetime                 null,      /* 建分类时间 */
  remark             varchar(250)             null,    /* 描述,备注 */
)

CREATE TABLE productlist  /* 商品细分类表 */
(
  productclass_id  int                      not null, /* 商品总分类编号, 外键 ( 参照productclass 表 ) */
  productlist_id   int identity(1,1)        not null, /* 商品细分类编号,主键 */
  name             varchar(30)              not null, /* 商品名称 */
  employee_id      int                      not null, /* 建分类人,外键 ( 参照 employee 表 )*/
  createdate       datetime                 null,     /* 建分类时间 */
  remark             varchar(250)             null,   /* 描述 ,备注 */
 )

CREATE TABLE productspec  /* 商品规格表 */
(
  productspec_id   int identity(1,1)        not null, /* 商品规格编号,主键 */
  name             varchar(30)              not null, /* 商品规格名称 */
  employee_id      int                      not null, /* 操作员 ,外键 ( 参照 employee 表 )*/
  createdate       datetime                 null,     /* 创建时间 */
  remark             varchar(250)             null    /* 描述,备注 */
)
CREATE TABLE productunit /* 商品计量单位表 */
(
  productunit_id   int identity(1,1)        not null, /* 计量单位编号 ,主键 */
  name             varchar(30)              not null, /* 计量单位名称 */
  employee_id      int                      not null, /* 操作员 ,外键 ( 参照 employee 表 )*/
  createdate       datetime                 null,     /* 创建时间 */
  remark             varchar(250)             null    /* 描述,备注 */
)

CREATE TABLE product    /* 商品目录表 */
(
  productlist_id   int                      not null,  /* 商品细分类编号, 外键 ( 参照 productlist 表 ) */
  product_id       int identity(1,1)        not null,  /* 商品名称编号, 主键 */
  name             varchar(30)              not null,  /* 商品名称 */
  productspec_id   int                      not null,  /* 商品规格, 外键 ( 参照 productspec 表 ) */
  productunit_id   int                      not null,  /* 计量单位, 外键 ( 参照 productunit 表 ) */
  price            money                    null,      /* 参考价格 */
  employee_id      int                      not null,  /* 操作员,   外键 ( 参照 employee 表 )*/
  createdate       datetime                 null,      /* 创建时间 */
  remark             varchar(250)             null     /* 描述,备注 */
)

CREATE TABLE product_supplier  /* 商品--供应商表 */
(
  product_id       int                      not null,   /* 商品名称编号,主键 , 外键( 参照 product 表  )*/
  supplier_id      int                      not null    /* 供应商编号 , 主键,  外键( 参照 supplier 表) */
)

CREATE TABLE employee  /* 员工表 */
(
  employee_id      int identity(1,1)        not null,  /* 员工编号 */
  dept_id          int                      not null,  /* 所属部门编号 */
  name             varchar(30)              not null,  /* 姓名 */
  duty             varchar(20)              not null,  /* 职务 */
  gender           varchar(6)               not null,  /* 性别 */
  birthdate        datetime                 not null,  /* 出生日期 */
  hiredate         datetime                 null,      /* 合同签订 日期 */
  maturedate       datetime                 null,      /* 合同到期日 */
  identitycard     varchar(20)              null,      /* 身份证号 */
  address          varchar(250)             null,      /* 住址 */
  phone            varchar(25)              null,      /* 电话 */
  email            varchar(30)              null       /* e_mail */
)


/*-///////////////////////////////////////////////////////////////////////////////////////-*/

CREATE TABLE buyorder    /* 进货合同 */
(
  buyorder_id     int identity(1,1)        not null, /* 进货合同编号 , 主键 */
  writedate       datetime                 not null, /* 合同签订日期  */
  insuredate      datetime                 not null, /* 合同生效日期  */
  enddate         datetime                 not null, /* 合同到期日期  */
  dept_id         int                      not null, /* 签订部门, 外键 ( 参照 dept 表 ) */
  supplier_id     int                      not null, /* 供应商,   外键 ( 参照 supplier 表 ) */
  employee_id     int                      not null  /* 合同主要负责人, 外键 ( 参照 employee 表) */
)
CREATE TABLE buyorder_detail  /* 进货合同明细表 */
(
  buyorder_id     int                      not null,  /* 进货合同编号,主键, 外键 ( 参照 buyorder 表 ) */
  product_id      int                      not null,  /* 所进商品编号,主键, 外键 (参照 product 表 ) */
  quantity        int                      not null,  /* 商品数量 */
  price           money                    not null   /* 商品进价 */
)



CREATE TABLE enterstock    /* 入库单表 */
(
  enterstock_id    int identity(1,1)       not null, /* 入库单编号 , 主键 */
  enterdate        datetime                not null, /* 入库时间 */
  dept_id          int                     not null, /* 入库部门 ,外键 ( 参照 dept 表 )*/
  storehouse_id    int                     not null, /* 所入仓库 ,外键 ( 参照 storehouse 表)*/
  employee_id      int                     not null  /* 入库人 ,  外键 ( 参照 employee 表)*/
  /*需添加 仓库保管员如何来验证入库单 ?? */
)

CREATE TABLE enterstock_detail /* 入库单明细 */
(
  enterstock_id    int                     not null, /* 入库单编号 , 主键, 外键 (参照 enterstock 表 )*/
  product_id       int                     not null, /* 此种商品编号,主键, 外键 (参照 product 表 ) */
  quantity         int                     not null, /* 此种商品数量 */
  price            money                   null,     /* 此种商品参考价格  */
  haveinvoice      bit                     not null, /* 此种商品有没有开发票 ( 缺省为 0 , 有没有开票 )*/
  invoicenum       varchar(30)             null      /* 发票号 */
)


CREATE TABLE backstock  /* 退库单表 */
(
  backstock_id     int identity(1,1)       not null, /* 退库单编号 , 主键 */
  backdate         datetime                not null, /* 退库时间 */
  dept_id          int                     not null, /* 退库部门 ,  外键 ( 参照 dept 表 )*/
  storehouse_id    int                     not null, /* 所退入仓库 ,外键 ( 参照 storehouse 表)*/
  employee_id      int                     not null, /* 退库人 ,    外键 ( 参照 employee 表)*/
  remark             varchar(250)            null    /* 退库原因 */

)
CREATE TABLE backstock_detail /* 退库单明细表 */
(
  backstock_id     int                     not null, /* 退库单编号 , 主键, 外键 (参照 backstock 表 )*/
  product_id       int                     not null, /* 所退商品编号,主键, 外键 (参照 product 表 ) */
  quantity         int                     not null, /* 退入数量 */
  price            money                   null      /* 参考价格 */

)

CREATE TABLE leavestock  /* 出库单表 */
(
  leavestock_id    int identity(1,1)       not null,  /* 出库单编号 , 主键, 外键 (参照 leavestock 表 )*/
  leavedate        datetime                not null,  /* 出库时间 */
  dept_id          int                     not null,  /* 出库部门 ,  外键 ( 参照 dept 表 )*/
  storehouse_id    int                     not null,  /* 所出仓库 ,外键 ( 参照 storehouse 表)*/
  tostorehouse_id  int                     not null,  /* 所入仓库 ,外键 ( 参照 storehouse 表)*/
  employee_id      int                     not null   /* 出库人 ,    外键 ( 参照 employee 表)*/
  /* 仓库保管员如何来验证出库单 ?? */
)

CREATE TABLE leavestock_detail  /* 出库单明细表 */
(
  leavestock_id    int                     not null,  /* 出库单编号 , 主键, 外键 (参照 backstock 表 )*/
  product_id       int                     not null,  /* 所出商品编号,主键, 外键 (参照 product 表 ) */
  quantity         int                     not null,  /* 出库数量 */
  price            money                   null       /* 出库价格 */
)

CREATE TABLE backsale  /* 退货单表 */
(
  backsale_id      int identity(1,1)       not null,  /* 退货单编号 , 主键 */
  backdate         datetime                not null,  /* 退货日期  */
  dept_id          int                     not null,  /* 退货部门 ,  外键 ( 参照 dept 表 )*/
  storehouse_id    int                     not null,  /* 退入仓库 ,  外键 ( 参照 storehouse 表)*/
  employee_id      int                     not null,  /* 退货人 ,    外键 ( 参照 employee 表)*/
  remark             varchar(250)            null     /* 退货原因 */

)
CREATE TABLE backsale_detail  /* 退货单明细表 */
(
  backsale_id      int                     not null,  /* 退货单编号 , 主键, 外键 (参照 backstock 表 )*/
  product_id       int                     not null,  /* 所退商品编号,主键, 外键 (参照 product 表 ) */
  quantity         int                     not null,  /* 退货数量 */
  price            money                   null       /* 价格 */

)


CREATE TABLE saleorder    /* 销售合同 */
(
  saleorder_id     int identity(1,1)       not null,  /* 合同编号 , 主键 */
  writedate        datetime                not null,  /* 合同签订日期  */
  insuredate       datetime                not null,  /* 合同生效日期  */
  enddate          datetime                not null,  /* 合同到期日期  */
  dept_id          int                     not null,  /* 签订部门, 外键 ( 参照 dept 表 ) */
  customer_id      int                     not null,  /* 客户编号, 外键 ( 参照 customer 表 ) */
  employee_id      int                     not null   /* 合同主要负责人, 外键 ( 参照 employee 表) */
)
CREATE TABLE saleorder_detail  /* 销售合同明细表 */
(
  saleorder_id     int                     not null,  /* 销售合同编号,主键, 外键 ( 参照 buyorder 表 ) */
  product_id       int                     not null,  /* 销售商品编号,主键, 外键 (参照 product 表 ) */
  quantity         int                     not null,  /* 商品数量 */
  price            money                   null       /* 商品进价 */
)


CREATE TABLE buy     /* 进货表 ( 验货表 ) */
(
   buy_id          int identity(1,1)         not null, /* 进货编号 , 主键 */
   comedate        datetime                  not null, /* 进货日期 */
   dept_id         int                       not null, /* 进货部门, 外键 ( 参照 dept 表 ) */
   employee_id     int                       not null  /* 验货人,   外键 ( 参照 employee 表)*/
)

CREATE TABLE buy_detail  /* 进货表明细 ( 验货表 ) */
(
  buy_id           int                      not null, /* 进货编号,主键, 外键 ( 参照 buy 表 ) */
  product_id       int                      not null, /* 商品编号,主键, 外键 ( 参照 product 表 ) */
  buyorder_id      int                      null,     /* 采购合同,  外键 ( 参照 buyorder 表 ) */
  quantity         int                      not null, /* 数量 */
  price            money                    null      /* 价格 */

  /* buyorder_id 为 null 时, 为现金进货 */
)

CREATE TABLE sale   /* 销售 表 */
(
  sale_id          int identity(1,1)        not null,  /* 销售 编号  */
  saledate         datetime                 not null,  /* 销售 日期 */
  dept_id          int                      not null,  /* 销售部门, 外键 ( 参照 dept 表 ) */
  employee_id      int                      not null   /* 售货人,   外键 ( 参照 employee 表)*/
)

CREATE TABLE sale_detail  /* 销售明细 ( 验货表 ) */
(
  sale_id          int                      not null,  /* 销售编号,主键, 外键 ( 参照 sale 表 ) */
  product_id       int                      not null,  /* 商品编号,主键, 外键 ( 参照 product 表 ) */
  saleorder_id     int                      null,      /* 销售合同, 外键 ( 参照 saleorder 表 ) */
  quantity         int                      not null,  /* 数量 */
  price            money                    not null,  /* 价格 */
  discount         int                      null       /* 折扣 */

  /* saleorder_id 为 null 时, 为现金销售 */
)


CREATE TABLE stockpile  /* 库存表 */
(
  stockpile_id     int identity(1,1)        not null, /* 库存编号 , 主键 */
  dept_id          int                      not null, /* 商品所属部门, 外键 ( 参照 dept 表 ) */
  storehouse_id    int                      not null, /* 所在仓库,     外键 ( 参照 sotrehouse 表 ) */
  product_id       int                      not null, /* 商品编号,     外键 ( 参照 product 表 ) */
  firstenterdate   datetime                 not null, /* 此种商品第一次入库时间 */
  lastleavedate    datetime                 null,     /* 此种商品最后一次出库时间 */
  quantity         int                      not null, /* 所存数量 */
  price            money                    not null  /* 加权价 */
  /* lastleavedate 为null 时,此种商品从来没有 卖过 */
)