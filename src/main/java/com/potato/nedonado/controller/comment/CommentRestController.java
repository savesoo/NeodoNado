package com.potato.nedonado.controller.comment;

import com.potato.nedonado.model.comment.CommentDTO;
import com.potato.nedonado.model.comment.CommentViewInfo;
import com.potato.nedonado.model.user.LoginInfo;
import com.potato.nedonado.service.comment.CommentDeleteService;
import com.potato.nedonado.service.comment.CommentListService;
import com.potato.nedonado.service.comment.CommentWriteService;
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
@RequestMapping("/comment")
public class CommentRestController {
    @Autowired
    CommentWriteService commentWriteService;
    @Autowired
    CommentListService commentListService;
    @Autowired
    CommentDeleteService commentDeleteService;

    @GetMapping("/{boardIdx}/{lastCommentIdx}")
    public ResponseEntity<List<CommentViewInfo>> writeComment(
            @PathVariable("boardIdx") long boardIdx,
            @PathVariable("lastCommentIdx") long lastCommentIdx
    ){
        log.info(lastCommentIdx);
        HttpHeaders httpHeaders = new HttpHeaders();

        return new ResponseEntity<>(commentListService.selectBoardCommentLimit(boardIdx, lastCommentIdx), httpHeaders, HttpStatus.OK);
    }

    @PostMapping("/{lastCommentIdx}")
    public ResponseEntity<List<CommentViewInfo>> writeComment(
            HttpServletRequest request,
            @RequestBody CommentDTO commentDTO,
            @PathVariable("lastCommentIdx") long lastCommentIdx
    ){
        log.info(commentDTO);
        log.info(lastCommentIdx);

        HttpHeaders httpHeaders = new HttpHeaders();

        if((commentDTO.getContent() == null  || commentDTO.getContent().isEmpty())) {
            return new ResponseEntity<>(null, httpHeaders, HttpStatus.BAD_REQUEST);
        }

        LoginInfo loginInfo = (LoginInfo) request.getSession().getAttribute("loginInfo");
        if(loginInfo == null) {
            return new ResponseEntity<>(null, httpHeaders, HttpStatus.BAD_REQUEST);
        }

        log.info(loginInfo);

        commentDTO.setUserIdx(loginInfo.getUserIdx());
        commentDTO.setNickname(loginInfo.getNickname());
        commentDTO.setWriteDate(Util.getCurrentTimestamp());

        log.info(commentDTO);
        List<CommentViewInfo> list = null;
        try {
            int result = commentWriteService.writeComment(commentDTO);
            log.info(result);
            list = commentListService.selectBoardComment(commentDTO.getBoardIdx(), lastCommentIdx);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ResponseEntity<>(list, httpHeaders, HttpStatus.OK);
    }

    @DeleteMapping("/{commentIdx}")
    public int deleteComment(
            HttpServletRequest request,
            @PathVariable("commentIdx") long commentIdx
    ) {
        LoginInfo loginInfo = (LoginInfo) request.getSession().getAttribute("loginInfo");
        if(loginInfo == null) return 0;

        return commentDeleteService.deleteComment(commentIdx, loginInfo.getUserIdx());
    }

}
