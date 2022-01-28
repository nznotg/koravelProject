package com.koravel.domain;

import lombok.Data;

@Data
public class BoardPage {

	// 페이지당 게시물 갯수
	public static final int PAGE_SCALE = 10;
	
	// 화면당 페이지 수 (보여지는 갯수)
	public static final int BLOCK_SCALE = 10;
	
	private int curPage; // 현재 페이지
	private int prevPage; // 이전 페이지
	private int nextPage; // 다음 페이지
	
	private int totalPage; // 전체 페이지 개수
	private int totalBlock; // 전체 페이지 블록 개수
	private int curBlock; // 현재 페이지 블록
	private int prevBlock; // 이전 페이지 블록
	private int nextBlock; // 다음 페이지 블록
	
	// mapper 
	private int pageStart;
	private int pageEnd;
	
	// [이전 ] (blockStart) 1 ~ 10 [다음]
	private int blockStart;
	
	// [이전 ] (blockStart) 1 ~ 10 (blockEnd) [다음]
	private int blockEnd;
	
	// 생성자
	public BoardPage(int count, int curPage) { // 레코드 개수, 현재 페이지 번호
		curBlock = 1; // 현재 페이지 블록 번호
		this.curPage = curPage; // 현재 페이지 설정
		setTotalPage(count); // 현재 페이지 개수 계산
		setTotalBlock(); // 전체 페이지 블록 개수 계산
		setPageRange();
		setBlockRange(); // 페이지 블록의 시작, 끝 번호 계산
	}
	
	public void setBlockRange() {
		// 현재 페이지가 몇 번째 페이지 블록에 속하는지 계산
		curBlock = (int)Math.ceil((curPage-1) / BLOCK_SCALE)+1;
		
		// 현재 페이지 블록의 시작, 끝 번호계산
		blockStart = (curBlock-1)*BLOCK_SCALE+1;
		
		// 페이지 블록의 끝 번호
		blockEnd = blockStart+BLOCK_SCALE-1;
		
		// 마지막 블록이 범위를 초과하지 않도록 계산
		if(blockEnd > totalPage) blockEnd = totalPage;
		
		// 이전버튼을 눌렀을 대 이동할 페이지 번호
		prevPage = (curPage == 1)? 1:(curBlock-1)*BLOCK_SCALE;
		
		// 다음버튼을 눌렀을 때 이동할 페이지 번호
		nextPage = curBlock > totalBlock ? (curBlock*BLOCK_SCALE) : (curBlock*BLOCK_SCALE)+1;
		
		// 마지막 페이지가 범위를 초과하지 않도록 처리
		if(nextPage >= totalPage) nextPage = totalPage;
	}
	
	public void setPageRange() {
		
		// 시작번호 = (현재페이지 -1 ) * 페이지당 게시물 수 + 1
		pageStart = (curPage-1)*PAGE_SCALE+1;
		
		// 끝 번호 = 시작번호 + 페이지당 게시물 수 -1
		pageEnd = pageStart+PAGE_SCALE-1;
		
	}
	
	public void setTotalPage(int count) {
		// 실수는 반올림
		totalPage = (int) Math.ceil(count * 1.0 / PAGE_SCALE);
	}
	
	// 페이지 블록의 갯수 계산
	public void setTotalBlock() {
		totalBlock = (int) Math.ceil(totalPage / PAGE_SCALE);
	}

	public static int getPageScale() {
		return PAGE_SCALE;
	}

	public static int getBlockScale() {
		return BLOCK_SCALE;
	}
	
	
}
