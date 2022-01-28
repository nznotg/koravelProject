package com.koravel.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.koravel.dao.ReplyDAO;
import com.koravel.domain.RegionReviewVO;
import com.koravel.domain.ReplyVO;
import com.koravel.service.RegionReviewService;

@RestController
public class ReplyController {
	
	@Autowired
	ReplyDAO replyDAO;
	
	@Autowired
	RegionReviewService service;
	
	//댓글 입력
	@PostMapping("/replies/new")
	public String replyInsert(RegionReviewVO vo) {
		service.insert(vo);
		return "OK";
	}
	// 댓글 전체 가져오기c 
	@GetMapping("replies")
	public List<ReplyVO> selectAll() {
		List<ReplyVO> list = replyDAO.selectAllReply();
		System.out.println("list : " + list);
		return list;
	}
	
	// 하나의 댓글 삭제
	@DeleteMapping("/replies/{replyIdx}")
	public int deleteReply(@PathVariable String replyIdx) {
		int trans = Integer.parseInt(replyIdx);
		int result = replyDAO.deleteReply(trans);
		return result;
	}
	
	@GetMapping("/replies/{regionIdx}")
	// ajax에서 param으로 보낸 데이터를 각각 받는 방법입니다.
	public void confrim(@PathVariable String regionIdx, 
						@RequestParam("reviewContent") String reviewContent,
						@RequestParam("regionIdx") String reviewIdx) { 
		int reviewtrans = Integer.parseInt(reviewIdx);
		int regiontrans = Integer.parseInt(regionIdx);
		
		System.out.println(reviewtrans);
		System.out.println(regiontrans);
		
		RegionReviewVO vo = new RegionReviewVO();
		vo.setReviewContent(reviewContent);
		vo.setReviewIdx(reviewtrans);
		vo.setRegionIdx(regiontrans);
		
		service.update(vo);
		
//		return result;
	}
	
}
