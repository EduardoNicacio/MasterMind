// <copyright file="Game.cs" company="VanHackathon May 2016.">
// Copyleft Alexandre Rodrigues, Eduardo Nicacio, Lucas Lucci 2016.
// </copyright>
// <date>21/05/2016</date>
// <summary>Line object.</summary>

namespace Persistence.Entities
{
    using System.Collections.Generic;

    /// <summary>
    /// Line object.
    /// </summary>
    public class Line
    {
        /// <summary>
        /// Line id.
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Line number (default from 1 to 10)
        /// </summary>
        public int Number { get; set; }

        /// <summary>
        /// Line correct colors (from 1 to 8)
        /// </summary>
        public int CorrectColors { get; set; }

        /// <summary>
        /// Line correct positions (from 1 to 8)
        /// </summary>
        public int CorrectPositions { get; set; }

        /// <summary>
        /// Line is valid.
        /// </summary>
        public bool Valid { get; set; }

        /// <summary>
        /// Line game.
        /// </summary>
        public Game Game { get; set; }

        /// <summary>
        /// Line Columns.
        /// </summary>
        public List<Column> Columns { get; set; }
    }
}