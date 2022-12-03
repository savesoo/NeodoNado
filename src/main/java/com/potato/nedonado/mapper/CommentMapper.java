package com.potato.nedonado.mapper;

import com.potato.nedonado.model.comment.CommentDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentMapper {
    List<CommentDTO> selectCommentByBoardIdx(long boardIdx);

    int insertComment(CommentDTO commentDTO);

    List<CommentDTO> selectCommentByLastCommentIdxLimit(long boardIdx, long lastIdx);
    List<CommentDTO> selectCommentByLastCommentIdx(long boardIdx, long lastIdx);
    int deleteComment(long commentIdx, long userIdx);

}
