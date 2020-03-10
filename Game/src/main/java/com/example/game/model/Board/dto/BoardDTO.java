package com.example.game.model.Board.dto;

import java.util.Arrays;
import java.util.Date;

public class BoardDTO {
	private int seq; //게시물번호
	private String title; //제목
	private String writer; //작성자
	private String content; //내용
	private Date regDate; //등록일(수정일)
	private int viewcnt; //조회수
	private String name; //이름 = 게시글 작성자
	private int cnt; //댓글 개수
	private int recnt; //게시글 댓글의 수 추가
	private String show; //화면 표시여부
	private String[] files; //첨부파일
	
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getRecnt() {
		return recnt;
	}
	public void setRecnt(int recnt) {
		this.recnt = recnt;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	@Override
	public String toString() {
		return "BoardDTO [seq=" + seq + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", regDate=" + regDate + ", viewcnt=" + viewcnt + ", name=" + name + ", cnt=" + cnt + ", recnt="
				+ recnt + ", show=" + show + ", files=" + Arrays.toString(files) + "]";
	}
	
}
