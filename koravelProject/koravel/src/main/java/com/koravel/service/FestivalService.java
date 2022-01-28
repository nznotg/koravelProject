package com.koravel.service;

import java.util.HashMap;
import java.util.List;

import com.koravel.domain.FestivalVO;

public interface FestivalService {
	
	public List<HashMap> getFestivalList(FestivalVO vo);
	
	FestivalVO getFestival(FestivalVO vo);
	
	// 북마크 연동
	FestivalVO getFestivalForReco(int searchRecoIdx);
	
	void festivalRecoUp(int searchRecoIdx);
	
	void festivalRecoDown(int searchRecoIdx);

}
