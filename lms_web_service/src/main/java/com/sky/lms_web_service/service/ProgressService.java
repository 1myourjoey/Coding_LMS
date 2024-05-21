package com.sky.lms_web_service.service;


import com.sky.lms_web_service.dto.Section_Progress;
import com.sky.lms_web_service.mapper.ProgressMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class ProgressService {

	@Autowired
	private ProgressMapper progressMapper;

	public void saveVideoProgress(Section_Progress sectionProgress) {
		progressMapper.saveVideoProgress(sectionProgress);
	}

	public Map<String, Object> getVideoProgress(String conNum) {
		return progressMapper.getVideoProgress(conNum);
	}
}
