CREATE TABLE [dbo].[cio_excel_template] (
[id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL ,
[table_name] varchar(200) COLLATE Chinese_PRC_CI_AS NULL ,
[module_name] varchar(200) COLLATE Chinese_PRC_CI_AS NULL ,
[module_key] varchar(200) COLLATE Chinese_PRC_CI_AS NULL ,
[template_code] varchar(200) COLLATE Chinese_PRC_CI_AS NULL ,
[template_name] varchar(200) COLLATE Chinese_PRC_CI_AS NULL ,
[type] varchar(200) COLLATE Chinese_PRC_CI_AS NULL ,
[head_num] int NULL ,
[create_date] datetime NULL ,
[create_by] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
[update_date] datetime NULL ,
[update_by] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
[remarks] varchar(255) COLLATE Chinese_PRC_CI_AS NULL ,
CONSTRAINT [PK__cio_exce__3213E83F20ACD28B] PRIMARY KEY ([id])
)
ON [PRIMARY]
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'cio_excel_template', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'Excel模板'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'cio_excel_template'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Excel模板'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'cio_excel_template'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'cio_excel_template', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'系统编码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'cio_excel_template'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'系统编码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'cio_excel_template'
, @level2type = 'COLUMN', @level2name = N'id'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'cio_excel_template', 
'COLUMN', N'module_name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'模块名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'cio_excel_template'
, @level2type = 'COLUMN', @level2name = N'module_name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'模块名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'cio_excel_template'
, @level2type = 'COLUMN', @level2name = N'module_name'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'cio_excel_template', 
'COLUMN', N'module_key')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'模块KEY'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'cio_excel_template'
, @level2type = 'COLUMN', @level2name = N'module_key'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'模块KEY'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'cio_excel_template'
, @level2type = 'COLUMN', @level2name = N'module_key'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'cio_excel_template', 
'COLUMN', N'template_code')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'模板代码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'cio_excel_template'
, @level2type = 'COLUMN', @level2name = N'template_code'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'模板代码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'cio_excel_template'
, @level2type = 'COLUMN', @level2name = N'template_code'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'cio_excel_template', 
'COLUMN', N'template_name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'模板名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'cio_excel_template'
, @level2type = 'COLUMN', @level2name = N'template_name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'模板名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'cio_excel_template'
, @level2type = 'COLUMN', @level2name = N'template_name'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'cio_excel_template', 
'COLUMN', N'type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'模板类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'cio_excel_template'
, @level2type = 'COLUMN', @level2name = N'type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'模板类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'cio_excel_template'
, @level2type = 'COLUMN', @level2name = N'type'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'cio_excel_template', 
'COLUMN', N'create_date')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建日期'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'cio_excel_template'
, @level2type = 'COLUMN', @level2name = N'create_date'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建日期'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'cio_excel_template'
, @level2type = 'COLUMN', @level2name = N'create_date'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'cio_excel_template', 
'COLUMN', N'create_by')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'cio_excel_template'
, @level2type = 'COLUMN', @level2name = N'create_by'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'cio_excel_template'
, @level2type = 'COLUMN', @level2name = N'create_by'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'cio_excel_template', 
'COLUMN', N'update_date')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新日期'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'cio_excel_template'
, @level2type = 'COLUMN', @level2name = N'update_date'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日期'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'cio_excel_template'
, @level2type = 'COLUMN', @level2name = N'update_date'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'cio_excel_template', 
'COLUMN', N'update_by')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'cio_excel_template'
, @level2type = 'COLUMN', @level2name = N'update_by'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'cio_excel_template'
, @level2type = 'COLUMN', @level2name = N'update_by'
GO

IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'cio_excel_template', 
'COLUMN', N'remarks')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'cio_excel_template'
, @level2type = 'COLUMN', @level2name = N'remarks'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'cio_excel_template'
, @level2type = 'COLUMN', @level2name = N'remarks'
GO

INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('02b3becff0554872be00256796c6bee4', 'demo_school', NULL, NULL, 'E001', '学校信息模板导出', '1', 0, '2017-4-4 17:20:27', 'c03057cd933147e89b4fed729d4c9ec5', '2017-4-4 17:21:20', 'c03057cd933147e89b4fed729d4c9ec5', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('09d25016b5aa4362b6769016c7b0b417', 'dj_hr_cut_pay_calculation', NULL, NULL, 'DjHrCutPayCalculation', '扣款计算导入', '0', 2, '2018-11-14 09:49:49', 'c03057cd933147e89b4fed729d4c9ec5', '2018-11-16 16:19:13', 'c03057cd933147e89b4fed729d4c9ec5', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('0b7fcf590b684c2a906b18d5acdb39f8', 'dj_hr_salary_budget', NULL, NULL, 'DjHrSalaryBudgetInp', '薪资年度总预算导入', '0', 2, '2018-10-29 14:06:26', 'c03057cd933147e89b4fed729d4c9ec5', '2018-10-29 16:24:52', 'c03057cd933147e89b4fed729d4c9ec5', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('0fa6e60ff4d146e194795b6d75f00a54', 'zdy_hy_subcontract_invoice_deduction_mst', NULL, NULL, 'SubcontractInvoiceDeduction', '专业分包发票差额抵扣分包发票导入', '', 1, '2018-8-29 15:27:41', 'efd45a5f3f72466bbf9a66b4c05c8d7e', '2018-8-29 15:27:41', 'efd45a5f3f72466bbf9a66b4c05c8d7e', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('1', 'demo_school', '学校信息', 'School', 'E001', '学校信息数据导入', '0', 3, NULL, NULL, '2017-3-30 18:22:54', 'c03057cd933147e89b4fed729d4c9ec5', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('162a45996ca540c8aaa001a45793a99f', 'zdy_hh_test_customer', NULL, NULL, 'TestCustomer', 'test_顾客信息表', '0', 2, '2018-10-23 16:16:34', 'c03057cd933147e89b4fed729d4c9ec5', '2018-10-24 15:23:49', 'c03057cd933147e89b4fed729d4c9ec5', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('1c3fb0958d2e4eed9aab387391328289', 'zdy_hy_vat_special_invoice_dtl', NULL, NULL, 'VatSpecialInvoiceDtl', '恒亿增值税专用发票管理单模板', '0', 2, '2018-8-29 18:03:36', 'c03057cd933147e89b4fed729d4c9ec5', '2018-9-7 14:49:24', '080e5313d86544488b619af9451f92a0', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('20f1724cd84d4515ad58c7bc07e98eaa', 'hr_labor_roster', NULL, NULL, 'HR002', '劳务工花名册', '0', 1, '2017-12-8 15:05:50', 'c03057cd933147e89b4fed729d4c9ec5', '2017-12-8 15:19:15', 'c03057cd933147e89b4fed729d4c9ec5', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('29147198e66541389b6455b1e8220353', 'pm_project_wbs', NULL, NULL, 'WBS001', '项目WBS模板', '0', 1, '2017-12-5 09:31:04', 'c03057cd933147e89b4fed729d4c9ec5', '2017-12-21 16:10:51', 'c22f1285ac304a87970448b4c4c70912', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('2bb5dc586d8142f79f1e0cf492bb4ca0', 'dj_hr_bonus_merit_pay', NULL, NULL, 'DjHrBonusMeritPay', '绩效奖金导入', '0', 2, '2018-10-22 09:24:01', 'c03057cd933147e89b4fed729d4c9ec5', '2018-10-30 09:12:19', 'c03057cd933147e89b4fed729d4c9ec5', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('337cde9d8a4c48389c28b4dc9d9a0fd9', 'cm_exp_contract_descript', NULL, NULL, 'test', 'stest', '0', 0, '2018-6-8 17:08:02', '2934436821af43399cce0dcd608a7598', '2018-6-15 16:10:49', 'c03057cd933147e89b4fed729d4c9ec5', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('353f9d591443467c9741f7becd29a4f6', 'dj_hr_salary_budget', NULL, NULL, 'DjHrSalaryBudgetEsc', '薪资年度总预算导出', '1', 1, '2018-10-23 14:49:20', 'c03057cd933147e89b4fed729d4c9ec5', '2018-10-24 09:59:36', 'c03057cd933147e89b4fed729d4c9ec5', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('396d1271b9d442f5923878d87fd55606', 'pm_wbs', NULL, NULL, 'BWBS001', '基础WBS模板', '0', 1, '2017-12-7 16:42:29', 'c03057cd933147e89b4fed729d4c9ec5', '2017-12-7 16:42:29', 'c03057cd933147e89b4fed729d4c9ec5', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('3d3bff3032454597b9260e6368f3d284', 'dj_hr_allowance_calculate_dtl', NULL, NULL, 'djHrAllowanceCalculateDtl', '补贴计算导入', '0', 2, '2018-10-30 10:29:12', 'c03057cd933147e89b4fed729d4c9ec5', '2018-10-30 10:29:12', 'c03057cd933147e89b4fed729d4c9ec5', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('4537e920fe634d0985d4635cc06675b3', 'zdy_hy_subcontract_invoice', NULL, NULL, 'SubcontractInvoice', '专业分包导出', '1', 2, '2018-8-30 10:18:12', 'c03057cd933147e89b4fed729d4c9ec5', '2018-8-30 10:21:13', 'c03057cd933147e89b4fed729d4c9ec5', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('572f6480fad24d568d09943acda71498', 'oa_employee_certificate', NULL, NULL, 'EmployeeCertificate', '员工证书导出', '1', 0, '2018-6-26 15:33:36', 'c03057cd933147e89b4fed729d4c9ec5', '2018-6-26 15:38:07', 'c03057cd933147e89b4fed729d4c9ec5', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('5b18f402d9384d7f98811b06589e386a', 'hr_labor_attendance', NULL, NULL, 'HR003', '劳务工考勤', '0', 1, '2017-9-20 14:32:40', 'c03057cd933147e89b4fed729d4c9ec5', '2017-9-20 16:58:59', 'c03057cd933147e89b4fed729d4c9ec5', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('5c0351e0526a41688dc52d50669ab8a7', 'dj_hr_salary_base_values', NULL, NULL, 'DjHrSalaryBaseValues', '员工薪酬基本数据导入', '0', 2, '2018-10-17 15:41:24', 'c03057cd933147e89b4fed729d4c9ec5', '2018-10-30 10:30:12', 'c03057cd933147e89b4fed729d4c9ec5', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('5ebe98fc75924597afae8597fdbac043', 'pm_project_cbs', NULL, NULL, 'CBS001', '项目CBS模板', '0', 1, '2017-12-7 16:04:20', 'c03057cd933147e89b4fed729d4c9ec5', '2017-12-21 16:57:57', 'c22f1285ac304a87970448b4c4c70912', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('5feff55634e249f2b8c56d3e47dc0a7a', 'zdy_hh_employee_unusual_action', NULL, NULL, '1', '1', '0', 0, '2016-10-4 16:15:03', '5e6cfeaaf6434822a2e6ad2bc3ff68a6', '2016-10-4 16:15:03', '5e6cfeaaf6434822a2e6ad2bc3ff68a6', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('611747b430514adbbfe0ece6dd653571', 'sys_user', NULL, NULL, 'E002', '用户信息数据导入', '0', 5, '2017-3-27 21:04:59', 'c03057cd933147e89b4fed729d4c9ec5', '2017-3-28 09:48:05', 'c03057cd933147e89b4fed729d4c9ec5', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('64d3ea5ab314498b960df08c90ea27eb', 'hr_employee_files', NULL, NULL, 'HR001', '人员导入XXX', '0', 1, '2018-11-20 17:48:40', 'c1bcbb553a7d4218bc06a527798f82b7', '2019-4-4 17:24:02', 'c03057cd933147e89b4fed729d4c9ec5', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('65eab96c119f4bf18048582d28138b95', 'zdy_lc_budget', NULL, NULL, 'L001', '项目预算', '0', 1, '2017-11-29 17:43:25', 'c03057cd933147e89b4fed729d4c9ec5', '2017-11-29 19:18:01', 'c03057cd933147e89b4fed729d4c9ec5', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('6fbc2b38aaad425697861e04c70a4c7c', 'zdy_hy_subcontract_invoice', NULL, NULL, 'SubcontractInvoice', '专业分包发票折扣申请分包发票导入', '0', 1, '2018-8-29 15:30:48', 'efd45a5f3f72466bbf9a66b4c05c8d7e', '2018-8-30 17:04:58', '080e5313d86544488b619af9451f92a0', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('71cf8f29594d45db97d331c37bcb028b', 'oa_enterprise_certificate', NULL, NULL, 'OA001', '企业证书', '0', 1, '2018-5-28 10:08:41', 'c03057cd933147e89b4fed729d4c9ec5', '2018-6-11 09:13:30', 'c03057cd933147e89b4fed729d4c9ec5', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('7c59a5bd9b8340f29e88e3ee27da810f', 'hr_labor_attendance_report_dtl', NULL, NULL, 'HR004', '劳务工考勤统计', '0', 1, '2017-9-22 15:31:04', 'c03057cd933147e89b4fed729d4c9ec5', '2017-12-11 10:12:15', 'c03057cd933147e89b4fed729d4c9ec5', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('7db693d01a54424593daca16bfae0c8e', 'qd_project_detail_dtl', NULL, NULL, 'QD001', '清单导入', '0', 0, '2018-5-16 09:04:12', '784bff1aed2c4fc7b161669986a02b93', '2018-8-23 14:20:42', '080e5313d86544488b619af9451f92a0', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('82675beb3b4d46bc8c7b162e91266332', 'dj_hr_retire_salary', NULL, NULL, 'DjHrRetireSalary', '退休工资表导入模板', '0', 2, '2018-10-19 17:56:29', 'c03057cd933147e89b4fed729d4c9ec5', '2018-10-19 17:59:40', 'c03057cd933147e89b4fed729d4c9ec5', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('87a636a045624a80b7e5080db9ee9cd5', 'dj_hr_average_salary', NULL, NULL, 'DjHrAverageSalary', '平均工资导入', '0', 2, '2018-10-9 15:37:53', 'c03057cd933147e89b4fed729d4c9ec5', '2018-10-31 18:04:47', 'c03057cd933147e89b4fed729d4c9ec5', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('8c3739691e124f2f9c96aafddfc61543', 'zdy_lc_material_contract', NULL, NULL, 'LC003', '材料合同信息', '1', 0, '2018-8-13 09:29:15', 'c03057cd933147e89b4fed729d4c9ec5', '2018-8-14 08:51:42', '080e5313d86544488b619af9451f92a0', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('91b2a3e47ed14a37a929bfdf17a694ea', 'dj_hr_certificate_allowance', NULL, NULL, 'DjHrCertificateAllowance', '证书补贴导入', '0', 2, '2018-11-8 11:53:44', 'c03057cd933147e89b4fed729d4c9ec5', '2018-11-8 16:50:18', 'c03057cd933147e89b4fed729d4c9ec5', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('a4727270d5b7455abb8726e9323f8615', 'zdy_lc_out_payment', NULL, NULL, 'LC004', '供应商付款', '1', 0, '2018-8-13 09:48:20', 'c03057cd933147e89b4fed729d4c9ec5', '2018-8-14 09:08:27', '080e5313d86544488b619af9451f92a0', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('a627d32f9c164c3ab2472542b5e7a166', 'pm_project_parts', NULL, NULL, 'projectParts', '安全文明标准化成果归集导入模板', '0', 2, '2019-2-12 10:49:27', 'c03057cd933147e89b4fed729d4c9ec5', '2019-2-12 13:36:17', 'c03057cd933147e89b4fed729d4c9ec5', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('af5fedaf9c24421caa400ed67eb10d4f', 'zdy_lc_invoice', NULL, NULL, 'LC002', '禹澄销项发票模板', '1', 1, '2018-6-5 15:51:45', 'c03057cd933147e89b4fed729d4c9ec5', '2018-6-15 17:34:10', 'c03057cd933147e89b4fed729d4c9ec5', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('b731e8f11dac49fab86086d949147682', 'hr_employee_files', NULL, NULL, 'HR005', '员工档案模板', '0', 2, '2017-3-31 21:12:50', 'c03057cd933147e89b4fed729d4c9ec5', '2018-11-20 17:49:03', 'c1bcbb553a7d4218bc06a527798f82b7', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('c07559132de34868a33f9f797b7fbff7', 'zdy_lc_advance_mst', NULL, NULL, 'AdvanceMstExport', '预缴单导出', '1', 1, '2018-12-10 09:34:23', 'c03057cd933147e89b4fed729d4c9ec5', '2018-12-10 11:32:06', '385fcb93869943da8e1759b76041fad3', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('c4a610580db246e59929c0836eeb2a00', 'ca_cbs_qd_mould_dtl', NULL, NULL, 'CA001', 'CBS归集模板', '0', 1, '2018-2-6 16:06:38', 'c03057cd933147e89b4fed729d4c9ec5', '2018-9-29 15:14:51', '784bff1aed2c4fc7b161669986a02b93', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('ce8b31e9a4d548ceaab8aaae8a3d1bd5', 'oa_employee_certificate', NULL, NULL, 'EmployeeCertificate', '员工证书导入', '0', 2, '2018-6-8 10:54:09', '784bff1aed2c4fc7b161669986a02b93', '2018-10-18 17:38:41', 'c03057cd933147e89b4fed729d4c9ec5', NULL);
GO
INSERT INTO [cio_excel_template] ([id], [table_name], [module_name], [module_key], [template_code], [template_name], [type], [head_num], [create_date], [create_by], [update_date], [update_by], [remarks]) VALUES ('de0ea3197856499bb05f8e73411bfb19', 'pm_cbs', NULL, NULL, 'BCBS001', '基础CBS模板', '0', 1, '2017-12-7 16:43:58', 'c03057cd933147e89b4fed729d4c9ec5', '2018-8-9 11:53:12', 'c1bcbb553a7d4218bc06a527798f82b7', NULL);
GO
