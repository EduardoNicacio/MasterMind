// <copyright file="Enums.cs" company="VanHackathon May 2016.">
// Copyleft Alexandre Rodrigues, Eduardo Nicacio, Lucas Lucci 2016.
// </copyright>
// <date>21/05/2016</date>
// <summary>Domain Enum definitions.</summary>

namespace Domain.Enums
{
    /// <summary>
    /// Game status enum.
    /// </summary>
    public enum GameStatus
    {
        /// <summary>
        /// Game status = started.
        /// </summary>
        Started = 'S',
        
        /// <summary>
        /// Game status = waiting second player.
        /// </summary>
        WaitingPlayer = 'W',

        /// <summary>
        /// Game status = finished.
        /// </summary>
        Finished = 'F'
    }
}