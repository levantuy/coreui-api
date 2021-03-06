SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_features_groups](
	[id] bigint IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](256) NOT NULL,
	last_modified DATETIME NOT NULL DEFAULT GETDATE(),
	last_user_id bigint NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[A_GroupUsers]    Script Date: 8/12/2018 10:20:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_users_groups](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[description] [nvarchar](500) NOT NULL,
	[parent_id] [bigint] NOT NULL,
	last_modified DATETIME NOT NULL DEFAULT GETDATE(),
	last_user_id bigint NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[A_Permissions]    Script Date: 8/12/2018 10:20:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_roles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[feature_id] [bigint] NOT NULL,
	last_modified DATETIME NOT NULL DEFAULT GETDATE(),
	last_user_id bigint NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[A_PermissionsInGroupUsers]    Script Date: 8/12/2018 10:20:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_users_roles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[role_id] [bigint] NOT NULL,
	last_modified DATETIME NOT NULL DEFAULT GETDATE(),
	last_user_id bigint NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[A_PermissionsInUsers]    Script Date: 8/12/2018 10:20:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_groups_roles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[group_id] [bigint] NOT NULL,
	[role_id] [bigint] NOT NULL,
	last_modified DATETIME NOT NULL DEFAULT GETDATE(),
	last_user_id bigint NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[A_Roles]    Script Date: 8/12/2018 10:20:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_features](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](256) NOT NULL,
	[feature_group_id] BIGINT NOT NULL,
	last_modified DATETIME NOT NULL DEFAULT GETDATE(),
	last_user_id bigint NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[adm_users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](256) NOT NULL,
	[password] [nvarchar](128) NOT NULL,
	[password_salt] [nvarchar](128) NOT NULL,
	[password_question] [nvarchar](256) NULL,
	[password_answer] [nvarchar](128) NULL,
	[is_approved] [bit] NOT NULL,
	[fullname] [nvarchar](250) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[tel] [nvarchar](50) NULL,
	[last_login_date] [datetime] NOT NULL,
	[last_password_changed_date] [datetime] NOT NULL,
	[last_lockout_date] [datetime] NOT NULL,
	[failed_password_attempt_count] [bigint] NOT NULL,
	[failed_password_attempt_window_start] [datetime] NOT NULL,
	[failed_password_answer_attempt_count] [bigint] NOT NULL,
	[failed_password_answer_attempt_window_start] [datetime] NOT NULL,
	[birthday] DATETIME NULL,
	[address] [nvarchar](250) NULL,
	[website] [nvarchar](50) NULL,
	[avatar] [nvarchar](250) NULL,
	[is_lock] [bit] NOT NULL,
	[user_type] [bigint] NULL,	
	last_modified DATETIME NOT NULL DEFAULT GETDATE(),
	last_user_id bigint NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[A_UsersInGroups]    Script Date: 8/12/2018 10:20:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_groups_users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_group_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	last_modified DATETIME NOT NULL DEFAULT GETDATE(),
	last_user_id bigint NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Base]    Script Date: 8/12/2018 10:20:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dic_base](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[descriptions] [nvarchar](max) NULL,
	[parent_id] [bigint] NULL,
	[is_active] [bit] NOT NULL DEFAULT ((1)),
	last_modified DATETIME NOT NULL DEFAULT GETDATE(),
	last_user_id bigint NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[D_Address]    Script Date: 8/12/2018 10:20:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dic_address](
	[id] BIGINT NOT NULL,
	[code] [varchar](50) NOT NULL,
	[name] [nvarchar](255) NULL,
	[description] [nvarchar](500) NULL,
	[parent_id] [varchar](50) NULL,
	last_modified DATETIME NOT NULL DEFAULT GETDATE(),
	last_user_id bigint NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[D_Hospital]    Script Date: 8/12/2018 10:20:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dic_hospital](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[province_id] [varchar](50) NOT NULL,
	[district_id] [varchar](50) NOT NULL,
	[ward_id] [varchar](50) NOT NULL,
	[street] [nvarchar](255) NOT NULL,
	[contact_name] [nvarchar](50) NULL,
	[contact_phone] [varchar](50) NULL,
	[contact_email] [varchar](50) NULL,
	[last_user_id] [bigint] NOT NULL,
	[last_modified] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]