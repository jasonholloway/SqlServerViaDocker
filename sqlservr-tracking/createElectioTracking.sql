USE [master]
GO
/****** Object:  Database [electio_tracking]    Script Date: 13/05/2019 12:54:51 ******/
CREATE DATABASE [electio_tracking]
GO
ALTER DATABASE [electio_tracking] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [electio_tracking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [electio_tracking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [electio_tracking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [electio_tracking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [electio_tracking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [electio_tracking] SET ARITHABORT OFF 
GO
ALTER DATABASE [electio_tracking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [electio_tracking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [electio_tracking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [electio_tracking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [electio_tracking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [electio_tracking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [electio_tracking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [electio_tracking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [electio_tracking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [electio_tracking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [electio_tracking] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [electio_tracking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [electio_tracking] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [electio_tracking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [electio_tracking] SET  MULTI_USER 
GO
ALTER DATABASE [electio_tracking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [electio_tracking] SET ENCRYPTION ON
GO
ALTER DATABASE [electio_tracking] SET QUERY_STORE = ON
GO
ALTER DATABASE [electio_tracking] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO
USE [electio_tracking]
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_ADAPTIVE_JOINS = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_MEMORY_GRANT_FEEDBACK = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_ON_ROWSTORE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET DEFERRED_COMPILATION_TV = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_ONLINE = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_RESUMABLE = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET GLOBAL_TEMPORARY_TABLE_AUTO_DROP = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET INTERLEAVED_EXECUTION_TVF = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ISOLATE_SECURITY_POLICY_CARDINALITY = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LIGHTWEIGHT_QUERY_PROFILING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET OPTIMIZE_FOR_AD_HOC_WORKLOADS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ROW_MODE_MEMORY_GRANT_FEEDBACK = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET VERBOSE_TRUNCATION_WARNINGS = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_PROCEDURE_EXECUTION_STATISTICS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_QUERY_EXECUTION_STATISTICS = OFF;
GO
USE [electio_tracking]
GO
/****** Object:  Schema [DataSync]    Script Date: 13/05/2019 12:54:53 ******/
CREATE SCHEMA [DataSync]
GO
/****** Object:  Table [DataSync].[provision_marker_dss]    Script Date: 13/05/2019 12:54:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DataSync].[provision_marker_dss](
	[object_id] [int] NOT NULL,
	[owner_scope_local_id] [int] NOT NULL,
	[provision_scope_local_id] [int] NULL,
	[provision_timestamp] [bigint] NOT NULL,
	[provision_local_peer_key] [int] NOT NULL,
	[provision_scope_peer_key] [int] NULL,
	[provision_scope_peer_timestamp] [bigint] NULL,
	[provision_datetime] [datetime] NULL,
	[state] [int] NULL,
	[version] [timestamp] NOT NULL,
 CONSTRAINT [PK_DataSync.provision_marker_dss] PRIMARY KEY CLUSTERED 
(
	[owner_scope_local_id] ASC,
	[object_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [DataSync].[schema_info_dss]    Script Date: 13/05/2019 12:54:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DataSync].[schema_info_dss](
	[schema_major_version] [int] NOT NULL,
	[schema_minor_version] [int] NOT NULL,
	[schema_extended_info] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_DataSync.schema_info_dss] PRIMARY KEY CLUSTERED 
(
	[schema_major_version] ASC,
	[schema_minor_version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [DataSync].[scope_config_dss]    Script Date: 13/05/2019 12:54:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DataSync].[scope_config_dss](
	[config_id] [uniqueidentifier] NOT NULL,
	[config_data] [xml] NOT NULL,
	[scope_status] [char](1) NULL,
 CONSTRAINT [PK_DataSync.scope_config_dss] PRIMARY KEY CLUSTERED 
(
	[config_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [DataSync].[scope_info_dss]    Script Date: 13/05/2019 12:54:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DataSync].[scope_info_dss](
	[scope_local_id] [int] IDENTITY(1,1) NOT NULL,
	[scope_id] [uniqueidentifier] NOT NULL,
	[sync_scope_name] [nvarchar](100) NOT NULL,
	[scope_sync_knowledge] [varbinary](max) NULL,
	[scope_tombstone_cleanup_knowledge] [varbinary](max) NULL,
	[scope_timestamp] [timestamp] NULL,
	[scope_config_id] [uniqueidentifier] NULL,
	[scope_restore_count] [int] NOT NULL,
	[scope_user_comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_DataSync.scope_info_dss] PRIMARY KEY CLUSTERED 
(
	[sync_scope_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[CarrierConsignments]    Script Date: 13/05/2019 12:54:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarrierConsignments](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CarrierReference] [varchar](20) NOT NULL,
	[CarrierServiceReference] [varchar](20) NOT NULL,
	[ConsignmentReferenceForLegAssignedByCarrier] [varchar](30) NULL,
	[ConsignmentReferenceForLegAssignedByMpd] [bigint] NOT NULL,
	[ConsignmentTrackingReference] [varchar](30) NULL,
	[IsToBeTracked] [bit] NOT NULL,
	[LegNumber] [int] NOT NULL,
	[ConsignmentId] [bigint] NOT NULL,
	[RegisteredDateTime] [datetimeoffset](7) NOT NULL,
	[ConsignmentReferenceForAllLegsAssignedByMpd] [varchar](255) NOT NULL,
	[CarrierServiceName] [nvarchar](255) NOT NULL,
	[CarrierGatewayConfigurationId] [int] NULL,
	[DestinationCountry] [nvarchar](3) NOT NULL,
	[VersionCol] [timestamp] NOT NULL,
	[AdditionalTrackingInformation] [nvarchar](4000) NULL,
	[NextTrackableTime] [datetimeoffset](7) NOT NULL,
	[ConsignmentReferenceProvidedByCustomer] [nvarchar](255) NULL,
	[CarrierServiceCode] [nvarchar](50) NULL,
 CONSTRAINT [PK__CarrierC__3214EC0748BE6775] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[CarrierGatewayConfiguration]    Script Date: 13/05/2019 12:54:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarrierGatewayConfiguration](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Configuration] [varchar](2048) NOT NULL,
	[Active] [bit] NOT NULL,
	[CarrierAccountReference] [nvarchar](50) NOT NULL,
	[GatewayReference] [nvarchar](50) NOT NULL,
	[VersionCol] [timestamp] NOT NULL,
 CONSTRAINT [PK_CarrierGatewayConfiguration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[CarrierPackages]    Script Date: 13/05/2019 12:54:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarrierPackages](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PackageReferenceForLegAssignedByCarrier] [varchar](30) NULL,
	[PackageReferenceForLegAssignedByMpd] [bigint] NOT NULL,
	[PackageTrackingReference] [varchar](30) NULL,
	[CarrierConsignmentId] [bigint] NOT NULL,
	[PackageReferenceForAllLegsAssignedByMpd] [nvarchar](30) NOT NULL,
	[VersionCol] [timestamp] NOT NULL,
 CONSTRAINT [PK__CarrierP__3214EC076891B614] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Consignments]    Script Date: 13/05/2019 12:54:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consignments](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ConsignmentReferenceForAllLegsAssignedByMpd] [varchar](30) NOT NULL,
	[VersionCol] [timestamp] NOT NULL,
	[CustomerReference] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__Consignm__3214EC07CBD4B4AE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[DBCleanupLog]    Script Date: 13/05/2019 12:54:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBCleanupLog](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[DB_name] [nvarchar](255) NOT NULL,
	[ConsignmentReference] [nvarchar](255) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[Success] [bit] NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_DBCleanupLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[DBCleanupQueue]    Script Date: 13/05/2019 12:54:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBCleanupQueue](
	[ConsignmentReferenceForAllLegsAssignedByMpd] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_DBCleanupQueue] PRIMARY KEY CLUSTERED 
(
	[ConsignmentReferenceForAllLegsAssignedByMpd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[MappedEvents]    Script Date: 13/05/2019 12:54:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MappedEvents](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CarrierEventDescription] [varchar](255) NOT NULL,
	[CarrierEventCode] [varchar](255) NOT NULL,
	[EventGroup] [varchar](255) NOT NULL,
	[CarrierReference] [varchar](255) NOT NULL,
	[Description] [varchar](255) NULL,
 CONSTRAINT [PK_MappedEvents_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
 CONSTRAINT [UNQ_MappedEvents_CarrierReference_CarrierEventCode_CarrierEventDescription] UNIQUE NONCLUSTERED 
(
	[CarrierReference] ASC,
	[CarrierEventCode] ASC,
	[CarrierEventDescription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[ProcessTrackingEvents]    Script Date: 13/05/2019 12:54:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessTrackingEvents](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerReference] [uniqueidentifier] NOT NULL,
	[ConsignmentReferenceForAllLegsAssignedByMpd] [nvarchar](30) NOT NULL,
	[ConsignmentReferenceProvidedByCustomer] [nvarchar](255) NULL,
	[CarrierName] [nvarchar](255) NOT NULL,
	[CarrierServiceName] [nvarchar](255) NOT NULL,
	[CarrierServiceReference] [nvarchar](20) NOT NULL,
	[CarrierServiceCode] [nvarchar](50) NOT NULL,
	[ConsignmentTrackingReference] [nvarchar](20) NOT NULL,
	[CarrierEventCode] [nvarchar](20) NULL,
	[CarrierEventDateTime] [datetimeoffset](7) NULL,
	[CarrierEventName] [nvarchar](500) NULL,
	[PackageStatus] [nvarchar](255) NULL,
	[CarrierEventLocation] [nvarchar](100) NULL,
	[CarrierEventDescription] [nvarchar](500) NULL,
	[PackageTrackingReference] [nvarchar](20) NOT NULL,
	[SortedReceivedDate] [datetimeoffset](7) NULL,
	[SortedPackageRef] [nvarchar](30) NULL,
	[ProcessStart] [datetime] NULL,
	[ProcessEnd] [datetime] NULL,
	[EventSignature] [char](40) NULL,
	[FileName] [varchar](50) NULL,
 CONSTRAINT [PK_ProcessTrackingEvents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[ScheduleEntry]    Script Date: 13/05/2019 12:54:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleEntry](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[GroupName] [nvarchar](255) NOT NULL,
	[CronExpression] [nvarchar](255) NOT NULL,
	[JobType] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[Configuration] [nvarchar](4000) NULL,
 CONSTRAINT [PK_ScheduleEntry] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[TrackingConfiguration]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrackingConfiguration](
	[Id] [bigint] NOT NULL,
	[CarrierServiceReference] [nvarchar](50) NOT NULL,
	[IsTrackable] [bit] NOT NULL,
	[IsLatenessCalculationEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_TrackingConfiguration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[TrackingEvents]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrackingEvents](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CarrierEventCode] [varchar](255) NULL,
	[CarrierEventDescription] [varchar](500) NULL,
	[Description] [varchar](500) NOT NULL,
	[Date] [datetimeoffset](7) NOT NULL,
	[Location] [varchar](100) NULL,
	[Signatory] [varchar](50) NULL,
	[CarrierPackageId] [bigint] NULL,
	[MpdRecognisedEventGroup] [nvarchar](100) NOT NULL,
	[VersionCol] [timestamp] NOT NULL,
 CONSTRAINT [PK__Tracking__3214EC0749E1E3D3] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[VersionInfo]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VersionInfo](
	[Version] [bigint] NOT NULL,
	[AppliedOn] [datetime] NULL,
	[Description] [nvarchar](1024) NULL
)
GO
/****** Object:  Index [UC_Version]    Script Date: 13/05/2019 12:54:54 ******/
CREATE UNIQUE CLUSTERED INDEX [UC_Version] ON [dbo].[VersionInfo]
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Table [dbo].[WebhooksConfiguration]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebhooksConfiguration](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerReference] [uniqueidentifier] NOT NULL,
	[IsWebhookEnabled] [bit] NOT NULL,
	[UploadLocationType] [nvarchar](50) NOT NULL,
	[HostUrl] [nvarchar](255) NULL,
	[UploadFolder] [nvarchar](255) NULL,
	[UserName] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[AccessKey] [nvarchar](255) NULL,
	[PortNumber] [nvarchar](10) NULL,
	[ForceActive] [bit] NOT NULL,
	[PrivateKeyPath] [nvarchar](255) NULL,
 CONSTRAINT [PK_WebhooksConfiguration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Index [IX_CarrierConsignments_CarrierGatewayConfigurationId]    Script Date: 13/05/2019 12:54:54 ******/
CREATE NONCLUSTERED INDEX [IX_CarrierConsignments_CarrierGatewayConfigurationId] ON [dbo].[CarrierConsignments]
(
	[CarrierGatewayConfigurationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_CarrierConsignments_ConsignmentId]    Script Date: 13/05/2019 12:54:54 ******/
CREATE NONCLUSTERED INDEX [IX_CarrierConsignments_ConsignmentId] ON [dbo].[CarrierConsignments]
(
	[ConsignmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CarrierConsignments_ConsignmentReferenceForAllLegsAssignedByMpd]    Script Date: 13/05/2019 12:54:54 ******/
CREATE NONCLUSTERED INDEX [IX_CarrierConsignments_ConsignmentReferenceForAllLegsAssignedByMpd] ON [dbo].[CarrierConsignments]
(
	[ConsignmentReferenceForAllLegsAssignedByMpd] ASC
)
INCLUDE ( 	[Id],
	[VersionCol]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CarrierConsignments_ConsignmentTrackingReference]    Script Date: 13/05/2019 12:54:54 ******/
CREATE NONCLUSTERED INDEX [IX_CarrierConsignments_ConsignmentTrackingReference] ON [dbo].[CarrierConsignments]
(
	[ConsignmentTrackingReference] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_CarrierConsignments_IsActive]    Script Date: 13/05/2019 12:54:54 ******/
CREATE NONCLUSTERED INDEX [IX_CarrierConsignments_IsActive] ON [dbo].[CarrierConsignments]
(
	[IsToBeTracked] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CarrierReference_ConsignmentReference]    Script Date: 13/05/2019 12:54:54 ******/
CREATE NONCLUSTERED INDEX [IX_CarrierReference_ConsignmentReference] ON [dbo].[CarrierConsignments]
(
	[CarrierReference] ASC,
	[ConsignmentReferenceForLegAssignedByCarrier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_VerCol]    Script Date: 13/05/2019 12:54:54 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_VerCol] ON [dbo].[CarrierConsignments]
(
	[VersionCol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [nci_wi_CarrierConsignments_37A5660FDE352A6484CF516721C76134]    Script Date: 13/05/2019 12:54:54 ******/
CREATE NONCLUSTERED INDEX [nci_wi_CarrierConsignments_37A5660FDE352A6484CF516721C76134] ON [dbo].[CarrierConsignments]
(
	[ConsignmentReferenceForLegAssignedByMpd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [nci_wi_CarrierConsignments_6CE5071C1AD42E552F7EDCD435DEC553]    Script Date: 13/05/2019 12:54:54 ******/
CREATE NONCLUSTERED INDEX [nci_wi_CarrierConsignments_6CE5071C1AD42E552F7EDCD435DEC553] ON [dbo].[CarrierConsignments]
(
	[CarrierGatewayConfigurationId] ASC,
	[IsToBeTracked] ASC,
	[NextTrackableTime] ASC
)
INCLUDE ( 	[AdditionalTrackingInformation],
	[CarrierReference],
	[CarrierServiceName],
	[CarrierServiceReference],
	[ConsignmentReferenceForAllLegsAssignedByMpd],
	[ConsignmentReferenceForLegAssignedByCarrier],
	[ConsignmentReferenceForLegAssignedByMpd],
	[ConsignmentTrackingReference],
	[DestinationCountry],
	[LegNumber],
	[RegisteredDateTime]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CarrierGatewayConfiguration_GatewayCarrierAccount]    Script Date: 13/05/2019 12:54:54 ******/
CREATE NONCLUSTERED INDEX [IX_CarrierGatewayConfiguration_GatewayCarrierAccount] ON [dbo].[CarrierGatewayConfiguration]
(
	[GatewayReference] ASC,
	[CarrierAccountReference] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_VerCol]    Script Date: 13/05/2019 12:54:54 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_VerCol] ON [dbo].[CarrierGatewayConfiguration]
(
	[VersionCol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [nci_wi_CarrierGatewayConfiguration_5DBC27836DE96692C9E32692C755CF21]    Script Date: 13/05/2019 12:54:54 ******/
CREATE NONCLUSTERED INDEX [nci_wi_CarrierGatewayConfiguration_5DBC27836DE96692C9E32692C755CF21] ON [dbo].[CarrierGatewayConfiguration]
(
	[CarrierAccountReference] ASC,
	[Active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_CarrierPackages_CarrierConsignmentId]    Script Date: 13/05/2019 12:54:54 ******/
CREATE NONCLUSTERED INDEX [IX_CarrierPackages_CarrierConsignmentId] ON [dbo].[CarrierPackages]
(
	[CarrierConsignmentId] ASC
)
INCLUDE ( 	[Id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_CarrierPackages_PackageReferenceForLegAssignedByMpd]    Script Date: 13/05/2019 12:54:54 ******/
CREATE NONCLUSTERED INDEX [IX_CarrierPackages_PackageReferenceForLegAssignedByMpd] ON [dbo].[CarrierPackages]
(
	[PackageReferenceForLegAssignedByMpd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PackageTrackingReference]    Script Date: 13/05/2019 12:54:54 ******/
CREATE NONCLUSTERED INDEX [IX_PackageTrackingReference] ON [dbo].[CarrierPackages]
(
	[PackageTrackingReference] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_VerCol]    Script Date: 13/05/2019 12:54:54 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_VerCol] ON [dbo].[CarrierPackages]
(
	[VersionCol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_VerCol]    Script Date: 13/05/2019 12:54:54 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_VerCol] ON [dbo].[Consignments]
(
	[VersionCol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Consignments_ConsignmentReferenceForAllLegsAssignedByMpd]    Script Date: 13/05/2019 12:54:54 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UC_Consignments_ConsignmentReferenceForAllLegsAssignedByMpd] ON [dbo].[Consignments]
(
	[ConsignmentReferenceForAllLegsAssignedByMpd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ProcessTrackingEvents_EventSignature]    Script Date: 13/05/2019 12:54:54 ******/
CREATE NONCLUSTERED INDEX [IX_ProcessTrackingEvents_EventSignature] ON [dbo].[ProcessTrackingEvents]
(
	[EventSignature] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_VerCol]    Script Date: 13/05/2019 12:54:54 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_VerCol] ON [dbo].[TrackingEvents]
(
	[VersionCol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [nci_wi_TrackingEvents_46DC1564A791C45724F3859AC75B604B]    Script Date: 13/05/2019 12:54:54 ******/
CREATE NONCLUSTERED INDEX [nci_wi_TrackingEvents_46DC1564A791C45724F3859AC75B604B] ON [dbo].[TrackingEvents]
(
	[CarrierPackageId] ASC
)
INCLUDE ( 	[CarrierEventCode],
	[CarrierEventDescription],
	[Date],
	[Description],
	[Location],
	[MpdRecognisedEventGroup],
	[Signatory]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [TrackingEvents_CarrierId_IDX]    Script Date: 13/05/2019 12:54:54 ******/
CREATE NONCLUSTERED INDEX [TrackingEvents_CarrierId_IDX] ON [dbo].[TrackingEvents]
(
	[CarrierPackageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
ALTER TABLE [DataSync].[scope_info_dss] ADD  DEFAULT (newid()) FOR [scope_id]
GO
ALTER TABLE [DataSync].[scope_info_dss] ADD  DEFAULT ((0)) FOR [scope_restore_count]
GO
ALTER TABLE [dbo].[CarrierConsignments] ADD  CONSTRAINT [DF__CarrierCo__Carri__151B244E]  DEFAULT ('') FOR [CarrierServiceName]
GO
ALTER TABLE [dbo].[CarrierConsignments] ADD  CONSTRAINT [DF_CarrierConsignments_NextTrackableTime]  DEFAULT (getutcdate()) FOR [NextTrackableTime]
GO
ALTER TABLE [dbo].[CarrierGatewayConfiguration] ADD  CONSTRAINT [DF_CarrierGatewayConfiguration_Active]  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[TrackingConfiguration] ADD  CONSTRAINT [DF_TrackingConfiguration_IsTrackable]  DEFAULT ((1)) FOR [IsTrackable]
GO
ALTER TABLE [dbo].[TrackingConfiguration] ADD  CONSTRAINT [DF_TrackingConfiguration_IsLatenessCalculationEnabled]  DEFAULT ((1)) FOR [IsLatenessCalculationEnabled]
GO
ALTER TABLE [dbo].[CarrierConsignments]  WITH CHECK ADD  CONSTRAINT [FK_CarrierConsignments_CarrierGatewayConfigurationId_CarrierGatewayConfiguration_Id] FOREIGN KEY([CarrierGatewayConfigurationId])
REFERENCES [dbo].[CarrierGatewayConfiguration] ([Id])
GO
ALTER TABLE [dbo].[CarrierConsignments] CHECK CONSTRAINT [FK_CarrierConsignments_CarrierGatewayConfigurationId_CarrierGatewayConfiguration_Id]
GO
ALTER TABLE [dbo].[CarrierConsignments]  WITH CHECK ADD  CONSTRAINT [FK_CarrierConsignments_Consignments] FOREIGN KEY([ConsignmentId])
REFERENCES [dbo].[Consignments] ([Id])
GO
ALTER TABLE [dbo].[CarrierConsignments] CHECK CONSTRAINT [FK_CarrierConsignments_Consignments]
GO
ALTER TABLE [dbo].[CarrierPackages]  WITH CHECK ADD  CONSTRAINT [FK_CarrierPackages_CarrierConsignments] FOREIGN KEY([CarrierConsignmentId])
REFERENCES [dbo].[CarrierConsignments] ([Id])
GO
ALTER TABLE [dbo].[CarrierPackages] CHECK CONSTRAINT [FK_CarrierPackages_CarrierConsignments]
GO
ALTER TABLE [dbo].[TrackingEvents]  WITH CHECK ADD  CONSTRAINT [FK_TrackingEvents_CarrierPackages] FOREIGN KEY([CarrierPackageId])
REFERENCES [dbo].[CarrierPackages] ([Id])
GO
ALTER TABLE [dbo].[TrackingEvents] CHECK CONSTRAINT [FK_TrackingEvents_CarrierPackages]
GO
/****** Object:  StoredProcedure [dbo].[_GetIndexDefinitions]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[_GetIndexDefinitions]

As
BEGIN

		DECLARE @ProcedureName VARCHAR(50) ='spGetIndexDefinitions'
		DECLARE @Table VARCHAR(50) ='[IndexDefinition]'
		DECLARE @ProcessID Numeric(5,2) =1.1
		
		--INSERT INTO mech.PROCESSLOG(sessionID,ProcedureName,processID,TableName,StartDate)
		--SELECT @SessionID,@ProcedureName,@ProcessID,@Table,GETDATE()


		declare @SchemaName varchar(100)
		declare @TableName varchar(256)
		declare @IndexName varchar(256)
		declare @ColumnName varchar(100)
		declare @is_unique varchar(100)
		declare @IndexTypeDesc varchar(100)
		declare @FileGroupName varchar(100)
		declare @is_disabled varchar(100)
		declare @IndexOptions varchar(max)
		declare @IndexColumnId int
		declare @IsDescendingKey int 
		declare @IsIncludedColumn int
		declare @TSQLScripCreationIndex varchar(max)
		declare @TSQLScripDisableIndex varchar(max)

		DECLARE  CursorIndex CURSOR FOR
		SELECT 
			schema_name(t.schema_id) [schema_name], 
			t.name, 
			ix.name,
			CASE WHEN ix.is_unique = 1 THEN 'UNIQUE ' ELSE '' END , 
			ix.type_desc,
			CASE WHEN ix.is_padded=1 THEN 'PAD_INDEX = ON, ' ELSE 'PAD_INDEX = OFF, ' END
			+ case when ix.allow_page_locks=1 then 'ALLOW_PAGE_LOCKS = ON, ' else 'ALLOW_PAGE_LOCKS = OFF, ' end
			+ case when ix.allow_row_locks=1 then  'ALLOW_ROW_LOCKS = ON, ' else 'ALLOW_ROW_LOCKS = OFF, ' end
			+ case when INDEXPROPERTY(t.object_id, ix.name, 'IsStatistics') = 1 then 'STATISTICS_NORECOMPUTE = ON, ' else 'STATISTICS_NORECOMPUTE = OFF, ' end
			+ case when ix.ignore_dup_key=1 then 'IGNORE_DUP_KEY = ON, ' else 'IGNORE_DUP_KEY = OFF, ' end
			+ 'SORT_IN_TEMPDB = OFF, FILLFACTOR =' + CAST(CASE WHEN ISNULL(ix.fill_factor,0) =0 THEN 1 ELSE ix.fill_factor END  AS VARCHAR(3)) AS IndexOptions
			, ix.is_disabled , FILEGROUP_NAME(ix.data_space_id) FileGroupName
		FROM sys.tables t 
			INNER JOIN sys.indexes ix on t.object_id=ix.object_id
		WHERE ix.type> 0 
			and ix.is_primary_key=0 
			--and ix.is_unique_constraint=0 --and schema_name(tb.schema_id)= @SchemaName and tb.name=@TableName
			and t.is_ms_shipped=0 
			and t.name<>'sysdiagrams'
		ORDER BY 
			schema_name(t.schema_id), 
			t.name, 
			ix.name

		OPEN CursorIndex
		FETCH NEXT FROM CursorIndex INTO  @SchemaName, @TableName, @IndexName, @is_unique, @IndexTypeDesc, @IndexOptions,@is_disabled, @FileGroupName

		WHILE (@@fetch_status=0)
		BEGIN
 
			DECLARE @IndexColumns varchar(max)
			DECLARE @IncludedColumns varchar(max)
 
			SET @IndexColumns=''
			SET @IncludedColumns=''
 
			DECLARE CursorIndexColumn CURSOR FOR 
			SELECT
				col.name, 
				ixc.is_descending_key, 
				ixc.is_included_column
			FROM sys.tables tb 
				INNER JOIN sys.indexes ix 
					ON tb.object_id=ix.object_id
				INNER JOIN sys.index_columns ixc 
					ON ix.object_id=ixc.object_id
					AND ix.index_id= ixc.index_id
				INNER JOIN sys.columns col 
					ON ixc.object_id =col.object_id  
					AND ixc.column_id=col.column_id
			WHERE ix.type>0 
				and (ix.is_primary_key=0 or ix.is_unique_constraint=0)
				and schema_name(tb.schema_id)=@SchemaName 
				and tb.name=@TableName 
				and ix.name=@IndexName
			ORDER BY ixc.index_column_id
 
			OPEN CursorIndexColumn 
	
			FETCH NEXT FROM CursorIndexColumn INTO  @ColumnName, @IsDescendingKey, @IsIncludedColumn
 
			WHILE (@@fetch_status=0)
			BEGIN
				IF @IsIncludedColumn=0 
	
					SET @IndexColumns=@IndexColumns + QUOTENAME(@ColumnName)  + case when @IsDescendingKey=1  then ' DESC, ' else  ' ASC, ' end
				ELSE 
					SET @IncludedColumns=@IncludedColumns  + @ColumnName  +', ' 

				FETCH NEXT FROM CursorIndexColumn INTO @ColumnName, @IsDescendingKey, @IsIncludedColumn
			END

			CLOSE CursorIndexColumn
			DEALLOCATE CursorIndexColumn

			SET @IndexColumns = substring(@IndexColumns, 1, len(@IndexColumns)-1)
			SET @IncludedColumns = case when len(@IncludedColumns) >0 then substring(@IncludedColumns, 1, len(@IncludedColumns)-1) else '' end
 
			SET @TSQLScripCreationIndex =''
			SET @TSQLScripDisableIndex =''
 
			SET @TSQLScripCreationIndex='CREATE '+ @is_unique  +@IndexTypeDesc + ' INDEX ' +QUOTENAME(@IndexName)+' ON ' 
												 + QUOTENAME(@SchemaName) +'.'+ QUOTENAME(@TableName)+ '('+@IndexColumns+') '
												 + case when len(@IncludedColumns)>0 then CHAR(13) +'INCLUDE (' + @IncludedColumns+ ')' else '' end 
												 + CHAR(13)+'WITH (' + @IndexOptions+ ') ON ' + QUOTENAME(@FileGroupName) + ';'  

			IF  @is_disabled=1 
				SET  @TSQLScripDisableIndex=  CHAR(13) +'ALTER INDEX ' +QUOTENAME(@IndexName) + ' ON ' + QUOTENAME(@SchemaName) +'.'+ QUOTENAME(@TableName) + ' DISABLE;' + CHAR(13) 

			INSERT INTO dbo._IndexDefinition(TableName,IndexName,CreateStatement)
			SELECT @TableName,@IndexName, @TSQLScripCreationIndex
		
			FETCH NEXT FROM CursorIndex INTO  @SchemaName, @TableName, @IndexName, @is_unique, @IndexTypeDesc, @IndexOptions,@is_disabled, @FileGroupName

		END
		CLOSE CursorIndex
		DEALLOCATE CursorIndex


END




GO
/****** Object:  StoredProcedure [dbo].[_GetKeyDefinitions]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[_GetKeyDefinitions]
	@FKStatement VARCHAR(MAX) OUT

AS
BEGIN

	DECLARE @schema_name sysname;
	DECLARE @table_name sysname;
	DECLARE @constraint_name sysname;
	DECLARE @constraint_object_id int;
	DECLARE @referenced_object_name sysname;
	DECLARE @is_disabled bit;
	DECLARE @is_not_for_replication bit;
	DECLARE @is_not_trusted bit;
	DECLARE @delete_referential_action tinyint;
	DECLARE @update_referential_action tinyint;
	DECLARE @tsql nvarchar(4000) ='';
	DECLARE @tsql2 nvarchar(4000);
	DECLARE @fkCol sysname;
	DECLARE @pkCol sysname;
	DECLARE @col1 bit;
	DECLARE @action char(6);


		DECLARE @ProcedureName VARCHAR(50) ='spGetKeyDefinitions'
		DECLARE @Table VARCHAR(50) ='[KeyDefinition]'
		DECLARE @ProcessID Numeric(5,2) =1.0
		
		SET @FKStatement =''




	SET @action = 'CREATE'; 

		DECLARE FKcursor CURSOR FOR
		SELECT OBJECT_SCHEMA_NAME(parent_object_id)
			 , OBJECT_NAME(parent_object_id), name, OBJECT_NAME(referenced_object_id)
			 , object_id
			 , is_disabled, is_not_for_replication, is_not_trusted
			 , delete_referential_action, update_referential_action
		FROM sys.foreign_keys
		ORDER BY 1,2; 
		



		OPEN FKcursor; 

		FETCH NEXT FROM FKcursor INTO @schema_name, @table_name, @constraint_name
			, @referenced_object_name, @constraint_object_id
			,@is_disabled, @is_not_for_replication, @is_not_trusted
			,@delete_referential_action, @update_referential_action;

		WHILE @@FETCH_STATUS = 0
		BEGIN

			IF @action <> 'CREATE'
				SET @tsql = 'ALTER TABLE '+ QUOTENAME(@schema_name) + '.' + QUOTENAME(@table_name) + ' DROP CONSTRAINT ' + QUOTENAME(@constraint_name) + ';';
			ELSE
			BEGIN
				SET @tsql = 'ALTER TABLE '+ QUOTENAME(@schema_name) + '.' + QUOTENAME(@table_name)+ CASE @is_not_trusted WHEN 0 THEN ' WITH CHECK ' ELSE ' WITH NOCHECK '
			END

			SET @tsql += ' ADD CONSTRAINT ' + QUOTENAME(@constraint_name) + ' FOREIGN KEY ('

			SET @tsql2 = '';

				DECLARE ColumnCursor CURSOR FOR
				SELECT 
					COL_NAME(fk.parent_object_id, fkc.parent_column_id)
				  , COL_NAME(fk.referenced_object_id, fkc.referenced_column_id)
				FROM sys.foreign_keys fk
					INNER JOIN sys.foreign_key_columns fkc
						ON fk.object_id = fkc.constraint_object_id
				WHERE  fkc.constraint_object_id = @constraint_object_id
				ORDER BY fkc.constraint_column_id; 

			OPEN ColumnCursor; 

			SET @col1 = 1;
			FETCH NEXT FROM ColumnCursor INTO @fkCol, @pkCol;
			WHILE @@FETCH_STATUS = 0
			BEGIN
			
				IF (@col1 = 1)
					SET @col1 = 0
				ELSE
				BEGIN
					SET @tsql = @tsql + ',';
					SET @tsql2 = @tsql2 + ',';
				END;
				SET @tsql = @tsql + QUOTENAME(@fkCol);
				SET @tsql2 = @tsql2 + QUOTENAME(@pkCol);

				FETCH NEXT FROM ColumnCursor INTO @fkCol, @pkCol;

			END; 

			CLOSE ColumnCursor;
			DEALLOCATE ColumnCursor; 


			SET @tsql = @tsql + ' ) REFERENCES ' + QUOTENAME(@schema_name) + '.' + QUOTENAME(@referenced_object_name) + ' (' + @tsql2 + ')';            

			SET @tsql = @tsql + ' ON UPDATE ' + CASE @update_referential_action WHEN 0 THEN 'NO ACTION ' WHEN 1 THEN 'CASCADE '  WHEN 2 THEN 'SET NULL ' ELSE 'SET DEFAULT ' END
							  + ' ON DELETE ' + CASE @delete_referential_action WHEN 0 THEN 'NO ACTION ' WHEN 1 THEN 'CASCADE '  WHEN 2 THEN 'SET NULL ' ELSE 'SET DEFAULT ' END
											  + CASE @is_not_for_replication WHEN 1 THEN ' NOT FOR REPLICATION ' ELSE '' END + ';'; END;
			
			--INSERT INTO dbo._FKDefinition(TableName,FKName,CreateStatement,DropStatement)
			--SELECT @table_name,@constraint_name, @tsql , 'ALTER TABLE ' + @table_name + ' DROP CONSTRAINT ' + QUOTENAME(@constraint_name); 

			SELECT @FKStatement+= @tsql +CHAR(13)

		FETCH NEXT FROM FKcursor INTO @schema_name, @table_name, @constraint_name
			, @referenced_object_name, @constraint_object_id
			, @is_disabled, @is_not_for_replication, @is_not_trusted
			, @delete_referential_action, @update_referential_action; 

		END; 

	CLOSE FKcursor;
	DEALLOCATE FKcursor;

	

END








GO
/****** Object:  StoredProcedure [dbo].[_GetTableDefinition]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[_GetTableDefinition]
As

TRUNCATE TABLE [dbo].[_TableDefinition]
INSERT INTO [dbo].[_TableDefinition]
           ([TableName]
           ,[GenerateStatement])
select  so.name, 'drop table  [' +so.name +  ']' + CHAR(13) + ' create table [' + so.name + '] (' + o.list + ')' + CASE WHEN tc.Constraint_Name IS NULL THEN '' ELSE 'ALTER TABLE ' + so.Name + ' ADD CONSTRAINT ' + QUOTENAME(tc.Constraint_Name)  + ' PRIMARY KEY ' + ' (' + LEFT(j.List, Len(j.List)-1) + ')' END
from    sysobjects so
cross apply
    (SELECT 
        '  ['+column_name+'] ' + 
        data_type + case data_type
                when 'sql_variant' then ''
                when 'text' then ''
                when 'decimal' then '(' + cast(numeric_precision_radix as varchar) + ', ' + cast(numeric_scale as varchar) + ')'
                else coalesce('('+case when character_maximum_length = -1 then 'MAX' else cast(character_maximum_length as varchar) end +')','') end + ' ' +
        case when exists ( 
        select id from syscolumns
        where object_name(id)=so.name
        and name=column_name
        and columnproperty(id,name,'IsIdentity') = 1 
        ) then
        'IDENTITY(' + 
        cast(ident_seed(so.name) as varchar) + ',' + 
        cast(ident_incr(so.name) as varchar) + ')'
        else ''
        end + ' ' +
         (case when IS_NULLABLE = 'No' then 'NOT ' else '' end ) + 'NULL ' + 
          case when information_schema.columns.COLUMN_DEFAULT IS NOT NULL THEN 'DEFAULT '+ information_schema.columns.COLUMN_DEFAULT ELSE '' END + ', '  +CHAR(10)

     from information_schema.columns where table_name = so.name
     order by ordinal_position
    FOR XML PATH('')) o (list)
left join
    information_schema.table_constraints tc
on  tc.Table_name               = so.Name
AND tc.Constraint_Type  = 'PRIMARY KEY'
cross apply
    (select '[' + Column_Name + '], '
     FROM       information_schema.key_column_usage kcu
     WHERE      kcu.Constraint_Name     = tc.Constraint_Name
     ORDER BY
        ORDINAL_POSITION
     FOR XML PATH('')) j (list)
where   xtype = 'U'
AND name        NOT IN ('dtproperties')


GO
/****** Object:  StoredProcedure [dbo].[Add_ProcessTrackingEvent]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_ProcessTrackingEvent]
(
	@CustomerReference as uniqueidentifier,
	@ConsignmentReferenceForAllLegsAssignedByMpd as nvarchar(30),
	@ConsignmentReferenceProvidedByCustomer as nvarchar(255),
	@CarrierName as nvarchar(255),
	@CarrierServiceName as nvarchar(255),
	@CarrierServiceReference as nvarchar(20),
	@CarrierServiceCode as nvarchar(50),
	@ConsignmentTrackingReference as nvarchar(20),
	@CarrierEventCode as nvarchar(20),
	@CarrierEventDateTime as datetimeoffset(7),
	@CarrierEventName as nvarchar(500),
	@PackageStatus  nvarchar(255),
	@CarrierEventLocation as nvarchar(100),
	@CarrierEventDescription as nvarchar(500),
	@PackageTrackingReference as nvarchar(20),
	@SortedReceivedDate as datetimeoffset(7)
)
AS
BEGIN
SET NOCOUNT ON
INSERT INTO [dbo].[ProcessTrackingEvents]
           (
		    [CustomerReference]
           ,[ConsignmentReferenceForAllLegsAssignedByMpd]
           ,[ConsignmentReferenceProvidedByCustomer]
           ,[CarrierName]
           ,[CarrierServiceName]
           ,[CarrierServiceReference]
           ,[CarrierServiceCode]
           ,[ConsignmentTrackingReference]
           ,[CarrierEventCode]
           ,[CarrierEventDateTime]
           ,[CarrierEventName]
           ,[PackageStatus]
           ,[CarrierEventLocation]
           ,[CarrierEventDescription]
           ,[PackageTrackingReference]
           ,[SortedReceivedDate]
		   )
     VALUES
           (@CustomerReference
           ,@ConsignmentReferenceForAllLegsAssignedByMpd
           ,@ConsignmentReferenceProvidedByCustomer
           ,@CarrierName
           ,@CarrierServiceName
           ,@CarrierServiceReference
		   ,@CarrierServiceCode
           ,@ConsignmentTrackingReference
           ,@CarrierEventCode
           ,@CarrierEventDateTime
           ,@CarrierEventName
           ,@PackageStatus
           ,@CarrierEventLocation
           ,@CarrierEventDescription
           ,@PackageTrackingReference
           ,@SortedReceivedDate)
END

GO
/****** Object:  StoredProcedure [dbo].[AzureSQLMaintenance]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AzureSQLMaintenance]
	(
		@operation nvarchar(10) = null,
		@mode nvarchar(10) = 'smart',
		@LogToTable bit = 0
	)
as
begin
	set nocount on
	declare @msg nvarchar(max);
	declare @minPageCountForIndex int = 40;
	declare @OperationTime datetime2 = sysdatetime();
	declare @KeepXOperationInLog int =3;

	/* make sure parameters selected correctly */
	set @operation = lower(@operation)
	set @mode = lower(@mode)
	
	if @mode not in ('smart','dummy')
		set @mode = 'smart'

	if @operation not in ('index','statistics','all') or @operation is null
	begin
		raiserror('@operation (varchar(10)) [mandatory]',0,0)
		raiserror(' Select operation to perform:',0,0)
		raiserror('     "index" to perform index maintenance',0,0)
		raiserror('     "statistics" to perform statistics maintenance',0,0)
		raiserror('     "all" to perform indexes and statistics maintenance',0,0)
		raiserror(' ',0,0)
		raiserror('@mode(varchar(10)) [optional]',0,0)
		raiserror(' optionaly you can supply second parameter for operation mode: ',0,0)
		raiserror('     "smart" (Default) using smart decition about what index or stats should be touched.',0,0)
		raiserror('     "dummy" going through all indexes and statistics regardless thier modifications or fragmentation.',0,0)
		raiserror(' ',0,0)
		raiserror('@LogToTable(bit) [optional]',0,0)
		raiserror(' Logging option: @LogToTable(bit)',0,0)
		raiserror('     0 - (Default) do not log operation to table',0,0)
		raiserror('     1 - log operation to table',0,0)
		raiserror('		for logging option only 3 last execution will be kept by default. this can be changed by easily in the procedure body.',0,0)
		raiserror('		Log table will be created automatically if not exists.',0,0)
	end
	else 
	begin
		/*Write operation parameters*/
		raiserror('-----------------------',0,0)
		set @msg = 'set operation = ' + @operation;
		raiserror(@msg,0,0)
		set @msg = 'set mode = ' + @mode;
		raiserror(@msg,0,0)
		set @msg = 'set LogToTable = ' + cast(@LogToTable as varchar(1));
		raiserror(@msg,0,0)
		raiserror('-----------------------',0,0)
	end
	
	/* Prepare Log Table */
		if object_id('AzureSQLMaintenanceLog') is null 
		begin
			create table AzureSQLMaintenanceLog (id bigint primary key identity(1,1), OperationTime datetime2, command varchar(4000),ExtraInfo varchar(4000), StartTime datetime2, EndTime datetime2, StatusMessage varchar(1000));
		end

	if @LogToTable=1 insert into AzureSQLMaintenanceLog values(@OperationTime,null,null,sysdatetime(),sysdatetime(),'Starting operation: Operation=' +@operation + ' Mode=' + @mode + ' Keep log for last ' + cast(@KeepXOperationInLog as varchar(10)) + ' operations' )	

	create table #cmdQueue (txtCMD nvarchar(max),ExtraInfo varchar(max))


	if @operation in('index','all')
	begin
		raiserror('Get index information...(wait)',0,0) with nowait;
		/* Get Index Information */
		select 
			i.[object_id]
			,ObjectSchema = OBJECT_SCHEMA_NAME(i.object_id)
			,ObjectName = object_name(i.object_id) 
			,IndexName = idxs.name
			,i.avg_fragmentation_in_percent
			,i.page_count
			,i.index_id
			,i.partition_number
			,i.index_type_desc
			,i.avg_page_space_used_in_percent
			,i.record_count
			,i.ghost_record_count
			,i.forwarded_record_count
			,null as OnlineOpIsNotSupported
		into #idxBefore
		from sys.dm_db_index_physical_stats(DB_ID(),NULL, NULL, NULL ,'limited') i
		left join sys.indexes idxs on i.object_id = idxs.object_id and i.index_id = idxs.index_id
		where idxs.type in (1/*Clustered index*/,2/*NonClustered index*/) /*Avoid HEAPS*/
		order by i.avg_fragmentation_in_percent desc, page_count desc


		-- mark indexes XML,spatial and columnstore not to run online update 
		update #idxBefore set OnlineOpIsNotSupported=1 where [object_id] in (select [object_id] from #idxBefore where index_id >=1000)
		
		
		raiserror('---------------------------------------',0,0) with nowait
		raiserror('Index Information:',0,0) with nowait
		raiserror('---------------------------------------',0,0) with nowait

		select @msg = count(*) from #idxBefore 
		set @msg = 'Total Indexes: ' + @msg
		raiserror(@msg,0,0) with nowait

		select @msg = avg(avg_fragmentation_in_percent) from #idxBefore where page_count>@minPageCountForIndex
		set @msg = 'Average Fragmentation: ' + @msg
		raiserror(@msg,0,0) with nowait

		select @msg = sum(iif(avg_fragmentation_in_percent>=5 and page_count>@minPageCountForIndex,1,0)) from #idxBefore 
		set @msg = 'Fragmented Indexes: ' + @msg
		raiserror(@msg,0,0) with nowait

				
		raiserror('---------------------------------------',0,0) with nowait

			
			
			
		/* create queue for update indexes */
		insert into #cmdQueue
		select 
		txtCMD = 
		case when avg_fragmentation_in_percent>5 and avg_fragmentation_in_percent<30 and @mode = 'smart' then
			'ALTER INDEX [' + IndexName + '] ON [' + ObjectSchema + '].[' + ObjectName + '] REORGANIZE;'
			when OnlineOpIsNotSupported=1 then
			'ALTER INDEX [' + IndexName + '] ON [' + ObjectSchema + '].[' + ObjectName + '] REBUILD WITH(ONLINE=OFF,MAXDOP=1);'
			else
			'ALTER INDEX [' + IndexName + '] ON [' + ObjectSchema + '].[' + ObjectName + '] REBUILD WITH(ONLINE=ON,MAXDOP=1);'
		end
		, ExtraInfo = 'Current fragmentation: ' + format(avg_fragmentation_in_percent/100,'p')
		from #idxBefore
		where 
			index_id>0 /*disable heaps*/ 
			and index_id < 1000 /* disable XML indexes */
			--
			and 
				(
					page_count> @minPageCountForIndex and /* not small tables */
					avg_fragmentation_in_percent>=5
				)
			or
				(
					@mode ='dummy'
				)
	end

	if @operation in('statistics','all')
	begin 
		/*Gets Stats for database*/
		raiserror('Get statistics information...',0,0) with nowait;
		select 
			ObjectSchema = OBJECT_SCHEMA_NAME(s.object_id)
			,ObjectName = object_name(s.object_id) 
			,StatsName = s.name
			,sp.last_updated
			,sp.rows
			,sp.rows_sampled
			,sp.modification_counter
		into #statsBefore
		from sys.stats s cross apply sys.dm_db_stats_properties(s.object_id,s.stats_id) sp 
		where OBJECT_SCHEMA_NAME(s.object_id) != 'sys' and (sp.modification_counter>0 or @mode='dummy')
		order by sp.last_updated asc

		
		raiserror('---------------------------------------',0,0) with nowait
		raiserror('Statistics Information:',0,0) with nowait
		raiserror('---------------------------------------',0,0) with nowait

		select @msg = sum(modification_counter) from #statsBefore
		set @msg = 'Total Modifications: ' + @msg
		raiserror(@msg,0,0) with nowait
		
		select @msg = sum(iif(modification_counter>0,1,0)) from #statsBefore
		set @msg = 'Modified Statistics: ' + @msg
		raiserror(@msg,0,0) with nowait
				
		raiserror('---------------------------------------',0,0) with nowait




		/* create queue for update stats */
		insert into #cmdQueue
		select 
		txtCMD = 'UPDATE STATISTICS [' + ObjectSchema + '].[' + ObjectName + '] (['+ StatsName +']) WITH FULLSCAN;'
		, ExtraInfo = '#rows:' + cast([rows] as varchar(100)) + ' #modifications:' + cast(modification_counter as varchar(100)) + ' modification percent: ' + format((1.0 * modification_counter/ rows ),'p')
		from #statsBefore
	end


if @operation in('statistics','index','all')
	begin 
		/* iterate through all stats */
		raiserror('Start executing commands...',0,0) with nowait
		declare @SQLCMD nvarchar(max);
		declare @ExtraInfo nvarchar(max);
		declare @T table(txtCMD nvarchar(max),ExtraInfo nvarchar(max));
		while exists(select * from #cmdQueue)
		begin
			delete top (1) from #cmdQueue output deleted.* into @T;
			select top (1) @SQLCMD = txtCMD, @ExtraInfo=ExtraInfo from @T
			raiserror(@SQLCMD,0,0) with nowait
			if @LogToTable=1 insert into AzureSQLMaintenanceLog values(@OperationTime,@SQLCMD,@ExtraInfo,sysdatetime(),null,'Started')
			begin try
				exec(@SQLCMD)	
				if @LogToTable=1 update AzureSQLMaintenanceLog set EndTime = sysdatetime(), StatusMessage = 'Succeeded' where id=SCOPE_IDENTITY()
			end try
			begin catch
				raiserror('cached',0,0) with nowait
				if @LogToTable=1 update AzureSQLMaintenanceLog set EndTime = sysdatetime(), StatusMessage = 'FAILED : ' + CAST(ERROR_NUMBER() AS VARCHAR(50)) + ERROR_MESSAGE() where id=SCOPE_IDENTITY()
			end catch
			delete from @T
		end
	end
	
	/* Clean old records from log table */
	if @LogToTable=1
	begin
		delete from AzureSQLMaintenanceLog 
		from 
			AzureSQLMaintenanceLog L join 
			(select distinct OperationTime from AzureSQLMaintenanceLog order by OperationTime desc offset @KeepXOperationInLog rows) F
				ON L.OperationTime = F.OperationTime
		insert into AzureSQLMaintenanceLog values(@OperationTime,null,cast(@@rowcount as varchar(100))+ ' rows purged from log table because number of operations to keep is set to: ' + cast( @KeepXOperationInLog as varchar(100)),sysdatetime(),sysdatetime(),'Cleanup Log Table')
	end

	raiserror('Done',0,0)
	if @LogToTable=1 insert into AzureSQLMaintenanceLog values(@OperationTime,null,null,sysdatetime(),sysdatetime(),'End of operation')
end
GO
/****** Object:  StoredProcedure [dbo].[BatchDeleteTracking]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BatchDeleteTracking]
(
	@BatchSizeToDelete INT,
	@CustomerReference VARCHAR(255),
	@RegisteredDateCutoff DATETIME = NULL
)
AS
BEGIN
	SET NOCOUNT ON;
	-- clear the queue table
	DELETE FROM dbo.DBCleanupQueue
	-- populate the queue table with consignments
	INSERT dbo.DBCleanupQueue (ConsignmentReferenceForAllLegsAssignedByMpd) 
	SELECT	TOP (SELECT @BatchSizeToDelete) c.ConsignmentReferenceForAllLegsAssignedByMpd
	FROM	dbo.Consignments c (nolock)
		INNER JOIN dbo.CarrierConsignments cc (nolock)
			ON cc.ConsignmentId = c.Id
	WHERE	CustomerReference = @CustomerReference
	AND		cc.RegisteredDateTime < CASE WHEN @RegisteredDateCutoff IS NULL THEN GETDATE() ELSE @RegisteredDateCutoff END
	ORDER BY c.Id ASC
	DECLARE @ConsignmentRef VARCHAR(255);
	DECLARE @return_value INT;
	DECLARE @Message VARCHAR(MAX);
	DECLARE @SuccessFlag BIT;
	WHILE (@BatchSizeToDelete > 0)
	BEGIN
		SET @ConsignmentRef = (SELECT TOP 1 ConsignmentReferenceForAllLegsAssignedByMpd FROM dbo.DBCleanupQueue);
		BEGIN TRY
			EXEC @return_value = [dbo].[Delete_Tracking] @ConsignmentReference = @ConsignmentRef
			IF (@return_value = 0)
			BEGIN
				SET @Message = 'Successfully deleted tracking for consignment ref ' + @ConsignmentRef
				SET @SuccessFlag = 1
			END
			ELSE IF (@return_value = 1)
			BEGIN
				SET @Message = 'Cannot find tracking details for consignment reference ' + @ConsignmentRef
				SET @SuccessFlag = 0
			END
			-- DELETE from temp table
			DELETE FROM dbo.DBCleanupQueue WHERE ConsignmentReferenceForAllLegsAssignedByMpd = @ConsignmentRef
		END TRY
		BEGIN CATCH
			SET @Message = 'Error Deleting tracking details for consignment ref ' + @ConsignmentRef + '. ' + ERROR_MESSAGE()
			SET @SuccessFlag = 0
		END CATCH 
		INSERT [dbo].[DBCleanupLog] ([DB_name], [ConsignmentReference], [Timestamp], [Success], [Message])
		VALUES ('Consignments',@ConsignmentRef, GETDATE(), @SuccessFlag, @Message)
		PRINT @Message
		SET @BatchSizeToDelete = @BatchSizeToDelete - 1;
	END
END

GO
/****** Object:  StoredProcedure [dbo].[Delete_Tracking]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Delete_Tracking]
(
	@ConsignmentReference nvarchar(MAX),
	@Output int = 0 OUTPUT
)
AS
BEGIN
		DECLARE @ConsignmentId INT
		DECLARE @CarrierConsignmentIds TABLE ( CarrierConsignmentId BIGINT )
		DECLARE @CarrierPackageIds TABLE ( CarrierPackageId BIGINT )
		SET NOCOUNT ON;
		SELECT @ConsignmentId = Id FROM [dbo].[Consignments] (nolock) WHERE [ConsignmentReferenceForAllLegsAssignedByMpd] = @ConsignmentReference
		BEGIN TRY
			BEGIN TRANSACTION
					
					IF (@ConsignmentId IS NOT NULL)
					BEGIN
						-- *** Populate carrier consignment Ids and carrier package Ids ***
						INSERT INTO @CarrierConsignmentIds ( CarrierConsignmentId )
						SELECT Id [CarrierConsignmentId] FROM [dbo].CarrierConsignments (nolock) WHERE ConsignmentId = @ConsignmentId
						INSERT INTO @CarrierPackageIds ( CarrierPackageId )
						SELECT Id [CarrierPackageId] FROM [dbo].CarrierPackages (nolock) WHERE CarrierConsignmentId IN ( SELECT CarrierConsignmentId FROM @CarrierConsignmentIds )
						-- *** Delete tracking events ***
						DELETE dbo.TrackingEvents WHERE CarrierPackageId IN ( SELECT CarrierPackageId FROM @CarrierPackageIds )
						-- *** Delete carrier packages ***
						DELETE dbo.CarrierPackages WHERE CarrierConsignmentId IN ( SELECT CarrierConsignmentId FROM @CarrierConsignmentIds )
						-- *** Delete carrier consignments ***
						DELETE dbo.CarrierConsignments WHERE ConsignmentId = @ConsignmentId
						-- *** CLEAN the root Consignments table ***
						-- **************************
						DELETE FROM [dbo].[Consignments] WHERE [ConsignmentReferenceForAllLegsAssignedByMpd] = @ConsignmentReference
						SET @Output = 0;
					END
					ELSE
					BEGIN
						SET @Output = 1;						
					END
			COMMIT TRANSACTION
			RETURN @Output
		END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		PRINT 'Error!! ' + Error_Message()
		DECLARE @ErrorMessage NVARCHAR(4000);
		DECLARE @ErrorSeverity INT;
		DECLARE @ErrorState INT;
		SELECT @ErrorMessage = ERROR_MESSAGE(),
		@ErrorSeverity = ERROR_SEVERITY(),
		@ErrorState = ERROR_STATE();
		RAISERROR (@ErrorMessage, -- Message text.
			@ErrorSeverity, -- Severity.
			@ErrorState -- State.
			);
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteConsignment]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteConsignment]
(
	@ConsignmentReference NVARCHAR(MAX)
)
AS
	DELETE FROM TrackingEvents WHERE CarrierPackageId IN
	(
		SELECT CP.Id FROM CarrierPackages CP
		INNER JOIN CarrierConsignments CC ON CC.Id = CP.CarrierConsignmentId
		WHERE CC.ConsignmentReferenceForAllLegsAssignedByMpd = @ConsignmentReference
	)
	DELETE FROM CarrierPackages WHERE CarrierConsignmentId IN
	(
		SELECT Id FROM CarrierConsignments WHERE ConsignmentReferenceForAllLegsAssignedByMpd = @ConsignmentReference
	)
	DELETE FROM CarrierConsignments WHERE ConsignmentReferenceForAllLegsAssignedByMpd = @ConsignmentReference
	DELETE FROM Consignments WHERE ConsignmentReferenceForAllLegsAssignedByMpd = @ConsignmentReference
	RETURN

GO
/****** Object:  StoredProcedure [dbo].[Get_TrackingEventsToProcess]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_TrackingEventsToProcess]
(
	@CustomerReference UNIQUEIDENTIFIER
)
AS
BEGIN
SET NOCOUNT ON
DECLARE @ProcessStart DATETIME = GETDATE()
UPDATE [dbo].[ProcessTrackingEvents]
SET [ProcessStart] = @ProcessStart
WHERE [CustomerReference] = @CustomerReference
	AND [ProcessStart] IS NULL
	AND [ProcessEnd] IS NULL
SELECT [ConsignmentReferenceForAllLegsAssignedByMpd] AS Id
	  ,[ConsignmentReferenceForAllLegsAssignedByMpd]
	  ,[CustomerReference]
      ,[ConsignmentReferenceProvidedByCustomer]
      ,NULL as ConsignmentState
      ,[CarrierName]
      ,[CarrierServiceName]
      ,[CarrierServiceReference]
      ,[CarrierServiceCode]
      ,[ConsignmentTrackingReference]
	  ,[ConsignmentReferenceForAllLegsAssignedByMpd] AS PackageDetails_ConsignmentId
      ,[CarrierEventCode] as PackageDetails_CarrierEventCode
      ,[CarrierEventDateTime] as PackageDetails_CarrierEventDateTime
      ,[CarrierEventName] as PackageDetails_CarrierEventName
      ,[PackageStatus] as PackageDetails_PackageStatus
      ,[CarrierEventLocation] as PackageDetails_CarrierEventLocation
      ,[CarrierEventDescription] as PackageDetails_CarrierEventDescription
      ,[PackageTrackingReference] as PackageDetails_PackageTrackingReference
      ,[SortedReceivedDate] as PackageDetails_SortedReceivedDate
	  ,[SortedPackageRef] as PackageDetails_SortedPackageRef
      ,[ProcessStart] as PackageDetails_ProcessStart
  FROM [dbo].[ProcessTrackingEvents] (nolock)
WHERE [CustomerReference] = @CustomerReference
	AND [ProcessStart] = @ProcessStart
	AND [ProcessEnd] IS NULL
ORDER BY [ConsignmentReferenceForAllLegsAssignedByMpd], PackageDetails_CarrierEventDateTime
END

GO
/****** Object:  StoredProcedure [dbo].[Get_WebhooksConfiguration]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_WebhooksConfiguration]
(
	@CustomerReference UNIQUEIDENTIFIER
)
AS
BEGIN
SET NOCOUNT ON
SELECT TOP (1) 
       [IsWebhookEnabled]
      ,[UploadLocationType]
      ,[HostUrl]
      ,[UploadFolder]
      ,[UserName]
      ,[Password]
      ,[AccessKey]
      ,[PortNumber]
      ,[ForceActive]
      ,[PrivateKeyPath]
      ,[CustomerReference]
  FROM [dbo].[WebhooksConfiguration]
  WHERE [CustomerReference] = @CustomerReference
END

GO
/****** Object:  StoredProcedure [dbo].[GetConsignment]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetConsignment]
(
	@ConsignmentReference NVARCHAR(MAX)
)
AS
	SELECT C.[Id], C.[ConsignmentReferenceForAllLegsAssignedByMpd] AS ConsignmentReferenceForAllLegsAssignedByMpd,C.[CustomerReference],
		  CC.[Id] AS CarrierConsignments_Id,
		  [CarrierReference] AS CarrierConsignments_CarrierReference,
		  [CarrierServiceReference] AS CarrierConsignments_CarrierServiceReference, 
		  [ConsignmentReferenceForLegAssignedByCarrier] AS CarrierConsignments_ConsignmentReferenceForLegAssignedByCarrier,
		  [ConsignmentReferenceForLegAssignedByMpd] AS CarrierConsignments_ConsignmentReferenceForLegAssignedByMpd, 
		  [ConsignmentTrackingReference] AS CarrierConsignments_ConsignmentTrackingReference,
		  [IsToBeTracked] AS CarrierConsignments_IsToBeTracked, 
		  [LegNumber] AS CarrierConsignments_LegNumber, 
		  [ConsignmentId] AS CarrierConsignments_ConsignmentId,
		  [RegisteredDateTime] AS CarrierConsignments_RegisteredDateTime,
		  CC.[ConsignmentReferenceForAllLegsAssignedByMpd] AS CarrierConsignments_ConsignmentReferenceForAllLegsAssignedByMpd, 
		  [CarrierServiceName] AS CarrierConsignments_CarrierServiceName, 
		  [CarrierGatewayConfigurationId] AS CarrierConsignments_CarrierGatewayConfigurationId, 
		  [DestinationCountry] AS CarrierConsignments_DestinationCountry,
		  P.[Id] AS CarrierConsignments_CarrierPackages_Id,
		  [PackageReferenceForLegAssignedByCarrier] AS CarrierConsignments_CarrierPackages_PackageReferenceForLegAssignedByCarrier, 
		  [PackageReferenceForLegAssignedByMpd] AS CarrierConsignments_CarrierPackages_PackageReferenceForLegAssignedByMpd,
		  [PackageTrackingReference] AS CarrierConsignments_CarrierPackages_PackageTrackingReference, 
		  [CarrierConsignmentId] AS CarrierConsignments_CarrierPackages_CarrierConsignmentId,
		  [PackageReferenceForAllLegsAssignedByMpd] AS CarrierConsignments_CarrierPackages_PackageReferenceForAllLegsAssignedByMpd,
		  T.[Id] AS CarrierConsignments_CarrierPackages_TrackingEvents_Id,
		  [CarrierEventCode] AS CarrierConsignments_CarrierPackages_TrackingEvents_CarrierEventCode,
		  [CarrierEventDescription] AS CarrierConsignments_CarrierPackages_TrackingEvents_CarrierEventDescription,
		  [Description] AS CarrierConsignments_CarrierPackages_TrackingEvents_Description,
		  [Date] AS CarrierConsignments_CarrierPackages_TrackingEvents_Date,
		  [Location] AS CarrierConsignments_CarrierPackages_TrackingEvents_Location,
		  [Signatory] AS CarrierConsignments_CarrierPackages_TrackingEvents_Signatory,
		  [CarrierPackageId] AS CarrierConsignments_CarrierPackages_TrackingEvents_CarrierPackageId,
		  [MpdRecognisedEventGroup] AS CarrierConsignments_CarrierPackages_TrackingEvents_MpdRecognisedEventGroup,
		  CC.[AdditionalTrackingInformation] AS CarrierConsignments_AdditionalTrackingInformation
	FROM [dbo].[Consignments]  (NOLOCK) C
	INNER JOIN [dbo].[CarrierConsignments] (NOLOCK) CC ON C.Id = CC.ConsignmentId
	INNER JOIN [dbo].[CarrierPackages] (NOLOCK) P ON P.CarrierConsignmentId = CC.Id
	LEFT OUTER JOIN [dbo].[TrackingEvents] (NOLOCK) T ON P.Id = T.CarrierPackageId
	WHERE C.[ConsignmentReferenceForAllLegsAssignedByMpd] = @ConsignmentReference

GO
/****** Object:  StoredProcedure [dbo].[GetTrackingConfiguration]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTrackingConfiguration]
(
	@ConsignmentReference NVARCHAR(MAX) = NULL,
	@CarrierServiceReference NVARCHAR(MAX) = NULL
)
AS
	IF (@ConsignmentReference IS NOT NULL)
	BEGIN
			SELECT		TC.Id, TC.[CarrierServiceReference], TC.[IsTrackable], TC.[IsLatenessCalculationEnabled]
			FROM		[dbo].[Consignments] (NOLOCK) C
			INNER JOIN	[dbo].[CarrierConsignments] (NOLOCK) CC ON C.Id = CC.[ConsignmentId]
			INNER JOIN	[dbo].[TrackingConfiguration] (NOLOCK) TC ON CC.[CarrierServiceReference] = TC.[CarrierServiceReference]
	END
	ELSE IF (@CarrierServiceReference IS NOT NULL)
	BEGIN
			SELECT		TC.Id, TC.[CarrierServiceReference], TC.[IsTrackable], TC.[IsLatenessCalculationEnabled]
			FROM		[dbo].[TrackingConfiguration] (NOLOCK) TC WHERE TC.[CarrierServiceReference] = @CarrierServiceReference
	END

GO
/****** Object:  StoredProcedure [dbo].[RemoveCarrierAccount]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RemoveCarrierAccount] 
(
	 @CarrierAccountReference AS NVARCHAR(100)
) 
AS
BEGIN

---- ===========================================================================
---- --							          SCRIPT INFORMATION						                 	--
---- ===========================================================================
---- Author:		  Mark Topping
---- Created:		  15/02/2018
---- Description:	  Removes all the rows believed to relate to a carrier account.
---- Updated:     
---- ===========================================================================


BEGIN TRY

BEGIN TRANSACTION  


	SET NOCOUNT ON
	SET XACT_ABORT ON
   
	
  -- ## Safeguards ##
  IF ISNULL(@CarrierAccountReference, '') = ''
  BEGIN
    THROW 51000, 'Invalid parameter. @CarrierAccountReference is a required field', 1
  END
 
  
    -- ===========================
  -- ## Deletions from Tracking ##
  -- =============================

  -- 1. TrackingEvents
  -- 2. CarrierPackages
  -- 3. Consignments
  -- 4. CarrierConsignments
  -- 5. CarrierGatewayConfiguration
  -- 6. ScheduleEntry
  
  PRINT('Deleting records from electio_tracking...');
  
	--In practice there is only ever one for a carrier account in CarrierGatewayConfiguration but multiple rows are possible.
	declare @gatewayConfigIds table (Id int)
	insert into @gatewayConfigIds 
	select Id from dbo.CarrierGatewayConfiguration WHERE CarrierAccountReference = @CarrierAccountReference 

	declare @carrierConsignmentIds table (Id int)
	insert into @carrierConsignmentIds
		select Id from dbo.CarrierConsignments WHERE CarrierGatewayConfigurationId in (select Id from @gatewayConfigIds)

	declare @consignmentIds table (Id int)
	insert into @consignmentIds
		select ConsignmentId FROM dbo.CarrierConsignments WHERE CarrierGatewayConfigurationId in (select Id from @gatewayConfigIds)

	declare @packageIds table(Id int)
	insert into @packageIds 
		select cp.Id FROM dbo.CarrierPackages cp
			join dbo.CarrierConsignments cc on cp.CarrierConsignmentId=cc.Id
			join @gatewayConfigIds ids on cc.CarrierGatewayConfigurationId= ids.Id

  -- 1. TrackingEvents

	delete FROM dbo.TrackingEvents WHERE CarrierPackageId in (select Id FROM @packageIds)
    
    PRINT ('Deleted ' + CAST(@@ROWCOUNT AS NVARCHAR) + ' row(s) from TrackingEvents');  

  -- 2. CarrierPackages

	delete FROM dbo.CarrierPackages WHERE Id in (select Id FROM @packageIds)
    
    PRINT ('Deleted ' + CAST(@@ROWCOUNT AS NVARCHAR) + ' row(s) from CarrierPackages');   

  -- 3. CarrierConsignments

	delete FROM dbo.CarrierConsignments WHERE Id in (select Id from @carrierConsignmentIds)
    
    PRINT ('Deleted ' + CAST(@@ROWCOUNT AS NVARCHAR) + ' row(s) from CarrierConsignments');  

  -- 4. Consignments

	delete FROM dbo.Consignments WHERE Id in (select Id from @consignmentIds)
    
    PRINT ('Deleted ' + CAST(@@ROWCOUNT AS NVARCHAR) + ' row(s) from Consignments'); 

  -- 5. CarrierGatewayConfiguration

	delete FROM dbo.CarrierGatewayConfiguration WHERE CarrierAccountReference = @CarrierAccountReference
    
    PRINT ('Deleted ' + CAST(@@ROWCOUNT AS NVARCHAR) + ' row(s) from CarrierGatewayConfiguration');  

  -- 6. ScheduleEntry

	delete FROM dbo.ScheduleEntry WHERE Name like @CarrierAccountReference+'_TrackingEventsJob'
    
    PRINT ('Deleted ' + CAST(@@ROWCOUNT AS NVARCHAR) + ' row(s) from ScheduleEntry');  
	  
  PRINT ('Done Tracking');

  PRINT ('Committing Transaction');
  COMMIT TRANSACTION
  PRINT ('Done');

END TRY

BEGIN CATCH
  PRINT ('An Exception was thrown. Rolling back any deletions made');
  
  IF(@@TRANCOUNT > 0)
  BEGIN
    ROLLBACK TRAN;
  END;
  
  THROW;       
  
END CATCH

END  -- End of Proc creation 
GO
/****** Object:  StoredProcedure [dbo].[sp_MSdel_dboCarrierConsignments]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSdel_dboCarrierConsignments]
		@pkc1 bigint
as
begin  
	delete [dbo].[CarrierConsignments]
	where [Id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
        exec sp_MSreplraiserror 20598
end  
GO
/****** Object:  StoredProcedure [dbo].[sp_MSdel_dboCarrierGatewayConfiguration]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSdel_dboCarrierGatewayConfiguration]
		@pkc1 int
as
begin  
	delete [dbo].[CarrierGatewayConfiguration]
	where [Id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
        exec sp_MSreplraiserror 20598
end  
GO
/****** Object:  StoredProcedure [dbo].[sp_MSdel_dboCarrierPackages]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSdel_dboCarrierPackages]
		@pkc1 bigint
as
begin  
	delete [dbo].[CarrierPackages]
	where [Id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
        exec sp_MSreplraiserror 20598
end  
GO
/****** Object:  StoredProcedure [dbo].[sp_MSdel_dboConsignments]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSdel_dboConsignments]
		@pkc1 bigint
as
begin  
	delete [dbo].[Consignments]
	where [Id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
        exec sp_MSreplraiserror 20598
end  
GO
/****** Object:  StoredProcedure [dbo].[sp_MSdel_dboDBCleanupLog]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSdel_dboDBCleanupLog]
		@pkc1 bigint
as
begin  
	delete [dbo].[DBCleanupLog]
	where [Id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
        exec sp_MSreplraiserror 20598
end  
GO
/****** Object:  StoredProcedure [dbo].[sp_MSdel_dboDBCleanupQueue]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSdel_dboDBCleanupQueue]
		@pkc1 nvarchar(255)
as
begin  
	delete [dbo].[DBCleanupQueue]
	where [ConsignmentReferenceForAllLegsAssignedByMpd] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
        exec sp_MSreplraiserror 20598
end  
GO
/****** Object:  StoredProcedure [dbo].[sp_MSdel_dboMappedEvents]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSdel_dboMappedEvents]
		@pkc1 int
as
begin  
	delete [dbo].[MappedEvents]
	where [Id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
        exec sp_MSreplraiserror 20598
end  
GO
/****** Object:  StoredProcedure [dbo].[sp_MSdel_dboScheduleEntry]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSdel_dboScheduleEntry]
		@pkc1 bigint
as
begin  
	delete [dbo].[ScheduleEntry]
	where [Id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
        exec sp_MSreplraiserror 20598
end  
GO
/****** Object:  StoredProcedure [dbo].[sp_MSdel_dboTrackingConfiguration]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSdel_dboTrackingConfiguration]
		@pkc1 bigint
as
begin  
	delete [dbo].[TrackingConfiguration]
	where [Id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
        exec sp_MSreplraiserror 20598
end  
GO
/****** Object:  StoredProcedure [dbo].[sp_MSdel_dboTrackingEvents]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSdel_dboTrackingEvents]
		@pkc1 bigint
as
begin  
	delete [dbo].[TrackingEvents]
	where [Id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
        exec sp_MSreplraiserror 20598
end  
GO
/****** Object:  StoredProcedure [dbo].[sp_MSins_dboCarrierConsignments]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSins_dboCarrierConsignments]
    @c1 bigint,
    @c2 varchar(20),
    @c3 varchar(20),
    @c4 varchar(30),
    @c5 bigint,
    @c6 varchar(30),
    @c7 bit,
    @c8 int,
    @c9 bigint,
    @c10 datetimeoffset,
    @c11 varchar(255),
    @c12 nvarchar(255),
    @c13 int,
    @c14 nvarchar(3),
    @c15 nvarchar(4000),
    @c16 datetimeoffset
as
begin  
	insert into [dbo].[CarrierConsignments](
		[Id],
		[CarrierReference],
		[CarrierServiceReference],
		[ConsignmentReferenceForLegAssignedByCarrier],
		[ConsignmentReferenceForLegAssignedByMpd],
		[ConsignmentTrackingReference],
		[IsToBeTracked],
		[LegNumber],
		[ConsignmentId],
		[RegisteredDateTime],
		[ConsignmentReferenceForAllLegsAssignedByMpd],
		[CarrierServiceName],
		[CarrierGatewayConfigurationId],
		[DestinationCountry],
		[VersionCol],
		[AdditionalTrackingInformation],
		[NextTrackableTime]
	) values (
    @c1,
    @c2,
    @c3,
    @c4,
    @c5,
    @c6,
    @c7,
    @c8,
    @c9,
    @c10,
    @c11,
    @c12,
    @c13,
    @c14,
    default,
    @c15,
    @c16	) 
end  
GO
/****** Object:  StoredProcedure [dbo].[sp_MSins_dboCarrierGatewayConfiguration]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSins_dboCarrierGatewayConfiguration]
    @c1 int,
    @c2 varchar(2048),
    @c3 bit,
    @c4 nvarchar(50),
    @c5 nvarchar(50)
as
begin  
	insert into [dbo].[CarrierGatewayConfiguration](
		[Id],
		[Configuration],
		[Active],
		[CarrierAccountReference],
		[GatewayReference],
		[VersionCol]
	) values (
    @c1,
    @c2,
    @c3,
    @c4,
    @c5,
    default	) 
end  
GO
/****** Object:  StoredProcedure [dbo].[sp_MSins_dboCarrierPackages]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSins_dboCarrierPackages]
    @c1 bigint,
    @c2 varchar(30),
    @c3 bigint,
    @c4 varchar(30),
    @c5 bigint,
    @c6 nvarchar(30)
as
begin  
	insert into [dbo].[CarrierPackages](
		[Id],
		[PackageReferenceForLegAssignedByCarrier],
		[PackageReferenceForLegAssignedByMpd],
		[PackageTrackingReference],
		[CarrierConsignmentId],
		[PackageReferenceForAllLegsAssignedByMpd],
		[VersionCol]
	) values (
    @c1,
    @c2,
    @c3,
    @c4,
    @c5,
    @c6,
    default	) 
end  
GO
/****** Object:  StoredProcedure [dbo].[sp_MSins_dboConsignments]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSins_dboConsignments]
    @c1 bigint,
    @c2 varchar(30),
    @c3 uniqueidentifier
as
begin  
	insert into [dbo].[Consignments](
		[Id],
		[ConsignmentReferenceForAllLegsAssignedByMpd],
		[VersionCol],
		[CustomerReference]
	) values (
    @c1,
    @c2,
    default,
    @c3	) 
end  
GO
/****** Object:  StoredProcedure [dbo].[sp_MSins_dboDBCleanupLog]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSins_dboDBCleanupLog]
    @c1 bigint,
    @c2 nvarchar(255),
    @c3 nvarchar(255),
    @c4 datetime,
    @c5 bit,
    @c6 nvarchar(max)
as
begin  
	insert into [dbo].[DBCleanupLog](
		[Id],
		[DB_name],
		[ConsignmentReference],
		[Timestamp],
		[Success],
		[Message]
	) values (
    @c1,
    @c2,
    @c3,
    @c4,
    @c5,
    @c6	) 
end  
GO
/****** Object:  StoredProcedure [dbo].[sp_MSins_dboDBCleanupQueue]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSins_dboDBCleanupQueue]
    @c1 nvarchar(255)
as
begin  
	insert into [dbo].[DBCleanupQueue](
		[ConsignmentReferenceForAllLegsAssignedByMpd]
	) values (
    @c1	) 
end  
GO
/****** Object:  StoredProcedure [dbo].[sp_MSins_dboMappedEvents]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSins_dboMappedEvents]
    @c1 int,
    @c2 varchar(255),
    @c3 varchar(255),
    @c4 varchar(255),
    @c5 varchar(255),
    @c6 varchar(255)
as
begin  
	insert into [dbo].[MappedEvents](
		[Id],
		[CarrierEventDescription],
		[CarrierEventCode],
		[EventGroup],
		[CarrierReference],
		[Description]
	) values (
    @c1,
    @c2,
    @c3,
    @c4,
    @c5,
    @c6	) 
end  
GO
/****** Object:  StoredProcedure [dbo].[sp_MSins_dboScheduleEntry]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSins_dboScheduleEntry]
    @c1 bigint,
    @c2 nvarchar(255),
    @c3 nvarchar(255),
    @c4 nvarchar(255),
    @c5 nvarchar(50),
    @c6 bit,
    @c7 nvarchar(4000)
as
begin  
	insert into [dbo].[ScheduleEntry](
		[Id],
		[Name],
		[GroupName],
		[CronExpression],
		[JobType],
		[Active],
		[Configuration]
	) values (
    @c1,
    @c2,
    @c3,
    @c4,
    @c5,
    @c6,
    @c7	) 
end  
GO
/****** Object:  StoredProcedure [dbo].[sp_MSins_dboTrackingConfiguration]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSins_dboTrackingConfiguration]
    @c1 bigint,
    @c2 nvarchar(50),
    @c3 bit,
    @c4 bit
as
begin  
	insert into [dbo].[TrackingConfiguration](
		[Id],
		[CarrierServiceReference],
		[IsTrackable],
		[IsLatenessCalculationEnabled]
	) values (
    @c1,
    @c2,
    @c3,
    @c4	) 
end  
GO
/****** Object:  StoredProcedure [dbo].[sp_MSins_dboTrackingEvents]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSins_dboTrackingEvents]
    @c1 bigint,
    @c2 varchar(255),
    @c3 varchar(500),
    @c4 varchar(500),
    @c5 datetimeoffset,
    @c6 varchar(100),
    @c7 varchar(50),
    @c8 bigint,
    @c9 nvarchar(100)
as
begin  
	insert into [dbo].[TrackingEvents](
		[Id],
		[CarrierEventCode],
		[CarrierEventDescription],
		[Description],
		[Date],
		[Location],
		[Signatory],
		[CarrierPackageId],
		[MpdRecognisedEventGroup],
		[VersionCol]
	) values (
    @c1,
    @c2,
    @c3,
    @c4,
    @c5,
    @c6,
    @c7,
    @c8,
    @c9,
    default	) 
end  
GO
/****** Object:  StoredProcedure [dbo].[sp_MSupd_dboCarrierConsignments]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSupd_dboCarrierConsignments]
		@c1 bigint = NULL,
		@c2 varchar(20) = NULL,
		@c3 varchar(20) = NULL,
		@c4 varchar(30) = NULL,
		@c5 bigint = NULL,
		@c6 varchar(30) = NULL,
		@c7 bit = NULL,
		@c8 int = NULL,
		@c9 bigint = NULL,
		@c10 datetimeoffset = NULL,
		@c11 varchar(255) = NULL,
		@c12 nvarchar(255) = NULL,
		@c13 int = NULL,
		@c14 nvarchar(3) = NULL,
		@c15 nvarchar(4000) = NULL,
		@c16 datetimeoffset = NULL,
		@pkc1 bigint = NULL,
		@bitmap binary(2)
as
begin  

update [dbo].[CarrierConsignments] set
		[CarrierReference] = case substring(@bitmap,1,1) & 2 when 2 then @c2 else [CarrierReference] end,
		[CarrierServiceReference] = case substring(@bitmap,1,1) & 4 when 4 then @c3 else [CarrierServiceReference] end,
		[ConsignmentReferenceForLegAssignedByCarrier] = case substring(@bitmap,1,1) & 8 when 8 then @c4 else [ConsignmentReferenceForLegAssignedByCarrier] end,
		[ConsignmentReferenceForLegAssignedByMpd] = case substring(@bitmap,1,1) & 16 when 16 then @c5 else [ConsignmentReferenceForLegAssignedByMpd] end,
		[ConsignmentTrackingReference] = case substring(@bitmap,1,1) & 32 when 32 then @c6 else [ConsignmentTrackingReference] end,
		[IsToBeTracked] = case substring(@bitmap,1,1) & 64 when 64 then @c7 else [IsToBeTracked] end,
		[LegNumber] = case substring(@bitmap,1,1) & 128 when 128 then @c8 else [LegNumber] end,
		[ConsignmentId] = case substring(@bitmap,2,1) & 1 when 1 then @c9 else [ConsignmentId] end,
		[RegisteredDateTime] = case substring(@bitmap,2,1) & 2 when 2 then @c10 else [RegisteredDateTime] end,
		[ConsignmentReferenceForAllLegsAssignedByMpd] = case substring(@bitmap,2,1) & 4 when 4 then @c11 else [ConsignmentReferenceForAllLegsAssignedByMpd] end,
		[CarrierServiceName] = case substring(@bitmap,2,1) & 8 when 8 then @c12 else [CarrierServiceName] end,
		[CarrierGatewayConfigurationId] = case substring(@bitmap,2,1) & 16 when 16 then @c13 else [CarrierGatewayConfigurationId] end,
		[DestinationCountry] = case substring(@bitmap,2,1) & 32 when 32 then @c14 else [DestinationCountry] end,
		[AdditionalTrackingInformation] = case substring(@bitmap,2,1) & 64 when 64 then @c15 else [AdditionalTrackingInformation] end,
		[NextTrackableTime] = case substring(@bitmap,2,1) & 128 when 128 then @c16 else [NextTrackableTime] end
	where [Id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
        exec sp_MSreplraiserror 20598
end 
GO
/****** Object:  StoredProcedure [dbo].[sp_MSupd_dboCarrierGatewayConfiguration]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSupd_dboCarrierGatewayConfiguration]
		@c1 int = NULL,
		@c2 varchar(2048) = NULL,
		@c3 bit = NULL,
		@c4 nvarchar(50) = NULL,
		@c5 nvarchar(50) = NULL,
		@pkc1 int = NULL,
		@bitmap binary(1)
as
begin  

update [dbo].[CarrierGatewayConfiguration] set
		[Configuration] = case substring(@bitmap,1,1) & 2 when 2 then @c2 else [Configuration] end,
		[Active] = case substring(@bitmap,1,1) & 4 when 4 then @c3 else [Active] end,
		[CarrierAccountReference] = case substring(@bitmap,1,1) & 8 when 8 then @c4 else [CarrierAccountReference] end,
		[GatewayReference] = case substring(@bitmap,1,1) & 16 when 16 then @c5 else [GatewayReference] end
	where [Id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
        exec sp_MSreplraiserror 20598
end 
GO
/****** Object:  StoredProcedure [dbo].[sp_MSupd_dboCarrierPackages]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSupd_dboCarrierPackages]
		@c1 bigint = NULL,
		@c2 varchar(30) = NULL,
		@c3 bigint = NULL,
		@c4 varchar(30) = NULL,
		@c5 bigint = NULL,
		@c6 nvarchar(30) = NULL,
		@pkc1 bigint = NULL,
		@bitmap binary(1)
as
begin  

update [dbo].[CarrierPackages] set
		[PackageReferenceForLegAssignedByCarrier] = case substring(@bitmap,1,1) & 2 when 2 then @c2 else [PackageReferenceForLegAssignedByCarrier] end,
		[PackageReferenceForLegAssignedByMpd] = case substring(@bitmap,1,1) & 4 when 4 then @c3 else [PackageReferenceForLegAssignedByMpd] end,
		[PackageTrackingReference] = case substring(@bitmap,1,1) & 8 when 8 then @c4 else [PackageTrackingReference] end,
		[CarrierConsignmentId] = case substring(@bitmap,1,1) & 16 when 16 then @c5 else [CarrierConsignmentId] end,
		[PackageReferenceForAllLegsAssignedByMpd] = case substring(@bitmap,1,1) & 32 when 32 then @c6 else [PackageReferenceForAllLegsAssignedByMpd] end
	where [Id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
        exec sp_MSreplraiserror 20598
end 
GO
/****** Object:  StoredProcedure [dbo].[sp_MSupd_dboConsignments]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSupd_dboConsignments]
		@c1 bigint = NULL,
		@c2 varchar(30) = NULL,
		@c3 uniqueidentifier = NULL,
		@pkc1 bigint = NULL,
		@bitmap binary(1)
as
begin  

update [dbo].[Consignments] set
		[ConsignmentReferenceForAllLegsAssignedByMpd] = case substring(@bitmap,1,1) & 2 when 2 then @c2 else [ConsignmentReferenceForAllLegsAssignedByMpd] end,
		[CustomerReference] = case substring(@bitmap,1,1) & 4 when 4 then @c3 else [CustomerReference] end
	where [Id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
        exec sp_MSreplraiserror 20598
end 
GO
/****** Object:  StoredProcedure [dbo].[sp_MSupd_dboDBCleanupLog]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSupd_dboDBCleanupLog]
		@c1 bigint = NULL,
		@c2 nvarchar(255) = NULL,
		@c3 nvarchar(255) = NULL,
		@c4 datetime = NULL,
		@c5 bit = NULL,
		@c6 nvarchar(max) = NULL,
		@pkc1 bigint = NULL,
		@bitmap binary(1)
as
begin  

update [dbo].[DBCleanupLog] set
		[DB_name] = case substring(@bitmap,1,1) & 2 when 2 then @c2 else [DB_name] end,
		[ConsignmentReference] = case substring(@bitmap,1,1) & 4 when 4 then @c3 else [ConsignmentReference] end,
		[Timestamp] = case substring(@bitmap,1,1) & 8 when 8 then @c4 else [Timestamp] end,
		[Success] = case substring(@bitmap,1,1) & 16 when 16 then @c5 else [Success] end,
		[Message] = case substring(@bitmap,1,1) & 32 when 32 then @c6 else [Message] end
	where [Id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
        exec sp_MSreplraiserror 20598
end 
GO
/****** Object:  StoredProcedure [dbo].[sp_MSupd_dboDBCleanupQueue]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSupd_dboDBCleanupQueue]
		@c1 nvarchar(255) = NULL,
		@pkc1 nvarchar(255) = NULL,
		@bitmap binary(1)
as
begin  

update [dbo].[DBCleanupQueue] set
		[ConsignmentReferenceForAllLegsAssignedByMpd] = case substring(@bitmap,1,1) & 1 when 1 then @c1 else [ConsignmentReferenceForAllLegsAssignedByMpd] end
	where [ConsignmentReferenceForAllLegsAssignedByMpd] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
        exec sp_MSreplraiserror 20598
end 
GO
/****** Object:  StoredProcedure [dbo].[sp_MSupd_dboMappedEvents]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSupd_dboMappedEvents]
		@c1 int = NULL,
		@c2 varchar(255) = NULL,
		@c3 varchar(255) = NULL,
		@c4 varchar(255) = NULL,
		@c5 varchar(255) = NULL,
		@c6 varchar(255) = NULL,
		@pkc1 int = NULL,
		@bitmap binary(1)
as
begin  

update [dbo].[MappedEvents] set
		[CarrierEventDescription] = case substring(@bitmap,1,1) & 2 when 2 then @c2 else [CarrierEventDescription] end,
		[CarrierEventCode] = case substring(@bitmap,1,1) & 4 when 4 then @c3 else [CarrierEventCode] end,
		[EventGroup] = case substring(@bitmap,1,1) & 8 when 8 then @c4 else [EventGroup] end,
		[CarrierReference] = case substring(@bitmap,1,1) & 16 when 16 then @c5 else [CarrierReference] end,
		[Description] = case substring(@bitmap,1,1) & 32 when 32 then @c6 else [Description] end
	where [Id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
        exec sp_MSreplraiserror 20598
end 
GO
/****** Object:  StoredProcedure [dbo].[sp_MSupd_dboScheduleEntry]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSupd_dboScheduleEntry]
		@c1 bigint = NULL,
		@c2 nvarchar(255) = NULL,
		@c3 nvarchar(255) = NULL,
		@c4 nvarchar(255) = NULL,
		@c5 nvarchar(50) = NULL,
		@c6 bit = NULL,
		@c7 nvarchar(4000) = NULL,
		@pkc1 bigint = NULL,
		@bitmap binary(1)
as
begin  

update [dbo].[ScheduleEntry] set
		[Name] = case substring(@bitmap,1,1) & 2 when 2 then @c2 else [Name] end,
		[GroupName] = case substring(@bitmap,1,1) & 4 when 4 then @c3 else [GroupName] end,
		[CronExpression] = case substring(@bitmap,1,1) & 8 when 8 then @c4 else [CronExpression] end,
		[JobType] = case substring(@bitmap,1,1) & 16 when 16 then @c5 else [JobType] end,
		[Active] = case substring(@bitmap,1,1) & 32 when 32 then @c6 else [Active] end,
		[Configuration] = case substring(@bitmap,1,1) & 64 when 64 then @c7 else [Configuration] end
	where [Id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
        exec sp_MSreplraiserror 20598
end 
GO
/****** Object:  StoredProcedure [dbo].[sp_MSupd_dboTrackingConfiguration]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSupd_dboTrackingConfiguration]
		@c1 bigint = NULL,
		@c2 nvarchar(50) = NULL,
		@c3 bit = NULL,
		@c4 bit = NULL,
		@pkc1 bigint = NULL,
		@bitmap binary(1)
as
begin  
if (substring(@bitmap,1,1) & 1 = 1)
begin 

update [dbo].[TrackingConfiguration] set
		[Id] = case substring(@bitmap,1,1) & 1 when 1 then @c1 else [Id] end,
		[CarrierServiceReference] = case substring(@bitmap,1,1) & 2 when 2 then @c2 else [CarrierServiceReference] end,
		[IsTrackable] = case substring(@bitmap,1,1) & 4 when 4 then @c3 else [IsTrackable] end,
		[IsLatenessCalculationEnabled] = case substring(@bitmap,1,1) & 8 when 8 then @c4 else [IsLatenessCalculationEnabled] end
	where [Id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
        exec sp_MSreplraiserror 20598
end  
else
begin 

update [dbo].[TrackingConfiguration] set
		[CarrierServiceReference] = case substring(@bitmap,1,1) & 2 when 2 then @c2 else [CarrierServiceReference] end,
		[IsTrackable] = case substring(@bitmap,1,1) & 4 when 4 then @c3 else [IsTrackable] end,
		[IsLatenessCalculationEnabled] = case substring(@bitmap,1,1) & 8 when 8 then @c4 else [IsLatenessCalculationEnabled] end
	where [Id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
        exec sp_MSreplraiserror 20598
end 
end 
GO
/****** Object:  StoredProcedure [dbo].[sp_MSupd_dboTrackingEvents]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_MSupd_dboTrackingEvents]
		@c1 bigint = NULL,
		@c2 varchar(255) = NULL,
		@c3 varchar(500) = NULL,
		@c4 varchar(500) = NULL,
		@c5 datetimeoffset = NULL,
		@c6 varchar(100) = NULL,
		@c7 varchar(50) = NULL,
		@c8 bigint = NULL,
		@c9 nvarchar(100) = NULL,
		@pkc1 bigint = NULL,
		@bitmap binary(2)
as
begin  

update [dbo].[TrackingEvents] set
		[CarrierEventCode] = case substring(@bitmap,1,1) & 2 when 2 then @c2 else [CarrierEventCode] end,
		[CarrierEventDescription] = case substring(@bitmap,1,1) & 4 when 4 then @c3 else [CarrierEventDescription] end,
		[Description] = case substring(@bitmap,1,1) & 8 when 8 then @c4 else [Description] end,
		[Date] = case substring(@bitmap,1,1) & 16 when 16 then @c5 else [Date] end,
		[Location] = case substring(@bitmap,1,1) & 32 when 32 then @c6 else [Location] end,
		[Signatory] = case substring(@bitmap,1,1) & 64 when 64 then @c7 else [Signatory] end,
		[CarrierPackageId] = case substring(@bitmap,1,1) & 128 when 128 then @c8 else [CarrierPackageId] end,
		[MpdRecognisedEventGroup] = case substring(@bitmap,2,1) & 1 when 1 then @c9 else [MpdRecognisedEventGroup] end
	where [Id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
        exec sp_MSreplraiserror 20598
end 
GO
/****** Object:  StoredProcedure [dbo].[Update_TrackingEventsEndProcess]    Script Date: 13/05/2019 12:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_TrackingEventsEndProcess]
(
	@CustomerReference UNIQUEIDENTIFIER,
	@ProcessStart DATETIME
)
AS
BEGIN
UPDATE [dbo].[ProcessTrackingEvents]
SET [ProcessEnd] = GETDATE()
WHERE [CustomerReference] = @CustomerReference
	AND [ProcessStart] = @ProcessStart
	AND [ProcessEnd] IS NULL
END

GO
USE [master]
GO
ALTER DATABASE [electio_tracking] SET  READ_WRITE 
GO
