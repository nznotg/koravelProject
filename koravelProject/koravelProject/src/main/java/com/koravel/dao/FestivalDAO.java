package com.koravel.dao;

import java.util.HashMap;
import java.util.List;

import com.koravel.domain.FestivalVO;

public interface FestivalDAO {
	
	// 지역 해상 페이지
	public List<HashMap> getFestivalList(FestivalVO vo);
		
	// 지역행사 상세 페이지
	public FestivalVO getFestival(FestivalVO vo);

	// 북마크 연동
	public FestivalVO getFestivalForReco(int searchRecoIdx);
	
	public void festivalRecoUp(int searchRecoIdx);
	
	public void festivalRecoDown(int searchRecoIdx);

}
