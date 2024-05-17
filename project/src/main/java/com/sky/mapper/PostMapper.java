package com.sky.mapper;


import com.sky.dto.PostDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PostMapper {
    List<PostDto>polist();

    List<PostDto> getPostByNum(int postNum);

    void updatePost(PostDto post);

    void deletePost(int postNum);

    void increaseHitCount(int hitCnt);







    void insertPost(PostDto postDto);
}
