package com.koravel.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.koravel.domain.BoardPage;
import com.koravel.domain.BoardVO;
import com.koravel.domain.BookMarkVO;
import com.koravel.domain.RecoVO;
import com.koravel.domain.UsrVO;
import com.koravel.service.BoardService;
import com.koravel.service.UsrService;

@Controller
@RequestMapping("myPage")
public class myPageController {

	@Autowired
	private UsrService usrService;
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("{step}.do")
	public String step(@PathVariable String step) { 
		return "myPage/" + step;
	}
	
	// 마이페이지 ( 회원정보)
	// ===============================================================================
	// myPage 회원정보 호출하기
	@RequestMapping(value="myUsrInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public String myUsrInfo(@RequestParam(required = false) UsrVO vo, Model model) {
		System.out.println("회원정보 호출");
		
		model.addAttribute("usrMyInfo", usrService.usrMyInfo(vo));
		
		return "/usrMyInfo";
	}
	
	// myPage 회원정보 수정하기
	@RequestMapping(value="usrUpdate.do")
	public String usrUpdate(UsrVO vo, HttpSession session) throws Exception {
		System.out.println("회원정보 수정");
			usrService.usrUpdate(vo);
			
			System.out.println("회원정보 수정 완료");
			
			return "redirect:/";
	}	
	// ================================================================================
	
	
	// myPage 내가 쓴 게시판 확인하기
	// ================================================================================
	@RequestMapping(value="myBoard.do", method=RequestMethod.GET)
	public String myBoardList(HttpSession session, Model model, 
			HttpServletRequest request) throws Exception {
		
		UsrVO vo = (UsrVO)session.getAttribute("usrNick");
		String usrID = vo.getUsrID();
		
		List<UsrVO> myBoardList = usrService.myBoard(usrID); // 내가 작성한 게시판 목록
		List<HashMap<String, UsrVO>> myRegionReview = usrService.myRegionReview(usrID); // 내가 작성한 리뷰 목록
		
		model.addAttribute("myBoardList", myBoardList); // 내가 작성한 게시판 목록
		model.addAttribute("myRegionReview", myRegionReview); // 내가 작성한 리뷰 확인하기 
		
		return "myPage/myBoard"; 
		
	}
	
	// myPage 내가 쓴 게시판 삭제하기
	@RequestMapping(value="deleteMyBoard.do")
	public String deleteMyBoard(BoardVO vo) throws Exception{
		
		usrService.deleteMyBoard(vo);
		return "redirect:myPage/myPage";
	}
	
	// 게시판 검색기능 구현
	@RequestMapping("getSearchList.do")
	public ModelAndView getSearchList(@RequestParam(defaultValue = "title") String searchType, HttpSession session,
			@RequestParam(defaultValue = "") String searchName, @RequestParam(defaultValue = "1") int curPage,HttpServletRequest request) throws Exception{
		
		UsrVO vo = (UsrVO)session.getAttribute("usrNick");
		String usrID = vo.getUsrID();
		
		int count = usrService.countBoard(searchType, searchName); // 레코드의 카운트 계산 
		BoardPage boardpage = new BoardPage(count, curPage);
		
		System.out.println("count : " + count);
		System.out.println("boardpage" + boardpage);
		
		// 페이징 나누기
		int pageStart = boardpage.getPageStart();
		int pageEnd = boardpage.getPageEnd();
		List<UsrVO> searchList = usrService.getSearchList(pageStart, pageEnd, searchType, searchName);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", searchList); // 검색 리스트
		map.put("count", count); // 레코드 개수
		map.put("searchType", searchType); // 검색목록
		map.put("searchName", searchName); // 검색 명
		map.put("boardpage", boardpage); // 페이징처리
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("myPage/searchBoard");
		
		return mav;
	}
	
	// 내가 작성한 리뷰 제거
	@RequestMapping("deleteMyReview.do")
	public String deleteMyReview() throws Exception{
			
		usrService.deleteMyReview();
		return "redirect:myPage.do";
			
	}
 	// ================================================================================
	
		
	// 마이페이지(맞춤추천)
	// =================================================================================
	// myPage 맞춤추천 조회하기
	@RequestMapping(value="myRecommend.do", method=RequestMethod.POST)
	public String myRecommend(@RequestParam(required = false) UsrVO vo, Model model) {
		model.addAttribute("myReco", usrService.usrReco(vo));
		System.out.println("맞춤추천 호출");

		return "myPage/myRecommend";
	}
	
	// myPage 맞춤추천 수정하기
	@RequestMapping(value="usrRecoUpdate.do", method=RequestMethod.POST)
	public String usrRecoUpdate(UsrVO vo) throws Exception{
		
		try {
			usrService.usrRecoUpdate(vo);
			System.out.println("맞춤추천 수정 완료");
			return "redirect:myPage.do";

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/";	
	}
	// =================================================================================
	
	// myPage 북마크(게시판)
	// ==================================================================================
	@RequestMapping(value="bookMark.do", method=RequestMethod.GET)
	public String myRecoBoard(@RequestParam(required = false)String usrID, HttpSession session, Model model) throws Exception{
		UsrVO vo = (UsrVO)session.getAttribute("usrNick");
		usrID = vo.getUsrID();
		
		// 내가 찜한 게시판 리스트
		List<HashMap<String, UsrVO>> myRecoBoard = usrService.myRecoBoard(usrID);
		
		model.addAttribute("myRecoBoard", myRecoBoard);
		
		return "myPage/bookMark";
	}
	// ==================================================================================
	
	// myPage DIY코스(나만의 여행지 만들기)
	// ====================================================================================
	@RequestMapping(value="bookMarkKoravel.do", method=RequestMethod.GET)
	public String myRecoRegion(@RequestParam(required = false)String usrID, HttpSession session, Model model) throws Exception{
		
		UsrVO vo = (UsrVO)session.getAttribute("usrNick");
		usrID = vo.getUsrID();
		
		// 내가 찜한 여행지
		List<HashMap<String, UsrVO>> myRecoRegion = usrService.myRecoRegion(usrID);
		
		model.addAttribute("myRecoRegion", myRecoRegion);
		
		return "myPage/bookMarkKoravel";
	}
	
	// 나만의 여행지 제거하기
	@RequestMapping(value="deleteBkKoravel.do")
	public String deleteBkkoravel(RecoVO vo) throws Exception{
		
		usrService.deleteMyBoardKoravel(vo);
		return "redirect:myPage.do";
		
	}
}
