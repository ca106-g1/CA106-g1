package com.mem.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import oracle.sql.BLOB;




public class UserDAOImpl implements UserDAO_interface {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String username = "JOIN";
	String password = "123456";
	
	private static final String INSERT_MEM = 
			"INSERT INTO MEMBER (MEMBER_NO,MEMBER_ACCOUNT,MEMBER_PASSWORD,MEMBER_NAME,MEMBER_NICK,MEMBER_SEX,MEMBER_BIRTHDAY,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_PICTURE,MEMBER_CREDIT_NUMBER,MEMBER_BACK_VERIFICATION) VALUES ('M'||LPAD(to_char(MEMBER_seq.NEXTVAL),6,'0'),?,?,?,?,?,?,?,?,?,?,?)";
	
	private static final String GET_ALL_MEM = 
			"SELECT MEMBER_NO,MEMBER_ACCOUNT,MEMBER_PASSWORD,MEMBER_NAME,MEMBER_NICK,MEMBER_SEX,to_char(MEMBER_BIRTHDAY,'yyyy-mm-dd')MEMBER_BIRTHDAY,MEMBER_ADDRESS,MEMBER_EMAIL , MEMBER_PICTURE,MEMBER_CREDIT_NUMBER,MEMBER_BACK_VERIFICATION FROM MEMBER order by MEMBER_NO";
		
	private static final String GET_ONE_MEM = 
			"SELECT MEMBER_NO,MEMBER_ACCOUNT,MEMBER_PASSWORD,MEMBER_NAME,MEMBER_NICK,MEMBER_SEX,to_char(MEMBER_BIRTHDAY,'yyyy-mm-dd')MEMBER_BIRTHDAY,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_PICTURE,MEMBER_CREDIT_NUMBER,MEMBER_BACK_VERIFICATION FROM MEMBER where MEMBER_NO = ?";
	
	private static final String DELETE = 
			"DELETE FROM MEMBER where MEMBER_NO = ?";
	private static final String UPDATE = 
			"UPDATE MEMBER set MEMBER_ACCOUNT =?,MEMBER_PASSWORD=?,MEMBER_NAME=?,MEMBER_NICK=?,MEMBER_SEX=?,MEMBER_BIRTHDAY=?,MEMBER_ADDRESS=?,MEMBER_EMAIL=?,MEMBER_PICTURE=? ,MEMBER_CREDIT_NUMBER=?,MEMBER_BACK_VERIFICATION=? where MEMBER_NO = ?";
	
	

	@Override
	public void insert(UserVO userVO) {
		// TODO Auto-generated method stub
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, username, password);
			pstmt = con.prepareStatement(INSERT_MEM);
			
			pstmt.setString(1,userVO.getMEMBER_ACCOUNT());
			pstmt.setString(2,userVO.getMEMBER_PASSWORD());
			pstmt.setString(3,userVO.getMEMBER_NAME());
			pstmt.setString(4,userVO.getMEMBER_NICK());
			pstmt.setInt(5,userVO.getMEMBER_SEX());
			pstmt.setDate(6,userVO.getMEMBER_BIRTHDAY());
			pstmt.setString(7,userVO.getMEMBER_ADDRESS());
			pstmt.setString(8,userVO.getMEMBER_EMAIL());
			pstmt.setBlob(9,userVO.getMEMBER_PICTURE());
			pstmt.setString(10,userVO.getMEMBER_CREDIT_NUMBER());
			pstmt.setInt(11,userVO.getMEMBER_BACK_VERIFICATION());
			
			
			pstmt.executeUpdate();
			
		}catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+e.getMessage());
		}catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		
	}finally {
		if(pstmt != null) {
			try {
				pstmt.close();
			}catch(SQLException se) {
				se.printStackTrace(System.err);
			}
		}
		
		if(con != null) {
			try {
				con.close();
			}catch(Exception e) {
				e.printStackTrace(System.err);
				}
			}
		}
	}
		
		
		
		
		
		
		

	@Override
	public UserVO findByPrimaryKey(String MEMBER_NO) {
		// TODO Auto-generated method stub
		
		UserVO userVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, username, password);
			pstmt = con.prepareStatement(GET_ONE_MEM);
			
			pstmt.setString(1,MEMBER_NO);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				userVO = new UserVO();
				userVO.setMEMBER_NO(rs.getString("MEMBER_NO"));
				userVO.setMEMBER_ACCOUNT(rs.getString("MEMBER_ACCOUNT"));
				userVO.setMEMBER_PASSWORD(rs.getString("MEMBER_PASSWORD"));
				userVO.setMEMBER_NAME(rs.getString("MEMBER_NAME"));
				userVO.setMEMBER_NICK(rs.getString("MEMBER_NICK"));
				userVO.setMEMBER_SEX(rs.getInt("MEMBER_SEX"));
				userVO.setMEMBER_BIRTHDAY(rs.getDate("MEMBER_BIRTHDAY"));
				userVO.setMEMBER_ADDRESS(rs.getString("MEMBER_ADDRESS"));
				userVO.setMEMBER_EMAIL(rs.getString("MEMBER_EMAIL"));
				userVO.setMEMBER_PICTURE((BLOB) rs.getBlob("MEMBER_PICTURE"));
				userVO.setMEMBER_CREDIT_NUMBER(rs.getString("MEMBER_CREDIT_NUMBER"));
				userVO.setMEMBER_BACK_VERIFICATION(rs.getInt("MEMBER_BACK_VERIFICATION"));
			}
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if (rs != null) {
				try {
					rs.close();
				}catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				}catch(SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				}catch(Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

		return userVO;
	}

	@Override
	public List<UserVO> getAll() {
		// TODO Auto-generated method stub
		List<UserVO> list = new ArrayList<UserVO>();
		UserVO userVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, username, password);
			pstmt = con.prepareStatement(GET_ALL_MEM);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				userVO = new UserVO();
				userVO.setMEMBER_NO(rs.getString("MEMBER_NO"));
				userVO.setMEMBER_ACCOUNT(rs.getString("MEMBER_ACCOUNT"));
				userVO.setMEMBER_PASSWORD(rs.getString("MEMBER_PASSWORD"));
				userVO.setMEMBER_NAME(rs.getString("MEMBER_NAME"));
				userVO.setMEMBER_NICK(rs.getString("MEMBER_NICK"));
				userVO.setMEMBER_SEX(rs.getInt("MEMBER_SEX"));
				userVO.setMEMBER_BIRTHDAY(rs.getDate("MEMBER_BIRTHDAY"));
				userVO.setMEMBER_ADDRESS(rs.getString("MEMBER_ADDRESS"));
				userVO.setMEMBER_EMAIL(rs.getString("MEMBER_EMAIL"));
				userVO.setMEMBER_PICTURE((BLOB) rs.getBlob("MEMBER_PICTURE"));
				userVO.setMEMBER_CREDIT_NUMBER(rs.getString("MEMBER_CREDIT_NUMBER"));
				userVO.setMEMBER_BACK_VERIFICATION(rs.getInt("MEMBER_BACK_VERIFICATION"));
				list.add(userVO);
			}
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if (rs != null) {
				try {
					rs.close();
				}catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				}catch(SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				}catch(Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

		return list;
	}
	
	








	@Override
	public void update(UserVO userVO) {
		// TODO Auto-generated method stub
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, username, password);
			pstmt = con.prepareStatement(UPDATE);
			

			pstmt.setString(1,userVO.getMEMBER_ACCOUNT());
			pstmt.setString(2,userVO.getMEMBER_PASSWORD());
			pstmt.setString(3,userVO.getMEMBER_NAME());
			pstmt.setString(4,userVO.getMEMBER_NICK());
			pstmt.setInt(5,userVO.getMEMBER_SEX());
			pstmt.setDate(6,userVO.getMEMBER_BIRTHDAY());
			pstmt.setString(7,userVO.getMEMBER_ADDRESS());
			pstmt.setString(8,userVO.getMEMBER_EMAIL());
			pstmt.setBlob(9,userVO.getMEMBER_PICTURE());
			pstmt.setString(10,userVO.getMEMBER_CREDIT_NUMBER());
			pstmt.setInt(11,userVO.getMEMBER_BACK_VERIFICATION());
			pstmt.setString(12,userVO.getMEMBER_NO());
			
			pstmt.executeUpdate();
			
			
			
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			
			if (con != null) {
				try {
					con.close();
				}catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			
		}
		
		
		
		
		
		
		
	}








	@Override
	public void delete(String MEMBER_NO) {
		// TODO Auto-generated method stub
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,username,password);
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(1, MEMBER_NO);
			
			pstmt.executeUpdate();
			
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				}catch(SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				}catch(SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}
		
	}




	
	
	
	
	

public static void main(String[]args) { 
	UserDAOImpl dao = new UserDAOImpl();
	
	//新增
	UserVO userVO1 = new UserVO();
	userVO1.setMEMBER_ACCOUNT("sfdgfdhg");
	userVO1.setMEMBER_PASSWORD("75446");
	userVO1.setMEMBER_NAME("Beauty");
	userVO1.setMEMBER_NICK("M");
	userVO1.setMEMBER_SEX(new Integer (1));
	userVO1.setMEMBER_BIRTHDAY(java.sql.Date.valueOf("2005-01-01"));
	userVO1.setMEMBER_ADDRESS("桃園市中壢區中央路6號");
	userVO1.setMEMBER_EMAIL("a7513@gmail.com");
	userVO1.setMEMBER_PICTURE(null);
	userVO1.setMEMBER_CREDIT_NUMBER("49053697461256");
	userVO1.setMEMBER_BACK_VERIFICATION(new Integer(123));
	dao.insert(userVO1);
	

	
	
	
	//修改
	
		UserVO userVO2 = new UserVO();
		userVO2.setMEMBER_NO("5");
		userVO2.setMEMBER_ACCOUNT("sfdgfdh456");
		userVO2.setMEMBER_PASSWORD("75776");
		userVO2.setMEMBER_NAME("Beaut");
		userVO2.setMEMBER_NICK("S");
		userVO2.setMEMBER_SEX(new Integer (0));
		userVO2.setMEMBER_BIRTHDAY(java.sql.Date.valueOf("2006-01-01"));
		userVO2.setMEMBER_ADDRESS("桃園市中壢區中央路5號");
		userVO2.setMEMBER_EMAIL("a7713@gmail.com");
		//userVO1.setMEMBER_PICTURE("");
		userVO2.setMEMBER_CREDIT_NUMBER("49053697461256");
		userVO2.setMEMBER_BACK_VERIFICATION(new Integer(123));
		
		dao.update(userVO2);
		
	
	
	//刪除
		
		dao.delete("16");
		
	
		
	//查詢
		
		UserVO userVO3 = dao.findByPrimaryKey("M000001");
		System.out.print(userVO3.getMEMBER_NO() + ",");
		System.out.print(userVO3.getMEMBER_ACCOUNT() + ",");
		System.out.print(userVO3.getMEMBER_PASSWORD() + ",");
		System.out.print(userVO3.getMEMBER_NAME() + ",");
		System.out.print(userVO3.getMEMBER_NICK() + ",");
		System.out.print(userVO3.getMEMBER_SEX() + ",");
		System.out.print(userVO3.getMEMBER_BIRTHDAY() + ",");
		System.out.print(userVO3.getMEMBER_ADDRESS() + ",");
		System.out.print(userVO3.getMEMBER_EMAIL() + ",");
		//System.out.println(userVO3.getMEMBER_PICTURE() + ",");
		System.out.print(userVO3.getMEMBER_CREDIT_NUMBER() + ",");
		System.out.print(userVO3.getMEMBER_BACK_VERIFICATION() + ",");
		
		System.out.println("----------------------");
		
	
	
	 List<UserVO> list = dao.getAll();
	for (UserVO aUser : list) {
		System.out.println(aUser.getMEMBER_NO() + ",");
		System.out.println(aUser.getMEMBER_ACCOUNT() + ",");
		System.out.println(aUser.getMEMBER_PASSWORD() + ",");
		System.out.println(aUser.getMEMBER_NAME() + ",");
		System.out.println(aUser.getMEMBER_NICK() + ",");
		System.out.println(aUser.getMEMBER_SEX() + ",");
		System.out.println(aUser.getMEMBER_BIRTHDAY() + ",");
		System.out.println(aUser.getMEMBER_ADDRESS() + ",");
		System.out.println(aUser.getMEMBER_EMAIL() + ",");
		//System.out.println(aUser.getMEMBER_PICTURE() + ",");
		System.out.print(userVO3.getMEMBER_CREDIT_NUMBER() + ",");
		System.out.print(userVO3.getMEMBER_BACK_VERIFICATION() + ",");
		System.out.println();
		
		
		
		
	 }

  }

}