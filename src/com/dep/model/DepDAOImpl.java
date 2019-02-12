package com.dep.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
			"SELETE DEPOSIT_CHANGE_NO,DEPOSIT_MEMBER_NO,DEPOSIT_CHANGE_MONEY,to_char(DEPOSIT_CHANGE_DATE,'yyyy-mm-dd')DEPOSIT_CHANGE_DATE FROM DEPOSITDETAIL order by DEPOSIT_CHANGE_NO";
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
			
			pstmt.setString(1, depVO.getDEPOSIT_MEMBER_NO());
			pstmt.setInt(2,depVO.getDEPOSIT_CHANGE_MONEY());
			pstmt.setDate(3,depVO.getDEPOSIT_CHANGE_DATE());
			
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
					se.printStackTrace();
				}
			}
			
			if
		}
		
	}

	@Override
	public void update(DepVO depVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String DEPOSIT_CHANGE_NO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public DepVO findByPrimaryKey(String DEPOSIT_CHANGE_NO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DepVO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
