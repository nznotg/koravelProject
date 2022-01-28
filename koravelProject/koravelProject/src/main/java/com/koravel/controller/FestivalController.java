package com.koravel.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koravel.domain.FestivalVO;
import com.koravel.domain.RecoVO;
import com.koravel.service.FestivalService;
import com.koravel.service.RecoService;

@Controller
@RequestMapping("/festival")
public class FestivalController {

	@Autowired
	private FestivalService festivalService;
	
	@Autowired
	private RecoService recoService;
	
	@RequestMapping("{step}.do")
	public String test(@PathVariable String step) {
		return "/festival/" + step;
	}
		
	
	
	// 지역 행사 페이지
	@RequestMapping("/festival.do")
	public void festivalPage(FestivalVO vo, Model m) {
		System.out.println("===> festivalPage 실행");
		List<HashMap> festivalList = festivalService.getFestivalList(vo);
		m.addAttribute("festivalList", festivalList);
		
		for(HashMap check3 : festivalList) {
			System.out.println(check3);
		}		
	}
	// 지역행사 상세 페이지
	@RequestMapping("/detailFestival.do")
	public void detailFestival(FestivalVO vo, Model m) {
		String readerID = "독자"; //(session.getAttribute("usrID")); 읽는 사람 ID정보
		
		vo.setReaderID(readerID);
		FestivalVO result4 = festivalService.getFestival(vo);
		result4.setReaderID(readerID);
		int recoTF = 0;
		
		if (readerID != null) {
			
			HashMap <String, Object> hashMap = new HashMap<String, Object>();
		    hashMap.put("searchRecoIdx", result4.getFestivalIdx());
			hashMap.put("readerID", readerID);
			
			recoTF = recoService.checkReco3(hashMap);
			
			System.out.println(recoTF);
			//유저별 첫 북마크 클릭 시 로우 생성
			if( recoTF == 0) {
				recoService.recoInsert3(hashMap);
				recoTF += 1;
			}
		}		
		//result.setReaderID(session.getAttribute("usrID")); 읽는 사람 ID정보
		m.addAttribute("recoTF", recoTF);
		m.addAttribute("festival", result4);		
	
		
	
		FestivalVO result5 = festivalService.getFestival(vo);
		m.addAttribute("festival2", result5);
	}
	
	
	
	// 북마크
	@ResponseBody
	@RequestMapping(value="/findReco3.do", method=RequestMethod.GET, produces="application/text; charset=UTF-8")
	public String reco3(int searchRecoIdx){
		System.out.println(searchRecoIdx);
		//System.out.println("--> like() created");
		String readerID = "독자";//session.getAttribute("usrID");
		JSONObject obj = new JSONObject();
		
		ArrayList<String> msgs = new ArrayList<String>();
		HashMap <String, Object> hashMap = new HashMap<String, Object>();
	    hashMap.put("searchRecoIdx", searchRecoIdx);
		hashMap.put("readerID", readerID);
		
		RecoVO recoVO = recoService.findReco3(hashMap);
		
		FestivalVO festivalVO = festivalService.getFestivalForReco(searchRecoIdx);
		int festivalReco = festivalVO.getFestivalReco();     //게시판의 좋아요 카운트
		int checkRecoTF = 0;
		checkRecoTF = recoVO.getCheckRecoTF();  //좋아요 체크 값
		
		if(checkRecoTF == 0) {
			msgs.add("Like!");
			recoService.bookmark_check3(hashMap);
			checkRecoTF += 1;
			festivalReco += 1;
			festivalService.festivalRecoUp(searchRecoIdx);   //좋아요 갯수 증가
			
			obj.put("searchRecoIdx", recoVO.getFestivalIdx());
		    obj.put("checkRecoTF", checkRecoTF);
		    obj.put("festivalReco", festivalReco);
		    
			return obj.toJSONString();
		} else {
			msgs.add("unLike!");
			recoService.bookmark_check_cancel3(hashMap);
			checkRecoTF -= 1;
			festivalReco -= 1;
			festivalService.festivalRecoDown(searchRecoIdx);   //좋아요 갯수 감소
			
			obj.put("searchRecoIdx", recoVO.getFestivalIdx());
		    obj.put("checkRecoTF", checkRecoTF);
		    obj.put("festivalReco", festivalReco);
		    
			return obj.toJSONString();
		}
	}
}
