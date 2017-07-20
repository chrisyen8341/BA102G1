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
import javax.servlet.http.Part;

import com.member.model.Member;
import com.member.model.MemberDAO;
import com.pet.model.Pet;
import com.pet.model.PetDAO;


@WebServlet("/Register")
@MultipartConfig
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		
		//�������|����ƬO�_��null
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
		
		
		
		
		if (!errorMsgs.isEmpty()) {
			RequestDispatcher failureView = req
					.getRequestDispatcher("/newFileBig5.jsp");
			failureView.forward(req, res);
			return;//�{�����_
		}
	
		
		
		//��|����Ʀs�Jdb
		MemberDAO dao=new MemberDAO();
		Member member=new Member();
		member.setMemId(memId);
		member.setMemPwd(memPwd);
		member.setMemName(memName);
		member.setMemSname(memSname);
		member.setMemGender(memGender);
		member.setMemIdNo(memIdNo);
		member.setMemBday(memBday);
		member.setMemPhone(memPhone);
		member.setMemAddress(memAddress);
		member.setMemEmail(memEmail);
		
		
		Collection<Part> parts = req.getParts();
		for (Part part : parts) {
			if (part.getName().equals("memImg") && getFileNameFromPart(part) != null && part.getContentType() != null) {
				member.setMemImg(getPictureByteArray(part.getInputStream()));
			}
		}
		
		//�U���X�ӬO�t�ιw�]���w��l�� ���U�ɨS�� table���ରnull
		member.setMemReported(0);
		member.setMemStatus(0);
		member.setMemRelation(0);
		member.setMemSelfintro("Test");
		member.setMemPoint(1000);
		member.setMemSaleRank(1000);
		member.setMemFollowed(0);
		member.setMemLocStatus(0);
		member.setMemLongtitude(0.00);
		member.setMemLatitude(0.00);
		member.setMemLocTime(new Timestamp((new java.util.Date()).getTime()));
		dao.add(member);
		
		
		
		//�ϥΪ̦��i�d���ɤ~�|�i��
		if(((String)req.getParameter("petOrNot")).equals("1")){
			
			//�P�_�d����ƬO�_��null
			String petName=req.getParameter("petName").trim();
			String petKind=req.getParameter("petKind").trim();
			String petGender=req.getParameter("petGender").trim();
			if(petName==null||petName.isEmpty()){
				errorMsgs.add("petName");
			}
			if(petKind==null||petKind.isEmpty()){
				errorMsgs.add("petKind");
			}
			if(petGender==null||petGender.isEmpty()){
				errorMsgs.add("petGender");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Register2.html");
				failureView.forward(req, res);
				return;//�{�����_
			}
			
			
			//�sdb
			PetDAO petDao=new PetDAO();
			Pet pet=new Pet();
			pet.setMemNo(dao.getCurrSeq());
			pet.setPetName(petName);
			pet.setPetKind(petKind);
			pet.setPetGender(Integer.parseInt(petGender));
			for (Part part : parts) {
				if (part.getName().equals("petImg") && getFileNameFromPart(part) != null && part.getContentType() != null) {
					pet.setPetImg(getPictureByteArray(part.getInputStream()));
				}
			}
			pet.setPetBday(null);
			pet.setPetSpecies(null);
			pet.setPetIntro("Test");
			petDao.add(pet);
		}
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
