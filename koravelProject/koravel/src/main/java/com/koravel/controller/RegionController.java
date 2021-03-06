package com.koravel.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.koravel.domain.RecoVO;
import com.koravel.domain.RegionReviewVO;
import com.koravel.domain.RegionVO;
import com.koravel.domain.UsrVO;
import com.koravel.service.RecoService;
import com.koravel.service.RegionReviewService;
import com.koravel.service.RegionService;

@SessionAttributes("usrNick")
@Controller
@RequestMapping("/region")
public class RegionController {

	@Autowired
	private RegionService regionService;
	
	@Autowired
	private RegionReviewService regionreviewService;
	
	@Autowired
	private RecoService recoService;
	
	@RequestMapping("{step}.do")
	public String test(@PathVariable String step) {
		return "/region/" + step;
	}
	
	// 맞춤 추천 페이지
	@RequestMapping("recommand.do")
	public void recommandPage(RegionVO vo, Model m) {
		System.out.println("===> recommandPage 실행");
		List<HashMap> regionList = regionService.getRegionList(vo);
		List<HashMap> keywordList = regionService.getKeywordList();
		m.addAttribute("regionList", regionList);
		m.addAttribute("keywordList", keywordList);
		
		for(HashMap check1 : regionList) {
			System.out.println(check1);
		}
		
		for(HashMap check2 : keywordList) {
			System.out.println(check2);
		}
	}
	
	// 여행지 상세보기 페이지
	@RequestMapping("detailRegion.do")
	public void detailBoard(@ModelAttribute("usrNick") UsrVO usr, RegionVO vo, Model m, RegionReviewVO rvo,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.setAttribute("usrNick", usr.getUsrID());
		String readerID = (String) session.getAttribute("usrNick"); //(session.getAttribute("usrID")); 읽는 사람 ID정보
		
		vo.setReaderID(readerID);
		RegionVO result2 = regionService.getRegion(vo);
		result2.setReaderID(readerID);
		
		if (readerID != null) {
			int recoTF = 0;
			
			HashMap <String, Object> hashMap = new HashMap<String, Object>();
		    hashMap.put("searchRecoIdx", result2.getRegionIdx());
			hashMap.put("readerID", readerID);
			
			recoTF = recoService.checkReco2(hashMap);
			
			System.out.println(recoTF);
			//유저별 첫 북마크 클릭 시 로우 생성
			if( recoTF == 0) {
				recoService.recoInsert2(hashMap);
				recoTF += 1;
			}
		}
		
		//result.setReaderID(session.getAttribute("usrID")); 읽는 사람 ID정보
		m.addAttribute("region", result2);
			
		RegionVO result3 = regionService.getRegion(vo);
		List<HashMap> reviewresult = regionreviewService.review(rvo);
		// HashMap에 잘 담겼는지 확인
		for(HashMap review : reviewresult) {
			System.out.println(review);
		}		
		m.addAttribute("region2", result3);
		m.addAttribute("regionReview", reviewresult);	
	}
	
	// 북마크
	@ResponseBody
	@RequestMapping(value="/findReco2.do", method=RequestMethod.GET, produces="application/text; charset=UTF-8")
	public String reco(@ModelAttribute("usrNick") UsrVO usr, int searchRecoIdx, RecoVO vo, HttpServletRequest request){
		System.out.println(searchRecoIdx);
		//System.out.println("--> like() created");
		HttpSession session = request.getSession();
		
		session.setAttribute("usrNick", usr.getUsrID());
		String readerID = (String) session.getAttribute("usrNick");//session.getAttribute("usrID");
		JSONObject obj = new JSONObject();
		
		ArrayList<String> msgs = new ArrayList<String>();
		HashMap <String, Object> hashMap = new HashMap<String, Object>();
	    hashMap.put("searchRecoIdx", searchRecoIdx);
		hashMap.put("readerID", readerID);
		
		RecoVO recoVO = recoService.findReco2(hashMap);
		
		RegionVO regionVO = regionService.getRegionForReco(searchRecoIdx);
		int regionReco = regionVO.getRegionReco();     //게시판의 좋아요 카운트
		int checkRecoTF = 0;
		checkRecoTF = recoVO.getCheckRecoTF();  //좋아요 체크 값
		
		if(checkRecoTF == 0) {
			msgs.add("Like!");
			recoService.bookmark_check2(hashMap);
			checkRecoTF += 1;
			regionReco += 1;
			regionService.regionRecoUp(searchRecoIdx);   //좋아요 갯수 증가
			
			obj.put("searchRecoIdx", recoVO.getRegionIdx());
		    obj.put("checkRecoTF", checkRecoTF);
		    obj.put("regionReco", regionReco);
		    
			return obj.toJSONString();
		} else {
			msgs.add("unLike!");
			recoService.bookmark_check_cancel2(hashMap);
			checkRecoTF -= 1;
			regionReco -= 1;
			regionService.regionRecoDown(searchRecoIdx);   //좋아요 갯수 감소
			
			obj.put("searchRecoIdx", recoVO.getRegionIdx());
		    obj.put("checkRecoTF", checkRecoTF);
		    obj.put("regionReco", regionReco);
		    
			return obj.toJSONString();
		}
	}
}
