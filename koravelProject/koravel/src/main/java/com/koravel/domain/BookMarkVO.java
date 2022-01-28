package com.koravel.domain;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BookMarkVO {

	private String readerID;
	private String recoDate;
	private int boardIdx;
	private String boardTitle;
	private String boardCat;
	private int boardReco;
	private int boardViewCount;
	private int regionIdx;
	private int recoIdx;
	
}
