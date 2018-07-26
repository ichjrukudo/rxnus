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
using WebAPI.Common.Dto;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ItemMastersController : ApiController
    {
        private ApplicationContext db = new ApplicationContext();

		[Route("api/search")]
		[HttpGet]
		public IList<string> searchCode()
		{
			string value = Request.GetQueryNameValuePairs().ElementAt(0).Value;
			return db.ItemMasters.Where(item => item.ItemMasterID_PK.Contains(value)).Select(item => item.ItemMasterID_PK).ToList();
		}
        // GET: api/ItemMasters
        public IHttpActionResult GetItemMasters()
        {
            return Ok(new ApiResponse(200, db.ItemMasters.ToList(), "Success"));
        }

        // GET: api/ItemMasters/5
        [ResponseType(typeof(ItemMaster))]
        public IHttpActionResult GetItemMaster(string id)
        {
            ItemMaster itemMaster = db.ItemMasters.Find(id);
            if (itemMaster == null)
            {
                return NotFound();
            }

            return Ok(itemMaster);
        }

        // PUT: api/ItemMasters/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutItemMaster(string id, ItemMaster itemMaster)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != itemMaster.ItemMasterID_PK)
            {
                return BadRequest();
            }

            db.Entry(itemMaster).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ItemMasterExists(id))
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

        // POST: api/ItemMasters
        [ResponseType(typeof(ItemMaster))]
		[HttpPost]
        public IHttpActionResult PostItemMaster(ItemMaster itemMaster)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.ItemMasters.Add(itemMaster);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (ItemMasterExists(itemMaster.ItemMasterID_PK))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = itemMaster.ItemMasterID_PK }, itemMaster);
        }

        // DELETE: api/ItemMasters/5
        [ResponseType(typeof(ItemMaster))]
        public IHttpActionResult DeleteItemMaster(string id)
        {
            ItemMaster itemMaster = db.ItemMasters.Find(id);
            if (itemMaster == null)
            {
                return NotFound();
            }

            db.ItemMasters.Remove(itemMaster);
            db.SaveChanges();

            return Ok(itemMaster);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ItemMasterExists(string id)
        {
            return db.ItemMasters.Count(e => e.ItemMasterID_PK == id) > 0;
        }
    }
}