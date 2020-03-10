package com.example.game.model.Board.dao;

import java.util.List;

import com.example.game.model.Board.dto.BoardDTO;

public interface BoardDAO {
	public void insertBoard(BoardDTO dto) throws Exception;
	public void updateBoard(BoardDTO dto) throws Exception;
	public void deleteBoard(int seq) throws Exception;
	public BoardDTO getBoard(int seq) throws Exception;
	public List<BoardDTO> getBoardList(int start, int end, String searchOption, String keyword) throws Exception;
	public void increaseCnt(int seq) throws Exception;
	public int count(String searchOption, String keyword) throws Exception;
	public void addAttach(String fullName) throws Exception;
}
