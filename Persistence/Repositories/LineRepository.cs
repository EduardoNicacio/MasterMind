// <copyright file="LineRepository.cs" company="VanHackathon May 2016.">
// Copyleft Alexandre Rodrigues, Eduardo Nicacio, Lucas Lucci 2016.
// </copyright>
// <date>21/05/2016</date>
// <summary>Line repository.</summary>

namespace Persistence.Repositories
{
    using Persistence;
    using Persistence.Entities;

    /// <summary>
    /// Line repository.
    /// </summary>
    public class LineRepository
    {
        private readonly DatabaseContext _dataContext;

        /// <summary>
        /// Initializes a new instance of the <see cref="LineRepository" /> class.
        /// </summary>
        /// <param name="dataContext">Database context.</param>
        public LineRepository(DatabaseContext dataContext)
        {
            _dataContext = dataContext;
        }

        /// <summary>
        /// Returns an instance of Line that matches to id parameter.
        /// </summary>
        /// <param name="id">Line id.</param>
        /// <returns>Line object.</returns>
        public Line Get(int id)
        {
            return _dataContext.Lines.Find(id);
        }

        /// <summary>
        /// Insert a new Line into DB.
        /// </summary>
        /// <param name="line">Line object.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Insert(Line line)
        {
            _dataContext.Lines.Add(line);
            _dataContext.SaveChanges();
            return true;
        }

        /// <summary>
        /// Update a Line into DB.
        /// </summary>
        /// <param name="line">Line object.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Update(Line line)
        {
            var lineDb = Get(line.Id);
            _dataContext.Entry(lineDb).CurrentValues.SetValues(line);
            _dataContext.SaveChanges();

            return true;
        }

        /// <summary>
        /// Remove a Line from DB that matches to the id parameter.
        /// </summary>
        /// <param name="id">Line id.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Remove(int id)
        {
            var line = Get(id);
            _dataContext.Lines.Remove(line);
            _dataContext.SaveChanges();

            return true;
        }
    }
}