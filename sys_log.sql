CREATE TABLE [dbo].[sys_log] (
[id] varchar(192) COLLATE Chinese_PRC_CI_AS NOT NULL ,
[type] varchar(3) COLLATE Chinese_PRC_CI_AS NULL DEFAULT ('1') ,
[title] varchar(765) COLLATE Chinese_PRC_CI_AS NULL ,
[create_by] varchar(192) COLLATE Chinese_PRC_CI_AS NULL ,
[create_date] datetime NULL ,
[remote_addr] varchar(765) COLLATE Chinese_PRC_CI_AS NULL ,
[user_agent] varchar(765) COLLATE Chinese_PRC_CI_AS NULL ,
[request_uri] varchar(765) COLLATE Chinese_PRC_CI_AS NULL ,
[method] varchar(15) COLLATE Chinese_PRC_CI_AS NULL ,
[params] ntext COLLATE Chinese_PRC_CI_AS NULL ,
[exception] ntext COLLATE Chinese_PRC_CI_AS NULL ,
[create_user] varchar(36) COLLATE Chinese_PRC_CI_AS NULL ,
[log_desc] varchar(1000) COLLATE Chinese_PRC_CI_AS NULL ,
[log_type] varchar(1) COLLATE Chinese_PRC_CI_AS NULL ,
[remark] varchar(200) COLLATE Chinese_PRC_CI_AS NULL ,
[update_date] datetime NULL ,
[update_user] varchar(36) COLLATE Chinese_PRC_CI_AS NULL ,
[user_id] varchar(36) COLLATE Chinese_PRC_CI_AS NULL ,
CONSTRAINT [PK_sys_log] PRIMARY KEY ([id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX [sys_log_create_by] ON [dbo].[sys_log]
([create_by] ASC) 
ON [PRIMARY]
GO

CREATE INDEX [sys_log_create_date] ON [dbo].[sys_log]
([create_date] ASC) 
ON [PRIMARY]
GO

CREATE INDEX [sys_log_request_uri] ON [dbo].[sys_log]
([request_uri] ASC) 
ON [PRIMARY]
GO

CREATE INDEX [sys_log_type] ON [dbo].[sys_log]
([type] ASC) 
ON [PRIMARY]
GO