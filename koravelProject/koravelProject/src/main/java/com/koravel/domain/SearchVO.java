package com.koravel.domain;

import lombok.Data;

@Data
public class SearchVO {
	
	private String searchKeyword;
	private String searchField;
	private String searchSort;
	private boolean searchSortStyle;
	private int searchFrom;
	private int searchSize;
	
}
