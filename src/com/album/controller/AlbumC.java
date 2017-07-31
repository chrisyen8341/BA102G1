package com.album.controller;


import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;



import com.album.model.AlbumService;
import com.albumimg.model.AlbumImg;
import com.member.model.Member;

@WebServlet("/front_end/album/Album.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024
* 1024)
public class AlbumC extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
       doPost(req,res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
		HttpSession session=req.getSession();
		Member member=(Member)session.getAttribute("member");
		AlbumService albumSvc=new AlbumService();
		List<AlbumImg> aImgs=new LinkedList<AlbumImg>();
		Timestamp currentTime = new Timestamp(System.currentTimeMillis());
		
		
		String albumTitle=req.getParameter("albumTitle");
		
		Collection<Part> parts = req.getParts();
		for (Part part:parts) {
				if (getFileNameFromPart(part) != null && part.getContentType() != null) {	
					AlbumImg aImg=new AlbumImg();
					aImg.setImgTitle("test");
					aImg.setImgDesc("��������s�W�I�y�z�a");
					aImg.setImgCreatedTime(currentTime);
					aImg.setImgModifiedTime(currentTime);
					aImg.setImgFileName(getFileNameFromPart(part));
					aImg.setImgExtName(part.getContentType());
					aImg.setImgFile(getPictureByteArray(part.getInputStream()));
					aImgs.add(aImg);
				}
		} 
			

			albumSvc.addAlbumWithImg(member.getMemNo(),albumTitle, currentTime, currentTime, 0, aImgs.get(1).getImgFile(), aImgs);

			res.sendRedirect(req.getContextPath()+"/front_end/album/albumShow.jsp");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

	public static byte[] getPictureByteArray(InputStream fis) throws IOException {
		BufferedImage originalImage = ImageIO.read(fis);
		int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
		BufferedImage resizeImageJpg = resizeImage(originalImage, type);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(resizeImageJpg, "jpg", baos);
		baos.flush();
		baos.close();
		return baos.toByteArray();
	}
	
	
	private static BufferedImage resizeImage(BufferedImage originalImage, int type) {
		BufferedImage resizedImage = new BufferedImage(400, 300, type);
		Graphics2D g = resizedImage.createGraphics();
		g.drawImage(originalImage, 0, 0, 400, 300, null);
		g.dispose();

		return resizedImage;
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

}
