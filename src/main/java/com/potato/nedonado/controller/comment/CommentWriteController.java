package com.potato.nedonado.controller.comment;

import com.potato.nedonado.mapper.CommentMapper;
import com.potato.nedonado.model.comment.CommentDTO;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@Log4j2
@RestController
@RequestMapping("/comment")
public class CommentWriteController {

   @GetMapping
   public List<CommentDTO> getCommentList(){
       List<CommentDTO> clist = new ArrayList<>();
       return clist;
   }


   @PostMapping("/write")
    public ResponseEntity<List<CommentDTO>> writeComment(){
       return null;
   }
}
