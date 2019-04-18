INSERT INTO [sys_user_permission] ([id], [permission], [right_id], [user_id], [org_id]) VALUES ('00001f3d83914452b139fe4183d243a7', 'cm:003:contractLetter:delete', '4330233785be4c379a4b6c9943ff99cb', '61f144274c9f450fa68bb2d7acc95f76', '69868cb1bb2140fca0a1005b3820f325');
GO
INSERT INTO [sys_user_permission] ([id], [permission], [right_id], [user_id], [org_id]) VALUES ('0000535f5399439baa8a56e1a2d6df17', 'ca:costCbsMst:workflow', '4705c88afe114715ba92747c4236208d', '80d82dd9b350492dab4f2ddd475d1391', '1');
GO
INSERT INTO [sys_user_permission] ([id], [permission], [right_id], [user_id], [org_id]) VALUES ('0000615f7c57411a9a37a0a3f20744a6', 'lc:otherPayment:sendexamine', '7f82ba296f7d4f1b893506e256f247eb', 'dd953047a9c7496b82280b108f5bedba', '69868cb1bb2140fca0a1005b3820f325');
GO


CREATE TABLE [dbo].[sys_user_permission] (
[id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL ,
[permission] varchar(600) COLLATE Chinese_PRC_CI_AS NULL ,
[right_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
[user_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
[org_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
CONSTRAINT [PK__sys_user__3213E83F569ECEE8] PRIMARY KEY ([id])
)
ON [PRIMARY]
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_user_permission', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户授权权限数据'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user_permission'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户授权权限数据'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user_permission'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_user_permission', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'系统编码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user_permission'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'系统编码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user_permission'
, @level2type = 'COLUMN', @level2name = N'id'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_user_permission', 
'COLUMN', N'permission')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'权限标识'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user_permission'
, @level2type = 'COLUMN', @level2name = N'permission'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'权限标识'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user_permission'
, @level2type = 'COLUMN', @level2name = N'permission'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_user_permission', 
'COLUMN', N'right_id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'权限'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user_permission'
, @level2type = 'COLUMN', @level2name = N'right_id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'权限'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user_permission'
, @level2type = 'COLUMN', @level2name = N'right_id'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_user_permission', 
'COLUMN', N'user_id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user_permission'
, @level2type = 'COLUMN', @level2name = N'user_id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user_permission'
, @level2type = 'COLUMN', @level2name = N'user_id'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_user_permission', 
'COLUMN', N'org_id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'所属组织'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user_permission'
, @level2type = 'COLUMN', @level2name = N'org_id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'所属组织'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_user_permission'
, @level2type = 'COLUMN', @level2name = N'org_id'
GO