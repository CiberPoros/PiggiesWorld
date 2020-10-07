using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PiggiesWorld.Common.Entities;

namespace PiggiesWorld.BLL.Contracts
{
    public interface IAuthManager
    {
        bool RegisterUser(User user, string password);
        bool IsCorrectPassword(string login, string password);
    }
}
