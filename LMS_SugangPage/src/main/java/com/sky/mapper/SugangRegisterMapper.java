package com.sky.mapper;

import com.sky.dto.SugangRegister;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SugangRegisterMapper {
    void insertSugangRegister(SugangRegister sugangRegister);
    int checkRegistered(int userNo, String lecNum);

}
