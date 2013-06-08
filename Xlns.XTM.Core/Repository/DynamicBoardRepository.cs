using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Xlns.XTM.Core.Repository
{
    public class DynamicBoardRepository : CommonRepository, IRepository<Model.DynamicBoard>
    {

        public IQueryable<Model.DynamicBoard> GetAll()
        {
            return base.GetAll<Model.DynamicBoard>();
        }

        public Model.DynamicBoard GetById(int id)
        {
            return base.GetById<Model.DynamicBoard>(id);
        }

        public int Save(Model.DynamicBoard domainObject)
        {
            return base.Save<Model.DynamicBoard>(domainObject);
        }

        public void Delete(Model.DynamicBoard domainObject)
        {
            base.Delete<Model.DynamicBoard>(domainObject);
        }

        public void DeleteById(int domainObjectId)
        {
            base.DeleteById<Model.DynamicBoard>(domainObjectId);
        }
    }
}
