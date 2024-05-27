package com.sky.lms_web_service.mapper;

import com.sky.lms_web_service.dto.Chapter;
import com.sky.lms_web_service.dto.Contents_Manage;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ChapterMapper {

    List<Chapter> findAllChapters(String conNum);
    void saveChapter(Chapter chapter);
    void updateChapter(Chapter chapter);
    void deleteChapter(String chapNum);
    Chapter selectChapter(String chapNum);
    Chapter getContentByNum(String chapNum);
    List<Chapter> selectChapterByConNum(String conNum);

}