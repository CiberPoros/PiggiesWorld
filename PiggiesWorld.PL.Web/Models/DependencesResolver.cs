using Ninject;
using PiggiesWorld.Common.Dependences;

namespace PiggiesWorld.PL.Web.Models
{
    public static class DependencesResolver
    {
        public static readonly IKernel Resolver;

        static DependencesResolver()
        {
            Resolver = new StandardKernel(new NinjectRegistrationsDAL(), new NinjectRegistrationsBLL());
        }
    }
}