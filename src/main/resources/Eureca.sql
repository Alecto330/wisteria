USE [Wisteria]
GO
/****** Object:  Table [dbo].[CV]    Script Date: 05/12/2024 12:51:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CV](
	[cf] [varchar](16) NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[cognome] [varchar](50) NOT NULL,
	[DataDiNascita] [date] NOT NULL,
	[Residenza] [varchar](50) NULL,
	[TitoloDiStudio] [varchar](50) NULL,
	[curriculum] [varbinary](max) NULL,
	[fotoProfilo] [image] NULL,
	[telefono] [varchar](14) NULL,
	[FK_Utente] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[cf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Domanda]    Script Date: 05/12/2024 12:51:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Domanda](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[domanda] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Esperienza]    Script Date: 05/12/2024 12:51:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Esperienza](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titolo] [varchar](50) NOT NULL,
	[esperienza] [varchar](1000) NOT NULL,
	[FK_CV] [varchar](16) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListaDomande]    Script Date: 05/12/2024 12:51:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListaDomande](
	[FK_Domanda] [int] NOT NULL,
	[FK_Posizione] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FK_Domanda] ASC,
	[FK_Posizione] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localita]    Script Date: 05/12/2024 12:51:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localita](
	[provincia] [varchar](25) NOT NULL,
	[regione] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posizione]    Script Date: 05/12/2024 12:51:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posizione](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titolo] [varchar](50) NOT NULL,
	[descrizione] [varchar](5000) NOT NULL,
	[settore] [varchar](50) NOT NULL,
	[utente_scelto] [varchar](30) NULL,
	[FK_Localita] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Risposta]    Script Date: 05/12/2024 12:51:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Risposta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[risposta] [varchar](500) NULL,
	[VoF] [bit] NULL,
	[FK_Domanda] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SiCandida]    Script Date: 05/12/2024 12:51:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiCandida](
	[FK_Posizione] [int] NOT NULL,
	[FK_Utente] [varchar](30) NOT NULL,
	[punteggio] [tinyint] NULL,
	[data] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[FK_Posizione] ASC,
	[FK_Utente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoftSkill]    Script Date: 05/12/2024 12:51:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoftSkill](
	[FK_Utente] [varchar](30) NOT NULL,
	[skill_1] [bit] NULL,
	[skill_2] [bit] NULL,
	[skill_3] [bit] NULL,
	[skill_4] [bit] NULL,
	[skill_5] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[FK_Utente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utente]    Script Date: 05/12/2024 12:51:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utente](
	[username] [varchar](30) NOT NULL,
	[pw] [varchar](100) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[ruolo] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'A123456789012345', N'Alessandro', N'Lombardi', CAST(N'1988-09-11' AS Date), N'Verona', N'Laurea in Economia Aziendale', NULL, NULL, NULL, N'user36')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'A901234567890123', N'Silvia', N'Gialli', CAST(N'1992-05-24' AS Date), N'Catania, Italia', N'Laurea in Biologia', NULL, NULL, NULL, N'user33')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'B012345678901234', N'Giovanni', N'Verdi', CAST(N'1990-09-09' AS Date), N'Milano, Italia', N'Master in Marketing e Comunicazione', NULL, NULL, NULL, N'user34')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'B234567890123456', N'Giulia', N'Martini', CAST(N'1991-03-15' AS Date), N'Bari', N'Laurea in Giurisprudenza', NULL, NULL, NULL, N'user37')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'C123456789012345', N'Elena', N'Neri', CAST(N'1986-12-30' AS Date), N'Roma, Italia', N'Laurea in Filosofia', NULL, NULL, NULL, N'user35')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'C345678901234567', N'Emanuele', N'Ricci', CAST(N'1985-12-01' AS Date), N'Genova', N'Laurea in Chimica', NULL, NULL, NULL, N'user38')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'CF0001', N'Mario', N'Rossi', CAST(N'1990-01-15' AS Date), N'Roma', N'Laurea', NULL, NULL, NULL, N'user1')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'CF0002', N'Luca', N'Bianchi', CAST(N'1988-04-20' AS Date), N'Milano', N'Diploma', NULL, NULL, NULL, N'user2')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'CF0003', N'Giulia', N'Verdi', CAST(N'1995-07-10' AS Date), N'Torino', N'Laurea', NULL, NULL, NULL, N'user3')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'CF0004', N'Marco', N'Neri', CAST(N'1992-03-25' AS Date), N'Napoli', N'Master', NULL, NULL, NULL, N'user4')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'CF0005', N'Francesca', N'Gialli', CAST(N'1994-06-05' AS Date), N'Bologna', N'Laurea', NULL, NULL, NULL, N'user5')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'CF0006', N'Alessandro', N'Cioffi', CAST(N'1989-02-10' AS Date), N'Genova', N'Laurea', NULL, NULL, NULL, N'user6')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'CF0007', N'Sofia', N'Lombardi', CAST(N'1993-11-14' AS Date), N'Palermo', N'Diploma', NULL, NULL, NULL, N'user7')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'CF0008', N'Davide', N'Marini', CAST(N'1991-08-30' AS Date), N'Firenze', N'Laurea', NULL, NULL, NULL, N'user8')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'CF0009', N'Elisa', N'Corti', CAST(N'1990-01-22' AS Date), N'Torino', N'Master', NULL, NULL, NULL, N'user9')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'CF0010', N'Nicola', N'Giovanni', CAST(N'1992-10-17' AS Date), N'Napoli', N'Laurea', NULL, NULL, NULL, N'user10')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'CF0011', N'Giuseppe', N'Mancini', CAST(N'1987-05-10' AS Date), N'Bari', N'Laurea', NULL, NULL, NULL, N'user11')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'CF0012', N'Laura', N'Rinaldi', CAST(N'1995-06-15' AS Date), N'Milano', N'Diploma', NULL, NULL, NULL, N'user12')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'CF0013', N'Stefano', N'Pellegrini', CAST(N'1991-03-10' AS Date), N'Padova', N'Master', NULL, NULL, NULL, N'user13')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'CF0014', N'Martina', N'Ricci', CAST(N'1989-12-01' AS Date), N'Roma', N'Laurea', NULL, NULL, NULL, N'user14')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'CF0015', N'Andrea', N'Ferrari', CAST(N'1992-07-05' AS Date), N'Venezia', N'Diploma', NULL, NULL, NULL, N'user15')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'CF0016', N'Lorenzo', N'Melo', CAST(N'1994-09-25' AS Date), N'Pisa', N'Laurea', NULL, NULL, NULL, N'user16')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'CF0017', N'Simone', N'Parisi', CAST(N'1993-04-10' AS Date), N'Ancona', N'Master', NULL, NULL, NULL, N'user17')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'CF0018', N'Giorgia', N'Vitali', CAST(N'1990-11-30' AS Date), N'Torino', N'Laurea', NULL, NULL, NULL, N'user18')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'CF0019', N'Francesco', N'Sanna', CAST(N'1992-06-10' AS Date), N'Cagliari', N'Master', NULL, NULL, NULL, N'user19')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'CF0020', N'Martina', N'Moretti', CAST(N'1993-08-21' AS Date), N'Napoli', N'Diploma', NULL, NULL, NULL, N'user20')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'D456789012345678', N'Elena', N'Fontana', CAST(N'1994-04-22' AS Date), N'Venezia', N'Laurea in Sociologia', NULL, NULL, NULL, N'user39')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'E567890123456789', N'Marco', N'Marini', CAST(N'1990-06-30' AS Date), N'Firenze', N'Laurea in Marketing', NULL, NULL, NULL, N'user40')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'F678901234567890', N'Francesco', N'Di Marco', CAST(N'1986-08-14' AS Date), N'Milano', N'Laurea in Ingegneria', NULL, NULL, NULL, N'user41')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'G789012345678901', N'Giorgia', N'Bianchi', CAST(N'1992-02-20' AS Date), N'Torino', N'Laurea in Matematica', NULL, NULL, NULL, N'user42')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'GVSEMR85M01H501X', N'Giarmeno', N'Evasore', CAST(N'1993-03-18' AS Date), NULL, NULL, NULL, NULL, NULL, N'Evasigia')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'H890123456789012', N'Gianluca', N'Rossi', CAST(N'1989-05-25' AS Date), N'Napoli', N'Laurea in Informatica', NULL, NULL, NULL, N'user43')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'I901234567890123', N'Isabella', N'Verdi', CAST(N'1985-11-07' AS Date), N'Roma', N'Laurea in Psicologia', NULL, NULL, NULL, N'user44')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'J012345678901234', N'Luca', N'Martino', CAST(N'1990-01-30' AS Date), N'Bologna', N'Laurea in Scienze Politiche', NULL, NULL, NULL, N'user45')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'K123456789012345', N'Laura', N'Milan', CAST(N'1993-09-22' AS Date), N'Catania', N'Laurea in Architettura', NULL, NULL, NULL, N'user46')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'L234567890123456', N'Lorenzo', N'Fiore', CAST(N'1988-04-15' AS Date), N'Firenze', N'Laurea in Filosofia', NULL, NULL, NULL, N'user47')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'LVNNTR99E16G942Y', N'Anterio', N'Lavanda', CAST(N'1999-05-16' AS Date), N'Potenza', N'Master in biochimica', NULL, NULL, NULL, N'Can01')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'M345678901234567', N'Marco', N'Giordano', CAST(N'1995-12-05' AS Date), N'Venezia', N'Laurea in Medicina', NULL, NULL, NULL, N'user48')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'N456789012345678', N'Nicola', N'Galli', CAST(N'1991-07-19' AS Date), N'Genova', N'Laurea in Economia', NULL, NULL, NULL, N'user49')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'NKEHMT05C24L219N', N'Helmut', N'Neik', CAST(N'2005-03-24' AS Date), N'Torino', N'Diploma in Informatica', NULL, NULL, NULL, N'Can03')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'O567890123456789', N'Olga', N'Ferrari', CAST(N'1987-02-10' AS Date), N'Verona', N'Laurea in Biologia', NULL, NULL, NULL, N'user50')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'P678901234567890', N'Pietro', N'Mariani', CAST(N'1989-12-18' AS Date), N'Pescara', N'Laurea in Ingegneria Civile', NULL, NULL, NULL, N'user51')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'Q789012345678901', N'Quirino', N'Pellegrini', CAST(N'1992-04-05' AS Date), N'Salerno', N'Laurea in Agronomia', NULL, NULL, NULL, N'user52')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'R890123456789012', N'Riccardo', N'Lombardo', CAST(N'1990-03-22' AS Date), N'Rimini', N'Laurea in Ingegneria Elettrica', NULL, NULL, NULL, N'user53')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'S901234567890123', N'Simona', N'Neri', CAST(N'1993-11-02' AS Date), N'Bari', N'Laurea in Medicina Veterinaria', NULL, NULL, NULL, N'user54')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'T012345678901234', N'Tommaso', N'Moro', CAST(N'1994-09-12' AS Date), N'Torino', N'Laurea in Lingue Straniere', NULL, NULL, NULL, N'user55')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'T234567890123456', N'Marco', N'Rossi', CAST(N'1993-01-05' AS Date), N'Milano, Italia', N'Laurea Triennale in Informatica', NULL, NULL, NULL, N'user26')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'TTMLRE92P30F205X', N'Eulero', N'Ottomano', CAST(N'1992-09-30' AS Date), N'Milano', N'Laurea in Economia', NULL, NULL, NULL, N'Can04')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'TTRNVR02T49L424Y', N'Nevrei', N'Ettern', CAST(N'2002-12-09' AS Date), N'Trieste', N'Laurea in Ingegneria Informatica', NULL, NULL, NULL, N'Can02')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'U123456789012345', N'Ugo', N'Fabbri', CAST(N'1986-06-30' AS Date), N'Lecce', N'Laurea in Ingegneria Informatica', NULL, NULL, NULL, N'user56')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'U345678901234567', N'Giulia', N'Bianchi', CAST(N'1990-04-20' AS Date), N'Roma, Italia', N'Laurea Magistrale in Economia', NULL, NULL, NULL, N'user27')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'V234567890123456', N'Veronica', N'Santi', CAST(N'1989-11-17' AS Date), N'Palermo', N'Laurea in Design Industriale', NULL, NULL, NULL, N'user57')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'V456789012345678', N'Carla', N'Verdi', CAST(N'1988-10-14' AS Date), N'Firenze, Italia', N'Laurea Triennale in Psicologia', NULL, NULL, NULL, N'user28')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'V567890123456789', N'Luca', N'Neri', CAST(N'1989-07-03' AS Date), N'Firenze, Italia', N'Laurea Triennale in Ingegneria', NULL, NULL, NULL, N'user25')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'VRTMKL87E05C933R', N'Mikael', N'Verte', CAST(N'1997-05-05' AS Date), N'Como', N'Diploma di Liceo Linguistico', NULL, NULL, NULL, N'Can05')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'W345678901234567', N'Walter', N'Franchi', CAST(N'1992-05-23' AS Date), N'Cagliari', N'Laurea in Biotecnologie', NULL, NULL, NULL, N'user58')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'W456789012345678', N'Anna', N'Gialli', CAST(N'1992-02-15' AS Date), N'Torino, Italia', N'Diploma di Perito Informatico', NULL, NULL, NULL, N'user24')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'W567890123456789', N'Luca', N'Gialli', CAST(N'1995-03-03' AS Date), N'Napoli, Italia', N'Diploma di Tecnico Informatico', NULL, NULL, NULL, N'user29')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'X345678901234567', N'Marco', N'Verdi', CAST(N'1985-11-10' AS Date), N'Napoli, Italia', N'Master in Ingegneria Elettronica', NULL, NULL, NULL, N'user23')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'X456789012345678', N'Xenia', N'Ricci', CAST(N'1990-04-10' AS Date), N'Trieste', N'Laurea in Lettere', NULL, NULL, NULL, N'user59')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'X678901234567890', N'Francesco', N'Neri', CAST(N'1987-07-15' AS Date), N'Torino, Italia', N'Laurea Triennale in Fisica', NULL, NULL, NULL, N'user30')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'Y234567890123456', N'Laura', N'Bianchi', CAST(N'1988-08-21' AS Date), N'Milano, Italia', N'Laurea Triennale in Matematica', NULL, NULL, NULL, N'user22')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'Y567890123456789', N'Ylenia', N'Moretti', CAST(N'1995-08-28' AS Date), N'Napoli', N'Laurea in Scienze della Comunicazione', NULL, NULL, NULL, N'user60')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'Y789012345678901', N'Anna', N'Bianchi', CAST(N'1991-08-19' AS Date), N'Bologna, Italia', N'Master in Gestione Aziendale', NULL, NULL, NULL, N'user31')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'Z123456789012345', N'Giovanni', N'Rossi', CAST(N'1990-05-12' AS Date), N'Roma, Italia', N'Laurea Magistrale in Informatica', NULL, NULL, NULL, N'user21')
GO
INSERT [dbo].[CV] ([cf], [nome], [cognome], [DataDiNascita], [Residenza], [TitoloDiStudio], [curriculum], [fotoProfilo], [telefono], [FK_Utente]) VALUES (N'Z890123456789012', N'Davide', N'Rossi', CAST(N'1989-11-12' AS Date), N'Genova, Italia', N'Diploma di Maturità Scientifica', NULL, NULL, NULL, N'user32')
GO
SET IDENTITY_INSERT [dbo].[Domanda] ON 
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (30, N'Che cosa e'' un "cloudformation" in Amazon Web Services (AWS)?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (48, N'Che cosa e'' un prototipo interattivo?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (10, N'Che cosa rappresenta un "dataset"?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (4, N'Che cos''è il phishing?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (39, N'Cos e'' il design responsivo?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (47, N'Cos e'' la progettazione mobile-first?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (17, N'Cos e'' l''Infrastructure as Code (IaC)?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (50, N'Cos e'' un API RESTful?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (20, N'Cos e'' un test di regressione?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (44, N'Cos e'' un wireframe?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (24, N'Cos e'' una pipeline di dati?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (14, N'Cosa fa Docker in un contesto DevOps?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (52, N'Cosa si intende con "scalabilita''" in un applicazione back-end?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (26, N'In quale situazione e'' piu'' adatto l''uso del deep learning?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (43, N'In quale situazioni e'' piu'' vantaggioso usare React rispetto a Angular?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (22, N'Perche'' e'' importante l''automazione dei test nel''ciclo di vita del software?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (33, N'Qual e'' il principale scopo di Kubernetes in un ambiente cloud?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (11, N'Qual è il ruolo principale di un consulente tecnico?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (37, N'Qual e'' la differenza tra HTMl''e CSS?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (21, N'Qual e'' la differenza tra un test di unita'' e un test di integrazione?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (54, N'Qual e'' la funzione principale di un ORM (Object-Relational Mapper)?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (7, N'Qual è la metodologia più comune per la gestione dei progetti IT?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (41, N'Qual e'' la principale funzione di React?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (13, N'Qual e'' la principale funzione di un architettura CI/CD?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (3, N'Qual è la principale funzione di un firewall?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (18, N'Qual e'' lo scopo principale dei test di carico?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (55, N'Qual e'' lo scopo principale del continuous deployment (CD)?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (58, N'Qual e'' l''obiettivo principale della crittografia nei sistemi informatici?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (5, N'Qual è l''obiettivo principale di un Sales Manager?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (8, N'Qual è un documento chiave in un progetto IT?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (31, N'Qual e'' una buona pratica di sicurezza nel''cloud?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (28, N'Qual e'' uno dei vantaggi principali dell''utilizzo del cloud rispetto a una soluzione on-premise?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (12, N'Quale competenza è fondamentale per un consulente tecnico?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (46, N'Quale di queste e'' una pratica importante nella progettazione di un esperienza utente (UX)?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (57, N'Quale di queste normative riguarda la protezione dei dati personali?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (32, N'Quale di queste piattaforme di cloud computing e'' offerta da Microsoft?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (53, N'Quale di questi linguaggi e'' utilizzato principalmente per lo sviluppo back-end?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (25, N'Quale di questi strumenti e'' comunemente usato per la visualizzazione dei dati?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (15, N'Quale di questi strumenti e'' usato per la gestione dei cluster Kubernetes?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (45, N'Quale di questi strumenti e'' utilizzato per creare prototipi interattivi?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (40, N'Quale di questi strumenti viene utilizzato per il versionamento del codice?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (51, N'Quale di questi strumenti viene utilizzato per la gestione dei database relazionali?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (29, N'Quale di questi strumenti viene utilizzato per l''automazione delle infrastrutture cloud?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (56, N'Quale di questi strumenti viene utilizzato per monitorare la sicurezza delle reti aziendali?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (2, N'Quale framework è popolare per lo sviluppo back-end in Node.js?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (38, N'Quale framework JavaScript e'' noto per la sua velocita'' e la creazione di interfacce utente moderne?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (6, N'Quale KPI è fondamentale per un Sales Manager?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (1, N'Quale linguaggio di programmazione è comunemente usato per lo sviluppo front-end?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (16, N'Quale piattaforma cloud e'' piÃ¹ comunemente utilizzata per DevOps?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (42, N'Quale proprieta'' CSS permette di centrare un elemento orizzontalmente?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (9, N'Quale strumento è spesso usato per l''analisi dei dati?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (19, N'Quale strumento viene comunemente usato per l''automazione dei test?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (23, N'Quale tecnica di machine learning e'' utilizzata per classificare i dati in categorie?')
GO
INSERT [dbo].[Domanda] ([id], [domanda]) VALUES (49, N'Quale tecnica di testing e'' utilizzata per raccogliere feedback dagli utenti sulla facilita'' d uso di un design?')
GO
SET IDENTITY_INSERT [dbo].[Domanda] OFF
GO
SET IDENTITY_INSERT [dbo].[Esperienza] ON 
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (1, N'Sviluppatore Software', N'Progettazione e sviluppo di applicazioni web per clienti aziendali, con focus su soluzioni scalabili e ottimizzazione delle performance. Collaborazione con team multidisciplinari per garantire una Utente experience eccellente.', N'TTRNVR02T49L424Y')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (2, N'Analista di Sistemi', N'Analisi delle esigenze aziendali e traduzione in requisiti tecnici per il miglioramento dei processi. Implementazione di sistemi ICT e monitoraggio delle prestazioni per massimizzare l efficienza operativa.', N'NKEHMT05C24L219N')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (3, N'Sales Account', N'Gestione di un portafoglio clienti, sviluppo di strategie di vendita e mantenimento di relazioni durature. Raggiungimento e superamento degli obiettivi di vendita attraverso presentazioni persuasive e analisi di mercato.', N'TTRNVR02T49L424Y')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (4, N'Project Manager IT', N'Coordinamento di progetti software dalla pianificazione all implementazione. Gestione del team e delle risorse, monitoraggio delle scadenze e dei budget per garantire la consegna puntuale dei risultati.', N'VRTMKL87E05C933R')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (5, N'Specialista in Sicurezza Informatica', N'Valutazione e implementazione di misure di sicurezza per proteggere i sistemi informatici aziendali. Monitoraggio delle vulnerabilità e formazione del personale sulle best practices di cybersecurity.', N'LVNNTR99E16G942Y')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (6, N'Responsabile Marketing Digitale', N'Sviluppo e attuazione di campagne di marketing digitale per promuovere prodotti e servizi ICT. Analisi dei dati e ottimizzazione delle strategie per migliorare la visibilità online e aumentare le conversioni.', N'LVNNTR99E16G942Y')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (7, N'Consulente IT', N'Fornitura di consulenze strategiche per l implementazione di soluzioni tecnologiche su misura. Collaborazione con le aziende per identificare opportunità di innovazione e ottimizzazione dei processi, garantendo un ritorno sull investimento significativo.', N'TTMLRE92P30F205X')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (8, N'Sviluppatore Software', N'Sviluppo applicazioni web usando Java e SQL', N'CF0001')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (9, N'Frontend Developer', N'Sviluppo di interfacce utente con HTML, CSS e JavaScript', N'CF0001')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (10, N'Database Administrator', N'Gestione database MySQL e PostgreSQL', N'CF0001')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (11, N'Analista Programmatore', N'Analisi e progettazione di software aziendale', N'CF0002')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (12, N'Web Developer', N'Sviluppo di applicazioni web in PHP e MySQL', N'CF0002')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (13, N'Sistemista', N'Gestione e manutenzione dei server Linux', N'CF0002')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (14, N'Project Manager', N'Gestione di progetti software di grandi dimensioni', N'CF0003')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (15, N'Team Lead', N'Coordinamento del team di sviluppo software', N'CF0003')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (16, N'Business Consultant', N'Consulenza per l''ottimizzazione dei processi aziendali', N'CF0003')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (17, N'Designer UI/UX', N'Progettazione interfacce utente per applicazioni web', N'CF0004')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (18, N'Product Designer', N'Progettazione grafica e interfacce per software mobile', N'CF0004')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (19, N'Interaction Designer', N'Progettazione dell''interazione utente per applicazioni mobile', N'CF0004')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (20, N'Marketing Specialist', N'Analisi dei mercati e sviluppo di strategie marketing', N'CF0005')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (21, N'SEO Specialist', N'Ottimizzazione per i motori di ricerca', N'CF0005')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (22, N'Social Media Expert', N'Gestione delle comunicazioni e delle campagne social', N'CF0005')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (23, N'Software Engineer', N'Design e sviluppo di software per applicazioni aziendali', N'CF0006')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (24, N'Backend Developer', N'Sviluppo di servizi backend in Java e Node.js', N'CF0006')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (25, N'Cloud Engineer', N'Gestione di infrastrutture cloud con AWS e Azure', N'CF0006')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (26, N'Sales Manager', N'Gestione vendite e analisi del mercato di riferimento', N'CF0007')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (27, N'Sales Consultant', N'Consulenza per le strategie di vendita', N'CF0007')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (28, N'Sales Development Representative', N'Gestione contatti e lead per il reparto vendite', N'CF0007')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (29, N'Digital Marketing', N'Creazione di campagne pubblicitarie digitali', N'CF0008')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (30, N'Email Marketing Specialist', N'Gestione delle campagne di email marketing', N'CF0008')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (31, N'Performance Marketing', N'Ottimizzazione delle performance delle campagne digitali', N'CF0008')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (32, N'Business Analyst', N'Analisi dei processi aziendali e proposte di ottimizzazione', N'CF0009')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (33, N'Process Improvement Specialist', N'Miglioramento continuo dei processi aziendali', N'CF0009')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (34, N'Data Analyst', N'Analisi dei dati per la reportistica aziendale', N'CF0009')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (35, N'Consultant', N'Consulenza per lo sviluppo di software gestionali', N'CF0010')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (36, N'IT Consultant', N'Consulenza per l''implementazione di soluzioni tecnologiche', N'CF0010')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (37, N'ERP Consultant', N'Consulenza su sistemi ERP per aziende', N'CF0010')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (38, N'Social Media Manager', N'Gestione delle comunicazioni sui social media', N'CF0011')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (39, N'Content Strategist', N'Sviluppo della strategia di contenuti per social media', N'CF0011')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (40, N'Community Manager', N'Gestione delle comunità online sui social media', N'CF0011')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (41, N'Product Manager', N'Gestione e sviluppo del ciclo di vita del prodotto', N'CF0012')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (42, N'Product Owner', N'Gestione dei requisiti del prodotto e coordinamento del team', N'CF0012')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (43, N'Agile Coach', N'Implementazione di pratiche Agile all''interno del team', N'CF0012')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (44, N'Financial Analyst', N'Analisi dei bilanci aziendali e reportistica finanziaria', N'CF0013')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (45, N'Credit Analyst', N'Valutazione del rischio di credito e analisi finanziaria', N'CF0013')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (46, N'Risk Manager', N'Gestione del rischio finanziario aziendale', N'CF0013')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (47, N'Human Resources Manager', N'Gestione e selezione del personale aziendale', N'CF0014')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (48, N'HR Generalist', N'Gestione delle pratiche HR quotidiane', N'CF0014')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (49, N'HR Consultant', N'Consulenza per la gestione delle risorse umane', N'CF0014')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (50, N'Quality Assurance Engineer', N'Controllo qualità su applicazioni software', N'CF0015')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (51, N'Software Tester', N'Test di applicazioni web e mobile per garantire la qualità', N'CF0015')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (52, N'QA Automation Engineer', N'Automazione dei test software', N'CF0015')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (53, N'Network Engineer', N'Gestione e manutenzione della rete aziendale', N'CF0016')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (54, N'System Administrator', N'Gestione e configurazione di server aziendali', N'CF0016')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (55, N'Cloud Infrastructure Engineer', N'Gestione delle infrastrutture cloud aziendali', N'CF0016')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (56, N'Content Manager', N'Gestione e creazione contenuti per il web', N'CF0017')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (57, N'Editor', N'Editing e gestione dei contenuti per blog e articoli online', N'CF0017')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (58, N'Web Content Writer', N'Scrittura e gestione di contenuti per il sito web', N'CF0017')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (59, N'SEO Specialist', N'Ottimizzazione del sito per i motori di ricerca', N'CF0018')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (60, N'Content Marketing Specialist', N'Creazione di contenuti mirati per strategie di marketing', N'CF0018')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (61, N'Online Marketing Specialist', N'Gestione delle campagne di marketing online', N'CF0018')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (62, N'Customer Service', N'Assistenza clienti e risoluzione problemi', N'CF0019')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (63, N'Customer Support', N'Supporto telefonico e online per risolvere le problematiche dei clienti', N'CF0019')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (64, N'Customer Success Manager', N'Gestione del successo del cliente a lungo termine', N'CF0019')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (65, N'HR Assistant', N'Assistenza nelle attività di gestione delle risorse umane', N'CF0020')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (66, N'Recruiter', N'Ricerca e selezione del personale aziendale', N'CF0020')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (67, N'Payroll Specialist', N'Gestione delle buste paga e dei benefici aziendali', N'CF0020')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (69, N'Software Developer', N'Sviluppo di applicazioni web usando Java e Angular', N'Z123456789012345')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (70, N'Data Analyst', N'Analisi dei dati e creazione di modelli predittivi', N'Y234567890123456')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (71, N'System Engineer', N'Progettazione e gestione di sistemi informatici complessi', N'X345678901234567')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (72, N'Network Administrator', N'Gestione di reti e infrastrutture aziendali', N'W456789012345678')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (73, N'UI/UX Designer', N'Progettazione di interfacce utente per applicazioni mobili', N'V567890123456789')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (75, N'Software Developer', N'Sviluppo di applicazioni mobile con Android e iOS', N'T234567890123456')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (76, N'Data Scientist', N'Progettazione di modelli di machine learning per analisi dati', N'U345678901234567')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (77, N'Psicologa', N'Supporto psicologico in ambito educativo e lavorativo', N'V456789012345678')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (78, N'Tecnico di rete', N'Installazione e manutenzione di reti aziendali', N'W567890123456789')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (79, N'Fisico Teorico', N'Ricerca teorica nel campo della fisica applicata', N'X678901234567890')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (80, N'Project Manager', N'Gestione di progetti aziendali in ambito IT', N'Y789012345678901')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (81, N'Laboratorio Biologico', N'Gestione di esperimenti scientifici in laboratorio', N'Z890123456789012')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (82, N'Marketing Manager', N'Gestione delle campagne marketing online e offline', N'A901234567890123')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (83, N'Consulente filosofico', N'Supporto alle decisioni aziendali tramite consulenze filosofiche', N'B012345678901234')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (84, N'Docente Universitaria', N'Insegnamento di materie filosofiche all''università', N'C123456789012345')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (85, N'Contabile', N'Gestione della contabilità aziendale, analisi dei bilanci', N'A123456789012345')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (86, N'Avvocato', N'Assistenza legale in materia di diritto commerciale e civile', N'B234567890123456')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (87, N'Chimico di laboratorio', N'Ricerca e analisi chimiche per la produzione industriale', N'C345678901234567')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (88, N'Ricercatore Sociale', N'Studio e ricerca in ambito sociale e sociologico', N'D456789012345678')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (89, N'Specialista in marketing digitale', N'Gestione campagne di marketing online, analisi SEO', N'E567890123456789')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (90, N'Software Developer', N'3 anni di esperienza nella creazione di applicazioni web.', N'F678901234567890')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (91, N'Data Analyst', N'2 anni di esperienza nell’analisi dei dati con strumenti come Excel e SQL.', N'G789012345678901')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (92, N'Full Stack Developer', N'Esperienza di 4 anni nella gestione di progetti frontend e backend.', N'H890123456789012')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (93, N'Psicologa', N'Lavoro con pazienti in ambito clinico e terapeutico per migliorare il benessere psicologico.', N'I901234567890123')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (94, N'Consultant', N'Esperienza di 3 anni in consulenza aziendale per l’ottimizzazione dei processi.', N'J012345678901234')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (95, N'Architect', N'Esperienza nella progettazione di edifici residenziali e commerciali.', N'K123456789012345')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (96, N'Philosophy Professor', N'Insegnamento di Filosofia presso università e scuole superiori.', N'L234567890123456')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (97, N'Medical Doctor', N'Esperienza in medicina generale e specialistica.', N'M345678901234567')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (98, N'Economist', N'Esperienza come consulente economico in aziende e istituzioni pubbliche.', N'N456789012345678')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (99, N'Biologist', N'Ricerca in ambito biologico con focus su biotecnologie e genetica.', N'O567890123456789')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (100, N'Civil Engineer', N'Progettazione e gestione di infrastrutture civili.', N'P678901234567890')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (101, N'Agronomist', N'Esperienza nella gestione di coltivazioni e nell’agricoltura sostenibile.', N'Q789012345678901')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (102, N'Electrical Engineer', N'Lavoro come ingegnere elettrico nel settore delle energie rinnovabili.', N'R890123456789012')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (103, N'Veterinarian', N'Esperienza nel trattamento di animali da compagnia e da fattoria.', N'S901234567890123')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (104, N'Foreign Language Teacher', N'Insegnamento di lingue straniere in scuole e corsi privati.', N'T012345678901234')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (105, N'Computer Engineer', N'Lavoro nello sviluppo di software e gestione di sistemi informatici.', N'U123456789012345')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (106, N'Industrial Designer', N'Progettazione di prodotti industriali e commerciali.', N'V234567890123456')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (107, N'Biotechnologist', N'Ricerca nel campo delle biotecnologie applicate alla salute.', N'W345678901234567')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (108, N'Linguist', N'Esperienza nella ricerca linguistica e nella traduzione professionale.', N'X456789012345678')
GO
INSERT [dbo].[Esperienza] ([id], [titolo], [esperienza], [FK_CV]) VALUES (109, N'Communication Specialist', N'Gestione delle comunicazioni aziendali e pubbliche.', N'Y567890123456789')
GO
SET IDENTITY_INSERT [dbo].[Esperienza] OFF
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (1, 13)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (2, 15)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (3, 17)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (4, 17)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (13, 7)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (13, 16)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (14, 7)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (14, 16)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (15, 7)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (15, 16)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (16, 7)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (16, 16)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (17, 7)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (18, 9)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (19, 9)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (20, 9)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (21, 9)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (22, 9)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (23, 10)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (24, 10)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (25, 10)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (26, 10)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (28, 12)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (29, 12)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (30, 12)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (31, 12)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (32, 12)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (33, 12)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (37, 13)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (38, 13)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (39, 13)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (40, 13)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (41, 13)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (42, 13)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (43, 13)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (44, 14)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (45, 14)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (46, 14)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (47, 14)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (48, 14)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (49, 14)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (50, 15)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (51, 15)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (52, 15)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (53, 15)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (54, 15)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (55, 16)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (56, 17)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (57, 17)
GO
INSERT [dbo].[ListaDomande] ([FK_Domanda], [FK_Posizione]) VALUES (58, 17)
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Agrigento', N'Sicilia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Alessandria', N'Piemonte')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Ancona', N'Marche')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Aosta ', N'Valle d''Aosta')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Arezzo', N'Toscana')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Ascoli Piceno', N'Marche')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Asti', N'Piemonte')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Avellino', N'Campania')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Bari', N'Puglia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Barletta-Andria-Trani', N'Puglia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Belluno ', N'Veneto')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Benevento', N'Campania')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Bergamo', N'Lombardia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Biella', N'Piemonte')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Bologna', N'Emilia-Romagna')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Bolzano', N'Trentino-Alto Adige')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Brescia', N'Lombardia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Brindisi', N'Puglia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Cagliari', N'Sardegna')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Caltanissetta', N'Sicilia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Campobasso', N'Molise')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Caserta', N'Campania')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Catania', N'Sicilia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Catanzaro', N'Calabria')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Chieti', N'Abruzzo')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Como', N'Lombardia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Cosenza', N'Calabria')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Cremona', N'Lombardia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Crotone', N'Calabria')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Cuneo', N'Piemonte')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Enna', N'Sicilia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Fermo', N'Marche')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Ferrara', N'Emilia-Romagna')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Firenze', N'Toscana')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Foggia', N'Puglia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Forlì-Cesena', N'Emilia-Romagna')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Frosinone', N'Lazio')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Genova', N'Liguria')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Gorizia', N'Friuli-Venezia Giulia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Grosseto', N'Toscana')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Imperia', N'Liguria')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Isernia', N'Molise')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'La Spezia', N'Liguria')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'L''Aquila', N'Abruzzo')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Latina', N'Lazio')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Lecce', N'Puglia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Lecco', N'Lombardia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Livorno', N'Toscana')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Lodi', N'Lombardia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Lucca', N'Toscana')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Macerata', N'Marche')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Mantova', N'Lombardia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Massa-Carrara', N'Toscana')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Matera', N'Basilicata')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Messina', N'Sicilia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Milano', N'Lombardia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Modena', N'Emilia-Romagna')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Monza e Brianza', N'Lombardia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Napoli', N'Campania')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Novara', N'Piemonte')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Nuoro', N'Sardegna')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Oristano', N'Sardegna')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Padova ', N'Veneto')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Palermo', N'Sicilia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Parma', N'Emilia-Romagna')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Pavia', N'Lombardia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Perugia ', N'Umbria')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Pesaro e Urbino', N'Marche')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Pescara', N'Abruzzo')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Piacenza', N'Emilia-Romagna')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Pisa', N'Toscana')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Pistoia', N'Toscana')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Pordenone', N'Friuli-Venezia Giulia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Potenza', N'Basilicata')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Prato', N'Toscana')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Ragusa', N'Sicilia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Ravenna', N'Emilia-Romagna')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Reggio Calabria', N'Calabria')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Reggio Emilia', N'Emilia-Romagna')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Rieti', N'Lazio')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Rimini', N'Emilia-Romagna')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Roma', N'Lazio')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Rovigo ', N'Veneto')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Salerno', N'Campania')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Sassari', N'Sardegna')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Savona', N'Liguria')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Siena', N'Toscana')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Siracusa', N'Sicilia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Sondrio', N'Lombardia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Sud Sardegna', N'Sardegna')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Taranto', N'Puglia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Teramo', N'Abruzzo')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Terni', N'Umbria')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Torino', N'Piemonte')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Trapani', N'Sicilia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Trento', N'Trentino-Alto Adige')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Treviso ', N'Veneto')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Trieste', N'Friuli-Venezia Giulia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Udine', N'Friuli-Venezia Giulia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Varese', N'Lombardia')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Venezia ', N'Veneto')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Verbano-Cusio-Ossola', N'Piemonte')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Vercelli', N'Piemonte')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Verona ', N'Veneto')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Vibo Valentia', N'Calabria')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Vicenza ', N'Veneto')
GO
INSERT [dbo].[Localita] ([provincia], [regione]) VALUES (N'Viterbo', N'Lazio')
GO
SET IDENTITY_INSERT [dbo].[Posizione] ON 
GO
INSERT [dbo].[Posizione] ([id], [titolo], [descrizione], [settore], [utente_scelto], [FK_Localita]) VALUES (7, N'Ingegnere DevOps', N'<p>Wisteria Services e'' alla ricerca di un <strong>Ingegnere DevOps</strong> altamente qualificato per entrare a far parte del nostro team di esperti nell''automazione e ottimizzazione dei processi. il candidato ideale avra'' una solida esperienza nell''implementazione di pipeline di Continuous Integration/Continuous Delivery (CI/CD), nella gestione dell''infrastruttura cloud e nell''adozione di soluzioni di containerizzazione, al fine di garantire un ciclo di vita del software efficiente e sicuro.</p><p>La posizione prevede la gestione di sistemi di automazione per il provisioning, la configurazione e la gestione dei server, nonche'' il monitoraggio e il miglioramento delle prestazioni delle applicazioni. il nostro ingegnere DevOps sara'' un pilastro fondamentale nel garantire che le applicazioni vengano sviluppate, testate e distribuite in modo rapido, sicuro e senza interruzioni. Lavorando in un ambiente altamente dinamico, il candidato dovra'' collaborare con il team di sviluppo per risolvere problemi tecnici complessi e migliorare continuamente i processi.</p><p>In particolare, il candidato si occupera'' delle seguenti attivita'':</p><ul><li><strong>Gestire la creazione e l''ottimizzazione di pipeline CI/CD:</strong> Implementazione e mantenimento di pipeline CI/CD utilizzando strumenti come Jenkins, GitLab CI o CircleCI, per facilitare il processo di integrazione e distribuzione del codice in ambienti di produzione.</li><li><strong>Infrastruttura e gestione cloud:</strong> Creazione e gestione di ambienti cloud scalabili e sicuri utilizzando piattaforme come AWS, Google Cloud o Microsoft Azure. l''Ingegnere DevOps dovra'' occuparsi della gestione dei server, dei database e delle risorse necessarie per eseguire le applicazioni in modo ottimale.</li> <li> <strong>Gestione delle risorse containerizzate:</strong> Utilizzo di Docker e Kubernetes per la containerizzazione delle applicazioni e la gestione dei container in produzione. Questo include la creazione di cluster Kubernetes, il deployment e la gestione di microservizi.</li> <li> <strong>Monitoraggio e ottimizzazione delle prestazioni:</strong> Utilizzo di strumenti di monitoraggio come Prometheus, Grafana, New Relic o Nagios per monitorare la salute delle applicazioni, identificare eventuali colli di bottiglia e implementare soluzioni di miglioramento continuo.</li> <li> <strong>Automazione della gestione della configurazione:</strong> Utilizzo di strumenti come Ansible, Chef o Puppet per automatizzare la configurazione dei server e delle risorse, garantendo coerenza e riducendo i rischi di errori manuali.</li> <li> <strong>Gestione della sicurezza e conformita'':</strong> Implementazione di best practice per la sicurezza in ambiente DevOps, inclusi la gestione delle credenziali, l''autenticazione multifattore e la protezione dei dati sensibili. il candidato dovra'' anche occuparsi della gestione della conformita'' alle normative di settore e garantire che tutte le pratiche DevOps siano sicure.</li> <li> <strong>Collaborazione con i team di sviluppo:</strong> Collaborare strettamente con i team di sviluppo software per comprendere i requisiti delle applicazioni e garantire che le pipeline CI/CD e l''infrastruttura cloud siano configurate in modo che supportino l''intero ciclo di vita delle applicazioni.</li> <li> <strong>Supporto e troubleshooting:</strong> Fornire supporto tecnico per il debugging di problemi in produzione, risolvendo rapidamente eventuali interruzioni del servizio, identificando le cause e applicando soluzioni per evitare che si ripetano.</li> <li> <strong>Documentazione:</strong> Creazione e manutenzione di documentazione tecnica riguardo le infrastrutture, i processi di automazione e le configurazioni utilizzate, al fine di garantire la conoscenza condivisa all''interno del team e tra i vari dipartimenti.</li></ul>', N'Infrastruttura e Automazione', NULL, N'Lucca')
GO
INSERT [dbo].[Posizione] ([id], [titolo], [descrizione], [settore], [utente_scelto], [FK_Localita]) VALUES (9, N'Software Engineer in Test (SET)', N'<p>Wisteria Services e'' alla ricerca di un <strong>Software Engineer in Test (SET)</strong> per supportare il nostro team nello sviluppo di applicazioni software di alta qualita''. il candidato ideale avra'' una solida esperienza nel''testing e nella qualita'' del software, con un forte focus sulla scrittura di test automatici e sull''implementazione di best practice per garantire che il software soddisfi gli standard piu'' elevati di affidabilita'', performance e sicurezza.</p><p>In particolare, il Software Engineer in Test si occupera'' delle seguenti attivita'':</p><ul><li><strong>Automazione dei test:</strong> Creazione e gestione di test automatici per applicazioni web, API e software desktop, utilizzando strumenti come Selenium, JUnit, TestNG o PyTest.</li><li><strong>Progettazione di test di carico e stress:</strong> Utilizzo di strumenti come JMeter o LoadRunner per testare la scalabilita'' e la resistenza delle applicazioni sotto carico elevato.</p></ul><p>il candidato ideale dovra'' avere esperienza con le principali tecniche di testing, un buon background nella scrittura di codice, e una forte passione per il miglioramento della qualita'' del software. l''esperienza con la programmazione in linguaggi come Java, Python, o JavaScript sara'' un plus, cosi'' come la familiarita'' con strumenti di Continuous Integration (CI) come Jenkins o GitLab.</p><p><strong>Requisiti richiesti:</strong></p><ul><li>Esperienza di almeno 3 anni come Software Engineer in Test o in un ruolo simile.</li><li>Capacita'' di scrivere test di unita'', test funzionali e test di integrazione.</li><li>Forte attenzione ai dettagli e capacita'' di risolvere i problemi rapidamente.</li><li>Ottime capacita'' di comunicazione e di lavoro in team.</li></ul>', N'Sviluppo Software', NULL, N'Brescia')
GO
INSERT [dbo].[Posizione] ([id], [titolo], [descrizione], [settore], [utente_scelto], [FK_Localita]) VALUES (10, N'Data Scientist', N'<p>Wisteria Services e'' alla ricerca di un <strong>Data Scientist</strong> per unirsi al nostro team di analisi dei dati e contribuire a trasformare i dati grezzi in intuizioni utili per il business. il candidato ideale avra'' una forte conoscenza delle tecniche di analisi dei dati, delle statistiche avanzate e dell''apprendimento automatico. La posizione prevede la progettazione e implementazione di modelli predittivi, l''analisi di grandi volumi di dati e la presentazione dei risultati in modo chiaro e comprensibile per gli stakeholder.</p><p>In particolare, il Data Scientist si occupera'' delle seguenti attivita'':</p><ul><li><strong>Analisi dei dati:</strong> Esplorare, pulire e analizzare grandi dataset per identificare tendenze, correlazioni e modelli.</li><li><strong>Sviluppo di modelli predittivi:</strong> Utilizzare tecniche di machine learning e deep learning per creare modelli predittivi che possano anticipare comportamenti e tendenze future.</li><li><strong>Visualizzazione dei dati:</strong> Creare visualizzazioni dei dati interattive utilizzando strumenti come Tableau, Power BI o Python (Matplotlib, Seaborn) per comunicare le scoperte ai team interni e agli stakeholder.</li><li><strong>Collaborazione con altri team:</strong> Lavorare a stretto contatto con i team di prodotto, marketing e IT per implementare soluzioni basate sui dati e ottimizzare le decisioni aziendali.</li></ul><p><strong>Requisiti richiesti:</strong></p><ul><li>Laurea in Informatica, Statistica, Matematica o campo correlato.</li><li>Esperienza di almeno 3 anni come Data Scientist o in un ruolo simile.</li><li>Ottima conoscenza dei linguaggi di programmazione Python, R e delle librerie di machine learning (TensorFlow, scikit-learn, etc.).</li><li>Esperienza con la gestione e analisi di grandi volumi di dati, inclusi database SQl''e NoSQL.</li><li>Ottime capacita'' analitiche e di problem-solving.</li><li>Conoscenza delle tecniche di machine learning e deep learning.</li><li>Esperienza nella creazione di report e visualizzazioni dei dati.</li></ul>', N'Data analist', NULL, N'Bologna')
GO
INSERT [dbo].[Posizione] ([id], [titolo], [descrizione], [settore], [utente_scelto], [FK_Localita]) VALUES (12, N'Cloud Engineer', N'<p>Wisteria Services e'' alla ricerca di un <strong>Cloud Engineer</strong> altamente qualificato per progettare, implementare e gestire soluzioni cloud scalabili ed efficienti per i nostri clienti. il candidato ideale avra'' esperienza nell''uso delle principali piattaforme di cloud computing, tra cui AWS, Microsoft Azure e Google Cloud, e sara'' in grado di supportare la gestione dell''infrastruttura cloud, ottimizzando le risorse e garantendo la sicurezza e la performance delle soluzioni.</p><p>Il candidato ideale avra'' esperienza pratica con la configurazione, la gestione e l''ottimizzazione dei servizi cloud, insieme a una buona conoscenza di strumenti di gestione delle infrastrutture come Docker, Kubernetes e CI/CD.</p><p><strong>Requisiti richiesti:</strong></p><ul><li>Esperienza di almeno 3 anni come Cloud Engineer o in un ruolo simile.</li><li>Conoscenza approfondita delle principali piattaforme cloud (AWS, Azure, GCP).</li><li>Esperienza nell''automazione dell''infrastruttura tramite Terraform, Ansible, CloudFormation o altri strumenti simili.</li><li>Conoscenza delle pratiche di sicurezza nel''cloud, inclusi i controlli di accesso, la crittografia e la gestione delle identita''.</li><li>Esperienza con il monitoraggio delle prestazioni delle applicazioni e dei servizi in ambiente cloud.</li><li>Conoscenza di containerizzazione (Docker) e orchestrazione (Kubernetes).</li><li>Esperienza con il deployment di soluzioni di CI/CD per automazione delle operazioni di sviluppo.</li></ul>', N'Infrastruttura e Cloud Computing', NULL, N'Milano')
GO
INSERT [dbo].[Posizione] ([id], [titolo], [descrizione], [settore], [utente_scelto], [FK_Localita]) VALUES (13, N'Front-End Developer', N'<p>Wisteria Services e'' alla ricerca di un <strong>Front-End Developer</strong> esperto e appassionato per lavorare su interfacce utente moderne, altamente interattive e responsive. il candidato ideale avra'' una solida esperienza nella creazione di siti web e applicazioni web utilizzando HTML, CSS, JavaScript e framework come React, Angular o Vue.js.</p><p>Il Front-End Developer si occupera'' di:</p><ul><li><strong>Progettazione dell''interfaccia utente:</strong> Collaborare con i designer UX/UI per tradurre le esigenze del cliente in interfacce utente moderne e facilmente utilizzabili.</li><li><strong>Scrittura di codice pulito e manutenibile:</strong> Sviluppare codice in HTML5, CSS3 e JavaScript, mantenendo elevati standard di qualita'' e pratiche di programmazione moderne.</li><li><strong>Implementazione di soluzioni responsive:</strong> Creare applicazioni web che funzionino perfettamente su una varieta'' di dispositivi, da desktop a mobile, garantendo esperienze utente coerenti.</li><li><strong>Adattamento alle nuove tecnologie:</strong> Rimanere aggiornati sulle tendenze tecnologiche emergenti, inclusi nuovi framework, strumenti e librerie JavaScript.</li></ul><p><strong>Requisiti richiesti:</strong></p><ul><li>Esperienza di almeno 2 anni come Front-End Developer o in un ruolo simile.</li><li>Ottima conoscenza di HTML5, CSS3 e JavaScript.</li><li>Esperienza con almeno uno dei principali framework JavaScript come React, Angular, o Vue.js.</li><li>Esperienza con il design responsivo e i principi di usabilita''.</li><li>Capacita'' di lavorare con il versionamento del codice tramite Git.</li><li>Esperienza nell''ottimizzazione delle performance web.</li></ul>', N'Web developer', NULL, N'Milano')
GO
INSERT [dbo].[Posizione] ([id], [titolo], [descrizione], [settore], [utente_scelto], [FK_Localita]) VALUES (14, N'UX/UI Designer', N'<p>Wisteria Services e'' alla ricerca di un <strong>UX/UI Designer</strong> creativo e appassionato per progettare esperienze utente intuitive e visualmente accattivanti per le nostre applicazioni e piattaforme digitali.</p><p>Il UX/UI Designer si occupera'' di:</p><ul><li><strong>Progettazione dell''esperienza utente (UX):</strong> Creare flussi di utenti intuitivi e soluzioni che risolvano le problematiche degli utenti, migliorando l''usabilita'' e l''accessibilita'' delle piattaforme digitali.</li><li><strong>Creazione di wireframe, mockup e prototipi:</strong> Realizzare prototipi interattivi e wireframe che rappresentino le soluzioni progettuali in modo chiaro ed efficace.</li><li><strong>Collaborazione con il team di sviluppo:</strong> Lavorare a stretto contatto con i team di sviluppo per assicurarsi che le soluzioni progettuali siano realizzabili e che vengano rispettati gli standard di usabilita''.</li><li><strong>Test di usabilita'':</strong> Condurre test di usabilita'' su prototipi e interfacce utente per raccogliere feedback e migliorare continuamente il design.</li><li><strong>Adattamento delle interfacce per dispositivi mobili:</strong> Garantire che le applicazioni siano ottimizzate per tutti i dispositivi, dal desktop ai mobile, utilizzando il design responsive.</li><li><strong>Mantenimento di una coerenza visiva:</strong> Garantire che il design visivo delle applicazioni sia coerente con la brand identity e che rispetti le linee guida del design.</li></ul><p><strong>Requisiti richiesti:</strong></p><ul><li>Esperienza di almeno 3 anni come UX/UI Designer o in un ruolo simile.</li><li>Conoscenza dei principi di design UX, psicologia dell''utente e progettazione interattiva.</li><li>Esperienza con software di design come Adobe XD, Sketch, Figma, o simili.</li><li>Conoscenza dei principi di design responsive e mobile-first.</li><li>Esperienza con la prototipazione e i test di usabilita''.</li><li>Capacita'' di collaborare efficacemente con sviluppatori e team cross-funzionali.</li></ul>', N'Design e User Experience', NULL, N'Alessandria')
GO
INSERT [dbo].[Posizione] ([id], [titolo], [descrizione], [settore], [utente_scelto], [FK_Localita]) VALUES (15, N'Back-End Developer', N'<p>Wisteria Services e'' alla ricerca di un <strong>Back-End Developer</strong> altamente competente per lavorare alla creazione di soluzioni software robuste e scalabili.</p><p>Il Back-End Developer si occupera'' di:</p><ul><li><strong>Progettazione di API:</strong> Creare API RESTful''efficienti e sicure per supportare le interazioni tra il front-end e il back-end delle applicazioni.</li><li><strong>Gestione dei database:</strong> Progettare e gestire database relazionali e NoSQL, garantendo che i dati siano accessibili, sicuri e ben strutturati.</li><li><strong>Ottimizzazione delle prestazioni:</strong> Lavorare sull''ottimizzazione delle prestazioni del back-end, migliorando la velocita'' di risposta e riducendo i colli di bottiglia.</li><li><strong>Integrazione di sistemi esterni:</strong> Integrare applicazioni e servizi esterni tramite API, servizi web e altre soluzioni di terze parti.</li><li><strong>Automazione e test:</strong> Scrivere test automatizzati per garantire che il codice sia di alta qualita'', facilmente manutenibile e privo di bug.</li><li><strong>Gestione della sicurezza:</strong> Implementare best practices per garantire che i sistemi siano sicuri contro attacchi e vulnerabilita''.</li></ul><p>Il candidato ideale avra'' una forte comprensione dei principi di sviluppo software, delle architetture scalabili e delle migliori pratiche per garantire che il codice sia di alta qualita'' e facilmente manutenibile.</p><p><strong>Requisiti richiesti:</strong></p><ul><li>Esperienza di almeno 3 anni come Back-End Developer o in un ruolo simile.</li><li>Ottima conoscenza di linguaggi di programmazione come Java, Python o Node.js.</li><li>Esperienza con database SQl''e NoSQL.</li><li>Conoscenza approfondita delle API RESTful''e dei principi di sicurezza.</li><li>Esperienza nell''automazione dei test e nell''uso di strumenti di test come JUnit, Mocha o pytest.</li><li>Capacita'' di lavorare con strumenti di versionamento del codice come Git.</li></ul>', N'Sviluppo Software', NULL, N'Bolzano')
GO
INSERT [dbo].[Posizione] ([id], [titolo], [descrizione], [settore], [utente_scelto], [FK_Localita]) VALUES (16, N'DevOps Engineer', N'<p>Wisteria Services e'' alla ricerca di un <strong>DevOps Engineer</strong> per migliorare l''efficienza delle operazioni aziendali tramite l''automazione e l''ottimizzazione dei processi di sviluppo e di deploy.</p><p>Il DevOps Engineer si occupera'' di:</p><ul><li><strong>Automazione dei flussi di lavoro:</strong> Sviluppare e implementare soluzioni di automazione per semplificare il processo di build, test e rilascio delle applicazioni.</li><li><strong>Gestione dell''infrastruttura:</strong> Gestire e ottimizzare le risorse infrastrutturali, con particolare attenzione alle soluzioni cloud (AWS, Azure, GCP) e alla virtualizzazione.</li><li><strong>Continuous Integration e Continuous Deployment (CI/CD):</strong> Implementare e mantenere pipeline CI/CD per migliorare la qualita'' del codice e la velocita'' di rilascio.</li><li><strong>Gestione dei container:</strong> Utilizzare tecnologie come Docker e Kubernetes per la gestione dei container e la creazione di ambienti scalabili e facilmente gestibili.</li><li><strong>Monitoraggio delle performance:</strong> Implementare sistemi di monitoraggio e logging per tracciare le performance delle applicazioni e individuare possibili problemi.</li><li><strong>Collaborazione cross-funzionale:</strong> Lavorare a stretto contatto con i team di sviluppo, QA e IT per garantire che le operazioni siano fluide e senza interruzioni.</li></ul><p><strong>Requisiti richiesti:</strong></p><ul><li>Esperienza di almeno 3 anni come DevOps Engineer o in un ruolo simile.</li><li>Conoscenza di strumenti di automazione come Jenkins, Ansible, Chef, o Puppet.</li><li>Esperienza con cloud publici (AWS, Google Cloud, Azure) e soluzioni container (Docker, Kubernetes).</li><li>Conoscenza approfondita di CI/CD e versionamento del codice tramite Git.</li><li>Capacita'' di monitorare e ottimizzare le prestazioni delle applicazioni e dell''infrastruttura.</li><li>Ottima conoscenza di sistemi operativi Linux e Windows Server.</li></ul>', N'Infrastruttura e Automazione', NULL, N'La Spezia')
GO
INSERT [dbo].[Posizione] ([id], [titolo], [descrizione], [settore], [utente_scelto], [FK_Localita]) VALUES (17, N'Cyber Security Specialist', N'<p>Wisteria Services e'' alla ricerca di un <strong>Cyber Security Specialist</strong> esperto che si occupi della protezione dei sistemi informatici aziendali contro minacce informatiche e vulnerabilita''.</p><p>Il Cyber Security Specialist si occupera'' di:</p><ul><li><strong>Protezione delle reti aziendali:</strong> Implementare misure di sicurezza per proteggere le reti aziendali da attacchi informatici come malware, phishing e ransomware.</li><li><strong>Gestione delle vulnerabilita'':</strong> Eseguire audit di sicurezza regolari per identificare e correggere vulnerabilita'' nei sistemi aziendali.</li><li><strong>Monitoraggio della sicurezza:</strong> Monitorare i sistemi e le reti per rilevare attivita'' sospette e prevenire eventuali attacchi informatici.</li><li><strong>Incident Response:</strong> Gestire e rispondere tempestivamente agli incidenti di sicurezza, indagando e risolvendo le violazioni della sicurezza.</li><li><strong>Formazione e sensibilizzazione:</strong> Fornire formazione e consulenza ai dipendenti per sensibilizzarli ai rischi informatici e alle best practices di sicurezza.</li><li><strong>Implementazione di soluzioni di sicurezza:</strong> Collaborare con i team di sviluppo per implementare soluzioni di sicurezza nei software aziendali.</li></ul><p><strong>Requisiti richiesti:</strong></p><ul><li>Laurea in Informatica, Sicurezza Informatica o affini.</li><li>Esperienza di almeno 3 anni in un ruolo simile nel''settore della sicurezza informatica.</li><li>Conoscenza avanzata di strumenti di sicurezza come firewall, IDS/IPS, antivirus e soluzioni di crittografia.</li><li>Conoscenza delle normative di sicurezza come GDPR, ISO 27001, e PCI DSS.</li><li>Esperienza in gestione degli incidenti e in risposta agli attacchi informatici.</li><li>Certificazioni in sicurezza informatica come CISSP, CEH o CISM sono un plus.</li></ul>', N'Cybersecurity', NULL, N'Barletta-Andria-Trani')
GO
SET IDENTITY_INSERT [dbo].[Posizione] OFF
GO
SET IDENTITY_INSERT [dbo].[Risposta] ON 
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (1, N'Python', 0, 1)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (2, N'JavaScript ', 1, 1)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (3, N'Java', 0, 1)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (4, N'C++', 0, 1)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (5, N'Flask', 0, 2)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (6, N'Express.js', 1, 2)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (7, N'Django', 0, 2)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (8, N'Ruby on Rails', 0, 2)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (9, N'Aumentare la velocità della rete', 0, 3)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (10, N'Bloccare accessi non autorizzati', 1, 3)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (11, N'Eseguire backup dei dati', 0, 3)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (12, N'Ottimizzare le prestazioni del server', 0, 3)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (13, N'Un tipo di attacco DDoS', 0, 4)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (14, N'Una tecnica di ingegneria sociale per rubare informazioni', 1, 4)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (15, N'Un virus informatico', 0, 4)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (16, N'Un metodo di crittografia', 0, 4)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (17, N'Sviluppare software', 0, 5)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (18, N'Aumentare le vendite e i profitti', 1, 5)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (19, N'Gestire la sicurezza informatica', 0, 5)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (20, N'Progettare reti', 0, 5)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (21, N'Tasso di crescita delle vendite', 1, 6)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (22, N'Tempo di risposta ai ticket', 0, 6)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (23, N'Numero di bug nel software', 0, 6)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (24, N'Percentuale di uptime del server', 0, 6)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (25, N'Waterfall ', 1, 7)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (26, N'Agile', 0, 7)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (27, N'Lean', 0, 7)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (28, N'Six Sigma', 0, 7)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (29, N'Business Case', 1, 8)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (30, N'User Manual', 0, 8)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (31, N'Code Review', 0, 8)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (32, N'Test Plan', 0, 8)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (33, N'Photoshop', 0, 9)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (34, N'Excel', 1, 9)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (35, N'PowerPoint', 0, 9)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (36, N'Notepad', 0, 9)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (37, N'Un programma di software', 0, 10)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (38, N'Un insieme di dati strutturati', 1, 10)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (39, N'Un linguaggio di programmazione', 0, 10)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (40, N'Un algoritmo', 0, 10)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (41, N'Fornire supporto tecnico ai clienti', 1, 11)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (42, N'Sviluppare codice', 0, 11)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (43, N'Gestire risorse umane', 0, 11)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (44, N'Creare campagne di marketing', 0, 11)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (45, N'Conoscenza di linguaggi di programmazione', 0, 12)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (46, N'Capacità di comunicazione efficace', 1, 12)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (47, N'Esperienza nella gestione di progetti', 0, 12)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (48, N'Competenze artistiche', 0, 12)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (49, N'Aumentare la sicurezza dei server', 0, 13)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (50, N'Automatizzare il processo di sviluppo e distribuzione del software', 1, 13)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (51, N'Aumentare il traffico di rete', 0, 13)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (52, N'Gestire la gestione dei database', 0, 13)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (53, N'Automatizza il backup dei dati', 0, 14)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (54, N'Gestisce il versionamento del codice', 0, 14)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (55, N'Containerizza le applicazioni per garantirne la portabilita'' D', 1, 14)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (56, N'Controlla l''infrastruttura dei server', 0, 14)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (57, N'Git', 0, 15)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (58, N'Helm', 1, 15)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (59, N'Jenkins', 0, 15)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (60, N'Ansible', 0, 15)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (61, N'WordPress', 0, 16)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (62, N'AWS', 1, 16)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (63, N'Microsoft Office', 0, 16)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (64, N'Facebook', 0, 16)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (65, N'Un software per il backup dei dati', 0, 17)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (66, N'Un processo di gestione manuale dei server', 0, 17)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (67, N'Un processo per automatizzare la gestione delle infrastrutture tramite codice', 1, 17)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (68, N'Una metodologia di design del software', 0, 17)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (69, N'Testare le funzionalita'' principali del software', 0, 18)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (70, N'Verificare la sicurezza dell''applicazione', 0, 18)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (71, N'Verificare la resistenza dell''applicazione sotto carico elevato', 1, 18)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (72, N'Testare l''usabilita'' dell''interfaccia utente', 0, 18)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (73, N'JUnit', 1, 19)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (74, N'Jira', 0, 19)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (75, N'Jenkins', 0, 19)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (76, N'Docker', 0, 19)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (77, N'Un test che verifica l''integrazione tra vari componenti del sistema', 0, 20)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (78, N'Un test che assicura che il codice esistente non venga compromesso da nuove modifiche', 1, 20)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (79, N'Un test che verifica la sicurezza del sistema', 0, 20)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (80, N'Un test che misura le prestazioni di un applicazione sotto carico', 0, 20)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (81, N'Un test di unita'' verifica una singola funzione', 1, 21)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (82, N' mentre un test di integrazione verifica l''interazione tra moduli diversi', 0, 21)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (83, N'Un test di unita'' verifica l''interazione tra moduli', 0, 21)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (84, N' mentre un test di integrazione verifica una singola funzione', 0, 21)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (85, N'Un test di unita'' e'' per il front-end', 0, 21)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (86, N' mentre un test di integrazione e'' per il back-end', 0, 21)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (87, N'Non c e'' differenza tra i due tipi di test', 0, 21)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (88, N'Per ridurre i costi del progetto', 0, 22)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (89, N'Per eseguire test solo una volta', 0, 22)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (90, N'Per ridurre la complessita'' del codice', 0, 22)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (91, N'Per testare il software piÃ¹ velocemente e con maggiore copertura', 1, 22)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (92, N'Regressione lineare', 0, 23)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (93, N'K-means clustering', 0, 23)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (94, N'Classificazione', 1, 23)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (95, N'Riduzione delle dimensioni', 0, 23)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (96, N'Un flusso di dati provenienti da piu'' fonti senza elaborazione', 0, 24)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (97, N'Un processo che raccoglie', 1, 24)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (98, N' elabora e trasforma i dati in formati utili', 0, 24)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (99, N'Un algoritmo per il riconoscimento delle immagini', 0, 24)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (100, N'Un database relazionale', 0, 24)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (101, N'Tableau', 1, 25)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (102, N'Jupyter Notebook', 0, 25)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (103, N'TensorFlow', 0, 25)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (104, N'PyCharm', 0, 25)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (105, N'Per analizzare piccoli dataset con poche variabili', 0, 26)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (106, N'Per analizzare dati numerici da tabelle', 0, 26)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (107, N'Per eseguire query su database SQL', 0, 26)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (108, N'Per risolvere problemi complessi come il riconoscimento delle immagini', 1, 26)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (113, N'Maggiore necessita'' di manutenzione', 0, 28)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (114, N'Maggiore sicurezza a livello di rete', 0, 28)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (115, N'Maggiore controllo fisico sui server', 0, 28)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (116, N'Scalabilita'' automatica delle risorse', 1, 28)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (117, N'Terraform', 1, 29)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (118, N'Jupyter Notebook', 0, 29)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (119, N'Power BI', 0, 29)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (120, N'Docker', 0, 29)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (121, N'Un servizio di database gestito', 0, 30)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (122, N'Un sistema di orchestrazione dei container', 0, 30)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (123, N'Un servizio per automatizzare il provisioning delle risorse', 1, 30)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (124, N'Un framework per sviluppatori web', 0, 30)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (125, N'Utilizzare solo il login con password', 0, 31)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (126, N'Implementare il controllo degli accessi basato sui ruoli (RBAC)', 1, 31)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (127, N'Abilitare l''accesso pubblico per tutti i servizi', 0, 31)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (128, N'Non criptare i dati per velocizzare le operazioni', 0, 31)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (129, N'AWS', 0, 32)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (130, N'Google Cloud', 0, 32)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (131, N'Azure', 1, 32)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (132, N'IBM Cloud', 0, 32)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (133, N'Monitorare il traffico di rete', 0, 33)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (134, N'Eseguire test di carico', 0, 33)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (135, N'Orchestrare e gestire container', 1, 33)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (136, N'Analizzare i dati in tempo reale', 0, 33)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (145, N'HTML e'' per la struttura', 1, 37)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (146, N' CSS e'' per lo stile', 0, 37)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (147, N'HTML e'' per lo stile', 0, 37)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (148, N' CSS e'' per la struttura', 0, 37)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (149, N'HTML e'' per la programmazione', 0, 37)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (150, N' CSS e'' per l''interfaccia', 0, 37)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (151, N'Non c''e'' differenza', 0, 37)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (152, N'Angular', 0, 38)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (153, N'React', 1, 38)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (154, N'Node.js', 0, 38)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (155, N'Vue.js', 0, 38)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (156, N'Creare design che cambiano in base alla larghezza della finestra del browser', 1, 39)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (157, N'Creare design che sono visibili solo su dispositivi mobili', 0, 39)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (158, N'Creare pagine web con un aspetto fisso', 0, 39)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (159, N'Creare applicazioni desktop', 0, 39)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (160, N'Git', 1, 40)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (161, N'Sublime Text', 0, 40)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (162, N'Node.js', 0, 40)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (163, N'Gulp', 0, 40)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (164, N'Gestire il database', 0, 41)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (165, N'Creare e gestire interfacce utente reattive', 1, 41)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (166, N'Ottimizzare il server', 0, 41)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (167, N'Eseguire il deployment delle applicazioni', 0, 41)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (168, N'align-items: center;', 0, 42)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (169, N'justify-content: center;', 0, 42)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (170, N'margin: 0 auto;', 1, 42)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (171, N'position: center;', 0, 42)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (172, N'Quando si ha bisogno di un applicazione monolitica', 0, 43)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (173, N'Quando si sviluppano soluzioni desktop', 0, 43)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (174, N'Quando si sviluppa una SPA (Single Page Application)', 1, 43)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (175, N'Quando si creano database relazionali', 0, 43)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (176, N'Un documento che descrive il contenuto di una pagina web', 0, 44)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (177, N'Un applicazione mobile', 0, 44)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (178, N'Un tipo di test di usabilita''', 0, 44)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (179, N'Un diagramma che mostra la struttura e la disposizione degli elementi di una pagina web', 1, 44)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (180, N'Git', 0, 45)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (181, N'Figma', 1, 45)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (182, N'Excel', 0, 45)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (183, N'SQL', 0, 45)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (184, N'Focalizzarsi solo sull''aspetto estetico', 0, 46)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (185, N'Creare un interfaccia semplice e intuitiva', 1, 46)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (186, N'Utilizzare colori vivaci senza considerazioni di accessibilita''', 0, 46)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (187, N'Ignorare il feedback degli utenti', 0, 46)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (188, N'Progettare prima l''interfaccia desktop e poi adattarla per mobile', 0, 47)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (189, N'Progettare per dispositivi mobili come priorita'' e successivamente adattare per desktop', 1, 47)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (190, N'Creare solo applicazioni per dispositivi mobili', 0, 47)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (191, N'Progettare solo per i tablet', 0, 47)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (192, N'Un mockup statico senza funzionalita''', 0, 48)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (193, N'Un modello di interfaccia che consente agli utenti di interagire con esso per testare la navigazione', 1, 48)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (194, N'Un applicazione finale pronta per la distribuzione', 0, 48)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (195, N'Un documento di specifiche per il team di sviluppo', 0, 48)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (196, N'Test A/B', 0, 49)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (197, N'Test di unita''', 0, 49)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (198, N'Test di usabilita''', 1, 49)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (199, N'Test di carico', 0, 49)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (200, N'Un interfaccia di programmazione di applicazioni utilizzata solo per il back-end', 0, 50)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (201, N'Un tipo di database relazionale', 0, 50)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (202, N'Un interfaccia che segue i principi REST (Representational State Transfer) per facilitare la comunicazione tra sistemi', 1, 50)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (203, N'Un tipo di test di usabilita''', 0, 50)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (204, N'MongoDB', 0, 51)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (205, N'Redis', 0, 51)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (206, N'Firebase', 0, 51)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (207, N'PostgreSQL', 1, 51)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (208, N'La capacita'' di rispondere a un numero maggiore di richieste senza compromettere le prestazioni', 1, 52)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (209, N'La capacita'' di cambiare il linguaggio di programmazione utilizzato', 0, 52)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (210, N'La capacita'' di ridurre la complessita'' del codice', 0, 52)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (211, N'La capacita'' di ottimizzare i test automatizzati', 0, 52)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (212, N'JavaScript', 0, 53)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (213, N'HTML', 0, 53)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (214, N'Python', 1, 53)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (215, N'CSS', 0, 53)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (216, N'Tradurre le richieste HTTP', 0, 54)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (217, N'Gestire le sessioni utente', 0, 54)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (218, N'Mappare oggetti in codice a tabelle di database relazionali', 1, 54)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (219, N'Creare un interfaccia utente', 0, 54)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (220, N'Automazione dei test', 0, 55)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (221, N'Rilasciare automaticamente il codice in produzione dopo ogni modifica', 1, 55)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (222, N'Creare backup automatici del codice', 0, 55)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (223, N'Gestire la sicurezza dell''infrastruttura', 0, 55)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (224, N'Git', 0, 56)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (225, N'Apache Kafka', 0, 56)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (226, N'Snort', 1, 56)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (227, N'TensorFlow', 0, 56)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (228, N'GDPR', 1, 57)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (229, N'ISO 27001', 0, 57)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (230, N'HIPAA', 0, 57)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (231, N'PCI DSS', 0, 57)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (232, N'Rallentare l''accesso ai dati', 0, 58)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (233, N'Proteggere i dati durante la trasmissione e l''archiviazione', 1, 58)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (234, N'Ottimizzare le prestazioni del server', 0, 58)
GO
INSERT [dbo].[Risposta] ([id], [risposta], [VoF], [FK_Domanda]) VALUES (235, N'Aumentare la velocita'' di elaborazione', 0, 58)
GO
SET IDENTITY_INSERT [dbo].[Risposta] OFF
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (7, N'user1', 5, CAST(N'2024-12-05T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (7, N'user10', 5, CAST(N'2024-12-06T13:30:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (7, N'user12', 4, CAST(N'2024-12-06T14:15:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (7, N'user13', 3, CAST(N'2024-12-06T15:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (7, N'user2', 3, CAST(N'2024-12-06T09:15:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (7, N'user21', 4, CAST(N'2024-12-06T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (7, N'user26', 4, CAST(N'2024-12-07T10:30:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (7, N'user3', 4, CAST(N'2024-12-06T10:15:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (7, N'user35', 4, CAST(N'2024-12-07T19:30:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (7, N'user36', 4, CAST(N'2024-12-08T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (7, N'user4', 4, CAST(N'2024-12-05T19:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (7, N'user41', 4, CAST(N'2024-12-06T08:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (7, N'user5', 4, CAST(N'2024-12-06T11:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (7, N'user50', 3, CAST(N'2024-12-06T17:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (7, N'user59', 5, CAST(N'2024-12-07T02:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (7, N'user7', 3, CAST(N'2024-12-06T04:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (7, N'user8', 3, CAST(N'2024-12-06T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (9, N'user1', 4, CAST(N'2024-12-05T11:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (9, N'user10', 2, CAST(N'2024-12-06T19:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (9, N'user11', 4, CAST(N'2024-12-06T20:15:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (9, N'user14', 3, CAST(N'2024-12-06T21:30:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (9, N'user22', 4, CAST(N'2024-12-06T11:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (9, N'user27', 3, CAST(N'2024-12-07T11:30:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (9, N'user3', 4, CAST(N'2024-12-06T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (9, N'user36', 3, CAST(N'2024-12-08T11:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (9, N'user4', 3, CAST(N'2024-12-05T20:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (9, N'user42', 3, CAST(N'2024-12-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (9, N'user5', 3, CAST(N'2024-12-06T17:15:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (9, N'user51', 2, CAST(N'2024-12-06T18:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (9, N'user6', 2, CAST(N'2024-12-06T18:30:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (9, N'user60', 2, CAST(N'2024-12-07T03:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (9, N'user7', 2, CAST(N'2024-12-06T05:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (10, N'user1', 4, CAST(N'2024-12-05T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (10, N'user12', 3, CAST(N'2024-12-07T02:30:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (10, N'user13', 4, CAST(N'2024-12-07T03:30:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (10, N'user2', 3, CAST(N'2024-12-06T22:30:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (10, N'user23', 3, CAST(N'2024-12-06T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (10, N'user28', 3, CAST(N'2024-12-07T12:30:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (10, N'user37', 2, CAST(N'2024-12-08T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (10, N'user4', 4, CAST(N'2024-12-05T21:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (10, N'user43', 3, CAST(N'2024-12-06T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (10, N'user52', 3, CAST(N'2024-12-06T19:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (10, N'user6', 2, CAST(N'2024-12-07T01:15:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (10, N'user8', 3, CAST(N'2024-12-06T06:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (12, N'user12', 6, CAST(N'2024-12-07T06:30:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (12, N'user13', 4, CAST(N'2024-12-07T07:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (12, N'user15', 5, CAST(N'2024-12-07T08:30:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (12, N'user16', 6, CAST(N'2024-12-07T09:30:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (12, N'user17', 5, CAST(N'2024-12-07T10:15:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (12, N'user2', 6, CAST(N'2024-12-05T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (12, N'user24', 6, CAST(N'2024-12-06T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (12, N'user29', 6, CAST(N'2024-12-07T13:30:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (12, N'user37', 5, CAST(N'2024-12-08T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (12, N'user44', 6, CAST(N'2024-12-06T11:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (12, N'user5', 6, CAST(N'2024-12-05T22:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (12, N'user53', 4, CAST(N'2024-12-06T20:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (12, N'user6', 6, CAST(N'2024-12-07T04:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (12, N'user8', 5, CAST(N'2024-12-06T07:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (12, N'user9', 5, CAST(N'2024-12-07T05:15:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (13, N'user10', 7, CAST(N'2024-12-07T13:30:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (13, N'user14', 6, CAST(N'2024-12-07T14:15:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (13, N'user15', 6, CAST(N'2024-12-07T15:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (13, N'user2', 8, CAST(N'2024-12-05T14:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (13, N'user25', 6, CAST(N'2024-12-06T14:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (13, N'user30', 6, CAST(N'2024-12-07T14:30:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (13, N'user38', 6, CAST(N'2024-12-08T14:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (13, N'user45', 6, CAST(N'2024-12-06T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (13, N'user5', 8, CAST(N'2024-12-05T23:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (13, N'user54', 7, CAST(N'2024-12-06T21:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (13, N'user8', 7, CAST(N'2024-12-06T08:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (13, N'user9', 8, CAST(N'2024-12-07T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (14, N'user10', 6, CAST(N'2024-12-07T17:30:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (14, N'user12', 4, CAST(N'2024-12-07T18:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (14, N'user13', 5, CAST(N'2024-12-07T19:15:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (14, N'user16', 5, CAST(N'2024-12-07T20:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (14, N'user17', 6, CAST(N'2024-12-07T21:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (14, N'user2', 6, CAST(N'2024-12-05T15:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (14, N'user31', 5, CAST(N'2024-12-07T15:30:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (14, N'user38', 5, CAST(N'2024-12-08T15:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (14, N'user46', 4, CAST(N'2024-12-06T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (14, N'user5', 5, CAST(N'2024-12-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (14, N'user55', 5, CAST(N'2024-12-06T22:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (14, N'user8', 5, CAST(N'2024-12-07T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (14, N'user9', 5, CAST(N'2024-12-06T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (15, N'user10', 6, CAST(N'2024-12-08T01:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (15, N'user11', 4, CAST(N'2024-12-08T02:15:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (15, N'user14', 3, CAST(N'2024-12-08T03:30:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (15, N'user2', 5, CAST(N'2024-12-07T22:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (15, N'user3', 6, CAST(N'2024-12-05T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (15, N'user32', 4, CAST(N'2024-12-07T16:30:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (15, N'user39', 4, CAST(N'2024-12-08T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (15, N'user47', 3, CAST(N'2024-12-06T14:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (15, N'user5', 4, CAST(N'2024-12-07T23:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (15, N'user56', 3, CAST(N'2024-12-06T23:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (15, N'user6', 6, CAST(N'2024-12-06T01:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (15, N'user9', 6, CAST(N'2024-12-06T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (16, N'user12', 3, CAST(N'2024-12-08T06:15:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (16, N'user14', 4, CAST(N'2024-12-08T07:30:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (16, N'user16', 5, CAST(N'2024-12-08T08:15:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (16, N'user18', 4, CAST(N'2024-12-08T09:30:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (16, N'user3', 5, CAST(N'2024-12-05T17:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (16, N'user33', 4, CAST(N'2024-12-07T17:30:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (16, N'user39', 3, CAST(N'2024-12-08T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (16, N'user48', 5, CAST(N'2024-12-06T15:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (16, N'user57', 2, CAST(N'2024-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (16, N'user6', 4, CAST(N'2024-12-06T02:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (16, N'user7', 4, CAST(N'2024-12-08T04:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (16, N'user9', 4, CAST(N'2024-12-06T11:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (17, N'user12', 5, CAST(N'2024-12-08T11:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (17, N'user14', 4, CAST(N'2024-12-08T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (17, N'user16', 5, CAST(N'2024-12-08T13:30:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (17, N'user18', 4, CAST(N'2024-12-08T14:30:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (17, N'user19', 5, CAST(N'2024-12-08T15:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (17, N'user3', 5, CAST(N'2024-12-05T18:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (17, N'user34', 5, CAST(N'2024-12-07T18:30:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (17, N'user40', 2, CAST(N'2024-12-08T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (17, N'user49', 4, CAST(N'2024-12-06T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (17, N'user58', 4, CAST(N'2024-12-07T01:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (17, N'user6', 4, CAST(N'2024-12-06T03:00:00.000' AS DateTime))
GO
INSERT [dbo].[SiCandida] ([FK_Posizione], [FK_Utente], [punteggio], [data]) VALUES (17, N'user9', 4, CAST(N'2024-12-08T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user1', 1, 1, 0, 1, 0)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user10', 0, 1, 1, 1, 0)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user11', 1, 0, 0, 1, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user12', 0, 1, 1, 0, 0)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user13', 1, 1, 0, 0, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user14', 1, 0, 1, 1, 0)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user15', 0, 0, 1, 0, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user16', 1, 1, 1, 0, 0)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user17', 0, 1, 1, 1, 0)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user18', 1, 0, 0, 1, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user19', 1, 1, 0, 0, 0)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user2', 0, 1, 1, 0, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user20', 1, 1, 1, 0, 0)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user21', 1, 1, 0, 1, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user22', 0, 1, 1, 1, 0)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user23', 1, 0, 1, 0, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user24', 1, 1, 0, 1, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user25', 0, 1, 1, 0, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user26', 1, 0, 1, 0, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user27', 0, 1, 1, 1, 0)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user28', 1, 1, 0, 0, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user29', 0, 1, 0, 1, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user3', 1, 0, 1, 1, 0)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user30', 1, 1, 1, 0, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user31', 0, 1, 1, 1, 0)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user32', 1, 0, 1, 1, 0)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user33', 0, 1, 0, 1, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user34', 1, 1, 0, 1, 0)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user35', 1, 1, 1, 1, 0)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user36', 1, 1, 0, 1, 0)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user37', 0, 1, 1, 0, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user38', 1, 0, 1, 1, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user39', 1, 1, 0, 0, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user4', 0, 0, 1, 1, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user40', 0, 1, 1, 1, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user41', 1, 0, 1, 0, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user42', 1, 1, 1, 0, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user43', 0, 1, 1, 1, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user44', 1, 1, 0, 1, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user45', 1, 0, 1, 1, 0)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user46', 1, 1, 0, 0, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user47', 0, 1, 1, 1, 0)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user48', 1, 0, 1, 0, 0)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user49', 1, 1, 1, 1, 0)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user5', 1, 1, 0, 1, 0)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user50', 1, 0, 1, 1, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user51', 0, 1, 1, 0, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user52', 1, 1, 0, 1, 0)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user53', 0, 1, 1, 1, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user54', 1, 1, 0, 1, 0)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user55', 0, 0, 1, 1, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user56', 1, 1, 1, 0, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user57', 0, 1, 1, 0, 0)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user58', 1, 0, 1, 0, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user59', 0, 1, 0, 1, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user6', 1, 0, 1, 0, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user60', 1, 1, 0, 1, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user7', 0, 1, 0, 1, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user8', 1, 1, 0, 0, 1)
GO
INSERT [dbo].[SoftSkill] ([FK_Utente], [skill_1], [skill_2], [skill_3], [skill_4], [skill_5]) VALUES (N'user9', 1, 0, 1, 0, 1)
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'Amm01', N'$2a$10$j2mex2WKgAzkr9a2yniN4ePQN2gZPzGFXEH72bt5uAhf93kYhc7ku', N'admin@veritas.com', N'user.Admin')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'Amm02', N'Amm02pw?', N'amm02email@veritas.com', N'Amministratore')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'Can01', N'$2a$10$j2mex2WKgAzkr9a2yniN4ePQN2gZPzGFXEH72bt5uAhf93kYhc7ku', N'user@veritas.com', N'user.Candidate')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'Can02', N'Can02pw!', N'can02email@veritas.com', N'Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'Can03', N'Can03pw!', N'can03email@veritas.com', N'Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'Can04', N'Can04pw!', N'can04email@veritas.com', N'Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'Can05', N'Can05pw!', N'can05email@veritas.com', N'Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'Evasigia', N'$2a$10$WliI3LKfESz24Ro0DcfAd.wUghY5GLyqQPKCrpn83SWUPqF0Vj4cC', N'giarme.eva@opera.it', N'user.Candidate')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user1', N'$2b$12$F9dZLXQmll52wB5U8qQsHOp06Xp5g2jG99W4YOe5ZWfTJlXjUUSm6', N'user1@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user10', N'$2b$12$3HeW0o5JzT.C42lwyxdnfs8JzJ5osO2YQXEv7F9jkhTcS9BQj68B.', N'user10@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user11', N'$2b$12$uBhRL4nJLvGEgOhu4ygLruLSszAUGAIE5z/3gyBqFxxFL2l6y9RL6', N'user11@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user12', N'$2b$12$bhsmqfhLMG2LVuICxzql3PLmRVz6WeQzPnJhJzHqfZ3nI7dcW9t8z', N'user12@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user13', N'$2b$12$0FS5XZ7oIgG0n5YsY2rm0duEoK1G9GrwFCIMiK3g9Ssf8bHj76v7q', N'user13@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user14', N'$2b$12$pwEqYtT4fuV1sLUq6BYXJ7Vsy61I/92ENKk0CZsEL5ssYqI5oPRHa', N'user14@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user15', N'$2b$12$8V3Wp6OW8md5aHhA3VjvZjoJaeWyoKYAKJ5NOOHElMK7mpzFJ9E36', N'user15@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user16', N'$2b$12$H5hT7tQYALW4gHRc5TjrJyRzJfBVsckmhtPBoOr3oXrBC7TWsR0Pa', N'user16@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user17', N'$2b$12$1B7rzFcM06fZzH16qzj.SgMI9HprzIKRlqPO6Mn0hG7u1BtzQW5hK', N'user17@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user18', N'$2b$12$Hw9h0OwV7iF8jsLlpa5reNklDsehvEnY8K6POTsL4c8kKnnF1rR2e', N'user18@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user19', N'$2b$12$zBbxYQWCEep5jqruJgSdxjRfG98c7s5shdPdbV0xC33Xa9OdYP6vq', N'user19@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user2', N'$2b$12$Vt7hlAxg9XzzkpP.0uX8r6YhD1Z.fWLFYZmj53vhGzxwlrhww0Bqy', N'user2@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user20', N'$2b$12$9qRHdYxXmlddyuZugwZPaF.fA7VSF00VhxuBVG5ReMlPBRgDCM0u.', N'user20@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user21', N'$2a$10$k5yglP0z6doPkdNJ8pOAsOsKa5HVhP7NrhjqD9ie7AkikqjCuCvIi', N'user21@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user22', N'$2a$10$0G5A7NjUG1A.ykQvGox2b.x3lkI9nJgXI4CJ2U6t9KxLz0ylsA4Hq', N'user22@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user23', N'$2a$10$6U0zCgbS5Wm3DTkUe3yJ3JzDs5alr9F9ymoeRJhr9cgaKFV8YlfDq', N'user23@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user24', N'$2a$10$Sy5Cfq8uw.mTT1Nse7lERjXewz0F2Lg1hYffTHDD0A0SYb4hTBrOy', N'user24@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user25', N'$2a$10$Lw5NfYFwSv9yxZ99ds.qTjD3BdHL9jt5Wy6yTlhBdWhZGUS0HLTqz', N'user25@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user26', N'$2a$10$LfW4sWf6cTz8Lf8RMcUvw9oYYgt0EVEfwwRgi.DDk9cHX9cmhH3ae', N'user26@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user27', N'$2a$10$Tl2zI7gUyFwRmiA4I.DMi2A1GJ6W5C5fuUtVe7ZwMvXnklYyyJXtC', N'user27@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user28', N'$2a$10$k2ovB4hpmybr7v5MtrZC1eeVeVV8DgB7ga5zq4iOOIg1qR2F8.VXS', N'user28@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user29', N'$2a$10$KP1gpnBUnXjlzR2d3D9jpWv8Vs0VsbqhsYXeCNAGJgSCf5PqGHneG', N'user29@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user3', N'$2b$12$GgStRVE2l9EY2HYYdV5DCp1J9DmbMjA2D5HgGHU06h.yMJXWGywle', N'user3@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user30', N'$2a$10$Z3sjBhdT5GqaZo92pp6GkFVAexmYbld3dFmMYkAmm34F1yP2eA9P8a', N'user30@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user31', N'$2a$10$y2UgnFQldYYwp8OKfocdRWGxO3TpAN5Zb7cUkAEg7TpEEnLSVfLPa', N'user31@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user32', N'$2a$10$xfIHNOA4D9X.sMF7dN7uRZtOIsyC1iCBrtoQ7lNV4jwQXGR5e.LZm', N'user32@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user33', N'$2a$10$y4sNG2fwhD6czsP4rGHMyVAWv8y8YsP3ITRBr1ee1db7VAxOHWLrq', N'user33@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user34', N'$2a$10$k1GHJ9rh03ShJ3HQwcdl7u3FdAvM2jYAZgdXkeDzCFCXZJ.yo.Ugq', N'user34@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user35', N'$2a$10$mb.XBhUl3vsX0.n8X0T5YN7gPsw2LAtYFX39bOpZhTtk9geBhR2r6', N'user35@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user36', N'$2a$10$mb.XBhUl3vsX0.n8X0T5YN7gPsw2LAtYFX39bOpZhTtk9geBhR2r6', N'user36@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user37', N'$2a$10$mb.XBhUl3vsX0.n8X0T5YN7gPsw2LAtYFX39bOpZhTtk9geBhR2r6', N'user37@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user38', N'$2a$10$mb.XBhUl3vsX0.n8X0T5YN7gPsw2LAtYFX39bOpZhTtk9geBhR2r6', N'user38@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user39', N'$2a$10$mb.XBhUl3vsX0.n8X0T5YN7gPsw2LAtYFX39bOpZhTtk9geBhR2r6', N'user39@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user4', N'$2b$12$A7Gb4rlHnbj2A7eL9LQsQurXXyK.2SDoWfSHeHfFgiJlIk6r3V5lq', N'user4@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user40', N'$2a$10$mb.XBhUl3vsX0.n8X0T5YN7gPsw2LAtYFX39bOpZhTtk9geBhR2r6', N'user40@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user41', N'$2a$10$mb.XBhUl3vsX0.n8X0T5YN7gPsw2LAtYFX39bOpZhTtk9geBhR2r6', N'user41@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user42', N'$2a$10$mb.XBhUl3vsX0.n8X0T5YN7gPsw2LAtYFX39bOpZhTtk9geBhR2r6', N'user42@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user43', N'$2a$10$mb.XBhUl3vsX0.n8X0T5YN7gPsw2LAtYFX39bOpZhTtk9geBhR2r6', N'user43@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user44', N'$2a$10$mb.XBhUl3vsX0.n8X0T5YN7gPsw2LAtYFX39bOpZhTtk9geBhR2r6', N'user44@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user45', N'$2a$10$mb.XBhUl3vsX0.n8X0T5YN7gPsw2LAtYFX39bOpZhTtk9geBhR2r6', N'user45@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user46', N'$2a$10$mb.XBhUl3vsX0.n8X0T5YN7gPsw2LAtYFX39bOpZhTtk9geBhR2r6', N'user46@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user47', N'$2a$10$mb.XBhUl3vsX0.n8X0T5YN7gPsw2LAtYFX39bOpZhTtk9geBhR2r6', N'user47@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user48', N'$2a$10$mb.XBhUl3vsX0.n8X0T5YN7gPsw2LAtYFX39bOpZhTtk9geBhR2r6', N'user48@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user49', N'$2a$10$mb.XBhUl3vsX0.n8X0T5YN7gPsw2LAtYFX39bOpZhTtk9geBhR2r6', N'user49@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user5', N'$2b$12$gLHwNlXYyEMqgI5mSxZgVXZ02gsVm3xaDmaNlxR8GxU9zzqmfYj0yO', N'user5@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user50', N'$2a$10$mb.XBhUl3vsX0.n8X0T5YN7gPsw2LAtYFX39bOpZhTtk9geBhR2r6', N'user50@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user51', N'$2a$10$mb.XBhUl3vsX0.n8X0T5YN7gPsw2LAtYFX39bOpZhTtk9geBhR2r6', N'user51@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user52', N'$2a$10$mb.XBhUl3vsX0.n8X0T5YN7gPsw2LAtYFX39bOpZhTtk9geBhR2r6', N'user52@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user53', N'$2a$10$mb.XBhUl3vsX0.n8X0T5YN7gPsw2LAtYFX39bOpZhTtk9geBhR2r63', N'user53@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user54', N'$2a$10$mb.XBhUl3vsX0.n8X0T5YN7gPsw2LAtYFX39bOpZhTtk9geBhR2r6', N'user54@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user55', N'$2a$10$mb.XBhUl3vsX0.n8X0T5YN7gPsw2LAtYFX39bOpZhTtk9geBhR2r6', N'user55@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user56', N'$2a$10$mb.XBhUl3vsX0.n8X0T5YN7gPsw2LAtYFX39bOpZhTtk9geBhR2r6', N'user56@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user57', N'$2a$10$mb.XBhUl3vsX0.n8X0T5YN7gPsw2LAtYFX39bOpZhTtk9geBhR2r6', N'user57@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user58', N'$2a$10$mb.XBhUl3vsX0.n8X0T5YN7gPsw2LAtYFX39bOpZhTtk9geBhR2r6', N'user58@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user59', N'$2a$10$mb.XBhUl3vsX0.n8X0T5YN7gPsw2LAtYFX39bOpZhTtk9geBhR2r6', N'user59@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user6', N'$2b$12$zNdOSfTrDkNcQ4o1dQ0tsZrTWGgHoI7X6D50g3WlrePpCwrTyYbfm', N'user6@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user60', N'$2a$10$mb.XBhUl3vsX0.n8X0T5YN7gPsw2LAtYFX39bOpZhTtk9geBhR2r6', N'user60@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user7', N'$2b$12$h2DEm2hNlWysIUdJQxWn/NfSu6sdzh1OjHhfuQorxV6jPeDLa1Iay', N'user7@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user8', N'$2b$12$F0WoswOVZXlgPYHcgjgYf9pbslFkEKIqzMjjknBhd6QmdfuM3jThS', N'user8@example.com', N'user.Candidato')
GO
INSERT [dbo].[Utente] ([username], [pw], [email], [ruolo]) VALUES (N'user9', N'$2b$12$RjEcnx6ES5XKGo/fOd0ETpwD7MczX9hrdFzK/PsmANL/Jp1l2pgTa', N'user9@example.com', N'user.Candidato')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Domanda__1374BE26F5D14A09]    Script Date: 05/12/2024 12:51:22 ******/
ALTER TABLE [dbo].[Domanda] ADD UNIQUE NONCLUSTERED 
(
	[domanda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Utente__AB6E61645F40BFC6]    Script Date: 05/12/2024 12:51:22 ******/
ALTER TABLE [dbo].[Utente] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SoftSkill] ADD  DEFAULT ((0)) FOR [skill_1]
GO
ALTER TABLE [dbo].[SoftSkill] ADD  DEFAULT ((0)) FOR [skill_2]
GO
ALTER TABLE [dbo].[SoftSkill] ADD  DEFAULT ((0)) FOR [skill_3]
GO
ALTER TABLE [dbo].[SoftSkill] ADD  DEFAULT ((0)) FOR [skill_4]
GO
ALTER TABLE [dbo].[SoftSkill] ADD  DEFAULT ((0)) FOR [skill_5]
GO
ALTER TABLE [dbo].[CV]  WITH CHECK ADD FOREIGN KEY([FK_Utente])
REFERENCES [dbo].[Utente] ([username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Esperienza]  WITH CHECK ADD FOREIGN KEY([FK_CV])
REFERENCES [dbo].[CV] ([cf])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ListaDomande]  WITH CHECK ADD FOREIGN KEY([FK_Domanda])
REFERENCES [dbo].[Domanda] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ListaDomande]  WITH CHECK ADD FOREIGN KEY([FK_Posizione])
REFERENCES [dbo].[Posizione] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Posizione]  WITH CHECK ADD FOREIGN KEY([FK_Localita])
REFERENCES [dbo].[Localita] ([provincia])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Risposta]  WITH CHECK ADD FOREIGN KEY([FK_Domanda])
REFERENCES [dbo].[Domanda] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SiCandida]  WITH CHECK ADD FOREIGN KEY([FK_Posizione])
REFERENCES [dbo].[Posizione] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SiCandida]  WITH CHECK ADD FOREIGN KEY([FK_Utente])
REFERENCES [dbo].[Utente] ([username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SoftSkill]  WITH CHECK ADD FOREIGN KEY([FK_Utente])
REFERENCES [dbo].[Utente] ([username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SiCandida]  WITH CHECK ADD  CONSTRAINT [punteggio] CHECK  (([punteggio]>=(0) AND [punteggio]<=(10)))
GO
ALTER TABLE [dbo].[SiCandida] CHECK CONSTRAINT [punteggio]
GO
