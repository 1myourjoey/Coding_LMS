package com.sky.lms_web_service.controller;

import com.sky.lms_web_service.service.SugangRegisterService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
public class SugangRegisterController {

    private final SugangRegisterService sugangRegisterService;

    @RequestMapping(value = "/registerLecture", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String registerLecture(@RequestParam int userNo, @RequestParam String lecNum) {
        try {
            sugangRegisterService.registerLecture(userNo, lecNum); // 수강 신청 처리
            return "success"; // 성공적으로 처리된 경우 "success" 반환
        } catch (Exception e) {
            return e.getMessage(); // 실패한 경우 "fail" 반환
        }
    }
}
