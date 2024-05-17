package com.yong.lmstest.model;

import lombok.*;

import java.sql.Time;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ChapterDto {
    private int serealNum;
    private String conNum;
    private String chapName;
    private Time chapStartTime;
}
