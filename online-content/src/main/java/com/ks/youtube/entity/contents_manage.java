package com.ks.youtube.entity;


import lombok.*;





@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class contents_manage {
    String conName;
    String conNum;
    String lecNum;
    String conPlayTime;
    String durationTime;
    String description;
    String lecName;
    String thumbUrl;
    String videoId;

}
