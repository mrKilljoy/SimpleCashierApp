namespace TradingDAL.Models
{
    using System;
    using System.Data.Entity;
    using System.Linq;

    [DbConfigurationType(typeof(MySql.Data.Entity.MySqlEFConfiguration))]
    public class StoreContext : DbContext
    {
        public StoreContext()
            : base("name=StoreContext")
        {
        }

        public StoreContext(string conn_str) : base(conn_str) { }

        public virtual DbSet<Bill> Bills { get; set; }

        public virtual DbSet<EmployeeAccount> Employees { get; set; }

        public virtual DbSet<Sale> Sales { get; set; }

        public virtual DbSet<StoreItem> StoreItems { get; set; }

        public virtual DbSet<StorageItem> StorageItems { get; set; }

        public virtual DbSet<StoragePlace> Storages { get; set; }

        public virtual DbSet<StoreItemCategory> Categories { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            DbConfiguration.SetConfiguration(new MySql.Data.Entity.MySqlEFConfiguration());

            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Bill>().HasMany<Sale>(b => b.SalePositions).WithRequired(b=>b.Bill);

            modelBuilder.Entity<StoragePlace>().HasMany(s => s.Items).WithRequired(s => s.Storage);

            modelBuilder.Entity<StoreItemCategory>().HasMany(c => c.BoundItems).WithRequired(s => s.Category);

            modelBuilder.Entity<Sale>().HasRequired(s => s.Item).WithMany(s => s.ItemSales);

            modelBuilder.Entity<Bill>().HasMany(b => b.SalePositions).WithRequired(b => b.Bill);
        }
    }
}