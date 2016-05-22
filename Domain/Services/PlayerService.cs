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
        /// <summary>
        /// Returns a Player object that matches to id parameter.
        /// </summary>
        /// <param name="id">Player id.</param>
        /// <returns>Player object.</returns>
        public Player Get(int id)
        {
            Player player;

            using (var dataContext = new DatabaseContext())
            {
                player = new PlayerRepository(dataContext).Get(id);
            }

            return player;
        }

        /// <summary>
        /// Insert a new Player into DB.
        /// </summary>
        /// <param name="player">Player object.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Insert(Player player)
        {
            bool success;

            using (var dataContext = new DatabaseContext())
            {
                success = new PlayerRepository(dataContext).Insert(player);
            }

            return success;
        }

        /// <summary>
        /// Update an existent Player into DB.
        /// </summary>
        /// <param name="player">Player object.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Update(Player player)
        {
            bool success;

            using (var dataContext = new DatabaseContext())
            {
                success = new PlayerRepository(dataContext).Update(player);
            }

            return success;
        }

        /// <summary>
        /// Remove an existent Player from DB.
        /// </summary>
        /// <param name="id">Player id.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Remove(int id)
        {
            bool success;

            using (var dataContext = new DatabaseContext())
            {
                success = new PlayerRepository(dataContext).Remove(id);
            }

            return success;
        }
    }
}