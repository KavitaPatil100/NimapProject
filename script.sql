USE [DbNimapInfotechKavita]
GO
/****** Object:  Table [dbo].[MCategory]    Script Date: 10/6/2023 3:53:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MCategory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[IsActiv] [bit] NULL,
 CONSTRAINT [PK_MCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MProduct]    Script Date: 10/6/2023 3:53:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MProduct](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_MProduct] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Category]    Script Date: 10/6/2023 3:53:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[Sp_Category]
@CategoryId int ,
@CategoryName nvarchar(50),
@Isactiv bit,
@Flag nvarchar(1)
As
Begin
if(@Flag='I')
Begin
Insert into [dbo].[MCategory] values(@CategoryName,@IsActiv)
End
If(@Flag='U')
Begin
Update MCategory Set 
CategoryName=@CategoryName,IsActiv=@Isactiv
Where CategoryId=@CategoryId
End
End
GO
/****** Object:  StoredProcedure [dbo].[SpProduct]    Script Date: 10/6/2023 3:53:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[SpProduct] 
@ProductId int ,
@ProductName nvarchar(50),
@CategoryId int,
@Flag nvarchar(1)
As
Begin
if(@Flag='I')
Begin
Insert into MProduct values(@ProductName,@CategoryId)
End
If(@Flag='U')
Begin
Update MProduct Set 
ProductName=@ProductName,CategoryId=@CategoryId
Where ProductId=@ProductId
End
End
GO
