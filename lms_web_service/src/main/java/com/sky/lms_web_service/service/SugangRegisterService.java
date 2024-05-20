package com.sky.lms_web_service.service;


import com.sky.lms_web_service.dto.SugangRegister;
import com.sky.lms_web_service.mapper.SugangRegisterMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class SugangRegisterService {
    private final SugangRegisterMapper sugangRegisterMapper;

public void registerLecture(int userNo, String lecNum) {
    // 이미 수강 신청한 강좌인지 확인하는 거
    if (sugangRegisterMapper.checkRegistered(userNo, lecNum) > 0) {
        throw new RuntimeException("이미 수강 신청한 항목입니다.");
    }
    // 수강 신청 처리하는 코드
    SugangRegister sugangRegister = new SugangRegister();
    sugangRegister.setUserNo(userNo);
    sugangRegister.setLecNum(lecNum);
    sugangRegisterMapper.insertSugangRegister(sugangRegister);
}

    }

