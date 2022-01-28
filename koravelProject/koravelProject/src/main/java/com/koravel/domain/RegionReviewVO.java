package com.koravel.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class RegionReviewVO {
	
	private int regionIdx;
	private int reviewIdx;
	private String usrNick;
	private String reviewContent;
	private Date reviewDate;
	private float reviewStar;

}
