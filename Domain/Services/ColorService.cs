using System.Collections.Generic;
using Persistence;
using Persistence.Entities;
using Persistence.Repositories;

namespace Domain.Services
{
    public class ColorService
    {
        public Color Get(int id)
        {
            Color color;
            using (var dataContext = new DatabaseContext())
            {
                color = new ColorRepository(dataContext).Get(id);
            }

            return color;
        }

        public IList<Color> GetListRandom(int quantity)
        {
            IList<Color> colors;
            using (var dataContext = new DatabaseContext())
            {
                colors = new ColorRepository(dataContext).GetListRandom(quantity);
            }

            return colors;
        }

        public bool Insert(Color color)
        {
            bool success;
            using (var dataContext = new DatabaseContext())
            {
                success = new ColorRepository(dataContext).Insert(color);
            }

            return success;
        }

        public bool Update(Color color)
        {
            bool success;
            using (var dataContext = new DatabaseContext())
            {
                success = new ColorRepository(dataContext).Update(color);
            }

            return success;
        }

        public bool Remove(int id)
        {
            bool success;
            using (var dataContext = new DatabaseContext())
            {
                success = new ColorRepository(dataContext).Remove(id);
            }

            return success;
        }
    }
}