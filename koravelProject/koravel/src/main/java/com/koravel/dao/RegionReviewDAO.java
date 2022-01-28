package com.koravel.dao;

import java.util.HashMap;
import java.util.List;

import com.koravel.domain.RegionReviewVO;

public interface RegionReviewDAO {

	public List<HashMap> review(RegionReviewVO vo);

	public void update(RegionReviewVO vo);

	public void insert(RegionReviewVO vo);
}
