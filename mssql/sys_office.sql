CREATE TABLE [dbo].[sys_office] (
[id] varchar(192) COLLATE Chinese_PRC_CI_AS NOT NULL ,
[parent_id] varchar(192) COLLATE Chinese_PRC_CI_AS NOT NULL ,
[parent_ids] ntext COLLATE Chinese_PRC_CI_AS NOT NULL ,
[name] varchar(300) COLLATE Chinese_PRC_CI_AS NOT NULL ,
[sort] numeric(10) NOT NULL ,
[area_id] varchar(192) COLLATE Chinese_PRC_CI_AS NOT NULL ,
[code] varchar(300) COLLATE Chinese_PRC_CI_AS NULL ,
[type] varchar(3) COLLATE Chinese_PRC_CI_AS NOT NULL ,
[grade] varchar(3) COLLATE Chinese_PRC_CI_AS NOT NULL ,
[address] varchar(765) COLLATE Chinese_PRC_CI_AS NULL ,
[zip_code] varchar(300) COLLATE Chinese_PRC_CI_AS NULL ,
[master] varchar(300) COLLATE Chinese_PRC_CI_AS NULL ,
[phone] varchar(600) COLLATE Chinese_PRC_CI_AS NULL ,
[fax] varchar(600) COLLATE Chinese_PRC_CI_AS NULL ,
[email] varchar(600) COLLATE Chinese_PRC_CI_AS NULL ,
[USEABLE] varchar(192) COLLATE Chinese_PRC_CI_AS NULL ,
[PRIMARY_PERSON] varchar(192) COLLATE Chinese_PRC_CI_AS NULL ,
[DEPUTY_PERSON] varchar(192) COLLATE Chinese_PRC_CI_AS NULL ,
[create_by] varchar(192) COLLATE Chinese_PRC_CI_AS NOT NULL ,
[create_date] datetime NULL ,
[update_by] varchar(192) COLLATE Chinese_PRC_CI_AS NOT NULL ,
[update_date] datetime NULL ,
[remarks] varchar(765) COLLATE Chinese_PRC_CI_AS NULL ,
[del_flag] varchar(3) COLLATE Chinese_PRC_CI_AS NOT NULL DEFAULT ('0') ,
CONSTRAINT [PK_sys_office] PRIMARY KEY ([id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX [sys_office_del_flag] ON [dbo].[sys_office]
([del_flag] ASC) 
ON [PRIMARY]
GO

CREATE INDEX [sys_office_parent_id] ON [dbo].[sys_office]
([parent_id] ASC) 
ON [PRIMARY]
GO

CREATE INDEX [sys_office_type] ON [dbo].[sys_office]
([type] ASC) 
ON [PRIMARY]
GO

INSERT INTO [sys_office] ([id], [parent_id], [parent_ids], [name], [sort], [area_id], [code], [type], [grade], [address], [zip_code], [master], [phone], [fax], [email], [USEABLE], [PRIMARY_PERSON], [DEPUTY_PERSON], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag]) VALUES ('1', '0', '0,', '厦门中施信', 10, 'e418dc99691d4e29961d53ca218ece8b', '100000', '4', '1', '', '', '', '', '', '', '1', '', '', 'c03057cd933147e89b4fed729d4c9ec5', '2013-5-27 08:00:00', 'c03057cd933147e89b4fed729d4c9ec5', '2016-10-27 22:18:00', '', '0');
GO
INSERT INTO [sys_office] ([id], [parent_id], [parent_ids], [name], [sort], [area_id], [code], [type], [grade], [address], [zip_code], [master], [phone], [fax], [email], [USEABLE], [PRIMARY_PERSON], [DEPUTY_PERSON], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag]) VALUES ('3350a1c7ee714b4c9d6318a3c9f7b200', 'e0ef8af9cae6416f8bb359714a1b4244', '0,1,e0ef8af9cae6416f8bb359714a1b4244,', '财务', 30, 'e418dc99691d4e29961d53ca218ece8b', '001', '2', '1', '', '', '', '', '', '', '1', '1', '', 'c023eac570ea4ec5bfadf96f79d166fc', '2016-9-25 21:29:27', 'c03057cd933147e89b4fed729d4c9ec5', '2016-10-27 22:18:15', '', '0');
GO
INSERT INTO [sys_office] ([id], [parent_id], [parent_ids], [name], [sort], [area_id], [code], [type], [grade], [address], [zip_code], [master], [phone], [fax], [email], [USEABLE], [PRIMARY_PERSON], [DEPUTY_PERSON], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag]) VALUES ('4', '1', '0,1,', '财务科', 30, '17e8e72326574a0ea94b15d6eeddbb6d', '100003', '2', '1', '', '', '', '', '', '', '1', '', '', 'c03057cd933147e89b4fed729d4c9ec5', '2013-5-27 08:00:00', 'c023eac570ea4ec5bfadf96f79d166fc', '2016-9-25 21:28:37', '', '0');
GO
INSERT INTO [sys_office] ([id], [parent_id], [parent_ids], [name], [sort], [area_id], [code], [type], [grade], [address], [zip_code], [master], [phone], [fax], [email], [USEABLE], [PRIMARY_PERSON], [DEPUTY_PERSON], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag]) VALUES ('5', '1', '0,1,', '技术', 40, 'e418dc99691d4e29961d53ca218ece8b', '100004', '2', '1', '', '', '', '', '', '', '1', '', '', 'c03057cd933147e89b4fed729d4c9ec5', '2013-5-27 08:00:00', 'c023eac570ea4ec5bfadf96f79d166fc', '2016-9-25 21:31:05', '', '0');
GO
INSERT INTO [sys_office] ([id], [parent_id], [parent_ids], [name], [sort], [area_id], [code], [type], [grade], [address], [zip_code], [master], [phone], [fax], [email], [USEABLE], [PRIMARY_PERSON], [DEPUTY_PERSON], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag]) VALUES ('6a642e140e40496a8d467c646b8e935e', '1', '0,1,', '生物', 30, '17e8e72326574a0ea94b15d6eeddbb6d', '1000', '2', '1', '', '', '', '', '', '', '1', '', '', 'c03057cd933147e89b4fed729d4c9ec5', '2015-12-3 18:10:13', 'c023eac570ea4ec5bfadf96f79d166fc', '2016-9-25 21:30:01', '', '0');
GO
INSERT INTO [sys_office] ([id], [parent_id], [parent_ids], [name], [sort], [area_id], [code], [type], [grade], [address], [zip_code], [master], [phone], [fax], [email], [USEABLE], [PRIMARY_PERSON], [DEPUTY_PERSON], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag]) VALUES ('e0ef8af9cae6416f8bb359714a1b4244', '1', '0,1,', '人事科', 30, 'e418dc99691d4e29961d53ca218ece8b', '', '2', '1', '', '', '', '', '', '', '1', '', '', 'c03057cd933147e89b4fed729d4c9ec5', '2015-11-11 17:41:41', 'c023eac570ea4ec5bfadf96f79d166fc', '2016-9-25 21:24:36', '', '0');
GO
