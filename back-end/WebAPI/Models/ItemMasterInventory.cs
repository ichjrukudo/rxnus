namespace WebAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ItemMasterInventory")]
    public partial class ItemMasterInventory
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ItemMasterInventoryID_PK { get; set; }

        [Required]
        [StringLength(50)]
        public string IMIItemMasterID_FK { get; set; }

        [StringLength(255)]
        public string IMISiteID { get; set; }

        [StringLength(255)]
        public string IMIQtyOnHand { get; set; }

        [StringLength(255)]
        public string IMIQtyAllocated { get; set; }

        public virtual ItemMaster ItemMaster { get; set; }
    }
}
