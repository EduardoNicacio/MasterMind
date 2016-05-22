using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Persistence.Entities
{
    public class Game
    {
        public int Id { get; set; }

        public bool Multiplayer { get; set; }

        public int TotalColors { get; set; }

        public int TotalLines { get; set; }

        [MaxLength(1)]
        public string Status { get; set; }

        public int Score { get; set; }

        public IList<Player> Players { get; set; }

        public IList<Column> Code { get; set; }

        public IList<Line> Lines { get; set; }
    }
}
