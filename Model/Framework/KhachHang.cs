namespace Model.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("KhachHang")]
    public partial class KhachHang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public KhachHang()
        {
            HoaDons = new HashSet<HoaDon>();
        }

        [Key]
        [StringLength(5)]
        public string MaKH { get; set; }

        [Column(TypeName = "ntext")]
        public string TenKH { get; set; }

        [Column(TypeName = "ntext")]
        public string DiaChiKH { get; set; }

        [Column(TypeName = "ntext")]
        public string DuongPhoKH { get; set; }

        [Column(TypeName = "ntext")]
        public string QuanHuyenKH { get; set; }

        [Column(TypeName = "ntext")]
        public string ThanhPhoKH { get; set; }

        [Column(TypeName = "ntext")]
        public string QuocGiaKH { get; set; }

        public int? SoLanMua { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HoaDon> HoaDons { get; set; }
    }
}
