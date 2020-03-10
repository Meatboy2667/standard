package com.example.game.service.reply;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.game.model.reply.dto.ReplyDTO;

public interface ReplyService {
	public List<ReplyDTO> list(Integer seq,int start, int end,HttpSession session) throws Exception;
	public void insert(ReplyDTO dto) throws Exception;
	public void update(ReplyDTO dto) throws Exception;
	public void delete(Integer seq) throws Exception;
	public int count(int seq) throws Exception;
}
