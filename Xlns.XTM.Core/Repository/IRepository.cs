using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Xlns.XTM.Core.Repository
{
    interface IRepository<T> where T : Model.ModelEntity
    {
        IQueryable<T> GetAll();
        T GetById(int id);
        int Save(T domainObject);
        void Delete(T domainObject);
        void DeleteById(int domainObjectId);
    }
}
