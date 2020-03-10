package com.example.game.model.reply.dto;

import java.util.Date;

public class ReplyDTO {
	private Integer rno;
	private Integer seq;
	private String replytext;
	private String replyer;
	private String name;
	private Date regDate;
	private Date updateDate;
	private String writer;


	public Integer getRno() {
		return rno;
	}
	public void setRno(Integer rno) {
		this.rno = rno;
	}
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	@Override
	public String toString() {
		return "ReplyDTO [rno=" + rno + ", seq=" + seq + ", replytext=" + replytext + ", replyer=" + replyer + ", name="
				+ name + ", regDate=" + regDate + ", updateDate=" + updateDate + ", writer=" + writer + "]";
	}
	
}
