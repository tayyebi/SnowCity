using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class App_Errors_Database : WebsitePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CheckDatabaseHealth_Click(object sender, EventArgs e)
    {

        try
        {
            #region create database part 1
            SqlConnection databasecon = new SqlConnection();
            databasecon.ConnectionString = ConfigurationManager.ConnectionStrings["MasterConnectionString"].ConnectionString;
            databasecon.Open();
            #endregion
            #region create database code
           var databasecom = new SqlCommand(@"
USE [master]
 

/****** Object:  Database [snowcity_DefaultDatabase]    Script Date: 7/11/2013 10:15:50 AM ******/
CREATE DATABASE [snowcity_DefaultDatabase] ON  PRIMARY 
( NAME = N'snowcity_DefaultDatabase', FILENAME = N'D:\snowcity_DefaultDatabase.mdf' , SIZE = 4352KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
LOG ON 
( NAME = N'snowcity_DefaultDatabase_log', FILENAME = N'D:\snowcity_DefaultDatabase_log.LDF' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 

ALTER DATABASE [snowcity_DefaultDatabase] SET COMPATIBILITY_LEVEL = 100
 

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [snowcity_DefaultDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
 

ALTER DATABASE [snowcity_DefaultDatabase] SET ANSI_NULL_DEFAULT OFF 
 

ALTER DATABASE [snowcity_DefaultDatabase] SET ANSI_NULLS OFF 
 

ALTER DATABASE [snowcity_DefaultDatabase] SET ANSI_PADDING OFF 
 

ALTER DATABASE [snowcity_DefaultDatabase] SET ANSI_WARNINGS OFF 
 

ALTER DATABASE [snowcity_DefaultDatabase] SET ARITHABORT OFF 
 

ALTER DATABASE [snowcity_DefaultDatabase] SET AUTO_CLOSE ON 
 

ALTER DATABASE [snowcity_DefaultDatabase] SET AUTO_CREATE_STATISTICS ON 
 

ALTER DATABASE [snowcity_DefaultDatabase] SET AUTO_SHRINK OFF 
 

ALTER DATABASE [snowcity_DefaultDatabase] SET AUTO_UPDATE_STATISTICS ON 
 

ALTER DATABASE [snowcity_DefaultDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
 

ALTER DATABASE [snowcity_DefaultDatabase] SET CURSOR_DEFAULT  GLOBAL 
 

ALTER DATABASE [snowcity_DefaultDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
 

ALTER DATABASE [snowcity_DefaultDatabase] SET NUMERIC_ROUNDABORT OFF 
 

ALTER DATABASE [snowcity_DefaultDatabase] SET QUOTED_IDENTIFIER OFF 
 

ALTER DATABASE [snowcity_DefaultDatabase] SET RECURSIVE_TRIGGERS OFF 
 

ALTER DATABASE [snowcity_DefaultDatabase] SET  ENABLE_BROKER 
 

ALTER DATABASE [snowcity_DefaultDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
 

ALTER DATABASE [snowcity_DefaultDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
 

ALTER DATABASE [snowcity_DefaultDatabase] SET TRUSTWORTHY OFF 
 

ALTER DATABASE [snowcity_DefaultDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
 

ALTER DATABASE [snowcity_DefaultDatabase] SET PARAMETERIZATION SIMPLE 
 

ALTER DATABASE [snowcity_DefaultDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
 

ALTER DATABASE [snowcity_DefaultDatabase] SET HONOR_BROKER_PRIORITY OFF 
 

ALTER DATABASE [snowcity_DefaultDatabase] SET RECOVERY SIMPLE 
 

ALTER DATABASE [snowcity_DefaultDatabase] SET  MULTI_USER 
 

ALTER DATABASE [snowcity_DefaultDatabase] SET PAGE_VERIFY CHECKSUM  
 

ALTER DATABASE [snowcity_DefaultDatabase] SET DB_CHAINING OFF 
 

ALTER DATABASE [snowcity_DefaultDatabase] SET  READ_WRITE 
 




", databasecon);
            #endregion
            #region create datebase part 2
            databasecom.ExecuteNonQuery();
            databasecon.Close();

            #endregion
        }
        catch { }
            #region create tables part 1

            SqlConnection tablecon = new SqlConnection();
            tablecon.ConnectionString = ConfigurationManager.ConnectionStrings["MasterConnectionString"].ConnectionString;
            tablecon.Open();
            #endregion
            #region create tables code
            var tablecom = new SqlCommand(@"
USE [snowcity_DefaultDatabase]
 
/****** Object:  Table [dbo].[Adverties-Classic]    Script Date: 7/11/2013 10:20:33 AM ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[Adverties-Classic](
	[AdvertiesID] [int] IDENTITY(1,1) NOT NULL,
	[AdvertiesName] [nvarchar](3999) NOT NULL,
	[AdvertiesFinalCode] [ntext] NOT NULL,
	[AdvertiesGroup] [nvarchar](3999) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdvertiesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

 
/****** Object:  Table [dbo].[Chat-BlockedWords]    Script Date: 7/11/2013 10:20:36 AM ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[Chat-BlockedWords](
	[Value] [nvarchar](399) NOT NULL,
 CONSTRAINT [PK_Chat-BlockedWords] PRIMARY KEY CLUSTERED 
(
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

 
/****** Object:  Table [dbo].[Chat-Nickname]    Script Date: 7/11/2013 10:20:36 AM ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[Chat-Nickname](
	[Nickname] [nvarchar](399) NOT NULL,
 CONSTRAINT [PK_Chat-Nickname_1] PRIMARY KEY CLUSTERED 
(
	[Nickname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

 
/****** Object:  Table [dbo].[Chat-Public]    Script Date: 7/11/2013 10:20:36 AM ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[Chat-Public](
	[PublicChatID] [int] NOT NULL,
	[Value] [ntext] NOT NULL,
	[Nickname] [nvarchar](399) NULL,
 CONSTRAINT [PK_Chat-Public] PRIMARY KEY CLUSTERED 
(
	[PublicChatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

 
/****** Object:  Table [dbo].[Chat-Value]    Script Date: 7/11/2013 10:20:36 AM ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[Chat-Value](
	[ChatID] [int] IDENTITY(1,1) NOT NULL,
	[ChatValue] [ntext] NOT NULL,
	[Nickname] [nvarchar](399) NOT NULL,
	[ReciverNickname] [nvarchar](3999) NOT NULL,
 CONSTRAINT [PK__Chat-Val__A9FBE6264461A332] PRIMARY KEY CLUSTERED 
(
	[ChatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

 
/****** Object:  Table [dbo].[News-Announcement]    Script Date: 7/11/2013 10:20:36 AM ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[News-Announcement](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](3999) NOT NULL,
	[Text] [ntext] NULL,
 CONSTRAINT [PK_News-Announcement] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

 
/****** Object:  Table [dbo].[News-Comment]    Script Date: 7/11/2013 10:20:36 AM ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[News-Comment](
	[NewsID] [int] NOT NULL,
	[ID] [int] NOT NULL,
	[Email] [nvarchar](3999) NOT NULL,
	[Value] [ntext] NOT NULL,
 CONSTRAINT [PK_News-Comment_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

 
/****** Object:  Table [dbo].[News-Group]    Script Date: 7/11/2013 10:20:36 AM ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[News-Group](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](3999) NOT NULL,
	[Description] [ntext] NULL,
 CONSTRAINT [PK_News-Group] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

 
/****** Object:  Table [dbo].[News-ImageLink]    Script Date: 7/11/2013 10:20:36 AM ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[News-ImageLink](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LinkURL] [nvarchar](3999) NULL,
	[ImageURL] [nvarchar](3999) NULL,
	[Description] [ntext] NULL,
	[Title] [nvarchar](3999) NULL,
	[UserID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

 
/****** Object:  Table [dbo].[News-News]    Script Date: 7/26/2013 1:12:05 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[News-News](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](399) NOT NULL,
	[Abstract] [ntext] NULL,
	[Value] [ntext] NULL,
	[UserID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
	[Date] [nvarchar](3999) NOT NULL,
	[Views] [int] NULL,
	[Hates] [int] NULL,
	[Likes] [int] NULL,
	[Source] [nvarchar](3999) NULL,
 CONSTRAINT [PK_News-News] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[Police-ChatPublic]    Script Date: 7/11/2013 10:20:36 AM ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[Police-ChatPublic](
	[ChatID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [ntext] NOT NULL,
	[Nickname] [nvarchar](399) NULL,
 CONSTRAINT [PK_Police-ChatPublic] PRIMARY KEY CLUSTERED 
(
	[ChatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

 
/****** Object:  Table [dbo].[Police-Comment]    Script Date: 7/11/2013 10:20:36 AM ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[Police-Comment](
	[NewsID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](3999) NOT NULL,
	[Value] [ntext] NOT NULL,
 CONSTRAINT [PK_Police-Comments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

 
/****** Object:  Table [dbo].[Problem]    Script Date: 7/11/2013 10:20:36 AM ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[Problem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProblemType] [nvarchar](3999) NOT NULL,
	[ProblemAdress] [nvarchar](3999) NOT NULL,
	[ProblemValue] [ntext] NOT NULL,
	[ProblemDate] [nvarchar](3999) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

 
/****** Object:  Table [dbo].[Stick]    Script Date: 7/11/2013 10:20:36 AM ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[Stick](
	[Stick] [ntext] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

 
/****** Object:  Table [dbo].[Users-Converstation]    Script Date: 7/11/2013 10:20:36 AM ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[Users-Converstation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FromFullname] [nvarchar](3999) NOT NULL,
	[FromID] [int] NOT NULL,
	[ToFullname] [nvarchar](3999) NOT NULL,
	[ToID] [int] NOT NULL,
	[Value] [ntext] NOT NULL,
	[Title] [nvarchar](3999) NOT NULL,
 CONSTRAINT [PK_Users-Converstation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

 
/****** Object:  Table [dbo].[Users-LoginDate]    Script Date: 7/11/2013 10:20:36 AM ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[Users-LoginDate](
	[UserID] [int] NOT NULL,
	[LoginDate] [nvarchar](3999) NOT NULL
) ON [PRIMARY]

 
/****** Object:  Table [dbo].[Users-MainType]    Script Date: 7/11/2013 10:20:36 AM ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[Users-MainType](
	[MainType] [nvarchar](399) NOT NULL,
	[Description] [ntext] NULL,
 CONSTRAINT [PK_Users-MainType] PRIMARY KEY CLUSTERED 
(
	[MainType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

 
/****** Object:  Table [dbo].[Users-News]    Script Date: 7/11/2013 10:20:36 AM ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[Users-News](
	[NewsID] [int] IDENTITY(1,1) NOT NULL,
	[NewsTitle] [nvarchar](3999) NOT NULL,
	[Value] [ntext] NOT NULL,
	[SenderID] [int] NOT NULL,
	[Date] [nvarchar](3999) NOT NULL,
 CONSTRAINT [PK_Users-News] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

 
/****** Object:  Table [dbo].[Users-Type]    Script Date: 7/11/2013 10:20:36 AM ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[Users-Type](
	[Type] [nvarchar](399) NOT NULL,
	[Description] [ntext] NULL,
	[MainType] [nvarchar](399) NOT NULL,
 CONSTRAINT [PK_Users-Type] PRIMARY KEY CLUSTERED 
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

 
/****** Object:  Table [dbo].[Users-Users]    Script Date: 7/11/2013 10:20:36 AM ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[Users-Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[RandomNumber] [nvarchar](3999) NOT NULL,
	[Username] [nvarchar](3999) NOT NULL,
	[Password] [nvarchar](3999) NOT NULL,
	[Fullname] [nvarchar](3999) NOT NULL,
	[Firstname] [nvarchar](3999) NOT NULL,
	[Lastname] [nvarchar](3999) NOT NULL,
	[MainType] [nvarchar](399) NULL,
	[Type] [nvarchar](399) NULL,
	[Description] [ntext] NULL,
	[ImageURL] [nvarchar](399) NULL,
	[LastLoginDate] [nvarchar](3999) NULL,
	[IsOnline] [nvarchar](3999) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

 
/****** Object:  Table [dbo].[Website-Help]    Script Date: 7/11/2013 10:20:36 AM ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[Website-Help](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](3999) NOT NULL,
	[Value] [ntext] NOT NULL,
 CONSTRAINT [PK_Website-Help] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

 
/****** Object:  Table [dbo].[Website-Rule]    Script Date: 7/11/2013 10:20:36 AM ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[Website-Rule](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](3999) NOT NULL,
	[Value] [ntext] NOT NULL,
 CONSTRAINT [PK_Website-Rule] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

 

", tablecon);
            #endregion
            #region create tables part 2
            tablecom.ExecuteNonQuery();
            tablecon.Close();
            Response.Redirect("~/App_USERS/Login.aspx");
            #endregion
    }
}
