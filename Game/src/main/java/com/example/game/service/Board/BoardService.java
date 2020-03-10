package com.example.game.service.Board;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.game.model.Board.dto.BoardDTO;

public interface BoardService {
	public void insertBoard(BoardDTO dto) throws Exception;
	public void updateBoard(BoardDTO dto) throws Exception;
	public void deleteBoard(int seq) throws Exception;
	public BoardDTO getBoard(int seq) throws Exception;
	public List<BoardDTO> getBoardList(int start, int end, String searchOption, String keyword) throws Exception;
	public void increaseCnt(int seq, HttpSession session) throws Exception;
	public int count(String searchOption, String keyword) throws Exception;
}
