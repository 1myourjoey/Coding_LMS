package com.sky.dto;

import lombok.Data;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Data
@RequiredArgsConstructor
@Getter
@Setter
public class Lecture_Info {
    private String lecNum;
    private String lecStartDate;
    private String lecEndDate;
    private String lecName;
    private String lecEx;
    public String getLecName() {
        return lecName;
    }

    public void setLecName(String lecName) {
        this.lecName = lecName;
    }

    public String getLecEx() {
        // 여기에서 적절한 로직을 추가하여 lecEx 값을 반환
        return lecEx;
    }

    public void setLecEx(String lecEx) {
        this.lecEx = lecEx;
    }

    public String getLecStartDate() {
        // 여기에서 적절한 로직을 추가하여 lecStartDate 값을 반환
        return lecStartDate;
    }

    public void setLecStartDate(String lecStartDate) {
        this.lecStartDate = lecStartDate;
    }

    public String getLecEndDate() {
        // 여기에서 적절한 로직을 추가하여 lecEndDate 값을 반환
        return lecEndDate;
    }

    public void setLecEndDate(String lecEndDate) {
        this.lecEndDate = lecEndDate;
    }
}
