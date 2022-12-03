package com.potato.nedonado.service.comment;

import com.potato.nedonado.mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentWriteService {

    @Autowired(required = false)
    private CommentMapper commentMapper;


}
