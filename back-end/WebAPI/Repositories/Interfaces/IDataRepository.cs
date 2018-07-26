using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebAPI.Repositories.Interfaces
{
    public interface IDataRepository<TEntity, U> where TEntity : class
    {
        IEnumerable<TEntity> GetAll();
        TEntity Get(U id);
        TEntity Add(TEntity b);
        TEntity Update(U id, TEntity b);
        int Delete(U id);
    }
}
