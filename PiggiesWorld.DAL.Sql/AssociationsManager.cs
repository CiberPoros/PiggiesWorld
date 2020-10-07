using System;
using System.Collections.Generic;

namespace PiggiesWorld.DAL.Sql
{
    public static class AssociationsManager
    {
        private static readonly Dictionary<string, string> _entitiesNamesToTableNames;

        static AssociationsManager()
        {
            _entitiesNamesToTableNames = new Dictionary<string, string>()
            {
                { "UserRole", "user_role_association" }
            };
        }

        public static string GetTableName(Type entityType1, Type entityType2)
        {
            string entName1 = entityType1.Name;
            string entName2 = entityType2.Name;

            if (_entitiesNamesToTableNames.TryGetValue($"{entName1}{entName2}", out string tableName))
                return tableName;

            return _entitiesNamesToTableNames.TryGetValue($"{entName2}{entName1}", out tableName) ? tableName : tableName;
        }
    }
}
