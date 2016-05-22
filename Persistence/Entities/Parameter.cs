// <copyright file="Game.cs" company="VanHackathon May 2016.">
// Copyleft Alexandre Rodrigues, Eduardo Nicacio, Lucas Lucci 2016.
// </copyright>
// <date>21/05/2016</date>
// <summary>Parameter object.</summary>

namespace Persistence.Entities
{
    using System.ComponentModel.DataAnnotations;

    /// <summary>
    /// Parameter object.
    /// </summary>
    public class Parameter
    {
        /// <summary>
        /// Parameter name.
        /// </summary>
        [Key, MaxLength(200)]
        public string Name { get; set; }

        /// <summary>
        /// Parameter value.
        /// </summary>
        public string Value { get; set; }
    }
}