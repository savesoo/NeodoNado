package com.potato.nedonado.service.comment;

import com.potato.nedonado.mapper.CommentMapper;
import com.potato.nedonado.model.board.ItemEntity;
import com.potato.nedonado.model.comment.CommentDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentWriteService {

    @Autowired(required = false)
    private CommentMapper commentMapper;

    public List<CommentDTO> selectAllComments(int boardIdx){

        ItemEntity item = ItemEntity.builder().boardIdx(boardIdx).build();

        return commentMapper.selectAllComments(boardIdx);
    }


}
