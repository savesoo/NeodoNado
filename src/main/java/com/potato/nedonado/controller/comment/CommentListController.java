package com.potato.nedonado.controller.comment;

import com.potato.nedonado.model.comment.CommentDTO;
import com.potato.nedonado.model.comment.CommentViewInfo;
import com.potato.nedonado.model.user.LoginInfo;
import com.potato.nedonado.service.comment.CommentListService;
import com.potato.nedonado.util.Util;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Log4j2
@RestController
@RequestMapping("/comment/list")
public class CommentListController {
    @Autowired
    CommentListService service;

    @GetMapping("/{boardIdx}/{lastCommentIdx}")
    public ResponseEntity<List<CommentViewInfo>> writeComment(
            @PathVariable("boardIdx") long boardIdx,
            @PathVariable("lastCommentIdx") long lastCommentIdx
    ){
        log.info(lastCommentIdx);
        HttpHeaders httpHeaders = new HttpHeaders();

        return new ResponseEntity<>(service.selectBoardCommentLimit(boardIdx, lastCommentIdx), httpHeaders, HttpStatus.OK);
    }
}
