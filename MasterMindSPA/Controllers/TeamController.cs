// <copyright file="TeamController.cs" company="VanHackathon May 2016.">
// Copyleft Alexandre Rodrigues, Eduardo Nicacio, Lucas Lucci 2016.
// </copyright>
// <date>21/05/2016</date>
// <summary>Team page controller.</summary>

namespace MasterMindSPA.Controllers
{
    using System.Web.Mvc;

    /// <summary>
    /// Team page controller.
    /// </summary>
    public class TeamController : Controller
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