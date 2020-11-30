namespace Model.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Cart")]
    public partial class Cart
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int CartId { get; set; }

        [Required]
        [StringLength(5)]
        public string UserId { get; set; }

        public virtual CartDetail CartDetail { get; set; }
    }
}
