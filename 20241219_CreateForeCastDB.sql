USE [master]
GO
/****** Object:  Database [ForeCast]    Script Date: 19.12.2024 21:09:11 ******/
CREATE DATABASE [ForeCast]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ForeCast_dat', FILENAME = N'D:\ProjekteDatabase\ForeCast\ForeCast_dat.mdf' , SIZE = 102400KB , MAXSIZE = 1024000KB , FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ForeCast_log', FILENAME = N'D:\ProjekteDatabase\ForeCast\ForeCast_log.ldf' , SIZE = 102400KB , MAXSIZE = 1024000KB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ForeCast] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ForeCast].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ForeCast] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ForeCast] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ForeCast] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ForeCast] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ForeCast] SET ARITHABORT OFF 
GO
ALTER DATABASE [ForeCast] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ForeCast] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ForeCast] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ForeCast] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ForeCast] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ForeCast] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ForeCast] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ForeCast] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ForeCast] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ForeCast] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ForeCast] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ForeCast] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ForeCast] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ForeCast] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ForeCast] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ForeCast] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ForeCast] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ForeCast] SET RECOVERY FULL 
GO
ALTER DATABASE [ForeCast] SET  MULTI_USER 
GO
ALTER DATABASE [ForeCast] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ForeCast] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ForeCast] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ForeCast] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ForeCast] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ForeCast] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ForeCast', N'ON'
GO
ALTER DATABASE [ForeCast] SET QUERY_STORE = ON
GO
ALTER DATABASE [ForeCast] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ForeCast]
GO
/****** Object:  User [SysForeCast]    Script Date: 19.12.2024 21:09:11 ******/
CREATE USER [SysForeCast] FOR LOGIN [SysForeCast] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [SysForeCast]
GO
/****** Object:  Table [dbo].[CommunicationList]    Script Date: 19.12.2024 21:09:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommunicationList](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Recipient_Id] [bigint] NOT NULL,
	[Recommendation_Id] [bigint] NOT NULL,
	[CommunicationType] [nvarchar](100) NOT NULL,
	[CommunicationIdentifier] [nvarchar](100) NOT NULL,
	[Headline] [nvarchar](100) NOT NULL,
	[Text] [nvarchar](1000) NOT NULL,
	[IsSent] [bit] NOT NULL,
	[SentDateTime] [datetime] NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[Updated] [datetime] NULL,
	[UpdatedBy] [nchar](10) NULL,
 CONSTRAINT [PK_CommunicationList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeasuredData]    Script Date: 19.12.2024 21:09:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeasuredData](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TypeOfMeasuredData_Id] [nvarchar](50) NOT NULL,
	[MeasuredDateTime] [datetime] NOT NULL,
	[MeasuredValue] [nvarchar](50) NOT NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[Updated] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_MeasuredData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipient]    Script Date: 19.12.2024 21:09:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipient](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Salutation] [nvarchar](50) NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[Notice] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[GeoInformation] [nvarchar](50) NULL,
	[TypeORecommendations] [nvarchar](1000) NULL,
	[CommunicationData] [nvarchar](1000) NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[Updated] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recommendation]    Script Date: 19.12.2024 21:09:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recommendation](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TypeOfRecommendtion_Id] [nvarchar](50) NOT NULL,
	[Variable] [nvarchar](50) NOT NULL,
	[Headline] [nvarchar](100) NOT NULL,
	[Text] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[Updated] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Recommendation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfMeasuredData]    Script Date: 19.12.2024 21:09:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfMeasuredData](
	[Id] [nvarchar](50) NOT NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[Updated] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_TypeOfMeasuredData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfRecommendation]    Script Date: 19.12.2024 21:09:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfRecommendation](
	[Id] [nvarchar](50) NOT NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[Updated] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_TypeOfRecommendation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CommunicationList] ADD  CONSTRAINT [DF_CommunicationList_IsSent]  DEFAULT ((0)) FOR [IsSent]
GO
ALTER TABLE [dbo].[Recipient] ADD  CONSTRAINT [DF_Recipient_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Recommendation] ADD  CONSTRAINT [DF_Recommendation_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CommunicationList]  WITH CHECK ADD  CONSTRAINT [FK_CommunicationList_Recipient] FOREIGN KEY([Recipient_Id])
REFERENCES [dbo].[Recipient] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CommunicationList] CHECK CONSTRAINT [FK_CommunicationList_Recipient]
GO
ALTER TABLE [dbo].[CommunicationList]  WITH CHECK ADD  CONSTRAINT [FK_CommunicationList_Recommendation] FOREIGN KEY([Recommendation_Id])
REFERENCES [dbo].[Recommendation] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CommunicationList] CHECK CONSTRAINT [FK_CommunicationList_Recommendation]
GO
ALTER TABLE [dbo].[MeasuredData]  WITH CHECK ADD  CONSTRAINT [FK_MeasuredData_TypeOfMeasuredData] FOREIGN KEY([TypeOfMeasuredData_Id])
REFERENCES [dbo].[TypeOfMeasuredData] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[MeasuredData] CHECK CONSTRAINT [FK_MeasuredData_TypeOfMeasuredData]
GO
ALTER TABLE [dbo].[Recommendation]  WITH CHECK ADD  CONSTRAINT [FK_Recommendation_TypeOfRecommendation] FOREIGN KEY([TypeOfRecommendtion_Id])
REFERENCES [dbo].[TypeOfRecommendation] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Recommendation] CHECK CONSTRAINT [FK_Recommendation_TypeOfRecommendation]
GO
USE [master]
GO
ALTER DATABASE [ForeCast] SET  READ_WRITE 
GO
