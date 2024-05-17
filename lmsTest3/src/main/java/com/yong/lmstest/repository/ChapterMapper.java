package com.yong.lmstest.repository;

import com.yong.lmstest.model.ChapterDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ChapterMapper {

    List<ChapterDto> findAllChapters();
    void saveChapter(@Param("chapDto") ChapterDto chapterDto, String conNum);
}