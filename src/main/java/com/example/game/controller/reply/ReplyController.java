package com.example.game.controller.reply;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.game.model.reply.dto.ReplyDTO;
import com.example.game.service.reply.ReplyPager;
import com.example.game.service.reply.ReplyService;

//REST : Representational State Transfer
//하나의 URI가 하나의 고유한 리소스를 대표하도록 설계된 개념

// http://localhost/game/list?seq==1 ==> url+파라미터
// http://localhost/game/list/1 ==> url
// RestController는 스프링4.0부터 지원
// @Controller, @RestController 차이점은 메소드가 정료되면 화면전환의 유무
@RestController
@RequestMapping("reply/*")
public class ReplyController {
	
	@Inject
	ReplyService replyService;
	
	//댓글 입력
	@RequestMapping("insert.do")
	public void insert(@ModelAttribute ReplyDTO dto, HttpSession session) throws Exception {
		String userid = (String) session.getAttribute("userid");
		dto.setReplyer(userid);
		replyService.insert(dto);
	}
	
	//댓글 목록(@Controller방식 : view(화면)을 리턴)
	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam int seq, 
							 @RequestParam(defaultValue="1") int curPage, ModelAndView mav,
							 HttpSession session) throws Exception {
		int count = replyService.count(seq); //댓글 개수
		ReplyPager replyPager = new ReplyPager(count,curPage);
		int start = replyPager.getPageBegin();
		int end = replyPager.getPageEnd();
		List<ReplyDTO> list = replyService.list(seq,start,end,session);
		mav.setViewName("board/replyList");
		mav.addObject("list", list);
		mav.addObject("replyPager",replyPager);
		return mav; // 포워딩
	}
	
	//댓글 목록 (@RestController Json방식으로 처리 : 데이터를 리턴)
	/*
	@RequestMapping("listJson.do")
	@ResponseBody //리턴데이터를 json으로 변환(생략가능)
	public List<ReplyDTO> listJson(@RequestParam int seq) throws Exception {
		List<ReplyDTO> list = replyService.list(seq);
		return list;
	}*/

}
