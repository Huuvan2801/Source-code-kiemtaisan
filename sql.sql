USE [master]
GO
/****** Object:  Database [KiemKe]    Script Date: 5/2/2024 8:47:25 AM ******/
CREATE DATABASE [KiemKe]
 GO
USE [KiemKe]
GO
/****** Object:  Table [dbo].[PhongBan]    Script Date: 5/2/2024 8:47:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongBan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenPhongBan] [nvarchar](50) NULL,
 CONSTRAINT [PK_PhongBan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 5/2/2024 8:47:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[PhanQuyen] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiSan]    Script Date: 5/2/2024 8:47:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiSan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenTS] [nvarchar](100) NULL,
	[NoiSuDung] [nvarchar](max) NULL,
	[NamDVSD] [int] NULL,
	[SoKiemKeTT] [int] NULL,
	[SoTheoKeToan] [int] NULL,
	[NguyenNhan] [nvarchar](max) NULL,
	[Gia] [float] NULL,
	[TinhTrang] [int] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[IdPB] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTin]    Script Date: 5/2/2024 8:47:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [nvarchar](200) NULL,
	[GioiTinh] [int] NULL,
	[NgaySinh] [datetime] NULL,
	[DiaChi] [nvarchar](max) NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[IdTK] [int] NULL,
	[IdPB] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PhongBan] ON 

INSERT [dbo].[PhongBan] ([Id], [TenPhongBan]) VALUES (2, N'Nhân sự')
INSERT [dbo].[PhongBan] ([Id], [TenPhongBan]) VALUES (3, N'Kế toán')
SET IDENTITY_INSERT [dbo].[PhongBan] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([Id], [TenDangNhap], [MatKhau], [PhanQuyen]) VALUES (1, N'admin', N'admin', 1)
INSERT [dbo].[TaiKhoan] ([Id], [TenDangNhap], [MatKhau], [PhanQuyen]) VALUES (3, N'quyet', N'123', 2)
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiSan] ON 

INSERT [dbo].[TaiSan] ([Id], [TenTS], [NoiSuDung], [NamDVSD], [SoKiemKeTT], [SoTheoKeToan], [NguyenNhan], [Gia], [TinhTrang], [GhiChu], [IdPB]) VALUES (1, N'test', N'test', 2023, 12, 23, N'hỏng', 10000, 1, N'test', 2)
INSERT [dbo].[TaiSan] ([Id], [TenTS], [NoiSuDung], [NamDVSD], [SoKiemKeTT], [SoTheoKeToan], [NguyenNhan], [Gia], [TinhTrang], [GhiChu], [IdPB]) VALUES (2, N'test1', N'test', 2023, 12, 23, N'hỏng', 10000, 2, N'test', 2)
INSERT [dbo].[TaiSan] ([Id], [TenTS], [NoiSuDung], [NamDVSD], [SoKiemKeTT], [SoTheoKeToan], [NguyenNhan], [Gia], [TinhTrang], [GhiChu], [IdPB]) VALUES (5, N'test12324', N'phòng thí nghiệm', 2023, 23, 40, N'hỏng', 21000, 2, N'test 123', 3)
INSERT [dbo].[TaiSan] ([Id], [TenTS], [NoiSuDung], [NamDVSD], [SoKiemKeTT], [SoTheoKeToan], [NguyenNhan], [Gia], [TinhTrang], [GhiChu], [IdPB]) VALUES (6, N'test', N'test', 2019, 12, 10, N'hihi', 100, 1, N'test', 2)
INSERT [dbo].[TaiSan] ([Id], [TenTS], [NoiSuDung], [NamDVSD], [SoKiemKeTT], [SoTheoKeToan], [NguyenNhan], [Gia], [TinhTrang], [GhiChu], [IdPB]) VALUES (7, N'test1232499', N'hack', 2018, 1, 1, N'1', 111, 1, N'1', 3)
INSERT [dbo].[TaiSan] ([Id], [TenTS], [NoiSuDung], [NamDVSD], [SoKiemKeTT], [SoTheoKeToan], [NguyenNhan], [Gia], [TinhTrang], [GhiChu], [IdPB]) VALUES (8, N'1', N'phòng thí nghiệm', 1, 1, 1, N'1', 1, 3, N'1', 2)
INSERT [dbo].[TaiSan] ([Id], [TenTS], [NoiSuDung], [NamDVSD], [SoKiemKeTT], [SoTheoKeToan], [NguyenNhan], [Gia], [TinhTrang], [GhiChu], [IdPB]) VALUES (9, N'4', N'4', 4, 4, 4, N'4', 4, 2, N'4', 3)
INSERT [dbo].[TaiSan] ([Id], [TenTS], [NoiSuDung], [NamDVSD], [SoKiemKeTT], [SoTheoKeToan], [NguyenNhan], [Gia], [TinhTrang], [GhiChu], [IdPB]) VALUES (10, N'5', N'5', 5, 5, 5, N'5', 5, 1, N'5', 3)
INSERT [dbo].[TaiSan] ([Id], [TenTS], [NoiSuDung], [NamDVSD], [SoKiemKeTT], [SoTheoKeToan], [NguyenNhan], [Gia], [TinhTrang], [GhiChu], [IdPB]) VALUES (11, N'6', N'6', 6, 6, 6, N'6', 6, 3, N'6', 3)
SET IDENTITY_INSERT [dbo].[TaiSan] OFF
GO
SET IDENTITY_INSERT [dbo].[ThongTin] ON 

INSERT [dbo].[ThongTin] ([Id], [HoTen], [Email], [GioiTinh], [NgaySinh], [DiaChi], [HinhAnh], [IdTK], [IdPB]) VALUES (1, N'triều', N'trieu@gmail.com', 1, CAST(N'2002-10-10T00:00:00.000' AS DateTime), N'Hà Nội', N'user.jpg', 1, 2)
INSERT [dbo].[ThongTin] ([Id], [HoTen], [Email], [GioiTinh], [NgaySinh], [DiaChi], [HinhAnh], [IdTK], [IdPB]) VALUES (3, N'Nguyễn Văn Quyết', N'quyet@gmail.com', 1, CAST(N'2002-02-02T00:00:00.000' AS DateTime), N'Ba Vì - Sơn Tây', N'images.jpg', 3, 3)
SET IDENTITY_INSERT [dbo].[ThongTin] OFF
GO
USE [master]
GO
ALTER DATABASE [KiemKe] SET  READ_WRITE 
GO
