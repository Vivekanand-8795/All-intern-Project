using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace RestApi_Crud_Demo.Migrations
{
    public partial class ABCD : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_Random",
                table: "Random");

            migrationBuilder.RenameTable(
                name: "Random",
                newName: "Empsdetails");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Empsdetails",
                table: "Empsdetails",
                column: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_Empsdetails",
                table: "Empsdetails");

            migrationBuilder.RenameTable(
                name: "Empsdetails",
                newName: "Random");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Random",
                table: "Random",
                column: "Id");
        }
    }
}
