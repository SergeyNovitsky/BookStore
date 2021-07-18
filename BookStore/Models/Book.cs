using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookStore.Models
{
    public class Book
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public Author Author { get; set; }
        public Publisher Publisher { get; set; }
        public int PublicationYear { get; set; }
        public Genre Genre { get; set; }
    }
}