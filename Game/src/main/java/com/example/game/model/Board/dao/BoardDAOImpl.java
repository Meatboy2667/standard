package com.example.game.model.Board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.game.model.Board.dto.BoardDTO;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO{
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void insertBoard(BoardDTO dto) throws Exception {
		sqlSession.insert("board.insert", dto);
	}
	
	@Override
	public void updateBoard(BoardDTO dto) throws Exception {
		sqlSession.update("board.update", dto);
	}
	
	@Override
	public void deleteBoard(int seq) throws Exception {
		sqlSession.delete("board.delete", seq);
	}
	
	@Override
	public BoardDTO getBoard(int seq) throws Exception {
		return sqlSession.selectOne("board.getBoard", seq);
	}
	
	@Override
	public List<BoardDTO> getBoardList(int start, int end, String searchOption, String keyword) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		//between #{start}, #{end}에 입력될 값을 맵에 저장
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("board.getBoardList", map);
	}
	
	@Override
	public void increaseCnt(int seq) throws Exception {
		sqlSession.update("board.increaseCnt", seq);
	}
	
	@Override
	public int count(String searchOption, String keyword) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectOne("board.count", map);
	}
	
	@Override
	public void addAttach(String fullName) throws Exception{
		sqlSession.insert("board.addAttach", fullName);
	}
}
