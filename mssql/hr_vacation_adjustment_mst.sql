CREATE TABLE [dbo].[hr_vacation_adjustment_mst] (
[id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL ,
[form_no] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
[employee_files_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
[organization_id1] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
[organization_id2] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
[adjustment_reason] varchar(5000) COLLATE Chinese_PRC_CI_AS NULL ,
[vacation_rule_mst_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
[adjustment_hour] numeric(18,2) NULL ,
[adjustment_day] numeric(18,2) NULL ,
[status] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
[check_user] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
[check_date] datetime NULL ,
[org_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
[create_date] datetime NULL ,
[create_by] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
[update_date] datetime NULL ,
[update_by] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
[remarks] varchar(5000) COLLATE Chinese_PRC_CI_AS NULL ,
CONSTRAINT [PK__hr_vacat__3213E83F4D961E49] PRIMARY KEY ([id])
)
ON [PRIMARY]
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_mst', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'假期制度调整主表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'假期制度调整主表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_mst', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'id'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_mst', 
'COLUMN', N'form_no')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'单据编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'form_no'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'单据编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'form_no'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_mst', 
'COLUMN', N'employee_files_id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'调整人员'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'employee_files_id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'调整人员'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'employee_files_id'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_mst', 
'COLUMN', N'organization_id1')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'调整部门'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'organization_id1'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'调整部门'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'organization_id1'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_mst', 
'COLUMN', N'organization_id2')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'调整单位'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'organization_id2'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'调整单位'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'organization_id2'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_mst', 
'COLUMN', N'adjustment_reason')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'调整原因'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'adjustment_reason'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'调整原因'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'adjustment_reason'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_mst', 
'COLUMN', N'vacation_rule_mst_id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'调整假种'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'vacation_rule_mst_id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'调整假种'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'vacation_rule_mst_id'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_mst', 
'COLUMN', N'adjustment_hour')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'调整时长'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'adjustment_hour'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'调整时长'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'adjustment_hour'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_mst', 
'COLUMN', N'adjustment_day')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'调整天数'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'adjustment_day'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'调整天数'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'adjustment_day'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_mst', 
'COLUMN', N'status')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'单据状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'status'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'单据状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'status'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_mst', 
'COLUMN', N'check_user')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'审核人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'check_user'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'审核人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'check_user'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_mst', 
'COLUMN', N'check_date')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'审核时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'check_date'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'审核时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'check_date'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_mst', 
'COLUMN', N'org_id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'org_id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'org_id'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_mst', 
'COLUMN', N'create_date')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建日期'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'create_date'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建日期'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'create_date'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_mst', 
'COLUMN', N'create_by')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'create_by'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'create_by'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_mst', 
'COLUMN', N'update_date')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新日期'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'update_date'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日期'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'update_date'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_mst', 
'COLUMN', N'update_by')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'update_by'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'update_by'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'hr_vacation_adjustment_mst', 
'COLUMN', N'remarks')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'remarks'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'hr_vacation_adjustment_mst'
, @level2type = 'COLUMN', @level2name = N'remarks'
GO

INSERT INTO [hr_vacation_adjustment_mst] ([id], [form_no], [employee_files_id], [organization_id1], [organization_id2], [adjustment_reason], [vacation_rule_mst_id], [adjustment_hour], [adjustment_day], [status], [check_user], [check_date], [org_id], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('07051ecbd39542b39fa909d37823ce96', 'hr.2018.0070', '7eaadda2b130414b9134db4829c97591', '0a0707211d8e44209ff65c1b1fe9887f', '1', '重大失误惩罚', '795deb603eb04b90800a1d4061504366', 7.00, 1.00, '2', '8054d90860344af08911d34292a9ac91', '2018-11-9 15:40:20', '1', '2018-11-9 15:39:37', 'c22f1285ac304a87970448b4c4c70912', '2018-11-9 15:40:20', 'c22f1285ac304a87970448b4c4c70912', '');
GO
INSERT INTO [hr_vacation_adjustment_mst] ([id], [form_no], [employee_files_id], [organization_id1], [organization_id2], [adjustment_reason], [vacation_rule_mst_id], [adjustment_hour], [adjustment_day], [status], [check_user], [check_date], [org_id], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('8a3acff3ee924c3e9cc534a95c09cb90', 'hr.2018.0068', '8054d90860344af08911d34292a9ac91', '0a0707211d8e44209ff65c1b1fe9887f', '1', '重大贡献奖励年休假2天', '795deb603eb04b90800a1d4061504366', 16.00, 2.00, '2', '8054d90860344af08911d34292a9ac91', '2018-11-9 15:37:51', '1', '2018-11-9 15:32:20', 'c22f1285ac304a87970448b4c4c70912', '2018-11-9 15:37:51', 'c22f1285ac304a87970448b4c4c70912', '');
GO
INSERT INTO [hr_vacation_adjustment_mst] ([id], [form_no], [employee_files_id], [organization_id1], [organization_id2], [adjustment_reason], [vacation_rule_mst_id], [adjustment_hour], [adjustment_day], [status], [check_user], [check_date], [org_id], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('beb7b146ef1249409594a22d787bce7c', 'hr.2018.0072', '7eaadda2b130414b9134db4829c97591', '0a0707211d8e44209ff65c1b1fe9887f', '1', '重大惩罚', '795deb603eb04b90800a1d4061504366', -7.00, -1.00, '2', '8054d90860344af08911d34292a9ac91', '2018-11-9 15:41:54', '1', '2018-11-9 15:41:23', 'c22f1285ac304a87970448b4c4c70912', '2018-11-9 15:41:54', 'c22f1285ac304a87970448b4c4c70912', '');
GO
INSERT INTO [hr_vacation_adjustment_mst] ([id], [form_no], [employee_files_id], [organization_id1], [organization_id2], [adjustment_reason], [vacation_rule_mst_id], [adjustment_hour], [adjustment_day], [status], [check_user], [check_date], [org_id], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('ecfd5b1bcedd4ac1a93351475f9ad34d', 'hr.2019.0087', '9694a11606e14e0c81442bf9e957de62', '7bbdb792952348d19e4edd225924c21f', '69868cb1bb2140fca0a1005b3820f325', '表现优异', 'cedf1de31aff428aa700733addc7135b', 40.00, 5.00, '2', 'dc2dfd595df94684abc9af20f044cad0', '2019-4-17 16:14:28', '1', '2019-4-17 16:13:11', '75b4baf30d4f4596b369a0f4a3b89a89', '2019-4-17 16:14:28', '75b4baf30d4f4596b369a0f4a3b89a89', '');
GO
INSERT INTO [hr_vacation_adjustment_mst] ([id], [form_no], [employee_files_id], [organization_id1], [organization_id2], [adjustment_reason], [vacation_rule_mst_id], [adjustment_hour], [adjustment_day], [status], [check_user], [check_date], [org_id], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('f150c2e961d34f768d2573565fe148a5', 'hr.2019.0079', 'ad0c2c8ccfbe4168b1268f9480fca1ab', '7bbdb792952348d19e4edd225924c21f', '69868cb1bb2140fca0a1005b3820f325', '', '795deb603eb04b90800a1d4061504366', 8.00, 1.00, '2', 'dc2dfd595df94684abc9af20f044cad0', '2019-4-15 16:16:54', '1', '2019-4-15 16:16:24', '75b4baf30d4f4596b369a0f4a3b89a89', '2019-4-15 16:16:54', '75b4baf30d4f4596b369a0f4a3b89a89', '');
GO
