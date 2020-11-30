using Model.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class LoaiSanPhamModel
    {
        private OnlineShopDbContext context = null;

        public LoaiSanPhamModel()
        {
            context = new OnlineShopDbContext();
        }

        public List<LoaiSanPham> ListAll()
        {
            var list = context.Database.SqlQuery<LoaiSanPham>("Select * from LoaiSanPham").ToList();
            return list;
        }
    }
}
