package com.koravel.service;

import java.util.HashMap;
import java.util.List;

import com.koravel.domain.RegionReviewVO;

public interface RegionReviewService {
	List<HashMap> review(RegionReviewVO rvo);

	void update(RegionReviewVO vo);
	
	void insert(RegionReviewVO vo);
	
}
