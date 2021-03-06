USE [DB_Gestionn]
GO
/****** Object:  User [admin]    Script Date: 02/17/2020 08:57:25 ******/
CREATE USER [admin] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [admins]    Script Date: 02/17/2020 08:57:25 ******/
CREATE USER [admins] FOR LOGIN [admins] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 02/17/2020 08:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Client](
	[RC_CIN] [varchar](50) NOT NULL,
	[nomClt] [varchar](50) NULL,
	[numTel] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[adresse] [varchar](50) NULL,
	[fidelite] [varchar](50) NULL,
 CONSTRAINT [PK_RC_CIN] PRIMARY KEY CLUSTERED 
(
	[RC_CIN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 02/17/2020 08:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Accounts](
	[username] [varchar](50) NOT NULL,
	[pass] [varchar](50) NULL,
	[PermLevel] [int] NULL,
 CONSTRAINT [PK_Username] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fournisseur]    Script Date: 02/17/2020 08:57:24 ******/
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
/****** Object:  Table [dbo].[Etat]    Script Date: 02/17/2020 08:57:24 ******/
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
/****** Object:  Table [dbo].[Emballage]    Script Date: 02/17/2020 08:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Emballage](
	[idE] [int] NOT NULL,
	[RCF] [varchar](50) NULL,
	[img] [image] NULL,
	[qteEM] [int] NULL,
	[supportEM] [int] NULL,
	[descEM] [varchar](50) NULL,
	[cordoEM] [varchar](50) NULL,
	[idEM] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_EM] PRIMARY KEY CLUSTERED 
(
	[idEM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ_idEM] UNIQUE NONCLUSTERED 
(
	[idEM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Matiere_premiere]    Script Date: 02/17/2020 08:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Matiere_premiere](
	[codeMP] [int] NOT NULL,
	[idE] [int] NOT NULL,
	[nomMP] [varchar](50) NULL,
	[RCF] [varchar](50) NULL,
	[qteMP] [int] NULL,
	[descMP] [varchar](100) NULL,
	[cordoMP] [varchar](10) NULL,
	[idmp] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_MP] PRIMARY KEY CLUSTERED 
(
	[codeMP] ASC,
	[idE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ_idMP] UNIQUE NONCLUSTERED 
(
	[idmp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_addacc]    Script Date: 02/17/2020 08:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_addacc] @username varchar(50), @password varchar(50),@PermLevl int
as
insert Accounts values (@username,Lower(CONVERT(VARCHAR(50),HashBytes('MD5', @password), 2)), @PermLevl)
GO
/****** Object:  Table [dbo].[historique_achat]    Script Date: 02/17/2020 08:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[historique_achat](
	[numAchat] [int] IDENTITY(1,1) NOT NULL,
	[RCF] [varchar](50) NULL,
	[qteA] [int] NULL,
	[prix] [money] NULL,
	[dateA] [datetime] NULL,
	[idEM] [int] NULL,
	[idMP] [int] NULL,
 CONSTRAINT [PK_numAchat] PRIMARY KEY CLUSTERED 
(
	[numAchat] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Produit_finis]    Script Date: 02/17/2020 08:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Produit_finis](
	[codePF] [int] NOT NULL,
	[QtePF] [int] NULL,
	[idEM] [int] NULL,
	[cordoPF] [varchar](20) NULL,
	[descPF] [varchar](50) NULL,
	[nomPF] [varchar](50) NULL,
	[nomPFA] [varchar](50) NOT NULL,
	[idPF] [int] IDENTITY(1,1) NOT NULL,
	[idE] [int] NULL,
 CONSTRAINT [PK_PF] PRIMARY KEY CLUSTERED 
(
	[codePF] ASC,
	[nomPFA] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ_idPF] UNIQUE NONCLUSTERED 
(
	[idPF] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[historique_vente]    Script Date: 02/17/2020 08:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[historique_vente](
	[numVente] [int] IDENTITY(1,1) NOT NULL,
	[idPF] [int] NULL,
	[RC_CIN] [varchar](50) NULL,
	[qteV] [int] NULL,
	[prix] [money] NULL,
	[dateV] [datetime] NULL,
 CONSTRAINT [PK_numVente] PRIMARY KEY CLUSTERED 
(
	[numVente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_idE4]    Script Date: 02/17/2020 08:57:24 ******/
ALTER TABLE [dbo].[Emballage]  WITH CHECK ADD  CONSTRAINT [FK_idE4] FOREIGN KEY([idE])
REFERENCES [dbo].[Etat] ([idE])
GO
ALTER TABLE [dbo].[Emballage] CHECK CONSTRAINT [FK_idE4]
GO
/****** Object:  ForeignKey [FK_RCF3]    Script Date: 02/17/2020 08:57:24 ******/
ALTER TABLE [dbo].[Emballage]  WITH CHECK ADD  CONSTRAINT [FK_RCF3] FOREIGN KEY([RCF])
REFERENCES [dbo].[Fournisseur] ([RCF])
GO
ALTER TABLE [dbo].[Emballage] CHECK CONSTRAINT [FK_RCF3]
GO
/****** Object:  ForeignKey [FK_idEM1]    Script Date: 02/17/2020 08:57:24 ******/
ALTER TABLE [dbo].[historique_achat]  WITH CHECK ADD  CONSTRAINT [FK_idEM1] FOREIGN KEY([idEM])
REFERENCES [dbo].[Emballage] ([idEM])
GO
ALTER TABLE [dbo].[historique_achat] CHECK CONSTRAINT [FK_idEM1]
GO
/****** Object:  ForeignKey [FK_idMP1]    Script Date: 02/17/2020 08:57:24 ******/
ALTER TABLE [dbo].[historique_achat]  WITH CHECK ADD  CONSTRAINT [FK_idMP1] FOREIGN KEY([idEM])
REFERENCES [dbo].[Matiere_premiere] ([idmp])
GO
ALTER TABLE [dbo].[historique_achat] CHECK CONSTRAINT [FK_idMP1]
GO
/****** Object:  ForeignKey [FK_RCF]    Script Date: 02/17/2020 08:57:24 ******/
ALTER TABLE [dbo].[historique_achat]  WITH CHECK ADD  CONSTRAINT [FK_RCF] FOREIGN KEY([RCF])
REFERENCES [dbo].[Fournisseur] ([RCF])
GO
ALTER TABLE [dbo].[historique_achat] CHECK CONSTRAINT [FK_RCF]
GO
/****** Object:  ForeignKey [FK_idPF]    Script Date: 02/17/2020 08:57:24 ******/
ALTER TABLE [dbo].[historique_vente]  WITH CHECK ADD  CONSTRAINT [FK_idPF] FOREIGN KEY([idPF])
REFERENCES [dbo].[Produit_finis] ([idPF])
GO
ALTER TABLE [dbo].[historique_vente] CHECK CONSTRAINT [FK_idPF]
GO
/****** Object:  ForeignKey [FK_RC_CIN]    Script Date: 02/17/2020 08:57:24 ******/
ALTER TABLE [dbo].[historique_vente]  WITH CHECK ADD  CONSTRAINT [FK_RC_CIN] FOREIGN KEY([RC_CIN])
REFERENCES [dbo].[Client] ([RC_CIN])
GO
ALTER TABLE [dbo].[historique_vente] CHECK CONSTRAINT [FK_RC_CIN]
GO
/****** Object:  ForeignKey [FK_idE2]    Script Date: 02/17/2020 08:57:24 ******/
ALTER TABLE [dbo].[Matiere_premiere]  WITH CHECK ADD  CONSTRAINT [FK_idE2] FOREIGN KEY([idE])
REFERENCES [dbo].[Etat] ([idE])
GO
ALTER TABLE [dbo].[Matiere_premiere] CHECK CONSTRAINT [FK_idE2]
GO
/****** Object:  ForeignKey [FK_RCF2]    Script Date: 02/17/2020 08:57:24 ******/
ALTER TABLE [dbo].[Matiere_premiere]  WITH CHECK ADD  CONSTRAINT [FK_RCF2] FOREIGN KEY([RCF])
REFERENCES [dbo].[Fournisseur] ([RCF])
GO
ALTER TABLE [dbo].[Matiere_premiere] CHECK CONSTRAINT [FK_RCF2]
GO
/****** Object:  ForeignKey [FK_idE1]    Script Date: 02/17/2020 08:57:24 ******/
ALTER TABLE [dbo].[Produit_finis]  WITH CHECK ADD  CONSTRAINT [FK_idE1] FOREIGN KEY([idE])
REFERENCES [dbo].[Etat] ([idE])
GO
ALTER TABLE [dbo].[Produit_finis] CHECK CONSTRAINT [FK_idE1]
GO
/****** Object:  ForeignKey [FK_Produit_finis_Emballage]    Script Date: 02/17/2020 08:57:24 ******/
ALTER TABLE [dbo].[Produit_finis]  WITH CHECK ADD  CONSTRAINT [FK_Produit_finis_Emballage] FOREIGN KEY([idEM])
REFERENCES [dbo].[Emballage] ([idEM])
GO
ALTER TABLE [dbo].[Produit_finis] CHECK CONSTRAINT [FK_Produit_finis_Emballage]
GO
