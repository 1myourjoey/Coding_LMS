package com.sky.lms_web_service.dto;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Section_Progress {
    String conNum;  //콘텐츠번호
    String lecNum;  //강좌번호
    int userNo;     //로그인 한 사용자의 번호
    String learningTime;    //마지막으로 시청한 영상 시간
    String maxS;    //동영상 전체 시간
}
