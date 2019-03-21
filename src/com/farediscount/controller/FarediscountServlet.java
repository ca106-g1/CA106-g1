package com.farediscount.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farediscount.model.FarediscountDAOImpl;
import com.farediscount.model.FarediscountVO;


@WebServlet("/farediscount/FarediscountServlet")
public class FarediscountServlet extends HttpServlet{
	

	private static final long serialVersionUID = -1921776397555789457L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
	}
}
