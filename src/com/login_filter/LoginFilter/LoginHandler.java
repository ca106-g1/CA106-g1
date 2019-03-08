package com.login_filter.LoginFilter;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSession;

import com.mem.model.MemService;
import com.mem.model.MemVO;

@WebServlet("/loginhandler")
public class LoginHandler extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		String action = req.getParameter("action");
		
		if ("getone_for_login".equals(action)) { // 來自Login.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/************* 1.接收請求參數 輸入格式的錯誤處理 ***********/
				/* 帳號錯誤處理 */
				String str1 = req.getParameter("member_account");
				if (str1 == null || (str1.trim()).length() == 0) {
					errorMsgs.add("請輸入帳號");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/Front_end/Login.jsp");
					failureView.forward(req, res);
					return;
				}

				String member_account = null;
				try {
					member_account = new String(str1);
				} catch (Exception e) {
					errorMsgs.add("會員帳號格式不正確");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/Front_end/Login.jsp");
					failureView.forward(req, res);
					return;
				}

				/* 密碼錯誤處理 */

				String str2 = req.getParameter("member_password");
				if (str2 == null || (str2.trim()).length() == 0) {
					errorMsgs.add("請輸入密碼");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/Front_end/Login.jsp");
					failureView.forward(req, res);
					return;
				}

				String member_password = null;
				try {
					member_password = new String(str2);
				} catch (Exception e) {
					errorMsgs.add("會員密碼格式不正確");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/Front_end/Login.jsp");
					failureView.forward(req, res);
					return;
				}

				/*********************** 2.開始查詢資料 **************************/
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.getoneByAccountMem(member_account);
				if (memVO == null) {
					errorMsgs.add("帳號輸入錯誤");

				} 
					
				else if (!memVO.getMember_password().equals(req.getParameter("member_password"))) {
						errorMsgs.add("密碼輸入錯誤");
					}
				

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/Front_end/Login.jsp");
					failureView.forward(req, res);
					return;
				}
System.out.println("檢查點1");
				/************************* 3.查詢完成 準備轉交 ***********************************/
				//req.getSession().setAttribute("memVO", memVO); // 資料庫取出的empVO物件，存入reqi
System.out.println("檢查點2");
				
				HttpSession session = req.getSession();
				session.setAttribute("memVO", memVO);
				
System.out.println("檢查點3");				
				try {
				
System.out.println("檢查點4");

					String location =(String) session.getAttribute("location");
					if (location !=null) {
						
System.out.println("檢查點5");

						session.removeAttribute("location");
						res.sendRedirect(location);
						return;

					}
					
System.out.println("檢查點6");				

				}catch( Exception ignored) { }
				
System.out.println("檢查點7");		

				res.sendRedirect(req.getContextPath()+"/Front_end/mem/select_page.jsp");
				
System.out.println("檢查點8");	

//				String url = "/Front_end/mem/select_page.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交至LoginSucess.jsp
//				successView.forward(req, res);
				
				/***********************其他可能錯誤處理*************/
System.out.println("檢查點9");

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failView = req.getRequestDispatcher("/Front_end/Login.jsp");
				failView.forward(req, res);
				
System.out.println("檢查點10");
			}
		}
	}
	
}
