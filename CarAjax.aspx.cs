using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarAjax
{
    public partial class CarAjax : System.Web.UI.Page
    {
        public static List<string> listCars = new List<string>() { "Honda", "Toyota", "Ferrari", "Mercedes" };
        
        public static List<string> GetIntellisense(string name)
        {
            var suggestList = new List<string>();
            foreach(var i in listCars)
            {
                if (i.ToLower().Contains(name))
                {
                    suggestList.Add(i);
                }
            }
           
            return suggestList;
        }
    protected void Page_Load(object sender, EventArgs e)
        {

        }
    }


}