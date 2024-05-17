package com.yong.lmstest.controller;

import com.yong.lmstest.model.ChapterDto;
import com.yong.lmstest.model.videoDto;
import com.yong.lmstest.service.ChapterService;
import com.yong.lmstest.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class MyController {

    @Autowired
    private VideoService videoService;
    @Autowired
    private ChapterService chapterService;

    @GetMapping("/")
    public String Showmain(){
        return "main";
    }

    @GetMapping("/view")
    public String Showview(Model model){
        List<videoDto> videos = videoService.findAllVideos();
        model.addAttribute("videos", videos);

        List<ChapterDto> chapters = chapterService.findAllChapters();
        model.addAttribute("chapters", chapters);
        return "view";
    }

    //챕터등록을 위한 비디오리스트
    @GetMapping("/videoList")
    public String showVideoList(Model model) {
        List<videoDto> videos = videoService.findAllVideos();
        model.addAttribute("videos", videos);
        return "videoList";
    }

    @GetMapping("/insert_video")
    public String showInsertVideoForm(Model model) {
        model.addAttribute("videoDto", new videoDto());
        return "insert_video";
    }

    //video저장
    @PostMapping("/saveVideo")
    public String saveVideo(@ModelAttribute videoDto contentsmanageDto) {
        videoService.saveVideo(contentsmanageDto);
        return "redirect:/";
    }

    @GetMapping("/insert_chap")
    public String showInsertChapterForm(Model model, @RequestParam("conNum") String conNum) {
        model.addAttribute("chapterDto", new ChapterDto());
        model.addAttribute("conNum", conNum);
        return "insert_chap";
    }

    //chapter저장
    @PostMapping("/saveChapter")
    public String saveChapter(ChapterDto chapterDto, @RequestParam("conNum") String conNum) {
        chapterDto.setConNum(conNum);
        chapterDto.setChapStartTime(chapterDto.getChapStartTime());
        chapterService.saveChapter(chapterDto, conNum);
        return "redirect:/";
    }
}
