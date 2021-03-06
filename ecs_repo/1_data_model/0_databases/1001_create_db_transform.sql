-- CREATE_Staging_DB
USE [master]
GO

/****** Object:  Database [ECS_Transform]    Script Date: 4/07/2020 1:01:28 PM ******/
CREATE DATABASE [ECS_Transform]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ECS_Transform', FILENAME = N'D:\DB_Data_Files\ECS_Transform.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 16384KB ) -- CHANGE DIRECTORY
 LOG ON 
( NAME = N'ECS_Transform_log', FILENAME = N'E:\DB_Log_Files\ECS_Transform_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 16384KB ) -- CHANGE DIRECTORY
GO

ALTER DATABASE [ECS_Transform] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ECS_Transform].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [ECS_Transform] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [ECS_Transform] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [ECS_Transform] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [ECS_Transform] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [ECS_Transform] SET ARITHABORT OFF 
GO

ALTER DATABASE [ECS_Transform] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [ECS_Transform] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [ECS_Transform] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [ECS_Transform] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [ECS_Transform] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [ECS_Transform] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [ECS_Transform] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [ECS_Transform] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [ECS_Transform] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [ECS_Transform] SET  DISABLE_BROKER 
GO

ALTER DATABASE [ECS_Transform] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [ECS_Transform] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [ECS_Transform] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [ECS_Transform] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [ECS_Transform] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [ECS_Transform] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [ECS_Transform] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [ECS_Transform] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [ECS_Transform] SET  MULTI_USER 
GO

ALTER DATABASE [ECS_Transform] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [ECS_Transform] SET DB_CHAINING OFF 
GO

ALTER DATABASE [ECS_Transform] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [ECS_Transform] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [ECS_Transform] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [ECS_Transform] SET  READ_WRITE 
GO


