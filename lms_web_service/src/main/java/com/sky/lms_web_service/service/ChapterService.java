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

    public List<Chapter> findAllChapters(String conNum) {
       return chapterMapper.findAllChapters(conNum);
    }

    public Chapter selectChapter(String chapNum){
        return chapterMapper.selectChapter(chapNum);
    }

    public List<Chapter> selectChapterByConNum(String conNum){
        return chapterMapper.selectChapterByConNum(conNum);
    }

    public void insertOrUpdateChapter(Chapter chapter){
        Chapter existingContent = chapterMapper.getContentByNum(chapter.getChapNum());

        if (existingContent != null) {
            chapterMapper.updateChapter(chapter);
        }
        else {
            chapterMapper.saveChapter(chapter);
        }
    }

    public void saveChapter(Chapter chapter) {
        chapterMapper.saveChapter(chapter);
    }
    public void updateChapter(Chapter chapter){
        chapterMapper.updateChapter(chapter);
    }
    public void deleteChapter(String chapNum){
        chapterMapper.deleteChapter(chapNum);
    }
}
