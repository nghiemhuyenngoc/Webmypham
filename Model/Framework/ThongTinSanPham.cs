namespace Model.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ThongTinSanPham")]
    public partial class ThongTinSanPham
    {
        [Key]
        [StringLength(5)]
        public string MaSP { get; set; }

        [Column(TypeName = "ntext")]
        public string TenSP { get; set; }

        public int? GiaBan { get; set; }

        [Column(TypeName = "ntext")]
        public string MoTaSP { get; set; }

        [Column(TypeName = "ntext")]
        public string XuatXu { get; set; }

        [StringLength(5)]
        public string MaLoaiSanPham { get; set; }

        [StringLength(5)]
        public string MaKhuyenMai { get; set; }

        [Column(TypeName = "text")]
        public string img { get; set; }

        public virtual Kho Kho { get; set; }

        public virtual KhuyenMai KhuyenMai { get; set; }

        public virtual LoaiSanPham LoaiSanPham { get; set; }
    }
}
