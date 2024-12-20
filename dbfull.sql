USE [thesis-database]
GO
/****** Object:  Table [dbo].[Assign]    Script Date: 03-Nov-24 10:05:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assign](
	[AssignID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[TaskID] [int] NOT NULL,
	[assignAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AssignID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comic]    Script Date: 03-Nov-24 10:05:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comic](
	[ComicId] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Comic] PRIMARY KEY CLUSTERED 
(
	[ComicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 03-Nov-24 10:05:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[taskID] [int] IDENTITY(1,1) NOT NULL,
	[taskname] [nvarchar](255) NOT NULL,
	[createAt] [datetime] NULL,
	[deadline] [datetime] NOT NULL,
	[progressPercentage] [decimal](5, 2) NULL,
	[priority] [nvarchar](50) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[ComicId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[taskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 03-Nov-24 10:05:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](100) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[hashedPassword] [nvarchar](255) NOT NULL,
	[firstName] [nvarchar](100) NULL,
	[lastName] [nvarchar](100) NULL,
	[phoneNumber] [nvarchar](20) NULL,
	[dateOfBirth] [date] NULL,
	[role] [nvarchar](50) NOT NULL,
	[status] [nvarchar](20) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[lastLogin] [datetime2](7) NULL,
 CONSTRAINT [PK__Users__CB9A1CFFCADFBDB2] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__Users__66DCF95C032A805A] UNIQUE NONCLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__Users__AB6E61641E24CA52] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Assign] ADD  DEFAULT (getdate()) FOR [assignAt]
GO
ALTER TABLE [dbo].[Task] ADD  DEFAULT (getdate()) FOR [createAt]
GO
ALTER TABLE [dbo].[Task] ADD  DEFAULT ((0)) FOR [progressPercentage]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users__role__30F848ED]  DEFAULT ('User') FOR [role]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users__status__31EC6D26]  DEFAULT ('Active') FOR [status]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users__createdAt__32E0915F]  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Assign]  WITH CHECK ADD  CONSTRAINT [FK_TaskID] FOREIGN KEY([TaskID])
REFERENCES [dbo].[Task] ([taskID])
GO
ALTER TABLE [dbo].[Assign] CHECK CONSTRAINT [FK_TaskID]
GO
ALTER TABLE [dbo].[Assign]  WITH CHECK ADD  CONSTRAINT [FK_UserID] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Assign] CHECK CONSTRAINT [FK_UserID]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_ComicId] FOREIGN KEY([ComicId])
REFERENCES [dbo].[Comic] ([ComicId])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_ComicId]
GO
