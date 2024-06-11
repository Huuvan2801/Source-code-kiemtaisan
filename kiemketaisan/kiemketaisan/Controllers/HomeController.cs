using kiemketaisan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace kiemketaisan.Controllers
{
    public class HomeController : Controller
    {
       Data db=new Data();
        public ActionResult Index()
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("/Login");
            }
            return View();
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public JsonResult Login(string TenDangNhap, string MatKhau)
        {
            if (ModelState.IsValid)
            {
                var user1 = db.TaiKhoans.FirstOrDefault(u => u.TenDangNhap.Equals(TenDangNhap) && u.MatKhau.Equals(MatKhau));
                if (user1 != null)
                {
                    Session["Id"] = user1.Id;
                    Session["PQ"] = user1.PhanQuyen;
                    Session["Ten"] = db.ThongTins.FirstOrDefault(g => g.IdTK == user1.Id).HoTen;
                    Session["Anh"] = db.ThongTins.FirstOrDefault(g => g.IdTK == user1.Id).HinhAnh;
                    return Json(new { status = true, phanquyen = user1.PhanQuyen, message = "Đăng nhập thành công." }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json(new { status = false, message = "Đăng nhập không thành công." }, JsonRequestBehavior.AllowGet);
                }
            }
            return Json(new { status = false, message = "Thông tin đăng nhập không đủ." }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("/Login");
        }
    }
}