USE [master]
GO
/****** Object:  Database [NasyrovTaskSeptember]    Script Date: 12.09.2024 10:40:45 ******/
CREATE DATABASE [NasyrovTaskSeptember]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NasyrovTaskSeptember', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\NasyrovTaskSeptember.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NasyrovTaskSeptember_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\NasyrovTaskSeptember_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [NasyrovTaskSeptember] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NasyrovTaskSeptember].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NasyrovTaskSeptember] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET ARITHABORT OFF 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET  MULTI_USER 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NasyrovTaskSeptember] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NasyrovTaskSeptember] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [NasyrovTaskSeptember] SET QUERY_STORE = OFF
GO
USE [NasyrovTaskSeptember]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 12.09.2024 10:40:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderItemID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[MenuItem] [nvarchar](100) NOT NULL,
	[TableNumber] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12.09.2024 10:40:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[WaiterID] [int] NULL,
	[OrderStatus] [nvarchar](50) NOT NULL,
	[OrderDate] [datetime] NULL,
	[TotalAmount] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatusHistory]    Script Date: 12.09.2024 10:40:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatusHistory](
	[StatusHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[ChangedByUserID] [int] NULL,
	[ChangedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Smena]    Script Date: 12.09.2024 10:40:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Smena](
	[SmenaID] [int] IDENTITY(1,1) NOT NULL,
	[SmenaDate] [date] NOT NULL,
	[WaiterID] [int] NULL,
	[CookID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SmenaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12.09.2024 10:40:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserSmena]    Script Date: 12.09.2024 10:40:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSmena](
	[UserSmenaID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[SmenaID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserSmenaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Smena] ON 

INSERT [dbo].[Smena] ([SmenaID], [SmenaDate], [WaiterID], [CookID]) VALUES (1, CAST(N'2024-09-13' AS Date), 3, 4)
SET IDENTITY_INSERT [dbo].[Smena] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [FullName], [Role], [Status]) VALUES (1, N'admin', N'admin', N'Главный Администратор', N'Администратор', N'Активен')
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [FullName], [Role], [Status]) VALUES (2, N'waiter', N'waiter', N'Официант', N'Официант', N'Активен')
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [FullName], [Role], [Status]) VALUES (3, N'cook', N'cook', N'Повар', N'Повар', N'Активен')
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [FullName], [Role], [Status]) VALUES (4, N'TEST', N'TEST', N'Тест', N'Официант', N'Активен')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E4DFD4E3EE]    Script Date: 12.09.2024 10:40:45 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ('Принят') FOR [OrderStatus]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[OrderStatusHistory] ADD  DEFAULT (getdate()) FOR [ChangedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('Активен') FOR [Status]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([WaiterID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[OrderStatusHistory]  WITH CHECK ADD FOREIGN KEY([ChangedByUserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[OrderStatusHistory]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Smena]  WITH CHECK ADD FOREIGN KEY([CookID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Smena]  WITH CHECK ADD FOREIGN KEY([WaiterID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserSmena]  WITH CHECK ADD FOREIGN KEY([SmenaID])
REFERENCES [dbo].[Smena] ([SmenaID])
GO
ALTER TABLE [dbo].[UserSmena]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([OrderStatus]='Оплачен' OR [OrderStatus]='Готов' OR [OrderStatus]='Готовится' OR [OrderStatus]='Принят'))
GO
ALTER TABLE [dbo].[OrderStatusHistory]  WITH CHECK ADD CHECK  (([Status]='Оплачен' OR [Status]='Готов' OR [Status]='Готовится' OR [Status]='Принят'))
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([Role]='Повар' OR [Role]='Официант' OR [Role]='Администратор'))
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([Status]='Уволен' OR [Status]='Активен'))
GO
USE [master]
GO
ALTER DATABASE [NasyrovTaskSeptember] SET  READ_WRITE 
GO
