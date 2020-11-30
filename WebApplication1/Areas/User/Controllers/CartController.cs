using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model;
using Model.Framework;
using System.Net;

namespace OnlineShop.Areas.User
{
    public class CartController : Controller
    {
        private const string CartSession = "CartSession";
        // GET: User/Cart
        public ActionResult Index()
        {
            var cart = Session[CartSession];
            var list = new List<CartItem>();

            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return View(list);
        }

        public ActionResult AddItem(string productid, int quanity)
        {
            var product = new ThongTinSPModel().ViewDetail(productid);
            var cart = Session[CartSession];
            if (cart != null)
            {
                var list = (List<CartItem>)cart;
                if (list.Exists(x => x.Product.MaSP == productid))
                {
                    foreach (var item in list)
                    {
                        if (item.Product.MaSP == productid)
                        {
                            item.Quantity += quanity;
                        }
                    }
                }
                else
                {
                    //tạo mới cart 
                    var item = new CartItem();
                    item.Product = product;
                    item.Quantity = quanity;
                    list.Add(item);
                }
                //gán vào session
                Session[CartSession] = list;
            }
            else
            {
                //tạo mới cart 
                var item = new CartItem();
                item.Product = product;
                item.Quantity = quanity;
                var list = new List<CartItem>();
                list.Add(item);
                //gán vào session
                Session[CartSession] = list;
            }
            return RedirectToAction("~/Cart/Index");
        }
    }
}