using Model;
using Model.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PagedList;
using System.Reflection;
using System.Linq.Dynamic;
using System.Linq.Expressions;

namespace OnlineShop.Areas.User.Controllers
{
    public class HomeController : Controller
    {
        private OnlineShopDbContext db = new OnlineShopDbContext();
       
            // GET: User/Home
            public ActionResult Index()
        {
            var iplnewproduct = new ThongTinSPModel();
            var model = iplnewproduct.ListNewProduct();
            return View(model);
        }

        [ChildActionOnly]
        public ActionResult Topmenu()
        {
            var iplCate = new LoaiSanPhamModel();
            var model = iplCate.ListAll();
            return PartialView(model);
        }

        public ActionResult ProductDetails(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ThongTinSanPham thongTinSanPham = db.ThongTinSanPhams.Find(id);
            if (thongTinSanPham == null)
            {
                return HttpNotFound();
            }
            return View(thongTinSanPham);
        }

        public ActionResult Contact()
        {
            return View();

        }
       


    }

}