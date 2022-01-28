package com.koravel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koravel.dao.BoardDAOImpl;
import com.koravel.domain.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAOImpl boardDAO;

	@Override
	public void insertBoard(BoardVO vo) {
		boardDAO.insertBoard(vo);
	}

	@Override
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		boardDAO.deleteBoard(vo);
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		return boardDAO.getBoard(vo);
	}
	
	@Override
	public BoardVO getBoardForReco(int searchRecoIdx) {
		return boardDAO.getBoardForReco(searchRecoIdx);
	}

	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		return boardDAO.getBoardList(vo);
	}
	
	@Override
	public List<BoardVO> getBoardMain(BoardVO vo) {
		return boardDAO.getBoardMain(vo);
	}
	
	@Override
	public void boardRecoUp(int searchRecoIdx) {
		boardDAO.boardRecoUp(searchRecoIdx);
	}
	
	@Override
	public void boardRecoDown(int searchRecoIdx) {
		boardDAO.boardRecoDown(searchRecoIdx);
	}
	
	
	

}
