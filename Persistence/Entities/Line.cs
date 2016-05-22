using System.Collections.Generic;

namespace Persistence.Entities
{
    public class Line
    {
        public int Id { get; set; }

        public int Number { get; set; }

        public int CorrectColors { get; set; }

        public int CorrectPositions { get; set; }

        public bool Valid { get; set; }

        public Game Game { get; set; }

        public List<Column> Columns { get; set; }
    }
}
