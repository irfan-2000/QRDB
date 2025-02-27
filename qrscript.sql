USE [master]
GO
/****** Object:  Database [QRBased]    Script Date: 25-10-2024 18:49:28 ******/
CREATE DATABASE [QRBased]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QRBased', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QRBased.mdf' , SIZE = 139264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QRBased_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QRBased_log.ldf' , SIZE = 1318912KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QRBased] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QRBased].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QRBased] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QRBased] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QRBased] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QRBased] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QRBased] SET ARITHABORT OFF 
GO
ALTER DATABASE [QRBased] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QRBased] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QRBased] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QRBased] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QRBased] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QRBased] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QRBased] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QRBased] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QRBased] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QRBased] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QRBased] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QRBased] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QRBased] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QRBased] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QRBased] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QRBased] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QRBased] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QRBased] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QRBased] SET  MULTI_USER 
GO
ALTER DATABASE [QRBased] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QRBased] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QRBased] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QRBased] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QRBased] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QRBased] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QRBased', N'ON'
GO
ALTER DATABASE [QRBased] SET QUERY_STORE = ON
GO
ALTER DATABASE [QRBased] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QRBased]
GO
/****** Object:  User [localdb]    Script Date: 25-10-2024 18:49:28 ******/
CREATE USER [localdb] FOR LOGIN [localdb] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [localdb]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [localdb]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [localdb]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [localdb]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [localdb]
GO
ALTER ROLE [db_datareader] ADD MEMBER [localdb]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [localdb]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [localdb]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [localdb]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[OrderId] [varchar](255) NULL,
	[MenuItemID] [int] NULL,
	[Quantity] [int] NULL,
	[AddedDate] [datetime] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CartID] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dishes]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dishes](
	[DishId] [int] IDENTITY(1,1) NOT NULL,
	[DishName] [varchar](100) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Food] [varchar](10) NOT NULL,
	[Imageurl] [varchar](255) NULL,
	[Menuname] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DishId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Menuname] [varchar](20) NOT NULL,
	[Description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Menuname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ordereditems]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ordereditems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_name] [varchar](50) NULL,
	[OrderedItems] [varchar](255) NULL,
	[TableNumber] [int] NULL,
	[Date] [date] NULL,
	[Status] [nvarchar](100) NULL,
	[SessionCode] [varchar](20) NULL,
	[OrderId] [nvarchar](255) NULL,
	[CartId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderPaymentDetails]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderPaymentDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [varchar](50) NOT NULL,
	[PaymentId] [varchar](50) NULL,
	[PaymentStatus] [varchar](25) NULL,
	[PaymentSignature] [nvarchar](255) NULL,
	[CustomerName] [varchar](25) NULL,
	[TotalAmount] [decimal](10, 2) NULL,
	[OrderDate] [datetime] NULL,
	[TableNumber] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableLocks]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableLocks](
	[TableNumber] [int] NOT NULL,
	[IsLocked] [bit] NULL,
	[LockTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TableNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableSessions]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableSessions](
	[TableNumber] [int] NOT NULL,
	[SessionCode] [char](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TableNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[SessionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT (getdate()) FOR [AddedDate]
GO
ALTER TABLE [dbo].[TableLocks] ADD  DEFAULT ((0)) FOR [IsLocked]
GO
ALTER TABLE [dbo].[Dishes]  WITH CHECK ADD FOREIGN KEY([Menuname])
REFERENCES [dbo].[Menu] ([Menuname])
ON DELETE CASCADE
GO
/****** Object:  StoredProcedure [dbo].[CheckOrders]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CheckOrders]
@TableNumber INT
AS
BEGIN
    DECLARE @Status NVARCHAR(50);  -- Declare Status variable with appropriate data type

    SELECT @Status = SessionCode 
    FROM TableSessions
    WHERE TableNumber = @TableNumber;

    IF @Status IS NOT NULL AND @Status != ''
        BEGIN
            SET @Status = 'true';
        END
    ELSE
        BEGIN
            SET @Status = 'false';
        END
		 SELECT @Status AS Status;  -- Return the Status value
END;
GO
/****** Object:  StoredProcedure [dbo].[CheckTable]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[CheckTable]
@Tablenumber int
AS
Begin

select SessionCode from  TableSessions
Where TableNumber = @Tablenumber

END
GO
/****** Object:  StoredProcedure [dbo].[ClearOrders]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ClearOrders]
    @TableNumber INT
AS
BEGIN
    SET NOCOUNT ON; -- Prevents extra result sets from interfering with SELECT statements

    DECLARE @OrderID NVARCHAR(50);

    -- Use a cursor to iterate through each order for the specified table number
    DECLARE OrderCursor CURSOR FOR
    SELECT OrderID FROM OrderedItems WHERE TableNumber = @TableNumber;

    OPEN OrderCursor;
    FETCH NEXT FROM OrderCursor INTO @OrderID;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        DELETE FROM OrderedItems WHERE OrderID = @OrderID;
        DELETE FROM Cart WHERE OrderID = @OrderID;

        FETCH NEXT FROM OrderCursor INTO @OrderID;
    END

    CLOSE OrderCursor;
    DEALLOCATE OrderCursor;

    -- Call the ClearTable stored procedure
    EXEC [ClearTableSession] @TableNumber = @TableNumber;
END;

GO
/****** Object:  StoredProcedure [dbo].[ClearTable]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[ClearTable]
@tableNUmber int
AS
BEGIN
UPDATE TableSessions
SET SessionCode = '00000'  
WHERE TableNumber = @tableNUmber;
END
GO
/****** Object:  StoredProcedure [dbo].[ClearTableSession]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ClearTableSession]
    @TableNumber INT
AS
BEGIN
    -- Delete the specified table number and its associated session code
    DELETE FROM TableSessions WHERE TableNumber = @TableNumber;
    
    IF @@ROWCOUNT = 0
    BEGIN
        PRINT 'No matching table number found.';
    END
    ELSE
    BEGIN
        PRINT 'Table number and associated session code deleted successfully.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[CreatedCart]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[CreatedCart]
@OrderId nvarchar(255),
@MenuItemID int,
@Quantity int

AS
Begin


INSERT INTO Cart(OrderId, MenuItemID, Quantity, AddedDate) 
VALUES (@OrderId, @MenuItemID,@Quantity , CURRENT_TIMESTAMP);

select CartID from Cart Where Orderid =@OrderId;
END
GO
/****** Object:  StoredProcedure [dbo].[Get_Order_Details]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Order_Details]
    @TableNumber INT
AS
BEGIN 
    -- Error handling
    BEGIN TRY
        SELECT 
            oi.OrderID,
            d.DishName,
            d.Price,
            d.Food,
            d.Imageurl,
            c.Quantity
        FROM 
            OrderedItems oi
        JOIN 
            Cart c ON oi.OrderID = c.OrderID
        JOIN 
            Dishes d ON c.MenuItemID = d.DishID
        WHERE 
            oi.TableNumber = @TableNumber
        ORDER BY 
            oi.OrderID;
    END TRY
    BEGIN CATCH
        -- Handle errors
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[Get_Ordered_status]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create  Procedure [dbo].[Get_Ordered_status]
@OrderId nvarchar(255)
AS
BEGIN
select Status from Ordereditems
where OrderId = @OrderId
END
GO
/****** Object:  StoredProcedure [dbo].[Getlockstatus]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[Getlockstatus]
@tablenumber INT
As
begin 

SELECT IsLocked FROM TableLocks WHERE TableNumber = @tableNumber;

End



GO
/****** Object:  StoredProcedure [dbo].[Imageurl]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PRocedure [dbo].[Imageurl]
@Imageurl nvarchar(255)
As
BEGIN
UPDATE Dishes
SET ImageUrl = @Imageurl
WHERE DishId = 13;
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_Ordered_Items]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Insert_Ordered_Items]
@customername nvarchar(40) null,
@orderedItems  nvarchar(255) null,
@tablenumber int null,
@OrderId nvarchar(255)
AS
Begin
insert into Ordereditems( Customer_name,OrderedItems,TableNumber,OrderId) values (@customername,@orderedItems,@tablenumber,@OrderId)

End
GO
/****** Object:  StoredProcedure [dbo].[ManageTableLock]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ManageTableLock]
    @tableNumber INT,
    @action NVARCHAR(10) -- 'check', 'lock', or 'unlock'
AS
BEGIN
    SET NOCOUNT ON;

    IF @action = 'check'
    BEGIN
        -- Check if table is locked
        SELECT IsLocked 
        FROM TableLocks 
        WHERE TableNumber = @tableNumber;
    END
    ELSE IF @action = 'lock'
    BEGIN
        -- If not locked, lock it
        UPDATE TableLocks
        SET IsLocked = 1, LockTime = GETDATE()
        WHERE TableNumber = @tableNumber AND IsLocked = 0;
    END
    ELSE IF @action = 'unlock'
    BEGIN
        -- Unlock table after payment succeeds or fails
        UPDATE TableLocks
        SET IsLocked = 0, LockTime = NULL
        WHERE TableNumber = @tableNumber;
    END
    ELSE
    BEGIN
        RAISERROR('Invalid action. Use ''check'', ''lock'', or ''unlock''.', 16, 1);
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[PlaceOrder]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PlaceOrder]
    @p_CustomerName VARCHAR(50),     -- Customer name to be inserted
    @p_TableNumber INT,               -- Table number
    @p_OrderID VARCHAR(255),          -- Order ID
    @p_MenuItemIDs VARCHAR(MAX),       -- Comma-separated Menu Item IDs
    @p_Quantities VARCHAR(MAX)         -- Comma-separated Quantities
AS
BEGIN
    SET NOCOUNT ON; -- Prevent extra result sets from interfering

    DECLARE @CartID INT;
    DECLARE @SessionCode VARCHAR(20);
    DECLARE @Status VARCHAR(20);
    DECLARE @MenuItemID INT;
    DECLARE @Quantity INT;
    DECLARE @Pos INT;
    
    -- Step 1: Insert into Cart for each Menu Item and Quantity
    DECLARE @Index INT = 1;
    DECLARE @Delimiter CHAR(1) = ',';


	
DECLARE @NewCartID CHAR(5);

SET @NewCartID = RIGHT('00000' + CAST((ABS(CHECKSUM(NEWID())) % 100000) AS VARCHAR(5)), 5);

WHILE EXISTS (SELECT 1 FROM Cart WHERE CartID = @NewCartID)
BEGIN
    SET @NewCartID = RIGHT('00000' + CAST((ABS(CHECKSUM(NEWID())) % 100000) AS VARCHAR(5)), 5);
END







    WHILE LEN(@p_MenuItemIDs) > 0 AND LEN(@p_Quantities) > 0

    BEGIN
        SET @Pos = CHARINDEX(@Delimiter, @p_MenuItemIDs);
        IF @Pos = 0
        BEGIN
            SET @MenuItemID = CAST(@p_MenuItemIDs AS INT);  -- Last value
            SET @p_MenuItemIDs = '';  
        END
        ELSE
        BEGIN
            SET @MenuItemID = CAST(LEFT(@p_MenuItemIDs, @Pos - 1) AS INT);
            SET @p_MenuItemIDs = SUBSTRING(@p_MenuItemIDs, @Pos + 1, LEN(@p_MenuItemIDs) - @Pos);
        END
        
        -- Get Quantity
        SET @Pos = CHARINDEX(@Delimiter, @p_Quantities);
        IF @Pos = 0
        BEGIN
            SET @Quantity = CAST(@p_Quantities AS INT);  -- Last value
            SET @p_Quantities = '';  -- Empty it for next iteration
        END
        ELSE
        BEGIN
            SET @Quantity = CAST(LEFT(@p_Quantities, @Pos - 1) AS INT);
            SET @p_Quantities = SUBSTRING(@p_Quantities, @Pos + 1, LEN(@p_Quantities) - @Pos);
        END


        -- Insert into Cart
        INSERT INTO Cart (OrderID, MenuItemID, Quantity, AddedDate,CartID)
        VALUES (@p_OrderID, @MenuItemID, @Quantity, GETDATE(),@NewCartID);

        -- Get the last inserted CartID
        SET @CartID =@NewCartID;

        SET @Index = @Index + 1;
    END

-- Step 2: Check session code
    SELECT @SessionCode = SessionCode 
    FROM TableSessions 
    WHERE TableNumber = @p_TableNumber;

    IF @SessionCode IS NULL
    BEGIN
        -- If no session code found, create a new one
        EXEC UpsertTableSession @p_TableNumber;
        SELECT @SessionCode = SessionCode 
        FROM TableSessions 
        WHERE TableNumber = @p_TableNumber;
    END

    -- Step 3: Insert into OrderedItems
    INSERT INTO OrderedItems (Customer_name, TableNumber, Date, Status, SessionCode, OrderID, CartID)
    VALUES (@p_CustomerName, @p_TableNumber, GETDATE(), 'Pending', @SessionCode, @p_OrderID, @CartID);
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Get_Menu_Dishes]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[Sp_Get_Menu_Dishes]
as
Begin
Select * from menu
Select * from dishes

end
GO
/****** Object:  StoredProcedure [dbo].[sp_getOrderedItems]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getOrderedItems]
    @TableNumber INT
AS
BEGIN
    -- Select and concatenate the OrderedItems and OrderId into a formatted string
    SELECT STRING_AGG(CONCAT(OrderId, ':', OrderedItems), ', ') AS ConcatenatedOrderedItems
    FROM Ordereditems
    WHERE TableNumber = @TableNumber;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateOrderStatus]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateOrderStatus]
    @Purpose NVARCHAR(50),
    @OrderId NVARCHAR(255)
AS
BEGIN
    -- Check if Purpose is 'accept'
    IF @Purpose = 'accept'
    BEGIN
        UPDATE OrderedItems
        SET Status = 'Order Accepted and Preparing'
        WHERE OrderId = @OrderId;
    END
    -- Check if Purpose is 'Serve'
    ELSE IF @Purpose = 'Serve'
    BEGIN
        UPDATE OrderedItems
        SET Status = 'Served Enjoy Your Meal'
        WHERE OrderId = @OrderId;
    END
	ElSe 	IF @Purpose = 'reject'
	BEGIN
		UPDATE OrderedItems
        SET Status = 'Order Rejected(Respective amount will be refuned)'
        WHERE OrderId = @OrderId;
		END


    -- Optionally, handle cases where Purpose does not match known values
    ELSE
    BEGIN
        RAISERROR('Invalid purpose provided: %s', 16, 1, @Purpose);
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateSessionCode]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateSessionCode]
    @TableNumber INT
AS
BEGIN
    DECLARE @NewSessionCode CHAR(5);

    -- Generate a new unique session code
    WHILE (1 = 1)
    BEGIN
        SET @NewSessionCode = RIGHT('00000' + CAST((ABS(CHECKSUM(NEWID())) % 100000) AS VARCHAR(5)), 5);

        IF NOT EXISTS (SELECT 1 FROM TableSessions WHERE SessionCode = @NewSessionCode)
            BREAK;  -- Exit loop if the code is unique
    END

    -- Update the session code for the specified table number
    UPDATE TableSessions
    SET SessionCode = @NewSessionCode
    WHERE TableNumber = @TableNumber;
END;

GO
/****** Object:  StoredProcedure [dbo].[UpdateTablellock]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





Create procedure [dbo].[UpdateTablellock]
@tableNumber INT
AS
BEGIN
UPDATE TableLocks
SET IsLocked = 1, LockTime = GETDATE()
WHERE TableNumber = @tableNumber AND IsLocked = 0;

END

GO
/****** Object:  StoredProcedure [dbo].[UpsertTableSession]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpsertTableSession]
    @TableNumber INT
AS
BEGIN
    DECLARE @NewSessionCode CHAR(5);
    
    -- Check if the TableNumber already exists
    IF EXISTS (SELECT 1 FROM TableSessions WHERE TableNumber = @TableNumber)
    BEGIN
        -- If it exists, do nothing or return
        PRINT 'Table number already exists.';
        RETURN;
    END

    -- Generate a new unique session code
    WHILE (1 = 1)
    BEGIN
        SET @NewSessionCode = RIGHT('00000' + CAST((ABS(CHECKSUM(NEWID())) % 100000) AS VARCHAR(5)), 5);

        IF NOT EXISTS (SELECT 1 FROM TableSessions WHERE SessionCode = @NewSessionCode)
            BREAK;  -- Exit loop if the code is unique
    END

    -- Insert the new table number and session code
    INSERT INTO TableSessions (TableNumber, SessionCode)
    VALUES (@TableNumber, @NewSessionCode);
END;
GO
/****** Object:  StoredProcedure [dbo].[UspInsertOrder]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UspInsertOrder]
    @OrderId NVARCHAR(50),
    @TableNumber INT,
	@customername nvarchar(50),
    @Amount DECIMAL(10, 2),
	@paymentstatus nvarchar(50)
AS 
BEGIN
    INSERT INTO OrderPaymentDetails (OrderId, TableNumber, TotalAmount,PaymentStatus,customername) 
    VALUES (@OrderId, @TableNumber, @Amount,@paymentstatus,@customername);
END;
GO
/****** Object:  StoredProcedure [dbo].[uspInsertVerfiedPayment]    Script Date: 25-10-2024 18:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspInsertVerfiedPayment]
    @OrderId NVARCHAR(50),
    @PaymentId NVARCHAR(50),  -- Specify length for NVARCHAR
    @Signature NVARCHAR(255),  -- Specify length for NVARCHAR
    @PaymentStatus NVARCHAR(50)  -- Specify length for NVARCHAR
AS 
BEGIN
    UPDATE OrderPaymentDetails  -- Ensure this is the correct table name
SET 
    PaymentId = @PaymentId,
    PaymentSignature = @Signature,
    PaymentStatus = @PaymentStatus,
    OrderDate = GETDATE()  -- Correctly place a comma before OrderDate
WHERE 
    OrderId = @OrderId;

END;
GO
USE [master]
GO
ALTER DATABASE [QRBased] SET  READ_WRITE 
GO
