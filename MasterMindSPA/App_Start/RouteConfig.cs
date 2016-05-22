// <copyright file="RouteConfig.cs" company="VanHackathon May 2016.">
// Copyleft Alexandre Rodrigues, Eduardo Nicacio, Lucas Lucci 2016.
// </copyright>
// <date>21/05/2016</date>
// <summary>Route configuration class.</summary>

namespace MasterMindSPA
{
    using System.Web.Mvc;
    using System.Web.Routing;

    /// <summary>
    /// Route configuration class.
    /// </summary>
    public class RouteConfig
    {
        /// <summary>
        /// Register the application routes.
        /// </summary>
        /// <param name="routes">Route Collection.</param>
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}