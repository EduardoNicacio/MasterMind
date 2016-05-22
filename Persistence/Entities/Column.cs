// <copyright file="Color.cs" company="VanHackathon May 2016.">
// Copyleft Alexandre Rodrigues, Eduardo Nicacio, Lucas Lucci 2016.
// </copyright>
// <date>21/05/2016</date>
// <summary>Column object.</summary>

namespace Persistence.Entities
{
    /// <summary>
    /// Column object.
    /// </summary>
    public class Column
    {
        /// <summary>
        /// Column id.
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Column position.
        /// </summary>
        public int Position { get; set; }

        /// <summary>
        /// Column is valid.
        /// </summary>
        public bool Valid { get; set; }

        /// <summary>
        /// Column Color.
        /// </summary>
        public Color Color { get; set; }

        /// <summary>
        /// Column Game.
        /// </summary>
        public Game Game { get; set; }

        /// <summary>
        /// Column Line.
        /// </summary>
        public Line Line { get; set; }
    }
}