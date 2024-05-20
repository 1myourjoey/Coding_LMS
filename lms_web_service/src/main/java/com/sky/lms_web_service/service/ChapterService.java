package com.sky.lms_web_service.service;

import com.sky.lms_web_service.dto.Chapter;
import com.sky.lms_web_service.mapper.ChapterMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChapterService {
    @Autowired
    private ChapterMapper chapterMapper;

    public List<Chapter> findAllChapters() {
       return chapterMapper.findAllChapters();
    }

    public void saveChapter(Chapter chapter, String conNum) {
        chapter.setConNum(conNum);
        chapterMapper.saveChapter(chapter, conNum);
    }
}
