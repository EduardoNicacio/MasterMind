using System;
using System.Collections.Generic;
using System.Linq;
using Persistence.Entities;

namespace Persistence.Repositories
{
    public class ColorRepository
    {
        private readonly DatabaseContext _dataContext;

        public ColorRepository(DatabaseContext dataContext)
        {
            _dataContext = dataContext;
        }

        public Color Get(int id)
        {
            return _dataContext.Colors.Find(id);
        }

        public IList<Color> GetListRandom(int quantity)
        {
            return _dataContext.Colors.OrderBy(r => Guid.NewGuid()).Take(quantity).ToList();
        }

        public bool Insert(Color color)
        {
            _dataContext.Colors.Add(color);
            _dataContext.SaveChanges();

            return true;
        }

        public bool Update(Color color)
        {
            var colorDb = Get(color.Id);
            _dataContext.Entry(colorDb).CurrentValues.SetValues(color);
            _dataContext.SaveChanges();

            return true;
        }

        public bool Remove(int id)
        {
            var color = Get(id);
            _dataContext.Colors.Remove(color);
            _dataContext.SaveChanges();

            return true;
        }
    }
}