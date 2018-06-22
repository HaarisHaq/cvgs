using CVGS.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace CVGS.Models
{
    public class ConestogaVideogameStoreDbContext : DbContext
    {
        public ConestogaVideogameStoreDbContext()
            : base("DefaultConnection")
        {
        }

        public static ConestogaVideogameStoreDbContext Create()
        {
            return new ConestogaVideogameStoreDbContext();
        }

        public DbSet<User> Member { get; set; }
        public DbSet<Game> Game { get; set; }
        public DbSet<ProductInformation> GameDetail { get; set; }
        public DbSet<GameReview> GameReview { get; set; }
        public DbSet<Report> Report { get; set; }
        public DbSet<ReportType> ReportType { get; set; }
        public DbSet<WishList> WishList { get; set; }
        public DbSet<Event> Event { get; set; }
        public DbSet<EventType> EventType { get; set; }
        public DbSet<EventAttendee> EventAttendee { get; set; }
        public DbSet<RelativeList> RelativeList { get; set; }
        public DbSet<UserStatus> UserRank { get; set; }
        public DbSet<Cart> Cart { get; set; }
        public DbSet<Order> Order { get; set; }
        public DbSet<OrderItem> OrderItems { get; set; }
    }
}