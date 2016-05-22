using System.ComponentModel.DataAnnotations;

namespace Persistence.Entities
{
    public class Color
    {
        public int Id { get; set; }

        [MaxLength(200)]
        public string Name { get; set; }

        [MaxLength(200)]
        public string Rgb { get; set; }
    }
}
