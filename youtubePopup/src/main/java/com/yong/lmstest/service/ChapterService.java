package com.yong.lmstest.service;

import com.yong.lmstest.model.ChapterDto;
import com.yong.lmstest.repository.ChapterMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChapterService {
    @Autowired
    private ChapterMapper chapterMapper;

    public List<ChapterDto> findAllChapters() {
       return chapterMapper.findAllChapters();
    }

    public void saveChapter(ChapterDto chapterDto, String conNum) {
        chapterDto.setConNum(conNum);
        chapterMapper.saveChapter(chapterDto, conNum);
    }
}
