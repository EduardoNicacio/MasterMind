using System.Data.Entity;
using System.Linq;
using Persistence.Entities;

namespace Persistence.Repositories
{
    public class GameRepository
    {
        private readonly DatabaseContext _dataContext;

        public GameRepository(DatabaseContext dataContext)
        {
            _dataContext = dataContext;
        }

        public Game Get(int id)
        {
            return _dataContext.Games.Include(g => g.Players)
                .Include(g => g.Code)
                .Include(g => g.Lines)
                .First(g => g.Id == id);
        }

        public bool Insert(Game game)
        {
            _dataContext.Games.Add(game);
            _dataContext.SaveChanges();

            return true;
        }

        public bool Update(Game game)
        {
            var gameDb = Get(game.Id);
            _dataContext.Entry(gameDb).CurrentValues.SetValues(game);
            _dataContext.SaveChanges();

            return true;
        }

        public bool Remove(int id)
        {
            var game = Get(id);
            _dataContext.Games.Remove(game);
            _dataContext.SaveChanges();

            return true;
        }
    }
}