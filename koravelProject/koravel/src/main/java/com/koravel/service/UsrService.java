package com.koravel.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.koravel.domain.BoardVO;
import com.koravel.domain.BookMarkVO;
import com.koravel.domain.RecoVO;
import com.koravel.domain.UsrVO;

public interface UsrService {
	
	int usrInsert(UsrVO vo); //회원가입
	
	UsrVO usrLogin(UsrVO vo); // 로그인하기
	
	public UsrVO usrMyInfo(UsrVO vo); // 회원정보 호출하기
	
	void usrUpdate(UsrVO vo) throws Exception;//회원정보 수정하기
	
	UsrVO idCheck(UsrVO vo); // IDCheck
	
	UsrVO emailCheck(UsrVO vo); // EmailCheck

	List<UsrVO> myBoard(String usrID) throws Exception; // 내가 작성한 목록 리스트

	void deleteMyBoard(BoardVO vo) throws Exception; // 내가 작성한 게시판 제거
	
	List<UsrVO> getSearchList(int pageStart, int pageEnd, String searchType, String searchName) throws Exception; // 게시판 검색기능 구현
	
	List<HashMap<String,UsrVO>> myRegionReview(String usrID) throws Exception; // 내가 작성한 리뷰 확인하기
	
	void deleteMyReview() throws Exception; // 내가 작성한 리뷰 제거하기
	
	UsrVO usrReco(UsrVO vo); // 내가 선택한 맞춤추천 목록 확인 하기
	
	void usrRecoUpdate(UsrVO vo) throws Exception; // 맞춤추천 수정
	
	List<HashMap<String,UsrVO>> myRecoBoard(String usrID) throws Exception; // 내가 찜한 게시판
	
	List<HashMap<String,UsrVO>> myRecoRegion(String usrID) throws Exception; // 내가 찜한 여행지

	void deleteMyBoardKoravel(RecoVO vo) throws Exception; // 내가 찜한 여행지 목록 제거
	
	// 게시글 카운팅
	public int countBoard(String searchType, String searchName) throws Exception;
 }
