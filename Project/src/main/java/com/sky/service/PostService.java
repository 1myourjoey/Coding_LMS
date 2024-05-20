<<<<<<<< HEAD:lms_web_service/src/main/java/com/sky/lms_web_service/service/PostService.java
package com.sky.lms_web_service.service;
========
package com.sky.service;
>>>>>>>> main:project/src/main/java/com/sky/service/PostService.java

import com.sky.lms_web_service.dto.Post;
import com.sky.lms_web_service.mapper.PostMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostService {
    @Autowired
    PostMapper postMapper;

    public List<Post>postilsts() {
        return postMapper.polist();
    }

    public List<Post> getPostByNum(int postNum) {
        return postMapper.getPostByNum(postNum);
    }

    public void updatePost(Post post) {
        postMapper.updatePost(post);
    }

    public void deletePost(int postNum) {
        postMapper.deletePost(postNum);
    }

    public void uphit(int postNum) {
        postMapper.increaseHitCount(postNum);
    }

    public void insertPost(Post post) {
        postMapper.insertPost(post);
    }





}