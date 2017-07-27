package com.emp.model;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pet.model.Pet;

public class EmpJDBCDAO implements EmpDAO_interface {

	
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "petym";
	private static final String PASSWORD = "123456";
	
	
	private static final String INSERT_STMT = "INSERT INTO EMP(EMPNO,EMPNAME,EMPJOB,EMPID,EMPPWD,EMPSTATUS,EMPHIREDATE,EMPEMAIL)"
			+ " VALUES(EMPNO_SQ.NEXTVAL,?,?,?,?,?,?,?)";
	private static final String UPDATE_STMT = "UPDATE EMP SET EMPNO = ?, EMPNAME = ?, EMPJOB = ?, "
			+ "EMPID = ?, EMPPWD = ?,EMPSTATUS = ?,EMPHIREDATE = ?,EMPEMAIL= ? WHERE EMPNO =�@?";
	private static final String DELETE_STMT = "DELETE FROM EMP WHERE EMPNO = ?";
	private static final String FIND_BY_PK = "SELECT * FROM EMP WHERE EMPNO = ?";
	private static final String GET_ALL = "SELECT * FROM EMP";
	
	
	@Override
	public void add(Emp emp) {
		PreparedStatement pstmt=null;
		Connection con=null;
		
		try {
			Class.forName(DRIVER);
			con=DriverManager.getConnection(URL,USER,PASSWORD);
			pstmt=con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, emp.getEmpName());
			pstmt.setString(2, emp.getEmpJob());
			pstmt.setString(3, emp.getEmpId());
			pstmt.setString(4,emp.getEmpPwd());
			pstmt.setInt(5, emp.getEmpStatus());
			pstmt.setDate(6, emp.getEmpHireDate());
			pstmt.setString(7, emp.getEmpEmail());
			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
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
	public void update(Emp emp) {
		PreparedStatement pstmt=null;
		Connection con=null;
		
		try {
			Class.forName(DRIVER);
			con=DriverManager.getConnection(URL,USER,PASSWORD);
			pstmt=con.prepareStatement(UPDATE_STMT);
			pstmt.setInt(1, emp.getEmpNo());
			pstmt.setString(2, emp.getEmpName());
			pstmt.setString(3, emp.getEmpJob());
			pstmt.setString(4, emp.getEmpId());
			pstmt.setString(5, emp.getEmpPwd());
			pstmt.setInt(6, emp.getEmpStatus());
			pstmt.setDate(7, emp.getEmpHireDate());
			pstmt.setString(8, emp.getEmpEmail());
			pstmt.setInt(9, emp.getEmpNo());
			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
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

	
	//�h�Ӫ�ɧR����  EMP���h��TABLE���ѷ�  ���@����u���A
	@Override
	public void delete(int empNo) {
		PreparedStatement pstmt=null;
		Connection con=null;
		
		try {
			Class.forName(DRIVER);
			con=DriverManager.getConnection(URL,USER,PASSWORD);
			pstmt=con.prepareStatement(DELETE_STMT);
			pstmt.setInt(1, empNo);
			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
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
	public Emp findByPk(int empNo) {
		PreparedStatement pstmt=null;
		Connection con=null;
		ResultSet rs=null;
		Emp emp=null;
		
		try {
			Class.forName(DRIVER);
			con=DriverManager.getConnection(URL,USER,PASSWORD);
			pstmt=con.prepareStatement(FIND_BY_PK);
			pstmt.setInt(1, empNo);
			rs=pstmt.executeQuery();
			while(rs.next()){
				emp=new Emp();
				emp.setEmpNo(rs.getInt("empNo"));
				emp.setEmpName(rs.getString("empName"));
				emp.setEmpJob(rs.getString("empJob"));
				emp.setEmpId(rs.getString("empId"));
				emp.setEmpPwd(rs.getString("empPwd"));
				emp.setEmpStatus(rs.getInt("empStatus"));
				emp.setEmpHireDate(rs.getDate("empHireDate"));
				emp.setEmpEmail(rs.getString("empEmail"));
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
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
		return emp;
	}

	@Override
	public List<Emp> getAll() {
		List<Emp> empList = new ArrayList<>();
		PreparedStatement pstmt=null;
		Connection con=null;
		ResultSet rs=null;
		
		try {
			Class.forName(DRIVER);
			con=DriverManager.getConnection(URL,USER,PASSWORD);
			pstmt=con.prepareStatement(GET_ALL);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Emp emp=new Emp();
				emp.setEmpNo(rs.getInt("empNo"));
				emp.setEmpName(rs.getString("empName"));
				emp.setEmpJob(rs.getString("empJob"));
				emp.setEmpId(rs.getString("empId"));
				emp.setEmpPwd(rs.getString("empPwd"));
				emp.setEmpStatus(rs.getInt("empStatus"));
				emp.setEmpHireDate(rs.getDate("empHireDate"));
				emp.setEmpEmail(rs.getString("empEmail"));
				empList.add(emp);		
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
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
		return empList;
	}

	
}
