USE [master]
GO
/****** Object:  Database [Yummy]    Script Date: 4/29/2020 4:02:50 AM ******/
CREATE DATABASE [Yummy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Yummy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Yummy.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Yummy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Yummy_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Yummy] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Yummy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Yummy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Yummy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Yummy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Yummy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Yummy] SET ARITHABORT OFF 
GO
ALTER DATABASE [Yummy] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Yummy] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Yummy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Yummy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Yummy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Yummy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Yummy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Yummy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Yummy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Yummy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Yummy] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Yummy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Yummy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Yummy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Yummy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Yummy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Yummy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Yummy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Yummy] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Yummy] SET  MULTI_USER 
GO
ALTER DATABASE [Yummy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Yummy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Yummy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Yummy] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Yummy]
GO
/****** Object:  Table [dbo].[menu]    Script Date: 4/29/2020 4:02:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[fulldescription] [nvarchar](max) NOT NULL,
	[shortdescription] [nvarchar](max) NOT NULL,
	[img] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[menu] ON 

INSERT [dbo].[menu] ([id], [name], [fulldescription], [shortdescription], [img]) VALUES (1, N'Thịt luộc', N'Với cách đơn giản để luộc thịt lợn ngon dưới đây, chắc chắn bạn sẽ có một món thịt luộc thật ngon và hấp dẫn với da giòn, thịt mềm và ngọt. Hãy áp dụng và kiểm chứng kết quả nhé. Chúc các bạn thành công món thịt lợn đơn giản này.', N'Thịt luộc kiểu này thì ăn bao nhiêu cũng không chán', N'anh.jpg')
INSERT [dbo].[menu] ([id], [name], [fulldescription], [shortdescription], [img]) VALUES (2, N'Cá rán', N'Với cách đơn giản để luộc thịt lợn ngon dưới đây, chắc chắn bạn sẽ có một món thịt luộc thật ngon và hấp dẫn với da giòn, thịt mềm và ngọt. Hãy áp dụng và kiểm chứng kết quả nhé. Chúc các bạn thành công món thịt lợn đơn giản này.', N'Thịt luộc kiểu này thì ăn bao nhiêu cũng không chán', N'anh.jpg')
INSERT [dbo].[menu] ([id], [name], [fulldescription], [shortdescription], [img]) VALUES (3, N'Rau xào', N'Với cách đơn giản để luộc thịt lợn ngon dưới đây, chắc chắn bạn sẽ có một món thịt luộc thật ngon và hấp dẫn với da giòn, thịt mềm và ngọt. Hãy áp dụng và kiểm chứng kết quả nhé. Chúc các bạn thành công món thịt lợn đơn giản này.', N'Thịt luộc kiểu này thì ăn bao nhiêu cũng không chán', N'anh.jpg')
INSERT [dbo].[menu] ([id], [name], [fulldescription], [shortdescription], [img]) VALUES (4, N'Đậu', N'Với cách đơn giản để luộc thịt lợn ngon dưới đây, chắc chắn bạn sẽ có một món thịt luộc thật ngon và hấp dẫn với da giòn, thịt mềm và ngọt. Hãy áp dụng và kiểm chứng kết quả nhé. Chúc các bạn thành công món thịt lợn đơn giản này.', N'Thịt luộc kiểu này thì ăn bao nhiêu cũng không chán', N'anh.jpg')
INSERT [dbo].[menu] ([id], [name], [fulldescription], [shortdescription], [img]) VALUES (5, N'Trứng', N'Với cách đơn giản để luộc thịt lợn ngon dưới đây, chắc chắn bạn sẽ có một món thịt luộc thật ngon và hấp dẫn với da giòn, thịt mềm và ngọt. Hãy áp dụng và kiểm chứng kết quả nhé. Chúc các bạn thành công món thịt lợn đơn giản này.', N'Thịt luộc kiểu này thì ăn bao nhiêu cũng không chán', N'anh.jpg')
INSERT [dbo].[menu] ([id], [name], [fulldescription], [shortdescription], [img]) VALUES (6, N'Gà chiên', N'Với cách đơn giản để luộc thịt lợn ngon dưới đây, chắc chắn bạn sẽ có một món thịt luộc thật ngon và hấp dẫn với da giòn, thịt mềm và ngọt. Hãy áp dụng và kiểm chứng kết quả nhé. Chúc các bạn thành công món thịt lợn đơn giản này.', N'Thịt luộc kiểu này thì ăn bao nhiêu cũng không chán', N'anh.jpg')
INSERT [dbo].[menu] ([id], [name], [fulldescription], [shortdescription], [img]) VALUES (7, N'Khoai tây', N'Với cách đơn giản để luộc thịt lợn ngon dưới đây, chắc chắn bạn sẽ có một món thịt luộc thật ngon và hấp dẫn với da giòn, thịt mềm và ngọt. Hãy áp dụng và kiểm chứng kết quả nhé. Chúc các bạn thành công món thịt lợn đơn giản này.', N'Thịt luộc kiểu này thì ăn bao nhiêu cũng không chán', N'anh.jpg')
INSERT [dbo].[menu] ([id], [name], [fulldescription], [shortdescription], [img]) VALUES (8, N'Claritas est etiam processus', N'Với cách đơn giản để luộc thịt lợn ngon dưới đây, chắc chắn bạn sẽ có một món thịt luộc thật ngon và hấp dẫn với da giòn, thịt mềm và ngọt. Hãy áp dụng và kiểm chứng kết quả nhé. Chúc các bạn thành công món thịt lợn đơn giản này.', N'Thịt luộc kiểu này thì ăn bao nhiêu cũng không chán', N'anh.jpg')
SET IDENTITY_INSERT [dbo].[menu] OFF
USE [master]
GO
ALTER DATABASE [Yummy] SET  READ_WRITE 
GO
