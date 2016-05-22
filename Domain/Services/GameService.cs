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
        private readonly DatabaseContext _dataContext;

        public GameService(DatabaseContext dataContext)
        {
            _dataContext = dataContext;
        }

        /// <summary>
        /// Returns an instance of Game that matches to the id parameter.
        /// </summary>
        /// <param name="id">Game id.</param>
        /// <returns>Game object.</returns>
        public Game Get(int id)
        {
            return new GameRepository(_dataContext).Get(id);

        }

        /// <summary>
        /// Insert a new Game into DB.
        /// </summary>
        /// <param name="game">Game object.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Insert(Game game)
        {
            return new GameRepository(_dataContext).Insert(game);
        }

        /// <summary>
        /// Update a Game into DB.
        /// </summary>
        /// <param name="game">Game object.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Update(Game game)
        {
            return new GameRepository(_dataContext).Update(game);
        }

        /// <summary>
        /// Remove the specified Game from DB.
        /// </summary>
        /// <param name="id">Game id.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Remove(int id)
        {
            return new GameRepository(_dataContext).Remove(id);
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
            var parameterRepository = new ParameterRepository(_dataContext);
            var parameterTotalLines = parameterRepository.Get("TotalLines");
            var totalLines = parameterTotalLines != null ? int.Parse(parameterTotalLines.Value) : 10; //Default 10 lines.

            var game = new Game
            {
                Multiplayer = multiplayer,
                Score = totalLines,
                Status = ((char)(multiplayer ? GameStatus.WaitingPlayer : GameStatus.Started)).ToString(),
                TotalColors = totalColors,
                TotalLines = totalLines,
                Code = CreateCode(totalColors),
                Players = new List<Player> { new Player { Name = playerName } }
            };

            new GameRepository(_dataContext).Insert(game);
            return game;
        }

        /// <summary>
        /// Create a new Game color key.
        /// </summary>
        /// <param name="dataContext">Database context.</param>
        /// <param name="totalColors">Total Colors (1-8)</param>
        /// <returns>Returns a list of Column objects.</returns>
        private List<Column> CreateCode(int totalColors)
        {
            var columns = new List<Column>();
            var colorRepository = new ColorRepository(_dataContext);
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