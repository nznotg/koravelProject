package com.koravel.domain;

import java.math.BigDecimal;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RegionVO {
	
	// project DB
	// project DB
	private int regionIdx;
	private String regionName;
	private String regionAddr;
	private String regionPhone;
	private String regionInfo;
	private float regionStar;
	private BigDecimal regionX;
	private BigDecimal regionY;
	private Date regionInsertSince;
	private String regionMainImgFile;
	private String regionDetailBxImg1;
	private String regionDetailBxImg2;
	private String regionDetailBxImg3;
	private String regionDetailBxthumbImg1;
	private String regionDetailBxthumbImg2;
	private String regionDetailBxthumbImg3;

	
	// 북마크
	private int regionReco;
	//독자 확인용 VO
	private String readerID;
	private int checkRecoTF;
}
