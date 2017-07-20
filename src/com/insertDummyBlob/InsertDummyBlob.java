package com.insertDummyBlob;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import com.album.model.Album;
import com.album.model.AlbumJDBCDAO;
import com.albumimg.model.AlbumImg;
import com.albumimg.model.AlbumImgJDBCDAO;
import com.member.model.Member;
import com.member.model.MemberJDBCDAO;
import com.pet.model.Pet;
import com.pet.model.PetJDBCDAO;

public class InsertDummyBlob {

	public static void main(String[] args) {


	// �|���Ӥ��ק�
	int i=5001;
    for (File file : new File("WebContent/DummyImg/member").listFiles()) { 
    	MemberJDBCDAO dao=new MemberJDBCDAO();
        Member member=dao.findByPk(i++);
        try {
			byte[] b = getPictureByteArray(file);
			member.setMemImg(b);
			dao.update(member);
		} catch (IOException e) {
			e.printStackTrace();
		}    
    }
    System.out.println("=============�|���s�W����================");

    //�ק��d���Ӥ�
	int p=1001;
    for (File file : new File("WebContent/DummyImg/pet").listFiles()) { 
    	PetJDBCDAO dao=new PetJDBCDAO();
    	Pet pet=dao.findByPk(p++);
        try {
			byte[] b = getPictureByteArray(file);
			pet.setPetImg(b);
			dao.update(pet);
		} catch (IOException e) {
			e.printStackTrace();
		}    
    }
    System.out.println("=============�d���s�W����================");
    
  //�ק��ï�Ӥ�
	int a=1;
    for (File file : new File("WebContent/DummyImg/album").listFiles()) { 
    	AlbumJDBCDAO dao=new AlbumJDBCDAO();
        Album album=dao.findByPk(a++);
        try {
			byte[] b = getPictureByteArray(file);
			album.setAlbumImgFile(b);;
			dao.update(album);
		} catch (IOException e) {
			e.printStackTrace();
		}    
    }
    System.out.println("=============��ï�s�W����================");
    
  //�ק�Ӥ�(table)���Ӥ����
	int ai=1;
    for (File file : new File("WebContent/DummyImg/albumimg").listFiles()) { 
    	AlbumImgJDBCDAO dao=new AlbumImgJDBCDAO();
    	AlbumImg albumImg=dao.findByPk(ai++);
        try {
			byte[] b = getPictureByteArray(file);
			albumImg.setImgFile(b);;
			dao.update(albumImg);
		} catch (IOException e) {
			e.printStackTrace();
		}    
    }
    System.out.println("=============��ï�s�W����================");
    

    
	}

	
	
	
	
	public static byte[] getPictureByteArray(File file) throws IOException {
		FileInputStream fis = new FileInputStream(file);
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
