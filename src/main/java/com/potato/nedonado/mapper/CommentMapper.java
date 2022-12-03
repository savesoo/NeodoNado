package com.potato.nedonado.mapper;

import com.potato.nedonado.model.comment.CommentDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentMapper {

    // 게시글에 달린 전체 코멘트 불러오기
    List<CommentDTO> selectAllComments(int boardIdx);

    // 댓글 작성
    


}
