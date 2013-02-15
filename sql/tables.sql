CREATE TABLE tbl_acl (
id SERIAL ,
type VARCHAR(4) NOT NULL,
type_id int NOT NULL,
resource_id int NOT NULL,
action VARCHAR(5) NOT NULL,
CONSTRAINT tbl_acl_pkey PRIMARY KEY(id)
);
COMMENT ON COLUMN tbl_acl.type IS 'role ou user';
COMMENT ON COLUMN tbl_acl.action IS 'allow ou deny';

CREATE TABLE tbl_aclresources (
id SERIAL,
resource varchar(255) NOT NULL,
description TEXT NOT NULL,
aclgroup VARCHAR(255) NOT NULL,
aclgrouporder INT NOT NULL,
default_value SMALLINT NOT NULL,
CONSTRAINT tbl_aclresources_pkey PRIMARY KEY(id)
);
COMMENT ON COLUMN tbl_aclresources.default_value IS '1 para true ou 0 para false';

CREATE TABLE tbl_aclroles (
id SERIAL,
name varchar(255) NOT NULL,
roleorder int NOT NULL,
CONSTRAINT tbl_aclroles_pkey PRIMARY KEY(id)
);


CREATE TABLE tbl_users (
id SERIAL,
username VARCHAR(128) NULL,
password VARCHAR(60) NULL,
firstname VARCHAR(128) NULL,
prefix VARCHAR(20) NULL,
lastname VARCHAR(500) NULL,
gender CHAR(1) NULL,
roleid int NULL,
mail VARCHAR(256) NULL,
CONSTRAINT tbl_users_pkey PRIMARY KEY(id)
) ;
COMMENT ON COLUMN tbl_users.gender IS 'M ou F';

INSERT INTO
tbl_users
(
  id, username, "password", firstname, prefix, lastname, gender, roleid, mail
)
VALUES
(
  51618,'brito','c33367701511b4f6020ec61ded352059','Guilherme','','Brito','M',1,'brito.gui@gmail.com'
);

INSERT INTO tbl_acl (id, type, type_id, resource_id, action) VALUES(1, 'role', 1, 1, 'allow');
INSERT INTO tbl_acl (id, type, type_id, resource_id, action) VALUES(2, 'role', 1, 2, 'allow');
INSERT INTO tbl_acl (id, type, type_id, resource_id, action) VALUES(3, 'role', 1, 3, 'allow');

INSERT INTO tbl_aclresources (id, resource, description, aclgroup, aclgrouporder, default_value) VALUES(1, 'user_management', '', 'user', 0, 0);
INSERT INTO tbl_aclresources (id, resource, description, aclgroup, aclgrouporder, default_value) VALUES(2, 'relation_manager', '', 'relations', 0, 0);

INSERT INTO tbl_aclroles (id, name, roleorder) VALUES
(1, 'Admin', 1),
(2, 'User', 2),
(3, 'Guest', 3);


DROP TABLE IF EXISTS pages;
CREATE TABLE pages (
  id SERIAL NOT NULL ,
  title varchar(50) DEFAULT NULL,
  controller varchar(50) DEFAULT NULL,
  view varchar(50) DEFAULT '',
  url varchar(50) DEFAULT NULL,
  menu varchar(50) DEFAULT NULL,
  module varchar(50) DEFAULT NULL,
  "order" int DEFAULT NULL,
  require_login int DEFAULT '0',
  group_id int DEFAULT '0',
  parent_id int DEFAULT NULL,
  active int DEFAULT '1',
  CONSTRAINT pages_pkey PRIMARY KEY (id)
) ;
--
-- Dumping data for table pages
--

INSERT INTO pages VALUES(1, 'Home', 'welcome', '', NULL, 'main','', 1, 0, 0, NULL, 1);
INSERT INTO pages VALUES(16, 'Admin Control Panel', 'auth', '', NULL, NULL,'', NULL, 0, 1, NULL, 1);
INSERT INTO pages VALUES(9, 'Home', 'welcome', '', NULL, 'bottom','', 0, 1, 0, NULL, 1);