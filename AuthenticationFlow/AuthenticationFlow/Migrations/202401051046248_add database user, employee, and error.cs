namespace AuthenticationFlow.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class adddatabaseuseremployeeanderror : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.ErrorLogs",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        ErrorCode = c.String(),
                        ErrorMessage = c.String(),
                        Timestamp = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.ErrorLogs");
        }
    }
}
