package com.example.game.service.reply;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.game.model.reply.dao.ReplyDAO;
import com.example.game.model.reply.dto.ReplyDTO;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	ReplyDAO replyDao;
	
	@Override
	public List<ReplyDTO> list(Integer seq, int start, int end, HttpSession session) throws Exception{
		List<ReplyDTO> items = replyDao.list(seq,start,end);
		return items;
	}
	
	@Override
	public void insert(ReplyDTO dto) throws Exception {
		replyDao.insert(dto);
	}
	
	@Override
	public void update(ReplyDTO dto) throws Exception {
		
	}
	
	@Override
	public void delete(Integer seq) throws Exception {
		
	}
	
	@Override
	public int count(int seq) throws Exception {
		return replyDao.count(seq);
	}
}
