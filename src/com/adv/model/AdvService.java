package com.adv.model;

import java.sql.Date;
import java.util.List;

public class AdvService {

	private AdvDAO_interface dao;

	public AdvService() {
		dao = new AdvDAOImpl();
	}

	public AdvVO addAdv(String ad_name, byte[] ad_pic, String ad_cont, Date ad_start, Date ad_end) {

		AdvVO advVO = new AdvVO();

		advVO.setAd_name(ad_name);
		advVO.setAd_pic(ad_pic);
		advVO.setAd_cont(ad_cont);
		advVO.setAd_start(ad_start);
		advVO.setAd_end(ad_end);
		dao.insert(advVO);

		return advVO;
	}

	public AdvVO updateAdv(String ad_no, String ad_name, byte[] ad_pic, String ad_cont, Date ad_start, Date ad_end) {

		AdvVO advVO = new AdvVO();
		advVO.setAd_no(ad_no);
		advVO.setAd_name(ad_name);
		advVO.setAd_pic(ad_pic);
		advVO.setAd_cont(ad_cont);
		advVO.setAd_start(ad_start);
		advVO.setAd_end(ad_end);
		dao.update(advVO);

		return advVO;
	}

	public void deleteAdv(String cinema_no) {
		dao.delete(cinema_no);
	}

	public AdvVO getOneAdv(String cinema_no) {
		return dao.findByPrimaryKey(cinema_no);
	}

	public List<AdvVO> getAll() {
		return dao.getAll();
	}

}
