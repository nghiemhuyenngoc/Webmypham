namespace Model.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("KhuyenMai")]
    public partial class KhuyenMai
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public KhuyenMai()
        {
            ThongTinSanPhams = new HashSet<ThongTinSanPham>();
        }

        [Key]
        [StringLength(5)]
        public string MaKhuyenMai { get; set; }

        [Column(TypeName = "ntext")]
        public string TenKhuyenMai { get; set; }

        public int? ChietKhau { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ThongTinSanPham> ThongTinSanPhams { get; set; }
    }
}
