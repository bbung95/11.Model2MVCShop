package com.model2.mvc.service.domain;

import java.sql.Date;

public class Board {
	
	private String userId;
	private String boardDetail;
	private String boardName;
	private int boardNo;
	private Date regDate;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBoardDetail() {
		return boardDetail;
	}
	public void setBoardDetail(String boardDetail) {
		this.boardDetail = boardDetail;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "Board [userId=" + userId + ", boardDetail=" + boardDetail + ", boardName=" + boardName + ", boardNo="
				+ boardNo + ", regDate=" + regDate + "]";
	}
	
	
	
}
