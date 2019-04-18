INSERT INTO [ciocem_bus_lock] ([bus_type], [ver]) VALUES ('DispatchType', 38);
GO
INSERT INTO [ciocem_bus_lock] ([bus_type], [ver]) VALUES ('InDispatchType', 16);
GO
INSERT INTO [ciocem_bus_lock] ([bus_type], [ver]) VALUES ('ProjectAuth', 292);
GO
INSERT INTO [ciocem_bus_lock] ([bus_type], [ver]) VALUES ('SharpAccount', 22);
GO

CREATE TABLE [dbo].[ciocem_bus_lock] (
[bus_type] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL ,
[ver] bigint NOT NULL ,
CONSTRAINT [PK__ciocem_b__B86CD240009FF5AC] PRIMARY KEY ([bus_type])
)
ON [PRIMARY]
GO

00257781dcf648989712a1ecb06098f5	1	项目管理-质量管理-质量检查-现场检查记录	c03057cd933147e89b4fed729d4c9ec5	2018-05-11 14:38:47.947	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36	/ciocem/a/pm/qualityCheckRecordMst/list	GET									
0025e79d7e464ef2964deb7fac271cde	1	协同办公-档案管理-基础数据-档案库	5e6cfeaaf6434822a2e6ad2bc3ff68a6	2018-06-19 15:11:14.700	192.168.0.188	Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36	/ciocem/a/oa/filesStoreMst/list	GET									
00264aeeba634ecea00361431ff270b0	1	项目管理-竣工管理-竣工资料-竣工报告	64e1866924d44188bcaa21f50cd510b6	2018-03-05 17:37:04.527	192.168.0.189	Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3322.4 Safari/537.36	/ciocem/a/pm/completionReportMst/list	GET									