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
        private static NLog.Logger logger = NLog.LogManager.GetCurrentClassLogger();
        
        DynamicBoardManager dbm = new DynamicBoardManager();

        public ActionResult List()
        {
            var boards = dbm.GetAll();
            return View(boards);
        }

        public ActionResult Detail(int Id, int? IdPerspective = null)
        {
            var board = dbm.GetById(Id);
            return View(board);
        }

        [HttpPost]
        public void SaveName(int Id, string Value)
        {
            var board = dbm.GetById(Id);
            board.Name = Value;            
            dbm.Save(board);
        }

        [HttpPost]
        public void SaveDescription(int Id, string Value)
        {
            var board = dbm.GetById(Id);
            board.Description = Value;
            dbm.Save(board);
        }

    }
}
