using System.ComponentModel.DataAnnotations;

namespace Persistence.Entities
{
    public class Player
    {
        public int Id { get; set; }

        [MaxLength(500)]
        public string Name { get; set; }

        public Game Game { get; set; }
    }
}
