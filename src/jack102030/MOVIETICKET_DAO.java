package jack102030;

import java.util.*;

import java.sql.*;

public class MOVIETICKET_DAO implements MOVIETICKET_interface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA106";
	String passwd = "123456";
	
	private static final String INSERT_STMT = 
			"INSERT INTO MOVIETICKET (mt_no,order_no,ti_no,mt_qr,mt_admission,mt_share) VALUES (MOVIETICKET_seq.NEXTVAL, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = 
			"SELECT mt_no,order_no,ti_no,mt_qr,mt_admission,mt_share FROM MOVIETICKET order by mt_no";
	private static final String GET_ONE_STMT = 
			"SELECT mt_no,order_no,ti_no,mt_qr,mt_admission,mt_share FROM MOVIETICKET where mt_no = ?";
	private static final String DELETE = 
			"DELETE FROM MOVIETICKET where mt_no = ?";
	private static final String UPDATE = 
			"UPDATE MOVIETICKET set order_no=?, ti_no=?, mt_qr=?, mt_admission=?, mt_share=? where mt_no = ?";
	
	@Override
	public void insert(MOVIETICKET_VO movieticketVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			//pstmt.setString(1, ticketorderVO.getOrder_no());
			pstmt.setString(1, movieticketVO.getOrder_no());
			pstmt.setString(2, movieticketVO.getTi_no());
			pstmt.setBytes(3, movieticketVO.getMt_qr());
			pstmt.setInt(4, movieticketVO.getMt_admission());
			pstmt.setString(5, movieticketVO.getMt_share());
			
			

			pstmt.executeUpdate();

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
	public void update(MOVIETICKET_VO movieticketVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, movieticketVO.getOrder_no());
			pstmt.setString(2, movieticketVO.getTi_no());
			pstmt.setBytes(3, movieticketVO.getMt_qr());
			pstmt.setInt(4, movieticketVO.getMt_admission());
			pstmt.setString(5, movieticketVO.getMt_share());
			
			

			pstmt.executeUpdate();

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
	public void delete(String mt_no) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, mt_no);

			pstmt.executeUpdate();

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
	public MOVIETICKET_VO findByPrimaryKey(String mt_no) {
		MOVIETICKET_VO movieticketVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, mt_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				movieticketVO = new MOVIETICKET_VO();
				movieticketVO.setMt_no(rs.getString("mt_no"));
				movieticketVO.setOrder_no(rs.getString("order_no"));
				movieticketVO.setTi_no(rs.getString("ti_no"));
				movieticketVO.setMt_qr(rs.getBytes("mt_qr"));
				movieticketVO.setMt_admission(rs.getInt("mt_admission"));
				movieticketVO.setMt_share(rs.getString("mt_share"));
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
		
		return movieticketVO;
	}

	@Override
	public List<MOVIETICKET_VO> getAll() {
		List<MOVIETICKET_VO> list = new ArrayList<MOVIETICKET_VO>();
		MOVIETICKET_VO movieticketVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				movieticketVO = new MOVIETICKET_VO();
				movieticketVO.setMt_no(rs.getString("mt_no"));
				movieticketVO.setOrder_no(rs.getString("order_no"));
				movieticketVO.setTi_no(rs.getString("ti_no"));
				movieticketVO.setMt_qr(rs.getBytes("mt_qr"));
				movieticketVO.setMt_admission(rs.getInt("mt_admission"));
				movieticketVO.setMt_share(rs.getString("mt_share"));
				list.add(movieticketVO); // Store the row in the list
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
		return list;
	}
	
	public static void main(String[] args) {

		MOVIETICKET_DAO dao = new MOVIETICKET_DAO();

		// 新增
		MOVIETICKET_VO movieticketVO1 = new MOVIETICKET_VO();
		movieticketVO1.setOrder_no("16");
		movieticketVO1.setTi_no("22");
		movieticketVO1.setMt_qr();
		movieticketVO1.setMt_admission(0);
		movieticketVO1.setMt_share("qewr520@gmail.com");
		dao.insert(movieticketVO1);

		// 修改
		MOVIETICKET_VO movieticketVO2 = new MOVIETICKET_VO();
		movieticketVO2.setOrder_no("1");
		movieticketVO2.setOrder_no("10023");
		movieticketVO2.setFd_no("23");
		movieticketVO2.setSession_no("123");
		movieticketVO2.setEmployee_no("0023");
		movieticketVO2.setOrder_group(0);
		dao.update(movieticketVO2);

		// 刪除
		dao.delete("16");

		// 查詢
		TICKETORDER_VO movieticketVO3 = dao.findByPrimaryKey("1");
		System.out.print(movieticketVO3.getOrder_no() + ",");
		System.out.print(movieticketVO3.getMember_no() + ",");
		System.out.print(movieticketVO3.getFd_no() + ",");
		System.out.print(movieticketVO3.getSession_no() + ",");
		System.out.print(movieticketVO3.getEmployee_no() + ",");
		System.out.println(movieticketVO3.getOrder_amount());
		System.out.println("---------------------");

		// 查詢
		List<TICKETORDER_VO> list = dao.getAll();
		for (TICKETORDER_VO movieticketVO4 : list) {
			System.out.print(movieticketVO4.getOrder_no() + ",");
			System.out.print(movieticketVO4.getMember_no() + ",");
			System.out.print(movieticketVO4.getFd_no() + ",");
			System.out.print(movieticketVO4.getSession_no() + ",");
			System.out.print(movieticketVO4.getEmployee_no() + ",");
			System.out.print(movieticketVO4.getOrder_amount());
			System.out.println();
		}
	}

	
	
	
	

}
