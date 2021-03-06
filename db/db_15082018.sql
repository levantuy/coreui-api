USE [master]
GO
/****** Object:  Database [react_sample]    Script Date: 8/15/2018 8:04:07 PM ******/
CREATE DATABASE [react_sample]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'react_sample', FILENAME = N'C:\Program Files (x86)\Plesk\Databases\MSSQL\MSSQL12.MSSQLSERVER2014\MSSQL\DATA\react_sample.mdf' , SIZE = 3264KB , MAXSIZE = 1024000KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'react_sample_log', FILENAME = N'C:\Program Files (x86)\Plesk\Databases\MSSQL\MSSQL12.MSSQLSERVER2014\MSSQL\DATA\react_sample_log.ldf' , SIZE = 1024KB , MAXSIZE = 1024000KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [react_sample] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [react_sample].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [react_sample] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [react_sample] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [react_sample] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [react_sample] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [react_sample] SET ARITHABORT OFF 
GO
ALTER DATABASE [react_sample] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [react_sample] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [react_sample] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [react_sample] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [react_sample] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [react_sample] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [react_sample] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [react_sample] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [react_sample] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [react_sample] SET  ENABLE_BROKER 
GO
ALTER DATABASE [react_sample] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [react_sample] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [react_sample] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [react_sample] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [react_sample] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [react_sample] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [react_sample] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [react_sample] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [react_sample] SET  MULTI_USER 
GO
ALTER DATABASE [react_sample] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [react_sample] SET DB_CHAINING OFF 
GO
ALTER DATABASE [react_sample] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [react_sample] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [react_sample] SET DELAYED_DURABILITY = DISABLED 
GO
USE [react_sample]
GO
/****** Object:  User [levantuy]    Script Date: 8/15/2018 8:04:07 PM ******/
CREATE USER [levantuy] FOR LOGIN [levantuy] WITH DEFAULT_SCHEMA=[levantuy]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [levantuy]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [levantuy]
GO
ALTER ROLE [db_datareader] ADD MEMBER [levantuy]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [levantuy]
GO
/****** Object:  Schema [levantuy]    Script Date: 8/15/2018 8:04:08 PM ******/
CREATE SCHEMA [levantuy]
GO
/****** Object:  Table [dbo].[adm_features]    Script Date: 8/15/2018 8:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_features](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](256) NOT NULL,
	[feature_group_id] [bigint] NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[last_user_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[adm_features_groups]    Script Date: 8/15/2018 8:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_features_groups](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](256) NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[last_user_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[adm_groups_roles]    Script Date: 8/15/2018 8:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_groups_roles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[group_id] [bigint] NOT NULL,
	[role_id] [bigint] NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[last_user_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[adm_groups_users]    Script Date: 8/15/2018 8:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_groups_users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_group_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[last_user_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[adm_roles]    Script Date: 8/15/2018 8:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_roles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[feature_id] [bigint] NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[last_user_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[adm_users]    Script Date: 8/15/2018 8:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	[birthday] [datetime] NULL,
	[address] [nvarchar](250) NULL,
	[website] [nvarchar](50) NULL,
	[avatar] [nvarchar](250) NULL,
	[is_lock] [bit] NOT NULL,
	[user_type] [bigint] NULL,
	[last_modified] [datetime] NOT NULL DEFAULT (getdate()),
	[last_user_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[adm_users_groups]    Script Date: 8/15/2018 8:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_users_groups](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[description] [nvarchar](500) NOT NULL,
	[parent_id] [bigint] NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[last_user_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[adm_users_roles]    Script Date: 8/15/2018 8:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_users_roles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[role_id] [bigint] NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[last_user_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dic_address]    Script Date: 8/15/2018 8:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dic_address](
	[id] [bigint] NOT NULL,
	[code] [varchar](50) NOT NULL,
	[name] [nvarchar](255) NULL,
	[description] [nvarchar](500) NULL,
	[parent_id] [varchar](50) NULL,
	[last_modified] [datetime] NOT NULL,
	[last_user_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dic_base]    Script Date: 8/15/2018 8:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dic_base](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[descriptions] [nvarchar](max) NULL,
	[parent_id] [bigint] NULL,
	[is_active] [bit] NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[last_user_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dic_hospital]    Script Date: 8/15/2018 8:04:08 PM ******/
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

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[adm_users] ON 

INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (1, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (2, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (3, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (4, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (5, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (6, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (7, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (8, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (9, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (10, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (11, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (12, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (13, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (14, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (15, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (16, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (17, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (18, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (19, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (20, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (21, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (22, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (23, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (24, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (25, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (26, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (27, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (28, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (29, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (30, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (31, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (32, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (33, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (34, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (35, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (36, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (37, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (38, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (39, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (40, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (41, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (42, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (43, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (44, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (45, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (46, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (47, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (48, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (49, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (50, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (51, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (52, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (53, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (54, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (55, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (56, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (57, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (58, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (59, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (60, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (61, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (62, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (63, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (64, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (65, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (66, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (67, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (68, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (69, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (70, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (71, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (72, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (73, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (74, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (75, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (76, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (77, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (78, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (79, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (80, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (81, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (82, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (83, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (84, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (85, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (86, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (87, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (88, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (89, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (90, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (91, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (92, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (93, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (94, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (95, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (96, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (97, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
INSERT [dbo].[adm_users] ([id], [user_name], [password], [password_salt], [password_question], [password_answer], [is_approved], [fullname], [email], [tel], [last_login_date], [last_password_changed_date], [last_lockout_date], [failed_password_attempt_count], [failed_password_attempt_window_start], [failed_password_answer_attempt_count], [failed_password_answer_attempt_window_start], [birthday], [address], [website], [avatar], [is_lock], [user_type], [last_modified], [last_user_id]) VALUES (98, N'admin', N'3h9l/lLCRnLX0nU10BIBcrAMNrnMqDDUOSVixpcOPfY=', N'34UGdgj7/tQd66fjFs1Jly2zLnmWjVFN', N'câu hỏi y học', N'câu trả lời', 1, N'quản trị viên', N'levantuy.it@gmail.com', N'0988888', CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 0, CAST(N'2015-09-23 01:37:40.280' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, CAST(N'2015-09-23 01:37:40.280' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[adm_users] OFF
GO
ALTER TABLE [dbo].[adm_features] ADD  DEFAULT (getdate()) FOR [last_modified]
GO
ALTER TABLE [dbo].[adm_features_groups] ADD  DEFAULT (getdate()) FOR [last_modified]
GO
ALTER TABLE [dbo].[adm_groups_roles] ADD  DEFAULT (getdate()) FOR [last_modified]
GO
ALTER TABLE [dbo].[adm_groups_users] ADD  DEFAULT (getdate()) FOR [last_modified]
GO
ALTER TABLE [dbo].[adm_roles] ADD  DEFAULT (getdate()) FOR [last_modified]
GO
ALTER TABLE [dbo].[adm_users_groups] ADD  DEFAULT (getdate()) FOR [last_modified]
GO
ALTER TABLE [dbo].[adm_users_roles] ADD  DEFAULT (getdate()) FOR [last_modified]
GO
ALTER TABLE [dbo].[dic_address] ADD  DEFAULT (getdate()) FOR [last_modified]
GO
ALTER TABLE [dbo].[dic_base] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[dic_base] ADD  DEFAULT (getdate()) FOR [last_modified]
GO
/****** Object:  StoredProcedure [dbo].[User_Add]    Script Date: 8/15/2018 8:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[User_Add]
    @id bigint OUTPUT,
    @user_name nvarchar(256),
    @password nvarchar(128),
    @password_salt nvarchar(128),
    @password_question nvarchar(256),
    @password_answer nvarchar(128),
    @is_approved bit,
    @fullname nvarchar(250),
    @email nvarchar(50),
    @tel nvarchar(50),
    @last_login_date datetime,
    @last_password_changed_date datetime,
    @last_lockout_date datetime,
    @failed_password_attempt_count bigint,
    @failed_password_attempt_window_start datetime,
    @failed_password_answer_attempt_count bigint,
    @failed_password_answer_attempt_window_start datetime,
    @birthday datetime,
    @address nvarchar(250),
    @website nvarchar(50),
    @avatar nvarchar(250),
    @is_lock bit,
    @user_type bigint,
    @last_modified datetime,
    @last_user_id bigint
AS
    BEGIN

        SET NOCOUNT ON

        /* Insert object into dbo.adm_users */
        INSERT INTO [dbo].[adm_users]
        (
            [user_name],
            [password],
            [password_salt],
            [password_question],
            [password_answer],
            [is_approved],
            [fullname],
            [email],
            [tel],
            [last_login_date],
            [last_password_changed_date],
            [last_lockout_date],
            [failed_password_attempt_count],
            [failed_password_attempt_window_start],
            [failed_password_answer_attempt_count],
            [failed_password_answer_attempt_window_start],
            [birthday],
            [address],
            [website],
            [avatar],
            [is_lock],
            [user_type],
            [last_modified],
            [last_user_id]
        )
        VALUES
        (
            @user_name,
            @password,
            @password_salt,
            @password_question,
            @password_answer,
            @is_approved,
            @fullname,
            @email,
            @tel,
            @last_login_date,
            @last_password_changed_date,
            @last_lockout_date,
            @failed_password_attempt_count,
            @failed_password_attempt_window_start,
            @failed_password_answer_attempt_count,
            @failed_password_answer_attempt_window_start,
            @birthday,
            @address,
            @website,
            @avatar,
            @is_lock,
            @user_type,
            @last_modified,
            @last_user_id
        )

        /* Return new primary key */
        SET @id = SCOPE_IDENTITY()

    END


GO
/****** Object:  StoredProcedure [dbo].[User_by_user_name]    Script Date: 8/15/2018 8:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[User_by_user_name] @user_name VARCHAR(50)
AS
BEGIN	
    SELECT * FROM dbo.adm_users AS au WHERE au.user_name = @user_name
	-- get roles
	SELECT aur.id FROM dbo.adm_users_roles AS aur
		JOIN dbo.adm_users AS au ON au.id = aur.user_id
	WHERE au.user_name = @user_name
	UNION
	SELECT agr.id FROM dbo.adm_groups_roles AS agr
		JOIN dbo.adm_groups_users AS agu ON agu.id = agr.group_id
		JOIN dbo.adm_users AS au ON au.id = agu.user_id
	WHERE au.user_name = @user_name
END

GO
/****** Object:  StoredProcedure [dbo].[User_Delete]    Script Date: 8/15/2018 8:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[User_Delete]
    @id bigint
AS
    BEGIN

        SET NOCOUNT ON

        /* Check for object existance */
        IF NOT EXISTS
        (
            SELECT [id] FROM [dbo].[adm_users]
            WHERE
                [id] = @id
        )
        BEGIN
            RAISERROR ('''dbo.User'' object not found. It was probably removed by another user.', 16, 1)
            RETURN
        END

        /* Delete User object from adm_users */
        DELETE
        FROM [dbo].[adm_users]
        WHERE
            [dbo].[adm_users].[id] = @id

    END


GO
/****** Object:  StoredProcedure [dbo].[User_Get]    Script Date: 8/15/2018 8:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[User_Get]
    @id bigint
AS
    BEGIN

        SET NOCOUNT ON

        /* Get User from table */
        SELECT
            [adm_users].[id],
            [adm_users].[user_name],
            [adm_users].[password],
            [adm_users].[password_salt],
            [adm_users].[password_question],
            [adm_users].[password_answer],
            [adm_users].[is_approved],
            [adm_users].[fullname],
            [adm_users].[email],
            [adm_users].[tel],
            [adm_users].[last_login_date],
            [adm_users].[last_password_changed_date],
            [adm_users].[last_lockout_date],
            [adm_users].[failed_password_attempt_count],
            [adm_users].[failed_password_attempt_window_start],
            [adm_users].[failed_password_answer_attempt_count],
            [adm_users].[failed_password_answer_attempt_window_start],
            [adm_users].[birthday],
            [adm_users].[address],
            [adm_users].[website],
            [adm_users].[avatar],
            [adm_users].[is_lock],
            [adm_users].[user_type],
            [adm_users].[last_modified],
            [adm_users].[last_user_id]
        FROM [dbo].[adm_users]
        WHERE
            [adm_users].[id] = @id

    END


GO
/****** Object:  StoredProcedure [dbo].[User_Upd]    Script Date: 8/15/2018 8:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[User_Upd]
    @id bigint,
    @user_name nvarchar(256),
    @password nvarchar(128),
    @password_salt nvarchar(128),
    @password_question nvarchar(256),
    @password_answer nvarchar(128),
    @is_approved bit,
    @fullname nvarchar(250),
    @email nvarchar(50),
    @tel nvarchar(50),
    @last_login_date datetime,
    @last_password_changed_date datetime,
    @last_lockout_date datetime,
    @failed_password_attempt_count bigint,
    @failed_password_attempt_window_start datetime,
    @failed_password_answer_attempt_count bigint,
    @failed_password_answer_attempt_window_start datetime,
    @birthday datetime,
    @address nvarchar(250),
    @website nvarchar(50),
    @avatar nvarchar(250),
    @is_lock bit,
    @user_type bigint,
    @last_modified datetime,
    @last_user_id bigint
AS
    BEGIN

        SET NOCOUNT ON

        /* Check for object existance */
        IF NOT EXISTS
        (
            SELECT [id] FROM [dbo].[adm_users]
            WHERE
                [id] = @id
        )
        BEGIN
            RAISERROR ('''dbo.User'' object not found. It was probably removed by another user.', 16, 1)
            RETURN
        END

        /* Update object in dbo.adm_users */
        UPDATE [dbo].[adm_users]
        SET
            [user_name] = @user_name,
            [password] = @password,
            [password_salt] = @password_salt,
            [password_question] = @password_question,
            [password_answer] = @password_answer,
            [is_approved] = @is_approved,
            [fullname] = @fullname,
            [email] = @email,
            [tel] = @tel,
            [last_login_date] = @last_login_date,
            [last_password_changed_date] = @last_password_changed_date,
            [last_lockout_date] = @last_lockout_date,
            [failed_password_attempt_count] = @failed_password_attempt_count,
            [failed_password_attempt_window_start] = @failed_password_attempt_window_start,
            [failed_password_answer_attempt_count] = @failed_password_answer_attempt_count,
            [failed_password_answer_attempt_window_start] = @failed_password_answer_attempt_window_start,
            [birthday] = @birthday,
            [address] = @address,
            [website] = @website,
            [avatar] = @avatar,
            [is_lock] = @is_lock,
            [user_type] = @user_type,
            [last_modified] = @last_modified,
            [last_user_id] = @last_user_id
        WHERE
            [id] = @id

    END


GO
/****** Object:  StoredProcedure [dbo].[UserColl_Get]    Script Date: 8/15/2018 8:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserColl_Get]
AS
    BEGIN

        SET NOCOUNT ON

        /* Get UserInfo from table */
        SELECT
            [adm_users].[id],
            [adm_users].[user_name],
            [adm_users].[password],
            [adm_users].[password_salt],
            [adm_users].[password_question],
            [adm_users].[password_answer],
            [adm_users].[is_approved],
            [adm_users].[fullname],
            [adm_users].[email],
            [adm_users].[tel],
            [adm_users].[last_login_date],
            [adm_users].[last_password_changed_date],
            [adm_users].[last_lockout_date],
            [adm_users].[failed_password_attempt_count],
            [adm_users].[failed_password_attempt_window_start],
            [adm_users].[failed_password_answer_attempt_count],
            [adm_users].[failed_password_answer_attempt_window_start],
            [adm_users].[birthday],
            [adm_users].[address],
            [adm_users].[website],
            [adm_users].[avatar],
            [adm_users].[is_lock],
            [adm_users].[user_type],
            [adm_users].[last_modified],
            [adm_users].[last_user_id]
        FROM [dbo].[adm_users]

    END


GO
USE [master]
GO
ALTER DATABASE [react_sample] SET  READ_WRITE 
GO
