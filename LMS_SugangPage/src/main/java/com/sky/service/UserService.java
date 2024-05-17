package com.sky.service;


import com.sky.dto.User;

import com.sky.mapper.UserMapper;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserService {


    private final UserMapper userMapper;

    public int getUserCount() {
        return userMapper.selectCount();
    }

    public List<User> getAllUser() {
        return userMapper.selectUserList();
    }

    public void insertUser(User user) {
        userMapper.insertUser(user);
    }

    public void updateUser(User user) {
        userMapper.updateUser(user);
    }

    public void deleteUser(String loginId) {
        userMapper.deleteUser(loginId);
    }

    public User getUserById(String loginId) {
        return userMapper.getUserById(loginId); // 실제 회원 정보를 반환하도록 수정
    }
    public User getUserByUserNo(Integer userNo) {
        return userMapper.getUserByUserNo(userNo);}

    public boolean isUserIdExist(String loginId) {
        User existingMember = userMapper.getUserById(loginId);
        return existingMember != null;
    }

}
