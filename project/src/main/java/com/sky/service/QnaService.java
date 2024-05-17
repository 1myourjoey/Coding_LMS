package com.sky.service;

import com.sky.dto.QnaDto;

import java.util.List;

public interface QnaService {

	List<QnaDto> selectQnaList() throws Exception;

	void insertQna(QnaDto qnaDto) throws Exception;

	List<QnaDto> selectQnaDetail(int qNum) throws Exception;

	void updateQna(QnaDto qnaDto) throws Exception;

	void deleteQna(int qNum) throws Exception;

}
