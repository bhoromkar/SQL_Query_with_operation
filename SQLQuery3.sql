USE [Northwind]
GO
/****** Object:  StoredProcedure [dbo].[spAddNum]    Script Date: 12-09-2023 17:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[spAddNum]
@num1 int,
@num2 int,
@result int output
AS
begin 
set @result = @num1+@num2;
end	
