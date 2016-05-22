// <copyright file="MasterMindController.cs" company="VanHackathon May 2016.">
// Copyleft Alexandre Rodrigues, Eduardo Nicacio, Lucas Lucci 2016.
// </copyright>
// <date>21/05/2016</date>
// <summary>MasterMind controller.</summary>

namespace MasterMindSPA.Controllers
{
    using Domain.Services;
    using System;
    using System.Web.Mvc;

    /// <summary>
    /// MasterMind Controller.
    /// </summary>
    public class MasterMindController : Controller
    {
        /// <summary>
        /// Default action.
        /// </summary>
        /// <returns>ActionResult.</returns>
        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// Game action.
        /// </summary>
        /// <param name="multiplayer">If the game is multiplayer.</param>
        /// <param name="totalColors">Total colors (default = 8).</param>
        /// <param name="playerName">Player name.</param>
        /// <returns></returns>
        public ActionResult Game(bool multiplayer, int totalColors, string playerName)
        {
            try
            {
                var gameService = new GameService();
                var game = gameService.StartNewGame(multiplayer, totalColors, playerName);

                return View(game);
            }
            catch (Exception ex)
            {
                return Json(new { sucess = false, error = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        /// <summary>
        /// Check line action.
        /// </summary>
        /// <param name="valueColumn">Column value.</param>
        /// <returns>ActionResult.</returns>
        [HttpPost]
        public ActionResult CheckLine(string valueColumn)
        {
            // Código para validar a linha
            // Gravar linha no DB vinculada ao jogo
            // .....


            // Retornar no Json o que for precisar na tela.
            // Resultado da validação da linha
            // Informações da próxima e/ou das anteriores
            // .....

            return Json(new { success = true }, JsonRequestBehavior.AllowGet);
        }
    }
}