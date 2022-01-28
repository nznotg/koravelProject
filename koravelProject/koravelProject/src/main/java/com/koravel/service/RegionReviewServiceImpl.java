package com.koravel.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koravel.dao.RegionReviewDAO;
import com.koravel.domain.RegionReviewVO;

@Service("regionReviewService")
public class RegionReviewServiceImpl implements RegionReviewService {
	
	@Autowired
	private RegionReviewDAO regionReviewDAO;

	@Override
	public List<HashMap> review(RegionReviewVO rvo) {
		return regionReviewDAO.review(rvo);
	}
	
	@Override
	public void update(RegionReviewVO vo) {
		regionReviewDAO.update(vo);
	}

	@Override
	public void insert(RegionReviewVO vo) {
		regionReviewDAO.insert(vo);
		
	}
}