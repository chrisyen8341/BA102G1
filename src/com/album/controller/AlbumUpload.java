package com.album.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Collection;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.albumimg.model.AlbumImg;
import com.albumimg.model.AlbumImgService;




@WebServlet("/front_end/album/AlbumUpload.do")
public class AlbumUpload extends HttpServlet {




	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
		// ���s���֨�
		res.setHeader("Cache-Control", "no-store");
		res.setHeader("Pragma", "no-cache");
		res.setDateHeader("Expires", 0);
		AlbumImgService aImgSvc=new AlbumImgService();
		




		Collection<Part> parts = req.getParts();
		System.out.println(parts);
		System.out.println("onid");
		System.out.println(parts==null);
		for (Part part : parts) {
			System.out.println("wqqdwwqd");
			System.out.println("-----------------------------");
			if (getFileNameFromPart(part) != null && part.getContentType() != null) {
				Timestamp currentTime = new Timestamp(System.currentTimeMillis());
//				long size = part.getSize();
//				int kbSize = (int) (size / 1024);

				aImgSvc.addAlbumImg(1, getFileNameFromPart(part), "��������s�W�I�y�z�a", currentTime, currentTime,
						getFileNameFromPart(part), part.getContentType(), getPictureByteArray(part.getInputStream()));
				
				

			}
		}
		
	}

		
		// ���X�W�Ǫ��ɮצW�� (�]��API������method,�ҥH�����ۦ漶�g)
		public String getFileNameFromPart(Part part) {
			String header = part.getHeader("content-disposition");
			String filename = new File(header.substring(header.lastIndexOf("=") + 2, header.length() - 1)).getName();
			if (filename.length() == 0) {
				return null;
			}
			return filename;
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
		
		
		
		
}
