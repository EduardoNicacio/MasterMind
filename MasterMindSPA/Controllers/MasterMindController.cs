using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Domain.Enums;
using Domain.Services;
using Persistence;
using Persistence.Entities;
using Persistence.Repositories;

namespace MasterMindSPA.Controllers
{
    public class MasterMindController : Controller
    {
        public ActionResult Index()
        {
            //new DatabaseContext().CreateDataBase();
            //var serviceGame = new GameService();
            //serviceGame.Get(1);
            //StartNewGame(false, 8, "Alexandre");
            return View();
        }

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
