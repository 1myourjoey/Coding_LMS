package com.sky.sugangController;

import com.sky.dto.User;
import com.sky.dto.SugangRegister;
import com.sky.service.SugangRegisterService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

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
