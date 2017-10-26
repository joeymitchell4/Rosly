using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNet.Identity.EntityFramework;
using System.Data.Entity;

namespace Rosly.Models
{
    //[NotMapped]
    //public class User : IdentityUser { }
    //public class Role : IdentityRole { }
    //public class UserRole : IdentityUserRole { }
    //public class Claim : IdentityUserClaim { }
    //public class Login : IdentityUserLogin { }
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public DbSet<Course> Courses { get; set; }
        
        public ApplicationDbContext()
            : base("name=IMSSecurityEntities", throwIfV1Schema: false)
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            //modelBuilder.Entity<User>().ToTable("AspNetUsers");
            //modelBuilder.Entity<Role>().ToTable("AspNetRoles");
            //modelBuilder.Entity<UserRole>().ToTable("AspNetUserRoles");
            //modelBuilder.Entity<Claim>().ToTable("AspNetUserClaims");
            //modelBuilder.Entity<Login>().ToTable("AspNetUserLogins");
            //modelBuilder.Entity<Asp>()
            //modelBuilder.Entity<User>().Property(r => r.Id).HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);
            //modelBuilder.Entity<Role>().Property(r => r.Id).HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);
            //modelBuilder.Entity<Claim>().Property(r => r.Id).HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);
        }

        public static ApplicationDbContext Create()
        {
            return new ApplicationDbContext();
        }

    }
}