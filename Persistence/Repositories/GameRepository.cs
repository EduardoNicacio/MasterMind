// <copyright file="GameRepository.cs" company="VanHackathon May 2016.">
// Copyleft Alexandre Rodrigues, Eduardo Nicacio, Lucas Lucci 2016.
// </copyright>
// <date>21/05/2016</date>
// <summary>Game repository.</summary>

namespace Persistence.Repositories
{
    using System.Data.Entity;
    using System.Linq;
    using Persistence.Entities;

    /// <summary>
    /// Game repository.
    /// </summary>
    public class GameRepository
    {
        private readonly DatabaseContext _dataContext;

        /// <summary>
        /// Initializes a new instance of the <see cref="GameRepository" /> class.
        /// </summary>
        /// <param name="dataContext">Database context.</param>
        public GameRepository(DatabaseContext dataContext)
        {
            _dataContext = dataContext;
        }

        /// <summary>
        /// Returns an instance of Game that matches to the given id.
        /// </summary>
        /// <param name="id">Game id.</param>
        /// <returns>Game object.</returns>
        public Game Get(int id)
        {
            return _dataContext.Games.Include(g => g.Players)
                .Include(g => g.Code)
                .Include(g => g.Lines)
                .First(g => g.Id == id);
        }

        /// <summary>
        /// Insert a new Game into DB.
        /// </summary>
        /// <param name="game">Game object.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Insert(Game game)
        {
            _dataContext.Games.Add(game);
            _dataContext.SaveChanges();

            return true;
        }

        /// <summary>
        /// Update a Game into DB.
        /// </summary>
        /// <param name="game">Game object.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Update(Game game)
        {
            var gameDb = Get(game.Id);
            _dataContext.Entry(gameDb).CurrentValues.SetValues(game);
            _dataContext.SaveChanges();

            return true;
        }

        /// <summary>
        /// Remove a Game from DB given its id.
        /// </summary>
        /// <param name="id">Game id.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Remove(int id)
        {
            var game = Get(id);
            _dataContext.Games.Remove(game);
            _dataContext.SaveChanges();

            return true;
        }
    }
}