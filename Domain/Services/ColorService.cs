// <copyright file="ColorService.cs" company="VanHackathon May 2016.">
// Copyleft Alexandre Rodrigues, Eduardo Nicacio, Lucas Lucci 2016.
// </copyright>
// <date>21/05/2016</date>
// <summary>Color Service mapping.</summary>

namespace Domain.Services
{
    using Persistence;
    using Persistence.Entities;
    using Persistence.Repositories;
    using System.Collections.Generic;

    /// <summary>
    /// Color Service mapping.
    /// </summary>
    public class ColorService
    {
        private readonly DatabaseContext _dataContext;

        public ColorService(DatabaseContext dataContext)
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
            return new ColorRepository(_dataContext).Get(id);
        }

        /// <summary>
        /// Returns an instance of Color that matches to the rgb color.
        /// </summary>
        /// <param name="colorRgb">Color Rgb.</param>
        /// <returns>Color object.</returns>
        public Color GetByColor(string colorRgb)
        {
            return new ColorRepository(_dataContext).GetByColor(colorRgb);
        }

        /// <summary>
        /// Returns a collection of Color.
        /// </summary>
        /// <param name="quantity">Quantity of colors to return.</param>
        /// <returns>IList of Color objects.</returns>
        public IList<Color> GetListRandom(int quantity)
        {
            return new ColorRepository(_dataContext).GetListRandom(quantity);
        }

        /// <summary>
        /// Insert a new Color into DB.
        /// </summary>
        /// <param name="color">Color object.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Insert(Color color)
        {
            return new ColorRepository(_dataContext).Insert(color);
        }

        /// <summary>
        /// Update a Color into DB.
        /// </summary>
        /// <param name="color">Color object.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Update(Color color)
        {
            return new ColorRepository(_dataContext).Update(color);
        }

        /// <summary>
        /// Remove a Color from DB.
        /// </summary>
        /// <param name="id">Color id.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Remove(int id)
        {
            return new ColorRepository(_dataContext).Remove(id);
        }
    }
}