package com.model2.mvc.service.domain;

import java.sql.Date;

public class Room {

	private int roomNo;
	private String userId;
	private Date regDate;

	public Room() {
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "Room [roomNo=" + roomNo + ", userId=" + userId + ", regDate=" + regDate + "]";
	}

}
