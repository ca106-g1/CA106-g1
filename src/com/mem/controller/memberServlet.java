package com.mem.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mem.model.MemService;
import com.mem.model.MemVO;

public class memberServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getone_for_login".equals(action)) { // �Ӧ�Login.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/************* 1.�����ШD�Ѽ� ��J�榡�����~�B�z ***********/
				/* �b�����~�B�z */
				String str1 = req.getParameter("member_account");
				if (str1 == null || (str1.trim()).length() == 0) {
					errorMsgs.add("�п�J�b��");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/mem/Login.jsp");
					failureView.forward(req, res);
					return;
				}

				String member_account = null;
				try {
					member_account = new String(str1);
				} catch (Exception e) {
					errorMsgs.add("�|���b���榡�����T");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/mem/Login.jsp");
					failureView.forward(req, res);
					return;
				}

				/* �K�X���~�B�z */

				String str2 = req.getParameter("member_password");
				if (str2 == null || (str2.trim()).length() == 0) {
					errorMsgs.add("�п�J�K�X");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/mem/Login.jsp");
					failureView.forward(req, res);
					return;
				}

				String member_password = null;
				try {
					member_password = new String(str2);
				} catch (Exception e) {
					errorMsgs.add("�|���K�X�榡�����T");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/mem/Login.jsp");
					failureView.forward(req, res);
					return;
				}

				/*********************** 2.�}�l�d�߸�� **************************/
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.getoneByAccountMem(member_account);
				if (memVO == null) {
					errorMsgs.add("�b����J���~");

				} 
					
				else if (!memVO.getMember_password().equals(req.getParameter("member_password"))) {
						errorMsgs.add("�K�X��J���~");
					}
				

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/mem/Login.jsp");
					failureView.forward(req, res);
					return;
				}

				/************************* 3.�d�ߧ��� �ǳ���� ***********************************/
				req.setAttribute("memVO", memVO); // ��Ʈw���X��empVO����A�s�Jreq
				String url = "/mem/LoginSucess.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\����LoginSucess.jsp
				successView.forward(req, res);
				
				/***********************��L�i����~�B�z*************/

			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failView = req.getRequestDispatcher("/mem/Login.jsp");
				failView.forward(req, res);

			}
		}

	}

}
