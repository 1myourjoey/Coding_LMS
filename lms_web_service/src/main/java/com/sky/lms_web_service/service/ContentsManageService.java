package com.sky.lms_web_service.service;

import com.sky.lms_web_service.dto.Contents_Manage;
import com.sky.lms_web_service.mapper.LectureMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ContentsManageService {
    private final LectureMapper lectureMapper;
    public List<Contents_Manage> getContentsByLecNum(String lecNum) {
        return lectureMapper.getContentsByLecNum(lecNum);
    }
}
