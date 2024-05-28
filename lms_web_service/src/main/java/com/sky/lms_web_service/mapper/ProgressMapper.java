package com.sky.lms_web_service.mapper;


import com.sky.lms_web_service.dto.Section_Progress;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface ProgressMapper {
    void saveVideoProgress(Section_Progress sectionProgress);
    String selectPreviousLearningTime(int userNo, String conNum);
}
