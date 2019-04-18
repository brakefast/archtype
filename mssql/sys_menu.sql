INSERT INTO [sys_menu] ([id], [parent_id], [parent_ids], [menu_no], [name], [alias_name], [level_num], [type], [sort], [href], [target], [icon], [is_show], [permission], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [right_id], [module_no], [group_no]) VALUES ('0', '-1', NULL, NULL, '功能菜单', '功能菜单', -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL);
GO
INSERT INTO [sys_menu] ([id], [parent_id], [parent_ids], [menu_no], [name], [alias_name], [level_num], [type], [sort], [href], [target], [icon], [is_show], [permission], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [right_id], [module_no], [group_no]) VALUES ('00015ec390f14e2ebf449c2b9efad757', '2942b780b8994f87ab0fb777e82e0a37', NULL, NULL, '编辑', '编辑', 4, NULL, 3, NULL, NULL, NULL, '0', 'hd:contractInfo:edit', 'c03057cd933147e89b4fed729d4c9ec5', '2019-2-15 14:49:46', 'c03057cd933147e89b4fed729d4c9ec5', '2019-2-15 14:49:46', NULL, '0', NULL, NULL, NULL);
GO
INSERT INTO [sys_menu] ([id], [parent_id], [parent_ids], [menu_no], [name], [alias_name], [level_num], [type], [sort], [href], [target], [icon], [is_show], [permission], [create_by], [create_date], [update_by], [update_date], [remarks], [del_flag], [right_id], [module_no], [group_no]) VALUES ('000aa42ab4d84d89bc3c27c9bc4496dc', '93b3b5749f674e258853a9833c95c5f0', '', '', '归档', '归档', 4, NULL, NULL, '0', NULL, '', '0', 'cm:005:expContractContinute:file', 'c03057cd933147e89b4fed729d4c9ec5', '2018-9-20 09:02:15', 'c03057cd933147e89b4fed729d4c9ec5', '2018-9-20 09:02:15', NULL, '0', NULL, NULL, NULL);
GO



CREATE TABLE [dbo].[sys_menu] (
[id] varchar(192) COLLATE Chinese_PRC_CI_AS NOT NULL ,
[parent_id] varchar(192) COLLATE Chinese_PRC_CI_AS NULL ,
[parent_ids] varchar(300) COLLATE Chinese_PRC_CI_AS NULL ,
[menu_no] varchar(300) COLLATE Chinese_PRC_CI_AS NULL ,
[name] varchar(300) COLLATE Chinese_PRC_CI_AS NULL ,
[alias_name] varchar(300) COLLATE Chinese_PRC_CI_AS NULL ,
[level_num] numeric(10) NULL ,
[type] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
[sort] numeric(10) NULL ,
[href] varchar(300) COLLATE Chinese_PRC_CI_AS NULL ,
[target] varchar(60) COLLATE Chinese_PRC_CI_AS NULL ,
[icon] varchar(300) COLLATE Chinese_PRC_CI_AS NULL ,
[is_show] varchar(3) COLLATE Chinese_PRC_CI_AS NULL ,
[permission] varchar(600) COLLATE Chinese_PRC_CI_AS NULL ,
[create_by] varchar(192) COLLATE Chinese_PRC_CI_AS NULL ,
[create_date] datetime NULL ,
[update_by] varchar(192) COLLATE Chinese_PRC_CI_AS NULL ,
[update_date] datetime NULL ,
[remarks] varchar(765) COLLATE Chinese_PRC_CI_AS NULL ,
[del_flag] varchar(3) COLLATE Chinese_PRC_CI_AS NOT NULL DEFAULT ('0') ,
[right_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
[module_no] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
[group_no] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
CONSTRAINT [PK__sys_menu__3213E83F2C496DC0] PRIMARY KEY ([id])
)
ON [PRIMARY]
GO

CREATE INDEX [sys_menu_del_flag] ON [dbo].[sys_menu]
([del_flag] ASC) 
ON [PRIMARY]
GO

CREATE INDEX [sys_menu_parent_id] ON [dbo].[sys_menu]
([parent_id] ASC) 
ON [PRIMARY]
GO