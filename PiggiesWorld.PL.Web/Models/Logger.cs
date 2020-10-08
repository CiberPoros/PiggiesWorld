using log4net;
using log4net.Config;

namespace PiggiesWorld.PL.Web.Models
{
    public static class Logger
    {
        private static ILog _log = LogManager.GetLogger("logger");

        public static ILog Log => _log;

        static Logger()
        {
            InitLogger();
        }

        public static void InitLogger()
        {
            XmlConfigurator.Configure();
        }
    }
}