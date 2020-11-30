using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Model.Framework;

namespace Models
{
    public class UserAccountModel
    {
        private OnlineShopDbContext context = null;

        public UserAccountModel()
        {
            context = new OnlineShopDbContext();
        }
        public bool Login(string userName, string password)
        {
            object[] sqlParams =
             {
                new SqlParameter("@username", userName),
                new SqlParameter("@password", password),
            };
            var res = context.Database.SqlQuery<bool>("Sp_Account_Login @username,@password", sqlParams).SingleOrDefault();
            return res;
        }
    }
}


   