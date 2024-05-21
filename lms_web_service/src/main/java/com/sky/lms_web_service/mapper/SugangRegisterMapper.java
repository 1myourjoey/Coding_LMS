package com.sky.lms_web_service.mapper;

import com.sky.lms_web_service.dto.SugangRegister;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SugangRegisterMapper {
    void insertSugangRegister(SugangRegister sugangRegister);
    int checkRegistered(int userNo, String lecNum);

}
