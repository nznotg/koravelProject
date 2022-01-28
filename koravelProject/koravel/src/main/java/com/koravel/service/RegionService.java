package com.koravel.service;

import java.util.HashMap;
import java.util.List;

import com.koravel.domain.RegionReviewVO;
import com.koravel.domain.RegionVO;

public interface RegionService {
	
	public List<HashMap> getRegionList(RegionVO vo);

	RegionVO getRegion(RegionVO vo);

	public List<HashMap> getKeywordList();
	
	// 북마크 연동
	RegionVO getRegionForReco(int searchRecoIdx);
	
	void regionRecoUp(int searchRecoIdx);
	
	void regionRecoDown(int searchRecoIdx);
}
