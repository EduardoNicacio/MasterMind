// <copyright file="PlayerRepository.cs" company="VanHackathon May 2016.">
// Copyleft Alexandre Rodrigues, Eduardo Nicacio, Lucas Lucci 2016.
// </copyright>
// <date>21/05/2016</date>
// <summary>Player repository.</summary>

namespace Persistence.Repositories
{
    using Persistence;
    using Persistence.Entities;

    /// <summary>
    /// Player repository.
    /// </summary>
    public class PlayerRepository
    {
        private readonly DatabaseContext _dataContext;

        /// <summary>
        /// Initializes a new instance of the <see cref="PlayerRepository" /> class.
        /// </summary>
        /// <param name="dataContext">Database context.</param>
        public PlayerRepository(DatabaseContext dataContext)
        {
            _dataContext = dataContext;
        }

        /// <summary>
        /// Returns an instance of Player that matches to id parameter.
        /// </summary>
        /// <param name="id">Player id.</param>
        /// <returns>Player object.</returns>
        public Player Get(int id)
        {
            return _dataContext.Players.Find(id);
        }

        /// <summary>
        /// Insert a new Player into DB.
        /// </summary>
        /// <param name="player">Player object.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Insert(Player player)
        {
            _dataContext.Players.Add(player);
            _dataContext.SaveChanges();
            return true;
        }

        /// <summary>
        /// Update a Player into DB.
        /// </summary>
        /// <param name="player">Player object.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Update(Player player)
        {
            var playerDb = Get(player.Id);
            _dataContext.Entry(playerDb).CurrentValues.SetValues(player);
            _dataContext.SaveChanges();

            return true;
        }

        /// <summary>
        /// Remove a Player from DB that matches to the id parameter.
        /// </summary>
        /// <param name="id">Player id.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Remove(int id)
        {
            var player = Get(id);
            _dataContext.Players.Remove(player);
            _dataContext.SaveChanges();

            return true;
        }
    }
}