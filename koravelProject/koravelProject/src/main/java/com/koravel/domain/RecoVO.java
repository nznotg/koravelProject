package com.koravel.domain;

public class RecoVO {

	//추천 관련 VO
	private int recoIdx;
	private int regionIdx;
	private int boardIdx;
	private String readerID;
	private int checkRecoTF;
	
	//게시글 총 북마크 수
	private int boardReco;
	private int boardViewCount;
	
	//맞춤 추천
	private int regionReco;
	
	//지역행사
	private int festivalIdx;
	private int festivalReco;
	
	
	public int getRegionReco() {
		return regionReco;
	}
	public void setRegionReco(int regionReco) {
		this.regionReco = regionReco;
	}
	public int getFestivalIdx() {
		return festivalIdx;
	}
	public void setFestivalIdx(int festivalIdx) {
		this.festivalIdx = festivalIdx;
	}
	public int getFestivalReco() {
		return festivalReco;
	}
	public void setFestivalReco(int festivalReco) {
		this.festivalReco = festivalReco;
	}
	public int getBoardReco() {
		return boardReco;
	}
	public void setBoardReco(int boardReco) {
		this.boardReco = boardReco;
	}
	public int getBoardViewCount() {
		return boardViewCount;
	}
	public void setBoardViewCount(int boardViewCount) {
		this.boardViewCount = boardViewCount;
	}
	public String getReaderID() {
		return readerID;
	}
	public void setReaderID(String readerID) {
		this.readerID = readerID;
	}
	public int getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}
	public int getCheckRecoTF() {
		return checkRecoTF;
	}
	public void setCheckRecoTF(int checkRecoTF) {
		this.checkRecoTF = checkRecoTF;
	}
	public int getRecoIdx() {
		return recoIdx;
	}
	public void setRecoIdx(int recoIdx) {
		this.recoIdx = recoIdx;
	}
	public int getRegionIdx() {
		return regionIdx;
	}
	public void setRegionIdx(int regionIdx) {
		this.regionIdx = regionIdx;
	}
}
