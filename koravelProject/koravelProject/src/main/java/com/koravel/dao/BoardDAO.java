package com.koravel.dao;

import java.util.List;

import com.koravel.domain.BoardVO;

public interface BoardDAO {
	public void insertBoard(BoardVO vo);

	public void updateBoard(BoardVO vo);

	public void deleteBoard(BoardVO vo);

	public BoardVO getBoard(BoardVO vo);
	
	public BoardVO getBoardForReco(int searchRecoIdx);

	public List<BoardVO> getBoardList(BoardVO vo);

	public List<BoardVO> getBoardMain(BoardVO vo);
	
	public void boardRecoUp(int searchRecoIdx);
	
	public void boardRecoDown(int searchRecoIdx);
	
}
