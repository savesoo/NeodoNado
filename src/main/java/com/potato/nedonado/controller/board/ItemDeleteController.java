package com.potato.nedonado.controller.board;

import com.potato.nedonado.model.user.LoginInfo;
import com.potato.nedonado.service.board.ItemDeleteService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Log4j2
@RestController
@RequestMapping("/board/delete")
public class ItemDeleteController {

    @Autowired
    ItemDeleteService service;

    @GetMapping("/{idx}")
    public ResponseEntity<String> deleteItem(
            @PathVariable("idx") long boardIdx,
            HttpServletRequest request,
            HttpServletResponse response
    ){
        LoginInfo loginInfo = (LoginInfo) request.getSession().getAttribute("loginInfo");
        if(loginInfo == null) {
            return new ResponseEntity<>("/user/login", new HttpHeaders(), HttpStatus.BAD_REQUEST);
        }

        int result = service.deleteItemByBoardIdx(boardIdx, loginInfo.getUserIdx());
        String body = "";
        if(result > 0)
            body = "/board/list";

        return new ResponseEntity<>(body, new HttpHeaders(), HttpStatus.OK);
    }
}
