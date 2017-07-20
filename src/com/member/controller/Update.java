package com.member.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.member.model.Member;
import com.member.model.MemberService;


@WebServlet("/Update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if("getOne_For_Update".equals(action)){
			
			List<String> errorMsgs = new LinkedList<String>();
			
			HttpSession session=req.getSession();
			Object memNot = session.getAttribute("memNo");                  // �q session�����X (key) account����
		    if (memNot == null) {                                             // �p�� null, �N����user���n�J�L , �~���H�U�u�@
		      session.setAttribute("location", req.getContextPath()+"/member_update.jsp");       //*�u�@1 : �P�ɰO�U�ثe��m , �H�K��login.html�n�J���\�� , ��������ɦܦ�����(���t�XLoginHandler.java)
		      res.sendRedirect(req.getContextPath()+"/login.jsp");   //*�u�@2 : �и�user�h�n�J����(login.html) , �i��n�J
		      return;
		    }
		    
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.�����ШD�Ѽ�****************************************/
				Integer memNo = (Integer)session.getAttribute("memNo");
				
				/***************************2.�}�l�d�߸��****************************************/
				MemberService memSvc = new MemberService();
				Member member = memSvc.getOneMember(memNo);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("member", member);         // ��Ʈw���X��empVO����,�s�Jreq
				String url = "member_update.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_emp_input.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				session.setAttribute("locaton",req.getContextPath()+"/member_update.jsp");
				res.sendRedirect(req.getContextPath()+"/login.jsp");
			}
		}
	}

}