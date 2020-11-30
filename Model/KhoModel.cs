using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.Framework;

namespace Model
{
    public class KhoModel
    {
        private OnlineShopDbContext context = null;

        public KhoModel()
        {
            context = new OnlineShopDbContext();
        }

        public List<Kho> ListAll()
        {
            var list = context.Database.SqlQuery<Kho>("Kho_SelectAll").ToList();
            return list;
        }
    }
}
