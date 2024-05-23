package com.sky.lms_web_service.service;

import com.sky.lms_web_service.dto.Post;
import com.sky.lms_web_service.dto.Qna;
import com.sky.lms_web_service.mapper.QnaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QnaService {

	@Autowired
	private QnaMapper qnaMapper;


	public List<Qna> selectQnaList() throws Exception {
		return qnaMapper.selectQnaList();
	}

	public void insertQna(Qna qna) throws Exception {
		qnaMapper.insertQna(qna);
	}

	public List<Qna> selectQnaDetail(int qNum) throws Exception {
		qnaMapper.updateHitCount(qNum);
		return qnaMapper.selectQnaDetail(qNum);
	}
	public void updateQna(Qna qna) throws Exception {
		qnaMapper.updateQna(qna);
	}
	public void deleteQna(int qNum) throws Exception {
		qnaMapper.deleteQna(qNum);
	}




	public List<Qna> getPaginatedPost(int offset, int itemsPerPage){
		return qnaMapper.findPage(offset,itemsPerPage);
	}

	public int getTotal() {

		return qnaMapper.countTotal();
	}
}
