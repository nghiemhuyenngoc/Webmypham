namespace Model.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietPhieuNhap")]
    public partial class ChiTietPhieuNhap
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(5)]
        public string SoPN { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(5)]
        public string MaSP { get; set; }

        public DateTime? NSX { get; set; }

        public DateTime? HSD { get; set; }

        public int? SoLuongNhap { get; set; }

        public int? GiaNhap { get; set; }

        public int? ThanhTienNhap { get; set; }

        public virtual PhieuNhap PhieuNhap { get; set; }
    }
}
