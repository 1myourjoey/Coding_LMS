package com.sky.service;

import com.sky.dto.Contents_Manage;
import com.sky.mapper.LectureMapper;
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
