USE [master]
GO
/****** Object:  Database [BanMyPham]    Script Date: 12/4/2020 8:45:03 PM ******/
CREATE DATABASE [BanMyPham]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BanMyPham', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BanMyPham.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BanMyPham_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BanMyPham_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BanMyPham] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BanMyPham].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BanMyPham] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BanMyPham] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BanMyPham] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BanMyPham] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BanMyPham] SET ARITHABORT OFF 
GO
ALTER DATABASE [BanMyPham] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BanMyPham] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BanMyPham] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BanMyPham] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BanMyPham] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BanMyPham] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BanMyPham] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BanMyPham] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BanMyPham] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BanMyPham] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BanMyPham] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BanMyPham] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BanMyPham] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BanMyPham] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BanMyPham] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BanMyPham] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BanMyPham] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BanMyPham] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BanMyPham] SET  MULTI_USER 
GO
ALTER DATABASE [BanMyPham] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BanMyPham] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BanMyPham] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BanMyPham] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BanMyPham] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BanMyPham]
GO
/****** Object:  Table [dbo].[ACC_USER]    Script Date: 12/4/2020 8:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ACC_USER](
	[UserId] [char](5) NOT NULL,
	[Username] [varchar](20) NOT NULL,
	[Userpw] [varchar](20) NOT NULL,
 CONSTRAINT [PK__ACC_USER__1788CC4C4B53665E] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 12/4/2020 8:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cart](
	[CartId] [int] NOT NULL,
	[UserId] [char](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CartDetail]    Script Date: 12/4/2020 8:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CartDetail](
	[CartId] [int] NOT NULL,
	[MaSP] [char](5) NULL,
	[SoLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 12/4/2020 8:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaHoaDon] [char](5) NOT NULL,
	[MaSP] [char](5) NOT NULL,
	[SoLuongMua] [int] NULL,
	[ThanhTien] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietPhieuNhap]    Script Date: 12/4/2020 8:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietPhieuNhap](
	[SoPN] [char](5) NOT NULL,
	[MaSP] [char](5) NOT NULL,
	[NSX] [datetime] NULL,
	[HSD] [datetime] NULL,
	[SoLuongNhap] [int] NULL,
	[GiaNhap] [int] NULL,
	[ThanhTienNhap] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SoPN] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietQuanLyKho]    Script Date: 12/4/2020 8:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietQuanLyKho](
	[SoPhieuQL] [char](5) NOT NULL,
	[MaSP] [char](5) NOT NULL,
	[SLHong] [int] NULL,
	[SLThua] [int] NULL,
	[SLThieu] [int] NULL,
	[GhiChu] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[SoPhieuQL] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CungCapSP]    Script Date: 12/4/2020 8:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CungCapSP](
	[MaNhaCungCap] [char](5) NOT NULL,
	[MaSP] [char](5) NOT NULL,
	[GiaNhap] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhaCungCap] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/4/2020 8:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [char](5) NOT NULL,
	[NgayXuatHD] [datetime] NULL,
	[MaKH] [char](5) NOT NULL,
	[TongTien] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoaDon_TT]    Script Date: 12/4/2020 8:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDon_TT](
	[MaTT] [char](5) NOT NULL,
	[MaHoaDon] [char](5) NOT NULL,
	[NgayCapNhat] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTT] ASC,
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/4/2020 8:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [char](5) NOT NULL,
	[TenKH] [ntext] NULL,
	[DiaChiKH] [ntext] NULL,
	[DuongPhoKH] [ntext] NULL,
	[QuanHuyenKH] [ntext] NULL,
	[ThanhPhoKH] [ntext] NULL,
	[QuocGiaKH] [ntext] NULL,
	[SoLanMua] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Kho]    Script Date: 12/4/2020 8:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kho](
	[MaSP] [char](5) NOT NULL,
	[SoLuongTrongKho] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 12/4/2020 8:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[MaKhuyenMai] [char](5) NOT NULL,
	[TenKhuyenMai] [ntext] NULL,
	[ChietKhau] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhuyenMai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 12/4/2020 8:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoaiSanPham] [char](5) NOT NULL,
	[TenLoaiSanPham] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 12/4/2020 8:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNhaCungCap] [char](5) NOT NULL,
	[TenNhaCungCap] [ntext] NULL,
	[DiaChiNCC] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhaCungCap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/4/2020 8:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [char](5) NOT NULL,
	[TenNV] [ntext] NULL,
	[DiaChiNV] [ntext] NULL,
	[NS] [date] NULL,
	[GT] [nchar](10) NULL,
	[ChucVu] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 12/4/2020 8:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[SoPN] [char](5) NOT NULL,
	[NgayNhap] [datetime] NULL,
	[MaNhanVien] [char](5) NULL,
	[TongTienNhap] [int] NULL,
	[MaNhaCungCap] [char](5) NULL,
 CONSTRAINT [PK__PhieuNha__BC3C6A730643934A] PRIMARY KEY CLUSTERED 
(
	[SoPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuanLyKho]    Script Date: 12/4/2020 8:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuanLyKho](
	[SoPhieuQL] [char](5) NOT NULL,
	[NgayKT] [datetime] NULL,
	[MaNhanVien] [char](5) NULL,
 CONSTRAINT [PK__QuanLyKh__31E26BA536657F28] PRIMARY KEY CLUSTERED 
(
	[SoPhieuQL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThongTinSanPham]    Script Date: 12/4/2020 8:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThongTinSanPham](
	[MaSP] [char](5) NOT NULL,
	[TenSP] [ntext] NULL,
	[GiaBan] [int] NULL,
	[MoTaSP] [ntext] NULL,
	[XuatXu] [ntext] NULL,
	[MaLoaiSanPham] [char](5) NULL,
	[MaKhuyenMai] [char](5) NULL,
	[img] [text] NULL,
 CONSTRAINT [PK__ThongTin__2725081C8DC6A93C] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrangThaiDonHang]    Script Date: 12/4/2020 8:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrangThaiDonHang](
	[MaTT] [char](5) NOT NULL,
	[TenTT] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ACC_USER] ([UserId], [Username], [Userpw]) VALUES (N'Ad001', N'Admin', N'123')
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaSP], [SoLuongMua], [ThanhTien]) VALUES (N'H0001', N'S0002', 10, 3000000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaSP], [SoLuongMua], [ThanhTien]) VALUES (N'H0001', N'S0003', 1, 250000)
INSERT [dbo].[ChiTietPhieuNhap] ([SoPN], [MaSP], [NSX], [HSD], [SoLuongNhap], [GiaNhap], [ThanhTienNhap]) VALUES (N'P0001', N'S0005', CAST(N'2019-01-01 00:00:00.000' AS DateTime), NULL, 120, 280000, 33600000)
INSERT [dbo].[ChiTietPhieuNhap] ([SoPN], [MaSP], [NSX], [HSD], [SoLuongNhap], [GiaNhap], [ThanhTienNhap]) VALUES (N'P0002', N'S0001', CAST(N'2019-01-01 00:00:00.000' AS DateTime), NULL, 100, 250000, 25000000)
INSERT [dbo].[ChiTietPhieuNhap] ([SoPN], [MaSP], [NSX], [HSD], [SoLuongNhap], [GiaNhap], [ThanhTienNhap]) VALUES (N'P0003', N'S0005', CAST(N'2019-01-30 00:00:00.000' AS DateTime), NULL, 300, 200000, 60000000)
INSERT [dbo].[ChiTietPhieuNhap] ([SoPN], [MaSP], [NSX], [HSD], [SoLuongNhap], [GiaNhap], [ThanhTienNhap]) VALUES (N'P0004', N'S0002', CAST(N'2019-04-03 00:00:00.000' AS DateTime), NULL, 400, 500000, 200000000)
INSERT [dbo].[ChiTietPhieuNhap] ([SoPN], [MaSP], [NSX], [HSD], [SoLuongNhap], [GiaNhap], [ThanhTienNhap]) VALUES (N'P0005', N'S0005', CAST(N'2019-05-06 00:00:00.000' AS DateTime), NULL, 500, 230000, 115000000)
INSERT [dbo].[ChiTietPhieuNhap] ([SoPN], [MaSP], [NSX], [HSD], [SoLuongNhap], [GiaNhap], [ThanhTienNhap]) VALUES (N'P0006', N'S0001', CAST(N'2019-05-08 00:00:00.000' AS DateTime), NULL, 600, 600000, 360000000)
INSERT [dbo].[ChiTietPhieuNhap] ([SoPN], [MaSP], [NSX], [HSD], [SoLuongNhap], [GiaNhap], [ThanhTienNhap]) VALUES (N'P0007', N'S0003', CAST(N'2019-05-09 00:00:00.000' AS DateTime), NULL, 700, 120000, 84000000)
INSERT [dbo].[ChiTietPhieuNhap] ([SoPN], [MaSP], [NSX], [HSD], [SoLuongNhap], [GiaNhap], [ThanhTienNhap]) VALUES (N'P0008', N'S0001', NULL, NULL, 12, 100000, 1200000)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayXuatHD], [MaKH], [TongTien]) VALUES (N'H0001', CAST(N'2020-10-11 00:00:00.000' AS DateTime), N'K0001', 3250000)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayXuatHD], [MaKH], [TongTien]) VALUES (N'H0002', CAST(N'2020-10-10 00:00:00.000' AS DateTime), N'K0001', NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayXuatHD], [MaKH], [TongTien]) VALUES (N'H0003', CAST(N'2020-02-04 00:00:00.000' AS DateTime), N'K0002', NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayXuatHD], [MaKH], [TongTien]) VALUES (N'H0004', CAST(N'2020-03-04 00:00:00.000' AS DateTime), N'K0003', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChiKH], [DuongPhoKH], [QuanHuyenKH], [ThanhPhoKH], [QuocGiaKH], [SoLanMua]) VALUES (N'K0001', N'Phạm Văn A', N'Hai Bà Trưng', N'Hai Bà Trưng', N'Hai Bà Trưng', N'Hà Nội', N'Việt Nam', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChiKH], [DuongPhoKH], [QuanHuyenKH], [ThanhPhoKH], [QuocGiaKH], [SoLanMua]) VALUES (N'K0002', N'Phạm Văn B', N'Bạch Mai', N'Bạch Mai', N'Bạch Mai', N'Hà Nội', N'VN', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChiKH], [DuongPhoKH], [QuanHuyenKH], [ThanhPhoKH], [QuocGiaKH], [SoLanMua]) VALUES (N'K0003', N'Nguyễn Anh Tú', N'HQV', N'HQV', N'Cầu Giấy', N'HN', N'VN', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChiKH], [DuongPhoKH], [QuanHuyenKH], [ThanhPhoKH], [QuocGiaKH], [SoLanMua]) VALUES (N'K0004', N'Như Minh', N'PVĐ', N'PVĐ', N'Bắc Từ Liêm', N'HN', N'VN', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChiKH], [DuongPhoKH], [QuanHuyenKH], [ThanhPhoKH], [QuocGiaKH], [SoLanMua]) VALUES (N'K0005', N'Hải Yến', N'23/34', N'PVĐ', N'Bắc Từ Liêm', N'HN', N'VN', NULL)
INSERT [dbo].[Kho] ([MaSP], [SoLuongTrongKho]) VALUES (N'S0001', 1000)
INSERT [dbo].[Kho] ([MaSP], [SoLuongTrongKho]) VALUES (N'S0002', 110)
INSERT [dbo].[Kho] ([MaSP], [SoLuongTrongKho]) VALUES (N'S0003', 119)
INSERT [dbo].[Kho] ([MaSP], [SoLuongTrongKho]) VALUES (N'S0004', 870)
INSERT [dbo].[Kho] ([MaSP], [SoLuongTrongKho]) VALUES (N'S0005', 550)
INSERT [dbo].[KhuyenMai] ([MaKhuyenMai], [TenKhuyenMai], [ChietKhau]) VALUES (N'     ', N'', NULL)
INSERT [dbo].[KhuyenMai] ([MaKhuyenMai], [TenKhuyenMai], [ChietKhau]) VALUES (N'KM001', N'Black Friday', 50)
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham]) VALUES (N'M0001', N'Lipstick')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham]) VALUES (N'M0002', N'Toner')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham]) VALUES (N'M0003', N'Eyes Shadow')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham]) VALUES (N'M0004', N'Eyeliner')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham]) VALUES (N'M0005', N'Eyebrown ')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham]) VALUES (N'M0006', N'Eyelashes')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChiNCC]) VALUES (N'N0001', N'3CE', N'Korea')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChiNCC]) VALUES (N'N0002', N'Yves Saint Lauren', N'USA')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChiNCC]) VALUES (N'N0003', N'Mamonde', N'Korea')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChiNCC]) VALUES (N'N0004', N'Huda', N'USA')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChiNCC]) VALUES (N'N0005', N'Peri Pera', N'KoreA')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChiNCC]) VALUES (N'N0006', N'Whitening', N'ThaiLand')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChiNCC]) VALUES (N'N0007', N'Shesido', N'Japan')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChiNCC]) VALUES (N'N0008', N'Khiel', N'USA')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChiNCC]) VALUES (N'N0009', N'Dior', N'Paris')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChiNCC]) VALUES (N'N0010', N'Innisfree', N'Korea')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChiNCC]) VALUES (N'N0011', N'Chanel', N'Paris')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNV], [DiaChiNV], [NS], [GT], [ChucVu]) VALUES (N'N0001', N'Nghiêm Huyền Ngọc', N'Phạm Văn Đồng', CAST(N'1998-11-10' AS Date), N'Nữ        ', NULL)
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNV], [DiaChiNV], [NS], [GT], [ChucVu]) VALUES (N'N0002', N'Vũ Thị Hường', N'Hoàng Mai', CAST(N'1997-01-01' AS Date), N'Nữ        ', NULL)
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNV], [DiaChiNV], [NS], [GT], [ChucVu]) VALUES (N'N0003', N'Dương Quang Minh', N'Hào Nam', CAST(N'1998-01-06' AS Date), N'Nam       ', NULL)
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNV], [DiaChiNV], [NS], [GT], [ChucVu]) VALUES (N'N0004', N'Nguyễn Huy Anh', N'Hà Đông', CAST(N'0199-02-02' AS Date), N'Nam       ', NULL)
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNV], [DiaChiNV], [NS], [GT], [ChucVu]) VALUES (N'N0005', N'Trần Công Tùng', N'Kim Mã', CAST(N'2000-09-09' AS Date), N'Nam       ', NULL)
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNV], [DiaChiNV], [NS], [GT], [ChucVu]) VALUES (N'N0006', N'Nguyễn công Sỹ', N'Trần Cung', CAST(N'1998-03-03' AS Date), N'Nam       ', NULL)
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNV], [DiaChiNV], [NS], [GT], [ChucVu]) VALUES (N'N0007', N'Tô Thanh Huyền', N'Trần Quý kiên', CAST(N'1998-01-06' AS Date), N'Nữ        ', NULL)
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNV], [DiaChiNV], [NS], [GT], [ChucVu]) VALUES (N'N0008', N'Nguyễn Tú Anh', N'Mai Dịch', CAST(N'1998-02-07' AS Date), N'Nữ        ', NULL)
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNV], [DiaChiNV], [NS], [GT], [ChucVu]) VALUES (N'N0009', N'Nguyễn Duy Quang', N'Quan Hoa', CAST(N'1998-02-05' AS Date), N'Nam       ', NULL)
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNV], [DiaChiNV], [NS], [GT], [ChucVu]) VALUES (N'N0010', N'Phạm Quang Trung', N'Quan Hoa', CAST(N'1998-02-05' AS Date), N'Nam       ', NULL)
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNV], [DiaChiNV], [NS], [GT], [ChucVu]) VALUES (N'N0011', N'Lê Quốc Huy', N'Lò Sũ', CAST(N'1998-08-08' AS Date), N'Nam       ', NULL)
INSERT [dbo].[PhieuNhap] ([SoPN], [NgayNhap], [MaNhanVien], [TongTienNhap], [MaNhaCungCap]) VALUES (N'P0001', CAST(N'2019-01-01 00:00:00.000' AS DateTime), N'N0001', NULL, N'N0001')
INSERT [dbo].[PhieuNhap] ([SoPN], [NgayNhap], [MaNhanVien], [TongTienNhap], [MaNhaCungCap]) VALUES (N'P0002', CAST(N'2019-02-03 00:00:00.000' AS DateTime), N'N0001', NULL, N'N0004')
INSERT [dbo].[PhieuNhap] ([SoPN], [NgayNhap], [MaNhanVien], [TongTienNhap], [MaNhaCungCap]) VALUES (N'P0003', CAST(N'2019-06-09 00:00:00.000' AS DateTime), N'N0005', NULL, N'N0001')
INSERT [dbo].[PhieuNhap] ([SoPN], [NgayNhap], [MaNhanVien], [TongTienNhap], [MaNhaCungCap]) VALUES (N'P0004', CAST(N'2018-09-05 00:00:00.000' AS DateTime), N'N0002', NULL, N'N0003')
INSERT [dbo].[PhieuNhap] ([SoPN], [NgayNhap], [MaNhanVien], [TongTienNhap], [MaNhaCungCap]) VALUES (N'P0005', CAST(N'2018-09-09 00:00:00.000' AS DateTime), N'N0004', NULL, N'N0001')
INSERT [dbo].[PhieuNhap] ([SoPN], [NgayNhap], [MaNhanVien], [TongTienNhap], [MaNhaCungCap]) VALUES (N'P0006', CAST(N'2019-10-10 00:00:00.000' AS DateTime), N'N0008', NULL, N'N0004')
INSERT [dbo].[PhieuNhap] ([SoPN], [NgayNhap], [MaNhanVien], [TongTienNhap], [MaNhaCungCap]) VALUES (N'P0007', CAST(N'2019-11-03 00:00:00.000' AS DateTime), N'N0010', NULL, N'N0005')
INSERT [dbo].[PhieuNhap] ([SoPN], [NgayNhap], [MaNhanVien], [TongTienNhap], [MaNhaCungCap]) VALUES (N'P0008', CAST(N'2019-10-15 00:00:00.000' AS DateTime), N'N0011', NULL, N'N0004')
INSERT [dbo].[PhieuNhap] ([SoPN], [NgayNhap], [MaNhanVien], [TongTienNhap], [MaNhaCungCap]) VALUES (N'P0009', CAST(N'2019-12-12 00:00:00.000' AS DateTime), N'N0010', NULL, N'N0006')
INSERT [dbo].[PhieuNhap] ([SoPN], [NgayNhap], [MaNhanVien], [TongTienNhap], [MaNhaCungCap]) VALUES (N'P0010', CAST(N'2020-07-09 00:00:00.000' AS DateTime), N'N0006', NULL, N'N0007')
INSERT [dbo].[PhieuNhap] ([SoPN], [NgayNhap], [MaNhanVien], [TongTienNhap], [MaNhaCungCap]) VALUES (N'P0011', CAST(N'2020-10-10 00:00:00.000' AS DateTime), N'N0003', NULL, N'N0001')
INSERT [dbo].[PhieuNhap] ([SoPN], [NgayNhap], [MaNhanVien], [TongTienNhap], [MaNhaCungCap]) VALUES (N'P0012', CAST(N'2020-12-10 00:00:00.000' AS DateTime), N'N0002', NULL, N'N0001')
INSERT [dbo].[ThongTinSanPham] ([MaSP], [TenSP], [GiaBan], [MoTaSP], [XuatXu], [MaLoaiSanPham], [MaKhuyenMai], [img]) VALUES (N'S0001', N'YSL lipstick', 900000, N'lipstick for all girls', N'USA', N'M0001', N'KM001', N's2382562-main-zoom.jpg')
INSERT [dbo].[ThongTinSanPham] ([MaSP], [TenSP], [GiaBan], [MoTaSP], [XuatXu], [MaLoaiSanPham], [MaKhuyenMai], [img]) VALUES (N'S0002', N'3CE lipstick', 300000, N'Korea lipstick', N'Korea', N'M0001', N'     ', N'images.jpg')
INSERT [dbo].[ThongTinSanPham] ([MaSP], [TenSP], [GiaBan], [MoTaSP], [XuatXu], [MaLoaiSanPham], [MaKhuyenMai], [img]) VALUES (N'S0003', N'Mamonde toner', 250000, N'Toner for smooth skin', N'Korea', N'M0002', N'KM001', N'mamonde-rose-water-toner-_-rose-water-toner.jpg')
INSERT [dbo].[ThongTinSanPham] ([MaSP], [TenSP], [GiaBan], [MoTaSP], [XuatXu], [MaLoaiSanPham], [MaKhuyenMai], [img]) VALUES (N'S0004', N'Huda Beauty', 1000000, N'High-end eyes shadow', N'USA', N'M0003', NULL, N'bang-mau-mat-huda-beauty-mercury-retrograde-18-o_633cbd1e75f247488e373c3a605478fb_master.jpg')
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD  CONSTRAINT [FK_Cart_CartDetail] FOREIGN KEY([CartId])
REFERENCES [dbo].[Cart] ([CartId])
GO
ALTER TABLE [dbo].[CartDetail] CHECK CONSTRAINT [FK_Cart_CartDetail]
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD  CONSTRAINT [FK_SP_CartDetail] FOREIGN KEY([MaSP])
REFERENCES [dbo].[Kho] ([MaSP])
GO
ALTER TABLE [dbo].[CartDetail] CHECK CONSTRAINT [FK_SP_CartDetail]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_HD] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_CTHD_HD]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_SP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[Kho] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_CTHD_SP]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_CTPN_PN] FOREIGN KEY([SoPN])
REFERENCES [dbo].[PhieuNhap] ([SoPN])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [FK_CTPN_PN]
GO
ALTER TABLE [dbo].[ChiTietQuanLyKho]  WITH CHECK ADD  CONSTRAINT [FK_CTQLK_QLK] FOREIGN KEY([SoPhieuQL])
REFERENCES [dbo].[QuanLyKho] ([SoPhieuQL])
GO
ALTER TABLE [dbo].[ChiTietQuanLyKho] CHECK CONSTRAINT [FK_CTQLK_QLK]
GO
ALTER TABLE [dbo].[ChiTietQuanLyKho]  WITH CHECK ADD  CONSTRAINT [FK_CTQLK_SP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[Kho] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietQuanLyKho] CHECK CONSTRAINT [FK_CTQLK_SP]
GO
ALTER TABLE [dbo].[CungCapSP]  WITH CHECK ADD  CONSTRAINT [FK_CungCapSP_NhaCungCap] FOREIGN KEY([MaNhaCungCap])
REFERENCES [dbo].[NhaCungCap] ([MaNhaCungCap])
GO
ALTER TABLE [dbo].[CungCapSP] CHECK CONSTRAINT [FK_CungCapSP_NhaCungCap]
GO
ALTER TABLE [dbo].[CungCapSP]  WITH CHECK ADD  CONSTRAINT [FK_CungCapSP_SP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[Kho] ([MaSP])
GO
ALTER TABLE [dbo].[CungCapSP] CHECK CONSTRAINT [FK_CungCapSP_SP]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KH] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KH]
GO
ALTER TABLE [dbo].[HoaDon_TT]  WITH CHECK ADD  CONSTRAINT [FK_HD_TT] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[HoaDon_TT] CHECK CONSTRAINT [FK_HD_TT]
GO
ALTER TABLE [dbo].[HoaDon_TT]  WITH CHECK ADD  CONSTRAINT [FK_HD_TT1] FOREIGN KEY([MaTT])
REFERENCES [dbo].[TrangThaiDonHang] ([MaTT])
GO
ALTER TABLE [dbo].[HoaDon_TT] CHECK CONSTRAINT [FK_HD_TT1]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PN_NCC] FOREIGN KEY([MaNhaCungCap])
REFERENCES [dbo].[NhaCungCap] ([MaNhaCungCap])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PN_NCC]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PN_NV] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PN_NV]
GO
ALTER TABLE [dbo].[QuanLyKho]  WITH CHECK ADD  CONSTRAINT [FK_QLK_NV] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[QuanLyKho] CHECK CONSTRAINT [FK_QLK_NV]
GO
ALTER TABLE [dbo].[ThongTinSanPham]  WITH CHECK ADD  CONSTRAINT [FK_ThongTinSanPham_KM] FOREIGN KEY([MaKhuyenMai])
REFERENCES [dbo].[KhuyenMai] ([MaKhuyenMai])
GO
ALTER TABLE [dbo].[ThongTinSanPham] CHECK CONSTRAINT [FK_ThongTinSanPham_KM]
GO
ALTER TABLE [dbo].[ThongTinSanPham]  WITH CHECK ADD  CONSTRAINT [FK_ThongTinSanPham_LoaiSP] FOREIGN KEY([MaLoaiSanPham])
REFERENCES [dbo].[LoaiSanPham] ([MaLoaiSanPham])
GO
ALTER TABLE [dbo].[ThongTinSanPham] CHECK CONSTRAINT [FK_ThongTinSanPham_LoaiSP]
GO
ALTER TABLE [dbo].[ThongTinSanPham]  WITH CHECK ADD  CONSTRAINT [FK_ThongTinSanPham_SP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[Kho] ([MaSP])
GO
ALTER TABLE [dbo].[ThongTinSanPham] CHECK CONSTRAINT [FK_ThongTinSanPham_SP]
GO
/****** Object:  StoredProcedure [dbo].[Kho_SelectAll]    Script Date: 12/4/2020 8:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Kho_SelectAll]
AS
BEGIN 
SELECT k.MaSP, SoLuongTrongKho, TenSP FROM Kho k, ThongTinSanPham t WHERE k.MaSP=t.MaSP
END 
GO
/****** Object:  StoredProcedure [dbo].[NEW_PRODUCT]    Script Date: 12/4/2020 8:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NEW_PRODUCT]
AS
BEGIN 
SELECT TOP(4) MaSP, TenSP, GiaBan, MoTaSP, XuatXu, MaLoaiSanPham, MaKhuyenMai, img
FROM ThongTinSanPham
ORDER BY MaSP DESC
END
GO
/****** Object:  StoredProcedure [dbo].[SanPham_SelectAll]    Script Date: 12/4/2020 8:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SanPham_SelectAll]
AS
BEGIN 
SELECT *
FROM ThongTinSanPham 
ORDER BY (GiaBan) ASC
END 
GO
/****** Object:  StoredProcedure [dbo].[Sp_Account_Login]    Script Date: 12/4/2020 8:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Sp_Account_Login] ( @username VARCHAR(20), @password VARCHAR(20))
AS
BEGIN
DECLARE @count int 
DECLARE @res bit
SELECT @count = count(*) FROM ACC_USER WHERE Username = @username and Userpw = @password
IF @count >0 
set @res = 1
else 
set @res = 0

select @res
end
GO
USE [master]
GO
ALTER DATABASE [BanMyPham] SET  READ_WRITE 
GO
