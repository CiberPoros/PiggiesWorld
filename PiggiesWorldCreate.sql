USE [master]
GO
/****** Object:  Database [PiggiesWorldDB]    Script Date: 10/8/2020 6:24:45 PM ******/
CREATE DATABASE [PiggiesWorldDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PiggiesWorldDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PiggiesWorldDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PiggiesWorldDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PiggiesWorldDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PiggiesWorldDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PiggiesWorldDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PiggiesWorldDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PiggiesWorldDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PiggiesWorldDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PiggiesWorldDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PiggiesWorldDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PiggiesWorldDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PiggiesWorldDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PiggiesWorldDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PiggiesWorldDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PiggiesWorldDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PiggiesWorldDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PiggiesWorldDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PiggiesWorldDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PiggiesWorldDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PiggiesWorldDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PiggiesWorldDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PiggiesWorldDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PiggiesWorldDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PiggiesWorldDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PiggiesWorldDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PiggiesWorldDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PiggiesWorldDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PiggiesWorldDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PiggiesWorldDB] SET  MULTI_USER 
GO
ALTER DATABASE [PiggiesWorldDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PiggiesWorldDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PiggiesWorldDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PiggiesWorldDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PiggiesWorldDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PiggiesWorldDB] SET QUERY_STORE = OFF
GO
USE [PiggiesWorldDB]
GO
/****** Object:  Table [dbo].[role]    Script Date: 10/8/2020 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 10/8/2020 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](15) NOT NULL,
	[birthday] [datetime] NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_announcement]    Script Date: 10/8/2020 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_announcement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[photo] [nvarchar](100) NOT NULL,
	[description] [nvarchar](500) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[upload_date] [datetime] NOT NULL,
	[user_id] [int] NOT NULL,
	[flag_submited] [bit] NOT NULL,
 CONSTRAINT [PK_announcement] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_password]    Script Date: 10/8/2020 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_password](
	[id] [int] NOT NULL,
	[password_hash] [nvarchar](260) NULL,
 CONSTRAINT [PK_user_password] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_photo]    Script Date: 10/8/2020 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_photo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[path] [nvarchar](100) NOT NULL,
	[description] [nvarchar](50) NULL,
	[votes_count] [int] NOT NULL,
	[rating] [real] NOT NULL,
	[upload_date] [datetime] NOT NULL,
	[flag_submited] [bit] NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_user_photo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_role_association]    Script Date: 10/8/2020 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_role_association](
	[user_id] [int] NOT NULL,
	[role_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_story]    Script Date: 10/8/2020 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_story](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](30) NOT NULL,
	[preview_photo] [nvarchar](50) NOT NULL,
	[description] [nvarchar](80) NOT NULL,
	[body] [nvarchar](500) NOT NULL,
	[header1] [nvarchar](30) NULL,
	[photo1] [nvarchar](50) NULL,
	[inf1] [nvarchar](500) NULL,
	[header2] [nvarchar](30) NULL,
	[photo2] [nvarchar](50) NULL,
	[inf2] [nvarchar](500) NULL,
	[flag_submited] [bit] NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_user_story] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_video]    Script Date: 10/8/2020 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_video](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url] [nvarchar](250) NOT NULL,
	[user_id] [int] NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[upload_date] [datetime] NOT NULL,
	[flag_submited] [bit] NOT NULL,
 CONSTRAINT [PK_user_video] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[user_announcement]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[user_password]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[user] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[user_photo]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[user_role_association]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[user_role_association]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[user_story]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[user_video]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
/****** Object:  StoredProcedure [dbo].[gsp_Add_Announcement]    Script Date: 10/8/2020 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[gsp_Add_Announcement] 
	@title NVARCHAR(50),
	@photo NVARCHAR(100),
	@description NVARCHAR(500),
	@phone NVARCHAR(50),
	@upload_date DATETIME,
	@user_id INT
	AS
BEGIN
	INSERT INTO [user_announcement](title, photo, [description], phone, upload_date, [user_id], flag_submited)
	VALUES(@title, @photo, @description, @phone, @upload_date, @user_id, 0);
END;
GO
/****** Object:  StoredProcedure [dbo].[gsp_Add_Photo]    Script Date: 10/8/2020 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[gsp_Add_Photo] 
	@path NVARCHAR(50),
	@description NVARCHAR(50),
	@upload_date DATETIME,
	@user_id INT
	AS
BEGIN
	INSERT INTO user_photo(path, description, votes_count, rating, upload_date, flag_submited, user_id)
	VALUES (@path, @description, 0, 0, @upload_date, 0, @user_id);
END;
GO
/****** Object:  StoredProcedure [dbo].[gsp_Add_Story]    Script Date: 10/8/2020 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[gsp_Add_Story] 
	@title NVARCHAR(30),
	@preview_photo NVARCHAR(50),
	@description NVARCHAR(80),
	@body NVARCHAR(500),
	@user_id INT,
	@header1 NVARCHAR(30) = NULL,
	@photo1 NVARCHAR(50) = NULL,
	@inf1 NVARCHAR(500) = NULL,
	@header2 NVARCHAR(30) = NULL,
	@photo2 NVARCHAR(50) = NULL,
	@inf2 NVARCHAR(500) = NULL
	AS
BEGIN
	INSERT INTO [user_story](title, preview_photo, [description], body, header1, photo1, inf1, header2, photo2, inf2, flag_submited, user_id)
	VALUES (@title, @preview_photo, @description, @body, @header1, @photo1, @inf1, @header2, @photo2, @inf2, 0, @user_id)
END;
GO
/****** Object:  StoredProcedure [dbo].[gsp_Add_User_Role_Association]    Script Date: 10/8/2020 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[gsp_Add_User_Role_Association] 
	@user_id INT,
	@role_id INT
	AS
BEGIN
    INSERT INTO user_role_association (user_id, role_id)
	VALUES (@user_id, @role_id)
END;
GO
/****** Object:  StoredProcedure [dbo].[gsp_Add_Video]    Script Date: 10/8/2020 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[gsp_Add_Video] 
	@url NVARCHAR(250),
	@user_id INT,
	@description NVARCHAR(50),
	@upload_date DATETIME
	AS
BEGIN
	INSERT INTO user_video([url], user_id, [description], upload_date, flag_submited)
	VALUES (@url, @user_id, @description, @upload_date, 0);
END;
GO
/****** Object:  StoredProcedure [dbo].[gsp_Delete_Announcement]    Script Date: 10/8/2020 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[gsp_Delete_Announcement] 
	@announcement_id INT
	AS
BEGIN
	DELETE FROM user_announcement
	WHERE user_announcement.id = @announcement_id;
END;
GO
/****** Object:  StoredProcedure [dbo].[gsp_Delete_Photo]    Script Date: 10/8/2020 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[gsp_Delete_Photo] 
	@photo_id INT
	AS
BEGIN
	DELETE FROM user_photo
	WHERE user_photo.id = @photo_id;
END;
GO
/****** Object:  StoredProcedure [dbo].[gsp_Delete_Story]    Script Date: 10/8/2020 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[gsp_Delete_Story] 
	@story_id INT
	AS
BEGIN
	DELETE FROM user_story
	WHERE user_story.id = @story_id;
END;
GO
/****** Object:  StoredProcedure [dbo].[gsp_Delete_User]    Script Date: 10/8/2020 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[gsp_Delete_User] 
	@user_id INT
	AS
BEGIN
	DELETE FROM [user]
	WHERE [user].id = @user_id;
END;
GO
/****** Object:  StoredProcedure [dbo].[gsp_Delete_User_Role_Association]    Script Date: 10/8/2020 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[gsp_Delete_User_Role_Association] 
	@user_id INT,
	@role_id INT
	AS
BEGIN
    DELETE FROM user_role_association
	WHERE user_role_association.role_id = @role_id AND user_role_association.user_id = @user_id
END;
GO
/****** Object:  StoredProcedure [dbo].[gsp_Delete_User_Role_Association_By_User_ID]    Script Date: 10/8/2020 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[gsp_Delete_User_Role_Association_By_User_ID] 
	@user_id INT
	AS
BEGIN
    DELETE FROM user_role_association
	WHERE user_role_association.user_id = @user_id
END;
GO
/****** Object:  StoredProcedure [dbo].[gsp_Delete_Video]    Script Date: 10/8/2020 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[gsp_Delete_Video] 
	@video_id INT
	AS
BEGIN
	DELETE FROM user_video
	WHERE user_video.id = @video_id;
END;
GO
/****** Object:  StoredProcedure [dbo].[gsp_Register]    Script Date: 10/8/2020 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[gsp_Register] 
	@login NVARCHAR(15),
	@birthday DATETIME,
	@password_hash NVARCHAR(260)
AS
BEGIN
	INSERT INTO [user] (login, birthday)
	VALUES (@login, @birthday)

	DECLARE @new_id INT;
	SET @new_id = CAST(scope_identity() AS INT)

	INSERT INTO [user_password] (id, password_hash)
	VALUES (@new_id, @password_hash)
END;
GO
/****** Object:  StoredProcedure [dbo].[gsp_Submit_Announcement]    Script Date: 10/8/2020 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[gsp_Submit_Announcement] 
	@announcement_id INT
	AS
BEGIN
    UPDATE user_announcement
	SET flag_submited = 1
	WHERE user_announcement.id = @announcement_id
END;
GO
/****** Object:  StoredProcedure [dbo].[gsp_Submit_Photo]    Script Date: 10/8/2020 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[gsp_Submit_Photo] 
	@photo_id INT
	AS
BEGIN
    UPDATE user_photo
	SET flag_submited = 1
	WHERE user_photo.id = @photo_id
END;
GO
/****** Object:  StoredProcedure [dbo].[gsp_Submit_Story]    Script Date: 10/8/2020 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[gsp_Submit_Story] 
	@story_id INT
	AS
BEGIN
    UPDATE user_story
	SET flag_submited = 1
	WHERE user_story.id = @story_id
END;
GO
/****** Object:  StoredProcedure [dbo].[gsp_Submit_Video]    Script Date: 10/8/2020 6:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[gsp_Submit_Video] 
	@video_id INT
	AS
BEGIN
    UPDATE user_video
	SET flag_submited = 1
	WHERE user_video.id = @video_id
END;
GO
USE [master]
GO
ALTER DATABASE [PiggiesWorldDB] SET  READ_WRITE 
GO
