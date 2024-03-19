using mvc_crud2.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace mvc_crud2.Controllers
{
    public class HomeController : Controller
    {
        StudentContext db = new StudentContext();
        // GET: Home
        public ActionResult Index()
        {
            var data = db.Students.ToList();
            return View(data);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Student student)
        {
            db.Students.Add(student);
            int a = db.SaveChanges();
            if (a > 0)
            {
                TempData["InsertedMessage"] = "Data Inserted !!";
                return RedirectToAction("Index");
            }
            else
            {
                ViewBag.InsertedMessage = "<script>alert('Data not Inserted')</script>";
            }
            return View();
        }
        public ActionResult Edit(int id)
        {
            var edit = db.Students.Where(model => model.Id == id).FirstOrDefault();
            return View(edit);
        }
        [HttpPost]
        public ActionResult Edit(Student student)
        {
            db.Entry(student).State= EntityState.Modified;
            int a = db.SaveChanges();
            if (a > 0)
            {
                TempData["EditedMessage"] = "Data Updated!!";
                return RedirectToAction("Index");
            }
            else
            {
                ViewBag.InsertedMessage = "<script>alert('Data not Updated')</script>";
            }
            return View();
        }
        public ActionResult Delete(int id)
        {
            var delete = db.Students.Where(model => model.Id == id).FirstOrDefault();
            return View(delete);
        }
        [HttpPost]
        public ActionResult Delete(Student student)
        {
            db.Entry(student).State = EntityState.Deleted;
            int a = db.SaveChanges();
            if (a > 0)
            {
                TempData["DeleteMessage"] = "Data Deleted!!";
                return RedirectToAction("Index");
            }
            else
            {
                ViewBag.InsertedMessage = "<script>alert('Data not Deleted')</script>";
            }
            return View();
        }
        public ActionResult Details(int id)
        {
            var details = db.Students.Where(model => model.Id == id).FirstOrDefault();
            return View(details);
        }
    }
}