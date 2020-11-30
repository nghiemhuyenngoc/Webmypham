using Model.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    [Serializable]
    public class CartItem
    {
        public ThongTinSanPham Product{get; set;}
        public int Quantity { get; set; }

    
    }
}
