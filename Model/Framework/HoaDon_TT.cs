namespace Model.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class HoaDon_TT
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(5)]
        public string MaTT { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(5)]
        public string MaHoaDon { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayCapNhat { get; set; }

        public virtual HoaDon HoaDon { get; set; }

        public virtual TrangThaiDonHang TrangThaiDonHang { get; set; }
    }
}
