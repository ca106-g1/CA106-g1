package com.ticketinformation.model;

import java.util.*;

import java.sql.*;

public class TicketinformationDAO implements TicketinformationDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "JOIN";
	String passwd = "123456";
	
	private static final String INSERT_STMT =
			"INSERT INTO TICKETINFORMATION (ti_no,ti_name,ti_price) VALUES (TICKETINFORMATION_seq.NEXTVAL, ?, ?)";
	private static final String GET_ALL_STMT =
			"SELECT ti_no,ti_name,ti_price FROM TICKETINFORMATION order by ti_no";
	private static final String GET_ONE_STMT = 
			"SELECT ti_no,ti_name,ti_price FROM TICKETINFORMATION where ti_no = ?";
	private static final String DELETE =
			"DELETE FROM TICKETINFORMATION where ti_no = ?";
	private static final String UPDATE = 
			"UPDATE TICKETINFORMATION set ti_name=?, ti_price=? where ti_no = ?";
	

	@Override
	public void insert(TicketinformationVO ticketinformationVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, ticketinformationVO.getTi_name());
			pstmt.setString(2, ticketinformationVO.getTi_price());
			
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occuted. " + se.getMessage());
			
		} finally {
			if (pstmt !=  null) {
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
	public void update(TicketinformationVO ticketinformationVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1, ticketinformationVO.getTi_name());
			pstmt.setString(2, ticketinformationVO.getTi_price());
			pstmt.setString(3, ticketinformationVO.getTi_no());
			
			
			pstmt.executeUpdate();
			
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			
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
	public void delete(String ti_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(1, ti_no);
			
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database drive. " + e.getMessage());
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			
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
	public TicketinformationVO findByPrimaryKey(String ti_no) {
		TicketinformationVO ticketinformationVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setString(1, ti_no);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ticketinformationVO = new TicketinformationVO();
				ticketinformationVO.setTi_no(rs.getString("ti_no"));
				ticketinformationVO.setTi_name(rs.getString("ti_name"));
				ticketinformationVO.setTi_price(rs.getString("ti_price"));
			}
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			
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
		return ticketinformationVO;
	}

	@Override
	public List<TicketinformationVO> getAll() {
		List<TicketinformationVO> list = new ArrayList<TicketinformationVO>();
		TicketinformationVO ticketinformationVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ticketinformationVO = new TicketinformationVO();
				ticketinformationVO.setTi_no(rs.getString("ti_no"));
				ticketinformationVO.setTi_name(rs.getString("ti_name"));
				ticketinformationVO.setTi_price(rs.getString("ti_price"));
				list.add(ticketinformationVO);
			}
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());

		} finally {
			if(rs != null) {
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
		return list;
	}
	
	public static void main(String[] args) {
		
		TicketinformationDAO dao = new TicketinformationDAO();
		
		// �s�W
		TicketinformationVO ticketinformationVO1 = new TicketinformationVO();
		ticketinformationVO1.setTi_name("�s�W��");
		ticketinformationVO1.setTi_price("11111");
		dao.insert(ticketinformationVO1);
		
		// �ק�
		TicketinformationVO ticketinformationVO2 = new TicketinformationVO();
		ticketinformationVO2.setTi_no("1");
		ticketinformationVO2.setTi_name("�קﲼ");
		ticketinformationVO2.setTi_price("22");
		dao.update(ticketinformationVO2);
		
		// �R��
		dao.delete("15");
		
		// �d��
		TicketinformationVO ticketinformationVO3 = dao.findByPrimaryKey("1");
		System.out.print(ticketinformationVO3.getTi_no() + ",");
		System.out.print(ticketinformationVO3.getTi_name() + ",");
		System.out.println(ticketinformationVO3.getTi_price());
		System.out.println("---------------------");
		
		// �d��
		List<TicketinformationVO> list = dao.getAll();
		for (TicketinformationVO ticketinformationVO4 : list) {
			System.out.print(ticketinformationVO4.getTi_no() + ",");
			System.out.print(ticketinformationVO4.getTi_name() + ",");
			System.out.print(ticketinformationVO4.getTi_price());
			System.out.println();
		}
		
		
	}

}
