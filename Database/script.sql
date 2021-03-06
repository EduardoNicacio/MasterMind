USE [master]
GO
/****** Object:  Database [Mastermind]    Script Date: 22/05/2016 21:01:50 ******/
CREATE DATABASE [Mastermind] ON  PRIMARY 
( NAME = N'Mastermind', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Mastermind.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Mastermind_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Mastermind_log.LDF' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Mastermind] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Mastermind].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Mastermind] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Mastermind] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Mastermind] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Mastermind] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Mastermind] SET ARITHABORT OFF 
GO
ALTER DATABASE [Mastermind] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Mastermind] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Mastermind] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Mastermind] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Mastermind] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Mastermind] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Mastermind] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Mastermind] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Mastermind] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Mastermind] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Mastermind] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Mastermind] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Mastermind] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Mastermind] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Mastermind] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Mastermind] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Mastermind] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Mastermind] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Mastermind] SET  MULTI_USER 
GO
ALTER DATABASE [Mastermind] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Mastermind] SET DB_CHAINING OFF 
GO
USE [Mastermind]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 22/05/2016 21:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 22/05/2016 21:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Rgb] [nvarchar](200) NULL,
 CONSTRAINT [PK_dbo.Colors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Columns]    Script Date: 22/05/2016 21:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Columns](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Position] [int] NOT NULL,
	[Valid] [bit] NOT NULL,
	[Color_Id] [int] NULL,
	[Game_Id] [int] NULL,
	[Line_Id] [int] NULL,
 CONSTRAINT [PK_dbo.Columns] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Games]    Script Date: 22/05/2016 21:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Games](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Multiplayer] [bit] NOT NULL,
	[TotalColors] [int] NOT NULL,
	[TotalLines] [int] NOT NULL,
	[Status] [nvarchar](1) NULL,
	[Score] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Games] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lines]    Script Date: 22/05/2016 21:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lines](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [int] NOT NULL,
	[CorrectColors] [int] NOT NULL,
	[CorrectPositions] [int] NOT NULL,
	[Valid] [bit] NOT NULL,
	[Game_Id] [int] NULL,
 CONSTRAINT [PK_dbo.Lines] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Parameters]    Script Date: 22/05/2016 21:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parameters](
	[Name] [nvarchar](200) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Parameters] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Players]    Script Date: 22/05/2016 21:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Players](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Game_Id] [int] NULL,
 CONSTRAINT [PK_dbo.Players] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201605212034237_InitialCreate', N'Persistence.DatabaseContext', 0x1F8B0800000000000400ED1CD96EDC36F0BD40FF41D0535BA42B3B4181D6D84D906EE2C0687CC0EB147D0BB812BD16AA632B52868DA25FD6877E527FA13C74F09444ED7A776B04019258E40C673827871CFFFBF73FD3370F69E2DDC302C57936F38F2747BE07B3308FE26C35F34B7CFBFD8FFE9BD75F7F357D1FA50FDEAFF5BC57741E81CCD0CCBFC3787D120428BC83294093340E8B1CE5B77812E66900A23C787974F453707C1C4082C227B83C6F7A5D66384E21FB81FC38CFB310AE710992F33C8209AABE939105C3EA5D8014A23508E1CCBFA234204C8884BEF7368901216101935BDF03599663800981279F105CE022CF568B35F900929BC73524F36E41826045F8493B7D280F472F290F410B58A30A4B84F3D411E1F1AB6A5302157CD4D6FACDA6916D7B4FB6173F52AED9D6CDFC799EE485EFA92B9DCC9382CE92B675C2A06388260CEA85278CBD687480A80AFDF3C29B97092E0B38CB60890B9090E9E53289C35FE0E34DFE3BCC665999242271843C32267D209FAE8A7C0D0BFC780D6F2B92CF22DF0B64B840056CC00418CECF59865FBDF4BD0BB2385826B091BDC0FB02E705FC003358000CA32B80312C328A03B2DDD35657D6A27FD7AB11652306E37BE7E0E123CC56F86EE613D1F8DE69FC00A3FA4B45C1A72C26F645807051C2BE45AE57CB2DAF310D5AE5E8539932CDC6E80C01FBA234E6B5AE72147313EF5EB11BCBAF20891BA27FCEF30482AC1FC905B88F578C0B055DE51CAE61C246D15DBCE63EB512E6E76AC26991A7D779D2E806FFFE7991970575C637B961F006142B8887D3F281599581143A40704650A4A3F9D8AC5313D18ED4E40DA5E0639C9929A0039F3973482442FCAED1210D9A48196C8F7C671CAD91027DB145F35AE784EF789D80475838DB9282EA8690943085479B593643447566433C0BB24525EA081DC75B084E8B90ECBF239D1D4E281A65F8AAF7D15D828BE123BBE573FB53CC9EAD66B47936E2EA7BAE98369A89E0631A19C2678D10716C23DFC37DA2A3EFA1405F7C8F79AD8B325DB66E679C8DCFF3A28021DE86DBA950D5D9C986D8B69F9EF0903B3626AB2EC218B0374E507A9C849108C96A4759E65515BF1C6D93837DB14E8B75761FED7E1877B47357A9012E5F552B533818A758A020FFE231BA5543EE4BBDB8F85C156C4BE779775F59762D4BFEBBB523FE5B84F2306622945C6B75BE93E97C9F455ED7618F13DC1E1209D53C9F8E43B2F4CCFF4EE3DC82B1495A248CF4BC29233C9A4C8E553E058EBA196D93481B4D868CB225885B601F3D167C6606FBB7CC813D290CDA2832C7C496289EE43931693EFA3E319F4C189D14C99EB19BC32E3D35A4F8AE3AE1C09CE8ED6D14195D7F4B539D0D0C67D1787CD81A93DC0FCDF30C03B29545C5E83B80C1122048BFC3076C08309FC8208F31A872702AFD14EF0262B1824512C0D6EFC99E44635F03E709A4099E29700F02BA4D26F00FA648A40257E74E0D986B6B0F707362D4C06B5DE84350476B238E360950D0080257F7B12E170A534CE544358EF7049C866E415CC1401CB562CB3898C6A85982CCD7009E85F284CEB025ECF4041E81CC4AB13A18D5E34CFF4E8D60533E68E99CDA23507F0C1208AE6CA1835F63C8793A96B9055BF8D55D754F2C72E75472CC7D8A318249E988A1B3698D49BD5149A0B5F1511DCC9AE2D006ECD62970137ADA2BE580DF29D777CF81E5F2797A0ED66B928D0B97D1D5176FC16FA2E7DF2FDC6F6A538E230891E1C2B6A1B659899C63C10A2AA3BC587A1A1708D7A1D4F7E651AA4D5303AD2512D4AB49B15417551D1BEAE9F4FF951209C740A3736F37EF94F093925338630DAA0E5987636F0040020A4339809BBAADA4D005CDCF7A22BCE9CCD885815DCC8A08D8071D7E1A288CABFB1A681BABE8B82AA6A142B478E2C152A479CF28311A019F468EED75AA88A3FD3A1C5355B314D1549F0E46A6DC078E95A8C9850F90A719EC69A4295DC88968A481E1F8A45B39119F34E088AF8ADB1A3A4B3CB763ABAFE8444CF537072CFC0E4E42C23F1D8CDEF29D19ABB7EC14E4AEB766B0278A26D5658E144FAA6FC3B128D739223265C819A770AF63402B8C3E2B7F59A79D6335AF3A40BBEB9E0D70DFB9CCBEE4D05618468BA2A9438C90861DF6E9D2C3AAACAF98877E29B40BB1C88724539E58576CBA72C17ACEB0848F9EEC8CD7B8724546DF8B4106C27198CC84EE45B3B0234DD5C975244DCED4904359C4FCAE7786E8A55173B3338453F5E8EB2C78A16C65CF17AB09A345AE95B646EE2DC3B305716BB5B28392B585CB8D452D97EEEC59563B67B4C04DE5BD917BCC506D41E6A67AE14189DDC2E876C4CEEB7A1D32E7138664CFB6BD154B767BB66FADE07A50827E2AFB964AB85DA9AC45D8E674D5B0BD861AED9E056E283C3F0F916BF56B754A933436756CA55E3DAD6AC7FD1D555A31994FF13DC2FA7D1CD142F2E29128523AA113268B3F9279129334B59D700EB2F81622CC9FEDD0A7323F2ABD5987D32715201449AF8A6CCD52B2C476F0AE2DA65BDAFB72CDF17DD105685F3565F7A008EF40A1BF6B6A913A36258D43E9DA83F43C44A1F6FEB04536795ABB8CDD11B4070A8108EDFDC55916C18799FF27033AF1CE7EFB5CC3BDF02E0B62F127DE91F797ABDE34DED06DE90A6C93959B1CCB6DE50A6CF8CA6ECD3CCF43AD0D6D346314D3D04233C640F4069A3158E4F619A3933B76D541A95BA69F28B7DE8CE7A14A7257C418C1197B223640A47544ECC569EFCA71BA761D3C13ADEB4B917E704F910E4F62E62AF8AE1ED40FC913DDDFCBD758BF49C1C3B7E3366AFC9BF8BC905ECA0E7CB3AE6261AF4B473CA627C2810555781A3433840B724AD42E0EAE8A380BE3354824AAF513F21033A55BD8E05347DEC135CCA8FDC98C0D59A9AB96DFA05534AF8FF9AD37066CDA0CB06B415B1E7BEC53CE1D259F1D88797083C4A61D11BB96B4E579C43E25DD51B9DF95A43B7B28B661D08354E57F66CC835569BFA63CA44D661B22BE928EB44EED35072D66EBB396FD0ADADC2AA43F7456C5656804B2F701F1CAF6CC8F9639112CCF152D9D20E61EA18E16210B6E633382A97FC8DA3E64426C7E0F6FEA2CB2361699D01A1F315A7A8E3A5A8E4CA82D4D00F67EA4EE7624E312422BD36EDB955A9D13DEB2F7B727191A570EA52349EBBED81B3B5BEC3CD21A70F6CBD426BD45EE321AB401FBEA207267477642E245F6937409E9B7A924D609BFC592845914AF5A14F47E3883A114E59A3967D96D5E475B85A27A8A5A648718442404BE2D707C0B424C86438810FB6D01AC2432F3DFA74B189D6597255E9798B00CD36522FDA60B1AB4BBD667AD5032CDD3CB35AB7E6E8305560505185E663F97711235749F1A6ADF1614D46F55853F2A4B4C0B80ABC706D345AE2AB40D51B57D4D127303D3754290A1CB6C01EEE118DA3E21F811AE40F8585F8ADB91F40B42DEF6E9BB18AC486843158E169EFC4874384A1F5EFF076CE6EBB2CC550000, N'6.1.0-30225')
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([Id], [Name], [Rgb]) VALUES (1, N'Red', N'e74c3c')
INSERT [dbo].[Colors] ([Id], [Name], [Rgb]) VALUES (2, N'Green', N'2ecc71')
INSERT [dbo].[Colors] ([Id], [Name], [Rgb]) VALUES (3, N'Blue', N'3498db')
INSERT [dbo].[Colors] ([Id], [Name], [Rgb]) VALUES (4, N'Yellow', N'f1c40f')
INSERT [dbo].[Colors] ([Id], [Name], [Rgb]) VALUES (5, N'Orange', N'e67e22')
INSERT [dbo].[Colors] ([Id], [Name], [Rgb]) VALUES (6, N'Purple', N'9b59b6')
INSERT [dbo].[Colors] ([Id], [Name], [Rgb]) VALUES (7, N'Cyan', N'1abc9c')
INSERT [dbo].[Colors] ([Id], [Name], [Rgb]) VALUES (8, N'Magenta', N'de6bae')
SET IDENTITY_INSERT [dbo].[Colors] OFF
SET IDENTITY_INSERT [dbo].[Columns] ON 

INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (1, 1, 1, 5, 1, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (2, 2, 1, 1, 1, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (3, 3, 1, 7, 1, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (4, 4, 1, 2, 1, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (5, 5, 1, 3, 1, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (6, 6, 1, 8, 1, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (7, 7, 1, 4, 1, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (8, 8, 1, 6, 1, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (9, 1, 1, 1, 2, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (10, 2, 1, 5, 2, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (11, 3, 1, 2, 2, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (12, 4, 1, 7, 2, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (13, 5, 1, 3, 2, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (14, 6, 1, 4, 2, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (15, 7, 1, 8, 2, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (16, 8, 1, 6, 2, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (17, 1, 1, 4, 3, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (18, 2, 1, 8, 3, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (19, 3, 1, 1, 3, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (20, 4, 1, 5, 3, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (21, 5, 1, 7, 3, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (22, 6, 1, 3, 3, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (23, 7, 1, 2, 3, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (24, 8, 1, 6, 3, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (25, 1, 1, 7, 4, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (26, 2, 1, 4, 4, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (27, 3, 1, 2, 4, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (28, 4, 1, 1, 4, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (29, 5, 1, 6, 4, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (30, 6, 1, 5, 4, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (31, 7, 1, 8, 4, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (32, 8, 1, 3, 4, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (33, 1, 1, 4, 5, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (34, 2, 1, 3, 5, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (35, 3, 1, 8, 5, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (36, 4, 1, 2, 5, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (37, 5, 1, 5, 5, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (38, 6, 1, 7, 5, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (39, 7, 1, 6, 5, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (40, 8, 1, 1, 5, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (41, 1, 1, 1, 6, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (42, 2, 1, 6, 6, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (43, 3, 1, 5, 6, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (44, 4, 1, 8, 6, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (45, 5, 1, 3, 6, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (46, 6, 1, 4, 6, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (47, 7, 1, 7, 6, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (48, 8, 1, 2, 6, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (49, 1, 1, 4, 7, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (50, 2, 1, 2, 7, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (51, 3, 1, 6, 7, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (52, 4, 1, 3, 7, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (53, 5, 1, 8, 7, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (54, 6, 1, 1, 7, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (55, 7, 1, 5, 7, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (56, 8, 1, 7, 7, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (57, 1, 1, 4, 8, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (58, 2, 1, 8, 8, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (59, 3, 1, 5, 8, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (60, 4, 1, 2, 8, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (61, 5, 1, 6, 8, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (62, 6, 1, 3, 8, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (63, 7, 1, 1, 8, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (64, 8, 1, 7, 8, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (65, 1, 1, 5, 9, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (66, 2, 1, 4, 9, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (67, 3, 1, 6, 9, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (68, 4, 1, 1, 9, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (69, 5, 1, 2, 9, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (70, 6, 1, 8, 9, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (71, 7, 1, 3, 9, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (72, 8, 1, 7, 9, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (73, 1, 1, 1, 10, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (74, 2, 1, 3, 10, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (75, 3, 1, 8, 10, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (76, 4, 1, 4, 10, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (77, 5, 1, 7, 10, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (78, 6, 1, 5, 10, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (79, 7, 1, 6, 10, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (80, 8, 1, 2, 10, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (81, 1, 1, 7, 11, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (82, 2, 1, 3, 11, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (83, 3, 1, 5, 11, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (84, 4, 1, 8, 11, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (85, 5, 1, 6, 11, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (86, 6, 1, 2, 11, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (87, 7, 1, 1, 11, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (88, 8, 1, 4, 11, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (89, 1, 1, 4, 12, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (90, 2, 1, 1, 12, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (91, 3, 1, 7, 12, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (92, 4, 1, 8, 12, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (93, 5, 1, 5, 12, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (94, 6, 1, 6, 12, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (95, 7, 1, 3, 12, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (96, 8, 1, 2, 12, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (97, 1, 1, 5, 13, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (98, 2, 1, 2, 13, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (99, 3, 1, 1, 13, NULL)
GO
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (100, 4, 1, 4, 13, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (101, 5, 1, 6, 13, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (102, 6, 1, 3, 13, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (103, 7, 1, 7, 13, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (104, 8, 1, 8, 13, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (105, 1, 1, 7, 14, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (106, 2, 1, 2, 14, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (107, 3, 1, 5, 14, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (108, 4, 1, 6, 14, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (109, 5, 1, 1, 14, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (110, 6, 1, 8, 14, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (111, 7, 1, 3, 14, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (112, 8, 1, 4, 14, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (113, 1, 1, 8, 15, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (114, 2, 1, 5, 15, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (115, 3, 1, 7, 15, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (116, 4, 1, 6, 15, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (117, 5, 1, 3, 15, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (118, 6, 1, 2, 15, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (119, 7, 1, 1, 15, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (120, 8, 1, 4, 15, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (121, 1, 1, 7, 16, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (122, 2, 1, 4, 16, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (123, 3, 1, 5, 16, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (124, 4, 1, 6, 16, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (125, 5, 1, 1, 16, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (126, 6, 1, 8, 16, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (127, 7, 1, 3, 16, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (128, 8, 1, 2, 16, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (129, 1, 1, 1, 17, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (130, 2, 1, 4, 17, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (131, 3, 1, 6, 17, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (132, 4, 1, 7, 17, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (133, 5, 1, 2, 17, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (134, 6, 1, 3, 17, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (135, 7, 1, 5, 17, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (136, 8, 1, 8, 17, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (137, 1, 1, 5, 18, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (138, 2, 1, 6, 18, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (139, 3, 1, 4, 18, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (140, 4, 1, 8, 18, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (141, 5, 1, 1, 18, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (142, 6, 1, 7, 18, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (143, 7, 1, 2, 18, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (144, 8, 1, 3, 18, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (145, 1, 1, 4, 19, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (146, 2, 1, 8, 19, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (147, 3, 1, 2, 19, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (148, 4, 1, 6, 19, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (149, 5, 1, 3, 19, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (150, 6, 1, 5, 19, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (151, 7, 1, 7, 19, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (152, 8, 1, 1, 19, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (153, 1, 1, 5, 20, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (154, 2, 1, 1, 20, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (155, 3, 1, 6, 20, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (156, 4, 1, 3, 20, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (157, 5, 1, 8, 20, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (158, 6, 1, 2, 20, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (159, 7, 1, 7, 20, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (160, 8, 1, 4, 20, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (161, 1, 1, 4, 21, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (162, 2, 1, 5, 21, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (163, 3, 1, 7, 21, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (164, 4, 1, 8, 21, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (165, 5, 1, 2, 21, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (166, 6, 1, 6, 21, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (167, 7, 1, 3, 21, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (168, 8, 1, 1, 21, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (169, 1, 1, 1, 22, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (170, 2, 1, 7, 22, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (171, 3, 1, 5, 22, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (172, 4, 1, 4, 22, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (173, 5, 1, 8, 22, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (174, 6, 1, 3, 22, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (175, 7, 1, 2, 22, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (176, 8, 1, 6, 22, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (177, 1, 1, 5, 23, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (178, 2, 1, 8, 23, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (179, 3, 1, 2, 23, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (180, 4, 1, 7, 23, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (181, 5, 1, 6, 23, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (182, 6, 1, 3, 23, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (183, 7, 1, 1, 23, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (184, 8, 1, 4, 23, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (185, 1, 1, 3, 24, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (186, 2, 1, 1, 24, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (187, 3, 1, 8, 24, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (188, 4, 1, 6, 24, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (189, 5, 1, 5, 24, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (190, 6, 1, 2, 24, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (191, 7, 1, 4, 24, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (192, 8, 1, 7, 24, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (193, 1, 1, 4, 25, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (194, 2, 1, 3, 25, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (195, 3, 1, 1, 25, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (196, 4, 1, 6, 25, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (197, 5, 1, 2, 25, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (198, 6, 1, 8, 25, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (199, 7, 1, 7, 25, NULL)
GO
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (200, 8, 1, 5, 25, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (201, 1, 1, 3, 26, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (202, 2, 1, 5, 26, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (203, 3, 1, 8, 26, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (204, 4, 1, 7, 26, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (205, 5, 1, 6, 26, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (206, 6, 1, 4, 26, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (207, 7, 1, 2, 26, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (208, 8, 1, 1, 26, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (209, 1, 1, 8, 27, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (210, 2, 1, 6, 27, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (211, 3, 1, 3, 27, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (212, 4, 1, 4, 27, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (213, 5, 1, 5, 27, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (214, 6, 1, 1, 27, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (215, 7, 1, 2, 27, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (216, 8, 1, 7, 27, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (217, 1, 1, 3, 28, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (218, 2, 1, 1, 28, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (219, 3, 1, 4, 28, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (220, 4, 1, 8, 28, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (221, 5, 1, 6, 28, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (222, 6, 1, 2, 28, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (223, 7, 1, 5, 28, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (224, 8, 1, 7, 28, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (225, 1, 1, 1, 29, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (226, 2, 1, 4, 29, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (227, 3, 1, 6, 29, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (228, 4, 1, 3, 29, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (229, 5, 1, 8, 29, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (230, 6, 1, 2, 29, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (231, 7, 1, 5, 29, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (232, 8, 1, 7, 29, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (233, 1, 1, 5, 30, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (234, 2, 1, 8, 30, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (235, 3, 1, 7, 30, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (236, 4, 1, 3, 30, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (237, 5, 1, 2, 30, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (238, 6, 1, 6, 30, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (239, 7, 1, 4, 30, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (240, 8, 1, 1, 30, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (241, 1, 1, 5, 31, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (242, 2, 1, 4, 31, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (243, 3, 1, 8, 31, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (244, 4, 1, 2, 31, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (245, 5, 1, 6, 31, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (246, 6, 1, 7, 31, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (247, 7, 1, 1, 31, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (248, 8, 1, 3, 31, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (249, 1, 1, 8, 32, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (250, 2, 1, 4, 32, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (251, 3, 1, 2, 32, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (252, 4, 1, 5, 32, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (253, 5, 1, 7, 32, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (254, 6, 1, 6, 32, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (255, 7, 1, 3, 32, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (256, 8, 1, 1, 32, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (257, 1, 1, 1, 33, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (258, 2, 1, 5, 33, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (259, 3, 1, 8, 33, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (260, 4, 1, 7, 33, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (261, 5, 1, 3, 33, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (262, 6, 1, 2, 33, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (263, 7, 1, 6, 33, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (264, 8, 1, 4, 33, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (265, 1, 1, 8, 34, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (266, 2, 1, 4, 34, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (267, 3, 1, 6, 34, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (268, 4, 1, 7, 34, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (269, 5, 1, 5, 34, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (270, 6, 1, 3, 34, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (271, 7, 1, 1, 34, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (272, 8, 1, 2, 34, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (273, 1, 1, 4, 35, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (274, 2, 1, 2, 35, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (275, 3, 1, 5, 35, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (276, 4, 1, 7, 35, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (277, 5, 1, 6, 35, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (278, 6, 1, 8, 35, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (279, 7, 1, 3, 35, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (280, 8, 1, 1, 35, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (281, 1, 1, 7, 36, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (282, 2, 1, 1, 36, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (283, 3, 1, 2, 36, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (284, 4, 1, 5, 36, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (285, 5, 1, 6, 36, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (286, 6, 1, 4, 36, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (287, 7, 1, 3, 36, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (288, 8, 1, 8, 36, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (289, 1, 1, 6, 37, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (290, 2, 1, 5, 37, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (291, 3, 1, 1, 37, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (292, 4, 1, 7, 37, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (293, 5, 1, 2, 37, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (294, 6, 1, 3, 37, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (295, 7, 1, 8, 37, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (296, 8, 1, 4, 37, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (297, 1, 1, 8, 38, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (298, 2, 1, 2, 38, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (299, 3, 1, 6, 38, NULL)
GO
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (300, 4, 1, 1, 38, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (301, 5, 1, 3, 38, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (302, 6, 1, 5, 38, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (303, 7, 1, 4, 38, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (304, 8, 1, 7, 38, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (305, 1, 1, 4, 39, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (306, 2, 1, 2, 39, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (307, 3, 1, 6, 39, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (308, 4, 1, 8, 39, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (309, 5, 1, 7, 39, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (310, 6, 1, 3, 39, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (311, 7, 1, 5, 39, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (312, 8, 1, 1, 39, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (313, 1, 0, 1, NULL, 1)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (314, 2, 1, 2, NULL, 1)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (315, 3, 0, 3, NULL, 1)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (316, 4, 0, 4, NULL, 1)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (317, 5, 0, 5, NULL, 1)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (318, 6, 0, 6, NULL, 1)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (319, 7, 0, 7, NULL, 1)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (320, 8, 0, 8, NULL, 1)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (321, 1, 0, 8, NULL, 2)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (322, 2, 0, 1, NULL, 2)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (323, 3, 0, 2, NULL, 2)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (324, 4, 0, 3, NULL, 2)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (325, 5, 0, 4, NULL, 2)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (326, 6, 0, 5, NULL, 2)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (327, 7, 0, 6, NULL, 2)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (328, 8, 0, 7, NULL, 2)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (329, 1, 0, 7, NULL, 3)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (330, 2, 0, 8, NULL, 3)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (331, 3, 0, 1, NULL, 3)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (332, 4, 0, 2, NULL, 3)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (333, 5, 0, 3, NULL, 3)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (334, 6, 0, 4, NULL, 3)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (335, 7, 1, 5, NULL, 3)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (336, 8, 0, 6, NULL, 3)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (337, 1, 0, 6, NULL, 4)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (338, 2, 0, 7, NULL, 4)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (339, 3, 0, 8, NULL, 4)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (340, 4, 0, 1, NULL, 4)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (341, 5, 0, 2, NULL, 4)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (342, 6, 1, 3, NULL, 4)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (343, 7, 0, 4, NULL, 4)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (344, 8, 0, 5, NULL, 4)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (345, 1, 1, 2, 40, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (346, 2, 1, 8, 40, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (347, 3, 1, 1, 40, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (348, 4, 1, 3, 40, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (349, 5, 1, 4, 40, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (350, 6, 1, 7, 40, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (351, 7, 1, 6, 40, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (352, 8, 1, 5, 40, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (353, 1, 1, 5, 41, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (354, 2, 1, 8, 41, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (355, 3, 1, 2, 41, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (356, 4, 1, 4, 41, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (357, 5, 1, 6, 41, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (358, 6, 1, 1, 41, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (359, 7, 1, 3, 41, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (360, 8, 1, 7, 41, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (361, 1, 1, 7, 42, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (362, 2, 1, 1, 42, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (363, 3, 1, 4, 42, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (364, 4, 1, 6, 42, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (365, 5, 1, 8, 42, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (366, 6, 1, 5, 42, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (367, 7, 1, 3, 42, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (368, 8, 1, 2, 42, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (369, 1, 0, 1, NULL, 5)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (370, 2, 0, 2, NULL, 5)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (371, 3, 0, 5, NULL, 5)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (372, 4, 0, 3, NULL, 5)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (373, 5, 0, 4, NULL, 5)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (374, 6, 0, 8, NULL, 5)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (375, 7, 0, 7, NULL, 5)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (376, 8, 0, 6, NULL, 5)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (377, 1, 1, 8, 43, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (378, 2, 1, 6, 43, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (379, 3, 1, 4, 43, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (380, 4, 1, 3, 43, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (381, 5, 1, 5, 43, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (382, 6, 1, 1, 43, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (383, 7, 1, 7, 43, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (384, 8, 1, 2, 43, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (385, 1, 1, 4, 44, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (386, 2, 1, 3, 44, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (387, 3, 1, 2, 44, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (388, 4, 1, 7, 44, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (389, 5, 1, 5, 44, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (390, 6, 1, 8, 44, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (391, 7, 1, 6, 44, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (392, 8, 1, 1, 44, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (393, 1, 1, 1, 45, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (394, 2, 1, 4, 45, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (395, 3, 1, 6, 45, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (396, 4, 1, 5, 45, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (397, 5, 1, 8, 45, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (398, 6, 1, 7, 45, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (399, 7, 1, 2, 45, NULL)
GO
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (400, 8, 1, 3, 45, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (401, 1, 1, 6, 46, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (402, 2, 1, 7, 46, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (403, 3, 1, 8, 46, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (404, 4, 1, 3, 46, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (405, 5, 1, 2, 46, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (406, 6, 1, 5, 46, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (407, 7, 1, 4, 46, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (408, 8, 1, 1, 46, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (409, 1, 1, 3, 47, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (410, 2, 1, 4, 47, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (411, 3, 1, 7, 47, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (412, 4, 1, 2, 47, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (413, 5, 1, 8, 47, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (414, 6, 1, 5, 47, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (415, 7, 1, 6, 47, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (416, 8, 1, 1, 47, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (417, 1, 1, 6, 48, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (418, 2, 1, 7, 48, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (419, 3, 1, 1, 48, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (420, 4, 1, 8, 48, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (421, 5, 1, 2, 48, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (422, 6, 1, 3, 48, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (423, 7, 1, 5, 48, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (424, 8, 1, 4, 48, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (425, 1, 1, 1, 49, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (426, 2, 1, 7, 49, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (427, 3, 1, 2, 49, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (428, 4, 1, 3, 49, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (429, 5, 1, 6, 49, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (430, 6, 1, 8, 49, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (431, 7, 1, 5, 49, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (432, 8, 1, 4, 49, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (433, 1, 1, 7, 50, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (434, 2, 1, 4, 50, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (435, 3, 1, 3, 50, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (436, 4, 1, 5, 50, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (437, 5, 1, 2, 50, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (438, 6, 1, 6, 50, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (439, 7, 1, 8, 50, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (440, 8, 1, 1, 50, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (441, 1, 1, 2, 51, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (442, 2, 1, 4, 51, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (443, 3, 1, 8, 51, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (444, 4, 1, 5, 51, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (445, 5, 1, 7, 51, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (446, 6, 1, 6, 51, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (447, 7, 1, 3, 51, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (448, 8, 1, 1, 51, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (449, 1, 1, 1, 52, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (450, 2, 1, 8, 52, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (451, 3, 1, 2, 52, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (452, 4, 1, 4, 52, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (453, 5, 1, 7, 52, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (454, 6, 1, 3, 52, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (455, 7, 1, 5, 52, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (456, 8, 1, 6, 52, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (457, 1, 1, 5, 53, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (458, 2, 1, 4, 53, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (459, 3, 1, 3, 53, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (460, 4, 1, 1, 53, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (461, 5, 1, 2, 53, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (462, 6, 1, 7, 53, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (463, 7, 1, 6, 53, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (464, 8, 1, 8, 53, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (465, 1, 1, 1, 54, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (466, 2, 1, 2, 54, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (467, 3, 1, 4, 54, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (468, 4, 1, 7, 54, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (469, 5, 1, 6, 54, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (470, 6, 1, 8, 54, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (471, 7, 1, 5, 54, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (472, 8, 1, 3, 54, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (473, 1, 1, 7, 55, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (474, 2, 1, 2, 55, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (475, 3, 1, 4, 55, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (476, 4, 1, 1, 55, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (477, 5, 1, 5, 55, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (478, 6, 1, 6, 55, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (479, 7, 1, 8, 55, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (480, 8, 1, 3, 55, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (481, 1, 1, 2, 56, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (482, 2, 1, 4, 56, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (483, 3, 1, 5, 56, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (484, 4, 1, 6, 56, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (485, 5, 1, 7, 56, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (486, 6, 1, 8, 56, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (487, 7, 1, 3, 56, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (488, 8, 1, 1, 56, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (489, 1, 1, 5, 57, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (490, 2, 1, 6, 57, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (491, 3, 1, 8, 57, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (492, 4, 1, 4, 57, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (493, 5, 1, 1, 57, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (494, 6, 1, 2, 57, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (495, 7, 1, 3, 57, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (496, 8, 1, 7, 57, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (497, 1, 1, 7, 58, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (498, 2, 1, 8, 58, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (499, 3, 1, 6, 58, NULL)
GO
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (500, 4, 1, 3, 58, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (501, 5, 1, 5, 58, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (502, 6, 1, 2, 58, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (503, 7, 1, 4, 58, NULL)
INSERT [dbo].[Columns] ([Id], [Position], [Valid], [Color_Id], [Game_Id], [Line_Id]) VALUES (504, 8, 1, 1, 58, NULL)
SET IDENTITY_INSERT [dbo].[Columns] OFF
SET IDENTITY_INSERT [dbo].[Games] ON 

INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (1, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (2, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (3, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (4, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (5, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (6, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (7, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (8, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (9, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (10, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (11, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (12, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (13, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (14, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (15, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (16, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (17, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (18, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (19, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (20, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (21, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (22, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (23, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (24, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (25, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (26, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (27, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (28, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (29, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (30, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (31, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (32, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (33, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (34, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (35, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (36, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (37, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (38, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (39, 0, 8, 10, N'S', 6)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (40, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (41, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (42, 0, 8, 10, N'S', 9)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (43, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (44, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (45, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (46, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (47, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (48, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (49, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (50, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (51, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (52, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (53, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (54, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (55, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (56, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (57, 0, 8, 10, N'S', 10)
INSERT [dbo].[Games] ([Id], [Multiplayer], [TotalColors], [TotalLines], [Status], [Score]) VALUES (58, 0, 8, 10, N'S', 10)
SET IDENTITY_INSERT [dbo].[Games] OFF
SET IDENTITY_INSERT [dbo].[Lines] ON 

INSERT [dbo].[Lines] ([Id], [Number], [CorrectColors], [CorrectPositions], [Valid], [Game_Id]) VALUES (1, 1, 8, 1, 0, 39)
INSERT [dbo].[Lines] ([Id], [Number], [CorrectColors], [CorrectPositions], [Valid], [Game_Id]) VALUES (2, 2, 8, 0, 0, 39)
INSERT [dbo].[Lines] ([Id], [Number], [CorrectColors], [CorrectPositions], [Valid], [Game_Id]) VALUES (3, 3, 8, 1, 0, 39)
INSERT [dbo].[Lines] ([Id], [Number], [CorrectColors], [CorrectPositions], [Valid], [Game_Id]) VALUES (4, 4, 8, 1, 0, 39)
INSERT [dbo].[Lines] ([Id], [Number], [CorrectColors], [CorrectPositions], [Valid], [Game_Id]) VALUES (5, 1, 8, 0, 0, 42)
SET IDENTITY_INSERT [dbo].[Lines] OFF
INSERT [dbo].[Parameters] ([Name], [Value]) VALUES (N'TotalLines', N'10')
SET IDENTITY_INSERT [dbo].[Players] ON 

INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (1, N'Alexandre', 1)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (2, N'Eduardo', 2)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (3, N'Eduardo', 3)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (4, N'Eduardo', 4)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (5, N'Eduardo', 5)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (6, N'Eduardo', 6)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (7, N'Eduardo', 7)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (8, N'Eduardo', 8)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (9, N'Eduardo', 9)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (10, N'Eduardo', 10)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (11, N'Eduardo', 11)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (12, N'Eduardo', 12)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (13, N'Eduardo', 13)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (14, N'Eduardo', 14)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (15, N'Eduardo', 15)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (16, N'Eduardo', 16)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (17, N'Eduardo', 17)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (18, N'Eduardo', 18)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (19, N'Eduardo', 19)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (20, N'Eduardo', 20)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (21, N'Eduardo', 21)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (22, N'Eduardo', 22)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (23, N'Eduardo', 23)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (24, N'Eduardo', 24)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (25, N'Eduardo', 25)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (26, N'Eduardo', 26)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (27, N'Eduardo', 27)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (28, N'Eduardo', 28)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (29, N'Eduardo', 29)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (30, N'Eduardo', 30)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (31, N'Eduardo', 31)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (32, N'Eduardo', 32)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (33, N'Eduardo', 33)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (34, N'Eduardo', 34)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (35, N'Eduardo', 35)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (36, N'Eduardo', 36)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (37, N'Eduardo', 37)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (38, N'Eduardo', 38)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (39, N'Eduardo', 39)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (40, N'Eduardo', 40)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (41, N'Nicacio', 41)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (42, N'Nicacio', 42)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (43, N'Nicacio', 43)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (44, N'Nicacio', 44)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (45, N'Nicacio', 45)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (46, N'Nicacio', 46)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (47, N'Nicacio', 47)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (48, N'Nicacio', 48)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (49, N'Nicacio', 49)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (50, N'Nicacio', 50)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (51, N'Nicacio', 51)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (52, N'Nicacio', 52)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (53, N'Nicacio', 53)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (54, N'Nicacio', 54)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (55, N'Nicacio', 55)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (56, N'Nicacio', 56)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (57, N'Nicacio', 57)
INSERT [dbo].[Players] ([Id], [Name], [Game_Id]) VALUES (58, N'Nicacio', 58)
SET IDENTITY_INSERT [dbo].[Players] OFF
/****** Object:  Index [IX_Color_Id]    Script Date: 22/05/2016 21:01:51 ******/
CREATE NONCLUSTERED INDEX [IX_Color_Id] ON [dbo].[Columns]
(
	[Color_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Game_Id]    Script Date: 22/05/2016 21:01:51 ******/
CREATE NONCLUSTERED INDEX [IX_Game_Id] ON [dbo].[Columns]
(
	[Game_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Line_Id]    Script Date: 22/05/2016 21:01:51 ******/
CREATE NONCLUSTERED INDEX [IX_Line_Id] ON [dbo].[Columns]
(
	[Line_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Game_Id]    Script Date: 22/05/2016 21:01:51 ******/
CREATE NONCLUSTERED INDEX [IX_Game_Id] ON [dbo].[Lines]
(
	[Game_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Game_Id]    Script Date: 22/05/2016 21:01:51 ******/
CREATE NONCLUSTERED INDEX [IX_Game_Id] ON [dbo].[Players]
(
	[Game_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Columns]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Columns_dbo.Colors_Color_Id] FOREIGN KEY([Color_Id])
REFERENCES [dbo].[Colors] ([Id])
GO
ALTER TABLE [dbo].[Columns] CHECK CONSTRAINT [FK_dbo.Columns_dbo.Colors_Color_Id]
GO
ALTER TABLE [dbo].[Columns]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Columns_dbo.Games_Game_Id] FOREIGN KEY([Game_Id])
REFERENCES [dbo].[Games] ([Id])
GO
ALTER TABLE [dbo].[Columns] CHECK CONSTRAINT [FK_dbo.Columns_dbo.Games_Game_Id]
GO
ALTER TABLE [dbo].[Columns]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Columns_dbo.Lines_Line_Id] FOREIGN KEY([Line_Id])
REFERENCES [dbo].[Lines] ([Id])
GO
ALTER TABLE [dbo].[Columns] CHECK CONSTRAINT [FK_dbo.Columns_dbo.Lines_Line_Id]
GO
ALTER TABLE [dbo].[Lines]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Lines_dbo.Games_Game_Id] FOREIGN KEY([Game_Id])
REFERENCES [dbo].[Games] ([Id])
GO
ALTER TABLE [dbo].[Lines] CHECK CONSTRAINT [FK_dbo.Lines_dbo.Games_Game_Id]
GO
ALTER TABLE [dbo].[Players]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Players_dbo.Games_Game_Id] FOREIGN KEY([Game_Id])
REFERENCES [dbo].[Games] ([Id])
GO
ALTER TABLE [dbo].[Players] CHECK CONSTRAINT [FK_dbo.Players_dbo.Games_Game_Id]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTopTenScores]    Script Date: 22/05/2016 21:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===============================================
-- Author:		Eduardo Nicacio (@eduardonicacio)
-- Create date: 22 May, 2016
-- Description:	Returs the Top 10 MasterMind scores
-- ================================================
CREATE PROCEDURE [dbo].[sp_GetTopTenScores]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT TOP 10
			   P.[Name],
			   G.[Score]
		  FROM [dbo].[Games] G
	INNER JOIN [dbo].[Players] P
			ON G.Id = P.Game_Id
	  ORDER BY G.Score, P.Name

END

GO
USE [master]
GO
ALTER DATABASE [Mastermind] SET  READ_WRITE 
GO
