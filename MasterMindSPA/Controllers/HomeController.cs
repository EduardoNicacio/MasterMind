// <copyright file="HomeController.cs" company="VanHackathon May 2016.">
// Copyleft Alexandre Rodrigues, Eduardo Nicacio, Lucas Lucci 2016.
// </copyright>
// <date>21/05/2016</date>
// <summary>Homepage controller.</summary>

namespace MasterMindSPA.Controllers
{
    using System.Web.Mvc;

    /// <summary>
    /// Homepage Controller.
    /// </summary>
    public class HomeController : Controller
    {
        /// <summary>
        /// Default action.
        /// </summary>
        /// <returns>ActionResult.</returns>
        public ActionResult Index()
        {
            return View();
        }
    }
}