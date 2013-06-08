using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Xlns.XTM.Core.DAL;
using NHibernate.Linq;

namespace Xlns.XTM.Core.Repository
{
    public abstract class CommonRepository
    {
        private static NLog.Logger logger = NLog.LogManager.GetCurrentClassLogger();

        protected IQueryable<T> GetAll<T>() where T : Model.ModelEntity
        {
            using (var om = new OperationManager())
            {
                try
                {
                    var session = om.BeginOperation();
                    var items = session.Query<T>();
                    om.CommitOperation();
                    return items;
                }
                catch (Exception ex)
                {
                    om.RollbackOperation();
                    logger.ErrorException("Error retrieving objects " + typeof(T).ToString(), ex);
                    return null;
                }
            }
        }

        protected int Save<T>(T domainModelObject) where T : Model.ModelEntity
        {
            using (var om = new OperationManager())
            {
                try
                {
                    var session = om.BeginOperation();
                    session.SaveOrUpdate(domainModelObject);
                    om.CommitOperation();
                    logger.Info("Object " + domainModelObject.GetType().ToString()
                        + " with id = " + domainModelObject.Id + " successfully saved");
                }
                catch (Exception ex)
                {
                    om.RollbackOperation();
                    logger.ErrorException("Error saving object " + domainModelObject.GetType().ToString() + " with id = " + domainModelObject.Id, ex);
                    throw;
                }
                return domainModelObject.Id;
            }
        }

        protected void Delete<T>(T domainModelObject) where T : Model.ModelEntity
        {
            using (var om = new OperationManager())
            {
                try
                {
                    var session = om.BeginOperation();
                    session.Delete(domainModelObject);                    
                    logger.Info("Object " + domainModelObject.GetType().ToString()
                        + " with id = " + domainModelObject.Id + " successfully deleted");
                    om.CommitOperation();
                }
                catch (Exception ex)
                {
                    om.RollbackOperation();
                    string msg = string.Format("Error deleting object {0} with id = {1}",
                        domainModelObject.GetType().ToString(), domainModelObject.Id);
                    logger.ErrorException(msg, ex);
                    throw new Exception(msg, ex);
                }
            }
        }        

        protected void DeleteById<T>(int domainModelObjectId) where T : Model.ModelEntity
        {
            using (var om = new OperationManager())
            {
                try
                {
                    var queryString = string.Format("delete {0} where ID = :id", typeof(T));
                    var session = om.BeginOperation();
                    session.CreateQuery(queryString)
                            .SetParameter("id", domainModelObjectId)
                            .ExecuteUpdate();
                    logger.Info("Object " + typeof(T).ToString()
                        + " with id = " + domainModelObjectId + " successfully deleted");
                    om.CommitOperation();
                }
                catch (Exception ex)
                {
                    om.RollbackOperation();
                    string msg = string.Format("Error deleting object {0} with id = {1}",
                        typeof(T).ToString(), domainModelObjectId);
                    logger.ErrorException(msg, ex);
                    throw new Exception(msg, ex);
                }
            }
        }

        protected T GetById<T>(int Id) where T : Model.ModelEntity, new()
        {
            if (Id == 0) return new T();
            using (var om = new OperationManager())
            {
                try
                {
                    var session = om.BeginOperation();
                    var entity = (from o in session.Query<T>()
                                  where o.Id == Id
                                  select o).Single();
                    om.CommitOperation();
                    return entity;
                }
                catch (Exception ex)
                {
                    om.RollbackOperation();
                    string msg = "Impossibile recuperare l'oggetto " + typeof(T).ToString() + " con id = " + Id;
                    logger.ErrorException(msg, ex);
                    throw new Exception(msg, ex);
                }
            }
        }
    }
}
