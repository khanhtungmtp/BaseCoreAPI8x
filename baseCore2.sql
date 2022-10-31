USE [master]
GO
/****** Object:  Database [Basecore]    Script Date: 10/31/2022 3:53:17 PM ******/
CREATE DATABASE [Basecore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Basecore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Basecore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Basecore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Basecore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Basecore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Basecore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Basecore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Basecore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Basecore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Basecore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Basecore] SET ARITHABORT OFF 
GO
ALTER DATABASE [Basecore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Basecore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Basecore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Basecore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Basecore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Basecore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Basecore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Basecore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Basecore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Basecore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Basecore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Basecore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Basecore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Basecore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Basecore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Basecore] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Basecore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Basecore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Basecore] SET  MULTI_USER 
GO
ALTER DATABASE [Basecore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Basecore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Basecore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Basecore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Basecore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Basecore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Basecore] SET QUERY_STORE = OFF
GO
USE [Basecore]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/31/2022 3:53:17 PM ******/
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
/****** Object:  Table [dbo].[Photos]    Script Date: 10/31/2022 3:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[date_added] [datetime2](7) NULL,
	[is_main] [bit] NOT NULL,
	[userid] [int] NOT NULL,
	[public_id] [nvarchar](max) NULL,
 CONSTRAINT [PK_Photos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/31/2022 3:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](max) NULL,
	[password_hash] [varbinary](max) NULL,
	[password_salt] [varbinary](max) NULL,
	[city] [nvarchar](max) NULL,
	[country] [nvarchar](max) NULL,
	[created] [datetime2](7) NULL,
	[date_of_birth] [datetime2](7) NOT NULL,
	[gender] [nvarchar](max) NULL,
	[interests] [nvarchar](max) NULL,
	[introduction] [nvarchar](max) NULL,
	[known_as] [nvarchar](max) NULL,
	[last_active] [datetime2](7) NULL,
	[looking_for] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ValueTestModels]    Script Date: 10/31/2022 3:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ValueTestModels](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
 CONSTRAINT [PK_ValueTestModels] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220903082656_InitialCreate', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220904025936_AddedUserEntity', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220921071329_ExtendedUserClass', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221021041655_addPublicId', N'6.0.8')
GO
SET IDENTITY_INSERT [dbo].[Photos] ON 

INSERT [dbo].[Photos] ([id], [url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (77, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1666759673/y8uedsiujihcsqvlo3wu.jpg', NULL, CAST(N'2022-10-26T11:47:52.4465225' AS DateTime2), 0, 2, N'y8uedsiujihcsqvlo3wu')
INSERT [dbo].[Photos] ([id], [url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (78, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1666759674/zueklzpl6rzvqtvxygk9.jpg', NULL, CAST(N'2022-10-26T11:47:53.8519195' AS DateTime2), 0, 2, N'zueklzpl6rzvqtvxygk9')
INSERT [dbo].[Photos] ([id], [url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (79, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1666759676/gnblldduskpy0p79dp68.jpg', NULL, CAST(N'2022-10-26T11:47:55.4063931' AS DateTime2), 1, 2, N'gnblldduskpy0p79dp68')
INSERT [dbo].[Photos] ([id], [url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (80, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1666759731/r6czgeeoccwzc47w3tiu.jpg', NULL, CAST(N'2022-10-26T11:48:50.5844108' AS DateTime2), 0, 1, N'r6czgeeoccwzc47w3tiu')
INSERT [dbo].[Photos] ([id], [url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (81, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1666759733/cwls7vcaw61zetjj7hh8.jpg', NULL, CAST(N'2022-10-26T11:48:52.5427580' AS DateTime2), 0, 1, N'cwls7vcaw61zetjj7hh8')
INSERT [dbo].[Photos] ([id], [url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (82, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1666759735/gewbmiq1puphllabovlg.jpg', NULL, CAST(N'2022-10-26T11:48:54.1165278' AS DateTime2), 0, 1, N'gewbmiq1puphllabovlg')
INSERT [dbo].[Photos] ([id], [url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (110, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1666856228/gbd9lewq10exhbfh9rm8.png', NULL, CAST(N'2022-10-27T14:37:07.2013049' AS DateTime2), 1, 1, N'gbd9lewq10exhbfh9rm8')
INSERT [dbo].[Photos] ([id], [url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (111, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1666918238/u8ymwnoa56n2jhzko9q5.png', NULL, CAST(N'2022-10-28T07:50:36.8663639' AS DateTime2), 1, 23, N'u8ymwnoa56n2jhzko9q5')
INSERT [dbo].[Photos] ([id], [url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (112, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1666918552/pfshtz6cklume9hxzwhq.jpg', NULL, CAST(N'2022-10-28T07:55:49.8164598' AS DateTime2), 1, 24, N'pfshtz6cklume9hxzwhq')
INSERT [dbo].[Photos] ([id], [url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (113, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1666918929/ppebysjkk09terdnfgbk.jpg', NULL, CAST(N'2022-10-28T08:02:08.6261272' AS DateTime2), 1, 25, N'ppebysjkk09terdnfgbk')
INSERT [dbo].[Photos] ([id], [url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (114, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1666919064/s3bozzodsdq6ymhsaoln.jpg', NULL, CAST(N'2022-10-28T08:04:23.6701661' AS DateTime2), 0, 25, N's3bozzodsdq6ymhsaoln')
INSERT [dbo].[Photos] ([id], [url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (115, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1666919803/qn2p69esowsi707dzidq.jpg', NULL, CAST(N'2022-10-28T08:16:42.3214680' AS DateTime2), 1, 26, N'qn2p69esowsi707dzidq')
INSERT [dbo].[Photos] ([id], [url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (116, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1666919815/fd4fbfrfdgbno2wpblvw.jpg', NULL, CAST(N'2022-10-28T08:16:54.7402243' AS DateTime2), 0, 26, N'fd4fbfrfdgbno2wpblvw')
SET IDENTITY_INSERT [dbo].[Photos] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [username], [password_hash], [password_salt], [city], [country], [created], [date_of_birth], [gender], [interests], [introduction], [known_as], [last_active], [looking_for]) VALUES (1, N'admin', 0xD88E3445AACE251B4A63177966E7C160F98EA39FD7B6C9266EBD670BF1ABA7DB9823EDFCF0454D9C4D776D58EAAAE258AAFEB0600FCA0101817FCD1FC35B8EAB, 0x82D1F0FB75A059B04BE8648AC17B3156F0E32C9053B19555C7B76A36107EA6D3D21B9549C02F1A79CD5C336890809670D321C2DE884152F72924BDD3F1F84B8FA662F93541068131C7F10DE717EC15CC7C70F0826ACCD8FD33BFE4717EFD9AC0D95CD6247A4C5458AC632F002C6CE348E46D4C798A70BA753536261CC16664F4, N'Đà Lạt', N'Việt Nam', CAST(N'2022-10-27T07:49:20.4675434' AS DateTime2), CAST(N'1997-01-23T00:00:00.0000000' AS DateTime2), NULL, N'Listen to music and movie', N'Alonely', NULL, CAST(N'2022-10-31T14:28:28.5032980' AS DateTime2), N'girl friend')
INSERT [dbo].[Users] ([id], [username], [password_hash], [password_salt], [city], [country], [created], [date_of_birth], [gender], [interests], [introduction], [known_as], [last_active], [looking_for]) VALUES (2, N'tung', 0x4AC4520FAD12AABC78B83E27FE0C31957B57B955FFC33893900FF908CAFD306190710910CDAA20DAD08A8AEA7B286BB6AD2ABFA0B1A8949F79C6807F5AA68948, 0x038437BD1C1D671D8A4DFC727D50F6C2499F1785C3E1C070EDA85EE425D5BD18661D2FC16264AF7EB3C4E742ED84EEAE1B17DB45DD12D4309AEF4042A6263076410BE9DE235B832A9DD8F4CC0608BBC248956D0278286B3CE489EAD0942B009D3400300AA306B6DB6C73CB8B474FE082A2E260F14FE09D1F8EA56ADE64DFA165, N'Bình Dương', N'Việt Nam', CAST(N'2022-10-25T07:49:20.4675434' AS DateTime2), CAST(N'1998-07-15T00:00:00.0000000' AS DateTime2), NULL, N'listen to music', N'Single', NULL, CAST(N'2022-10-31T15:18:54.0928578' AS DateTime2), N'Girl friend')
INSERT [dbo].[Users] ([id], [username], [password_hash], [password_salt], [city], [country], [created], [date_of_birth], [gender], [interests], [introduction], [known_as], [last_active], [looking_for]) VALUES (23, N'admin1', 0xDA53FCA0A1801AE26694DAE55F1B92E37E41F503D1E6D69CCE21200ACB98496EA4AE2693B5AB22D0F167C36022DB03E34AC57596AC6EEB47907017E705C831AE, 0xEED833E1B8B8F0C33C570429296A14B365332756AE4625368640144A6A8793F4F12701150039B3A942AA7B7CEE57471C1B8A6909713C753DA6E643A3F39694CEF3E451E3E7F729648F9ED7649FC2A332967CC7FCFEEA6ACD4F7BD8D3001315191DCB038CA08CA8894BBB66D0D1498274D6ECF447DBECDB9F441B03E540D469F5, N'Binh Duong', N'Viet Nam', CAST(N'2022-10-28T07:49:20.4675428' AS DateTime2), CAST(N'1997-01-22T17:00:00.0000000' AS DateTime2), N'male', NULL, NULL, N'biet danh', CAST(N'2022-10-28T07:49:20.4675434' AS DateTime2), NULL)
INSERT [dbo].[Users] ([id], [username], [password_hash], [password_salt], [city], [country], [created], [date_of_birth], [gender], [interests], [introduction], [known_as], [last_active], [looking_for]) VALUES (24, N'admin2', 0xAC178B764FF858281E99C13FA799CB64639E158C5C7AFAC3E7C588CE2666FDEC8059F6F59B668F4C960F5C93668D9E7A986914FE4C85466AD934F459B047BC87, 0x83C5AA84D8422453EA98E2A5EA7DF5EA1E2BBD10C6497053BC2A42800A06E1777A046AF895BF49380EE7459056C6AAF167E6EAEBF8B8C5784D1E91C2E9D3A87FAC3C8A83D87C9DA617F31E510810A7CDF96B3D312F9DE0E9AC11A6A2A9B787BB122D4BCA3DC91A08789999936D4A6D52A3BA255716B0BB9E553FF2FE5DCCDAE9, N'Binh Dinh', N'Viet Nam', CAST(N'2022-10-28T07:55:32.1476926' AS DateTime2), CAST(N'2001-01-02T17:00:00.0000000' AS DateTime2), N'male', NULL, NULL, N'know', CAST(N'2022-10-28T07:55:32.1476939' AS DateTime2), NULL)
INSERT [dbo].[Users] ([id], [username], [password_hash], [password_salt], [city], [country], [created], [date_of_birth], [gender], [interests], [introduction], [known_as], [last_active], [looking_for]) VALUES (25, N'admin22', 0xFA441BF61BD1FB18C4B5A1CEDA8520BEEFAE5AAA442CFB44464056EA8B0AFCD82E316396EBD925A6D2D7A27E21023DF27D3248D47BED9C61BA9A69994C1FBC49, 0x39200FA2603B4ACBEFCF527B148A5882DF40FFE2FF23D559FC49BF5D4D708E1B5CA2277DA9538BD5EB37F980D604193B3CB54752CF74AF219F34EA47A125574FA22E9E34CEC80FD78A7C1AADB7782374C458ED4B699C29E5479EAA1D0BD584E48407E55F26AFA7C00556274AAFB70A5FB3724FFF484B5CEED0F04144DF32CAAC, N'admin22', N'admin22', CAST(N'2022-10-28T08:00:06.9671440' AS DateTime2), CAST(N'2000-02-08T17:00:00.0000000' AS DateTime2), N'male', NULL, NULL, N'admin22', CAST(N'2022-10-28T08:00:06.9671444' AS DateTime2), NULL)
INSERT [dbo].[Users] ([id], [username], [password_hash], [password_salt], [city], [country], [created], [date_of_birth], [gender], [interests], [introduction], [known_as], [last_active], [looking_for]) VALUES (26, N'admin98', 0xD29C38AA67F8ACFAB678C2E8BC81B84F293F69A68B11A018313B6FEFF5C8D0506EE81EE7F364080957B169E68ECF3FF2954AE22624E1E8355E9B1B027636C068, 0xBF7372A896188562EF4D6A9EE4B458A8B988B8B4D71C2CED948DF97CB59631898D8032D1766413D43BE5DE928F0F3B9F44D63E615B4792596C3D7527E1E77B8A4F6AD1DBB0638BF5F7E15F9513155204D4513F19041E1A5067228AF8B79CD294AC8321588F621D20E57D7A0F7686B64652B53ABE1896B69A012A02CBA5BD9ACE, N'admin98', N'admin98', CAST(N'2022-10-28T08:16:26.2785373' AS DateTime2), CAST(N'1993-03-11T17:00:00.0000000' AS DateTime2), N'male', NULL, NULL, N'admin98', CAST(N'2022-10-28T08:16:26.2785384' AS DateTime2), NULL)
INSERT [dbo].[Users] ([id], [username], [password_hash], [password_salt], [city], [country], [created], [date_of_birth], [gender], [interests], [introduction], [known_as], [last_active], [looking_for]) VALUES (27, N'admin46', 0x66E7F7320C5FC9B96855BAE2C4A04174F28B246B4EF9666EEE2E78BD3042609283A42F85FD6353CC8D18A056C4DC88B58194A47A374980F895554FDA10AD4198, 0x87A85BC615FB9531785E1D6468A53A093BCECD271FBF48C8E9513A4E6BF63845006FDA3FD64AB5516432A5C6753DC8228B04300F8C4D9C7BACB3C7D1E3C58CB00CA9003C85E3192BE39E1DC7A8976D5609D9FFC535791B1B2E32C45D3A62A84FC092BA840767A467F2820212735E8E634A967551A9F5AE6467516DEE2E63F7AA, N'admin46', N'admin46', CAST(N'2022-10-28T09:03:45.3925791' AS DateTime2), CAST(N'1998-01-30T17:00:00.0000000' AS DateTime2), N'female', NULL, NULL, N'admin46', CAST(N'2022-10-28T09:03:45.3926176' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_Photos_userid]    Script Date: 10/31/2022 3:53:17 PM ******/
CREATE NONCLUSTERED INDEX [IX_Photos_userid] ON [dbo].[Photos]
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Photos] ADD  DEFAULT (CONVERT([bit],(0))) FOR [is_main]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [date_of_birth]
GO
ALTER TABLE [dbo].[Photos]  WITH CHECK ADD  CONSTRAINT [FK_Photos_Users_userid] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Photos] CHECK CONSTRAINT [FK_Photos_Users_userid]
GO
USE [master]
GO
ALTER DATABASE [Basecore] SET  READ_WRITE 
GO
