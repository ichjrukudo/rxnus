namespace WebAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ItemMaster")]
    public partial class ItemMaster
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ItemMaster()
        {
            ItemMasterInventories = new HashSet<ItemMasterInventory>();
        }

        [Key]
        [StringLength(50)]
        public string ItemMasterID_PK { get; set; }

        [StringLength(255)]
        public string IMPack { get; set; }

        [StringLength(255)]
        public string IMDescription { get; set; }

        [StringLength(255)]
        public string IMImageData { get; set; }

        [StringLength(255)]
        public string IMIsHazardousMaterial { get; set; }

        [StringLength(50)]
        public string IMExpirationDate { get; set; }

        [StringLength(10)]
        public string IMUnitPrice { get; set; }

        [StringLength(10)]
        public string IMWidth { get; set; }

        [StringLength(10)]
        public string IMLength { get; set; }

        [StringLength(10)]
        public string IMHeight { get; set; }

        [StringLength(255)]
        public string IMIsPrePack { get; set; }

        [StringLength(255)]
        public string IMPrePackStyle { get; set; }

        [StringLength(255)]
        public string IMCostCenterCode { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ItemMasterInventory> ItemMasterInventories { get; set; }
    }
}
