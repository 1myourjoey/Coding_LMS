package com.sky.lms_web_service.dto;

import lombok.Data;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Data
@RequiredArgsConstructor
@Setter
@Getter
public class SugangRegWithDetails {
    private int id;
    private String lecNum;
    private String userNo;
    private String lecSubDate;
    private String lecName;
    private String userName;
    private String lecStartDate;
    private String lecEndDate;
    private String lecEx;

}
