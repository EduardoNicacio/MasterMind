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
        /// <summary>
        /// Returns an instance of Color that matches to the id parameter.
        /// </summary>
        /// <param name="id">Color id.</param>
        /// <returns>Color object.</returns>
        public Color Get(int id)
        {
            Color color;
            using (var dataContext = new DatabaseContext())
            {
                color = new ColorRepository(dataContext).Get(id);
            }

            return color;
        }

        /// <summary>
        /// Returns a collection of Color.
        /// </summary>
        /// <param name="quantity">Quantity of colors to return.</param>
        /// <returns>IList of Color objects.</returns>
        public IList<Color> GetListRandom(int quantity)
        {
            IList<Color> colors;
            using (var dataContext = new DatabaseContext())
            {
                colors = new ColorRepository(dataContext).GetListRandom(quantity);
            }

            return colors;
        }

        /// <summary>
        /// Insert a new Color into DB.
        /// </summary>
        /// <param name="color">Color object.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Insert(Color color)
        {
            bool success;

            using (var dataContext = new DatabaseContext())
            {
                success = new ColorRepository(dataContext).Insert(color);
            }

            return success;
        }

        /// <summary>
        /// Update a Color into DB.
        /// </summary>
        /// <param name="color">Color object.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Update(Color color)
        {
            bool success;

            using (var dataContext = new DatabaseContext())
            {
                success = new ColorRepository(dataContext).Update(color);
            }

            return success;
        }

        /// <summary>
        /// Remove a Color from DB.
        /// </summary>
        /// <param name="id">Color id.</param>
        /// <returns>True in case of success; false instead.</returns>
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