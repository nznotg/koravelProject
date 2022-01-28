package com.koravel.dao;

import java.util.HashMap;

import com.koravel.domain.RecoVO;

public interface RecoDAO {
	//북마크 여부 확인
	public int checkReco(HashMap<String, Object> hashMap);
	//북마크 삽입
	public void recoInsert(HashMap<String, Object> hashMap);
	//북마크 제거
	public void recoDelete(RecoVO Rvo);
	//board 북마크 총 수 확인 및 적용
	public RecoVO findReco(HashMap<String, Object> hashMap);
		
	public HashMap<String, Object> bookmark_check(HashMap<String, Object> hashMap);
		
	public HashMap<String, Object> bookmark_check_cancel(HashMap<String, Object> hashMap);
		
	//맞춤추천
	//북마크 여부 확인
	public int checkReco2(HashMap<String, Object> hashMap);
	//북마크 삽입
	public void recoInsert2(HashMap<String, Object> hashMap);
	//북마크 제거
	public void recoDelete2(RecoVO Rvo);
	//board 북마크 총 수 확인 및 적용
	public RecoVO findReco2(HashMap<String, Object> hashMap);
		
	public HashMap<String, Object> bookmark_check2(HashMap<String, Object> hashMap);
		
	public HashMap<String, Object> bookmark_check_cancel2(HashMap<String, Object> hashMap);
	
	//지역행사용
	//북마크 여부 확인
	public int checkReco3(HashMap<String, Object> hashMap);
	//북마크 삽입
	public void recoInsert3(HashMap<String, Object> hashMap);
	//북마크 제거
	public void recoDelete3(RecoVO Rvo);
	//board 북마크 총 수 확인 및 적용
	public RecoVO findReco3(HashMap<String, Object> hashMap);
		
	public HashMap<String, Object> bookmark_check3(HashMap<String, Object> hashMap);
		
	public HashMap<String, Object> bookmark_check_cancel3(HashMap<String, Object> hashMap);
}
