using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PiggiesWorld.DAL.Contracts
{
    public interface ISubmitEntityDao
    {
        void Submit(int id);
    }
}
