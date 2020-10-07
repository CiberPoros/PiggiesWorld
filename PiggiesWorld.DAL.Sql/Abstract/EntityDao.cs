using System.Configuration;

namespace PiggiesWorld.DAL.Sql.Abstract
{
    public class EntityDao
    {
        protected readonly string _connectionString;

        public EntityDao()
        {
            _connectionString = ConfigurationManager.ConnectionStrings["default"].ConnectionString;
        }
    }
}
