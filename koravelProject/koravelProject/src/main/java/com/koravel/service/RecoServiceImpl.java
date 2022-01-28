package com.koravel.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koravel.dao.RecoDAOImpl;
import com.koravel.domain.RecoVO;

@Service("recoService")
public class RecoServiceImpl implements RecoService{
	
	@Autowired
	private RecoDAOImpl recoDAO;
	
	@Override
	public int checkReco(HashMap<String, Object> hashMap) {
		return recoDAO.checkReco(hashMap);
	}
	
	@Override
	public void recoInsert(HashMap<String, Object> hashMap) {
		recoDAO.recoInsert(hashMap);
	}
	
	@Override
	public void recoDelete(RecoVO Rvo) {
		recoDAO.recoDelete(Rvo);
	}
	
	@Override
	public RecoVO findReco(HashMap<String, Object> hashMap) {
		return recoDAO.findReco(hashMap);
	}
	
	@Override
	public HashMap<String, Object> bookmark_check(HashMap<String, Object> hashMap){
		return recoDAO.bookmark_check(hashMap);
	}
	
	@Override
	public HashMap<String, Object> bookmark_check_cancel(HashMap<String, Object> hashMap){
		return recoDAO.bookmark_check_cancel(hashMap);
	}
	
	
	
	//맞춤추천용
	@Override
	public int checkReco2(HashMap<String, Object> hashMap) {
		return recoDAO.checkReco2(hashMap);
	}
	
	@Override
	public void recoInsert2(HashMap<String, Object> hashMap) {
		recoDAO.recoInsert2(hashMap);
	}
	
	@Override
	public void recoDelete2(RecoVO Rvo) {
		recoDAO.recoDelete2(Rvo);
	}
	
	@Override
	public RecoVO findReco2(HashMap<String, Object> hashMap) {
		return recoDAO.findReco2(hashMap);
	}
	
	@Override
	public HashMap<String, Object> bookmark_check2(HashMap<String, Object> hashMap){
		return recoDAO.bookmark_check2(hashMap);
	}
	
	@Override
	public HashMap<String, Object> bookmark_check_cancel2(HashMap<String, Object> hashMap){
		return recoDAO.bookmark_check_cancel2(hashMap);
	}
	
	
	//지역행사용
	@Override
	public int checkReco3(HashMap<String, Object> hashMap) {
		return recoDAO.checkReco3(hashMap);
	}
	
	@Override
	public void recoInsert3(HashMap<String, Object> hashMap) {
		recoDAO.recoInsert3(hashMap);
	}
	
	@Override
	public void recoDelete3(RecoVO Rvo) {
		recoDAO.recoDelete3(Rvo);
	}
	
	@Override
	public RecoVO findReco3(HashMap<String, Object> hashMap) {
		return recoDAO.findReco3(hashMap);
	}
	
	@Override
	public HashMap<String, Object> bookmark_check3(HashMap<String, Object> hashMap){
		return recoDAO.bookmark_check3(hashMap);
	}
	
	@Override
	public HashMap<String, Object> bookmark_check_cancel3(HashMap<String, Object> hashMap){
		return recoDAO.bookmark_check_cancel3(hashMap);
	}
}
