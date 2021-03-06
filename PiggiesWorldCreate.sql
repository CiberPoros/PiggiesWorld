USE [PiggiesWorldDB]
GO
/****** Object:  Table [dbo].[role]    Script Date: 10/8/2020 10:31:32 PM ******/
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
/****** Object:  Table [dbo].[user]    Script Date: 10/8/2020 10:31:32 PM ******/
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
/****** Object:  Table [dbo].[user_announcement]    Script Date: 10/8/2020 10:31:32 PM ******/
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
/****** Object:  Table [dbo].[user_password]    Script Date: 10/8/2020 10:31:32 PM ******/
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
/****** Object:  Table [dbo].[user_photo]    Script Date: 10/8/2020 10:31:32 PM ******/
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
/****** Object:  Table [dbo].[user_role_association]    Script Date: 10/8/2020 10:31:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_role_association](
	[user_id] [int] NOT NULL,
	[role_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_story]    Script Date: 10/8/2020 10:31:32 PM ******/
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
/****** Object:  Table [dbo].[user_video]    Script Date: 10/8/2020 10:31:32 PM ******/
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
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([id], [title]) VALUES (1, N'admin')
INSERT [dbo].[role] ([id], [title]) VALUES (2, N'moderator')
INSERT [dbo].[role] ([id], [title]) VALUES (3, N'user')
SET IDENTITY_INSERT [dbo].[role] OFF
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([id], [login], [birthday]) VALUES (1, N'admin', CAST(N'1996-03-11T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[user] OFF
SET IDENTITY_INSERT [dbo].[user_announcement] ON 

INSERT [dbo].[user_announcement] ([id], [title], [photo], [description], [phone], [upload_date], [user_id], [flag_submited]) VALUES (2, N'Продам мини-пига САРАТОВ', N'abcb339a-ba41-4fc5-b866-13ae988ba175.jpg', N'Продам мини-пига!
Малышу 2 года, не болеет, к туалету приучен, стерилизован, мальчик, документы имеются. Максим', N'+79873064797', CAST(N'2020-10-08T16:41:53.000' AS DateTime), 1, 1)
INSERT [dbo].[user_announcement] ([id], [title], [photo], [description], [phone], [upload_date], [user_id], [flag_submited]) VALUES (4, N'Тестовое объявление Переносы', N'2e6ef1ba-3c1a-49b9-9211-25dee6cfe99b.jpg', N'Тест
Тест
Тест 
Тест', N'+79873064797', CAST(N'2020-10-08T16:45:17.860' AS DateTime), 1, 1)
INSERT [dbo].[user_announcement] ([id], [title], [photo], [description], [phone], [upload_date], [user_id], [flag_submited]) VALUES (5, N'Тест большой размер', N'b04e3213-f351-41b5-8a65-eac1fc87e463.jpg', N'тесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттесттест', N'+79873064797', CAST(N'2020-10-08T16:45:56.703' AS DateTime), 1, 1)
INSERT [dbo].[user_announcement] ([id], [title], [photo], [description], [phone], [upload_date], [user_id], [flag_submited]) VALUES (9, N'4124124', N'ca2f0c90-3056-4bad-9ccd-2411cfb1bd2e.jpg', N'sfsdfsdf', N'+79873064797', CAST(N'2020-10-08T18:09:10.153' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[user_announcement] OFF
INSERT [dbo].[user_password] ([id], [password_hash]) VALUES (1, N'8C6976E5B5410415BDE908BD4DEE15DFB167A9C873FC4BB8A81F6F2AB448A918')
SET IDENTITY_INSERT [dbo].[user_photo] ON 

INSERT [dbo].[user_photo] ([id], [path], [description], [votes_count], [rating], [upload_date], [flag_submited], [user_id]) VALUES (4, N'485f52fd-20e4-4778-8975-2e4a20c20a58main-pig1.jpg', N'на травке', 0, 0, CAST(N'2020-10-08T02:24:00.890' AS DateTime), 1, 1)
INSERT [dbo].[user_photo] ([id], [path], [description], [votes_count], [rating], [upload_date], [flag_submited], [user_id]) VALUES (5, N'36f5b020-182e-446b-b871-b841b7de21c0main-pig2.jpeg', N'розовый пятачуля', 0, 0, CAST(N'2020-10-08T02:24:18.453' AS DateTime), 1, 1)
INSERT [dbo].[user_photo] ([id], [path], [description], [votes_count], [rating], [upload_date], [flag_submited], [user_id]) VALUES (6, N'289cf07d-a833-410b-be72-8466400e9216pig.jpg', N'красивый пиг', 0, 0, CAST(N'2020-10-08T02:24:28.573' AS DateTime), 1, 1)
INSERT [dbo].[user_photo] ([id], [path], [description], [votes_count], [rating], [upload_date], [flag_submited], [user_id]) VALUES (7, N'6d37e34c-1cda-4f09-b905-acb7eb2e08a5pig2.jpg', N'Спящий хрюн', 0, 0, CAST(N'2020-10-08T02:24:38.953' AS DateTime), 1, 1)
INSERT [dbo].[user_photo] ([id], [path], [description], [votes_count], [rating], [upload_date], [flag_submited], [user_id]) VALUES (8, N'4e87ea13-6a1a-477a-a2e9-daa2cf244eecpig3.jpg', N'с яблочком', 0, 0, CAST(N'2020-10-08T02:24:48.773' AS DateTime), 1, 1)
INSERT [dbo].[user_photo] ([id], [path], [description], [votes_count], [rating], [upload_date], [flag_submited], [user_id]) VALUES (9, N'8ebe73e4-bfbe-4ddf-8375-c54e3e5f20b3pig4.jpg', N'колобок', 0, 0, CAST(N'2020-10-08T02:24:56.970' AS DateTime), 1, 1)
INSERT [dbo].[user_photo] ([id], [path], [description], [votes_count], [rating], [upload_date], [flag_submited], [user_id]) VALUES (10, N'49dcfadf-3d03-4481-9478-b241693cd235pig5.jpg', N'нюхает кошку', 0, 0, CAST(N'2020-10-08T02:25:10.193' AS DateTime), 1, 1)
INSERT [dbo].[user_photo] ([id], [path], [description], [votes_count], [rating], [upload_date], [flag_submited], [user_id]) VALUES (11, N'10f5f945-0905-4169-9ea8-7bdd301b2053pig6.jpg', N'братва', 0, 0, CAST(N'2020-10-08T02:25:18.933' AS DateTime), 1, 1)
INSERT [dbo].[user_photo] ([id], [path], [description], [votes_count], [rating], [upload_date], [flag_submited], [user_id]) VALUES (12, N'8f8db865-f9f6-4648-98da-76c1bce2aef5pig7.jpg', N'Корзинка поросят', 0, 0, CAST(N'2020-10-08T02:25:28.753' AS DateTime), 1, 1)
INSERT [dbo].[user_photo] ([id], [path], [description], [votes_count], [rating], [upload_date], [flag_submited], [user_id]) VALUES (13, N'79ce3662-7cb0-4af5-9bf7-891d72f99053pig8.jpg', N'Черныш-грязнуля', 0, 0, CAST(N'2020-10-08T02:25:42.447' AS DateTime), 1, 1)
INSERT [dbo].[user_photo] ([id], [path], [description], [votes_count], [rating], [upload_date], [flag_submited], [user_id]) VALUES (14, N'8f707437-1ad1-4f70-8e23-92a764500eafpig9.jpg', N'Хочет клубничку', 0, 0, CAST(N'2020-10-08T02:25:57.413' AS DateTime), 1, 1)
INSERT [dbo].[user_photo] ([id], [path], [description], [votes_count], [rating], [upload_date], [flag_submited], [user_id]) VALUES (15, N'931c735e-52ff-4711-98b1-39f16f43ac7bpig10.jpg', N'Стырил морковку', 0, 0, CAST(N'2020-10-08T02:26:06.480' AS DateTime), 1, 1)
INSERT [dbo].[user_photo] ([id], [path], [description], [votes_count], [rating], [upload_date], [flag_submited], [user_id]) VALUES (16, N'7daca1a6-4944-4043-9a5d-52df6b3fd275pig11.jpg', N'малыш', 0, 0, CAST(N'2020-10-08T02:26:17.530' AS DateTime), 1, 1)
INSERT [dbo].[user_photo] ([id], [path], [description], [votes_count], [rating], [upload_date], [flag_submited], [user_id]) VALUES (17, N'e7b1376e-1b38-488d-a881-8f8a0e03a612pig12.jpg', N'Новогодние пиги', 0, 0, CAST(N'2020-10-08T02:26:31.527' AS DateTime), 1, 1)
INSERT [dbo].[user_photo] ([id], [path], [description], [votes_count], [rating], [upload_date], [flag_submited], [user_id]) VALUES (18, N'7c3b70cc-774c-41cb-baf0-0eff44a2884bpig13.jpg', N'Почесун', 0, 0, CAST(N'2020-10-08T02:26:42.087' AS DateTime), 1, 1)
INSERT [dbo].[user_photo] ([id], [path], [description], [votes_count], [rating], [upload_date], [flag_submited], [user_id]) VALUES (19, N'28130621-2ae1-4711-bc2e-a443677e8412pig14.jpg', N'Пиг в сапогах', 0, 0, CAST(N'2020-10-08T02:26:50.060' AS DateTime), 1, 1)
INSERT [dbo].[user_photo] ([id], [path], [description], [votes_count], [rating], [upload_date], [flag_submited], [user_id]) VALUES (20, N'942af5f5-bd9e-49b1-8ab4-1e14bdb53624pig15.jpg', N'Спит', 0, 0, CAST(N'2020-10-08T02:29:48.720' AS DateTime), 1, 1)
INSERT [dbo].[user_photo] ([id], [path], [description], [votes_count], [rating], [upload_date], [flag_submited], [user_id]) VALUES (21, N'7fcee396-6596-4fee-a006-3df86a240b5cpig16.jpg', N'хрюндель', 0, 0, CAST(N'2020-10-08T02:30:00.997' AS DateTime), 1, 1)
INSERT [dbo].[user_photo] ([id], [path], [description], [votes_count], [rating], [upload_date], [flag_submited], [user_id]) VALUES (22, N'a0919d96-400d-4f39-bd4f-620772f70a8epig17.jpg', N'Купается', 0, 0, CAST(N'2020-10-08T02:30:12.813' AS DateTime), 1, 1)
INSERT [dbo].[user_photo] ([id], [path], [description], [votes_count], [rating], [upload_date], [flag_submited], [user_id]) VALUES (26, N'f6b6534d-faff-4374-9f87-5f076fe8a0e2pig18.jpg', N'Бельчонок', 0, 0, CAST(N'2020-10-08T06:40:55.517' AS DateTime), 1, 1)
INSERT [dbo].[user_photo] ([id], [path], [description], [votes_count], [rating], [upload_date], [flag_submited], [user_id]) VALUES (27, N'7b4203f8-076c-4d63-b33c-362af7ecbc9cpig20.jpg', N'Рыжик', 0, 0, CAST(N'2020-10-08T06:41:14.370' AS DateTime), 1, 1)
INSERT [dbo].[user_photo] ([id], [path], [description], [votes_count], [rating], [upload_date], [flag_submited], [user_id]) VALUES (28, N'336c4779-821d-4b5f-bc0e-fe01c5810fa8pig19.jpg', N'поросенок', 0, 0, CAST(N'2020-10-08T06:42:41.323' AS DateTime), 1, 1)
INSERT [dbo].[user_photo] ([id], [path], [description], [votes_count], [rating], [upload_date], [flag_submited], [user_id]) VALUES (31, N'bb60648c-f326-430a-a20c-44e8849242d1.jpg', N'Шницель и бекон', 0, 0, CAST(N'2020-10-08T14:57:28.527' AS DateTime), 1, 1)
INSERT [dbo].[user_photo] ([id], [path], [description], [votes_count], [rating], [upload_date], [flag_submited], [user_id]) VALUES (32, N'3b431cfd-965f-4cd6-83f2-80c345f801bc.jpg', N'порос', 0, 0, CAST(N'2020-10-08T16:58:03.280' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[user_photo] OFF
INSERT [dbo].[user_role_association] ([user_id], [role_id]) VALUES (1, 1)
INSERT [dbo].[user_role_association] ([user_id], [role_id]) VALUES (1, 2)
INSERT [dbo].[user_role_association] ([user_id], [role_id]) VALUES (1, 3)
SET IDENTITY_INSERT [dbo].[user_story] ON 

INSERT [dbo].[user_story] ([id], [title], [preview_photo], [description], [body], [header1], [photo1], [inf1], [header2], [photo2], [inf2], [flag_submited], [user_id]) VALUES (2, N'Чем кормить мини-пига?', N'1fde5ba3-47bf-41b3-b203-ebd8d79b680.jpg', N'Что можно, а что нельзя давать маленькой хрюше? Разбираемся!', N'Свежие овощи и фрукты обязательны в ежедневном рационе мини-пига. Свинки очень любят морковку, сладкий перец, огурцы, сельдерей и разную свежую зелень.
Покупая для своего питомца свежие фрукты, следите за тем, чтобы в них не содержалось избыточного количества калорий и сахара. Кормить поросенка каждый день картофелем также не рекомендуется, так как в этом овоще много крахмала и калорий.', N'Чем можно побаловать свинку?', N'a13dca59-9e26-4e56-8edc-59978c49cec0pig10.jpg', N'Человеческая еда со стола для поросенка, все равно, что для людей фаст-фут – вкусно, но вредно. 
Если кормить мини-пига обычной едой, то он может быстро набрать вес и тогда у него возникают различные проблемы с суставами ног, которые не выдерживают избыточный вес поросенка.', N'Не растолстеет ли свинка?', N'cf672160-2697-4b83-b669-b798032c3323pig4.jpg', N'Если при покупке мини-пига вам советуют как можно меньше кормить поросенка, чтобы он не вырос до больших размеров, то такие продавцы являются обманщиками. 
Породы миниатюрных свинок  в редких исключениях могут вырасти до больших размеров, если они нечистокровные. А для нормального развития поросенка необходимы все питательные вещества, чтобы укрепить его здоровье, когда он станет взрослым.', 1, 1)
INSERT [dbo].[user_story] ([id], [title], [preview_photo], [description], [body], [header1], [photo1], [inf1], [header2], [photo2], [inf2], [flag_submited], [user_id]) VALUES (3, N'Тест с переносами', N'fb9927bb-aefe-4d9b-b98b-4601e25f9807pig19.jpg', N'Тест
Тест
Тест
Тест
Тест
Тест
Тест
Тест
Тест
Тест', N'Тест
Тест
Тест
Тест
Тест
Тест
Тест
Тест
Тест
Тест
Тест
Тест
Тест
ТестТест
Тест
Тест
Тест
Тест
Тест
ТестТест
Тест
Тест
Тест
Тест
Тест
ТестТест
Тест
Тест
Тест
Тест
Тест
ТестТест
Тест
Тест
Тест
Тест
Тест
ТестТест
Тест
Тест
Тест
Тест
Тест
ТестТест
Тест
Тест
Тест
Тест
Тест
ТестТест
Тест
Тест
Тест
Тест
Тест
ТестТест
Тест
Тест
Тест
Тест
Тест
ТестТест
Тест
Тест
Тест
Тест
Тест
ТестТест
Тест
Тест
Тест
Тест
Тест
ТестТест
Тест
Тест
', N'Тест с переносами', NULL, N'abacaba
abacaba
abacaba
abacaba
abacaba', N'Тест с переносами', NULL, N'a     b', 1, 1)
INSERT [dbo].[user_story] ([id], [title], [preview_photo], [description], [body], [header1], [photo1], [inf1], [header2], [photo2], [inf2], [flag_submited], [user_id]) VALUES (4, N'Тест максимальный размер', N'a109a828-f9e5-4450-9bc6-5edab84908cbpig19.jpg', N'ТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТ', N'ТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТ', N'ТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕ', NULL, N'ТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТ', N'ТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕ', NULL, N'ТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТТЕСТ', 1, 1)
INSERT [dbo].[user_story] ([id], [title], [preview_photo], [description], [body], [header1], [photo1], [inf1], [header2], [photo2], [inf2], [flag_submited], [user_id]) VALUES (6, N'Мой дом - моя крепость', N'fb80107d-3bef-446e-a95f-dacc2e3307a1.jpg', N'Что делать, если минипиг совсем не любит гулять?', N'Минипиги - очень одомашненные животные, и не все минипиги любят покидать свою обитель. Для того, чтобы поросенок выходил на улицу, нужно начинать приучать его гулять с детства.', N'Возьми меня на ручки', N'de083e6f-8785-4ff8-9ae2-c5f6064c42b4.jpg', N'Минипига полезно приучать находиться на руках, животное начинает чувствовать себя в безопасности рядом с хозяином, что положительно скажется на отношении свинки к вам.
Однако не стоит всегда пытаться носить минипига на руках, когда вы выходите на прогулку - поросенок станет очень опасаться ступать на землю.
Поверьте, когда вам малыш подрастет, вы уже не будете так радоваться тому, что ваш пухленьких розовый комочек всегда хочет находиться на руках.', N'Прогулки с друзьями', N'7c33cd99-d374-4b39-9e79-255ce95bf73d.jpg', N'Довольно редко можно встретить на улицах города людей с минипигами на прогулках. Также не все хозяева хотят заводить себе более одной хрюшки.
Но это не большая проблема для поросят - они отлично ладят с собаками, особенно с псами тех пород, чей характер подразумевает дружелюбие и любовь к играм!', 1, 1)
SET IDENTITY_INSERT [dbo].[user_story] OFF
SET IDENTITY_INSERT [dbo].[user_video] ON 

INSERT [dbo].[user_video] ([id], [url], [user_id], [description], [upload_date], [flag_submited]) VALUES (3, N'https://www.youtube.com/embed/80Ey06g5VIE', 1, N'Подборка смешных минипигов', CAST(N'2020-10-08T02:51:39.550' AS DateTime), 1)
INSERT [dbo].[user_video] ([id], [url], [user_id], [description], [upload_date], [flag_submited]) VALUES (4, N'https://www.youtube.com/embed/cKYs0-g3QkE', 1, N'Веселые поросята', CAST(N'2020-10-08T02:52:09.083' AS DateTime), 1)
INSERT [dbo].[user_video] ([id], [url], [user_id], [description], [upload_date], [flag_submited]) VALUES (5, N'https://www.youtube.com/embed/ZNsRL3D8t-M', 1, N'Большой дикий и дружелюбный', CAST(N'2020-10-08T02:53:03.193' AS DateTime), 1)
INSERT [dbo].[user_video] ([id], [url], [user_id], [description], [upload_date], [flag_submited]) VALUES (6, N'https://www.youtube.com/embed/a19xYrq_B9c', 1, N'Лесные кабанчики живут дома', CAST(N'2020-10-08T02:53:37.607' AS DateTime), 1)
INSERT [dbo].[user_video] ([id], [url], [user_id], [description], [upload_date], [flag_submited]) VALUES (7, N'https://www.youtube.com/embed/bJnIqDn0SGE', 1, N'Лесные кабанчики продолжение', CAST(N'2020-10-08T02:54:22.007' AS DateTime), 1)
INSERT [dbo].[user_video] ([id], [url], [user_id], [description], [upload_date], [flag_submited]) VALUES (8, N'https://www.youtube.com/embed/goo7KtPhJVc', 1, N'Малыши играются', CAST(N'2020-10-08T02:55:28.707' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[user_video] OFF
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
/****** Object:  StoredProcedure [dbo].[gsp_Add_Announcement]    Script Date: 10/8/2020 10:31:32 PM ******/
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
/****** Object:  StoredProcedure [dbo].[gsp_Add_Photo]    Script Date: 10/8/2020 10:31:32 PM ******/
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
/****** Object:  StoredProcedure [dbo].[gsp_Add_Story]    Script Date: 10/8/2020 10:31:32 PM ******/
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
/****** Object:  StoredProcedure [dbo].[gsp_Add_User_Role_Association]    Script Date: 10/8/2020 10:31:32 PM ******/
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
/****** Object:  StoredProcedure [dbo].[gsp_Add_Video]    Script Date: 10/8/2020 10:31:32 PM ******/
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
/****** Object:  StoredProcedure [dbo].[gsp_Delete_Announcement]    Script Date: 10/8/2020 10:31:32 PM ******/
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
/****** Object:  StoredProcedure [dbo].[gsp_Delete_Photo]    Script Date: 10/8/2020 10:31:32 PM ******/
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
/****** Object:  StoredProcedure [dbo].[gsp_Delete_Story]    Script Date: 10/8/2020 10:31:32 PM ******/
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
/****** Object:  StoredProcedure [dbo].[gsp_Delete_User]    Script Date: 10/8/2020 10:31:32 PM ******/
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
/****** Object:  StoredProcedure [dbo].[gsp_Delete_User_Role_Association]    Script Date: 10/8/2020 10:31:32 PM ******/
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
/****** Object:  StoredProcedure [dbo].[gsp_Delete_User_Role_Association_By_User_ID]    Script Date: 10/8/2020 10:31:32 PM ******/
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
/****** Object:  StoredProcedure [dbo].[gsp_Delete_Video]    Script Date: 10/8/2020 10:31:32 PM ******/
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
/****** Object:  StoredProcedure [dbo].[gsp_Register]    Script Date: 10/8/2020 10:31:32 PM ******/
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
/****** Object:  StoredProcedure [dbo].[gsp_Submit_Announcement]    Script Date: 10/8/2020 10:31:32 PM ******/
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
/****** Object:  StoredProcedure [dbo].[gsp_Submit_Photo]    Script Date: 10/8/2020 10:31:32 PM ******/
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
/****** Object:  StoredProcedure [dbo].[gsp_Submit_Story]    Script Date: 10/8/2020 10:31:32 PM ******/
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
/****** Object:  StoredProcedure [dbo].[gsp_Submit_Video]    Script Date: 10/8/2020 10:31:32 PM ******/
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
