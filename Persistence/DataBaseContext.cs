using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Persistence.Entities;

namespace Persistence
{
    public class DatabaseContext : DbContext
    {
        public DbSet<Game> Games { get; set; }

        public DbSet<Player> Players { get; set; }

        public DbSet<Line> Lines { get; set; }

        public DbSet<Column> Columns { get; set; }

        public DbSet<Color> Colors { get; set; }

        public DbSet<Parameter> Parameters { get; set; }

        public void CreateDataBase()
        {
            using (var dataContext = new DatabaseContext())
            {
                dataContext.Database.Create();
            }
        }
    }
}
