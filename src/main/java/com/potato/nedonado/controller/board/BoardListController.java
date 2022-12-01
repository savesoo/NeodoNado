package com.potato.nedonado.controller.board;

import com.potato.nedonado.service.board.BoardListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board/api/v1")
public class BoardListController {
    @Autowired
    BoardListService service;

    @GetMapping
    public String getBoardList(
    ){
        return "/board/saleList";
    }
}
