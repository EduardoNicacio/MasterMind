// <copyright file="Color.cs" company="VanHackathon May 2016.">
// Copyleft Alexandre Rodrigues, Eduardo Nicacio, Lucas Lucci 2016.
// </copyright>
// <date>21/05/2016</date>
// <summary>Color object.</summary>

namespace Persistence.Entities
{
    using System.ComponentModel.DataAnnotations;

    /// <summary>
    /// Color object.
    /// </summary>
    public class Color
    {
        /// <summary>
        /// Color id.
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Color name.
        /// </summary>
        [MaxLength(200)]
        public string Name { get; set; }

        /// <summary>
        /// Color RGB code.
        /// </summary>
        [MaxLength(200)]
        public string Rgb { get; set; }
    }
}