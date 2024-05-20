package com.ks.lms_web_service.service;


import com.sky.dto.PostDto;
import com.sky.mapper.PostMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostService {
    @Autowired
    PostMapper postMapper;

    public List<PostDto>postilsts() {
        return postMapper.polist();
    }

    public List<PostDto> getPostByNum(int postNum) {
        return postMapper.getPostByNum(postNum);
    }


    public void updatePost(PostDto post) {
        postMapper.updatePost(post);
    }

    public void deletePost(int postNum) {
        postMapper.deletePost(postNum);
    }



    public void uphit(int postNum) {
        postMapper.increaseHitCount(postNum);
    }



    public void insertPost(PostDto postDto) {
        postMapper.insertPost(postDto);
    }





}