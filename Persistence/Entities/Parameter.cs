using System.ComponentModel.DataAnnotations;

namespace Persistence.Entities
{
    public class Parameter
    {
        [Key, MaxLength(200)]
        public string Name { get; set; }

        public string Value { get; set; }
    }
}
