package ezs.ren_favorites.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import ezs.member.model.MemberVO;
import ezs.ren_favorites.model.RenFavoritesService;
import ezs.ren_favorites.model.RenFavoritesVO;

@WebServlet("/RenFavoritesServlet.do")
public class RenFavoritesServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");		
		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Map<String, String[]> map = req.getParameterMap();
				
				/*************************** 2.開始查詢資料 *****************************************/
				RenFavoritesService renFavSvc = new RenFavoritesService();
				List<RenFavoritesVO> list  = renFavSvc.getAll(map);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("listOneRenFavorites", list);
				RequestDispatcher successView = req.getRequestDispatcher("/frontend/ren_favorites/listOneRenFavorites.jsp");
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ren_favorites/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		
		if ("add".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			Integer favLisId = new Integer(req.getParameter("favLisId"));
			Integer favMemId =	new Integer(req.getParameter("favMemId"));
			java.sql.Timestamp favAddTime = null;
			try {
				favAddTime = new java.sql.Timestamp(System.currentTimeMillis());
			} catch (IllegalArgumentException e) {
				favAddTime = new java.sql.Timestamp(System.currentTimeMillis());
				errorMsgs.add("Enter time!");
			}
//			
//			try {
//				RenFavoritesService renFavSvc = new RenFavoritesService();
//				renFavSvc.addRenFav(favLisId, favMemId, favAddTime);
//				i=1;
//				//如果已收藏將會移除收藏
//			} catch (Exception e) {
//				if(i==0) {
//					RenFavoritesService renFavSvc = new RenFavoritesService();
//					renFavSvc.deleteRenFav(favLisId, favMemId);
//				}
//			}
			
			String url = "/frontend/ren_listing/GetOneRenListingServlet.do?lisID="+favLisId+"&action=getOne_For_Display_A";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
			
		}
		


		if ("delete".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer favLisId = new Integer(req.getParameter("favLisId"));
				Integer favMemId = new Integer(req.getParameter("favMemId"));

				/*************************** 2.開始刪除資料 ***************************************/
				RenFavoritesService renFavSvc = new RenFavoritesService();
				renFavSvc.deleteRenFav(favLisId, favMemId);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/frontend/ren_favorites/listOneRenFavorites.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ren_favorites/listOneRenFavorites.jsp");
				failureView.forward(req, res);
			}
		}
	}
}

