using Persistence;
using Persistence.Entities;
using Persistence.Repositories;

namespace Domain.Services
{
    public class ParameterService
    {
        public Parameter Get(string name)
        {
            Parameter parameter;
            using (var dataContext = new DatabaseContext())
            {
                parameter = new ParameterRepository(dataContext).Get(name);
            }

            return parameter;
        }

        public bool Insert(Parameter parameter)
        {
            bool success;
            using (var dataContext = new DatabaseContext())
            {
                success = new ParameterRepository(dataContext).Insert(parameter);
            }

            return success;
        }

        public bool Update(Parameter parameter)
        {
            bool success;
            using (var dataContext = new DatabaseContext())
            {
                success = new ParameterRepository(dataContext).Update(parameter);
            }

            return success;
        }

        public bool Remove(string name)
        {
            bool success;
            using (var dataContext = new DatabaseContext())
            {
                success = new ParameterRepository(dataContext).Remove(name);
            }

            return success;
        }
    }
}