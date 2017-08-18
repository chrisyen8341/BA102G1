package com.diary.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.UnavailableException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.diary.model.DiaryService;



public class ShowImage extends HttpServlet{
	 
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException{
		doPost(req,res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException{
		
		
//		req.setCharacterEncoding("BIG5");
		res.setContentType("image/*");
		try{
			ServletOutputStream out = res.getOutputStream();
			
			DiaryService dsv =new DiaryService();
			if(!dsv.getOneDia(Integer.valueOf(req.getParameter("diano"))).getDiaImg().equals("")){
				ByteArrayInputStream in =new ByteArrayInputStream(dsv.getOneDia(Integer.valueOf(req.getParameter("diano"))).getDiaImg());
				byte[] buf = new byte[8 * 1024];
				int len;
				while((len = in.read(buf))!=-1){
						out.write(buf, 0, len);
						}
			}
		}catch(NullPointerException ne){
			
			return;
		}
		
		
	}
}
