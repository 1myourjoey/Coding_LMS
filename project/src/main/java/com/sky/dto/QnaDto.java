package com.sky.dto;

import lombok.*;

import java.sql.Timestamp;




@AllArgsConstructor
@NoArgsConstructor
@ToString
public class QnaDto {

	private int qNum;

	private int userNo;

	private String qnaTitle;

	private String qnaContents;

	private int hitCnt;

	private Timestamp qnaCreated;

	public int getqNum() {
		return qNum;
	}

	public int getUserNo() {
		return userNo;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public String getQnaContents() {
		return qnaContents;
	}

	public int getHitCnt() {
		return hitCnt;
	}

	public Timestamp getQnaCreated() {
		return qnaCreated;
	}

	public void setqNum(int qNum) {
		this.qNum = qNum;
	}

	public void setQnaCreated(Timestamp qnaCreated) {
		this.qnaCreated = qnaCreated;
	}

	public void setQnaContents(String qnaContents) {
		this.qnaContents = qnaContents;
	}

	public void setHitCnt(int hitCnt) {
		this.hitCnt = hitCnt;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
}
