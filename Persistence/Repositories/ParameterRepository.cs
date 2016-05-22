// <copyright file="ParameterRepository.cs" company="VanHackathon May 2016.">
// Copyleft Alexandre Rodrigues, Eduardo Nicacio, Lucas Lucci 2016.
// </copyright>
// <date>21/05/2016</date>
// <summary>Parameter repository.</summary>

namespace Persistence.Repositories
{
    using Persistence.Entities;

    /// <summary>
    /// Parameter repository.
    /// </summary>
    public class ParameterRepository
    {
        private readonly DatabaseContext _dataContext;

        /// <summary>
        /// Initializes a new instance of the <see cref="ParameterRepository" /> class.
        /// </summary>
        /// <param name="dataContext">Database context.</param>
        public ParameterRepository(DatabaseContext dataContext)
        {
            _dataContext = dataContext;
        }

        /// <summary>
        /// Returns an instance of Parameter that matches to the name parameter.
        /// </summary>
        /// <param name="name">Parameter name.</param>
        /// <returns>Parameter object.</returns>
        public Parameter Get(string name)
        {
            return _dataContext.Parameters.Find(name);
        }

        /// <summary>
        /// Insert a new Parameter into DB.
        /// </summary>
        /// <param name="parameter">Parameter object.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Insert(Parameter parameter)
        {
            _dataContext.Parameters.Add(parameter);
            _dataContext.SaveChanges();

            return true;
        }

        /// <summary>
        /// Update a Parameter into DB.
        /// </summary>
        /// <param name="parameter">Parameter obj.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Update(Parameter parameter)
        {
            var parameterDb = Get(parameter.Name);
            _dataContext.Entry(parameterDb).CurrentValues.SetValues(parameter);
            _dataContext.SaveChanges();

            return true;
        }

        /// <summary>
        /// Remove a Parameter from DB given its name.
        /// </summary>
        /// <param name="name">Parameter name.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Remove(string name)
        {
            var parameter = Get(name);
            _dataContext.Parameters.Remove(parameter);
            _dataContext.SaveChanges();

            return true;
        }
    }
}