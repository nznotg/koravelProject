package com.koravel.domain;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UsrVO {
	
	private long usrIdx;
	private String usrEmail;
	private String usrBirth;
	private Date usrSince;
	private String usrNick;
	private Date usrSubscribe;
	private int usrPoint;
	private String usrID;
	private String usrPasswd;
	private String usrmood;
	private String usrtheme;
	private String usrplace; 
	
	// 검색 키워드 구현
	private String searchType; // 검색 목록
	private String searchName; // 검색어

	
}
