package com.sky.lms_web_service.mapper;

import com.sky.lms_web_service.dto.Chapter;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ChapterMapper {

    List<Chapter> findAllChapters();
    void saveChapter(Chapter chapter);
}