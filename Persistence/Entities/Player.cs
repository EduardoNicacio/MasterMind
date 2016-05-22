// <copyright file="Game.cs" company="VanHackathon May 2016.">
// Copyleft Alexandre Rodrigues, Eduardo Nicacio, Lucas Lucci 2016.
// </copyright>
// <date>21/05/2016</date>
// <summary>Player object.</summary>

namespace Persistence.Entities
{
    using System.ComponentModel.DataAnnotations;

    /// <summary>
    /// Player object.
    /// </summary>
    public class Player
    {
        /// <summary>
        /// Player id.
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Player name.
        /// </summary>
        [MaxLength(500)]
        public string Name { get; set; }

        /// <summary>
        /// Player Game.
        /// </summary>
        public Game Game { get; set; }
    }
}