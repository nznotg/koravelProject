package com.koravel.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koravel.dao.UsrDAO;
import com.koravel.domain.BoardVO;
import com.koravel.domain.RecoVO;
import com.koravel.domain.UsrVO;

import lombok.RequiredArgsConstructor;

@Service("usrService")
public class UsrServiceImpl implements UsrService{

	@Autowired
	private UsrDAO usrDAO;
	
	@Override
	public int usrInsert(UsrVO vo) { // 회원가입
		return usrDAO.usrInsert(vo);
	}
	
	@Override
	public UsrVO usrLogin(UsrVO vo) { // 로그인
		return usrDAO.usrLogin(vo);
	}

	@Override
	public UsrVO idCheck(UsrVO vo) { // idCheck
		return usrDAO.idCheck(vo);
	}
	
	@Override
	public UsrVO usrMyInfo(UsrVO vo) { // 회원정보 조회
		return usrDAO.usrMyInfo(vo);
	}
	
	@Override
	public void usrUpdate(UsrVO vo) throws Exception { // 회원정보 수정
		usrDAO.usrUpdate(vo);
	}
	
	@Override
	public UsrVO emailCheck(UsrVO vo) { // EmailCheck
		return usrDAO.emailCheck(vo);
	}
	
	@Override
	public List<UsrVO> myBoard(String usrID) throws Exception { // 내가 작성한 게시판 목록
		System.out.println("내가 작성한 게시판 목록 출력");
		return usrDAO.myBoard(usrID);
	}
	
	@Override
	public void deleteMyBoard(BoardVO vo) throws Exception { // 내가 작성한 게시판 목록 제거
		System.out.println("게시판이 삭제되었습니다.");
		usrDAO.deleteMyBoard(vo);
	}
	
	@Override
	public List<HashMap<String, UsrVO>> myRegionReview(String usrID) throws Exception{ // 내가 작성한 리뷰 확인하기
		System.out.println("내가 작성한 리뷰 확인하기");
		return usrDAO.myRegionReview(usrID);
	}
	
	@Override
	// 내가 작성한 리뷰 제거하기
	public void deleteMyReview() throws Exception{
		System.out.println("내가 작성한 리뷰 제거");
		usrDAO.deleteMyReview();
	}
	
	@Override
	public UsrVO usrReco(UsrVO vo) { // 내가 선택한 맞춤추천 목록 확인 하기
		System.out.println("내가 선택한 맞춤추천 목록 확인하기");
		return usrDAO.usrReco(vo);
	}
	
	@Override
	public void usrRecoUpdate(UsrVO vo) throws Exception { // 맞춤추천 수정
		System.out.println("맞춤추천 수정하기");
		usrDAO.usrRecoUpdate(vo);
	}
	
	@Override
	// 내가 찜한 게시판 목록 리스트
	public List<HashMap<String,UsrVO>> myRecoBoard(String usrID) throws Exception {
		System.out.println("내가 찜한 게시글 호출");
		return usrDAO.myRecoBoard(usrID);
	}
	
	@Override
	public List<HashMap<String, UsrVO>> myRecoRegion(String usrID) throws Exception {
		System.out.println("내가 찜한 여행지 호출");
		return usrDAO.myRecoRegion(usrID);
	}

	@Override
	public List<UsrVO> getSearchList(int pageStart, int pageEnd, String searchType, String searchName) throws Exception{
		
		System.out.println("검색결과 호출");
		return usrDAO.getSearchList(pageStart, pageEnd, searchType, searchName);
		/* return usrDAO.getSearchList(pageStart, pageEnd, searchType, searchName); */
	}
	
	@Override
	// 내가 찜한 여행지 리스트 제거
	public void deleteMyBoardKoravel(RecoVO vo) throws Exception{
		System.out.println("여행지 리스트 제거");
		usrDAO.deleteMyBoardKoravel(vo);
	}
	@Override
	// 게시글 카운팅
	public int countBoard(String searchType, String searchName) throws Exception{
		
		System.out.println("게시판 개수 카운팅");
		return usrDAO.countBoard(searchType, searchName);
	}
}
	