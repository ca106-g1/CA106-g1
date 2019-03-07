package com.adv.controller;

import java.io.*; 
import java.sql.Date;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import com.adv.model.AdvService;
import com.adv.model.AdvVO;



@MultipartConfig
public class AdvServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8135384290405612710L;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
//		req.setCharacterEncoding("UTF-8");
		
		System.out.println("檢查點101");
		
		
		doPost(req, res);
		
		res.setContentType("image/jpeg");
		ServletOutputStream out=res.getOutputStream();
		
		try {
			String ad_no = req.getParameter("ad_no").trim();
			AdvService advSvc = new AdvService();
			AdvVO advVO = advSvc.getOneAdv(ad_no);
			byte[] pic = advVO.getAd_pic();
			out.write(pic);
			
			System.out.println("檢查點102");
			
		}catch(Exception e) {
			InputStream in = getServletContext().getResourceAsStream("");
			byte[] buf = new byte[in.available()];
			in.read(buf);
			out.write(buf);
			in.close();
			
			System.out.println("檢查點103");
			
		}
		
		
		
		
		System.out.println("檢查點104");
		
//		res.setContentType("image/gif");
//		
//    	ServletOutputStream out=res.getOutputStream();
//    	
//    	
//    	byte[] printPic=null;
//		String ad_no = req.getParameter("ad_no");
//		AdvService advService = new AdvService();
//		
//		AdvVO advVO = advService.getOneAdv(ad_no);
//		printPic = advVO.getAd_pic();
//		if(printPic!=null) {
//			out.write(printPic);
//		}
//		
		
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		System.out.println("檢查點105");
		
		
		req.setCharacterEncoding("UTF-8");
		
		System.out.println("檢查點106");
		
		String action = req.getParameter("action");
		
		System.out.println("檢查點107");
		
		
		System.out.println(action);
		
		
		System.out.println("檢查點108");
		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			
			System.out.println("檢查點109");
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			
			
			
			System.out.println("檢查點110");
			
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("ad_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Back_end/adv/select_page_adv.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				String ad_no = null;
				try {
					ad_no = new String(str);
				} catch (Exception e) {
					errorMsgs.add("編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Back_end/adv/select_page_adv.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				AdvService advSvc = new AdvService();
				AdvVO advVO = advSvc.getOneAdv(ad_no);
				if (advVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Back_end/adv/select_page_adv.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("advVO", advVO); // 資料庫取出的empVO物件,存入req
				String url = "/Back_end/adv/listOneAdv.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Back_end/adv/select_page_adv.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			
			System.out.println("檢查點111");
			
			try {
				/***************************1.接收請求參數****************************************/
				String ad_no = new String(req.getParameter("ad_no"));
				
				/***************************2.開始查詢資料****************************************/
				AdvService advSvc = new AdvService();
				AdvVO advVO = advSvc.getOneAdv(ad_no);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("advVO", advVO);         // 資料庫取出的empVO物件,存入req
				String url = "/Back_end/adv/update_adv_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Back_end/adv/listAllAdv.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			
			System.out.println("檢查點112");
			
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				
//				AdvVO advVO = 	(AdvVO)req.getSession().getAttribute("advVO");
				
				
				String ad_no = new String(req.getParameter("ad_no").trim());
				
				String ad_name = req.getParameter("ad_name");
//				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (ad_name == null || ad_name.trim().length() == 0) {
					errorMsgs.add("會員編號: 請勿空白");
				} 
//				else if(!ename.trim().matches(enameReg)) { //以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
//	            }
				
//				byte[] ad_pic = null;
//				try {
//					Part part = req.getPart("ad_pic");
//					if (part.getSubmittedFileName() != "") {
//						BufferedInputStream bif = new BufferedInputStream(part.getInputStream());
//						ByteArrayOutputStream bao = new ByteArrayOutputStream();
//						int len;
//						byte[] b = new byte[8192];
//						while ((len = bif.read(b)) != -1) {
//							bao.write(b);
//						}
//						ad_pic = bao.toByteArray();
//					}
//				} catch (Exception e) {
//					errorMsgs.add("上傳照片失敗，請重新上傳");
//				}
				
				
				
				
				
				
				
				Part part = req.getPart("ad_pic");
				
				byte[] ad_pic = new byte[part.getInputStream().available()];
				part.getInputStream().read(ad_pic);
				
				
				
//				byte[] ad_pic = null;
				
				
				
//				ActivityService activitySvc1=new ActivityService();
//				 ActivityVO originActivityVO=activitySvc1.getOneActivity(activityID);
//				
//				 byte[] thisActivityPost=null; //從JSP撈回的thisActivityPost
//				 Part part = req.getPart("activityPost");
//					InputStream in = part.getInputStream();
//					thisActivityPost = new byte[in.available()];
//					in.read(thisActivityPost);
//					in.close();
//					//有更新送新資料
//					if(thisActivityPost.length!=0) {
//						activityPost=thisActivityPost;
//					//沒更新送舊資料
//					}else {
//						activityPost=originActivityVO.getActivityPost();
//					}
				
				
				
				
				
				
				
				String ad_cont = req.getParameter("ad_cont").trim();
				if (ad_cont == null || ad_cont.trim().length() == 0) {
					errorMsgs.add("優惠編號 請勿空白");
				}	
				
				
				
				
				java.sql.Date ad_start = null;
				try {
					ad_start = java.sql.Date.valueOf(req.getParameter("ad_start").trim());
				} catch (IllegalArgumentException e) {
					ad_start = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				
				java.sql.Date ad_end = null;
				try {
					ad_end = java.sql.Date.valueOf(req.getParameter("ad_end").trim());
				} catch (IllegalArgumentException e) {
					ad_end = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
			

				AdvVO advVO = new AdvVO();
				
				
				advVO.setAd_no(ad_no);
				advVO.setAd_name(ad_name);
				advVO.setAd_pic(ad_pic);
				advVO.setAd_cont(ad_cont);
				advVO.setAd_start(ad_start);
				advVO.setAd_end(ad_end);
				
				
				
//				ticketorderVO.setOrder_no(order_no);
//				ticketorderVO.setMember_no(member_no);
//				ticketorderVO.setFd_no(fd_no);
//				ticketorderVO.setSession_no(session_no);
//				ticketorderVO.setEmployee_no(employee_no);
//				ticketorderVO.setOrder_group(order_group);
//				ticketorderVO.setOrder_takemeals(order_takemeals);
//				ticketorderVO.setOrder_time(order_time);
//				ticketorderVO.setOrder_amount(order_amount);
				
				System.out.println("檢查點1");

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					System.out.println("檢查點2");
					req.setAttribute("advVO", advVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Back_end/adv/update_adv_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				AdvService advSvc = new AdvService();
				advVO = advSvc.updateAdv(ad_no, ad_name, ad_pic, ad_cont, ad_start, ad_end);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("advVO", advVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/Back_end/adv/listOneAdv.jsp";
				System.out.println("檢查點3");
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				System.out.println("檢查點4");
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Back_end/adv/update_adv_input.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			System.out.println("檢查點113");
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String ad_name = req.getParameter("ad_name");
//				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (ad_name == null || ad_name.trim().length() == 0) {
					errorMsgs.add("會員編號: 請勿空白");
				} 
//				else if(!ename.trim().matches(enameReg)) { //以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
//	            }
				
				
				System.out.println("檢查點9");
				
//				byte[] ad_pic = null;
//				try {
//					Part part = req.getPart("ad_pic");
//					if (part.getSubmittedFileName() != "") {
//						BufferedInputStream bif = new BufferedInputStream(part.getInputStream());
//						ByteArrayOutputStream bao = new ByteArrayOutputStream();
//						int len;
//						byte[] b = new byte[8192];
//						while ((len = bif.read(b)) != -1) {
//							bao.write(b);
//						}
//						ad_pic = bao.toByteArray();
//					}
//				} catch (Exception e) {
//					errorMsgs.add("上傳照片失敗，請重新上傳");
//				}
				
				
				
				
				
				Part part = req.getPart("ad_pic");
				
				System.out.println("檢查點9.1");
				
				
				byte[] ad_pic = new byte[part.getInputStream().available()];
				
				System.out.println("檢查點9.2");
				
				part.getInputStream().read(ad_pic);
				
				System.out.println("檢查點9.3");
//				byte[] ad_pic = null;
//				
//				try { 
//					InputStream in = part.getInputStream();
//					ad_pic = new byte[in.available()];
//					in.read(ad_pic);
//					in.close();
//				}catch(Exception e) {
//					errorMsgs.add("無法取得圖片"+e.getMessage());
//				}
				
				
				System.out.println("檢查點10");
				
				
				
				
				
				String ad_cont = req.getParameter("ad_cont").trim();
				if (ad_cont == null || ad_cont.trim().length() == 0) {
					errorMsgs.add("場次編號 請勿空白");
				}
				
				System.out.println("檢查點11");
				
				java.sql.Date ad_start = null;
				try {
					ad_start = java.sql.Date.valueOf(req.getParameter("ad_start").trim());
				} catch (IllegalArgumentException e) {
					ad_start = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				System.out.println("檢查點12");
				
				
				java.sql.Date ad_end = null;
				try {
					ad_end = java.sql.Date.valueOf(req.getParameter("ad_end").trim());
				} catch (IllegalArgumentException e) {
					ad_end = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				System.out.println("檢查點13");
				
				AdvVO advVO = new AdvVO();
				
				
				advVO.setAd_name(ad_name);
				advVO.setAd_pic(ad_pic);
				advVO.setAd_cont(ad_cont);
				advVO.setAd_start(ad_start);
				advVO.setAd_end(ad_end);
				
				System.out.println("檢查點14");
				

//				TicketorderVO ticketorderVO = new TicketorderVO();
				
//				ticketorderVO.setMember_no(member_no);
//				ticketorderVO.setFd_no(fd_no);
//				ticketorderVO.setSession_no(session_no);
//				ticketorderVO.setEmployee_no(employee_no);
//				ticketorderVO.setOrder_group(order_group);
//				ticketorderVO.setOrder_takemeals(order_takemeals);
//				ticketorderVO.setOrder_time(order_time);
//				ticketorderVO.setOrder_amount(order_amount);
				
				
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("advVO", advVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Back_end/adv/addAdv.jsp");
					failureView.forward(req, res);
					return;
				}
				
				System.out.println("檢查點15");
				
				/***************************2.開始新增資料***************************************/
				AdvService advSvc = new AdvService();
				advVO = advSvc.addAdv(ad_name, ad_pic, ad_cont, ad_start, ad_end);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/Back_end/adv/listAllAdv.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);		
				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				System.out.println("檢查點16");
				
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Back_end/adv/addAdv.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			System.out.println("檢查點114");
	
			try {
				/***************************1.接收請求參數***************************************/
				String ad_no = new String(req.getParameter("ad_no"));
				
				/***************************2.開始刪除資料***************************************/
				AdvService advSvc = new AdvService();
				advSvc.deleteAdv(ad_no);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/Back_end/adv/listAllAdv.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Back_end/adv/listAllAdv.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		
		
		
	}
	
	

}
