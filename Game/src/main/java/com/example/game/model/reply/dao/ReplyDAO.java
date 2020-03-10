package com.example.game.model.reply.dao;

import java.util.List;

import com.example.game.model.reply.dto.ReplyDTO;

public interface ReplyDAO {
	public List<ReplyDTO> list(Integer seq,int start, int end) throws Exception;
	public void insert(ReplyDTO dto) throws Exception;
	public void update(ReplyDTO dto) throws Exception;
	public void delete(Integer seq) throws Exception;
	public int count(int seq) throws Exception;
}
