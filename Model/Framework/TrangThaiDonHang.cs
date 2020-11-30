namespace Model.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TrangThaiDonHang")]
    public partial class TrangThaiDonHang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TrangThaiDonHang()
        {
            HoaDon_TT = new HashSet<HoaDon_TT>();
        }

        [Key]
        [StringLength(5)]
        public string MaTT { get; set; }

        [Column(TypeName = "ntext")]
        public string TenTT { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HoaDon_TT> HoaDon_TT { get; set; }
    }
}
