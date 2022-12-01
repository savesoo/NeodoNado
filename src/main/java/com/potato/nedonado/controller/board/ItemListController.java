package com.potato.nedonado.controller.board;

import com.potato.nedonado.service.board.ItemListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/list")
public class ItemListController {
    @Autowired
    ItemListService service;

    @GetMapping
    public String getBoardList(
    ){
        service.selectBoardList(1);
        return "/board/listitem";
    }
}
