package com.koravel.dao;

import java.util.HashMap;
import java.util.List;

import com.koravel.domain.RegionReviewVO;
import com.koravel.domain.RegionVO;


public interface RegionDAO {
	
	// 특정 지역 정보만 가져오
		public RegionVO getRegion(RegionVO vo);
		
		// 맞춤 페이지 : 지역 정보 리스트 가져오
		public List<HashMap> getRegionList(RegionVO vo);
		
		// 키워드 가져오
		public List<HashMap> getKeywordList();
		
		// 지역 해상 페이지
		public List<HashMap> getFestivalList(RegionVO vo);
			
		// 지역행사 상세 페이지
		public RegionVO getDetailFestival(RegionVO vo);

		// 북마크 연동
		public RegionVO getRegionForReco(int searchRecoIdx);
		
		public void regionRecoUp(int searchRecoIdx);
		
		public void regionRecoDown(int searchRecoIdx);
	
}
