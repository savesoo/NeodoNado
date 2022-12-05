package com.potato.nedonado.service.comment;

import com.potato.nedonado.mapper.CommentMapper;
import com.potato.nedonado.model.comment.CommentDTO;
import com.potato.nedonado.model.comment.CommentViewInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserCommentListService {

    @Autowired(required = false)
    private CommentMapper commentMapper;

    public List<CommentViewInfo> selectCommentByUserIdx(long userIdx){

        List<CommentViewInfo> list = new ArrayList<CommentViewInfo>();
        List<CommentDTO> mycomments = commentMapper.selectCommentByUserIdx(userIdx);

        for(CommentDTO comment : mycomments){
            list.add(comment.toCommentView());
        }

        return list;
    }
}

