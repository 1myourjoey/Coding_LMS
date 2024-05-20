package com.yong.lmstest.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class videoDto {
    private String conNum;
    private String conName;
    private String conDesc;
    private String videoId;
    private String conPlayTime;
    private String lecName;
    private String thumbUrl;
}
