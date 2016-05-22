namespace Persistence.Entities
{
    public class Column
    {
        public int Id { get; set; }

        public int Position { get; set; }

        public bool Valid { get; set; }

        public Color Color { get; set; }

        public Game Game { get; set; }

        public Line Line { get; set; }
    }
}
