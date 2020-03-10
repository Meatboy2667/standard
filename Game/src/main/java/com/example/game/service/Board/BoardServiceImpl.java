package com.example.game.service.Board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.game.model.Board.dao.BoardDAOImpl;
import com.example.game.model.Board.dto.BoardDTO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	@Inject
	private BoardDAOImpl boardDAOImpl;
	
	@Transactional //트랜잭션 처리 메소드로 설정
	@Override
	public void insertBoard(BoardDTO dto) throws Exception {
		String title = dto.getTitle();
		String content = dto.getContent();
		String writer = dto.getWriter();
		//태그문자 처리 (< ==> &lt; > ==> &gt;)
		//replace(A, B) A를  B로 변경
		title = title.replace("<", "&lt;");
		title = title.replace(">", "&gt;");
		writer = writer.replace("<", "&lt;");
		writer = writer.replace(">", "&gt;");
		//공백문자 처리
		title = title.replace("  ", "&nbsp;&nbsp;");
		writer = writer.replace("  ", "&nbsp;&nbsp;");
		//줄바꿈 문자처리
		content = content.replace("\n", "<br>");
		dto.setTitle(title);
		dto.setWriter(writer);
		dto.setContent(content);
		boardDAOImpl.insertBoard(dto);
		//게시물의 첨부파일 정보 등록
		String[] files = dto.getFiles(); //첨부파일 배열
		if(files == null) return; //첨부파일이 없으면 메소드 종료
		//첨부파일들의 정보를 attach테이블에 insert
		for(String name : files) {
			boardDAOImpl.addAttach(name);
		}
	}
	
	@Override
	public void updateBoard(BoardDTO dto) throws Exception {
		boardDAOImpl.updateBoard(dto);
	}
	
	@Override
	public void deleteBoard(int seq) throws Exception {
		boardDAOImpl.deleteBoard(seq);
	}
	
	@Override
	public BoardDTO getBoard(int seq) throws Exception {
		return boardDAOImpl.getBoard(seq);
	}
	
	@Override
	public List<BoardDTO> getBoardList(int start, int end, String searchOption, String keyword) throws Exception{
		return boardDAOImpl.getBoardList(start, end, searchOption, keyword);
	}
	
	@Override
	public void increaseCnt(int seq, HttpSession session) throws Exception {
		long update_time = 0;
		//세션에 저장된 조회시간 검색
		//최초로 조회할 경우 세션에 저장된 값이 없기 때문에 if문은 실행되지않는다
		if(session.getAttribute("update_time_"+seq) != null) {
			update_time = (long)session.getAttribute("update_time_"+seq);
		}
		//시스템의 현재시간을 current_time에 저장
		long current_time = System.currentTimeMillis();
		//일정시간이 경과 후 조회수 증가 처리 24*60*60*1000(24시간)
		//시스템의현재시간 - 열람시간 > 일정시간(조회수 증가가 가능하도록 지정한 시간)
		if(current_time - update_time > 5*1000) {
			boardDAOImpl.increaseCnt(seq);
			//세션에 시간을 저장 : "update_time_"+seq는 다른변수와 중복되지않게 명명한것
			session.setAttribute("update_time_"+seq, current_time);
		}
	}
	
	@Override
	public int count(String searchOption, String keyword) throws Exception {
		return boardDAOImpl.count(searchOption, keyword);
	}
}
