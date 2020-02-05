USE [DB_Gestion]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 02/05/2020 13:53:15 ******/
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
/****** Object:  Table [dbo].[type]    Script Date: 02/05/2020 13:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[type](
	[idType] [int] IDENTITY(1,1) NOT NULL,
	[nomTypeC] [varchar](50) NULL,
	[nomType] [varchar](50) NULL,
 CONSTRAINT [PK_idType] PRIMARY KEY CLUSTERED 
(
	[idType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fournisseur]    Script Date: 02/05/2020 13:53:15 ******/
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
/****** Object:  Table [dbo].[Etat]    Script Date: 02/05/2020 13:53:15 ******/
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
/****** Object:  Table [dbo].[Emballage]    Script Date: 02/05/2020 13:53:15 ******/
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
/****** Object:  Table [dbo].[Produit_finis]    Script Date: 02/05/2020 13:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Produit_finis](
	[codePF] [int] NOT NULL,
	[idE] [int] NOT NULL,
	[QtePF] [int] NULL,
	[codeEM] [int] NULL,
	[cordoPF] [varchar](20) NULL,
	[descPF] [varchar](50) NULL,
	[idPF] [int] IDENTITY(1,1) NOT NULL,
	[nomPF] [varchar](50) NULL,
	[idType] [int] NULL,
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
/****** Object:  Table [dbo].[Matiere_premiere]    Script Date: 02/05/2020 13:53:15 ******/
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
/****** Object:  Table [dbo].[historique_vente]    Script Date: 02/05/2020 13:53:15 ******/
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
/****** Object:  Table [dbo].[historique_achat]    Script Date: 02/05/2020 13:53:15 ******/
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
/****** Object:  ForeignKey [FK_idE4]    Script Date: 02/05/2020 13:53:15 ******/
ALTER TABLE [dbo].[Emballage]  WITH CHECK ADD  CONSTRAINT [FK_idE4] FOREIGN KEY([idE])
REFERENCES [dbo].[Etat] ([idE])
GO
ALTER TABLE [dbo].[Emballage] CHECK CONSTRAINT [FK_idE4]
GO
/****** Object:  ForeignKey [FK_RCF3]    Script Date: 02/05/2020 13:53:15 ******/
ALTER TABLE [dbo].[Emballage]  WITH CHECK ADD  CONSTRAINT [FK_RCF3] FOREIGN KEY([RCF])
REFERENCES [dbo].[Fournisseur] ([RCF])
GO
ALTER TABLE [dbo].[Emballage] CHECK CONSTRAINT [FK_RCF3]
GO
/****** Object:  ForeignKey [FK_idEM1]    Script Date: 02/05/2020 13:53:15 ******/
ALTER TABLE [dbo].[historique_achat]  WITH CHECK ADD  CONSTRAINT [FK_idEM1] FOREIGN KEY([idEM])
REFERENCES [dbo].[Emballage] ([idEM])
GO
ALTER TABLE [dbo].[historique_achat] CHECK CONSTRAINT [FK_idEM1]
GO
/****** Object:  ForeignKey [FK_idMP1]    Script Date: 02/05/2020 13:53:15 ******/
ALTER TABLE [dbo].[historique_achat]  WITH CHECK ADD  CONSTRAINT [FK_idMP1] FOREIGN KEY([idEM])
REFERENCES [dbo].[Matiere_premiere] ([idmp])
GO
ALTER TABLE [dbo].[historique_achat] CHECK CONSTRAINT [FK_idMP1]
GO
/****** Object:  ForeignKey [FK_RCF]    Script Date: 02/05/2020 13:53:15 ******/
ALTER TABLE [dbo].[historique_achat]  WITH CHECK ADD  CONSTRAINT [FK_RCF] FOREIGN KEY([RCF])
REFERENCES [dbo].[Fournisseur] ([RCF])
GO
ALTER TABLE [dbo].[historique_achat] CHECK CONSTRAINT [FK_RCF]
GO
/****** Object:  ForeignKey [FK_idPF]    Script Date: 02/05/2020 13:53:15 ******/
ALTER TABLE [dbo].[historique_vente]  WITH CHECK ADD  CONSTRAINT [FK_idPF] FOREIGN KEY([idPF])
REFERENCES [dbo].[Produit_finis] ([idPF])
GO
ALTER TABLE [dbo].[historique_vente] CHECK CONSTRAINT [FK_idPF]
GO
/****** Object:  ForeignKey [FK_RC_CIN]    Script Date: 02/05/2020 13:53:15 ******/
ALTER TABLE [dbo].[historique_vente]  WITH CHECK ADD  CONSTRAINT [FK_RC_CIN] FOREIGN KEY([RC_CIN])
REFERENCES [dbo].[Client] ([RC_CIN])
GO
ALTER TABLE [dbo].[historique_vente] CHECK CONSTRAINT [FK_RC_CIN]
GO
/****** Object:  ForeignKey [FK_idE2]    Script Date: 02/05/2020 13:53:15 ******/
ALTER TABLE [dbo].[Matiere_premiere]  WITH CHECK ADD  CONSTRAINT [FK_idE2] FOREIGN KEY([idE])
REFERENCES [dbo].[Etat] ([idE])
GO
ALTER TABLE [dbo].[Matiere_premiere] CHECK CONSTRAINT [FK_idE2]
GO
/****** Object:  ForeignKey [FK_RCF2]    Script Date: 02/05/2020 13:53:15 ******/
ALTER TABLE [dbo].[Matiere_premiere]  WITH CHECK ADD  CONSTRAINT [FK_RCF2] FOREIGN KEY([RCF])
REFERENCES [dbo].[Fournisseur] ([RCF])
GO
ALTER TABLE [dbo].[Matiere_premiere] CHECK CONSTRAINT [FK_RCF2]
GO
/****** Object:  ForeignKey [FK_idE]    Script Date: 02/05/2020 13:53:15 ******/
ALTER TABLE [dbo].[Produit_finis]  WITH CHECK ADD  CONSTRAINT [FK_idE] FOREIGN KEY([idE])
REFERENCES [dbo].[Etat] ([idE])
GO
ALTER TABLE [dbo].[Produit_finis] CHECK CONSTRAINT [FK_idE]
GO
/****** Object:  ForeignKey [FK_idType1]    Script Date: 02/05/2020 13:53:15 ******/
ALTER TABLE [dbo].[Produit_finis]  WITH CHECK ADD  CONSTRAINT [FK_idType1] FOREIGN KEY([idType])
REFERENCES [dbo].[type] ([idType])
GO
ALTER TABLE [dbo].[Produit_finis] CHECK CONSTRAINT [FK_idType1]
GO
