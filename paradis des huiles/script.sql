USE [DB_Gestionn]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 02/15/2020 16:20:08 ******/
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
INSERT [dbo].[Client] ([RC_CIN], [nomClt], [numTel], [email], [adresse], [fidelite]) VALUES (N'123456789', N'laperta', N'05984848', N'laperta.qwe@gmail.com', N'zxccvbnvm,sdf,marrakesh', N'infidele')
INSERT [dbo].[Client] ([RC_CIN], [nomClt], [numTel], [email], [adresse], [fidelite]) VALUES (N'AA100109', N'karim chedmi', N'06984523', N'abdekrime.csa@hotmail.fr', N'qwertyuip,sdfs,rabat', N'fidele')
/****** Object:  Table [dbo].[Fournisseur]    Script Date: 02/15/2020 16:20:08 ******/
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
INSERT [dbo].[Fournisseur] ([RCF], [nomFournisseur], [numTel], [adresse], [email]) VALUES (N'159853', N'google', N'+31348975', N'chicago,1775,CA', N'google.google@google.google')
INSERT [dbo].[Fournisseur] ([RCF], [nomFournisseur], [numTel], [adresse], [email]) VALUES (N'456987', N'bic', N'05329847', N'poimnbjkh,kj,mekness', N'bic.bic@bic.bic')
/****** Object:  Table [dbo].[Etat]    Script Date: 02/15/2020 16:20:08 ******/
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
INSERT [dbo].[Etat] ([idE], [NomE], [UniteE]) VALUES (1, N'Solide', N'KG')
INSERT [dbo].[Etat] ([idE], [NomE], [UniteE]) VALUES (2, N'Liquide', N'L')
/****** Object:  Table [dbo].[Emballage]    Script Date: 02/15/2020 16:20:08 ******/
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
SET IDENTITY_INSERT [dbo].[Emballage] ON
INSERT [dbo].[Emballage] ([idE], [RCF], [img], [qteEM], [supportEM], [descEM], [cordoEM], [idEM]) VALUES (1, N'159853', NULL, 100, 100, N'good', N'E0S1', 1)
SET IDENTITY_INSERT [dbo].[Emballage] OFF
/****** Object:  Table [dbo].[Matiere_premiere]    Script Date: 02/15/2020 16:20:08 ******/
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
SET IDENTITY_INSERT [dbo].[Matiere_premiere] ON
INSERT [dbo].[Matiere_premiere] ([codeMP], [idE], [nomMP], [RCF], [qteMP], [descMP], [cordoMP], [idmp]) VALUES (1, 2, N'huil', N'456987', 300, N'good', N'E0S2', 1)
SET IDENTITY_INSERT [dbo].[Matiere_premiere] OFF
/****** Object:  Table [dbo].[historique_achat]    Script Date: 02/15/2020 16:20:08 ******/
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
SET IDENTITY_INSERT [dbo].[historique_achat] ON
INSERT [dbo].[historique_achat] ([numAchat], [RCF], [qteA], [prix], [dateA], [idEM], [idMP]) VALUES (1, N'456987', 300, 500.0000, CAST(0x0000918700000000 AS DateTime), NULL, 1)
INSERT [dbo].[historique_achat] ([numAchat], [RCF], [qteA], [prix], [dateA], [idEM], [idMP]) VALUES (2, N'159853', 900, 780.0000, CAST(0x0000A9C800000000 AS DateTime), 1, NULL)
SET IDENTITY_INSERT [dbo].[historique_achat] OFF
/****** Object:  Table [dbo].[Produit_finis]    Script Date: 02/15/2020 16:20:08 ******/
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
SET IDENTITY_INSERT [dbo].[Produit_finis] ON
INSERT [dbo].[Produit_finis] ([codePF], [QtePF], [idEM], [cordoPF], [descPF], [nomPF], [nomPFA], [idPF], [idE]) VALUES (1, 100, 1, N'E2S1', N'gooood', N'new huil', N'H', 1, 2)
INSERT [dbo].[Produit_finis] ([codePF], [QtePF], [idEM], [cordoPF], [descPF], [nomPF], [nomPFA], [idPF], [idE]) VALUES (2, 300, 1, N'E2S3', N'not bad', N'savon', N'S', 2, 1)
SET IDENTITY_INSERT [dbo].[Produit_finis] OFF
/****** Object:  Table [dbo].[historique_vente]    Script Date: 02/15/2020 16:20:08 ******/
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
SET IDENTITY_INSERT [dbo].[historique_vente] ON
INSERT [dbo].[historique_vente] ([numVente], [idPF], [RC_CIN], [qteV], [prix], [dateV]) VALUES (1, 1, N'AA100109', 5, 60.0000, CAST(0x0000B97A00000000 AS DateTime))
INSERT [dbo].[historique_vente] ([numVente], [idPF], [RC_CIN], [qteV], [prix], [dateV]) VALUES (2, 2, N'123456789', 100, 800.0000, CAST(0x0000C7BE00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[historique_vente] OFF
/****** Object:  ForeignKey [FK_idE4]    Script Date: 02/15/2020 16:20:08 ******/
ALTER TABLE [dbo].[Emballage]  WITH CHECK ADD  CONSTRAINT [FK_idE4] FOREIGN KEY([idE])
REFERENCES [dbo].[Etat] ([idE])
GO
ALTER TABLE [dbo].[Emballage] CHECK CONSTRAINT [FK_idE4]
GO
/****** Object:  ForeignKey [FK_RCF3]    Script Date: 02/15/2020 16:20:08 ******/
ALTER TABLE [dbo].[Emballage]  WITH CHECK ADD  CONSTRAINT [FK_RCF3] FOREIGN KEY([RCF])
REFERENCES [dbo].[Fournisseur] ([RCF])
GO
ALTER TABLE [dbo].[Emballage] CHECK CONSTRAINT [FK_RCF3]
GO
/****** Object:  ForeignKey [FK_idEM1]    Script Date: 02/15/2020 16:20:08 ******/
ALTER TABLE [dbo].[historique_achat]  WITH CHECK ADD  CONSTRAINT [FK_idEM1] FOREIGN KEY([idEM])
REFERENCES [dbo].[Emballage] ([idEM])
GO
ALTER TABLE [dbo].[historique_achat] CHECK CONSTRAINT [FK_idEM1]
GO
/****** Object:  ForeignKey [FK_idMP1]    Script Date: 02/15/2020 16:20:08 ******/
ALTER TABLE [dbo].[historique_achat]  WITH CHECK ADD  CONSTRAINT [FK_idMP1] FOREIGN KEY([idEM])
REFERENCES [dbo].[Matiere_premiere] ([idmp])
GO
ALTER TABLE [dbo].[historique_achat] CHECK CONSTRAINT [FK_idMP1]
GO
/****** Object:  ForeignKey [FK_idPF]    Script Date: 02/15/2020 16:20:08 ******/
ALTER TABLE [dbo].[historique_vente]  WITH CHECK ADD  CONSTRAINT [FK_idPF] FOREIGN KEY([idPF])
REFERENCES [dbo].[Produit_finis] ([idPF])
GO
ALTER TABLE [dbo].[historique_vente] CHECK CONSTRAINT [FK_idPF]
GO
/****** Object:  ForeignKey [FK_RC_CIN]    Script Date: 02/15/2020 16:20:08 ******/
ALTER TABLE [dbo].[historique_vente]  WITH CHECK ADD  CONSTRAINT [FK_RC_CIN] FOREIGN KEY([RC_CIN])
REFERENCES [dbo].[Client] ([RC_CIN])
GO
ALTER TABLE [dbo].[historique_vente] CHECK CONSTRAINT [FK_RC_CIN]
GO
/****** Object:  ForeignKey [FK_idE2]    Script Date: 02/15/2020 16:20:08 ******/
ALTER TABLE [dbo].[Matiere_premiere]  WITH CHECK ADD  CONSTRAINT [FK_idE2] FOREIGN KEY([idE])
REFERENCES [dbo].[Etat] ([idE])
GO
ALTER TABLE [dbo].[Matiere_premiere] CHECK CONSTRAINT [FK_idE2]
GO
/****** Object:  ForeignKey [FK_RCF2]    Script Date: 02/15/2020 16:20:08 ******/
ALTER TABLE [dbo].[Matiere_premiere]  WITH CHECK ADD  CONSTRAINT [FK_RCF2] FOREIGN KEY([RCF])
REFERENCES [dbo].[Fournisseur] ([RCF])
GO
ALTER TABLE [dbo].[Matiere_premiere] CHECK CONSTRAINT [FK_RCF2]
GO
/****** Object:  ForeignKey [FK_idE1]    Script Date: 02/15/2020 16:20:08 ******/
ALTER TABLE [dbo].[Produit_finis]  WITH CHECK ADD  CONSTRAINT [FK_idE1] FOREIGN KEY([idE])
REFERENCES [dbo].[Etat] ([idE])
GO
ALTER TABLE [dbo].[Produit_finis] CHECK CONSTRAINT [FK_idE1]
GO
/****** Object:  ForeignKey [FK_Produit_finis_Emballage]    Script Date: 02/15/2020 16:20:08 ******/
ALTER TABLE [dbo].[Produit_finis]  WITH CHECK ADD  CONSTRAINT [FK_Produit_finis_Emballage] FOREIGN KEY([idEM])
REFERENCES [dbo].[Emballage] ([idEM])
GO
ALTER TABLE [dbo].[Produit_finis] CHECK CONSTRAINT [FK_Produit_finis_Emballage]
GO
