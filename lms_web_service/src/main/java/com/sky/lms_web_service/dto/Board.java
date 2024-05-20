package com.sky.lms_web_service.dto;

import lombok.*;

import java.sql.Timestamp;
import java.util.List;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class Board {

	private int boardIdx;

	private int userNo;

	private String title;

	private String contents;

	private int hitCnt;

	private Timestamp createdDatetime;

	private Timestamp updatedDatetime;

	private List<BoardFile> fileList;

}
