namespace Model.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietQuanLyKho")]
    public partial class ChiTietQuanLyKho
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(5)]
        public string SoPhieuQL { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(5)]
        public string MaSP { get; set; }

        public int? SLHong { get; set; }

        public int? SLThua { get; set; }

        public int? SLThieu { get; set; }

        [Column(TypeName = "ntext")]
        public string GhiChu { get; set; }

        public virtual QuanLyKho QuanLyKho { get; set; }

        public virtual Kho Kho { get; set; }
    }
}
