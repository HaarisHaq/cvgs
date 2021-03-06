GO

IF (SELECT count(name) FROM sys.databases WHERE name LIKE '%Conestoga Videogame Store%') = 0 
CREATE DATABASE [Conestoga Videogame Store]
GO

USE [Conestoga Videogame Store]
GO

DROP TABLE wishList
DROP TABLE eventAttendee
DROP TABLE gameReview
DROP TABLE productInformation
DROP TABLE relativeList

DROP TABLE cart
DROP TABLE orderItems
DROP TABLE [order]

DROP TABLE [event]
DROP TABLE [user]
DROP TABLE game
DROP TABLE report

DROP TABLE reportType
DROP TABLE userStatus
DROP TABLE eventType
GO

CREATE TABLE [dbo].[game](
	[id] [int] NOT NULL,
	[title] [varchar](100) NOT NULL,
	[genre] [varchar](20) NOT NULL,
	[releaseDate] [date] NULL,
	[developer] [varchar](50) NULL,
	[esrbRating] [nchar](5) NULL,
	[details] [nvarchar](4000) NULL,
	[plot] [nvarchar](4000) NULL,
CONSTRAINT [PK_Game] PRIMARY KEY ([id])
)
GO

CREATE TABLE [dbo].[productInformation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[gameId] [int] NOT NULL,
	[price] [money] NOT NULL,
	[console] [nvarchar](50) NOT NULL,
	[fileLocation] [varchar](400) NULL,
	[coverFileLocation] [varchar](400) NULL,
CONSTRAINT [PK_Product_Information] PRIMARY KEY ([id]),
CONSTRAINT [FK_Product_Game] FOREIGN KEY ([gameId])
REFERENCES [dbo].[game] ([id])
ON DELETE CASCADE
)
GO

CREATE TABLE [dbo].[userStatus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status] [varchar](20) NULL,
CONSTRAINT [PK_Status] PRIMARY KEY ([id])
)
GO

CREATE TABLE [dbo].[user](
	[id] [int] NOT NULL,
	[userStatusId] [int] NOT NULL,
	[username] [varchar](20) NOT NULL,
	[password] [varchar](30) NOT NULL,
	[givenName] [varchar](20) NOT NULL,
	[surname] [varchar](20) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[address] [varchar](255) NULL,
	[postalCode] [varchar](10) NULL,
	[mobile] [varchar](10) NULL,
	[fax] [varchar](10) NULL,
	[extension] [varchar](5) NULL,
	[preferences] [varchar](255) NULL,
CONSTRAINT [PK_User] PRIMARY KEY ([id]),
CONSTRAINT [FK_User_Status] FOREIGN KEY ([userStatusId])
REFERENCES [dbo].[userstatus] ([id])
)
GO

CREATE TABLE [dbo].[eventType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](50) NULL,
CONSTRAINT [PK_Type] PRIMARY KEY ([id])
)
GO

CREATE TABLE [dbo].[event](
	[id] [int] NOT NULL,
	[eventTypeId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[date] [date] NOT NULL,
	[time] [datetime] NOT NULL,
	[location] [varchar](255) NOT NULL,
	[name] [varchar](50) NULL,
	[description] [varchar](255) NULL,
CONSTRAINT [PK_Event] PRIMARY KEY ([id]),
CONSTRAINT [FK_Event_Author] FOREIGN KEY ([userId])
REFERENCES [dbo].[user] ([id]),
CONSTRAINT [FK_Event_Type] FOREIGN KEY ([eventTypeId])
REFERENCES [dbo].[eventType] ([id])
ON DELETE CASCADE
)
GO

CREATE TABLE [dbo].[eventAttendee](
	[eventId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[notes] [varchar](500) NULL,
CONSTRAINT [PK_Attendee] PRIMARY KEY ([eventId], [userId]),
CONSTRAINT [FK_Event] FOREIGN KEY ([eventId])
REFERENCES [dbo].[event] ([id])
ON DELETE CASCADE,
CONSTRAINT [FK_Attendee] FOREIGN KEY ([userId])
REFERENCES [dbo].[user] ([id])
ON DELETE CASCADE
)
GO

CREATE TABLE [dbo].[reportType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](50) NULL,
	[template] [varchar](4000) NULL,
CONSTRAINT [PK_Report_Type] PRIMARY KEY ([id])
)
GO

CREATE TABLE [dbo].[report](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[reportTypeId] [int] NOT NULL,
CONSTRAINT [PK_Report] PRIMARY KEY ([id]),
CONSTRAINT [FK_Report_Type] FOREIGN KEY ([reportTypeId])
REFERENCES [dbo].[reportType] ([id])
ON DELETE CASCADE
)
GO

CREATE TABLE [dbo].[gameReview](
	[id] [int] NOT NULL,
	[gameId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[rating] [int] NULL,
	[details] [varchar](255) NULL,
CONSTRAINT [PK_Review] PRIMARY KEY ([id]),
CONSTRAINT [FK_Review_Game] FOREIGN KEY ([gameId])
REFERENCES [dbo].[game] ([id]),
CONSTRAINT [FK_Review_Author] FOREIGN KEY ([userId])
REFERENCES [dbo].[user] ([id])
)
GO

CREATE TABLE [dbo].[wishList](
	[userId] [int] NOT NULL,
	[gameId] [int] NOT NULL,
	[date] [date] NULL,
CONSTRAINT [PK_Wish_List] PRIMARY KEY ([userId], [gameId]),
CONSTRAINT [FK_Wish_Game] FOREIGN KEY ([gameId])
REFERENCES [dbo].[game] ([id]),
CONSTRAINT [FK_Wish_User] FOREIGN KEY ([userId])
REFERENCES [dbo].[user] ([id])
ON DELETE CASCADE
)
GO

CREATE TABLE [dbo].[relativeList](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user1_Id] [int] NOT NULL,
	[user2_Id] [int] NOT NULL,
CONSTRAINT [PK_Relative] PRIMARY KEY ([id], [user1_id], [user2_id]),
CONSTRAINT [FK_List_Owner] FOREIGN KEY ([user1_id])
REFERENCES [dbo].[user] ([id])
ON DELETE CASCADE,
CONSTRAINT [FK_List_Relative] FOREIGN KEY ([user2_id])
REFERENCES [dbo].[user] (id)
)
GO

CREATE TABLE [dbo].[cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[gameId] [int] NOT NULL,
CONSTRAINT [PK_Cart] PRIMARY KEY ([id]),
CONSTRAINT [FK_Cart_Game] FOREIGN KEY ([gameId])
REFERENCES [dbo].[game] ([id]),
CONSTRAINT [FK_Cart_User] FOREIGN KEY ([userId])
REFERENCES [dbo].[user] ([id])
ON DELETE CASCADE
)
GO

CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[processed] [int] NULL,
CONSTRAINT [PK_Orders] PRIMARY KEY ([id]),
CONSTRAINT [FK_Order_User] FOREIGN KEY ([userId])
REFERENCES [dbo].[user] ([id])
ON DELETE CASCADE
)
GO

CREATE TABLE [dbo].[orderItems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NOT NULL,
	[gameId] [int] NOT NULL,
CONSTRAINT [PK_ORDER_ITEM] PRIMARY KEY ([id]),
CONSTRAINT [FK_Order_Id] FOREIGN KEY ([orderId])
REFERENCES [dbo].[order] ([id])
ON DELETE CASCADE
)
GO