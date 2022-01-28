package com.koravel.dao;

import java.util.HashMap;
import java.util.List;

import com.koravel.domain.RegionReviewVO;
import com.koravel.domain.ReplyVO;

public interface ReplyDAO {
	
	public Integer insertReply(ReplyVO vo); 
	public List<ReplyVO> selectAllReply();
	public int deleteReply(int replyIdx);
	public void updateReply(ReplyVO vo);
	public List<HashMap> replyAll(ReplyVO ra);
	
}
