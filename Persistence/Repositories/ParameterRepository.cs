using Persistence.Entities;

namespace Persistence.Repositories
{
    public class ParameterRepository
    {
        private readonly DatabaseContext _dataContext;

        public ParameterRepository(DatabaseContext dataContext)
        {
            _dataContext = dataContext;
        }

        public Parameter Get(string name)
        {
            return _dataContext.Parameters.Find(name);
        }

        public bool Insert(Parameter parameter)
        {
            _dataContext.Parameters.Add(parameter);
            _dataContext.SaveChanges();

            return true;
        }

        public bool Update(Parameter parameter)
        {
            var parameterDb = Get(parameter.Name);
            _dataContext.Entry(parameterDb).CurrentValues.SetValues(parameter);
            _dataContext.SaveChanges();

            return true;
        }

        public bool Remove(string name)
        {
            var parameter = Get(name);
            _dataContext.Parameters.Remove(parameter);
            _dataContext.SaveChanges();

            return true;
        }
    }
}