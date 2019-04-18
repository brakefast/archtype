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