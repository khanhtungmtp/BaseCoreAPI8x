USE [master]
GO
/****** Object:  Database [Basecore]    Script Date: 5/7/2023 9:48:27 AM ******/
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
ALTER DATABASE [Basecore] SET AUTO_CLOSE OFF 
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
ALTER DATABASE [Basecore] SET  DISABLE_BROKER 
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
ALTER DATABASE [Basecore] SET READ_COMMITTED_SNAPSHOT OFF 
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/7/2023 9:48:27 AM ******/
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
/****** Object:  Table [dbo].[Like]    Script Date: 5/7/2023 9:48:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Like](
	[LikerId] [int] NOT NULL,
	[LikeeId] [int] NOT NULL,
 CONSTRAINT [PK_Like] PRIMARY KEY CLUSTERED 
(
	[LikerId] ASC,
	[LikeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 5/7/2023 9:48:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SendId] [int] NOT NULL,
	[SenderId] [int] NULL,
	[RecipientId] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[IsRead] [bit] NOT NULL,
	[DateRead] [datetime2](7) NULL,
	[MessageSent] [datetime2](7) NOT NULL,
	[SenderDeleted] [bit] NOT NULL,
	[RecipientDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_messages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Photos]    Script Date: 5/7/2023 9:48:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Url] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[date_added] [datetime2](7) NOT NULL,
	[is_main] [bit] NOT NULL,
	[userid] [int] NOT NULL,
	[public_id] [nvarchar](max) NULL,
 CONSTRAINT [PK_Photos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/7/2023 9:48:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NULL,
	[PasswordHash] [varbinary](max) NULL,
	[PasswordSalt] [varbinary](max) NULL,
	[City] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[Created] [datetime2](7) NOT NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[Gender] [nvarchar](max) NULL,
	[Interests] [nvarchar](max) NULL,
	[Introduction] [nvarchar](max) NULL,
	[KnownAs] [nvarchar](max) NULL,
	[LastActive] [datetime2](7) NOT NULL,
	[LookingFor] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220904025936_AddedUserEntity', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220921071329_ExtendedUserClass', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221107051326_AddedLikeEntity', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221114014646_AddedMessageEntity', N'6.0.8')
GO
INSERT [dbo].[Like] ([LikerId], [LikeeId]) VALUES (1, 2)
INSERT [dbo].[Like] ([LikerId], [LikeeId]) VALUES (1, 28)
INSERT [dbo].[Like] ([LikerId], [LikeeId]) VALUES (1, 33)
INSERT [dbo].[Like] ([LikerId], [LikeeId]) VALUES (2, 29)
GO
SET IDENTITY_INSERT [dbo].[Photos] ON 

INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (121, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1667459249/aywwn5pv4sjwvxmcabqh.jpg', NULL, CAST(N'2022-11-03T14:07:28.3631987' AS DateTime2), 1, 1, N'aywwn5pv4sjwvxmcabqh')
INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (122, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1667459692/k1l4vleff7vti2cfp3yx.jpg', NULL, CAST(N'2022-11-03T14:14:50.9465884' AS DateTime2), 1, 2, N'k1l4vleff7vti2cfp3yx')
INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (124, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1667459904/cqy2pqqv7rsky7wywylb.jpg', NULL, CAST(N'2022-11-03T14:18:23.5626968' AS DateTime2), 0, 2, N'cqy2pqqv7rsky7wywylb')
INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (125, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1667460102/fgn2jgfgdeaqytxoazhg.jpg', NULL, CAST(N'2022-11-03T14:21:41.0563934' AS DateTime2), 0, 28, N'fgn2jgfgdeaqytxoazhg')
INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (126, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1667460104/duogdwmvludwgghvhrrm.jpg', NULL, CAST(N'2022-11-03T14:21:42.9773773' AS DateTime2), 1, 28, N'duogdwmvludwgghvhrrm')
INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (127, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1667460372/mblo3iijjslrryos3aes.jpg', NULL, CAST(N'2022-11-03T14:26:11.2636436' AS DateTime2), 1, 29, N'mblo3iijjslrryos3aes')
INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (128, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1667460374/g1xxyr6uoofi8gbq2ddf.jpg', NULL, CAST(N'2022-11-03T14:26:13.1561883' AS DateTime2), 0, 29, N'g1xxyr6uoofi8gbq2ddf')
INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (129, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1667460662/zit7w1mb3uyemuri43tn.jpg', NULL, CAST(N'2022-11-03T14:31:01.0377642' AS DateTime2), 1, 31, N'zit7w1mb3uyemuri43tn')
INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (130, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1667460664/bepm8jk5zuesofjcgeft.jpg', NULL, CAST(N'2022-11-03T14:31:02.9989832' AS DateTime2), 0, 31, N'bepm8jk5zuesofjcgeft')
INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (131, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1667460692/isngncjyvw7qiepgt7c0.jpg', NULL, CAST(N'2022-11-03T14:31:31.4847698' AS DateTime2), 1, 30, N'isngncjyvw7qiepgt7c0')
INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (132, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1667460694/vazn3p3gvymlx2azco1f.jpg', NULL, CAST(N'2022-11-03T14:31:33.2782349' AS DateTime2), 0, 30, N'vazn3p3gvymlx2azco1f')
INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (133, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1667460795/tcchugkc7ykefaioydvz.jpg', NULL, CAST(N'2022-11-03T14:33:14.7660659' AS DateTime2), 1, 32, N'tcchugkc7ykefaioydvz')
INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (134, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1667460797/vhgcfskm2e996ke35nqf.jpg', NULL, CAST(N'2022-11-03T14:33:16.6091329' AS DateTime2), 0, 32, N'vhgcfskm2e996ke35nqf')
INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (135, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1667460875/lolozk5xpsnf34acy73f.jpg', NULL, CAST(N'2022-11-03T14:34:34.3026817' AS DateTime2), 1, 33, N'lolozk5xpsnf34acy73f')
INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (136, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1667460878/ikezqhnu5fxdyqi9i9wz.jpg', NULL, CAST(N'2022-11-03T14:34:36.7393753' AS DateTime2), 0, 33, N'ikezqhnu5fxdyqi9i9wz')
INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (137, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1667979314/lwzxubr6uxasrtapqnir.jpg', NULL, CAST(N'2022-11-09T14:35:13.2182271' AS DateTime2), 0, 2, N'lwzxubr6uxasrtapqnir')
INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (138, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1668143098/tdhwzisunnlm1ciezfvb.jpg', NULL, CAST(N'2022-11-11T12:04:57.1935494' AS DateTime2), 1, 34, N'tdhwzisunnlm1ciezfvb')
INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (139, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1668143102/zidanzomptp38k9mmjjw.jpg', NULL, CAST(N'2022-11-11T12:05:01.4612042' AS DateTime2), 0, 34, N'zidanzomptp38k9mmjjw')
INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (140, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1668143200/eucofcnyesludf2jvlvd.jpg', NULL, CAST(N'2022-11-11T12:06:39.2617165' AS DateTime2), 1, 35, N'eucofcnyesludf2jvlvd')
INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (141, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1668143202/glhuigw1g0ffygjfbahq.jpg', NULL, CAST(N'2022-11-11T12:06:41.0500360' AS DateTime2), 0, 35, N'glhuigw1g0ffygjfbahq')
INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (142, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1668143339/nzd6twojuesim4kpy8cx.jpg', NULL, CAST(N'2022-11-11T12:08:58.2494381' AS DateTime2), 1, 36, N'nzd6twojuesim4kpy8cx')
INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (143, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1668143341/ijzugiettpdco2udizb8.jpg', NULL, CAST(N'2022-11-11T12:09:00.2125920' AS DateTime2), 0, 36, N'ijzugiettpdco2udizb8')
INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (144, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1668143408/ny6xs8pcecelpvud6izs.jpg', NULL, CAST(N'2022-11-11T12:10:07.4306929' AS DateTime2), 0, 37, N'ny6xs8pcecelpvud6izs')
INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (145, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1668143410/jtqbvpca24ro9uesbkyc.jpg', NULL, CAST(N'2022-11-11T12:10:09.2586900' AS DateTime2), 1, 37, N'jtqbvpca24ro9uesbkyc')
INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (146, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1668143798/tnoyqq8eeedrysga8v3s.jpg', NULL, CAST(N'2022-11-11T12:16:37.4016729' AS DateTime2), 1, 38, N'tnoyqq8eeedrysga8v3s')
INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (147, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1668143800/wtooriziuzoey1sowema.jpg', NULL, CAST(N'2022-11-11T12:16:39.2847373' AS DateTime2), 0, 38, N'wtooriziuzoey1sowema')
INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (148, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1683393604/s8ccdzzegjolxcqp3bfc.jpg', NULL, CAST(N'2023-05-07T00:19:55.1523470' AS DateTime2), 0, 1, N's8ccdzzegjolxcqp3bfc')
INSERT [dbo].[Photos] ([Id], [Url], [description], [date_added], [is_main], [userid], [public_id]) VALUES (149, N'http://res.cloudinary.com/dfuhlrkz1/image/upload/v1683393607/a9g7fifkz5z8ikxnj5ve.jpg', NULL, CAST(N'2023-05-07T00:20:03.2882453' AS DateTime2), 0, 1, N'a9g7fifkz5z8ikxnj5ve')
SET IDENTITY_INSERT [dbo].[Photos] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [PasswordHash], [PasswordSalt], [City], [Country], [Created], [DateOfBirth], [Gender], [Interests], [introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (1, N'admin', 0xD88E3445AACE251B4A63177966E7C160F98EA39FD7B6C9266EBD670BF1ABA7DB9823EDFCF0454D9C4D776D58EAAAE258AAFEB0600FCA0101817FCD1FC35B8EAB, 0x82D1F0FB75A059B04BE8648AC17B3156F0E32C9053B19555C7B76A36107EA6D3D21B9549C02F1A79CD5C336890809670D321C2DE884152F72924BDD3F1F84B8FA662F93541068131C7F10DE717EC15CC7C70F0826ACCD8FD33BFE4717EFD9AC0D95CD6247A4C5458AC632F002C6CE348E46D4C798A70BA753536261CC16664F4, N'Bình Dương', N'Việt Nam', CAST(N'2022-10-27T07:49:20.4675434' AS DateTime2), CAST(N'1997-01-23T00:00:00.0000000' AS DateTime2), N'Female', N'Listen to music and movie', N'Alone', N'linh', CAST(N'2023-05-07T09:28:19.4829008' AS DateTime2), N'boy friend')
INSERT [dbo].[Users] ([Id], [Username], [PasswordHash], [PasswordSalt], [City], [Country], [Created], [DateOfBirth], [Gender], [Interests], [introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (2, N'tung', 0x4AC4520FAD12AABC78B83E27FE0C31957B57B955FFC33893900FF908CAFD306190710910CDAA20DAD08A8AEA7B286BB6AD2ABFA0B1A8949F79C6807F5AA68948, 0x038437BD1C1D671D8A4DFC727D50F6C2499F1785C3E1C070EDA85EE425D5BD18661D2FC16264AF7EB3C4E742ED84EEAE1B17DB45DD12D4309AEF4042A6263076410BE9DE235B832A9DD8F4CC0608BBC248956D0278286B3CE489EAD0942B009D3400300AA306B6DB6C73CB8B474FE082A2E260F14FE09D1F8EA56ADE64DFA165, N'Bình Dương', N'Việt Nam', CAST(N'2022-10-25T07:49:20.4675434' AS DateTime2), CAST(N'1998-07-15T00:00:00.0000000' AS DateTime2), N'Male', N'listen to music', N'alone', N'tung', CAST(N'2022-11-14T16:44:49.8290305' AS DateTime2), N'Girl friend 2')
INSERT [dbo].[Users] ([Id], [Username], [PasswordHash], [PasswordSalt], [City], [Country], [Created], [DateOfBirth], [Gender], [Interests], [introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (28, N'tam', 0xFE5D77F41166E0CE65181FED45AE82E82F5970C998680B87B14B3786881D5789BB4A3FFF05FE6AEB552B1848B7EA7BBFC49F320D9D95FC96C1397564912840B6, 0x35590CAF8C04012E8632C6F159C9FD906DF41CC6A5CA80FCD9FF9D22BAFE300DBF635184B469382BCC5100EEE51F5F1F6C231B01B3DB483E62267E02EFE58351F482F94F290DEDAD27234DB9029749C899C8A05415A997ED72155A9845709F08CA2BD62536697C3BF05402D1E1EB15A378B0ADEB9C63B60C94F36C949216BFDC, N'Sài Gòn', N'Việt Nam', CAST(N'2022-11-03T14:21:09.0953306' AS DateTime2), CAST(N'1999-02-11T17:00:00.0000000' AS DateTime2), N'Male', N'soccer', N'alone', N'tamtam', CAST(N'2022-11-09T15:07:02.9276051' AS DateTime2), N'girl friend')
INSERT [dbo].[Users] ([Id], [Username], [PasswordHash], [PasswordSalt], [City], [Country], [Created], [DateOfBirth], [Gender], [Interests], [introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (29, N'trinh', 0xF4699F98E10018898EBA16F10B1F6B5717BB842E801307930EB5F562226CD1D5F0DF6C7EDD865167540B8EC51C2ABF6D2261A4012B0B8688EBFBF7F3B521ED11, 0xDE25743AC0948E4A277BFDCFEBBF6DA50B0A20030FA000E56AD6B7375F1AB00040638A775305BFF804BF63B0A101A21365AE4568E13C3BC373F824F6665CF8C2F720AEC5DCF3A02403A813D8D9F3437FF48BDF042B82CD8B7B2C7305A7532AFD9273D8E1E1A3AFB827D208384BE4DF486B74090651204F31953F32C7744EDAA2, N'Vũng Tàu', N'Việt Nam', CAST(N'2022-11-03T14:25:52.2184150' AS DateTime2), CAST(N'1983-07-22T17:00:00.0000000' AS DateTime2), N'Female', N'listen to music', N'single', N'TrinhTrinh', CAST(N'2022-11-08T08:43:32.4892102' AS DateTime2), N'boy friend')
INSERT [dbo].[Users] ([Id], [Username], [PasswordHash], [PasswordSalt], [City], [Country], [Created], [DateOfBirth], [Gender], [Interests], [introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (30, N'hoa', 0xA2D7727F7B18AC15858A551A69BEDC6AC8E09D4BCA59D8A26C9AA208F0F8967B212AC0F60E80C129AA6CD2830B186C847F6FE9115123373350E0378C3FCFBF46, 0x283F251D7F46BB805BE315B3154671CD83EAB1D119187C14A9EDBEA9D873E5249EDE8465B94975C717DD2927A9E816755E36970E2504E91FA06CE836895C42E0877C486EDE9A5DC8374B5547A2AAE7A655BCB42F972689EE9B2060A16927BC96B0AB53BA27AABD9CAF3BBEBA9098252D602514A913F659E5F20FDE96DC56BF12, N'Phú Quốc', N'Việt Nam', CAST(N'2022-11-03T14:29:47.5979424' AS DateTime2), CAST(N'1983-09-03T17:00:00.0000000' AS DateTime2), N'Female', NULL, NULL, N'HoaHoa', CAST(N'2022-11-10T13:53:26.6882548' AS DateTime2), NULL)
INSERT [dbo].[Users] ([Id], [Username], [PasswordHash], [PasswordSalt], [City], [Country], [Created], [DateOfBirth], [Gender], [Interests], [introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (31, N'hong', 0x11AFA568DCA677CA98FD67C6E14939302E2807DE405F43E3E63BD248504E80A8AC31A6A670E0F45FF5B15833EF7A7E8428EB68F95197365651A5DE893F48D92C, 0xC5975F9021ADA39E5B0D01053C8BEEFEA063355E5A3A7D6612D60B8236A6E80FB7C8BDEED41348DD456BBC13646ABE8706A4290E58FDC070143AC56C507D079785D726EEA10D1C58B1D4177717D07D7012079E67F99B78BEA27674FEAF54AD93EF350EB2228681E1C3EC5D9B0A0A153549BD5FD9769C87E258B150DCE3D247AF, N'Kiên Giang', N'Việt Nam', CAST(N'2022-11-03T14:30:36.1760761' AS DateTime2), CAST(N'2004-09-28T17:00:00.0000000' AS DateTime2), N'Female', NULL, NULL, N'HongHong', CAST(N'2022-11-03T14:31:07.1195681' AS DateTime2), NULL)
INSERT [dbo].[Users] ([Id], [Username], [PasswordHash], [PasswordSalt], [City], [Country], [Created], [DateOfBirth], [Gender], [Interests], [introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (32, N'tuyen', 0x6BC2C0A7ACEF9BD5BA940D9336C497E06ECC8ED86247C6ACA1E00D97B5F12FF77D2123C7C3298069CB0E97CE05B60899924068B8447EE01B4B8E8EC37469B666, 0x634C3CCF79087E424ADB4FF45DD64459284740227CECC002DE0ECC85C6F2C76C7B38E67B34E9943B65523C1D049BBB98D8A5353C4373ADC9817706F1BEA2178B6F796A11D119F98034D0FFBEA04CB4CE5D8D02EC5D37C5E8370D467A13A890C70D5ABCF4EFFDE3763362343662AA64B232633F4F10445A1ABB07CB17119AD656, N'Đà Nẵng', N'Việt Nam', CAST(N'2022-11-03T14:32:28.2934488' AS DateTime2), CAST(N'1998-12-20T17:00:00.0000000' AS DateTime2), N'Female', NULL, NULL, N'TuyenNguyen', CAST(N'2022-11-07T11:00:42.5995638' AS DateTime2), NULL)
INSERT [dbo].[Users] ([Id], [Username], [PasswordHash], [PasswordSalt], [City], [Country], [Created], [DateOfBirth], [Gender], [Interests], [introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (33, N'tuan', 0x97EBCC1212040D2F66C121A3C846B17E2F3BF5BF5C04ABD195983C9C82AE0A1A442B06D49DED663FBEDCED884BBF01E3F9F362579830DA6D3294CA6F1F02256A, 0x182CBAA7DD681C5B7EFEC159255BD93647FEB3B54E56508B4565EF73FF78174896EBCD519FF923013335032AA2492FF184DCDFB824C93EC3ED81DAAA5D85F89813CD24F73F4B461F6838E7C1FD1538BE6B0982272F17261ED5C67C90E4844B28030E19411C5AA042EB0CAE5BE2D4C7C4A2EAC7BB6E7A2EF3FCE995D9606406BD, N'Đồng Nai', N'Việt Nam', CAST(N'2022-11-03T14:34:14.2956166' AS DateTime2), CAST(N'2004-11-10T17:00:00.0000000' AS DateTime2), N'Male', NULL, NULL, N'TuanNguyen', CAST(N'2022-11-03T16:41:23.8426513' AS DateTime2), NULL)
INSERT [dbo].[Users] ([Id], [Username], [PasswordHash], [PasswordSalt], [City], [Country], [Created], [DateOfBirth], [Gender], [Interests], [introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (34, N'thi', 0x3C4322E445ED11805362B262B2B5EC1202E473AEF0A8A6C5580D48BEF9B37E46C5759999A5454DDBAB37A4A8EC9E5497E3FA06404694D85034CC0A5ADD3F9A13, 0xE64FBC9ECDF4E428891617B3ED60E98948D03F352ECF3149C5F9FF54837D58255A39449B20C03E64A7707B09FBA9DFA8560DF35A8BB541FB2F864084AC5D88511F658FAC4A8FD62CC2FA46FEB4BE05C357357582595C98118B209AE905963DB63FB20799DA4162EC42FAEAC2E78595391FCBAD9585384C8B9A67CE9BB4F4A59C, N'Bắc Cạn', N'Việt Nam', CAST(N'2022-11-11T12:04:34.8310759' AS DateTime2), CAST(N'2002-09-28T17:00:00.0000000' AS DateTime2), N'Female', NULL, NULL, N'ThiThi', CAST(N'2022-11-11T15:05:31.3873427' AS DateTime2), NULL)
INSERT [dbo].[Users] ([Id], [Username], [PasswordHash], [PasswordSalt], [City], [Country], [Created], [DateOfBirth], [Gender], [Interests], [introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (35, N'hạnh', 0x3DDECD1FCEFCE5FE834E459F993A1768B6A3086241696EE99D1E2BAF7C61A5854A06F9B671C8F1CBFEACD1B67309DFA629C618ECC396B127FAFAE279ED31D65C, 0xC490639592FD8C4C93CDFDF594A5CCFE79AACF2E8294560B5CBB9202AB8495465FFE23A582EDF83B367A0A0A45688A331C329D7B9164ABB13F1AE7EC1BE8E6CF933E3AB0F8BEBCCF0748B81A1E5C982899E15F3E241E4BAF034380288FE62DC6C5AFDB03D655AFB358EC5F716C45B680C9884E343E2BE15832237DCC9D860386, N'Bình Định', N'Việt Nam', CAST(N'2022-11-11T12:05:56.1262573' AS DateTime2), CAST(N'1993-08-21T17:00:00.0000000' AS DateTime2), N'Female', NULL, NULL, N'HanhHanh', CAST(N'2022-11-11T12:06:51.5700822' AS DateTime2), NULL)
INSERT [dbo].[Users] ([Id], [Username], [PasswordHash], [PasswordSalt], [City], [Country], [Created], [DateOfBirth], [Gender], [Interests], [introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (36, N'tú', 0xC835BADD4DA9227120568EA0339AE0E91BCF5292B2B53B4ABD42C6C6FD773FCE1095E0410997EA7A8D7A43675DF9F712C558F4F3007E31A6EF1D59D09AC2F9C7, 0x33490C2E91FE4095163933736E4FC255591D4E3B8E83B1EF175B1A8FB692E989BC09A275C7780E75526FEE9DB53BB3FB46035F7A3963975E65AD896F0BDA698F98A424CF97F140EEE96817C2A1F17ADB342530ECF1FB4776D3FEF9826C395FBC22531E9C8FBCBF7A4B4A1B4A9BB4164073DFCA7D8C9C232470DF5BA5574356FD, N'Kiên Giang', N'Việt Nam', CAST(N'2022-11-11T12:08:42.5073872' AS DateTime2), CAST(N'1995-11-24T17:00:00.0000000' AS DateTime2), N'Male', NULL, NULL, N'TuSD', CAST(N'2022-11-11T12:08:45.7975233' AS DateTime2), NULL)
INSERT [dbo].[Users] ([Id], [Username], [PasswordHash], [PasswordSalt], [City], [Country], [Created], [DateOfBirth], [Gender], [Interests], [introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (37, N'hổ', 0x792C9F3CD5F9A573D7B79C0E8F09604AC846846B360224BDDA389F00A82847184231213FFB41A2E04C7541E61AD3DDCE33B46AA8AF19C1D8836E762EF7D3AD1D, 0xC4DBCAE9D66DF5D76F81ADADEE382473DB1F7A075BD38FBA21B6CFA592C090AED89BB89AACA0D4735DC181F3AF27DC358B9151FCE6121FBC3DBD2E3B224D274614CA4629478E6AE9508D9469B053D70414C1518757B5A8D7BECD416931DC3328E730D2E5ED2A930A90F205936FD0922BA5941246B84B036158D3DC77557DE2E0, N'Đồng Nai', N'Việt Nam', CAST(N'2022-11-11T12:09:50.9935007' AS DateTime2), CAST(N'1996-11-08T17:00:00.0000000' AS DateTime2), N'Male', NULL, NULL, N'DanhVini', CAST(N'2022-11-11T12:13:31.8313665' AS DateTime2), NULL)
INSERT [dbo].[Users] ([Id], [Username], [PasswordHash], [PasswordSalt], [City], [Country], [Created], [DateOfBirth], [Gender], [Interests], [introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (38, N'hà', 0x58D0B1791A7D93C87E1D1AECC31434870066301596258E4D788FB9B8936EB0583A2E203929C24F1C3F4553C6C8ACCF4FDBF3B04EF57D6BB16CD204BEE0B05DA1, 0x5402564E2D0E19F6497C55159079258B51E7068261E66C42272DA134AFB9D802650680F005AA0C09E4B1A16CB92AA39F00FF866CEA52B7352E68FD4544BA9D7D6DF897221D1F8CEBD63E13F50AE125948E8201B711AFA8AD9FBC4D7F81ACCE4CE236A3C54BCF20D04FD0B328A2F557A07E5B6F43D4496B7DA41285894A168648, N'Phú Quốc', N'Việt Nam', CAST(N'2022-11-11T12:14:25.3248695' AS DateTime2), CAST(N'1999-02-11T17:00:00.0000000' AS DateTime2), N'Female', NULL, NULL, N'Hakute', CAST(N'2022-11-11T12:15:42.5435481' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Photos] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [date_added]
GO
ALTER TABLE [dbo].[Photos] ADD  DEFAULT (CONVERT([bit],(0))) FOR [is_main]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [Created]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [DateOfBirth]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [LastActive]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_Like_Users_LikeeId] FOREIGN KEY([LikeeId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like_Users_LikeeId]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_Like_Users_LikerId] FOREIGN KEY([LikerId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like_Users_LikerId]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_messages_Users_recipient_id] FOREIGN KEY([RecipientId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_messages_Users_recipient_id]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_messages_Users_sender_id] FOREIGN KEY([SenderId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_messages_Users_sender_id]
GO
ALTER TABLE [dbo].[Photos]  WITH CHECK ADD  CONSTRAINT [FK_Photos_Users_userid] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Photos] CHECK CONSTRAINT [FK_Photos_Users_userid]
GO
USE [master]
GO
ALTER DATABASE [Basecore] SET  READ_WRITE 
GO
