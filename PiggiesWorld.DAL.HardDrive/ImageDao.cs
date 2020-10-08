using System;
using System.IO;
using PiggiesWorld.DAL.Contracts;

namespace PiggiesWorld.DAL.HardDrive
{
    public class ImageDao : IImageDao
    {
        public string SaveImage(Stream inputStream, string imageName)
        {
            var guid = Guid.NewGuid();

            var path = Path.GetDirectoryName(imageName);

            if (!Directory.Exists(path))
                Directory.CreateDirectory(path);

            var newName = Path.GetDirectoryName(imageName) + "\\" + guid.ToString() + Path.GetExtension(imageName);

            using (FileStream outputFileStream = new FileStream(newName, FileMode.Create))
            {
                inputStream.CopyTo(outputFileStream);
            }

            return newName;
        }
    }
}
