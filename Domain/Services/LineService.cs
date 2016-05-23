// <copyright file="LineService.cs" company="VanHackathon May 2016.">
// Copyleft Alexandre Rodrigues, Eduardo Nicacio, Lucas Lucci 2016.
// </copyright>
// <date>21/05/2016</date>
// <summary>Line Service mapping.</summary>

namespace Domain.Services
{
    using Persistence;
    using Persistence.Entities;
    using Persistence.Repositories;

    /// <summary>
    /// Line Service mapping.
    /// </summary>
    public class LineService
    {
        private readonly DatabaseContext _dataContext;

        public LineService(DatabaseContext dataContext)
        {
            _dataContext = dataContext;
        }

        /// <summary>
        /// Returns a Line object that matches to id parameter.
        /// </summary>
        /// <param name="id">Line id.</param>
        /// <returns>Line object.</returns>
        public Line Get(int id)
        {
            return new LineRepository(_dataContext).Get(id);
        }

        /// <summary>
        /// Insert a new Line into DB.
        /// </summary>
        /// <param name="line">Line object.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Insert(Line line)
        {
            return new LineRepository(_dataContext).Insert(line);
        }

        /// <summary>
        /// Update an existent Line into DB.
        /// </summary>
        /// <param name="line">Line object.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Update(Line line)
        {
            return new LineRepository(_dataContext).Update(line);
        }

        /// <summary>
        /// Remove an existent Line from DB.
        /// </summary>
        /// <param name="id">Line id.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Remove(int id)
        {
            return new LineRepository(_dataContext).Remove(id);
        }
    }
}