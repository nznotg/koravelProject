package com.koravel.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koravel.domain.BoardVO;

@Repository("boardDAO")
public class BoardDAOImpl {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertBoard(BoardVO vo) {
		System.out.println("===> Mybatis insertBoard() 호출");
		mybatis.insert("BoardDAO.insertBoard", vo);
	}

	public void updateBoard(BoardVO vo) {
		System.out.println("===> Mybatis updateBoard() 호출");
		mybatis.update("BoardDAO.updateBoard", vo);
	}

	public void deleteBoard(BoardVO vo) {
		System.out.println("===> Mybatis deleteBoard() 호출");
		mybatis.delete("BoardDAO.deleteBoard", vo);
	}

	public BoardVO getBoard(BoardVO vo) {
		System.out.println("===> Mybatis getBoard() 호출");
		System.out.println("===> Mybatis upViewCount() 호출");
		//게시글 조회수 증가
		mybatis.update("BoardDAO.upViewCount", vo);
		
		return mybatis.selectOne("BoardDAO.getBoard", vo);
	}
	
	public BoardVO getBoardForReco(int searchRecoIdx) {
		System.out.println("===> Mybatis getBoardForReco() 호출");
		return (BoardVO)mybatis.selectOne("BoardDAO.getBoardForReco", searchRecoIdx);
	}

	public List<BoardVO> getBoardList(BoardVO vo) {
		System.out.println("===> Mybatis getBoardList() 호출");
		return mybatis.selectList("BoardDAO.getBoardList", vo);
	}
	
	public List<BoardVO> getBoardMain(BoardVO vo) {
		System.out.println("===> Mybatis getBoardMain() 호출");
		return mybatis.selectList("BoardDAO.getBoardMain", vo);
	}
	
	public void boardRecoUp(int searchRecoIdx) {
		System.out.println("===> Mybatis boardRecoUp() 호출");
		mybatis.update("BoardDAO.boardRecoUp", searchRecoIdx);
	}
	
	public void boardRecoDown(int searchRecoIdx) {
		System.out.println("===> Mybatis boardRecoDown() 호출");
		mybatis.update("BoardDAO.boardRecoDown", searchRecoIdx);
	}
	
}
