using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Model.Framework;
using Models;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class ChiTietPhieuNhapController : Controller
    {
        private OnlineShopDbContext db = new OnlineShopDbContext();

        // GET: Admin/ChiTietPhieuNhap
        public ActionResult Index(string searchString)
        {
            ViewBag.searchValue = searchString;
            var ctpn = from t in db.ChiTietPhieuNhaps
                     select t;
            if (!String.IsNullOrEmpty(searchString))
            {
                ctpn = ctpn.Where(s => s.SoPN.Contains(searchString));
            }
            return View(ctpn);
            //var chitietphieunhaps = db.ChiTietPhieuNhaps.Include(c => c.PhieuNhap);
            //return View(chitietphieunhaps.ToList());
        }

        // GET: Admin/ChiTietPhieuNhap/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ChiTietPhieuNhap chiTietPhieuNhap = db.ChiTietPhieuNhaps.Find(id);
            if (chiTietPhieuNhap == null)
            {
                return HttpNotFound();
            }
            return View(chiTietPhieuNhap);
        }

        // GET: Admin/ChiTietPhieuNhap/Create
        public ActionResult Create()
        {
            ViewBag.SoPN = new SelectList(db.PhieuNhaps, "SoPN", "MaNhanVien");
            return View();
        }

        // POST: Admin/ChiTietPhieuNhap/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "SoPN,MaSP,NSX,HSD,SoLuongNhap,GiaNhap,ThanhTienNhap")] ChiTietPhieuNhap chiTietPhieuNhap)
        {
            if (ModelState.IsValid)
            {
                db.ChiTietPhieuNhaps.Add(chiTietPhieuNhap);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.SoPN = new SelectList(db.PhieuNhaps, "SoPN", "MaNhanVien", chiTietPhieuNhap.SoPN);
            return View(chiTietPhieuNhap);
        }

        // GET: Admin/ChiTietPhieuNhap/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ChiTietPhieuNhap chiTietPhieuNhap = db.ChiTietPhieuNhaps.Find(id);
            if (chiTietPhieuNhap == null)
            {
                return HttpNotFound();
            }
            ViewBag.SoPN = new SelectList(db.PhieuNhaps, "SoPN", "MaNhanVien", chiTietPhieuNhap.SoPN);
            return View(chiTietPhieuNhap);
        }

        // POST: Admin/ChiTietPhieuNhap/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SoPN,MaSP,NSX,HSD,SoLuongNhap,GiaNhap,ThanhTienNhap")] ChiTietPhieuNhap chiTietPhieuNhap)
        {
            if (ModelState.IsValid)
            {
                db.Entry(chiTietPhieuNhap).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.SoPN = new SelectList(db.PhieuNhaps, "SoPN", "MaNhanVien", chiTietPhieuNhap.SoPN);
            return View(chiTietPhieuNhap);
        }

        // GET: Admin/ChiTietPhieuNhap/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ChiTietPhieuNhap chiTietPhieuNhap = db.ChiTietPhieuNhaps.Find(id);
            if (chiTietPhieuNhap == null)
            {
                return HttpNotFound();
            }
            return View(chiTietPhieuNhap);
        }

        // POST: Admin/ChiTietPhieuNhap/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            ChiTietPhieuNhap chiTietPhieuNhap = db.ChiTietPhieuNhaps.Find(id);
            db.ChiTietPhieuNhaps.Remove(chiTietPhieuNhap);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
