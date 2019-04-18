CREATE TABLE [dbo].[hr_vacation_adjustment_dtl] (
[id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL ,
[vacation_adjustment_mst_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
[employee_files_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
[rest_day] numeric(18,2) NULL ,
[all_days] numeric(18,2) NULL ,
[advance_days] numeric(18,2) NULL ,
[next_year_days] numeric(18,2) NULL ,
[org_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
[create_date] datetime NULL ,
[create_by] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
[update_date] datetime NULL ,
[update_by] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
[remarks] varchar(5000) COLLATE Chinese_PRC_CI_AS NULL ,
CONSTRAINT [PK__hr_vacat__3213E83F5166AF2D] PRIMARY KEY ([id])
)
ON [PRIMARY]
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_dtl', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'假期制度调整子表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'假期制度调整子表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_dtl', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
, @level2type = 'COLUMN', @level2name = N'id'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_dtl', 
'COLUMN', N'vacation_adjustment_mst_id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'关联主键id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
, @level2type = 'COLUMN', @level2name = N'vacation_adjustment_mst_id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'关联主键id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
, @level2type = 'COLUMN', @level2name = N'vacation_adjustment_mst_id'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_dtl', 
'COLUMN', N'employee_files_id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'员工姓名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
, @level2type = 'COLUMN', @level2name = N'employee_files_id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'员工姓名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
, @level2type = 'COLUMN', @level2name = N'employee_files_id'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_dtl', 
'COLUMN', N'rest_day')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'剩余天数'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
, @level2type = 'COLUMN', @level2name = N'rest_day'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'剩余天数'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
, @level2type = 'COLUMN', @level2name = N'rest_day'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_dtl', 
'COLUMN', N'all_days')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'本年总天数'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
, @level2type = 'COLUMN', @level2name = N'all_days'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'本年总天数'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
, @level2type = 'COLUMN', @level2name = N'all_days'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_dtl', 
'COLUMN', N'advance_days')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预支天数'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
, @level2type = 'COLUMN', @level2name = N'advance_days'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预支天数'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
, @level2type = 'COLUMN', @level2name = N'advance_days'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_dtl', 
'COLUMN', N'next_year_days')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'下年天数'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
, @level2type = 'COLUMN', @level2name = N'next_year_days'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'下年天数'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
, @level2type = 'COLUMN', @level2name = N'next_year_days'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_dtl', 
'COLUMN', N'org_id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
, @level2type = 'COLUMN', @level2name = N'org_id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
, @level2type = 'COLUMN', @level2name = N'org_id'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_dtl', 
'COLUMN', N'create_date')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建日期'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
, @level2type = 'COLUMN', @level2name = N'create_date'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建日期'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
, @level2type = 'COLUMN', @level2name = N'create_date'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_dtl', 
'COLUMN', N'create_by')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
, @level2type = 'COLUMN', @level2name = N'create_by'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
, @level2type = 'COLUMN', @level2name = N'create_by'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_dtl', 
'COLUMN', N'update_date')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新日期'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
, @level2type = 'COLUMN', @level2name = N'update_date'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日期'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
, @level2type = 'COLUMN', @level2name = N'update_date'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_dtl', 
'COLUMN', N'update_by')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
, @level2type = 'COLUMN', @level2name = N'update_by'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
, @level2type = 'COLUMN', @level2name = N'update_by'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_dtl', 
'COLUMN', N'remarks')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
, @level2type = 'COLUMN', @level2name = N'remarks'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_dtl'
, @level2type = 'COLUMN', @level2name = N'remarks'
GO

INSERT INTO [hr_vacation_adjustment_dtl] ([id], [vacation_adjustment_mst_id], [employee_files_id], [rest_day], [all_days], [advance_days], [next_year_days], [org_id], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('074141772e9e46b8bb9483e631d92fce', '8a3acff3ee924c3e9cc534a95c09cb90', '8054d90860344af08911d34292a9ac91', 15.00, 15.00, NULL, 15.00, '1', '2018-11-9 15:33:19', 'c22f1285ac304a87970448b4c4c70912', '2018-11-9 15:33:19', 'c22f1285ac304a87970448b4c4c70912', NULL);
GO
INSERT INTO [hr_vacation_adjustment_dtl] ([id], [vacation_adjustment_mst_id], [employee_files_id], [rest_day], [all_days], [advance_days], [next_year_days], [org_id], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('346060a12cad44b1b7ec8a351d1f81a3', 'beb7b146ef1249409594a22d787bce7c', '8054d90860344af08911d34292a9ac91', 15.00, 15.00, NULL, 15.00, '1', '2018-11-9 15:41:47', 'c22f1285ac304a87970448b4c4c70912', '2018-11-9 15:41:47', 'c22f1285ac304a87970448b4c4c70912', NULL);
GO
INSERT INTO [hr_vacation_adjustment_dtl] ([id], [vacation_adjustment_mst_id], [employee_files_id], [rest_day], [all_days], [advance_days], [next_year_days], [org_id], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('6390d2cca8aa47e5ae812d528c68deda', 'f150c2e961d34f768d2573565fe148a5', 'ad0c2c8ccfbe4168b1268f9480fca1ab', .00, .00, NULL, 5.00, '1', '2019-4-15 16:16:36', '75b4baf30d4f4596b369a0f4a3b89a89', '2019-4-15 16:16:36', '75b4baf30d4f4596b369a0f4a3b89a89', NULL);
GO
INSERT INTO [hr_vacation_adjustment_dtl] ([id], [vacation_adjustment_mst_id], [employee_files_id], [rest_day], [all_days], [advance_days], [next_year_days], [org_id], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('fadccc13cf9e4fbd9c8c1c66346b6344', '07051ecbd39542b39fa909d37823ce96', '8054d90860344af08911d34292a9ac91', 15.00, 15.00, NULL, 15.00, '1', '2018-11-9 15:40:13', 'c22f1285ac304a87970448b4c4c70912', '2018-11-9 15:40:13', 'c22f1285ac304a87970448b4c4c70912', NULL);
GO
