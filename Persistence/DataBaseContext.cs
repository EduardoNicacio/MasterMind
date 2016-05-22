// <copyright file="DataBaseContext.cs" company="VanHackathon May 2016.">
// Copyleft Alexandre Rodrigues, Eduardo Nicacio, Lucas Lucci 2016.
// </copyright>
// <date>21/05/2016</date>
// <summary>Database Context.</summary>

namespace Persistence
{
    using Persistence.Entities;
    using System.Data.Entity;

    /// <summary>
    /// Database context class.
    /// </summary>
    public class DatabaseContext : DbContext
    {
        /// <summary>
        /// DbSet of Game objects.
        /// </summary>
        public DbSet<Game> Games { get; set; }

        /// <summary>
        /// DbSet of Player objects.
        /// </summary>
        public DbSet<Player> Players { get; set; }

        /// <summary>
        /// DbSet of Line objects.
        /// </summary>
        public DbSet<Line> Lines { get; set; }

        /// <summary>
        /// DbSet of Column objects.
        /// </summary>
        public DbSet<Column> Columns { get; set; }

        /// <summary>
        /// DbSet of Color objects.
        /// </summary>
        public DbSet<Color> Colors { get; set; }

        /// <summary>
        /// DbSet of Parameter objects.
        /// </summary>
        public DbSet<Parameter> Parameters { get; set; }

        /// <summary>
        /// Creates a new DB if it doesn't exist.
        /// </summary>
        public void CreateDataBase()
        {
            using (var dataContext = new DatabaseContext())
            {
                dataContext.Database.Create();
            }
        }
    }
}