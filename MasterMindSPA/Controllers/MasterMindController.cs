// <copyright file="MasterMindController.cs" company="VanHackathon May 2016.">
// Copyleft Alexandre Rodrigues, Eduardo Nicacio, Lucas Lucci 2016.
// </copyright>
// <date>21/05/2016</date>
// <summary>MasterMind controller.</summary>

using System.Collections.Generic;
using System.Linq;
using Domain.Enums;
using Persistence;
using Persistence.Entities;
using Persistence.Repositories;

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
                Game game;
                using (var dataContext = new DatabaseContext())
                {
                    var gameService = new GameService(dataContext);
                    game = gameService.StartNewGame(multiplayer, totalColors, playerName);
                }

                return View(game);
            }
            catch (Exception ex)
            {
                return Json(new
                {
                    sucess = false,
                    error = ex.Message
                }, JsonRequestBehavior.AllowGet);
            }
        }

        /// <summary>
        /// Check line action.
        /// </summary>
        /// <param name="valueColumns">Column value.</param>
        /// <param name="gameId">Game Id</param>
        /// <returns>ActionResult.</returns>
        [HttpPost]
        public ActionResult CheckLine(string valueColumns, int gameId)
        {
            try
            {
                int nextLine;
                int countCorrectPositions;
                var countCorrectColors = 0;
                Game game;

                using (var dataContext = new DatabaseContext())
                {
                    var gameService = new GameService(dataContext);
                    game = gameService.Get(gameId);
                    var line = new Line { Number = game.Lines.Count + 1 };

                    var values = valueColumns.Split(new[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
                    var colorService = new ColorService(dataContext);
                    var count = 1;

                    line.Columns = new List<Column>();
                    foreach (var value in values)
                    {
                        var color = colorService.GetByColor(value);
                        var column = new Column
                        {
                            Color = color,
                            Position = count,
                            Valid = game.Code.First(c => c.Position == count).Color.Id == color.Id
                        };

                        line.Columns.Add(column);
                        count++;
                    }

                    countCorrectPositions = line.Columns.Count(c => c.Valid);
                    line.CorrectPositions = countCorrectPositions;
                    line.Valid = line.CorrectPositions == game.TotalColors;

                    var colorsLine = line.Columns.Select(c => c.Color.Id).ToList();
                    var colorsCode = game.Code.Select(c => c.Color.Id).ToList();

                    foreach (var i in colorsLine)
                    {
                        if (colorsCode.Count(c => c.Equals(i)) > 0)
                        {
                            countCorrectColors++;
                            colorsCode.Remove(i);
                        }
                    }

                    line.CorrectColors = countCorrectColors;
                    game.Lines.Add(line);
                    line.Game = game;

                    var lineService = new LineService(dataContext);
                    lineService.Insert(line);

                    if (!line.Valid)
                    {
                        game.Score = game.Score - 1;
                    }

                    if (game.TotalLines == game.Lines.Count)
                    {
                        game.Status = ((char)(GameStatus.Finished)).ToString();

                    }

                    gameService.Update(game);
                    nextLine = game.Lines.Count + 1;
                }

                return
                    Json(
                        new
                        {
                            success = true,
                            nextLine,
                            countCorrectPositions,
                            countCorrectColors = countCorrectColors - countCorrectPositions,
                            countWrong = game.TotalColors - countCorrectColors
                        }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new
                {
                    sucess = false,
                    error = ex.Message
                }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}