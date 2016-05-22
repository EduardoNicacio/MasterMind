using Persistence;
using Persistence.Entities;
using Persistence.Repositories;

namespace Domain.Services
{
    public class PlayerService
    {
        public Player Get(int id)
        {
            Player player;
            using (var dataContext = new DatabaseContext())
            {
                player = new PlayerRepository(dataContext).Get(id);
            }

            return player;
        }

        public bool Insert(Player player)
        {
            bool success;
            using (var dataContext = new DatabaseContext())
            {
                success = new PlayerRepository(dataContext).Insert(player);
            }

            return success;
        }

        public bool Update(Player player)
        {
            bool success;
            using (var dataContext = new DatabaseContext())
            {
                success = new PlayerRepository(dataContext).Update(player);
            }

            return success;
        }

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