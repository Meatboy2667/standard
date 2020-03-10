package com.example.game.model.reply.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.game.model.reply.dto.ReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ReplyDTO> list(Integer seq,int start, int end) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq", seq);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("reply.listReply", map);
	}
	
	@Override
	public void insert(ReplyDTO dto) throws Exception {
		sqlSession.insert("reply.insertReply", dto);
	}
	
	@Override
	public void update(ReplyDTO dto) throws Exception {
		
	}
	
	@Override
	public void delete(Integer seq) throws Exception {
		
	}
	
	@Override
	public int count(int seq) throws Exception {
		return sqlSession.selectOne("reply.countReply", seq);
	}
	
}
