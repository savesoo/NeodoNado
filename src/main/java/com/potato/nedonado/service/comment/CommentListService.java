package com.potato.nedonado.service.comment;

import com.potato.nedonado.mapper.CommentMapper;
import com.potato.nedonado.model.comment.CommentDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CommentListService {

    @Autowired(required = false)
    private CommentMapper commentMapper;


}
