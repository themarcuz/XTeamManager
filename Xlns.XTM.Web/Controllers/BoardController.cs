using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Xlns.XTM.Core;
using Xlns.XTM.Core.Model;

namespace Xlns.XTM.Web.Controllers
{
    public class BoardController : Controller
    {
        //
        // GET: /Board/

        public ActionResult List()
        {
            var dbm = new DynamicBoardManager();
            var boards = dbm.GetAll();
            return View(boards);
        }       

    }
}
