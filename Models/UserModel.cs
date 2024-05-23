using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChatApp.Models
{
    public class UserModel
    {
        public int userID { get; set; }
        public string userName { get; set; }
        public string userPass { get; set; }
        public bool userStatus { get; set; }

    }
}
