package com.koravel.service;

import java.util.HashMap;

import com.koravel.domain.RecoVO;

public interface RecoService {

	//북마크 여부 확인
	int checkReco(HashMap<String, Object> hashMap);
	
	//북마크 삽입
	void recoInsert(HashMap<String, Object> hashMap);
	
	//북마크 제거
	void recoDelete(RecoVO Rvo);
	
	//유저 북마크 정보 출력
	RecoVO findReco(HashMap<String, Object> hashMap);
	
	HashMap<String, Object> bookmark_check(HashMap<String, Object> hashMap);
	
	HashMap<String, Object> bookmark_check_cancel(HashMap<String, Object> hashMap);
	
	//맞춤추천
	//북마크 여부 확인
	int checkReco2(HashMap<String, Object> hashMap);
	
	//북마크 삽입
	void recoInsert2(HashMap<String, Object> hashMap);
	
	//북마크 제거
	void recoDelete2(RecoVO Rvo);
	
	//유저 북마크 정보 출력
	RecoVO findReco2(HashMap<String, Object> hashMap);
	
	HashMap<String, Object> bookmark_check2(HashMap<String, Object> hashMap);
	
	HashMap<String, Object> bookmark_check_cancel2(HashMap<String, Object> hashMap);
	
	//지역행사용
	//북마크 여부 확인
	int checkReco3(HashMap<String, Object> hashMap);
	
	//북마크 삽입
	void recoInsert3(HashMap<String, Object> hashMap);
	
	//북마크 제거
	void recoDelete3(RecoVO Rvo);
		
	//유저 북마크 정보 출력
	RecoVO findReco3(HashMap<String, Object> hashMap);
		
	HashMap<String, Object> bookmark_check3(HashMap<String, Object> hashMap);
		
	HashMap<String, Object> bookmark_check_cancel3(HashMap<String, Object> hashMap);
}
