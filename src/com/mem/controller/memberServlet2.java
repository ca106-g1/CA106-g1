package com.mem.controller;


import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.mem.model.MemService;
import com.mem.model.MemVO;

@MultipartConfig
public class memberServlet2 extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest req, HttpServletResponse res)
		throws ServletException,IOException{
		doPost(req,res);
		
		
		res.setContentType("image/jpeg");
		ServletOutputStream out=res.getOutputStream();
		
		try {
			String member_no = req.getParameter("member_no").trim();
			MemService memSvc = new MemService();
			MemVO memVO = memSvc.getoneMem(member_no);
			byte[] pic = memVO.getMember_picture();
			out.write(pic);
		}catch(Exception e) {
			InputStream in = getServletContext().getResourceAsStream("");
			byte[] buf = new byte[in.available()];
			in.read(buf);
			out.write(buf);
			in.close();
		}
		
		
		
		
		
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
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
					RequestDispatcher failureView = req.getRequestDispatcher("/Front_end/mem/Login.jsp");
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
					RequestDispatcher failureView = req.getRequestDispatcher("/Front_end/mem/Login.jsp");
					failureView.forward(req, res);
					return;
				}

				/* 密碼錯誤處理 */

				String str2 = req.getParameter("member_password");
				if (str2 == null || (str2.trim()).length() == 0) {
					errorMsgs.add("請輸入密碼");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/Front_end/mem/Login.jsp");
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
					RequestDispatcher failureView = req.getRequestDispatcher("/Front_end/mem/Login.jsp");
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
					RequestDispatcher failureView = req.getRequestDispatcher("/Front_end/mem/Login.jsp");
					failureView.forward(req, res);
					return;
				}

				/************************* 3.查詢完成 準備轉交 ***********************************/
				req.setAttribute("memVO", memVO); // 資料庫取出的empVO物件，存入req
				String url = "/Front_end/mem/select_page.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交至LoginSucess.jsp
				successView.forward(req, res);
				
				/***********************其他可能錯誤處理*************/

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failView = req.getRequestDispatcher("/Front_end/mem/Login.jsp");
				failView.forward(req, res);

			}
		}
		
		
		if("getOne_for_Update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs",errorMsgs);
			try {
				
				/*****************1.接收請求參數******************/
				String member_no = new String(req.getParameter("member_no"));
				
				/*****************2.***************************/
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.getoneMem(member_no);
				
				/**************3.**********************/
				
				req.setAttribute("memVO",memVO);
				String url= "/Front_end/mem/update_mem_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/******************************/
	
			}catch(Exception e) {
				errorMsgs.add("錯誤" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Front_end/mem/listAll.jsp");
				failureView.forward(req, res);
			}
			
			
			
		}
		
		
		
		if("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
//try {
	
				String member_no = new String(req.getParameter("member_no").trim());
				System.out.println(member_no);
				String member_account = req.getParameter("member_account");
//				String member_accountReg = "^[(a-zA-Z0-9)]{2,10}$";
//				//System.out.println(!member_account.trim().matches(member_accountReg));
//					if(member_account==null || member_account.trim().length()==0) {
//						errorMsgs.add("會員帳號: 請勿空白");
//					}else if (!member_account.trim().matches(member_accountReg)) {
//						errorMsgs.add("員工姓名: 只能是英文、數字 ，且長度必須在2~10之間");
//					}
				System.out.println("檢查點1");
			/***********會員密碼*******************/
					
					String member_password = req.getParameter("member_password");
					String member_passwordReg = "^[(a-zA-Z0-9)]{2,20}$";
					//System.out.println(!member_password.trim().matches(member_passwordReg));
						if(member_password==null || member_password.trim().length()==0) {
							errorMsgs.add("會員密碼: 請勿空白");
						}else if (!member_password.trim().matches(member_passwordReg)) {
							errorMsgs.add("會員密碼: 只能是英文、數字，且長度必須在2~10之間");
						}
				System.out.println("檢查點2");
			/***********再次確認會員密碼*****************/			
						String member_password1 = req.getParameter("member_password1");
						String member_passwordReg1 = "^[(a-zA-Z0-9)]{2,20}$";
						//System.out.println(!member_password1.trim().matches(member_passwordReg1));
							if(member_password1==null || member_password1.trim().length()==0) {
								errorMsgs.add("會員密碼: 請勿空白");
							}else if (!member_password1.trim().matches(member_passwordReg1)) {
								errorMsgs.add("會員密碼: 只能是英文、數字，且長度必須在2~10之間");
							}
							
							
						if (!member_password .equals (member_password1)) {
								errorMsgs.add("會員密碼輸入不一致 請重新輸入");
							}
				System.out.println("檢查點3");			
			/****************會員姓名***************************/
							
						String member_name = req.getParameter("member_name");
						String member_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
						//System.out.println(!member_name.trim().matches(member_nameReg));
							if(member_name==null || member_name.trim().length()==0) {
								errorMsgs.add("會員姓名: 請勿空白");
							}else if (!member_name.trim().matches(member_nameReg)) {
								errorMsgs.add("會員姓名: 只能是中文、英文、數字和_ ，且長度必須在2~10之間");
							}
				System.out.println("檢查點4");
			/****************會員暱稱****************************/	
							
						String member_nick = req.getParameter("member_nick");
						
				System.out.println("檢查點5");		
			/****************會員性別********************************/
							
						Integer member_sex = null;
						try {
							member_sex = new Integer(req.getParameter("member_sex").trim());
						}catch(Exception e) {
							errorMsgs.add("請勾選性別");
						}
				System.out.println("檢查點6");		
			/*****************會員生日*************************************/
						java.sql.Date member_birthday = null;
						try {
							member_birthday = java.sql.Date.valueOf(req.getParameter("member_birthday").trim());
						}catch(IllegalArgumentException e) {
							member_birthday = new java.sql.Date(System.currentTimeMillis());
							errorMsgs.add("請輸入日期");
							
						}
				System.out.println("檢查點7");		
			/*****************地址***********************************/
						
				
						String member_address = req.getParameter("member_address");
						String member_addressReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,50}$";
						//System.out.println(!member_address.trim().matches(member_addressReg));
							if(member_address==null || member_address.trim().length()==0) {
								errorMsgs.add("地址名稱: 請勿空白");
							}else if (!member_address.trim().matches(member_addressReg)) {
								errorMsgs.add("地址名稱: 只能是中文、英文、數字和_符號 ");
							}
				System.out.println("檢查點8");		
			/*****************電話*************************************/
							
						String member_telephone = req.getParameter("member_telephone");
						String member_telephoneReg = "^[(0-9)]{2,20}$";
						//System.out.println(!member_telephone.trim().matches(member_telephoneReg));
							if(member_telephone==null || member_telephone.trim().length()==0) {
								errorMsgs.add("電話名稱: 請勿空白");
							}else if (!member_telephone.trim().matches(member_telephoneReg)) {
								errorMsgs.add("電話名稱: 數字和 - 符號 ");
							}
				System.out.println("檢查點9");			
			/******************信箱************************************/
						
						String member_email = req.getParameter("member_email");
						String member_emailReg = "^[(a-zA-Z0-9_@.)]{2,50}$";
						//System.out.println(!member_email.trim().matches(member_emailReg));
							if(member_email==null || member_email.trim().length()==0) {
								errorMsgs.add("信箱: 請勿空白");
							}else if (!member_email.trim().matches(member_emailReg)) {
								errorMsgs.add("信箱: 只能是英文、數字、@ _  符號 ");
							}	
				System.out.println("檢查點10");		
			/****************會員圖片*****************************/
//						Part part = req.getPart("member_picture");
//						BufferedInputStream buf = new BufferedInputStream(part.getInputStream());
//						ByteArrayOutputStream bao = new ByteArrayOutputStream();
//						int i ;
//						byte b[] = new byte[8192];
//						while((i=buf.read(b)) !=-1) {
//							
//							bao.write(b,0,i);
//						}
//						byte[] member_picture = bao.toByteArray();
						
						
						Part part = req.getPart("member_picture");
						

						byte[] member_picture = new byte[part.getInputStream().available()]; 
						part.getInputStream().read(member_picture);
				System.out.println("檢查點12");		
			/*************信用卡號碼*******************************/
						
						String member_credit_number = req.getParameter("member_credit_number");
				System.out.println("檢查點13");
			/*************背面末三碼*******************************/
						
						Integer member_back_verification =null;
						member_back_verification = new Integer(req.getParameter("member_back_verification").trim());
				System.out.println("檢查點14");
			/***************會員被建立日期*********************************/
					
						java.sql.Date member_buildday = new java.sql.Date(System.currentTimeMillis());
				System.out.println("檢查點15");
			/***************會員點數*************************/
						Integer member_point = 0;
						System.out.println("檢查點16");		
			/***************會員狀態*************************/
						
						String member_status = null;
						System.out.println("檢查點17");		
						
						
						
						MemVO memVO = new MemVO();
						memVO.setMember_no(member_no);
						memVO.setMember_account(member_account);
						memVO.setMember_password(member_password);
						memVO.setMember_name(member_name);
						memVO.setMember_nick(member_nick);
						memVO.setMember_sex(member_sex);
						memVO.setMember_birthday(member_birthday);
						memVO.setMember_address(member_address);
						memVO.setMember_telephone(member_telephone);
						memVO.setMember_email(member_email);
						memVO.setMember_picture(member_picture);
						memVO.setMember_credit_number(member_credit_number);
						memVO.setMember_back_verification(member_back_verification);
						memVO.setMember_buildday(member_buildday);
						memVO.setMember_point(member_point);
						memVO.setMember_status(member_status);
						
						System.out.println("檢查點18");
						
						
						if(!errorMsgs.isEmpty()) {
							req.setAttribute("memVO",memVO);//含有錯誤格式的memVO物件 也存入req
							RequestDispatcher failureView = req
									.getRequestDispatcher("/Front_end/mem/update_mem_input.jsp");
							failureView.forward(req,res);
							return;
						}
						System.out.println("檢查點20");
						/****************************2開始新增資料******************************/
						MemService memSvc = new MemService();
						memVO = memSvc.updateMem(member_no,member_account,member_password,member_name,member_nick,member_sex,member_birthday,member_address,member_telephone,member_email,member_picture,member_credit_number,member_back_verification,member_buildday,member_point,member_status);
						
						System.out.println("檢查點21");
						/****************************3.新增完成 準備轉交***********************/
						
						req.setAttribute("memVO",memVO);
						String url = "/Front_end/mem/listOneMem.jsp";
						RequestDispatcher successView = req.getRequestDispatcher(url);
						successView.forward(req, res);
						
						System.out.println("檢查點22");
						/******************其他可能的錯誤處理************************/
						
					
//						}catch(Exception e) {
//							
//							errorMsgs.add(e.getMessage());
//							RequestDispatcher failureView = req
//									.getRequestDispatcher("/Front_end/mem/update_mem_input.jsp");
//							failureView.forward(req, res);
//							
//							System.out.println("檢查點23");
//							e.printStackTrace();
//						}
	
		}
		
	
		if("insert".equals(action)) {
			System.out.println("檢查點1");
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs" , errorMsgs);
			
			
			
			/************會員帳號****************/
			
			try {
				
				String member_account = req.getParameter("member_account");
				String member_accountReg = "^[(a-zA-Z0-9)]{2,10}$";
				//System.out.println(!member_account.trim().matches(member_accountReg));
					if(member_account==null || member_account.trim().length()==0) {
						errorMsgs.add("會員帳號: 請勿空白");
					}else if (!member_account.trim().matches(member_accountReg)) {
						errorMsgs.add("員工姓名: 只能是英文、數字 ，且長度必須在2~10之間");
					}
					System.out.println("檢查點2");
			/***********會員密碼*******************/
					
					String member_password = req.getParameter("member_password");
					String member_passwordReg = "^[(a-zA-Z0-9)]{2,20}$";
					//System.out.println(!member_password.trim().matches(member_passwordReg));
						if(member_password==null || member_password.trim().length()==0) {
							errorMsgs.add("會員密碼: 請勿空白");
						}else if (!member_password.trim().matches(member_passwordReg)) {
							errorMsgs.add("會員密碼: 只能是英文、數字，且長度必須在2~10之間");
						}
						System.out.println("檢查點2");
			/***********再次確認會員密碼*****************/			
						String member_password1 = req.getParameter("member_password1");
						String member_passwordReg1 = "^[(a-zA-Z0-9)]{2,20}$";
						//System.out.println(!member_password1.trim().matches(member_passwordReg1));
							if(member_password1==null || member_password1.trim().length()==0) {
								errorMsgs.add("會員密碼: 請勿空白");
							}else if (!member_password1.trim().matches(member_passwordReg1)) {
								errorMsgs.add("會員密碼: 只能是英文、數字，且長度必須在2~10之間");
							}
							
							
						if (!member_password .equals (member_password1)) {
								errorMsgs.add("會員密碼輸入不一致 請重新輸入");
							}
						System.out.println("檢查點3");
			/****************會員姓名***************************/
							
						String member_name = req.getParameter("member_name");
						String member_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
						//System.out.println(!member_name.trim().matches(member_nameReg));
							if(member_name==null || member_name.trim().length()==0) {
								errorMsgs.add("會員姓名: 請勿空白");
							}else if (!member_name.trim().matches(member_nameReg)) {
								errorMsgs.add("會員姓名: 只能是中文、英文、數字和_ ，且長度必須在2~10之間");
							}
							System.out.println("檢查點4");
			/****************會員暱稱****************************/	
							
						String member_nick = req.getParameter("member_nick");
						
						
			/****************會員性別********************************/
							
						Integer member_sex = null;
						try {
							member_sex = new Integer(req.getParameter("member_sex").trim());
						}catch(Exception e) {
							errorMsgs.add("請勾選性別");
						}
						System.out.println("檢查點5");
			/*****************會員生日*************************************/
						java.sql.Date member_birthday = null;
						try {
							member_birthday = java.sql.Date.valueOf(req.getParameter("member_birthday").trim());
						}catch(IllegalArgumentException e) {
							member_birthday = new java.sql.Date(System.currentTimeMillis());
							errorMsgs.add("請輸入日期");
							
						}
						System.out.println("檢查點6");
			/*****************地址***********************************/
						
				
						String member_address = req.getParameter("member_address");
						String member_addressReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,50}$";
						//System.out.println(!member_address.trim().matches(member_addressReg));
							if(member_address==null || member_address.trim().length()==0) {
								errorMsgs.add("地址名稱: 請勿空白");
							}else if (!member_address.trim().matches(member_addressReg)) {
								errorMsgs.add("地址名稱: 只能是中文、英文、數字和_符號 ");
							}
							System.out.println("檢查點7");
			/*****************電話*************************************/
							
						String member_telephone = req.getParameter("member_telephone");
						String member_telephoneReg = "^[(0-9)]{2,20}$";
						//System.out.println(!member_telephone.trim().matches(member_telephoneReg));
							if(member_telephone==null || member_telephone.trim().length()==0) {
								errorMsgs.add("電話名稱: 請勿空白");
							}else if (!member_telephone.trim().matches(member_telephoneReg)) {
								errorMsgs.add("電話名稱: 數字和 - 符號 ");
							}
							System.out.println("檢查點8");
			/******************信箱************************************/
						
						String member_email = req.getParameter("member_email");
						String member_emailReg = "^[(a-zA-Z0-9_@.)]{2,50}$";
						//System.out.println(!member_email.trim().matches(member_emailReg));
							if(member_email==null || member_email.trim().length()==0) {
								errorMsgs.add("信箱: 請勿空白");
							}else if (!member_email.trim().matches(member_emailReg)) {
								errorMsgs.add("信箱: 只能是英文、數字、@ _  符號 ");
							}	
							System.out.println("檢查點9");
			/****************會員圖片*****************************/
						Part part = req.getPart("member_picture");
						
//						ByteArrayOutputStream bao = new ByteArrayOutputStream();
//						BufferedInputStream buf = new BufferedInputStream(part.getInputStream());
						byte[] member_picture = new byte[part.getInputStream().available()]; 
						part.getInputStream().read(member_picture);
						
//						System.out.println(part);
//						if (part.getSize() == 0) {
//							
//						}else {
							
//							buf = new BufferedInputStream(part.getInputStream());
//							bao = new ByteArrayOutputStream();
//							int i ;
//							byte b[] = new byte[8192];
//							while((i=buf.read(b)) !=-1) {
//								
//								bao.write(b,0,i);
//							}
//							member_picture = bao.toByteArray();
						
//						}
						
						System.out.println("檢查點10");
			/*************信用卡號碼*******************************/
						
						String member_credit_number = req.getParameter("member_credit_number");
			
			/*************背面末三碼*******************************/
						
						Integer member_back_verification =null;
						member_back_verification = new Integer(req.getParameter("member_back_verification").trim());
						System.out.println("檢查點11");
			/***************會員被建立日期*********************************/
					
						java.sql.Date member_buildday = new java.sql.Date(System.currentTimeMillis());
						System.out.println("檢查點12");
			/***************會員點數*************************/
						Integer member_point = 0;
						
			/***************會員狀態*************************/
						
						String member_status = null;
						
						
						
						
						MemVO memVO = new MemVO();
						memVO.setMember_account(member_account);
						memVO.setMember_password(member_password);
						memVO.setMember_name(member_name);
						memVO.setMember_nick(member_nick);
						memVO.setMember_sex(member_sex);
						memVO.setMember_birthday(member_birthday);
						memVO.setMember_address(member_address);
						memVO.setMember_telephone(member_telephone);
						memVO.setMember_email(member_email);
						memVO.setMember_picture(member_picture);
						memVO.setMember_credit_number(member_credit_number);
						memVO.setMember_back_verification(member_back_verification);
						memVO.setMember_buildday(member_buildday);
						memVO.setMember_point(member_point);
						memVO.setMember_status(member_status);
						System.out.println("檢查點13");
						/*****************帳號重複判斷*****************************/
						MemService memSvc = new MemService();
						
						MemVO memVO2 = new MemVO();
						memVO2 = memSvc.getoneByAccountMem(member_account);
						if(memVO2 != null) {
							errorMsgs.add("帳號重複");
						}
						
						System.out.println("檢查點14");
						
						if(!errorMsgs.isEmpty()) {
							req.setAttribute("memVO",memVO);//含有錯誤格式的memVO物件 也存入req
							RequestDispatcher failureView = req
									.getRequestDispatcher("/Front_end/mem/Registered.jsp");
							failureView.forward(req,res);
							System.out.println("檢查點15");
							return;
						}
						
						/****************************2開始新增資料******************************/
					
						memVO = memSvc.addMem(member_account,member_password,member_name,member_nick,member_sex,member_birthday,member_address,member_telephone,member_email,member_picture,member_credit_number,member_back_verification,member_buildday,member_point,member_status);
						
						/****************************3.新增完成 準備轉交***********************/
						
						
						String url = "/Front_end/mem/listAllMem.jsp";
						RequestDispatcher successView = req.getRequestDispatcher(url);
						successView.forward(req, res);
						
						/******************其他可能的錯誤處理************************/
						
					
						}catch(Exception e) {
							System.out.println("檢查點16");
							e.printStackTrace();
							
							errorMsgs.add(e.getMessage());
							RequestDispatcher failureView = req
									.getRequestDispatcher("/Front_end/mem/Registered.jsp");
							failureView.forward(req, res);
						}
		}
		
		
		if("delete".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/********************1.接收請求參數*****************/
				
				String member_no = new String(req.getParameter("member_no"));
				
				/******************2.開始刪除資料*********************/
				MemService memSvc = new MemService();
				memSvc.deleteMem(member_no);
				
				/********************3.刪除完成準備轉交*****************/
			String url = "/Front_end/mem/listAllMem.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		
			}catch (Exception e) {
				errorMsgs.add("刪除資料失敗" +e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Front_end/mem/listAllMem.jsp");
				failureView.forward(req, res);
			}
			
		}
		
		

	}

}
