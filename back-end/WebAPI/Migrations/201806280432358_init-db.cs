namespace WebAPI.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class initdb : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.ItemMasterInventory",
                c => new
                    {
                        ItemMasterInventoryID_PK = c.Int(nullable: false, identity: true),
                        IMIItemMasterID_FK = c.String(nullable: false, maxLength: 50),
                        IMISiteID = c.String(maxLength: 255),
                        IMIQtyOnHand = c.String(maxLength: 255),
                        IMIQtyAllocated = c.String(maxLength: 255),
                    })
                .PrimaryKey(t => t.ItemMasterInventoryID_PK)
                .ForeignKey("dbo.ItemMaster", t => t.IMIItemMasterID_FK)
                .Index(t => t.IMIItemMasterID_FK);
            
            CreateTable(
                "dbo.ItemMaster",
                c => new
                    {
                        ItemMasterID_PK = c.String(nullable: false, maxLength: 50),
                        IMPack = c.String(maxLength: 255),
                        IMDescription = c.String(maxLength: 255),
                        IMImageData = c.String(maxLength: 255),
                        IMIsHazardousMaterial = c.String(maxLength: 255),
                        IMExpirationDate = c.String(maxLength: 50),
                        IMUnitPrice = c.String(maxLength: 10),
                        IMWidth = c.String(maxLength: 10),
                        IMLength = c.String(maxLength: 10),
                        IMHeight = c.String(maxLength: 10),
                        IMIsPrePack = c.String(maxLength: 255),
                        IMPrePackStyle = c.String(maxLength: 255),
                        IMCostCenterCode = c.String(maxLength: 255),
                    })
                .PrimaryKey(t => t.ItemMasterID_PK);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.ItemMasterInventory", "IMIItemMasterID_FK", "dbo.ItemMaster");
            DropIndex("dbo.ItemMasterInventory", new[] { "IMIItemMasterID_FK" });
            DropTable("dbo.ItemMaster");
            DropTable("dbo.ItemMasterInventory");
        }
    }
}
