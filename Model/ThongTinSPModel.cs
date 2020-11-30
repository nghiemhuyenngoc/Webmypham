using Model.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class ThongTinSPModel
    {
        OnlineShopDbContext context = null;

        public ThongTinSPModel()
        {
            context = new OnlineShopDbContext();
        }

        public List<ThongTinSanPham> ListAll()
        {
            var list = context.Database.SqlQuery<ThongTinSanPham>("SanPham_SelectAll").ToList();
            return list;
        }

        public List<ThongTinSanPham> ListNewProduct()
        {
            var list = context.Database.SqlQuery<ThongTinSanPham>("NEW_PRODUCT").ToList();
            return list;
        }

        public ThongTinSanPham ViewDetail(string id)
        {
            return context.ThongTinSanPhams.Find(id);


        }
    }
}
