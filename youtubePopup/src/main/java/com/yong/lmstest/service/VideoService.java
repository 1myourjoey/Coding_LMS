package com.yong.lmstest.service;

import com.yong.lmstest.model.videoDto;
import com.yong.lmstest.repository.VideoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VideoService {
    @Autowired
    private VideoMapper videoMapper;

    public void saveVideo(videoDto contentsmanageDto) {
        videoMapper.saveVideo(contentsmanageDto);
    }
    public List<videoDto> findAllVideos() {
        return videoMapper.findAllVideos();
    }
}
