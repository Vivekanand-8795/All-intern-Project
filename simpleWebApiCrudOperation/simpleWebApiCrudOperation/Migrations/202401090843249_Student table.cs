namespace simpleWebApiCrudOperation.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Studenttable : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.StudentDetails",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                        City = c.String(),
                        Email = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.StudentDetails");
        }
    }
}
