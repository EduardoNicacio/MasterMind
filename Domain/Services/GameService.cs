// <copyright file="GameService.cs" company="VanHackathon May 2016.">
// Copyleft Alexandre Rodrigues, Eduardo Nicacio, Lucas Lucci 2016.
// </copyright>
// <date>21/05/2016</date>
// <summary>Game Service mapping.</summary>

namespace Domain.Services
{
    using Domain.Enums;
    using Persistence;
    using Persistence.Entities;
    using Persistence.Repositories;
    using System.Collections.Generic;

    /// <summary>
    /// Game Service mapping.
    /// </summary>
    public class GameService
    {
        /// <summary>
        /// Returns an instance of Game that matches to the id parameter.
        /// </summary>
        /// <param name="id">Game id.</param>
        /// <returns>Game object.</returns>
        public Game Get(int id)
        {
            Game game;

            using (var dataContext = new DatabaseContext())
            {
                game = new GameRepository(dataContext).Get(id);
            }

            return game;
        }

        /// <summary>
        /// Insert a new Game into DB.
        /// </summary>
        /// <param name="game">Game object.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Insert(Game game)
        {
            bool success;

            using (var dataContext = new DatabaseContext())
            {
                success = new GameRepository(dataContext).Insert(game);
            }

            return success;
        }

        /// <summary>
        /// Update a Game into DB.
        /// </summary>
        /// <param name="game">Game object.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Update(Game game)
        {
            bool success;

            using (var dataContext = new DatabaseContext())
            {
                success = new GameRepository(dataContext).Update(game);
            }

            return success;
        }

        /// <summary>
        /// Remove the specified Game from DB.
        /// </summary>
        /// <param name="id">Game id.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Remove(int id)
        {
            bool success;

            using (var dataContext = new DatabaseContext())
            {
                success = new GameRepository(dataContext).Remove(id);
            }

            return success;
        }

        /// <summary>
        /// Starts a new Game.
        /// </summary>
        /// <param name="multiplayer">Multiplayer (true or false).</param>
        /// <param name="totalColors">Total colors (1-8).</param>
        /// <param name="playerName">Player name (string).</param>
        /// <returns></returns>
        public Game StartNewGame(bool multiplayer, int totalColors, string playerName)
        {
            Game game;

            using (var dataContext = new DatabaseContext())
            {
                var parameterRepository = new ParameterRepository(dataContext);
                var parameterTotalLines = parameterRepository.Get("TotalLines");
                var totalLines = parameterTotalLines != null ? int.Parse(parameterTotalLines.Value) : 10; //Default 10 lines.

                game = new Game
                {
                    Multiplayer = multiplayer,
                    Score = totalLines,
                    Status = ((char)(multiplayer ? GameStatus.WaitingPlayer : GameStatus.Started)).ToString(),
                    TotalColors = totalColors,
                    TotalLines = totalLines,
                    Code = CreateCode(dataContext, totalColors),
                    Players = new List<Player> { new Player { Name = playerName } }
                };

                new GameRepository(dataContext).Insert(game);
            }

            return game;
        }

        /// <summary>
        /// Create a new Game color key.
        /// </summary>
        /// <param name="dataContext">Database context.</param>
        /// <param name="totalColors">Total Colors (1-8)</param>
        /// <returns>Returns a list of Column objects.</returns>
        private List<Column> CreateCode(DatabaseContext dataContext, int totalColors)
        {
            var columns = new List<Column>();
            var colorRepository = new ColorRepository(dataContext);
            var colors = colorRepository.GetListRandom(totalColors);
            var position = 1;

            foreach (var color in colors)
            {
                var column = new Column
                {
                    Position = position,
                    Color = color,
                    Valid = true
                };

                columns.Add(column);
                position++;
            }

            return columns;
        }
    }
}