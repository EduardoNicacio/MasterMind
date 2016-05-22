// <copyright file="ParameterService.cs" company="VanHackathon May 2016.">
// Copyleft Alexandre Rodrigues, Eduardo Nicacio, Lucas Lucci 2016.
// </copyright>
// <date>21/05/2016</date>
// <summary>Parameter Service mapping.</summary>

namespace Domain.Services
{
    using Persistence;
    using Persistence.Entities;
    using Persistence.Repositories;

    /// <summary>
    /// Parameter Service mapping.
    /// </summary>
    public class ParameterService
    {
        private readonly DatabaseContext _dataContext;

        public ParameterService(DatabaseContext dataContext)
        {
            _dataContext = dataContext;
        }

        /// <summary>
        /// Returns an instance of Parameter that matches to name parameter.
        /// </summary>
        /// <param name="name">Parameter name.</param>
        /// <returns>Parameter object.</returns>
        public Parameter Get(string name)
        {
            return new ParameterRepository(_dataContext).Get(name);
        }

        /// <summary>
        /// Insert a new Parameter into DB.
        /// </summary>
        /// <param name="parameter">Parameter object.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Insert(Parameter parameter)
        {
            return new ParameterRepository(_dataContext).Insert(parameter);
        }

        /// <summary>
        /// Update a Parameter into DB.
        /// </summary>
        /// <param name="parameter">Parameter object.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Update(Parameter parameter)
        {
            return new ParameterRepository(_dataContext).Update(parameter);
        }

        /// <summary>
        /// Remove a Parameter from DB.
        /// </summary>
        /// <param name="name">Parameter name.</param>
        /// <returns>True in case of success; false instead.</returns>
        public bool Remove(string name)
        {
            return new ParameterRepository(_dataContext).Remove(name);
        }
    }
}