package com.sky.dto;

import lombok.Data;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Data
@RequiredArgsConstructor
@Getter
@Setter

public class Contents_Manage {

    private String conNum;
    private String lecNum;
    private String conName;
    private String description;
    private String videoId;
    private String conPlayTime;
    private String lecName;
    private String thumbUrl;

}
