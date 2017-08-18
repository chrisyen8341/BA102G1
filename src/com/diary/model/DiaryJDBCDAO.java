package com.diary.model;

import java.sql.Clob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class DiaryJDBCDAO implements DiaryDAO_Interface{
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "petym";
	String passwd = "123456";
	
	private static final String INSERT = 
			"INSERT INTO DIARY(diano, memno, dianame, diatext, diaimg, diacretime, diamodtime, diastate)"+
					"VALUES (DIARY_SEQ.NEXTVAL,?,?,?,?,?,?,?)";
	private static final String GETALL = 
			"SELECT DIANO,MEMNO,DIANAME, DIATEXT, DIAIMG, DIACRETIME, DIAMODTIME, DIASTATE FROM DIARY";
//			"SELECT DIANO,MEMNO,DIANAME, DIATEXT, DIAIMG, TO_CHAR(DIACREDATE,'YYYY-MM-DD HH12:MI:SS AM') DIACREDATE, TO_CHAR(DIAMODDATE,'YYYY-MM-DD HH12:MI:SS AM') DIAMODDATE, DIASTATE FROM DIARY";
	private static final String GETONE =
			"SELECT DIANO,MEMNO,DIANAME, DIATEXT, DIAIMG, DIACRETIME, DIAMODTIME, DIASTATE FROM DIARY WHERE DIANO = ? ";
	private static final String UPDATE =
			"UPDATE DIARY SET DIANAME=?,DIATEXT=?,DIAIMG=?,diamodtime=? WHERE DIANO=?";
	private static final String DELETE=
			"DELETE FROM DIARY WHERE DIANO=?";	
	
	
	@Override
	public void insert(Diary diary) {
		
		Connection con = null;
		PreparedStatement pstmt =null;
		Clob clob=null;
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(INSERT);			
			clob =con.createClob();
			clob.setString(1, diary.getDiaText());
			
			pstmt.setInt(1, diary.getMemNo());
			pstmt.setString(2, diary.getDiaName());
			pstmt.setClob(3, clob);
			
			if(diary.getDiaImg()!=null)
				pstmt.setBytes(4, diary.getDiaImg());
			else
				pstmt.setBytes(4, diary.getDiaImg());
			
			pstmt.setTimestamp(5, diary.getDiaCreTime());
			pstmt.setTimestamp(6, diary.getDiaModTime());
			pstmt.setInt(7, diary.getDiaState());
			
			pstmt.executeUpdate();
			
		}catch(SQLException se){
			se.printStackTrace();
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		finally{
			if(pstmt!=null){
				try{
					pstmt.close();
				}catch(SQLException se){
					se.printStackTrace(System.err);
				}
				
			}
			if(con!=null){
				try{
					con.close();
				}catch(Exception e){
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void update(Diary diary) {
		Connection con = null;
		PreparedStatement pstmt =null;
		Clob clob=null;
		
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			
			pstmt = con.prepareStatement(UPDATE);	
			clob =con.createClob();
			clob.setString(1, diary.getDiaText());
			
			
			pstmt.setString(1, diary.getDiaName());
			pstmt.setClob(2, clob);
			pstmt.setBytes(3, diary.getDiaImg());
			pstmt.setTimestamp(4, diary.getDiaModTime());
			pstmt.setInt(5, diary.getDiaNo());
			
			pstmt.executeUpdate();
			
		}catch(SQLException se){
			se.printStackTrace();
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		finally{
			if(pstmt!=null){
				try{
					pstmt.close();
				}catch(SQLException se){
					se.printStackTrace(System.err);
				}
				
			}
			if(con!=null){
				try{
					con.close();
				}catch(Exception e){
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void delete(Integer diaNo) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try{
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setInt(1, diaNo);
			
			pstmt.executeUpdate();
		}catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public Diary findByPrimaryKey(Integer diaNo) {

		Diary diary = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GETONE);

			pstmt.setInt(1, diaNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				diary = new Diary();
				diary.setDiaNo(rs.getInt("diano"));
				diary.setMemNo(rs.getInt("memno"));
				diary.setDiaName(rs.getString("dianame"));
				diary.setDiaText(rs.getString("diatext"));
				diary.setDiaImg(rs.getBytes("diaimg"));
				diary.setDiaCreTime(rs.getTimestamp("diacretime"));
				diary.setDiaModTime(rs.getTimestamp("diamodtime"));
				diary.setDiaState(rs.getInt("diastate"));
				
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return diary;
	}

	@Override
	public List<Diary> getAll() {
		
		List<Diary> list = new ArrayList<Diary>();
		Diary diary = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GETALL);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				diary= new Diary();
				diary.setDiaNo(rs.getInt("diano"));
				diary.setMemNo(rs.getInt("memno"));
				diary.setDiaName(rs.getString("dianame"));
				diary.setDiaText(rs.getString("diatext"));
				diary.setDiaImg(rs.getBytes("diaimg"));
				diary.setDiaCreTime(rs.getTimestamp("diacretime"));
				diary.setDiaModTime(rs.getTimestamp("diamodtime"));
				diary.setDiaState(rs.getInt("diastate"));
				list.add(diary);
			}
			
		}catch(ClassNotFoundException ce){
			ce.printStackTrace();
		}catch(SQLException se){
			se.printStackTrace();
		}finally{
			if(rs != null){
				try{
					rs.close();
				}catch(SQLException se){
					se.printStackTrace(System.err);
				}
			}
			if(pstmt != null){
				try{
					pstmt.close();
				}catch(SQLException se){
					se.printStackTrace(System.err);
				}
			}
			if(con != null){
				try{
					con.close();
				}catch(Exception e){
					e.printStackTrace(System.err);
				}
			}
		}
		
		return list;
	}
	
	public static void main(String[] args) {
		
		DiaryJDBCDAO dao = new DiaryJDBCDAO();
		
		//addDia
		Diary diaVO1 = new Diary();
		diaVO1.setMemNo(1012);
		diaVO1.setDiaName("好貓12");
		diaVO1.setDiaText("今天貓兒真乖");
		diaVO1.setDiaImg(null);
		diaVO1.setDiaCreTime(new java.sql.Timestamp(System.currentTimeMillis()));
		diaVO1.setDiaModTime(new java.sql.Timestamp(System.currentTimeMillis()));
		diaVO1.setDiaState(0);
		
		dao.insert(diaVO1);
		
		//modify
//		Diary diary =new Diary();
//		diary.setDiaNo(1022);
//		diary.setDiaName("貓貓");
//		diary.setDiaText("不用上課");
//		diary.setDiaModTime(new java.sql.Timestamp(System.currentTimeMillis()));
//		diary.setDiaImg(null);
//		
//		dao.update(diary);
		
		//delete
		
//		dao.delete(1022);
		
		//query
//		Diary diary1 = dao.findByPrimaryKey(1028);
//		System.out.print(diary1.getDiaNo()+" ,");
//		System.out.print(diary1.getMemNo()+" ,");
//		System.out.print(diary1.getDiaName()+" ,");
//		System.out.print(diary1.getDiaText()+" ,");
//		System.out.print(diary1.getDiaImg()+" ,");
//		System.out.print(diary1.getDiaCreTime()+" ,");
//		System.out.print(diary1.getDiaModTime()+" ,");
//		System.out.print(diary1.getDiaState()+" ,");
//		System.out.println("---------------------------------");
		
		
		//query all
//		List<Diary> list = dao.getAll();
//		for(Diary dia : list){
//			System.out.print(dia.getDiaNo()+" ,");
//			System.out.print(dia.getMemNo()+" ,");
//			System.out.print(dia.getDiaName()+" ,");
//			System.out.print(dia.getDiaText()+" ,");
//			System.out.print(dia.getDiaImg()+" ,");
//			System.out.print(dia.getDiaCreTime()+" ,");
//			System.out.print(dia.getDiaModTime()+" ,");
//			System.out.print(dia.getDiaState()+" ,");
//			System.out.println("---------------------------------");
//		}
		
		System.out.println("結束");
		
		
		
		
	}

	@Override
	public List<Diary> getOneMemNo(Integer memNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
