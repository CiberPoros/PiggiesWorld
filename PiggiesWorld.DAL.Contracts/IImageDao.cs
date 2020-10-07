using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PiggiesWorld.DAL.Contracts
{
    public interface IImageDao
    {
        string SaveImage(Stream inputStream, string imageName);
    }
}
