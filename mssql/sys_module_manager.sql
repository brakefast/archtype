CREATE TABLE [dbo].[sys_module_manager] (
[id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL ,
[module_key] varchar(200) COLLATE Chinese_PRC_CI_AS NOT NULL ,
[bus_type] varchar(1) COLLATE Chinese_PRC_CI_AS NOT NULL ,
[bus_id] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL ,
[create_date] datetime NOT NULL ,
[create_by] varchar(64) COLLATE Chinese_PRC_CI_AS NOT NULL ,
[org_id] varchar(64) COLLATE Chinese_PRC_CI_AS NULL ,
CONSTRAINT [PK__sys_modu__3213E83F5D21AF45] PRIMARY KEY ([id])
)
ON [PRIMARY]
GO

INSERT INTO [sys_module_manager] ([id], [module_key], [bus_type], [bus_id], [create_date], [create_by], [org_id]) VALUES ('1cc9b4d1cc7b4b6392f48e9a1db4a614', 'Dispatch', '1', 'c1bcbb553a7d4218bc06a527798f82b7', '2018-9-28 16:27:52', 'c1bcbb553a7d4218bc06a527798f82b7', '1');
GO
INSERT INTO [sys_module_manager] ([id], [module_key], [bus_type], [bus_id], [create_date], [create_by], [org_id]) VALUES ('2ad61aef25194d46a596bf7a53833600', 'Analyse', '0', 'a934e01acb5d4798ab55f2283cd49507', '2018-11-6 15:25:43', 'c03057cd933147e89b4fed729d4c9ec5', '1');
GO
INSERT INTO [sys_module_manager] ([id], [module_key], [bus_type], [bus_id], [create_date], [create_by], [org_id]) VALUES ('2ee2bef7ff0e4ce39736a9b1222f987c', 'ProjectInfo', '1', '784bff1aed2c4fc7b161669986a02b93', '2019-3-15 15:21:46', '784bff1aed2c4fc7b161669986a02b93', 'ce765792d7c841189ad13d74488a377a');
GO
INSERT INTO [sys_module_manager] ([id], [module_key], [bus_type], [bus_id], [create_date], [create_by], [org_id]) VALUES ('38601459689e4db2a659e7a0d63442ac', 'Dispatch', '1', '75b4baf30d4f4596b369a0f4a3b89a89', '2019-4-10 17:07:02', '75b4baf30d4f4596b369a0f4a3b89a89', '1');
GO
INSERT INTO [sys_module_manager] ([id], [module_key], [bus_type], [bus_id], [create_date], [create_by], [org_id]) VALUES ('3bd7b0a4550c4b3b8bd068aa0824a904', 'Analyse', '0', 'd5c68c54cf954abea8b89a0ef9230256', '2018-11-6 15:01:38', 'c03057cd933147e89b4fed729d4c9ec5', '69868cb1bb2140fca0a1005b3820f325');
GO
INSERT INTO [sys_module_manager] ([id], [module_key], [bus_type], [bus_id], [create_date], [create_by], [org_id]) VALUES ('561811c636a74d8594d2dc2e5ad0a626', '14b6844bd16541468f93da8dfc812ff5', '1', '784bff1aed2c4fc7b161669986a02b93', '2018-12-29 16:27:13', '784bff1aed2c4fc7b161669986a02b93', '1');
GO
INSERT INTO [sys_module_manager] ([id], [module_key], [bus_type], [bus_id], [create_date], [create_by], [org_id]) VALUES ('73a017a715684fef91da92537394cc66', 'ProjectInfo', '1', '507246a86260472a9f4af804a5048993', '2019-3-15 15:36:14', '507246a86260472a9f4af804a5048993', 'a0b118e03cc54676bc71ea491c50a252');
GO
INSERT INTO [sys_module_manager] ([id], [module_key], [bus_type], [bus_id], [create_date], [create_by], [org_id]) VALUES ('8f2d1b9669494ca9a9e5690b894f5573', 'ProjectInfo', '1', '507246a86260472a9f4af804a5048993', '2018-9-19 17:39:05', '507246a86260472a9f4af804a5048993', '69868cb1bb2140fca0a1005b3820f325');
GO
INSERT INTO [sys_module_manager] ([id], [module_key], [bus_type], [bus_id], [create_date], [create_by], [org_id]) VALUES ('b26b14c8336c43d38fd6e60440593f00', 'ProjectInfo', '1', 'c22f1285ac304a87970448b4c4c70912', '2016-10-9 09:08:55', 'c22f1285ac304a87970448b4c4c70912', '69868cb1bb2140fca0a1005b3820f325');
GO
INSERT INTO [sys_module_manager] ([id], [module_key], [bus_type], [bus_id], [create_date], [create_by], [org_id]) VALUES ('c8fd764160154b658b2446b6378da07d', '934d2e375276438087bb5cfde54cfa8f', '1', 'b3f2006830304774a162b75aa5f4654a', '2019-1-19 09:05:34', 'b3f2006830304774a162b75aa5f4654a', '1');
GO
INSERT INTO [sys_module_manager] ([id], [module_key], [bus_type], [bus_id], [create_date], [create_by], [org_id]) VALUES ('d05e5623a1844ab7bf657bdb3891d800', 'ProtocolMst', '0', 'fc158f2d3abb416496dfad00bb4e19b2', '2018-8-3 09:11:34', 'c03057cd933147e89b4fed729d4c9ec5', '1');
GO
INSERT INTO [sys_module_manager] ([id], [module_key], [bus_type], [bus_id], [create_date], [create_by], [org_id]) VALUES ('d8350bba4daa4eb8a397403287d6cf93', 'Analyse', '1', 'c1bcbb553a7d4218bc06a527798f82b7', '2018-11-6 15:01:38', 'c03057cd933147e89b4fed729d4c9ec5', '69868cb1bb2140fca0a1005b3820f325');
GO
INSERT INTO [sys_module_manager] ([id], [module_key], [bus_type], [bus_id], [create_date], [create_by], [org_id]) VALUES ('dd672a340d7b4fecaf711e91c185370a', 'ContractCheck', '1', '69a42df0ebc44704859dacbcd5fe6765', '2019-1-3 16:28:49', '784bff1aed2c4fc7b161669986a02b93', '1');
GO
INSERT INTO [sys_module_manager] ([id], [module_key], [bus_type], [bus_id], [create_date], [create_by], [org_id]) VALUES ('fdfa32879a18414494d74c18607ee4b6', 'BimWorkLogMst', '1', '5e6cfeaaf6434822a2e6ad2bc3ff68a6', '2018-8-1 14:04:40', '784bff1aed2c4fc7b161669986a02b93', 'ce765792d7c841189ad13d74488a377a');
GO
