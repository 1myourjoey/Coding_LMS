package com.sky.mapper;

import com.sky.dto.Contents_Manage;
import com.sky.dto.Lecture_Info;
import com.sky.dto.SugangRegWithDetails;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface LectureMapper {

    List<Contents_Manage> getContentsByLecNum(String lecNum);
    List<SugangRegWithDetails> getSugangRegWithDetails();

    List<SugangRegWithDetails> getSugangRegWithDetailsByUserNo(int userNo);

    List<Lecture_Info> selectAllLectures();




}
