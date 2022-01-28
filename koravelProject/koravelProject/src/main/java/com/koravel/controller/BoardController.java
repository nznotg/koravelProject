package com.koravel.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.concurrent.ExecutionException;

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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.koravel.domain.BoardVO;
import com.koravel.domain.RecoVO;
import com.koravel.domain.RegionVO;
import com.koravel.domain.UsrVO;
import com.koravel.service.BoardService;
import com.koravel.service.RecoService;
import com.koravel.service.RegionService;
import com.koravel.transport.Region;

@SessionAttributes("usrNick")
@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private RecoService recoService;
	
	@Autowired
	private Region tranregion;
	
	@Autowired
	private RegionService regionService;
	
	private int pageNum = 0;
	private String pageSet, boardCatNow, boardCatP;
	
	@RequestMapping("{step}.do")
	public String viewPage(@PathVariable String step) {
		return "/board/" + step;
	}
	
	// 글 목록 검색
	@RequestMapping("/getBoardList.do")
	public void getBoardList(BoardVO vo, Model model) {
		
		//페이징 (카테고리)
		vo.setPageDB(0);
		pageSet = vo.getPageSet();
		boardCatP = vo.getBoardCatP();
		
		//페이지 처음 열때 total로 초기화
		if(boardCatNow == null) {
			boardCatNow = "total";
		}
		if(boardCatP == null) {
			boardCatP = "total";
			vo.setBoardCatP(boardCatP);
		}
		
		if(!boardCatNow.equals(boardCatP)) {
			pageNum = 0;
			boardCatNow = boardCatP;
			System.out.println("change: " + boardCatNow);
		}
		else {
			System.out.println("noChange: " + boardCatNow);
		}
		
		//페이지 처음 열때, 카테고리 변경 시
		if(pageSet == null) {
			List<BoardVO> list = boardService.getBoardList(vo);
			model.addAttribute("boardList", list);
			model.addAttribute("boardCatNow", boardCatNow);
			return;
		}
		
		//페이징 (이전, 다음 페이지)
		if(pageSet.equals("prePage")) {
			pageNum -= 1;
		}
		else if(pageSet.equals("nextPage")) {
			pageNum += 1;
		}
		else if(pageSet==null){
			pageNum = 0;
		} else {
			System.out.println("else: " + pageSet);
		}
		
		//현재 페이지 번호 확인
		System.out.println(pageNum);
		
		vo.setPageNum(pageNum);
		vo.setPageDB(pageNum * 19);
		
		List<BoardVO> list = boardService.getBoardList(vo);
		model.addAttribute("boardList", list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("boardCatNow", boardCatNow);
	}
	
	// 글 목록 메인
	@RequestMapping("/getBoardMain.do")
	public void getBoardMain(BoardVO vo, Model model) {
		//카테고리 초기화
		vo.setBoardCatP(null);
		List<BoardVO> list = boardService.getBoardMain(vo);
		
		vo.setBoardCatP("free");
		List<BoardVO> listF = boardService.getBoardMain(vo);
		
		vo.setBoardCatP("region");
		List<BoardVO> listR = boardService.getBoardMain(vo);
		
		vo.setBoardCatP("course");
		List<BoardVO> listC = boardService.getBoardMain(vo);
		
		model.addAttribute("boardList", list);
		model.addAttribute("boardListF", listF);
		model.addAttribute("boardListR", listR);
		model.addAttribute("boardListC", listC);
	}

	// 글 등록
	@RequestMapping(value = "/saveBoard.do")
	public String insertBoard(BoardVO vo) {
		boardService.insertBoard(vo);
		return "redirect:/board/getBoardList.do";
	} 

	// 글 수정 호출
	@RequestMapping("/updateBoard.do")
	public String updateBoard(BoardVO vo) {
		boardService.updateBoard(vo);
		return "redirect:/board/getBoardList.do";
	}
	
	// 글 수정 페이지
	@RequestMapping("/updatePage.do")
	public void updatePage(BoardVO vo, Model m) {
		BoardVO result = boardService.getBoard(vo);
		m.addAttribute("board", result);
	}

	// 글 상세 조회
	@RequestMapping("/getBoard.do")
	public void getBoard(@ModelAttribute("usrNick") UsrVO usr,BoardVO vo, Model m, HttpServletRequest request) throws IOException, ExecutionException, InterruptedException {
		/* UsrVO usrID = new UsrVO(); */
		List<RegionVO> courseToRegion;
		
		HttpSession session = request.getSession();
		
		session.setAttribute("usrNick", usr.getUsrID());
		String readerID =  (String) session.getAttribute("usrNick");
	
		vo.setReaderID(readerID);
		BoardVO result = boardService.getBoard(vo);
		result.setReaderID(readerID);
		int recoTF = 0;
		
		if (readerID != null) {
			
			HashMap <String, Object> hashMap = new HashMap<String, Object>();
		    hashMap.put("searchRecoIdx", result.getBoardIdx());
			hashMap.put("readerID", readerID);
			
			recoTF = recoService.checkReco(hashMap);
			
			//유저별 첫 북마크 클릭 시 로우 생성
			if( recoTF == 0) {
				recoService.recoInsert(hashMap);
				recoTF += 1;
			}
		}
		
		
		if (result.getBoardCourse() != null) {
			String regionSL = result.getBoardCourse();
			List<String> regionNameL = Arrays.asList(regionSL.split(","));
			System.out.println("regionNameL여기"+regionNameL);
			int i = 1;
			List<RegionVO> regionvolist = new ArrayList<>();
			for(String regionName:regionNameL) {
				RegionVO regionvo = tranregion.searchName(regionName,"regionname");
				regionvolist.add(regionvo);
			}
			
			System.out.println(regionvolist);
			m.addAttribute("regionvolist", regionvolist);
			m.addAttribute("regionSL", regionSL);
		}
	  result.setReaderID(readerID); m.addAttribute("recoTF", recoTF);
	  m.addAttribute("board", result);
	}

	// 글 삭제
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo) {
		boardService.deleteBoard(vo);
		return "redirect:/board/getBoardList.do";
	}
	
	// 북마크
	@ResponseBody
	@RequestMapping(value="/findReco.do", method=RequestMethod.GET, produces="application/text; charset=UTF-8")
	public String reco(@ModelAttribute("usrNick") UsrVO usr, int searchRecoIdx, RecoVO vo, HttpServletRequest request){
		System.out.println(searchRecoIdx);
		HttpSession session = request.getSession();
		
		session.setAttribute("usrNick", usr.getUsrID());
		String readerID =  (String) session.getAttribute("usrNick");
		
		JSONObject obj = new JSONObject();
		
		System.out.println("세션 정보 : " + readerID);
		ArrayList<String> msgs = new ArrayList<String>();
		HashMap <String, Object> hashMap = new HashMap<String, Object>();
	    hashMap.put("searchRecoIdx", searchRecoIdx);
		hashMap.put("readerID", readerID);
		
		RecoVO recoVO = recoService.findReco(hashMap);
		
		BoardVO boardVO = boardService.getBoardForReco(searchRecoIdx);
		int boardReco = boardVO.getBoardReco();     //게시판의 좋아요 카운트
		int checkRecoTF = 0;
		checkRecoTF = recoVO.getCheckRecoTF();  //좋아요 체크 값
		
		if(checkRecoTF == 0) {
			msgs.add("Like!");
			recoService.bookmark_check(hashMap);
			checkRecoTF += 1;
			boardReco += 1;
			boardService.boardRecoUp(searchRecoIdx);   //좋아요 갯수 증가
			
			obj.put("searchRecoIdx", recoVO.getBoardIdx());
		    obj.put("checkRecoTF", checkRecoTF);
		    obj.put("boardReco", boardReco);
		    
			return obj.toJSONString();
		} else {
			msgs.add("unLike!");
			recoService.bookmark_check_cancel(hashMap);
			checkRecoTF -= 1;
			boardReco -= 1;
			boardService.boardRecoDown(searchRecoIdx);   //좋아요 갯수 감소
			
			obj.put("searchRecoIdx", recoVO.getBoardIdx());
		    obj.put("checkRecoTF", checkRecoTF);
		    obj.put("boardReco", boardReco);
		    
			return obj.toJSONString();
		}
	}
	@RequestMapping("/boardCatChange.do")
	public String boardCatChange(String boardCat) {
		return boardCat;
	}
}
