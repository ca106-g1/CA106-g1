package com.dep.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DepDAOImpl implements DepDAO_interface {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String username = "JOIN";
	String password = "123456";
			
	private static final String INSERT_DEP =
			"INSERT INTO DEPOSITDETAIL (DEPOSIT_CHANGE_NO,DEPOSIT_MEMBER_NO,DEPOSIT_CHANGE_MONEY,DEPOSIT_CHANGE_DATE) VALUES ('D'||LPAD(to_char(DEPOSITDETAIL_seq.NEXTVAL),6,'0'),?,?,?)";
	private static final String UPDATE = 
			"UPDATE DEPOSITDETAIL set DEPOSIT_MEMBER_NO = ?,DEPOSIT_CHANGE_MONEY =?,DEPOSIT_CHANGE_DATE =? ";
	private static final String DELETE =
			"DELETE FROM DEPOSITDETAIL where DEPOSIT_CHANGE_NO = ?";
	private static final String GET_ALL_DEP = 
			"SELECT DEPOSIT_CHANGE_NO,DEPOSIT_MEMBER_NO,DEPOSIT_CHANGE_MONEY,to_char(DEPOSIT_CHANGE_DATE,'yyyy-mm-dd')DEPOSIT_CHANGE_DATE FROM DEPOSITDETAIL order by DEPOSIT_CHANGE_NO";
	private static final String GET_ONE_DEP =
			"SELECT DEPOSIT_CHANGE_NO,DEPOSIT_MEMBER_NO,DEPOSIT_CHANGE_MONEY,to_char(DEPOSIT_CHANGE_DATE,'yyyy-mm-dd')DEPOSIT_CHANGE_DATE FROM DEPOSITDETAIL where DEPOSIT_CHANGE_NO = ?";
	
	
	
	
	
	
	

	@Override
	public void insert(DepVO depVO) {
		// TODO Auto-generated method stub
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, username, password);
			pstmt = con.prepareStatement(INSERT_DEP);
			
			pstmt.setString(1, depVO.getDeposit_member_no());
			pstmt.setInt(2,depVO.getDeposit_change_money());
			pstmt.setDate(3,depVO.getDeposit_change_date());
			
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
			
			if(con != null) {
				try {
					con.close();
				}catch(SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}
		
	}

	@Override
	public void update(DepVO depVO) {
		// TODO Auto-generated method stub
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,username,password);
			pstmt = con.prepareStatement(UPDATE);
			
			
			pstmt.setString(1,depVO.getDeposit_member_no());
			pstmt.setInt(2,depVO.getDeposit_change_money());
			pstmt.setDate(3,depVO.getDeposit_change_date());
			
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
				}catch(SQLException se){
					se.printStackTrace(System.err);
				}
			}
		}
		
		if(con != null) {
			try {
				con.close();
			}catch(SQLException se) {
				se.printStackTrace(System.err);
			}
		}
		
	}

	@Override
	public void delete(String deposit_change_no) {
		// TODO Auto-generated method stub
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, username, password);
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(1, deposit_change_no);
			pstmt.executeUpdate();
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
			}catch(SQLException se) {
				se.printStackTrace(System.err);
			}
		}
		
	}

	@Override
	public DepVO findByPrimaryKey(String deposit_change_no) {
		// TODO Auto-generated method stub
		
		DepVO depVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, username, password);
			pstmt = con.prepareStatement(GET_ONE_DEP);
			
			pstmt.setString(1,deposit_change_no);
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				depVO = new DepVO();
				depVO.setDeposit_change_no(rs.getString("deposit_change_no"));
				depVO.setDeposit_member_no(rs.getString("deposit_member_no"));
				depVO.setDeposit_change_money(rs.getInt("deposit_change_money"));
				depVO.setDeposit_change_date(rs.getDate("deposit_change_date"));
				
			}
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
				}catch(SQLException se) {
					se.printStackTrace(System.err);
				}
			}
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
				}catch(SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}
		
		
		return depVO;
	}

	@Override
	public List<DepVO> getAll() {
		// TODO Auto-generated method stub
		
		
		List<DepVO> list = new ArrayList<DepVO>();
		DepVO depVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, username, password);
			pstmt = con.prepareStatement(GET_ALL_DEP);
			rs = pstmt.executeQuery();
			
			
			
			while(rs.next()) {
				
				depVO = new DepVO();
				depVO.setDeposit_change_no(rs.getString("deposit_change_no"));
				depVO.setDeposit_member_no(rs.getString("deposit_member_no"));
				depVO.setDeposit_change_money(rs.getInt("deposit_change_money"));
				depVO.setDeposit_change_date(rs.getDate("deposit_change_date"));
				list.add(depVO);
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
				}catch(SQLException se) {
				se.printStackTrace(System.err);
			}
		}
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
				}catch(SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		
		}	
		
		
		return list;
	}



public static void main(String[]args) {
	
	DepDAOImpl dao = new DepDAOImpl();
	
	//新增
	DepVO depVO1 = new DepVO();
	depVO1.setDeposit_member_no("M000001");
	depVO1.setDeposit_change_money(new Integer(3000));
	depVO1.setDeposit_change_date(java.sql.Date.valueOf("2019-02-13"));
	
	dao.insert(depVO1);
	
	
	
	//修改
	DepVO depVO2 = new DepVO();
	depVO2.setDeposit_change_no("D000015");
	depVO2.setDeposit_member_no("M000002");
	depVO2.setDeposit_change_money(new Integer(4000));
	depVO2.setDeposit_change_date(java.sql.Date.valueOf("2019-02-11"));
	dao.update(depVO2);
	
	

	
	//刪除
	
	dao.delete("D000005");
	
	//查詢
	DepVO depVO3 = dao.findByPrimaryKey("D000016");
	System.out.print(depVO3.getDeposit_change_no()+",");
	System.out.print(depVO3.getDeposit_member_no()+",");
	System.out.print(depVO3.getDeposit_change_money()+",");
	System.out.print(depVO3.getDeposit_change_date());
	System.out.println("-----------------------");
	
	//查詢
	List<DepVO> list = dao.getAll();
	for (DepVO aDep : list) {
		
		System.out.print(aDep.getDeposit_change_no()+",");
		System.out.print(aDep.getDeposit_member_no()+",");
		System.out.print(aDep.getDeposit_change_money()+",");
		System.out.print(aDep.getDeposit_change_date());
		System.out.println();
		}
	
	
	}
}