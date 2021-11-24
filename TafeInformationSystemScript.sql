USE [master]
GO
/****** Object:  Database [tafesystem]    Script Date: 25/11/2021 12:41:49 AM ******/
CREATE DATABASE [tafesystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tafesystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\tafesystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tafesystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\tafesystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [tafesystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tafesystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tafesystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tafesystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tafesystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tafesystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tafesystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [tafesystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tafesystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tafesystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tafesystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tafesystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tafesystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tafesystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tafesystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tafesystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tafesystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [tafesystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tafesystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tafesystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tafesystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tafesystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tafesystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tafesystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tafesystem] SET RECOVERY FULL 
GO
ALTER DATABASE [tafesystem] SET  MULTI_USER 
GO
ALTER DATABASE [tafesystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tafesystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tafesystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tafesystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tafesystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tafesystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'tafesystem', N'ON'
GO
ALTER DATABASE [tafesystem] SET QUERY_STORE = OFF
GO
USE [tafesystem]
GO
/****** Object:  Table [dbo].[assessment]    Script Date: 25/11/2021 12:41:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assessment](
	[assessmentid] [int] IDENTITY(1,1) NOT NULL,
	[assessmenttitle] [varchar](150) NOT NULL,
	[description] [varchar](300) NULL,
	[filename] [varchar](155) NOT NULL,
	[type] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[assessmentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [AK_assessmenttitle] UNIQUE NONCLUSTERED 
(
	[assessmenttitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[assessmentsubmission]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assessmentsubmission](
	[submissionid] [int] IDENTITY(1,1) NOT NULL,
	[studentid] [int] NOT NULL,
	[assessmentid] [int] NOT NULL,
	[submissionfilename] [varchar](100) NULL,
	[completiondate] [date] NULL,
	[duedate] [date] NULL,
	[teachermarkingid] [int] NULL,
	[result] [varchar](15) NOT NULL,
	[comments] [varchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[submissionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[assessmentunit]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assessmentunit](
	[unitid] [int] NOT NULL,
	[assessmentid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[unitid] ASC,
	[assessmentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course](
	[courseid] [int] IDENTITY(1,1) NOT NULL,
	[coursename] [varchar](100) NOT NULL,
	[description] [varchar](300) NOT NULL,
	[cost] [money] NOT NULL,
	[parttime] [bit] NOT NULL,
	[fulltime] [bit] NOT NULL,
	[online] [bit] NOT NULL,
	[aqflevel] [smallint] NOT NULL,
	[semester1] [bit] NOT NULL,
	[semester2] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[courseid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [AK_coursename] UNIQUE NONCLUSTERED 
(
	[coursename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courselocation]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courselocation](
	[courselocationid] [int] IDENTITY(1,1) NOT NULL,
	[courseid] [int] NULL,
	[locationname] [varchar](80) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[courselocationid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [AK_CourseLocation] UNIQUE NONCLUSTERED 
(
	[courseid] ASC,
	[locationname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courseunitcluster]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courseunitcluster](
	[courseunitclusterid] [int] IDENTITY(1,1) NOT NULL,
	[courseid] [int] NOT NULL,
	[clusterid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[courseunitclusterid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [AK_CourseUnitCluster] UNIQUE NONCLUSTERED 
(
	[courseid] ASC,
	[clusterid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[enrolment]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[enrolment](
	[enrolmentid] [int] IDENTITY(1,1) NOT NULL,
	[studentid] [int] NOT NULL,
	[offeringid] [int] NOT NULL,
	[paymentmethod] [varchar](20) NOT NULL,
	[amountpaid] [money] NOT NULL,
	[amountoutstanding] [money] NOT NULL,
	[enrolmentdate] [date] NULL,
	[enrolmentstatus] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[enrolmentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[location]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[location](
	[locationname] [varchar](80) NOT NULL,
	[streetaddress] [varchar](50) NOT NULL,
	[suburb] [varchar](30) NOT NULL,
	[postcode] [char](4) NOT NULL,
	[state] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[locationname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[offering]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[offering](
	[offeringid] [int] IDENTITY(1,1) NOT NULL,
	[locationname] [varchar](80) NULL,
	[courseid] [int] NOT NULL,
	[semester] [smallint] NOT NULL,
	[year] [char](4) NOT NULL,
	[startdate] [date] NOT NULL,
	[enddate] [date] NOT NULL,
	[offeringtype] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[offeringid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[resource]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[resource](
	[resourceid] [int] IDENTITY(1,1) NOT NULL,
	[resourcetitle] [varchar](150) NOT NULL,
	[resourcefilename] [varchar](150) NULL,
	[authorid] [int] NOT NULL,
	[courseunitclusterid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[resourceid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [AK_resourcetitle] UNIQUE NONCLUSTERED 
(
	[resourcetitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[studentid] [int] IDENTITY(1,1) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[salt] [varchar](255) NOT NULL,
	[firstname] [varchar](50) NOT NULL,
	[surname] [varchar](50) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[mobile] [char](10) NOT NULL,
	[streetaddress] [varchar](100) NOT NULL,
	[suburb] [varchar](40) NOT NULL,
	[postcode] [char](4) NOT NULL,
	[state] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[studentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teacher]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher](
	[teacherid] [int] IDENTITY(1,1) NOT NULL,
	[locationname] [varchar](80) NULL,
	[password] [varchar](255) NOT NULL,
	[salt] [varchar](255) NOT NULL,
	[firstname] [varchar](30) NOT NULL,
	[surname] [varchar](30) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[mobile] [char](10) NOT NULL,
	[streetaddress] [varchar](100) NOT NULL,
	[suburb] [varchar](40) NOT NULL,
	[postcode] [char](4) NOT NULL,
	[state] [varchar](10) NOT NULL,
	[employmenttype] [varchar](15) NOT NULL,
	[admin] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[teacherid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[timetableitem]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[timetableitem](
	[timetableid] [int] IDENTITY(1,1) NOT NULL,
	[offeringid] [int] NOT NULL,
	[courseunitclusterid] [int] NOT NULL,
	[teacherid] [int] NOT NULL,
	[building] [varchar](10) NULL,
	[room] [varchar](10) NULL,
	[starttime] [time](7) NOT NULL,
	[endtime] [time](7) NOT NULL,
	[dayrunning] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[timetableid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[unit]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[unit](
	[unitid] [int] IDENTITY(1,1) NOT NULL,
	[unitname] [varchar](100) NOT NULL,
	[type] [varchar](20) NOT NULL,
	[cost] [money] NOT NULL,
	[description] [varchar](300) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[unitid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [AK_unitname] UNIQUE NONCLUSTERED 
(
	[unitname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[unitcluster]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[unitcluster](
	[clusterid] [int] IDENTITY(1,1) NOT NULL,
	[clustername] [varchar](50) NOT NULL,
	[description] [varchar](300) NOT NULL,
	[cost] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[clusterid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [AK_clustername] UNIQUE NONCLUSTERED 
(
	[clustername] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[unitclusterresult]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[unitclusterresult](
	[studentid] [int] NOT NULL,
	[clusterid] [int] NOT NULL,
	[completiondate] [date] NULL,
	[result] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[studentid] ASC,
	[clusterid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[unitclusterunit]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[unitclusterunit](
	[clusterid] [int] NOT NULL,
	[unitid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[clusterid] ASC,
	[unitid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[unitresult]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[unitresult](
	[studentid] [int] NOT NULL,
	[unitid] [int] NOT NULL,
	[completiondate] [date] NULL,
	[result] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[studentid] ASC,
	[unitid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[teacher] ADD  DEFAULT ((0)) FOR [admin]
GO
ALTER TABLE [dbo].[assessmentsubmission]  WITH CHECK ADD  CONSTRAINT [FK__assessmen__asses__4222D4EF] FOREIGN KEY([assessmentid])
REFERENCES [dbo].[assessment] ([assessmentid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[assessmentsubmission] CHECK CONSTRAINT [FK__assessmen__asses__4222D4EF]
GO
ALTER TABLE [dbo].[assessmentsubmission]  WITH CHECK ADD  CONSTRAINT [FK__assessmen__stude__412EB0B6] FOREIGN KEY([studentid])
REFERENCES [dbo].[student] ([studentid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[assessmentsubmission] CHECK CONSTRAINT [FK__assessmen__stude__412EB0B6]
GO
ALTER TABLE [dbo].[assessmentsubmission]  WITH CHECK ADD  CONSTRAINT [FK__assessmen__teach__4316F928] FOREIGN KEY([teachermarkingid])
REFERENCES [dbo].[teacher] ([teacherid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[assessmentsubmission] CHECK CONSTRAINT [FK__assessmen__teach__4316F928]
GO
ALTER TABLE [dbo].[assessmentunit]  WITH CHECK ADD  CONSTRAINT [FK__assessmen__asses__4F7CD00D] FOREIGN KEY([assessmentid])
REFERENCES [dbo].[assessment] ([assessmentid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[assessmentunit] CHECK CONSTRAINT [FK__assessmen__asses__4F7CD00D]
GO
ALTER TABLE [dbo].[assessmentunit]  WITH CHECK ADD  CONSTRAINT [FK__assessmen__uniti__4E88ABD4] FOREIGN KEY([unitid])
REFERENCES [dbo].[unit] ([unitid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[assessmentunit] CHECK CONSTRAINT [FK__assessmen__uniti__4E88ABD4]
GO
ALTER TABLE [dbo].[courselocation]  WITH CHECK ADD  CONSTRAINT [FK__courseloc__cours__4AB81AF0] FOREIGN KEY([courseid])
REFERENCES [dbo].[course] ([courseid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[courselocation] CHECK CONSTRAINT [FK__courseloc__cours__4AB81AF0]
GO
ALTER TABLE [dbo].[courselocation]  WITH CHECK ADD  CONSTRAINT [FK__courseloc__locat__4BAC3F29] FOREIGN KEY([locationname])
REFERENCES [dbo].[location] ([locationname])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[courselocation] CHECK CONSTRAINT [FK__courseloc__locat__4BAC3F29]
GO
ALTER TABLE [dbo].[courseunitcluster]  WITH CHECK ADD  CONSTRAINT [FK__courseuni__clust__5812160E] FOREIGN KEY([clusterid])
REFERENCES [dbo].[unitcluster] ([clusterid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[courseunitcluster] CHECK CONSTRAINT [FK__courseuni__clust__5812160E]
GO
ALTER TABLE [dbo].[enrolment]  WITH CHECK ADD  CONSTRAINT [FK__enrolment__offer__6FE99F9F] FOREIGN KEY([offeringid])
REFERENCES [dbo].[offering] ([offeringid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[enrolment] CHECK CONSTRAINT [FK__enrolment__offer__6FE99F9F]
GO
ALTER TABLE [dbo].[enrolment]  WITH CHECK ADD  CONSTRAINT [FK__enrolment__stude__6EF57B66] FOREIGN KEY([studentid])
REFERENCES [dbo].[student] ([studentid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[enrolment] CHECK CONSTRAINT [FK__enrolment__stude__6EF57B66]
GO
ALTER TABLE [dbo].[offering]  WITH CHECK ADD  CONSTRAINT [FK__offering__course__2C3393D0] FOREIGN KEY([courseid])
REFERENCES [dbo].[course] ([courseid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[offering] CHECK CONSTRAINT [FK__offering__course__2C3393D0]
GO
ALTER TABLE [dbo].[offering]  WITH CHECK ADD  CONSTRAINT [FK__offering__locati__2B3F6F97] FOREIGN KEY([locationname])
REFERENCES [dbo].[location] ([locationname])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[offering] CHECK CONSTRAINT [FK__offering__locati__2B3F6F97]
GO
ALTER TABLE [dbo].[resource]  WITH CHECK ADD  CONSTRAINT [FK__resource__author__46E78A0C] FOREIGN KEY([authorid])
REFERENCES [dbo].[teacher] ([teacherid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[resource] CHECK CONSTRAINT [FK__resource__author__46E78A0C]
GO
ALTER TABLE [dbo].[resource]  WITH CHECK ADD FOREIGN KEY([courseunitclusterid])
REFERENCES [dbo].[courseunitcluster] ([courseunitclusterid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[teacher]  WITH CHECK ADD FOREIGN KEY([locationname])
REFERENCES [dbo].[location] ([locationname])
GO
ALTER TABLE [dbo].[timetableitem]  WITH CHECK ADD  CONSTRAINT [FK__timetable__cours__4589517F] FOREIGN KEY([courseunitclusterid])
REFERENCES [dbo].[courseunitcluster] ([courseunitclusterid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[timetableitem] CHECK CONSTRAINT [FK__timetable__cours__4589517F]
GO
ALTER TABLE [dbo].[timetableitem]  WITH CHECK ADD  CONSTRAINT [FK__timetable__offer__44952D46] FOREIGN KEY([offeringid])
REFERENCES [dbo].[offering] ([offeringid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[timetableitem] CHECK CONSTRAINT [FK__timetable__offer__44952D46]
GO
ALTER TABLE [dbo].[timetableitem]  WITH CHECK ADD  CONSTRAINT [FK__timetable__teach__467D75B8] FOREIGN KEY([teacherid])
REFERENCES [dbo].[teacher] ([teacherid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[timetableitem] CHECK CONSTRAINT [FK__timetable__teach__467D75B8]
GO
ALTER TABLE [dbo].[unitclusterresult]  WITH CHECK ADD  CONSTRAINT [FK__unitclust__clust__6477ECF3] FOREIGN KEY([clusterid])
REFERENCES [dbo].[unitcluster] ([clusterid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[unitclusterresult] CHECK CONSTRAINT [FK__unitclust__clust__6477ECF3]
GO
ALTER TABLE [dbo].[unitclusterresult]  WITH CHECK ADD  CONSTRAINT [FK__unitclust__stude__6383C8BA] FOREIGN KEY([studentid])
REFERENCES [dbo].[student] ([studentid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[unitclusterresult] CHECK CONSTRAINT [FK__unitclust__stude__6383C8BA]
GO
ALTER TABLE [dbo].[unitclusterunit]  WITH CHECK ADD  CONSTRAINT [FK__unitclust__clust__52593CB8] FOREIGN KEY([clusterid])
REFERENCES [dbo].[unitcluster] ([clusterid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[unitclusterunit] CHECK CONSTRAINT [FK__unitclust__clust__52593CB8]
GO
ALTER TABLE [dbo].[unitclusterunit]  WITH CHECK ADD  CONSTRAINT [FK__unitclust__uniti__534D60F1] FOREIGN KEY([unitid])
REFERENCES [dbo].[unit] ([unitid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[unitclusterunit] CHECK CONSTRAINT [FK__unitclust__uniti__534D60F1]
GO
ALTER TABLE [dbo].[unitresult]  WITH CHECK ADD  CONSTRAINT [FK__unitresul__stude__37A5467C] FOREIGN KEY([studentid])
REFERENCES [dbo].[student] ([studentid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[unitresult] CHECK CONSTRAINT [FK__unitresul__stude__37A5467C]
GO
ALTER TABLE [dbo].[unitresult]  WITH CHECK ADD  CONSTRAINT [FK__unitresul__uniti__38996AB5] FOREIGN KEY([unitid])
REFERENCES [dbo].[unit] ([unitid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[unitresult] CHECK CONSTRAINT [FK__unitresul__uniti__38996AB5]
GO
/****** Object:  StoredProcedure [dbo].[tsp_AddAssessment]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE 
[dbo].[tsp_AddAssessment] (@assessmenttitle VARCHAR(150), @description VARCHAR(300), @filename VARCHAR(100), @type VARCHAR(15))
AS
BEGIN
INSERT INTO assessment(assessmenttitle, description, filename, type) VALUES(@assessmenttitle, @description, @filename, @type);
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_AddCluster]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_AddCluster] (@clustername VARCHAR(30), @description VARCHAR(300), @cost MONEY)
AS
BEGIN
INSERT INTO unitcluster VALUES(@clustername, @description, @cost);
END;


GO
/****** Object:  StoredProcedure [dbo].[tsp_AddCourse]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_AddCourse] (@coursename VARCHAR(30), @description VARCHAR(300), @cost MONEY, @parttime BIT, @fulltime BIT, @online BIT, @aqflevel TINYINT, @semester1 BIT, @semester2 BIT)
AS
BEGIN
INSERT INTO course VALUES(@coursename, @description, @cost, @parttime, @fulltime, @online, @aqflevel, @semester1, @semester2);

END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_AddLocation]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE 
[dbo].[tsp_AddLocation] (@locationname VARCHAR(50), @streetaddress VARCHAR(50), @suburb VARCHAR(30),@postcode CHAR(4), @state VARCHAR(10))
AS
BEGIN
INSERT INTO location VALUES(@locationname, @streetaddress, @suburb, @postcode, @state);
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_AddOffering]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_AddOffering] (@locationname VARCHAR(80), @courseid INT, @semester SMALLINT, @startdate DATE, @enddate DATE, @offeringtype VARCHAR(15))
AS
BEGIN
INSERT INTO offering VALUES(@locationname, @courseid, @semester, (SELECT YEAR(@startdate) AS DATE), @startdate, @enddate, @offeringtype);
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_AddResource]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_AddResource] (@resourcetitle VARCHAR(150), @resourcefilename VARCHAR(150), @authorID INT, @courseunitclusterid INT)
AS
BEGIN
INSERT INTO resource(resourcetitle, resourcefilename, authorid, courseunitclusterid) VALUES (@resourcetitle, @resourcefilename, @authorID, @courseunitclusterid);
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_AddStudent]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_AddStudent](@password VARCHAR(255), @firstname VARCHAR(30), @surname VARCHAR(30), @email VARCHAR(50), @mobile CHAR(10), @streetaddress VARCHAR(50), @suburb VARCHAR(30), @state VARCHAR(10), @postcode CHAR(4), @salt VARCHAR(255))
AS
BEGIN
INSERT INTO student VALUES (@password, @salt, @firstname, @surname, @email, @mobile, @streetaddress, @suburb, @postcode, @state);
END;





GO
/****** Object:  StoredProcedure [dbo].[tsp_AddTeacher]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_AddTeacher](@locationname VARCHAR(50), @password VARCHAR(255), @firstname VARCHAR(30), @surname VARCHAR(30), @email VARCHAR(50), @mobile CHAR(10), @streetaddress VARCHAR(50), @suburb VARCHAR(30), @state VARCHAR(10), @postcode CHAR(4), @employmenttype VARCHAR(15), @salt VARCHAR(255))
AS
BEGIN
INSERT INTO teacher VALUES (
@locationname, 
@password, 
@salt,
@firstname, 
@surname, 
@email, 
@mobile, 
@streetaddress, 
@suburb, 
@postcode, 
@state, 
@employmenttype
);
END;



GO
/****** Object:  StoredProcedure [dbo].[tsp_AddTimetableItem]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_AddTimetableItem] (@offeringid INT, @courseunitclusterid INT, @teacherid INT, @building VARCHAR(10), @room VARCHAR(10), @starttime TIME(7), @endtime TIME(7), @dayrunning VARCHAR(10)) 
AS
BEGIN

DECLARE @courseid INT;
SET @courseid = (SELECT courseunitcluster.courseid FROM courseunitcluster WHERE courseunitcluster.courseunitclusterid = @courseunitclusterid);

if ( 
	@courseid NOT IN (
	SELECT courseunitcluster.courseunitclusterid 
	FROM courseunitcluster 
	JOIN timetableitem 
	ON courseunitcluster.courseunitclusterid = timetableitem.courseunitclusterid
	AND timetableitem.teacherid = @teacherid
	)
)

BEGIN
INSERT INTO timetableitem VALUES (@offeringid, @courseunitclusterid, @teacherid, @building, @room, @starttime, @endtime, @dayrunning);
END;

END;


GO
/****** Object:  StoredProcedure [dbo].[tsp_AddUnit]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_AddUnit] (@unitname VARCHAR(30), @type VARCHAR(20), @description VARCHAR(300), @cost MONEY)
AS
BEGIN
INSERT INTO unit VALUES(@unitname, @type, @cost, @description);
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_CreateAssessmentEvent]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_CreateAssessmentEvent] (@offeringid INT, @assessmentid INT, @duedate DATE, @teachermarkingid INT)
AS
BEGIN
INSERT INTO assessmentsubmission (studentid, assessmentid, duedate, teachermarkingid, result)
SELECT 
enrolment.studentid,
assessment.assessmentid,
@duedate,
@teachermarkingid,
'Unsubmitted'
FROM
enrolment
JOIN offering
ON enrolment.offeringid = offering.offeringid
JOIN course
ON offering.courseid = course.courseid
JOIN courseunitcluster
ON courseunitcluster.courseid = course.courseid
JOIN unitclusterunit
ON unitclusterunit.clusterid = courseunitcluster.clusterid
JOIN assessmentunit
ON assessmentunit.unitid = unitclusterunit.unitid
JOIN assessment
ON assessment.assessmentid = assessmentunit.assessmentid
AND assessment.assessmentid = @assessmentid
AND offering.offeringid = @offeringid

END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_CreateAssessmentUnitBridge]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_CreateAssessmentUnitBridge] (@unitid INT, @assessmentid INT)
AS
BEGIN
INSERT INTO assessmentunit VALUES (@unitid, @assessmentid);
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_CreateCourseLocationBridge]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE
[dbo].[tsp_CreateCourseLocationBridge] (@courseid INT, @locationname VARCHAR(80))
AS
BEGIN
INSERT INTO courselocation VALUES (@courseid, @locationname);
END;

SELECT * FROM courselocation;
GO
/****** Object:  StoredProcedure [dbo].[tsp_CreateCourseUnitClusterBridge]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE
[dbo].[tsp_CreateCourseUnitClusterBridge] (@courseid INT, @clusterid INT)
AS
BEGIN
INSERT INTO courseunitcluster VALUES (@courseid, @clusterid);
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_CreateUnitClusterUnitBridge]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE
[dbo].[tsp_CreateUnitClusterUnitBridge] (@clusterid INT, @unitid INT)
AS
BEGIN
INSERT INTO unitclusterunit VALUES (@clusterid, @unitid);
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_CreateUnitResourseBridge]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE 
[dbo].[tsp_CreateUnitResourseBridge] (@unitid INT, @resourceid INT)
AS
BEGIN
INSERT INTO unitresource VALUES (@unitid, @resourceid);
END;

DROP PROCEDURE tsp_GetCourseDetails;
GO
/****** Object:  StoredProcedure [dbo].[tsp_DisplayCoursesAndLocationsForTeacher]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_DisplayCoursesAndLocationsForTeacher](@teacherid INT)
AS
BEGIN
SELECT timetableitem.teacherid, 
CONCAT(teacher.firstname, ' ', teacher.surname) AS [name], 
courseunitcluster.courseid, 
offering.[year], 
offering.semester, 
offering.locationname 
from courseunitcluster 
join timetableitem
on timetableitem.courseunitclusterid = courseunitcluster.courseunitclusterid 
join course
on courseunitcluster.courseid = course.courseid
join offering
on offering.courseid = course.courseid
join teacher 
on timetableitem.teacherid = teacher.teacherid 
AND teacher.teacherid = @teacherid AND offering.offeringtype != 'Online';
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_EnrolStudent]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_EnrolStudent] (@studentid INT, @offeringid INT, @paymentmethod VARCHAR(20), @amountpaid MONEY)
AS
BEGIN

DECLARE @courseid INT;
SET @courseid = (SELECT offering.courseid FROM offering WHERE offering.offeringid = @offeringid);

DECLARE @amountoutstanding MONEY;
SET @amountoutstanding = ((SELECT cost FROM course WHERE courseid = (SELECT offering.courseid FROM offering WHERE offering.offeringid = @offeringid)) - @amountpaid);

INSERT INTO enrolment
VALUES (
@studentid, 
@offeringid, 
@paymentmethod, 
@amountpaid, 
@amountoutstanding, 
(CASE WHEN @amountoutstanding <= 0 THEN (SELECT GETDATE() AS DATE) ELSE NULL END),
(CASE WHEN @amountoutstanding <= 0 THEN 'Enrolled' ELSE 'In Progress' END));

INSERT INTO assessmentsubmission (studentid, assessmentid, result)
SELECT 
enrolment.studentid,
assessment.assessmentid,
'Unsubmitted'
FROM
enrolment
JOIN offering
ON enrolment.offeringid = offering.offeringid
JOIN course
ON offering.courseid = course.courseid
JOIN courseunitcluster
ON courseunitcluster.courseid = course.courseid
JOIN unitclusterunit
ON unitclusterunit.clusterid = courseunitcluster.clusterid
JOIN assessmentunit
ON assessmentunit.unitid = unitclusterunit.unitid
JOIN assessment
ON assessment.assessmentid = assessmentunit.assessmentid
AND offering.offeringid = @offeringid
AND enrolment.studentid = @studentid;

INSERT INTO unitresult (studentid, unitid, result)
SELECT DISTINCT 
@studentid, 
unit.unitid,
'Ungraded'
FROM unit
JOIN unitclusterunit 
ON unitclusterunit.unitid = unit.unitid 
JOIN unitcluster 
ON unitclusterunit.clusterid = unitcluster.clusterid 
JOIN courseunitcluster 
ON unitcluster.clusterid = courseunitcluster.clusterid 
JOIN course 
ON courseunitcluster.courseid = course.courseid 
AND course.courseid = @courseid;

INSERT INTO unitclusterresult (studentid, clusterid, result)
SELECT DISTINCT 
@studentid, 
unitcluster.clusterid, 
'Ungraded'
FROM unitcluster 
JOIN courseunitcluster 
ON unitcluster.clusterid = courseunitcluster.clusterid 
JOIN course 
ON courseunitcluster.courseid = course.courseid 
AND course.courseid = @courseid;

END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_FindCourseLocationID]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_FindCourseLocationID](@coursename VARCHAR(100), @locationname VARCHAR(80), @foundbridge INT OUT)
AS
BEGIN

if (@locationname is null ) 
begin
SELECT @foundbridge = courselocation.courselocationid 
FROM courselocation 
JOIN course
ON course.courseid = courselocation.courseid
AND course.coursename = @coursename
AND courselocation.locationname is null;
END;

ELSE 

BEGIN
SELECT @foundbridge = courselocation.courselocationid 
FROM courselocation 
JOIN course
ON course.courseid = courselocation.courseid
AND course.coursename = @coursename
AND courselocation.locationname = @locationname;
END;

END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_FindCourseUnitClusterBridge]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_FindCourseUnitClusterBridge](@courseid INT, @clusterid INT, @bridge INT OUT)
AS
BEGIN
SELECT DISTINCT @bridge = courseunitcluster.courseunitclusterid FROM courseunitcluster
WHERE courseunitcluster.clusterid = @clusterid 
AND courseunitcluster.courseid = @courseid;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_FindCourseUnitClusterID]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_FindCourseUnitClusterID](@coursename VARCHAR(100), @clustername VARCHAR(80), @foundbridge INT OUT)
AS
BEGIN

SELECT @foundbridge = courseunitcluster.courseunitclusterid
FROM courseunitcluster
JOIN course
ON course.courseid = courseunitcluster.courseid
JOIN unitcluster
ON courseunitcluster.clusterid = unitcluster.clusterid
AND course.coursename = @coursename
AND unitcluster.clustername= @clustername;

END;

Select * from unitresult;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetAllAssessments]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetAllAssessments]
AS
BEGIN
SELECT * FROM assessment;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetAllClusters]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetAllClusters]
AS
BEGIN
SELECT * FROM unitcluster;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetAllCLustersForCourse]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE
[dbo].[tsp_GetAllCLustersForCourse] (@coursename VARCHAR(100))
AS
BEGIN
SELECT unitcluster.* 
FROM unitcluster
JOIN courseunitcluster
ON courseunitcluster.clusterid = unitcluster.clusterid
JOIN course
ON courseunitcluster.courseid = course.courseid
AND course.coursename = @coursename;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetAllCLustersForEnrolment]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE
[dbo].[tsp_GetAllCLustersForEnrolment] (@enrolmentid INT)
AS
BEGIN
SELECT unitcluster.* 
FROM unitcluster
JOIN courseunitcluster
ON unitcluster.clusterid = courseunitcluster.clusterid
JOIN timetableitem 
ON timetableitem.courseunitclusterid = courseunitcluster.courseunitclusterid
JOIN offering
ON timetableitem.offeringid = offering.offeringid
JOIN enrolment
ON enrolment.offeringid = offering.offeringid
AND enrolment.enrolmentid = @enrolmentid;
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetAllClustersThatHaveNoCourse]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE 
[dbo].[tsp_GetAllClustersThatHaveNoCourse]
AS
BEGIN
SELECT unitcluster.*
FROM unitcluster
WHERE unitcluster.clusterid NOT IN (SELECT courseunitcluster.clusterid FROM courseunitcluster);
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetAllCourses]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetAllCourses]
AS
BEGIN
SELECT * FROM course;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetAllLocations]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE 
[dbo].[tsp_GetAllLocations]
AS
BEGIN
SELECT * FROM [location];
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetAllOfferings]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetAllOfferings]
AS
BEGIN
SELECT 
offering.offeringid, 
COALESCE(offering.locationname, 'Online') AS [locationname],
offering.courseid, 
offering.semester,
offering.[year],
offering.startdate, 
offering.enddate,
offering.offeringtype 
FROM offering;
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetAllStudents]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetAllStudents]
AS
BEGIN
SELECT student.studentid,
CONCAT(student.firstname, ' ', student.surname) AS [name],
student.email,
student.mobile,
CONCAT(student.streetaddress, ', ', student.suburb, ', ', student.postcode, ', ', student.state) AS [address]
FROM student;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetAllTeacherResources]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE 
[dbo].[tsp_GetAllTeacherResources] (@teacherid INT)
AS
BEGIN
SELECT unitcluster.clusterid, resource.*
FROM [resource] 
JOIN courseunitcluster 
ON courseunitcluster.courseunitclusterid = resource.courseunitclusterid
JOIN unitcluster
ON courseunitcluster.clusterid = unitcluster.clusterid
JOIN timetableitem
ON timetableitem.courseunitclusterid = resource.courseunitclusterid
AND timetableitem.teacherid = @teacherid;
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetAllTeacherResourcesForCourseUnitCluster]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE 
[dbo].[tsp_GetAllTeacherResourcesForCourseUnitCluster] (@teacherid INT, @courseunitclusterid INT)
AS
BEGIN
SELECT unitcluster.clusterid, resource.*
FROM [resource] 
JOIN courseunitcluster 
ON courseunitcluster.courseunitclusterid = resource.courseunitclusterid
JOIN unitcluster
ON courseunitcluster.clusterid = unitcluster.clusterid
JOIN timetableitem
ON timetableitem.courseunitclusterid = resource.courseunitclusterid
AND timetableitem.teacherid = @teacherid
AND resource.courseunitclusterid = @courseunitclusterid;
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetAllUnits]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetAllUnits]
AS
BEGIN
SELECT * FROM unit;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetAllUnitsThatHaveNoCourse]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE 
[dbo].[tsp_GetAllUnitsThatHaveNoCourse]
AS
BEGIN
SELECT unit.*
FROM unit
JOIN unitclusterunit
ON unitclusterunit.unitid = unit.unitid
JOIN unitcluster
ON unitcluster.clusterid = unitclusterunit.clusterid
AND unitcluster.clusterid NOT IN (SELECT courseunitcluster.clusterid FROM courseunitcluster);
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetAssessmentDetails]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetAssessmentDetails] (@assessmentid INT, @assessmenttitle VARCHAR(30) OUT, @description VARCHAR(300) OUT, @filename VARCHAR(100) OUT, @type VARCHAR(15) OUT)
AS
BEGIN
SELECT @assessmenttitle = assessment.assessmenttitle FROM assessment WHERE assessment.assessmentid = @assessmentid;
SELECT @filename = assessment.[filename] FROM assessment WHERE assessment.assessmentid = @assessmentid;
SELECT @description = assessment.description FROM assessment WHERE assessment.assessmentid = @assessmentid;
SELECT @type = assessment.[type] FROM assessment WHERE assessment.assessmentid = @assessmentid;
END;


GO
/****** Object:  StoredProcedure [dbo].[tsp_GetAssessmentResults]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetAssessmentResults] (@studentid INT)
AS
BEGIN
SELECT
DISTINCT
student.studentid,
CONCAT(student.firstname, ' ', student.surname) AS [name],
course.courseid,
course.coursename,
assessment.assessmentid,
assessment.assessmenttitle,
assessmentsubmission.result
FROM enrolment
JOIN student
ON enrolment.studentid = student.studentid
JOIN offering
ON offering.offeringid = enrolment.offeringid
JOIN course
ON course.courseid = offering.courseid
JOIN courseunitcluster
ON courseunitcluster.courseid = course.courseid
JOIN unitcluster
ON unitcluster.clusterid = courseunitcluster.clusterid
JOIN unitclusterunit
ON unitclusterunit.clusterid = unitcluster.clusterid
JOIN unit
ON unit.unitid = unitclusterunit.unitid
JOIN assessmentunit
ON assessmentunit.unitid = unit.unitid
JOIN assessment 
ON assessment.assessmentid = assessmentunit.assessmentid
JOIN assessmentsubmission
ON assessmentsubmission.assessmentid = assessment.assessmentid
AND enrolment.studentid = @studentid
END;



DROP PROCEDURE tsp_GetUnitResults

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetAssessmentsForOffering]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetAssessmentsForOffering] (@offeringid INT)
AS
BEGIN
SELECT assessment.* FROM 
offering
JOIN course
ON offering.courseid = course.courseid
JOIN courseunitcluster
ON courseunitcluster.courseid = course.courseid
JOIN unitclusterunit
ON unitclusterunit.clusterid = courseunitcluster.clusterid
JOIN assessmentunit
ON assessmentunit.unitid = unitclusterunit.unitid
JOIN assessment
ON assessment.assessmentid = assessmentunit.assessmentid
AND offering.offeringid = @offeringid;
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetAssessmentsForUnit]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetAssessmentsForUnit] (@unitid INT)
AS
BEGIN
SELECT DISTINCT
assessment.*
FROM assessment
JOIN assessmentunit
ON assessmentunit.assessmentid = assessment.assessmentid
WHERE assessmentunit.unitid = @unitid;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetAssessmentsForUnitCluster]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE
[dbo].[tsp_GetAssessmentsForUnitCluster] (@clusterid INT)
AS
BEGIN
SELECT assessment.*
FROM assessment
JOIN assessmentunit
ON assessmentunit.assessmentid = assessment.assessmentid
JOIN unit
ON assessmentunit.unitid = unit.unitid
JOIN unitclusterunit
ON unitclusterunit.unitid = unit.unitid
JOIN unitcluster
ON unitcluster.clusterid = unitclusterunit.clusterid
AND unitcluster.clusterid = @clusterid;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetClusterDetails]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetClusterDetails] (@clusterid INT, @clustername VARCHAR(30) OUT, @description VARCHAR(300) OUT, @cost MONEY OUT)
AS
BEGIN
SELECT @clustername = unitcluster.clustername FROM unitcluster WHERE unitcluster.clusterid = @clusterid;
SELECT @description = unitcluster.description FROM unitcluster WHERE unitcluster.clusterid = @clusterid;
SELECT @cost = unitcluster.cost FROM unitcluster WHERE unitcluster.clusterid = @clusterid;
END;

--DROP PROCEDURE tsp_GetUnitDetails;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetCourse]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE 
[dbo].[tsp_GetCourse] (@coursename VARCHAR(100))
AS
BEGIN
SELECT * FROM course 
WHERE course.coursename = @coursename;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetCourseDetails]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetCourseDetails] (@courseid INT, @coursename VARCHAR(30) OUT, @description VARCHAR(300) OUT, @cost MONEY OUT, @parttime BIT OUT, @fulltime BIT OUT, @online BIT OUT, @aqflevel TINYINT OUT, @semester1 BIT OUT, @semester2 BIT OUT)
AS
BEGIN
SELECT @coursename = course.coursename FROM course WHERE course.courseid = @courseid;
SELECT @cost = convert(varchar(30), course.cost, 0) FROM course WHERE course.courseid = @courseid;
SELECT @description = course.description FROM course WHERE course.courseid = @courseid;
SELECT @parttime = course.parttime FROM course WHERE course.courseid = @courseid;
SELECT @fulltime = course.fulltime FROM course WHERE course.courseid = @courseid;
SELECT @online = course.[online] FROM course WHERE course.courseid = @courseid;
SELECT @aqflevel = course.AQFlevel FROM course WHERE course.courseid = @courseid;
SELECT @semester1 = course.semester1 FROM course WHERE course.courseid = @courseid;
SELECT @semester2 = course.semester2 FROM course WHERE course.courseid = @courseid;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetCourseOffersFullTime]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetCourseOffersFullTime] (@courseid INT, @fulltime BIT OUT)
AS
BEGIN
SELECT @fulltime = CASE WHEN ((SELECT course.fulltime FROM course WHERE course.courseid = @courseid) = 1) THEN 1 ELSE 0 END;
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetCourseOffersOnline]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetCourseOffersOnline] (@courseid INT, @online BIT OUT)
AS
BEGIN
SELECT @online = CASE WHEN ((SELECT course.[online] FROM course WHERE course.courseid = @courseid) = 1) THEN 1 ELSE 0 END;
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetCourseOffersPartTime]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetCourseOffersPartTime] (@courseid INT, @parttime BIT OUT)
AS
BEGIN
SELECT @parttime = CASE WHEN ((SELECT course.parttime FROM course WHERE course.courseid = @courseid) = 1) THEN 1 ELSE 0 END;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetCourseResults]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetCourseResults] (@studentid INT)
AS
BEGIN
SELECT
DISTINCT
student.studentid,
CONCAT(student.firstname, ' ', student.surname) AS [name],
course.courseid,
course.coursename,
enrolment.enrolmentstatus
FROM enrolment
JOIN student
ON enrolment.studentid = student.studentid
JOIN offering
ON offering.offeringid = enrolment.offeringid
JOIN course
ON course.courseid = offering.courseid
AND enrolment.studentid = @studentid;
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetEnrolmentDetails]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetEnrolmentDetails] (@enrolmentid INT, @studentid INT OUT, @offeringid INT OUT, @paymentmethod VARCHAR(20) OUT, @amountpaid MONEY OUT)
AS
BEGIN
SELECT @studentid = enrolment.studentid FROM enrolment WHERE enrolment.enrolmentid = @enrolmentid;
SELECT @offeringid = enrolment.offeringid FROM enrolment WHERE enrolment.enrolmentid = @enrolmentid;
SELECT @paymentmethod = enrolment.paymentmethod FROM enrolment WHERE enrolment.enrolmentid = @enrolmentid;
SELECT @amountpaid = enrolment.amountpaid FROM enrolment WHERE enrolment.enrolmentid = @enrolmentid;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetEnrolmentsForStudent]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetEnrolmentsForStudent](@studentid INT)
AS
BEGIN
SELECT enrolment.enrolmentid,
course.coursename,
offering.locationname,
offering.year,
offering.semester, 
enrolment.enrolmentstatus,
enrolment.paymentmethod,
enrolment.amountpaid,
enrolment.amountoutstanding,
enrolment.enrolmentdate,
offering.offeringtype,
offering.startdate,
offering.enddate
FROM enrolment 
JOIN offering
ON enrolment.offeringid = offering.offeringid
JOIN course
ON offering.courseid = course.courseid
AND enrolment.studentid = @studentid;
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetEnrolmentsNoOutstandingPayment]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetEnrolmentsNoOutstandingPayment](@studentid INT, @courseid INT, @locationname VARCHAR(100), @semester SMALLINT, @year CHAR(4))
AS
BEGIN
SELECT 
enrolment.enrolmentid, 
CONCAT(student.firstname, ' ', student.surname) AS [studentname], 
course.coursename,
offering.locationname,
offering.[year], 
offering.semester, 
enrolment.enrolmentstatus, 
enrolment.paymentmethod, 
enrolment.amountpaid, 
enrolment.amountoutstanding, 
enrolment.enrolmentdate, 
enrolment.enrolmentstatus, 
offering.startdate,
offering.enddate
FROM enrolment 
JOIN offering
ON offering.offeringid = enrolment.offeringid
JOIN course 
ON offering.courseid = course.courseid 
JOIN student 
ON enrolment.studentid = student.studentid 
AND enrolment.studentid = COALESCE(@studentid, enrolment.studentid)
AND offering.courseid = COALESCE(@courseid, offering.courseid)
AND offering.locationname = COALESCE(@locationname, offering.locationname)
AND offering.[year] = COALESCE(@year, offering.[year])
AND offering.semester = COALESCE(@semester, offering.semester)
AND enrolment.amountoutstanding = 0;
END;

SELECT * from enrolment;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetEnrolmentsOutstandingPayment]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetEnrolmentsOutstandingPayment](@studentid INT, @courseid INT, @locationname VARCHAR(100), @semester SMALLINT, @year CHAR(4))
AS
BEGIN
SELECT
enrolment.enrolmentid, 
CONCAT(student.firstname, ' ', student.surname) AS [studentname], 
course.coursename,
offering.locationname,
offering.[year], 
offering.semester, 
enrolment.enrolmentstatus, 
enrolment.paymentmethod, 
enrolment.amountpaid, 
enrolment.amountoutstanding, 
enrolment.enrolmentdate, 
enrolment.enrolmentstatus, 
offering.startdate,
offering.enddate
FROM enrolment 
JOIN offering
ON offering.offeringid = enrolment.offeringid
JOIN course 
ON offering.courseid = course.courseid 
JOIN student 
ON enrolment.studentid = student.studentid 
AND enrolment.studentid = COALESCE(@studentid, enrolment.studentid)
AND offering.courseid = COALESCE(@courseid, offering.courseid)
AND offering.locationname = COALESCE(@locationname, offering.locationname)
AND offering.[year] = COALESCE(@year, offering.[year])
AND offering.semester = COALESCE(@semester, offering.semester)
AND enrolment.amountoutstanding != 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetLocation]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE 
[dbo].[tsp_GetLocation](@locationname VARCHAR(100))
AS
BEGIN
SELECT * FROM [location] WHERE [location].locationname = @locationname;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetLocationDetails]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetLocationDetails] (@locationname VARCHAR(80), @streetaddress VARCHAR(50) OUT, @suburb VARCHAR(30) OUT, @state VARCHAR(10) OUT, @postcode CHAR(4) OUT)
AS
BEGIN
SELECT @streetaddress = [location].streetaddress FROM [location] WHERE location.locationname = @locationname;
SELECT @suburb = [location].suburb FROM [location] WHERE location.locationname = @locationname;
SELECT @postcode = [location].postcode FROM [location] WHERE location.locationname = @locationname;
SELECT @suburb = [location].suburb FROM [location] WHERE location.locationname = @locationname;
SELECT @state = [location].state FROM [location] WHERE location.locationname = @locationname;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetOfferingDetails]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetOfferingDetails] (@offeringid INT, @locationname VARCHAR(80) OUT, @courseid INT OUT, @semester SMALLINT OUT, @startdate DATE OUT, @enddate DATE OUT, @offeringtype VARCHAR(15) OUT)
AS
BEGIN
SELECT @locationname = offering.locationname FROM offering WHERE offering.offeringid = @offeringid;
SELECT @courseid = offering.courseid FROM offering WHERE offering.offeringid = @offeringid;
SELECT @semester = offering.semester FROM offering WHERE offering.offeringid = @offeringid;
SELECT @startdate = offering.startdate FROM offering WHERE offering.offeringid = @offeringid;
SELECT @enddate = offering.enddate FROM offering WHERE offering.offeringid = @offeringid;
SELECT @offeringtype = offering.offeringtype FROM offering WHERE offering.offeringid = @offeringid;

END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetOfferings]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetOfferings](@courseid INT, @locationname VARCHAR(80), @semester SMALLINT, @year DATE)
AS
BEGIN
SELECT
offering.offeringid, 
COALESCE(offering.locationname, 'Online'),
offering.courseid, 
offering.semester,
offering.[year],
offering.startdate, 
offering.enddate,
offering.offeringtype 
FROM offering
JOIN course 
ON course.courseid = offering.courseid
AND offering.courseid = COALESCE(@courseid, offering.courseid)
AND offering.locationname = COALESCE(@locationname, offering.locationname)
AND offering.semester = COALESCE(@semester, offering.semester)
AND offering.[year] = COALESCE(@year, offering.[year]);
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetOnlineEnrolmentsNoOutstandingPayment]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetOnlineEnrolmentsNoOutstandingPayment](@studentid INT, @courseid INT, @semester SMALLINT, @year CHAR(4))
AS
BEGIN
SELECT
enrolment.enrolmentid, 
CONCAT(student.firstname, ' ', student.surname) AS [studentname], 
course.coursename,
offering.locationname,
offering.[year], 
offering.semester, 
enrolment.enrolmentstatus, 
enrolment.paymentmethod, 
enrolment.amountpaid, 
enrolment.amountoutstanding, 
enrolment.enrolmentdate, 
enrolment.enrolmentstatus, 
offering.startdate,
offering.enddate
FROM enrolment 
JOIN offering
ON offering.offeringid = enrolment.offeringid
JOIN course 
ON offering.courseid = course.courseid 
JOIN student 
ON enrolment.studentid = student.studentid 
AND enrolment.studentid = COALESCE(@studentid, enrolment.studentid)
AND offering.courseid = COALESCE(@courseid, offering.courseid)
AND offering.locationname = null
AND offering.[year] = COALESCE(@year, offering.[year])
AND offering.semester = COALESCE(@semester, offering.semester)
AND enrolment.amountoutstanding = 0;
END;













GO
/****** Object:  StoredProcedure [dbo].[tsp_GetOnlineEnrolmentsOutstandingPayment]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetOnlineEnrolmentsOutstandingPayment](@studentid INT, @courseid INT, @semester SMALLINT, @year CHAR(4))
AS
BEGIN
SELECT
enrolment.enrolmentid, 
CONCAT(student.firstname, ' ', student.surname) AS [studentname], 
course.coursename,
offering.locationname,
offering.[year], 
offering.semester, 
enrolment.enrolmentstatus, 
enrolment.paymentmethod, 
enrolment.amountpaid, 
enrolment.amountoutstanding, 
enrolment.enrolmentdate, 
enrolment.enrolmentstatus, 
offering.startdate,
offering.enddate
FROM enrolment 
JOIN offering
ON offering.offeringid = enrolment.offeringid
JOIN course 
ON offering.courseid = course.courseid 
JOIN student 
ON enrolment.studentid = student.studentid 
AND enrolment.studentid = COALESCE(@studentid, enrolment.studentid)
AND offering.courseid = COALESCE(@courseid, offering.courseid)
AND offering.locationname = null
AND offering.[year] = COALESCE(@year, offering.[year])
AND offering.semester = COALESCE(@semester, offering.semester)
AND enrolment.amountoutstanding != 0;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetResourceDetails]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetResourceDetails] (@resourceid INT, @resourcetitle VARCHAR(150) OUT, @resourcefilename VARCHAR(150) OUT, @authorid INT OUT, @courseunitclusterid INT OUT)
AS
BEGIN
SELECT @resourcetitle = resource.resourcetitle FROM resource WHERE resource.resourceid = @resourceid;
SELECT @resourcefilename = resource.resourcefilename FROM resource WHERE resource.resourceid = @resourceid;
SELECT @authorid = resource.authorID FROM resource WHERE resource.resourceid = @resourceid;
SELECT @courseunitclusterid = resource.courseunitclusterid FROM resource WHERE resource.resourceid = resourceid
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetResourcesForUnitCluster]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetResourcesForUnitCluster] (@clusterid INT)
AS
BEGIN
SELECT [resource].resourceid, [resource].resourcetitle, [resource].resourcefilename, CONCAT(teacher.firstname, ' ', teacher.surname) AS [teachername]
FROM [resource]
JOIN teacher 
ON resource.authorid = teacher.teacherid
JOIN unitresource
ON unitresource.resourceid = resource.resourceid
JOIN unit
ON unitresource.unitid = unit.unitid
JOIN unitclusterunit
ON unitclusterunit.unitid = unit.unitid
JOIN unitcluster
ON unitcluster.clusterid = unitclusterunit.clusterid
AND unitcluster.clusterid = @clusterid;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetStudentByID]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetStudentByID](@studentid INT)
AS
BEGIN
SELECT student.studentid,
CONCAT(student.firstname, ' ', student.surname) AS [name],
student.email,
student.mobile,
CONCAT(student.streetaddress, ', ', student.suburb, ', ', student.postcode, ', ', student.state) AS [address]
FROM student WHERE student.studentid = @studentid;
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetStudentByIDForTeacher]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetStudentByIDForTeacher](@studentid INT, @teacherid INT)
AS
BEGIN
SELECT student.studentid,
CONCAT(student.firstname, ' ', student.surname) AS [name],
student.email,
student.mobile,
CONCAT(student.streetaddress, ', ', student.suburb, ', ', student.postcode, ', ', student.state) AS [address]
FROM student 
JOIN enrolment
ON enrolment.studentid = student.studentid
join offering 
on enrolment.offeringid = offering.offeringid
join timetableitem
on offering.offeringid = timetableitem.offeringid
join teacher
on timetableitem.teacherid = teacher.teacherid
AND timetableitem.teacherid = @teacherid
AND student.studentid = @studentid;
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetStudentByName]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetStudentByName](@studentname VARCHAR(100))
AS
BEGIN
SELECT student.studentid,
CONCAT(student.firstname, ' ', student.surname) AS [name],
student.email,
student.mobile,
CONCAT(student.streetaddress, ', ', student.suburb, ', ', student.postcode, ', ', student.state) AS [address]
FROM student WHERE CONCAT(student.firstname, ' ', student.surname) = @studentname;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetStudentByNameForTeacher]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetStudentByNameForTeacher](@studentname VARCHAR(100), @teacherID INT)
AS
BEGIN
SELECT student.studentid,
CONCAT(student.firstname, ' ', student.surname) AS [name],
student.email,
student.mobile,
CONCAT(student.streetaddress, ', ', student.suburb, ', ', student.postcode, ', ', student.state) AS [address]
FROM student 
JOIN enrolment
ON enrolment.studentid = student.studentid
join offering 
on enrolment.offeringid = offering.offeringid
join timetableitem
on offering.offeringid = timetableitem.offeringid
join teacher
on timetableitem.teacherid = teacher.teacherid
AND timetableitem.teacherid = @teacherID
AND CONCAT(student.firstname, ' ', student.surname) = @studentname;
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetStudentDetails]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetStudentDetails] (@studentid INT, @password VARCHAR(255) out, @salt VARCHAR(255) out, @firstname VARCHAR(30) out, @surname VARCHAR(30) out, @email VARCHAR(50) out, @mobile CHAR(10) out, @streetaddress VARCHAR(50) out, @suburb VARCHAR(30) out, @state VARCHAR(10) out, @postcode CHAR(4) out)
AS
BEGIN
SELECT @password = student.[password] FROM student WHERE student.studentid = @studentid;
SELECT @salt = student.[salt] FROM student WHERE student.studentid = @studentid;
SELECT @firstname = student.firstname FROM student WHERE student.studentid = @studentid;
SELECT @surname = student.surname FROM student WHERE student.studentid = @studentid;
SELECT @email = student.email FROM student WHERE student.studentid = @studentid;
SELECT @mobile = student.mobile FROM student WHERE student.studentid = @studentid;
SELECT @streetaddress = student.streetaddress FROM student WHERE student.studentid = @studentid;
SELECT @suburb = student.suburb FROM student WHERE student.studentid = @studentid;
SELECT @postcode = student.postcode FROM student WHERE student.studentid = @studentid;
SELECT @state = student.[state] FROM student WHERE student.studentid = @studentid;
END;

SELECT * FROM student;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetStudentEnrolments]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetStudentEnrolments](@studentid INT)
AS
BEGIN
SELECT 
enrolment.enrolmentid, 
CONCAT(student.firstname, ' ', student.surname) AS [studentname], 
course.coursename,
offering.locationname,
offering.[year], 
offering.semester, 
enrolment.enrolmentstatus, 
enrolment.paymentmethod, 
enrolment.amountpaid, 
enrolment.amountoutstanding, 
enrolment.enrolmentdate, 
enrolment.enrolmentstatus, 
offering.offeringtype,
offering.startdate,
offering.enddate
FROM enrolment 
JOIN offering
ON offering.offeringid = enrolment.offeringid
JOIN course 
ON offering.courseid = course.courseid 
JOIN student 
ON enrolment.studentid = student.studentid 
AND enrolment.studentid = @studentid;
END;


GO
/****** Object:  StoredProcedure [dbo].[tsp_GetStudentSalt]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetStudentSalt](@studentid INT, @salt VARCHAR(255) OUT)
AS
BEGIN
SELECT @salt = student.salt FROM student WHERE student.studentid = @studentid;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetStudentsByCourseID]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetStudentsByCourseID] (@courseID INT, @semester INT)
AS
BEGIN
SELECT DISTINCT student.studentid,
CONCAT(student.firstname, ' ', student.surname) AS [name],
student.email,
student.mobile,
CONCAT(student.streetaddress, ', ', student.suburb, ', ', student.postcode, ', ', student.state) AS [address]
FROM student
JOIN enrolment
ON enrolment.studentid = student.studentid
join offering
ON offering.offeringid = enrolment.offeringid
JOIN course
ON offering.courseid = course.courseid
AND course.courseid = COALESCE(@courseid, course.courseid)
AND offering.semester = COALESCE(@semester, offering.semester);
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetStudentsByCourseIDForTeacher]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetStudentsByCourseIDForTeacher] (@courseID INT, @semester INT, @teacherID INT)
AS
BEGIN
SELECT DISTINCT student.studentid,
CONCAT(student.firstname, ' ', student.surname) AS [name],
student.email,
student.mobile,
CONCAT(student.streetaddress, ', ', student.suburb, ', ', student.postcode, ', ', student.state) AS [address]
FROM student
JOIN enrolment
ON enrolment.studentid = student.studentid
join offering
ON offering.offeringid = enrolment.offeringid
join timetableitem
on timetableitem.offeringid = offering.offeringid
JOIN course
ON offering.courseid = course.courseid
AND timetableitem.teacherid = @teacherID
AND course.courseid = COALESCE(@courseid, course.courseid)
AND offering.semester = COALESCE(@semester, offering.semester);
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetStudentsByCourseName]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetStudentsByCourseName] (@coursename VARCHAR(100), @semester INT)
AS
BEGIN
SELECT DISTINCT student.studentid,
CONCAT(student.firstname, ' ', student.surname) AS [name],
student.email,
student.mobile,
CONCAT(student.streetaddress, ', ', student.suburb, ', ', student.postcode, ', ', student.state) AS [address]
FROM student
JOIN enrolment
ON enrolment.studentid = student.studentid
join offering
ON offering.offeringid = enrolment.offeringid
JOIN course
ON offering.courseid = course.courseid
AND course.coursename = COALESCE(@coursename, course.coursename)
AND offering.semester = COALESCE(@semester, offering.semester);
END;


GO
/****** Object:  StoredProcedure [dbo].[tsp_GetStudentsByCourseNameForTeacher]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetStudentsByCourseNameForTeacher] (@coursename VARCHAR(100), @semester INT, @teacherID INT)
AS
BEGIN
SELECT DISTINCT student.studentid,
CONCAT(student.firstname, ' ', student.surname) AS [name],
student.email,
student.mobile,
CONCAT(student.streetaddress, ', ', student.suburb, ', ', student.postcode, ', ', student.state) AS [address]
FROM student
JOIN enrolment
ON enrolment.studentid = student.studentid
join offering
ON offering.offeringid = enrolment.offeringid
join timetableitem
on timetableitem.offeringid = offering.offeringid
JOIN teacher
ON timetableitem.teacherid = teacher.teacherid
JOIN course
ON offering.courseid = course.courseid
AND timetableitem.teacherid = @teacherID
AND course.coursename = COALESCE(@coursename, course.coursename)
AND offering.semester = COALESCE(@semester, offering.semester);
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetStudentsFromCourseAndLocation]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetStudentsFromCourseAndLocation] (@courselocationid INT)
AS
BEGIN
SELECT DISTINCT 
student.studentid, 
CONCAT(student.firstname, ' ', student.surname) AS [name], 
student.email, 
student.mobile, 
CONCAT(student.streetaddress, ', ', student.suburb, ', ', student.postcode, ', ', student.state) AS [address]
FROM student 
join enrolment
ON enrolment.studentid = student.studentid
join offering 
ON enrolment.offeringid = offering.offeringid 
join course 
on offering.courseid = course.courseid 
join courselocation
ON courselocation.courseid = course.courseid
AND courselocation.courselocationid = @courselocationid;
END;


GO
/****** Object:  StoredProcedure [dbo].[tsp_GetStudentsFromOffering]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetStudentsFromOffering] (@offeringid INT)
AS
BEGIN
SELECT DISTINCT 
student.studentid, 
CONCAT(student.firstname, ' ', student.surname) AS [name], 
student.email, 
student.mobile, 
CONCAT(student.streetaddress, ', ', student.suburb, ', ', student.postcode, ', ', student.state) AS [address]
FROM student 
join enrolment
ON enrolment.studentid = student.studentid
join offering 
ON enrolment.offeringid = offering.offeringid 
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetSubmissionDetails]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetSubmissionDetails] (@submissionid INT, @teachermarkingid INT OUT, @result VARCHAR(20) OUT, @comments VARCHAR(300) OUT)
AS
BEGIN
SELECT @teachermarkingid = assessmentsubmission.teachermarkingid FROM assessmentsubmission WHERE assessmentsubmission.submissionid = @submissionid;
SELECT @result = assessmentsubmission.result FROM assessmentsubmission WHERE assessmentsubmission.submissionid = @submissionid;
SELECT @comments = assessmentsubmission.comments FROM assessmentsubmission WHERE assessmentsubmission.submissionid = @submissionid;
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetSubmissionForAssessment]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetSubmissionForAssessment](@assessmentid INT, @studentid INT) 
AS
BEGIN
SELECT 
assessment.assessmenttitle, 
assessmentsubmission.submissionfilename, 
assessmentsubmission.completiondate, 
assessmentsubmission.duedate, 
CONCAT(teacher.firstname, ' ', teacher.surname) AS [teachername], 
assessmentsubmission.result, 
assessmentsubmission.comments 
FROM assessmentsubmission 
lEFT JOIN teacher
ON assessmentsubmission.teachermarkingid = teacher.teacherid
JOIN assessment
ON assessment.assessmentid = assessmentsubmission.assessmentid
AND assessmentsubmission.assessmentid = @assessmentid 
AND assessmentsubmission.studentid = @studentid;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetSubmissionResult]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetSubmissionResult] (@assessmentid INT, @studentid INT, @result VARCHAR(15) OUT)
AS
BEGIN
SELECT @result = assessmentsubmission.result FROM assessmentsubmission WHERE assessmentsubmission.assessmentid = @assessmentid AND assessmentsubmission.studentid = @studentid;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetSubmissions]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetSubmissions] (@timetableid INT, @studentid INT)
AS
BEGIN
SELECT
assessmentsubmission.submissionid,
assessment.assessmenttitle, 
assessmentsubmission.submissionfilename, 
assessmentsubmission.completiondate, 
assessmentsubmission.duedate, 
assessmentsubmission.teachermarkingid, 
assessmentsubmission.result,
assessmentsubmission.comments
from enrolment
JOIN student
ON enrolment.studentid = student.studentid
JOIN assessmentsubmission 
ON assessmentsubmission.studentid = enrolment.studentid
JOIN assessment
ON assessmentsubmission.assessmentid = assessment.assessmentid
JOIN offering 
ON enrolment.offeringid = offering.offeringid
JOIN timetableitem
ON timetableitem.offeringid = offering.offeringid
AND enrolment.studentid = @studentid
AND timetableitem.timetableid = @timetableid;
END;

SELECT * FROM assessmentsubmission;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetTeacherDetails]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetTeacherDetails] (@teacherid INT, @salt VARCHAR(255) OUT, @locationname VARCHAR(50) OUT, @password VARCHAR(255) out, @firstname VARCHAR(30) out, @surname VARCHAR(30) out, @email VARCHAR(50) out, @mobile CHAR(10) out, @streetaddress VARCHAR(50) out, @suburb VARCHAR(30) out, @state VARCHAR(10) out, @postcode CHAR(4) out, @employmenttype VARCHAR(15) OUT)
AS
BEGIN
SELECT @locationname = teacher.locationname FROM teacher WHERE teacher.teacherid = @teacherid;
SELECT @salt = teacher.salt FROM teacher WHERE teacher.teacherid = @teacherid;
SELECT @password = teacher.[password] FROM teacher WHERE teacher.teacherid = @teacherid;
SELECT @firstname = teacher.firstname FROM teacher WHERE teacher.teacherid = @teacherid;
SELECT @surname = teacher.surname FROM teacher WHERE teacher.teacherid = @teacherid;
SELECT @email = teacher.email FROM teacher WHERE teacher.teacherid = @teacherid;
SELECT @mobile = teacher.mobile FROM teacher WHERE teacher.teacherid = @teacherid;
SELECT @streetaddress = teacher.streetaddress FROM teacher WHERE teacher.teacherid = @teacherid;
SELECT @suburb = teacher.suburb FROM teacher WHERE teacher.teacherid = @teacherid;
SELECT @postcode = teacher.postcode FROM teacher WHERE teacher.teacherid = @teacherid;
SELECT @state = teacher.[state] FROM teacher WHERE teacher.teacherid = @teacherid;
SELECT @employmenttype = teacher.employmenttype FROM teacher WHERE teacher.teacherid = @teacherid;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetTeacherSalt]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetTeacherSalt](@teacherid INT, @salt VARCHAR(255) OUT)
AS
BEGIN
SELECT @salt = teacher.salt FROM teacher WHERE teacher.teacherid = @teacherid;
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetTestAssessment]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetTestAssessment] (@assessmentid INT OUT)
AS
BEGIN
SELECT @assessmentid = (SELECT TOP 1 assessment.assessmentid FROM assessment WHERE assessment.assessmenttitle = 'test' ORDER BY assessmentid DESC);
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetTestCluster]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetTestCluster] (@clusterid INT OUT)
AS
BEGIN
SELECT @clusterID = (SELECT TOP 1 unitcluster.clusterid FROM unitcluster WHERE unitcluster.clustername = 'test' ORDER BY clusterid DESC);
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetTestCourse]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetTestCourse] (@courseid INT OUT)
AS
BEGIN
SELECT @courseid = (SELECT TOP 1 course.courseid FROM course WHERE course.coursename = 'test' ORDER BY courseid DESC);
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetTestLocation]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetTestLocation] (@locationname VARCHAR(80) OUT)
AS
BEGIN
SELECT @locationname = (SELECT TOP 1 location.locationname FROM location WHERE location.locationname = 'test' ORDER BY locationname DESC);
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetTestOffering]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetTestOffering] (@offeringid INT OUT)
AS
BEGIN
SELECT @offeringid = (SELECT TOP 1 offering.offeringid FROM offering WHERE offering.locationname = 'test' ORDER BY offering.offeringid DESC);
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetTestResource]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetTestResource] (@resourceid INT OUT)
AS
BEGIN
SELECT @resourceid = (SELECT TOP 1 resource.resourceid FROM resource WHERE resource.resourcetitle = 'test' ORDER BY resourceid DESC);
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetTestStudent]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetTestStudent] (@studentid INT OUT)
AS
BEGIN
SELECT @studentid = (SELECT TOP 1 student.studentid FROM student WHERE student.firstname = 'test' ORDER BY studentid DESC);
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetTestTeacher]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetTestTeacher] (@teacherid INT OUT)
AS
BEGIN
SELECT @teacherid = (SELECT TOP 1 teacher.teacherid FROM teacher WHERE teacher.firstname = 'test' ORDER BY teacherid DESC);
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetTestUnit]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetTestUnit] (@unitid INT OUT)
AS
BEGIN
SELECT @unitid = (SELECT TOP 1 unit.unitid FROM unit WHERE unit.unitname = 'test' ORDER BY unitid DESC);
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetTestUnitCluster]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetTestUnitCluster] (@clusterid INT OUT)
AS
BEGIN
SELECT @clusterID = (SELECT TOP 1 unitcluster.clusterid FROM unitcluster WHERE unitcluster.clustername = 'test' ORDER BY clusterid DESC);
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetTimetableItemDetails]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetTimetableItemDetails] (@timetableid INT, @offeringid INT OUT, @courseunitclusterid INT OUT, @teacherid INT OUT, @building VARCHAR(10) OUT, @room VARCHAR(10) OUT, @starttime TIME(7) OUT, @endtime TIME(7) OUT, @dayrunning VARCHAR(10) OUT) 
AS
BEGIN
SELECT @offeringid = timetableitem.offeringid FROM timetableitem WHERE timetableitem.timetableid = @timetableid;
SELECT @courseunitclusterid = timetableitem.courseunitclusterid FROM timetableitem WHERE timetableitem.timetableid = @timetableid;
SELECT @teacherid = timetableitem.teacherid FROM timetableitem WHERE timetableitem.timetableid = @timetableid;
SELECT @building = timetableitem.building FROM timetableitem WHERE timetableitem.timetableid = @timetableid;
SELECT @room = timetableitem.room FROM timetableitem WHERE timetableitem.timetableid = @timetableid;
SELECT @starttime = timetableitem.starttime FROM timetableitem WHERE timetableitem.timetableid = @timetableid;
SELECT @endtime = timetableitem.endtime FROM timetableitem WHERE timetableitem.timetableid = @timetableid;
SELECT @dayrunning = timetableitem.dayrunning FROM timetableitem WHERE timetableitem.timetableid = @timetableid;
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetTimetableItems]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetTimetableItems] (@courselocationid INT)
AS
BEGIN
SELECT 
unitcluster.clustername, 
CONCAT(teacher.firstname, ' ', teacher.surname) AS [teachername], 
timetableitem.building, 
timetableitem.room, 
timetableitem.dayrunning, 
timetableitem.starttime, 
timetableitem.endtime
FROM timetableitem
JOIN teacher 
ON teacher.teacherid = timetableitem.teacherid 
JOIN courseunitcluster 
ON courseunitcluster.courseunitclusterid = timetableitem.courseunitclusterid 
JOIN unitcluster 
ON courseunitcluster.clusterid = unitcluster.clusterid 
AND timetableitem.courselocationid = @courselocationid;
END;



GO
/****** Object:  StoredProcedure [dbo].[tsp_GetTimetableItemsForCourseLocation]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetTimetableItemsForCourseLocation] (@courselocationid INT)
AS
BEGIN
SELECT 
timetableitem.*
FROM timetableitem
WHERE timetableitem.courselocationid = @courselocationid;
END;

SELECT * FROM courselocation;
select * from course;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetTimetableItemsForEnrolment]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetTimetableItemsForEnrolment](@enrolmentid INT)
AS
BEGIN
SELECT 
timetableitem.timetableid,
course.coursename, 
unitcluster.clustername, 
CONCAT(teacher.firstname, ' ', teacher.surname) AS [teachername] ,
timetableitem.building, 
timetableitem.room,
timetableitem.starttime, 
timetableitem.endtime, 
timetableitem.dayrunning
FROM timetableitem 
JOIN offering
ON timetableitem.offeringid = offering.offeringid
JOIN enrolment
ON enrolment.offeringid = offering.offeringid
JOIN course
ON offering.courseid = course.courseid
JOIN courseunitcluster
ON timetableitem.courseunitclusterid = courseunitcluster.courseunitclusterid
JOIN unitcluster 
ON unitcluster.clusterid = courseunitcluster.clusterid
JOIN teacher
ON timetableitem.teacherid = teacher.teacherid
AND enrolment.enrolmentid = @enrolmentid;
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetTimetableItemsForOffering]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetTimetableItemsForOffering] (@offeringid INT)
AS
BEGIN
SELECT 
timetableitem.*
FROM timetableitem
WHERE timetableitem.offeringid = @offeringid;
END;

SELECT * FROM courselocation;
select * from course;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetUnitClusterResults]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetUnitClusterResults] (@studentid INT)
AS
BEGIN
SELECT
DISTINCT
student.studentid,
CONCAT(student.firstname, ' ', student.surname) AS [name],
course.courseid,
course.coursename,
unitcluster.clusterid,
unitcluster.clustername,
unitclusterresult.result
FROM enrolment
JOIN student
ON enrolment.studentid = student.studentid
JOIN offering
ON offering.offeringid = enrolment.offeringid
JOIN course
ON course.courseid = offering.courseid
JOIN courseunitcluster
ON courseunitcluster.courseid = course.courseid
JOIN unitcluster
ON unitcluster.clusterid = courseunitcluster.clusterid
JOIN unitclusterresult
ON unitclusterresult.clusterid = unitcluster.clusterid
AND enrolment.studentid = @studentid;
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetUnitClustersForCourse]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetUnitClustersForCourse] (@courseid INT)
AS
BEGIN
SELECT DISTINCT 
unitcluster.*
FROM unitcluster 
JOIN courseunitcluster 
on unitcluster.clusterid = courseunitcluster.clusterid
WHERE courseunitcluster.courseid = @courseid;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_GetUnitDetails]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetUnitDetails] (@unitid INT, @description VARCHAR(300) OUT, @unitname VARCHAR(30) OUT, @cost MONEY OUT, @type VARCHAR(20) OUT)
AS
BEGIN
SELECT @unitname = unit.unitname FROM unit WHERE unit.unitid = @unitid;
SELECT @description = unit.description FROM unit WHERE unit.unitid = @unitid;
SELECT @cost = unit.cost FROM unit WHERE unit.unitid = @unitid;
SELECT @type = unit.type FROM unit WHERE unit.unitid = @unitid;
END;

--DROP PROCEDURE tsp_GetAssessmentDetails;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetUnitResults]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetUnitResults] (@studentid INT)
AS
BEGIN
SELECT
DISTINCT
student.studentid,
CONCAT(student.firstname, ' ', student.surname) AS [name],
course.courseid,
course.coursename,
unit.unitid,
unit.unitname,
unitresult.result
FROM enrolment
JOIN student
ON enrolment.studentid = student.studentid
JOIN offering
ON offering.offeringid = enrolment.offeringid
JOIN course
ON course.courseid = offering.courseid
JOIN courseunitcluster
ON courseunitcluster.courseid = course.courseid
JOIN unitcluster
ON unitcluster.clusterid = courseunitcluster.clusterid
JOIN unitclusterunit
ON unitclusterunit.clusterid = unitcluster.clusterid
JOIN unit
ON unit.unitid = unitclusterunit.unitid
JOIN unitresult
ON unitresult.unitid = unit.unitid
AND enrolment.studentid = @studentid
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_GetUnitsForUnitCluster]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_GetUnitsForUnitCluster] (@clusterid INT)
AS
BEGIN
SELECT DISTINCT
unit.*
FROM unit 
JOIN unitclusterunit
ON unitclusterunit.unitid = unit.unitid
WHERE unitclusterunit.clusterid = @clusterid;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_RemoveAssessment]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_RemoveAssessment] (@assessmentid INT) 
AS
BEGIN
DELETE FROM assessment WHERE assessment.assessmentid = @assessmentid;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_RemoveCluster]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_RemoveCluster] (@clusterid INT) 
AS
BEGIN
DELETE FROM unitcluster WHERE unitcluster.clusterid = @clusterid;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_RemoveCourse]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_RemoveCourse] (@courseid INT) 
AS
BEGIN
DELETE FROM course WHERE course.courseid = @courseid;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_RemoveEnrolment]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE
[dbo].[tsp_RemoveEnrolment] (@enrolmentid INT)
AS
BEGIN
DELETE FROM enrolment WHERE enrolment.enrolmentid = @enrolmentid;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_RemoveLocation]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE
[dbo].[tsp_RemoveLocation] (@locationname VARCHAR(80))
AS
BEGIN
DELETE FROM [location] WHERE [location].locationname = @locationname;
END;


GO
/****** Object:  StoredProcedure [dbo].[tsp_RemoveOffering]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE
[dbo].[tsp_RemoveOffering] (@offeringid INT)
AS
BEGIN
DELETE FROM [offering] WHERE [offering].offeringid = @offeringid;
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_RemoveResource]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE
[dbo].[tsp_RemoveResource] (@resourceid INT)
AS
BEGIN
DELETE FROM [resource] WHERE [resource].resourceid = @resourceid;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_RemoveStudent]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE
[dbo].[tsp_RemoveStudent] (@studentid INT)
AS
BEGIN
DELETE FROM student WHERE student.studentid = @studentid;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_RemoveTeacher]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE
[dbo].[tsp_RemoveTeacher] (@teacherid INT)
AS
BEGIN
DELETE FROM teacher WHERE teacher.teacherid = @teacherid;
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_RemoveTimetableItem]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE
[dbo].[tsp_RemoveTimetableItem] (@timetableid INT)
AS
BEGIN
DELETE FROM [timetableitem] WHERE [timetableitem].timetableid = @timetableid;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_RemoveUnit]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_RemoveUnit] (@unitid INT) 
AS
BEGIN
DELETE FROM unit WHERE unit.unitid = @unitid;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_SearchAllCourseLocations]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_SearchAllCourseLocations]
AS
BEGIN
SELECT courselocation.courselocationid, 
course.coursename, 
case when (course.online = 1) THEN courselocation.locationname ELSE null END AS [locationname], 
case when (course.online = 1) THEN CONCAT(location.streetaddress, ', ', location.suburb, ', ',  location.postcode, ', ', location.state) ELSE (null) END AS [address],
course.online,
course.parttime, 
course.fulltime
FROM courselocation
JOIN course
ON
course.courseid = courselocation.courseid
RIGHT JOIN location
ON location.locationname = courselocation.locationname
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_SearchForCourseLocations]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_SearchForCourseLocations] (@coursename INT, @semester INT, @locationname VARCHAR(80), @online BIT)
AS
BEGIN
SELECT DISTINCT
courselocation.courselocationid,
course.coursename,
location.locationname,
CONCAT(location.streetaddress, ', ', location.suburb, ', ', location.postcode, ', ', location.state) AS [address],
course.online,
course.parttime,
course.fulltime
FROM courselocation
LEFT JOIN course
ON courselocation.courseid = course.courseid
LEFT JOIN location
ON location.locationname = courselocation.locationname
LEFT JOIN offering
ON offering.courseid = course.courseid
AND
course.coursename = COALESCE(course.coursename, course.coursename)
AND location.locationname = COALESCE(@locationname, location.locationname)
AND course.online = @online
AND offering.semester = COALESCE(@semester, offering.semester);
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_SearchOnCampusCourses]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_SearchOnCampusCourses] (@locationname VARCHAR(100), @coursename VARCHAR(100))
AS
BEGIN
SELECT courselocation.courselocationid, 
course.coursename, 
courselocation.locationname, 
CONCAT(location.streetaddress, ', ', location.suburb, ', ',  location.postcode, ', ', location.state) AS [address],
course.online,
course.parttime, 
course.fulltime
FROM courselocation
JOIN course
ON
course.courseid = courselocation.courseid
RIGHT JOIN location
ON location.locationname = courselocation.locationname
AND location.locationname = @locationname
AND course.coursename = COALESCE(@coursename, course.coursename);
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_SearchOnlineCourses]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_SearchOnlineCourses] (@coursename VARCHAR(100))
AS
BEGIN
SELECT courselocation.courselocationid, 
course.coursename, 
null AS [locationname], 
null AS [address],
course.online,
course.parttime, 
course.fulltime
FROM courselocation
JOIN course
ON
course.courseid = courselocation.courseid
RIGHT JOIN location
ON location.locationname = courselocation.locationname
AND courselocation.locationname = null
AND course.coursename = COALESCE(@coursename, course.coursename);
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_SearchTeachersWithBasedLocationFilter]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_SearchTeachersWithBasedLocationFilter] (@firstname VARCHAR(100), @surname VARCHAR(100), @locationname VARCHAR(100), @employmenttype VARCHAR(20), @semester TINYINT) 
AS
BEGIN

SELECT 
teacher.teacherid,  
teacher.locationname,
CONCAT(teacher.firstname, ' ', teacher.surname) AS [name], 
teacher.email, 
teacher.mobile, 
CONCAT(teacher.streetaddress, ', ', teacher.suburb, ', ', teacher.postcode, ', ', teacher.[state]) AS [address], 
teacher.employmenttype
FROM teacher 
LEFT JOIN timetableitem 
ON timetableitem.teacherid = teacher.teacherid
LEFT JOIN courseunitcluster 
ON timetableitem.courseunitclusterid = courseunitcluster.courseunitclusterid
LEFT JOIN course 
ON course.courseid = courseunitcluster.courseid
LEFT JOIN offering
ON offering.courseid = course.courseid
AND
teacher.firstname = COALESCE(@firstname, teacher.firstname) 
AND teacher.surname = COALESCE(@surname, teacher.surname) 
AND teacher.employmenttype = COALESCE(@employmenttype, teacher.employmenttype)
AND offering.semester = COALESCE(@semester, offering.semester)
AND teacher.locationname = @locationname;
END;


GO
/****** Object:  StoredProcedure [dbo].[tsp_SearchTeachersWithNoLocationFilter]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_SearchTeachersWithNoLocationFilter] (@firstname VARCHAR(100), @surname VARCHAR(100), @employmenttype VARCHAR(20), @semester TINYINT) 
AS
BEGIN

SELECT DISTINCT 
teacher.teacherid,  
teacher.locationname,
CONCAT(teacher.firstname, ' ', teacher.surname) AS [name], 
teacher.email, 
teacher.mobile, 
CONCAT(teacher.streetaddress, ', ', teacher.suburb, ', ', teacher.postcode, ', ', teacher.[state]) AS [address], 
teacher.employmenttype 
FROM teacher 
LEFT JOIN timetableitem 
ON timetableitem.teacherid = teacher.teacherid
LEFT JOIN courseunitcluster 
ON timetableitem.courseunitclusterid = courseunitcluster.courseunitclusterid
LEFT JOIN course 
ON course.courseid = courseunitcluster.courseid
LEFT JOIN offering
ON offering.courseid = course.courseid
AND teacher.firstname = COALESCE(@firstname, teacher.firstname) 
AND teacher.surname = COALESCE(@surname, teacher.surname) 
AND teacher.employmenttype = COALESCE(@employmenttype, teacher.employmenttype)
AND offering.semester = COALESCE(@semester, offering.semester);

END;


GO
/****** Object:  StoredProcedure [dbo].[tsp_ShowAllPreviousCoursesForTeacher]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_ShowAllPreviousCoursesForTeacher](@teacherid INT)
AS
BEGIN
SELECT 
timetableitem.teacherid, 
CONCAT(teacher.firstname, ' ', teacher.surname) AS [name], 
offering.startdate, 
offering.enddate, 
offering.semester,
offering.[year],
offering.locationname, 
course.courseid, 
course.coursename 
from course 
join courseunitcluster 
on course.courseid = courseunitclusterid 
join timetableitem
on courseunitcluster.courseunitclusterid = timetableitem.courseunitclusterid 
join offering
ON offering.courseid = course.courseid
join enrolment
ON enrolment.offeringid = offering.offeringid
join teacher 
on timetableitem.teacherid = teacher.teacherid 
AND teacher.teacherid = @teacherid AND enrolment.enrolmentstatus != 'In Progress' 
ORDER BY timetableitem.teacherid, offering.startdate;
END;


GO
/****** Object:  StoredProcedure [dbo].[tsp_UpdateAssessmentDetails]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE 
[dbo].[tsp_UpdateAssessmentDetails] (@assessmentid INT, @assessmenttitle VARCHAR(30), @filename VARCHAR(100), @type VARCHAR(15), @description VARCHAR(300))
AS
BEGIN
UPDATE assessment 
SET assessment.assessmenttitle = @assessmenttitle, 
assessment.[filename] = @filename, 
assessment.[type] = @type,
assessment.[description] = @description
WHERE assessment.assessmentid = @assessmentid;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_UpdateAssessmentDueDate]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_UpdateAssessmentDueDate](@assessmenttitle VARCHAR(150), @duedate DATE, @teacherID INT)
AS
BEGIN
UPDATE assessmentsubmission SET duedate = @duedate 
FROM assessmentsubmission 
JOIN assessment
ON assessment.assessmentid = assessmentsubmission.assessmentid
AND assessment.assessmenttitle = @assessmenttitle
AND assessmentsubmission.teachermarkingid = @teacherID
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_UpdateAssessmentEvent]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_UpdateAssessmentEvent] (@offeringid INT, @assessmentid INT, @duedate DATE, @teachermarkingid INT)
AS
BEGIN
UPDATE assessmentsubmission 
SET
assessmentsubmission.assessmentid = @assessmentid,
assessmentsubmission.duedate = @duedate,
assessmentsubmission.teachermarkingid = @teachermarkingid
FROM
enrolment
JOIN offering
ON enrolment.offeringid = offering.offeringid
JOIN course
ON offering.courseid = course.courseid
JOIN courseunitcluster
ON courseunitcluster.courseid = course.courseid
JOIN unitclusterunit
ON unitclusterunit.clusterid = courseunitcluster.clusterid
JOIN assessmentunit
ON assessmentunit.unitid = unitclusterunit.unitid
JOIN assessment
ON assessment.assessmentid = assessmentunit.assessmentid
JOIN assessmentsubmission
ON assessmentsubmission.assessmentid = assessment.assessmentid
AND assessment.assessmentid = @assessmentid
AND offering.offeringid = @offeringid
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_UpdateClusterDetails]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE 
[dbo].[tsp_UpdateClusterDetails] (@clusterid INT, @clustername VARCHAR(30), @description VARCHAR(300), @cost MONEY)
AS
BEGIN
UPDATE unitcluster 
SET unitcluster.clustername = @clustername, 
unitcluster.description = @description,
unitcluster.cost = @cost WHERE unitcluster.clusterid = @clusterid;
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_UpdateCourseDetails]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE 
[dbo].[tsp_UpdateCourseDetails] (@courseid INT, @description VARCHAR(300), @coursename VARCHAR(30), @cost MONEY, @parttime BIT, @fulltime BIT, @online BIT, @aqflevel TINYINT, @semester1 BIT, @semester2 BIT)
AS
BEGIN
UPDATE course 
SET course.coursename = @coursename, 
course.description = @description,
course.cost = convert(varchar(30), course.cost, 0),
course.parttime = @parttime, 
course.fulltime = @fulltime, 
course.[online] = @online, 
course.AQFlevel = @aqflevel, 
course.semester1 = @semester1, 
course.semester2 = @semester2 
WHERE course.courseid = @courseid;
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_UpdateEnrolmentDetails]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_UpdateEnrolmentDetails] (@enrolmentid INT, @studentid INT, @offeringid INT, @paymentmethod VARCHAR(20), @amountpaid MONEY, @result VARCHAR(15))
AS
BEGIN
DECLARE @amountoutstanding MONEY;
SET @amountoutstanding = ((SELECT cost FROM course WHERE course.courseid = (SELECT offering.courseid FROM offering WHERE offering.offeringid = @offeringid)) - @amountpaid);
DECLARE @enrolmentstatus VARCHAR(10);
SET @enrolmentstatus = CASE WHEN @amountoutstanding = 0 THEN 'Enrolled' ELSE 'In Progress' END;
UPDATE enrolment 
SET 
studentid = @studentid, 
offeringid = @offeringid,
paymentmethod = @paymentmethod, 
amountpaid = @amountpaid, 
amountoutstanding = @amountoutstanding, 
enrolmentdate = (CASE WHEN @amountoutstanding <= 0 THEN (SELECT GETDATE() AS DATE) ELSE NULL END),
enrolmentstatus = (CASE WHEN @amountoutstanding <= 0 THEN 'Enrolled' ELSE 'In Progress' END)
WHERE enrolment.enrolmentid = @enrolmentid;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_UpdateLocationDetails]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE 
[dbo].[tsp_UpdateLocationDetails] (@locationname VARCHAR(50), @streetaddress VARCHAR(50), @suburb VARCHAR(30), @state VARCHAR(10), @postcode CHAR(4))
AS
BEGIN
UPDATE [location] SET [location].streetaddress = @streetaddress, [location].suburb = @suburb, [location].postcode = @postcode, [location].[state] = @state WHERE [location].locationname = @locationname;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_UpdateOfferingDetails]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE 
[dbo].[tsp_UpdateOfferingDetails] (@offeringid INT, @locationname VARCHAR(80), @courseid INT, @semester SMALLINT, @startdate DATE, @enddate DATE, @offeringtype VARCHAR(15))
AS
BEGIN
UPDATE [offering] SET locationname = @locationname, courseid = @courseid, semester = @semester, [year] = (SELECT YEAR(@startdate) AS DATE), startdate = @startdate, enddate = @enddate, offeringtype = @offeringtype  WHERE offering.offeringid = @offeringid;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_UpdateResourceDetails]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_UpdateResourceDetails] (@resourceid INT, @resourcetitle VARCHAR(30), @resourcefilename VARCHAR(100), @authorid INT, @courseunitclusterid INT)
AS
BEGIN
UPDATE resource SET resource.courseunitclusterid =  @courseunitclusterid, resource.resourcetitle = @resourcetitle, resource.[resourcefilename] = @resourcefilename, resource.authorID = @authorid WHERE resource.resourceid = @resourceid;
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_UpdateStudentDetails]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_UpdateStudentDetails] (@studentid VARCHAR(100), @password VARCHAR(255), @salt VARCHAR(255), @firstname VARCHAR(30), @surname VARCHAR(30), @email VARCHAR(50), @mobile CHAR(10), @streetaddress VARCHAR(50), @suburb VARCHAR(30), @state VARCHAR(10), @postcode CHAR(4))
AS
BEGIN
UPDATE student 
SET student.[password] = @password,
student.salt = @salt,
student.firstname = @firstname, 
student.surname = @surname, 
student.email = @email, 
student.mobile = @mobile, 
student.streetaddress = @streetaddress, 
student.suburb = @suburb, 
student.postcode = @postcode, 
student.[state] = @state 
WHERE student.studentid = @studentid;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_UpdateStudentSubmission]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE
[dbo].[tsp_UpdateStudentSubmission] (@assessmentid INT, @studentid INT, @submissionfilename VARCHAR(100))
AS
BEGIN
UPDATE assessmentsubmission 
SET submissionfilename = @submissionfilename, 
completiondate = GETDATE(),
result = 'Submitted'
WHERE assessmentid = @assessmentid AND studentid = @studentid;
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_UpdateSubmissionDetails]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_UpdateSubmissionDetails] (@studentid INT, @submissionid INT, @assessmenttitle VARCHAR(100), @submissionfilename VARCHAR(100), @duedate DATE, @teachermarkingid INT, @result VARCHAR(20), @comments VARCHAR(300))
AS
BEGIN
DECLARE @assessmentid INT;
SET @assessmentid = (SELECT assessment.assessmentid FROM assessment WHERE assessment.assessmenttitle = @assessmenttitle);
UPDATE assessmentsubmission 
SET 
assessmentsubmission.studentid = @studentid,
assessmentsubmission.assessmentid = @assessmentid, 
assessmentsubmission.submissionfilename = @submissionfilename, 
assessmentsubmission.completiondate = (CASE WHEN @result = 'Satisfactory' THEN (GETDATE()) ELSE null END), 
assessmentsubmission.duedate = @duedate, 
assessmentsubmission.teachermarkingid = @teachermarkingid, 
assessmentsubmission.result = @result, 
assessmentsubmission.comments = @comments;
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_UpdateSubmissionResult]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_UpdateSubmissionResult] (@submissionid INT, @teachermarkingid INT, @result VARCHAR(20), @comments VARCHAR(300))
AS
BEGIN
UPDATE assessmentsubmission 
SET 
assessmentsubmission.completiondate = (CASE WHEN @result = 'Unsubmitted' OR @result = 'Submitted' THEN null ELSE assessmentsubmission.completiondate END), 
assessmentsubmission.teachermarkingid = @teachermarkingid, 
assessmentsubmission.result = @result, 
assessmentsubmission.comments = @comments
WHERE assessmentsubmission.submissionid = @submissionid
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_UpdateTeacherDetails]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_UpdateTeacherDetails] (@locationname VARCHAR(50), @teacherid VARCHAR(100), @password VARCHAR(255), @salt VARCHAR(255), @firstname VARCHAR(30), @surname VARCHAR(30), @email VARCHAR(50), @mobile CHAR(10), @streetaddress VARCHAR(50), @suburb VARCHAR(30), @state VARCHAR(10), @postcode CHAR(4), @employmenttype VARCHAR(15))
AS
BEGIN
UPDATE teacher 
SET teacher.locationname = @locationname, 
teacher.[password] = @password, 
teacher.salt = @salt,
teacher.firstname = @firstname, 
teacher.surname = @surname, 
teacher.email = @email, 
teacher.mobile = @mobile, 
teacher.streetaddress = @streetaddress, 
teacher.suburb = @suburb, 
teacher.postcode = @postcode, 
teacher.[state] = @state, 
teacher.employmenttype = @employmenttype 
WHERE teacher.teacherid = @teacherid;
END;

GO
/****** Object:  StoredProcedure [dbo].[tsp_UpdateTimetableItemDetails]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_UpdateTimetableItemDetails] (@timetableid INT, @offeringid INT, @courseunitclusterid INT, @teacherid INT, @building VARCHAR(10), @room VARCHAR(10), @starttime TIME(7), @endtime TIME(7), @dayrunning VARCHAR(10)) 
AS
BEGIN
UPDATE timetableitem SET 
offeringid = @offeringid,
courseunitclusterid = @courseunitclusterid, 
teacherid = @teacherid, 
building = @building, 
room = @room, 
starttime = @starttime, 
endtime = @endtime, 
dayrunning = @dayrunning
WHERE timetableitem.timetableid = @timetableid;
END;


GO
/****** Object:  StoredProcedure [dbo].[tsp_UpdateUnitDetails]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE 
[dbo].[tsp_UpdateUnitDetails] (@unitid INT, @unitname VARCHAR(30), @type VARCHAR(20), @description VARCHAR(300),  @cost MONEY)
AS
BEGIN
UPDATE unit 
SET unit.unitname = @unitname, 
unit.cost = @cost, 
unit.description = @description,
unit.type = @type
WHERE unit.unitid = @unitid;
END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_ValidateEnrolment]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_ValidateEnrolment](@studentid INT, @offeringid INT, @enrolmentValidationResult VARCHAR(100) OUT)
AS
BEGIN

SET @enrolmentValidationResult = 'There was an issue adding enrolment, a student can only be enrolled into two courses in the same semester at the same location';

DECLARE @enrolmentcount TINYINT;
SET @enrolmentcount = (SELECT COUNT(*) AS enrolments FROM enrolment where enrolment.offeringid = @offeringid AND enrolment.studentid = @studentid);
SELECT * FROM OFFERING;

if(@enrolmentcount < 1) 
BEGIN

SET @enrolmentValidationResult = 'Validated';
RETURN; 

END;

if(@enrolmentcount = 1)

BEGIN


DECLARE @previousoffering INT;
SET @previousoffering = (SELECT offering.offeringid FROM offering join enrolment ON enrolment.offeringid = offering.offeringid WHERE enrolment.studentid = @studentid);

if (@previousoffering != @offeringid)
BEGIN

DECLARE @currentSemester INT;
SET @currentSemester = (SELECT offering.semester FROM offering where offering.offeringid = @offeringid);

DECLARE @previousSemester INT;
SET @previousSemester = (SELECT offering.semester FROM offering where offering.offeringid = @previousoffering);

if (@currentSemester = @previousSemester) 
BEGIN
SET @enrolmentValidationResult = 'Validated';
END;

ELSE 
BEGIN
SET @enrolmentValidationResult = 'Student already enroled in offering';
END;

END;

END;

DECLARE @courseid INT;
SET @courseid = (SELECT offering.courseid FROM offering WHERE offering.offeringid = @offeringid);

DECLARE @locationname VARCHAR(80);
SET @locationname = (SELECT offering.locationname FROM offering WHERE offering.offeringid = @offeringid);

SET @enrolmentValidationResult = CASE WHEN (SELECT COUNT(*) FROM student WHERE student.studentid = @studentid) = 0 THEN 'Student ID is invalid' ELSE @enrolmentValidationResult END;
SET @enrolmentValidationResult = CASE WHEN (SELECT COUNT(*) FROM course WHERE course.courseid = @courseid) = 0 THEN 'Course ID is invalid' ELSE @enrolmentValidationResult END;
SET @enrolmentValidationResult = CASE WHEN (SELECT COUNT(*) FROM [location] WHERE location.locationname = @locationname) = 0 THEN 'Location Name is invalid' ELSE @enrolmentValidationResult END;

END;
GO
/****** Object:  StoredProcedure [dbo].[tsp_VerifyPassword]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tsp_VerifyPassword](@id INT, @password VARCHAR(255), @completed INT OUT)
AS
BEGIN

SET @completed = 0;

if ((SELECT count(*) FROM student WHERE student.studentid = @id AND student.password = @password) > 0)
BEGIN
SET @completed = 1;
END;

if ((SELECT count(*) FROM teacher WHERE teacher.teacherid = @id AND teacher.password = @password) > 0)
BEGIN

if((SELECT teacher.admin FROM teacher WHERE teacher.teacherid = @id) = 1)
BEGIN
SET @completed = 3;
END;
ELSE 
BEGIN
SET @completed = 2;
END;

END;

END;
GO
/****** Object:  Trigger [dbo].[TTR_AssessmentSubmissionUpdated]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TTR_AssessmentSubmissionUpdated]
ON [dbo].[assessmentsubmission]
AFTER UPDATE
AS
BEGIN
SET NOCOUNT ON;

if UPDATE(result)
BEGIN 

if((SELECT a.result from inserted as a) =  'Satisfactory')
BEGIN

--Find all units that belong to the updated assessment
SELECT * INTO #allunitsforassessment 
FROM (
	SELECT assessmentunit.unitid 
	FROM assessmentunit 
	WHERE assessmentunit.assessmentid = (
										SELECT s.assessmentid FROM inserted as [s]
										)
	) 
as [test];

--Find all assessments for all the found units
SELECT * INTO #allassessmentsforfoundunits 
FROM (
	SELECT DISTINCT assessmentunit.assessmentid 
	FROM assessmentunit 
	JOIN #allunitsforassessment 
	ON #allunitsforassessment.unitid = assessmentunit.unitid
	) 
as [test2];

--Get the students result for found assessments
SELECT * INTO #otherassessmentresults 
FROM (
	SELECT assessmentsubmission.assessmentid, assessmentsubmission.result, assessmentunit.unitid 
	FROM #allassessmentsforfoundunits 
	JOIN assessmentsubmission 
	ON #allassessmentsforfoundunits.assessmentid = assessmentsubmission.assessmentid 
	JOIN assessmentunit 
	ON  #allassessmentsforfoundunits.assessmentid = assessmentunit.assessmentid 
	AND assessmentsubmission.studentid = (
										 SELECT s.studentid from inserted as s
										 )
	) 
as [test3];

--Get any unit that has any non satisfactory assessments from found assessments
SELECT * INTO #unitswithnonsatisfactoryassessments 
FROM (
	SELECT #otherassessmentresults.unitid 
	FROM #otherassessmentresults 
	WHERE #otherassessmentresults.result != 'Satisfactory' 
	) 
AS [test4];

--Select any unit that has no nonsatisfactory assessments
SELECT * INTO #unitswithnononsatisfactoryassessments 
FROM (
	SELECT #allunitsforassessment.unitid 
	FROM #unitswithnonsatisfactoryassessments  RIGHT JOIN #allunitsforassessment 
	ON #unitswithnonsatisfactoryassessments.unitid = #allunitsforassessment.unitid 
	AND #unitswithnonsatisfactoryassessments.unitid IS NULL
	)
AS [test5]

--UPDATE ANY UNITS TO SATISFACTORY WHERE THERE ARE NO NONSATISFACTORY ASSESSMENTS
UPDATE unitresult SET unitresult.result = 'Satisfactory' FROM unitresult JOIN #unitswithnononsatisfactoryassessments ON #unitswithnononsatisfactoryassessments.unitid = unitresult.unitid AND unitresult.unitid IN (#unitswithnononsatisfactoryassessments.unitid) AND unitresult.studentid = (SELECT c.studentid FROM inserted as c);



END;
END;
END;
GO
ALTER TABLE [dbo].[assessmentsubmission] ENABLE TRIGGER [TTR_AssessmentSubmissionUpdated]
GO
/****** Object:  Trigger [dbo].[TTR_ClusterResultUpdated]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TTR_ClusterResultUpdated]
ON [dbo].[unitclusterresult]
AFTER UPDATE
AS
BEGIN
SET NOCOUNT ON;

if UPDATE(result)
BEGIN 

if((SELECT a.result from inserted as a) =  'Satisfactory')
BEGIN


--Find all courses that belong to the updated cluster
SELECT * INTO #allcoursesforcluster
FROM (
	SELECT courseunitcluster.courseid
	FROM courseunitcluster
	WHERE courseunitcluster.clusterid = (
										SELECT s.clusterid FROM inserted as [s]
										)
	) 
as [test];

--Find all clusters for all the found courses
SELECT * INTO #allclustersforfoundcourses
FROM (
	SELECT DISTINCT courseunitcluster.clusterid
	FROM courseunitcluster
	JOIN #allcoursesforcluster 
	ON #allcoursesforcluster.courseid = courseunitcluster.courseid
	) 
as [test2];

--Get the student's result for found clusters
SELECT * INTO #otherclusterresults 
FROM (
	SELECT unitclusterresult.clusterid, unitclusterresult.result, courseunitcluster.courseid
	FROM #allclustersforfoundcourses 
	JOIN unitclusterresult
	ON #allclustersforfoundcourses.clusterid = unitclusterresult.clusterid
	JOIN courseunitcluster
	ON  #allclustersforfoundcourses.clusterid = courseunitcluster.clusterid
	AND unitclusterresult.studentid = (
										 SELECT s.studentid from inserted as s
										 )
	) 
as [test3];

--Get any course that has any non satisfactory clusters from found clusters
SELECT * INTO #courseswithnonsatisfactoryclusters
FROM (
	SELECT #otherclusterresults.courseid
	FROM #otherclusterresults 
	WHERE #otherclusterresults.result != 'Satisfactory' 
	) 
AS [test4];

--Select any unit that has no nonsatisfactory assessments
SELECT * INTO #courseswithnononsatisfactoryclusters 
FROM (
	SELECT #allcoursesforcluster.courseid
	FROM #courseswithnonsatisfactoryclusters  RIGHT JOIN #allcoursesforcluster
	ON #courseswithnonsatisfactoryclusters.courseid = #allcoursesforcluster.courseid
	AND #courseswithnonsatisfactoryclusters.courseid IS NULL
	)
AS [test5]


SELECT * INTO #satisfactoryenrolments 
FROM (
	SELECT enrolment.enrolmentid
	FROM enrolment 
	JOIN offering 
	ON offering.offeringid = enrolment.offeringid 
	RIGHT JOIN #courseswithnononsatisfactoryclusters 
	ON #courseswithnononsatisfactoryclusters.courseid = offering.courseid
	AND enrolment.studentid = (SELECT c.studentid FROM inserted as c)
	)
AS [test6]

--UPDATE ANY UNITS TO SATISFACTORY WHERE THERE ARE NO NONSATISFACTORY ASSESSMENTS
UPDATE enrolment 
SET enrolmentstatus = 'Satisfactory' 
FROM enrolment 
JOIN offering 
ON enrolment.offeringid = offering.offeringid 
JOIN #courseswithnononsatisfactoryclusters 
ON #courseswithnononsatisfactoryclusters.courseid = offering.courseid 
AND offering.courseid IN (#courseswithnononsatisfactoryclusters.courseid) 
AND enrolment.studentid = (SELECT c.studentid FROM inserted as c);

END;
END;
END;
GO
ALTER TABLE [dbo].[unitclusterresult] ENABLE TRIGGER [TTR_ClusterResultUpdated]
GO
/****** Object:  Trigger [dbo].[TTR_UnitResultUpdated]    Script Date: 25/11/2021 12:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TTR_UnitResultUpdated]
ON [dbo].[unitresult]
AFTER UPDATE
AS
BEGIN
SET NOCOUNT ON;

if UPDATE(result)
BEGIN 

if((SELECT a.result from inserted as a) =  'Satisfactory')
BEGIN


--Find all clusters that belong to the updated unit
SELECT * INTO #allclustersforunit
FROM (
	SELECT unitclusterunit.clusterid
	FROM unitclusterunit
	WHERE unitclusterunit.unitid = (
										SELECT s.unitid FROM inserted as [s]
										)
	) 
as [test];

--Find all units for all the found clusters
SELECT * INTO #allunitsforfoundclusters 
FROM (
	SELECT DISTINCT unitclusterunit.unitid
	FROM unitclusterunit
	JOIN #allclustersforunit 
	ON #allclustersforunit.clusterid = unitclusterunit.clusterid
	) 
as [test2];

--Get the students result for found units
SELECT * INTO #otherunitresults 
FROM (
	SELECT unitresult.unitid, unitresult.result, unitclusterunit.clusterid 
	FROM #allunitsforfoundclusters 
	JOIN unitresult
	ON #allunitsforfoundclusters.unitid = unitresult.unitid 
	JOIN unitclusterunit
	ON  #allunitsforfoundclusters.unitid = unitclusterunit.unitid
	AND unitresult.studentid = (
										 SELECT s.studentid from inserted as s
										 )
	) 
as [test3];

--Get any cluster that has any non satisfactory units from found units
SELECT * INTO #clusterswithnonsatisfactoryunits
FROM (
	SELECT #otherunitresults.clusterid
	FROM #otherunitresults 
	WHERE #otherunitresults.result != 'Satisfactory' 
	) 
AS [test4];

--Select any cluster that has no nonsatisfactory units
SELECT * INTO #clusterswithnononsatisfactoryunits 
FROM (
	SELECT #allclustersforunit.clusterid
	FROM #clusterswithnonsatisfactoryunits  
	RIGHT JOIN #allclustersforunit
	ON #clusterswithnonsatisfactoryunits.clusterid = #allclustersforunit.clusterid
	AND #clusterswithnonsatisfactoryunits.clusterid IS NULL
	)
AS [test5]

--UPDATE ANY CLUSTERS TO SATISFACTORY WHERE THERE ARE NO NONSATISFACTORY UNITS
UPDATE unitclusterresult SET unitclusterresult.result = 'Satisfactory' FROM unitclusterresult JOIN #clusterswithnononsatisfactoryunits ON #clusterswithnononsatisfactoryunits.clusterid = unitclusterresult.clusterid AND unitclusterresult.clusterid IN (#clusterswithnononsatisfactoryunits.clusterid) AND unitclusterresult.studentid = (SELECT c.studentid FROM inserted as c);


END;
END;
END;

GO
ALTER TABLE [dbo].[unitresult] ENABLE TRIGGER [TTR_UnitResultUpdated]
GO
USE [master]
GO
ALTER DATABASE [tafesystem] SET  READ_WRITE 
GO
