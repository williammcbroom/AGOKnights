using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;

namespace AGOKnights.Controllers
{
    [RequireHttps]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            string[] photos = Directory.GetFiles(Server.MapPath("~/Images/HomePage/"), "*.jpg");
            ViewBag.photos = photos;
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Officers()
        {
            ViewBag.Message = "Officers of Alpha";

           return View();
        }

        public ActionResult Calendar()
        {
            ViewBag.Message = "Upcoming Events";

            return View();
        }

        public ActionResult Knews()
        {
            ViewBag.FileExtension = ".docx";
            ViewBag.ContentPath = "/Content/Pages/Knews";
            string[] articles = Directory.GetFiles(Server.MapPath("~" + ViewBag.ContentPath), "*" + ViewBag.FileExtension);
            ViewBag.Message = "Knightly Knews";
            ViewBag.articles = articles;

            return View();
        }

        public ActionResult Constitution()
        {
            return View();
        }

        public ActionResult GetHtmlPage(string path)
        {
            return new FilePathResult(path, "text/html");
        }

        public ActionResult Rush()
        {
            StreamReader RushPageFull = new StreamReader(Server.MapPath("~/Content/Pages/Rush/rushContent.html"));
            string line;
            DateTime EffectiveDateFrom, EffectiveDateto;
            Boolean shouldDisplay = false;
            string htmlOutput = "";
            while ((line = RushPageFull.ReadLine()) != null)
            {
                if (line.Trim().Contains("<!--Effective"))
                {
                    int startTime = line.IndexOf("From:") + 6;
                    int endTime = line.IndexOf("To:") + 4;
                    EffectiveDateFrom = DateTime.Parse(line.Substring(startTime, line.IndexOf(" ", startTime) - startTime).Trim());
                    EffectiveDateto = DateTime.Parse(line.Substring(endTime, line.IndexOf("-->") - endTime).Trim());
                    if (DateTime.Today >= EffectiveDateFrom && DateTime.Today <= EffectiveDateto)
                    {
                        shouldDisplay = true;
                    }
                    else
                    { 
                        shouldDisplay = false; 
                    }
                }
                if (shouldDisplay)
                {
                    htmlOutput+= line + "\n";
                }
            }
            ViewBag.rushContent = htmlOutput;
            return View();
        }

        public ActionResult Pictures()
        {
            string[] photos = Directory.GetFiles(Server.MapPath("~/Images/HomePage/"), "*.jpg");
            ViewBag.photos = photos;
            return View();
        }
    }
}