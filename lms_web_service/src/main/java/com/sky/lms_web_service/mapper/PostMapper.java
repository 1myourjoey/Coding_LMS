package com.sky.lms_web_service.mapper;


import com.sky.lms_web_service.dto.Post;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PostMapper {
    List<Post>polist();

    List<Post> getPostByNum(int postNum);

    void updatePost(Post post);

    void deletePost(int postNum);

    void increaseHitCount(int hitCnt);

    void insertPost(Post Post);


    List<Post> findPaginated(int offset,int itemsPerPage);

    int countTotalPosts();

    //검색기능


}
