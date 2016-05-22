using System.Collections.Generic;
using Persistence;
using Persistence.Entities;
using Persistence.Repositories;
using Domain.Enums;

namespace Domain.Services
{
    public class GameService
    {
        public Game Get(int id)
        {
            Game game;
            using (var dataContext = new DatabaseContext())
            {
                game = new GameRepository(dataContext).Get(id);
            }

            return game;
        }

        public bool Insert(Game game)
        {
            bool success;
            using (var dataContext = new DatabaseContext())
            {
                success = new GameRepository(dataContext).Insert(game);
            }

            return success;
        }

        public bool Update(Game game)
        {
            bool success;
            using (var dataContext = new DatabaseContext())
            {
                success = new GameRepository(dataContext).Update(game);
            }

            return success;
        }

        public bool Remove(int id)
        {
            bool success;
            using (var dataContext = new DatabaseContext())
            {
                success = new GameRepository(dataContext).Remove(id);
            }

            return success;
        }

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