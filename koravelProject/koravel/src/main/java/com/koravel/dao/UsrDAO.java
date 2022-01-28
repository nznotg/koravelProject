package com.koravel.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.koravel.domain.BoardVO;
import com.koravel.domain.BookMarkVO;
import com.koravel.domain.RecoVO;
import com.koravel.domain.UsrVO;

public interface UsrDAO {
	
	// 회원가입
	public int usrInsert(UsrVO vo);
	
	// 로그인
	public UsrVO usrLogin(UsrVO vo);
	
	// idCheck
	public UsrVO idCheck(UsrVO vo);
	
	// EmailCheck
	public UsrVO emailCheck(UsrVO vo);
	
	// 회원정보 조회
	public UsrVO usrMyInfo(UsrVO vo);
	
	//회원정보 수정
	public void usrUpdate(UsrVO vo) throws Exception;
	
	// 내가 작성한 게시판 목록 리스트
	public List<UsrVO> myBoard(String usrID) throws Exception;
	
	// 내가 작성한 게시판 삭제하기
	public void deleteMyBoard(BoardVO vo) throws Exception;
	
	// 게시판 검색기능 구현
	
	public List<UsrVO> getSearchList(@Param("pageStart")int pageStart, @Param("pageEnd")int pageEnd, 
			@Param("searchType")String searchType, @Param("searchName")String searchName) throws Exception;

	// 내가 작성한 리뷰 확인하기
	public List<HashMap<String, UsrVO>> myRegionReview(String usrID) throws Exception;
	
	// 내가 작성한 리뷰 제거하기
	public void deleteMyReview() throws Exception;
	
	// 내가 선택한 맞춤추천 목록 확인 하기
	public UsrVO usrReco(UsrVO vo);
	
	// 맞춤 추천 수정하기
	public void usrRecoUpdate(UsrVO vo) throws Exception;
	
	// 내가 찜한 게시판 목록
	public List<HashMap<String,UsrVO>> myRecoBoard(String usrID) throws Exception;
	
	// 내가 찜한 여행지 목록
	public List<HashMap<String,UsrVO>> myRecoRegion(String usrID) throws Exception;
	
	// 내가 찜한 여행지 목록 제거
	public void deleteMyBoardKoravel(RecoVO vo) throws Exception;

	// 게시판 개수 카운팅
	public int countBoard(@Param("searchType")String searchType, @Param("searchName")String searchName) throws Exception;

	
}
