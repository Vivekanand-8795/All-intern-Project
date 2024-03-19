using Microsoft.AspNetCore.Mvc;

namespace Firstcore.Controllers
{
    public class HomeController : Controller
    {

        [Route("Home/Index")]
        public IActionResult Index()
        {
            return View();
        }
        
        [Route("Home/num/{id?}")]
        public int Num(int ? id)
        {
            return id ?? 696;
        }
    }
}
