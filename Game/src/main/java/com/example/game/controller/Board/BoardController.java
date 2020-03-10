package com.example.game.controller.Board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.game.model.Board.dto.BoardDTO;
import com.example.game.service.Board.BoardService;
import com.example.game.service.Board.Pager;

@Controller
@RequestMapping("board/*")
public class BoardController {
	
	@Inject
	BoardService boardService;
	
	@RequestMapping("write.do")
	public String write() {
		return "board/write";
	}
	
	 @RequestMapping("list.do") 
	 public ModelAndView boardList(@RequestParam(defaultValue="title") String searchOption,
			 @RequestParam(defaultValue="") String keyword, @RequestParam(defaultValue="1") int curPage) throws Exception{
		 //레코드의 개수
		 int count = boardService.count(searchOption, keyword);
		 //페이지 나누기 관련 처리
		 Pager pager = new Pager(count, curPage);
		 int start = pager.getPageBegin();
		 int end = pager.getPageEnd();
		 
		 List<BoardDTO> list = boardService.getBoardList(start, end, searchOption, keyword);
		 
//		 mav.addObject("list", list); // 데이터를 저장
//		 mav.addObject("count", count);
//		 mav.addObject("searchOption", searchOption);
//		 mav.addObject("keyword", keyword);
		 //데이터를 맵에 저장
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("list", list); //list
		 map.put("count", count); //레코드개수
		 map.put("searchOption", searchOption); //검색옵션
		 map.put("keyword", keyword);	//검색 키워드
		 map.put("Pager", pager);
		 
		 //ModelAndView => map에 키핑전에 mav선언을 먼저 하게되면 오류가 날 수 있다.
		 ModelAndView mav = new ModelAndView();
		 mav.addObject("map", map); //맵에 저장된 데이터를 mav에 저장
		 mav.setViewName("board/list"); //뷰를 list.jsp로 설정
		 //model.addAttribute("list",list);
		 return mav;
	 }
	
	@RequestMapping("insertBoard.do")
	public String insertBoard(@ModelAttribute BoardDTO dto, HttpSession session) throws Exception {
		String writer = (String)session.getAttribute("userid");
		dto.setWriter(writer);
		boardService.insertBoard(dto);
		return "redirect:/board/list.do";
	}
	
//	@RequestMapping("list.do") 
//	public String boardList(Model model) throws Exception {
//		model.addAttribute("list", boardService.getBoardList());
//		return "board/list";
//	}
	
	@RequestMapping("getBoard.do")
	public ModelAndView getBoard(@RequestParam int seq, HttpSession session) throws Exception{
		boardService.increaseCnt(seq, session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/getBoard");
		mav.addObject("dto", boardService.getBoard(seq));
		return mav;
	}
	
	@RequestMapping("updateBoard.do")
	public String updateBoard(BoardDTO dto) throws Exception {
		boardService.updateBoard(dto);
		return "redirect:/board/list.do";
	}
	
	@RequestMapping("deleteBoard.do")
	public String deleteBoard(int seq) throws Exception{
		boardService.deleteBoard(seq);
		return "redirect:/board/list.do";
	}
	
	@RequestMapping("updateView.do")
	public String updateView(BoardDTO dto, Model model) throws Exception {
		model.addAttribute("update", boardService.getBoard(dto.getSeq()));
		return "board/update";
	}
	
}
