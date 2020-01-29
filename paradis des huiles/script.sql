USE [master]
GO
/****** Object:  Database [DB_Gestion]    Script Date: 01/29/2020 17:42:02 ******/
CREATE DATABASE [DB_Gestion] ON  PRIMARY 
( NAME = N'DB_Gestion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\DB_Gestion.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB_Gestion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\DB_Gestion_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_Gestion] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_Gestion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_Gestion] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [DB_Gestion] SET ANSI_NULLS OFF
GO
ALTER DATABASE [DB_Gestion] SET ANSI_PADDING OFF
GO
ALTER DATABASE [DB_Gestion] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [DB_Gestion] SET ARITHABORT OFF
GO
ALTER DATABASE [DB_Gestion] SET AUTO_CLOSE ON
GO
ALTER DATABASE [DB_Gestion] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [DB_Gestion] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [DB_Gestion] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [DB_Gestion] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [DB_Gestion] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [DB_Gestion] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [DB_Gestion] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [DB_Gestion] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [DB_Gestion] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [DB_Gestion] SET  ENABLE_BROKER
GO
ALTER DATABASE [DB_Gestion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [DB_Gestion] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [DB_Gestion] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [DB_Gestion] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [DB_Gestion] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [DB_Gestion] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [DB_Gestion] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [DB_Gestion] SET  READ_WRITE
GO
ALTER DATABASE [DB_Gestion] SET RECOVERY SIMPLE
GO
ALTER DATABASE [DB_Gestion] SET  MULTI_USER
GO
ALTER DATABASE [DB_Gestion] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [DB_Gestion] SET DB_CHAINING OFF
GO
USE [DB_Gestion]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 01/29/2020 17:42:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Client](
	[RC_CIN] [varchar](50) NOT NULL,
	[nomClt] [varchar](50) NULL,
	[prenomClt] [varchar](50) NULL,
	[numTel] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[adresse] [varchar](50) NULL,
	[fidelite] [int] NULL,
 CONSTRAINT [PK_RC_CIN] PRIMARY KEY CLUSTERED 
(
	[RC_CIN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AType]    Script Date: 01/29/2020 17:42:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AType](
	[typeA] [int] NOT NULL,
	[nomA] [varchar](50) NULL,
 CONSTRAINT [PK_typeA] PRIMARY KEY CLUSTERED 
(
	[typeA] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fournisseur]    Script Date: 01/29/2020 17:42:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fournisseur](
	[RCF] [varchar](50) NOT NULL,
	[nomFournisseur] [varchar](50) NULL,
	[numTel] [varchar](50) NULL,
	[typeF] [int] NULL,
	[adresse] [varchar](50) NULL,
	[email] [varchar](50) NULL,
 CONSTRAINT [PK_RCF] PRIMARY KEY CLUSTERED 
(
	[RCF] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Etat]    Script Date: 01/29/2020 17:42:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Etat](
	[idE] [int] NOT NULL,
	[NomE] [varchar](50) NULL,
	[UniteE] [varchar](50) NULL,
 CONSTRAINT [PK_idE] PRIMARY KEY CLUSTERED 
(
	[idE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Emballage]    Script Date: 01/29/2020 17:42:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Emballage](
	[idEm] [int] NOT NULL,
	[codeEM] [int] NOT NULL,
	[idE] [int] NOT NULL,
	[RCF] [varchar](50) NULL,
	[img] [image] NULL,
	[qteEM] [int] NULL,
	[supportEM] [int] NULL,
	[descEM] [varchar](100) NULL,
	[cordoEM] [varchar](50) NULL,
 CONSTRAINT [PK_EM] PRIMARY KEY CLUSTERED 
(
	[idEm] ASC,
	[codeEM] ASC,
	[idE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Historique_Achat]    Script Date: 01/29/2020 17:42:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Historique_Achat](
	[numAchat] [int] NOT NULL,
	[typeA] [int] NULL,
	[RCF] [varchar](50) NULL,
	[qteA] [int] NULL,
	[prix] [money] NULL,
	[dateA] [datetime] NULL,
	[NumFac] [int] NULL,
 CONSTRAINT [PK_NumA] PRIMARY KEY CLUSTERED 
(
	[numAchat] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Produit_finis]    Script Date: 01/29/2020 17:42:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Produit_finis](
	[idPF] [int] NOT NULL,
	[codePF] [int] NOT NULL,
	[idE] [int] NOT NULL,
	[QtePF] [int] NULL,
	[codeEM] [int] NULL,
	[cordoPF] [varchar](20) NULL,
	[descPF] [varchar](50) NULL,
 CONSTRAINT [PK_PF] PRIMARY KEY CLUSTERED 
(
	[codePF] ASC,
	[idE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ_idPF] UNIQUE NONCLUSTERED 
(
	[idPF] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Matiere_premiere]    Script Date: 01/29/2020 17:42:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Matiere_premiere](
	[idMP] [int] NOT NULL,
	[codeMP] [int] NOT NULL,
	[idE] [int] NOT NULL,
	[RCF] [varchar](50) NULL,
	[nomMP] [varchar](50) NULL,
	[qteMP] [int] NULL,
	[descMP] [varchar](50) NULL,
	[cordoMP] [varchar](50) NULL,
 CONSTRAINT [PK_MP] PRIMARY KEY CLUSTERED 
(
	[idMP] ASC,
	[codeMP] ASC,
	[idE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Historique_vente]    Script Date: 01/29/2020 17:42:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Historique_vente](
	[numVente] [int] NOT NULL,
	[idPF] [int] NULL,
	[RC_CIN] [varchar](50) NULL,
	[qteV] [int] NULL,
	[prix] [money] NULL,
	[dateV] [datetime] NULL,
	[NumFac] [int] NULL,
 CONSTRAINT [PK_numVente] PRIMARY KEY CLUSTERED 
(
	[numVente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_idE1]    Script Date: 01/29/2020 17:42:03 ******/
ALTER TABLE [dbo].[Emballage]  WITH CHECK ADD  CONSTRAINT [FK_idE1] FOREIGN KEY([idE])
REFERENCES [dbo].[Etat] ([idE])
GO
ALTER TABLE [dbo].[Emballage] CHECK CONSTRAINT [FK_idE1]
GO
/****** Object:  ForeignKey [FK_RCF]    Script Date: 01/29/2020 17:42:03 ******/
ALTER TABLE [dbo].[Emballage]  WITH CHECK ADD  CONSTRAINT [FK_RCF] FOREIGN KEY([RCF])
REFERENCES [dbo].[Fournisseur] ([RCF])
GO
ALTER TABLE [dbo].[Emballage] CHECK CONSTRAINT [FK_RCF]
GO
/****** Object:  ForeignKey [FK_RCF1]    Script Date: 01/29/2020 17:42:03 ******/
ALTER TABLE [dbo].[Historique_Achat]  WITH CHECK ADD  CONSTRAINT [FK_RCF1] FOREIGN KEY([RCF])
REFERENCES [dbo].[Fournisseur] ([RCF])
GO
ALTER TABLE [dbo].[Historique_Achat] CHECK CONSTRAINT [FK_RCF1]
GO
/****** Object:  ForeignKey [FK_idE]    Script Date: 01/29/2020 17:42:03 ******/
ALTER TABLE [dbo].[Produit_finis]  WITH CHECK ADD  CONSTRAINT [FK_idE] FOREIGN KEY([idE])
REFERENCES [dbo].[Etat] ([idE])
GO
ALTER TABLE [dbo].[Produit_finis] CHECK CONSTRAINT [FK_idE]
GO
/****** Object:  ForeignKey [FK_F]    Script Date: 01/29/2020 17:42:03 ******/
ALTER TABLE [dbo].[Matiere_premiere]  WITH CHECK ADD  CONSTRAINT [FK_F] FOREIGN KEY([RCF])
REFERENCES [dbo].[Fournisseur] ([RCF])
GO
ALTER TABLE [dbo].[Matiere_premiere] CHECK CONSTRAINT [FK_F]
GO
/****** Object:  ForeignKey [FK_ïdE]    Script Date: 01/29/2020 17:42:03 ******/
ALTER TABLE [dbo].[Matiere_premiere]  WITH CHECK ADD  CONSTRAINT [FK_ïdE] FOREIGN KEY([idE])
REFERENCES [dbo].[Etat] ([idE])
GO
ALTER TABLE [dbo].[Matiere_premiere] CHECK CONSTRAINT [FK_ïdE]
GO
/****** Object:  ForeignKey [FK_idPF]    Script Date: 01/29/2020 17:42:03 ******/
ALTER TABLE [dbo].[Historique_vente]  WITH CHECK ADD  CONSTRAINT [FK_idPF] FOREIGN KEY([idPF])
REFERENCES [dbo].[Produit_finis] ([idPF])
GO
ALTER TABLE [dbo].[Historique_vente] CHECK CONSTRAINT [FK_idPF]
GO
/****** Object:  ForeignKey [FK_RC_CIN]    Script Date: 01/29/2020 17:42:03 ******/
ALTER TABLE [dbo].[Historique_vente]  WITH CHECK ADD  CONSTRAINT [FK_RC_CIN] FOREIGN KEY([RC_CIN])
REFERENCES [dbo].[Client] ([RC_CIN])
GO
ALTER TABLE [dbo].[Historique_vente] CHECK CONSTRAINT [FK_RC_CIN]
GO
