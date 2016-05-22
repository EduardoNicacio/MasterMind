// <copyright file="ColorRepository.cs" company="VanHackathon May 2016.">
// Copyleft Alexandre Rodrigues, Eduardo Nicacio, Lucas Lucci 2016.
// </copyright>
// <date>21/05/2016</date>
// <summary>Color repository.</summary>

namespace Persistence.Repositories
{
    using Persistence.Entities;
    using System;
    using System.Collections.Generic;
    using System.Linq;

    /// <summary>
    /// Color repository object.
    /// </summary>
    public class ColorRepository
    {
        private readonly DatabaseContext _dataContext;

        /// <summary>
        /// Initializes a new instance of the <see cref="ColorRepository" /> class.
        /// </summary>
        /// <param name="dataContext">Database context.</param>
        public ColorRepository(DatabaseContext dataContext)
        {
            _dataContext = dataContext;
        }

        /// <summary>
        /// Returns an instance of Color that matches to the id parameter.
        /// </summary>
        /// <param name="id">Color id.</param>
        /// <returns>Color object.</returns>
        public Color Get(int id)
        {
            return _dataContext.Colors.Find(id);
        }

        /// <summary>
        /// Returns an instance of Color that matches to the rgb color.
        /// </summary>
        /// <param name="color">Color Rgb.</param>
        /// <returns>Color object.</returns>
        public Color GetByColor(string color)
        {
            return _dataContext.Colors.FirstOrDefault(c => c.Rgb == color);
        }

        /// <summary>
        /// Returns a random list of Color objects.
        /// </summary>
        /// <param name="quantity">Quantity of colors.</param>
        /// <returns>List of Color objects.</returns>
        public IList<Color> GetListRandom(int quantity)
        {
            return _dataContext.Colors.OrderBy(r => Guid.NewGuid()).Take(quantity).ToList();
        }

        /// <summary>
        /// Insert a new Color into DB.
        /// </summary>
        /// <param name="color">Color object.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Insert(Color color)
        {
            _dataContext.Colors.Add(color);
            _dataContext.SaveChanges();

            return true;
        }

        /// <summary>
        /// Update an existent Color into DB.
        /// </summary>
        /// <param name="color">Color object.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Update(Color color)
        {
            var colorDb = Get(color.Id);
            _dataContext.Entry(colorDb).CurrentValues.SetValues(color);
            _dataContext.SaveChanges();

            return true;
        }

        /// <summary>
        /// Remove a Color from DB given its id.
        /// </summary>
        /// <param name="id">Color id.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Remove(int id)
        {
            var color = Get(id);
            _dataContext.Colors.Remove(color);
            _dataContext.SaveChanges();

            return true;
        }
    }
}