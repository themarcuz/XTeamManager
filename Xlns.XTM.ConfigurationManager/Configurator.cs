using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Xlns.ConfigurationManager;
using System.Xml.Linq;

namespace Xlns.XTM.ConfigurationManager
{
    public class Configurator : XmlConfigurationManager
    {
        private static Configurator _istance;

        private static NLog.Logger logger = NLog.LogManager.GetCurrentClassLogger();

        private static Object _lock = new Object();


        public static Configurator Istance
        {
            get
            {
                lock (_lock)
                {
                    if (_istance == null)
                    {
                        _istance = new Configurator(configFileName);
                        logger.Debug("Singleton instance of Configurater has been created");
                    }
                    return _istance;
                }
            }
        }

        public static string configFileName { get; set; }

        private Configurator(string configPath)
        {
            try
            {
                configFileName = configPath;
                logger.Debug("Building Configurator: looking for file /n" + configFileName);
                xml = XElement.Load(configFileName);
                logger.Info("Configuration file succesfully loaded");
                logger.Debug(xml.ToString());
            }
            catch (Exception e)
            {
                logger.ErrorException("Error reading configuration file", e);
                throw;
            }
        }

        public void ReloadConfig()
        {
            xml = XElement.Load(configFileName);
            logger.Info("Configuration file reloaded");
            logger.Debug(xml.ToString());
        }

        public string hibernateConfiguration
        {
            get
            {

                var fullPath = base.getParameter("core.DAL.hibernateConfiguration");
                if (fullPath.Contains("[config]"))
                {
                    var cfgFile = new System.IO.FileInfo(configFileName);
                    var cfgPath = cfgFile.DirectoryName;
                    fullPath = fullPath.Replace("[config]", cfgPath);
                }
                return fullPath;
            }
        }
        public string connectionString { get { return base.getParameter("core.DAL.connectionString"); } }
        
    }
}
