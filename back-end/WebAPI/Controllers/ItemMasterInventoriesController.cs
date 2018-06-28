using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ItemMasterInventoriesController : ApiController
    {
        private ApplicationContext db = new ApplicationContext();

        // GET: api/ItemMasterInventories
        public IQueryable<ItemMasterInventory> GetItemMasterInventories()
        {
            return db.ItemMasterInventories;
        }

        // GET: api/ItemMasterInventories/5
        [ResponseType(typeof(ItemMasterInventory))]
        public IHttpActionResult GetItemMasterInventory(int id)
        {
            ItemMasterInventory itemMasterInventory = db.ItemMasterInventories.Find(id);
            if (itemMasterInventory == null)
            {
                return NotFound();
            }

            return Ok(itemMasterInventory);
        }

        // PUT: api/ItemMasterInventories/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutItemMasterInventory(int id, ItemMasterInventory itemMasterInventory)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != itemMasterInventory.ItemMasterInventoryID_PK)
            {
                return BadRequest();
            }

            db.Entry(itemMasterInventory).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ItemMasterInventoryExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/ItemMasterInventories
        [ResponseType(typeof(ItemMasterInventory))]
        public IHttpActionResult PostItemMasterInventory(ItemMasterInventory itemMasterInventory)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.ItemMasterInventories.Add(itemMasterInventory);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (ItemMasterInventoryExists(itemMasterInventory.ItemMasterInventoryID_PK))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = itemMasterInventory.ItemMasterInventoryID_PK }, itemMasterInventory);
        }

        // DELETE: api/ItemMasterInventories/5
        [ResponseType(typeof(ItemMasterInventory))]
        public IHttpActionResult DeleteItemMasterInventory(int id)
        {
            ItemMasterInventory itemMasterInventory = db.ItemMasterInventories.Find(id);
            if (itemMasterInventory == null)
            {
                return NotFound();
            }

            db.ItemMasterInventories.Remove(itemMasterInventory);
            db.SaveChanges();

            return Ok(itemMasterInventory);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ItemMasterInventoryExists(int id)
        {
            return db.ItemMasterInventories.Count(e => e.ItemMasterInventoryID_PK == id) > 0;
        }
    }
}