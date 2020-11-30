namespace Model.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("QuanLyKho")]
    public partial class QuanLyKho
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public QuanLyKho()
        {
            ChiTietQuanLyKhoes = new HashSet<ChiTietQuanLyKho>();
        }

        [Key]
        [StringLength(5)]
        public string SoPhieuQL { get; set; }

        public DateTime? NgayKT { get; set; }

        [StringLength(5)]
        public string MaNhanVien { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietQuanLyKho> ChiTietQuanLyKhoes { get; set; }

        public virtual NhanVien NhanVien { get; set; }
    }
}
