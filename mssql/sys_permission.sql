INSERT INTO [sys_permission] ([id], [bustype], [busid], [org_id], [right_id]) VALUES ('000006e1c3254f5a919b6f44fd40c431', '2', 'efa35d46a0d942f28cc21444d9d3f583', '1', 'a851f38149fd4ebcbf20f2671d97b910');
GO
INSERT INTO [sys_permission] ([id], [bustype], [busid], [org_id], [right_id]) VALUES ('000024d75a584e99abaf97415cb5a8d4', '1', '85cbc805c7fa46739b7dc93f6234f1ef', '1', '98176b2551784464bd7ed790bf30a40d');
GO
INSERT INTO [sys_permission] ([id], [bustype], [busid], [org_id], [right_id]) VALUES ('0000441f20a74dfb83576717b8155a84', '1', '5e6cfeaaf6434822a2e6ad2bc3ff68a6', '1', 'ba60956e22ad428b94826a89b39d7710');
GO
INSERT INTO [sys_permission] ([id], [bustype], [busid], [org_id], [right_id]) VALUES ('000045efad694949a9c3b2af6bda3202', '1', '385fcb93869943da8e1759b76041fad3', '1', 'd7e26ba4a5714738a584c14070f14b3b');
GO

CREATE TABLE [dbo].[sys_permission] (
[id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL ,
[bustype] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
[busid] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
[org_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
[right_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
CONSTRAINT [PK__sys_perm__3213E83F52CE3E04] PRIMARY KEY ([id])
)
ON [PRIMARY]
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_permission', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'授权权限表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_permission'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'授权权限表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_permission'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_permission', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'系统编码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_permission'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'系统编码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_permission'
, @level2type = 'COLUMN', @level2name = N'id'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_permission', 
'COLUMN', N'bustype')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'权限'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_permission'
, @level2type = 'COLUMN', @level2name = N'bustype'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'权限'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_permission'
, @level2type = 'COLUMN', @level2name = N'bustype'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_permission', 
'COLUMN', N'busid')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'业务主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_permission'
, @level2type = 'COLUMN', @level2name = N'busid'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'业务主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_permission'
, @level2type = 'COLUMN', @level2name = N'busid'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'sys_permission', 
'COLUMN', N'org_id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'所属组织'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_permission'
, @level2type = 'COLUMN', @level2name = N'org_id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'所属组织'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'sys_permission'
, @level2type = 'COLUMN', @level2name = N'org_id'
GO
