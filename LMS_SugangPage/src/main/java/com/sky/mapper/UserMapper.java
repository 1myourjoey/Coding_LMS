package com.sky.mapper;


import com.sky.dto.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {
    List<User> selectUserList();
    
    int selectCount();
    
    void insertUser(User user);

    void updateUser(User user);

    void deleteUser(String loginId);
    
    User getUserById(String loginId); // 반환 형식을 MemberDto로 변경

    User getUserByUserNo(Integer userNo);
}
