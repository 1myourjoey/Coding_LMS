package com.ks.youtube.entity;

import lombok.*;


import java.time.LocalDate;
import java.util.Date;


@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class lecture_info {
    private String lecNum;
    private String lecStartDate;
    private String lecEndDate;
    private String lecName;
    private String lecEx;
}
