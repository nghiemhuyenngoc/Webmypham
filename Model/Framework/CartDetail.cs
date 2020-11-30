namespace Model.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CartDetail")]
    public partial class CartDetail
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int CartId { get; set; }

        [StringLength(5)]
        public string MaSP { get; set; }

        public int? SoLuong { get; set; }

        public virtual Cart Cart { get; set; }

        public virtual Kho Kho { get; set; }
    }
}
