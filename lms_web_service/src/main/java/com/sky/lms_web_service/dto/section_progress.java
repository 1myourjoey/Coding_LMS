package com.sky.lms_web_service.dto;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class section_progress {
    String conNum;
    String lecNum;
    int userNo;
    String learningTime;
    String fnlS;
    String maxS;
}
