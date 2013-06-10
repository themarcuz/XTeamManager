using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Xlns.XTM.Core.DAL;

namespace Xlns.XTM.Core
{
    

    public class DynamicBoardManager
    {
        private static NLog.Logger logger = NLog.LogManager.GetCurrentClassLogger();
        Repository.DynamicBoardRepository dbr = new Repository.DynamicBoardRepository();

        public IList<Model.DynamicBoard> GetAll()
        {
            using (var om = new OperationManager())
            {
                try
                {
                    var session = om.BeginOperation();
                    var boardList = dbr.GetAll().ToList();
                    om.CommitOperation();
                    return boardList;
                }
                catch (Exception ex)
                {
                    om.RollbackOperation();
                    string msg = "Error retrieving the list of available boards";
                    logger.ErrorException(msg, ex);
                    throw new Exception(msg, ex);
                }
            }
            
        }
    }
}
