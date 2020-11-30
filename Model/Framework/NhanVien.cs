namespace Model.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NhanVien")]
    public partial class NhanVien
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public NhanVien()
        {
            PhieuNhaps = new HashSet<PhieuNhap>();
            QuanLyKhoes = new HashSet<QuanLyKho>();
        }

        [Key]
        [StringLength(5)]
        public string MaNhanVien { get; set; }

        [Column(TypeName = "ntext")]
        public string TenNV { get; set; }

        [Column(TypeName = "ntext")]
        public string DiaChiNV { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NS { get; set; }

        [StringLength(10)]
        public string GT { get; set; }

        [Column(TypeName = "ntext")]
        public string ChucVu { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PhieuNhap> PhieuNhaps { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QuanLyKho> QuanLyKhoes { get; set; }
    }
}
