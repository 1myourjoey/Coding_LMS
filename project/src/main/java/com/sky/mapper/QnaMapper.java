package com.sky.mapper;

import com.sky.dto.BoardFileDto;
import com.sky.dto.QnaDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface QnaMapper {
	List<QnaDto> selectQnaList() throws Exception;

	void insertQna(QnaDto qnaDto) throws Exception;

	List<QnaDto> selectQnaDetail(int qNum) throws Exception;

	void updateHitCount(int qNum) throws Exception;

	void updateQna(QnaDto qnaDto) throws Exception;

	void deleteQna(int qNum) throws Exception;



}
