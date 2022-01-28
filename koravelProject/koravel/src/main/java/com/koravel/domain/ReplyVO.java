package com.koravel.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReplyVO {
	
	// project DB
	private int replyIdx;			// 댓글번호
	private int regionIdx;			// 게시글번호 ( 댓글이 달릴 게시글 )
	private String replyInfo;		// 댓글내용
	private String usrID;			// 댓글작성자
	private Date replyDate;			// 댓글작성일
	private Date updateDate;
	private float replyStar;


}
