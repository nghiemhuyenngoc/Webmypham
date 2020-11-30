using OnlineShop.Areas.Admin.Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OnlineShop.Areas.Admin;
using OnlineShop.Areas.Admin.Models;
using Models;


namespace OnlineShop.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        [HttpGet]
        // GET: Admin/Login
        public ActionResult Index()
        {
            return View();
        }

      [HttpPost]
      [ValidateAntiForgeryToken]
      public ActionResult Index(LoginModel model)
        {
            var result = new UserAccountModel().Login(model.Username, model.Password);
            if (result && ModelState.IsValid)
            {
                SessionHelper.SetSession(new UserSession() { UserName = model.Username });
                return RedirectToAction("Index", "Home");
            }
            else
            {   
                ModelState.AddModelError("", "Tên đăng nhập không đúng.");
            }
            return View(model);
        }
            
    }
}