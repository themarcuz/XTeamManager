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
        DynamicBoardManager dbm = new DynamicBoardManager();

        public ActionResult List()
        {
            var boards = dbm.GetAll();
            return View(boards);
        }

        public void SaveTitle(int IdBoard, string Title)
        {
            var board = dbm.GetById(IdBoard);
            board.Name = Title;
            dbm.Save(board);
        }

    }
}
