package com.sky.service;

import com.sky.dto.Lecture_Info;
import com.sky.dto.SugangRegWithDetails;

import com.sky.mapper.LectureMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class LectureService {


    private final LectureMapper lectureMapper;

    public List<SugangRegWithDetails> getSugangRegWithDetails() {
        return lectureMapper.getSugangRegWithDetails();
    }

    public List<Lecture_Info> getAllLectures() {
        return lectureMapper.selectAllLectures();
    }

    public List<SugangRegWithDetails> getSugangRegWithDetailsByUserNo(int userNo) {
        return lectureMapper.getSugangRegWithDetailsByUserNo(userNo);
    }
}
