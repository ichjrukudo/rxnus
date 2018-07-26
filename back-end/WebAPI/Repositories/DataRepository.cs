using System;
using System.Collections.Generic;
using WebAPI.Models;
using WebAPI.Repositories.Interfaces;

namespace WebAPI.Repositories
{
    public class DataRepository<TEntity, U> : IDataRepository<TEntity, U> where TEntity : class
    {
        protected readonly ApplicationContext _context;
        public DataRepository(ApplicationContext context)
        {
            _context = context;
        }

        public TEntity Add(TEntity entity)
        {
            _context.Set<TEntity>().Add(entity);

            var id = _context.SaveChanges();

            return _context.Set<TEntity>().Find(id);
        }

        public int Delete(U id)
        {
            var idReturn = 0;
            var entity = _context.Set<TEntity>().Find(id);

            if (entity != null)
            {
                _context.Set<TEntity>().Remove(entity);
                idReturn = _context.SaveChanges();
            }

            return idReturn;
        }

        public TEntity Get(U id)
        {
            return _context.Set<TEntity>().Find(id);
        }

        public IEnumerable<TEntity> GetAll()
        {
            return _context.Set<TEntity>();
        }

        public TEntity Update(U id, TEntity entity)
        {
            try
            {
                //if (_context.Entry(entity).State == EntityState.Detached)
                //{
                //    Entities.Attach(entity);
                //}
                //_session.Entry(entity).State = EntityState.Modified;

                return entity;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }
    }
}