package com.koravel.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koravel.dao.RegionDAO;
import com.koravel.domain.RegionVO;

@Service("regionService")
public class RegionServiceImpl implements RegionService {

	@Autowired
	public RegionDAO regionDAO;
	
	@Override
	public RegionVO getRegion(RegionVO vo) {
		return regionDAO.getRegion(vo);
	}
	
	@Override
	public List<HashMap> getRegionList(RegionVO vo) {
		return regionDAO.getRegionList(vo);
	}
	
	@Override
	public List<HashMap> getKeywordList(){
		return regionDAO.getKeywordList();
	}	
	
	
	@Override
	public RegionVO getRegionForReco(int searchRecoIdx) {
		return regionDAO.getRegionForReco(searchRecoIdx);
	}
	
	@Override
	public void regionRecoUp(int searchRecoIdx) {
		regionDAO.regionRecoUp(searchRecoIdx);
	}
	
	@Override
	public void regionRecoDown(int searchRecoIdx) {
		regionDAO.regionRecoDown(searchRecoIdx);
	}

}
