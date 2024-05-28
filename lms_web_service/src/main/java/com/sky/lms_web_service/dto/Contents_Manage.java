package com.sky.lms_web_service.dto;


import lombok.*;





@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Contents_Manage {
    String conName;
    String conNum;
    String lecNum;
    String conPlayTime;
    String durationTime;
    String description;
    String lecName;
    String thumbUrl;
    String videoId;
    double progress;
}
