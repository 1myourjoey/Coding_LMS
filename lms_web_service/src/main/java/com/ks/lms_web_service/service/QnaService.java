package com.ks.lms_web_service.service;

import com.sky.dto.QnaDto;
import com.sky.mapper.QnaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QnaService implements QnaService {

	@Autowired
	private QnaMapper qnaMapper;


	@Override
	public List<QnaDto> selectQnaList() throws Exception {
		return qnaMapper.selectQnaList();
	}

	@Override
	public void insertQna(QnaDto qnaDto) throws Exception {
		qnaMapper.insertQna(qnaDto);
	}

	@Override
	public List<QnaDto> selectQnaDetail(int qNum) throws Exception {

		qnaMapper.updateHitCount(qNum);
		return qnaMapper.selectQnaDetail(qNum);
	}

	@Override
	public void updateQna(QnaDto qnaDto) throws Exception {
		qnaMapper.updateQna(qnaDto);
	}

	@Override
	public void deleteQna(int qNum) throws Exception {
		qnaMapper.deleteQna(qNum);
	}


}
