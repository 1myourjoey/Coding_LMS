package com.sky.lms_web_service.controller;

import com.sky.lms_web_service.dto.Chapter;
import com.sky.lms_web_service.service.ChapterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ChapterController {

    @Autowired
    private ChapterService chapterService;

    @PostMapping("/saveChapter")
    public String saveChapter(Chapter chapter){
        chapterService.insertOrUpdateChapter(chapter);
        return "redirect:/content";
    }

    @PostMapping("updateChapter")
    public void updateChapter(Chapter chapter){
        chapterService.updateChapter(chapter);
    }
    @PostMapping("deleteChapter")
    public String deleteChapter(String chapNum){
        chapterService.deleteChapter(chapNum);
        return "redirect:/content";
    }

    @PostMapping("selectOneChapter")
    @ResponseBody
    public Chapter selectOneChapter(@RequestParam("chapNum") String chapNum){
        return chapterService.selectChapter(chapNum);
    }

    @PostMapping("selectChapter")
    @ResponseBody
    public List<Chapter> selectChapter(String conNum){
        return chapterService.findAllChapters(conNum);
    }



}
