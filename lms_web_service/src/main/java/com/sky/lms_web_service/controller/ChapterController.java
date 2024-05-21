package com.sky.lms_web_service.controller;

import com.sky.lms_web_service.dto.Chapter;
import com.sky.lms_web_service.service.ChapterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ChapterController {

    @Autowired
    private ChapterService chapterService;

    @PostMapping("/saveChapter")
    public void saveChapter(Chapter chapter){
        chapterService.saveChapter(chapter);
    }
}
