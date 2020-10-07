﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Ninject.Modules;
using PiggiesWorld.BLL.Contracts;
using PiggiesWorld.BLL.Logic;

namespace PiggiesWorld.Common.Dependences
{
    public class NinjectRegistrationsBLL : NinjectModule
    {
        public override void Load()
        {
            Bind<IPhotoManager>().To<PhotoManager>().InSingletonScope();
            Bind<IUsersManager>().To<UsersManager>().InSingletonScope();
            Bind<IAuthManager>().To<AuthManager>().InSingletonScope();
            Bind<IStoriesManager>().To<StoriesManager>().InSingletonScope();
        }
    }
}
