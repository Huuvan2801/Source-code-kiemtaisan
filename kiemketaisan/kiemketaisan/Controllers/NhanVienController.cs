using kiemketaisan.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebGrease.Css.Extensions;

namespace kiemketaisan.Controllers
{
    public class NhanVienController : Controller
    {
        Data db = new Data();
        public ActionResult Index()
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("Login","Home");
            }
            ViewData["taikhoan"] = db.TaiKhoans.ToList();
            ViewData["phong"] = db.PhongBans.ToList();
            return View(db.ThongTins.ToList());
        }
        public ActionResult Create()
        {
            ViewData["phong"] = db.PhongBans.ToList();
            return View();
        }

        // POST: ThongTins/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,HoTen,Email,GioiTinh,NgaySinh,DiaChi,HinhAnh,IdTK,IdPB")] ThongTin thongTin)
        {
            ViewData["phong"] = db.PhongBans.ToList();

            if (ModelState.IsValid)
            {
                TaiKhoan tk = new TaiKhoan();
                tk.PhanQuyen = Convert.ToInt32(Request["phanquyen"]);
                tk.TenDangNhap = Request["tendangnhap"];
                tk.MatKhau = Request["matkhau"];
                db.TaiKhoans.Add(tk);
                db.SaveChanges();
                var f = Request.Files["Anh"];
                if (f != null && f.ContentLength > 0)
                {
                    string FileName = System.IO.Path.GetFileName(f.FileName);
                    string UploadPath = Server.MapPath("~/upload/" + FileName);
                    f.SaveAs(UploadPath);
                    thongTin.HinhAnh = FileName;
                }
                thongTin.IdTK = tk.Id;
                db.ThongTins.Add(thongTin);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(thongTin);
        }

        // GET: ThongTins/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ThongTin thongTin = db.ThongTins.Find(id);
            ViewData["taikhoan"] = db.TaiKhoans.ToList();
            ViewData["phong"] = db.PhongBans.ToList();

            if (thongTin == null)
            {
                return HttpNotFound();
            }
            return View(thongTin);
        }

        // POST: ThongTins/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,HoTen,Email,GioiTinh,NgaySinh,DiaChi,HinhAnh,IdTK,IdPB")] ThongTin thongTin)
        {
            ViewData["phong"] = db.PhongBans.ToList();

            if (ModelState.IsValid)
            {
                TaiKhoan tk = db.TaiKhoans.FirstOrDefault(g => g.Id == thongTin.IdTK);
                tk.PhanQuyen = Convert.ToInt32(Request["phanquyen"]);
                db.TaiKhoans.AddOrUpdate(tk);
                db.SaveChanges();
                var f = Request.Files["Anh"];
                if (f != null && f.ContentLength > 0)
                {
                    string folderPath = Server.MapPath("~/upload/" + thongTin.HinhAnh);
                    if (System.IO.File.Exists(folderPath))
                    {
                        System.IO.File.Delete(folderPath);
                    }
                    string FileName = System.IO.Path.GetFileName(f.FileName);
                    string UploadPath = Server.MapPath("~/upload/" + FileName);
                    f.SaveAs(UploadPath);
                    thongTin.HinhAnh = FileName;
                }
                db.ThongTins.AddOrUpdate(thongTin);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(thongTin);
        }

        // GET: ThongTins/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ThongTin thongTin = db.ThongTins.Find(id);
            if (thongTin == null)
            {
                return HttpNotFound();
            }
            TaiKhoan tk=db.TaiKhoans.FirstOrDefault(g=>g.Id == thongTin.IdTK);
            db.TaiKhoans.Remove(tk);
            db.ThongTins.Remove(thongTin);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}