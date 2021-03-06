USE [master]
GO
/****** Object:  Database [MobileStore]    Script Date: 3/14/2018 11:15:48 AM ******/
CREATE DATABASE [MobileStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MobileStore', FILENAME = N'C:\database\MobileStore.mdf' , SIZE = 5312KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MobileStore_log', FILENAME = N'C:\database\MobileStore_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MobileStore] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MobileStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MobileStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MobileStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MobileStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MobileStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MobileStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [MobileStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MobileStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MobileStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MobileStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MobileStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MobileStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MobileStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MobileStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MobileStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MobileStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MobileStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MobileStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MobileStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MobileStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MobileStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MobileStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MobileStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MobileStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MobileStore] SET  MULTI_USER 
GO
ALTER DATABASE [MobileStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MobileStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MobileStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MobileStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MobileStore] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MobileStore]
GO
/****** Object:  User [IIS APPPOOL\adxstoremobile]    Script Date: 3/14/2018 11:15:48 AM ******/
CREATE USER [IIS APPPOOL\adxstoremobile] FOR LOGIN [IIS APPPOOL\adxstoremobile] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\adxstoremobile]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 3/14/2018 11:15:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[MaAdmin] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[DienThoai] [varchar](11) NULL,
	[CMND] [varchar](9) NOT NULL,
	[NgaySinh] [smalldatetime] NULL,
	[GioiTinh] [bit] NULL,
	[NgayDangKy] [smalldatetime] NULL,
	[Avatar] [nvarchar](255) NULL DEFAULT ('/Content/Images/Upload/Avatar_Admin.jpg'),
	[AnHien] [bit] NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[MaAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 3/14/2018 11:15:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[MaBL] [int] IDENTITY(1,1) NOT NULL,
	[TenNguoiBL] [nvarchar](50) NULL,
	[TieuDeBL] [nvarchar](50) NULL,
	[NoiDungBL] [ntext] NULL,
	[NgayBL] [smalldatetime] NULL,
	[MaKH] [int] NULL,
	[MaSP] [int] NULL,
	[AnHien] [bit] NOT NULL,
 CONSTRAINT [PK_BinhLuan] PRIMARY KEY CLUSTERED 
(
	[MaBL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CT_DonHang]    Script Date: 3/14/2018 11:15:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_DonHang](
	[MaCTDH] [int] IDENTITY(1,1) NOT NULL,
	[MaDH] [int] NULL,
	[MaSP] [int] NULL,
	[SoLuong] [int] NULL,
	[Gia] [decimal](18, 0) NULL,
	[Thanhtien] [decimal](18, 0) NULL,
 CONSTRAINT [PK_CT_DonHang] PRIMARY KEY CLUSTERED 
(
	[MaCTDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 3/14/2018 11:15:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDH] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[NgayMua] [smalldatetime] NULL,
	[NgayGiao] [smalldatetime] NULL,
	[TenNguoiNhan] [nvarchar](50) NULL,
	[DiaChiNhan] [nvarchar](50) NULL,
	[DienThoaiNhan] [varchar](11) NULL,
	[HTThanhToan] [bit] NULL DEFAULT ((0)),
	[Trigia] [decimal](18, 0) NULL,
	[Dagiao] [bit] NULL DEFAULT ((0)),
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 3/14/2018 11:15:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaGH] [nvarchar](max) NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[Thanhtien] [decimal](18, 0) NULL,
	[NgayMua] [smalldatetime] NULL,
 CONSTRAINT [PK_GioHang] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 3/14/2018 11:15:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[DienThoai] [varchar](11) NULL,
	[CMND] [varchar](9) NOT NULL,
	[NgaySinh] [smalldatetime] NULL,
	[GioiTinh] [bit] NULL,
	[NgayDangKy] [smalldatetime] NULL,
	[Avatar] [nvarchar](255) NULL DEFAULT ('/Content/Images/Upload/avatar.jpg'),
	[AnHien] [bit] NOT NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LienHe]    Script Date: 3/14/2018 11:15:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LienHe](
	[MaLH] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[Avatar] [nvarchar](255) NULL,
	[TenNguoiGui] [nvarchar](200) NOT NULL,
	[NoiDung] [nvarchar](1000) NOT NULL,
	[NgayGui] [smalldatetime] NULL,
	[LuotGui] [bit] NULL,
	[DaDocKH] [bit] NULL,
	[DaDocAD] [bit] NULL,
	[Anhien] [bit] NULL,
 CONSTRAINT [PK_LienHe] PRIMARY KEY CLUSTERED 
(
	[MaLH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 3/14/2018 11:15:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Menu](
	[MaMenu] [int] IDENTITY(1,1) NOT NULL,
	[TenMenu] [nvarchar](50) NULL,
	[url] [varchar](50) NULL,
	[Thutu] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[MaMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 3/14/2018 11:15:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[MaNSX] [int] IDENTITY(1,1) NOT NULL,
	[TenNSX] [nvarchar](255) NOT NULL,
	[AnHien] [bit] NOT NULL,
 CONSTRAINT [PK_NhaSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhanQuyen_Admin]    Script Date: 3/14/2018 11:15:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen_Admin](
	[MaPQ] [int] IDENTITY(1,1) NOT NULL,
	[MaAdmin] [int] NULL,
	[PQ_Menu] [bit] NULL,
	[PQ_Slider] [bit] NULL,
	[PQ_NhaSanXuat] [bit] NULL,
	[PQ_SanPham] [bit] NULL,
	[PQ_KhachHang] [bit] NULL,
	[PQ_DonHang] [bit] NULL,
	[PQ_TinTuc] [bit] NULL,
	[PQ_QuangCao] [bit] NULL,
	[PQ_LienHe] [bit] NULL,
	[PQ_GioiThieu] [bit] NULL,
	[PQ_QuanTriAdmin] [bit] NULL,
	[PQ_SiteMap] [bit] NULL,
 CONSTRAINT [PK_PhanQuyen_Admin] PRIMARY KEY CLUSTERED 
(
	[MaPQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuangCao]    Script Date: 3/14/2018 11:15:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuangCao](
	[MaQC] [int] IDENTITY(1,1) NOT NULL,
	[TenQC] [nvarchar](255) NOT NULL,
	[TenCty] [nvarchar](200) NOT NULL,
	[UrlHinh] [varchar](100) NULL,
	[LinkUrl] [varchar](100) NULL,
	[vitri] [varchar](1) NOT NULL,
	[Ngaybatdau] [smalldatetime] NULL,
	[Ngayhethan] [smalldatetime] NULL,
	[AnHien] [bit] NOT NULL,
 CONSTRAINT [PK_QuangCao] PRIMARY KEY CLUSTERED 
(
	[MaQC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 3/14/2018 11:15:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](255) NOT NULL,
	[UrlHinh] [nvarchar](255) NULL,
	[Code1] [ntext] NULL DEFAULT ('<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="'),
	[UrlHinh360] [nvarchar](255) NULL,
	[Code2] [ntext] NULL DEFAULT ('" /> </a>'),
	[GiaHienTai] [decimal](18, 0) NOT NULL DEFAULT ((0)),
	[GiaCu] [decimal](18, 0) NOT NULL DEFAULT ((0)),
	[MoTa] [ntext] NULL,
	[MoTaCT] [ntext] NULL,
	[DanhGiaCT] [ntext] NULL,
	[MaNSX] [int] NOT NULL,
	[SoLuongTon] [int] NOT NULL DEFAULT ((1)),
	[SLDaBan] [int] NOT NULL DEFAULT ((0)),
	[KhuyenMai] [float] NOT NULL DEFAULT ((0)),
	[LuotXem] [int] NULL DEFAULT ((0)),
	[NgayCapNhat] [smalldatetime] NULL,
	[AnHien] [bit] NOT NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Slider]    Script Date: 3/14/2018 11:15:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Slider](
	[MaSlider] [int] IDENTITY(1,1) NOT NULL,
	[UrlHinh] [varchar](100) NULL,
	[LinkUrl] [varchar](100) NULL,
	[Thutu] [int] NULL,
	[AnHien] [bit] NOT NULL,
 CONSTRAINT [PK_Slider] PRIMARY KEY CLUSTERED 
(
	[MaSlider] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SoLuotTruyCap]    Script Date: 3/14/2018 11:15:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoLuotTruyCap](
	[Dem] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThongTin]    Script Date: 3/14/2018 11:15:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTin](
	[MaTT] [int] IDENTITY(1,1) NOT NULL,
	[code1] [ntext] NULL DEFAULT ('<p id="slide-client" class="text"><strong></strong><span></span></p><script type="text/javascript">if(!window.slider) var slider={};slider.data=[{"id":"slide-img-1","client":"'),
	[GioiThieu] [ntext] NOT NULL,
	[code2] [ntext] NULL DEFAULT ('","desc":""}];</script>'),
	[sitemap] [nvarchar](255) NULL,
 CONSTRAINT [PK_ThongTin] PRIMARY KEY CLUSTERED 
(
	[MaTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 3/14/2018 11:15:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc](
	[MaTin] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](255) NOT NULL,
	[TomTat] [nvarchar](255) NOT NULL,
	[UrlHinh] [nvarchar](255) NOT NULL,
	[NoiDung] [ntext] NOT NULL,
	[LuotXem] [int] NULL DEFAULT ((0)),
	[NgayCapNhat] [smalldatetime] NULL,
	[AnHien] [bit] NOT NULL,
 CONSTRAINT [PK_TinTuc] PRIMARY KEY CLUSTERED 
(
	[MaTin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([MaAdmin], [Username], [Password], [Email], [HoTen], [DiaChi], [DienThoai], [CMND], [NgaySinh], [GioiTinh], [NgayDangKy], [Avatar], [AnHien]) VALUES (1, N'admin', N'1231231', N'admin@Gmail.com', N'Đào Anh Dũng', N'123 Xóm lều', N'01659020020', N'241351483', CAST(N'1993-03-06 00:00:00' AS SmallDateTime), 1, CAST(N'2014-03-19 00:00:00' AS SmallDateTime), N'/Content/Images/Upload/Avatar_Admin.jpg', 1)
INSERT [dbo].[Admin] ([MaAdmin], [Username], [Password], [Email], [HoTen], [DiaChi], [DienThoai], [CMND], [NgaySinh], [GioiTinh], [NgayDangKy], [Avatar], [AnHien]) VALUES (2, N'admin1', N'1231231', N'admin1@Gmail.com', N'Nguyễn Tấn Dũng', N'123 Xóm lá', N'01688344585', N'123456789', CAST(N'1985-05-22 00:00:00' AS SmallDateTime), 1, CAST(N'2014-03-20 00:00:00' AS SmallDateTime), N'/Content/Images/Upload/Avatar_Admin.jpg', 1)
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[CT_DonHang] ON 

INSERT [dbo].[CT_DonHang] ([MaCTDH], [MaDH], [MaSP], [SoLuong], [Gia], [Thanhtien]) VALUES (1, 1, 1, 1, CAST(22290000 AS Decimal(18, 0)), CAST(22290000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DonHang] ([MaCTDH], [MaDH], [MaSP], [SoLuong], [Gia], [Thanhtien]) VALUES (2, 1, 15, 1, CAST(2990000 AS Decimal(18, 0)), CAST(2691000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[CT_DonHang] OFF
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayMua], [NgayGiao], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [HTThanhToan], [Trigia], [Dagiao]) VALUES (1, 1, CAST(N'2014-07-19 00:00:00' AS SmallDateTime), CAST(N'2014-07-20 00:00:00' AS SmallDateTime), N'Nguyễn Văn Thuận', N'123 Vuon lai', N'01659020020', 1, CAST(30472000 AS Decimal(18, 0)), 0)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
SET IDENTITY_INSERT [dbo].[GioHang] ON 

INSERT [dbo].[GioHang] ([Id], [MaGH], [MaSP], [SoLuong], [Thanhtien], [NgayMua]) VALUES (2, N'93d1ee0c-ce7f-4c57-89ce-2bc573abcca3', 1, 1, CAST(5290000 AS Decimal(18, 0)), CAST(N'2017-12-27 13:43:00' AS SmallDateTime))
INSERT [dbo].[GioHang] ([Id], [MaGH], [MaSP], [SoLuong], [Thanhtien], [NgayMua]) VALUES (3, N'93d1ee0c-ce7f-4c57-89ce-2bc573abcca3', 19, 1, CAST(1670000 AS Decimal(18, 0)), CAST(N'2017-12-27 13:44:00' AS SmallDateTime))
INSERT [dbo].[GioHang] ([Id], [MaGH], [MaSP], [SoLuong], [Thanhtien], [NgayMua]) VALUES (4, N'93d1ee0c-ce7f-4c57-89ce-2bc573abcca3', 25, 1, CAST(4990000 AS Decimal(18, 0)), CAST(N'2017-12-27 13:44:00' AS SmallDateTime))
INSERT [dbo].[GioHang] ([Id], [MaGH], [MaSP], [SoLuong], [Thanhtien], [NgayMua]) VALUES (5, N'343ad283-7a26-4aa8-bfcb-d41176bea591', 29, 1, CAST(6990000 AS Decimal(18, 0)), CAST(N'2018-01-03 00:44:00' AS SmallDateTime))
INSERT [dbo].[GioHang] ([Id], [MaGH], [MaSP], [SoLuong], [Thanhtien], [NgayMua]) VALUES (6, N'18134708-c561-4964-a15d-9678f96cf149', 24, 1, CAST(4990000 AS Decimal(18, 0)), CAST(N'2018-01-05 15:54:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[GioHang] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [Username], [Password], [Email], [HoTen], [DiaChi], [DienThoai], [CMND], [NgaySinh], [GioiTinh], [NgayDangKy], [Avatar], [AnHien]) VALUES (1, N'Thuan', N'123123', N'hacker.handsome.93@gmail.com', N'Nguyễn Văn Thuận', N'123 Vườn lài', N'01659020020', N'241351483', CAST(N'1993-03-06 00:00:00' AS SmallDateTime), 1, CAST(N'2014-03-04 00:00:00' AS SmallDateTime), N'/Content/Images/Upload/Thuan.jpg', 1)
INSERT [dbo].[KhachHang] ([MaKH], [Username], [Password], [Email], [HoTen], [DiaChi], [DienThoai], [CMND], [NgaySinh], [GioiTinh], [NgayDangKy], [Avatar], [AnHien]) VALUES (5, N'Chien', N'123123', N'mchiensd@gmail.com', N'Trần Minh Chiến', N'Hutech', N'0975147555', N'254751984', CAST(N'1990-08-20 00:00:00' AS SmallDateTime), 1, CAST(N'2014-03-27 00:00:00' AS SmallDateTime), N'/Content/Images/Upload/Chien.jpg', 1)
INSERT [dbo].[KhachHang] ([MaKH], [Username], [Password], [Email], [HoTen], [DiaChi], [DienThoai], [CMND], [NgaySinh], [GioiTinh], [NgayDangKy], [Avatar], [AnHien]) VALUES (6, N'Cuong', N'123123', N'Cuongnguyen@yahoo.com', N'Nguyễn Hữu Cường', N'Hutech', N'0918158670', N'249564128', CAST(N'1979-10-02 00:00:00' AS SmallDateTime), 1, CAST(N'2014-03-27 00:00:00' AS SmallDateTime), N'/Content/Images/Upload/Cuong.jpg', 1)
INSERT [dbo].[KhachHang] ([MaKH], [Username], [Password], [Email], [HoTen], [DiaChi], [DienThoai], [CMND], [NgaySinh], [GioiTinh], [NgayDangKy], [Avatar], [AnHien]) VALUES (7, N'Tan', N'123123', N'tanle@yahoo.com', N'Lê Thanh Tân', N'Hutech Ung Văn Khiêm', N'0905475135', N'547124987', CAST(N'1985-02-10 00:00:00' AS SmallDateTime), 1, CAST(N'2014-03-27 00:00:00' AS SmallDateTime), N'/Content/Images/Upload/Tan.jpg', 1)
INSERT [dbo].[KhachHang] ([MaKH], [Username], [Password], [Email], [HoTen], [DiaChi], [DienThoai], [CMND], [NgaySinh], [GioiTinh], [NgayDangKy], [Avatar], [AnHien]) VALUES (8, N'Tu', N'123123', N'tuantu14@gmail.com', N'Trịnh Châu Tuấn Tú', N'Hutech', N'0983547854', N'475135947', CAST(N'1996-01-20 00:00:00' AS SmallDateTime), 1, CAST(N'2014-03-27 00:00:00' AS SmallDateTime), N'/Content/Images/Upload/Tu.jpg', 0)
INSERT [dbo].[KhachHang] ([MaKH], [Username], [Password], [Email], [HoTen], [DiaChi], [DienThoai], [CMND], [NgaySinh], [GioiTinh], [NgayDangKy], [Avatar], [AnHien]) VALUES (14, N'Sang', N'123123', N'sangnguyentan@gmail.com', N'Nguyễn Tấn Sang', N'Hutech', N'01638948429', N'341849026', CAST(N'1996-08-04 00:00:00' AS SmallDateTime), 1, CAST(N'2017-12-12 00:00:00' AS SmallDateTime), N'/Content/Images/Upload/Sang.jpg', 0)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[LienHe] ON 

INSERT [dbo].[LienHe] ([MaLH], [MaKH], [Avatar], [TenNguoiGui], [NoiDung], [NgayGui], [LuotGui], [DaDocKH], [DaDocAD], [Anhien]) VALUES (8, 5, N'/Content/Images/Upload/avatar.jpg', N'Trần Thu Nga', N'Công ty có bán iphone 6 không thế admin', CAST(N'2014-03-25 00:00:00' AS SmallDateTime), 0, 1, 0, 1)
INSERT [dbo].[LienHe] ([MaLH], [MaKH], [Avatar], [TenNguoiGui], [NoiDung], [NgayGui], [LuotGui], [DaDocKH], [DaDocAD], [Anhien]) VALUES (9, 6, N'/Content/Images/Upload/avatar.jpg', N'Võ Tấn Sang', N'Admin check đơn hàng dùm tôi nhé, vừa đặt hàng xong đấy', CAST(N'2014-03-25 00:00:00' AS SmallDateTime), 0, 1, 0, 1)
SET IDENTITY_INSERT [dbo].[LienHe] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([MaMenu], [TenMenu], [url], [Thutu]) VALUES (1, N'Trang chủ', N'/Home', 1)
INSERT [dbo].[Menu] ([MaMenu], [TenMenu], [url], [Thutu]) VALUES (2, N'Apple', N'/Home/Producer/1', 2)
INSERT [dbo].[Menu] ([MaMenu], [TenMenu], [url], [Thutu]) VALUES (3, N'HTC', N'/Home/Producer/2', 3)
INSERT [dbo].[Menu] ([MaMenu], [TenMenu], [url], [Thutu]) VALUES (4, N'Nokia', N'/Home/Producer/3', 4)
INSERT [dbo].[Menu] ([MaMenu], [TenMenu], [url], [Thutu]) VALUES (5, N'Samsung', N'/Home/Producer/4', 5)
INSERT [dbo].[Menu] ([MaMenu], [TenMenu], [url], [Thutu]) VALUES (6, N'Sony', N'/Home/Producer/5', 6)
INSERT [dbo].[Menu] ([MaMenu], [TenMenu], [url], [Thutu]) VALUES (7, N'Hãng khác', N'/Home/Producer/6', 7)
INSERT [dbo].[Menu] ([MaMenu], [TenMenu], [url], [Thutu]) VALUES (8, N'Khuyến mãi', N'/Home/Promotions', 8)
INSERT [dbo].[Menu] ([MaMenu], [TenMenu], [url], [Thutu]) VALUES (9, N'Tin công nghệ', N'/Home/News', 9)
INSERT [dbo].[Menu] ([MaMenu], [TenMenu], [url], [Thutu]) VALUES (10, N'Giới thiệu', N'/Home/About', 10)
INSERT [dbo].[Menu] ([MaMenu], [TenMenu], [url], [Thutu]) VALUES (11, N'Liên hệ', N'/Home/Contact', 11)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[NhaSanXuat] ON 

INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [AnHien]) VALUES (1, N'Apple', 1)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [AnHien]) VALUES (2, N'HTC', 1)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [AnHien]) VALUES (3, N'Nokia', 1)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [AnHien]) VALUES (4, N'Samsung', 1)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [AnHien]) VALUES (5, N'Sony', 1)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [AnHien]) VALUES (6, N'khác', 1)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [AnHien]) VALUES (7, N'Hồ Cẩm Đào', 0)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [AnHien]) VALUES (8, N'HKPhone', 0)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [AnHien]) VALUES (9, N'LG', 0)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [AnHien]) VALUES (10, N'OPPO', 0)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [AnHien]) VALUES (11, N'Gionee', 0)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [AnHien]) VALUES (12, N'Lenovo', 0)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [AnHien]) VALUES (13, N'Mobell', 0)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [AnHien]) VALUES (14, N'Mobiistar', 0)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [AnHien]) VALUES (15, N'Q-Mobile', 0)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [AnHien]) VALUES (16, N'HiPhone', 0)
SET IDENTITY_INSERT [dbo].[NhaSanXuat] OFF
SET IDENTITY_INSERT [dbo].[PhanQuyen_Admin] ON 

INSERT [dbo].[PhanQuyen_Admin] ([MaPQ], [MaAdmin], [PQ_Menu], [PQ_Slider], [PQ_NhaSanXuat], [PQ_SanPham], [PQ_KhachHang], [PQ_DonHang], [PQ_TinTuc], [PQ_QuangCao], [PQ_LienHe], [PQ_GioiThieu], [PQ_QuanTriAdmin], [PQ_SiteMap]) VALUES (1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[PhanQuyen_Admin] ([MaPQ], [MaAdmin], [PQ_Menu], [PQ_Slider], [PQ_NhaSanXuat], [PQ_SanPham], [PQ_KhachHang], [PQ_DonHang], [PQ_TinTuc], [PQ_QuangCao], [PQ_LienHe], [PQ_GioiThieu], [PQ_QuanTriAdmin], [PQ_SiteMap]) VALUES (2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[PhanQuyen_Admin] OFF
SET IDENTITY_INSERT [dbo].[QuangCao] ON 

INSERT [dbo].[QuangCao] ([MaQC], [TenQC], [TenCty], [UrlHinh], [LinkUrl], [vitri], [Ngaybatdau], [Ngayhethan], [AnHien]) VALUES (1, N'Điện thoại Lumia', N'Nokia', N'/Content/Images/QuangCao/Qc1.gif', N'http://www.nokia.com/', N'1', CAST(N'2014-03-22 00:00:00' AS SmallDateTime), CAST(N'2015-03-22 00:00:00' AS SmallDateTime), 1)
SET IDENTITY_INSERT [dbo].[QuangCao] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (1, N'iPhone 5S 64GB', N'/Content/Images/Apple/iphone-5s-64gb.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/Apple/Hinh360-iphone5s/iPhone-5S-360-org-1.jpg', N'" /> </a>', CAST(5290000 AS Decimal(18, 0)), CAST(5500000 AS Decimal(18, 0)), N'<p>M&agrave;n h&igrave;nh: DVGA, 4.0&quot;, 640 x 1136 pixels CPU: Apple A7, 2 nh&acirc;n, 1.3 GHz RAM 1 GB Hệ điều h&agrave;nh: iOS 7.0 Camera ch&iacute;nh: 8.0 MP, Quay phim FullHD 1080p@30fps Camera phụ: 1.2 MP Bộ nhớ trong: 64 GB Thẻ nhớ ngo&agrave;i đến: Kh&ocirc;ng Dung lượng pin: 1560 mAh</p>
', N'<p><img src="http://cdn.tgdd.vn/Products/Images/42/60549/Kit/tinh-nang-iphone-5S.jpg" /></p>

<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td rowspan="2">
			<p>Th&ocirc;ng tin chung</p>
			</td>
			<td>Hệ điều h&agrave;nh</td>
			<td>iOS 7.0</td>
		</tr>
		<tr>
			<td>
			<p>Ng&ocirc;n ngữ</p>
			</td>
			<td>Tiếng Việt, Tiếng Anh, Tiếng Hoa, Tiếng Th&aacute;i, Tiếng Nhật</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>Loại m&agrave;n h&igrave;nh</td>
			<td>LED-backlit IPS LCD</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;u m&agrave;n h&igrave;nh</p>
			</td>
			<td>16 triệu m&agrave;u</td>
		</tr>
		<tr>
			<td>
			<p>Chuẩn m&agrave;n h&igrave;nh</p>
			</td>
			<td>DVGA</td>
		</tr>
		<tr>
			<td>
			<p>Độ ph&acirc;n giải</p>
			</td>
			<td>640 x 1136 pixels</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh rộng</p>
			</td>
			<td>4.0&quot;</td>
		</tr>
		<tr>
			<td>
			<p>C&ocirc;ng nghệ cảm ứng</p>
			</td>
			<td>Cảm ứng điện dung đa điểm</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Chụp h&igrave;nh &amp; Quay phim</p>
			</td>
			<td>Camera sau</td>
			<td>8.0 MP</td>
		</tr>
		<tr>
			<td>
			<p>Camera trước</p>
			</td>
			<td>1.2 MP</td>
		</tr>
		<tr>
			<td>
			<p>Đ&egrave;n Flash</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>T&iacute;nh năng camera</p>
			</td>
			<td>Tự động lấy n&eacute;t, chạm lấy n&eacute;t<br />
			Nhận diện khu&ocirc;n mặt, nụ cười<br />
			Chống rung</td>
		</tr>
		<tr>
			<td>
			<p>Quay phim</p>
			</td>
			<td>Quay phim FullHD 1080p@30fps</td>
		</tr>
		<tr>
			<td>
			<p>Videocall</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td rowspan="5">
			<p>CPU &amp; RAM</p>
			</td>
			<td>Tốc độ CPU</td>
			<td>1.3 GHz</td>
		</tr>
		<tr>
			<td>
			<p>Số nh&acirc;n</p>
			</td>
			<td>2 nh&acirc;n</td>
		</tr>
		<tr>
			<td>
			<p>Chipset</p>
			</td>
			<td>Apple A7</td>
		</tr>
		<tr>
			<td>
			<p>RAM</p>
			</td>
			<td>1 GB</td>
		</tr>
		<tr>
			<td>
			<p>Chip đồ họa (GPU)</p>
			</td>
			<td>PowerVR G6430</td>
		</tr>
		<tr>
			<td rowspan="4">
			<p>Bộ nhớ &amp; Lưu trữ</p>
			</td>
			<td>Danh bạ</td>
			<td>Kh&ocirc;ng giới hạn</td>
		</tr>
		<tr>
			<td>
			<p>Bộ nhớ trong (ROM)</p>
			</td>
			<td>64 GB</td>
		</tr>
		<tr>
			<td>
			<p>Thẻ nhớ ngo&agrave;i</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Hỗ trợ thẻ tối đa</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Thiết kế &amp; Trọng lượng</p>
			</td>
			<td>Kiểu d&aacute;ng</td>
			<td>Thanh + Cảm ứng</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước</p>
			</td>
			<td>123.8 x 58.6 x 7.6 mm</td>
		</tr>
		<tr>
			<td>
			<p>Trọng lượng (g)</p>
			</td>
			<td>112</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Th&ocirc;ng tin pin</p>
			</td>
			<td>Loại pin</td>
			<td>Pin chuẩn Li-Ion</td>
		</tr>
		<tr>
			<td>
			<p>Dung lượng pin</p>
			</td>
			<td>1560 mAh</td>
		</tr>
		<tr>
			<td>
			<p>Pin c&oacute; thể th&aacute;o rời</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="13">
			<p>Kết nối &amp; Cổng giao tiếp</p>
			</td>
			<td>3G</td>
			<td>DC-HSDPA, 42 Mbps; HSDPA, 21 Mbps; HSUPA, 5.76 Mbps</td>
		</tr>
		<tr>
			<td>
			<p>4G</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Loại Sim</p>
			</td>
			<td>Nano SIM</td>
		</tr>
		<tr>
			<td>
			<p>Khe gắn Sim</p>
			</td>
			<td>1 Sim</td>
		</tr>
		<tr>
			<td>
			<p>Wifi</p>
			</td>
			<td>Wi-Fi 802.11 a/b/g/n, dual-band, Wi-Fi hotspot</td>
		</tr>
		<tr>
			<td>
			<p>GPS</p>
			</td>
			<td>A-GPS v&agrave; GLONASS</td>
		</tr>
		<tr>
			<td>
			<p>Bluetooth</p>
			</td>
			<td>V4.0 with A2DP</td>
		</tr>
		<tr>
			<td>
			<p>GPRS/EDGE</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Jack tai nghe</p>
			</td>
			<td>3.5 mm</td>
		</tr>
		<tr>
			<td>
			<p>NFC</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối USB</p>
			</td>
			<td>USB 2.0</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối kh&aacute;c</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Cổng sạc</p>
			</td>
			<td>iPhone 5</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Giải tr&iacute; &amp; Ứng dụng</p>
			</td>
			<td>Xem phim</td>
			<td>MP4, WMV, H.263, H.264(MPEG4-AVC)</td>
		</tr>
		<tr>
			<td>
			<p>Nghe nhạc</p>
			</td>
			<td>MP3, WAV, WMA, eAAC+</td>
		</tr>
		<tr>
			<td>
			<p>Ghi &acirc;m</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Giới hạn cuộc gọi</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>FM radio</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Chức năng kh&aacute;c</p>
			</td>
			<td>Mạng x&atilde; hội ảo<br />
			Dịch vụ lưu trữ đ&aacute;m m&acirc;y iCloud<br />
			Mở kho&aacute; bằng dấu v&acirc;n tay<br />
			Micro chuy&ecirc;n dụng chống ồn<br />
			Chỉnh sửa h&igrave;nh ảnh, video</td>
		</tr>
	</tbody>
</table>
', N'<h2><a href="#" target="_blank">iPhone&nbsp;5S</a> &ndash; Chuy&ecirc;n nghiệp v&agrave; mạnh mẽ</h2>

<p><br />
<strong>iPhone&nbsp;5S v&agrave; iPhone 5C </strong>ch&iacute;nh l&agrave; hai nh&acirc;n tố t&acirc;m điểm khiến thị trường di động n&aacute;o nhiệt trong suốt những th&aacute;ng cuối năm 2013. Giống như những phi&ecirc;n bản iPhone trước đ&oacute; của Apple, phi&ecirc;n bản &ldquo;S&rdquo; mới n&agrave;y l&agrave; bản n&acirc;ng cấp rất đ&aacute;ng gi&aacute; của <a href="http://www.thegioididong.com/dtdd-apple-iphone" target="_blank">iPhone</a> 5, tuy vẫn c&ograve;n giữ nhiều chi tiết giống người tiền nhiệm nhưng thiết bị đ&atilde; c&oacute; những cải tiến mang t&iacute;nh bước ngoặt.</p>

<p><br />
C&ocirc;ng đoạn gia c&ocirc;ng l&agrave; thế mạnh của Apple v&agrave; n&oacute; được thể hiện tr&ecirc;n <strong>iPhone&nbsp;5S </strong>kh&aacute; r&otilde; r&agrave;ng, ngo&agrave;i m&agrave;u sắc đa dạng Apple c&ograve;n cung cấp cho thiết bị một bộ xử l&yacute; ho&agrave;n to&agrave;n mới v&agrave; mạnh mẽ c&ugrave;ng khả năng chụp ảnh vượt trội.</p>

<p><img alt="iPhone 5S bản nâng cấp đáng giá của iPhone 5" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image002.jpg" /><br />
<em>iPhone 5S bản n&acirc;ng cấp đ&aacute;ng gi&aacute; của iPhone 5</em></p>

<p>&nbsp;</p>

<h3><br />
Thiết kế nguy&ecirc;n khối cao cấp</h3>

<p>Si&ecirc;u phẩm<strong> 5S </strong>nh&igrave;n tổng thể th&igrave; kh&ocirc;ng kh&aacute;c mấy so với người tiền nhiệm <strong>iPhone&nbsp;5</strong>, thế nhưng Apple từ l&acirc;u đ&atilde; kh&aacute; nổi tiếng từ những chi tiết nhỏ nhất tr&ecirc;n sản phẩm của m&igrave;nh. Vẫn mang tr&ecirc;n m&igrave;nh thiết kế nguy&ecirc;n khối, kiểu d&aacute;ng vu&ocirc;ng vức mạnh mẽ v&agrave; độ d&agrave;y th&acirc;n m&aacute;y giữ nguy&ecirc;n 7.6mm.</p>

<p><br />
Chiếc <a href="http://www.thegioididong.com/dtdd" target="_blank">smartphone</a> n&agrave;y đ&atilde; l&agrave;m biến mất đi h&igrave;nh ảnh của một chiếc iPhone chỉ m&agrave;u đen v&agrave; trắng, thay v&agrave;o đ&oacute; Apple đ&atilde; mang đến người d&ugrave;ng c&aacute;c phi&ecirc;n bản m&agrave;u sắc rất tuyệt vời gồm c&oacute; m&agrave;u trắng, đen, v&agrave;ng, c&oacute; lẽ m&agrave;u v&agrave;ng &aacute;nh kim sẽ được người d&ugrave;ng săn t&igrave;m nhiều nhất.</p>

<p><img alt="Thiết kế tổng thể thì tương tự iPhone 5" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image004.jpg" /><br />
<em>Thiết kế tổng thể th&igrave; tương tự iPhone 5</em></p>

<p>&nbsp;</p>

<h3><br />
Ph&iacute;m Home t&iacute;ch hợp cảm biến bảo mật dấu v&acirc;n tay</h3>

<p>Trước thời điểm ra mắt cảm biến Touch ID tr&ecirc;n <strong>iPhone 5S</strong> ch&iacute;nh l&agrave; điều khiến mọi người kh&aacute; n&ocirc;n n&oacute;ng, h&aacute;o hức được chứng kiến. Kh&ocirc;ng l&agrave;m mất mặt, Apple Touch ID l&agrave; một t&iacute;nh năng tuyệt vời, kh&ocirc;ng những thế để thiết kế chức năng n&agrave;y &ldquo;quả t&aacute;o khuyết&rdquo; đ&atilde; d&agrave;y c&ocirc;ng nghi&ecirc;n cứu v&agrave; đưa v&agrave;o một chi tiết nhỏ nhưng kh&aacute; quan trọng.</p>

<p><img alt="Phím Home của Iphone 5S được thiết kế khá tinh xảo và đặc biệt" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image006.jpg" /><br />
<em>Ph&iacute;m Home được thiết kế kh&aacute; tinh xảo v&agrave; đặc biệt</em></p>

<p><br />
Người d&ugrave;ng đ&atilde; qu&aacute; quen thuộc với h&igrave;nh ảnh n&uacute;t Home truyền thống c&oacute; tr&ecirc;n iPhone, nhưng năm 2013 n&agrave;y n&oacute; đ&atilde; được cải tiến bằng một n&uacute;t ấn vật l&yacute; d&ugrave;ng chất liệu đ&aacute; sapphire chống xước, h&igrave;nh tr&ograve;n c&ugrave;ng v&ograve;ng kim loại s&aacute;ng b&oacute;ng bao quanh, nhờ chi tiết n&agrave;y m&agrave; &ldquo;mặt tiền&rdquo; của <strong>5S </strong>đ&atilde; hấp dẫn hơn kh&aacute; nhiều so với iPhone 5.</p>

<p><img alt="Iphone 5S Bảo mật cao với cảm biến Touch ID dưới nút Home" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image008.jpg" /><br />
<em>Bảo mật cao với cảm biến Touch ID dưới n&uacute;t Home</em></p>

<p><br />
N&uacute;t Home của m&aacute;y<strong> </strong>sẽ ki&ecirc;m th&ecirc;m chức năng qu&eacute;t dấu v&acirc;n tay người d&ugrave;ng, như một chiếc ch&igrave;a kh&oacute;a để mở c&aacute;nh cửa v&agrave;o <strong>iPhone 5S</strong>. Cảm biến n&agrave;y d&agrave;y c&oacute; 170 micron với độ ph&acirc;n giải 500 pixel /inch. N&oacute; c&oacute; thể đọc được ở g&oacute;c 360 độ, c&oacute; nghĩa l&agrave; đọc được v&acirc;n tay cho d&ugrave; ng&oacute;n tay của người d&ugrave;ng c&oacute; thể được định hướng ở bất kỳ hướng n&agrave;o. Apple cho biết n&oacute; c&oacute; thể đọc được c&aacute;c lớp da nằm dưới lớp biểu b&igrave;.</p>

<p><img alt="Thân máy của Iphone 5S chỉ mỏng 7.6mm" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image010.jpg" /><br />
<em>Th&acirc;n m&aacute;y của Iphone 5S chỉ mỏng 7.6mm</em></p>

<p>&nbsp;</p>

<h3><br />
Bộ xử l&iacute; A7 64-bit mạnh mẽ</h3>

<p>Một chi tiết l&agrave;m Apple kh&aacute; h&atilde;nh diện về chiếc smartphone mới của m&igrave;nh đ&oacute; ch&iacute;nh l&agrave; bộ xử l&yacute; vượt trội chip A7 SoC 64-bit, Apple c&ograve;n tuy&ecirc;n bố rằng bộ xử l&yacute; n&agrave;y sẽ cho tốc độ gấp 56 lần so với iPhone phi&ecirc;n bản đầu v&agrave; hơn 2 lần so với <strong>iPhone 5</strong>. Đ&acirc;y l&agrave; chip xử l&yacute; mới v&agrave; ti&ecirc;n tiến cho ph&eacute;p hỗ trợ RAM tối đa l&ecirc;n 4GB.</p>

<p><img alt="Chip A7 mới trên Iphone 5S được người dùng đặt kỳ vọng lớn" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image012.jpg" /><br />
<em>Chip A7 mới tr&ecirc;n Iphone 5S được người d&ugrave;ng đặt kỳ vọng lớn</em></p>

<p><br />
Chip A7 64-bit của <a href="http://www.thegioididong.com/dtdd-apple-iphone" target="_blank">Apple</a> sẽ cho m&aacute;y hoạt động đồ họa 3D tốt hơn, chạy đa nhiệm tốt, xử l&yacute; c&ugrave;ng l&uacute;c nhiều chương tr&igrave;nh nhanh hơn. <strong>IPhone</strong><strong> </strong><strong>5S</strong> đi k&egrave;m với hầu hết lựa chọn kết nối ti&ecirc;u chuẩn như Bluetooth 4.0, 4G LTE, AirDrop, AirPlay&hellip;Điều đặc biệt l&agrave; kh&ocirc;ng c&oacute; kết nối NFC, l&agrave; t&iacute;nh năng kh&aacute; nhiều smartphone cao cấp chạy Android đều c&oacute;.</p>

<p><img alt="Chip A7 mới nhất của Apple giúp Iphone 5S chạy mượt mà" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image014.jpg" /><br />
<em>Chip A7 mới nhất của Apple gi&uacute;p Iphone 5S chạy mượt m&agrave;</em></p>

<p>&nbsp;</p>

<h3><br />
Tối ưu thời gian d&ugrave;ng pin</h3>

<p><strong>Apple</strong> cho người d&ugrave;ng thấy ngay chất lượng pin của <strong>iPhone 5S </strong>tốt như thế n&agrave;o ngay từ buổi ra mắt đầu ti&ecirc;n. 1560mAh, một dung lượng pin kh&aacute; nhỏ nếu so với c&aacute;c thiết bị Android cao cấp tuy nhi&ecirc;n với <strong>Apple</strong> th&igrave; đ&oacute; lại l&agrave; một điều ho&agrave;n to&agrave;n kh&aacute;c. Với dung lượng pin l&agrave; 1560mAh thiết bị cho bạn đến 10 giờ đ&agrave;m thoại 3G, lướt web với kết nối LTE, Wifi với thời lượng 10 tiếng đồng hồ. ngo&agrave;i ra bạn c&oacute; thể chơi nhạc đến 40 giờ v&agrave; ở chế độ chờ l&ecirc;n đến 250 giờ.</p>

<p><img alt="Chất lượng pin của iPhone 5S là khá tốt" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image016.jpg" /><br />
<em>Chất lượng pin của iPhone 5S l&agrave; kh&aacute; tốt</em></p>

<p>&nbsp;</p>

<h3><br />
M&agrave;n h&igrave;nh IPS 4 inch cực k&igrave; sắc n&eacute;t</h3>

<p>Kh&ocirc;ng chạy theo xu thế m&agrave;n h&igrave;nh lớn, Apple chỉ trang bị cho <strong> 5S</strong> m&agrave;n h&igrave;nh IPS độ ph&acirc;n giải 1136x640 pixels, mật độ điểm ảnh 326 ppi, k&iacute;ch thước 4 inch tương tự như với <strong>iPhone 5 v&agrave; 5C</strong>. Đ&acirc;y l&agrave; điểm m&agrave; nhiều người đ&atilde; ph&agrave;n n&agrave;n bởi đ&atilde; c&aacute;c thiết bị Android đang qu&aacute; phổ biến về smartphone m&agrave;n h&igrave;nh lớn.</p>

<p><br />
Thực tế th&igrave; nếu d&ugrave;ng m&agrave;n h&igrave;nh 4 inch sẽ thuận tiện v&agrave; dễ d&agrave;ng hơn rất nhiều cho người d&ugrave;ng bởi bạn c&oacute; thể d&ugrave;ng một tay dễ d&agrave;ng, độ ph&acirc;n giải tốt hơn n&ecirc;n độ mịn m&agrave;ng, sắc n&eacute;t cao hơn nếu so với c&aacute;c thiết bị m&agrave;n h&igrave;nh lớn m&agrave; độ ph&acirc;n giải thậm ch&iacute; c&ograve;n nhỏ hơn <strong>5S</strong>.</p>

<p><strong><img alt="Màn hình Iphone 5S chỉ 4 inch nhưng cầm sẽ rất vừa tay" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image018.jpg" /></strong><br />
<em>M&agrave;n h&igrave;nh Iphone 5S chỉ 4 inch cầm sẽ rất vừa tay</em></p>

<p>&nbsp;</p>

<h3><br />
Camera 8MP với khả năng chống rung v&agrave; chụp ảnh thiếu s&aacute;ng tốt</h3>

<p>Kh&ocirc;ng chạy đua theo xu thế camera khủng như c&aacute;c thiết bị cao cấp kh&aacute;c như <strong>Samsung Galaxy S4</strong>, <strong>Nokia Lumia 925</strong>, v&agrave; đặc biệt l&agrave; <strong>Lumia 1020</strong>, Apple lại tập trung v&agrave;o ph&aacute;t triển, n&acirc;ng cao chất lượng h&igrave;nh ảnh. <strong>iPhone 5S </strong>vẫn giữ camera 8MP, hỗ trợ đến 2 đ&egrave;n LED ph&iacute;a sau v&agrave; c&oacute; cảm biến lớn hơn 15% so với phi&ecirc;n bản trước, nhờ đ&oacute; camera sẽ bắt s&aacute;ng tốt hơn v&agrave; chất lượng h&igrave;nh ảnh sẽ được cải thiện đ&aacute;ng kể.</p>

<p><br />
Chiếc camera n&agrave;y c&oacute; khả năng chụp li&ecirc;n tục 10 khung h&igrave;nh tr&ecirc;n gi&acirc;y, ở chế độ chụp to&agrave;n cảnh panorama thiết bị cho bạn h&igrave;nh ảnh c&oacute; độ ph&acirc;n giải l&ecirc;n đến 28MP, camera sẽ tự động điều chỉnh &aacute;nh s&aacute;ng, l&agrave;m mượt m&agrave; c&aacute;c khung h&igrave;nh v&agrave; ổn định, chống rung khi bạn di chuyển tay.</p>

<p><img alt="Camera phía sau Iphone 5S hỗ trợ 2 đèn LED trợ sáng" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image020.jpg" /><br />
<em>Camera ph&iacute;a sau Iphone 5S hỗ trợ 2 đ&egrave;n LED trợ s&aacute;ng</em></p>

<p><br />
<strong>iPhone 5S</strong> ch&iacute;nh l&agrave; điều m&agrave; Fan của Apple mong ng&oacute;ng nhiều ng&agrave;y từ khi tin đồn xuất hiện v&agrave; n&oacute; đ&atilde; kh&ocirc;ng l&agrave;m người d&ugrave;ng thất vọng. L&agrave; bản n&acirc;ng cấp đ&aacute;ng gi&aacute; của <strong>iPhone 5</strong>, smartphone cao cấp n&agrave;y mang đến t&iacute;nh năng ưu việt như khả năng nhận diện dấu v&acirc;n tay th&ocirc;ng minh, chip xử l&yacute; mạnh mẽ mới nhất A7, cũng như camera 8MP với cảm biến lớn hơn 15% so với iPhone 5.</p>

<p><strong>Trung Hiếu</strong></p>

<table>
	<tbody>
		<tr>
			<td>
			<h3>Ưu điểm</h3>

			<ul>
				<li>Thiết kế cao cấp, nguy&ecirc;n khối, sang trọng.</li>
				<li>M&agrave;n h&igrave;nh 4 inch, độ ph&acirc;n giải cao, chất lượng h&igrave;nh ảnh tự nhi&ecirc;n, sắc n&eacute;t.</li>
				<li>Camera 8MP vượt trội với cảm biến lớn bắt s&aacute;ng rất tốt c&ugrave;ng đ&egrave;n flash k&eacute;p.</li>
				<li>Bộ xử l&yacute; mới nhất A7 của Apple đảm bảo m&aacute;y chạy mượt m&agrave;, tốc độ cao.</li>
				<li>N&uacute;t Home c&oacute; nhận diện dấu v&acirc;n tay.</li>
			</ul>
			</td>
			<td>
			<h3>Nhược điểm</h3>

			<ul>
				<li>Gi&aacute; th&agrave;nh cao.</li>
				<li>Vỏ m&aacute;y dễ bị trầy.</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>
', 1, 99, 5, 0, 3, CAST(N'2014-02-25 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (2, N'iPhone 5S 32GB', N'/Content/Images/Apple/iphone-5s-32gb.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/Apple/Hinh360-iphone5s/iPhone-5S-360-org-1.jpg', N'" /> </a>', CAST(4490000 AS Decimal(18, 0)), CAST(5000000 AS Decimal(18, 0)), N'<p>M&agrave;n h&igrave;nh: DVGA, 4.0&quot;, 640 x 1136 pixels CPU: Apple A7, 2 nh&acirc;n, 1.3 GHz RAM 1 GB Hệ điều h&agrave;nh: iOS 7.0 Camera ch&iacute;nh: 8.0 MP, Quay phim FullHD 1080p@30fps Camera phụ: 1.2 MP Bộ nhớ trong: 32 GB Thẻ nhớ ngo&agrave;i đến: Kh&ocirc;ng Dung lượng pin: 1560 mAh</p>
', N'<p><img src="http://cdn.tgdd.vn/Products/Images/42/60457/Kit/tinh-nang-iphone-5S.jpg" /></p>

<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td rowspan="2">
			<p>Th&ocirc;ng tin chung</p>
			</td>
			<td>Hệ điều h&agrave;nh</td>
			<td>iOS 7.0</td>
		</tr>
		<tr>
			<td>
			<p>Ng&ocirc;n ngữ</p>
			</td>
			<td>Tiếng Việt, Tiếng Anh, Tiếng Hoa, Tiếng Th&aacute;i, Tiếng Nhật</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>Loại m&agrave;n h&igrave;nh</td>
			<td>LED-backlit IPS LCD</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;u m&agrave;n h&igrave;nh</p>
			</td>
			<td>16 triệu m&agrave;u</td>
		</tr>
		<tr>
			<td>
			<p>Chuẩn m&agrave;n h&igrave;nh</p>
			</td>
			<td>DVGA</td>
		</tr>
		<tr>
			<td>
			<p>Độ ph&acirc;n giải</p>
			</td>
			<td>640 x 1136 pixels</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh rộng</p>
			</td>
			<td>4.0&quot;</td>
		</tr>
		<tr>
			<td>
			<p>C&ocirc;ng nghệ cảm ứng</p>
			</td>
			<td>Cảm ứng điện dung đa điểm</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Chụp h&igrave;nh &amp; Quay phim</p>
			</td>
			<td>Camera sau</td>
			<td>8.0 MP</td>
		</tr>
		<tr>
			<td>
			<p>Camera trước</p>
			</td>
			<td>1.2 MP</td>
		</tr>
		<tr>
			<td>
			<p>Đ&egrave;n Flash</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>T&iacute;nh năng camera</p>
			</td>
			<td>Tự động lấy n&eacute;t, chạm lấy n&eacute;t<br />
			Nhận diện khu&ocirc;n mặt, nụ cười<br />
			Chống rung</td>
		</tr>
		<tr>
			<td>
			<p>Quay phim</p>
			</td>
			<td>Quay phim FullHD 1080p@30fps</td>
		</tr>
		<tr>
			<td>
			<p>Videocall</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td rowspan="5">
			<p>CPU &amp; RAM</p>
			</td>
			<td>Tốc độ CPU</td>
			<td>1.3 GHz</td>
		</tr>
		<tr>
			<td>
			<p>Số nh&acirc;n</p>
			</td>
			<td>2 nh&acirc;n</td>
		</tr>
		<tr>
			<td>
			<p>Chipset</p>
			</td>
			<td>Apple A7</td>
		</tr>
		<tr>
			<td>
			<p>RAM</p>
			</td>
			<td>1 GB</td>
		</tr>
		<tr>
			<td>
			<p>Chip đồ họa (GPU)</p>
			</td>
			<td>PowerVR G6430</td>
		</tr>
		<tr>
			<td rowspan="4">
			<p>Bộ nhớ &amp; Lưu trữ</p>
			</td>
			<td>Danh bạ</td>
			<td>Kh&ocirc;ng giới hạn</td>
		</tr>
		<tr>
			<td>
			<p>Bộ nhớ trong (ROM)</p>
			</td>
			<td>32 GB</td>
		</tr>
		<tr>
			<td>
			<p>Thẻ nhớ ngo&agrave;i</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Hỗ trợ thẻ tối đa</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Thiết kế &amp; Trọng lượng</p>
			</td>
			<td>Kiểu d&aacute;ng</td>
			<td>Thanh + Cảm ứng</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước</p>
			</td>
			<td>123.8 x 58.6 x 7.6 mm</td>
		</tr>
		<tr>
			<td>
			<p>Trọng lượng (g)</p>
			</td>
			<td>112</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Th&ocirc;ng tin pin</p>
			</td>
			<td>Loại pin</td>
			<td>Pin chuẩn Li-Ion</td>
		</tr>
		<tr>
			<td>
			<p>Dung lượng pin</p>
			</td>
			<td>1560 mAh</td>
		</tr>
		<tr>
			<td>
			<p>Pin c&oacute; thể th&aacute;o rời</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="13">
			<p>Kết nối &amp; Cổng giao tiếp</p>
			</td>
			<td>3G</td>
			<td>DC-HSDPA, 42 Mbps; HSDPA, 21 Mbps; HSUPA, 5.76 Mbps</td>
		</tr>
		<tr>
			<td>
			<p>4G</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Loại Sim</p>
			</td>
			<td>Nano SIM</td>
		</tr>
		<tr>
			<td>
			<p>Khe gắn Sim</p>
			</td>
			<td>1 Sim</td>
		</tr>
		<tr>
			<td>
			<p>Wifi</p>
			</td>
			<td>Wi-Fi 802.11 a/b/g/n, dual-band, Wi-Fi hotspot</td>
		</tr>
		<tr>
			<td>
			<p>GPS</p>
			</td>
			<td>A-GPS v&agrave; GLONASS</td>
		</tr>
		<tr>
			<td>
			<p>Bluetooth</p>
			</td>
			<td>V4.0 with A2DP</td>
		</tr>
		<tr>
			<td>
			<p>GPRS/EDGE</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Jack tai nghe</p>
			</td>
			<td>3.5 mm</td>
		</tr>
		<tr>
			<td>
			<p>NFC</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối USB</p>
			</td>
			<td>USB 2.0</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối kh&aacute;c</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Cổng sạc</p>
			</td>
			<td>iPhone 5</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Giải tr&iacute; &amp; Ứng dụng</p>
			</td>
			<td>Xem phim</td>
			<td>MP4, WMV, H.263, H.264(MPEG4-AVC)</td>
		</tr>
		<tr>
			<td>
			<p>Nghe nhạc</p>
			</td>
			<td>MP3, WAV, WMA</td>
		</tr>
		<tr>
			<td>
			<p>Ghi &acirc;m</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Giới hạn cuộc gọi</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>FM radio</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Chức năng kh&aacute;c</p>
			</td>
			<td>Mạng x&atilde; hội ảo<br />
			Dịch vụ lưu trữ đ&aacute;m m&acirc;y iCloud<br />
			Mở kho&aacute; bằng dấu v&acirc;n tay<br />
			Micro chuy&ecirc;n dụng chống ồn<br />
			Chỉnh sửa h&igrave;nh ảnh, video</td>
		</tr>
	</tbody>
</table>
', N'<h2><a href="#" target="_blank">iPhone&nbsp;5S</a> &ndash; Chuy&ecirc;n nghiệp v&agrave; mạnh mẽ</h2>

<p><br />
<strong>iPhone&nbsp;5S v&agrave; iPhone 5C </strong>ch&iacute;nh l&agrave; hai nh&acirc;n tố t&acirc;m điểm khiến thị trường di động n&aacute;o nhiệt trong suốt những th&aacute;ng cuối năm 2013. Giống như những phi&ecirc;n bản <a href="http://www.thegioididong.com/dtdd-apple-iphone" target="_blank">iPhone</a> trước đ&oacute; của Apple, phi&ecirc;n bản &ldquo;S&rdquo; mới n&agrave;y l&agrave; bản n&acirc;ng cấp rất đ&aacute;ng gi&aacute; của iPhone 5, tuy vẫn c&ograve;n giữ nhiều chi tiết giống người tiền nhiệm nhưng thiết bị đ&atilde; c&oacute; những cải tiến mang t&iacute;nh bước ngoặt. C&ocirc;ng đoạn gia c&ocirc;ng l&agrave; thế mạnh của Apple v&agrave; n&oacute; được thể hiện tr&ecirc;n <strong>iPhone&nbsp;5S </strong>kh&aacute; r&otilde; r&agrave;ng, ngo&agrave;i m&agrave;u sắc đa dạng Apple c&ograve;n cung cấp cho thiết bị một bộ xử l&yacute; ho&agrave;n to&agrave;n mới v&agrave; mạnh mẽ c&ugrave;ng khả năng chụp ảnh vượt trội.</p>

<p><br />
<img alt="iPhone 5S bản nâng cấp đáng giá của iPhone 5" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image002.jpg" /><br />
<em>iPhone 5S bản n&acirc;ng cấp đ&aacute;ng gi&aacute; của iPhone 5</em></p>

<p>&nbsp;</p>

<h3><br />
Thiết kế nguy&ecirc;n khối cao cấp</h3>

<p>Si&ecirc;u phẩm<strong> 5S </strong>nh&igrave;n tổng thể th&igrave; kh&ocirc;ng kh&aacute;c mấy so với người tiền nhiệm <strong>iPhone&nbsp;5</strong>, thế nhưng Apple từ l&acirc;u đ&atilde; kh&aacute; nổi tiếng từ những chi tiết nhỏ nhất tr&ecirc;n sản phẩm của m&igrave;nh. Vẫn mang tr&ecirc;n m&igrave;nh thiết kế nguy&ecirc;n khối, kiểu d&aacute;ng vu&ocirc;ng vức mạnh mẽ v&agrave; độ d&agrave;y th&acirc;n m&aacute;y giữ nguy&ecirc;n 7.6mm. Chiếc <a href="http://www.thegioididong.com/dtdd" target="_blank">smartphone</a> n&agrave;y đ&atilde; l&agrave;m biến mất đi h&igrave;nh ảnh của một chiếc iPhone chỉ m&agrave;u đen v&agrave; trắng, thay v&agrave;o đ&oacute; Apple đ&atilde; mang đến người d&ugrave;ng c&aacute;c phi&ecirc;n bản m&agrave;u sắc rất tuyệt vời gồm c&oacute; m&agrave;u trắng, đen, v&agrave;ng, c&oacute; lẽ m&agrave;u v&agrave;ng &aacute;nh kim sẽ được người d&ugrave;ng săn t&igrave;m nhiều nhất.</p>

<p><br />
<img alt="Thiết kế tổng thể thì tương tự iPhone 5" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image004.jpg" /><br />
<em>Thiết kế tổng thể th&igrave; tương tự iPhone 5</em></p>

<p>&nbsp;</p>

<h3><br />
Ph&iacute;m Home t&iacute;ch hợp cảm biến bảo mật dấu v&acirc;n tay</h3>

<p>Trước thời điểm ra mắt cảm biến Touch ID tr&ecirc;n <strong>iPhone 5S</strong> ch&iacute;nh l&agrave; điều khiến mọi người kh&aacute; n&ocirc;n n&oacute;ng, h&aacute;o hức được chứng kiến. Kh&ocirc;ng l&agrave;m mất mặt, Apple Touch ID l&agrave; một t&iacute;nh năng tuyệt vời, kh&ocirc;ng những thế để thiết kế chức năng n&agrave;y &ldquo;quả t&aacute;o khuyết&rdquo; đ&atilde; d&agrave;y c&ocirc;ng nghi&ecirc;n cứu v&agrave; đưa v&agrave;o một chi tiết nhỏ nhưng kh&aacute; quan trọng.</p>

<p><br />
<img alt="Phím Home của Iphone 5S được thiết kế khá tinh xảo và đặc biệt" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image006.jpg" /><br />
<em>Ph&iacute;m Home được thiết kế kh&aacute; tinh xảo v&agrave; đặc biệt</em></p>

<p><br />
Người d&ugrave;ng đ&atilde; qu&aacute; quen thuộc với h&igrave;nh ảnh n&uacute;t Home truyền thống c&oacute; tr&ecirc;n iPhone, nhưng năm 2013 n&agrave;y n&oacute; đ&atilde; được cải tiến bằng một n&uacute;t ấn vật l&yacute; d&ugrave;ng chất liệu đ&aacute; sapphire chống xước, h&igrave;nh tr&ograve;n c&ugrave;ng v&ograve;ng kim loại s&aacute;ng b&oacute;ng bao quanh, nhờ chi tiết n&agrave;y m&agrave; &ldquo;mặt tiền&rdquo; của <strong>5S </strong>đ&atilde; hấp dẫn hơn kh&aacute; nhiều so với iPhone 5.</p>

<p><br />
<img alt="Iphone 5S Bảo mật cao với cảm biến Touch ID dưới nút Home" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image008.jpg" /><br />
<em>Bảo mật cao với cảm biến Touch ID dưới n&uacute;t Home</em></p>

<p><br />
N&uacute;t Home của m&aacute;y<strong> </strong>sẽ ki&ecirc;m th&ecirc;m chức năng qu&eacute;t dấu v&acirc;n tay người d&ugrave;ng, như một chiếc ch&igrave;a kh&oacute;a để mở c&aacute;nh cửa v&agrave;o <strong>iPhone 5S</strong>. Cảm biến n&agrave;y d&agrave;y c&oacute; 170 micron với độ ph&acirc;n giải 500 pixel /inch. N&oacute; c&oacute; thể đọc được ở g&oacute;c 360 độ, c&oacute; nghĩa l&agrave; đọc được v&acirc;n tay cho d&ugrave; ng&oacute;n tay của người d&ugrave;ng c&oacute; thể được định hướng ở bất kỳ hướng n&agrave;o. <a href="http://www.thegioididong.com/dtdd-apple-iphone" target="_blank">Apple</a> cho biết n&oacute; c&oacute; thể đọc được c&aacute;c lớp da nằm dưới lớp biểu b&igrave;.</p>

<p><br />
<img alt="Thân máy của Iphone 5S chỉ mỏng 7.6mm" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image010.jpg" /><br />
<em>Th&acirc;n m&aacute;y của Iphone 5S chỉ mỏng 7.6mm</em></p>

<p>&nbsp;</p>

<h3><br />
Bộ xử l&iacute; A7 64-bit mạnh mẽ</h3>

<p>Một chi tiết l&agrave;m Apple kh&aacute; h&atilde;nh diện về chiếc smartphone mới của m&igrave;nh đ&oacute; ch&iacute;nh l&agrave; bộ xử l&yacute; vượt trội chip A7 SoC 64-bit, Apple c&ograve;n tuy&ecirc;n bố rằng bộ xử l&yacute; n&agrave;y sẽ cho tốc độ gấp 56 lần so với iPhone phi&ecirc;n bản đầu v&agrave; hơn 2 lần so với <strong><a href="http://www.thegioididong.com/dtdd-apple-iphone" target="_blank">iPhone</a> 5</strong>. Đ&acirc;y l&agrave; chip xử l&yacute; mới v&agrave; ti&ecirc;n tiến cho ph&eacute;p hỗ trợ RAM tối đa l&ecirc;n 4GB.</p>

<p><br />
<img alt="Chip A7 mới trên Iphone 5S được người dùng đặt kỳ vọng lớn" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image012.jpg" /><br />
<em>Chip A7 mới tr&ecirc;n Iphone 5S được người d&ugrave;ng đặt kỳ vọng lớn</em></p>

<p><br />
Chip A7 64-bit của Apple sẽ cho m&aacute;y hoạt động đồ họa 3D tốt hơn, chạy đa nhiệm tốt, xử l&yacute; c&ugrave;ng l&uacute;c nhiều chương tr&igrave;nh nhanh hơn. <strong>IPhone</strong><strong> </strong><strong>5S</strong> đi k&egrave;m với hầu hết lựa chọn kết nối ti&ecirc;u chuẩn như Bluetooth 4.0, 4G LTE, AirDrop, AirPlay&hellip;Điều đặc biệt l&agrave; kh&ocirc;ng c&oacute; kết nối NFC, l&agrave; t&iacute;nh năng kh&aacute; nhiều smartphone cao cấp chạy Android đều c&oacute;.</p>

<p><br />
<img alt="Chip A7 mới nhất của Apple giúp Iphone 5S chạy mượt mà" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image014.jpg" /><br />
<em>Chip A7 mới nhất của Apple gi&uacute;p Iphone 5S chạy mượt m&agrave;</em></p>

<p>&nbsp;</p>

<h3><br />
Tối ưu thời gian d&ugrave;ng pin</h3>

<p><strong>Apple</strong> cho người d&ugrave;ng thấy ngay chất lượng pin của <strong>iPhone 5S </strong>tốt như thế n&agrave;o ngay từ buổi ra mắt đầu ti&ecirc;n. 1560mAh, một dung lượng pin kh&aacute; nhỏ nếu so với c&aacute;c thiết bị Android cao cấp tuy nhi&ecirc;n với <strong>Apple</strong> th&igrave; đ&oacute; lại l&agrave; một điều ho&agrave;n to&agrave;n kh&aacute;c. Với dung lượng pin l&agrave; 1560mAh thiết bị cho bạn đến 10 giờ đ&agrave;m thoại 3G, lướt web với kết nối LTE, Wifi với thời lượng 10 tiếng đồng hồ. ngo&agrave;i ra bạn c&oacute; thể chơi nhạc đến 40 giờ v&agrave; ở chế độ chờ l&ecirc;n đến 250 giờ.</p>

<p><br />
<img alt="Chất lượng pin của iPhone 5S là khá tốt" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image016.jpg" /><br />
<em>Chất lượng pin của iPhone 5S l&agrave; kh&aacute; tốt</em></p>

<p>&nbsp;</p>

<h3><br />
M&agrave;n h&igrave;nh IPS 4 inch cực k&igrave; sắc n&eacute;t</h3>

<p>Kh&ocirc;ng chạy theo xu thế m&agrave;n h&igrave;nh lớn, Apple chỉ trang bị cho <strong> 5S</strong> m&agrave;n h&igrave;nh IPS độ ph&acirc;n giải 1136x640 pixels, mật độ điểm ảnh 326 ppi, k&iacute;ch thước 4 inch tương tự như với <strong>iPhone 5 v&agrave; 5C</strong>. Đ&acirc;y l&agrave; điểm m&agrave; nhiều người đ&atilde; ph&agrave;n n&agrave;n bởi đ&atilde; c&aacute;c thiết bị Android đang qu&aacute; phổ biến về smartphone m&agrave;n h&igrave;nh lớn.</p>

<p><br />
Thực tế th&igrave; nếu d&ugrave;ng m&agrave;n h&igrave;nh 4 inch sẽ thuận tiện v&agrave; dễ d&agrave;ng hơn rất nhiều cho người d&ugrave;ng bởi bạn c&oacute; thể d&ugrave;ng một tay dễ d&agrave;ng, độ ph&acirc;n giải tốt hơn n&ecirc;n độ mịn m&agrave;ng, sắc n&eacute;t cao hơn nếu so với c&aacute;c thiết bị m&agrave;n h&igrave;nh lớn m&agrave; độ ph&acirc;n giải thậm ch&iacute; c&ograve;n nhỏ hơn <strong>5S</strong>.</p>

<p><br />
<strong><img alt="Màn hình Iphone 5S chỉ 4 inch nhưng cầm sẽ rất vừa tay" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image018.jpg" /></strong><br />
<em>M&agrave;n h&igrave;nh Iphone 5S chỉ 4 inch cầm sẽ rất vừa tay</em></p>

<p>&nbsp;</p>

<h3><br />
Camera 8MP với khả năng chống rung v&agrave; chụp ảnh thiếu s&aacute;ng tốt</h3>

<p>Kh&ocirc;ng chạy đua theo xu thế camera khủng như c&aacute;c thiết bị cao cấp kh&aacute;c như <strong>Samsung Galaxy S4</strong>, <strong>Nokia Lumia 925</strong>, v&agrave; đặc biệt l&agrave; <strong>Lumia 1020</strong>, Apple lại tập trung v&agrave;o ph&aacute;t triển, n&acirc;ng cao chất lượng h&igrave;nh ảnh. <strong>iPhone 5S </strong>vẫn giữ camera 8MP, hỗ trợ đến 2 đ&egrave;n LED ph&iacute;a sau v&agrave; c&oacute; cảm biến lớn hơn 15% so với phi&ecirc;n bản trước, nhờ đ&oacute; camera sẽ bắt s&aacute;ng tốt hơn v&agrave; chất lượng h&igrave;nh ảnh sẽ được cải thiện đ&aacute;ng kể.</p>

<p><br />
Chiếc camera n&agrave;y c&oacute; khả năng chụp li&ecirc;n tục 10 khung h&igrave;nh tr&ecirc;n gi&acirc;y, ở chế độ chụp to&agrave;n cảnh panorama thiết bị cho bạn h&igrave;nh ảnh c&oacute; độ ph&acirc;n giải l&ecirc;n đến 28MP, camera sẽ tự động điều chỉnh &aacute;nh s&aacute;ng, l&agrave;m mượt m&agrave; c&aacute;c khung h&igrave;nh v&agrave; ổn định, chống rung khi bạn di chuyển tay.</p>

<p><br />
<img alt="Camera phía sau Iphone 5S hỗ trợ 2 đèn LED trợ sáng" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image020.jpg" /><br />
<em>Camera ph&iacute;a sau Iphone 5S hỗ trợ 2 đ&egrave;n LED trợ s&aacute;ng</em></p>

<p><br />
<strong>iPhone 5S</strong> ch&iacute;nh l&agrave; điều m&agrave; Fan của Apple mong ng&oacute;ng nhiều ng&agrave;y từ khi tin đồn xuất hiện v&agrave; n&oacute; đ&atilde; kh&ocirc;ng l&agrave;m người d&ugrave;ng thất vọng. L&agrave; bản n&acirc;ng cấp đ&aacute;ng gi&aacute; của <strong>iPhone 5</strong>, smartphone cao cấp n&agrave;y mang đến t&iacute;nh năng ưu việt như khả năng nhận diện dấu v&acirc;n tay th&ocirc;ng minh, chip xử l&yacute; mạnh mẽ mới nhất A7, cũng như camera 8MP với cảm biến lớn hơn 15% so với iPhone 5.</p>

<p><strong>Trung Hiếu</strong></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<table>
	<tbody>
		<tr>
			<td>
			<h3>Ưu điểm</h3>

			<ul>
				<li>Thiết kế cao cấp, nguy&ecirc;n khối, sang trọng.</li>
				<li>M&agrave;n h&igrave;nh 4 inch, độ ph&acirc;n giải cao, chất lượng h&igrave;nh ảnh tự nhi&ecirc;n, sắc n&eacute;t.</li>
				<li>Camera 8MP vượt trội với cảm biến lớn bắt s&aacute;ng rất tốt c&ugrave;ng đ&egrave;n flash k&eacute;p.</li>
				<li>Bộ xử l&yacute; mới nhất A7 của Apple đảm bảo m&aacute;y chạy mượt m&agrave;, tốc độ cao.</li>
				<li>N&uacute;t Home c&oacute; nhận diện dấu v&acirc;n tay.</li>
			</ul>
			</td>
			<td>
			<h3>Nhược điểm</h3>

			<ul>
				<li>Gi&aacute; th&agrave;nh cao.</li>
				<li>Vỏ m&aacute;y dễ bị trầy.</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>
', 1, 44, 3, 0, 0, CAST(N'2017-12-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (3, N'iPhone 5S 16GB', N'/Content/Images/Apple/iphone-5s-16gb.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/Apple/Hinh360-iphone5s/iPhone-5S-360-org-1.jpg', N'" /> </a>', CAST(4990000 AS Decimal(18, 0)), CAST(5500000 AS Decimal(18, 0)), N'<p>M&agrave;n h&igrave;nh: DVGA, 4.0&quot;, 640 x 1136 pixels CPU: Apple A7, 2 nh&acirc;n, 1.3 GHz RAM 1 GB Hệ điều h&agrave;nh: iOS 7.0 Camera ch&iacute;nh: 8.0 MP, Quay phim FullHD 1080p@30fps Camera phụ: 1.2 MP Bộ nhớ trong: 16 GB Thẻ nhớ ngo&agrave;i đến: Kh&ocirc;ng Dung lượng pin: 1560 mAh</p>
', N'<p><img src="http://cdn.tgdd.vn/Products/Images/42/60549/Kit/tinh-nang-iphone-5S.jpg" /></p>

<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td rowspan="2">
			<p>Th&ocirc;ng tin chung</p>
			</td>
			<td>Hệ điều h&agrave;nh</td>
			<td>iOS 7.0</td>
		</tr>
		<tr>
			<td>
			<p>Ng&ocirc;n ngữ</p>
			</td>
			<td>Tiếng Việt, Tiếng Anh, Tiếng Hoa, Tiếng Th&aacute;i, Tiếng Nhật</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>Loại m&agrave;n h&igrave;nh</td>
			<td>LED-backlit IPS LCD</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;u m&agrave;n h&igrave;nh</p>
			</td>
			<td>16 triệu m&agrave;u</td>
		</tr>
		<tr>
			<td>
			<p>Chuẩn m&agrave;n h&igrave;nh</p>
			</td>
			<td>DVGA</td>
		</tr>
		<tr>
			<td>
			<p>Độ ph&acirc;n giải</p>
			</td>
			<td>640 x 1136 pixels</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh rộng</p>
			</td>
			<td>4.0&quot;</td>
		</tr>
		<tr>
			<td>
			<p>C&ocirc;ng nghệ cảm ứng</p>
			</td>
			<td>Cảm ứng điện dung đa điểm</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Chụp h&igrave;nh &amp; Quay phim</p>
			</td>
			<td>Camera sau</td>
			<td>8.0 MP</td>
		</tr>
		<tr>
			<td>
			<p>Camera trước</p>
			</td>
			<td>1.2 MP</td>
		</tr>
		<tr>
			<td>
			<p>Đ&egrave;n Flash</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>T&iacute;nh năng camera</p>
			</td>
			<td>Tự động lấy n&eacute;t, chạm lấy n&eacute;t<br />
			Nhận diện khu&ocirc;n mặt, nụ cười<br />
			Chống rung</td>
		</tr>
		<tr>
			<td>
			<p>Quay phim</p>
			</td>
			<td>Quay phim FullHD 1080p@30fps</td>
		</tr>
		<tr>
			<td>
			<p>Videocall</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td rowspan="5">
			<p>CPU &amp; RAM</p>
			</td>
			<td>Tốc độ CPU</td>
			<td>1.3 GHz</td>
		</tr>
		<tr>
			<td>
			<p>Số nh&acirc;n</p>
			</td>
			<td>2 nh&acirc;n</td>
		</tr>
		<tr>
			<td>
			<p>Chipset</p>
			</td>
			<td>Apple A7</td>
		</tr>
		<tr>
			<td>
			<p>RAM</p>
			</td>
			<td>1 GB</td>
		</tr>
		<tr>
			<td>
			<p>Chip đồ họa (GPU)</p>
			</td>
			<td>PowerVR G6430</td>
		</tr>
		<tr>
			<td rowspan="4">
			<p>Bộ nhớ &amp; Lưu trữ</p>
			</td>
			<td>Danh bạ</td>
			<td>Kh&ocirc;ng giới hạn</td>
		</tr>
		<tr>
			<td>
			<p>Bộ nhớ trong (ROM)</p>
			</td>
			<td>16 GB</td>
		</tr>
		<tr>
			<td>
			<p>Thẻ nhớ ngo&agrave;i</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Hỗ trợ thẻ tối đa</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Thiết kế &amp; Trọng lượng</p>
			</td>
			<td>Kiểu d&aacute;ng</td>
			<td>Thanh + Cảm ứng</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước</p>
			</td>
			<td>123.8 x 58.6 x 7.6 mm</td>
		</tr>
		<tr>
			<td>
			<p>Trọng lượng (g)</p>
			</td>
			<td>112</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Th&ocirc;ng tin pin</p>
			</td>
			<td>Loại pin</td>
			<td>Pin chuẩn Li-Ion</td>
		</tr>
		<tr>
			<td>
			<p>Dung lượng pin</p>
			</td>
			<td>1560 mAh</td>
		</tr>
		<tr>
			<td>
			<p>Pin c&oacute; thể th&aacute;o rời</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="13">
			<p>Kết nối &amp; Cổng giao tiếp</p>
			</td>
			<td>3G</td>
			<td>DC-HSDPA, 42 Mbps; HSDPA, 21 Mbps; HSUPA, 5.76 Mbps</td>
		</tr>
		<tr>
			<td>
			<p>4G</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Loại Sim</p>
			</td>
			<td>Nano SIM</td>
		</tr>
		<tr>
			<td>
			<p>Khe gắn Sim</p>
			</td>
			<td>1 Sim</td>
		</tr>
		<tr>
			<td>
			<p>Wifi</p>
			</td>
			<td>Wi-Fi 802.11 a/b/g/n, dual-band, Wi-Fi hotspot</td>
		</tr>
		<tr>
			<td>
			<p>GPS</p>
			</td>
			<td>A-GPS v&agrave; GLONASS</td>
		</tr>
		<tr>
			<td>
			<p>Bluetooth</p>
			</td>
			<td>V4.0 with A2DP</td>
		</tr>
		<tr>
			<td>
			<p>GPRS/EDGE</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Jack tai nghe</p>
			</td>
			<td>3.5 mm</td>
		</tr>
		<tr>
			<td>
			<p>NFC</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối USB</p>
			</td>
			<td>USB 2.0</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối kh&aacute;c</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Cổng sạc</p>
			</td>
			<td>iPhone 5</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Giải tr&iacute; &amp; Ứng dụng</p>
			</td>
			<td>Xem phim</td>
			<td>MP4, WMV, H.263, H.264(MPEG4-AVC)</td>
		</tr>
		<tr>
			<td>
			<p>Nghe nhạc</p>
			</td>
			<td>MP3, WAV, WMA, eAAC+</td>
		</tr>
		<tr>
			<td>
			<p>Ghi &acirc;m</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Giới hạn cuộc gọi</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>FM radio</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Chức năng kh&aacute;c</p>
			</td>
			<td>Mạng x&atilde; hội ảo<br />
			Dịch vụ lưu trữ đ&aacute;m m&acirc;y iCloud<br />
			Mở kho&aacute; bằng dấu v&acirc;n tay<br />
			Micro chuy&ecirc;n dụng chống ồn<br />
			Chỉnh sửa h&igrave;nh ảnh, video</td>
		</tr>
	</tbody>
</table>
', N'<h2><a href="#" target="_blank">iPhone&nbsp;5S</a> &ndash; Chuy&ecirc;n nghiệp v&agrave; mạnh mẽ</h2>

<p><br />
<strong>iPhone&nbsp;5S v&agrave; iPhone 5C </strong>ch&iacute;nh l&agrave; hai nh&acirc;n tố t&acirc;m điểm khiến thị trường di động n&aacute;o nhiệt trong suốt những th&aacute;ng cuối năm 2013. Giống như những phi&ecirc;n bản iPhone trước đ&oacute; của Apple, phi&ecirc;n bản &ldquo;S&rdquo; mới n&agrave;y l&agrave; bản n&acirc;ng cấp rất đ&aacute;ng gi&aacute; của <a href="http://www.thegioididong.com/dtdd-apple-iphone" target="_blank">iPhone</a> 5, tuy vẫn c&ograve;n giữ nhiều chi tiết giống người tiền nhiệm nhưng thiết bị đ&atilde; c&oacute; những cải tiến mang t&iacute;nh bước ngoặt.</p>

<p><br />
C&ocirc;ng đoạn gia c&ocirc;ng l&agrave; thế mạnh của Apple v&agrave; n&oacute; được thể hiện tr&ecirc;n <strong>iPhone&nbsp;5S </strong>kh&aacute; r&otilde; r&agrave;ng, ngo&agrave;i m&agrave;u sắc đa dạng Apple c&ograve;n cung cấp cho thiết bị một bộ xử l&yacute; ho&agrave;n to&agrave;n mới v&agrave; mạnh mẽ c&ugrave;ng khả năng chụp ảnh vượt trội.</p>

<p><img alt="iPhone 5S bản nâng cấp đáng giá của iPhone 5" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image002.jpg" /><br />
<em>iPhone 5S bản n&acirc;ng cấp đ&aacute;ng gi&aacute; của iPhone 5</em></p>

<p>&nbsp;</p>

<h3><br />
Thiết kế nguy&ecirc;n khối cao cấp</h3>

<p>Si&ecirc;u phẩm<strong> 5S </strong>nh&igrave;n tổng thể th&igrave; kh&ocirc;ng kh&aacute;c mấy so với người tiền nhiệm <strong>iPhone&nbsp;5</strong>, thế nhưng Apple từ l&acirc;u đ&atilde; kh&aacute; nổi tiếng từ những chi tiết nhỏ nhất tr&ecirc;n sản phẩm của m&igrave;nh. Vẫn mang tr&ecirc;n m&igrave;nh thiết kế nguy&ecirc;n khối, kiểu d&aacute;ng vu&ocirc;ng vức mạnh mẽ v&agrave; độ d&agrave;y th&acirc;n m&aacute;y giữ nguy&ecirc;n 7.6mm.</p>

<p><br />
Chiếc <a href="http://www.thegioididong.com/dtdd" target="_blank">smartphone</a> n&agrave;y đ&atilde; l&agrave;m biến mất đi h&igrave;nh ảnh của một chiếc iPhone chỉ m&agrave;u đen v&agrave; trắng, thay v&agrave;o đ&oacute; Apple đ&atilde; mang đến người d&ugrave;ng c&aacute;c phi&ecirc;n bản m&agrave;u sắc rất tuyệt vời gồm c&oacute; m&agrave;u trắng, đen, v&agrave;ng, c&oacute; lẽ m&agrave;u v&agrave;ng &aacute;nh kim sẽ được người d&ugrave;ng săn t&igrave;m nhiều nhất.</p>

<p><img alt="Thiết kế tổng thể thì tương tự iPhone 5" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image004.jpg" /><br />
<em>Thiết kế tổng thể th&igrave; tương tự iPhone 5</em></p>

<p>&nbsp;</p>

<h3><br />
Ph&iacute;m Home t&iacute;ch hợp cảm biến bảo mật dấu v&acirc;n tay</h3>

<p>Trước thời điểm ra mắt cảm biến Touch ID tr&ecirc;n <strong>iPhone 5S</strong> ch&iacute;nh l&agrave; điều khiến mọi người kh&aacute; n&ocirc;n n&oacute;ng, h&aacute;o hức được chứng kiến. Kh&ocirc;ng l&agrave;m mất mặt, Apple Touch ID l&agrave; một t&iacute;nh năng tuyệt vời, kh&ocirc;ng những thế để thiết kế chức năng n&agrave;y &ldquo;quả t&aacute;o khuyết&rdquo; đ&atilde; d&agrave;y c&ocirc;ng nghi&ecirc;n cứu v&agrave; đưa v&agrave;o một chi tiết nhỏ nhưng kh&aacute; quan trọng.</p>

<p><img alt="Phím Home của Iphone 5S được thiết kế khá tinh xảo và đặc biệt" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image006.jpg" /><br />
<em>Ph&iacute;m Home được thiết kế kh&aacute; tinh xảo v&agrave; đặc biệt</em></p>

<p><br />
Người d&ugrave;ng đ&atilde; qu&aacute; quen thuộc với h&igrave;nh ảnh n&uacute;t Home truyền thống c&oacute; tr&ecirc;n iPhone, nhưng năm 2013 n&agrave;y n&oacute; đ&atilde; được cải tiến bằng một n&uacute;t ấn vật l&yacute; d&ugrave;ng chất liệu đ&aacute; sapphire chống xước, h&igrave;nh tr&ograve;n c&ugrave;ng v&ograve;ng kim loại s&aacute;ng b&oacute;ng bao quanh, nhờ chi tiết n&agrave;y m&agrave; &ldquo;mặt tiền&rdquo; của <strong>5S </strong>đ&atilde; hấp dẫn hơn kh&aacute; nhiều so với iPhone 5.</p>

<p><img alt="Iphone 5S Bảo mật cao với cảm biến Touch ID dưới nút Home" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image008.jpg" /><br />
<em>Bảo mật cao với cảm biến Touch ID dưới n&uacute;t Home</em></p>

<p><br />
N&uacute;t Home của m&aacute;y<strong> </strong>sẽ ki&ecirc;m th&ecirc;m chức năng qu&eacute;t dấu v&acirc;n tay người d&ugrave;ng, như một chiếc ch&igrave;a kh&oacute;a để mở c&aacute;nh cửa v&agrave;o <strong>iPhone 5S</strong>. Cảm biến n&agrave;y d&agrave;y c&oacute; 170 micron với độ ph&acirc;n giải 500 pixel /inch. N&oacute; c&oacute; thể đọc được ở g&oacute;c 360 độ, c&oacute; nghĩa l&agrave; đọc được v&acirc;n tay cho d&ugrave; ng&oacute;n tay của người d&ugrave;ng c&oacute; thể được định hướng ở bất kỳ hướng n&agrave;o. Apple cho biết n&oacute; c&oacute; thể đọc được c&aacute;c lớp da nằm dưới lớp biểu b&igrave;.</p>

<p><img alt="Thân máy của Iphone 5S chỉ mỏng 7.6mm" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image010.jpg" /><br />
<em>Th&acirc;n m&aacute;y của Iphone 5S chỉ mỏng 7.6mm</em></p>

<p>&nbsp;</p>

<h3><br />
Bộ xử l&iacute; A7 64-bit mạnh mẽ</h3>

<p>Một chi tiết l&agrave;m Apple kh&aacute; h&atilde;nh diện về chiếc smartphone mới của m&igrave;nh đ&oacute; ch&iacute;nh l&agrave; bộ xử l&yacute; vượt trội chip A7 SoC 64-bit, Apple c&ograve;n tuy&ecirc;n bố rằng bộ xử l&yacute; n&agrave;y sẽ cho tốc độ gấp 56 lần so với iPhone phi&ecirc;n bản đầu v&agrave; hơn 2 lần so với <strong>iPhone 5</strong>. Đ&acirc;y l&agrave; chip xử l&yacute; mới v&agrave; ti&ecirc;n tiến cho ph&eacute;p hỗ trợ RAM tối đa l&ecirc;n 4GB.</p>

<p><img alt="Chip A7 mới trên Iphone 5S được người dùng đặt kỳ vọng lớn" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image012.jpg" /><br />
<em>Chip A7 mới tr&ecirc;n Iphone 5S được người d&ugrave;ng đặt kỳ vọng lớn</em></p>

<p><br />
Chip A7 64-bit của <a href="http://www.thegioididong.com/dtdd-apple-iphone" target="_blank">Apple</a> sẽ cho m&aacute;y hoạt động đồ họa 3D tốt hơn, chạy đa nhiệm tốt, xử l&yacute; c&ugrave;ng l&uacute;c nhiều chương tr&igrave;nh nhanh hơn. <strong>IPhone</strong><strong> </strong><strong>5S</strong> đi k&egrave;m với hầu hết lựa chọn kết nối ti&ecirc;u chuẩn như Bluetooth 4.0, 4G LTE, AirDrop, AirPlay&hellip;Điều đặc biệt l&agrave; kh&ocirc;ng c&oacute; kết nối NFC, l&agrave; t&iacute;nh năng kh&aacute; nhiều smartphone cao cấp chạy Android đều c&oacute;.</p>

<p><img alt="Chip A7 mới nhất của Apple giúp Iphone 5S chạy mượt mà" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image014.jpg" /><br />
<em>Chip A7 mới nhất của Apple gi&uacute;p Iphone 5S chạy mượt m&agrave;</em></p>

<p>&nbsp;</p>

<h3><br />
Tối ưu thời gian d&ugrave;ng pin</h3>

<p><strong>Apple</strong> cho người d&ugrave;ng thấy ngay chất lượng pin của <strong>iPhone 5S </strong>tốt như thế n&agrave;o ngay từ buổi ra mắt đầu ti&ecirc;n. 1560mAh, một dung lượng pin kh&aacute; nhỏ nếu so với c&aacute;c thiết bị Android cao cấp tuy nhi&ecirc;n với <strong>Apple</strong> th&igrave; đ&oacute; lại l&agrave; một điều ho&agrave;n to&agrave;n kh&aacute;c. Với dung lượng pin l&agrave; 1560mAh thiết bị cho bạn đến 10 giờ đ&agrave;m thoại 3G, lướt web với kết nối LTE, Wifi với thời lượng 10 tiếng đồng hồ. ngo&agrave;i ra bạn c&oacute; thể chơi nhạc đến 40 giờ v&agrave; ở chế độ chờ l&ecirc;n đến 250 giờ.</p>

<p><img alt="Chất lượng pin của iPhone 5S là khá tốt" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image016.jpg" /><br />
<em>Chất lượng pin của iPhone 5S l&agrave; kh&aacute; tốt</em></p>

<p>&nbsp;</p>

<h3><br />
M&agrave;n h&igrave;nh IPS 4 inch cực k&igrave; sắc n&eacute;t</h3>

<p>Kh&ocirc;ng chạy theo xu thế m&agrave;n h&igrave;nh lớn, Apple chỉ trang bị cho <strong> 5S</strong> m&agrave;n h&igrave;nh IPS độ ph&acirc;n giải 1136x640 pixels, mật độ điểm ảnh 326 ppi, k&iacute;ch thước 4 inch tương tự như với <strong>iPhone 5 v&agrave; 5C</strong>. Đ&acirc;y l&agrave; điểm m&agrave; nhiều người đ&atilde; ph&agrave;n n&agrave;n bởi đ&atilde; c&aacute;c thiết bị Android đang qu&aacute; phổ biến về smartphone m&agrave;n h&igrave;nh lớn.</p>

<p><br />
Thực tế th&igrave; nếu d&ugrave;ng m&agrave;n h&igrave;nh 4 inch sẽ thuận tiện v&agrave; dễ d&agrave;ng hơn rất nhiều cho người d&ugrave;ng bởi bạn c&oacute; thể d&ugrave;ng một tay dễ d&agrave;ng, độ ph&acirc;n giải tốt hơn n&ecirc;n độ mịn m&agrave;ng, sắc n&eacute;t cao hơn nếu so với c&aacute;c thiết bị m&agrave;n h&igrave;nh lớn m&agrave; độ ph&acirc;n giải thậm ch&iacute; c&ograve;n nhỏ hơn <strong>5S</strong>.</p>

<p><strong><img alt="Màn hình Iphone 5S chỉ 4 inch nhưng cầm sẽ rất vừa tay" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image018.jpg" /></strong><br />
<em>M&agrave;n h&igrave;nh Iphone 5S chỉ 4 inch cầm sẽ rất vừa tay</em></p>

<p>&nbsp;</p>

<h3><br />
Camera 8MP với khả năng chống rung v&agrave; chụp ảnh thiếu s&aacute;ng tốt</h3>

<p>Kh&ocirc;ng chạy đua theo xu thế camera khủng như c&aacute;c thiết bị cao cấp kh&aacute;c như <strong>Samsung Galaxy S4</strong>, <strong>Nokia Lumia 925</strong>, v&agrave; đặc biệt l&agrave; <strong>Lumia 1020</strong>, Apple lại tập trung v&agrave;o ph&aacute;t triển, n&acirc;ng cao chất lượng h&igrave;nh ảnh. <strong>iPhone 5S </strong>vẫn giữ camera 8MP, hỗ trợ đến 2 đ&egrave;n LED ph&iacute;a sau v&agrave; c&oacute; cảm biến lớn hơn 15% so với phi&ecirc;n bản trước, nhờ đ&oacute; camera sẽ bắt s&aacute;ng tốt hơn v&agrave; chất lượng h&igrave;nh ảnh sẽ được cải thiện đ&aacute;ng kể.</p>

<p><br />
Chiếc camera n&agrave;y c&oacute; khả năng chụp li&ecirc;n tục 10 khung h&igrave;nh tr&ecirc;n gi&acirc;y, ở chế độ chụp to&agrave;n cảnh panorama thiết bị cho bạn h&igrave;nh ảnh c&oacute; độ ph&acirc;n giải l&ecirc;n đến 28MP, camera sẽ tự động điều chỉnh &aacute;nh s&aacute;ng, l&agrave;m mượt m&agrave; c&aacute;c khung h&igrave;nh v&agrave; ổn định, chống rung khi bạn di chuyển tay.</p>

<p><img alt="Camera phía sau Iphone 5S hỗ trợ 2 đèn LED trợ sáng" src="http://cdn.tgdd.vn/Products/Images/42/60457/iphone-5s_clip_image020.jpg" /><br />
<em>Camera ph&iacute;a sau Iphone 5S hỗ trợ 2 đ&egrave;n LED trợ s&aacute;ng</em></p>

<p><br />
<strong>iPhone 5S</strong> ch&iacute;nh l&agrave; điều m&agrave; Fan của Apple mong ng&oacute;ng nhiều ng&agrave;y từ khi tin đồn xuất hiện v&agrave; n&oacute; đ&atilde; kh&ocirc;ng l&agrave;m người d&ugrave;ng thất vọng. L&agrave; bản n&acirc;ng cấp đ&aacute;ng gi&aacute; của <strong>iPhone 5</strong>, smartphone cao cấp n&agrave;y mang đến t&iacute;nh năng ưu việt như khả năng nhận diện dấu v&acirc;n tay th&ocirc;ng minh, chip xử l&yacute; mạnh mẽ mới nhất A7, cũng như camera 8MP với cảm biến lớn hơn 15% so với iPhone 5.</p>

<p><strong>Trung Hiếu</strong></p>

<table>
	<tbody>
		<tr>
			<td>
			<h3>Ưu điểm</h3>

			<ul>
				<li>Thiết kế cao cấp, nguy&ecirc;n khối, sang trọng.</li>
				<li>M&agrave;n h&igrave;nh 4 inch, độ ph&acirc;n giải cao, chất lượng h&igrave;nh ảnh tự nhi&ecirc;n, sắc n&eacute;t.</li>
				<li>Camera 8MP vượt trội với cảm biến lớn bắt s&aacute;ng rất tốt c&ugrave;ng đ&egrave;n flash k&eacute;p.</li>
				<li>Bộ xử l&yacute; mới nhất A7 của Apple đảm bảo m&aacute;y chạy mượt m&agrave;, tốc độ cao.</li>
				<li>N&uacute;t Home c&oacute; nhận diện dấu v&acirc;n tay.</li>
			</ul>
			</td>
			<td>
			<h3>Nhược điểm</h3>

			<ul>
				<li>Gi&aacute; th&agrave;nh cao.</li>
				<li>Vỏ m&aacute;y dễ bị trầy.</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>
', 1, 99, 1, 0, 0, CAST(N'2014-02-25 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (4, N'iPhone 5C 16GB', N'/Content/Images/Apple/iphone-5c-16gb.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/Apple/Hinh360-iphone5s/iPhone-5S-360-org-1.jpg', N'" /> </a>', CAST(2200000 AS Decimal(18, 0)), CAST(2680000 AS Decimal(18, 0)), N'<p>M&agrave;n h&igrave;nh: DVGA, 4.0&quot;, 640 x 1136 pixels CPU: Apple A6, 2 nh&acirc;n, 1.3 GHz RAM 1 GB Hệ điều h&agrave;nh: iOS 7.0 Camera ch&iacute;nh: 8.0 MP, Quay phim FullHD 1080p@30fps Camera phụ: 1.2 MP Bộ nhớ trong: 16 GB Thẻ nhớ ngo&agrave;i đến: Kh&ocirc;ng Dung lượng pin: 1560 mAh</p>
', N'<p><img src="http://cdn.tgdd.vn/Products/Images/42/60543/Kit/iPhone-5C-mo-ta-chuc-nang.jpg" /></p>

<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td rowspan="2">
			<p>Th&ocirc;ng tin chung</p>
			</td>
			<td>Hệ điều h&agrave;nh</td>
			<td>iOS 7.0</td>
		</tr>
		<tr>
			<td>
			<p>Ng&ocirc;n ngữ</p>
			</td>
			<td>Tiếng Việt, Tiếng Anh, Tiếng Hoa, Tiếng Th&aacute;i, Tiếng Nhật</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>Loại m&agrave;n h&igrave;nh</td>
			<td>LED-backlit IPS LCD</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;u m&agrave;n h&igrave;nh</p>
			</td>
			<td>16 triệu m&agrave;u</td>
		</tr>
		<tr>
			<td>
			<p>Chuẩn m&agrave;n h&igrave;nh</p>
			</td>
			<td>DVGA</td>
		</tr>
		<tr>
			<td>
			<p>Độ ph&acirc;n giải</p>
			</td>
			<td>640 x 1136 pixels</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh rộng</p>
			</td>
			<td>4.0&quot;</td>
		</tr>
		<tr>
			<td>
			<p>C&ocirc;ng nghệ cảm ứng</p>
			</td>
			<td>Cảm ứng điện dung đa điểm</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Chụp h&igrave;nh &amp; Quay phim</p>
			</td>
			<td>Camera sau</td>
			<td>8.0 MP</td>
		</tr>
		<tr>
			<td>
			<p>Camera trước</p>
			</td>
			<td>1.2 MP</td>
		</tr>
		<tr>
			<td>
			<p>Đ&egrave;n Flash</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>T&iacute;nh năng camera</p>
			</td>
			<td>Tự động lấy n&eacute;t, chạm lấy n&eacute;t<br />
			nhận diện khu&ocirc;n mặt</td>
		</tr>
		<tr>
			<td>
			<p>Quay phim</p>
			</td>
			<td>Quay phim FullHD 1080p@30fps</td>
		</tr>
		<tr>
			<td>
			<p>Videocall</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td rowspan="5">
			<p>CPU &amp; RAM</p>
			</td>
			<td>Tốc độ CPU</td>
			<td>1.3 GHz</td>
		</tr>
		<tr>
			<td>
			<p>Số nh&acirc;n</p>
			</td>
			<td>2 nh&acirc;n</td>
		</tr>
		<tr>
			<td>
			<p>Chipset</p>
			</td>
			<td>Apple A6</td>
		</tr>
		<tr>
			<td>
			<p>RAM</p>
			</td>
			<td>1 GB</td>
		</tr>
		<tr>
			<td>
			<p>Chip đồ họa (GPU)</p>
			</td>
			<td>PowerVR SGX 543MP3</td>
		</tr>
		<tr>
			<td rowspan="4">
			<p>Bộ nhớ &amp; Lưu trữ</p>
			</td>
			<td>Danh bạ</td>
			<td>Kh&ocirc;ng giới hạn</td>
		</tr>
		<tr>
			<td>
			<p>Bộ nhớ trong (ROM)</p>
			</td>
			<td>16 GB</td>
		</tr>
		<tr>
			<td>
			<p>Thẻ nhớ ngo&agrave;i</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Hỗ trợ thẻ tối đa</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Thiết kế &amp; Trọng lượng</p>
			</td>
			<td>Kiểu d&aacute;ng</td>
			<td>Thanh + Cảm ứng</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước</p>
			</td>
			<td>124.4 x 59.2 x 9 mm</td>
		</tr>
		<tr>
			<td>
			<p>Trọng lượng (g)</p>
			</td>
			<td>132</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Th&ocirc;ng tin pin</p>
			</td>
			<td>Loại pin</td>
			<td>Pin chuẩn Li-Ion</td>
		</tr>
		<tr>
			<td>
			<p>Dung lượng pin</p>
			</td>
			<td>1510 mAh</td>
		</tr>
		<tr>
			<td>
			<p>Pin c&oacute; thể th&aacute;o rời</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="13">
			<p>Kết nối &amp; Cổng giao tiếp</p>
			</td>
			<td>3G</td>
			<td>DC-HSDPA, 42 Mbps; HSDPA, 21 Mbps; HSUPA, 5.76 Mbps</td>
		</tr>
		<tr>
			<td>
			<p>4G</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Loại Sim</p>
			</td>
			<td>Nano SIM</td>
		</tr>
		<tr>
			<td>
			<p>Khe gắn Sim</p>
			</td>
			<td>1 Sim</td>
		</tr>
		<tr>
			<td>
			<p>Wifi</p>
			</td>
			<td>Wi-Fi 802.11 a/b/g/n, dual-band, Wi-Fi hotspot</td>
		</tr>
		<tr>
			<td>
			<p>GPS</p>
			</td>
			<td>A-GPS v&agrave; GLONASS</td>
		</tr>
		<tr>
			<td>
			<p>Bluetooth</p>
			</td>
			<td>V4.0 with A2DP</td>
		</tr>
		<tr>
			<td>
			<p>GPRS/EDGE</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Jack tai nghe</p>
			</td>
			<td>3.5 mm</td>
		</tr>
		<tr>
			<td>
			<p>NFC</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối USB</p>
			</td>
			<td>USB 2.0</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối kh&aacute;c</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Cổng sạc</p>
			</td>
			<td>iPhone 5</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Giải tr&iacute; &amp; Ứng dụng</p>
			</td>
			<td>Xem phim</td>
			<td>MP4, WMV, H.263, H.264(MPEG4-AVC)</td>
		</tr>
		<tr>
			<td>
			<p>Nghe nhạc</p>
			</td>
			<td>MP3, WAV, WMA, eAAC+</td>
		</tr>
		<tr>
			<td>
			<p>Ghi &acirc;m</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Giới hạn cuộc gọi</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>FM radio</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Chức năng kh&aacute;c</p>
			</td>
			<td>Mạng x&atilde; hội ảo<br />
			Dịch vụ lưu trữ đ&aacute;m m&acirc;y iCloud<br />
			Micro chuy&ecirc;n dụng chống ồn<br />
			Chỉnh sửa h&igrave;nh ảnh, video</td>
		</tr>
	</tbody>
</table>
', N'<h2><a href="#" target="_blank">iPhone</a> 5C - Trẻ trung, hiện đại, nhưng vẫn đầy sức mạnh</h2>

<p><br />
Trong c&aacute;c sản phẩm của <a href="http://www.thegioididong.com/dtdd-apple-iphone" target="_blank">Apple</a>, ngo&agrave;i chiếc m&aacute;y nghe nhạc iPod Nano th&igrave; <strong>iPhone 5C</strong> c&oacute; lẽ l&agrave; sản phẩm m&agrave;u m&egrave; nhất, từ thiết kế cho đến phụ kiện đi k&egrave;m. Với việc c&oacute; th&ecirc;m nhiều m&agrave;u sắc v&agrave; sử dụng vỏ nhựa, <strong>5C</strong> tr&ocirc;ng trẻ trung hơn nhiều so với đ&agrave;n anh của n&oacute; v&agrave; thổi một luồng gi&oacute; mới cho thị trường di động.</p>

<p>&nbsp;</p>

<h3><br />
Thiết kế đầy m&agrave;u sắc mang lại sức sống tươi trẻ</h3>

<p>Phải c&ocirc;ng nhận rằng, <strong>iPhone 5S </strong>sử dụng vỏ nh&ocirc;m tr&ocirc;ng thật sang trọng nhưng nếu n&oacute;i về độ trẻ trung th&igrave; <strong>Apple iPhone 5C</strong> lại chiến thắng tuyệt đối. M&aacute;y sử dụng bộ vỏ nhựa polycarbonat cao cấp với lớp phủ b&oacute;ng bẩy b&ecirc;n ngo&agrave;i.</p>

<p><br />
Tất cả c&aacute;c g&oacute;c cạnh tr&ecirc;n th&acirc;n m&aacute;y đều được v&aacute;t cong nhẹ nh&agrave;ng, chắc chắn bạn sẽ kh&ocirc;ng t&igrave;m thấy một đường n&eacute;t sắc cạnh n&agrave;o tr&ecirc;n <strong> 5C</strong>. Thiết kế n&agrave;y gi&uacute;p người d&ugrave;ng kh&ocirc;ng bị cấn tay khi cầm m&aacute;y n&ecirc;n sẽ thoải m&aacute;i hơn nhiều so với c&aacute;c <a href="http://www.thegioididong.com/dtdd?f=smartphone" target="_blank">smartphone </a>vu&ocirc;ng vức.</p>

<p><strong><img alt="iPhone 5C – Thanh kẹo đa sắc màu" src="http://cdn.tgdd.vn/Products/Images/42/60543/iphone-5c_clip_image002.jpg" /></strong><br />
<em>iPhone 5C &ndash; Thanh kẹo đa sắc m&agrave;u</em></p>

<p><br />
<strong>iPhone 5C </strong>c&oacute; 5 t&ugrave;y chọn m&agrave;u sắc gồm xanh l&aacute;, xanh dương, hồng, v&agrave;ng, trắng. Mỗi m&agrave;u đại diện cho mỗi c&aacute; t&iacute;nh ri&ecirc;ng biệt. Ngoại trừ ph&iacute;m Home, tất cả c&aacute;c ph&iacute;m vật l&yacute; c&ograve;n lại được thiết kế ton-sur-ton với m&agrave;u m&aacute;y n&ecirc;n tạo một sự đồng nhất tuyệt vời. Nh&igrave;n từ xa, thiết bị tr&ocirc;ng kh&ocirc;ng kh&aacute;c g&igrave; một thanh kẹo sắc m&agrave;u.</p>

<p><br />
<img alt="Các góc cạnh trên iPhone 5C được bo tròn nhẹ nhàng" src="http://cdn.tgdd.vn/Products/Images/42/60543/iphone-5c_clip_image004.jpg" /><br />
<em>C&aacute;c g&oacute;c cạnh tr&ecirc;n 5C được bo tr&ograve;n nhẹ nh&agrave;ng</em></p>

<p>&nbsp;</p>

<h3><br />
Hiệu năng mượt m&agrave; với chip A6 v&agrave; hệ điều h&agrave;nh iOS 7</h3>

<p>C&ugrave;ng ra mắt với <a href="http://www.thegioididong.com/dtdd/iphone-5s-32gb" target="_blank">iPhone 5S</a> nhưng <strong>5C </strong>kh&ocirc;ng được sở hữu chip A7 - 64 bit như người anh của n&oacute;. Tuy vậy, cấu h&igrave;nh của <strong>Apple iPhone 5C </strong>vẫn rất mạnh trong c&aacute;c thế hệ iPhone, tương đương với iPhone 5. M&aacute;y sở hữu chip A6 l&otilde;i k&eacute;p, RAM 1 GB, bộ nhớ trong 16GB. Với cấu h&igrave;nh như vậy, m&aacute;y ho&agrave;n to&agrave;n xử l&yacute; mượt m&agrave; c&aacute;c ứng dụng, kh&ocirc;ng k&eacute;m bất kỳ đối thủ n&agrave;o kh&aacute;c.</p>

<p><strong><img alt="Chip A6 có thể xử lý tốt mọi ứng dụng và game trên iPhone 5C" src="http://cdn.tgdd.vn/Products/Images/42/60543/iphone-5c_clip_image006.jpg" /></strong><br />
<em>Chip A6 c&oacute; thể xử l&yacute; tốt mọi ứng dụng v&agrave; game</em></p>

<p><br />
Quan trọng hơn, <strong>iPhone 5C </strong>được c&agrave;i đặt HĐH iOS 7 ngay khi xuất xưởng. <strong>iOS 7</strong> được thiết kế lại ho&agrave;n to&agrave;n mới, tối ưu giao diện, tăng cường trải nghiệm người d&ugrave;ng v&agrave; vẫn đảm bảo độ mượt như truyền thống của Apple. Chắc chắn, với bộ đ&ocirc;i chip A6 v&agrave; iOS 7, bạn sẽ kh&ocirc;ng thể n&agrave;o ph&agrave;n n&agrave;n về hiệu suất hoạt động của iPhone 5C.</p>

<p><img alt="iPhone 5C được trang bị HĐH iOS 7 với phong cách thiết kế phẳng thời thượng" src="http://cdn.tgdd.vn/Products/Images/42/60543/iphone-5c_clip_image008.jpg" /><br />
<em>HĐH iOS 7 với phong c&aacute;ch thiết kế phẳng thời thượng</em></p>

<p>&nbsp;</p>

<h3><br />
M&agrave;n h&igrave;nh LCD 4 inch Retina sắc n&eacute;t cho khả năng hiển thị kh&ocirc;ng thể tốt hơn</h3>

<p>Đối với c&aacute;c sản phẩm nh&agrave; T&aacute;o, m&agrave;n h&igrave;nh lu&ocirc;n l&agrave; yếu tố được đặt l&ecirc;n h&agrave;ng đầu v&agrave; <strong>5C </strong>cũng kh&ocirc;ng phải ngoại lệ, sở hữu m&agrave;n h&igrave;nh LCD k&iacute;ch thước 4 inch độ ph&acirc;n giải Retina (640 x 1136 px). Mặc d&ugrave; chưa đạt đến độ ph&acirc;n giải HD nhưng c&aacute;c c&ocirc;ng nghệ độc quyền từ Apple lu&ocirc;n khiến mọi thứ hiển thị tr&ecirc;n m&agrave;n h&igrave;nh<strong> </strong>thật sự sống động v&agrave; sắc n&eacute;t, kh&ocirc;ng k&eacute;m g&igrave; c&aacute;c si&ecirc;u phẩm Full HD chạy Android.</p>

<p><br />
Đặc biệt, m&agrave;n h&igrave;nh tr&ecirc;n <strong>iPhone 5C </strong>cũng được phủ lớp k&iacute;nh cường lực Gorilla Glass gi&uacute;p bảo vệ bề mặt m&agrave;n h&igrave;nh an to&agrave;n khỏi c&aacute;c t&aacute;c động vật l&yacute; kh&ocirc;ng mong muốn.</p>

<p><strong><img alt="Màn hình Retina trên iPhone 5C hiển thị tốt ở mọi góc nhìn" src="http://cdn.tgdd.vn/Products/Images/42/60543/iphone-5c_clip_image010.jpg" /></strong><br />
<em>M&agrave;n h&igrave;nh Retina hiển thị tốt ở mọi g&oacute;c nh&igrave;n</em></p>

<p>&nbsp;</p>

<h3><br />
Chất lượng h&igrave;nh ảnh tuyệt vời từ camera iSight độ ph&acirc;n giải 8 MP</h3>

<p><strong>Apple iPhone 5C </strong>sở hữu camera iSight 8 MP c&ugrave;ng đ&egrave;n flash LED kh&ocirc;ng thua k&eacute;m g&igrave; iPhone 5 hay 5S. Linh hồn của camera nằm ở thuật to&aacute;n xử l&yacute; h&igrave;nh ảnh b&ecirc;n trong. Khi chụp ảnh, m&aacute;y sẽ tự động c&acirc;n bằng m&agrave;u sắc, xử l&yacute; đến từng đối tượng như da mặt hay bầu trời, gi&uacute;p từng chi tiết tr&ecirc;n ảnh đều ho&agrave;n hảo ngo&agrave;i mong đợi.</p>

<p><strong><img alt="Ứng dụng camera với nhiều tính năng chụp ảnh sáng tạo trên iPhone 5C" src="http://cdn.tgdd.vn/Products/Images/42/60543/iphone-5c_clip_image012.jpg" /></strong><br />
<em>Ứng dụng camera với nhiều t&iacute;nh năng chụp ảnh s&aacute;ng tạo</em></p>

<p><br />
Ngo&agrave;i ra, ứng dụng camera tr&ecirc;n <strong>iPhone 5C </strong>cũng kh&ocirc;ng thiếu c&aacute;c t&iacute;nh năng chụp ảnh s&aacute;ng tạo như panorama, chụp nhiều ảnh chỉ với 1 lần chạm, &aacute;p dụng bộ lọc thời gian thực khi chụp,&hellip;Về khả năng quay video, thiết bị c&oacute; thể quay video chất lượng Full HD, khả năng zoom 3x v&agrave; nhận diện tối đa 10 khu&ocirc;n mặt khi quay phim. Đồng thời, bạn cũng c&oacute; thể chụp ảnh trong khi quay phim một c&aacute;ch tiện lợi.</p>

<p><img alt="Với iPhone 5C, bạn có thể vừa chụp ảnh vừa quay phim cùng lúc" src="http://cdn.tgdd.vn/Products/Images/42/60543/iphone-5c_clip_image014.jpg" /><br />
<em>Với iPhone 5C, bạn c&oacute; thể vừa chụp ảnh vừa quay phim c&ugrave;ng l&uacute;c</em></p>

<p>&nbsp;</p>

<h3><br />
Phụ kiện cover độc đ&aacute;o</h3>

<p>C&ugrave;ng với <strong> 5C</strong>, Apple cũng giới thiệu bộ phụ kiện cover m&agrave;u m&egrave; kh&ocirc;ng k&eacute;m. Chiếc cover n&agrave;y l&agrave;m từ nhựa dẻo, ngo&agrave;i khả năng chống trầy xước, tăng cường độ bền th&igrave; đ&acirc;y c&ograve;n l&agrave; điểm nhấn thời trang cho c&aacute;c bạn trẻ năng động, th&iacute;ch thể hiện c&aacute; t&iacute;nh của m&igrave;nh.</p>

<p><strong><img alt="Phụ kiện cover đầy màu sắc của iPhone 5C" src="http://cdn.tgdd.vn/Products/Images/42/60543/iphone-5c_clip_image016.jpg" /></strong><br />
<em>Phụ kiện cover đầy m&agrave;u sắc</em></p>

<p>&nbsp;</p>

<h3><br />
Đ&aacute;nh gi&aacute; chung</h3>

<p>Như đ&atilde; n&oacute;i, <strong>iPhone</strong> <strong>5C </strong>k&eacute;m lịch l&atilde;m hơn 5S nhưng trẻ trung hơn nhiều lần. Với cấu h&igrave;nh tốt, thiết kế đẹp c&ugrave;ng nhiều t&iacute;nh năng hữu &iacute;ch v&agrave; kho ứng dụng phong ph&uacute;, chắc chắn <strong> 5C</strong> sẽ l&agrave; lựa chọn số một cho c&aacute;c bạn trẻ hoặc những người d&ugrave;ng muốn trải nghiệm HĐH iOS 7.</p>

<p><strong>Anh Tu&acirc;n</strong></p>

<table>
	<tbody>
		<tr>
			<td>
			<h3>Ưu điểm</h3>

			<ul>
				<li>Thiết kế m&agrave;u sắc, trẻ trung, năng động.</li>
				<li>M&agrave;n h&igrave;nh LCD 4 inch Retina sắc n&eacute;t đến từng chi tiết.</li>
				<li>Hiệu năng mượt m&agrave; với chip A6 l&otilde;i k&eacute;p.</li>
				<li>Camera iSight 8 MP cho chất lượng ảnh chụp tuyệt vời.</li>
				<li>Hỗ trợ nhiều loại phụ kiện tiện &iacute;ch.</li>
			</ul>
			</td>
			<td>
			<h3>Nhược điểm</h3>

			<ul>
				<li>Gi&aacute; th&agrave;nh kh&aacute; cao.</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>
', 1, 99, 1, 5, 0, CAST(N'2017-12-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (5, N'iPhone 4S 16GB', N'/Content/Images/Apple/iphone-4S-16gb.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/Apple/Hinh360-iphone4s/dien-thoai-di-dong-iphone-4s-dienmay.com-1-1.jpg', N'" /> </a>', CAST(1229000 AS Decimal(18, 0)), CAST(1250000 AS Decimal(18, 0)), N'<p>M&agrave;n h&igrave;nh: DVGA, 3.5&quot;, 640 x 960 pixels CPU: Apple A5, 2 nh&acirc;n, 1 GHz RAM 512 MB Hệ điều h&agrave;nh: iOS 7.0 Camera ch&iacute;nh: 8.0 MP, Quay phim FullHD 1080p@30fps Camera phụ: 1.2 MP Bộ nhớ trong: 16 GB Thẻ nhớ ngo&agrave;i đến: Kh&ocirc;ng Dung lượng pin: 1510 mAh</p>
', N'<p><img src="http://cdn.tgdd.vn/Products/Images/42/60686/Kit/iPhone-4s-mo-ta-chuc-nang.jpg" /></p>

<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td rowspan="2">
			<p>Th&ocirc;ng tin chung</p>
			</td>
			<td>Hệ điều h&agrave;nh</td>
			<td>iOS 7.0</td>
		</tr>
		<tr>
			<td>
			<p>Ng&ocirc;n ngữ</p>
			</td>
			<td>Tiếng Việt, Tiếng Anh</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>Loại m&agrave;n h&igrave;nh</td>
			<td>LED-backlit IPS LCD</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;u m&agrave;n h&igrave;nh</p>
			</td>
			<td>16 triệu m&agrave;u</td>
		</tr>
		<tr>
			<td>
			<p>Chuẩn m&agrave;n h&igrave;nh</p>
			</td>
			<td>DVGA</td>
		</tr>
		<tr>
			<td>
			<p>Độ ph&acirc;n giải</p>
			</td>
			<td>640 x 960 pixels</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh rộng</p>
			</td>
			<td>3.5&quot;</td>
		</tr>
		<tr>
			<td>
			<p>C&ocirc;ng nghệ cảm ứng</p>
			</td>
			<td>Cảm ứng điện dung đa điểm</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Chụp h&igrave;nh &amp; Quay phim</p>
			</td>
			<td>Camera sau</td>
			<td>8.0 MP</td>
		</tr>
		<tr>
			<td>
			<p>Camera trước</p>
			</td>
			<td>VGA (0.3 Mpx)</td>
		</tr>
		<tr>
			<td>
			<p>Đ&egrave;n Flash</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>T&iacute;nh năng camera</p>
			</td>
			<td>Tự động lấy n&eacute;t, chạm lấy n&eacute;t<br />
			Nhận diện khu&ocirc;n mặt</td>
		</tr>
		<tr>
			<td>
			<p>Quay phim</p>
			</td>
			<td>Quay phim FullHD 1080p@30fps</td>
		</tr>
		<tr>
			<td>
			<p>Videocall</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td rowspan="5">
			<p>CPU &amp; RAM</p>
			</td>
			<td>Tốc độ CPU</td>
			<td>1 GHz</td>
		</tr>
		<tr>
			<td>
			<p>Số nh&acirc;n</p>
			</td>
			<td>2 nh&acirc;n</td>
		</tr>
		<tr>
			<td>
			<p>Chipset</p>
			</td>
			<td>Apple A5</td>
		</tr>
		<tr>
			<td>
			<p>RAM</p>
			</td>
			<td>512 MB</td>
		</tr>
		<tr>
			<td>
			<p>Chip đồ họa (GPU)</p>
			</td>
			<td>PowerVR SGX543MP3</td>
		</tr>
		<tr>
			<td rowspan="4">
			<p>Bộ nhớ &amp; Lưu trữ</p>
			</td>
			<td>Danh bạ</td>
			<td>Kh&ocirc;ng giới hạn</td>
		</tr>
		<tr>
			<td>
			<p>Bộ nhớ trong (ROM)</p>
			</td>
			<td>8 GB</td>
		</tr>
		<tr>
			<td>
			<p>Thẻ nhớ ngo&agrave;i</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Hỗ trợ thẻ tối đa</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Thiết kế &amp; Trọng lượng</p>
			</td>
			<td>Kiểu d&aacute;ng</td>
			<td>Thanh + Cảm ứng</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước</p>
			</td>
			<td>115.2 x 58.6 x 9.3 mm</td>
		</tr>
		<tr>
			<td>
			<p>Trọng lượng (g)</p>
			</td>
			<td>140</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Th&ocirc;ng tin pin</p>
			</td>
			<td>Loại pin</td>
			<td>Pin chuẩn Li-Ion</td>
		</tr>
		<tr>
			<td>
			<p>Dung lượng pin</p>
			</td>
			<td>1420 mAh</td>
		</tr>
		<tr>
			<td>
			<p>Pin c&oacute; thể th&aacute;o rời</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="13">
			<p>Kết nối &amp; Cổng giao tiếp</p>
			</td>
			<td>3G</td>
			<td>HSDPA, 14.4 Mbps; HSUPA, 5.8 Mbps</td>
		</tr>
		<tr>
			<td>
			<p>4G</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Loại Sim</p>
			</td>
			<td>Micro SIM</td>
		</tr>
		<tr>
			<td>
			<p>Khe gắn Sim</p>
			</td>
			<td>1 Sim</td>
		</tr>
		<tr>
			<td>
			<p>Wifi</p>
			</td>
			<td>Wi-Fi 802.11 b/g/n, DLNA, Wi-Fi hotspot</td>
		</tr>
		<tr>
			<td>
			<p>GPS</p>
			</td>
			<td>A-GPS v&agrave; GLONASS</td>
		</tr>
		<tr>
			<td>
			<p>Bluetooth</p>
			</td>
			<td>V4.0 with A2DP</td>
		</tr>
		<tr>
			<td>
			<p>GPRS/EDGE</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Jack tai nghe</p>
			</td>
			<td>3.5 mm</td>
		</tr>
		<tr>
			<td>
			<p>NFC</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối USB</p>
			</td>
			<td>USB 2.0</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối kh&aacute;c</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Cổng sạc</p>
			</td>
			<td>iPhone 4</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Giải tr&iacute; &amp; Ứng dụng</p>
			</td>
			<td>Xem phim</td>
			<td>MP4, WMV, H.263, H.264(MPEG4-AVC)</td>
		</tr>
		<tr>
			<td>
			<p>Nghe nhạc</p>
			</td>
			<td>MP3, WAV, WMA, AAC+</td>
		</tr>
		<tr>
			<td>
			<p>Ghi &acirc;m</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Giới hạn cuộc gọi</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>FM radio</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Chức năng kh&aacute;c</p>
			</td>
			<td>Hỗ trợ mạng x&atilde; hội<br />
			Chỉnh sửa h&igrave;nh ảnh v&agrave; video<br />
			Loại bỏ tiếng ồn ới micro chuy&ecirc;n dụng<br />
			Google Maps</td>
		</tr>
	</tbody>
</table>
', N'<h2>iPhone 4S &ndash; Nhanh hơn &ndash; Mạnh hơn &ndash; Đẳng cấp hơn</h2>

<p><br />
Được thiết kế kh&ocirc;ng kh&aacute;c g&igrave; mấy so với người anh em tiền nhiệm <a href="http://www.thegioididong.com/dtdd/iphone-4-8gb" target="_blank">iPhone 4</a>, <strong>iPhone 4S</strong> với những n&acirc;ng cấp đ&aacute;ng gi&aacute; như CPU A5 mạnh mẽ hơn, camera 8.0 MP sắc n&eacute;t hơn, hệ thống ăng ten được cải tiến c&ugrave;ng c&ocirc; n&agrave;ng trợ l&yacute; ảo Siri cực kỳ th&ocirc;ng minh v&agrave; hữu &iacute;ch.</p>

<p><img alt="&lt;strong&gt;iPhone 4S&lt;/strong&gt; với thiết kế tương tự iPhone 4" src="http://cdn.thegioididong.com/Products/Images/42/54283/iphone-4s_clip_image002.jpg" style="height:541px; width:576px" /><br />
<em>iPhone 4S với thiết kế tương tự iPhone 4</em></p>

<p>&nbsp;</p>

<h3><br />
Thiết kế sang trọng, đẳng cấp</h3>

<p><strong>iPhone 4S</strong> với thiết kế phần lưng bằng k&iacute;nh, bộ khung kim loại cứng c&aacute;p viền quanh m&aacute;y c&ugrave;ng c&aacute;c g&oacute;c bo tr&ograve;n tương tự iPhone 4 khiến m&aacute;y tr&ocirc;ng cực kỳ b&oacute;ng mượt, sang trọng, cao cấp v&agrave; cầm rất chắc tay. Kh&ocirc;ng những thế, bộ khung viền kim loại xung quanh c&ograve;n c&oacute; t&aacute;c dụng như một hệ thống gi&uacute;p bắt s&oacute;ng thoại v&agrave; wifi.</p>

<p><img alt="Thiết kế sang trọng và đẳng cấp" src="http://cdn.thegioididong.com/Products/Images/42/54283/iphone-4s_clip_image004.jpg" style="height:328px; width:576px" /><br />
<em>Thiết kế sang trọng v&agrave; đẳng cấp</em></p>

<p>&nbsp;</p>

<h3><br />
M&agrave;n h&igrave;nh Retina rực rỡ</h3>

<p>Vẫn l&agrave; m&agrave;n h&igrave;nh Retina 960x640px rộng 3.5 inch 16 triệu m&agrave;u, cảm ứng đa điểm nhưng với t&ocirc;ng m&agrave;u đen &iacute;t tối hơn v&agrave; m&agrave;n h&igrave;nh mang sắc xanh nhiều hơn gi&uacute;p m&agrave;n h&igrave;nh iPhone 4S tr&ocirc;ng rực rỡ hơn.</p>

<p><img alt="Màn hình retina rực rỡ" src="http://cdn.thegioididong.com/Products/Images/42/54283/iphone-4s_clip_image006.jpg" style="height:301px; width:353px" /><br />
<em>M&agrave;n h&igrave;nh retina rực rỡ</em></p>

<p>&nbsp;</p>

<h3><br />
Ch&iacute;p xử l&yacute; A5 mạnh mẽ</h3>

<p><strong>iPhone 4S</strong> được trang bị Chip l&otilde;i k&eacute;p A5 1.0GHz cho tốc độ xử l&yacute; nhanh gấp 2 lần chip A4 tr&ecirc;n iPhone 4 v&agrave; khả năng xử l&yacute; độ họa mạnh mẽ hơn gấp 7 lần gi&uacute;p mở ứng dụng nhanh hơn, chơi game mượt m&agrave; hơn v&agrave; thời gian chụp ảnh cũng nhanh hơn đ&aacute;ng kể. B&ecirc;n cạnh đ&oacute;, tốc độ k&ecirc;t nối internet của iPhone 4S cũng cao hơn mặc d&ugrave; m&aacute;y vẫn sử dụng kết nối Wi-fi chuẩn n, Bluetooth 4.0, hỗ trợ la b&agrave;n, GPS, cảm biến &aacute;nh s&aacute;ng, đo gia tốc, cảm biến độ gần&hellip;tương tự như iPhone 4.</p>

<p><img alt="Tốc độ internet của &lt;strong&gt;iPhone 4S&lt;/strong&gt; nhanh hơn" src="http://cdn.thegioididong.com/Products/Images/42/54283/iphone-4s_clip_image008.jpg" style="height:181px; width:222px" /><br />
<em>Tốc độ internet của iPhone 4S nhanh hơn</em></p>

<p>&nbsp;</p>

<h3><br />
Camera 8.0 MP xuất sắc</h3>

<p>Camera của <strong>iPhone 4S</strong> cũng được n&acirc;ng cấp l&ecirc;n 8.0 MP thay v&igrave; 5.0MP như ở iPhone 4 c&ugrave;ng c&aacute;c thiết lập ti&ecirc;u cự v&agrave; khẩu độ mới l&ecirc;n đến 2.4 gi&uacute;p bắt s&aacute;ng rất tốt cho chất lượng ảnh tăng l&ecirc;n đ&aacute;ng kể, m&agrave;u sắc trung thực v&agrave; cực kỳ r&otilde; n&eacute;t. B&ecirc;n cạnh đ&oacute;, tốc độ khởi động v&agrave; chụp ảnh tr&ecirc;n iPhone 4S cũng được tăng cường, gi&uacute;p người d&ugrave;ng kh&ocirc;ng bỏ lỡ bất kỳ khoảnh khắc n&agrave;o.</p>

<p><img alt="Camera 8.0 MP" src="http://cdn.thegioididong.com/Products/Images/42/54283/iphone-4s_clip_image010.jpg" style="height:319px; width:528px" /><br />
<em>Camera 8.0 MP</em></p>

<p><br />
Kh&ocirc;ng những thế, khả năng bắt h&igrave;nh trong m&ocirc;i trường thiếu s&aacute;ng được cải thiện r&otilde; rệt cho những bức ảnh kh&ocirc;ng bị vỡ hạt, nh&ograve;e ảnh c&ugrave;ng t&ocirc;ng m&agrave;u s&aacute;ng tối rất c&acirc;n bằng.</p>

<p><img alt="Ảnh chụp trong điều kiện thiếu sáng của iPhone 4 (bên trái) và &lt;strong&gt;iPhone 4S&lt;/strong&gt; (bên phải)." src="http://cdn.thegioididong.com/Products/Images/42/54283/iphone-4s_clip_image011.png" style="height:378px; width:540px" /><br />
Ảnh chụp trong điều kiện thiếu s&aacute;ng của iPhone 4 (b&ecirc;n tr&aacute;i) v&agrave; iPhone 4S (b&ecirc;n phải).</p>

<p><br />
B&ecirc;n cạnh đ&oacute;, khả năng quay video tr&ecirc;n <strong>iPhone 4S</strong> cũng được n&acirc;ng cấp đ&aacute;ng kể, c&oacute; thể quay phim full HD 1080p chống rung ấn tượng. Mặc d&ugrave; vậy, camera trước vẫn kh&ocirc;ng c&oacute; g&igrave; thay đổi với độ ph&acirc;n giải VGA.</p>

<p><img alt="Quay phim chuẩn HD 1080p" src="http://cdn.thegioididong.com/Products/Images/42/54283/iphone-4s_clip_image013.jpg" style="height:245px; width:219px" /><br />
<em>Quay phim chuẩn HD 1080p</em></p>

<p>&nbsp;</p>

<h3><br />
Hệ thống ăng ten mới được cải tiến cho chất lượng cuộc gọi tốt hơn</h3>

<p><img alt="&lt;strong&gt;iPhone 4S&lt;/strong&gt; được trang bị thêm một hệ thống ăng teng" src="http://cdn.thegioididong.com/Products/Images/42/54283/iphone-4s_clip_image015.jpg" style="height:429px; width:576px" /><br />
<em>iPhone 4S được trang bị th&ecirc;m một hệ thống ăng teng</em></p>

<p><br />
iPhone 4S được trang bị th&ecirc;m 1 hệ thống ăng ten b&ecirc;n cạnh hệ thống ăng ten hiện c&oacute; hỗ trợ cả 02 mạng CDMA v&agrave; GSM gi&uacute;p m&aacute;y bắt s&oacute;ng tốt hơn, cho chất lượng cuộc gọi tốt hơn.</p>

<p>&nbsp;</p>

<h3><br />
Thời lượng pin ấn tượng</h3>

<p>Thử nghiệm thực tế cho thấy iPhone 4S vẫn c&oacute; thể trụ được một ng&agrave;y hoạt động với 16 giờ đ&agrave;m thoại, duyệt web, download ứng dụng, đồng bộ h&oacute;a dữ liệu, nghe nhạc, chơi game&hellip;..</p>

<p><img alt="Pin hoạt động 16 giờ đàm thoai" src="http://cdn.thegioididong.com/Products/Images/42/54283/iphone-4s_clip_image017.jpg" style="height:333px; width:576px" /><br />
<em>Pin hoạt động 16 giờ đ&agrave;m thoai</em></p>

<p>&nbsp;</p>

<h3><br />
Siri &ndash; Ra lệnh tr&ecirc;n <strong>iPhone 4S</strong> bằng giọng n&oacute;i</h3>

<p>Điểm kh&aacute;c biệt kh&aacute;c so với iPhone 4 l&agrave; <strong>iPhone 4S</strong> được t&iacute;ch hợp c&ocirc; n&agrave;ng trợ l&yacute; ảo Siri cực kỳ th&ocirc;ng minh. Người d&ugrave;ng c&oacute; thể dụng Siri nhưng m&ocirc;t trợ l&yacute; đ&iacute;ch thực để t&igrave;m đường, đọc v&agrave; trả lời tin nhắn, đặt lịch hẹn v.v&hellip;. với những g&igrave; người d&ugrave;ng cần l&agrave;m l&agrave; N&Oacute;I. Kh&ocirc;ng những hoạt động theo những g&igrave; được lập tr&igrave;nh sẵn, Siri c&ograve;n c&oacute; thể học th&ecirc;m những g&igrave; người d&ugrave;ng n&oacute;i.</p>

<p><img alt="Trợ lý ảo Siri cực kỳ thông minh và hữu ích" src="http://cdn.thegioididong.com/Products/Images/42/54283/iphone-4s_clip_image018.png" style="height:474px; width:576px" /><br />
<em>Trợ l&yacute; ảo Siri cực kỳ th&ocirc;ng minh v&agrave; hữu &iacute;ch</em></p>

<p><br />
Kh&ocirc;ng những thế, <strong>iPhone 4S</strong> người d&ugrave;ng c&ograve;n c&oacute; thể <strong>chụp ảnh paranoma một c&aacute;ch dễ d&agrave;ng</strong> v&agrave; mượt m&agrave; với phần mềm paranoma được t&iacute;ch hợp sẵn m&agrave; kh&ocirc;ng cần phải c&agrave;i th&ecirc;m ứng dụng từ h&atilde;ng thứ 3...</p>

<p><img alt="Chụp ảnh paranoma siêu dễ dàng" src="http://cdn.thegioididong.com/Products/Images/42/54283/iphone-4s_clip_image020.jpg" style="height:399px; width:536px" /><br />
<em>Chụp ảnh paranoma si&ecirc;u dễ d&agrave;ng</em></p>

<h3><br />
Một số h&igrave;nh ảnh chụp từ <strong>iPhone 4S</strong></h3>

<p><img alt="hình ảnh chụp từ &lt;strong&gt;iPhone 4S&lt;/strong&gt;" src="http://cdn.thegioididong.com/Products/Images/42/54283/iphone-4s_clip_image022.jpg" style="height:383px; width:576px" /></p>

<p>&nbsp;</p>

<p><img alt="hình ảnh chụp từ &lt;strong&gt;iPhone 4S&lt;/strong&gt;" src="http://cdn.thegioididong.com/Products/Images/42/54283/iphone-4s_clip_image024.jpg" style="height:392px; width:576px" /></p>

<p>&nbsp;</p>

<p><img alt="hình ảnh chụp từ &lt;strong&gt;iPhone 4S&lt;/strong&gt;" src="http://cdn.thegioididong.com/Products/Images/42/54283/iphone-4s_clip_image026.jpg" style="height:355px; width:576px" /></p>

<p>&nbsp;</p>

<p><img alt="hình ảnh chụp từ &lt;strong&gt;iPhone 4S&lt;/strong&gt;" src="http://cdn.thegioididong.com/Products/Images/42/54283/iphone-4s_clip_image028.jpg" style="height:406px; width:576px" /></p>

<p>&nbsp;</p>

<p><img alt="hình ảnh chụp từ &lt;strong&gt;iPhone 4S&lt;/strong&gt;" src="http://cdn.thegioididong.com/Products/Images/42/54283/iphone-4s_clip_image030.jpg" style="height:422px; width:576px" /></p>

<p>&nbsp;</p>

<p><strong>Dương Yến Nhi</strong><br />
<strong>H&igrave;nh ảnh: sưu tầm</strong></p>

<table>
	<tbody>
		<tr>
			<td>
			<h3>Ưu điểm</h3>

			<ul>
				<li>M&aacute;y ảnh iSight 8MP xuất sắc.</li>
				<li>M&agrave;n h&igrave;nh Retina ấn tượng v&agrave; sắc n&eacute;t.</li>
				<li>Trợ l&yacute; ảo Siri rất th&uacute; vị v&agrave; hữu &iacute;ch.</li>
				<li>iOS 5 với nhiều t&iacute;nh năng đ&aacute;ng kể.</li>
				<li>T&iacute;ch hợp chụp ảnh paranoma.</li>
			</ul>
			</td>
			<td>
			<h3>Nhược điểm</h3>

			<ul>
				<li>Thiết kế kim loại v&agrave; k&iacute;nh đẹp nhưng rất dễ trầy xước.</li>
				<li>Kh&ocirc;ng c&oacute; 4G.</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>
', 1, 99, 1, 7, 0, CAST(N'2017-12-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (6, N'iPhone 4 8GB', N'/Content/Images/Apple/iphone-4-8gb.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/Apple/Hinh360-iphone4s/dien-thoai-di-dong-iphone-4s-dienmay.com-1-1.jpg', N'" /> </a>', CAST(799000 AS Decimal(18, 0)), CAST(850000 AS Decimal(18, 0)), N'<p>M&agrave;n h&igrave;nh: DVGA, 3.5&quot;, 640 x 960 pixels CPU: Apple A4, 2 nh&acirc;n, 1.3 GHz RAM 512 MB Hệ điều h&agrave;nh: iOS 7.0 Camera ch&iacute;nh: 5.0 MP, Quay phim HD 720p@30fps Camera phụ: c&oacute; Bộ nhớ trong: 8 GB Thẻ nhớ ngo&agrave;i đến: Kh&ocirc;ng Dung lượng pin: 1420 mAh</p>
', N'<p><img src="http://cdn.tgdd.vn/Products/Images/42/52136/Kit/iPhone-4-mo-ta-chuc-nang.jpg" /></p>

<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td rowspan="2">
			<p>Th&ocirc;ng tin chung</p>
			</td>
			<td>Hệ điều h&agrave;nh</td>
			<td>iOS 7.0</td>
		</tr>
		<tr>
			<td>
			<p>Ng&ocirc;n ngữ</p>
			</td>
			<td>Tiếng Việt, Tiếng Anh</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>Loại m&agrave;n h&igrave;nh</td>
			<td>LED-backlit IPS LCD</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;u m&agrave;n h&igrave;nh</p>
			</td>
			<td>16 triệu m&agrave;u</td>
		</tr>
		<tr>
			<td>
			<p>Chuẩn m&agrave;n h&igrave;nh</p>
			</td>
			<td>DVGA</td>
		</tr>
		<tr>
			<td>
			<p>Độ ph&acirc;n giải</p>
			</td>
			<td>640 x 960 pixels</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh rộng</p>
			</td>
			<td>3.5&quot;</td>
		</tr>
		<tr>
			<td>
			<p>C&ocirc;ng nghệ cảm ứng</p>
			</td>
			<td>Cảm ứng điện dung đa điểm</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Chụp h&igrave;nh &amp; Quay phim</p>
			</td>
			<td>Camera sau</td>
			<td>5.0 MP</td>
		</tr>
		<tr>
			<td>
			<p>Camera trước</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Đ&egrave;n Flash</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>T&iacute;nh năng camera</p>
			</td>
			<td>Tự động lấy n&eacute;t .chạm lấy n&eacute;t<br />
			Led video light</td>
		</tr>
		<tr>
			<td>
			<p>Quay phim</p>
			</td>
			<td>Quay phim HD 720p@30fps</td>
		</tr>
		<tr>
			<td>
			<p>Videocall</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td rowspan="5">
			<p>CPU &amp; RAM</p>
			</td>
			<td>Tốc độ CPU</td>
			<td>1 GHz</td>
		</tr>
		<tr>
			<td>
			<p>Số nh&acirc;n</p>
			</td>
			<td>1 nh&acirc;n</td>
		</tr>
		<tr>
			<td>
			<p>Chipset</p>
			</td>
			<td>Apple A4</td>
		</tr>
		<tr>
			<td>
			<p>RAM</p>
			</td>
			<td>512 MB</td>
		</tr>
		<tr>
			<td>
			<p>Chip đồ họa (GPU)</p>
			</td>
			<td>PowerVR SGX535</td>
		</tr>
		<tr>
			<td rowspan="4">
			<p>Bộ nhớ &amp; Lưu trữ</p>
			</td>
			<td>Danh bạ</td>
			<td>Kh&ocirc;ng giới hạn</td>
		</tr>
		<tr>
			<td>
			<p>Bộ nhớ trong (ROM)</p>
			</td>
			<td>8 GB</td>
		</tr>
		<tr>
			<td>
			<p>Thẻ nhớ ngo&agrave;i</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Hỗ trợ thẻ tối đa</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Thiết kế &amp; Trọng lượng</p>
			</td>
			<td>Kiểu d&aacute;ng</td>
			<td>Thanh + Cảm ứng</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước</p>
			</td>
			<td>115.2 x 58.6 x 9.3 mm</td>
		</tr>
		<tr>
			<td>
			<p>Trọng lượng (g)</p>
			</td>
			<td>137</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Th&ocirc;ng tin pin</p>
			</td>
			<td>Loại pin</td>
			<td>Pin chuẩn Li-Po</td>
		</tr>
		<tr>
			<td>
			<p>Dung lượng pin</p>
			</td>
			<td>1420 mAh</td>
		</tr>
		<tr>
			<td>
			<p>Pin c&oacute; thể th&aacute;o rời</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="13">
			<p>Kết nối &amp; Cổng giao tiếp</p>
			</td>
			<td>3G</td>
			<td>HSDPA, 7.2 Mbps; HSUPA, 5.76 Mbps</td>
		</tr>
		<tr>
			<td>
			<p>4G</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Loại Sim</p>
			</td>
			<td>Micro SIM</td>
		</tr>
		<tr>
			<td>
			<p>Khe gắn Sim</p>
			</td>
			<td>1 Sim</td>
		</tr>
		<tr>
			<td>
			<p>Wifi</p>
			</td>
			<td>Wi-Fi 802.11 b/g</td>
		</tr>
		<tr>
			<td>
			<p>GPS</p>
			</td>
			<td>A-GPS</td>
		</tr>
		<tr>
			<td>
			<p>Bluetooth</p>
			</td>
			<td>C&oacute;, V2.1 với A2DP</td>
		</tr>
		<tr>
			<td>
			<p>GPRS/EDGE</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Jack tai nghe</p>
			</td>
			<td>3.5 mm</td>
		</tr>
		<tr>
			<td>
			<p>NFC</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối USB</p>
			</td>
			<td>USB 2.0</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối kh&aacute;c</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Cổng sạc</p>
			</td>
			<td>iPhone 4</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Giải tr&iacute; &amp; Ứng dụng</p>
			</td>
			<td>Xem phim</td>
			<td>3GP, MP4, WMV</td>
		</tr>
		<tr>
			<td>
			<p>Nghe nhạc</p>
			</td>
			<td>MP3, WAV, WMA, AAC, AAC+, AAC++</td>
		</tr>
		<tr>
			<td>
			<p>Ghi &acirc;m</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Giới hạn cuộc gọi</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>FM radio</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Chức năng kh&aacute;c</p>
			</td>
			<td>Hỗ trợ mạng x&atilde; hội<br />
			La b&agrave;n số</td>
		</tr>
	</tbody>
</table>
', N'<h2><a href="#" target="_blank">Iphone</a> 4 &ndash; Smartphone tạo n&ecirc;n tr&agrave;o lưu</h2>

<p><strong><img alt="" src="http://cdn.tgdd.vn/Products/Images/42/52136/iphone-4_clip_image001.jpg" style="height:239px; width:624px" /></strong></p>

<p><br />
Kể từ khi ra đời, iPhone d&ugrave; thế hệ n&agrave;o lu&ocirc;n được coi l&agrave; ti&ecirc;u chuẩn khi n&oacute;i smartphone v&agrave; l&agrave; ti&ecirc;u chuẩn để c&aacute;c h&atilde;ng điện thoại kh&aacute;c cải thiện c&aacute;c sản phẩm của m&igrave;nh. Nếu như iPhone ra đời đ&atilde; tạo n&ecirc;n định nghĩa của việc trải nghiệm smartphone th&igrave; <strong>iPhone 4</strong> ra đời đ&atilde; tạo n&ecirc;n định nghĩa mới cho đẳng cấp trong thiết kế của smartphone.</p>

<p>&nbsp;</p>

<h3><br />
Thiết kế tinh tế đến từng đường n&eacute;t</h3>

<p>iPhone ngay từ thế hệ đầu ti&ecirc;n đến <a href="http://www.thegioididong.com/dtdd/iphone-3gs" target="_blank">iPhone 3GS</a> đều c&oacute; chung một đặc điểm thiết kế. Tuy ch&uacute;ng đ&atilde; rất đẹp nhưng đến khi <strong>iPhone 4</strong> ra đời, c&aacute;i đẹp đ&atilde; thật sự được Apple định nghĩa lại. Sử dụng chất liệu gương cường lực cho cả 2 mặt trước v&agrave; sau của m&aacute;y khiến cho iPhone 4 tr&ocirc;ng rất sang trọng ngay từ c&aacute;i nh&igrave;n đầu ti&ecirc;n.</p>

<p><img alt="iPhone 4 được Apple chăm chút đến từng đường nét trong thiết kế" src="http://cdn.tgdd.vn/Products/Images/42/52136/iphone-4_clip_image002.jpg" style="height:492px; width:615px" /><br />
<em>iPhone 4 được Apple chăm ch&uacute;t đến từng đường n&eacute;t trong thiết kế</em></p>

<p><br />
Thiết kế bo tr&ograve;n ở mặt lưng ở c&aacute;c thế hệ iPhone trước đ&atilde; được thay thế bằng c&aacute;c đường n&eacute;t g&oacute;c cạnh v&agrave; nam t&iacute;nh hơn với khung bằng kim loại th&eacute;p kh&ocirc;ng gỉ. C&aacute;c chi tiết rất nhỏ từ ph&iacute;m nguồn, ph&iacute;m kh&oacute;a m&aacute;y v&agrave; ph&iacute;m &acirc;m lượng tr&ecirc;n <a href="http://www.thegioididong.com/dtdd-apple-iphone" target="_blank">iPhone</a> 4 đều được Apple chăm ch&uacute;t rất kĩ v&agrave; tỉ mỉ đến từng chi tiết. C&aacute;c ph&iacute;m n&agrave;y kh&ocirc;ng chỉ được thiết kế đẹp m&agrave; c&ograve;n tạo cảm gi&aacute;c bấm rất &ecirc;m v&agrave; thoải m&aacute;i khi sử dụng.</p>

<p>&nbsp;</p>

<h3><br />
M&agrave;n h&igrave;nh Retina sắc n&eacute;t v&agrave; sống động</h3>

<p><strong>iPhone 4</strong> l&agrave; một bước tiến mới của Apple trong c&ocirc;ng nghệ m&agrave;n h&igrave;nh. Với c&ocirc;ng nghệ m&agrave;n h&igrave;nh Retina (m&agrave;n h&igrave;nh v&otilde;ng mạc), Apple đ&atilde; mang tới cho người d&ugrave;ng một trải nghiệm mới trong việc tận hưởng chất lượng hiển thị tr&ecirc;n m&agrave;n h&igrave;nh smartphone. Với k&iacute;ch cỡ m&agrave;n h&igrave;nh 3,5inch, c&ugrave;ng độ ph&acirc;n giải 960 x 640, mật độ điểm ảnh l&ecirc;n tới 326 ppi, m&agrave;n h&igrave;nh iPhone 4 cho h&igrave;nh ảnh hiển thị sắc n&eacute;t v&agrave; mịn m&agrave;ng đến mức người d&ugrave;ng sẽ kh&ocirc;ng thể cảm nhận được sự hiện diện của c&aacute;c điểm ảnh tr&ecirc;n m&agrave;n h&igrave;nh.</p>

<p><img alt="Hình ảnh hiển thị trên iPhone 4 vô cùng sắc nét" src="http://cdn.tgdd.vn/Products/Images/42/52136/iphone-4_clip_image004.jpg" style="height:370px; width:624px" /><br />
<em>H&igrave;nh ảnh hiển thị tr&ecirc;n iPhone 4 v&ocirc; c&ugrave;ng sắc n&eacute;t</em></p>

<p><br />
Kh&ocirc;ng chỉ c&oacute; h&igrave;nh ảnh được hiển thị sắc n&eacute;t, c&ocirc;ng nghệ m&agrave;n h&igrave;nh Retina c&ograve;n mang đến khả năng hiển thị m&agrave;u v&ocirc; c&ugrave;ng ch&iacute;nh x&aacute;c. Chuy&ecirc;n gia hiển thị Dr Raymond Soneira, người s&aacute;ng lập ra h&atilde;ng DisplayMate Technologies cho rằng, m&agrave;n h&igrave;nh Retina của iPhone 4 c&oacute; khả năng thể hiện ch&iacute;nh x&aacute;c đến 99% dải m&agrave;u ti&ecirc;u chuẩn.</p>

<p><img alt="Hình ảnh không chỉ nét hơn mà màu sắc cũng được hiển thị chuẩn hơn" src="http://cdn.tgdd.vn/Products/Images/42/52136/iphone-4_clip_image006.jpg" style="height:380px; width:624px" /><br />
<em>H&igrave;nh ảnh kh&ocirc;ng chỉ n&eacute;t hơn m&agrave; m&agrave;u sắc cũng được hiển thị chuẩn hơn</em></p>

<p>&nbsp;</p>

<h3><br />
Camera 5MP với khả năng quay phim HD</h3>

<p><img alt="iPhone 4 được trang bị Camera HD cùng đèn Flash LED" src="http://cdn.tgdd.vn/Products/Images/42/52136/iphone-4_clip_image007.jpg" style="height:399px; width:549px" /><br />
<em>iPhone 4 được trang bị Camera HD c&ugrave;ng đ&egrave;n Flash LED</em></p>

<p><br />
Được trang bị Camera 5MP c&ugrave;ng đ&egrave;n Flash LED, <strong>iPhone 4</strong> cho ph&eacute;p tạo ra những bức ảnh chất lượng với thao t&aacute;c cực k&igrave; đơn giản. Khả năng bắt h&igrave;nh v&agrave; lấy n&eacute;t cực nhanh c&ugrave;ng với giao diện chụp h&igrave;nh đơn giản, bạn sẽ kh&ocirc;ng phải lo bỏ lỡ bất k&igrave; khoảng khắc n&agrave;o.</p>

<p><img alt="Camera iphone 4 có khả năng lấy nét nhanh và giao diện chụp hình đơn giản" src="http://cdn.tgdd.vn/Products/Images/42/52136/iphone-4_clip_image008.png" style="height:453px; width:650px" /><br />
<em>Camera iphone 4 c&oacute; khả năng lấy n&eacute;t nhanh v&agrave; giao diện chụp h&igrave;nh đơn giản</em></p>

<p><br />
Camera 5MP của iPhone 4 c&ograve;n cho ph&eacute;p tạo ra những đoạn phim với độ ph&acirc;n giải HD 720p cực k&igrave; sắc n&eacute;t. Ngo&agrave;i ra, với Camera phụ, kh&ocirc;ng gian địa l&iacute; sẽ kh&ocirc;ng l&agrave; c&ograve;n l&agrave; khoảng c&aacute;ch. Chức năng cuộc gọi h&igrave;nh ảnh Video Call hay Face Time sẽ mang bạn v&agrave; bạn b&egrave;, người th&acirc;n đến gần với nhau hơn bất kể bạn đang ở đ&acirc;u.</p>

<p><img alt="Ảnh được chụp bởi iPhone 4" src="http://cdn.tgdd.vn/Products/Images/42/52136/iphone-4_clip_image010.jpg" style="height:466px; width:624px" /><br />
<em>Ảnh được chụp bởi iPhone 4</em></p>

<p>&nbsp;</p>

<h3><br />
Mạnh mẽ v&agrave; tiết kiệm pin với vi xử l&iacute; Cortex A8</h3>

<p>Được trang bị chip xử l&iacute; Cortex A8 với tốc độ xử l&iacute; l&ecirc;n đến 1GHZ v&agrave; bộ nhớ RAM 512MB, <strong>iPhone 4</strong> cho khả năng xử l&iacute; ứng dụng mượt m&agrave;. Xử l&iacute; t&aacute;c vụ đa nhiệm hay chơi game tr&ecirc;n hệ điều h&agrave;nh iOS sẽ kh&ocirc;ng c&ograve;n l&agrave; vấn đề.</p>

<p><img alt="Bộ xử lí Cortex A8 cho phép iPhone 4 xử lí các tác vụ một cách trơn tru" src="http://cdn.tgdd.vn/Products/Images/42/52136/iphone-4_clip_image011.jpg" style="height:314px; width:600px" /><br />
<em>Bộ xử l&iacute; Cortex A8 cho ph&eacute;p iPhone 4 xử l&iacute; c&aacute;c t&aacute;c vụ một c&aacute;ch trơn tru</em></p>

<p><br />
Với dung lượng pin l&ecirc;n đến 1420mAh, iPhone 4 cho thời gian sử dụng pin rất ấn tượng. iPhone 4 cho thời gian sử dụng đến 300 giờ ở chế độ chờ, 7 giờ đ&agrave;m thoại ở chế độ 3G v&agrave; 14 giờ đ&agrave;m thoại ở chế độ 2G. Ngo&agrave;i ra, bạn c&oacute; thể tha hồ lướt web tr&ecirc;n iPhone 4 li&ecirc;n tục suốt 6 giờ bằng 3G hay 10 giờ bằng Wifi.</p>

<p><strong>Union.</strong></p>

<table>
	<tbody>
		<tr>
			<td>
			<h3>Ưu điểm</h3>

			<ul>
				<li>Thiết kế đẹp, sang trọng.</li>
				<li>M&agrave;n h&igrave;nh Retina sắc n&eacute;t, sống động.</li>
				<li>Thời lượng pin tốt.</li>
				<li>Camera cho h&igrave;nh ảnh đẹp.</li>
			</ul>
			</td>
			<td>
			<h3>Nhược điểm</h3>

			<ul>
				<li>Vị tr&iacute; đặt angten chưa tốt.</li>
				<li>Kh&ocirc;ng c&oacute; FM Radio.</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>
', 1, 99, 1, 10, 0, CAST(N'2017-12-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (7, N'HTC One 32GB', N'/Content/Images/HTC/HTC-one-801n-red.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/HTC/Hinh360-HTC/HTC-One-hinh360-1.jpg', N'" /> </a>', CAST(1099000 AS Decimal(18, 0)), CAST(1480000 AS Decimal(18, 0)), N'<p>M&agrave;n h&igrave;nh: Full HD, 4.7&quot;, 1080 x 1920 pixels CPU: Qualcomm APQ8064, 4 nh&acirc;n, 1.7 GHz RAM 2 GB Hệ điều h&agrave;nh: Android 4.1.2 (Jelly Bean) Camera ch&iacute;nh: 4,0 UltraPixel, Quay phim FullHD 1080p@30fps Camera phụ: 2.1 MP Bộ nhớ trong: 32 GB Thẻ nhớ ngo&agrave;i đến: Kh&ocirc;ng Dung lượng pin: 2300 mAh</p>
', N'<p><img src="http://cdn.tgdd.vn/Products/Images/42/58094/Kit/HTC-One-mo-ta-chuc-nang.jpg" /></p>

<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td rowspan="2">
			<p>Th&ocirc;ng tin chung</p>
			</td>
			<td>Hệ điều h&agrave;nh</td>
			<td>Android 4.1.2 (Jelly Bean)</td>
		</tr>
		<tr>
			<td>
			<p>Ng&ocirc;n ngữ</p>
			</td>
			<td>Tiếng Việt, Tiếng Anh</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>Loại m&agrave;n h&igrave;nh</td>
			<td>Super LCD</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;u m&agrave;n h&igrave;nh</p>
			</td>
			<td>16 triệu m&agrave;u</td>
		</tr>
		<tr>
			<td>
			<p>Chuẩn m&agrave;n h&igrave;nh</p>
			</td>
			<td>Full HD</td>
		</tr>
		<tr>
			<td>
			<p>Độ ph&acirc;n giải</p>
			</td>
			<td>1080 x 1920 pixels</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh rộng</p>
			</td>
			<td>4.7&quot;</td>
		</tr>
		<tr>
			<td>
			<p>C&ocirc;ng nghệ cảm ứng</p>
			</td>
			<td>Cảm ứng điện dung đa điểm</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Chụp h&igrave;nh &amp; Quay phim</p>
			</td>
			<td>Camera sau</td>
			<td>4,0 UltraPixel</td>
		</tr>
		<tr>
			<td>
			<p>Camera trước</p>
			</td>
			<td>2.1 MP</td>
		</tr>
		<tr>
			<td>
			<p>Đ&egrave;n Flash</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>T&iacute;nh năng camera</p>
			</td>
			<td>Tự động lấy n&eacute;t, nhận diện khu&ocirc;n mặt v&agrave; nụ cười</td>
		</tr>
		<tr>
			<td>
			<p>Quay phim</p>
			</td>
			<td>Quay phim FullHD 1080p@30fps</td>
		</tr>
		<tr>
			<td>
			<p>Videocall</p>
			</td>
			<td>Hỗ trợ VideoCall qua Skype</td>
		</tr>
		<tr>
			<td rowspan="5">
			<p>CPU &amp; RAM</p>
			</td>
			<td>Tốc độ CPU</td>
			<td>1.7 GHz</td>
		</tr>
		<tr>
			<td>
			<p>Số nh&acirc;n</p>
			</td>
			<td>4 nh&acirc;n</td>
		</tr>
		<tr>
			<td>
			<p>Chipset</p>
			</td>
			<td>Qualcomm APQ8064</td>
		</tr>
		<tr>
			<td>
			<p>RAM</p>
			</td>
			<td>2 GB</td>
		</tr>
		<tr>
			<td>
			<p>Chip đồ họa (GPU)</p>
			</td>
			<td>Adreno 320</td>
		</tr>
		<tr>
			<td rowspan="4">
			<p>Bộ nhớ &amp; Lưu trữ</p>
			</td>
			<td>Danh bạ</td>
			<td>Kh&ocirc;ng giới hạn</td>
		</tr>
		<tr>
			<td>
			<p>Bộ nhớ trong (ROM)</p>
			</td>
			<td>32 GB</td>
		</tr>
		<tr>
			<td>
			<p>Thẻ nhớ ngo&agrave;i</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Hỗ trợ thẻ tối đa</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Thiết kế &amp; Trọng lượng</p>
			</td>
			<td>Kiểu d&aacute;ng</td>
			<td>Thanh + Cảm ứng</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước</p>
			</td>
			<td>137.4 x 68.2 x 9.3 mm</td>
		</tr>
		<tr>
			<td>
			<p>Trọng lượng (g)</p>
			</td>
			<td>143</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Th&ocirc;ng tin pin</p>
			</td>
			<td>Loại pin</td>
			<td>Pin chuẩn Li-Po</td>
		</tr>
		<tr>
			<td>
			<p>Dung lượng pin</p>
			</td>
			<td>2300 mAh</td>
		</tr>
		<tr>
			<td>
			<p>Pin c&oacute; thể th&aacute;o rời</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="13">
			<p>Kết nối &amp; Cổng giao tiếp</p>
			</td>
			<td>3G</td>
			<td>HSDPA, 42 Mbps; HSUPA, 5.76 Mbps</td>
		</tr>
		<tr>
			<td>
			<p>4G</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Loại Sim</p>
			</td>
			<td>Micro SIM</td>
		</tr>
		<tr>
			<td>
			<p>Khe gắn Sim</p>
			</td>
			<td>1 Sim</td>
		</tr>
		<tr>
			<td>
			<p>Wifi</p>
			</td>
			<td>Wi-Fi 802.11 a/b/g/n, Wi-Fi Direct, DLNA, Wi-Fi hotspot</td>
		</tr>
		<tr>
			<td>
			<p>GPS</p>
			</td>
			<td>A-GPS v&agrave; GLONASS</td>
		</tr>
		<tr>
			<td>
			<p>Bluetooth</p>
			</td>
			<td>V4.0 with A2DP</td>
		</tr>
		<tr>
			<td>
			<p>GPRS/EDGE</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Jack tai nghe</p>
			</td>
			<td>3.5 mm</td>
		</tr>
		<tr>
			<td>
			<p>NFC</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối USB</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối kh&aacute;c</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Cổng sạc</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Giải tr&iacute; &amp; Ứng dụng</p>
			</td>
			<td>Xem phim</td>
			<td>MP4, WMV, H.263, H.264(MPEG4-AVC), Xvid, DivX</td>
		</tr>
		<tr>
			<td>
			<p>Nghe nhạc</p>
			</td>
			<td>MP3, WAV, WMA, eAAC+</td>
		</tr>
		<tr>
			<td>
			<p>Ghi &acirc;m</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Giới hạn cuộc gọi</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>FM radio</p>
			</td>
			<td>FM radio với RDS</td>
		</tr>
		<tr>
			<td>
			<p>Chức năng kh&aacute;c</p>
			</td>
			<td>Google Search, Maps, Gmail, YouTube, Calendar, Google Talk<br />
			Mạng x&atilde; hội ảo<br />
			C&ocirc;ng nghệ Beats Audio<br />
			Micro chuy&ecirc;n dụng chống ồn<br />
			25GB lưu trữ dữ liệu Drobox</td>
		</tr>
	</tbody>
</table>
', N'<h2>HTC One &ndash; Thiết kế tuyệt đẹp c&ugrave;ng c&aacute;c th&agrave;nh phần cao cấp</h2>

<p><br />
HTC vừa qua đ&atilde; ra mắt si&ecirc;u phầm mang t&ecirc;n <strong>HTC One</strong> tại hai sự kiện xảy ra đồng thời ở London v&agrave; New York. Chiếc điện thoại được cho l&agrave; c&oacute; thiết kế đẹp mắt, mạnh mẽ với c&aacute;c th&agrave;nh phần cao cấp.</p>

<p><br />
C&oacute; những th&agrave;nh phần được l&agrave;m thủ c&ocirc;ng từ kim loại khiến <strong>HTC One</strong> trở n&ecirc;n v&ocirc; c&ugrave;ng độc đ&aacute;o. Ch&iacute;nh v&igrave; thế kh&ocirc;ng thể phủ nhận c&ocirc;ng sức của nh&agrave; sản xuất Đ&agrave;i loan đ&atilde; d&agrave;y c&ocirc;ng nghi&ecirc;n cứu v&agrave; cho ra &ldquo;đứa con cưng&rdquo; của m&igrave;nh.</p>

<p><strong><img alt="HTC One" src="http://cdn.tgdd.vn/Products/Images/42/58094/htc-one_clip_image002.jpg" style="height:411px; width:550px" /></strong><br />
<em>HTC One</em></p>

<p>&nbsp;</p>

<h3><br />
Thiết kế sang trọng</h3>

<p><img alt="HTC One có thiết kế sang trọng" src="http://cdn.tgdd.vn/Products/Images/42/58094/htc-one-1-13.jpg" /><br />
<em>HTC One với thiết kế thật sự &ldquo;sexy&rdquo;</em></p>

<p><br />
<strong><img alt="Mặt sau của HTC One" src="http://cdn.tgdd.vn/Products/Images/42/58094/htc-one_clip_image005.jpg" style="height:351px; width:550px" /></strong><br />
<em>Mặt sau của HTC One</em></p>

<p><br />
H&igrave;nh chữ nhật, phẳng, cực kỳ mỏng v&agrave; m&agrave;n h&igrave;nh gần như bao phủ th&acirc;n m&aacute;y. M&agrave;n h&igrave;nh LCD 4.7 inch, độ ph&acirc;n giải full HD 1080p, sử dụng c&ocirc;ng nghệ m&agrave; c&ocirc;ng ty gọi l&agrave; SoLux nhằm cải thiện chất lượng h&igrave;nh ảnh v&agrave; tạo ra độ ph&acirc;n giải l&ecirc;n đến 468ppi, cao nhất so với tất cả c&aacute;c d&ograve;ng điện thoại th&ocirc;ng minh hiện nay.</p>

<p><br />
HTC cho biết, điều n&agrave;y sẽ gi&uacute;p <strong>HTC One</strong> tự h&agrave;o về chất lượng h&igrave;nh ảnh tốt nhất so với bất kỳ điện thoại n&agrave;o tr&ecirc;n thị trường. Số điểm ảnh của <strong>One</strong> c&ograve;n lớn hơn so với <a href="http://www.thegioididong.com/dtdd/htc-butterfly" target="_blank">Droid DNA</a> (5 inch, 440ppi).</p>

<p><img alt="htc-one-va-xperia-z" src="http://cdn.tgdd.vn/Products/Images/42/58094/htc-one-va-xperia-z.jpg" /><br />
<em>Vỏ nh&ocirc;m nguy&ecirc;n khối khiến HTC One tr&ocirc;ng sang trọng kh&ocirc;ng k&eacute;m khi đứng cạnh đối thủ Xperia Z</em></p>

<p><br />
M&agrave;n h&igrave;nh của <strong>HTC One</strong> c&oacute; m&agrave;u sắc sống động, g&oacute;c nh&igrave;n rộng v&agrave; độ s&aacute;ng cao. C&aacute;c chi tiết h&igrave;nh ảnh nhỏ hay to vẫn sắc n&eacute;t ho&agrave;n hảo.</p>

<p><img alt="HTC One có góc nhìn màn hình rộng" src="http://cdn.tgdd.vn/Products/Images/42/58094/htc-one-goc-man-hinh-rong.jpg" /><br />
<em>M&agrave;n h&igrave;nh HTC One cho g&oacute;c nh&igrave;n rộng v&agrave; sắc n&eacute;t</em></p>

<p><br />
Đặc biệt, bộ khung vỏ của <strong>HTC One</strong> được l&agrave;m ho&agrave;n to&agrave;n bằng nh&ocirc;m nguy&ecirc;n khối, cho cảm gi&aacute;c hết sức chắc chắn v&agrave; mạnh mẽ. <strong>One</strong> c&oacute; sẵn c&aacute;c m&agrave;u như m&agrave;u đen v&agrave; bạc, thiết bị c&oacute; &ldquo;l&agrave;n da&rdquo; kim loại mịn m&agrave;ng bởi được l&agrave;m thủ c&ocirc;ng cao cấp.</p>

<p><img alt="Loa dưới của HTC One" src="http://cdn.tgdd.vn/Products/Images/42/58094/loa-duoi-htc-one-1.jpg" /><br />
<em>Loa dưới của HTC One</em></p>

<p><img alt="Loa trên của HTC One" src="http://cdn.tgdd.vn/Products/Images/42/58094/loa-tren-htc-one.jpg" /><br />
<em>Loa tr&ecirc;n</em> <em>của HTC One</em></p>

<p><br />
Ở một phần kh&aacute;c, <strong>HTC One</strong> sử dụng loa k&eacute;p ph&iacute;a tr&ecirc;n v&agrave; dưới m&agrave;n h&igrave;nh, hai loa phối hợp c&ugrave;ng nhau để trải nghiệm &acirc;m thanh sống động hơn kể cả khi xem phim hoặc nghe nhạc. Kết hợp với bộ khuếch đại &acirc;m thanh v&agrave; c&ocirc;ng nghệ Beats Audio, HTC đ&atilde; cho cả &ldquo;d&agrave;n loa&rdquo; v&agrave;o trong <strong>One</strong>.</p>

<p><img alt="HTC One được trang bị âm thanh Beats Audio" src="http://cdn.tgdd.vn/Products/Images/42/58094/htc-beats-audio.jpg" /><br />
<em>&Acirc;m thanh HDR v&agrave; Beats Audio tr&ecirc;n HTC One hứa hẹn sẽ mang đến những trải nghiệm &acirc;m nhạc thật kh&aacute;c biệt</em></p>

<p>&nbsp;</p>

<h3><br />
Phần cứng mạnh mẽ</h3>

<p><img alt="HTC có cấu hình mạnh trong thiết kế rất mỏng" src="http://cdn.tgdd.vn/Products/Images/42/58094/htc-nut-nguon.jpg" /><br />
<em>Ph&iacute;m tăng giảm &acirc;m lượng nằm tr&ecirc;n thiết kế si&ecirc;u mỏng của HTC one</em></p>

<p><br />
Một điện thoại th&ocirc;ng minh h&agrave;ng đầu sẽ kh&ocirc;ng c&oacute; gi&aacute; trị nếu trong m&aacute;y kh&ocirc;ng được hỗ trợ c&aacute;c th&agrave;nh phần cao cấp. <strong>HTC One</strong> kh&ocirc;ng l&agrave;m bạn thất vọng khi b&ecirc;n trong m&aacute;y l&agrave; bộ vi xử l&yacute; l&otilde;i tứ mới nhất của nh&agrave; sản xuất Qualcomm &ndash; <strong>Snapdragon 600 tốc độ 1.7GHz</strong>&nbsp;đi c&ugrave;ng với 2GB RAM. Vi xử l&yacute; được biết c&oacute; điểm số kiểm tra cao xấp xỉ 12.000 điểm. Bởi vậy, kh&ocirc;ng một ứng dụng n&agrave;o m&agrave; c&oacute; thể g&acirc;y kh&oacute; dễ cho <strong>HTC One</strong>.</p>

<p><img alt="jack 3.5mm trên htc one" src="http://cdn.tgdd.vn/Products/Images/42/58094/canh-tren-htc-one.jpg" /><br />
<em>Cạnh tr&ecirc;n của HTC One với Jack cắm &acirc;m thanh 3.5mm</em></p>

<p><br />
Pin liền m&aacute;y dung lượng kh&aacute; cao 2.300mAh sẽ cho thời lượng sử dụng m&aacute;y với thời gian d&agrave;i. HTC Droid DNA c&oacute; pin 2.020mAh, trong thử nghiệm xem video li&ecirc;n tục, m&aacute;y c&oacute; thời lượng l&agrave; 8 giờ 43 ph&uacute;t. Vậy đối với <strong>HTC One</strong>, pin 2.300mAh, chắc chắn thời lượng pin sẽ k&eacute;o d&agrave;i hơn.</p>

<p>&nbsp;</p>

<h3><br />
Giao diện Sense 5.0 với nhiều cải tiến</h3>

<p>Để ph&ugrave; hợp với c&aacute;c bộ phận cao cấp, <strong>HTC One</strong> sử dụng hệ điều h&agrave;nh mới nhất của <strong>Android Jelly Bean</strong> c&ugrave;ng giao diện người d&ugrave;ng <strong>HTC Sense 5</strong> đẹp mắt.</p>

<p><img alt="Giao diện Sense 5 trên HTC One" src="http://cdn.tgdd.vn/Products/Images/42/58094/htc-one-giao-dien-sense.jpg" /><br />
<em>M&agrave;n h&igrave;nh kh&oacute;a tr&ecirc;n HTC One cho ph&eacute;p truy cập nhanh c&aacute;c t&iacute;nh năng gọi, danh bạ, web v&agrave; camera.</em></p>

<p><br />
HTC gọi giao diện Sense mới được cải tiến l&agrave; <strong>BlinkFeed</strong>, c&oacute; thể thấy một ch&uacute;t g&igrave; đ&oacute; của giao diện Windows Phone 8 tr&ecirc;n BlinkFeed, giao diện ch&iacute;nh sẽ hiển thị nội dung c&aacute;c hoạt động như tin tức, blog, c&aacute;c trang web, tin tức tổng hợp.</p>

<p><br />
<img alt="Giao diện HTC Sense 5.0 - BlinkFeed trên HTC One" src="http://cdn.tgdd.vn/Products/Images/42/58094/htc-one_clip_image019.jpg" style="height:366px; width:550px" /><br />
<em>Giao diện HTC Sense 5.0 - BlinkFeed tr&ecirc;n One</em></p>

<p><br />
Đồng hồ kh&ocirc;ng phải sẽ chiếm phần lớn giao diện trang chủ nữa m&agrave; thay v&agrave;o đ&oacute; l&agrave; c&aacute;c dự b&aacute;o về thời tiết, h&igrave;nh ảnh, thời trang&hellip;</p>

<p><img alt="Giao diện Menu của HTC One" src="http://cdn.tgdd.vn/Products/Images/42/58094/htc-one-giao-dien-sense-2.jpg" /><br />
<em>HTC One c&oacute; giao diện cải tiến v&agrave; hữu &iacute;ch hơn</em></p>

<p><br />
Ranh giới giữa m&aacute;y t&iacute;nh bảng v&agrave; điện thoại th&ocirc;ng minh ng&agrave;y c&agrave;ng hẹp dần, <strong>HTC One</strong> cũng hỗ trợ t&iacute;nh năng ph&aacute;t hồng ngoại để c&oacute; thể điều khiển tivi.</p>

<p><img alt="Phím nguồn kiêm chức năng cổng hồng ngoại" src="http://cdn.tgdd.vn/Products/Images/42/58094/phim-nguon-htc-one.jpg" /><br />
<em>Ph&iacute;m nguồn tr&ecirc;n HTC One ki&ecirc;m chức năng cổng hồng ngoại để điều khiển TV</em></p>

<p>&nbsp;</p>

<h3><br />
Camera Ultrapixels</h3>

<p><img alt="Camera HTC One" src="http://cdn.tgdd.vn/Products/Images/42/58094/camera-htc-one.jpg" /><br />
<em>Camera UltraPixels ở mặt sau của HTC One</em></p>

<p><br />
HTC tiếp tục tập trung khả năng chụp ảnh cao cấp l&ecirc;n d&ograve;ng điện thoại mới của m&igrave;nh. <strong>One</strong> sẽ c&oacute; một hệ thống <strong>ImageSense</strong> mới, một phần cứng tốt hơn, cảm biến &aacute;nh s&aacute;ng được cải tiến, được gọi l&agrave; cảm biến <strong>UltraPixels</strong>.</p>

<p><br />
<strong>Ultrapixel</strong>&nbsp;l&agrave; thuật ngữ HTC d&ugrave;ng &nbsp;để m&ocirc; tả những &quot;megapixel được tạo từ điểm ảnh lớn&quot;. Với&nbsp;ống k&iacute;nh g&oacute;c rộng 28mm khẩu 2.0 c&ugrave;ng với một cảm biến k&iacute;ch thước 1/3&quot; 4Mp&nbsp;BSI&nbsp;th&igrave; c&aacute;c Pixel tr&ecirc;n HTC One c&oacute; k&iacute;ch thước 2&micro;m, lớn hơn so với k&iacute;ch thước thường tr&ecirc;n c&aacute;c điện thoại chụp h&igrave;nh cao cấp kh&aacute;c như Lumia 920 l&agrave; 1,1&micro;m. UltralPixel tr&ecirc;n&nbsp;<strong>HTC One</strong>&nbsp;v&agrave; n&oacute; c&oacute; thể thu được lượng &aacute;nh s&aacute;ng bằng 300%( 3 lần) so với c&aacute;c cảm biến c&oacute; k&iacute;ch thước Pixel 1,1&micro;m. C&ugrave;ng với khẩu 2.0 th&igrave; Camera của HTC One sẽ gi&uacute;p ch&uacute;ng ta chụp được ảnh trong điều kiện &aacute;nh s&aacute;ng yếu hay &aacute;nh s&aacute;ng kh&oacute; tốt hơn rất nhiều. Ngo&agrave;i ra th&igrave; HTC cũng trang bị hệ thống ổn định h&igrave;nh ảnh quang học tương tự như tr&ecirc;n Lumia 920.</p>

<p><br />
Với độ ph&acirc;n giải chỉ 4MP,&nbsp;<strong>HTC One</strong>&nbsp;sẽ cho ra những h&igrave;nh ảnh với k&iacute;ch thước kh&ocirc;ng lớn như những đối thủ kh&aacute;c với độ ph&acirc;n giải 12MP hay 13MP nhưng b&ugrave; lại, ảnh của HTC One vẫn sẽ cho chất lượng tốt d&ugrave; dung lượng nhỏ. V&agrave; v&igrave; thế, việc chia sẻ ảnh chụp tr&ecirc;n HTC One l&ecirc;n mạng x&atilde; hội sẽ dễ d&agrave;ng hơn. Đ&acirc;y cũng ch&iacute;nh l&agrave; mục đ&iacute;ch m&agrave; HTC đi ngược lại với xu hướng tăng &quot;chấm&quot; tr&ecirc;n smartphone hiện nay.</p>

<p><img alt="Ảnh chụp bởi HTC One" src="http://cdn.tgdd.vn/Products/Images/42/58094/IMAG0184.jpg" /><br />
<em>HTC One thể hiện những bức ảnh s&aacute;ng hơn</em></p>

<p><br />
HTC tuy&ecirc;n bố, m&aacute;y ảnh của họ c&oacute; thể nắm bắt ảnh s&aacute;ng nhiều hơn 300% so với những m&aacute;y ảnh của điện thoại cạnh tranh kh&aacute;c.</p>

<p>&nbsp;</p>

<h3><br />
Giao diện mang t&ecirc;n BlinkFeed sẽ th&uacute; vị hơn, hữu &iacute;ch hơn</h3>

<p>HTC cho biết, kh&ocirc;ng thể tắt ho&agrave;n to&agrave;n giao diện m&agrave; họ gọi l&agrave; BlinkFeed, bạn c&oacute; thể đẩy n&oacute; sang một b&ecirc;n v&agrave; sử dụng m&agrave;n h&igrave;nh chủ t&ugrave;y chỉnh, tuy nhi&ecirc;n n&oacute; vẫn lu&ocirc;n chạy ở chế độ nền. <strong>HTC One</strong> c&oacute; hai phi&ecirc;n bản với dung lượng kh&aacute; lớn 32GB/64GB v&agrave; sẽ sớm c&oacute; mặt tr&ecirc;n thị trường Việt Nam.</p>

<p>&nbsp;</p>

<h2>Ưu điểm</h2>

<ul>
	<li>Cấu h&igrave;nh mạnh mẽ, cảm ứng mượt m&agrave;.</li>
	<li>Thiết kế kim loại nguy&ecirc;n khối tinh tế, kiểu d&aacute;ng mạnh mẽ.</li>
	<li>M&agrave;n h&igrave;nh sắc n&eacute;t, cho chất lượng hiển thị trung thực.</li>
	<li>&Acirc;m thanh mạnh mẽ, sống động với Loa stereo k&eacute;p (BoomSound).</li>
	<li>Camera cho chất lượng ảnh tốt, nhờ c&ocirc;ng nghệ UltraPixel.</li>
	<li>Cập nhật th&ocirc;ng tin li&ecirc;n tục tr&ecirc;n m&agrave;n h&igrave;nh ch&iacute;nh với&nbsp;BlinkFeed.</li>
</ul>

<h2>Nhược điểm</h2>

<ul>
	<li>Vỏ nh&ocirc;m m&aacute;y sẽ n&oacute;ng hơn khi sử dụng l&acirc;u.</li>
	<li>K&iacute;ch thước ảnh chụp nhỏ.</li>
</ul>

<p><strong>Hữu T&igrave;nh</strong></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<table>
	<tbody>
		<tr>
			<td>
			<h3>Ưu điểm</h3>

			<ul>
				<li>Cấu h&igrave;nh mạnh mẽ, cảm ứng mượt m&agrave;.</li>
				<li>Thiết kế kim loại nguy&ecirc;n khối tinh tế, kiểu d&aacute;ng mạnh mẽ.</li>
				<li>M&agrave;n h&igrave;nh sắc n&eacute;t, cho chất lượng hiển thị trung thực.</li>
				<li>&Acirc;m thanh mạnh mẽ, sống động với Loa stereo k&eacute;p (BoomSound).</li>
				<li>Camera cho chất lượng ảnh tốt, nhờ c&ocirc;ng nghệ UltraPixel.</li>
				<li>Cập nhật th&ocirc;ng tin li&ecirc;n tục tr&ecirc;n m&agrave;n h&igrave;nh ch&iacute;nh với&nbsp;BlinkFeed.</li>
			</ul>
			</td>
			<td>
			<h3>Nhược điểm</h3>

			<ul>
				<li>Vỏ nh&ocirc;m m&aacute;y sẽ n&oacute;ng hơn khi sử dụng l&acirc;u.</li>
				<li>K&iacute;ch thước ảnh chụp nhỏ.</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<p>&nbsp;</p>
', 2, 99, 4, 0, 0, CAST(N'2017-12-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (8, N'HTC Desire 700', N'/Content/Images/HTC/HTC-Desire700.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/HTC/Hinh360-HTC/HTC-One-hinh360-1.jpg', N'" /> </a>', CAST(3880000 AS Decimal(18, 0)), CAST(5150000 AS Decimal(18, 0)), N'<p>M&agrave;n h&igrave;nh: qHD, 5.0&quot;, 540 x 960 pixels CPU: Qualcomm Snapdragon 200, 4 nh&acirc;n, 1.2 GHz RAM 1 GB Hệ điều h&agrave;nh: Android 4.1 (Jelly Bean) Camera ch&iacute;nh: 8.0 MP, Quay phim FullHD 1080p@30fps Camera phụ: 2.1 MP Bộ nhớ trong: 8 GB Thẻ nhớ ngo&agrave;i đến: 64 GB Dung lượng pin: 2100 mAh</p>
', N'<p><img src="http://cdn.tgdd.vn/Products/Images/42/60874/Kit/HTC-Desire-700-mo-ta-chuc-nang.jpg" /></p>

<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td rowspan="2">
			<p>Th&ocirc;ng tin chung</p>
			</td>
			<td>Hệ điều h&agrave;nh</td>
			<td>Android 4.1 (Jelly Bean)</td>
		</tr>
		<tr>
			<td>
			<p>Ng&ocirc;n ngữ</p>
			</td>
			<td>Tiếng Việt, Tiếng Anh</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>Loại m&agrave;n h&igrave;nh</td>
			<td>Super LCD</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;u m&agrave;n h&igrave;nh</p>
			</td>
			<td>16 triệu m&agrave;u</td>
		</tr>
		<tr>
			<td>
			<p>Chuẩn m&agrave;n h&igrave;nh</p>
			</td>
			<td>qHD</td>
		</tr>
		<tr>
			<td>
			<p>Độ ph&acirc;n giải</p>
			</td>
			<td>540 x 960 pixels</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh rộng</p>
			</td>
			<td>5.0&quot;</td>
		</tr>
		<tr>
			<td>
			<p>C&ocirc;ng nghệ cảm ứng</p>
			</td>
			<td>Cảm ứng điện dung đa điểm</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Chụp h&igrave;nh &amp; Quay phim</p>
			</td>
			<td>Camera sau</td>
			<td>8.0 MP</td>
		</tr>
		<tr>
			<td>
			<p>Camera trước</p>
			</td>
			<td>2.1 MP</td>
		</tr>
		<tr>
			<td>
			<p>Đ&egrave;n Flash</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>T&iacute;nh năng camera</p>
			</td>
			<td>Tự động lấy n&eacute;t, chạm lấy n&eacute;t<br />
			Nhận diện khu&ocirc;n mặt<br />
			Chống rung</td>
		</tr>
		<tr>
			<td>
			<p>Quay phim</p>
			</td>
			<td>Quay phim FullHD 1080p@30fps</td>
		</tr>
		<tr>
			<td>
			<p>Videocall</p>
			</td>
			<td>Hỗ trợ VideoCall qua Skype</td>
		</tr>
		<tr>
			<td rowspan="5">
			<p>CPU &amp; RAM</p>
			</td>
			<td>Tốc độ CPU</td>
			<td>1.2 GHz</td>
		</tr>
		<tr>
			<td>
			<p>Số nh&acirc;n</p>
			</td>
			<td>4 nh&acirc;n</td>
		</tr>
		<tr>
			<td>
			<p>Chipset</p>
			</td>
			<td>Qualcomm Snapdragon 200</td>
		</tr>
		<tr>
			<td>
			<p>RAM</p>
			</td>
			<td>1 GB</td>
		</tr>
		<tr>
			<td>
			<p>Chip đồ họa (GPU)</p>
			</td>
			<td>Adreno 205</td>
		</tr>
		<tr>
			<td rowspan="4">
			<p>Bộ nhớ &amp; Lưu trữ</p>
			</td>
			<td>Danh bạ</td>
			<td>Kh&ocirc;ng giới hạn</td>
		</tr>
		<tr>
			<td>
			<p>Bộ nhớ trong (ROM)</p>
			</td>
			<td>8 GB</td>
		</tr>
		<tr>
			<td>
			<p>Thẻ nhớ ngo&agrave;i</p>
			</td>
			<td>MicroSD (T-Flash)</td>
		</tr>
		<tr>
			<td>
			<p>Hỗ trợ thẻ tối đa</p>
			</td>
			<td>64 GB</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Thiết kế &amp; Trọng lượng</p>
			</td>
			<td>Kiểu d&aacute;ng</td>
			<td>Thanh + Cảm ứng</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước</p>
			</td>
			<td>145.5 x 72 x 10.3 mm</td>
		</tr>
		<tr>
			<td>
			<p>Trọng lượng (g)</p>
			</td>
			<td>149</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Th&ocirc;ng tin pin</p>
			</td>
			<td>Loại pin</td>
			<td>Pin chuẩn Li-Ion</td>
		</tr>
		<tr>
			<td>
			<p>Dung lượng pin</p>
			</td>
			<td>2100 mAh</td>
		</tr>
		<tr>
			<td>
			<p>Pin c&oacute; thể th&aacute;o rời</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td rowspan="13">
			<p>Kết nối &amp; Cổng giao tiếp</p>
			</td>
			<td>3G</td>
			<td>DC-HSDPA, 42 Mbps; HSDPA, 21 Mbps; HSUPA, 5.76 Mbps</td>
		</tr>
		<tr>
			<td>
			<p>4G</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Loại Sim</p>
			</td>
			<td>Micro SIM</td>
		</tr>
		<tr>
			<td>
			<p>Khe gắn Sim</p>
			</td>
			<td>2 SIM 2 s&oacute;ng</td>
		</tr>
		<tr>
			<td>
			<p>Wifi</p>
			</td>
			<td>Wi-Fi 802.11 a/b/g/n, DLNA, Wi-Fi Direct, dual-band, Wi-Fi hotspot</td>
		</tr>
		<tr>
			<td>
			<p>GPS</p>
			</td>
			<td>A-GPS v&agrave; GLONASS</td>
		</tr>
		<tr>
			<td>
			<p>Bluetooth</p>
			</td>
			<td>V4.0 with A2DP</td>
		</tr>
		<tr>
			<td>
			<p>GPRS/EDGE</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Jack tai nghe</p>
			</td>
			<td>3.5 mm</td>
		</tr>
		<tr>
			<td>
			<p>NFC</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối USB</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối kh&aacute;c</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Cổng sạc</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Giải tr&iacute; &amp; Ứng dụng</p>
			</td>
			<td>Xem phim</td>
			<td>MP4, WMV, H.263, H.264(MPEG4-AVC)</td>
		</tr>
		<tr>
			<td>
			<p>Nghe nhạc</p>
			</td>
			<td>MP3, WAV, WMA, eAAC+</td>
		</tr>
		<tr>
			<td>
			<p>Ghi &acirc;m</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Giới hạn cuộc gọi</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>FM radio</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Chức năng kh&aacute;c</p>
			</td>
			<td>Mạng x&atilde; hội ảo<br />
			Google Search, Maps, Gmail, YouTube, Google Talk, Picasa<br />
			Micro chuy&ecirc;n dụng chống ồn</td>
		</tr>
	</tbody>
</table>
', N'<h2>HTC Desire 700 &ndash; Đẹp như HTC One c&ugrave;ng cấu h&igrave;nh mạnh mẽ</h2>

<p><br />
C&oacute; thể n&oacute;i <strong>Desire 700</strong> l&agrave; một phi&ecirc;n bản gi&aacute; rẻ của <strong>HTC One</strong> bởi thiết kế của 2 m&aacute;y c&oacute; rất nhiều n&eacute;t tương đồng. Nếu như <strong>HTC Desire 700</strong> vẫn c&oacute; bộ khung vỏ nh&ocirc;m th&igrave; chắc chắn bạn sẽ kh&oacute; m&agrave; nhận ra thiết bị n&agrave;y với HTC One.</p>

<p><em><img alt="HTC Desire 700 có thiết kế đẹp với khung vỏ nhựa" src="http://cdn.tgdd.vn/Products/Images/42/60874/htc-desire-700_clip_image002.jpg" /></em><br />
<em>HTC Desire 700 c&oacute; thiết kế đẹp với khung vỏ nhựa</em></p>

<p><br />
Khi bạn nh&igrave;n v&agrave;o m&aacute;y, bạn sẽ cảm thấy sự sang trọng v&agrave; h&agrave;i h&ograve;a trong thiết kế, c&aacute;c chi tiết được bố tr&iacute; c&acirc;n đối. Mặt trước phẳng, khỏe khoắn v&agrave; mạnh mẽ. Trong khi mặt sau hơi cong v&ograve;m, tạo cảm gi&aacute;c cầm nắm dễ d&agrave;ng hơn.</p>

<p><br />
<strong>Desire 700</strong> c&oacute; trọng lượng 149g, với nhiều t&iacute;nh năng cao cấp như <strong>HTC One</strong>. Đ&oacute; l&agrave; bộ loa k&eacute;p ở mặt trước ph&iacute;a tr&ecirc;n v&agrave; dưới m&agrave;n h&igrave;nh, một ph&iacute;m Home cảm ứng điện dung tương tự như One. C&aacute;c m&agrave;ng loa được l&agrave;m tr&ograve;n g&oacute;c v&agrave; c&oacute; một ch&uacute;t hẹp hơn so với One. Tuy nhi&ecirc;n, bộ khung vỏ của thiết bị chỉ l&agrave;m bằng nhựa, một sự &ldquo;thất vọng&rdquo; nhẹ cho những ai l&agrave; Fan của HTC.</p>

<p><em><img alt="Mặt sau của Desire 700 bóng bẩy" src="http://cdn.tgdd.vn/Products/Images/42/60874/htc-desire-700_clip_image004.jpg" /></em><br />
<em>Mặt sau của Desire 700 b&oacute;ng bẩy</em></p>

<p><br />
Mặt sau của <strong>HTC Desire 700</strong> c&oacute; 2 đường sọc ngang tương tự như mặt sau của One, v&agrave; c&oacute; vẻ đ&acirc;y l&agrave; thiết kế y&ecirc;u th&iacute;ch của HTC cũng như người d&ugrave;ng trong năm 2013. Khi mở nắp lưng ra, bạn sẽ thấy khe cắm SIM c&ugrave;ng khe cắm thẻ nhớ, pin 2100mAh c&oacute; thể th&aacute;o rời.</p>

<p>&nbsp;</p>

<h3><br />
M&agrave;n h&igrave;nh 5 inch rộng r&atilde;i</h3>

<p><strong>Desire 700</strong><strong> </strong>c&oacute; m&agrave;n h&igrave;nh l&ecirc;n đến 5 inch, rộng hơn cả One (4.7 inch) v&igrave; vậy việc xem phim, lướt web, đọc s&aacute;ch b&aacute;o, xem ảnh sẽ cực kỳ tiện lợi v&agrave; thoải m&aacute;i. M&agrave;n h&igrave;nh rộng cũng gi&uacute;p bạn xem mọi thứ to, r&otilde; r&agrave;ng hơn, c&aacute;c ph&iacute;m đ&aacute;nh văn bản cũng lớn hơn, giảm sự nhầm lẫn.</p>

<p><br />
Tuy nhi&ecirc;n, m&agrave;n h&igrave;nh chỉ c&oacute; độ ph&acirc;n giải qHD (540 x 960 pixels) khiến việc xem chi tiết, zoom gần c&oacute; thể sẽ bị vỡ h&igrave;nh. Tất nhi&ecirc;n, ở chế độ b&igrave;nh thường, bạn vẫn c&oacute; những h&igrave;nh ảnh sắc n&eacute;t, g&oacute;c nh&igrave;n rộng v&agrave; rực rỡ.</p>

<p><em><img alt="HTC Desire 700 với màn hình 5 inch rộng rãi" src="http://cdn.tgdd.vn/Products/Images/42/60874/htc-desire-700_clip_image006.jpg" /></em><br />
<em>HTC Desire 700 với m&agrave;n h&igrave;nh 5 inch rộng r&atilde;i</em></p>

<p>&nbsp;</p>

<h3><br />
Cấu h&igrave;nh cao</h3>

<p>C&aacute;c th&ocirc;ng số kỹ thuật của <strong>HTC Desire 700</strong> c&oacute; vẻ như &ldquo;kh&ocirc;ng tầm trung ch&uacute;t n&agrave;o&rdquo; với bộ vi xử l&yacute; l&otilde;i tứ từ nh&agrave; sản xuất nổi tiếng Qualcomm Snapdragon 200 (Cortex-A7 tốc độ 1.2GHz), RAM 1GB c&ugrave;ng 8GB dung lượng lưu trữ nội bộ.</p>

<p><br />
Với cấu h&igrave;nh đ&oacute;, người d&ugrave;ng sẽ thoải m&aacute;i trải nghiệm nhiều tiện &iacute;ch, lướt web thỏa th&iacute;ch, xem phim trực tuyến nhanh ch&oacute;ng m&agrave; kh&ocirc;ng sợ bị giật. Đặc biệt, với sự hỗ trợ của đồ họa Adreno 305, bạn sẽ c&oacute; thể chơi nhiều game nặng, kể cả những game di động đ&ograve;i hỏi đồ họa cao.</p>

<p><em><img alt="Desire 700 với bộ vi xử lý lõi tứ cho trải nghiệm vượt trội" src="http://cdn.tgdd.vn/Products/Images/42/60874/htc-desire-700_clip_image008.jpg" /></em><br />
<em>Desire 700 với bộ vi xử l&yacute; l&otilde;i tứ cho trải nghiệm vượt trội</em></p>

<p>&nbsp;</p>

<h3><br />
M&aacute;y ảnh 8MP</h3>

<p><strong>Desire 700</strong> được trang bị m&aacute;y ảnh 8MP ph&iacute;a sau c&ugrave;ng m&aacute;y ảnh 2.1MP ph&iacute;a trước. M&aacute;y ảnh sau với nhiều t&iacute;nh năng hấp dẫn như tự động lấy n&eacute;t, chạm lấy n&eacute;t, nhận diện khu&ocirc;n mặt v&agrave; chống rung v&igrave; vậy m&agrave; bạn sẽ lu&ocirc;n c&oacute; được những bức h&igrave;nh đẹp từ camera n&agrave;y. Ngo&agrave;i ra, camera sau cũng c&oacute; thể quay video full HD sắc n&eacute;t v&agrave; được hỗ trợ đ&egrave;n flash, gi&uacute;p bạn vẫn c&oacute; những h&igrave;nh ảnh r&otilde; n&eacute;t trong b&oacute;ng tối.</p>

<p><br />
M&aacute;y ảnh trước 2.1MP gi&uacute;p người d&ugrave;ng c&oacute; thể c&oacute; những h&igrave;nh ảnh r&otilde; r&agrave;ng khi gọi video qua mạng hoặc gi&uacute;p bạn c&oacute; được những h&igrave;nh ảnh chụp ch&acirc;n dung.</p>

<p><em><img alt="Desire 700 có camera 8MP chụp ảnh, quay phim sắc nét" src="http://cdn.tgdd.vn/Products/Images/42/60874/htc-desire-700_clip_image010.jpg" /></em><br />
<em>M&aacute;y ảnh 8MP chụp ảnh, quay phim sắc n&eacute;t </em></p>

<p>&nbsp;</p>

<h3><br />
Giao diện Sense 5.0</h3>

<p>Đ&acirc;y ch&iacute;nh l&agrave; giao diện đ&atilde; được <strong>HTC</strong> t&iacute;ch hợp tr&ecirc;n phi&ecirc;n bản cao cấp One. Giao diện Sense 5.0 với t&iacute;nh năng&nbsp;BlinkFeed, c&oacute; thể thấy một ch&uacute;t g&igrave; đ&oacute; của giao diện Windows Phone 8 tr&ecirc;n BlinkFeed, giao diện ch&iacute;nh sẽ hiển thị nội dung c&aacute;c hoạt động như tin tức, blog, c&aacute;c trang web, tin tức tổng hợp.</p>

<p><br />
Giao diện Sense của HTC lu&ocirc;n được đ&aacute;nh gi&aacute; l&agrave; c&oacute; độ cuốn h&uacute;t cao bởi sự mượt m&agrave; cũng như đẹp mắt.</p>

<p><em><img alt="Giao diện Sense 5.0 mượt mà, hữu ích với tính năng BlinkFeed trên Desire 700" src="http://cdn.tgdd.vn/Products/Images/42/60874/htc-desire-700_clip_image012.jpg" /></em><br />
<em>Giao diện Sense 5.0 mượt m&agrave;, hữu &iacute;ch với t&iacute;nh năng BlinkFeed</em></p>

<p>&nbsp;</p>

<h3><br />
Hỗ trợ 2 SIM v&agrave; khe cắm thẻ nhớ</h3>

<p>Kh&ocirc;ng như d&ograve;ng HTC One, <strong>Desire 700</strong> được bổ sung th&ecirc;m một khe cắm SIM v&agrave; khe cắm thẻ nhớ gi&uacute;p bạn c&oacute; thể mở rộng th&ecirc;m bộ nhớ khi cần. Th&ecirc;m khe cắm SIM gi&uacute;p bạn quản l&yacute; danh bạn một c&aacute;ch tốt hơn cũng như linh hoạt hơn trong c&aacute;c cuộc gọi, dữ liệu mạng.</p>

<p><em><img alt="Desire 700 hỗ trợ 2 SIM cùng khe gắn thẻ nhớ hữu ích" src="http://cdn.tgdd.vn/Products/Images/42/60874/htc-desire-700_clip_image014.jpg" /></em><br />
<em>Hỗ trợ 2 SIM c&ugrave;ng khe gắn thẻ nhớ hữu &iacute;ch</em></p>

<p>&nbsp;</p>

<h3><br />
T&oacute;m lại</h3>

<p><strong>HTC Desire 700</strong> l&agrave; một smartphone c&oacute; thiết kế đẹp c&ugrave;ng cấu h&igrave;nh cao, nhiều t&iacute;nh năng mới hấp dẫn. Đặc biệt, m&aacute;y c&ograve;n hỗ trợ 2 SIM tiện lợi cho người d&ugrave;ng. Thiết bị ph&ugrave; hợp cho những ai th&iacute;ch một sản phẩm m&agrave;n h&igrave;nh rộng, thiết kế sang trọng, t&iacute;nh năng cao cấp tr&ecirc;n một mức gi&aacute; vừa phải.</p>

<p><strong>Hữu T&igrave;nh</strong></p>

<table>
	<tbody>
		<tr>
			<td>
			<h3>Ưu điểm</h3>

			<ul>
				<li>Thiết kế đẹp mắt.</li>
				<li>M&agrave;n h&igrave;nh rộng 5 inch cho trải nghiệm th&uacute; vị hơn.</li>
				<li>Hiệu suất xử l&yacute; cao với chip l&otilde;i tứ.</li>
				<li>M&aacute;y ảnh 8MP sắc n&eacute;t.</li>
				<li>Hỗ trợ 2 SIM v&agrave; thẻ nhớ ngo&agrave;i.</li>
				<li>Giao diện Sense 5.0 mượt m&agrave;.</li>
			</ul>
			</td>
			<td>
			<h3>Nhược điểm</h3>

			<ul>
				<li>M&agrave;n h&igrave;nh độ ph&acirc;n giải chưa cao.</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>
', 2, 99, 2, 0, 0, CAST(N'2017-12-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (9, N'HTC 8S', N'/Content/Images/HTC/HTC-8s.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/HTC/Hinh360-HTC/HTC-One-hinh360-1.jpg', N'" /> </a>', CAST(3290000 AS Decimal(18, 0)), CAST(3500000 AS Decimal(18, 0)), N'<p>M&agrave;n h&igrave;nh: WVGA, 4.0&quot;, 480 x 800 pixels CPU: Qualcomm Snapdragon S4, 2 nh&acirc;n, 1 GHz RAM 512 MB Hệ điều h&agrave;nh: Windows Phone 8 Camera ch&iacute;nh: 5.0 MP, Quay phim HD 720p@30fps Camera phụ: Kh&ocirc;ng Bộ nhớ trong: 4 GB Thẻ nhớ ngo&agrave;i đến: 32 GB Dung lượng pin: 1700 mAh</p>
', N'<p><img src="http://cdn.tgdd.vn/Products/Images/42/57296/Kit/HTC-8S-mo-ta-chuc-nang-1.jpg" /></p>

<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td rowspan="2">
			<p>Th&ocirc;ng tin chung</p>
			</td>
			<td>Hệ điều h&agrave;nh</td>
			<td>Windows Phone 8</td>
		</tr>
		<tr>
			<td>
			<p>Ng&ocirc;n ngữ</p>
			</td>
			<td>Tiếng Việt, Tiếng Anh</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>Loại m&agrave;n h&igrave;nh</td>
			<td>Super LCD</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;u m&agrave;n h&igrave;nh</p>
			</td>
			<td>16 triệu m&agrave;u</td>
		</tr>
		<tr>
			<td>
			<p>Chuẩn m&agrave;n h&igrave;nh</p>
			</td>
			<td>WVGA</td>
		</tr>
		<tr>
			<td>
			<p>Độ ph&acirc;n giải</p>
			</td>
			<td>480 x 800 pixels</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh rộng</p>
			</td>
			<td>4.0&quot;</td>
		</tr>
		<tr>
			<td>
			<p>C&ocirc;ng nghệ cảm ứng</p>
			</td>
			<td>Cảm ứng điện dung đa điểm</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Chụp h&igrave;nh &amp; Quay phim</p>
			</td>
			<td>Camera sau</td>
			<td>5.0 MP</td>
		</tr>
		<tr>
			<td>
			<p>Camera trước</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Đ&egrave;n Flash</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>T&iacute;nh năng camera</p>
			</td>
			<td>Tự động lấy n&eacute;t, chạm lấy n&eacute;t<br />
			Nhận diện khu&ocirc;n mặt</td>
		</tr>
		<tr>
			<td>
			<p>Quay phim</p>
			</td>
			<td>Quay phim HD 720p@30fps</td>
		</tr>
		<tr>
			<td>
			<p>Videocall</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="5">
			<p>CPU &amp; RAM</p>
			</td>
			<td>Tốc độ CPU</td>
			<td>1 GHz</td>
		</tr>
		<tr>
			<td>
			<p>Số nh&acirc;n</p>
			</td>
			<td>2 nh&acirc;n</td>
		</tr>
		<tr>
			<td>
			<p>Chipset</p>
			</td>
			<td>Qualcomm Snapdragon S4</td>
		</tr>
		<tr>
			<td>
			<p>RAM</p>
			</td>
			<td>512 MB</td>
		</tr>
		<tr>
			<td>
			<p>Chip đồ họa (GPU)</p>
			</td>
			<td>Adreno 305</td>
		</tr>
		<tr>
			<td rowspan="4">
			<p>Bộ nhớ &amp; Lưu trữ</p>
			</td>
			<td>Danh bạ</td>
			<td>Kh&ocirc;ng giới hạn</td>
		</tr>
		<tr>
			<td>
			<p>Bộ nhớ trong (ROM)</p>
			</td>
			<td>4 GB</td>
		</tr>
		<tr>
			<td>
			<p>Thẻ nhớ ngo&agrave;i</p>
			</td>
			<td>MicroSD (T-Flash)</td>
		</tr>
		<tr>
			<td>
			<p>Hỗ trợ thẻ tối đa</p>
			</td>
			<td>32 GB</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Thiết kế &amp; Trọng lượng</p>
			</td>
			<td>Kiểu d&aacute;ng</td>
			<td>Thanh + Cảm ứng</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước</p>
			</td>
			<td>120.5 x 63 x 10.3 mm</td>
		</tr>
		<tr>
			<td>
			<p>Trọng lượng (g)</p>
			</td>
			<td>113</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Th&ocirc;ng tin pin</p>
			</td>
			<td>Loại pin</td>
			<td>Pin chuẩn Li-Ion</td>
		</tr>
		<tr>
			<td>
			<p>Dung lượng pin</p>
			</td>
			<td>1700 mAh</td>
		</tr>
		<tr>
			<td>
			<p>Pin c&oacute; thể th&aacute;o rời</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="13">
			<p>Kết nối &amp; Cổng giao tiếp</p>
			</td>
			<td>3G</td>
			<td>HSDPA, 21 Mbps; HSUPA, 5.76 Mbps</td>
		</tr>
		<tr>
			<td>
			<p>4G</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Loại Sim</p>
			</td>
			<td>Micro SIM</td>
		</tr>
		<tr>
			<td>
			<p>Khe gắn Sim</p>
			</td>
			<td>1 Sim</td>
		</tr>
		<tr>
			<td>
			<p>Wifi</p>
			</td>
			<td>Wi-Fi 802.11 b/g/n</td>
		</tr>
		<tr>
			<td>
			<p>GPS</p>
			</td>
			<td>A-GPS v&agrave; GLONASS</td>
		</tr>
		<tr>
			<td>
			<p>Bluetooth</p>
			</td>
			<td>C&oacute;, V3.1</td>
		</tr>
		<tr>
			<td>
			<p>GPRS/EDGE</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Jack tai nghe</p>
			</td>
			<td>3.5 mm</td>
		</tr>
		<tr>
			<td>
			<p>NFC</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối USB</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối kh&aacute;c</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Cổng sạc</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Giải tr&iacute; &amp; Ứng dụng</p>
			</td>
			<td>Xem phim</td>
			<td>3GP, MP4, WMV</td>
		</tr>
		<tr>
			<td>
			<p>Nghe nhạc</p>
			</td>
			<td>MP3, WAV, WMA</td>
		</tr>
		<tr>
			<td>
			<p>Ghi &acirc;m</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Giới hạn cuộc gọi</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>FM radio</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Chức năng kh&aacute;c</p>
			</td>
			<td>Mạng x&atilde; hội ảo<br />
			7GB lưu trữ của SkyDrive</td>
		</tr>
	</tbody>
</table>
', N'<h2>HTC 8S - D&ograve;ng điện thoại trung cấp với hệ điều h&agrave;nh Windows Phone 8</h2>

<p><br />
C&ugrave;ng với việc cho ra mắt mẫu Smartphone cao cấp HTC 8X, HTC cũng tr&igrave;nh l&agrave;ng một mẫu Smartphone tầm trung mang t&ecirc;n <strong>HTC 8S</strong>, cả hai mẫu điện thoại n&agrave;y đều sử dụng hệ điều h&agrave;nh Windows Phone 8. Mặc d&ugrave; <strong>HTC 8S</strong> l&agrave; một mẫu điện thoại ở ph&acirc;n kh&uacute;c tầm trung nhưng m&aacute;y sở hữu những t&iacute;nh năng kh&ocirc;ng thua k&eacute;m g&igrave; đ&agrave;n anh HTC 8X của m&igrave;nh.</p>

<p>&nbsp;</p>

<h3><br />
Thiết kế trẻ trung năng động</h3>

<p>Trong thời buổi hiện nay khi m&agrave; thiết kế của những mẫu điện thoại cảm ứng m&agrave;n h&igrave;nh rộng gần như b&atilde;o ho&agrave; th&igrave; việc xuất hiện của <strong>HTC 8S</strong> như thổi một l&agrave;n gi&oacute; mới v&agrave;o thị trường Smartphone, với m&agrave;u sắc sặc sỡ được phối hợp h&agrave;i ho&agrave; c&ugrave;ng với thiết kế nguy&ecirc;n khối s&aacute;ng b&oacute;ng khiến cho HTC 8S g&acirc;y được ấn tượng mạnh cho người d&ugrave;ng ngay từ c&aacute;i nh&igrave;n đầu ti&ecirc;n bởi một phong c&aacute;ch rất trẻ trung v&agrave; năng động.</p>

<p><br />
Th&ocirc;ng số k&iacute;ch thước m&aacute;y cũng kh&aacute; tốt khi m&aacute;y chỉ d&agrave;y 10.3 mm v&agrave; nặng chưa tới 113 gram, cảm gi&aacute;c cầm m&aacute;y tr&ecirc;n tay rất đầm v&agrave; chắc chắn tương tự như mẫu cao cấp HTC 8X.</p>

<p><img alt="Mặt sau HTC 8S " src="http://cdn.tgdd.vn/Products/Images/42/57296/htc-8s_clip_image004.jpg" style="height:375px; width:665px" /></p>

<p><em>Cảm gi&aacute;c cầm m&aacute;y tr&ecirc;n tay rất tốt</em></p>

<p><img alt="HTC 8S có thiết kế nguyên khối" src="http://cdn.tgdd.vn/Products/Images/42/57296/htc-8s_clip_image006.png" style="height:401px; width:376px" /><br />
<em>Thiết kế nguy&ecirc;n khối tinh tế</em></p>

<p>&nbsp;</p>

<h3><br />
C&ocirc;ng nghệ &acirc;m thanh ti&ecirc;n tiến</h3>

<p>Ở mặt sau của m&aacute;y bạn sẽ bắt gặp ngay logo độc quyền của h&atilde;ng &acirc;m thanh nổi tiếng Beats, điều n&agrave;y đồng nghĩa với việc <strong>HTC 8S</strong> cũng sở hữu c&ocirc;ng nghệ &acirc;m thanh ti&ecirc;n tiến đến từ Beats như những Smartphone cao cấp ra mắt gần đ&acirc;y của HTC.</p>

<p><strong>Beats Audio&trade;</strong> mang đến cho người d&ugrave;ng bữa tiệc &acirc;m thanh tuyệt vời với chất lượng &acirc;m thanh tốt nhất, &acirc;m bass cao v&agrave; c&oacute; độ lắng đọng cần thiết, b&ecirc;n cạnh đ&oacute; Beat cũng cung cấp một thư viện th&ocirc;ng tin đồ sộ về những đoạn nhạc v&agrave; &acirc;m thanh trong Game, Xbox, Phim, Video với hơn 17 triệu đoạn ghi &acirc;m.</p>

<p><img alt="HTC 8S tích hợp âm thanh Beats" src="http://cdn.tgdd.vn/Products/Images/42/57296/htc-8s_clip_image008.png" style="height:425px; width:664px" /><br />
<em>Tận hưởng bữa tiệc &acirc;m nhạc đến từ Beats</em></p>

<p>&nbsp;</p>

<h3><br />
C&ocirc;ng nghệ chụp ảnh chuy&ecirc;n nghiệp</h3>

<p>Những mẫu điện thoại ra mắt gần đ&acirc;y của HTC lu&ocirc;n được ch&uacute; trọng đầu tư về camera, ti&ecirc;u ch&iacute; của h&atilde;ng l&agrave; mang lại trải nghiệm tốt nhất cho người d&ugrave;ng từ những t&iacute;nh năng cơ bản nhất của điện thoại. Được trang bị ph&iacute;m chụp h&igrave;nh vật l&yacute;, <strong>HTC 8S</strong> cho ph&eacute;p người d&ugrave;ng chụp ảnh nhanh ch&oacute;ng, camera của 8S chỉ 5MP nhưng chất lượng ảnh rất tốt, sắc n&eacute;t v&agrave; m&agrave;u sắc kh&aacute; h&agrave;i ho&agrave;. C&ugrave;ng với 7GB miễn ph&iacute; trong t&agrave;i khoản SkyDrive, người d&ugrave;ng sẽ dễ d&agrave;ng lưu trữ kho ảnh của m&igrave;nh l&ecirc;n hệ thống điện to&aacute;n đ&aacute;m m&acirc;y m&agrave; kh&ocirc;ng lo mất m&aacute;t.</p>

<p><img alt="giao diện chụp ảnh trên HTC 8S " src="http://cdn.tgdd.vn/Products/Images/42/57296/htc-8s_clip_image010.png" style="height:374px; width:600px" /><br />
<em>Chất lượng camera tr&ecirc;n HTC 8S rất tốt</em></p>

<p>&nbsp;</p>

<h3><br />
Thời lượng sử dụng pin tối ưu</h3>

<p>Vấn đề gặp phải của đa số người d&ugrave;ng Smartphone hiện nay l&agrave; thời lượng sử dụng pin ngắn ngủi, tuy nhi&ecirc;n với HTC 8S vấn đề về pin đ&atilde; được HTC khắc phục kh&aacute; tốt, nhờ bộ xử l&yacute; thế hệ mới c&ugrave;ng vi&ecirc;n pin với dung lương kh&aacute; cao l&ecirc;n tới 1700mAh, <strong>HTC 8S</strong> c&oacute; thể hoạt động tốt trong khoảng một ng&agrave;y rưỡi mới cần sạc lại.</p>

<p><img alt="điện thoại HTC 8S " src="http://cdn.tgdd.vn/Products/Images/42/57296/htc-8s_clip_image012.png" style="height:336px; width:590px" /><br />
<em>HTC 8S c&oacute; thời lượng sử dụng pin rất tốt</em></p>

<p>&nbsp;</p>

<h3><br />
Trải nghiệm tuyệt vời</h3>

<p>L&agrave; một mẫu Smartphone tầm trung n&ecirc;n cấu h&igrave;nh của <strong>HTC 8S</strong> kh&aacute; khi&ecirc;m tốn so với người anh em cao cấp HTC 8X của m&igrave;nh, m&aacute;y trang bị ch&iacute;p xử l&yacute; hai nh&acirc;n 1 GHz dual core Krait thế hệ mới nhất c&ugrave;ng dung lượng RAM l&agrave; 512 MB, tuy nhi&ecirc;n nhờ c&oacute; hệ điều h&agrave;nh Windows Phone 8 - hệ điều h&agrave;nh tối ưu d&agrave;nh cho điện thoại di động, HTC 8S hoạt động mượt m&agrave; trong mọi thao t&aacute;c từ xử l&yacute; văn bản đến chơi c&aacute;c đoạn video độ ph&acirc;n giải cao.</p>

<p>Cũng ch&iacute;nh nhờ Chip xử l&yacute; thế hệ mới n&agrave;y, <strong>HTC 8S</strong> c&oacute; thời lượng sử dụng pin rất tốt v&agrave; kh&ocirc;ng bị n&oacute;ng m&aacute;y khi sử dụng l&acirc;u.</p>

<p><img alt="HTC 8S chạy Windows Phone 8" src="http://cdn.tgdd.vn/Products/Images/42/57296/htc-8s_clip_image014.jpg" style="height:334px; width:524px" /><br />
<em>HTC 8S hoạt động mượt m&agrave; c&ugrave;ng hệ điều h&agrave;nh Windows Phone 8</em></p>

<p>&nbsp;</p>

<h3><br />
Giao diện LiveTiles người d&ugrave;ng th&acirc;n thiện</h3>

<p>Tuy vừa mới xuất hiện nhưng hệ điều h&agrave;nh Windows Phone 8 nhận được rất nhiều khen ngợi từ giới c&ocirc;ng nghệ, nguy&ecirc;n nh&acirc;n ch&iacute;nh l&agrave; do giao diện LiveTiles cực kỳ th&acirc;n thiện đối với người d&ugrave;ng. Với <strong>HTC 8S,</strong>&nbsp;những ứng dụng trực tuyến như Facebook, Mail, Twitter lu&ocirc;n được cập nhật li&ecirc;n tục tr&ecirc;n m&agrave;n h&igrave;nh ch&iacute;nh, việc bố tr&iacute; c&aacute;c mảng ứng dụng lớn đan xen nhau tr&ecirc;n m&agrave;n h&igrave;nh ch&iacute;nh cũng khiến người d&ugrave;ng dễ d&agrave;ng thao t&aacute;c với m&agrave;n h&igrave;nh cảm ứng hơn c&aacute;c hệ điều h&agrave;nh kh&aacute;c.</p>

<p><img alt="giao diện WP8 trên HTC 8S " src="http://cdn.tgdd.vn/Products/Images/42/57296/htc-8s_clip_image016.jpg" style="height:353px; width:350px" /><br />
<em>Giao diện Windows Phone 8 th&acirc;n thi&ecirc;n với người d&ugrave;ng</em></p>

<p><strong>Ng&ocirc; Quốc Bảo</strong></p>

<table>
	<tbody>
		<tr>
			<td>
			<h3>Ưu điểm</h3>

			<ul>
				<li>Thiết kế th&acirc;n thiện với người d&ugrave;ng.</li>
				<li>M&agrave;n h&igrave;nh cảm ứng sắc n&eacute;t.</li>
				<li>Hoạt động mượt m&agrave;.</li>
				<li>Thời lượng pin tối ưu.</li>
			</ul>
			</td>
			<td>
			<h3>Nhược điểm</h3>

			<ul>
				<li>Camera chưa n&eacute;t lắm.</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>
', 2, 99, 0, 0, 0, CAST(N'2017-12-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (10, N'HTC Desire L Dual Sim', N'/Content/Images/HTC/HTC Desire L Dual Sim.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/HTC/Hinh360-HTC/HTC-One-hinh360-1.jpg', N'" /> </a>', CAST(3990000 AS Decimal(18, 0)), CAST(4200000 AS Decimal(18, 0)), N'<p>M&agrave;n h&igrave;nh: WVGA, 4.3&quot;, 480 x 800 pixels CPU: Qualcomm, 2 nh&acirc;n, 1 GHz RAM 1 GB Hệ điều h&agrave;nh: Android 4.1 (Jelly Bean) SIM: 2 SIM 2 s&oacute;ng Camera: 5.0 MP, Quay phim HD 720p@30fps Bộ nhớ trong: 4 GB Thẻ nhớ ngo&agrave;i đến: 32 GB Dung lượng pin: 1800 mAh</p>
', N'<p><img src="http://cdn.tgdd.vn/Products/Images/42/60693/Kit/HTC-Desire-L-Dual-mo-ta-chuc-nang-1.jpg" /></p>

<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td rowspan="2">
			<p>Th&ocirc;ng tin chung</p>
			</td>
			<td>Hệ điều h&agrave;nh</td>
			<td>Android 4.1 (Jelly Bean)</td>
		</tr>
		<tr>
			<td>
			<p>Ng&ocirc;n ngữ</p>
			</td>
			<td>Tiếng Việt, Tiếng Anh</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>Loại m&agrave;n h&igrave;nh</td>
			<td>Super LCD</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;u m&agrave;n h&igrave;nh</p>
			</td>
			<td>16 triệu m&agrave;u</td>
		</tr>
		<tr>
			<td>
			<p>Chuẩn m&agrave;n h&igrave;nh</p>
			</td>
			<td>WVGA</td>
		</tr>
		<tr>
			<td>
			<p>Độ ph&acirc;n giải</p>
			</td>
			<td>480 x 800 pixels</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh rộng</p>
			</td>
			<td>4.3&quot;</td>
		</tr>
		<tr>
			<td>
			<p>C&ocirc;ng nghệ cảm ứng</p>
			</td>
			<td>Cảm ứng điện dung đa điểm</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Chụp h&igrave;nh &amp; Quay phim</p>
			</td>
			<td>Camera sau</td>
			<td>5.0 MP</td>
		</tr>
		<tr>
			<td>
			<p>Camera trước</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Đ&egrave;n Flash</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>T&iacute;nh năng camera</p>
			</td>
			<td>Tự động lấy n&eacute;t<br />
			Chống rung</td>
		</tr>
		<tr>
			<td>
			<p>Quay phim</p>
			</td>
			<td>Quay phim HD 720p@30fps</td>
		</tr>
		<tr>
			<td>
			<p>Videocall</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="5">
			<p>CPU &amp; RAM</p>
			</td>
			<td>Tốc độ CPU</td>
			<td>1 GHz</td>
		</tr>
		<tr>
			<td>
			<p>Số nh&acirc;n</p>
			</td>
			<td>2 nh&acirc;n</td>
		</tr>
		<tr>
			<td>
			<p>Chipset</p>
			</td>
			<td>Qualcomm</td>
		</tr>
		<tr>
			<td>
			<p>RAM</p>
			</td>
			<td>1 GB</td>
		</tr>
		<tr>
			<td>
			<p>Chip đồ họa (GPU)</p>
			</td>
			<td>Adreno 220</td>
		</tr>
		<tr>
			<td rowspan="4">
			<p>Bộ nhớ &amp; Lưu trữ</p>
			</td>
			<td>Danh bạ</td>
			<td>Kh&ocirc;ng giới hạn</td>
		</tr>
		<tr>
			<td>
			<p>Bộ nhớ trong (ROM)</p>
			</td>
			<td>4 GB</td>
		</tr>
		<tr>
			<td>
			<p>Thẻ nhớ ngo&agrave;i</p>
			</td>
			<td>MicroSD (T-Flash)</td>
		</tr>
		<tr>
			<td>
			<p>Hỗ trợ thẻ tối đa</p>
			</td>
			<td>32 GB</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Thiết kế &amp; Trọng lượng</p>
			</td>
			<td>Kiểu d&aacute;ng</td>
			<td>Thanh + Cảm ứng</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước</p>
			</td>
			<td>128 x 66.9 x 8.9</td>
		</tr>
		<tr>
			<td>
			<p>Trọng lượng (g)</p>
			</td>
			<td>120</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Th&ocirc;ng tin pin</p>
			</td>
			<td>Loại pin</td>
			<td>Pin chuẩn Li-Ion</td>
		</tr>
		<tr>
			<td>
			<p>Dung lượng pin</p>
			</td>
			<td>1800 mAh</td>
		</tr>
		<tr>
			<td>
			<p>Pin c&oacute; thể th&aacute;o rời</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td rowspan="13">
			<p>Kết nối &amp; Cổng giao tiếp</p>
			</td>
			<td>3G</td>
			<td>HSDPA, 7.2 Mbps; HSUPA, 5.76 Mbps</td>
		</tr>
		<tr>
			<td>
			<p>4G</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Loại Sim</p>
			</td>
			<td>Micro SIM</td>
		</tr>
		<tr>
			<td>
			<p>Khe gắn Sim</p>
			</td>
			<td>2 SIM 2 s&oacute;ng</td>
		</tr>
		<tr>
			<td>
			<p>Wifi</p>
			</td>
			<td>Wi-Fi 802.11 b/g/n, Wi-Fi hotspot</td>
		</tr>
		<tr>
			<td>
			<p>GPS</p>
			</td>
			<td>A-GPS v&agrave; GLONASS</td>
		</tr>
		<tr>
			<td>
			<p>Bluetooth</p>
			</td>
			<td>V4.0 with A2DP</td>
		</tr>
		<tr>
			<td>
			<p>GPRS/EDGE</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Jack tai nghe</p>
			</td>
			<td>3.5 mm</td>
		</tr>
		<tr>
			<td>
			<p>NFC</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối USB</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối kh&aacute;c</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Cổng sạc</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Giải tr&iacute; &amp; Ứng dụng</p>
			</td>
			<td>Xem phim</td>
			<td>MP4, WMV, H.263, H.264(MPEG4-AVC)</td>
		</tr>
		<tr>
			<td>
			<p>Nghe nhạc</p>
			</td>
			<td>MP3, WAV, WMA, eAAC+</td>
		</tr>
		<tr>
			<td>
			<p>Ghi &acirc;m</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Giới hạn cuộc gọi</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>FM radio</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Chức năng kh&aacute;c</p>
			</td>
			<td>Mạng x&atilde; hội ảo<br />
			Google Search, Maps, Gmail, YouTube, Calendar, Google Talk</td>
		</tr>
	</tbody>
</table>
', N'<h2>HTC Desire L &ndash; Trẻ trung, năng động</h2>

<p><br />
<strong>HTC Desire L </strong>l&agrave; sản phẩm định hướng v&agrave;o thị trường điện thoại tầm trung, th&acirc;n thiện hơn với t&uacute;i tiền của đa số người d&ugrave;ng. Phi&ecirc;n bản <strong>Desire L Dual <strong><a href="http://www.thegioididong.com/sim-so-dep" target="_blank">SIM</a></strong>&nbsp;</strong>mang<strong> </strong>đến những trải nghiệm th&uacute; vị tr&ecirc;n hệ điều h&agrave;nh Android v4.1.1 (Jelly Bean) c&ugrave;ng giao diện HTC Sense, camera 5MP, c&ocirc;ng nghệ &acirc;m thanh Beats Audio v&agrave; đặc biệt đ&acirc;y l&agrave; smartphone hỗ trợ hai sim hai s&oacute;ng online.</p>

<p><img alt="Kiểu dáng quyễn rũ hấp dẫn của HTC Desire L" src="http://cdn.tgdd.vn/Products/Images/42/60693/htc-desire-l-dual-sim_clip_image002.jpg" /><br />
<em>Kiểu d&aacute;ng quyễn rũ hấp dẫn của HTC Desire L</em></p>

<p>&nbsp;</p>

<h3><br />
Quyễn rũ v&agrave; s&agrave;nh điệu</h3>

<p><strong>HTC Desire L</strong> c&oacute; th&acirc;n h&igrave;nh gọn v&agrave; đẹp với k&iacute;ch thước 128 x 66.9 x 8.9 mm, nhẹ 120g, với m&agrave;n h&igrave;nh chỉ 4.3 inch cầm nắm dễ d&agrave;ng, vừa vặn với k&iacute;ch thước t&uacute;i quần jean, kh&ocirc;ng hề qu&aacute; khổ như những sản phẩm m&agrave;n h&igrave;nh cỡ lớn 5 inch kh&aacute;c. Sản phẩm c&oacute; m&agrave;u sắc kh&aacute; trẻ trung, hấp dẫn, đặc biệt th&iacute;ch hợp với c&aacute;c bạn nữ bởi thiết bị c&oacute; cả phi&ecirc;n bản m&agrave;u hồng b&ecirc;n cạnh hai m&agrave;u truyền thống đen v&agrave; trắng.</p>

<p><img alt="Hai cạnh trên và dưới được vát về phía sau Desire L" src="http://cdn.tgdd.vn/Products/Images/42/60693/htc-desire-l-dual-sim_clip_image004.jpg" /><br />
<em>Hai cạnh tr&ecirc;n v&agrave; dưới được v&aacute;t về ph&iacute;a sau</em> <em>Desire L</em></p>

<p><br />
Mặt trước của <strong>Desire L</strong> tr&ocirc;ng rộng v&agrave; tho&aacute;ng, diện t&iacute;ch xung quanh m&agrave;n h&igrave;nh được tận dụng tối đa. Phần viền bao quanh m&aacute;y <a href="http://www.thegioididong.com/dtdd-htc" target="_blank">HTC</a> thiết kế dải m&agrave;u giả kim loại nhằm tăng th&ecirc;m t&iacute;nh thẩm mỹ v&agrave; độ cứng c&aacute;p cho sản phẩm. Ngo&agrave;i ra phần camera được bao quanh bởi một tấm kim loại c&oacute; v&acirc;n nổi chạy ngang, tuy nhi&ecirc;n hiệu quả thẩm mỹ của chi tiết n&agrave;y l&agrave; kh&ocirc;ng cao.</p>

<p><img alt="Tươi tắn, trẻ trung với bộ vỏ màu hồng của HTC Desire L" src="http://cdn.tgdd.vn/Products/Images/42/60693/htc-desire-l-dual-sim_clip_image006.jpg" /><br />
<em>Tươi tắn, trẻ trung với bộ vỏ m&agrave;u hồng của Desire L</em></p>

<p>&nbsp;</p>

<h3><br />
M&agrave;n h&igrave;nh 4.3 inch, sử dụng c&ocirc;ng nghệ Super LCD2</h3>

<p>D&ugrave; m&agrave;n h&igrave;nh chỉ dừng lại ở k&iacute;ch thước 4.3 inch v&agrave; độ ph&acirc;n giải 480 x 800 pixel nhưng nhờ c&ocirc;ng nghệ <strong>Super LCD2</strong> do đ&oacute; chất lượng h&igrave;nh ảnh kh&aacute; tốt, m&agrave;u sắc được thể hiện sinh động, độ s&aacute;ng cao. Tuy kh&ocirc;ng sử dụng c&ocirc;ng nghệ IPS nhưng vẫn cho g&oacute;c nh&igrave;n kh&aacute; tho&aacute;ng kh&ocirc;ng hạn chế như c&aacute;c sản phẩm tầm trung kh&aacute;c. Ngo&agrave;i ra c&aacute;c thao t&aacute;c cảm ứng tr&ecirc;n m&agrave;n h&igrave;nh mượt m&agrave;, lướt, chạm, ph&oacute;ng to, thỏ nhỏ dễ d&agrave;ng, thuận tiện.</p>

<p><img alt="HTC Desire L có độ sáng cao, màu sắc rực rỡ" src="http://cdn.tgdd.vn/Products/Images/42/60693/htc-desire-l-dual-sim_clip_image008.jpg" /><br />
<em>HTC Desire L c&oacute; độ s&aacute;ng cao, m&agrave;u sắc rực rỡ</em></p>

<p>&nbsp;</p>

<h3><br />
Camera 5MP trang bị chip xử l&yacute; HTC ImageChip</h3>

<p>HTC trang bị cho camera một chip xử l&yacute; h&igrave;nh ảnh ri&ecirc;ng biệt mang t&ecirc;n <strong>HTC </strong><strong>ImageChip</strong>, c&oacute; khả năng tự động loại bỏ c&aacute;c hiện tượng nhiễu, hạt, nhất l&agrave; trong điều kiện thiếu s&aacute;ng. Camera chỉ tốn 0.7 gi&acirc;y để khởi động v&agrave; chỉ 0.2 gi&acirc;y để lấy n&eacute;t đối tượng bạn muốn chụp.</p>

<p><br />
<strong>HTC</strong> đ&atilde; t&iacute;ch hợp c&aacute;c t&iacute;nh năng chụp ảnh ti&ecirc;n tiến như HDR, Panorama, c&ugrave;ng c&aacute;c hiệu ứng s&aacute;ng tạo được t&iacute;ch hợp sẵn. Ngo&agrave;i ra camera c&ograve;n cho ph&eacute;p bạn điều chỉnh c&aacute;c th&ocirc;ng số như độ tương phản, độ b&atilde;o h&ograve;a, độ sắc n&eacute;t v&agrave; chỉnh bằng tay độ nhạy ISO trong khoảng 100 đến 800.</p>

<p><img alt="Camera phía sau 5MP của Desire L " src="http://cdn.tgdd.vn/Products/Images/42/60693/htc-desire-l-dual-sim_clip_image010.jpg" /><br />
<em>Camera ph&iacute;a sau 5MP của Desire L </em></p>

<p>&nbsp;</p>

<h3><br />
Hỗ trợ hai sim hai s&oacute;ng online</h3>

<p>Ng&agrave;y nay nhu cầu sử dụng hai sim tr&ecirc;n thị trường l&agrave; kh&aacute; cao v&agrave; hầu hết c&aacute;c h&atilde;ng điện thoại đều đ&atilde; c&oacute; sản phẩm hỗ trợ t&iacute;nh năng n&agrave;y. <strong>HTC Desire L Dual SIM</strong> mang đến sự tối ưu v&agrave; tiện dụng đặc biệt với những người bận rộn, c&oacute; nhiều mối quan hệ trong l&agrave;m ăn v&agrave; bạn b&egrave;, với khả năng sử dụng hai sim thiết bị gi&uacute;p bạn quản l&yacute; danh bạ tốt hơn, lựa chọn dễ d&agrave;ng hơn c&aacute;c dịch vụ của nh&agrave; mạng.</p>

<p><img alt="Quản lý danh bạ tốt hơn trên HTC Desire Dual SIM" src="http://cdn.tgdd.vn/Products/Images/42/60693/htc-desire-l-dual-sim_clip_image012.jpg" /><br />
<em>Quản l&yacute; danh bạ tốt hơn tr&ecirc;n HTC Desire Dual SIM</em></p>

<p>&nbsp;</p>

<h3><br />
Hiệu suất ổn định, chạy đa nhiệm tốt</h3>

<p>HTC trang bị cho <strong>Desire L</strong> chip l&otilde;i k&eacute;p với tốc độ 1GHz c&ugrave;ng với RAM 1GB v&agrave; bộ nhớ trong 4GB trong đ&oacute; bộ nhớ hệ thống chiếm đến 1.7GB, nếu bạn th&iacute;ch c&agrave;i đặt nhiều ứng dụng hoặc game th&igrave; c&oacute; lẽ sẽ phải c&acirc;n chỉnh nhiều.</p>

<p><br />
Tuy nhi&ecirc;n với việc hỗ trợ bộ nhớ ngo&agrave;i l&ecirc;n đến 32GB bạn c&oacute; thể d&ugrave;ng ứng dụng hỗ trợ để chuyển lưu lượng data của ứng dụng sang thẻ nhớ để mở rộng th&ecirc;m bộ nhớ trong. Ngo&agrave;i ra thiết bị đ&aacute;p ứng tốt c&aacute;c nhu cầu về lướt web, cập nhật mạng x&atilde; hội, duyệt văn bản, đọc s&aacute;ch, phục vụ nhu cầu giải tr&iacute; nhẹ nh&agrave;ng.</p>

<p><img alt="Desire L nhỏ nhưng không hề yếu" src="http://cdn.tgdd.vn/Products/Images/42/60693/htc-desire-l-dual-sim_clip_image014.jpg" /><br />
<em>Desire L nhỏ nhưng kh&ocirc;ng hề yếu</em></p>

<p>&nbsp;</p>

<h3><br />
&Acirc;m thanh sống động với Beats Audio</h3>

<p>Giống như những người anh đi trước của n&oacute;, biểu tượng Beats Audio vẫn l&agrave; logo quen thuộc ở mặt sau của <strong>HTC Desire L</strong>. C&ocirc;ng nghệ ti&ecirc;n tiến n&agrave;y mang đến chất lượng &acirc;m thanh kh&aacute; trung thực, sống động, c&oacute; treble v&agrave; bass r&otilde; r&agrave;ng, tạo n&ecirc;n sự kịch t&iacute;nh hơn trong khi chơi game, gi&uacute;p bạn c&oacute; khoảng kh&ocirc;ng gian nghe nhạc, xem phim bổ &iacute;ch.</p>

<p><img alt="HTC Desire L với Logo Beats Audio quen thuộc " src="http://cdn.tgdd.vn/Products/Images/42/60693/htc-desire-l-dual-sim_clip_image016.jpg" /><br />
<em>HTC Desire L với Beats Audio</em></p>

<p><br />
<strong>HTC Desire L</strong> l&agrave; smartphone hỗ trợ nhiều t&iacute;nh năng đ&aacute;ng gi&aacute;, mang đến những trải nghiệm th&uacute; vị v&agrave; hữu &iacute;ch, sự tiện dụng trong c&ocirc;ng việc cũng như cập nhật th&ocirc;ng tin v&agrave; mạng x&atilde; hội. Đặc biệt sản phẩm thuộc ph&acirc;n kh&uacute;c tầm trung n&ecirc;n người d&ugrave;ng c&oacute; thế tiếp cận dễ d&agrave;ng.<strong> Desire L </strong>th&iacute;ch hợp với người d&ugrave;ng năng động, người bận rộn muốn sở hữu smartphone hỗ trợ đến hai sim.</p>

<p><strong>Trung Hiếu</strong></p>

<table>
	<tbody>
		<tr>
			<td>
			<h3>Ưu điểm</h3>

			<ul>
				<li>Thiết kế trẻ trung, sang trọng.</li>
				<li>M&agrave;n h&igrave;nh Super LCD2 cho chất lượng h&igrave;nh ảnh trung thực, sắc n&eacute;t.</li>
				<li>Camera 5MP, tốc độ chụp nhanh, khả năng chụp thiếu s&aacute;ng tốt.</li>
				<li>Hiệu suất vượt trội với 2 nh&acirc;n tốc độ 1GHz v&agrave; RAM 1Gb.</li>
			</ul>
			</td>
			<td>
			<h3>Nhược điểm</h3>

			<ul>
				<li>Kh&ocirc;ng c&oacute; camera ph&iacute;a trước trước.</li>
				<li>Pin dung lượng chỉ 1800mAh.</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>
', 2, 99, 0, 0, 0, CAST(N'2017-12-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (11, N'HTC Desire SV', N'/Content/Images/HTC/HTC Desire SV.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/HTC/Hinh360-HTC/HTC-One-hinh360-1.jpg', N'" /> </a>', CAST(1490000 AS Decimal(18, 0)), CAST(2990000 AS Decimal(18, 0)), N'<p>M&agrave;n h&igrave;nh: WVGA, 4.3&quot;, 480 x 800 pixels CPU: Qualcomm MSM8255, 2 nh&acirc;n, 1 GHz RAM 768 MB Hệ điều h&agrave;nh: Android 4.0.4 (ICS) SIM: 2 SIM 2 s&oacute;ng Camera: 8.0 MP, Quay phim 480p@30fps Bộ nhớ trong: 4 GB Thẻ nhớ ngo&agrave;i đến: 32 GB Dung lượng pin: 1620 mAh</p>
', N'<p><img src="http://cdn.tgdd.vn/Products/Images/42/57645/Kit/HTC-Desire-SV-mo-ta-chuc-nang.jpg" /></p>

<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td rowspan="2">
			<p>Th&ocirc;ng tin chung</p>
			</td>
			<td>Hệ điều h&agrave;nh</td>
			<td>Android 4.0.4 (ICS)</td>
		</tr>
		<tr>
			<td>
			<p>Ng&ocirc;n ngữ</p>
			</td>
			<td>Tiếng Việt, Tiếng Anh, Tiếng Hoa</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>Loại m&agrave;n h&igrave;nh</td>
			<td>Super LCD</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;u m&agrave;n h&igrave;nh</p>
			</td>
			<td>16 triệu m&agrave;u</td>
		</tr>
		<tr>
			<td>
			<p>Chuẩn m&agrave;n h&igrave;nh</p>
			</td>
			<td>WVGA</td>
		</tr>
		<tr>
			<td>
			<p>Độ ph&acirc;n giải</p>
			</td>
			<td>480 x 800 pixels</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh rộng</p>
			</td>
			<td>4.3&quot;</td>
		</tr>
		<tr>
			<td>
			<p>C&ocirc;ng nghệ cảm ứng</p>
			</td>
			<td>Cảm ứng điện dung đa điểm</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Chụp h&igrave;nh &amp; Quay phim</p>
			</td>
			<td>Camera sau</td>
			<td>8.0 MP</td>
		</tr>
		<tr>
			<td>
			<p>Camera trước</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Đ&egrave;n Flash</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>T&iacute;nh năng camera</p>
			</td>
			<td>Tự động lấy n&eacute;t, chạm để lấy n&eacute;t</td>
		</tr>
		<tr>
			<td>
			<p>Quay phim</p>
			</td>
			<td>Quay phim 480p@30fps</td>
		</tr>
		<tr>
			<td>
			<p>Videocall</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="5">
			<p>CPU &amp; RAM</p>
			</td>
			<td>Tốc độ CPU</td>
			<td>1 GHz</td>
		</tr>
		<tr>
			<td>
			<p>Số nh&acirc;n</p>
			</td>
			<td>2 nh&acirc;n</td>
		</tr>
		<tr>
			<td>
			<p>Chipset</p>
			</td>
			<td>Qualcomm MSM8255</td>
		</tr>
		<tr>
			<td>
			<p>RAM</p>
			</td>
			<td>768 MB</td>
		</tr>
		<tr>
			<td>
			<p>Chip đồ họa (GPU)</p>
			</td>
			<td>Adreno 203</td>
		</tr>
		<tr>
			<td rowspan="4">
			<p>Bộ nhớ &amp; Lưu trữ</p>
			</td>
			<td>Danh bạ</td>
			<td>Kh&ocirc;ng giới hạn</td>
		</tr>
		<tr>
			<td>
			<p>Bộ nhớ trong (ROM)</p>
			</td>
			<td>4 GB</td>
		</tr>
		<tr>
			<td>
			<p>Thẻ nhớ ngo&agrave;i</p>
			</td>
			<td>MicroSD (T-Flash)</td>
		</tr>
		<tr>
			<td>
			<p>Hỗ trợ thẻ tối đa</p>
			</td>
			<td>32 GB</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Thiết kế &amp; Trọng lượng</p>
			</td>
			<td>Kiểu d&aacute;ng</td>
			<td>Thanh + Cảm ứng</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước</p>
			</td>
			<td>129.7 x 67.9 x 10.7 mm</td>
		</tr>
		<tr>
			<td>
			<p>Trọng lượng (g)</p>
			</td>
			<td>131</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Th&ocirc;ng tin pin</p>
			</td>
			<td>Loại pin</td>
			<td>Pin chuẩn Li-Ion</td>
		</tr>
		<tr>
			<td>
			<p>Dung lượng pin</p>
			</td>
			<td>1620 mAh</td>
		</tr>
		<tr>
			<td>
			<p>Pin c&oacute; thể th&aacute;o rời</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td rowspan="13">
			<p>Kết nối &amp; Cổng giao tiếp</p>
			</td>
			<td>3G</td>
			<td>HSDPA, 7.2 Mbps; HSUPA, 5.76 Mbps</td>
		</tr>
		<tr>
			<td>
			<p>4G</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Loại Sim</p>
			</td>
			<td>Micro SIM</td>
		</tr>
		<tr>
			<td>
			<p>Khe gắn Sim</p>
			</td>
			<td>2 SIM 2 s&oacute;ng</td>
		</tr>
		<tr>
			<td>
			<p>Wifi</p>
			</td>
			<td>Wi-Fi 802.11 b/g/n, Wi-Fi hotspot</td>
		</tr>
		<tr>
			<td>
			<p>GPS</p>
			</td>
			<td>A-GPS</td>
		</tr>
		<tr>
			<td>
			<p>Bluetooth</p>
			</td>
			<td>V4.0 with A2DP</td>
		</tr>
		<tr>
			<td>
			<p>GPRS/EDGE</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Jack tai nghe</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td>
			<p>NFC</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối USB</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối kh&aacute;c</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Cổng sạc</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Giải tr&iacute; &amp; Ứng dụng</p>
			</td>
			<td>Xem phim</td>
			<td>MP4, WMV, H.263, H.264(MPEG4-AVC)</td>
		</tr>
		<tr>
			<td>
			<p>Nghe nhạc</p>
			</td>
			<td>MP3, WAV, WMA, eAAC+</td>
		</tr>
		<tr>
			<td>
			<p>Ghi &acirc;m</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Giới hạn cuộc gọi</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>FM radio</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Chức năng kh&aacute;c</p>
			</td>
			<td>Mạng x&atilde; hội ảo<br />
			Google Search, Maps, Gmail, YouTube, Google Talk<br />
			t&agrave;i khoản Dropbox 25GB</td>
		</tr>
	</tbody>
</table>
', N'<h2>HTC DESIRE SV &ndash; Smartphone 2 SIM 2 s&oacute;ng đẳng cấp</h2>

<p><br />
HTC mang đến cho người d&ugrave;ng một lựa chọn smartphone ho&agrave;n to&agrave;n mới mẻ - smartphone 2 sim 2 s&oacute;ng, tiếp nối th&agrave;nh c&ocirc;ng của chiếc điện thoại 2 sim 2 s&oacute;ng đầu ti&ecirc;n của h&atilde;ng <a href="http://www.thegioididong.com/dtdd/htc-desire-v" target="_blank">HTC Desire V,</a> đ&oacute; l&agrave; chiếc <strong>HTC Desire SV</strong> với phần cứng được đầu tư tốt hơn sẽ hứa hẹn mang lại những trải nghiệm mới cho người d&ugrave;ng.</p>

<p><img alt="HTC Desire SV, smartphone 2 sim 2 sóng" src="http://cdn.tgdd.vn/Products/Images/42/57645/htc-desire-sv_clip_image001.jpg" style="height:414px; width:492px" /><br />
<em>HTC Desire SV, smartphone 2 sim 2 s&oacute;ng</em></p>

<h3><br />
HĐH Android với giao diện Sense 4.1</h3>

<p><strong>Điện thoại HTC Desire SV</strong> được c&agrave;i đặt sẵn HĐH Android với giao diện Sense đặc trưng của HTC, phi&ecirc;n bản mới 4.1. Giao diện Sense được HTC t&ugrave;y biến để c&oacute; thể tận dụng tối đa phần cứng của m&aacute;y cũng như phục vụ tốt hơn những t&iacute;nh năng m&agrave; HĐH Android mang đến cho người d&ugrave;ng. Với số ứng dụng vượt trội l&ecirc;n đến h&agrave;ng trăm ng&agrave;n tiện &iacute;ch v&agrave; tr&ograve; chơi sẽ phục vụ tối đa nhu cầu sử dụng của người d&ugrave;ng.</p>

<p><img alt="HTC Desire SV có giao diện Sense rất đẹp và tiện dụng" src="http://cdn.thegioididong.com/Products/Images/42/57645/htc-desire-sv_clip_image002.jpg" style="height:500px; width:549px" /><br />
<em>HTC Desire SV c&oacute; giao diện Sense rất đẹp v&agrave; tiện dụng</em></p>

<h3><br />
M&agrave;n h&igrave;nh 4.3 inch sử dụng c&ocirc;ng nghệ LCD2 sắc n&eacute;t</h3>

<p>Được trang bị m&agrave;n h&igrave;nh rộng đến 4.3 inch với c&ocirc;ng nghệ m&agrave;n h&igrave;nh LCD2. <strong>HTC Desire SV</strong> cho g&oacute;c nh&igrave;n rộng, m&agrave;n h&igrave;nh lớn hiển thị c&aacute;c ứng dụng cũng như lướt web &quot;rộng r&atilde;i&quot;, khi xem h&igrave;nh ảnh v&agrave; video cho m&agrave;u sắc tươi s&aacute;ng v&agrave; rực rỡ hơn. Bộ m&aacute;y tăng cường m&agrave;u sắc cung cấp cho m&agrave;n h&igrave;nh của m&aacute;y độ tương phản cao, nhiều m&agrave;u sắc hơn v&agrave; giảm phản xạ &aacute;nh s&aacute;ng gi&uacute;p những trải nghiệm tr&ecirc;n m&agrave;n h&igrave;nh tuyệt vời hơn bao giờ hết, đặc biệt l&agrave; sử dụng ngo&agrave;i trời.</p>

<p><img alt="Vô tư giải trí trên màn hình rộng 4.3 inch" src="http://cdn.thegioididong.com/Products/Images/42/57645/htc-desire-sv_clip_image003.jpg" style="height:349px; width:544px" /><br />
<em>V&ocirc; tư giải tr&iacute; tr&ecirc;n m&agrave;n h&igrave;nh rộng 4.3 inch</em></p>

<h3><br />
Li&ecirc;n lạc đa chiều với chế độ 2 sim 2 s&oacute;ng</h3>

<p>C&oacute; thể xem đ&acirc;y l&agrave; một trong những d&ograve;ng smartphone 2 sim 2 s&oacute;ng đầu ti&ecirc;n của HTC với mong muốn mang đến cho người d&ugrave;ng sự thoải m&aacute;i nhất khi sử dụng điện thoại. Từ b&acirc;y giờ người d&ugrave;ng sẽ kh&ocirc;ng c&ograve;n kh&oacute; chịu khi phải mang theo 2 chiếc điện thoại b&ecirc;n m&igrave;nh vừa bất tiện, vừa tốn k&eacute;m v&igrave; <strong>Desire SV</strong> sẽ cung cấp cho bạn 2 khe cắm sim v&agrave; 2 s&oacute;ng online c&ugrave;ng l&uacute;c chỉ tr&ecirc;n một chiếc điện thoại duy nhất.</p>

<p><img alt="Sử dụng điện thoại đơn giản hơn với chức năng 2 sim 2 sóng" src="http://cdn.thegioididong.com/Products/Images/42/57645/htc-desire-sv_clip_image004.jpg" style="height:403px; width:628px" /><br />
<em>Sử dụng điện thoại đơn giản hơn với chức năng 2 sim 2 s&oacute;ng</em></p>

<h3><br />
Camera tuyệt vời</h3>

<p>HTC mang đến cho thiết bị của m&igrave;nh một camera 8 megapixel với đ&egrave;n Flash LED v&agrave; cảm biến BSI, c&oacute; ống k&iacute;nh 28 mm với f/2.2. Camera của <strong>HTC Desire SV</strong> c&oacute; chế độ tự động lấy n&eacute;t, cảm biến BSI gi&uacute;p chụp ảnh tốt hơn trong m&ocirc;i trường thiếu &aacute;nh s&aacute;ng, đ&egrave;n Flash th&ocirc;ng minh với 5 mức chiếu s&aacute;ng phụ thuộc v&agrave;o khoảng c&aacute;ch với vật m&igrave;nh muốn chụp. Đồng thời chức năng quay video của m&aacute;y c&ograve;n c&oacute; chế độ chụp lại ảnh trong video, rất th&uacute; vị.</p>

<p><img alt="Camera 8.0 megapixel lưu lại những khoảnh khắc đáng nhớ một cách đẹp nhất" src="http://cdn.thegioididong.com/Products/Images/42/57645/htc-desire-sv_clip_image005.jpg" style="height:349px; width:544px" /><br />
<em>Camera 8.0 megapixel lưu lại những khoảnh khắc đ&aacute;ng nhớ một c&aacute;ch đẹp nhất</em></p>

<h3><br />
Trải nghiệm &acirc;m thanh tuyệt vời với Beats Audio</h3>

<p>Được t&iacute;ch hợp sẵn c&ocirc;ng nghệ Beats Audio như một số d&ograve;ng điện thoại gần đ&acirc;y của HTC, Desire SV mang đến trải nghiệm &acirc;m nhạc, chơi game cũng như xem phim th&uacute; vị hơn, hay hơn nhờ được tăng cường &acirc;m bass, c&aacute;c &acirc;m chi tiết hơn v&agrave; rất trong trẻo. Với <strong>điện thoại HTC Desire SV</strong>, nghe nhạc kh&ocirc;ng c&ograve;n được hiểu theo c&aacute;ch th&ocirc;ng thường m&agrave; phải gọi l&agrave; thưởng thức &acirc;m nhạc.</p>

<p><img alt="Thưởng thức từng giai điệu của âm nhạc cùng tai nghe Beats" src="http://cdn.thegioididong.com/Products/Images/42/57645/htc-desire-sv_clip_image006.jpg" style="height:349px; width:544px" /><br />
<em>Thưởng thức từng giai điệu của &acirc;m nhạc c&ugrave;ng tai nghe Beats</em></p>

<h3><br />
Hỗ trợ lưu trữ đ&aacute;m m&acirc;y với 25GB miễn ph&iacute;</h3>

<p>Với bộ nhớ trong 4 GB v&agrave; khả năng hỗ trợ thẻ nhớ ngo&agrave;i l&ecirc;n đến 32GB, HTC Desire SV mang đến cho người d&ugrave;ng một kh&ocirc;ng gian lưu trữ kh&aacute; thoải m&aacute;i. Người d&ugrave;ng c&oacute; thể vừa ch&eacute;p phim HD, nhạc vừa c&agrave;i ứng dụng m&agrave; kh&ocirc;ng cần phải lo lắng đến kh&ocirc;ng gian lưu trữ.</p>

<p>Nắm bắt được y&ecirc;u cầu sử dụng nhiều bộ nhớ hơn v&agrave; cũng tiếp bước c&ugrave;ng c&ocirc;ng nghệ, HTC đ&atilde; đưa nền tảng đ&aacute;m m&acirc;y v&agrave;o chiếc điện thoại với 25GB dung lượng miễn ph&iacute; từ t&agrave;i khoản Dropbox trong 2 năm, người d&ugrave;ng sẽ c&oacute; thể dễ d&agrave;ng chia sẻ h&igrave;nh ảnh, video cũng như xem lại một c&aacute;ch dễ d&agrave;ng.</p>

<p><img alt="Tài khoản Dropbox cung cấp 25GB dung lượng miễn phí" src="http://cdn.thegioididong.com/Products/Images/42/57645/htc-desire-sv_clip_image007.jpg" style="height:355px; width:628px" /><br />
<em>T&agrave;i khoản Dropbox cung cấp 25GB dung lượng miễn ph&iacute;</em></p>

<p><strong>Trần Th&aacute;i Sơn</strong></p>

<table>
	<tbody>
		<tr>
			<td>
			<h3>Ưu điểm</h3>

			<ul>
				<li>M&agrave;n h&igrave;nh lớn, hiển thị h&igrave;nh ảnh trung thực, sắc n&eacute;t.</li>
				<li>2 sim 2 s&oacute;ng, tận dụng tối đa lợi &iacute;ch từ nh&agrave; mạng</li>
				<li>HĐH Android 4.0 v&agrave; giao diện Sense b&oacute;ng bẩy.</li>
				<li>Camera c&ugrave;ng cảm biến&nbsp;BSI cho h&igrave;nh ảnh đẹp ngay cả trong điều kiện thiếu s&aacute;ng.</li>
				<li>&Acirc;m thanh hay c&ugrave;ng c&ocirc;ng nghệ Beats Audio độc quyền.</li>
			</ul>
			</td>
			<td>
			<h3>Nhược điểm</h3>

			<ul>
				<li>Quay phim chất lượng thấp.</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>
', 2, 99, 0, 10, 0, CAST(N'2014-03-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (12, N'HTC Desire U', N'/Content/Images/HTC/HTC Desire U.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/HTC/Hinh360-HTC/HTC-One-hinh360-1.jpg', N'" /> </a>', CAST(3290000 AS Decimal(18, 0)), CAST(3500000 AS Decimal(18, 0)), N'<p>M&agrave;n h&igrave;nh: WVGA, 4.0&quot;, 480 x 800 pixels CPU: Qualcomm MSM7227A, 1 nh&acirc;n, 1 GHz RAM 512 MB Hệ điều h&agrave;nh: Android 4.0.4 (ICS) SIM: 1 Sim Camera: 5.0 MP, Quay phim VGA Bộ nhớ trong: 4 GB Thẻ nhớ ngo&agrave;i đến: 32 GB Dung lượng pin: 1650 mAh</p>
', N'<p><img src="http://cdn.tgdd.vn/Products/Images/42/58002/Kit/HTC-Desire-U-mo-ta-chuc-nang.jpg" /></p>

<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td rowspan="2">
			<p>Th&ocirc;ng tin chung</p>
			</td>
			<td>Hệ điều h&agrave;nh</td>
			<td>Android 4.0.4 (ICS)</td>
		</tr>
		<tr>
			<td>
			<p>Ng&ocirc;n ngữ</p>
			</td>
			<td>Tiếng Việt, Tiếng Anh</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>Loại m&agrave;n h&igrave;nh</td>
			<td>Super LCD</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;u m&agrave;n h&igrave;nh</p>
			</td>
			<td>16 triệu m&agrave;u</td>
		</tr>
		<tr>
			<td>
			<p>Chuẩn m&agrave;n h&igrave;nh</p>
			</td>
			<td>WVGA</td>
		</tr>
		<tr>
			<td>
			<p>Độ ph&acirc;n giải</p>
			</td>
			<td>480 x 800 pixels</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh rộng</p>
			</td>
			<td>4.0&quot;</td>
		</tr>
		<tr>
			<td>
			<p>C&ocirc;ng nghệ cảm ứng</p>
			</td>
			<td>Cảm ứng điện dung đa điểm</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Chụp h&igrave;nh &amp; Quay phim</p>
			</td>
			<td>Camera sau</td>
			<td>5.0 MP</td>
		</tr>
		<tr>
			<td>
			<p>Camera trước</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Đ&egrave;n Flash</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>T&iacute;nh năng camera</p>
			</td>
			<td>Tự động lấy n&eacute;t</td>
		</tr>
		<tr>
			<td>
			<p>Quay phim</p>
			</td>
			<td>Quay phim VGA</td>
		</tr>
		<tr>
			<td>
			<p>Videocall</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="5">
			<p>CPU &amp; RAM</p>
			</td>
			<td>Tốc độ CPU</td>
			<td>1 GHz</td>
		</tr>
		<tr>
			<td>
			<p>Số nh&acirc;n</p>
			</td>
			<td>1 nh&acirc;n</td>
		</tr>
		<tr>
			<td>
			<p>Chipset</p>
			</td>
			<td>Qualcomm MSM7227A</td>
		</tr>
		<tr>
			<td>
			<p>RAM</p>
			</td>
			<td>512 MB</td>
		</tr>
		<tr>
			<td>
			<p>Chip đồ họa (GPU)</p>
			</td>
			<td>Adreno 200</td>
		</tr>
		<tr>
			<td rowspan="4">
			<p>Bộ nhớ &amp; Lưu trữ</p>
			</td>
			<td>Danh bạ</td>
			<td>Kh&ocirc;ng giới hạn</td>
		</tr>
		<tr>
			<td>
			<p>Bộ nhớ trong (ROM)</p>
			</td>
			<td>4 GB</td>
		</tr>
		<tr>
			<td>
			<p>Thẻ nhớ ngo&agrave;i</p>
			</td>
			<td>MicroSD (T-Flash)</td>
		</tr>
		<tr>
			<td>
			<p>Hỗ trợ thẻ tối đa</p>
			</td>
			<td>32 GB</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Thiết kế &amp; Trọng lượng</p>
			</td>
			<td>Kiểu d&aacute;ng</td>
			<td>Thanh + Cảm ứng</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước</p>
			</td>
			<td>118.5 x 62.3 x 9.3 mm</td>
		</tr>
		<tr>
			<td>
			<p>Trọng lượng (g)</p>
			</td>
			<td>204</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Th&ocirc;ng tin pin</p>
			</td>
			<td>Loại pin</td>
			<td>Pin chuẩn Li-Ion</td>
		</tr>
		<tr>
			<td>
			<p>Dung lượng pin</p>
			</td>
			<td>1650 mAh</td>
		</tr>
		<tr>
			<td>
			<p>Pin c&oacute; thể th&aacute;o rời</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td rowspan="13">
			<p>Kết nối &amp; Cổng giao tiếp</p>
			</td>
			<td>3G</td>
			<td>HSDPA, 7.2 Mbps; HSUPA, 5.76 Mbps</td>
		</tr>
		<tr>
			<td>
			<p>4G</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Loại Sim</p>
			</td>
			<td>SIM b&igrave;nh thường</td>
		</tr>
		<tr>
			<td>
			<p>Khe gắn Sim</p>
			</td>
			<td>1 Sim</td>
		</tr>
		<tr>
			<td>
			<p>Wifi</p>
			</td>
			<td>Wi-Fi 802.11 b/g/n, Wi-Fi hotspot</td>
		</tr>
		<tr>
			<td>
			<p>GPS</p>
			</td>
			<td>A-GPS</td>
		</tr>
		<tr>
			<td>
			<p>Bluetooth</p>
			</td>
			<td>C&oacute;, V3.0 với A2DP</td>
		</tr>
		<tr>
			<td>
			<p>GPRS/EDGE</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Jack tai nghe</p>
			</td>
			<td>3.5 mm</td>
		</tr>
		<tr>
			<td>
			<p>NFC</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối USB</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối kh&aacute;c</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Cổng sạc</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Giải tr&iacute; &amp; Ứng dụng</p>
			</td>
			<td>Xem phim</td>
			<td>MP4, WMV, H.263, H.264(MPEG4-AVC)</td>
		</tr>
		<tr>
			<td>
			<p>Nghe nhạc</p>
			</td>
			<td>MP3, WAV, WMA, eAAC+</td>
		</tr>
		<tr>
			<td>
			<p>Ghi &acirc;m</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Giới hạn cuộc gọi</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>FM radio</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Chức năng kh&aacute;c</p>
			</td>
			<td>Mạng x&atilde; hội ảo<br />
			Gmail, Youtube</td>
		</tr>
	</tbody>
</table>
', N'<h2>HTC DESIRE U - Smartphone phổ th&ocirc;ng m&agrave;n h&igrave;nh 4 inch mới nhất của HTC</h2>

<p><br />
HTC đang ng&agrave;y c&agrave;ng lấn s&acirc;n sang thị trường điện thoại th&ocirc;ng minh gi&aacute; rẻ khi h&atilde;ng li&ecirc;n tục cho ra mắt những mẫu smartphone phổ th&ocirc;ng. <strong>HTC Desire U</strong> l&agrave; m&ocirc;t trong những đại diện mới nhất thuộc ph&acirc;n kh&uacute;c phổ th&ocirc;ng trong năm 2013 của HTC, với m&agrave;n h&igrave;nh 4 inch v&agrave; thiết kế kh&aacute; giống <a href="http://www.thegioididong.com/dtdd/htc-desire-x" target="_blank">Desire X</a>, mẫu smartphone mới n&agrave;y hứa hẹn sẽ thu h&uacute;t được nhiều người d&ugrave;ng tr&ecirc;n thị trường.</p>

<h3><br />
Thiết kế bắt mắt</h3>

<p>Điểm cộng của HTC so với c&aacute;c h&atilde;ng điện thoại kh&aacute;c l&agrave; d&ugrave; ở ph&acirc;n kh&uacute;c smartphone n&agrave;o th&igrave; c&aacute;c sản phẩm của họ vẫn lu&ocirc;n được trau chuốt về mặt thiết kế. <strong>Desire U</strong> cũng kh&ocirc;ng phải l&agrave; một ngoại lệ, chiếc smartphone phổ th&ocirc;ng n&agrave;y d&ugrave; vay mượn kh&aacute; nhiều chi tiết của đ&agrave;n anh <strong>Desire X</strong> nhưng vẫn c&oacute; n&eacute;t ri&ecirc;ng độc đ&aacute;o.</p>

<p><img alt="Thiết kế khá đẹp mắt của Desire U" src="http://cdn.tgdd.vn/Products/Images/42/58002/htc-desire-u_clip_image002.jpg" style="height:249px; width:378px" /><br />
<em>Thiết kế kh&aacute; đẹp mắt của HTC Desire U</em></p>

<p><br />
Phần mặt trước v&agrave; c&aacute;c cạnh của <strong>HTC Desire U</strong> giống Desire X một c&aacute;ch đ&aacute;ng kinh ngạc tuy nhi&ecirc;n phần mặt lưng, cụ thể l&agrave; vị tr&iacute; camera v&agrave; đ&egrave;n flash lại c&oacute; kiểu d&aacute;ng ri&ecirc;ng với những v&ograve;ng tr&ograve;n đồng t&acirc;m m&agrave;u bạc bao quanh.</p>

<p><img alt="Phần mặt lưng Desire U mang nét riêng đặc trưng" src="http://cdn.tgdd.vn/Products/Images/42/58002/htc-desire-u_clip_image004.jpg" style="height:304px; width:186px" /><br />
<em>Phần mặt lưng HTC Desire U mang n&eacute;t ri&ecirc;ng đặc trưng</em></p>

<p><br />
Sở hữu m&agrave;n h&igrave;nh 4 inch v&agrave; trọng lượng kh&aacute; nhẹ, cảm gi&aacute;c khi cầm <strong>Desire U</strong> kh&aacute; tốt, bạn c&oacute; thể dễ d&agrave;ng bỏ m&aacute;y v&agrave;o t&uacute;i m&agrave; kh&ocirc;ng c&oacute; cảm gi&aacute;c vướng v&iacute;u hay cồng kềnh.</p>

<p><img alt="Cảm giác cầm Desire U trên tay rất tốt" src="http://cdn.tgdd.vn/Products/Images/42/58002/htc-desire-u_clip_image006.jpg" style="height:247px; width:356px" /><br />
<em>Cảm gi&aacute;c cầm Desire U tr&ecirc;n tay rất tốt</em></p>

<h3><br />
Cấu h&igrave;nh</h3>

<p>L&agrave; một smartphone thuộc ph&acirc;n kh&uacute;c phổ th&ocirc;ng n&ecirc;n <strong>HTC Desire U</strong> kh&ocirc;ng được trang bị cấu h&igrave;nh khủng như c&aacute;c sản phẩm cao cấp kh&aacute;c của HTC. M&aacute;y chỉ d&ugrave;ng chip xử l&yacute; đơn nh&acirc;n 1 GhHz, Ram 512 MB, hỗ trợ 4G bộ nhớ trong v&agrave; c&oacute; khe cắm thẻ microSD. Mặc d&ugrave; so với hiện nay cấu h&igrave;nh của Desire U l&agrave; kh&aacute; thấp nhưng n&oacute; vẫn đủ khả năng để chạy tốt c&aacute;c chức năng cơ bản của Android như lướt web, check mail hay truy cập Facebook.</p>

<p><img alt="HTC Desire U vẫn đáp ứng nhu cầu của người dùng" src="http://cdn.tgdd.vn/Products/Images/42/58002/htc-desire-u_clip_image008.jpg" style="height:289px; width:453px" /><br />
<em>HTC Desire U vẫn đ&aacute;p ứng nhu cầu của người d&ugrave;ng</em></p>

<h3><br />
M&agrave;n h&igrave;nh 4 inch</h3>

<p>C&aacute;c smartphone phổ th&ocirc;ng hiện nay thường c&oacute; m&agrave;n h&igrave;nh kh&aacute; nhỏ v&agrave; độ ph&acirc;n giải thấp nhưng <strong>Desire U</strong> l&agrave; một ngoại lệ, m&aacute;y được trang bị m&agrave;n h&igrave;nh cảm ứng đa điểm 4 inch tương tự như <a href="http://www.thegioididong.com/dtdd/iphone-5" target="_blank">iPhone 5</a> với viền m&agrave;n h&igrave;nh kh&aacute; mỏng. M&agrave;n h&igrave;nh của m&aacute;y c&oacute; độ ph&acirc;n giải 800 x 480 pixel, h&igrave;nh ảnh hiển thị kh&aacute; sắc n&eacute;t v&agrave; kh&ocirc;ng bị hiện tượng bể h&igrave;nh, m&agrave;u sắc trung thực.</p>

<p><img alt="Màn hình 4 inch của HTC Desire U cho chất lượng hình ảnh khá tốt" src="http://cdn.tgdd.vn/Products/Images/42/58002/htc-desire-u_clip_image010.jpg" style="height:279px; width:550px" /><br />
<em>M&agrave;n h&igrave;nh 4 inch của HTC Desire U cho chất lượng h&igrave;nh ảnh kh&aacute; tốt</em></p>

<h3><br />
Trang bị &acirc;m thanh Beats</h3>

<p>Một t&iacute;nh năng cao cấp chỉ xuất hiện tr&ecirc;n c&aacute;c smartphone tầm trung v&agrave; cao cấp của HTC l&agrave; hệ thống &acirc;m thanh Beats đ&atilde; xuất hiện tr&ecirc;n <strong>HTC Desire U</strong>. C&ocirc;ng nghệ &acirc;m thanh Beats gi&uacute;p cho khả năng chơi nhạc của Desire U được n&acirc;ng l&ecirc;n tầm cao mới với chất lượng &acirc;m sống động v&agrave; trung thực.</p>

<p><img alt="HTC Desire U được trang bị công nghệ âm thanh Beat cao cấp " src="http://cdn.tgdd.vn/Products/Images/42/58002/htc-desire-u_clip_image012.jpg" style="height:225px; width:335px" /><br />
<em>HTC Desire U được trang bị c&ocirc;ng nghệ &acirc;m thanh Beats cao cấp</em><strong> </strong></p>

<h3><br />
C&aacute;c t&iacute;nh năng đa phương tiện</h3>

<p><strong>Desire U</strong> được trang bị camera 5 megapixel với đ&egrave;n flash trợ s&aacute;ng được bố tr&iacute; kh&aacute; đẹp mắt ph&iacute;a sau m&aacute;y. B&ecirc;n cạnh đ&oacute; smartphone n&agrave;y cũng hỗ trợ kết nối 3G, mạng kh&ocirc;ng d&acirc;y Wi-Fi b/g/n v&agrave; Bluetooth chuẩn 3.0. C&aacute;c t&iacute;nh năng của m&aacute;y đều hoạt động ổn định tr&ecirc;n hệ điều h&agrave;nh Android 4.0 ICS.</p>

<p><img alt="Desire U có đủ các tính năng cơ bản của điện thoại Android" src="http://cdn.tgdd.vn/Products/Images/42/58002/htc-desire-u_clip_image014.jpg" style="height:274px; width:491px" /><br />
<em>HTC Desire U c&oacute; đủ c&aacute;c t&iacute;nh năng cơ bản của điện thoại Android</em></p>

<p><strong>Ng&ocirc; Quốc Bảo</strong></p>

<table>
	<tbody>
		<tr>
			<td>
			<h3>Ưu điểm</h3>

			<ul>
				<li>M&agrave;n h&igrave;nh 4 inch sắc n&eacute;t, trung thực.</li>
				<li>Thiết kế đẹp mắt, cầm chắc tay, thoải m&aacute;i.</li>
				<li>C&ocirc;ng nghệ &acirc;m thanh Beats cho chất &acirc;m tốt, mạnh.</li>
				<li>HĐH Android 4.0 mượt m&agrave;, ổn định.</li>
			</ul>
			</td>
			<td>
			<h3>Nhược điểm</h3>

			<ul>
				<li>Cấu h&igrave;nh hơi thấp.</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>
', 2, 99, 0, 5, 0, CAST(N'2017-12-20 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (13, N'Nokia Lumia 720', N'/Content/Images/Nokia/Nokia Lumia 720.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/Nokia/Hinh360-Nokia/Nokia-Lumia-720-hinh360-1.jpg', N'" /> </a>', CAST(3690000 AS Decimal(18, 0)), CAST(4900000 AS Decimal(18, 0)), N'<p>M&agrave;n h&igrave;nh: WVGA, 4.3&quot;, 480 x 800 pixels CPU: Qualcomm MSM8227, 2 nh&acirc;n, 1 GHz RAM: 512 MB OS Windows Phone 8 Camera ch&iacute;nh: 6.7 MP, Quay phim HD 720p@30fps Camera phụ: 1.3 MP Bộ nhớ trong: 8 GB Thẻ nhớ tối đa: 64 GB Pin: 2000 mAh</p>
', N'<p><img src="http://cdn.tgdd.vn/Products/Images/42/58121/Kit/Nokia-Lumia-720-mo-ta-chuc-nang.jpg" /></p>

<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td rowspan="2">
			<p>Th&ocirc;ng tin chung</p>
			</td>
			<td>Hệ điều h&agrave;nh</td>
			<td>Windows Phone 8</td>
		</tr>
		<tr>
			<td>
			<p>Ng&ocirc;n ngữ</p>
			</td>
			<td>Tiếng Việt, Tiếng Anh</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>Loại m&agrave;n h&igrave;nh</td>
			<td>IPS LCD</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;u m&agrave;n h&igrave;nh</p>
			</td>
			<td>16 triệu m&agrave;u</td>
		</tr>
		<tr>
			<td>
			<p>Chuẩn m&agrave;n h&igrave;nh</p>
			</td>
			<td>WVGA</td>
		</tr>
		<tr>
			<td>
			<p>Độ ph&acirc;n giải</p>
			</td>
			<td>480 x 800 pixels</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh rộng</p>
			</td>
			<td>4.3&quot;</td>
		</tr>
		<tr>
			<td>
			<p>C&ocirc;ng nghệ cảm ứng</p>
			</td>
			<td>Cảm ứng điện dung đa điểm</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Chụp h&igrave;nh &amp; Quay phim</p>
			</td>
			<td>Camera sau</td>
			<td>6.7 MP</td>
		</tr>
		<tr>
			<td>
			<p>Camera trước</p>
			</td>
			<td>1.3 MP</td>
		</tr>
		<tr>
			<td>
			<p>Đ&egrave;n Flash</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>T&iacute;nh năng camera</p>
			</td>
			<td>Tự động lấy n&eacute;t</td>
		</tr>
		<tr>
			<td>
			<p>Quay phim</p>
			</td>
			<td>Quay phim HD 720p@30fps</td>
		</tr>
		<tr>
			<td>
			<p>Videocall</p>
			</td>
			<td>Hỗ trợ VideoCall qua Skype</td>
		</tr>
		<tr>
			<td rowspan="5">
			<p>CPU &amp; RAM</p>
			</td>
			<td>Tốc độ CPU</td>
			<td>1 GHz</td>
		</tr>
		<tr>
			<td>
			<p>Số nh&acirc;n</p>
			</td>
			<td>2 nh&acirc;n</td>
		</tr>
		<tr>
			<td>
			<p>Chipset</p>
			</td>
			<td>Qualcomm MSM8227</td>
		</tr>
		<tr>
			<td>
			<p>RAM</p>
			</td>
			<td>512 MB</td>
		</tr>
		<tr>
			<td>
			<p>Chip đồ họa (GPU)</p>
			</td>
			<td>Adreno 305</td>
		</tr>
		<tr>
			<td rowspan="4">
			<p>Bộ nhớ &amp; Lưu trữ</p>
			</td>
			<td>Danh bạ</td>
			<td>Kh&ocirc;ng giới hạn</td>
		</tr>
		<tr>
			<td>
			<p>Bộ nhớ trong (ROM)</p>
			</td>
			<td>8 GB</td>
		</tr>
		<tr>
			<td>
			<p>Thẻ nhớ ngo&agrave;i</p>
			</td>
			<td>MicroSD (T-Flash)</td>
		</tr>
		<tr>
			<td>
			<p>Hỗ trợ thẻ tối đa</p>
			</td>
			<td>64 GB</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Thiết kế &amp; Trọng lượng</p>
			</td>
			<td>Kiểu d&aacute;ng</td>
			<td>Thanh + Cảm ứng</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước</p>
			</td>
			<td>127.9 x 67.5 x 9 mm</td>
		</tr>
		<tr>
			<td>
			<p>Trọng lượng (g)</p>
			</td>
			<td>128</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Th&ocirc;ng tin pin</p>
			</td>
			<td>Loại pin</td>
			<td>Pin Nokia BP-4GWA</td>
		</tr>
		<tr>
			<td>
			<p>Dung lượng pin</p>
			</td>
			<td>2000 mAh</td>
		</tr>
		<tr>
			<td>
			<p>Pin c&oacute; thể th&aacute;o rời</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="13">
			<p>Kết nối &amp; Cổng giao tiếp</p>
			</td>
			<td>3G</td>
			<td>HSDPA, 21 Mbps; HSUPA, 5.76 Mbps</td>
		</tr>
		<tr>
			<td>
			<p>4G</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Loại Sim</p>
			</td>
			<td>Micro SIM</td>
		</tr>
		<tr>
			<td>
			<p>Khe gắn Sim</p>
			</td>
			<td>1 Sim</td>
		</tr>
		<tr>
			<td>
			<p>Wifi</p>
			</td>
			<td>Wi-Fi 802.11 a/b/g/n, dual-band</td>
		</tr>
		<tr>
			<td>
			<p>GPS</p>
			</td>
			<td>A-GPS</td>
		</tr>
		<tr>
			<td>
			<p>Bluetooth</p>
			</td>
			<td>C&oacute;, V3.0 với A2DP</td>
		</tr>
		<tr>
			<td>
			<p>GPRS/EDGE</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Jack tai nghe</p>
			</td>
			<td>3.5 mm</td>
		</tr>
		<tr>
			<td>
			<p>NFC</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối USB</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối kh&aacute;c</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Cổng sạc</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Giải tr&iacute; &amp; Ứng dụng</p>
			</td>
			<td>Xem phim</td>
			<td>3GP, WMV, H.263, H.264(MPEG4-AVC)</td>
		</tr>
		<tr>
			<td>
			<p>Nghe nhạc</p>
			</td>
			<td>MP3, WAV, WMA, eAAC+</td>
		</tr>
		<tr>
			<td>
			<p>Ghi &acirc;m</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Giới hạn cuộc gọi</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>FM radio</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Chức năng kh&aacute;c</p>
			</td>
			<td>Mạng x&atilde; hội ảo<br />
			7GB lưu trữ SkyDrive<br />
			Youtube, Gmail<br />
			Micro chuy&ecirc;n dụng chống ồn</td>
		</tr>
	</tbody>
</table>
', N'<h2>Nokia Lumia 720 &ndash; Thiết kế đẹp, chạy Windows Phone 8 với gi&aacute; phải chăng</h2>

<p><br />
<strong>Lumia 720 </strong>sẽ hấp dẫn hơn cho kh&aacute;ch h&agrave;ng khi c&oacute; cấu vừa phải, cải tiến trong thiết kế, chạy Windows Phone 8 v&agrave; đặc biệt l&agrave; gi&aacute; cả rất phải chăng của d&ograve;ng <a href="http://www.thegioididong.com/nokia-lumia" target="_blank">Lumia</a>.</p>

<p>&nbsp;</p>

<h3><br />
Thiết kế th&acirc;n thiện</h3>

<p><br />
<strong><img alt="Lumia 720 có thiết kế thân thiện" src="http://cdn.tgdd.vn/Products/Images/42/58121/nokia-lumia-720_clip_image001.jpg" style="height:367px; width:550px" /></strong><br />
<em>Lumia 720 c&oacute; thiết kế th&acirc;n thiện</em></p>

<p><br />
Nokia đ&atilde; thay đổi hợp l&yacute; c&aacute;c đường cong xung quanh viền m&agrave; trước đ&acirc;y ch&uacute;ng ta đ&atilde; từng thấy tr&ecirc;n <a href="http://www.thegioididong.com/dtdd/nokia-lumia-820" target="_blank">Lumia 820</a>. <strong>Nokia Lumia 720</strong> c&oacute; c&aacute;c viền cong trơn tru, kh&ocirc;ng nở ra như người tiền nhiệm 820. Nokia gọi đ&oacute; l&agrave; thiết kế &ldquo;human&rdquo; (con người), n&oacute; gi&uacute;p người d&ugrave;ng c&oacute; cảm gi&aacute;c dễ chịu khi cầm tr&ecirc;n tay.</p>

<p><br />
<img alt="Lumia 720 vói các cạnh viền cong ra mặt sau" src="http://cdn.tgdd.vn/Products/Images/42/58121/nokia-lumia-720_clip_image002.jpg" style="height:367px; width:550px" /><br />
<em>Lumia 720 với c&aacute;c cạnh viền cong ra mặt sau</em></p>

<p><br />
Nokia cũng cho biết đ&acirc;y l&agrave; lần đầu ti&ecirc;n h&atilde;ng tung ra một chiếc điện thoại thiết kế kiểu unibody (pin liền, nguy&ecirc;n khối) m&agrave; cung cấp khe cắm thẻ nhớ microSD. Bạn sẽ thấy một khe cắm thẻ nhớ ở b&ecirc;n cạnh phải, nơi m&agrave; Lumia 820 cũng đ&atilde; đặt khe cắm mở rộng.</p>

<p><br />
Mặc d&ugrave; kh&ocirc;ng phải l&agrave; một cải tiến đ&aacute;ng kể so với <strong>Lumia 820</strong> nhưng thiết kế unibody gi&uacute;p <strong>Lumia 720</strong> vững chắc hơn.</p>

<p>&nbsp;</p>

<h3><br />
M&agrave;n h&igrave;nh đẹp</h3>

<p><br />
<strong><img alt="Lumia 720 có màn hình sắc nét" src="http://cdn.tgdd.vn/Products/Images/42/58121/nokia-lumia-720_clip_image003.jpg" style="height:367px; width:550px" /></strong><br />
<em>Lumia 720 c&oacute; m&agrave;n h&igrave;nh sắc n&eacute;t</em></p>

<p>Cũng giống như c&aacute;c phi&ecirc;n bản thuộc d&ograve;ng Lumia, Nokia trang bị cho m&aacute;y một m&agrave;n h&igrave;nh c&ocirc;ng nghệ ClearBlack, kh&aacute; ấn tượng v&agrave; sắc n&eacute;t.</p>

<p><br />
<strong>Nokia Lumia 720</strong> được trang bị m&agrave;n h&igrave;nh OLED cảm ứng đa điểm, rộng 4.3 inch, độ ph&acirc;n giải 480 x 800 pixels, tương tự như m&agrave;n h&igrave;nh trong Lumia 820. C&aacute;c cạnh của mặt k&iacute;nh uốn cong nhẹ, điều n&agrave;y gi&uacute;p m&aacute;y dễ d&agrave;ng cầm tr&ecirc;n tay.</p>

<p><br />
<img alt="Lumia 720 hiển thị sắc nét mặc dù độ phân giải khá thấp" src="http://cdn.tgdd.vn/Products/Images/42/58121/nokia-lumia-720_clip_image004.jpg" style="height:367px; width:550px" /><br />
<em>Lumia 720 hiển thị sắc n&eacute;t mặc d&ugrave; độ ph&acirc;n giải kh&aacute; thấp</em></p>

<p>&nbsp;</p>

<h3><br />
Hệ điều h&agrave;nh Windows Phone 8</h3>

<p>M&aacute;y chạy tr&ecirc;n hệ điều h&agrave;nh mới nhất Windows Phone 8, được trang bị tr&ecirc;n những d&ograve;ng điện thoại cao cấp như <a href="http://www.thegioididong.com/dtdd/nokia-lumia-920" target="_blank">Lumia 920</a> v&agrave; <strong>820</strong>. Một số t&iacute;nh năng được cập nhật v&agrave; tốt nhất như Nokia Maps, cho ph&eacute;p bạn tải về v&agrave; sử dụng offline, hay như t&iacute;nh năng dẫn đường sử dụng c&ocirc;ng nghệ GPS Nokia Drive.</p>

<p><br />
<img alt="Lumia 720 được cài đặt hệ điều hành Windows Phone 8 với nhiều cải tiến mới" src="http://cdn.tgdd.vn/Products/Images/42/58121/nokia-lumia-720_clip_image005.jpg" style="height:367px; width:550px" /><br />
<em>Lumia 720 được c&agrave;i đặt hệ điều h&agrave;nh Windows Phone 8 với nhiều cải tiến mới</em></p>

<p><br />
Windows Phone 8 cũng t&iacute;ch hợp với c&aacute;c phương tiện giao th&ocirc;ng c&ocirc;ng cộng, t&iacute;nh năng mang t&ecirc;n HERE sẽ gi&uacute;p ch&uacute;ng ta định vị nơi đang đứng cũng như kh&ocirc;ng gian khung cảnh 3D...</p>

<p>&nbsp;</p>

<h3><br />
M&aacute;y ảnh kh&aacute; ấn tượng</h3>

<p><br />
<strong><img alt="Máy ảnh của Lumia 720 có góc chụp khá rộng, hỗ trợ đèn flash" src="http://cdn.tgdd.vn/Products/Images/42/58121/nokia-lumia-720_clip_image010.jpg" style="height:342px; width:600px" /></strong><br />
<em>M&aacute;y ảnh của Lumia 720 c&oacute; g&oacute;c chụp kh&aacute; rộng, hỗ trợ đ&egrave;n flash</em></p>

<p><br />
Mặc d&ugrave; chỉ sở hữu cảm biến 6.7 MP nhưng m&aacute;y ảnh của<strong> Nokia Lumia 720</strong> l&agrave; kh&aacute; ấn tượng với ống k&iacute;nh f/1.9. Một ống k&iacute;nh như thế gi&uacute;p Lumia 720 chụp tốc độ nhanh, trong điều kiện &aacute;nh s&aacute;ng thấp m&aacute;y vẫn c&oacute; khả năng cho h&igrave;nh ảnh đẹp. Nokia cũng đ&atilde; tăng g&oacute;c m&aacute;y ảnh nhằm c&oacute; thể chụp được những bức ảnh c&oacute; g&oacute;c nh&igrave;n rộng hơn.</p>

<p>&nbsp;</p>

<h3><br />
Sạc pin kh&ocirc;ng d&acirc;y</h3>

<p><br />
<strong><img alt="Lumia 720 cho phép sạc pin không dây" src="http://cdn.tgdd.vn/Products/Images/42/58121/nokia-lumia-720_clip_image007.jpg" style="height:367px; width:550px" /></strong><br />
<em>Lumia 720 cho ph&eacute;p sạc pin kh&ocirc;ng d&acirc;y</em></p>

<p><br />
<strong>Lumia 720</strong> sử dụng pin c&oacute; dung lượng như trong <strong>Lumia 920</strong> (2.000mAh), pin kh&ocirc;ng thể th&aacute;o rời. Lumia 720 cũng được Nokia trang bị c&ocirc;ng nghệ sạc pin kh&ocirc;ng d&acirc;y độc quyền, bạn chỉ cần &ldquo;n&eacute;m&rdquo; điện thoại l&ecirc;n tấm sạc th&igrave; pin của m&aacute;y sẽ bắt đầu được sạc.</p>

<p><br />
<strong><img alt="Jack cắm tai nghe 3.5mm nẳm phía trên của Lumia 720" src="http://cdn.tgdd.vn/Products/Images/42/58121/nokia-lumia-720_clip_image008.jpg" style="height:367px; width:550px" /></strong><br />
<em>Jack cắm tai nghe 3.5mm nằm ph&iacute;a tr&ecirc;n của Lumia 720</em></p>

<p><strong>Hữu T&igrave;nh</strong></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<table>
	<tbody>
		<tr>
			<td>
			<h3>Ưu điểm</h3>

			<ul>
				<li>Thiết kế nguy&ecirc;n khối, gọn nhẹ, b&oacute;ng bẩy.</li>
				<li>M&agrave;n h&igrave;nh cảm ứng nhanh, nhạy, sắc n&eacute;t.</li>
				<li>Thỏa sức s&aacute;ng tạo với camera HD ở mặt trước.</li>
				<li>Th&ocirc;ng tin cập nhật li&ecirc;n tục tr&ecirc;n m&agrave;n h&igrave;nh ch&iacute;nh với Live Tiles.</li>
				<li>Chụp h&igrave;nh cực đẹp ngay cả khi thiếu s&aacute;ng.</li>
			</ul>
			</td>
			<td>
			<h3>Nhược điểm</h3>

			<ul>
				<li>Khung vỏ nhựa.</li>
				<li>Ram chỉ 512MB.</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<p>&nbsp;</p>
', 3, 99, 3, 5, 0, CAST(N'2017-12-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (14, N'Nokia Lumia 925', N'/Content/Images/Nokia/Nokia Lumia 925.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/Nokia/Hinh360-Nokia/Nokia-Lumia-720-hinh360-1.jpg', N'" /> </a>', CAST(4990000 AS Decimal(18, 0)), CAST(5200000 AS Decimal(18, 0)), N'<p>M&agrave;n h&igrave;nh: HD, 4.5&quot;, 768 x 1280 pixels CPU: Qualcomm MSM8960, 2 nh&acirc;n, 1.5 GHz RAM 1 GB Hệ điều h&agrave;nh: Windows Phone 8 Camera ch&iacute;nh: 8.7 MP, Quay phim FullHD 1080p@30fps Camera phụ: 1.3 MP Bộ nhớ trong: 16 GB Thẻ nhớ ngo&agrave;i đến: Kh&ocirc;ng Dung lượng pin: 2000 mAh</p>
', N'<p><img src="http://cdn.tgdd.vn/Products/Images/42/59532/Kit/nokia-lumia-925-mo-ta-chuc-nang-2.jpg" /></p>

<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td rowspan="2">
			<p>Th&ocirc;ng tin chung</p>
			</td>
			<td>Hệ điều h&agrave;nh</td>
			<td>Windows Phone 8</td>
		</tr>
		<tr>
			<td>
			<p>Ng&ocirc;n ngữ</p>
			</td>
			<td>Tiếng Việt, Tiếng Anh</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>Loại m&agrave;n h&igrave;nh</td>
			<td>AMOLED</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;u m&agrave;n h&igrave;nh</p>
			</td>
			<td>16 triệu m&agrave;u</td>
		</tr>
		<tr>
			<td>
			<p>Chuẩn m&agrave;n h&igrave;nh</p>
			</td>
			<td>HD</td>
		</tr>
		<tr>
			<td>
			<p>Độ ph&acirc;n giải</p>
			</td>
			<td>768 x 1280 pixels</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh rộng</p>
			</td>
			<td>4.5&quot;</td>
		</tr>
		<tr>
			<td>
			<p>C&ocirc;ng nghệ cảm ứng</p>
			</td>
			<td>Cảm ứng điện dung đa điểm</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Chụp h&igrave;nh &amp; Quay phim</p>
			</td>
			<td>Camera sau</td>
			<td>8.7 MP</td>
		</tr>
		<tr>
			<td>
			<p>Camera trước</p>
			</td>
			<td>1.3 MP</td>
		</tr>
		<tr>
			<td>
			<p>Đ&egrave;n Flash</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>T&iacute;nh năng camera</p>
			</td>
			<td>Tự động lấy n&eacute;t<br />
			Chống rung</td>
		</tr>
		<tr>
			<td>
			<p>Quay phim</p>
			</td>
			<td>Quay phim FullHD 1080p@30fps</td>
		</tr>
		<tr>
			<td>
			<p>Videocall</p>
			</td>
			<td>Hỗ trợ VideoCall qua Skype</td>
		</tr>
		<tr>
			<td rowspan="5">
			<p>CPU &amp; RAM</p>
			</td>
			<td>Tốc độ CPU</td>
			<td>1.5 GHz</td>
		</tr>
		<tr>
			<td>
			<p>Số nh&acirc;n</p>
			</td>
			<td>2 nh&acirc;n</td>
		</tr>
		<tr>
			<td>
			<p>Chipset</p>
			</td>
			<td>Qualcomm MSM8960</td>
		</tr>
		<tr>
			<td>
			<p>RAM</p>
			</td>
			<td>1 GB</td>
		</tr>
		<tr>
			<td>
			<p>Chip đồ họa (GPU)</p>
			</td>
			<td>Adreno 225</td>
		</tr>
		<tr>
			<td rowspan="4">
			<p>Bộ nhớ &amp; Lưu trữ</p>
			</td>
			<td>Danh bạ</td>
			<td>Kh&ocirc;ng giới hạn</td>
		</tr>
		<tr>
			<td>
			<p>Bộ nhớ trong (ROM)</p>
			</td>
			<td>16 GB</td>
		</tr>
		<tr>
			<td>
			<p>Thẻ nhớ ngo&agrave;i</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Hỗ trợ thẻ tối đa</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Thiết kế &amp; Trọng lượng</p>
			</td>
			<td>Kiểu d&aacute;ng</td>
			<td>Thanh + Cảm ứng</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước</p>
			</td>
			<td>129 x 70.6 x 8.5 mm</td>
		</tr>
		<tr>
			<td>
			<p>Trọng lượng (g)</p>
			</td>
			<td>139</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Th&ocirc;ng tin pin</p>
			</td>
			<td>Loại pin</td>
			<td>Pin Nokia BL-4YW</td>
		</tr>
		<tr>
			<td>
			<p>Dung lượng pin</p>
			</td>
			<td>2000 mAh</td>
		</tr>
		<tr>
			<td>
			<p>Pin c&oacute; thể th&aacute;o rời</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="13">
			<p>Kết nối &amp; Cổng giao tiếp</p>
			</td>
			<td>3G</td>
			<td>HSDPA, 42 Mbps; HSUPA, 5.76 Mbps</td>
		</tr>
		<tr>
			<td>
			<p>4G</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Loại Sim</p>
			</td>
			<td>Micro SIM</td>
		</tr>
		<tr>
			<td>
			<p>Khe gắn Sim</p>
			</td>
			<td>1 Sim</td>
		</tr>
		<tr>
			<td>
			<p>Wifi</p>
			</td>
			<td>Wi-Fi 802.11 a/b/g/n, dual-band, DLNA, Wi-Fi hotspot</td>
		</tr>
		<tr>
			<td>
			<p>GPS</p>
			</td>
			<td>A-GPS v&agrave; GLONASS</td>
		</tr>
		<tr>
			<td>
			<p>Bluetooth</p>
			</td>
			<td>C&oacute;, V3.0 với A2DP</td>
		</tr>
		<tr>
			<td>
			<p>GPRS/EDGE</p>
			</td>
			<td>Class B</td>
		</tr>
		<tr>
			<td>
			<p>Jack tai nghe</p>
			</td>
			<td>3.5 mm</td>
		</tr>
		<tr>
			<td>
			<p>NFC</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối USB</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối kh&aacute;c</p>
			</td>
			<td>NFC</td>
		</tr>
		<tr>
			<td>
			<p>Cổng sạc</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Giải tr&iacute; &amp; Ứng dụng</p>
			</td>
			<td>Xem phim</td>
			<td>MP4, WMV, H.263, H.264(MPEG4-AVC)</td>
		</tr>
		<tr>
			<td>
			<p>Nghe nhạc</p>
			</td>
			<td>MP3, WAV, WMA, eAAC+</td>
		</tr>
		<tr>
			<td>
			<p>Ghi &acirc;m</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Giới hạn cuộc gọi</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>FM radio</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Chức năng kh&aacute;c</p>
			</td>
			<td>Mạng x&atilde; hội ảo<br />
			Gmail, YouTube, Calendar<br />
			Micro chuy&ecirc;n dụng chống ồn</td>
		</tr>
	</tbody>
</table>
', N'<h2>Nokia Lumia 925 &ndash; M&aacute;y ảnh cao cấp, thiết kế tinh tế, sang trọng với khung nh&ocirc;m chắc chắn</h2>

<p><br />
<strong>Nokia Lumia 925 </strong>đ&atilde; l&agrave;m nức l&ograve;ng c&aacute;c t&iacute;n đồ c&ocirc;ng nghệ đặc biệt l&agrave; những t&iacute;n đồ Windows Phone với c&oacute; thiết kế nh&ocirc;m đẹp mắt, m&aacute;y ảnh r&otilde; n&eacute;t hơn c&ugrave;ng hệ điều h&agrave;nh v&ocirc; c&ugrave;ng mượt m&agrave;.</p>

<p>&nbsp;</p>

<h3><br />
Thiết kế đẹp v&agrave; chắc chắn</h3>

<p>D&ograve;ng <a href="http://www.thegioididong.com/dtdd/nokia-lumia-920" target="_blank">Lumia 920</a> đ&atilde; được nhiều người đ&aacute;nh gi&aacute; l&agrave; c&oacute; thiết kế tuyệt vời, bắt mắt tuy nhi&ecirc;n d&ograve;ng 925 lại c&agrave;ng đẹp hơn nhờ bộ khung viền bằng nh&ocirc;m trơn b&oacute;ng v&agrave; cao cấp.</p>

<p><img alt="Nokia Lumia 925 thiết kế đẹp và chắc chắn" src="http://cdn.tgdd.vn/Products/Images/42/59532/nokia-lumia-925_clip_image033.jpg" style="height:400px; width:600px" /><br />
<em>Thiết kế đẹp v&agrave; chắc chắn của Lumia 925</em></p>

<p><br />
Khung viền của <strong>Lumia 925</strong> được thiết kế hơi cong, l&agrave;m bằng kim loại kh&aacute; d&agrave;y, cho cảm gi&aacute;c chắc tay. Đ&acirc;y l&agrave; thiết kế m&agrave; người d&ugrave;ng đ&atilde; mong đợi từ l&acirc;u, tuy nhi&ecirc;n nếu mặt sau l&agrave;m bằng kim loại nữa th&igrave; sẽ tuyệt vời hơn. Mặc d&ugrave; mặt sau được l&agrave;m bằng chất liệu polycarbonate nhưng nhờ sự kết hợp m&agrave;u sắc hợp l&yacute; n&ecirc;n Lumia 925 vẫn cho cảm gi&aacute;c hết sức sang trọng v&agrave; lịch l&atilde;m.</p>

<p><img alt="Lumia 925 khung viền nhôm" src="http://cdn.tgdd.vn/Products/Images/42/59532/nokia-lumia-925_clip_image004.jpg" style="height:407px; width:610px" /><br />
<em>Khung viền nh&ocirc;m của Lumia 925</em></p>

<p><br />
Thiết kế của d&ograve;ng <a href="http://www.thegioididong.com/nokia-lumia" target="_blank">Lumia</a> c&oacute; một sự &ldquo;c&aacute;ch điệu&rdquo; so với người tiền nhiệm đ&oacute; l&agrave; m&aacute;y ảnh to hơn v&agrave; c&oacute; phần lồi ra, một ch&uacute;t cổ k&iacute;nh v&agrave; lạ mắt.</p>

<p><br />
<strong>Nokia Lumia 925</strong> mỏng v&agrave; nhẹ hơn nhiều so với <a href="http://www.thegioididong.com/dtdd/nokia-lumia-920" target="_blank">Lumia 920</a>, n&oacute; chỉ mỏng 8.5 mm v&agrave; nặng 139g (920 nặng 185g v&agrave; d&agrave;y 10.7 mm). Nhờ vậy m&agrave; người d&ugrave;ng sẽ thoải m&aacute;i sử dụng m&agrave; kh&ocirc;ng bị mỏi tay v&agrave; cũng&nbsp; gi&uacute;p m&aacute;y dễ d&agrave;ng &ldquo;đ&uacute;t t&uacute;i quần&rdquo; hơn.</p>

<p>&nbsp;</p>

<h3><br />
M&aacute;y ảnh cao cấp</h3>

<p>D&ograve;ng Lumia 920 đ&atilde; được biết đến với t&iacute;nh năng m&aacute;y ảnh v&ocirc; c&ugrave;ng sắc n&eacute;t v&agrave; c&oacute; thể chụp những bức ảnh c&oacute; độ s&aacute;ng cao trong điều kiện &aacute;nh s&aacute;ng yếu nhờ c&ocirc;ng nghệ PureView độc quyền của Nokia. <strong>Lumia 925</strong> đ&atilde; kế thừa v&agrave; n&acirc;ng cao hơn nữa ưu điểm đ&oacute;. Đ&acirc;y l&agrave; smartphone đầu ti&ecirc;n c&oacute; camera d&ugrave;ng 6 lớp thấu k&iacute;nh c&ugrave;ng dual-LED flash cho chất lượng ảnh tốt nhất trong mọi điều kiện &aacute;nh s&aacute;ng.</p>

<p><img alt="Nokia Lumia 925 công nghệ PureView" src="http://cdn.tgdd.vn/Products/Images/42/59532/nokia-lumia-925_clip_image032.jpg" style="height:400px; width:600px" /><br />
<em>M&aacute;y ảnh cao cấp của Lumia 925</em><em> được t&iacute;ch hợp c&ocirc;ng nghệ PureView</em></p>

<p><br />
Đặc biệt l&agrave; t&iacute;nh năng Nokia Smart Camera được t&iacute;ch hợp trong <strong>Nokia Lumia 925</strong> cho ph&eacute;p chụp nhiều khung ảnh ri&ecirc;ng biệt, cho ph&eacute;p t&ugrave;y chỉnh từng khung h&igrave;nh ri&ecirc;ng biệt trước khi gh&eacute;p lại. Lumia 925 c&ograve;n c&oacute; t&iacute;nh năng Action Shot&nbsp;cho khả năng gh&eacute;p nhiều ảnh li&ecirc;n tiếp tạo hiệu ứng chuyển động, Blur Motion&nbsp;l&agrave;m mờ cảnh nền v&agrave; l&agrave;m nổi bật đối tượng chuyển động.</p>

<p><img alt="Lumia 925 camera với đèn flash kép" src="http://cdn.tgdd.vn/Products/Images/42/59532/nokia-lumia-925_clip_image006.jpg" style="height:407px; width:610px" /><br />
<em>Lumia 925 cho chất lượng ảnh tuyệt đỉnh c&ugrave;ng với đ&egrave;n flash k&eacute;p</em></p>

<p><br />
Chỉ với m&aacute;y ảnh 8.7MP nhưng những bức ảnh m&agrave; <strong>Nokia Lumia 925</strong> &ldquo;xuất bản&rdquo; sẽ kh&ocirc;ng thua k&eacute;m bất kỳ camera tr&ecirc;n smartphone n&agrave;o hiện nay.</p>

<p>&nbsp;</p>

<h3><br />
Nhiều t&iacute;nh năng cao cấp hỗ trợ người d&ugrave;ng</h3>

<p><strong>Lumia 925</strong> c&ograve;n được trang bị những t&iacute;nh năng như Hipstamatic, Here Map hỗ trợ bản đồ trực tuyến ho&agrave;n hảo, Nokia Music, Music+ c&ugrave;ng một số ứng dụng độc quyền kh&aacute;c m&agrave; Nokia cung cấp cho d&ograve;ng Lumia v&agrave; 145.000 ứng dụng trong kho ứng dụng Windows Phone.</p>

<p><img alt="Lumia 925 Hipstamatic" src="http://cdn.tgdd.vn/Products/Images/42/59532/nokia-lumia-925_clip_image010.jpg" style="height:360px; width:610px" /><br />
<em>T&iacute;nh năng Hipstamatic tr&ecirc;n Lumia 925</em></p>

<p><br />
T&iacute;nh năng&nbsp;Hipstamatic&nbsp;tr&ecirc;n <strong>Nokia Lumia 925</strong> tương tự như một mạng x&atilde; hội h&igrave;nh ảnh thu nhỏ, cho ph&eacute;p bạn thấy mọi hoạt động li&ecirc;n quan đến h&igrave;nh ảnh của bạn b&egrave; theo dạng TimeLine. N&oacute; cũng cung cấp th&ecirc;m nhiều bộ lọc h&igrave;nh ảnh đặc sắc, ngo&agrave;i chụp ngoại cảnh, ch&acirc;n dung, ban đ&ecirc;m bạn c&ograve;n c&oacute; thể chụp cả&hellip; thức ăn. Kh&ocirc;ng những vậy, bạn cũng c&oacute; thể v&agrave;o cửa h&agrave;ng của Hipstamatic để mua th&ecirc;m c&aacute;c hiệu ứng chỉnh sửa h&igrave;nh ảnh&hellip;. ứng dụng n&agrave;y cũng li&ecirc;n kết với 7 mạng x&atilde; hội để đăng tải ảnh chụp.</p>

<p>&nbsp;</p>

<h3><br />
M&agrave;n h&igrave;nh sắc n&eacute;t</h3>

<p><strong>Lumia 925</strong> c&oacute; m&agrave;n h&igrave;nh 4.5 inch theo c&ocirc;ng nghệ m&agrave;n h&igrave;nh OLED, độ ph&acirc;n giải 1280 x 768 pixels, mặc d&ugrave; chưa được l&agrave; full HD nhưng với c&aacute;c t&iacute;nh năng được t&iacute;ch hợp th&igrave; h&igrave;nh ảnh của m&aacute;y vẫn hết sức sống động, sắc n&eacute;t v&agrave; c&oacute; độ tương phản cao.</p>

<p><img alt="Lumia 925 màn hình OLED 4.5''" src="http://cdn.tgdd.vn/Products/Images/42/59532/nokia-lumia-925_clip_image031.jpg" style="height:400px; width:600px" /><br />
<em>M&agrave;n h&igrave;nh OLED 4.5 inch</em></p>

<p><em><img alt="Nokia Lumia 925 ClearBlack" src="http://cdn.tgdd.vn/Products/Images/42/59532/nokia-lumia-925_clip_image030.jpg" style="height:400px; width:600px" /></em><br />
<em>Độ tương phản cao tr&ecirc;n m&agrave;n h&igrave;nh OLED của Lumia 925</em></p>

<p><br />
Nokia cũng trang bị <strong>c&ocirc;ng nghệ ClearBlack</strong> cho m&agrave;n h&igrave;nh khiến n&oacute; trở n&ecirc;n cực k&igrave; s&aacute;ng v&agrave; đậm n&eacute;t, đặc biệt l&agrave; trong điều kiện &aacute;nh s&aacute;ng chiếu trực tiếp v&agrave;o m&agrave;n h&igrave;nh vẫn hết sức r&otilde; r&agrave;ng.</p>

<p><strong>Hữu T&igrave;nh</strong></p>

<table>
	<tbody>
		<tr>
			<td>
			<h3>Ưu điểm</h3>

			<ul>
				<li>Thiết kế đẹp, chắc chắn với khung viền nh&ocirc;m.</li>
				<li>M&agrave;n h&igrave;nh cảm ứng si&ecirc;u nhạy, h&igrave;nh ảnh sắc n&eacute;t với c&ocirc;ng nghệ Clearblack c&ugrave;ng Amoled.</li>
				<li>S&aacute;ng tạo hơn với Smart Cam gi&uacute;p bạn chụp nhiều bức ảnh c&ugrave;ng l&uacute;c để tạo một chuỗi h&agrave;nh động li&ecirc;n tiếp.</li>
				<li>Bạn c&oacute; thể điều chỉnh ti&ecirc;u cự, tốc độ m&agrave;n trập, ISO,... với Pro Cam.</li>
			</ul>
			</td>
			<td>
			<h3>Nhược điểm</h3>

			<ul>
				<li>Kh&ocirc;ng hỗ trợ thẻ nhớ.</li>
				<li>Cấu h&igrave;nh chưa cao.</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>
', 3, 99, 4, 0, 0, CAST(N'2014-03-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (15, N'Nokia Lumia 520', N'/Content/Images/Nokia/Nokia Lumia 520.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/Nokia/Hinh360-Nokia/Nokia-Lumia-720-hinh360-1.jpg', N'" /> </a>', CAST(2990000 AS Decimal(18, 0)), CAST(3400000 AS Decimal(18, 0)), N'Màn hình:	WVGA, 4.0", 480 x 800 pixels
CPU:	Qualcomm MSM8227, 2 nhân, 1 GHz
RAM	512 MB
Hệ điều hành:	Windows Phone 8
SIM:	1 Sim
Camera:	5.0 MP, Quay phim HD 720p@30fps
Bộ nhớ trong:	8 GB
Thẻ nhớ ngoài đến:	64 GB
Dung lượng pin:	1430 mAh', N'<img class="lazy" src="http://cdn.tgdd.vn/Products/Images/42/58119/Kit/Nokia-Lumia-520-mo-ta-chuc-nang.jpg">  <table style="width: 100%;" class="product-compare" border="0" cellpadding="0" cellspacing="0">
    <tbody>
        <tr class="r">
            <td rowspan="2" class="g" valign="top">
            <div class="gh">Thông tin chung</div>
            </td>
            <td id="prop_72" class="p f eph" onclick="ShowHelp(72, 2);">Hệ điều hành</td>
            <td id="c72_1" class="v f">Windows Phone 8</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_75" class="ph eph" onclick="ShowHelp(75, 2);">Ngôn ngữ</div>
            </td>
            <td id="c75_1" class="v">Tiếng Việt, Tiếng Anh</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Màn hình</div>
            </td>
            <td class="p f">Loại màn hình</td>
            <td id="c6459_1" class="v f">IPS LCD</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Màu màn hình</div>
            </td>
            <td id="c6239_1" class="v">16 triệu màu</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_77" class="ph eph" onclick="ShowHelp(77, 2);">Chuẩn màn hình</div>
            </td>
            <td id="c77_1" class="v">WVGA</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_78" class="ph eph" onclick="ShowHelp(78, 2);">Độ phân giải</div>
            </td>
            <td id="c78_1" class="v">480 x 800 pixels</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_79" class="ph eph" onclick="ShowHelp(79, 2);">Màn hình rộng</div>
            </td>
            <td id="c79_1" class="v">4.0"</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_80" class="ph eph" onclick="ShowHelp(80, 2);">Công nghệ cảm ứng</div>
            </td>
            <td id="c80_1" class="v">Cảm ứng điện dung đa điểm</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Chụp hình &amp; Quay phim</div>
            </td>
            <td id="prop_27" class="p f eph" onclick="ShowHelp(27, 2);">Camera sau</td>
            <td id="c27_1" class="v f">5.0 MP</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_29" class="ph eph" onclick="ShowHelp(29, 2);">Camera trước</div>
            </td>
            <td id="c29_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Đèn Flash</div>
            </td>
            <td id="c6460_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_28" class="ph eph" onclick="ShowHelp(28, 2);">Tính năng camera</div>
            </td>
            <td id="c28_1" class="v">Tự động lấy nét</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_31" class="ph eph" onclick="ShowHelp(31, 2);">Quay phim</div>
            </td>
            <td id="c31_1" class="v">Quay phim HD 720p@30fps</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_30" class="ph eph" onclick="ShowHelp(30, 2);">Videocall</div>
            </td>
            <td id="c30_1" class="v">Không</td>
        </tr>
        <tr class="r">
            <td rowspan="5" class="g" valign="top">
            <div class="gh">CPU &amp; RAM</div>
            </td>
            <td id="prop_51" class="p f eph" onclick="ShowHelp(51, 2);">Tốc độ CPU</td>
            <td id="c51_1" class="v f">1 GHz</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Số nhân</div>
            </td>
            <td id="c6461_1" class="v">2 nhân</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6059" class="ph eph" onclick="ShowHelp(6059, 2);">Chipset</div>
            </td>
            <td id="c6059_1" class="v">Qualcomm MSM8227</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">RAM</div>
            </td>
            <td id="c50_1" class="v">512 MB</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6079" class="ph eph" onclick="ShowHelp(6079, 2);">Chip đồ họa (GPU)</div>
            </td>
            <td id="c6079_1" class="v">Adreno 305</td>
        </tr>
        <tr class="r">
            <td rowspan="4" class="g" valign="top">
            <div class="gh">Bộ nhớ &amp; Lưu trữ</div>
            </td>
            <td id="prop_54" class="p f eph" onclick="ShowHelp(54, 2);">Danh bạ</td>
            <td id="c54_1" class="v f">Không giới hạn</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_49" class="ph eph" onclick="ShowHelp(49, 2);">Bộ nhớ trong (ROM)</div>
            </td>
            <td id="c49_1" class="v">8 GB</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_52" class="ph eph" onclick="ShowHelp(52, 2);">Thẻ nhớ ngoài</div>
            </td>
            <td id="c52_1" class="v">MicroSD (T-Flash)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_53" class="ph eph" onclick="ShowHelp(53, 2);">Hỗ trợ thẻ tối đa</div>
            </td>
            <td id="c53_1" class="v">64 GB</td>
        </tr>
        <tr class="r">
            <td rowspan="3" class="g" valign="top">
            <div class="gh">Thiết kế &amp; Trọng lượng</div>
            </td>
            <td id="prop_73" class="p f eph" onclick="ShowHelp(73, 2);">Kiểu dáng</td>
            <td id="c73_1" class="v f">Thanh + Cảm ứng</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_88" class="ph eph" onclick="ShowHelp(88, 2);">Kích thước</div>
            </td>
            <td id="c88_1" class="v">119.9 x 64 x 9.9 mm</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_100" class="ph eph" onclick="ShowHelp(100, 2);">Trọng lượng (g)</div>
            </td>
            <td id="c100_1" class="v">124</td>
        </tr>
        <tr class="r">
            <td rowspan="3" class="g" valign="top">
            <div class="gh">Thông tin pin</div>
            </td>
            <td class="p f">Loại pin</td>
            <td id="c83_1" class="v f">Pin Nokia BL-5J</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_84" class="ph eph" onclick="ShowHelp(84, 2);">Dung lượng pin</div>
            </td>
            <td id="c84_1" class="v">1430 mAh</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Pin có thể tháo rời</div>
            </td>
            <td id="c6462_1" class="v">Có</td>
        </tr>
        <tr class="r">
            <td rowspan="13" class="g" valign="top">
            <div class="gh">Kết nối &amp; Cổng giao tiếp</div>
            </td>
            <td id="prop_65" class="p f eph" onclick="ShowHelp(65, 2);">3G</td>
            <td id="c65_1" class="v f">HSDPA, 21 Mbps; HSUPA, 5.76 Mbps</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">4G</div>
            </td>
            <td id="c6463_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Loại Sim</div>
            </td>
            <td id="c6339_1" class="v">Micro SIM</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_60" class="ph eph" onclick="ShowHelp(60, 2);">Khe gắn Sim</div>
            </td>
            <td id="c60_1" class="v">1 Sim</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_66" class="ph eph" onclick="ShowHelp(66, 2);">Wifi</div>
            </td>
            <td id="c66_1" class="v">Wi-Fi 802.11 b/g/n</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_68" class="ph eph" onclick="ShowHelp(68, 2);">GPS</div>
            </td>
            <td id="c68_1" class="v">A-GPS</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_69" class="ph eph" onclick="ShowHelp(69, 2);">Bluetooth</div>
            </td>
            <td id="c69_1" class="v">Có, V3.0 với A2DP</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_61" class="ph eph" onclick="ShowHelp(61, 2);">GPRS/EDGE</div>
            </td>
            <td id="c61_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_48" class="ph eph" onclick="ShowHelp(48, 2);">Jack tai nghe</div>
            </td>
            <td id="c48_1" class="v">3.5 mm</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">NFC</div>
            </td>
            <td id="c6464_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_71" class="ph eph" onclick="ShowHelp(71, 2);">Kết nối USB</div>
            </td>
            <td id="c71_1" class="v">Micro USB</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Kết nối khác</div>
            </td>
            <td id="c5199_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Cổng sạc</div>
            </td>
            <td id="c85_1" class="v">Micro USB</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Giải trí &amp; Ứng dụng</div>
            </td>
            <td id="prop_32" class="p f eph" onclick="ShowHelp(32, 2);">Xem phim</td>
            <td id="c32_1" class="v f">MP4, WMV, H.263, H.264(MPEG4-AVC)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_33" class="ph eph" onclick="ShowHelp(33, 2);">Nghe nhạc</div>
            </td>
            <td id="c33_1" class="v">MP3, WAV, WMA, eAAC+</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_36" class="ph eph" onclick="ShowHelp(36, 2);">Ghi âm</div>
            </td>
            <td id="c36_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6039" class="ph eph" onclick="ShowHelp(6039, 2);">Giới hạn cuộc gọi</div>
            </td>
            <td id="c6039_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_34" class="ph eph" onclick="ShowHelp(34, 2);">FM radio</div>
            </td>
            <td id="c34_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Chức năng khác</div>
            </td>
            <td id="c43_1" class="v">Mạng xã hội ảo<br>7 GB lưu trữ SkyDrive<br>Youtube, Gmail</td>
        </tr>
    </tbody>
</table>', N'<h2 align="center">Nokia Lumia 520 – Smartphone nokia lumia giá rẻ, thiết kế đẹp chạy Windows Phone 8</h2><p align=""><strong><br>Nokia Lumia 520</strong> là điện thoại thông minh chạy <a href="http://www.thegioididong.com/tin-tuc-dien-dan/nokia-lumia-520--trai-nghiem-windows-phone-8-gia--46135" target="_blank"> <strong>Windows Phone 8</strong> </a>giá&nbsp;rẻ nhất hiện nay mà Nokia dòng <a title="Nokia Lumia" href="http://www.thegioididong.com/nokia-lumia" target="_blank">Lumia</a> tung ra thị trường. Máy có nhiều màu sắc trẻ trung, và có thiết kế khá “dễ thương”.</p>&nbsp;<h3 align=""><strong><br>Thiết kế “quyến rũ”</strong></h3><p align="center"><strong><br><img title="Nokia Lumia 520" src="http://cdn.tgdd.vn/Products/Images/42/58119/nokia-lumia-520_clip_image001.jpg" alt="Nokia Lumia 520" height="477" width="550"></strong><br><em>Nokia Lumia 520</em></p><p align=""><br>Giống như <a href="http://www.thegioididong.com/dtdd/nokia-lumia-620" target="_blank">Lumia 620</a> trước đó, <strong>Lumia 520</strong> có “body quyến rũ”, thân thiện và dễ sử dụng trong lòng bàn tay. Không giống như các điện thoại cao cấp khác của Nokia, máy có pin rời, mặt sau bằng nhựa uốn cong, rất thoải mái khi cầm trong tay.</p><p align="center"><br><img title="Vỏ sau của Nokia Lumia 520 hơi cong" src="http://cdn.tgdd.vn/Products/Images/42/58119/nokia-lumia-520_clip_image003.jpg" alt="Vỏ sau của Nokia Lumia 520 hơi cong" height="372" width="550"><br><em>Vỏ sau của Nokia Lumia 520 hơi cong</em></p><p align=""><strong><br>Nokia Lumia 520</strong> có màn hình ở mức vừa, 4 inch, dễ dàng bỏ túi, có cảm giác là một sản phẩm cao cấp với vật liệu polycarbonate hàng đầu của Nokia.</p>&nbsp;<h3 align=""><br>Màn hình rõ nét</h3><p align="center"><strong><br><img title="Nokia Lumia 520 - Màn hình rõ nét" src="http://cdn.tgdd.vn/Products/Images/42/58119/nokia-lumia-520_clip_image004.jpg" alt="Nokia Lumia 520 - Màn hình rõ nét" height="367" width="550"></strong><br><em>Nokia Lumia 520 - Màn hình rõ nét</em></p><p align=""><br>Nokia đã tự mình nghiên cứu công nghệ màn hình riêng <strong>ClearBlack</strong>, loại màn hình này đã có mặt trên các dòng <a href="http://www.thegioididong.com/tim-kiem?key=LUMIA" target="_blank">điện thoại Lumia</a>. Chiếc <strong>Lumia 520</strong> sử dụng màn hình LCD độ phân giải 480 x 800 pixels, chưa sắc nét như các đàn anh trước (<a href="http://www.thegioididong.com/dtdd/nokia-lumia-820" target="_blank">Lumia 820</a>, <a href="http://www.thegioididong.com/dtdd/nokia-lumia-920" target="_blank">920</a>) nhưng sáng và hiển thị tốt dưới điều kiện ánh sáng cao, đặc biệt là màu đen trắng cùng khả năng tiết kiệm điện năng. Ngoài ra, màn hình của 520 cũng được trang bị công nghệ siêu cảm ứng <strong>Sensitive Touch</strong>, bạn có thể thoải mái đeo găng tay mà vẫn thao tác được trên màn hình.</p><p align="center"><br><img title="Nokia Lumia 520 cho màu sắc trung thực" src="http://cdn.tgdd.vn/Products/Images/42/58119/nokia-lumia-520_clip_image005.jpg" alt="Nokia Lumia 520 cho màu sắc trung thực" height="367" width="550"><br><em>Nokia Lumia 520 cho màu sắc trung thực</em></p>&nbsp;<h3 align=""><br>Windows Phone 8</h3><p align="">Mặc dù là điện thoại thông minh giá rẻ nhưng <strong>Nokia Lumia 520 </strong>vẫn chạy trên hệ điều hành mới nhất Windows Phone 8, hệ điều hành trước đó đã chạy trên các phiên bản cao cấp <a href="http://www.thegioididong.com/dtdd/nokia-lumia-820" target="_blank">Lumia 820</a> hay <a href="http://www.thegioididong.com/dtdd/nokia-lumia-920" target="_blank">920</a>. Cảm ứng mượt mà, giao diện thân thiện, hỗ trợ đồ họa mạnh mẽ hơn. Giao diện tùy chỉnh tốt, đa sắc màu, các biểu tượng động với công nghệ Live Tiles.</p><p align="center"><br><img title="Giao diện của Nokia Lumia 520 thân thiện hơn" src="http://cdn.tgdd.vn/Products/Images/42/58119/nokia-lumia-520_clip_image007.jpg" alt="Giao diện của Nokia Lumia 520 thân thiện hơn" height="355" width="550"><br><em>Giao diện của Nokia Lumia 520 thân thiện hơn</em></p><p align=""><strong><br>Lumia 520</strong> cũng đi kèm với ứng dụng có tên HERE – tên mới của Nokia cho ứng dụng bản đồ, định vị vệ tinh GPS. Nó cho phép bạn tải bản đồ để sử dụng offline…</p>&nbsp;<h3 align=""><br>Vi xử lý hai nhân</h3><p align="">Với bộ vi xử lý dual-core tốc độ 1GHz, <strong>Nokia Lumia 520</strong> có khả năng xử lý tốt với mọi ứng dụng. Bộ nhớ Ram chỉ 512MB, tuy nhiên nó không phải là một vấn đề lớn đối với hệ điều hành Windows Phone 8 vốn nổi tiếng là hệ điều hành sử dụng rất ít RAM.</p><p align="right"><strong>Hữu Tình</strong></p><br><br><table class="advantage"><tbody><tr><td><h3>Ưu điểm</h3><ul>
	<li>Thiết kế đẹp,&nbsp;mới lạ.</li>
	<li>Màn hình siêu nhạy, ngay cả với móng tay, găng tay.</li>
	<li>Chụp hình đẹp, tạo ảnh động, chia sẻ dễ dàng.</li>
	<li>Văn phòng di động với các ứng dụng Outlook, Word, Excel và PowerPoint.</li>
</ul></td><td><h3>Nhược điểm</h3><ul>
	<li>Không có camera trước.</li>
	<li>Không có đèn flash.</li>
	<li>Bộ nhớ Ram chỉ 512MB.</li>
</ul></td></tr></tbody></table>', 3, 99, 2, 10, 0, CAST(N'2014-03-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (16, N'Nokia Lumia 1520', N'/Content/Images/Nokia/Nokia Lumia 1520.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/Nokia/Hinh360-Nokia/Nokia-Lumia-720-hinh360-1.jpg', N'" /> </a>', CAST(4990000 AS Decimal(18, 0)), CAST(5500000 AS Decimal(18, 0)), N'<p>M&agrave;n h&igrave;nh: Full HD, 6.0&quot;, 1080 x 1920 pixels CPU: Qualcomm Snapdragon 800, 4 nh&acirc;n, 2.2 GHz RAM 2 GB Hệ điều h&agrave;nh: Windows Phone 8 Camera ch&iacute;nh: 20 MP, Quay phim FullHD 1080p@30fps Camera phụ: 1.2 MP Bộ nhớ trong: 32 GB Thẻ nhớ ngo&agrave;i đến: 64 GB Dung lượng pin: 3400 mAh</p>
', N'<p><img src="http://cdn.tgdd.vn/Products/Images/42/60606/Kit/Nokia-Lumia-1520-mo-ta-chuc-nang-2.jpg" /></p>

<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td rowspan="2">
			<p>Th&ocirc;ng tin chung</p>
			</td>
			<td>Hệ điều h&agrave;nh</td>
			<td>Windows Phone 8</td>
		</tr>
		<tr>
			<td>
			<p>Ng&ocirc;n ngữ</p>
			</td>
			<td>Tiếng Việt, Tiếng Anh</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>Loại m&agrave;n h&igrave;nh</td>
			<td>IPS LCD</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;u m&agrave;n h&igrave;nh</p>
			</td>
			<td>16 triệu m&agrave;u</td>
		</tr>
		<tr>
			<td>
			<p>Chuẩn m&agrave;n h&igrave;nh</p>
			</td>
			<td>Full HD</td>
		</tr>
		<tr>
			<td>
			<p>Độ ph&acirc;n giải</p>
			</td>
			<td>1080 x 1920 pixels</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh rộng</p>
			</td>
			<td>6.0&quot;</td>
		</tr>
		<tr>
			<td>
			<p>C&ocirc;ng nghệ cảm ứng</p>
			</td>
			<td>Cảm ứng điện dung đa điểm</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Chụp h&igrave;nh &amp; Quay phim</p>
			</td>
			<td>Camera sau</td>
			<td>20 MP</td>
		</tr>
		<tr>
			<td>
			<p>Camera trước</p>
			</td>
			<td>1.2 MP</td>
		</tr>
		<tr>
			<td>
			<p>Đ&egrave;n Flash</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>T&iacute;nh năng camera</p>
			</td>
			<td>Ống k&iacute;nh Carl Zeiss<br />
			Tự động lấy n&eacute;t<br />
			Nhận diện khu&ocirc;n mặt<br />
			Chống rung</td>
		</tr>
		<tr>
			<td>
			<p>Quay phim</p>
			</td>
			<td>Quay phim FullHD 1080p@30fps</td>
		</tr>
		<tr>
			<td>
			<p>Videocall</p>
			</td>
			<td>Hỗ trợ VideoCall qua Skype</td>
		</tr>
		<tr>
			<td rowspan="5">
			<p>CPU &amp; RAM</p>
			</td>
			<td>Tốc độ CPU</td>
			<td>2.2 GHz</td>
		</tr>
		<tr>
			<td>
			<p>Số nh&acirc;n</p>
			</td>
			<td>4 nh&acirc;n</td>
		</tr>
		<tr>
			<td>
			<p>Chipset</p>
			</td>
			<td>Qualcomm Snapdragon 800</td>
		</tr>
		<tr>
			<td>
			<p>RAM</p>
			</td>
			<td>2 GB</td>
		</tr>
		<tr>
			<td>
			<p>Chip đồ họa (GPU)</p>
			</td>
			<td>Adreno 330</td>
		</tr>
		<tr>
			<td rowspan="4">
			<p>Bộ nhớ &amp; Lưu trữ</p>
			</td>
			<td>Danh bạ</td>
			<td>Kh&ocirc;ng giới hạn</td>
		</tr>
		<tr>
			<td>
			<p>Bộ nhớ trong (ROM)</p>
			</td>
			<td>32 GB</td>
		</tr>
		<tr>
			<td>
			<p>Thẻ nhớ ngo&agrave;i</p>
			</td>
			<td>MicroSD (T-Flash)</td>
		</tr>
		<tr>
			<td>
			<p>Hỗ trợ thẻ tối đa</p>
			</td>
			<td>64 GB</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Thiết kế &amp; Trọng lượng</p>
			</td>
			<td>Kiểu d&aacute;ng</td>
			<td>Thanh + Cảm ứng</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước</p>
			</td>
			<td>162.8 x 85.4 x 8.7 mm</td>
		</tr>
		<tr>
			<td>
			<p>Trọng lượng (g)</p>
			</td>
			<td>209</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Th&ocirc;ng tin pin</p>
			</td>
			<td>Loại pin</td>
			<td>Pin Nokia BV-4BW</td>
		</tr>
		<tr>
			<td>
			<p>Dung lượng pin</p>
			</td>
			<td>3400 mAh</td>
		</tr>
		<tr>
			<td>
			<p>Pin c&oacute; thể th&aacute;o rời</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="13">
			<p>Kết nối &amp; Cổng giao tiếp</p>
			</td>
			<td>3G</td>
			<td>HSDPA, 42 Mbps; HSUPA, 5.76 Mbps</td>
		</tr>
		<tr>
			<td>
			<p>4G</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Loại Sim</p>
			</td>
			<td>Nano SIM</td>
		</tr>
		<tr>
			<td>
			<p>Khe gắn Sim</p>
			</td>
			<td>1 Sim</td>
		</tr>
		<tr>
			<td>
			<p>Wifi</p>
			</td>
			<td>Wi-Fi 802.11 a/b/g/n, dual-band, DLNA, Wi-Fi hotspot</td>
		</tr>
		<tr>
			<td>
			<p>GPS</p>
			</td>
			<td>A-GPS v&agrave; GLONASS</td>
		</tr>
		<tr>
			<td>
			<p>Bluetooth</p>
			</td>
			<td>V4.0 with A2DP</td>
		</tr>
		<tr>
			<td>
			<p>GPRS/EDGE</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Jack tai nghe</p>
			</td>
			<td>3.5 mm</td>
		</tr>
		<tr>
			<td>
			<p>NFC</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối USB</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối kh&aacute;c</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Cổng sạc</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Giải tr&iacute; &amp; Ứng dụng</p>
			</td>
			<td>Xem phim</td>
			<td>MP4, WMV, H.263, H.264(MPEG4-AVC), Xvid, DivX</td>
		</tr>
		<tr>
			<td>
			<p>Nghe nhạc</p>
			</td>
			<td>MP3, WAV, WMA, eAAC+</td>
		</tr>
		<tr>
			<td>
			<p>Ghi &acirc;m</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Giới hạn cuộc gọi</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>FM radio</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Chức năng kh&aacute;c</p>
			</td>
			<td>Mạng x&atilde; hội ảo<br />
			Youtube<br />
			Micro chuy&ecirc;n dụng chống ồn</td>
		</tr>
	</tbody>
</table>
', N'<h2>Nokia Lumia 1520 Chiếc &ldquo;Big Phone&rdquo; 6 inch đầu ti&ecirc;n của Nokia</h2>

<p><br />
<strong>Nokia Lumia 1520</strong>, chiếc &ldquo;phablet&rdquo; 6 inch đầu ti&ecirc;n của Nokia v&agrave; cũng l&agrave; th&agrave;nh vi&ecirc;n đầu ti&ecirc;n sử dụng hệ điều h&agrave;nh Windows Phone 8 c&oacute; m&agrave;n h&igrave;nh full HD. Với xu thế &ldquo;chuộng&rdquo; m&agrave;n h&igrave;nh cỡ lớn như hiện nay th&igrave; việc đưa ra thị trường chiếc smartphone &ldquo;khủng&rdquo; như Lumia 1520 sẽ đưa Nokia đi theo một hướng mới, hứa hẹn nhiều th&agrave;nh c&ocirc;ng hơn nữa cho h&atilde;ng điện thoại đến từ Phần Lan.</p>

<p><br />
<img alt="Lumia 1520 - Một siêu phẩm mới 6 inch ấn tượng của Nokia" src="http://cdn.tgdd.vn/Products/Images/42/60606/nokia-lumia-1520_clip_image002.jpg" /><br />
<em>Một si&ecirc;u phẩm mới 6 inch ấn tượng của Nokia</em></p>

<p>&nbsp;</p>

<h3><br />
Đẹp, chắc, bền v&agrave; khỏe</h3>

<p>Trung th&agrave;nh với thiết kế bằng nhựa Polycacbonat truyền thống m&agrave; đ&atilde; qu&aacute; quen tr&ecirc;n c&aacute;c sản phẩm d&ograve;ng <a href="http://www.thegioididong.com/nokia-lumia" target="_blank">Lumia</a> trước đ&oacute; của <a href="http://www.thegioididong.com/dtdd-nokia" target="_blank">Nokia</a>, <strong>Lumia 1520</strong> vẫn mang phong c&aacute;ch thể thao, năng động nhưng vẫn đảm bảo cảm gi&aacute;c chắc chắn v&agrave; cứng c&aacute;p.</p>

<p><br />
Bề mặt chiếc &ldquo;big phone&rdquo; n&agrave;y được phủ lớp sơn hơi nh&aacute;m, kh&ocirc;ng phải trơn b&oacute;ng như c&aacute;c thiết bị tầm trung, điều đ&oacute; gi&uacute;p hạn chế việc b&aacute;m dấu v&acirc;n tay v&agrave; tạo cảm gi&aacute;c thoải m&aacute;i bởi khi cầm kh&ocirc;ng cần phải d&ugrave;ng lực nắm qu&aacute; mạnh, nhất l&agrave; với k&iacute;ch thước lớn đến 6 inch như si&ecirc;u phẩm n&agrave;y.</p>

<p><br />
<img alt="Thân hình của Nokia Lumia 1520 được thiết kế khá gọn gàng" src="http://cdn.tgdd.vn/Products/Images/42/60606/nokia-lumia-1520_clip_image004.jpg" /><br />
<em>Th&acirc;n h&igrave;nh của Lumia 1520 được thiết kế kh&aacute; gọn g&agrave;ng</em></p>

<p><br />
<strong>Nokia Lumia 1520 </strong>được thiết kế kh&aacute; gọn g&agrave;ng, tuy th&acirc;n h&igrave;nh lớn nhưng người d&ugrave;ng lại c&oacute; cảm gi&aacute;c kh&ocirc;ng hề khổng lồ, c&aacute;c cạnh xung quanh m&agrave;n h&igrave;nh cũng được l&agrave;m rất mỏng, c&aacute;c cạnh được bo tr&ograve;n mềm mại, &ocirc;m tay. C&aacute;c ph&iacute;m vật l&yacute; vẫn được Nokia duy tr&igrave; b&ecirc;n cạnh phải thiết bị giống như truyền thống thiết kế của d&ograve;ng Lumia.</p>

<p><br />
<img alt="Jack tiêu chuẩn 3.5mm trên đỉnh Lumia 1520 " src="http://cdn.tgdd.vn/Products/Images/42/60606/nokia-lumia-1520_clip_image006.jpg" /><br />
<em>Jack ti&ecirc;u chuẩn 3.5mm tr&ecirc;n đỉnh Lumia 1520</em></p>

<p>&nbsp;</p>

<h3><br />
M&agrave;n h&igrave;nh 6 inch điểm đ&aacute;ng ch&uacute; &yacute; nhất</h3>

<p><strong>Lumia 1520 </strong>l&agrave; chiếc <a href="http://www.thegioididong.com/dtdd" target="_blank">smartphone</a> cỡ lớn bậc nhất của Nokia ch&iacute;nh vi vậy n&oacute; đ&atilde; được ưu &aacute;i với chiếc m&agrave;n h&igrave;nh l&ecirc;n đến <strong>6 inch</strong> v&agrave; độ ph&acirc;n giải n&oacute; đạt <strong>1080p Full HD, khiến n&oacute; trở th&agrave;nh chiếc điện thoại Windows Phone đầu ti&ecirc;n sở hữu m&agrave;n h&igrave;nh độ ph&acirc;n giải Full HD n&agrave;y</strong>.</p>

<p><br />
<img alt="Màn hình của Nokia Lumia 1520 có góc nhìn khá tốt" src="http://cdn.tgdd.vn/Products/Images/42/60606/nokia-lumia-1520_clip_image008.jpg" /><br />
<em>M&agrave;n h&igrave;nh của Lumia 1520 c&oacute; g&oacute;c nh&igrave;n kh&aacute; tốt</em></p>

<p><br />
Với một chiếc m&agrave;n h&igrave;nh l&ecirc;n đến 6 inch c&ugrave;ng chất lượng hiển thị tốt như vậy c&oacute; lẽ sẽ khiến bạn nghiền game v&agrave; m&ecirc; xem phim hơn, những trải nghiệm sẽ rất ấn tượng, ngo&agrave;i ra việc duyệt văn bản, chỉnh sửa văn bản cũng thoải m&aacute;i hơn, nội dung được hiển thị đầy đủ, bao qu&aacute;t dễ d&agrave;ng hơn.</p>

<p>&nbsp;</p>

<h3><br />
Cấu h&igrave;nh thuộc &ldquo;Top&rdquo; đầu của thị trường smartphone</h3>

<p><strong>Nokia Lumia 1520</strong> được trang bị cấu h&igrave;nh thuộc h&agrave;ng &ldquo;khủng&rdquo; tr&ecirc;n thị trường di động tại thời điểm ra mắt, đ&oacute; l&agrave; bộ xử l&yacute; <strong>Qualcomm Snapdragon 800</strong> l&otilde;i tứ với 2GB RAM v&agrave; 32GB bộ nhớ trong v&agrave; hỗ trợ th&ecirc;m khe cắm thẻ nhớ ngo&agrave;i. Tuy hệ điều h&agrave;nh Windows 8 kh&ocirc;ng đ&ograve;i hỏi cấu h&igrave;nh cao như Android nhưng Nokia vẫn trang bị cho &ldquo;đứa con cưng&rdquo; của m&igrave;nh &ldquo;quả tim&rdquo; khỏe gi&uacute;p tương th&iacute;ch với hầu hết c&aacute;c ứng dụng hay game khủng hiện nay, khiến mọi thứ trở n&ecirc;n tuyệt vời hơn, mượt m&agrave; hơn.</p>

<p><br />
<em><img alt="Giao diện ô vuông quen thuộc trên Windows 8 của Nokia Lumia 1520" src="http://cdn.tgdd.vn/Products/Images/42/60606/nokia-lumia-1520_clip_image010.jpg" /></em><br />
<em>Giao diện &ocirc; vu&ocirc;ng quen thuộc tr&ecirc;n Window 8</em></p>

<p><br />
<strong>Lumia 1520</strong> c&ograve;n sở hữu dung lượng pin l&ecirc;n đến 3400mAh, c&oacute; thể đảm bảo c&ocirc;ng việc, giải tr&iacute;, lướt web, nghe nhạc, cập nhật tin tức v&agrave; tham gia c&aacute;c mạng x&atilde; hội một c&aacute;ch thường xuy&ecirc;n, thuận tiện. Với cấu h&igrave;nh khủng, Lumia 1520 c&oacute; thể c&agrave;i đặt v&agrave; chạy bất k&igrave; ứng dụng hay game khủng n&agrave;o.</p>

<p>&nbsp;</p>

<h3><br />
Ấn tượng với camera sau 20MP, camera trước 1.9MP</h3>

<p>Camera ch&iacute;nh l&agrave; thế mạnh của <strong>Nokia</strong> v&agrave; ch&iacute;nh điều đ&oacute; đ&atilde; gi&uacute;p h&atilde;ng điện thoại đến từ Phần Lan c&oacute; thể đứng vững qua nhiều thời kỳ s&oacute;ng gi&oacute; trước đ&acirc;y. Lu&ocirc;n đi đầu trong cuộc đua camera v&agrave; đ&atilde; kh&aacute; nổi tiếng với PureView của m&igrave;nh. Tuy kh&ocirc;ng bằng người anh &ldquo;si&ecirc;u khủng&rdquo; <strong>Lumia 1020</strong> của m&igrave;nh nhưng với camera 20MP Lumia 1520 cũng đ&atilde; khiến nhiều sản phẩm cạnh tranh phải ngước nh&igrave;n.</p>

<p><br />
<img alt="Camera sau Nokia Lumia 1520 được thiết kế nhô cao hơn so với nắp lưng" src="http://cdn.tgdd.vn/Products/Images/42/60606/nokia-lumia-1520_clip_image012.jpg" /><br />
<em>Camera sau được thiết kế nh&ocirc; cao hơn so với nắp lưng</em></p>

<p><br />
Sản phẩm mới của Nokia c&oacute; khả năng quay video full HD, tốc độ chụp v&agrave; lấy n&eacute;t cực nhanh, khả năng b&ugrave; s&aacute;ng rất tốt, đặc biệt hỗ trợ kh&aacute; nhiều hiệu ứng chỉnh sửa ảnh v&agrave; video đẹp mắt. Sau khi chụp bạn c&oacute; thể chia sẻ một c&aacute;ch nhanh ch&oacute;ng l&ecirc;n mạng x&atilde; hội hay c&oacute; thể kết nối mạng v&agrave; đồng bộ ngay với c&aacute;c kho lưu trữ như SkyDrive.</p>

<p><strong>Trung Hiếu</strong></p>

<table>
	<tbody>
		<tr>
			<td>
			<h3>Ưu điểm</h3>

			<ul>
				<li>Thiết kế gọn g&agrave;ng, thời trang, chất liệu cao cấp.</li>
				<li>M&agrave;n h&igrave;nh 6 inch, chất lượng full HD, g&oacute;c nh&igrave;n rộng.</li>
				<li>Cấu h&igrave;nh thuộc Top &quot;khủng&quot; chip bốn nh&acirc;n snapdragon 800 cho hiệu suất vượt trội.</li>
				<li>Pin 3400mAh c&oacute; thời lượng tốt.</li>
				<li>Camera 20MP cho chất lượng h&igrave;nh ảnh tuyệt vời.</li>
			</ul>
			</td>
			<td>
			<h3>Nhược điểm</h3>

			<ul>
				<li>M&agrave;n h&igrave;nh qu&aacute; khổ, sẽ kh&oacute; sử dụng nếu chưa quen.</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>
', 3, 99, 4, 0, 0, CAST(N'2014-03-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (17, N'Nokia Lumia 620', N'/Content/Images/Nokia/Nokia Lumia 620.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/Nokia/Hinh360-Nokia/Nokia-Lumia-720-hinh360-1.jpg', N'" /> </a>', CAST(3690000 AS Decimal(18, 0)), CAST(3900000 AS Decimal(18, 0)), N'Màn hình:	WVGA, 3.8", 480 x 800 pixels
CPU:	Qualcomm Snapdragon S4, 2 nhân, 1 GHz
RAM	512 MB
Hệ điều hành:	Windows Phone 8
Camera chính:	5.0 MP, Quay phim HD 720p@30fps
Camera phụ:	VGA (0.3 Mpx)
Bộ nhớ trong:	8 GB
Thẻ nhớ ngoài đến:	64 GB
Dung lượng pin:	1300 mAh', N'<img class="lazy" src="http://cdn.tgdd.vn/Products/Images/42/57831/Kit/chuc-nang-lumia620.jpg">  <table style="width: 100%;" class="product-compare" border="0" cellpadding="0" cellspacing="0">
    <tbody>
        <tr class="r">
            <td rowspan="2" class="g" valign="top">
            <div class="gh">Thông tin chung</div>
            </td>
            <td id="prop_72" class="p f eph" onclick="ShowHelp(72, 2);">Hệ điều hành</td>
            <td id="c72_1" class="v f">Windows Phone 8</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_75" class="ph eph" onclick="ShowHelp(75, 2);">Ngôn ngữ</div>
            </td>
            <td id="c75_1" class="v">Tiếng Việt, Tiếng Anh</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Màn hình</div>
            </td>
            <td class="p f">Loại màn hình</td>
            <td id="c6459_1" class="v f">IPS LCD</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Màu màn hình</div>
            </td>
            <td id="c6239_1" class="v">16 triệu màu</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_77" class="ph eph" onclick="ShowHelp(77, 2);">Chuẩn màn hình</div>
            </td>
            <td id="c77_1" class="v">WVGA</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_78" class="ph eph" onclick="ShowHelp(78, 2);">Độ phân giải</div>
            </td>
            <td id="c78_1" class="v">480 x 800 pixels</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_79" class="ph eph" onclick="ShowHelp(79, 2);">Màn hình rộng</div>
            </td>
            <td id="c79_1" class="v">3.8"</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_80" class="ph eph" onclick="ShowHelp(80, 2);">Công nghệ cảm ứng</div>
            </td>
            <td id="c80_1" class="v">Cảm ứng điện dung đa điểm</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Chụp hình &amp; Quay phim</div>
            </td>
            <td id="prop_27" class="p f eph" onclick="ShowHelp(27, 2);">Camera sau</td>
            <td id="c27_1" class="v f">5.0 MP</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_29" class="ph eph" onclick="ShowHelp(29, 2);">Camera trước</div>
            </td>
            <td id="c29_1" class="v">VGA (0.3 Mpx)</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Đèn Flash</div>
            </td>
            <td id="c6460_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_28" class="ph eph" onclick="ShowHelp(28, 2);">Tính năng camera</div>
            </td>
            <td id="c28_1" class="v">Tự động lấy nét</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_31" class="ph eph" onclick="ShowHelp(31, 2);">Quay phim</div>
            </td>
            <td id="c31_1" class="v">Quay phim HD 720p@30fps</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_30" class="ph eph" onclick="ShowHelp(30, 2);">Videocall</div>
            </td>
            <td id="c30_1" class="v">Không</td>
        </tr>
        <tr class="r">
            <td rowspan="5" class="g" valign="top">
            <div class="gh">CPU &amp; RAM</div>
            </td>
            <td id="prop_51" class="p f eph" onclick="ShowHelp(51, 2);">Tốc độ CPU</td>
            <td id="c51_1" class="v f">1 GHz</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Số nhân</div>
            </td>
            <td id="c6461_1" class="v">2 nhân</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6059" class="ph eph" onclick="ShowHelp(6059, 2);">Chipset</div>
            </td>
            <td id="c6059_1" class="v">Qualcomm Snapdragon S4</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">RAM</div>
            </td>
            <td id="c50_1" class="v">512 MB</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6079" class="ph eph" onclick="ShowHelp(6079, 2);">Chip đồ họa (GPU)</div>
            </td>
            <td id="c6079_1" class="v">Adreno 305</td>
        </tr>
        <tr class="r">
            <td rowspan="4" class="g" valign="top">
            <div class="gh">Bộ nhớ &amp; Lưu trữ</div>
            </td>
            <td id="prop_54" class="p f eph" onclick="ShowHelp(54, 2);">Danh bạ</td>
            <td id="c54_1" class="v f">Không giới hạn</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_49" class="ph eph" onclick="ShowHelp(49, 2);">Bộ nhớ trong (ROM)</div>
            </td>
            <td id="c49_1" class="v">8 GB</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_52" class="ph eph" onclick="ShowHelp(52, 2);">Thẻ nhớ ngoài</div>
            </td>
            <td id="c52_1" class="v">MicroSD (T-Flash)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_53" class="ph eph" onclick="ShowHelp(53, 2);">Hỗ trợ thẻ tối đa</div>
            </td>
            <td id="c53_1" class="v">64 GB</td>
        </tr>
        <tr class="r">
            <td rowspan="3" class="g" valign="top">
            <div class="gh">Thiết kế &amp; Trọng lượng</div>
            </td>
            <td id="prop_73" class="p f eph" onclick="ShowHelp(73, 2);">Kiểu dáng</td>
            <td id="c73_1" class="v f">Thanh + Cảm ứng</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_88" class="ph eph" onclick="ShowHelp(88, 2);">Kích thước</div>
            </td>
            <td id="c88_1" class="v">115.4 x 61.1 x 11 mm</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_100" class="ph eph" onclick="ShowHelp(100, 2);">Trọng lượng (g)</div>
            </td>
            <td id="c100_1" class="v">127</td>
        </tr>
        <tr class="r">
            <td rowspan="3" class="g" valign="top">
            <div class="gh">Thông tin pin</div>
            </td>
            <td class="p f">Loại pin</td>
            <td id="c83_1" class="v f">Pin Nokia BL-4J</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_84" class="ph eph" onclick="ShowHelp(84, 2);">Dung lượng pin</div>
            </td>
            <td id="c84_1" class="v">1300 mAh</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Pin có thể tháo rời</div>
            </td>
            <td id="c6462_1" class="v">Có</td>
        </tr>
        <tr class="r">
            <td rowspan="13" class="g" valign="top">
            <div class="gh">Kết nối &amp; Cổng giao tiếp</div>
            </td>
            <td id="prop_65" class="p f eph" onclick="ShowHelp(65, 2);">3G</td>
            <td id="c65_1" class="v f">HSDPA, 21 Mbps; HSUPA, 5.76 Mbps</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">4G</div>
            </td>
            <td id="c6463_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Loại Sim</div>
            </td>
            <td id="c6339_1" class="v">Micro SIM</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_60" class="ph eph" onclick="ShowHelp(60, 2);">Khe gắn Sim</div>
            </td>
            <td id="c60_1" class="v">1 Sim</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_66" class="ph eph" onclick="ShowHelp(66, 2);">Wifi</div>
            </td>
            <td id="c66_1" class="v">Wi-Fi 802.11 a/b/g/n, dual-band</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_68" class="ph eph" onclick="ShowHelp(68, 2);">GPS</div>
            </td>
            <td id="c68_1" class="v">A-GPS và GLONASS</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_69" class="ph eph" onclick="ShowHelp(69, 2);">Bluetooth</div>
            </td>
            <td id="c69_1" class="v">Có, V3.0 với A2DP, EDR</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_61" class="ph eph" onclick="ShowHelp(61, 2);">GPRS/EDGE</div>
            </td>
            <td id="c61_1" class="v">Class B</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_48" class="ph eph" onclick="ShowHelp(48, 2);">Jack tai nghe</div>
            </td>
            <td id="c48_1" class="v">3.5 mm</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">NFC</div>
            </td>
            <td id="c6464_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_71" class="ph eph" onclick="ShowHelp(71, 2);">Kết nối USB</div>
            </td>
            <td id="c71_1" class="v">Micro USB</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Kết nối khác</div>
            </td>
            <td id="c5199_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Cổng sạc</div>
            </td>
            <td id="c85_1" class="v">Micro USB</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Giải trí &amp; Ứng dụng</div>
            </td>
            <td id="prop_32" class="p f eph" onclick="ShowHelp(32, 2);">Xem phim</td>
            <td id="c32_1" class="v f">MP4, WMV, H.263, H.264(MPEG4-AVC)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_33" class="ph eph" onclick="ShowHelp(33, 2);">Nghe nhạc</div>
            </td>
            <td id="c33_1" class="v">MP3, WAV, WMA, eAAC+</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_36" class="ph eph" onclick="ShowHelp(36, 2);">Ghi âm</div>
            </td>
            <td id="c36_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6039" class="ph eph" onclick="ShowHelp(6039, 2);">Giới hạn cuộc gọi</div>
            </td>
            <td id="c6039_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_34" class="ph eph" onclick="ShowHelp(34, 2);">FM radio</div>
            </td>
            <td id="c34_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Chức năng khác</div>
            </td>
            <td id="c43_1" class="v">Mạng xã hội ảo<br>Bộ lưu trữ SkyDrive<br>Micro chuyên dụng chống ồn</td>
        </tr>
    </tbody>
</table>', N'<h2 align="center">Nokia Lumia 620 – Windows phone 8 trong tầm tay bạn</h2><p align=""><br>Vừa qua, Nokia đã bắt đầu giới thiệu <strong>Nokia Lumia 620</strong> một model tầm trung dành cho các thị trường đang phát triển như Việt Nam, máy sẽ được bán ra trong tháng 1/2013. Đây là thành viên mới nhất và nhỏ nhất của công ty Phần Lan chạy trên nền Windows Phone 8. Nokia Lumia 620 sẽ là đối thủ cạnh tranh trực tiếp với bộ 3 điện thoại <a href="http://www.thegioididong.com/dtdd/sony-xperia-u" target="_blank">Xperia U</a>, <a href="http://www.thegioididong.com/dtdd/sony-xperia-j-st26i" target="_blank">Xperia J</a> và <a href="http://www.thegioididong.com/dtdd/sony-xperia-go" target="_blank">Xperia Go</a> của Sony cũng như <a href="http://www.thegioididong.com/dtdd/htc-one-v" target="_blank">HTC One V</a> hay một số dòng Galaxy của Samsung đang được chú ý. Tuy nhiên, Lumia 620 có những điểm mạnh nhất định, hứa hẹn sẽ để lại những dấu ấn riêng trên thị trường smartphone tầm trung tại Việt Nam.</p><p style="text-align: center;"><br><img title="Nokia Lumia 620" src="http://cdn.tgdd.vn/Products/Images/42/57831/Nokia-Lumia-620.jpg" alt="Nokia Lumia 620" height="371" width="500">&nbsp;<br><em>Nokia Lumia 620</em></p>&nbsp;<h3 align="left"><br>Thiết kế ấn tượng với vỏ polycarbonate</h3><p align="">Điểm nhấn lớn nhất của máy chính là bộ vỏ đầy màu sắc. <strong>Lumia 620</strong> sử dụng kỹ thuật màu phủ kép (dual-shot) mới, mang lại những hiệu ứng màu sắc và hoa văn độc đáo. Kỹ thuật phủ kép bổ sung thêm một lớp polycarbonate màu, trong suốt hoặc trong mờ phía trên lớp nền để tạo ra những màu phối và chiều sâu lý thú. Với bảy màu vỏ rời khác nhau, người dùng có thể kết hợp điện thoại Nokia Lumia 620 với sở thích và phong cách riêng của mình.</p><p style="text-align: center;"><br><img title="Nokia Lumia 620 đa sắc màu" src="http://cdn.tgdd.vn/Products/Images/42/57831/Nokia-Lumia-620-bo-vo-da-sac-mau.jpg" alt="Nokia Lumia 620 bộ vỏ đa sắc màu với lớp polycarbonate" height="365" width="618">&nbsp;<br><em>Bộ vỏ đa sắc màu với lớp polycarbonate</em></p>&nbsp;<h3 align="left"><br>Màn hình công nghệ ClearBlack Display siêu sáng</h3><p align=""><strong>Nokia Lumia 620</strong> được trang bị màn hình cảm ứng công nghệ ClearBlack LCD giúp máy hiển thị tốt ngay cả trong điều kiện ánh sáng mạnh, kích thước 3.8 inch độ phân giải WVGA (800x480p), mật độ điểm ảnh 246 ppi. Đây là những thông số rất ấn tượng ngang ngửa với màn hình của các dòng smartphone cao cấp.</p><p style="text-align: center;"><br><img title="Nokia Lumia 620 với công nghệ ClearBlack" src="http://cdn.tgdd.vn/Products/Images/42/57831/Nokia-Lumia-620-man-hinh-3.8inches.jpg" alt="Lumia 620 có màn hình 3.8 inch với công nghệ ClearBlack" height="450" width="623"><br> <em>Màn hình 3.8 inch với công nghệ ClearBlack</em></p>&nbsp;<h3 align="left"><br>Phần cứng mạnh mẽ</h3><p align=""><strong>Lumia 620</strong> mang trên mình bộ vi xử lý lõi kép Krait tốc độ 1GHz, chip đồ họa Adreno 305 GPU, RAM 512, bộ nhớ trong dung lượng 8GB và có hỗ trợ khe cắm thẻ microSD với dung lượng đến 64 GB. Nếu so với các đối thủ trực tiếp có cùng mức giá hiện nay thì rõ ràng Lumia 620 có dàn “nội thất” toàn diện nhất.</p><p align=""><br>Ngoài ra, Lumia 620 còn thừa hưởng một số tính năng từ <a href="http://www.thegioididong.com/dtdd/nokia-lumia-920" target="_blank">Nokia Lumia 920</a> và <a href="http://www.thegioididong.com/dtdd/nokia-lumia-820" target="_blank">Lumia 820</a> là thấu kính máy ảnh khẩu độ f/2.4 độc quyền với máy ảnh chính 5 MP hỗ trợ quay video HD 720p@30fps và máy ảnh VGA phụ phía trước, cho phép tạo ra những ảnh động thú vị với Nokia Cinemagraph và tự động chọn lựa gương mặt với Smartshoot. Ngoài ra, Nokia Lumia 620 cũng cho phép truy cập vào Nokia Maps, Nokia Drive, Nokia Transport và Nokia City Lens.</p><p align=""><br><strong>Nokia Lumia 620</strong> được trang bị đầy đủ các kết nối phổ biến trên smartphone hiện nay như Bluetooth 3.0 với A2DP và EDR, microUSB 2.0, 3G HSDPA tốc độ 21 Mbps, Wifi chuẩn a/b/g/n hỗ trợ dual-band, định vị GPS và tất nhiên là cả giao tiếp NFC đang rất “hot”.</p><p style="text-align: center;"><br><img title="Nokia Lumia 620 với Camera chính 5 MP" src="http://cdn.tgdd.vn/Products/Images/42/57831/Nokia-Lumia-620-camera-5MP.jpg" alt="Lumia 620 camera chính 5 MP với đèn flash" height="320" width="622">&nbsp;<br><em>Camera chính 5 MP với đèn flash</em></p><p align="center"><img title="Nokia Lumia 620 với camera phụ VGA" src="http://cdn.tgdd.vn/Products/Images/42/57831/Nokia-Lumia-620-camera-phu.jpg" alt="Lumia 620 camera VGA phụ phía trước" height="301" width="616">&nbsp;<br><em>Camera VGA phụ phía trước</em></p>&nbsp;<h3 align="left"><br>Trải nghiệm Window Phone 8</h3><p align="">Với các tín đồ của Windows Phone, <strong>Lumia 620</strong> cũng là lựa chọn rẻ nhất giúp họ trải nghiệm phiên bản Windows Phone 8 với các ô Live Tiles hấp dẫn. Nền tảng mới của Microsoft hỗ trợ phần cứng mạnh mẽ và cao cấp hơn so với Windows Phone 7 trước đây, như hỗ trợ vi xử lý đa nhân (lõi kép hay lõi tứ), màn hình độ phân giải cao hơn (HD 720p hay Full HD 1080p), hỗ trợ khe cắm thẻ nhớ ngoài dung lượng tới 64 GB hay công nghệ giao tiếp NFC…</p><p align=""><br>Các ô Live Tile trên <strong>Nokia Lumia 620</strong> liên tục cập nhật trạng thái trên màn hình chính, People Hub tập hợp thông tin liên hệ từ nhiều nguồn vào một nơi duy nhất, Me Tile giúp mọi người có thể cập nhật những thông tin cá nhân mới nhất trên khắp các kênh Facebook, LinkedIn và Twitter. Windows Phone 8 cũng bao gồm Xbox Live, Microsoft Office, SkyDrive với dung lượng lưu trữ trực tuyến 7GB và Internet Explorer 10 giúp lướt web nhanh hơn và an toàn hơn.</p><p style="text-align: center;"><br><img title="Nokia Lumia 620 với cổng microUSB" src="http://cdn.tgdd.vn/Products/Images/42/57831/Nokia-Lumia-620-micro-USB.jpg" alt="Lumia 620 đuôi máy với cổng microUSB và mic thoại" height="307" width="617">&nbsp;<br><em>Đuôi máy với cổng microUSB và mic thoại</em></p><p style="text-align: center;"><img title="Nokia Lumia 620 với jack 3.5mm" src="http://cdn.tgdd.vn/Products/Images/42/57831/Nokia-Lumia-620-jack-3.5mm.jpg" alt="Lumia 620 đỉnh máy với jack 3.5mm và mic lọc thoại" height="313" width="621">&nbsp;<br><em>Đỉnh máy với jack 3.5mm và mic lọc thoại</em></p>&nbsp;<h3 align="left"><br>Thưởng thức âm nhạc đỉnh cao</h3><p align="">Không thuê bao, không cước phí, không giới hạn, đó là những gì Nokia Music cung cấp cho bạn. Những bài hát của các ca sĩ yêu thích sẽ được "streaming" miễn phí trên điện thoại của bạn. Bạn có thể lựa chọn trong hàng trăm kênh nhạc khác nhau hoặc tạo một kênh cho riêng mình. Và đặc biệt nhất là bạn vẫn có thể nghe nhạc ngay cả khi offline. Với sự hỗ trợ của NFC, <strong>Lumia 620</strong> có thể kết hợp với các phụ kiện có tính năng này như loa di động JBL PlayUp cho Nokia.</p><p align=""><br>Ngoài ra <strong>Nokia Lumia 620</strong> còn hỗ trợ jack tai nghe 3.5 mm với công nghệ Dolby khuếch đại âm thanh cho bạn cảm giác như đang ở trong một nhà hát mini.</p><p style="text-align: center;"><br><img title="Nokia Lumia 620 với nắp lưng" src="http://cdn.tgdd.vn/Products/Images/42/57831/Nokia-Lumia-620-jack-3.5mm-dinh-lien-voi-nap-lung.jpg" alt="Lumia 620 jack 3.5 mm dính liền với nắp lưng" height="450" width="600">&nbsp;<br><em>Jack 3.5 mm dính liền với nắp lưng</em></p><p style="text-align: center;"><img title="Nokia Lumia 620 các phần bên trong" src="http://cdn.tgdd.vn/Products/Images/42/57831/Nokia-Lumia-620-ben-trong-may.jpg" alt="Lumia 620 bên trong máy" height="368" width="595">&nbsp;<br><em>Bên trong máy</em></p><p align="right"><strong>Nguyễn Trọng Văn</strong></p><br><br><table class="advantage"><tbody><tr><td><h3>Ưu điểm</h3><ul>
	<li>Thiết kế thanh lịch, rực rỡ cùng bộ vỏ 2 màu độc đáo.</li>
	<li>Tạo ảnh động và chia sẻ dễ dàng với ứng dụng Cinemagraph.</li>
	<li>Màn hình hiển thị sắc nét.</li>
	<li>Chụp ảnh nhóm hoàn hảo với Smart Shoot.</li>
	<li>Khám phá những địa điểm thú vị xung quanh bạn.</li>
	<li>Làm việc mọi lúc mọi nơi với Outlook, Word, Excel và PowerPoint.</li>
</ul></td><td><h3>Nhược điểm</h3><ul>
	<li>Vỏ bẳng nhựa bóng nên dễ bị trượt khi tay có mồ hôi.</li>
	<li>Nắp lưng khó tháo rời.</li>
</ul></td></tr></tbody></table>', 3, 99, 0, 0, 0, CAST(N'2014-03-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (18, N'Nokia Asha 503 Dual', N'/Content/Images/Nokia/Nokia Asha 503 Dual.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/Nokia/Hinh360-Nokia/Nokia-Lumia-720-hinh360-1.jpg', N'" /> </a>', CAST(1900000 AS Decimal(18, 0)), CAST(2050000 AS Decimal(18, 0)), N'Màn hình:	QVGA, 3.0", 240 x 320 Pixels
SIM:	2 SIM 2 sóng
Camera:	5.0 MP
Danh bạ:	4000 số
Thẻ nhớ ngoài đến:	32 GB
Kết nối Bluetooth	Có, V3.0 với A2DP
Chức năng khác	Mạng xã hội ảo
Youtube
Dung lượng pin	1200 mAh', N'<img class="lazy" src="http://cdn.tgdd.vn/Products/Images/42/60678/Kit/nokia-asha-503-dual-sim-mo-ta-chuc-nang-1.jpg">    <table style="width: 100%;" class="product-compare" border="0" cellpadding="0" cellspacing="0">
    <tbody>
        <tr class="r">
            <td rowspan="2" class="g" valign="top">
            <div class="gh">Thông tin chung</div>
            </td>
            <td id="prop_72" class="p f eph" onclick="ShowHelp(72, 2);">Hệ điều hành</td>
            <td id="c72_1" class="v f">Nokia Asha software platform 1.2</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_75" class="ph eph" onclick="ShowHelp(75, 2);">Ngôn ngữ</div>
            </td>
            <td id="c75_1" class="v">Tiếng Việt, Tiếng Anh</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Màn hình</div>
            </td>
            <td class="p f">Loại màn hình</td>
            <td id="c6459_1" class="v f">LCD</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Màu màn hình</div>
            </td>
            <td id="c6239_1" class="v">262.144 màu</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_77" class="ph eph" onclick="ShowHelp(77, 2);">Chuẩn màn hình</div>
            </td>
            <td id="c77_1" class="v">QVGA</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_78" class="ph eph" onclick="ShowHelp(78, 2);">Độ phân giải</div>
            </td>
            <td id="c78_1" class="v">240 x 320 Pixels</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_79" class="ph eph" onclick="ShowHelp(79, 2);">Màn hình rộng</div>
            </td>
            <td id="c79_1" class="v">3.0"</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_80" class="ph eph" onclick="ShowHelp(80, 2);">Công nghệ cảm ứng</div>
            </td>
            <td id="c80_1" class="v">Cảm ứng điện dung</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Chụp hình &amp; Quay phim</div>
            </td>
            <td id="prop_27" class="p f eph" onclick="ShowHelp(27, 2);">Camera sau</td>
            <td id="c27_1" class="v f">5.0 MP</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_29" class="ph eph" onclick="ShowHelp(29, 2);">Camera trước</div>
            </td>
            <td id="c29_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Đèn Flash</div>
            </td>
            <td id="c6460_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_28" class="ph eph" onclick="ShowHelp(28, 2);">Tính năng camera</div>
            </td>
            <td id="c28_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_31" class="ph eph" onclick="ShowHelp(31, 2);">Quay phim</div>
            </td>
            <td id="c31_1" class="v">Quay phim QVGA@15fps</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_30" class="ph eph" onclick="ShowHelp(30, 2);">Videocall</div>
            </td>
            <td id="c30_1" class="v">Không</td>
        </tr>
        <tr class="r">
            <td rowspan="5" class="g" valign="top">
            <div class="gh">CPU &amp; RAM</div>
            </td>
            <td id="prop_51" class="p f eph" onclick="ShowHelp(51, 2);">Tốc độ CPU</td>
            <td id="c51_1" class="v f">1 GHz</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Số nhân</div>
            </td>
            <td id="c6461_1" class="v">-</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6059" class="ph eph" onclick="ShowHelp(6059, 2);">Chipset</div>
            </td>
            <td id="c6059_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">RAM</div>
            </td>
            <td id="c50_1" class="v">164 MB</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6079" class="ph eph" onclick="ShowHelp(6079, 2);">Chip đồ họa (GPU)</div>
            </td>
            <td id="c6079_1" class="v">Không</td>
        </tr>
        <tr class="r">
            <td rowspan="4" class="g" valign="top">
            <div class="gh">Bộ nhớ &amp; Lưu trữ</div>
            </td>
            <td id="prop_54" class="p f eph" onclick="ShowHelp(54, 2);">Danh bạ</td>
            <td id="c54_1" class="v f">4000 số</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_49" class="ph eph" onclick="ShowHelp(49, 2);">Bộ nhớ trong (ROM)</div>
            </td>
            <td id="c49_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_52" class="ph eph" onclick="ShowHelp(52, 2);">Thẻ nhớ ngoài</div>
            </td>
            <td id="c52_1" class="v">MicroSD (T-Flash)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_53" class="ph eph" onclick="ShowHelp(53, 2);">Hỗ trợ thẻ tối đa</div>
            </td>
            <td id="c53_1" class="v">32 GB</td>
        </tr>
        <tr class="r">
            <td rowspan="3" class="g" valign="top">
            <div class="gh">Thiết kế &amp; Trọng lượng</div>
            </td>
            <td id="prop_73" class="p f eph" onclick="ShowHelp(73, 2);">Kiểu dáng</td>
            <td id="c73_1" class="v f">Thanh + Cảm ứng</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_88" class="ph eph" onclick="ShowHelp(88, 2);">Kích thước</div>
            </td>
            <td id="c88_1" class="v">102.6 x 60.6 x 12.7 mm</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_100" class="ph eph" onclick="ShowHelp(100, 2);">Trọng lượng (g)</div>
            </td>
            <td id="c100_1" class="v">111.4</td>
        </tr>
        <tr class="r">
            <td rowspan="3" class="g" valign="top">
            <div class="gh">Thông tin pin</div>
            </td>
            <td class="p f">Loại pin</td>
            <td id="c83_1" class="v f">Pin Nokia BL-4U</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_84" class="ph eph" onclick="ShowHelp(84, 2);">Dung lượng pin</div>
            </td>
            <td id="c84_1" class="v">1200 mAh</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Pin có thể tháo rời</div>
            </td>
            <td id="c6462_1" class="v">Có</td>
        </tr>
        <tr class="r">
            <td rowspan="13" class="g" valign="top">
            <div class="gh">Kết nối &amp; Cổng giao tiếp</div>
            </td>
            <td id="prop_65" class="p f eph" onclick="ShowHelp(65, 2);">3G</td>
            <td id="c65_1" class="v f">HSDPA, 7.2 Mbps; HSUPA, 5.76 Mbps</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">4G</div>
            </td>
            <td id="c6463_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Loại Sim</div>
            </td>
            <td id="c6339_1" class="v">Micro SIM</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_60" class="ph eph" onclick="ShowHelp(60, 2);">Khe gắn Sim</div>
            </td>
            <td id="c60_1" class="v">2 SIM 2 sóng</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_66" class="ph eph" onclick="ShowHelp(66, 2);">Wifi</div>
            </td>
            <td id="c66_1" class="v">Wi-Fi 802.11 b/g/n</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_68" class="ph eph" onclick="ShowHelp(68, 2);">GPS</div>
            </td>
            <td id="c68_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_69" class="ph eph" onclick="ShowHelp(69, 2);">Bluetooth</div>
            </td>
            <td id="c69_1" class="v">Có, V3.0 với A2DP</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_61" class="ph eph" onclick="ShowHelp(61, 2);">GPRS/EDGE</div>
            </td>
            <td id="c61_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_48" class="ph eph" onclick="ShowHelp(48, 2);">Jack tai nghe</div>
            </td>
            <td id="c48_1" class="v">3.5 mm</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">NFC</div>
            </td>
            <td id="c6464_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_71" class="ph eph" onclick="ShowHelp(71, 2);">Kết nối USB</div>
            </td>
            <td id="c71_1" class="v">Micro USB</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Kết nối khác</div>
            </td>
            <td id="c5199_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Cổng sạc</div>
            </td>
            <td id="c85_1" class="v">Micro USB</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Giải trí &amp; Ứng dụng</div>
            </td>
            <td id="prop_32" class="p f eph" onclick="ShowHelp(32, 2);">Xem phim</td>
            <td id="c32_1" class="v f">3GP, MP4</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_33" class="ph eph" onclick="ShowHelp(33, 2);">Nghe nhạc</div>
            </td>
            <td id="c33_1" class="v">MP3, AAC, AMR</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_36" class="ph eph" onclick="ShowHelp(36, 2);">Ghi âm</div>
            </td>
            <td id="c36_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6039" class="ph eph" onclick="ShowHelp(6039, 2);">Giới hạn cuộc gọi</div>
            </td>
            <td id="c6039_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_34" class="ph eph" onclick="ShowHelp(34, 2);">FM radio</div>
            </td>
            <td id="c34_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Chức năng khác</div>
            </td>
            <td id="c43_1" class="v">Mạng xã hội ảo<br>Youtube</td>
        </tr>
    </tbody>
</table>', N'<h2 align="center">Nokia Asha 503 – Thiết kế bền bỉ, kết nối nhanh chóng, 2 SIM</h2><p style="text-align: justify;" align=""><strong><br>Nokia Asha 503</strong> có thiết kế hình chữ nhật trông khá góc cạnh. Điều thí vị là máy được bọc lớp vỏ giả kinh độc đáo, trông như chúng được đông lạnh trong đá. Ngoài việc trang trí, lớp vỏ này còn giúp tăng độ bền và thêm cảm giác mạnh mẽ cho máy.</p><p align="center"><em><img title="Thiết kế độc đáo của Nokia Asha 503" src="http://cdn.tgdd.vn/Products/Images/42/60678/nokia-asha-503-dual-sim_clip_image002.jpg" alt="Nokia Asha 503 thiết kế độc đáo " height="400" width="600"></em><br><em>Thiết kế độc đáo của Nokia Asha 503</em></p><p style="text-align: justify;" align=""><br>Với lõi máy sử dụng màu sắc mạnh mẽ ẩn dưới lớp vỏ trong suốt, <strong>Asha 503</strong> luôn luôn nổi bật với nét thiết kế độc đáo. Và những tính năng cao cấp khác như màn hình Corning Gorilla Glass 2 chống xước giúp trở thành chiếc điện thoại bền bỉ và chắc chắn.</p><p align="center"><em><img title="Asha 503 có nhiều màu sắc rực rỡ" src="http://cdn.tgdd.vn/Products/Images/42/60678/nokia-asha-503-dual-sim_clip_image004.jpg" alt="Asha 503 có nhiều màu sắc rực rỡ" height="400" width="600"></em><br><em>Asha 503 có nhiều màu sắc rực rỡ</em></p><p style="text-align: justify;" align=""><strong><br>Nokia Asha 503 Dual Sim</strong> có dạng thanh với màn hình 3 inch nhỏ gọn, thiết kế vừa lòng bàn tay người dùng, đặc biệt là người dân Việt Nam. Điểm thu hút các bạn trẻ đó là máy có nhiều màu sắc để bạn chọn lựa sao cho thích hợp với cá tính của mình nhất.</p>&nbsp;<h3 align=""><br>Đầy đủ kết nối với tốc độ cao</h3><p style="text-align: justify;" align="">Mặc dù là điện thoại tính năng tuy nhiên <strong>Asha 503</strong> được Nokia trang bị đầy đủ kết nối như một smartphone cao cấp. Máy hỗ trợ kết nối Wifi, 2G, 3.5G cho tốc độ kết nối tốc độ cao và mọi lúc mọi nơi. Việc chia sẻ với bạn bè, chạy ứng dụng, xem video và tải ảnh lên các mạng xã hội, tất cả đều nhanh hơn với kết nối 3.5G.</p><p align="center"><img title="Asha 503 cho bạn kết nối nhanh chóng mọi lúc mọi nơi" src="http://cdn.tgdd.vn/Products/Images/42/60678/nokia-asha-503-dual-sim_clip_image006.jpg" alt="Nokia Asha 503 kết nối internet" height="450" width="600"><br><em>Asha 503 cho bạn kết nối nhanh chóng mọi lúc mọi nơi</em></p>&nbsp;<h3 align=""><br>Hỗ trợ 2 SIM tiện lợi</h3><p style="text-align: justify;" align="">Khi sử dụng 2 SIM, bạn sẽ có khả năng tận dụng tốt nhất gói cước của các nhà mạng khác nhau. Một để tải dữ liệu, một để nhắn tin. Sử dụng nhiều SIM khác nhau để tiết kiệm chi phí. <strong>Nokia Asha 503</strong> hỗ trợ ghi nhớ cài đặt lên tới năm SIM khác nhau nên bạn có thể chuyển đổi qua lại thật dễ dàng.</p><p align="center"><em><img title="Hữu ích khi Nokia Asha 503 được trang bị 2 SIM" src="http://cdn.tgdd.vn/Products/Images/42/60678/nokia-asha-503-dual-sim_clip_image008.jpg" alt="Asha 503 2 SIM tiện lợi" height="400" width="600"></em><br><em>Hữu ích khi Nokia Asha 503 được trang bị 2 SIM tiện lợi</em></p>&nbsp;<h3 align=""><br>Máy ảnh 5MP, hỗ trợ đèn flash, chia sẻ nhanh chóng</h3><p style="text-align: justify;" align="">Với <strong>Asha 503</strong>, bạn có thể tự tin chia sẻ những bức ảnh bạn chụp với camera 5MP và đèn flash gắn sẵn. Nhờ vậy, bạn có thể lưu lại những hình ảnh có độ sáng tốt hơn, đặc biệt là trong bóng tối.</p><p align="center"><em><img title="Nokia Asha 503 với máy ảnh 5MP hỗ trợ đèn flash" src="http://cdn.tgdd.vn/Products/Images/42/60678/nokia-asha-503-dual-sim_clip_image014.jpg" alt="Nokia Asha 503 máy ảnh 5MP hỗ trợ đèn flash" height="450" width="600"></em><br><em>Máy ảnh 5MP hỗ trợ đèn flash</em></p><p style="text-align: justify;" align=""><br>Tính năng chụp ảnh cũng hết sức tiện dụng, chụp và tải ảnh lên cực nhanh. Chỉ cần vuốt nhẹ từ màn hình khóa vào ứng dụng chụp ảnh và bạn đã sẵn sàng ngay. Chia sẻ cũng trở nên rất dễ dàng – chỉ cần một lần chạm để tải ảnh ngay lên Facebook.</p>&nbsp;<h3 align=""><br>Truy cập nhanh với Fastlane</h3><p style="text-align: justify;" align="">Các smartphone cao cấp có những phím tắt riêng để truy cập nhanh những ứng dụng gần nhất và <strong>Nokia Asha 503 Dual Sim </strong>cũng làm được điều đó. Với Fastlane giúp bạn truy cập nhanh các ứng dụng, số liên lạc, cập nhật Facebook, Twitter gần đây và các sự kiện tiếp theo trong lịch của bạn trên cùng một màn hình. Nó còn hiển thị cả số lượng người thích và bình luận trên các bức ảnh và bài đăng của bạn trên Facebook.</p><p align="center"><img title="Trải nghiệm thú vị với FastLane trên Asha 503" src="http://cdn.tgdd.vn/Products/Images/42/60678/nokia-asha-503-dual-sim_clip_image012.jpg" alt="Trải nghiệm thú vị với FastLane trên Asha 503" height="450" width="600"> <br><em>Trải nghiệm thú vị với FastLane như trên một smartphone đẳng cấp </em></p>&nbsp;<h3 align=""><br>Tóm lại</h3><p style="text-align: justify;" align=""><strong>Nokia Asha 503 </strong>không có những tính năng đình đám như các smartphone cao cấp, nhưng chúng lại rất đầy đủ các tính năng cơ bản, đặc biệt là màn hình được trang bị kính cường lực chống xước cùng đầy đủ kết nối để chia sẻ hình ảnh, trạng thái lên mạng xã hội một cách nhanh chóng. <strong>Asha 503</strong> phù hợp cho các bạn trẻ thích một điện thoại giá cả phải chăng, thiết kế bền bỉ, trẻ trung mà đầy đủ tính năng.</p><p align="right"><strong>Hữu Tình</strong></p><table class="advantage"><tbody><tr><td><h3>Ưu điểm</h3><ul>
	<li>Thiết kế bền bỉ, trẻ trung và nhiều màu sắc.</li>
	<li>Đầy đủ kết nối 3G, Wifi tốc độ nhanh chóng.</li>
	<li>Hỗ trợ 2 SIM tiện dụng.</li>
	<li>Máy ảnh 5MP, hỗ trợ đèn flash.</li>
	<li>Tính năng truy cập nhanh Fastlane hữu ích.</li>
</ul></td><td><h3>Nhược điểm</h3><ul>
	<li>Bộ nhớ trong thấp, chỉ 150MB.</li>
</ul></td></tr></tbody></table>', 3, 99, 0, 5, 0, CAST(N'2014-03-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (19, N'Samsung Galaxy S5', N'/Content/Images/Samsung/Samsung Galaxy S5.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/Samsung/Hinh360-Samsung/dien-thoai-di-dong-samsung-galaxy-note-2-n7100-1.jpg', N'" /> </a>', CAST(1670000 AS Decimal(18, 0)), CAST(2800000 AS Decimal(18, 0)), N'<p>M&agrave;n h&igrave;nh: Full HD, 5.1&quot;, 1080 x 1920 pixels CPU: Qualcomm Snapdragon 800, 4 nh&acirc;n, 2.5 GHz RAM 2 GB Hệ điều h&agrave;nh: Android 4.4 (KitKat) Camera ch&iacute;nh: 16 MP, Quay phim FullHD 1080p@60fps Camera phụ: 2.0 MP Bộ nhớ trong: 32 GB Thẻ nhớ ngo&agrave;i đến: 64 GB Dung lượng pin: 2800 mAh</p>
', N'<p><img src="http://cdn.tgdd.vn/Products/Images/42/60809/Kit/Samsung-Galaxy-S5.jpg" /></p>

<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td rowspan="2">
			<p>Th&ocirc;ng tin chung</p>
			</td>
			<td>Hệ điều h&agrave;nh</td>
			<td>Android 4.4 (KitKat)</td>
		</tr>
		<tr>
			<td>
			<p>Ng&ocirc;n ngữ</p>
			</td>
			<td>Tiếng Việt, Tiếng Anh</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>Loại m&agrave;n h&igrave;nh</td>
			<td>Super AMOLED</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;u m&agrave;n h&igrave;nh</p>
			</td>
			<td>16 triệu m&agrave;u</td>
		</tr>
		<tr>
			<td>
			<p>Chuẩn m&agrave;n h&igrave;nh</p>
			</td>
			<td>Full HD</td>
		</tr>
		<tr>
			<td>
			<p>Độ ph&acirc;n giải</p>
			</td>
			<td>1080 x 1920 pixels</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh rộng</p>
			</td>
			<td>5.1&quot;</td>
		</tr>
		<tr>
			<td>
			<p>C&ocirc;ng nghệ cảm ứng</p>
			</td>
			<td>Cảm ứng điện dung đa điểm</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Chụp h&igrave;nh &amp; Quay phim</p>
			</td>
			<td>Camera sau</td>
			<td>16 MP</td>
		</tr>
		<tr>
			<td>
			<p>Camera trước</p>
			</td>
			<td>2.0 MP</td>
		</tr>
		<tr>
			<td>
			<p>Đ&egrave;n Flash</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>T&iacute;nh năng camera</p>
			</td>
			<td>Tự động lấy n&eacute;t, chạm lấy n&eacute;t<br />
			Nhận diện khu&ocirc;n mặt, nụ cười<br />
			Chống rung</td>
		</tr>
		<tr>
			<td>
			<p>Quay phim</p>
			</td>
			<td>Quay phim FullHD 1080p@60fps</td>
		</tr>
		<tr>
			<td>
			<p>Videocall</p>
			</td>
			<td>Hỗ trợ VideoCall qua Skype</td>
		</tr>
		<tr>
			<td rowspan="5">
			<p>CPU &amp; RAM</p>
			</td>
			<td>Tốc độ CPU</td>
			<td>2.5 GHz</td>
		</tr>
		<tr>
			<td>
			<p>Số nh&acirc;n</p>
			</td>
			<td>4 nh&acirc;n</td>
		</tr>
		<tr>
			<td>
			<p>Chipset</p>
			</td>
			<td>Qualcomm Snapdragon 800</td>
		</tr>
		<tr>
			<td>
			<p>RAM</p>
			</td>
			<td>2 GB</td>
		</tr>
		<tr>
			<td>
			<p>Chip đồ họa (GPU)</p>
			</td>
			<td>Adreno 330</td>
		</tr>
		<tr>
			<td rowspan="4">
			<p>Bộ nhớ &amp; Lưu trữ</p>
			</td>
			<td>Danh bạ</td>
			<td>Kh&ocirc;ng giới hạn</td>
		</tr>
		<tr>
			<td>
			<p>Bộ nhớ trong (ROM)</p>
			</td>
			<td>32 GB</td>
		</tr>
		<tr>
			<td>
			<p>Thẻ nhớ ngo&agrave;i</p>
			</td>
			<td>MicroSD (T-Flash)</td>
		</tr>
		<tr>
			<td>
			<p>Hỗ trợ thẻ tối đa</p>
			</td>
			<td>64 GB</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Thiết kế &amp; Trọng lượng</p>
			</td>
			<td>Kiểu d&aacute;ng</td>
			<td>Thanh + Cảm ứng</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước</p>
			</td>
			<td>142.0 x 72.5 x 8.1 mm</td>
		</tr>
		<tr>
			<td>
			<p>Trọng lượng (g)</p>
			</td>
			<td>145</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Th&ocirc;ng tin pin</p>
			</td>
			<td>Loại pin</td>
			<td>Pin chuẩn Li-Ion</td>
		</tr>
		<tr>
			<td>
			<p>Dung lượng pin</p>
			</td>
			<td>2800 mAh</td>
		</tr>
		<tr>
			<td>
			<p>Pin c&oacute; thể th&aacute;o rời</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td rowspan="13">
			<p>Kết nối &amp; Cổng giao tiếp</p>
			</td>
			<td>3G</td>
			<td>HSDPA, 42 Mbps; HSUPA, 5.76 Mbps</td>
		</tr>
		<tr>
			<td>
			<p>4G</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Loại Sim</p>
			</td>
			<td>Nano SIM</td>
		</tr>
		<tr>
			<td>
			<p>Khe gắn Sim</p>
			</td>
			<td>1 Sim</td>
		</tr>
		<tr>
			<td>
			<p>Wifi</p>
			</td>
			<td>Wi-Fi 802.11 a/b/g/n/ac, dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot</td>
		</tr>
		<tr>
			<td>
			<p>GPS</p>
			</td>
			<td>A-GPS v&agrave; GLONASS</td>
		</tr>
		<tr>
			<td>
			<p>Bluetooth</p>
			</td>
			<td>V4.0 with A2DP</td>
		</tr>
		<tr>
			<td>
			<p>GPRS/EDGE</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Jack tai nghe</p>
			</td>
			<td>3.5 mm</td>
		</tr>
		<tr>
			<td>
			<p>NFC</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối USB</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối kh&aacute;c</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Cổng sạc</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Giải tr&iacute; &amp; Ứng dụng</p>
			</td>
			<td>Xem phim</td>
			<td>3GP, MP4, AVI, WMV, H.263, H.264(MPEG4-AVC)</td>
		</tr>
		<tr>
			<td>
			<p>Nghe nhạc</p>
			</td>
			<td>MP3, WAV, WMA, eAAC+, AMR</td>
		</tr>
		<tr>
			<td>
			<p>Ghi &acirc;m</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Giới hạn cuộc gọi</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>FM radio</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Chức năng kh&aacute;c</p>
			</td>
			<td>Mạng x&atilde; hội ảo<br />
			Google Search, Maps, Gmail, YouTube, Google Talk, Picasa<br />
			Micro chuy&ecirc;n dụng chống ồn</td>
		</tr>
	</tbody>
</table>
', N'<h2>Samsung Galaxy S5 - T&iacute;nh năng mạnh mẽ trong vẻ ngo&agrave;i chưa đột ph&aacute;</h2>

<p>Cuối c&ugrave;ng, sau nhiều đồn đo&aacute;n v&agrave; tr&ocirc;ng đợi, chiếc <strong>Galaxy S5</strong> đ&atilde; ch&iacute;nh thức ra mắt tại MWC 2014, trở th&agrave;nh si&ecirc;u phẩm điện thoại th&ocirc;ng minh mới nhất, mạnh mẽ nhất của h&atilde;ng điện thoại H&agrave;n Quốc n&agrave;y.</p>

<h3><br />
Cấu h&igrave;nh với những th&ocirc;ng số khủng</h3>

<p>Khi ra mắt si&ecirc;u phẩm của m&igrave;nh, <strong>Samsung</strong> c&ocirc;ng bố những th&ocirc;ng số cấu h&igrave;nh khủng của S5. M&aacute;y sử dụng CPU <strong>Snapdragon 800</strong>, l&agrave; d&ograve;ng chip di động mạnh mẽ nhất của Qualcomn. Tuy nhi&ecirc;n, những chiếc smartphone, tablet cao cấp nhất cũng chỉ được trang bị d&ograve;ng chip c&oacute; xung nhịp 2.3 GHz, trong khi S5 được nh&agrave; sản xuất n&acirc;ng cấp l&ecirc;n xung nhịp đến 2.5 GHz.</p>

<p>Với cấu h&igrave;nh như thế n&agrave;y, cầm chiếc <strong>Galaxy S5</strong> tr&ecirc;n tay, bạn kh&ocirc;ng chỉ thoả m&atilde;n với tốc độ xử l&yacute; t&aacute;c vụ, chơi game đồ hoạ cao một c&aacute;ch mượt m&agrave;, chạy đa nhiệm một c&aacute;ch trơn tru, chiếc điện thoại tiềm ẩn những sức mạnh độc đ&aacute;o hơn rất nhiều như: xem v&agrave; quay phim 4K, hỗ trợ camera độ ph&acirc;n giải cực cao, m&agrave;n h&igrave;nh ph&acirc;n giải cao...</p>

<p><img alt="Samsung Galaxy S5" src="http://cdn.tgdd.vn/Products/Images/42/60809/samsung-galaxy-s5_clip_image001.jpg" /><br />
<em>Si&ecirc;u phẩm Galaxy S5 ch&iacute;nh thức ra mắt, sở hữu cấu h&igrave;nh mạnh mẽ</em></p>

<p>M&aacute;y hoạt động với nguồn pin 2.800 mAh v&agrave; phi&ecirc;n bản Android 4.4 KitKat mới nhất, khiến bạn ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m khi c&agrave;i đặt bất cứ ứng dụng n&agrave;o v&agrave;o m&aacute;y v&agrave; kh&ocirc;ng cần c&oacute; ch&uacute;t bận t&acirc;m về khả năng chạy v&agrave; xử l&yacute;. Dung lượng pin 2.800 mAh được <strong>Samsung</strong> tuy&ecirc;n bố đủ để S5 đ&agrave;m thoại trong 21 giờ, c&oacute; thể th&aacute;o rời, thay thế khi cần thiết. Pin cũng l&agrave; một sự cải tiến đ&aacute;ng kể so với chiếc <strong>Galaxy S4</strong> tiền nhiệm, chỉ đạt 2600 mAh.</p>

<h3><br />
Kết nối mạnh mẽ</h3>

<p><strong>Samsung Galaxy S5</strong> trang bị một cổng micro USB chuẩn 3.0 gi&uacute;p việc truyền tải dữ liệu của điện thoại đến m&aacute;y t&iacute;nh nhanh gấp 10 lần chuẩn 2.0 th&ocirc;ng thường. Cổng USB c&oacute; th&ecirc;m cổng chống nước, l&agrave; một điểm kh&aacute;c biệt so với Galaxy S4.</p>

<p>Đồng thời, m&aacute;y trang bị chuẩn kết nối internet tốc độ cao 4G LTE, Wifi 802.11ac hay c&ograve;n gọi l&agrave; c&ocirc;ng nghệ Wifi thế hệ thứ 5 mang lại tốc độ kết nối nhanh hơn, Bluetooth v&agrave; t&iacute;nh năng độc đ&aacute;o Download Booster cho tốc độ tải l&ecirc;n đến 400 Mbps.</p>

<p><img alt="Galaxy S5 4G LTE và Wifi AC" src="http://cdn.tgdd.vn/Products/Images/42/60809/samsung-galaxy-s5_clip_image006.jpg" /><br />
<em>Kết nối tốc độ cao với 4G LTE v&agrave; Wifi chuẩn AC</em></p>

<h3><br />
Vẻ ngo&agrave;i kh&ocirc;ng đột ph&aacute;</h3>

<p>Nếu bạn li&ecirc;n tục trầm trồ về những cải tiến phần cứng mạnh mẽ v&agrave; cao cấp th&igrave; bạn sẽ c&oacute; đ&ocirc;i ch&uacute;t thất vọng về vẻ ngo&agrave;i chưa tương xứng m&agrave; <strong>Galaxy S5</strong> tr&igrave;nh diễn trong lần ra mắt n&agrave;y. Vẫn l&agrave; thiết kế vỏ nhựa quen thuộc, kh&ocirc;ng c&oacute; bất cứ sự đột ph&aacute; n&agrave;o trong chất liệu. Một cảm gi&aacute;c qu&aacute; quen thuộc kh&ocirc;ng mang đến nhiều sự hứng th&uacute; cho những người d&ugrave;ng y&ecirc;u c&ocirc;ng nghệ.</p>

<p><strong><img alt="Galaxy S5 mặt sau" src="http://cdn.tgdd.vn/Products/Images/42/60809/samsung-galaxy-s5_clip_image002.jpg" /></strong><br />
<em>Mặt sau sản phẩm được thiết kế vỏ nhựa, c&oacute; chấm bi li ti, k&eacute;m sang trọng</em></p>

<p>B&ecirc;n cạnh đ&oacute;, chiếc nắp lưng của <strong> S5</strong> lại nhận nhiều đ&aacute;nh gi&aacute; của giới c&ocirc;ng nghệ rằng n&oacute; hơi kỳ cục khi được thiết kế bằng lớp nhựa, vỏ b&oacute;ng, c&oacute; v&acirc;n nổi với nhiều chi tiết chấm bi li ti. Đ&acirc;y l&agrave; điểm kh&aacute;c biệt kh&aacute; lớn với vỏ giả da của c&aacute;c thế hệ Galaxy Note mới đ&acirc;y, được đ&aacute;nh gi&aacute; l&agrave;m mất điểm sang trọng của si&ecirc;u phẩm mới n&agrave;y.</p>

<p>Thiết bị gần như giữ nguy&ecirc;n thiết kế so với người anh em S4 đ&igrave;nh đ&aacute;m của m&igrave;nh. Tuy nhi&ecirc;n, như n&uacute;p dưới b&oacute;ng của một sự th&agrave;nh c&ocirc;ng, S5 kh&ocirc;ng thoả m&atilde;n người d&ugrave;ng khi chỉ c&oacute; một số chi tiết thay đổi nhẹ như c&aacute;c g&oacute;c m&aacute;y, cạnh khung camera được v&aacute;t vu&ocirc;ng vức hơn một ch&uacute;t.</p>

<p><img alt="Samsung Galaxy S5 tích hợp cảm biến dấu vân tay " src="http://cdn.tgdd.vn/Products/Images/42/60809/samsung-galaxy-s5_clip_image007.jpg" /><br />
<em>Galaxy S5 t&iacute;ch hợp cảm biến dấu v&acirc;n tay </em></p>

<p>Tr&ecirc;n n&uacute;t Home của sản phẩm, Samsung đ&atilde; t&iacute;ch hợp t&iacute;nh năng bảo mật dấu v&acirc;n tay như những lời đồn đo&aacute;n trước đ&acirc;y. Tuy nhi&ecirc;n, để sử dụng t&iacute;nh năng n&agrave;y, người d&ugrave;ng phải qu&eacute;t tay theo chiều dọc chứ kh&ocirc;ng chỉ chạm nhẹ nh&agrave;ng như Touch ID tr&ecirc;n <a href="http://www.thegioididong.com/dtdd/iphone-5s-64gb" target="_blank">iPhone 5s</a>.</p>

<p>Ngo&agrave;i ra, cảm biến v&acirc;n tay tr&ecirc;n thiết bị c&ograve;n cho ph&eacute;p bạn thanh to&aacute;n trực tuyến th&ocirc;ng qua Paypal. Ph&iacute;a sau m&aacute;y, c&oacute; cảm biến nhịp tim sẽ l&agrave; t&iacute;nh năng quan trọng để người d&ugrave;ng theo d&otilde;i sức khoẻ của m&igrave;nh.</p>

<h3><br />
M&agrave;n h&igrave;nh chống nước si&ecirc;u n&eacute;t, camera khủng</h3>

<p>Một cải tiến rất đ&aacute;ng gi&aacute; tr&ecirc;n Galaxy S5 ch&iacute;nh l&agrave; sở hữu ti&ecirc;u chuẩn IP67 chống thấm nước, bụi, ch&iacute;nh thức trở th&agrave;nh đối thủ nặng k&yacute; với chiếc smartphone &quot;kh&ocirc;ng sợ nước&quot; của <a href="http://www.thegioididong.com/sony-xperia" target="_blank">Sony Xperia</a>. Tr&ecirc;n sản phẩm, bạn sẽ kh&ocirc;ng thể t&igrave;m thấy bất cứ khe hở n&agrave;o để bụi bẩn hay nước c&oacute; thể thấm qua, gi&uacute;p bạn y&ecirc;n t&acirc;m sử dụng thiết bị trong những điều kiện khắc nghiệt.</p>

<p>V&agrave;, theo cam kết của Samsung, bạn c&oacute; thể ng&acirc;m điện thoại trong nước 30 ph&uacute;t m&agrave; vẫn kh&ocirc;ng l&agrave;m điện thoại hư hỏng g&igrave;. M&agrave;n h&igrave;nh 5.1 inch, nhỉnh hơn đ&ocirc;i ch&uacute;t so với S4 v&agrave; đạt chuẩn hiển thị Full HD, cho bạn những trải nghiệm xem phim, game,.. đ&atilde; mắt.</p>

<p><strong><img alt="Samsung Galaxy S5 IP67 chống thấm nước và bụi" src="http://cdn.tgdd.vn/Products/Images/42/60809/samsung-galaxy-s5_clip_image005.jpg" /></strong><br />
<em>Ti&ecirc;u chuẩn IP67 chống thấm nước v&agrave; bụi, hiển thị Full HD</em></p>

<p>Si&ecirc;u phẩm mới của <strong>Samsung</strong> được trang bị camera khủng l&ecirc;n đến 16 MP, hỗ trợ đ&egrave;n Flash Led, chế độ HDR ti&ecirc;n tiến. Camera cho bạn những t&iacute;nh năng chụp ảnh xuất sắc, vốn c&oacute; của Samsung như chọn ảnh đẹp nhất, chụp đồng thời camera trước v&agrave; sau.</p>

<p>Đặc biệt nhất tr&ecirc;n <strong>S5</strong> ch&iacute;nh l&agrave; khả năng lấy n&eacute;t si&ecirc;u nhanh. Samsung khẳng định si&ecirc;u phẩm của họ c&oacute; khả năng lấy n&eacute;t nhanh nhất so với bất kỳ chiếc smartphone n&agrave;o, chỉ 0,3 gi&acirc;y. Camera trước đạt 2.1 MP cho bạn h&igrave;nh ảnh chất lượng khi chat voice hay &quot;tự sướng&quot;.</p>

<p><img alt="Galaxy S5 Camera 16MP" src="http://cdn.tgdd.vn/Products/Images/42/60809/samsung-galaxy-s5_clip_image008.jpg" /><br />
<em>Camera ch&iacute;nh 16MP chụp ảnh, quay phim chất lượng cao</em></p>

<h3><br />
T&oacute;m lại:</h3>

<p>Sau rất nhiều lời đồn đo&aacute;n v&agrave; chờ đợi, người d&ugrave;ng đ&atilde; chứng kiến sự ra đời của chiếc smartphone cao cấp <strong>Samsung Galaxy S5</strong>. D&ugrave; c&oacute; nhiều tranh c&atilde;i trong thiết kế v&agrave; một số t&iacute;nh năng cuả sản phẩm nhưng đ&acirc;y vẫn l&agrave; một si&ecirc;u phẩm hứa hẹn l&agrave;m h&agrave;i l&ograve;ng những người d&ugrave;ng c&ocirc;ng nghệ cao cấp.</p>

<p>Những t&iacute;nh năng cao cấp mới t&iacute;ch hợp như cảm biến dấu v&acirc;n tay, camera khủng, m&agrave;n h&igrave;nh chống thấm nước c&ugrave;ng bộ xử l&yacute; si&ecirc;u mạnh mẽ sẽ l&agrave; những điểm cộng khiến bạn muốn thử chạm v&agrave;o, trải nghiệm c&ugrave;ng si&ecirc;u phẩm n&agrave;y.</p>

<p><strong>Bi&ecirc;n Th&agrave;nh</strong></p>

<table>
	<tbody>
		<tr>
			<td>
			<h3>Ưu điểm</h3>

			<ul>
				<li>Chống thấm nước v&agrave; bụi theo ti&ecirc;u chuẩn IP 67.</li>
				<li>Mạnh mẽ với Snapdragon 800, xung nhịp 2.5GHz.</li>
				<li>M&agrave;n h&igrave;nh Full HD sắc n&eacute;t, rộng r&atilde;i với 5.1inch.</li>
				<li>Camera 16MP&nbsp;lấy n&eacute;t nhanh, 0.3 gi&acirc;y.</li>
				<li>Hệ điều h&agrave;nh mới Android 4.4 KitKat.</li>
			</ul>
			</td>
			<td>
			<h3>Nhược điểm</h3>

			<ul>
				<li>Thiết kế thiếu độc đ&aacute;o v&agrave; đột ph&aacute;.</li>
				<li>Sử dụng vỏ nhựa, chưa thực sự sang trọng.</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>
', 4, 99, 5, 0, 1, CAST(N'2014-03-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (20, N'Samsung Galaxy S4', N'/Content/Images/Samsung/Samsung Galaxy S4.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/Samsung/Hinh360-Samsung/dien-thoai-di-dong-samsung-galaxy-note-2-n7100-1.jpg', N'" /> </a>', CAST(3990000 AS Decimal(18, 0)), CAST(4500000 AS Decimal(18, 0)), N'<p>M&agrave;n h&igrave;nh: Full HD, 5.0&quot;, 1080 x 1920 pixels CPU: Exynos 5410, 8 nh&acirc;n, 8 nh&acirc;n (2 l&otilde;i 4 nh&acirc;n: Quad-core 1.6 GHz Cortex-A15 - Quad-core 1.2 GHz Cortex-A7) RAM 2 GB Hệ điều h&agrave;nh: Android 4.2.2 (Jelly Bean) Camera ch&iacute;nh: 13 MP, Quay phim FullHD 1080p@30fps Camera phụ: 2.1 MP Bộ nhớ trong: 16 GB Thẻ nhớ ngo&agrave;i đến: 64 GB Dung lượng pin: 2600 mAh</p>
', N'<p><img src="http://cdn.tgdd.vn/Products/Images/42/58077/Kit/Samsung-Galaxy-S4-mo-ta-chuc-nang.jpg" /></p>

<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td rowspan="2">
			<p>Th&ocirc;ng tin chung</p>
			</td>
			<td>Hệ điều h&agrave;nh</td>
			<td>Android 4.2.2 (Jelly Bean)</td>
		</tr>
		<tr>
			<td>
			<p>Ng&ocirc;n ngữ</p>
			</td>
			<td>Tiếng Việt, Tiếng Anh</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>Loại m&agrave;n h&igrave;nh</td>
			<td>Super AMOLED</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;u m&agrave;n h&igrave;nh</p>
			</td>
			<td>16 triệu m&agrave;u</td>
		</tr>
		<tr>
			<td>
			<p>Chuẩn m&agrave;n h&igrave;nh</p>
			</td>
			<td>Full HD</td>
		</tr>
		<tr>
			<td>
			<p>Độ ph&acirc;n giải</p>
			</td>
			<td>1080 x 1920 pixels</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh rộng</p>
			</td>
			<td>5.0&quot;</td>
		</tr>
		<tr>
			<td>
			<p>C&ocirc;ng nghệ cảm ứng</p>
			</td>
			<td>Cảm ứng điện dung đa điểm</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Chụp h&igrave;nh &amp; Quay phim</p>
			</td>
			<td>Camera sau</td>
			<td>13 MP</td>
		</tr>
		<tr>
			<td>
			<p>Camera trước</p>
			</td>
			<td>2.1 MP</td>
		</tr>
		<tr>
			<td>
			<p>Đ&egrave;n Flash</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>T&iacute;nh năng camera</p>
			</td>
			<td>Chạm lấy n&eacute;t<br />
			Nhận diện khu&ocirc;n mặt, nụ cười<br />
			Chống rung</td>
		</tr>
		<tr>
			<td>
			<p>Quay phim</p>
			</td>
			<td>Quay phim FullHD 1080p@30fps</td>
		</tr>
		<tr>
			<td>
			<p>Videocall</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td rowspan="5">
			<p>CPU &amp; RAM</p>
			</td>
			<td>Tốc độ CPU</td>
			<td>8 nh&acirc;n (2 l&otilde;i 4 nh&acirc;n: Quad-core 1.6 GHz Cortex-A15 - Quad-core 1.2 GHz Cortex-A7)</td>
		</tr>
		<tr>
			<td>
			<p>Số nh&acirc;n</p>
			</td>
			<td>8 nh&acirc;n</td>
		</tr>
		<tr>
			<td>
			<p>Chipset</p>
			</td>
			<td>Exynos 5410</td>
		</tr>
		<tr>
			<td>
			<p>RAM</p>
			</td>
			<td>2 GB</td>
		</tr>
		<tr>
			<td>
			<p>Chip đồ họa (GPU)</p>
			</td>
			<td>PowerVR SGX544MP3</td>
		</tr>
		<tr>
			<td rowspan="4">
			<p>Bộ nhớ &amp; Lưu trữ</p>
			</td>
			<td>Danh bạ</td>
			<td>Kh&ocirc;ng giới hạn</td>
		</tr>
		<tr>
			<td>
			<p>Bộ nhớ trong (ROM)</p>
			</td>
			<td>16 GB</td>
		</tr>
		<tr>
			<td>
			<p>Thẻ nhớ ngo&agrave;i</p>
			</td>
			<td>MicroSD (T-Flash)</td>
		</tr>
		<tr>
			<td>
			<p>Hỗ trợ thẻ tối đa</p>
			</td>
			<td>64 GB</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Thiết kế &amp; Trọng lượng</p>
			</td>
			<td>Kiểu d&aacute;ng</td>
			<td>Thanh + Cảm ứng</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước</p>
			</td>
			<td>136.6 x 69.8 x 7.9 mm</td>
		</tr>
		<tr>
			<td>
			<p>Trọng lượng (g)</p>
			</td>
			<td>235</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Th&ocirc;ng tin pin</p>
			</td>
			<td>Loại pin</td>
			<td>Pin chuẩn Li-Ion</td>
		</tr>
		<tr>
			<td>
			<p>Dung lượng pin</p>
			</td>
			<td>2600 mAh</td>
		</tr>
		<tr>
			<td>
			<p>Pin c&oacute; thể th&aacute;o rời</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td rowspan="13">
			<p>Kết nối &amp; Cổng giao tiếp</p>
			</td>
			<td>3G</td>
			<td>HSDPA, 42 Mbps; HSUPA, 5.76 Mbps</td>
		</tr>
		<tr>
			<td>
			<p>4G</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Loại Sim</p>
			</td>
			<td>Micro SIM</td>
		</tr>
		<tr>
			<td>
			<p>Khe gắn Sim</p>
			</td>
			<td>1 Sim</td>
		</tr>
		<tr>
			<td>
			<p>Wifi</p>
			</td>
			<td>Wi-Fi 802.11 a/b/g/n, DLNA, Wi-Fi Direct, dual-band, Wi-Fi hotspot</td>
		</tr>
		<tr>
			<td>
			<p>GPS</p>
			</td>
			<td>A-GPS v&agrave; GLONASS</td>
		</tr>
		<tr>
			<td>
			<p>Bluetooth</p>
			</td>
			<td>C&oacute;, V4.0 với A2DP, EDR</td>
		</tr>
		<tr>
			<td>
			<p>GPRS/EDGE</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Jack tai nghe</p>
			</td>
			<td>3.5 mm</td>
		</tr>
		<tr>
			<td>
			<p>NFC</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối USB</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối kh&aacute;c</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Cổng sạc</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Giải tr&iacute; &amp; Ứng dụng</p>
			</td>
			<td>Xem phim</td>
			<td>MP4, WMV, H.263, H.264(MPEG4-AVC), Xvid, DivX</td>
		</tr>
		<tr>
			<td>
			<p>Nghe nhạc</p>
			</td>
			<td>MP3, WAV, eAAC+, AC3, FLAC</td>
		</tr>
		<tr>
			<td>
			<p>Ghi &acirc;m</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Giới hạn cuộc gọi</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>FM radio</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Chức năng kh&aacute;c</p>
			</td>
			<td>Mạng x&atilde; hội ảo<br />
			Google Search, Maps, Gmail, YouTube, Calendar, Google Talk, Picasa<br />
			Micro chuy&ecirc;n dụng chống ồn<br />
			50 GB lưu trữ Dropbox</td>
		</tr>
	</tbody>
</table>
', N'<h2>Samsung Galaxy S4 &ndash; Đẳng cấp của điện thoại th&ocirc;ng minh</h2>

<p><br />
<a href="http://www.thegioididong.com/dtdd-samsung" target="_blank">Samsung</a> với d&ograve;ng điện thoại th&ocirc;ng minh <a href="http://www.thegioididong.com/samsung-galaxy" target="_blank">Galaxy</a> đang thực sự l&agrave;m khuấy đảo thị trường smartphone thế giới. Với <a href="http://www.thegioididong.com/dtdd/samsung-galaxy-s3-i9300" target="_blank">Galaxy S3</a>, Samsung đ&atilde; vượt qua c&aacute;i b&oacute;ng của Apple v&agrave; ghi dấu ấn t&ecirc;n m&igrave;nh trở th&agrave;nh nh&agrave; sản xuất smartphone lớn nhất thế giới.&nbsp;<strong>Galaxy S4</strong>&nbsp;l&agrave; smartphone cao cấp nhất của Samsung trong năm 2013. V&agrave; đ&acirc;y được hứa hẹn sẽ trở th&agrave;nh một quả bom tấn trong l&agrave;ng c&ocirc;ng nghệ trong năm nay nhờ một thiết kế đẹp, một cấu h&igrave;nh cực mạnh c&ugrave;ng h&agrave;ng loạt những t&iacute;nh năng th&ocirc;ng minh.</p>

<p><br />
<img alt=" điện thoại samsung galaxy S4" src="http://cdn.tgdd.vn/Products/Images/42/58077/GALAXYS4ProductImage4.jpg" /><br />
<em>Smartphone Samsung Galaxy S4</em></p>

<p>&nbsp;</p>

<h3><br />
Thiết kế mỏng v&agrave; nhẹ đến kinh ngạc</h3>

<p>Với m&agrave;n h&igrave;nh l&ecirc;n đến 5 inch nhưng Samsung Galaxy S4 vẫn giữ nguy&ecirc;n độ lớn gần như tương tự so với người tiền nhiệm <a href="http://www.thegioididong.com/dtdd/samsung-galaxy-s3-i9300" target="_blank">Galaxy S3</a>, thậm ch&iacute; m&aacute;y c&ograve;n mỏng v&agrave; nhẹ hơn so với người tiền nhiệm khi c&oacute; độ d&agrave;y chỉ 7,9mm v&agrave; trọng lượng chỉ 130g. Viền giả kim loại bao quanh th&acirc;n m&aacute;y cộng với một v&acirc;n ch&igrave;m được phủ ở nắp lưng tạo cho Galaxy S4 c&oacute; vẻ bề ngo&agrave;i rất cứng c&aacute;p v&agrave; sang trọng.</p>

<p><img alt="Galaxy S4 vớ viền Bezel" src="http://cdn.tgdd.vn/Products/Images/42/58077/galaxy-s4-gallery.jpg" /><br />
<em>Viền giả kim loại cộng lớp v&acirc;n ch&igrave;m nắp lưng tạo điểm nhấn nổi bật cho Galaxy S4</em></p>

<p>&nbsp;</p>

<h3><br />
Bộ vi xử l&yacute; 8 nh&acirc;n mạnh mẽ</h3>

<p>Được trang bị bộ vi xử l&iacute; Exynos 5 Octa 8 nh&acirc;n mạnh mẽ gồm 2 CPU Cortex A15 4 nh&acirc;n tốc độ 1,6 GHz v&agrave; Cortex A7 tốc độ 1,2 GHz,<strong>&nbsp;<a href="http://www.thegioididong.com/samsung-galaxy" target="_blank">Samsung Galaxy</a> S4</strong>&nbsp; sẽ mang đến cho người d&ugrave;ng một hiệu suất vận h&agrave;nh v&ocirc; c&ugrave;ng trơn tru v&agrave; mượt m&agrave; nhưng vẫn đảm bảo tiết kiệm điện năng ti&ecirc;u thụ đến mức tối đa v&igrave; b&ecirc;n trong con chip n&agrave;y thực chất l&agrave; bốn nh&acirc;n&nbsp;ARM&nbsp;Cortex-A15 d&agrave;nh cho c&aacute;c t&aacute;c vụ nặng v&agrave; bốn nh&acirc;n Cortex-A7 để giải quyết những chuyện nhẹ nh&agrave;ng hơn, gi&uacute;p c&acirc;n bằng giữa thời lượng d&ugrave;ng pin v&agrave; hiệu năng cho thiết bị.</p>

<p><br />
Hơn nữa&nbsp;Exynos 5 Octa c&ograve;n c&oacute; khả năng xử l&iacute; h&igrave;nh ảnh 3D nhanh hơn gấp đ&ocirc;i so với c&aacute;c vi xử l&iacute; di động đi trước m&agrave; điển h&igrave;nh l&agrave; Exynos 4 Quad tr&ecirc;n người tiền nhiệm Galaxy S3. Trải nghiệm chơi game hoặc tận hưởng c&aacute;c t&iacute;nh năng giải tr&iacute; tr&ecirc;n&nbsp;<strong>Galaxy S4</strong>&nbsp;sẽ trở n&ecirc;n tuyệt vời hơn bao giờ hết.</p>

<p><br />
<img alt="samsung-galaxy-s4-05" src="http://cdn.tgdd.vn/Products/Images/42/58077/samsung-galaxy-s4-05.png" /><br />
<em>Vi xử l&yacute; 8 nh&acirc;n Exynos 5 Octa với sức mạnh đ&aacute;ng kinh ngạc tr&ecirc;n Galaxy S4</em></p>

<p>&nbsp;</p>

<h3><br />
M&agrave;n h&igrave;nh Super Amoled Full HD sắc n&eacute;t</h3>

<p><br />
<img alt="super-amoled" src="http://cdn.tgdd.vn/Products/Images/42/58077/super-amoled.jpg" /><br />
<em>M&agrave;n h&igrave;nh sắc n&eacute;t với mật độ điểm ảnh l&ecirc;n đến 441ppi</em></p>

<p><br />
<strong>Samsung Galaxy S4</strong>&nbsp;được trang bị m&agrave;n h&igrave;nh full HD Super AMOLED rộng 5 inch, mật độ điểm ảnh m&agrave; m&agrave;n h&igrave;nh mang lại l&agrave; 441ppi, cao hơn nhiều so với S3 v&agrave; cả <a href="http://www.thegioididong.com/dtdd/iphone-5-32gb" target="_blank">iPhone 5</a> v&agrave; ngang bằng với HTC Droid DNA hay <a href="http://www.thegioididong.com/dtdd/sony-xperia-z" target="_blank">Xperia Z</a> đến từ Sony. Với mật độ điểm ảnh n&agrave;y, khả năng hiển thị h&igrave;nh ảnh chi tiết của Samsung Galaxy S4 đ&atilde; vượt qua khả năng ph&acirc;n biệt của mắt người. Với đặc điểm t&aacute;i tạo h&igrave;nh ảnh với m&agrave;u sắc sống động của m&agrave;n h&igrave;nh Super AMOLED, h&igrave;nh ảnh hiển thị tr&ecirc;n Galaxy S4 sẽ trở n&ecirc;n v&ocirc; c&ugrave;ng rực rỡ v&agrave; sắc n&eacute;t.</p>

<p><br />
Mặc d&ugrave; sắc n&eacute;t hơn, g&oacute;c nh&igrave;n rộng hơn, s&aacute;ng hơn nhưng c&ocirc;ng nghệ m&agrave;n h&igrave;nh mới cũng gi&uacute;p tiết kiệm điện năng 25% so với thế hệ cũ. Ngo&agrave;i ra, m&agrave;n h&igrave;nh Super Amoled Full HD của&nbsp;<strong>Galaxy S4</strong>&nbsp;cũng được trang bị c&ocirc;ng nghệ si&ecirc;u cảm ứng. Người d&ugrave;ng c&oacute; thể dễ d&agrave;ng theo t&aacute;c chạm v&agrave; vuốt m&agrave;n h&igrave;nh với găng tay tương tự như Lumia 920</p>

<p>&nbsp;</p>

<h3><br />
M&aacute;y ảnh 13 &ldquo;chấm&rdquo;</h3>

<p><img alt="Galaxy S4 có camera 13mp" src="http://cdn.tgdd.vn/Products/Images/42/58077/galaxy-s4-gallery-camera.jpg" /><br />
<em>M&aacute;y ảnh 13 &ldquo;chấm&rdquo;</em></p>

<p><br />
Với m&aacute;y ảnh l&ecirc;n đến 13 &ldquo;chấm&rdquo;c&ugrave;ng&nbsp;cảm biến BIS (backside illumination), khẩu ống k&iacute;nh F2.2 với đ&egrave;n flash v&agrave; Zero Shot Lag,&nbsp;<strong><a href="http://www.thegioididong.com/samsung-galaxy" target="_blank">Samsung Galaxy</a> S4&nbsp;</strong>sẽ cho bạn những bức ảnh đẹp như bạn đang chụp bằng một m&aacute;y ảnh chuy&ecirc;n nghiệp. Đ&egrave;n flash ph&iacute;a sau c&ugrave;ng chế độ tự động c&acirc;n bằng s&aacute;ng, chống rung sẽ gi&uacute;p m&aacute;y c&oacute; thể chụp trong điều kiện &aacute;nh s&aacute;ng thấp. Ngo&agrave;i ra , Galaxy S4 c&ograve;n c&oacute;&nbsp;Camera ph&iacute;a trước 2.0Mp cũng l&agrave; cảm biến BIS v&agrave; c&oacute; khả năng quay phim FullHD 30fps.</p>

<p><br />
Samsung c&ograve;n trang bị rất nhiều t&iacute;nh năng chụp h&igrave;nh cho&nbsp;<strong>S4</strong>&nbsp;như chụp h&igrave;nh ban đ&ecirc;m, chụp h&igrave;nh c&oacute; &acirc;m thanh (<strong>Sound &amp; Shot</strong>), chụp h&igrave;nh bằng 2 Camera c&ugrave;ng l&uacute;c (<strong>Dual Camera</strong>), chụp h&igrave;nh lưu chuyển động (<strong>Drama Shot</strong>)&hellip;Ngo&agrave;i ra,&nbsp;<strong>Galaxy S4</strong>&nbsp;c&ograve;n c&oacute; khả năng x&oacute;a đối tượng kh&ocirc;ng mong muốn ra khỏi bức ảnh vừa chụp th&ocirc;ng qua t&iacute;nh năng <strong>Eraser</strong> (một t&iacute;nh năng tương tự như Smartshoot của Lumia 920).</p>

<p><img alt="s4-drama-shot" src="http://cdn.tgdd.vn/Products/Images/42/58077/s4-drama-shot.jpg" /><br />
<em>Drama Shot cho ph&eacute;p tạo ra một bức ảnh từ nhiều bức chụp li&ecirc;n tiếp nhau</em></p>

<p><br />
<img alt="s4-dual-camera" src="http://cdn.tgdd.vn/Products/Images/42/58077/s4-dual-camera.jpg" /><br />
<em>Người chụp ảnh v&agrave; người được chụp ảnh sẽ c&ugrave;ng xuất hiện với Dual Camera</em></p>

<p><br />
<img alt="s4-eraser" src="http://cdn.tgdd.vn/Products/Images/42/58077/s4-eraser.jpg" /><br />
<em>Loại bỏ đi đối tượng kh&ocirc;ng mong muốn trong ảnh chụp với Eraser</em></p>

<p><br />
<img alt="s4-sound-and-shot" src="http://cdn.tgdd.vn/Products/Images/42/58077/s4-sound-and-shot.jpg" /><br />
<em>Bức ảnh được chụp đi k&egrave;m với &acirc;m thanh với Sound And Shot</em></p>

<p>&nbsp;</p>

<h3><br />
Pin khỏe</h3>

<p>Dung lượng pin 2600mAh c&ugrave;ng những tinh chỉnh tối ưu năng lượng về phần cứng v&agrave; phần mềm c&oacute; thể gi&uacute;p&nbsp;<strong>Galaxy S4</strong>&nbsp;duy tr&igrave; thời lượng sử dụng ở mức b&igrave;nh thường khoảng 2 ng&agrave;y. Ở chế độ xem video, m&aacute;y c&oacute; thể đạt được 12 tiếng xem li&ecirc;n tục.</p>

<p>&nbsp;</p>

<h3><br />
Kết nối đa dạng</h3>

<p>L&agrave; một smartphone cao cấp,&nbsp;<strong>Galaxy S4</strong>&nbsp;được Samsung trang bị đầy đủ tất cả c&aacute;c c&ocirc;ng nghệ kết nối mới nhất hi&ecirc;n nay như Wifi, NFC, GPS, GLONASS, Bluetooth v&agrave; MHL 2.0. Trong đ&oacute;, nổi bất c&oacute; chuẩn kết nối Wiifi AC &ndash; chuẩn kết nối wifi mới nhất vừa được HTC trang bị cho chiếc <a href="http://www.thegioididong.com/dtdd/htc-one" target="_blank">HTC One</a> c&aacute;ch đ&acirc;y kh&ocirc;ng l&acirc;u. Chuẩn&nbsp;kết nối Wifi ac cho ph&eacute;p truyền nội dung với tốc độ cao hơn 3 lần so với tốc độ hiện tại với tốc độ n&agrave;y th&igrave; việc truyền tải phim HD thậm ch&iacute; l&agrave; 4K l&ecirc;n tv hay t&iacute;nh năng share qua kh&ocirc;ng d&acirc;y sẽ nhanh hơn rất nhiều.&nbsp;Ngo&agrave;i ra S4&nbsp;c&ograve;n c&oacute; cổng hồng ngoại cho ph&eacute;p ch&uacute;ng ta d&ugrave;ng smartphone như l&agrave; một chiếc điều khiển từ xa.</p>

<p>&nbsp;</p>

<h3><br />
Th&ocirc;ng minh với c&aacute;c t&iacute;nh năng của SmartScreen</h3>

<p><br />
<img alt="galaxy-s4" src="http://cdn.tgdd.vn/Products/Images/42/58077/galaxy-s4.jpg" style="height:647px; width:364px" /></p>

<p><br />
Ngo&agrave;i khả năng nhận biết mắt người hoạt động để duy tr&igrave; độ s&aacute;ng của m&agrave;n h&igrave;nh với <strong>Smart Stay</strong>&nbsp;giống Galaxy S3 th&igrave;&nbsp;<strong>Galaxy S4</strong>&nbsp;c&ograve;n được Samsung trang bị th&ecirc;m h&agrave;ng loạt những t&iacute;nh năng th&ocirc;ng minh kh&aacute;c với sự trợ gi&uacute;p của camera trước, gi&uacute;p mang đến cho người d&ugrave;ng những trải nghiệm smartphone đ&uacute;ng nghĩa.</p>

<p><br />
<strong>Smart Pause</strong>: Dừng th&ocirc;ng minh cho ph&eacute;p dừng bất kỳ một đoạn video n&agrave;o đ&oacute; m&agrave; bạn đang xem bằng c&aacute;ch quay mắt đi hướng kh&aacute;c.</p>

<p><br />
<img alt="samsung-galaxy-s4-smartpause" src="http://cdn.tgdd.vn/Products/Images/42/58077/samsung-galaxy-s4-smartpause.jpg" style="height:647px; width:364px" /></p>

<p><br />
<strong>Smart Rotation</strong>:&nbsp;Xoay th&ocirc;ng minh sẽ ngăn cho m&agrave;n h&igrave;nh tự động xoay khi bạn&nbsp;nằm xuống xem m&agrave;n h&igrave;nh th&igrave; m&agrave;n h&igrave;nh cũng kh&ocirc;ng xoay ngang như hiện nay.</p>

<p><br />
<img alt="samsung-galaxy-s4-02-smartrotate" src="http://cdn.tgdd.vn/Products/Images/42/58077/samsung-galaxy-s4-02-smartrotate.jpg" style="height:647px; width:364px" /></p>

<p><br />
<strong>Smart Scroll</strong>:&nbsp;Cuộn th&ocirc;ng minh sẽ ph&aacute;t hiện đầu của bạn bằng camera trước để m&agrave;n h&igrave;nh tự động cuộn khi bạn nh&igrave;n v&agrave;o m&agrave;n h&igrave;nh, hữu dụng trong những trường hợp người d&ugrave;ng đang xem một trang web hay một tập tin văn bản d&agrave;i.</p>

<p><br />
<img alt="samsung-galaxy-s4-03-smartscrol" src="http://cdn.tgdd.vn/Products/Images/42/58077/samsung-galaxy-s4-03-smartscroll.jpg" style="height:647px; width:364px" /></p>

<p>&nbsp;</p>

<h3><br />
Giao diện&nbsp;TouchWiz Nature UX mới</h3>

<p><br />
<img alt="Giao diện TouchWiz Nature UX của Galaxy S4" src="http://cdn.tgdd.vn/Products/Images/42/58077/galaxy-s4-gallery-1-750x500-1.jpg" style="height:412px; width:550px" /></p>

<p><br />
Đ&acirc;y l&agrave; giao diện người d&ugrave;ng được <a href="http://www.thegioididong.com/dtdd-samsung" target="_blank">Samsung</a> n&acirc;ng cấp l&ecirc;n từ bộ giao diện TouchWiz truyền thống. Với bộ giao diện n&agrave;y, người d&ugrave;ng sẽ được trải nghiệm nhiều bộ Widget hơn. Th&ecirc;m v&agrave;o đ&oacute;, giao diện n&agrave;y cũng cung cấp cho người d&ugrave;ng nhiều chức năng cực k&igrave; mới mẻ như:</p>

<p><br />
<strong>- Air View</strong>:&nbsp;L&agrave; t&iacute;nh năng cho ph&eacute;p người d&ugrave;ng xem nhanh album ảnh, video, email dưới dạng pop-up, m&agrave; kh&ocirc;ng cần phải đi s&acirc;u v&agrave;o n&oacute;.</p>

<p><br />
<strong>- Air Gesture</strong>:&nbsp;T&iacute;nh năng cho ph&eacute;p người d&ugrave;ng kh&ocirc;ng cần chạm tay v&agrave;o m&agrave;n h&igrave;nh nhưng c&oacute; thể cuộn trang hay chuyển đổi qua lại nhiều h&igrave;nh ảnh bằng c&aacute;ch vuốt tay qua lại, l&ecirc;n xuống.</p>

<p><br />
<strong>- Adapt Display</strong>:&nbsp;Tự động điều chỉnh m&agrave;n h&igrave;nh của S4 sao cho ph&ugrave; hợp với những g&igrave; đang hiển thị, tạo g&oacute;c nh&igrave;n thuận lợi cho người xem.</p>

<p><br />
<strong>- S Translate:</strong>&nbsp;Cho ph&eacute;p người d&ugrave;ng chụp h&igrave;nh ảnh, hoặc thu &acirc;m giọng n&oacute;i &ndash; từ đ&oacute; sẽ tự động dịch sang ng&ocirc;n ngữ được y&ecirc;u cầu. S Translate hỗ trợ tối đa 8 ng&ocirc;n ngữ.</p>

<p><br />
<strong>- SVoice</strong>&nbsp;được n&acirc;ng cấp th&agrave;nh&nbsp;<strong>SVoice Drive</strong>&nbsp;với khả năng hướng dẫn đường đi th&ocirc;ng qua giọng n&oacute;i khi đang l&aacute;i xe.</p>

<p><br />
<strong>- ChatOn:&nbsp;</strong>Với New chat, ChatOn cho ph&eacute;p ba người c&ugrave;ng t&aacute;n gẫu, kh&ocirc;ng c&ograve;n giới hạn hai người như trước đ&acirc;y. B&ecirc;n cạnh đ&oacute; ChatOn giờ đ&acirc;y sẽ hỗ trợ video chat, video call. Điểm đặc biệt l&agrave; ChatOn sẽ tận dụng t&iacute;nh năng Dual Camera &ndash; tức l&agrave; ch&uacute;ng ta sẽ c&oacute; thể thực hiện video chat với người th&acirc;n, bạn b&egrave; bằng cả hai camera trước v&agrave; sau.</p>

<p><br />
<strong>- S View Cover</strong>&nbsp;gi&uacute;p bạn c&oacute; thể nh&igrave;n thấy ID người gọi.</p>

<p><br />
<strong>- S Band, Body Scale</strong>&nbsp;l&agrave; c&aacute;c phụ kiện cho Galaxy S 4 gi&uacute;p theo d&otilde;i nhịp tim.</p>

<p><br />
<strong>- S Health</strong>&nbsp;l&agrave; t&iacute;nh năng kiểm tra t&igrave;nh trạng sức khoẻ của người d&ugrave;ng tr&ecirc;n&nbsp;<strong>Galaxy S4&nbsp;</strong>khi đi k&egrave;m một số phụ kiện kh&aacute;c.</p>

<p><br />
<strong>- Dual Video Call</strong>&nbsp;l&agrave; t&iacute;nh năng hỗ trợ người d&ugrave;ng vừa chat video bằng camera trước, vừa chia sẻ h&igrave;nh ảnh xung quanh với camera sau.</p>

<p><br />
<strong>- Story Album</strong>: Album ảnh được thiết kế dưới dạng Timeline</p>

<p><br />
<strong>- Home Sync</strong>&nbsp;gi&uacute;p người d&ugrave;ng kết nối S IV với c&aacute;c thiết bị gia dụng như TV, tủ lạnh&hellip;</p>

<p><br />
<strong>- Samsung Knox</strong>&nbsp; l&agrave; t&iacute;nh năng bảo mật gi&uacute;p người d&ugrave;ng chia smartphone th&agrave;nh những &ldquo;khoảng&rdquo; ri&ecirc;ng cho c&ocirc;ng việc hay giải tr&iacute;.</p>

<p><br />
<strong>- Samsung Group Play</strong>&nbsp;sẽ cho ph&eacute;p c&aacute;c smartphone ph&aacute;t nhạc c&ugrave;ng l&uacute;c, đ&acirc;y sẽ l&agrave; giải ph&aacute;p hiệu quả với những chuyến đi chơi kh&ocirc;ng mang theo loa ngo&agrave;i. Bạn c&oacute; thể gh&eacute;p 5 chiếc S IV v&agrave;o th&agrave;nh một chiếc loa cỡ &ldquo;bự&rdquo; chẳng hạn.</p>

<p>&nbsp;</p>

<h3><br />
Chi&ecirc;m ngưỡng quang cảnh đường phố 3D tuyệt vời với Google Earth</h3>

<p>Đ&acirc;y l&agrave; một ứng dụng được Samsung trang bị độc quyền cho chiếc Galaxy S4. Người d&ugrave;ng sẽ kh&ocirc;ng thể t&igrave;m thấy được ứng dụng n&agrave;y tr&ecirc;n Google Play hay bất k&igrave; kho ứng dụng cho Android n&agrave;o. Với Google Earth, người d&ugrave;ng sẽ c&oacute; thể chi&ecirc;m ngưỡng được quang cảnh đường phố 3D một c&aacute;ch sinh động v&agrave; chi tiết nhất.</p>

<p><br />
<img alt="samsung-galaxy-s4-04" src="http://cdn.tgdd.vn/Products/Images/42/58077/samsung-galaxy-s4-04.jpg" style="height:647px; width:364px" /></p>

<p>&nbsp;</p>

<h3><br />
K&iacute;nh chịu lực Corning Gorilla Glass 3</h3>

<p><br />
<img alt="kính cường lực gorilla glass 3" src="http://cdn.tgdd.vn/Products/Images/42/58077/gorilla-glass-3.jpg" /><br />
<em>Gorilla Glass 3 gi&uacute;p chịu va đập, chống xước tốt hơn</em></p>

<p><br />
K&iacute;nh chịu lực Corning Gorilla Glass đang được trang bị rất nhiều tr&ecirc;n <a href="http://www.thegioididong.com/dtdd" target="_blank">smartphone</a> hiện nay, tuy nhi&ecirc;n thế hệ k&iacute;nh chịu lực mới ra mắt Glass 3 thật sự l&agrave;m ch&uacute;ng ta phải ngạc nhi&ecirc;n. Corning cho biết c&ocirc;ng nghệ mới gi&uacute;p giảm thiểu 40% sự xuất hiện của những vết trầy c&oacute; thể nh&igrave;n thấy, đồng thời tăng cường độ bền l&ecirc;n 50% ngay cả khi k&iacute;nh đ&atilde; bị rạn nứt. Bởi vậy, bạn sẽ y&ecirc;n t&acirc;m khi m&aacute;y bị rơi hay để chung với c&aacute;c vật sắc nhọn kh&aacute;c.</p>

<p>&nbsp;</p>

<h3><br />
Hệ điều h&agrave;nh mới nhất</h3>

<p><br />
<img alt="Hệ điều hành mới nhất Android Jelly Bean" src="http://cdn.tgdd.vn/Products/Images/42/58077/8android42jellybean11359341081.jpg" /><br />
<em>Hệ điều h&agrave;nh mới nhất Android Jelly Bean</em></p>

<p><br />
Ngay khi ra mắt,&nbsp;<strong>Galaxy S4</strong>&nbsp;đ&atilde; được t&iacute;ch hợp hệ điều h&agrave;nh Android mới nhất phi&ecirc;n bản 4.2.2 Jelly Bean. Hệ điều h&agrave;nh phi&ecirc;n bản mới với nhiều t&iacute;nh năng mới hấp dẫn hơn, gi&uacute;p người d&ugrave;ng quản l&yacute; t&agrave;i nguy&ecirc;n hiệu quả v&agrave; bảo mật cao hơn. V&iacute; dụ như c&oacute; thể sử dụng nhiều t&agrave;i khoản người d&ugrave;ng, mỗi t&agrave;i khoản sẽ l&agrave; một thiết lập hay t&agrave;i nguy&ecirc;n kh&aacute;c nhau (như người d&ugrave;ng Windows). Hay như t&iacute;nh năng dự đo&aacute;n từ cho b&agrave;n ph&iacute;m ảo, nhập liệu bằng giọng n&oacute;i cũng ch&iacute;nh x&aacute;c hơn&hellip;</p>

<p><strong>C&ocirc;ng Đo&agrave;n</strong></p>

<table>
	<tbody>
		<tr>
			<td>
			<h3>Ưu điểm</h3>

			<ul>
				<li>M&agrave;n h&igrave;nh sắc n&eacute;t Full HD.</li>
				<li>Vi xử l&yacute; tốc độ cao.</li>
				<li>Quay phim v&agrave; chụp ảnh từ 2 camera c&ugrave;ng l&uacute;c&nbsp;(Dual Shot).</li>
				<li>Hỗ trợ cử chỉ v&agrave; điều khiển bằng mắt.</li>
				<li>Ng&ocirc;n ngữ kh&ocirc;ng c&ograve;n l&agrave; r&agrave;o cản với chức năng tự dịch th&ocirc;ng minh.</li>
				<li>T&iacute;nh năng chụp ảnh c&ugrave;ng &acirc;m thanh th&uacute; vị.</li>
			</ul>
			</td>
			<td>
			<h3>Nhược điểm</h3>

			<ul>
				<li>Thiết kế chưa đột ph&aacute;, ấn tượng như mọi người mong đợi.</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>
', 4, 99, 3, 0, 0, CAST(N'2014-03-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (21, N'Samsung Galaxy Note 3', N'/Content/Images/Samsung/Samsung Galaxy Note 3.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/Samsung/Hinh360-Samsung/dien-thoai-di-dong-samsung-galaxy-note-2-n7100-1.jpg', N'" /> </a>', CAST(4990000 AS Decimal(18, 0)), CAST(5300000 AS Decimal(18, 0)), N'<p>M&agrave;n h&igrave;nh: Full HD, 5.7&quot;, 1080 x 1920 pixels CPU: Exynos 5420, 8 nh&acirc;n, 8 nh&acirc;n (2 l&otilde;i 4 nh&acirc;n: Quad-core 1.9 GHz Cortex-A15 - quad-core 1.3 GHz Cortex-A7) RAM 3GB Hệ điều h&agrave;nh: Android 4.3 (Jelly Bean) Camera ch&iacute;nh: 13 MP, Quay phim FullHD 1080p@60fps Camera phụ: 2.0 MP Bộ nhớ trong: 32 GB Thẻ nhớ ngo&agrave;i đến: 64 GB Dung lượng pin: 3200 mAh</p>
', N'<p><img src="http://cdn.tgdd.vn/Products/Images/42/60383/Kit/Samsung-Galaxy-Note-3-N9000-mo-ta-chuc-nang-1.jpg" /></p>

<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td rowspan="2">
			<p>Th&ocirc;ng tin chung</p>
			</td>
			<td>Hệ điều h&agrave;nh</td>
			<td>Android 4.3 (Jelly Bean)</td>
		</tr>
		<tr>
			<td>
			<p>Ng&ocirc;n ngữ</p>
			</td>
			<td>Tiếng Việt, Tiếng Anh</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>Loại m&agrave;n h&igrave;nh</td>
			<td>Super AMOLED</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;u m&agrave;n h&igrave;nh</p>
			</td>
			<td>16 triệu m&agrave;u</td>
		</tr>
		<tr>
			<td>
			<p>Chuẩn m&agrave;n h&igrave;nh</p>
			</td>
			<td>Full HD</td>
		</tr>
		<tr>
			<td>
			<p>Độ ph&acirc;n giải</p>
			</td>
			<td>1080 x 1920 pixels</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh rộng</p>
			</td>
			<td>5.7&quot;</td>
		</tr>
		<tr>
			<td>
			<p>C&ocirc;ng nghệ cảm ứng</p>
			</td>
			<td>Cảm ứng điện dung đa điểm</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Chụp h&igrave;nh &amp; Quay phim</p>
			</td>
			<td>Camera sau</td>
			<td>13 MP</td>
		</tr>
		<tr>
			<td>
			<p>Camera trước</p>
			</td>
			<td>2.0 MP</td>
		</tr>
		<tr>
			<td>
			<p>Đ&egrave;n Flash</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>T&iacute;nh năng camera</p>
			</td>
			<td>Tự động lấy n&eacute;t, chạm lấy n&eacute;t<br />
			Nhận diện khu&ocirc;n mặt, nụ cười</td>
		</tr>
		<tr>
			<td>
			<p>Quay phim</p>
			</td>
			<td>Quay phim FullHD 1080p@60fps</td>
		</tr>
		<tr>
			<td>
			<p>Videocall</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td rowspan="5">
			<p>CPU &amp; RAM</p>
			</td>
			<td>Tốc độ CPU</td>
			<td>8 nh&acirc;n (2 l&otilde;i 4 nh&acirc;n: Quad-core 1.9 GHz Cortex-A15 - quad-core 1.3 GHz Cortex-A7)</td>
		</tr>
		<tr>
			<td>
			<p>Số nh&acirc;n</p>
			</td>
			<td>8 nh&acirc;n</td>
		</tr>
		<tr>
			<td>
			<p>Chipset</p>
			</td>
			<td>Exynos 5420</td>
		</tr>
		<tr>
			<td>
			<p>RAM</p>
			</td>
			<td>3GB</td>
		</tr>
		<tr>
			<td>
			<p>Chip đồ họa (GPU)</p>
			</td>
			<td>Mali-T628 MP6</td>
		</tr>
		<tr>
			<td rowspan="4">
			<p>Bộ nhớ &amp; Lưu trữ</p>
			</td>
			<td>Danh bạ</td>
			<td>Kh&ocirc;ng giới hạn</td>
		</tr>
		<tr>
			<td>
			<p>Bộ nhớ trong (ROM)</p>
			</td>
			<td>32 GB</td>
		</tr>
		<tr>
			<td>
			<p>Thẻ nhớ ngo&agrave;i</p>
			</td>
			<td>MicroSD (T-Flash)</td>
		</tr>
		<tr>
			<td>
			<p>Hỗ trợ thẻ tối đa</p>
			</td>
			<td>64 GB</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Thiết kế &amp; Trọng lượng</p>
			</td>
			<td>Kiểu d&aacute;ng</td>
			<td>Thanh + Cảm ứng</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước</p>
			</td>
			<td>151.2 x 79.2 x 8.3 mm</td>
		</tr>
		<tr>
			<td>
			<p>Trọng lượng (g)</p>
			</td>
			<td>168</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Th&ocirc;ng tin pin</p>
			</td>
			<td>Loại pin</td>
			<td>Pin chuẩn Li-Ion</td>
		</tr>
		<tr>
			<td>
			<p>Dung lượng pin</p>
			</td>
			<td>3200 mAh</td>
		</tr>
		<tr>
			<td>
			<p>Pin c&oacute; thể th&aacute;o rời</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td rowspan="13">
			<p>Kết nối &amp; Cổng giao tiếp</p>
			</td>
			<td>3G</td>
			<td>HSDPA, 42 Mbps; HSUPA, 5.76 Mbps</td>
		</tr>
		<tr>
			<td>
			<p>4G</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Loại Sim</p>
			</td>
			<td>Micro SIM</td>
		</tr>
		<tr>
			<td>
			<p>Khe gắn Sim</p>
			</td>
			<td>1 Sim</td>
		</tr>
		<tr>
			<td>
			<p>Wifi</p>
			</td>
			<td>Wi-Fi 802.11 a/b/g/n/ac, dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot</td>
		</tr>
		<tr>
			<td>
			<p>GPS</p>
			</td>
			<td>A-GPS v&agrave; GLONASS</td>
		</tr>
		<tr>
			<td>
			<p>Bluetooth</p>
			</td>
			<td>C&oacute;, V4.0 với A2DP, EDR</td>
		</tr>
		<tr>
			<td>
			<p>GPRS/EDGE</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Jack tai nghe</p>
			</td>
			<td>3.5 mm</td>
		</tr>
		<tr>
			<td>
			<p>NFC</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối USB</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối kh&aacute;c</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Cổng sạc</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Giải tr&iacute; &amp; Ứng dụng</p>
			</td>
			<td>Xem phim</td>
			<td>MP4, WMV, H.263, H.264(MPEG4-AVC), Xvid, DivX</td>
		</tr>
		<tr>
			<td>
			<p>Nghe nhạc</p>
			</td>
			<td>MP3, WAV, WMA, eAAC+, AC3, FLAC</td>
		</tr>
		<tr>
			<td>
			<p>Ghi &acirc;m</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Giới hạn cuộc gọi</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>FM radio</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Chức năng kh&aacute;c</p>
			</td>
			<td>B&uacute;t S-Pen<br />
			Mạng x&atilde; hội ảo<br />
			Google Search, Maps, Gmail, YouTube, Calendar, Google Talk, Picasa<br />
			Micro chuy&ecirc;n dụng chống ồn<br />
			50GB lưu trữ Dropbox</td>
		</tr>
	</tbody>
</table>
', N'<h2><strong>Samsung Galaxy Note 3 - Chiếc Phablet ho&agrave;n hảo với b&uacute;t S-Pen</strong></h2>

<p><br />
Sau một loạt th&agrave;nh c&ocirc;ng với Galaxy Note I v&agrave; Note II, Samsung tiếp tục tung ra <strong>Galaxy Note 3</strong>, một trong những chiếc phablet hay điện thoại cỡ lớn h&agrave;ng đầu hiện nay. Samsung Galaxy Note 3 c&oacute; rất nhiều ưu điểm so với hai phi&ecirc;n bản tiền nhiệm của n&oacute;, do đ&oacute;, chiếc phablet mới n&agrave;y cũng được rất nhiều người quan t&acirc;m.</p>

<p>&nbsp;</p>

<h3><br />
Thiết kế cứng c&aacute;p, nam t&iacute;nh</h3>

<p><img alt="Samsung Galaxy Note 3" src="http://cdn.tgdd.vn/Products/Images/42/60383/samsung-galaxy-note-iii_clip_image001.jpg" /><br />
<em>Galaxy Note 3 sở hữu m&agrave;n h&igrave;nh lớn c&ugrave;ng viền m&agrave;n h&igrave;nh si&ecirc;u mỏng</em></p>

<p><br />
Đầu ti&ecirc;n l&agrave; về mặt thiết kế, mặc d&ugrave; vẫn giữ thiết kế truyền thống của d&ograve;ng <a href="http://www.thegioididong.com/samsung-galaxy" target="_blank">Galaxy</a> Note nhưng Samsung đ&atilde; kh&eacute;o l&eacute;o vuốt mỏng viền m&agrave;n h&igrave;nh của<strong> Note 3</strong> để ph&ugrave; hợp với k&iacute;ch thước m&agrave;n h&igrave;nh lớn hơn v&agrave; viền m&agrave;n h&igrave;nh n&agrave;y mỏng hơn rất nhiều so với Note I v&agrave; Note II khiến cho người d&ugrave;ng kh&ocirc;ng hề c&oacute; cảm gi&aacute;c đang cầm tr&ecirc;n tay một chiếc điện thoại khổng lồ.</p>

<p><img alt="Samsung Galaxy Note III: “Gã khổng lồ” đã sẵn sàng lộ diện 9" src="http://cdn.tgdd.vn/Products/Images/42/60383/galaxy-note-3-mong.jpg" /></p>

<p><img alt="Samsung Galaxy Note III: “Gã khổng lồ” đã sẵn sàng lộ diện 9" src="http://cdn.tgdd.vn/Products/Images/42/60383/samsung-galaxy-note-iii_clip_image002.jpg" /><br />
<em>Thiết kế mới gi&uacute;p Galaxy Note tr&ocirc;ng cứng c&aacute;p v&agrave; mạnh mẽ</em></p>

<p><br />
X&eacute;t về mặt tổng thể <strong>Note 3</strong> tr&ocirc;ng cứng c&aacute;p hơn c&aacute;c phi&ecirc;n bản trước do Samsung đ&atilde; giảm bớt độ bo tr&ograve;n của c&aacute;c cạnh m&aacute;y, thiết kế m&aacute;y trở n&ecirc;n h&agrave;i ho&agrave; hơn v&agrave; cũng ph&ugrave; hợp với sở th&iacute;ch của nhiều đối tượng người d&ugrave;ng hơn. Với việc sử dụng ng&ocirc;n ngữ thiết kế v&agrave; chất liệu như một cuốn sổ tay n&ecirc;n một điểm v&ocirc; c&ugrave;ng đặc biệt ở Galaxy Note 3 l&agrave; nắp lưng của m&aacute;y được l&agrave;m từ<strong> chất liệu giả da</strong> thay v&igrave; bằng nhựa đ&atilde; khiến cho Note 3 tr&ocirc;ng sang trọng hơn hẳn những người tiền nhiệm.</p>

<p><br />
B&ecirc;n cạnh đ&oacute;, phần viền giả kim loại bao quanh m&aacute;y cũng được Samsung v&aacute;t những đường dọc tinh xảo m&agrave; theo lời của Samsung l&agrave; sẽ khiến cho Note 3 thực sự tr&ocirc;ng giống như một cuốn sổ tay khi được gấp lại. <strong>Galaxy Note 3</strong> cũng được Samsung ưu &aacute;i khi đầu tư cho sản phẩm nhiều nắp lưng với nhiều m&agrave;u sắc kh&aacute;c nhau đi c&ugrave;ng với c&aacute;c phụ kiện th&ocirc;ng minh kh&aacute;c như đồng hồ th&ocirc;ng minh <strong>Galaxy Gear</strong> v&agrave; vỏ bảo vệ th&ocirc;ng minh<strong> S-View Cover.</strong></p>

<p><img alt="Samsung Galaxy Note III: “Gã khổng lồ” đã sẵn sàng lộ diện 9" src="http://cdn.tgdd.vn/Products/Images/42/60383/galaxy-note3-s-view.jpg" /><br />
<em>Bộ S-View Cover gi&uacute;p bạn c&oacute; thể truy cập một số t&iacute;nh năng quan trọng ng&agrave;y từ b&ecirc;n ngo&agrave;i</em></p>

<p>&nbsp;</p>

<h3><br />
Cấu h&igrave;nh mạnh mẽ h&agrave;ng đầu</h3>

<p>M&agrave;n h&igrave;nh của&nbsp;<strong>Galaxy&nbsp;Note 3</strong>&nbsp;được mở rộng ra đến&nbsp;<strong>5.7 inch</strong>&nbsp;lớn hơn 5.5 inch của Note II v&agrave; 5.3 inch của Note I, đồng thời m&agrave;n h&igrave;nh khổng lồ n&agrave;y cũng được trang bị c&ocirc;ng nghệ m&agrave;n h&igrave;nh&nbsp;<strong>Super Amoled Full HD 1080p</strong>&nbsp;gi&uacute;p cho h&igrave;nh ảnh hiển thị sống động v&agrave; cực kỳ sắc n&eacute;t. M&agrave;u sắc tr&ecirc;n m&agrave;n h&igrave;nh của Note III thi&ecirc;n về c&aacute;c t&ocirc;ng m&agrave;u n&oacute;ng n&ecirc;n người d&ugrave;ng sẽ nh&igrave;n thấy h&igrave;nh ảnh trở n&ecirc;n bắt mắt hơn, l&ocirc;i cuốn hơn nhất l&agrave; tr&ecirc;n một m&agrave;n h&igrave;nh lớn.</p>

<p><img alt="Giao diện Camera trên Galaxy Note 3" src="http://cdn.tgdd.vn/Products/Images/42/60383/galaxy-note-3-giaodien-camera.jpg" /><br />
<em>M&agrave;n h&igrave;nh Super Amoled rộng tới 5,7inch nhưng tr&ocirc;ng Galaxy Note 3 rất gọn g&agrave;ng</em></p>

<p><br />
Cấu h&igrave;nh Galaxy Note 3 cũng được n&acirc;ng cấp mạnh mẽ để xứng danh l&agrave; chiếc phablet c&oacute; cấu h&igrave;nh tốt nhất hiện nay, Samsung đ&atilde; d&ugrave;ng chip xử l&yacute; 8 nh&acirc;n cao cấp <strong>Exynos 5420</strong>&nbsp;(Quad-core 1.9 GHz Cortex-A15 v&agrave; quad-core 1.3 GHz Cortex-A7) c&ugrave;ng với lượng <strong>RAM khủng l&ecirc;n đến 3GB</strong> gi&uacute;p cho m&aacute;y hoạt động mượt m&agrave; trong mọi t&igrave;nh huống, c&oacute; thể chạy nhiều ứng dụng c&ugrave;ng một l&uacute;c, chơi c&aacute;c tr&ograve; chơi c&oacute; đồ hoạ nặng lẫn xem c&aacute;c bộ phim full HD.</p>

<p><br />
<strong>Samsung Galaxy Note 3</strong>&nbsp;với dung lượng bộ nhớ trong lần lượt l&agrave; <strong>32 GB </strong>v&agrave;&nbsp;c&oacute; thể mở rộng qua khe cắm thẻ microSD l&ecirc;n đến 64 GB. Galaxy Note 3 cũng l&agrave; chiếc Phablet với dung lượng pin cao nhất hiện nay với 3200mAh.</p>

<p><img alt="Galaxy Note 3 có pin 3200mAh" src="http://cdn.tgdd.vn/Products/Images/42/60383/galaxy-note-3-pin.jpg" /><br />
<em>Note 3 l&agrave; chiếc Phablet c&oacute; dung lượng pin tốt nhất hiện nay</em></p>

<p>&nbsp;</p>

<h3><br />
Camera 13 chấm c&ugrave;ng c&ocirc;ng nghệ chống rung</h3>

<p>Cũng tương tự như Samsung Galaxy S4, camera ch&iacute;nh của <strong>Galaxy Note 3</strong> cũng được n&acirc;ng cấp l&ecirc;n <strong>13 MP</strong> để theo kịp với xu thế, k&egrave;m theo đ&oacute; l&agrave; c&aacute;c c&ocirc;ng nghệ tăng cường khả năng chụp ảnh v&agrave; c&ocirc;ng nghệ chống rung gi&uacute;p cho ảnh hay video được tạo ra từ Note 3 c&oacute; chất lượng cực tốt.</p>

<p><br />
Phi&ecirc;n bản chạy chip Snapdragon c&oacute; thể quay video với độ ph&acirc;n giải 4K v&agrave; phi&ecirc;n bản chạy chip Exynos c&oacute; thể quay video Full HD 1080p với mức khung h&igrave;nh l&ecirc;n đến 60fps.</p>

<p><img alt="Camera 13 chấm cùng đèn Flash ở mặt sau Note 3" src="http://cdn.tgdd.vn/Products/Images/42/60383/samsung-galaxy-note-iii_clip_image006.jpg" /><br />
<em>Camera 13 chấm c&ugrave;ng đ&egrave;n Flash ở mặt sau Note 3</em></p>

<p>&nbsp;</p>

<h3><br />
Giao diện TouchWiz t&ugrave;y chỉnh t&iacute;ch hợp nhiều t&iacute;nh năng th&ocirc;ng minh</h3>

<p>Cuối c&ugrave;ng l&agrave; về phần mềm, c&aacute;c t&iacute;nh năng mới nhất tr&ecirc;n d&ograve;ng điện thoại cao cấp của Samsung đều hội tụ tr&ecirc;n Galaxy Note 3 như <strong>Smart Pause</strong> gi&uacute;p m&aacute;y theo d&otilde;i cử chỉ của người d&ugrave;ng để tự động ngừng video khi người d&ugrave;ng nh&igrave;n ra ngo&agrave;i m&agrave;n h&igrave;nh, t&iacute;nh năng <strong>Smart Scroll</strong> gi&uacute;p di chuyển trang web l&ecirc;n v&agrave; xuống theo &aacute;nh mắt của người d&ugrave;ng. C&aacute;c t&iacute;nh năng như bộ phi&ecirc;n dịch ng&ocirc;n ngữ th&ocirc;ng minh <strong>S-Translate</strong>, c&ocirc;ng nghệ theo d&otilde;i sức khoẻ <strong>S-Health</strong> cũng g&oacute;p mặt tr&ecirc;n Note 3.</p>

<p><img alt="Samsung Galaxy note 3 cùng bút S pen" src="http://cdn.tgdd.vn/Products/Images/42/60383/galaxy-note-3-but-s-pen.jpg" /><br />
<em>B&uacute;t Spen g&oacute;p phần tạo n&ecirc;n sức mạnh v&agrave; t&iacute;nh th&ocirc;ng minh cho Galaxy Note 3</em></p>

<p><br />
Galaxy Note 3 c&ograve;n c&oacute; một số t&iacute;nh năng v&ocirc; c&ugrave;ng th&ocirc;ng minh kh&aacute;c để c&oacute; thể n&acirc;ng cao tối đa trải nghiệm người d&ugrave;ng với b&uacute;t S-pen (vốn được xem l&agrave; điểm kh&aacute;c biệt giữa d&ograve;ng Galaxy S v&agrave; d&ograve;ng Note) đ&oacute; l&agrave; Air Command.</p>

<p><br />
T&iacute;nh năng Air Command n&agrave;y cho ph&eacute;p S-Pen k&iacute;ch hoạt một menu phụ khi sử dụng S-Pen, Menu n&agrave;y sẽ chứa những c&ocirc;ng cụ để c&aacute;c thao t&aacute;c sử dụng b&uacute;t tr&ecirc;n Note 3 trở n&ecirc;n dễ d&agrave;ng hơn. Bộ t&iacute;nh năng n&agrave;y bao gồm Action Memo, Scrapbook, S Finder, S Note.</p>

<p><img alt="Samsung Galaxy note 3 với tính năng Air Command" src="http://cdn.tgdd.vn/Products/Images/42/60383/galaxy-note-3-air-command.jpg" /><br />
<em>Air Command hoạt động khi r&ecirc; v&agrave; giữ b&uacute;t Spen tr&ecirc;n Galaxy Note 3</em></p>

<p><br />
<strong>Action Memo</strong>:&nbsp;khi viết một nội dung n&agrave;o đ&oacute; tr&ecirc;n m&agrave;n h&igrave;nh Note 3 bằng S-Pen m&aacute;y sẽ tự động nhận diện loại nội dung v&agrave; đưa ta đến những thao t&aacute;c tương ứng. V&iacute; dụ như khi ta viết l&ecirc;n m&agrave;n h&igrave;nh một số điện thoại th&igrave; Action Memo sẽ tự mở ứng dụng Call để thực hiện cuộc gọi hoặc lưu lại Contact đ&oacute;, nếu bạn viết v&agrave;o một địa chỉ th&igrave; m&aacute;y sẽ tự mở bản đồ v.v...</p>

<p><br />
<strong>Scrapbook</strong>:&nbsp;người d&ugrave;ng sẽ c&oacute; thể lưu lại những nội dung hay đang xem tr&ecirc;n web chỉ bằng c&aacute;ch d&ugrave;ng S-Pen khoanh tr&ograve;n khu vực muốn ghi nhớ, Note 3 sẽ tự động lưu phần nội dung m&agrave; bạn đ&aacute;nh dấu c&oacute; thể l&agrave; văn bản, h&igrave;nh ảnh hoặc video v&agrave; tất cả sẽ được đ&iacute;nh k&eacute;m link gốc để tiện tra cứu sau n&agrave;y.</p>

<p><br />
<strong>S Finder</strong>:&nbsp;một c&ocirc;ng cụ t&igrave;m kiếm n&acirc;ng cao d&agrave;nh cho Note 3, n&oacute; sẽ t&igrave;m kiếm ở tất cả mọi nơi, tất cả c&aacute;c loại dữ liệu c&oacute; tr&ecirc;n điện thoại.</p>

<p><br />
<strong>S Note</strong>: một trong c&aacute;c ứng dụng ghi ch&uacute; nổi bật tr&ecirc;n c&aacute;c d&ograve;ng m&aacute;y Note của Samsung đ&atilde; được n&acirc;ng cấp th&ecirc;m t&iacute;nh năng đồng bộ giữa điện thoại m&aacute;y t&iacute;nh v&agrave; m&aacute;y t&iacute;nh bảng th&ocirc;ng qua chương tr&igrave;nh quen thuộc Evernote.</p>

<p><br />
T&oacute;m lại, <strong>Samsung Galaxy Note 3 </strong>l&agrave; chiếc phablet hội tụ những tinh hoa trong c&ocirc;ng nghệ của Samsung v&agrave; cũng l&agrave; chiếc điện thoại h&agrave;ng đầu của h&atilde;ng điện thoại H&agrave;n Quốc, thiết bị n&agrave;y rất th&iacute;ch hợp với người d&ugrave;ng l&agrave; những doanh nh&acirc;n th&agrave;nh đạt, những người y&ecirc;u th&iacute;ch sự ho&agrave;n hảo v&agrave; c&ocirc;ng nghệ đỉnh cao.</p>

<p><strong>Ng&ocirc; Quốc Bảo, C&ocirc;ng Đo&agrave;n</strong></p>

<table>
	<tbody>
		<tr>
			<td>
			<h3>Ưu điểm</h3>

			<ul>
				<li>M&agrave;n h&igrave;nh lớn 5.7 inch độ ph&acirc;n giải full HD si&ecirc;u sắc n&eacute;t.</li>
				<li>Cấu h&igrave;nh cực kỳ mạnh mẽ với vi xử l&yacute; Octa 8 nh&acirc;n.</li>
				<li>Thiết kế sang trọng v&agrave; đẹp mắt với viền giả kim loại v&agrave; mặt sau được l&agrave;m từ chất liệu giả da.</li>
				<li>Mọi t&aacute;c vụ hằng ng&agrave;y đều trở n&ecirc;n đơn giản với sự kết hợp giữa b&uacute;t S Pen c&ugrave;ng c&aacute;c t&iacute;nh năng th&ocirc;ng minh như Air Command, Action Memo, Scrapbook, S Finder, S Note, new Easy Clip,...</li>
			</ul>
			</td>
			<td>
			<h3>Nhược điểm</h3>

			<ul>
				<li>M&agrave;n h&igrave;nh 5.7inch n&ecirc;n hơi bất tiện khi mang b&ecirc;n m&igrave;nh.</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>
', 4, 99, 3, 5, 0, CAST(N'2014-03-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (22, N'Samsung Galaxy Win', N'/Content/Images/Samsung/Samsung Galaxy Win.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/Samsung/Hinh360-Samsung/dien-thoai-di-dong-samsung-galaxy-note-2-n7100-1.jpg', N'" /> </a>', CAST(5690000 AS Decimal(18, 0)), CAST(5900000 AS Decimal(18, 0)), N'Màn hình:	WVGA, 4.7", 480 x 800 pixels
CPU:	Qualcomm MSM8625, 4 nhân, 1.2 GHz
RAM:	1 GB
OS	Android 4.1.2 (Jelly Bean)
Camera chính:	5.0 MP, Quay phim HD 720p@15fps
Camera phụ:	VGA (0.3 Mpx)
Bộ nhớ trong:	8 GB
Thẻ nhớ tối đa:	64 GB
Pin:	2000 mAh', N'<img class="lazy" src="http://cdn.tgdd.vn/Products/Images/42/58267/Kit/samsung-galaxy-win-I8552-note-chuc-nang-1.jpg">  <table style="width: 100%;" class="product-compare" border="0" cellpadding="0" cellspacing="0">
    <tbody>
        <tr class="r">
            <td rowspan="2" class="g" valign="top">
            <div class="gh">Thông tin chung</div>
            </td>
            <td id="prop_72" class="p f eph" onclick="ShowHelp(72, 2);">Hệ điều hành</td>
            <td id="c72_1" class="v f">Android 4.1.2 (Jelly Bean)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_75" class="ph eph" onclick="ShowHelp(75, 2);">Ngôn ngữ</div>
            </td>
            <td id="c75_1" class="v">Tiếng Việt, Tiếng Anh, Tiếng Hoa</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Màn hình</div>
            </td>
            <td class="p f">Loại màn hình</td>
            <td id="c6459_1" class="v f">TFT</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Màu màn hình</div>
            </td>
            <td id="c6239_1" class="v">16 triệu màu</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_77" class="ph eph" onclick="ShowHelp(77, 2);">Chuẩn màn hình</div>
            </td>
            <td id="c77_1" class="v">WVGA</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_78" class="ph eph" onclick="ShowHelp(78, 2);">Độ phân giải</div>
            </td>
            <td id="c78_1" class="v">480 x 800 pixels</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_79" class="ph eph" onclick="ShowHelp(79, 2);">Màn hình rộng</div>
            </td>
            <td id="c79_1" class="v">4.7"</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_80" class="ph eph" onclick="ShowHelp(80, 2);">Công nghệ cảm ứng</div>
            </td>
            <td id="c80_1" class="v">Cảm ứng điện dung đa điểm</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Chụp hình &amp; Quay phim</div>
            </td>
            <td id="prop_27" class="p f eph" onclick="ShowHelp(27, 2);">Camera sau</td>
            <td id="c27_1" class="v f">5.0 MP</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_29" class="ph eph" onclick="ShowHelp(29, 2);">Camera trước</div>
            </td>
            <td id="c29_1" class="v">VGA (0.3 Mpx)</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Đèn Flash</div>
            </td>
            <td id="c6460_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_28" class="ph eph" onclick="ShowHelp(28, 2);">Tính năng camera</div>
            </td>
            <td id="c28_1" class="v">Tự động lấy nét, chạm lấy nét<br>Nhận diện khuôn mặt và nụ cười</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_31" class="ph eph" onclick="ShowHelp(31, 2);">Quay phim</div>
            </td>
            <td id="c31_1" class="v">Quay phim HD 720p@15fps</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_30" class="ph eph" onclick="ShowHelp(30, 2);">Videocall</div>
            </td>
            <td id="c30_1" class="v">Hỗ trợ VideoCall qua Skype</td>
        </tr>
        <tr class="r">
            <td rowspan="5" class="g" valign="top">
            <div class="gh">CPU &amp; RAM</div>
            </td>
            <td id="prop_51" class="p f eph" onclick="ShowHelp(51, 2);">Tốc độ CPU</td>
            <td id="c51_1" class="v f">1.2 GHz</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Số nhân</div>
            </td>
            <td id="c6461_1" class="v">4 nhân</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6059" class="ph eph" onclick="ShowHelp(6059, 2);">Chipset</div>
            </td>
            <td id="c6059_1" class="v">Qualcomm MSM8625</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">RAM</div>
            </td>
            <td id="c50_1" class="v">1 GB</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6079" class="ph eph" onclick="ShowHelp(6079, 2);">Chip đồ họa (GPU)</div>
            </td>
            <td id="c6079_1" class="v">Adreno 203</td>
        </tr>
        <tr class="r">
            <td rowspan="4" class="g" valign="top">
            <div class="gh">Bộ nhớ &amp; Lưu trữ</div>
            </td>
            <td id="prop_54" class="p f eph" onclick="ShowHelp(54, 2);">Danh bạ</td>
            <td id="c54_1" class="v f">Không giới hạn</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_49" class="ph eph" onclick="ShowHelp(49, 2);">Bộ nhớ trong (ROM)</div>
            </td>
            <td id="c49_1" class="v">8 GB</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_52" class="ph eph" onclick="ShowHelp(52, 2);">Thẻ nhớ ngoài</div>
            </td>
            <td id="c52_1" class="v">MicroSD (T-Flash)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_53" class="ph eph" onclick="ShowHelp(53, 2);">Hỗ trợ thẻ tối đa</div>
            </td>
            <td id="c53_1" class="v">64 GB</td>
        </tr>
        <tr class="r">
            <td rowspan="3" class="g" valign="top">
            <div class="gh">Thiết kế &amp; Trọng lượng</div>
            </td>
            <td id="prop_73" class="p f eph" onclick="ShowHelp(73, 2);">Kiểu dáng</td>
            <td id="c73_1" class="v f">Thanh + Cảm ứng</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_88" class="ph eph" onclick="ShowHelp(88, 2);">Kích thước</div>
            </td>
            <td id="c88_1" class="v">133.3 x 70.7 x 9.7 mm</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_100" class="ph eph" onclick="ShowHelp(100, 2);">Trọng lượng (g)</div>
            </td>
            <td id="c100_1" class="v">143.9</td>
        </tr>
        <tr class="r">
            <td rowspan="3" class="g" valign="top">
            <div class="gh">Thông tin pin</div>
            </td>
            <td class="p f">Loại pin</td>
            <td id="c83_1" class="v f">Pin chuẩn Li-Ion</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_84" class="ph eph" onclick="ShowHelp(84, 2);">Dung lượng pin</div>
            </td>
            <td id="c84_1" class="v">2000 mAh</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Pin có thể tháo rời</div>
            </td>
            <td id="c6462_1" class="v">Có</td>
        </tr>
        <tr class="r">
            <td rowspan="13" class="g" valign="top">
            <div class="gh">Kết nối &amp; Cổng giao tiếp</div>
            </td>
            <td id="prop_65" class="p f eph" onclick="ShowHelp(65, 2);">3G</td>
            <td id="c65_1" class="v f">HSDPA, 7.2 Mbps; HSUPA, 5.76 Mbps</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">4G</div>
            </td>
            <td id="c6463_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Loại Sim</div>
            </td>
            <td id="c6339_1" class="v">Micro SIM</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_60" class="ph eph" onclick="ShowHelp(60, 2);">Khe gắn Sim</div>
            </td>
            <td id="c60_1" class="v">2 SIM 2 sóng</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_66" class="ph eph" onclick="ShowHelp(66, 2);">Wifi</div>
            </td>
            <td id="c66_1" class="v">Wi-Fi 802.11 b/g/n, Wi-Fi hotspot</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_68" class="ph eph" onclick="ShowHelp(68, 2);">GPS</div>
            </td>
            <td id="c68_1" class="v">A-GPS</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_69" class="ph eph" onclick="ShowHelp(69, 2);">Bluetooth</div>
            </td>
            <td id="c69_1" class="v">Có, V3.0 với A2DP</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_61" class="ph eph" onclick="ShowHelp(61, 2);">GPRS/EDGE</div>
            </td>
            <td id="c61_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_48" class="ph eph" onclick="ShowHelp(48, 2);">Jack tai nghe</div>
            </td>
            <td id="c48_1" class="v">3.5 mm</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">NFC</div>
            </td>
            <td id="c6464_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_71" class="ph eph" onclick="ShowHelp(71, 2);">Kết nối USB</div>
            </td>
            <td id="c71_1" class="v">Micro USB</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Kết nối khác</div>
            </td>
            <td id="c5199_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Cổng sạc</div>
            </td>
            <td id="c85_1" class="v">Micro USB</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Giải trí &amp; Ứng dụng</div>
            </td>
            <td id="prop_32" class="p f eph" onclick="ShowHelp(32, 2);">Xem phim</td>
            <td id="c32_1" class="v f">MP4, WMV, H.263, H.264(MPEG4-AVC)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_33" class="ph eph" onclick="ShowHelp(33, 2);">Nghe nhạc</div>
            </td>
            <td id="c33_1" class="v">MP3, WAV, eAAC+, AC3, FLAC</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_36" class="ph eph" onclick="ShowHelp(36, 2);">Ghi âm</div>
            </td>
            <td id="c36_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6039" class="ph eph" onclick="ShowHelp(6039, 2);">Giới hạn cuộc gọi</div>
            </td>
            <td id="c6039_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_34" class="ph eph" onclick="ShowHelp(34, 2);">FM radio</div>
            </td>
            <td id="c34_1" class="v">FM radio với RDS</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Chức năng khác</div>
            </td>
            <td id="c43_1" class="v">oogle Search, Maps, Gmail, YouTube, Calendar, Google Talk, Picasa<br>Mạng xã hội ảo<br>Micro chuyên dụng chống ồn</td>
        </tr>
    </tbody>
</table>', N'<h2 align="center">Samsung Galaxy Win I8552 – Thiết kế đẹp, màn hình lớn, vi xử lý lõi tứ mạnh mẽ</h2><p style="text-align: justify;" align=""><strong><br>Galaxy Win I8552 </strong>là điện thoại thông minh có mức giá phải chăng của dòng <a title="Samsung Galaxy" href="http://www.thegioididong.com/samsung-galaxy" target="_blank">Galaxy</a>, màn hình lớn 4.7 inch, kiểu dáng đẹp, hiện đại cùng cấu hình mạnh mẽ với vi xử lý lõi tứ tốc độ 1.2GHz.</p><h3 align=""><br>Thiết kế quyến rũ</h3><p align="center"><strong><img title="Samsung Galaxy Win I8552" src="http://cdn.tgdd.vn/Products/Images/42/58267/samsung-galaxy-win-i8552_clip_image001.jpg" alt="Thiết kế bắt mắt của Samsung Galaxy Win I8552" height="298" width="530"></strong><br><em>Thiết kế bắt mắt của </em><em>Samsung </em><em>Galaxy</em><em> Win</em><em> I8552</em></p><p style="text-align: justify;" align=""><br>Bạn đã thấy smartphone cao cấp của Samsung mang tên <a href="http://www.thegioididong.com/dtdd/samsung-galaxy-s3-i9300" target="_blank">Galaxy S3</a>? Thì <strong>Samsung Galaxy</strong><strong> </strong><strong>Win</strong><strong> </strong><strong>I8552</strong> chính là một phiên bản thu nhỏ của S3. Máy có thiết kế bo tròn 4 góc đều nhau, phần khung sườn kim loại chống xước cho cảm giác chắc chắn và sang trọng.</p><h3 align=""><br>Màn hình lớn 4.7 inch</h3><p align="center"><strong><img title="Samsung Galaxy Win với màn hình lớn" src="http://cdn.tgdd.vn/Products/Images/42/58267/samsung-galaxy-win-i8552_clip_image003.jpg" alt="Samsung Galaxy Win với màn hình lớn, xem phim cực đã" height="550" border="0" width="422"></strong><br><em>Samsung </em><em>Galaxy</em><em> Win</em><em> với màn hình lớn, xem phim cực đã</em></p><p style="text-align: justify;" align=""><br>Smartphone màn hình cỡ lớn đang là “mốt” của giới công nghệ hiện nay. Hiểu được “tâm tư” của khách hàng, Samsung đã trang bị cho <strong>Galaxy</strong><strong> </strong><strong>Win</strong><strong> </strong><strong>I8552</strong> một màn hình 4.7 inch cảm ứng đa điểm, công nghệ màn hình TFT, độ phân giải 800 x 480 pixels cho chất lượng hình ảnh ở mức tầm trung. Tất nhiên với màn hình lớn, bạn có thể đọc sách, lướt web, xem video… to rõ hơn.</p>&nbsp;<h3 align=""><br>Vi xử lý lõi tứ mạnh mẽ</h3><p style="text-align: justify;" align="">Hiện nay, vi xử lý lõi tứ cao cấp chủ yếu được trang bị trên những smartphone “đình đám”, tuy nhiên <strong>Samsung Galaxy</strong><strong> </strong><strong>Win</strong><strong> </strong><strong>I8552</strong> cũng được trang bị bộ vi xử lý lõi tứ Qualcomm tốc độ 1.2GHz. Với vi xử lý này, máy có thể xử lý mọi phần mềm, chạy những trò chơi, ứng dụng mà Android hỗ trợ. Vi xử lý mạnh mẽ cũng giúp máy chạy mượt mà, chơi những game nặng mà không bị giật.</p><p align="center"><img title="Samsung Galaxy Win trang bị vi xử lý lõi tứ" src="http://cdn.tgdd.vn/Products/Images/42/58267/samsung-galaxy-win-i8552_clip_image005.jpg" alt="Samsung Galaxy Win được trang bị vi xử lý lõi tứ mạnh mẽ" height="428" border="0" width="419"><br><em>Samsung </em><em>Galaxy</em><em> Win</em><em> &nbsp;được trang bị </em><em>vi xử lý lõi tứ mạnh mẽ</em></p><h3 align=""><br>2 sim 2 sóng online</h3><p style="text-align: justify;" align="">Ngoài cấu hình mạnh, màn hình lớn, <strong>Galaxy</strong><strong> </strong><strong>Win</strong><strong> </strong><strong>I8552</strong> còn hỗ trợ hai khe cắm sim, nhờ vậy cùng lúc bạn có thể sử dụng 2 sim trên một máy và thể dễ dàng chuyển đổi sử dụng giữa 2 sim, thay đổi nhà mạng kết nối internet. 2 sim, một sim cho công viêc, một sim cho gia đình, thật tiện lợi cho người dùng.</p><p align="center"><img title="Samsung Galaxy Win hỗ trợ 2 sim" src="http://cdn.tgdd.vn/Products/Images/42/58267/samsung-galaxy-win-i8552_clip_image007.jpg" alt="Samsung Galaxy Win hỗ trợ 2 sim" height="550" border="0" width="355"><br><em>Samsung </em><em>Galaxy </em><em>Win </em><em>hỗ trợ 2 sim</em></p><h3 align=""><br>Hệ điều hành Android Jelly Bean</h3><p style="text-align: justify;" align="">Hệ điều hành Android phiên bản Jelly Bean có giao diện đẹp, hỗ trợ người dùng tốt hơn với nhiều phím tắt tiện ích. Không những vậy, hệ điều hành mới cũng giúp cải thiện thời lượng pin, cho thời gian sử dụng dài hơn. Jelly Bean đã cải thiện khả năng cảm ứng giúp bạn có thể thoải mái “vuốt chạm”.</p><p align="center"><img title="Samsung Galaxy Win có viền kim loại " src="http://cdn.tgdd.vn/Products/Images/42/58267/samsung-galaxy-win-i8552_clip_image009.jpg" alt="Samsung Galaxy Win sử dụng HĐH Android Jelly Bean" height="600" border="0" width="317"><br><em>Samsung Galaxy Win có viền kim loại chắc chắn</em></p><h3 align=""><br>Đầy đủ camera</h3><p style="text-align: justify;" align=""><strong>Samsung Galaxy Win I8552</strong> hỗ trợ cả hai camera trước (VGA) cho tính năng gọi video và camera sau. Máy ảnh sau chỉ 5.0MP nhưng đầy đủ các tính năng như chế độ tự động lấy nét, nhận dạng nụ cười, đính kèm vị trí chụp ảnh. Camera cũng hỗ trợ đèn flash để có thể chụp trong điều kiện ánh sáng yếu.</p><p align="right"><strong>Hữu Tình</strong></p><table class="advantage"><tbody><tr><td><h3>Ưu điểm</h3><ul>
	<li>Thiết kế đẹp, tinh tế.</li>
	<li>Màn hình rộng 4.7inch cho hiển thị sống động.</li>
	<li>Mạnh mẽ với chip lõi tứ.</li>
	<li>Chuyển đổi nhanh chóng, linh hoạt giữa 2 sim.</li>
	<li>Giao diện cử chỉ thông minh (lắc để cập nhật ứng dụng, úp để tắt âm thanh).</li>
</ul></td><td><h3>Nhược điểm</h3><ul>
	<li>Máy ảnh sau chỉ 5.0MP.</li>
	<li>Màn hình chưa được sắc nét.</li>
</ul></td></tr></tbody></table>', 4, 99, 0, 0, 0, CAST(N'2014-03-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (23, N'Samsung Galaxy Grand 2', N'/Content/Images/Samsung/Samsung Galaxy Grand 2.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/Samsung/Hinh360-Samsung/dien-thoai-di-dong-samsung-galaxy-note-2-n7100-1.jpg', N'" /> </a>', CAST(4540000 AS Decimal(18, 0)), CAST(5550000 AS Decimal(18, 0)), N'<p>M&agrave;n h&igrave;nh: HD, 5.25&quot;, 720 x 1280 pixels CPU: Qualcomm Snapdragon 400, 4 nh&acirc;n, 1.2 GHz RAM 1.5 GB Hệ điều h&agrave;nh: Android 4.3 (Jelly Bean) Camera ch&iacute;nh: 8.0 MP, Quay phim FullHD 1080p@30fps Camera phụ: 1.9 MP Bộ nhớ trong: 8 GB Thẻ nhớ ngo&agrave;i đến: 64 GB Dung lượng pin: 2600 mAh</p>
', N'<p><img src="http://cdn.tgdd.vn/Products/Images/42/58267/Kit/samsung-galaxy-win-I8552-note-chuc-nang-1.jpg" /></p>

<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td rowspan="2">
			<p>Th&ocirc;ng tin chung</p>
			</td>
			<td>Hệ điều h&agrave;nh</td>
			<td>Android 4.1.2 (Jelly Bean)</td>
		</tr>
		<tr>
			<td>
			<p>Ng&ocirc;n ngữ</p>
			</td>
			<td>Tiếng Việt, Tiếng Anh, Tiếng Hoa</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>Loại m&agrave;n h&igrave;nh</td>
			<td>TFT</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;u m&agrave;n h&igrave;nh</p>
			</td>
			<td>16 triệu m&agrave;u</td>
		</tr>
		<tr>
			<td>
			<p>Chuẩn m&agrave;n h&igrave;nh</p>
			</td>
			<td>WVGA</td>
		</tr>
		<tr>
			<td>
			<p>Độ ph&acirc;n giải</p>
			</td>
			<td>480 x 800 pixels</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh rộng</p>
			</td>
			<td>4.7&quot;</td>
		</tr>
		<tr>
			<td>
			<p>C&ocirc;ng nghệ cảm ứng</p>
			</td>
			<td>Cảm ứng điện dung đa điểm</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Chụp h&igrave;nh &amp; Quay phim</p>
			</td>
			<td>Camera sau</td>
			<td>5.0 MP</td>
		</tr>
		<tr>
			<td>
			<p>Camera trước</p>
			</td>
			<td>VGA (0.3 Mpx)</td>
		</tr>
		<tr>
			<td>
			<p>Đ&egrave;n Flash</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>T&iacute;nh năng camera</p>
			</td>
			<td>Tự động lấy n&eacute;t, chạm lấy n&eacute;t<br />
			Nhận diện khu&ocirc;n mặt v&agrave; nụ cười</td>
		</tr>
		<tr>
			<td>
			<p>Quay phim</p>
			</td>
			<td>Quay phim HD 720p@15fps</td>
		</tr>
		<tr>
			<td>
			<p>Videocall</p>
			</td>
			<td>Hỗ trợ VideoCall qua Skype</td>
		</tr>
		<tr>
			<td rowspan="5">
			<p>CPU &amp; RAM</p>
			</td>
			<td>Tốc độ CPU</td>
			<td>1.2 GHz</td>
		</tr>
		<tr>
			<td>
			<p>Số nh&acirc;n</p>
			</td>
			<td>4 nh&acirc;n</td>
		</tr>
		<tr>
			<td>
			<p>Chipset</p>
			</td>
			<td>Qualcomm MSM8625</td>
		</tr>
		<tr>
			<td>
			<p>RAM</p>
			</td>
			<td>1 GB</td>
		</tr>
		<tr>
			<td>
			<p>Chip đồ họa (GPU)</p>
			</td>
			<td>Adreno 203</td>
		</tr>
		<tr>
			<td rowspan="4">
			<p>Bộ nhớ &amp; Lưu trữ</p>
			</td>
			<td>Danh bạ</td>
			<td>Kh&ocirc;ng giới hạn</td>
		</tr>
		<tr>
			<td>
			<p>Bộ nhớ trong (ROM)</p>
			</td>
			<td>8 GB</td>
		</tr>
		<tr>
			<td>
			<p>Thẻ nhớ ngo&agrave;i</p>
			</td>
			<td>MicroSD (T-Flash)</td>
		</tr>
		<tr>
			<td>
			<p>Hỗ trợ thẻ tối đa</p>
			</td>
			<td>64 GB</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Thiết kế &amp; Trọng lượng</p>
			</td>
			<td>Kiểu d&aacute;ng</td>
			<td>Thanh + Cảm ứng</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước</p>
			</td>
			<td>133.3 x 70.7 x 9.7 mm</td>
		</tr>
		<tr>
			<td>
			<p>Trọng lượng (g)</p>
			</td>
			<td>143.9</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Th&ocirc;ng tin pin</p>
			</td>
			<td>Loại pin</td>
			<td>Pin chuẩn Li-Ion</td>
		</tr>
		<tr>
			<td>
			<p>Dung lượng pin</p>
			</td>
			<td>2000 mAh</td>
		</tr>
		<tr>
			<td>
			<p>Pin c&oacute; thể th&aacute;o rời</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td rowspan="13">
			<p>Kết nối &amp; Cổng giao tiếp</p>
			</td>
			<td>3G</td>
			<td>HSDPA, 7.2 Mbps; HSUPA, 5.76 Mbps</td>
		</tr>
		<tr>
			<td>
			<p>4G</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Loại Sim</p>
			</td>
			<td>Micro SIM</td>
		</tr>
		<tr>
			<td>
			<p>Khe gắn Sim</p>
			</td>
			<td>2 SIM 2 s&oacute;ng</td>
		</tr>
		<tr>
			<td>
			<p>Wifi</p>
			</td>
			<td>Wi-Fi 802.11 b/g/n, Wi-Fi hotspot</td>
		</tr>
		<tr>
			<td>
			<p>GPS</p>
			</td>
			<td>A-GPS</td>
		</tr>
		<tr>
			<td>
			<p>Bluetooth</p>
			</td>
			<td>C&oacute;, V3.0 với A2DP</td>
		</tr>
		<tr>
			<td>
			<p>GPRS/EDGE</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Jack tai nghe</p>
			</td>
			<td>3.5 mm</td>
		</tr>
		<tr>
			<td>
			<p>NFC</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối USB</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối kh&aacute;c</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Cổng sạc</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Giải tr&iacute; &amp; Ứng dụng</p>
			</td>
			<td>Xem phim</td>
			<td>MP4, WMV, H.263, H.264(MPEG4-AVC)</td>
		</tr>
		<tr>
			<td>
			<p>Nghe nhạc</p>
			</td>
			<td>MP3, WAV, eAAC+, AC3, FLAC</td>
		</tr>
		<tr>
			<td>
			<p>Ghi &acirc;m</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Giới hạn cuộc gọi</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>FM radio</p>
			</td>
			<td>FM radio với RDS</td>
		</tr>
		<tr>
			<td>
			<p>Chức năng kh&aacute;c</p>
			</td>
			<td>oogle Search, Maps, Gmail, YouTube, Calendar, Google Talk, Picasa<br />
			Mạng x&atilde; hội ảo<br />
			Micro chuy&ecirc;n dụng chống ồn</td>
		</tr>
	</tbody>
</table>
', N'<h2>Samsung Galaxy Win I8552 &ndash; Thiết kế đẹp, m&agrave;n h&igrave;nh lớn, vi xử l&yacute; l&otilde;i tứ mạnh mẽ</h2>

<p><br />
<strong>Galaxy Win I8552 </strong>l&agrave; điện thoại th&ocirc;ng minh c&oacute; mức gi&aacute; phải chăng của d&ograve;ng <a href="http://www.thegioididong.com/samsung-galaxy" target="_blank">Galaxy</a>, m&agrave;n h&igrave;nh lớn 4.7 inch, kiểu d&aacute;ng đẹp, hiện đại c&ugrave;ng cấu h&igrave;nh mạnh mẽ với vi xử l&yacute; l&otilde;i tứ tốc độ 1.2GHz.</p>

<h3><br />
Thiết kế quyến rũ</h3>

<p><strong><img alt="Thiết kế bắt mắt của Samsung Galaxy Win I8552" src="http://cdn.tgdd.vn/Products/Images/42/58267/samsung-galaxy-win-i8552_clip_image001.jpg" style="height:298px; width:530px" /></strong><br />
<em>Thiết kế bắt mắt của </em><em>Samsung </em><em>Galaxy</em><em> Win</em><em> I8552</em></p>

<p><br />
Bạn đ&atilde; thấy smartphone cao cấp của Samsung mang t&ecirc;n <a href="http://www.thegioididong.com/dtdd/samsung-galaxy-s3-i9300" target="_blank">Galaxy S3</a>? Th&igrave; <strong>Samsung Galaxy</strong><strong> </strong><strong>Win</strong><strong> </strong><strong>I8552</strong> ch&iacute;nh l&agrave; một phi&ecirc;n bản thu nhỏ của S3. M&aacute;y c&oacute; thiết kế bo tr&ograve;n 4 g&oacute;c đều nhau, phần khung sườn kim loại chống xước cho cảm gi&aacute;c chắc chắn v&agrave; sang trọng.</p>

<h3><br />
M&agrave;n h&igrave;nh lớn 4.7 inch</h3>

<p><strong><img alt="Samsung Galaxy Win với màn hình lớn, xem phim cực đã" src="http://cdn.tgdd.vn/Products/Images/42/58267/samsung-galaxy-win-i8552_clip_image003.jpg" style="height:550px; width:422px" /></strong><br />
<em>Samsung </em><em>Galaxy</em><em> Win</em><em> với m&agrave;n h&igrave;nh lớn, xem phim cực đ&atilde;</em></p>

<p><br />
Smartphone m&agrave;n h&igrave;nh cỡ lớn đang l&agrave; &ldquo;mốt&rdquo; của giới c&ocirc;ng nghệ hiện nay. Hiểu được &ldquo;t&acirc;m tư&rdquo; của kh&aacute;ch h&agrave;ng, Samsung đ&atilde; trang bị cho <strong>Galaxy</strong><strong> </strong><strong>Win</strong><strong> </strong><strong>I8552</strong> một m&agrave;n h&igrave;nh 4.7 inch cảm ứng đa điểm, c&ocirc;ng nghệ m&agrave;n h&igrave;nh TFT, độ ph&acirc;n giải 800 x 480 pixels cho chất lượng h&igrave;nh ảnh ở mức tầm trung. Tất nhi&ecirc;n với m&agrave;n h&igrave;nh lớn, bạn c&oacute; thể đọc s&aacute;ch, lướt web, xem video&hellip; to r&otilde; hơn.</p>

<p>&nbsp;</p>

<h3><br />
Vi xử l&yacute; l&otilde;i tứ mạnh mẽ</h3>

<p>Hiện nay, vi xử l&yacute; l&otilde;i tứ cao cấp chủ yếu được trang bị tr&ecirc;n những smartphone &ldquo;đ&igrave;nh đ&aacute;m&rdquo;, tuy nhi&ecirc;n <strong>Samsung Galaxy</strong><strong> </strong><strong>Win</strong><strong> </strong><strong>I8552</strong> cũng được trang bị bộ vi xử l&yacute; l&otilde;i tứ Qualcomm tốc độ 1.2GHz. Với vi xử l&yacute; n&agrave;y, m&aacute;y c&oacute; thể xử l&yacute; mọi phần mềm, chạy những tr&ograve; chơi, ứng dụng m&agrave; Android hỗ trợ. Vi xử l&yacute; mạnh mẽ cũng gi&uacute;p m&aacute;y chạy mượt m&agrave;, chơi những game nặng m&agrave; kh&ocirc;ng bị giật.</p>

<p><img alt="Samsung Galaxy Win được trang bị vi xử lý lõi tứ mạnh mẽ" src="http://cdn.tgdd.vn/Products/Images/42/58267/samsung-galaxy-win-i8552_clip_image005.jpg" style="height:428px; width:419px" /><br />
<em>Samsung </em><em>Galaxy</em><em> Win</em><em> &nbsp;được trang bị </em><em>vi xử l&yacute; l&otilde;i tứ mạnh mẽ</em></p>

<h3><br />
2 sim 2 s&oacute;ng online</h3>

<p>Ngo&agrave;i cấu h&igrave;nh mạnh, m&agrave;n h&igrave;nh lớn, <strong>Galaxy</strong><strong> </strong><strong>Win</strong><strong> </strong><strong>I8552</strong> c&ograve;n hỗ trợ hai khe cắm sim, nhờ vậy c&ugrave;ng l&uacute;c bạn c&oacute; thể sử dụng 2 sim tr&ecirc;n một m&aacute;y v&agrave; thể dễ d&agrave;ng chuyển đổi sử dụng giữa 2 sim, thay đổi nh&agrave; mạng kết nối internet. 2 sim, một sim cho c&ocirc;ng vi&ecirc;c, một sim cho gia đ&igrave;nh, thật tiện lợi cho người d&ugrave;ng.</p>

<p><img alt="Samsung Galaxy Win hỗ trợ 2 sim" src="http://cdn.tgdd.vn/Products/Images/42/58267/samsung-galaxy-win-i8552_clip_image007.jpg" style="height:550px; width:355px" /><br />
<em>Samsung </em><em>Galaxy </em><em>Win </em><em>hỗ trợ 2 sim</em></p>

<h3><br />
Hệ điều h&agrave;nh Android Jelly Bean</h3>

<p>Hệ điều h&agrave;nh Android phi&ecirc;n bản Jelly Bean c&oacute; giao diện đẹp, hỗ trợ người d&ugrave;ng tốt hơn với nhiều ph&iacute;m tắt tiện &iacute;ch. Kh&ocirc;ng những vậy, hệ điều h&agrave;nh mới cũng gi&uacute;p cải thiện thời lượng pin, cho thời gian sử dụng d&agrave;i hơn. Jelly Bean đ&atilde; cải thiện khả năng cảm ứng gi&uacute;p bạn c&oacute; thể thoải m&aacute;i &ldquo;vuốt chạm&rdquo;.</p>

<p><img alt="Samsung Galaxy Win sử dụng HĐH Android Jelly Bean" src="http://cdn.tgdd.vn/Products/Images/42/58267/samsung-galaxy-win-i8552_clip_image009.jpg" style="height:600px; width:317px" /><br />
<em>Samsung Galaxy Win c&oacute; viền kim loại chắc chắn</em></p>

<h3><br />
Đầy đủ camera</h3>

<p><strong>Samsung Galaxy Win I8552</strong> hỗ trợ cả hai camera trước (VGA) cho t&iacute;nh năng gọi video v&agrave; camera sau. M&aacute;y ảnh sau chỉ 5.0MP nhưng đầy đủ c&aacute;c t&iacute;nh năng như chế độ tự động lấy n&eacute;t, nhận dạng nụ cười, đ&iacute;nh k&egrave;m vị tr&iacute; chụp ảnh. Camera cũng hỗ trợ đ&egrave;n flash để c&oacute; thể chụp trong điều kiện &aacute;nh s&aacute;ng yếu.</p>

<p><strong>Hữu T&igrave;nh</strong></p>

<table>
	<tbody>
		<tr>
			<td>
			<h3>Ưu điểm</h3>

			<ul>
				<li>Thiết kế đẹp, tinh tế.</li>
				<li>M&agrave;n h&igrave;nh rộng 4.7inch cho hiển thị sống động.</li>
				<li>Mạnh mẽ với chip l&otilde;i tứ.</li>
				<li>Chuyển đổi nhanh ch&oacute;ng, linh hoạt giữa 2 sim.</li>
				<li>Giao diện cử chỉ th&ocirc;ng minh (lắc để cập nhật ứng dụng, &uacute;p để tắt &acirc;m thanh).</li>
			</ul>
			</td>
			<td>
			<h3>Nhược điểm</h3>

			<ul>
				<li>M&aacute;y ảnh sau chỉ 5.0MP.</li>
				<li>M&agrave;n h&igrave;nh chưa được sắc n&eacute;t.</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>
', 4, 99, 0, 5, 0, CAST(N'2014-03-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (24, N'Samsung Galaxy Core Duos', N'/Content/Images/Samsung/Samsung Galaxy Core Duos.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/Samsung/Hinh360-Samsung/dien-thoai-di-dong-samsung-galaxy-note-2-n7100-1.jpg', N'" /> </a>', CAST(4990000 AS Decimal(18, 0)), CAST(5100000 AS Decimal(18, 0)), N'Màn hình:	WVGA, 4.3", 480 x 800 pixels
CPU:	Qualcomm MSM8225, 2 nhân, 1.2 GHz
RAM	1 GB
Hệ điều hành:	Android 4.1.2 (Jelly Bean)
Camera chính:	5.0 MP, Quay phim 480p@30fps
Camera phụ:	VGA (0.3 Mpx)
Bộ nhớ trong:	8 GB
Thẻ nhớ ngoài đến:	64 GB
Dung lượng pin:	1800 mAh', N'<img class="lazy" src="http://cdn.tgdd.vn/Products/Images/42/59455/Kit/Samsung-Galaxy-Core-Duos-I8262-mo-ta-chuc-nang.jpg">   <table style="width: 100%;" class="product-compare" border="0" cellpadding="0" cellspacing="0">
    <tbody>
        <tr class="r">
            <td rowspan="2" class="g" valign="top">
            <div class="gh">Thông tin chung</div>
            </td>
            <td id="prop_72" class="p f eph" onclick="ShowHelp(72, 2);">Hệ điều hành</td>
            <td id="c72_1" class="v f">Android 4.1.2 (Jelly Bean)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_75" class="ph eph" onclick="ShowHelp(75, 2);">Ngôn ngữ</div>
            </td>
            <td id="c75_1" class="v">Tiếng Việt, Tiếng Anh</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Màn hình</div>
            </td>
            <td class="p f">Loại màn hình</td>
            <td id="c6459_1" class="v f">TFT</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Màu màn hình</div>
            </td>
            <td id="c6239_1" class="v">16 triệu màu</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_77" class="ph eph" onclick="ShowHelp(77, 2);">Chuẩn màn hình</div>
            </td>
            <td id="c77_1" class="v">WVGA</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_78" class="ph eph" onclick="ShowHelp(78, 2);">Độ phân giải</div>
            </td>
            <td id="c78_1" class="v">480 x 800 pixels</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_79" class="ph eph" onclick="ShowHelp(79, 2);">Màn hình rộng</div>
            </td>
            <td id="c79_1" class="v">4.3"</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_80" class="ph eph" onclick="ShowHelp(80, 2);">Công nghệ cảm ứng</div>
            </td>
            <td id="c80_1" class="v">Cảm ứng điện dung đa điểm</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Chụp hình &amp; Quay phim</div>
            </td>
            <td id="prop_27" class="p f eph" onclick="ShowHelp(27, 2);">Camera sau</td>
            <td id="c27_1" class="v f">5.0 MP</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_29" class="ph eph" onclick="ShowHelp(29, 2);">Camera trước</div>
            </td>
            <td id="c29_1" class="v">VGA (0.3 Mpx)</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Đèn Flash</div>
            </td>
            <td id="c6460_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_28" class="ph eph" onclick="ShowHelp(28, 2);">Tính năng camera</div>
            </td>
            <td id="c28_1" class="v">Tự động lấy nét, chạm lấy nét<br>Nhận diện khuôn mặt, nụ cười</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_31" class="ph eph" onclick="ShowHelp(31, 2);">Quay phim</div>
            </td>
            <td id="c31_1" class="v">Quay phim 480p@30fps</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_30" class="ph eph" onclick="ShowHelp(30, 2);">Videocall</div>
            </td>
            <td id="c30_1" class="v">Hỗ trợ VideoCall qua Skype</td>
        </tr>
        <tr class="r">
            <td rowspan="5" class="g" valign="top">
            <div class="gh">CPU &amp; RAM</div>
            </td>
            <td id="prop_51" class="p f eph" onclick="ShowHelp(51, 2);">Tốc độ CPU</td>
            <td id="c51_1" class="v f">1.2 GHz</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Số nhân</div>
            </td>
            <td id="c6461_1" class="v">2 nhân</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6059" class="ph eph" onclick="ShowHelp(6059, 2);">Chipset</div>
            </td>
            <td id="c6059_1" class="v">Qualcomm MSM8225</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">RAM</div>
            </td>
            <td id="c50_1" class="v">1 GB</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6079" class="ph eph" onclick="ShowHelp(6079, 2);">Chip đồ họa (GPU)</div>
            </td>
            <td id="c6079_1" class="v">Adreno 203</td>
        </tr>
        <tr class="r">
            <td rowspan="4" class="g" valign="top">
            <div class="gh">Bộ nhớ &amp; Lưu trữ</div>
            </td>
            <td id="prop_54" class="p f eph" onclick="ShowHelp(54, 2);">Danh bạ</td>
            <td id="c54_1" class="v f">Không giới hạn</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_49" class="ph eph" onclick="ShowHelp(49, 2);">Bộ nhớ trong (ROM)</div>
            </td>
            <td id="c49_1" class="v">8 GB</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_52" class="ph eph" onclick="ShowHelp(52, 2);">Thẻ nhớ ngoài</div>
            </td>
            <td id="c52_1" class="v">MicroSD (T-Flash)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_53" class="ph eph" onclick="ShowHelp(53, 2);">Hỗ trợ thẻ tối đa</div>
            </td>
            <td id="c53_1" class="v">64 GB</td>
        </tr>
        <tr class="r">
            <td rowspan="3" class="g" valign="top">
            <div class="gh">Thiết kế &amp; Trọng lượng</div>
            </td>
            <td id="prop_73" class="p f eph" onclick="ShowHelp(73, 2);">Kiểu dáng</td>
            <td id="c73_1" class="v f">Thanh + Cảm ứng</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_88" class="ph eph" onclick="ShowHelp(88, 2);">Kích thước</div>
            </td>
            <td id="c88_1" class="v">129.3 x 67.6 x 9 mm</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_100" class="ph eph" onclick="ShowHelp(100, 2);">Trọng lượng (g)</div>
            </td>
            <td id="c100_1" class="v">124</td>
        </tr>
        <tr class="r">
            <td rowspan="3" class="g" valign="top">
            <div class="gh">Thông tin pin</div>
            </td>
            <td class="p f">Loại pin</td>
            <td id="c83_1" class="v f">Pin chuẩn Li-Ion</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_84" class="ph eph" onclick="ShowHelp(84, 2);">Dung lượng pin</div>
            </td>
            <td id="c84_1" class="v">1800 mAh</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Pin có thể tháo rời</div>
            </td>
            <td id="c6462_1" class="v">Có</td>
        </tr>
        <tr class="r">
            <td rowspan="13" class="g" valign="top">
            <div class="gh">Kết nối &amp; Cổng giao tiếp</div>
            </td>
            <td id="prop_65" class="p f eph" onclick="ShowHelp(65, 2);">3G</td>
            <td id="c65_1" class="v f">HSDPA, 7.2 Mbps; HSUPA, 5.76 Mbps</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">4G</div>
            </td>
            <td id="c6463_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Loại Sim</div>
            </td>
            <td id="c6339_1" class="v">Micro SIM</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_60" class="ph eph" onclick="ShowHelp(60, 2);">Khe gắn Sim</div>
            </td>
            <td id="c60_1" class="v">2 SIM 2 sóng</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_66" class="ph eph" onclick="ShowHelp(66, 2);">Wifi</div>
            </td>
            <td id="c66_1" class="v">Wi-Fi 802.11 b/g/n, Wi-Fi hotspot</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_68" class="ph eph" onclick="ShowHelp(68, 2);">GPS</div>
            </td>
            <td id="c68_1" class="v">A-GPS</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_69" class="ph eph" onclick="ShowHelp(69, 2);">Bluetooth</div>
            </td>
            <td id="c69_1" class="v">Có, V3.0 với A2DP</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_61" class="ph eph" onclick="ShowHelp(61, 2);">GPRS/EDGE</div>
            </td>
            <td id="c61_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_48" class="ph eph" onclick="ShowHelp(48, 2);">Jack tai nghe</div>
            </td>
            <td id="c48_1" class="v">3.5 mm</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">NFC</div>
            </td>
            <td id="c6464_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_71" class="ph eph" onclick="ShowHelp(71, 2);">Kết nối USB</div>
            </td>
            <td id="c71_1" class="v">Micro USB</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Kết nối khác</div>
            </td>
            <td id="c5199_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Cổng sạc</div>
            </td>
            <td id="c85_1" class="v">Micro USB</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Giải trí &amp; Ứng dụng</div>
            </td>
            <td id="prop_32" class="p f eph" onclick="ShowHelp(32, 2);">Xem phim</td>
            <td id="c32_1" class="v f">MP4, WMV, H.263, H.264(MPEG4-AVC)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_33" class="ph eph" onclick="ShowHelp(33, 2);">Nghe nhạc</div>
            </td>
            <td id="c33_1" class="v">MP3, WAV, WMA, eAAC+</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_36" class="ph eph" onclick="ShowHelp(36, 2);">Ghi âm</div>
            </td>
            <td id="c36_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6039" class="ph eph" onclick="ShowHelp(6039, 2);">Giới hạn cuộc gọi</div>
            </td>
            <td id="c6039_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_34" class="ph eph" onclick="ShowHelp(34, 2);">FM radio</div>
            </td>
            <td id="c34_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Chức năng khác</div>
            </td>
            <td id="c43_1" class="v">Mạng xã hội ảo<br>Google Search, Maps, Gmail, YouTube, Calendar, Google Talk</td>
        </tr>
    </tbody>
</table>', N'<h2 align="center">Samsung Galaxy Core Duos I8262 – Smartphone tầm trung với thiết kế đẹp và đầy đủ tính năng</h2><p align="left"><br><a title="Samsung Galaxy" href="http://www.thegioididong.com/samsung-galaxy" target="_blank">Samsung Galaxy</a> Core Duos I8262 là một điện thoại thông minh có giá phải chăng, màn hình rộng, cấu hình ổn và đầy đủ tính năng như một điện thoại cao cấp khác.</p>&nbsp;<h3 align="left"><br>Phần cứng</h3><p align="left"><strong>Galaxy Core Duos I8262</strong> được trang bị bộ vi xử lý hai nhân tốc độ 1.2GHz, đây là vi xử lý tương tự như trong “siêu phẩm một thời” <a href="http://www.thegioididong.com/dtdd/samsung-galaxy-s-ii-plus-i9105" target="_blank">Galaxy S2</a>. Với bộ vi xử lý này, bạn yên tâm khi chạy các phần mềm, tiện ích và thậm chí là game 3D.</p><p align="center"><br><img title="Samsung Galaxy Core Duos I8262" src="http://cdn.tgdd.vn/Products/Images/42/59455/samsung-galaxy-core-duos-i8262_clip_image001.jpg" alt="Samsung Galaxy Core Duos I8262" height="404" width="595"> <br><em>Samsung Galaxy Core Duos I8262 với 2 màu đen và trắng</em></p><p align="left"><br>Màn hình cảm ứng đa điểm rộng 4.3 inch, độ phân giải 800x480 pixels, mặc dù không phải là màn hình AMOLED nhưng <strong>Samsung Galaxy Core Duos I8262 </strong>vẫn khá nét và sáng với mật độ điểm ảnh 217ppi. Bạn sẽ bất ngờ khi xem các bộ phim HD bởi màn hình cho hình ảnh sắc nét, video mượt mà, trung thực, màu sắc sống động.</p><p align="center"><img title="Samsung Galaxy Core Duos I8262 hỗ trợ 2 sim 2 sóng" src="http://cdn.tgdd.vn/Products/Images/42/59455/samsung-galaxy-core-duos-i8262_clip_image003.jpg" alt="Samsung Galaxy Core Duos I8262 hỗ trợ 2 sim 2 sóng" height="367" width="536"> <br><em>Samsung Galaxy Core Duos I8262 hỗ trợ 2 sim 2 sóng</em></p><p align="left"><strong><br>Galaxy Core Duos I8262 </strong>có bộ nhớ RAM 1GB, đủ để xử lý nhiều ứng dụng kể cả ứng dụng nặng mà không có dấu hiệu bị giật hoặc chậm trễ. Samsung Galaxy Core Duos I8262 có bộ nhớ trong 8GB, hơi thấp tuy nhiên bạn có thể mở rộng qua khe microSD, thiết bị có thể hỗ trợ thẻ nhớ lên đến 64GB.</p>&nbsp;<h3 align="left"><br>Thiết kế</h3><p align="left"><strong>Samsung Galaxy Core Duos I8262</strong> có thiết kế khá thon gọn, phía sau hơi bầu để dễ dàng cầm nắm. Với kích thước 129.3 x 67.6 x 9 mm, Galaxy Core Duos I8262 có thiết kế thanh mảnh, không dày mà cũng không quá mỏng, vừa vặn trên một bàn tay. Ngoài ra, với trọng lượng chỉ 124g, rất nhẹ nhàng khi sử dụng.</p><p align="center"><br><img title="Thiết kế thanh mảnh, chắc chắn của Samsung Galaxy Core Duos I8262" src="http://cdn.tgdd.vn/Products/Images/42/59455/samsung-galaxy-core-duos-i8262_clip_image005.jpg" alt="Thiết kế thanh mảnh, chắc chắn của Samsung Galaxy Core Duos I8262" height="489" width="538"><br><em>Thiết kế thanh mảnh, chắc chắn của Samsung Galaxy Core Duos I8262</em></p><p align="left"><strong><br>Galaxy Core Duos I8262</strong> có mặt sau bằng nhựa mịn, cho cảm giác cao cấp. Viền xung quanh được bao bọc bằng kim loại, khiến máy rất chắc chắn. Mặt sau của máy với logo <a title="Samsung" href="http://www.thegioididong.com/dtdd-samsung" target="_blank">Samsung</a>, loa, máy ảnh, đèn flash về một phía khiến người dùng có cảm giác “sạch sẽ và trơn tru”.</p>&nbsp;<h3 align="left"><br>Phần mềm</h3><p align="left"><strong>Samsung Galaxy Core Duos I8262 </strong>chạy hệ điều hành Android Jelly Bean 4.1, phiên bản với nhiều cải tiến so với các phiên bản trước đó. Máy sẽ chạy mượt mà hơn cũng như tiết kiệm pin hơn.</p><p align="center"><br><img title="Samsung Galaxy Core Duos I8262 chạy trên Android Jelly Bean 4.1 " src="http://cdn.tgdd.vn/Products/Images/42/59455/samsung-galaxy-core-duos-i8262_clip_image006.jpg" alt="Samsung Galaxy Core Duos I8262 chạy trên Android Jelly Bean 4.1 " height="273" width="500"> <br><em>Samsung Galaxy Core Duos I8262 chạy trên Android Jelly Bean 4.1</em></p><p align="left">Ngoài ra, phiên bản mới này cũng giúp bạn cài đặt được nhiều các phần mềm, các tiện ích, trò chơi khác nhau.</p>&nbsp;<h3 align="left"><br>Kết nối</h3><p align="left"><strong>Galaxy Core Duos I8262 </strong>hỗ trợ 2 sim 2 sóng, có thể chuyển đổi dễ dàng giữa các sim. Sim 1 hỗ trợ cả mạng 2G, 3G, sim 2 hỗ trợ mạng 2G. Ngoài ra, chiếc <a title="smartphone" href="http://www.thegioididong.com/dtdd?f=smartphone" target="_blank">smartphone</a> này còn hỗ trợ kết nối không dây Bluetooth 3.0 cho kết nối nhanh chóng và hiệu quả. Cổng microUSB làm cả hai nhiệm vụ đó là sạc pin hoặc kết nối với máy tính để truyền tải dữ liệu. Galaxy Core Duos cũng được hỗ trợ cảm biến GPS để định dạng vệ tinh, tìm đường…</p><p align="center"><br><img title="Samsung Galaxy Core Duos I8262 hỗ trợ đầy đủ kết nối" src="http://cdn.tgdd.vn/Products/Images/42/59455/samsung-galaxy-core-duos-i8262_clip_image007.jpg" alt="Samsung Galaxy Core Duos I8262 hỗ trợ đầy đủ kết nối" height="194" width="500"> <br><em>Samsung Galaxy Core Duos I8262 hỗ trợ đầy đủ kết nối</em></p><p align="left"><strong><br>Samsung Galaxy Core Duos I8262</strong> còn có kết nối Wifi và tích hợp tính năng Wifi Hotspot để chia sẻ mạng cho nhiều người. Jack cắm tai nghe 3.5mm để kết nối tai nghe, loa ngoài.</p>&nbsp;<h3 align="left"><br>Camera</h3><p align="center"><strong><br><img title="Samsung Galaxy Core Duos I8262 với camera sau 5.0MP" src="http://cdn.tgdd.vn/Products/Images/42/59455/samsung-galaxy-core-duos-i8262_clip_image008.jpg" alt="Samsung Galaxy Core Duos I8262 với camera sau 5.0MP" height="466" width="391"></strong><br><em>Samsung Galaxy Core Duos I8262 với camera sau 5.0MP</em></p><p align="left"><strong><br>Samsung Galaxy Core Duos</strong> hỗ trợ cả hai camera trước và sau. Máy ảnh sau có độ phân giải 5.0MP, được hỗ trơ đèn flash, cho bạn những bức ảnh khá nét. Các tính năng khác như tự động lấy nét, nhận dạng khuôn mặt và nụ cười, gắn thêm nơi chụp cũng được tích hợp vào máy ảnh. Camera trước có độ phân giải 0.3MP, đủ để bạn có thể trải nghiệm tính năng gọi video.</p><p align="right"><strong>Hữu Tình</strong></p><br><br><table class="advantage"><tbody><tr><td><h3>Ưu điểm</h3><ul>
	<li>Cấu hình mạnh mẽ cho trải nghiệm nhanh, mượt, uyển chuyển.</li>
	<li>Thiết kế đẹp, chắc chắn.</li>
	<li>Chụp liên tiếp 8 bức ảnh, và tự chọn ảnh đẹp nhất.</li>
	<li>Có nhiều chức năng thông minh như S Voice, Voice Unlock, Smart Stay, Smart Alert, Motion UI.</li>
	<li>Tận dụng cước phí, và vùng phủ sóng riêng biệt giữa 2 sim.</li>
</ul></td><td><h3>Nhược điểm</h3><ul>
	<li>Máy ảnh chưa thật ấn tượng.</li>
</ul></td></tr></tbody></table>', 4, 99, 0, 0, 1, CAST(N'2014-03-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (25, N'Sony Xperia Z', N'/Content/Images/Sony/Sony Xperia Z.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/Sony/Hinh360-Sony/Sony-Xperia-Z-hinh360-1.jpg', N'" /> </a>', CAST(4990000 AS Decimal(18, 0)), CAST(5700000 AS Decimal(18, 0)), N'<p>M&agrave;n h&igrave;nh: Full HD, 5.0&quot;, 1080 x 1920 pixels CPU: Qualcomm APQ8064 Snapdragon, 4 nh&acirc;n, Quad-core 1.5 GHz Krait RAM: 2 GB OS Android 4.1.2 (Jelly Bean) Camera ch&iacute;nh: 13 MP, Quay phim FullHD 1080p@30fps Camera phụ: 2.2 MP Bộ nhớ trong: 16 GB Thẻ nhớ tối đa: 32 GB Pin: 2330 mAh</p>
', N'<p><img src="http://cdn.tgdd.vn/Products/Images/42/57958/Kit/Sony-Xperia-Z-mo-ta-chuc-nang.jpg" /></p>

<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td rowspan="2">
			<p>Th&ocirc;ng tin chung</p>
			</td>
			<td>Hệ điều h&agrave;nh</td>
			<td>Android 4.1.2 (Jelly Bean)</td>
		</tr>
		<tr>
			<td>
			<p>Ng&ocirc;n ngữ</p>
			</td>
			<td>Tiếng Việt, Tiếng Anh</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>Loại m&agrave;n h&igrave;nh</td>
			<td>TFT</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;u m&agrave;n h&igrave;nh</p>
			</td>
			<td>16 triệu m&agrave;u</td>
		</tr>
		<tr>
			<td>
			<p>Chuẩn m&agrave;n h&igrave;nh</p>
			</td>
			<td>Full HD</td>
		</tr>
		<tr>
			<td>
			<p>Độ ph&acirc;n giải</p>
			</td>
			<td>1080 x 1920 pixels</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh rộng</p>
			</td>
			<td>5.0&quot;</td>
		</tr>
		<tr>
			<td>
			<p>C&ocirc;ng nghệ cảm ứng</p>
			</td>
			<td>Cảm ứng điện dung đa điểm</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Chụp h&igrave;nh &amp; Quay phim</p>
			</td>
			<td>Camera sau</td>
			<td>13 MP</td>
		</tr>
		<tr>
			<td>
			<p>Camera trước</p>
			</td>
			<td>2.2 MP</td>
		</tr>
		<tr>
			<td>
			<p>Đ&egrave;n Flash</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>T&iacute;nh năng camera</p>
			</td>
			<td>Tự động lấy n&eacute;t, chạm lấy n&eacute;t<br />
			Nhận diện khu&ocirc;n mặt<br />
			Chống rung</td>
		</tr>
		<tr>
			<td>
			<p>Quay phim</p>
			</td>
			<td>Quay phim FullHD 1080p@30fps</td>
		</tr>
		<tr>
			<td>
			<p>Videocall</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="5">
			<p>CPU &amp; RAM</p>
			</td>
			<td>Tốc độ CPU</td>
			<td>Quad-core 1.5 GHz Krait</td>
		</tr>
		<tr>
			<td>
			<p>Số nh&acirc;n</p>
			</td>
			<td>4 nh&acirc;n</td>
		</tr>
		<tr>
			<td>
			<p>Chipset</p>
			</td>
			<td>Qualcomm APQ8064 Snapdragon</td>
		</tr>
		<tr>
			<td>
			<p>RAM</p>
			</td>
			<td>2 GB</td>
		</tr>
		<tr>
			<td>
			<p>Chip đồ họa (GPU)</p>
			</td>
			<td>Adreno 320</td>
		</tr>
		<tr>
			<td rowspan="4">
			<p>Bộ nhớ &amp; Lưu trữ</p>
			</td>
			<td>Danh bạ</td>
			<td>Kh&ocirc;ng giới hạn</td>
		</tr>
		<tr>
			<td>
			<p>Bộ nhớ trong (ROM)</p>
			</td>
			<td>16 GB</td>
		</tr>
		<tr>
			<td>
			<p>Thẻ nhớ ngo&agrave;i</p>
			</td>
			<td>MicroSD (T-Flash)</td>
		</tr>
		<tr>
			<td>
			<p>Hỗ trợ thẻ tối đa</p>
			</td>
			<td>32 GB</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Thiết kế &amp; Trọng lượng</p>
			</td>
			<td>Kiểu d&aacute;ng</td>
			<td>Thanh + Cảm ứng</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước</p>
			</td>
			<td>139 x 71 x 7.9 mm</td>
		</tr>
		<tr>
			<td>
			<p>Trọng lượng (g)</p>
			</td>
			<td>146</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Th&ocirc;ng tin pin</p>
			</td>
			<td>Loại pin</td>
			<td>Pin chuẩn Li-Ion</td>
		</tr>
		<tr>
			<td>
			<p>Dung lượng pin</p>
			</td>
			<td>2330 mAh</td>
		</tr>
		<tr>
			<td>
			<p>Pin c&oacute; thể th&aacute;o rời</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="13">
			<p>Kết nối &amp; Cổng giao tiếp</p>
			</td>
			<td>3G</td>
			<td>HSDPA, 42 Mbps; HSUPA, 5.76 Mbps</td>
		</tr>
		<tr>
			<td>
			<p>4G</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Loại Sim</p>
			</td>
			<td>Micro SIM</td>
		</tr>
		<tr>
			<td>
			<p>Khe gắn Sim</p>
			</td>
			<td>1 Sim</td>
		</tr>
		<tr>
			<td>
			<p>Wifi</p>
			</td>
			<td>Wi-Fi 802.11 b/g/n, Wi-Fi Direct, DLNA, Wi-Fi hotspot</td>
		</tr>
		<tr>
			<td>
			<p>GPS</p>
			</td>
			<td>A-GPS v&agrave; GLONASS</td>
		</tr>
		<tr>
			<td>
			<p>Bluetooth</p>
			</td>
			<td>V4.0 with A2DP</td>
		</tr>
		<tr>
			<td>
			<p>GPRS/EDGE</p>
			</td>
			<td>Up to 107 kbps / Up to 296 kbps</td>
		</tr>
		<tr>
			<td>
			<p>Jack tai nghe</p>
			</td>
			<td>3.5 mm</td>
		</tr>
		<tr>
			<td>
			<p>NFC</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối USB</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối kh&aacute;c</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Cổng sạc</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Giải tr&iacute; &amp; Ứng dụng</p>
			</td>
			<td>Xem phim</td>
			<td>MP4, WMV, H.263, H.264(MPEG4-AVC)</td>
		</tr>
		<tr>
			<td>
			<p>Nghe nhạc</p>
			</td>
			<td>MP3, WAV, WMA, eAAC+</td>
		</tr>
		<tr>
			<td>
			<p>Ghi &acirc;m</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Giới hạn cuộc gọi</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>FM radio</p>
			</td>
			<td>FM radio với RDS</td>
		</tr>
		<tr>
			<td>
			<p>Chức năng kh&aacute;c</p>
			</td>
			<td>Mạng x&atilde; hội ảo<br />
			Gmail, Youtube<br />
			Micro chuy&ecirc;n dụng chống ồn</td>
		</tr>
	</tbody>
</table>
', N'<h2>Sony Xperia Z - Smartphone tốt nhất của Sony</h2>

<p><br />
Kh&ocirc;ng phải Sony l&agrave; c&ocirc;ng ty duy nhất đang phải vật lột với vấn đề cạnh tranh trong thị trường điện thoại th&ocirc;ng minh m&agrave; kể cả HTC hay LG cũng đang c&oacute; t&igrave;nh trạng tương tự. Chiến thắng Apple, Samsung l&agrave; điều m&agrave; nh&agrave; sản xuất n&agrave;o cũng mong muốn, v&agrave; &ldquo;si&ecirc;u phẩm&rdquo; của Sony mang t&ecirc;n <strong>Xperia Z</strong> đ&atilde; được tung ra nhằm hi vọng điều đ&oacute;.</p>

<p><strong><img alt="Sony Xperia Z" src="http://cdn.tgdd.vn/Products/Images/42/57958/sony-xperia-z_clip_image002.jpg" style="height:499px; width:504px" /></strong><br />
<em>Sony Xperia Z</em></p>

<p><br />
Điện thoại th&ocirc;ng minh <strong>Sony Xperia Z</strong> đang c&oacute; những th&ocirc;ng số kỹ thuật h&agrave;ng đầu, đ&oacute; l&agrave; một m&agrave;n h&igrave;nh lớn độ ph&acirc;n giải full HD, một camera 13 &ldquo;chấm&rdquo; v&agrave; đặc biệt m&aacute;y c&oacute; khả năng chống thấm nước hiệu quả. Sản phẩm cũng đ&aacute;nh dấu một bước đột ph&aacute; trong thiết kế của Sony, c&aacute;c g&oacute;c cạnh vu&ocirc;ng vắn, mạnh mẽ, hai mặt trước sau đều được l&agrave;m bằng k&iacute;nh chống xước khiến <strong>Xperia Z </strong>trở n&ecirc;n hết sức sang trọng.</p>

<p><img alt="Sony Xperia Z với khả năng chống thấm nước" src="http://cdn.tgdd.vn/Products/Images/42/57958/sony-xperia-z_clip_image004.jpg" style="height:412px; width:550px" /><br />
<em>Sony Xperia Z với khả năng chống thấm nước</em></p>

<h3><br />
Phần cứng</h3>

<p>B&igrave;nh thường, nếu c&aacute;c bạn muốn c&oacute; một điện thoại chống thấm nước th&igrave; phải t&igrave;m đến thị trường Nhật Bản, v&agrave; c&oacute; vẻ như lần n&agrave;y Sony đ&atilde; mang c&ocirc;ng nghệ của m&igrave;nh ra ngo&agrave;i. <strong>Sony Xperia Z</strong> l&agrave; một trong những sản phẩm hiếm hoi c&oacute; khả năng chống nước m&agrave; được ch&iacute;nh thức ph&acirc;n phối b&ecirc;n ngo&agrave;i thị trường Nhật Bản. Ngo&agrave;i khả năng chống nước, m&aacute;y cũng c&oacute; khả năng chịu lực cao, chống b&aacute;m bụi tốt. <strong>Xperia Z</strong> c&oacute; k&iacute;ch thước 139 x 71 x 7.9mm, trọng lượng 146g, mỏng manh, nhẹ nh&agrave;ng nhưng cực kỳ chắc chắn.</p>

<p><img alt="Màn hình sắc nét của Sony Xperia Z " src="http://cdn.tgdd.vn/Products/Images/42/57958/sony-xperia-z_clip_image006.jpg" style="height:378px; width:527px" /><br />
<em>M&agrave;n h&igrave;nh sắc n&eacute;t của Sony Xperia Z </em></p>

<p><br />
Để c&oacute; cảm gi&aacute;c phẳng, rộng r&atilde;i th&igrave; m&agrave;n h&igrave;nh ch&iacute;nh l&agrave; một phần cực kỳ quan trọng, bởi vậy Sony đ&atilde; trang bị cho <strong>Xperia Z</strong> một m&agrave;n h&igrave;nh rộng 5 inch, c&ocirc;ng nghệ m&agrave;n h&igrave;nh LCD TFT, độ ph&acirc;n giải full HD 1920 x 1080 pixels. M&agrave;n h&igrave;nh c&oacute; độ ph&acirc;n giải full HD hiện vẫn đang l&agrave; &ldquo;h&agrave;ng hiếm&rdquo; trong thị trường smartphone, mặc d&ugrave; sắp tới, n&oacute; sẽ trở th&agrave;nh xu hướng mới cho c&aacute;c thiết bị di động cao cấp.</p>

<p><img alt="Sony Xperia Z có màn hình 5 inch full HD" src="http://cdn.tgdd.vn/Products/Images/42/57958/sony-xperia-z_clip_image008.jpg" style="height:417px; width:550px" /><br />
<em>Sony Xperia Z c&oacute; m&agrave;n h&igrave;nh 5 inch full HD</em></p>

<p><br />
Tất nhi&ecirc;n ch&uacute;ng ta kh&ocirc;ng thể kh&ocirc;ng nhắc đến m&agrave;n h&igrave;nh tuyệt đẹp 4.7 inch full HD trong <a href="http://www.thegioididong.com/dtdd/htc-one" target="_blank">HTC One</a> hay <a href="http://www.thegioididong.com/dtdd/htc-butterfly" target="_blank">Droid DNA</a>, tuy nhi&ecirc;n m&agrave;n h&igrave;nh trong <strong>Sony Xperia Z</strong> lớn hơn. Nếu so s&aacute;nh về mật độ điểm ảnh, m&agrave;n h&igrave;nh của <strong>Xperia Z</strong> c&oacute; mật độ l&agrave; 441ppi bằng mật độ của m&agrave;n h&igrave;nh HTC Droid DNA, c&ograve;n của HTC One l&agrave; 468ppi. Như vậy, m&agrave;n h&igrave;nh của Xperia Z c&oacute; mật độ điểm ảnh đứng thứ hai, vượt qua cả c&aacute;c si&ecirc;u phẩm đ&igrave;nh đ&aacute;m hiện nay như <a href="http://www.thegioididong.com/dtdd/iphone-5" target="_blank">iPhone 5</a>, <a href="http://www.thegioididong.com/dtdd/samsung-galaxy-s3-i9300" target="_blank">Galaxy S3</a>, <a href="http://www.thegioididong.com/dtdd/samsung-note-2" target="_blank">Galaxy Note 2</a>&hellip;.</p>

<p><img alt="Có thể ngâm Xperia Z ở độ sâu 1m" src="http://cdn.tgdd.vn/Products/Images/42/57958/sony-xperia-z_clip_image010.jpg" style="height:500px; width:538px" /><br />
<em>C&oacute; thể ng&acirc;m Xperia Z ở độ s&acirc;u 1m</em></p>

<p><br />
M&agrave;n h&igrave;nh của <strong>Sony Xperia Z</strong> được trang bị c&ocirc;ng nghệ Mobile Bravia Engine 2, đ&acirc;y l&agrave; c&ocirc;ng nghệ tối ưu h&oacute;a độ tương phản, tăng độ n&eacute;t của m&agrave;n h&igrave;nh, m&agrave;u sắc trung thực, h&igrave;nh ảnh sắc n&eacute;t hơn v&agrave; n&oacute; được tối ưu h&oacute;a cho mọi hoạt động như xem ảnh, xem video tr&ecirc;n m&aacute;y hay tr&ecirc;n YouTube. Tuy nhi&ecirc;n, g&oacute;c nh&igrave;n của loại m&agrave;n h&igrave;nh n&agrave;y kh&ocirc;ng được rộng, h&igrave;nh ảnh sẽ kh&ocirc;ng c&ograve;n r&otilde; r&agrave;ng khi bạn nh&igrave;n v&agrave;o m&agrave;n h&igrave;nh ở những g&oacute;c hẹp.</p>

<p><img alt="Xperia Z sử dụng công nghệ Mobile Bravia Engine 2" src="http://cdn.tgdd.vn/Products/Images/42/57958/sony-xperia-z_clip_image012.jpg" style="height:313px; width:550px" /><br />
<em>Xperia Z sử dụng c&ocirc;ng nghệ Mobile Bravia Engine 2</em></p>

<p><br />
<strong>Sony Xperia Z</strong> c&oacute; thiết kế tuyệt đẹp v&agrave; hiện đại. Việc trang bị mặt k&iacute;nh cho cả mặt trước v&agrave; sau l&agrave; hết sức th&uacute; vị, mặc d&ugrave; n&oacute; l&agrave;m cho điện thoại trơn hơn, trong khi đ&oacute;, bộ khung của m&aacute;y được l&agrave;m từ sợ Polyamide, một vật liệu c&oacute; độ bền, cứng kh&ocirc;ng thua k&eacute;m g&igrave; kim loại, nhưng lại c&oacute; trọng lượng nhẹ hơn.</p>

<p><img alt="Hai mặt của Xperia Z đều là mặt kính" src="http://cdn.tgdd.vn/Products/Images/42/57958/sony-xperia-z_clip_image014.jpg" style="height:500px; width:374px" /><br />
<em>Hai mặt của Xperia Z đều l&agrave; mặt k&iacute;nh</em></p>

<p><br />
Nhờ thiết kế độc đ&aacute;o của m&igrave;nh, <strong>Xperia Z</strong> c&oacute; khả năng chống nước hiệu quả, đạt ti&ecirc;u chuẩn IP55 v&agrave; IP57, c&oacute; nghĩa l&agrave; bạn c&oacute; thể &ldquo;lặn s&acirc;u 1m c&ugrave;ng với m&aacute;y&rdquo;, hay vừa tắm vừa xem video. Tuy nhi&ecirc;n, đ&oacute; l&agrave; trong điều kiện c&aacute;c cổng kết nối đ&atilde; được bịt k&iacute;n. Cổng microSD, microUSB, jack cắm tai nghe, ổ cắm sạc, tất cả đều c&oacute; &ldquo;c&aacute;nh cửa&rdquo; ri&ecirc;ng để đ&oacute;ng k&iacute;n lại, tr&aacute;nh sự x&acirc;m nhập của nước v&agrave; bụi bẩn. Tất nhi&ecirc;n, nếu bất kỳ một trong những khe cắm bị hở th&igrave; việc chống nước sẽ kh&ocirc;ng c&ograve;n hiệu quả.</p>

<p><img alt="Xperia Z có nút nguồn nhô ra khỏi cạnh máy" src="http://cdn.tgdd.vn/Products/Images/42/57958/sony-xperia-z_clip_image015.jpg" style="height:360px; width:505px" /><br />
<em>Xperia Z c&oacute; n&uacute;t nguồn nh&ocirc; ra khỏi cạnh m&aacute;y</em></p>

<p><br />
C&aacute;c yếu tố thiết kế đ&aacute;ng ch&uacute; &yacute; kh&aacute;c đ&oacute; l&agrave; n&uacute;t nguồn, Sony đ&atilde; thiết kế để n&uacute;t nguồn nằm ở giữa cạnh phải. L&agrave; một n&uacute;t tr&ograve;n, bằng kim loại s&aacute;ng b&oacute;ng, nh&ocirc; ra khỏi cạnh m&aacute;y, như một n&uacute;t nhấn chụp của m&aacute;y ảnh. Trong thực tế ch&uacute;ng ta rất thường xuy&ecirc;n sử dụng n&uacute;t nguồn n&agrave;y, tuy vậy n&oacute; cũng g&acirc;y ch&uacute;t cảm gi&aacute;c phiền phức.</p>

<p><img alt="Xperia Z được trang bị đầy đủ các kết nối " src="http://cdn.tgdd.vn/Products/Images/42/57958/sony-xperia-z_clip_image017.jpg" style="height:344px; width:550px" /><br />
<em>Xperia Z được trang bị đầy đủ c&aacute;c kết nối </em></p>

<p><br />
C&aacute;c kết nối kh&ocirc;ng d&acirc;y cũng được Sony chăm ch&uacute;t chu đ&aacute;o cho <strong>Xperia Z</strong>. M&aacute;y được trang bị c&ocirc;ng nghệ kết nối kh&ocirc;ng d&acirc;y 4G/LTE, 3G/HSPA, c&ugrave;ng bốn băng tần GSM/EDGE. Những kết nối kh&aacute;c bao gồm Wifi a/b/g/n, Bluetooth 4.0, định vị vệ tinh to&agrave;n cầu aGPS/GLONASS,&nbsp;c&ocirc;ng nghệ kết nối trường gần NFC, Wifi Miracast, cổng microUSB 2.0, cổng MHL HDMI, khe cắm microSD.</p>

<p><img alt="Sony Xperia Z với bộ vi xử lí Qualcomm Snapdragon S4 Pro" src="http://cdn.tgdd.vn/Products/Images/42/57958/sony-xperia-z_clip_image019.jpg" style="height:500px; width:305px" /><br />
<em>Sony Xperia Z với bộ vi xử l&iacute; Qualcomm Snapdragon S4 Pro</em></p>

<p><br />
Một th&agrave;nh phần hết sức quan trọng đ&oacute; l&agrave; &ldquo;bộ n&atilde;o&rdquo; của <strong>Xperia Z</strong>, nơi xử l&yacute; mọi hoạt động của thiết bị l&agrave; một bộ vi xử l&yacute; l&otilde;i tứ Qualcomm S4 Pro v&ocirc; c&ugrave;ng mạnh mẽ, tốc độ 1.5GHz. M&aacute;y c&ograve;n được trang bị bộ nhớ Ram 2GB c&ugrave;ng bộ nhớ trong 16GB. M&aacute;y ảnh 13 &ldquo;chấm&rdquo; c&ocirc;ng nghệ Sony Exmor RS, cho chất lượng h&igrave;nh ảnh tuyệt đẹp. Trong khi đ&oacute;, m&aacute;y ảnh trước 2.0MP, c&ocirc;ng nghệ Exmor R cho c&aacute;c chức năng gọi video hay chụp ch&iacute;nh m&igrave;nh.</p>

<h3><br />
Phần mềm</h3>

<p>Sony đ&atilde; t&iacute;ch hợp hệ điều h&agrave;nh Android 4.1.2 Jelly Bean cho <strong>Xperia Z</strong>, mặc d&ugrave; kh&ocirc;ng phải l&agrave; phi&ecirc;n bản Android mới nhất 4.2 tuy nhi&ecirc;n ch&uacute;ng ta sẽ thấy sự quen thuộc trong đ&oacute;. Giao diện trang nh&atilde;, th&acirc;n thiện, một v&agrave;i v&ugrave;ng kh&ocirc;ng gian để chứa c&aacute;c ứng dụng thường xuy&ecirc;n sử dụng v&agrave; một phần l&agrave; nơi chứa c&aacute;c ứng dụng của Sony như Music Unlimited, Video Unlimited (c&oacute; thể mua, cho thu&ecirc;) v&agrave; Sony Select l&agrave; nơi bạn c&oacute; thể download tr&ograve; chơi, ứng dụng như Google Play m&agrave; ch&uacute;ng ta thường thấy trong điện thoại Android.</p>

<p><img alt="Xperia Z chạy Android 4.1.2 Jelly Bean" src="http://cdn.tgdd.vn/Products/Images/42/57958/sony-xperia-z_clip_image020.jpg" style="height:360px; width:477px" /><br />
<em>Xperia Z chạy Android 4.1.2 Jelly Bean</em></p>

<p><br />
Nếu bạn đang sử dụng một chiếc Tivi th&ocirc;ng minh của Sony th&igrave; bạn c&oacute; thể c&agrave;i đặt ứng dụng Media Remote l&ecirc;n <strong>Xperia Z</strong> để từ đ&oacute; điều khiển Tivi th&ocirc;ng qua điện thoại. V&agrave; tất nhi&ecirc;n, Xperia Z cũng t&iacute;ch hợp c&aacute;c ứng dụng mạng x&atilde; hội như Facebook hay Twitter&hellip;</p>

<p><img alt="Mặt kính chống xước của Xperia Z" src="http://cdn.tgdd.vn/Products/Images/42/57958/sony-xperia-z_clip_image022.jpg" style="height:391px; width:550px" /><br />
<em>Mặt k&iacute;nh chống xước của Xperia Z</em></p>

<p><br />
Bạn c&oacute; thể sử dụng camera th&ocirc;ng qua một ph&iacute;m tắt từ m&agrave;n h&igrave;nh kh&oacute;a, tuy nhi&ecirc;n khi chụp xong, m&aacute;y sẽ trở lại m&agrave;n h&igrave;nh kh&oacute;a ban đầu, c&oacute; thể đ&acirc;y l&agrave; chế độ bảo mật của Xperia Z.</p>

<p><br />
Về hiệu suất, <strong>Xperia Z</strong> c&oacute; điểm số ngang bằng với <a href="http://www.thegioididong.com/dtdd/lg-nexus-4" target="_blank">LG Nexus 4</a> v&agrave; HTC Droid DNA, đ&acirc;y l&agrave; điều kh&ocirc;ng c&oacute; g&igrave; phải ngạc nhi&ecirc;n khi nh&igrave;n v&agrave;o trang bị phần cứng của cả ba thiết bị.</p>

<p><img alt="Có thể vừa “bơi” vừa sử dụng Xperia Z" src="http://cdn.tgdd.vn/Products/Images/42/57958/sony-xperia-z_clip_image024.jpg" style="height:360px; width:488px" /><br />
<em>C&oacute; thể vừa &ldquo;bơi&rdquo; vừa sử dụng</em> <em>Xperia Z</em></p>

<p><br />
Một điều đ&aacute;ng ch&uacute; &yacute; đ&oacute; l&agrave;, bạn c&oacute; thể sử dụng m&agrave;n h&igrave;nh cảm ứng ngay cả khi m&aacute;y đang ngập ch&igrave;m trong nước, bởi vậy việc vừa chơi game, vừa tắm l&agrave; điều c&oacute; thể thực hiện khi sử dụng Xperia Z.</p>

<h3><br />
Camera</h3>

<p>Trong khi HTC đ&atilde; x&acirc;y dựng một chiến lược &ldquo;điểm ảnh lớn&rdquo; cho One th&igrave; Sony đi theo con đường truyền thống khi trang bị cảm biến 13.0MP cho <strong>Xperia Z</strong>. Đ&acirc;y l&agrave; cảm biến Exmor RS, c&oacute; thể chụp ảnh thời gian thực (real-time) HDR v&agrave; quay video full HD.</p>

<p><img alt="Hình ảnh được chụp từ camera Xperia Z" src="http://cdn.tgdd.vn/Products/Images/42/57958/sony-xperia-z_clip_image026.jpg" style="height:309px; width:550px" /><br />
<em>H&igrave;nh ảnh được chụp từ camera Xperia Z</em></p>

<p><br />
Thiết bị cũng đi k&egrave;m với một phần mềm m&agrave; sẽ thấy quen thuộc với những ai đ&atilde; sử dụng m&aacute;y ảnh kỹ thuật số Sony trong v&agrave;i năm trở lại đ&acirc;y. C&oacute; nhiều lựa chọn c&agrave;i đặt, t&iacute;nh năng, chế độ h&igrave;nh ảnh trong <strong>Xperia Z</strong>. C&aacute;c chế độ được chọn l&agrave; hết sức r&otilde; r&agrave;ng, cho d&ugrave; l&agrave; lựa chọn chế độ chụp thể thao, ch&acirc;n dung, phong cảnh&hellip; trong tổng số 36 thiết lập th&igrave; bạn sẽ thấy sự thay đổi chất lượng h&igrave;nh ảnh trong đ&oacute;. C&aacute;c chế độ cũng được kết hợp với t&iacute;nh năng chụp HDR c&ugrave;ng c&ocirc;ng cụ chống rung hiệu quả.</p>

<p><img alt="Xperia Z cho chất lượng tốt trong điều kiện ánh sáng thấp" src="http://cdn.tgdd.vn/Products/Images/42/57958/sony-xperia-z_clip_image028.jpg" style="height:309px; width:550px" /><br />
<em>Xperia Z cho chất lượng tốt trong điều kiện &aacute;nh s&aacute;ng thấp</em></p>

<p><br />
Tất nhi&ecirc;n, bạn c&oacute; thể tự c&agrave;i đặt bằng tay, mặc d&ugrave; bạn sẽ kh&aacute; bối rối trong lần đầu thiết lập. C&oacute; một tr&igrave;nh c&agrave;i đặt, nơi bạn c&oacute; thể chọn độ ph&acirc;n giải của bức ảnh (l&ecirc;n đến 12MP tỷ lệ 4:3 hay 9MP tỷ lệ 16:09), chế độ video, HDR, to&agrave;n cảnh v&agrave; c&aacute;c t&ugrave;y chọn cao cấp kh&aacute;c&hellip;</p>

<p><img alt="Xperia Z cho chất lượng ảnh sắc nét đến từng chi tiết" src="http://cdn.tgdd.vn/Products/Images/42/57958/sony-xperia-z_clip_image030.jpg" style="height:412px; width:550px" /><br />
<em>Xperia Z cho chất lượng ảnh sắc n&eacute;t đến từng chi tiết</em></p>

<p><br />
Điều quan trọng ở đ&acirc;y đ&oacute; l&agrave; chất lượng h&igrave;nh ảnh, v&agrave; <strong>Xperia Z</strong> sẽ l&agrave;m được g&igrave;? Video c&oacute; chất lượng h&igrave;nh ảnh tốt, giảm tiếng ồn nhờ bộ lọc, đặc biệt khi ở b&ecirc;n ngo&agrave;i v&agrave; kể cả khi trong điều kiện &aacute;nh s&aacute;ng yếu.</p>

<p><br />
<em>Video quay từ Xperia Z ở chế độ full HD</em></p>

<p><br />
<em>Video quay ở chế độ HDR</em></p>

<p><br />
Camera của <strong>Xperia Z</strong> c&oacute; chế độ c&acirc;n bằng s&aacute;ng tốt, chống rung hiệu quả, đặc biệt l&agrave; trong chế độ quay video HDR, điều m&agrave; c&aacute;c m&aacute;y kh&aacute;c kh&oacute; l&agrave;m được. Sony đ&atilde; kh&ocirc;ng l&agrave;m như c&aacute;c h&atilde;ng kh&aacute;c, kh&ocirc;ng tăng m&agrave;u sắc m&agrave; mở rộng độ tương phản để h&igrave;nh ảnh r&otilde; n&eacute;t hơn.</p>

<h3><br />
Chức năng nghe gọi v&agrave; pin</h3>

<p>Thiết bị hỗ trợ nghe nhạc v&agrave; xem phim trực tuyến bởi vậy t&iacute;nh năng kết nối mạng l&agrave; hết sức cần thiết. <strong>Xperia Z</strong> hỗ trợ kết nối kh&ocirc;ng d&acirc;y băng th&ocirc;ng rộng 4G/LTE tuy nhi&ecirc;n nếu ở Việt Nam chưa hỗ trợ 4G th&igrave; bạn vẫn y&ecirc;n t&acirc;m sử dụng 3G để online thường xuy&ecirc;n.</p>

<p><img alt="Xperia Z chơi game tuyệt đỉnh " src="http://cdn.tgdd.vn/Products/Images/42/57958/sony-xperia-z_clip_image032.jpg" style="height:345px; width:550px" /><br />
<em>Xperia Z chơi game tuyệt đỉnh </em></p>

<p><br />
Kết nối cuộc gọi cũng nhanh ch&oacute;ng v&agrave; kh&ocirc;ng bị đứt qu&atilde;ng hay mất s&oacute;ng, loa nghe to r&otilde;. Hiện tại ch&uacute;ng ta cũng chưa hiểu Sony chống thấm nước qua loa như thế n&agrave;o?</p>

<p><br />
Với một m&agrave;n h&igrave;nh lớn, full HD, bạn sẽ lo lắng về thời lượng pin tuy nhi&ecirc;n Sony tuy&ecirc;n bố<strong> Xperia Z</strong> c&oacute; thời lượng pin đ&agrave;m thoại l&ecirc;n đến 11 giờ hoặc 550 giờ ở chế độ chờ, lưu &yacute; l&agrave; trong điều kiện m&agrave;n h&igrave;nh đang tắt.</p>

<p><img alt="Xperia Z và Nexus 4" src="http://cdn.tgdd.vn/Products/Images/42/57958/sony-xperia-z_clip_image033.jpg" style="height:285px; width:529px" /><br />
<em>Xperia Z v&agrave; Nexus 4</em></p>

<p><br />
Sony đặc biệt tự h&agrave;o về chế độ STAMINA của m&aacute;y, ở chế độ n&agrave;y tất cả c&aacute;c kết nối sẽ được ngưng lại, nhờ vậy m&agrave; thời lượng pin ở chế độ n&agrave;y sẽ k&eacute;o d&agrave;i gấp 4 lần so với chế độ thường. Tuy nhi&ecirc;n, thay v&igrave; c&oacute; thể cập nhật email, facebook, hay cập nhật c&aacute;c ứng dụng kh&aacute;c li&ecirc;n tục th&igrave; người d&ugrave;ng sẽ nhận được c&aacute;c cập nhật khi mở m&aacute;y.</p>

<p><br />
M&agrave;n h&igrave;nh, vi xử l&yacute; mạnh mẽ sẽ &ldquo;ngốn&rdquo; rất nhiều pin của m&aacute;y v&agrave; chế độ STAMINA sẽ chỉ hữu dụng khi m&agrave;n h&igrave;nh tắt. Sau mỗi lần sạc, bạn c&oacute; thể sử dụng m&aacute;y trong 24 tiếng, tất nhi&ecirc;n thời lượng d&agrave;i hơn hay ngắn hơn sẽ c&ograve;n phụ thuộc v&agrave;o c&aacute;ch sử dụng của bạn.</p>

<h3><br />
Tổng kết</h3>

<p><strong>Xperia Z</strong> l&agrave; một điện thoại th&ocirc;ng minh h&agrave;ng đầu hiện nay, c&oacute; m&agrave;n h&igrave;nh tốt nhất m&agrave; Sony đ&atilde; từng sử dụng, một m&aacute;y ảnh cao cấp, khả năng chống thấm, chống b&aacute;m bụi, kiểu d&aacute;ng đẹp, mượt m&agrave;, sang trọng. N&oacute; kh&ocirc;ng phải kiểu rẻ tiền như trong c&aacute;c thiết kế vỏ nhựa nhưng cũng kh&ocirc;ng phải l&agrave; mặt nh&ocirc;m. Nếu bạn l&agrave; một t&iacute;n đồ c&ocirc;ng nghệ, lu&ocirc;n t&igrave;m t&ograve;i kh&aacute;m ph&aacute;m, đổi mới th&igrave; Xperia Z l&agrave; một điện thoại m&agrave; bạn đ&atilde; chờ đợi.</p>

<p><img alt="Xperia Z với Galaxy Note II" src="http://cdn.tgdd.vn/Products/Images/42/57958/sony-xperia-z_clip_image034.jpg" style="height:310px; width:550px" /><br />
<em>Xperia Z với Galaxy Note II</em></p>

<p><br />
Mặt kh&aacute;c, trong bối cảnh cạnh tranh khốc liệt hiện nay, Sony dường như cũng kh&oacute; khăn hơn trong việc t&igrave;m đ&uacute;ng hướng đi cho m&igrave;nh. <strong>Xperia Z</strong> c&oacute; thiết kế theo cả hai phong c&aacute;ch hiện đại v&agrave; cổ điển. B&oacute;ng bẩy bằng hai mặt k&iacute;nh nhưng cũng nguy&ecirc;n sơ bằng một n&uacute;t nguồn &ldquo;to tướng&rdquo;. N&oacute; tốt hơn Galaxy S3, tuy nhi&ecirc;n như c&aacute;c bạn đ&atilde; thấy, Samsung chuẩn bị tung ra S4, m&agrave; dự định n&oacute; sẽ gi&uacute;p h&atilde;ng lấy lại thế c&acirc;n bằng về độ ph&acirc;n giải m&agrave;n h&igrave;nh trong smartphone.</p>

<p><img alt="Xperia Z và BB Z10" src="http://cdn.tgdd.vn/Products/Images/42/57958/sony-xperia-z_clip_image036.jpg" style="height:323px; width:550px" /><br />
<em>Xperia Z v&agrave; BB Z10</em></p>

<p><br />
Chế độ STAMINA l&agrave; một &yacute; tưởng t&aacute;o bạo, gi&uacute;p thời lượng pin được bền l&acirc;u hơn. Sony đơn giản l&agrave; gi&uacute;p <strong>Xperia Z</strong> tr&aacute;nh hết pin qu&aacute; nhanh, pin sẽ sử dụng hiệu quả hơn khi người d&ugrave;ng thực sự sử dụng thiết bị. Với t&iacute;nh năng chống thấm c&oacute; nghĩa l&agrave; pin kh&ocirc;ng thể th&aacute;o rời.</p>

<p><br />
<strong>Xperia Z</strong> đ&aacute;nh dấu một sự trưởng th&agrave;nh của Sony khi bước ch&acirc;n v&agrave;o thị trường smartphone đầy cạnh tranh, l&agrave; sự đầu tư nghi&ecirc;m t&uacute;c cũng như tinh tế v&agrave;o sản phẩm của m&igrave;nh. Xperia Z xứng đ&aacute;ng để c&oacute; thể thay thế iPhone, Galaxy hay bất cứ d&ograve;ng điện thoại th&ocirc;ng minh cao cấp kh&aacute;c hiện nay.</p>

<h3><br />
Một số h&igrave;nh ảnh chụp từ &ldquo;si&ecirc;u phẩm&rdquo; Xperia Z</h3>

<p><br />
<strong><img alt="Xperia Z với hình ảnh chụp góc cột" src="http://cdn.tgdd.vn/Products/Images/42/57958/sony-xperia-z_clip_image038.jpg" style="height:412px; width:550px" /></strong><br />
<strong><img alt="Xperia Z với hình ảnh chụp cà chua" src="http://cdn.tgdd.vn/Products/Images/42/57958/sony-xperia-z_clip_image040.jpg" style="height:412px; width:550px" /></strong><br />
<strong><img alt="Xperia Z với hình ảnh chụp đồi cỏ" src="http://cdn.tgdd.vn/Products/Images/42/57958/sony-xperia-z_clip_image042.jpg" style="height:309px; width:550px" /></strong><br />
<strong><img alt="Xperia Z với hình ảnh chụp siêu thị" src="http://cdn.tgdd.vn/Products/Images/42/57958/sony-xperia-z_clip_image044.jpg" style="height:413px; width:550px" /></strong></p>

<p><strong>Hữu T&igrave;nh</strong></p>

<table>
	<tbody>
		<tr>
			<td>
			<h3>Ưu điểm</h3>

			<ul>
				<li>Thiết kế chống thấm nước v&agrave; bụi, 2 mặt được trang bị k&iacute;nh cường lực, chịu va đập tốt.</li>
				<li>Cảm nhận như thật với m&agrave;n h&igrave;nh Full HD 5 inch.</li>
				<li>Cấu h&igrave;nh mạnh mẽ, hoạt động si&ecirc;u nhanh, thời lượng pin l&acirc;u.</li>
				<li>Chụp ảnh, quay phim tuyệt đẹp trong mọi điều kiện &aacute;nh s&aacute;ng.</li>
				<li>Giải tr&iacute; bất tận với tai nghe Sony MH-EX300AP &nbsp;đi k&egrave;m.</li>
			</ul>
			</td>
			<td>
			<h3>Nhược điểm</h3>

			<ul>
				<li>M&aacute;y được thiết kế vu&ocirc;ng vức, n&ecirc;n kh&oacute; cầm nắm.</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>
', 5, 99, 5, 0, 1, CAST(N'2014-03-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (26, N'Sony Xperia E', N'/Content/Images/Sony/Sony Xperia E.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/Sony/Hinh360-Sony/Sony-Xperia-Z-hinh360-1.jpg', N'" /> </a>', CAST(2490000 AS Decimal(18, 0)), CAST(2850000 AS Decimal(18, 0)), N'Màn hình:	HVGA, 3.5", 320 x 480 Pixels
CPU:	Qualcomm MSM7227A, 1 nhân, 1 GHz
RAM	512 MB
Hệ điều hành:	Android 4.1 (Jelly Bean)
SIM:	1 Sim
Camera:	3.2 MP, Quay phim VGA
Bộ nhớ trong:	4 GB
Thẻ nhớ ngoài đến:	32 GB
Dung lượng pin:	1530 mAh', N'<img class="lazy" src="http://cdn.tgdd.vn/Products/Images/42/57853/Kit/Sony-Xperia-E-C1505-mo-ta-chuc-nang.jpg">  <table style="width: 100%;" class="product-compare" border="0" cellpadding="0" cellspacing="0">
    <tbody>
        <tr class="r">
            <td rowspan="2" class="g" valign="top">
            <div class="gh">Thông tin chung</div>
            </td>
            <td id="prop_72" class="p f eph" onclick="ShowHelp(72, 2);">Hệ điều hành</td>
            <td id="c72_1" class="v f">Android 4.1 (Jelly Bean)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_75" class="ph eph" onclick="ShowHelp(75, 2);">Ngôn ngữ</div>
            </td>
            <td id="c75_1" class="v">Tiếng Việt, Tiếng Anh</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Màn hình</div>
            </td>
            <td class="p f">Loại màn hình</td>
            <td id="c6459_1" class="v f">TFT</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Màu màn hình</div>
            </td>
            <td id="c6239_1" class="v">262.144 màu</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_77" class="ph eph" onclick="ShowHelp(77, 2);">Chuẩn màn hình</div>
            </td>
            <td id="c77_1" class="v">HVGA</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_78" class="ph eph" onclick="ShowHelp(78, 2);">Độ phân giải</div>
            </td>
            <td id="c78_1" class="v">320 x 480 Pixels</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_79" class="ph eph" onclick="ShowHelp(79, 2);">Màn hình rộng</div>
            </td>
            <td id="c79_1" class="v">3.5"</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_80" class="ph eph" onclick="ShowHelp(80, 2);">Công nghệ cảm ứng</div>
            </td>
            <td id="c80_1" class="v">Cảm ứng điện dung đa điểm</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Chụp hình &amp; Quay phim</div>
            </td>
            <td id="prop_27" class="p f eph" onclick="ShowHelp(27, 2);">Camera sau</td>
            <td id="c27_1" class="v f">3.2 MP</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_29" class="ph eph" onclick="ShowHelp(29, 2);">Camera trước</div>
            </td>
            <td id="c29_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Đèn Flash</div>
            </td>
            <td id="c6460_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_28" class="ph eph" onclick="ShowHelp(28, 2);">Tính năng camera</div>
            </td>
            <td id="c28_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_31" class="ph eph" onclick="ShowHelp(31, 2);">Quay phim</div>
            </td>
            <td id="c31_1" class="v">Quay phim VGA</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_30" class="ph eph" onclick="ShowHelp(30, 2);">Videocall</div>
            </td>
            <td id="c30_1" class="v">Không</td>
        </tr>
        <tr class="r">
            <td rowspan="5" class="g" valign="top">
            <div class="gh">CPU &amp; RAM</div>
            </td>
            <td id="prop_51" class="p f eph" onclick="ShowHelp(51, 2);">Tốc độ CPU</td>
            <td id="c51_1" class="v f">1 GHz</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Số nhân</div>
            </td>
            <td id="c6461_1" class="v">1 nhân</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6059" class="ph eph" onclick="ShowHelp(6059, 2);">Chipset</div>
            </td>
            <td id="c6059_1" class="v">Qualcomm MSM7227A</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">RAM</div>
            </td>
            <td id="c50_1" class="v">512 MB</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6079" class="ph eph" onclick="ShowHelp(6079, 2);">Chip đồ họa (GPU)</div>
            </td>
            <td id="c6079_1" class="v">Adreno 200</td>
        </tr>
        <tr class="r">
            <td rowspan="4" class="g" valign="top">
            <div class="gh">Bộ nhớ &amp; Lưu trữ</div>
            </td>
            <td id="prop_54" class="p f eph" onclick="ShowHelp(54, 2);">Danh bạ</td>
            <td id="c54_1" class="v f">Không giới hạn</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_49" class="ph eph" onclick="ShowHelp(49, 2);">Bộ nhớ trong (ROM)</div>
            </td>
            <td id="c49_1" class="v">4 GB</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_52" class="ph eph" onclick="ShowHelp(52, 2);">Thẻ nhớ ngoài</div>
            </td>
            <td id="c52_1" class="v">MicroSD (T-Flash)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_53" class="ph eph" onclick="ShowHelp(53, 2);">Hỗ trợ thẻ tối đa</div>
            </td>
            <td id="c53_1" class="v">32 GB</td>
        </tr>
        <tr class="r">
            <td rowspan="3" class="g" valign="top">
            <div class="gh">Thiết kế &amp; Trọng lượng</div>
            </td>
            <td id="prop_73" class="p f eph" onclick="ShowHelp(73, 2);">Kiểu dáng</td>
            <td id="c73_1" class="v f">Thanh + Cảm ứng</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_88" class="ph eph" onclick="ShowHelp(88, 2);">Kích thước</div>
            </td>
            <td id="c88_1" class="v">113.5 x 61.8 x 11 mm</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_100" class="ph eph" onclick="ShowHelp(100, 2);">Trọng lượng (g)</div>
            </td>
            <td id="c100_1" class="v">115.7</td>
        </tr>
        <tr class="r">
            <td rowspan="3" class="g" valign="top">
            <div class="gh">Thông tin pin</div>
            </td>
            <td class="p f">Loại pin</td>
            <td id="c83_1" class="v f">Pin chuẩn Li-Ion</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_84" class="ph eph" onclick="ShowHelp(84, 2);">Dung lượng pin</div>
            </td>
            <td id="c84_1" class="v">1530 mAh</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Pin có thể tháo rời</div>
            </td>
            <td id="c6462_1" class="v">Có</td>
        </tr>
        <tr class="r">
            <td rowspan="13" class="g" valign="top">
            <div class="gh">Kết nối &amp; Cổng giao tiếp</div>
            </td>
            <td id="prop_65" class="p f eph" onclick="ShowHelp(65, 2);">3G</td>
            <td id="c65_1" class="v f">HSDPA, 7.2 Mbps; HSUPA, 5.76 Mbps</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">4G</div>
            </td>
            <td id="c6463_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Loại Sim</div>
            </td>
            <td id="c6339_1" class="v">SIM bình thường</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_60" class="ph eph" onclick="ShowHelp(60, 2);">Khe gắn Sim</div>
            </td>
            <td id="c60_1" class="v">1 Sim</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_66" class="ph eph" onclick="ShowHelp(66, 2);">Wifi</div>
            </td>
            <td id="c66_1" class="v">Wi-Fi 802.11 b/g/n, DLNA, Wi-Fi hotspot</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_68" class="ph eph" onclick="ShowHelp(68, 2);">GPS</div>
            </td>
            <td id="c68_1" class="v">A-GPS</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_69" class="ph eph" onclick="ShowHelp(69, 2);">Bluetooth</div>
            </td>
            <td id="c69_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_61" class="ph eph" onclick="ShowHelp(61, 2);">GPRS/EDGE</div>
            </td>
            <td id="c61_1" class="v">Up to 86 kbps / Up to 237 kbps</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_48" class="ph eph" onclick="ShowHelp(48, 2);">Jack tai nghe</div>
            </td>
            <td id="c48_1" class="v">3.5 mm</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">NFC</div>
            </td>
            <td id="c6464_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_71" class="ph eph" onclick="ShowHelp(71, 2);">Kết nối USB</div>
            </td>
            <td id="c71_1" class="v">Micro USB</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Kết nối khác</div>
            </td>
            <td id="c5199_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Cổng sạc</div>
            </td>
            <td id="c85_1" class="v">Micro USB</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Giải trí &amp; Ứng dụng</div>
            </td>
            <td id="prop_32" class="p f eph" onclick="ShowHelp(32, 2);">Xem phim</td>
            <td id="c32_1" class="v f">MP4, WMV, H.263, H.264(MPEG4-AVC)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_33" class="ph eph" onclick="ShowHelp(33, 2);">Nghe nhạc</div>
            </td>
            <td id="c33_1" class="v">MP3, WAV, WMA, eAAC+</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_36" class="ph eph" onclick="ShowHelp(36, 2);">Ghi âm</div>
            </td>
            <td id="c36_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6039" class="ph eph" onclick="ShowHelp(6039, 2);">Giới hạn cuộc gọi</div>
            </td>
            <td id="c6039_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_34" class="ph eph" onclick="ShowHelp(34, 2);">FM radio</div>
            </td>
            <td id="c34_1" class="v">FM radio với RDS</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Chức năng khác</div>
            </td>
            <td id="c43_1" class="v">Mạng xã hội ảo<br>Gmail, Youtube<br>Micro chuyên dụng chống ồn</td>
        </tr>
    </tbody>
</table>', N'<h2 align="center">Sony Xperia E C1505 – Thiết chắc chắn, giá phải chăng, kết nối nhanh chóng</h2><p style="text-align: justify;" align=""><strong><br>Xperia E C1505 </strong>là một điện thoại thông minh giá rẻ của Sony, một hãng điện thoại Nhật Bản nổi tiếng với những sản phẩm “ăn chắc mặc bền”.<strong></strong></p>&nbsp;<h3 align=""><br>Thiết kế đẹp, chắc chắn</h3><p style="text-align: justify;" align=""><strong>Sony Xperia E </strong>có thiết kế mặt trước hình chữ nhật, kiểu thanh đứng, các góc bo tròn rất nhẹ, một đường viền kim loại mỏng chạy xung quanh chu vi máy. Bởi thế, mặc dù bộ vỏ bằng nhựa nhưng máy rất chắc chắn.</p><p align="center"><img title="Thiết kế đẹp mắt của Sony Xperia E" src="http://cdn.tgdd.vn/Products/Images/42/57853/sony-xperia-e-c1505_clip_image002.jpg" alt="Thiết kế đẹp mắt của Sony Xperia E" height="400" width="292"> <br><em>Thiết kế đẹp mắt của Sony Xperia E</em></p><p style="text-align: justify;" align=""><br>Mặt sau của máy khá mịn màng và “sạch sẽ” với một logo XPERIA ở giữa và máy ảnh ở phía sát cạnh trên. Bên cạnh phải phía trên của <strong>Xperia E </strong>là nút điều chỉnh âm lượng, sát bên dưới là nút nguồn và ở bên dưới là nút chụp ảnh, rất tiện lợi và dễ sử dụng. Cạnh trái chỉ duy nhất cổng kết nối microUSB làm hai nhiệm vụ, kết nối máy tính để truyền tải dữ liệu và sạc pin.</p><p align="center"><img title="Sony Xperia E với màn hình 3.5 inch" src="http://cdn.tgdd.vn/Products/Images/42/57853/sony-xperia-e-c1505_clip_image004.jpg" alt="Sony Xperia E với màn hình 3.5 inch" height="567" width="550"> <br><em>Sony Xperia E với màn hình 3.5 inch</em></p><p style="text-align: justify;" align=""><br>Đặc biệt, phía sau của <strong>Xperia E C1505 </strong>thiết kế hơi lượn sóng, ở giữa hẹp hơn ở hai bên, đây là thiết kế hướng tới người dùng, cho cảm giác cầm máy một cách tốt nhất và dễ sử dụng nhất.</p><p align="center"><img title="Thiết kế “lượn sóng” của Sony Xperia E" src="http://cdn.tgdd.vn/Products/Images/42/57853/sony-xperia-e-c1505_clip_image006.jpg" alt="Thiết kế “lượn sóng” của Sony Xperia E" height="124" width="600"> <br><em>Thiết kế “lượn sóng” của Sony Xperia E</em></p>&nbsp;<h3 align=""><br>Cấu hình khá</h3><p style="text-align: justify;" align=""><strong>Sony Xperia E C1505</strong> được trang bị một bộ vi xử lý tốc độ 1GHz kết hợp với bộ nhớ RAM 512MB cùng bộ nhớ trong 4GB. Với cấu hình này, máy đủ sức để sử dụng các trò chơi vừa phải hiện nay cũng như cài đặt và sử dụng tốt hầu hết các phần mềm, tiện ích trên Android.</p><p align="center"><img title="Sony Xperia E có cấu hình khá" src="http://cdn.tgdd.vn/Products/Images/42/57853/sony-xperia-e-c1505_clip_image008.jpg" alt="Sony Xperia E có cấu hình khá" height="457" width="559"><br><em>Sony Xperia E có cấu hình khá</em></p><p style="text-align: justify;" align=""><strong><br>Xperia E</strong> được trang bị máy ảnh 3.2MP, mặc dù chưa sắc nét nhưng đủ để bạn có những bức ảnh đẹp để bạn chia sẻ với bạn bè trên mạng xã hội.</p>&nbsp;<h3 align=""><br>Nhiều màu sắc để bạn chọn lựa</h3><p align="center"><strong><img title="Sony Xperia E với tông màu đen lịch lãm" src="http://cdn.tgdd.vn/Products/Images/42/57853/sony-xperia-e-c1505_clip_image010.jpg" alt="Sony Xperia E với tông màu đen lịch lãm" height="500" width="356"></strong><strong> </strong><br><em>Sony Xperia E có tông màu đen lịch lãm</em></p><p style="text-align: justify;" align=""><br>Màu đen sang trọng lịch lãm, màu trắng tinh khôi, màu hồng trẻ trung phù hợp với bạn nữ… <strong>Sony Xperia E C1505</strong> có nhiều màu sắc cho bạn. Bởi vậy, bạn sẽ thoải mái lựa chọn những màu sắc phù hợp với giới tính, sở thích của mình.</p>&nbsp;<h3 align=""><br>Hỗ trợ 3G, Wifi lướt web vi vu</h3><p style="text-align: justify;" align=""><strong>Xperia E </strong>hỗ trợ mạng 2G, Wifi và đặc biệt là mạng 3G để có thể kết nối mọi lúc mọi nơi, nhanh chóng và tiện lợi.</p><p align="center"><img title="Lướt web vi vu cùng Sony Xperia E" src="http://cdn.tgdd.vn/Products/Images/42/57853/sony-xperia-e-c1505_clip_image012.jpg" alt="Lướt web vi vu cùng Sony Xperia E" height="417" width="584"> <br><em>Lướt web vi vu cùng Sony Xperia E</em></p><p style="text-align: justify;" align=""><br>Bạn đang ngồi trên tàu xe, hay chờ đợi một ai đó, bạn có thể dùng mạng 3G để lướt web, vào mạng xã hội, xem phim trực tuyến…</p>&nbsp;<h3 align=""><br>Đầy đủ kết nối</h3><p style="text-align: justify;" align="">Ngoài các kết nối mạng 2G, 3G và Wifi <strong>Sony Xperia E </strong>còn có cảm biến GPS định vị vệ tinh toàn cầu, nhờ nó, bạn có thể biết được mình đang ở đâu hoặc tìm đường qua Google Map.</p><p align="center"><img title="Sony Xperia E hỗ trợ đầy đủ kết nối" src="http://cdn.tgdd.vn/Products/Images/42/57853/sony-xperia-e-c1505_clip_image014.jpg" alt="Sony Xperia E hỗ trợ đầy đủ kết nối" height="129" width="600"> <br><em>Sony Xperia E hỗ trợ đầy đủ kết nối</em></p><p style="text-align: justify;" align=""><br>Máy còn hỗ trợ tính năng Wifi hotspot để có thể chia sẻ&nbsp; mạng với các thiết bị khác, cổng microUSB để truyền tải dữ liệu dễ dàng, hỗ trợ Bluetooth để kết nối tới các thiết bị khác hoặc sử dụng tai nghe Bluetooth. Khe cắm thẻ nhớ để mở rộng bộ nhớ lưu trữ, nó có thể hỗ trợ thẻ nhớ lên đến 32GB.</p><p align="right"><strong>Hữu Tình</strong></p><table class="advantage"><tbody><tr><td><h3>Ưu điểm</h3><ul>
	<li>Thiết kế chắc chắn, đẹp mắt.</li>
	<li>Trình quản lý pin, dữ liệu hiệu quả.</li>
	<li>Nghe nhạc cực hay với ứng dụng WALKMAN.</li>
	<li>HĐH Android 4.1 mượt mà, ổn định.</li>
</ul></td><td><h3>Nhược điểm</h3><ul>
	<li>Không có máy ảnh trước.</li>
	<li>Bộ nhớ trong hơi thấp.</li>
</ul></td></tr></tbody></table>', 5, 99, 1, 5, 0, CAST(N'2014-03-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (27, N'Sony Xperia Z Ultra', N'/Content/Images/Sony/Sony Xperia Z Ultra.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/Sony/Hinh360-Sony/Sony-Xperia-Z-hinh360-1.jpg', N'" /> </a>', CAST(4990000 AS Decimal(18, 0)), CAST(5400000 AS Decimal(18, 0)), N'<p>M&agrave;n h&igrave;nh: Full HD, 6.4&quot;, 1080 x 1920 pixels CPU: Qualcomm MSM8974, 4 nh&acirc;n, 2.2 GHz RAM 2 GB Hệ điều h&agrave;nh: Android 4.2.2 (Jelly Bean) Camera ch&iacute;nh: 8.0 MP, Quay phim FullHD 1080p@30fps Camera phụ: 2.0 MP Bộ nhớ trong: 16 GB Thẻ nhớ ngo&agrave;i đến: 64 GB Dung lượng pin: 3050 mAh</p>
', N'<p><img src="http://cdn.tgdd.vn/Products/Images/42/59952/Kit/Sony-Xperia-Z-Ultra-C6802-mo-ta-chuc-nang.jpg" /></p>

<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td rowspan="2">
			<p>Th&ocirc;ng tin chung</p>
			</td>
			<td>Hệ điều h&agrave;nh</td>
			<td>Android 4.2.2 (Jelly Bean)</td>
		</tr>
		<tr>
			<td>
			<p>Ng&ocirc;n ngữ</p>
			</td>
			<td>Tiếng Việt, Tiếng Anh</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>Loại m&agrave;n h&igrave;nh</td>
			<td>TFT</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;u m&agrave;n h&igrave;nh</p>
			</td>
			<td>16 triệu m&agrave;u</td>
		</tr>
		<tr>
			<td>
			<p>Chuẩn m&agrave;n h&igrave;nh</p>
			</td>
			<td>Full HD</td>
		</tr>
		<tr>
			<td>
			<p>Độ ph&acirc;n giải</p>
			</td>
			<td>1080 x 1920 pixels</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh rộng</p>
			</td>
			<td>6.4&quot;</td>
		</tr>
		<tr>
			<td>
			<p>C&ocirc;ng nghệ cảm ứng</p>
			</td>
			<td>Cảm ứng điện dung đa điểm</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Chụp h&igrave;nh &amp; Quay phim</p>
			</td>
			<td>Camera sau</td>
			<td>8.0 MP</td>
		</tr>
		<tr>
			<td>
			<p>Camera trước</p>
			</td>
			<td>2.0 MP</td>
		</tr>
		<tr>
			<td>
			<p>Đ&egrave;n Flash</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>T&iacute;nh năng camera</p>
			</td>
			<td>Tự động lấy n&eacute;t, chạm lấy n&eacute;t<br />
			Nhận diện khu&ocirc;n mặt, nụ cười</td>
		</tr>
		<tr>
			<td>
			<p>Quay phim</p>
			</td>
			<td>Quay phim FullHD 1080p@30fps</td>
		</tr>
		<tr>
			<td>
			<p>Videocall</p>
			</td>
			<td>Hỗ trợ VideoCall qua Skype</td>
		</tr>
		<tr>
			<td rowspan="5">
			<p>CPU &amp; RAM</p>
			</td>
			<td>Tốc độ CPU</td>
			<td>2.2 GHz</td>
		</tr>
		<tr>
			<td>
			<p>Số nh&acirc;n</p>
			</td>
			<td>4 nh&acirc;n</td>
		</tr>
		<tr>
			<td>
			<p>Chipset</p>
			</td>
			<td>Qualcomm MSM8974</td>
		</tr>
		<tr>
			<td>
			<p>RAM</p>
			</td>
			<td>2 GB</td>
		</tr>
		<tr>
			<td>
			<p>Chip đồ họa (GPU)</p>
			</td>
			<td>Adreno 330</td>
		</tr>
		<tr>
			<td rowspan="4">
			<p>Bộ nhớ &amp; Lưu trữ</p>
			</td>
			<td>Danh bạ</td>
			<td>Kh&ocirc;ng giới hạn</td>
		</tr>
		<tr>
			<td>
			<p>Bộ nhớ trong (ROM)</p>
			</td>
			<td>16 GB</td>
		</tr>
		<tr>
			<td>
			<p>Thẻ nhớ ngo&agrave;i</p>
			</td>
			<td>MicroSD (T-Flash)</td>
		</tr>
		<tr>
			<td>
			<p>Hỗ trợ thẻ tối đa</p>
			</td>
			<td>64 GB</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Thiết kế &amp; Trọng lượng</p>
			</td>
			<td>Kiểu d&aacute;ng</td>
			<td>Thanh + Cảm ứng</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước</p>
			</td>
			<td>179.4 x 92.2 x 6.5 mm</td>
		</tr>
		<tr>
			<td>
			<p>Trọng lượng (g)</p>
			</td>
			<td>212</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Th&ocirc;ng tin pin</p>
			</td>
			<td>Loại pin</td>
			<td>Pin chuẩn Li-Ion</td>
		</tr>
		<tr>
			<td>
			<p>Dung lượng pin</p>
			</td>
			<td>3050 mAh</td>
		</tr>
		<tr>
			<td>
			<p>Pin c&oacute; thể th&aacute;o rời</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="13">
			<p>Kết nối &amp; Cổng giao tiếp</p>
			</td>
			<td>3G</td>
			<td>HSDPA, 42 Mbps; HSUPA, 5.76 Mbps</td>
		</tr>
		<tr>
			<td>
			<p>4G</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Loại Sim</p>
			</td>
			<td>Micro SIM</td>
		</tr>
		<tr>
			<td>
			<p>Khe gắn Sim</p>
			</td>
			<td>1 Sim</td>
		</tr>
		<tr>
			<td>
			<p>Wifi</p>
			</td>
			<td>Wi-Fi 802.11 a/b/g/n, DLNA, Wi-Fi Direct, dual-band, Wi-Fi hotspot</td>
		</tr>
		<tr>
			<td>
			<p>GPS</p>
			</td>
			<td>A-GPS v&agrave; GLONASS</td>
		</tr>
		<tr>
			<td>
			<p>Bluetooth</p>
			</td>
			<td>V4.0 with A2DP</td>
		</tr>
		<tr>
			<td>
			<p>GPRS/EDGE</p>
			</td>
			<td>Up to 107 kbps / Up to 296 kbps</td>
		</tr>
		<tr>
			<td>
			<p>Jack tai nghe</p>
			</td>
			<td>3.5 mm</td>
		</tr>
		<tr>
			<td>
			<p>NFC</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối USB</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối kh&aacute;c</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Cổng sạc</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Giải tr&iacute; &amp; Ứng dụng</p>
			</td>
			<td>Xem phim</td>
			<td>MP4, WMV, H.263, H.264(MPEG4-AVC), Xvid, DivX</td>
		</tr>
		<tr>
			<td>
			<p>Nghe nhạc</p>
			</td>
			<td>MP3, WAV, WMA, eAAC+</td>
		</tr>
		<tr>
			<td>
			<p>Ghi &acirc;m</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Giới hạn cuộc gọi</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>FM radio</p>
			</td>
			<td>FM radio với RDS</td>
		</tr>
		<tr>
			<td>
			<p>Chức năng kh&aacute;c</p>
			</td>
			<td>Mạng x&atilde; hội ảo<br />
			Google Search, Maps, Gmail, YouTube, Calendar, Google Talk<br />
			Micro chuy&ecirc;n dụng chống ồn</td>
		</tr>
	</tbody>
</table>
', N'<h2>Sony Xperia Z Ultra &ndash; Smartphone chống thấm nước, m&agrave;n h&igrave;nh full HD lớn nhất v&agrave; vi xử l&yacute; mạnh nhất thế giới</h2>

<p><br />
Sony Xperia Z Ultra l&agrave; một sản phẩm hội tụ gần như tất cả c&aacute;c c&ocirc;ng nghệ cao cấp của Sony, m&agrave;n h&igrave;nh full HD 6.4 inch v&ocirc; c&ugrave;ng sắc n&eacute;t, vi xử l&yacute; di động mạnh nhất hiện nay Snapdragon 800 2.2GHz&hellip;.</p>

<h3><br />
Thiết kế tuyệt vời</h3>

<p><strong>Sony Xperia Z Ultra</strong> chắc chắn sẽ l&agrave;m bạn ấn tượng ngay từ c&aacute;i nh&igrave;n đầu ti&ecirc;n. N&oacute; thật sự rất mỏng, rất đẹp v&agrave; cao cấp. C&aacute;c bạn c&oacute; thể ấn tượng với <strong>iPhone</strong> nhưng kỹ năng chế tạo của Z Ultra cũng kh&ocirc;ng hề thua k&eacute;m. N&oacute; hơn hẳn <a href="http://www.thegioididong.com/dtdd/sony-xperia-z" target="_blank">Xperia Z</a>, cầm ho&agrave;n to&agrave;n kh&ocirc;ng bị cấn tay do Z Ultra đ&atilde; sử dụng những cạnh bo tr&ograve;n, kh&ocirc;ng c&ograve;n sắc. Lưu &yacute; l&agrave; Xperia Z Ultra c&oacute; viền bằng nhựa chứ kh&ocirc;ng phải kim loại.</p>

<p><em><img alt="Sony Xperia Z Ultra" src="http://cdn.tgdd.vn/Products/Images/42/59952/sony-xperia-z-ultra_clip_image002.jpg" /></em><br />
<em>Sony Xperia Z Ultra</em></p>

<p><br />
Mặc d&ugrave; lớn nhưng bạn c&oacute; thể sử dụng bằng một b&agrave;n tay, tại sao vậy? Đ&oacute; l&agrave; nhờ Sony đ&atilde; tối ưu h&oacute;a phần mềm, c&aacute;c chương tr&igrave;nh c&oacute; thể chạy lệch sang một b&ecirc;n để dễ d&agrave;ng sử dụng tr&ecirc;n một tay chứ kh&ocirc;ng phải l&agrave; c&aacute;c ng&oacute;n tay c&oacute; thể chạm ở mọi nơi tr&ecirc;n m&agrave;n h&igrave;nh thiết bị.</p>

<h3><br />
Smartphone mạnh nhất thế giới</h3>

<p>Hiện tại, vi xử l&yacute; <strong>Snapdragon 800</strong> được coi l&agrave; vi xử l&yacute; d&agrave;nh cho thiết bị di động mạnh nhất thế giới, <strong>Xperia Z Ultra</strong> đ&atilde; t&iacute;ch hợp vi xử l&yacute; đ&oacute; nhưng với tốc độ xử l&yacute; l&ecirc;n đến 2.2GHz. Nhờ vậy, Xperia Z Ultra trở th&agrave;nh smartphone c&oacute; tốc độ xử l&yacute; nhanh nhất, mạnh nhất, t&iacute;ch hợp đồ họa cao nhất.</p>

<h3><br />
Chống thấm nước</h3>

<p><em><img alt="Sony Xperia ZU chống thấm nước hiệu quả theo tiêu chuẩn IP58" src="http://cdn.tgdd.vn/Products/Images/42/59952/sony-xperia-z-ultra_clip_image003.jpg" /></em><br />
<em>Sony Xperia ZU chống thấm nước hiệu quả theo ti&ecirc;u chuẩn IP58</em></p>

<p><br />
Mặc d&ugrave; l&agrave; điện thoại m&agrave;n h&igrave;nh khủng, lai m&aacute;y t&iacute;nh bảng nhưng <strong>Sony Xperia ZU</strong> vẫn c&oacute; khả năng chống nước IP58 tốt hơn cả tr&ecirc;n <strong>Xperia Z</strong> (IP57). Điều đ&oacute; c&oacute; nghĩa rằng m&aacute;y c&oacute; khả năng chống bụi v&agrave; chịu được 30 ph&uacute;t ở độ s&acirc;u 1m. Bởi vậy, nếu bạn đậy k&iacute;n c&aacute;c cổng kết nối lại th&igrave; bạn c&oacute; thể y&ecirc;n t&acirc;m l&agrave; vừa tắm vừa nghe nhạc hoặc nghe nhạc khi đi giữa trởi mưa to.</p>

<h3><br />
M&agrave;n h&igrave;nh full HD 6.4 inch cực kỳ sắc n&eacute;t</h3>

<p>Điểm nhấn của <strong>Xperia Z Ultra</strong> đ&oacute; l&agrave; một m&agrave;n h&igrave;nh cỡ khủng, 6.4 inch, gần bằng một m&aacute;y t&iacute;nh bảng 7 inch. Đặc biệt đ&oacute; l&agrave; m&agrave;n h&igrave;nh full HD sử dụng <strong>c&ocirc;ng nghệ Triluminos</strong> v&agrave; <strong>c&ocirc;ng nghệ X-Reality</strong> thay v&igrave; Bravia Mobile Engine 2 của thế hệ cũ n&ecirc;n chiếc m&aacute;y n&agrave;y cho chất lượng hiển thị rất cao. H&igrave;nh ảnh kh&ocirc;ng mờ mờ đục đục như <strong>Xperia Z</strong>, kể cả khi ở ngo&agrave;i m&agrave;n h&igrave;nh chủ m&agrave; vẫn trong vắt.</p>

<p><strong><em><img alt="Sony Xperia ZU với màn hình khủng full HD 6.4 inch" src="http://cdn.tgdd.vn/Products/Images/42/59952/sony-xperia-z-ultra_clip_image005.jpg" /></em></strong><br />
<em>Sony Xperia ZU với m&agrave;n h&igrave;nh khủng full HD 6.4 inch - Ảnh từ Sonyviet</em></p>

<h3><br />
Hỗ trợ cảm ứng cả b&uacute;t ch&igrave;</h3>

<p>L&agrave; một chiếc phablet, <strong>Sony Z Ultra</strong> c&oacute; khả năng hoạt động với b&uacute;t cảm ứng (stylus). Trong khi b&uacute;t stylus kh&ocirc;ng được b&aacute;n k&egrave;m m&aacute;y, m&agrave;n h&igrave;nh của Z Ultra c&oacute; thể được sử dụng để ghi ch&eacute;p bằng c&ocirc;ng cụ nhận dạng chữ viết của m&aacute;y.</p>

<p><em><img alt="Sony Xperia ZU hỗ trợ cảm ứng với cả đầu bút chì" src="http://cdn.tgdd.vn/Products/Images/42/59952/sony-xperia-z-ultra_clip_image007.jpg" /></em><br />
<em>Sony Xperia ZU hỗ trợ cảm ứng với cả đầu b&uacute;t ch&igrave;</em></p>

<p><br />
Điểm th&uacute; vị l&agrave; b&ecirc;n cạnh những chiếc b&uacute;t stylus th&ocirc;ng thường, bạn cũng c&oacute; thể nhập liệu tr&ecirc;n <strong>Xperia ZU</strong> bằng b&uacute;t ch&igrave; hoặc b&uacute;t bi. Rất tiếc m&aacute;y kh&ocirc;ng thể cảm nhận &aacute;p lực của b&uacute;t để nhận diện độ thanh đậm của n&eacute;t chữ. Trong ứng dụng vẽ h&igrave;nh, bạn sẽ phải tự chọn mức độ đậm của n&eacute;t vẽ cho b&uacute;t stylus.</p>

<h3><br />
C&ocirc;ng nghệ kết nối cao cấp</h3>

<p><em><img alt="Sony Xperia ZU hỗ trợ đầy đủ các kết nối cao cấp" src="http://cdn.tgdd.vn/Products/Images/42/59952/sony-xperia-z-ultra_clip_image009.jpg" /></em><br />
<em>Sony Xperia ZU hỗ trợ đầy đủ c&aacute;c kết nối cao cấp</em></p>

<p><br />
B&ecirc;n cạnh kết nối 4G LTE, <strong>Sony Xperia Z Ultra</strong> cũng c&oacute; Bluetooth, NFC v&agrave; Wi-fi. M&aacute;y c&oacute; 2GB RAM, bộ nhớ trong 16GB hỗ trợ mở rộng qua microSD. Pin c&oacute; độ lớn 3050mAh hứa hẹn Xperia Z Ultra c&oacute; thời gian pin ổn định, theo Sony m&aacute;y c&oacute; thời lượng 5.5 tiếng cho xem video li&ecirc;n tục v&agrave; 11 tiếng đ&agrave;m thoại.</p>

<p><strong>Hữu T&igrave;nh</strong></p>

<p>&nbsp;</p>

<table>
	<tbody>
		<tr>
			<td>
			<h3>Ưu điểm</h3>

			<ul>
				<li>M&agrave;n h&igrave;nh full HD 6.4 inch.</li>
				<li>Vi xử l&yacute; mạnh nhất thế giới Snapdragon 800.</li>
				<li>Cảm ứng ngay cả khi sử dụng b&uacute;t ch&igrave;.</li>
				<li>Giải tr&iacute;, c&ocirc;ng việc tuyệt vời, trải nghiệm tuyệt vời.</li>
				<li>Si&ecirc;u bền, si&ecirc;u mỏng, nhẹ v&agrave; chống nước.</li>
				<li>Chụp h&igrave;nh tuyệt vời trong mọi điều kiện &aacute;nh s&aacute;ng.</li>
			</ul>
			</td>
			<td>
			<h3>Nhược điểm</h3>

			<ul>
				<li>Kh&oacute; nh&eacute;t v&agrave;o t&uacute;i quần.</li>
				<li>M&aacute;y ảnh chỉ 8.0MP.</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>
', 5, 99, 3, 0, 0, CAST(N'2014-03-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (28, N'Sony Xperia M', N'/Content/Images/Sony/Sony Xperia M.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/Sony/Hinh360-Sony/Sony-Xperia-Z-hinh360-1.jpg', N'" /> </a>', CAST(4990000 AS Decimal(18, 0)), CAST(5200000 AS Decimal(18, 0)), N'Màn hình:	FWVGA, 4.0", 480 x 854 Pixels
CPU:	Qualcomm MSM8227, 2 nhân, 1 GHz
RAM	1 GB
Hệ điều hành:	Android 4.1.2 (Jelly Bean)
Camera chính:	5.0 MP, Quay phim HD 720p@30fps
Camera phụ:	VGA (0.3 Mpx)
Bộ nhớ trong:	4 GB
Thẻ nhớ ngoài đến:	32 GB
Dung lượng pin:	1700 mAh', N'<img class="lazy" src="http://cdn.tgdd.vn/Products/Images/42/59849/Kit/Sony-Xperia-M-mo-ta-chuc-nang.jpg">   <table style="width: 100%;" class="product-compare" border="0" cellpadding="0" cellspacing="0">
    <tbody>
        <tr class="r">
            <td rowspan="2" class="g" valign="top">
            <div class="gh">Thông tin chung</div>
            </td>
            <td id="prop_72" class="p f eph" onclick="ShowHelp(72, 2);">Hệ điều hành</td>
            <td id="c72_1" class="v f">Android 4.1.2 (Jelly Bean)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_75" class="ph eph" onclick="ShowHelp(75, 2);">Ngôn ngữ</div>
            </td>
            <td id="c75_1" class="v">Tiếng Việt, Tiếng Anh</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Màn hình</div>
            </td>
            <td class="p f">Loại màn hình</td>
            <td id="c6459_1" class="v f">TFT</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Màu màn hình</div>
            </td>
            <td id="c6239_1" class="v">16 triệu màu</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_77" class="ph eph" onclick="ShowHelp(77, 2);">Chuẩn màn hình</div>
            </td>
            <td id="c77_1" class="v">FWVGA</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_78" class="ph eph" onclick="ShowHelp(78, 2);">Độ phân giải</div>
            </td>
            <td id="c78_1" class="v">480 x 854 Pixels</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_79" class="ph eph" onclick="ShowHelp(79, 2);">Màn hình rộng</div>
            </td>
            <td id="c79_1" class="v">4.0"</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_80" class="ph eph" onclick="ShowHelp(80, 2);">Công nghệ cảm ứng</div>
            </td>
            <td id="c80_1" class="v">Cảm ứng điện dung đa điểm</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Chụp hình &amp; Quay phim</div>
            </td>
            <td id="prop_27" class="p f eph" onclick="ShowHelp(27, 2);">Camera sau</td>
            <td id="c27_1" class="v f">5.0 MP</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_29" class="ph eph" onclick="ShowHelp(29, 2);">Camera trước</div>
            </td>
            <td id="c29_1" class="v">VGA (0.3 Mpx)</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Đèn Flash</div>
            </td>
            <td id="c6460_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_28" class="ph eph" onclick="ShowHelp(28, 2);">Tính năng camera</div>
            </td>
            <td id="c28_1" class="v">Tự động lấy nét, chạm lấy nét<br>Chống rung</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_31" class="ph eph" onclick="ShowHelp(31, 2);">Quay phim</div>
            </td>
            <td id="c31_1" class="v">Quay phim HD 720p@30fps</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_30" class="ph eph" onclick="ShowHelp(30, 2);">Videocall</div>
            </td>
            <td id="c30_1" class="v">Hỗ trợ VideoCall qua Skype</td>
        </tr>
        <tr class="r">
            <td rowspan="5" class="g" valign="top">
            <div class="gh">CPU &amp; RAM</div>
            </td>
            <td id="prop_51" class="p f eph" onclick="ShowHelp(51, 2);">Tốc độ CPU</td>
            <td id="c51_1" class="v f">1 GHz</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Số nhân</div>
            </td>
            <td id="c6461_1" class="v">2 nhân</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6059" class="ph eph" onclick="ShowHelp(6059, 2);">Chipset</div>
            </td>
            <td id="c6059_1" class="v">Qualcomm MSM8227</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">RAM</div>
            </td>
            <td id="c50_1" class="v">1 GB</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6079" class="ph eph" onclick="ShowHelp(6079, 2);">Chip đồ họa (GPU)</div>
            </td>
            <td id="c6079_1" class="v">Adreno 305</td>
        </tr>
        <tr class="r">
            <td rowspan="4" class="g" valign="top">
            <div class="gh">Bộ nhớ &amp; Lưu trữ</div>
            </td>
            <td id="prop_54" class="p f eph" onclick="ShowHelp(54, 2);">Danh bạ</td>
            <td id="c54_1" class="v f">Không giới hạn</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_49" class="ph eph" onclick="ShowHelp(49, 2);">Bộ nhớ trong (ROM)</div>
            </td>
            <td id="c49_1" class="v">4 GB</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_52" class="ph eph" onclick="ShowHelp(52, 2);">Thẻ nhớ ngoài</div>
            </td>
            <td id="c52_1" class="v">MicroSD (T-Flash)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_53" class="ph eph" onclick="ShowHelp(53, 2);">Hỗ trợ thẻ tối đa</div>
            </td>
            <td id="c53_1" class="v">32 GB</td>
        </tr>
        <tr class="r">
            <td rowspan="3" class="g" valign="top">
            <div class="gh">Thiết kế &amp; Trọng lượng</div>
            </td>
            <td id="prop_73" class="p f eph" onclick="ShowHelp(73, 2);">Kiểu dáng</td>
            <td id="c73_1" class="v f">Thanh + Cảm ứng</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_88" class="ph eph" onclick="ShowHelp(88, 2);">Kích thước</div>
            </td>
            <td id="c88_1" class="v">124 x 62 x 9.3 mm</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_100" class="ph eph" onclick="ShowHelp(100, 2);">Trọng lượng (g)</div>
            </td>
            <td id="c100_1" class="v">115</td>
        </tr>
        <tr class="r">
            <td rowspan="3" class="g" valign="top">
            <div class="gh">Thông tin pin</div>
            </td>
            <td class="p f">Loại pin</td>
            <td id="c83_1" class="v f">Pin chuẩn Li-Ion</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_84" class="ph eph" onclick="ShowHelp(84, 2);">Dung lượng pin</div>
            </td>
            <td id="c84_1" class="v">1700 mAh</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Pin có thể tháo rời</div>
            </td>
            <td id="c6462_1" class="v">Có</td>
        </tr>
        <tr class="r">
            <td rowspan="13" class="g" valign="top">
            <div class="gh">Kết nối &amp; Cổng giao tiếp</div>
            </td>
            <td id="prop_65" class="p f eph" onclick="ShowHelp(65, 2);">3G</td>
            <td id="c65_1" class="v f">HSDPA, 21 Mbps; HSUPA, 5.76 Mbps</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">4G</div>
            </td>
            <td id="c6463_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Loại Sim</div>
            </td>
            <td id="c6339_1" class="v">Micro SIM</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_60" class="ph eph" onclick="ShowHelp(60, 2);">Khe gắn Sim</div>
            </td>
            <td id="c60_1" class="v">1 Sim</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_66" class="ph eph" onclick="ShowHelp(66, 2);">Wifi</div>
            </td>
            <td id="c66_1" class="v">Wi-Fi 802.11 a/b/g/n, DLNA, Wi-Fi Direct, dual-band, Wi-Fi hotspot</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_68" class="ph eph" onclick="ShowHelp(68, 2);">GPS</div>
            </td>
            <td id="c68_1" class="v">A-GPS</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_69" class="ph eph" onclick="ShowHelp(69, 2);">Bluetooth</div>
            </td>
            <td id="c69_1" class="v">V4.0 with A2DP</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_61" class="ph eph" onclick="ShowHelp(61, 2);">GPRS/EDGE</div>
            </td>
            <td id="c61_1" class="v">Up to 86 kbps / Up to 237 kbps</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_48" class="ph eph" onclick="ShowHelp(48, 2);">Jack tai nghe</div>
            </td>
            <td id="c48_1" class="v">3.5 mm</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">NFC</div>
            </td>
            <td id="c6464_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_71" class="ph eph" onclick="ShowHelp(71, 2);">Kết nối USB</div>
            </td>
            <td id="c71_1" class="v">Micro USB</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Kết nối khác</div>
            </td>
            <td id="c5199_1" class="v">NFC</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Cổng sạc</div>
            </td>
            <td id="c85_1" class="v">Micro USB</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Giải trí &amp; Ứng dụng</div>
            </td>
            <td id="prop_32" class="p f eph" onclick="ShowHelp(32, 2);">Xem phim</td>
            <td id="c32_1" class="v f">MP4, WMV, H.263, H.264(MPEG4-AVC)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_33" class="ph eph" onclick="ShowHelp(33, 2);">Nghe nhạc</div>
            </td>
            <td id="c33_1" class="v">MP3, WAV, WMA, eAAC+</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_36" class="ph eph" onclick="ShowHelp(36, 2);">Ghi âm</div>
            </td>
            <td id="c36_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6039" class="ph eph" onclick="ShowHelp(6039, 2);">Giới hạn cuộc gọi</div>
            </td>
            <td id="c6039_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_34" class="ph eph" onclick="ShowHelp(34, 2);">FM radio</div>
            </td>
            <td id="c34_1" class="v">FM radio với RDS</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Chức năng khác</div>
            </td>
            <td id="c43_1" class="v">Mạng xã hội ảo<br>Google Search, Maps, Gmail, YouTube, Calendar, Google Talk<br>Micro chuyên dụng chống ồn</td>
        </tr>
    </tbody>
</table>', N'<h2 align="center">Sony Xperia M – Thiết kế bắt mắt, vừa tay và đầy đủ tính năng</h2><p style="text-align: justify;" align=""><br>Sony Xperia M là một trong những điện thoại thông minh tầm trung có cấu hình tốt, giá phải chăng và đặc biệt thiết kế rất trẻ trung.</p>&nbsp;<h3 align=""><br>Thiết kế cuốn hút</h3><p style="text-align: justify;" align=""><strong>Sony Xperia M</strong> có thiết kế khá giống với siêu phẩm <a href="http://www.thegioididong.com/dtdd/sony-xperia-zl" target="_blank">Xperia Z</a>, nó là một chút “lai” giữa <strong>Xperia Z </strong>và những dòng Xperia cũ hơn như <a href="http://www.thegioididong.com/dtdd/sony-xperia-zl" target="_blank">Xperia ZL</a>.</p><p align="center"><em><img title="Thiết kế cuốn hút của Sony Xperia M" src="http://cdn.tgdd.vn/Products/Images/42/59849/sony-xperia-m_clip_image002.jpg" alt="Thiết kế cuốn hút của Sony Xperia M" height="500" border="0" width="488"></em><br><em>Thiết kế cuốn hút của Sony Xperia M</em></p><p style="text-align: justify;" align=""><br>Đặc biệt, cạnh trái có thiết kế rất giống với <strong>Xperia Z</strong>, một nút nguồn “to tướng” cách điệu, tiếp theo là nút điều chỉnh âm lượng, sau đó là nút chuyên biệt cho máy ảnh. Mặt sau <strong>Sony Xperia M</strong> không phẳng mà được thiết kế hơi cong, khiến ai cầm máy trên tay cũng cho cảm giác an toàn và chắc chắn. Với kích thước 124 x 62x 9.3 mm và nặng chỉ 115g, máy rất gọn và nhẹ nhàng, sử dụng trên một tay hết sức đơn giản.</p><p align="center"><em><img title="Các nút cách điệu trên Sony Xperia M " src="http://cdn.tgdd.vn/Products/Images/42/59849/sony-xperia-m_clip_image004.jpg" alt="Các nút cách điệu trên Sony Xperia M " height="500" border="0" width="372"></em><br><em>Các nút cách điệu trên Sony Xperia M</em></p>&nbsp;<h3 align=""><br>Cấu hình tốt</h3><p style="text-align: justify;" align=""><strong>Xperia M</strong> sử dụng bộ vi xử lý dual-core tốc độ 1GHz, bộ nhớ RAM 1GB, với cấu hình đó, máy sẽ chạy rất mượt mà không bị giật. Cảm giác vuốt chạm, lướt web thực sự nhanh chóng. Nếu bạn sử dụng cùng lúc nhiều phần mềm, máy vẫn có thể đáp ứng tốt.</p><p align="center"><em><img title="Sony Xperia M cho hiệu năng hoạt động tốt trên bộ vi xử lý 2 nhân" src="http://cdn.tgdd.vn/Products/Images/42/59849/sony-xperia-m_clip_image006.jpg" alt="Sony Xperia M cho hiệu năng hoạt động tốt trên bộ vi xử lý 2 nhân " height="390" border="0" width="634"></em><br><em>Sony Xperia M cho hiệu năng hoạt động tốt trên bộ vi xử lý 2 nhân</em></p><p style="text-align: justify;" align=""><strong><br>Sony Xperia M</strong> có bộ nhớ trong 4GB, khá thấp nhưng có hỗ trợ thẻ microSD lên đến 32GB, bởi vậy bạn có thể thoải mái lưu trữ trên thẻ nhớ.</p>&nbsp;<h3 align=""><br>Kết nối cao cấp</h3><p align="center"><em><img title="Sony Xperia M hỗ trợ cả NFC" src="http://cdn.tgdd.vn/Products/Images/42/59849/sony-xperia-m_clip_image007.jpg" alt="Sony Xperia M hỗ trợ cả NFC" height="386" border="0" width="660"></em><br><em>Sony Xperia M hỗ trợ cả NFC</em></p><p style="text-align: justify;" align=""><br>Ngoài kết nối Wifi, mạng băng thông rộng 3G, định vị vệ tinh GPS thì <strong>Xperia M</strong> còn hỗ trợ kết nối trường gần NFC, đây là một tính năng chủ yếu có trên những điện thoại cao cấp. Với tính năng này, bạn có thể chạm vào một điện thoại hỗ trợ NFC và cả hai có thể kết nối, chia sẻ hình ảnh, video…</p>&nbsp;<h3 align=""><br>Hỗ trợ 2 camera</h3><p style="text-align: justify;" align="">Máy ảnh sau có độ phân giải 5.0MP hỗ trợ đèn flash, tự động lấy nét vì vậy nó cũng cho ra các bức ảnh khá nét và sáng. Máy ảnh sau của <strong>Sony Xperia M</strong> cũng có thể quay video HD 720p ở tốc độ 30fps với khả năng chống rung, lọc tiếng tốt. Camera trước 0.3MP để gọi video, chụp ảnh chân dung.</p><p align="center"><img title="Sony Xperia M có đầy đủ 2 camera trước và sau" src="http://cdn.tgdd.vn/Products/Images/42/59849/sony-xperia-m_clip_image005.jpg" alt="Sony Xperia M có đầy đủ 2 camera trước và sau" height="500" width="528"><br><em>Sony Xperia M có đầy đủ 2 camera trước và sau</em></p>&nbsp;<h3 align=""><br>Hệ điều hành Android Jelly Bean</h3><p style="text-align: justify;" align=""><strong>Xperia M</strong> chạy hệ điều hành Android 4.1.2 Jelly Bean khá mới mẻ, nhiều tính năng hấp dẫn và cải thiện thời lượng pin tốt.</p><p align="center"><em><img title="Sony Xperia M sử dụng hđh Android Jelly Bean" src="http://cdn.tgdd.vn/Products/Images/42/59849/sony-xperia-m_clip_image008.jpg" alt="Sony Xperia M sử dụng hđh Android Jelly Bean" height="386" border="0" width="580"></em><br><em>Sony Xperia M sử dụng hđh Android Jelly Bean</em></p><p style="text-align: justify;" align=""><br>Bạn có thể cài đặt nhiều phần mềm, tiện ích, game mà bạn mong muốn thông qua Google Play. Các tiện ích đã được cài sẵn trên <strong>Sony Xperia M</strong> như mạng xã hội Facebook, hộp thư điện tử Gmail, Google Maps để xem bản đồ trực tuyến, YouTube xem video online…</p><p align="right"><strong>Hữu Tình</strong></p><table class="advantage"><tbody><tr><td><h3>Ưu điểm</h3><ul>
	<li>Thiết kế bắt mắt, cầm nắm dễ dàng.</li>
	<li>Đầy đủ các kết nối, đặc biệt là NFC.</li>
	<li>Hỗ trợ 2 camera trước và sau.</li>
	<li>Hiệu năng hoạt động ổn định, mạnh.</li>
	<li>Hệ điều hành Android Jelly Bean 4.1.</li>
</ul></td><td><h3>Nhược điểm</h3><ul>
	<li>Bộ nhớ trong thấp.</li>
</ul></td></tr></tbody></table>', 5, 99, 0, 10, 0, CAST(N'2014-03-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (29, N'Sony Xperia C', N'/Content/Images/Sony/Sony Xperia C.jpeg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/Sony/Hinh360-Sony/Sony-Xperia-Z-hinh360-1.jpg', N'" /> </a>', CAST(6990000 AS Decimal(18, 0)), CAST(7200000 AS Decimal(18, 0)), N'Màn hình:	qHD, 5.0", 540 x 960 pixels
CPU:	MTK 6589, 4 nhân, 1.2 GHz
RAM	1 GB
Hệ điều hành:	Android 4.2.2 (Jelly Bean)
Camera chính:	8.0 MP, Quay phim FullHD 1080p@30fps
Camera phụ:	VGA (0.3 Mpx)
Bộ nhớ trong:	4 GB
Thẻ nhớ ngoài đến:	32 GB
Dung lượng pin:	2390 mAh', N'<img class="lazy" src="http://cdn.tgdd.vn/Products/Images/42/59978/Kit/Sony-Xperia-C-C2305-mo-ta-chuc-nang.jpg"> <table style="width: 100%;" class="product-compare" border="0" cellpadding="0" cellspacing="0">
    <tbody>
        <tr class="r">
            <td rowspan="2" class="g" valign="top">
            <div class="gh">Thông tin chung</div>
            </td>
            <td id="prop_72" class="p f eph" onclick="ShowHelp(72, 2);">Hệ điều hành</td>
            <td id="c72_1" class="v f">Android 4.2.2 (Jelly Bean)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_75" class="ph eph" onclick="ShowHelp(75, 2);">Ngôn ngữ</div>
            </td>
            <td id="c75_1" class="v">Tiếng Việt, Tiếng Anh</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Màn hình</div>
            </td>
            <td class="p f">Loại màn hình</td>
            <td id="c6459_1" class="v f">TFT</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Màu màn hình</div>
            </td>
            <td id="c6239_1" class="v">16 triệu màu</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_77" class="ph eph" onclick="ShowHelp(77, 2);">Chuẩn màn hình</div>
            </td>
            <td id="c77_1" class="v">qHD</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_78" class="ph eph" onclick="ShowHelp(78, 2);">Độ phân giải</div>
            </td>
            <td id="c78_1" class="v">540 x 960 pixels</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_79" class="ph eph" onclick="ShowHelp(79, 2);">Màn hình rộng</div>
            </td>
            <td id="c79_1" class="v">5.0"</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_80" class="ph eph" onclick="ShowHelp(80, 2);">Công nghệ cảm ứng</div>
            </td>
            <td id="c80_1" class="v">Cảm ứng điện dung đa điểm</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Chụp hình &amp; Quay phim</div>
            </td>
            <td id="prop_27" class="p f eph" onclick="ShowHelp(27, 2);">Camera sau</td>
            <td id="c27_1" class="v f">8.0 MP</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_29" class="ph eph" onclick="ShowHelp(29, 2);">Camera trước</div>
            </td>
            <td id="c29_1" class="v">VGA (0.3 Mpx)</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Đèn Flash</div>
            </td>
            <td id="c6460_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_28" class="ph eph" onclick="ShowHelp(28, 2);">Tính năng camera</div>
            </td>
            <td id="c28_1" class="v">Tự động lấy nét, chạm lấy nét<br>Nhận diện khuôn mặt, nụ cười</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_31" class="ph eph" onclick="ShowHelp(31, 2);">Quay phim</div>
            </td>
            <td id="c31_1" class="v">Quay phim FullHD 1080p@30fps</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_30" class="ph eph" onclick="ShowHelp(30, 2);">Videocall</div>
            </td>
            <td id="c30_1" class="v">Không</td>
        </tr>
        <tr class="r">
            <td rowspan="5" class="g" valign="top">
            <div class="gh">CPU &amp; RAM</div>
            </td>
            <td id="prop_51" class="p f eph" onclick="ShowHelp(51, 2);">Tốc độ CPU</td>
            <td id="c51_1" class="v f">1.2 GHz</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Số nhân</div>
            </td>
            <td id="c6461_1" class="v">4 nhân</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6059" class="ph eph" onclick="ShowHelp(6059, 2);">Chipset</div>
            </td>
            <td id="c6059_1" class="v">MTK 6589</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">RAM</div>
            </td>
            <td id="c50_1" class="v">1 GB</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6079" class="ph eph" onclick="ShowHelp(6079, 2);">Chip đồ họa (GPU)</div>
            </td>
            <td id="c6079_1" class="v">PowerVR SGX544</td>
        </tr>
        <tr class="r">
            <td rowspan="4" class="g" valign="top">
            <div class="gh">Bộ nhớ &amp; Lưu trữ</div>
            </td>
            <td id="prop_54" class="p f eph" onclick="ShowHelp(54, 2);">Danh bạ</td>
            <td id="c54_1" class="v f">Không giới hạn</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_49" class="ph eph" onclick="ShowHelp(49, 2);">Bộ nhớ trong (ROM)</div>
            </td>
            <td id="c49_1" class="v">4 GB</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_52" class="ph eph" onclick="ShowHelp(52, 2);">Thẻ nhớ ngoài</div>
            </td>
            <td id="c52_1" class="v">MicroSD (T-Flash)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_53" class="ph eph" onclick="ShowHelp(53, 2);">Hỗ trợ thẻ tối đa</div>
            </td>
            <td id="c53_1" class="v">32 GB</td>
        </tr>
        <tr class="r">
            <td rowspan="3" class="g" valign="top">
            <div class="gh">Thiết kế &amp; Trọng lượng</div>
            </td>
            <td id="prop_73" class="p f eph" onclick="ShowHelp(73, 2);">Kiểu dáng</td>
            <td id="c73_1" class="v f">Thanh + Cảm ứng</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_88" class="ph eph" onclick="ShowHelp(88, 2);">Kích thước</div>
            </td>
            <td id="c88_1" class="v">141.5 x 74.2 x 8.9</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_100" class="ph eph" onclick="ShowHelp(100, 2);">Trọng lượng (g)</div>
            </td>
            <td id="c100_1" class="v">153</td>
        </tr>
        <tr class="r">
            <td rowspan="3" class="g" valign="top">
            <div class="gh">Thông tin pin</div>
            </td>
            <td class="p f">Loại pin</td>
            <td id="c83_1" class="v f">Pin chuẩn Li-Ion</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_84" class="ph eph" onclick="ShowHelp(84, 2);">Dung lượng pin</div>
            </td>
            <td id="c84_1" class="v">2390 mAh</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Pin có thể tháo rời</div>
            </td>
            <td id="c6462_1" class="v">Không</td>
        </tr>
        <tr class="r">
            <td rowspan="13" class="g" valign="top">
            <div class="gh">Kết nối &amp; Cổng giao tiếp</div>
            </td>
            <td id="prop_65" class="p f eph" onclick="ShowHelp(65, 2);">3G</td>
            <td id="c65_1" class="v f">HSDPA, 42 Mbps; HSUPA</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">4G</div>
            </td>
            <td id="c6463_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Loại Sim</div>
            </td>
            <td id="c6339_1" class="v">Micro SIM</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_60" class="ph eph" onclick="ShowHelp(60, 2);">Khe gắn Sim</div>
            </td>
            <td id="c60_1" class="v">2 SIM 2 sóng</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_66" class="ph eph" onclick="ShowHelp(66, 2);">Wifi</div>
            </td>
            <td id="c66_1" class="v">Wi-Fi 802.11 b/g/n, Wi-Fi Direct, Wi-Fi hotspot</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_68" class="ph eph" onclick="ShowHelp(68, 2);">GPS</div>
            </td>
            <td id="c68_1" class="v">A-GPS</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_69" class="ph eph" onclick="ShowHelp(69, 2);">Bluetooth</div>
            </td>
            <td id="c69_1" class="v">V4.0 with A2DP</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_61" class="ph eph" onclick="ShowHelp(61, 2);">GPRS/EDGE</div>
            </td>
            <td id="c61_1" class="v">Up to 85.6 kbps / Up to 237 kbps</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_48" class="ph eph" onclick="ShowHelp(48, 2);">Jack tai nghe</div>
            </td>
            <td id="c48_1" class="v">3.5 mm</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">NFC</div>
            </td>
            <td id="c6464_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_71" class="ph eph" onclick="ShowHelp(71, 2);">Kết nối USB</div>
            </td>
            <td id="c71_1" class="v">Micro USB</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Kết nối khác</div>
            </td>
            <td id="c5199_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Cổng sạc</div>
            </td>
            <td id="c85_1" class="v">Micro USB</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Giải trí &amp; Ứng dụng</div>
            </td>
            <td id="prop_32" class="p f eph" onclick="ShowHelp(32, 2);">Xem phim</td>
            <td id="c32_1" class="v f">MP4, H.263, H.264(MPEG4-AVC)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_33" class="ph eph" onclick="ShowHelp(33, 2);">Nghe nhạc</div>
            </td>
            <td id="c33_1" class="v">MP3, WAV, eAAC+</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_36" class="ph eph" onclick="ShowHelp(36, 2);">Ghi âm</div>
            </td>
            <td id="c36_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6039" class="ph eph" onclick="ShowHelp(6039, 2);">Giới hạn cuộc gọi</div>
            </td>
            <td id="c6039_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_34" class="ph eph" onclick="ShowHelp(34, 2);">FM radio</div>
            </td>
            <td id="c34_1" class="v">FM radio với RDS</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Chức năng khác</div>
            </td>
            <td id="c43_1" class="v">Mạng xã hội ảo<br>Google Search, Maps, Gmail, YouTube, Calendar, Google Talk</td>
        </tr>
    </tbody>
</table>', N'<h2 align="center">Sony Xperia C – Smartphone giá rẻ, màn hình lớn, thiết kế đẹp và chạy chip lõi tứ</h2><p align=""><br>Sony Xperia C là một smartphone có giá phải chăng, chạy chip lõi tứ, màn hình rộng 5 inch đáp ứng đầy đủ nhu cầu của người dùng.</p>&nbsp;<h3 align=""><br>Thiết kế đẹp</h3><p align=""><strong>Sony Xperia C</strong> kế thừa được nhiều nét thiết kế bóng bẩy trên các dòng smartphone <a title="Sony Xperia" href="http://www.thegioididong.com/sony-xperia" target="_blank">Xperia 2013</a> của Sony, như bên dưới màn hình có đèn LED thông báo nhiều màu sắc giống <a href="http://www.thegioididong.com/dtdd/sony-xperia-l" target="_blank">Xperia L</a>, lưng máy giống <a href="http://www.thegioididong.com/dtdd/sony-xperia-sp" target="_blank">Xperia SP </a>với đường cong quyến rũ.</p><p align=""><br>Trong khi mặt trước cùng màu sắc gồm tím, trắng và đen tương tự như <a href="http://www.thegioididong.com/dtdd/sony-xperia-z" target="_blank">Xperia Z</a>. Nhờ vậy, máy khá dễ dàng cầm nắm và sử dụng mặc dù có màn hình rộng lên đến 5 inch.</p><p align="center"><strong><em><img title="Thiết kế đẹp cùng 3 màu chủ đạo của Sony Xperia C" src="http://cdn.tgdd.vn/Products/Images/42/59978/sony-xperia-c_clip_image001.jpg" alt="Thiết kế đẹp cùng 3 màu chủ đạo của Sony Xperia C"></em></strong><br><em>Thiết kế đẹp cùng 3 màu chủ đạo của Sony Xperia C</em></p>&nbsp;<h3 align=""><br>Cấu hình ổn với vi xử lý lõi tứ</h3><p align=""><strong>Xperia C</strong> có màn hình rộng nhưng giá bán hứa hẹn sẽ nằm ở phân khúc tầm trung do sử dụng chipset tới từ nhà sản xuất Đài Loan, MediaTek, thường thấy trên các smartphone có tầm trung và bình dân trên thị trường. Chipset sử dụng trên model này có tên mã MT6589 với tốc độ xung nhịp 1.2 GHz, đi kèm RAM 1 GB.&nbsp;Với cấu hình đó, máy có thể chạy tốt hầu hết các ứng dụng thường xuyên như lướt web, mạng xã hội, đọc sách báo, chơi game bình thường.</p><p align="center"><br><img title="Sony Xperia C sử dụng bộ vi xử lý của MediaTek" src="http://cdn.tgdd.vn/Products/Images/42/59978/sony-xperia-c_clip_image005.jpg" alt="Sony Xperia C sử dụng bộ vi xử lý của MediaTek"><br><em>Sony Xperia C sử dụng bộ vi xử lý của MediaTek</em></p>&nbsp;<h3 align=""><br>Màn hình rộng 5 inch</h3><p align="">Để đáp ứng xu thế mới, smartphone màn hình rộng. Máy cũng có một màn hình rộng 5 inch, độ phân giải qHD 960 x 540 pixels và mật độ điểm ảnh 220ppi. Với màn hình đó, <strong><a title="điện thoại smartphone" href="http://www.thegioididong.com/dtdd" target="_blank">smartphone</a> Xperia C</strong> có thể chơi game, giải trí, đọc sách báo, xem video một cách thoải mái. Màn hình cũng có độ phân giải vừa đủ, sắc nét và sáng sủa.</p><p align="center"><strong><img title="Sony Xperia C có màn hình 5 inch" src="http://cdn.tgdd.vn/Products/Images/42/59978/sony-xperia-c_clip_image002.jpg" alt="Sony Xperia C có màn hình 5 inch"></strong><br><em>Sony Xperia C có màn hình 5 inch</em></p>&nbsp;<h3 align=""><br>Máy ảnh 8 “chấm” có thể chụp bằng giọng nói</h3><p align="">Hãng điện thoại Nhật cũng trang bị cho <strong>Sony Xperia C</strong> những tính năng tốt như camera 8 megapixel sử dụng cảm biến Exmor R, cho phép chụp ảnh bằng giọng nói, hỗ trợ đèn flash, lấy nét tự động…Với cảm biến đó, máy có thể chụp được những bức ảnh sáng nét. Bạn sẽ không bỏ lỡ bất kỳ khoảnh khắc nào trong cuộc sống, đặc biệt là khi đi du lịch…</p><p align="center"><img title="Sony Xperia C trang bị máy ảnh 8.0MP với đèn flash" src="http://cdn.tgdd.vn/Products/Images/42/59978/sony-xperia-c_clip_image003.jpg" alt="Sony Xperia C trang bị máy ảnh 8.0MP với đèn flash"><br><em>Sony Xperia C trang bị máy ảnh 8.0MP với đèn flash</em></p>&nbsp;<h3 align=""><br>Hỗ trợ 2 sim</h3><p align=""><strong>Xperia C </strong>được <a title="điện thoại Sony" href="http://www.thegioididong.com/dtdd-sony" target="_blank">Sony</a> hỗ trợ 2 sim 2 sóng online, các sim chuyển đổi dễ dàng, nhờ vậy, bạn có thể linh động giữa các sim, rất thuận tiện.</p><p align="center"><em><img title="Sony Xperia C hỗ trợ 2 sim" src="http://cdn.tgdd.vn/Products/Images/42/59978/sony-xperia-c_clip_image004.jpg" alt="Sony Xperia C hỗ trợ 2 sim"></em><br><em>Sony Xperia C hỗ trợ 2 sim</em></p>&nbsp;<p align="right"><strong>Hữu Tình</strong></p><table class="advantage"><tbody><tr><td><h3>Ưu điểm</h3><ul>
	<li>Thiết kế sang trọng, đẹp mắt.</li>
	<li>Màn hình lớn 5 inch cho trải nghiệm tối ưu.</li>
	<li>Cấu hình tốt với vi xử lý lõi tứ 1.2GHz.</li>
	<li>Chụp ảnh HDR với camera 8.0MP sử dụng cảm biến Exmor R.</li>
</ul></td><td><h3>Nhược điểm</h3><ul>
	<li>Độ phân giải màn hình chỉ 960 x 540px.</li>
</ul></td></tr></tbody></table>', 5, 99, 2, 0, 1, CAST(N'2014-03-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (30, N'Sony Xperia Z1', N'/Content/Images/Sony/Sony Xperia Z1.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/Sony/Hinh360-Sony/Sony-Xperia-Z-hinh360-1.jpg', N'" /> </a>', CAST(5490000 AS Decimal(18, 0)), CAST(6300000 AS Decimal(18, 0)), N'<p>M&agrave;n h&igrave;nh: Full HD, 5.0&quot;, 1080 x 1920 pixels CPU: Qualcomm MSM8974, 4 nh&acirc;n, 2.2 GHz RAM 2 GB Hệ điều h&agrave;nh: Android 4.2.2 (Jelly Bean) Camera ch&iacute;nh: 20.7 MP, Quay phim FullHD 1080p@30fps Camera phụ: 2.0 MP Bộ nhớ trong: 16 GB Thẻ nhớ ngo&agrave;i đến: 64 GB Dung lượng pin: 3000 mAh</p>
', N'<p><img src="http://cdn.tgdd.vn/Products/Images/42/60103/Kit/Sony-Xperia-Z1-C6902-mo-ta-chuc-nang-1.jpg" /></p>

<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td rowspan="2">
			<p>Th&ocirc;ng tin chung</p>
			</td>
			<td>Hệ điều h&agrave;nh</td>
			<td>Android 4.2.2 (Jelly Bean)</td>
		</tr>
		<tr>
			<td>
			<p>Ng&ocirc;n ngữ</p>
			</td>
			<td>Tiếng Việt, Tiếng Anh</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>Loại m&agrave;n h&igrave;nh</td>
			<td>TFT</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;u m&agrave;n h&igrave;nh</p>
			</td>
			<td>16 triệu m&agrave;u</td>
		</tr>
		<tr>
			<td>
			<p>Chuẩn m&agrave;n h&igrave;nh</p>
			</td>
			<td>Full HD</td>
		</tr>
		<tr>
			<td>
			<p>Độ ph&acirc;n giải</p>
			</td>
			<td>1080 x 1920 pixels</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh rộng</p>
			</td>
			<td>5.0&quot;</td>
		</tr>
		<tr>
			<td>
			<p>C&ocirc;ng nghệ cảm ứng</p>
			</td>
			<td>Cảm ứng điện dung đa điểm</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Chụp h&igrave;nh &amp; Quay phim</p>
			</td>
			<td>Camera sau</td>
			<td>20.7 MP</td>
		</tr>
		<tr>
			<td>
			<p>Camera trước</p>
			</td>
			<td>2.0 MP</td>
		</tr>
		<tr>
			<td>
			<p>Đ&egrave;n Flash</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>T&iacute;nh năng camera</p>
			</td>
			<td>Tự động lấy n&eacute;t, chạm lấy n&eacute;t<br />
			Nhận diện khu&ocirc;n mặt, nụ cười<br />
			Chống rung</td>
		</tr>
		<tr>
			<td>
			<p>Quay phim</p>
			</td>
			<td>Quay phim FullHD 1080p@30fps</td>
		</tr>
		<tr>
			<td>
			<p>Videocall</p>
			</td>
			<td>Hỗ trợ VideoCall qua Skype</td>
		</tr>
		<tr>
			<td rowspan="5">
			<p>CPU &amp; RAM</p>
			</td>
			<td>Tốc độ CPU</td>
			<td>2.2 GHz</td>
		</tr>
		<tr>
			<td>
			<p>Số nh&acirc;n</p>
			</td>
			<td>4 nh&acirc;n</td>
		</tr>
		<tr>
			<td>
			<p>Chipset</p>
			</td>
			<td>Qualcomm MSM8974</td>
		</tr>
		<tr>
			<td>
			<p>RAM</p>
			</td>
			<td>2 GB</td>
		</tr>
		<tr>
			<td>
			<p>Chip đồ họa (GPU)</p>
			</td>
			<td>Adreno 330</td>
		</tr>
		<tr>
			<td rowspan="4">
			<p>Bộ nhớ &amp; Lưu trữ</p>
			</td>
			<td>Danh bạ</td>
			<td>Kh&ocirc;ng giới hạn</td>
		</tr>
		<tr>
			<td>
			<p>Bộ nhớ trong (ROM)</p>
			</td>
			<td>16 GB</td>
		</tr>
		<tr>
			<td>
			<p>Thẻ nhớ ngo&agrave;i</p>
			</td>
			<td>MicroSD (T-Flash)</td>
		</tr>
		<tr>
			<td>
			<p>Hỗ trợ thẻ tối đa</p>
			</td>
			<td>64 GB</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Thiết kế &amp; Trọng lượng</p>
			</td>
			<td>Kiểu d&aacute;ng</td>
			<td>Thanh + Cảm ứng</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước</p>
			</td>
			<td>144 x 74 x 8.5 mm</td>
		</tr>
		<tr>
			<td>
			<p>Trọng lượng (g)</p>
			</td>
			<td>170</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Th&ocirc;ng tin pin</p>
			</td>
			<td>Loại pin</td>
			<td>Pin chuẩn Li-Ion</td>
		</tr>
		<tr>
			<td>
			<p>Dung lượng pin</p>
			</td>
			<td>3000 mAh</td>
		</tr>
		<tr>
			<td>
			<p>Pin c&oacute; thể th&aacute;o rời</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="13">
			<p>Kết nối &amp; Cổng giao tiếp</p>
			</td>
			<td>3G</td>
			<td>HSDPA, 42 Mbps; HSUPA, 5.76 Mbps</td>
		</tr>
		<tr>
			<td>
			<p>4G</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Loại Sim</p>
			</td>
			<td>Micro SIM</td>
		</tr>
		<tr>
			<td>
			<p>Khe gắn Sim</p>
			</td>
			<td>1 Sim</td>
		</tr>
		<tr>
			<td>
			<p>Wifi</p>
			</td>
			<td>Wi-Fi 802.11 a/b/g/n/ac, dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot</td>
		</tr>
		<tr>
			<td>
			<p>GPS</p>
			</td>
			<td>A-GPS v&agrave; GLONASS</td>
		</tr>
		<tr>
			<td>
			<p>Bluetooth</p>
			</td>
			<td>V4.0 with A2DP</td>
		</tr>
		<tr>
			<td>
			<p>GPRS/EDGE</p>
			</td>
			<td>Up to 107 kbps / Up to 296 kbps</td>
		</tr>
		<tr>
			<td>
			<p>Jack tai nghe</p>
			</td>
			<td>3.5 mm</td>
		</tr>
		<tr>
			<td>
			<p>NFC</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối USB</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối kh&aacute;c</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Cổng sạc</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Giải tr&iacute; &amp; Ứng dụng</p>
			</td>
			<td>Xem phim</td>
			<td>MP4, WMV, H.263, H.264(MPEG4-AVC)</td>
		</tr>
		<tr>
			<td>
			<p>Nghe nhạc</p>
			</td>
			<td>MP3, WAV, WMA, eAAC+, FLAC</td>
		</tr>
		<tr>
			<td>
			<p>Ghi &acirc;m</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Giới hạn cuộc gọi</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>FM radio</p>
			</td>
			<td>FM radio với RDS</td>
		</tr>
		<tr>
			<td>
			<p>Chức năng kh&aacute;c</p>
			</td>
			<td>Mạng x&atilde; hội ảo<br />
			Google Search, Maps, Gmail, YouTube, Calendar, Google Talk<br />
			Micro chuy&ecirc;n dụng chống ồn</td>
		</tr>
	</tbody>
</table>
', N'<h2>Xperia Z1 &ndash; Smartphone cao cấp với camera cực khủng 20.7MP</h2>

<p><strong>Sony Xperia Z1</strong> ch&iacute;nh l&agrave; si&ecirc;u phẩm smartphone Android đến từ Sony Mobile tiếp nối si&ecirc;u phẩm <strong>Xperia Z</strong>, n&oacute; được c&ocirc;ng bố trước sự trầm trồ, khen ngợi của người xem trong triển l&atilde;m c&ocirc;ng nghệ IFA 2013 diễn ra tại Đức.</p>

<p><br />
Sản phẩm được trang bị kh&aacute; nhiều t&iacute;nh năng ti&ecirc;n tiến m&agrave; đ&agrave;n anh Z kh&ocirc;ng thể c&oacute; được, nổi bật nhất phải n&oacute;i đến đ&oacute; l&agrave; chiếc camera trang bị ống k&iacute;nh Sony G, độ ph&acirc;n giải đến 20.7MP. Ngo&agrave;i ra <strong>Z1</strong> c&ograve;n g&acirc;y ch&uacute; &yacute; hơn nữa với m&agrave;n h&igrave;nh 5inch full HD, bộ xử l&yacute; Qualcomm Snapdragon 800 v&agrave; thiết kế qu&aacute; đẹp mắt, chắc chắn của n&oacute;.</p>

<p><br />
<img alt="Sony Xperia Z1 được coi là bản nâng cấp đáng giá của Z" src="http://cdn.tgdd.vn/Products/Images/42/60103/xperia-z1_clip_image002.jpg" />&nbsp;<br />
<em>Sony Xperia Z1 được coi l&agrave; bản n&acirc;ng cấp đ&aacute;ng gi&aacute; của Z</em></p>

<p>&nbsp;</p>

<h3><br />
Thiết kế nguy&ecirc;n khối, sang trọng, cứng c&aacute;p</h3>

<p><strong>Xperia Z1 </strong>được cho l&agrave; bản n&acirc;ng cấp ho&agrave;n thiện hơn so với đ&agrave;n anh Z của n&oacute;, những nhược điểm từ thiết kế của Xperia Z như loa, ph&iacute;m cứng chụp ảnh&hellip; đều được Sony ho&agrave;n thiện tr&ecirc;n Xperia Z1, do đ&oacute; ngo&agrave;i những điểm ri&ecirc;ng biệt n&oacute; vẫn mang trong m&igrave;nh những điểm thiết kế như mọi người đ&atilde; thấy. Điểm đ&aacute;ng gi&aacute; về mặt thiết kế đ&oacute; l&agrave; chiếc khung nguy&ecirc;n khối của n&oacute;, b&ecirc;n ngo&agrave;i được bọc với khung kim loại, gi&uacute;p cho n&oacute; chắc chắn v&agrave; cứng c&aacute;p hơn cũng như cầm nắm dễ d&agrave;ng hơn. Sản phẩm c&oacute; k&iacute;ch thước kh&aacute; mỏng chỉ với 8.5mm tuy nhi&ecirc;n do thiết kế bằng kim loại n&ecirc;n n&oacute; đưa khối lượng m&aacute;y l&ecirc;n 170g.</p>

<p><br />
<img alt="Sony Xperia Z1 có thiết kế nguyên khối nên thân máy có độ bền cao" src="http://cdn.tgdd.vn/Products/Images/42/60103/xperia-z1_clip_image004.jpg" /><br />
<em>Sony Xperia Z1 c&oacute; thiết kế nguy&ecirc;n khối n&ecirc;n th&acirc;n m&aacute;y c&oacute; độ bền cao</em></p>

<p><br />
Giống với người anh <strong>Xperia Z</strong>, <strong>Z1</strong> cũng c&oacute; khả năng &ldquo;ngụp lặn&rdquo; rất chuy&ecirc;n nghiệp (đạt ti&ecirc;u chuẩn quốc tế IP55 v&agrave; IP58), nhờ thiết kế rất k&iacute;n đ&aacute;o n&ecirc;n sản phẩm c&oacute; thể &ldquo;tắm&rdquo; s&acirc;u khoảng 1.5m trong v&ograve;ng 30 ph&uacute;t, nếu bạn th&iacute;ch đi chơi s&ocirc;ng nước, hay chơi biển th&igrave; việc mang theo chiếc smartphone n&agrave;y ho&agrave;n to&agrave;n l&agrave; kh&ocirc;ng đ&aacute;ng ngại. Hơn nữa <strong>Sony&nbsp;Xperia Z1</strong> đ&atilde; loại bỏ việc thiết kế nắp đậy cho jack 3.5mm giống như Z, thay v&agrave;o đ&oacute; bản th&acirc;n jack đ&atilde; c&oacute; khả năng chống nước rồi.</p>

<p><br />
<img alt="Nếu Z1 bẩn bạn có thể nhúng xuống nước và “tắm” cho nó một cách dễ dàng" src="http://cdn.tgdd.vn/Files/2013/09/13/521429/ImageAttach/khong-so-nuoc-201391312520.jpg" /><br />
<em>Nếu Z1 bẩn bạn c&oacute; thể nh&uacute;ng xuống nước v&agrave; &ldquo;tắm&rdquo; cho n&oacute; một c&aacute;ch dễ d&agrave;ng</em></p>

<p>&nbsp;</p>

<h3><br />
M&agrave;n h&igrave;nh 5 inch, sử dụng c&ocirc;ng nghệ cao cấp cho h&igrave;nh ảnh si&ecirc;u n&eacute;t</h3>

<p>Chễm chệ ở mặt trước của <strong>Xperia Z1 </strong>đ&oacute; l&agrave; chiếc m&agrave;n h&igrave;nh 5 inch, ph&iacute;a trước được phủ tấm k&iacute;nh rộng khi tắt m&agrave;n h&igrave;nh mặt trước thiết bị c&oacute; m&agrave;u đen tuyền bao tr&ugrave;m, rất đẹp. Chiếc m&agrave;n h&igrave;nh n&agrave;y nổi bật với độ ph&acirc;n giải full HD, sử dụng c&ocirc;ng nghệ X-Reality Mobile v&agrave; Triluminos giống như tr&ecirc;n c&aacute;c d&ograve;ng TV cao cấp của h&atilde;ng, điều n&agrave;y sẽ đảm bảo cho chất lượng h&igrave;nh ảnh sắc n&eacute;t, trung thực, m&agrave;u sắc ấn tượng. Nếu so với Z, Xperia Z1 đảm bảo sẽ kh&ocirc;ng l&agrave;m bạn thất vọng về chất lượng hiển thị của m&agrave;n h&igrave;nh.</p>

<p><br />
<img alt="Màn hình Z1 có độ phân giải cao, công nghệ tiên tiến cho chất lượng vượt trội" src="http://cdn.tgdd.vn/Products/Images/42/60103/xperia-z1_clip_image008.jpg" /><br />
<em>M&agrave;n h&igrave;nh Z1 c&oacute; độ ph&acirc;n giải cao, c&ocirc;ng nghệ ti&ecirc;n tiến cho chất lượng vượt trội</em></p>

<p>&nbsp;</p>

<h3><br />
Bộ xử l&yacute; &ldquo;khủng&rdquo; với chip Snapdragon 800</h3>

<p>B&ecirc;n trong tấm gương lớn v&agrave; bộ khung kim loại l&agrave; bộ xử l&yacute; l&otilde;i tứ với chip mới nhất Snapdragon 800 của Qualcomm n&oacute; cho tốc độ đ&aacute;ng ngạc nhi&ecirc;n 2.2GHz, so với <strong>Galaxy S4</strong> th&igrave; c&oacute; vẻ điện thoại của Samsung hơi l&eacute;p vế với tốc độ 1.9GHz. Sony sử dụng bộ nhớ RAM 2GB, bộ nhớ trong kh&aacute; rộng với 16GB v&agrave; c&oacute; thể n&acirc;ng cấp bộ nhớ ngo&agrave;i l&ecirc;n đến 64GB.</p>

<p><br />
<img alt="Galaxy S4 không phải là đối thủ về tốc độ xử lý của Z1" src="http://cdn.tgdd.vn/Products/Images/42/60103/xperia-z1_clip_image010.jpg" /><br />
<em>Galaxy S4 kh&ocirc;ng phải l&agrave; đối thủ về tốc độ xử l&yacute; của Z1</em></p>

<p><br />
Tuy kh&ocirc;ng phải hệ điều h&agrave;nh mới nhất phi&ecirc;n bản 4.3 nhưng Android 4.2.2 Jelly Bean vẫn chưa hề ngu&ocirc;i &ldquo;độ n&oacute;ng&rdquo; v&agrave; vẫn kh&aacute; hấp dẫn người d&ugrave;ng. Giao diện b&ecirc;n trong đ&atilde; được Sony chỉnh sửa kh&aacute; nhiều v&agrave; đ&ocirc;i n&eacute;t giống với Xperia Z, n&oacute; cho ph&eacute;p người d&ugrave;ng t&ugrave;y biến thuận tiện, dễ d&agrave;ng.</p>

<p><br />
<img alt="Bên trong là Android 4.2.2, Z1 hỗ trợ người dùng tùy biến dễ dàng" src="http://cdn.tgdd.vn/Products/Images/42/60103/xperia-z1_clip_image012.jpg" /><br />
<em>B&ecirc;n trong l&agrave; Android 4.2.2, Z1 hỗ trợ người d&ugrave;ng t&ugrave;y biến dễ d&agrave;ng</em></p>

<p>&nbsp;</p>

<h3><br />
Camera &ldquo;v&ocirc; đối&rdquo; với 20.7MP</h3>

<p>Camera ch&iacute;nh l&agrave; điều kh&ocirc;ng thể bỏ qua được tr&ecirc;n thiết bị n&agrave;y, cũng ch&iacute;nh nhờ chi tiết n&agrave;y m&agrave; n&oacute; trở n&ecirc;n nổi tiếng một c&aacute;ch nhanh ch&oacute;ng. Sony đ&atilde; kh&aacute; &ldquo;chịu chơi&rdquo; khi trang bị cho <strong>Xperia Z1</strong> bộ cảm biến Exmor RS 1/2.3 l&ecirc;n đến 20.7MP v&agrave; n&oacute; đ&atilde; trở th&agrave;nh thiết bị Android c&oacute; độ ph&acirc;n giải camera lớn nhất. Ngo&agrave;i ra chiếc camera n&agrave;y c&ograve;n c&oacute; ống k&iacute;nh G của Sony v&agrave; bộ xử l&yacute; ảnh Bionz, đ&acirc;y l&agrave; những chi tiết ta thường thấy tr&ecirc;n c&aacute;c sản phẩm m&aacute;y ảnh của Sony.</p>

<p><br />
<img alt="Mặt sau Z1 là chiếc camera không thể nổi bật hơn" src="http://cdn.tgdd.vn/Products/Images/42/60103/xperia-z1_clip_image014.jpg" /><br />
<em>Mặt sau Z1 l&agrave; chiếc camera kh&ocirc;ng thể nổi bật hơn</em></p>

<p><br />
Chế độ Time Shift Burst cho bạn đến 60 bức ảnh trong 1 lần ấn n&uacute;t chụp v&agrave; đưa ra cho bạn sự lựa chọn tốt nhất với bức ảnh đẹp nhất. AR Effect l&agrave; nơi t&iacute;ch hợp nhiều hiệu ứng ấn tượng, đẹp mắt, hơn nữa video hay ảnh của bạn c&oacute; thể trực tiếp đưa l&ecirc;n Facebook nhờ Social live v&agrave; ứng dụng của camera, từ đ&acirc;y bạn c&oacute; thể theo d&otilde;i c&aacute;c comment của bạn b&egrave;, người th&acirc;n tr&ecirc;n h&igrave;nh ảnh hay video của m&igrave;nh.</p>

<p><br />
<img alt="Khá nhiều ứng dụng tích hợp trong camera của Xperia Z1" src="http://cdn.tgdd.vn/Products/Images/42/60103/xperia-z1_clip_image016.jpg" /><br />
<em>Kh&aacute; nhiều ứng dụng t&iacute;ch hợp trong camera của Xperia Z1</em></p>

<p>&nbsp;</p>

<p><br />
<strong>Sony </strong><strong>Xperia Z1</strong><strong> </strong>l&agrave; một si&ecirc;u phẩm Android mang đến những trải nghiệm cao cấp m&agrave; &iacute;t sản phẩm h&atilde;ng kh&aacute;c c&oacute; thể vượt mặt được. Z1 cũng giống như c&aacute;c sản phẩm kh&aacute;c của Sony n&oacute; được chăm ch&uacute;t một c&aacute;ch kỹ lưỡng về mặt thiết kế, khi đến tay người d&ugrave;ng th&igrave; mọi người đều phải khen ngợi. Sức mạnh phần cứng của thiết bị quả thực rất đ&aacute;ng trải nghiệm, đ&aacute;ng ch&uacute; &yacute; dĩ nhi&ecirc;n l&agrave; chiếc camera l&ecirc;n đến 20.7MP v&agrave; bộ xử l&yacute; mới nhất Snapdragon 800 của Qualcomm. <strong>Xperia Z1</strong><strong> </strong>xứng đ&aacute;ng l&agrave; smartphone h&agrave;ng đầu tr&ecirc;n thị trường.</p>

<p><strong>Trung Hiếu</strong></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<table>
	<tbody>
		<tr>
			<td>
			<h3>Ưu điểm</h3>

			<ul>
				<li>M&agrave;n h&igrave;nh lớn 5inch chất lượng cực n&eacute;t nhờ c&ocirc;ng nghệ sản xuất m&agrave;n h&igrave;nh cao cấp.</li>
				<li>Camera độ ph&acirc;n giải cao nhất tr&ecirc;n thị trường smartphone Android với 20.7MP.</li>
				<li>Thiết kế nguy&ecirc;n khối, sang trọng, đẹp mắt.</li>
				<li>Bộ xử l&yacute; khủng Qualcomm Snapdragon 800 cho tốc độ l&ecirc;n đến 2.2GHz.</li>
				<li>Chống nước, chống bụi hiệu quả theo ti&ecirc;u chuẩn IP55/IP58.</li>
			</ul>
			</td>
			<td>
			<h3>Nhược điểm</h3>

			<ul>
				<li>M&agrave;n h&igrave;nh sử dụng ngo&agrave;i trời vẫn c&oacute; hiện tượng l&oacute;a.</li>
				<li>Nhiều t&iacute;nh năng cao cấp n&ecirc;n gi&aacute; của thiết bị kh&aacute; cao.</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<p>&nbsp;</p>
', 5, 99, 1, 0, 0, CAST(N'2014-03-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (31, N'LG G2 16GB', N'/Content/Images/HangKhac/LG G2 16GB.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/HangKhac/Hinh360-HangKhac/LG-G2-hinh360-1.jpg', N'" /> </a>', CAST(5490000 AS Decimal(18, 0)), CAST(6600000 AS Decimal(18, 0)), N'<p>M&agrave;n h&igrave;nh: Full HD, 5.2&quot;, 1080 x 1920 pixels CPU: Qualcomm Snapdragon 800, 4 nh&acirc;n, 2.26 GHz RAM 2 GB Hệ điều h&agrave;nh: Android 4.2.2 (Jelly Bean) Camera ch&iacute;nh: 13 MP, Quay phim FullHD 1080p@60fps Camera phụ: 2.1 MP Bộ nhớ trong: 16 GB Thẻ nhớ ngo&agrave;i đến: Kh&ocirc;ng Dung lượng pin: 3000 mAh</p>
', N'<p><img src="http://cdn.tgdd.vn/Products/Images/42/60830/Kit/LG-G2-mo-ta-chuc-nang.jpg" /></p>

<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td rowspan="2">
			<p>Th&ocirc;ng tin chung</p>
			</td>
			<td>Hệ điều h&agrave;nh</td>
			<td>Android 4.2.2 (Jelly Bean)</td>
		</tr>
		<tr>
			<td>
			<p>Ng&ocirc;n ngữ</p>
			</td>
			<td>Tiếng Việt, Tiếng Anh</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>Loại m&agrave;n h&igrave;nh</td>
			<td>True HD-IPS + LCD</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;u m&agrave;n h&igrave;nh</p>
			</td>
			<td>16 triệu m&agrave;u</td>
		</tr>
		<tr>
			<td>
			<p>Chuẩn m&agrave;n h&igrave;nh</p>
			</td>
			<td>Full HD</td>
		</tr>
		<tr>
			<td>
			<p>Độ ph&acirc;n giải</p>
			</td>
			<td>1080 x 1920 pixels</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh rộng</p>
			</td>
			<td>5.2&quot;</td>
		</tr>
		<tr>
			<td>
			<p>C&ocirc;ng nghệ cảm ứng</p>
			</td>
			<td>Cảm ứng điện dung đa điểm</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Chụp h&igrave;nh &amp; Quay phim</p>
			</td>
			<td>Camera sau</td>
			<td>13 MP</td>
		</tr>
		<tr>
			<td>
			<p>Camera trước</p>
			</td>
			<td>2.1 MP</td>
		</tr>
		<tr>
			<td>
			<p>Đ&egrave;n Flash</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>T&iacute;nh năng camera</p>
			</td>
			<td>Tự động lấy n&eacute;t, chạm lấy n&eacute;t<br />
			Nhận dạng khu&ocirc;n mặt<br />
			Chống rung quang học</td>
		</tr>
		<tr>
			<td>
			<p>Quay phim</p>
			</td>
			<td>Quay phim FullHD 1080p@60fps</td>
		</tr>
		<tr>
			<td>
			<p>Videocall</p>
			</td>
			<td>Hỗ trợ VideoCall qua Skype</td>
		</tr>
		<tr>
			<td rowspan="5">
			<p>CPU &amp; RAM</p>
			</td>
			<td>Tốc độ CPU</td>
			<td>2.26 GHz</td>
		</tr>
		<tr>
			<td>
			<p>Số nh&acirc;n</p>
			</td>
			<td>4 nh&acirc;n</td>
		</tr>
		<tr>
			<td>
			<p>Chipset</p>
			</td>
			<td>Qualcomm Snapdragon 800</td>
		</tr>
		<tr>
			<td>
			<p>RAM</p>
			</td>
			<td>2 GB</td>
		</tr>
		<tr>
			<td>
			<p>Chip đồ họa (GPU)</p>
			</td>
			<td>Adreno 330</td>
		</tr>
		<tr>
			<td rowspan="4">
			<p>Bộ nhớ &amp; Lưu trữ</p>
			</td>
			<td>Danh bạ</td>
			<td>Kh&ocirc;ng giới hạn</td>
		</tr>
		<tr>
			<td>
			<p>Bộ nhớ trong (ROM)</p>
			</td>
			<td>16 GB</td>
		</tr>
		<tr>
			<td>
			<p>Thẻ nhớ ngo&agrave;i</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Hỗ trợ thẻ tối đa</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Thiết kế &amp; Trọng lượng</p>
			</td>
			<td>Kiểu d&aacute;ng</td>
			<td>Thanh + Cảm ứng</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước</p>
			</td>
			<td>138.5 x 70.9 x 8.9mm</td>
		</tr>
		<tr>
			<td>
			<p>Trọng lượng (g)</p>
			</td>
			<td>143</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Th&ocirc;ng tin pin</p>
			</td>
			<td>Loại pin</td>
			<td>Pin chuẩn Li-Ion</td>
		</tr>
		<tr>
			<td>
			<p>Dung lượng pin</p>
			</td>
			<td>3000 mAh</td>
		</tr>
		<tr>
			<td>
			<p>Pin c&oacute; thể th&aacute;o rời</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="13">
			<p>Kết nối &amp; Cổng giao tiếp</p>
			</td>
			<td>3G</td>
			<td>HSDPA, 42 Mbps; HSUPA, 5.76 Mbps</td>
		</tr>
		<tr>
			<td>
			<p>4G</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Loại Sim</p>
			</td>
			<td>Micro SIM</td>
		</tr>
		<tr>
			<td>
			<p>Khe gắn Sim</p>
			</td>
			<td>1 Sim</td>
		</tr>
		<tr>
			<td>
			<p>Wifi</p>
			</td>
			<td>Wi-Fi 802.11 a/b/g/n, DLNA, Wi-Fi Direct, dual-band, Wi-Fi hotspot</td>
		</tr>
		<tr>
			<td>
			<p>GPS</p>
			</td>
			<td>A-GPS</td>
		</tr>
		<tr>
			<td>
			<p>Bluetooth</p>
			</td>
			<td>V4.0 with A2DP</td>
		</tr>
		<tr>
			<td>
			<p>GPRS/EDGE</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Jack tai nghe</p>
			</td>
			<td>3.5 mm</td>
		</tr>
		<tr>
			<td>
			<p>NFC</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối USB</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối kh&aacute;c</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Cổng sạc</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Giải tr&iacute; &amp; Ứng dụng</p>
			</td>
			<td>Xem phim</td>
			<td>MP4, WMV, H.263, H.264(MPEG4-AVC), DivX</td>
		</tr>
		<tr>
			<td>
			<p>Nghe nhạc</p>
			</td>
			<td>MP3, WAV, WMA, eAAC+</td>
		</tr>
		<tr>
			<td>
			<p>Ghi &acirc;m</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Giới hạn cuộc gọi</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>FM radio</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Chức năng kh&aacute;c</p>
			</td>
			<td>Mạng x&atilde; hội ảo<br />
			Gmail, Youtube, Google Map, Google Search, Google Talk<br />
			Micro chuy&ecirc;n dụng chống ồn</td>
		</tr>
	</tbody>
</table>
', N'<h2>LG G2 &ndash; Độc đ&aacute;o trong thiết kế, mạnh mẽ trong cấu h&igrave;nh</h2>

<p><br />
Tạo được ấn tượng kh&aacute; tốt với Optimus G, một thiết bị sỡ hữu cấu h&igrave;nh tốt c&ugrave;ng một thiết kế c&oacute; thể n&oacute;i l&agrave; đẹp nhất trong số c&aacute;c smartphone cao cấp của LG, h&atilde;ng điện tử H&agrave;n Quốc đang ấp ủ một kế hoạch trở lại ho&agrave;nh tr&aacute;ng hơn nữa với <strong>LG G2</strong>.</p>

<p>&nbsp;</p>

<h3><br />
Thiết kế độc đ&aacute;o</h3>

<p>LG đ&atilde; quyết định phải tạo ra một n&eacute;t g&igrave; đ&oacute; thật kh&aacute;c lạ cho <strong>LG G2</strong> để n&oacute; c&oacute; thể thật sự nổi bật khi đứng giữa loạt smartphone cao cấp kh&aacute;c. Điểm kh&aacute;c lạ n&agrave;y đ&oacute; ch&iacute;nh l&agrave; vị tr&iacute; của c&aacute;c ph&iacute;m cứng &acirc;m lượng v&agrave; ph&iacute;m nguồn. Hai ph&iacute;m n&agrave;y đ&atilde; được LG chuyển ra mặt lưng của m&aacute;y, đặt ngay ph&iacute;a dưới Camera thay v&igrave; được bố tr&iacute; ở c&aacute;c cạnh b&ecirc;n như truyền thống.</p>

<p><br />
<img alt="LG G2 sở hữu thiết kế sang trọng" src="http://cdn.tgdd.vn/Products/Images/42/60197/lgg2.jpg" /></p>

<p><em>LG G2 sang trọng với thiết kế kh&ocirc;ng ph&iacute;m cứng ở mặt trước v&agrave; cạnh b&ecirc;n</em></p>

<p><img alt="Cạnh bên LG G2" src="http://cdn.tgdd.vn/Products/Images/42/60197/LG-G2-official-images1.jpg" /></p>

<p><em>LG G2 c&oacute; đường viền kim loại chạy dọc theo th&acirc;n m&aacute;y</em></p>

<p><img alt="Mặt sau LG G2" src="http://cdn.tgdd.vn/Products/Images/42/60197/LG-G2-official-images111.jpg" /></p>

<p><em>Mặt sau với Camera 13MP được phủ k&iacute;nh sapphire chống trầy, ph&iacute;m &acirc;m lượng v&agrave; ph&iacute;m nguồn</em></p>

<p><br />
Mặt trước của LG G2 nổi bật với m&agrave;n h&igrave;nh cảm ứng rộng 5,2 inch được phủ bởi lớp k&iacute;nh cường lực Gorila Glass 3 v&agrave; kh&ocirc;ng c&oacute; bất k&igrave; một ph&iacute;m cứng n&agrave;o. 3 ph&iacute;m cảm ứng cơ bản của hệ điều h&agrave;nh Android được đưa v&agrave;o phần diện t&iacute;ch của m&agrave;n h&igrave;nh tương tự như Xperia Z. <strong>LG G2</strong> sở hữu phần viền m&agrave;n h&igrave;nh rất mỏng, c&oacute; cảm gi&aacute;c như m&agrave;n h&igrave;nh của m&aacute;y sắp tr&agrave;n ra tới m&eacute;p ngo&agrave;i của cạnh b&ecirc;n, tr&ocirc;ng rất đẹp v&agrave; sang trọng.</p>

<p>&nbsp;</p>

<h3><br />
Cấu h&igrave;nh v&ocirc; c&ugrave;ng mạnh mẽ với chip l&otilde;i tứ Snapdragon 800 v&agrave; 2GB RAM</h3>

<p><br />
<img alt="chip snapdragon 800" src="http://cdn.tgdd.vn/Products/Images/42/60197/qualcomm-snapdragon.jpg" /></p>

<p><em>LG G2 sử dụng chip Snapdragon 800 mạnh mẽ</em></p>

<p><br />
X&aacute;c định <strong>LG G2</strong> sẽ trực tiếp đối đầu với loạt smartphone cao cấp đ&igrave;nh đ&aacute;m kh&aacute;c như HTC One, Galaxy S4 n&ecirc;n LG đ&atilde; trang bị cho con cưng của m&igrave;nh một cấu h&igrave;nh v&ocirc; c&ugrave;ng mạnh mẽ. M&aacute;y được trang bị bộ <strong>vi xử l&iacute; l&otilde;i tứ Snapdragon 800 tốc độ 2,3Ghz, đồ họa Adreno 330 c&ugrave;ng 2GB RAM.</strong>&nbsp;Thử nghiệm Benchmark cho thấy LG G2 đạt số điểm l&ecirc;n đến gần 30.000, bỏ xa &ldquo;qu&aacute;i vật&rdquo; Galaxy S4 đến từ Samsung với chỉ 25.000 điểm. Với cấu h&igrave;nh n&agrave;y, <strong>LG G2</strong> c&oacute; thể tự tin vận h&agrave;nh mọi ứng dụng v&agrave; mọi t&aacute;c vụ một c&aacute;ch mượt m&agrave; nhất. Chơi Game 3D, game giả lập kh&ocirc;ng phải l&agrave; vấn đề đối với LG G2.</p>

<p><br />
LG G2 được trang bị hầu hết c&aacute;c kết nối cao cấp nhất hiện nay bao gồm LTE, LTE-A, 3G, GSM, NFC, định vị A-GPS, GLONASS, micro USB, wifi ac, bluetooth 4.0. Đặc biệt,<strong> LG G2 sử dụng pin c&oacute; dung lượng l&ecirc;n đến 3000mAh</strong>, cao nhất trong d&agrave;n smartphone cao cấp hiện nay.</p>

<p><br />
&nbsp;<img alt="LG G2 đạt điểm Benchmark gần 30000" src="http://cdn.tgdd.vn/Products/Images/42/60197/635072.jpg" /></p>

<p><em>LG G2 thể hiện sức mạnh vượt trội với điểm BenchMark đạt gần 30.000</em></p>

<p>&nbsp;</p>

<h3><br />
M&agrave;n h&igrave;nh si&ecirc;u mỏng v&agrave; si&ecirc;u s&aacute;ng</h3>

<p><br />
<img alt="LG G2 có màn hình siêu nét, siêu sáng" src="http://cdn.tgdd.vn/Products/Images/42/60197/LG-G2-hands-on-071.jpg" /></p>

<p><em>LG G2 được trang bị m&agrave;n h&igrave;nh cảm ứng si&ecirc;u n&eacute;t v&agrave; si&ecirc;u s&aacute;ng</em></p>

<p><br />
M&agrave;n h&igrave;nh LCD tr&ecirc;n c&aacute;c smartphone cao cấp của LG lu&ocirc;n được giới c&ocirc;ng nghệ đ&aacute;nh gi&aacute; rất cao. Optimus G ngay từ khi ra mắt lu&ocirc;n nằm trong top đầu những thiết bị c&oacute; m&agrave;n h&igrave;nh hiển thị đẹp nhất. M&agrave;n h&igrave;nh IPS 5,2 inch tr&ecirc;n <strong>LG G2</strong> c&oacute; độ ph&acirc;n giải Full HD 1080p v&agrave; c&oacute; độ s&aacute;ng l&ecirc;n tới 450 nit.&nbsp;<strong>LG G2</strong> sẽ mang đến cho bạn một trải nghiệm hiển thị mới với h&igrave;nh ảnh sống động, m&agrave;u sắc trung thực ngay cả trong điều kiện m&ocirc;i trường c&oacute; &aacute;nh s&aacute;ng mạnh như ngo&agrave;i trời.</p>

<p>&nbsp;</p>

<h3><br />
Camera 13 chấm c&ugrave;ng khả năng ổn định h&igrave;nh ảnh quang học</h3>

<p><br />
<img alt="Giao diện chụp ảnh LG G2" src="http://cdn.tgdd.vn/Products/Images/42/60197/LG-G2-hands-on-051.jpg" /></p>

<p><em>Giao diện chụp ảnh của LG G2</em></p>

<p><br />
<img alt="Camera LG G2 được trang bị hệ thống ổn định hình ảnh quang học" src="http://cdn.tgdd.vn/Files/2013/08/08/519982/ImageAttach/g2-ois-20138802841.jpg" /></p>

<p><em>Camera LG G2 được trang bị hệ thống ổn định h&igrave;nh ảnh quang học</em></p>

<p><br />
Nếu như Optimus G kh&ocirc;ng được giới chuy&ecirc;n m&ocirc;n đ&aacute;nh gi&aacute; cao ở Camera th&igrave; trong cuộc chạy đua về chất lượng của Camera như hiện nay, LG cũng kh&ocirc;ng hề đứng ngo&agrave;i cuộc. Camera 13MP tr&ecirc;n <strong>LG G2</strong> được trang bị t&iacute;nh năng ổn định quang học mới gi&uacute;p m&aacute;y c&oacute; thể bắt n&eacute;t nhanh hơn, chống rung tốt hơn, m&agrave;u s&aacute;c thể hiện ch&iacute;nh x&aacute;c hơn, chụp tốt hơn trong điều kiện thiếu s&aacute;ng. Camera của m&aacute;y c&oacute; thể quay phim với độ ph&acirc;n giải Full HD v&agrave; chụp ảnh ở chế độ HDR. Ngo&agrave;i ra,&nbsp;LG cũng quyết định sử dụng <strong>k&iacute;nh sapphire chống trầy</strong>, chống b&aacute;m v&acirc;n tay cho camera của <strong>G2</strong>.</p>

<p>&nbsp;</p>

<p><em>Video quảng c&aacute;o thể hiện khả năng lấy n&eacute;t v&agrave; chống rung ho&agrave;n hảo của LG G2</em></p>

<p>&nbsp;</p>

<h3><br />
&Acirc;m thanh Stereo chất lượng cao</h3>

<p><strong>LG G2</strong> l&agrave; chiếc smartphone đầu ti&ecirc;n cho &acirc;m thanh ra&nbsp;ở dải tần Hi-Fi 24bit, 192KHz, cao hơn chuẩn &acirc;m thanh th&ocirc;ng thường của đĩa CD l&agrave; 16bit, 44.1KHz. Kh&ocirc;ng giống như iPhone 5 hay đa số c&aacute;c smartphone cao cấp kh&aacute;c chỉ ph&aacute;t ra &acirc;m thanh mono với loa ngo&agrave;i, thiết bị n&agrave;y hỗ trợ &nbsp;loa ngo&agrave;i c&oacute; khả năng ph&aacute;t &acirc;m thanh Stereo.</p>

<p><img alt="Jack 3.5, loa kép và cổng Micro USB LG G2" src="http://cdn.tgdd.vn/Products/Images/42/60197/LG-G2-official-images21.jpg" /></p>

<p><em>Hệ thống loa Stereo tr&ecirc;n LG G2</em></p>

<p>&nbsp;</p>

<h3><br />
Phụ kiện QuickWindows</h3>

<p>Vỏ QuickWindow sẽ c&oacute; một &quot;cửa sổ&quot; cho ph&eacute;p người d&ugrave;ng xem lướt c&aacute;c th&ocirc;ng tin hiển thị tr&ecirc;n m&agrave;n h&igrave;nh m&agrave; kh&ocirc;ng cần mở tấm vỏ ốp. Chỉ với một c&aacute;i vuốt tay nhẹ, giao diện của QuickWindow sẽ xuất hiện cho ph&eacute;p người d&ugrave;ng xem th&ocirc;ng tin hiển thị tr&ecirc;n m&agrave;n h&igrave;nh nhanh ch&oacute;ng. C&aacute;c th&ocirc;ng tin c&oacute; thể xem qua QuickWindows gồm đồng hồ, thời tiết, b&aacute;o thức, ứng dụng nhạc, chi tiết cuộc gọi đến v&agrave; tin nhắn đến. Vỏ ốp QuickWindow cho <strong>LG G2</strong> sẽ c&oacute; 7 m&agrave;u gồm: đen, trắng, hồng, t&iacute;a, xanh, v&agrave;ng v&agrave; m&agrave;u xanh bạc h&agrave;.</p>

<p><br />
&nbsp;<img alt="Vỏ QuickWindows cho LG G2" src="http://cdn.tgdd.vn/Products/Images/42/60197/642486.jpg" /></p>

<p><em>Vỏ QuickWindows l&agrave; một phụ kiện gi&uacute;p LG G2 trở n&ecirc;n th&ocirc;ng minh hơn</em></p>

<p>&nbsp;</p>

<p><em>Video thể hiện c&aacute;c t&iacute;nh năng th&ocirc;ng minh của vỏ QuickWindows</em></p>

<p>&nbsp;</p>

<p><strong>C&ocirc;ng Đo&agrave;n</strong></p>

<p>Ảnh: LG, sưu tầm</p>

<p>&nbsp;</p>

<table>
	<tbody>
		<tr>
			<td>
			<h3>Ưu điểm</h3>

			<ul>
				<li>Thiết kế độc đ&aacute;o, sang trọng với cụm ph&iacute;m duy nhất ở mặt lưng.</li>
				<li>Cấu h&igrave;nh mạnh mẽ với chip l&otilde;i tứ Snapdragon 800, 2GB RAM.</li>
				<li>M&agrave;n h&igrave;nh cảm ứng Full HD IPS 5.2inch sắc n&eacute;t, độ s&aacute;ng cao, viền m&agrave;n h&igrave;nh si&ecirc;u mỏng.</li>
				<li>M&aacute;y ảnh 13MP chống rung quang học.</li>
				<li>&Acirc;m thanh Hi-Fi.</li>
			</ul>
			</td>
			<td>
			<h3>Nhược điểm</h3>

			<ul>
				<li>Thiết kế mới khiến người d&ugrave;ng phải mất thời gian l&agrave;m quen.</li>
				<li>Sử dụng chất liệu vỏ nhựa.</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>
', 6, 99, 2, 0, 0, CAST(N'2014-03-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (32, N'LG G Flex', N'/Content/Images/HangKhac/LG G Flex.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/HangKhac/Hinh360-HangKhac/LG-G2-hinh360-1.jpg', N'" /> </a>', CAST(5990000 AS Decimal(18, 0)), CAST(6200000 AS Decimal(18, 0)), N'<p>M&agrave;n h&igrave;nh: HD, 6.0&quot;, 720 x 1280 pixels CPU: Qualcomm Snapdragon 800, 4 nh&acirc;n, 2.26 GHz RAM 2 GB Camera ch&iacute;nh: 13 MP, Quay phim FullHD 1080p@30fps Camera phụ: 2.1 MP Bộ nhớ trong: 32 GB Thẻ nhớ ngo&agrave;i đến: Kh&ocirc;ng Dung lượng pin: 3500 mAh</p>
', N'<p><img src="http://cdn.tgdd.vn/Products/Images/42/60717/Kit/LG-G-Flex-mo-ta-chuc-nang.jpg" /></p>

<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td rowspan="2">
			<p>Th&ocirc;ng tin chung</p>
			</td>
			<td>Hệ điều h&agrave;nh</td>
			<td>Android 4.2.2 (Jelly Bean)</td>
		</tr>
		<tr>
			<td>
			<p>Ng&ocirc;n ngữ</p>
			</td>
			<td>Tiếng Việt, Tiếng Anh</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>M&agrave;n h&igrave;nh</p>
			</td>
			<td>Loại m&agrave;n h&igrave;nh</td>
			<td>Curved P-OLED</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;u m&agrave;n h&igrave;nh</p>
			</td>
			<td>16 triệu m&agrave;u</td>
		</tr>
		<tr>
			<td>
			<p>Chuẩn m&agrave;n h&igrave;nh</p>
			</td>
			<td>HD</td>
		</tr>
		<tr>
			<td>
			<p>Độ ph&acirc;n giải</p>
			</td>
			<td>720 x 1280 pixels</td>
		</tr>
		<tr>
			<td>
			<p>M&agrave;n h&igrave;nh rộng</p>
			</td>
			<td>6.0&quot;</td>
		</tr>
		<tr>
			<td>
			<p>C&ocirc;ng nghệ cảm ứng</p>
			</td>
			<td>Cảm ứng điện dung đa điểm</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Chụp h&igrave;nh &amp; Quay phim</p>
			</td>
			<td>Camera sau</td>
			<td>13 MP</td>
		</tr>
		<tr>
			<td>
			<p>Camera trước</p>
			</td>
			<td>2.1 MP</td>
		</tr>
		<tr>
			<td>
			<p>Đ&egrave;n Flash</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>T&iacute;nh năng camera</p>
			</td>
			<td>Tự động lấy n&eacute;t<br />
			Nhận diện khu&ocirc;n mặt, nụ cười</td>
		</tr>
		<tr>
			<td>
			<p>Quay phim</p>
			</td>
			<td>Quay phim FullHD 1080p@30fps</td>
		</tr>
		<tr>
			<td>
			<p>Videocall</p>
			</td>
			<td>Hỗ trợ VideoCall qua Skype</td>
		</tr>
		<tr>
			<td rowspan="5">
			<p>CPU &amp; RAM</p>
			</td>
			<td>Tốc độ CPU</td>
			<td>2.26 GHz</td>
		</tr>
		<tr>
			<td>
			<p>Số nh&acirc;n</p>
			</td>
			<td>4 nh&acirc;n</td>
		</tr>
		<tr>
			<td>
			<p>Chipset</p>
			</td>
			<td>Qualcomm Snapdragon 800</td>
		</tr>
		<tr>
			<td>
			<p>RAM</p>
			</td>
			<td>2 GB</td>
		</tr>
		<tr>
			<td>
			<p>Chip đồ họa (GPU)</p>
			</td>
			<td>Adreno 330</td>
		</tr>
		<tr>
			<td rowspan="4">
			<p>Bộ nhớ &amp; Lưu trữ</p>
			</td>
			<td>Danh bạ</td>
			<td>Kh&ocirc;ng giới hạn</td>
		</tr>
		<tr>
			<td>
			<p>Bộ nhớ trong (ROM)</p>
			</td>
			<td>32 GB</td>
		</tr>
		<tr>
			<td>
			<p>Thẻ nhớ ngo&agrave;i</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>Hỗ trợ thẻ tối đa</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Thiết kế &amp; Trọng lượng</p>
			</td>
			<td>Kiểu d&aacute;ng</td>
			<td>Thanh + Cảm ứng</td>
		</tr>
		<tr>
			<td>
			<p>K&iacute;ch thước</p>
			</td>
			<td>160.5 x 81.6 x 8.7 mm</td>
		</tr>
		<tr>
			<td>
			<p>Trọng lượng (g)</p>
			</td>
			<td>177</td>
		</tr>
		<tr>
			<td rowspan="3">
			<p>Th&ocirc;ng tin pin</p>
			</td>
			<td>Loại pin</td>
			<td>Pin chuẩn Li-Ion</td>
		</tr>
		<tr>
			<td>
			<p>Dung lượng pin</p>
			</td>
			<td>3500 mAh</td>
		</tr>
		<tr>
			<td>
			<p>Pin c&oacute; thể th&aacute;o rời</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td rowspan="13">
			<p>Kết nối &amp; Cổng giao tiếp</p>
			</td>
			<td>3G</td>
			<td>HSDPA, 42 Mbps; HSUPA, 5.76 Mbps</td>
		</tr>
		<tr>
			<td>
			<p>4G</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Loại Sim</p>
			</td>
			<td>Micro SIM</td>
		</tr>
		<tr>
			<td>
			<p>Khe gắn Sim</p>
			</td>
			<td>1 Sim</td>
		</tr>
		<tr>
			<td>
			<p>Wifi</p>
			</td>
			<td>Wi-Fi 802.11 a/b/g/n/ac, dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot</td>
		</tr>
		<tr>
			<td>
			<p>GPS</p>
			</td>
			<td>A-GPS v&agrave; GLONASS</td>
		</tr>
		<tr>
			<td>
			<p>Bluetooth</p>
			</td>
			<td>V4.0 with A2DP</td>
		</tr>
		<tr>
			<td>
			<p>GPRS/EDGE</p>
			</td>
			<td>Class 12 (4+1/3+2/2+3/1+4 slots), 32 - 48 kbps</td>
		</tr>
		<tr>
			<td>
			<p>Jack tai nghe</p>
			</td>
			<td>3.5 mm</td>
		</tr>
		<tr>
			<td>
			<p>NFC</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối USB</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td>
			<p>Kết nối kh&aacute;c</p>
			</td>
			<td>NFC</td>
		</tr>
		<tr>
			<td>
			<p>Cổng sạc</p>
			</td>
			<td>Micro USB</td>
		</tr>
		<tr>
			<td rowspan="6">
			<p>Giải tr&iacute; &amp; Ứng dụng</p>
			</td>
			<td>Xem phim</td>
			<td>MP4, WMV, H.263, H.264(MPEG4-AVC), Xvid, DivX</td>
		</tr>
		<tr>
			<td>
			<p>Nghe nhạc</p>
			</td>
			<td>MP3, WAV, WMA, eAAC+, AC3, FLAC</td>
		</tr>
		<tr>
			<td>
			<p>Ghi &acirc;m</p>
			</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>
			<p>Giới hạn cuộc gọi</p>
			</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>
			<p>FM radio</p>
			</td>
			<td>FM radio với RDS</td>
		</tr>
		<tr>
			<td>
			<p>Chức năng kh&aacute;c</p>
			</td>
			<td>Mạng x&atilde; hội ảo<br />
			Google Search, Maps, Gmail, YouTube, Google Talk, Picasa<br />
			Micro chuy&ecirc;n dụng chống ồn</td>
		</tr>
	</tbody>
</table>
', N'<h2>LG G Flex - M&agrave;n h&igrave;nh cong, pin cong, tự chữa l&agrave;nh vết xước độc nhất TG</h2>

<p>Với những nỗ lực của m&igrave;nh, <a href="http://www.thegioididong.com/dtdd-lg" target="_blank">LG</a> đ&atilde; mang lại cho người d&ugrave;ng rất nhiều sự ngạc nhi&ecirc;n v&agrave; những trải nghiệm th&uacute; vị trong loạt sản phẩm của năm 2013. Trong đ&oacute;, <strong>G Flex</strong> l&agrave; chiếc <a href="http://www.thegioididong.com/dtdd?f=smartphone" target="_blank">smartphone</a> g&acirc;y được ch&uacute; &yacute; hơn cả khi m&aacute;y sở hữu m&agrave;n h&igrave;nh cong độc đ&aacute;o c&ugrave;ng cấu h&igrave;nh mạnh mẽ, với thiết kế tuyệt đẹp v&agrave; đẳng cấp.</p>

<p>&nbsp;</p>

<h3><br />
M&agrave;n h&igrave;nh cong P-OLED 6 inch cho trải nghiệm th&uacute; vị</h3>

<p><strong>LG G Flex</strong> sở hữu m&agrave;n h&igrave;nh P-OLED 6 inch cho h&igrave;nh ảnh ch&acirc;n thật v&agrave; m&agrave;u sắc sống động hơn c&aacute;c m&agrave;n h&igrave;nh LCD th&ocirc;ng thường. Điều đặc biệt l&agrave; m&agrave;n h&igrave;nh được thiết kế cong theo chiều ngang tạo n&ecirc;n một sự đột ph&aacute; mới trong thiết kế. M&agrave;n h&igrave;nh cong tr&ecirc;n <strong>G Flex</strong> sẽ gi&uacute;p m&aacute;y &ocirc;m v&agrave;o mặt người một c&aacute;ch tự nhi&ecirc;n, tạo cảm gi&aacute;c thoải m&aacute;i khi thực hiện cuội gọi.</p>

<p><img alt="LG G Flex với màn hình cong OLED 6 inch sắc nét đến từng chi tiết" src="http://cdn.tgdd.vn/Products/Images/42/60717/lg-g-flex_clip_image002.jpg" /><br />
<em>M&agrave;n h&igrave;nh cong OLED 6 inch sắc n&eacute;t đến từng chi tiết</em></p>

<p>Đặc biệt hơn, với m&agrave;n h&igrave;nh cong n&agrave;y, khi đặt m&aacute;y nằm ngang để xem video sẽ c&oacute; cảm gi&aacute;c v&ocirc; c&ugrave;ng th&uacute; vị bởi người d&ugrave;ng như được ngồi trước một rạp chiếu v&agrave; h&ograve;a m&igrave;nh v&agrave;o bộ phim.</p>

<p><img alt="Độ cong của màn hình không lớn lắm nhưng đủ để G Flex tạo sự khác biệt" src="http://cdn.tgdd.vn/Products/Images/42/60717/lg-g-flex_clip_image004.jpg" /><br />
<em>Độ cong của m&agrave;n h&igrave;nh kh&ocirc;ng lớn lắm nhưng đủ để tạo sự kh&aacute;c biệt</em></p>

<p>&nbsp;</p>

<h3><br />
Bộ vi xử l&iacute; khủng với chip l&otilde;i tứ Snapdragon 800</h3>

<p><strong>LG G Flex</strong> được trang bị vi xử l&iacute; Snapdragon 800 bốn nh&acirc;n 2.26 GHz, RAM 2 GB, bộ nhớ trong 32 GB, gi&uacute;p m&aacute;y c&oacute; thể xử l&yacute; mượt m&agrave; bất k&igrave; ứng dụng hay game đồ họa n&agrave;o. Ngo&agrave;i ra, m&aacute;y được c&agrave;i đặt sẵn hệ điều h&agrave;nh Android 4.2.2 Jelly Bean ngay khi xuất xưởng với t&ugrave;y biến giao diện đẹp hơn v&agrave; tối ưu cho smartphone m&agrave;n h&igrave;nh lớn.</p>

<p><img alt="LG G Flex sở hữu CPU lõi tứ Snapdragon 800 mạnh mẽ" src="http://cdn.tgdd.vn/Products/Images/42/60717/lg-g-flex_clip_image006.jpg" /><br />
<em>LG G Flex sở hữu CPU l&otilde;i tứ Snapdragon 800 mạnh mẽ</em></p>

<p>Ngo&agrave;i ra, <strong>LG</strong> c&ograve;n bổ sung v&agrave;o HĐH Android những t&iacute;nh năng độc quyền của h&atilde;ng như <strong>Knock On</strong> cho ph&eacute;p g&otilde; v&agrave;o m&agrave;n h&igrave;nh 2 lần để mở/kh&oacute;a m&aacute;y, hay t&iacute;nh năng <strong>Plug and Pop</strong> gi&uacute;p nhanh ch&oacute;ng l&agrave;m việc với c&aacute;c thiết bị ngoại vi ngay khi kết nối v&agrave;o m&aacute;y,...</p>

<p><img alt="G Flex chạy HĐH Android 4.2.2 cùng nhiều tùy biến hữu ích" src="http://cdn.tgdd.vn/Products/Images/42/60717/lg-g-flex_clip_image008.jpg" /><br />
<em>G Flex chạy HĐH Android 4.2.2 c&ugrave;ng nhiều t&ugrave;y biến hữu &iacute;ch</em></p>

<p>&nbsp;</p>

<h3><br />
Camera 13 MP cho những bức h&igrave;nh tuyệt đẹp</h3>

<p>Với xu hướng chung của thị trường di động, chất lượng camera lu&ocirc;n l&agrave; yếu tố được quan t&acirc;m h&agrave;ng đầu trong việc lựa chọn smartphone của người d&ugrave;ng. Nắm bắt xu thế đ&oacute;, LG đ&atilde; trang bị cho <strong>G Flex</strong> camera độ ph&acirc;n giải 13 MP nhờ đ&oacute;&nbsp;<strong>LG G Flex</strong> c&oacute; khả năng ghi lại những bức h&igrave;nh trung thực, m&agrave;u sắc ấn tượng ngay cả trong điều kiện thiếu s&aacute;ng.</p>

<p><img alt="Camera 13 MP cùng tính năng chống rung quang học trên LG G Flex cho những bức hình tuyệt đẹp" src="http://cdn.tgdd.vn/Products/Images/42/60717/lg-g-flex_clip_image010.jpg" /><br />
<em>Camera 13 MP c&ugrave;ng t&iacute;nh năng chống rung quang học cho những bức h&igrave;nh tuyệt đẹp</em></p>

<p>Camera n&agrave;y c&ograve;n c&oacute; khả năng quay video Full HD, chụp ảnh ở chế độ HDR. Ngo&agrave;i ra, c&aacute;c t&iacute;nh năng như nhận diện nụ cười, tăng cường chất lượng &acirc;m thanh khi quay video, chụp li&ecirc;n tiếp nhiều tấm ảnh chỉ với một lần chạm,&hellip;cũng c&oacute; mặt đầy đủ tr&ecirc;n ứng dụng chụp h&igrave;nh.</p>

<p>&nbsp;</p>

<h3><br />
C&ocirc;ng nghệ tự phục hồi vết xước &ldquo;độc nhất v&ocirc; nhị&rdquo;</h3>

<p>Việc tự phục hồi vết xước nghe giống như &ldquo;phim viễn tưởng&rdquo; nhưng thật bất ngờ khi <strong>LG</strong> đ&atilde; nghi&ecirc;n cứu th&agrave;nh c&ocirc;ng v&agrave; &aacute;p dụng tr&ecirc;n<strong> G Flex</strong>. Mặt sau của chiếc smartphone n&agrave;y<strong> </strong>được phủ một lớp phim đặc biệt để phục hồi những vết xước chỉ trong thời gian ngắn. Đ&acirc;y l&agrave; c&ocirc;ng nghệ ho&agrave;n to&agrave;n mới chưa xuất hiện tr&ecirc;n bất k&igrave; chiếc điện thoại n&agrave;o. Giờ đ&acirc;y bạn c&oacute; thể thoải m&aacute;i đặt m&aacute;y l&ecirc;n c&aacute;c bề mặt th&ocirc; r&aacute;p m&agrave; kh&ocirc;ng c&ograve;n băn khoăn đến việc trầy xước mặt sau của m&aacute;y.</p>

<p><img alt="LG G Flex là chiếc smartphone duy nhất trên thế giới có khả năng phục hồi vết xước" src="http://cdn.tgdd.vn/Products/Images/42/60717/lg-g-flex_clip_image012.jpg" /><br />
<em>LG G Flex l&agrave; chiếc smartphone duy nhất tr&ecirc;n thế giới c&oacute; khả năng phục hồi vết xước</em></p>

<p>&nbsp;</p>

<h3><br />
Pin 3500 mAh cho thời lượng sử dụng vượt trội</h3>

<p>Ngo&agrave;i c&ocirc;ng nghệ tự phục hồi vết xước &ldquo;độc nhất v&ocirc; nhị&rdquo; th&igrave; <strong>LG G Flex</strong> c&ograve;n sở hữu vi&ecirc;n pin cong đầu ti&ecirc;n tr&ecirc;n thế giới nhờ c&ocirc;ng nghệ Stack and Folding cho ch&iacute;nh LG ph&aacute;t triển. H&igrave;nh dạng pin cong theo chiều cong của m&aacute;y gi&uacute;p vi&ecirc;n pin đảm bảo được sức bền vật l&yacute; v&agrave; độ ổn định trong qu&aacute; tr&igrave;nh hoạt động trong khi vẫn giữ được d&aacute;ng vẻ thanh mảnh tuyệt đẹp.</p>

<p>Ngo&agrave;i h&igrave;nh d&aacute;ng, dung lượng pin 3500 mAh cũng l&agrave; một điểm cộng lớn. Thậm ch&iacute; dung lượng n&agrave;y c&ograve;n cao hơn nhiều so với <strong>Galaxy Note 3</strong> (3200 mAh), <strong>HTC One Max</strong> (3300 mAh) hay ch&iacute;nh &ldquo;người anh em&rdquo; của n&oacute; l&agrave; <strong>LG G2</strong> (3000 mAh). Dung lượng pin lớn gi&uacute;p m&aacute;y c&oacute; thể hoạt động li&ecirc;n tục đến 1 ng&agrave;y rưỡi nếu sử dụng tiết kiệm.</p>

<p><img alt="Pin 3500 mAh cho thời gian sử dụng LG G Flex lâu hơn" src="http://cdn.tgdd.vn/Products/Images/42/60717/lg-g-flex_clip_image014.jpg" /><br />
<em>Pin 3500 mAh cho thời gian sử dụng l&acirc;u hơn</em></p>

<p>&nbsp;</p>

<h3><br />
T&oacute;m lại:</h3>

<p><strong>LG G Flex</strong> hứa hẹn sẽ tạo n&ecirc;n một sự b&ugrave;ng nổ trong ph&acirc;n kh&uacute;c phablet n&oacute;i chung v&agrave; ph&acirc;n kh&uacute;c smartphone m&agrave;n h&igrave;nh cong n&oacute;i ri&ecirc;ng. Với việc được t&iacute;ch hợp nhiều c&ocirc;ng nghệ cao cấp, cấu h&igrave;nh mạnh mẽ v&agrave; đặc biệt l&agrave; m&agrave;n h&igrave;nh cong độc đ&aacute;o, <strong>G Flex</strong> chắc chắn sẽ mang đến những trải nghiệm mới lạ v&agrave; th&uacute; vị cho người d&ugrave;ng.</p>

<p><strong>Anh Tu&acirc;n</strong></p>

<table>
	<tbody>
		<tr>
			<td>
			<h3>Ưu điểm</h3>

			<ul>
				<li>Độc đ&aacute;o với m&agrave;n h&igrave;nh cong v&agrave; ph&iacute;m vật l&yacute; ở mặt sau.</li>
				<li>Cấu h&igrave;nh cao với CPU Snapdragon l&otilde;i tứ 2.26 GHz, RAM 2 GB.</li>
				<li>Camera độ ph&acirc;n giải 13 MP, chống rung quang học.</li>
				<li>C&ocirc;ng nghệ tự động phục hồi vết xước ở mặt sau.</li>
				<li>Pin dung lượng 3500 mAh cho thời gian sử dụng l&acirc;u hơn.</li>
			</ul>
			</td>
			<td>
			<h3>Nhược điểm</h3>

			<ul>
				<li>Độ ph&acirc;n giải m&agrave;n h&igrave;nh chỉ đạt 720p.</li>
				<li>Kh&ocirc;ng hỗ trợ thẻ nhớ microSD.</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>
', 6, 99, 1, 0, 0, CAST(N'2014-03-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (33, N'Mobell Nova F', N'/Content/Images/HangKhac/Mobell Nova F.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/HangKhac/Hinh360-HangKhac/LG-G2-hinh360-1.jpg', N'" /> </a>', CAST(2890000 AS Decimal(18, 0)), CAST(3050000 AS Decimal(18, 0)), N'Màn hình:	FWVGA, 5.0", 480 x 854 Pixels
CPU:	MTK 6572, 2 nhân, 1.2 GHz
RAM	512 MB
Camera chính:	8.0 MP, Quay phim HD 720p@30fps
Camera phụ:	VGA (0.3 Mpx)
Bộ nhớ trong:	4 GB
Thẻ nhớ ngoài đến:	32 GB
Dung lượng pin:	2000 mAh', N'<img class="lazy" src="http://cdn.tgdd.vn/Products/Images/42/60286/Kit/Mobell-Nova-F-mo-ta-chuc-nang.jpg">   <table style="width: 100%;" class="product-compare" border="0" cellpadding="0" cellspacing="0">
    <tbody>
        <tr class="r">
            <td rowspan="2" class="g" valign="top">
            <div class="gh">Thông tin chung</div>
            </td>
            <td id="prop_72" class="p f eph" onclick="ShowHelp(72, 2);">Hệ điều hành</td>
            <td id="c72_1" class="v f">Android 4.2.2 (Jelly Bean)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_75" class="ph eph" onclick="ShowHelp(75, 2);">Ngôn ngữ</div>
            </td>
            <td id="c75_1" class="v">Tiếng Việt, Tiếng Anh</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Màn hình</div>
            </td>
            <td class="p f">Loại màn hình</td>
            <td id="c6459_1" class="v f">LCD</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Màu màn hình</div>
            </td>
            <td id="c6239_1" class="v">16 triệu màu</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_77" class="ph eph" onclick="ShowHelp(77, 2);">Chuẩn màn hình</div>
            </td>
            <td id="c77_1" class="v">FWVGA</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_78" class="ph eph" onclick="ShowHelp(78, 2);">Độ phân giải</div>
            </td>
            <td id="c78_1" class="v">480 x 854 Pixels</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_79" class="ph eph" onclick="ShowHelp(79, 2);">Màn hình rộng</div>
            </td>
            <td id="c79_1" class="v">5.0"</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_80" class="ph eph" onclick="ShowHelp(80, 2);">Công nghệ cảm ứng</div>
            </td>
            <td id="c80_1" class="v">Cảm ứng điện dung đa điểm</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Chụp hình &amp; Quay phim</div>
            </td>
            <td id="prop_27" class="p f eph" onclick="ShowHelp(27, 2);">Camera sau</td>
            <td id="c27_1" class="v f">8.0 MP</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_29" class="ph eph" onclick="ShowHelp(29, 2);">Camera trước</div>
            </td>
            <td id="c29_1" class="v">VGA (0.3 Mpx)</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Đèn Flash</div>
            </td>
            <td id="c6460_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_28" class="ph eph" onclick="ShowHelp(28, 2);">Tính năng camera</div>
            </td>
            <td id="c28_1" class="v">Tự động lấy nét</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_31" class="ph eph" onclick="ShowHelp(31, 2);">Quay phim</div>
            </td>
            <td id="c31_1" class="v">Quay phim HD 720p@30fps</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_30" class="ph eph" onclick="ShowHelp(30, 2);">Videocall</div>
            </td>
            <td id="c30_1" class="v">Không</td>
        </tr>
        <tr class="r">
            <td rowspan="5" class="g" valign="top">
            <div class="gh">CPU &amp; RAM</div>
            </td>
            <td id="prop_51" class="p f eph" onclick="ShowHelp(51, 2);">Tốc độ CPU</td>
            <td id="c51_1" class="v f">1.2 GHz</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Số nhân</div>
            </td>
            <td id="c6461_1" class="v">2 nhân</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6059" class="ph eph" onclick="ShowHelp(6059, 2);">Chipset</div>
            </td>
            <td id="c6059_1" class="v">MTK 6572</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">RAM</div>
            </td>
            <td id="c50_1" class="v">512 MB</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6079" class="ph eph" onclick="ShowHelp(6079, 2);">Chip đồ họa (GPU)</div>
            </td>
            <td id="c6079_1" class="v">Mali-400MP</td>
        </tr>
        <tr class="r">
            <td rowspan="4" class="g" valign="top">
            <div class="gh">Bộ nhớ &amp; Lưu trữ</div>
            </td>
            <td id="prop_54" class="p f eph" onclick="ShowHelp(54, 2);">Danh bạ</td>
            <td id="c54_1" class="v f">Không giới hạn</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_49" class="ph eph" onclick="ShowHelp(49, 2);">Bộ nhớ trong (ROM)</div>
            </td>
            <td id="c49_1" class="v">4 GB</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_52" class="ph eph" onclick="ShowHelp(52, 2);">Thẻ nhớ ngoài</div>
            </td>
            <td id="c52_1" class="v">MicroSD (T-Flash)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_53" class="ph eph" onclick="ShowHelp(53, 2);">Hỗ trợ thẻ tối đa</div>
            </td>
            <td id="c53_1" class="v">32 GB</td>
        </tr>
        <tr class="r">
            <td rowspan="3" class="g" valign="top">
            <div class="gh">Thiết kế &amp; Trọng lượng</div>
            </td>
            <td id="prop_73" class="p f eph" onclick="ShowHelp(73, 2);">Kiểu dáng</td>
            <td id="c73_1" class="v f">Thanh + Cảm ứng</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_88" class="ph eph" onclick="ShowHelp(88, 2);">Kích thước</div>
            </td>
            <td id="c88_1" class="v">143.9 x 75.3 x 10.55 mm</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_100" class="ph eph" onclick="ShowHelp(100, 2);">Trọng lượng (g)</div>
            </td>
            <td id="c100_1" class="v">189</td>
        </tr>
        <tr class="r">
            <td rowspan="3" class="g" valign="top">
            <div class="gh">Thông tin pin</div>
            </td>
            <td class="p f">Loại pin</td>
            <td id="c83_1" class="v f">Pin chuẩn Li-Ion</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_84" class="ph eph" onclick="ShowHelp(84, 2);">Dung lượng pin</div>
            </td>
            <td id="c84_1" class="v">2000 mAh</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Pin có thể tháo rời</div>
            </td>
            <td id="c6462_1" class="v">Có</td>
        </tr>
        <tr class="r">
            <td rowspan="13" class="g" valign="top">
            <div class="gh">Kết nối &amp; Cổng giao tiếp</div>
            </td>
            <td id="prop_65" class="p f eph" onclick="ShowHelp(65, 2);">3G</td>
            <td id="c65_1" class="v f">HSDPA, 7.2 Mbps; HSUPA, 5.76 Mbps</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">4G</div>
            </td>
            <td id="c6463_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Loại Sim</div>
            </td>
            <td id="c6339_1" class="v">SIM bình thường</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_60" class="ph eph" onclick="ShowHelp(60, 2);">Khe gắn Sim</div>
            </td>
            <td id="c60_1" class="v">2 SIM 2 sóng</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_66" class="ph eph" onclick="ShowHelp(66, 2);">Wifi</div>
            </td>
            <td id="c66_1" class="v">Wi-Fi 802.11 b/g/n, Wi-Fi hotspot</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_68" class="ph eph" onclick="ShowHelp(68, 2);">GPS</div>
            </td>
            <td id="c68_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_69" class="ph eph" onclick="ShowHelp(69, 2);">Bluetooth</div>
            </td>
            <td id="c69_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_61" class="ph eph" onclick="ShowHelp(61, 2);">GPRS/EDGE</div>
            </td>
            <td id="c61_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_48" class="ph eph" onclick="ShowHelp(48, 2);">Jack tai nghe</div>
            </td>
            <td id="c48_1" class="v">3.5 mm</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">NFC</div>
            </td>
            <td id="c6464_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_71" class="ph eph" onclick="ShowHelp(71, 2);">Kết nối USB</div>
            </td>
            <td id="c71_1" class="v">Micro USB</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Kết nối khác</div>
            </td>
            <td id="c5199_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Cổng sạc</div>
            </td>
            <td id="c85_1" class="v">Micro USB</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Giải trí &amp; Ứng dụng</div>
            </td>
            <td id="prop_32" class="p f eph" onclick="ShowHelp(32, 2);">Xem phim</td>
            <td id="c32_1" class="v f">MP4, WMV, H.263, H.264(MPEG4-AVC)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_33" class="ph eph" onclick="ShowHelp(33, 2);">Nghe nhạc</div>
            </td>
            <td id="c33_1" class="v">MP3, WAV, WMA, eAAC+</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_36" class="ph eph" onclick="ShowHelp(36, 2);">Ghi âm</div>
            </td>
            <td id="c36_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6039" class="ph eph" onclick="ShowHelp(6039, 2);">Giới hạn cuộc gọi</div>
            </td>
            <td id="c6039_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_34" class="ph eph" onclick="ShowHelp(34, 2);">FM radio</div>
            </td>
            <td id="c34_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Chức năng khác</div>
            </td>
            <td id="c43_1" class="v">Mạng xã hội ảo<br>Google Play, Google Search, Google Now, Maps, Gmail, YouTube, Lịch</td>
        </tr>
    </tbody>
</table>', N'<h2 align="center">Mobell Nova F – Smartphone màn hình rộng, máy ảnh cao với giá bình dân</h2><p style="text-align: justify;" align=""><strong><br>Nova F</strong> có thiết kế thanh mảnh, khỏe khoắn và nam tính với độ mỏng hơn 10.5 mm cùng nhiều màu sắc trẻ trung và bắt mắt để bạn lựa chọn.</p><p align="center"><em><img title="Thiết kế của Nova F" src="http://cdn.tgdd.vn/Products/Images/42/60286/mobell-nova-f_clip_image002.jpg" alt="Thiết kế trẻ trung, chắc chắn của Nova F"></em><br><em>Thiết kế trẻ trung, chắc chắn của Nova F</em></p><p style="text-align: justify;" align=""><br>Mặc dù <strong>Mobell Nova F</strong> có màn hình lớn nhưng thiết kế sau hơi cong vòm nên bạn sẽ yên tâm là có thể cầm chắc trong một tay. Bộ khung vỏ nhựa chắc chắn và nhẹ nhàng. Xu thế hiện nay đó là smartphone màn hình rộng, với màn hình lớn bạn có thể dễ dàng chơi trò chơi, xem video, đọc sách báo.</p><p align="center"><em><img title="Mobell Nova F với màn hình rộng 5 inch" src="http://cdn.tgdd.vn/Products/Images/42/60286/mobell-nova-f_clip_image004.jpg" alt="Mobell Nova F với màn hình rộng 5 inch cho trải nghiệm tối ưu"></em><br><em>Mobell Nova F với màn hình rộng 5 inch cho trải nghiệm tối ưu</em></p><p style="text-align: justify;" align=""><strong><br>Nova F</strong> được trang bị màn hình LCD rộng 5.0 inch, độ phân giải FWVGA 480 x 854 pixel, hiển thị sắc nét 16 triệu màu, cảm ứng điện dung đa điểm.</p>&nbsp;<h3 align=""><br>Vi xử lý hai nhân</h3><p style="text-align: justify;" align="">Tuy là một smartphone giá rẻ nhưng Mobell Nova F lại được trang bị bộ vi xử lý hai nhân tốc độ 1.2GHz. Nhờ vậy máy luôn mượt mà và xử lý các tác vụ một cách nhanh chóng.</p><p align="center"><img title="Mobell Nova F sử dụng bộ VXL lõi kép" src="http://cdn.tgdd.vn/Products/Images/42/60286/mobell-nova-f_clip_image005.jpg" alt="Mobell Nova F sử dụng bộ VXL lõi kép"><br><em>Mobell Nova F sử dụng bộ VXL lõi kép</em></p>&nbsp;<h3 align=""><br>Máy ảnh 8.0MP</h3><p style="text-align: justify;" align=""><strong>Mobell Nova F</strong> được tích hợp máy ảnh cao, lên đến 8MP, nhờ vậy bạn sẽ luôn có những bức ảnh sắc nét khi đi du lịch hoặc luôn ghi lại được những khoảnh khắc vui tươi trong cuộc sống.</p><p align="center"><em><img title="Mobell Nova F với máy ảnh 8.0MP" src="http://cdn.tgdd.vn/Products/Images/42/60286/mobell-nova-f_clip_image006.jpg" alt="Mobell Nova F với máy ảnh 8.0MP, tự động lấy nét"></em><br><em>Mobell Nova F với máy ảnh 8.0MP, tự động lấy nét</em></p><p style="text-align: justify;" align=""><br>Ngoài ra, máy ảnh còn có chế độ tự động lấy nét autofocus, hỗ trợ đèn flash, tự động nhận diện khuôn mặt. Nhờ thế, máy có thể chụp trong bóng đêm và cho ra những hình ảnh đẹp. Ở tính năng camera quay phim, máy có thể cho ra định dạng video HD 720p, hoàn toàn sắc nét khi xem trên cả máy tính.</p>&nbsp;<h3 align=""><br>Hỗ trợ 2 SIM</h3><p style="text-align: justify;" align="">Thật tiện lợi khi trên một máy gắn cả 2 sim, nhờ vậy bạn có thể linh động, tiết kiệm chi phí gọi ngoại mạng. 2 SIM hai nhà mạng, tích hợp được nhiều số hơn và hữu ích hơn khi một sim dành cho công việc, một sim dành cho gia đình và bạn bè.</p>&nbsp;<h3 align=""><br>Hệ điều hành phiên bản mới Android 4.2</h3><p style="text-align: justify;" align="">Mặc dù là smartphone giá rẻ nhưng máy lại chạy trên hệ điều hành mà nhiều smartphone cao cấp cũng phải mơ ước. Phiên bản mà máy đang sử dụng là 4.2.2 Jelly Bean, một phiên bản mới. Nhờ vậy, bạn có thể tải miễn phí nhiều trò chơi, phần mềm, tiện ích trên cửa hàng trực tuyến.</p><p align="center"><em><img title="HĐH Android 4.2.2. Jelly Bean trên Mobell Nova F" src="http://cdn.tgdd.vn/Products/Images/42/60286/mobell-nova-f_clip_image008.jpg" alt="HĐH Android phiên bản mới 4.2.2. Jelly Bean trên Mobell Nova F"></em><br><em>HĐH Android phiên bản mới 4.2.2. Jelly Bean trên Mobell Nova F</em></p>&nbsp;<h3 align=""><br>Một số nhược điểm tồn tại của máy</h3><p style="text-align: justify;" align=""><strong>Mobell Nova F</strong> chỉ có bộ nhớ RAM 512MB, khá thấp. Bởi vậy, khi chạy đa nhiệm, máy sẽ đáp ứng chậm. Ngoài ra, ở các ứng dụng hoặc game nặng, máy có thể sẽ bị giật khi chạy. Vì vậy, lời khuyên là chỉ sử dụng các tính năng đơn giản, nhẹ nhàng như đọc sách báo, lướt web, mạng xã hội cùng các trò chơi nhẹ nhàng, đòi hỏi đồ họa vừa phải.</p><p align="center"><img title="Mobell Nova F chỉ 512MB" src="http://cdn.tgdd.vn/Products/Images/42/60286/mobell-nova-f_clip_image009.jpg" alt="Bộ nhớ trong của Mobell Nova F chỉ 512MB"><br><em>Bộ nhớ RAM của Mobell Nova F chỉ 512MB</em></p><p style="text-align: justify;" align=""><br>Ngoài ra, máy cũng có bộ nhớ trong thấp, chỉ 4GB vì vậy chắc chắn bạn sẽ phải mở rộng bộ nhớ qua khe cắm microSD để có thể lưu trữ được nhiều hơn phim ảnh, tài liệu, trò chơi...</p>&nbsp;<h3 align=""><br>Tóm lại</h3><p style="text-align: justify;" align=""><strong>Mobell Nova F</strong> là một smartphone giá rẻ với màn hình lớn cùng máy ảnh cao cấp. Thiết bị thích hợp cho những ai có số tiền vừa phải nhưng muốn có một smartphone màn hình lớn, kết nối 3G để lướt web, mạng xã hội, giải trí xem video.</p><p align="right"><strong>Hữu Tình</strong></p><table class="advantage"><tbody><tr><td><h3>Ưu điểm</h3><ul>
	<li>Thiết kế trẻ trung, màn hình rộng lên đến 5 inch.</li>
	<li>Vi xử lý lõi kép 1.2GHz hoạt động ổn định, mượt.</li>
	<li>Máy ảnh 8.0MP, lấy nét tự động.</li>
	<li>Hỗ trợ 2 SIM 2 sóng tiện ích.</li>
	<li>Hệ điều hành Android 4.2.2 Jelly Bean mới.</li>
</ul></td><td><h3>Nhược điểm</h3><ul>
	<li>RAM hơi yếu, chỉ 512MB.</li>
	<li>Bộ nhớ trong thấp, chỉ 4GB.</li>
</ul></td></tr></tbody></table>', 6, 99, 0, 5, 0, CAST(N'2014-03-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (34, N'Lenovo A850', N'/Content/Images/HangKhac/Lenovo A850.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/HangKhac/Hinh360-HangKhac/LG-G2-hinh360-1.jpg', N'" /> </a>', CAST(3790000 AS Decimal(18, 0)), CAST(3950000 AS Decimal(18, 0)), N'Màn hình:	qHD, 5.5", 540 x 960 pixels
CPU:	MTK 6582M, 4 nhân, 1.3 GHz
RAM	1 GB
SIM:	2 SIM 2 sóng
Camera:	5.0 MP, Quay phim HD 720p@30fps
Bộ nhớ trong:	4 GB
Thẻ nhớ ngoài đến:	32 GB
Dung lượng pin:	2250 mAh', N'<img class="lazy" src="http://cdn.tgdd.vn/Products/Images/42/60663/Kit/Lenovo-A850-mo-ta-chuc-nang.jpg">  <table style="width: 100%;" class="product-compare" border="0" cellpadding="0" cellspacing="0">
    <tbody>
        <tr class="r">
            <td rowspan="2" class="g" valign="top">
            <div class="gh">Thông tin chung</div>
            </td>
            <td id="prop_72" class="p f eph" onclick="ShowHelp(72, 2);">Hệ điều hành</td>
            <td id="c72_1" class="v f">Android 4.2 (Jelly Bean)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_75" class="ph eph" onclick="ShowHelp(75, 2);">Ngôn ngữ</div>
            </td>
            <td id="c75_1" class="v">Tiếng Việt, Tiếng Anh</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Màn hình</div>
            </td>
            <td class="p f">Loại màn hình</td>
            <td id="c6459_1" class="v f">IPS LCD</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Màu màn hình</div>
            </td>
            <td id="c6239_1" class="v">16 triệu màu</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_77" class="ph eph" onclick="ShowHelp(77, 2);">Chuẩn màn hình</div>
            </td>
            <td id="c77_1" class="v">qHD</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_78" class="ph eph" onclick="ShowHelp(78, 2);">Độ phân giải</div>
            </td>
            <td id="c78_1" class="v">540 x 960 pixels</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_79" class="ph eph" onclick="ShowHelp(79, 2);">Màn hình rộng</div>
            </td>
            <td id="c79_1" class="v">5.5"</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_80" class="ph eph" onclick="ShowHelp(80, 2);">Công nghệ cảm ứng</div>
            </td>
            <td id="c80_1" class="v">Cảm ứng điện dung đa điểm</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Chụp hình &amp; Quay phim</div>
            </td>
            <td id="prop_27" class="p f eph" onclick="ShowHelp(27, 2);">Camera sau</td>
            <td id="c27_1" class="v f">5.0 MP</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_29" class="ph eph" onclick="ShowHelp(29, 2);">Camera trước</div>
            </td>
            <td id="c29_1" class="v">VGA (0.3 Mpx)</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Đèn Flash</div>
            </td>
            <td id="c6460_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_28" class="ph eph" onclick="ShowHelp(28, 2);">Tính năng camera</div>
            </td>
            <td id="c28_1" class="v">Tự động lấy nét, chạm lấy nét</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_31" class="ph eph" onclick="ShowHelp(31, 2);">Quay phim</div>
            </td>
            <td id="c31_1" class="v">Quay phim HD 720p@30fps</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_30" class="ph eph" onclick="ShowHelp(30, 2);">Videocall</div>
            </td>
            <td id="c30_1" class="v">Không</td>
        </tr>
        <tr class="r">
            <td rowspan="5" class="g" valign="top">
            <div class="gh">CPU &amp; RAM</div>
            </td>
            <td id="prop_51" class="p f eph" onclick="ShowHelp(51, 2);">Tốc độ CPU</td>
            <td id="c51_1" class="v f">1.3 GHz</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Số nhân</div>
            </td>
            <td id="c6461_1" class="v">4 nhân</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6059" class="ph eph" onclick="ShowHelp(6059, 2);">Chipset</div>
            </td>
            <td id="c6059_1" class="v">MTK 6582M</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">RAM</div>
            </td>
            <td id="c50_1" class="v">1 GB</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6079" class="ph eph" onclick="ShowHelp(6079, 2);">Chip đồ họa (GPU)</div>
            </td>
            <td id="c6079_1" class="v">Mali-400MP</td>
        </tr>
        <tr class="r">
            <td rowspan="4" class="g" valign="top">
            <div class="gh">Bộ nhớ &amp; Lưu trữ</div>
            </td>
            <td id="prop_54" class="p f eph" onclick="ShowHelp(54, 2);">Danh bạ</td>
            <td id="c54_1" class="v f">Không giới hạn</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_49" class="ph eph" onclick="ShowHelp(49, 2);">Bộ nhớ trong (ROM)</div>
            </td>
            <td id="c49_1" class="v">4 GB</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_52" class="ph eph" onclick="ShowHelp(52, 2);">Thẻ nhớ ngoài</div>
            </td>
            <td id="c52_1" class="v">MicroSD (T-Flash)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_53" class="ph eph" onclick="ShowHelp(53, 2);">Hỗ trợ thẻ tối đa</div>
            </td>
            <td id="c53_1" class="v">32 GB</td>
        </tr>
        <tr class="r">
            <td rowspan="3" class="g" valign="top">
            <div class="gh">Thiết kế &amp; Trọng lượng</div>
            </td>
            <td id="prop_73" class="p f eph" onclick="ShowHelp(73, 2);">Kiểu dáng</td>
            <td id="c73_1" class="v f">Thanh + Cảm ứng</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_88" class="ph eph" onclick="ShowHelp(88, 2);">Kích thước</div>
            </td>
            <td id="c88_1" class="v">153.5 x 79.3 x 9.45 mm</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_100" class="ph eph" onclick="ShowHelp(100, 2);">Trọng lượng (g)</div>
            </td>
            <td id="c100_1" class="v">184</td>
        </tr>
        <tr class="r">
            <td rowspan="3" class="g" valign="top">
            <div class="gh">Thông tin pin</div>
            </td>
            <td class="p f">Loại pin</td>
            <td id="c83_1" class="v f">Pin chuẩn Li-Ion</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_84" class="ph eph" onclick="ShowHelp(84, 2);">Dung lượng pin</div>
            </td>
            <td id="c84_1" class="v">2250 mAh</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Pin có thể tháo rời</div>
            </td>
            <td id="c6462_1" class="v">Có</td>
        </tr>
        <tr class="r">
            <td rowspan="13" class="g" valign="top">
            <div class="gh">Kết nối &amp; Cổng giao tiếp</div>
            </td>
            <td id="prop_65" class="p f eph" onclick="ShowHelp(65, 2);">3G</td>
            <td id="c65_1" class="v f">HSDPA, 7.2 Mbps; HSUPA, 5.76 Mbps</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">4G</div>
            </td>
            <td id="c6463_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Loại Sim</div>
            </td>
            <td id="c6339_1" class="v">SIM bình thường</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_60" class="ph eph" onclick="ShowHelp(60, 2);">Khe gắn Sim</div>
            </td>
            <td id="c60_1" class="v">2 SIM 2 sóng</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_66" class="ph eph" onclick="ShowHelp(66, 2);">Wifi</div>
            </td>
            <td id="c66_1" class="v">Wi-Fi 802.11 b/g/n, Wi-Fi hotspot</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_68" class="ph eph" onclick="ShowHelp(68, 2);">GPS</div>
            </td>
            <td id="c68_1" class="v">A-GPS</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_69" class="ph eph" onclick="ShowHelp(69, 2);">Bluetooth</div>
            </td>
            <td id="c69_1" class="v">Có, V3.0 với A2DP</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_61" class="ph eph" onclick="ShowHelp(61, 2);">GPRS/EDGE</div>
            </td>
            <td id="c61_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_48" class="ph eph" onclick="ShowHelp(48, 2);">Jack tai nghe</div>
            </td>
            <td id="c48_1" class="v">3.5 mm</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">NFC</div>
            </td>
            <td id="c6464_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_71" class="ph eph" onclick="ShowHelp(71, 2);">Kết nối USB</div>
            </td>
            <td id="c71_1" class="v">Micro USB</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Kết nối khác</div>
            </td>
            <td id="c5199_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Cổng sạc</div>
            </td>
            <td id="c85_1" class="v">Micro USB</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Giải trí &amp; Ứng dụng</div>
            </td>
            <td id="prop_32" class="p f eph" onclick="ShowHelp(32, 2);">Xem phim</td>
            <td id="c32_1" class="v f">MP4, H.263, H.264(MPEG4-AVC)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_33" class="ph eph" onclick="ShowHelp(33, 2);">Nghe nhạc</div>
            </td>
            <td id="c33_1" class="v">MP3, WAV, eAAC+</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_36" class="ph eph" onclick="ShowHelp(36, 2);">Ghi âm</div>
            </td>
            <td id="c36_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6039" class="ph eph" onclick="ShowHelp(6039, 2);">Giới hạn cuộc gọi</div>
            </td>
            <td id="c6039_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_34" class="ph eph" onclick="ShowHelp(34, 2);">FM radio</div>
            </td>
            <td id="c34_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Chức năng khác</div>
            </td>
            <td id="c43_1" class="v">Mạng xã hội ảo<br>Google Search, Maps, Gmail, YouTube, Calendar, Google Talk</td>
        </tr>
    </tbody>
</table>', N'<h2 align="center">Lenovo A850 – Phablet với thiết kế chắc chắn, màn hình rộng cùng hiệu suất xử lý tốt</h2><p style="text-align: justify;" align=""><br>Thiết kế của máy khá cân đối và giống với những <a href="http://www.thegioididong.com/dtdd?f=smartphone" target="_blank">smartphone</a> trước đây của <strong>Lenovo</strong>. Các cạnh được bo tròn nhẹ nhàng, viền máy được mạ crom sáng bóng, toàn bộ máy được phủ một lớp sơn bóng cho cảm giác khá sang trọng. <strong>Lenovo A850</strong> có 2 màu trắng và xám đen để bạn lựa chọn. Màu đen nam tính và máu trắng tinh khôi cho các bạn nữ.</p><p align="center"><img title="Thiết kế chắc chắn, bóng bẩy của Lenovo A850" src="http://cdn.tgdd.vn/Products/Images/42/60663/lenovo-a850_clip_image001.jpg" alt="Thiết kế chắc chắn, bóng bẩy của Lenovo A850"> <br><em>Thiết kế chắc chắn, bóng bẩy</em></p><p style="text-align: justify;" align=""><br>Mặt sau của máy là camera 5MP cùng đèn flash được đặt chính giữa. Camera khá to và lồi ra ngoài trông rất “hầm hố”. Phía dưới là logo <strong>Lenovo</strong>, và cuối mặt sau là loa ngoài hơi lệch về phía bên phải một chút.</p><p align="center"><em><img title="Viền xung quanh A850 mạ crom sáng bóng" src="http://cdn.tgdd.vn/Products/Images/42/60663/lenovo-a850_clip_image003.jpg" alt="Viền xung quanh A850 mạ crom sáng bóng"></em><br><em>Viền xung quanh mạ crom sáng bóng</em></p><p style="text-align: justify;" align=""><br>Mặt trước của máy là những nút bấm quen thuộc, phía dưới là 3 nút cảm ứng bao gồm Menu, Home và Quay lại. Phía cạnh trên là loa thoại cùng các cảm biến. Về tổng thể, máy có thiết kế hơi cong vòm ở các cạnh, giúp bạn dễ dàng cầm nắm. Thiết bị có kích thước 153.5 x 79.3 x 9.45 mm, khá mỏng tuy nhiên trọng lượng lại lên tới 184g, vì vậy lời khuyên là bạn nên dùng 2 tay khi sử dụng để tránh bị rơi.</p>&nbsp;<h3 align=""><br>Cấu hình tốt</h3><p style="text-align: justify;" align="">Mặc dù là một phablet giá rẻ tuy nhiên <strong>Lenovo A850</strong> vẫn được trang bị cấu hình tốt, thiết bị chạy trên bộ vi xử lý lõi tứ tốc độ 1.3GHz kết hợp cùng bộ nhớ RAM 1GB giúp máy có thể thực hiện tốt mọi tác vụ như lướt web, up ảnh lên mạng xã hội facebook, xem phim trực tuyến cũng như các trò chơi, kể cả những trò hơi đòi hỏi cần khả năng đồ họa cao.</p><p align="center"><img title="Lenovo A850 có cấu hình tốt so với mức giá" src="http://cdn.tgdd.vn/Products/Images/42/60663/lenovo-a850_clip_image005.jpg" alt="Lenovo A850 có cấu hình tốt so với mức giá"><br><em>Lenovo A850 có cấu hình tốt so với mức giá</em></p><p style="text-align: justify;" align=""><br>Máy cũng có chế độ khởi động nhanh, giúp giảm thiểu thời gian chờ đợi mỗi lần khởi động, đưa người dùng đến ngay với giao diện sử dụng tức thời. Tuy vậy, bộ nhớ trong của máy chỉ 4GB nên người dùng sẽ phải bổ sung bộ nhớ bằng khe cắm microSD, đặc biệt là với những ai thích xem phim trên điện thoại màn hình rộng.</p>&nbsp;<h3 align=""><br>Màn hình rộng 5.5 inch</h3><p style="text-align: justify;" align="">Ưu điểm lớn nhất của <strong>Lenovo A850</strong> đó chính là màn hình. Thiết bị sở hữu màn hình 5.5 inch, ngang ngửa với dòng <strong>Galaxy Note 2</strong> đình đám hiện nay. Màn hình rộng giúp người dùng thoải mái xem phim, chơi game giải trí hoặc dễ dàng trong các tác vụ như đánh phím trả lời mail, xem ảnh trên facebook…</p><p align="center"><em><img title="Lenovo A850 có màn hình rộng lên đến 5.5 inch" src="http://cdn.tgdd.vn/Products/Images/42/60663/lenovo-a850_clip_image007.jpg" alt="Lenovo A850 có màn hình rộng lên đến 5.5 inch"></em><br><em>Màn hình rộng lên đến 5.5 inch</em></p><p style="text-align: justify;" align=""><br>Màn hình 5.5 inch của máy sử dụng công nghệ&nbsp;IPS&nbsp;cho màu sắc trung thực, góc nhìn rộng đến 178 độ. Độ sáng của màn hình thuộc dạng khá, hiển thị tương đối tốt dưới ánh nắng mặt trời. Tuy nhiên màn hình chỉ có độ phân giải qHD&nbsp;960 x 540 pixels, đây là một điều dễ hiểu với những smartphone giá rẻ.</p>&nbsp;<h3 align=""><br>Hệ điều hành Android 4.2 Jelly Bean</h3><p style="text-align: justify;" align=""><strong>Lenovo A850</strong> được tích hợp sẵn hệ điều hành Android 4.2 Jelly Bean khá mới mẻ với giao diện người dùng thân thiện hơn, nhiều tính năng mới cũng như nhiều cải tiến có lợi cho người dùng. Android 4.2 được biết đến là hệ điều hành ổn định, tiết kiệm pin hơn cũng như mượt mà hơn trong các tác vụ xử lý.</p><p align="center"><em><img title="Hệ điều hành Android 4.2 Jelly Bean trên Lenovo A850" src="http://cdn.tgdd.vn/Products/Images/42/60663/lenovo-a850_clip_image009.jpg" alt="Hệ điều hành Android 4.2 Jelly Bean trên Lenovo A850"></em><br><em>Hệ điều hành Android 4.2 Jelly Bean</em></p>&nbsp;<h3 align=""><br>Kết nối mọi lúc mọi nơi</h3><p style="text-align: justify;" align="">Thiết bị được tích hợp những kết nối không dây như Wifi chuẩn 802.11 b/g/n quen thuộc cho kết nối mạng bằng sóng Wifi khi ở nhà hoặc ở cơ quan, quán cafe, kết nối 3G cho tốc độ truyền tải nhanh chóng và mọi lúc mọi nơi. Nhờ vậy, ở bất cứ nơi đâu bạn cũng có thể lướt web, cập nhật trạng thái cũng như xem phim…</p><p align="center"><em><img title="Lenovo A850 hỗ trợ 2 SIM 2 sóng" src="http://cdn.tgdd.vn/Products/Images/42/60663/lenovo-a850_clip_image011.jpg" alt="Lenovo A850 hỗ trợ 2 SIM 2 sóng"></em><br><em>Lenovo A850 hỗ trợ 2 SIM 2 sóng</em></p><p style="text-align: justify;" align=""><br>Ngoài ra, <strong>Lenovo A850</strong> còn hỗ trợ kết nối qua cổng microUSB để truyền tải dữ liệu qua máy tính, kết nối Bluetooth khi trao đổi dữ liệu với thiết bị di động khác, tính năng Wifi hotspot để chia sẻ mạng với những điện thoại hoặc laptop khác...</p><p style="text-align: justify;" align=""><br>Thiết bị còn hỗ trợ cả hai máy ảnh trước sau, mặc dù máy ảnh sau chỉ 5MP nhưng vẫn hỗ trợ đèn flash và tự động lấy nét. Nếu được tích hợp máy ảnh 8MP thì thiết bị có vẻ sẽ hoàn chỉnh hơn.</p><p align="center"><img title="Máy ảnh sau của Lenovo A850 chỉ có 5MP" src="http://cdn.tgdd.vn/Products/Images/42/60663/lenovo-a850_clip_image013.jpg" alt="Máy ảnh sau của Lenovo A850 chỉ có 5MP"> <br><em>Máy ảnh sau của Lenovo A850 chỉ có 5MP</em></p>&nbsp;<h3 align=""><br>Tóm lại</h3><p style="text-align: justify;" align=""><strong>Lenovo A850</strong> là một thiết bị có màn hình rộng, cấu hình tốt, đầy đủ kết nối và giá cả phải chăng. Thiết bị hướng tới những người dùng bình dân, những bạn trẻ thích một smartphone màn hình lớn, đầy đủ tính năng nhưng có túi tiền vừa phải.</p><p align="right"><strong>Hữu Tình</strong></p><table class="advantage"><tbody><tr><td><h3>Ưu điểm</h3><ul>
	<li>Màn hình rộng lên đến 5.5 inch.</li>
	<li>Hiệu suất cao với vi xử lý lõi tứ.</li>
	<li>Thiết kế chắc chắn.</li>
	<li>Hỗ trợ 2 SIM.</li>
	<li>Chạy Android 4.2 Jelly Bean mới mẻ.</li>
	<li>Kết nối mọi lúc mọi nơi.</li>
</ul></td><td><h3>Nhược điểm</h3><ul>
	<li>Máy ảnh sau chỉ 5MP.</li>
</ul></td></tr></tbody></table>', 6, 99, 1, 0, 0, CAST(N'2014-03-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (35, N'Oppo Neo R831', N'/Content/Images/HangKhac/Oppo Neo R831.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/HangKhac/Hinh360-HangKhac/LG-G2-hinh360-1.jpg', N'" /> </a>', CAST(3690000 AS Decimal(18, 0)), CAST(3800000 AS Decimal(18, 0)), N'Màn hình:	FWVGA, 4.5", 480 x 854 Pixels
CPU:	Cortex-A7, 2 nhân, 1.3 GHz
RAM	512 MB
SIM:	2 SIM 2 sóng
Camera:	5.0 MP, Quay phim HD 720p@30fps
Bộ nhớ trong:	4 GB
Thẻ nhớ ngoài đến:	32 GB
Dung lượng pin:	1900 mAh', N'<img class="lazy" src="http://cdn.tgdd.vn/Products/Images/42/61142/Kit/OPPO-Neo-mo-ta-chuc-nang-new.jpg">   <table style="width: 100%;" class="product-compare" border="0" cellpadding="0" cellspacing="0">
    <tbody>
        <tr class="r">
            <td rowspan="2" class="g" valign="top">
            <div class="gh">Thông tin chung</div>
            </td>
            <td id="prop_72" class="p f eph" onclick="ShowHelp(72, 2);">Hệ điều hành</td>
            <td id="c72_1" class="v f">Android 4.2.2 (Jelly Bean)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_75" class="ph eph" onclick="ShowHelp(75, 2);">Ngôn ngữ</div>
            </td>
            <td id="c75_1" class="v">Tiếng Việt, Tiếng Anh</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Màn hình</div>
            </td>
            <td class="p f">Loại màn hình</td>
            <td id="c6459_1" class="v f">IPS LCD</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Màu màn hình</div>
            </td>
            <td id="c6239_1" class="v">16 triệu màu</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_77" class="ph eph" onclick="ShowHelp(77, 2);">Chuẩn màn hình</div>
            </td>
            <td id="c77_1" class="v">FWVGA</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_78" class="ph eph" onclick="ShowHelp(78, 2);">Độ phân giải</div>
            </td>
            <td id="c78_1" class="v">480 x 854 Pixels</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_79" class="ph eph" onclick="ShowHelp(79, 2);">Màn hình rộng</div>
            </td>
            <td id="c79_1" class="v">4.5"</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_80" class="ph eph" onclick="ShowHelp(80, 2);">Công nghệ cảm ứng</div>
            </td>
            <td id="c80_1" class="v">Cảm ứng điện dung đa điểm</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Chụp hình &amp; Quay phim</div>
            </td>
            <td id="prop_27" class="p f eph" onclick="ShowHelp(27, 2);">Camera sau</td>
            <td id="c27_1" class="v f">5.0 MP</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_29" class="ph eph" onclick="ShowHelp(29, 2);">Camera trước</div>
            </td>
            <td id="c29_1" class="v">2.0 MP</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Đèn Flash</div>
            </td>
            <td id="c6460_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_28" class="ph eph" onclick="ShowHelp(28, 2);">Tính năng camera</div>
            </td>
            <td id="c28_1" class="v">Panorama, HDR</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_31" class="ph eph" onclick="ShowHelp(31, 2);">Quay phim</div>
            </td>
            <td id="c31_1" class="v">Quay phim HD 720p@30fps</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_30" class="ph eph" onclick="ShowHelp(30, 2);">Videocall</div>
            </td>
            <td id="c30_1" class="v">Hỗ trợ VideoCall qua Skype</td>
        </tr>
        <tr class="r">
            <td rowspan="5" class="g" valign="top">
            <div class="gh">CPU &amp; RAM</div>
            </td>
            <td id="prop_51" class="p f eph" onclick="ShowHelp(51, 2);">Tốc độ CPU</td>
            <td id="c51_1" class="v f">1.3 GHz</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Số nhân</div>
            </td>
            <td id="c6461_1" class="v">2 nhân</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6059" class="ph eph" onclick="ShowHelp(6059, 2);">Chipset</div>
            </td>
            <td id="c6059_1" class="v">Cortex-A7</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">RAM</div>
            </td>
            <td id="c50_1" class="v">512 MB</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6079" class="ph eph" onclick="ShowHelp(6079, 2);">Chip đồ họa (GPU)</div>
            </td>
            <td id="c6079_1" class="v">Mali-400MP</td>
        </tr>
        <tr class="r">
            <td rowspan="4" class="g" valign="top">
            <div class="gh">Bộ nhớ &amp; Lưu trữ</div>
            </td>
            <td id="prop_54" class="p f eph" onclick="ShowHelp(54, 2);">Danh bạ</td>
            <td id="c54_1" class="v f">Không giới hạn</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_49" class="ph eph" onclick="ShowHelp(49, 2);">Bộ nhớ trong (ROM)</div>
            </td>
            <td id="c49_1" class="v">4 GB</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_52" class="ph eph" onclick="ShowHelp(52, 2);">Thẻ nhớ ngoài</div>
            </td>
            <td id="c52_1" class="v">MicroSD (T-Flash)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_53" class="ph eph" onclick="ShowHelp(53, 2);">Hỗ trợ thẻ tối đa</div>
            </td>
            <td id="c53_1" class="v">32 GB</td>
        </tr>
        <tr class="r">
            <td rowspan="3" class="g" valign="top">
            <div class="gh">Thiết kế &amp; Trọng lượng</div>
            </td>
            <td id="prop_73" class="p f eph" onclick="ShowHelp(73, 2);">Kiểu dáng</td>
            <td id="c73_1" class="v f">Thanh + Cảm ứng</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_88" class="ph eph" onclick="ShowHelp(88, 2);">Kích thước</div>
            </td>
            <td id="c88_1" class="v">132 x 65.8 x 9.2 mm</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_100" class="ph eph" onclick="ShowHelp(100, 2);">Trọng lượng (g)</div>
            </td>
            <td id="c100_1" class="v">130</td>
        </tr>
        <tr class="r">
            <td rowspan="3" class="g" valign="top">
            <div class="gh">Thông tin pin</div>
            </td>
            <td class="p f">Loại pin</td>
            <td id="c83_1" class="v f">Pin chuẩn Li-Ion</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_84" class="ph eph" onclick="ShowHelp(84, 2);">Dung lượng pin</div>
            </td>
            <td id="c84_1" class="v">1900 mAh</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Pin có thể tháo rời</div>
            </td>
            <td id="c6462_1" class="v">Có</td>
        </tr>
        <tr class="r">
            <td rowspan="13" class="g" valign="top">
            <div class="gh">Kết nối &amp; Cổng giao tiếp</div>
            </td>
            <td id="prop_65" class="p f eph" onclick="ShowHelp(65, 2);">3G</td>
            <td id="c65_1" class="v f">HSDPA, 7.2 Mbps; HSUPA, 5.76 Mbps</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">4G</div>
            </td>
            <td id="c6463_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Loại Sim</div>
            </td>
            <td id="c6339_1" class="v">1 SIM thường &amp; 1 Micro SIM</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_60" class="ph eph" onclick="ShowHelp(60, 2);">Khe gắn Sim</div>
            </td>
            <td id="c60_1" class="v">2 SIM 2 sóng</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_66" class="ph eph" onclick="ShowHelp(66, 2);">Wifi</div>
            </td>
            <td id="c66_1" class="v">Wi-Fi 802.11 b/g/n, Wi-Fi Direct, Wi-Fi hotspot</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_68" class="ph eph" onclick="ShowHelp(68, 2);">GPS</div>
            </td>
            <td id="c68_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_69" class="ph eph" onclick="ShowHelp(69, 2);">Bluetooth</div>
            </td>
            <td id="c69_1" class="v">Có, V3.0 với A2DP</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_61" class="ph eph" onclick="ShowHelp(61, 2);">GPRS/EDGE</div>
            </td>
            <td id="c61_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_48" class="ph eph" onclick="ShowHelp(48, 2);">Jack tai nghe</div>
            </td>
            <td id="c48_1" class="v">3.5 mm</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">NFC</div>
            </td>
            <td id="c6464_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_71" class="ph eph" onclick="ShowHelp(71, 2);">Kết nối USB</div>
            </td>
            <td id="c71_1" class="v">Micro USB</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Kết nối khác</div>
            </td>
            <td id="c5199_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Cổng sạc</div>
            </td>
            <td id="c85_1" class="v">Micro USB</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Giải trí &amp; Ứng dụng</div>
            </td>
            <td id="prop_32" class="p f eph" onclick="ShowHelp(32, 2);">Xem phim</td>
            <td id="c32_1" class="v f">3GP, MP4, AVI, WMV, H.264(MPEG4-AVC)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_33" class="ph eph" onclick="ShowHelp(33, 2);">Nghe nhạc</div>
            </td>
            <td id="c33_1" class="v">MP3, WAV, WMA, AAC, eAAC+, AMR, FLAC</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_36" class="ph eph" onclick="ShowHelp(36, 2);">Ghi âm</div>
            </td>
            <td id="c36_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6039" class="ph eph" onclick="ShowHelp(6039, 2);">Giới hạn cuộc gọi</div>
            </td>
            <td id="c6039_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_34" class="ph eph" onclick="ShowHelp(34, 2);">FM radio</div>
            </td>
            <td id="c34_1" class="v">FM radio với RDS</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Chức năng khác</div>
            </td>
            <td id="c43_1" class="v">Mạng xã hội ảo<br>Google Play, Google Search, Google Now, Maps, Gmail, YouTube, Lịch</td>
        </tr>
    </tbody>
</table>', N'<h2 align="center">Oppo Neo R831 – Smartphone giá rẻ, thiết kế đẹp cùng màn hình rộng</h2><p style="text-align: justify;" align=""><strong><br>Oppo Neo R831</strong> có thiết kế khá đẹp với hai màu đen và trắng, kiểu dáng vuông vắn với nắp lưng làm bằng chất liệu Polycarbonate có thể tháo rời. Thoạt nhìn bạn sẽ có cảm giác giống với dòng máy Xperia Arc của Sony.</p><p align="center"><img title="Thiết kế đẹp mắt" src="http://cdn.tgdd.vn/Products/Images/42/61142/oppo-neo-r831_clip_image002.jpg" alt="Oppo Neo thiết kế"> <br><em>Thiết kế đẹp mắt</em></p><p style="text-align: justify;" align=""><br>Cạnh phía trên và phía dưới tạo điểm nhấn với các viền sần có màu khác với màu tổng thể. Máy có trọng lượng khá nhẹ, chỉ 130 gram với kích thước 132 x 65.8 x 9.2mm. Thiết bị có dạng hơi cong vòm, khá giống với kiểu cong vòm của siêu phẩm HTC One, giúp bạn dễ dàng cầm nắm trên một bàn tay.</p><p align="center"><img title="Mặt sau hơi cong vòm, dễ dàng cầm nắm bằng 1 tay" src="http://cdn.tgdd.vn/Products/Images/42/61142/oppo-neo-r831_clip_image004.jpg" alt="Oppo Neo R831 mặt sau"> <br><em>Mặt sau hơi cong vòm, dễ dàng cầm nắm bằng 1 tay</em></p><p style="text-align: justify;" align=""><br>Bên dưới màn hình của <strong>Oppo Neo</strong> có ba phím cảm ứng đặc trưng của hệ điều hành Android, phía trên là camera phụ với độ phân giải 2 MP.</p><p align="center"></p>&nbsp;<h3 align=""><br>Màn hình rộng, cảm ứng siêu nhạy</h3><p style="text-align: justify;" align="">Màn hình của máy sử dụng công nghệ LCD, kích thước 4.5 inch với độ phân giải 480 x 854 pixel cho chất lượng hiển thị khá tốt.</p><p align="center"><em><img title="Màn hình IPS LCD rộng 4.5 inch cảm ứng siêu nhạy" src="http://cdn.tgdd.vn/Products/Images/42/61142/oppo-neo-r831_clip_image008.jpg" alt="Oppo Neo R831 màn hình IPS LCD"></em><br><em>Màn hình IPS LCD rộng 4.5 inch cảm ứng siêu nhạy</em></p><p style="text-align: justify;" align=""><br>Điểm thú vị là màn hình cảm ứng điện dung hỗ trợ cả việc sử dụng khi đeo găng tay, giống dòng <a href="http://www.thegioididong.com/nokia-lumia" target="_blank">Lumia</a> của <strong>Nokia</strong>. Màn hình rộng 4.5 inch cho phép người dùng trải nghiệm thoải mái hơn, đặc biệt là trong việc giải trí như xem phim, chơi game, đọc sách báo, cập nhật ảnh mạng xã hội.</p>&nbsp;<h3 align=""><br>Hệ điều hành ColorOS - Android 4.2 Jelly Bean</h3><p style="text-align: justify;" align="">Mặc dù là một smartphone giá rẻ nhưng <strong>Oppo</strong> vẫn trang bị cho <strong>Neo R831</strong> hệ điều hành phiên bản mới mẻ, Android 4.2 Jelly Bean. Nhờ vậy, máy sẽ có nhiều tính năng hữu ích hơn, các phần mềm cài đặt cũng có khả năng tương thích cao hơn.</p><p align="center"><em><img title="Hệ điều hành mới mẻ mang tên ColorOS trên nền Android 4.2" src="http://cdn.tgdd.vn/Products/Images/42/61142/oppo-neo-r831_clip_image010.jpg" alt="Oppo Neo ColorOS trên nền Android 4.2"></em><br><em>Hệ điều hành mới mẻ mang tên ColorOS trên nền Android 4.2</em></p><p style="text-align: justify;" align=""><br>Dựa trên nền tảng Android 4.2, <strong>ColorOS</strong> mang trong mình những ưu thế của sự mượt mà, ổn định, nhưng vẫn có sự khác biệt hoàn toàn về giao diện, so với các phiên bản 4.2 khác.</p>&nbsp;<h3 align=""><br>Hỗ trợ 2 SIM</h3><p style="text-align: justify;" align="">Điện thoại 2 SIM ngày càng trở nên phổ biến bởi sự tiện lợi và tiết kiệm của nó. Bạn có thể quản lý cuộc gọi, danh bạ dễ dàng hơn, có thể lựa chọn cuộc gọi nội mạng cho từng SIM nhằm tiết kiệm chi phí.</p><p align="center"><em><img title="Tiết kiệm chi phí hơn với 2 SIM" src="http://cdn.tgdd.vn/Products/Images/42/61142/oppo-neo-r831_clip_image012.jpg" alt="Oppo Neo R831 2 SIM"></em><br><em>Tiết kiệm chi phí hơn với 2 SIM</em></p>&nbsp;<h3 align=""><br>Cấu hình</h3><p style="text-align: justify;" align=""><strong>Oppo Neo R831</strong> có cấu hình khá ổn trong tầm giá với chip lõi kép tốc độ 1.3 GHz, RAM 512 MB đủ dùng để lướt web nhiều tab, chơi game không đòi hỏi yêu cầu đồ họa cao,...</p><p align="center"><em><img title="Cấu hình ổn so với mức giá" src="http://cdn.tgdd.vn/Products/Images/42/61142/oppo-neo-r831_clip_image014.jpg" alt="Oppo Neo hiệu năng"></em><br><em>Cấu hình ổn so với mức giá</em></p><p style="text-align: justify;" align=""><br>Ngoài ra, máy cũng được tích hợp camera chính có độ phân giải 5MPl, đi kèm camera phụ độ phân giải 2MP với một số chế độ chụp hình mở rộng. Tuy nhiên, camera lại không được gắn đèn flash nên bạn sẽ khó khăn khi chụp ảnh trong bóng tối.</p>&nbsp;<h3 align=""><br>Tóm lại</h3><p style="text-align: justify;" align=""><strong>Oppo Neo</strong> là mẫu smartphone phổ thông hướng đến người dùng trẻ như học sinh, sinh viên. Máy có cấu hình ổn, tích hợp đầy đủ máy ảnh, và đặc biệt là có màn hình rộng và cảm ứng siêu nhạy.</p><p align="right"><strong>Hữu Tình</strong></p><table class="advantage"><tbody><tr><td><h3>Ưu điểm</h3><ul>
	<li>Thiết kế đẹp, thao tác bằng 1 tay dễ dàng.</li>
	<li>Màn hình rộng 4.5'' , cảm ứng siêu nhạy.</li>
	<li>Hỗ trợ 2 SIM.</li>
	<li>HĐH ColorOS dựa trên nền tảng Android 4.2.</li>
	<li>Vi xử lý lõi kép 1.3GHz cho hiệu năng nhanh chóng.</li>
</ul></td><td><h3>Nhược điểm</h3><ul>
	<li>Máy ảnh sau không có Flash.</li>
</ul></td></tr></tbody></table>', 6, 99, 0, 0, 0, CAST(N'2014-03-21 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlHinh], [Code1], [UrlHinh360], [Code2], [GiaHienTai], [GiaCu], [MoTa], [MoTaCT], [DanhGiaCT], [MaNSX], [SoLuongTon], [SLDaBan], [KhuyenMai], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (36, N'Q-Smart S19', N'/Content/Images/HangKhac/Q-Smart S19.jpg', N'<a class="tgdd360"  data-tgdd360-options="autospin: infinite; autospin-direction: anticlockwise; autospin-start: load,click;columns:36"><img src="', N'/Content/Images/HangKhac/Hinh360-HangKhac/LG-G2-hinh360-1.jpg', N'" /> </a>', CAST(1590000 AS Decimal(18, 0)), CAST(1650000 AS Decimal(18, 0)), N'Màn hình:	WVGA, 4.0", 480 x 800 pixels
CPU:	MTK 6572, 2 nhân, 1.2 GHz
RAM	512 MB
SIM:	2 SIM 2 sóng
Camera:	5.0 MP, Quay phim WVGA@30fps
Bộ nhớ trong:	4 GB
Thẻ nhớ ngoài đến:	32 GB
Dung lượng pin:	1400 mAh', N'<img class="lazy" src="http://cdn.tgdd.vn/Products/Images/42/61229/Kit/Q-Smart-S19-mo-ta-chuc-nang.jpg"><table style="width: 100%;" class="product-compare" border="0" cellpadding="0" cellspacing="0">
    <tbody>
        <tr class="r">
            <td rowspan="2" class="g" valign="top">
            <div class="gh">Thông tin chung</div>
            </td>
            <td id="prop_72" class="p f eph" onclick="ShowHelp(72, 2);">Hệ điều hành</td>
            <td id="c72_1" class="v f">Android 4.2 (Jelly Bean)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_75" class="ph eph" onclick="ShowHelp(75, 2);">Ngôn ngữ</div>
            </td>
            <td id="c75_1" class="v">Tiếng Việt, Tiếng Anh</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Màn hình</div>
            </td>
            <td class="p f">Loại màn hình</td>
            <td id="c6459_1" class="v f">IPS LCD</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Màu màn hình</div>
            </td>
            <td id="c6239_1" class="v">16 triệu màu</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_77" class="ph eph" onclick="ShowHelp(77, 2);">Chuẩn màn hình</div>
            </td>
            <td id="c77_1" class="v">WVGA</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_78" class="ph eph" onclick="ShowHelp(78, 2);">Độ phân giải</div>
            </td>
            <td id="c78_1" class="v">480 x 800 pixels</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_79" class="ph eph" onclick="ShowHelp(79, 2);">Màn hình rộng</div>
            </td>
            <td id="c79_1" class="v">4.0"</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_80" class="ph eph" onclick="ShowHelp(80, 2);">Công nghệ cảm ứng</div>
            </td>
            <td id="c80_1" class="v">Cảm ứng điện dung đa điểm</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Chụp hình &amp; Quay phim</div>
            </td>
            <td id="prop_27" class="p f eph" onclick="ShowHelp(27, 2);">Camera sau</td>
            <td id="c27_1" class="v f">5.0 MP</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_29" class="ph eph" onclick="ShowHelp(29, 2);">Camera trước</div>
            </td>
            <td id="c29_1" class="v">VGA (0.3 Mpx)</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Đèn Flash</div>
            </td>
            <td id="c6460_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_28" class="ph eph" onclick="ShowHelp(28, 2);">Tính năng camera</div>
            </td>
            <td id="c28_1" class="v">Nhận diện nụ cười</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_31" class="ph eph" onclick="ShowHelp(31, 2);">Quay phim</div>
            </td>
            <td id="c31_1" class="v">Quay phim WVGA@30fps</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_30" class="ph eph" onclick="ShowHelp(30, 2);">Videocall</div>
            </td>
            <td id="c30_1" class="v">Không</td>
        </tr>
        <tr class="r">
            <td rowspan="5" class="g" valign="top">
            <div class="gh">CPU &amp; RAM</div>
            </td>
            <td id="prop_51" class="p f eph" onclick="ShowHelp(51, 2);">Tốc độ CPU</td>
            <td id="c51_1" class="v f">1.2 GHz</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Số nhân</div>
            </td>
            <td id="c6461_1" class="v">2 nhân</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6059" class="ph eph" onclick="ShowHelp(6059, 2);">Chipset</div>
            </td>
            <td id="c6059_1" class="v">MTK 6572</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">RAM</div>
            </td>
            <td id="c50_1" class="v">512 MB</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6079" class="ph eph" onclick="ShowHelp(6079, 2);">Chip đồ họa (GPU)</div>
            </td>
            <td id="c6079_1" class="v">Mali-400MP</td>
        </tr>
        <tr class="r">
            <td rowspan="4" class="g" valign="top">
            <div class="gh">Bộ nhớ &amp; Lưu trữ</div>
            </td>
            <td id="prop_54" class="p f eph" onclick="ShowHelp(54, 2);">Danh bạ</td>
            <td id="c54_1" class="v f">Không giới hạn</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_49" class="ph eph" onclick="ShowHelp(49, 2);">Bộ nhớ trong (ROM)</div>
            </td>
            <td id="c49_1" class="v">4 GB</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_52" class="ph eph" onclick="ShowHelp(52, 2);">Thẻ nhớ ngoài</div>
            </td>
            <td id="c52_1" class="v">MicroSD (T-Flash)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_53" class="ph eph" onclick="ShowHelp(53, 2);">Hỗ trợ thẻ tối đa</div>
            </td>
            <td id="c53_1" class="v">32 GB</td>
        </tr>
        <tr class="r">
            <td rowspan="3" class="g" valign="top">
            <div class="gh">Thiết kế &amp; Trọng lượng</div>
            </td>
            <td id="prop_73" class="p f eph" onclick="ShowHelp(73, 2);">Kiểu dáng</td>
            <td id="c73_1" class="v f">Thanh + Cảm ứng</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_88" class="ph eph" onclick="ShowHelp(88, 2);">Kích thước</div>
            </td>
            <td id="c88_1" class="v">128.2 x 63 x 9.8mm</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_100" class="ph eph" onclick="ShowHelp(100, 2);">Trọng lượng (g)</div>
            </td>
            <td id="c100_1" class="v">125</td>
        </tr>
        <tr class="r">
            <td rowspan="3" class="g" valign="top">
            <div class="gh">Thông tin pin</div>
            </td>
            <td class="p f">Loại pin</td>
            <td id="c83_1" class="v f">Pin chuẩn Li-Ion</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_84" class="ph eph" onclick="ShowHelp(84, 2);">Dung lượng pin</div>
            </td>
            <td id="c84_1" class="v">1400 mAh</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Pin có thể tháo rời</div>
            </td>
            <td id="c6462_1" class="v">Có</td>
        </tr>
        <tr class="r">
            <td rowspan="13" class="g" valign="top">
            <div class="gh">Kết nối &amp; Cổng giao tiếp</div>
            </td>
            <td id="prop_65" class="p f eph" onclick="ShowHelp(65, 2);">3G</td>
            <td id="c65_1" class="v f">HSDPA, 7.2 Mbps; HSUPA, 5.76 Mbps</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">4G</div>
            </td>
            <td id="c6463_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Loại Sim</div>
            </td>
            <td id="c6339_1" class="v">SIM bình thường</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_60" class="ph eph" onclick="ShowHelp(60, 2);">Khe gắn Sim</div>
            </td>
            <td id="c60_1" class="v">2 SIM 2 sóng</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_66" class="ph eph" onclick="ShowHelp(66, 2);">Wifi</div>
            </td>
            <td id="c66_1" class="v">Wi-Fi 802.11 b/g/n, Wi-Fi hotspot</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_68" class="ph eph" onclick="ShowHelp(68, 2);">GPS</div>
            </td>
            <td id="c68_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_69" class="ph eph" onclick="ShowHelp(69, 2);">Bluetooth</div>
            </td>
            <td id="c69_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_61" class="ph eph" onclick="ShowHelp(61, 2);">GPRS/EDGE</div>
            </td>
            <td id="c61_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_48" class="ph eph" onclick="ShowHelp(48, 2);">Jack tai nghe</div>
            </td>
            <td id="c48_1" class="v">3.5 mm</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">NFC</div>
            </td>
            <td id="c6464_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_71" class="ph eph" onclick="ShowHelp(71, 2);">Kết nối USB</div>
            </td>
            <td id="c71_1" class="v">Micro USB</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Kết nối khác</div>
            </td>
            <td id="c5199_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Cổng sạc</div>
            </td>
            <td id="c85_1" class="v">Micro USB</td>
        </tr>
        <tr class="r">
            <td rowspan="6" class="g" valign="top">
            <div class="gh">Giải trí &amp; Ứng dụng</div>
            </td>
            <td id="prop_32" class="p f eph" onclick="ShowHelp(32, 2);">Xem phim</td>
            <td id="c32_1" class="v f">3GP, MP4, WMV, H.263, H.264(MPEG4-AVC)</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_33" class="ph eph" onclick="ShowHelp(33, 2);">Nghe nhạc</div>
            </td>
            <td id="c33_1" class="v">MP3, WAV, AAC, AMR</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_36" class="ph eph" onclick="ShowHelp(36, 2);">Ghi âm</div>
            </td>
            <td id="c36_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_6039" class="ph eph" onclick="ShowHelp(6039, 2);">Giới hạn cuộc gọi</div>
            </td>
            <td id="c6039_1" class="v">Không</td>
        </tr>
        <tr>
            <td class="p">
            <div id="prop_34" class="ph eph" onclick="ShowHelp(34, 2);">FM radio</div>
            </td>
            <td id="c34_1" class="v">Có</td>
        </tr>
        <tr>
            <td class="p">
            <div class="ph">Chức năng khác</div>
            </td>
            <td id="c43_1" class="v">Mạng xã hội ảo<br>Google Play, Google Search, Google Now, Maps, Gmail, YouTube, Lịch</td>
        </tr>
    </tbody>
</table>', N'<h2 align="center">Q-Smart S19: Smartphone giá rẻ - mạnh mẽ - trẻ trung</h2><p style="text-align: justify;" align=""><br>Sản phẩm có 3 phiên bản màu trắng, xanh, đỏ, tạo nên sự đa dạng trong phóng cách cá tính của người sử dụng. Bạn trẻ, năng động, yêu công nghệ và muốn chạm – lướt trên một chiếc smartphone màn hình cảm ứng, mức giá cực rẻ thì <strong>Q-Smart S19</strong> là một lựa chọn hợp lý.</p>&nbsp;<h3><br>Thiết kế đơn giản, tinh tế</h3><p style="text-align: justify;" align="">Q-Smart có màn hình 4 inch, nhỏ nhắn với kích thước 128.2 x 63 x 9.8mm nhưng nặng khoảng 125 g. Vì thế dù là một sản phẩm phổ thông, mức giá rẻ, <strong>Q-smart S19</strong> vẫn mang lại cảm giác đầm, chắc tay cho người dùng. Đây là một yếu tố quan trọng để chiếc máy trở nên chắc chắn, đẹp mắt hơn, tránh được lối mòn của một số mẫu sản phẩm phổ thông: quá nhẹ và ọp ẹp.</p><p style="text-align: justify;" align=""><br>Nhìn trực diện sản phẩm, <strong>S19</strong> có một dáng bầu, bo tròn 4 góc. Thiết kế này làm người dùng liên tưởng đến một chiếc Samsung. Tuy nhiên, mặt sau hãng sản xuất đã ghi dấu ấn của mình bằng dòng chữ Q-Smart – một dòng <a href="http://www.thegioididong.com/dtdd?f=smartphone" target="_blank">smartphone</a> giá rẻ mang lại nhiều doanh thu cho hãng này.</p><p align="center"><img title="Màn hình 4 inch, nhỏ gọn nhưng vẫn tạo cảm giác đầm tay, chắc chắn" src="http://cdn.tgdd.vn/Products/Images/42/61229/q-smart-19_clip_image002.jpg" alt="Q-smart S19 màn hình 4 inch"><br><em>Màn hình 4 inch, nhỏ gọn nhưng vẫn tạo cảm giác đầm tay, chắc chắn</em></p><p style="text-align: justify;" align=""><br>Máy có vỏ nhựa, nắp lưng tháo rời được và có dáng bầu giúp máy có thể nằm gọn trong tay bạn, thao tác bằng một tay hết sức dễ dàng. Thiết kế đơn giản phù hợp với một chiếc smartphone cơ bản, khỏe khoắn và dễ sử dụng.</p><p align="center"><img title="Máy có nhiều màu tươi tắn, phù hợp với giới trẻ" src="http://cdn.tgdd.vn/Products/Images/42/61229/q-smart-19_clip_image003.jpg" alt="S19 Design"><br><em>Máy có nhiều màu tươi tắn, phù hợp với giới trẻ</em></p><h3 align=""><br>Phần cứng khá – hoạt động bền bỉ</h3><p style="text-align: justify;" align=""><strong>Q-Smart S19</strong> lên kệ, gia nhập vào dòng điện thoại cảm ứng giá rẻ với phần cứng không thực sự mạnh mẽ nhưng đủ sức chạy các ứng dụng ổn định. Máy chạy CPU lõi kép, tốc độ 1.2 GHz, RAM 512 MB, hoạt động trên nền tảng hệ điều hành Android 4.2. Những thông số này giúp máy hoạt động tối ưu khi bạn chạy những ứng dụng cơ bản, không cùng lúc chạy đa nhiệm quá nhiều chương trình.</p><p align="center"><img title="Máy giá rẻ nhưng hỗ trợ camera lên đến 5.0 MP" src="http://cdn.tgdd.vn/Products/Images/42/61229/q-smart-19_clip_image005.jpg" alt="Q-smart S19 camera 5.0 MP"><br><em>Máy giá rẻ nhưng hỗ trợ camera lên đến 5.0 MP</em></p><p style="text-align: justify;" align=""><br>Chiếc máy có mức giá rất mềm nhưng vẫn tích hợp camera 5.0MP, hỗ trợ đèn flash để chụp ảnh trong điều kiện thiếu sáng. Người dùng không thể có được một bức ảnh lung linh với độ cảm biến, xử lý hình ảnh xuất sắc trong chiếc điện thoại giá rẻ này.</p><p style="text-align: justify;" align=""><br>Một số hình ảnh chụp trong điều kiện ánh sáng yếu màu sắc hiển thị trong ảnh sẽ dễ bị sai, phóng to ảnh sẽ thấy đường viền trên chủ thể tấm ảnh không thực sự sắc nét. Tuy nhiên, 5.0 MP vẫn đáp ứng được nhu cầu lưu giữ những khoảnh khắc đáng nhớ của người dùng. Ảnh có dung lượng cao, đủ chất lượng để in ảnh. <strong>S19</strong> còn tích hợp camera trước, độ phân giải VGA giúp bạn chat voice thuận tiện.</p>&nbsp;<h3><br>Luôn luôn kết nối – giải trí nhẹ nhàng</h3><p style="text-align: justify;" align="">Với mức giá khoảng 1,5 triệu đồng, bạn đã có thể sở hữu một chiếc điện thoại thông minh 2 sim 2 sóng có đầy đủ các kết nối Wifi đạt chuẩn 802.11 b/g/n; 3G HSDPA, 7.2 Mbps cho kết nối chất lượng cao. Nhờ kết nối internet tốc độ cao, bạn có thể sử dụng các ứng dụng nhắn tin, điện thoại miễn phí như Zalo, Viber, Yahoo, Skype… Đây sẽ là những hỗ trợ đáng giá giúp bạn tiết kiệm được đáng kể chi phí điện thoại.</p><p style="text-align: justify;" align=""><br>Bên cạnh đó, chiếc <strong>Q-Smart S19 </strong>còn thực sự thông minh khi có thể trở thành một thiết bị phát wifi từ nguyên liệu 3G, nhờ tính năng Wifi Hotspot. Một sinh viên phải đối mặt với những deadline nộp bài, những bài thuyết trình quan trọng, bạn sẽ thực sự yên tâm khi chiếc smartphone của bạn sẽ trở thành nguồn phát wifi mọi lúc mọi nơi, nếu chẳng may đường truyền internet của bạn bị hỏng.</p><p style="text-align: justify;" align=""><br>Bên cạnh đó, chiếc máy giá rẻ nhưng vẫn đảm nhận được rất tốt các nhiệm vụ giải trí được tích hợp trên smartphone hiện nay như nghe nhạc, truy cập web, xem phim trực tuyến…</p><p style="text-align: justify;" align=""><br>Máy cũng tích hợp đầy đủ những tính năng thông dụng của người dùng smartphone hiện đại: nghe nhạc với các chuẩn 3GP, MP4, WMV, H.263, H.264 (MPEG4-AVC) cho độ tương thích với các file âm thanh cao; kết nối mail, Facebook, có khả năng chơi những game nhẹ ít tốn dữ liệu bộ nhớ…</p><p style="text-align: justify;" align=""><br>Dung lượng pin 1400 mAh đủ để chiếc máy của bạn hoạt động liên tục trong suốt 1 ngày. Vì vậy, bạn sẽ không bỏ lỡ bất cứ cập nhật nào trên Facebook, email hay có thể lập tức tra cứu thông tin trên google. Đây cũng chính là ưu điểm lớn nhất của sản phẩm: mức giá cực rẻ, cấu hình ổn, tích hợp những tính năng cần thiết, hữu ích nhất trên một chiếc điện thoại thông minh.</p>&nbsp;<h3 align=""><br>Kết luận:</h3><p style="text-align: justify;" align="">Bạn không cần đầu tư hàng chục triệu đồng để tận hưởng những tính năng tiện ích của một chiếc smartphone. Giá rẻ, thiết kế ổn, kết nối internet liên tục, nhiều màu sắc cá tính độc đáo là những ưu điểm của sản phẩm. Do hạn chế về phần cứng, chiếc máy sẽ không cho những ảnh chụp xuất sắc, không chạy được game đồ họa cao tuy nhiên với mức giá rẻ, bạn sẽ hài lòng với chất lượng của chiếc smartphone đơn giản, dễ sử dụng.</p><table class="advantage"><tbody><tr><td><h3>Ưu điểm</h3><ul>
	<li>Thiết kế nhiều màu sắc cá tính.</li>
	<li>Cấu hình khá tốt.</li>
	<li>Kết nối internet tốc độ cao.</li>
</ul></td><td><h3>Nhược điểm</h3><ul>
	<li>Ảnh chụp không xuất sắc.</li>
</ul></td></tr></tbody></table>', 6, 99, 0, 0, 0, CAST(N'2014-03-21 00:00:00' AS SmallDateTime), 1)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET IDENTITY_INSERT [dbo].[Slider] ON 

INSERT [dbo].[Slider] ([MaSlider], [UrlHinh], [LinkUrl], [Thutu], [AnHien]) VALUES (1, N'/Content/Images/Slide/1.jpg', N'/Home', 1, 1)
INSERT [dbo].[Slider] ([MaSlider], [UrlHinh], [LinkUrl], [Thutu], [AnHien]) VALUES (2, N'/Content/Images/Slide/2.jpg', N'/Home', 2, 1)
INSERT [dbo].[Slider] ([MaSlider], [UrlHinh], [LinkUrl], [Thutu], [AnHien]) VALUES (3, N'/Content/Images/Slide/3.jpg', N'/Home', 3, 1)
INSERT [dbo].[Slider] ([MaSlider], [UrlHinh], [LinkUrl], [Thutu], [AnHien]) VALUES (4, N'/Content/Images/Slide/4.jpg', N'/Home', 4, 1)
INSERT [dbo].[Slider] ([MaSlider], [UrlHinh], [LinkUrl], [Thutu], [AnHien]) VALUES (5, N'/Content/Images/Slide/5.jpg', N'/Home', 5, 1)
INSERT [dbo].[Slider] ([MaSlider], [UrlHinh], [LinkUrl], [Thutu], [AnHien]) VALUES (6, N'/Content/Images/Slide/6.jpg', N'/Home', 6, 1)
INSERT [dbo].[Slider] ([MaSlider], [UrlHinh], [LinkUrl], [Thutu], [AnHien]) VALUES (7, N'/Content/Images/Slide/7.jpg', N'/Home', 7, 1)
SET IDENTITY_INSERT [dbo].[Slider] OFF
INSERT [dbo].[SoLuotTruyCap] ([Dem]) VALUES (0)
SET IDENTITY_INSERT [dbo].[ThongTin] ON 

INSERT [dbo].[ThongTin] ([MaTT], [code1], [GioiThieu], [code2], [sitemap]) VALUES (1, N'<p id="slide-client" class="text"><strong></strong><span></span></p><script type="text/javascript">if(!window.slider) var slider={};slider.data=[{"id":"slide-img-1","client":"', N'<p>XstoreMobile</p>
', N'","desc":""}];</script>', N'<iframe src="https://mapsengine.google.com/map/embed?mid=zmjDizZJBasM.k1WCrrLSNu10" width="100%" height="480" style="border:none"></iframe>')
SET IDENTITY_INSERT [dbo].[ThongTin] OFF
SET IDENTITY_INSERT [dbo].[TinTuc] ON 

INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [TomTat], [UrlHinh], [NoiDung], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (1, N'Nokia X tại Việt Nam rẻ hơn ở Ấn Độ', N'Theo đó, giá bán của Nokia X tại Ấn Độ lên đến 8.599 IRN (khoảng 2,97 triệu đồng) cao hơn gần 200,000 đồng so với thị trường Việt Nam.', N'/Content/Images/TinTuc/1.jpg', N'<p style="text-align: center;"><strong><img src="http://cdn.tgdd.vn/Files/2014/03/11/537030/ImageAttach/Nokia-X1-201431191622.jpg" alt="Nokia X tại Việt Nam rẻ hơn ở Ấn Độ"></strong></p><p style="text-align: justify;">Nokia vừa chính thức giới thiệu mẫu <a title="Chi tiết Nokia X" href="http://www.thegioididong.com/dtdd/nokia-x" target="_blank">Nokia X</a> tại Ấn Độ, đây được xem là thị trường cuồng sản phẩm Nokia nhất trên thế giới. Theo đó, giá bán được công bố tại Ấn Độ cho Nokia X bản 2 SIM gần 8.500 IRN (khoảng 140 USD, tức 2,97 triệu đồng). Trong khi đó tại Việt Nam, nhiều cửa hàng đã cho niêm yết giá bán của Nokia X ở mức 2,8 triệu đồng, tức là thấp hơn gần 200.000 đồng so với thị trường Ấn Độ.</p><p style="text-align: center;"><img style="width: 580px; height: 315px;" src="http://cdn.tgdd.vn/Files/2014/03/11/537030/ImageAttach/Nokia-X2-201431191634.jpg" alt="Nokia X tại Việt Nam rẻ hơn ở Ấn Độ"></p><p style="text-align: justify;">Trao đổi với nhân viên bán hàng tại thegioididong.com, <a title="Mở hộp Nokia X chạy Android giá rẻ tại thegioididong.com" href="http://www.thegioididong.com/tin-tuc/mo-hop-nokia-x-chay-android-gia-re-tai-thegioidido-536764" target="_blank">hiện sản phẩm đã về một vài cửa hàng</a> trong chuỗi hệ thống bán lẻ của công ty, tuy nhiên chưa có giá bán chính thức từ Nokia nên chưa thể bán ra. Một vài đại lý ở Việt Nam cũng cho biết, họ sẽ có hàng bán ra ngay trong ngày 11/3 hoặc 12/3, dự kiến đây là ngày Nokia chính thức giới thiệu mẫu Nokia X tại thị trường Việt Nam.</p><p style="text-align: justify;">Khi chính thức bán ra, Nokia X sẽ có đủ 6 màu bao gồm trắng, đen, vàng, cam, xanh dương và xanh lá cây. Trong khi đó, 2 model còn lại là Nokia X Plus và XL sẽ có mặt trên thị trường trong khoảng 2 tháng tới.</p>', 0, CAST(N'2014-03-11 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [TomTat], [UrlHinh], [NoiDung], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (2, N'Tháo tung tablet mỏng nhất thế giới', N'Huawei tự tin cho rằng MediaPad X1 là chiếc tablet mỏng nhất trên thế giới, tính cho đến thời điểm hiện tại. Vậy thì nội thất phần cứng bên trong của máy có và đã loại bỏ những gì để có thể mảnh mai kinh ngạc đến thế.', N'/Content/Images/TinTuc/2.jpg', N'Trong số các sản phẩm mà Huawei công bố tại MWC 2014 vào tháng trước, ấn tượng nhất chính là MediaPad X1, chiếc máy tính bảng 7 inch có độ dày chỉ 7,18 mm mà thôi, vượt mặt các đối thủ sừng sỏ khác hiện nay như: <a title="Chi tiết Nexus 7 2013" href="http://www.thegioididong.com/may-tinh-bang/asus-google-nexus-7-2" target="_blank">Nexus 7 2013</a> (8,4 mm) và <a title="Chi tiết iPad mini 2" href="http://www.thegioididong.com/may-tinh-bang/ipad-mini-2-retina-16g-wifi" target="_blank">iPad Mini 2</a> (7,5 mm). Chưa ngừng lại tại đó, máy còn có viền màn hình siêu hẹp, cùng trọng lượng chỉ 239 gram.</p><p style="text-align: center;" dir="ltr"><img src="http://cdn.tgdd.vn/Files/2014/03/11/537052/ImageAttach/Huawei-mediaad-X1-201431110459.jpg" alt="Trên tay Huawei MediaPad X1 tại MWC 2014"></p><p style="text-align: center;" dir="ltr"><a title="Huawei trình làng tablet siêu mỏng cùng vòng đeo thông minh" href="http://www.thegioididong.com/tin-tuc/huawei-trinh-lang-tablet-sieu-mong-cung-vong-deo-t-534626" target="_blank"><em>Trên tay Huawei MediaPad X1 tại MWC 2014</em></a></p><p style="text-align: justify;" dir="ltr"><strong>MediaPad X1 được trang bị màn hình IPS LCD 7 inch, độ phân giải Full HD (1200 x 1920 pixels)</strong>, mật độ điểm ảnh 323 ppi. Theo đó, máy sử dụng SoC “cây nhà lá vườn” Huawei Hass V9R1 (sản xuất trên quy trình 28nm), bộ xử lý này được hãng cam đoan là tốt hơn nhiều so với hiệu suất của Huawei K3V2.</p><p style="text-align: justify;" dir="ltr">Ngoài ra, máy còn có khả năng đàm thoại như điện thoại thông thường (2G/3G/4G), cùng dung lượng RAM 2GB kết hợp với bộ nhớ trong 16GB, cung cấp camera trước 5MP và camera phía sau lên đến 13MP. Cuối cùng, máy được tích hợp thỏi pin lên đến 5000 mAh.</p><p style="text-align: justify;">Dự kiến, <a title="Máy tính bảng Huawei" href="http://www.thegioididong.com/may-tinh-bang-huawei" target="_blank">Huawei</a> MediaPad X1 sẽ được bán ra với hai phiên bản: 3G có giá 1.799 nhân dân tệ (khoảng 293 USD) và phiên bản 4G có giá 1.999 nhân dân tệ (khoảng 325 USD). Sau đây, mời các bạn cùng xem qua quá trình rã máy MediaPad X1 bên dưới.</p><p style="text-align: center;"><img style="width: 640px; height: 426px;" src="http://cdn.tgdd.vn/Files/2014/03/11/537052/ImageAttach/Thao-tung-Huawei-mediaad-X1-2014311105034.jpg" alt="Tháo tung Huawei MediaPad X1"></p><p style="text-align: center;"><img src="http://cdn.tgdd.vn/Files/2014/03/11/537052/ImageAttach/Thao-tung-Huawei-mediaad-X1-1-2014311105127.jpg" alt="Tháo tung Huawei MediaPad X1"></p><p style="text-align: center;"><img style="width: 450px; height: 480px;" src="http://cdn.tgdd.vn/Files/2014/03/11/537052/ImageAttach/Thao-tung-Huawei-mediaPad-X1-2-2014311105314.jpg" alt="Tháo tung Huawei MediaPad X1"></p><p style="text-align: center;"><img src="http://cdn.tgdd.vn/Files/2014/03/11/537052/ImageAttach/Thao-tung-Huawei-mediaPad-X1-3-2014311105412.jpg" alt="Tháo tung Huawei MediaPad X1"></p><p style="text-align: center;"><img style="width: 640px; height: 426px;" src="http://cdn.tgdd.vn/Files/2014/03/11/537052/ImageAttach/Thao-tung-Huawei-mediaPad-X1-4-2014311105440.jpg" alt="Tháo tung Huawei MediaPad X1"></p><p style="text-align: center;"><img style="width: 350px; height: 703px;" src="http://cdn.tgdd.vn/Files/2014/03/11/537052/ImageAttach/Thao-tung-Huawei-mediaPad-X1-5-2014311105519.jpg" alt="Tháo tung Huawei MediaPad X1"></p><p style="text-align: center;"><img style="width: 640px; height: 426px;" src="http://cdn.tgdd.vn/Files/2014/03/11/537052/ImageAttach/Thao-tung-Huawei-mediaPad-X1-6-2014311105652.jpg" alt="Tháo tung Huawei MediaPad X1"></p><p style="text-align: center;"><img src="http://cdn.tgdd.vn/Files/2014/03/11/537052/ImageAttach/Thao-tung-Huawei-mediaPad-X1-7-2014311105738.jpg" alt="Tháo tung Huawei MediaPad X1"></p><p style="text-align: center;"><img src="http://cdn.tgdd.vn/Files/2014/03/11/537052/ImageAttach/Thao-tung-Huawei-mediaPad-X1-8-2014311105819.jpg" alt="Tháo tung Huawei MediaPad X1"></p><p style="text-align: center;"><img src="http://cdn.tgdd.vn/Files/2014/03/11/537052/ImageAttach/Thao-tung-Huawei-mediaPad-X1-9-2014311105854.jpg" alt="Tháo tung Huawei MediaPad X1"></p><p style="text-align: center;"><img src="http://cdn.tgdd.vn/Files/2014/03/11/537052/ImageAttach/Thao-tung-Huawei-mediaPad-X1-10-2014311105923.jpg" alt="Tháo tung Huawei MediaPad X1"></p><p style="text-align: center;"><img style="width: 640px; height: 426px;" src="http://cdn.tgdd.vn/Files/2014/03/11/537052/ImageAttach/Thao-tung-Huawei-mediaPad-X1-11-2014311105956.jpg" alt="Tháo tung Huawei MediaPad X1"></p><p style="text-align: center;"><img style="width: 640px; height: 426px;" src="http://cdn.tgdd.vn/Files/2014/03/11/537052/ImageAttach/Thao-tung-Huawei-mediaPad-X1-12-201431111028.jpg" alt="Tháo tung Huawei MediaPad X1"></p><p style="text-align: center;"><img style="width: 640px; height: 426px;" src="http://cdn.tgdd.vn/Files/2014/03/11/537052/ImageAttach/Thao-tung-Huawei-mediaPad-X1-13-20143111119.jpg" alt="Tháo tung Huawei MediaPad X1"></p><p style="text-align: center;"><img src="http://cdn.tgdd.vn/Files/2014/03/11/537052/ImageAttach/Thao-tung-Huawei-mediaPad-X1-14-201431111157.jpg" alt="Tháo tung Huawei MediaPad X1"></p><p style="text-align: center;"><img style="height: 409px; width: 380px;" src="http://cdn.tgdd.vn/Files/2014/03/11/537052/ImageAttach/Thao-tung-Huawei-mediaPad-X1-15-201431111316.jpg" alt="Tháo tung Huawei MediaPad X1"></p><p style="text-align: center;"><img src="http://cdn.tgdd.vn/Files/2014/03/11/537052/ImageAttach/Thao-tung-Huawei-mediaPad-X1-16-20143111146.jpg" alt="Tháo tung Huawei MediaPad X1"></p><p style="text-align: center;"><img src="http://cdn.tgdd.vn/Files/2014/03/11/537052/ImageAttach/Thao-tung-Huawei-mediaPad-X1-17-201431111448.jpg" alt="Tháo tung Huawei MediaPad X1"></p><p style="text-align: center;"><img style="width: 640px; height: 426px;" src="http://cdn.tgdd.vn/Files/2014/03/11/537052/ImageAttach/Thao-tung-Huawei-mediaPad-X1-18-201431111521.jpg" alt="Tháo tung Huawei MediaPad X1"></p><p style="text-align: center;"><img style="width: 640px; height: 426px;" src="http://cdn.tgdd.vn/Files/2014/03/11/537052/ImageAttach/Thao-tung-Huawei-mediaPad-X1-19-201431111546.jpg" alt="Tháo tung Huawei MediaPad X1"></p><p style="text-align: center;"><img src="http://cdn.tgdd.vn/Files/2014/03/11/537052/ImageAttach/Thao-tung-Huawei-mediaPad-X1-20-201431111612.jpg" alt="Tháo tung Huawei MediaPad X1"></p><p style="text-align: center;"><img style="width: 640px; height: 426px;" src="http://cdn.tgdd.vn/Files/2014/03/11/537052/ImageAttach/Thao-tung-Huawei-mediaPad-X1-21-201431111634.jpg" alt="Tháo tung Huawei MediaPad X1">', 0, CAST(N'2014-03-11 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [TomTat], [UrlHinh], [NoiDung], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (3, N'Sony ra mắt bộ theme cực đẹp dành cho smartphone Xperia', N'Thêm một tin vui cho những ai là fan của dòng Xperia đó là Sony vừa giới thiệu bộ theme đẹp mắt dành cho mọi dòng smartphone Xperia chạy Android 4.3 hoặc mới hơn.', N'/Content/Images/TinTuc/3.jpg', N'<img src="http://cdn.tgdd.vn/Files/2014/03/11/537040/ImageAttach/themes-xperia-1-2014311101138.jpg" alt="Themes Xperia"></p><p style="text-align: center;"><em>Theme mới cho dòng Xperia</em></p><p style="text-align: justify;">Theo <a title="Sony" href="http://www.thegioididong.com/dtdd-sony" target="_blank">Sony</a>, bộ theme có đến 280 skin để bạn trang trí cho thiết bị của mình bao gồm cả màn hình khóa, thanh điều hướng, các biểu tượng, thư mục, thanh trượt và thậm chí cả các checkboxes (ô vuông, hình tròn để đánh dấu check). Dự kiến, số lượng các skin tùy biến sẽ còn được bổ sung nhiều hơn trong tương lai.</p><p style="text-align: center;"><iframe title="YouTube video player" src="http://www.youtube.com/v/it0WEuVUp7o?rel=0" frameborder="0" height="480" scrolling="no" width="640"></iframe></p><p style="text-align: center;"><em>Video Sony giới thiệu bộ theme mới</em></p><p style="text-align: justify;">Xperia Themes hiện đã có sẵn trên Google Play. Để tim và cài đặt các theme mới, hãy vào menu <a title="Điện thoại di động" href="http://www.thegioididong.com/dtdd" target="_blank">điện thoại</a> Xperia của bạn và nhất nút “dấu cộng” ở phía trên góc phải. Sau đó bạn sẽ thấy tất cả bộ theme và tải chúng về. Rất nhiều themes để bạn trang trí và hi vọng nó sẽ làm bạn thích thú.</p>', 0, CAST(N'2014-03-11 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [TomTat], [UrlHinh], [NoiDung], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (4, N'Nokia sắp ra "hàng mới" vào ngày 2/4?', N'Hội nghị những nhà phát triển BUILD 2014 đang đến rất gần và dưới đây là những gì mà bạn đang moang đợi?', N'/Content/Images/TinTuc/4.jpg', N'<p style="text-align: justify;">Trang web của Nokia đã gửi thông báo tới các fan hâm mộ của mình: “Điều gì đã làm cho năm 2014 trở nên đặc biệt? Đó là sự hợp tác thú vị giữa Microsoft và Nokia, chúng tôi sẽ có những sản phẩm mới dành cho bạn”.</p><p style="text-align: center;"><img src="http://cdn.tgdd.vn/Files/2014/03/28/539402/ImageAttach/Nokia-Lumia-930-630-1-20143289495.jpg" alt="BUILD 2014"></p><p style="text-align: center;"><em>BUILD 2014</em></p><p style="text-align: justify;">Vậy, những gì mà bạn có thể mong đợi? Đầu tiên, các bạn có thể nghĩ tới việc thông báo phiên bản Windows Phone 8.1 tại BUILD 2014, bản cập nhật lớn nhất dành cho smartphone Windows Phone. Và ngay đây là những thiết bị mà bạn đang mong ngóng.</p><p style="text-align: justify;"><strong>Nokia Lumia 930 (tên mã Martini) </strong></p><p style="text-align: justify;"><a title="Chi tiết Nokia Icon" href="http://www.thegioididong.com/dtdd/nokia-lumia-icon" target="_blank">Nokia Icon</a> đã gây ấn tượng với chất lượng xây dựng xuất sắc, máy ảnh 20MP nhưng nó độc quyền cho nhà mạng Verizon (Mỹ). May mắn thay là Nokia đã chuẩn bị cho bạn một sản phẩm tương tự, đó chính là <strong>Nokia Lumia 930</strong>.</p><p style="text-align: center;"><img style="width: 600px; height: 340px;" src="http://cdn.tgdd.vn/Files/2014/03/28/539402/ImageAttach/Nokia-Lumia-930-630-4-201432894937.jpg" alt="Nokia Lumia 930"></p><p style="text-align: center;"><em>Nokia Lumia 930 sẽ tương tự như Lumia Icon</em></p><p style="text-align: justify;">Trong tháng 2, Nextleaks đã cho rằng <a title="Nokia vừa quảng cáo Lumia 930 vừa đá đểu HTC One M8" href="http://www.thegioididong.com/tin-tuc/nokia-vua-quang-cao-lumia-930-vua-da-deu-htc-one-m-538440" target="_blank">Lumia 930 sẽ sở hữu bộ vi xử lý lõi tứ Snapdragon 800 tốc độ 2.2GHz</a>, RAM 2GB, bộ nhớ trong 16GB, hỗ trợ thẻ nhớ microSD, pin 2700mAh, máy ảnh 20MP và màn hình 4.5 inch độ phân giải full HD. Dự kiến, Lumia 930 cũng sẽ kế thừa thiết kế của Icon, hình hộp đẹp mắt. Không những vây, tin đồn còn cho biết máy sẽ có giá phải chăng để nhiều người có thể sở hữu.</p><p style="text-align: justify;"><strong>Lumia 630</strong></p><p style="text-align: justify;"><a title="Lumia 630 bằng xương bằng thịt xuất hiện" href="http://www.thegioididong.com/tin-tuc/lumia-630-bang-xuong-bang-thit-lo-dien-539314" target="_blank">Lumia Nokia 630 (tên mã Moneypenny)</a> là thiết bị thứ hai mà chúng tôi hy vọng Nokia sẽ công bố vào ngày 2/4 tới. <a title="Lumia 630 lộ mức giá siê rẻ" href="http://www.thegioididong.com/tin-tuc/nokia-lumia-630-lo-gia-ban-cuc-re-538434" target="_blank">Lumia 630 được coi là smartphone giá rẻ</a>, khoảng 150 USD.</p><p style="text-align: center;"><img src="http://cdn.tgdd.vn/Files/2014/03/28/539402/ImageAttach/Nokia-Lumia-930-630-2-201432895039.jpg" alt="Lumia 630"></p><p style="text-align: center;"><em>Lumia 630</em></p><p style="text-align: justify;">Dự kiến, máy sẽ có màn hình 4.5 inch độ phân giải 854 x 480 pixels, chip dual-core Snapdragon 400, RAM 1GB, hỗ trợ 2 SIM, các nút điều hướng ảo trên màn hình, camera 5MP không đèn flash và chạy trên phiên bản Windows Phone 8.1.</p><p style="text-align: justify;"><strong>Không có smartphone hàng đầu?</strong></p><p style="text-align: center;"><strong><img src="http://cdn.tgdd.vn/Files/2014/03/28/539402/ImageAttach/Nokia-Lumia-930-630-3-201432895051.jpg" alt="Lumia 630"></strong></p><p style="text-align: center;"><em>Sẽ có những smartphone mới?</em></p><p style="text-align: justify;">Có vẻ như lần này các tin đồn về một thiết bị mới, hàng đầu là không có, tuy nhiên các bạn vẫn có thể ngạc nhiên nếu như Nokia tung ra dòng smartphone sử dụng máy ảnh công nghệ PureView của mình. Tất cả vẫn còn phải chờ đợi cho tới phút chót. Chỉ còn vài ngày nữa thôi là mọi thứ sẽ sáng tỏ.</p>', 0, CAST(N'2014-03-28 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [TomTat], [UrlHinh], [NoiDung], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (5, N'iPhone 6 sẽ giúp Apple "hốt bạc" nhiều hơn từ người dùng', N'Đã từ lâu iPhone được xem là dòng thiết bị đẳng cấp và nó luôn được nhiều người dùng tìm mua dù có thể có mức giá bán cao hơn thực tế. Nhiều người thậm chí còn sẵn sàng bỏ thêm tiền nếu Apple chịu làm iPhone có màn hình lớn hơn.', N'/Content/Images/TinTuc/6.jpg', N'<p style="margin-bottom: 0in; text-align: justify;">CEO Apple, Tim Cook có thể sẽ rất vui khi ông nhìn thấy số liệu điều tra mới được công bố bởi nhà phân tích Raymond James của Tavis McCourt.</p><p style="margin-bottom: 0in; text-align: center;"><img src="http://cdn.tgdd.vn/Files/2014/03/27/538487/ImageAttach/iPhone-6-man-hinh-201432765617.jpg" alt="iPhone 6"></p><p style="margin-bottom: 0in; text-align: center;"><strong><em>iPhone 6</em></strong></p><p style="margin-bottom: 0in; text-align: justify;">Cuộc khảo sát của Raymond James được thực hiện với sự giúp đỡ của trang SurveyMonkey đã phát hiện ra rằng một phần ba số chủ sở hữu iPhone Mỹ sẽ sẵn sàng trả thêm 100 USD (~2 triệu VND) cho một chiếc iPhone 6 nếu nó có một màn hình lớn hơn <a title="Điện thoại iPhone 5s" href="http://www.thegioididong.com/iphone-5s" target="_blank">iPhone 5s</a>.</p><p style="margin-bottom: 0in; text-align: justify;">Điều này có nghĩa là 33% chủ sở hữu iPhone Mỹ có thể sẵn sàng trả tiền nhiều hơn mức giá bán của iPhone 5s 100 USD để iPhone 6 có một màn hình hiển thị từ 4.7 inch đến 5.5 inch. Cuộc khảo sát mới nhất của Raymond James cũng nhận thấy rằng 52.3% của tất cả các chủ sở hữu điện thoại thông minh ở Mỹ đều sử dụng iPhone. Và có vẻ như Apple đang đứng trước cơ hội ngàn năm có một để hốt bạc và thúc đẩy người dùng cũ nâng cấp lên phiên bản mới nếu chịu ra mắt thiết bị có màn hình lớn.</p><p style="margin-bottom: 0in; text-align: center;"><img src="http://cdn.tgdd.vn/Files/2014/03/27/538487/ImageAttach/iphone-6-moi-201432765650.jpg" alt="Màn hình lớn hơn và sẽ có giá cao hơn"></p><p style="margin-bottom: 0in; text-align: center;"><em>Màn hình lớn hơn và sẽ có giá cao hơn</em></p><p style="margin-bottom: 0in; text-align: justify;">Thực tế thì việc <a title="Điện thoại iPhone 6" href="http://www.thegioididong.com/dtdd/iphone-6" target="_blank">iPhone 6</a> có màn hình lớn hơn sẽ có giá cao hơn đã được nhiều người dự đoán từ trước, nhưng Apple vẫn im lặng trước những tin đồn này vì hãng muốn tạo bất ngờ ở phút cuối.</p>', 0, CAST(N'2014-03-28 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [TomTat], [UrlHinh], [NoiDung], [LuotXem], [NgayCapNhat], [AnHien]) VALUES (6, N'Jiayu S2 "siêu mẫu" 8 nhân có giá thành cực rẻ', N'Jiayu S2 không những “siêu gầy” mà còn sở hữu những linh kiện phần cứng thuộc hàng cấp cao hiện nay, nhưng giá thành thì lại đối nghịch đến bất ngờ.', N'/Content/Images/TinTuc/5.jpg', N'<img alt="Jiayu S2 sẽ được thương mại hóa rộng khắp vào ngày mai, nhưng hiện tại bạn đã có thể đặt mua" src="http://cdn.tgdd.vn/Files/2014/03/28/539476/ImageAttach/Jiayu-S2-201432820135.jpg" style="width: 640px; height: 426px;"></strong></p><p dir="ltr" style="text-align: center;"><em>Jiayu S2 sẽ được thương mại hóa rộng khắp vào ngày mai...</em></p><p dir="ltr" style="text-align: justify;"><a href="http://www.thegioididong.com/tin-tuc/xuat-hien-ban-sao-hoan-hao-cua-iphone-5-537193" target="_blank" title="Xuất hiện bản sao hoàn hảo của iPhone 5">Được xem là bản sao vô cùng hoản hảo của iPhone 5</a>, Jiayu S2 tự tin có thể vượt mặt dàn sao đình đám nhất hiện nay. Cụ thể hơn, máy có số đo 3 vòng lần lượt như sau: 139 x 67.5 x 6mm, rất mảnh mai khi đọ dáng cùng...</p><p dir="ltr" style="text-align: justify;"><em>- Apple iPhone 5/ 5S (7.6 mm)</em></p><p dir="ltr" style="text-align: justify;"><em>- Samsung Galaxy S5 (8.1 mm)</em></p><p dir="ltr" style="text-align: justify;"><em>- Sony Xperia Z2 (8.2 mm)</em></p><p dir="ltr" style="text-align: justify;"><em>- LG G Pro 2 (8.3 mm)</em></p><p dir="ltr" style="text-align: justify;"><em>- HTC One M8 (9.4 mm)</em></p><p dir="ltr" style="text-align: center;"><em><img alt="Nhưng hiện tại bạn đã có thể đặt mua với giá 320 USD" src="http://cdn.tgdd.vn/Files/2014/03/28/539476/ImageAttach/jiayu-S2-man-hinh-20143282077.jpg" style="width: 640px; height: 426px;"></em></p><p dir="ltr" style="text-align: center;"><em>...&nbsp;</em><em>nhưng hiện tại bạn đã có thể đặt mua với giá 320 USD/ khoảng 6,7 triệu đồng (trên&nbsp;jiayu store</em>)</p><p dir="ltr" style="text-align: justify;">Đó là về phần ngoại hình, còn khả năng hiển thị nội dung số chất lượng ra sao và điểm ảnh đạt tới ngưỡng nào? Theo đó, Jiayu S2 được trang bị màn hình Retina Full HD 1080p kích thước 5 inch (viền mỏng chỉ 1.7mm), kết hợp cùng mật độ điểm ảnh chạm mức 440 ppi và được phủ lớp kính cường lực Gorilla Glass thế hệ 2.</p><p dir="ltr" style="text-align: justify;"><em>- <a href="http://www.thegioididong.com/dtdd/iphone-5s-16gb" target="_blank" title="Chi tiết Apple iPhone 5S">Apple iPhone 5S </a>(640 x 1136 pixels,326 ppi)</em></p><p dir="ltr" style="text-align: justify;"><em>- <a href="http://www.thegioididong.com/dtdd/samsung-galaxy-s5" target="_blank" title="Chi tiết Samsung Galaxy S5">Samsung Galaxy S5 </a>(1080 x 1920 pixels, 432 ppi)</em></p><p dir="ltr" style="text-align: justify;"><em>- <a href="http://www.thegioididong.com/dtdd/sony-xperia-z2" target="_blank" title="Chi tiết Sony Xperia Z2">Sony Xperia Z2</a> (1080 x 1920 pixels, 424 ppi)</em></p><p dir="ltr" style="text-align: justify;"><em>- <a href="http://www.thegioididong.com/dtdd/lg-g-pro-2-d837" target="_blank" title="Chi tiết LG G Pro 2">LG G Pro 2 </a>(1080 x 1920 pixels, 373 ppi)</em></p><p dir="ltr" style="text-align: justify;"><em>- <a href="http://www.thegioididong.com/dtdd/htc-one-m8" target="_blank" title="Chi tiết HTC One M8">HTC One M8</a> (1080 x 1920 pixels, 441 ppi)</em></p><p dir="ltr" style="text-align: center;"><em><img alt="Jiayu S2 có ngoại hình lớn hơn, nhưng lại mỏng hơn iPhone 5" src="http://cdn.tgdd.vn/Files/2014/03/28/539476/ImageAttach/jiayu-S2-mat-sau-201432820841.jpg" style="width: 640px; height: 426px;"></em></p><p dir="ltr" style="text-align: center;"><em>Jiayu S2 có ngoại hình lớn hơn, nhưng lại mỏng hơn iPhone 5</em></p><p dir="ltr" style="text-align: justify;">Thông số cấu hình còn lại của Jiayu S2 bao gồm: SoC MediaTek MT6592 8 nhân xung nhịp 1.7GHz, tích hợp dung lượng RAM 2GB và bộ nhớ trong 32GB (không hỗ trợ microSD). Ngoài ra, máy còn sở hữu bộ đôi camera cực chất: camera phụ 8MP và camera chính 13MP. Cuối cùng, máy sẽ được bán ra với phiên bản Android Jelly Bean và thòi pin dung lượng 2000 mAh.</p><p dir="ltr" style="text-align: center;"><img alt="Giao diện trên Jiayu S2" src="http://cdn.tgdd.vn/Files/2014/03/28/539476/ImageAttach/Jiayu-S2-giao-dien-201432820128.jpg" style="width: 640px; height: 480px;"></p><p dir="ltr" style="text-align: center;"><em>Giao diện trên Jiayu S2</em></p><p dir="ltr" style="text-align: center;"><em><img alt="Thông tin cấu hình của Jiayu S2" src="http://cdn.tgdd.vn/Files/2014/03/28/539476/ImageAttach/Jiayu-S2-Antutu-benchmark-2014328201224.jpg" style="width: 640px; height: 480px;"></em></p><p dir="ltr" style="text-align: center;"><em>Thông tin cấu hình của Jiayu S2</em>', 0, CAST(N'2014-03-29 00:00:00' AS SmallDateTime), 1)
SET IDENTITY_INSERT [dbo].[TinTuc] OFF
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BL_KH] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BL_KH]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BL_SP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BL_SP]
GO
ALTER TABLE [dbo].[CT_DonHang]  WITH CHECK ADD  CONSTRAINT [FK_CT_DonHang_DonHang] FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([MaDH])
GO
ALTER TABLE [dbo].[CT_DonHang] CHECK CONSTRAINT [FK_CT_DonHang_DonHang]
GO
ALTER TABLE [dbo].[CT_DonHang]  WITH CHECK ADD  CONSTRAINT [FK_CT_DonHang_SP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CT_DonHang] CHECK CONSTRAINT [FK_CT_DonHang_SP]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_KhachHang]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_SanPham]
GO
ALTER TABLE [dbo].[LienHe]  WITH CHECK ADD  CONSTRAINT [FK_LH_KH] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[LienHe] CHECK CONSTRAINT [FK_LH_KH]
GO
ALTER TABLE [dbo].[PhanQuyen_Admin]  WITH CHECK ADD  CONSTRAINT [FK_PQAdmin_Admin] FOREIGN KEY([MaAdmin])
REFERENCES [dbo].[Admin] ([MaAdmin])
GO
ALTER TABLE [dbo].[PhanQuyen_Admin] CHECK CONSTRAINT [FK_PQAdmin_Admin]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SP_NSX] FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NhaSanXuat] ([MaNSX])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SP_NSX]
GO
ALTER TABLE [dbo].[CT_DonHang]  WITH CHECK ADD CHECK  (([Thanhtien]>=(0)))
GO
ALTER TABLE [dbo].[CT_DonHang]  WITH CHECK ADD CHECK  (([Gia]>=(0)))
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD CHECK  (([Trigia]>(0)))
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD CHECK  (([Thanhtien]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [MobileStore] SET  READ_WRITE 
GO
