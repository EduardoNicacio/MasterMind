using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Persistence.Entities;
using Persistence;

namespace Persistence.Repositories
{
    public class PlayerRepository
    {
        private readonly DatabaseContext _dataContext;

        public PlayerRepository(DatabaseContext dataContext)
        {
            _dataContext = dataContext;
        }

        public Player Get(int id)
        {
            return _dataContext.Players.Find(id);
        }

        public bool Insert(Player player)
        {
            _dataContext.Players.Add(player);
            _dataContext.SaveChanges();
            return true;
        }

        public bool Update(Player player)
        {
            var playerDb = Get(player.Id);
            _dataContext.Entry(playerDb).CurrentValues.SetValues(player);
            _dataContext.SaveChanges();

            return true;
        }

        public bool Remove(int id)
        {
            var player = Get(id);
            _dataContext.Players.Remove(player);
            _dataContext.SaveChanges();

            return true;
        }
    }
}
