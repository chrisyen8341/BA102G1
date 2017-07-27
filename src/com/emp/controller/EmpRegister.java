package com.emp.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.member.model.Member;


@WebServlet("back_end/emp/EmpRegister")
public class EmpRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, res);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		List<String> errorMsgs = new LinkedList<String>();
		
		
		
		try {
			/***************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
			
			String empName = req.getParameter("empName");
			if (empName == null || empName.trim().isEmpty()) {
				errorMsgs.add("�ж�g�m�W");
			}
			String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
			if (!empName.trim().matches(enameReg)) {
				errorMsgs.add("���u�m�W: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��10����");
			}

			String empId = req.getParameter("empId");
			if (empId == null || empId.trim().isEmpty()) {
				errorMsgs.add("�ж�g�b��");
			}
			String ename = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
			if (!empName.trim().matches(enameReg)) {
				errorMsgs.add("���u�m�W: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��10����");
			}
			
			

			java.sql.Date memBday = null;
			try {
				memBday = java.sql.Date.valueOf(req.getParameter("memBday"));
			} catch (IllegalArgumentException e) {
				errorMsgs.add("����榡���~");
			}
			
			String memPhone = req.getParameter("memPhone");
			if (!(memPhone.matches("[09]{2}[0-9]{2}-[0-9]{6}") || memPhone.matches("[09]{2}[0-9]{8}"))) {
				errorMsgs.add("����榡���~");
			}






			if (!errorMsgs.isEmpty()) {
				RequestDispatcher dispatcher = req.getRequestDispatcher("/front_end/member/memberInfoUpdate.jsp");
				req.setAttribute("errorMsgs", errorMsgs);
				req.setAttribute("member", "");
				dispatcher.forward(req, res);
				return;
			}

			/*************************** 2.�}�l�ק��� *****************************************/
			

			/***************************
			 * 3.�ק粒��,�ǳ����(Send the Success view)
			 *************/

		} catch (Exception e) {
			System.out.println("error");
		}
		
	}

}
