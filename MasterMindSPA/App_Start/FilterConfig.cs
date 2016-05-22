// <copyright file="FilterConfig.cs" company="VanHackathon May 2016.">
// Copyleft Alexandre Rodrigues, Eduardo Nicacio, Lucas Lucci 2016.
// </copyright>
// <date>21/05/2016</date>
// <summary>Filter configuration class.</summary>

namespace MasterMindSPA
{
    using System.Web;
    using System.Web.Mvc;

    /// <summary>
    /// Filter configuration class.
    /// </summary>
    public class FilterConfig
    {
        /// <summary>
        /// Register global filters.
        /// </summary>
        /// <param name="filters">Global Filter Collection.</param>
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}