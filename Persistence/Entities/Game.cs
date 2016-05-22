// <copyright file="Game.cs" company="VanHackathon May 2016.">
// Copyleft Alexandre Rodrigues, Eduardo Nicacio, Lucas Lucci 2016.
// </copyright>
// <date>21/05/2016</date>
// <summary>Game object.</summary>

namespace Persistence.Entities
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    /// <summary>
    /// Game object
    /// </summary>
    public class Game
    {
        /// <summary>
        /// Game id.
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Multiplayer?
        /// </summary>
        public bool Multiplayer { get; set; }

        /// <summary>
        /// Game total colors (1-8).
        /// </summary>
        public int TotalColors { get; set; }

        /// <summary>
        /// Game total lines - default 10.
        /// </summary>
        public int TotalLines { get; set; }

        /// <summary>
        /// Game status (S = started; W = waiting second player; F = finished).
        /// </summary>
        [MaxLength(1)]
        public string Status { get; set; }

        /// <summary>
        /// Score - from 10 to 0.
        /// </summary>
        public int Score { get; set; }

        /// <summary>
        /// List of players (for multiplayer games).
        /// </summary>
        public IList<Player> Players { get; set; }

        /// <summary>
        /// List of columns.
        /// </summary>
        public IList<Column> Code { get; set; }

        /// <summary>
        /// List of lines.
        /// </summary>
        public IList<Line> Lines { get; set; }
    }
}