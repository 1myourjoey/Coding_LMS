package com.sky.lms_web_service.dto;

import lombok.*;

import java.sql.Time;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Chapter {
    private int serealNum;
    private String conNum;
    private String chapName;
    private Time chapStartTime;
}