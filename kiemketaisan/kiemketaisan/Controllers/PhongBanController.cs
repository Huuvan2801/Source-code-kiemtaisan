using kiemketaisan.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace kiemketaisan.Controllers
{
    public class PhongBanController : Controller
    {
        private Data db = new Data();

        // GET: TaiSans
        public ActionResult Index(string search = "")
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("Login", "Home");
            }
            var list = db.PhongBans.AsQueryable();
            if (!string.IsNullOrEmpty(search))
            {
                list = list.Where(g => g.TenPhongBan.Contains(search));
            }
            return View(list.ToList());
        }

        // GET: TaiSans/Create
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,TenPhongBan")] PhongBan phongBan)
        {
            if (ModelState.IsValid)
            {
                db.PhongBans.Add(phongBan);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(phongBan);
        }
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhongBan taiSan = db.PhongBans.Find(id);
            if (taiSan == null)
            {
                return HttpNotFound();
            }
            db.PhongBans.Remove(taiSan);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhongBan taiSan = db.PhongBans.Find(id);
            if (taiSan == null)
            {
                return HttpNotFound();
            }
            return View(taiSan);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,TenPhongBan")] PhongBan taiSan)
        {
            if (ModelState.IsValid)
            {
                db.PhongBans.AddOrUpdate(taiSan);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(taiSan);
        }
    }
}