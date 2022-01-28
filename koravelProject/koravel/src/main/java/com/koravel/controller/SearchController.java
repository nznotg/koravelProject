package com.koravel.controller;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.ExecutionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.koravel.domain.RegionVO;
import com.koravel.domain.SearchVO;
import com.koravel.transport.Region;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	@Autowired
	Region region;
	
	
	@RequestMapping("searchRegion.do")
	public ModelAndView searcRegionhResult(SearchVO vo) throws IOException, ExecutionException, InterruptedException {
		List<RegionVO> rVO = region.searchName(vo.getSearchKeyword());
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/search/searchResult");
		mv.addObject("searchResult", rVO);
		return mv;
	}

}
