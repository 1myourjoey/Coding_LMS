package com.yong.lmstest.repository;

import com.yong.lmstest.model.videoDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface VideoMapper {
    List<videoDto> findAllVideos();
    void saveVideo(videoDto contentsmanageDto);
}

