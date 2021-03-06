USE [master]
GO
/****** Object:  Database [MCap_V02]    Script Date: 5/30/2018 10:05:15 AM ******/
CREATE DATABASE [MCap_V02]
GO
ALTER DATABASE [MCap_V02] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MCap_V02] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MCap_V02] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MCap_V02] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MCap_V02] SET ARITHABORT OFF 
GO
ALTER DATABASE [MCap_V02] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MCap_V02] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MCap_V02] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MCap_V02] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MCap_V02] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MCap_V02] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MCap_V02] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MCap_V02] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MCap_V02] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MCap_V02] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MCap_V02] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MCap_V02] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MCap_V02] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MCap_V02] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MCap_V02] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MCap_V02] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MCap_V02] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MCap_V02] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MCap_V02] SET  MULTI_USER 
GO
ALTER DATABASE [MCap_V02] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MCap_V02] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MCap_V02] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MCap_V02] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MCap_V02] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MCap_V02]
GO
/****** Object:  User [vnpt_mcap]    Script Date: 5/30/2018 10:05:15 AM ******/
CREATE LOGIN vnpt_mcap WITH PASSWORD = 'vnpt_mcap@123'
GO
CREATE USER vnpt_mcap FOR LOGIN vnpt_mcap
GO
GRANT ALTER To vnpt_mcap
GO
GRANT CONTROL To vnpt_mcap
GO
ALTER ROLE db_datareader ADD MEMBER vnpt_mcap
GO
ALTER ROLE db_datawriter ADD MEMBER vnpt_mcap
GO
/****** Object:  Table [dbo].[Concept]    Script Date: 5/30/2018 10:05:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Concept](
	[ConceptId] [int] IDENTITY(1,1) NOT NULL,
	[ConceptCode] [nvarchar](50) NOT NULL,
	[ConceptName] [nvarchar](max) NOT NULL,
	[ShortName] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[ConceptPrice] [decimal](18, 0) NULL,
	[Status] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [int] NULL,
	[ModifiedDate] [date] NULL,
	[ModifiedBy] [int] NULL,
	[DefaultTemplate] [int] NULL,
	[DescriptionForm] [varchar](50) NULL,
	[ConceptType] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ConceptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Concept_Template]    Script Date: 5/30/2018 10:05:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Concept_Template](
	[ConceptId] [int] NOT NULL,
	[TemplateId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ConceptId] ASC,
	[TemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HeartDescription]    Script Date: 5/30/2018 10:05:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HeartDescription](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[CreatedById] [int] NOT NULL,
	[Dao] [nvarchar](50) NULL,
	[Domo] [nvarchar](50) NULL,
	[Vongvan] [nvarchar](50) NULL,
	[Efslope] [nvarchar](50) NULL,
	[Nhiptim] [nvarchar](50) NULL,
	[Dla] [nvarchar](50) NULL,
	[Ivsd] [nvarchar](50) NULL,
	[Lvdd] [nvarchar](50) NULL,
	[Lvpwd] [nvarchar](50) NULL,
	[Ivss] [nvarchar](50) NULL,
	[Lvds] [nvarchar](50) NULL,
	[Lvpws] [nvarchar](50) NULL,
	[Fs] [nvarchar](50) NULL,
	[Ef] [nvarchar](50) NULL,
	[Rvdd] [nvarchar](50) NULL,
	[PeakvDMP] [nvarchar](50) NULL,
	[PeakgDMP] [nvarchar](50) NULL,
	[DonghoDMP] [nvarchar](50) NULL,
	[Papm] [nvarchar](50) NULL,
	[Peakv3la] [nvarchar](50) NULL,
	[Peakg3la] [nvarchar](50) NULL,
	[Dongho3la] [nvarchar](50) NULL,
	[Paps] [nvarchar](50) NULL,
	[PeakvDMC] [nvarchar](50) NULL,
	[PeakgDMC] [nvarchar](50) NULL,
	[DonghoDMC] [nvarchar](50) NULL,
	[PhtDMC] [nvarchar](50) NULL,
	[VanhepDMC] [nvarchar](50) NULL,
	[Peakv2la] [nvarchar](50) NULL,
	[Peakg2la] [nvarchar](50) NULL,
	[Dongho2la] [nvarchar](50) NULL,
	[Pht2la] [nvarchar](50) NULL,
	[Ea2la] [nvarchar](50) NULL,
	[Dt2la] [nvarchar](50) NULL,
	[Conclude] [text] NULL,
	[Suggestion] [text] NULL,
 CONSTRAINT [PK_HeartDescription] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Modality]    Script Date: 5/30/2018 10:05:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modality](
	[ModalityId] [int] IDENTITY(1,1) NOT NULL,
	[ModalityName] [nvarchar](50) NULL,
	[ModalityCode] [nvarchar](50) NULL,
	[ModalityAET] [nvarchar](50) NULL,
	[ModalityType] [nvarchar](50) NULL,
	[DicomUidRoot] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [int] NULL,
	[IsUsed] [bit] NULL,
 CONSTRAINT [PK_Modality] PRIMARY KEY CLUSTERED 
(
	[ModalityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Patient]    Script Date: 5/30/2018 10:05:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[PatientId] [int] IDENTITY(1,1) NOT NULL,
	[PatientCode] [nvarchar](50) NOT NULL,
	[PatientCodeFromRIS] [nvarchar](50) NULL,
	[PatientType] [nvarchar](50) NULL,
	[PatientName] [nvarchar](50) NOT NULL,
	[InsuranceNumber] [nvarchar](50) NULL,
	[YearOfBirth] [int] NULL,
	[Gender] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NULL,
	[History] [nvarchar](max) NULL,
	[CreateBy] [int] NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuickTemplate]    Script Date: 5/30/2018 10:05:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuickTemplate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TemplateId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ShortName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Conclude] [nvarchar](max) NULL,
	[Suggestion] [nvarchar](max) NULL,
	[CreateBy] [int] NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuickWord]    Script Date: 5/30/2018 10:05:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuickWord](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Shortcut] [varchar](10) NOT NULL,
	[Description] [nvarchar](300) NOT NULL,
	[Status] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModalityType] [nvarchar](50) NULL,
	[Area] [nvarchar](50) NULL,
 CONSTRAINT [PK_QuickWord] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuickWordCount]    Script Date: 5/30/2018 10:05:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuickWordCount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[WordId] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_QuickWordCount_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RadiologyOrder]    Script Date: 5/30/2018 10:05:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RadiologyOrder](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderCode] [nvarchar](50) NOT NULL,
	[RequestCode] [nvarchar](50) NULL,
	[PatientId] [int] NOT NULL,
	[ConceptId] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[OrderStatus] [nvarchar](50) NULL,
	[AccessNumber] [int] NULL,
	[Status] [int] NOT NULL,
	[PatientAge] [int] NOT NULL,
	[OrderType] [nvarchar](50) NOT NULL,
	[StudyInstanceUID] [nvarchar](255) NULL,
	[CreateBy] [int] NULL,
	[CreateDate] [datetime] NULL,
	[RadiologistId] [int] NULL,
	[AssistantId] [int] NULL,
	[ModalityName] [nvarchar](50) NULL,
	[ClinicalSymptoms] [nvarchar](max) NULL,
	[PreliminaryDiagnosis] [nvarchar](max) NULL,
	[OrderNote] [nvarchar](255) NULL,
	[DoctorAppointed] [nvarchar](50) NULL,
	[RequestType] [nvarchar](50) NULL,
	[ObsDateTime] [datetime] NULL,
	[ModalityId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Report]    Script Date: 5/30/2018 10:05:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ReportId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[DescriptionHtml] [nvarchar](max) NOT NULL,
	[Conclude] [nvarchar](max) NOT NULL,
	[Suggestion] [nvarchar](max) NULL,
	[ImagesPath] [nvarchar](255) NULL,
	[IsSentRis] [bit] NULL,
	[IsSentPacs] [bit] NULL,
	[CreateBy] [int] NULL,
	[CreateDate] [datetime] NULL,
	[ReportType] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReportTemplate]    Script Date: 5/30/2018 10:05:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportTemplate](
	[TemplateId] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Conclude] [nvarchar](max) NULL,
	[Suggestion] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[CreateDate] [date] NULL,
	[CreateBy] [int] NULL,
	[ModifiedDate] [date] NULL,
	[ModifiedBy] [int] NULL,
	[TemplateCode] [nvarchar](50) NULL,
	[ModalityType] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Setting]    Script Date: 5/30/2018 10:05:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Setting](
	[SettingId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](255) NULL,
	[value] [nvarchar](255) NOT NULL,
	[ModifiedDate] [date] NULL,
	[ModifiedBy] [int] NULL,
	[ModalityId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SinhThiet]    Script Date: 5/30/2018 10:05:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhThiet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[CreatedById] [int] NOT NULL,
	[Yeucauxetnghiem] [nvarchar](255) NULL,
	[Sinhthietduoclaytu] [nvarchar](255) NULL,
	[Codinhdungdich] [nvarchar](255) NULL,
	[Tomtatdauhieulamsang] [nvarchar](max) NULL,
	[Quatrinhdieutri] [nvarchar](max) NULL,
	[Nhanxetdaithe] [nvarchar](max) NULL,
	[Ketqualantruoc] [nvarchar](max) NULL,
	[Chandoanlamsang] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_SinhThiet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 5/30/2018 10:05:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserRISId] [int] NULL,
	[UserType] [nvarchar](50) NULL,
	[Username] [nvarchar](50) NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](max) NULL,
	[UserPhone] [nvarchar](50) NULL,
	[UserEmail] [nvarchar](50) NULL,
	[UserRole] [nvarchar](50) NULL,
	[CreateDate] [date] NULL,
	[CreateBy] [int] NULL,
	[Status] [int] NULL,
	[ModifiedDate] [date] NULL,
	[ModifiedBy] [int] NULL,
	[IsUpdatedPassword] [bit] NULL,
	[UserCode] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET IDENTITY_INSERT [dbo].[User] ON 
INSERT [dbo].[User] ([UserId], [UserRISId], [UserType], [Username], [FullName], [Password], [UserPhone], [UserEmail], [UserRole], [CreateDate], [CreateBy], [Status], [ModifiedDate], [ModifiedBy], [IsUpdatedPassword], [UserCode]) VALUES (1, NULL, NULL, N'admin', N'ADMIN', N'TCuY2NJhvp8=', N'', N'', N'ADMIN', NULL, NULL, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF

ALTER TABLE [dbo].[QuickWordCount] ADD  CONSTRAINT [DF_QuickWordCount_Count]  DEFAULT ((0)) FOR [Count]
GO
ALTER TABLE [dbo].[Concept_Template]  WITH CHECK ADD FOREIGN KEY([ConceptId])
REFERENCES [dbo].[Concept] ([ConceptId])
GO
ALTER TABLE [dbo].[Concept_Template]  WITH CHECK ADD FOREIGN KEY([TemplateId])
REFERENCES [dbo].[ReportTemplate] ([TemplateId])
GO
ALTER TABLE [dbo].[HeartDescription]  WITH CHECK ADD  CONSTRAINT [FK_HeartDescription_RadiologyOrder1] FOREIGN KEY([OrderId])
REFERENCES [dbo].[RadiologyOrder] ([OrderId])
GO
ALTER TABLE [dbo].[HeartDescription] CHECK CONSTRAINT [FK_HeartDescription_RadiologyOrder1]
GO
ALTER TABLE [dbo].[QuickTemplate]  WITH CHECK ADD FOREIGN KEY([TemplateId])
REFERENCES [dbo].[ReportTemplate] ([TemplateId])
GO
ALTER TABLE [dbo].[QuickWordCount]  WITH CHECK ADD  CONSTRAINT [FK_QuickWordCount_QuickWord] FOREIGN KEY([WordId])
REFERENCES [dbo].[QuickWord] ([Id])
GO
ALTER TABLE [dbo].[QuickWordCount] CHECK CONSTRAINT [FK_QuickWordCount_QuickWord]
GO
ALTER TABLE [dbo].[QuickWordCount]  WITH CHECK ADD  CONSTRAINT [FK_QuickWordCount_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[QuickWordCount] CHECK CONSTRAINT [FK_QuickWordCount_User]
GO
ALTER TABLE [dbo].[RadiologyOrder]  WITH CHECK ADD FOREIGN KEY([AssistantId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[RadiologyOrder]  WITH CHECK ADD FOREIGN KEY([ConceptId])
REFERENCES [dbo].[Concept] ([ConceptId])
GO
ALTER TABLE [dbo].[RadiologyOrder]  WITH CHECK ADD FOREIGN KEY([CreateBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[RadiologyOrder]  WITH CHECK ADD FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
GO
ALTER TABLE [dbo].[RadiologyOrder]  WITH CHECK ADD FOREIGN KEY([RadiologistId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[RadiologyOrder]  WITH CHECK ADD  CONSTRAINT [FK_RadiologyOrder_Modality] FOREIGN KEY([ModalityId])
REFERENCES [dbo].[Modality] ([ModalityId])
GO
ALTER TABLE [dbo].[RadiologyOrder] CHECK CONSTRAINT [FK_RadiologyOrder_Modality]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD FOREIGN KEY([CreateBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[RadiologyOrder] ([OrderId])
GO
ALTER TABLE [dbo].[ReportTemplate]  WITH CHECK ADD FOREIGN KEY([CreateBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Setting]  WITH CHECK ADD FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[SinhThiet]  WITH CHECK ADD  CONSTRAINT [FK_SinhThiet_RadiologyOrder] FOREIGN KEY([OrderId])
REFERENCES [dbo].[RadiologyOrder] ([OrderId])
GO
ALTER TABLE [dbo].[SinhThiet] CHECK CONSTRAINT [FK_SinhThiet_RadiologyOrder]
GO
USE [master]
GO
ALTER DATABASE [MCap_V02] SET  READ_WRITE 
GO
