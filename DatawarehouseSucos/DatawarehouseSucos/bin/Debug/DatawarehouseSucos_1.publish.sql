﻿/*
Deployment script for DW_SUCOS

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "DW_SUCOS"
:setvar DefaultFilePrefix "DW_SUCOS"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Rename refactoring operation with key b98e651e-46ca-4da8-830c-6330751b1350 is skipped, element [dbo].[Dim_Cliente].[Id] (SqlSimpleColumn) will not be renamed to Cod_Cliente';


GO
PRINT N'Creating [dbo].[Dim_Cliente]...';


GO
CREATE TABLE [dbo].[Dim_Cliente] (
    [Cod_Cliente]   NVARCHAR (50) NOT NULL,
    [Desc_Cliente]  NCHAR (200)   NULL,
    [Cod_Cidade]    NCHAR (50)    NULL,
    [Desc_Cidade]   NCHAR (200)   NULL,
    [Cod_Estado]    NCHAR (50)    NULL,
    [Desc_Estado]   NCHAR (200)   NULL,
    [Cod_Regiao]    NCHAR (50)    NULL,
    [Desc_Regiao]   NCHAR (200)   NULL,
    [Cod_Segmento]  NCHAR (50)    NULL,
    [Desc_Segmento] NCHAR (200)   NULL,
    PRIMARY KEY CLUSTERED ([Cod_Cliente] ASC)
);


GO
-- Refactoring step to update target server with deployed transaction logs
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'b98e651e-46ca-4da8-830c-6330751b1350')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('b98e651e-46ca-4da8-830c-6330751b1350')

GO

GO
PRINT N'Update complete.';


GO
