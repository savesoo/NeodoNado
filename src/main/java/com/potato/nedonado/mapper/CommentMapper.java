package com.potato.nedonado.mapper;

import com.potato.nedonado.model.comment.CommentDTO;
import com.potato.nedonado.model.comment.CommentViewInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentMapper {
    List<CommentDTO> selectCommentByBoardIdx(long boardIdx);

    int insertComment(CommentDTO commentDTO);

    List<CommentDTO> selectCommentByLastCommentIdxLimit(long boardIdx, long lastIdx);
    List<CommentDTO> selectCommentByLastCommentIdx(long boardIdx, long lastIdx);
    int deleteComment(long commentIdx, long userIdx);
    int deleteCommentByBoardIdx(long boardIdx);

    // 작성한 코멘트 List 보기
    List<CommentDTO> selectCommentByUserIdx(long userIdx);

}
