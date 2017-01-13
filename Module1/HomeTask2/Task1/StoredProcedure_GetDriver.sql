USE [QtaskDB]
GO

/****** Object:  StoredProcedure [dbo].[GetDrivers]    Script Date: 1/13/2017 4:38:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetDrivers] 
	@FirstName varchar(10),
	@LastName varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
  SELECT [FirstName]
      ,[LastName]
      ,[Birthdate]
	  FROM [QtaskDB].[dbo].[Driver]
	  WHERE [FirstName] = @FirstName
		AND
			[LastName] = @LastName
	   order by [FirstName];
	   END

GO


