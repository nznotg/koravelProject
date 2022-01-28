package com.koravel.service;

import java.util.List;

import com.koravel.domain.BoardVO;

public interface BoardService {
	// CRUD 기능의 메소드 구현
	// 글 등록
	void insertBoard(BoardVO vo);

	// 글 수정
	void updateBoard(BoardVO vo);

	// 글 삭제
	void deleteBoard(BoardVO vo);

	// 글 상세 조회
	BoardVO getBoard(BoardVO vo);
	
	// 글 상세 조회
	BoardVO getBoardForReco(int searchRecoIdx);

	// 글 목록 조회
	List<BoardVO> getBoardList(BoardVO vo);
	
	// 글 목록 조회 메인
	List<BoardVO> getBoardMain(BoardVO vo);
	
	void boardRecoUp(int searchRecoIdx);
	
	void boardRecoDown(int searchRecoIdx);
	
}