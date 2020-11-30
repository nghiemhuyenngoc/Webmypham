namespace Model.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CungCapSP")]
    public partial class CungCapSP
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(5)]
        public string MaNhaCungCap { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(5)]
        public string MaSP { get; set; }

        public int? GiaNhap { get; set; }

        public virtual NhaCungCap NhaCungCap { get; set; }

        public virtual Kho Kho { get; set; }
    }
}
