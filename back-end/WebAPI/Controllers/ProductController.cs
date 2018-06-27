using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using WebAPI.Models;

namespace WebAPI.Controllers
{
	public class ResponseApi
	{
		public int Code { get; set; }
		public object result { get; set; }
		public string Message { get; set; }
	}
	[EnableCors(origins: "*", headers: "*", methods: "*")]
	public class ProductController : ApiController
	{
		// GET: api/Product
		public IEnumerable<string> Get()
		{
			return new string[] { "value1", "value2" };
		}

		// GET: api/Product/5
		public IHttpActionResult Get(int id)
		{
			var product = new List<Product>() {
				new Product()
					{
						ID = 1,
						Code = "abc",
						Name = "Product 1"
					},
				new Product()
					{
						ID = 1,
						Code = "abc",
						Name = "Product 1"
					}
			};
			var responseApi = new ResponseApi()
			{
				Code = 200,
				result = product,
				Message = "Success"
			};
			return Ok(responseApi);
		}

		// POST: api/Product
		public void Post([FromBody]string value)
		{
		}

		// PUT: api/Product/5
		public void Put(int id, [FromBody]string value)
		{
		}

		// DELETE: api/Product/5
		public void Delete(int id)
		{
		}
	}
}
