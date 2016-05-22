// <copyright file="PlayerService.cs" company="VanHackathon May 2016.">
// Copyleft Alexandre Rodrigues, Eduardo Nicacio, Lucas Lucci 2016.
// </copyright>
// <date>21/05/2016</date>
// <summary>Player Service mapping.</summary>

namespace Domain.Services
{
    using Persistence;
    using Persistence.Entities;
    using Persistence.Repositories;

    /// <summary>
    /// Player Service mapping.
    /// </summary>
    public class PlayerService
    {
        private readonly DatabaseContext _dataContext;

        public PlayerService(DatabaseContext dataContext)
        {
            _dataContext = dataContext;
        }

        /// <summary>
        /// Returns a Player object that matches to id parameter.
        /// </summary>
        /// <param name="id">Player id.</param>
        /// <returns>Player object.</returns>
        public Player Get(int id)
        {
            return new PlayerRepository(_dataContext).Get(id);
        }

        /// <summary>
        /// Insert a new Player into DB.
        /// </summary>
        /// <param name="player">Player object.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Insert(Player player)
        {
            return new PlayerRepository(_dataContext).Insert(player);
        }

        /// <summary>
        /// Update an existent Player into DB.
        /// </summary>
        /// <param name="player">Player object.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Update(Player player)
        {
            return new PlayerRepository(_dataContext).Update(player);
        }

        /// <summary>
        /// Remove an existent Player from DB.
        /// </summary>
        /// <param name="id">Player id.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Remove(int id)
        {
            return new PlayerRepository(_dataContext).Remove(id);
        }
    }
}