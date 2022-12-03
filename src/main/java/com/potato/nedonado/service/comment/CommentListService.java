package com.potato.nedonado.service.comment;

import com.potato.nedonado.mapper.CommentMapper;
import com.potato.nedonado.model.comment.CommentDTO;
import com.potato.nedonado.model.comment.CommentViewInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CommentListService {

    @Autowired(required = false)
    private CommentMapper commentMapper;

    public List<CommentDTO> selectAllComments(long boardIdx){
        return commentMapper.selectCommentByBoardIdx(boardIdx);
    }

    public List<CommentViewInfo> selectBoardComment(long boardIdx, long lastIdx){
        List<CommentDTO> entitys = commentMapper.selectCommentByLastCommentIdx(boardIdx, lastIdx);
        List<CommentViewInfo> list = new ArrayList<>();

        for(CommentDTO comment : entitys) {
            list.add(comment.toCommentView());
        }
        return list;
    }

    public List<CommentViewInfo> selectBoardCommentLimit(long boardIdx, long lastIdx){
        List<CommentDTO> entitys = commentMapper.selectCommentByLastCommentIdxLimit(boardIdx, lastIdx);
        List<CommentViewInfo> list = new ArrayList<>();

        for(CommentDTO comment : entitys) {
            list.add(comment.toCommentView());
        }
        return list;
    }

}
