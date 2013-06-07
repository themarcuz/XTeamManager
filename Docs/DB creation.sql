/****** Object:  Table [dbo].[Member]    Script Date: 06/08/2013 01:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DynamicBoard]    Script Date: 06/08/2013 01:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DynamicBoard](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_DynamicBoard] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Card]    Script Date: 06/08/2013 01:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[DueDate] [date] NULL,
	[Color] [nvarchar](10) NULL,
 CONSTRAINT [PK_Card] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assignation]    Script Date: 06/08/2013 01:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignation](
	[Card] [int] NOT NULL,
	[Member] [int] NOT NULL,
 CONSTRAINT [PK_Assignation] PRIMARY KEY CLUSTERED 
(
	[Card] ASC,
	[Member] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 06/08/2013 01:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[DynamicBoard] [int] NOT NULL,
	[Member] [int] NOT NULL,
	[Permission] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[DynamicBoard] ASC,
	[Member] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entity]    Script Date: 06/08/2013 01:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entity](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[DynamicBoard] [int] NOT NULL,
 CONSTRAINT [PK_Entity] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryItem]    Script Date: 06/08/2013 01:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventDate] [datetime] NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Member] [int] NOT NULL,
	[Card] [int] NOT NULL,
 CONSTRAINT [PK_HistoryItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntityItem]    Script Date: 06/08/2013 01:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntityItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Entity] [int] NOT NULL,
 CONSTRAINT [PK_EntityItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardEntities]    Script Date: 06/08/2013 01:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardEntities](
	[EntityItem] [int] NOT NULL,
	[Card] [int] NOT NULL,
 CONSTRAINT [PK_CardEntities] PRIMARY KEY CLUSTERED 
(
	[EntityItem] ASC,
	[Card] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Assignation_Card]    Script Date: 06/08/2013 01:39:06 ******/
ALTER TABLE [dbo].[Assignation]  WITH CHECK ADD  CONSTRAINT [FK_Assignation_Card] FOREIGN KEY([Card])
REFERENCES [dbo].[Card] ([ID])
GO
ALTER TABLE [dbo].[Assignation] CHECK CONSTRAINT [FK_Assignation_Card]
GO
/****** Object:  ForeignKey [FK_Assignation_Member]    Script Date: 06/08/2013 01:39:06 ******/
ALTER TABLE [dbo].[Assignation]  WITH CHECK ADD  CONSTRAINT [FK_Assignation_Member] FOREIGN KEY([Member])
REFERENCES [dbo].[Member] ([ID])
GO
ALTER TABLE [dbo].[Assignation] CHECK CONSTRAINT [FK_Assignation_Member]
GO
/****** Object:  ForeignKey [FK_CardEntities_Card]    Script Date: 06/08/2013 01:39:06 ******/
ALTER TABLE [dbo].[CardEntities]  WITH CHECK ADD  CONSTRAINT [FK_CardEntities_Card] FOREIGN KEY([Card])
REFERENCES [dbo].[Card] ([ID])
GO
ALTER TABLE [dbo].[CardEntities] CHECK CONSTRAINT [FK_CardEntities_Card]
GO
/****** Object:  ForeignKey [FK_CardEntities_EntityItem]    Script Date: 06/08/2013 01:39:06 ******/
ALTER TABLE [dbo].[CardEntities]  WITH CHECK ADD  CONSTRAINT [FK_CardEntities_EntityItem] FOREIGN KEY([EntityItem])
REFERENCES [dbo].[EntityItem] ([ID])
GO
ALTER TABLE [dbo].[CardEntities] CHECK CONSTRAINT [FK_CardEntities_EntityItem]
GO
/****** Object:  ForeignKey [FK_Entity_DynamicBoard]    Script Date: 06/08/2013 01:39:06 ******/
ALTER TABLE [dbo].[Entity]  WITH CHECK ADD  CONSTRAINT [FK_Entity_DynamicBoard] FOREIGN KEY([DynamicBoard])
REFERENCES [dbo].[DynamicBoard] ([ID])
GO
ALTER TABLE [dbo].[Entity] CHECK CONSTRAINT [FK_Entity_DynamicBoard]
GO
/****** Object:  ForeignKey [FK_EntityItem_Entity]    Script Date: 06/08/2013 01:39:06 ******/
ALTER TABLE [dbo].[EntityItem]  WITH CHECK ADD  CONSTRAINT [FK_EntityItem_Entity] FOREIGN KEY([Entity])
REFERENCES [dbo].[Entity] ([ID])
GO
ALTER TABLE [dbo].[EntityItem] CHECK CONSTRAINT [FK_EntityItem_Entity]
GO
/****** Object:  ForeignKey [FK_HistoryItem_Card]    Script Date: 06/08/2013 01:39:06 ******/
ALTER TABLE [dbo].[HistoryItem]  WITH CHECK ADD  CONSTRAINT [FK_HistoryItem_Card] FOREIGN KEY([Card])
REFERENCES [dbo].[Card] ([ID])
GO
ALTER TABLE [dbo].[HistoryItem] CHECK CONSTRAINT [FK_HistoryItem_Card]
GO
/****** Object:  ForeignKey [FK_HistoryItem_Member]    Script Date: 06/08/2013 01:39:06 ******/
ALTER TABLE [dbo].[HistoryItem]  WITH CHECK ADD  CONSTRAINT [FK_HistoryItem_Member] FOREIGN KEY([Member])
REFERENCES [dbo].[Member] ([ID])
GO
ALTER TABLE [dbo].[HistoryItem] CHECK CONSTRAINT [FK_HistoryItem_Member]
GO
/****** Object:  ForeignKey [FK_Role_DynamicBoard]    Script Date: 06/08/2013 01:39:06 ******/
ALTER TABLE [dbo].[Role]  WITH CHECK ADD  CONSTRAINT [FK_Role_DynamicBoard] FOREIGN KEY([DynamicBoard])
REFERENCES [dbo].[DynamicBoard] ([ID])
GO
ALTER TABLE [dbo].[Role] CHECK CONSTRAINT [FK_Role_DynamicBoard]
GO
/****** Object:  ForeignKey [FK_Role_Member]    Script Date: 06/08/2013 01:39:06 ******/
ALTER TABLE [dbo].[Role]  WITH CHECK ADD  CONSTRAINT [FK_Role_Member] FOREIGN KEY([Member])
REFERENCES [dbo].[Member] ([ID])
GO
ALTER TABLE [dbo].[Role] CHECK CONSTRAINT [FK_Role_Member]
GO
