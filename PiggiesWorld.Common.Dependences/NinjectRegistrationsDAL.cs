using Ninject.Modules;
using PiggiesWorld.DAL.Contracts;
using PiggiesWorld.DAL.HardDrive;
using PiggiesWorld.DAL.Sql;

namespace PiggiesWorld.Common.Dependences
{
    public class NinjectRegistrationsDAL : NinjectModule
    {
        public override void Load()
        {
            Bind<IPhotoDao>().To<PhotoDao>().InSingletonScope();
            Bind<IUsersDao>().To<UsersDao>().InSingletonScope();
            Bind<IRolesDao>().To<RolesDao>().InSingletonScope();
            Bind<IImageDao>().To<ImageDao>().InSingletonScope();
            Bind<IStoriesDao>().To<StoriesDao>().InSingletonScope();
            Bind<IVideoDao>().To<VideoDao>().InSingletonScope();
            Bind<IAnnouncementDao>().To<AnnouncementDao>().InSingletonScope();
        }
    }
}
