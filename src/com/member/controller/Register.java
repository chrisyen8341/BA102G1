package com.member.controller;



import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collection;
import java.util.Enumeration;
import java.util.GregorianCalendar;
import java.util.Hashtable;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.member.model.Member;
import com.member.model.MemberDAO;
import com.member.model.MemberService;
import com.pet.model.Pet;
import com.pet.model.PetDAO;
import com.pet.model.PetService;


@WebServlet("/Register")
@MultipartConfig
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session=req.getSession();
		
		/**************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
		String memId = req.getParameter("memId").trim();
		String memPwd = req.getParameter("memPwd").trim();
		String memName = req.getParameter("memName").trim();
		String memSname = req.getParameter("memSname").trim();
		String memIdNo=req.getParameter("memIdNo").trim();
		String memPhone= req.getParameter("memPhone").trim();
		String memAddress=req.getParameter("memAddress").trim();
		String memEmail= req.getParameter("memEmail").trim();

		
		List<String> errorMsgs = new LinkedList<String>();
		req.setAttribute("errorMsgs", errorMsgs);
		
		if(memId==null||memId.isEmpty()){
			errorMsgs.add("�ж�g�b��");
		}
		if(memPwd==null||memPwd.isEmpty()){
			errorMsgs.add("�ж�g�K�X");
		}
		if(memName==null||memName.isEmpty()){
			errorMsgs.add("�ж�g�m�W");
		}
		if(memSname==null||memSname.isEmpty()){
			errorMsgs.add("�ж�g�ʺ�");
		}
		
		Integer memGender=null;
		try {
			memGender = Integer.parseInt(req.getParameter("memGender").trim());
		} catch (IllegalArgumentException e) {
			memGender = 1;
			errorMsgs.add("�п�J�ʧO");
		}

		if(memIdNo==null||memIdNo.isEmpty()){
			errorMsgs.add("�ж�g�����Ҧr��");
		}
		
		java.sql.Date memBday=null;
		try {
			memBday = java.sql.Date.valueOf(req.getParameter("memBday").trim());
		} catch (IllegalArgumentException e) {
			memBday=new java.sql.Date(System.currentTimeMillis());
			errorMsgs.add("�п�J�ͤ�!");
		}
		
		if(memPhone==null||memPhone.isEmpty()){
			errorMsgs.add("�ж�g���");
		}
		if(memAddress==null||memAddress.isEmpty()){
			errorMsgs.add("�ж�g�a�}");
		}
		if(memEmail==null||memEmail.isEmpty()){
			errorMsgs.add("�ж�g�H�c");
		}
		
		byte[] memImg=null;
		Collection<Part> parts = req.getParts();
		for (Part part : parts) {
			if (part.getName().equals("memImg") && getFileNameFromPart(part) != null 
					&& part.getContentType().startsWith("image")) {
				memImg=getPictureByteArray(part.getInputStream());
			}
			if(getFileNameFromPart(part) != null && part.getName().equals("memImg")&& !(part.getContentType().startsWith("image"))){
				errorMsgs.add("�|���Ӥ��榡���~");
			}	
		}
	
		
		
		/******************���d���|����U�� *****************/
		String petName=null;
		String petKind=null;
		Integer petGender=null;
		byte[] petImg=null;
		
		if(((String)req.getParameter("petOrNot")).equals("1")){
			petName=req.getParameter("petName").trim();
			if(petName==null||petName.isEmpty()){
				errorMsgs.add("�п�J�d���m�W");
			}
			
			petKind=req.getParameter("petKind").trim();
			if(petKind==null||petKind.isEmpty()){
				errorMsgs.add("�п�J�d�����O");
			}
			
			petGender=Integer.parseInt(req.getParameter("petGender").trim());


			for (Part part : parts) {
				if (part.getName().equals("petImg") && getFileNameFromPart(part) != null && part.getContentType() != null) {
					petImg=getPictureByteArray(part.getInputStream());
		  		}
				if(getFileNameFromPart(part) != null && part.getName().equals("petImg")&& !(part.getContentType().startsWith("image"))){
					errorMsgs.add("�d���Ӥ��榡���~");
				}	
			}
		}
		
		
		if (!errorMsgs.isEmpty()) {
			RequestDispatcher failureView = req
					.getRequestDispatcher("/newFileBig5.jsp");
			req.setAttribute("errorMsgs", errorMsgs);
			failureView.forward(req, res);
			return;//�{�����_
		}
	
		
		/***************************2.�}�l�ק���*****************************************/
		MemberService memSvc=new MemberService();		

		
		//�P�_�O�_���i�d��
		if(((String)req.getParameter("petOrNot")).equals("0")){
		memSvc.addMember(memId, memPwd, memName, memSname, memGender, memIdNo, memBday, memPhone, memAddress, 
				memEmail, memImg, 0, 0, 2, "test", 0, 0, 0,  0.00,  0.00, new Timestamp((new java.util.Date()).getTime()), 0);}
		else{
			memSvc.addMemberWithPet(memId, memPwd, memName, memSname, memGender, memIdNo, memBday, memPhone, memAddress, 
					memEmail, memImg, 0, 0, 2, "test", 0, 
					0, 0, 0.00, 0.00, new Timestamp((new java.util.Date()).getTime()), 0, 
					petName, petKind, petGender, "test", "test", new Date(2010-05-02), petImg);
		}
				

		
	
		
		/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
		Member member=memSvc.getOneMemberById(memId);
		session.setAttribute("member", member);
		res.sendRedirect(req.getContextPath()+"/index.html");
	}
	
	
	
		public static byte[] getPictureByteArray(InputStream fis) throws IOException {
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			byte[] buffer = new byte[8192];
			int i;
			while ((i = fis.read(buffer)) != -1) {
				baos.write(buffer, 0, i);
			}
			baos.close();
			fis.close();

			return baos.toByteArray();
		}
		
		public String getFileNameFromPart(Part part) {
			String header = part.getHeader("content-disposition");
			String filename = new File(header.substring(header.lastIndexOf("=") + 2, header.length() - 1)).getName();
			if (filename.length() == 0) {
				return null;
			}
			return filename;
		}
		
		
}
