using System.Web.Mvc;

namespace MasterMindSPA.Areas.MasterMindGame
{
    public class MasterMindGameAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "MasterMindGame";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "MasterMindGame_default",
                "MasterMindGame/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}