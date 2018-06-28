namespace WebAPI.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class ApplicationContext : DbContext
    {
        public ApplicationContext()
            : base("name=ApplicationEntities")
        {
            Database.SetInitializer<ApplicationContext>(new DropCreateDatabaseIfModelChanges<ApplicationContext>());
        }

        public virtual DbSet<ItemMaster> ItemMasters { get; set; }
        public virtual DbSet<ItemMasterInventory> ItemMasterInventories { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ItemMaster>()
                .HasMany(e => e.ItemMasterInventories)
                .WithRequired(e => e.ItemMaster)
                .HasForeignKey(e => e.IMIItemMasterID_FK)
                .WillCascadeOnDelete(false);
        }
    }
}
