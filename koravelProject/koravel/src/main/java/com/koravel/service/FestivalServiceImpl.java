package com.koravel.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koravel.dao.FestivalDAO;
import com.koravel.domain.FestivalVO;

@Service("festivalService")
public class FestivalServiceImpl implements FestivalService {

	@Autowired
	public FestivalDAO festivalDAO;
	
		
	@Override
	public List<HashMap> getFestivalList(FestivalVO vo) {
		return festivalDAO.getFestivalList(vo);
	}

	@Override
	public FestivalVO getFestival(FestivalVO vo) {
		return festivalDAO.getFestival(vo);
	}
	
	@Override
	public FestivalVO getFestivalForReco(int searchRecoIdx) {
		return festivalDAO.getFestivalForReco(searchRecoIdx);
	}
	
	@Override
	public void festivalRecoUp(int searchRecoIdx) {
		festivalDAO.festivalRecoUp(searchRecoIdx);
	}
	
	@Override
	public void festivalRecoDown(int searchRecoIdx) {
		festivalDAO.festivalRecoDown(searchRecoIdx);
	}

}
