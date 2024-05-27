package com.sky.lms_web_service.dto;


import lombok.*;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class Pagination {
    
    private String display;
    private int pageNo;
    private boolean curPage;


}
