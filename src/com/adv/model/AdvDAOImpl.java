package com.adv.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdvDAOImpl implements AdvDAO_interface {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String username = "JOIN";
	String password = "123456";

	private static final String INSERT_DEP = "INSERT INTO ADVERTISEMENT VALUES (ADVERTISEMENT_seq.NEXTVAL ,?,?,?,?,?)";
	private static final String UPDATE = "UPDATE ADVERTISEMENT set AD_NAME = ?, AD_PIC =?, AD_CONT =?, AD_START =?, AD_END =? WHERE AD_NO = ?";
	private static final String DELETE = "DELETE FROM ADVERTISEMENT WHERE AD_NO = ?";
	private static final String GET_ALL_DEP = "SELECT * FROM ADVERTISEMENT";
	private static final String GET_ONE_DEP = "SELECT * FROM ADVERTISEMENT WHERE AD_NO = ?";

	@Override
	public void insert(AdvVO advVO) {
		// TODO Auto-generated method stub

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, username, password);
			pstmt = con.prepareStatement(INSERT_DEP);

			//INSERT INTO ADVERTISEMENT VALUES (ADVERTISEMENT_seq.NEXTVAL ,?,?,?,?,?)
			//UPDATE ADVERTISEMENT set AD_NAME = ?, AD_PIC =?, AD_CONT =?, AD_START =?, AD_END =? WHERE AD_NO = ?

			pstmt.setString(1, advVO.getAd_name());
			pstmt.setBytes(2, advVO.getAd_pic());
			pstmt.setString(3, advVO.getAd_cont());
			pstmt.setDate(4, advVO.getAd_start());
			pstmt.setDate(5, advVO.getAd_end());

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void update(AdvVO advVO) {
		// TODO Auto-generated method stub

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, username, password);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, advVO.getAd_name());
			pstmt.setBytes(2, advVO.getAd_pic());
			pstmt.setString(3, advVO.getAd_cont());
			pstmt.setDate(4, advVO.getAd_start());
			pstmt.setDate(5, advVO.getAd_end());
			pstmt.setString(6, advVO.getAd_no());

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}

		if (con != null) {
			try {
				con.close();
			} catch (SQLException se) {
				se.printStackTrace(System.err);
			}
		}

	}

	@Override
	public void delete(String ad_no) {
		// TODO Auto-generated method stub

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, username, password);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, ad_no);
			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
			} catch (SQLException se) {
				se.printStackTrace(System.err);
			}
		}

	}

	@Override
	public AdvVO findByPrimaryKey(String ad_no) {
		// TODO Auto-generated method stub

		AdvVO advVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, username, password);
			pstmt = con.prepareStatement(GET_ONE_DEP);

			pstmt.setString(1, ad_no);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				advVO = new AdvVO();
				advVO.setAd_no(ad_no);
				advVO.setAd_name(rs.getString("AD_NAME"));
				advVO.setAd_pic(rs.getBytes("AD_PIC"));
				advVO.setAd_cont(rs.getString("AD_CONT"));
				advVO.setAd_start(rs.getDate("AD_START"));
				advVO.setAd_end(rs.getDate("AD_END"));
				//UPDATE ADVERTISEMENT set AD_NAME = ?, AD_PIC =?, AD_CONT =?, AD_START =?, AD_END =? WHERE AD_NO = ?

			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}

		return advVO;
	}

	@Override
	public List<AdvVO> getAll() {
		// TODO Auto-generated method stub

		List<AdvVO> list = new ArrayList<AdvVO>();
		AdvVO advVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, username, password);
			pstmt = con.prepareStatement(GET_ALL_DEP);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				advVO = new AdvVO();
				advVO.setAd_no(rs.getString("AD_NO"));
				advVO.setAd_name(rs.getString("AD_NAME"));
				advVO.setAd_pic(rs.getBytes("AD_PIC"));
				advVO.setAd_cont(rs.getString("AD_CONT"));
				advVO.setAd_start(rs.getDate("AD_START"));
				advVO.setAd_end(rs.getDate("AD_END"));
				list.add(advVO);
			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}

		}

		return list;
	}

	public static void main(String[] args) {

		AdvDAOImpl dao = new AdvDAOImpl();

		// �s�W
		AdvVO advVO1 = new AdvVO();
		advVO1.setAd_name("AD_NAMEinsert");
		advVO1.setAd_pic(null);
		advVO1.setAd_cont("AD_CONTinsert");
		advVO1.setAd_start(new java.sql.Date(System.currentTimeMillis()));
		advVO1.setAd_end(new java.sql.Date(System.currentTimeMillis()+24*60*60*1000));

		dao.insert(advVO1);

		// �ק�
		AdvVO advVO2 = new AdvVO();
		advVO2.setAd_no("1");
		advVO2.setAd_name("AD_NAMEupdate");
		advVO2.setAd_pic(null);
		advVO2.setAd_cont("AD_CONTupdate");
		advVO2.setAd_start(new java.sql.Date(System.currentTimeMillis()));
		advVO2.setAd_end(new java.sql.Date(System.currentTimeMillis()+24*60*60*1000));
		dao.update(advVO2);

		// �R��

		dao.delete("16");

		// �d��
		AdvVO advVO3 = dao.findByPrimaryKey("1");
		System.out.print(advVO3.getAd_no() + ",");
		System.out.print(advVO3.getAd_name() + ",");
		System.out.print(advVO3.getAd_pic() + ",");
		System.out.print(advVO3.getAd_cont());
		System.out.print(advVO3.getAd_start());
		System.out.print(advVO3.getAd_end());
		System.out.println("-----------------------");

		// �d��
		List<AdvVO> list = dao.getAll();
		for (AdvVO aDep : list) {

			System.out.print(aDep.getAd_no() + ",");
			System.out.print(aDep.getAd_name() + ",");
			System.out.print(aDep.getAd_pic() + ",");
			System.out.print(aDep.getAd_cont());
			System.out.print(aDep.getAd_start());
			System.out.print(aDep.getAd_end());
			System.out.println();
		}

	}
}