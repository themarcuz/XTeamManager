using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NHibernate;
using System.Diagnostics;

namespace Xlns.XTM.Core.DAL
{
    
    public class OperationManager : IDisposable
    {
        private static NLog.Logger logger = NLog.LogManager.GetCurrentClassLogger();

        ITransaction tx = null;
        ISession session = null;
        bool isInternalTransaction = false;

        public ISession BeginOperation()
        {
            try
            {
                session = PersistenceManager.Istance.GetSession();
                if (session.Transaction.IsActive)
                {
                    isInternalTransaction = false;
                    tx = session.Transaction;
                    logger.Debug(GetCallerClassDotMethod() + " hooked to the transaction " + tx.GetHashCode());
                }
                else
                {
                    isInternalTransaction = true;
                    tx = session.Transaction;
                    tx.Begin();
                    logger.Debug("Transaction " + tx.GetHashCode() + " created by " + GetCallerClassDotMethod());
                }
                logger.Debug("Session is " + session.GetHashCode());
                return session;
            }
            catch (Exception ex)
            {
                string msg = "Error beginning the operation";
                logger.ErrorException(msg, ex);
                throw new Exception(msg, ex);
            }
        }

        private String GetCallerClassDotMethod() {
            // serve ad intercettare il chiamante per loggare chi sta agendo sulla transazione
            var st = new StackTrace();
            var sf = st.GetFrame(2);
            var methodReference = sf.GetMethod().Name;
            var classReference = sf.GetMethod().DeclaringType.FullName;
            return string.Concat(classReference, ".", methodReference);
        }

        public void CommitOperation()
        {
            if (isInternalTransaction)
            {
                try
                {
                    tx.Commit();
                    logger.Debug(GetCallerClassDotMethod() + " committed the transaction " + tx.GetHashCode());
                }
                catch (Exception ex)
                {
                    string msg = "Error committing the transaction";
                    logger.ErrorException(msg, ex);
                    throw new Exception(msg, ex);
                }
                
            }
        }

        public void RollbackOperation()
        {
            if (isInternalTransaction)
            {
                try
                {
                    tx.Rollback();
                    logger.Debug(GetCallerClassDotMethod() + " rolled back the transaction" + tx.GetHashCode());
                }
                catch (Exception ex) 
                {
                    logger.Warn("A problem occured during the explicit rollback");                    
                }
            }
        }

        public void Dispose()
        {
            if (isInternalTransaction)
            {
                if (tx != null)
                {
                    tx.Dispose();
                }
                PersistenceManager.Istance.Close();
            }
        }
    }
}
