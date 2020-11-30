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
    public class ThongTinSanPhamController : Controller
    {
        private OnlineShopDbContext db = new OnlineShopDbContext();

        // GET: Admin/ThongTinSanPham
        public ActionResult Index(string searchString)
        {
            ViewBag.searchValue = searchString;
            var sp = from t in db.ThongTinSanPhams
                     select t;
            if (!String.IsNullOrEmpty(searchString))
            {
                sp = sp.Where(s => s.TenSP.Contains(searchString));
            }
            return View(sp);
            //var thongTinSanPhams = db.ThongTinSanPhams.Include(t => t.Kho).Include(t => t.KhuyenMai).Include(t => t.LoaiSanPham);
            //return View(thongTinSanPhams.ToList());
        }

        // GET: Admin/ThongTinSanPham/Details/5
        public ActionResult Details(string id)
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

        // GET: Admin/ThongTinSanPham/Create
        public ActionResult Create()
        {
            ViewBag.MaSP = new SelectList(db.Khoes, "MaSP", "MaSP");
            ViewBag.MaKhuyenMai = new SelectList(db.KhuyenMais, "MaKhuyenMai", "TenKhuyenMai");
            ViewBag.MaLoaiSanPham = new SelectList(db.LoaiSanPhams, "MaLoaiSanPham", "TenLoaiSanPham");
            return View();
        }

        // POST: Admin/ThongTinSanPham/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaSP,TenSP,GiaBan,MoTaSP,XuatXu,MaLoaiSanPham,MaKhuyenMai,img")] ThongTinSanPham thongTinSanPham)
        {
            if (ModelState.IsValid)
            {
                db.ThongTinSanPhams.Add(thongTinSanPham);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaSP = new SelectList(db.Khoes, "MaSP", "MaSP", thongTinSanPham.MaSP);
            ViewBag.MaKhuyenMai = new SelectList(db.KhuyenMais, "MaKhuyenMai", "TenKhuyenMai", thongTinSanPham.MaKhuyenMai);
            ViewBag.MaLoaiSanPham = new SelectList(db.LoaiSanPhams, "MaLoaiSanPham", "TenLoaiSanPham", thongTinSanPham.MaLoaiSanPham);
            return View(thongTinSanPham);
        }

        // GET: Admin/ThongTinSanPham/Edit/5
        public ActionResult Edit(string id)
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
            ViewBag.MaSP = new SelectList(db.Khoes, "MaSP", "MaSP", thongTinSanPham.MaSP);
            ViewBag.MaKhuyenMai = new SelectList(db.KhuyenMais, "MaKhuyenMai", "TenKhuyenMai", thongTinSanPham.MaKhuyenMai);
            ViewBag.MaLoaiSanPham = new SelectList(db.LoaiSanPhams, "MaLoaiSanPham", "TenLoaiSanPham", thongTinSanPham.MaLoaiSanPham);
            return View(thongTinSanPham);
        }

        // POST: Admin/ThongTinSanPham/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaSP,TenSP,GiaBan,MoTaSP,XuatXu,MaLoaiSanPham,MaKhuyenMai,img")] ThongTinSanPham thongTinSanPham)
        {
            if (ModelState.IsValid)
            {
                db.Entry(thongTinSanPham).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaSP = new SelectList(db.Khoes, "MaSP", "MaSP", thongTinSanPham.MaSP);
            ViewBag.MaKhuyenMai = new SelectList(db.KhuyenMais, "MaKhuyenMai", "TenKhuyenMai", thongTinSanPham.MaKhuyenMai);
            ViewBag.MaLoaiSanPham = new SelectList(db.LoaiSanPhams, "MaLoaiSanPham", "TenLoaiSanPham", thongTinSanPham.MaLoaiSanPham);
            return View(thongTinSanPham);
        }

        // GET: Admin/ThongTinSanPham/Delete/5
        public ActionResult Delete(string id)
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

        // POST: Admin/ThongTinSanPham/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            ThongTinSanPham thongTinSanPham = db.ThongTinSanPhams.Find(id);
            db.ThongTinSanPhams.Remove(thongTinSanPham);
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
