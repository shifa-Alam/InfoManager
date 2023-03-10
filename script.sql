USE [master]
GO
/****** Object:  Database [InfoManager3]    Script Date: 2/8/2023 9:08:43 PM ******/
CREATE DATABASE [InfoManager3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InfoManager3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\InfoManager3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'InfoManager3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\InfoManager3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [InfoManager3] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InfoManager3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InfoManager3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InfoManager3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InfoManager3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InfoManager3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InfoManager3] SET ARITHABORT OFF 
GO
ALTER DATABASE [InfoManager3] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [InfoManager3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InfoManager3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InfoManager3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InfoManager3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InfoManager3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InfoManager3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InfoManager3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InfoManager3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InfoManager3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [InfoManager3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InfoManager3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InfoManager3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InfoManager3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InfoManager3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InfoManager3] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [InfoManager3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InfoManager3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [InfoManager3] SET  MULTI_USER 
GO
ALTER DATABASE [InfoManager3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InfoManager3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InfoManager3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InfoManager3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [InfoManager3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [InfoManager3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [InfoManager3] SET QUERY_STORE = OFF
GO
USE [InfoManager3]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2/8/2023 9:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 2/8/2023 9:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CountryId] [bigint] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 2/8/2023 9:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 2/8/2023 9:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CountryId] [bigint] NOT NULL,
	[Resume] [nvarchar](max) NOT NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[CityId] [bigint] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberSkills]    Script Date: 2/8/2023 9:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberSkills](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NOT NULL,
	[SkillId] [bigint] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[IsSelect] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_MemberSkills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skills]    Script Date: 2/8/2023 9:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Skills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230208074145_initial', N'6.0.10')
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [CreatedDate], [ModifiedDate], [Active]) VALUES (1, N'Dhaka', 1, CAST(N'2022-09-09T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [CreatedDate], [ModifiedDate], [Active]) VALUES (2, N'Mymensingh', 1, CAST(N'2022-09-09T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [CreatedDate], [ModifiedDate], [Active]) VALUES (3, N'Jessore', 1, CAST(N'2022-09-09T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [CreatedDate], [ModifiedDate], [Active]) VALUES (4, N'Bokaro', 2, CAST(N'2022-09-09T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [CreatedDate], [ModifiedDate], [Active]) VALUES (5, N'Bhiwani', 2, CAST(N'2022-09-09T00:00:00.0000000' AS DateTime2), NULL, 1)
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([Id], [Name], [CreatedDate], [ModifiedDate], [Active]) VALUES (1, N'Bangladesh', CAST(N'2022-09-09T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Countries] ([Id], [Name], [CreatedDate], [ModifiedDate], [Active]) VALUES (2, N'India', CAST(N'2022-09-09T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Countries] ([Id], [Name], [CreatedDate], [ModifiedDate], [Active]) VALUES (3, N'Argentina', CAST(N'2023-09-09T00:00:00.0000000' AS DateTime2), NULL, 1)
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([Id], [Name], [CountryId], [Resume], [DateOfBirth], [CityId], [CreatedDate], [ModifiedDate], [Active]) VALUES (1, N'Alam', 1, N'blob:https://localhost:44439/809e4513-ff7e-4ca8-bf08-7a96cd1e4a3c', CAST(N'2016-01-02T18:00:00.0000000' AS DateTime2), 1, CAST(N'2023-02-08T13:46:23.7870215' AS DateTime2), NULL, 1)
INSERT [dbo].[Members] ([Id], [Name], [CountryId], [Resume], [DateOfBirth], [CityId], [CreatedDate], [ModifiedDate], [Active]) VALUES (2, N'Raju', 1, N'blob:https://localhost:44439/8800c325-eda7-4bc2-9885-bf1abcd25981', CAST(N'1993-02-07T18:00:00.0000000' AS DateTime2), 1, CAST(N'2023-02-08T17:22:41.5996091' AS DateTime2), NULL, 1)
INSERT [dbo].[Members] ([Id], [Name], [CountryId], [Resume], [DateOfBirth], [CityId], [CreatedDate], [ModifiedDate], [Active]) VALUES (3, N'Ibrahim', 2, N'blob:https://localhost:44439/79455bad-2931-491b-afce-b3f5c02ecf1b', CAST(N'1994-03-02T18:00:00.0000000' AS DateTime2), 5, CAST(N'2023-02-08T17:43:08.4368713' AS DateTime2), NULL, 1)
INSERT [dbo].[Members] ([Id], [Name], [CountryId], [Resume], [DateOfBirth], [CityId], [CreatedDate], [ModifiedDate], [Active]) VALUES (4, N'raa', 1, N'', CAST(N'2016-02-09T18:00:00.0000000' AS DateTime2), 1, CAST(N'2023-02-08T17:49:31.6102789' AS DateTime2), CAST(N'2023-02-08T19:30:20.7857755' AS DateTime2), 0)
INSERT [dbo].[Members] ([Id], [Name], [CountryId], [Resume], [DateOfBirth], [CityId], [CreatedDate], [ModifiedDate], [Active]) VALUES (5, N'xzx', 1, N'blob:https://localhost:44439/5112713b-efbc-47d4-9681-81cea6e215d4', CAST(N'2017-02-06T18:00:00.0000000' AS DateTime2), 1, CAST(N'2023-02-08T17:49:54.2280177' AS DateTime2), CAST(N'2023-02-08T19:30:12.8190656' AS DateTime2), 0)
INSERT [dbo].[Members] ([Id], [Name], [CountryId], [Resume], [DateOfBirth], [CityId], [CreatedDate], [ModifiedDate], [Active]) VALUES (6, N'Shakil', 1, N'blob:https://localhost:44439/a1cfb56e-408a-430c-bc84-6b8c134ed90b', CAST(N'1992-02-04T18:00:00.0000000' AS DateTime2), 2, CAST(N'2023-02-08T21:03:36.9437930' AS DateTime2), CAST(N'2023-02-08T21:04:12.0168333' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Members] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberSkills] ON 

INSERT [dbo].[MemberSkills] ([Id], [MemberId], [SkillId], [CreatedDate], [ModifiedDate], [IsSelect], [Active]) VALUES (1, 1, 1, CAST(N'2023-02-08T13:46:23.7870215' AS DateTime2), NULL, 1, 1)
INSERT [dbo].[MemberSkills] ([Id], [MemberId], [SkillId], [CreatedDate], [ModifiedDate], [IsSelect], [Active]) VALUES (2, 1, 2, CAST(N'2023-02-08T14:46:01.5476315' AS DateTime2), NULL, 1, 1)
INSERT [dbo].[MemberSkills] ([Id], [MemberId], [SkillId], [CreatedDate], [ModifiedDate], [IsSelect], [Active]) VALUES (3, 1, 3, CAST(N'2023-02-08T15:36:51.3035285' AS DateTime2), NULL, 1, 1)
INSERT [dbo].[MemberSkills] ([Id], [MemberId], [SkillId], [CreatedDate], [ModifiedDate], [IsSelect], [Active]) VALUES (4, 2, 1, CAST(N'2023-02-08T17:22:41.5996091' AS DateTime2), NULL, 0, 1)
INSERT [dbo].[MemberSkills] ([Id], [MemberId], [SkillId], [CreatedDate], [ModifiedDate], [IsSelect], [Active]) VALUES (5, 2, 2, CAST(N'2023-02-08T17:22:41.5996091' AS DateTime2), NULL, 0, 1)
INSERT [dbo].[MemberSkills] ([Id], [MemberId], [SkillId], [CreatedDate], [ModifiedDate], [IsSelect], [Active]) VALUES (6, 2, 3, CAST(N'2023-02-08T17:22:41.5996091' AS DateTime2), NULL, 1, 1)
INSERT [dbo].[MemberSkills] ([Id], [MemberId], [SkillId], [CreatedDate], [ModifiedDate], [IsSelect], [Active]) VALUES (7, 3, 1, CAST(N'2023-02-08T17:43:08.4368713' AS DateTime2), NULL, 1, 1)
INSERT [dbo].[MemberSkills] ([Id], [MemberId], [SkillId], [CreatedDate], [ModifiedDate], [IsSelect], [Active]) VALUES (8, 3, 2, CAST(N'2023-02-08T17:43:08.4368713' AS DateTime2), NULL, 0, 1)
INSERT [dbo].[MemberSkills] ([Id], [MemberId], [SkillId], [CreatedDate], [ModifiedDate], [IsSelect], [Active]) VALUES (9, 3, 3, CAST(N'2023-02-08T17:43:08.4368713' AS DateTime2), NULL, 0, 1)
INSERT [dbo].[MemberSkills] ([Id], [MemberId], [SkillId], [CreatedDate], [ModifiedDate], [IsSelect], [Active]) VALUES (10, 4, 1, CAST(N'2023-02-08T17:49:31.6102789' AS DateTime2), NULL, 1, 1)
INSERT [dbo].[MemberSkills] ([Id], [MemberId], [SkillId], [CreatedDate], [ModifiedDate], [IsSelect], [Active]) VALUES (11, 4, 2, CAST(N'2023-02-08T17:49:31.6102789' AS DateTime2), NULL, 0, 1)
INSERT [dbo].[MemberSkills] ([Id], [MemberId], [SkillId], [CreatedDate], [ModifiedDate], [IsSelect], [Active]) VALUES (12, 4, 3, CAST(N'2023-02-08T17:49:31.6102789' AS DateTime2), NULL, 0, 1)
INSERT [dbo].[MemberSkills] ([Id], [MemberId], [SkillId], [CreatedDate], [ModifiedDate], [IsSelect], [Active]) VALUES (13, 5, 1, CAST(N'2023-02-08T17:49:54.2280177' AS DateTime2), NULL, 0, 1)
INSERT [dbo].[MemberSkills] ([Id], [MemberId], [SkillId], [CreatedDate], [ModifiedDate], [IsSelect], [Active]) VALUES (14, 5, 2, CAST(N'2023-02-08T17:49:54.2280177' AS DateTime2), NULL, 1, 1)
INSERT [dbo].[MemberSkills] ([Id], [MemberId], [SkillId], [CreatedDate], [ModifiedDate], [IsSelect], [Active]) VALUES (15, 5, 3, CAST(N'2023-02-08T17:49:54.2280177' AS DateTime2), NULL, 0, 1)
INSERT [dbo].[MemberSkills] ([Id], [MemberId], [SkillId], [CreatedDate], [ModifiedDate], [IsSelect], [Active]) VALUES (16, 6, 1, CAST(N'2023-02-08T21:03:36.9437930' AS DateTime2), NULL, 0, 1)
INSERT [dbo].[MemberSkills] ([Id], [MemberId], [SkillId], [CreatedDate], [ModifiedDate], [IsSelect], [Active]) VALUES (17, 6, 2, CAST(N'2023-02-08T21:03:36.9437930' AS DateTime2), NULL, 1, 1)
INSERT [dbo].[MemberSkills] ([Id], [MemberId], [SkillId], [CreatedDate], [ModifiedDate], [IsSelect], [Active]) VALUES (18, 6, 3, CAST(N'2023-02-08T21:03:36.9437930' AS DateTime2), NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[MemberSkills] OFF
GO
SET IDENTITY_INSERT [dbo].[Skills] ON 

INSERT [dbo].[Skills] ([Id], [Name], [CreatedDate], [ModifiedDate], [Active]) VALUES (1, N'C#', CAST(N'2020-09-09T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Skills] ([Id], [Name], [CreatedDate], [ModifiedDate], [Active]) VALUES (2, N'Java', CAST(N'2022-09-09T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Skills] ([Id], [Name], [CreatedDate], [ModifiedDate], [Active]) VALUES (3, N'Node Js', CAST(N'2022-09-08T00:00:00.0000000' AS DateTime2), NULL, 1)
SET IDENTITY_INSERT [dbo].[Skills] OFF
GO
/****** Object:  Index [IX_Cities_CountryId]    Script Date: 2/8/2023 9:08:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_Cities_CountryId] ON [dbo].[Cities]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Members_CityId]    Script Date: 2/8/2023 9:08:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_Members_CityId] ON [dbo].[Members]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Members_CountryId]    Script Date: 2/8/2023 9:08:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_Members_CountryId] ON [dbo].[Members]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MemberSkills_MemberId]    Script Date: 2/8/2023 9:08:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_MemberSkills_MemberId] ON [dbo].[MemberSkills]
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MemberSkills_SkillId]    Script Date: 2/8/2023 9:08:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_MemberSkills_SkillId] ON [dbo].[MemberSkills]
(
	[SkillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cities] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Countries] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT (CONVERT([bit],(1))) FOR [Active]
GO
ALTER TABLE [dbo].[MemberSkills] ADD  DEFAULT (CONVERT([bit],(1))) FOR [Active]
GO
ALTER TABLE [dbo].[Skills] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Countries]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK_Members_Cities] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK_Members_Cities]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK_Members_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK_Members_Countries]
GO
ALTER TABLE [dbo].[MemberSkills]  WITH CHECK ADD  CONSTRAINT [FK_MemberSkills_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[MemberSkills] CHECK CONSTRAINT [FK_MemberSkills_Members]
GO
ALTER TABLE [dbo].[MemberSkills]  WITH CHECK ADD  CONSTRAINT [FK_MemberSkills_Skills] FOREIGN KEY([SkillId])
REFERENCES [dbo].[Skills] ([Id])
GO
ALTER TABLE [dbo].[MemberSkills] CHECK CONSTRAINT [FK_MemberSkills_Skills]
GO
USE [master]
GO
ALTER DATABASE [InfoManager3] SET  READ_WRITE 
GO
