using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Model.Framework;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class PhieuNhapController : Controller
    {
        private OnlineShopDbContext db = new OnlineShopDbContext();

        // GET: Admin/PhieuNhap
        public ActionResult Index(string searchString)
        {
            ViewBag.searchValue = searchString;
            var pn = from t in db.PhieuNhaps
                     select t;
            if (!String.IsNullOrEmpty(searchString))
            {
                pn = pn.Where(s => s.SoPN.Contains(searchString));
            }
            return View(pn);
            //var phieuNhaps = db.PhieuNhaps.Include(p => p.NhaCungCap).Include(p => p.NhanVien);
            //return View(phieuNhaps.ToList());
        }

        // GET: Admin/PhieuNhap/Details/5
        public ActionResult Details(string id)
        {
            //if (id == null)
            //{
            //    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            //}
            //PhieuNhap phieuNhap = db.PhieuNhaps.Find(id);
            //if (phieuNhap == null)
            //{
            //    return HttpNotFound();
            //}
            //return View(phieuNhap);
            var ctpn = from t in db.ChiTietPhieuNhaps
                     select t;
            if (!String.IsNullOrEmpty(id))
            {
                ctpn = ctpn.Where(s => s.SoPN.Contains(id));
            }
            return View(ctpn);
        }

        // GET: Admin/PhieuNhap/Create
        public ActionResult Create()
        {
            ViewBag.MaNhaCungCap = new SelectList(db.NhaCungCaps, "MaNhaCungCap", "TenNhaCungCap");
            ViewBag.MaNhanVien = new SelectList(db.NhanViens, "MaNhanVien", "TenNV");
            return View();
        }

        // POST: Admin/PhieuNhap/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "SoPN,NgayNhap,MaNhanVien,TongTienNhap,MaNhaCungCap")] PhieuNhap phieuNhap)
        {
            if (ModelState.IsValid)
            {
                db.PhieuNhaps.Add(phieuNhap);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaNhaCungCap = new SelectList(db.NhaCungCaps, "MaNhaCungCap", "TenNhaCungCap", phieuNhap.MaNhaCungCap);
            ViewBag.MaNhanVien = new SelectList(db.NhanViens, "MaNhanVien", "TenNV", phieuNhap.MaNhanVien);
            return View(phieuNhap);
        }

        // GET: Admin/PhieuNhap/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhieuNhap phieuNhap = db.PhieuNhaps.Find(id);
            if (phieuNhap == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaNhaCungCap = new SelectList(db.NhaCungCaps, "MaNhaCungCap", "TenNhaCungCap", phieuNhap.MaNhaCungCap);
            ViewBag.MaNhanVien = new SelectList(db.NhanViens, "MaNhanVien", "TenNV", phieuNhap.MaNhanVien);
            return View(phieuNhap);
        }

        // POST: Admin/PhieuNhap/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SoPN,NgayNhap,MaNhanVien,TongTienNhap,MaNhaCungCap")] PhieuNhap phieuNhap)
        {
            if (ModelState.IsValid)
            {
                db.Entry(phieuNhap).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaNhaCungCap = new SelectList(db.NhaCungCaps, "MaNhaCungCap", "TenNhaCungCap", phieuNhap.MaNhaCungCap);
            ViewBag.MaNhanVien = new SelectList(db.NhanViens, "MaNhanVien", "TenNV", phieuNhap.MaNhanVien);
            return View(phieuNhap);
        }

        // GET: Admin/PhieuNhap/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhieuNhap phieuNhap = db.PhieuNhaps.Find(id);
            if (phieuNhap == null)
            {
                return HttpNotFound();
            }
            return View(phieuNhap);
        }

        // POST: Admin/PhieuNhap/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            PhieuNhap phieuNhap = db.PhieuNhaps.Find(id);
            db.PhieuNhaps.Remove(phieuNhap);
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
