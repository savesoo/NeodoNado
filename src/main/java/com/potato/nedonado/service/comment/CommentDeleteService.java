package com.potato.nedonado.service.comment;

import com.potato.nedonado.mapper.CommentMapper;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Log4j2
@Service
public class CommentDeleteService {
    @Autowired(required = false)
    CommentMapper commentMapper;

    public int deleteComment(long commentIdx, long userIdx) {
        return commentMapper.deleteComment(commentIdx, userIdx);
    }
}
