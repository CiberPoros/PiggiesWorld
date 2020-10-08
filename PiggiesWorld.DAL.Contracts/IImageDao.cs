using System.IO;

namespace PiggiesWorld.DAL.Contracts
{
    public interface IImageDao
    {
        string SaveImage(Stream inputStream, string imageName);
    }
}
