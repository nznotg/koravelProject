package com.koravel.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FestivalVO {
	
	// 지역행사 상세 db
	private int festivalIdx;
	private String festivalTitle;
	private String festivalInfo;
	private String festivalTel;
	private String festivalAddr;
	private String festivalAddr2;
	private String festivalPay;
	private String festivalDate;
	private String festivalStart;
	private String festivalEnd;
	
	// 북마크
	private int festivalReco;
	//독자 확인용 VO
	private String readerID;
	private int checkRecoTF;
	
	public int getFestivalReco() {
		return festivalReco;
	}
	public void setFestivalReco(int festivalReco) {
		this.festivalReco = festivalReco;
	}
	public String getReaderID() {
		return readerID;
	}
	public void setReaderID(String readerID) {
		this.readerID = readerID;
	}	
	public int getCheckRecoTF() {
		return checkRecoTF;
	}
	public void setCheckRecoTF(int checkRecoTF) {
		this.checkRecoTF = checkRecoTF;
	}
	public int getFestivalIdx() {
		return festivalIdx;
	}

}
