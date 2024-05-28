package com.sky.lms_web_service.service;


import com.sky.lms_web_service.dto.Section_Progress;
import com.sky.lms_web_service.mapper.ProgressMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProgressService {

	@Autowired
	private ProgressMapper progressMapper;

	public void saveVideoProgress(Section_Progress sectionProgress){
		progressMapper.saveVideoProgress(sectionProgress);
	}


	public String getPreviousLearningTime(int userNo, String conNum) {
		return progressMapper.selectPreviousLearningTime(userNo, conNum);
	}

}
