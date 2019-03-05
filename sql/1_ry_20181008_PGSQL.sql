-- ----------------------------
-- 1、部门表
-- ----------------------------
CREATE SEQUENCE if not exists daimler.seq_sys_dept
  INCREMENT BY 1
  MINVALUE 110
  MAXVALUE 9223372036854775807
  START 110;

drop table if exists sys_dept;
create table sys_dept (
                        dept_id 			int 		    not null default nextval('daimler.seq_sys_dept'::regclass),
                        parent_id 		int 		    default 0 	,
                        ancestors 		varchar(50)     default '' 	,
                        dept_name 		varchar(30) 	default '' 	,
                        order_num 		int 			default 0 	,
                        leader            varchar(20)     default ''  ,
                        phone             varchar(11)     default ''  ,
                        email             varchar(50)     default ''  ,
                        status 			char(1) 		default '0'	,
                        del_flag			char(1) 		default '0'	,
                        create_by         varchar(64)     default ''  ,
                        create_time 	    timestamp                   ,
                        update_by         varchar(64)     default ''  ,
                        update_time       timestamp                   ,
                        primary key (dept_id)
);

COMMENT ON COLUMN sys_dept.dept_id is '部门id';
COMMENT ON COLUMN sys_dept.parent_id is '父部门id';
COMMENT ON COLUMN sys_dept.ancestors is '祖级列表';
COMMENT ON COLUMN sys_dept.dept_name is '部门名称';
COMMENT ON COLUMN sys_dept.order_num is '显示顺序';
COMMENT ON COLUMN sys_dept.leader is '负责人';
COMMENT ON COLUMN sys_dept.phone  is '联系电话';
COMMENT ON COLUMN sys_dept.email  is '邮箱';
COMMENT ON COLUMN sys_dept.status is '部门状态（0正常 1停用）';
COMMENT ON COLUMN sys_dept.del_flag is '删除标志（0代表存在 2代表删除）';
COMMENT ON COLUMN sys_dept.create_by  is '创建者';
COMMENT ON COLUMN sys_dept.create_time  is '创建时间';
COMMENT ON COLUMN sys_dept.update_by is '更新者';
COMMENT ON COLUMN sys_dept.update_time IS '更新时间';
COMMENT ON TABLE daimler.sys_dept IS '部门表' ;

-- ----------------------------
-- 初始化-部门表数据
-- ----------------------------
insert into sys_dept values(100,  0,   '0',          '戴姆勒',   0, '戴姆勒', '15888888888', 'daimler@qq.com', '0', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000');
insert into sys_dept values(101,  100, '0,100',      '深圳总公司', 1, '戴姆勒', '15888888888', 'daimler@daimler.com', '0', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000');
insert into sys_dept values(102,  100, '0,100',      '长沙分公司', 2, '戴姆勒', '15888888888', 'daimler@daimler.com', '0', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000');
insert into sys_dept values(103,  101, '0,100,101',  '研发部门',   1, '戴姆勒', '15888888888', 'daimler@daimler.com', '0', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000');
insert into sys_dept values(104,  101, '0,100,101',  '市场部门',   2, '戴姆勒', '15888888888', 'daimler@daimler.com', '0', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000');
insert into sys_dept values(105,  101, '0,100,101',  '测试部门',   3, '戴姆勒', '15888888888', 'daimler@daimler.com', '0', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000');
insert into sys_dept values(106,  101, '0,100,101',  '财务部门',   4, '戴姆勒', '15888888888', 'daimler@daimler.com', '0', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000');
insert into sys_dept values(107,  101, '0,100,101',  '运维部门',   5, '戴姆勒', '15888888888', 'daimler@daimler.com', '0', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000');
insert into sys_dept values(108,  102, '0,100,102',  '市场部门',   1, '戴姆勒', '15888888888', 'daimler@daimler.com', '0', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000');
insert into sys_dept values(109,  102, '0,100,102',  '财务部门',   2, '戴姆勒', '15888888888', 'daimler@daimler.com', '0', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000');

-- ----------------------------
-- 2、用户信息表
-- ----------------------------
CREATE SEQUENCE if not exists daimler.seq_sys_user
  INCREMENT BY 1
  MINVALUE 3
  MAXVALUE 9223372036854775807
  START 3;

drop table if exists sys_user;
create table sys_user (
                        user_id 			int 		default nextval('daimler.seq_sys_user'::regclass),
                        dept_id 			int 		default null,
                        login_name 		varchar(30) 	not null,
                        user_name 		varchar(30) 	not null,
                        user_type 		varchar(2) 	    default '00' ,
                        email  			varchar(50) 	default '' 	,
                        phonenumber  		varchar(11) 	default '' 	,
                        sex  		        char(1) 	    default '0' ,
                        avatar            varchar(100) 	default '' 	,
                        password 			varchar(50) 	default '' 	,
                        salt 				varchar(20) 	default '' 	,
                        status 			char(1) 		default '0' ,
                        del_flag			char(1) 		default '0' ,
                        login_ip          varchar(20)     default ''  ,
                        login_date        timestamp                    ,
                        create_by         varchar(64)     default ''   ,
                        create_time 	    timestamp                    ,
                        update_by         varchar(64)     default ''   ,
                        update_time       timestamp                   ,
                        remark 		    varchar(500) 	default '' 	,
                        primary key (user_id)
);

COMMENT ON COLUMN sys_user.user_id 			   is '用户ID';
COMMENT ON COLUMN sys_user.dept_id 			   is '部门ID';
COMMENT ON COLUMN sys_user.login_name 		   is '登录账号';
COMMENT ON COLUMN sys_user.user_name 		   is '用户昵称';
COMMENT ON COLUMN sys_user.user_type 	    is '用户类型（00系统用户）';
COMMENT ON COLUMN sys_user.email  			   is '用户邮箱';
COMMENT ON COLUMN sys_user.phonenumber  		   is '手机号码';
COMMENT ON COLUMN sys_user.sex  		    	   is '用户性别（0男 1女 2未知）';
COMMENT ON COLUMN sys_user.avatar        	   is '头像路径';
COMMENT ON COLUMN sys_user.password 			   is '密码';
COMMENT ON COLUMN sys_user.salt 				   is '盐加密';
COMMENT ON COLUMN sys_user.status 			   is '帐号状态（0正常 1停用）';
COMMENT ON COLUMN sys_user.del_flag			   is '删除标志（0代表存在 2代表删除）';
COMMENT ON COLUMN sys_user.login_ip           is '最后登陆IP';
COMMENT ON COLUMN sys_user.login_date        is '最后登陆时间';
COMMENT ON COLUMN sys_user.create_by      	 is '创建者';
COMMENT ON COLUMN sys_user.create_time 	 is '创建时间';
COMMENT ON COLUMN sys_user.update_by      	is '更新者';
COMMENT ON COLUMN sys_user.update_time   	is '更新时间';
COMMENT ON COLUMN sys_user.remark 		    is '备注';
COMMENT ON TABLE daimler.sys_user is '用户信息表' ;

-- ----------------------------
-- 初始化-用户信息表数据
-- ----------------------------
insert into sys_user values(1,  103, 'admin', '戴姆勒_admin', '00', 'daimler@daimler.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2019-03-01 16:30:00.000', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '管理员');
insert into sys_user values(2,  105, 'daimler',    '戴姆勒_tester', '00', 'daimler@daimler.com',  '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2019-03-01 16:30:00.000', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000',  '测试员');


-- ----------------------------
-- 3、岗位信息表
-- ----------------------------

CREATE SEQUENCE if not exists daimler.seq_sys_post
  INCREMENT BY 1
  MINVALUE 5
  MAXVALUE 9223372036854775807
  START 5;

drop table if exists sys_post;
create table sys_post
(
  post_id       int             not null default nextval('daimler.seq_sys_post'::regclass),
  post_code     varchar(64)     not null                  ,
  post_name     varchar(50)     not null                  ,
  post_sort     int             not null                  ,
  status        char(1)         not null                  ,
  create_by     varchar(64)     default ''                ,
  create_time   timestamp                                  ,
  update_by     varchar(64) 	  default ''			    ,
  update_time   timestamp                                  ,
  remark 		    varchar(500) 	  default '' 				,
  primary key (post_id)
);

COMMENT ON COLUMN sys_post.post_id 			   is '岗位ID';
COMMENT ON COLUMN sys_post.post_code 			   is '岗位编码';
COMMENT ON COLUMN sys_post.post_name 		   is '岗位名称';
COMMENT ON COLUMN sys_post.post_sort 		   is '显示顺序';
COMMENT ON COLUMN sys_post.status 	    is '状态（0正常 1停用）';
COMMENT ON COLUMN sys_post.create_by  			   is '创建者';
COMMENT ON COLUMN sys_post.create_time  		   is '创建时间';
COMMENT ON COLUMN sys_post.update_by  		    	   is '更新者';
COMMENT ON COLUMN sys_post.update_time        	   is '更新时间';
COMMENT ON COLUMN sys_post.remark        	   is '备注';
COMMENT ON TABLE daimler.sys_post IS '岗位信息表';

-- ----------------------------
-- 初始化-岗位信息表数据
-- ----------------------------
insert into sys_post values(1, 'ceo',  '董事长',    1, '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_post values(2, 'pm',   '项目经理',  2, '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_post values(3, 'hr',   '人力资源',  3, '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_post values(4, 'user', '普通员工',  4, '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');


-- ----------------------------
-- 4、角色信息表
-- ----------------------------
CREATE SEQUENCE if not exists daimler.seq_sys_role
  INCREMENT BY 1
  MINVALUE 3
  MAXVALUE 9223372036854775807
  START 3;

drop table if exists sys_role;
create table sys_role (
                        role_id 			int 			not null  default nextval('daimler.seq_sys_role'::regclass),
                        role_name 		varchar(30) 	not null,
                        role_key 		    varchar(100) 	not null,
                        role_sort         int          	not null,
                        data_scope        char(1) 	    default '1',
                        status 			char(1) 		not null,
                        del_flag			char(1) 		default '0',
                        create_by         varchar(64)     default '',
                        create_time 		timestamp                 ,
                        update_by 		varchar(64) 	default '',
                        update_time 		timestamp                 ,
                        remark 			varchar(500) 	default '' ,
                        primary key (role_id)
);

COMMENT ON COLUMN sys_role.role_id 	is '角色ID';
COMMENT ON COLUMN sys_role.role_name is '角色名称';
COMMENT ON COLUMN sys_role.role_key 	is '角色权限字符串';
COMMENT ON COLUMN sys_role.role_sort 	is '显示顺序';
COMMENT ON COLUMN sys_role.data_scope  		is '数据范围（1：全部数据权限 2：自定数据权限）';
COMMENT ON COLUMN sys_role.status is '角色状态（0正常 1停用）';
COMMENT ON COLUMN sys_role.del_flag  		is '删除标志（0代表存在 2代表删除）';
COMMENT ON COLUMN sys_role.create_by     is '创建者';
COMMENT ON COLUMN sys_role.create_time 	 is '创建时间';
COMMENT ON COLUMN sys_role.update_by 		is '更新者';
COMMENT ON COLUMN sys_role.update_time 		 is '更新时间';
COMMENT ON COLUMN sys_role.remark	is '备注';
COMMENT ON TABLE daimler.sys_role IS '角色信息表';
-- ----------------------------
-- 初始化-角色信息表数据
-- ----------------------------
insert into sys_role values('1', '管理员',   'admin',  1, 1, '0', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '管理员');
insert into sys_role values('2', '普通角色', 'common', 2, 2, '0', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '普通角色');


-- ----------------------------
-- 5、菜单权限表
-- ----------------------------
CREATE SEQUENCE if not exists daimler.seq_sys_menu
  INCREMENT BY 1
  MINVALUE 1056
  MAXVALUE 9223372036854775807
  START 1056;


drop table if exists sys_menu;
create table sys_menu (
                        menu_id 			int 		not null default nextval('daimler.seq_sys_menu'::regclass),
                        menu_name 		varchar(50) 	not null,
                        parent_id 		int 		default 0,
                        order_num 		int 			default 0,
                        url 				varchar(200) 	default '#',
                        menu_type 		char(1) 		default '',
                        visible 			int4 		default 0,
                        perms 			varchar(100) 	default '',
                        icon 				varchar(100) 	default '#',
                        create_by         varchar(64)     default '',
                        create_time 		timestamp                  ,
                        update_by 		varchar(64) 	default '',
                        update_time 		timestamp                 ,
                        remark 			varchar(500) 	default '',
                        primary key (menu_id)
);


COMMENT ON COLUMN sys_menu.menu_id is '菜单ID';
COMMENT ON COLUMN sys_menu.menu_name is '菜单名称';
COMMENT ON COLUMN sys_menu.parent_id is '父菜单ID';
COMMENT ON COLUMN sys_menu.order_num is '显示顺序';
COMMENT ON COLUMN sys_menu.url is '请求地址';
COMMENT ON COLUMN sys_menu.menu_type is '菜单类型（M目录 C菜单 F按钮）';
COMMENT ON COLUMN sys_menu.visible is '菜单状态（0显示 1隐藏）';
COMMENT ON COLUMN sys_menu.perms is '权限标识';
COMMENT ON COLUMN sys_menu.icon is '菜单图标';
COMMENT ON COLUMN sys_menu.create_by is '创建者';
COMMENT ON COLUMN sys_menu.create_time is '创建时间';
COMMENT ON COLUMN sys_menu.update_by is '更新者';
COMMENT ON COLUMN sys_menu.update_time is '更新时间';
COMMENT ON COLUMN sys_menu.remark is '备注';
COMMENT ON TABLE daimler.sys_menu IS '菜单权限表';
-- ----------------------------
-- 初始化-菜单信息表数据
-- ----------------------------
-- 一级菜单
insert into sys_menu values('1', '系统管理', '0', '1', '#', 'M', '0', '', 'fa fa-gear',         'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '系统管理目录');
insert into sys_menu values('2', '系统监控', '0', '2', '#', 'M', '0', '', 'fa fa-video-camera', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '系统监控目录');
insert into sys_menu values('3', '系统工具', '0', '3', '#', 'M', '0', '', 'fa fa-bars',         'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '系统工具目录');
-- 二级菜单
insert into sys_menu values('100',  '用户管理', '1', '1', '/system/user',        'C', '0', 'system:user:view',         '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '用户管理菜单');
insert into sys_menu values('101',  '角色管理', '1', '2', '/system/role',        'C', '0', 'system:role:view',         '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '角色管理菜单');
insert into sys_menu values('102',  '菜单管理', '1', '3', '/system/menu',        'C', '0', 'system:menu:view',         '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '菜单管理菜单');
insert into sys_menu values('103',  '部门管理', '1', '4', '/system/dept',        'C', '0', 'system:dept:view',         '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '部门管理菜单');
insert into sys_menu values('104',  '岗位管理', '1', '5', '/system/post',        'C', '0', 'system:post:view',         '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '岗位管理菜单');
insert into sys_menu values('105',  '字典管理', '1', '6', '/system/dict',        'C', '0', 'system:dict:view',         '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '字典管理菜单');
insert into sys_menu values('106',  '参数设置', '1', '7', '/system/config',      'C', '0', 'system:config:view',       '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '参数设置菜单');
insert into sys_menu values('107',  '通知公告', '1', '8', '/system/notice',      'C', '0', 'system:notice:view',       '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '通知公告菜单');
insert into sys_menu values('108',  '日志管理', '1', '9', '#',                   'M', '0', '',                         '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '日志管理菜单');
insert into sys_menu values('109',  '在线用户', '2', '1', '/monitor/online',     'C', '0', 'monitor:online:view',      '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '在线用户菜单');
insert into sys_menu values('110',  '定时任务', '2', '2', '/monitor/job',        'C', '0', 'monitor:job:view',         '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '定时任务菜单');
insert into sys_menu values('111',  '数据监控', '2', '3', '/monitor/data',       'C', '0', 'monitor:data:view',        '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '数据监控菜单');
insert into sys_menu values('112',  '表单构建', '3', '1', '/tool/build',         'C', '0', 'tool:build:view',          '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '表单构建菜单');
insert into sys_menu values('113',  '代码生成', '3', '2', '/tool/gen',           'C', '0', 'tool:gen:view',            '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '代码生成菜单');
insert into sys_menu values('114',  '系统接口', '3', '3', '/tool/swagger',       'C', '0', 'tool:swagger:view',        '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '系统接口菜单');
-- 三级菜单
insert into sys_menu values('500',  '操作日志', '108', '1', '/monitor/operlog',    'C', '0', 'monitor:operlog:view',     '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '操作日志菜单');
insert into sys_menu values('501',  '登录日志', '108', '2', '/monitor/logininfor', 'C', '0', 'monitor:logininfor:view',  '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '登录日志菜单');
-- 用户管理按钮
insert into sys_menu values('1000', '用户查询', '100', '1',  '#',  'F', '0', 'system:user:list',        '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1001', '用户新增', '100', '2',  '#',  'F', '0', 'system:user:add',         '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1002', '用户修改', '100', '3',  '#',  'F', '0', 'system:user:edit',        '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1003', '用户删除', '100', '4',  '#',  'F', '0', 'system:user:remove',      '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1004', '用户导出', '100', '5',  '#',  'F', '0', 'system:user:export',      '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1005', '重置密码', '100', '5',  '#',  'F', '0', 'system:user:resetPwd',    '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
-- 角色管理按钮
insert into sys_menu values('1006', '角色查询', '101', '1',  '#',  'F', '0', 'system:role:list',        '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1007', '角色新增', '101', '2',  '#',  'F', '0', 'system:role:add',         '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1008', '角色修改', '101', '3',  '#',  'F', '0', 'system:role:edit',        '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1009', '角色删除', '101', '4',  '#',  'F', '0', 'system:role:remove',      '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1010', '角色导出', '101', '4',  '#',  'F', '0', 'system:role:export',      '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
-- 菜单管理按钮
insert into sys_menu values('1011', '菜单查询', '102', '1',  '#',  'F', '0', 'system:menu:list',        '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1012', '菜单新增', '102', '2',  '#',  'F', '0', 'system:menu:add',         '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1013', '菜单修改', '102', '3',  '#',  'F', '0', 'system:menu:edit',        '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1014', '菜单删除', '102', '4',  '#',  'F', '0', 'system:menu:remove',      '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
-- 部门管理按钮
insert into sys_menu values('1015', '部门查询', '103', '1',  '#',  'F', '0', 'system:dept:list',        '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1016', '部门新增', '103', '2',  '#',  'F', '0', 'system:dept:add',         '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1017', '部门修改', '103', '3',  '#',  'F', '0', 'system:dept:edit',        '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1018', '部门删除', '103', '4',  '#',  'F', '0', 'system:dept:remove',      '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
-- 岗位管理按钮
insert into sys_menu values('1019', '岗位查询', '104', '1',  '#',  'F', '0', 'system:post:list',        '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1020', '岗位新增', '104', '2',  '#',  'F', '0', 'system:post:add',         '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1021', '岗位修改', '104', '3',  '#',  'F', '0', 'system:post:edit',        '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1022', '岗位删除', '104', '4',  '#',  'F', '0', 'system:post:remove',      '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1023', '岗位导出', '104', '4',  '#',  'F', '0', 'system:post:export',      '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
-- 字典管理按钮
insert into sys_menu values('1024', '字典查询', '105', '1', '#',  'F', '0', 'system:dict:list',         '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1025', '字典新增', '105', '2', '#',  'F', '0', 'system:dict:add',          '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1026', '字典修改', '105', '3', '#',  'F', '0', 'system:dict:edit',         '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1027', '字典删除', '105', '4', '#',  'F', '0', 'system:dict:remove',       '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1028', '字典导出', '105', '4', '#',  'F', '0', 'system:dict:export',       '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
-- 参数设置按钮
insert into sys_menu values('1029', '参数查询', '106', '1', '#',  'F', '0', 'system:config:list',      '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1030', '参数新增', '106', '2', '#',  'F', '0', 'system:config:add',       '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1031', '参数修改', '106', '3', '#',  'F', '0', 'system:config:edit',      '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1032', '参数删除', '106', '4', '#',  'F', '0', 'system:config:remove',    '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1033', '参数导出', '106', '4', '#',  'F', '0', 'system:config:export',    '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
-- 通知公告按钮
insert into sys_menu values('1034', '公告查询', '107', '1', '#',  'F', '0', 'system:notice:list',      '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1035', '公告新增', '107', '2', '#',  'F', '0', 'system:notice:add',       '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1036', '公告修改', '107', '3', '#',  'F', '0', 'system:notice:edit',      '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1037', '公告删除', '107', '4', '#',  'F', '0', 'system:notice:remove',    '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
-- 操作日志按钮
insert into sys_menu values('1038', '操作查询', '500', '1', '#',  'F', '0', 'monitor:operlog:list',    '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1039', '操作删除', '500', '2', '#',  'F', '0', 'monitor:operlog:remove',  '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1040', '详细信息', '500', '3', '#',  'F', '0', 'monitor:operlog:detail',  '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1041', '日志导出', '500', '3', '#',  'F', '0', 'monitor:operlog:export',  '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
-- 登录日志按钮
insert into sys_menu values('1042', '登录查询', '501', '1', '#',  'F', '0', 'monitor:logininfor:list',         '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1043', '登录删除', '501', '2', '#',  'F', '0', 'monitor:logininfor:remove',       '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1044', '日志导出', '501', '2', '#',  'F', '0', 'monitor:logininfor:export',       '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
-- 在线用户按钮
insert into sys_menu values('1045', '在线查询', '109', '1', '#',  'F', '0', 'monitor:online:list',             '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1046', '批量强退', '109', '2', '#',  'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1047', '单条强退', '109', '3', '#',  'F', '0', 'monitor:online:forceLogout',      '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
-- 定时任务按钮
insert into sys_menu values('1048', '任务查询', '110', '1', '#',  'F', '0', 'monitor:job:list',                '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1049', '任务新增', '110', '2', '#',  'F', '0', 'monitor:job:add',                 '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1050', '任务修改', '110', '3', '#',  'F', '0', 'monitor:job:edit',                '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1051', '任务删除', '110', '4', '#',  'F', '0', 'monitor:job:remove',              '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1052', '状态修改', '110', '5', '#',  'F', '0', 'monitor:job:changeStatus',        '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1053', '任务导出', '110', '5', '#',  'F', '0', 'monitor:job:export',              '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
-- 代码生成按钮
insert into sys_menu values('1054', '生成查询', '113', '1', '#',  'F', '0', 'tool:gen:list',  '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_menu values('1055', '生成代码', '113', '2', '#',  'F', '0', 'tool:gen:code',  '#', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');


-- ----------------------------
-- 6、用户和角色关联表  用户N-1角色
-- ----------------------------
drop table if exists sys_user_role;
create table sys_user_role (
                             user_id 	int not null ,
                             role_id 	int not null ,
                             primary key(user_id, role_id)
);

COMMENT ON COLUMN sys_user_role.user_id is '用户ID';
COMMENT ON COLUMN sys_user_role.role_id is '角色ID';
COMMENT ON TABLE daimler.sys_user_role IS '用户和角色关联表';
-- ----------------------------
-- 初始化-用户和角色关联表数据
-- ----------------------------
insert into sys_user_role values ('1', '1');
insert into sys_user_role values ('2', '2');

-- ----------------------------
-- 7、角色和菜单关联表  角色1-N菜单
-- ----------------------------
drop table if exists sys_role_menu;
create table sys_role_menu (
                             role_id 	int not null,
                             menu_id 	int not null,
                             primary key(role_id, menu_id)
);

COMMENT ON COLUMN sys_role_menu.role_id is '角色ID';
COMMENT ON COLUMN sys_role_menu.menu_id is '菜单ID';
COMMENT ON TABLE daimler.sys_role_menu is '角色和菜单关联表';
-- ----------------------------
-- 初始化-角色和菜单关联表数据
-- ----------------------------
insert into sys_role_menu values ('2', '1');
insert into sys_role_menu values ('2', '2');
insert into sys_role_menu values ('2', '3');
insert into sys_role_menu values ('2', '100');
insert into sys_role_menu values ('2', '101');
insert into sys_role_menu values ('2', '102');
insert into sys_role_menu values ('2', '103');
insert into sys_role_menu values ('2', '104');
insert into sys_role_menu values ('2', '105');
insert into sys_role_menu values ('2', '106');
insert into sys_role_menu values ('2', '107');
insert into sys_role_menu values ('2', '108');
insert into sys_role_menu values ('2', '109');
insert into sys_role_menu values ('2', '110');
insert into sys_role_menu values ('2', '111');
insert into sys_role_menu values ('2', '112');
insert into sys_role_menu values ('2', '113');
insert into sys_role_menu values ('2', '114');
insert into sys_role_menu values ('2', '500');
insert into sys_role_menu values ('2', '501');
insert into sys_role_menu values ('2', '1000');
insert into sys_role_menu values ('2', '1001');
insert into sys_role_menu values ('2', '1002');
insert into sys_role_menu values ('2', '1003');
insert into sys_role_menu values ('2', '1004');
insert into sys_role_menu values ('2', '1005');
insert into sys_role_menu values ('2', '1006');
insert into sys_role_menu values ('2', '1007');
insert into sys_role_menu values ('2', '1008');
insert into sys_role_menu values ('2', '1009');
insert into sys_role_menu values ('2', '1010');
insert into sys_role_menu values ('2', '1011');
insert into sys_role_menu values ('2', '1012');
insert into sys_role_menu values ('2', '1013');
insert into sys_role_menu values ('2', '1014');
insert into sys_role_menu values ('2', '1015');
insert into sys_role_menu values ('2', '1016');
insert into sys_role_menu values ('2', '1017');
insert into sys_role_menu values ('2', '1018');
insert into sys_role_menu values ('2', '1019');
insert into sys_role_menu values ('2', '1020');
insert into sys_role_menu values ('2', '1021');
insert into sys_role_menu values ('2', '1022');
insert into sys_role_menu values ('2', '1023');
insert into sys_role_menu values ('2', '1024');
insert into sys_role_menu values ('2', '1025');
insert into sys_role_menu values ('2', '1026');
insert into sys_role_menu values ('2', '1027');
insert into sys_role_menu values ('2', '1028');
insert into sys_role_menu values ('2', '1029');
insert into sys_role_menu values ('2', '1030');
insert into sys_role_menu values ('2', '1031');
insert into sys_role_menu values ('2', '1032');
insert into sys_role_menu values ('2', '1033');
insert into sys_role_menu values ('2', '1034');
insert into sys_role_menu values ('2', '1035');
insert into sys_role_menu values ('2', '1036');
insert into sys_role_menu values ('2', '1037');
insert into sys_role_menu values ('2', '1038');
insert into sys_role_menu values ('2', '1039');
insert into sys_role_menu values ('2', '1040');
insert into sys_role_menu values ('2', '1041');
insert into sys_role_menu values ('2', '1042');
insert into sys_role_menu values ('2', '1043');
insert into sys_role_menu values ('2', '1044');
insert into sys_role_menu values ('2', '1045');
insert into sys_role_menu values ('2', '1046');
insert into sys_role_menu values ('2', '1047');
insert into sys_role_menu values ('2', '1048');
insert into sys_role_menu values ('2', '1049');
insert into sys_role_menu values ('2', '1050');
insert into sys_role_menu values ('2', '1051');
insert into sys_role_menu values ('2', '1052');
insert into sys_role_menu values ('2', '1053');
insert into sys_role_menu values ('2', '1054');
insert into sys_role_menu values ('2', '1055');


-- ----------------------------
-- 8、角色和部门关联表  角色1-N部门
-- ----------------------------
drop table if exists sys_role_dept;
create table sys_role_dept (
                             role_id 	int not null,
                             dept_id 	int not null,
                             primary key(role_id, dept_id)
);

COMMENT ON COLUMN sys_role_dept.role_id is '角色ID';
COMMENT ON COLUMN sys_role_dept.dept_id is '部门ID';
COMMENT ON TABLE daimler.sys_role_dept is '角色和部门关联表';

-- ----------------------------
-- 初始化-角色和部门关联表数据
-- ----------------------------
insert into sys_role_dept values ('2', '100');
insert into sys_role_dept values ('2', '101');
insert into sys_role_dept values ('2', '105');

-- ----------------------------
-- 9、用户与岗位关联表  用户1-N岗位
-- ----------------------------
drop table if exists sys_user_post;
create table sys_user_post
(
  user_id int not null,
  post_id int not null,
  primary key (user_id, post_id)
);
COMMENT ON COLUMN sys_user_post.user_id is '用户ID';
COMMENT ON COLUMN sys_user_post.post_id is '岗位ID';
COMMENT ON TABLE daimler.sys_user_post is '用户与岗位关联表';

-- ----------------------------
-- 初始化-用户与岗位关联表数据
-- ----------------------------
insert into sys_user_post values ('1', '1');
insert into sys_user_post values ('2', '2');


-- ----------------------------
-- 10、操作日志记录
-- ----------------------------
CREATE SEQUENCE if not exists daimler.seq_sys_oper_log
  INCREMENT BY 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1;

drop table if exists sys_oper_log;
create table sys_oper_log (
                            oper_id 			int 		not null default nextval('daimler.seq_sys_oper_log'::regclass),
                            title             varchar(50)     default ''                ,
                            business_type     int          default 0                  ,
                            method            varchar(100)    default ''                ,
                            operator_type     int          default 0                  ,
                            oper_name 	    varchar(50)     default '' 		 	 	  ,
                            dept_name 		varchar(50)     default '' 		 	 	   ,
                            oper_url 		    varchar(255) 	default '' 				  ,
                            oper_ip 			varchar(30) 	default '' 				   ,
                            oper_location     varchar(255)    default ''                 ,
                            oper_param 		varchar(255) 	default '' 				   ,
                            status 			int 		    default 0				   ,
                            error_msg 		varchar(2000) 	default '' 				  ,
                            oper_time 		timestamp                                 ,
                            primary key (oper_id)
) ;

COMMENT ON COLUMN sys_oper_log.oper_id is '日志主键';
COMMENT ON COLUMN sys_oper_log.title is '模块标题';
COMMENT ON COLUMN sys_oper_log.business_type is '业务类型（0其它 1新增 2修改 3删除）';
COMMENT ON COLUMN sys_oper_log.method is '方法名称';
COMMENT ON COLUMN sys_oper_log.operator_type is '操作类别（0其它 1后台用户 2手机端用户）';
COMMENT ON COLUMN sys_oper_log.oper_name is '操作人员';
COMMENT ON COLUMN sys_oper_log.dept_name is '部门名称';
COMMENT ON COLUMN sys_oper_log.oper_url is '请求URL';
COMMENT ON COLUMN sys_oper_log.oper_ip is '主机地址';
COMMENT ON COLUMN sys_oper_log.oper_location is '操作地点';
COMMENT ON COLUMN sys_oper_log.oper_param is '请求参数';
COMMENT ON COLUMN sys_oper_log.status is '操作状态（0正常 1异常）';
COMMENT ON COLUMN sys_oper_log.error_msg is '错误消息';
COMMENT ON COLUMN sys_oper_log.oper_time is '操作时间';
COMMENT ON TABLE daimler.sys_oper_log is '操作日志记录';


-- ----------------------------
-- 11、字典类型表
-- ----------------------------
CREATE SEQUENCE if not exists daimler.seq_sys_dict_type
  INCREMENT BY 100
  MINVALUE 10
  MAXVALUE 9223372036854775807
  START 10;

drop table if exists sys_dict_type;
create table sys_dict_type
(
  dict_id          int 		 not null default nextval('daimler.seq_sys_dict_type'::regclass),
  dict_name        varchar(100)    default '' ,
  dict_type        varchar(100)    default '' ,
  status 			 char(1) 		 default '0',
  create_by        varchar(64)     default '',
  create_time      timestamp                 ,
  update_by        varchar(64) 	 default '',
  update_time      timestamp                ,
  remark 	         varchar(500) 	 default '',
  primary key (dict_id),
  unique (dict_type)
);

COMMENT ON COLUMN sys_dict_type.dict_id is '字典主键';
COMMENT ON COLUMN sys_dict_type.dict_name is '字典名称';
COMMENT ON COLUMN sys_dict_type.dict_type is '字典类型';
COMMENT ON COLUMN sys_dict_type.status is '状态（0正常 1停用）';
COMMENT ON COLUMN sys_dict_type.create_by is '创建者';
COMMENT ON COLUMN sys_dict_type.create_time is '创建时间';
COMMENT ON COLUMN sys_dict_type.update_by is '更新者';
COMMENT ON COLUMN sys_dict_type.update_time is '更新时间';
COMMENT ON TABLE daimler.sys_dict_type is '字典类型表';

insert into sys_dict_type values(1,  '用户性别', 'sys_user_sex',        '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '用户性别列表');
insert into sys_dict_type values(2,  '菜单状态', 'sys_show_hide',       '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '菜单状态列表');
insert into sys_dict_type values(3,  '系统开关', 'sys_normal_disable',  '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '系统开关列表');
insert into sys_dict_type values(4,  '任务状态', 'sys_job_status',      '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '任务状态列表');
insert into sys_dict_type values(5,  '系统是否', 'sys_yes_no',          '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '系统是否列表');
insert into sys_dict_type values(6,  '通知类型', 'sys_notice_type',     '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '通知类型列表');
insert into sys_dict_type values(7,  '通知状态', 'sys_notice_status',   '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '通知状态列表');
insert into sys_dict_type values(8,  '操作类型', 'sys_oper_type',       '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '操作类型列表');
insert into sys_dict_type values(9,  '系统状态', 'sys_common_status',   '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '登录状态列表');


-- ----------------------------
-- 12、字典数据表
-- ----------------------------

CREATE SEQUENCE if not exists daimler.seq_sys_dict_data
  INCREMENT BY 1
  MINVALUE 27
  MAXVALUE 9223372036854775807
  START 27;

drop table if exists sys_dict_data;
create table sys_dict_data
(
  dict_code        int    		 not null default nextval('daimler.seq_sys_dict_data'::regclass),
  dict_sort        int             default 0,
  dict_label       varchar(100)    default '',
  dict_value       varchar(100)    default '',
  dict_type        varchar(100)    default '',
  css_class        varchar(100)    default '',
  list_class       varchar(100)    default '',
  is_default       char(1)         default 'N',
  status 			 char(1) 		 default '0',
  create_by        varchar(64)     default '',
  create_time      timestamp                 ,
  update_by        varchar(64) 	 default '',
  update_time      timestamp                 ,
  remark 	         varchar(500) 	 default '',
  primary key (dict_code)
);


COMMENT ON COLUMN sys_dict_data.dict_code is '字典编码';
COMMENT ON COLUMN sys_dict_data.dict_sort is '字典排序';
COMMENT ON COLUMN sys_dict_data.dict_label is '字典标签';
COMMENT ON COLUMN sys_dict_data.dict_value is '字典键值';
COMMENT ON COLUMN sys_dict_data.dict_type is '字典类型';
COMMENT ON COLUMN sys_dict_data.css_class is '样式属性（其他样式扩展）';
COMMENT ON COLUMN sys_dict_data.list_class is '表格回显样式';
COMMENT ON COLUMN sys_dict_data.is_default is '是否默认（Y是 N否）';
COMMENT ON COLUMN sys_dict_data.status is '状态（0正常 1停用）';
COMMENT ON COLUMN sys_dict_data.create_by is '创建者';
COMMENT ON COLUMN sys_dict_data.create_time is '创建时间';
COMMENT ON COLUMN sys_dict_data.update_by is '更新者';
COMMENT ON COLUMN sys_dict_data.update_time is '更新时间';
COMMENT ON COLUMN sys_dict_data.remark is '备注';
COMMENT ON TABLE daimler.sys_dict_data is '字典数据表';


insert into sys_dict_data values(1,  1,  '男',       '0',  'sys_user_sex',        '',   '',        'Y', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '性别男');
insert into sys_dict_data values(2,  2,  '女',       '1',  'sys_user_sex',        '',   '',        'N', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '性别女');
insert into sys_dict_data values(3,  3,  '未知',     '2',  'sys_user_sex',        '',   '',        'N', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '性别未知');
insert into sys_dict_data values(4,  1,  '显示',     '0',  'sys_show_hide',       '',   'primary', 'Y', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '显示菜单');
insert into sys_dict_data values(5,  2,  '隐藏',     '1',  'sys_show_hide',       '',   'danger',  'N', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '隐藏菜单');
insert into sys_dict_data values(6,  1,  '正常',     '0',  'sys_normal_disable',  '',   'primary', 'Y', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '正常状态');
insert into sys_dict_data values(7,  2,  '停用',     '1',  'sys_normal_disable',  '',   'danger',  'N', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '停用状态');
insert into sys_dict_data values(8,  1,  '正常',     '0',  'sys_job_status',      '',   'primary', 'Y', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '正常状态');
insert into sys_dict_data values(9,  2,  '暂停',     '1',  'sys_job_status',      '',   'danger',  'N', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '停用状态');
insert into sys_dict_data values(10, 1,  '是',       'Y',  'sys_yes_no',          '',   'primary', 'Y', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '系统默认是');
insert into sys_dict_data values(11, 2,  '否',       'N',  'sys_yes_no',          '',   'danger',  'N', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '系统默认否');
insert into sys_dict_data values(12, 1,  '通知',     '1',  'sys_notice_type',     '',   'warning', 'Y', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '通知');
insert into sys_dict_data values(13, 2,  '公告',     '2',  'sys_notice_type',     '',   'success', 'N', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '公告');
insert into sys_dict_data values(14, 1,  '正常',     '0',  'sys_notice_status',   '',   'primary', 'Y', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '正常状态');
insert into sys_dict_data values(15, 2,  '关闭',     '1',  'sys_notice_status',   '',   'danger',  'N', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '关闭状态');
insert into sys_dict_data values(16, 1,  '新增',     '1',  'sys_oper_type',       '',   'info',    'N', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '新增操作');
insert into sys_dict_data values(17, 2,  '修改',     '2',  'sys_oper_type',       '',   'info',    'N', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '修改操作');
insert into sys_dict_data values(18, 3,  '删除',     '3',  'sys_oper_type',       '',   'danger',  'N', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '删除操作');
insert into sys_dict_data values(19, 4,  '授权',     '4',  'sys_oper_type',       '',   'primary', 'N', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '授权操作');
insert into sys_dict_data values(20, 5,  '导出',     '5',  'sys_oper_type',       '',   'warning', 'N', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '导出操作');
insert into sys_dict_data values(21, 6,  '导入',     '6',  'sys_oper_type',       '',   'warning', 'N', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '导入操作');
insert into sys_dict_data values(22, 7,  '强退',     '7',  'sys_oper_type',       '',   'danger',  'N', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '强退操作');
insert into sys_dict_data values(23, 8,  '生成代码', '8',  'sys_oper_type',       '',   'warning', 'N', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '生成操作');
insert into sys_dict_data values(24, 8,  '清空数据', '9',  'sys_oper_type',       '',   'danger',  'N', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '清空操作');
insert into sys_dict_data values(25, 1,  '成功',     '0',  'sys_common_status',   '',   'primary', 'N', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '正常状态');
insert into sys_dict_data values(26, 2,  '失败',     '1',  'sys_common_status',   '',   'danger',  'N', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '停用状态');

-- ----------------------------
-- 13、参数配置表
-- ----------------------------

CREATE SEQUENCE if not exists daimler.seq_sys_config
  INCREMENT BY 1
  MINVALUE 3
  MAXVALUE 9223372036854775807
  START 3;

drop table if exists sys_config;
create table sys_config (
                          config_id 		   int 	     not null default nextval('daimler.seq_sys_config'::regclass),
                          config_name        varchar(100)  default '',
                          config_key         varchar(100)  default '',
                          config_value       varchar(100)  default '',
                          config_type        char(1)       default 'N',
                          create_by          varchar(64)   default '',
                          create_time 	   timestamp               ,
                          update_by          varchar(64)   default '',
                          update_time        timestamp               ,
                          remark 	           varchar(500)  default '',
                          primary key (config_id)
);

COMMENT ON COLUMN sys_config.config_id is '参数主键';
COMMENT ON COLUMN sys_config.config_name is '参数名称';
COMMENT ON COLUMN sys_config.config_key is '参数键名';
COMMENT ON COLUMN sys_config.config_value is '参数键值';
COMMENT ON COLUMN sys_config.config_type is '系统内置（Y是 N否）';
COMMENT ON COLUMN sys_config.create_by is '创建者';
COMMENT ON COLUMN sys_config.create_time is '创建时间';
COMMENT ON COLUMN sys_config.update_by is '更新者';
COMMENT ON COLUMN sys_config.update_time is '更新时间';
COMMENT ON COLUMN sys_config.remark is '备注';
COMMENT ON TABLE daimler.sys_config is '参数配置表';

insert into sys_config values(1, '主框架页-默认皮肤样式名称', 'sys.index.skinName',     'skin-default',  'Y', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '默认 skin-default、蓝色 skin-blue、黄色 skin-yellow' );
insert into sys_config values(2, '用户管理-账号初始密码',     'sys.user.initPassword',  '123456',        'Y', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '初始化密码 123456' );

-- ----------------------------
-- 14、系统访问记录
-- ----------------------------

CREATE SEQUENCE if not exists daimler.seq_sys_logininfor
  INCREMENT BY 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1;


drop table if exists sys_logininfor;
create table sys_logininfor (
                              info_id 		 int 	       not null default nextval('daimler.seq_sys_logininfor'::regclass),
                              login_name 	 varchar(50)   default '',
                              ipaddr 		 varchar(50)   default '',
                              login_location varchar(255)  default '',
                              browser  		 varchar(50)   default '',
                              os      		 varchar(50)   default '',
                              status 		 char(1) 	   default '0',
                              msg      		 varchar(255)  default '',
                              login_time 	 timestamp               ,
                              primary key (info_id)
);

COMMENT ON COLUMN sys_logininfor.info_id is '访问ID';
COMMENT ON COLUMN sys_logininfor.login_name is '登录账号';
COMMENT ON COLUMN sys_logininfor.ipaddr is '登录IP地址';
COMMENT ON COLUMN sys_logininfor.login_location is '登录地点';
COMMENT ON COLUMN sys_logininfor.browser is '浏览器类型';
COMMENT ON COLUMN sys_logininfor.os is '操作系统';
COMMENT ON COLUMN sys_logininfor.status is '登录状态（0成功 1失败）';
COMMENT ON COLUMN sys_logininfor.msg is '提示消息';
COMMENT ON COLUMN sys_logininfor.login_time is '访问时间';
COMMENT ON TABLE daimler.sys_logininfor is '系统访问记录';



-- ----------------------------
-- 15、在线用户记录
-- ----------------------------
drop table if exists sys_user_online;
create table sys_user_online (
                               sessionId 	    varchar(50)  default '',
                               login_name 	    varchar(50)  default '',
                               dept_name 		varchar(50)  default '',
                               ipaddr 		    varchar(50)  default '',
                               login_location    varchar(255) default '',
                               browser  		    varchar(50)  default '',
                               os      		    varchar(50)  default '',
                               status      	    varchar(10)  default '',
                               start_timestamp 	timestamp              ,
                               last_access_time  timestamp              ,
                               expire_time 	    int 		 default 0 ,
                               primary key (sessionId)
) ;

COMMENT ON COLUMN sys_user_online.sessionId is '用户会话id';
COMMENT ON COLUMN sys_user_online.login_name is '登录账号';
COMMENT ON COLUMN sys_user_online.dept_name is '部门名称';
COMMENT ON COLUMN sys_user_online.ipaddr is '登录IP地址';
COMMENT ON COLUMN sys_user_online.login_location is '登录地点';
COMMENT ON COLUMN sys_user_online.browser is '浏览器类型';
COMMENT ON COLUMN sys_user_online.os is '操作系统';
COMMENT ON COLUMN sys_user_online.status is '在线状态on_line在线off_line离线';
COMMENT ON COLUMN sys_user_online.start_timestamp is 'session创建时间';
COMMENT ON COLUMN sys_user_online.last_access_time is 'session最后访问时间';
COMMENT ON COLUMN sys_user_online.expire_time is '超时时间，单位为分钟';

COMMENT ON TABLE daimler.sys_user_online is '在线用户记录';


-- ----------------------------
-- 16、定时任务调度表
-- ----------------------------

CREATE SEQUENCE if not exists daimler.seq_sys_job
  INCREMENT BY 1
  MINVALUE 3
  MAXVALUE 9223372036854775807
  START 3;

drop table if exists sys_job;
create table sys_job (
                       job_id 		      int    	    not null default nextval('daimler.seq_sys_job'::regclass),
                       job_name            varchar(64)   default '',
                       job_group           varchar(64)   default '',
                       method_name         varchar(500)  default '',
                       method_params       varchar(200)  default '',
                       cron_expression     varchar(255)  default '',
                       misfire_policy      varchar(20)   default '1',
                       status              char(1)       default '0',
                       create_by           varchar(64)   default '' ,
                       create_time         timestamp                ,
                       update_by           varchar(64)   default '' ,
                       update_time         timestamp                ,
                       remark              varchar(500)  default '' ,
                       primary key (job_id, job_name, job_group)
);

COMMENT ON COLUMN sys_job.job_id is '任务ID';
COMMENT ON COLUMN sys_job.job_name is '任务名称';
COMMENT ON COLUMN sys_job.job_group is '任务组名';
COMMENT ON COLUMN sys_job.method_name is '任务方法';
COMMENT ON COLUMN sys_job.method_params is '方法参数';
COMMENT ON COLUMN sys_job.cron_expression is 'cron执行表达式';
COMMENT ON COLUMN sys_job.misfire_policy is '计划执行错误策略（1继续 2等待 3放弃）';
COMMENT ON COLUMN sys_job.status is '状态（0正常 1暂停）';
COMMENT ON COLUMN sys_job.create_by is '创建者';
COMMENT ON COLUMN sys_job.create_time is '创建时间';
COMMENT ON COLUMN sys_job.update_by is '更新者';
COMMENT ON COLUMN sys_job.update_time is '更新时间';
COMMENT ON COLUMN sys_job.remark is '备注信息';
COMMENT ON TABLE daimler.sys_job is '定时任务调度表';

insert into sys_job values(1, 'ryTask', '系统默认（无参）', 'ryNoParams',  '',   '0/10 * * * * ?', '1', '1', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');
insert into sys_job values(2, 'ryTask', '系统默认（有参）', 'ryParams',    'daimler', '0/20 * * * * ?', '1', '1', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '');


-- ----------------------------
-- 17、定时任务调度日志表
-- ----------------------------

CREATE SEQUENCE if not exists daimler.seq_sys_job_log
  INCREMENT BY 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1;

drop table if exists sys_job_log;
create table sys_job_log (
                           job_log_id          int   	    not null default nextval('daimler.seq_sys_job_log'::regclass),
                           job_name            varchar(64)   not null,
                           job_group           varchar(64)   not null,
                           method_name         varchar(500)          ,
                           method_params       varchar(200)  default '',
                           job_message         varchar(500)            ,
                           status              char(1)       default '0',
                           exception_info      text                     ,
                           create_time         timestamp                ,
                           primary key (job_log_id)
);

COMMENT ON COLUMN sys_job_log.job_log_id is '任务日志ID';
COMMENT ON COLUMN sys_job_log.job_name is '任务名称';
COMMENT ON COLUMN sys_job_log.job_group is '任务组名';
COMMENT ON COLUMN sys_job_log.method_name is '任务方法';
COMMENT ON COLUMN sys_job_log.method_params is '方法参数';
COMMENT ON COLUMN sys_job_log.job_message is '日志信息';
COMMENT ON COLUMN sys_job_log.status is '执行状态（0正常 1失败）';
COMMENT ON COLUMN sys_job_log.exception_info is '异常信息';
COMMENT ON COLUMN sys_job_log.create_time is '创建时间';
COMMENT ON TABLE daimler.sys_job_log is '定时任务调度日志表';


-- ----------------------------
-- 18、通知公告表
-- ----------------------------

CREATE SEQUENCE if not exists daimler.seq_sys_notice
  INCREMENT BY 1
  MINVALUE 3
  MAXVALUE 9223372036854775807
  START 3;

drop table if exists sys_notice;
create table sys_notice (
                          notice_id 		int 		    not null default nextval('daimler.seq_sys_notice'::regclass),
                          notice_title 		varchar(50) 	not null,
                          notice_type 		char(2) 	    not null,
                          notice_content    varchar(500)    not null,
                          status 			char(1) 		default '0',
                          create_by         varchar(64)     default '' ,
                          create_time 		timestamp                  ,
                          update_by 		varchar(64) 	default ''	,
                          update_time 		timestamp                  ,
                          remark 			varchar(255) 	default '' ,
                          primary key (notice_id)
);


COMMENT ON COLUMN sys_notice.notice_id is '公告ID';
COMMENT ON COLUMN sys_notice.notice_title is '公告标题';
COMMENT ON COLUMN sys_notice.notice_type is '公告类型（1通知 2公告）';
COMMENT ON COLUMN sys_notice.notice_content is '公告内容';
COMMENT ON COLUMN sys_notice.status is '公告状态（0正常 1关闭）';
COMMENT ON COLUMN sys_notice.create_by is '创建者';
COMMENT ON COLUMN sys_notice.create_time is '创建时间';
COMMENT ON COLUMN sys_notice.update_by is '更新者';
COMMENT ON COLUMN sys_notice.update_time is '更新时间';
COMMENT ON COLUMN sys_notice.remark is '备注信息';
COMMENT ON TABLE daimler.sys_notice is '通知公告表';

-- ----------------------------
-- 初始化-公告信息表数据
-- ----------------------------
insert into sys_notice values('1', '温馨提醒：2018-07-01 戴姆勒新版本发布啦', '2', '新版本内容', '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '管理员');
insert into sys_notice values('2', '维护通知：2018-07-01 戴姆勒系统凌晨维护', '1', '维护内容',   '0', 'admin', '2019-03-01 16:30:00.000', 'daimler', '2019-03-01 16:30:00.000', '管理员');