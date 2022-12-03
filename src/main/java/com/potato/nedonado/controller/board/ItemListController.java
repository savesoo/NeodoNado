package com.potato.nedonado.controller.board;

import com.potato.nedonado.service.board.ItemListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/board/list")
public class ItemListController {
    @Autowired
    ItemListService service;

    @GetMapping
    public ModelAndView getBoardList(
    ){
        ModelAndView mav = new ModelAndView();
        mav.addObject("itemList", service.selectBoardList(0));
        mav.setViewName("/board/listitem");
        return mav;
    }
}
